uint64_t eUICC::eUICCVinylMAVValve::eUICCVinylMAVValve(uint64_t this, void *a2, int a3, char a4)
{
  *(unsigned char *)(this + 288) = 0;
  *(void *)this = &unk_270EB4A00;
  *(void *)(this + 296) = a2;
  *(_DWORD *)(this + 292) = a3;
  *(unsigned char *)(this + 289) = a4;
  *(unsigned char *)(this + 304) = 15;
  return this;
}

void *eUICC::eUICCVinylMAVValve::GetVinylType@<X0>(eUICC::eUICCVinylMAVValve *this@<X0>, void *a2@<X8>)
{
  int v4 = eUICC::GetVinylType::Perform();
  __int16 v6 = v5;
  int v7 = v4;
  gBBULogMaskGet();
  if (v7 || v6 != 1)
  {
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "error %d status 0x%hhx\n", v8, v9, v10, v7);
  }
  else
  {
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "status 0x%hhx cards_type: %hhu \n", v8, v9, v10, v6);
    *((_DWORD *)this + 2) = v6;
    *((unsigned char *)this + 285) = HIBYTE(v6);
    *((unsigned char *)this + 287) = HIBYTE(v6) == 3;
  }
  return memcpy(a2, (char *)this + 8, 0x119uLL);
}

void *eUICC::eUICCVinylMAVValve::GetData@<X0>(eUICC::eUICCVinylMAVValve *this@<X0>, void *a2@<X8>)
{
  if (*((void *)this + 37))
  {
    if (*((unsigned char *)this + 288))
    {
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "eUICCVinylData cache is valid. Using cached data!\n", v4, v5, v6, v17);
LABEL_6:
      eUICC::logEUICCData((int *)this + 2);
      return memcpy(a2, (char *)this + 8, 0x119uLL);
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
    *(_OWORD *)((char *)this + 8) = 0u;
    *(_OWORD *)((char *)this + 273) = 0u;
    eUICC::GetData::Perform();
    *((_DWORD *)this + 2) = v19;
    *(_WORD *)((char *)this + 13) = bswap32(v21) >> 16;
    *(_OWORD *)((char *)this + 15) = v22;
    *((unsigned char *)this + 31) = v23;
    *((_OWORD *)this + 2) = v24;
    *((_OWORD *)this + 3) = v25;
    *((_OWORD *)this + 4) = v26;
    *((_OWORD *)this + 5) = v27;
    *(_DWORD *)((char *)this + 143) = *(_DWORD *)&v30[15];
    *((_OWORD *)this + 7) = v29;
    *((_OWORD *)this + 8) = *(_OWORD *)v30;
    *((_OWORD *)this + 6) = v28;
    *(_DWORD *)((char *)this + 218) = *(_DWORD *)&v34[15];
    *(_OWORD *)((char *)this + 203) = *(_OWORD *)v34;
    *(_OWORD *)((char *)this + 187) = v33;
    *(_OWORD *)((char *)this + 171) = v32;
    *(_OWORD *)((char *)this + 155) = v31;
    *((_WORD *)this + 115) = v35;
    *((unsigned char *)this + 250) = v37;
    *((_WORD *)this + 124) = v36;
    *(_OWORD *)((char *)this + 267) = v39;
    *(_OWORD *)((char *)this + 251) = v38;
    *((unsigned char *)this + 12) = v20;
    *(_WORD *)((char *)this + 283) = v40;
    *((unsigned char *)this + 286) = v19 == 4;
    if (*((_DWORD *)this + 2) == ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
    {
      *((unsigned char *)this + 288) = 1;
      goto LABEL_6;
    }
    gBBULogMaskGet();
    v11 = "error %d status %u sw1_sw2 0x%x\n";
    char v17 = v18;
    int v12 = 22;
    uint64_t v13 = 0xFFFFFFFFLL;
LABEL_9:
    _BBULog(v12, v13, "eUICCVinylMAVValve", "", v11, v8, v9, v10, v17);
    return memcpy(a2, (char *)this + 8, 0x119uLL);
  }
  if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
    _BBULog(1, 6, "eUICCVinylMAVValve", "", "check failed: %s, %d, assertion: %s\n", v14, v15, v16, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/CommandDrivers/eUICCVinylMAVValve.cpp");
  }
  if ((*(unsigned char *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1)
  {
    v11 = "No transport available.. bail out\n";
    int v12 = 0;
    uint64_t v13 = 1;
    goto LABEL_9;
  }
  return memcpy(a2, (char *)this + 8, 0x119uLL);
}

uint64_t eUICC::eUICCVinylMAVValve::SetCardMode(uint64_t a1, int a2, char a3)
{
  __src[36] = *MEMORY[0x263EF8340];
  uint64_t v6 = (_DWORD *)(a1 + 8);
  (*(void (**)(void *__return_ptr))(*(void *)a1 + 8))(__src);
  memcpy(v6, __src, 0x119uLL);
  if (a3) {
    goto LABEL_5;
  }
  if (*v6 != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)"outData.Valid()");
    return 18;
  }
  if (*(unsigned __int8 *)(a1 + 31) != a2)
  {
LABEL_5:
    int v10 = *(_DWORD *)(a1 + 292);
    __src[0] = *(void *)(a1 + 296);
    LOBYTE(__src[1]) = v10;
    BYTE1(__src[1]) = a2;
    WORD1(__src[1]) = 1;
    HIDWORD(__src[1]) = 10000;
    int v12 = eUICC::SwitchMode::Perform();
    if (!v12 && (v11 & 0xFF00000000) == 0x100000000 && a2 == BYTE5(v11)) {
      return 0;
    }
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "SwitchCardMode: Failed err %d status %hhu mode %d sw1 0x%x sw2 0x%x\n", v13, v14, v15, v12);
    return 18;
  }
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "SwitchCardMode: Baseband already in mode %hhu\n", v7, v8, v9, a2);
  return 0;
}

uint64_t eUICC::eUICCVinylMAVValve::DeleteProfile(eUICC::eUICCVinylMAVValve *this)
{
  if (*((void *)this + 37))
  {
    int v2 = eUICC::DeleteProfile::Perform();
    if (v2 || (uint64_t result = 0, v1 != 1))
    {
      gBBULogMaskGet();
      uint64_t v7 = "DeleteProfile failed, error %d status %hhu sw1 0x%x sw2 0x%x\n";
      char v14 = v2;
      int v8 = 22;
      uint64_t v9 = 0xFFFFFFFFLL;
LABEL_5:
      _BBULog(v8, v9, "eUICCVinylMAVValve", "", v7, v4, v5, v6, v14);
      return 18;
    }
  }
  else
  {
    if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
      _BBULog(1, 6, "eUICCVinylMAVValve", "", "check failed: %s, %d, assertion: %s\n", v10, v11, v12, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/CommandDrivers/eUICCVinylMAVValve.cpp");
    }
    uint64_t v13 = (unsigned char *)gBBULogMaskGet();
    uint64_t result = 18;
    if ((*v13 & 1) != 0 && gBBULogVerbosity >= 1)
    {
      uint64_t v7 = "No transport available, bail out..\n";
      int v8 = 0;
      uint64_t v9 = 1;
      goto LABEL_5;
    }
  }
  return result;
}

uint64_t eUICC::eUICCVinylMAVValve::StoreData()
{
  MEMORY[0x270FA5388]();
  char v1 = v0;
  v3 = v2;
  uint64_t v16 = *MEMORY[0x263EF8340];
  eUICC::StoreData::Perform();
  if (v11 || v12 != 1)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v5, v6, v7, (char)"rsp.Valid()");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to StoreData status %hhu SW1 0x%x SW2 0x%x\n", v8, v9, v10, v12);
    uint64_t result = 18;
  }
  else
  {
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v3, v15, &v15[v14], v14);
    uint64_t result = 0;
  }
  *char v1 = bswap32(v13) >> 16;
  return result;
}

uint64_t eUICC::eUICCVinylMAVValve::ValidatePerso(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  memset(v24, 0, 28);
  long long __dst = 0u;
  long long v22 = 0u;
  DWORD1(v24[1]) = 30000;
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
  uint64_t v25 = v4;
  char v26 = v5;
  char v27 = 0;
  __int16 v28 = v9;
  long long v30 = v22;
  long long v31 = v23;
  *(_OWORD *)long long v32 = v24[0];
  *(_OWORD *)&v32[12] = *(_OWORD *)((char *)v24 + 12);
  long long v29 = __dst;
  eUICC::ValidatePerso::Perform();
  if ((void)__dst)
  {
    if (!*(_DWORD *)__dst && *(unsigned char *)(__dst + 8) == 1 && *(_WORD *)(__dst + 11))
    {
      std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a3, (char *)(__dst + 13), (char *)(__dst + 13 + *(unsigned __int16 *)(__dst + 11)), *(unsigned __int16 *)(__dst + 11));
      uint64_t v10 = 0;
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)"rsp->Valid() && rsp->contents.rsp_len");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to AuthenticatePersoDevice status %hhu SW1 0x%x SW2 0x%x rsp_len %u\n", v14, v15, v16, *(unsigned char *)(__dst + 8));
      uint64_t v10 = 18;
    }
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v17, v18, v19, (char)"rsp");
    uint64_t v10 = 11;
  }
  if (*((void *)&__dst + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&__dst + 1));
  }
  return v10;
}

void sub_26386ADE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
}

void eUICC::eUICCVinylMAVValve::~eUICCVinylMAVValve(eUICC::eUICCVinylMAVValve *this)
{
  VinylCommunication::~VinylCommunication(this);

  operator delete(v1);
}

void *std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(void *result, char *__src, char *a3, unint64_t a4)
{
  uint64_t v7 = result;
  unint64_t v8 = result[2];
  size_t v9 = (char *)*result;
  if (v8 - *result < a4)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      unint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = 2 * v8;
    if (2 * v8 <= a4) {
      uint64_t v10 = a4;
    }
    if (v8 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v11 = v10;
    }
    uint64_t result = std::vector<unsigned char>::__vallocate[abi:ne180100](v7, v11);
    size_t v9 = (char *)v7[1];
    goto LABEL_17;
  }
  uint64_t v12 = (unsigned char *)result[1];
  size_t v13 = v12 - v9;
  if (v12 - v9 >= a4)
  {
LABEL_17:
    size_t v16 = a3 - __src;
    if (v16) {
      uint64_t result = memmove(v9, __src, v16);
    }
    uint64_t v15 = &v9[v16];
    goto LABEL_20;
  }
  uint64_t v14 = &__src[v13];
  if (v12 != v9)
  {
    uint64_t result = memmove((void *)*result, __src, v13);
    size_t v9 = (char *)v7[1];
  }
  if (a3 != v14) {
    uint64_t result = memmove(v9, v14, a3 - v14);
  }
  uint64_t v15 = &v9[a3 - v14];
LABEL_20:
  v7[1] = v15;
  return result;
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2655D7638, MEMORY[0x263F8C060]);
}

void sub_26386AFE4(_Unwind_Exception *a1)
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

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t VinylController::create(uint64_t a1, int a2)
{
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "entering VinylController::create\n", v4, v5, v6, v19);
  uint64_t v14 = (VinylController *)VinylController::instance;
  if (!a2 || VinylController::instance)
  {
    if (VinylController::instance) {
      goto LABEL_7;
    }
    uint64_t v14 = (VinylController *)operator new(0x88uLL);
    VinylController::VinylController(v14);
  }
  else
  {
    uint64_t v14 = (VinylController *)operator new(0x88uLL);
    VinylController::VinylController((uint64_t)v14, 0, a1);
  }
  VinylController::instance = (uint64_t)v14;
LABEL_7:
  if (!*((void *)v14 + 2))
  {
    VinylControllerObjDestroy((uint64_t)v14, v7, v8, v9, v10, v11, v12, v13, v20);
    VinylController::instance = 0;
  }
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "returning VinylController::create\n", v15, v16, v17, v20);
  return VinylController::instance;
}

void sub_26386B178(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t VinylControllerObjDestroy(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (result)
  {
    (*(void (**)(uint64_t))(*(void *)result + 8))(result);
    VinylController::instance = 0;
    gBBULogMaskGet();
    return _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "Cleaning up VinylController object \n", v9, v10, v11, a9);
  }
  return result;
}

uint64_t VinylController::VinylController(uint64_t a1, int a2, uint64_t a3)
{
  *(void *)a1 = &unk_270EB4A78;
  *(void *)(a1 + 8) = 0;
  uint64_t v5 = (VinylSecureElement *)VinylCommunication::create(a2, 0);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 120) = VinylSecureElement::create(v5);
  *(void *)(a1 + 128) = 0;
  uint64_t v6 = (_OWORD *)(a1 + 32);
  if (a3)
  {
    long long v7 = *(_OWORD *)(a3 + 16);
    *uint64_t v6 = *(_OWORD *)a3;
    *(_OWORD *)(a1 + 48) = v7;
    long long v8 = *(_OWORD *)(a3 + 32);
    long long v9 = *(_OWORD *)(a3 + 48);
    long long v10 = *(_OWORD *)(a3 + 64);
    *(void *)(a1 + 112) = *(void *)(a3 + 80);
    *(_OWORD *)(a1 + 80) = v9;
    *(_OWORD *)(a1 + 96) = v10;
    *(_OWORD *)(a1 + 64) = v8;
    char v11 = 1;
  }
  else
  {
    char v11 = 0;
    *(void *)(a1 + 112) = 0;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *uint64_t v6 = 0u;
  }
  *(unsigned char *)(a1 + 24) = v11;
  return a1;
}

void sub_26386B2CC(_Unwind_Exception *a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  *(void *)(v1 + 16) = 0;
  if (v4) {
    VinylController::VinylController(v4);
  }
  ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef(v2);
  _Unwind_Resume(a1);
}

void VinylController::VinylController(VinylController *this)
{
  *(void *)this = &unk_270EB4A78;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = VinylCommunication::create(0, 0);
  *((unsigned char *)this + 24) = 0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((void *)this + 16) = 0;
}

void sub_26386B368(_Unwind_Exception *a1)
{
  ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef(v1);
  _Unwind_Resume(a1);
}

uint64_t VinylController::performNonUpdateOperation(uint64_t a1, int a2, __CFDictionary **a3, void *a4)
{
  uint64_t v145 = *MEMORY[0x263EF8340];
  v141 = 0;
  pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  long long v8 = (BBUCapabilities *)xmmword_26A9A0D30;
  if (!(void)xmmword_26A9A0D30)
  {
    BBUCapabilities::create_default_global(__p);
    long long v9 = *(_OWORD *)__p;
    __p[0] = 0;
    __p[1] = 0;
    long long v10 = (std::__shared_weak_count *)*((void *)&xmmword_26A9A0D30 + 1);
    xmmword_26A9A0D30 = v9;
    if (v10)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
      if (__p[1]) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
      }
    }
    long long v8 = (BBUCapabilities *)xmmword_26A9A0D30;
  }
  char v11 = (std::__shared_weak_count *)*((void *)&xmmword_26A9A0D30 + 1);
  if (*((void *)&xmmword_26A9A0D30 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_26A9A0D30 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  unsigned __int8 v12 = BBUCapabilities::supportsVinylRestore(v8);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if ((v12 & 1) == 0)
  {
    uint64_t TransportNoEvents = 0;
    goto LABEL_89;
  }
  if (a4)
  {
    __p[0] = a4;
    ctu::cf::CFSharedRef<__CFDictionary const>::reset((const void **)(a1 + 128), (CFTypeRef *)__p);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(&v130, (const void **)(a1 + 128));
  Options::Options(&v131, &v130);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v130);
  gBBULogMaskGet();
  Options::ToString((uint64_t *)__p, (Options *)&v131);
  if (v143 >= 0) {
    uint64_t v16 = __p;
  }
  else {
    LOBYTE(v16) = __p[0];
  }
  uint64_t v17 = _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "VinylRestore Options:\n%s\n", v13, v14, v15, (char)v16);
  if (v143 < 0) {
    operator delete(__p[0]);
  }
  if (VinylController::operationRequested(v17, a2, (uint64_t)&v131))
  {
    uint64_t TransportNoEvents = VinylController::createTransportNoEvents((VinylController *)a1);
    if (TransportNoEvents)
    {
      if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
        _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v96, v97, v98, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
      }
      if ((*(unsigned char *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1) {
        _BBULog(0, 1, "VinylController", "", "Fail to create transport: %d\n", v99, v100, v101, TransportNoEvents);
      }
      goto LABEL_81;
    }
    eUICC::VinylFactory::GetValve((eUICC::VinylFactory *)(a1 + 32), (void *)v131, 0, (eUICC::eUICCVinylICEValve **)__p);
    char v19 = v141;
    char v20 = (char *)__p[0];
    v141 = (char *)__p[0];
    __p[0] = 0;
    if (v19)
    {
      (*(void (**)(char *))(*(void *)v19 + 56))(v19);
      unsigned __int16 v21 = __p[0];
      __p[0] = 0;
      if (v21) {
        (*(void (**)(void *))(*(void *)v21 + 56))(v21);
      }
      char v20 = v141;
    }
    if (!v20)
    {
      if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
        _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v102, v103, v104, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
      }
      uint64_t TransportNoEvents = 18;
      if ((*(unsigned char *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1)
      {
        _BBULog(0, 1, "VinylController", "", "Fail to get valve\n", v105, v106, v107, v127);
        uint64_t TransportNoEvents = 18;
      }
      goto LABEL_81;
    }
    pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
    long long v22 = (BBUCapabilities *)xmmword_26A9A0D30;
    if (!(void)xmmword_26A9A0D30)
    {
      BBUCapabilities::create_default_global(__p);
      long long v23 = *(_OWORD *)__p;
      __p[0] = 0;
      __p[1] = 0;
      long long v24 = (std::__shared_weak_count *)*((void *)&xmmword_26A9A0D30 + 1);
      xmmword_26A9A0D30 = v23;
      if (v24)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v24);
        if (__p[1]) {
          std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
        }
      }
      long long v22 = (BBUCapabilities *)xmmword_26A9A0D30;
    }
    uint64_t v25 = (std::__shared_weak_count *)*((void *)&xmmword_26A9A0D30 + 1);
    if (*((void *)&xmmword_26A9A0D30 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_26A9A0D30 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
    char v26 = BBUCapabilities::supportsEuiccViaEOS(v22);
    if (v25) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v25);
    }
    if ((v26 & 1) == 0)
    {
      __int16 v28 = 0;
      long long v31 = v141;
LABEL_43:
      (*(void (**)(void **__return_ptr))(*(void *)v31 + 8))(__p);
      int v35 = (int)__p[0];
      int v36 = BYTE4(__p[0]);
      int v37 = v144;
      if (v35 == ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
      {
        if (v37 != 82) {
          goto LABEL_138;
        }
        if (!v36) {
          goto LABEL_138;
        }
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "resetting refurb fw with perso supported in an attempt to clear perso\n", v38, v39, v40, v127);
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)v141 + 16))(v141, 1, 1);
        (*(void (**)(char *, void, uint64_t))(*(void *)v141 + 16))(v141, 0, 1);
        v41 = v141;
        *(_OWORD *)(v141 + 24) = 0u;
        *(_OWORD *)(v41 + 40) = 0u;
        *(_OWORD *)(v41 + 56) = 0u;
        *(_OWORD *)(v41 + 72) = 0u;
        *(_OWORD *)(v41 + 88) = 0u;
        *(_OWORD *)(v41 + 104) = 0u;
        *(_OWORD *)(v41 + 120) = 0u;
        *(_OWORD *)(v41 + 136) = 0u;
        *(_OWORD *)(v41 + 152) = 0u;
        *(_OWORD *)(v41 + 168) = 0u;
        *(_OWORD *)(v41 + 184) = 0u;
        *(_OWORD *)(v41 + 200) = 0u;
        *(_OWORD *)(v41 + 216) = 0u;
        *(_OWORD *)(v41 + 232) = 0u;
        *(_OWORD *)(v41 + 248) = 0u;
        *(_OWORD *)(v41 + 8) = 0u;
        *(_OWORD *)(v41 + 264) = 0u;
        *(_OWORD *)(v41 + 273) = 0u;
        (*(void (**)(void **__return_ptr))(*(void *)v41 + 8))(__p);
        int v42 = (int)__p[0];
        if (v42 != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
        {
          gBBULogMaskGet();
          _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "Condition <<%s>> failed %s %s/%d\n", v53, v54, v55, (char)"outData.Valid()");
          uint64_t TransportNoEvents = 18;
          if ((*(unsigned char *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1)
          {
            _BBULog(0, 1, "VinylController", "", "Fail to get data after resetting refurb\n", v56, v57, v58, v128);
            uint64_t TransportNoEvents = 18;
          }
        }
        else
        {
LABEL_138:
          char v43 = 1;
          switch(a2)
          {
            case 0:
              gBBULogMaskGet();
              _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "In VINYL_OPERATION_GET_EID\n", v44, v45, v46, v127);
              if (a3)
              {
                uint64_t TransportNoEvents = eUICC::getEID();
                if (TransportNoEvents)
                {
                  if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
                    _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v47, v48, v49, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
                  }
                  if ((*(unsigned char *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1) {
                    _BBULog(0, 1, "VinylController", "", "Failed to retrieve EID: %d\n", v50, v51, v52, TransportNoEvents);
                  }
                }
              }
              else
              {
                if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
                  _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v124, v125, v126, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
                }
                uint64_t TransportNoEvents = 0;
                if ((*(unsigned char *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity > 0)
                {
                  v62 = "Client rsp data is not valid\n";
                  uint64_t v63 = 1;
                  goto LABEL_61;
                }
              }
              break;
            case 1:
              gBBULogMaskGet();
              _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "In VINYL_OPERATION_NON_UPDATE\n", v64, v65, v66, v127);
              char v43 = 0;
              goto LABEL_63;
            case 2:
LABEL_63:
              if (v132
                && (gBBULogMaskGet(),
                    v70 = _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "In VINYL_OPERATION_REFURB\n", v67, v68, v69, v127), uint64_t TransportNoEvents = VinylController::Refurb(v70, v132, &v141), TransportNoEvents))
              {
                if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
                  _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v118, v119, v120, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
                }
                if ((*(unsigned char *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1) {
                  _BBULog(0, 1, "VinylController", "", "Failed to Refurb: %d\n", v121, v122, v123, TransportNoEvents);
                }
              }
              else if (v43)
              {
                uint64_t TransportNoEvents = 0;
              }
              else
              {
LABEL_67:
                gBBULogMaskGet();
                _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "In VINYL_OPERATION_BOOTSTRAP_PROVISIONING\n", v71, v72, v73, v127);
                uint64_t TransportNoEvents = VinylController::bootstrapProvisioning(a1, &v141);
                if (TransportNoEvents)
                {
                  if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
                    _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v74, v75, v76, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
                  }
                  if ((*(unsigned char *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1) {
                    _BBULog(0, 1, "VinylController", "", "Failed to complete bootstrap provisioning: %d\n", v77, v78, v79, TransportNoEvents);
                  }
                }
              }
              break;
            case 3:
              goto LABEL_67;
            case 4:
              LOBYTE(__p[0]) = 0;
              gBBULogMaskGet();
              _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "In VINYL_OPERATION_GET_PAIRING_PARAMS\n", v80, v81, v82, v127);
              uint64_t v83 = eUICC::checkEOSDev(__p, (uint64_t)&v141);
              uint64_t TransportNoEvents = v83;
              if (v83 || !LOBYTE(__p[0]))
              {
                if (!v83) {
                  uint64_t TransportNoEvents = VinylController::getPairingParameters(0, (CFDictionaryRef)a4, a3, &v141);
                }
              }
              else
              {
                gBBULogMaskGet();
                _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "EOS - dev product type detected, returning not supported\n", v84, v85, v86, v129);
                uint64_t TransportNoEvents = 9;
              }
              break;
            default:
              gBBULogMaskGet();
              v62 = "Invalid user operation\n";
              goto LABEL_60;
          }
        }
      }
      else
      {
        if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
          _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v108, v109, v110, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
        }
        gBBULogMaskGet();
        v62 = "eUICC not detected, skipping\n";
LABEL_60:
        uint64_t v63 = 0xFFFFFFFFLL;
LABEL_61:
        _BBULog(0, v63, "VinylController", "", v62, v59, v60, v61, v127);
        uint64_t TransportNoEvents = 0;
      }
      if (v28) {
        VinylSecureElement::PowerDownSE(*(VinylSecureElement **)(a1 + 120), v28);
      }
      goto LABEL_81;
    }
    char v27 = *(VinylSecureElement **)(a1 + 120);
    if (!v27)
    {
      if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
        _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v111, v112, v113, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
      }
      uint64_t TransportNoEvents = 0;
      if ((*(unsigned char *)gBBULogMaskGet() & 1) == 0 || gBBULogVerbosity <= 0) {
        goto LABEL_81;
      }
      v95 = "Vinyl Secure Element object not created, cannot power up SE\n";
      uint64_t v114 = 1;
      goto LABEL_123;
    }
    __int16 v28 = (void *)VinylSecureElement::PowerUpSE(v27);
    if (v28)
    {
      (*(void (**)(void **__return_ptr))(*(void *)v141 + 8))(__p);
      int v29 = (int)__p[0];
      int v30 = (TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2;
      long long v31 = v141;
      if (v29 != v30)
      {
        if ((*(unsigned int (**)(char *, void, uint64_t))(*(void *)v141 + 16))(v141, 0, 1))
        {
          gBBULogMaskGet();
          _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "Reset card failed\n", v32, v33, v34, v127);
        }
        long long v31 = v141;
        *(_OWORD *)(v141 + 24) = 0u;
        *(_OWORD *)(v31 + 40) = 0u;
        *(_OWORD *)(v31 + 56) = 0u;
        *(_OWORD *)(v31 + 72) = 0u;
        *(_OWORD *)(v31 + 88) = 0u;
        *(_OWORD *)(v31 + 104) = 0u;
        *(_OWORD *)(v31 + 120) = 0u;
        *(_OWORD *)(v31 + 136) = 0u;
        *(_OWORD *)(v31 + 152) = 0u;
        *(_OWORD *)(v31 + 168) = 0u;
        *(_OWORD *)(v31 + 184) = 0u;
        *(_OWORD *)(v31 + 200) = 0u;
        *(_OWORD *)(v31 + 216) = 0u;
        *(_OWORD *)(v31 + 232) = 0u;
        *(_OWORD *)(v31 + 248) = 0u;
        *(_OWORD *)(v31 + 8) = 0u;
        *(_OWORD *)(v31 + 264) = 0u;
        *(_OWORD *)(v31 + 273) = 0u;
      }
      goto LABEL_43;
    }
    if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v115, v116, v117, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
    }
    gBBULogMaskGet();
    v95 = "Failed to power SE\n";
  }
  else
  {
    if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v89, v90, v91, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
    }
    gBBULogMaskGet();
    v95 = "No operation requested in options\n";
  }
  uint64_t v114 = 0xFFFFFFFFLL;
LABEL_123:
  _BBULog(0, v114, "VinylController", "", v95, v92, v93, v94, v127);
  uint64_t TransportNoEvents = 0;
LABEL_81:
  VinylController::freeTransport((VinylController *)a1);
  if (v140 < 0) {
    operator delete(v139);
  }
  if (v138 < 0) {
    operator delete(v137);
  }
  if (v136 < 0) {
    operator delete(v135);
  }
  if (v134 < 0) {
    operator delete(v133);
  }
LABEL_89:
  v87 = v141;
  v141 = 0;
  if (v87) {
    (*(void (**)(char *))(*(void *)v87 + 56))(v87);
  }
  return TransportNoEvents;
}

void sub_26386C1B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, int a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  Options::~Options(&a15);
  uint64_t v38 = a31;
  a31 = 0;
  if (v38) {
    (*(void (**)(uint64_t))(*(void *)v38 + 56))(v38);
  }
  _Unwind_Resume(a1);
}

const void **ctu::cf::CFSharedRef<__CFDictionary const>::reset(const void **a1, CFTypeRef *a2)
{
  CFTypeRef v3 = *a2;
  if (*a2) {
    CFRetain(*a2);
  }
  uint64_t v4 = *a1;
  *a1 = v3;
  uint64_t v6 = v4;
  return ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v6);
}

uint64_t VinylController::operationRequested(uint64_t a1, int a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 4))
  {
    pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
    uint64_t v5 = (BBUCapabilities *)xmmword_26A9A0D30;
    if (!(void)xmmword_26A9A0D30)
    {
      BBUCapabilities::create_default_global(&v17);
      long long v6 = v17;
      long long v17 = 0uLL;
      long long v7 = (std::__shared_weak_count *)*((void *)&xmmword_26A9A0D30 + 1);
      xmmword_26A9A0D30 = v6;
      if (v7)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v7);
        if (*((void *)&v17 + 1)) {
          std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v17 + 1));
        }
      }
      uint64_t v5 = (BBUCapabilities *)xmmword_26A9A0D30;
    }
    long long v8 = (std::__shared_weak_count *)*((void *)&xmmword_26A9A0D30 + 1);
    if (*((void *)&xmmword_26A9A0D30 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_26A9A0D30 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
    if (BBUCapabilities::supportsEuiccViaEOS(v5))
    {
      uint64_t v9 = 1;
    }
    else
    {
      pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
      long long v10 = (BBUCapabilities *)xmmword_26A9A0D30;
      if (!(void)xmmword_26A9A0D30)
      {
        BBUCapabilities::create_default_global(&v17);
        long long v11 = v17;
        long long v17 = 0uLL;
        unsigned __int8 v12 = (std::__shared_weak_count *)*((void *)&xmmword_26A9A0D30 + 1);
        xmmword_26A9A0D30 = v11;
        if (v12)
        {
          std::__shared_weak_count::__release_shared[abi:ne180100](v12);
          if (*((void *)&v17 + 1)) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v17 + 1));
          }
        }
        long long v10 = (BBUCapabilities *)xmmword_26A9A0D30;
      }
      uint64_t v13 = (std::__shared_weak_count *)*((void *)&xmmword_26A9A0D30 + 1);
      if (*((void *)&xmmword_26A9A0D30 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_26A9A0D30 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
      uint64_t v9 = (uint64_t)BBUCapabilities::supportsVinylUpdate(v10);
      if (v13) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v13);
      }
    }
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v14 = *(unsigned __int8 *)(a3 + 127);
  if ((v14 & 0x80u) != 0) {
    uint64_t v14 = *(void *)(a3 + 112);
  }
  uint64_t v15 = *(unsigned __int8 *)(a3 + 71);
  if ((v15 & 0x80u) != 0) {
    uint64_t v15 = *(void *)(a3 + 56);
  }
  switch(a2)
  {
    case 0:
    case 4:
      uint64_t v9 = 1;
      break;
    case 1:
      if (v15 | v14) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = v9;
      }
      break;
    case 2:
      return v9;
    case 3:
      uint64_t v9 = (v15 | v14) != 0;
      break;
    default:
      uint64_t v9 = 0;
      break;
  }
  return v9;
}

void sub_26386C508(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(a1);
}

uint64_t VinylController::createTransportNoEvents(VinylController *this)
{
  if (!*((void *)this + 2))
  {
    if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v14, v15, v16, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
    }
    uint64_t v13 = 1;
    if ((*(unsigned char *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1) {
      _BBULog(0, 1, "VinylController", "", "fCommunication object not created, cannot create Transport\n", v17, v18, v19, v20);
    }
    return v13;
  }
  if (!*((unsigned char *)this + 24))
  {
    VinylController::freeTransport(this);
    char v7 = 1;
    char v8 = 1;
    do
    {
      char v9 = v7;
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "createTransport attempt %d/%d\n", v10, v11, v12, v8);
      uint64_t v13 = (*(uint64_t (**)(void, char *))(**((void **)this + 2) + 16))(*((void *)this + 2), (char *)this + 32);
      if (!v13) {
        break;
      }
      VinylController::freeTransport(this);
      __ns.__rep_ = 3000000000;
      std::this_thread::sleep_for (&__ns);
      char v7 = 0;
      char v8 = 2;
    }
    while ((v9 & 1) != 0);
    return v13;
  }
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "opening channel on provided external transport\n", v2, v3, v4, v20);
  uint64_t v5 = *(uint64_t (**)(void))(**((void **)this + 2) + 24);

  return v5();
}

uint64_t VinylController::Refurb(uint64_t a1, int a2, void *a3)
{
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "refurbAction: %d\n", v5, v6, v7, a2);
  switch(a2)
  {
    case 1:
      char v8 = *(uint64_t (**)(void))(*(void *)*a3 + 24);
      goto LABEL_5;
    case 2:
      char v8 = *(uint64_t (**)(void))(*(void *)*a3 + 24);
LABEL_5:
      uint64_t v12 = v8();
      if (v12)
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "Failed to handle Refurb operation, ret %d\n", v13, v14, v15, v12);
      }
      return v12;
    case 3:
      int v16 = 1;
      goto LABEL_9;
    case 4:
      int v16 = 0;
LABEL_9:
      eUICC::ClearMetadata::Perform(v16, a3);
      break;
    default:
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "default case\n", v9, v10, v11, v18);
      break;
  }
  return 0;
}

uint64_t VinylController::bootstrapProvisioning(uint64_t a1, void *a2)
{
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(&v8, (const void **)(a1 + 128));
  Options::Options(v9, &v8);
  int v3 = eUICC::TwoPhaseProv::Perform((uint64_t)v9, a2);
  if (v17 < 0) {
    operator delete(__p);
  }
  if (v15 < 0) {
    operator delete(v14);
  }
  if (v13 < 0) {
    operator delete(v12);
  }
  if (v11 < 0) {
    operator delete(v10);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v8);
  if (!v3) {
    return 0;
  }
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "VinylController", "", "Failed to handle bootstrap provisioning operation, ret %d\n", v4, v5, v6, v3);
  return 11;
}

void sub_26386C9EC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  int v3 = va_arg(va1, const void *);
  Options::~Options((void **)va1);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t VinylController::getPairingParameters(int a1, CFDictionaryRef theDict, __CFDictionary **a3, void *a4)
{
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"kToBeSignedPayload");
  if (Value && (CFDictionaryRef v7 = Value, v8 = CFGetTypeID(Value), v8 == CFDictionaryGetTypeID()))
  {
    if (eUICC::Pairing::GetParameters(v7, a3, a4)) {
      return 11;
    }
    else {
      return 0;
    }
  }
  else
  {
    if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v10, v11, v12, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
    }
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "Signing payload dictionary not present in the input dictionary\n", v13, v14, v15, v16);
    return 0;
  }
}

uint64_t VinylController::freeTransport(VinylController *this)
{
  if (*((unsigned char *)this + 24))
  {
    gBBULogMaskGet();
    uint64_t v4 = "Skipping free of external transport\n";
    uint64_t v5 = 0xFFFFFFFFLL;
LABEL_3:
    _BBULog(0, v5, "VinylController", "", v4, v1, v2, v3, v13);
    return 0;
  }
  if (*((void *)this + 2))
  {
    CFTypeID v8 = (uint64_t (*)(char *))*((void *)this + 11);
    if (!v8) {
      return 0;
    }
    uint64_t result = v8((char *)this + 32);
    if (result)
    {
      if ((*(unsigned int (**)(void, char *))(**((void **)this + 2) + 40))(*((void *)this + 2), (char *)this + 32))
      {
        return 0;
      }
      else
      {
        return 3;
      }
    }
  }
  else
  {
    if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v9, v10, v11, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
    }
    uint64_t v12 = (unsigned char *)gBBULogMaskGet();
    uint64_t result = 0;
    if ((*v12 & 1) != 0 && gBBULogVerbosity >= 1)
    {
      uint64_t v4 = "fCommunication object not created, cannot free Transport\n";
      uint64_t v5 = 1;
      goto LABEL_3;
    }
  }
  return result;
}

void Options::~Options(void **this)
{
  if (*((char *)this + 127) < 0) {
    operator delete(this[13]);
  }
  if (*((char *)this + 103) < 0) {
    operator delete(this[10]);
  }
  if (*((char *)this + 71) < 0) {
    operator delete(this[6]);
  }
  if (*((char *)this + 39) < 0) {
    operator delete(this[2]);
  }
}

void VinylController::~VinylController(const void **this)
{
  VinylController::~VinylController(this);

  operator delete(v1);
}

{
  void *v2;
  const void *v3;

  *this = &unk_270EB4A78;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(this + 16);
  uint64_t v2 = (void *)this[15];
  this[15] = 0;
  if (v2) {
    operator delete(v2);
  }
  uint64_t v3 = this[2];
  this[2] = 0;
  if (v3) {
    (*(void (**)(const void *))(*(void *)v3 + 8))(v3);
  }
  ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef(this + 1);
}

const void **ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void __clang_call_terminate(void *a1)
{
}

const void **ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(const void **a1, const void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  if (v3) {
    CFRetain(v3);
  }
  return a1;
}

const void **ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 72);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return a1;
}

uint64_t ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 72);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return a1;
}

uint64_t __cxx_global_var_init()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_263869000);
  }
  return result;
}

uint64_t __cxx_global_var_init_48()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_263869000);
  }
  return result;
}

eUICC::eUICCVinylICEValve *eUICC::eUICCVinylICEValve::eUICCVinylICEValve(eUICC::eUICCVinylICEValve *this, void *a2, int a3, char a4)
{
  *((unsigned char *)this + 288) = 0;
  *((unsigned char *)this + 304) = 0;
  *(void *)this = &unk_270EB4AA8;
  uint64_t v5 = (eUICC::VinylCommandDriver **)((char *)this + 312);
  *((void *)this + 39) = 0;
  *((void *)this + 37) = a2;
  int v6 = a3 != 1;
  if (a3 == 255) {
    int v6 = 255;
  }
  *((_DWORD *)this + 73) = v6;
  *((unsigned char *)this + 289) = a4;
  IceAriGetContext();
  CFDictionaryRef v7 = (eUICC::VinylCommandDriver *)operator new(8uLL);
  eUICC::VinylCommandDriver::VinylCommandDriver();
  std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](v5, v7);
  *((unsigned char *)this + 304) = 15;
  return this;
}

void sub_26386D01C(_Unwind_Exception *a1)
{
  operator delete(v3);
  std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](v2, 0);
  VinylCommunication::~VinylCommunication(v1);
  _Unwind_Resume(a1);
}

uint64_t IceAriGetContext(void)
{
  pthread_mutex_lock(&ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance);
  uint64_t v0 = off_26A9A0CE0;
  if (!off_26A9A0CE0)
  {
    uint64_t v1 = operator new(0x28uLL);
    v1[32] = 0;
    std::shared_ptr<ICEARIContext>::shared_ptr[abi:ne180100]<ICEARIContext,void>(&v6, (uint64_t)v1);
    long long v2 = v6;
    long long v6 = 0uLL;
    uint64_t v3 = (std::__shared_weak_count *)*(&off_26A9A0CE0 + 1);
    off_26A9A0CE0 = v2;
    if (v3)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
      if (*((void *)&v6 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v6 + 1));
      }
    }
    uint64_t v0 = off_26A9A0CE0;
  }
  uint64_t v4 = (std::__shared_weak_count *)*(&off_26A9A0CE0 + 1);
  if (*(&off_26A9A0CE0 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A9A0CE0 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return v0;
}

void sub_26386D108(_Unwind_Exception *a1)
{
}

void *eUICC::eUICCVinylICEValve::GetVinylType@<X0>(eUICC::eUICCVinylICEValve *this@<X0>, void *a2@<X8>)
{
  *((_DWORD *)this + 2) = 0;
  *((unsigned char *)this + 287) = 1;
  return memcpy(a2, (char *)this + 8, 0x119uLL);
}

uint64_t eUICC::eUICCVinylICEValve::GetData@<X0>(eUICC::eUICCVinylICEValve *this@<X0>, void *a2@<X8>)
{
  AriSdk::ARI_IBIVinylGetDataReq_SDK::ARI_IBIVinylGetDataReq_SDK((AriSdk::ARI_IBIVinylGetDataReq_SDK *)v28);
  uint64_t v4 = (_OWORD *)((char *)this + 8);
  if (*((unsigned char *)this + 288))
  {
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "eUICCVinylData cache is valid. Using cached data!\n", v5, v6, v7, v27);
    eUICC::logEUICCData((int *)this + 2);
    goto LABEL_22;
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
  *(_OWORD *)((char *)this + 273) = 0u;
  *uint64_t v4 = 0u;
  AriSdk::Tlv<unsigned int>::operator=<int &,void>(&v29, (_DWORD *)this + 73);
  CFTypeID v8 = operator new(1uLL);
  *CFTypeID v8 = 0;
  uint64_t v9 = __p;
  __p = v8;
  if (v9) {
    operator delete(v9);
  }
  BOOL isAbsentOkay = eUICC::eUICCVinylICEValve::isAbsentOkay(this);
  *((unsigned char *)this + 286) = isAbsentOkay;
  if (isAbsentOkay)
  {
LABEL_21:
    *(_DWORD *)uint64_t v4 = 255;
    goto LABEL_22;
  }
  if ((eUICC::VinylCommandDriver::GetData() & 1) == 0)
  {
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Invalid GetData response from the BB\n", v23, v24, v25, v27);
    goto LABEL_21;
  }
  *((_DWORD *)this + 2) = *MEMORY[0x48];
  *(_WORD *)((char *)this + 13) = *MEMORY[0x58];
  uint64_t v11 = (_OWORD *)MEMORY[0x60];
  if (MEMORY[0x60] == MEMORY[0x68]) {
    uint64_t v11 = 0;
  }
  *(_OWORD *)((char *)this + 15) = *v11;
  *((unsigned char *)this + 31) = *MEMORY[0x78];
  uint64_t v12 = (_OWORD *)MEMORY[0x80];
  if (MEMORY[0x80] == MEMORY[0x88]) {
    uint64_t v12 = 0;
  }
  long long v13 = v12[1];
  *((_OWORD *)this + 2) = *v12;
  *((_OWORD *)this + 3) = v13;
  *((void *)this + 8) = *MEMORY[0x98];
  *((void *)this + 9) = *MEMORY[0xB0];
  uint64_t v14 = (_OWORD *)MEMORY[0xC8];
  if (MEMORY[0xC8] == MEMORY[0xD0]) {
    uint64_t v14 = 0;
  }
  *((_OWORD *)this + 5) = *v14;
  uint64_t v15 = (_OWORD *)MEMORY[0x128];
  if (MEMORY[0x128] == MEMORY[0x130]) {
    uint64_t v15 = 0;
  }
  *(_OWORD *)((char *)this + 155) = *v15;
  char v16 = (_OWORD *)MEMORY[0x1C0];
  if (MEMORY[0x1C0] == MEMORY[0x1C8]) {
    char v16 = 0;
  }
  long long v17 = v16[1];
  *(_OWORD *)((char *)this + 251) = *v16;
  *(_OWORD *)((char *)this + 267) = v17;
  *((_WORD *)this + 115) = *MEMORY[0x188];
  uint64_t v18 = MEMORY[0x1A8];
  if (MEMORY[0x1A8] == MEMORY[0x1B0]) {
    uint64_t v18 = 0;
  }
  char v19 = *(unsigned char *)(v18 + 2);
  *((_WORD *)this + 124) = *(_WORD *)v18;
  *((unsigned char *)this + 250) = v19;
  *((unsigned char *)this + 12) = *MEMORY[0x50];
  *((unsigned char *)this + 283) = *MEMORY[0x1E8];
  *((unsigned char *)this + 288) = 1;
  eUICC::logEUICCData((int *)this + 2);
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "result  0x%x \n", v20, v21, v22, *MEMORY[0x48]);
LABEL_22:
  memcpy(a2, (char *)this + 8, 0x119uLL);
  return MEMORY[0x263E6C690](v28);
}

void sub_26386D3F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  MEMORY[0x263E6C690](va);
  _Unwind_Resume(a1);
}

void **AriSdk::Tlv<unsigned int>::operator=<int &,void>(void **a1, _DWORD *a2)
{
  uint64_t v4 = operator new(4uLL);
  *uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = v4;
  if (v5) {
    operator delete(v5);
  }
  return a1;
}

BOOL eUICC::eUICCVinylICEValve::isAbsentOkay(eUICC::eUICCVinylICEValve *this)
{
  AriSdk::ARI_IBISimAccessGetSimDataReq_SDK::ARI_IBISimAccessGetSimDataReq_SDK((AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *)v30);
  AriSdk::Tlv<unsigned int>::operator=<int &,void>(&v31, (_DWORD *)this + 73);
  int v2 = -1;
  while (1)
  {
    if ((eUICC::VinylCommandDriver::GetVinylType() & 1) == 0)
    {
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Error: failed to get slot info from BB\n", v8, v9, v10, v28);
LABEL_13:
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)"ret");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Failed to get data from UIM\n", v14, v15, v16, v29);
LABEL_14:
      BOOL v17 = 0;
      goto LABEL_15;
    }
    int v3 = *MEMORY[0x48];
    if ((int)*MEMORY[0x48] > 5) {
      break;
    }
    if (v3 != 1 && v3 != 4) {
      goto LABEL_20;
    }
LABEL_10:
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "SIM still initializing, trying again... sim_state 0x%x (retryCount: %d, retryLimit: %d)\n", v5, v6, v7, *MEMORY[0x48]);
    __ns.__rep_ = 2000000000;
    std::this_thread::sleep_for (&__ns);
    if (++v2 >= 6) {
      goto LABEL_13;
    }
  }
  if (v3 == 254) {
    goto LABEL_10;
  }
  if (v3 != 6) {
    goto LABEL_20;
  }
  if (*MEMORY[0x80])
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v22, v23, v24, (char)"!(GET_RSP_FIELD(rsp, sim_error_cause_t28) & sim_error_cause_mask)");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "sim_state 0x%x, sim_error_cause 0x%x\n", v25, v26, v27, *MEMORY[0x48]);
    goto LABEL_14;
  }
  if (*MEMORY[0x80] == 2)
  {
    BOOL v17 = 1;
    goto LABEL_15;
  }
LABEL_20:
  if (MEMORY[0x88]) {
    BOOL v17 = (*MEMORY[0x88] & 3) == 0;
  }
  else {
    BOOL v17 = 1;
  }
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "sim_state 0x%x sim_error_cause: 0x%x sim_ext_capabilities 0x%x isAbsentOk: %s\n", v19, v20, v21, *MEMORY[0x48]);
LABEL_15:
  MEMORY[0x263E6C6F0](v30);
  return v17;
}

void sub_26386D7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x263E6C6F0](va);
  _Unwind_Resume(a1);
}

uint64_t eUICC::eUICCVinylICEValve::SetCardMode(uint64_t a1)
{
  AriSdk::ARI_IBIVinylSwitchModeReq_SDK::ARI_IBIVinylSwitchModeReq_SDK((AriSdk::ARI_IBIVinylSwitchModeReq_SDK *)v10);
  AriSdk::Tlv<unsigned int>::operator=<int &,void>(&v11, (_DWORD *)(a1 + 292));
  int v2 = operator new(1uLL);
  *int v2 = 1;
  int v3 = __p;
  __p = v2;
  if (v3) {
    operator delete(v3);
  }
  if (eUICC::VinylCommandDriver::SwitchCardMode())
  {
    uint64_t v4 = 0;
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Error: failed to SwitchCardMode\n", v5, v6, v7, v9);
    uint64_t v4 = 18;
  }
  MEMORY[0x263E6C6B0](v10);
  return v4;
}

void sub_26386D8A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  MEMORY[0x263E6C6B0](va);
  _Unwind_Resume(a1);
}

uint64_t eUICC::eUICCVinylICEValve::DeleteProfile(eUICC::eUICCVinylICEValve *this, unsigned int a2)
{
  AriSdk::ARI_IBIVinylTapeReq_SDK::ARI_IBIVinylTapeReq_SDK((AriSdk::ARI_IBIVinylTapeReq_SDK *)v29);
  uint64_t v28 = 0;
  v27[0] = 0xBFD00402820434BFLL;
  *(void *)((char *)v27 + 6) = 0xD80302820434BFD0;
  AriSdk::Tlv<unsigned int>::operator=<int &,void>(&v30, (_DWORD *)this + 73);
  uint64_t v4 = operator new(4uLL);
  *uint64_t v4 = 17;
  uint64_t v5 = __p;
  __p = v4;
  if (v5) {
    operator delete(v5);
  }
  uint64_t v6 = operator new(4uLL);
  *uint64_t v6 = 1;
  uint64_t v7 = v32;
  uint64_t v32 = v6;
  if (v7) {
    operator delete(v7);
  }
  uint64_t v8 = operator new(2uLL);
  *uint64_t v8 = 1;
  char v9 = v33;
  uint64_t v33 = v8;
  if (v9) {
    operator delete(v9);
  }
  uint64_t v10 = operator new(2uLL);
  *uint64_t v10 = 0;
  uint64_t v11 = v34;
  uint64_t v34 = v10;
  if (v11) {
    operator delete(v11);
  }
  uint64_t v12 = operator new(2uLL);
  *uint64_t v12 = 7;
  uint64_t v13 = v35;
  int v35 = v12;
  if (v13) {
    operator delete(v13);
  }
  uint64_t v14 = (char *)&v27[a2] - a2;
  AriSdk::TlvArray<unsigned char,3584ul>::assign<unsigned char *>(v36, v14, v14 + 7);
  if ((eUICC::VinylCommandDriver::DeleteProfile() & 1) == 0)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v23, v24, v25, (char)"status");
    uint64_t v22 = 11;
LABEL_15:
    uint64_t v15 = v28;
    if (!v28) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t v15 = v28;
  if (**(_DWORD **)(v28 + 80))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)"!GET_RSP_FIELD(rsp, result_t4)");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Failed to DeleteProfile status %d SW1_SW2 0x%x\n", v19, v20, v21, **(_DWORD **)(v28 + 80));
    uint64_t v22 = 18;
    goto LABEL_15;
  }
  uint64_t v22 = 0;
LABEL_18:
  (*(void (**)(uint64_t))(*(void *)v15 + 16))(v15);
LABEL_19:
  MEMORY[0x263E6C670](v29);
  return v22;
}

void sub_26386DB1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  MEMORY[0x263E6C670](va);
  _Unwind_Resume(a1);
}

BOOL AriSdk::TlvArray<unsigned char,3584ul>::assign<unsigned char *>(void *a1, char *a2, char *a3)
{
  unint64_t v4 = a3 - a2;
  if ((unint64_t)(a3 - a2) >= 0xE01)
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/AppleInternal/Library/BuildRoots/9f16a0bb-a2ea-11ef-bacb-1e361567c031/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/local/include/ARI/ari_sdk_msg.h", "assign", a3);
    if (v9 >= 0) {
      uint64_t v6 = __p;
    }
    else {
      uint64_t v6 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Range assignment too large(%p), got(%ld) max(%ld)", v5, v6, 385, a1, v4, 3584);
    if (v9 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a1, a2, a3, a3 - a2);
  }
  return v4 < 0xE01;
}

void sub_26386DBF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::eUICCVinylICEValve::StoreData(uint64_t a1, char **a2, void *a3, _WORD *a4)
{
  AriSdk::ARI_IBIVinylTapeReq_SDK::ARI_IBIVinylTapeReq_SDK((AriSdk::ARI_IBIVinylTapeReq_SDK *)v31);
  AriSdk::Tlv<unsigned int>::operator=<int &,void>(&v32, (_DWORD *)(a1 + 292));
  uint64_t v8 = operator new(4uLL);
  *uint64_t v8 = 5;
  char v9 = __p;
  __p = v8;
  if (v9) {
    operator delete(v9);
  }
  uint64_t v10 = operator new(4uLL);
  *uint64_t v10 = 1;
  uint64_t v11 = v34;
  uint64_t v34 = v10;
  if (v11) {
    operator delete(v11);
  }
  uint64_t v12 = operator new(2uLL);
  *uint64_t v12 = 1;
  uint64_t v13 = v35;
  int v35 = v12;
  if (v13) {
    operator delete(v13);
  }
  uint64_t v14 = operator new(2uLL);
  *uint64_t v14 = 0;
  uint64_t v15 = v36;
  int v36 = v14;
  if (v15) {
    operator delete(v15);
  }
  uint64_t v17 = *a2;
  uint64_t v16 = a2[1];
  uint64_t v18 = operator new(2uLL);
  *uint64_t v18 = (_WORD)v16 - (_WORD)v17;
  uint64_t v19 = v37;
  int v37 = v18;
  if (v19)
  {
    operator delete(v19);
    uint64_t v17 = *a2;
    uint64_t v16 = a2[1];
  }
  AriSdk::TlvArray<unsigned char,3584ul>::assign<std::__wrap_iter<unsigned char const*>>(v38, v17, v16);
  if (eUICC::VinylCommandDriver::DeleteProfile())
  {
    if (*MEMORY[0x50])
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v20, v21, v22, (char)"!GET_RSP_FIELD(rsp, result_t4)");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Failed to store data status %d SW1_SW2 0x%x\n", v23, v24, v25, *MEMORY[0x50]);
      uint64_t v26 = 18;
    }
    else
    {
      std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>(a3, MEMORY[0x78], (char *)(MEMORY[0x78] + (unsigned __int16)*MEMORY[0x70]), (unsigned __int16)*MEMORY[0x70]);
      uint64_t v26 = 0;
    }
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v27, v28, v29, (char)"status");
    uint64_t v26 = 11;
  }
  *a4 = *MEMORY[0x58];
  (*(void (**)(void))(MEMORY[0] + 16))(0);
  MEMORY[0x263E6C670](v31);
  return v26;
}

void sub_26386DE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  MEMORY[0x263E6C670](va);
  _Unwind_Resume(a1);
}

BOOL AriSdk::TlvArray<unsigned char,3584ul>::assign<std::__wrap_iter<unsigned char const*>>(void *a1, char *a2, char *a3)
{
  unint64_t v4 = a3 - a2;
  if ((unint64_t)(a3 - a2) >= 0xE01)
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/AppleInternal/Library/BuildRoots/9f16a0bb-a2ea-11ef-bacb-1e361567c031/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/local/include/ARI/ari_sdk_msg.h", "assign", a3);
    if (v9 >= 0) {
      uint64_t v6 = __p;
    }
    else {
      uint64_t v6 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Range assignment too large(%p), got(%ld) max(%ld)", v5, v6, 385, a1, v4, 3584);
    if (v9 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>(a1, a2, a3, a3 - a2);
  }
  return v4 < 0xE01;
}

void sub_26386DF60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::eUICCVinylICEValve::ValidatePerso(uint64_t a1, void *a2, void *a3)
{
  AriSdk::ARI_IBIVinylValidatePsoReq_SDK::ARI_IBIVinylValidatePsoReq_SDK((AriSdk::ARI_IBIVinylValidatePsoReq_SDK *)v36);
  uint64_t v35 = 0;
  uint64_t v6 = a2[1];
  uint64_t v7 = v6 - *a2;
  size_t v8 = (unsigned __int16)(v6 - *(_WORD *)a2);
  if (v8 >= 0xE01)
  {
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Payload too large -- payload_size: %d  max allowed: %lu)\n", v9, v10, v11, v7);
LABEL_14:
    uint64_t v27 = 18;
    goto LABEL_16;
  }
  AriSdk::Tlv<unsigned int>::operator=<int &,void>(&v37, (_DWORD *)(a1 + 292));
  uint64_t v12 = operator new(2uLL);
  *uint64_t v12 = 1;
  uint64_t v13 = __p;
  __p = v12;
  if (v13) {
    operator delete(v13);
  }
  uint64_t v14 = operator new(2uLL);
  *uint64_t v14 = 0;
  uint64_t v15 = v39;
  uint64_t v39 = v14;
  if (v15) {
    operator delete(v15);
  }
  uint64_t v16 = operator new(2uLL);
  *uint64_t v16 = v7;
  uint64_t v17 = v40;
  uint64_t v40 = v16;
  if (v17) {
    operator delete(v17);
  }
  uint64_t v18 = (const void *)*a2;
  uint64_t v19 = *a2 + v8;
  uint64_t v34 = 0;
  __n128 v33 = 0uLL;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(&v33, v18, v19, v8);
  AriSdk::TlvArray<unsigned char,3584ul>::operator=((uint64_t)&v41, &v33, v20);
  if (v33.n128_u64[0])
  {
    v33.n128_u64[1] = v33.n128_u64[0];
    operator delete((void *)v33.n128_u64[0]);
  }
  if (eUICC::VinylCommandDriver::ValidatePerso())
  {
    if (**(_DWORD **)(v35 + 72) || (uint64_t v32 = *(_WORD **)(v35 + 88), !*v32))
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v21, v22, v23, (char)"!GET_RSP_FIELD(rsp, result_t3) && GET_RSP_FIELD(rsp, sim_rsp_len_t5)");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Failed to AuthPerso status %d SW1_SW2 0x%x rsp_len %u\n", v24, v25, v26, **(_DWORD **)(v35 + 72));
      goto LABEL_14;
    }
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>(a3, *(char **)(v35 + 96), (char *)(*(void *)(v35 + 96) + (unsigned __int16)*v32), (unsigned __int16)*v32);
    uint64_t v27 = 0;
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v28, v29, v30, (char)"status");
    uint64_t v27 = 11;
  }
LABEL_16:
  if (v35) {
    (*(void (**)(uint64_t))(*(void *)v35 + 16))(v35);
  }
  MEMORY[0x263E6C6D0](v36);
  return v27;
}

void sub_26386E214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
}

uint64_t AriSdk::TlvArray<unsigned char,3584ul>::operator=(uint64_t a1, __n128 *a2, const char *a3)
{
  if (a2->n128_u64[1] - a2->n128_u64[0] < 0xE01)
  {
    std::vector<unsigned char>::__move_assign(a1, a2);
  }
  else
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/AppleInternal/Library/BuildRoots/9f16a0bb-a2ea-11ef-bacb-1e361567c031/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/local/include/ARI/ari_sdk_msg.h", "operator=", a3);
    if (v9 >= 0) {
      uint64_t v6 = __p;
    }
    else {
      uint64_t v6 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Array assignment too large(%p), got(%zu) max(%zu)", v5, v6, 360, a1, a2->n128_u64[1] - a2->n128_u64[0], 3584);
    if (v9 < 0) {
      operator delete(__p[0]);
    }
  }
  return a1;
}

void sub_26386E310(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void eUICC::eUICCVinylICEValve::~eUICCVinylICEValve(eUICC::VinylCommandDriver **this)
{
  *this = (eUICC::VinylCommandDriver *)&unk_270EB4AA8;
  std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](this + 39, 0);

  VinylCommunication::~VinylCommunication((VinylCommunication *)this);
}

{
  uint64_t vars8;

  *this = (eUICC::VinylCommandDriver *)&unk_270EB4AA8;
  std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](this + 39, 0);

  VinylCommunication::~VinylCommunication((VinylCommunication *)this);
}

{
  void *v2;
  uint64_t vars8;

  *this = (eUICC::VinylCommandDriver *)&unk_270EB4AA8;
  std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](this + 39, 0);
  VinylCommunication::~VinylCommunication((VinylCommunication *)this);

  operator delete(v2);
}

void *std::shared_ptr<ICEARIContext>::shared_ptr[abi:ne180100]<ICEARIContext,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  unint64_t v4 = operator new(0x20uLL);
  *unint64_t v4 = &unk_270EB4B10;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_26386E49C(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<ICEARIContext *,std::shared_ptr<ICEARIContext>::__shared_ptr_default_delete<ICEARIContext,ICEARIContext>,std::allocator<ICEARIContext>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<ICEARIContext *,std::shared_ptr<ICEARIContext>::__shared_ptr_default_delete<ICEARIContext,ICEARIContext>,std::allocator<ICEARIContext>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  if (v1) {
    operator delete(v1);
  }
}

uint64_t std::__shared_ptr_pointer<ICEARIContext *,std::shared_ptr<ICEARIContext>::__shared_ptr_default_delete<ICEARIContext,ICEARIContext>,std::allocator<ICEARIContext>>::__get_deleter(uint64_t a1, uint64_t a2)
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

void std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](eUICC::VinylCommandDriver **a1, eUICC::VinylCommandDriver *a2)
{
  uint64_t v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    eUICC::VinylCommandDriver::~VinylCommandDriver(v3);
    operator delete(v4);
  }
}

void *std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>(void *result, char *__src, char *a3, unint64_t a4)
{
  uint64_t v7 = result;
  unint64_t v8 = result[2];
  char v9 = (char *)*result;
  if (v8 - *result < a4)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      unint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = 2 * v8;
    if (2 * v8 <= a4) {
      uint64_t v10 = a4;
    }
    if (v8 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v11 = v10;
    }
    uint64_t result = std::vector<unsigned char>::__vallocate[abi:ne180100](v7, v11);
    char v9 = (char *)v7[1];
    goto LABEL_17;
  }
  uint64_t v12 = (unsigned char *)result[1];
  if (v12 - v9 >= a4)
  {
LABEL_17:
    size_t v15 = a3 - __src;
    if (v15) {
      uint64_t result = memmove(v9, __src, v15);
    }
    uint64_t v14 = &v9[v15];
    goto LABEL_20;
  }
  uint64_t v13 = &__src[v12 - v9];
  if (v12 != v9)
  {
    uint64_t result = memmove((void *)*result, __src, v12 - v9);
    char v9 = (char *)v7[1];
  }
  if (a3 != v13) {
    uint64_t result = memmove(v9, v13, a3 - v13);
  }
  uint64_t v14 = &v9[a3 - v13];
LABEL_20:
  v7[1] = v14;
  return result;
}

void *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_26386E738(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

__n128 std::vector<unsigned char>::__move_assign(uint64_t a1, __n128 *a2)
{
  unint64_t v4 = *(void **)a1;
  if (v4)
  {
    *(void *)(a1 + 8) = v4;
    operator delete(v4);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
  __n128 result = *a2;
  *(__n128 *)a1 = *a2;
  *(void *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

uint64_t __cxx_global_var_init_0()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_263869000);
  }
  return result;
}

void *VinylCommunication::create(int a1, uint64_t a2)
{
  if ((*(unsigned char *)gBBULogMaskGet() & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0) {
    _BBULog(2, 0, "VinylCommunication", "", "VinylCommunication::create", v4, v5, v6, v13);
  }
  int RadioVendor = TelephonyRadiosGetRadioVendor();
  if ((RadioVendor - 2) >= 2)
  {
    if (RadioVendor == 1)
    {
      size_t v8 = operator new(0x38uLL);
      VinylEURCommunication::VinylEURCommunication((uint64_t)v8, a2);
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylCommunication", "", "Unhandled radio type or no radio\n", v9, v10, v11, v13);
      return 0;
    }
  }
  else
  {
    size_t v8 = operator new(0x40uLL);
    VinylICECommunication::VinylICECommunication((uint64_t)v8, a1, a2);
  }
  return v8;
}

void sub_26386E8CC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t VinylCommunication::VinylCommunication(uint64_t result, int a2, uint64_t a3)
{
  *(void *)uint64_t result = &unk_270EB4B88;
  *(_DWORD *)(result + 8) = a2;
  *(void *)(result + 16) = a3;
  return result;
}

uint64_t VinylEURCommunication::VinylEURCommunication(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = a2;
  *(void *)a1 = &unk_270EB4CF0;
  *(void *)(a1 + 24) = dispatch_queue_create("com.apple.VinylCommunication", 0);
  *(void *)(a1 + 32) = dispatch_queue_create("com.apple.VinylStatuscallback", 0);
  *(void *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 48) = 34;
  return a1;
}

uint64_t VinylICECommunication::VinylICECommunication(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = a3;
  *(void *)a1 = &unk_270EB4C98;
  *(unsigned char *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = dispatch_queue_create("com.apple.VinylCommunication", 0);
  *(void *)(a1 + 40) = dispatch_queue_create("com.apple.VinylStatuscallback", 0);
  *(void *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 34;
  return a1;
}

uint64_t eUICC::logEUICCData(int *a1)
{
  gBBULogMaskGet();
  int v2 = *a1;
  ctu::hex((ctu *)((char *)a1 + 7), (const void *)0x10);
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylValve", "", "status 0x%x sw1_sw2 0x%x eid 0x%s op_mode 0x%hhx\n", v3, v4, v5, v2);
  if (v31 < 0) {
    operator delete(v30[0]);
  }
  gBBULogMaskGet();
  uint64_t v6 = v30;
  ctu::hex((ctu *)(a1 + 6), (const void *)0x20);
  if (v31 < 0) {
    LOBYTE(v6) = v30[0];
  }
  ctu::hex((ctu *)(a1 + 14), (const void *)8);
  ctu::hex((ctu *)(a1 + 16), (const void *)8);
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylValve", "", "current_fw_version %s main_fw_nonce 0x%s gold_fw_nonce 0x%s\n", v7, v8, v9, (char)v6);
  if (v27 < 0) {
    operator delete(__p);
  }
  if (v29 < 0) {
    operator delete(v28);
  }
  if (v31 < 0) {
    operator delete(v30[0]);
  }
  gBBULogMaskGet();
  ctu::hex((ctu *)(a1 + 18), (const void *)0x10);
  int v10 = v31;
  char v11 = (char)v30[0];
  ctu::hex((ctu *)((char *)a1 + 147), (const void *)0x10);
  if (v10 >= 0) {
    size_t v15 = v30;
  }
  else {
    LOBYTE(v15) = v11;
  }
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylValve", "", "main_fw_pcf_mac 0x%s gold_fw_pcf_mac 0x%s pcf_version 0x%x\n", v12, v13, v14, (char)v15);
  if (v29 < 0) {
    operator delete(v28);
  }
  if (v31 < 0) {
    operator delete(v30[0]);
  }
  gBBULogMaskGet();
  ctu::hex((ctu *)(a1 + 60), (const void *)3);
  int v16 = v31;
  char v17 = (char)v30[0];
  ctu::hex((ctu *)((char *)a1 + 243), (const void *)0x20);
  if (v16 >= 0) {
    uint64_t v21 = v30;
  }
  else {
    LOBYTE(v21) = v17;
  }
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylValve", "", "loader_version 0x%s key_id 0x%s perso %d\n", v18, v19, v20, (char)v21);
  if (v29 < 0) {
    operator delete(v28);
  }
  if (v31 < 0) {
    operator delete(v30[0]);
  }
  gBBULogMaskGet();
  return _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylValve", "", "chip_id 0x%x stream_apdu_max_apdus 0x%x isAbsentOk: %s\n", v22, v23, v24, *((unsigned char *)a1 + 275));
}

void sub_26386ED08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v25 - 49) < 0) {
    operator delete(*(void **)(v25 - 72));
  }
  _Unwind_Resume(exception_object);
}

uint64_t DEREncodeItemIntoVector(unint64_t a1, unint64_t a2, const void *a3, unint64_t *a4)
{
  unint64_t v8 = DERLengthOfItem(a1, a2);
  unint64_t v15 = v8;
  unint64_t v9 = *a4;
  unint64_t v10 = a4[1] - *a4;
  if (v8 <= v10)
  {
    if (v8 < v10) {
      a4[1] = v9 + v8;
    }
  }
  else
  {
    std::vector<unsigned char>::__append(a4, v8 - v10);
    unint64_t v9 = *a4;
  }
  uint64_t v11 = DEREncodeItem(a1, a2, a3, v9, &v15);
  if (v11)
  {
    unint64_t v12 = *a4;
  }
  else
  {
    unint64_t v14 = a4[1] - *a4;
    if (v15 > v14)
    {
      std::vector<unsigned char>::__append(a4, v15 - v14);
      return v11;
    }
    if (v15 >= v14) {
      return v11;
    }
    unint64_t v12 = *a4 + v15;
  }
  a4[1] = v12;
  return v11;
}

uint64_t DEREncodeSequenceIntoVector(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t *a4)
{
  unint64_t v8 = DERLengthOfEncodedSequence(a1, a2, *(unsigned __int16 *)(a3 + 8), *(void *)a3);
  unint64_t v15 = v8;
  unint64_t v9 = *a4;
  unint64_t v10 = a4[1] - *a4;
  if (v8 <= v10)
  {
    if (v8 < v10) {
      a4[1] = v9 + v8;
    }
  }
  else
  {
    std::vector<unsigned char>::__append(a4, v8 - v10);
    unint64_t v9 = *a4;
  }
  uint64_t v11 = DEREncodeSequence(a1, a2, *(unsigned __int16 *)(a3 + 8), *(void *)a3, v9, &v15);
  if (v11)
  {
    unint64_t v12 = *a4;
  }
  else
  {
    unint64_t v14 = a4[1] - *a4;
    if (v15 > v14)
    {
      std::vector<unsigned char>::__append(a4, v15 - v14);
      return v11;
    }
    if (v15 >= v14) {
      return v11;
    }
    unint64_t v12 = *a4 + v15;
  }
  a4[1] = v12;
  return v11;
}

uint64_t DERDecodeBBTicket(uint64_t a1, unsigned int a2, unint64_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v16[6] = xmmword_263891A48;
  v16[7] = unk_263891A58;
  v16[8] = xmmword_263891A68;
  v16[2] = xmmword_263891A08;
  v16[3] = unk_263891A18;
  v16[4] = xmmword_263891A28;
  v16[5] = unk_263891A38;
  v16[0] = xmmword_2638919E8;
  v16[1] = unk_2638919F8;
  v14[6] = xmmword_263891AD8;
  v14[7] = unk_263891AE8;
  v14[8] = xmmword_263891AF8;
  v14[9] = unk_263891B08;
  v14[2] = xmmword_263891A98;
  v14[3] = unk_263891AA8;
  v14[4] = xmmword_263891AB8;
  v14[5] = unk_263891AC8;
  v14[0] = xmmword_263891A78;
  v14[1] = unk_263891A88;
  uint64_t v15 = 1;
  v11[0] = a1;
  v11[1] = a2;
  uint64_t result = DERDecodeItem((uint64_t)v11, &v12);
  if (!result)
  {
    if (v12 == 0x2000000000000010)
    {
      if (TelephonyRadiosGetRadioVendor() == 1)
      {
        uint64_t v5 = v14;
        unsigned int v6 = 7;
      }
      else
      {
        uint64_t v5 = v16;
        unsigned int v6 = 6;
      }
      uint64_t result = (uint64_t)DERParseSequenceContent(&v13, v6, (uint64_t)v5, a3, 0);
      if (!result)
      {
        uint64_t v7 = *(uint64_t **)(a3 + 16);
        uint64_t v8 = *v7;
        int v9 = *((unsigned __int16 *)v7 + 4);
        BOOL v10 = v8 == 0x43DCE48862A0806 && v9 == 771;
        uint64_t result = 3;
        if (v10)
        {
          if (*(void *)(a3 + 24) == 10) {
            return 0;
          }
          else {
            return 3;
          }
        }
      }
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t parseAndCheckIfTagEnabled(uint64_t a1, unsigned int a2, int *a3)
{
  uint64_t v12 = 0;
  int v5 = DERDecodeSeqInit(a1, &v12, v13);
  char v6 = 0;
  if (!v5)
  {
    unint64_t v7 = a2 | 0x8000000000000000;
    while (1)
    {
      int v5 = DERDecodeSeqNext(v13, &v9);
      if (v5) {
        break;
      }
      if (v9 == v7)
      {
        if (v11 != 4)
        {
          char v6 = 0;
LABEL_14:
          int v5 = 3;
          goto LABEL_12;
        }
        char v6 = 0;
        if (*v10)
        {
          if (*v10 != 1) {
            goto LABEL_14;
          }
          char v6 = 1;
        }
      }
    }
    if (v5 == 1) {
      int v5 = 0;
    }
    else {
      char v6 = 0;
    }
  }
LABEL_12:
  *a3 = v5;
  return v6 & 1;
}

uint64_t isBBTicketCalibEnabled(uint64_t a1, _DWORD *a2)
{
  int v4 = 0;
  uint64_t result = parseAndCheckIfTagEnabled(a1 + 48, 0xD4u, &v4);
  if (v4)
  {
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t isBBTicketFATPCalibEnabled(uint64_t a1, _DWORD *a2)
{
  int v4 = 0;
  uint64_t result = parseAndCheckIfTagEnabled(a1 + 48, 0x1C2u, &v4);
  if (v4)
  {
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

void std::vector<unsigned char>::__append(unint64_t *a1, size_t a2)
{
  int v5 = (char *)a1[1];
  int v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }
    a1[1] = (unint64_t)v5;
  }
  else
  {
    unint64_t v6 = *a1;
    unint64_t v7 = &v5[-*a1];
    unint64_t v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v10 = v8;
    }
    if (v10) {
      unint64_t v11 = (unint64_t)operator new(v10);
    }
    else {
      unint64_t v11 = 0;
    }
    uint64_t v12 = &v7[v11];
    unint64_t v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      unint64_t v11 = (unint64_t)v12;
    }
    else
    {
      unint64_t v14 = &v5[~v6];
      do
      {
        char v15 = *--v5;
        (v14--)[v11] = v15;
      }
      while (v5 != (char *)v6);
      int v5 = (char *)*a1;
    }
    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5)
    {
      operator delete(v5);
    }
  }
}

uint64_t eUICC::Pairing::CreateValidatePersoPayload(unint64_t *a1, CFDictionaryRef theDict)
{
  char v93 = 127;
  int v92 = 17433507;
  v88 = 0;
  uint64_t v89 = 0;
  uint64_t v90 = 0;
  uint64_t v85 = 0;
  uint64_t v86 = 0;
  uint64_t v87 = 0;
  uint64_t v82 = 0;
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  if (!theDict)
  {
    if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
      _BBULog(1, 6, "VinylPairing", "", "check failed: %s, %d, assertion: %s\n", v45, v46, v47, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinylPairing.cpp");
    }
    gBBULogMaskGet();
    uint64_t v51 = "To be signed dictionary is NULL\n";
    goto LABEL_68;
  }
  CFIndex Count = CFDictionaryGetCount(theDict);
  size_t v4 = Count;
  if (Count <= 0)
  {
    if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
      _BBULog(1, 6, "VinylPairing", "", "check failed: %s, %d, assertion: %s\n", v52, v53, v54, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinylPairing.cpp");
    }
    gBBULogMaskGet();
    uint64_t v51 = "To be signed dictionary is empty\n";
    goto LABEL_68;
  }
  int v5 = (const void **)calloc(Count, 8uLL);
  if (!v5)
  {
    if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
      _BBULog(1, 6, "VinylPairing", "", "check failed: %s, %d, assertion: %s\n", v55, v56, v57, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinylPairing.cpp");
    }
    gBBULogMaskGet();
    uint64_t v51 = "Calloc dict keys failed\n";
LABEL_68:
    _BBULog(1, 0xFFFFFFFFLL, "VinylPairing", "", v51, v48, v49, v50, v70);
    unint64_t v6 = 0;
    int v5 = 0;
    goto LABEL_73;
  }
  unint64_t v6 = (const void **)calloc(v4, 8uLL);
  if (v6)
  {
    CFDictionaryGetKeysAndValues(theDict, v5, v6);
    uint64_t v7 = 0;
    int v8 = 0;
    while (1)
    {
      uint64_t v79 = 0;
      uint64_t v80 = 0;
      uint64_t v81 = 0;
      uint64_t v76 = 0;
      uint64_t v77 = 0;
      uint64_t v78 = 0;
      __p = 0;
      uint64_t v74 = 0;
      uint64_t v75 = 0;
      CFStringRef v9 = (const __CFString *)v5[v7];
      size_t v10 = v6[v7];
      CFTypeID v11 = CFGetTypeID(v9);
      if (v11 != CFStringGetTypeID()) {
        break;
      }
      CFTypeID v12 = CFGetTypeID(v10);
      if (v12 != CFDataGetTypeID()) {
        break;
      }
      CFIndex Length = CFStringGetLength(v9);
      CStringPtr = CFStringGetCStringPtr(v9, 0x8000100u);
      int v8 = DEREncodeItemIntoVector(0xCuLL, Length, CStringPtr, (unint64_t *)&v79);
      if (v8)
      {
        if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
          _BBULog(1, 6, "VinylPairing", "", "check failed: %s, %d, assertion: %s\n", v19, v20, v21, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinylPairing.cpp");
        }
        gBBULogMaskGet();
        char v17 = 1;
        _BBULog(1, 0xFFFFFFFFLL, "VinylPairing", "", "UTF8 string encoding for key failed\n", v22, v23, v24, v70);
      }
      else
      {
        CFIndex v15 = CFDataGetLength((CFDataRef)v10);
        BytePtr = CFDataGetBytePtr((CFDataRef)v10);
        int v8 = DEREncodeItemIntoVector(4uLL, v15, BytePtr, (unint64_t *)&v76);
        if (v8)
        {
          if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
            _BBULog(1, 6, "VinylPairing", "", "check failed: %s, %d, assertion: %s\n", v25, v26, v27, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinylPairing.cpp");
          }
          gBBULogMaskGet();
          char v17 = 1;
          _BBULog(1, 0xFFFFFFFFLL, "VinylPairing", "", "Octect string encoding for value failed\n", v28, v29, v30, v70);
        }
        else
        {
          v72[0] = v79;
          v72[1] = v80 - (unsigned char *)v79;
          v72[2] = v76;
          v72[3] = v77 - (unsigned char *)v76;
          int v8 = DEREncodeSequenceIntoVector(0x2000000000000010, (unint64_t)v72, (uint64_t)&eUICC::Pairing::derKeyValueSpec, (unint64_t *)&__p);
          if (!v8)
          {
            std::vector<unsigned char>::__insert_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>((uint64_t)&v88, v89, (char *)__p, v74, v74 - (unsigned char *)__p);
            char v17 = 0;
            int v8 = 0;
LABEL_13:
            char v18 = 1;
            goto LABEL_14;
          }
          if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
            _BBULog(1, 6, "VinylPairing", "", "check failed: %s, %d, assertion: %s\n", v31, v32, v33, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinylPairing.cpp");
          }
          gBBULogMaskGet();
          char v17 = 1;
          _BBULog(1, 0xFFFFFFFFLL, "VinylPairing", "", "Creating sequence using Key, Value pair failed\n", v34, v35, v36, v70);
        }
      }
      char v18 = 0;
LABEL_14:
      if (__p)
      {
        uint64_t v74 = (char *)__p;
        operator delete(__p);
      }
      if (v76)
      {
        uint64_t v77 = v76;
        operator delete(v76);
      }
      if (v79)
      {
        uint64_t v80 = v79;
        operator delete(v79);
      }
      if ((v18 & 1) == 0)
      {
        if (v17) {
          goto LABEL_42;
        }
        goto LABEL_49;
      }
      if (v4 == ++v7)
      {
        int v37 = DEREncodeItemIntoVector(0x2000000000000010uLL, v89 - v88, v88, (unint64_t *)&v85);
        int v8 = v37;
        if (v37
          || (int v8 = DEREncodeItemIntoVector(0xA000000000000005, v86 - (unsigned char *)v85, v85, (unint64_t *)&v82)) != 0)
        {
          gBBULogMaskGet();
          _BBULog(0, 0xFFFFFFFFLL, "VinylPairing", "", "Condition <<%s>> failed %s %s/%d\n", v38, v39, v40, (char)"DR_Success == ret");
        }
        else
        {
          v91[0] = &v92;
          v91[1] = 5;
          v91[2] = v82;
          v91[3] = v83 - (unsigned char *)v82;
          int v8 = DEREncodeSequenceIntoVector(0x2000000000000010, (unint64_t)v91, (uint64_t)&eUICC::Pairing::derKeyValueSpec, a1);
          if (v8)
          {
            if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
              _BBULog(1, 6, "VinylPairing", "", "check failed: %s, %d, assertion: %s\n", v64, v65, v66, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinylPairing.cpp");
            }
            gBBULogMaskGet();
            _BBULog(1, 0xFFFFFFFFLL, "VinylPairing", "", "Creating validatePerso sequence failed\n", v67, v68, v69, v70);
          }
        }
        goto LABEL_42;
      }
    }
    char v17 = 0;
    goto LABEL_13;
  }
  if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
    _BBULog(1, 6, "VinylPairing", "", "check failed: %s, %d, assertion: %s\n", v58, v59, v60, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinylPairing.cpp");
  }
  gBBULogMaskGet();
  _BBULog(1, 0xFFFFFFFFLL, "VinylPairing", "", "Calloc dict values failed\n", v61, v62, v63, v70);
  unint64_t v6 = 0;
LABEL_73:
  int v8 = 0;
LABEL_42:
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "VinylPairing", "", "CreateValidatePersoPayload DR %d\n", v41, v42, v43, v8);
  if (v5) {
    free(v5);
  }
  if (v6) {
    free(v6);
  }
  if (v8) {
    uint64_t v7 = 11;
  }
  else {
    uint64_t v7 = 0;
  }
LABEL_49:
  if (v82)
  {
    uint64_t v83 = v82;
    operator delete(v82);
  }
  if (v85)
  {
    uint64_t v86 = v85;
    operator delete(v85);
  }
  if (v88)
  {
    uint64_t v89 = v88;
    operator delete(v88);
  }
  return v7;
}

void sub_26386FAE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32)
{
  if (__p) {
    operator delete(__p);
  }
  if (a22) {
    operator delete(a22);
  }
  if (a25) {
    operator delete(a25);
  }
  if (a28) {
    operator delete(a28);
  }
  if (a31) {
    operator delete(a31);
  }
  uint64_t v34 = *(void **)(v32 - 152);
  if (v34)
  {
    *(void *)(v32 - 144) = v34;
    operator delete(v34);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::Pairing::GetParameters(const __CFDictionary *a1, __CFDictionary **a2, void *a3)
{
  uint64_t v102 = 0;
  int64_t v103 = 0;
  v101[0] = 0;
  v101[1] = 0;
  v100[0] = 0;
  v100[1] = 0;
  uint64_t v81 = 0;
  uint64_t v82 = 0;
  uint64_t v83 = 0;
  __p = 0;
  uint64_t v79 = 0;
  uint64_t v80 = 0;
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylPairing", "", "In GetParameters\n", v6, v7, v8, v76);
  if (a2)
  {
    eUICC::Pairing::CreateValidatePersoPayload((unint64_t *)&v81, a1);
    gBBULogMaskGet();
    _BBULogBinary(0, 0xFFFFFFFFLL, "VinylPairing", "", (uint64_t)v81, v82 - (unsigned char *)v81, 32, v9);
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    unsigned int v11 = (*(uint64_t (**)(void, void **, void **))(*(void *)*a3 + 40))(*a3, &v81, &__p);
    uint64_t v12 = VinylControllerMapBBUReturnToVinylResult(v11);
    if (v12)
    {
      if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
        _BBULog(1, 6, "VinylPairing", "", "check failed: %s, %d, assertion: %s\n", v73, v74, v75, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinylPairing.cpp");
      }
      goto LABEL_12;
    }
    uint64_t v102 = __p;
    int64_t v103 = v79 - (unsigned char *)__p;
    if (DERDecodeSeqContentInit((unint64_t *)&v102, v101)
      || DERDecodeSeqNext(v101, &v98)
      || DERParseSequenceContent(&v99, 4u, (uint64_t)&eUICC::Pairing::LPASigningRespSpec, (unint64_t)&bytes, 0x40uLL)|| DERDecodeSeqContentInit((unint64_t *)&bytes, v100)|| DERDecodeSeqNext(v100, &v96)|| DERParseSequenceContent(&v97, 6u, (uint64_t)&eUICC::Pairing::euiccSignedLPADataSpec, (unint64_t)&v84, 0x60uLL))
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylPairing", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"(der_ret == DR_Success)");
      uint64_t v12 = 27;
LABEL_12:
      *a2 = Mutable;
      goto LABEL_13;
    }
    if (length)
    {
      CFDataRef v17 = CFDataCreate(0, bytes, length);
      CFDictionarySetValue(Mutable, @"euiccSignedLPAData", v17);
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylPairing", "", "euiccSignedLPAData:: \n", v18, v19, v20, v77);
      gBBULogMaskGet();
      BytePtr = CFDataGetBytePtr(v17);
      CFIndex v22 = CFDataGetLength(v17);
      _BBULogBinary(0, 0xFFFFFFFFLL, "VinylPairing", "", (uint64_t)BytePtr, v22, 32, v23);
    }
    else
    {
      CFDataRef v17 = 0;
    }
    if (v85)
    {
      CFDataRef v24 = CFDataCreate(0, v84, v85);
      CFDictionarySetValue(Mutable, @"eidValue", v24);
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylPairing", "", "eidValue:: \n", v25, v26, v27, v77);
      gBBULogMaskGet();
      uint64_t v28 = CFDataGetBytePtr(v24);
      CFIndex v29 = CFDataGetLength(v24);
      _BBULogBinary(0, 0xFFFFFFFFLL, "VinylPairing", "", (uint64_t)v28, v29, 32, v30);
    }
    else
    {
      CFDataRef v24 = 0;
    }
    if (v87)
    {
      CFDataRef v31 = CFDataCreate(0, v86, v87);
      CFDictionarySetValue(Mutable, @"eUICCPublicKey", v31);
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylPairing", "", "eUICCPublicKey:: \n", v32, v33, v34, v77);
      gBBULogMaskGet();
      uint64_t v35 = CFDataGetBytePtr(v31);
      CFIndex v36 = CFDataGetLength(v31);
      _BBULogBinary(0, 0xFFFFFFFFLL, "VinylPairing", "", (uint64_t)v35, v36, 32, v37);
    }
    else
    {
      CFDataRef v31 = 0;
    }
    if (v91)
    {
      CFDataRef v38 = CFDataCreate(0, v90, v91);
      CFDictionarySetValue(Mutable, @"euiccSignature", v38);
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylPairing", "", "euiccSignature:: \n", v39, v40, v41, v77);
      gBBULogMaskGet();
      uint64_t v42 = CFDataGetBytePtr(v38);
      CFIndex v43 = CFDataGetLength(v38);
      _BBULogBinary(0, 0xFFFFFFFFLL, "VinylPairing", "", (uint64_t)v42, v43, 32, v44);
    }
    else
    {
      CFDataRef v38 = 0;
    }
    uint64_t v45 = 0;
    CFIndex v46 = v93;
    if (v93 && v95)
    {
      uint64_t v45 = CFDataCreateMutable(0, 0);
      CFDataAppendBytes(v45, v92, v93);
      CFDataAppendBytes(v45, v94, v95);
      CFDictionarySetValue(Mutable, @"euicceumCertificate", v45);
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylPairing", "", "euicceumCertificate:: \n", v47, v48, v49, v77);
      gBBULogMaskGet();
      uint64_t v50 = CFDataGetBytePtr(v45);
      CFIndex v51 = CFDataGetLength(v45);
      _BBULogBinary(0, 0xFFFFFFFFLL, "VinylPairing", "", (uint64_t)v50, v51, 32, v52);
      CFIndex v46 = v93;
    }
    if (v46)
    {
      CFDataRef v53 = CFDataCreate(0, v92, v46);
      CFDictionarySetValue(Mutable, @"euiccCertificate", v53);
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylPairing", "", "euiccCertificate:: \n", v54, v55, v56, v77);
      gBBULogMaskGet();
      uint64_t v57 = CFDataGetBytePtr(v53);
      CFIndex v58 = CFDataGetLength(v53);
      _BBULogBinary(0, 0xFFFFFFFFLL, "VinylPairing", "", (uint64_t)v57, v58, 32, v59);
    }
    else
    {
      CFDataRef v53 = 0;
    }
    if (v95)
    {
      CFDataRef v60 = CFDataCreate(0, v94, v95);
      CFDictionarySetValue(Mutable, @"eumCertificate", v60);
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylPairing", "", "eumCertificate:: \n", v61, v62, v63, v77);
      gBBULogMaskGet();
      uint64_t v64 = CFDataGetBytePtr(v60);
      CFIndex v65 = CFDataGetLength(v60);
      _BBULogBinary(0, 0xFFFFFFFFLL, "VinylPairing", "", (uint64_t)v64, v65, 32, v66);
    }
    else
    {
      CFDataRef v60 = 0;
    }
    *a2 = Mutable;
    if (v17) {
      CFRelease(v17);
    }
    if (v24) {
      CFRelease(v24);
    }
    if (v31) {
      CFRelease(v31);
    }
    if (v38) {
      CFRelease(v38);
    }
    if (v53) {
      CFRelease(v53);
    }
    if (v60) {
      CFRelease(v60);
    }
    if (v45) {
      CFRelease(v45);
    }
    uint64_t v12 = 0;
  }
  else
  {
    if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
      _BBULog(1, 6, "VinylPairing", "", "check failed: %s, %d, assertion: %s\n", v67, v68, v69, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinylPairing.cpp");
    }
    gBBULogMaskGet();
    _BBULog(1, 0xFFFFFFFFLL, "VinylPairing", "", "Null rsp dictionary reference passed\n", v70, v71, v72, v77);
    uint64_t v12 = 30;
  }
LABEL_13:
  if (__p)
  {
    uint64_t v79 = __p;
    operator delete(__p);
  }
  if (v81)
  {
    uint64_t v82 = v81;
    operator delete(v81);
  }
  return v12;
}

void sub_263870374(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, void *a17, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }
  if (a17) {
    operator delete(a17);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::Pairing::Verify()
{
  return 10;
}

char *std::vector<unsigned char>::__insert_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(uint64_t a1, char *__dst, char *__src, char *a4, uint64_t a5)
{
  int v5 = __dst;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v6 = a5;
  uint64_t v7 = __src;
  size_t v10 = *(char **)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    unsigned int v11 = *(char **)a1;
    uint64_t v12 = (uint64_t)&v10[a5 - *(void *)a1];
    if (v12 < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v13 = (char *)(__dst - v11);
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
    if (v15) {
      int v16 = operator new(v15);
    }
    else {
      int v16 = 0;
    }
    uint64_t v26 = &v13[(void)v16];
    uint64_t v27 = &v13[(void)v16 + v6];
    uint64_t v28 = v26;
    do
    {
      char v29 = *v7++;
      *v28++ = v29;
      --v6;
    }
    while (v6);
    uint64_t v30 = *(char **)a1;
    if (*(char **)a1 == v5)
    {
      uint64_t v32 = v26;
    }
    else
    {
      CFDataRef v31 = v5;
      uint64_t v32 = v26;
      do
      {
        char v33 = *--v31;
        *--uint64_t v32 = v33;
      }
      while (v31 != v30);
      size_t v10 = *(char **)(a1 + 8);
    }
    uint64_t v34 = (char *)v16 + v15;
    if (v10 != v5) {
      memmove(v27, v5, v10 - v5);
    }
    uint64_t v35 = *(char **)a1;
    *(void *)a1 = v32;
    *(void *)(a1 + 8) = &v27[v10 - v5];
    *(void *)(a1 + 16) = v34;
    if (v35) {
      operator delete(v35);
    }
    return v26;
  }
  uint64_t v17 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    uint64_t v18 = &__src[a5];
    uint64_t v20 = *(char **)(a1 + 8);
LABEL_17:
    uint64_t v21 = &v5[v6];
    CFIndex v22 = &v20[-v6];
    uint64_t v23 = v20;
    if (&v20[-v6] < v10)
    {
      int64_t v24 = &v10[v6] - v20;
      uint64_t v23 = v20;
      do
      {
        char v25 = *v22++;
        *v23++ = v25;
        --v24;
      }
      while (v24);
    }
    *(void *)(a1 + 8) = v23;
    if (v20 != v21) {
      memmove(&v5[v6], v5, v20 - v21);
    }
    if (v18 != v7) {
      memmove(v5, v7, v18 - v7);
    }
    return v5;
  }
  uint64_t v18 = &__src[v17];
  int64_t v19 = a4 - &__src[v17];
  if (a4 != &__src[v17]) {
    memmove(*(void **)(a1 + 8), &__src[v17], a4 - &__src[v17]);
  }
  uint64_t v20 = &v10[v19];
  *(void *)(a1 + 8) = &v10[v19];
  if (v17 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

uint64_t *ReverseProxyGetSettings@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3002000000;
  v42[3] = __Block_byref_object_copy_;
  v42[4] = __Block_byref_object_dispose_;
  size_t v4 = (char *)operator new(0x90uLL);
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *((void *)v4 + 3) = 850045863;
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *((_OWORD *)v4 + 4) = 0u;
  *((void *)v4 + 10) = 0;
  *((void *)v4 + 11) = 1018212795;
  *((_OWORD *)v4 + 6) = 0u;
  *((_OWORD *)v4 + 7) = 0u;
  *(_OWORD *)(v4 + 124) = 0u;
  *(void *)size_t v4 = &unk_270EB4BD8;
  CFIndex v43 = v4;
  uint64_t v41 = (std::__assoc_sub_state *)v4;
  std::__assoc_sub_state::__attach_future[abi:ne180100]((uint64_t)v4);
  *a2 = 0;
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v39, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string v39 = *(std::string *)a1;
  }
  if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v45, v39.__r_.__value_.__l.__data_, v39.__r_.__value_.__l.__size_);
  }
  else {
    std::string v45 = v39;
  }
  CFURLRef v44 = 0;
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v46, v45.__r_.__value_.__l.__data_, v45.__r_.__value_.__l.__size_);
  }
  else {
    std::string v46 = v45;
  }
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v47, v46.__r_.__value_.__l.__data_, v46.__r_.__value_.__l.__size_);
  }
  else {
    std::string v47 = v46;
  }
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v48 = 0;
  if (ctu::cf::convert_copy())
  {
    CFURLRef v6 = CFURLCreateWithString(v5, v48, 0);
    CFRelease(v48);
    BOOL v7 = v6 != 0;
  }
  else
  {
    CFURLRef v6 = 0;
    BOOL v7 = 0;
  }
  if ((SHIBYTE(v47.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (!v7) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  operator delete(v47.__r_.__value_.__l.__data_);
  if (v7)
  {
LABEL_18:
    CFStringRef v8 = (const __CFString *)v44;
    CFURLRef v44 = v6;
    CFStringRef v48 = v8;
    ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::~SharedRef((const void **)&v48);
  }
LABEL_19:
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v46.__r_.__value_.__l.__data_);
  }
  CFURLRef v40 = v44;
  CFURLRef v44 = 0;
  ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::~SharedRef((const void **)&v44);
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v45.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v39.__r_.__value_.__l.__data_);
  }
  uint64_t v9 = (const void *)RPRegisterForAvailability();
  if (!v9)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Condition <<%s>> failed %s %s/%d\n", v26, v27, v28, (char)"reg");
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Failed to register for proxy\n", v29, v30, v31, v38);
    goto LABEL_41;
  }
  uint64_t v10 = *(unsigned __int8 *)(a1 + 23);
  if ((v10 & 0x80u) != 0) {
    uint64_t v10 = *(void *)(a1 + 8);
  }
  if (!v10
    || (v40
      ? (unsigned int v11 = ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::get)
      : (unsigned int v11 = 0),
        !v11))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Condition <<%s>> failed %s %s/%d\n", v19, v20, v21, (char)"!url.empty() && urlRef");
    gBBULogMaskGet();
    char v25 = "NULL requestURL?\n";
LABEL_36:
    _BBULog(0, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", v25, v22, v23, v24, v37);
    goto LABEL_37;
  }
  RPRegistrationResume();
  v47.__r_.__value_.__r.__words[0] = std::chrono::steady_clock::now().__d_.__rep_ + 5000000000;
  int v12 = std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>((uint64_t)v4, (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)&v47);
  RPRegistrationInvalidate();
  if (!v12)
  {
    if (std::future<BOOL>::get(&v41))
    {
      *a2 = RPCopyProxyDictionary();
      v47.__r_.__value_.__r.__words[0] = 0;
      ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v47.__r_.__value_.__l.__data_);
      goto LABEL_37;
    }
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Condition <<%s>> failed %s %s/%d\n", v34, v35, v36, (char)"future.get()");
    gBBULogMaskGet();
    char v25 = "Failed to get PRP\n";
    goto LABEL_36;
  }
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"fs == std::future_status::ready");
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "PRP timed out %d\n", v16, v17, v18, v12);
LABEL_37:
  CFRelease(v9);
LABEL_41:
  ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::~SharedRef((const void **)&v40);
  uint64_t v32 = v41;
  if (v41 && !atomic_fetch_add(&v41->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    ((void (*)(std::__assoc_sub_state *))v32->__on_zero_shared)(v32);
  }
  _Block_object_dispose(v42, 8);
  return std::promise<BOOL>::~promise((uint64_t *)&v43);
}

void sub_263870AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,const void *a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::~SharedRef(&a25);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(v34);
  uint64_t v36 = a26;
  if (a26)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(a26 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
      (*(void (**)(uint64_t))(*(void *)v36 + 16))(v36);
    }
  }
  _Block_object_dispose(&a27, 8);
  std::promise<BOOL>::~promise(v33);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t *__Block_byref_object_dispose_(uint64_t a1)
{
  return std::promise<BOOL>::~promise((uint64_t *)(a1 + 40));
}

void ___Z23ReverseProxyGetSettingsRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE_block_invoke(uint64_t a1, int a2)
{
  if (a2 != 2)
  {
    char v2 = a2;
    if (a2 == 1)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Proxy Available!\n", v4, v5, v6, v11);
      BOOL v7 = (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      char v12 = 1;
      std::promise<BOOL>::set_value(v7, &v12);
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Proxy Aborted? %d\n", v8, v9, v10, v2);
    }
  }
}

void std::promise<BOOL>::set_value(uint64_t *a1, unsigned char *a2)
{
  uint64_t v2 = *a1;
  if (!v2) {
    std::__throw_future_error[abi:ne180100](3u);
  }

  std::__assoc_state<BOOL>::set_value<BOOL>(v2, a2);
}

uint64_t std::future<BOOL>::get(std::__assoc_sub_state **a1)
{
  uint64_t v1 = *a1;
  *a1 = 0;
  std::__assoc_state<BOOL>::move(v1);
  uint64_t v3 = v2;
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    ((void (*)(std::__assoc_sub_state *))v1->__on_zero_shared)(v1);
  }
  return v3;
}

void sub_263870D20(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::future<BOOL>::get(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::get(uint64_t a1)
{
  return *(void *)a1;
}

const void **ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void std::__assoc_state<BOOL>::~__assoc_state(uint64_t a1)
{
  *(void *)a1 = MEMORY[0x263F8C320] + 16;
  uint64_t v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);

  std::__shared_count::~__shared_count((std::__shared_count *)a1);
}

{
  std::exception_ptr *v2;
  void *v3;
  uint64_t vars8;

  *(void *)a1 = MEMORY[0x263F8C320] + 16;
  uint64_t v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);

  operator delete(v3);
}

uint64_t std::__assoc_state<BOOL>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t *std::promise<BOOL>::~promise(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    if ((*(unsigned char *)(v2 + 136) & 1) == 0)
    {
      v7.__ptr_ = 0;
      uint64_t v3 = *(void *)(v2 + 16);
      std::exception_ptr::~exception_ptr(&v7);
      uint64_t v2 = *a1;
      if (!v3 && *(uint64_t *)(v2 + 8) >= 1)
      {
        uint64_t v4 = std::future_category();
        MEMORY[0x263E6C860](v6, 4, v4);
        std::make_exception_ptr[abi:ne180100]<std::future_error>(v6);
      }
    }
    if (!atomic_fetch_add((atomic_ullong *volatile)(v2 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
      (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
    }
  }
  return a1;
}

void std::make_exception_ptr[abi:ne180100]<std::future_error>(const std::logic_error *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x20uLL);
  uint64_t v3 = std::logic_error::logic_error(exception, a1);
  v3->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C2E0] + 16);
  v3[1] = a1[1];
  __cxa_throw(v3, MEMORY[0x263F8C1A0], MEMORY[0x263F8C0C0]);
}

void sub_263870FC4(void *a1)
{
}

void std::__throw_future_error[abi:ne180100](unsigned int a1)
{
  exception = __cxa_allocate_exception(0x20uLL);
  uint64_t v3 = std::future_category();
  MEMORY[0x263E6C860](exception, a1, v3);
  __cxa_throw(exception, MEMORY[0x263F8C1A0], MEMORY[0x263F8C0C0]);
}

void sub_263871038(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__assoc_sub_state::__attach_future[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = (std::mutex *)(a1 + 24);
  std::mutex::lock((std::mutex *)(a1 + 24));
  int v3 = *(_DWORD *)(a1 + 136);
  if ((v3 & 2) != 0) {
    std::__throw_future_error[abi:ne180100](1u);
  }
  atomic_fetch_add_explicit((atomic_ullong *volatile)(a1 + 8), 1uLL, memory_order_relaxed);
  *(_DWORD *)(a1 + 136) = v3 | 2;

  std::mutex::unlock(v2);
}

void sub_2638710B4(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
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

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__assoc_state<BOOL>::set_value<BOOL>(uint64_t a1, unsigned char *a2)
{
  uint64_t v4 = (std::mutex *)(a1 + 24);
  std::mutex::lock((std::mutex *)(a1 + 24));
  if ((*(unsigned char *)(a1 + 136) & 1) != 0
    || (v6.__ptr_ = 0, uint64_t v5 = *(void *)(a1 + 16), std::exception_ptr::~exception_ptr(&v6), v5))
  {
    std::__throw_future_error[abi:ne180100](2u);
  }
  *(unsigned char *)(a1 + 140) = *a2;
  *(_DWORD *)(a1 + 136) |= 5u;
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 88));
  std::mutex::unlock(v4);
}

void sub_263871210(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>(uint64_t a1, std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *a2)
{
  v13.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(a1 + 24);
  v13.__owns_ = 1;
  std::mutex::lock((std::mutex *)(a1 + 24));
  unsigned int v4 = *(_DWORD *)(a1 + 136);
  if ((v4 & 8) != 0)
  {
    uint64_t v11 = 2;
    goto LABEL_25;
  }
  if ((v4 & 4) != 0)
  {
    uint64_t v11 = ((v4 >> 2) & 1) == 0;
    goto LABEL_25;
  }
  while (std::chrono::steady_clock::now().__d_.__rep_ < *a2)
  {
    if (std::chrono::steady_clock::now().__d_.__rep_ < *a2)
    {
      std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v5 = *a2;
      v6.__d_.__rep_ = v5 - std::chrono::steady_clock::now().__d_.__rep_;
      if (v6.__d_.__rep_ >= 1)
      {
        std::chrono::steady_clock::now();
        v7.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
        if (!v7.__d_.__rep_)
        {
          std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v8 = 0;
          goto LABEL_14;
        }
        if (v7.__d_.__rep_ < 1)
        {
          if ((unint64_t)v7.__d_.__rep_ >= 0xFFDF3B645A1CAC09) {
            goto LABEL_13;
          }
          std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v8 = 0x8000000000000000;
        }
        else
        {
          if ((unint64_t)v7.__d_.__rep_ > 0x20C49BA5E353F7)
          {
            std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v8 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_14;
          }
LABEL_13:
          std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v8 = 1000 * v7.__d_.__rep_;
LABEL_14:
          if (v8 > (v6.__d_.__rep_ ^ 0x7FFFFFFFFFFFFFFFLL))
          {
            v9.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_17;
          }
        }
        v9.__d_.__rep_ = v8 + v6.__d_.__rep_;
LABEL_17:
        std::condition_variable::__do_timed_wait((std::condition_variable *)(a1 + 88), &v13, v9);
        std::chrono::steady_clock::now();
      }
      std::chrono::steady_clock::now();
    }
    unsigned int v10 = *(_DWORD *)(a1 + 136);
    if ((v10 & 4) != 0) {
      goto LABEL_24;
    }
  }
  unsigned int v10 = *(_DWORD *)(a1 + 136);
LABEL_24:
  uint64_t v11 = ((v10 >> 2) & 1) == 0;
  if (v13.__owns_) {
LABEL_25:
  }
    std::mutex::unlock(v13.__m_);
  return v11;
}

void std::__assoc_state<BOOL>::move(std::__assoc_sub_state *a1)
{
  __lk.__m_ = &a1->__mut_;
  __lk.__owns_ = 1;
  std::mutex::lock(&a1->__mut_);
  std::__assoc_sub_state::__sub_wait(a1, &__lk);
  ptr = a1->__exception_.__ptr_;
  v5.__ptr_ = 0;
  std::exception_ptr::~exception_ptr(&v5);
  if (ptr)
  {
    std::exception_ptr::exception_ptr(&v4, &a1->__exception_);
    v3.__ptr_ = &v4;
    std::rethrow_exception(v3);
    __break(1u);
  }
  else if (__lk.__owns_)
  {
    std::mutex::unlock(__lk.__m_);
  }
}

void sub_263871428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, char a12)
{
  if (a12) {
    std::mutex::unlock(a11);
  }
  _Unwind_Resume(a1);
}

void *BBUCapabilities::create_default_global@<X0>(void *a1@<X8>)
{
  std::exception_ptr v3 = operator new(4uLL);
  _DWORD *v3 = TelephonyRadiosGetProduct();

  return std::shared_ptr<BBUCapabilities>::shared_ptr[abi:ne180100]<BBUCapabilities,void>(a1, (uint64_t)v3);
}

void sub_2638714A0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void BBUCapabilities::BBUCapabilities(BBUCapabilities *this)
{
  *(_DWORD *)this = TelephonyRadiosGetProduct();
}

uint64_t BBUCapabilities::getARICommandTimeout(BBUCapabilities *this)
{
  return 2000;
}

capabilities::euicc *BBUCapabilities::supportsVinylRestore(BBUCapabilities *this)
{
  if (capabilities::euicc::supportsVinylRestore(this)) {
    return (capabilities::euicc *)1;
  }
  pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  if (!(void)xmmword_26A9A0D30)
  {
    BBUCapabilities::create_default_global(&v7);
    long long v5 = v7;
    long long v7 = 0uLL;
    std::chrono::steady_clock::time_point v6 = (std::__shared_weak_count *)*((void *)&xmmword_26A9A0D30 + 1);
    xmmword_26A9A0D30 = v5;
    if (v6)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      if (*((void *)&v7 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v7 + 1));
      }
    }
  }
  uint64_t v2 = (std::__shared_weak_count *)*((void *)&xmmword_26A9A0D30 + 1);
  if (*((void *)&xmmword_26A9A0D30 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_26A9A0D30 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  std::exception_ptr v3 = (BBUCapabilities *)pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  uint64_t v1 = BBUCapabilities::supportsVinylUpdate(v3);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return v1;
}

void sub_2638715AC(_Unwind_Exception *a1)
{
}

capabilities::euicc *BBUCapabilities::supportsVinylUpdate(BBUCapabilities *this)
{
  uint64_t IsInternalBuild = TelephonyUtilIsInternalBuild();
  if (IsInternalBuild
    && (uint64_t IsInternalBuild = BBUpdaterCommon::isNVRAMKeyPresent(@"VinylForceGenericUpdate", v2),
        IsInternalBuild))
  {
    gBBULogMaskGet();
    uint64_t result = (capabilities::euicc *)_BBULog(0, 0xFFFFFFFFLL, "BBUCapabilities", "", "kVinylForceGenericUpdate NV set to TRUE\n", v3, v4, v5, vars0);
  }
  else
  {
    uint64_t result = (capabilities::euicc *)capabilities::euicc::supportsGenericUpdater((capabilities::euicc *)IsInternalBuild);
    if (!result) {
      return result;
    }
  }
  return (capabilities::euicc *)(capabilities::euicc::supportsEOS(result) ^ 1);
}

BOOL BBUCapabilities::supportsEUICCGSMAMastering(BBUCapabilities *this, unsigned int a2)
{
  return a2 > 4;
}

uint64_t BBUCapabilities::getEUICCCertIDSize(BBUCapabilities *this, unsigned int a2)
{
  if (a2 <= 4) {
    return 4;
  }
  else {
    return 20;
  }
}

uint64_t BBUCapabilities::getEUICCAttempts(BBUCapabilities *this)
{
  return 3;
}

void *std::shared_ptr<BBUCapabilities>::shared_ptr[abi:ne180100]<BBUCapabilities,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = operator new(0x20uLL);
  *uint64_t v4 = &unk_270EB4C20;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_2638716CC(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<BBUCapabilities *,std::shared_ptr<BBUCapabilities>::__shared_ptr_default_delete<BBUCapabilities,BBUCapabilities>,std::allocator<BBUCapabilities>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<BBUCapabilities *,std::shared_ptr<BBUCapabilities>::__shared_ptr_default_delete<BBUCapabilities,BBUCapabilities>,std::allocator<BBUCapabilities>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  if (v1) {
    operator delete(v1);
  }
}

uint64_t std::__shared_ptr_pointer<BBUCapabilities *,std::shared_ptr<BBUCapabilities>::__shared_ptr_default_delete<BBUCapabilities,BBUCapabilities>,std::allocator<BBUCapabilities>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t __cxx_global_var_init_1()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_263869000);
  }
  return result;
}

void **BBUFSDebugRegisterDelegate(void **result)
{
  sDelegate = *result;
  return result;
}

uint64_t _BBUFSDebugPrint(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (sDelegate) {
    return sDelegate(result, a2, &a9);
  }
  return result;
}

uint64_t eUICC::VinylFactory::GetValve@<X0>(eUICC::VinylFactory *this@<X0>, void *a2@<X1>, char a3@<W2>, eUICC::eUICCVinylICEValve **a4@<X8>)
{
  int v5 = (int)a2;
  uint64_t result = TelephonyRadiosGetRadioVendor();
  if ((result - 2) >= 2)
  {
    if (result == 1)
    {
      std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v9 = (eUICC::eUICCVinylICEValve *)operator new(0x138uLL);
      uint64_t result = eUICC::eUICCVinylMAVValve::eUICCVinylMAVValve((uint64_t)v9, this, v5, a3);
    }
    else
    {
      std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v9 = 0;
    }
  }
  else
  {
    std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v9 = (eUICC::eUICCVinylICEValve *)operator new(0x140uLL);
    uint64_t result = eUICC::eUICCVinylICEValve::eUICCVinylICEValve(v9, this, v5, a3);
  }
  *a4 = v9;
  return result;
}

void sub_263871884(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t eUICC::copyAsCFString()
{
  if ((ctu::cf::convert_copy() & 1) == 0)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 32, "/Library/Caches/com.apple.xbs/Sources/VinylRestore/CommandDrivers/eUICCCommon.cpp", 0x34u, (ctu::LogMessageBuffer *)"Assertion failure(success && \"Unrecognized radio type.\")", v2, v3, v4, v5);
  }
  return 0;
}

void sub_263871934(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t eUICC::getEID()
{
  uint64_t v0 = (__CFDictionary **)MEMORY[0x270FA5388]();
  uint64_t v33 = *MEMORY[0x263EF8340];
  (*(void (**)(void *__return_ptr))(**(void **)v1 + 8))(v31);
  if (LODWORD(v31[0]) == ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    eUICC::stringifyDataBuffer((eUICC *)((char *)v31 + 7), v2);
    gBBULogMaskGet();
    p_p = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      LOBYTE(p_p) = __p.__r_.__value_.__s.__data_[0];
    }
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylFactory", "", "EID: %s\n", v3, v4, v5, (char)p_p);
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (Mutable)
    {
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v27, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      }
      else {
        std::string v27 = __p;
      }
      std::unique_lock<std::mutex> v13 = (const void *)eUICC::copyAsCFString();
      uint64_t v28 = v13;
      if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v27.__r_.__value_.__l.__data_);
      }
      CFDictionarySetValue(Mutable, @"EID", v13);
      _WORD *v0 = Mutable;
      CFStringRef v14 = CFStringCreateWithFormat(v7, 0, @"%@", Mutable);
      CFStringRef v15 = v14;
      if (v14)
      {
        if (CFStringGetCString(v14, buffer, 0x2000, 0x8000100u))
        {
          gBBULogMaskGet();
          _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylFactory", "", "client rsp data: %s\n", v16, v17, v18, (char)buffer);
        }
        CFRelease(v15);
      }
      ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v28);
    }
    else
    {
      if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
        _BBULog(1, 6, "eUICCVinylFactory", "", "check failed: %s, %d, assertion: %s\n", v19, v20, v21, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/CommandDrivers/eUICCCommon.cpp");
      }
      if ((*(unsigned char *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1) {
        _BBULog(0, 1, "eUICCVinylFactory", "", "Failed to allocate shared info dict\n", v22, v23, v24, v26);
      }
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    if (!v32) {
      return 107;
    }
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylFactory", "", "eUICC not stuffed but that's ok!\n", v9, v10, v11, v25);
  }
  return 0;
}

void sub_263871C6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::stringifyDataBuffer(eUICC *this, unsigned __int8 *a2)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v7);
  for (uint64_t i = 0; i != 16; ++i)
  {
    *(_DWORD *)((char *)v9 + *(void *)(v8 - 24)) = *(_DWORD *)((unsigned char *)v9 + *(void *)(v8 - 24)) & 0xFFFFFFB5 | 8;
    char v6 = 48;
    uint64_t v3 = std::operator<<[abi:ne180100]<std::char_traits<char>>(&v8, &v6);
    *(void *)((char *)v3 + *(void *)(*v3 - 24) + 24) = 2;
    std::ostream::operator<<();
  }
  std::stringbuf::str();
  v7[0] = *MEMORY[0x263F8C2B8];
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v7 + *(void *)(v7[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  uint64_t v8 = v4;
  v9[0] = MEMORY[0x263F8C318] + 16;
  if (v10 < 0) {
    operator delete((void *)v9[8]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x263E6CAB0](&v11);
}

void sub_263871EA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t eUICC::checkEOSDev(unsigned char *a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  *a1 = 0;
  pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  uint64_t v4 = (BBUCapabilities *)xmmword_26A9A0D30;
  if (!(void)xmmword_26A9A0D30)
  {
    BBUCapabilities::create_default_global(v17);
    long long v5 = v17[0];
    v17[0] = 0uLL;
    char v6 = (std::__shared_weak_count *)*((void *)&xmmword_26A9A0D30 + 1);
    xmmword_26A9A0D30 = v5;
    if (v6)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      if (*((void *)&v17[0] + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v17[0] + 1));
      }
    }
    uint64_t v4 = (BBUCapabilities *)xmmword_26A9A0D30;
  }
  CFAllocatorRef v7 = (std::__shared_weak_count *)*((void *)&xmmword_26A9A0D30 + 1);
  if (*((void *)&xmmword_26A9A0D30 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_26A9A0D30 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  char v8 = BBUCapabilities::supportsEuiccViaEOS(v4);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  if ((v8 & 1) == 0) {
    return 0;
  }
  (*(void (**)(_OWORD *__return_ptr))(**(void **)a2 + 8))(v17);
  if (LODWORD(v17[0]) == ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    eUICC::stringifyDataBuffer((eUICC *)((char *)v17 + 7), v9);
    gBBULogMaskGet();
    p_p = &__p;
    if (v16 < 0) {
      LOBYTE(p_p) = (_BYTE)__p;
    }
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylFactory", "", "EID: %s\n", v10, v11, v12, (char)p_p);
    if (HIBYTE(v17[0]) == 99) {
      *a1 = 1;
    }
    if (v16 < 0) {
      operator delete(__p);
    }
    return 0;
  }
  return 107;
}

void sub_26387208C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 128) = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  long long v5 = (void *)MEMORY[0x263F8C2B8];
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

void sub_26387239C(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x263E6CAB0](v1);
  _Unwind_Resume(a1);
}

void *std::operator<<[abi:ne180100]<std::char_traits<char>>(void *a1, char *a2)
{
  uint64_t v3 = (char *)a1 + *(void *)(*a1 - 24);
  int v4 = *a2;
  if (*((_DWORD *)v3 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
    long long v5 = std::locale::use_facet(&v8, MEMORY[0x263F8C108]);
    int v6 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 32);
    std::locale::~locale(&v8);
    *((_DWORD *)v3 + 36) = v6;
  }
  *((_DWORD *)v3 + 36) = v4;
  return a1;
}

void sub_263872478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
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
  MEMORY[0x263E6CAB0](a1 + 128);
  return a1;
}

const void **ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t __cxx_global_var_init_2()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_263869000);
  }
  return result;
}

uint64_t __cxx_global_var_init_13()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_263869000);
  }
  return result;
}

const void **VinylICECommunication::statusCallback(char a1, uint64_t a2, int a3)
{
  uint64_t result = (const void **)gBBULogMaskGet();
  if ((*(unsigned char *)result & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0) {
    uint64_t result = (const void **)_BBULog(2, 0, "BBUICE16Communication", "", "transport %p, status: %d\n", v6, v7, v8, a1);
  }
  if (a3 == 1)
  {
    uint64_t Controller = TelephonyBasebandCreateController();
    int v9 = TelephonyBasebandResetModem();
    if ((*(unsigned char *)gBBULogMaskGet() & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    {
      std::unique_lock<std::mutex> v13 = "failure";
      if (v9) {
        std::unique_lock<std::mutex> v13 = "success";
      }
      _BBULog(2, 0, "BBUICE16Communication", "", "Resetting modem: %s\n", v10, v11, v12, (char)v13);
    }
    return ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef((const void **)&Controller);
  }
  return result;
}

void sub_263872768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t VinylICECommunication::freeTransportSync(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (!v2) {
    return 1;
  }
  if (v2 == a2)
  {
    int v9 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN21VinylICECommunication17freeTransportSyncEP26TelephonyUtilTransport_tag_block_invoke;
    block[3] = &__block_descriptor_tmp_0;
    block[4] = a1;
    dispatch_sync(v9, block);
    uint64_t v8 = TelephonyUtilTransportFree();
    uint64_t v10 = *(NSObject **)(a1 + 40);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 0x40000000;
    v12[2] = ___ZN21VinylICECommunication17freeTransportSyncEP26TelephonyUtilTransport_tag_block_invoke_2;
    v12[3] = &__block_descriptor_tmp_8;
    char v13 = v8;
    v12[4] = a1;
    v12[5] = a2;
    dispatch_sync(v10, v12);
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)gBBULogMaskGet() & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    {
      _BBULog(2, 0, "BBUICE16Communication", "", "call with %p different from fTransportCreated(%p)\n", v5, v6, v7, a2);
      return 0;
    }
  }
  return v8;
}

uint64_t ___ZN21VinylICECommunication17freeTransportSyncEP26TelephonyUtilTransport_tag_block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 24) = 1;
  return result;
}

uint64_t ___ZN21VinylICECommunication17freeTransportSyncEP26TelephonyUtilTransport_tag_block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  *(unsigned char *)(v1 + 24) = 0;
  if (*(unsigned char *)(result + 48))
  {
    *(void *)(v1 + 48) = 0;
  }
  else
  {
    uint64_t v2 = result;
    uint64_t result = gBBULogMaskGet();
    if ((*(unsigned char *)result & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0) {
      return _BBULog(2, 0, "BBUICE16Communication", "", "fail to free transport: %p\n", v3, v4, v5, *(void *)(v2 + 40));
    }
  }
  return result;
}

uint64_t VinylICECommunication::openChannel()
{
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "BBUICE16Communication", "", " Initializing KTL options struct, opening ARI channel\n", v0, v1, v2, v10);
  IceAriGetContext();
  pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  uint64_t v3 = (BBUCapabilities *)xmmword_26A9A0D30;
  if (!(void)xmmword_26A9A0D30)
  {
    BBUCapabilities::create_default_global(&v10);
    long long v4 = v10;
    long long v10 = 0uLL;
    uint64_t v5 = (std::__shared_weak_count *)*((void *)&xmmword_26A9A0D30 + 1);
    xmmword_26A9A0D30 = v4;
    if (v5)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
      if (*((void *)&v10 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v10 + 1));
      }
    }
    uint64_t v3 = (BBUCapabilities *)xmmword_26A9A0D30;
  }
  uint64_t v6 = (std::__shared_weak_count *)*((void *)&xmmword_26A9A0D30 + 1);
  if (*((void *)&xmmword_26A9A0D30 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_26A9A0D30 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  BBUCapabilities::getARICommandTimeout(v3);
  char v7 = KTLInitOptions();
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  if (v7)
  {
    IceAriGetContext();
    int v8 = KTLOpenChannel();
    IceAriSetContextValid(1);
    if (v8) {
      return 0;
    }
    else {
      return 11;
    }
  }
  else
  {
    IceAriSetContextValid(1);
    return 11;
  }
}

void sub_263872AB0(_Unwind_Exception *a1)
{
}

void IceAriSetContextValid(char a1)
{
  pthread_mutex_lock(&ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance);
  uint64_t v2 = off_26A9A0CE0;
  if (!off_26A9A0CE0)
  {
    uint64_t v3 = operator new(0x28uLL);
    v3[32] = 0;
    std::shared_ptr<ICEARIContext>::shared_ptr[abi:ne180100]<ICEARIContext,void>(&v7, (uint64_t)v3);
    long long v4 = v7;
    long long v7 = 0uLL;
    uint64_t v5 = (std::__shared_weak_count *)*(&off_26A9A0CE0 + 1);
    off_26A9A0CE0 = v4;
    if (v5)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
      if (*((void *)&v7 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v7 + 1));
      }
    }
    uint64_t v2 = off_26A9A0CE0;
  }
  uint64_t v6 = (std::__shared_weak_count *)*(&off_26A9A0CE0 + 1);
  if (*(&off_26A9A0CE0 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A9A0CE0 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance);
  *(unsigned char *)(v2 + 32) = a1;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void sub_263872BAC(_Unwind_Exception *a1)
{
}

uint64_t VinylICECommunication::createTransport(uint64_t a1, uint64_t a2)
{
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2000000000;
  int v37 = 3;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2000000000;
  char v33 = 0;
  TelephonyBasebandPCITransportInitParameters();
  if (*(void *)(a1 + 48))
  {
    if ((*(unsigned char *)gBBULogMaskGet() & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0) {
      _BBULog(2, 0, "BBUICE16Communication", "", "Need to free transport before creating again", v4, v5, v6, v17);
    }
    (*(void (**)(uint64_t, void))(*(void *)a1 + 40))(a1, *(void *)(a1 + 48));
    *(void *)(a1 + 48) = 0;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  LODWORD(v28) = v28 | 1;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 0x40000000;
  v25[2] = ___ZN21VinylICECommunication15createTransportEP26TelephonyUtilTransport_tag_block_invoke;
  v25[3] = &__block_descriptor_tmp_12;
  v25[4] = a2;
  *((void *)&v26 + 1) = v7;
  *(void *)&long long v27 = v25;
  if ((*(unsigned char *)gBBULogMaskGet() & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0) {
    _BBULog(2, 0, "BBUICE16Communication", "", "Creating transport:%p \n", v8, v9, v10, a2);
  }
  LODWORD(v26) = 8;
  DWORD2(v27) = 10000;
  *(_DWORD *)(a1 + 56) = 8;
  if ((*(unsigned char *)gBBULogMaskGet() & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0) {
    _BBULog(2, 0, "BBUICE16Communication", "", "Creating with timeout set to %u ms\n", v11, v12, v13, SBYTE8(v27));
  }
  CFStringRef v14 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN21VinylICECommunication15createTransportEP26TelephonyUtilTransport_tag_block_invoke_2;
  block[3] = &unk_2655D77A0;
  block[6] = a1;
  block[7] = a2;
  long long v21 = v28;
  long long v22 = v29;
  long long v23 = v30;
  uint64_t v24 = v31;
  long long v19 = v26;
  long long v20 = v27;
  block[4] = v32;
  void block[5] = &v34;
  dispatch_sync(v14, block);
  uint64_t v15 = *((unsigned int *)v35 + 6);
  if (v26 == 8 && !v15)
  {
    uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2);
    *((_DWORD *)v35 + 6) = v15;
  }
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v34, 8);
  return v15;
}

void sub_263872E98(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

const void **___ZN21VinylICECommunication15createTransportEP26TelephonyUtilTransport_tag_block_invoke(uint64_t a1, uint64_t a2)
{
  return VinylICECommunication::statusCallback(*(void *)(a1 + 32), a2, a2);
}

unsigned char *___ZN21VinylICECommunication15createTransportEP26TelephonyUtilTransport_tag_block_invoke_2(void *a1)
{
  uint64_t v2 = a1[6];
  *(void *)(v2 + 48) = a1[7];
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = TelephonyBasebandPCITransportCreate();
  uint64_t result = (unsigned char *)gBBULogMaskGet();
  if ((*result & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
  {
    if (*(unsigned char *)(*(void *)(a1[4] + 8) + 24)) {
      uint64_t v7 = "success";
    }
    else {
      uint64_t v7 = "failure";
    }
    uint64_t result = (unsigned char *)_BBULog(2, 0, "BBUICE16Communication", "", " TelephonyBasebandPCITransportCreate returns: %s\n", v4, v5, v6, (char)v7);
  }
  if (*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
  {
    if (!*(void *)(v2 + 48))
    {
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 67, "/Library/Caches/com.apple.xbs/Sources/VinylRestore/Communication/ICE/VinylICECommunication.cpp", 0x82u, (ctu::LogMessageBuffer *)"Assertion failure(nullptr != fTransportCreated && \"Telephony util transport error.\")", v10, v11, v12, v13);
    }
    int v8 = 0;
  }
  else
  {
    uint64_t result = (unsigned char *)VinylICECommunication::freeTransportSync(v2, a1[7]);
    int v8 = 3;
  }
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = v8;
  return result;
}

void sub_263872FFC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void VinylICECommunication::closeChannel(VinylICECommunication *this)
{
  if (IceAriGetContextValid())
  {
    IceAriGetContext();
    KTLCloseChannel();
    IceAriSetContextValid(0);
  }
}

BOOL IceAriGetContextValid(void)
{
  pthread_mutex_lock(&ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance);
  uint64_t v0 = off_26A9A0CE0;
  if (!off_26A9A0CE0)
  {
    uint64_t v1 = operator new(0x28uLL);
    v1[32] = 0;
    std::shared_ptr<ICEARIContext>::shared_ptr[abi:ne180100]<ICEARIContext,void>(&v7, (uint64_t)v1);
    long long v2 = v7;
    long long v7 = 0uLL;
    uint64_t v3 = (std::__shared_weak_count *)*(&off_26A9A0CE0 + 1);
    off_26A9A0CE0 = v2;
    if (v3)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
      if (*((void *)&v7 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v7 + 1));
      }
    }
    uint64_t v0 = off_26A9A0CE0;
  }
  uint64_t v4 = (std::__shared_weak_count *)*(&off_26A9A0CE0 + 1);
  if (*(&off_26A9A0CE0 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A9A0CE0 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance);
  int v5 = *(unsigned __int8 *)(v0 + 32);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return v5 != 0;
}

void sub_263873114(_Unwind_Exception *a1)
{
}

uint64_t VinylICECommunication::freeTransport(void *a1, uint64_t a2)
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  char v14 = 1;
  if ((*(unsigned char *)gBBULogMaskGet() & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0) {
    _BBULog(2, 0, "BBUICE16Communication", "", "request to free transport: %p\n", v4, v5, v6, a2);
  }
  (*(void (**)(void *))(*a1 + 32))(a1);
  long long v7 = a1[4];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN21VinylICECommunication13freeTransportEP26TelephonyUtilTransport_tag_block_invoke;
  block[3] = &unk_2655D77C8;
  block[4] = &v11;
  void block[5] = a1;
  block[6] = a2;
  dispatch_sync(v7, block);
  uint64_t v8 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

void sub_26387325C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN21VinylICECommunication13freeTransportEP26TelephonyUtilTransport_tag_block_invoke(void *a1)
{
  uint64_t result = VinylICECommunication::freeTransportSync(a1[5], a1[6]);
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

void VinylICECommunication::~VinylICECommunication(VinylICECommunication *this)
{
  VinylICECommunication::~VinylICECommunication(this);

  operator delete(v1);
}

{
  NSObject *v2;
  NSObject *v3;
  uint64_t vars8;

  *(void *)this = &unk_270EB4C98;
  long long v2 = *((void *)this + 5);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *((void *)this + 4);
  if (v3) {
    dispatch_release(v3);
  }

  VinylCommunication::~VinylCommunication(this);
}

uint64_t __cxx_global_var_init_3()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_263869000);
  }
  return result;
}

uint64_t __cxx_global_var_init_21()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_263869000);
  }
  return result;
}

const void **VinylEURCommunication::statusCallback(char a1, uint64_t a2, int a3)
{
  uint64_t result = (const void **)gBBULogMaskGet();
  if ((*(unsigned char *)result & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0) {
    uint64_t result = (const void **)_BBULog(0, 0, "VinylEURCommunication", "", "transport %p, status: %#x\n", v6, v7, v8, a1);
  }
  if (a3 == 1)
  {
    uint64_t Controller = TelephonyBasebandCreateController();
    int v9 = TelephonyBasebandResetModem();
    if ((*(unsigned char *)gBBULogMaskGet() & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    {
      uint64_t v13 = "failure";
      if (v9) {
        uint64_t v13 = "success";
      }
      _BBULog(2, 0, "VinylEURCommunication", "", "Resetting modem: %s\n", v10, v11, v12, (char)v13);
    }
    return ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef((const void **)&Controller);
  }
  return result;
}

void sub_2638734B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t VinylEURCommunication::freeTransportSync(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2) {
    return 1;
  }
  if (v2 == a2)
  {
    uint64_t v8 = TelephonyUtilTransportFree();
    int v9 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN21VinylEURCommunication17freeTransportSyncEP26TelephonyUtilTransport_tag_block_invoke;
    block[3] = &__block_descriptor_tmp_1;
    char v12 = v8;
    block[4] = a1;
    void block[5] = a2;
    dispatch_sync(v9, block);
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)gBBULogMaskGet() & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    {
      _BBULog(0, 0, "VinylEURCommunication", "", "call with %p different from fTransportCreated(%p)\n", v5, v6, v7, a2);
      return 0;
    }
  }
  return v8;
}

uint64_t ___ZN21VinylEURCommunication17freeTransportSyncEP26TelephonyUtilTransport_tag_block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 48))
  {
    *(void *)(*(void *)(result + 32) + 40) = 0;
  }
  else
  {
    uint64_t result = gBBULogMaskGet();
    if ((*(unsigned char *)result & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0) {
      return _BBULog(0, 0, "VinylEURCommunication", "", "fail to free transport: %p\n", v2, v3, v4, *(void *)(v1 + 40));
    }
  }
  return result;
}

uint64_t VinylEURCommunication::openChannel()
{
  return 0;
}

uint64_t VinylEURCommunication::createTransport(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2000000000;
  int v38 = 3;
  if (capabilities::diag::preferredInterface((capabilities::diag *)a1) == 8)
  {
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2000000000;
    char v34 = 0;
    TelephonyBasebandPCITransportInitParameters();
    if (*(void *)(a1 + 40))
    {
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 67, "/Library/Caches/com.apple.xbs/Sources/VinylRestore/Communication/Eureka/VinylEURCommunication.cpp", 0x59u, (ctu::LogMessageBuffer *)"Assertion failure(nullptr == fTransportCreated && \"Telephony transport error.\")", v15, v16, v17, v18);
    }
    uint64_t v4 = *(void *)(a1 + 32);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 0x40000000;
    v26[2] = ___ZN21VinylEURCommunication15createTransportEP26TelephonyUtilTransport_tag_block_invoke;
    v26[3] = &__block_descriptor_tmp_11;
    v26[4] = a2;
    *((void *)&v27 + 1) = v4;
    *(void *)&long long v28 = v26;
    if ((*(unsigned char *)gBBULogMaskGet() & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0) {
      _BBULog(0, 0, "VinylEURCommunication", "", "Creating transport:%p \n", v5, v6, v7, a2);
    }
    LODWORD(v27) = 2;
    DWORD2(v28) = 2000;
    *(_DWORD *)(a1 + 48) = 2;
    if ((*(unsigned char *)gBBULogMaskGet() & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0) {
      _BBULog(0, 0, "VinylEURCommunication", "", "Creating with timeout set to %u ms\n", v8, v9, v10, SBYTE8(v28));
    }
    uint64_t v11 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN21VinylEURCommunication15createTransportEP26TelephonyUtilTransport_tag_block_invoke_2;
    block[3] = &unk_2655D7830;
    void block[6] = a1;
    void block[7] = a2;
    long long v22 = v29;
    long long v23 = v30;
    long long v24 = v31;
    uint64_t v25 = v32;
    long long v20 = v27;
    long long v21 = v28;
    block[4] = v33;
    void block[5] = &v35;
    dispatch_sync(v11, block);
    _Block_object_dispose(v33, 8);
  }
  uint64_t v12 = *((unsigned int *)v36 + 6);
  _Block_object_dispose(&v35, 8);
  return v12;
}

void sub_2638738C4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Block_object_dispose((const void *)(v2 - 112), 8);
  _Block_object_dispose((const void *)(v2 - 80), 8);
  _Unwind_Resume(a1);
}

const void **___ZN21VinylEURCommunication15createTransportEP26TelephonyUtilTransport_tag_block_invoke(uint64_t a1, uint64_t a2)
{
  return VinylEURCommunication::statusCallback(*(void *)(a1 + 32), a2, a2);
}

unsigned char *___ZN21VinylEURCommunication15createTransportEP26TelephonyUtilTransport_tag_block_invoke_2(void *a1)
{
  uint64_t v2 = a1[6];
  *(void *)(v2 + 40) = a1[7];
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = TelephonyBasebandPCITransportCreate();
  uint64_t result = (unsigned char *)gBBULogMaskGet();
  if ((*result & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
  {
    if (*(unsigned char *)(*(void *)(a1[4] + 8) + 24)) {
      uint64_t v7 = "success";
    }
    else {
      uint64_t v7 = "failure";
    }
    uint64_t result = (unsigned char *)_BBULog(0, 0, "VinylEURCommunication", "", " TelephonyBasebandPCITransportCreate returns: %s\n", v4, v5, v6, (char)v7);
  }
  if (*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
  {
    if (!*(void *)(v2 + 40))
    {
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 67, "/Library/Caches/com.apple.xbs/Sources/VinylRestore/Communication/Eureka/VinylEURCommunication.cpp", 0x76u, (ctu::LogMessageBuffer *)"Assertion failure(nullptr != fTransportCreated && \"Telephony Util transport error!\\n\")", v10, v11, v12, v13);
    }
    int v8 = 0;
  }
  else
  {
    uint64_t result = (unsigned char *)VinylEURCommunication::freeTransportSync(v2, a1[7]);
    int v8 = 3;
  }
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = v8;
  return result;
}

void sub_263873A40(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t VinylEURCommunication::freeTransport(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  char v14 = 1;
  if ((*(unsigned char *)gBBULogMaskGet() & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0) {
    _BBULog(0, 0, "VinylEURCommunication", "", "request to free transport: %p\n", v4, v5, v6, a2);
  }
  uint64_t v7 = *(NSObject **)(a1 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN21VinylEURCommunication13freeTransportEP26TelephonyUtilTransport_tag_block_invoke;
  block[3] = &unk_2655D7858;
  block[4] = &v11;
  void block[5] = a1;
  void block[6] = a2;
  dispatch_sync(v7, block);
  uint64_t v8 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

void sub_263873B54(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN21VinylEURCommunication13freeTransportEP26TelephonyUtilTransport_tag_block_invoke(void *a1)
{
  uint64_t result = VinylEURCommunication::freeTransportSync(a1[5], a1[6]);
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

void VinylEURCommunication::~VinylEURCommunication(VinylEURCommunication *this)
{
  VinylEURCommunication::~VinylEURCommunication(this);

  operator delete(v1);
}

{
  NSObject *v2;
  NSObject *v3;
  uint64_t vars8;

  *(void *)this = &unk_270EB4CF0;
  uint64_t v2 = *((void *)this + 4);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *((void *)this + 3);
  if (v3) {
    dispatch_release(v3);
  }

  VinylCommunication::~VinylCommunication(this);
}

uint64_t Options::Options(uint64_t a1, const __CFDictionary **a2)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  *(_DWORD *)a1 = 255;
  uint64_t v4 = a1 + 16;
  *(void *)(a1 + 4) = 0;
  std::string::basic_string[abi:ne180100]<0>((void *)(a1 + 16), "");
  *(_WORD *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 42) = 0;
  uint64_t v5 = (void **)(a1 + 48);
  std::string::basic_string[abi:ne180100]<0>((void *)(a1 + 48), "");
  *(unsigned char *)(a1 + 72) = 0;
  uint64_t v6 = (void **)(a1 + 80);
  std::string::basic_string[abi:ne180100]<0>((void *)(a1 + 80), "");
  uint64_t v7 = (void **)(a1 + 104);
  std::string::basic_string[abi:ne180100]<0>((void *)(a1 + 104), "");
  if (*a2) {
    uint64_t v8 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    uint64_t v8 = 0;
  }
  if (v8)
  {
    ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v38, *a2);
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(*a2, @"BasebandUpdater");
    ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v37, Value);
    *(unsigned char *)(a1 + 11) = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v37, @"VinylForceGold");
    *(unsigned char *)(a1 + 10) = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v37, @"VinylForceMain");
    ctu::cf::map_adapter::getString();
    if (*(char *)(a1 + 39) < 0) {
      operator delete(*(void **)v4);
    }
    *(_OWORD *)uint64_t v4 = *(_OWORD *)__p;
    *(void *)(v4 + 16) = v40;
    ctu::cf::map_adapter::getString();
    if (*(char *)(a1 + 71) < 0) {
      operator delete(*v5);
    }
    *(_OWORD *)uint64_t v5 = *(_OWORD *)__p;
    *(void *)(a1 + 64) = v40;
    *(unsigned char *)(a1 + 72) = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v38, @"VinylTwoPhasePresenceCheck");
    ctu::cf::map_adapter::getString();
    if (*(char *)(a1 + 103) < 0) {
      operator delete(*v6);
    }
    *(_OWORD *)uint64_t v6 = *(_OWORD *)__p;
    *(void *)(a1 + 96) = v40;
    ctu::cf::map_adapter::getString();
    if (*(char *)(a1 + 127) < 0) {
      operator delete(*v7);
    }
    *(_OWORD *)uint64_t v7 = *(_OWORD *)__p;
    *(void *)(a1 + 120) = v40;
    if (*(char *)(a1 + 127) < 0)
    {
      uint64_t v11 = *(char **)(a1 + 104);
      uint64_t v10 = *(void *)(a1 + 112);
    }
    else
    {
      uint64_t v10 = *(unsigned __int8 *)(a1 + 127);
      uint64_t v11 = (char *)(a1 + 104);
    }
    uint64_t v12 = std::remove_if[abi:ne180100]<std::__wrap_iter<char *>,int (*)(int)>(v11, &v11[v10], (unsigned int (*)(void))isblank);
    if (*(char *)(a1 + 127) < 0)
    {
      uint64_t v14 = *(void *)(a1 + 104);
      uint64_t v13 = (char *)(v14 + *(void *)(a1 + 112));
    }
    else
    {
      uint64_t v13 = (char *)v7 + *(unsigned __int8 *)(a1 + 127);
      uint64_t v14 = a1 + 104;
    }
    std::string::erase((std::string *)(a1 + 104), (std::string::size_type)&v12[-v14], v13 - v12);
    if (*(char *)(a1 + 127) < 0)
    {
      uint64_t v16 = *(char **)(a1 + 104);
      uint64_t v15 = *(void *)(a1 + 112);
    }
    else
    {
      uint64_t v15 = *(unsigned __int8 *)(a1 + 127);
      uint64_t v16 = (char *)(a1 + 104);
    }
    uint64_t v17 = std::remove_if[abi:ne180100]<std::__wrap_iter<char *>,int (*)(int)>(v16, &v16[v15], (unsigned int (*)(void))iscntrl);
    if (*(char *)(a1 + 127) < 0)
    {
      uint64_t v19 = *(void *)(a1 + 104);
      char v18 = (char *)(v19 + *(void *)(a1 + 112));
    }
    else
    {
      char v18 = (char *)v7 + *(unsigned __int8 *)(a1 + 127);
      uint64_t v19 = a1 + 104;
    }
    std::string::erase((std::string *)(a1 + 104), (std::string::size_type)&v17[-v19], v18 - v17);
    if (ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v37, @"VinylSkipAll")) {
      char v20 = 1;
    }
    else {
      char v20 = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v38, @"UpdateBaseband") ^ 1;
    }
    *(unsigned char *)(a1 + 8) = v20;
    *(unsigned char *)(a1 + 9) = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v37, @"VinylOnlyPerso");
    if (ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v37, @"VinylUse4FF")) {
      *(_DWORD *)a1 = 1;
    }
    if (BBUpdaterCommon::isNVRAMKeyPresent(@"VinylForceGenericUpdate", v21)) {
      *(_WORD *)(a1 + 10) = 257;
    }
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v40 = 0;
    ctu::cf::map_adapter::getString();
    if (SHIBYTE(v40) < 0) {
      operator delete(__p[0]);
    }
    unint64_t v22 = v36;
    unsigned __int8 v23 = v36;
    if ((v36 & 0x80u) != 0) {
      unint64_t v22 = (unint64_t)v35[1];
    }
    if (v22)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "Bootstrap");
      int v41 = 1;
      std::string::basic_string[abi:ne180100]<0>(v42, "All");
      int v43 = 2;
      std::string::basic_string[abi:ne180100]<0>(v44, "Bootstrap Preferences");
      int v45 = 3;
      std::string::basic_string[abi:ne180100]<0>(v46, "All Preferences");
      int v47 = 4;
      std::map<std::string,VinylRefurbAction,BBUpdaterCommon::case_insensitive_key_comparer,std::allocator<std::pair<std::string const,VinylRefurbAction>>>::map[abi:ne180100]((uint64_t)v33, (uint64_t)__p, 4);
      for (uint64_t i = 0; i != -16; i -= 4)
      {
        if (SHIBYTE(v46[i + 2]) < 0) {
          operator delete((void *)v46[i]);
        }
      }
      uint64_t v25 = std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::find<std::string>((uint64_t)v33, (uint64_t)v35);
      if (&v34 == (char **)v25)
      {
        exception = __cxa_allocate_exception(0x210uLL);
        long long v31 = exception;
        uint64_t v32 = v35;
        if ((v36 & 0x80u) != 0) {
          LOBYTE(v32) = v35[0];
        }
        _BBUException::_BBUException((uint64_t)exception, 2, "/Library/Caches/com.apple.xbs/Sources/VinylRestore/Options/eUICCOptions.cpp", 0x4Bu, (ctu::LogMessageBuffer *)"Invalid Refurb Option %s", v28, v29, v30, (char)v32);
      }
      *(_DWORD *)(a1 + 4) = *(_DWORD *)(v25 + 56);
      std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::destroy((uint64_t)v33, v34);
      unsigned __int8 v23 = v36;
    }
    if ((v23 & 0x80) != 0) {
      operator delete(v35[0]);
    }
    MEMORY[0x263E6C510](v37);
    MEMORY[0x263E6C510](v38);
  }
  return a1;
}

void sub_26387418C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, char *a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  __cxa_free_exception(v35);
  std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::destroy((uint64_t)&a12, a13);
  if (a20 < 0) {
    operator delete(__p);
  }
  MEMORY[0x263E6C510](&a21);
  MEMORY[0x263E6C510](&a23);
  if (v30[127] < 0) {
    operator delete(*v34);
  }
  if (v30[103] < 0) {
    operator delete(*v33);
  }
  if (v30[71] < 0) {
    operator delete(*v32);
  }
  if (v30[39] < 0) {
    operator delete(*v31);
  }
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get(uint64_t a1)
{
  return *(void *)a1;
}

char *std::remove_if[abi:ne180100]<std::__wrap_iter<char *>,int (*)(int)>(char *a1, char *a2, unsigned int (*a3)(void))
{
  if (a1 == a2) {
    return a2;
  }
  uint64_t v5 = a1;
  while (!a3(*v5))
  {
    if (++v5 == a2) {
      return a2;
    }
  }
  if (v5 != a2)
  {
    for (uint64_t i = v5 + 1; i != a2; ++i)
    {
      if (!a3(*i)) {
        *v5++ = *i;
      }
    }
  }
  return v5;
}

int isblank(int _c)
{
  if (_c <= 0x7F) {
    int v1 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * _c + 60) & 0x20000;
  }
  else {
    int v1 = __maskrune(_c, 0x20000uLL);
  }
  return v1 != 0;
}

int iscntrl(int _c)
{
  if (_c <= 0x7F) {
    int v1 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * _c + 60) & 0x200;
  }
  else {
    int v1 = __maskrune(_c, 0x200uLL);
  }
  return v1 != 0;
}

void *Options::StringifyPostProcess@<X0>(int a1@<W1>, void *a2@<X8>)
{
  if ((a1 - 1) > 3) {
    uint64_t v2 = "No Action";
  }
  else {
    uint64_t v2 = off_2655D7878[a1 - 1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

uint64_t Options::ToString(Options *this)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v59);
  uint64_t v2 = v59[0];
  *(_DWORD *)((char *)&v59[1] + *(void *)(v59[0] - 24)) |= 1u;
  *(_DWORD *)((char *)&v59[1] + *(void *)(v2 - 24)) = *(_DWORD *)((unsigned char *)&v59[1] + *(void *)(v2 - 24)) & 0xFFFFFFB5 | 8;
  uint64_t v3 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v59, (uint64_t)"=========== Vinyl eUICC Options ============\n", 45);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)"uimSlot               ", 22);
  uint64_t v4 = (void *)std::ostream::operator<<();
  uint64_t v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"skipAll               ", 22);
  uint64_t v6 = (void *)std::ostream::operator<<();
  uint64_t v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)"onlyPerso             ", 22);
  uint64_t v8 = (void *)std::ostream::operator<<();
  uint64_t v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"forceMain             ", 22);
  uint64_t v10 = (void *)std::ostream::operator<<();
  uint64_t v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"forceGold             ", 22);
  uint64_t v12 = (void *)std::ostream::operator<<();
  uint64_t v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"forcePerso            ", 22);
  uint64_t v14 = (void *)std::ostream::operator<<();
  uint64_t v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)"\n", 1);
  uint64_t v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"alderHost             ", 22);
  int v17 = *((char *)this + 39);
  if (v17 >= 0) {
    char v18 = (char *)this + 16;
  }
  else {
    char v18 = (char *)*((void *)this + 2);
  }
  if (v17 >= 0) {
    uint64_t v19 = *((unsigned __int8 *)this + 39);
  }
  else {
    uint64_t v19 = *((void *)this + 3);
  }
  char v20 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)v18, v19);
  CFStringRef v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)"persoStatic           ", 22);
  unint64_t v22 = (void *)std::ostream::operator<<();
  unsigned __int8 v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)"internalBuild         ", 22);
  long long v24 = (void *)std::ostream::operator<<();
  uint64_t v25 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)"\n", 1);
  long long v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)"postProcess           ", 22);
  unsigned int v27 = *((_DWORD *)this + 1) - 1;
  if (v27 > 3) {
    uint64_t v28 = "No Action";
  }
  else {
    uint64_t v28 = off_2655D7878[v27];
  }
  std::string::basic_string[abi:ne180100]<0>(__p, v28);
  if ((v58 & 0x80u) == 0) {
    uint64_t v29 = __p;
  }
  else {
    uint64_t v29 = (void **)__p[0];
  }
  if ((v58 & 0x80u) == 0) {
    uint64_t v30 = v58;
  }
  else {
    uint64_t v30 = (uint64_t)__p[1];
  }
  long long v31 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)v29, v30);
  uint64_t v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)"\n", 1);
  char v33 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)"twoPhaseRefurbRef     ", 22);
  int v34 = *((char *)this + 127);
  if (v34 >= 0) {
    uint64_t v35 = (char *)this + 104;
  }
  else {
    uint64_t v35 = (char *)*((void *)this + 13);
  }
  if (v34 >= 0) {
    uint64_t v36 = *((unsigned __int8 *)this + 127);
  }
  else {
    uint64_t v36 = *((void *)this + 14);
  }
  uint64_t v37 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, (uint64_t)v35, v36);
  int v38 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v37, (uint64_t)"\n", 1);
  std::string v39 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v38, (uint64_t)"twoPhaseUrl           ", 22);
  int v40 = *((char *)this + 71);
  if (v40 >= 0) {
    int v41 = (char *)this + 48;
  }
  else {
    int v41 = (char *)*((void *)this + 6);
  }
  if (v40 >= 0) {
    uint64_t v42 = *((unsigned __int8 *)this + 71);
  }
  else {
    uint64_t v42 = *((void *)this + 7);
  }
  int v43 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v39, (uint64_t)v41, v42);
  CFURLRef v44 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v43, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v44, (uint64_t)"twoPhasePresenceCheck ", 22);
  int v45 = (void *)std::ostream::operator<<();
  std::string v46 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v45, (uint64_t)"\n", 1);
  int v47 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v46, (uint64_t)"twoPhaseEidMask       ", 22);
  uint64_t v50 = *((void *)this + 10);
  uint64_t v49 = (char *)this + 80;
  uint64_t v48 = v50;
  int v51 = v49[23];
  if (v51 >= 0) {
    uint64_t v52 = (uint64_t)v49;
  }
  else {
    uint64_t v52 = v48;
  }
  if (v51 >= 0) {
    uint64_t v53 = v49[23];
  }
  else {
    uint64_t v53 = *((void *)v49 + 1);
  }
  uint64_t v54 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v47, v52, v53);
  uint64_t v55 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v54, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v55, (uint64_t)"======================================\n", 39);
  if ((char)v58 < 0) {
    operator delete(__p[0]);
  }
  std::stringbuf::str();
  v59[0] = *MEMORY[0x263F8C2C8];
  *(void *)((char *)v59 + *(void *)(v59[0] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  v59[1] = MEMORY[0x263F8C318] + 16;
  if (v60 < 0) {
    operator delete((void *)v59[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x263E6CAB0](&v61);
}

void sub_2638748E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
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

void sub_263874A88(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x263E6CAB0](v1);
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
  MEMORY[0x263E6CAB0](a1 + 112);
  return a1;
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
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

uint64_t std::map<std::string,VinylRefurbAction,BBUpdaterCommon::case_insensitive_key_comparer,std::allocator<std::pair<std::string const,VinylRefurbAction>>>::map[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  size_t v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 32 * a3;
    do
    {
      std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,VinylRefurbAction> const&>((uint64_t **)a1, v4, a2, a2);
      a2 += 32;
      v6 -= 32;
    }
    while (v6);
  }
  return a1;
}

void sub_263874CD0(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,VinylRefurbAction> const&>(uint64_t **a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (uint64_t **)std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__find_equal<std::string>(a1, a2, &v10, &v9, a3);
  uint64_t result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__construct_node<std::pair<std::string const,VinylRefurbAction> const&>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__insert_node_at(a1, (uint64_t)v10, v6, v8);
    return v8;
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__find_equal<std::string>(uint64_t **a1, uint64_t *a2, uint64_t **a3, uint64_t **a4, uint64_t a5)
{
  uint64_t v9 = a1 + 1;
  if (a1 + 1 == (uint64_t **)a2
    || (*(char *)(a5 + 23) >= 0 ? (uint64_t v11 = (const char *)a5) : (uint64_t v11 = *(const char **)a5),
        *((char *)a2 + 55) >= 0 ? (uint64_t v12 = (const char *)(a2 + 4)) : (uint64_t v12 = (const char *)a2[4]),
        strcasecmp(v11, v12) < 0))
  {
    uint64_t v13 = (uint64_t *)*a2;
    if (*a1 == a2)
    {
      uint64_t v15 = a2;
LABEL_29:
      if (v13)
      {
        *a3 = v15;
        return v15 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v13)
    {
      uint64_t v14 = (uint64_t *)*a2;
      do
      {
        uint64_t v15 = v14;
        uint64_t v14 = (uint64_t *)v14[1];
      }
      while (v14);
    }
    else
    {
      char v18 = a2;
      do
      {
        uint64_t v15 = (uint64_t *)v18[2];
        BOOL v19 = *v15 == (void)v18;
        char v18 = v15;
      }
      while (v19);
    }
    if (*((char *)v15 + 55) >= 0) {
      char v20 = (const char *)(v15 + 4);
    }
    else {
      char v20 = (const char *)v15[4];
    }
    if (*(char *)(a5 + 23) >= 0) {
      CFStringRef v21 = (const char *)a5;
    }
    else {
      CFStringRef v21 = *(const char **)a5;
    }
    if (strcasecmp(v20, v21) < 0) {
      goto LABEL_29;
    }
  }
  else
  {
    if ((strcasecmp(v12, v11) & 0x80000000) == 0)
    {
      *a3 = a2;
      *a4 = a2;
      return (uint64_t *)a4;
    }
    uint64_t v16 = a2[1];
    if (v16)
    {
      int v17 = (uint64_t *)a2[1];
      do
      {
        a4 = (uint64_t **)v17;
        int v17 = (uint64_t *)*v17;
      }
      while (v17);
    }
    else
    {
      unint64_t v22 = a2;
      do
      {
        a4 = (uint64_t **)v22[2];
        BOOL v19 = *a4 == v22;
        unint64_t v22 = (uint64_t *)a4;
      }
      while (!v19);
    }
    if (a4 == v9
      || (*((char *)a4 + 55) >= 0 ? (unsigned __int8 v23 = (const char *)(a4 + 4)) : (unsigned __int8 v23 = (const char *)a4[4]),
          strcasecmp(v11, v23) < 0))
    {
      if (v16)
      {
        *a3 = (uint64_t *)a4;
      }
      else
      {
        *a3 = a2;
        return a2 + 1;
      }
      return (uint64_t *)a4;
    }
  }

  return std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__find_equal<std::string>((uint64_t)a1, a3, a5);
}

void std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__construct_node<std::pair<std::string const,VinylRefurbAction> const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x40uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t v7 = (std::string *)(v6 + 32);
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    *((void *)v6 + 6) = *(void *)(a2 + 16);
  }
  *((_DWORD *)v6 + 14) = *(_DWORD *)(a2 + 24);
  *(unsigned char *)(a3 + 16) = 1;
}

void sub_263874FE4(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,VinylRefurbAction>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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
  uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void *std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__find_equal<std::string>(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  size_t v4 = *(void **)(a1 + 8);
  if (v4)
  {
    if (*(char *)(a3 + 23) >= 0) {
      uint64_t v6 = (const char *)a3;
    }
    else {
      uint64_t v6 = *(const char **)a3;
    }
    do
    {
      while (1)
      {
        uint64_t v7 = v4;
        uint64_t v10 = (void *)v4[4];
        uint64_t v8 = v4 + 4;
        uint64_t v9 = v10;
        uint64_t v11 = (const char *)(*((char *)v8 + 23) >= 0 ? v8 : v9);
        if ((strcasecmp(v6, v11) & 0x80000000) == 0) {
          break;
        }
        size_t v4 = (void *)*v7;
        uint64_t v5 = v7;
        if (!*v7) {
          goto LABEL_15;
        }
      }
      if ((strcasecmp(v11, v6) & 0x80000000) == 0) {
        break;
      }
      uint64_t v5 = v7 + 1;
      size_t v4 = (void *)v7[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v7 = (void *)(a1 + 8);
  }
LABEL_15:
  *a2 = v7;
  return v5;
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
      size_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (unsigned char *)(v7 + 24), v8))
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
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), uint64_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
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
        *uint64_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *uint64_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,VinylRefurbAction>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
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

void std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::destroy(a1, *(void *)a2);
    std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::destroy(a1, *((void *)a2 + 1));
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }
}

uint64_t std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::find<std::string>(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 8;
  uint64_t v4 = std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__lower_bound<std::string>(a1, a2, *(void *)(a1 + 8), a1 + 8);
  if (v3 == v4) {
    return v3;
  }
  uint64_t v5 = v4;
  int v6 = *(char *)(a2 + 23) >= 0 ? (const char *)a2 : *(const char **)a2;
  uint64_t v7 = *(char *)(v5 + 55) >= 0 ? (const char *)(v5 + 32) : *(const char **)(v5 + 32);
  if (strcasecmp(v6, v7) < 0) {
    return v3;
  }
  return v5;
}

uint64_t std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__lower_bound<std::string>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t v5 = a3;
    if (*(char *)(a2 + 23) >= 0) {
      int v6 = (const char *)a2;
    }
    else {
      int v6 = *(const char **)a2;
    }
    do
    {
      if (*(char *)(v5 + 55) >= 0) {
        uint64_t v7 = (const char *)(v5 + 32);
      }
      else {
        uint64_t v7 = *(const char **)(v5 + 32);
      }
      int v8 = strcasecmp(v7, v6);
      uint64_t v9 = (uint64_t *)(v5 + 8);
      if (v8 >= 0)
      {
        uint64_t v9 = (uint64_t *)v5;
        a4 = v5;
      }
      uint64_t v5 = *v9;
    }
    while (*v9);
  }
  return a4;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x263E6C8A0](v13, a1);
  if (v13[0])
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
  MEMORY[0x263E6C8B0](v13);
  return a1;
}

void sub_26387558C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x263E6C8B0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x26387556CLL);
}

void sub_2638755E0(_Unwind_Exception *a1)
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
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      uint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_263875760(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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

VinylSecureElement *VinylSecureElement::create(VinylSecureElement *this)
{
  uint64_t v1 = (VinylSecureElement *)operator new(1uLL);
  VinylSecureElement::init(v1);
  return v1;
}

uint64_t VinylSecureElement::init(VinylSecureElement *this)
{
  uint64_t v1 = dlopen("/usr/lib/libnfrestore.dylib", 261);
  if (!v1)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 1, "/Library/Caches/com.apple.xbs/Sources/VinylRestore/SecureElement/VinylSecureElement.cpp", 0x2Eu, (ctu::LogMessageBuffer *)"Assertion failure(lib != __null && \"Could not find /usr/lib/libnfrestore.dylib\")", v5, v6, v7, v17);
    goto LABEL_10;
  }
  uint64_t v2 = v1;
  pfnNfRestoreOpenWithSE = dlsym(v1, "NfRestoreSEOpenWithError");
  if (!pfnNfRestoreOpenWithSE)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 1, "/Library/Caches/com.apple.xbs/Sources/VinylRestore/SecureElement/VinylSecureElement.cpp", 0x31u, (ctu::LogMessageBuffer *)"Assertion failure(pfnNfRestoreOpenWithSE != __null && \"Could not find NfRestoreSEOpenWithError symbol\\n\")", v8, v9, v10, v17);
    goto LABEL_10;
  }
  pfnNfRestoreSEClose = dlsym(v2, "NfRestoreSEClose");
  if (!pfnNfRestoreSEClose)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 1, "/Library/Caches/com.apple.xbs/Sources/VinylRestore/SecureElement/VinylSecureElement.cpp", 0x34u, (ctu::LogMessageBuffer *)"Assertion failure(pfnNfRestoreSEClose != __null && \"Could not find NfRestoreSEClose symbol\\n\")", v11, v12, v13, v17);
    goto LABEL_10;
  }
  pfnNfRestoreDumpUART = (uint64_t)dlsym(v2, "NfRestoreDumpUART");
  if (!pfnNfRestoreDumpUART)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 1, "/Library/Caches/com.apple.xbs/Sources/VinylRestore/SecureElement/VinylSecureElement.cpp", 0x37u, (ctu::LogMessageBuffer *)"Assertion failure(pfnNfRestoreDumpUART != __null && \"Could not find pfnNfRestoreDumpUART symbol\\n\")", v14, v15, v16, v17);
LABEL_10:
  }
  return 0;
}

void sub_2638759AC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t VinylSecureElement::PowerUpSE(VinylSecureElement *this)
{
  int v7 = 0;
  if (pfnNfRestoreOpenWithSE) {
    BOOL v1 = pfnNfRestoreDumpUART == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1) {
    return 0;
  }
  uint64_t v2 = pfnNfRestoreOpenWithSE(0, 0, &v7);
  if (v7)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylSecureElement", "", "pfnNfRestoreOpenWithSE failure, outResult: %d\n", v3, v4, v5, v7);
  }
  __ns.__rep_ = 1000000000;
  std::this_thread::sleep_for (&__ns);
  return v2;
}

uint64_t VinylSecureElement::PowerDownSE(VinylSecureElement *this, void *a2)
{
  if (!pfnNfRestoreSEClose) {
    return 1;
  }
  pfnNfRestoreSEClose(a2);
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylSecureElement", "", "SE closed SUCCESSFULLY\n", v2, v3, v4, vars0);
  return 0;
}

uint64_t _BBUException::_BBUException(uint64_t a1, int a2, char *a3, unsigned int a4, ctu::LogMessageBuffer *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  *(void *)a1 = &unk_270EB4D48;
  *(_DWORD *)(a1 + 520) = a2;
  _BBUException::constructCommon(a1, a2, a3, a4, a5, &a9);
  return a1;
}

{
  *(void *)a1 = &unk_270EB4D48;
  *(_DWORD *)(a1 + 520) = a2;
  _BBUException::constructCommon(a1, a2, a3, a4, a5, &a9);
  return a1;
}

void sub_263875B34(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void _BBUException::constructCommon(uint64_t a1, int a2, char *a3, unsigned int a4, ctu::LogMessageBuffer *this, char *a6)
{
  ctu::LogMessageBuffer::vCreateWithFormat((uint64_t *)&v40, this, a6, a3);
  uint64_t v10 = MEMORY[0x263E6C4B0](&v40);
  long long v11 = *(_OWORD *)v10;
  v42.__r_.__value_.__r.__words[2] = *(void *)(v10 + 16);
  *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v11;
  *(void *)(v10 + 8) = 0;
  *(void *)(v10 + 16) = 0;
  *(void *)uint64_t v10 = 0;
  MEMORY[0x263E6C4D0](&v40);
  std::string::basic_string[abi:ne180100]<0>(&v35, " ");
  uint64_t v12 = BBUReturnAsString(a2);
  uint64_t v13 = std::string::append(&v35, v12);
  long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  v36.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  uint64_t v15 = std::string::append(&v36, "@");
  long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  v37.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v16;
  v15->__r_.__value_.__l.__size_ = 0;
  v15->__r_.__value_.__r.__words[2] = 0;
  v15->__r_.__value_.__r.__words[0] = 0;
  ctu::llvm::StringRef::StringRef((ctu::llvm::StringRef *)&v32, a3);
  ctu::basename();
  if ((v34 & 0x80u) == 0) {
    char v17 = __p;
  }
  else {
    char v17 = (void **)__p[0];
  }
  if ((v34 & 0x80u) == 0) {
    std::string::size_type v18 = v34;
  }
  else {
    std::string::size_type v18 = (std::string::size_type)__p[1];
  }
  BOOL v19 = std::string::append(&v37, (const std::string::value_type *)v17, v18);
  long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  CFStringRef v21 = std::string::append(&v38, ":");
  long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  v39.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v39.__r_.__value_.__l.__data_ = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&v31, a4);
  if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unsigned __int8 v23 = &v31;
  }
  else {
    unsigned __int8 v23 = (std::string *)v31.__r_.__value_.__r.__words[0];
  }
  if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v31.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v31.__r_.__value_.__l.__size_;
  }
  uint64_t v25 = std::string::append(&v39, (const std::string::value_type *)v23, size);
  long long v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
  int64_t v41 = v25->__r_.__value_.__r.__words[2];
  long long v40 = v26;
  v25->__r_.__value_.__l.__size_ = 0;
  v25->__r_.__value_.__r.__words[2] = 0;
  v25->__r_.__value_.__r.__words[0] = 0;
  if (v41 >= 0) {
    unsigned int v27 = (const std::string::value_type *)&v40;
  }
  else {
    unsigned int v27 = (const std::string::value_type *)v40;
  }
  if (v41 >= 0) {
    std::string::size_type v28 = HIBYTE(v41);
  }
  else {
    std::string::size_type v28 = *((void *)&v40 + 1);
  }
  std::string::append(&v42, v27, v28);
  if (SHIBYTE(v41) < 0) {
    operator delete((void *)v40);
  }
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v31.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v39.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v38.__r_.__value_.__l.__data_);
  }
  if ((char)v34 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v36.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v35.__r_.__value_.__l.__data_);
  }
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t v29 = a1 + 8;
  *(_OWORD *)(v29 + 480) = 0u;
  *(_OWORD *)(v29 + 496) = 0u;
  *(_OWORD *)(v29 + 448) = 0u;
  *(_OWORD *)(v29 + 464) = 0u;
  *(_OWORD *)(v29 + 416) = 0u;
  *(_OWORD *)(v29 + 432) = 0u;
  *(_OWORD *)(v29 + 384) = 0u;
  *(_OWORD *)(v29 + 400) = 0u;
  *(_OWORD *)(v29 + 352) = 0u;
  *(_OWORD *)(v29 + 368) = 0u;
  *(_OWORD *)(v29 + 320) = 0u;
  *(_OWORD *)(v29 + 336) = 0u;
  *(_OWORD *)(v29 + 288) = 0u;
  *(_OWORD *)(v29 + 304) = 0u;
  *(_OWORD *)(v29 + 256) = 0u;
  *(_OWORD *)(v29 + 272) = 0u;
  *(_OWORD *)(v29 + 224) = 0u;
  *(_OWORD *)(v29 + 240) = 0u;
  *(_OWORD *)(v29 + 192) = 0u;
  *(_OWORD *)(v29 + 208) = 0u;
  *(_OWORD *)(v29 + 160) = 0u;
  *(_OWORD *)(v29 + 176) = 0u;
  *(_OWORD *)(v29 + 128) = 0u;
  *(_OWORD *)(v29 + 144) = 0u;
  *(_OWORD *)(v29 + 96) = 0u;
  *(_OWORD *)(v29 + 112) = 0u;
  *(_OWORD *)(v29 + 64) = 0u;
  *(_OWORD *)(v29 + 80) = 0u;
  *(_OWORD *)(v29 + 32) = 0u;
  *(_OWORD *)(v29 + 48) = 0u;
  uint64_t v30 = &v42;
  if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    uint64_t v30 = (std::string *)v42.__r_.__value_.__r.__words[0];
  }
  *(_OWORD *)(v29 + 16) = 0uLL;
  snprintf((char *)v29, 0x200uLL, "%s\n", (const char *)v30);
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v42.__r_.__value_.__l.__data_);
  }
}

void sub_263875E18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,void *a44,uint64_t a45,int a46,__int16 a47,char a48,char a49)
{
  if (*(char *)(v49 - 121) < 0) {
    operator delete(*(void **)(v49 - 144));
  }
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v49 - 153) < 0) {
    operator delete(*(void **)(v49 - 176));
  }
  if (a49 < 0) {
    operator delete(a44);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a42 < 0) {
    operator delete(a37);
  }
  if (a35 < 0) {
    operator delete(a30);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  if (*(char *)(v49 - 57) < 0) {
    operator delete(*(void **)(v49 - 80));
  }
  _Unwind_Resume(exception_object);
}

void sub_263875F60(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void _BBUException::~_BBUException(std::exception *this)
{
  std::exception::~exception(this);

  operator delete(v1);
}

void _BBUException::_BBUException(_BBUException *this, const _BBUException *a2)
{
  *(void *)this = &unk_270EB4D48;
  strncpy((char *)this + 8, (const char *)a2 + 8, 0x200uLL);
  *((_DWORD *)this + 130) = *((_DWORD *)a2 + 130);
}

uint64_t _BBUException::what(_BBUException *this)
{
  return (uint64_t)this + 8;
}

ctu::llvm::StringRef *ctu::llvm::StringRef::StringRef(ctu::llvm::StringRef *this, const char *__s)
{
  *(void *)this = __s;
  if (!__s) {
    ctu::llvm::StringRef::StringRef();
  }
  *((void *)this + 1) = strlen(__s);
  return this;
}

uint64_t VinyleUICCPerformOperationWithTransport(unsigned int a1, __CFDictionary **a2, const __CFDictionary *a3, int a4, uint64_t a5)
{
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylNonUpdate", "", "Vinyl Operation: %d, lastOperation: %d\n", v10, v11, v12, a1);
  pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  uint64_t v13 = (BBUCapabilities *)xmmword_26A9A0D30;
  if (!(void)xmmword_26A9A0D30)
  {
    BBUCapabilities::create_default_global(&v41);
    long long v14 = v41;
    long long v41 = 0uLL;
    uint64_t v15 = (std::__shared_weak_count *)*((void *)&xmmword_26A9A0D30 + 1);
    xmmword_26A9A0D30 = v14;
    if (v15)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
      if (*((void *)&v41 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v41 + 1));
      }
    }
    uint64_t v13 = (BBUCapabilities *)xmmword_26A9A0D30;
  }
  long long v16 = (std::__shared_weak_count *)*((void *)&xmmword_26A9A0D30 + 1);
  if (*((void *)&xmmword_26A9A0D30 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_26A9A0D30 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  unsigned __int8 v17 = BBUCapabilities::supportsVinylRestore(v13);
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  if ((v17 & 1) == 0)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylNonUpdate", "", "unsupported device\n", v31, v32, v33, v40);
    return 0;
  }
  if (a3)
  {
    ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)&v41, a3);
    if (ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)&v41, @"UpdateBaseband"))
    {
      MEMORY[0x263E6C510](&v41);
      goto LABEL_14;
    }
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylNonUpdate", "", "updateBaseband false\n", v34, v35, v36, v40);
    MEMORY[0x263E6C510](&v41);
    return 0;
  }
LABEL_14:
  if (a1 >= 5)
  {
    if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
      _BBULog(1, 6, "VinylNonUpdate", "", "check failed: %s, %d, assertion: %s\n", v37, v38, v39, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinyleUICC.cpp");
    }
    uint64_t v19 = 0;
    unsigned int updated = 0;
    if ((*(unsigned char *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1)
    {
      _BBULog(0, 1, "VinylNonUpdate", "", "Invalid user operation: %d\n", v24, v25, v26, a1);
      unsigned int updated = 0;
      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t result = VinylController::create(a5, 1);
    if (!result) {
      return result;
    }
    uint64_t v19 = result;
    unsigned int updated = VinylController::performNonUpdateOperation(result, a1, a2, a3);
  }
  if (a4 == 1) {
    VinylControllerObjDestroy(v19, v20, v21, v22, v23, v24, v25, v26, v40);
  }
  if (updated && updated != 9)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylNonUpdate", "", "something is wrong.. : %d\n", v28, v29, v30, updated);
    if (!a5) {
      BBUpdaterCommon::collectCoreDump((BBUpdaterCommon *)a2, 0, 0);
    }
  }
  return VinylControllerMapBBUReturnToVinylResult(updated);
}

void sub_263876334(_Unwind_Exception *a1)
{
}

uint64_t VinyleUICCPerformOperation(unsigned int a1, __CFDictionary **a2, const __CFDictionary *a3, int a4)
{
  return VinyleUICCPerformOperationWithTransport(a1, a2, a3, a4, 0);
}

uint64_t __cxx_global_var_init_4()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_263869000);
  }
  return result;
}

const void **CFOBJ_STR@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  CFStringRef v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@", *a1);
  ctu::cf::assign();
  return ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v3);
}

void sub_26387642C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)va);
  if (*(char *)(v2 + 23) < 0) {
    operator delete(*(void **)v2);
  }
  _Unwind_Resume(a1);
}

uint64_t VinylControllerMapBBUReturnToVinylResult(unsigned int a1)
{
  if (a1 > 0x1B) {
    return 1;
  }
  else {
    return dword_263891DC8[a1];
  }
}

uint64_t eUICC::TwoPhaseProv::ComposeGps(BBUpdaterCommon *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v12[0] = &v13;
  v12[1] = 8;
  unint64_t v13 = bswap64(BBUpdaterCommon::getECID(a1));
  CFIndex length = 16;
  if (DEREncodeSequenceFromObject(0xE00000000000002DLL, (unint64_t)v12, 0x10uLL, 1u, (uint64_t)&eUICC::TwoPhaseProv::getProvSessReqSpec, (unint64_t)bytes, 0x10uLL, (unint64_t *)&length))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v2, v3, v4, (char)"DR_Success == enc_ret");
    return 17;
  }
  CFDataRef v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length);
  int v7 = *(const void **)a1;
  *(void *)a1 = v6;
  long long v14 = v7;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v14);
  if (!*(void *)a1)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v8, v9, v10, (char)"gps_req.get()");
    return 17;
  }
  return 0;
}

uint64_t ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t eUICC::TwoPhaseProv::ConvertGpsToGbpp(uint64_t *a1, const void **a2)
{
  _OWORD v14[10] = *MEMORY[0x263EF8340];
  v14[0] = @"APIVersion";
  v14[1] = @"1";
  uint64_t v3 = *a1;
  v14[2] = @"BPPRequestData";
  v14[3] = v3;
  v14[4] = @"Command";
  v14[5] = @"GetBpp";
  v14[6] = @"ResponseDataFlag";
  v14[7] = @"NEW_BPP";
  v14[8] = @"HardwareType";
  v14[9] = @"2";
  CFMutableDictionaryRef theDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 5, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (theDict) {
    uint64_t v4 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  }
  else {
    uint64_t v4 = 0;
  }
  if (v4)
  {
    for (uint64_t i = 0; i != 10; i += 2)
      CFDictionaryAddValue(theDict, (const void *)v14[i], (const void *)v14[i + 1]);
    ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<__CFDictionary,void>(&v11, (CFTypeRef *)&theDict);
    if (&v11 != a2)
    {
      unint64_t v13 = *a2;
      *a2 = v11;
      uint64_t v11 = 0;
      ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v13);
    }
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v11);
    uint64_t v6 = 0;
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"dict");
    uint64_t v6 = 17;
  }
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&theDict);
  return v6;
}

void sub_2638767B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t eUICC::TwoPhaseProv::ConvertPirToHir(CFDataRef *a1, const void **this, void **a3)
{
  v31[10] = *(const void **)MEMORY[0x263EF8340];
  uint64_t v28 = 0;
  CFMutableDictionaryRef theDict = 0;
  uint64_t v26 = 0;
  unsigned int v27 = 0;
  uint64_t v25 = 0;
  if (a1 && *a1 && eUICC::TwoPhaseProv::SessionData::extractDataFromPir((uint64_t)this, a1))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)"(kVinylResultSuccess == sessionData.extractDataFromPir(*pir))");
    uint64_t v9 = 27;
    goto LABEL_27;
  }
  v31[0] = @"APIVersion";
  v31[1] = @"1";
  v31[2] = @"Command";
  v31[3] = @"HandleInstallationResult";
  v31[4] = @"EuiccSessionID";
  eUICC::TwoPhaseProv::SessionData::getEUICCSessionId(this, (const void **)&value);
  v31[5] = value;
  v31[6] = @"EID";
  eUICC::TwoPhaseProv::SessionData::getEid(this, &v24);
  v31[7] = v24;
  v31[8] = @"TransactionID";
  eUICC::TwoPhaseProv::SessionData::getTransactionId(this, &v23);
  v31[9] = v23;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v23);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v24);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&value);
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 5, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFMutableDictionaryRef v11 = theDict;
  CFMutableDictionaryRef theDict = Mutable;
  value = v11;
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&value);
  if (theDict) {
    uint64_t v12 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  }
  else {
    uint64_t v12 = 0;
  }
  if (!v12)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v19, v20, v21, (char)"dict");
    uint64_t v9 = 17;
    goto LABEL_27;
  }
  for (uint64_t i = 0; i != 10; i += 2)
  {
    long long v14 = v31[i + 1];
    if (v14) {
      CFDictionaryAddValue(theDict, v31[i], v14);
    }
  }
  eUICC::TwoPhaseProv::SessionData::getError(this, (const void **)&value);
  if (value) {
    uint64_t v15 = ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get;
  }
  else {
    uint64_t v15 = 0;
  }
  if (v15)
  {
    eUICC::TwoPhaseProv::SessionData::getError(this, &v24);
    uint64_t v16 = v24;
    ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&v24);
    ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)&value);
    if (!v16) {
      goto LABEL_20;
    }
    unsigned __int8 v17 = theDict;
    eUICC::TwoPhaseProv::SessionData::getError(this, (const void **)&value);
    CFDictionaryAddValue(v17, @"ErrorCode", value);
  }
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)&value);
LABEL_20:
  if (a1 && *a1) {
    CFDictionaryAddValue(theDict, @"ProfileInstallationResult", *a1);
  }
  ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<__CFDictionary,void>(&value, (CFTypeRef *)&theDict);
  if (&value != a3)
  {
    std::string::size_type v18 = *a3;
    *a3 = value;
    value = 0;
    v31[0] = v18;
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(v31);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&value);
  uint64_t v9 = 0;
LABEL_27:
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v25);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v26);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v27);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v28);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&theDict);
  return v9;
}

void sub_263876B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va5, a8);
  va_start(va4, a8);
  va_start(va3, a8);
  va_start(va2, a8);
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, const void *);
  va_copy(va2, va1);
  CFMutableDictionaryRef v11 = va_arg(va2, const void *);
  va_copy(va3, va2);
  unint64_t v13 = va_arg(va3, const void *);
  va_copy(va4, va3);
  uint64_t v15 = va_arg(va4, const void *);
  va_copy(va5, va4);
  unsigned __int8 v17 = va_arg(va5, const void *);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)va5);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va1);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va2);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va3);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)va4);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t eUICC::TwoPhaseProv::ExtractNotificationListSeqNumbers(CFDataRef *a1, const void ***a2)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFIndex Length = CFDataGetLength(*a1);
  CFDataRef theData = CFDataCreateMutableCopy(v4, Length, *a1);
  v21[0] = (unint64_t)CFDataGetMutableBytePtr(theData);
  v21[1] = CFDataGetLength(theData);
  if (DERDecodeSeqContentInit(v21, v25)) {
    goto LABEL_2;
  }
  if (DERDecodeSeqNext(v25, &v23) || v23 != 0xA000000000000028)
  {
    gBBULogMaskGet();
    uint64_t v9 = "DR_Success == der_ret && TAG_LN == dec.tag";
    goto LABEL_3;
  }
  if (DERDecodeSeqContentInit((unint64_t *)v24, v25)) {
    goto LABEL_2;
  }
  if (DERDecodeSeqNext(v25, &v23) || v23 != 0xA000000000000000)
  {
    gBBULogMaskGet();
    uint64_t v9 = "DR_Success == der_ret && TAG_NML == dec.tag";
    goto LABEL_3;
  }
  if (DERDecodeSeqContentInit((unint64_t *)v24, v25))
  {
LABEL_2:
    gBBULogMaskGet();
    uint64_t v9 = "DR_Success == der_ret";
  }
  else
  {
    while (1)
    {
      int v12 = DERDecodeSeqNext(v25, &v23);
      if (v12) {
        break;
      }
      CFDataRef v19 = 0;
      if (v23 != 0xA00000000000002FLL)
      {
        gBBULogMaskGet();
        std::string::size_type v18 = "TAG_NM == dec.tag";
LABEL_28:
        _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v15, v16, v17, (char)v18);
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v19);
        goto LABEL_4;
      }
      if (DERDecodeSeqContentInit((unint64_t *)v24, v20))
      {
        gBBULogMaskGet();
        std::string::size_type v18 = "DR_Success == der_ret";
        goto LABEL_28;
      }
      if (DERDecodeSeqNext(v20, &v23) || v23 != 0x8000000000000000)
      {
        gBBULogMaskGet();
        std::string::size_type v18 = "DR_Success == der_ret && TAG_SEQN == dec.tag";
        goto LABEL_28;
      }
      CFDataRef v13 = CFDataCreate(v4, v24[0], (CFIndex)v24[1]);
      CFDataRef v14 = v19;
      CFDataRef v19 = v13;
      CFDataRef v26 = v14;
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v26);
      std::vector<ctu::cf::CFSharedRef<__CFData const>>::push_back[abi:ne180100](a2, (const void **)&v19);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v19);
    }
    if (v12 == 1)
    {
      uint64_t v10 = 0;
      goto LABEL_5;
    }
    gBBULogMaskGet();
    uint64_t v9 = "DR_EndOfSequence == der_ret";
  }
LABEL_3:
  _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)v9);
LABEL_4:
  uint64_t v10 = 27;
LABEL_5:
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)&theData);
  return v10;
}

void sub_263876E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va1, a5);
  va_start(va, a5);
  uint64_t v6 = va_arg(va1, const void *);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va);
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)va1);
  _Unwind_Resume(a1);
}

uint64_t std::vector<ctu::cf::CFSharedRef<__CFData const>>::push_back[abi:ne180100](const void ***a1, const void **a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= (unint64_t)v6)
  {
    uint64_t v10 = (uint64_t)(v7 - (void)*a1) >> 3;
    if ((unint64_t)(v10 + 1) >> 61) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = (char *)v5 - (char *)*a1;
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
    uint64_t v26 = v4;
    if (v13) {
      CFDataRef v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>(v4, v13);
    }
    else {
      CFDataRef v14 = 0;
    }
    uint64_t v15 = (const void **)&v14[8 * v10];
    uint64_t v16 = (const void **)&v14[8 * v13];
    uint64_t v25 = v16;
    uint64_t v17 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(v15, a2);
    uint64_t v9 = v17 + 1;
    v24.i64[1] = (uint64_t)(v17 + 1);
    CFDataRef v19 = *a1;
    std::string::size_type v18 = a1[1];
    if (v18 == *a1)
    {
      int64x2_t v21 = vdupq_n_s64((unint64_t)v18);
    }
    else
    {
      do
      {
        *--uint64_t v17 = 0;
        uint64_t v20 = *--v18;
        *uint64_t v17 = v20;
        *std::string::size_type v18 = 0;
      }
      while (v18 != v19);
      int64x2_t v21 = *(int64x2_t *)a1;
      uint64_t v9 = (const void **)v24.i64[1];
      uint64_t v16 = v25;
    }
    *a1 = v17;
    a1[1] = v9;
    int64x2_t v24 = v21;
    uint64_t v22 = a1[2];
    a1[2] = v16;
    uint64_t v25 = v22;
    uint64_t v23 = v21.i64[0];
    uint64_t result = std::__split_buffer<ctu::cf::CFSharedRef<__CFData const>>::~__split_buffer((uint64_t)&v23);
  }
  else
  {
    uint64_t result = (uint64_t)ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(*(const void ***)(v4 - 8), a2);
    uint64_t v9 = (const void **)(v7 + 8);
  }
  a1[1] = v9;
  return result;
}

uint64_t eUICC::TwoPhaseProv::ExtractProfileInfo(CFDataRef *a1, uint64_t **a2)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFIndex Length = CFDataGetLength(*a1);
  MutableCopy = CFDataCreateMutableCopy(v4, Length, *a1);
  v37[0] = (unint64_t)CFDataGetMutableBytePtr(MutableCopy);
  v37[1] = CFDataGetLength(MutableCopy);
  if (!DERDecodeSeqContentInit(v37, v41))
  {
    if (DERDecodeSeqNext(v41, &v39) || v39 != 0xA00000000000002DLL)
    {
      gBBULogMaskGet();
      uint64_t v9 = "DR_Success == der_ret && TAG_PILR == dec.tag";
      goto LABEL_3;
    }
    if (!DERDecodeSeqContentInit(v40, v41))
    {
      if (DERDecodeSeqNext(v41, &v39) || v39 != 0xA000000000000000)
      {
        gBBULogMaskGet();
        uint64_t v9 = "DR_Success == der_ret && TAG_PILR_OK == dec.tag";
        goto LABEL_3;
      }
      if (!DERDecodeSeqContentInit(v40, v41))
      {
        uint64_t v10 = 0;
        uint64_t v22 = (const void *)*MEMORY[0x263EFFB40];
        int64x2_t v21 = (const void *)*MEMORY[0x263EFFB38];
        while (1)
        {
          if (DERDecodeSeqNext(v41, &v39) == 1) {
            goto LABEL_4;
          }
          int v35 = 0;
          v34[0] = 0;
          v34[1] = 0;
          uint64_t v33 = v34;
          CFDataRef v27 = 0;
          uint64_t v28 = 0;
          __p[0] = 0;
          __p[1] = 0;
          uint64_t v26 = 0;
          if (!DERDecodeSeqContentInit(v40, &v36))
          {
            if (v39 != 0xE000000000000003)
            {
              gBBULogMaskGet();
              uint64_t v15 = "DR_Success == der_ret && TAG_PI == dec.tag";
              goto LABEL_19;
            }
            if (!DERParseSequenceContent(v40, 3u, (uint64_t)&eUICC::TwoPhaseProv::profileInfoSpec, (unint64_t)v29, 0x30uLL))
            {
              int v16 = 3;
              if (!*(void *)v31 || !__sz) {
                goto LABEL_20;
              }
              long long v23 = 0uLL;
              uint64_t v24 = 0;
              std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v23, *(const void **)v31, *(void *)v31 + __sz, __sz);
              if (__p[0])
              {
                __p[1] = __p[0];
                operator delete(__p[0]);
              }
              *(_OWORD *)std::string __p = v23;
              uint64_t v26 = v24;
              CFDataRef v17 = CFDataCreate(v4, v29[0], (CFIndex)v29[1]);
              CFDataRef v18 = v27;
              CFDataRef v27 = v17;
              *(void *)&long long v23 = v18;
              ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v23);
              if (!DERParseInteger(&v30, &v35))
              {
                CFDataRef v19 = v22;
                if (v35 != 1) {
                  CFDataRef v19 = v21;
                }
                uint64_t v20 = v28;
                uint64_t v28 = v19;
                *(void *)&long long v23 = v20;
                ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef((const void **)&v23);
                std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::__emplace_unique_key_args<std::vector<unsigned char>,std::vector<unsigned char>&,eUICC::TwoPhaseProv::ProfileProperties&>(a2, (unsigned __int8 **)__p, (uint64_t)__p, (const void **)&v27);
                int v16 = 0;
                goto LABEL_20;
              }
            }
          }
          gBBULogMaskGet();
          uint64_t v15 = "DR_Success == der_ret";
LABEL_19:
          _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v12, v13, v14, (char)v15);
          uint64_t v10 = 27;
          int v16 = 2;
LABEL_20:
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef(&v28);
          ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v27);
          std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::destroy((uint64_t)&v33, v34[0]);
          if (v16 && v16 != 3) {
            goto LABEL_4;
          }
        }
      }
    }
  }
  gBBULogMaskGet();
  uint64_t v9 = "DR_Success == der_ret";
LABEL_3:
  _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)v9);
  uint64_t v10 = 27;
LABEL_4:
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)&MutableCopy);
  return v10;
}

void sub_26387735C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,const void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,void *a33)
{
  if (__p) {
    operator delete(__p);
  }
  ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef(v33);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a24);
  std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::destroy((uint64_t)&a32, a33);
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)(v34 - 136));
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::ExtractDeleteResult(CFDataRef *a1, BOOL *a2)
{
  return eUICC::TwoPhaseProv::ExtractResult(a1, a2, 0xA000000000000033);
}

uint64_t eUICC::TwoPhaseProv::ExtractResult(CFDataRef *a1, BOOL *a2, uint64_t a3)
{
  int v16 = 0;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFIndex Length = CFDataGetLength(*a1);
  CFDataRef theData = CFDataCreateMutableCopy(v6, Length, *a1);
  v14[0] = (unint64_t)CFDataGetMutableBytePtr(theData);
  v14[1] = CFDataGetLength(theData);
  *a2 = 0;
  if (!DERDecodeSeqContentInit(v14, v19))
  {
    if (DERDecodeSeqNext(v19, &v17) || v17 != a3)
    {
      gBBULogMaskGet();
      uint64_t v11 = "DR_Success == der_ret && top_level_tag == dec.tag";
      goto LABEL_3;
    }
    if (!DERDecodeSeqContentInit((unint64_t *)v18, v19))
    {
      if (DERDecodeSeqNext(v19, &v17) || v17 != 0x8000000000000000)
      {
        gBBULogMaskGet();
        uint64_t v11 = "DR_Success == der_ret && TAG_DP_RESULT == dec.tag";
        goto LABEL_3;
      }
      if (!DERParseInteger(v18, &v16))
      {
        uint64_t v12 = 0;
        *a2 = v16 == 0;
        goto LABEL_4;
      }
    }
  }
  gBBULogMaskGet();
  uint64_t v11 = "DR_Success == der_ret";
LABEL_3:
  _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v8, v9, v10, (char)v11);
  uint64_t v12 = 27;
LABEL_4:
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)&theData);
  return v12;
}

void sub_263877550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::ExtractDisableResult(CFDataRef *a1, BOOL *a2)
{
  return eUICC::TwoPhaseProv::ExtractResult(a1, a2, 0xA000000000000032);
}

uint64_t eUICC::TwoPhaseProv::SerializeDictIntoPlistData(const void **a1)
{
  uint64_t v31 = 0;
  CFDataRef v30 = 0;
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v3 = *a1;
  error[0] = 0;
  error[1] = (CFErrorRef)&v31;
  CFDataRef Data = CFPropertyListCreateData(v2, v3, kCFPropertyListXMLFormat_v1_0, 0, error);
  CFDataRef v5 = v30;
  CFDataRef v30 = Data;
  __p[0] = v5;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
  ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)error);
  if (v30) {
    CFAllocatorRef v6 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  }
  else {
    CFAllocatorRef v6 = 0;
  }
  if (!v6)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v8, v9, v10, (char)"outData");
    gBBULogMaskGet();
    uint64_t v11 = *a1;
    CFDataRef v27 = v11;
    if (v11) {
      CFRetain(v11);
    }
    uint64_t v12 = error;
    CFOBJ_STR(&v27, error);
    if (v29 < 0) {
      LOBYTE(v12) = error[0];
    }
    uint64_t v24 = v31;
    if (v31) {
      CFRetain(v31);
    }
    CFOBJ_STR(&v24, __p);
    _BBULog(22, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Failed to serialize dictionary %s error %s\n", v13, v14, v15, (char)v12);
    if (v26 < 0) {
      operator delete(__p[0]);
    }
    ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&v24);
    if (v29 < 0) {
      operator delete(error[0]);
    }
    ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&v27);
    goto LABEL_19;
  }
  if ((ctu::cf::assign() & 1) == 0)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)"success");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Failed to assign output data\n", v19, v20, v21, v23);
LABEL_19:
    uint64_t v7 = 10;
    goto LABEL_20;
  }
  uint64_t v7 = 0;
LABEL_20:
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v30);
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(&v31);
  return v7;
}

void sub_26387779C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, const void *a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, const void *a20)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&a13);
  if (*(char *)(v20 - 33) < 0) {
    operator delete(*(void **)(v20 - 56));
  }
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&a20);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v20 - 32));
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)(v20 - 24));
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::CreateDictionaryFromPlistData(const __CFData **a1, __CFError **a2)
{
  CFURLRef v44 = 0;
  int v45 = 0;
  CFDataRef v3 = *a1;
  if (*a1) {
    CFAllocatorRef v4 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  }
  else {
    CFAllocatorRef v4 = 0;
  }
  if (!v4)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v14, v15, v16, (char)"inData");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Failed to create data\n", v17, v18, v19, v36);
LABEL_32:
    uint64_t v13 = 10;
    goto LABEL_33;
  }
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  error[0] = 0;
  error[1] = (CFErrorRef)&v45;
  CFPropertyListRef v7 = CFPropertyListCreateWithData(v6, v3, 0, 0, error);
  uint64_t v8 = v44;
  CFURLRef v44 = (void *)v7;
  __p[0] = v8;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
  ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)error);
  if (v44) {
    uint64_t v9 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  }
  else {
    uint64_t v9 = 0;
  }
  if (!v9)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v20, v21, v22, (char)"outPlist");
    gBBULogMaskGet();
    CFDataRef v41 = *a1;
    if (v41) {
      CFRetain(v41);
    }
    char v23 = error;
    CFOBJ_STR(&v41, error);
    if (v43 < 0) {
      LOBYTE(v23) = error[0];
    }
    uint64_t v38 = v45;
    if (v45) {
      CFRetain(v45);
    }
    CFOBJ_STR(&v38, __p);
    _BBULog(22, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Failed to deserialize dictionary %s error %s\n", v24, v25, v26, (char)v23);
    if (v40 < 0) {
      operator delete(__p[0]);
    }
    ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&v38);
    if (v43 < 0) {
      operator delete(error[0]);
    }
    CFDataRef v27 = (const void **)&v41;
    goto LABEL_31;
  }
  CFTypeID v10 = CFGetTypeID(v44);
  if (v10 != CFDictionaryGetTypeID())
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v28, v29, v30, (char)"CFGetTypeID(outPlist.get()) == CFDictionaryGetTypeID()");
    gBBULogMaskGet();
    uint64_t v37 = v44;
    if (v44) {
      CFRetain(v44);
    }
    CFOBJ_STR(&v37, error);
    if (v43 >= 0) {
      uint64_t v34 = error;
    }
    else {
      LOBYTE(v34) = error[0];
    }
    _BBULog(22, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Deserialized plist data is not a dictionary: %s\n", v31, v32, v33, (char)v34);
    if (v43 < 0) {
      operator delete(error[0]);
    }
    CFDataRef v27 = &v37;
LABEL_31:
    ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(v27);
    goto LABEL_32;
  }
  __p[0] = v44;
  uint64_t v11 = (const void **)ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<__CFDictionary,void>(error, (CFTypeRef *)__p);
  uint64_t v12 = *a2;
  *a2 = error[0];
  error[0] = v12;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(v11);
  uint64_t v13 = 0;
LABEL_33:
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v44);
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(&v45);
  return v13;
}

void sub_263877B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, const void *a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (*(char *)(v23 - 33) < 0) {
    operator delete(*(void **)(v23 - 56));
  }
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&a14);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v23 - 32));
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)(v23 - 24));
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t eUICC::TwoPhaseProv::IsNotificationForTwoPhase(CFDataRef *a1, const void **a2)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFIndex Length = CFDataGetLength(*a1);
  CFDataRef theData = CFDataCreateMutableCopy(v4, Length, *a1);
  v21[0] = (unint64_t)CFDataGetMutableBytePtr(theData);
  v21[1] = CFDataGetLength(theData);
  if (DERDecodeSeqContentInit(v21, v25)) {
    goto LABEL_2;
  }
  if (DERDecodeSeqNext(v25, &v23) || v23 != 0xA00000000000002BLL)
  {
    gBBULogMaskGet();
    uint64_t v9 = "DR_Success == der_ret && TAG_RNLR == dec.tag";
    goto LABEL_4;
  }
  if (DERDecodeSeqContentInit(v24, v25)) {
    goto LABEL_2;
  }
  if (DERDecodeSeqNext(v25, &v23) || v23 != 0xA000000000000000)
  {
    gBBULogMaskGet();
    uint64_t v9 = "DR_Success == der_ret && TAG_RNLR_NL == dec.tag";
    goto LABEL_4;
  }
  unint64_t v12 = v24[0];
  MutableBytePtr = CFDataGetMutableBytePtr(theData);
  if (DERDecodeSeqContentInit(v24, v25))
  {
LABEL_2:
    gBBULogMaskGet();
LABEL_3:
    uint64_t v9 = "DR_Success == der_ret";
    goto LABEL_4;
  }
  if (DERDecodeSeqNext(v25, &v23) || v23 != 0xA000000000000037)
  {
    gBBULogMaskGet();
    uint64_t v9 = "DR_Success == der_ret && TAG_PIR == dec.tag";
    goto LABEL_4;
  }
  if (DERParseSequenceContent(v24, 3u, (uint64_t)&eUICC::TwoPhaseProv::profileInstallationResultSpec, (unint64_t)v19, 0x20uLL))
  {
    gBBULogMaskGet();
    goto LABEL_3;
  }
  if (!v20)
  {
    uint64_t v10 = 0;
    goto LABEL_5;
  }
  BytePtr = CFDataGetBytePtr(*a1);
  CFIndex v15 = CFDataGetLength(*a1);
  CFDataRef v16 = CFDataCreate(v4, &BytePtr[v12 - (void)MutableBytePtr], v15 - (v12 - (void)MutableBytePtr));
  uint64_t v17 = *a2;
  *a2 = v16;
  uint64_t v26 = v17;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v26);
  if (*a2) {
    uint64_t v18 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  }
  else {
    uint64_t v18 = 0;
  }
  if (v18)
  {
    uint64_t v10 = 1;
    goto LABEL_5;
  }
  gBBULogMaskGet();
  uint64_t v9 = "ntf";
LABEL_4:
  _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)v9);
  uint64_t v10 = 0;
LABEL_5:
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)&theData);
  return v10;
}

void sub_263877E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL eUICC::TwoPhaseProv::IsProvTxIdAvailable(CFDataRef *a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFIndex Length = CFDataGetLength(*a1);
  CFDataRef theData = CFDataCreateMutableCopy(v2, Length, *a1);
  v12[0] = (unint64_t)CFDataGetMutableBytePtr(theData);
  v12[1] = CFDataGetLength(theData);
  if (DERDecodeSeqContentInit(v12, v16))
  {
    gBBULogMaskGet();
    uint64_t v7 = "DR_Success == DERDecodeSeqContentInit(&gps_der, &seq)";
LABEL_9:
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v4, v5, v6, (char)v7);
    BOOL v8 = 0;
    goto LABEL_10;
  }
  if (DERDecodeSeqNext(v16, &v14))
  {
LABEL_4:
    gBBULogMaskGet();
    uint64_t v7 = "DR_Success == DERDecodeSeqNext(&seq, &dec)";
    goto LABEL_9;
  }
  if (v14 != 0xE00000000000002DLL)
  {
    gBBULogMaskGet();
    uint64_t v7 = "TAG_GPS == dec.tag";
    goto LABEL_9;
  }
  if (DERDecodeSeqContentInit(v15, v16)) {
    goto LABEL_7;
  }
  if (DERDecodeSeqNext(v16, &v14)) {
    goto LABEL_4;
  }
  if (v14 != 0xA000000000000000)
  {
    gBBULogMaskGet();
    uint64_t v7 = "TAG_GPS_PS == dec.tag";
    goto LABEL_9;
  }
  if (DERDecodeSeqContentInit(v15, v16))
  {
LABEL_7:
    gBBULogMaskGet();
    uint64_t v7 = "DR_Success == DERDecodeSeqContentInit(&dec.content, &seq)";
    goto LABEL_9;
  }
  do
  {
    int v10 = DERDecodeSeqNext(v16, &v14);
    BOOL v8 = v10 != 1;
    if (v10 == 1) {
      break;
    }
  }
  while (v14 != 0xA000000000000003 || v15[1] == 0);
LABEL_10:
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)&theData);
  return v8;
}

void sub_263878044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::ComposeNsr(CFDataRef *a1, const void **a2)
{
  v21[1] = *(const void **)MEMORY[0x263EF8340];
  unint64_t v4 = CFDataGetLength(*a1) + 7;
  uint64_t v5 = MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v18 - ((v5 + 22) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v7 = v5 + 14;
  BOOL v8 = (const UInt8 *)&v18 - ((MEMORY[0x270FA5388]() + 29) & 0xFFFFFFFFFFFFFFF0);
  CFIndex v19 = v4;
  v20[1] = CFDataGetLength(*a1);
  v20[0] = CFDataGetBytePtr(*a1);
  if (DEREncodeSequenceFromObject(0xA000000000000000, (unint64_t)v20, 0x10uLL, 1u, (uint64_t)&eUICC::TwoPhaseProv::retrieveNtfListSearchCriteriaSpec, (unint64_t)v6, v4, (unint64_t *)&v19)|| (CFIndex v19 = v7, DEREncodeSequenceFromObject(0xA000000000000030, (unint64_t)v20, 0x10uLL, 1u, (uint64_t)&eUICC::TwoPhaseProv::notificationSentSpec, (unint64_t)v8, v7, (unint64_t *)&v19)))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v9, v10, v11, (char)"DR_Success == enc_ret");
    return 10;
  }
  else
  {
    CFDataRef v13 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v8, v19);
    unint64_t v14 = *a2;
    *a2 = v13;
    v21[0] = v14;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v21);
    if (*a2)
    {
      return 0;
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v15, v16, v17, (char)"nsr_req.get()");
      return 17;
    }
  }
}

uint64_t eUICC::TwoPhaseProv::ComposeDisableReq(CFDataRef *a1, const void **a2)
{
  v19[1] = *(const void **)MEMORY[0x263EF8340];
  char v17 = 0;
  unint64_t v4 = CFDataGetLength(*a1) + 22;
  uint64_t v5 = (const UInt8 *)&v16 - ((MEMORY[0x270FA5388]() + 37) & 0xFFFFFFFFFFFFFFF0);
  CFIndex v16 = v4;
  v18[1] = CFDataGetLength(*a1);
  BytePtr = CFDataGetBytePtr(*a1);
  v18[3] = 1;
  v18[0] = BytePtr;
  v18[2] = &v17;
  if (DEREncodeSequenceFromObject(0xA000000000000032, (unint64_t)v18, 0x20uLL, 2u, (uint64_t)&eUICC::TwoPhaseProv::profileOperationSpec, (unint64_t)v5, v4, (unint64_t *)&v16))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"DR_Success == enc_ret");
    return 10;
  }
  else
  {
    CFDataRef v11 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v5, v16);
    unint64_t v12 = *a2;
    *a2 = v11;
    v19[0] = v12;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v19);
    if (*a2)
    {
      return 0;
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"disable_req.get()");
      return 17;
    }
  }
}

uint64_t eUICC::TwoPhaseProv::ComposeDeleteReq(CFDataRef *a1, const void **a2)
{
  v18[1] = *(const void **)MEMORY[0x263EF8340];
  unint64_t v4 = CFDataGetLength(*a1) + 14;
  uint64_t v5 = (const UInt8 *)&v15 - ((MEMORY[0x270FA5388]() + 29) & 0xFFFFFFFFFFFFFFF0);
  CFIndex v16 = v4;
  v17[1] = CFDataGetLength(*a1);
  v17[0] = CFDataGetBytePtr(*a1);
  if (DEREncodeSequenceFromObject(0xA000000000000033, (unint64_t)v17, 0x20uLL, 1u, (uint64_t)&eUICC::TwoPhaseProv::deleteProfileSpec, (unint64_t)v5, v4, (unint64_t *)&v16))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)"DR_Success == enc_ret");
    return 10;
  }
  else
  {
    CFDataRef v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v5, v16);
    CFDataRef v11 = *a2;
    *a2 = v10;
    v18[0] = v11;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v18);
    if (*a2)
    {
      return 0;
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v12, v13, v14, (char)"delete_req.get()");
      return 17;
    }
  }
}

uint64_t eUICC::TwoPhaseProv::ComposeRnl(CFDataRef *a1, const void **a2)
{
  v24[1] = *(const void **)MEMORY[0x263EF8340];
  unint64_t v4 = CFDataGetLength(*a1) + 7;
  uint64_t v5 = MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v18 - ((v5 + 22) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v7 = v5 + 14;
  uint64_t v8 = (const UInt8 *)&v18 - ((MEMORY[0x270FA5388]() + 29) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v6;
  CFIndex v21 = 0;
  CFIndex v19 = v4;
  CFIndex Length = CFDataGetLength(*a1);
  BytePtr = CFDataGetBytePtr(*a1);
  if (DEREncodeSequenceFromObject(0xA000000000000000, (unint64_t)&v20, 0x20uLL, 1u, (uint64_t)&eUICC::TwoPhaseProv::retrieveNtfListSeqNumSpec, (unint64_t)v6, v4, (unint64_t *)&v19)|| (v21 = v19, CFIndex v19 = v7, DEREncodeSequenceFromObject(0xA00000000000002BLL, (unint64_t)&v20, 0x20uLL, 1u, (uint64_t)&eUICC::TwoPhaseProv::retrieveNtfListSearchCriteriaSpec, (unint64_t)v8, v7, (unint64_t *)&v19)))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v9, v10, v11, (char)"DR_Success == enc_ret");
    return 10;
  }
  else
  {
    CFDataRef v13 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v8, v19);
    uint64_t v14 = *a2;
    *a2 = v13;
    v24[0] = v14;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v24);
    if (*a2)
    {
      return 0;
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v15, v16, v17, (char)"rnl_req.get()");
      return 17;
    }
  }
}

uint64_t eUICC::TwoPhaseProv::GetNextBppSegment(_DWORD *a1, CFDataRef *a2, void *a3, unint64_t *a4)
{
  __dst[35] = *(_DWORD **)MEMORY[0x263EF8340];
  v24[0] = (unint64_t)&CFDataGetBytePtr(*a2)[*a3];
  v24[1] = CFDataGetLength(*a2) - *a3;
  *a4 = 0;
  memcpy(__dst, &unk_263891F78, 0x118uLL);
  std::map<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>::map[abi:ne180100]((uint64_t)v23, (int *)__dst, 7);
  if (!DERDecodeSeqContentInit(v24, v28))
  {
    if (DERDecodeSeqNext(v28, (unint64_t *)&v25))
    {
LABEL_4:
      gBBULogMaskGet();
      uint64_t v11 = "DR_Success == DERDecodeSeqNext(&seq, &decoded)";
      goto LABEL_5;
    }
    __dst[0] = a1;
    if (!*((unsigned char *)std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__emplace_unique_key_args<eUICC::TwoPhaseProv::eBppSegment,std::piecewise_construct_t const&,std::tuple<eUICC::TwoPhaseProv::eBppSegment const&>,std::tuple<>>(v23, a1, (uint64_t)&std::piecewise_construct, __dst)+ 40))
    {
      __dst[0] = a1;
      uint64_t v14 = std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__emplace_unique_key_args<eUICC::TwoPhaseProv::eBppSegment,std::piecewise_construct_t const&,std::tuple<eUICC::TwoPhaseProv::eBppSegment const&>,std::tuple<>>(v23, a1, (uint64_t)&std::piecewise_construct, __dst);
      if (v14[6] != v25)
      {
        gBBULogMaskGet();
        uint64_t v11 = "tag_props[seg].optional || tag_props[seg].topLevelTag == decoded.tag";
        goto LABEL_5;
      }
    }
    if (*a1 > 6u) {
      goto LABEL_20;
    }
    int v15 = 1 << *a1;
    if ((v15 & 0x13) != 0)
    {
      __dst[0] = a1;
      CFIndex v19 = std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__emplace_unique_key_args<eUICC::TwoPhaseProv::eBppSegment,std::piecewise_construct_t const&,std::tuple<eUICC::TwoPhaseProv::eBppSegment const&>,std::tuple<>>(v23, a1, (uint64_t)&std::piecewise_construct, __dst);
      if (v19[6] == v25)
      {
        if (DERDecodeSeqContentInit(&v26, v28))
        {
          gBBULogMaskGet();
          uint64_t v11 = "DR_Success == DERDecodeSeqContentInit(&decoded.content, &seq)";
          goto LABEL_5;
        }
        if (DERDecodeSeqNext(v28, (unint64_t *)&v25)) {
          goto LABEL_4;
        }
        __dst[0] = a1;
        if (!*((unsigned char *)std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__emplace_unique_key_args<eUICC::TwoPhaseProv::eBppSegment,std::piecewise_construct_t const&,std::tuple<eUICC::TwoPhaseProv::eBppSegment const&>,std::tuple<>>(v23, a1, (uint64_t)&std::piecewise_construct, __dst)+ 40))
        {
          __dst[0] = a1;
          uint64_t v22 = std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__emplace_unique_key_args<eUICC::TwoPhaseProv::eBppSegment,std::piecewise_construct_t const&,std::tuple<eUICC::TwoPhaseProv::eBppSegment const&>,std::tuple<>>(v23, a1, (uint64_t)&std::piecewise_construct, __dst);
          if (v22[7] != v25)
          {
            gBBULogMaskGet();
            uint64_t v11 = "tag_props[seg].optional || (tag_props[seg].innerTag == decoded.tag)";
            goto LABEL_5;
          }
        }
        *a4 = v26 + v27 - v24[0];
      }
    }
    else
    {
      if ((v15 & 0x24) != 0)
      {
        uint64_t v16 = v27;
        uint64_t v17 = v26 - v24[0];
        *a4 = v26 - v24[0];
        eUICC::TwoPhaseProv::GetNextBppSegment(eUICC::TwoPhaseProv::eBppSegment &,ctu::cf::CFSharedRef<__CFData const> &,unsigned long &,unsigned long &)::offset_seq_end = v17 + *a3 + v16;
        __dst[0] = a1;
        uint64_t v18 = std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__emplace_unique_key_args<eUICC::TwoPhaseProv::eBppSegment,std::piecewise_construct_t const&,std::tuple<eUICC::TwoPhaseProv::eBppSegment const&>,std::tuple<>>(v23, a1, (uint64_t)&std::piecewise_construct, __dst);
LABEL_26:
        uint64_t v12 = 0;
        *a1 = *((_DWORD *)v18 + 16);
        goto LABEL_6;
      }
      unint64_t v20 = v26 + v27 - v24[0];
      *a4 = v20;
      unint64_t v21 = *a3 + v20;
      if (v21 > eUICC::TwoPhaseProv::GetNextBppSegment(eUICC::TwoPhaseProv::eBppSegment &,ctu::cf::CFSharedRef<__CFData const> &,unsigned long &,unsigned long &)::offset_seq_end)
      {
        gBBULogMaskGet();
        uint64_t v11 = "offset + length <= offset_seq_end";
        goto LABEL_5;
      }
      if (v21 != eUICC::TwoPhaseProv::GetNextBppSegment(eUICC::TwoPhaseProv::eBppSegment &,ctu::cf::CFSharedRef<__CFData const> &,unsigned long &,unsigned long &)::offset_seq_end)
      {
LABEL_20:
        uint64_t v12 = 0;
        goto LABEL_6;
      }
    }
    __dst[0] = a1;
    uint64_t v18 = std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__emplace_unique_key_args<eUICC::TwoPhaseProv::eBppSegment,std::piecewise_construct_t const&,std::tuple<eUICC::TwoPhaseProv::eBppSegment const&>,std::tuple<>>(v23, a1, (uint64_t)&std::piecewise_construct, __dst);
    goto LABEL_26;
  }
  gBBULogMaskGet();
  uint64_t v11 = "DR_Success == DERDecodeSeqContentInit(&content, &seq)";
LABEL_5:
  _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v8, v9, v10, (char)v11);
  uint64_t v12 = 27;
LABEL_6:
  std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::destroy((uint64_t)v23, v23[1]);
  return v12;
}

void sub_263878C84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15)
{
}

uint64_t eUICC::TwoPhaseProv::StringifyDataBuffer(uint64_t *a1, int a2)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v9);
  uint64_t v4 = *a1;
  if (a1[1] != *a1)
  {
    unint64_t v5 = 0;
    do
    {
      if (a2)
      {
        *(_DWORD *)((char *)v11 + *(void *)(v10 - 24)) = *(_DWORD *)((unsigned char *)v11 + *(void *)(v10 - 24)) & 0xFFFFFFB5 | 8;
        v14[0] = 48;
        uint64_t v6 = std::operator<<[abi:ne180100]<std::char_traits<char>>(&v10, v14);
        *(void *)((char *)v6 + *(void *)(*v6 - 24) + 24) = 2;
        std::ostream::operator<<();
      }
      else
      {
        v14[0] = *(unsigned char *)(v4 + v5);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)v14, 1);
      }
      ++v5;
      uint64_t v4 = *a1;
    }
    while (a1[1] - *a1 > v5);
  }
  std::stringbuf::str();
  v9[0] = *MEMORY[0x263F8C2B8];
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v9 + *(void *)(v9[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  uint64_t v10 = v7;
  v11[0] = MEMORY[0x263F8C318] + 16;
  if (v12 < 0) {
    operator delete((void *)v11[8]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x263E6CAB0](&v13);
}

void sub_263878ED0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::LogOversizedPlain(uint64_t result)
{
  uint64_t v1 = result;
  unint64_t v2 = *(unsigned __int8 *)(result + 23);
  if (*(char *)(result + 23) < 0)
  {
    if (!*(void *)(result + 8)) {
      return result;
    }
  }
  else if (!*(unsigned char *)(result + 23))
  {
    return result;
  }
  unint64_t v3 = 0;
  if ((v2 & 0x80) == 0) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v2 = *(void *)(v1 + 8);
LABEL_7:
  while (v2 > v3)
  {
    gBBULogMaskGet();
    LOBYTE(v10) = v1;
    if (*(char *)(v1 + 23) < 0) {
      uint64_t v10 = *(void *)v1;
    }
    uint64_t result = _BBULogPlain(0, "%s\n", v4, v5, v6, v7, v8, v9, v10 + v3);
    v3 += 1023;
    unint64_t v2 = *(unsigned __int8 *)(v1 + 23);
    if ((v2 & 0x80) != 0) {
      goto LABEL_6;
    }
  }
  return result;
}

uint64_t eUICC::TwoPhaseProv::IsNotificationSentRspSuccess(CFDataRef *a1)
{
  int v12 = 0;
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFIndex Length = CFDataGetLength(*a1);
  CFDataRef theData = CFDataCreateMutableCopy(v2, Length, *a1);
  v10[0] = (unint64_t)CFDataGetMutableBytePtr(theData);
  v10[1] = CFDataGetLength(theData);
  if (DERDecodeSeqContentInit(v10, v15)) {
    goto LABEL_2;
  }
  if (DERDecodeSeqNext(v15, &v13) || v13 != 0xA000000000000030)
  {
    gBBULogMaskGet();
    uint64_t v7 = "DR_Success == der_ret && TAG_NS == dec.tag";
    goto LABEL_3;
  }
  if (DERDecodeSeqContentInit((unint64_t *)v14, v15) || DERDecodeSeqNext(v15, &v13)) {
    goto LABEL_2;
  }
  if (v13 != 0x8000000000000000)
  {
    gBBULogMaskGet();
    uint64_t v7 = "TAG_SEQN == dec.tag";
    goto LABEL_3;
  }
  if (DERParseInteger(v14, &v12))
  {
LABEL_2:
    gBBULogMaskGet();
    uint64_t v7 = "DR_Success == der_ret";
  }
  else
  {
    if (!v12)
    {
      uint64_t v8 = 1;
      goto LABEL_4;
    }
    gBBULogMaskGet();
    uint64_t v7 = "DELETE_NOTIFICATION_STATUS_OK == del_status";
  }
LABEL_3:
  _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v4, v5, v6, (char)v7);
  uint64_t v8 = 0;
LABEL_4:
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)&theData);
  return v8;
}

void sub_263879134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::ExtractDataFromPbiRsp(CFDataRef *a1, const void **a2, const void **a3)
{
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFIndex Length = CFDataGetLength(*a1);
  CFDataRef theData = CFDataCreateMutableCopy(v6, Length, *a1);
  v27[0] = (unint64_t)CFDataGetMutableBytePtr(theData);
  v27[1] = CFDataGetLength(theData);
  if (a2 && a3)
  {
    if (DERDecodeSeqContentInit(v27, v33))
    {
      gBBULogMaskGet();
      uint64_t v11 = "DR_Success == DERDecodeSeqContentInit(&pbi_der, &seq)";
    }
    else if (DERDecodeSeqNext(v33, &v31))
    {
      gBBULogMaskGet();
      uint64_t v11 = "DR_Success == DERDecodeSeqNext(&seq, &dec)";
    }
    else if (v31 == 0xE00000000000002ELL)
    {
      if (DERDecodeSeqContentInit((unint64_t *)v32, v33))
      {
        gBBULogMaskGet();
        uint64_t v11 = "DR_Success == DERDecodeSeqContentInit(&dec.content, &seq)";
      }
      else
      {
        if (!DERDecodeSeqNext(v33, &v29))
        {
          if (v29 != 0x2000000000000010)
          {
            if (v29 == 2)
            {
              int v26 = 0;
              if (DERParseInteger(&v30, &v26))
              {
                gBBULogMaskGet();
                _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v19, v20, v21, (char)"DR_Success == DERParseInteger(&dec_nested.content, &err_val)");
                goto LABEL_13;
              }
              int v22 = -127 - v26;
              if ((v26 - 1) >= 5) {
                int v22 = -254;
              }
              int valuePtr = v22;
              CFNumberRef v23 = CFNumberCreate(v6, kCFNumberIntType, &valuePtr);
              uint64_t v24 = *a3;
              *a3 = v23;
              uint64_t v34 = v24;
              ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&v34);
            }
            else
            {
              if (v29 != 0xA000000000000037) {
                goto LABEL_13;
              }
              CFDataRef v17 = CFDataCreate(v6, v32[0], (CFIndex)v32[1]);
              uint64_t v18 = *a2;
              *a2 = v17;
              uint64_t v34 = v18;
              ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v34);
            }
          }
          uint64_t v15 = 0;
          goto LABEL_14;
        }
        gBBULogMaskGet();
        uint64_t v11 = "DR_Success == DERDecodeSeqNext(&seq, &dec_nested)";
      }
    }
    else
    {
      gBBULogMaskGet();
      uint64_t v11 = "TAG_PBI == dec.tag";
    }
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v8, v9, v10, (char)v11);
LABEL_13:
    uint64_t v15 = 27;
    goto LABEL_14;
  }
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v12, v13, v14, (char)"(nullptr != pir) && (nullptr != err)");
  uint64_t v15 = 10;
LABEL_14:
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)&theData);
  return v15;
}

void sub_2638793F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL eUICC::TwoPhaseProv::LdrVerSupportsTwoPhaseInstall(eUICC::TwoPhaseProv *this)
{
  unsigned int v1 = this;
  CFAllocatorRef v2 = (char *)operator new(0xAuLL);
  *(void *)CFAllocatorRef v2 = 0x8710870387028700;
  *((_WORD *)v2 + 4) = -30944;
  if ((v1 & 0x8000) != 0)
  {
    if (v1 >> 8 < 0x87)
    {
      BOOL v3 = 0;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v5 = v2 + 10;
      while (*(unsigned __int16 *)&v2[v4] != v1)
      {
        v4 += 2;
        if (v4 == 10) {
          goto LABEL_10;
        }
      }
      uint64_t v5 = &v2[v4];
LABEL_10:
      BOOL v3 = v5 - v2 == 10;
    }
  }
  else
  {
    BOOL v3 = v1 > 0x70F;
  }
  operator delete(v2);
  return v3;
}

void *ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(void *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf) {
    CFRetain(cf);
  }
  return a1;
}

const void **ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(const void **a1)
{
  CFAllocatorRef v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(const void **a1)
{
  CFAllocatorRef v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(const void **a1)
{
  CFAllocatorRef v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef(const void **a1)
{
  CFAllocatorRef v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef(const void **a1)
{
  CFAllocatorRef v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(const void **a1)
{
  CFAllocatorRef v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(const void **a1)
{
  CFAllocatorRef v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<__CFDictionary,void>(void *a1, CFTypeRef *a2)
{
  CFTypeRef v3 = *a2;
  if (*a2)
  {
    CFTypeID v4 = CFGetTypeID(*a2);
    if (v4 == CFDictionaryGetTypeID()) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(a1, v5);
}

const void **ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(const void **a1, const void **a2)
{
  CFTypeRef v3 = *a2;
  *a1 = *a2;
  if (v3) {
    CFRetain(v3);
  }
  return a1;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  unsigned int v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

uint64_t std::__split_buffer<ctu::cf::CFSharedRef<__CFData const>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(i - 8));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::vector<unsigned char> const,eUICC::TwoPhaseProv::ProfileProperties>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::vector<unsigned char> const,eUICC::TwoPhaseProv::ProfileProperties>,0>(uint64_t a1)
{
  CFAllocatorRef v2 = (const void **)(a1 + 24);
  ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef((const void **)(a1 + 32));
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v2);
  uint64_t v3 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v3;
    operator delete(v3);
  }
}

void *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    CFAllocatorRef v6 = result;
    uint64_t result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2638798C0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::__emplace_unique_key_args<std::vector<unsigned char>,std::vector<unsigned char>&,eUICC::TwoPhaseProv::ProfileProperties&>(uint64_t **a1, unsigned __int8 **a2, uint64_t a3, const void **a4)
{
  uint64_t v7 = (uint64_t **)std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::__find_equal<std::vector<unsigned char>>((uint64_t)a1, &v12, a2);
  size_t v8 = *v7;
  if (!*v7)
  {
    uint64_t v9 = v7;
    std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::__construct_node<std::vector<unsigned char>&,eUICC::TwoPhaseProv::ProfileProperties&>((uint64_t)a1, a3, a4, (uint64_t)v11);
    std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__insert_node_at(a1, v12, v9, v11[0]);
    size_t v8 = v11[0];
    v11[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,void *>>>>::reset[abi:ne180100]((uint64_t)v11, 0);
  }
  return v8;
}

void *std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::__find_equal<std::vector<unsigned char>>(uint64_t a1, void *a2, unsigned __int8 **a3)
{
  uint64_t v5 = *(void **)(a1 + 8);
  uint64_t result = (void *)(a1 + 8);
  CFTypeID v4 = v5;
  if (v5)
  {
    CFAllocatorRef v6 = a3[1];
    do
    {
      while (1)
      {
        uint64_t v7 = v4;
        size_t v8 = (unsigned __int8 *)v4[4];
        uint64_t v9 = (unsigned __int8 *)v7[5];
        if (v8 != v9) {
          break;
        }
LABEL_12:
        if (*a3 != v6)
        {
          uint64_t v15 = (uint64_t)(*a3 + 1);
          while (v8 != v9)
          {
            unsigned int v16 = *v8;
            unsigned int v17 = *(unsigned __int8 *)(v15 - 1);
            if (v16 < v17) {
              break;
            }
            ++v8;
            if (v17 < v16 || v15++ == (void)v6) {
              goto LABEL_27;
            }
          }
          uint64_t result = v7 + 1;
          CFTypeID v4 = (void *)v7[1];
          if (v4) {
            continue;
          }
        }
        goto LABEL_27;
      }
      uint64_t v10 = v8 + 1;
      uint64_t v11 = *a3;
      while (v11 != v6)
      {
        unsigned int v12 = *v11;
        unsigned int v13 = *(v10 - 1);
        if (v12 < v13) {
          break;
        }
        ++v11;
        if (v13 < v12 || v10++ == v9) {
          goto LABEL_12;
        }
      }
      CFTypeID v4 = (void *)*v7;
      uint64_t result = v7;
    }
    while (*v7);
  }
  else
  {
    uint64_t v7 = result;
  }
LABEL_27:
  *a2 = v7;
  return result;
}

uint64_t std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::__construct_node<std::vector<unsigned char>&,eUICC::TwoPhaseProv::ProfileProperties&>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, const void **a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 8;
  size_t v8 = operator new(0x48uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  uint64_t result = std::pair<std::vector<unsigned char> const,eUICC::TwoPhaseProv::ProfileProperties>::pair[abi:ne180100]<std::vector<unsigned char>&,eUICC::TwoPhaseProv::ProfileProperties&,0>((uint64_t)v8 + 32, a2, a3);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_263879A9C(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__tree_node<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

uint64_t std::pair<std::vector<unsigned char> const,eUICC::TwoPhaseProv::ProfileProperties>::pair[abi:ne180100]<std::vector<unsigned char>&,eUICC::TwoPhaseProv::ProfileProperties&,0>(uint64_t a1, uint64_t a2, const void **a3)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>((void *)a1, *(const void **)a2, *(void *)(a2 + 8), *(void *)(a2 + 8) - *(void *)a2);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef((const void **)(a1 + 24), a3);
  ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::SharedRef((const void **)(a1 + 32), a3 + 1);
  return a1;
}

const void **ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::SharedRef(const void **a1, const void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  if (v3) {
    CFRetain(v3);
  }
  return a1;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  CFAllocatorRef v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::vector<unsigned char> const,eUICC::TwoPhaseProv::ProfileProperties>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

const void **ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy(const void **a1)
{
  CFAllocatorRef v2 = (const void **)a1[1];
  if (*a1)
  {
    uint64_t v3 = *v2;
    *CFAllocatorRef v2 = *a1;
    CFAllocatorRef v6 = v3;
  }
  else
  {
    CFTypeID v4 = *v2;
    *CFAllocatorRef v2 = 0;
    CFAllocatorRef v6 = v4;
  }
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(&v6);
  return a1;
}

uint64_t std::map<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  CFTypeID v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 40 * a3;
    do
    {
      std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__emplace_hint_unique_key_args<eUICC::TwoPhaseProv::eBppSegment,std::pair<eUICC::TwoPhaseProv::eBppSegment const,eUICC::TwoPhaseProv::BppTagProperties> const&>((uint64_t **)a1, v4, a2, (uint64_t)a2);
      a2 += 10;
      v6 -= 40;
    }
    while (v6);
  }
  return a1;
}

void sub_263879C60(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

_OWORD *std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__emplace_hint_unique_key_args<eUICC::TwoPhaseProv::eBppSegment,std::pair<eUICC::TwoPhaseProv::eBppSegment const,eUICC::TwoPhaseProv::BppTagProperties> const&>(uint64_t **a1, uint64_t *a2, int *a3, uint64_t a4)
{
  uint64_t v6 = std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__find_equal<eUICC::TwoPhaseProv::eBppSegment>(a1, a2, &v12, &v11, a3);
  uint64_t v7 = (_OWORD *)*v6;
  if (!*v6)
  {
    size_t v8 = (uint64_t **)v6;
    uint64_t v7 = operator new(0x48uLL);
    long long v9 = *(_OWORD *)(a4 + 16);
    void v7[2] = *(_OWORD *)a4;
    v7[3] = v9;
    *((void *)v7 + 8) = *(void *)(a4 + 32);
    std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__insert_node_at(a1, (uint64_t)v12, v8, (uint64_t *)v7);
  }
  return v7;
}

uint64_t *std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__find_equal<eUICC::TwoPhaseProv::eBppSegment>(void *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
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
      long long v9 = (uint64_t *)*a2;
      do
      {
        uint64_t v10 = v9;
        long long v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      unsigned int v13 = a2;
      do
      {
        uint64_t v10 = (uint64_t *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        unsigned int v13 = v10;
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
          unsigned int v17 = (uint64_t *)v16;
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
      unsigned int v17 = a1 + 1;
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
    unsigned int v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      unsigned int v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    uint64_t v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      uint64_t v19 = a4;
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

void std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t **std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__emplace_unique_key_args<eUICC::TwoPhaseProv::eBppSegment,std::piecewise_construct_t const&,std::tuple<eUICC::TwoPhaseProv::eBppSegment const&>,std::tuple<>>(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  int v7 = a1 + 1;
  int v6 = a1[1];
  if (v6)
  {
    int v8 = *a2;
    while (1)
    {
      while (1)
      {
        long long v9 = (uint64_t **)v6;
        int v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10) {
          break;
        }
        int v6 = *v9;
        int v7 = v9;
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
        int v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    long long v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = (char *)operator new(0x48uLL);
    *((_DWORD *)v11 + 8) = **a4;
    *(_OWORD *)(v11 + 56) = 0u;
    *(_OWORD *)(v11 + 40) = 0u;
    std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::Perform(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v149 = *MEMORY[0x263EF8340];
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "TwoPhaseProvImpl::Perform\n", v6, v7, v8, v124);
  *(void *)(a1 + 376) = a2;
  dispatch_queue_t v9 = dispatch_queue_create("VinylControllerTwoPhaseProvisioning", 0);
  int v10 = *(NSObject **)(a1 + 64);
  *(void *)(a1 + 64) = v9;
  if (v10) {
    dispatch_release(v10);
  }
  std::string __p = 0;
  v146 = 0;
  uint64_t v147 = 0;
  char v143 = 0;
  unsigned __int8 v144 = 0;
  v141 = 0;
  v142 = 0;
  char v140 = 0;
  __int16 v139 = 0;
  (*(void (**)(_OWORD *__return_ptr))(*(void *)*a3 + 8))(__src);
  memcpy((void *)(a1 + 88), __src, 0x119uLL);
  if (*(unsigned char *)(a1 + 366))
  {
    gBBULogMaskGet();
    BOOL v14 = "!getDataRsp.contents.isAbsentOk";
LABEL_5:
    int v15 = 0;
    uint64_t v16 = 0;
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)v14);
    uint64_t ProvisioningSessions = 0;
    goto LABEL_6;
  }
  if (*(_DWORD *)(a1 + 88) != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    gBBULogMaskGet();
    int v15 = 0;
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v30, v31, v32, (char)"getDataRsp.Valid()");
    uint64_t ProvisioningSessions = 10;
    goto LABEL_21;
  }
  CFNumberRef v23 = (eUICC::TwoPhaseProv *)__rev16(*(unsigned __int16 *)(a1 + 328));
  if (!eUICC::TwoPhaseProv::LdrVerSupportsTwoPhaseInstall(v23))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v34, v35, v36, (char)"LdrVerSupportsTwoPhaseInstall(ldr_ver)");
    gBBULogMaskGet();
    int v15 = 0;
    uint64_t v16 = 0;
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "ldr ver %04X not eligible, skipping\n", v37, v38, v39, (char)v23);
    uint64_t ProvisioningSessions = 0;
    goto LABEL_6;
  }
  if (*(unsigned char *)(a1 + 92))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v24, v25, v26, (char)"0 == getDataRsp.contents.perso");
    gBBULogMaskGet();
    int v15 = 0;
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "two-phase flow unsupported with perso incomplete\n", v27, v28, v29, v126);
    uint64_t ProvisioningSessions = 29;
LABEL_21:
    uint64_t v16 = 0;
    goto LABEL_22;
  }
  CFDataRef v138 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)(a1 + 95), 16);
  eUICC::TwoPhaseProv::SessionData::setEid(a1, &v138);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v138);
  if ((eUICC::TwoPhaseProv::SessionData::isEidEligible((eUICC::TwoPhaseProv::SessionData *)a1, (const Options *)a2) & 1) == 0)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v47, v48, v49, (char)"sessionData.isEidEligible( performOptions)");
    gBBULogMaskGet();
    int v15 = 0;
    uint64_t v16 = 0;
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "EID not eligible, skipping\n", v50, v51, v52, v127);
    uint64_t ProvisioningSessions = 0;
    goto LABEL_6;
  }
  uint64_t ProvisioningSessions = eUICC::TwoPhaseProv::TwoPhaseProvImpl::HandleRefurbishProfileReference(a1, a3);
  if (ProvisioningSessions)
  {
    gBBULogMaskGet();
    int v15 = 0;
    uint64_t v16 = 0;
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v44, v45, v46, (char)"kVinylResultSuccess == vinyl_ret");
    goto LABEL_36;
  }
  uint64_t v54 = *(unsigned __int8 *)(a2 + 71);
  if ((v54 & 0x80u) != 0) {
    uint64_t v54 = *(void *)(a2 + 56);
  }
  if (!v54)
  {
    gBBULogMaskGet();
    BOOL v14 = "!performOptions.twoPhaseUrl.empty()";
    goto LABEL_5;
  }
  ReverseProxyGetSettings(a2 + 48, (uint64_t *)&v137);
  uint64_t v55 = (void *)(a1 + 72);
  if ((const void **)(a1 + 72) != &v137)
  {
    *(void *)&__src[0] = *v55;
    *uint64_t v55 = v137;
    v137 = 0;
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)__src);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v137);
  uint64_t ProvisioningSessions = eUICC::TwoPhaseProv::TwoPhaseProvImpl::HandleNotifications((eUICC::TwoPhaseProv::SessionData *)a1, a3);
  if (ProvisioningSessions
    || (uint64_t v59 = eUICC::TwoPhaseProv::ComposeGps((BBUpdaterCommon *)&v144), ProvisioningSessions = v59, v59)
    || (uint64_t ProvisioningSessions = eUICC::TwoPhaseProv::TwoPhaseProvImpl::GetProvisioningSessions(v59, (uint64_t)&v144, &v143, (uint64_t)&v139, a3), ProvisioningSessions))
  {
    gBBULogMaskGet();
    int v15 = 0;
    uint64_t v16 = 0;
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v60, v61, v62, (char)"kVinylResultSuccess == vinyl_ret");
    goto LABEL_36;
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v136, &v143);
  BOOL IsProvTxIdAvailable = eUICC::TwoPhaseProv::IsProvTxIdAvailable((CFDataRef *)&v136);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v136);
  if (!IsProvTxIdAvailable)
  {
    gBBULogMaskGet();
    int v15 = 0;
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v67, v68, v69, (char)"IsProvTxIdAvailable( euicc_rsp)");
    uint64_t ProvisioningSessions = 26;
    goto LABEL_21;
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v135, &v143);
  uint64_t ProvisioningSessions = eUICC::TwoPhaseProv::ConvertGpsToGbpp((uint64_t *)&v135, (const void **)&v141);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v135);
  if (ProvisioningSessions
    || (uint64_t ProvisioningSessions = eUICC::TwoPhaseProv::SerializeDictIntoPlistData((const void **)&v141),
        ProvisioningSessions))
  {
    gBBULogMaskGet();
    int v15 = 0;
    uint64_t v16 = 0;
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v64, v65, v66, (char)"kVinylResultSuccess == vinyl_ret");
    goto LABEL_36;
  }
  eUICC::TwoPhaseProv::TwoPhaseProvImpl::PostDataSync(a1, (uint64_t *)&__p, __src);
  int v15 = (std::__shared_weak_count *)*((void *)&__src[0] + 1);
  uint64_t v70 = *(void *)&__src[0];
  uint64_t v71 = *(unsigned int (**)(void))(**(void **)&__src[0] + 24);
  if (*(unsigned char *)(*(void *)(a1 + 376) + 72))
  {
    if (v71(*(void *)&__src[0]) == 204)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v72, v73, v74, (char)"kHttpStatusNoContent != getbpp_rsp->getHttpResponseCode()");
      gBBULogMaskGet();
      uint64_t v16 = 0;
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "no profile returned with presence check on, failing\n", v75, v76, v77, v128);
LABEL_29:
      uint64_t ProvisioningSessions = 28;
      goto LABEL_6;
    }
    if ((*(unsigned int (**)(uint64_t))(*(void *)v70 + 24))(v70) == 200)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v85, v86, v87, (char)"kHttpStatusSuccess != getbpp_rsp->getHttpResponseCode()");
      gBBULogMaskGet();
      uint64_t v84 = "profile returned with presence check on, returning success\n";
      goto LABEL_71;
    }
  }
  else if (v71(*(void *)&__src[0]) == 204)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v78, v79, v80, (char)"kHttpStatusNoContent != getbpp_rsp->getHttpResponseCode()");
    gBBULogMaskGet();
    uint64_t v84 = "no profile returned, skipping\n";
LABEL_71:
    uint64_t v16 = 0;
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", v84, v81, v82, v83, v129);
    uint64_t ProvisioningSessions = 0;
    goto LABEL_6;
  }
  if ((*(unsigned int (**)(uint64_t))(*(void *)v70 + 24))(v70) != 200)
  {
    gBBULogMaskGet();
    uint64_t v16 = 0;
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v91, v92, v93, (char)"kHttpStatusSuccess == getbpp_rsp->getHttpResponseCode()");
    goto LABEL_29;
  }
  (*(void (**)(const void **__return_ptr, uint64_t))(*(void *)v70 + 40))(&v134, v70);
  uint64_t ProvisioningSessions = eUICC::TwoPhaseProv::CreateDictionaryFromPlistData((const __CFData **)&v134, (__CFError **)&v141);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v134);
  if (ProvisioningSessions
    || (uint64_t ProvisioningSessions = eUICC::TwoPhaseProv::SessionData::processAlderResponse(a1, (CFDictionaryRef *)&v141),
        ProvisioningSessions))
  {
    gBBULogMaskGet();
    uint64_t v16 = 0;
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v88, v89, v90, (char)"kVinylResultSuccess == vinyl_ret");
    goto LABEL_36;
  }
  eUICC::TwoPhaseProv::SessionData::getPbiReq((const void **)a1, (const void **)__src);
  if (!*(void *)&__src[0])
  {
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__src);
    goto LABEL_82;
  }
  eUICC::TwoPhaseProv::SessionData::getBpp((const void **)a1, &v137);
  uint64_t v94 = v137;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v137);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__src);
  if (!v94)
  {
LABEL_82:
    gBBULogMaskGet();
    uint64_t v16 = 0;
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v99, v100, v101, (char)"kVinylResultSuccess == vinyl_ret && sessionData.getPbiReq().get() && sessionData.getBpp().get()");
    uint64_t ProvisioningSessions = 0;
    goto LABEL_6;
  }
  PbiReq = eUICC::TwoPhaseProv::SessionData::getPbiReq((const void **)a1, &v133);
  uint64_t ProvisioningSessions = eUICC::TwoPhaseProv::TwoPhaseProvImpl::PrepareBPPInstallation((uint64_t)PbiReq, (uint64_t)&v133, &v143, (uint64_t)&v139, a3);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v133);
  if (ProvisioningSessions
    || (uint64_t ProvisioningSessions = eUICC::TwoPhaseProv::SessionData::extractDataFromPbiRsp(a1, (CFDataRef *)&v143),
        ProvisioningSessions))
  {
    gBBULogMaskGet();
    uint64_t v16 = 0;
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v96, v97, v98, (char)"kVinylResultSuccess == vinyl_ret");
    goto LABEL_36;
  }
  Bpp = eUICC::TwoPhaseProv::SessionData::getBpp((const void **)a1, &v132);
  uint64_t ProvisioningSessions = eUICC::TwoPhaseProv::TwoPhaseProvImpl::LoadBPP((uint64_t)Bpp, (CFDataRef *)&v132, &v143, (uint64_t)&v139, a3);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v132);
  if (ProvisioningSessions
    || (uint64_t ProvisioningSessions = eUICC::TwoPhaseProv::ConvertPirToHir((CFDataRef *)&v143, (const void **)a1, &v141),
        ProvisioningSessions)
    || (uint64_t ProvisioningSessions = eUICC::TwoPhaseProv::SerializeDictIntoPlistData((const void **)&v141),
        ProvisioningSessions))
  {
    gBBULogMaskGet();
    uint64_t v16 = 0;
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v103, v104, v105, (char)"kVinylResultSuccess == vinyl_ret");
    goto LABEL_36;
  }
  eUICC::TwoPhaseProv::TwoPhaseProvImpl::PostDataSync(a1, (uint64_t *)&__p, __src);
  uint64_t v16 = (std::__shared_weak_count *)*((void *)&__src[0] + 1);
  if ((*(unsigned int (**)(void))(**(void **)&__src[0] + 24))(*(void *)&__src[0]) != 200)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v110, v111, v112, (char)"kHttpStatusSuccess == handlenotification_rsp->getHttpResponseCode()");
    goto LABEL_29;
  }
  eUICC::TwoPhaseProv::SessionData::getPirSeqNum((const void **)a1, (const void **)__src);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::operator=(&v142, (const void **)__src);
  uint64_t v106 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__src);
  uint64_t ProvisioningSessions = eUICC::TwoPhaseProv::TwoPhaseProvImpl::NotificationSent((uint64_t)v106, (CFDataRef *)&v142, &v143, a3);
  if (ProvisioningSessions)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v107, v108, v109, (char)"kVinylResultSuccess == vinyl_ret");
    goto LABEL_36;
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v131, &v143);
  int IsNotificationSentRspSuccess = eUICC::TwoPhaseProv::IsNotificationSentRspSuccess((CFDataRef *)&v131);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v131);
  if (IsNotificationSentRspSuccess)
  {
    eUICC::TwoPhaseProv::SessionData::getError((const void **)a1, (const void **)__src);
    uint64_t v114 = *(void *)&__src[0];
    ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)__src);
    if (!v114)
    {
      eUICC::TwoPhaseProv::SessionData::clearTransientData((eUICC::TwoPhaseProv::SessionData *)a1);
      uint64_t ProvisioningSessions = eUICC::TwoPhaseProv::TwoPhaseProvImpl::HandleNotifications((eUICC::TwoPhaseProv::SessionData *)a1, a3);
      if (!ProvisioningSessions) {
        goto LABEL_6;
      }
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v121, v122, v123, (char)"kVinylResultSuccess == vinyl_ret");
LABEL_36:
      if (ProvisioningSessions == 28) {
        goto LABEL_6;
      }
      goto LABEL_22;
    }
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v115, v116, v117, (char)"nullptr == sessionData.getError().get()");
    eUICC::TwoPhaseProv::SessionData::clearTransientData((eUICC::TwoPhaseProv::SessionData *)a1);
    uint64_t ProvisioningSessions = 29;
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v118, v119, v120, (char)"IsNotificationSentRspSuccess( euicc_rsp)");
    uint64_t ProvisioningSessions = 27;
  }
LABEL_22:
  eUICC::TwoPhaseProv::SessionData::getEUICCSessionId((const void **)a1, &v137);
  if (v137)
  {
    eUICC::TwoPhaseProv::SessionData::getError((const void **)a1, (const void **)__src);
    if (*(void *)&__src[0])
    {
      BOOL v33 = 1;
    }
    else
    {
      eUICC::TwoPhaseProv::SessionData::getPir((const void **)a1, &v130);
      BOOL v33 = v130 != 0;
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v130);
    }
    ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)__src);
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v137);
    if (v33)
    {
      eUICC::TwoPhaseProv::SessionData::getPir((const void **)a1, &v130);
      uint64_t v40 = eUICC::TwoPhaseProv::ConvertPirToHir((CFDataRef *)&v130, (const void **)a1, &v141);
      if (v40 || (uint64_t v40 = eUICC::TwoPhaseProv::SerializeDictIntoPlistData((const void **)&v141), v40))
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v41, v42, v43, (char)"kVinylResultSuccess == handle_result_ret");
      }
      else
      {
        eUICC::TwoPhaseProv::TwoPhaseProvImpl::PostDataSync(a1, (uint64_t *)&__p, __src);
        long long v53 = __src[0];
        __src[0] = 0uLL;
        if (v16)
        {
          std::__shared_weak_count::__release_shared[abi:ne180100](v16);
          if (*((void *)&__src[0] + 1)) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&__src[0] + 1));
          }
        }
        if ((*(unsigned int (**)(void))(*(void *)v53 + 24))(v53) == 200)
        {
          uint64_t v16 = (std::__shared_weak_count *)*((void *)&v53 + 1);
          uint64_t v40 = ProvisioningSessions;
        }
        else
        {
          gBBULogMaskGet();
          _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v56, v57, v58, (char)"kHttpStatusSuccess == handlenotification_rsp->getHttpResponseCode()");
          uint64_t v40 = 28;
          uint64_t v16 = (std::__shared_weak_count *)*((void *)&v53 + 1);
        }
      }
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v130);
      uint64_t ProvisioningSessions = v40;
    }
  }
  else
  {
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v137);
  }
LABEL_6:
  eUICC::TwoPhaseProv::SessionData::clear((eUICC::TwoPhaseProv::SessionData *)a1);
  if (ProvisioningSessions && v139 == 28581)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Delaying for 6FA5 handling\n", v18, v19, v20, v125);
    uint64_t v21 = (_OWORD *)*a3;
    *(_OWORD *)((char *)v21 + 8) = 0u;
    uint64_t v21 = (_OWORD *)((char *)v21 + 8);
    v21[15] = 0u;
    v21[16] = 0u;
    v21[13] = 0u;
    v21[14] = 0u;
    v21[11] = 0u;
    v21[12] = 0u;
    v21[9] = 0u;
    v21[10] = 0u;
    v21[7] = 0u;
    v21[8] = 0u;
    v21[5] = 0u;
    v21[6] = 0u;
    v21[3] = 0u;
    v21[4] = 0u;
    v21[1] = 0u;
    unint64_t v21[2] = 0u;
    *(_OWORD *)((char *)v21 + 265) = 0u;
    (*(void (**)(_OWORD *__return_ptr))(*(void *)*a3 + 8))(__src);
    *(void *)&__src[0] = 3000000000;
    std::this_thread::sleep_for ((const std::chrono::nanoseconds *)__src);
  }
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&v140);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v141);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v142);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v143);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v144);
  if (__p)
  {
    v146 = __p;
    operator delete(__p);
  }
  return ProvisioningSessions;
}

void sub_26387B23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,const void *a24,const void *a25,const void *a26,const void *a27,const void *a28,void *__p,uint64_t a30)
{
  if (v31) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v31);
  }
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&a24);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&a25);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a26);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a27);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a28);
  if (__p)
  {
    a30 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::HandleRefurbishProfileReference(uint64_t a1, void *a2)
{
  memset(&v78, 0, sizeof(v78));
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v74);
  uint64_t v71 = 0;
  uint64_t v72 = 0;
  uint64_t v73 = 0;
  v69[1] = 0;
  uint64_t v70 = 0;
  uint64_t v68 = (uint64_t *)v69;
  v69[0] = 0;
  uint64_t v4 = *(void *)(a1 + 376);
  uint64_t v5 = MEMORY[0x263F8C2B8];
  if (!v4) {
    goto LABEL_33;
  }
  if (*(char *)(v4 + 127) < 0)
  {
    if (*(void *)(v4 + 112)) {
      goto LABEL_4;
    }
LABEL_33:
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v31, v32, v33, (char)"options && !options->twoPhaseRefurbRef.empty()");
    uint64_t ProfilesInfoList = 0;
    goto LABEL_34;
  }
  if (!*(unsigned char *)(v4 + 127)) {
    goto LABEL_33;
  }
LABEL_4:
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t *)&v56, (const std::string *)(v4 + 104), 24);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::operator=();
  long long v53 = a2;
  uint64_t v56 = *(void **)v5;
  uint64_t v6 = v56;
  uint64_t v7 = *(void *)(v5 + 72);
  uint64_t v8 = *(void **)(v5 + 64);
  *(void **)((char *)&v56 + *((void *)v56 - 3)) = v8;
  uint64_t v54 = v7;
  uint64_t v58 = v7;
  uint64_t v59 = MEMORY[0x263F8C318] + 16;
  if (v61 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x263E6CAB0]();
  dispatch_queue_t v9 = 0;
  int v10 = 0;
  while (1)
  {
    *(void *)((char *)v75 + *(void *)(v74[0] - 24)) = 2;
    uint64_t v11 = std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v74, (uint64_t)&v78);
    if ((*((unsigned char *)v11 + *(void *)(*v11 - 24) + 32) & 5) != 0) {
      break;
    }
    int v55 = 0;
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t *)&v56, &v78, 24);
    *(_DWORD *)((char *)&v57 + *((void *)v56 - 3)) = *(_DWORD *)((unsigned char *)&v57 + *((void *)v56 - 3)) & 0xFFFFFFB5 | 8;
    MEMORY[0x263E6C890](&v56, &v55);
    uint64_t v56 = v6;
    *(void **)((char *)&v56 + *((void *)v6 - 3)) = v8;
    uint64_t v58 = v54;
    uint64_t v59 = MEMORY[0x263F8C318] + 16;
    if (v61 < 0) {
      operator delete(__p);
    }
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x263E6CAB0](&v62);
    char v12 = v55;
    if (v9 >= v73)
    {
      unint64_t v14 = (unint64_t)v71;
      uint64_t v15 = v9 - v71;
      uint64_t v16 = v9 - v71 + 1;
      if (v16 < 0) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      }
      unsigned int v17 = v8;
      uint64_t v18 = v6;
      unint64_t v19 = v73 - v71;
      if (2 * (v73 - v71) > (unint64_t)v16) {
        uint64_t v16 = 2 * v19;
      }
      if (v19 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v20 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v20 = v16;
      }
      if (v20) {
        uint64_t v21 = (char *)operator new(v20);
      }
      else {
        uint64_t v21 = 0;
      }
      int v10 = &v21[v15];
      int v22 = &v21[v15];
      *int v22 = v12;
      uint64_t v13 = v22 + 1;
      if (v9 != (char *)v14)
      {
        CFNumberRef v23 = &v9[~v14];
        do
        {
          char v24 = *--v9;
          (v23--)[(void)v21] = v24;
        }
        while (v9 != (char *)v14);
        dispatch_queue_t v9 = v71;
        int v10 = v21;
      }
      uint64_t v71 = v10;
      uint64_t v72 = v13;
      uint64_t v73 = &v21[v20];
      if (v9) {
        operator delete(v9);
      }
      uint64_t v6 = v18;
      uint64_t v8 = v17;
    }
    else
    {
      *dispatch_queue_t v9 = v55;
      uint64_t v13 = v9 + 1;
    }
    uint64_t v72 = v13;
    dispatch_queue_t v9 = v13;
  }
  v66[0] = v10;
  v66[1] = (const void *)(v9 - v10);
  uint64_t v25 = DERDecodeSeqContentInit((unint64_t *)v66, v67);
  if (v25)
  {
    gBBULogMaskGet();
    uint64_t v29 = "DR_Success == der_ret";
LABEL_31:
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v26, v27, v28, (char)v29);
    uint64_t ProfilesInfoList = 27;
    goto LABEL_34;
  }
  uint64_t ProfilesInfoList = eUICC::TwoPhaseProv::TwoPhaseProvImpl::GetProfilesInfoList((uint64_t)v25, &v70, v53);
  if (ProfilesInfoList
    || (uint64_t ProfilesInfoList = eUICC::TwoPhaseProv::ExtractProfileInfo((CFDataRef *)&v70, &v68), ProfilesInfoList))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v36, v37, v38, (char)"kVinylResultSuccess == ret");
  }
  else
  {
    while (1)
    {
      int v39 = DERDecodeSeqNext(v67, &v63);
      if (v39) {
        break;
      }
      uint64_t v57 = 0;
      uint64_t v58 = 0;
      uint64_t v56 = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v56, v66[0], v64 + v65, v64 + v65 - (unint64_t)v66[0]);
      uint64_t v40 = (CFDataRef *)std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::find<std::vector<unsigned char>>((uint64_t)&v68, (unsigned __int8 **)&v56);
      if (v69 != (void **)v40
        && ((gBBULogMaskGet(),
             _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "matched refurb profileReference\n", v41, v42, v43, v52), uint64_t Value = CFBooleanGetValue(v40[8]), Value)&& (uint64_t Value = eUICC::TwoPhaseProv::TwoPhaseProvImpl::DisableProfile(Value, v40 + 7, v53), ProfilesInfoList = Value, Value)|| (ProfilesInfoList = eUICC::TwoPhaseProv::TwoPhaseProvImpl::DeleteProfile(Value, v40 + 7, v53), ProfilesInfoList)))
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v45, v46, v47, (char)"kVinylResultSuccess == ret");
        char v48 = 0;
      }
      else
      {
        v66[0] = (const void *)(v64 + v65);
        if (v64 + v65 <= (unint64_t)v9)
        {
          char v48 = 1;
        }
        else
        {
          gBBULogMaskGet();
          _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v49, v50, v51, (char)"der_item.data <= (profile_ref_input.data() + profile_ref_input.size())");
          char v48 = 0;
          uint64_t ProfilesInfoList = 27;
        }
      }
      if (v56)
      {
        uint64_t v57 = v56;
        operator delete(v56);
      }
      if ((v48 & 1) == 0) {
        goto LABEL_34;
      }
    }
    if (v39 != 1)
    {
      gBBULogMaskGet();
      uint64_t v29 = "der_ret == DR_EndOfSequence";
      goto LABEL_31;
    }
  }
LABEL_34:
  std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::destroy((uint64_t)&v68, v69[0]);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v70);
  if (v71) {
    operator delete(v71);
  }
  v74[0] = *MEMORY[0x263F8C2B8];
  uint64_t v34 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(uint64_t *)((char *)v74 + *(void *)(v74[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v74[2] = v34;
  v75[0] = MEMORY[0x263F8C318] + 16;
  if (v76 < 0) {
    operator delete((void *)v75[8]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x263E6CAB0](&v77);
  if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v78.__r_.__value_.__l.__data_);
  }
  return ProfilesInfoList;
}

void sub_26387BBDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::destroy((uint64_t)&a63, a64);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a66);
  if (a67)
  {
    a68 = a67;
    operator delete(a67);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a70);
  if (*(char *)(v70 - 89) < 0) {
    operator delete((void *)STACK[0x300]);
  }
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::HandleNotifications(eUICC::TwoPhaseProv::SessionData *a1, void *a2)
{
  char v48 = 0;
  v49[0] = 0;
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  std::string __p = 0;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t NotificationListForSeqNum = eUICC::TwoPhaseProv::TwoPhaseProvImpl::ListInstallationNotifications((uint64_t)a1, v49, a2);
  if (NotificationListForSeqNum)
  {
    gBBULogMaskGet();
    uint64_t v5 = 0;
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)"kVinylResultSuccess == ret");
LABEL_7:
    eUICC::TwoPhaseProv::SessionData::clearTransientData(a1);
    goto LABEL_8;
  }
  uint64_t v41 = v49[0];
  if (v49[0]) {
    CFRetain(v49[0]);
  }
  uint64_t NotificationListForSeqNum = eUICC::TwoPhaseProv::ExtractNotificationListSeqNumbers((CFDataRef *)&v41, &v45);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v41);
  if (NotificationListForSeqNum)
  {
    gBBULogMaskGet();
    uint64_t v5 = 0;
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v9, v10, v11, (char)"kVinylResultSuccess == ret");
    goto LABEL_7;
  }
  uint64_t v13 = v45;
  unint64_t v14 = v46;
  if (v45 == v46)
  {
    uint64_t v5 = 0;
    uint64_t NotificationListForSeqNum = 0;
    goto LABEL_7;
  }
  uint64_t v5 = 0;
  while (1)
  {
    uint64_t v15 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v40, v13);
    uint64_t v38 = 0;
    int v39 = 0;
    uint64_t v37 = 0;
    uint64_t NotificationListForSeqNum = eUICC::TwoPhaseProv::TwoPhaseProvImpl::RetrieveNotificationListForSeqNum((uint64_t)v15, (CFDataRef *)&v40, v49, a2);
    if (NotificationListForSeqNum)
    {
LABEL_16:
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)"kVinylResultSuccess == ret");
      int v19 = 2;
      int v20 = 1;
      goto LABEL_17;
    }
    uint64_t v36 = v49[0];
    if (v49[0]) {
      CFRetain(v49[0]);
    }
    char IsNotificationForTwoPhase = eUICC::TwoPhaseProv::IsNotificationForTwoPhase((CFDataRef *)&v36, &v39);
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v36);
    if (IsNotificationForTwoPhase)
    {
      uint64_t NotificationListForSeqNum = eUICC::TwoPhaseProv::ConvertPirToHir((CFDataRef *)&v39, (const void **)a1, &v37);
      if (NotificationListForSeqNum) {
        goto LABEL_16;
      }
      uint64_t NotificationListForSeqNum = eUICC::TwoPhaseProv::SerializeDictIntoPlistData((const void **)&v37);
      if (NotificationListForSeqNum) {
        goto LABEL_16;
      }
      eUICC::TwoPhaseProv::TwoPhaseProvImpl::PostDataSync((uint64_t)a1, (uint64_t *)&__p, &v35);
      long long v22 = v35;
      long long v35 = 0uLL;
      if (v5)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v5);
        if (*((void *)&v35 + 1)) {
          std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v35 + 1));
        }
      }
      uint64_t v23 = (*(uint64_t (**)(void))(*(void *)v22 + 24))(v22);
      if (v23 == 200)
      {
        uint64_t NotificationListForSeqNum = eUICC::TwoPhaseProv::TwoPhaseProvImpl::NotificationSent(v23, (CFDataRef *)&v40, v49, a2);
        if (NotificationListForSeqNum)
        {
          gBBULogMaskGet();
          _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v24, v25, v26, (char)"kVinylResultSuccess == ret");
          int v19 = 2;
          int v20 = 1;
        }
        else
        {
          ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v34, v49);
          int IsNotificationSentRspSuccess = eUICC::TwoPhaseProv::IsNotificationSentRspSuccess((CFDataRef *)&v34);
          ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v34);
          if (IsNotificationSentRspSuccess)
          {
            uint64_t NotificationListForSeqNum = 0;
            int v20 = 0;
            int v19 = 0;
          }
          else
          {
            gBBULogMaskGet();
            _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v31, v32, v33, (char)"IsNotificationSentRspSuccess( euicc_rsp)");
            int v19 = 2;
            int v20 = 1;
            uint64_t NotificationListForSeqNum = 27;
          }
        }
      }
      else
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v27, v28, v29, (char)"kHttpStatusSuccess == handlenotification_rsp->getHttpResponseCode()");
        int v19 = 2;
        int v20 = 1;
        uint64_t NotificationListForSeqNum = 28;
      }
      uint64_t v5 = (std::__shared_weak_count *)*((void *)&v22 + 1);
    }
    else
    {
      uint64_t NotificationListForSeqNum = 0;
      int v20 = 0;
      int v19 = 4;
    }
LABEL_17:
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v37);
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v38);
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v39);
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v40);
    if ((v19 | 4) != 4) {
      break;
    }
    if (++v13 == v14) {
      goto LABEL_7;
    }
  }
  if (v20) {
    goto LABEL_7;
  }
LABEL_8:
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  if (__p)
  {
    uint64_t v43 = __p;
    operator delete(__p);
  }
  std::string __p = &v45;
  std::vector<ctu::cf::CFSharedRef<__CFData const>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v48);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v49);
  return NotificationListForSeqNum;
}

void sub_26387C148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, const void *a13, uint64_t a14, uint64_t a15, char a16, int a17, const void *a18, const void *a19, const void *a20,const void *a21,__int16 a22,char a23,char a24,char *__p,char *a26,uint64_t a27,char a28)
{
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a13);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&a18);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a19);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a20);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a21);
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
  }
  if (__p)
  {
    a26 = __p;
    operator delete(__p);
  }
  std::string __p = &a28;
  std::vector<ctu::cf::CFSharedRef<__CFData const>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v29 - 104));
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v29 - 96));
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::GetProvisioningSessions(uint64_t a1, uint64_t a2, const void **a3, uint64_t a4, void *a5)
{
  uint64_t v34 = 0;
  long long v35 = 0;
  uint64_t v36 = 0;
  std::string __p = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  if ((ctu::cf::assign() & 1) == 0)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"success");
    gBBULogMaskGet();
    int v19 = "Failed to assign request data\n";
LABEL_5:
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", v19, v16, v17, v18, v27);
    uint64_t v9 = 17;
    goto LABEL_6;
  }
  unsigned int v8 = (*(uint64_t (**)(void, void **, void **, uint64_t))(*(void *)*a5 + 32))(*a5, &v34, &__p, a4);
  uint64_t v9 = VinylControllerMapBBUReturnToVinylResult(v8);
  if (v9)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"kVinylResultSuccess == ret");
    goto LABEL_6;
  }
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v28, __p, (uint64_t)v32, v32 - (unsigned char *)__p);
  uint64_t v37 = 0;
  int v21 = ctu::cf::convert_copy();
  char v22 = v21;
  if (v21)
  {
    uint64_t v23 = *a3;
    *a3 = v37;
    uint64_t v38 = v23;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v38);
  }
  if (v28)
  {
    uint64_t v29 = v28;
    operator delete(v28);
  }
  if ((v22 & 1) == 0)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v24, v25, v26, (char)"success");
    gBBULogMaskGet();
    int v19 = "Failed to assign response data\n";
    goto LABEL_5;
  }
  uint64_t v9 = 0;
LABEL_6:
  if (__p)
  {
    uint64_t v32 = __p;
    operator delete(__p);
  }
  if (v34)
  {
    long long v35 = v34;
    operator delete(v34);
  }
  return v9;
}

void sub_26387C410(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, void *a17, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }
  if (a17) {
    operator delete(a17);
  }
  int v20 = *(void **)(v18 - 72);
  if (v20)
  {
    *(void *)(v18 - 64) = v20;
    operator delete(v20);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *eUICC::TwoPhaseProv::TwoPhaseProvImpl::PostDataSync@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v6 = (char *)operator new(0xA0uLL);
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 2) = 0;
  *((void *)v6 + 3) = 850045863;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((void *)v6 + 10) = 0;
  *((void *)v6 + 11) = 1018212795;
  *((_OWORD *)v6 + 6) = 0u;
  *((_OWORD *)v6 + 7) = 0u;
  *(_OWORD *)(v6 + 124) = 0u;
  *(void *)uint64_t v6 = &unk_270EB4D88;
  uint64_t v26 = (atomic_ullong *)v6;
  char v27 = v6;
  std::__assoc_sub_state::__attach_future[abi:ne180100]((uint64_t)v6);
  v23[0] = 0;
  v23[1] = 0;
  char v22 = v23;
  v21[1] = 0;
  unint64_t v21[2] = 0;
  ctu::Http::HttpRequest::create();
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,ctu::Http::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v22, v23[0]);
  (*(void (**)(uint64_t, void))(*(void *)v24 + 8))(v24, *(void *)(a1 + 64));
  uint64_t v7 = v24;
  dispatch::future_callback_impl<std::shared_ptr<ctu::Http::HttpResponse>,std::shared_ptr<ctu::Http::HttpResponse>>(&v26, (void **)&v22);
  (*(void (**)(uint64_t, void **))(*(void *)v7 + 16))(v7, v22);
  if (v22) {
    _Block_release(v22);
  }
  (*(void (**)(uint64_t, double))(*(void *)v24 + 96))(v24, 60.0);
  uint64_t v8 = v24;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(v21, (const void **)(a1 + 72));
  (*(void (**)(uint64_t, const void **))(*(void *)v8 + 88))(v8, v21);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(v21);
  (*(void (**)(uint64_t, uint64_t *))(*(void *)v24 + 56))(v24, a2);
  eUICC::TwoPhaseProv::StringifyDataBuffer(a2, 0);
  eUICC::TwoPhaseProv::LogOversizedPlain((uint64_t)&__p);
  if (v20 < 0) {
    operator delete(__p);
  }
  v17[1] = 0;
  uint64_t v18 = 0;
  v17[0] = 0;
  (*(void (**)(uint64_t, void **))(*(void *)v24 + 40))(v24, v17);
  if (SHIBYTE(v18) < 0) {
    operator delete(v17[0]);
  }
  std::future<std::shared_ptr<ctu::Http::HttpResponse>>::get(&v26, a3);
  gBBULogMaskGet();
  char v9 = (*(uint64_t (**)(void))(**(void **)a3 + 16))();
  (*(void (**)(void))(**(void **)a3 + 24))();
  (*(void (**)(void))(**(void **)a3 + 32))();
  _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "result %d code %d raw_error %ld\n", v10, v11, v12, v9);
  (*(void (**)(void **__return_ptr))(**(void **)a3 + 48))(v15);
  eUICC::TwoPhaseProv::LogOversizedPlain((uint64_t)v15);
  if (v16 < 0) {
    operator delete(v15[0]);
  }
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  uint64_t v13 = v26;
  if (v26 && !atomic_fetch_add(v26 + 1, 0xFFFFFFFFFFFFFFFFLL)) {
    (*(void (**)(atomic_ullong *))(*v13 + 16))(v13);
  }
  return std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::~promise((uint64_t *)&v27);
}

void sub_26387C804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,char a30,uint64_t a31,uint64_t a32)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  long long v35 = *(std::__shared_weak_count **)(v32 + 8);
  if (v35) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v35);
  }
  uint64_t v36 = *(std::__shared_weak_count **)(v33 - 56);
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }
  uint64_t v37 = *(atomic_ullong **)(v33 - 48);
  if (v37)
  {
    if (!atomic_fetch_add(v37 + 1, 0xFFFFFFFFFFFFFFFFLL)) {
      (*(void (**)(atomic_ullong *))(*v37 + 16))(v37);
    }
  }
  std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::~promise((uint64_t *)(v33 - 40));
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::PrepareBPPInstallation(uint64_t a1, uint64_t a2, const void **a3, uint64_t a4, void *a5)
{
  uint64_t v34 = 0;
  long long v35 = 0;
  uint64_t v36 = 0;
  std::string __p = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  if ((ctu::cf::assign() & 1) == 0)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"success");
    gBBULogMaskGet();
    int v19 = "Failed to assign request data\n";
LABEL_5:
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", v19, v16, v17, v18, v27);
    uint64_t v9 = 17;
    goto LABEL_6;
  }
  unsigned int v8 = (*(uint64_t (**)(void, void **, void **, uint64_t))(*(void *)*a5 + 32))(*a5, &v34, &__p, a4);
  uint64_t v9 = VinylControllerMapBBUReturnToVinylResult(v8);
  if (v9)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"kVinylResultSuccess == ret");
    goto LABEL_6;
  }
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v28, __p, (uint64_t)v32, v32 - (unsigned char *)__p);
  uint64_t v37 = 0;
  int v21 = ctu::cf::convert_copy();
  char v22 = v21;
  if (v21)
  {
    uint64_t v23 = *a3;
    *a3 = v37;
    uint64_t v38 = v23;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v38);
  }
  if (v28)
  {
    uint64_t v29 = v28;
    operator delete(v28);
  }
  if ((v22 & 1) == 0)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v24, v25, v26, (char)"success");
    gBBULogMaskGet();
    int v19 = "Failed to assign response data\n";
    goto LABEL_5;
  }
  uint64_t v9 = 0;
LABEL_6:
  if (__p)
  {
    uint64_t v32 = __p;
    operator delete(__p);
  }
  if (v34)
  {
    long long v35 = v34;
    operator delete(v34);
  }
  return v9;
}

void sub_26387CB20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, void *a17, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }
  if (a17) {
    operator delete(a17);
  }
  char v20 = *(void **)(v18 - 72);
  if (v20)
  {
    *(void *)(v18 - 64) = v20;
    operator delete(v20);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::LoadBPP(uint64_t a1, CFDataRef *a2, const void **a3, uint64_t a4, void *a5)
{
  uint64_t v48 = 0;
  int v47 = 0;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB28];
  do
  {
    CFIndex v46 = 0;
    uint64_t v44 = 0;
    CFDataRef v45 = 0;
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    std::string __p = 0;
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    uint64_t NextBppSegment = eUICC::TwoPhaseProv::GetNextBppSegment(&v47, a2, &v48, (unint64_t *)&v46);
    if (NextBppSegment)
    {
LABEL_3:
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v9, v10, v11, (char)"kVinylResultSuccess == ret");
LABEL_4:
      char v12 = 1;
      goto LABEL_5;
    }
    if (!v46)
    {
      uint64_t NextBppSegment = 0;
      char v12 = 0;
      goto LABEL_5;
    }
    BytePtr = CFDataGetBytePtr(*a2);
    CFDataRef v15 = CFDataCreateWithBytesNoCopy(v6, &BytePtr[v48], v46, v7);
    CFDataRef v16 = v45;
    CFDataRef v45 = v15;
    v50[0] = v16;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v50);
    if ((ctu::cf::assign() & 1) == 0)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v18, v19, v20, (char)"success");
      gBBULogMaskGet();
      uint64_t v24 = "Failed to assign request data\n";
LABEL_20:
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", v24, v21, v22, v23, v32);
      char v12 = 1;
      uint64_t NextBppSegment = 17;
      goto LABEL_5;
    }
    unsigned int v17 = (*(uint64_t (**)(void, void **, void **, uint64_t))(*(void *)*a5 + 32))(*a5, &v42, &__p, a4);
    uint64_t NextBppSegment = VinylControllerMapBBUReturnToVinylResult(v17);
    if (NextBppSegment) {
      goto LABEL_3;
    }
    if (v40 != __p)
    {
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v36, __p, (uint64_t)v40, v40 - (unsigned char *)__p);
      uint64_t v49 = 0;
      int v25 = ctu::cf::convert_copy();
      char v26 = v25;
      if (v25)
      {
        char v27 = *a3;
        *a3 = v49;
        v50[0] = v27;
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v50);
      }
      if (v36)
      {
        uint64_t v37 = v36;
        operator delete(v36);
      }
      if (v26)
      {
        uint64_t NextBppSegment = 0;
        goto LABEL_4;
      }
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v28, v29, v30, (char)"success");
      gBBULogMaskGet();
      uint64_t v24 = "Failed to assign response data\n";
      goto LABEL_20;
    }
    uint64_t NextBppSegment = 0;
    char v12 = 0;
    v48 += v46;
LABEL_5:
    if (__p)
    {
      uint64_t v40 = __p;
      operator delete(__p);
    }
    if (v42)
    {
      uint64_t v43 = v42;
      operator delete(v42);
    }
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v45);
    if (v47 == 7) {
      char v13 = 1;
    }
    else {
      char v13 = v12;
    }
  }
  while ((v13 & 1) == 0);
  return NextBppSegment;
}

void sub_26387CE78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,const void *a26)
{
  if (__p) {
    operator delete(__p);
  }
  if (a20) {
    operator delete(a20);
  }
  if (a23) {
    operator delete(a23);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a26);
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::NotificationSent(uint64_t a1, CFDataRef *a2, const void **a3, void *a4)
{
  char v26 = 0;
  __int16 v25 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v6 = eUICC::TwoPhaseProv::ComposeNsr(a2, &v26);
  if (v6)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"kVinylResultSuccess == ret");
  }
  else
  {
    ctu::cf::assign();
    unsigned int v10 = (*(uint64_t (**)(void, void **, void **, __int16 *))(*(void *)*a4 + 32))(*a4, &v22, &v19, &v25);
    uint64_t v6 = VinylControllerMapBBUReturnToVinylResult(v10);
    if (v6)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)"kVinylResultSuccess == ret");
    }
    else
    {
      std::string __p = 0;
      unsigned int v17 = 0;
      uint64_t v18 = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v19, (uint64_t)v20, v20 - (unsigned char *)v19);
      char v27 = 0;
      if (ctu::cf::convert_copy())
      {
        uint64_t v14 = *a3;
        *a3 = v27;
        uint64_t v28 = v14;
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v28);
      }
      if (__p)
      {
        unsigned int v17 = __p;
        operator delete(__p);
      }
      uint64_t v6 = 0;
    }
  }
  if (v19)
  {
    uint64_t v20 = v19;
    operator delete(v19);
  }
  if (v22)
  {
    uint64_t v23 = v22;
    operator delete(v22);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v26);
  return v6;
}

void sub_26387D078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21)
{
  if (__p) {
    operator delete(__p);
  }
  if (a17) {
    operator delete(a17);
  }
  if (a20) {
    operator delete(a20);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v21 - 56));
  _Unwind_Resume(a1);
}

void std::future<std::shared_ptr<ctu::Http::HttpResponse>>::get(atomic_ullong **a1@<X0>, _OWORD *a2@<X8>)
{
  CFAllocatorRef v2 = *a1;
  *a1 = 0;
  std::__assoc_state<std::shared_ptr<ctu::Http::HttpResponse>>::move((uint64_t)v2, a2);
  if (v2 && !atomic_fetch_add(v2 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v3 = *(void (**)(atomic_ullong *))(*v2 + 16);
    v3(v2);
  }
}

void sub_26387D144(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::future<BOOL>::get(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::TwoPhaseProv::Perform(uint64_t a1, void *a2)
{
  pthread_mutex_lock(&ctu::Singleton<eUICC::TwoPhaseProv::TwoPhaseProvImpl,eUICC::TwoPhaseProv::TwoPhaseProvImpl,ctu::PthreadMutexGuardPolicy<eUICC::TwoPhaseProv::TwoPhaseProvImpl>>::sInstance);
  uint64_t v4 = xmmword_26A9A0D80;
  if (!(void)xmmword_26A9A0D80)
  {
    uint64_t v5 = operator new(0x180uLL);
    v5[368] = 0;
    *(_OWORD *)uint64_t v5 = 0u;
    *((_OWORD *)v5 + 1) = 0u;
    *((_OWORD *)v5 + 2) = 0u;
    *((_OWORD *)v5 + 3) = 0u;
    *((_OWORD *)v5 + 4) = 0u;
    *((void *)v5 + 10) = 0;
    std::shared_ptr<eUICC::TwoPhaseProv::TwoPhaseProvImpl>::shared_ptr[abi:ne180100]<eUICC::TwoPhaseProv::TwoPhaseProvImpl,void>(&v12, (uint64_t)v5);
    long long v6 = v12;
    long long v12 = 0uLL;
    uint64_t v7 = (std::__shared_weak_count *)*((void *)&xmmword_26A9A0D80 + 1);
    xmmword_26A9A0D80 = v6;
    if (v7)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
      if (*((void *)&v12 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v12 + 1));
      }
    }
    uint64_t v4 = xmmword_26A9A0D80;
  }
  uint64_t v8 = (std::__shared_weak_count *)*((void *)&xmmword_26A9A0D80 + 1);
  if (*((void *)&xmmword_26A9A0D80 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_26A9A0D80 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<eUICC::TwoPhaseProv::TwoPhaseProvImpl,eUICC::TwoPhaseProv::TwoPhaseProvImpl,ctu::PthreadMutexGuardPolicy<eUICC::TwoPhaseProv::TwoPhaseProvImpl>>::sInstance);
  uint64_t v9 = eUICC::TwoPhaseProv::TwoPhaseProvImpl::Perform(v4, a1, a2);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  pthread_mutex_lock(&ctu::Singleton<eUICC::TwoPhaseProv::TwoPhaseProvImpl,eUICC::TwoPhaseProv::TwoPhaseProvImpl,ctu::PthreadMutexGuardPolicy<eUICC::TwoPhaseProv::TwoPhaseProvImpl>>::sInstance);
  unsigned int v10 = (std::__shared_weak_count *)*((void *)&xmmword_26A9A0D80 + 1);
  xmmword_26A9A0D80 = 0uLL;
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  pthread_mutex_unlock(&ctu::Singleton<eUICC::TwoPhaseProv::TwoPhaseProvImpl,eUICC::TwoPhaseProv::TwoPhaseProvImpl,ctu::PthreadMutexGuardPolicy<eUICC::TwoPhaseProv::TwoPhaseProvImpl>>::sInstance);
  return v9;
}

void sub_26387D280(_Unwind_Exception *a1)
{
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::ListInstallationNotifications(uint64_t a1, const void **a2, void *a3)
{
  uint64_t v5 = operator new(7uLL);
  uint64_t v21 = (char *)v5 + 7;
  uint64_t v22 = (char *)v5 + 7;
  *(_DWORD *)uint64_t v5 = -2130433857;
  v5[2] = 1794;
  *((unsigned char *)v5 + 6) = 0x80;
  uint64_t v20 = v5;
  unsigned int v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  __int16 v16 = 0;
  unsigned int v6 = (*(uint64_t (**)(void, void **, void **, __int16 *))(*(void *)*a3 + 32))(*a3, &v20, &v17, &v16);
  uint64_t v7 = VinylControllerMapBBUReturnToVinylResult(v6);
  if (v7)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v8, v9, v10, (char)"kVinylResultSuccess == ret");
  }
  else
  {
    std::string __p = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v17, (uint64_t)v18, v18 - (unsigned char *)v17);
    uint64_t v23 = 0;
    if (ctu::cf::convert_copy())
    {
      uint64_t v11 = *a2;
      *a2 = v23;
      uint64_t v24 = v11;
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v24);
    }
    if (__p)
    {
      uint64_t v14 = __p;
      operator delete(__p);
    }
  }
  if (v17)
  {
    uint64_t v18 = v17;
    operator delete(v17);
  }
  if (v20)
  {
    uint64_t v21 = v20;
    operator delete(v20);
  }
  return v7;
}

void sub_26387D418(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }
  if (a17) {
    operator delete(a17);
  }
  uint64_t v20 = *(void **)(v18 - 56);
  if (v20)
  {
    *(void *)(v18 - 48) = v20;
    operator delete(v20);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::RetrieveNotificationListForSeqNum(uint64_t a1, CFDataRef *a2, const void **a3, void *a4)
{
  uint64_t v25 = 0;
  char v26 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  __int16 v19 = 0;
  uint64_t v6 = eUICC::TwoPhaseProv::ComposeRnl(a2, &v26);
  if (v6)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"kVinylResultSuccess == ret");
  }
  else
  {
    ctu::cf::assign();
    unsigned int v10 = (*(uint64_t (**)(void, void **, void **, __int16 *))(*(void *)*a4 + 32))(*a4, &v23, &v20, &v19);
    uint64_t v6 = VinylControllerMapBBUReturnToVinylResult(v10);
    if (v6)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)"kVinylResultSuccess == ret");
    }
    else
    {
      std::string __p = 0;
      unsigned int v17 = 0;
      uint64_t v18 = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v20, (uint64_t)v21, v21 - (unsigned char *)v20);
      char v27 = 0;
      if (ctu::cf::convert_copy())
      {
        uint64_t v14 = *a3;
        *a3 = v27;
        uint64_t v28 = v14;
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v28);
      }
      if (__p)
      {
        unsigned int v17 = __p;
        operator delete(__p);
      }
      uint64_t v6 = 0;
    }
  }
  if (v20)
  {
    uint64_t v21 = v20;
    operator delete(v20);
  }
  if (v23)
  {
    uint64_t v24 = v23;
    operator delete(v23);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v26);
  return v6;
}

void sub_26387D608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19)
{
  if (__p) {
    operator delete(__p);
  }
  if (a18) {
    operator delete(a18);
  }
  uint64_t v21 = *(void **)(v19 - 80);
  if (v21)
  {
    *(void *)(v19 - 72) = v21;
    operator delete(v21);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v19 - 56));
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::GetProfilesInfoList(uint64_t a1, const void **a2, void *a3)
{
  uint64_t v5 = (char *)operator new(9uLL);
  uint64_t v21 = v5 + 9;
  uint64_t v22 = v5 + 9;
  *(void *)uint64_t v5 = 0x709F5A045C062DBFLL;
  v5[8] = -30;
  uint64_t v20 = v5;
  unsigned int v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  __int16 v16 = 0;
  unsigned int v6 = (*(uint64_t (**)(void, void **, void **, __int16 *))(*(void *)*a3 + 32))(*a3, &v20, &v17, &v16);
  uint64_t v7 = VinylControllerMapBBUReturnToVinylResult(v6);
  if (v7)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v8, v9, v10, (char)"kVinylResultSuccess == ret");
  }
  else
  {
    std::string __p = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v17, (uint64_t)v18, v18 - (unsigned char *)v17);
    uint64_t v23 = 0;
    if (ctu::cf::convert_copy())
    {
      uint64_t v11 = *a2;
      *a2 = v23;
      uint64_t v24 = v11;
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v24);
    }
    if (__p)
    {
      uint64_t v14 = __p;
      operator delete(__p);
    }
  }
  if (v17)
  {
    uint64_t v18 = v17;
    operator delete(v17);
  }
  if (v20)
  {
    uint64_t v21 = v20;
    operator delete(v20);
  }
  return v7;
}

void sub_26387D7AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }
  if (a17) {
    operator delete(a17);
  }
  uint64_t v20 = *(void **)(v18 - 56);
  if (v20)
  {
    *(void *)(v18 - 48) = v20;
    operator delete(v20);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t *a1, const std::string *a2, int a3)
{
  uint64_t v6 = MEMORY[0x263F8C328] + 104;
  a1[16] = MEMORY[0x263F8C328] + 104;
  uint64_t v7 = a1 + 2;
  uint64_t v8 = MEMORY[0x263F8C328] + 64;
  a1[2] = MEMORY[0x263F8C328] + 64;
  uint64_t v9 = (uint64_t)(a1 + 3);
  uint64_t v10 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v11 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v12 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *a1 = v12;
  *(uint64_t *)((char *)a1 + *(void *)(v12 - 24)) = v11;
  a1[1] = 0;
  uint64_t v13 = (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24));
  std::ios_base::init(v13, a1 + 3);
  uint64_t v14 = MEMORY[0x263F8C328] + 24;
  v13[1].__vftable = 0;
  v13[1].__fmtflags_ = -1;
  uint64_t v15 = v10[5];
  uint64_t v16 = v10[4];
  a1[2] = v16;
  *(void *)((char *)v7 + *(void *)(v16 - 24)) = v15;
  uint64_t v17 = v10[1];
  *a1 = v17;
  *(uint64_t *)((char *)a1 + *(void *)(v17 - 24)) = v10[6];
  *a1 = v14;
  a1[16] = v6;
  a1[2] = v8;
  std::stringbuf::basic_stringbuf[abi:ne180100](v9, a2, a3);
  return a1;
}

void sub_26387DA8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

uint64_t *std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(uint64_t *a1, uint64_t a2)
{
  MEMORY[0x263E6C880](&v20, a1, 0);
  if (!v20) {
    return a1;
  }
  if (*(char *)(a2 + 23) < 0)
  {
    **(unsigned char **)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 23) = 0;
  }
  uint64_t v4 = *(void *)(*a1 - 24);
  uint64_t v5 = *(uint64_t *)((char *)a1 + v4 + 24);
  if (v5 <= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = *(uint64_t *)((char *)a1 + v4 + 24);
  }
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + v4));
  uint64_t v7 = std::locale::use_facet(&v19, MEMORY[0x263F8C108]);
  std::locale::~locale(&v19);
  uint64_t v8 = 0;
  uint64_t v9 = a1 + 5;
  if (v5 >= 1) {
    uint64_t v10 = v6;
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFF7;
  }
  while (1)
  {
    uint64_t v11 = *(void **)((char *)v9 + *(void *)(*a1 - 24));
    uint64_t v12 = (unsigned char *)v11[3];
    if (v12 == (unsigned char *)v11[4]) {
      break;
    }
    LOBYTE(v13) = *v12;
LABEL_14:
    if ((v13 & 0x80) == 0 && (*((_DWORD *)&v7[1].~facet + v13) & 0x4000) != 0)
    {
      int v16 = 0;
      goto LABEL_23;
    }
    std::string::push_back((std::string *)a2, v13);
    uint64_t v14 = *(void **)((char *)v9 + *(void *)(*a1 - 24));
    uint64_t v15 = v14[3];
    if (v15 == v14[4]) {
      (*(void (**)(void *))(*v14 + 80))(v14);
    }
    else {
      v14[3] = v15 + 1;
    }
    if (v10 == ++v8)
    {
      int v16 = 0;
      uint64_t v8 = 1;
      goto LABEL_23;
    }
  }
  int v13 = (*(uint64_t (**)(void *))(*v11 + 72))(v11);
  if (v13 != -1) {
    goto LABEL_14;
  }
  int v16 = 2;
LABEL_23:
  uint64_t v17 = *a1;
  *(uint64_t *)((char *)a1 + *(void *)(*a1 - 24) + 24) = 0;
  if (!v8) {
    v16 |= 4u;
  }
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(v17 - 24)), *(_DWORD *)((char *)a1 + *(void *)(v17 - 24) + 32) | v16);
  return a1;
}

void sub_26387DCD4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::locale::~locale(&a9);
  __cxa_begin_catch(a1);
  uint64_t v11 = *v9;
  *(_DWORD *)((char *)v9 + *(void *)(*v9 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v9 + *(void *)(v11 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x26387DC90);
  }
  __cxa_rethrow();
}

void sub_26387DD70(_Unwind_Exception *a1)
{
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::DisableProfile(uint64_t a1, CFDataRef *a2, void *a3)
{
  uint64_t v31 = 0;
  char v32 = 0;
  BOOL v30 = 0;
  __int16 v29 = 0;
  char v26 = 0;
  char v27 = 0;
  uint64_t v28 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v4 = eUICC::TwoPhaseProv::ComposeDisableReq(a2, &v32);
  if (v4)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v5, v6, v7, (char)"kVinylResultSuccess == ret");
  }
  else
  {
    ctu::cf::assign();
    unsigned int v8 = (*(uint64_t (**)(void, void **, void **, __int16 *))(*(void *)*a3 + 32))(*a3, &v26, &v23, &v29);
    uint64_t v4 = VinylControllerMapBBUReturnToVinylResult(v8);
    if (v4)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v9, v10, v11, (char)"kVinylResultSuccess == ret");
    }
    else
    {
      std::string __p = 0;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v23, (uint64_t)v24, v24 - (unsigned char *)v23);
      uint64_t v33 = 0;
      if (ctu::cf::convert_copy())
      {
        uint64_t v12 = v31;
        uint64_t v31 = v33;
        uint64_t v34 = v12;
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v34);
      }
      if (__p)
      {
        uint64_t v21 = __p;
        operator delete(__p);
      }
      if (eUICC::TwoPhaseProv::ExtractDisableResult((CFDataRef *)&v31, &v30))
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"kVinylResultSuccess == ret");
        uint64_t v4 = 27;
      }
      else if (v30)
      {
        uint64_t v4 = 0;
      }
      else
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)"success");
        uint64_t v4 = 29;
      }
    }
  }
  if (v23)
  {
    uint64_t v24 = v23;
    operator delete(v23);
  }
  if (v26)
  {
    char v27 = v26;
    operator delete(v26);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v31);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v32);
  return v4;
}

void sub_26387DFD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20)
{
  if (__p) {
    operator delete(__p);
  }
  if (a16) {
    operator delete(a16);
  }
  if (a19) {
    operator delete(a19);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v20 - 48));
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v20 - 40));
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::DeleteProfile(uint64_t a1, CFDataRef *a2, void *a3)
{
  uint64_t v31 = 0;
  char v32 = 0;
  BOOL v30 = 0;
  __int16 v29 = 0;
  char v26 = 0;
  char v27 = 0;
  uint64_t v28 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v4 = eUICC::TwoPhaseProv::ComposeDeleteReq(a2, &v32);
  if (v4)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v5, v6, v7, (char)"kVinylResultSuccess == ret");
  }
  else
  {
    ctu::cf::assign();
    unsigned int v8 = (*(uint64_t (**)(void, void **, void **, __int16 *))(*(void *)*a3 + 32))(*a3, &v26, &v23, &v29);
    uint64_t v4 = VinylControllerMapBBUReturnToVinylResult(v8);
    if (v4)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v9, v10, v11, (char)"kVinylResultSuccess == ret");
    }
    else
    {
      std::string __p = 0;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v23, (uint64_t)v24, v24 - (unsigned char *)v23);
      uint64_t v33 = 0;
      if (ctu::cf::convert_copy())
      {
        uint64_t v12 = v31;
        uint64_t v31 = v33;
        uint64_t v34 = v12;
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v34);
      }
      if (__p)
      {
        uint64_t v21 = __p;
        operator delete(__p);
      }
      if (eUICC::TwoPhaseProv::ExtractDeleteResult((CFDataRef *)&v31, &v30))
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"kVinylResultSuccess == ret");
        uint64_t v4 = 27;
      }
      else if (v30)
      {
        uint64_t v4 = 0;
      }
      else
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)"success");
        uint64_t v4 = 29;
      }
    }
  }
  if (v23)
  {
    uint64_t v24 = v23;
    operator delete(v23);
  }
  if (v26)
  {
    char v27 = v26;
    operator delete(v26);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v31);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v32);
  return v4;
}

void sub_26387E278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20)
{
  if (__p) {
    operator delete(__p);
  }
  if (a16) {
    operator delete(a16);
  }
  if (a19) {
    operator delete(a19);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v20 - 48));
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v20 - 40));
  _Unwind_Resume(a1);
}

void *eUICC::TwoPhaseProv::TwoPhaseProvImpl::create_default_global@<X0>(void *a1@<X8>)
{
  uint64_t v3 = operator new(0x180uLL);
  v3[368] = 0;
  *(_OWORD *)uint64_t v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_OWORD *)v3 + 4) = 0u;
  *((void *)v3 + 10) = 0;

  return std::shared_ptr<eUICC::TwoPhaseProv::TwoPhaseProvImpl>::shared_ptr[abi:ne180100]<eUICC::TwoPhaseProv::TwoPhaseProvImpl,void>(a1, (uint64_t)v3);
}

const void **ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::operator=(const void **a1, const void **a2)
{
  if (a1 != a2)
  {
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v5, a2);
    uint64_t v3 = *a1;
    *a1 = v5;
    uint64_t v5 = v3;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v5);
  }
  return a1;
}

void std::__assoc_state<std::shared_ptr<ctu::Http::HttpResponse>>::~__assoc_state(uint64_t a1)
{
  *(void *)a1 = MEMORY[0x263F8C320] + 16;
  CFAllocatorRef v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);

  std::__shared_count::~__shared_count((std::__shared_count *)a1);
}

{
  std::exception_ptr *v2;
  void *v3;
  uint64_t vars8;

  *(void *)a1 = MEMORY[0x263F8C320] + 16;
  CFAllocatorRef v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);

  operator delete(v3);
}

uint64_t std::__assoc_state<std::shared_ptr<ctu::Http::HttpResponse>>::__on_zero_shared(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 136))
  {
    CFAllocatorRef v2 = *(std::__shared_weak_count **)(a1 + 152);
    if (v2) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v2);
    }
  }
  uint64_t v3 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 8);

  return v3(a1);
}

uint64_t *std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::~promise(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    if ((*(unsigned char *)(v2 + 136) & 1) == 0)
    {
      v7.__ptr_ = 0;
      uint64_t v3 = *(void *)(v2 + 16);
      std::exception_ptr::~exception_ptr(&v7);
      uint64_t v2 = *a1;
      if (!v3 && *(uint64_t *)(v2 + 8) >= 1)
      {
        uint64_t v4 = std::future_category();
        MEMORY[0x263E6C860](v6, 4, v4);
        std::make_exception_ptr[abi:ne180100]<std::future_error>(v6);
      }
    }
    if (!atomic_fetch_add((atomic_ullong *volatile)(v2 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
      (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
    }
  }
  return a1;
}

void std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,ctu::Http::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,ctu::Http::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,ctu::Http::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

uint64_t *dispatch::future_callback_impl<std::shared_ptr<ctu::Http::HttpResponse>,std::shared_ptr<ctu::Http::HttpResponse>>@<X0>(atomic_ullong **a1@<X0>, void **a2@<X8>)
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3002000000;
  v8[3] = __Block_byref_object_copy__0;
  v8[4] = __Block_byref_object_dispose__0;
  uint64_t v4 = (char *)operator new(0xA0uLL);
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *((void *)v4 + 3) = 850045863;
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *((_OWORD *)v4 + 4) = 0u;
  *((void *)v4 + 10) = 0;
  *((void *)v4 + 11) = 1018212795;
  *((_OWORD *)v4 + 6) = 0u;
  *((_OWORD *)v4 + 7) = 0u;
  *(_OWORD *)(v4 + 124) = 0u;
  *(void *)uint64_t v4 = &unk_270EB4D88;
  uint64_t v9 = v4;
  std::__assoc_sub_state::__attach_future[abi:ne180100]((uint64_t)v4);
  uint64_t v5 = *a1;
  *a1 = (atomic_ullong *)v4;
  if (v5 && !atomic_fetch_add(v5 + 1, 0xFFFFFFFFFFFFFFFFLL)) {
    (*(void (**)(atomic_ullong *))(*v5 + 16))(v5);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN8dispatch20future_callback_implINSt3__110shared_ptrIN3ctu4Http12HttpResponseEEES6_EENS_5blockIU13block_pointerFvT0_EEERNS1_6futureIT_EE_block_invoke;
  aBlock[3] = &unk_2655D7938;
  aBlock[4] = v8;
  *a2 = _Block_copy(aBlock);
  _Block_object_dispose(v8, 8);
  return std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::~promise((uint64_t *)&v9);
}

void sub_26387E7DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::~promise(v7);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t *__Block_byref_object_dispose__0(uint64_t a1)
{
  return std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::~promise((uint64_t *)(a1 + 40));
}

void ___ZN8dispatch20future_callback_implINSt3__110shared_ptrIN3ctu4Http12HttpResponseEEES6_EENS_5blockIU13block_pointerFvT0_EEERNS1_6futureIT_EE_block_invoke(uint64_t a1, uint64_t a2)
{
}

void std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::set_value(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (!v2) {
    std::__throw_future_error[abi:ne180100](3u);
  }

  std::__assoc_state<std::shared_ptr<ctu::Http::HttpResponse>>::set_value<std::shared_ptr<ctu::Http::HttpResponse>>(v2, a2);
}

void std::__assoc_state<std::shared_ptr<ctu::Http::HttpResponse>>::set_value<std::shared_ptr<ctu::Http::HttpResponse>>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (std::mutex *)(a1 + 24);
  std::mutex::lock((std::mutex *)(a1 + 24));
  if ((*(unsigned char *)(a1 + 136) & 1) != 0
    || (v6.__ptr_ = 0, uint64_t v5 = *(void *)(a1 + 16), std::exception_ptr::~exception_ptr(&v6), v5))
  {
    std::__throw_future_error[abi:ne180100](2u);
  }
  *(_OWORD *)(a1 + 144) = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_DWORD *)(a1 + 136) |= 5u;
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 88));
  std::mutex::unlock(v4);
}

void sub_26387E8EC(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void std::__assoc_state<std::shared_ptr<ctu::Http::HttpResponse>>::move(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(a1 + 24);
  __lk.__owns_ = 1;
  std::mutex::lock((std::mutex *)(a1 + 24));
  std::__assoc_sub_state::__sub_wait((std::__assoc_sub_state *)a1, &__lk);
  uint64_t v4 = *(void *)(a1 + 16);
  v7.__ptr_ = 0;
  std::exception_ptr::~exception_ptr(&v7);
  if (v4)
  {
    std::exception_ptr::exception_ptr(&v6, (const std::exception_ptr *)(a1 + 16));
    v5.__ptr_ = &v6;
    std::rethrow_exception(v5);
    __break(1u);
  }
  else
  {
    *a2 = *(_OWORD *)(a1 + 144);
    *(void *)(a1 + 144) = 0;
    *(void *)(a1 + 152) = 0;
    if (__lk.__owns_) {
      std::mutex::unlock(__lk.__m_);
    }
  }
}

void sub_26387E9A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, char a12)
{
  if (a12) {
    std::mutex::unlock(a11);
  }
  _Unwind_Resume(a1);
}

uint64_t ctu::PthreadMutexGuardPolicy<eUICC::TwoPhaseProv::TwoPhaseProvImpl>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 72);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return a1;
}

uint64_t std::stringbuf::basic_stringbuf[abi:ne180100](uint64_t a1, const std::string *a2, int a3)
{
  uint64_t v6 = std::streambuf::basic_streambuf();
  *(void *)uint64_t v6 = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_DWORD *)(v6 + 96) = a3;
  std::string::operator=((std::string *)(v6 + 64), a2);
  std::stringbuf::__init_buf_ptrs[abi:ne180100](a1);
  return a1;
}

void sub_26387EAA0(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 87) < 0) {
    operator delete(*v2);
  }
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

void std::stringbuf::__init_buf_ptrs[abi:ne180100](uint64_t a1)
{
  *(void *)(a1 + 88) = 0;
  uint64_t v2 = (std::string *)(a1 + 64);
  char v3 = *(unsigned char *)(a1 + 87);
  if (v3 < 0)
  {
    uint64_t v4 = *(std::string **)(a1 + 64);
    unint64_t v5 = *(void *)(a1 + 72);
  }
  else
  {
    uint64_t v4 = v2;
    unint64_t v5 = *(unsigned __int8 *)(a1 + 87);
  }
  int v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = (char *)v4 + v5;
  }
  if ((v6 & 0x10) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    std::string::size_type v7 = v3 < 0 ? (*(void *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22;
    std::string::resize(v2, v7, 0);
    uint64_t v8 = *(char *)(a1 + 87) < 0 ? *(void *)(a1 + 72) : *(unsigned __int8 *)(a1 + 87);
    *(void *)(a1 + 40) = v4;
    *(void *)(a1 + 48) = v4;
    *(void *)(a1 + 56) = (char *)v4 + v8;
    if ((*(unsigned char *)(a1 + 96) & 3) != 0)
    {
      if (v5 >> 31)
      {
        uint64_t v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        unint64_t v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
        uint64_t v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
        unint64_t v5 = v5 - v10 - 0x7FFFFFFF;
        *(void *)(a1 + 48) = v4;
      }
      if (v5) {
        *(void *)(a1 + 48) = (char *)v4 + v5;
      }
    }
  }
}

void *std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::find<std::vector<unsigned char>>(uint64_t a1, unsigned __int8 **a2)
{
  char v3 = (void *)(a1 + 8);
  uint64_t result = std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::__lower_bound<std::vector<unsigned char>>(a1, a2, *(void **)(a1 + 8), (void *)(a1 + 8));
  if (v3 != result)
  {
    uint64_t v6 = result[4];
    uint64_t v5 = result[5];
    if (v6 == v5) {
      return result;
    }
    std::string::size_type v7 = *a2;
    uint64_t v8 = v6 + 1;
    while (v7 != a2[1])
    {
      unsigned int v9 = *v7;
      unsigned int v10 = *(unsigned __int8 *)(v8 - 1);
      if (v9 < v10) {
        break;
      }
      ++v7;
      if (v10 < v9 || v8++ == v5) {
        return result;
      }
    }
  }
  return v3;
}

void *std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::__lower_bound<std::vector<unsigned char>>(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t result = a4;
  if (a3)
  {
    uint64_t v5 = a2[1];
    do
    {
      if (*a2 == v5)
      {
LABEL_12:
        uint64_t result = a3;
      }
      else
      {
        uint64_t v6 = (unsigned __int8 *)a3[4];
        uint64_t v7 = *a2 + 1;
        while (v6 != (unsigned __int8 *)a3[5])
        {
          unsigned int v8 = *v6;
          unsigned int v9 = *(unsigned __int8 *)(v7 - 1);
          if (v8 < v9) {
            break;
          }
          ++v6;
          if (v9 < v8 || v7++ == v5) {
            goto LABEL_12;
          }
        }
        ++a3;
      }
      a3 = (void *)*a3;
    }
    while (a3);
  }
  return result;
}

void std::vector<ctu::cf::CFSharedRef<__CFData const>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (const void **)**a1;
  if (v2)
  {
    uint64_t v4 = (const void **)v1[1];
    uint64_t v5 = v2;
    if (v4 != v2)
    {
      do
        uint64_t v4 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v4 - 1);
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *std::shared_ptr<eUICC::TwoPhaseProv::TwoPhaseProvImpl>::shared_ptr[abi:ne180100]<eUICC::TwoPhaseProv::TwoPhaseProvImpl,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = operator new(0x20uLL);
  *uint64_t v4 = &unk_270EB4DD0;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_26387ED98(_Unwind_Exception *exception_object)
{
  if (v1)
  {
    eUICC::TwoPhaseProv::TwoPhaseProvImpl::~TwoPhaseProvImpl(v1);
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<eUICC::TwoPhaseProv::TwoPhaseProvImpl *,std::shared_ptr<eUICC::TwoPhaseProv::TwoPhaseProvImpl>::__shared_ptr_default_delete<eUICC::TwoPhaseProv::TwoPhaseProvImpl,eUICC::TwoPhaseProv::TwoPhaseProvImpl>,std::allocator<eUICC::TwoPhaseProv::TwoPhaseProvImpl>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<eUICC::TwoPhaseProv::TwoPhaseProvImpl *,std::shared_ptr<eUICC::TwoPhaseProv::TwoPhaseProvImpl>::__shared_ptr_default_delete<eUICC::TwoPhaseProv::TwoPhaseProvImpl,eUICC::TwoPhaseProv::TwoPhaseProvImpl>,std::allocator<eUICC::TwoPhaseProv::TwoPhaseProvImpl>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(const void ***)(a1 + 24);
  if (v1)
  {
    eUICC::TwoPhaseProv::TwoPhaseProvImpl::~TwoPhaseProvImpl(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<eUICC::TwoPhaseProv::TwoPhaseProvImpl *,std::shared_ptr<eUICC::TwoPhaseProv::TwoPhaseProvImpl>::__shared_ptr_default_delete<eUICC::TwoPhaseProv::TwoPhaseProvImpl,eUICC::TwoPhaseProv::TwoPhaseProvImpl>,std::allocator<eUICC::TwoPhaseProv::TwoPhaseProvImpl>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void eUICC::TwoPhaseProv::TwoPhaseProvImpl::~TwoPhaseProvImpl(const void **this)
{
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(this + 10);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(this + 9);
  uint64_t v2 = this[8];
  if (v2) {
    dispatch_release(v2);
  }
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(this + 7);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(this + 6);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(this + 5);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(this + 4);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(this + 3);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(this + 2);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(this + 1);

  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(this);
}

uint64_t __cxx_global_var_init_5()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<eUICC::TwoPhaseProv::TwoPhaseProvImpl>::~PthreadMutexGuardPolicy, &ctu::Singleton<eUICC::TwoPhaseProv::TwoPhaseProvImpl,eUICC::TwoPhaseProv::TwoPhaseProvImpl,ctu::PthreadMutexGuardPolicy<eUICC::TwoPhaseProv::TwoPhaseProvImpl>>::sInstance, &dword_263869000);
  }
  return result;
}

uint64_t eUICC::ClearMetadata::GetListOfIccids(int a1, const void ***a2, void *a3)
{
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylClearMetadata", "", "VinylClearMetadata::GetListOfIccids: Requesting Profile List\n", v6, v7, v8, v32);
  unsigned int v9 = operator new(7uLL);
  int v55 = (char *)v9 + 7;
  uint64_t v56 = (char *)v9 + 7;
  *(_DWORD *)unsigned int v9 = 1543777727;
  void v9[2] = 23042;
  *((unsigned char *)v9 + 6) = -107;
  uint64_t v53 = 0;
  uint64_t v54 = v9;
  uint64_t v51 = 0;
  char v52 = 0;
  CFDataRef v50 = 0;
  __int16 v49 = 0;
  (*(void (**)(void, void **, void **, __int16 *))(*(void *)*a3 + 32))(*a3, &v54, &v51, &v49);
  std::string __p = 0;
  int v47 = 0;
  uint64_t v48 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v51, (uint64_t)v52, v52 - (unsigned char *)v51);
  CFDataRef v43 = 0;
  if (ctu::cf::convert_copy())
  {
    CFDataRef v10 = v50;
    CFDataRef v50 = v43;
    v36[0] = v10;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v36);
  }
  if (__p)
  {
    int v47 = __p;
    operator delete(__p);
  }
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylClearMetadata", "", "VinylClearMetadata::GetListOfIccids: Extracting Profile List\n", v11, v12, v13, v33);
  CFIndex Length = CFDataGetLength(v50);
  CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef MutableCopy = CFDataCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], Length, v50);
  CFIndex v41 = 0;
  CFDataRef theData = MutableCopy;
  MutableBytePtr = 0;
  MutableBytePtr = CFDataGetMutableBytePtr(MutableCopy);
  CFIndex v41 = CFDataGetLength(theData);
  if (DERDecodeSeqContentInit((unint64_t *)&MutableBytePtr, v45)) {
    goto LABEL_6;
  }
  if (DERDecodeSeqNext(v45, (unint64_t *)&v43) || v43 != (const __CFData *)0xA00000000000002DLL)
  {
    gBBULogMaskGet();
    uint64_t v20 = "DR_Success == der_ret && TAG_PILR == dec.tag";
    goto LABEL_7;
  }
  if (DERDecodeSeqContentInit(v44, v45)) {
    goto LABEL_6;
  }
  if (DERDecodeSeqNext(v45, (unint64_t *)&v43) || v43 != (const __CFData *)0xA000000000000000)
  {
    gBBULogMaskGet();
    uint64_t v20 = "DR_Success == der_ret && TAG_PILR_OK == dec.tag";
    goto LABEL_7;
  }
  if (DERDecodeSeqContentInit(v44, v45))
  {
LABEL_6:
    gBBULogMaskGet();
    uint64_t v20 = "DR_Success == der_ret";
LABEL_7:
    _BBULog(0, 0xFFFFFFFFLL, "VinylClearMetadata", "", "Condition <<%s>> failed %s %s/%d\n", v17, v18, v19, (char)v20);
    goto LABEL_8;
  }
  while (1)
  {
    if (DERDecodeSeqNext(v45, (unint64_t *)&v43) == 1)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylClearMetadata", "", "VinylClearMetadata::GetListOfIccids: Successfully populated ICCID list!\n", v25, v26, v27, v34);
      uint64_t v21 = 0;
      goto LABEL_9;
    }
    int v38 = 0;
    CFDataRef v35 = 0;
    if (DERDecodeSeqContentInit(v44, &v39)) {
      break;
    }
    if (v43 != (const __CFData *)0xE000000000000003)
    {
      gBBULogMaskGet();
      uint64_t v31 = "DR_Success == der_ret && TAG_PI == dec.tag";
      goto LABEL_37;
    }
    CFDataRef v23 = CFDataCreate(v15, (const UInt8 *)v36[0], (CFIndex)v36[1]);
    CFDataRef v24 = v35;
    CFDataRef v35 = v23;
    CFDataRef v57 = v24;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v57);
    if (DERParseInteger(&v37, &v38)) {
      break;
    }
    if (!a1 || v38 == 1) {
      std::vector<ctu::cf::CFSharedRef<__CFData const>>::push_back[abi:ne180100](a2, (const void **)&v35);
    }
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v35);
  }
  gBBULogMaskGet();
  uint64_t v31 = "DR_Success == der_ret";
LABEL_37:
  _BBULog(0, 0xFFFFFFFFLL, "VinylClearMetadata", "", "Condition <<%s>> failed %s %s/%d\n", v28, v29, v30, (char)v31);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v35);
LABEL_8:
  uint64_t v21 = 27;
LABEL_9:
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)&theData);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v50);
  if (v51)
  {
    char v52 = v51;
    operator delete(v51);
  }
  if (v54)
  {
    int v55 = v54;
    operator delete(v54);
  }
  return v21;
}

void sub_26387F354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, const void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,const void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30)
{
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a13);
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef(&a23);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v30 - 144));
  char v32 = *(void **)(v30 - 136);
  if (v32)
  {
    *(void *)(v30 - 128) = v32;
    operator delete(v32);
  }
  char v33 = *(void **)(v30 - 112);
  if (v33)
  {
    *(void *)(v30 - 104) = v33;
    operator delete(v33);
  }
  _Unwind_Resume(a1);
}

uint64_t eUICC::ClearMetadata::ClearMetadataForIccids(CFDataRef **a1, void *a2)
{
  uint64_t v2 = *a1;
  char v3 = a1[1];
  if (*a1 != v3)
  {
    long long v13 = xmmword_263892268;
    do
    {
      uint64_t v5 = (char *)operator new(0x15uLL);
      uint64_t v19 = v5 + 21;
      uint64_t v20 = v5 + 21;
      *(_OWORD *)uint64_t v5 = v13;
      *(void *)(v5 + 13) = 0x8002E100000000;
      uint64_t v18 = v5;
      BytePtr = CFDataGetBytePtr(*v2);
      uint64_t v7 = (char *)v18;
      uint64_t v8 = *(void *)BytePtr;
      *(_DWORD *)((char *)v18 + 13) = *((_DWORD *)BytePtr + 2);
      *(void *)(v7 + 5) = v8;
      std::string __p = 0;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      __int16 v14 = 0;
      (*(void (**)(void, void **, void **, __int16 *))(*(void *)*a2 + 32))(*a2, &v18, &__p, &v14);
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylClearMetadata", "", "VinylClearMetadata::ClearMetadataForIccids: Attempted metadata clear for ICCID\n", v9, v10, v11, v13);
      if (__p)
      {
        uint64_t v16 = __p;
        operator delete(__p);
      }
      if (v18)
      {
        uint64_t v19 = v18;
        operator delete(v18);
      }
      ++v2;
    }
    while (v2 != v3);
  }
  return 0;
}

void sub_26387F510(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::ClearMetadata::Perform(int a1, void *a2)
{
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylClearMetadata", "", "VinylClearMetadata::Perform: onlyBootstrap=%d\n", v4, v5, v6, a1);
  memset(v8, 0, sizeof(v8));
  eUICC::ClearMetadata::GetListOfIccids(a1, (const void ***)v8, a2);
  eUICC::ClearMetadata::ClearMetadataForIccids(v8, a2);
  uint64_t v9 = v8;
  std::vector<ctu::cf::CFSharedRef<__CFData const>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v9);
  return 0;
}

void sub_26387F5E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::vector<ctu::cf::CFSharedRef<__CFData const>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t BBUpdaterCommon::BBUASCIIDigitToInt(__darwin_ct_rune_t this, unsigned int a2)
{
  uint64_t result = (this - 48);
  if (result > 9)
  {
    __darwin_ct_rune_t v5 = __toupper(this);
    if (((v5 << 24) - 1073741825) > 0x1AFFFFFE) {
      return 0xFFFFFFFFLL;
    }
    uint64_t result = v5 - 55;
    if (result >= a2) {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

unint64_t BBUpdaterCommon::BBUStringToUInt32(const char *a1, int __base)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  return strtoul(a1, 0, __base);
}

BOOL BBUpdaterCommon::BBUFileExists(const char *a1)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  return stat(a1, &v2) == 0;
}

DIR *BBUpdaterCommon::BBUReadDirectory(const char *a1, uint64_t *a2)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  uint64_t result = opendir(a1);
  if (result)
  {
    uint64_t v4 = result;
    while (1)
    {
      __darwin_ct_rune_t v5 = readdir(v4);
      if (!v5) {
        break;
      }
      std::string::basic_string[abi:ne180100](__p, v5->d_name, v5->d_namlen);
      uint64_t v6 = std::__list_imp<std::string>::__create_node[abi:ne180100]<std::string const&>((uint64_t)a2, 0, 0, (uint64_t)__p);
      v6[1] = a2;
      uint64_t v7 = *a2;
      *uint64_t v6 = *a2;
      *(void *)(v7 + 8) = v6;
      *a2 = (uint64_t)v6;
      ++a2[2];
      if (v9 < 0) {
        operator delete(__p[0]);
      }
    }
    return (DIR *)closedir(v4);
  }
  return result;
}

void sub_26387F784(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void BBUpdaterCommon::BBUGetFileName(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string __p = *(std::string *)a1;
  }
  ctu::tokenize();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (*(char *)(v6 - 1) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)(v6 - 24), *(void *)(v6 - 16));
  }
  else
  {
    long long v3 = *(_OWORD *)(v6 - 24);
    a2->__r_.__value_.__r.__words[2] = *(void *)(v6 - 8);
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = v3;
  }
  uint64_t v7 = (void **)&v5;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v7);
}

void sub_26387F850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16)
{
  *(void *)(v16 - 24) = &a16;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v16 - 24));
  _Unwind_Resume(a1);
}

void BBUpdaterCommon::BBUStripCharacters(uint64_t *a1@<X0>, const std::string *a2@<X1>, void *a3@<X8>)
{
  BOOL v6 = *((char *)a1 + 23) < 0;
  if (*((char *)a1 + 23) >= 0) {
    uint64_t v7 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    uint64_t v7 = a1[1];
  }
  uint64_t v8 = (char *)operator new[](v7 + 1);
  char v9 = v8;
  uint64_t v10 = v8;
  if (v7)
  {
    uint64_t v11 = 0;
    unsigned int v12 = 1;
    uint64_t v10 = v8;
    do
    {
      long long v13 = (uint64_t *)*a1;
      if (!v6) {
        long long v13 = a1;
      }
      if (std::string::find(a2, *((unsigned char *)v13 + v11), 0) == -1)
      {
        if (*((char *)a1 + 23) >= 0) {
          __int16 v14 = a1;
        }
        else {
          __int16 v14 = (uint64_t *)*a1;
        }
        *v10++ = *((unsigned char *)v14 + v11);
      }
      uint64_t v11 = v12;
      BOOL v6 = *((char *)a1 + 23) < 0;
      unint64_t v15 = *((unsigned __int8 *)a1 + 23);
      if ((v15 & 0x80u) != 0) {
        unint64_t v15 = a1[1];
      }
    }
    while (v15 > v12++);
  }
  *uint64_t v10 = 0;
  std::string::basic_string[abi:ne180100]<0>(a3, v9);

  operator delete[](v9);
}

void *BBUpdaterCommon::BBUCFStringToCPPString@<X0>(const __CFString *this@<X0>, void *a2@<X8>)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  CFStringGetCString(this, buffer, 1024, 0x8000100u);
  return std::string::basic_string[abi:ne180100]<0>(a2, buffer);
}

void BBUpdaterCommon::BBUStringToArgv(char *a1, void **a2)
{
  std::operator+<char>();
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
  *(_OWORD *)a1 = v42;
  *((void *)a1 + 2) = v43;
  if ((v43 & 0x8000000000000000) == 0) {
    unint64_t v4 = HIBYTE(v43);
  }
  else {
    unint64_t v4 = *((void *)a1 + 1);
  }
  if (v4)
  {
    unint64_t v5 = 0;
    uint64_t v6 = MEMORY[0x263EF8318];
    do
    {
      while (1)
      {
        uint64_t v7 = a1[23] >= 0 ? a1 : *(char **)a1;
        unsigned int v8 = v7[v5];
        int v9 = (v8 & 0x80000000) != 0 ? __maskrune(v8, 0x4000uLL) : *(_DWORD *)(v6 + 4 * v8 + 60) & 0x4000;
        uint64_t v10 = a1[23] >= 0 ? a1 : *(char **)a1;
        uint64_t v11 = &v10[v5];
        if (v5 >= v4 || !v9) {
          break;
        }
        char *v11 = 0;
        ++v5;
      }
      long long v13 = (char **)a2[1];
      unint64_t v12 = (unint64_t)a2[2];
      if ((unint64_t)v13 >= v12)
      {
        uint64_t v15 = ((char *)v13 - (unsigned char *)*a2) >> 3;
        if ((unint64_t)(v15 + 1) >> 61) {
          goto LABEL_63;
        }
        uint64_t v16 = v12 - (void)*a2;
        uint64_t v17 = v16 >> 2;
        if (v16 >> 2 <= (unint64_t)(v15 + 1)) {
          uint64_t v17 = v15 + 1;
        }
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v18 = v17;
        }
        if (v18) {
          uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>((uint64_t)(a2 + 2), v18);
        }
        else {
          uint64_t v19 = 0;
        }
        uint64_t v20 = &v19[8 * v15];
        *(void *)uint64_t v20 = v11;
        __int16 v14 = v20 + 8;
        uint64_t v22 = (char *)*a2;
        uint64_t v21 = (char *)a2[1];
        if (v21 != *a2)
        {
          do
          {
            uint64_t v23 = *((void *)v21 - 1);
            v21 -= 8;
            *((void *)v20 - 1) = v23;
            v20 -= 8;
          }
          while (v21 != v22);
          uint64_t v21 = (char *)*a2;
        }
        *a2 = v20;
        a2[1] = v14;
        a2[2] = &v19[8 * v18];
        if (v21) {
          operator delete(v21);
        }
      }
      else
      {
        *long long v13 = v11;
        __int16 v14 = v13 + 1;
      }
      a2[1] = v14;
      unint64_t v24 = v5 + 1;
      do
      {
        unint64_t v25 = v24;
        if (a1[23] >= 0) {
          uint64_t v26 = a1;
        }
        else {
          uint64_t v26 = *(char **)a1;
        }
        unsigned int v27 = v26[v25];
        if ((v27 & 0x80000000) != 0) {
          int v28 = __maskrune(v27, 0x4000uLL);
        }
        else {
          int v28 = *(_DWORD *)(v6 + 4 * v27 + 60) & 0x4000;
        }
        unint64_t v24 = v25 + 1;
      }
      while (v25 < v4 && !v28);
      unint64_t v5 = v25;
    }
    while (v25 < v4);
  }
  unint64_t v29 = (unint64_t)a2[2];
  uint64_t v30 = a2[1];
  if ((unint64_t)v30 >= v29)
  {
    uint64_t v32 = ((char *)v30 - (unsigned char *)*a2) >> 3;
    if ((unint64_t)(v32 + 1) >> 61) {
LABEL_63:
    }
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    uint64_t v33 = v29 - (void)*a2;
    uint64_t v34 = v33 >> 2;
    if (v33 >> 2 <= (unint64_t)(v32 + 1)) {
      uint64_t v34 = v32 + 1;
    }
    if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v35 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v35 = v34;
    }
    if (v35) {
      uint64_t v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>((uint64_t)(a2 + 2), v35);
    }
    else {
      uint64_t v36 = 0;
    }
    uint64_t v37 = &v36[8 * v32];
    int v38 = &v36[8 * v35];
    *(void *)uint64_t v37 = 0;
    uint64_t v31 = v37 + 8;
    uint64_t v40 = (char *)*a2;
    unint64_t v39 = (char *)a2[1];
    if (v39 != *a2)
    {
      do
      {
        uint64_t v41 = *((void *)v39 - 1);
        v39 -= 8;
        *((void *)v37 - 1) = v41;
        v37 -= 8;
      }
      while (v39 != v40);
      unint64_t v39 = (char *)*a2;
    }
    *a2 = v37;
    a2[1] = v31;
    a2[2] = v38;
    if (v39) {
      operator delete(v39);
    }
  }
  else
  {
    *uint64_t v30 = 0;
    uint64_t v31 = v30 + 1;
  }
  a2[1] = v31;
}

double BBUpdaterCommon::BBUGetTimeDifference(BBUpdaterCommon *this, const double *a2, const double *a3)
{
  return *(double *)this - *a2;
}

pthread_t BBUpdaterCommon::BBUThreadSpawn(BBUpdaterCommon *this, void *(__cdecl *a2)(void *), void *(*a3)(void *), void *a4)
{
  int v4 = (int)a4;
  uint64_t v11 = *MEMORY[0x263EF8340];
  pthread_t v9 = 0;
  pthread_attr_init(&v10);
  if (v4) {
    pthread_attr_setdetachstate(&v10, 2);
  }
  int v7 = pthread_create(&v9, &v10, a2, a3);
  pthread_attr_destroy(&v10);
  if (v7) {
    return 0;
  }
  else {
    return v9;
  }
}

BOOL BBUpdaterCommon::BBUThreadJoin(_opaque_pthread_t *this, void *a2)
{
  return pthread_join(this, 0) == 0;
}

uint64_t BBUpdaterCommon::BBUPromptForStepping(BBUpdaterCommon *this, BOOL a2, const char *a3, const char *a4)
{
  return 1;
}

pthread_mutex_t *BBUpdaterCommon::BBUMutex::BBUMutex(pthread_mutex_t *this, const char *a2)
{
  return this;
}

void BBUpdaterCommon::BBUMutex::~BBUMutex(pthread_mutex_t *this)
{
}

{
  pthread_mutex_destroy(this);
}

uint64_t BBUpdaterCommon::collectCoreDump(BBUpdaterCommon *this, const __CFDictionary **a2, const __CFString *a3)
{
  int v3 = (int)a3;
  CFTypeRef obj = 0;
  CFTypeRef cf = 0;
  int valuePtr = 2;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  int v28 = @"/mnt4";
  CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@/%@");
  unsigned int v8 = (const void *)MEMORY[0x263E6C010](&obj);
  if (!v8)
  {
    uint64_t v18 = 0;
    uint64_t v20 = "BBUpdaterExtremeCreateWithError rejected with error\n";
    if ((*(unsigned char *)gBBULogMaskGet() & 2) == 0 || gBBULogVerbosity < 6) {
      goto LABEL_53;
    }
    _BBULog(1, 6, "BBUCommon", "", "check failed: %s, %d, assertion: %s\n", v22, v23, v24, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Support/BBUCommon.cpp");
    unsigned int v8 = 0;
    goto LABEL_52;
  }
  BBUpdaterRegisterLogSink();
  CFNumberRef v9 = CFNumberCreate(v6, kCFNumberIntType, &valuePtr);
  Mutable = CFDictionaryCreateMutable(v6, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, @"BootMode", v9);
  CFDictionarySetValue(Mutable, @"SystemRoot", @"/mnt5");
  CFDictionarySetValue(Mutable, @"DataRoot", @"/mnt4");
  CFDictionarySetValue(Mutable, @"RemoteFSRoot", @"/mnt3/bbfs/");
  uint64_t v11 = a2;
  if (a2 || (uint64_t v11 = (const __CFDictionary **)v7) != 0) {
    CFDictionarySetValue(Mutable, @"coreDumpPath", v11);
  }
  if (!BBUpdaterSetOptions())
  {
    uint64_t v18 = 0;
    uint64_t v20 = "BBUpdaterSetOptions rejected  with error\n";
    if ((*(unsigned char *)gBBULogMaskGet() & 2) == 0 || gBBULogVerbosity < 6) {
      goto LABEL_53;
    }
LABEL_51:
    _BBULog(1, 6, "BBUCommon", "", "check failed: %s, %d, assertion: %s\n", v14, v15, v16, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Support/BBUCommon.cpp");
LABEL_52:
    uint64_t v18 = 0;
    goto LABEL_53;
  }
  int v12 = BBUpdaterExecCommand();
  long long v13 = (unsigned char *)gBBULogMaskGet();
  if (!v12)
  {
    uint64_t v18 = 0;
    uint64_t v20 = "BBUpdaterExecCommand rejected  with error\n";
    if ((*v13 & 2) == 0 || gBBULogVerbosity < 6) {
      goto LABEL_53;
    }
    goto LABEL_51;
  }
  _BBULog(0, 0xFFFFFFFFLL, "BBUCommon", "", "Core dump successful \n", v14, v15, v16, (char)@"/mnt4");
  if (this)
  {
    keys = @"LogDirectory";
    if (a2) {
      CFStringRef v17 = (const __CFString *)a2;
    }
    else {
      CFStringRef v17 = v7;
    }
    values = CFURLCreateWithString(v6, v17, 0);
    *(void *)this = CFDictionaryCreate(v6, (const void **)&keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  if (v3)
  {
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    CFRelease(v8);
    if (obj)
    {
      CFRelease(obj);
      CFTypeRef obj = 0;
    }
    unsigned int v8 = (const void *)MEMORY[0x263E6C010](&obj);
    if (!v8)
    {
      uint64_t v18 = 1;
      uint64_t v20 = "BBUpdaterExtremeCreateWithError rejected with error\n";
      if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
      {
        _BBULog(1, 6, "BBUCommon", "", "check failed: %s, %d, assertion: %s\n", v25, v26, v27, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Support/BBUCommon.cpp");
        unsigned int v8 = 0;
      }
      goto LABEL_53;
    }
    BBUpdaterRegisterLogSink();
    if (BBUpdaterSetOptions())
    {
      uint64_t v18 = BBUpdaterExecCommand();
      uint64_t v19 = (unsigned char *)gBBULogMaskGet();
      if (v18)
      {
        uint64_t v18 = 1;
        uint64_t v20 = "BB reset successful\n";
LABEL_21:
        _BBULog(0, 0xFFFFFFFFLL, "BBUCommon", "", v20, v14, v15, v16, (char)v28);
        goto LABEL_23;
      }
      uint64_t v20 = "BBUpdaterExecCommand rejected  with error\n";
      if ((*v19 & 2) == 0 || gBBULogVerbosity < 6)
      {
LABEL_53:
        gBBULogMaskGet();
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v18 = 0;
      uint64_t v20 = "BBUpdaterSetOptions rejected  with error\n";
      if ((*(unsigned char *)gBBULogMaskGet() & 2) == 0 || gBBULogVerbosity < 6) {
        goto LABEL_53;
      }
    }
    goto LABEL_51;
  }
  uint64_t v18 = 1;
LABEL_23:
  if (obj)
  {
    CFShow(obj);
    if (obj) {
      CFRelease(obj);
    }
    CFTypeRef obj = 0;
  }
  if (v8) {
    CFRelease(v8);
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v7) {
    CFRelease(v7);
  }
  return v18;
}

uint64_t BBUpdaterCommon::bbupdater_log(BBUpdaterCommon *this, void *a2, char a3, const char *a4)
{
  gBBULogMaskGet();
  return _BBULog(0, 0xFFFFFFFFLL, "BBUCommon", "", "bbupdater: %s", v5, v6, v7, a3);
}

BOOL BBUpdaterCommon::inRestoreOS(BBUpdaterCommon *this)
{
  if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS != -1) {
    dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS, &__block_literal_global);
  }
  if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS != -1) {
    dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS, &__block_literal_global_56);
  }
  return (BBUpdaterCommon::inRestoreOS(void)::restoreOS | BBUpdaterCommon::inRestoreOS(void)::recoveryOS) != 0;
}

const void **___ZN15BBUpdaterCommon11inRestoreOSEv_block_invoke(uint64_t a1, const __CFString *a2)
{
  uint64_t v7 = BBUpdaterCommon::BBUMGCopyAnswer((BBUpdaterCommon *)@"RestoreOSBuild", a2);
  ctu::cf::CFSharedRef<__CFBoolean const>::CFSharedRef<void const,void>(&BOOLean, (CFTypeRef *)&v7);
  if (BOOLean) {
    stat v2 = ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::get;
  }
  else {
    stat v2 = 0;
  }
  if (v2) {
    BBUpdaterCommon::inRestoreOS(void)::restoreOS = CFBooleanGetValue(BOOLean) != 0;
  }
  if ((*(unsigned char *)(gBBULogMaskGet() + 3) & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0) {
    _BBULog(24, 0, "BBUCommon", "", "inRestoreOS: %d\n", v3, v4, v5, BBUpdaterCommon::inRestoreOS(void)::restoreOS);
  }
  return ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef((const void **)&BOOLean);
}

void sub_263880518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t BBUpdaterCommon::BBUMGCopyAnswer(BBUpdaterCommon *this, const __CFString *a2)
{
  if (BBUpdaterCommon::BBUMGCopyAnswer(__CFString const*)::onceToken != -1) {
    dispatch_once(&BBUpdaterCommon::BBUMGCopyAnswer(__CFString const*)::onceToken, &__block_literal_global_99);
  }
  uint64_t v3 = (uint64_t (*)(BBUpdaterCommon *, void))BBUpdaterCommon::BBUMGCopyAnswer(__CFString const*)::sCopyAnswer;
  if (!BBUpdaterCommon::BBUMGCopyAnswer(__CFString const*)::sCopyAnswer) {
    return 0;
  }

  return v3(this, 0);
}

uint64_t ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ___ZN15BBUpdaterCommon11inRestoreOSEv_block_invoke_2()
{
  BBUpdaterCommon::inRestoreOS(void)::recoveryOS = os_variant_is_recovery();
  uint64_t result = gBBULogMaskGet();
  if ((*(unsigned char *)(result + 3) & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0) {
    return _BBULog(24, 0, "BBUCommon", "", "InRecoveryOS: %d\n", v1, v2, v3, BBUpdaterCommon::inRestoreOS(void)::recoveryOS);
  }
  return result;
}

uint64_t BBUpdaterCommon::getECID(BBUpdaterCommon *this)
{
  if (BBUpdaterCommon::getECID(void)::sOnce != -1) {
    dispatch_once(&BBUpdaterCommon::getECID(void)::sOnce, &__block_literal_global_61);
  }
  return BBUpdaterCommon::getECID(void)::ecid;
}

const void **___ZN15BBUpdaterCommon7getECIDEv_block_invoke(uint64_t a1, const __CFString *a2)
{
  uint64_t v7 = BBUpdaterCommon::BBUMGCopyAnswer((BBUpdaterCommon *)@"UniqueChipID", a2);
  ctu::cf::CFSharedRef<__CFNumber const>::CFSharedRef<void const,void>(&number, (CFTypeRef *)&v7);
  if (number) {
    uint64_t v2 = ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get;
  }
  else {
    uint64_t v2 = 0;
  }
  if (v2)
  {
    CFNumberGetValue(number, kCFNumberSInt64Type, &BBUpdaterCommon::getECID(void)::ecid);
    if ((*(unsigned char *)(gBBULogMaskGet() + 3) & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0) {
      _BBULog(24, 0, "BBUCommon", "", "ECID: 0x%llx\n", v3, v4, v5, BBUpdaterCommon::getECID(void)::ecid);
    }
  }
  return ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)&number);
}

void sub_263880738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t BBUpdaterCommon::getEUICCChipID(BBUpdaterCommon *this)
{
  if (BBUpdaterCommon::getEUICCChipID(void)::sOnce != -1) {
    dispatch_once(&BBUpdaterCommon::getEUICCChipID(void)::sOnce, &__block_literal_global_68);
  }
  return BBUpdaterCommon::getEUICCChipID(void)::euiccChipID;
}

const void **___ZN15BBUpdaterCommon14getEUICCChipIDEv_block_invoke(uint64_t a1, const __CFString *a2)
{
  uint64_t v4 = BBUpdaterCommon::BBUMGCopyAnswer((BBUpdaterCommon *)@"EUICCChipID", a2);
  ctu::cf::CFSharedRef<__CFNumber const>::CFSharedRef<void const,void>(&number, (CFTypeRef *)&v4);
  if (number) {
    uint64_t v2 = ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get;
  }
  else {
    uint64_t v2 = 0;
  }
  if (v2) {
    CFNumberGetValue(number, kCFNumberSInt64Type, &BBUpdaterCommon::getEUICCChipID(void)::euiccChipID);
  }
  return ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)&number);
}

void sub_263880808(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

const void **BBUpdaterCommon::BBUReadNVRAM@<X0>(const void **a1@<X8>)
{
  {
    BBUpdaterCommon::BBUReadNVRAM(void)::nvramInfo = 0;
    __cxa_atexit((void (*)(void *))ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef, &BBUpdaterCommon::BBUReadNVRAM(void)::nvramInfo, &dword_263869000);
  }
  if (BBUpdaterCommon::BBUReadNVRAM(void)::onceToken != -1) {
    dispatch_once(&BBUpdaterCommon::BBUReadNVRAM(void)::onceToken, &__block_literal_global_74);
  }
  if ((*(unsigned char *)(gBBULogMaskGet() + 3) & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
  {
    uint64_t v8 = BBUpdaterCommon::BBUReadNVRAM(void)::nvramInfo;
    if (BBUpdaterCommon::BBUReadNVRAM(void)::nvramInfo) {
      CFRetain((CFTypeRef)BBUpdaterCommon::BBUReadNVRAM(void)::nvramInfo);
    }
    CFOBJ_STR(&v8, __p);
    if (v10 >= 0) {
      uint64_t v6 = __p;
    }
    else {
      LOBYTE(v6) = __p[0];
    }
    _BBULog(24, 0, "BBUCommon", "", "NVRAM: %s\n", v3, v4, v5, (char)v6);
    if (v10 < 0) {
      operator delete(__p[0]);
    }
    ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v8);
  }
  return ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::SharedRef(a1, (const void **)&BBUpdaterCommon::BBUReadNVRAM(void)::nvramInfo);
}

void sub_263880968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, const void *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&a11);
  _Unwind_Resume(a1);
}

uint64_t ___ZN15BBUpdaterCommon12BBUReadNVRAMEv_block_invoke()
{
  kern_return_t CFProperties;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  char v23;
  CFMutableDictionaryRef properties[2];
  mach_port_t v25;

  uint64_t v25 = 0;
  int v0 = MEMORY[0x263E6C2C0](*MEMORY[0x263EF87F0], &v25);
  if (v0)
  {
    char v1 = v0;
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "BBUCommon", "", "Condition <<%s>> failed %s %s/%d\n", v2, v3, v4, (char)"KERN_SUCCESS == kr");
    uint64_t result = gBBULogMaskGet();
    if ((*(unsigned char *)(result + 3) & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    {
      CFNumberRef v9 = "Could not get master port %d\n";
      uint64_t v23 = v1;
      return _BBULog(24, 0, "BBUCommon", "", v9, v6, v7, v8, v23);
    }
  }
  else
  {
    io_registry_entry_t v10 = IORegistryEntryFromPath(v25, "IODeviceTree:/options");
    if (v10)
    {
      io_object_t v11 = v10;
      properties[0] = 0;
      properties[1] = (CFMutableDictionaryRef)&BBUpdaterCommon::BBUReadNVRAM(void)::nvramInfo;
      CFProperties = IORegistryEntryCreateCFProperties(v10, properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
      ctu::cf::detail::TakeOwnershipProxy<__CFDictionary>::~TakeOwnershipProxy((const void **)properties);
      if (CFProperties
        || (BBUpdaterCommon::BBUReadNVRAM(void)::nvramInfo
          ? (uint64_t v22 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get)
          : (uint64_t v22 = 0),
            !v22))
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "BBUCommon", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"KERN_SUCCESS == kr && nvramInfo");
        if ((*(unsigned char *)(gBBULogMaskGet() + 3) & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0) {
          _BBULog(24, 0, "BBUCommon", "", "Could not load NVRAM? %d\n", v16, v17, v18, CFProperties);
        }
      }
      return IOObjectRelease(v11);
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "BBUCommon", "", "Condition <<%s>> failed %s %s/%d\n", v19, v20, v21, (char)"nvramRef");
      uint64_t result = gBBULogMaskGet();
      if ((*(unsigned char *)(result + 3) & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
      {
        CFNumberRef v9 = "Could not find NVRAM via IOKit\n";
        return _BBULog(24, 0, "BBUCommon", "", v9, v6, v7, v8, v23);
      }
    }
  }
  return result;
}

void sub_263880BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  ctu::cf::detail::TakeOwnershipProxy<__CFDictionary>::~TakeOwnershipProxy((const void **)va);
  _Unwind_Resume(a1);
}

BOOL BBUpdaterCommon::isNVRAMKeyPresent(const __CFString *this, const __CFString *a2)
{
  BBUpdaterCommon::BBUReadNVRAM((const void **)&theDict);
  if (theDict) {
    uint64_t v3 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  }
  else {
    uint64_t v3 = 0;
  }
  if (v3) {
    BOOL v4 = CFDictionaryContainsKey(theDict, this) != 0;
  }
  else {
    BOOL v4 = 0;
  }
  if ((*(unsigned char *)(gBBULogMaskGet() + 3) & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
  {
    char CStringPtr = CFStringGetCStringPtr(this, 0x8000100u);
    _BBULog(24, 0, "BBUCommon", "", "NVRAM '%s' exists? %s\n", v6, v7, v8, CStringPtr);
  }
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&theDict);
  return v4;
}

void sub_263880CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t BBUpdaterCommon::BBUCreateCFError(CFErrorRef *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  CFDictionaryRef v16 = 0;
  CFDictionaryRef userInfo = 0;
  if (!a1)
  {
    uint64_t v11 = 0;
    if ((*(unsigned char *)gBBULogMaskGet() & 2) == 0 || gBBULogVerbosity <= 5) {
      goto LABEL_13;
    }
LABEL_12:
    _BBULog(1, 6, "BBUCommon", "", "check failed: %s, %d, assertion: %s\n", v12, v13, v14, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Support/BBUCommon.cpp");
    uint64_t v11 = 0;
    goto LABEL_13;
  }
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    uint64_t v11 = 0;
    if ((*(unsigned char *)gBBULogMaskGet() & 2) == 0 || gBBULogVerbosity <= 5) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  CFDictionaryRef v9 = userInfo;
  CFDictionaryRef userInfo = Mutable;
  CFDictionaryRef v19 = v9;
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&v19);
  CFDictionaryRef v18 = 0;
  if ((ctu::cf::convert_copy() & 1) == 0)
  {
    uint64_t v11 = 0;
    if ((*(unsigned char *)gBBULogMaskGet() & 2) == 0 || gBBULogVerbosity < 6) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  CFDictionaryRef v10 = v16;
  CFDictionaryRef v16 = v18;
  CFDictionaryRef v19 = v10;
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v19);
  ctu::cf::insert<__CFString const*,__CFString const*>(userInfo, (void *)*MEMORY[0x263EFFC48], (uint64_t)v18);
  if (a4) {
    ctu::cf::insert<__CFString const*,__CFError *>(userInfo, (void *)*MEMORY[0x263EFFC88], a4);
  }
  *a1 = CFErrorCreate(v7, @"BBUpdater", a3, userInfo);
  uint64_t v11 = 1;
LABEL_13:
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v16);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&userInfo);
  return v11;
}

void sub_263880EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va1, a5);
  va_start(va, a5);
  uint64_t v6 = va_arg(va1, const void *);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)va);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)va1);
  _Unwind_Resume(a1);
}

uint64_t ctu::cf::insert<__CFString const*,__CFString const*>(__CFDictionary *a1, void *cf, uint64_t a3)
{
  key = cf;
  if (cf) {
    CFRetain(cf);
  }
  uint64_t v6 = a3;
  if (a3)
  {
    CFRetain((CFTypeRef)a3);
    if (key)
    {
      CFDictionaryAddValue(a1, key, (const void *)a3);
      a3 = 1;
    }
    else
    {
      a3 = 0;
    }
  }
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)&v6);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)&key);
  return a3;
}

void sub_263880F78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
}

uint64_t ctu::cf::insert<__CFString const*,__CFError *>(__CFDictionary *a1, void *cf, uint64_t a3)
{
  key = cf;
  if (cf) {
    CFRetain(cf);
  }
  uint64_t v6 = a3;
  if (a3)
  {
    CFRetain((CFTypeRef)a3);
    if (key)
    {
      CFDictionaryAddValue(a1, key, (const void *)a3);
      a3 = 1;
    }
    else
    {
      a3 = 0;
    }
  }
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)&v6);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)&key);
  return a3;
}

void sub_26388101C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
}

void *BBUpdaterCommon::BBUStrError@<X0>(BBUpdaterCommon *this@<X0>, void *a2@<X8>)
{
  int v2 = (int)this;
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  *(_OWORD *)__strerrbuf = 0u;
  long long v6 = 0u;
  if (strerror_r((int)this, __strerrbuf, 0x80uLL)) {
    snprintf(__strerrbuf, 0x80uLL, "unknown error %d", v2);
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, __strerrbuf);
}

const char *BBUpdaterCommon::redactedString(BBUpdaterCommon *this, const char *a2)
{
  if (BBUpdaterCommon::inRestoreOS(this)) {
    return (const char *)this;
  }
  else {
    return "0x<< SNUM >>";
  }
}

void *___ZN15BBUpdaterCommonL15BBUMGCopyAnswerEPK10__CFString_block_invoke()
{
  uint64_t result = dlopen("/usr/lib/libMobileGestalt.dylib", 1);
  if (result)
  {
    uint64_t result = dlsym(result, "MGCopyAnswer");
    BBUpdaterCommon::BBUMGCopyAnswer(__CFString const*)::sCopyAnswer = result;
  }
  return result;
}

const void **ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::SharedRef(const void **a1, const void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  if (v3) {
    CFRetain(v3);
  }
  return a1;
}

void *std::string::basic_string[abi:ne180100](void *__dst, void *__src, size_t __len)
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
    long long v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *long long __dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    long long v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  int v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void *std::__list_imp<std::string>::__create_node[abi:ne180100]<std::string const&>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  size_t v7 = operator new(0x28uLL);
  *size_t v7 = a2;
  v7[1] = a3;
  size_t v8 = (std::string *)(v7 + 2);
  if (*(char *)(a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v8, *(const std::string::value_type **)a4, *(void *)(a4 + 8));
  }
  else
  {
    *(_OWORD *)&v8->__r_.__value_.__l.__data_ = *(_OWORD *)a4;
    v7[4] = *(void *)(a4 + 16);
  }
  return v7;
}

void sub_263881340(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *ctu::cf::CFSharedRef<__CFBoolean const>::CFSharedRef<void const,void>(void *a1, CFTypeRef *a2)
{
  CFTypeRef v4 = *a2;
  if (*a2 && (CFTypeID v5 = CFGetTypeID(*a2), v5 == CFBooleanGetTypeID()))
  {
    *a1 = v4;
  }
  else
  {
    *a1 = 0;
    if (*a2) {
      CFRelease(*a2);
    }
  }
  return a1;
}

void *ctu::cf::CFSharedRef<__CFNumber const>::CFSharedRef<void const,void>(void *a1, CFTypeRef *a2)
{
  CFTypeRef v4 = *a2;
  if (*a2 && (CFTypeID v5 = CFGetTypeID(*a2), v5 == CFNumberGetTypeID()))
  {
    *a1 = v4;
  }
  else
  {
    *a1 = 0;
    if (*a2) {
      CFRelease(*a2);
    }
  }
  return a1;
}

const void **ctu::cf::detail::TakeOwnershipProxy<__CFDictionary>::~TakeOwnershipProxy(const void **a1)
{
  uint64_t v2 = (const void **)a1[1];
  if (*a1)
  {
    uint64_t v3 = *v2;
    *uint64_t v2 = *a1;
    long long v6 = v3;
  }
  else
  {
    CFTypeRef v4 = *v2;
    *uint64_t v2 = 0;
    long long v6 = v4;
  }
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(&v6);
  return a1;
}

void ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(const void **this)
{
  char v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

const void **eUICC::TwoPhaseProv::SessionData::getError@<X0>(const void **this@<X0>, const void **a2@<X8>)
{
  return ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::SharedRef(a2, this + 7);
}

const void **eUICC::TwoPhaseProv::SessionData::getBpp@<X0>(const void **this@<X0>, const void **a2@<X8>)
{
  return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(a2, this + 4);
}

const void **eUICC::TwoPhaseProv::SessionData::getPbiReq@<X0>(const void **this@<X0>, const void **a2@<X8>)
{
  return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(a2, this + 3);
}

const void **eUICC::TwoPhaseProv::SessionData::getEid@<X0>(const void **this@<X0>, const void **a2@<X8>)
{
  return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(a2, this);
}

const void **eUICC::TwoPhaseProv::SessionData::getTransactionId@<X0>(const void **this@<X0>, const void **a2@<X8>)
{
  return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(a2, this + 1);
}

const void **eUICC::TwoPhaseProv::SessionData::getEUICCSessionId@<X0>(const void **this@<X0>, const void **a2@<X8>)
{
  return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(a2, this + 2);
}

const void **eUICC::TwoPhaseProv::SessionData::getPir@<X0>(const void **this@<X0>, const void **a2@<X8>)
{
  return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(a2, this + 5);
}

const void **eUICC::TwoPhaseProv::SessionData::getPirSeqNum@<X0>(const void **this@<X0>, const void **a2@<X8>)
{
  return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(a2, this + 6);
}

uint64_t eUICC::TwoPhaseProv::SessionData::processAlderResponse(uint64_t a1, CFDictionaryRef *a2)
{
  uint64_t Value = CFDictionaryGetValue(*a2, @"Command");
  CFTypeID v5 = CFGetTypeID(Value);
  if (v5 == CFStringGetTypeID())
  {
    if (CFEqual(Value, @"GetBppResp"))
    {
      ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(&v11, (const void **)a2);
      uint64_t v6 = eUICC::TwoPhaseProv::SessionData::convertGbppToPbiBpp(a1, (CFDictionaryRef *)&v11);
      ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v11);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvSessionData", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"CFGetTypeID( cmd) == CFStringGetTypeID()");
    return 27;
  }
  return v6;
}

void sub_263881608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::SessionData::convertGbppToPbiBpp(uint64_t a1, CFDictionaryRef *a2)
{
  uint64_t Value = CFDictionaryGetValue(*a2, @"Command");
  if (!Value)
  {
    gBBULogMaskGet();
    CFDictionaryRef v19 = "cmd";
LABEL_13:
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvSessionData", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)v19);
    return 26;
  }
  CFTypeID v5 = Value;
  CFTypeID v6 = CFGetTypeID(Value);
  if (v6 != CFStringGetTypeID())
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvSessionData", "", "Condition <<%s>> failed %s %s/%d\n", v20, v21, v22, (char)"CFGetTypeID( cmd) == CFStringGetTypeID()");
    return 27;
  }
  if (!CFEqual(v5, @"GetBppResp"))
  {
    gBBULogMaskGet();
    CFDictionaryRef v19 = "CFEqual(cmd, Alder::ValueCommandGetBppResp)";
    goto LABEL_13;
  }
  CFDataRef v7 = (const __CFData *)CFDictionaryGetValue(*a2, @"BPPMetaData");
  if (!v7)
  {
    gBBULogMaskGet();
LABEL_12:
    CFDictionaryRef v19 = "data";
    goto LABEL_13;
  }
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef Copy = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], v7);
  long long v10 = *(const void **)(a1 + 24);
  *(void *)(a1 + 24) = Copy;
  uint64_t v31 = v10;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v31);
  if (!*(void *)(a1 + 24))
  {
    gBBULogMaskGet();
    uint64_t v27 = "pbiReq.get()";
LABEL_16:
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvSessionData", "", "Condition <<%s>> failed %s %s/%d\n", v24, v25, v26, (char)v27);
    return 17;
  }
  uint64_t DataFromPbiReq = eUICC::TwoPhaseProv::SessionData::extractDataFromPbiReq(a1, (CFDataRef *)(a1 + 24));
  if (!DataFromPbiReq)
  {
    CFDataRef v28 = (const __CFData *)CFDictionaryGetValue(*a2, @"BPP");
    if (v28)
    {
      CFDataRef v29 = CFDataCreateCopy(v8, v28);
      uint64_t v30 = *(const void **)(a1 + 32);
      *(void *)(a1 + 32) = v29;
      uint64_t v31 = v30;
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v31);
      if (*(void *)(a1 + 32)) {
        return 0;
      }
      gBBULogMaskGet();
      uint64_t v27 = "bpp.get()";
      goto LABEL_16;
    }
    gBBULogMaskGet();
    goto LABEL_12;
  }
  uint64_t v12 = DataFromPbiReq;
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvSessionData", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"kVinylResultSuccess == result");
  return v12;
}

double eUICC::TwoPhaseProv::SessionData::clearTransientData(eUICC::TwoPhaseProv::SessionData *this)
{
  *((void *)this + 7) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 4pthread_mutex_init(this, 0) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 8) = 0u;
  return result;
}

double eUICC::TwoPhaseProv::SessionData::clear(eUICC::TwoPhaseProv::SessionData *this)
{
  double result = 0.0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  return result;
}

uint64_t eUICC::TwoPhaseProv::SessionData::extractDataFromPbiReq(uint64_t a1, CFDataRef *a2)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFIndex Length = CFDataGetLength(*a2);
  CFDataRef MutableCopy = CFDataCreateMutableCopy(v4, Length, *a2);
  v35[0] = (unint64_t)CFDataGetMutableBytePtr(MutableCopy);
  v35[1] = CFDataGetLength(MutableCopy);
  if (DERDecodeSeqContentInit(v35, v39) || DERDecodeSeqNext(v39, &v37))
  {
    gBBULogMaskGet();
    uint64_t v9 = "(DR_Success == ret)";
    goto LABEL_4;
  }
  if (v37 != 0xE00000000000002ELL)
  {
    gBBULogMaskGet();
    uint64_t v9 = "TAG_PBI == dec.tag";
    goto LABEL_4;
  }
  if (DERParseSequenceContent(&v38, 4u, (uint64_t)&eUICC::TwoPhaseProv::prepareBppInstallationReqSpec, (unint64_t)v34, 0x10uLL))
  {
    gBBULogMaskGet();
LABEL_9:
    uint64_t v9 = "(ret == DR_Success)";
    goto LABEL_4;
  }
  if (DERParseSequenceContent(v34, 5u, (uint64_t)&eUICC::TwoPhaseProv::serverSignedPayloadSpec, (unint64_t)v30, 0x30uLL)|| !v32)
  {
    gBBULogMaskGet();
    uint64_t v9 = "(ret == DR_Success) && (ssp_decoded.eUICCSessionId.length > 0)";
    goto LABEL_4;
  }
  if (DERParseSequenceContent(&v33, 2u, (uint64_t)&eUICC::TwoPhaseProv::smdpSignedMetadataSpec, (unint64_t)v29, 0x10uLL))
  {
    gBBULogMaskGet();
    goto LABEL_9;
  }
  if (!DERParseSequenceContent(v29, 5u, (uint64_t)&eUICC::TwoPhaseProv::smdpMetadataSpec, (unint64_t)&v25, 0x20uLL)&& v26&& v28)
  {
    CFDataRef v12 = CFDataCreate(v4, v31, v32);
    uint64_t v13 = *(const void **)(a1 + 16);
    *(void *)(a1 + 16) = v12;
    uint64_t v40 = v13;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v40);
    if (*(void *)(a1 + 16)) {
      uint64_t v14 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
    }
    else {
      uint64_t v14 = 0;
    }
    if (v14)
    {
      CFDataRef v15 = CFDataCreate(v4, v25, v26);
      uint64_t v16 = *(const void **)a1;
      *(void *)a1 = v15;
      uint64_t v40 = v16;
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v40);
      if (*(void *)a1) {
        uint64_t v17 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
      }
      else {
        uint64_t v17 = 0;
      }
      if (v17)
      {
        CFDataRef v18 = CFDataCreate(v4, v27, v28);
        CFDictionaryRef v19 = *(const void **)(a1 + 8);
        *(void *)(a1 + 8) = v18;
        uint64_t v40 = v19;
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v40);
        if (*(void *)(a1 + 8)) {
          uint64_t v20 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
        }
        else {
          uint64_t v20 = 0;
        }
        if (v20)
        {
          uint64_t v10 = 0;
          goto LABEL_5;
        }
        gBBULogMaskGet();
        uint64_t v24 = "transactionId";
      }
      else
      {
        gBBULogMaskGet();
        uint64_t v24 = "eid";
      }
    }
    else
    {
      gBBULogMaskGet();
      uint64_t v24 = "euiccSessionId";
    }
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvSessionData", "", "Condition <<%s>> failed %s %s/%d\n", v21, v22, v23, (char)v24);
    uint64_t v10 = 17;
    goto LABEL_5;
  }
  gBBULogMaskGet();
  uint64_t v9 = "(ret == DR_Success) && (sm_decoded.eid.length > 0) && (sm_decoded.transactionId.length > 0)";
LABEL_4:
  _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvSessionData", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)v9);
  uint64_t v10 = 27;
LABEL_5:
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)&MutableCopy);
  return v10;
}

void sub_263881C04(_Unwind_Exception *a1)
{
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)(v1 - 88));
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::SessionData::extractDataFromPbiRsp(uint64_t a1, CFDataRef *a2)
{
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  CFDataRef v12 = 0;
  uint64_t v3 = eUICC::TwoPhaseProv::ExtractDataFromPbiRsp(a2, &v14, &v13);
  if (v3)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvSessionData", "", "Condition <<%s>> failed %s %s/%d\n", v4, v5, v6, (char)"kVinylResultSuccess == ret");
  }
  else
  {
    if (v14) {
      uint64_t v7 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
    }
    else {
      uint64_t v7 = 0;
    }
    if (v7) {
      BOOL v8 = v14 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      uint64_t v3 = 0;
    }
    else
    {
      eUICC::TwoPhaseProv::SessionData::extractDataFromPir(a1, (CFDataRef *)&v14);
      uint64_t v3 = 1;
    }
    if (v13) {
      uint64_t v9 = ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get;
    }
    else {
      uint64_t v9 = 0;
    }
    if (v9) {
      BOOL v10 = v13 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::operator=((const void **)(a1 + 56), &v13);
      uint64_t v3 = 1;
    }
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v12);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&v13);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v14);
  return v3;
}

void sub_263881D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)va);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)(v6 - 32));
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v6 - 24));
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::SessionData::extractDataFromPir(uint64_t a1, CFDataRef *a2)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFIndex v5 = CFDataGetLength(*a2);
  CFDataRef MutableCopy = CFDataCreateMutableCopy(v4, v5, *a2);
  v22[0] = (unint64_t)CFDataGetMutableBytePtr(MutableCopy);
  v22[1] = CFDataGetLength(MutableCopy);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::operator=((const void **)(a1 + 40), (const void **)a2);
  if (DERDecodeSeqContentInit(v22, v40) || DERDecodeSeqNext(v40, &v38)) {
    goto LABEL_3;
  }
  if (v38 != 0xA000000000000037)
  {
    gBBULogMaskGet();
    uint64_t v9 = "dec.tag == TAG_PIR";
    goto LABEL_4;
  }
  if (DERParseSequenceContent(&v39, 3u, (uint64_t)&eUICC::TwoPhaseProv::profileInstallationResultSpec, (unint64_t)v36, 0x20uLL))goto LABEL_3; {
  if (DERParseSequenceContent(v36, 4u, (uint64_t)&eUICC::TwoPhaseProv::profileInstallationResultDataSpec, (unint64_t)v33, 0x30uLL))goto LABEL_3;
  }
  CFDataRef v12 = CFDataCreate(v4, v33[0], (CFIndex)v33[1]);
  uint64_t v13 = *(const void **)(a1 + 8);
  *(void *)(a1 + 8) = v12;
  uint64_t v41 = v13;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v41);
  if (DERParseSequenceContent(&v34, 6u, (uint64_t)&eUICC::TwoPhaseProv::notificationMetaDataSpec, (unint64_t)&bytes, 0x10uLL))goto LABEL_3; {
  if (!length)
  }
  {
    gBBULogMaskGet();
    uint64_t v9 = "nm_decoded.seqNumber.length > 0";
    goto LABEL_4;
  }
  CFDataRef v14 = CFDataCreate(v4, bytes, length);
  CFDataRef v15 = *(const void **)(a1 + 48);
  *(void *)(a1 + 48) = v14;
  uint64_t v41 = v15;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v41);
  if (DERParseSequenceContent(&v35, 2u, (uint64_t)&eUICC::TwoPhaseProv::finalResultSpec, (unint64_t)v29, 0x20uLL))
  {
LABEL_3:
    gBBULogMaskGet();
    uint64_t v9 = "(ret == DR_Success)";
  }
  else
  {
    if (v30 | v32)
    {
      if (v32)
      {
        if (DERParseSequenceContent(&v31, 3u, (uint64_t)&eUICC::TwoPhaseProv::errorResultSpec, (unint64_t)v25, 0x20uLL)|| !v26|| v28 != 1)
        {
          gBBULogMaskGet();
          _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvSessionData", "", "Condition <<%s>> failed %s %s/%d\n", v18, v19, v20, (char)"(ret == DR_Success) && (er_decoded.bppCommandId.length > 0) && (er_decoded.errorReason.length == 1)");
          goto LABEL_5;
        }
        char valuePtr = *v27;
        CFNumberRef v16 = CFNumberCreate(v4, kCFNumberCharType, &valuePtr);
        uint64_t v17 = *(const void **)(a1 + 56);
        *(void *)(a1 + 56) = v16;
        uint64_t v41 = v17;
        ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&v41);
      }
      uint64_t v10 = 0;
      goto LABEL_6;
    }
    gBBULogMaskGet();
    uint64_t v9 = "(fr_decoded.successResult.length > 0) || (fr_decoded.errorResult.length > 0)";
  }
LABEL_4:
  _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvSessionData", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)v9);
LABEL_5:
  uint64_t v10 = 27;
LABEL_6:
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)&MutableCopy);
  return v10;
}

void sub_263882088(_Unwind_Exception *a1)
{
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)(v1 - 104));
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::SessionData::isEidEligible(eUICC::TwoPhaseProv::SessionData *this, const Options *a2)
{
  std::string::basic_string[abi:ne180100]<0>(&v22, "89[0-9]{14}((8[012346789])|(5[12]))[0-9]{14}");
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  v17[0] = 0;
  v17[1] = 0;
  uint64_t v18 = 0;
  if (*(void *)this)
  {
    pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
    CFAllocatorRef v4 = (BBUCapabilities *)xmmword_26A9A0D30;
    if (!(void)xmmword_26A9A0D30)
    {
      BBUCapabilities::create_default_global(__p);
      long long v5 = *(_OWORD *)__p;
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v6 = (std::__shared_weak_count *)*((void *)&xmmword_26A9A0D30 + 1);
      xmmword_26A9A0D30 = v5;
      if (v6)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v6);
        if (__p[1]) {
          std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
        }
      }
      CFAllocatorRef v4 = (BBUCapabilities *)xmmword_26A9A0D30;
    }
    uint64_t v7 = (std::__shared_weak_count *)*((void *)&xmmword_26A9A0D30 + 1);
    if (*((void *)&xmmword_26A9A0D30 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_26A9A0D30 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
    int v8 = BBUCapabilities::supportsEuiccViaEOS(v4);
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
    if (v8) {
      MEMORY[0x263E6C810](&v22, "89[0-9]{14}9[34567][0-9]{14}");
    }
    ctu::cf::assign();
    eUICC::TwoPhaseProv::StringifyDataBuffer((uint64_t *)&v19, 1);
    uint64_t v9 = *((void *)a2 + 11);
    uint64_t v10 = *((unsigned __int8 *)a2 + 103);
    *(_OWORD *)uint64_t v17 = *(_OWORD *)__p;
    uint64_t v18 = v24[0];
    if ((v10 & 0x80u) == 0) {
      uint64_t v9 = v10;
    }
    if (v9) {
      std::string::operator=(&v22, (const std::string *)((char *)a2 + 80));
    }
    std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>(v15, (uint64_t)&v22, 0);
    long long v11 = (char *)HIBYTE(v18);
    if (v18 >= 0) {
      CFDataRef v12 = (char *)v17;
    }
    else {
      CFDataRef v12 = (char *)v17[0];
    }
    if (v18 < 0) {
      long long v11 = (char *)v17[1];
    }
    v24[4] = 0;
    v24[5] = 0;
    char v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    char v28 = 0;
    char v29 = 0;
    uint64_t v30 = 0;
    *(_OWORD *)std::string __p = 0u;
    memset(v24, 0, 25);
    uint64_t v13 = std::regex_match[abi:ne180100]<std::__wrap_iter<char const*>,std::allocator<std::sub_match<std::__wrap_iter<char const*>>>,char,std::regex_traits<char>>(v12, &v11[(void)v12], (uint64_t)__p, (uint64_t)v15, 0);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    }
    std::locale::~locale(&v15[0].__loc_);
    if (SHIBYTE(v18) < 0) {
      operator delete(v17[0]);
    }
    if (v19)
    {
      uint64_t v20 = v19;
      operator delete(v19);
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
  return v13;
}

void sub_2638822D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  if (a24) {
    operator delete(a24);
  }
  if (a32 < 0) {
    operator delete(a27);
  }
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::~basic_regex(std::locale *this)
{
  locale = (std::__shared_weak_count *)this[6].__locale_;
  if (locale) {
    std::__shared_weak_count::__release_shared[abi:ne180100](locale);
  }

  std::locale::~locale(this);
}

const void **ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::SharedRef(const void **a1, const void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  if (v3) {
    CFRetain(v3);
  }
  return a1;
}

const void **ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::operator=(const void **a1, const void **a2)
{
  if (a1 != a2)
  {
    ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::SharedRef(&v5, a2);
    uint64_t v3 = *a1;
    *a1 = v5;
    long long v5 = v3;
    ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&v5);
  }
  return a1;
}

std::regex_traits<char> *std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>(std::regex_traits<char> *a1, uint64_t a2, int a3)
{
  uint64_t v6 = std::regex_traits<char>::regex_traits(a1);
  LODWORD(v6[1].__loc_.__locale_) = a3;
  *(_OWORD *)((char *)&v6[1].__loc_.__locale_ + 4) = 0u;
  *(_OWORD *)((char *)&v6[1].__col_ + 4) = 0u;
  HIDWORD(v6[2].__ct_) = 0;
  uint64_t v7 = *(unsigned __int8 *)(a2 + 23);
  if ((v7 & 0x80u) == 0) {
    int v8 = (std::basic_regex<char> *)a2;
  }
  else {
    int v8 = *(std::basic_regex<char> **)a2;
  }
  if ((v7 & 0x80u) != 0) {
    uint64_t v7 = *(void *)(a2 + 8);
  }
  if ((unsigned __int8 *)((char *)v8 + v7) != std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>((uint64_t)v6, v8, (std::basic_regex<char> *)((char *)v8 + v7)))std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>(); {
  return a1;
  }
}

void sub_2638824B4(_Unwind_Exception *a1)
{
  locale = (std::__shared_weak_count *)v1[6].__locale_;
  if (locale) {
    std::__shared_weak_count::__release_shared[abi:ne180100](locale);
  }
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

std::regex_traits<char> *__cdecl std::regex_traits<char>::regex_traits(std::regex_traits<char> *this)
{
  uint64_t v2 = (const std::locale *)MEMORY[0x263E6CA60]();
  this->__ct_ = (const std::ctype<char> *)std::locale::use_facet(v2, MEMORY[0x263F8C108]);
  this->__col_ = (const std::collate<char> *)std::locale::use_facet(&this->__loc_, MEMORY[0x263F8C130]);
  return this;
}

void sub_263882520(_Unwind_Exception *a1)
{
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  uint64_t v6 = operator new(8uLL);
  *uint64_t v6 = &unk_270EB4F08;
  uint64_t v7 = operator new(0x10uLL);
  v7[1] = v6;
  std::shared_ptr<std::__empty_state<char>>::reset[abi:ne180100]<std::__empty_state<char>,void>((void *)(a1 + 40), (uint64_t)v7);
  *(void *)(a1 + 56) = *(void *)(a1 + 40);
  unsigned int v8 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v8 > 0x3F)
  {
    switch(v8)
    {
      case 0x40u:
LABEL_12:
        return (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, a3);
      case 0x80u:
        return std::basic_regex<char,std::regex_traits<char>>::__parse_grep<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
      case 0x100u:
        return (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_egrep<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, a3);
      default:
        goto LABEL_24;
    }
  }
  else if (v8)
  {
    if (v8 != 16)
    {
      if (v8 != 32) {
LABEL_24:
      }
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>();
      goto LABEL_12;
    }
    return (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
  }
  else
  {
    return std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (unsigned __int8 *)a2, (char *)a3);
  }
}

void sub_2638826D4(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E6C7C0](exception, 17);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_26388274C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::shared_ptr<std::__empty_state<char>>::reset[abi:ne180100]<std::__empty_state<char>,void>(void *a1, uint64_t a2)
{
  std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(&v5, a2);
  uint64_t v3 = (std::__shared_weak_count *)a1[1];
  long long v4 = v5;
  *(void *)&long long v5 = *a1;
  *((void *)&v5 + 1) = v3;
  *(_OWORD *)a1 = v4;
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, char *a3)
{
  end = a1->__end_;
  uint64_t v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_alternative<std::__wrap_iter<char const*>>(a1, a2, a3);
  if (v7 == a2)
  {
    unsigned int v8 = (std::__node<char> *)operator new(0x10uLL);
    uint64_t v9 = a1->__end_;
    first = v9->__first_;
    v8[1].__vftable = (std::__node<char>_vtbl *)first;
    v9->__first_ = v8;
    a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
  }
  while (v7 != (unsigned __int8 *)a3)
  {
    if (*v7 != 124) {
      return v7;
    }
    long long v11 = a1->__end_;
    CFDataRef v12 = v7 + 1;
    uint64_t v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_alternative<std::__wrap_iter<char const*>>(a1, v7 + 1, a3);
    if (v12 == v7)
    {
      uint64_t v13 = (std::__node<char> *)operator new(0x10uLL);
      CFDataRef v14 = a1->__end_;
      CFDataRef v15 = v14->__first_;
      v13[1].__vftable = (std::__node<char>_vtbl *)v15;
      v14->__first_ = v13;
      a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v11);
  }
  return (unsigned __int8 *)a3;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return (char *)a2;
  }
  long long v4 = (char *)a3;
  if (*a2 == 94)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_l_anchor(this);
    ++v3;
  }
  if (v3 != (unsigned __int8 *)v4)
  {
    do
    {
      uint64_t v6 = v3;
      uint64_t v3 = std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<std::__wrap_iter<char const*>>(this, (char *)v3, v4);
    }
    while (v6 != v3);
    if (v6 != v4)
    {
      if (v6 + 1 != v4 || *v6 != 36) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
      }
      std::basic_regex<char,std::regex_traits<char>>::__push_r_anchor(this);
    }
  }
  return v4;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  end = a1->__end_;
  uint64_t v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<std::__wrap_iter<char const*>>(a1, a2, a3);
  if (v7 == (unsigned __int8 *)a2) {
LABEL_9:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  unsigned int v8 = v7;
  while (v8 != (unsigned __int8 *)a3)
  {
    if (*v8 != 124) {
      return (std::basic_regex<char> *)v8;
    }
    uint64_t v9 = a1->__end_;
    uint64_t v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)(v8 + 1), a3);
    if (v8 + 1 == v10) {
      goto LABEL_9;
    }
    unsigned int v8 = v10;
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v9);
  }
  return a3;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_grep<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *__s, unsigned __int8 *a3)
{
  end = a1->__end_;
  uint64_t v7 = (unsigned __int8 *)memchr(__s, 10, a3 - __s);
  if (v7) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = a3;
  }
  if (v8 == __s)
  {
    uint64_t v9 = (std::__node<char> *)operator new(0x10uLL);
    first = end->__first_;
    v9[1].__vftable = (std::__node<char>_vtbl *)first;
    end->__first_ = v9;
    a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
  }
  else
  {
    std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, __s, v8);
  }
  while (1)
  {
    CFDataRef v15 = v8 == a3 ? v8 : v8 + 1;
    if (v15 == a3) {
      break;
    }
    long long v11 = (unsigned __int8 *)memchr(v15, 10, a3 - v15);
    if (v11) {
      unsigned int v8 = v11;
    }
    else {
      unsigned int v8 = a3;
    }
    CFDataRef v12 = a1->__end_;
    if (v8 == v15)
    {
      uint64_t v13 = (std::__node<char> *)operator new(0x10uLL);
      CFDataRef v14 = v12->__first_;
      v13[1].__vftable = (std::__node<char>_vtbl *)v14;
      v12->__first_ = v13;
      a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, v15, v8);
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v12);
  }
  return a3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_egrep<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *__s, std::basic_regex<char> *a3)
{
  end = a1->__end_;
  uint64_t v7 = (std::basic_regex<char> *)memchr(__s, 10, (char *)a3 - (char *)__s);
  if (v7) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = a3;
  }
  if (v8 == __s)
  {
    uint64_t v9 = (std::__node<char> *)operator new(0x10uLL);
    first = end->__first_;
    v9[1].__vftable = (std::__node<char>_vtbl *)first;
    end->__first_ = v9;
    a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
  }
  else
  {
    std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(a1, __s, v8);
  }
  while (1)
  {
    CFDataRef v15 = v8 == a3 ? v8 : (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    if (v15 == a3) {
      break;
    }
    long long v11 = (std::basic_regex<char> *)memchr(v15, 10, (char *)a3 - (char *)v15);
    if (v11) {
      unsigned int v8 = v11;
    }
    else {
      unsigned int v8 = a3;
    }
    CFDataRef v12 = a1->__end_;
    if (v8 == v15)
    {
      uint64_t v13 = (std::__node<char> *)operator new(0x10uLL);
      CFDataRef v14 = v12->__first_;
      v13[1].__vftable = (std::__node<char>_vtbl *)v14;
      v12->__first_ = v13;
      a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(a1, v15, v8);
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v12);
  }
  return a3;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E6C7C0](exception, 14);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_263882CD8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__end_state<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void *std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  long long v4 = operator new(0x20uLL);
  *long long v4 = &unk_270EB4F60;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_263882D60(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void (__cdecl ***std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__empty_state<char>::~__empty_state(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

void std::__empty_state<char>::__exec(const std::__empty_state<char> *this, std::__empty_state<char>::__state *a2)
{
  a2->__do_ = -994;
  a2->__node_ = this->__first_;
}

void std::__owns_one_state<char>::~__owns_one_state(std::__owns_one_state<char> *this)
{
  first = this->__first_;
  if (first) {
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
  }
}

{
  std::__node<char> *first;
  uint64_t vars8;

  first = this->__first_;
  if (first) {
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
  }

  operator delete(this);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_alternative<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, char *a3)
{
  do
  {
    long long v5 = a2;
    a2 = std::basic_regex<char,std::regex_traits<char>>::__parse_term<std::__wrap_iter<char const*>>(a1, (char *)a2, a3);
  }
  while (v5 != a2);
  return v5;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_alternation(std::basic_regex<char> *this, std::__owns_one_state<char> *__sa, std::__owns_one_state<char> *__sb)
{
  uint64_t v6 = (std::__node<char> *)operator new(0x18uLL);
  first = __sb->__first_;
  v6[1].__vftable = (std::__node<char>_vtbl *)__sa->__first_;
  v6[2].__vftable = (std::__node<char>_vtbl *)first;
  v6->__vftable = (std::__node<char>_vtbl *)&unk_270EB5548;
  __sa->__first_ = v6;
  __sb->__first_ = 0;
  unsigned int v8 = (std::__node<char> *)operator new(0x10uLL);
  uint64_t v9 = this->__end_->__first_;
  v8[1].__vftable = (std::__node<char>_vtbl *)v9;
  __sb->__first_ = v8;
  this->__end_->__first_ = 0;
  uint64_t v10 = (std::__node<char> *)operator new(0x10uLL);
  long long v11 = __sb->__first_;
  v10->__vftable = (std::__node<char>_vtbl *)&unk_270EB5590;
  v10[1].__vftable = (std::__node<char>_vtbl *)v11;
  this->__end_->__first_ = v10;
  this->__end_ = (std::__owns_one_state<char> *)__sb->__first_;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_term<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  uint64_t result = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>(a1, a2, a3);
  if (result == (unsigned __int8 *)a2)
  {
    end = a1->__end_;
    unsigned int marked_count = a1->__marked_count_;
    uint64_t v9 = std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(a1, (unsigned __int8 *)a2, a3);
    uint64_t result = (unsigned __int8 *)a2;
    if (v9 != (unsigned __int8 *)a2)
    {
      size_t v10 = a1->__marked_count_ + 1;
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)a1, v9, (unsigned __int8 *)a3, end, marked_count + 1, v10);
    }
  }
  return result;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v6 = *a2;
  if (v6 <= 91)
  {
    if (v6 != 36)
    {
      if (v6 == 40 && a2 + 1 != a3 && a2[1] == 63 && a2 + 2 != a3)
      {
        int v7 = a2[2];
        if (v7 == 33)
        {
          std::regex_traits<char>::regex_traits(&v14.__traits_);
          memset(&v14.__flags_, 0, 40);
          v14.__flags_ = this->__flags_;
          unsigned int v8 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(&v14, v3 + 3, a3);
          unsigned int marked_count = v14.__marked_count_;
          std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(this, &v14, 1, this->__marked_count_);
          this->__marked_count_ += marked_count;
          if (v8 == a3 || *v8 != 41) {
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
          }
          goto LABEL_27;
        }
        if (v7 == 61)
        {
          std::regex_traits<char>::regex_traits(&v14.__traits_);
          memset(&v14.__flags_, 0, 40);
          v14.__flags_ = this->__flags_;
          unsigned int v8 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(&v14, v3 + 3, a3);
          unsigned int v9 = v14.__marked_count_;
          std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(this, &v14, 0, this->__marked_count_);
          this->__marked_count_ += v9;
          if (v8 == a3 || *v8 != 41) {
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
          }
LABEL_27:
          uint64_t v3 = v8 + 1;
          std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&v14.__traits_.__loc_);
          return v3;
        }
      }
      return v3;
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_r_anchor(this);
    return ++v3;
  }
  if (v6 != 92)
  {
    if (v6 != 94) {
      return v3;
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_l_anchor(this);
    return ++v3;
  }
  if (a2 + 1 != a3)
  {
    int v11 = a2[1];
    if (v11 == 66)
    {
      BOOL v12 = 1;
    }
    else
    {
      if (v11 != 98) {
        return v3;
      }
      BOOL v12 = 0;
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_word_boundary(this, v12);
    v3 += 2;
  }
  return v3;
}

void sub_2638833C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, unsigned __int8 *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 != (unsigned __int8 *)a3)
  {
    int v6 = (char)*a2;
    if (v6 <= 62)
    {
      if (v6 == 40)
      {
        int v11 = a2 + 1;
        if (a2 + 1 != (unsigned __int8 *)a3)
        {
          if (a2 + 2 != (unsigned __int8 *)a3 && *v11 == 63 && a2[2] == 58)
          {
            ++this->__open_count_;
            BOOL v12 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(this, a2 + 3, a3);
            if (v12 != a3 && *v12 == 41)
            {
              --this->__open_count_;
              return (unsigned __int8 *)(v12 + 1);
            }
          }
          else
          {
            std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(this);
            unsigned int marked_count = this->__marked_count_;
            ++this->__open_count_;
            std::basic_regex<char> v14 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(this, v11, a3);
            if (v14 != a3)
            {
              CFDataRef v15 = v14;
              if (*v14 == 41)
              {
                std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(this, marked_count);
                --this->__open_count_;
                return (unsigned __int8 *)(v15 + 1);
              }
            }
          }
        }
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      }
      if (v6 == 46)
      {
        int v7 = (std::__node<char> *)operator new(0x10uLL);
        end = this->__end_;
        first = end->__first_;
        v7->__vftable = (std::__node<char>_vtbl *)&unk_270EB51A0;
        v7[1].__vftable = (std::__node<char>_vtbl *)first;
        end->__first_ = v7;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
        return ++v3;
      }
      if ((v6 - 42) >= 2) {
        return std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<std::__wrap_iter<char const*>>(this, a2, a3);
      }
LABEL_28:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>();
    }
    if (v6 > 91)
    {
      if (v6 == 92) {
        return std::basic_regex<char,std::regex_traits<char>>::__parse_atom_escape<std::__wrap_iter<char const*>>(this, a2, (unsigned __int8 *)a3);
      }
      if (v6 == 123) {
        goto LABEL_28;
      }
    }
    else
    {
      if (v6 == 91) {
        return (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)this, (char *)a2, a3);
      }
      if (v6 == 63) {
        goto LABEL_28;
      }
    }
    return std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<std::__wrap_iter<char const*>>(this, a2, a3);
  }
  return v3;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, std::__owns_one_state<char> *__s, size_t a5, size_t a6)
{
  if (a2 == a3) {
    return a2;
  }
  unsigned int v6 = a6;
  unsigned int v7 = a5;
  uint64_t v10 = a1;
  int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  int v12 = (char)*a2;
  if (v12 > 62)
  {
    if (v12 == 63)
    {
      uint64_t v13 = a2 + 1;
      if (v11) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v13 == a3;
      }
      if (!v20 && *v13 == 63)
      {
        uint64_t v13 = a2 + 2;
        a5 = a5;
        a6 = a6;
        size_t v14 = 0;
        size_t v18 = 1;
        goto LABEL_33;
      }
      a5 = a5;
      a6 = a6;
      size_t v14 = 0;
      size_t v18 = 1;
      goto LABEL_45;
    }
    uint64_t v13 = a2;
    if (v12 != 123) {
      return v13;
    }
    CFDataRef v15 = a2 + 1;
    CFNumberRef v16 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<std::__wrap_iter<char const*>>(a1, a2 + 1, a3, (int *)&__max);
    if (v15 != v16)
    {
      if (v16 != a3)
      {
        int v17 = (char)*v16;
        if (v17 != 44)
        {
          if (v17 == 125)
          {
            uint64_t v13 = v16 + 1;
            if (!v11 && v13 != a3 && *v13 == 63)
            {
              uint64_t v13 = v16 + 2;
              size_t v14 = (int)__max;
              a5 = v7;
              a6 = v6;
              a1 = v10;
              size_t v18 = (int)__max;
LABEL_33:
              uint64_t v21 = __s;
              BOOL v22 = 0;
LABEL_46:
              std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v14, v18, v21, a5, a6, v22);
              return v13;
            }
            size_t v14 = (int)__max;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            size_t v18 = (int)__max;
LABEL_45:
            uint64_t v21 = __s;
            BOOL v22 = 1;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
        uint64_t v23 = v16 + 1;
        if (v16 + 1 == a3) {
          goto LABEL_58;
        }
        if (*v23 == 125)
        {
          uint64_t v13 = v16 + 2;
          if (!v11 && v13 != a3 && *v13 == 63)
          {
            uint64_t v13 = v16 + 3;
            size_t v14 = (int)__max;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            goto LABEL_26;
          }
          size_t v14 = (int)__max;
          a5 = v7;
          a6 = v6;
          a1 = v10;
LABEL_36:
          size_t v18 = -1;
          goto LABEL_45;
        }
        int v27 = -1;
        char v25 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<std::__wrap_iter<char const*>>(v10, v23, a3, &v27);
        if (v23 != v25 && v25 != a3 && *v25 == 125)
        {
          size_t v18 = v27;
          size_t v14 = (int)__max;
          if (v27 >= (int)__max)
          {
            uint64_t v13 = v25 + 1;
            BOOL v22 = 1;
            if (!v11 && v13 != a3)
            {
              int v26 = v25[1];
              BOOL v22 = v26 != 63;
              if (v26 == 63) {
                uint64_t v13 = v25 + 2;
              }
            }
            a5 = v7;
            a6 = v6;
            a1 = v10;
            uint64_t v21 = __s;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
      }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    }
LABEL_58:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
  }
  if (v12 == 42)
  {
    uint64_t v13 = a2 + 1;
    if (v11) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = v13 == a3;
    }
    if (!v19 && *v13 == 63)
    {
      uint64_t v13 = a2 + 2;
      a5 = a5;
      a6 = a6;
      size_t v14 = 0;
      goto LABEL_26;
    }
    a5 = a5;
    a6 = a6;
    size_t v14 = 0;
    goto LABEL_36;
  }
  uint64_t v13 = a2;
  if (v12 == 43)
  {
    uint64_t v13 = a2 + 1;
    if (!v11 && v13 != a3 && *v13 == 63)
    {
      uint64_t v13 = a2 + 2;
      a5 = a5;
      a6 = a6;
      size_t v14 = 1;
LABEL_26:
      size_t v18 = -1;
      goto LABEL_33;
    }
    a5 = a5;
    a6 = a6;
    size_t v14 = 1;
    goto LABEL_36;
  }
  return v13;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_l_anchor(std::basic_regex<char> *this)
{
  uint64_t v2 = (std::__node<char> *)operator new(0x18uLL);
  BOOL v3 = (this->__flags_ & 0x5F0) == 1024;
  end = this->__end_;
  first = end->__first_;
  v2->__vftable = (std::__node<char>_vtbl *)&unk_270EB5080;
  v2[1].__vftable = (std::__node<char>_vtbl *)first;
  LOBYTE(v2[2].__vftable) = v3;
  end->__first_ = v2;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_r_anchor(std::basic_regex<char> *this)
{
  uint64_t v2 = (std::__node<char> *)operator new(0x18uLL);
  BOOL v3 = (this->__flags_ & 0x5F0) == 1024;
  end = this->__end_;
  first = end->__first_;
  v2->__vftable = (std::__node<char>_vtbl *)&unk_270EB50C8;
  v2[1].__vftable = (std::__node<char>_vtbl *)first;
  LOBYTE(v2[2].__vftable) = v3;
  end->__first_ = v2;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_word_boundary(std::basic_regex<char> *this, BOOL a2)
{
  long long v4 = (char *)operator new(0x30uLL);
  first = this->__end_->__first_;
  *(void *)long long v4 = &unk_270EB5110;
  *((void *)v4 + 1) = first;
  std::locale::locale((std::locale *)v4 + 2, &this->__traits_.__loc_);
  *(_OWORD *)(v4 + 24) = *(_OWORD *)&this->__traits_.__ct_;
  v4[40] = a2;
  this->__end_->__first_ = (std::__node<char> *)v4;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(std::basic_regex<char> *this, const std::basic_regex<char> *a2, BOOL a3, unsigned int a4)
{
  unsigned int v8 = (std::__node<char> *)operator new(0x58uLL);
  std::__lookahead<char,std::regex_traits<char>>::__lookahead[abi:ne180100]((uint64_t)v8, (uint64_t)a2, a3, (uint64_t)this->__end_->__first_, a4);
  this->__end_->__first_ = v8;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void sub_263883AB4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E6C7C0](exception, 6);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_263883B0C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

uint64_t std::__l_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 92))
  {
    if (*(void *)(a2 + 16) != *(void *)(a2 + 8) || (*(unsigned char *)(a2 + 88) & 1) != 0)
    {
LABEL_12:
      uint64_t v4 = 0;
      *(_DWORD *)a2 = -993;
      goto LABEL_13;
    }
  }
  else
  {
    if (!*(unsigned char *)(result + 16)) {
      goto LABEL_12;
    }
    int v2 = *(unsigned __int8 *)(*(void *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10) {
      goto LABEL_12;
    }
  }
  *(_DWORD *)a2 = -994;
  uint64_t v4 = *(void *)(result + 8);
LABEL_13:
  *(void *)(a2 + 8pthread_mutex_init(this, 0) = v4;
  return result;
}

void (__cdecl ***std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  int v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  int v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

uint64_t std::__r_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  int v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(unsigned char *)(a2 + 88) & 2) == 0
    || *(unsigned char *)(result + 16) && ((v3 = *v2, v3 != 13) ? (BOOL v4 = v3 == 10) : (BOOL v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    uint64_t v5 = *(void *)(result + 8);
  }
  else
  {
    uint64_t v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(void *)(a2 + 8pthread_mutex_init(this, 0) = v5;
  return result;
}

std::locale *std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EB5110;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EB5110;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete(a1);
}

uint64_t std::__word_boundary<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  int v2 = *(unsigned __int8 **)(a2 + 8);
  int v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3) {
    goto LABEL_17;
  }
  BOOL v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 == v3)
  {
    if ((*(unsigned char *)(a2 + 88) & 8) == 0)
    {
      uint64_t v6 = *(v3 - 1);
      goto LABEL_13;
    }
LABEL_17:
    int v10 = 0;
    goto LABEL_25;
  }
  if (v4 == v2)
  {
    int v5 = *(_DWORD *)(a2 + 88);
    if ((v5 & 0x80) == 0)
    {
      if ((v5 & 4) == 0)
      {
        uint64_t v6 = *v2;
LABEL_13:
        if (v6 == 95
          || (v6 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
        {
          int v10 = 1;
          goto LABEL_25;
        }
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  uint64_t v7 = *(v4 - 1);
  uint64_t v8 = *v4;
  int v9 = v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v7) & 0x500) != 0;
  int v11 = v8 == 95
     || (v8 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v8) & 0x500) != 0;
  int v10 = v9 != v11;
LABEL_25:
  if (*(unsigned __int8 *)(result + 40) == v10)
  {
    uint64_t v12 = 0;
    int v13 = -993;
  }
  else
  {
    uint64_t v12 = *(void *)(result + 8);
    int v13 = -994;
  }
  *(_DWORD *)a2 = v13;
  *(void *)(a2 + 8pthread_mutex_init(this, 0) = v12;
  return result;
}

uint64_t std::__lookahead<char,std::regex_traits<char>>::__lookahead[abi:ne180100](uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  *(void *)a1 = &unk_270EB5158;
  *(void *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 4pthread_mutex_init(this, 0) = *(_OWORD *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 40);
  *(void *)(a1 + 64) = v9;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 72) = *(void *)(a2 + 56);
  *(_DWORD *)(a1 + 8pthread_mutex_init(this, 0) = a5;
  *(unsigned char *)(a1 + 84) = a3;
  return a1;
}

void (__cdecl ***std::__lookahead<char,std::regex_traits<char>>::~__lookahead(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_270EB5158;
  int v2 = (std::locale *)(a1 + 2);
  int v3 = (std::__shared_weak_count *)a1[8];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  std::locale::~locale(v2);
  BOOL v4 = a1[1];
  if (v4) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  }
  return a1;
}

void std::__lookahead<char,std::regex_traits<char>>::~__lookahead(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EB5158;
  int v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (locale) {
    std::__shared_weak_count::__release_shared[abi:ne180100](locale);
  }
  std::locale::~locale(v2);
  BOOL v4 = a1[1].__locale_;
  if (v4) {
    (*(void (**)(std::locale::__imp *))(*(void *)v4 + 8))(v4);
  }

  operator delete(a1);
}

void std::__lookahead<char,std::regex_traits<char>>::__exec(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  char v21 = 0;
  memset(&v22, 0, 17);
  char v23 = 0;
  uint64_t v24 = 0;
  memset(&__p, 0, sizeof(__p));
  std::vector<std::csub_match>::size_type v4 = (*(_DWORD *)(a1 + 44) + 1);
  uint64_t v5 = *(void *)(a2 + 16);
  v18.first = *(const char **)(a2 + 24);
  v18.second = v18.first;
  v18.matched = 0;
  std::vector<std::sub_match<char const*>>::assign(&__p, v4, &v18);
  uint64_t v19 = v5;
  uint64_t v20 = v5;
  char v21 = 0;
  std::vector<std::csub_match>::value_type v22 = v18;
  uint64_t v24 = v5;
  char v23 = 1;
  uint64_t v6 = *(const char **)(a2 + 16);
  if (*(unsigned char *)(a2 + 92)) {
    BOOL v7 = v6 == *(const char **)(a2 + 8);
  }
  else {
    BOOL v7 = 0;
  }
  char v8 = v7;
  if (*(unsigned __int8 *)(a1 + 84) == std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1 + 16, v6, *(const char **)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v8))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 8pthread_mutex_init(this, 0) = 0;
    begin = __p.__begin_;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 8pthread_mutex_init(this, 0) = *(void *)(a1 + 8);
  begin = __p.__begin_;
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p.__end_ - (char *)__p.__begin_) >> 3);
  if (v10 < 2)
  {
LABEL_13:
    if (!begin) {
      return;
    }
    goto LABEL_14;
  }
  int v11 = 0;
  int v12 = *(_DWORD *)(a1 + 80);
  uint64_t v13 = *(void *)(a2 + 32);
  unint64_t v14 = 1;
  do
  {
    CFDataRef v15 = &begin[v14];
    uint64_t v16 = v13 + 24 * (v12 + v11);
    *(std::pair<const char *, const char *> *)uint64_t v16 = v15->std::pair<const char *, const char *>;
    *(unsigned char *)(v16 + 16) = v15->matched;
    unint64_t v14 = (v11 + 2);
    ++v11;
  }
  while (v10 > v14);
LABEL_14:
  __p.__end_ = begin;
  operator delete(begin);
}

void sub_263884328(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::match_results<char const*>::__init(std::match_results<const char *> *this, unsigned int __s, const char *__f, const char *__l, BOOL __no_update_pos)
{
  this->__unmatched_.first = __l;
  p_unmatched = &this->__unmatched_;
  this->__unmatched_.second = __l;
  this->__unmatched_.matched = 0;
  std::vector<std::sub_match<char const*>>::assign(&this->__matches_, __s, &this->__unmatched_);
  this->__prefix_.first = __f;
  this->__prefix_.second = __f;
  this->__prefix_.matched = 0;
  this->__suffix_ = *p_unmatched;
  if (!__no_update_pos) {
    this->__position_start_ = __f;
  }
  this->__ready_ = 1;
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v41 = 0;
  long long v42 = 0;
  unint64_t v43 = 0;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    __x.first = a3;
    __x.second = a3;
    __x.matched = 0;
    *(_DWORD *)unint64_t v37 = 0;
    memset(&v37[8], 0, 48);
    *(_OWORD *)std::vector<std::csub_match> __p = 0u;
    memset(v39, 0, 21);
    long long v42 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v41, (uint64_t)v37);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(void *)&v37[32])
    {
      *(void *)&v37[40] = *(void *)&v37[32];
      operator delete(*(void **)&v37[32]);
    }
    unint64_t v35 = a4;
    int v12 = v42;
    *((_DWORD *)v42 - 24) = 0;
    *((void *)v12 - 11) = a2;
    *((void *)v12 - 1pthread_mutex_init(this, 0) = a2;
    *((void *)v12 - 9) = a3;
    std::vector<std::sub_match<char const*>>::resize((std::vector<std::csub_match> *)(v12 - 4), *(unsigned int *)(a1 + 28), &__x);
    std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)((char *)v42 - 40), *(unsigned int *)(a1 + 32));
    uint64_t v13 = v42;
    *((void *)v42 - 2) = v6;
    *((_DWORD *)v13 - 2) = a5;
    *((unsigned char *)v13 - 4) = a6;
    unsigned int v14 = 1;
    while (2)
    {
      if ((v14 & 0xFFF) == 0 && (int)(v14 >> 12) >= (int)a3 - (int)a2) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
      }
      uint64_t v16 = v13 - 1;
      uint64_t v15 = *((void *)v13 - 2);
      int v17 = v13 - 6;
      if (v15) {
        (*(void (**)(uint64_t, _OWORD *))(*(void *)v15 + 16))(v15, v13 - 6);
      }
      switch(*(_DWORD *)v17)
      {
        case 0xFFFFFC18:
          std::vector<std::csub_match>::value_type v18 = (const char *)*((void *)v13 - 10);
          if ((a5 & 0x20) != 0 && v18 == a2 || (a5 & 0x1000) != 0 && v18 != a3) {
            goto LABEL_16;
          }
          uint64_t v26 = *v35;
          *(void *)uint64_t v26 = a2;
          *(void *)(v26 + 8) = v18;
          *(unsigned char *)(v26 + 16) = 1;
          uint64_t v27 = *((void *)v13 - 8);
          uint64_t v28 = *((void *)v13 - 7) - v27;
          if (v28)
          {
            unint64_t v29 = 0xAAAAAAAAAAAAAAABLL * (v28 >> 3);
            uint64_t v30 = (unsigned char *)(v27 + 16);
            unsigned int v31 = 1;
            do
            {
              uint64_t v32 = v26 + 24 * v31;
              *(_OWORD *)uint64_t v32 = *((_OWORD *)v30 - 1);
              char v33 = *v30;
              v30 += 24;
              *(unsigned char *)(v32 + 16) = v33;
            }
            while (v29 > v31++);
          }
          uint64_t v6 = 1;
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_23;
        case 0xFFFFFC1F:
LABEL_16:
          uint64_t v19 = v42 - 6;
          std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)&v43, (void *)v42 - 12);
          long long v42 = v19;
          goto LABEL_23;
        case 0xFFFFFC20:
          long long v20 = *(v13 - 5);
          *(_OWORD *)unint64_t v37 = *v17;
          *(_OWORD *)&unsigned char v37[16] = v20;
          memset(&v37[32], 0, 24);
          std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v37[32], *((long long **)v13 - 8), *((long long **)v13 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v13 - 7) - *((void *)v13 - 8)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v39[0] = 0;
          std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *((long long **)v13 - 5), *((long long **)v13 - 4), (uint64_t)(*((void *)v13 - 4) - *((void *)v13 - 5)) >> 4);
          uint64_t v21 = *v16;
          *(void *)((char *)&v39[1] + 5) = *(void *)((char *)v13 - 11);
          v39[1] = v21;
          (*(void (**)(void, uint64_t, _OWORD *))(*(void *)*v16 + 24))(*v16, 1, v13 - 6);
          (*(void (**)(void, void, unsigned char *))(*(void *)v39[1] + 24))(v39[1], 0, v37);
          std::vector<std::csub_match>::value_type v22 = v42;
          if ((unint64_t)v42 >= v43)
          {
            long long v42 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v41, (uint64_t)v37);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            long long v23 = *(_OWORD *)&v37[16];
            *long long v42 = *(_OWORD *)v37;
            v22[1] = v23;
            *((void *)v22 + 4) = 0;
            *((void *)v22 + 5) = 0;
            *((void *)v22 + 6) = 0;
            *((void *)v22 + 7) = 0;
            unint64_t v22[2] = *(_OWORD *)&v37[32];
            *((void *)v22 + 6) = *(void *)&v37[48];
            memset(&v37[32], 0, 24);
            *((void *)v22 + 8) = 0;
            *((void *)v22 + 9) = 0;
            *(_OWORD *)((char *)v22 + 56) = *(_OWORD *)__p;
            *((void *)v22 + 9) = v39[0];
            __p[0] = 0;
            __p[1] = 0;
            v39[0] = 0;
            uint64_t v24 = v39[1];
            *(void *)((char *)v22 + 85) = *(void *)((char *)&v39[1] + 5);
            *((void *)v22 + 1pthread_mutex_init(this, 0) = v24;
            long long v42 = v22 + 6;
          }
          if (*(void *)&v37[32])
          {
            *(void *)&v37[40] = *(void *)&v37[32];
            operator delete(*(void **)&v37[32]);
          }
LABEL_23:
          uint64_t v13 = v42;
          ++v14;
          if (v41 != v42) {
            continue;
          }
          uint64_t v6 = 0;
          break;
        default:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
      }
      break;
    }
  }
  *(void *)unint64_t v37 = &v41;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)v37);
  return v6;
}

void sub_2638847AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  std::__state<char>::~__state(&a13);
  a13 = v18 - 112;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a13);
  _Unwind_Resume(a1);
}

void std::vector<std::sub_match<char const*>>::assign(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __u)
{
  value = this->__end_cap_.__value_;
  begin = this->__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3) >= __n)
  {
    std::vector<std::csub_match>::pointer end = this->__end_;
    std::vector<std::csub_match>::size_type v16 = end - begin;
    if (v16 >= __n) {
      std::vector<std::csub_match>::size_type v17 = __n;
    }
    else {
      std::vector<std::csub_match>::size_type v17 = end - begin;
    }
    if (v17)
    {
      uint64_t v18 = begin;
      do
      {
        *v18++ = *__u;
        --v17;
      }
      while (v17);
    }
    if (__n <= v16)
    {
      this->__end_ = &begin[__n];
    }
    else
    {
      uint64_t v19 = &end[__n - v16];
      std::vector<std::csub_match>::size_type v20 = 24 * __n - 24 * v16;
      do
      {
        std::pair<const char *, const char *> v21 = __u->std::pair<const char *, const char *>;
        *(void *)&end->matched = *(void *)&__u->matched;
        end->std::pair<const char *, const char *> = v21;
        ++end;
        v20 -= 24;
      }
      while (v20);
      this->__end_ = v19;
    }
  }
  else
  {
    if (begin)
    {
      this->__end_ = begin;
      operator delete(begin);
      value = 0;
      this->__begin_ = 0;
      this->__end_ = 0;
      this->__end_cap_.__value_ = 0;
    }
    if (__n > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)value >> 3);
    std::vector<std::csub_match>::size_type v9 = 2 * v8;
    if (2 * v8 <= __n) {
      std::vector<std::csub_match>::size_type v9 = __n;
    }
    if (v8 >= 0x555555555555555) {
      unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v10 = v9;
    }
    std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](this, v10);
    std::vector<std::csub_match>::pointer v11 = this->__end_;
    int v12 = &v11[__n];
    std::vector<std::csub_match>::size_type v13 = 24 * __n;
    do
    {
      std::pair<const char *, const char *> v14 = __u->std::pair<const char *, const char *>;
      *(void *)&v11->matched = *(void *)&__u->matched;
      v11->std::pair<const char *, const char *> = v14;
      ++v11;
      v13 -= 24;
    }
    while (v13);
    this->__end_ = v12;
  }
}

char *std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

void *std::__state<char>::~__state(void *a1)
{
  int v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  int v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

void std::vector<std::sub_match<char const*>>::resize(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __sz, std::vector<std::csub_match>::const_reference __x)
{
  std::vector<std::csub_match>::size_type v3 = 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3);
  BOOL v4 = __sz >= v3;
  std::vector<std::csub_match>::size_type v5 = __sz - v3;
  if (v5 != 0 && v4)
  {
    std::vector<std::sub_match<char const*>>::__append(this, v5, __x);
  }
  else if (!v4)
  {
    this->__end_ = &this->__begin_[__sz];
  }
}

void std::vector<std::pair<unsigned long,char const*>>::resize(std::vector<std::pair<unsigned long, const char *>> *this, std::vector<std::pair<unsigned long, const char *>>::size_type __sz)
{
  std::vector<std::pair<unsigned long, const char *>>::size_type v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2) {
      this->__end_ = &this->__begin_[__sz];
    }
  }
  else
  {
    std::vector<std::pair<unsigned long,char const*>>::__append(this, __sz - v2);
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E6C7C0](exception, 12);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_263884B34(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E6C7C0](exception, 16);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_263884B8C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 5);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x2AAAAAAAAAAAAAALL) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 5);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x155555555555555) {
    unint64_t v9 = 0x2AAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  v16[4] = a1 + 2;
  if (v9) {
    unint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char>>>(v7, v9);
  }
  else {
    unint64_t v10 = 0;
  }
  std::vector<std::csub_match>::pointer v11 = &v10[96 * v4];
  v16[0] = v10;
  v16[1] = v11;
  v16[3] = &v10[96 * v9];
  long long v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)std::vector<std::csub_match>::pointer v11 = *(_OWORD *)a2;
  *((_OWORD *)v11 + 1) = v12;
  *((void *)v11 + 5) = 0;
  *((void *)v11 + 6) = 0;
  *((void *)v11 + 4) = 0;
  *((_OWORD *)v11 + 2) = *(_OWORD *)(a2 + 32);
  *((void *)v11 + 6) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 4pthread_mutex_init(this, 0) = 0;
  *(void *)(a2 + 48) = 0;
  *((void *)v11 + 7) = 0;
  *((void *)v11 + 8) = 0;
  *((void *)v11 + 9) = 0;
  *(_OWORD *)(v11 + 56) = *(_OWORD *)(a2 + 56);
  *((void *)v11 + 9) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  uint64_t v13 = *(void *)(a2 + 80);
  *(void *)(v11 + 85) = *(void *)(a2 + 85);
  *((void *)v11 + 1pthread_mutex_init(this, 0) = v13;
  unint64_t v16[2] = v11 + 96;
  std::vector<std::__state<char>>::__swap_out_circular_buffer(a1, v16);
  uint64_t v14 = a1[1];
  std::__split_buffer<std::__state<char>>::~__split_buffer(v16);
  return v14;
}

void sub_263884CDC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::__state<char>>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::__state<char>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(96 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  unint64_t v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    do
    {
      long long v8 = *(_OWORD *)(a3 - 80);
      *(_OWORD *)(v7 - 96) = *(_OWORD *)(a3 - 96);
      *(_OWORD *)(v7 - 8pthread_mutex_init(this, 0) = v8;
      *(void *)(v7 - 56) = 0;
      *(void *)(v7 - 48) = 0;
      *(void *)(v7 - 64) = 0;
      *(_OWORD *)(v7 - 64) = *(_OWORD *)(a3 - 64);
      *(void *)(v7 - 48) = *(void *)(a3 - 48);
      *(void *)(a3 - 64) = 0;
      *(void *)(a3 - 56) = 0;
      *(void *)(a3 - 48) = 0;
      *(void *)(v7 - 4pthread_mutex_init(this, 0) = 0;
      *(void *)(v7 - 32) = 0;
      *(void *)(v7 - 24) = 0;
      *(_OWORD *)(v7 - 4pthread_mutex_init(this, 0) = *(_OWORD *)(a3 - 40);
      *(void *)(v7 - 24) = *(void *)(a3 - 24);
      *(void *)(a3 - 4pthread_mutex_init(this, 0) = 0;
      *(void *)(a3 - 32) = 0;
      *(void *)(a3 - 24) = 0;
      uint64_t v9 = *(void *)(a3 - 16);
      *(void *)(v7 - 11) = *(void *)(a3 - 11);
      *(void *)(v7 - 16) = v9;
      uint64_t v7 = *((void *)&v15 + 1) - 96;
      *((void *)&v15 + 1) -= 96;
      a3 -= 96;
    }
    while (a3 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1 = *(void **)(a1[2] + 8);
  std::vector<std::pair<unsigned long, const char *>>::size_type v2 = *(void **)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      std::allocator<std::__state<char>>::destroy[abi:ne180100](v3, v1);
      v1 += 12;
    }
    while (v1 != v2);
  }
}

void std::allocator<std::__state<char>>::destroy[abi:ne180100](uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)a2[7];
  if (v3)
  {
    a2[8] = v3;
    operator delete(v3);
  }
  unint64_t v4 = (void *)a2[4];
  if (v4)
  {
    a2[5] = v4;
    operator delete(v4);
  }
}

void **std::__split_buffer<std::__state<char>>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<std::__state<char>>::clear[abi:ne180100](void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 96;
    std::allocator<std::__state<char>>::destroy[abi:ne180100](v4, (void *)(i - 96));
  }
}

void std::vector<std::sub_match<char const*>>::__append(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __x)
{
  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  uint64_t v7 = value;
  uint64_t v9 = p_end_cap[-1].__value_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)v9) >> 3) >= __n)
  {
    if (__n)
    {
      long long v15 = &v9[__n];
      std::vector<std::csub_match>::size_type v16 = 24 * __n;
      do
      {
        std::pair<const char *, const char *> v17 = __x->std::pair<const char *, const char *>;
        *(void *)&v9->matched = *(void *)&__x->matched;
        v9->std::pair<const char *, const char *> = v17;
        ++v9;
        v16 -= 24;
      }
      while (v16);
      uint64_t v9 = v15;
    }
    this->__end_ = v9;
  }
  else
  {
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v9 - (char *)this->__begin_) >> 3);
    unint64_t v11 = v10 + __n;
    if (v10 + __n > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)v7 - (char *)this->__begin_) >> 3);
    if (2 * v12 > v11) {
      unint64_t v11 = 2 * v12;
    }
    if (v12 >= 0x555555555555555) {
      unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13) {
      long long v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>((uint64_t)p_end_cap, v13);
    }
    else {
      long long v14 = 0;
    }
    uint64_t v18 = (std::sub_match<const char *> *)&v14[24 * v10];
    uint64_t v19 = &v18[__n];
    std::vector<std::csub_match>::size_type v20 = 24 * __n;
    std::pair<const char *, const char *> v21 = v18;
    do
    {
      std::pair<const char *, const char *> v22 = __x->std::pair<const char *, const char *>;
      v21[1].first = *(const char **)&__x->matched;
      *std::pair<const char *, const char *> v21 = v22;
      std::pair<const char *, const char *> v21 = (std::pair<const char *, const char *> *)((char *)v21 + 24);
      v20 -= 24;
    }
    while (v20);
    long long v23 = (std::sub_match<const char *> *)&v14[24 * v13];
    std::vector<std::csub_match>::pointer begin = this->__begin_;
    std::vector<std::csub_match>::pointer end = this->__end_;
    if (end != this->__begin_)
    {
      do
      {
        std::pair<const char *, const char *> v26 = end[-1].std::pair<const char *, const char *>;
        *(void *)&v18[-1].matched = *(void *)&end[-1].matched;
        v18[-1].std::pair<const char *, const char *> = v26;
        --v18;
        --end;
      }
      while (end != begin);
      std::vector<std::csub_match>::pointer end = this->__begin_;
    }
    this->__begin_ = v18;
    this->__end_ = v19;
    this->__end_cap_.__value_ = v23;
    if (end)
    {
      operator delete(end);
    }
  }
}

void std::vector<std::pair<unsigned long,char const*>>::__append(std::vector<std::pair<unsigned long, const char *>> *this, std::vector<std::pair<unsigned long, const char *>>::size_type __n)
{
  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  uint64_t v5 = value;
  uint64_t v7 = p_end_cap[-1].__value_;
  if (__n <= value - v7)
  {
    if (__n)
    {
      bzero(p_end_cap[-1].__value_, 16 * __n);
      v7 += __n;
    }
    this->__end_ = v7;
  }
  else
  {
    uint64_t v8 = (char *)v7 - (char *)this->__begin_;
    unint64_t v9 = __n + (v8 >> 4);
    if (v9 >> 60) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 4;
    uint64_t v11 = (char *)v5 - (char *)this->__begin_;
    if (v11 >> 3 > v9) {
      unint64_t v9 = v11 >> 3;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      unint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>((uint64_t)p_end_cap, v12);
    }
    else {
      unint64_t v13 = 0;
    }
    long long v14 = (std::pair<unsigned long, const char *> *)&v13[16 * v10];
    long long v15 = (std::pair<unsigned long, const char *> *)&v13[16 * v12];
    bzero(v14, 16 * __n);
    std::vector<std::csub_match>::size_type v16 = &v14[__n];
    std::vector<std::pair<unsigned long, const char *>>::pointer begin = this->__begin_;
    std::vector<std::csub_match>::pointer end = this->__end_;
    if (end != this->__begin_)
    {
      do
      {
        v14[-1] = end[-1];
        --v14;
        --end;
      }
      while (end != begin);
      std::vector<std::csub_match>::pointer end = this->__begin_;
    }
    this->__begin_ = v14;
    this->__end_ = v16;
    this->__end_cap_.__value_ = v15;
    if (end)
    {
      operator delete(end);
    }
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

char *std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = *((void *)v6 + 1);
    while (a2 != a3)
    {
      long long v8 = *a2;
      *(void *)(v7 + 16) = *((void *)a2 + 2);
      *(_OWORD *)uint64_t v7 = v8;
      v7 += 24;
      a2 = (long long *)((char *)a2 + 24);
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_263885338(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = (_OWORD *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      long long v8 = *a2++;
      *v7++ = v8;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_2638853AC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 12;
        std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_atom_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3 || *a2 != 92) {
    return a2;
  }
  uint64_t v5 = a2 + 1;
  if (a2 + 1 == a3) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  }
  uint64_t result = std::basic_regex<char,std::regex_traits<char>>::__parse_decimal_escape<std::__wrap_iter<char const*>>(a1, a2 + 1, a3);
  if (v5 == result)
  {
    uint64_t result = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_character_class_escape<std::__wrap_iter<char const*>>(a1, (char *)a2 + 1, (char *)a3);
    if (v5 == result)
    {
      uint64_t result = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)(a2 + 1), (std::basic_regex<char> *)a3, 0);
      if (v5 == result) {
        return a2;
      }
    }
  }
  return result;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3) {
      goto LABEL_20;
    }
    uint64_t v5 = a2[1] == 94 ? a2 + 2 : a2 + 1;
    started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list((std::basic_regex<char> *)a1, a2[1] == 94);
    if (v5 == a3) {
      goto LABEL_20;
    }
    uint64_t v7 = (uint64_t *)started;
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *v5 == 93)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)started, 93);
      ++v5;
    }
    if (v5 == a3) {
      goto LABEL_20;
    }
    do
    {
      long long v8 = v5;
      uint64_t v5 = std::basic_regex<char,std::regex_traits<char>>::__parse_expression_term<std::__wrap_iter<char const*>>(a1, v5, a3, v7);
    }
    while (v8 != v5);
    if (v8 == a3) {
      goto LABEL_20;
    }
    if (*v8 == 45)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v7, 45);
      ++v8;
    }
    if (v8 == a3 || *v8 != 93) {
LABEL_20:
    }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
    return v8 + 1;
  }
  return a2;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(std::basic_regex<char> *this)
{
  if ((this->__flags_ & 2) == 0)
  {
    uint64_t v2 = (std::__node<char> *)operator new(0x18uLL);
    unsigned int v3 = this->__marked_count_ + 1;
    this->__marked_count_ = v3;
    std::vector<std::csub_match>::pointer end = this->__end_;
    first = end->__first_;
    v2->__vftable = (std::__node<char>_vtbl *)&unk_270EB53E0;
    v2[1].__vftable = (std::__node<char>_vtbl *)first;
    LODWORD(v2[2].__vftable) = v3;
    end->__first_ = v2;
    this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
  }
}

void std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(std::basic_regex<char> *this, unsigned int a2)
{
  if ((this->__flags_ & 2) == 0)
  {
    uint64_t v4 = (std::__node<char> *)operator new(0x18uLL);
    std::vector<std::csub_match>::pointer end = this->__end_;
    first = end->__first_;
    v4->__vftable = (std::__node<char>_vtbl *)&unk_270EB5428;
    v4[1].__vftable = (std::__node<char>_vtbl *)first;
    LODWORD(v4[2].__vftable) = a2;
    end->__first_ = v4;
    this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E6C7C0](exception, 11);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_263885780(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned char *std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned char *a2, unsigned char *a3)
{
  unsigned int v3 = a2;
  if (a2 != a3)
  {
    int v4 = (char)*a2;
    BOOL v5 = (v4 - 36) > 0x3A || ((1 << (*a2 - 36)) & 0x7800000080004F1) == 0;
    if (v5 && (v4 - 123) >= 3)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v4);
      ++v3;
    }
  }
  return v3;
}

void (__cdecl ***std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E6C7C0](exception, 3);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_263885934(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_decimal_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned int v3 = a2;
  if (a2 != a3)
  {
    int v4 = *a2;
    unsigned int v5 = v4 - 48;
    if (v4 == 48)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v5);
      return ++v3;
    }
    if ((v4 - 49) > 8) {
      return v3;
    }
    if (++v3 == a3)
    {
      unsigned int v3 = a3;
    }
    else
    {
      while (1)
      {
        int v6 = *v3;
        if ((v6 - 48) > 9) {
          break;
        }
        if (v5 >= 0x19999999) {
          goto LABEL_16;
        }
        ++v3;
        unsigned int v5 = v6 + 10 * v5 - 48;
        if (v3 == a3)
        {
          unsigned int v3 = a3;
          break;
        }
      }
      if (!v5) {
        goto LABEL_16;
      }
    }
    if (v5 <= a1->__marked_count_)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(a1, v5);
      return v3;
    }
LABEL_16:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  }
  return v3;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_character_class_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  unsigned int v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v4 = *a2;
  if (v4 > 99)
  {
    if (v4 == 119)
    {
      BOOL v5 = 0;
      goto LABEL_15;
    }
    if (v4 == 115)
    {
      BOOL v9 = 0;
      goto LABEL_17;
    }
    if (v4 != 100) {
      return v3;
    }
    BOOL v6 = 0;
LABEL_12:
    started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(a1, v6);
    int v8 = started->__mask_ | 0x400;
LABEL_18:
    started->__mask_ = v8;
    goto LABEL_19;
  }
  switch(v4)
  {
    case 'D':
      BOOL v6 = 1;
      goto LABEL_12;
    case 'S':
      BOOL v9 = 1;
LABEL_17:
      started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(a1, v9);
      int v8 = started->__mask_ | 0x4000;
      goto LABEL_18;
    case 'W':
      BOOL v5 = 1;
LABEL_15:
      uint64_t v10 = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(a1, v5);
      v10->__mask_ |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v10, 95);
LABEL_19:
      ++v3;
      break;
  }
  return v3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::string *a4)
{
  int v4 = this;
  if (this != a3)
  {
    int locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
    if (locale_low > 109)
    {
      char v6 = 0;
      switch(LOBYTE(this->__traits_.__loc_.__locale_))
      {
        case 'n':
          if (a4)
          {
            uint64_t v7 = a4;
            std::basic_regex<char>::value_type locale = 10;
            goto LABEL_52;
          }
          std::basic_regex<char>::value_type locale = 10;
          goto LABEL_61;
        case 'r':
          if (a4)
          {
            uint64_t v7 = a4;
            std::basic_regex<char>::value_type locale = 13;
            goto LABEL_52;
          }
          std::basic_regex<char>::value_type locale = 13;
          goto LABEL_61;
        case 't':
          if (a4)
          {
            uint64_t v7 = a4;
            std::basic_regex<char>::value_type locale = 9;
            goto LABEL_52;
          }
          std::basic_regex<char>::value_type locale = 9;
          goto LABEL_61;
        case 'u':
          if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3) {
            goto LABEL_66;
          }
          int v9 = BYTE1(this->__traits_.__loc_.__locale_);
          if ((v9 & 0xF8) != 0x30 && (v9 & 0xFE) != 0x38 && (v9 | 0x20u) - 97 >= 6) {
            goto LABEL_66;
          }
          int v4 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 2);
          if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 2) == a3) {
            goto LABEL_66;
          }
          int v10 = LOBYTE(v4->__traits_.__loc_.__locale_);
          char v11 = -48;
          if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38) {
            goto LABEL_24;
          }
          v10 |= 0x20u;
          if ((v10 - 97) >= 6) {
            goto LABEL_66;
          }
          char v11 = -87;
LABEL_24:
          char v6 = 16 * (v11 + v10);
LABEL_25:
          if ((std::basic_regex<char> *)((char *)&v4->__traits_.__loc_.__locale_ + 1) == a3) {
            goto LABEL_66;
          }
          int v12 = BYTE1(v4->__traits_.__loc_.__locale_);
          char v13 = -48;
          if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38) {
            goto LABEL_30;
          }
          v12 |= 0x20u;
          if ((v12 - 97) >= 6) {
            goto LABEL_66;
          }
          char v13 = -87;
LABEL_30:
          if ((std::basic_regex<char> *)((char *)&v4->__traits_.__loc_.__locale_ + 2) == a3) {
            goto LABEL_66;
          }
          int v14 = BYTE2(v4->__traits_.__loc_.__locale_);
          char v15 = -48;
          if ((v14 & 0xF8) == 0x30 || (v14 & 0xFE) == 0x38) {
            goto LABEL_35;
          }
          v14 |= 0x20u;
          if ((v14 - 97) >= 6) {
            goto LABEL_66;
          }
          char v15 = -87;
LABEL_35:
          std::string::value_type v16 = v15 + v14 + 16 * (v13 + v12 + v6);
          if (a4) {
            std::string::operator=(a4, v16);
          }
          else {
            std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v16);
          }
          return (std::basic_regex<char> *)((char *)v4 + 3);
        case 'v':
          if (a4)
          {
            uint64_t v7 = a4;
            std::basic_regex<char>::value_type locale = 11;
            goto LABEL_52;
          }
          std::basic_regex<char>::value_type locale = 11;
          break;
        case 'x':
          goto LABEL_25;
        default:
          goto LABEL_47;
      }
      goto LABEL_61;
    }
    if (locale_low == 48)
    {
      if (a4)
      {
        uint64_t v7 = a4;
        std::basic_regex<char>::value_type locale = 0;
        goto LABEL_52;
      }
      std::basic_regex<char>::value_type locale = 0;
LABEL_61:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, locale);
      return (std::basic_regex<char> *)((char *)v4 + 1);
    }
    if (locale_low != 99)
    {
      if (locale_low == 102)
      {
        if (a4)
        {
          uint64_t v7 = a4;
          std::basic_regex<char>::value_type locale = 12;
LABEL_52:
          std::string::operator=(v7, locale);
          return (std::basic_regex<char> *)((char *)v4 + 1);
        }
        std::basic_regex<char>::value_type locale = 12;
        goto LABEL_61;
      }
LABEL_47:
      if (LOBYTE(this->__traits_.__loc_.__locale_) != 95
        && ((locale_low & 0x80) != 0
         || (a1->__traits_.__ct_->__tab_[LOBYTE(this->__traits_.__loc_.__locale_)] & 0x500) == 0))
      {
        std::basic_regex<char>::value_type locale = (std::basic_regex<char>::value_type)this->__traits_.__loc_.__locale_;
        if (a4)
        {
          uint64_t v7 = a4;
          goto LABEL_52;
        }
        goto LABEL_61;
      }
LABEL_66:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
    }
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3) {
      goto LABEL_66;
    }
    if (SBYTE1(this->__traits_.__loc_.__locale_) < 65) {
      goto LABEL_66;
    }
    unsigned int v17 = BYTE1(this->__traits_.__loc_.__locale_);
    if (v17 >= 0x5B && (v17 - 97) > 0x19u) {
      goto LABEL_66;
    }
    std::string::value_type v18 = v17 & 0x1F;
    if (a4) {
      std::string::operator=(a4, v18);
    }
    else {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v18);
    }
    return (std::basic_regex<char> *)((char *)v4 + 2);
  }
  return v4;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_char(std::basic_regex<char> *this, std::basic_regex<char>::value_type __c)
{
  uint64_t v2 = __c;
  std::basic_regex<_CharT, _Traits>::flag_type flags = this->__flags_;
  if (flags)
  {
    int v8 = (char *)operator new(0x30uLL);
    std::__match_char_icase<char,std::regex_traits<char>>::__match_char_icase[abi:ne180100]((uint64_t)v8, (uint64_t)this, v2, (uint64_t)this->__end_->__first_);
LABEL_6:
    this->__end_->__first_ = (std::__node<char> *)v8;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    int v8 = (char *)operator new(0x30uLL);
    first = this->__end_->__first_;
    *(void *)int v8 = &unk_270EB5230;
    *((void *)v8 + 1) = first;
    std::locale::locale((std::locale *)v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&this->__traits_.__ct_;
    v8[40] = v2;
    goto LABEL_6;
  }
  BOOL v5 = (std::__node<char> *)operator new(0x18uLL);
  std::vector<std::csub_match>::pointer end = this->__end_;
  uint64_t v7 = end->__first_;
  v5->__vftable = (std::__node<char>_vtbl *)&unk_270EB5278;
  v5[1].__vftable = (std::__node<char>_vtbl *)v7;
  LOBYTE(v5[2].__vftable) = v2;
  end->__first_ = v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void sub_263885ED0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E6C7C0](exception, 4);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_263885F28(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(std::basic_regex<char> *this, int __i)
{
  std::basic_regex<_CharT, _Traits>::flag_type flags = this->__flags_;
  if (flags)
  {
    int v8 = (std::locale *)operator new(0x30uLL);
    int v9 = v8;
    v8[1].__locale_ = (std::locale::__imp *)this->__end_->__first_;
    int v10 = (std::locale::__imp *)&unk_270EB52C0;
LABEL_6:
    v8->__locale_ = v10;
    std::locale::locale(v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)&v9[3].__locale_ = *(_OWORD *)&this->__traits_.__ct_;
    LODWORD(v9[5].__locale_) = __i;
    this->__end_->__first_ = (std::__node<char> *)v9;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    int v8 = (std::locale *)operator new(0x30uLL);
    int v9 = v8;
    v8[1].__locale_ = (std::locale::__imp *)this->__end_->__first_;
    int v10 = (std::locale::__imp *)&unk_270EB5308;
    goto LABEL_6;
  }
  BOOL v5 = (std::__node<char> *)operator new(0x18uLL);
  std::vector<std::csub_match>::pointer end = this->__end_;
  first = end->__first_;
  v5->__vftable = (std::__node<char>_vtbl *)&unk_270EB5350;
  v5[1].__vftable = (std::__node<char>_vtbl *)first;
  LODWORD(v5[2].__vftable) = __i;
  end->__first_ = v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__match_char_icase[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_270EB51E8;
  *(void *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 4pthread_mutex_init(this, 0) = (*(uint64_t (**)(void, uint64_t))(**(void **)(a2 + 8) + 40))(*(void *)(a2 + 8), a3);
  return a1;
}

void sub_2638860D0(_Unwind_Exception *a1)
{
  std::locale::~locale(v2);
  uint64_t v4 = (uint64_t)v1[1];
  if (v4) {
    std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(v4);
  }
  _Unwind_Resume(a1);
}

std::locale *std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EB51E8;
  std::locale::~locale(a1 + 2);
  std::basic_regex<char>::value_type locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EB51E8;
  std::locale::~locale(a1 + 2);
  std::basic_regex<char>::value_type locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete(a1);
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned int v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (uint64_t v4 = result,
        uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(result + 24) + 40))(*(void *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    uint64_t v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(void *)(a2 + 16);
    uint64_t v5 = *(void *)(v4 + 8);
  }
  *(void *)(a2 + 8pthread_mutex_init(this, 0) = v5;
  return result;
}

std::locale *std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EB5230;
  std::locale::~locale(a1 + 2);
  std::basic_regex<char>::value_type locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EB5230;
  std::locale::~locale(a1 + 2);
  std::basic_regex<char>::value_type locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete(a1);
}

uint64_t std::__match_char_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 8pthread_mutex_init(this, 0) = v3;
  return result;
}

void (__cdecl ***std::__match_char<char>::~__match_char(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__match_char<char>::~__match_char(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

uint64_t std::__match_char<char>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 8pthread_mutex_init(this, 0) = v3;
  return result;
}

std::locale *std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EB52C0;
  std::locale::~locale(a1 + 2);
  std::basic_regex<char>::value_type locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EB52C0;
  std::locale::~locale(a1 + 2);
  std::basic_regex<char>::value_type locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete(a1);
}

uint64_t std::__back_ref_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (*(unsigned char *)(v3 + 16))
  {
    uint64_t v4 = *(void *)(v3 + 8) - *(void *)v3;
    uint64_t v5 = *(void *)(a2 + 16);
    if (*(void *)(a2 + 24) - v5 >= v4)
    {
      uint64_t v7 = result;
      if (v4 < 1)
      {
LABEL_9:
        *(_DWORD *)a2 = -994;
        *(void *)(a2 + 16) = v5 + v4;
        uint64_t v6 = *(void *)(v7 + 8);
        goto LABEL_10;
      }
      uint64_t v8 = 0;
      while (1)
      {
        int v9 = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40))(*(void *)(v7 + 24), *(char *)(*(void *)v3 + v8));
        uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40))(*(void *)(v7 + 24), *(char *)(*(void *)(a2 + 16) + v8));
        if (v9 != result) {
          break;
        }
        if (v4 == ++v8)
        {
          uint64_t v5 = *(void *)(a2 + 16);
          goto LABEL_9;
        }
      }
    }
  }
  uint64_t v6 = 0;
  *(_DWORD *)a2 = -993;
LABEL_10:
  *(void *)(a2 + 8pthread_mutex_init(this, 0) = v6;
  return result;
}

std::locale *std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EB5308;
  std::locale::~locale(a1 + 2);
  std::basic_regex<char>::value_type locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_270EB5308;
  std::locale::~locale(a1 + 2);
  std::basic_regex<char>::value_type locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete(a1);
}

uint64_t std::__back_ref_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(result + 40) - 1;
  uint64_t v3 = *(void *)(a2 + 32);
  if (*(unsigned char *)(v3 + 24 * v2 + 16))
  {
    uint64_t v4 = (unsigned __int8 **)(v3 + 24 * v2);
    uint64_t v5 = *v4;
    uint64_t v6 = v4[1] - *v4;
    uint64_t v7 = *(void *)(a2 + 16);
    if (*(void *)(a2 + 24) - v7 >= v6)
    {
      if (v6 < 1)
      {
LABEL_8:
        *(_DWORD *)a2 = -994;
        *(void *)(a2 + 16) = v7 + v6;
        uint64_t v8 = *(void *)(result + 8);
        goto LABEL_9;
      }
      int v9 = *(unsigned __int8 **)(a2 + 16);
      uint64_t v10 = v6;
      while (1)
      {
        int v12 = *v5++;
        int v11 = v12;
        int v13 = *v9++;
        if (v11 != v13) {
          break;
        }
        if (!--v10) {
          goto LABEL_8;
        }
      }
    }
  }
  uint64_t v8 = 0;
  *(_DWORD *)a2 = -993;
LABEL_9:
  *(void *)(a2 + 8pthread_mutex_init(this, 0) = v8;
  return result;
}

void (__cdecl ***std::__back_ref<char>::~__back_ref(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  unsigned int v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__back_ref<char>::~__back_ref(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  unsigned int v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

unsigned int *std::__back_ref<char>::__exec(unsigned int *result, uint64_t a2)
{
  unint64_t v2 = result[4];
  uint64_t v3 = *(void *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a2 + 40) - v3) >> 3) < v2) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  }
  unsigned int v5 = v2 - 1;
  if (*(unsigned char *)(v3 + 24 * v5 + 16)
    && (uint64_t v6 = result,
        uint64_t v7 = v3 + 24 * v5,
        uint64_t result = *(unsigned int **)v7,
        int64_t v8 = *(void *)(v7 + 8) - *(void *)v7,
        uint64_t v9 = *(void *)(a2 + 16),
        *(void *)(a2 + 24) - v9 >= v8)
    && (uint64_t result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !result))
  {
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 16) = v9 + v8;
    uint64_t v10 = *((void *)v6 + 1);
  }
  else
  {
    uint64_t v10 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(void *)(a2 + 8pthread_mutex_init(this, 0) = v10;
  return result;
}

std::__bracket_expression<char, std::regex_traits<char>> *__cdecl std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(std::basic_regex<char> *this, BOOL __negate)
{
  uint64_t v4 = (std::__bracket_expression<char, std::regex_traits<char>> *)operator new(0xB0uLL);
  std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v4, (uint64_t)this, (uint64_t)this->__end_->__first_, __negate, this->__flags_ & 1, (this->__flags_ & 8) != 0);
  this->__end_->__first_ = v4;
  this->__end_ = v4;
  return v4;
}

void sub_263886B74(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (*(unsigned char *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
    unsigned int v5 = *(unsigned char **)(a1 + 48);
    unint64_t v4 = *(void *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      uint64_t v6 = (unint64_t *)(a1 + 40);
      unint64_t v7 = *(void *)(a1 + 40);
      int64_t v8 = &v5[-v7];
      uint64_t v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        unint64_t v10 = v4 - v7;
        if (2 * v10 > v9) {
          uint64_t v9 = 2 * v10;
        }
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v11 = v9;
        }
        if (v11) {
          int v12 = operator new(v11);
        }
        else {
          int v12 = 0;
        }
        std::vector<std::csub_match>::size_type v20 = &v8[(void)v12];
        std::pair<const char *, const char *> v21 = (char *)v12 + v11;
        v8[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v8[(void)v12 + 1];
        if (v5 != (unsigned char *)v7)
        {
          std::pair<const char *, const char *> v22 = &v5[~v7];
          do
          {
            char v23 = *--v5;
            (v22--)[(void)v12] = v23;
          }
          while (v5 != (unsigned char *)v7);
LABEL_45:
          unsigned int v5 = (unsigned char *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    goto LABEL_22;
  }
  uint64_t v6 = (unint64_t *)(a1 + 40);
  unsigned int v5 = *(unsigned char **)(a1 + 48);
  unint64_t v13 = *(void *)(a1 + 56);
  if (!*(unsigned char *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      unint64_t v24 = *v6;
      char v25 = &v5[-*v6];
      unint64_t v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        unint64_t v27 = v13 - v24;
        if (2 * v27 > v26) {
          unint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v28 = v26;
        }
        if (v28) {
          int v12 = operator new(v28);
        }
        else {
          int v12 = 0;
        }
        std::vector<std::csub_match>::size_type v20 = &v25[(void)v12];
        std::pair<const char *, const char *> v21 = (char *)v12 + v28;
        v25[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v25[(void)v12 + 1];
        if (v5 != (unsigned char *)v24)
        {
          unsigned int v31 = &v5[~v24];
          do
          {
            char v32 = *--v5;
            (v31--)[(void)v12] = v32;
          }
          while (v5 != (unsigned char *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *unsigned int v5 = v2;
    uint64_t v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13) {
    goto LABEL_22;
  }
  unint64_t v14 = *v6;
  char v15 = &v5[-*v6];
  unint64_t v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0) {
    goto LABEL_50;
  }
  unint64_t v17 = v13 - v14;
  if (2 * v17 > v16) {
    unint64_t v16 = 2 * v17;
  }
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v18 = v16;
  }
  if (v18) {
    int v12 = operator new(v18);
  }
  else {
    int v12 = 0;
  }
  std::vector<std::csub_match>::size_type v20 = &v15[(void)v12];
  std::pair<const char *, const char *> v21 = (char *)v12 + v18;
  v15[(void)v12] = v2;
  uint64_t v19 = (uint64_t)&v15[(void)v12 + 1];
  if (v5 != (unsigned char *)v14)
  {
    unint64_t v29 = &v5[~v14];
    do
    {
      char v30 = *--v5;
      (v29--)[(void)v12] = v30;
    }
    while (v5 != (unsigned char *)v14);
    goto LABEL_45;
  }
LABEL_46:
  int v12 = v20;
LABEL_47:
  *(void *)(a1 + 4pthread_mutex_init(this, 0) = v12;
  *(void *)(a1 + 48) = v19;
  *(void *)(a1 + 56) = v21;
  if (v5) {
    operator delete(v5);
  }
LABEL_49:
  *(void *)(a1 + 48) = v19;
}

uint64_t std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  *(void *)(a1 + 8) = a3;
  size_t v11 = (const std::locale *)(a1 + 16);
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 4pthread_mutex_init(this, 0) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 12pthread_mutex_init(this, 0) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(unsigned char *)(a1 + 168) = a4;
  *(unsigned char *)(a1 + 169) = a5;
  *(unsigned char *)(a1 + 17pthread_mutex_init(this, 0) = a6;
  std::locale::locale(&v14, v11);
  std::locale::name(&v15, &v14);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
  {
    BOOL v12 = v15.__r_.__value_.__l.__size_ != 1 || *v15.__r_.__value_.__l.__data_ != 67;
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  else
  {
    BOOL v12 = SHIBYTE(v15.__r_.__value_.__r.__words[2]) != 1 || v15.__r_.__value_.__s.__data_[0] != 67;
  }
  std::locale::~locale(&v14);
  *(unsigned char *)(a1 + 171) = v12;
  return a1;
}

void sub_263886F18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  std::locale::~locale((std::locale *)&a9);
  a10 = v10 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  std::string v15 = (void *)v10[14];
  if (v15)
  {
    v10[15] = v15;
    operator delete(v15);
  }
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  unint64_t v16 = (void *)v10[8];
  if (v16)
  {
    v10[9] = v16;
    operator delete(v16);
  }
  unint64_t v17 = *v13;
  if (*v13)
  {
    v10[6] = v17;
    operator delete(v17);
  }
  std::locale::~locale(v12);
  *unint64_t v10 = v11;
  uint64_t v18 = v10[1];
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  }
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  uint64_t v1 = std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(a1);

  operator delete(v1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__exec(const std::__bracket_expression<char, std::regex_traits<char>> *this, std::__bracket_expression<char, std::regex_traits<char>>::__state *a2)
{
  current = a2->__current_;
  last = a2->__last_;
  if (current == last)
  {
    uint64_t v37 = 0;
    BOOL negate = this->__negate_;
    goto LABEL_221;
  }
  if (!this->__might_have_digraph_ || current + 1 == last) {
    goto LABEL_58;
  }
  signed __int8 v6 = *current;
  unsigned __int8 v125 = *current;
  signed __int8 v7 = current[1];
  unsigned __int8 v126 = v7;
  if (this->__icase_)
  {
    unsigned __int8 v125 = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v6);
    unsigned __int8 v126 = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v7);
  }
  p_traits = &this->__traits_;
  std::regex_traits<char>::__lookup_collatename<char *>((uint64_t)&this->__traits_, (char *)&v125, (char *)&v127, (uint64_t)&__p);
  if ((v124 & 0x80000000) == 0)
  {
    if (v124) {
      goto LABEL_8;
    }
LABEL_58:
    BOOL negate = 0;
    uint64_t v37 = 1;
    goto LABEL_59;
  }
  size_t v38 = v123;
  operator delete(__p);
  if (!v38) {
    goto LABEL_58;
  }
LABEL_8:
  std::vector<std::pair<char, char>>::pointer begin = this->__digraphs_.__begin_;
  uint64_t v10 = (char *)this->__digraphs_.__end_ - (char *)begin;
  if (v10)
  {
    uint64_t v11 = v10 >> 1;
    if ((unint64_t)(v10 >> 1) <= 1) {
      uint64_t v11 = 1;
    }
    p_second = &begin->second;
    do
    {
      if (v125 == *(p_second - 1) && v126 == *p_second) {
        goto LABEL_218;
      }
      p_second += 2;
      --v11;
    }
    while (v11);
  }
  if (!this->__collate_ || this->__ranges_.__begin_ == this->__ranges_.__end_)
  {
    BOOL negate = 0;
  }
  else
  {
    std::regex_traits<char>::transform<char *>((uint64_t)&this->__traits_, (char *)&v125, (char *)&v127);
    std::vector<std::pair<std::string, std::string>>::pointer v14 = this->__ranges_.__begin_;
    char v15 = v124;
    int64_t v16 = (char *)this->__ranges_.__end_ - (char *)v14;
    if (v16)
    {
      uint64_t v17 = 0;
      unint64_t v18 = v16 / 48;
      char v113 = v124;
      if (v124 >= 0) {
        size_t v19 = v124;
      }
      else {
        size_t v19 = v123;
      }
      if (v124 >= 0) {
        p_p = &__p;
      }
      else {
        p_p = __p;
      }
      if (v18 <= 1) {
        uint64_t v21 = 1;
      }
      else {
        uint64_t v21 = v16 / 48;
      }
      BOOL v22 = 1;
      while (1)
      {
        int v23 = SHIBYTE(v14->first.__r_.__value_.__r.__words[2]);
        if (v23 >= 0) {
          size_t size = HIBYTE(v14->first.__r_.__value_.__r.__words[2]);
        }
        else {
          size_t size = v14->first.__r_.__value_.__l.__size_;
        }
        if (v23 >= 0) {
          std::vector<std::pair<std::string, std::string>>::pointer v25 = v14;
        }
        else {
          std::vector<std::pair<std::string, std::string>>::pointer v25 = (std::vector<std::pair<std::string, std::string>>::pointer)v14->first.__r_.__value_.__r.__words[0];
        }
        if (size >= v19) {
          size_t v26 = v19;
        }
        else {
          size_t v26 = size;
        }
        int v27 = memcmp(p_p, v25, v26);
        BOOL v28 = v19 >= size;
        if (v27) {
          BOOL v28 = v27 >= 0;
        }
        if (v28)
        {
          int v29 = SHIBYTE(v14->second.__r_.__value_.__r.__words[2]);
          if (v29 >= 0) {
            size_t v30 = HIBYTE(v14->second.__r_.__value_.__r.__words[2]);
          }
          else {
            size_t v30 = v14->second.__r_.__value_.__l.__size_;
          }
          if (v29 >= 0) {
            data = &v14->second;
          }
          else {
            data = (std::string *)v14->second.__r_.__value_.__l.__data_;
          }
          if (v19 >= v30) {
            size_t v32 = v30;
          }
          else {
            size_t v32 = v19;
          }
          int v33 = memcmp(data, p_p, v32);
          BOOL v34 = v30 >= v19;
          if (v33) {
            BOOL v34 = v33 >= 0;
          }
          if (v34) {
            break;
          }
        }
        BOOL v22 = ++v17 < v18;
        ++v14;
        if (v21 == v17)
        {
          int v35 = 0;
          BOOL negate = 0;
          goto LABEL_162;
        }
      }
      BOOL negate = 1;
      int v35 = 5;
LABEL_162:
      p_traits = &this->__traits_;
      char v15 = v113;
    }
    else
    {
      BOOL v22 = 0;
      int v35 = 0;
      BOOL negate = 0;
    }
    if (v15 < 0) {
      operator delete(__p);
    }
    if (v22) {
      goto LABEL_195;
    }
  }
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_) {
    goto LABEL_200;
  }
  std::regex_traits<char>::__transform_primary<char *>((uint64_t)p_traits, (char *)&v125, (char *)&v127, (uint64_t)&__p);
  std::vector<std::string>::pointer v89 = this->__equivalences_.__begin_;
  uint64_t v90 = v124;
  int64_t v91 = (char *)this->__equivalences_.__end_ - (char *)v89;
  if (v91)
  {
    uint64_t v92 = 0;
    unint64_t v93 = v91 / 24;
    CFIndex v95 = __p;
    size_t v94 = v123;
    if (v124 >= 0) {
      size_t v96 = v124;
    }
    else {
      size_t v96 = v123;
    }
    if (v93 <= 1) {
      uint64_t v97 = 1;
    }
    else {
      uint64_t v97 = v91 / 24;
    }
    BOOL v98 = 1;
    while (1)
    {
      uint64_t v99 = &v89[v92];
      std::string::size_type v100 = HIBYTE(v99->__r_.__value_.__r.__words[2]);
      int v101 = (char)v100;
      if ((v100 & 0x80u) != 0) {
        std::string::size_type v100 = v99->__r_.__value_.__l.__size_;
      }
      if (v96 == v100)
      {
        if (v101 >= 0) {
          uint64_t v102 = &v89[v92];
        }
        else {
          uint64_t v102 = (std::string *)v99->__r_.__value_.__r.__words[0];
        }
        if ((v90 & 0x80) == 0)
        {
          if (v90)
          {
            uint64_t v103 = &__p;
            uint64_t v104 = v90;
            do
            {
              if (*(unsigned __int8 *)v103 != v102->__r_.__value_.__s.__data_[0]) {
                goto LABEL_188;
              }
              uint64_t v103 = (void **)((char *)v103 + 1);
              uint64_t v102 = (std::string *)((char *)v102 + 1);
              --v104;
            }
            while (v104);
            BOOL negate = 1;
            int v35 = 5;
            goto LABEL_192;
          }
          BOOL negate = 1;
          if (v98) {
            goto LABEL_220;
          }
LABEL_200:
          if ((char)v125 < 0)
          {
            neg_std::regex_traits<char>::char_class_type mask = this->__neg_mask_;
            goto LABEL_213;
          }
          std::regex_traits<char>::char_class_type mask = this->__mask_;
          tab = this->__traits_.__ct_->__tab_;
          std::ctype_base::mask v108 = tab[v125];
          if ((v108 & mask) == 0 && (v125 != 95 || (mask & 0x80) == 0)
            || (char)v126 < 0
            || (tab[v126] & mask) == 0 && ((mask & 0x80) == 0 || v126 != 95))
          {
            neg_std::regex_traits<char>::char_class_type mask = this->__neg_mask_;
            if ((v108 & neg_mask) != 0 || v125 == 95 && (neg_mask & 0x80) != 0)
            {
LABEL_217:
              int v110 = negate;
              goto LABEL_219;
            }
LABEL_213:
            if (((char)v126 & 0x80000000) == 0)
            {
              if ((this->__traits_.__ct_->__tab_[v126] & neg_mask) != 0) {
                goto LABEL_217;
              }
              int v110 = 1;
              if (v126 == 95 && (neg_mask & 0x80) != 0) {
                goto LABEL_217;
              }
LABEL_219:
              BOOL negate = v110;
LABEL_220:
              uint64_t v37 = 2;
              goto LABEL_221;
            }
          }
LABEL_218:
          int v110 = 1;
          goto LABEL_219;
        }
        unint64_t v118 = v93;
        uint64_t v121 = v90;
        int v105 = memcmp(v95, v102, v94);
        unint64_t v93 = v118;
        uint64_t v90 = v121;
        if (!v105) {
          break;
        }
      }
LABEL_188:
      BOOL v98 = ++v92 < v93;
      if (v92 == v97) {
        goto LABEL_191;
      }
    }
    int v35 = 5;
    BOOL negate = 1;
    goto LABEL_193;
  }
  BOOL v98 = 0;
LABEL_191:
  int v35 = 0;
LABEL_192:
  if ((v90 & 0x80) != 0) {
LABEL_193:
  }
    operator delete(__p);
  if (!v98) {
    goto LABEL_200;
  }
LABEL_195:
  if (v35) {
    goto LABEL_220;
  }
  uint64_t v37 = 2;
LABEL_59:
  unsigned __int8 v39 = *a2->__current_;
  unsigned __int8 v125 = v39;
  if (this->__icase_)
  {
    unsigned __int8 v39 = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, (char)v39);
    unsigned __int8 v125 = v39;
  }
  std::vector<char>::pointer v40 = this->__chars_.__begin_;
  unint64_t v41 = this->__chars_.__end_ - v40;
  if (v41)
  {
    if (v41 <= 1) {
      unint64_t v41 = 1;
    }
    while (1)
    {
      int v42 = *v40++;
      if (v42 == v39) {
        break;
      }
      if (!--v41) {
        goto LABEL_66;
      }
    }
LABEL_77:
    BOOL negate = 1;
    goto LABEL_221;
  }
LABEL_66:
  std::regex_traits<char>::char_class_type v43 = this->__neg_mask_;
  if (v43 || this->__neg_chars_.__begin_ != this->__neg_chars_.__end_)
  {
    if ((v39 & 0x80) != 0 || (this->__traits_.__ct_->__tab_[v39] & v43) == 0) {
      int v44 = (v39 == 95) & (v43 >> 7);
    }
    else {
      LOBYTE(v44) = 1;
    }
    std::vector<char>::pointer end = this->__neg_chars_.__end_;
    std::vector<char>::pointer v46 = (std::vector<char>::pointer)memchr(this->__neg_chars_.__begin_, (char)v39, end - this->__neg_chars_.__begin_);
    int v47 = v46 ? v46 : end;
    if ((v44 & 1) == 0 && v47 == end) {
      goto LABEL_77;
    }
  }
  std::vector<std::pair<std::string, std::string>>::pointer v49 = this->__ranges_.__begin_;
  std::vector<std::pair<std::string, std::string>>::pointer v48 = this->__ranges_.__end_;
  if (v49 != v48)
  {
    if (this->__collate_)
    {
      std::regex_traits<char>::transform<char *>((uint64_t)&this->__traits_, (char *)&v125, (char *)&v126);
      std::vector<std::pair<std::string, std::string>>::pointer v49 = this->__ranges_.__begin_;
      std::vector<std::pair<std::string, std::string>>::pointer v48 = this->__ranges_.__end_;
    }
    else
    {
      char v124 = 1;
      LOWORD(__p) = v39;
    }
    int64_t v50 = (char *)v48 - (char *)v49;
    if (v50)
    {
      uint64_t v119 = v37;
      BOOL v116 = negate;
      uint64_t v51 = 0;
      unint64_t v52 = v50 / 48;
      char v114 = v124;
      if (v124 >= 0) {
        size_t v53 = v124;
      }
      else {
        size_t v53 = v123;
      }
      if (v124 >= 0) {
        uint64_t v54 = &__p;
      }
      else {
        uint64_t v54 = __p;
      }
      if (v52 <= 1) {
        uint64_t v55 = 1;
      }
      else {
        uint64_t v55 = v50 / 48;
      }
      BOOL v56 = 1;
      while (1)
      {
        int v57 = SHIBYTE(v49->first.__r_.__value_.__r.__words[2]);
        if (v57 >= 0) {
          size_t v58 = HIBYTE(v49->first.__r_.__value_.__r.__words[2]);
        }
        else {
          size_t v58 = v49->first.__r_.__value_.__l.__size_;
        }
        if (v57 >= 0) {
          std::vector<std::pair<std::string, std::string>>::pointer v59 = v49;
        }
        else {
          std::vector<std::pair<std::string, std::string>>::pointer v59 = (std::vector<std::pair<std::string, std::string>>::pointer)v49->first.__r_.__value_.__r.__words[0];
        }
        if (v58 >= v53) {
          size_t v60 = v53;
        }
        else {
          size_t v60 = v58;
        }
        int v61 = memcmp(v54, v59, v60);
        BOOL v62 = v53 >= v58;
        if (v61) {
          BOOL v62 = v61 >= 0;
        }
        if (v62)
        {
          int v63 = SHIBYTE(v49->second.__r_.__value_.__r.__words[2]);
          if (v63 >= 0) {
            size_t v64 = HIBYTE(v49->second.__r_.__value_.__r.__words[2]);
          }
          else {
            size_t v64 = v49->second.__r_.__value_.__l.__size_;
          }
          if (v63 >= 0) {
            uint64_t v65 = &v49->second;
          }
          else {
            uint64_t v65 = (std::string *)v49->second.__r_.__value_.__l.__data_;
          }
          if (v53 >= v64) {
            size_t v66 = v64;
          }
          else {
            size_t v66 = v53;
          }
          int v67 = memcmp(v65, v54, v66);
          BOOL v68 = v64 >= v53;
          if (v67) {
            BOOL v68 = v67 >= 0;
          }
          if (v68) {
            break;
          }
        }
        BOOL v56 = ++v51 < v52;
        ++v49;
        if (v55 == v51)
        {
          BOOL negate = v116;
          goto LABEL_123;
        }
      }
      BOOL negate = 1;
LABEL_123:
      uint64_t v37 = v119;
      if ((v114 & 0x80) == 0) {
        goto LABEL_125;
      }
    }
    else
    {
      BOOL v56 = 0;
      if ((v124 & 0x80) == 0) {
        goto LABEL_125;
      }
    }
    operator delete(__p);
LABEL_125:
    if (v56) {
      goto LABEL_221;
    }
  }
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_) {
    goto LABEL_154;
  }
  std::regex_traits<char>::__transform_primary<char *>((uint64_t)&this->__traits_, (char *)&v125, (char *)&v126, (uint64_t)&__p);
  std::vector<std::string>::pointer v69 = this->__equivalences_.__begin_;
  uint64_t v70 = v124;
  int64_t v71 = (char *)this->__equivalences_.__end_ - (char *)v69;
  if (v71)
  {
    uint64_t v120 = v37;
    uint64_t v72 = 0;
    unint64_t v73 = v71 / 24;
    uint64_t v74 = __p;
    size_t v75 = v123;
    if (v124 >= 0) {
      size_t v76 = v124;
    }
    else {
      size_t v76 = v123;
    }
    if (v73 <= 1) {
      uint64_t v77 = 1;
    }
    else {
      uint64_t v77 = v71 / 24;
    }
    BOOL v78 = 1;
    while (1)
    {
      uint64_t v79 = &v69[v72];
      std::string::size_type v80 = HIBYTE(v79->__r_.__value_.__r.__words[2]);
      int v81 = (char)v80;
      if ((v80 & 0x80u) != 0) {
        std::string::size_type v80 = v79->__r_.__value_.__l.__size_;
      }
      if (v76 == v80)
      {
        if (v81 >= 0) {
          uint64_t v82 = &v69[v72];
        }
        else {
          uint64_t v82 = (std::string *)v79->__r_.__value_.__r.__words[0];
        }
        if ((v70 & 0x80) != 0)
        {
          BOOL v117 = negate;
          unint64_t v85 = v73;
          uint64_t v115 = v77;
          int v86 = memcmp(v74, v82, v75);
          uint64_t v77 = v115;
          unint64_t v73 = v85;
          BOOL negate = v117;
          if (!v86)
          {
            BOOL negate = 1;
            uint64_t v37 = v120;
            goto LABEL_152;
          }
        }
        else
        {
          if (!v70)
          {
            BOOL negate = 1;
            uint64_t v37 = v120;
            if (!v78) {
              goto LABEL_154;
            }
            goto LABEL_221;
          }
          uint64_t v83 = &__p;
          uint64_t v84 = v70;
          while (*(unsigned __int8 *)v83 == v82->__r_.__value_.__s.__data_[0])
          {
            uint64_t v83 = (void **)((char *)v83 + 1);
            uint64_t v82 = (std::string *)((char *)v82 + 1);
            if (!--v84)
            {
              BOOL negate = 1;
              goto LABEL_149;
            }
          }
        }
      }
      BOOL v78 = ++v72 < v73;
      if (v72 == v77)
      {
LABEL_149:
        uint64_t v37 = v120;
        if ((v70 & 0x80) == 0) {
          goto LABEL_153;
        }
        goto LABEL_152;
      }
    }
  }
  BOOL v78 = 0;
  if (v124 < 0) {
LABEL_152:
  }
    operator delete(__p);
LABEL_153:
  if (!v78)
  {
LABEL_154:
    if ((char)v125 < 0) {
      goto LABEL_221;
    }
    std::regex_traits<char>::char_class_type v87 = this->__mask_;
    if ((this->__traits_.__ct_->__tab_[v125] & v87) == 0)
    {
      int v88 = (v87 >> 7) & 1;
      if (v125 != 95) {
        int v88 = 0;
      }
      if (v88 != 1) {
        goto LABEL_221;
      }
    }
    goto LABEL_77;
  }
LABEL_221:
  if (negate == this->__negate_)
  {
    first = 0;
    int v112 = -993;
  }
  else
  {
    a2->__current_ += v37;
    first = this->__first_;
    int v112 = -995;
  }
  a2->__do_ = v112;
  a2->__node_ = first;
}

void std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  char v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unsigned int v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        std::allocator<std::pair<std::string,std::string>>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      unsigned int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::allocator<std::pair<std::string,std::string>>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 47) < 0) {
    operator delete(*(void **)(a2 + 24));
  }
  if (*(char *)(a2 + 23) < 0)
  {
    uint64_t v3 = *(void **)a2;
    operator delete(v3);
  }
}

uint64_t std::pair<std::string,std::string>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

std::locale *std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  signed __int8 v7 = a1 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  std::basic_regex<char>::value_type locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  signed __int8 v7 = a1 + 11;
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  uint64_t v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  uint64_t v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  unsigned int v5 = a1[1].__locale_;
  if (v5) {
    (*(void (**)(std::locale::__imp *))(*(void *)v5 + 8))(v5);
  }
  return a1;
}

void std::regex_traits<char>::transform<char *>(uint64_t a1, char *a2, char *a3)
{
  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a2, a3, a3 - a2);
  unint64_t v4 = v7;
  if ((v7 & 0x80u) == 0) {
    unsigned int v5 = __p;
  }
  else {
    unsigned int v5 = (void **)__p[0];
  }
  if ((v7 & 0x80u) != 0) {
    unint64_t v4 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0) {
    operator delete(__p[0]);
  }
}

void sub_263887B98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::__lookup_collatename<char *>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  std::string::__init_with_size[abi:ne180100]<char *,char *>(&__s, a2, a3, a3 - a2);
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_) {
      goto LABEL_9;
    }
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((unsigned char *)&__s.__r_.__value_.__s + 23)) {
      return;
    }
    p_s = &__s;
  }
  std::__get_collation_name(&v11, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v11.__r_.__value_.__l.__data_;
  unint64_t v7 = v11.__r_.__value_.__r.__words[2];
  *(void *)(a4 + 16) = *((void *)&v11.__r_.__value_.__l + 2);
  unint64_t v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0) {
    unint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8) {
    goto LABEL_9;
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (__s.__r_.__value_.__l.__size_ >= 3) {
      goto LABEL_9;
    }
  }
  else if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
  {
    return;
  }
  (*(void (**)(std::string *__return_ptr))(**(void **)(a1 + 16) + 32))(&v11);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(std::string *)a4 = v11;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    int v9 = *(unsigned __int8 *)(a4 + 23);
    if (v9 != 12 && v9 != 1)
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_23;
  }
  uint64_t v10 = *(void *)(a4 + 8);
  if (v10 == 1 || v10 == 12)
  {
LABEL_23:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(unsigned char **)a4 = 0;
  *(void *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
}

void sub_263887D30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0) {
    operator delete(*(void **)v17);
  }
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::__init_with_size[abi:ne180100]<char *,char *>(void *result, char *a2, char *a3, unint64_t a4)
{
  unint64_t v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a4 > 0x16)
  {
    uint64_t v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17) {
      uint64_t v8 = a4 | 7;
    }
    uint64_t v9 = v8 + 1;
    uint64_t result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *unint64_t v4 = result;
    unint64_t v4 = result;
  }
  else
  {
    *((unsigned char *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    char v10 = *a2++;
    *(unsigned char *)unint64_t v4 = v10;
    unint64_t v4 = (void *)((char *)v4 + 1);
  }
  *(unsigned char *)unint64_t v4 = 0;
  return result;
}

void std::regex_traits<char>::__transform_primary<char *>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a2, a3, a3 - a2);
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    unint64_t v7 = __p;
  }
  else {
    unint64_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v7, (char *)v7 + v6);
  uint64_t v8 = *(unsigned __int8 *)(a4 + 23);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0) {
        char v10 = (unsigned char *)a4;
      }
      else {
        char v10 = *(unsigned char **)a4;
      }
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(unsigned char **)a4 = 0;
      *(void *)(a4 + 8) = 0;
    }
    else
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
}

void sub_263887F00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E6C7C0](exception, 5);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_263887F60(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_expression_term<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  unint64_t v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  int v5 = *a2;
  if (v5 == 93) {
    return v4;
  }
  uint64_t v6 = (uint64_t)a4;
  memset(&v26, 0, sizeof(v26));
  if (a2 + 1 == a3 || v5 != 91)
  {
LABEL_9:
    int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
    goto LABEL_10;
  }
  int v9 = a2[1];
  if (v9 != 46)
  {
    if (v9 == 58)
    {
      char v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_class<std::__wrap_iter<char const*>>(a1, a2 + 2, a3, (uint64_t)a4);
      goto LABEL_38;
    }
    if (v9 == 61)
    {
      char v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_equivalence_class<std::__wrap_iter<char const*>>(a1, a2 + 2, a3, a4);
LABEL_38:
      uint64_t v6 = (uint64_t)v10;
      char v21 = 0;
      goto LABEL_42;
    }
    goto LABEL_9;
  }
  size_t v19 = std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<std::__wrap_iter<char const*>>(a1, a2 + 2, a3, (uint64_t)&v26);
  unint64_t v4 = v19;
  int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  std::string::size_type size = HIBYTE(v26.__r_.__value_.__r.__words[2]);
  if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v26.__r_.__value_.__l.__size_;
  }
  std::vector<std::pair<std::string, std::string>>::pointer v14 = v19;
  if (!size)
  {
LABEL_10:
    if ((v11 | 0x40) == 0x40)
    {
      int v12 = *v4;
      if (v12 == 92)
      {
        unint64_t v13 = v4 + 1;
        if (v11)
        {
          std::vector<std::pair<std::string, std::string>>::pointer v14 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v13, a3, &v26);
        }
        else
        {
          std::vector<std::pair<std::string, std::string>>::pointer v14 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (std::basic_regex<char> *)v13, (std::basic_regex<char> *)a3, &v26, v6);
          int v11 = 0;
        }
        goto LABEL_16;
      }
    }
    else
    {
      LOBYTE(v12) = *v4;
    }
    std::string::operator=(&v26, v12);
    std::vector<std::pair<std::string, std::string>>::pointer v14 = v4 + 1;
  }
LABEL_16:
  if (v14 == a3
    || (int v15 = *v14, v15 == 93)
    || (uint64_t v17 = v14 + 1, v14 + 1 == a3)
    || v15 != 45
    || *v17 == 93)
  {
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    {
      if (v26.__r_.__value_.__l.__size_)
      {
        if (v26.__r_.__value_.__l.__size_ != 1)
        {
          int64_t v16 = (std::string *)v26.__r_.__value_.__r.__words[0];
LABEL_40:
          std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](v6, v16->__r_.__value_.__s.__data_[0], v16->__r_.__value_.__s.__data_[1]);
          goto LABEL_41;
        }
        int64_t v16 = (std::string *)v26.__r_.__value_.__r.__words[0];
        goto LABEL_25;
      }
    }
    else if (*((unsigned char *)&v26.__r_.__value_.__s + 23))
    {
      int64_t v16 = &v26;
      if (HIBYTE(v26.__r_.__value_.__r.__words[2]) != 1) {
        goto LABEL_40;
      }
LABEL_25:
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](v6, v16->__r_.__value_.__s.__data_[0]);
    }
LABEL_41:
    char v21 = 1;
    unint64_t v4 = v14;
    goto LABEL_42;
  }
  memset(&v25, 0, sizeof(v25));
  unint64_t v4 = v14 + 2;
  if (v14 + 2 != a3 && *v17 == 91 && *v4 == 46)
  {
    unint64_t v18 = std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<std::__wrap_iter<char const*>>(a1, v14 + 3, a3, (uint64_t)&v25);
LABEL_55:
    unint64_t v4 = v18;
    goto LABEL_56;
  }
  if ((v11 | 0x40) == 0x40)
  {
    LODWORD(v17) = *v17;
    if (v17 == 92)
    {
      if (v11) {
        unint64_t v18 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v14 + 2, a3, &v25);
      }
      else {
        unint64_t v18 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (std::basic_regex<char> *)(v14 + 2), (std::basic_regex<char> *)a3, &v25, v6);
      }
      goto LABEL_55;
    }
  }
  else
  {
    LOBYTE(v17) = *v17;
  }
  std::string::operator=(&v25, (std::string::value_type)v17);
LABEL_56:
  std::string v24 = v26;
  memset(&v26, 0, sizeof(v26));
  std::string __p = v25;
  memset(&v25, 0, sizeof(v25));
  std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100](v6, (char *)&v24, (char *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v25.__r_.__value_.__l.__data_);
  }
  char v21 = 1;
LABEL_42:
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
  if (v21) {
    return v4;
  }
  return (char *)v6;
}

void sub_2638882C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v28 - 49) < 0) {
    operator delete(*(void **)(v28 - 72));
  }
  _Unwind_Resume(exception_object);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_equivalence_class<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_33;
  }
  uint64_t v6 = a3 - 2;
  unint64_t v7 = a2;
  uint64_t v8 = a2;
  for (i = a2; ; uint64_t v8 = i)
  {
    int v10 = *i++;
    if (v10 == 61 && *i == 93) {
      break;
    }
    if (a2 == v6) {
      goto LABEL_33;
    }
    ++v7;
    --v6;
  }
  if (v8 == a3) {
LABEL_33:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>(a1, a2, v7, (uint64_t)&v20);
  if (((char)v22 & 0x80000000) == 0)
  {
    uint64_t v11 = v22;
    if (v22)
    {
      int v12 = (char *)&v20;
      goto LABEL_14;
    }
LABEL_34:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  }
  uint64_t v11 = v21;
  if (!v21) {
    goto LABEL_34;
  }
  int v12 = (char *)v20;
LABEL_14:
  std::regex_traits<char>::__transform_primary<std::__wrap_iter<char *>>(a1, v12, &v12[v11], (uint64_t)__p);
  unint64_t v13 = v19;
  if ((v19 & 0x80u) != 0) {
    unint64_t v13 = (unint64_t)__p[1];
  }
  if (v13)
  {
    std::__bracket_expression<char,std::regex_traits<char>>::__add_equivalence[abi:ne180100](a4, (long long *)__p);
  }
  else
  {
    uint64_t v14 = v22;
    if ((v22 & 0x80u) != 0) {
      uint64_t v14 = v21;
    }
    if (v14 == 2)
    {
      int64_t v16 = (char *)&v20;
      if ((v22 & 0x80u) != 0) {
        int64_t v16 = (char *)v20;
      }
      std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)a4, *v16, v16[1]);
    }
    else
    {
      if (v14 != 1) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
      }
      int v15 = (char *)&v20;
      if ((v22 & 0x80u) != 0) {
        int v15 = (char *)v20;
      }
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)a4, *v15);
    }
  }
  if ((char)v19 < 0) {
    operator delete(__p[0]);
  }
  if ((char)v22 < 0) {
    operator delete(v20);
  }
  return v7 + 2;
}

void sub_2638884E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_character_class<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_11;
  }
  int v5 = a3 - 2;
  uint64_t v6 = a2;
  unint64_t v7 = a2;
  for (i = a2; ; unint64_t v7 = i)
  {
    int v9 = *i++;
    if (v9 == 58 && *i == 93) {
      break;
    }
    if (a2 == v5) {
      goto LABEL_11;
    }
    ++v6;
    --v5;
  }
  if (v7 == a3) {
LABEL_11:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  int v10 = std::regex_traits<char>::__lookup_classname<std::__wrap_iter<char const*>>(a1, a2, v6, *(_DWORD *)(a1 + 24) & 1);
  if (!v10) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>();
  }
  *(_DWORD *)(a4 + 160) |= v10;
  return v6 + 2;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_15;
  }
  int v5 = a3 - 2;
  uint64_t v6 = a2;
  unint64_t v7 = a2;
  for (i = a2; ; unint64_t v7 = i)
  {
    int v9 = *i++;
    if (v9 == 46 && *i == 93) {
      break;
    }
    if (a2 == v5) {
      goto LABEL_15;
    }
    ++v6;
    --v5;
  }
  if (v7 == a3) {
LABEL_15:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>(a1, a2, v6, (uint64_t)&v13);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(_OWORD *)a4 = v13;
  unint64_t v10 = v14;
  *(void *)(a4 + 16) = v14;
  unint64_t v11 = HIBYTE(v10);
  if ((v11 & 0x80u) != 0) {
    unint64_t v11 = *(void *)(a4 + 8);
  }
  if (v11 - 1 >= 2) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  }
  return v6 + 2;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::string *a4, uint64_t a5)
{
  if (this == a3) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  }
  int locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low > 97)
  {
    if (locale_low > 114)
    {
      if (locale_low != 115)
      {
        if (locale_low != 119) {
          return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, this, a3, a4);
        }
        *(_DWORD *)(a5 + 160) |= 0x500u;
        std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a5, 95);
        return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      }
      int v8 = *(_DWORD *)(a5 + 160) | 0x4000;
    }
    else
    {
      if (locale_low == 98)
      {
        unint64_t v10 = a4;
        std::string::value_type v9 = 8;
LABEL_19:
        std::string::operator=(v10, v9);
        return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      }
      if (locale_low != 100) {
        return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, this, a3, a4);
      }
      int v8 = *(_DWORD *)(a5 + 160) | 0x400;
    }
    *(_DWORD *)(a5 + 16pthread_mutex_init(this, 0) = v8;
    return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
  }
  if (locale_low <= 82)
  {
    if (LOBYTE(this->__traits_.__loc_.__locale_))
    {
      if (locale_low == 68)
      {
        int v7 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_21:
        *(_DWORD *)(a5 + 164) = v7;
        return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      }
      return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, this, a3, a4);
    }
    std::string::value_type v9 = 0;
    unint64_t v10 = a4;
    goto LABEL_19;
  }
  if (locale_low == 83)
  {
    int v7 = *(_DWORD *)(a5 + 164) | 0x4000;
    goto LABEL_21;
  }
  if (locale_low == 87)
  {
    *(_DWORD *)(a5 + 164) |= 0x500u;
    std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](a5, 95);
    return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
  }
  return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, this, a3, a4);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, char *a2, char *a3, std::string *this)
{
  if (a2 == a3) {
LABEL_52:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  int v5 = *a2;
  if (v5 > 97)
  {
    switch(v5)
    {
      case 'n':
        if (this)
        {
          uint64_t v6 = this;
          LOBYTE(v5) = 10;
          goto LABEL_16;
        }
        LOBYTE(v5) = 10;
        goto LABEL_49;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_21;
      case 'r':
        if (this)
        {
          uint64_t v6 = this;
          LOBYTE(v5) = 13;
          goto LABEL_16;
        }
        LOBYTE(v5) = 13;
        goto LABEL_49;
      case 't':
        if (this)
        {
          uint64_t v6 = this;
          LOBYTE(v5) = 9;
          goto LABEL_16;
        }
        LOBYTE(v5) = 9;
        goto LABEL_49;
      case 'v':
        if (this)
        {
          uint64_t v6 = this;
          LOBYTE(v5) = 11;
          goto LABEL_16;
        }
        LOBYTE(v5) = 11;
        goto LABEL_49;
      default:
        if (v5 == 98)
        {
          if (this)
          {
            uint64_t v6 = this;
            LOBYTE(v5) = 8;
            goto LABEL_16;
          }
          LOBYTE(v5) = 8;
        }
        else
        {
          if (v5 != 102) {
            goto LABEL_21;
          }
          if (this)
          {
            uint64_t v6 = this;
            LOBYTE(v5) = 12;
            goto LABEL_16;
          }
          LOBYTE(v5) = 12;
        }
        break;
    }
    goto LABEL_49;
  }
  if (v5 > 91)
  {
    if (v5 != 92)
    {
      if (v5 != 97) {
        goto LABEL_21;
      }
      if (this)
      {
        uint64_t v6 = this;
        LOBYTE(v5) = 7;
LABEL_16:
        std::string::operator=(v6, v5);
        return a2 + 1;
      }
      LOBYTE(v5) = 7;
LABEL_49:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v5);
      return a2 + 1;
    }
LABEL_14:
    if (this)
    {
      uint64_t v6 = this;
      goto LABEL_16;
    }
    goto LABEL_49;
  }
  if (v5 == 34 || v5 == 47) {
    goto LABEL_14;
  }
LABEL_21:
  if ((v5 & 0xFFFFFFF8) != 0x30) {
    goto LABEL_52;
  }
  std::string::value_type v7 = v5 - 48;
  int v8 = a2 + 1;
  if (a2 + 1 != a3)
  {
    if ((*v8 & 0xF8) != 0x30) {
      goto LABEL_39;
    }
    std::string::value_type v7 = *v8 + 8 * v7 - 48;
    if (a2 + 2 != a3)
    {
      char v9 = a2[2];
      int v10 = v9 & 0xF8;
      std::string::value_type v11 = v9 + 8 * v7 - 48;
      if (v10 == 48) {
        int v8 = a2 + 3;
      }
      else {
        int v8 = a2 + 2;
      }
      if (v10 == 48) {
        std::string::value_type v7 = v11;
      }
      goto LABEL_39;
    }
  }
  int v8 = a3;
LABEL_39:
  if (this) {
    std::string::operator=(this, v7);
  }
  else {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v7);
  }
  return v8;
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100](uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a3;
  unint64_t v4 = a2;
  if (*(unsigned char *)(a1 + 170))
  {
    if (*(unsigned char *)(a1 + 169))
    {
      for (unint64_t i = 0; ; ++i)
      {
        unint64_t v7 = v4[23] < 0 ? *((void *)v4 + 1) : v4[23];
        if (i >= v7) {
          break;
        }
        int v8 = v4;
        if (v4[23] < 0) {
          int v8 = *(char **)v4;
        }
        char v9 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v8[i]);
        int v10 = v4;
        if (v4[23] < 0) {
          int v10 = *(char **)v4;
        }
        v10[i] = v9;
      }
      for (unint64_t j = 0; ; ++j)
      {
        unint64_t v12 = v3[23] < 0 ? *((void *)v3 + 1) : v3[23];
        if (j >= v12) {
          break;
        }
        long long v13 = v3;
        if (v3[23] < 0) {
          long long v13 = *(char **)v3;
        }
        char v14 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v13[j]);
        int v15 = v3;
        if (v3[23] < 0) {
          int v15 = *(char **)v3;
        }
        v15[j] = v14;
      }
    }
    else
    {
      for (unint64_t k = 0; ; ++k)
      {
        unint64_t v18 = a2[23] < 0 ? *((void *)a2 + 1) : a2[23];
        if (k >= v18) {
          break;
        }
        unsigned __int8 v19 = a2;
        if (a2[23] < 0) {
          unsigned __int8 v19 = *(char **)a2;
        }
        std::vector<std::csub_match>::size_type v20 = a2;
        if (a2[23] < 0) {
          std::vector<std::csub_match>::size_type v20 = *(char **)a2;
        }
        v20[k] = v19[k];
      }
      for (unint64_t m = 0; ; ++m)
      {
        unint64_t v22 = a3[23] < 0 ? *((void *)a3 + 1) : a3[23];
        if (m >= v22) {
          break;
        }
        int v23 = a3;
        if (a3[23] < 0) {
          int v23 = *(char **)a3;
        }
        std::string v24 = a3;
        if (a3[23] < 0) {
          std::string v24 = *(char **)a3;
        }
        v24[m] = v23[m];
      }
    }
    if (v4[23] < 0)
    {
      std::string v26 = v4;
      unint64_t v4 = *(char **)v4;
      uint64_t v25 = *((void *)v26 + 1);
    }
    else
    {
      uint64_t v25 = v4[23];
    }
    std::regex_traits<char>::transform<std::__wrap_iter<char *>>(a1 + 16, v4, &v4[v25]);
    if (v3[23] < 0)
    {
      uint64_t v28 = v3;
      uint64_t v3 = *(char **)v3;
      uint64_t v27 = *((void *)v28 + 1);
    }
    else
    {
      uint64_t v27 = v3[23];
    }
    std::regex_traits<char>::transform<std::__wrap_iter<char *>>(a1 + 16, v3, &v3[v27]);
    *(_OWORD *)std::vector<char>::pointer v40 = v38;
    uint64_t v41 = v39;
    *(_OWORD *)std::string __p = *(_OWORD *)v36;
    uint64_t v43 = v37;
    std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100]((std::vector<std::pair<std::string, std::string>> *)(a1 + 88), (long long *)v40);
    if (SHIBYTE(v43) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v41) < 0) {
      operator delete(v40[0]);
    }
  }
  else
  {
    if (a2[23] < 0) {
      uint64_t v16 = *((void *)a2 + 1);
    }
    else {
      uint64_t v16 = a2[23];
    }
    if (v16 != 1 || (a3[23] < 0 ? (uint64_t v29 = *((void *)a3 + 1)) : (uint64_t v29 = a3[23]), v29 != 1)) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>();
    }
    if (*(unsigned char *)(a1 + 169))
    {
      size_t v30 = a2;
      if (a2[23] < 0) {
        size_t v30 = *(char **)a2;
      }
      char v31 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *v30);
      size_t v32 = v4;
      if (v4[23] < 0) {
        size_t v32 = *(unsigned char **)v4;
      }
      *size_t v32 = v31;
      int v33 = v3;
      if (v3[23] < 0) {
        int v33 = *(char **)v3;
      }
      char v34 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *v33);
      int v35 = v3;
      if (v3[23] < 0) {
        int v35 = *(unsigned char **)v3;
      }
      *int v35 = v34;
    }
    *(_OWORD *)std::vector<char>::pointer v40 = *(_OWORD *)v4;
    uint64_t v41 = *((void *)v4 + 2);
    *((void *)v4 + 1) = 0;
    *((void *)v4 + 2) = 0;
    *(void *)unint64_t v4 = 0;
    *(_OWORD *)std::string __p = *(_OWORD *)v3;
    uint64_t v43 = *((void *)v3 + 2);
    *(void *)uint64_t v3 = 0;
    *((void *)v3 + 1) = 0;
    *((void *)v3 + 2) = 0;
    std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100]((std::vector<std::pair<std::string, std::string>> *)(a1 + 88), (long long *)v40);
    if (SHIBYTE(v43) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v41) < 0) {
      operator delete(v40[0]);
    }
  }
}

void sub_263888DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(a1 + 169))
  {
    uint64_t v18 = a1 + 128;
    unint64_t v19 = *(void *)(a1 + 128);
    int v10 = (char **)(a1 + 112);
    __int16 v8 = a2 | (unsigned __int16)((_WORD)a3 << 8);
    char v9 = *(_WORD **)(a1 + 120);
    if (*(unsigned char *)(a1 + 170))
    {
      if ((unint64_t)v9 < v19) {
        goto LABEL_24;
      }
      uint64_t v20 = (char *)v9 - *v10;
      if (v20 > -3)
      {
        uint64_t v21 = v20 >> 1;
        unint64_t v22 = v19 - (void)*v10;
        if (v22 <= (v20 >> 1) + 1) {
          unint64_t v23 = v21 + 1;
        }
        else {
          unint64_t v23 = v22;
        }
        if (v22 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v24 = v23;
        }
        if (v24) {
          uint64_t v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v18, v24);
        }
        else {
          uint64_t v25 = 0;
        }
        uint64_t v27 = &v25[2 * v21];
        uint64_t v28 = &v25[2 * v24];
        *(_WORD *)uint64_t v27 = v8;
        std::string v26 = v27 + 2;
        long long v38 = *(char **)(a1 + 112);
        uint64_t v29 = *(char **)(a1 + 120);
        if (v29 == v38) {
          goto LABEL_46;
        }
        do
        {
          __int16 v39 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v39;
          v27 -= 2;
        }
        while (v29 != v38);
        goto LABEL_45;
      }
    }
    else
    {
      if ((unint64_t)v9 < v19) {
        goto LABEL_24;
      }
      uint64_t v32 = (char *)v9 - *v10;
      if (v32 > -3)
      {
        uint64_t v33 = v32 >> 1;
        unint64_t v34 = v19 - (void)*v10;
        if (v34 <= (v32 >> 1) + 1) {
          unint64_t v35 = v33 + 1;
        }
        else {
          unint64_t v35 = v34;
        }
        if (v34 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v36 = v35;
        }
        if (v36) {
          uint64_t v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v18, v36);
        }
        else {
          uint64_t v37 = 0;
        }
        uint64_t v27 = &v37[2 * v33];
        uint64_t v28 = &v37[2 * v36];
        *(_WORD *)uint64_t v27 = v8;
        std::string v26 = v27 + 2;
        std::vector<char>::pointer v40 = *(char **)(a1 + 112);
        uint64_t v29 = *(char **)(a1 + 120);
        if (v29 == v40) {
          goto LABEL_46;
        }
        do
        {
          __int16 v41 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v41;
          v27 -= 2;
        }
        while (v29 != v40);
        goto LABEL_45;
      }
    }
LABEL_49:
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  unsigned __int8 v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
  __int16 v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a3);
  unint64_t v7 = *(void *)(a1 + 128);
  __int16 v8 = v5 | (unsigned __int16)(v6 << 8);
  char v9 = *(_WORD **)(a1 + 120);
  if ((unint64_t)v9 < v7)
  {
LABEL_24:
    *char v9 = v8;
    std::string v26 = v9 + 1;
    goto LABEL_48;
  }
  int v10 = (char **)(a1 + 112);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v12 = (uint64_t)v9 - v11;
  if ((uint64_t)v9 - v11 <= -3) {
    goto LABEL_49;
  }
  uint64_t v13 = v12 >> 1;
  unint64_t v14 = v7 - v11;
  if (v14 <= (v12 >> 1) + 1) {
    unint64_t v15 = v13 + 1;
  }
  else {
    unint64_t v15 = v14;
  }
  if (v14 >= 0x7FFFFFFFFFFFFFFELL) {
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v16 = v15;
  }
  if (v16) {
    uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(a1 + 128, v16);
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v27 = &v17[2 * v13];
  uint64_t v28 = &v17[2 * v16];
  *(_WORD *)uint64_t v27 = v8;
  std::string v26 = v27 + 2;
  size_t v30 = *(char **)(a1 + 112);
  uint64_t v29 = *(char **)(a1 + 120);
  if (v29 == v30) {
    goto LABEL_46;
  }
  do
  {
    __int16 v31 = *((_WORD *)v29 - 1);
    v29 -= 2;
    *((_WORD *)v27 - 1) = v31;
    v27 -= 2;
  }
  while (v29 != v30);
LABEL_45:
  uint64_t v29 = *v10;
LABEL_46:
  *(void *)(a1 + 112) = v27;
  *(void *)(a1 + 12pthread_mutex_init(this, 0) = v26;
  *(void *)(a1 + 128) = v28;
  if (v29) {
    operator delete(v29);
  }
LABEL_48:
  *(void *)(a1 + 12pthread_mutex_init(this, 0) = v26;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E6C7C0](exception, 1);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_2638890B0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__bracket_expression<char,std::regex_traits<char>>::__add_equivalence[abi:ne180100](uint64_t *a1, long long *a2)
{
  uint64_t v3 = a1 + 17;
  unint64_t v4 = a1[18];
  if (v4 >= a1[19])
  {
    uint64_t result = std::vector<std::string>::__push_back_slow_path<std::string const&>(v3, a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v3, a2);
    uint64_t result = v4 + 24;
  }
  a1[18] = result;
  return result;
}

void std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  std::string::__init_with_size[abi:ne180100]<char *,char *>(&__s, a2, a3, a3 - a2);
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_) {
      goto LABEL_9;
    }
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((unsigned char *)&__s.__r_.__value_.__s + 23)) {
      return;
    }
    p_s = &__s;
  }
  std::__get_collation_name(&v11, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v11.__r_.__value_.__l.__data_;
  unint64_t v7 = v11.__r_.__value_.__r.__words[2];
  *(void *)(a4 + 16) = *((void *)&v11.__r_.__value_.__l + 2);
  unint64_t v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0) {
    unint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8) {
    goto LABEL_9;
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (__s.__r_.__value_.__l.__size_ >= 3) {
      goto LABEL_9;
    }
  }
  else if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
  {
    return;
  }
  (*(void (**)(std::string *__return_ptr))(**(void **)(a1 + 16) + 32))(&v11);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(std::string *)a4 = v11;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    int v9 = *(unsigned __int8 *)(a4 + 23);
    if (v9 != 12 && v9 != 1)
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_23;
  }
  uint64_t v10 = *(void *)(a4 + 8);
  if (v10 == 1 || v10 == 12)
  {
LABEL_23:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(unsigned char **)a4 = 0;
  *(void *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
}

void sub_263889284(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0) {
    operator delete(*(void **)v17);
  }
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::__transform_primary<std::__wrap_iter<char *>>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a2, a3, a3 - a2);
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    unint64_t v7 = __p;
  }
  else {
    unint64_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v7, (char *)v7 + v6);
  uint64_t v8 = *(unsigned __int8 *)(a4 + 23);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0) {
        uint64_t v10 = (unsigned char *)a4;
      }
      else {
        uint64_t v10 = *(unsigned char **)a4;
      }
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(unsigned char **)a4 = 0;
      *(void *)(a4 + 8) = 0;
    }
    else
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
}

void sub_2638893AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>(uint64_t a1, long long *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    *(void *)(v3 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v3 = v4;
  }
  *(void *)(a1 + 8) = v3 + 24;
}

void sub_263889420(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9) {
    uint64_t v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  std::__split_buffer<std::string>::pointer end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    std::__split_buffer<std::string>::pointer end = __v.__end_;
  }
  else
  {
    long long v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  uint64_t v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_263889538(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  std::vector<std::pair<char, char>>::pointer begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  unint64_t v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      unint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        unint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E6C7C0](exception, 2);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_2638897B8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::regex_traits<char>::__lookup_classname<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3, BOOL a4)
{
  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a2, a3, a3 - a2);
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    uint64_t v7 = __p;
  }
  else {
    uint64_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 8) + 48))(*(void *)(a1 + 8), v7, (char *)v7 + v6);
  if ((v12 & 0x80u) == 0) {
    unint64_t v8 = __p;
  }
  else {
    unint64_t v8 = (void **)__p[0];
  }
  uint64_t classname = std::__get_classname((const char *)v8, a4);
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
  return classname;
}

void sub_263889884(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (*(unsigned char *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
    unint64_t v5 = *(unsigned char **)(a1 + 72);
    unint64_t v4 = *(void *)(a1 + 80);
    if ((unint64_t)v5 >= v4)
    {
      unint64_t v6 = (unint64_t *)(a1 + 64);
      unint64_t v7 = *(void *)(a1 + 64);
      unint64_t v8 = &v5[-v7];
      uint64_t v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        unint64_t v10 = v4 - v7;
        if (2 * v10 > v9) {
          uint64_t v9 = 2 * v10;
        }
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v11 = v9;
        }
        if (v11) {
          unsigned __int8 v12 = operator new(v11);
        }
        else {
          unsigned __int8 v12 = 0;
        }
        uint64_t v20 = &v8[(void)v12];
        uint64_t v21 = (char *)v12 + v11;
        v8[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v8[(void)v12 + 1];
        if (v5 != (unsigned char *)v7)
        {
          unint64_t v22 = &v5[~v7];
          do
          {
            char v23 = *--v5;
            (v22--)[(void)v12] = v23;
          }
          while (v5 != (unsigned char *)v7);
LABEL_45:
          unint64_t v5 = (unsigned char *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    goto LABEL_22;
  }
  unint64_t v6 = (unint64_t *)(a1 + 64);
  unint64_t v5 = *(unsigned char **)(a1 + 72);
  unint64_t v13 = *(void *)(a1 + 80);
  if (!*(unsigned char *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      unint64_t v24 = *v6;
      uint64_t v25 = &v5[-*v6];
      unint64_t v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        unint64_t v27 = v13 - v24;
        if (2 * v27 > v26) {
          unint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v28 = v26;
        }
        if (v28) {
          unsigned __int8 v12 = operator new(v28);
        }
        else {
          unsigned __int8 v12 = 0;
        }
        uint64_t v20 = &v25[(void)v12];
        uint64_t v21 = (char *)v12 + v28;
        v25[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v25[(void)v12 + 1];
        if (v5 != (unsigned char *)v24)
        {
          __int16 v31 = &v5[~v24];
          do
          {
            char v32 = *--v5;
            (v31--)[(void)v12] = v32;
          }
          while (v5 != (unsigned char *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *unint64_t v5 = v2;
    uint64_t v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13) {
    goto LABEL_22;
  }
  unint64_t v14 = *v6;
  long long v15 = &v5[-*v6];
  unint64_t v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0) {
    goto LABEL_50;
  }
  unint64_t v17 = v13 - v14;
  if (2 * v17 > v16) {
    unint64_t v16 = 2 * v17;
  }
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v18 = v16;
  }
  if (v18) {
    unsigned __int8 v12 = operator new(v18);
  }
  else {
    unsigned __int8 v12 = 0;
  }
  uint64_t v20 = &v15[(void)v12];
  uint64_t v21 = (char *)v12 + v18;
  v15[(void)v12] = v2;
  uint64_t v19 = (uint64_t)&v15[(void)v12 + 1];
  if (v5 != (unsigned char *)v14)
  {
    uint64_t v29 = &v5[~v14];
    do
    {
      char v30 = *--v5;
      (v29--)[(void)v12] = v30;
    }
    while (v5 != (unsigned char *)v14);
    goto LABEL_45;
  }
LABEL_46:
  unsigned __int8 v12 = v20;
LABEL_47:
  *(void *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = v19;
  *(void *)(a1 + 8pthread_mutex_init(this, 0) = v21;
  if (v5) {
    operator delete(v5);
  }
LABEL_49:
  *(void *)(a1 + 72) = v19;
}

void std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100](std::vector<std::pair<std::string, std::string>> *a1, long long *a2)
{
  value = a1->__end_cap_.__value_;
  p_end_cap = (std::allocator<std::pair<std::string, std::string>> *)&a1->__end_cap_;
  unint64_t v5 = value;
  unint64_t v7 = *((void *)p_end_cap - 1);
  if (v7 >= (unint64_t)value)
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (unint64_t)a1->__begin_) >> 4);
    unint64_t v12 = v11 + 1;
    if (v11 + 1 > 0x555555555555555) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (char *)a1->__begin_) >> 4);
    if (2 * v13 > v12) {
      unint64_t v12 = 2 * v13;
    }
    if (v13 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v14 = 0x555555555555555;
    }
    else {
      unint64_t v14 = v12;
    }
    __v.__end_cap_.__value_ = p_end_cap;
    if (v14) {
      long long v15 = (std::pair<std::string, std::string> *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>>((uint64_t)p_end_cap, v14);
    }
    else {
      long long v15 = 0;
    }
    unint64_t v16 = v15 + v11;
    __v.__first_ = v15;
    __v.__begin_ = v16;
    __v.__end_cap_.__value_ = &v15[v14];
    long long v17 = *a2;
    v16->first.__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&v16->first.__r_.__value_.__l.__data_ = v17;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    long long v18 = *(long long *)((char *)a2 + 24);
    v16->second.__r_.__value_.__r.__words[2] = *((void *)a2 + 5);
    *(_OWORD *)&v16->second.__r_.__value_.__l.__data_ = v18;
    *((void *)a2 + 4) = 0;
    *((void *)a2 + 5) = 0;
    *((void *)a2 + 3) = 0;
    __v.__end_ = v16 + 1;
    std::vector<std::pair<std::string,std::string>>::__swap_out_circular_buffer(a1, &__v);
    std::__split_buffer<std::string>::pointer end = a1->__end_;
    std::__split_buffer<std::pair<std::string,std::string>>::~__split_buffer(&__v);
  }
  else
  {
    long long v8 = *a2;
    *(void *)(v7 + 16) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v7 = v8;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    long long v9 = *(long long *)((char *)a2 + 24);
    *(void *)(v7 + 4pthread_mutex_init(this, 0) = *((void *)a2 + 5);
    *(_OWORD *)(v7 + 24) = v9;
    *((void *)a2 + 4) = 0;
    *((void *)a2 + 5) = 0;
    *((void *)a2 + 3) = 0;
    std::__split_buffer<std::string>::pointer end = (std::pair<std::string, std::string> *)(v7 + 48);
    a1->__end_ = (std::vector<std::pair<std::string, std::string>>::pointer)(v7 + 48);
  }
  a1->__end_ = end;
}

void sub_263889C40(_Unwind_Exception *a1, std::__split_buffer<std::pair<std::string, std::string>> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::regex_traits<char>::transform<std::__wrap_iter<char *>>(uint64_t a1, char *a2, char *a3)
{
  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a2, a3, a3 - a2);
  unint64_t v4 = v7;
  if ((v7 & 0x80u) == 0) {
    unint64_t v5 = __p;
  }
  else {
    unint64_t v5 = (void **)__p[0];
  }
  if ((v7 & 0x80u) != 0) {
    unint64_t v4 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0) {
    operator delete(__p[0]);
  }
}

void sub_263889CF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E6C7C0](exception, 9);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_263889D50(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::vector<std::pair<std::string,std::string>>::__swap_out_circular_buffer(std::vector<std::pair<std::string, std::string>> *this, std::__split_buffer<std::pair<std::string, std::string>> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>,std::reverse_iterator<std::pair<std::string,std::string>*>,std::reverse_iterator<std::pair<std::string,std::string>*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  std::vector<std::pair<char, char>>::pointer begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(48 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>,std::reverse_iterator<std::pair<std::string,std::string>*>,std::reverse_iterator<std::pair<std::string,std::string>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v16 = a6;
  *((void *)&v16 + 1) = a7;
  long long v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  unint64_t v13[2] = &v16;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 48);
      *(void *)(v9 - 32) = *(void *)(a3 - 32);
      *(_OWORD *)(v9 - 48) = v10;
      *(void *)(a3 - 4pthread_mutex_init(this, 0) = 0;
      *(void *)(a3 - 32) = 0;
      *(void *)(a3 - 48) = 0;
      long long v11 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v11;
      v9 -= 48;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 48;
      a3 -= 48;
    }
    while (a3 != a5);
    *((void *)&v16 + 1) = v9;
  }
  char v14 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v13);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      std::allocator<std::pair<std::string,std::string>>::destroy[abi:ne180100](v3, v1);
      v1 += 48;
    }
    while (v1 != v2);
  }
}

void std::__split_buffer<std::pair<std::string,std::string>>::~__split_buffer(std::__split_buffer<std::pair<std::string, std::string>> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::pair<std::string,std::string>>::clear[abi:ne180100](void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 48;
    std::allocator<std::pair<std::string,std::string>>::destroy[abi:ne180100](v4, i - 48);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(2 * a2);
}

void (__cdecl ***std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

uint64_t std::__begin_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(*(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(void *)(a2 + 16);
  *(void *)(a2 + 8pthread_mutex_init(this, 0) = *(void *)(result + 8);
  return result;
}

void (__cdecl ***std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

uint64_t std::__end_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  uint64_t v2 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(void *)(v2 + 8) = *(void *)(a2 + 16);
  *(unsigned char *)(v2 + 16) = 1;
  *(void *)(a2 + 8pthread_mutex_init(this, 0) = *(void *)(result + 8);
  return result;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_loop(std::basic_regex<char> *this, size_t __min, size_t __max, std::__owns_one_state<char> *__s, size_t __mexp_begin, size_t __mexp_end, BOOL __greedy)
{
  int v8 = __mexp_end;
  int v9 = __mexp_begin;
  char v14 = operator new(0x10uLL);
  std::__split_buffer<std::string>::pointer end = this->__end_;
  first = end->__first_;
  v14[1] = first;
  end->__first_ = 0;
  long long v17 = operator new(0x38uLL);
  unsigned int loop_count = this->__loop_count_;
  *((void *)v17 + 1) = __s->__first_;
  *((void *)v17 + 2) = v14;
  *(void *)long long v17 = &unk_270EB5470;
  *((void *)v17 + 3) = __min;
  *((void *)v17 + 4) = __max;
  *((_DWORD *)v17 + 1pthread_mutex_init(this, 0) = loop_count;
  *((_DWORD *)v17 + 11) = v9;
  *((_DWORD *)v17 + 12) = v8;
  *((unsigned char *)v17 + 52) = __greedy;
  __s->__first_ = 0;
  uint64_t v19 = (std::__node<char> *)operator new(0x10uLL);
  v19->__vftable = (std::__node<char>_vtbl *)&unk_270EB5500;
  v19[1].__vftable = (std::__node<char>_vtbl *)v17;
  this->__end_->__first_ = v19;
  this->__end_ = (std::__owns_one_state<char> *)*((void *)v17 + 2);
  __s->__first_ = (std::__node<char> *)v17;
  this->__loop_count_ = loop_count + 1;
}

void sub_26388A364(_Unwind_Exception *a1)
{
  uint64_t v3 = std::__owns_two_states<char>::~__owns_two_states(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<std::__wrap_iter<char const*>>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, int *a4)
{
  if (a2 != a3)
  {
    int v4 = *a2;
    if ((v4 & 0xF8) == 0x30 || (v4 & 0xFE) == 0x38)
    {
      int v5 = v4 - 48;
      *a4 = v5;
      if (++a2 == a3)
      {
        return a3;
      }
      else
      {
        while (1)
        {
          int v6 = *a2;
          if ((v6 & 0xF8) != 0x30 && (v6 & 0xFE) != 0x38) {
            break;
          }
          if (v5 >= 214748364) {
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
          }
          int v5 = v6 + 10 * v5 - 48;
          *a4 = v5;
          if (++a2 == a3) {
            return a3;
          }
        }
      }
    }
  }
  return a2;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E6C7C0](exception, 8);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_26388A470(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E6C7C0](exception, 7);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_26388A4C8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__loop<char>::~__loop(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = std::__owns_two_states<char>::~__owns_two_states(a1);

  operator delete(v1);
}

unsigned int *std::__loop<char>::__exec(unsigned int *result, void *a2)
{
  uint64_t v2 = result[10];
  uint64_t v3 = a2[7];
  int v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 == -991)
  {
    unint64_t v5 = *v4 + 1;
    *int v4 = v5;
    unint64_t v6 = *((void *)result + 3);
    unint64_t v7 = *((void *)result + 4);
    BOOL v8 = v5 < v7;
    if (v5 < v7 && v5 >= v6)
    {
      uint64_t v10 = *(void *)(v3 + 16 * v2 + 8);
      BOOL v8 = v5 < v7 && v10 != a2[2];
    }
    if (!v8 || v5 < v6)
    {
      *(_DWORD *)a2 = -994;
      if (!v8) {
        goto LABEL_25;
      }
LABEL_22:
      a2[10] = *((void *)result + 1);
      return std::__loop<char>::__init_repeat[abi:ne180100](result, a2);
    }
    goto LABEL_23;
  }
  *int v4 = 0;
  if (*((void *)result + 4))
  {
    if (*((void *)result + 3))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_22;
    }
LABEL_23:
    *(_DWORD *)a2 = -992;
    return result;
  }
  *(_DWORD *)a2 = -994;
LABEL_25:
  a2[10] = *((void *)result + 2);
  return result;
}

unsigned int *std::__loop<char>::__exec_split(unsigned int *result, int a2, void *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((void *)result + 2);
  }
  else
  {
    a3[10] = *((void *)result + 1);
    return std::__loop<char>::__init_repeat[abi:ne180100](result, a3);
  }
  return result;
}

void std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = std::__owns_two_states<char>::~__owns_two_states(a1);

  operator delete(v1);
}

void (__cdecl ***std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_270EB54D0;
  uint64_t v2 = a1[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  uint64_t v3 = a1[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }
  return a1;
}

unsigned int *std::__loop<char>::__init_repeat[abi:ne180100](unsigned int *result, void *a2)
{
  unsigned int v2 = result[11];
  *(void *)(a2[7] + 16 * result[10] + 8) = a2[2];
  unsigned int v3 = result[12];
  if (v2 != v3)
  {
    uint64_t v4 = v2 - 1;
    uint64_t v5 = a2[3];
    uint64_t v6 = v3 - 1 - v4;
    uint64_t v7 = a2[4] + 24 * v4 + 8;
    do
    {
      *(void *)(v7 - 8) = v5;
      *(void *)uint64_t v7 = v5;
      *(unsigned char *)(v7 + 8) = 0;
      v7 += 24;
      --v6;
    }
    while (v6);
  }
  return result;
}

uint64_t std::__repeat_one_loop<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(void *)(a2 + 8pthread_mutex_init(this, 0) = *(void *)(result + 8);
  return result;
}

void std::__alternate<char>::~__alternate(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = std::__owns_two_states<char>::~__owns_two_states(a1);

  operator delete(v1);
}

void std::__alternate<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t std::__alternate<char>::__exec_split(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)a3 = -994;
  uint64_t v3 = 8;
  if (a2) {
    uint64_t v3 = 16;
  }
  *(void *)(a3 + 8pthread_mutex_init(this, 0) = *(void *)(result + v3);
  return result;
}

uint64_t std::__empty_non_own_state<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 8pthread_mutex_init(this, 0) = *(void *)(result + 8);
  return result;
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__parse_RE_expression<std::__wrap_iter<char const*>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  do
  {
    uint64_t v5 = a2;
    a2 = std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<std::__wrap_iter<char const*>>(a1, a2, a3);
  }
  while (v5 != a2);
  return v5;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x263E6C7C0](exception, 15);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_26388A844(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  if (a2 == a3) {
    return (unsigned __int8 *)a2;
  }
  std::__split_buffer<std::string>::pointer end = a1->__end_;
  unsigned int marked_count = a1->__marked_count_;
  BOOL v8 = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(a1, a2, a3);
  if (v8 == (unsigned __int8 *)a2) {
    return (unsigned __int8 *)a2;
  }
  size_t v9 = a1->__marked_count_ + 1;

  return std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>(a1, v8, (unsigned __int8 *)a3, end, marked_count + 1, v9);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  uint64_t v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_RE<std::__wrap_iter<char const*>>(a1, a2, a3);
  uint64_t v7 = v6;
  if (a2 == v6 && a2 != a3 && a2 + 1 != a3)
  {
    uint64_t v9 = (uint64_t)v6;
    if (*a2 == 92) {
      uint64_t v9 = (uint64_t)&a2[2 * (a2[1] == 40)];
    }
    if ((char *)v9 == a2)
    {
      if (*a2 == 92)
      {
        BOOL v12 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(a1, a2[1]);
        uint64_t v13 = 2;
        if (!v12) {
          uint64_t v13 = 0;
        }
        return &a2[v13];
      }
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(a1);
      unsigned int marked_count = a1->__marked_count_;
      long long v11 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_RE_expression<std::__wrap_iter<char const*>>((uint64_t)a1, v9, (uint64_t)a3);
      if (v11 == a3 || v11 + 1 == a3 || *v11 != 92 || v11[1] != 41) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      }
      uint64_t v7 = v11 + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(a1, marked_count);
    }
  }
  return v7;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, unsigned __int8 *a2, unsigned __int8 *a3, std::__owns_one_state<char> *__s, size_t __mexp_begin, size_t __mexp_end)
{
  uint64_t v6 = a2;
  if (a2 != a3)
  {
    unsigned int v7 = __mexp_end;
    unsigned int v8 = __mexp_begin;
    int v11 = *a2;
    if (v11 == 42)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(this, 0, 0xFFFFFFFFFFFFFFFFLL, __s, __mexp_begin, __mexp_end, 1);
      return ++v6;
    }
    if (a2 + 1 != a3 && v11 == 92 && a2[1] == 123)
    {
      uint64_t v13 = a2 + 2;
      int v25 = 0;
      char v14 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<std::__wrap_iter<char const*>>((uint64_t)this, a2 + 2, a3, &v25);
      if (v13 == v14) {
        goto LABEL_16;
      }
      if (v14 != a3)
      {
        long long v15 = v14 + 1;
        int v16 = *v14;
        if (v16 == 44)
        {
          int v24 = -1;
          long long v17 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<std::__wrap_iter<char const*>>((uint64_t)this, v15, a3, &v24);
          if (v17 != a3 && v17 + 1 != a3 && *v17 == 92 && v17[1] == 125)
          {
            size_t v19 = v24;
            size_t v18 = v25;
            if (v24 == -1)
            {
              size_t v19 = -1;
            }
            else if (v24 < v25)
            {
LABEL_16:
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
            }
            uint64_t v6 = &v17[2 * (v17[1] == 125)];
            size_t v20 = v8;
            size_t v21 = v7;
            unint64_t v22 = this;
LABEL_23:
            std::basic_regex<char,std::regex_traits<char>>::__push_loop(v22, v18, v19, __s, v20, v21, 1);
            return v6;
          }
        }
        else if (v15 != a3 && v16 == 92 && *v15 == 125)
        {
          uint64_t v6 = v14 + 2;
          size_t v18 = v25;
          size_t v20 = v8;
          size_t v21 = v7;
          unint64_t v22 = this;
          size_t v19 = v25;
          goto LABEL_23;
        }
      }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    }
  }
  return v6;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_RE<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, char *a2, char *a3)
{
  if (a2 == a3)
  {
    uint64_t result = std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<std::__wrap_iter<char const*>>(this, a2, a3);
    if (result != a2) {
      return result;
    }
  }
  else
  {
    int v6 = *a2;
    if ((a2 + 1 != a3 || v6 != 36)
      && ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0))
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v6);
      return a2 + 1;
    }
    uint64_t result = std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<std::__wrap_iter<char const*>>(this, a2, a3);
    if (result != a2) {
      return result;
    }
    if (*a2 == 46)
    {
      uint64_t v9 = (std::__node<char> *)operator new(0x10uLL);
      std::__split_buffer<std::string>::pointer end = this->__end_;
      first = end->__first_;
      v9->__vftable = (std::__node<char>_vtbl *)&unk_270EB55D8;
      v9[1].__vftable = (std::__node<char>_vtbl *)first;
      end->__first_ = v9;
      this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      return a2 + 1;
    }
  }

  return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)this, a2, a3);
}

unsigned char *std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned char *a2, unsigned char *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3 && a2 + 1 != a3 && *a2 == 92)
  {
    int v4 = (char)a2[1];
    if ((v4 - 36) <= 0x3A && ((1 << (a2[1] - 36)) & 0x580000000000441) != 0)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v4);
      v3 += 2;
    }
  }
  return v3;
}

void (__cdecl ***std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  unsigned int v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__match_any<char>::~__match_any(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  unsigned int v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

uint64_t std::__match_any<char>::__exec(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(unsigned char **)(a2 + 16);
  if (v2 == *(unsigned char **)(a2 + 24) || !*v2)
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 8pthread_mutex_init(this, 0) = v3;
  return result;
}

BOOL std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(std::basic_regex<char> *this, char a2)
{
  if ((a2 & 0xF8) != 0x30 && (a2 & 0xFE) != 0x38 || a2 - 49 > 8) {
    return 0;
  }
  if (a2 - 48 > this->__marked_count_) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, a2 - 48);
  return 1;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  int v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  }
  do
  {
    unsigned int v7 = v6;
    int v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)v6, a3);
  }
  while (v7 != v6);
  return v7;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  std::__split_buffer<std::string>::pointer end = a1->__end_;
  unsigned int marked_count = a1->__marked_count_;
  unsigned int v8 = std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_ERE<std::__wrap_iter<char const*>>(a1, a2, a3);
  uint64_t v9 = (unsigned __int8 *)v8;
  if (v8 != (char *)a2 || v8 == (char *)a3) {
    goto LABEL_12;
  }
  int locale_low = SLOBYTE(a2->__traits_.__loc_.__locale_);
  if (locale_low == 36)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_r_anchor(a1);
    goto LABEL_8;
  }
  if (locale_low == 40)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(a1);
    unsigned int v11 = a1->__marked_count_;
    ++a1->__open_count_;
    BOOL v12 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(a1, (char *)&a2->__traits_.__loc_.__locale_ + 1, a3);
    if (v12 == a3 || (uint64_t v13 = v12, LOBYTE(v12->__traits_.__loc_.__locale_) != 41)) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(a1, v11);
    --a1->__open_count_;
    uint64_t v9 = (unsigned __int8 *)&v13->__traits_.__loc_.__locale_ + 1;
LABEL_12:
    if (v9 != (unsigned __int8 *)a2) {
      goto LABEL_13;
    }
    return (unsigned __int8 *)a2;
  }
  if (locale_low != 94) {
    return (unsigned __int8 *)a2;
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_l_anchor(a1);
LABEL_8:
  uint64_t v9 = (unsigned __int8 *)&a2->__traits_.__loc_.__locale_ + 1;
LABEL_13:
  size_t v14 = a1->__marked_count_ + 1;

  return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)a1, v9, (unsigned __int8 *)a3, end, marked_count + 1, v14);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_ERE<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  uint64_t result = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ORD_CHAR_ERE<std::__wrap_iter<char const*>>(a1, a2, a3);
  if (result == (char *)a2)
  {
    uint64_t result = std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR_ERE<std::__wrap_iter<char const*>>((uint64_t)a1, (char *)a2, (char *)a3);
    if (result == (char *)a2)
    {
      if (a2 == a3 || LOBYTE(a2->__traits_.__loc_.__locale_) != 46)
      {
        return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)a1, (char *)a2, (char *)a3);
      }
      else
      {
        unsigned int v7 = (std::__node<char> *)operator new(0x10uLL);
        std::__split_buffer<std::string>::pointer end = a1->__end_;
        first = end->__first_;
        v7->__vftable = (std::__node<char>_vtbl *)&unk_270EB55D8;
        v7[1].__vftable = (std::__node<char>_vtbl *)first;
        end->__first_ = v7;
        a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
        return (char *)&a2->__traits_.__loc_.__locale_ + 1;
      }
    }
  }
  return result;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ORD_CHAR_ERE<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3)
{
  uint64_t v3 = this;
  if (this != a3)
  {
    int locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
    uint64_t v5 = (locale_low - 36);
    if (v5 > 0x3A) {
      goto LABEL_8;
    }
    if (((1 << (locale_low - 36)) & 0x5800000080004D1) != 0) {
      return v3;
    }
    if (v5 == 5)
    {
      if (a1->__open_count_) {
        return v3;
      }
    }
    else
    {
LABEL_8:
      if ((locale_low - 123) < 2) {
        return v3;
      }
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, (std::basic_regex<char>::value_type)this->__traits_.__loc_.__locale_);
    return (std::basic_regex<char> *)((char *)v3 + 1);
  }
  return v3;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR_ERE<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3)
  {
    int v4 = a2 + 1;
    if (v3 + 1 != a3 && *v3 == 92)
    {
      int v5 = *v4;
      char v6 = *v4;
      BOOL v7 = (v5 - 36) > 0x3A || ((1 << (*v4 - 36)) & 0x5800000080004F1) == 0;
      if (v7 && (v5 - 123) >= 3)
      {
        if ((*(_DWORD *)(a1 + 24) & 0x1F0) == 0x40)
        {
          return std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v4, a3, 0);
        }
        else
        {
          BOOL v9 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref((std::basic_regex<char> *)a1, v6);
          uint64_t v10 = 2;
          if (!v9) {
            uint64_t v10 = 0;
          }
          v3 += v10;
        }
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v6);
        v3 += 2;
      }
    }
  }
  return v3;
}

uint64_t std::regex_match[abi:ne180100]<std::__wrap_iter<char const*>,std::allocator<std::sub_match<std::__wrap_iter<char const*>>>,char,std::regex_traits<char>>(char *__f, char *__l, uint64_t a3, uint64_t a4, int a5)
{
  __int16 v5 = a5;
  memset(&__p.__prefix_, 0, 17);
  memset(&__p.__suffix_, 0, 17);
  __p.__ready_ = 0;
  __p.__position_start_ = 0;
  memset(&__p, 0, 41);
  int v9 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(a4, __f, __l, &__p, a5 | 0x1040u);
  std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((std::vector<std::ssub_match> *)a3, (uint64_t)__f, (std::sub_match<std::__wrap_iter<const char *>> *)__l, (uint64_t *)&__p, (v5 & 0x800) != 0);
  if (__p.__matches_.__begin_)
  {
    __p.__matches_.__end_ = __p.__matches_.__begin_;
    operator delete(__p.__matches_.__begin_);
  }
  if (!v9) {
    return 0;
  }
  if (!*(unsigned char *)(a3 + 88)) {
    return 1;
  }
  uint64_t result = 0;
  *(void *)(a3 + 8) = *(void *)a3;
  return result;
}

void sub_26388B384(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(uint64_t a1, char *__f, char *__l, std::match_results<const char *> *this, int a5)
{
  if ((a5 & 0x80) != 0) {
    int v9 = a5 & 0xFFA;
  }
  else {
    int v9 = a5;
  }
  std::match_results<char const*>::__init(this, *(_DWORD *)(a1 + 28) + 1, __f, __l, (unsigned __int16)(v9 & 0x800) >> 11);
  if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, __f, __l, (uint64_t *)this, v9, (v9 & 0x800) == 0))
  {
    if (this->__matches_.__end_ == this->__matches_.__begin_) {
      p_unmatched = &this->__unmatched_;
    }
    else {
      p_unmatched = this->__matches_.__begin_;
    }
LABEL_8:
    first = p_unmatched->first;
    this->__prefix_.second = p_unmatched->first;
    this->__prefix_.matched = this->__prefix_.first != first;
    second = p_unmatched->second;
    this->__suffix_.first = second;
    this->__suffix_.matched = second != this->__suffix_.second;
    return 1;
  }
  if (__f != __l && (v9 & 0x40) == 0)
  {
    int v14 = v9 | 0x80;
    long long v15 = __f + 1;
    if (v15 != __l)
    {
      while (1)
      {
        std::vector<std::sub_match<char const*>>::assign(&this->__matches_, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__matches_.__end_ - (char *)this->__matches_.__begin_) >> 3), &this->__unmatched_);
        int v16 = std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, v15, __l, (uint64_t *)this, v14, 0);
        std::vector<std::csub_match>::pointer begin = this->__matches_.__begin_;
        std::vector<std::csub_match>::pointer end = this->__matches_.__end_;
        if (v16) {
          break;
        }
        std::vector<std::sub_match<char const*>>::assign(&this->__matches_, 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3), &this->__unmatched_);
        if (++v15 == __l) {
          goto LABEL_14;
        }
      }
      if (end == begin) {
        p_unmatched = &this->__unmatched_;
      }
      else {
        p_unmatched = this->__matches_.__begin_;
      }
      goto LABEL_8;
    }
LABEL_14:
    std::vector<std::sub_match<char const*>>::assign(&this->__matches_, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__matches_.__end_ - (char *)this->__matches_.__begin_) >> 3), &this->__unmatched_);
    if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, __l, __l, (uint64_t *)this, v14, 0))
    {
      if (this->__matches_.__end_ == this->__matches_.__begin_) {
        p_unmatched = &this->__unmatched_;
      }
      else {
        p_unmatched = this->__matches_.__begin_;
      }
      goto LABEL_8;
    }
  }
  uint64_t result = 0;
  this->__matches_.__end_ = this->__matches_.__begin_;
  return result;
}

void std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>(std::vector<std::ssub_match> *a1, uint64_t a2, std::sub_match<std::__wrap_iter<const char *>> *a3, uint64_t *a4, char a5)
{
  uint64_t v10 = a4[6];
  std::vector<std::sub_match<std::__wrap_iter<char const*>>>::resize(a1, 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3));
  std::vector<std::ssub_match>::pointer begin = a1->__begin_;
  if (a1->__end_ != a1->__begin_)
  {
    unint64_t v12 = 0;
    unint64_t v13 = 0;
    uint64_t v15 = *a4;
    uint64_t v14 = a4[1];
    do
    {
      unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((v14 - v15) >> 3);
      long long v17 = (void *)(v15 + v12 * 24);
      if (v16 <= v13) {
        size_t v18 = a4 + 3;
      }
      else {
        size_t v18 = v17;
      }
      begin[v12].first.__i_ = (std::__wrap_iter<const char *>::iterator_type)(a2 + *v18 - v10);
      if (0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3) <= v13) {
        size_t v19 = a4 + 3;
      }
      else {
        size_t v19 = (uint64_t *)(*a4 + v12 * 24);
      }
      a1->__begin_[v12].second.__i_ = (std::__wrap_iter<const char *>::iterator_type)(a2 + v19[1] - v10);
      uint64_t v15 = *a4;
      uint64_t v14 = a4[1];
      if (0xAAAAAAAAAAAAAAABLL * ((v14 - *a4) >> 3) <= v13) {
        size_t v20 = a4 + 3;
      }
      else {
        size_t v20 = (uint64_t *)(*a4 + v12 * 24);
      }
      char v21 = *((unsigned char *)v20 + 16);
      std::vector<std::ssub_match>::pointer begin = a1->__begin_;
      std::vector<std::ssub_match>::pointer end = a1->__end_;
      a1->__begin_[v12].matched = v21;
      ++v13;
      ++v12;
    }
    while (v13 < 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3));
  }
  a1[1].__begin_ = a3;
  a1[1].__end_ = a3;
  LOBYTE(a1[1].__end_cap_.__value_) = 0;
  char v23 = (std::sub_match<std::__wrap_iter<const char *>> *)(a2 + a4[6] - v10);
  a1[2].__begin_ = v23;
  a1[2].__end_ = (std::vector<std::ssub_match>::pointer)(a2 + a4[7] - v10);
  LOBYTE(a1[2].__end_cap_.__value_) = *((unsigned char *)a4 + 64);
  a1[3].__begin_ = (std::vector<std::ssub_match>::pointer)(a2 + a4[9] - v10);
  a1[3].__end_ = (std::vector<std::ssub_match>::pointer)(a2 + a4[10] - v10);
  LOBYTE(a1[3].__end_cap_.__value_) = *((unsigned char *)a4 + 88);
  if ((a5 & 1) == 0) {
    a1[4].__end_ = v23;
  }
  LOBYTE(a1[4].__begin_) = *((unsigned char *)a4 + 96);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0) {
    return std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1, a2, a3, a4, a5, a6);
  }
  if (*(_DWORD *)(a1 + 28)) {
    return std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(a1, a2, a3, a4, a5, a6);
  }
  return std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(a1, (uint64_t)a2, (uint64_t)a3, a4, a5, a6);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  long long v62 = 0u;
  long long v63 = 0u;
  long long v61 = 0u;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    *(_DWORD *)int v57 = 0;
    memset(&v57[8], 0, 32);
    long long v58 = 0uLL;
    *(_OWORD *)std::match_results<const char *> __p = 0uLL;
    memset(v60, 0, 21);
    std::deque<std::__state<char>>::push_back(&v61, (uint64_t)v57);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(void *)&v57[32])
    {
      *(void *)&long long v58 = *(void *)&v57[32];
      operator delete(*(void **)&v57[32]);
    }
    unint64_t v52 = a4;
    uint64_t v12 = *((void *)&v61 + 1);
    unint64_t v13 = *((void *)&v63 + 1) + v63 - 1;
    unint64_t v14 = v13 / 0x2A;
    uint64_t v15 = *(void *)(*((void *)&v61 + 1) + 8 * (v13 / 0x2A));
    unint64_t v16 = 3 * (v13 % 0x2A);
    uint64_t v17 = v15 + 32 * v16;
    *(_DWORD *)uint64_t v17 = 0;
    *(void *)(v17 + 8) = a2;
    *(void *)(*(void *)(v12 + 8 * v14) + 32 * v16 + 16) = a2;
    *(void *)(*(void *)(v12 + 8 * v14) + 32 * v16 + 24) = a3;
    std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)(*(void *)(v12 + 8 * v14) + 32 * v16 + 56), *(unsigned int *)(a1 + 32));
    char v55 = 0;
    unsigned int v18 = 0;
    uint64_t v53 = 0;
    uint64_t v54 = a2;
    uint64_t v19 = a3 - a2;
    uint64_t v20 = *((void *)&v63 + 1);
    uint64_t v21 = *((void *)&v61 + 1);
    unint64_t v22 = *((void *)&v63 + 1) + v63 - 1;
    unint64_t v23 = v22 / 0x2A;
    unint64_t v24 = 3 * (v22 % 0x2A);
    *(void *)(*(void *)(*((void *)&v61 + 1) + 8 * v23) + 32 * v24 + 8pthread_mutex_init(this, 0) = v6;
    uint64_t v25 = *(void *)(v21 + 8 * v23) + 32 * v24;
    *(_DWORD *)(v25 + 88) = a5;
    *(unsigned char *)(v25 + 92) = a6;
    while (2)
    {
      if ((++v18 & 0xFFF) == 0 && (int)(v18 >> 12) >= (int)v19) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
      }
      unint64_t v27 = v20 + v63 - 1;
      uint64_t v28 = *(void *)(*((void *)&v61 + 1) + 8 * (v27 / 0x2A));
      unint64_t v29 = v27 % 0x2A;
      uint64_t v30 = v28 + 96 * (v27 % 0x2A);
      char v32 = (void *)(v30 + 80);
      uint64_t v31 = *(void *)(v30 + 80);
      if (v31) {
        (*(void (**)(uint64_t, unint64_t))(*(void *)v31 + 16))(v31, v28 + 96 * v29);
      }
      switch(*(_DWORD *)v30)
      {
        case 0xFFFFFC18:
          uint64_t v33 = *(void *)(v28 + 96 * v29 + 16);
          BOOL v35 = (a5 & 0x1000) == 0 || v33 == a3;
          BOOL v36 = v33 != v54 || (a5 & 0x20) == 0;
          if (!v36 || !v35) {
            goto LABEL_37;
          }
          uint64_t v37 = v33 - *(void *)(v28 + 96 * v29 + 8);
          uint64_t v38 = v53;
          if ((v55 & (v53 >= v37)) == 0) {
            uint64_t v38 = v37;
          }
          if (v38 != v19)
          {
            uint64_t v53 = v38;
            std::deque<std::__state<char>>::pop_back(&v61);
            char v55 = 1;
            goto LABEL_38;
          }
          __int16 v39 = (void **)*((void *)&v61 + 1);
          uint64_t v40 = v62;
          if ((void)v62 == *((void *)&v61 + 1))
          {
            uint64_t v40 = *((void *)&v61 + 1);
          }
          else
          {
            __int16 v41 = (void *)(*((void *)&v61 + 1) + 8 * ((unint64_t)v63 / 0x2A));
            int v42 = (void *)(*v41 + 96 * ((unint64_t)v63 % 0x2A));
            unint64_t v43 = *(void *)(*((void *)&v61 + 1) + 8 * ((*((void *)&v63 + 1) + (void)v63) / 0x2AuLL))
                + 96 * ((*((void *)&v63 + 1) + (void)v63) % 0x2AuLL);
            if (v42 != (void *)v43)
            {
              do
              {
                std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)&v63 + 8, v42);
                v42 += 12;
                if ((void *)((char *)v42 - *v41) == (void *)4032)
                {
                  int v44 = (void *)v41[1];
                  ++v41;
                  int v42 = v44;
                }
              }
              while (v42 != (void *)v43);
              __int16 v39 = (void **)*((void *)&v61 + 1);
              uint64_t v40 = v62;
            }
          }
          *((void *)&v63 + 1) = 0;
          unint64_t v47 = v40 - (void)v39;
          if (v47 >= 0x11)
          {
            do
            {
              operator delete(*v39);
              __int16 v39 = (void **)(*((void *)&v61 + 1) + 8);
              *((void *)&v61 + 1) = v39;
              unint64_t v47 = v62 - (void)v39;
            }
            while ((void)v62 - (void)v39 > 0x10uLL);
          }
          if (v47 >> 3 == 1)
          {
            uint64_t v48 = 21;
          }
          else
          {
            if (v47 >> 3 != 2) {
              goto LABEL_53;
            }
            uint64_t v48 = 42;
          }
          *(void *)&long long v63 = v48;
LABEL_53:
          char v55 = 1;
          uint64_t v53 = v19;
LABEL_38:
          uint64_t v20 = *((void *)&v63 + 1);
          if (*((void *)&v63 + 1)) {
            continue;
          }
          if ((v55 & 1) == 0) {
            goto LABEL_56;
          }
          uint64_t v49 = *v52;
          *(void *)uint64_t v49 = v54;
          *(void *)(v49 + 8) = v54 + v53;
          uint64_t v50 = 1;
          *(unsigned char *)(v49 + 16) = 1;
          break;
        case 0xFFFFFC19:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_38;
        case 0xFFFFFC1D:
          std::deque<std::__state<char>>::push_front((uint64_t)&v61, v28 + 96 * v29);
          goto LABEL_37;
        case 0xFFFFFC1F:
LABEL_37:
          std::deque<std::__state<char>>::pop_back(&v61);
          goto LABEL_38;
        case 0xFFFFFC20:
          long long v45 = *(_OWORD *)(v30 + 16);
          *(_OWORD *)int v57 = *(_OWORD *)v30;
          *(_OWORD *)&v57[16] = v45;
          long long v58 = 0uLL;
          *(void *)&v57[32] = 0;
          std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v57[32], *(long long **)(v28 + 96 * v29 + 32), *(long long **)(v28 + 96 * v29 + 40), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v28 + 96 * v29 + 40) - *(void *)(v28 + 96 * v29 + 32)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v60[0] = 0;
          std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *(long long **)(v28 + 96 * v29 + 56), *(long long **)(v28 + 96 * v29 + 64), (uint64_t)(*(void *)(v28 + 96 * v29 + 64) - *(void *)(v28 + 96 * v29 + 56)) >> 4);
          uint64_t v46 = *v32;
          *(void *)((char *)&v60[1] + 5) = *(void *)(v30 + 85);
          v60[1] = v46;
          (*(void (**)(void, uint64_t, unint64_t))(*(void *)*v32 + 24))(*v32, 1, v28 + 96 * v29);
          (*(void (**)(void, void, unsigned char *))(*(void *)v60[1] + 24))(v60[1], 0, v57);
          std::deque<std::__state<char>>::push_back(&v61, (uint64_t)v57);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          if (*(void *)&v57[32])
          {
            *(void *)&long long v58 = *(void *)&v57[32];
            operator delete(*(void **)&v57[32]);
          }
          goto LABEL_38;
        default:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
      }
      break;
    }
  }
  else
  {
LABEL_56:
    uint64_t v50 = 0;
  }
  std::deque<std::__state<char>>::~deque[abi:ne180100](&v61);
  return v50;
}

void sub_26388BC64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22)
{
  std::deque<std::__state<char>>::~deque[abi:ne180100]((void *)(v22 - 144));
  _Unwind_Resume(a1);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v54 = 0;
  char v55 = 0;
  v56[0] = 0;
  *(_DWORD *)uint64_t v51 = 0;
  memset(&v51[8], 0, 32);
  long long v52 = 0u;
  memset(v53, 0, 37);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    __x.first = a3;
    __x.second = a3;
    __x.matched = 0;
    *(_DWORD *)unint64_t v47 = 0;
    memset(&v47[8], 0, 48);
    *(_OWORD *)std::match_results<const char *> __p = 0uLL;
    memset(v49, 0, 21);
    char v55 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v54, (uint64_t)v47);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(void *)&v47[32])
    {
      *(void *)&v47[40] = *(void *)&v47[32];
      operator delete(*(void **)&v47[32]);
    }
    int v42 = a4;
    unsigned int v11 = v55;
    *((_DWORD *)v55 - 24) = 0;
    *((void *)v11 - 11) = a2;
    *((void *)v11 - 1pthread_mutex_init(this, 0) = a2;
    *((void *)v11 - 9) = a3;
    std::vector<std::sub_match<char const*>>::resize((std::vector<std::csub_match> *)(v11 - 4), *(unsigned int *)(a1 + 28), &__x);
    std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)((char *)v55 - 40), *(unsigned int *)(a1 + 32));
    unint64_t v43 = a3;
    int v44 = 0;
    char v12 = 0;
    unsigned int v13 = 0;
    unint64_t v14 = (const char *)(a3 - a2);
    uint64_t v15 = v55;
    *((void *)v55 - 2) = v6;
    *((_DWORD *)v15 - 2) = a5;
    *((unsigned char *)v15 - 4) = a6;
    do
    {
      BOOL v16 = (++v13 & 0xFFF) != 0 || (int)(v13 >> 12) < (int)v14;
      if (!v16) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
      }
      unsigned int v18 = v15 - 1;
      uint64_t v17 = *((void *)v15 - 2);
      uint64_t v19 = v15 - 6;
      if (v17) {
        (*(void (**)(uint64_t, _OWORD *))(*(void *)v17 + 16))(v17, v15 - 6);
      }
      switch(*(_DWORD *)v19)
      {
        case 0xFFFFFC18:
          uint64_t v20 = (const char *)*((void *)v15 - 10);
          if ((a5 & 0x20) != 0 && v20 == a2 || (a5 & 0x1000) != 0 && v20 != v43) {
            goto LABEL_19;
          }
          char v27 = v12;
          uint64_t v28 = &v20[-*((void *)v15 - 11)];
          unint64_t v29 = v44;
          if ((v27 & ((uint64_t)v44 >= (uint64_t)v28)) == 0)
          {
            long long v30 = *(v15 - 5);
            *(_OWORD *)uint64_t v51 = *(_OWORD *)v19;
            *(_OWORD *)&v51[16] = v30;
            if (v51 != v19)
            {
              std::vector<std::sub_match<char const*>>::__assign_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v51[32], *((long long **)v15 - 8), *((long long **)v15 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v15 - 7) - *((void *)v15 - 8)) >> 3));
              std::vector<std::pair<unsigned long,char const*>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(v53, *((uint64_t **)v15 - 5), *((uint64_t **)v15 - 4), (uint64_t)(*((void *)v15 - 4) - *((void *)v15 - 5)) >> 4);
            }
            uint64_t v31 = (void *)*v18;
            *(void **)((char *)&v53[3] + 5) = *(void **)((char *)v15 - 11);
            v53[3] = v31;
            unint64_t v29 = v28;
          }
          char v32 = v55;
          if (v29 == v14)
          {
            uint64_t v33 = (uint64_t)v54;
            while (v32 != (void *)v33)
            {
              v32 -= 12;
              std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)v56, v32);
            }
            char v55 = (_OWORD *)v33;
            char v12 = 1;
            int v44 = v14;
          }
          else
          {
            int v44 = v29;
            unint64_t v34 = v55 - 6;
            std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)v56, (void *)v55 - 12);
            char v55 = v34;
            char v12 = 1;
          }
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          break;
        case 0xFFFFFC1F:
LABEL_19:
          uint64_t v21 = v55 - 6;
          std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)v56, (void *)v55 - 12);
          char v55 = v21;
          break;
        case 0xFFFFFC20:
          long long v22 = *(v15 - 5);
          *(_OWORD *)unint64_t v47 = *(_OWORD *)v19;
          *(_OWORD *)&v47[16] = v22;
          memset(&v47[32], 0, 24);
          std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v47[32], *((long long **)v15 - 8), *((long long **)v15 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v15 - 7) - *((void *)v15 - 8)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v49[0] = 0;
          std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *((long long **)v15 - 5), *((long long **)v15 - 4), (uint64_t)(*((void *)v15 - 4) - *((void *)v15 - 5)) >> 4);
          unint64_t v23 = (void *)*v18;
          *(void *)((char *)&v49[1] + 5) = *(void *)((char *)v15 - 11);
          v49[1] = v23;
          (*(void (**)(void, uint64_t, _OWORD *))(*(void *)*v18 + 24))(*v18, 1, v15 - 6);
          (*(void (**)(void, void, unsigned char *))(*(void *)v49[1] + 24))(v49[1], 0, v47);
          unint64_t v24 = v55;
          if ((unint64_t)v55 >= v56[0])
          {
            char v55 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v54, (uint64_t)v47);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            long long v25 = *(_OWORD *)&v47[16];
            *char v55 = *(_OWORD *)v47;
            v24[1] = v25;
            *((void *)v24 + 4) = 0;
            *((void *)v24 + 5) = 0;
            *((void *)v24 + 6) = 0;
            *((void *)v24 + 7) = 0;
            unint64_t v24[2] = *(_OWORD *)&v47[32];
            *((void *)v24 + 6) = *(void *)&v47[48];
            memset(&v47[32], 0, 24);
            *((void *)v24 + 8) = 0;
            *((void *)v24 + 9) = 0;
            *(_OWORD *)((char *)v24 + 56) = *(_OWORD *)__p;
            *((void *)v24 + 9) = v49[0];
            __p[0] = 0;
            __p[1] = 0;
            v49[0] = 0;
            uint64_t v26 = v49[1];
            *(void *)((char *)v24 + 85) = *(void *)((char *)&v49[1] + 5);
            *((void *)v24 + 1pthread_mutex_init(this, 0) = v26;
            char v55 = v24 + 6;
          }
          if (*(void *)&v47[32])
          {
            *(void *)&v47[40] = *(void *)&v47[32];
            operator delete(*(void **)&v47[32]);
          }
          break;
        default:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
      }
      uint64_t v15 = v55;
    }
    while (v54 != v55);
    if (v12)
    {
      uint64_t v35 = *v42;
      *(void *)uint64_t v35 = a2;
      *(void *)(v35 + 8) = &v44[(void)a2];
      *(unsigned char *)(v35 + 16) = 1;
      if ((void)v52 != *(void *)&v51[32])
      {
        unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v52 - *(void *)&v51[32]) >> 3);
        uint64_t v37 = (unsigned char *)(*(void *)&v51[32] + 16);
        unsigned int v38 = 1;
        do
        {
          uint64_t v39 = v35 + 24 * v38;
          *(_OWORD *)uint64_t v39 = *((_OWORD *)v37 - 1);
          char v40 = *v37;
          v37 += 24;
          *(unsigned char *)(v39 + 16) = v40;
          BOOL v16 = v36 > v38++;
        }
        while (v16);
      }
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  if (v53[0])
  {
    v53[1] = v53[0];
    operator delete(v53[0]);
  }
  if (*(void *)&v51[32])
  {
    *(void *)&long long v52 = *(void *)&v51[32];
    operator delete(*(void **)&v51[32]);
  }
  *(void *)uint64_t v51 = &v54;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)v51);
  return v6;
}

void sub_26388C21C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  std::__state<char>::~__state(&a17);
  std::__state<char>::~__state(&a33);
  a33 = v33 - 120;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a33);
  _Unwind_Resume(a1);
}

__n128 std::deque<std::__state<char>>::push_back(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  uint64_t v6 = 42 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    std::deque<std::__state<char>>::__add_back_capacity(a1);
    uint64_t v5 = a1[1];
    unint64_t v7 = a1[5] + a1[4];
  }
  unint64_t v8 = *(void *)(v5 + 8 * (v7 / 0x2A)) + 96 * (v7 % 0x2A);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)unint64_t v8 = *(_OWORD *)a2;
  *(_OWORD *)(v8 + 16) = v9;
  *(void *)(v8 + 4pthread_mutex_init(this, 0) = 0;
  *(void *)(v8 + 48) = 0;
  *(void *)(v8 + 32) = 0;
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(v8 + 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 4pthread_mutex_init(this, 0) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(v8 + 56) = 0;
  *(void *)(v8 + 64) = 0;
  *(void *)(v8 + 72) = 0;
  __n128 result = *(__n128 *)(a2 + 56);
  *(__n128 *)(v8 + 56) = result;
  *(void *)(v8 + 72) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  uint64_t v11 = *(void *)(a2 + 80);
  *(void *)(v8 + 85) = *(void *)(a2 + 85);
  *(void *)(v8 + 8pthread_mutex_init(this, 0) = v11;
  ++a1[5];
  return result;
}

uint64_t std::deque<std::__state<char>>::pop_back(void *a1)
{
  unsigned int v2 = a1 + 5;
  unint64_t v3 = a1[5] + a1[4] - 1;
  std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)(a1 + 5), (void *)(*(void *)(a1[1] + 8 * (v3 / 0x2A)) + 96 * (v3 % 0x2A)));
  --*v2;

  return std::deque<std::__state<char>>::__maybe_remove_back_spare[abi:ne180100](a1, 1);
}

int64x2_t std::deque<std::__state<char>>::push_front(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
    std::deque<std::__state<char>>::__add_front_capacity((void **)a1);
    unint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = (void *)(v5 + 8 * (v4 / 0x2A));
  uint64_t v7 = *v6 + 96 * (v4 % 0x2A);
  if (*(void *)(a1 + 16) == v5) {
    uint64_t v7 = 0;
  }
  if (v7 == *v6) {
    uint64_t v7 = *(v6 - 1) + 4032;
  }
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v7 - 96) = *(_OWORD *)a2;
  *(_OWORD *)(v7 - 8pthread_mutex_init(this, 0) = v8;
  *(void *)(v7 - 56) = 0;
  *(void *)(v7 - 48) = 0;
  *(void *)(v7 - 64) = 0;
  *(_OWORD *)(v7 - 64) = *(_OWORD *)(a2 + 32);
  *(void *)(v7 - 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 4pthread_mutex_init(this, 0) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(v7 - 4pthread_mutex_init(this, 0) = 0;
  *(void *)(v7 - 32) = 0;
  *(void *)(v7 - 24) = 0;
  *(_OWORD *)(v7 - 4pthread_mutex_init(this, 0) = *(_OWORD *)(a2 + 56);
  *(void *)(v7 - 24) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  uint64_t v9 = *(void *)(a2 + 80);
  *(void *)(v7 - 11) = *(void *)(a2 + 85);
  *(void *)(v7 - 16) = v9;
  int64x2_t result = vaddq_s64(*(int64x2_t *)(a1 + 32), (int64x2_t)xmmword_263892280);
  *(int64x2_t *)(a1 + 32) = result;
  return result;
}

void std::deque<std::__state<char>>::__add_back_capacity(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x2A;
  unint64_t v4 = v2 - 42;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    long long v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)long long v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      unint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>(v5, v33);
      uint64_t v35 = &v34[8 * (v33 >> 2)];
      uint64_t v37 = &v34[8 * v36];
      unsigned int v38 = (uint64_t *)a1[1];
      long long v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        long long v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        __int16 v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)__int16 v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    uint64_t v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      uint64_t v9 = (char *)a1[1];
    }
    long long v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0xFC0uLL);
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &v54);
    int v44 = (void *)a1[1];
    long long v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    uint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      unint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>((uint64_t)(a1 + 3), v46);
      uint64_t v35 = &v34[8 * (v46 >> 2)];
      uint64_t v37 = &v34[8 * v47];
      uint64_t v48 = (uint64_t *)a1[1];
      long long v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        long long v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        uint64_t v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)uint64_t v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      unint64_t v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        long long v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  BOOL v56 = a1 + 3;
  *(void *)&long long v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  uint64_t v53 = operator new(0xFC0uLL);
  std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_back(&v54, &v53);
  char v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_front((uint64_t)&v54, v27);
  }
  unint64_t v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_26388C7FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    uint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      char v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }
      uint64_t v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)uint64_t v6 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    uint64_t v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_back(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_front(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = (v7 - v4) >> 2;
      }
      uint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      unint64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        unint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

uint64_t std::deque<std::__state<char>>::__maybe_remove_back_spare[abi:ne180100](void *a1, int a2)
{
  uint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  if (v2 == v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 42 * ((v2 - v3) >> 3) - 1;
  }
  unint64_t v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x2A) {
    a2 = 1;
  }
  if (v5 < 0x54) {
    int v7 = a2;
  }
  else {
    int v7 = 0;
  }
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8;
  }
  return v7 ^ 1u;
}

void std::deque<std::__state<char>>::__add_front_capacity(void **a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  unint64_t v4 = (v3 - v2) >> 3;
  if (v3 == v2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 42 * v4 - 1;
  }
  uint64_t v6 = (char *)a1[4];
  if (v5 - (unint64_t)&v6[(void)a1[5]] < 0x2A)
  {
    uint64_t v7 = (uint64_t)(a1 + 3);
    uint64_t v8 = a1[3];
    uint64_t v9 = *a1;
    uint64_t v10 = v8 - (unsigned char *)*a1;
    if (v4 >= v10 >> 3)
    {
      if (v8 == v9) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = v10 >> 2;
      }
      unint64_t v46 = a1 + 3;
      std::match_results<const char *> __p = std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>(v7, v11);
      unint64_t v43 = (char *)__p;
      int v44 = (char *)__p;
      uint64_t v45 = (char *)__p + 8 * v12;
      __int16 v41 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_back(&__p, &v41);
      uint64_t v13 = (char *)a1[1];
      uint64_t v14 = v44;
      if (v13 == a1[2])
      {
        unint64_t v33 = (char *)a1[1];
      }
      else
      {
        do
        {
          if (v14 == v45)
          {
            int64_t v15 = v43 - (unsigned char *)__p;
            if (v43 <= __p)
            {
              if (v14 == __p) {
                unint64_t v23 = 1;
              }
              else {
                unint64_t v23 = (v14 - (unsigned char *)__p) >> 2;
              }
              uint64_t v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>((uint64_t)v46, v23);
              uint64_t v26 = v43;
              uint64_t v14 = &v24[8 * (v23 >> 2)];
              uint64_t v27 = v44 - v43;
              if (v44 != v43)
              {
                uint64_t v14 = &v24[8 * (v23 >> 2) + (v27 & 0xFFFFFFFFFFFFFFF8)];
                uint64_t v28 = 8 * (v27 >> 3);
                unint64_t v29 = &v24[8 * (v23 >> 2)];
                do
                {
                  uint64_t v30 = *(void *)v26;
                  v26 += 8;
                  *(void *)unint64_t v29 = v30;
                  v29 += 8;
                  v28 -= 8;
                }
                while (v28);
              }
              long long v31 = __p;
              std::match_results<const char *> __p = v24;
              unint64_t v43 = &v24[8 * (v23 >> 2)];
              int v44 = v14;
              uint64_t v45 = &v24[8 * v25];
              if (v31)
              {
                operator delete(v31);
                uint64_t v14 = v44;
              }
            }
            else
            {
              uint64_t v16 = v15 >> 3;
              BOOL v17 = v15 >> 3 < -1;
              uint64_t v18 = (v15 >> 3) + 2;
              if (v17) {
                uint64_t v19 = v18;
              }
              else {
                uint64_t v19 = v16 + 1;
              }
              uint64_t v20 = &v43[-8 * (v19 >> 1)];
              int64_t v21 = v14 - v43;
              if (v14 != v43)
              {
                memmove(&v43[-8 * (v19 >> 1)], v43, v14 - v43);
                uint64_t v14 = v43;
              }
              uint64_t v22 = &v14[-8 * (v19 >> 1)];
              uint64_t v14 = &v20[v21];
              unint64_t v43 = v22;
              int v44 = &v20[v21];
            }
          }
          uint64_t v32 = *(void *)v13;
          v13 += 8;
          *(void *)uint64_t v14 = v32;
          uint64_t v14 = v44 + 8;
          v44 += 8;
        }
        while (v13 != a1[2]);
        unint64_t v33 = (char *)a1[1];
      }
      uint64_t v36 = *a1;
      uint64_t v37 = v43;
      *a1 = __p;
      a1[1] = v37;
      std::match_results<const char *> __p = v36;
      unint64_t v43 = v33;
      unsigned int v38 = (char *)a1[3];
      uint64_t v39 = v45;
      a1[2] = v14;
      a1[3] = v39;
      int v44 = v13;
      uint64_t v45 = v38;
      if (v14 - v37 == 8) {
        uint64_t v40 = 21;
      }
      else {
        uint64_t v40 = (uint64_t)a1[4] + 42;
      }
      a1[4] = (void *)v40;
      if (v13 != v33) {
        int v44 = &v13[(v33 - v13 + 7) & 0xFFFFFFFFFFFFFFF8];
      }
      if (v36) {
        operator delete(v36);
      }
    }
    else
    {
      if (v2 == v9)
      {
        std::match_results<const char *> __p = operator new(0xFC0uLL);
        std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(a1, &__p);
        unint64_t v34 = a1[2];
        std::match_results<const char *> __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }
      else
      {
        std::match_results<const char *> __p = operator new(0xFC0uLL);
      }
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &__p);
      if ((unsigned char *)a1[2] - (unsigned char *)a1[1] == 8) {
        uint64_t v35 = 21;
      }
      else {
        uint64_t v35 = (uint64_t)a1[4] + 42;
      }
      a1[4] = (void *)v35;
    }
  }
  else
  {
    a1[4] = v6 + 42;
    std::match_results<const char *> __p = (void *)*((void *)v3 - 1);
    a1[2] = v3 - 8;
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &__p);
  }
}

void sub_26388CFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  operator delete(v12);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t std::deque<std::__state<char>>::~deque[abi:ne180100](void *a1)
{
  uint64_t v2 = a1 + 5;
  uint64_t v3 = (void **)a1[1];
  unint64_t v4 = (void **)a1[2];
  if (v4 == v3)
  {
    unint64_t v4 = (void **)a1[1];
  }
  else
  {
    unint64_t v5 = a1[4];
    uint64_t v6 = &v3[v5 / 0x2A];
    uint64_t v7 = (char *)*v6 + 96 * (v5 % 0x2A);
    unint64_t v8 = (unint64_t)v3[(a1[5] + v5) / 0x2A] + 96 * ((a1[5] + v5) % 0x2A);
    if (v7 != (char *)v8)
    {
      do
      {
        std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)v2, v7);
        v7 += 96;
        if (v7 - (unsigned char *)*v6 == 4032)
        {
          uint64_t v9 = (char *)v6[1];
          ++v6;
          uint64_t v7 = v9;
        }
      }
      while (v7 != (char *)v8);
      uint64_t v3 = (void **)a1[1];
      unint64_t v4 = (void **)a1[2];
    }
  }
  *uint64_t v2 = 0;
  unint64_t v10 = (char *)v4 - (char *)v3;
  if ((unint64_t)((char *)v4 - (char *)v3) >= 0x11)
  {
    do
    {
      operator delete(*v3);
      unint64_t v4 = (void **)a1[2];
      uint64_t v3 = (void **)(a1[1] + 8);
      a1[1] = v3;
      unint64_t v10 = (char *)v4 - (char *)v3;
    }
    while ((unint64_t)((char *)v4 - (char *)v3) > 0x10);
  }
  unint64_t v11 = v10 >> 3;
  if (v11 == 1)
  {
    uint64_t v12 = 21;
  }
  else
  {
    if (v11 != 2) {
      goto LABEL_16;
    }
    uint64_t v12 = 42;
  }
  a1[4] = v12;
LABEL_16:
  while (v3 != v4)
  {
    uint64_t v13 = *v3++;
    operator delete(v13);
  }

  return std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

char *std::vector<std::sub_match<char const*>>::__assign_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(void *a1, long long *a2, long long *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = a1[2];
  int64x2_t result = (char *)*a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 3) >= a4)
  {
    uint64_t v19 = (char *)a1[1];
    uint64_t v14 = a1 + 1;
    uint64_t v13 = v19;
    unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((v19 - result) >> 3);
    if (v20 >= a4)
    {
      uint64_t v25 = result;
      if (a2 != a3)
      {
        uint64_t v26 = result;
        do
        {
          *(_OWORD *)uint64_t v26 = *v6;
          v26[16] = *((unsigned char *)v6 + 16);
          v25 += 24;
          uint64_t v6 = (long long *)((char *)v6 + 24);
          v26 += 24;
        }
        while (v6 != a3);
      }
      int64_t v18 = v25 - result;
      uint64_t v13 = result;
    }
    else
    {
      int64_t v21 = (long long *)((char *)a2 + 24 * v20);
      if (v13 != result)
      {
        do
        {
          *(_OWORD *)int64x2_t result = *v6;
          result[16] = *((unsigned char *)v6 + 16);
          uint64_t v6 = (long long *)((char *)v6 + 24);
          result += 24;
        }
        while (v6 != v21);
      }
      uint64_t v22 = v13;
      if (v21 != a3)
      {
        unint64_t v23 = v13;
        do
        {
          long long v24 = *v21;
          *((void *)v23 + 2) = *((void *)v21 + 2);
          *(_OWORD *)unint64_t v23 = v24;
          v23 += 24;
          int64_t v21 = (long long *)((char *)v21 + 24);
          v22 += 24;
        }
        while (v21 != a3);
      }
      int64_t v18 = v22 - v13;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= a4) {
      uint64_t v11 = a4;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v11;
    }
    int64x2_t result = std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](a1, v12);
    int64_t v15 = (char *)a1[1];
    uint64_t v14 = a1 + 1;
    uint64_t v13 = v15;
    uint64_t v16 = v15;
    if (v6 != a3)
    {
      uint64_t v16 = v13;
      do
      {
        long long v17 = *v6;
        *((void *)v16 + 2) = *((void *)v6 + 2);
        *(_OWORD *)uint64_t v16 = v17;
        v16 += 24;
        uint64_t v6 = (long long *)((char *)v6 + 24);
      }
      while (v6 != a3);
    }
    int64_t v18 = v16 - v13;
  }
  *uint64_t v14 = &v13[v18];
  return result;
}

char *std::vector<std::pair<unsigned long,char const*>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(void *a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = a1[2];
  int64x2_t result = (char *)*a1;
  if (a4 <= (v8 - (uint64_t)result) >> 4)
  {
    int64_t v18 = (char *)a1[1];
    uint64_t v13 = a1 + 1;
    unint64_t v12 = v18;
    unint64_t v19 = (v18 - result) >> 4;
    if (v19 >= a4)
    {
      uint64_t v26 = result;
      if (a2 != a3)
      {
        uint64_t v27 = result;
        do
        {
          uint64_t v28 = *v6;
          uint64_t v29 = v6[1];
          v6 += 2;
          *(void *)uint64_t v27 = v28;
          *((void *)v27 + 1) = v29;
          v27 += 16;
          v26 += 16;
        }
        while (v6 != a3);
      }
      long long v17 = (char *)(v26 - result);
      unint64_t v12 = result;
    }
    else
    {
      unint64_t v20 = (long long *)&a2[2 * v19];
      if (v12 != result)
      {
        do
        {
          uint64_t v21 = *v6;
          uint64_t v22 = v6[1];
          v6 += 2;
          *(void *)int64x2_t result = v21;
          *((void *)result + 1) = v22;
          result += 16;
        }
        while (v6 != (uint64_t *)v20);
      }
      unint64_t v23 = v12;
      if (v20 != (long long *)a3)
      {
        long long v24 = v12;
        do
        {
          long long v25 = *v20++;
          *(_OWORD *)long long v24 = v25;
          v24 += 16;
          v23 += 16;
        }
        while (v20 != (long long *)a3);
      }
      long long v17 = (char *)(v23 - v12);
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 >> 60) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 3;
    if (v8 >> 3 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    int64x2_t result = std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](a1, v11);
    uint64_t v14 = (char *)a1[1];
    uint64_t v13 = a1 + 1;
    unint64_t v12 = v14;
    int64_t v15 = v14;
    if (v6 != a3)
    {
      int64_t v15 = v12;
      do
      {
        long long v16 = *(_OWORD *)v6;
        v6 += 2;
        *(_OWORD *)int64_t v15 = v16;
        v15 += 16;
      }
      while (v6 != a3);
    }
    long long v17 = (char *)(v15 - v12);
  }
  *uint64_t v13 = &v17[(void)v12];
  return result;
}

void std::vector<std::sub_match<std::__wrap_iter<char const*>>>::resize(std::vector<std::ssub_match> *this, std::vector<std::ssub_match>::size_type __sz)
{
  std::vector<std::ssub_match>::size_type v2 = 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3);
  BOOL v3 = __sz >= v2;
  std::vector<std::ssub_match>::size_type v4 = __sz - v2;
  if (v4 != 0 && v3)
  {
    std::vector<std::sub_match<std::__wrap_iter<char const*>>>::__append(this, v4);
  }
  else if (!v3)
  {
    this->__end_ = &this->__begin_[__sz];
  }
}

void std::vector<std::sub_match<std::__wrap_iter<char const*>>>::__append(std::vector<std::ssub_match> *this, std::vector<std::ssub_match>::size_type __n)
{
  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  unint64_t v5 = value;
  uint64_t v7 = p_end_cap[-1].__value_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)v7) >> 3) >= __n)
  {
    if (__n)
    {
      uint64_t v13 = &v7[__n];
      std::vector<std::ssub_match>::size_type v14 = 24 * __n;
      do
      {
        v7->first.__i_ = 0;
        v7->second.__i_ = 0;
        v7->matched = 0;
        ++v7;
        v14 -= 24;
      }
      while (v14);
      uint64_t v7 = v13;
    }
    this->__end_ = v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v7 - (char *)this->__begin_) >> 3);
    unint64_t v9 = v8 + __n;
    if (v8 + __n > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (char *)this->__begin_) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      unint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>((uint64_t)p_end_cap, v11);
    }
    else {
      unint64_t v12 = 0;
    }
    int64_t v15 = (std::sub_match<std::__wrap_iter<const char *>> *)&v12[24 * v8];
    long long v16 = &v15[__n];
    std::vector<std::ssub_match>::size_type v17 = 24 * __n;
    int64_t v18 = v15;
    do
    {
      v18->first.__i_ = 0;
      v18->second.__i_ = 0;
      v18->matched = 0;
      ++v18;
      v17 -= 24;
    }
    while (v17);
    unint64_t v19 = (std::sub_match<std::__wrap_iter<const char *>> *)&v12[24 * v11];
    std::vector<std::ssub_match>::pointer begin = this->__begin_;
    std::vector<std::ssub_match>::pointer end = this->__end_;
    if (end != this->__begin_)
    {
      do
      {
        std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>> v22 = end[-1].std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>>;
        *(void *)&v15[-1].matched = *(void *)&end[-1].matched;
        v15[-1].std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>> = v22;
        --v15;
        --end;
      }
      while (end != begin);
      std::vector<std::ssub_match>::pointer end = this->__begin_;
    }
    this->__begin_ = v15;
    this->__end_ = v16;
    this->__end_cap_.__value_ = v19;
    if (end)
    {
      operator delete(end);
    }
  }
}

uint64_t __cxx_global_var_init_6()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_263869000);
  }
  return result;
}

char *BBUReturnAsString(int a1)
{
  return BBUReturnAsString::BBUReturnStrings[a1];
}

uint64_t ErrnoToBBUReturn(int a1)
{
  if (a1 == 35) {
    return 13;
  }
  else {
    return 3;
  }
}

unint64_t BBULogModuleEnabled(char a1)
{
  return ((unint64_t)sLogInternalMask >> a1) & 1;
}

uint64_t gBBULogMaskGet(void)
{
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_0);
  }
  return gBBULogMaskGet(void)::sBBULogMask;
}

void *___Z14gBBULogMaskGetv_block_invoke()
{
  uint64_t result = operator new(8uLL);
  *uint64_t result = sLogInternalMask;
  gBBULogMaskGet(void)::sBBULogMasunint64_t k = (uint64_t)result;
  return result;
}

void BBULogSetMask(unsigned int a1)
{
  uint64_t v1 = a1;
  sLogInternalMasunint64_t k = a1;
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_0);
  }
  *(void *)gBBULogMaskGet(void)::sBBULogMasunint64_t k = v1;
}

uint64_t BBULogSetVerbosity(uint64_t result)
{
  gBBULogVerbosity = result;
  return result;
}

void BBULogSetExtraVerbosity(unsigned int a1)
{
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_0);
  }
  if (a1 >= 7 && (*(void *)gBBULogMaskGet(void)::sBBULogMask & 0x40) != 0)
  {
    MEMORY[0x270F97180](12);
  }
}

uint64_t _BBULogv(int a1, uint64_t a2, const char *a3, const char *a4, const char *a5, va_list a6)
{
  if (gLockGet(void)::once != -1) {
    dispatch_once(&gLockGet(void)::once, &__block_literal_global_42);
  }
  unint64_t v11 = (pthread_mutex_t *)gLockGet(void)::_gLock;
  BBUpdaterCommon::BBUMutex::lock((pthread_mutex_t *)gLockGet(void)::_gLock);
  if (sLogBufferGet(void)::once != -1) {
    dispatch_once(&sLogBufferGet(void)::once, &__block_literal_global_46);
  }
  if (*(void *)sLogBufferGet(void)::sLogBuffer || (((unint64_t)sLogInternalMask >> a1) & 1) != 0)
  {
    vsnprintf(gTempLogBuffer, 0x400uLL, a5, a6);
    gettimeofday(&v39, 0);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v36);
    unint64_t v12 = (void *)std::ostream::operator<<();
    LOBYTE(__p[0]) = 46;
    uint64_t v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)__p, 1);
    *(void *)((char *)v13 + *(void *)(*v13 - 24) + 24) = 3;
    char v35 = 48;
    std::operator<<[abi:ne180100]<std::char_traits<char>>(v13, &v35);
    std::vector<std::ssub_match>::size_type v14 = (void *)std::ostream::operator<<();
    *(void *)((char *)v14 + *(void *)(*v14 - 24) + 24) = 1;
    LOBYTE(__p[0]) = 91;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)__p, 1);
    int64_t v15 = (void *)std::ostream::operator<<();
    LOBYTE(__p[0]) = 46;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)__p, 1);
    long long v16 = (void *)std::ostream::operator<<();
    LOBYTE(__p[0]) = 93;
    std::vector<std::ssub_match>::size_type v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)__p, 1);
    size_t v18 = strlen(a3);
    unint64_t v19 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)a3, v18);
    unint64_t v20 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)"::", 2);
    size_t v21 = strlen(a4);
    std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>> v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)a4, v21);
    unint64_t v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)": ", 2);
    size_t v24 = strlen(gTempLogBuffer);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)gTempLogBuffer, v24);
    std::stringbuf::str();
    if (sLogBufferGet(void)::once != -1) {
      dispatch_once(&sLogBufferGet(void)::once, &__block_literal_global_46);
    }
    if (*(void *)sLogBufferGet(void)::sLogBuffer)
    {
      if ((v34 & 0x80u) == 0) {
        long long v25 = __p;
      }
      else {
        long long v25 = (void **)__p[0];
      }
      if ((v34 & 0x80u) == 0) {
        unint64_t v26 = v34;
      }
      else {
        unint64_t v26 = (unint64_t)__p[1];
      }
      (*(void (**)(void, void **, unint64_t))(**(void **)sLogBufferGet(void)::sLogBuffer + 24))(*(void *)sLogBufferGet(void)::sLogBuffer, v25, v26);
    }
    if (((unint64_t)sLogInternalMask >> a1))
    {
      if (gBBULogSinkFunc)
      {
        if ((v34 & 0x80u) == 0) {
          uint64_t v27 = __p;
        }
        else {
          uint64_t v27 = (void **)__p[0];
        }
        gBBULogSinkFunc(gBBULogSinkContext, (1 << a1), v27);
      }
      else
      {
        Streaunint64_t m = (FILE *)_BBULogGetStream(a1);
        if ((v34 & 0x80u) == 0) {
          uint64_t v29 = __p;
        }
        else {
          uint64_t v29 = (void **)__p[0];
        }
        fputs((const char *)v29, Stream);
        fflush(Stream);
        uint64_t v30 = (FILE **)MEMORY[0x263EF8358];
        if (Stream != (FILE *)*MEMORY[0x263EF8358])
        {
          if ((v34 & 0x80u) == 0) {
            long long v31 = __p;
          }
          else {
            long long v31 = (void **)__p[0];
          }
          fputs((const char *)v31, (FILE *)*MEMORY[0x263EF8358]);
          fflush(*v30);
        }
      }
    }
    if ((char)v34 < 0) {
      operator delete(__p[0]);
    }
    v36[0] = *MEMORY[0x263F8C2C8];
    *(void *)((char *)v36 + *(void *)(v36[0] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
    v36[1] = MEMORY[0x263F8C318] + 16;
    if (v37 < 0) {
      operator delete((void *)v36[9]);
    }
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x263E6CAB0](&v38);
  }
  return BBUpdaterCommon::BBUMutex::unlock(v11);
}

void sub_26388DCF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  std::ostringstream::~ostringstream((uint64_t)&a16);
  BBUpdaterCommon::BBUMutex::unlock(v16);
  _Unwind_Resume(a1);
}

uint64_t _BBULogGetStream(int a1)
{
  switch(a1)
  {
    case 0:
      if (gLogStreamsGet(void)::once != -1) {
        dispatch_once(&gLogStreamsGet(void)::once, &__block_literal_global_49);
      }
      uint64_t v1 = (uint64_t *)(gLogStreamsGet(void)::sLogStreams + 24);
      break;
    case 1:
      if (gLogStreamsGet(void)::once != -1) {
        dispatch_once(&gLogStreamsGet(void)::once, &__block_literal_global_49);
      }
      uint64_t v1 = (uint64_t *)(gLogStreamsGet(void)::sLogStreams + 32);
      break;
    case 5:
    case 6:
    case 7:
      if (gLogStreamsGet(void)::once != -1) {
        dispatch_once(&gLogStreamsGet(void)::once, &__block_literal_global_49);
      }
      uint64_t v1 = (uint64_t *)(gLogStreamsGet(void)::sLogStreams + 40);
      break;
    case 9:
    case 13:
      if (gLogStreamsGet(void)::once != -1) {
        dispatch_once(&gLogStreamsGet(void)::once, &__block_literal_global_49);
      }
      uint64_t v1 = (uint64_t *)(gLogStreamsGet(void)::sLogStreams + 48);
      break;
    case 14:
      if (gLogStreamsGet(void)::once != -1) {
        dispatch_once(&gLogStreamsGet(void)::once, &__block_literal_global_49);
      }
      uint64_t v1 = (uint64_t *)(gLogStreamsGet(void)::sLogStreams + 56);
      break;
    case 17:
      if (gLogStreamsGet(void)::once != -1) {
        dispatch_once(&gLogStreamsGet(void)::once, &__block_literal_global_49);
      }
      uint64_t v1 = (uint64_t *)(gLogStreamsGet(void)::sLogStreams + 16);
      break;
    default:
      if (gLogStreamsGet(void)::once != -1) {
        dispatch_once(&gLogStreamsGet(void)::once, &__block_literal_global_49);
      }
      uint64_t v1 = (uint64_t *)(gLogStreamsGet(void)::sLogStreams + 8);
      break;
  }
  uint64_t v2 = *v1;
  if (v2) {
    return v2;
  }
  else {
    return *MEMORY[0x263EF8358];
  }
}

uint64_t _BBULog(int a1, uint64_t a2, const char *a3, const char *a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return _BBULogv(a1, a2, a3, a4, a5, &a9);
}

uint64_t _BBULogPlain(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (gLockGet(void)::once != -1) {
    dispatch_once(&gLockGet(void)::once, &__block_literal_global_42);
  }
  unint64_t v11 = (pthread_mutex_t *)gLockGet(void)::_gLock;
  BBUpdaterCommon::BBUMutex::lock((pthread_mutex_t *)gLockGet(void)::_gLock);
  if (sLogBufferGet(void)::once != -1) {
    dispatch_once(&sLogBufferGet(void)::once, &__block_literal_global_46);
  }
  if (*(void *)sLogBufferGet(void)::sLogBuffer || (((unint64_t)sLogInternalMask >> a1) & 1) != 0)
  {
    v25[19] = &a9;
    vsnprintf(gTempLogBuffer, 0x400uLL, a2, &a9);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v23);
    if (a1 == 1) {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)"!!! ", 4);
    }
    size_t v12 = strlen(gTempLogBuffer);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)gTempLogBuffer, v12);
    std::stringbuf::str();
    if (sLogBufferGet(void)::once != -1) {
      dispatch_once(&sLogBufferGet(void)::once, &__block_literal_global_46);
    }
    if (*(void *)sLogBufferGet(void)::sLogBuffer)
    {
      if ((v22 & 0x80u) == 0) {
        uint64_t v13 = __p;
      }
      else {
        uint64_t v13 = (void **)__p[0];
      }
      if ((v22 & 0x80u) == 0) {
        unint64_t v14 = v22;
      }
      else {
        unint64_t v14 = (unint64_t)__p[1];
      }
      (*(void (**)(void, void **, unint64_t))(**(void **)sLogBufferGet(void)::sLogBuffer + 24))(*(void *)sLogBufferGet(void)::sLogBuffer, v13, v14);
    }
    if (((unint64_t)sLogInternalMask >> a1))
    {
      if (gBBULogSinkFunc)
      {
        if ((v22 & 0x80u) == 0) {
          int64_t v15 = __p;
        }
        else {
          int64_t v15 = (void **)__p[0];
        }
        gBBULogSinkFunc(gBBULogSinkContext, (1 << a1), v15);
      }
      else
      {
        Streaunint64_t m = (FILE *)_BBULogGetStream(a1);
        if ((v22 & 0x80u) == 0) {
          std::vector<std::ssub_match>::size_type v17 = __p;
        }
        else {
          std::vector<std::ssub_match>::size_type v17 = (void **)__p[0];
        }
        fputs((const char *)v17, Stream);
        fflush(Stream);
        size_t v18 = (FILE **)MEMORY[0x263EF8358];
        if (Stream != (FILE *)*MEMORY[0x263EF8358])
        {
          if ((v22 & 0x80u) == 0) {
            unint64_t v19 = __p;
          }
          else {
            unint64_t v19 = (void **)__p[0];
          }
          fputs((const char *)v19, (FILE *)*MEMORY[0x263EF8358]);
          fflush(*v18);
        }
      }
    }
    if ((char)v22 < 0) {
      operator delete(__p[0]);
    }
    v23[0] = *MEMORY[0x263F8C2C8];
    *(void *)((char *)v23 + *(void *)(v23[0] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
    v23[1] = MEMORY[0x263F8C318] + 16;
    if (v24 < 0) {
      operator delete((void *)v23[9]);
    }
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x263E6CAB0](v25);
  }
  return BBUpdaterCommon::BBUMutex::unlock(v11);
}

void sub_26388E2E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  std::ostringstream::~ostringstream((uint64_t)&a16);
  BBUpdaterCommon::BBUMutex::unlock(v16);
  _Unwind_Resume(a1);
}

uint64_t _BBULogBinary(uint64_t result, uint64_t a2, const char *a3, const char *a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8)
{
  char v38 = a7;
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (a6)
  {
    unint64_t v8 = a6;
    uint64_t v10 = result;
    unint64_t v12 = 0;
    uint64_t v13 = a2;
    BOOL v31 = (int)a2 >= 0 && a6 > 0x3E80;
    uint64_t v14 = 112;
    if (v31)
    {
      unint64_t v15 = a6 - 224;
    }
    else
    {
      uint64_t v14 = 0xFFFFFFFFLL;
      unint64_t v15 = 0;
    }
    uint64_t v36 = v14;
    unint64_t v32 = v14 + v15;
    unsigned int v33 = a2;
    unsigned int v34 = result;
    do
    {
      if (v12 == v36)
      {
        _BBULog(v10, v13, a3, a4, " -- middle of buffer snipped -- \n", a6, a7, a8, v30);
        unint64_t v12 = v32;
      }
      *(_OWORD *)&v41[16] = 0u;
      long long v42 = 0u;
      if (v8 - v12 >= 0x10) {
        uint64_t v16 = 16;
      }
      else {
        uint64_t v16 = v8 - v12;
      }
      long long v40 = 0uLL;
      *(_OWORD *)__int16 v41 = 0uLL;
      long long v39 = 0uLL;
      std::vector<std::ssub_match>::size_type v17 = a3;
      if (v16)
      {
        uint64_t v18 = (54 - 3 * v16) - 3;
        uint64_t v19 = v16;
        unint64_t v20 = (char *)&v39 + 1;
        size_t v21 = (unsigned __int8 *)(a5 + v12);
        do
        {
          unsigned int v22 = *v21++;
          char v23 = a0123456789abcd[v22 & 0xF];
          *(v20 - 1) = a0123456789abcd[(unint64_t)v22 >> 4];
          *unint64_t v20 = v23;
          v20[1] = 32;
          v20 += 3;
          v18 += 3;
          --v19;
        }
        while (v19);
        memset(v20 - 1, 32, 3 * (17 - v16));
        for (uint64_t i = 0; i != v16; ++i)
        {
          int v25 = *(unsigned __int8 *)(a5 + v12 + i);
          if ((v25 - 32) >= 0x5F) {
            LOBYTE(v25) = 46;
          }
          *((unsigned char *)&v39 + v18 + i) = v25;
        }
        int v26 = v18 + i;
        std::vector<std::ssub_match>::size_type v17 = a3;
        uint64_t v28 = v33;
        uint64_t v27 = v34;
      }
      else
      {
        uint64_t v28 = v13;
        *(_DWORD *)&v41[15] = 538976288;
        *(void *)&long long v29 = 0x2020202020202020;
        *((void *)&v29 + 1) = 0x2020202020202020;
        long long v40 = v29;
        *(_OWORD *)__int16 v41 = v29;
        int v26 = 51;
        long long v39 = v29;
        uint64_t v27 = v10;
      }
      strcpy((char *)&v39 + v26, "\r\n");
      uint64_t v10 = v27;
      uint64_t v13 = v28;
      a3 = v17;
      uint64_t result = _BBULog(v27, v28, v17, a4, "%c%04zx  %s", a6, a7, a8, v38);
      v12 += 16;
      unint64_t v8 = a6;
    }
    while (v12 < a6);
    if (v31) {
      return _BBULog(v10, v13, a3, a4, "(snipped)\n", a6, a7, a8, v30);
    }
  }
  return result;
}

uint64_t _BBULogTracer::_BBULogTracer(uint64_t a1, int a2, uint64_t a3, const char *a4, const char *a5, char *__format, ...)
{
  va_start(va, __format);
  uint64_t v17 = *MEMORY[0x263EF8340];
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a3;
  *(void *)(a1 + 8) = a4;
  *(void *)(a1 + 16) = a5;
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_0);
  }
  if (((*(void *)gBBULogMaskGet(void)::sBBULogMask >> a2) & 1) == 0)
  {
    if ((a3 & 0x80000000) == 0) {
      return a1;
    }
    goto LABEL_6;
  }
  if ((a3 & 0x80000000) != 0 || gBBULogVerbosity >= (int)a3)
  {
LABEL_6:
    vsnprintf(__str, 0x100uLL, __format, va);
    _BBULog(a2, a3, a4, a5, "ENTER: %s\n", v12, v13, v14, (char)__str);
  }
  return a1;
}

void _BBULogTracer::~_BBULogTracer(_BBULogTracer *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_0);
  }
  if (((*(void *)gBBULogMaskGet(void)::sBBULogMask >> *(_DWORD *)this) & 1) == 0)
  {
    uint64_t v9 = *((unsigned int *)this + 1);
    if ((v9 & 0x80000000) == 0) {
      return;
    }
    goto LABEL_8;
  }
  uint64_t v9 = *((unsigned int *)this + 1);
  if (gBBULogVerbosity >= (int)v9 || (v9 & 0x80000000) != 0) {
LABEL_8:
  }
    _BBULog(*(_DWORD *)this, v9, *((const char **)this + 1), *((const char **)this + 2), "EXIT:\n", a6, a7, a8, v10);
}

void BBUFDRLogHandler(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = (char)a2;
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_0);
  }
  if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) != 0 && (gBBULogVerbosity & 0x80000000) == 0) {
    _BBULog(15, 0, "BBULog", "", "Dump: %s\n", a6, a7, a8, v8);
  }
}

void BBULogParseDebugArgs(const __CFDictionary **a1)
{
  if (*a1) {
    uint64_t v1 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    uint64_t v1 = 0;
  }
  if (v1)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v16, *a1);
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(*a1, @"BasebandUpdater");
    ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v15, Value);
    ctu::cf::map_adapter::getString();
    if (SHIBYTE(v18) < 0) {
      operator delete(__p[0]);
    }
    unint64_t v18 = v14;
    *(_OWORD *)std::match_results<const char *> __p = *(_OWORD *)v13;
    std::vector<std::ssub_match>::size_type v4 = (void *)HIBYTE(v14);
    if ((v14 & 0x8000000000000000) != 0) {
      std::vector<std::ssub_match>::size_type v4 = v13[1];
    }
    if (v4)
    {
      v13[0] = 0;
      v13[1] = 0;
      unint64_t v14 = 0;
      BBUpdaterCommon::BBUStringToArgv((char *)__p, v13);
      unint64_t v5 = (_DWORD *)MEMORY[0x263EF89F8];
      uint64_t v6 = (const char **)MEMORY[0x263EF89E0];
      *MEMORY[0x263EF89E8] = 1;
      *unint64_t v5 = 1;
      do
      {
        while (1)
        {
          while (1)
          {
            int v7 = getopt_long(((unint64_t)((char *)v13[1] - (char *)v13[0]) >> 3) - 1, (char *const *)v13[0], "hl:C:v:x:t:r:p:e:c:w:i:s:fUFD:nHSqPV", (const option *)&BBULogParseDebugArgs(ctu::cf::CFSharedRef<__CFDictionary const>)::long_options, 0);
            if (v7 <= 117) {
              break;
            }
            if (v7 == 118)
            {
              uint64_t v12 = 0;
              int v11 = strtoul(*v6, &v12, 0);
              if (!*v12) {
                gBBULogVerbosity = v11;
              }
            }
            else if (v7 == 120)
            {
              uint64_t v12 = 0;
              unsigned int v8 = strtoul(*v6, &v12, 0);
              if (!*v12) {
                BBULogSetExtraVerbosity(v8);
              }
            }
          }
          if (v7 != 108) {
            break;
          }
          uint64_t v12 = 0;
          unsigned int v9 = strtoul(*v6, &v12, 0);
          if (!*v12)
          {
            uint64_t v10 = v9;
            sLogInternalMasunint64_t k = v9;
            if (gBBULogMaskGet(void)::once != -1) {
              dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_0);
            }
            *(void *)gBBULogMaskGet(void)::sBBULogMasunint64_t k = v10;
          }
        }
      }
      while (v7 != -1);
      if (v13[0])
      {
        v13[1] = v13[0];
        operator delete(v13[0]);
      }
    }
    MEMORY[0x263E6C510](v15);
    MEMORY[0x263E6C510](v16);
    if (SHIBYTE(v18) < 0) {
      operator delete(__p[0]);
    }
  }
}

void sub_26388EA88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (__p) {
    operator delete(__p);
  }
  MEMORY[0x263E6C510](&a13);
  MEMORY[0x263E6C510](&a15);
  if (a22 < 0) {
    operator delete(a17);
  }
  _Unwind_Resume(a1);
}

void **BBULogRegisterRemoteFSDelegate(void)
{
  return BBUFSDebugRegisterDelegate((void **)&BBULogRegisterRemoteFSDelegate(void)::delegate);
}

void BBURemoteFSPrintDelegate(const char *a1, const char *a2, va_list a3)
{
}

uint64_t BBULogRegisterDelegates(void)
{
  TelephonyUtilDebugRegisterDelegate();
  int v0 = BBUFSDebugRegisterDelegate((void **)&BBULogRegisterRemoteFSDelegate(void)::delegate);
  uint64_t result = BBUpdaterCommon::inRestoreOS((BBUpdaterCommon *)v0);
  if (result)
  {
    ETLDebugRegisterDelegate();
    return MEMORY[0x270F92878](BBULogRegisterKTLDelegate(void)::delegate);
  }
  return result;
}

void *BBULogRegisterSink(void *result, uint64_t a2)
{
  gBBULogSinkContext = a2;
  gBBULogSinkFunc = result;
  return result;
}

void BBULogRegisterLogBuffer(uint64_t *a1)
{
  if (sLogBufferGet(void)::once != -1) {
    dispatch_once(&sLogBufferGet(void)::once, &__block_literal_global_46);
  }
  uint64_t v2 = (void *)sLogBufferGet(void)::sLogBuffer;
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v5 = (std::__shared_weak_count *)v2[1];
  *uint64_t v2 = v4;
  v2[1] = v3;
  if (v5)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
}

void BBULogUnregisterLogBuffer(void)
{
  if (sLogBufferGet(void)::once != -1) {
    dispatch_once(&sLogBufferGet(void)::once, &__block_literal_global_46);
  }
  if (*(void *)sLogBufferGet(void)::sLogBuffer)
  {
    uint64_t v0 = sLogBufferGet(void)::sLogBuffer;
    uint64_t v1 = *(std::__shared_weak_count **)(sLogBufferGet(void)::sLogBuffer + 8);
    *(void *)sLogBufferGet(void)::sLogBuffer = 0;
    *(void *)(v0 + 8) = 0;
    if (v1)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v1);
    }
  }
}

pthread_mutex_t *___ZL8gLockGetv_block_invoke()
{
  uint64_t v0 = (pthread_mutex_t *)operator new(0x40uLL);
  uint64_t result = BBUpdaterCommon::BBUMutex::BBUMutex(v0, "logging");
  gLockGet(void)::_gLocunint64_t k = (uint64_t)v0;
  return result;
}

void sub_26388ECB4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *___ZL13sLogBufferGetv_block_invoke()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = 0;
  result[1] = 0;
  sLogBufferGet(void)::sLogBuffer = (uint64_t)result;
  return result;
}

FILE *___ZL14gLogStreamsGetv_block_invoke()
{
  uint64_t v0 = operator new(0x48uLL);
  uint64_t v1 = (void *)MEMORY[0x263EF8358];
  uint64_t v2 = *MEMORY[0x263EF8358];
  void *v0 = *MEMORY[0x263EF8358];
  v0[1] = v2;
  v0[2] = v2;
  v0[6] = v2;
  v0[7] = v2;
  v0[5] = v2;
  uint64_t result = fopen("/dev/null", "w");
  v0[8] = result;
  uint64_t v4 = *MEMORY[0x263EF8348];
  v0[3] = *v1;
  v0[4] = v4;
  gLogStreamsGet(void)::sLogStreams = (uint64_t)v0;
  return result;
}

void sub_26388ED68(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void BBULogPrintDelegate(int a1, uint64_t a2, const char *a3, va_list a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  gettimeofday(&v13, 0);
  vsnprintf(__str, 0x100uLL, a3, a4);
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_0);
  }
  if (((*(void *)gBBULogMaskGet(void)::sBBULogMask >> a1) & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0) {
    _BBULogPlain(a1, "%u.%03u: %s: %s", v7, v8, v9, v10, v11, v12, v13.tv_sec);
  }
}

void BBULogTelephonyUtilPrintDelegate(const char *a1, const char *a2, va_list a3)
{
}

void BBULogTelephonyUtilPrintBinaryDelegate(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4 = "misc";
  if (a2 == 1) {
    uint64_t v4 = "recv";
  }
  if (a2) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = "send";
  }
  BBULogPrintBinaryDelegate(6, (uint64_t)v5, a3, a4);
}

void BBULogPrintBinaryDelegate(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v15 = 0;
  if (a4 < 0x801)
  {
    unint64_t v6 = a4;
  }
  else
  {
    MEMORY[0x263E6C810](__p, "(snipped)");
    unint64_t v6 = 2048;
  }
  gettimeofday(&v13, 0);
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_0);
  }
  if ((*(void *)gBBULogMaskGet(void)::sBBULogMask & (1 << a1)) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
  {
    _BBULogPlain(a1, "%u.%03u: %s: %u%s\n", v7, v8, v9, v10, v11, v12, v13.tv_sec);
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_0);
    }
  }
  if ((*(void *)gBBULogMaskGet(void)::sBBULogMask & (1 << a1)) != 0 && (gBBULogVerbosity & 0x80000000) == 0) {
    _BBULogBinary(a1, 0, "BBULog", "", a3, v6, 32, v12);
  }
  if (SHIBYTE(v15) < 0) {
    operator delete(__p[0]);
  }
}

void sub_26388F064(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void BBULogETLPrintDelegate(const char *a1, const char *a2, va_list a3)
{
}

void BBULogETLPrintBinaryDelegate(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4 = "misc";
  if (a2 == 1) {
    uint64_t v4 = "recv";
  }
  if (a2) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = "send";
  }
  BBULogPrintBinaryDelegate(7, (uint64_t)v5, a3, a4);
}

void BBULogKTLPrintDelegate(const char *a1, const char *a2, va_list a3)
{
}

void BBULogKTLPrintErrorDelegate(const char *a1, const char *a2, va_list a3)
{
}

void BBULogKTLPrintBinaryDelegate(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4 = "misc";
  if (a2 == 1) {
    uint64_t v4 = "recv";
  }
  if (a2) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = "send";
  }
  BBULogPrintBinaryDelegate(8, (uint64_t)v5, a3, a4);
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  uint64_t v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_68;
  }
  unint64_t v5 = &v4[v3];
  unint64_t v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    uint64_t v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      unint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0;
            }
LABEL_34:
            uint64_t result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          uint64_t result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          uint64_t v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28) {
            goto LABEL_69;
          }
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_68;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    uint64_t v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERDecodeItemPartialBuffer(uint64_t result, unint64_t *a2, int a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  uint64_t v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_54;
  }
  unint64_t v5 = &v4[v3];
  unint64_t v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    uint64_t v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_55;
      }
      unint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        BOOL v17 = v16 < v15 && a3 == 0;
        unint64_t v18 = (unint64_t)(v12 + 1);
        if (v17) {
          return 3;
        }
LABEL_28:
        if (v15 > (~v18 & 0x7FFFFFFFFFFFFFFFLL)) {
          return 7;
        }
        if (v18 <= v18 + v15)
        {
          uint64_t result = 0;
          a2[1] = v18;
          a2[2] = v15;
          return result;
        }
        goto LABEL_55;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4)
      {
LABEL_55:
        __break(0x5519u);
LABEL_56:
        __break(0x5515u);
        return result;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v18 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_55;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_56;
        }
        unsigned int v23 = *v14++;
        unint64_t v15 = (v15 << 8) | v23;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (v15 <= v22) {
            char v24 = 1;
          }
          else {
            char v24 = a3;
          }
          uint64_t result = 3;
          if (v15 >= 0x80 && (v24 & 1) != 0) {
            goto LABEL_28;
          }
          return result;
        }
      }
    }
LABEL_54:
    __break(0x5513u);
    goto LABEL_55;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_54;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_55;
    }
    uint64_t v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, unsigned char *a3)
{
  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(void *)(result + 8)) {
    return 3;
  }
  unsigned int v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      unint64_t v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      unint64_t v6 = *(void *)result;
      unint64_t v7 = *(void *)result + v4;
      unint64_t v8 = (unsigned __int8 *)(*(void *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        unint64_t v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          uint64_t result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3) {
    return 3;
  }
  else {
    return 0;
  }
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  if (a1[1] != (unsigned __int8 *)1) {
    return 3;
  }
  int v2 = **a1;
  if (v2 != 255 && v2 != 0) {
    return 3;
  }
  uint64_t result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned int v3 = a1[1];
  if (!v3) {
    goto LABEL_9;
  }
  if (v3 == (unsigned __int8 *)1)
  {
    int v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      uint64_t result = 0;
      *a3 = a2;
      return result;
    }
  }
  return 3;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, v4);
  if (!result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      uint64_t result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3;
  }
  unsigned int v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7;
    }
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0) {
      return 3;
    }
    if (v2 > 9) {
      return 7;
    }
  }
LABEL_10:
  unint64_t v5 = 0;
  do
  {
    unsigned int v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  uint64_t result = 0;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, void *a2, void *a3)
{
  v8[3] = *MEMORY[0x263EF8340];
  memset(v8, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!result)
  {
    unint64_t v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        unint64_t v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          uint64_t result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  unint64_t v10[2] = *MEMORY[0x263EF8340];
  v10[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  void v12[3] = *MEMORY[0x263EF8340];
  memset(v12, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!result)
  {
    if (v12[0] == 0x2000000000000010) {
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unint64_t v32 = 0;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }
  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    long long v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = DERDecodeSeqNext(&v32, v31);
      if (result) {
        break;
      }
      if (a2 <= v13) {
        return 2;
      }
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3) {
          goto LABEL_58;
        }
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24 * v13 + 8)) {
          break;
        }
        uint64_t result = 2;
        if (v18)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1)) {
            continue;
          }
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4) {
          goto LABEL_59;
        }
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }
    if (result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        BOOL v25 = (__int16 *)(a3 + 24 * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0;
    }
    else {
      return 3;
    }
  }
  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent(unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  v4[3] = *MEMORY[0x263EF8340];
  memset(v4, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v4, 0);
  if (!result)
  {
    if (v4[0] - 0x2000000000000012 >= 0xFFFFFFFFFFFFFFFELL) {
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  void v9[2] = *MEMORY[0x263EF8340];
  v9[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }
  unint64_t v4 = v2 + v3;
  if (v2 > v4) {
    goto LABEL_13;
  }
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  char v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if (result) {
      break;
    }
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if (result) {
      break;
    }
    if (v7) {
      return 0;
    }
  }
  if (result <= 1) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t DERLengthOfLength(unint64_t a1)
{
  if (a1 < 0x80) {
    return 1;
  }
  unint64_t v2 = a1;
  uint64_t result = 1;
  do
  {
    ++result;
    BOOL v3 = v2 > 0xFF;
    v2 >>= 8;
  }
  while (v3);
  return result;
}

unint64_t DEREncodeLength(unint64_t a1, unint64_t a2, unint64_t *a3)
{
  return DEREncodeLengthSized(a1, a2, *a3, (uint64_t *)a3);
}

unint64_t DEREncodeLengthSized(unint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4)
{
  if (result >= 0x80)
  {
    uint64_t v5 = 0;
    unint64_t v6 = result;
    do
    {
      --v5;
      BOOL v7 = v6 > 0xFF;
      v6 >>= 8;
    }
    while (v7);
    unint64_t v8 = -v5;
    uint64_t v9 = 7;
    if (-v5 < a3 && v8 <= 0x7E)
    {
      if (*a4)
      {
        uint64_t v4 = 1 - v5;
        *(unsigned char *)a2 = -(char)v5 | 0x80;
        if (v8 < ~a2)
        {
          unint64_t v10 = (unsigned char *)(a2 - v5);
          if (a2 - v5 != -2)
          {
            unint64_t v11 = (unsigned char *)(a2 + *a4);
            while (v10 != (unsigned char *)-1)
            {
              if (v10 >= v11 || (unint64_t)v10 < a2) {
                goto LABEL_23;
              }
              *v10-- = result;
              BOOL v7 = result > 0xFF;
              result >>= 8;
              if (!v7)
              {
                if (v8 >= *a4) {
                  goto LABEL_23;
                }
                goto LABEL_19;
              }
            }
          }
        }
        __break(0x5513u);
      }
      goto LABEL_23;
    }
    return v9;
  }
  if (!a3) {
    return 7;
  }
  if (*a4)
  {
    *(unsigned char *)a2 = result;
    if (*a4)
    {
      uint64_t v4 = 1;
LABEL_19:
      uint64_t v9 = 0;
      *a4 = v4;
      return v9;
    }
  }
LABEL_23:
  __break(0x5519u);
  return result;
}

unint64_t DERLengthOfItem(unint64_t result, unint64_t a2)
{
  unint64_t v2 = result & 0x1FFFFFFFFFFFFFFFLL;
  uint64_t v3 = 1;
  if ((result & 0x1FFFFFFFFFFFFFFFLL) >= 0x1F)
  {
    do
    {
      ++v3;
      BOOL v4 = v2 > 0x7F;
      v2 >>= 7;
    }
    while (v4);
  }
  uint64_t v5 = 1;
  if (a2 >= 0x80)
  {
    unint64_t v6 = a2;
    do
    {
      ++v5;
      BOOL v4 = v6 > 0xFF;
      v6 >>= 8;
    }
    while (v4);
  }
  BOOL v7 = __CFADD__(v3, v5);
  uint64_t v8 = v3 + v5;
  if (v7 || (uint64_t result = v8 + a2, __CFADD__(v8, a2))) {
    __break(0x5500u);
  }
  return result;
}

uint64_t DEREncodeItem(unint64_t a1, unint64_t a2, const void *a3, unint64_t a4, unint64_t *a5)
{
  return DEREncodeItemSized(a1, a2, a3, a4, *a5, a5);
}

uint64_t DEREncodeItemSized(unint64_t a1, unint64_t a2, const void *a3, unint64_t a4, unint64_t a5, unint64_t *a6)
{
  v22[1] = *MEMORY[0x263EF8340];
  unint64_t v12 = *a6;
  unint64_t v13 = DERLengthOfItem(a1, a2);
  if (v13 > a5) {
    return 7;
  }
  unint64_t v15 = v13;
  if (v13 > *a6) {
    goto LABEL_20;
  }
  *a6 = v13;
  v22[0] = v13;
  if (v13 > v12) {
    goto LABEL_20;
  }
  uint64_t result = DEREncodeTag(a1, a4, (unint64_t *)v22);
  if (result) {
    return result;
  }
  uint64_t v16 = v22[0];
  if (__CFADD__(a4, v22[0]))
  {
LABEL_21:
    __break(0x5513u);
    goto LABEL_22;
  }
  BOOL v17 = v15 >= v22[0];
  unint64_t v18 = v15 - v22[0];
  if (!v17) {
    goto LABEL_22;
  }
  unint64_t v19 = a4 + v12;
  unint64_t v20 = a4 + v22[0];
  v22[0] = v18;
  if (a4 + v16 > a4 + v12 || v20 < a4 || v18 > v19 - v20) {
LABEL_20:
  }
    __break(0x5519u);
  uint64_t result = DEREncodeLengthSized(a2, v20, v18, v22);
  if (result) {
    return result;
  }
  if (__CFADD__(v20, v22[0])) {
    goto LABEL_21;
  }
  if (v18 < v22[0])
  {
LABEL_22:
    __break(0x5515u);
    return result;
  }
  uint64_t v21 = (void *)(v20 + v22[0]);
  if (v19 < v20 + v22[0] || (unint64_t)v21 < a4 || v19 - (v20 + v22[0]) < a2) {
    goto LABEL_20;
  }
  memmove(v21, a3, a2);
  return 0;
}

uint64_t DEREncodeTag(uint64_t result, unint64_t a2, unint64_t *a3)
{
  unint64_t v3 = result & 0x1FFFFFFFFFFFFFFFLL;
  if ((result & 0x1FFFFFFFFFFFFFFFuLL) < 0x1F)
  {
    if (*a3)
    {
      *(unsigned char *)a2 = HIBYTE(result) & 0xE0 | result;
      unint64_t v8 = 1;
      goto LABEL_17;
    }
    return 7;
  }
  unint64_t v4 = 0;
  unint64_t v5 = result & 0x1FFFFFFFFFFFFFFFLL;
  do
  {
    ++v4;
    BOOL v6 = v5 > 0x7F;
    v5 >>= 7;
  }
  while (v6);
  unint64_t v7 = *a3;
  if (v4 >= *a3) {
    return 7;
  }
  if (v4 >= ~a2 || (*(unsigned char *)a2 = HIBYTE(result) | 0x1F, a2 + v4 == -2))
  {
LABEL_20:
    __break(0x5513u);
    goto LABEL_21;
  }
  if (a2 + v4 >= a2)
  {
    unint64_t v8 = v4 + 1;
    *(unsigned char *)(a2 + v4) = result & 0x7F;
    if (v3 >= 0x80)
    {
      uint64_t v9 = (unsigned char *)(a2 + v4 - 1);
      unint64_t v10 = (unsigned char *)(a2 + v7);
      while (v9 != (unsigned char *)-2)
      {
        if (v9 >= v10 || (unint64_t)v9 < a2) {
          goto LABEL_21;
        }
        unint64_t v11 = v3 >> 14;
        v3 >>= 7;
        *v9-- = v3 | 0x80;
        if (!v11) {
          goto LABEL_17;
        }
      }
      goto LABEL_20;
    }
LABEL_17:
    if (v8 <= *a3)
    {
      uint64_t result = 0;
      *a3 = v8;
      return result;
    }
  }
LABEL_21:
  __break(0x5519u);
  return result;
}

uint64_t DEREncodeSequenceFromObject(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4, uint64_t a5, unint64_t a6, unint64_t a7, unint64_t *a8)
{
  v45[1] = *MEMORY[0x263EF8340];
  unint64_t v8 = ~a6;
  if (~a6 < a7) {
    goto LABEL_73;
  }
  unint64_t v11 = *a8;
  unint64_t v44 = a7;
  v45[0] = 0;
  if (v11 < a7) {
    goto LABEL_74;
  }
  uint64_t result = DEREncodeTag(a1, a6, &v44);
  if (result) {
    return result;
  }
  if (v44 > v8) {
    goto LABEL_73;
  }
  unint64_t v17 = a7 - v44;
  if (a7 < v44) {
    goto LABEL_75;
  }
  unint64_t v18 = a6 + a7;
  unint64_t v19 = a6 + v44;
  if (a6 + v44 < v18)
  {
    uint64_t result = DERContentLengthOfEncodedSequence(a2, a3, a4, a5, v45);
    if (result) {
      return result;
    }
    unint64_t v44 = v17;
    if (v19 > a6 + v11 || v19 < a6 || v17 > a6 + v11 - v19) {
      goto LABEL_74;
    }
    unint64_t v42 = a6 + v11;
    unint64_t v20 = v45[0];
    uint64_t result = DEREncodeLengthSized(v45[0], v19, v17, (uint64_t *)&v44);
    if (result) {
      return result;
    }
    unint64_t v21 = v42;
    if (__CFADD__(v19, v44))
    {
LABEL_73:
      __break(0x5513u);
      goto LABEL_74;
    }
    unint64_t v22 = v17 - v44;
    if (v17 >= v44)
    {
      uint64_t v23 = (unsigned char *)(v19 + v44);
      if (!__CFADD__(v19 + v44, v20))
      {
        if ((unint64_t)&v23[v20] > v18) {
          return 7;
        }
        if (a4)
        {
          unint64_t v24 = 0;
          unint64_t v25 = a2 + a3;
          uint64_t v41 = 24 * a4;
          while (1)
          {
            if (v24 > ~a5) {
              goto LABEL_73;
            }
            unint64_t v26 = *(void *)(a5 + v24);
            if (v26 > ~a2) {
              goto LABEL_73;
            }
            __int16 v27 = (const void **)(a2 + v26);
            __int16 v28 = *(_WORD *)(a5 + v24 + 16);
            if ((v28 & 0x200) != 0) {
              break;
            }
            if ((v28 & 1) == 0) {
              goto LABEL_29;
            }
            if ((unint64_t)v27 < a2 || (unint64_t)(v27 + 2) > v25) {
              goto LABEL_74;
            }
            if (v27[1])
            {
LABEL_29:
              unint64_t v44 = v22;
              if ((unint64_t)v23 > v21 || (unint64_t)v23 < a6 || v22 > v21 - (unint64_t)v23) {
                goto LABEL_74;
              }
              uint64_t result = DEREncodeTag(*(void *)(a5 + v24 + 8), (unint64_t)v23, &v44);
              if (result) {
                return result;
              }
              if (__CFADD__(v23, v44)) {
                goto LABEL_73;
              }
              unint64_t v30 = v22 - v44;
              if (v22 < v44) {
                goto LABEL_75;
              }
              if ((unint64_t)v27 < a2 || (unint64_t)(v27 + 2) > v25) {
                goto LABEL_74;
              }
              unint64_t v31 = (unint64_t)v27[1];
              v45[0] = v31;
              char v32 = 1;
              if ((v28 & 0x100) != 0 && v31 && *(char *)*v27 < 0)
              {
                char v32 = 0;
                v45[0] = ++v31;
              }
              unint64_t v33 = (unint64_t)&v23[v44];
              unint64_t v44 = v30;
              if (v33 > v42 || v33 < a6 || v30 > v42 - v33) {
                goto LABEL_74;
              }
              uint64_t result = DEREncodeLengthSized(v31, v33, v30, (uint64_t *)&v44);
              if (result) {
                return result;
              }
              unint64_t v34 = v44;
              if (__CFADD__(v33, v44)) {
                goto LABEL_73;
              }
              unint64_t v35 = v30 - v44;
              if (v30 < v44) {
                goto LABEL_75;
              }
              uint64_t v23 = (unsigned char *)(v33 + v44);
              if ((v32 & 1) == 0)
              {
                if (v23 == (unsigned char *)-1) {
                  goto LABEL_73;
                }
                if ((unint64_t)v23 >= v42 || (unint64_t)v23 < a6) {
                  goto LABEL_74;
                }
                *uint64_t v23 = 0;
                --v35;
                if (v30 == v34) {
                  goto LABEL_75;
                }
                ++v23;
              }
              if ((unint64_t)v23 > v42) {
                goto LABEL_74;
              }
              if ((unint64_t)v23 < a6) {
                goto LABEL_74;
              }
              size_t v36 = (size_t)v27[1];
              if (v36 > v42 - (unint64_t)v23) {
                goto LABEL_74;
              }
              uint64_t result = (uint64_t)memmove(v23, *v27, v36);
              unint64_t v21 = v42;
              unint64_t v37 = (unint64_t)v27[1];
              if (__CFADD__(v23, v37)) {
                goto LABEL_73;
              }
              unint64_t v22 = v35 - v37;
              if (v35 < v37) {
                goto LABEL_75;
              }
              goto LABEL_69;
            }
LABEL_70:
            v24 += 24;
            if (v41 == v24) {
              goto LABEL_71;
            }
          }
          if ((unint64_t)v27 < a2 || (unint64_t)(v27 + 2) > v25) {
            goto LABEL_74;
          }
          if ((unint64_t)v23 > v21) {
            goto LABEL_74;
          }
          if ((unint64_t)v23 < a6) {
            goto LABEL_74;
          }
          size_t v39 = (size_t)v27[1];
          if (v39 > v21 - (unint64_t)v23) {
            goto LABEL_74;
          }
          uint64_t result = (uint64_t)memmove(v23, *v27, v39);
          unint64_t v21 = v42;
          unint64_t v37 = (unint64_t)v27[1];
          if (__CFADD__(v23, v37)) {
            goto LABEL_73;
          }
          BOOL v40 = v22 >= v37;
          v22 -= v37;
          if (!v40) {
            goto LABEL_75;
          }
LABEL_69:
          v23 += v37;
          goto LABEL_70;
        }
LABEL_71:
        if ((unint64_t)&v23[-a6] <= *a8)
        {
          uint64_t result = 0;
          *a8 = (unint64_t)&v23[-a6];
          return result;
        }
LABEL_74:
        __break(0x5519u);
      }
      goto LABEL_73;
    }
LABEL_75:
    __break(0x5515u);
    return result;
  }
  return 7;
}

unint64_t DERContentLengthOfEncodedSequence(unint64_t result, unint64_t a2, int a3, uint64_t a4, void *a5)
{
  uint64_t v5 = 0;
  if (!a3)
  {
LABEL_38:
    uint64_t result = 0;
LABEL_40:
    *a5 = v5;
    return result;
  }
  unsigned int v6 = 0;
  unint64_t v7 = result + a2;
  while (24 * (unint64_t)v6 <= ~a4)
  {
    unint64_t v8 = *(void *)(a4 + 24 * v6);
    BOOL v9 = v8 > 0xFFFFFFFFFFFFFFEFLL || v8 + 16 > a2;
    if (v9)
    {
      uint64_t v5 = 0;
      uint64_t result = 7;
      goto LABEL_40;
    }
    if (v8 > ~result) {
      break;
    }
    unint64_t v10 = (unsigned __int8 **)(result + v8);
    __int16 v11 = *(_WORD *)(a4 + 24 * v6 + 16);
    if ((v11 & 0x200) == 0)
    {
      if (v11)
      {
        if ((unint64_t)v10 < result || (unint64_t)(v10 + 2) > v7) {
          goto LABEL_43;
        }
        if (!v10[1]) {
          goto LABEL_37;
        }
      }
      unint64_t v13 = *(void *)(a4 + 24 * v6 + 8) & 0x1FFFFFFFFFFFFFFFLL;
      uint64_t v14 = 1;
      if (v13 >= 0x1F)
      {
        do
        {
          ++v14;
          BOOL v9 = v13 > 0x7F;
          v13 >>= 7;
        }
        while (v9);
      }
      BOOL v15 = __CFADD__(v5, v14);
      uint64_t v16 = v5 + v14;
      if (v15) {
        goto LABEL_42;
      }
      if ((unint64_t)v10 < result || (unint64_t)(v10 + 2) > v7) {
        goto LABEL_43;
      }
      unint64_t v17 = (unint64_t)v10[1];
      if ((*(_WORD *)(a4 + 24 * v6 + 16) & 0x100) != 0)
      {
        if (v17)
        {
          v17 += (unint64_t)**v10 >> 7;
          goto LABEL_24;
        }
LABEL_25:
        uint64_t v18 = 1;
      }
      else
      {
LABEL_24:
        if (v17 < 0x80) {
          goto LABEL_25;
        }
        uint64_t v18 = 1;
        unint64_t v21 = v17;
        do
        {
          ++v18;
          BOOL v9 = v21 > 0xFF;
          v21 >>= 8;
        }
        while (v9);
      }
      BOOL v15 = __CFADD__(v16, v18);
      uint64_t v22 = v16 + v18;
      if (v15) {
        goto LABEL_42;
      }
      BOOL v15 = __CFADD__(v22, v17);
      uint64_t v5 = v22 + v17;
      if (v15) {
        goto LABEL_42;
      }
      goto LABEL_37;
    }
    if ((unint64_t)v10 < result || (unint64_t)(v10 + 2) > v7) {
      goto LABEL_43;
    }
    unint64_t v20 = v10[1];
    BOOL v15 = __CFADD__(v5, v20);
    v5 += (uint64_t)v20;
    if (v15) {
      goto LABEL_42;
    }
LABEL_37:
    if (++v6 == a3) {
      goto LABEL_38;
    }
  }
  __break(0x5513u);
LABEL_42:
  __break(0x5500u);
LABEL_43:
  __break(0x5519u);
  return result;
}

uint64_t DEREncodeSequence(uint64_t result, unint64_t a2, unsigned int a3, uint64_t a4, unint64_t a5, unint64_t *a6)
{
  if ((a2 | 0x7FFFFFFFFFFFFFFFLL) >= a2) {
    return DEREncodeSequenceFromObject(result, a2, ~a2 & 0x7FFFFFFFFFFFFFFFLL, a3, a4, a5, *a6, a6);
  }
  __break(0x5519u);
  return result;
}

unint64_t DERLengthOfEncodedSequenceFromObject(uint64_t a1, unint64_t a2, unint64_t a3, int a4, uint64_t a5, uint64_t *a6)
{
  v17[1] = *MEMORY[0x263EF8340];
  v17[0] = 0;
  unint64_t result = DERContentLengthOfEncodedSequence(a2, a3, a4, a5, v17);
  if (!result)
  {
    unint64_t v9 = a1 & 0x1FFFFFFFFFFFFFFFLL;
    uint64_t v10 = 1;
    if ((a1 & 0x1FFFFFFFFFFFFFFFuLL) >= 0x1F)
    {
      do
      {
        ++v10;
        BOOL v11 = v9 > 0x7F;
        v9 >>= 7;
      }
      while (v11);
    }
    uint64_t v12 = 1;
    if (v17[0] >= 0x80uLL)
    {
      unint64_t v13 = v17[0];
      do
      {
        ++v12;
        BOOL v11 = v13 > 0xFF;
        v13 >>= 8;
      }
      while (v11);
    }
    BOOL v14 = __CFADD__(v10, v12);
    uint64_t v15 = v10 + v12;
    if (v14 || (BOOL v14 = __CFADD__(v15, v17[0]), v16 = v15 + v17[0], v14))
    {
      __break(0x5500u);
    }
    else
    {
      unint64_t result = 0;
      *a6 = v16;
    }
  }
  return result;
}

uint64_t DERLengthOfEncodedSequence(uint64_t a1, unint64_t a2, int a3, uint64_t a4)
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if ((a2 | 0x7FFFFFFFFFFFFFFFLL) < a2) {
    __break(0x5519u);
  }
  if (DERLengthOfEncodedSequenceFromObject(a1, a2, ~a2 & 0x7FFFFFFFFFFFFFFFLL, a3, a4, v5)) {
    return 0;
  }
  else {
    return v5[0];
  }
}

uint64_t VinylController::VinylController(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

atomic_ullong *std::future<BOOL>::get(atomic_ullong *result)
{
  if (!atomic_fetch_add(result + 1, 0xFFFFFFFFFFFFFFFFLL)) {
    return (atomic_ullong *)(*(uint64_t (**)(void))(*result + 16))();
  }
  return result;
}

void ctu::llvm::StringRef::StringRef()
{
}

uint64_t std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t BBUpdaterExecCommand()
{
  return MEMORY[0x270F91608]();
}

uint64_t BBUpdaterExtremeCreateWithError()
{
  return MEMORY[0x270F91610]();
}

uint64_t BBUpdaterRegisterLogSink()
{
  return MEMORY[0x270F91620]();
}

uint64_t BBUpdaterSetOptions()
{
  return MEMORY[0x270F91628]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
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

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x270EE47D0](allocator, theData);
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

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
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

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
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

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFShow(CFTypeRef obj)
{
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
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

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE5400](allocator, URLString, baseURL);
}

uint64_t ETLDebugRegisterDelegate()
{
  return MEMORY[0x270F91AC8]();
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x270EF47A8](*(void *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x270EF49E8](*(void *)&mainPort, path);
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

uint64_t TelephonyBasebandResetModem()
{
  return MEMORY[0x270F96858]();
}

uint64_t TelephonyRadiosGetProduct()
{
  return MEMORY[0x270F97158]();
}

uint64_t TelephonyRadiosGetRadioVendor()
{
  return MEMORY[0x270F97168]();
}

uint64_t TelephonyUtilDebugRegisterDelegate()
{
  return MEMORY[0x270F97178]();
}

uint64_t TelephonyUtilIsInternalBuild()
{
  return MEMORY[0x270F971A8]();
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

uint64_t capabilities::diag::preferredInterface(capabilities::diag *this)
{
  return MEMORY[0x270F96C80](this);
}

uint64_t capabilities::euicc::supportsEOS(capabilities::euicc *this)
{
  return MEMORY[0x270F96CA8](this);
}

uint64_t capabilities::euicc::supportsVinylRestore(capabilities::euicc *this)
{
  return MEMORY[0x270F96CB0](this);
}

uint64_t capabilities::euicc::supportsGenericUpdater(capabilities::euicc *this)
{
  return MEMORY[0x270F96CC0](this);
}

uint64_t Ari::Log(Ari *this, uint64_t a2, const char *a3, ...)
{
  return MEMORY[0x270F8CD00](this, a2, a3);
}

uint64_t ctu::LogMessageBuffer::takeString(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x270F973E8](this);
}

uint64_t ctu::LogMessageBuffer::vCreateWithFormat(ctu::LogMessageBuffer *this, const char *a2, char *a3)
{
  return MEMORY[0x270F97400](this, a2, a3);
}

void ctu::LogMessageBuffer::~LogMessageBuffer(ctu::LogMessageBuffer *this)
{
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

uint64_t ctu::Http::HttpRequest::create()
{
  return MEMORY[0x270F97648]();
}

uint64_t ctu::basename()
{
  return MEMORY[0x270F97700]();
}

uint64_t ctu::tokenize()
{
  return MEMORY[0x270F97708]();
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

uint64_t eUICC::ValidatePerso::Perform()
{
  return MEMORY[0x270F91C38]();
}

uint64_t eUICC::VinylCommandDriver::GetVinylType()
{
  return MEMORY[0x270F92A58]();
}

uint64_t eUICC::VinylCommandDriver::DeleteProfile()
{
  return MEMORY[0x270F92A60]();
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

uint64_t eUICC::VinylCommandDriver::VinylCommandDriver()
{
  return MEMORY[0x270F92AA0]();
}

void eUICC::VinylCommandDriver::~VinylCommandDriver(eUICC::VinylCommandDriver *this)
{
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

uint64_t AriSdk::ARI_IBIVinylGetDataReq_SDK::ARI_IBIVinylGetDataReq_SDK(AriSdk::ARI_IBIVinylGetDataReq_SDK *this)
{
  return MEMORY[0x270F8D5C0](this);
}

void AriSdk::ARI_IBIVinylGetDataReq_SDK::~ARI_IBIVinylGetDataReq_SDK(AriSdk::ARI_IBIVinylGetDataReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIVinylSwitchModeReq_SDK::ARI_IBIVinylSwitchModeReq_SDK(AriSdk::ARI_IBIVinylSwitchModeReq_SDK *this)
{
  return MEMORY[0x270F8DF10](this);
}

void AriSdk::ARI_IBIVinylSwitchModeReq_SDK::~ARI_IBIVinylSwitchModeReq_SDK(AriSdk::ARI_IBIVinylSwitchModeReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIVinylValidatePsoReq_SDK::ARI_IBIVinylValidatePsoReq_SDK(AriSdk::ARI_IBIVinylValidatePsoReq_SDK *this)
{
  return MEMORY[0x270F8E390](this);
}

void AriSdk::ARI_IBIVinylValidatePsoReq_SDK::~ARI_IBIVinylValidatePsoReq_SDK(AriSdk::ARI_IBIVinylValidatePsoReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBISimAccessGetSimDataReq_SDK::ARI_IBISimAccessGetSimDataReq_SDK(AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *this)
{
  return MEMORY[0x270F8EE50](this);
}

void AriSdk::ARI_IBISimAccessGetSimDataReq_SDK::~ARI_IBISimAccessGetSimDataReq_SDK(AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *this)
{
}

uint64_t ctu::cf::map_adapter::getBool(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x270F97910](this, a2);
}

uint64_t ctu::cf::map_adapter::getString()
{
  return MEMORY[0x270F97920]();
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x270F98238](this, __c, __pos);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
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

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F98480](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F98568](this, __c);
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x270F985E0](this, *(void *)&__ec.__val_, __ec.__cat_);
}

void std::future_error::~future_error(std::future_error *this)
{
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x270F986F8]();
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

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::operator=()
{
  return MEMORY[0x270F98950]();
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

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x270F98A00](retstr, __s);
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
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

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F08](*(void *)&a1);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x270ED87B0](__count, __size);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

void free(void *a1)
{
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return MEMORY[0x270ED9CC0](*(void *)&a1, a2, a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
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

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDA858](a1);
}

uint64_t os_variant_is_recovery()
{
  return MEMORY[0x270EDAB58]();
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x270EDADF8](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x270EDAE20](a1, *(void *)&a2);
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

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDB128](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x270EDB5E8](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}