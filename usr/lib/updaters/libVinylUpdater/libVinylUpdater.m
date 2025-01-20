VinylRestore *VinylRestore::create(VinylRestore *this, const __CFDictionary *a2)
{
  ACFULogging *v3;
  std::string *v4;
  long long v5;
  std::string *v6;
  long long v7;
  VinylRestore *v8;
  ACFULogging *v9;
  std::string v11;
  std::string v12;
  long long v13;
  std::string::size_type v14;

  ACFULogging::getLogInstance(this);
  v3 = (ACFULogging *)ACFULogging::handleMessage();
  ACFULogging::getLogInstance(v3);
  std::string::basic_string[abi:ne180100]<0>(&v11, "VinylRestore");
  v4 = std::string::append(&v11, "::");
  v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v12.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v12.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  v6 = std::string::append(&v12, "create");
  v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v14 = v6->__r_.__value_.__r.__words[2];
  v13 = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v14) < 0) {
    operator delete((void *)v13);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v11.__r_.__value_.__l.__data_);
  }
  v8 = (VinylRestore *)operator new(0x150uLL);
  VinylRestore::VinylRestore(v8);
  v9 = (ACFULogging *)(*(uint64_t (**)(VinylRestore *, VinylRestore *, __CFString *))(*(void *)v8 + 40))(v8, this, @"eUICC,Ticket");
  if (v9)
  {
    ACFULogging::getLogInstance(v9);
    ACFULogging::handleMessage();
    v9 = (ACFULogging *)(*(uint64_t (**)(VinylRestore *))(*(void *)v8 + 8))(v8);
    v8 = 0;
  }
  ACFULogging::getLogInstance(v9);
  ACFULogging::handleMessage();
  return v8;
}

void sub_230AD5394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  operator delete(v23);
  _Unwind_Resume(a1);
}

uint64_t VinylRestore::queryCmd@<X0>(std::__shared_weak_count **this@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 0;
  ACFULogging::getLogInstance((ACFULogging *)this);
  ACFURestore::isPreflight((ACFURestore *)this);
  ACFULogging::handleMessage();
  if (ACFURestore::isPreflight((ACFURestore *)this))
  {
    PersoParameters = (std::__shared_weak_count *)((uint64_t (*)(std::__shared_weak_count **))(*this)->__shared_weak_owners_)(this);
    *(void *)a2 = PersoParameters;
    *(unsigned char *)(a2 + 8) = PersoParameters != 0;
  }
  else
  {
    PersoParameters = this[21];
    if (PersoParameters)
    {
      if (PersoParameters)
      {
        v5 = this[22];
        if (v5) {
          atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        PersoParameters = (std::__shared_weak_count *)VinylTransport::getPersoParameters((const __CFDictionary **)PersoParameters, (uint64_t)&v14);
        *(void *)a2 = v14;
        *(unsigned char *)(a2 + 8) = BYTE8(v14);
        if (v5) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v5);
        }
      }
    }
  }
  ACFULogging::getLogInstance((ACFULogging *)PersoParameters);
  std::string::basic_string[abi:ne180100]<0>(&v12, "VinylRestore");
  v6 = std::string::append(&v12, "::");
  long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v13.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  v8 = std::string::append(&v13, "queryCmd");
  long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  std::string::size_type v15 = v8->__r_.__value_.__r.__words[2];
  long long v14 = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  v10 = (ACFULogging *)ACFULogging::handleMessageCFType();
  if (SHIBYTE(v15) < 0) {
    operator delete((void *)v14);
  }
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  ACFULogging::getLogInstance(v10);
  return ACFULogging::handleMessage();
}

void sub_230AD5614(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  _Unwind_Resume(exception_object);
}

uint64_t VinylRestore::getPreflightPersoParameters@<X0>(VinylRestore *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(VinylRestore *))(*(void *)this + 16))(this);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = result != 0;
  return result;
}

uint64_t VinylRestore::performCmd(const __CFDictionary **this)
{
  ACFULogging::getLogInstance((ACFULogging *)this);
  std::string::basic_string[abi:ne180100]<0>(&v11, "VinylRestore");
  v2 = std::string::append(&v11, "::");
  long long v3 = *(_OWORD *)&v2->__r_.__value_.__l.__data_;
  v12.__r_.__value_.__r.__words[2] = v2->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v12.__r_.__value_.__l.__data_ = v3;
  v2->__r_.__value_.__l.__size_ = 0;
  v2->__r_.__value_.__r.__words[2] = 0;
  v2->__r_.__value_.__r.__words[0] = 0;
  v4 = std::string::append(&v12, "performCmd");
  long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  std::string::size_type v14 = v4->__r_.__value_.__r.__words[2];
  long long v13 = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v14) < 0) {
    operator delete((void *)v13);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v11.__r_.__value_.__l.__data_);
  }
  CFDictionaryRef updated = this[21];
  if (!updated) {
    goto LABEL_15;
  }
  if (!updated) {
    goto LABEL_15;
  }
  long long v7 = (std::__shared_weak_count *)this[22];
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CFDictionaryRef updated = VinylTransport::updateFw((const __CFDictionary **)updated, this[15]);
  int v8 = (int)updated;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  if (!v8)
  {
    uint64_t v9 = 1;
  }
  else
  {
LABEL_15:
    ACFULogging::getLogInstance(updated);
    CFDictionaryRef updated = (const __CFDictionary *)ACFULogging::handleMessage();
    uint64_t v9 = 0;
  }
  ACFULogging::getLogInstance(updated);
  ACFULogging::handleMessage();
  return v9;
}

void sub_230AD587C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  _Unwind_Resume(exception_object);
}

void VinylRestore::~VinylRestore(VinylRestore *this)
{
  *(void *)this = &unk_26E555D80;
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();

  ACFURestore::~ACFURestore(this);
}

{
  void *v1;
  uint64_t vars8;

  VinylRestore::~VinylRestore(this);

  operator delete(v1);
}

void __clang_call_terminate(void *a1)
{
}

void VinylRestore::VinylRestore(VinylRestore *this)
{
  ACFURestore::ACFURestore(this);
  *(void *)v1 = &unk_26E555D80;
  ACFULogging::getLogInstance(v1);
  ACFULogging::handleMessage();
}

void sub_230AD5A0C(_Unwind_Exception *a1)
{
  ACFURestore::~ACFURestore(v1);
  _Unwind_Resume(a1);
}

__CFDictionary *VinylRestore::gatherPreflightParameters(VinylRestore *this)
{
  CFMutableDictionaryRef v49 = 0;
  CFMutableDictionaryRef v50 = 0;
  CFDataRef v48 = 0;
  v1 = (ACFULogging *)MGCopyAnswer();
  CFDictionaryRef v2 = v1;
  if (!v1)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_52;
  }
  ACFULogging::getLogInstance(v1);
  std::string::basic_string[abi:ne180100]<0>(&v44, "VinylRestore");
  long long v3 = std::string::append(&v44, "::");
  long long v4 = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
  v45.__r_.__value_.__r.__words[2] = v3->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v4;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  long long v5 = std::string::append(&v45, "gatherPreflightParameters");
  long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
  std::string::size_type v47 = v5->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v6;
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v47) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v45.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v44.__r_.__value_.__l.__data_);
  }
  Value = CFDictionaryGetValue(v2, @"kVinylFwUpdateKeyId");
  CFTypeID v8 = CFGetTypeID(Value);
  TypeID = (ACFULogging *)CFDataGetTypeID();
  if ((ACFULogging *)v8 != TypeID) {
    goto LABEL_48;
  }
  TypeID = (ACFULogging *)CFDataGetLength((CFDataRef)Value);
  if ((unint64_t)TypeID <= 0x13) {
    goto LABEL_48;
  }
  CFDataRef v10 = (const __CFData *)CFDictionaryGetValue(v2, @"kVinylFwUpdateKeyId");
  BytePtr = CFDataGetBytePtr(v10);
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef v13 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], BytePtr, 20, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  CFDataRef v14 = v48;
  CFDataRef v48 = v13;
  __p[0] = v14;
  TypeID = (ACFULogging *)ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
  std::string::size_type v15 = v48
      ? ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get
      : 0;
  if (!v15 || !v48) {
    goto LABEL_48;
  }
  ACFULogging::getLogInstance(TypeID);
  std::string::basic_string[abi:ne180100]<0>(&v44, "VinylRestore");
  v16 = std::string::append(&v44, "::");
  long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v45.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  v18 = std::string::append(&v45, "gatherPreflightParameters");
  long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  std::string::size_type v47 = v18->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v47) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v45.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v44.__r_.__value_.__l.__data_);
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v12, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFMutableDictionaryRef v21 = v49;
  CFMutableDictionaryRef v49 = Mutable;
  __p[0] = v21;
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)__p);
  CFMutableDictionaryRef v22 = CFDictionaryCreateMutable(v12, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFMutableDictionaryRef v23 = v50;
  CFMutableDictionaryRef v50 = v22;
  __p[0] = v23;
  TypeID = (ACFULogging *)ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)__p);
  v24 = v49
      ? ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get
      : 0;
  if (!v24
    || !v49
    || (v50
      ? (v25 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get)
      : (v25 = 0),
        !v25 || !v50))
  {
LABEL_48:
    ACFULogging::getLogInstance(TypeID);
LABEL_52:
    ACFULogging::handleMessage();
    v26 = 0;
    goto LABEL_45;
  }
  v26 = CFDictionaryCreateMutable(v12, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v26)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_52;
  }
  v27 = (ACFULogging *)CFDictionaryGetValue(v2, @"kVinylFwUpdateCsn");
  if (!v27
    || (v27 = (ACFULogging *)CFDictionaryGetValue(v2, @"kVinylFwUpdateEuiccChipId")) == 0
    || (v27 = (ACFULogging *)CFDictionaryGetValue(v2, @"kVinylFwUpdateMainFwNonce")) == 0
    || (v27 = (ACFULogging *)CFDictionaryGetValue(v2, @"kVinylFwUpdateGoldFwNonce")) == 0
    || (v27 = (ACFULogging *)CFDictionaryGetValue(v2, @"kVinylFwUpdateLoaderVersion")) == 0
    || (v27 = (ACFULogging *)CFDictionaryGetValue(v2, @"kVinylFwUpdateGoldFwMac")) == 0)
  {
    ACFULogging::getLogInstance(v27);
LABEL_47:
    ACFULogging::handleMessage();
    goto LABEL_45;
  }
  v28 = CFDictionaryGetValue(v2, @"kVinylFwUpdateCsn");
  CFDictionarySetValue(v26, @"eUICC,EID", v28);
  v29 = CFDictionaryGetValue(v2, @"kVinylFwUpdateEuiccChipId");
  CFDictionarySetValue(v26, @"eUICC,ChipID", v29);
  v30 = v49;
  v31 = CFDictionaryGetValue(v2, @"kVinylFwUpdateMainFwNonce");
  CFDictionarySetValue(v30, @"Nonce", v31);
  CFDictionarySetValue(v26, @"eUICC,Main", v49);
  v32 = v50;
  v33 = CFDictionaryGetValue(v2, @"kVinylFwUpdateGoldFwNonce");
  CFDictionarySetValue(v32, @"Nonce", v33);
  CFDictionarySetValue(v26, @"eUICC,Gold", v50);
  CFDictionarySetValue(v26, @"eUICC,RootKeyIdentifier", v48);
  v34 = CFDictionaryGetValue(v2, @"kVinylFwUpdateLoaderVersion");
  CFDictionarySetValue(v26, @"eUICC,FirmwareLoaderVersion", v34);
  v35 = CFDictionaryGetValue(v2, @"kVinylFwUpdateMainFwMac");
  CFDictionarySetValue(v26, @"eUICC,MainFwMac", v35);
  v36 = CFDictionaryGetValue(v2, @"kVinylFwUpdateGoldFwMac");
  CFDictionarySetValue(v26, @"eUICC,GoldFwMac", v36);
  v37 = (const void *)MGCopyAnswer();
  if (!v37)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_47;
  }
  CFDictionarySetValue(v26, @"eUICC,ApProductionMode", v37);
  CFDictionarySetValue(v26, @"@eUICC,Ticket", (const void *)*MEMORY[0x263EFFB40]);
  ACFULogging::getLogInstance(v38);
  std::string::basic_string[abi:ne180100]<0>(&v44, "VinylRestore");
  v39 = std::string::append(&v44, "::");
  long long v40 = *(_OWORD *)&v39->__r_.__value_.__l.__data_;
  v45.__r_.__value_.__r.__words[2] = v39->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v40;
  v39->__r_.__value_.__l.__size_ = 0;
  v39->__r_.__value_.__r.__words[2] = 0;
  v39->__r_.__value_.__r.__words[0] = 0;
  v41 = std::string::append(&v45, "gatherPreflightParameters");
  long long v42 = *(_OWORD *)&v41->__r_.__value_.__l.__data_;
  std::string::size_type v47 = v41->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v42;
  v41->__r_.__value_.__l.__size_ = 0;
  v41->__r_.__value_.__r.__words[2] = 0;
  v41->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v47) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v45.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v44.__r_.__value_.__l.__data_);
  }
LABEL_45:
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v48);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&v49);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&v50);
  return v26;
}

void sub_230AD60C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v30 - 72));
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)(v30 - 64));
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)(v30 - 56));
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t VinylRestore::init(VinylRestore *this, const __CFDictionary *a2, const void *a3)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  long long v6 = (ACFULogging *)ACFURestore::init(this, a2, a3);
  uint64_t v7 = (uint64_t)v6;
  if (v6)
  {
    ACFULogging::getLogInstance(v6);
    ACFULogging::handleMessage();
    return v7;
  }
  CFTypeID v8 = (ACFULogging *)CFDictionaryContainsKey(*((CFDictionaryRef *)this + 16), @"RestoreSystemPartition");
  if (v8)
  {
    Value = (__CFString *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 16), @"RestoreSystemPartition");
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID != CFGetTypeID(Value)) {
      return 4002;
    }
  }
  else
  {
    ACFULogging::getLogInstance(v8);
    ACFULogging::handleMessage();
    Value = &stru_26E5569E0;
  }
  if (CFDictionaryContainsKey(*((CFDictionaryRef *)this + 16), @"DebugLogPath"))
  {
    std::string v11 = CFDictionaryGetValue(*((CFDictionaryRef *)this + 16), @"DebugLogPath");
    CFTypeID v12 = CFGetTypeID(v11);
    CFDataRef v13 = (ACFULogging *)CFStringGetTypeID();
    if ((ACFULogging *)v12 != v13)
    {
      ACFULogging::getLogInstance(v13);
      ACFULogging::handleMessage();
      return 4002;
    }
  }
  isPreflight = (ACFULogging *)ACFURestore::isPreflight(this);
  if (isPreflight)
  {
    std::string::size_type v15 = (std::__shared_weak_count *)*((void *)this + 24);
    uint64_t v39 = *((void *)this + 23);
    long long v40 = v15;
    if (v15) {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    VinylTransport::createTransport(&v39, *((void *)this + 17), &v54);
    std::shared_ptr<ACFUTransport>::operator=[abi:ne180100]<VinylTransport,std::default_delete<VinylTransport>,void>((void *)this + 21, (uint64_t *)&v54);
    v16 = v54;
    v54 = 0;
    if (v16) {
      (*(void (**)(ACFUTransport *))(*(void *)v16 + 64))(v16);
    }
    long long v17 = (ACFULogging *)v40;
    if (v40) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v40);
    }
    if (!*((void *)this + 21))
    {
      ACFULogging::getLogInstance(v17);
      ACFULogging::handleMessage();
      return 4008;
    }
    ACFULogging::getLogInstance(v17);
    ACFULogging::handleMessage();
    v18 = 0;
    goto LABEL_52;
  }
  LODWORD(v54) = 1;
  v58 = 0;
  std::string::size_type v59 = 0;
  v55 = 0;
  v56 = 0;
  v57 = &v58;
  __int16 v53 = 1;
  ACFULogging::getLogInstance(isPreflight);
  std::string::basic_string[abi:ne180100]<0>(&v49, "VinylRestore");
  long long v19 = std::string::append(&v49, "::");
  long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  v50.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v50.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  CFMutableDictionaryRef v21 = std::string::append(&v50, "init");
  long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  std::string::size_type v52 = v21->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v52) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v50.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v49.__r_.__value_.__l.__data_);
  }
  URLByAppendingStrings = (std::__shared_weak_count *)ACFUCommon::createURLByAppendingStrings((ACFUCommon *)Value, @"/usr/standalone/firmware/Vinyl/", v23);
  if (!URLByAppendingStrings)
  {
    ACFULogging::getLogInstance(0);
    v34 = 0;
    ACFULogging::handleMessage();
    uint64_t v7 = 4000;
    goto LABEL_68;
  }
  v55 = @"eUICC,Ticket";
  v56 = URLByAppendingStrings;
  getVinylTatsuTagToFileNameMap((uint64_t)__p);
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v57, v58);
  v25 = (char *)__p[1];
  v57 = (char **)__p[0];
  v58 = (char *)__p[1];
  std::string::size_type v59 = v52;
  if (v52)
  {
    *((void *)__p[1] + 2) = &v58;
    __p[0] = &__p[1];
    __p[1] = 0;
    std::string::size_type v52 = 0;
    v25 = 0;
  }
  else
  {
    v57 = &v58;
  }
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)__p, v25);
  RTKitFirmware::create();
  std::shared_ptr<ACFUFirmware>::operator=[abi:ne180100]<RTKitFirmware,std::default_delete<RTKitFirmware>,void>((void *)this + 19, (uint64_t *)__p);
  v26 = (ACFULogging *)__p[0];
  __p[0] = 0;
  if (v26) {
    v26 = (ACFULogging *)(*(uint64_t (**)(ACFULogging *))(*(void *)v26 + 56))(v26);
  }
  if (!*((void *)this + 19))
  {
    ACFULogging::getLogInstance(v26);
    v34 = 0;
    ACFULogging::handleMessage();
    uint64_t v7 = 1000;
    goto LABEL_68;
  }
  v27 = (std::__shared_weak_count *)*((void *)this + 24);
  uint64_t v47 = *((void *)this + 23);
  CFDataRef v48 = v27;
  if (v27) {
    atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  VinylTransport::createTransport(&v47, *((void *)this + 17), (ACFUTransport **)__p);
  v28 = (uint64_t *)((char *)this + 168);
  std::shared_ptr<ACFUTransport>::operator=[abi:ne180100]<VinylTransport,std::default_delete<VinylTransport>,void>((void *)this + 21, (uint64_t *)__p);
  v29 = __p[0];
  __p[0] = 0;
  if (v29) {
    (*(void (**)(void *))(*(void *)v29 + 64))(v29);
  }
  uint64_t v30 = (ACFULogging *)v48;
  if (v48) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v48);
  }
  if (!*v28)
  {
    ACFULogging::getLogInstance(v30);
    v34 = 0;
    ACFULogging::handleMessage();
LABEL_67:
    uint64_t v7 = 4008;
LABEL_68:
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v57, v58);
    if (!v34) {
      return v7;
    }
    goto LABEL_58;
  }
  v31 = (std::__shared_weak_count *)*((void *)this + 22);
  uint64_t v45 = *v28;
  v46 = v31;
  if (v31) {
    atomic_fetch_add_explicit(&v31->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v32 = (std::__shared_weak_count *)*((void *)this + 20);
  uint64_t v43 = *((void *)this + 19);
  std::string v44 = v32;
  if (v32) {
    atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v33 = (std::__shared_weak_count *)*((void *)this + 24);
  uint64_t v41 = *((void *)this + 23);
  long long v42 = v33;
  if (v33) {
    atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ACFURTKitROM::create();
  v18 = (__CFString *)__p[0];
  v34 = (std::__shared_weak_count *)__p[1];
  __p[0] = 0;
  __p[1] = 0;
  if (v42) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v42);
  }
  if (v44) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v44);
  }
  v35 = (ACFULogging *)v46;
  if (v46) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v46);
  }
  if (!v18)
  {
    ACFULogging::getLogInstance(v35);
    ACFULogging::handleMessage();
    goto LABEL_67;
  }
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v57, v58);
  if (v34)
  {
    char v36 = 0;
    atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
    LODWORD(v54) = 0;
    v55 = v18;
    v56 = v34;
    atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
    goto LABEL_53;
  }
LABEL_52:
  v34 = 0;
  LODWORD(v54) = 0;
  char v36 = 1;
  v55 = v18;
  v56 = 0;
LABEL_53:
  LOWORD(v57) = 3;
  BYTE2(v57) = 1;
  std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__assign_unique<std::pair<ACFURestore::UpdateSteps const,RestoreStep> const*>((uint64_t **)this + 3, (int *)&v54, (int *)&v58);
  v37 = (ACFULogging *)v56;
  if (v56) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v56);
  }
  if ((v36 & 1) == 0) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v34);
  }
  ACFULogging::getLogInstance(v37);
  ACFULogging::handleMessage();
  uint64_t v7 = 0;
  if (v34) {
LABEL_58:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v34);
  return v7;
}

void sub_230AD6824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, std::__shared_weak_count *a17, uint64_t a18, std::__shared_weak_count *a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  if (a15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a15);
  }
  if (a17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a17);
  }
  if (a19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a19);
  }
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(v40, *(char **)(v41 - 112));
  _Unwind_Resume(a1);
}

void *std::shared_ptr<ACFUFirmware>::operator=[abi:ne180100]<RTKitFirmware,std::default_delete<RTKitFirmware>,void>(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (*a2)
  {
    long long v5 = operator new(0x20uLL);
    void *v5 = &unk_26E555DD8;
    v5[1] = 0;
    v5[2] = 0;
    v5[3] = v4;
  }
  else
  {
    long long v5 = 0;
  }
  *a2 = 0;
  long long v6 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v5;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  return a1;
}

void *std::shared_ptr<ACFUTransport>::operator=[abi:ne180100]<VinylTransport,std::default_delete<VinylTransport>,void>(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (*a2)
  {
    long long v5 = operator new(0x20uLL);
    void *v5 = &unk_26E555E38;
    v5[1] = 0;
    v5[2] = 0;
    v5[3] = v4;
  }
  else
  {
    long long v5 = 0;
  }
  *a2 = 0;
  long long v6 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v5;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  return a1;
}

uint64_t VinylRestore::updateAllowed(VinylRestore *this)
{
  CFDictionaryRef v2 = (const void *)*((void *)this + 21);
  if (!v2)
  {
    long long v3 = 0;
    goto LABEL_6;
  }
  if (!v3)
  {
LABEL_6:
    uint64_t v4 = 0;
    goto LABEL_7;
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 22);
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
LABEL_7:
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 17), @"BasebandUpdater");
  ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v25, Value);
  long long v6 = (ACFULogging *)ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v24, *((const __CFDictionary **)this + 17));
  ACFULogging::getLogInstance(v6);
  ACFURestore::isPreflight(this);
  ACFULogging::handleMessage();
  int Bool = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v25, @"VinylSkipAll");
  int v8 = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v24, @"UpdateBaseband");
  if (ACFURestore::isPreflight(this))
  {
    uint64_t v9 = (ACFULogging *)MGCopyAnswer();
    CFDictionaryRef v10 = v9;
    if (v9)
    {
      ACFULogging::getLogInstance(v9);
      std::string::basic_string[abi:ne180100]<0>(&v20, "VinylRestore");
      std::string v11 = std::string::append(&v20, "::");
      long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
      v21.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v21.__r_.__value_.__l.__data_ = v12;
      v11->__r_.__value_.__l.__size_ = 0;
      v11->__r_.__value_.__r.__words[2] = 0;
      v11->__r_.__value_.__r.__words[0] = 0;
      CFDataRef v13 = std::string::append(&v21, "updateAllowed");
      long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
      std::string::size_type v23 = v13->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v14;
      v13->__r_.__value_.__l.__size_ = 0;
      v13->__r_.__value_.__r.__words[2] = 0;
      v13->__r_.__value_.__r.__words[0] = 0;
      ACFULogging::handleMessageCFType();
      if (SHIBYTE(v23) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v21.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v20.__r_.__value_.__l.__data_);
      }
      uint64_t v9 = (ACFULogging *)CFDictionaryGetValue(v10, @"kVinylFwUpdateCsn");
      CFDataRef v15 = v9;
    }
    else
    {
      CFDataRef v15 = 0;
    }
    ACFULogging::getLogInstance(v9);
    int64_t Length = ACFULogging::handleMessage();
    if (v15
      && (ACFULogging::getLogInstance((ACFULogging *)Length),
          CFGetTypeID(v15),
          CFDataGetTypeID(),
          CFDataGetLength(v15),
          ACFULogging::handleMessage(),
          CFTypeID v18 = CFGetTypeID(v15),
          int64_t Length = CFDataGetTypeID(),
          v18 == Length))
    {
      int64_t Length = CFDataGetLength(v15);
      BOOL v17 = Length > 0;
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    int64_t Length = VinylTransport::checkVinylPresence(v3);
    BOOL v17 = Length;
  }
  ACFULogging::getLogInstance((ACFULogging *)Length);
  ACFULogging::handleMessage();
  MEMORY[0x230FC7740](v24);
  MEMORY[0x230FC7740](v25);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return v8 & ~Bool & v17;
}

void sub_230AD6DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a32 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  if (a19 < 0) {
    operator delete(a14);
  }
  MEMORY[0x230FC7740](v33 - 112);
  MEMORY[0x230FC7740](v33 - 96);
  if (v32) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }
  _Unwind_Resume(a1);
}

const void **ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(const void **a1)
{
  CFDictionaryRef v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(const void **a1)
{
  CFDictionaryRef v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
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
    long long v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    long long v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264BA1D68, MEMORY[0x263F8C060]);
}

void sub_230AD6FD4(_Unwind_Exception *a1)
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

void std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(a1, *(void *)a2);
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(a1, *((void *)a2 + 1));
    if (a2[63] < 0) {
      operator delete(*((void **)a2 + 5));
    }
    operator delete(a2);
  }
}

void std::__shared_ptr_pointer<RTKitFirmware  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<RTKitFirmware  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 56))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<RTKitFirmware  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else {
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

void std::__shared_ptr_pointer<VinylTransport  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<VinylTransport  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 64))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<VinylTransport  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else {
    return 0;
  }
}

uint64_t **std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__assign_unique<std::pair<ACFURestore::UpdateSteps const,RestoreStep> const*>(uint64_t **result, int *a2, int *a3)
{
  size_t v5 = result;
  if (result[2])
  {
    long long v6 = *result;
    uint64_t v7 = result[1];
    *uint64_t result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1]) {
      uint64_t v8 = (uint64_t *)v6[1];
    }
    else {
      uint64_t v8 = v6;
    }
    CFDictionaryRef v10 = result;
    std::string v11 = v8;
    long long v12 = v8;
    if (v8)
    {
      std::string v11 = std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::_DetachedTreeCache::__detach_next((uint64_t)v8);
      while (a2 != a3)
      {
        std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__node_assign_unique(v5, a2, (uint64_t)v8);
        if (v9)
        {
          uint64_t v8 = v11;
          long long v12 = v11;
          if (!v11)
          {
            a2 += 8;
            break;
          }
          std::string v11 = std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::_DetachedTreeCache::__detach_next((uint64_t)v11);
        }
        else
        {
          uint64_t v8 = v12;
        }
        a2 += 8;
        if (!v8) {
          break;
        }
      }
    }
    uint64_t result = (uint64_t **)std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v10);
  }
  while (a2 != a3)
  {
    uint64_t result = std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__emplace_unique_key_args<ACFURestore::UpdateSteps,std::pair<ACFURestore::UpdateSteps const,RestoreStep> const&>(v5, a2, (uint64_t)a2);
    a2 += 8;
  }
  return result;
}

void sub_230AD7378(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__node_assign_unique(uint64_t **a1, int *a2, uint64_t a3)
{
  uint64_t v3 = (uint64_t *)a3;
  long long v6 = a1 + 1;
  size_t v5 = a1[1];
  int v7 = *a2;
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v8 = (uint64_t **)v5;
        int v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9) {
          break;
        }
        size_t v5 = *v8;
        long long v6 = v8;
        if (!*v8) {
          goto LABEL_9;
        }
      }
      if (v9 >= v7) {
        return (uint64_t *)v8;
      }
      size_t v5 = v8[1];
      if (!v5)
      {
        long long v6 = v8 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v8 = a1 + 1;
LABEL_9:
    *(_DWORD *)(a3 + 32) = v7;
    RestoreStep::operator=();
    std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__insert_node_at(a1, (uint64_t)v8, v6, v3);
  }
  return v3;
}

uint64_t *std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  size_t v5 = (uint64_t *)**a1;
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
      size_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), size_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            int v9 = (uint64_t **)a2[2];
          }
          else
          {
            int v9 = (uint64_t **)v2[1];
            CFDictionaryRef v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *int v9 = v2;
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
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), size_t v5 = v4 + 3, v6))
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
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void *std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 16);
  if (result)
  {
    uint64_t v3 = (void *)*result;
    if (*result == a1)
    {
      *uint64_t result = 0;
      while (1)
      {
        size_t v4 = (void *)result[1];
        if (!v4) {
          break;
        }
        do
        {
          uint64_t result = v4;
          size_t v4 = (void *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; uint64_t v3 = (void *)result[1])
      {
        do
        {
          uint64_t result = v3;
          uint64_t v3 = (void *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::destroy(*(void *)a1, *(void **)(a1 + 16));
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
    std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::destroy(*(void *)a1, v2);
  }
  return a1;
}

void std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::destroy(a1, a2[1]);
    size_t v4 = (std::__shared_weak_count *)a2[6];
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    operator delete(a2);
  }
}

uint64_t **std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__emplace_unique_key_args<ACFURestore::UpdateSteps,std::pair<ACFURestore::UpdateSteps const,RestoreStep> const&>(uint64_t **a1, int *a2, uint64_t a3)
{
  int v6 = a1 + 1;
  size_t v5 = a1[1];
  if (v5)
  {
    int v7 = *a2;
    while (1)
    {
      while (1)
      {
        int v8 = (uint64_t **)v5;
        int v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9) {
          break;
        }
        size_t v5 = *v8;
        int v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        return v8;
      }
      size_t v5 = v8[1];
      if (!v5)
      {
        int v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    int v8 = a1 + 1;
LABEL_10:
    CFDictionaryRef v10 = operator new(0x40uLL);
    uint64_t v11 = v10;
    v10[8] = *(_DWORD *)a3;
    uint64_t v12 = *(void *)(a3 + 16);
    *((void *)v10 + 5) = *(void *)(a3 + 8);
    *((void *)v10 + 6) = v12;
    if (v12) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
    }
    *((_WORD *)v10 + 28) = *(_WORD *)(a3 + 24);
    *((unsigned char *)v10 + 58) = *(unsigned char *)(a3 + 26);
    std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__insert_node_at(a1, (uint64_t)v8, v6, (uint64_t *)v10);
  }
  return (uint64_t **)v11;
}

void *eUICCFwReaderOpen(ACFULogging *a1)
{
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  size_t v4 = vinyl_unzOpen((uint64_t)BytePtr, Length);
  if (!v4)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
  }
  return v4;
}

uint64_t eUICCFwReaderClose(ACFULogging *a1)
{
  if (a1) {
    vinyl_unzClose((uint64_t)a1);
  }
  return 0;
}

uint64_t eUICCFwReaderFindFile(uint64_t a1, CFStringRef theString)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (CFStringGetCString(theString, buffer, 1024, 0x8000100u)) {
    return 4 * (vinyl_unzLocateFile(a1, buffer, 0) != 0);
  }
  else {
    return 99;
  }
}

ACFULogging *eUICCFwReaderFindAndCopyFileData(ACFULogging *a1, CFStringRef theString, CFTypeRef *a3)
{
  CFTypeRef v20 = 0;
  if (theString)
  {
    ACFULogging::getLogInstance(a1);
    std::string::basic_string[abi:ne180100]<0>(&v16, "eUICCFwReader");
    int v6 = std::string::append(&v16, "::");
    long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
    v17.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v7;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    int v8 = std::string::append(&v17, "eUICCFwReaderFindAndCopyFileData");
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    std::string::size_type v19 = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType();
    if (SHIBYTE(v19) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v17.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v16.__r_.__value_.__l.__data_);
    }
  }
  File = (ACFULogging *)eUICCFwReaderFindFile((uint64_t)a1, theString);
  if (File)
  {
    uint64_t v11 = File;
    ACFULogging::getLogInstance(File);
    ACFULogging::handleMessage();
    return v11;
  }
  else
  {
    uint64_t v13 = (ACFULogging *)eUICCFwReaderCopyFileData((uint64_t)a1, &v20);
    uint64_t v12 = v13;
    if (v13)
    {
      ACFULogging::getLogInstance(v13);
      ACFULogging::handleMessage();
      CFTypeRef v14 = v20;
      if (!v20) {
        return v12;
      }
    }
    else
    {
      CFTypeRef v14 = v20;
      if (!v20)
      {
        ACFULogging::getLogInstance(v13);
        ACFULogging::handleMessage();
        return 0;
      }
      *a3 = CFRetain(v20);
    }
    CFRelease(v14);
  }
  return v12;
}

void sub_230AD7B78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICCFwReaderCopyFileData(uint64_t a1, CFTypeRef *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (vinyl_unzGetCurrentFileInfo(a1, (uint64_t)&v10, (uint64_t)v12, 0x400uLL, 0, 0, 0, 0)) {
    return 15;
  }
  size_t v4 = (const UInt8 *)malloc(__size);
  if (!v4) {
    return 2;
  }
  uint64_t v5 = v4;
  if (vinyl_unzOpenCurrentFile(a1)) {
    return 15;
  }
  int CurrentFile = vinyl_unzReadCurrentFile(a1, (uint64_t)v5, __size);
  if (__size != CurrentFile) {
    return 4;
  }
  if (vinyl_unzCloseCurrentFile(a1)) {
    return 15;
  }
  CFDataRef v7 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], v5, __size, (CFAllocatorRef)*MEMORY[0x263EFFB18]);
  if (!v7) {
    return 2;
  }
  CFDataRef v8 = v7;
  *a2 = CFRetain(v7);
  CFRelease(v8);
  return 0;
}

uint64_t eUICCFwReaderStart(ACFULogging *a1, uint64_t (*a2)(uint64_t, CFStringRef, ACFULogging *), uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();
  int v6 = (ACFULogging *)eUICCFwReaderOpen(a1);
  if (!v6)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    uint64_t v11 = 4;
    goto LABEL_9;
  }
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  while (1)
  {
    if (vinyl_unzGetCurrentFileInfo((uint64_t)v6, (uint64_t)v14, (uint64_t)cStr, 0x400uLL, 0, 0, 0, 0))
    {
      uint64_t v11 = 15;
      goto LABEL_9;
    }
    if (cStr[0]) {
      break;
    }
LABEL_7:
    if (vinyl_unzGoToNextFile(v6))
    {
LABEL_8:
      uint64_t v11 = 0;
      goto LABEL_9;
    }
  }
  CFStringRef v8 = CFStringCreateWithCString(v7, cStr, 0x8000100u);
  if (v8)
  {
    CFStringRef v9 = v8;
    char v10 = a2(a3, v8, v6);
    CFRelease(v9);
    if ((v10 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v11 = 3;
LABEL_9:
  uint64_t v12 = (ACFULogging *)eUICCFwReaderClose(v6);
  ACFULogging::getLogInstance(v12);
  ACFULogging::handleMessage();
  return v11;
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
    size_t v4 = result;
    while (1)
    {
      __darwin_ct_rune_t v5 = readdir(v4);
      if (!v5) {
        break;
      }
      std::string::basic_string[abi:ne180100](__p, v5->d_name, v5->d_namlen);
      int v6 = std::__list_imp<std::string>::__create_node[abi:ne180100]<std::string const&>((uint64_t)a2, 0, 0, (uint64_t)__p);
      v6[1] = a2;
      uint64_t v7 = *a2;
      void *v6 = *a2;
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

void sub_230AD8004(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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

void sub_230AD80D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16)
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
  CFStringRef v8 = (char *)operator new[](v7 + 1);
  char v9 = v8;
  char v10 = v8;
  if (v7)
  {
    uint64_t v11 = 0;
    unsigned int v12 = 1;
    char v10 = v8;
    do
    {
      uint64_t v13 = (uint64_t *)*a1;
      if (!v6) {
        uint64_t v13 = a1;
      }
      if (std::string::find(a2, *((unsigned char *)v13 + v11), 0) == -1)
      {
        if (*((char *)a1 + 23) >= 0) {
          CFTypeRef v14 = a1;
        }
        else {
          CFTypeRef v14 = (uint64_t *)*a1;
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
  char *v10 = 0;
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
        char v10 = a1[23] >= 0 ? a1 : *(char **)a1;
        uint64_t v11 = &v10[v5];
        if (v5 >= v4 || !v9) {
          break;
        }
        *uint64_t v11 = 0;
        ++v5;
      }
      uint64_t v13 = (char **)a2[1];
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
          std::string::size_type v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<char *>>((uint64_t)(a2 + 2), v18);
        }
        else {
          std::string::size_type v19 = 0;
        }
        CFTypeRef v20 = &v19[8 * v15];
        *(void *)CFTypeRef v20 = v11;
        CFTypeRef v14 = v20 + 8;
        long long v22 = (char *)*a2;
        std::string v21 = (char *)a2[1];
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
          std::string v21 = (char *)*a2;
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
        *uint64_t v13 = v11;
        CFTypeRef v14 = v13 + 1;
      }
      a2[1] = v14;
      unint64_t v24 = v5 + 1;
      do
      {
        unint64_t v25 = v24;
        if (a1[23] >= 0) {
          v26 = a1;
        }
        else {
          v26 = *(char **)a1;
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
      std::vector<char *>::__throw_length_error[abi:ne180100]();
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
      char v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<char *>>((uint64_t)(a2 + 2), v35);
    }
    else {
      char v36 = 0;
    }
    v37 = &v36[8 * v32];
    v38 = &v36[8 * v35];
    *(void *)v37 = 0;
    v31 = v37 + 8;
    uint64_t v40 = (char *)*a2;
    uint64_t v39 = (char *)a2[1];
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
      uint64_t v39 = (char *)*a2;
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
    void *v30 = 0;
    v31 = v30 + 1;
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
  unsigned int v8 = (const void *)MEMORY[0x230FC6FA0](&obj);
  if (!v8)
  {
    uint64_t v18 = 0;
    CFTypeRef v20 = "BBUpdaterExtremeCreateWithError rejected with error\n";
    if ((*(unsigned char *)gBBULogMaskGet() & 2) == 0 || gBBULogVerbosity < 6) {
      goto LABEL_53;
    }
    _BBULog(1, 6, "BBUCommon", "", "check failed: %s, %d, assertion: %s\n", v22, v23, v24, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Support/BBUCommon.cpp");
    unsigned int v8 = 0;
    goto LABEL_52;
  }
  BBUpdaterRegisterLogSink();
  CFNumberRef v9 = CFNumberCreate(v6, kCFNumberIntType, &valuePtr);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v6, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
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
    CFTypeRef v20 = "BBUpdaterSetOptions rejected  with error\n";
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
  uint64_t v13 = (unsigned char *)gBBULogMaskGet();
  if (!v12)
  {
    uint64_t v18 = 0;
    CFTypeRef v20 = "BBUpdaterExecCommand rejected  with error\n";
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
    unsigned int v8 = (const void *)MEMORY[0x230FC6FA0](&obj);
    if (!v8)
    {
      uint64_t v18 = 1;
      CFTypeRef v20 = "BBUpdaterExtremeCreateWithError rejected with error\n";
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
      std::string::size_type v19 = (unsigned char *)gBBULogMaskGet();
      if (v18)
      {
        uint64_t v18 = 1;
        CFTypeRef v20 = "BB reset successful\n";
LABEL_21:
        _BBULog(0, 0xFFFFFFFFLL, "BBUCommon", "", v20, v14, v15, v16, (char)v28);
        goto LABEL_23;
      }
      CFTypeRef v20 = "BBUpdaterExecCommand rejected  with error\n";
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
      CFTypeRef v20 = "BBUpdaterSetOptions rejected  with error\n";
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

void sub_230AD8D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
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

void sub_230AD8FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get(uint64_t a1)
{
  return *(void *)a1;
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

void sub_230AD9090(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

const void **BBUpdaterCommon::BBUReadNVRAM@<X0>(const void **a1@<X8>)
{
  {
    BBUpdaterCommon::BBUReadNVRAM(void)::nvramInfo = 0;
    __cxa_atexit((void (*)(void *))ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef, &BBUpdaterCommon::BBUReadNVRAM(void)::nvramInfo, &dword_230AD4000);
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

void sub_230AD91F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, const void *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
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
  int v0 = MEMORY[0x230FC7380](*MEMORY[0x263EF87F0], &v25);
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

void sub_230AD9458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
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

void sub_230AD954C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
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

void sub_230AD9764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
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

void sub_230AD9800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
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

void sub_230AD98A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
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

const void **ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef(const void **a1)
{
  int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(const void **a1)
{
  int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(const void **a1)
{
  int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
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

const void **ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(const void **a1)
{
  int v2 = *a1;
  if (v2) {
    CFRelease(v2);
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
    *__dst = v6;
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

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  char v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
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

void sub_230AD9CCC(_Unwind_Exception *a1)
{
  operator delete(v1);
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

void std::vector<char *>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<char *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
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
    const void *v2 = *a1;
    std::string::size_type v6 = v3;
  }
  else
  {
    CFTypeRef v4 = *v2;
    const void *v2 = 0;
    std::string::size_type v6 = v4;
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

VinylSecureElement *VinylSecureElement::create(VinylSecureElement *this)
{
  char v1 = (VinylSecureElement *)operator new(1uLL);
  VinylSecureElement::init(v1);
  return v1;
}

uint64_t VinylSecureElement::init(VinylSecureElement *this)
{
  char v1 = dlopen("/usr/lib/libnfrestore.dylib", 261);
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

void sub_230ADA0B8(_Unwind_Exception *a1)
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

const void **CFOBJ_STR@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  CFStringRef v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@", *a1);
  ctu::cf::assign();
  return ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v3);
}

void sub_230ADA29C(_Unwind_Exception *a1, uint64_t a2, ...)
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
    return dword_230B06420[a1];
  }
}

uint64_t eUICC::Perso::Perform(uint64_t a1, uint64_t a2, void (****a3)(std::string *__return_ptr))
{
  pthread_mutex_lock(&ctu::Singleton<eUICC::Perso::PersoImplementation,eUICC::Perso::PersoImplementation,ctu::PthreadMutexGuardPolicy<eUICC::Perso::PersoImplementation>>::sInstance);
  uint64_t v6 = off_26870BBB8;
  if (!off_26870BBB8)
  {
    int v7 = operator new(0x38uLL);
    v7[4] = 0;
    v7[5] = 0;
    v7[6] = 0;
    v7[1] = 0;
    v7[2] = 0;
    *int v7 = 0;
    std::shared_ptr<eUICC::Perso::PersoImplementation>::shared_ptr[abi:ne180100]<eUICC::Perso::PersoImplementation,void>(&v13, (uint64_t)v7);
    long long v8 = v13;
    long long v13 = 0uLL;
    uint64_t v9 = (std::__shared_weak_count *)*(&off_26870BBB8 + 1);
    off_26870BBB8 = v8;
    if (v9)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
      if (*((void *)&v13 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v13 + 1));
      }
    }
    uint64_t v6 = off_26870BBB8;
  }
  uint64_t v10 = (std::__shared_weak_count *)*(&off_26870BBB8 + 1);
  if (*(&off_26870BBB8 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26870BBB8 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<eUICC::Perso::PersoImplementation,eUICC::Perso::PersoImplementation,ctu::PthreadMutexGuardPolicy<eUICC::Perso::PersoImplementation>>::sInstance);
  uint64_t v11 = eUICC::Perso::PersoImplementation::Perform(v6, a1, a2, a3);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  return v11;
}

void sub_230ADA3DC(_Unwind_Exception *a1)
{
}

uint64_t eUICC::Perso::PersoImplementation::Perform(uint64_t a1, uint64_t a2, uint64_t a3, void (****a4)(std::string *__return_ptr))
{
  std::string __p = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  if (!*a4)
  {
    gBBULogMaskGet();
    CFTypeRef v20 = "vinylValve";
LABEL_18:
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v17, v18, v19, (char)v20);
    uint64_t v21 = 10;
    goto LABEL_22;
  }
  *(void *)(a1 + 24) = a2;
  dispatch_queue_t v8 = dispatch_queue_create("PersoImpl", 0);
  uint64_t v9 = *(NSObject **)a1;
  *(void *)a1 = v8;
  if (v9) {
    dispatch_release(v9);
  }
  uint64_t v10 = *(unsigned __int8 *)(a2 + 39);
  if ((v10 & 0x80u) != 0) {
    uint64_t v10 = *(void *)(a2 + 24);
  }
  if (!v10)
  {
    gBBULogMaskGet();
    CFTypeRef v20 = "!performOptions.alderHostname.empty()";
    goto LABEL_18;
  }
  ReverseProxyGetSettings(a2 + 16, (uint64_t *)&v38);
  uint64_t v11 = (const void **)(a1 + 8);
  if ((const void **)(a1 + 8) != &v38)
  {
    long long v42 = *v11;
    *uint64_t v11 = v38;
    v38 = 0;
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v42);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v38);
  if (*v11) {
    uint64_t v12 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    uint64_t v12 = 0;
  }
  if (!v12)
  {
    gBBULogMaskGet();
    CFTypeRef v20 = "this->reverseProxySettings";
    goto LABEL_18;
  }
  if (eUICC::Perso::PersoImplementation::ForcePerso((BBUpdaterCommon *)a1, (uint64_t)&__p, a4))
  {
    gBBULogMaskGet();
    uint64_t v16 = "kBBUReturnSuccess == ret";
LABEL_21:
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)v16);
    uint64_t v21 = 18;
    goto LABEL_22;
  }
  if (eUICC::Perso::PersoImplementation::InitPersoDevice((BBUpdaterCommon *)a1, (uint64_t)&__p, a4)
    || __p == v40)
  {
    goto LABEL_20;
  }
  if (eUICC::Perso::PersoImplementation::InitPersoServer((void *)a1, (uint64_t)&__p, a3, a4)
    || __p == v40)
  {
    goto LABEL_29;
  }
  if (eUICC::Perso::PersoImplementation::AuthenticatePersoDevice((void *)a1, (uint64_t)&__p, a4)
    || __p == v40)
  {
LABEL_20:
    gBBULogMaskGet();
    uint64_t v16 = "kBBUReturnSuccess == ret && !dataBuffer.empty()";
    goto LABEL_21;
  }
  if (eUICC::Perso::PersoImplementation::GetWrapKeyServer(a1, (uint64_t)&__p) || __p == v40) {
    goto LABEL_29;
  }
  uint64_t v21 = eUICC::Perso::PersoImplementation::FinalizePersoDevice((void *)a1, (uint64_t)&__p, a4);
  if (v21)
  {
LABEL_38:
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v31, v32, v33, (char)"kBBUReturnSuccess == ret");
    goto LABEL_22;
  }
  uint64_t v34 = *(const void **)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  long long v42 = v34;
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v42);
  NonceServer = (BBUpdaterCommon *)eUICC::Perso::PersoImplementation::GetNonceServer((void *)a1, (uint64_t)&__p, (void (****)(void *__return_ptr))a4);
  if (NonceServer
    || __p == v40
    || eUICC::Perso::PersoImplementation::CreateValidationBlob(NonceServer, (unint64_t *)&__p)
    || __p == v40
    || eUICC::Perso::PersoImplementation::ValidatePersoDevice((void *)a1, (uint64_t)&__p, a4)
    || __p == v40)
  {
LABEL_29:
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v28, v29, v30, (char)"kBBUReturnSuccess == ret && !dataBuffer.empty()");
    uint64_t v21 = 53;
    goto LABEL_22;
  }
  uint64_t v21 = eUICC::Perso::PersoImplementation::SendReceiptServer((void *)a1, (uint64_t)&__p);
  if (v21) {
    goto LABEL_38;
  }
  uint64_t v37 = *(void *)(a1 + 32);
  for (uint64_t i = *(void *)(a1 + 40);
        i != v37;
        std::allocator<std::pair<std::string,std::vector<unsigned char>>>::destroy[abi:ne180100](a1 + 48, i))
  {
    i -= 48;
  }
  uint64_t v21 = 0;
  *(void *)(a1 + 4pthread_mutex_init(this, 0) = v37;
LABEL_22:
  uint64_t v22 = *(const void **)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  long long v42 = v22;
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v42);
  *(void *)(a1 + 24) = 0;
  uint64_t v23 = *(NSObject **)a1;
  *(void *)a1 = 0;
  if (v23) {
    dispatch_release(v23);
  }
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "ret %d records %zu\n", v24, v25, v26, v21);
  if (__p)
  {
    uint64_t v40 = __p;
    operator delete(__p);
  }
  return v21;
}

void sub_230ADA8A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void eUICC::Perso::DumpTransactions(std::string *a1@<X8>)
{
  pthread_mutex_lock(&ctu::Singleton<eUICC::Perso::PersoImplementation,eUICC::Perso::PersoImplementation,ctu::PthreadMutexGuardPolicy<eUICC::Perso::PersoImplementation>>::sInstance);
  uint64_t v3 = off_26870BBB8;
  if (!off_26870BBB8)
  {
    uint64_t v4 = operator new(0x38uLL);
    v4[4] = 0;
    v4[5] = 0;
    v4[6] = 0;
    v4[1] = 0;
    v4[2] = 0;
    void *v4 = 0;
    std::shared_ptr<eUICC::Perso::PersoImplementation>::shared_ptr[abi:ne180100]<eUICC::Perso::PersoImplementation,void>(&v8, (uint64_t)v4);
    long long v5 = v8;
    long long v8 = 0uLL;
    uint64_t v6 = (std::__shared_weak_count *)*(&off_26870BBB8 + 1);
    off_26870BBB8 = v5;
    if (v6)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      if (*((void *)&v8 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v8 + 1));
      }
    }
    uint64_t v3 = off_26870BBB8;
  }
  int v7 = (std::__shared_weak_count *)*(&off_26870BBB8 + 1);
  if (*(&off_26870BBB8 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26870BBB8 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<eUICC::Perso::PersoImplementation,eUICC::Perso::PersoImplementation,ctu::PthreadMutexGuardPolicy<eUICC::Perso::PersoImplementation>>::sInstance);
  a1->__r_.__value_.__r.__words[0] = 0;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  std::vector<std::pair<std::string,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<std::pair<std::string,std::vector<unsigned char>>*,std::pair<std::string,std::vector<unsigned char>>*>(a1, *(long long **)(v3 + 32), *(long long **)(v3 + 40), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v3 + 40) - *(void *)(v3 + 32)) >> 4));
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
}

void sub_230ADA9BC(_Unwind_Exception *a1)
{
}

std::string *eUICC::Perso::PersoImplementation::DumpTransactions@<X0>(long long **this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  return std::vector<std::pair<std::string,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<std::pair<std::string,std::vector<unsigned char>>*,std::pair<std::string,std::vector<unsigned char>>*>(a2, this[4], this[5], 0xAAAAAAAAAAAAAAABLL * (this[5] - this[4]));
}

void *eUICC::Perso::PersoImplementation::create_default_global@<X0>(void *a1@<X8>)
{
  uint64_t v3 = operator new(0x38uLL);
  v3[5] = 0;
  v3[6] = 0;
  v3[4] = 0;
  v3[1] = 0;
  v3[2] = 0;
  *uint64_t v3 = 0;

  return std::shared_ptr<eUICC::Perso::PersoImplementation>::shared_ptr[abi:ne180100]<eUICC::Perso::PersoImplementation,void>(a1, (uint64_t)v3);
}

uint64_t eUICC::Perso::PersoImplementation::ForcePerso(BBUpdaterCommon *a1, uint64_t a2, void *a3)
{
  *(void *)&__dst[71] = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*((void *)a1 + 3) + 40)) {
    return 0;
  }
  uint64_t v36 = 0;
  uint64_t ECID = BBUpdaterCommon::getECID(a1);
  uint64_t v34 = 0;
  unint64_t v35 = 0;
  std::string __p = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  (*(void (**)(_DWORD *__return_ptr))(*(void *)*a3 + 8))(__dst);
  if (__dst[0] != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    gBBULogMaskGet();
    goto LABEL_7;
  }
  if (!LOBYTE(__dst[1]))
  {
    if (DEREncodeItemIntoVector(4uLL, 8uLL, &ECID, (unint64_t *)&v34))
    {
      gBBULogMaskGet();
LABEL_13:
      _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v9, v10, v11, (char)"DR_Success == derRet");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Failed to encode ECID\n", v12, v13, v14, v28);
      uint64_t v5 = 10;
      goto LABEL_14;
    }
    if (DEREncodeItemIntoVector(0x2000000000000010uLL, v35 - (unsigned char *)v34, v34, (unint64_t *)&__p))
    {
      gBBULogMaskGet();
      goto LABEL_13;
    }
    uint64_t v5 = (*(uint64_t (**)(void, void **, uint64_t))(*(void *)*a3 + 56))(*a3, &__p, a2);
    if (v5)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)"kBBUReturnSuccess == ret");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Failed to complete InitPerso command\n", v19, v20, v21, v29);
      goto LABEL_14;
    }
    (*(void (**)(void, void, uint64_t))(*(void *)*a3 + 16))(*a3, 0, 1);
    *(void *)std::chrono::nanoseconds __ns = 10000000000;
    std::this_thread::sleep_for ((const std::chrono::nanoseconds *)__ns);
    (*(void (**)(unsigned char *__return_ptr))(*(void *)*a3 + 8))(__ns);
    memcpy(__dst, __ns, 0x119uLL);
    if (__dst[0] == ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
    {
      if (LOBYTE(__dst[1])) {
        goto LABEL_4;
      }
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v22, v23, v24, (char)"cardData.contents.perso");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Still persod after force?\n", v25, v26, v27, v30);
LABEL_8:
      uint64_t v5 = 18;
      goto LABEL_14;
    }
    gBBULogMaskGet();
LABEL_7:
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)"cardData.Valid()");
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 0;
LABEL_14:
  if (__p)
  {
    uint64_t v32 = __p;
    operator delete(__p);
  }
  if (v34)
  {
    unint64_t v35 = v34;
    operator delete(v34);
  }
  return v5;
}

void sub_230ADAE14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, void *a17, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }
  if (a17) {
    operator delete(a17);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::Perso::PersoImplementation::InitPersoDevice(BBUpdaterCommon *a1, uint64_t a2, void *a3)
{
  uint64_t v41 = 0;
  uint64_t ECID = BBUpdaterCommon::getECID(a1);
  v38 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  unint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  if (DEREncodeItemIntoVector(4uLL, 8uLL, &ECID, (unint64_t *)&v38))
  {
    gBBULogMaskGet();
LABEL_5:
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)"DR_Success == derRet");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Failed to encode ECID\n", v9, v10, v11, v23);
    uint64_t v12 = 10;
    goto LABEL_6;
  }
  if (DEREncodeItemIntoVector(0x2000000000000010uLL, v39 - v38, v38, (unint64_t *)&v35))
  {
    gBBULogMaskGet();
    goto LABEL_5;
  }
  uint64_t v32 = 0;
  uint64_t v33 = operator new(0x19uLL);
  long long v34 = xmmword_230B06490;
  strcpy((char *)v33, "InitPersoDeviceBlob.bin");
  std::string __p = 0;
  uint64_t v31 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v35, (uint64_t)v36, v36 - (unsigned char *)v35);
  eUICC::Perso::PersoImplementation::logTransactionData(a1, (long long *)&v33, (uint64_t)&__p);
  if (__p)
  {
    uint64_t v31 = __p;
    operator delete(__p);
  }
  if (SHIBYTE(v34) < 0) {
    operator delete(v33);
  }
  uint64_t v12 = (*(uint64_t (**)(void, void **, uint64_t))(*(void *)*a3 + 56))(*a3, &v35, a2);
  if (v12)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v17, v18, v19, (char)"kBBUReturnSuccess == ret");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Failed to complete InitPerso command\n", v20, v21, v22, v24);
  }
  else
  {
    uint64_t v27 = 0;
    char v28 = operator new(0x20uLL);
    long long v29 = xmmword_230B064A0;
    strcpy((char *)v28, "InitPersoDeviceResponse.bin");
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v25, *(const void **)a2, *(void *)(a2 + 8), *(void *)(a2 + 8) - *(void *)a2);
    eUICC::Perso::PersoImplementation::logTransactionData(a1, (long long *)&v28, (uint64_t)&v25);
    if (v25)
    {
      uint64_t v26 = v25;
      operator delete(v25);
    }
    if (SHIBYTE(v29) < 0) {
      operator delete(v28);
    }
    uint64_t v12 = 0;
  }
LABEL_6:
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "InitPersoDevice %d\n", v13, v14, v15, v12);
  if (v35)
  {
    uint64_t v36 = v35;
    operator delete(v35);
  }
  if (v38)
  {
    uint64_t v39 = v38;
    operator delete(v38);
  }
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef(&v41);
  return v12;
}

void sub_230ADB130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (__p) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  uint64_t v32 = *(void **)(v30 - 96);
  if (v32)
  {
    *(void *)(v30 - 88) = v32;
    operator delete(v32);
  }
  uint64_t v33 = *(void **)(v30 - 72);
  if (v33)
  {
    *(void *)(v30 - 64) = v33;
    operator delete(v33);
  }
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)(v30 - 48));
  _Unwind_Resume(a1);
}

uint64_t eUICC::Perso::PersoImplementation::InitPersoServer(void *a1, uint64_t a2, uint64_t a3, void (****a4)(std::string *__return_ptr))
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  v73 = 0;
  CFDictionaryRef theDict = 0;
  v70 = 0;
  v71 = 0;
  uint64_t v72 = 0;
  v67 = 0;
  uint64_t v68 = 0;
  v66 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v66, *(const void **)a2, *(void *)(a2 + 8), *(void *)(a2 + 8) - *(void *)a2);
  memset(v78, 0, 24);
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v78, v66, (uint64_t)v67, v67 - (unsigned char *)v66);
  v75 = 0;
  memset(__p, 0, 24);
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(__p, *(const void **)v78, *(uint64_t *)&v78[8], *(void *)&v78[8] - *(void *)v78);
  v76 = 0;
  if (ctu::cf::convert_copy())
  {
    uint64_t v8 = v75;
    v75 = v76;
    values[0] = v8;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)values);
  }
  if (__p[0].__r_.__value_.__r.__words[0])
  {
    __p[0].__r_.__value_.__l.__size_ = __p[0].__r_.__value_.__r.__words[0];
    operator delete(__p[0].__r_.__value_.__l.__data_);
  }
  v69 = v75;
  v75 = 0;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v75);
  if (*(void *)v78)
  {
    *(void *)&v78[8] = *(void *)v78;
    operator delete(*(void **)v78);
  }
  if (v66)
  {
    v67 = v66;
    operator delete(v66);
  }
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v64, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string v64 = *(std::string *)a3;
  }
  if (SHIBYTE(v64.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external((std::string *)v78, v64.__r_.__value_.__l.__data_, v64.__r_.__value_.__l.__size_);
  }
  else {
    *(std::string *)v78 = v64;
  }
  v75 = 0;
  if ((v78[23] & 0x80000000) != 0) {
    std::string::__init_copy_ctor_external(__p, *(const std::string::value_type **)v78, *(std::string::size_type *)&v78[8]);
  }
  else {
    __p[0] = *(std::string *)v78;
  }
  v76 = 0;
  if (ctu::cf::convert_copy())
  {
    uint64_t v9 = v75;
    v75 = v76;
    values[0] = v9;
    ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)values);
  }
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p[0].__r_.__value_.__l.__data_);
  }
  v65 = v75;
  v75 = 0;
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v75);
  if ((v78[23] & 0x80000000) != 0) {
    operator delete(*(void **)v78);
  }
  if (SHIBYTE(v64.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v64.__r_.__value_.__l.__data_);
  }
  (***a4)(__p);
  if (LODWORD(__p[0].__r_.__value_.__l.__data_) != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    gBBULogMaskGet();
    uint64_t v15 = 0;
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)"hwType.Valid()");
LABEL_32:
    uint64_t v11 = 18;
    goto LABEL_33;
  }
  *(_OWORD *)v78 = xmmword_264BA1EF8;
  *(_OWORD *)&v78[16] = *(_OWORD *)&off_264BA1F08;
  values[0] = @"StartSession";
  values[1] = v69;
  uint64_t v10 = @"0";
  if (v80) {
    uint64_t v10 = @"2";
  }
  values[2] = v65;
  values[3] = v10;
  uint64_t v11 = eUICC::Perso::PersoImplementation::SerializeKeyValuePairsIntoPlistData((const void **)v78, (const void **)values, 4);
  if (v11)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v12, v13, v14, (char)"kBBUReturnSuccess == ret");
    uint64_t v15 = 0;
    goto LABEL_33;
  }
  uint64_t v61 = 0;
  v62 = operator new(0x20uLL);
  long long v63 = xmmword_230B064B0;
  strcpy((char *)v62, "InitPersoServerRequest.plist");
  std::string::size_type v59 = 0;
  uint64_t v60 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v59, v70, (uint64_t)v71, v71 - (unsigned char *)v70);
  eUICC::Perso::PersoImplementation::logTransactionData(a1, (long long *)&v62, (uint64_t)&v59);
  if (v59)
  {
    uint64_t v60 = v59;
    operator delete(v59);
  }
  if (SHIBYTE(v63) < 0) {
    operator delete(v62);
  }
  eUICC::Perso::PersoImplementation::PostDataSync((uint64_t)a1, (uint64_t)&v70, (uint64_t)v78);
  uint64_t v15 = *(std::__shared_weak_count **)&v78[8];
  uint64_t v23 = *(void *)v78;
  if (!*(void *)v78)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v27, v28, v29, (char)"response");
LABEL_66:
    uint64_t v11 = 53;
    goto LABEL_33;
  }
  v57 = operator new(0x20uLL);
  long long v58 = xmmword_230B064C0;
  strcpy((char *)v57, "InitPersoServerResponse.plist");
  (*(void (**)(const void **__return_ptr, uint64_t))(*(void *)v23 + 40))(&v56, v23);
  eUICC::Perso::PersoImplementation::logTransactionCFData(a1, (long long *)&v57, (CFDataRef *)&v56);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v56);
  if (SHIBYTE(v58) < 0) {
    operator delete(v57);
  }
  (*(void (**)(const void **__return_ptr, uint64_t))(*(void *)v23 + 40))(&v55, v23);
  uint64_t v11 = eUICC::Perso::PersoImplementation::CreateDictionaryFromPlistData((uint64_t *)&v55, &theDict);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v55);
  if (v11)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v24, v25, v26, (char)"kBBUReturnSuccess == ret");
    goto LABEL_33;
  }
  if (theDict) {
    uint64_t v30 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    uint64_t v30 = 0;
  }
  if (!v30)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v47, v48, v49, (char)"respDict");
    goto LABEL_32;
  }
  values[0] = (void *)CFDictionaryGetValue(theDict, @"SessionId");
  ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(v78, (CFTypeRef *)values);
  uint64_t v31 = a1[2];
  a1[2] = *(void *)v78;
  *(void *)v78 = v31;
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)v78);
  CFStringRef v32 = (const __CFString *)a1[2];
  if (v32) {
    uint64_t v33 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
  }
  else {
    uint64_t v33 = 0;
  }
  if (!v33 || !CFStringGetLength(v32))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v38, v39, v40, (char)"this->serverSessionID && CFStringGetLength( this->serverSessionID.get()) != 0");
    gBBULogMaskGet();
    CFStringRef v41 = CFCopyDescription(theDict);
    char CStringPtr = CFStringGetCStringPtr(v41, 0x8000100u);
    v46 = "Missing or empty server sssion?! %s\n";
LABEL_65:
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", v46, v43, v44, v45, CStringPtr);
    goto LABEL_66;
  }
  *(void *)v78 = CFDictionaryGetValue(theDict, @"DATA");
  ctu::cf::CFSharedRef<__CFData const>::operator=<void const,void>(&v73, (CFTypeRef *)v78);
  if (v73) {
    long long v34 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  }
  else {
    long long v34 = 0;
  }
  if (!v34)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v50, v51, v52, (char)"respDataPayload");
    gBBULogMaskGet();
    CFStringRef v53 = CFCopyDescription(theDict);
    char CStringPtr = CFStringGetCStringPtr(v53, 0x8000100u);
    v46 = "Couldn't get response payload %s\n";
    goto LABEL_65;
  }
  memset(v78, 0, 24);
  ctu::cf::assign();
  long long v35 = *(_OWORD *)v78;
  uint64_t v36 = *(void *)&v78[16];
  uint64_t v37 = *(void **)a2;
  if (*(void *)a2)
  {
    *(void *)(a2 + 8) = v37;
    long long v54 = v35;
    operator delete(v37);
    long long v35 = v54;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
  }
  uint64_t v11 = 0;
  *(_OWORD *)a2 = v35;
  *(void *)(a2 + 16) = v36;
LABEL_33:
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "InitPersoServer %d\n", v19, v20, v21, v11);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v65);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v69);
  if (v70)
  {
    v71 = v70;
    operator delete(v70);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v73);
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&theDict);
  return v11;
}

void sub_230ADB9AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,const void *a31,void *a32,uint64_t a33,uint64_t a34,const void *a35,void *a36,uint64_t a37,uint64_t a38,const void *a39,const void *a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,void *__p,uint64_t a48)
{
  if (__p)
  {
    a48 = (uint64_t)__p;
    operator delete(__p);
  }
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&a31);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a35);
  if (a36)
  {
    a37 = (uint64_t)a36;
    operator delete(a36);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a39);
  if (v48) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v48);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&a40);
  _Unwind_Resume(a1);
}

uint64_t eUICC::Perso::PersoImplementation::AuthenticatePersoDevice(void *a1, uint64_t a2, void *a3)
{
  uint64_t v26 = (char *)operator new(0x28uLL);
  long long v27 = xmmword_230B064D0;
  strcpy(v26, "AuthenticatePersoDeviceRequest.bin");
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  std::string __p = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, *(const void **)a2, *(void *)(a2 + 8), *(void *)(a2 + 8) - *(void *)a2);
  eUICC::Perso::PersoImplementation::logTransactionData(a1, (long long *)&v26, (uint64_t)&__p);
  if (__p)
  {
    uint64_t v24 = __p;
    operator delete(__p);
  }
  if (SHIBYTE(v27) < 0) {
    operator delete(v26);
  }
  uint64_t v6 = (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)*a3 + 64))(*a3, a2, a2);
  if (v6)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"kBBUReturnSuccess == ret");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Failed to complete AuthPerso command\n", v10, v11, v12, v17);
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v21 = operator new(0x28uLL);
    long long v22 = xmmword_230B064E0;
    strcpy((char *)v21, "AuthenticatePersoDeviceResponse.bin");
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v18, *(const void **)a2, *(void *)(a2 + 8), *(void *)(a2 + 8) - *(void *)a2);
    eUICC::Perso::PersoImplementation::logTransactionData(a1, (long long *)&v21, (uint64_t)&v18);
    if (v18)
    {
      uint64_t v19 = v18;
      operator delete(v18);
    }
    if (SHIBYTE(v22) < 0) {
      operator delete(v21);
    }
  }
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "AuthenticatePersoDevice %d\n", v13, v14, v15, v6);
  return v6;
}

void sub_230ADBD40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23)
{
  if (__p) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::Perso::PersoImplementation::GetWrapKeyServer(uint64_t a1, uint64_t a2)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  uint64_t v52 = 0;
  CFStringRef v53 = 0;
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  v46 = 0;
  uint64_t v47 = 0;
  std::string __p = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, *(const void **)a2, *(void *)(a2 + 8), *(void *)(a2 + 8) - *(void *)a2);
  uint64_t v60 = 0;
  long long keys = 0uLL;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&keys, __p, (uint64_t)v46, v46 - (unsigned char *)__p);
  long long v54 = 0;
  long long v55 = 0uLL;
  uint64_t v56 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v55, (const void *)keys, *((uint64_t *)&keys + 1), *((void *)&keys + 1) - keys);
  CFTypeRef Value = 0;
  if (ctu::cf::convert_copy())
  {
    uint64_t v4 = v54;
    long long v54 = (void *)Value;
    values[0] = v4;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)values);
  }
  if ((void)v55)
  {
    *((void *)&v55 + 1) = v55;
    operator delete((void *)v55);
  }
  uint64_t v48 = v54;
  long long v54 = 0;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v54);
  if ((void)keys)
  {
    *((void *)&keys + 1) = keys;
    operator delete((void *)keys);
  }
  if (__p)
  {
    v46 = __p;
    operator delete(__p);
  }
  long long keys = xmmword_264BA1F28;
  uint64_t v60 = @"SessionId";
  values[0] = @"GetWrapKey";
  values[1] = v48;
  values[2] = *(void **)(a1 + 16);
  uint64_t v5 = eUICC::Perso::PersoImplementation::SerializeKeyValuePairsIntoPlistData((const void **)&keys, (const void **)values, 3);
  if (v5)
  {
    gBBULogMaskGet();
    uint64_t v6 = 0;
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"kBBUReturnSuccess == ret");
    goto LABEL_29;
  }
  uint64_t v42 = 0;
  uint64_t v43 = operator new(0x20uLL);
  long long v44 = xmmword_230B064C0;
  strcpy((char *)v43, "GetWrapKeyServerRequest.plist");
  uint64_t v40 = 0;
  CFStringRef v41 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v40, v49, (uint64_t)v50, v50 - (unsigned char *)v49);
  eUICC::Perso::PersoImplementation::logTransactionData((void *)a1, (long long *)&v43, (uint64_t)&v40);
  if (v40)
  {
    CFStringRef v41 = v40;
    operator delete(v40);
  }
  if (SHIBYTE(v44) < 0) {
    operator delete(v43);
  }
  eUICC::Perso::PersoImplementation::PostDataSync(a1, (uint64_t)&v49, (uint64_t)&v55);
  uint64_t v6 = (std::__shared_weak_count *)*((void *)&v55 + 1);
  uint64_t v10 = v55;
  if (!(void)v55)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v14, v15, v16, (char)"response");
LABEL_21:
    uint64_t v5 = 53;
    goto LABEL_29;
  }
  uint64_t v38 = operator new(0x20uLL);
  long long v39 = xmmword_230B064F0;
  strcpy((char *)v38, "GetWrapKeyServerResponse.plist");
  (*(void (**)(const void **__return_ptr, uint64_t))(*(void *)v10 + 40))(&v37, v10);
  eUICC::Perso::PersoImplementation::logTransactionCFData((void *)a1, (long long *)&v38, (CFDataRef *)&v37);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v37);
  if (SHIBYTE(v39) < 0) {
    operator delete(v38);
  }
  (*(void (**)(const void **__return_ptr, uint64_t))(*(void *)v10 + 40))(&v36, v10);
  uint64_t v5 = eUICC::Perso::PersoImplementation::CreateDictionaryFromPlistData((uint64_t *)&v36, &v53);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v36);
  if (v5)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)"kBBUReturnSuccess == ret");
    goto LABEL_29;
  }
  CFTypeRef Value = CFDictionaryGetValue(v53, @"DATA");
  char v17 = (const void **)ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&v55, &Value);
  uint64_t v18 = v52;
  uint64_t v52 = (const void *)v55;
  *(void *)&long long v55 = v18;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v17);
  if (v52) {
    uint64_t v19 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  }
  else {
    uint64_t v19 = 0;
  }
  if (!v19)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v27, v28, v29, (char)"respDataPayload");
    gBBULogMaskGet();
    CFStringRef v30 = CFCopyDescription(v53);
    char CStringPtr = CFStringGetCStringPtr(v30, 0x8000100u);
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Couldn't get response payload %s\n", v32, v33, v34, CStringPtr);
    goto LABEL_21;
  }
  long long v55 = 0uLL;
  uint64_t v56 = 0;
  ctu::cf::assign();
  long long v20 = v55;
  uint64_t v21 = v56;
  long long v22 = *(void **)a2;
  if (*(void *)a2)
  {
    *(void *)(a2 + 8) = v22;
    long long v35 = v20;
    operator delete(v22);
    long long v20 = v35;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
  }
  uint64_t v5 = 0;
  *(_OWORD *)a2 = v20;
  *(void *)(a2 + 16) = v21;
LABEL_29:
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "GetWrapKeyServer %d\n", v23, v24, v25, v5);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v48);
  if (v49)
  {
    uint64_t v50 = v49;
    operator delete(v49);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v52);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v53);
  return v5;
}

void sub_230ADC2D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,void *a36,uint64_t a37,uint64_t a38,const void *a39,void *__p,uint64_t a41)
{
  long long v44 = *(void **)(v42 - 144);
  if (v44)
  {
    *(void *)(v42 - 136) = v44;
    operator delete(v44);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a39);
  if (__p)
  {
    a41 = (uint64_t)__p;
    operator delete(__p);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v42 - 168));
  if (v41) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v41);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)(v42 - 160));
  _Unwind_Resume(a1);
}

uint64_t eUICC::Perso::PersoImplementation::FinalizePersoDevice(void *a1, uint64_t a2, void *a3)
{
  uint64_t v20 = 0;
  uint64_t v21 = operator new(0x20uLL);
  long long v22 = xmmword_230B064F0;
  strcpy((char *)v21, "FinalizePersoDeviceRequest.bin");
  std::string __p = 0;
  uint64_t v19 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, *(const void **)a2, *(void *)(a2 + 8), *(void *)(a2 + 8) - *(void *)a2);
  eUICC::Perso::PersoImplementation::logTransactionData(a1, (long long *)&v21, (uint64_t)&__p);
  if (__p)
  {
    uint64_t v19 = __p;
    operator delete(__p);
  }
  if (SHIBYTE(v22) < 0) {
    operator delete(v21);
  }
  uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 72))(*a3, a2);
  if (v6)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"kBBUReturnSuccess == ret");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Failed to complete FinalizePerso command\n", v10, v11, v12, v17);
  }
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "FinalizePersoDevice %d\n", v13, v14, v15, v6);
  return v6;
}

void sub_230ADC570(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (__p) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::Perso::PersoImplementation::GetNonceServer(void *a1, uint64_t a2, void (****a3)(void *__return_ptr))
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  std::string::size_type v59 = 0;
  CFDictionaryRef theDict = 0;
  std::string __p = 0;
  v57 = 0;
  uint64_t v58 = 0;
  (***a3)(v62);
  if (LODWORD(v62[0]) != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    gBBULogMaskGet();
    uint64_t v10 = 0;
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)"hwType.Valid()");
    uint64_t v6 = 18;
    goto LABEL_8;
  }
  *(_OWORD *)long long keys = xmmword_264BA1F18;
  if (v63) {
    uint64_t v5 = @"2";
  }
  else {
    uint64_t v5 = @"0";
  }
  values[0] = @"GetNonce";
  values[1] = v5;
  uint64_t v6 = eUICC::Perso::PersoImplementation::SerializeKeyValuePairsIntoPlistData((const void **)keys, (const void **)values, 2);
  if (v6)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"kBBUReturnSuccess == ret");
    uint64_t v10 = 0;
    goto LABEL_8;
  }
  uint64_t v53 = 0;
  long long v54 = operator new(0x20uLL);
  long long v55 = xmmword_230B064A0;
  strcpy((char *)v54, "GetNonceServerRequest.plist");
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v51, __p, (uint64_t)v57, v57 - (unsigned char *)__p);
  eUICC::Perso::PersoImplementation::logTransactionData(a1, (long long *)&v54, (uint64_t)&v51);
  if (v51)
  {
    uint64_t v52 = v51;
    operator delete(v51);
  }
  if (SHIBYTE(v55) < 0) {
    operator delete(v54);
  }
  eUICC::Perso::PersoImplementation::PostDataSync((uint64_t)a1, (uint64_t)&__p, (uint64_t)keys);
  uint64_t v18 = keys[0];
  uint64_t v10 = (std::__shared_weak_count *)keys[1];
  if (!keys[0])
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v22, v23, v24, (char)"response");
LABEL_37:
    uint64_t v6 = 53;
    goto LABEL_8;
  }
  uint64_t v49 = operator new(0x20uLL);
  long long v50 = xmmword_230B064B0;
  strcpy((char *)v49, "GetNonceServerResponse.plist");
  (*(void (**)(const void **__return_ptr, void *))(*(void *)v18 + 40))(&v48, v18);
  eUICC::Perso::PersoImplementation::logTransactionCFData(a1, (long long *)&v49, (CFDataRef *)&v48);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v48);
  if (SHIBYTE(v50) < 0) {
    operator delete(v49);
  }
  (*(void (**)(const void **__return_ptr, void *))(*(void *)v18 + 40))(&v47, v18);
  uint64_t v6 = eUICC::Perso::PersoImplementation::CreateDictionaryFromPlistData((uint64_t *)&v47, &theDict);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v47);
  if (v6)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v19, v20, v21, (char)"kBBUReturnSuccess == ret");
    goto LABEL_8;
  }
  values[0] = (void *)CFDictionaryGetValue(theDict, @"SessionId");
  uint64_t v25 = (const void **)ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(keys, (CFTypeRef *)values);
  uint64_t v26 = (void *)a1[2];
  a1[2] = keys[0];
  keys[0] = v26;
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(v25);
  CFStringRef v27 = (const __CFString *)a1[2];
  if (v27) {
    uint64_t v28 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
  }
  else {
    uint64_t v28 = 0;
  }
  if (!v28 || !CFStringGetLength(v27))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v33, v34, v35, (char)"this->serverSessionID && CFStringGetLength( this->serverSessionID.get()) != 0");
    gBBULogMaskGet();
    CFStringRef v36 = CFCopyDescription(theDict);
    char CStringPtr = CFStringGetCStringPtr(v36, 0x8000100u);
    CFStringRef v41 = "Missing or empty server sssion?! %s\n";
LABEL_36:
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", v41, v38, v39, v40, CStringPtr);
    goto LABEL_37;
  }
  keys[0] = (void *)CFDictionaryGetValue(theDict, @"DATA");
  ctu::cf::CFSharedRef<__CFData const>::operator=<void const,void>(&v59, (CFTypeRef *)keys);
  if (v59) {
    uint64_t v29 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  }
  else {
    uint64_t v29 = 0;
  }
  if (!v29)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v42, v43, v44, (char)"respDataPayload");
    gBBULogMaskGet();
    CFStringRef v45 = CFCopyDescription(theDict);
    char CStringPtr = CFStringGetCStringPtr(v45, 0x8000100u);
    CFStringRef v41 = "Couldn't get response payload %s\n";
    goto LABEL_36;
  }
  keys[0] = 0;
  keys[1] = 0;
  uint64_t v65 = 0;
  ctu::cf::assign();
  long long v30 = *(_OWORD *)keys;
  uint64_t v31 = v65;
  uint64_t v32 = *(void **)a2;
  if (*(void *)a2)
  {
    *(void *)(a2 + 8) = v32;
    long long v46 = v30;
    operator delete(v32);
    long long v30 = v46;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
  }
  uint64_t v6 = 0;
  *(_OWORD *)a2 = v30;
  *(void *)(a2 + 16) = v31;
LABEL_8:
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "GetNonceServer %d\n", v14, v15, v16, v6);
  if (__p)
  {
    v57 = __p;
    operator delete(__p);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v59);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&theDict);
  return v6;
}

void sub_230ADCB64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *__p,uint64_t a36,uint64_t a37,const void *a38,const void *a39)
{
  uint64_t v42 = *(void **)(v40 - 80);
  if (v42)
  {
    *(void *)(v40 - 72) = v42;
    operator delete(v42);
  }
  if (__p) {
    operator delete(__p);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a38);
  if (v39) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v39);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&a39);
  _Unwind_Resume(a1);
}

uint64_t eUICC::Perso::PersoImplementation::CreateValidationBlob(BBUpdaterCommon *a1, unint64_t *a2)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t ECID = BBUpdaterCommon::getECID(a1);
  char v41 = 4;
  int v40 = 17433507;
  v43[0] = 0;
  v43[2] = 512;
  *(_OWORD *)&v44[8] = 0u;
  v43[1] = 12;
  *(_OWORD *)uint64_t v44 = xmmword_230B06500;
  *(_WORD *)&v44[16] = 512;
  v39[0] = v43;
  v39[1] = 2;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  uint64_t v29 = 0;
  long long v30 = 0;
  uint64_t v31 = 0;
  uint64_t v26 = 0;
  CFStringRef v27 = 0;
  uint64_t v28 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  char v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  std::string __p = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  unint64_t v3 = a2[1] - *a2;
  v12[0] = *a2;
  v12[1] = v3;
  int v4 = DERDecodeItem((uint64_t)v12, v13);
  if (v4) {
    goto LABEL_14;
  }
  int v4 = DEREncodeItemIntoVector(0xCuLL, 6uLL, "kNonce", (unint64_t *)&v23);
  if (v4) {
    goto LABEL_14;
  }
  v37[0] = v23;
  v37[1] = v24 - (unsigned char *)v23;
  v37[2] = v13[1];
  v37[3] = v13[2];
  int v4 = DEREncodeSequenceIntoVector(0x2000000000000010, (unint64_t)v37, (uint64_t)v39, (unint64_t *)&v29);
  if (v4) {
    goto LABEL_14;
  }
  int v4 = DEREncodeItemIntoVector(0xCuLL, 0x11uLL, "kDeviceIdentifier", (unint64_t *)&v32);
  if (v4) {
    goto LABEL_14;
  }
  int v4 = DEREncodeItemIntoVector(4uLL, 8uLL, &ECID, (unint64_t *)&v26);
  if (v4) {
    goto LABEL_14;
  }
  v38[0] = v32;
  v38[1] = v33 - (unsigned char *)v32;
  v38[2] = v26;
  v38[3] = v27 - (unsigned char *)v26;
  int v4 = DEREncodeSequenceIntoVector(0x2000000000000010, (unint64_t)v38, (uint64_t)v39, (unint64_t *)&v20);
  if (v4) {
    goto LABEL_14;
  }
  v36[0] = v20;
  v36[1] = v21 - (unsigned char *)v20;
  v36[2] = v29;
  v36[3] = v30 - (unsigned char *)v29;
  int v4 = DEREncodeSequenceIntoVector(0x2000000000000010, (unint64_t)v36, (uint64_t)v39, (unint64_t *)&v17);
  if (v4
    || (int v4 = DEREncodeItemIntoVector(0xA000000000000005, v18 - (unsigned char *)v17, v17, (unint64_t *)&__p)) != 0
    || (v35[0] = &v40,
        v35[1] = 5,
        v35[2] = __p,
        v35[3] = v15 - (unsigned char *)__p,
        (int v4 = DEREncodeSequenceIntoVector(0x2000000000000010, (unint64_t)v35, (uint64_t)v39, a2)) != 0))
  {
LABEL_14:
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v5, v6, v7, (char)"DR_Success == ret");
  }
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "CreateValidationBlob DR %d\n", v8, v9, v10, v4);
  if (__p)
  {
    uint64_t v15 = __p;
    operator delete(__p);
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
  if (v23)
  {
    uint64_t v24 = v23;
    operator delete(v23);
  }
  if (v26)
  {
    CFStringRef v27 = v26;
    operator delete(v26);
  }
  if (v29)
  {
    long long v30 = v29;
    operator delete(v29);
  }
  if (v32)
  {
    uint64_t v33 = v32;
    operator delete(v32);
  }
  if (v4) {
    return 11;
  }
  else {
    return 0;
  }
}

void sub_230ADD178(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37)
{
  if (__p) {
    operator delete(__p);
  }
  if (a21) {
    operator delete(a21);
  }
  if (a24) {
    operator delete(a24);
  }
  if (a27) {
    operator delete(a27);
  }
  if (a30) {
    operator delete(a30);
  }
  if (a33) {
    operator delete(a33);
  }
  if (a36) {
    operator delete(a36);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::Perso::PersoImplementation::ValidatePersoDevice(void *a1, uint64_t a2, void *a3)
{
  uint64_t v20 = 0;
  uint64_t v21 = operator new(0x20uLL);
  long long v22 = xmmword_230B064F0;
  strcpy((char *)v21, "ValidatePersoDeviceRequest.bin");
  std::string __p = 0;
  uint64_t v19 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, *(const void **)a2, *(void *)(a2 + 8), *(void *)(a2 + 8) - *(void *)a2);
  eUICC::Perso::PersoImplementation::logTransactionData(a1, (long long *)&v21, (uint64_t)&__p);
  if (__p)
  {
    uint64_t v19 = __p;
    operator delete(__p);
  }
  if (SHIBYTE(v22) < 0) {
    operator delete(v21);
  }
  uint64_t v6 = (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)*a3 + 80))(*a3, a2, a2);
  if (v6)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"kBBUReturnSuccess == ret");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Failed to complete ValidatePerso command\n", v10, v11, v12, v17);
  }
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "ValidatePersoDevice %d\n", v13, v14, v15, v6);
  return v6;
}

void sub_230ADD370(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (__p) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::Perso::PersoImplementation::SendReceiptServer(void *a1, uint64_t a2)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  std::string __p = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, *(const void **)a2, *(void *)(a2 + 8), *(void *)(a2 + 8) - *(void *)a2);
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  values = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&values, __p, (uint64_t)v29, v29 - (unsigned char *)__p);
  uint64_t v35 = 0;
  keys[0] = 0;
  keys[1] = 0;
  char v41 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(keys, values, (uint64_t)v38, v38 - (unsigned char *)values);
  CFStringRef v36 = 0;
  if (ctu::cf::convert_copy())
  {
    int v4 = v35;
    uint64_t v35 = v36;
    v22[0] = v4;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v22);
  }
  if (keys[0])
  {
    keys[1] = keys[0];
    operator delete(keys[0]);
  }
  uint64_t v31 = v35;
  uint64_t v35 = 0;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v35);
  if (values)
  {
    uint64_t v38 = values;
    operator delete(values);
  }
  if (__p)
  {
    uint64_t v29 = __p;
    operator delete(__p);
  }
  *(_OWORD *)long long keys = xmmword_264BA1F28;
  char v41 = @"SessionId";
  values = @"SendReceipt";
  uint64_t v38 = v31;
  uint64_t v39 = a1[2];
  uint64_t v5 = eUICC::Perso::PersoImplementation::SerializeKeyValuePairsIntoPlistData((const void **)keys, (const void **)&values, 3);
  if (v5)
  {
    gBBULogMaskGet();
    uint64_t v6 = 0;
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"kBBUReturnSuccess == ret");
  }
  else
  {
    uint64_t v10 = operator new(0x20uLL);
    uint64_t v25 = 0;
    uint64_t v26 = v10;
    long long v27 = xmmword_230B064F0;
    strcpy((char *)v10, "SendReceiptServerRequest.plist");
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v23, v32, (uint64_t)v33, v33 - (unsigned char *)v32);
    eUICC::Perso::PersoImplementation::logTransactionData(a1, (long long *)&v26, (uint64_t)&v23);
    if (v23)
    {
      uint64_t v24 = v23;
      operator delete(v23);
    }
    if (SHIBYTE(v27) < 0) {
      operator delete(v26);
    }
    eUICC::Perso::PersoImplementation::PostDataSync((uint64_t)a1, (uint64_t)&v32, (uint64_t)v22);
    uint64_t v11 = v22[0];
    uint64_t v6 = (std::__shared_weak_count *)v22[1];
    if (v22[0])
    {
      uint64_t v20 = operator new(0x20uLL);
      long long v21 = xmmword_230B06510;
      strcpy((char *)v20, "SendReceiptServerResponse.plist");
      (*(void (**)(const void **__return_ptr, const void *))(*(void *)v11 + 40))(&v19, v11);
      eUICC::Perso::PersoImplementation::logTransactionCFData(a1, (long long *)&v20, (CFDataRef *)&v19);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v19);
      if (SHIBYTE(v21) < 0) {
        operator delete(v20);
      }
      uint64_t v5 = 0;
      *(void *)(a2 + 8) = *(void *)a2;
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v12, v13, v14, (char)"response");
      uint64_t v5 = 53;
    }
  }
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "SendReceiptServer %d\n", v15, v16, v17, v5);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v31);
  if (v32)
  {
    uint64_t v33 = v32;
    operator delete(v32);
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  return v5;
}

void sub_230ADD728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, const void *a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,uint64_t a33,const void *a34)
{
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a13);
  if (a19 < 0) {
    operator delete(__p);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a34);
  uint64_t v37 = *(void **)(v35 - 144);
  if (v37)
  {
    *(void *)(v35 - 136) = v37;
    operator delete(v37);
  }
  if (v34) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v34);
  }
  _Unwind_Resume(a1);
}

uint64_t eUICC::Perso::PersoImplementation::logTransactionData(void *a1, long long *a2, uint64_t a3)
{
  unint64_t v4 = a1[5];
  if (v4 >= a1[6])
  {
    uint64_t result = std::vector<std::pair<std::string,std::vector<unsigned char>>>::__emplace_back_slow_path<std::string&,std::vector<unsigned char>&>(a1 + 4, a2, a3);
  }
  else
  {
    std::pair<std::string,std::vector<unsigned char>>::pair[abi:ne180100]<std::string&,std::vector<unsigned char>&,0>((std::string *)a1[5], a2, a3);
    uint64_t result = v4 + 48;
    a1[5] = v4 + 48;
  }
  a1[5] = result;
  return result;
}

void sub_230ADD864(_Unwind_Exception *a1)
{
  *(void *)(v1 + 4pthread_mutex_init(this, 0) = v2;
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t eUICC::Perso::PersoImplementation::SerializeKeyValuePairsIntoPlistData(const void **keys, const void **values, CFIndex numValues)
{
  CFDataRef v38 = 0;
  uint64_t v39 = 0;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef v4 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], keys, values, numValues, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v37 = (uint64_t)v4;
  if (v4) {
    uint64_t v5 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!v5)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"inDict");
    gBBULogMaskGet();
    uint64_t v16 = "Failed to create dictionary\n";
LABEL_19:
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", v16, v13, v14, v15, v32);
LABEL_20:
    uint64_t v9 = 11;
    goto LABEL_21;
  }
  error[0] = 0;
  error[1] = (CFErrorRef)&v39;
  CFDataRef Data = CFPropertyListCreateData(v3, v4, kCFPropertyListXMLFormat_v1_0, 0, error);
  CFDataRef v7 = v38;
  CFDataRef v38 = Data;
  std::string __p = v7;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&__p);
  ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)error);
  if (v38) {
    uint64_t v8 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  }
  else {
    uint64_t v8 = 0;
  }
  if (!v8)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v17, v18, v19, (char)"outData");
    gBBULogMaskGet();
    ctu::cf::show((ctu::cf *)1, v37, v20);
    int v21 = v36;
    char v22 = (char)error[0];
    ctu::cf::show((ctu::cf *)1, v39, v23);
    long long v27 = error;
    if (v21 < 0) {
      LOBYTE(v27) = v22;
    }
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Failed to serialize dictionary %s error %s\n", v24, v25, v26, (char)v27);
    if (v34 < 0) {
      operator delete(__p);
    }
    if (v36 < 0) {
      operator delete(error[0]);
    }
    goto LABEL_20;
  }
  if ((ctu::cf::assign() & 1) == 0)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v28, v29, v30, (char)"success");
    gBBULogMaskGet();
    uint64_t v16 = "Failed to assign output data\n";
    goto LABEL_19;
  }
  uint64_t v9 = 0;
LABEL_21:
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v37);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v38);
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)&v39);
  return v9;
}

void sub_230ADDB0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)(v25 - 56));
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v25 - 48));
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)(v25 - 40));
  _Unwind_Resume(a1);
}

uint64_t *eUICC::Perso::PersoImplementation::PostDataSync@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = (char *)operator new(0xA0uLL);
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 2) = 0;
  *((void *)v6 + 3) = 850045863;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((void *)v6 + 1pthread_mutex_init(this, 0) = 0;
  *((void *)v6 + 11) = 1018212795;
  *((_OWORD *)v6 + 6) = 0u;
  *((_OWORD *)v6 + 7) = 0u;
  *(_OWORD *)(v6 + 124) = 0u;
  *(void *)uint64_t v6 = &unk_26E555FD0;
  uint64_t v24 = (atomic_ullong *)v6;
  uint64_t v25 = v6;
  std::__assoc_sub_state::__attach_future[abi:ne180100]((uint64_t)v6);
  aBlock[1] = 0;
  uint64_t v21 = 0;
  v19[2] = 0;
  aBlock[0] = &aBlock[1];
  v19[1] = 0;
  ctu::Http::HttpRequest::create();
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,ctu::Http::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)aBlock, (void *)aBlock[1]);
  (*(void (**)(uint64_t, void))(*(void *)v22 + 8))(v22, *(void *)a1);
  uint64_t v7 = v22;
  dispatch::future_callback_impl<std::shared_ptr<ctu::Http::HttpResponse>,std::shared_ptr<ctu::Http::HttpResponse>>(&v24, aBlock);
  (*(void (**)(uint64_t, void *))(*(void *)v7 + 16))(v7, aBlock[0]);
  if (aBlock[0]) {
    _Block_release(aBlock[0]);
  }
  (*(void (**)(uint64_t, double))(*(void *)v22 + 96))(v22, 60.0);
  uint64_t v8 = v22;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(v19, (const void **)(a1 + 8));
  (*(void (**)(uint64_t, const void **))(*(void *)v8 + 88))(v8, v19);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(v19);
  (*(void (**)(uint64_t, uint64_t))(*(void *)v22 + 56))(v22, a2);
  __p[1] = 0;
  uint64_t v18 = 0;
  __p[0] = 0;
  (*(void (**)(uint64_t, void **))(*(void *)v22 + 40))(v22, __p);
  if (SHIBYTE(v18) < 0) {
    operator delete(__p[0]);
  }
  std::future<std::shared_ptr<ctu::Http::HttpResponse>>::get(&v24, aBlock);
  if ((*(unsigned int (**)(void *))(*(void *)aBlock[0] + 16))(aBlock[0]) == 1
    && (*(unsigned int (**)(void *))(*(void *)aBlock[0] + 24))(aBlock[0]) == 200)
  {
    *(_OWORD *)a3 = *(_OWORD *)aBlock;
  }
  else
  {
    gBBULogMaskGet();
    char v9 = (*(uint64_t (**)(void *))(*(void *)aBlock[0] + 16))(aBlock[0]);
    (*(void (**)(void *))(*(void *)aBlock[0] + 24))(aBlock[0]);
    (*(void (**)(void *))(*(void *)aBlock[0] + 32))(aBlock[0]);
    (*(void (**)(CFTypeRef *__return_ptr))(*(void *)aBlock[0] + 72))(&cf);
    CFStringRef v10 = CFCopyDescription(cf);
    CFStringGetCStringPtr(v10, 0x8000100u);
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "result %d code %d raw_error %ld error %s\n", v11, v12, v13, v9);
    ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(&cf);
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    if (aBlock[1]) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)aBlock[1]);
    }
  }
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  uint64_t v14 = v24;
  if (v24 && !atomic_fetch_add(v24 + 1, 0xFFFFFFFFFFFFFFFFLL)) {
    (*(void (**)(atomic_ullong *))(*v14 + 16))(v14);
  }
  return std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::~promise((uint64_t *)&v25);
}

void sub_230ADDF88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21,uint64_t a22,uint64_t a23,void *aBlock,std::__shared_weak_count *a25)
{
  if (a25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a25);
  }
  long long v27 = *(std::__shared_weak_count **)(v25 - 56);
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
  uint64_t v28 = *(atomic_ullong **)(v25 - 48);
  if (v28)
  {
    if (!atomic_fetch_add(v28 + 1, 0xFFFFFFFFFFFFFFFFLL)) {
      (*(void (**)(atomic_ullong *))(*v28 + 16))(v28);
    }
  }
  std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::~promise((uint64_t *)(v25 - 40));
  _Unwind_Resume(a1);
}

void eUICC::Perso::PersoImplementation::logTransactionCFData(void *a1, long long *a2, CFDataRef *a3)
{
  if (*a3) {
    CFDictionaryRef v4 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  }
  else {
    CFDictionaryRef v4 = 0;
  }
  if (v4)
  {
    BytePtr = CFDataGetBytePtr(*a3);
    size_t Length = CFDataGetLength(*a3);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    std::string __p = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(&__p, BytePtr, (uint64_t)&BytePtr[Length], Length);
    unint64_t v9 = a1[5];
    if (v9 >= a1[6])
    {
      uint64_t v10 = std::vector<std::pair<std::string,std::vector<unsigned char>>>::__emplace_back_slow_path<std::string&,std::vector<unsigned char>&>(a1 + 4, a2, (uint64_t)&__p);
    }
    else
    {
      std::pair<std::string,std::vector<unsigned char>>::pair[abi:ne180100]<std::string&,std::vector<unsigned char>&,0>((std::string *)a1[5], a2, (uint64_t)&__p);
      uint64_t v10 = v9 + 48;
      a1[5] = v9 + 48;
    }
    a1[5] = v10;
    if (__p)
    {
      uint64_t v12 = __p;
      operator delete(__p);
    }
  }
}

void sub_230ADE14C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::Perso::PersoImplementation::CreateDictionaryFromPlistData(uint64_t *a1, __CFError **a2)
{
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  CFDataRef v3 = (const __CFData *)*a1;
  if (*a1) {
    CFDictionaryRef v4 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  }
  else {
    CFDictionaryRef v4 = 0;
  }
  if (!v4)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"inData");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Failed to create data\n", v16, v17, v18, v39);
LABEL_22:
    uint64_t v12 = 11;
    goto LABEL_23;
  }
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  error[0] = 0;
  error[1] = (CFErrorRef)&v45;
  CFPropertyListRef v7 = CFPropertyListCreateWithData(v6, v3, 0, 0, error);
  uint64_t v8 = v44;
  uint64_t v44 = (void *)v7;
  __p[0] = v8;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
  ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)error);
  if (v44) {
    unint64_t v9 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  }
  else {
    unint64_t v9 = 0;
  }
  if (!v9)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v19, v20, v21, (char)"outPlist");
    gBBULogMaskGet();
    ctu::cf::show((ctu::cf *)1, *a1, v22);
    int v23 = v43;
    char v24 = (char)error[0];
    ctu::cf::show((uint64_t *)__p, v45, v25);
    uint64_t v29 = error;
    if (v23 < 0) {
      LOBYTE(v29) = v24;
    }
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Failed to deserialize dictionary %s error %s\n", v26, v27, v28, (char)v29);
    if (v41 < 0) {
      operator delete(__p[0]);
    }
    goto LABEL_20;
  }
  CFTypeID v10 = CFGetTypeID(v44);
  if (v10 != CFDictionaryGetTypeID())
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v30, v31, v32, (char)"CFGetTypeID(outPlist.get()) == CFDictionaryGetTypeID()");
    gBBULogMaskGet();
    ctu::cf::show((uint64_t *)error, (ctu::cf *)v44, v33);
    if (v43 >= 0) {
      uint64_t v37 = error;
    }
    else {
      LOBYTE(v37) = error[0];
    }
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Deserialized plist data is not a dictionary: %s\n", v34, v35, v36, (char)v37);
LABEL_20:
    if (v43 < 0) {
      operator delete(error[0]);
    }
    goto LABEL_22;
  }
  __p[0] = v44;
  ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(error, (CFTypeRef *)__p);
  uint64_t v11 = *a2;
  *a2 = error[0];
  error[0] = v11;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)error);
  uint64_t v12 = 0;
LABEL_23:
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v44);
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)&v45);
  return v12;
}

void sub_230ADE44C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v24 - 48));
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)(v24 - 40));
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get(uint64_t a1)
{
  return *(void *)a1;
}

const void **ctu::cf::CFSharedRef<__CFData const>::operator=<void const,void>(const void **a1, CFTypeRef *a2)
{
  ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&v5, a2);
  CFDataRef v3 = *a1;
  *a1 = v5;
  uint64_t v5 = v3;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v5);
  return a1;
}

void std::future<std::shared_ptr<ctu::Http::HttpResponse>>::get(atomic_ullong **a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  std::__assoc_state<std::shared_ptr<ctu::Http::HttpResponse>>::move((uint64_t)v2, a2);
  if (v2 && !atomic_fetch_add(v2 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    CFDataRef v3 = *(void (**)(atomic_ullong *))(*v2 + 16);
    v3(v2);
  }
}

void sub_230ADE58C(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::future<std::shared_ptr<ctu::Http::HttpResponse>>::get(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get(uint64_t a1)
{
  return *(void *)a1;
}

void *ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::SharedRef(void *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf) {
    CFRetain(cf);
  }
  return a1;
}

void *ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(void *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf) {
    CFRetain(cf);
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

const void **ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(const void **a1, const void **a2)
{
  CFDataRef v3 = *a2;
  *a1 = *a2;
  if (v3) {
    CFRetain(v3);
  }
  return a1;
}

const void **ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(const void **a1)
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
  CFDataRef v3 = *(std::__shared_weak_count **)(a1 + 72);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return a1;
}

uint64_t ctu::PthreadMutexGuardPolicy<eUICC::Perso::PersoImplementation>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  CFDataRef v3 = *(std::__shared_weak_count **)(a1 + 72);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return a1;
}

void *std::shared_ptr<eUICC::Perso::PersoImplementation>::shared_ptr[abi:ne180100]<eUICC::Perso::PersoImplementation,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  CFDictionaryRef v4 = operator new(0x20uLL);
  void *v4 = &unk_26E555F58;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_230ADE808(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  a10 = 0;
  if (v10) {
    std::default_delete<eUICC::Perso::PersoImplementation>::operator()[abi:ne180100]((uint64_t)&a10, v10);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<eUICC::Perso::PersoImplementation *,std::shared_ptr<eUICC::Perso::PersoImplementation>::__shared_ptr_default_delete<eUICC::Perso::PersoImplementation,eUICC::Perso::PersoImplementation>,std::allocator<eUICC::Perso::PersoImplementation>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<eUICC::Perso::PersoImplementation *,std::shared_ptr<eUICC::Perso::PersoImplementation>::__shared_ptr_default_delete<eUICC::Perso::PersoImplementation,eUICC::Perso::PersoImplementation>,std::allocator<eUICC::Perso::PersoImplementation>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<eUICC::Perso::PersoImplementation *,std::shared_ptr<eUICC::Perso::PersoImplementation>::__shared_ptr_default_delete<eUICC::Perso::PersoImplementation,eUICC::Perso::PersoImplementation>,std::allocator<eUICC::Perso::PersoImplementation>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::default_delete<eUICC::Perso::PersoImplementation>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    CFDataRef v3 = (void **)(a2 + 32);
    std::vector<std::pair<std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&v3);
    ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)(a2 + 16));
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)(a2 + 8));
    if (*(void *)a2) {
      dispatch_release(*(dispatch_object_t *)a2);
    }
    operator delete((void *)a2);
  }
}

void std::vector<std::pair<std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
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
        v4 -= 48;
        std::allocator<std::pair<std::string,std::vector<unsigned char>>>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::allocator<std::pair<std::string,std::vector<unsigned char>>>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  CFDataRef v3 = *(void **)(a2 + 24);
  if (v3)
  {
    *(void *)(a2 + 32) = v3;
    operator delete(v3);
  }
  if (*(char *)(a2 + 23) < 0)
  {
    uint64_t v4 = *(void **)a2;
    operator delete(v4);
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

void sub_230ADEA54(_Unwind_Exception *exception_object)
{
  CFDataRef v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    std::vector<char *>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void *ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(void *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf) {
    CFRetain(cf);
  }
  return a1;
}

void *ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(void *a1, CFTypeRef *a2)
{
  CFTypeRef v3 = *a2;
  if (*a2)
  {
    CFTypeID v4 = CFGetTypeID(*a2);
    if (v4 == CFStringGetTypeID()) {
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

  return ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::SharedRef(a1, v5);
}

void *ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(void *a1, CFTypeRef *a2)
{
  CFTypeRef v3 = *a2;
  if (*a2)
  {
    CFTypeID v4 = CFGetTypeID(*a2);
    if (v4 == CFDataGetTypeID()) {
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

  return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(a1, v5);
}

uint64_t std::vector<std::pair<std::string,std::vector<unsigned char>>>::__emplace_back_slow_path<std::string&,std::vector<unsigned char>&>(uint64_t *a1, long long *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v6 = v5 + 1;
  if (v5 + 1 > 0x555555555555555) {
    std::vector<char *>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v9 = (uint64_t)(a1 + 2);
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v4) >> 4);
  if (2 * v10 > v6) {
    unint64_t v6 = 2 * v10;
  }
  if (v10 >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v11 = 0x555555555555555;
  }
  else {
    unint64_t v11 = v6;
  }
  uint64_t v19 = a1 + 2;
  if (v11) {
    uint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<unsigned char>>>>(v9, v11);
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v15 = v12;
  uint64_t v16 = (std::string *)&v12[48 * v5];
  uint64_t v18 = &v12[48 * v11];
  std::pair<std::string,std::vector<unsigned char>>::pair[abi:ne180100]<std::string&,std::vector<unsigned char>&,0>(v16, a2, a3);
  uint64_t v17 = v16 + 2;
  std::vector<std::pair<std::string,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, &v15);
  uint64_t v13 = a1[1];
  std::__split_buffer<std::pair<std::string,std::vector<unsigned char>>>::~__split_buffer(&v15);
  return v13;
}

void sub_230ADECB0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::pair<std::string,std::vector<unsigned char>>>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string,std::vector<unsigned char>>::pair[abi:ne180100]<std::string&,std::vector<unsigned char>&,0>(std::string *this, long long *a2, uint64_t a3)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v5 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
  this[1].__r_.__value_.__r.__words[0] = 0;
  this[1].__r_.__value_.__l.__size_ = 0;
  this[1].__r_.__value_.__r.__words[2] = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(this[1].__r_.__value_.__r.__words, *(const void **)a3, *(void *)(a3 + 8), *(void *)(a3 + 8) - *(void *)a3);
  return this;
}

void sub_230ADED30(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<std::pair<std::string,std::vector<unsigned char>>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::reverse_iterator<std::pair<std::string,std::vector<unsigned char>>*>,std::reverse_iterator<std::pair<std::string,std::vector<unsigned char>>*>,std::reverse_iterator<std::pair<std::string,std::vector<unsigned char>>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<unsigned char>>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(48 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::reverse_iterator<std::pair<std::string,std::vector<unsigned char>>*>,std::reverse_iterator<std::pair<std::string,std::vector<unsigned char>>*>,std::reverse_iterator<std::pair<std::string,std::vector<unsigned char>>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      long long v8 = *(_OWORD *)(a3 - 48);
      *(void *)(v7 - 32) = *(void *)(a3 - 32);
      *(_OWORD *)(v7 - 48) = v8;
      *(void *)(a3 - 4pthread_mutex_init(this, 0) = 0;
      *(void *)(a3 - 32) = 0;
      *(void *)(a3 - 48) = 0;
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      *(_OWORD *)(v7 - 24) = *(_OWORD *)(a3 - 24);
      *(void *)(v7 - 8) = *(void *)(a3 - 8);
      *(void *)(a3 - 24) = 0;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 48;
      *((void *)&v14 + 1) -= 48;
      a3 -= 48;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::reverse_iterator<std::pair<std::string,std::vector<unsigned char>>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::reverse_iterator<std::pair<std::string,std::vector<unsigned char>>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::reverse_iterator<std::pair<std::string,std::vector<unsigned char>>*>>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::reverse_iterator<std::pair<std::string,std::vector<unsigned char>>*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      std::allocator<std::pair<std::string,std::vector<unsigned char>>>::destroy[abi:ne180100](v3, v1);
      v1 += 48;
    }
    while (v1 != v2);
  }
}

void **std::__split_buffer<std::pair<std::string,std::vector<unsigned char>>>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<std::pair<std::string,std::vector<unsigned char>>>::clear[abi:ne180100](void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 48;
    std::allocator<std::pair<std::string,std::vector<unsigned char>>>::destroy[abi:ne180100](v4, i - 48);
  }
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

void sub_230ADF038(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::__assoc_state<std::shared_ptr<ctu::Http::HttpResponse>>::~__assoc_state(uint64_t a1)
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

uint64_t std::__assoc_state<std::shared_ptr<ctu::Http::HttpResponse>>::__on_zero_shared(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 136))
  {
    uint64_t v2 = *(std::__shared_weak_count **)(a1 + 152);
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
        MEMORY[0x230FC7BD0](v6, 4, v4);
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

void sub_230ADF2E8(void *a1)
{
}

void std::__throw_future_error[abi:ne180100](unsigned int a1)
{
  exception = __cxa_allocate_exception(0x20uLL);
  uint64_t v3 = std::future_category();
  MEMORY[0x230FC7BD0](exception, a1, v3);
  __cxa_throw(exception, MEMORY[0x263F8C1A0], MEMORY[0x263F8C0C0]);
}

void sub_230ADF35C(_Unwind_Exception *a1)
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

void sub_230ADF3D8(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
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
  v8[3] = __Block_byref_object_copy_;
  v8[4] = __Block_byref_object_dispose_;
  uint64_t v4 = (char *)operator new(0xA0uLL);
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *((void *)v4 + 3) = 850045863;
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *((_OWORD *)v4 + 4) = 0u;
  *((void *)v4 + 1pthread_mutex_init(this, 0) = 0;
  *((void *)v4 + 11) = 1018212795;
  *((_OWORD *)v4 + 6) = 0u;
  *((_OWORD *)v4 + 7) = 0u;
  *(_OWORD *)(v4 + 124) = 0u;
  *(void *)uint64_t v4 = &unk_26E555FD0;
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
  aBlock[3] = &unk_264BA1F48;
  aBlock[4] = v8;
  *a2 = _Block_copy(aBlock);
  _Block_object_dispose(v8, 8);
  return std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::~promise((uint64_t *)&v9);
}

void sub_230ADF624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::~promise(v7);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4pthread_mutex_init(this, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4pthread_mutex_init(this, 0) = 0;
  return result;
}

uint64_t *__Block_byref_object_dispose_(uint64_t a1)
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

void sub_230ADF734(_Unwind_Exception *a1)
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

void sub_230ADF7E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, char a12)
{
  if (a12) {
    std::mutex::unlock(a11);
  }
  _Unwind_Resume(a1);
}

const void **ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy(const void **a1)
{
  uint64_t v2 = (const void **)a1[1];
  if (*a1)
  {
    int v3 = *v2;
    void *v2 = *a1;
    std::exception_ptr v6 = v3;
  }
  else
  {
    uint64_t v4 = *v2;
    void *v2 = 0;
    std::exception_ptr v6 = v4;
  }
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(&v6);
  return a1;
}

void *ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(void *a1, CFTypeRef *a2)
{
  CFTypeRef v3 = *a2;
  if (*a2)
  {
    CFTypeID v4 = CFGetTypeID(*a2);
    if (v4 == CFDictionaryGetTypeID()) {
      std::exception_ptr v5 = v3;
    }
    else {
      std::exception_ptr v5 = 0;
    }
  }
  else
  {
    std::exception_ptr v5 = 0;
  }

  return ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(a1, v5);
}

std::string *std::vector<std::pair<std::string,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<std::pair<std::string,std::vector<unsigned char>>*,std::pair<std::string,std::vector<unsigned char>>*>(std::string *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    std::exception_ptr v6 = result;
    std::vector<std::pair<std::string,std::vector<unsigned char>>>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::pair<std::string,std::vector<unsigned char>>*,std::pair<std::string,std::vector<unsigned char>>*,std::pair<std::string,std::vector<unsigned char>>*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_230ADF938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::pair<std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::pair<std::string,std::vector<unsigned char>>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::vector<char *>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<unsigned char>>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[48 * v4];
  return result;
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::pair<std::string,std::vector<unsigned char>>*,std::pair<std::string,std::vector<unsigned char>>*,std::pair<std::string,std::vector<unsigned char>>*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  uint64_t v4 = this;
  uint64_t v10 = this;
  unint64_t v11 = this;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    std::exception_ptr v6 = a2;
    do
    {
      std::pair<std::string,std::vector<unsigned char>>::pair[abi:ne180100](v4, v6);
      v6 += 3;
      uint64_t v4 = v11 + 2;
      v11 += 2;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::pair<std::string,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_230ADFA3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

std::string *std::pair<std::string,std::vector<unsigned char>>::pair[abi:ne180100](std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  this[1].__r_.__value_.__r.__words[0] = 0;
  this[1].__r_.__value_.__l.__size_ = 0;
  this[1].__r_.__value_.__r.__words[2] = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(this[1].__r_.__value_.__r.__words, *((const void **)a2 + 3), *((void *)a2 + 4), *((void *)a2 + 4) - *((void *)a2 + 3));
  return this;
}

void sub_230ADFAB8(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::pair<std::string,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::pair<std::string,std::vector<unsigned char>>*>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::pair<std::string,std::vector<unsigned char>>*>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = (uint64_t *)a1[1];
  uint64_t v1 = (uint64_t *)a1[2];
  uint64_t v3 = *v1;
  uint64_t v4 = *v2;
  if (*v1 != *v2)
  {
    uint64_t v5 = *a1;
    do
    {
      v3 -= 48;
      std::allocator<std::pair<std::string,std::vector<unsigned char>>>::destroy[abi:ne180100](v5, v3);
    }
    while (v3 != v4);
  }
}

uint64_t __cxx_global_var_init()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_230AD4000);
  }
  return result;
}

uint64_t __cxx_global_var_init_94()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<eUICC::Perso::PersoImplementation>::~PthreadMutexGuardPolicy, &ctu::Singleton<eUICC::Perso::PersoImplementation,eUICC::Perso::PersoImplementation,ctu::PthreadMutexGuardPolicy<eUICC::Perso::PersoImplementation>>::sInstance, &dword_230AD4000);
  }
  return result;
}

const __CFString **VinylGoldFirmwareCreate(const __CFData *a1, const __CFData *a2, const __CFData *a3, const __CFData *a4)
{
  ACFULogging::getLogInstance(a1);
  size_t v8 = (ACFULogging *)ACFULogging::handleMessage();
  ACFULogging::getLogInstance(v8);
  std::string::basic_string[abi:ne180100]<0>(&v18, "VinylFirmware");
  char v9 = std::string::append(&v18, "::");
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v19.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  unint64_t v11 = std::string::append(&v19, "VinylGoldFirmwareCreate");
  long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  std::string::size_type v21 = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v21) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v19.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v18.__r_.__value_.__l.__data_);
  }
  long long v13 = (const __CFString **)operator new(0xC0uLL);
  VinylFirmware::VinylFirmware((uint64_t)v13, @"/update/gold/firmware.der", @"/update/gold/info.plist", @"/update/gold/profile.bin", off_264BA1FC8);
  long long v14 = (ACFULogging *)VinylFirmware::setFwInfo(v13, a1, a2, a3);
  if (v14)
  {
    ACFULogging::getLogInstance(v14);
    ACFULogging::handleMessage();
    VinylFirmware::~VinylFirmware((VinylFirmware *)v13);
    operator delete(v15);
    long long v13 = 0;
  }
  uint64_t v16 = VinylFirmware::setRecoveryFwInfo((VinylFirmware *)v13, a1, a2, a3, 0, a4);
  ACFULogging::getLogInstance((ACFULogging *)v16);
  ACFULogging::handleMessage();
  return v13;
}

void sub_230ADFDB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  operator delete(v30);
  _Unwind_Resume(a1);
}

uint64_t VinylFirmware::setFwInfo(const __CFString **this, const __CFData *a2, const __CFData *a3, const __CFData *a4)
{
  uint64_t v27 = 0;
  ACFULogging::getLogInstance((ACFULogging *)this);
  size_t v8 = (ACFULogging *)ACFULogging::handleMessage();
  theCFDataRef Data = 0;
  uint64_t v26 = 0;
  this[15] = 0;
  if (!a2 || !a3 || !a4)
  {
    ACFULogging::getLogInstance(v8);
LABEL_26:
    ACFULogging::handleMessage();
    uint64_t v21 = 99;
    goto LABEL_19;
  }
  FWSrcPath = (__CFString *)VinylFirmware::getFWSrcPath(v8, a3, a4);
  long long v10 = v26;
  uint64_t v26 = FWSrcPath;
  error[0] = (CFErrorRef)v10;
  unint64_t v11 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)error);
  if (v26) {
    long long v12 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
  }
  else {
    long long v12 = 0;
  }
  if (!v12
    || ((CFDataRef FileDataFromZip = (const __CFData *)VinylFirmware::getFileDataFromZip((VinylFirmware *)v11, a2, v26, this[12]),
         long long v14 = theData,
         theCFDataRef Data = FileDataFromZip,
         error[0] = v14,
         unint64_t v11 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)error),
         theData)
      ? (uint64_t v15 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get)
      : (uint64_t v15 = 0),
        !v15 || !theData))
  {
LABEL_25:
    ACFULogging::getLogInstance((ACFULogging *)v11);
    goto LABEL_26;
  }
  uint64_t v16 = (VinylFirmware *)VinylFirmware::getFileDataFromZip((VinylFirmware *)v11, a2, v26, this[13]);
  this[18] = (const __CFString *)v16;
  if (!v16
    || (CFStringRef v17 = (const __CFString *)VinylFirmware::getFileDataFromZip(v16, a2, v26, this[14]), (this[19] = v17) == 0)
    || (CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x263EFFB08],
        CFMutableDataRef MutableCopy = CFDataCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, theData),
        (this[15] = (const __CFString *)MutableCopy) == 0))
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_26;
  }
  Im4p = (ACFULogging *)VinylFirmware::createIm4p((ACFULogging *)this, a2, (uint64_t)(this + 2), (uint64_t)(this + 17));
  uint64_t v21 = (uint64_t)Im4p;
  if (Im4p)
  {
    ACFULogging::getLogInstance(Im4p);
    ACFULogging::handleMessage();
    goto LABEL_19;
  }
  CFDataRef v22 = (const __CFData *)this[18];
  error[0] = 0;
  error[1] = (CFErrorRef)&v27;
  this[21] = (const __CFString *)CFPropertyListCreateWithData(v18, v22, 0, 0, error);
  unint64_t v11 = ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)error);
  if (!this[21]) {
    goto LABEL_25;
  }
  uint64_t v21 = 0;
LABEL_19:
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&theData);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v26);
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(&v27);
  return v21;
}

void sub_230AE0078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va3, a4);
  va_start(va2, a4);
  va_start(va1, a4);
  va_start(va, a4);
  uint64_t v5 = va_arg(va1, const void *);
  uint64_t v7 = va_arg(va1, void);
  va_copy(va2, va1);
  size_t v8 = va_arg(va2, const void *);
  va_copy(va3, va2);
  long long v10 = va_arg(va3, const void *);
  ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)va);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va1);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)va2);
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)va3);
  _Unwind_Resume(a1);
}

const void **VinylFirmware::setRecoveryFwInfo(VinylFirmware *this, const __CFData *a2, const __CFData *a3, const __CFData *a4, unsigned int a5, const __CFData *a6)
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  CFStringRef v91 = 0;
  v92 = 0;
  CFDataRef v89 = 0;
  v90 = 0;
  CFDataRef data = 0;
  *((void *)this + 16) = 0;
  ACFULogging::getLogInstance(this);
  char v9 = (ACFULogging *)ACFULogging::handleMessage();
  if (!a2 || !a3 || !a4 || !a6)
  {
    ACFULogging::getLogInstance(v9);
LABEL_89:
    ACFULogging::handleMessage();
    goto LABEL_83;
  }
  FwMac = (ACFULogging *)VinylFirmware::getFwMac(v9, *((CFDictionaryRef *)this + 21));
  CFDataRef v11 = FwMac;
  if (!FwMac)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_89;
  }
  ACFULogging::getLogInstance(FwMac);
  std::string::basic_string[abi:ne180100]<0>(&v84, "VinylFirmware");
  long long v12 = std::string::append(&v84, "::");
  long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v85.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v85.__r_.__value_.__l.__data_ = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  long long v14 = std::string::append(&v85, "setRecoveryFwInfo");
  long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  std::string::size_type v87 = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  uint64_t v16 = (ACFULogging *)ACFULogging::handleMessageCFType();
  if (SHIBYTE(v87) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v85.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v85.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v84.__r_.__value_.__l.__data_);
  }
  ACFULogging::getLogInstance(v16);
  std::string::basic_string[abi:ne180100]<0>(&v84, "VinylFirmware");
  CFStringRef v17 = std::string::append(&v84, "::");
  long long v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
  v85.__r_.__value_.__r.__words[2] = v17->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v85.__r_.__value_.__l.__data_ = v18;
  v17->__r_.__value_.__l.__size_ = 0;
  v17->__r_.__value_.__r.__words[2] = 0;
  v17->__r_.__value_.__r.__words[0] = 0;
  std::string v19 = "setRecoveryFwInfo";
  uint64_t v20 = std::string::append(&v85, "setRecoveryFwInfo");
  long long v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
  std::string::size_type v87 = v20->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v21;
  v20->__r_.__value_.__l.__size_ = 0;
  v20->__r_.__value_.__r.__words[2] = 0;
  v20->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v87) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v85.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v85.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v84.__r_.__value_.__l.__data_);
  }
  BytePtr = CFDataGetBytePtr(v11);
  int v23 = CFDataGetBytePtr(a6);
  CFIndex Length = CFDataGetLength(v11);
  if (Length >= CFDataGetLength(a6)) {
    CFDataRef v25 = a6;
  }
  else {
    CFDataRef v25 = v11;
  }
  size_t v26 = CFDataGetLength(v25);
  uint64_t v27 = (ACFULogging *)memcmp(BytePtr, v23, v26);
  int v28 = (int)v27;
  ACFULogging::getLogInstance(v27);
  uint64_t v78 = a5;
  uint64_t v29 = (VinylFirmware *)ACFULogging::handleMessage();
  if (v28)
  {
    if ((a5 & 1) == 0)
    {
      strcpy(v95, "/recovery/gold-");
      strcpy(v94, "/firmware.der");
      strcpy(v93, "/info.plist");
      FWSrcPath = (__CFString *)VinylFirmware::getFWSrcPath(v29, a3, a4);
      v83 = FWSrcPath;
      if (FWSrcPath) {
        uint64_t v31 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
      }
      else {
        uint64_t v31 = 0;
      }
      if (v31)
      {
        uint64_t v32 = (char *)malloc(0x22uLL);
        uint64_t v33 = (ACFULogging *)malloc(0x20uLL);
        uint64_t v34 = (char *)v33;
        if (v32 && v33)
        {
          uint64_t v35 = 0;
          CFAllocatorRef v36 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          uint64_t v37 = "%s%03d%s";
          v79 = v32;
          while (1)
          {
            CFDataRef v38 = (ACFULogging *)snprintf(v32, 0x22uLL, v37, v95, v35, v94, v78);
            v32[33] = 0;
            ACFULogging::getLogInstance(v38);
            ACFULogging::handleMessage();
            CFStringRef v39 = CFStringCreateWithCString(v36, v32, 0x8000100u);
            CFStringRef v40 = v91;
            CFStringRef v91 = v39;
            __p[0] = (void *)v40;
            uint64_t v33 = (ACFULogging *)ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)__p);
            if (!(v91
                 ? ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get
                 : 0))
              break;
            ACFULogging::getLogInstance(v33);
            std::string::basic_string[abi:ne180100]<0>(&v84, "VinylFirmware");
            uint64_t v42 = std::string::append(&v84, "::");
            long long v43 = *(_OWORD *)&v42->__r_.__value_.__l.__data_;
            v85.__r_.__value_.__r.__words[2] = v42->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v85.__r_.__value_.__l.__data_ = v43;
            v42->__r_.__value_.__l.__size_ = 0;
            v42->__r_.__value_.__r.__words[2] = 0;
            v42->__r_.__value_.__r.__words[0] = 0;
            uint64_t v44 = std::string::append(&v85, v19);
            long long v45 = *(_OWORD *)&v44->__r_.__value_.__l.__data_;
            std::string::size_type v87 = v44->__r_.__value_.__r.__words[2];
            *(_OWORD *)std::string __p = v45;
            v44->__r_.__value_.__l.__size_ = 0;
            v44->__r_.__value_.__r.__words[2] = 0;
            v44->__r_.__value_.__r.__words[0] = 0;
            ACFULogging::handleMessageCFType();
            if (SHIBYTE(v87) < 0) {
              operator delete(__p[0]);
            }
            if (SHIBYTE(v85.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v85.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v84.__r_.__value_.__l.__data_);
            }
            long long v46 = (ACFULogging *)snprintf(v34, 0x20uLL, v37, v95, v35, v93);
            v34[31] = 0;
            ACFULogging::getLogInstance(v46);
            ACFULogging::handleMessage();
            uint64_t v47 = (__CFString *)CFStringCreateWithCString(v36, v34, 0x8000100u);
            uint64_t v48 = v90;
            v90 = v47;
            __p[0] = v48;
            uint64_t v33 = (ACFULogging *)ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)__p);
            if (!(v90
                 ? ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get
                 : 0))
              break;
            ACFULogging::getLogInstance(v33);
            std::string::basic_string[abi:ne180100]<0>(&v84, "VinylFirmware");
            long long v50 = std::string::append(&v84, "::");
            long long v51 = *(_OWORD *)&v50->__r_.__value_.__l.__data_;
            v85.__r_.__value_.__r.__words[2] = v50->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v85.__r_.__value_.__l.__data_ = v51;
            v50->__r_.__value_.__l.__size_ = 0;
            v50->__r_.__value_.__r.__words[2] = 0;
            v50->__r_.__value_.__r.__words[0] = 0;
            uint64_t v52 = std::string::append(&v85, v19);
            long long v53 = *(_OWORD *)&v52->__r_.__value_.__l.__data_;
            std::string::size_type v87 = v52->__r_.__value_.__r.__words[2];
            *(_OWORD *)std::string __p = v53;
            v52->__r_.__value_.__l.__size_ = 0;
            v52->__r_.__value_.__r.__words[2] = 0;
            v52->__r_.__value_.__r.__words[0] = 0;
            long long v54 = (VinylFirmware *)ACFULogging::handleMessageCFType();
            if (SHIBYTE(v87) < 0) {
              operator delete(__p[0]);
            }
            if (SHIBYTE(v85.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v85.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v84.__r_.__value_.__l.__data_);
            }
            CFDataRef FileDataFromZip = (const __CFData *)VinylFirmware::getFileDataFromZip(v54, a2, v83, v91);
            CFDataRef v56 = v89;
            CFDataRef v89 = FileDataFromZip;
            __p[0] = v56;
            v57 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
            CFDataRef v58 = (const __CFData *)VinylFirmware::getFileDataFromZip((VinylFirmware *)v57, a2, v83, v90);
            CFDataRef v59 = data;
            CFDataRef data = v58;
            __p[0] = v59;
            ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
            if (v89) {
              uint64_t v60 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
            }
            else {
              uint64_t v60 = 0;
            }
            if (!v60) {
              goto LABEL_69;
            }
            uint64_t v61 = data
                ? ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get
                : 0;
            if (!v61 || !v89 || !data) {
              goto LABEL_69;
            }
            v62 = v34;
            char v63 = v19;
            std::string v64 = v37;
            __p[0] = 0;
            __p[1] = &v92;
            CFAllocatorRef v65 = v36;
            v85.__r_.__value_.__r.__words[0] = (std::string::size_type)CFPropertyListCreateWithData(v36, data, 0, 0, (CFErrorRef *)__p);
            uint64_t v66 = ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)__p);
            CFDataRef v67 = (const __CFData *)VinylFirmware::getFwMac((VinylFirmware *)v66, (CFDictionaryRef)v85.__r_.__value_.__l.__data_);
            uint64_t v68 = CFDataGetBytePtr(v67);
            v69 = CFDataGetBytePtr(a6);
            CFIndex v70 = CFDataGetLength(v67);
            if (v70 >= CFDataGetLength(a6)) {
              size_t v71 = CFDataGetLength(a6);
            }
            else {
              size_t v71 = CFDataGetLength(v67);
            }
            CFAllocatorRef v36 = v65;
            if (!memcmp(v68, v69, v71))
            {
              CFMutableDataRef MutableCopy = CFDataCreateMutableCopy(v65, 0, v89);
              uint64_t v34 = v62;
              *((void *)this + 16) = MutableCopy;
              ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v85.__r_.__value_.__l.__data_);
              uint64_t v32 = v79;
LABEL_69:
              uint64_t v29 = (VinylFirmware *)ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v83);
              goto LABEL_70;
            }
            uint64_t v37 = v64;
            ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v85.__r_.__value_.__l.__data_);
            uint64_t v35 = (v35 + 1);
            std::string v19 = v63;
            uint64_t v34 = v62;
            uint64_t v32 = v79;
            if (v35 == 1000) {
              goto LABEL_69;
            }
          }
        }
        ACFULogging::getLogInstance(v33);
        ACFULogging::handleMessage();
      }
      else
      {
        ACFULogging::getLogInstance((ACFULogging *)FWSrcPath);
        ACFULogging::handleMessage();
        uint64_t v34 = 0;
        uint64_t v32 = 0;
      }
      ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v83);
      if (!v32) {
        goto LABEL_81;
      }
      goto LABEL_80;
    }
  }
  else
  {
    *((void *)this + 16) = *((void *)this + 15);
    uint64_t v29 = (VinylFirmware *)AMSupportSafeRetain();
  }
  uint64_t v34 = 0;
  uint64_t v32 = 0;
LABEL_70:
  if (!*((void *)this + 16))
  {
    ACFULogging::getLogInstance(v29);
    ACFULogging::handleMessage();
    goto LABEL_79;
  }
  ACFULogging::getLogInstance(v29);
  std::string::basic_string[abi:ne180100]<0>(&v84, "VinylFirmware");
  v73 = std::string::append(&v84, "::");
  long long v74 = *(_OWORD *)&v73->__r_.__value_.__l.__data_;
  v85.__r_.__value_.__r.__words[2] = v73->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v85.__r_.__value_.__l.__data_ = v74;
  v73->__r_.__value_.__l.__size_ = 0;
  v73->__r_.__value_.__r.__words[2] = 0;
  v73->__r_.__value_.__r.__words[0] = 0;
  v75 = std::string::append(&v85, "setRecoveryFwInfo");
  long long v76 = *(_OWORD *)&v75->__r_.__value_.__l.__data_;
  std::string::size_type v87 = v75->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v76;
  v75->__r_.__value_.__l.__size_ = 0;
  v75->__r_.__value_.__r.__words[2] = 0;
  v75->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v87) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v85.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v85.__r_.__value_.__l.__data_);
  }
  if ((SHIBYTE(v84.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_79:
    if (!v32) {
      goto LABEL_81;
    }
    goto LABEL_80;
  }
  operator delete(v84.__r_.__value_.__l.__data_);
  if (v32) {
LABEL_80:
  }
    free(v32);
LABEL_81:
  if (v34) {
    free(v34);
  }
LABEL_83:
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&data);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v89);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v90);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v91);
  return ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(&v92);
}

void sub_230AE0A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, const void *a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36,const void *a37,const void *a38,const void *a39)
{
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&a17);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a37);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a38);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&a39);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)(v39 - 160));
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)(v39 - 152));
  _Unwind_Resume(a1);
}

const __CFString **VinylMainFirmwareCreate(const __CFData *a1, const __CFData *a2, const __CFData *a3, const __CFData *a4)
{
  ACFULogging::getLogInstance(a1);
  size_t v8 = (ACFULogging *)ACFULogging::handleMessage();
  ACFULogging::getLogInstance(v8);
  std::string::basic_string[abi:ne180100]<0>(&v18, "VinylFirmware");
  char v9 = std::string::append(&v18, "::");
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v19.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  CFDataRef v11 = std::string::append(&v19, "VinylMainFirmwareCreate");
  long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  std::string::size_type v21 = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v21) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v19.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v18.__r_.__value_.__l.__data_);
  }
  long long v13 = (const __CFString **)operator new(0xC0uLL);
  VinylFirmware::VinylFirmware((uint64_t)v13, @"/update/main/firmware.der", @"/update/main/info.plist", @"/update/main/profile.bin", off_264BA1F68);
  long long v14 = (ACFULogging *)VinylFirmware::setFwInfo(v13, a1, a2, a3);
  if (v14)
  {
    ACFULogging::getLogInstance(v14);
    ACFULogging::handleMessage();
    VinylFirmware::~VinylFirmware((VinylFirmware *)v13);
    operator delete(v15);
    long long v13 = 0;
  }
  uint64_t v16 = VinylFirmware::setRecoveryFwInfo((VinylFirmware *)v13, a1, a2, a3, 1u, a4);
  ACFULogging::getLogInstance((ACFULogging *)v16);
  ACFULogging::handleMessage();
  return v13;
}

void sub_230AE0D88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  operator delete(v30);
  _Unwind_Resume(a1);
}

VinylFirmware *VinylFirmwareCreate(__CFData *a1, __CFData *a2, const __CFData *a3, const __CFData *a4, const __CFData *a5, const __CFData *a6)
{
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();
  long long v12 = (VinylFirmware *)operator new(0xC0uLL);
  long long v13 = (ACFULogging *)VinylFirmware::VinylFirmware((uint64_t)v12, (uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, off_264BA1FC8);
  if (a6)
  {
    long long v13 = (ACFULogging *)VinylFirmware::setAuthPayload(v12, a6);
    if (v13)
    {
      ACFULogging::getLogInstance(v13);
      ACFULogging::handleMessage();
      VinylFirmware::~VinylFirmware(v12);
      operator delete(v14);
      long long v12 = 0;
    }
  }
  ACFULogging::getLogInstance(v13);
  ACFULogging::handleMessage();
  return v12;
}

void sub_230AE0EF0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t VinylFirmware::setAuthPayload(VinylFirmware *this, const __CFData *a2)
{
  uint64_t v3 = (char *)*((void *)this + 23);
  if (!v3)
  {
    uint64_t v6 = 99;
LABEL_11:
    ACFULogging::getLogInstance((ACFULogging *)v3);
    ACFULogging::handleMessage();
    return v6;
  }
  uint64_t v5 = dlsym(v3, "AMAuthInstallApImg4CreateStitchTicket");
  uint64_t v3 = dlerror();
  uint64_t v6 = 99;
  if (v3 || !v5) {
    goto LABEL_11;
  }
  uint64_t v7 = (VinylFirmware *)((uint64_t (*)(void, void, const __CFData *))v5)(0, *((void *)this + 17), a2);
  if (!v7) {
    return 3;
  }
  uint64_t v3 = (char *)VinylFirmware::stitchImg4Vad(v7, v7, *((const __CFData **)this + 19), (const __CFData **)this + 20);
  uint64_t v6 = (uint64_t)v3;
  if (v3 || !*((void *)this + 20)) {
    goto LABEL_11;
  }
  return 0;
}

uint64_t VinylFirmware::VinylFirmware(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  long long v6 = a5[1];
  *(_OWORD *)a1 = *a5;
  *(_OWORD *)(a1 + 16) = v6;
  long long v7 = a5[2];
  long long v8 = a5[3];
  long long v9 = a5[5];
  *(_OWORD *)(a1 + 64) = a5[4];
  *(_OWORD *)(a1 + 8pthread_mutex_init(this, 0) = v9;
  *(_OWORD *)(a1 + 32) = v7;
  *(_OWORD *)(a1 + 48) = v8;
  *(void *)(a1 + 96) = a2;
  *(void *)(a1 + 104) = a3;
  *(void *)(a1 + 112) = a4;
  *(void *)(a1 + 12pthread_mutex_init(this, 0) = 0;
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = 0;
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = "/usr/lib/libauthinstall.dylib";
  *(void *)(a1 + 184) = 0;
  AMSupportSafeRetain();
  AMSupportSafeRetain();
  AMSupportSafeRetain();
  *(void *)(a1 + 184) = dlopen(*(const char **)(a1 + 176), 1);
  return a1;
}

uint64_t VinylFirmware::VinylFirmware(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFData *a5, uint64_t a6, _OWORD *a7)
{
  long long v9 = a7[1];
  *(_OWORD *)a1 = *a7;
  *(_OWORD *)(a1 + 16) = v9;
  long long v10 = a7[2];
  long long v11 = a7[3];
  long long v12 = a7[5];
  *(_OWORD *)(a1 + 64) = a7[4];
  *(_OWORD *)(a1 + 8pthread_mutex_init(this, 0) = v12;
  *(_OWORD *)(a1 + 32) = v10;
  *(_OWORD *)(a1 + 48) = v11;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 12pthread_mutex_init(this, 0) = a2;
  *(void *)(a1 + 128) = a3;
  *(void *)(a1 + 136) = a4;
  *(void *)(a1 + 144) = a5;
  *(void *)(a1 + 152) = a6;
  *(void *)(a1 + 176) = "/usr/lib/libauthinstall.dylib";
  *(void *)(a1 + 184) = 0;
  uint64_t v16 = 0;
  AMSupportSafeRetain();
  AMSupportSafeRetain();
  AMSupportSafeRetain();
  AMSupportSafeRetain();
  AMSupportSafeRetain();
  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  error[0] = 0;
  error[1] = (CFErrorRef)&v16;
  *(void *)(a1 + 168) = CFPropertyListCreateWithData(v13, a5, 0, 0, error);
  ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)error);
  *(void *)(a1 + 184) = dlopen(*(const char **)(a1 + 176), 1);
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(&v16);
  return a1;
}

void sub_230AE115C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, const void *);
  uint64_t v5 = va_arg(va1, void);
  ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)va);
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)va1);
  _Unwind_Resume(a1);
}

void VinylFirmware::~VinylFirmware(VinylFirmware *this)
{
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  uint64_t v2 = (const void *)*((void *)this + 12);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 12) = 0;
  }
  uint64_t v3 = (const void *)*((void *)this + 13);
  if (v3)
  {
    CFRelease(v3);
    *((void *)this + 13) = 0;
  }
  uint64_t v4 = (const void *)*((void *)this + 14);
  if (v4)
  {
    CFRelease(v4);
    *((void *)this + 14) = 0;
  }
  uint64_t v5 = (const void *)*((void *)this + 15);
  if (v5)
  {
    CFRelease(v5);
    *((void *)this + 15) = 0;
  }
  long long v6 = (const void *)*((void *)this + 16);
  if (v6)
  {
    CFRelease(v6);
    *((void *)this + 16) = 0;
  }
  long long v7 = (const void *)*((void *)this + 17);
  if (v7)
  {
    CFRelease(v7);
    *((void *)this + 17) = 0;
  }
  long long v8 = (const void *)*((void *)this + 18);
  if (v8)
  {
    CFRelease(v8);
    *((void *)this + 18) = 0;
  }
  long long v9 = (const void *)*((void *)this + 19);
  if (v9)
  {
    CFRelease(v9);
    *((void *)this + 19) = 0;
  }
  long long v10 = (const void *)*((void *)this + 21);
  if (v10)
  {
    CFRelease(v10);
    *((void *)this + 21) = 0;
  }
  long long v11 = (void *)*((void *)this + 23);
  if (v11)
  {
    dlclose(v11);
    *((void *)this + 23) = 0;
  }
}

ACFULogging *VinylFirmware::getFWSrcPath(VinylFirmware *this, const __CFData *a2, const __CFData *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v5 = (ACFULogging *)malloc(0x41uLL);
  if (!v5)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    return 0;
  }
  long long v6 = (char *)v5;
  if (!a2 || !a3)
  {
    ACFULogging::getLogInstance(v5);
    goto LABEL_40;
  }
  CFMutableDataRef MutableCopy = CFDataCreateMutableCopy(0, 0, a2);
  ACFULogging::getLogInstance(MutableCopy);
  if (!MutableCopy)
  {
LABEL_40:
    ACFULogging::handleMessage();
    uint64_t v30 = 0;
    goto LABEL_36;
  }
  std::string::basic_string[abi:ne180100]<0>(&v36, "VinylFirmware");
  long long v8 = std::string::append(&v36, "::");
  long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v37.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  long long v10 = std::string::append(&v37, "getFWSrcPath");
  long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  std::string::size_type v39 = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v39) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v36.__r_.__value_.__l.__data_);
  }
  BytePtr = CFDataGetBytePtr(a3);
  CFIndex Length = CFDataGetLength(a3);
  CFDataAppendBytes(MutableCopy, BytePtr, Length - 1);
  ACFULogging::getLogInstance(v14);
  std::string::basic_string[abi:ne180100]<0>(&v36, "VinylFirmware");
  long long v15 = std::string::append(&v36, "::");
  long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  v37.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v16;
  v15->__r_.__value_.__l.__size_ = 0;
  v15->__r_.__value_.__r.__words[2] = 0;
  v15->__r_.__value_.__r.__words[0] = 0;
  CFStringRef v17 = std::string::append(&v37, "getFWSrcPath");
  long long v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
  std::string::size_type v39 = v17->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v18;
  v17->__r_.__value_.__l.__size_ = 0;
  v17->__r_.__value_.__r.__words[2] = 0;
  v17->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v39) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v36.__r_.__value_.__l.__data_);
  }
  CFDataGetBytePtr(MutableCopy);
  CFDataGetLength(MutableCopy);
  std::string v19 = (ACFULogging *)AMSupportDigestSha256();
  if (v19)
  {
    ACFULogging::getLogInstance(v19);
    ACFULogging::handleMessage();
  }
  else
  {
    uint64_t v20 = CFDataCreate(0, bytes, 32);
    ACFULogging::getLogInstance(v20);
    if (v20)
    {
      std::string::basic_string[abi:ne180100]<0>(&v36, "VinylFirmware");
      std::string::size_type v21 = std::string::append(&v36, "::");
      long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
      v37.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v22;
      v21->__r_.__value_.__l.__size_ = 0;
      v21->__r_.__value_.__r.__words[2] = 0;
      v21->__r_.__value_.__r.__words[0] = 0;
      int v23 = std::string::append(&v37, "getFWSrcPath");
      long long v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
      std::string::size_type v39 = v23->__r_.__value_.__r.__words[2];
      *(_OWORD *)std::string __p = v24;
      v23->__r_.__value_.__l.__size_ = 0;
      v23->__r_.__value_.__r.__words[2] = 0;
      v23->__r_.__value_.__r.__words[0] = 0;
      ACFULogging::handleMessageCFType();
      if (SHIBYTE(v39) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v37.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v36.__r_.__value_.__l.__data_);
      }
      CFDataRef v25 = bytes;
      size_t v26 = 65;
      uint64_t v27 = v6;
      do
      {
        int v28 = *v25++;
        uint64_t v29 = (ACFULogging *)snprintf(v27, v26, "%02x", v28);
        v27 += 2;
        v26 -= 2;
      }
      while (v26 != 1);
      v6[64] = 0;
      ACFULogging::getLogInstance(v29);
      ACFULogging::handleMessage();
      uint64_t v30 = (ACFULogging *)CFStringCreateWithCString(0, v6, 0x8000100u);
      ACFULogging::getLogInstance(v30);
      if (v30)
      {
        std::string::basic_string[abi:ne180100]<0>(&v36, "VinylFirmware");
        uint64_t v31 = std::string::append(&v36, "::");
        long long v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
        v37.__r_.__value_.__r.__words[2] = v31->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v32;
        v31->__r_.__value_.__l.__size_ = 0;
        v31->__r_.__value_.__r.__words[2] = 0;
        v31->__r_.__value_.__r.__words[0] = 0;
        uint64_t v33 = std::string::append(&v37, "getFWSrcPath");
        long long v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
        std::string::size_type v39 = v33->__r_.__value_.__r.__words[2];
        *(_OWORD *)std::string __p = v34;
        v33->__r_.__value_.__l.__size_ = 0;
        v33->__r_.__value_.__r.__words[2] = 0;
        v33->__r_.__value_.__r.__words[0] = 0;
        ACFULogging::handleMessageCFType();
        if (SHIBYTE(v39) < 0) {
          operator delete(__p[0]);
        }
        if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v37.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v36.__r_.__value_.__l.__data_);
        }
      }
      else
      {
        ACFULogging::handleMessage();
      }
      CFRelease(v20);
      goto LABEL_35;
    }
    ACFULogging::handleMessage();
  }
  uint64_t v30 = 0;
LABEL_35:
  CFRelease(MutableCopy);
LABEL_36:
  free(v6);
  return v30;
}

void sub_230AE17DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

CFTypeRef VinylFirmware::getFileDataFromZip(VinylFirmware *this, const __CFData *a2, const __CFString *a3, const __CFString *a4)
{
  CFTypeRef v30 = 0;
  ACFULogging::getLogInstance(this);
  std::string::basic_string[abi:ne180100]<0>(&v26, "VinylFirmware");
  long long v7 = std::string::append(&v26, "::");
  long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
  v27.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v8;
  v7->__r_.__value_.__l.__size_ = 0;
  v7->__r_.__value_.__r.__words[2] = 0;
  v7->__r_.__value_.__r.__words[0] = 0;
  long long v9 = std::string::append(&v27, "getFileDataFromZip");
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  std::string::size_type v29 = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  long long v11 = (ACFULogging *)ACFULogging::handleMessageCFType();
  if (SHIBYTE(v29) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
  ACFULogging::getLogInstance(v11);
  std::string::basic_string[abi:ne180100]<0>(&v26, "VinylFirmware");
  long long v12 = std::string::append(&v26, "::");
  long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v27.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  long long v14 = std::string::append(&v27, "getFileDataFromZip");
  long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  std::string::size_type v29 = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  CFDictionaryRef Mutable = (__CFString *)ACFULogging::handleMessageCFType();
  if (SHIBYTE(v29) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
  if (a2 && a3 && a4 && (CFDictionaryRef Mutable = CFStringCreateMutable(0, 0)) != 0)
  {
    CFStringRef v17 = Mutable;
    CFStringAppend(Mutable, a3);
    CFStringAppend(v17, a4);
    ACFULogging::getLogInstance(v18);
    std::string::basic_string[abi:ne180100]<0>(&v26, "VinylFirmware");
    std::string v19 = std::string::append(&v26, "::");
    long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
    v27.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v20;
    v19->__r_.__value_.__l.__size_ = 0;
    v19->__r_.__value_.__r.__words[2] = 0;
    v19->__r_.__value_.__r.__words[0] = 0;
    std::string::size_type v21 = std::string::append(&v27, "getFileDataFromZip");
    long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
    std::string::size_type v29 = v21->__r_.__value_.__r.__words[2];
    *(_OWORD *)std::string __p = v22;
    v21->__r_.__value_.__l.__size_ = 0;
    v21->__r_.__value_.__r.__words[2] = 0;
    v21->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType();
    if (SHIBYTE(v29) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v27.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v26.__r_.__value_.__l.__data_);
    }
    int v23 = (ACFULogging *)eUICCFwReaderOpen(a2);
    long long v24 = v23;
    if (!v23 || (int v23 = eUICCFwReaderFindAndCopyFileData(v23, v17, &v30), v23))
    {
      ACFULogging::getLogInstance(v23);
      ACFULogging::handleMessage();
    }
    eUICCFwReaderClose(v24);
    CFRelease(v17);
    return v30;
  }
  else
  {
    ACFULogging::getLogInstance((ACFULogging *)Mutable);
    ACFULogging::handleMessage();
    eUICCFwReaderClose(0);
    return 0;
  }
}

void sub_230AE1B90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t VinylFirmware::createIm4p(ACFULogging *a1, ACFULogging *a2, uint64_t a3, uint64_t a4)
{
  values[2] = *(void **)MEMORY[0x263EF8340];
  v83 = 0;
  unsigned int v82 = 0;
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();
  long long v6 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
  CFArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  CFMutableArrayRef v7 = CFArrayCreateMutable(0, 0, v6);
  CFMutableArrayRef v8 = v7;
  long long v9 = 0;
  values[0] = Mutable;
  values[1] = v7;
  uint64_t v10 = 1;
  if (!a2 || !a3) {
    goto LABEL_104;
  }
  long long v11 = 0;
  if (!a4) {
    goto LABEL_87;
  }
  long long v9 = 0;
  uint64_t v10 = 2;
  if (!Mutable)
  {
LABEL_104:
    long long v11 = 0;
    goto LABEL_87;
  }
  long long v11 = 0;
  if (!v7) {
    goto LABEL_87;
  }
  CFArrayRef theArray = v7;
  CFArrayRef v12 = CFArrayCreate(0, (const void **)values, 2, MEMORY[0x263EFFF70]);
  *(void *)(a3 + 48) = v12;
  if (!v12) {
    goto LABEL_110;
  }
  v79[0] = a1;
  v79[1] = a3;
  long long v13 = (ACFULogging *)eUICCFwReaderStart(a2, (uint64_t (*)(uint64_t, CFStringRef, ACFULogging *))VinylFirmwareReaderInfoPlistCallback, (uint64_t)v79);
  uint64_t v10 = (uint64_t)v13;
  if (v13)
  {
    ACFULogging::getLogInstance(v13);
    ACFULogging::handleMessage();
LABEL_110:
    long long v11 = 0;
    long long v9 = 0;
LABEL_111:
    CFMutableArrayRef v8 = theArray;
    CFArrayRef v67 = Mutable;
    goto LABEL_88;
  }
  if (!*(void *)(a3 + 56))
  {
    ACFULogging::getLogInstance(v13);
    ACFULogging::handleMessage();
LABEL_109:
    uint64_t v10 = 0;
    goto LABEL_110;
  }
  uint64_t v10 = eUICCFwReaderStart(a2, (uint64_t (*)(uint64_t, CFStringRef, ACFULogging *))VinylFirmwareReaderCallback, (uint64_t)v79);
  ACFULogging::getLogInstance((ACFULogging *)v10);
  if (v10)
  {
    ACFULogging::handleMessage();
    goto LABEL_110;
  }
  std::string::basic_string[abi:ne180100]<0>(&v75, "VinylFirmware");
  long long v14 = std::string::append(&v75, "::");
  long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v76.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  long long v16 = std::string::append(&v76, "createIm4p");
  long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  std::string::size_type v78 = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  long long v18 = (ACFULogging *)ACFULogging::handleMessageCFType();
  if (SHIBYTE(v78) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v76.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v75.__r_.__value_.__l.__data_);
  }
  ACFULogging::getLogInstance(v18);
  std::string::basic_string[abi:ne180100]<0>(&v75, "VinylFirmware");
  std::string v19 = std::string::append(&v75, "::");
  long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  v76.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  std::string::size_type v21 = std::string::append(&v76, "createIm4p");
  long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  std::string::size_type v78 = v21->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  int v23 = (ACFULogging *)ACFULogging::handleMessageCFType();
  if (SHIBYTE(v78) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v76.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v75.__r_.__value_.__l.__data_);
  }
  ACFULogging::getLogInstance(v23);
  std::string::basic_string[abi:ne180100]<0>(&v75, "VinylFirmware");
  long long v24 = std::string::append(&v75, "::");
  long long v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
  v76.__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v25;
  v24->__r_.__value_.__l.__size_ = 0;
  v24->__r_.__value_.__r.__words[2] = 0;
  v24->__r_.__value_.__r.__words[0] = 0;
  std::string v26 = std::string::append(&v76, "createIm4p");
  CFArrayRef v27 = Mutable;
  long long v28 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
  std::string::size_type v78 = v26->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v28;
  v26->__r_.__value_.__l.__size_ = 0;
  v26->__r_.__value_.__r.__words[2] = 0;
  v26->__r_.__value_.__r.__words[0] = 0;
  std::string::size_type v29 = (ACFULogging *)ACFULogging::handleMessageCFType();
  if (SHIBYTE(v78) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v76.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v75.__r_.__value_.__l.__data_);
  }
  if (*(void *)(a3 + 24))
  {
    ACFULogging::getLogInstance(v29);
    std::string::basic_string[abi:ne180100]<0>(&v75, "VinylFirmware");
    CFTypeRef v30 = std::string::append(&v75, "::");
    long long v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
    v76.__r_.__value_.__r.__words[2] = v30->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v31;
    v30->__r_.__value_.__l.__size_ = 0;
    v30->__r_.__value_.__r.__words[2] = 0;
    v30->__r_.__value_.__r.__words[0] = 0;
    long long v32 = std::string::append(&v76, "createIm4p");
    CFArrayRef v27 = Mutable;
    long long v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
    std::string::size_type v78 = v32->__r_.__value_.__r.__words[2];
    *(_OWORD *)std::string __p = v33;
    v32->__r_.__value_.__l.__size_ = 0;
    v32->__r_.__value_.__r.__words[2] = 0;
    v32->__r_.__value_.__r.__words[0] = 0;
    std::string::size_type v29 = (ACFULogging *)ACFULogging::handleMessageCFType();
    if (SHIBYTE(v78) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v76.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v75.__r_.__value_.__l.__data_);
    }
  }
  if (*(void *)(a3 + 32))
  {
    ACFULogging::getLogInstance(v29);
    std::string::basic_string[abi:ne180100]<0>(&v75, "VinylFirmware");
    long long v34 = std::string::append(&v75, "::");
    long long v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
    v76.__r_.__value_.__r.__words[2] = v34->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v35;
    v34->__r_.__value_.__l.__size_ = 0;
    v34->__r_.__value_.__r.__words[2] = 0;
    v34->__r_.__value_.__r.__words[0] = 0;
    std::string v36 = std::string::append(&v76, "createIm4p");
    CFArrayRef v27 = Mutable;
    long long v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
    std::string::size_type v78 = v36->__r_.__value_.__r.__words[2];
    *(_OWORD *)std::string __p = v37;
    v36->__r_.__value_.__l.__size_ = 0;
    v36->__r_.__value_.__r.__words[2] = 0;
    v36->__r_.__value_.__r.__words[0] = 0;
    std::string::size_type v29 = (ACFULogging *)ACFULogging::handleMessageCFType();
    if (SHIBYTE(v78) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v76.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v75.__r_.__value_.__l.__data_);
    }
  }
  if (*(void *)(a3 + 40))
  {
    ACFULogging::getLogInstance(v29);
    std::string::basic_string[abi:ne180100]<0>(&v75, "VinylFirmware");
    CFDataRef v38 = std::string::append(&v75, "::");
    long long v39 = *(_OWORD *)&v38->__r_.__value_.__l.__data_;
    v76.__r_.__value_.__r.__words[2] = v38->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v39;
    v38->__r_.__value_.__l.__size_ = 0;
    v38->__r_.__value_.__r.__words[2] = 0;
    v38->__r_.__value_.__r.__words[0] = 0;
    CFStringRef v40 = std::string::append(&v76, "createIm4p");
    CFArrayRef v27 = Mutable;
    long long v41 = *(_OWORD *)&v40->__r_.__value_.__l.__data_;
    std::string::size_type v78 = v40->__r_.__value_.__r.__words[2];
    *(_OWORD *)std::string __p = v41;
    v40->__r_.__value_.__l.__size_ = 0;
    v40->__r_.__value_.__r.__words[2] = 0;
    v40->__r_.__value_.__r.__words[0] = 0;
    std::string::size_type v29 = (ACFULogging *)ACFULogging::handleMessageCFType();
    if (SHIBYTE(v78) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v76.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v75.__r_.__value_.__l.__data_);
    }
  }
  if (*(void *)(a3 + 48))
  {
    ACFULogging::getLogInstance(v29);
    std::string::basic_string[abi:ne180100]<0>(&v75, "VinylFirmware");
    uint64_t v42 = std::string::append(&v75, "::");
    long long v43 = *(_OWORD *)&v42->__r_.__value_.__l.__data_;
    v76.__r_.__value_.__r.__words[2] = v42->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v43;
    v42->__r_.__value_.__l.__size_ = 0;
    v42->__r_.__value_.__r.__words[2] = 0;
    v42->__r_.__value_.__r.__words[0] = 0;
    uint64_t v44 = std::string::append(&v76, "createIm4p");
    CFArrayRef v27 = Mutable;
    long long v45 = *(_OWORD *)&v44->__r_.__value_.__l.__data_;
    std::string::size_type v78 = v44->__r_.__value_.__r.__words[2];
    *(_OWORD *)std::string __p = v45;
    v44->__r_.__value_.__l.__size_ = 0;
    v44->__r_.__value_.__r.__words[2] = 0;
    v44->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType();
    if (SHIBYTE(v78) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v76.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v75.__r_.__value_.__l.__data_);
    }
  }
  Count = (ACFULogging *)CFArrayGetCount(v27);
  CFIndex v47 = (CFIndex)Count;
  if ((uint64_t)Count <= 0 || (Count = (ACFULogging *)CFArrayGetCount(theArray), (ACFULogging *)v47 != Count))
  {
    ACFULogging::getLogInstance(Count);
    ACFULogging::handleMessage();
    goto LABEL_109;
  }
  long long v11 = (const void **)malloc(8 * v47);
  uint64_t v48 = (ACFULogging *)malloc(8 * v47);
  long long v9 = (const void **)v48;
  if (!v11 || !v48)
  {
    ACFULogging::getLogInstance(v48);
    ACFULogging::handleMessage();
    uint64_t v10 = 0;
    goto LABEL_111;
  }
  v85.location = 0;
  v85.length = v47;
  CFArrayGetValues(Mutable, v85, v11);
  v86.location = 0;
  v86.length = v47;
  CFArrayGetValues(theArray, v86, v9);
  DEREncoderCreate();
  DEREncoderCreate();
  uint64_t v49 = 0;
  do
  {
    DEREncoderCreate();
    long long v50 = (CFDataRef *)&v11[v49];
    CFDataGetBytePtr(*v50);
    CFDataGetLength(*v50);
    long long v51 = (ACFULogging *)DEREncoderAddData();
    if (v51
      || (uint64_t v52 = (CFDataRef *)&v9[v49],
          CFDataGetBytePtr(*v52),
          CFDataGetLength(*v52),
          long long v51 = (ACFULogging *)DEREncoderAddData(),
          v51)
      || (long long v51 = (ACFULogging *)DEREncoderAddSequenceFromEncoder(), v51))
    {
      ACFULogging::getLogInstance(v51);
      ACFULogging::handleMessage();
      uint64_t v10 = 0;
LABEL_103:
      CFMutableArrayRef v8 = theArray;
      goto LABEL_87;
    }
    DEREncoderDestroy();
    ++v49;
  }
  while (v47 != v49);
  EncodedBuffer = (ACFULogging *)DEREncoderAddSequenceFromEncoder();
  if (EncodedBuffer
    || (DEREncoderDestroy(), EncodedBuffer = (ACFULogging *)DEREncoderCreateEncodedBuffer(), EncodedBuffer))
  {
    ACFULogging::getLogInstance(EncodedBuffer);
    ACFULogging::handleMessage();
LABEL_114:
    uint64_t v10 = 3;
    goto LABEL_103;
  }
  CFDataRef v54 = CFDataCreateWithBytesNoCopy(0, v83, v82, (CFAllocatorRef)*MEMORY[0x263EFFB18]);
  if (!v54)
  {
    uint64_t v10 = 2;
    goto LABEL_103;
  }
  if (!CFStringGetCString(*(CFStringRef *)a3, buffer, 5, 0x8000100u)) {
    goto LABEL_114;
  }
  CString = (ACFULogging *)CFStringGetCString(@"1.0", v80, 5, 0x8000100u);
  if (!CString) {
    goto LABEL_114;
  }
  ACFULogging::getLogInstance(CString);
  std::string::basic_string[abi:ne180100]<0>(&v75, "VinylFirmware");
  CFDataRef v56 = std::string::append(&v75, "::");
  long long v57 = *(_OWORD *)&v56->__r_.__value_.__l.__data_;
  v76.__r_.__value_.__r.__words[2] = v56->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v57;
  v56->__r_.__value_.__l.__size_ = 0;
  v56->__r_.__value_.__r.__words[2] = 0;
  v56->__r_.__value_.__r.__words[0] = 0;
  CFDataRef v58 = std::string::append(&v76, "createIm4p");
  long long v59 = *(_OWORD *)&v58->__r_.__value_.__l.__data_;
  std::string::size_type v78 = v58->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v59;
  v58->__r_.__value_.__l.__size_ = 0;
  v58->__r_.__value_.__r.__words[2] = 0;
  v58->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v78) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v76.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v75.__r_.__value_.__l.__data_);
  }
  uint64_t v60 = (void *)*((void *)a1 + 23);
  if (!v60)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
LABEL_118:
    uint64_t v10 = 99;
    goto LABEL_103;
  }
  uint64_t v61 = dlsym(v60, "AMAuthInstallApImg4CreatePayload");
  v62 = dlerror();
  if (v62 || !v61)
  {
    ACFULogging::getLogInstance((ACFULogging *)v62);
    ACFULogging::handleMessage();
    goto LABEL_118;
  }
  uint64_t v10 = ((uint64_t (*)(char *, char *, CFDataRef, void, void, uint64_t))v61)(buffer, v80, v54, 0, 0, a4);
  ACFULogging::getLogInstance((ACFULogging *)v10);
  if (v10)
  {
    ACFULogging::handleMessage();
    goto LABEL_103;
  }
  std::string::basic_string[abi:ne180100]<0>(&v75, "VinylFirmware");
  char v63 = std::string::append(&v75, "::");
  long long v64 = *(_OWORD *)&v63->__r_.__value_.__l.__data_;
  v76.__r_.__value_.__r.__words[2] = v63->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v64;
  v63->__r_.__value_.__l.__size_ = 0;
  v63->__r_.__value_.__r.__words[2] = 0;
  v63->__r_.__value_.__r.__words[0] = 0;
  CFAllocatorRef v65 = std::string::append(&v76, "createIm4p");
  long long v66 = *(_OWORD *)&v65->__r_.__value_.__l.__data_;
  std::string::size_type v78 = v65->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v66;
  v65->__r_.__value_.__l.__size_ = 0;
  v65->__r_.__value_.__r.__words[2] = 0;
  v65->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  CFMutableArrayRef v8 = theArray;
  if (SHIBYTE(v78) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v76.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v75.__r_.__value_.__l.__data_);
  }
  uint64_t v10 = 0;
LABEL_87:
  CFArrayRef v67 = Mutable;
  if (Mutable) {
LABEL_88:
  }
    CFRelease(v67);
  if (v8) {
    CFRelease(v8);
  }
  if (v11) {
    free(v11);
  }
  if (v9) {
    free(v9);
  }
  DEREncoderDestroy();
  DEREncoderDestroy();
  uint64_t v68 = *(const void **)(a3 + 48);
  if (v68)
  {
    CFRelease(v68);
    *(void *)(a3 + 48) = 0;
  }
  v69 = *(const void **)(a3 + 56);
  if (v69)
  {
    CFRelease(v69);
    *(void *)(a3 + 56) = 0;
  }
  if (v83) {
    free(v83);
  }
  return v10;
}

void sub_230AE2920(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (a34 < 0) {
    operator delete(__p);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

const void *VinylFirmware::getFwMac(CFDictionaryRef *this)
{
  return VinylFirmware::getFwMac((VinylFirmware *)this, this[21]);
}

const void *VinylFirmware::getFwMac(VinylFirmware *this, CFDictionaryRef theDict)
{
  CFTypeRef Value = CFDictionaryGetValue(theDict, @"com.apple.EmbeddedSoftwareRestore.eUICC.firmwareMac");
  if (!Value)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_13;
  }
  CFTypeID TypeID = CFDataGetTypeID();
  CFIndex Length = (ACFULogging *)CFGetTypeID(Value);
  if ((ACFULogging *)TypeID != Length
    || (CFIndex Length = (ACFULogging *)CFDataGetLength((CFDataRef)Value), Length != (ACFULogging *)8))
  {
    ACFULogging::getLogInstance(Length);
LABEL_13:
    ACFULogging::handleMessage();
    return Value;
  }
  ACFULogging::getLogInstance((ACFULogging *)8);
  std::string::basic_string[abi:ne180100]<0>(&v10, "VinylFirmware");
  uint64_t v5 = std::string::append(&v10, "::");
  long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
  v11.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v11.__r_.__value_.__l.__data_ = v6;
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  CFMutableArrayRef v7 = std::string::append(&v11, "getFwMac");
  long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
  std::string::size_type v13 = v7->__r_.__value_.__r.__words[2];
  long long v12 = v8;
  v7->__r_.__value_.__l.__size_ = 0;
  v7->__r_.__value_.__r.__words[2] = 0;
  v7->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v13) < 0) {
    operator delete((void *)v12);
  }
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v11.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
  return Value;
}

void sub_230AE2B48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (*(char *)(v23 - 25) < 0) {
    operator delete(*(void **)(v23 - 48));
  }
  if (a23 < 0) {
    operator delete(__p);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t VinylFirmware::getIm4p(VinylFirmware *this)
{
  return *((void *)this + 17);
}

uint64_t VinylFirmware::getFwData(VinylFirmware *this)
{
  return *((void *)this + 15);
}

uint64_t VinylFirmware::getRecoveryFwData(VinylFirmware *this)
{
  ACFULogging::getLogInstance(this);
  std::string::basic_string[abi:ne180100]<0>(&v12, "VinylFirmware");
  uint64_t v2 = std::string::append(&v12, "::");
  long long v3 = *(_OWORD *)&v2->__r_.__value_.__l.__data_;
  v13.__r_.__value_.__r.__words[2] = v2->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v3;
  v2->__r_.__value_.__l.__size_ = 0;
  v2->__r_.__value_.__r.__words[2] = 0;
  v2->__r_.__value_.__r.__words[0] = 0;
  uint64_t v4 = std::string::append(&v13, "getRecoveryFwData");
  long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  std::string::size_type v15 = v4->__r_.__value_.__r.__words[2];
  long long v14 = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  long long v6 = (ACFULogging *)ACFULogging::handleMessageCFType();
  if (SHIBYTE(v15) < 0) {
    operator delete((void *)v14);
  }
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  ACFULogging::getLogInstance(v6);
  std::string::basic_string[abi:ne180100]<0>(&v12, "VinylFirmware");
  CFMutableArrayRef v7 = std::string::append(&v12, "::");
  long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
  v13.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v8;
  v7->__r_.__value_.__l.__size_ = 0;
  v7->__r_.__value_.__r.__words[2] = 0;
  v7->__r_.__value_.__r.__words[0] = 0;
  long long v9 = std::string::append(&v13, "getRecoveryFwData");
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  std::string::size_type v15 = v9->__r_.__value_.__r.__words[2];
  long long v14 = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v15) < 0) {
    operator delete((void *)v14);
  }
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  return *((void *)this + 16);
}

void sub_230AE2D38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (*(char *)(v21 - 25) < 0) {
    operator delete(*(void **)(v21 - 48));
  }
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t VinylFirmware::getInfoPlistData(VinylFirmware *this)
{
  return *((void *)this + 18);
}

uint64_t VinylFirmware::getProfileData(VinylFirmware *this)
{
  return *((void *)this + 19);
}

uint64_t VinylFirmware::getAuthPayload(VinylFirmware *this)
{
  return *((void *)this + 20);
}

uint64_t VinylFirmware::stitchImg4Vad(VinylFirmware *this, CFDataRef theData, const __CFData *a3, const __CFData **a4)
{
  uint64_t v4 = 1;
  if (theData && a3)
  {
    CFMutableDataRef MutableCopy = 0;
    if (!a4) {
      goto LABEL_10;
    }
    CFIndex Length = CFDataGetLength(theData);
    CFIndex v10 = CFDataGetLength(a3);
    CFMutableDataRef MutableCopy = CFDataCreateMutableCopy(0, v10 + Length, theData);
    if (MutableCopy)
    {
      BytePtr = CFDataGetBytePtr(a3);
      CFIndex v12 = CFDataGetLength(a3);
      CFDataAppendBytes(MutableCopy, BytePtr, v12);
      if (DEREncoderCreate())
      {
        CFDataGetBytePtr(MutableCopy);
        CFDataGetLength(MutableCopy);
        EncodedBuffer = (ACFULogging *)DEREncoderAddData();
        if (EncodedBuffer
          || (EncodedBuffer = (ACFULogging *)DEREncoderCreateEncodedBuffer(), EncodedBuffer))
        {
          ACFULogging::getLogInstance(EncodedBuffer);
          ACFULogging::handleMessage();
          goto LABEL_9;
        }
        CFDataRef v14 = CFDataCreate(0, 0, 0);
        *a4 = v14;
        if (v14)
        {
LABEL_9:
          uint64_t v4 = 0;
          goto LABEL_10;
        }
      }
    }
    uint64_t v4 = 2;
  }
  else
  {
    CFMutableDataRef MutableCopy = 0;
  }
LABEL_10:
  DEREncoderDestroy();
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  return v4;
}

BOOL VinylFirmwareReaderInfoPlistCallback(VinylFirmware *a1, CFStringRef theString, ACFULogging *a3)
{
  if (a1)
  {
    long long v5 = (void *)*((void *)a1 + 1);
    return VinylFirmware::fwReaderInfoPlistCallback(a1, v5, theString, a3);
  }
  else
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    return 0;
  }
}

uint64_t VinylFirmwareReaderCallback(VinylFirmware **a1, CFStringRef theString, ACFULogging *a3)
{
  if (a1)
  {
    long long v5 = a1[1];
    long long v6 = *a1;
    return VinylFirmware::fwReaderCallback(v6, v5, theString, a3);
  }
  else
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    return 0;
  }
}

CFStringRef VinylFirmware::getPathComponent(VinylFirmware *this, const __CFString *a2)
{
  if (!a2)
  {
    ACFULogging::getLogInstance(this);
LABEL_10:
    ACFULogging::handleMessage();
    return 0;
  }
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFURLRef v3 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, kCFURLPOSIXPathStyle, 0);
  if (!v3)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_10;
  }
  CFURLRef v4 = v3;
  CFURLRef PathComponent = CFURLCreateCopyDeletingLastPathComponent(v2, v3);
  if (!PathComponent)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    CFRelease(v4);
    return 0;
  }
  CFURLRef v6 = PathComponent;
  CFStringRef v7 = CFURLGetString(PathComponent);
  CFStringRef Copy = CFStringCreateCopy(v2, v7);
  if (!Copy)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
  }
  CFRelease(v4);
  CFRelease(v6);
  return Copy;
}

BOOL VinylFirmware::checkVinylFwLdrVerLegacy(VinylFirmware *this, CFArrayRef theArray)
{
  Count = (ACFULogging *)CFArrayGetCount(theArray);
  if ((uint64_t)Count <= 0)
  {
    ACFULogging::getLogInstance(Count);
LABEL_10:
    ACFULogging::handleMessage();
    return 1;
  }
  CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0);
  if (!ValueAtIndex
    || (CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, ValueAtIndex, @".")) == 0)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_10;
  }
  CFArrayRef v6 = ArrayBySeparatingStrings;
  CFStringRef v7 = (ACFULogging *)CFArrayGetCount(ArrayBySeparatingStrings);
  if (v7 == (ACFULogging *)2)
  {
    CFStringRef v8 = (const __CFString *)CFArrayGetValueAtIndex(v6, 0);
    IntCFTypeRef Value = CFStringGetIntValue(v8);
    CFStringRef v10 = (const __CFString *)CFArrayGetValueAtIndex(v6, 1);
    BOOL v11 = (((unsigned __int16)CFStringGetIntValue(v10) | (unsigned __int16)(IntValue << 8)) & 0x7FFFu) < 0x301;
  }
  else
  {
    ACFULogging::getLogInstance(v7);
    ACFULogging::handleMessage();
    BOOL v11 = 1;
  }
  CFRelease(v6);
  return v11;
}

const __CFData *VinylFirmware::fwLdrVerEqual(VinylFirmware *this, CFArrayRef theArray, const __CFData *a3)
{
  if (!theArray || (this = (VinylFirmware *)CFArrayGetCount(theArray), (uint64_t)this <= 0))
  {
    ACFULogging::getLogInstance(this);
LABEL_13:
    ACFULogging::handleMessage();
    return 0;
  }
  if (a3)
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0);
    if (ValueAtIndex)
    {
      CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, ValueAtIndex, @".");
      if (ArrayBySeparatingStrings)
      {
        CFArrayRef v7 = ArrayBySeparatingStrings;
        Count = (ACFULogging *)CFArrayGetCount(ArrayBySeparatingStrings);
        if (Count == (ACFULogging *)2)
        {
          CFDataRef BytePtr = (const __CFData *)CFDataGetBytePtr(a3);
          a3 = BytePtr;
          if (!BytePtr)
          {
            ACFULogging::getLogInstance(0);
            ACFULogging::handleMessage();
            goto LABEL_16;
          }
          int v10 = *(unsigned __int8 *)BytePtr;
          CFStringRef v11 = (const __CFString *)CFArrayGetValueAtIndex(v7, 0);
          if (CFStringGetIntValue(v11) == v10)
          {
            int v12 = *((unsigned __int8 *)a3 + 1);
            CFStringRef v13 = (const __CFString *)CFArrayGetValueAtIndex(v7, 1);
            a3 = (const __CFData *)(CFStringGetIntValue(v13) == v12);
LABEL_16:
            CFRelease(v7);
            return a3;
          }
        }
        else
        {
          ACFULogging::getLogInstance(Count);
          ACFULogging::handleMessage();
        }
        a3 = 0;
        goto LABEL_16;
      }
    }
    ACFULogging::getLogInstance(0);
    goto LABEL_13;
  }
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  return a3;
}

BOOL VinylFirmware::fwReaderInfoPlistCallback(VinylFirmware *this, void *a2, CFStringRef theString, ACFULogging *a4)
{
  CFDataRef data = 0;
  int v4 = 1;
  if (!a2 || !theString || !a4) {
    return v4 == 0;
  }
  CFStringRef v8 = (const __CFString *)a2[2];
  if (!v8 || (HasSuffix = (VinylFirmware *)CFStringHasSuffix(theString, v8), !HasSuffix))
  {
    int v4 = 0;
    return v4 == 0;
  }
  CFErrorRef error = 0;
  CFStringRef PathComponent = VinylFirmware::getPathComponent(HasSuffix, theString);
  if (!PathComponent)
  {
    CFPropertyListRef v13 = 0;
LABEL_21:
    int v4 = 2;
    goto LABEL_12;
  }
  CFStringRef v11 = eUICCFwReaderFindAndCopyFileData(a4, theString, (CFTypeRef *)&data);
  if (v11)
  {
    int v4 = (int)v11;
    ACFULogging::getLogInstance(v11);
    ACFULogging::handleMessage();
    CFPropertyListRef v13 = 0;
    goto LABEL_12;
  }
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFPropertyListRef v13 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], data, 0, 0, &error);
  if (!v13) {
    goto LABEL_21;
  }
  CFArrayRef Mutable = (__CFDictionary *)a2[7];
  if (!Mutable)
  {
    CFArrayRef Mutable = CFDictionaryCreateMutable(v12, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    a2[7] = Mutable;
    if (!Mutable) {
      goto LABEL_21;
    }
  }
  CFDictionaryAddValue(Mutable, PathComponent, v13);
  int v4 = 0;
LABEL_12:
  if (data)
  {
    CFRelease(data);
    CFDataRef data = 0;
  }
  if (PathComponent) {
    CFRelease(PathComponent);
  }
  if (v13) {
    CFRelease(v13);
  }
  return v4 == 0;
}

uint64_t VinylFirmware::fwReaderCallback(VinylFirmware *this, void *a2, CFStringRef theString, ACFULogging *a4)
{
  CFDataRef v4 = 0;
  uint64_t v5 = 0;
  uint64_t v39 = *MEMORY[0x263EF8340];
  CFTypeRef cf1 = 0;
  theCFDataRef Data = 0;
  if (!a2 || !theString)
  {
    CFArrayRef ArrayBySeparatingStrings = 0;
LABEL_58:
    CFArrayRef MutableCopy = 0;
    CFStringRef PathComponent = 0;
    goto LABEL_39;
  }
  CFArrayRef ArrayBySeparatingStrings = 0;
  CFArrayRef MutableCopy = 0;
  CFStringRef PathComponent = 0;
  if (!a4) {
    goto LABEL_39;
  }
  CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, theString, @"/");
  if (!ArrayBySeparatingStrings)
  {
LABEL_55:
    uint64_t v5 = 0;
    CFDataRef v4 = 0;
    CFArrayRef MutableCopy = 0;
    CFStringRef PathComponent = 0;
    goto LABEL_39;
  }
  CFPropertyListRef v13 = (void *)*((void *)this + 23);
  if (!v13)
  {
    ACFULogging::getLogInstance(0);
LABEL_54:
    ACFULogging::handleMessage();
    goto LABEL_55;
  }
  CFDataRef v14 = (uint64_t (*)(void, const void *, CFTypeRef *))dlsym(v13, "AMAuthInstallSupportCopyDataFromHexString");
  std::string::size_type v15 = dlerror();
  if (v15 || !v14)
  {
    ACFULogging::getLogInstance((ACFULogging *)v15);
    goto LABEL_54;
  }
  CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 0);
  int v17 = v14(0, ValueAtIndex, &cf1);
  CFDataRef v4 = 0;
  uint64_t v5 = 0;
  if (!cf1 || v17) {
    goto LABEL_58;
  }
  CFStringRef v18 = (const __CFString *)*((void *)a2 + 1);
  if (!v18 || (HasSuffix = (VinylFirmware *)CFStringHasSuffix(theString, v18), !HasSuffix))
  {
    CFDataRef v4 = 0;
    CFArrayRef MutableCopy = 0;
    CFStringRef PathComponent = 0;
LABEL_38:
    uint64_t v5 = 1;
    goto LABEL_39;
  }
  CFStringRef PathComponent = VinylFirmware::getPathComponent(HasSuffix, theString);
  if (!PathComponent
    || (CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(*((CFDictionaryRef *)a2 + 7), PathComponent)) == 0)
  {
    uint64_t v5 = 0;
    CFDataRef v4 = 0;
    CFArrayRef MutableCopy = 0;
    goto LABEL_39;
  }
  uint64_t v21 = (VinylFirmware *)CFDictionaryGetValue(Value, @"com.apple.EmbeddedSoftwareRestore.eUICC.bootloaderVersionsSupported");
  CFArrayRef MutableCopy = v21;
  if (!v21) {
    goto LABEL_63;
  }
  BOOL v22 = VinylFirmware::checkVinylFwLdrVerLegacy(v21, v21);
  uint64_t v23 = (const void *)*((void *)a2 + 4);
  if (!v23)
  {
    CFDataRef v4 = 0;
    CFArrayRef MutableCopy = 0;
    goto LABEL_28;
  }
  CFDataRef v24 = (const __CFData *)*((void *)a2 + 5);
  if (!v24
    || v22
    && (unsigned int v25 = VinylFirmware::fwLdrVerEqual((VinylFirmware *)v22, MutableCopy, v24),
        uint64_t v23 = (const void *)*((void *)a2 + 4),
        v25))
  {
    CFDataRef v4 = 0;
    CFArrayRef MutableCopy = 0;
    if (!CFEqual(cf1, v23)) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  CFArrayRef MutableCopy = CFDataCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, (CFDataRef)v23);
  if (!MutableCopy)
  {
LABEL_63:
    uint64_t v5 = 0;
    CFDataRef v4 = 0;
    goto LABEL_39;
  }
  CFDataRef BytePtr = CFDataGetBytePtr(*((CFDataRef *)a2 + 5));
  CFIndex Length = CFDataGetLength(*((CFDataRef *)a2 + 5));
  CFDataAppendBytes(MutableCopy, BytePtr, Length - 1);
  CFDataGetBytePtr(MutableCopy);
  CFDataGetLength(MutableCopy);
  long long v28 = (ACFULogging *)AMSupportDigestSha256();
  if (v28)
  {
    ACFULogging::getLogInstance(v28);
    ACFULogging::handleMessage();
    goto LABEL_63;
  }
  CFDataRef v4 = CFDataCreate(0, bytes, 32);
  if (!v4) {
    goto LABEL_60;
  }
  if (CFEqual(cf1, v4))
  {
LABEL_27:
    std::string::size_type v29 = eUICCFwReaderFindAndCopyFileData(a4, theString, (CFTypeRef *)a2 + 3);
    if (v29)
    {
LABEL_59:
      ACFULogging::getLogInstance(v29);
      ACFULogging::handleMessage();
      goto LABEL_60;
    }
  }
LABEL_28:
  CFArrayRef v30 = (const __CFArray *)*((void *)a2 + 6);
  if (!v30) {
    goto LABEL_38;
  }
  long long v31 = (__CFArray *)CFArrayGetValueAtIndex(v30, 0);
  long long v32 = (__CFArray *)CFArrayGetValueAtIndex(*((CFArrayRef *)a2 + 6), 1);
  uint64_t v5 = 0;
  if (v31)
  {
    long long v33 = v32;
    if (v32)
    {
      if (cf1)
      {
        CFArrayAppendValue(v31, cf1);
        std::string::size_type v29 = eUICCFwReaderFindAndCopyFileData(a4, theString, (CFTypeRef *)&theData);
        if (!v29)
        {
          CFDataGetBytePtr(theData);
          CFDataGetLength(theData);
          long long v34 = (ACFULogging *)AMSupportDigestSha256();
          if (v34)
          {
            ACFULogging::getLogInstance(v34);
            ACFULogging::handleMessage();
            goto LABEL_38;
          }
          if (v4) {
            CFRelease(v4);
          }
          CFDataRef v4 = CFDataCreate(0, bytes, 32);
          if (v4)
          {
            CFArrayAppendValue(v33, v4);
            goto LABEL_38;
          }
          goto LABEL_60;
        }
        goto LABEL_59;
      }
LABEL_60:
      uint64_t v5 = 0;
    }
  }
LABEL_39:
  if (theData)
  {
    CFRelease(theData);
    theCFDataRef Data = 0;
  }
  if (cf1)
  {
    CFRelease(cf1);
    CFTypeRef cf1 = 0;
  }
  if (v4) {
    CFRelease(v4);
  }
  if (ArrayBySeparatingStrings) {
    CFRelease(ArrayBySeparatingStrings);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  if (PathComponent) {
    CFRelease(PathComponent);
  }
  return v5;
}

uint64_t VinylFirmware::generateMeasurement@<X0>(CFDataRef *this@<X0>, CFDataRef *a2@<X8>)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  ACFULogging::getLogInstance((ACFULogging *)this);
  ACFULogging::handleMessage();
  *a2 = 0;
  CFDataGetBytePtr(this[17]);
  CFDataGetLength(this[17]);
  CFDataRef v4 = (ACFULogging *)AMSupportDigestSha256();
  if (v4)
  {
    ACFULogging::getLogInstance(v4);
    return ACFULogging::handleMessage();
  }
  else
  {
    *a2 = CFDataCreate(0, bytes, 32);
    __p[0] = 0;
    uint64_t v5 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
    ACFULogging::getLogInstance((ACFULogging *)v5);
    std::string::basic_string[abi:ne180100]<0>(&v12, "VinylFirmware");
    CFArrayRef v6 = std::string::append(&v12, "::");
    long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
    v13.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v7;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    CFStringRef v8 = std::string::append(&v13, "generateMeasurement");
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    std::string::size_type v15 = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)std::string __p = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    int v10 = (ACFULogging *)ACFULogging::handleMessageCFType();
    if (SHIBYTE(v15) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v13.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v12.__r_.__value_.__l.__data_);
    }
    ACFULogging::getLogInstance(v10);
    return ACFULogging::handleMessage();
  }
}

void sub_230AE3C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v30);
  _Unwind_Resume(a1);
}

void VinylFirmware::getFirmwareAPDUs(VinylFirmware **this@<X0>, uint64_t a2@<X8>)
{
  ACFULogging::getLogInstance((ACFULogging *)this);
  ACFULogging::handleMessage();
  CFDataRef v4 = this[15];

  VinylFirmware::getFirmwareAPDUs(v4, a2);
}

void VinylFirmware::getFirmwareAPDUs(VinylFirmware *this@<X0>, uint64_t a2@<X8>)
{
  ACFULogging::getLogInstance(this);
  uint64_t v5 = "VinylFirmware";
  ACFULogging::handleMessage();
  long long v34 = 0uLL;
  long long v35 = 0;
  v31[0] = CFDataGetMutableBytePtr(this);
  v31[1] = CFDataGetLength(this);
  uint64_t v30 = 0;
  CFArrayRef v6 = (ACFULogging *)DERParseSequence((uint64_t)v31, 2u, (uint64_t)&eUICC::DER::vinylFirmwareImageItemSpec, (unint64_t)v32, 0x20uLL);
  if (v6 || (CFArrayRef v6 = (ACFULogging *)DERDecodeSeqInit((uint64_t)&v33, &v30, v29), v6))
  {
    ACFULogging::getLogInstance(v6);
    unsigned int v25 = (ACFULogging *)ACFULogging::handleMessage();
  }
  else
  {
    while (1)
    {
      long long v7 = (ACFULogging *)DERDecodeSeqNext(v29, &v27);
      if (v7 == 1)
      {
        ACFULogging::getLogInstance(v7);
        ACFULogging::handleMessage();
        *(_OWORD *)a2 = v34;
        *(void *)(a2 + 16) = v35;
        return;
      }
      if (v7) {
        break;
      }
      long long v7 = (ACFULogging *)DERParseSequenceContent(&v28, 3u, (uint64_t)&eUICC::DER::vinylFirmwareImageAPDUItemSpec, (unint64_t)v26, 0x30uLL);
      if (v7) {
        break;
      }
      uint64_t v9 = v26[0];
      uint64_t v8 = v26[1];
      uint64_t v11 = v26[2];
      uint64_t v10 = v26[3];
      std::string v12 = (void *)*((void *)&v34 + 1);
      if (*((void *)&v34 + 1) >= (unint64_t)v35)
      {
        CFDataRef v14 = v5;
        uint64_t v15 = (uint64_t)(*((void *)&v34 + 1) - v34) >> 5;
        unint64_t v16 = v15 + 1;
        if ((unint64_t)(v15 + 1) >> 59) {
          std::vector<char *>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v17 = (uint64_t)&v35[-v34];
        if ((uint64_t)&v35[-v34] >> 4 > v16) {
          unint64_t v16 = v17 >> 4;
        }
        if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v18 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v18 = v16;
        }
        if (v18) {
          std::string v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<VinylFirmware::APDU>>((uint64_t)&v35, v18);
        }
        else {
          std::string v19 = 0;
        }
        long long v20 = &v19[32 * v15];
        *(void *)long long v20 = v9;
        *((void *)v20 + 1) = v8;
        *((void *)v20 + 2) = v11;
        *((void *)v20 + 3) = v10;
        uint64_t v21 = (char *)*((void *)&v34 + 1);
        BOOL v22 = (char *)v34;
        uint64_t v23 = v20;
        uint64_t v5 = v14;
        if (*((void *)&v34 + 1) != (void)v34)
        {
          do
          {
            long long v24 = *((_OWORD *)v21 - 1);
            *((_OWORD *)v23 - 2) = *((_OWORD *)v21 - 2);
            *((_OWORD *)v23 - 1) = v24;
            v23 -= 32;
            v21 -= 32;
          }
          while (v21 != v22);
          uint64_t v21 = v22;
        }
        std::string v13 = v20 + 32;
        *(void *)&long long v34 = v23;
        *((void *)&v34 + 1) = v20 + 32;
        long long v35 = &v19[32 * v18];
        if (v21) {
          operator delete(v21);
        }
      }
      else
      {
        **((void **)&v34 + 1) = v26[0];
        v12[1] = v8;
        std::string v13 = v12 + 4;
        void v12[2] = v11;
        v12[3] = v10;
      }
      *((void *)&v34 + 1) = v13;
    }
    ACFULogging::getLogInstance(v7);
    unsigned int v25 = (ACFULogging *)ACFULogging::handleMessage();
  }
  ACFULogging::getLogInstance(v25);
  ACFULogging::handleMessage();
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  if ((void)v34)
  {
    *((void *)&v34 + 1) = v34;
    operator delete((void *)v34);
  }
}

void sub_230AE3FE8(_Unwind_Exception *exception_object)
{
  CFURLRef v3 = *(void **)(v1 - 112);
  if (v3)
  {
    *(void *)(v1 - 104) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *VinylFirmware::getVersionString@<X0>(CFMutableDataRef *this@<X0>, void *a2@<X8>)
{
  v6[0] = CFDataGetMutableBytePtr(this[15]);
  v6[1] = CFDataGetLength(this[15]);
  CFDataRef v4 = (ACFULogging *)DERParseSequence((uint64_t)v6, 2u, (uint64_t)&eUICC::DER::vinylFirmwareImageItemSpec, (unint64_t)v8, 0x20uLL);
  if (!v4)
  {
    CFDataRef v4 = (ACFULogging *)DERParseSequenceContent(v8, 3u, (uint64_t)&eUICC::DER::vinylFirmwareImageHeaderItemSpec, (unint64_t)v7, 0x30uLL);
    if (!v4) {
      return std::string::basic_string[abi:ne180100](a2, v7[0], (size_t)v7[1]);
    }
  }
  ACFULogging::getLogInstance(v4);
  uint64_t result = (void *)ACFULogging::handleMessage();
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return result;
}

void VinylFirmware::bootloaderVersion(VinylFirmware *this@<X0>, int a2@<W1>, std::string *a3@<X8>)
{
  std::to_string(&v11, (int)this);
  uint64_t v5 = std::string::append(&v11, ".");
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
  uint64_t v9 = std::string::append(&v12, (const std::string::value_type *)p_p, size);
  *a3 = *v9;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v11.__r_.__value_.__l.__data_);
  }
}

void sub_230AE41C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

const void **VinylFirmware::generateMeasurementDict@<X0>(VinylFirmware *this@<X0>, const __CFData *a2@<X1>, __CFDictionary **a3@<X8>)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  CFMutableDictionaryRef v31 = 0;
  CFMutableDictionaryRef theDict = 0;
  *a3 = 0;
  CFArrayRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *a3 = Mutable;
  __p[0] = 0;
  uint64_t v8 = (ACFULogging *)ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)__p);
  if (Mutable) {
    uint64_t v9 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  }
  else {
    uint64_t v9 = 0;
  }
  if (!v9 || (CFDataGetBytePtr(this), CFDataGetLength(this), uint64_t v8 = (ACFULogging *)AMSupportDigestSha256(), v8))
  {
    ACFULogging::getLogInstance(v8);
    ACFULogging::handleMessage();
    goto LABEL_26;
  }
  CFDataRef v10 = CFDataCreate(0, bytes, 32);
  std::string v11 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFMutableDictionaryRef v12 = theDict;
  CFMutableDictionaryRef theDict = v11;
  __p[0] = v12;
  std::string v13 = (ACFULogging *)ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)__p);
  if (v10
    && ((std::string v13 = theDict) != 0
      ? (CFDataRef v14 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get)
      : (CFDataRef v14 = 0),
        v14))
  {
    CFDictionarySetValue(theDict, @"Digest", v10);
    CFDictionarySetValue(Mutable, @"eUICC,Gold", theDict);
    CFDataGetBytePtr(a2);
    CFDataGetLength(a2);
    uint64_t v15 = (ACFULogging *)AMSupportDigestSha256();
    if (!v15)
    {
      CFDataRef v16 = CFDataCreate(0, bytes, 32);
      uint64_t v17 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFMutableDictionaryRef v18 = v31;
      CFMutableDictionaryRef v31 = v17;
      __p[0] = v18;
      ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)__p);
      if (v31) {
        std::string v19 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
      }
      else {
        std::string v19 = 0;
      }
      if (v19 && v16)
      {
        CFDictionarySetValue(v31, @"Digest", v16);
        CFDictionarySetValue(Mutable, @"eUICC,Main", v31);
        ACFULogging::getLogInstance(v20);
        std::string::basic_string[abi:ne180100]<0>(&v27, "VinylFirmware");
        uint64_t v21 = std::string::append(&v27, "::");
        long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
        v28.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v22;
        v21->__r_.__value_.__l.__size_ = 0;
        v21->__r_.__value_.__r.__words[2] = 0;
        v21->__r_.__value_.__r.__words[0] = 0;
        uint64_t v23 = std::string::append(&v28, "generateMeasurementDict");
        long long v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
        std::string::size_type v30 = v23->__r_.__value_.__r.__words[2];
        *(_OWORD *)std::string __p = v24;
        v23->__r_.__value_.__l.__size_ = 0;
        v23->__r_.__value_.__r.__words[2] = 0;
        v23->__r_.__value_.__r.__words[0] = 0;
        unsigned int v25 = (ACFULogging *)ACFULogging::handleMessageCFType();
        if (SHIBYTE(v30) < 0) {
          operator delete(__p[0]);
        }
        if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v28.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v27.__r_.__value_.__l.__data_);
        }
        ACFULogging::getLogInstance(v25);
        ACFULogging::handleMessage();
      }
      else
      {
        ACFULogging::getLogInstance(v31);
        ACFULogging::handleMessage();
      }
      goto LABEL_24;
    }
    ACFULogging::getLogInstance(v15);
    ACFULogging::handleMessage();
  }
  else
  {
    ACFULogging::getLogInstance(v13);
    ACFULogging::handleMessage();
    if (!v10) {
      goto LABEL_26;
    }
  }
  CFDataRef v16 = 0;
LABEL_24:
  CFRelease(v10);
  if (v16) {
    CFRelease(v16);
  }
LABEL_26:
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&v31);
  return ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&theDict);
}

void sub_230AE45F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,const void *a31,const void *a32)
{
  if (a30 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(v32);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(&a31);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(&a32);
  _Unwind_Resume(a1);
}

uint64_t VinylFirmware::generateMeasurement@<X0>(VinylFirmware *this@<X0>, CFDataRef *a2@<X8>)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  *a2 = 0;
  CFDataGetBytePtr(this);
  CFDataGetLength(this);
  uint64_t v5 = (ACFULogging *)AMSupportDigestSha256();
  if (v5)
  {
    ACFULogging::getLogInstance(v5);
    return ACFULogging::handleMessage();
  }
  else
  {
    *a2 = CFDataCreate(0, bytes, 32);
    __p[0] = 0;
    long long v6 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
    ACFULogging::getLogInstance((ACFULogging *)v6);
    std::string::basic_string[abi:ne180100]<0>(&v13, "VinylFirmware");
    long long v7 = std::string::append(&v13, "::");
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v14.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    uint64_t v9 = std::string::append(&v14, "generateMeasurement");
    long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    std::string::size_type v16 = v9->__r_.__value_.__r.__words[2];
    *(_OWORD *)std::string __p = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    std::string v11 = (ACFULogging *)ACFULogging::handleMessageCFType();
    if (SHIBYTE(v16) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v14.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v13.__r_.__value_.__l.__data_);
    }
    ACFULogging::getLogInstance(v11);
    return ACFULogging::handleMessage();
  }
}

void sub_230AE483C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v30);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<VinylFirmware::APDU>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
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
      std::string v13 = "failure";
      if (v9) {
        std::string v13 = "success";
      }
      _BBULog(2, 0, "VinylEURCommunication", "", "Resetting modem: %s\n", v10, v11, v12, (char)v13);
    }
    return ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef((const void **)&Controller);
  }
  return result;
}

void sub_230AE49D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
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
    block[5] = a2;
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
    *(void *)(*(void *)(result + 32) + 4pthread_mutex_init(this, 0) = 0;
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
  std::string v36 = &v35;
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
    block[3] = &unk_264BA2070;
    void block[6] = a1;
    block[7] = a2;
    long long v22 = v29;
    long long v23 = v30;
    long long v24 = v31;
    uint64_t v25 = v32;
    long long v20 = v27;
    long long v21 = v28;
    block[4] = v33;
    block[5] = &v35;
    dispatch_sync(v11, block);
    _Block_object_dispose(v33, 8);
  }
  uint64_t v12 = *((unsigned int *)v36 + 6);
  _Block_object_dispose(&v35, 8);
  return v12;
}

void sub_230AE4DE4(_Unwind_Exception *a1)
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
  *(void *)(v2 + 4pthread_mutex_init(this, 0) = a1[7];
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

void sub_230AE4F60(_Unwind_Exception *a1)
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
  block[3] = &unk_264BA2098;
  block[4] = &v11;
  block[5] = a1;
  void block[6] = a2;
  dispatch_sync(v7, block);
  uint64_t v8 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

void sub_230AE5074(_Unwind_Exception *a1)
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

  *(void *)this = &unk_26E556018;
  uint64_t v2 = *((void *)this + 4);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *((void *)this + 3);
  if (v3) {
    dispatch_release(v3);
  }

  eUICC::eUICCVinylValve::~eUICCVinylValve(this);
}

const void **ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

eUICC::eUICCVinylICEValve *eUICC::eUICCVinylICEValve::eUICCVinylICEValve(eUICC::eUICCVinylICEValve *this, void *a2, int a3, char a4)
{
  *((unsigned char *)this + 288) = 0;
  *((unsigned char *)this + 304) = 0;
  *(void *)this = &unk_26E556070;
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
  uint64_t v7 = (eUICC::VinylCommandDriver *)operator new(8uLL);
  eUICC::VinylCommandDriver::VinylCommandDriver();
  std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](v5, v7);
  *((unsigned char *)this + 304) = 15;
  return this;
}

void sub_230AE5230(_Unwind_Exception *a1)
{
  operator delete(v3);
  std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](v2, 0);
  eUICC::eUICCVinylValve::~eUICCVinylValve(v1);
  _Unwind_Resume(a1);
}

uint64_t IceAriGetContext(void)
{
  pthread_mutex_lock(&ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance);
  uint64_t v0 = off_26870BB68;
  if (!off_26870BB68)
  {
    uint64_t v1 = operator new(0x28uLL);
    v1[32] = 0;
    std::shared_ptr<ICEARIContext>::shared_ptr[abi:ne180100]<ICEARIContext,void>(&v6, (uint64_t)v1);
    long long v2 = v6;
    long long v6 = 0uLL;
    uint64_t v3 = (std::__shared_weak_count *)*(&off_26870BB68 + 1);
    off_26870BB68 = v2;
    if (v3)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
      if (*((void *)&v6 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v6 + 1));
      }
    }
    uint64_t v0 = off_26870BB68;
  }
  uint64_t v4 = (std::__shared_weak_count *)*(&off_26870BB68 + 1);
  if (*(&off_26870BB68 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26870BB68 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return v0;
}

void sub_230AE531C(_Unwind_Exception *a1)
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
  *(_OWORD *)((char *)this + 20pthread_mutex_init(this, 0) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 12pthread_mutex_init(this, 0) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 4pthread_mutex_init(this, 0) = 0u;
  *(_OWORD *)((char *)this + 273) = 0u;
  _OWORD *v4 = 0u;
  AriSdk::Tlv<unsigned int>::operator=<int &,void>(&v29, (_DWORD *)this + 73);
  uint64_t v8 = operator new(1uLL);
  unsigned char *v8 = 0;
  uint64_t v9 = __p;
  std::string __p = v8;
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
  char v14 = (_OWORD *)MEMORY[0xC8];
  if (MEMORY[0xC8] == MEMORY[0xD0]) {
    char v14 = 0;
  }
  *((_OWORD *)this + 5) = *v14;
  uint64_t v15 = (_OWORD *)MEMORY[0x128];
  if (MEMORY[0x128] == MEMORY[0x130]) {
    uint64_t v15 = 0;
  }
  *(_OWORD *)((char *)this + 155) = *v15;
  uint64_t v16 = (_OWORD *)MEMORY[0x1C0];
  if (MEMORY[0x1C0] == MEMORY[0x1C8]) {
    uint64_t v16 = 0;
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
  *((unsigned char *)this + 25pthread_mutex_init(this, 0) = v19;
  *((unsigned char *)this + 12) = *MEMORY[0x50];
  *((unsigned char *)this + 283) = *MEMORY[0x1E8];
  *((unsigned char *)this + 288) = 1;
  eUICC::logEUICCData((int *)this + 2);
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "result  0x%x \n", v20, v21, v22, *MEMORY[0x48]);
LABEL_22:
  memcpy(a2, (char *)this + 8, 0x119uLL);
  return MEMORY[0x230FC79A0](v28);
}

void sub_230AE560C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  MEMORY[0x230FC79A0](va);
  _Unwind_Resume(a1);
}

void **AriSdk::Tlv<unsigned int>::operator=<int &,void>(void **a1, _DWORD *a2)
{
  uint64_t v4 = operator new(4uLL);
  _DWORD *v4 = *a2;
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
  MEMORY[0x230FC7A80](v30);
  return v17;
}

void sub_230AE59B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230FC7A80](va);
  _Unwind_Resume(a1);
}

uint64_t eUICC::eUICCVinylICEValve::SetCardMode(uint64_t a1)
{
  AriSdk::ARI_IBIVinylSwitchModeReq_SDK::ARI_IBIVinylSwitchModeReq_SDK((AriSdk::ARI_IBIVinylSwitchModeReq_SDK *)v10);
  AriSdk::Tlv<unsigned int>::operator=<int &,void>(&v11, (_DWORD *)(a1 + 292));
  int v2 = operator new(1uLL);
  unsigned char *v2 = 1;
  int v3 = __p;
  std::string __p = v2;
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
  MEMORY[0x230FC7A20](v10);
  return v4;
}

void sub_230AE5AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  MEMORY[0x230FC7A20](va);
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
  _DWORD *v4 = 17;
  uint64_t v5 = __p;
  std::string __p = v4;
  if (v5) {
    operator delete(v5);
  }
  uint64_t v6 = operator new(4uLL);
  _DWORD *v6 = 1;
  uint64_t v7 = v32;
  uint64_t v32 = v6;
  if (v7) {
    operator delete(v7);
  }
  uint64_t v8 = operator new(2uLL);
  _WORD *v8 = 1;
  char v9 = v33;
  uint64_t v33 = v8;
  if (v9) {
    operator delete(v9);
  }
  uint64_t v10 = operator new(2uLL);
  _WORD *v10 = 0;
  uint64_t v11 = v34;
  char v34 = v10;
  if (v11) {
    operator delete(v11);
  }
  uint64_t v12 = operator new(2uLL);
  *uint64_t v12 = 7;
  uint64_t v13 = v35;
  uint64_t v35 = v12;
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
  MEMORY[0x230FC7960](v29);
  return v22;
}

void sub_230AE5D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  MEMORY[0x230FC7960](va);
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

void sub_230AE5E0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
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
  _DWORD *v8 = 5;
  char v9 = __p;
  std::string __p = v8;
  if (v9) {
    operator delete(v9);
  }
  uint64_t v10 = operator new(4uLL);
  _DWORD *v10 = 1;
  uint64_t v11 = v34;
  char v34 = v10;
  if (v11) {
    operator delete(v11);
  }
  uint64_t v12 = operator new(2uLL);
  *uint64_t v12 = 1;
  uint64_t v13 = v35;
  uint64_t v35 = v12;
  if (v13) {
    operator delete(v13);
  }
  uint64_t v14 = operator new(2uLL);
  *uint64_t v14 = 0;
  uint64_t v15 = v36;
  std::string v36 = v14;
  if (v15) {
    operator delete(v15);
  }
  uint64_t v17 = *a2;
  uint64_t v16 = a2[1];
  uint64_t v18 = operator new(2uLL);
  _WORD *v18 = (_WORD)v16 - (_WORD)v17;
  uint64_t v19 = v37;
  uint64_t v37 = v18;
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
  MEMORY[0x230FC7960](v31);
  return v26;
}

void sub_230AE6094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  MEMORY[0x230FC7960](va);
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

void sub_230AE6174(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::eUICCVinylICEValve::InstallTicket(_DWORD *a1, CFDataRef *a2)
{
  __src[36] = *(const void **)MEMORY[0x263EF8340];
  AriSdk::ARI_IBIVinylInstallVadReq_SDK::ARI_IBIVinylInstallVadReq_SDK((AriSdk::ARI_IBIVinylInstallVadReq_SDK *)v53);
  uint64_t v52 = 0;
  if (*a2) {
    unint64_t v4 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  }
  else {
    unint64_t v4 = 0;
  }
  if (!v4)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v12, v13, v14, (char)"installTicket");
LABEL_17:
    uint64_t v8 = 2;
    goto LABEL_18;
  }
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "eUICCVinylICEValve::InstallTicket\n", v5, v6, v7, v47);
  (*(void (**)(const void **__return_ptr, _DWORD *))(*(void *)a1 + 8))(__src, a1);
  memcpy(a1 + 2, __src, 0x119uLL);
  if (a1[2] != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v15, v16, v17, (char)"outData.Valid()");
    uint64_t v8 = 18;
    goto LABEL_18;
  }
  if (*((unsigned char *)a1 + 31))
  {
    uint64_t v8 = (*(uint64_t (**)(_DWORD *, void, void))(*(void *)a1 + 16))(a1, 0, 0);
    if (v8)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v9, v10, v11, (char)"kBBUReturnSuccess == ret");
      goto LABEL_18;
    }
  }
  AriSdk::Tlv<unsigned int>::operator=<int &,void>(&v54, a1 + 73);
  uint64_t v18 = operator new(2uLL);
  _WORD *v18 = 1;
  uint64_t v19 = __p;
  std::string __p = v18;
  if (v19) {
    operator delete(v19);
  }
  uint64_t v20 = operator new(2uLL);
  *uint64_t v20 = 0;
  uint64_t v21 = v56;
  CFDataRef v56 = v20;
  if (v21) {
    operator delete(v21);
  }
  CFDataRef BytePtr = CFDataGetBytePtr(*a2);
  unint64_t Length = CFDataGetLength(*a2);
  if (Length >= 0xE01)
  {
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Ticket provided is larger than spec. [ %lu (lenth) > %lu (spec max) ] \n", v24, v25, v26, Length);
    goto LABEL_17;
  }
  uint64_t v28 = operator new(2uLL);
  _WORD *v28 = Length;
  uint64_t v29 = v57;
  long long v57 = v28;
  if (v29) {
    operator delete(v29);
  }
  memset(__src, 0, 24);
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(__src, BytePtr, (uint64_t)&BytePtr[Length], Length);
  uint64_t v51 = 0;
  __n128 v50 = 0uLL;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(&v50, __src[0], (uint64_t)__src[1], (char *)__src[1] - (char *)__src[0]);
  AriSdk::TlvArray<unsigned char,3584ul>::operator=((uint64_t)&v58, &v50, v30);
  if (v50.n128_u64[0])
  {
    v50.n128_u64[1] = v50.n128_u64[0];
    operator delete((void *)v50.n128_u64[0]);
  }
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "eUICCVinylICEValve::InstallTicket InstallVad \n", v31, v32, v33, v48);
  char v34 = eUICC::VinylCommandDriver::InstallVad();
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "eUICCVinylICEValve::InstallTicket InstallVad status %d\n", v35, v36, v37, v34);
  if (v34)
  {
    if (*v52[9])
    {
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "InstallTicket result 0x%x sw1_sw2 0x%hx\n", v38, v39, v40, *v52[9]);
      uint64_t v8 = 16;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v41, v42, v43, (char)"status");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "InstallTicket failed to get desired response\n", v44, v45, v46, v49);
    uint64_t v8 = 11;
  }
  if (__src[0])
  {
    __src[1] = __src[0];
    operator delete((void *)__src[0]);
  }
  if (v52) {
    (*((void (**)(_DWORD **))*v52 + 2))(v52);
  }
LABEL_18:
  MEMORY[0x230FC7A00](v53);
  return v8;
}

void sub_230AE6644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33)
{
  if (__p) {
    operator delete(__p);
  }
  if (a32)
  {
    a33 = (uint64_t)a32;
    operator delete(a32);
  }
  MEMORY[0x230FC7A00](&a17);
  _Unwind_Resume(a1);
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

void sub_230AE6770(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::eUICCVinylICEValve::StreamFirmware(eUICC::eUICCVinylICEValve *this, __CFData *a2)
{
  v78[36] = *MEMORY[0x263EF8340];
  v77 = 0;
  VinylFirmware::getFirmwareAPDUs(a2, (uint64_t)&v75);
  unint64_t v4 = v75;
  int v3 = v76;
  (*(void (**)(void *__return_ptr, eUICC::eUICCVinylICEValve *))(*(void *)this + 8))(v78, this);
  memcpy((char *)this + 8, v78, 0x119uLL);
  if (*((_DWORD *)this + 2) != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)"outData.Valid()");
    uint64_t v9 = 18;
    goto LABEL_38;
  }
  if (*((unsigned char *)this + 31) == 1)
  {
    int v5 = 18;
  }
  else
  {
    uint64_t v9 = (*(uint64_t (**)(eUICC::eUICCVinylICEValve *, void, void))(*(void *)this + 16))(this, 0, 0);
    if (v9)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"kBBUReturnSuccess == ret");
      goto LABEL_38;
    }
    int v5 = 0;
  }
  unint64_t v13 = (v3 - v4) >> 5;
  unint64_t v14 = *((unsigned __int8 *)this + 304);
  unint64_t v73 = v13;
  if (v13 % v14) {
    uint64_t v15 = v13 / v14 + 1;
  }
  else {
    uint64_t v15 = v13 / v14;
  }
  if (v15)
  {
    unsigned int v67 = v5;
    uint64_t v74 = 0;
    unint64_t v16 = 0;
    uint64_t v68 = &v78[13];
    uint64_t v69 = v15;
    CFIndex v70 = (void **)&v78[8];
    size_t v71 = (_DWORD *)((char *)this + 292);
    while (1)
    {
      uint64_t v17 = AriSdk::ARI_IBIVinylInstallFwReq_SDK::ARI_IBIVinylInstallFwReq_SDK((AriSdk::ARI_IBIVinylInstallFwReq_SDK *)v78);
      uint64_t v72 = v66;
      unint64_t v18 = *((unsigned __int8 *)this + 304);
      unint64_t v19 = v73 - (v16 * v18) >= v18 ? *((unsigned __int8 *)this + 304) : v73 - (v16 * v18);
      MEMORY[0x270FA5388](v17);
      uint64_t v21 = &v66[-v20];
      bzero(&v66[-v20], v22);
      AriSdk::Tlv<unsigned int>::operator=<int &,void>(v70, v71);
      uint64_t v23 = v21;
      if (v19) {
        break;
      }
LABEL_23:
      gBBULogMaskGet();
      unint64_t v32 = v69;
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "StreamFirmware set %d/%zu adpusThisSet %zu\n", v33, v34, v35, v16);
      uint64_t v36 = operator new(2uLL);
      _WORD *v36 = v32;
      uint64_t v37 = (void *)v78[9];
      v78[9] = v36;
      if (v37) {
        operator delete(v37);
      }
      uint64_t v38 = operator new(2uLL);
      _WORD *v38 = v16;
      uint64_t v39 = (void *)v78[10];
      v78[10] = v38;
      if (v39) {
        operator delete(v39);
      }
      uint64_t v40 = operator new(2uLL);
      *uint64_t v40 = (_WORD)v23 - (_WORD)v21;
      uint64_t v41 = (void *)v78[12];
      v78[12] = v40;
      if (v41) {
        operator delete(v41);
      }
      AriSdk::TlvArray<unsigned char,3930ul>::assign<unsigned char *>(v68, v21, v23);
      uint64_t v42 = operator new(1uLL);
      *uint64_t v42 = v19;
      uint64_t v43 = (void *)v78[11];
      v78[11] = v42;
      if (v43) {
        operator delete(v43);
      }
      if ((eUICC::VinylCommandDriver::StreamFW() & 1) == 0)
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v54, v55, v56, (char)"status");
        gBBULogMaskGet();
        _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "StreamFirmware failed\n", v57, v58, v59, v66[0]);
        uint64_t v9 = 11;
        goto LABEL_36;
      }
      if (*v77[9])
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v60, v61, v62, (char)"!GET_RSP_FIELD(rsp, result_t3)");
        gBBULogMaskGet();
        _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Failed StreamAPDU set %d/%zu, status %d sw1_sw2 0x%x \n", v63, v64, v65, v16);
        uint64_t v9 = 16;
        goto LABEL_36;
      }
      (*((void (**)(_DWORD **))*v77 + 2))(v77);
      v77 = 0;
      MEMORY[0x230FC79E0](v78);
      uint64_t v9 = 0;
      ++v16;
      v74 += 32;
      if (v32 <= v16) {
        goto LABEL_38;
      }
    }
    uint64_t v24 = (size_t *)&v75[v74 * *((unsigned __int8 *)this + 304) + 24];
    unint64_t v25 = v73 - (v16 * v18);
    if (v25 >= v18) {
      unint64_t v25 = v18;
    }
    uint64_t v26 = 32 * v25;
    uint64_t v23 = v21;
    while (1)
    {
      unint64_t v27 = *(v24 - 2);
      if (v27 > 5 || *v24 >= 0x100) {
        break;
      }
      uint64_t v28 = &v23[v27 + *v24];
      char *v23 = v27;
      memcpy(v23 + 1, (const void *)*(v24 - 3), *(v24 - 2));
      v23[*(v24 - 2) + 1] = *(unsigned char *)v24;
      uint64_t v29 = (const void *)*(v24 - 1);
      long long v30 = &v23[*(v24 - 2) + 2];
      size_t v31 = *v24;
      v24 += 4;
      memcpy(v30, v29, v31);
      uint64_t v23 = v28 + 2;
      v26 -= 32;
      if (!v26) {
        goto LABEL_23;
      }
    }
    gBBULogMaskGet();
    uint64_t v9 = v67;
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v44, v45, v46, (char)"f.header.length <= 5 && f.data.length <= 255");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Firmware APDU not within expected bounds : received (header - 5 : %zu data- 255 : %zu\n", v47, v48, v49, *(v24 - 2));
LABEL_36:
    MEMORY[0x230FC79E0](v78);
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v50, v51, v52, (char)"apduSetCount");
    uint64_t v9 = 15;
  }
LABEL_38:
  if (v77) {
    (*((void (**)(_DWORD **))*v77 + 2))(v77);
  }
  v77 = 0;
  if (v75)
  {
    std::string v76 = v75;
    operator delete(v75);
  }
  return v9;
}

void sub_230AE6E24(_Unwind_Exception *a1)
{
  MEMORY[0x230FC79E0](v1 + 96);
  int v3 = *(void **)(v1 + 64);
  if (v3)
  {
    *(void *)(v1 + 72) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(a1);
}

BOOL AriSdk::TlvArray<unsigned char,3930ul>::assign<unsigned char *>(void *a1, char *a2, char *a3)
{
  unint64_t v4 = a3 - a2;
  if ((unint64_t)(a3 - a2) >= 0xF5B)
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/AppleInternal/Library/BuildRoots/9f16a0bb-a2ea-11ef-bacb-1e361567c031/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/local/include/ARI/ari_sdk_msg.h", "assign", a3);
    if (v9 >= 0) {
      uint64_t v6 = __p;
    }
    else {
      uint64_t v6 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Range assignment too large(%p), got(%ld) max(%ld)", v5, v6, 385, a1, v4, 3930);
    if (v9 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a1, a2, a3, a3 - a2);
  }
  return v4 < 0xF5B;
}

void sub_230AE6F24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::eUICCVinylICEValve::InitPerso(uint64_t a1, void *a2, void *a3)
{
  AriSdk::ARI_IBIVinylInitPsoReq_SDK::ARI_IBIVinylInitPsoReq_SDK((AriSdk::ARI_IBIVinylInitPsoReq_SDK *)v36);
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
  uint64_t v12 = operator new(1uLL);
  *uint64_t v12 = 0;
  unint64_t v13 = __p;
  std::string __p = v12;
  if (v13) {
    operator delete(v13);
  }
  unint64_t v14 = operator new(1uLL);
  *unint64_t v14 = 0;
  uint64_t v15 = v39;
  uint64_t v39 = v14;
  if (v15) {
    operator delete(v15);
  }
  unint64_t v16 = operator new(2uLL);
  _WORD *v16 = v7;
  uint64_t v17 = v40;
  uint64_t v40 = v16;
  if (v17) {
    operator delete(v17);
  }
  unint64_t v18 = (const void *)*a2;
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
  if (eUICC::VinylCommandDriver::InitPerso())
  {
    if (**(_DWORD **)(v35 + 72) || (unint64_t v32 = *(_WORD **)(v35 + 88), !*v32))
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v21, v22, v23, (char)"!GET_RSP_FIELD(rsp, result_t3) && GET_RSP_FIELD(rsp, sim_rsp_len_t5)");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Failed to InitPerso status %d SW1_SW2 0x%x rsp_len %u\n", v24, v25, v26, **(_DWORD **)(v35 + 72));
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
  MEMORY[0x230FC79C0](v36);
  return v27;
}

void sub_230AE71D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
}

uint64_t eUICC::eUICCVinylICEValve::AuthPerso(uint64_t a1, void *a2, void *a3)
{
  AriSdk::ARI_IBIVinylAuthPsoReq_SDK::ARI_IBIVinylAuthPsoReq_SDK((AriSdk::ARI_IBIVinylAuthPsoReq_SDK *)v36);
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
  uint64_t v12 = operator new(1uLL);
  *uint64_t v12 = 0;
  unint64_t v13 = __p;
  std::string __p = v12;
  if (v13) {
    operator delete(v13);
  }
  unint64_t v14 = operator new(1uLL);
  *unint64_t v14 = 0;
  uint64_t v15 = v39;
  uint64_t v39 = v14;
  if (v15) {
    operator delete(v15);
  }
  unint64_t v16 = operator new(2uLL);
  _WORD *v16 = v7;
  uint64_t v17 = v40;
  uint64_t v40 = v16;
  if (v17) {
    operator delete(v17);
  }
  unint64_t v18 = (const void *)*a2;
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
  if (eUICC::VinylCommandDriver::AuthPerso())
  {
    if (**(_DWORD **)(v35 + 72) || (unint64_t v32 = *(_WORD **)(v35 + 88), !*v32))
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
  MEMORY[0x230FC7980](v36);
  return v27;
}

void sub_230AE74A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
}

uint64_t eUICC::eUICCVinylICEValve::FinalizePerso(uint64_t a1, void *a2)
{
  AriSdk::ARI_IBIVinylFinalizePsoReq_SDK::ARI_IBIVinylFinalizePsoReq_SDK((AriSdk::ARI_IBIVinylFinalizePsoReq_SDK *)v34);
  uint64_t v33 = 0;
  uint64_t v4 = a2[1];
  uint64_t v5 = v4 - *a2;
  size_t v6 = (unsigned __int16)(v4 - *(_WORD *)a2);
  if (v6 >= 0xE01)
  {
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Payload too large -- payload_size: %d  max allowed: %lu)\n", v7, v8, v9, v5);
LABEL_14:
    uint64_t v26 = 18;
    goto LABEL_16;
  }
  AriSdk::Tlv<unsigned int>::operator=<int &,void>(&v35, (_DWORD *)(a1 + 292));
  uint64_t v10 = operator new(1uLL);
  unsigned char *v10 = 0;
  uint64_t v11 = __p;
  std::string __p = v10;
  if (v11) {
    operator delete(v11);
  }
  uint64_t v12 = operator new(1uLL);
  *uint64_t v12 = 0;
  unint64_t v13 = v37;
  uint64_t v37 = v12;
  if (v13) {
    operator delete(v13);
  }
  unint64_t v14 = operator new(2uLL);
  *unint64_t v14 = v5;
  uint64_t v15 = v38;
  uint64_t v38 = v14;
  if (v15) {
    operator delete(v15);
  }
  unint64_t v16 = (const void *)*a2;
  uint64_t v17 = *a2 + v6;
  uint64_t v32 = 0;
  __n128 v31 = 0uLL;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(&v31, v16, v17, v6);
  AriSdk::TlvArray<unsigned char,3584ul>::operator=((uint64_t)&v39, &v31, v18);
  if (v31.n128_u64[0])
  {
    v31.n128_u64[1] = v31.n128_u64[0];
    operator delete((void *)v31.n128_u64[0]);
  }
  if (eUICC::VinylCommandDriver::FinalizePerso())
  {
    uint64_t v19 = v33;
    if (!**(_DWORD **)(v33 + 72))
    {
      uint64_t v26 = 0;
      goto LABEL_17;
    }
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v20, v21, v22, (char)"!GET_RSP_FIELD(rsp, result_t3)");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Failed to FinalizePerso status %d SW1_SW2 0x%x\n", v23, v24, v25, **(_DWORD **)(v33 + 72));
    goto LABEL_14;
  }
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v27, v28, v29, (char)"status");
  uint64_t v26 = 11;
LABEL_16:
  uint64_t v19 = v33;
  if (v33) {
LABEL_17:
  }
    (*(void (**)(uint64_t))(*(void *)v19 + 16))(v19);
  MEMORY[0x230FC7A40](v34);
  return v26;
}

void sub_230AE7740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (__p) {
    operator delete(__p);
  }
  MEMORY[0x230FC7A40](&a18);
  _Unwind_Resume(a1);
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
  unint64_t v13 = __p;
  std::string __p = v12;
  if (v13) {
    operator delete(v13);
  }
  unint64_t v14 = operator new(2uLL);
  *unint64_t v14 = 0;
  uint64_t v15 = v39;
  uint64_t v39 = v14;
  if (v15) {
    operator delete(v15);
  }
  unint64_t v16 = operator new(2uLL);
  _WORD *v16 = v7;
  uint64_t v17 = v40;
  uint64_t v40 = v16;
  if (v17) {
    operator delete(v17);
  }
  unint64_t v18 = (const void *)*a2;
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
  MEMORY[0x230FC7A60](v36);
  return v27;
}

void sub_230AE7A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
}

void eUICC::eUICCVinylICEValve::~eUICCVinylICEValve(eUICC::VinylCommandDriver **this)
{
  *this = (eUICC::VinylCommandDriver *)&unk_26E556070;
  std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](this + 39, 0);

  eUICC::eUICCVinylValve::~eUICCVinylValve((eUICC::eUICCVinylValve *)this);
}

{
  uint64_t vars8;

  *this = (eUICC::VinylCommandDriver *)&unk_26E556070;
  std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](this + 39, 0);

  eUICC::eUICCVinylValve::~eUICCVinylValve((eUICC::eUICCVinylValve *)this);
}

{
  void *v2;
  uint64_t vars8;

  *this = (eUICC::VinylCommandDriver *)&unk_26E556070;
  std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](this + 39, 0);
  eUICC::eUICCVinylValve::~eUICCVinylValve((eUICC::eUICCVinylValve *)this);

  operator delete(v2);
}

void *std::shared_ptr<ICEARIContext>::shared_ptr[abi:ne180100]<ICEARIContext,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = operator new(0x20uLL);
  void *v4 = &unk_26E556110;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_230AE7BBC(_Unwind_Exception *exception_object)
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

void std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](eUICC::VinylCommandDriver **a1, eUICC::VinylCommandDriver *a2)
{
  int v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    eUICC::VinylCommandDriver::~VinylCommandDriver(v3);
    operator delete(v4);
  }
}

void *std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(void *result, char *__src, char *a3, unint64_t a4)
{
  uint64_t v7 = result;
  unint64_t v8 = result[2];
  uint64_t v9 = (char *)*result;
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
      std::vector<char *>::__throw_length_error[abi:ne180100]();
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
    uint64_t v9 = (char *)v7[1];
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
  unint64_t v14 = &__src[v13];
  if (v12 != v9)
  {
    uint64_t result = memmove((void *)*result, __src, v13);
    uint64_t v9 = (char *)v7[1];
  }
  if (a3 != v14) {
    uint64_t result = memmove(v9, v14, a3 - v14);
  }
  uint64_t v15 = &v9[a3 - v14];
LABEL_20:
  v7[1] = v15;
  return result;
}

void *std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>(void *result, char *__src, char *a3, unint64_t a4)
{
  uint64_t v7 = result;
  unint64_t v8 = result[2];
  uint64_t v9 = (char *)*result;
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
      std::vector<char *>::__throw_length_error[abi:ne180100]();
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
    uint64_t v9 = (char *)v7[1];
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
    unint64_t v14 = &v9[v15];
    goto LABEL_20;
  }
  size_t v13 = &__src[v12 - v9];
  if (v12 != v9)
  {
    uint64_t result = memmove((void *)*result, __src, v12 - v9);
    uint64_t v9 = (char *)v7[1];
  }
  if (a3 != v13) {
    uint64_t result = memmove(v9, v13, a3 - v13);
  }
  unint64_t v14 = &v9[a3 - v13];
LABEL_20:
  v7[1] = v14;
  return result;
}

void *std::vector<unsigned char>::__init_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(void *result, const void *a2, uint64_t a3, size_t __sz)
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

void sub_230AE7F18(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

__n128 std::vector<unsigned char>::__move_assign(uint64_t a1, __n128 *a2)
{
  uint64_t v4 = *(void **)a1;
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
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_230AD4000);
  }
  return result;
}

void *BBUCapabilities::create_default_global@<X0>(void *a1@<X8>)
{
  int v3 = operator new(4uLL);
  *int v3 = TelephonyRadiosGetProduct();

  return std::shared_ptr<BBUCapabilities>::shared_ptr[abi:ne180100]<BBUCapabilities,void>(a1, (uint64_t)v3);
}

void sub_230AE8010(_Unwind_Exception *a1)
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
  if (!(void)xmmword_26870BC08)
  {
    BBUCapabilities::create_default_global(&v7);
    long long v5 = v7;
    long long v7 = 0uLL;
    uint64_t v6 = (std::__shared_weak_count *)*((void *)&xmmword_26870BC08 + 1);
    xmmword_26870BC08 = v5;
    if (v6)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      if (*((void *)&v7 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v7 + 1));
      }
    }
  }
  int v2 = (std::__shared_weak_count *)*((void *)&xmmword_26870BC08 + 1);
  if (*((void *)&xmmword_26870BC08 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_26870BC08 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  int v3 = (BBUCapabilities *)pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  uint64_t v1 = BBUCapabilities::supportsVinylUpdate(v3);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return v1;
}

void sub_230AE811C(_Unwind_Exception *a1)
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
  void *v4 = &unk_26E556188;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_230AE8240(_Unwind_Exception *exception_object)
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

uint64_t ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  CFStringRef v2 = *(std::__shared_weak_count **)(a1 + 72);
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

uint64_t __cxx_global_var_init_1()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_230AD4000);
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
      uint64_t v9 = (eUICC::eUICCVinylICEValve *)operator new(0x138uLL);
      uint64_t result = eUICC::eUICCVinylMAVValve::eUICCVinylMAVValve((uint64_t)v9, this, v5, a3);
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = (eUICC::eUICCVinylICEValve *)operator new(0x140uLL);
    uint64_t result = eUICC::eUICCVinylICEValve::eUICCVinylICEValve(v9, this, v5, a3);
  }
  *a4 = v9;
  return result;
}

void sub_230AE8408(_Unwind_Exception *a1)
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

void sub_230AE84B8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t eUICC::getEID(uint64_t a1)
{
  uint64_t v1 = (__CFDictionary **)MEMORY[0x270FA5388](a1);
  uint64_t v34 = *MEMORY[0x263EF8340];
  (*(void (**)(void *__return_ptr))(**(void **)v2 + 8))(v32);
  if (LODWORD(v32[0]) == ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    eUICC::stringifyDataBuffer((eUICC *)((char *)v32 + 7), v3);
    gBBULogMaskGet();
    p_p = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      LOBYTE(p_p) = __p.__r_.__value_.__s.__data_[0];
    }
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylFactory", "", "EID: %s\n", v4, v5, v6, (char)p_p);
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (Mutable)
    {
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v28, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      }
      else {
        std::string v28 = __p;
      }
      unint64_t v14 = (const void *)eUICC::copyAsCFString();
      uint64_t v29 = v14;
      if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v28.__r_.__value_.__l.__data_);
      }
      CFDictionarySetValue(Mutable, @"EID", v14);
      void *v1 = Mutable;
      CFStringRef v15 = CFStringCreateWithFormat(v8, 0, @"%@", Mutable);
      CFStringRef v16 = v15;
      if (v15)
      {
        if (CFStringGetCString(v15, buffer, 0x2000, 0x8000100u))
        {
          gBBULogMaskGet();
          _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylFactory", "", "client rsp data: %s\n", v17, v18, v19, (char)buffer);
        }
        CFRelease(v16);
      }
      ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v29);
    }
    else
    {
      if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
        _BBULog(1, 6, "eUICCVinylFactory", "", "check failed: %s, %d, assertion: %s\n", v20, v21, v22, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/CommandDrivers/eUICCCommon.cpp");
      }
      if ((*(unsigned char *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1) {
        _BBULog(0, 1, "eUICCVinylFactory", "", "Failed to allocate shared info dict\n", v23, v24, v25, v27);
      }
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    if (!v33) {
      return 107;
    }
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylFactory", "", "eUICC not stuffed but that's ok!\n", v10, v11, v12, v26);
  }
  return 0;
}

void sub_230AE87F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
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
  return MEMORY[0x230FC7DB0](&v11);
}

void sub_230AE8A2C(_Unwind_Exception *a1, uint64_t a2, ...)
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
  uint64_t v4 = (BBUCapabilities *)xmmword_26870BC08;
  if (!(void)xmmword_26870BC08)
  {
    BBUCapabilities::create_default_global(v17);
    long long v5 = v17[0];
    v17[0] = 0uLL;
    char v6 = (std::__shared_weak_count *)*((void *)&xmmword_26870BC08 + 1);
    xmmword_26870BC08 = v5;
    if (v6)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      if (*((void *)&v17[0] + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v17[0] + 1));
      }
    }
    uint64_t v4 = (BBUCapabilities *)xmmword_26870BC08;
  }
  long long v7 = (std::__shared_weak_count *)*((void *)&xmmword_26870BC08 + 1);
  if (*((void *)&xmmword_26870BC08 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_26870BC08 + 1) + 8), 1uLL, memory_order_relaxed);
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

void sub_230AE8C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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
  *(_DWORD *)(a1 + 12pthread_mutex_init(this, 0) = 24;
  return a1;
}

void sub_230AE8F20(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x230FC7DB0](v1);
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

void sub_230AE8FFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
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
  MEMORY[0x230FC7DB0](a1 + 128);
  return a1;
}

uint64_t __cxx_global_var_init_2()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_230AD4000);
  }
  return result;
}

uint64_t __cxx_global_var_init_13()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_230AD4000);
  }
  return result;
}

void *VinylUpdaterCreate(const __CFDictionary *a1, void (*a2)(void *, const char *), void *a3, ACFULogging **a4)
{
  MEMORY[0x230FC7AB0](v39, @"VinylUpdaterCreate");
  CFDictionaryRef Value = CFDictionaryGetValue(a1, @"RestoreOptions");
  std::locale v8 = (const __CFDictionary **)ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(&v38, &Value);
  BBULogParseDebugArgs(v8);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v38);
  uint64_t v9 = (ACFULogging *)BBULogModuleEnabled(22);
  if (v9)
  {
    values = 0;
    long long keys = @"ACFUDebugArgs";
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    values = (void *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"logLevel=%d", 4);
    CFDictionaryRef v35 = CFDictionaryCreate(v10, (const void **)&keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFDictionaryRef Value = 0;
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&Value);
    CFMutableDictionaryRef theDict = CFDictionaryCreateMutable(v10, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFDictionaryRef Value = 0;
    uint64_t v11 = (ACFULogging *)ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(&Value);
    if (v35) {
      uint64_t v12 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
    }
    else {
      uint64_t v12 = 0;
    }
    if (v12
      && ((uint64_t v11 = theDict) != 0
        ? (size_t v13 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get)
        : (size_t v13 = 0),
          v13))
    {
      CFDictionaryAddValue(theDict, @"Options", v35);
      LogInstance = (ACFULogging *)ACFULogging::getLogInstance(v14);
      int inited = ACFULogging::initLog(LogInstance, theDict, a2, a3);
      if (values)
      {
        CFRelease(values);
        values = 0;
      }
      char v17 = 1;
    }
    else
    {
      ACFULogging::getLogInstance(v11);
      ACFULogging::handleMessage();
      int inited = 0;
      char v17 = 0;
    }
    ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&theDict);
    uint64_t v18 = (ACFULogging *)ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v35);
    if ((v17 & 1) == 0)
    {
      Instance = 0;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v21 = (ACFULogging *)ACFULogging::getLogInstance(v9);
    uint64_t v18 = (ACFULogging *)ACFULogging::initLog(v21, a1, a2, a3);
    int inited = (int)v18;
  }
  if (inited)
  {
    ACFULogging::getLogInstance(v18);
    ACFULogging::handleMessage();
    std::string::basic_string[abi:ne180100]<0>(v32, "failed to init logging");
    uint64_t v18 = (ACFULogging *)ACFUError::addError();
    Instance = 0;
    if ((v33 & 0x80000000) == 0) {
      goto LABEL_15;
    }
    uint64_t v25 = (void **)v32;
LABEL_36:
    operator delete(*v25);
    goto LABEL_15;
  }
  if (VinylUpdaterCreate::only_once != -1) {
    dispatch_once(&VinylUpdaterCreate::only_once, &__block_literal_global_0);
  }
  if (!kVinylRestoreObjTypeID)
  {
    ACFULogging::getLogInstance(v18);
    ACFULogging::handleMessage();
    std::string::basic_string[abi:ne180100]<0>(v30, "failed to create Vinyl CFRuntimeClass");
    uint64_t v18 = (ACFULogging *)ACFUError::addError();
    Instance = 0;
    if ((v31 & 0x80000000) == 0) {
      goto LABEL_15;
    }
    uint64_t v25 = (void **)v30;
    goto LABEL_36;
  }
  Instance = (void *)_CFRuntimeCreateInstance();
  if (!Instance)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    std::string::basic_string[abi:ne180100]<0>(v28, "failed to create Vinyl CFType object");
    uint64_t v18 = (ACFULogging *)ACFUError::addError();
    Instance = 0;
    if ((v29 & 0x80000000) == 0) {
      goto LABEL_15;
    }
    uint64_t v25 = (void **)v28;
    goto LABEL_36;
  }
  uint64_t v23 = VinylRestore::create(a1, v22);
  Instance[2] = v23;
  if (v23)
  {
    ACFULogging::getLogInstance(v23);
    ACFULogging::handleMessage();
    goto LABEL_26;
  }
  ACFULogging::getLogInstance(0);
  ACFULogging::handleMessage();
  std::string::basic_string[abi:ne180100]<0>(v26, "failed to get the Vinyl restore instance");
  uint64_t v18 = (ACFULogging *)ACFUError::addError();
  if (v27 < 0)
  {
    uint64_t v25 = (void **)v26;
    goto LABEL_36;
  }
LABEL_15:
  ACFULogging::getLogInstance(v18);
  ACFULogging::handleMessage();
  CFError = (ACFULogging *)ACFUError::getCFError((ACFUError *)v39);
  *a4 = CFError;
  if (Instance) {
    CFRelease(Instance);
  }
  ACFULogging::getLogInstance(CFError);
  ACFULogging::handleMessage();
  Instance = 0;
LABEL_26:
  MEMORY[0x230FC7AC0](v39);
  return Instance;
}

void sub_230AE9650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,char a37)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  MEMORY[0x230FC7AC0](v37 - 88);
  _Unwind_Resume(a1);
}

uint64_t __VinylUpdaterCreate_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  kVinylRestoreObjCFTypeID TypeID = result;
  return result;
}

uint64_t VinylRestoreObjDestroy(ACFULogging *a1)
{
  ACFULogging::getLogInstance(a1);
  uint64_t v2 = (ACFULogging *)ACFULogging::handleMessage();
  if (a1)
  {
    uint64_t v2 = (ACFULogging *)*((void *)a1 + 2);
    if (v2)
    {
      uint64_t v3 = (ACFULogging *)(*(uint64_t (**)(ACFULogging *))(*(void *)v2 + 8))(v2);
      ACFULogging::getLogInstance(v3);
      uint64_t v2 = (ACFULogging *)ACFULogging::handleMessage();
      *((void *)a1 + 2) = 0;
    }
  }
  ACFULogging::getLogInstance(v2);
  return ACFULogging::handleMessage();
}

ACFULogging *VinylRestoreObjDescribe(ACFULogging *a1)
{
  uint64_t v1 = a1;
  ACFULogging::getLogInstance(a1);
  uint64_t v2 = (ACFULogging *)ACFULogging::handleMessage();
  if (v1)
  {
    CFAllocatorRef v3 = CFGetAllocator(v1);
    CFAllocatorRef v4 = CFGetAllocator(v1);
    uint64_t v2 = (ACFULogging *)CFStringCreateWithFormat(v3, 0, @"<VinylRestoreObj %p [%p]>{}", v1, v4, "VinylRestoreObjDescribe");
    uint64_t v1 = v2;
  }
  ACFULogging::getLogInstance(v2);
  ACFULogging::handleMessage();
  return v1;
}

uint64_t VinylUpdaterExecCommand(uint64_t a1, __CFString *theString)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  CString = (ACFULogging *)CFStringGetCString(theString, buffer, 128, 0x8000100u);
  ACFULogging::getLogInstance(CString);
  long long v5 = (ACFULogging *)ACFULogging::handleMessage();
  if (a1 && *(void *)(a1 + 16))
  {
    ACFURestore::restoreCommand((ACFURestore *)theString, v6);
    uint64_t v7 = ACFURestore::executeCommand();
    if ((v7 & 1) == 0)
    {
      ACFULogging::getLogInstance((ACFULogging *)v7);
      uint64_t v7 = ACFULogging::handleMessage();
      uint64_t v8 = 0;
      goto LABEL_5;
    }
  }
  else
  {
    ACFULogging::getLogInstance(v5);
    uint64_t v7 = ACFULogging::handleMessage();
  }
  uint64_t v8 = 1;
LABEL_5:
  ACFULogging::getLogInstance((ACFULogging *)v7);
  ACFULogging::handleMessage();
  return v8;
}

uint64_t VinylUpdaterIsDone(ACFULogging *a1, void *a2)
{
  CFAllocatorRef v3 = a1;
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();
  pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  CFAllocatorRef v4 = (BBUCapabilities *)xmmword_26870BC08;
  if (!(void)xmmword_26870BC08)
  {
    BBUCapabilities::create_default_global(v16);
    long long v5 = *(_OWORD *)v16;
    v16[0] = 0;
    v16[1] = 0;
    CFStringRef v6 = (std::__shared_weak_count *)*((void *)&xmmword_26870BC08 + 1);
    xmmword_26870BC08 = v5;
    if (v6)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      if (v16[1]) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v16[1]);
      }
    }
    CFAllocatorRef v4 = (BBUCapabilities *)xmmword_26870BC08;
  }
  uint64_t v7 = (std::__shared_weak_count *)*((void *)&xmmword_26870BC08 + 1);
  if (*((void *)&xmmword_26870BC08 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_26870BC08 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  uint64_t v8 = BBUCapabilities::supportsVinylUpdate(v4);
  char v9 = (char)v8;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  if ((v9 & 1) == 0)
  {
    ACFULogging::getLogInstance(v8);
    ACFULogging::handleMessage();
    if (a2) {
      *a2 = 0;
    }
    return 1;
  }
  if (v3)
  {
    CFAllocatorRef v10 = (ACFURestore *)*((void *)v3 + 2);
    if (v10)
    {
      if (VinylRestore::updateAllowed(*((VinylRestore **)v3 + 2)))
      {
        isRestoreComplete = (ACFULogging *)ACFURestore::isRestoreComplete(v10);
        CFAllocatorRef v3 = isRestoreComplete;
        if (a2)
        {
          if (!isRestoreComplete)
          {
            *a2 = 0;
            goto LABEL_30;
          }
          ACFURestore::getErrorHandle((uint64_t *)v16, v10);
          *a2 = ACFUError::getCFError(v16[0]);
          isRestoreComplete = v16[1];
          if (v16[1]) {
            std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v16[1]);
          }
        }
        else if (!isRestoreComplete)
        {
LABEL_30:
          ACFULogging::getLogInstance(isRestoreComplete);
          ACFULogging::handleMessage();
          return (uint64_t)v3;
        }
        ACFULogging::getLogInstance(isRestoreComplete);
        isRestoreComplete = (ACFULogging *)ACFULogging::handleMessage();
        goto LABEL_30;
      }
    }
    else
    {
      uint64_t v12 = (ACFULogging *)MEMORY[0x230FC7AB0](v16, @"VinylUpdaterIsDone");
      ACFULogging::getLogInstance(v12);
      ACFULogging::handleMessage();
      std::string::basic_string[abi:ne180100]<0>(&__p, "VinylRestore object doesn't exist");
      ACFUError::addError();
      if (v15 < 0) {
        operator delete(__p);
      }
      if (a2) {
        *a2 = ACFUError::getCFError((ACFUError *)v16);
      }
      MEMORY[0x230FC7AC0](v16);
    }
    return 1;
  }
  return (uint64_t)v3;
}

void sub_230AE9C1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18, std::__shared_weak_count *a19)
{
  if (a19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a19);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __cxx_global_var_init_3()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_230AD4000);
  }
  return result;
}

FILE *vinyl_fopen_file_func(int a1, void *__buf, int a3, size_t __size)
{
  if (__buf) {
    return fmemopen(__buf, __size, "rb");
  }
  else {
    return 0;
  }
}

size_t vinyl_fread_file_func(int a1, FILE *__stream, void *__ptr, size_t __nitems)
{
  return fread(__ptr, 1uLL, __nitems, __stream);
}

size_t vinyl_fwrite_file_func(int a1, FILE *__stream, void *__ptr, size_t __nitems)
{
  return fwrite(__ptr, 1uLL, __nitems, __stream);
}

void vinyl_ftell_file_func()
{
}

uint64_t vinyl_fseek_file_func(int a1, FILE *a2, uint64_t a3, unsigned int a4)
{
  if (a4 > 2) {
    return -1;
  }
  fseek(a2, a3, a4);
  return 0;
}

uint64_t vinyl_fclose_file_func(int a1, FILE *a2)
{
  return fclose(a2);
}

uint64_t vinyl_ferror_file_func(int a1, FILE *a2)
{
  return ferror(a2);
}

FILE *(**vinyl_fill_fopen_filefunc(FILE *(**result)(int a1, void *__buf, int a3, size_t __size)))(int a1, void *__buf, int a3, size_t __size)
{
  *uint64_t result = vinyl_fopen_file_func;
  result[1] = (FILE *(*)(int, void *, int, size_t))vinyl_fread_file_func;
  result[2] = (FILE *(*)(int, void *, int, size_t))vinyl_fwrite_file_func;
  result[3] = (FILE *(*)(int, void *, int, size_t))vinyl_ftell_file_func;
  result[4] = (FILE *(*)(int, void *, int, size_t))vinyl_fseek_file_func;
  result[5] = (FILE *(*)(int, void *, int, size_t))vinyl_fclose_file_func;
  result[6] = (FILE *(*)(int, void *, int, size_t))vinyl_ferror_file_func;
  result[7] = 0;
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
      size_t v13 = "failure";
      if (v9) {
        size_t v13 = "success";
      }
      _BBULog(2, 0, "BBUICE16Communication", "", "Resetting modem: %s\n", v10, v11, v12, (char)v13);
    }
    return ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef((const void **)&Controller);
  }
  return result;
}

void sub_230AE9ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
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
    block[3] = &__block_descriptor_tmp_2;
    block[4] = a1;
    dispatch_sync(v9, block);
    uint64_t v8 = TelephonyUtilTransportFree();
    uint64_t v10 = *(NSObject **)(a1 + 40);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 0x40000000;
    void v12[2] = ___ZN21VinylICECommunication17freeTransportSyncEP26TelephonyUtilTransport_tag_block_invoke_2;
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
  uint64_t v3 = (BBUCapabilities *)xmmword_26870BC08;
  if (!(void)xmmword_26870BC08)
  {
    BBUCapabilities::create_default_global(&v10);
    long long v4 = v10;
    long long v10 = 0uLL;
    uint64_t v5 = (std::__shared_weak_count *)*((void *)&xmmword_26870BC08 + 1);
    xmmword_26870BC08 = v4;
    if (v5)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
      if (*((void *)&v10 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v10 + 1));
      }
    }
    uint64_t v3 = (BBUCapabilities *)xmmword_26870BC08;
  }
  uint64_t v6 = (std::__shared_weak_count *)*((void *)&xmmword_26870BC08 + 1);
  if (*((void *)&xmmword_26870BC08 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_26870BC08 + 1) + 8), 1uLL, memory_order_relaxed);
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

void sub_230AEA21C(_Unwind_Exception *a1)
{
}

void IceAriSetContextValid(char a1)
{
  pthread_mutex_lock(&ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance);
  uint64_t v2 = off_26870BB68;
  if (!off_26870BB68)
  {
    uint64_t v3 = operator new(0x28uLL);
    v3[32] = 0;
    std::shared_ptr<ICEARIContext>::shared_ptr[abi:ne180100]<ICEARIContext,void>(&v7, (uint64_t)v3);
    long long v4 = v7;
    long long v7 = 0uLL;
    uint64_t v5 = (std::__shared_weak_count *)*(&off_26870BB68 + 1);
    off_26870BB68 = v4;
    if (v5)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
      if (*((void *)&v7 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v7 + 1));
      }
    }
    uint64_t v2 = off_26870BB68;
  }
  uint64_t v6 = (std::__shared_weak_count *)*(&off_26870BB68 + 1);
  if (*(&off_26870BB68 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26870BB68 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance);
  *(unsigned char *)(v2 + 32) = a1;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void sub_230AEA318(_Unwind_Exception *a1)
{
}

uint64_t VinylICECommunication::createTransport(uint64_t a1, uint64_t a2)
{
  uint64_t v34 = 0;
  CFDictionaryRef v35 = &v34;
  uint64_t v36 = 0x2000000000;
  int v37 = 3;
  v32[0] = 0;
  v32[1] = v32;
  void v32[2] = 0x2000000000;
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
  unint64_t v14 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN21VinylICECommunication15createTransportEP26TelephonyUtilTransport_tag_block_invoke_2;
  block[3] = &unk_264BA2170;
  void block[6] = a1;
  void block[7] = a2;
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

void sub_230AEA604(_Unwind_Exception *a1)
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

void sub_230AEA768(_Unwind_Exception *a1)
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
  uint64_t v0 = off_26870BB68;
  if (!off_26870BB68)
  {
    uint64_t v1 = operator new(0x28uLL);
    v1[32] = 0;
    std::shared_ptr<ICEARIContext>::shared_ptr[abi:ne180100]<ICEARIContext,void>(&v7, (uint64_t)v1);
    long long v2 = v7;
    long long v7 = 0uLL;
    uint64_t v3 = (std::__shared_weak_count *)*(&off_26870BB68 + 1);
    off_26870BB68 = v2;
    if (v3)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
      if (*((void *)&v7 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v7 + 1));
      }
    }
    uint64_t v0 = off_26870BB68;
  }
  uint64_t v4 = (std::__shared_weak_count *)*(&off_26870BB68 + 1);
  if (*(&off_26870BB68 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26870BB68 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance);
  int v5 = *(unsigned __int8 *)(v0 + 32);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return v5 != 0;
}

void sub_230AEA880(_Unwind_Exception *a1)
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
  block[3] = &unk_264BA2198;
  block[4] = &v11;
  void block[5] = a1;
  void block[6] = a2;
  dispatch_sync(v7, block);
  uint64_t v8 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

void sub_230AEA9C8(_Unwind_Exception *a1)
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

  *(void *)this = &unk_26E556280;
  long long v2 = *((void *)this + 5);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *((void *)this + 4);
  if (v3) {
    dispatch_release(v3);
  }

  eUICC::eUICCVinylValve::~eUICCVinylValve(this);
}

uint64_t __cxx_global_var_init_4()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_230AD4000);
  }
  return result;
}

uint64_t __cxx_global_var_init_21()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_230AD4000);
  }
  return result;
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
  v16[6] = xmmword_230B06A40;
  v16[7] = unk_230B06A50;
  v16[8] = xmmword_230B06A60;
  v16[2] = xmmword_230B06A00;
  v16[3] = unk_230B06A10;
  v16[4] = xmmword_230B06A20;
  v16[5] = unk_230B06A30;
  v16[0] = xmmword_230B069E0;
  v16[1] = unk_230B069F0;
  v14[6] = xmmword_230B06AD0;
  v14[7] = unk_230B06AE0;
  v14[8] = xmmword_230B06AF0;
  v14[9] = unk_230B06B00;
  v14[2] = xmmword_230B06A90;
  v14[3] = unk_230B06AA0;
  v14[4] = xmmword_230B06AB0;
  v14[5] = unk_230B06AC0;
  v14[0] = xmmword_230B06A70;
  v14[1] = unk_230B06A80;
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
        long long v7 = *(uint64_t **)(a3 + 16);
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
      std::vector<char *>::__throw_length_error[abi:ne180100]();
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

uint64_t _BBUException::_BBUException(uint64_t a1, int a2, char *a3, unsigned int a4, ctu::LogMessageBuffer *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  *(void *)a1 = &unk_26E5562D8;
  *(_DWORD *)(a1 + 52pthread_mutex_init(this, 0) = a2;
  _BBUException::constructCommon(a1, a2, a3, a4, a5, &a9);
  return a1;
}

{
  *(void *)a1 = &unk_26E5562D8;
  *(_DWORD *)(a1 + 52pthread_mutex_init(this, 0) = a2;
  _BBUException::constructCommon(a1, a2, a3, a4, a5, &a9);
  return a1;
}

void sub_230AEB110(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void _BBUException::constructCommon(uint64_t a1, int a2, char *a3, unsigned int a4, ctu::LogMessageBuffer *this, char *a6)
{
  ctu::LogMessageBuffer::vCreateWithFormat((uint64_t *)&v40, this, a6, a3);
  uint64_t v10 = MEMORY[0x230FC76E0](&v40);
  long long v11 = *(_OWORD *)v10;
  v42.__r_.__value_.__r.__words[2] = *(void *)(v10 + 16);
  *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v11;
  *(void *)(v10 + 8) = 0;
  *(void *)(v10 + 16) = 0;
  *(void *)uint64_t v10 = 0;
  MEMORY[0x230FC7700](&v40);
  std::string::basic_string[abi:ne180100]<0>(&v35, " ");
  uint64_t v12 = BBUReturnAsString(a2);
  unint64_t v13 = std::string::append(&v35, v12);
  long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  v36.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  char v15 = std::string::append(&v36, "@");
  long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  v37.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v16;
  v15->__r_.__value_.__l.__size_ = 0;
  v15->__r_.__value_.__r.__words[2] = 0;
  v15->__r_.__value_.__r.__words[0] = 0;
  ctu::llvm::StringRef::StringRef((ctu::llvm::StringRef *)&v32, a3);
  ctu::basename();
  if ((v34 & 0x80u) == 0) {
    uint64_t v17 = __p;
  }
  else {
    uint64_t v17 = (void **)__p[0];
  }
  if ((v34 & 0x80u) == 0) {
    std::string::size_type v18 = v34;
  }
  else {
    std::string::size_type v18 = (std::string::size_type)__p[1];
  }
  long long v19 = std::string::append(&v37, (const std::string::value_type *)v17, v18);
  long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  long long v21 = std::string::append(&v38, ":");
  long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  v39.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v39.__r_.__value_.__l.__data_ = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&v31, a4);
  if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    long long v23 = &v31;
  }
  else {
    long long v23 = (std::string *)v31.__r_.__value_.__r.__words[0];
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
    long long v27 = (const std::string::value_type *)&v40;
  }
  else {
    long long v27 = (const std::string::value_type *)v40;
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
  *(_OWORD *)(v29 + 48pthread_mutex_init(this, 0) = 0u;
  *(_OWORD *)(v29 + 496) = 0u;
  *(_OWORD *)(v29 + 448) = 0u;
  *(_OWORD *)(v29 + 464) = 0u;
  *(_OWORD *)(v29 + 416) = 0u;
  *(_OWORD *)(v29 + 432) = 0u;
  *(_OWORD *)(v29 + 384) = 0u;
  *(_OWORD *)(v29 + 40pthread_mutex_init(this, 0) = 0u;
  *(_OWORD *)(v29 + 352) = 0u;
  *(_OWORD *)(v29 + 368) = 0u;
  *(_OWORD *)(v29 + 32pthread_mutex_init(this, 0) = 0u;
  *(_OWORD *)(v29 + 336) = 0u;
  *(_OWORD *)(v29 + 288) = 0u;
  *(_OWORD *)(v29 + 304) = 0u;
  *(_OWORD *)(v29 + 256) = 0u;
  *(_OWORD *)(v29 + 272) = 0u;
  *(_OWORD *)(v29 + 224) = 0u;
  *(_OWORD *)(v29 + 24pthread_mutex_init(this, 0) = 0u;
  *(_OWORD *)(v29 + 192) = 0u;
  *(_OWORD *)(v29 + 208) = 0u;
  *(_OWORD *)(v29 + 16pthread_mutex_init(this, 0) = 0u;
  *(_OWORD *)(v29 + 176) = 0u;
  *(_OWORD *)(v29 + 128) = 0u;
  *(_OWORD *)(v29 + 144) = 0u;
  *(_OWORD *)(v29 + 96) = 0u;
  *(_OWORD *)(v29 + 112) = 0u;
  *(_OWORD *)(v29 + 64) = 0u;
  *(_OWORD *)(v29 + 8pthread_mutex_init(this, 0) = 0u;
  *(_OWORD *)(v29 + 32) = 0u;
  *(_OWORD *)(v29 + 48) = 0u;
  long long v30 = &v42;
  if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    long long v30 = (std::string *)v42.__r_.__value_.__r.__words[0];
  }
  *(_OWORD *)(v29 + 16) = 0uLL;
  snprintf((char *)v29, 0x200uLL, "%s\n", (const char *)v30);
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v42.__r_.__value_.__l.__data_);
  }
}

void sub_230AEB3F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,void *a44,uint64_t a45,int a46,__int16 a47,char a48,char a49)
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

void sub_230AEB53C(_Unwind_Exception *a1)
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
  *(void *)this = &unk_26E5562D8;
  strncpy((char *)this + 8, (const char *)a2 + 8, 0x200uLL);
  *((_DWORD *)this + 13pthread_mutex_init(this, 0) = *((_DWORD *)a2 + 130);
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
  unint64_t v6 = v30;
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
    char v15 = v30;
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
    long long v21 = v30;
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

void sub_230AEB918(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v25 - 49) < 0) {
    operator delete(*(void **)(v25 - 72));
  }
  _Unwind_Resume(exception_object);
}

uint64_t vinyl_unzStringFileNameCompare(const char *a1, const char *a2, int a3)
{
  if (a3 == 1) {
    return strcmp(a1, a2);
  }
  while (1)
  {
    int v5 = *(unsigned __int8 *)a1++;
    int v4 = v5;
    int v7 = *(unsigned __int8 *)a2++;
    int v6 = v7;
    if ((v4 - 97) < 0x1A) {
      LOBYTE(v4) = v4 - 32;
    }
    if ((v6 - 97) < 0x1A) {
      LOBYTE(v6) = v6 - 32;
    }
    if (!(_BYTE)v4) {
      break;
    }
    if (!(_BYTE)v6) {
      return 1;
    }
    if ((char)v4 < (char)v6) {
      return 0xFFFFFFFFLL;
    }
    if ((char)v4 > (char)v6) {
      return 1;
    }
  }
  if ((_BYTE)v6) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

void *vinyl_unzOpen2(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  memset(__src, 0, 336);
  if (a2)
  {
    long long v5 = a2[1];
    __src[0] = *a2;
    __src[1] = v5;
    long long v6 = a2[3];
    __src[2] = a2[2];
    __src[3] = v6;
    uint64_t v7 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))&__src[0])(*((void *)&v6 + 1), a1, 5, a3);
  }
  else
  {
    vinyl_fill_fopen_filefunc((FILE *(**)(int, void *, int, size_t))__src);
    uint64_t v7 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))&__src[0])(*((void *)&__src[3] + 1), a1, 5, a3);
  }
  uint64_t v8 = (void *)v7;
  *(void *)&__src[4] = v7;
  if (v7)
  {
    if (!(*(uint64_t (**)(void, uint64_t, void, uint64_t))&__src[2])(*((void *)&__src[3] + 1), v7, 0, 2))
    {
      unint64_t v9 = (*((uint64_t (**)(void, void *))&__src[1] + 1))(*((void *)&__src[3] + 1), v8);
      unint64_t v10 = v9;
      unint64_t v11 = v9 >= 0xFFFF ? 0xFFFFLL : v9;
      uint64_t v12 = (char *)malloc(0x404uLL);
      if (v12)
      {
        uint64_t v13 = v12;
        if (v11 >= 5)
        {
          uint64_t v14 = v12 + 1;
          uint64_t v15 = 4;
          do
          {
            unint64_t v16 = v15 + 1024;
            unint64_t v17 = v15 + 1024 >= v11 ? v11 : v15 + 1024;
            unint64_t v18 = v17 >= 0x404 ? 1028 : v17;
            if ((*(uint64_t (**)(void, void *, unint64_t, void))&__src[2])(*((void *)&__src[3] + 1), v8, v10 - v17, 0)|| (*((uint64_t (**)(void, void *, unsigned char *, unint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), v8, v13, v18) != v18)
            {
              break;
            }
            if (v18 >= 4)
            {
              uint64_t v19 = (v18 - 4);
              while (v13[v19] != 80 || v14[v19] != 75 || v14[v19 + 1] != 5 || v14[v19 + 2] != 6)
              {
                if (v19-- <= 0) {
                  goto LABEL_28;
                }
              }
              if (v10 - v17 + v19)
              {
                free(v13);
                unint64_t v21 = v15 + 1024;
                if (v10 < v15 + 1024) {
                  unint64_t v21 = v10;
                }
                if (v21 >= 0xFFFF) {
                  unint64_t v21 = 0xFFFFLL;
                }
                unint64_t v22 = v10 - v21 + v19;
                int v37 = 1;
                goto LABEL_38;
              }
            }
LABEL_28:
            uint64_t v15 = v17;
          }
          while (v11 > v16);
        }
        free(v13);
      }
    }
    unint64_t v22 = 0;
    int v37 = 0;
LABEL_38:
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    uint64_t v38 = 0;
    uint64_t v33 = (*(uint64_t (**)(void, void, unint64_t, void))&__src[2])(*((void *)&__src[3] + 1), *(void *)&__src[4], v22, 0);
    int Long = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], &v41);
    int Short = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v40);
    int v36 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v39);
    int v23 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], (void *)&__src[4] + 1);
    int v24 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v38);
    uint64_t v26 = v38;
    uint64_t v25 = v39;
    uint64_t v27 = v40;
    uint64_t v28 = *((void *)&__src[4] + 1);
    int v29 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], (uint64_t *)&__src[8]);
    int v30 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], (uint64_t *)&__src[8] + 1);
    int v31 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &__src[5]);
    if (v22 < *(void *)&__src[8] + *((void *)&__src[8] + 1)
      || v31
      || v30
      || v29
      || v26 != v28
      || v25
      || v27
      || !v37
      || v24
      || v23
      || v36
      || Short
      || Long
      || v33)
    {
      (*((void (**)(void, void))&__src[2] + 1))(*((void *)&__src[3] + 1), *(void *)&__src[4]);
      return 0;
    }
    else
    {
      *((void *)&__src[5] + 1) = v22 - (*(void *)&__src[8] + *((void *)&__src[8] + 1));
      *((void *)&__src[7] + 1) = v22;
      *(void *)&__src[18] = 0;
      DWORD2(__src[18]) = 0;
      uint64_t v8 = malloc(0x150uLL);
      memcpy(v8, __src, 0x150uLL);
      vinyl_unzGoToFirstFile(v8);
    }
  }
  return v8;
}

uint64_t unzlocal_getLong(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  int v11 = 0;
  if (unzlocal_getByte(a1, a2, &v11)
    || (uint64_t v6 = v11, unzlocal_getByte(a1, a2, &v11))
    || (uint64_t v7 = v11, unzlocal_getByte(a1, a2, &v11)))
  {
    uint64_t v8 = 0;
    uint64_t result = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v10 = v6 + (v7 << 8) + ((uint64_t)v11 << 16);
    uint64_t result = unzlocal_getByte(a1, a2, &v11);
    uint64_t v8 = v10 + ((uint64_t)v11 << 24);
    if (result) {
      uint64_t v8 = 0;
    }
  }
  *a3 = v8;
  return result;
}

uint64_t unzlocal_getShort(uint64_t a1, uint64_t a2, void *a3)
{
  int v9 = 0;
  if (unzlocal_getByte(a1, a2, &v9))
  {
    uint64_t v6 = 0;
    uint64_t result = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v8 = v9;
    uint64_t result = unzlocal_getByte(a1, a2, &v9);
    uint64_t v6 = v8 + ((uint64_t)v9 << 8);
    if (result) {
      uint64_t v6 = 0;
    }
  }
  *a3 = v6;
  return result;
}

uint64_t vinyl_unzGoToFirstFile(void *a1)
{
  if (!a1) {
    return 4294967194;
  }
  uint64_t v2 = a1[17];
  a1[12] = 0;
  a1[13] = v2;
  uint64_t result = unzlocal_GetCurrentFileInfoInternal((uint64_t)a1, (uint64_t)(a1 + 18), a1 + 35, 0, 0, 0, 0, 0, 0);
  a1[14] = result == 0;
  return result;
}

void *vinyl_unzOpen(uint64_t a1, uint64_t a2)
{
  return vinyl_unzOpen2(a1, 0, a2);
}

uint64_t vinyl_unzClose(uint64_t a1)
{
  if (!a1) {
    return 4294967194;
  }
  if (*(void *)(a1 + 288)) {
    vinyl_unzCloseCurrentFile(a1);
  }
  (*(void (**)(void, void))(a1 + 40))(*(void *)(a1 + 56), *(void *)(a1 + 64));
  free((void *)a1);
  return 0;
}

uint64_t vinyl_unzCloseCurrentFile(uint64_t a1)
{
  if (!a1) {
    return 4294967194;
  }
  uint64_t v2 = *(void *)(a1 + 288);
  if (!v2) {
    return 4294967194;
  }
  if (*(void *)(v2 + 184) || *(_DWORD *)(v2 + 280))
  {
    uint64_t v3 = 0;
  }
  else if (*(void *)(v2 + 160) == *(void *)(v2 + 168))
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = 4294967191;
  }
  if (*(void *)v2) {
    free(*(void **)v2);
  }
  *(void *)uint64_t v2 = 0;
  if (*(void *)(v2 + 128)) {
    inflateEnd((z_streamp)(v2 + 8));
  }
  free((void *)v2);
  *(void *)(a1 + 288) = 0;
  return v3;
}

uint64_t vinyl_unzGetGlobalInfo(uint64_t a1, _OWORD *a2)
{
  if (!a1) {
    return 4294967194;
  }
  uint64_t result = 0;
  *a2 = *(_OWORD *)(a1 + 72);
  return result;
}

uint64_t vinyl_unzGetCurrentFileInfo(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8)
{
  return unzlocal_GetCurrentFileInfoInternal(a1, a2, 0, a3, a4, a5, a6, a7, a8);
}

uint64_t unzlocal_GetCurrentFileInfoInternal(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9)
{
  if (!a1) {
    return 4294967194;
  }
  if ((*(uint64_t (**)(void, void, void, void))(a1 + 32))(*(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 88) + *(void *)(a1 + 104), 0)|| (uint64_t v54 = 0, unzlocal_getLong(a1, *(void *)(a1 + 64), &v54)))
  {
    int v10 = -1;
  }
  else if (v54 == 33639248)
  {
    int v10 = 0;
  }
  else
  {
    int v10 = -103;
  }
  unsigned int v50 = v10;
  uint64_t v64 = 0;
  long long v62 = 0u;
  int8x16_t v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v55 = 0;
  int Short = unzlocal_getShort(a1, *(void *)(a1 + 64), &v56);
  int v48 = unzlocal_getShort(a1, *(void *)(a1 + 64), (void *)&v56 + 1);
  int v47 = unzlocal_getShort(a1, *(void *)(a1 + 64), &v57);
  int v46 = unzlocal_getShort(a1, *(void *)(a1 + 64), (void *)&v57 + 1);
  int Long = unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v58);
  LODWORD(v64) = ((v58 >> 21) & 0xF) - 1;
  HIDWORD(v64) = (v58 >> 25) + 1980;
  v11.i32[0] = v58;
  int8x16_t v12 = (int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v58), (uint32x4_t)xmmword_230B06B50);
  v12.i32[0] = vshlq_u32(v11, (uint32x4_t)xmmword_230B06B40).u32[0];
  int8x16_t v63 = vandq_s8(v12, (int8x16_t)xmmword_230B06B60);
  int v13 = unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v58 + 1);
  int v14 = unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v59);
  int v15 = unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v59 + 1);
  int v16 = unzlocal_getShort(a1, *(void *)(a1 + 64), &v60);
  int v17 = unzlocal_getShort(a1, *(void *)(a1 + 64), (void *)&v60 + 1);
  int v18 = unzlocal_getShort(a1, *(void *)(a1 + 64), &v61);
  int v19 = unzlocal_getShort(a1, *(void *)(a1 + 64), (void *)&v61 + 1);
  int v20 = unzlocal_getShort(a1, *(void *)(a1 + 64), &v62);
  int v21 = unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v62 + 1);
  if (unzlocal_getLong(a1, *(void *)(a1 + 64), &v55) | v21 | v20 | v19 | v18 | v17 | v16 | v15 | v14 | v13 | Long | v46 | v47 | v48 | Short) {
    uint64_t v22 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v22 = v50;
  }
  unint64_t v23 = v60;
  if (a4)
  {
    unint64_t v25 = a7;
    uint64_t v24 = a6;
    if (v22)
    {
      uint64_t v28 = a2;
      uint64_t v27 = a3;
      uint64_t v29 = a8;
    }
    else
    {
      unint64_t v26 = a5;
      if ((unint64_t)v60 < a5)
      {
        *(unsigned char *)(a4 + v6pthread_mutex_init(this, 0) = 0;
        unint64_t v26 = v23;
      }
      uint64_t v22 = 0;
      if (a5)
      {
        uint64_t v28 = a2;
        uint64_t v27 = a3;
        uint64_t v29 = a8;
        if (v23)
        {
          if ((*(uint64_t (**)(void, void))(a1 + 8))(*(void *)(a1 + 56), *(void *)(a1 + 64)) == v26) {
            uint64_t v22 = 0;
          }
          else {
            uint64_t v22 = 0xFFFFFFFFLL;
          }
        }
      }
      else
      {
        uint64_t v28 = a2;
        uint64_t v27 = a3;
        uint64_t v29 = a8;
      }
      v23 -= v26;
    }
  }
  else
  {
    uint64_t v28 = a2;
    uint64_t v27 = a3;
    uint64_t v29 = a8;
    unint64_t v25 = a7;
    uint64_t v24 = a6;
  }
  uint64_t v30 = *((void *)&v60 + 1);
  if (!v24 || v22)
  {
    unint64_t v33 = *((void *)&v60 + 1) + v23;
    if (!v29) {
      goto LABEL_60;
    }
    goto LABEL_46;
  }
  if (*((void *)&v60 + 1) >= v25) {
    unint64_t v31 = v25;
  }
  else {
    unint64_t v31 = *((void *)&v60 + 1);
  }
  if (!v23)
  {
    uint64_t v22 = 0;
    if (!v25) {
      goto LABEL_45;
    }
    goto LABEL_41;
  }
  uint64_t v32 = (*(uint64_t (**)(void, void, unint64_t, uint64_t))(a1 + 32))(*(void *)(a1 + 56), *(void *)(a1 + 64), v23, 1);
  if (v32) {
    uint64_t v22 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v22 = 0;
  }
  if (!v32) {
    unint64_t v23 = 0;
  }
  if (v25)
  {
LABEL_41:
    if (v30)
    {
      if ((*(uint64_t (**)(void, void, uint64_t, unint64_t))(a1 + 8))(*(void *)(a1 + 56), *(void *)(a1 + 64), v24, v31) == v31)uint64_t v22 = v22; {
      else
      }
        uint64_t v22 = 0xFFFFFFFFLL;
    }
  }
LABEL_45:
  unint64_t v33 = v30 - v31 + v23;
  if (!v29) {
    goto LABEL_60;
  }
LABEL_46:
  if (!v22)
  {
    unint64_t v34 = v61;
    unint64_t v35 = a9;
    if ((unint64_t)v61 < a9)
    {
      *(unsigned char *)(v29 + v61) = 0;
      unint64_t v35 = v34;
    }
    if (v33)
    {
      if ((*(uint64_t (**)(void, void, unint64_t, uint64_t))(a1 + 32))(*(void *)(a1 + 56), *(void *)(a1 + 64), v33, 1))
      {
        uint64_t v22 = 0xFFFFFFFFLL;
      }
      else
      {
        uint64_t v22 = 0;
      }
      if (!a9) {
        goto LABEL_60;
      }
LABEL_56:
      if (v34)
      {
        if ((*(uint64_t (**)(void, void, uint64_t, unint64_t))(a1 + 8))(*(void *)(a1 + 56), *(void *)(a1 + 64), v29, v35) == v35)uint64_t v22 = v22; {
        else
        }
          uint64_t v22 = 0xFFFFFFFFLL;
      }
      goto LABEL_60;
    }
    uint64_t v22 = 0;
    if (a9) {
      goto LABEL_56;
    }
  }
LABEL_60:
  if (v28 && !v22)
  {
    int8x16_t v36 = v63;
    *(_OWORD *)(v28 + 96) = v62;
    *(int8x16_t *)(v28 + 112) = v36;
    *(void *)(v28 + 128) = v64;
    long long v37 = v59;
    *(_OWORD *)(v28 + 32) = v58;
    *(_OWORD *)(v28 + 48) = v37;
    long long v38 = v61;
    *(_OWORD *)(v28 + 64) = v60;
    *(_OWORD *)(v28 + 8pthread_mutex_init(this, 0) = v38;
    long long v39 = v57;
    *(_OWORD *)uint64_t v28 = v56;
    *(_OWORD *)(v28 + 16) = v39;
  }
  if (v27 && !v22) {
    void *v27 = v55;
  }
  return v22;
}

uint64_t vinyl_unzGoToNextFile(void *a1)
{
  if (!a1) {
    return 4294967194;
  }
  if (!a1[14]) {
    return 4294967196;
  }
  uint64_t v2 = a1[9];
  uint64_t v3 = a1[12] + 1;
  if (v2 != 0xFFFF && v3 == v2) {
    return 4294967196;
  }
  uint64_t v5 = a1[26] + a1[27] + a1[28] + a1[13] + 46;
  a1[12] = v3;
  a1[13] = v5;
  uint64_t result = unzlocal_GetCurrentFileInfoInternal((uint64_t)a1, (uint64_t)(a1 + 18), a1 + 35, 0, 0, 0, 0, 0, 0);
  a1[14] = result == 0;
  return result;
}

uint64_t vinyl_unzLocateFile(uint64_t a1, char *__s, int a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!a1 || strlen(__s) > 0xFF) {
    return 4294967194;
  }
  if (!*(void *)(a1 + 112)) {
    return 4294967196;
  }
  uint64_t v7 = *(void *)(a1 + 96);
  uint64_t v8 = *(void *)(a1 + 104);
  long long v17 = *(_OWORD *)(a1 + 240);
  long long v18 = *(_OWORD *)(a1 + 256);
  uint64_t v9 = *(void *)(a1 + 280);
  uint64_t v19 = *(void *)(a1 + 272);
  long long v13 = *(_OWORD *)(a1 + 176);
  long long v14 = *(_OWORD *)(a1 + 192);
  long long v15 = *(_OWORD *)(a1 + 208);
  long long v16 = *(_OWORD *)(a1 + 224);
  long long v11 = *(_OWORD *)(a1 + 144);
  long long v12 = *(_OWORD *)(a1 + 160);
  uint64_t v10 = *(void *)(a1 + 136);
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = v10;
  uint64_t result = unzlocal_GetCurrentFileInfoInternal(a1, a1 + 144, (void *)(a1 + 280), 0, 0, 0, 0, 0, 0);
  for (*(void *)(a1 + 112) = result == 0; !result; uint64_t result = vinyl_unzGoToNextFile((void *)a1))
  {
    uint64_t result = unzlocal_GetCurrentFileInfoInternal(a1, 0, 0, (uint64_t)v20, 0x100uLL, 0, 0, 0, 0);
    if (result) {
      break;
    }
    uint64_t result = vinyl_unzStringFileNameCompare(v20, __s, a3);
    if (!result) {
      return result;
    }
  }
  *(void *)(a1 + 96) = v7;
  *(void *)(a1 + 104) = v8;
  *(_OWORD *)(a1 + 24pthread_mutex_init(this, 0) = v17;
  *(_OWORD *)(a1 + 256) = v18;
  *(void *)(a1 + 272) = v19;
  *(_OWORD *)(a1 + 176) = v13;
  *(_OWORD *)(a1 + 192) = v14;
  *(_OWORD *)(a1 + 208) = v15;
  *(_OWORD *)(a1 + 224) = v16;
  *(_OWORD *)(a1 + 144) = v11;
  *(_OWORD *)(a1 + 16pthread_mutex_init(this, 0) = v12;
  *(void *)(a1 + 28pthread_mutex_init(this, 0) = v9;
  return result;
}

uint64_t vinyl_unzGetFilePos(int8x16_t *a1, int8x16_t *a2)
{
  uint64_t result = 4294967194;
  if (a1 && a2)
  {
    if (a1[7].i64[0])
    {
      uint64_t result = 0;
      *a2 = vextq_s8(a1[6], a1[6], 8uLL);
    }
    else
    {
      return 4294967196;
    }
  }
  return result;
}

uint64_t vinyl_unzGoToFilePos(int8x16_t *a1, int8x16_t *a2)
{
  uint64_t result = 4294967194;
  if (a1)
  {
    if (a2)
    {
      a1[6] = vextq_s8(*a2, *a2, 8uLL);
      uint64_t result = unzlocal_GetCurrentFileInfoInternal((uint64_t)a1, (uint64_t)a1[9].i64, &a1[17].i64[1], 0, 0, 0, 0, 0, 0);
      a1[7].i64[0] = result == 0;
    }
  }
  return result;
}

uint64_t vinyl_unzOpenCurrentFile3(uint64_t a1, _DWORD *a2, int *a3, int a4, unsigned char *a5)
{
  v51[2] = *MEMORY[0x263EF8340];
  if (!a1 || !*(void *)(a1 + 112)) {
    return 4294967194;
  }
  if (*(void *)(a1 + 288)) {
    vinyl_unzCloseCurrentFile(a1);
  }
  if ((*(uint64_t (**)(void, void, void, void))(a1 + 32))(*(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 88) + *(void *)(a1 + 280), 0))
  {
    return 4294967193;
  }
  uint64_t v50 = 0;
  v51[0] = 0;
  uint64_t v49 = 0;
  int Long = unzlocal_getLong(a1, *(void *)(a1 + 64), v51);
  uint64_t v11 = v51[0];
  int Short = unzlocal_getShort(a1, *(void *)(a1 + 64), &v50);
  int v13 = unzlocal_getShort(a1, *(void *)(a1 + 64), &v49);
  if (unzlocal_getShort(a1, *(void *)(a1 + 64), &v50))
  {
    int v14 = -1;
  }
  else
  {
    if (v11 == 67324752) {
      int v18 = 0;
    }
    else {
      int v18 = -103;
    }
    int v19 = v13 | Short | Long;
    if (v19) {
      int v14 = -1;
    }
    else {
      int v14 = v18;
    }
    if (!v19 && v11 == 67324752)
    {
      int v14 = -103;
      if (v50 == *(void *)(a1 + 168))
      {
        if ((v50 & 0xFFFFFFFFFFFFFFF7) != 0) {
          int v14 = -103;
        }
        else {
          int v14 = 0;
        }
      }
    }
  }
  int v15 = unzlocal_getLong(a1, *(void *)(a1 + 64), &v50);
  if (unzlocal_getLong(a1, *(void *)(a1 + 64), &v50))
  {
    int v16 = -1;
  }
  else
  {
    if (v15) {
      int v16 = -1;
    }
    else {
      int v16 = v14;
    }
    if (!v16)
    {
      if (v50 == *(void *)(a1 + 184))
      {
        int v16 = 0;
      }
      else if ((v49 & 8) != 0)
      {
        int v16 = 0;
      }
      else
      {
        int v16 = -103;
      }
    }
  }
  if (unzlocal_getLong(a1, *(void *)(a1 + 64), &v50))
  {
    int v16 = -1;
  }
  else if (!v16)
  {
    if (v50 == *(void *)(a1 + 192))
    {
      int v16 = 0;
    }
    else if ((v49 & 8) != 0)
    {
      int v16 = 0;
    }
    else
    {
      int v16 = -103;
    }
  }
  if (unzlocal_getLong(a1, *(void *)(a1 + 64), &v50))
  {
    int v16 = -1;
  }
  else if (!v16)
  {
    if (v50 == *(void *)(a1 + 200))
    {
      int v16 = 0;
    }
    else if ((v49 & 8) != 0)
    {
      int v16 = 0;
    }
    else
    {
      int v16 = -103;
    }
  }
  uint64_t v48 = 0;
  if (unzlocal_getShort(a1, *(void *)(a1 + 64), &v48))
  {
    int v16 = -1;
    uint64_t v20 = v48;
  }
  else
  {
    uint64_t v20 = v48;
    if (!v16)
    {
      if (v48 == *(void *)(a1 + 208)) {
        int v16 = 0;
      }
      else {
        int v16 = -103;
      }
    }
  }
  uint64_t v47 = 0;
  if (unzlocal_getShort(a1, *(void *)(a1 + 64), &v47) || v16) {
    return 4294967193;
  }
  uint64_t v22 = *(void *)(a1 + 280);
  int v23 = v47;
  uint64_t v24 = (char *)malloc(0x120uLL);
  if (!v24) {
    return 4294967192;
  }
  unint64_t v25 = v24;
  unint64_t v26 = malloc(0x4000uLL);
  *(void *)unint64_t v25 = v26;
  *((void *)v25 + 17) = v20 + v22 + 30;
  *((_DWORD *)v25 + 36) = v23;
  *((void *)v25 + 19) = 0;
  *((_DWORD *)v25 + 7pthread_mutex_init(this, 0) = a4;
  if (!v26)
  {
    free(v25);
    return 4294967192;
  }
  *((void *)v25 + 16) = 0;
  if (a2) {
    *a2 = *(void *)(a1 + 168);
  }
  if (a3)
  {
    *a3 = 6;
    uint64_t v27 = *(void *)(a1 + 160) & 6;
    switch(v27)
    {
      case 2:
        int v28 = 9;
        break;
      case 6:
        int v28 = 1;
        break;
      case 4:
        int v28 = 2;
        break;
      default:
        goto LABEL_71;
    }
    *a3 = v28;
  }
LABEL_71:
  uint64_t v29 = *(void *)(a1 + 184);
  *((void *)v25 + 2pthread_mutex_init(this, 0) = 0;
  *((void *)v25 + 21) = v29;
  uint64_t v30 = *(void *)(a1 + 168);
  *((void *)v25 + 32) = *(void *)(a1 + 64);
  *((void *)v25 + 33) = v30;
  long long v31 = *(_OWORD *)(a1 + 16);
  *((_OWORD *)v25 + 12) = *(_OWORD *)a1;
  *((_OWORD *)v25 + 13) = v31;
  long long v32 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v25 + 14) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v25 + 15) = v32;
  *((void *)v25 + 34) = *(void *)(a1 + 88);
  *((void *)v25 + 6) = 0;
  if (!a4 && v30 == 8)
  {
    *((void *)v25 + 1) = 0;
    *((_DWORD *)v25 + 4) = 0;
    *((void *)v25 + 1pthread_mutex_init(this, 0) = 0;
    *((void *)v25 + 11) = 0;
    *((void *)v25 + 9) = 0;
    uint64_t v33 = inflateInit2_((z_streamp)(v25 + 8), -15, "1.2.12", 112);
    if (v33)
    {
      uint64_t v17 = v33;
      free(v25);
      return v17;
    }
    *((void *)v25 + 16) = 1;
    uint64_t v22 = *(void *)(a1 + 280);
  }
  *((_OWORD *)v25 + 11) = *(_OWORD *)(a1 + 192);
  *((void *)v25 + 15) = v22 + (v23 + v20) + 30;
  *((_DWORD *)v25 + 4) = 0;
  *(void *)(a1 + 288) = v25;
  if (!a5) {
    return 0;
  }
  unint64_t v34 = 878082192;
  crc_table = get_crc_table();
  *(_OWORD *)(a1 + 304) = xmmword_230B06B70;
  *(void *)(a1 + 32pthread_mutex_init(this, 0) = 878082192;
  *(void *)(a1 + 328) = crc_table;
  int v36 = *a5;
  if (*a5)
  {
    long long v37 = a5 + 1;
    unint64_t v38 = 305419896;
    uint64_t v39 = 591751049;
    do
    {
      unint64_t v38 = crc_table[v36 ^ v38] ^ (v38 >> 8);
      uint64_t v39 = 134775813 * (v39 + v38) + 1;
      *(void *)(a1 + 304) = v38;
      *(void *)(a1 + 312) = v39;
      unint64_t v34 = crc_table[(v34 ^ BYTE3(v39))] ^ (v34 >> 8);
      *(void *)(a1 + 32pthread_mutex_init(this, 0) = v34;
      int v40 = *v37++;
      int v36 = v40;
    }
    while (v40);
  }
  if ((*(uint64_t (**)(void, void, void, void))(a1 + 32))(*(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(*(void *)(a1 + 288) + 272) + *(void *)(*(void *)(a1 + 288) + 120), 0)|| (unint64_t)(*(uint64_t (**)(void, void, uint64_t *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), *(void *)(a1 + 64), v51, 12) < 0xC)
  {
    return 4294967192;
  }
  uint64_t v41 = 0;
  unint64_t v43 = *(void *)(a1 + 320);
  uint64_t v42 = *(void *)(a1 + 328);
  unint64_t v44 = *(void *)(a1 + 304);
  uint64_t v45 = *(void *)(a1 + 312);
  do
  {
    char v46 = *((unsigned char *)v51 + v41) ^ ((unsigned __int16)((v43 & 0xFFFD ^ 3) * (v43 | 2)) >> 8);
    *((unsigned char *)v51 + v41) = v46;
    unint64_t v44 = *(void *)(v42 + 8 * (v46 ^ v44)) ^ (v44 >> 8);
    uint64_t v45 = 134775813 * (v45 + v44) + 1;
    *(void *)(a1 + 304) = v44;
    *(void *)(a1 + 312) = v45;
    unint64_t v43 = *(void *)(v42 + 8 * (v43 ^ BYTE3(v45))) ^ (v43 >> 8);
    *(void *)(a1 + 32pthread_mutex_init(this, 0) = v43;
    ++v41;
  }
  while (v41 != 12);
  uint64_t v17 = 0;
  *(void *)(*(void *)(a1 + 288) + 120) += 12;
  *(_DWORD *)(a1 + 296) = 1;
  return v17;
}

uint64_t vinyl_unzOpenCurrentFile(uint64_t a1)
{
  return vinyl_unzOpenCurrentFile3(a1, 0, 0, 0, 0);
}

uint64_t vinyl_unzOpenCurrentFilePassword(uint64_t a1, unsigned char *a2)
{
  return vinyl_unzOpenCurrentFile3(a1, 0, 0, 0, a2);
}

uint64_t vinyl_unzOpenCurrentFile2(uint64_t a1, _DWORD *a2, int *a3, int a4)
{
  return vinyl_unzOpenCurrentFile3(a1, a2, a3, a4, 0);
}

uint64_t vinyl_unzReadCurrentFile(uint64_t a1, uint64_t a2, unsigned int a3)
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
  *(_DWORD *)(v4 + 4pthread_mutex_init(this, 0) = a3;
  unint64_t v5 = a3;
  unint64_t v6 = *(void *)(v4 + 184);
  if (v6 < a3 && !*(_DWORD *)(v4 + 280))
  {
    *(_DWORD *)(v4 + 4pthread_mutex_init(this, 0) = v6;
    a3 = v6;
  }
  uint64_t v7 = *(void *)(v4 + 176);
  uint64_t v8 = *(unsigned int *)(v4 + 16);
  if (v7 + v8 < v5 && *(_DWORD *)(v4 + 280))
  {
    a3 = v8 + v7;
    *(_DWORD *)(v4 + 4pthread_mutex_init(this, 0) = v8 + v7;
  }
  if (!a3) {
    return 0;
  }
  uint64_t v9 = 0;
  while (1)
  {
    while (1)
    {
      LODWORD(v1pthread_mutex_init(this, 0) = *(_DWORD *)(v4 + 16);
      if (!v10)
      {
        unint64_t v11 = *(void *)(v4 + 176);
        if (v11)
        {
          if (v11 >= 0x4000) {
            uint64_t v10 = 0x4000;
          }
          else {
            uint64_t v10 = *(void *)(v4 + 176);
          }
          if ((*(uint64_t (**)(void, void, void, void))(v4 + 224))(*(void *)(v4 + 248), *(void *)(v4 + 256), *(void *)(v4 + 272) + *(void *)(v4 + 120), 0)|| (*(uint64_t (**)(void, void, void, uint64_t))(v4 + 200))(*(void *)(v4 + 248), *(void *)(v4 + 256), *(void *)v4, v10) != v10)
          {
            return 0xFFFFFFFFLL;
          }
          if (*(_DWORD *)(a1 + 296))
          {
            uint64_t v12 = 0;
            do
            {
              uint64_t v13 = *(void *)(a1 + 328);
              unsigned int v14 = *(unsigned __int8 *)(*(void *)v4 + v12) ^ (((*(_DWORD *)(a1 + 320) & 0xFFFD ^ 3)
                                                                * (*(_DWORD *)(a1 + 320) | 2u)) >> 8);
              *(unsigned char *)(*(void *)v4 + v12) ^= (unsigned __int16)((*(_WORD *)(a1 + 320) & 0xFFFD ^ 3)
                                                                  * (*(_WORD *)(a1 + 320) | 2)) >> 8;
              uint64_t v15 = *(void *)(v13 + 8 * (v14 ^ *(void *)(a1 + 304))) ^ (*(void *)(a1 + 304) >> 8);
              uint64_t v16 = 134775813 * (*(void *)(a1 + 312) + v15) + 1;
              *(void *)(a1 + 304) = v15;
              *(void *)(a1 + 312) = v16;
              *(void *)(a1 + 32pthread_mutex_init(this, 0) = *(void *)(v13 + 8 * (*(void *)(a1 + 320) ^ BYTE3(v16))) ^ (*(void *)(a1 + 320) >> 8);
              *(unsigned char *)(*(void *)v4 + v12++) = v14;
            }
            while (v10 != v12);
          }
          *(void *)(v4 + 120) += v10;
          *(void *)(v4 + 176) -= v10;
          *(void *)(v4 + 8) = *(void *)v4;
          *(_DWORD *)(v4 + 16) = v10;
        }
        else
        {
          LODWORD(v1pthread_mutex_init(this, 0) = 0;
        }
      }
      if (*(void *)(v4 + 264) && !*(_DWORD *)(v4 + 280)) {
        break;
      }
      if (v10 || *(void *)(v4 + 176))
      {
        unsigned int v17 = *(_DWORD *)(v4 + 40);
        uint64_t v10 = v17 >= v10 ? v10 : v17;
        if (v10)
        {
          for (uint64_t i = 0; i != v10; ++i)
            *(unsigned char *)(*(void *)(v4 + 32) + i) = *(unsigned char *)(*(void *)(v4 + 8) + i);
          uint64_t v19 = v10;
        }
        else
        {
          uint64_t v19 = 0;
        }
        *(void *)(v4 + 16pthread_mutex_init(this, 0) = crc32(*(void *)(v4 + 160), *(const Bytef **)(v4 + 32), v10);
        *(void *)(v4 + 184) -= v19;
        *(_DWORD *)(v4 + 16) -= v10;
        int v20 = *(_DWORD *)(v4 + 40) - v10;
        *(_DWORD *)(v4 + 4pthread_mutex_init(this, 0) = v20;
        *(void *)(v4 + 32) += v19;
        *(void *)(v4 + 8) += v19;
        uint64_t v9 = (v10 + v9);
        *(void *)(v4 + 48) += v19;
        if (v20) {
          continue;
        }
      }
      return v9;
    }
    uint64_t v21 = *(void *)(v4 + 48);
    uint64_t v22 = *(const Bytef **)(v4 + 32);
    unsigned int v23 = inflate((z_streamp)(v4 + 8), 2);
    if ((v23 & 0x80000000) == 0 && *(void *)(v4 + 56))
    {
      uint64_t v26 = *(void *)(v4 + 48);
      uint64_t v27 = v26 - v21;
      *(void *)(v4 + 16pthread_mutex_init(this, 0) = crc32(*(void *)(v4 + 160), v22, (int)v26 - (int)v21);
      *(void *)(v4 + 184) -= v27;
      return 4294967293;
    }
    uint64_t v24 = *(void *)(v4 + 48) - v21;
    *(void *)(v4 + 16pthread_mutex_init(this, 0) = crc32(*(void *)(v4 + 160), v22, v24);
    *(void *)(v4 + 184) -= v24;
    uint64_t v9 = (v9 + v24);
    if (v23) {
      break;
    }
    if (!*(_DWORD *)(v4 + 40)) {
      return v9;
    }
  }
  if (v23 == 1) {
    return v9;
  }
  else {
    return v23;
  }
}

uint64_t vinyl_unztell(uint64_t a1)
{
  if (a1 && (uint64_t v1 = *(void *)(a1 + 288)) != 0) {
    return *(void *)(v1 + 48);
  }
  else {
    return -102;
  }
}

uint64_t vinyl_unzeof(uint64_t a1)
{
  if (a1 && (uint64_t v1 = *(void *)(a1 + 288)) != 0) {
    return *(void *)(v1 + 184) == 0;
  }
  else {
    return 4294967194;
  }
}

unint64_t vinyl_unzGetLocalExtrafield(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (!a1) {
    return 4294967194;
  }
  uint64_t v3 = *(void *)(a1 + 288);
  if (!v3) {
    return 4294967194;
  }
  uint64_t v5 = *(void *)(v3 + 152);
  unint64_t result = *(unsigned int *)(v3 + 144) - v5;
  if (a2)
  {
    if (result >= a3) {
      uint64_t v7 = a3;
    }
    else {
      uint64_t v7 = result;
    }
    if (v7)
    {
      if ((*(uint64_t (**)(void, void, uint64_t, void))(v3 + 224))(*(void *)(v3 + 248), *(void *)(v3 + 256), *(void *)(v3 + 136) + v5, 0))
      {
        return 0xFFFFFFFFLL;
      }
      else if ((*(uint64_t (**)(void, void, uint64_t, uint64_t))(v3 + 200))(*(void *)(v3 + 248), *(void *)(v3 + 256), a2, v7) == v7)
      {
        return v7;
      }
      else
      {
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t vinyl_unzGetGlobalComment(uint64_t a1, unsigned char *a2, unint64_t a3)
{
  if (!a1) {
    return 4294967194;
  }
  if (*(void *)(a1 + 80) >= a3) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = *(void *)(a1 + 80);
  }
  if ((*(uint64_t (**)(void, void, uint64_t, void))(a1 + 32))(*(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 120) + 22, 0))
  {
    return 0xFFFFFFFFLL;
  }
  if (v6)
  {
    *a2 = 0;
    if ((*(uint64_t (**)(void, void, unsigned char *, unint64_t))(a1 + 8))(*(void *)(a1 + 56), *(void *)(a1 + 64), a2, v6) != v6)return 0xFFFFFFFFLL; {
  }
    }
  else if (!a2)
  {
    return v6;
  }
  unint64_t v8 = *(void *)(a1 + 80);
  if (v8 < a3) {
    a2[v8] = 0;
  }
  return v6;
}

uint64_t vinyl_unzGetOffset(void *a1)
{
  if (!a1) {
    return -102;
  }
  if (a1[14])
  {
    uint64_t v1 = a1[9];
    BOOL v2 = !v1 || v1 == 0xFFFF;
    if (v2 || a1[12] != v1) {
      return a1[13];
    }
  }
  return 0;
}

uint64_t vinyl_unzSetOffset(void *a1, uint64_t a2)
{
  if (!a1) {
    return 4294967194;
  }
  a1[12] = a1[9];
  a1[13] = a2;
  uint64_t result = unzlocal_GetCurrentFileInfoInternal((uint64_t)a1, (uint64_t)(a1 + 18), a1 + 35, 0, 0, 0, 0, 0, 0);
  a1[14] = result == 0;
  return result;
}

uint64_t unzlocal_getByte(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  unsigned __int8 v7 = 0;
  if ((*(unsigned int (**)(void, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), a2, &v7, 1) == 1)
  {
    uint64_t result = 0;
    *a3 = v7;
  }
  else if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), a2))
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t eUICC::eUICCVinylMAVValve::eUICCVinylMAVValve(uint64_t this, void *a2, int a3, char a4)
{
  *(unsigned char *)(this + 288) = 0;
  *(void *)this = &unk_26E556318;
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
    *(_OWORD *)((char *)this + 20pthread_mutex_init(this, 0) = 0u;
    *(_OWORD *)((char *)this + 152) = 0u;
    *(_OWORD *)((char *)this + 168) = 0u;
    *(_OWORD *)((char *)this + 12pthread_mutex_init(this, 0) = 0u;
    *(_OWORD *)((char *)this + 136) = 0u;
    *(_OWORD *)((char *)this + 88) = 0u;
    *(_OWORD *)((char *)this + 104) = 0u;
    *(_OWORD *)((char *)this + 56) = 0u;
    *(_OWORD *)((char *)this + 72) = 0u;
    *(_OWORD *)((char *)this + 24) = 0u;
    *(_OWORD *)((char *)this + 4pthread_mutex_init(this, 0) = 0u;
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
    *((unsigned char *)this + 25pthread_mutex_init(this, 0) = v37;
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
    unint64_t v11 = "error %d status %u sw1_sw2 0x%x\n";
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
    unint64_t v11 = "No transport available.. bail out\n";
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

uint64_t eUICC::eUICCVinylMAVValve::StoreData(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  int v2 = v1;
  uint64_t v4 = v3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  eUICC::StoreData::Perform();
  if (v12 || v13 != 1)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)"rsp.Valid()");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to StoreData status %hhu SW1 0x%x SW2 0x%x\n", v9, v10, v11, v13);
    uint64_t result = 18;
  }
  else
  {
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v4, v16, &v16[v15], v15);
    uint64_t result = 0;
  }
  _WORD *v2 = bswap32(v14) >> 16;
  return result;
}

uint64_t eUICC::eUICCVinylMAVValve::InstallTicket(uint64_t a1, CFDataRef *a2)
{
  if (*a2) {
    int v2 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  }
  else {
    int v2 = 0;
  }
  if (v2)
  {
    uint64_t v4 = (*(uint64_t (**)(uint64_t, void, void))(*(void *)a1 + 16))(a1, 0, 0);
    if (v4)
    {
      uint64_t v5 = v4;
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)"kBBUReturnSuccess == ret");
    }
    else
    {
      CFDataGetBytePtr(*a2);
      CFDataGetLength(*a2);
      int v12 = eUICC::InstallTicket::Perform();
      char v14 = v12;
      if (v12 || (v13 & 0xFF00000000) != 0x100000000)
      {
        gBBULogMaskGet();
        _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "InstallTicket failed error %d status %hhu sw1 0x%x sw2 0x%x\n", v15, v16, v17, v14);
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
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v9, v10, v11, (char)"installTicket");
    return 2;
  }
  return v5;
}

uint64_t eUICC::eUICCVinylMAVValve::StreamFirmware(eUICC::eUICCVinylMAVValve *this, __CFData *a2)
{
  __src[36] = *MEMORY[0x263EF8340];
  VinylFirmware::getFirmwareAPDUs(a2, (uint64_t)&v54);
  uint64_t v4 = v54;
  uint64_t v3 = v55;
  (*(void (**)(void *__return_ptr, eUICC::eUICCVinylMAVValve *))(*(void *)this + 8))(__src, this);
  memcpy((char *)this + 8, __src, 0x119uLL);
  if (*((_DWORD *)this + 2) == ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    unsigned int v5 = *((unsigned __int8 *)this + 284);
    if (!*((unsigned char *)this + 284)) {
      unsigned int v5 = *((unsigned __int8 *)this + 304);
    }
    gBBULogMaskGet();
    unint64_t v6 = v5;
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "~~~~ MAX APDU PER SET: %zu  ~~~~\n", v7, v8, v9, v5);
    unint64_t v10 = (v3 - v4) >> 5;
    if (v10 % v5) {
      unint64_t v11 = v10 / v5 + 1;
    }
    else {
      unint64_t v11 = v10 / v5;
    }
    if (v11)
    {
      uint64_t v12 = (*(uint64_t (**)(eUICC::eUICCVinylMAVValve *, uint64_t, void))(*(void *)this + 16))(this, 1, 0);
      if (v12)
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"kBBUReturnSuccess == ret");
      }
      else
      {
        uint64_t v22 = 0;
        uint64_t v23 = 0;
        uint64_t v24 = 480;
        if (v5) {
          uint64_t v24 = 32 * v5;
        }
        uint64_t v52 = 32 * v5;
        size_t __sz = v24;
        unint64_t v25 = v10;
        while (1)
        {
          unint64_t v26 = v25 - v6;
          unint64_t v27 = v25 >= v6 ? v6 : v25;
          unint64_t v28 = v10 - v23 * v6 >= v6 ? v6 : v10 - v23 * v6;
          LODWORD(__src[4]) = 15000;
          __src[2] = operator new[](__sz);
          __src[3] = v6;
          __src[0] = *((void *)this + 37);
          LOBYTE(__src[1]) = *((_DWORD *)this + 73);
          WORD1(__src[1]) = v11;
          WORD2(__src[1]) = v23;
          BYTE6(__src[1]) = v28;
          gBBULogMaskGet();
          _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "StreamFirmware set %d/%zu adpusThisSet %zu\n", v29, v30, v31, v23);
          if (v28)
          {
            uint64_t v32 = 0;
            unint64_t v33 = 0;
            uint64_t v34 = v22;
            while (__src[3] >= v33)
            {
              uint64_t v35 = *(void *)((char *)v54 + v34);
              uint64_t v36 = *(void *)((char *)v54 + v34 + 16);
              uint64_t v37 = *(void *)((char *)v54 + v34 + 24);
              long long v38 = (void *)(__src[2] + v32);
              void *v38 = *(void *)((char *)v54 + v34 + 8);
              v38[1] = v35;
              v38[2] = v37;
              void v38[3] = v36;
              ++v33;
              v34 += 32;
              v32 += 32;
              if (v27 == v33) {
                goto LABEL_25;
              }
            }
            gBBULogMaskGet();
            _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v44, v45, v46, (char)"j <= req.apdu_payload.apdu_data_size");
            gBBULogMaskGet();
            _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed SteamAPDU index '%d' is greater than max array size '%zu'", v47, v48, v49, v33);
            char v40 = 0;
          }
          else
          {
LABEL_25:
            if (eUICC::StreamAPDU::Perform() || (v39 & 0xFF00000000) != 0x100000000)
            {
              gBBULogMaskGet();
              _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed StreamAPDU set %d/%zu, error %d status %hhu sw1 0x%x sw2 0x%x\n", v41, v42, v43, v23);
              char v40 = 0;
              uint64_t v12 = 16;
            }
            else
            {
              char v40 = 1;
            }
          }
          uint64_t v50 = (void *)__src[2];
          __src[2] = 0;
          if (v50) {
            operator delete[](v50);
          }
          if ((v40 & 1) == 0) {
            break;
          }
          ++v23;
          v22 += v52;
          unint64_t v25 = v26;
          if (v23 == v11)
          {
            uint64_t v12 = 0;
            break;
          }
        }
      }
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v19, v20, v21, (char)"apduSetCount");
      uint64_t v12 = 15;
    }
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)"outData.Valid()");
    uint64_t v12 = 18;
  }
  if (v54)
  {
    uint64_t v55 = v54;
    operator delete(v54);
  }
  return v12;
}

void sub_230AEE2A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::eUICCVinylMAVValve::InitPerso(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  *(void *)&__dst[6] = 0;
  *(void *)__dst = 0;
  *(_DWORD *)&__dst[14] = 30000;
  uint64_t v4 = *(void *)(a1 + 296);
  int v5 = *(_DWORD *)(a1 + 292);
  unint64_t v6 = *(const void **)a2;
  unint64_t v8 = *(void *)(a2 + 8) - (void)v6;
  if (v8 >= 0xC) {
    size_t v9 = 12;
  }
  else {
    size_t v9 = v8;
  }
  memcpy(__dst, v6, v9);
  uint64_t v22 = v4;
  char v23 = v5;
  __int16 v24 = 0;
  char v25 = 0;
  __int16 v26 = v9;
  long long v27 = *(_OWORD *)__dst;
  __int16 v28 = *(_WORD *)&__dst[16];
  eUICC::InitPersoSession::Perform();
  if (*(void *)__dst)
  {
    if (!**(_DWORD **)__dst && *(unsigned char *)(*(void *)__dst + 8) == 1 && *(_WORD *)(*(void *)__dst + 11))
    {
      std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a3, (char *)(*(void *)__dst + 13), (char *)(*(void *)__dst + 13 + *(unsigned __int16 *)(*(void *)__dst + 11)), *(unsigned __int16 *)(*(void *)__dst + 11));
      uint64_t v10 = 0;
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)"rsp->Valid() && rsp->contents.rsp_len");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to InitPerso status %hhu SW1 0x%x SW2 0x%x rsp_len %u\n", v14, v15, v16, *(unsigned char *)(*(void *)__dst + 8));
      uint64_t v10 = 18;
    }
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v17, v18, v19, (char)"rsp");
    uint64_t v10 = 11;
  }
  if (*(void *)&__dst[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&__dst[8]);
  }
  return v10;
}

void sub_230AEE4C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
}

uint64_t eUICC::eUICCVinylMAVValve::AuthPerso(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v6 = operator new(0x818uLL);
  bzero(v6 + 2, 0x810uLL);
  bzero(v6 + 3, 0x802uLL);
  v6[516] = 30000;
  *(void *)unint64_t v6 = *(void *)(a1 + 296);
  *((unsigned char *)v6 + 8) = *(_DWORD *)(a1 + 292);
  uint64_t v7 = *(const void **)a2;
  if (*(void *)(a2 + 8) - *(void *)a2 >= 0x800uLL) {
    size_t v8 = 2048;
  }
  else {
    size_t v8 = *(void *)(a2 + 8) - *(void *)a2;
  }
  memcpy((char *)v6 + 14, v7, v8);
  *((_WORD *)v6 + 6) = v8;
  eUICC::AuthPersoSession::Perform();
  if (v20)
  {
    if (!*(_DWORD *)v20 && *(unsigned char *)(v20 + 8) == 1 && *(_WORD *)(v20 + 11))
    {
      std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a3, (char *)(v20 + 13), (char *)(v20 + 13 + *(unsigned __int16 *)(v20 + 11)), *(unsigned __int16 *)(v20 + 11));
      uint64_t v9 = 0;
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"rsp->Valid() && rsp->contents.rsp_len");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to AuthenticatePersoDevice status %hhu SW1 0x%x SW2 0x%x rsp_len %u\n", v13, v14, v15, *(unsigned char *)(v20 + 8));
      uint64_t v9 = 18;
    }
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)"rsp");
    uint64_t v9 = 11;
  }
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  operator delete(v6);
  return v9;
}

void sub_230AEE6A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  operator delete(v14);
  _Unwind_Resume(a1);
}

uint64_t eUICC::eUICCVinylMAVValve::FinalizePerso(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
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
  char v9 = *(unsigned char *)(a1 + 289);
  uint64_t v22 = v3;
  char v23 = v4;
  char v24 = 0;
  char v25 = v9;
  char v26 = 0;
  __int16 v27 = v8;
  memcpy(v28, __dst, sizeof(v28));
  eUICC::FinalizePersoSession::Perform();
  if (*(void *)&__dst[0])
  {
    if (**(_DWORD **)&__dst[0] || *(unsigned char *)(*(void *)&__dst[0] + 8) != 1)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)"rsp->Valid()");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to FinalizePersoDevice status %hhu SW1 0x%x SW2 0x%x\n", v14, v15, v16, *(unsigned char *)(*(void *)&__dst[0] + 8));
      uint64_t v10 = 18;
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v17, v18, v19, (char)"rsp");
    uint64_t v10 = 11;
  }
  if (*((void *)&__dst[0] + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&__dst[0] + 1));
  }
  return v10;
}

void sub_230AEE8C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
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
  unint64_t v6 = *(const void **)a2;
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
  *(_OWORD *)uint64_t v32 = v24[0];
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

void sub_230AEEAE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
}

void eUICC::eUICCVinylMAVValve::~eUICCVinylMAVValve(eUICC::eUICCVinylMAVValve *this)
{
  eUICC::eUICCVinylValve::~eUICCVinylValve(this);

  operator delete(v1);
}

void eUICCStateMachine::eUICCStateMachine(eUICCStateMachine *this)
{
  *(_DWORD *)this = 0;
}

BOOL eUICCStateMachine::Done(eUICCStateMachine *this)
{
  return *(_DWORD *)this > 6u;
}

uint64_t eUICCStateMachine::Run(eUICCStateMachine *this, eUICC::VinylFactory *a2, VinylFirmware *a3, VinylFirmware *a4, const __CFDictionary *a5)
{
  v59[0] = 0;
  if (a5)
  {
    uint64_t v46 = a5;
    ctu::cf::CFSharedRef<__CFDictionary const>::reset(v59, (CFTypeRef *)&v46);
    uint64_t v45 = v59[0];
    if (v59[0]) {
      CFRetain(v59[0]);
    }
  }
  else
  {
    uint64_t v45 = 0;
  }
  Options::Options(&v46, &v45);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v45);
  if (v52 | v47) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v48 == 0;
  }
  gBBULogMaskGet();
  Options::ToString((uint64_t *)__p, (Options *)&v46);
  if (v44 >= 0) {
    uint64_t v12 = __p;
  }
  else {
    LOBYTE(v12) = __p[0];
  }
  _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Options:\n%s\n", v9, v10, v11, (char)v12);
  if (v44 < 0) {
    operator delete(__p[0]);
  }
  eUICC::VinylFactory::GetValve(a2, (void *)v46, v51, (eUICC::eUICCVinylICEValve **)__p);
  if (__p[0])
  {
    uint64_t v13 = *(int *)this;
    *(_DWORD *)this = 0;
    gBBULogMaskGet();
    if (v13 > 8) {
      uint64_t v17 = "??????";
    }
    else {
      uint64_t v17 = off_264BA21B8[v13];
    }
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Resetting state machine: %s --> %s\n", v14, v15, v16, (char)v17);
    while (1)
    {
      if (*(_DWORD *)this > 6u)
      {
        uint64_t v28 = 0;
        goto LABEL_33;
      }
      gBBULogMaskGet();
      uint64_t v26 = *(int *)this;
      char v27 = "??????";
      if (v26 <= 8) {
        char v27 = off_264BA21B8[v26];
      }
      _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Running at state %s\n", v23, v24, v25, (char)v27);
      uint64_t v28 = eUICCStateMachine::Step((int *)this, (uint64_t)a3, (uint64_t)a4);
      if (v28 == 45) {
        break;
      }
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Result %d next state %s allowRetry %d\n", v29, v30, v31, v28);
      if (v28 != 0 && v8)
      {
        uint64_t v28 = 0;
        BOOL v8 = 0;
        *(_DWORD *)this = 6;
      }
      if (v28) {
        goto LABEL_33;
      }
    }
    gBBULogMaskGet();
    uint64_t v35 = *(int *)this;
    if (v35 > 8) {
      uint64_t v36 = "??????";
    }
    else {
      uint64_t v36 = off_264BA21B8[v35];
    }
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "eUICC -- back to host to personalize in state %s\n", v32, v33, v34, (char)v36);
    uint64_t v28 = 0;
  }
  else
  {
    gBBULogMaskGet();
    uint64_t v21 = *(int *)this;
    if (v21 > 8) {
      long long v22 = "??????";
    }
    else {
      long long v22 = off_264BA21B8[v21];
    }
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Fatal Error: Error creating vinyl valve! Current State: %s\n", v18, v19, v20, (char)v22);
    *(_DWORD *)this = 7;
    uint64_t v28 = 9;
LABEL_33:
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "ret = %d\n", v37, v38, v39, v28);
  }
  char v40 = __p[0];
  __p[0] = 0;
  if (v40) {
    (*(void (**)(void *))(*(void *)v40 + 96))(v40);
  }
  if (v58 < 0) {
    operator delete(v57);
  }
  if (v56 < 0) {
    operator delete(v55);
  }
  if (v54 < 0) {
    operator delete(v53);
  }
  if (v50 < 0) {
    operator delete(v49);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(v59);
  return v28;
}

void sub_230AEEF4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19, int a20,__int16 a21,char a22,char a23)
{
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)(v23 - 96));
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
  unint64_t v6 = v4;
  return ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v6);
}

const char *eUICCStateMachine::StateAsString(unsigned int a1)
{
  if (a1 > 8) {
    return "??????";
  }
  else {
    return off_264BA21B8[a1];
  }
}

uint64_t eUICCStateMachine::Step(int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  int v28 = 7;
  v29[0] = 0;
  v30[0] = &unk_26E5563A8;
  v30[1] = eUICCStateMachine::Start;
  v30[3] = v30;
  int v31 = 2;
  v32[0] = &unk_26E5563A8;
  v32[1] = eUICCStateMachine::Perso;
  void v32[3] = v32;
  int v33 = 1;
  v34[0] = &unk_26E5563A8;
  v34[1] = eUICCStateMachine::Recovery;
  v34[3] = v34;
  int v35 = 3;
  v36[0] = &unk_26E5563A8;
  v36[1] = eUICCStateMachine::UpdateGold;
  void v36[3] = v36;
  int v37 = 4;
  v38[0] = &unk_26E5563A8;
  v38[1] = eUICCStateMachine::UpdateMain;
  void v38[3] = v38;
  int v39 = 5;
  v40[0] = &unk_26E5563A8;
  v40[1] = eUICCStateMachine::PostProcess;
  v40[3] = v40;
  int v41 = 6;
  v42[0] = &unk_26E5563A8;
  v42[1] = eUICCStateMachine::Retry;
  v42[3] = v42;
  int v43 = 7;
  uint64_t v44 = 0;
  int v45 = 8;
  uint64_t v46 = 0;
  std::map<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>::map[abi:ne180100]((uint64_t)v26, v29, 9);
  for (uint64_t i = 82; i != -8; i -= 10)
    std::__function::__value_func<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::~__value_func[abi:ne180100](&v29[i]);
  unint64_t v7 = v27[0];
  if (!v27[0]) {
    goto LABEL_21;
  }
  int v8 = *a1;
  uint64_t v9 = v27;
  do
  {
    uint64_t v10 = v7;
    uint64_t v11 = v9;
    int v12 = *((_DWORD *)v7 + 8);
    if (v12 >= v8) {
      uint64_t v9 = (void **)v7;
    }
    else {
      ++v7;
    }
    unint64_t v7 = (void *)*v7;
  }
  while (v7);
  if (v9 == v27 || (v12 >= v8 ? (uint64_t v13 = v10) : (uint64_t v13 = v11), v8 < *((_DWORD *)v13 + 8) || !v9[8]))
  {
LABEL_21:
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 2, "/Library/Caches/com.apple.xbs/Sources/VinylRestore/Update/StateMachine/eUICCStateMachine.cpp", 0x87u, (ctu::LogMessageBuffer *)"Assertion failure(((stateMap.end() != def) && def->second) && \"eUICCStateMachine is corrupted.\")", v22, v23, v24, v25);
  }
  uint64_t v14 = std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::operator()((uint64_t)(v9 + 5), a2, a3);
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Ret %d from state %s next %s\n", v15, v16, v17, v14);
  BOOL v18 = v14 == 45 || v14 == 0;
  int v19 = v28;
  if (!v18) {
    int v19 = 7;
  }
  *a1 = v19;
  std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::destroy((uint64_t)v26, v27[0]);
  return v14;
}

void sub_230AEF424(_Unwind_Exception *a1)
{
  for (uint64_t i = 328; i != -32; i -= 40)
    std::__function::__value_func<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::~__value_func[abi:ne180100]((void *)(v1 + i));
  _Unwind_Resume(a1);
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

uint64_t eUICCStateMachine::Start(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5)
{
  *(void *)&v12[281] = *MEMORY[0x263EF8340];
  (*(void (**)(unsigned char *__return_ptr))(**(void **)a5 + 8))(v12);
  int v7 = HowToProceed((uint64_t)v12, a3);
  if (!v7) {
    return 18;
  }
  int v8 = v7;
  uint64_t result = 0;
  if (v8 == 2) {
    int v10 = 5;
  }
  else {
    int v10 = 2;
  }
  if (v8 == 3) {
    int v11 = 8;
  }
  else {
    int v11 = v10;
  }
  *a4 = v11;
  return result;
}

uint64_t eUICCStateMachine::Perso(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, void (****a5)(std::string *__return_ptr))
{
  void (***v10)(std::string *__return_ptr);
  int v11;
  std::string __p;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  uint64_t v17;

  uint64_t v17 = *MEMORY[0x263EF8340];
  (**a5)[1]((std::string *)&v14);
  if (BYTE4(v14) != 1 && *(unsigned char *)(a3 + 40) == 0)
  {
    uint64_t v9 = 0;
  }
  else
  {
    VinylFirmware::bootloaderVersion((VinylFirmware *)v15, v16, &__p);
    uint64_t v9 = eUICC::Perso::Perform(a3, (uint64_t)&__p, a5);
    int v10 = *a5;
    *(_OWORD *)++int v10 = 0u;
    *((_OWORD *)v10 + 15) = 0u;
    *((_OWORD *)v10 + 16) = 0u;
    *((_OWORD *)v10 + 13) = 0u;
    *((_OWORD *)v10 + 14) = 0u;
    *((_OWORD *)v10 + 11) = 0u;
    *((_OWORD *)v10 + 12) = 0u;
    *((_OWORD *)v10 + 9) = 0u;
    *((_OWORD *)v10 + 1pthread_mutex_init(this, 0) = 0u;
    *((_OWORD *)v10 + 7) = 0u;
    *((_OWORD *)v10 + 8) = 0u;
    *((_OWORD *)v10 + 5) = 0u;
    *((_OWORD *)v10 + 6) = 0u;
    *((_OWORD *)v10 + 3) = 0u;
    *((_OWORD *)v10 + 4) = 0u;
    *((_OWORD *)v10 + 1) = 0u;
    *((_OWORD *)v10 + 2) = 0u;
    *(_OWORD *)((char *)v10 + 265) = 0u;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  if (*(unsigned char *)(a3 + 9)) {
    int v11 = 5;
  }
  else {
    int v11 = 1;
  }
  *a4 = v11;
  return v9;
}

void sub_230AEF6D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICCStateMachine::Recovery(VinylFirmware *a1, VinylFirmware *a2, uint64_t a3, _DWORD *a4, void *a5)
{
  *(void *)&v27[137] = *MEMORY[0x263EF8340];
  (*(void (**)(uint64_t *__return_ptr))(*(void *)*a5 + 8))(&v25);
  if (v25 == ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    if (!v26)
    {
LABEL_16:
      uint64_t v10 = 0;
      *a4 = 3;
      return v10;
    }
    if (VinylFirmware::getRecoveryFwData(a2)) {
      uint64_t v9 = a2;
    }
    else {
      uint64_t v9 = a1;
    }
    if (VinylFirmware::getRecoveryFwData(v9))
    {
      uint64_t v10 = (*(uint64_t (**)(void))(*(void *)*a5 + 48))();
      int v11 = (_OWORD *)*a5;
      *(_OWORD *)((char *)v11 + 8) = 0u;
      int v11 = (_OWORD *)((char *)v11 + 8);
      v11[15] = 0u;
      v11[16] = 0u;
      v11[13] = 0u;
      v11[14] = 0u;
      v11[11] = 0u;
      v11[12] = 0u;
      v11[9] = 0u;
      v11[10] = 0u;
      v11[7] = 0u;
      v11[8] = 0u;
      v11[5] = 0u;
      v11[6] = 0u;
      void v11[3] = 0u;
      v11[4] = 0u;
      v11[1] = 0u;
      void v11[2] = 0u;
      *(_OWORD *)((char *)v11 + 265) = 0u;
      if (!v10)
      {
        uint64_t v10 = (*(uint64_t (**)(void, void, void))(*(void *)*a5 + 16))(*a5, 0, 0);
        if (!v10) {
          goto LABEL_16;
        }
      }
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Condition <<%s>> failed %s %s/%d\n", v12, v13, v14, (char)"kBBUReturnSuccess == ret");
    }
    else
    {
      ctu::hex((ctu *)v27, (const void *)8);
      gBBULogMaskGet();
      p_p = &__p;
      if (v24 < 0) {
        LOBYTE(p_p) = (_BYTE)__p;
      }
      _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "SM::Recovery Missing gold with hash %s\n", v18, v19, v20, (char)p_p);
      if (v24 < 0) {
        operator delete(__p);
      }
      return 15;
    }
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Condition <<%s>> failed %s %s/%d\n", v15, v16, v17, (char)"euiccData.Valid()");
    return 18;
  }
  return v10;
}

void sub_230AEF9AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICCStateMachine::UpdateGold(CFDictionaryRef *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)&__dst[71] = *MEMORY[0x263EF8340];
  cf[0] = 0;
  (*(void (**)(_DWORD *__return_ptr))(**(void **)a5 + 8))(__dst);
  if (__dst[0] != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)"euiccData.Valid()");
    uint64_t v15 = 18;
LABEL_6:
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(cf);
    return v15;
  }
  if (!a1)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Condition <<%s>> failed %s %s/%d\n", v9, v10, v11, (char)"goldFirmware");
    uint64_t v15 = 15;
    goto LABEL_6;
  }
  VinylFirmware::getFwMac(a1);
  cf[1] = 0;
  long long v18 = 0uLL;
  ctu::cf::assign();
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Condition <<%s>> failed %s %s/%d\n", v12, v13, v14, (char)"bundMac.size() == kFWMacSize");
  uint64_t v15 = 1;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(cf);
  return v15;
}

void sub_230AF00D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,int a21,const void *a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a22);
  if (v28) {
    operator delete(v28);
  }
  _Unwind_Resume(a1);
}

uint64_t eUICCStateMachine::UpdateMain(uint64_t a1, CFMutableDataRef *a2, uint64_t a3, int *a4, void *a5)
{
  *(void *)&__dst[71] = *MEMORY[0x263EF8340];
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v81 = 0;
  __s1 = 0;
  __n[0] = 0;
  __n[1] = 0;
  CFTypeRef cf = 0;
  (*(void (**)(_DWORD *__return_ptr))(*(void *)*a5 + 8))(__dst);
  if (__dst[0] != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Condition <<%s>> failed %s %s/%d\n", v21, v22, v23, (char)"euiccData.Valid()");
    uint64_t v24 = 18;
LABEL_28:
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&cf);
    goto LABEL_50;
  }
  if (!a2)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Condition <<%s>> failed %s %s/%d\n", v25, v26, v27, (char)"mainFirmware");
    uint64_t v24 = 15;
    goto LABEL_28;
  }
  VinylFirmware::getVersionString(a2, __src);
  if (SHIBYTE(v81) < 0) {
    operator delete(__p[0]);
  }
  *(_OWORD *)std::string __p = *(_OWORD *)__src;
  uint64_t v81 = *(void *)&__src[16];
  uint64_t v9 = operator new(0x28uLL);
  long long v10 = *(_OWORD *)&__dst[10];
  *uint64_t v9 = *(_OWORD *)&__dst[6];
  v9[1] = v10;
  *((unsigned char *)v9 + 32) = 0;
  if (SHIBYTE(__n[1]) < 0) {
    operator delete(__s1);
  }
  __s1 = v9;
  *(_OWORD *)__n = xmmword_230B06C00;
  VinylFirmware::getFwMac(a2);
  memset(__src, 0, 24);
  ctu::cf::assign();
  uint64_t v11 = *(void **)__src;
  if (*(void *)&__src[8] - *(void *)__src != 8)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Condition <<%s>> failed %s %s/%d\n", v28, v29, v30, (char)"bundMac.size() == kFWMacSize");
    uint64_t v24 = 1;
    goto LABEL_48;
  }
  gBBULogMaskGet();
  p_s1 = &__s1;
  if ((__n[1] & 0x8000000000000000) != 0) {
    LOBYTE(p_s1) = (_BYTE)__s1;
  }
  _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Update Main:Card %s Bundle %s\n", v12, v13, v14, (char)p_s1);
  if (!*(unsigned char *)(a3 + 10))
  {
    uint64_t v16 = HIBYTE(__n[1]);
    if ((__n[1] & 0x8000000000000000) == 0) {
      size_t v17 = HIBYTE(__n[1]);
    }
    else {
      size_t v17 = __n[0];
    }
    long long v18 = (void *)HIBYTE(v81);
    if (v81 < 0) {
      long long v18 = __p[1];
    }
    if ((void *)v17 == v18)
    {
      if (v81 >= 0) {
        uint64_t v19 = __p;
      }
      else {
        uint64_t v19 = (void **)__p[0];
      }
      if ((__n[1] & 0x8000000000000000) != 0)
      {
        if (memcmp(__s1, v19, __n[0])) {
          goto LABEL_31;
        }
      }
      else if (HIBYTE(__n[1]))
      {
        uint64_t v20 = &__s1;
        while (*(unsigned __int8 *)v20 == *(unsigned __int8 *)v19)
        {
          uint64_t v20 = (void **)((char *)v20 + 1);
          uint64_t v19 = (void **)((char *)v19 + 1);
          if (!--v16) {
            goto LABEL_45;
          }
        }
        goto LABEL_31;
      }
LABEL_45:
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Main FW versions already matching (no forceMain)\n", v46, v47, v48, v73);
      uint64_t v24 = 0;
LABEL_46:
      int v39 = 5;
      goto LABEL_47;
    }
  }
LABEL_31:
  AuthPayload = (const void *)VinylFirmware::getAuthPayload((VinylFirmware *)a2);
  CFTypeRef v32 = cf;
  CFTypeRef cf = AuthPayload;
  *(void *)__src = v32;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__src);
  if (cf) {
    int v33 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  }
  else {
    int v33 = 0;
  }
  if (!v33)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Install main but no ticket -- back to restored please\n", v36, v37, v38, v73);
    uint64_t v24 = 45;
    int v39 = 4;
LABEL_47:
    *a4 = v39;
    goto LABEL_48;
  }
  if (*(unsigned char *)(a3 + 10) || *(void *)&__dst[18] != *v11)
  {
    uint64_t v34 = *a5;
    CFTypeRef v76 = cf;
    if (cf) {
      CFRetain(cf);
    }
    uint64_t v24 = (*(uint64_t (**)(uint64_t, CFTypeRef *))(*(void *)v34 + 40))(v34, &v76);
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v76);
    int v35 = (_OWORD *)*a5;
    *(_OWORD *)((char *)v35 + 8) = 0u;
    int v35 = (_OWORD *)((char *)v35 + 8);
    v35[15] = 0u;
    v35[16] = 0u;
    v35[13] = 0u;
    v35[14] = 0u;
    v35[11] = 0u;
    v35[12] = 0u;
    v35[9] = 0u;
    v35[10] = 0u;
    v35[7] = 0u;
    v35[8] = 0u;
    v35[5] = 0u;
    v35[6] = 0u;
    v35[3] = 0u;
    void v35[4] = 0u;
    v35[1] = 0u;
    v35[2] = 0u;
    *(_OWORD *)((char *)v35 + 265) = 0u;
    if (v24) {
      goto LABEL_56;
    }
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "successfully pushed Install Ticket\n", v40, v41, v42, v73);
  }
  uint64_t v43 = *a5;
  FwCFDataRef Data = VinylFirmware::getFwData((VinylFirmware *)a2);
  uint64_t v24 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v43 + 48))(v43, FwData);
  int v45 = (_OWORD *)*a5;
  *(_OWORD *)((char *)v45 + 8) = 0u;
  int v45 = (_OWORD *)((char *)v45 + 8);
  v45[15] = 0u;
  v45[16] = 0u;
  v45[13] = 0u;
  v45[14] = 0u;
  v45[11] = 0u;
  v45[12] = 0u;
  v45[9] = 0u;
  v45[10] = 0u;
  v45[7] = 0u;
  v45[8] = 0u;
  v45[5] = 0u;
  v45[6] = 0u;
  v45[3] = 0u;
  v45[4] = 0u;
  v45[1] = 0u;
  v45[2] = 0u;
  *(_OWORD *)((char *)v45 + 265) = 0u;
  if (!v24)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "successfully streamed Firmware\n", v50, v51, v52, v73);
    uint64_t v24 = (*(uint64_t (**)(void, void, void))(*(void *)*a5 + 16))(*a5, 0, 0);
    long long v53 = (_OWORD *)*a5;
    *(_OWORD *)((char *)v53 + 8) = 0u;
    long long v53 = (_OWORD *)((char *)v53 + 8);
    v53[15] = 0u;
    v53[16] = 0u;
    v53[13] = 0u;
    v53[14] = 0u;
    v53[11] = 0u;
    v53[12] = 0u;
    v53[9] = 0u;
    v53[10] = 0u;
    v53[7] = 0u;
    v53[8] = 0u;
    v53[5] = 0u;
    v53[6] = 0u;
    v53[3] = 0u;
    v53[4] = 0u;
    v53[1] = 0u;
    v53[2] = 0u;
    *(_OWORD *)((char *)v53 + 265) = 0u;
    if (!v24)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "successfully switched back to Normal\n", v57, v58, v59, v74);
      (*(void (**)(unsigned char *__return_ptr))(*(void *)*a5 + 8))(__src);
      memcpy(__dst, __src, 0x119uLL);
      long long v60 = operator new(0x28uLL);
      *(void *)__src = v60;
      *(_OWORD *)&__src[8] = xmmword_230B06C00;
      long long v61 = *(_OWORD *)&__dst[10];
      *long long v60 = *(_OWORD *)&__dst[6];
      v60[1] = v61;
      *((unsigned char *)v60 + 32) = 0;
      if (__dst[0] == ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
      {
        if (std::operator!=[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(__src, (unsigned __int8 *)__p))
        {
          gBBULogMaskGet();
          uint64_t v65 = __src;
          if (__src[23] < 0) {
            LOBYTE(v65) = __src[0];
          }
          _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Main version strings mismatched: Card %s Bundle %s", v62, v63, v64, (char)v65);
          int v66 = 0;
          uint64_t v24 = 22;
        }
        else
        {
          uint64_t v24 = 0;
          int v66 = 1;
        }
      }
      else
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Condition <<%s>> failed %s %s/%d\n", v67, v68, v69, (char)"euiccData.Valid()");
        int v66 = 0;
        uint64_t v24 = 18;
      }
      if ((__src[23] & 0x80000000) != 0) {
        operator delete(*(void **)__src);
      }
      if (!v66) {
        goto LABEL_48;
      }
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Success!\n", v70, v71, v72, v75);
      goto LABEL_46;
    }
  }
LABEL_56:
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Condition <<%s>> failed %s %s/%d\n", v54, v55, v56, (char)"kBBUReturnSuccess == ret");
LABEL_48:
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&cf);
  if (v11) {
    operator delete(v11);
  }
LABEL_50:
  if (SHIBYTE(__n[1]) < 0) {
    operator delete(__s1);
  }
  if (SHIBYTE(v81) < 0) {
    operator delete(__p[0]);
  }
  return v24;
}

void sub_230AF09A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, int a17, const void *a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a18);
  if (v37) {
    operator delete(v37);
  }
  if (a24 < 0) {
    operator delete(__p);
  }
  if (a30 < 0) {
    operator delete(a25);
  }
  _Unwind_Resume(a1);
}

uint64_t eUICCStateMachine::PostProcess(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Empty implementation for PostProcess. Non updater takes care of refurb options!\n", v5, v6, v7, v9);
  *a4 = 8;
  return 0;
}

uint64_t eUICCStateMachine::Retry(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, void *a5)
{
  (*(void (**)(void, void, uint64_t))(*(void *)*a5 + 16))(*a5, 0, 1);
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "...waiting patiently for reset\n", v6, v7, v8, v10);
  __ns.__rep_ = 10000000000;
  std::this_thread::sleep_for (&__ns);
  *a4 = 0;
  return 0;
}

uint64_t std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a3;
  uint64_t v6 = a2;
  uint64_t v3 = *(void *)(a1 + 24);
  if (!v3) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(void *)v3 + 48))(v3, &v6, &v5);
}

uint64_t HowToProceed(uint64_t a1, uint64_t a2)
{
  *(void *)&long long v26 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a2 + 8))
  {
    gBBULogMaskGet();
    uint64_t v5 = "eUICC Skip All\n";
LABEL_3:
    _BBULog(0, 0xFFFFFFFFLL, "eUICC", "", v5, v2, v3, v4, v21);
    return 3;
  }
  if (*(_DWORD *)a1 == ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "0.1");
    long long v22 = 0uLL;
    v23[0] = 0;
    v23[2] = &v22;
    char v24 = 0;
    *(void *)&long long v22 = operator new(0x18uLL);
    *((void *)&v22 + 1) = v22;
    v23[0] = v22 + 24;
    *((void *)&v22 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)v23, (long long *)&__p, &v26, (std::string *)v22);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    VinylFirmware::bootloaderVersion((VinylFirmware *)*(unsigned __int8 *)(a1 + 240), *(unsigned __int8 *)(a1 + 241), &__p);
    uint64_t v8 = std::__find_impl[abi:ne180100]<std::string const*,std::string const*,std::string,std::__identity>(v22, *((uint64_t *)&v22 + 1), (unsigned __int8 **)&__p);
    if (v8 == *((void *)&v22 + 1))
    {
      uint64_t v6 = 1;
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICC", "", "eUICC HW present is too old so we will skip updating it\n", v9, v10, v11, v21);
      uint64_t v6 = 3;
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v22;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  }
  else
  {
    if (*(unsigned char *)(a1 + 278))
    {
      gBBULogMaskGet();
      uint64_t v5 = "eUICC not stuffed but that's ok!\n";
      goto LABEL_3;
    }
    pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
    uint64_t v12 = (BBUCapabilities *)xmmword_26870BC08;
    if (!(void)xmmword_26870BC08)
    {
      BBUCapabilities::create_default_global(&v22);
      long long v13 = v22;
      long long v22 = 0uLL;
      uint64_t v14 = (std::__shared_weak_count *)*((void *)&xmmword_26870BC08 + 1);
      xmmword_26870BC08 = v13;
      if (v14)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
        if (*((void *)&v22 + 1)) {
          std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v22 + 1));
        }
      }
      uint64_t v12 = (BBUCapabilities *)xmmword_26870BC08;
    }
    uint64_t v15 = (std::__shared_weak_count *)*((void *)&xmmword_26870BC08 + 1);
    if (*((void *)&xmmword_26870BC08 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_26870BC08 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
    unsigned int v16 = BBUCapabilities::supportsVinylUpdate(v12);
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
    if (v16)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICC", "", "Bailing on eUICC error due to status %u\n", v17, v18, v19, *(_DWORD *)a1);
      return 0;
    }
    else
    {
      return 2;
    }
  }
  return v6;
}

void sub_230AF0E38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
}

BOOL std::operator!=[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = a1[23];
  if ((v2 & 0x80u) == 0) {
    uint64_t v3 = a1[23];
  }
  else {
    uint64_t v3 = *((void *)a1 + 1);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 1;
  }
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0) {
    return memcmp(*(const void **)a1, a2, *((void *)a1 + 1)) != 0;
  }
  if (a1[23])
  {
    uint64_t v6 = v2 - 1;
    do
    {
      int v8 = *a1++;
      int v7 = v8;
      int v9 = *a2++;
      BOOL v10 = v7 == v9;
      uint64_t v2 = v7 != v9;
      BOOL v10 = !v10 || v6-- == 0;
    }
    while (!v10);
  }
  return v2;
}

void *std::__function::__func<BBUReturn (*)(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &),std::allocator<BBUReturn (*)(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>,BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26E5563A8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<BBUReturn (*)(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &),std::allocator<BBUReturn (*)(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>,BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26E5563A8;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<BBUReturn (*)(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &),std::allocator<BBUReturn (*)(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>,BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::operator()(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t))(a1 + 8))(*a2, *a3, a4, a5, a6);
}

uint64_t std::__function::__func<BBUReturn (*)(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &),std::allocator<BBUReturn (*)(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>,BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<BBUReturn (*)(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &),std::allocator<BBUReturn (*)(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>,BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::target_type()
{
}

void *std::__function::__value_func<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t std::map<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 40 * a3;
    do
    {
      std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::__emplace_hint_unique_key_args<eUICCStateMachine::State,std::pair<eUICCStateMachine::State const,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>> const&>((uint64_t **)a1, v4, a2, a2);
      a2 += 10;
      v6 -= 40;
    }
    while (v6);
  }
  return a1;
}

void sub_230AF114C(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::__emplace_hint_unique_key_args<eUICCStateMachine::State,std::pair<eUICCStateMachine::State const,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>> const&>(uint64_t **a1, uint64_t *a2, int *a3, _DWORD *a4)
{
  uint64_t v6 = std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::__find_equal<eUICCStateMachine::State>(a1, a2, &v12, &v11, a3);
  int v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    int v8 = (uint64_t **)v6;
    std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::__construct_node<std::pair<eUICCStateMachine::State const,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>> const&>((uint64_t)a1, a4, (uint64_t)v10);
    std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__insert_node_at(a1, (uint64_t)v12, v8, v10[0]);
    int v7 = v10[0];
    v10[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,void *>>>>::reset[abi:ne180100]((uint64_t)v10, 0);
  }
  return v7;
}

uint64_t *std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::__find_equal<eUICCStateMachine::State>(void *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  int v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, int v7 = *((_DWORD *)a2 + 8), *a5 < v7))
  {
    int v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      BOOL v10 = a2;
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
      int v9 = (uint64_t *)*a2;
      do
      {
        BOOL v10 = v9;
        int v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      long long v13 = a2;
      do
      {
        BOOL v10 = (uint64_t *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        long long v13 = v10;
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
          uint64_t v17 = (uint64_t *)v16;
          int v18 = *(_DWORD *)(v16 + 32);
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = *v17;
          int v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        int v5 = v17 + 1;
        uint64_t v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      uint64_t v17 = a1 + 1;
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
    uint64_t v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      uint64_t v12 = (uint64_t *)*v12;
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
          char v21 = (uint64_t *)v20;
          int v22 = *(_DWORD *)(v20 + 32);
          if (v6 >= v22) {
            break;
          }
          uint64_t v20 = *v21;
          int v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        int v5 = v21 + 1;
        uint64_t v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      char v21 = a1 + 1;
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

uint64_t std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::__construct_node<std::pair<eUICCStateMachine::State const,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>> const&>@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  int v6 = operator new(0x48uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  v6[8] = *a2;
  uint64_t result = std::__function::__value_func<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::__value_func[abi:ne180100]((uint64_t)(v6 + 10), (uint64_t)(a2 + 2));
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_230AF1400(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__tree_node<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__value_func<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void std::unique_ptr<std::__tree_node<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__function::__value_func<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::~__value_func[abi:ne180100](v2 + 5);
    }
    operator delete(v2);
  }
}

void std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::destroy(a1, a2[1]);
    std::__function::__value_func<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::~__value_func[abi:ne180100](a2 + 5);
    operator delete(a2);
  }
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

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  uint64_t v4 = this;
  uint64_t v11 = this;
  uint64_t v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    int v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((void *)v6 + 1));
        uint64_t v4 = v12;
      }
      else
      {
        long long v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      int v6 = (long long *)((char *)v6 + 24);
      uint64_t v12 = ++v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_230AF1688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0) {
      operator delete(*(void **)(v1 - 24));
    }
    v1 -= 24;
  }
}

uint64_t std::__find_impl[abi:ne180100]<std::string const*,std::string const*,std::string,std::__identity>(uint64_t a1, uint64_t a2, unsigned __int8 **a3)
{
  uint64_t v3 = a1;
  if (a1 != a2)
  {
    char v5 = *((unsigned char *)a3 + 23);
    if (v5 >= 0) {
      int v6 = (unsigned __int8 *)*((unsigned __int8 *)a3 + 23);
    }
    else {
      int v6 = a3[1];
    }
    if (v5 >= 0) {
      long long v7 = (unsigned __int8 *)a3;
    }
    else {
      long long v7 = *a3;
    }
    do
    {
      uint64_t v8 = *(unsigned __int8 *)(v3 + 23);
      if ((v8 & 0x80u) == 0) {
        int v9 = (unsigned __int8 *)*(unsigned __int8 *)(v3 + 23);
      }
      else {
        int v9 = *(unsigned __int8 **)(v3 + 8);
      }
      if (v9 == v6)
      {
        if ((v8 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v3, v7, *(void *)(v3 + 8))) {
            return v3;
          }
        }
        else
        {
          if (!*(unsigned char *)(v3 + 23)) {
            return v3;
          }
          uint64_t v10 = 0;
          while (*(unsigned __int8 *)(v3 + v10) == v7[v10])
          {
            if (v8 == ++v10) {
              return v3;
            }
          }
        }
      }
      v3 += 24;
    }
    while (v3 != a2);
    return a2;
  }
  return v3;
}

uint64_t __cxx_global_var_init_5()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_230AD4000);
  }
  return result;
}

uint64_t __cxx_global_var_init_47()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_230AD4000);
  }
  return result;
}

uint64_t VinylController::create(uint64_t a1, int a2)
{
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "entering VinylController::create\n", v4, v5, v6, v19);
  BOOL v14 = (VinylController *)VinylController::instance;
  if (!a2 || VinylController::instance)
  {
    if (VinylController::instance) {
      goto LABEL_7;
    }
    BOOL v14 = (VinylController *)operator new(0x88uLL);
    VinylController::VinylController(v14);
  }
  else
  {
    BOOL v14 = (VinylController *)operator new(0x88uLL);
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

void sub_230AF1924(_Unwind_Exception *a1)
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
  *(void *)a1 = &unk_26E556498;
  *(void *)(a1 + 8) = 0;
  uint64_t v5 = (VinylSecureElement *)VinylCommunication::create(a2, 0);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 12pthread_mutex_init(this, 0) = VinylSecureElement::create(v5);
  *(void *)(a1 + 128) = 0;
  uint64_t v6 = (_OWORD *)(a1 + 32);
  if (a3)
  {
    long long v7 = *(_OWORD *)(a3 + 16);
    _OWORD *v6 = *(_OWORD *)a3;
    *(_OWORD *)(a1 + 48) = v7;
    long long v8 = *(_OWORD *)(a3 + 32);
    long long v9 = *(_OWORD *)(a3 + 48);
    long long v10 = *(_OWORD *)(a3 + 64);
    *(void *)(a1 + 112) = *(void *)(a3 + 80);
    *(_OWORD *)(a1 + 8pthread_mutex_init(this, 0) = v9;
    *(_OWORD *)(a1 + 96) = v10;
    *(_OWORD *)(a1 + 64) = v8;
    char v11 = 1;
  }
  else
  {
    char v11 = 0;
    *(void *)(a1 + 112) = 0;
    *(_OWORD *)(a1 + 8pthread_mutex_init(this, 0) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    _OWORD *v6 = 0u;
  }
  *(unsigned char *)(a1 + 24) = v11;
  return a1;
}

void sub_230AF1A78(_Unwind_Exception *a1)
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
  *(void *)this = &unk_26E556498;
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

void sub_230AF1B14(_Unwind_Exception *a1)
{
  ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef(v1);
  _Unwind_Resume(a1);
}

uint64_t VinylController::getParamUpdateOperation(const void **this, __CFDictionary *a2, const __CFDictionary *a3)
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  LOBYTE(__dst[70]) = 0;
  v111 = 0;
  value = 0;
  v109 = 0;
  v110 = 0;
  v107 = 0;
  v108 = 0;
  CFMutableDictionaryRef theDict = 0;
  CFMutableDictionaryRef v106 = 0;
  v103 = 0;
  v104 = 0;
  if (a3)
  {
    *(void *)std::string __p = a3;
    ctu::cf::CFSharedRef<__CFDictionary const>::reset(this + 16, (CFTypeRef *)__p);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(&v94, this + 16);
  Options::Options(v95, &v94);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v94);
  gBBULogMaskGet();
  Options::ToString((uint64_t *)__p, (Options *)v95);
  if (__p[23] >= 0) {
    long long v8 = __p;
  }
  else {
    LOBYTE(v8) = __p[0];
  }
  _BBULog(22, 0xFFFFFFFFLL, "VinylController", "", "VinylRestore Options:\n%s\n", v5, v6, v7, (char)v8);
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  if (a2)
  {
    int TransportNoEvents = VinylController::createTransportNoEvents((VinylController *)this);
    char v10 = TransportNoEvents;
    if (!TransportNoEvents)
    {
      eUICC::VinylFactory::GetValve((eUICC::VinylFactory *)(this + 4), (void *)LODWORD(v95[0]), 0, (eUICC::eUICCVinylICEValve **)__p);
      uint64_t v11 = *(void *)__p;
      if (*(void *)__p)
      {
        (*(void (**)(unsigned char *__return_ptr, void))(**(void **)__p + 8))(__p, *(void *)__p);
        memcpy(__dst, __p, 0x119uLL);
        if (__dst[0] != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
        {
          if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
            _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v75, v76, v77, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
          }
          gBBULogMaskGet();
          uint64_t v56 = "eUICC not detected, skipping\n";
          goto LABEL_121;
        }
        CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFDataRef v13 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)&__dst[1] + 3, 16);
        BOOL v14 = value;
        value = v13;
        *(void *)std::string __p = v14;
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
        if (value) {
          uint64_t v15 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
        }
        else {
          uint64_t v15 = 0;
        }
        if (v15)
        {
          CFDictionarySetValue(a2, @"eUICC,EID", value);
          CFNumberRef v16 = CFNumberCreate(v12, kCFNumberSInt8Type, (char *)&__dst[68] + 3);
          uint64_t v17 = v111;
          v111 = v16;
          *(void *)std::string __p = v17;
          ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)__p);
          if (v111) {
            int v18 = ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get;
          }
          else {
            int v18 = 0;
          }
          if (v18)
          {
            CFDictionarySetValue(a2, @"eUICC,ChipID", v111);
            CFDataRef v19 = CFDataCreate(v12, (const UInt8 *)&__dst[14], 8);
            char v20 = v110;
            v110 = v19;
            *(void *)std::string __p = v20;
            ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
            CFArrayRef Mutable = CFDictionaryCreateMutable(v12, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            CFMutableDictionaryRef v22 = theDict;
            CFMutableDictionaryRef theDict = Mutable;
            *(void *)std::string __p = v22;
            ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)__p);
            if (v110) {
              uint64_t v23 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
            }
            else {
              uint64_t v23 = 0;
            }
            if (v23
              && (theDict
                ? (char v24 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get)
                : (char v24 = 0),
                  v24))
            {
              CFDictionarySetValue(theDict, @"Nonce", v110);
              CFDictionarySetValue(a2, @"eUICC,Main", theDict);
              CFDataRef v25 = CFDataCreate(v12, (const UInt8 *)&__dst[16], 8);
              long long v26 = v109;
              v109 = v25;
              *(void *)std::string __p = v26;
              ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
              uint64_t v27 = CFDictionaryCreateMutable(v12, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
              CFMutableDictionaryRef v28 = v106;
              CFMutableDictionaryRef v106 = v27;
              *(void *)std::string __p = v28;
              ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)__p);
              if (v109) {
                uint64_t v29 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
              }
              else {
                uint64_t v29 = 0;
              }
              if (v29
                && (v106
                  ? (uint64_t v30 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get)
                  : (uint64_t v30 = 0),
                    v30))
              {
                CFDictionarySetValue(v106, @"Nonce", v109);
                CFDictionarySetValue(a2, @"eUICC,Gold", v106);
                CFDictionarySetValue(a2, @"@eUICC,Ticket", (const void *)*MEMORY[0x263EFFB40]);
                CFDataRef v31 = CFDataCreate(v12, (const UInt8 *)&__dst[60] + 3, 20);
                CFTypeRef v32 = v108;
                v108 = v31;
                *(void *)std::string __p = v32;
                ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
                if (v108) {
                  int v33 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
                }
                else {
                  int v33 = 0;
                }
                if (v33)
                {
                  CFDictionarySetValue(a2, @"eUICC,RootKeyIdentifier", v108);
                  CFDataRef v34 = CFDataCreate(v12, (const UInt8 *)&__dst[60], 3);
                  int v35 = v107;
                  v107 = v34;
                  *(void *)std::string __p = v35;
                  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
                  if (v107) {
                    uint64_t v36 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
                  }
                  else {
                    uint64_t v36 = 0;
                  }
                  if (v36)
                  {
                    CFDictionarySetValue(a2, @"eUICC,FirmwareLoaderVersion", v107);
                    CFDataRef v37 = CFDataCreate(v12, (const UInt8 *)&__dst[18], 16);
                    uint64_t v38 = v104;
                    v104 = v37;
                    *(void *)std::string __p = v38;
                    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
                    if (v104) {
                      int v39 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
                    }
                    else {
                      int v39 = 0;
                    }
                    if (v39)
                    {
                      CFDictionarySetValue(a2, @"eUICC,MainFwMac", v104);
                      CFDataRef v40 = CFDataCreate(v12, (const UInt8 *)&__dst[36] + 3, 16);
                      uint64_t v41 = v103;
                      v103 = v40;
                      *(void *)std::string __p = v41;
                      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
                      if (v103) {
                        uint64_t v42 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
                      }
                      else {
                        uint64_t v42 = 0;
                      }
                      if (v42)
                      {
                        CFDictionarySetValue(a2, @"eUICC,GoldFwMac", v103);
                        uint64_t v43 = (const void *)MGCopyAnswer();
                        if (v43)
                        {
                          CFDictionarySetValue(a2, @"eUICC,ApProductionMode", v43);
                        }
                        else
                        {
                          gBBULogMaskGet();
                          _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "MobileGestalt returned NULL for SigningFuse", v45, v46, v47, v93);
                        }
                        LODWORD(v44) = 0;
                        goto LABEL_56;
                      }
                      if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
                        _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v90, v91, v92, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
                      }
                      gBBULogMaskGet();
                      uint64_t v56 = "failed to create goldFwMac\n";
                    }
                    else
                    {
                      if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
                        _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v87, v88, v89, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
                      }
                      gBBULogMaskGet();
                      uint64_t v56 = "failed to create mainFwMac\n";
                    }
                  }
                  else
                  {
                    if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
                      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v84, v85, v86, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
                    }
                    gBBULogMaskGet();
                    uint64_t v56 = "failed to create firmwareLoaderVersion\n";
                  }
                }
                else
                {
                  if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
                    _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v81, v82, v83, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
                  }
                  gBBULogMaskGet();
                  uint64_t v56 = "failed to create certIdentifier\n";
                }
              }
              else
              {
                if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
                  _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v57, v58, v59, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
                }
                gBBULogMaskGet();
                uint64_t v56 = "failed to create goldDict\n";
              }
            }
            else
            {
              if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
                _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v50, v51, v52, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
              }
              gBBULogMaskGet();
              uint64_t v56 = "failed to create mainDict\n";
            }
            goto LABEL_121;
          }
          if ((*(unsigned char *)gBBULogMaskGet() & 2) == 0 || gBBULogVerbosity < 6) {
            goto LABEL_104;
          }
        }
        else if ((*(unsigned char *)gBBULogMaskGet() & 2) == 0 || gBBULogVerbosity <= 5)
        {
          goto LABEL_104;
        }
        _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v78, v79, v80, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
LABEL_104:
        gBBULogMaskGet();
        uint64_t v56 = "failed to create euiccCSN\n";
LABEL_121:
        _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", v56, v53, v54, v55, v93);
        goto LABEL_122;
      }
      if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
        _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v72, v73, v74, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
      }
      gBBULogMaskGet();
      char v10 = 0;
      uint64_t v44 = 0xFFFFFFFFLL;
LABEL_93:
      uint64_t v11 = 0;
      _BBULog(0, v44, "VinylController", "", "Fail to create transport: %d\n", v69, v70, v71, v10);
LABEL_122:
      LODWORD(v44) = 1;
      goto LABEL_56;
    }
    if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v66, v67, v68, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
    }
    uint64_t v11 = 0;
    uint64_t v44 = 1;
    if ((*(unsigned char *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity > 0) {
      goto LABEL_93;
    }
  }
  else
  {
    if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v60, v61, v62, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
    }
    uint64_t v11 = 0;
    LODWORD(v44) = 1;
    if ((*(unsigned char *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1)
    {
      uint64_t v11 = 0;
      _BBULog(0, 1, "VinylController", "", "deviceInfoDict passed is NULL:\n", v63, v64, v65, v93);
    }
  }
LABEL_56:
  unsigned int v48 = VinylController::freeTransport((VinylController *)this);
  if (v102 < 0) {
    operator delete(v101);
  }
  if (v100 < 0) {
    operator delete(v99);
  }
  if (v98 < 0) {
    operator delete(v97);
  }
  if (v96 < 0) {
    operator delete(v95[2]);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v103);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v104);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&theDict);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&v106);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v107);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v108);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v109);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v110);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)&v111);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&value);
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 96))(v11);
  }
  if (v48) {
    return v48;
  }
  else {
    return v44;
  }
}

void sub_230AF2758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,const void *a29,const void *a30,const void *a31,const void *a32,const void *a33,const void *a34,const void *a35,const void *a36,const void *a37,const void *a38)
{
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
    char v8 = (uint64_t (*)(char *))*((void *)this + 11);
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

uint64_t VinylController::checkVinylPresence(const void **this, const __CFDictionary *a2, BOOL *a3)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (a2)
  {
    __p[0] = a2;
    ctu::cf::CFSharedRef<__CFDictionary const>::reset(this + 16, (CFTypeRef *)__p);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(&v35, this + 16);
  Options::Options(v36, &v35);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v35);
  gBBULogMaskGet();
  Options::ToString((uint64_t *)__p, (Options *)v36);
  if (v45 >= 0) {
    char v8 = __p;
  }
  else {
    LOBYTE(v8) = __p[0];
  }
  _BBULog(22, 0xFFFFFFFFLL, "VinylController", "", "VinylRestore Options:\n%s\n", v5, v6, v7, (char)v8);
  if (v45 < 0) {
    operator delete(__p[0]);
  }
  if (a3)
  {
    *a3 = 0;
    unsigned int TransportNoEvents = VinylController::createTransportNoEvents((VinylController *)this);
    if (TransportNoEvents)
    {
      if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
        _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v21, v22, v23, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
      }
      char v24 = (unsigned char *)gBBULogMaskGet();
      uint64_t v10 = 0;
      BOOL v12 = 0;
      if ((*v24 & 1) != 0 && gBBULogVerbosity >= 1)
      {
        _BBULog(0, 1, "VinylController", "", "Fail to create transport: %d\n", v25, v26, v27, TransportNoEvents);
        BOOL v12 = 0;
        uint64_t v10 = 0;
      }
    }
    else
    {
      eUICC::VinylFactory::GetValve((eUICC::VinylFactory *)(this + 4), (void *)LODWORD(v36[0]), 0, (eUICC::eUICCVinylICEValve **)__p);
      uint64_t v10 = __p[0];
      if (__p[0])
      {
        (*(void (**)(void **__return_ptr, void *))(*(void *)__p[0] + 8))(__p, __p[0]);
        int v11 = (int)__p[0];
        unsigned int TransportNoEvents = 0;
        BOOL v12 = v11 == ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2);
      }
      else
      {
        if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
          _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v28, v29, v30, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
        }
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "Fail to create transport: %d\n", v31, v32, v33, 0);
        BOOL v12 = 0;
        uint64_t v10 = 0;
        unsigned int TransportNoEvents = 1;
      }
    }
    *a3 = v12;
  }
  else
  {
    if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v15, v16, v17, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
    }
    uint64_t v10 = 0;
    unsigned int TransportNoEvents = 2;
    if ((*(unsigned char *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1)
    {
      _BBULog(0, 1, "VinylController", "", "Invalid input parameter\n", v18, v19, v20, v34);
      uint64_t v10 = 0;
      unsigned int TransportNoEvents = 2;
    }
  }
  unsigned int v13 = VinylController::freeTransport((VinylController *)this);
  if (v43 < 0) {
    operator delete(v42);
  }
  if (v41 < 0) {
    operator delete(v40);
  }
  if (v39 < 0) {
    operator delete(v38);
  }
  if (v37 < 0) {
    operator delete(v36[2]);
  }
  if (v10) {
    (*(void (**)(void *))(*(void *)v10 + 96))(v10);
  }
  if (v13) {
    return v13;
  }
  else {
    return TransportNoEvents;
  }
}

void sub_230AF2FEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
}

uint64_t VinylController::updateFw(VinylController *this, VinylFirmware *a2, VinylFirmware *a3, const __CFDictionary *a4)
{
  eUICCStateMachine::create_default_global(&v37);
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "VinylController", "", "entering VinylController::updateFw\n", v8, v9, v10, v35);
  if (a2 && a3 && a4)
  {
    unsigned int TransportNoEvents = VinylController::createTransportNoEvents(this);
    if (TransportNoEvents)
    {
      if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
        _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v23, v24, v25, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
      }
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "Fail to create transport: %d\n", v26, v27, v28, TransportNoEvents);
    }
    else
    {
      unsigned int TransportNoEvents = eUICCStateMachine::Run(v37, (VinylController *)((char *)this + 32), a2, a3, a4);
      if (TransportNoEvents)
      {
        if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
          _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v29, v30, v31, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
        }
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "Fail to run eUICC state machine: %d\n", v32, v33, v34, TransportNoEvents);
      }
      else
      {
        unsigned int TransportNoEvents = 0;
        if ((*(unsigned char *)(gBBULogMaskGet() + 2) & 0x40) != 0 && gBBULogVerbosity >= 1)
        {
          _BBULog(22, 1, "VinylController", "", "returning VinylController::updateFw\n", v12, v13, v14, v36);
          unsigned int TransportNoEvents = 0;
        }
      }
    }
  }
  else
  {
    if ((*(unsigned char *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6) {
      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v17, v18, v19, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
    }
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "invalid input params", v20, v21, v22, v36);
    unsigned int TransportNoEvents = 2;
  }
  unsigned int v15 = VinylController::freeTransport(this);
  if (v38) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v38);
  }
  if (v15) {
    return v15;
  }
  else {
    return TransportNoEvents;
  }
}

void sub_230AF335C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }
  _Unwind_Resume(exception_object);
}

void *eUICCStateMachine::create_default_global@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (eUICCStateMachine *)operator new(4uLL);
  eUICCStateMachine::eUICCStateMachine(v3);

  return std::shared_ptr<eUICCStateMachine>::shared_ptr[abi:ne180100]<eUICCStateMachine,void>(a1, (uint64_t)v3);
}

void sub_230AF33BC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t VinylController::Refurb(uint64_t a1, int a2, uint64_t a3)
{
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "refurbAction: %d\n", v5, v6, v7, a2);
  uint64_t v8 = 0;
  if ((a2 - 3) >= 2)
  {
    if (a2 == 2)
    {
      uint64_t v9 = *(uint64_t (**)(void))(**(void **)a3 + 24);
    }
    else
    {
      if (a2 != 1)
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "default case\n", v13, v14, v15, v17);
        return 0;
      }
      uint64_t v9 = *(uint64_t (**)(void))(**(void **)a3 + 24);
    }
    uint64_t v8 = v9();
    if (v8)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "Failed to handle Refurb operation, ret %d\n", v10, v11, v12, v8);
    }
  }
  return v8;
}

uint64_t VinylController::operationRequested(uint64_t a1, int a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 4))
  {
    pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
    uint64_t v5 = (BBUCapabilities *)xmmword_26870BC08;
    if (!(void)xmmword_26870BC08)
    {
      BBUCapabilities::create_default_global(&v17);
      long long v6 = v17;
      long long v17 = 0uLL;
      uint64_t v7 = (std::__shared_weak_count *)*((void *)&xmmword_26870BC08 + 1);
      xmmword_26870BC08 = v6;
      if (v7)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v7);
        if (*((void *)&v17 + 1)) {
          std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v17 + 1));
        }
      }
      uint64_t v5 = (BBUCapabilities *)xmmword_26870BC08;
    }
    uint64_t v8 = (std::__shared_weak_count *)*((void *)&xmmword_26870BC08 + 1);
    if (*((void *)&xmmword_26870BC08 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_26870BC08 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
    if (BBUCapabilities::supportsEuiccViaEOS(v5))
    {
      uint64_t v9 = 1;
    }
    else
    {
      pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
      uint64_t v10 = (BBUCapabilities *)xmmword_26870BC08;
      if (!(void)xmmword_26870BC08)
      {
        BBUCapabilities::create_default_global(&v17);
        long long v11 = v17;
        long long v17 = 0uLL;
        uint64_t v12 = (std::__shared_weak_count *)*((void *)&xmmword_26870BC08 + 1);
        xmmword_26870BC08 = v11;
        if (v12)
        {
          std::__shared_weak_count::__release_shared[abi:ne180100](v12);
          if (*((void *)&v17 + 1)) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v17 + 1));
          }
        }
        uint64_t v10 = (BBUCapabilities *)xmmword_26870BC08;
      }
      uint64_t v13 = (std::__shared_weak_count *)*((void *)&xmmword_26870BC08 + 1);
      if (*((void *)&xmmword_26870BC08 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_26870BC08 + 1) + 8), 1uLL, memory_order_relaxed);
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

void sub_230AF36F8(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(a1);
}

void VinylController::~VinylController(const void **this)
{
  VinylController::~VinylController(this);

  operator delete(v1);
}

{
  void *v2;
  const void *v3;

  *this = &unk_26E556498;
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

void *std::shared_ptr<eUICCStateMachine>::shared_ptr[abi:ne180100]<eUICCStateMachine,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = operator new(0x20uLL);
  void *v4 = &unk_26E5564C8;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_230AF37F8(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<eUICCStateMachine *,std::shared_ptr<eUICCStateMachine>::__shared_ptr_default_delete<eUICCStateMachine,eUICCStateMachine>,std::allocator<eUICCStateMachine>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<eUICCStateMachine *,std::shared_ptr<eUICCStateMachine>::__shared_ptr_default_delete<eUICCStateMachine,eUICCStateMachine>,std::allocator<eUICCStateMachine>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  if (v1) {
    operator delete(v1);
  }
}

uint64_t std::__shared_ptr_pointer<eUICCStateMachine *,std::shared_ptr<eUICCStateMachine>::__shared_ptr_default_delete<eUICCStateMachine,eUICCStateMachine>,std::allocator<eUICCStateMachine>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t __cxx_global_var_init_6()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_230AD4000);
  }
  return result;
}

uint64_t __cxx_global_var_init_80()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_230AD4000);
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
      uint64_t v8 = operator new(0x38uLL);
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
    uint64_t v8 = operator new(0x40uLL);
    VinylICECommunication::VinylICECommunication((uint64_t)v8, a1, a2);
  }
  return v8;
}

void sub_230AF3A7C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t VinylCommunication::VinylCommunication(uint64_t result, int a2, uint64_t a3)
{
  *(void *)uint64_t result = &unk_26E556540;
  *(_DWORD *)(result + 8) = a2;
  *(void *)(result + 16) = a3;
  return result;
}

uint64_t VinylEURCommunication::VinylEURCommunication(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = a2;
  *(void *)a1 = &unk_26E556018;
  *(void *)(a1 + 24) = dispatch_queue_create("com.apple.VinylCommunication", 0);
  *(void *)(a1 + 32) = dispatch_queue_create("com.apple.VinylStatuscallback", 0);
  *(void *)(a1 + 4pthread_mutex_init(this, 0) = 0;
  *(_DWORD *)(a1 + 48) = 34;
  return a1;
}

uint64_t VinylICECommunication::VinylICECommunication(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = a3;
  *(void *)a1 = &unk_26E556280;
  *(unsigned char *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = dispatch_queue_create("com.apple.VinylCommunication", 0);
  *(void *)(a1 + 4pthread_mutex_init(this, 0) = dispatch_queue_create("com.apple.VinylStatuscallback", 0);
  *(void *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 34;
  return a1;
}

uint64_t *ReverseProxyGetSettings@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3002000000;
  v42[3] = __Block_byref_object_copy__0;
  void v42[4] = __Block_byref_object_dispose__0;
  uint64_t v4 = (char *)operator new(0x90uLL);
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *((void *)v4 + 3) = 850045863;
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *((_OWORD *)v4 + 4) = 0u;
  *((void *)v4 + 1pthread_mutex_init(this, 0) = 0;
  *((void *)v4 + 11) = 1018212795;
  *((_OWORD *)v4 + 6) = 0u;
  *((_OWORD *)v4 + 7) = 0u;
  *(_OWORD *)(v4 + 124) = 0u;
  *(void *)uint64_t v4 = &unk_26E556590;
  char v43 = v4;
  char v41 = (std::__assoc_sub_state *)v4;
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
      ? (uint64_t v11 = ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::get)
      : (uint64_t v11 = 0),
        !v11))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Condition <<%s>> failed %s %s/%d\n", v19, v20, v21, (char)"!url.empty() && urlRef");
    gBBULogMaskGet();
    uint64_t v25 = "NULL requestURL?\n";
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
    uint64_t v25 = "Failed to get PRP\n";
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

void sub_230AF40F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,const void *a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
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

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4pthread_mutex_init(this, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4pthread_mutex_init(this, 0) = 0;
  return result;
}

uint64_t *__Block_byref_object_dispose__0(uint64_t a1)
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

void sub_230AF4350(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::future<std::shared_ptr<ctu::Http::HttpResponse>>::get(v1);
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
        MEMORY[0x230FC7BD0](v6, 4, v4);
        std::make_exception_ptr[abi:ne180100]<std::future_error>(v6);
      }
    }
    if (!atomic_fetch_add((atomic_ullong *volatile)(v2 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
      (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
    }
  }
  return a1;
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
  *(unsigned char *)(a1 + 14pthread_mutex_init(this, 0) = *a2;
  *(_DWORD *)(a1 + 136) |= 5u;
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 88));
  std::mutex::unlock(v4);
}

void sub_230AF4618(_Unwind_Exception *a1)
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

void sub_230AF4830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, char a12)
{
  if (a12) {
    std::mutex::unlock(a11);
  }
  _Unwind_Resume(a1);
}

void getVinylTatsuTagToFileNameMap(uint64_t a1@<X8>)
{
  v5[3] = *MEMORY[0x263EF8340];
  std::exception_ptr v3 = @"eUICC,Gold";
  std::string::basic_string[abi:ne180100]<0>(v4, "euig");
  v4[3] = @"eUICC,Main";
  std::string::basic_string[abi:ne180100]<0>(v5, "euim");
  std::map<__CFString const*,std::string>::map[abi:ne180100](a1, (unint64_t *)&v3, 2);
  for (uint64_t i = 0; i != -8; i -= 4)
  {
    if (SHIBYTE(v5[i + 2]) < 0) {
      operator delete((void *)v5[i]);
    }
  }
}

void sub_230AF4930(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  uint64_t v18 = 0;
  while (1)
  {
    if (*(char *)(v16 + v18 + 63) < 0) {
      operator delete(*(void **)(v16 + v18 + 40));
    }
    v18 -= 32;
    if (v18 == -64) {
      _Unwind_Resume(exception_object);
    }
  }
}

uint64_t std::map<__CFString const*,std::string>::map[abi:ne180100](uint64_t a1, unint64_t *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  std::exception_ptr v4 = (void *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 32 * a3;
    do
    {
      std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__emplace_hint_unique_key_args<__CFString const*,std::pair<__CFString const* const,std::string> const&>((uint64_t **)a1, v4, a2, (uint64_t)a2);
      a2 += 4;
      v6 -= 32;
    }
    while (v6);
  }
  return a1;
}

void sub_230AF49E8(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__emplace_hint_unique_key_args<__CFString const*,std::pair<__CFString const* const,std::string> const&>(uint64_t **a1, void *a2, unint64_t *a3, uint64_t a4)
{
  uint64_t v6 = (uint64_t **)std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__find_equal<__CFString const*>(a1, a2, &v10, &v9, a3);
  uint64_t result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__construct_node<std::pair<__CFString const* const,std::string> const&>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__insert_node_at(a1, v10, v6, v8);
    return v8;
  }
  return result;
}

void *std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__find_equal<__CFString const*>(void *a1, void *a2, void *a3, void *a4, unint64_t *a5)
{
  std::exception_ptr v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, unint64_t v7 = a2[4], *a5 < v7))
  {
    uint64_t v8 = *a2;
    if ((void *)*a1 == a2)
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
      uint64_t v9 = (void *)*a2;
      do
      {
        uint64_t v10 = v9;
        uint64_t v9 = (void *)v9[1];
      }
      while (v9);
    }
    else
    {
      std::unique_lock<std::mutex> v13 = a2;
      do
      {
        uint64_t v10 = (void *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        std::unique_lock<std::mutex> v13 = v10;
      }
      while (v14);
    }
    unint64_t v15 = *a5;
    if (v10[4] < *a5) {
      goto LABEL_17;
    }
    uint64_t v16 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v17 = v16;
          unint64_t v18 = v16[4];
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = (void *)*v17;
          std::exception_ptr v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        std::exception_ptr v5 = v17 + 1;
        uint64_t v16 = (void *)v17[1];
      }
      while (v16);
    }
    else
    {
      uint64_t v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    char v12 = (void *)a2[1];
    do
    {
      a4 = v12;
      char v12 = (void *)*v12;
    }
    while (v12);
  }
  else
  {
    uint64_t v19 = a2;
    do
    {
      a4 = (void *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      uint64_t v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= a4[4])
  {
    uint64_t v20 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v21 = v20;
          unint64_t v22 = v20[4];
          if (v6 >= v22) {
            break;
          }
          uint64_t v20 = (void *)*v21;
          std::exception_ptr v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        std::exception_ptr v5 = v21 + 1;
        uint64_t v20 = (void *)v21[1];
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

void std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__construct_node<std::pair<__CFString const* const,std::string> const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  unint64_t v6 = (char *)operator new(0x40uLL);
  *(void *)(a3 + 8) = v5;
  *(void *)a3 = v6;
  *(unsigned char *)(a3 + 16) = 0;
  *((void *)v6 + 4) = *(void *)a2;
  unint64_t v7 = (std::string *)(v6 + 40);
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)(a2 + 8), *(void *)(a2 + 16));
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)(a2 + 8);
    v7->__r_.__value_.__r.__words[2] = *(void *)(a2 + 24);
  }
  *(unsigned char *)(a3 + 16) = 1;
}

void sub_230AF4CBC(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<__CFString const*,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<__CFString const*,std::string>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
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

void VinylTransport::createTransport(uint64_t *a1@<X0>, uint64_t a2@<X1>, ACFUTransport **a3@<X8>)
{
  unint64_t v6 = (ACFUTransport *)operator new(0x28uLL);
  ACFUTransport::ACFUTransport(v6);
  *(void *)unint64_t v6 = &unk_26E5565D8;
  *a3 = v6;
  uint64_t v7 = *a1;
  uint64_t v8 = (std::__shared_weak_count *)a1[1];
  v12[0] = v7;
  v12[1] = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = (ACFULogging *)VinylTransport::init((uint64_t)v6, (uint64_t)v12, a2);
  char v10 = (char)v9;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  if ((v10 & 1) == 0)
  {
    ACFULogging::getLogInstance(v9);
    ACFULogging::handleMessage();
    *a3 = 0;
    uint64_t v11 = *(void (**)(ACFUTransport *))(*(void *)v6 + 64);
    v11(v6);
  }
}

void sub_230AF4E50(_Unwind_Exception *a1)
{
  void *v2 = 0;
  (*(void (**)(uint64_t))(*(void *)v1 + 64))(v1);
  _Unwind_Resume(a1);
}

void VinylTransport::VinylTransport(VinylTransport *this)
{
  ACFUTransport::ACFUTransport(this);
  void *v1 = &unk_26E5565D8;
}

uint64_t VinylTransport::init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 24) = a3;
  if (*(void *)a2)
  {
    *(void *)(a1 + 32) = ACFUDiagnostics::copyDiagnosticsPath(*(ACFUDiagnostics **)a2);
    AMSupportSafeRetain();
    AMSupportSafeRetain();
    std::exception_ptr v4 = *(std::__shared_weak_count **)(a2 + 8);
    uint64_t v7 = v4;
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v5 = ACFUTransport::init();
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }
  else
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    return 0;
  }
  return v5;
}

void sub_230AF4F98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t VinylTransport::getBoardParameters@<X0>(VinylTransport *this@<X0>, uint64_t a2@<X8>)
{
  ACFULogging::getLogInstance(this);
  uint64_t result = ACFULogging::handleMessage();
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 16) = 2;
  return result;
}

ACFULogging *VinylTransport::getPersoParameters@<X0>(const __CFDictionary **this@<X0>, uint64_t a2@<X8>)
{
  CFArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable || (uint64_t v5 = (const void **)VinylController::create(0, 0)) == 0)
  {
    ACFULogging::getLogInstance(0);
LABEL_9:
    uint64_t result = (ACFULogging *)ACFULogging::handleMessage();
    char v16 = 0;
    goto LABEL_5;
  }
  uint64_t v6 = (uint64_t)v5;
  int ParamUpdateOperation = VinylController::getParamUpdateOperation(v5, Mutable, this[3]);
  uint64_t result = (ACFULogging *)VinylControllerObjDestroy(v6, v8, v9, v10, v11, v12, v13, v14, v17);
  if (ParamUpdateOperation)
  {
    ACFULogging::getLogInstance(result);
    goto LABEL_9;
  }
  char v16 = 1;
LABEL_5:
  *(void *)a2 = Mutable;
  *(unsigned char *)(a2 + 8) = v16;
  return result;
}

BOOL VinylTransport::checkVinylPresence(const __CFDictionary **this)
{
  BOOL v15 = 0;
  uint64_t v2 = (const void **)VinylController::create(0, 0);
  if (!v2)
  {
    ACFULogging::getLogInstance(0);
LABEL_7:
    ACFULogging::handleMessage();
    return 0;
  }
  uint64_t v3 = (uint64_t)v2;
  int v4 = VinylController::checkVinylPresence(v2, this[3], &v15);
  uint64_t v12 = (ACFULogging *)VinylControllerObjDestroy(v3, v5, v6, v7, v8, v9, v10, v11, v14);
  if (v4)
  {
    ACFULogging::getLogInstance(v12);
    goto LABEL_7;
  }
  return v15;
}

uint64_t VinylTransport::createGoldFw(VinylTransport *this, CFDictionaryRef theDict, VinylFirmware **a3)
{
  std::string v46 = 0;
  CFDictionaryRef v47 = 0;
  CFErrorRef error = 0;
  CFDictionaryRef Value = (ACFULogging *)CFDictionaryGetValue(theDict, @"eUICC,Ticket");
  CFDataRef v6 = Value;
  if (!Value || (CFTypeID v7 = CFGetTypeID(Value), Value = (ACFULogging *)CFDataGetTypeID(), (ACFULogging *)v7 != Value))
  {
    ACFULogging::getLogInstance(Value);
LABEL_46:
    ACFULogging::handleMessage();
LABEL_47:
    uint64_t v35 = 1;
    goto LABEL_34;
  }
  ACFULogging::getLogInstance(Value);
  std::string::basic_string[abi:ne180100]<0>(&v41, "VinylTransport");
  uint64_t v8 = std::string::append(&v41, "::");
  long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v42.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  uint64_t v10 = std::string::append(&v42, "createGoldFw");
  long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  std::string::size_type v44 = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v44) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v42.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v41.__r_.__value_.__l.__data_);
  }
  CFDataRef v12 = (const __CFData *)CFDictionaryGetValue(theDict, @"FirmwareData");
  if (!v12)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_46;
  }
  CFPropertyListRef v13 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], v12, 0, 0, &error);
  char v14 = v46;
  std::string v46 = (void *)v13;
  __p[0] = v14;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
  CFTypeID TypeID = (ACFULogging *)v46;
  if (v46) {
    char v16 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  }
  else {
    char v16 = 0;
  }
  if (!v16 || (CFTypeID v17 = CFGetTypeID(v46), TypeID = (ACFULogging *)CFDictionaryGetTypeID(), (ACFULogging *)v17 != TypeID))
  {
    ACFULogging::getLogInstance(TypeID);
    std::string::basic_string[abi:ne180100]<0>(&v41, "VinylTransport");
    char v37 = std::string::append(&v41, "::");
    long long v38 = *(_OWORD *)&v37->__r_.__value_.__l.__data_;
    v42.__r_.__value_.__r.__words[2] = v37->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v38;
    v37->__r_.__value_.__l.__size_ = 0;
    v37->__r_.__value_.__r.__words[2] = 0;
    v37->__r_.__value_.__r.__words[0] = 0;
    std::string v39 = std::string::append(&v42, "createGoldFw");
    long long v40 = *(_OWORD *)&v39->__r_.__value_.__l.__data_;
    std::string::size_type v44 = v39->__r_.__value_.__r.__words[2];
    *(_OWORD *)std::string __p = v40;
    v39->__r_.__value_.__l.__size_ = 0;
    v39->__r_.__value_.__r.__words[2] = 0;
    v39->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType();
    if (SHIBYTE(v44) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v42.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v41.__r_.__value_.__l.__data_);
    }
    goto LABEL_47;
  }
  v42.__r_.__value_.__r.__words[0] = (std::string::size_type)v46;
  ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(__p, (CFTypeRef *)&v42.__r_.__value_.__l.__data_);
  CFDictionaryRef v18 = v47;
  CFDictionaryRef v47 = (const __CFDictionary *)__p[0];
  __p[0] = v18;
  uint64_t v19 = (ACFULogging *)ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)__p);
  if (v47) {
    uint64_t v20 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    uint64_t v20 = 0;
  }
  if (!v20) {
    goto LABEL_45;
  }
  ACFULogging::getLogInstance(v19);
  std::string::basic_string[abi:ne180100]<0>(&v41, "VinylTransport");
  uint64_t v21 = std::string::append(&v41, "::");
  long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  v42.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  uint64_t v23 = std::string::append(&v42, "createGoldFw");
  long long v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
  std::string::size_type v44 = v23->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v24;
  v23->__r_.__value_.__l.__size_ = 0;
  v23->__r_.__value_.__r.__words[2] = 0;
  v23->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v44) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v42.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v41.__r_.__value_.__l.__data_);
  }
  uint64_t v19 = (ACFULogging *)CFDictionaryGetValue(v47, @"eUICC,Im4pGold");
  CFDataRef v25 = v19;
  if (!v19) {
    goto LABEL_45;
  }
  CFTypeID v26 = CFGetTypeID(v19);
  uint64_t v19 = (ACFULogging *)CFDataGetTypeID();
  if ((ACFULogging *)v26 != v19) {
    goto LABEL_45;
  }
  uint64_t v19 = (ACFULogging *)CFDictionaryGetValue(v47, @"eUICC,InfoPlistDataGold");
  CFDataRef v27 = v19;
  if (!v19) {
    goto LABEL_45;
  }
  CFTypeID v28 = CFGetTypeID(v19);
  uint64_t v19 = (ACFULogging *)CFDataGetTypeID();
  if ((ACFULogging *)v28 != v19) {
    goto LABEL_45;
  }
  uint64_t v19 = (ACFULogging *)CFDictionaryGetValue(v47, @"eUICC,ProfileDataGold");
  CFDataRef v29 = v19;
  if (!v19
    || (v30 = CFGetTypeID(v19), uint64_t v19 = (ACFULogging *)CFDataGetTypeID(), (ACFULogging *)v30 != v19)
    || (uint64_t v19 = (ACFULogging *)CFDictionaryGetValue(v47, @"eUICC,Gold"), (v31 = v19) == 0)
    || (v32 = CFGetTypeID(v19), uint64_t v19 = (ACFULogging *)CFDataGetTypeID(), (ACFULogging *)v32 != v19))
  {
LABEL_45:
    ACFULogging::getLogInstance(v19);
    goto LABEL_46;
  }
  uint64_t v33 = (__CFData *)CFDictionaryGetValue(v47, @"eUICC,GoldRecoveryFw");
  uint64_t v34 = VinylFirmwareCreate(v31, v33, v25, v27, v29, v6);
  uint64_t v35 = 0;
  *a3 = v34;
LABEL_34:
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v46);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v47);
  return v35;
}

void sub_230AF5754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v30 - 80));
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)(v30 - 72));
  _Unwind_Resume(a1);
}

uint64_t VinylTransport::createMainFw(VinylTransport *this, CFDictionaryRef theDict, VinylFirmware **a3)
{
  std::string v42 = 0;
  CFDictionaryRef v43 = 0;
  CFErrorRef error = 0;
  CFDictionaryRef Value = (ACFULogging *)CFDictionaryGetValue(theDict, @"eUICC,Ticket");
  CFDataRef v6 = Value;
  if (!Value || (CFTypeID v7 = CFGetTypeID(Value), Value = (ACFULogging *)CFDataGetTypeID(), (ACFULogging *)v7 != Value))
  {
    ACFULogging::getLogInstance(Value);
LABEL_41:
    ACFULogging::handleMessage();
LABEL_42:
    uint64_t v31 = 1;
    goto LABEL_28;
  }
  ACFULogging::getLogInstance(Value);
  std::string::basic_string[abi:ne180100]<0>(&v37, "VinylTransport");
  uint64_t v8 = std::string::append(&v37, "::");
  long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  uint64_t v10 = std::string::append(&v38, "createMainFw");
  long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  std::string::size_type v40 = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v40) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v38.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }
  CFDataRef v12 = (const __CFData *)CFDictionaryGetValue(theDict, @"FirmwareData");
  if (!v12)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_41;
  }
  CFPropertyListRef v13 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], v12, 0, 0, &error);
  char v14 = v42;
  std::string v42 = (void *)v13;
  __p[0] = v14;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
  CFTypeID TypeID = (ACFULogging *)v42;
  if (v42) {
    char v16 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  }
  else {
    char v16 = 0;
  }
  if (!v16 || (CFTypeID v17 = CFGetTypeID(v42), TypeID = (ACFULogging *)CFDictionaryGetTypeID(), (ACFULogging *)v17 != TypeID))
  {
    ACFULogging::getLogInstance(TypeID);
    std::string::basic_string[abi:ne180100]<0>(&v37, "VinylTransport");
    uint64_t v33 = std::string::append(&v37, "::");
    long long v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
    v38.__r_.__value_.__r.__words[2] = v33->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v34;
    v33->__r_.__value_.__l.__size_ = 0;
    v33->__r_.__value_.__r.__words[2] = 0;
    v33->__r_.__value_.__r.__words[0] = 0;
    uint64_t v35 = std::string::append(&v38, "createMainFw");
    long long v36 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
    std::string::size_type v40 = v35->__r_.__value_.__r.__words[2];
    *(_OWORD *)std::string __p = v36;
    v35->__r_.__value_.__l.__size_ = 0;
    v35->__r_.__value_.__r.__words[2] = 0;
    v35->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType();
    if (SHIBYTE(v40) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v38.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v37.__r_.__value_.__l.__data_);
    }
    goto LABEL_42;
  }
  v38.__r_.__value_.__r.__words[0] = (std::string::size_type)v42;
  ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(__p, (CFTypeRef *)&v38.__r_.__value_.__l.__data_);
  CFDictionaryRef v18 = v43;
  CFDictionaryRef v43 = (const __CFDictionary *)__p[0];
  __p[0] = v18;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)__p);
  CFDataRef v19 = v43;
  if (v43) {
    uint64_t v20 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    uint64_t v20 = 0;
  }
  if (!v20) {
    goto LABEL_40;
  }
  CFDataRef v19 = (const __CFData *)CFDictionaryGetValue(v43, @"eUICC,Im4pMain");
  CFDataRef v21 = v19;
  if (!v19) {
    goto LABEL_40;
  }
  CFTypeID v22 = CFGetTypeID(v19);
  CFDataRef v19 = (const __CFData *)CFDataGetTypeID();
  if ((const __CFData *)v22 != v19) {
    goto LABEL_40;
  }
  CFDataRef v19 = (const __CFData *)CFDictionaryGetValue(v43, @"eUICC,InfoPlistDataMain");
  CFDataRef v23 = v19;
  if (!v19) {
    goto LABEL_40;
  }
  CFTypeID v24 = CFGetTypeID(v19);
  CFDataRef v19 = (const __CFData *)CFDataGetTypeID();
  if ((const __CFData *)v24 != v19) {
    goto LABEL_40;
  }
  CFDataRef v19 = (const __CFData *)CFDictionaryGetValue(v43, @"eUICC,ProfileDataMain");
  CFDataRef v25 = v19;
  if (!v19
    || (v26 = CFGetTypeID(v19), CFDataRef v19 = (const __CFData *)CFDataGetTypeID(), (const __CFData *)v26 != v19)
    || (CFDataRef v19 = (const __CFData *)CFDictionaryGetValue(v43, @"eUICC,Main"), (v27 = v19) == 0)
    || (v28 = CFGetTypeID(v19), CFDataRef v19 = (const __CFData *)CFDataGetTypeID(), (const __CFData *)v28 != v19))
  {
LABEL_40:
    ACFULogging::getLogInstance(v19);
    goto LABEL_41;
  }
  CFDataRef v29 = (__CFData *)CFDictionaryGetValue(v43, @"eUICC,MainRecoveryFw");
  uint64_t v30 = VinylFirmwareCreate(v27, v29, v21, v23, v25, v6);
  uint64_t v31 = 0;
  *a3 = v30;
LABEL_28:
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v42);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v43);
  return v31;
}

void sub_230AF5CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v30 - 80));
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)(v30 - 72));
  _Unwind_Resume(a1);
}

ACFULogging *VinylTransport::updateFw(const __CFDictionary **this, const __CFDictionary *a2)
{
  CFDataRef v21 = 0;
  CFTypeID v22 = 0;
  int v4 = (ACFULogging *)VinylTransport::createGoldFw((VinylTransport *)this, a2, &v21);
  uint64_t v5 = v4;
  if (v4
    || (CFDataRef v6 = v21) == 0
    || (v4 = (ACFULogging *)VinylTransport::createMainFw(v4, a2, &v22), uint64_t v5 = v4, v4)
    || (CFTypeID v7 = v22) == 0)
  {
    ACFULogging::getLogInstance(v4);
    ACFULogging::handleMessage();
    return v5;
  }
  uint64_t v8 = (VinylController *)VinylController::create(0, 0);
  if (!v8)
  {
    ACFULogging::getLogInstance(0);
LABEL_12:
    ACFULogging::handleMessage();
    return (ACFULogging *)1;
  }
  uint64_t v9 = (uint64_t)v8;
  int updated = VinylController::updateFw(v8, v6, v7, this[3]);
  CFDictionaryRef v18 = (ACFULogging *)VinylControllerObjDestroy(v9, v11, v12, v13, v14, v15, v16, v17, v20);
  if (updated)
  {
    ACFULogging::getLogInstance(v18);
    goto LABEL_12;
  }
  return 0;
}

uint64_t VinylTransport::setNonce(VinylTransport *this, void *a2)
{
  return 2;
}

uint64_t VinylTransport::pushFirmware(ACFULogging *a1)
{
  return 2;
}

uint64_t VinylTransport::pingCheck(VinylTransport *this)
{
  return 2;
}

uint64_t VinylTransport::reset(VinylTransport *this)
{
  return 2;
}

uint64_t VinylTransport::getDebugInfo(const __CFDictionary ***a1, uint64_t a2, int a3)
{
  if (a3)
  {
    CFTypeRef cf = 0;
    char v3 = BBUpdaterCommon::collectCoreDump((BBUpdaterCommon *)&cf, a1[4], (const __CFString *)1);
    a1 = (const __CFDictionary ***)cf;
    if (cf) {
      CFRelease(cf);
    }
    if (v3) {
      return 0;
    }
  }
  ACFULogging::getLogInstance((ACFULogging *)a1);
  ACFULogging::handleMessage();
  return 1;
}

void VinylTransport::~VinylTransport(VinylTransport *this)
{
  *(void *)this = &unk_26E5565D8;
  uint64_t v2 = (const void *)*((void *)this + 3);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 3) = 0;
  }
  char v3 = (void *)*((void *)this + 4);
  if (v3)
  {
    CFRelease(v3);
    *((void *)this + 4) = 0;
  }
  ACFULogging::getLogInstance((ACFULogging *)v3);
  ACFULogging::handleMessage();

  MEMORY[0x270F0D368](this);
}

{
  void *v1;
  uint64_t vars8;

  VinylTransport::~VinylTransport(this);

  operator delete(v1);
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

void *vinyl_zipOpen2(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  int v4 = v3;
  int v6 = v5;
  uint64_t v7 = v1;
  uint64_t v67 = *MEMORY[0x263EF8340];
  memset(__src, 0, 512);
  if (v2)
  {
    long long v8 = v2[1];
    __src[0] = *v2;
    __src[1] = v8;
    long long v9 = v2[3];
    __src[2] = v2[2];
    __src[3] = v9;
  }
  else
  {
    vinyl_fill_fopen_filefunc((FILE *(**)(int, void *, int, size_t))__src);
  }
  if (v6) {
    uint64_t v10 = 7;
  }
  else {
    uint64_t v10 = 11;
  }
  uint64_t v11 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))&__src[0])(*((void *)&__src[3] + 1), v7, v10, 1000);
  *(void *)&__src[4] = v11;
  if (!v11) {
    return 0;
  }
  *(void *)&__src[1044] = (*((uint64_t (**)(void, uint64_t))&__src[1] + 1))(*((void *)&__src[3] + 1), v11);
  LODWORD(__src[13]) = 0;
  uint64_t v12 = malloc(0x4160uLL);
  *(_OWORD *)((char *)&__src[4] + 8) = 0u;
  DWORD2(__src[5]) = 0;
  *(_OWORD *)((char *)&__src[1044] + 8) = 0u;
  if (!v12)
  {
    (*((void (**)(void, void))&__src[2] + 1))(*((void *)&__src[3] + 1), *(void *)&__src[4]);
    return v12;
  }
  *((void *)&__src[1045] + 1) = 0;
  if (v6 == 2)
  {
    uint64_t v49 = v4;
    uint64_t v64 = 0;
    unint64_t v65 = 0;
    uint64_t v61 = 0;
    uint64_t v62 = 0;
    uint64_t v59 = 0;
    uint64_t v60 = 0;
    uint64_t v58 = 0;
    uint64_t v13 = *(void *)&__src[4];
    if (!(*(uint64_t (**)(void, void, void, uint64_t))&__src[2])(*((void *)&__src[3] + 1), *(void *)&__src[4], 0, 2))
    {
      unint64_t v14 = (*((uint64_t (**)(void, uint64_t))&__src[1] + 1))(*((void *)&__src[3] + 1), v13);
      unint64_t v56 = v14;
      if (v14 >= 0xFFFF) {
        unint64_t v15 = 0xFFFFLL;
      }
      else {
        unint64_t v15 = v14;
      }
      uint64_t v16 = (char *)malloc(0x404uLL);
      uint64_t v17 = v16;
      if (!v16) {
        goto LABEL_50;
      }
      if (v15 >= 5)
      {
        CFDictionaryRef v18 = v16 + 1;
        uint64_t v19 = 4;
        do
        {
          unint64_t v20 = v19 + 1024;
          unint64_t v21 = v19 + 1024 >= v15 ? v15 : v19 + 1024;
          unint64_t v22 = v21 >= 0x404 ? 1028 : v21;
          if ((*(uint64_t (**)(void, uint64_t, unint64_t, void))&__src[2])(*((void *)&__src[3] + 1), v13, v56 - v21, 0)|| (*((uint64_t (**)(void, uint64_t, unsigned char *, unint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), v13, v17, v22) != v22)
          {
            break;
          }
          if (v22 >= 4)
          {
            uint64_t v23 = (v22 - 4);
            while (v17[v23] != 80 || v18[v23] != 75 || v18[v23 + 1] != 5 || v18[v23 + 2] != 6)
            {
              if (v23-- <= 0) {
                goto LABEL_33;
              }
            }
            if (v56 - v21 + v23)
            {
              free(v17);
              unint64_t v25 = v19 + 1024;
              if (v56 < v19 + 1024) {
                unint64_t v25 = v56;
              }
              if (v25 >= 0xFFFF) {
                unint64_t v25 = 0xFFFFLL;
              }
              uint64_t v17 = (unsigned char *)(v56 - v25 + v23);
              int v55 = 1;
              goto LABEL_51;
            }
          }
LABEL_33:
          uint64_t v19 = v21;
        }
        while (v15 > v20);
      }
      free(v17);
    }
    uint64_t v17 = 0;
LABEL_50:
    int v55 = 0;
LABEL_51:
    uint64_t v50 = (*(uint64_t (**)(void, void, unsigned char *, void))&__src[2])(*((void *)&__src[3] + 1), *(void *)&__src[4], v17, 0);
    int Long = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], &v63);
    int Short = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v62);
    int v53 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v61);
    int v54 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v60);
    int v27 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v59);
    uint64_t v28 = v60;
    uint64_t v57 = v59;
    uint64_t v30 = v61;
    uint64_t v29 = v62;
    int v31 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], (uint64_t *)&v65);
    int v32 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], &v64);
    int v33 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v58);
    uint64_t v35 = v64;
    unint64_t v34 = v65;
    BOOL v36 = (unint64_t)v17 >= v65 + v64;
    std::string v37 = &v17[-v65 - v64];
    if (!v36 || v33 || v32 || v31 || v57 != v28 || v30 || v29 || !v55 || v27 || v54 || v53 || Short || Long || v50)
    {
      (*((void (**)(void, void))&__src[2] + 1))(*((void *)&__src[3] + 1), *(void *)&__src[4]);
LABEL_82:
      free(v12);
      return 0;
    }
    uint64_t v38 = v58;
    if (v58)
    {
      std::string v39 = malloc(v58 + 1);
      *((void *)&__src[1045] + 1) = v39;
      if (v39)
      {
        uint64_t v40 = (*((uint64_t (**)(void, void, void *, uint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), *(void *)&__src[4], v39, v38);
        *(unsigned char *)(*((void *)&__src[1045] + 1) + v4pthread_mutex_init(this, 0) = 0;
      }
    }
    *((void *)&__src[1044] + 1) = v37;
    std::string v41 = (char *)malloc(0xFF0uLL);
    std::string v42 = v37;
    CFDictionaryRef v43 = &v37[v35];
    uint64_t v44 = (*(uint64_t (**)(void, void, char *, void))&__src[2])(*((void *)&__src[3] + 1), *(void *)&__src[4], &v37[v35], 0);
    if (v44) {
      int v45 = -1;
    }
    else {
      int v45 = 0;
    }
    if (v34 && !v44)
    {
      while (1)
      {
        unint64_t v46 = v34 >= 0xFF0 ? 4080 : v34;
        if ((*((uint64_t (**)(void, void, char *, unint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), *(void *)&__src[4], v41, v46) != v46)break; {
        int v47 = add_data_in_datablock((void *)&__src[4] + 1, v41, v46);
        }
        int v45 = v47;
        v34 -= v46;
        if (!v34 || v47) {
          goto LABEL_86;
        }
      }
      int v45 = -1;
    }
LABEL_86:
    if (v41) {
      free(v41);
    }
    *(void *)&__src[1044] = v42;
    *(void *)&__src[1045] = v57;
    if ((*(uint64_t (**)(void, void, char *, void))&__src[2])(*((void *)&__src[3] + 1), *(void *)&__src[4], v43, 0))
    {
      int v26 = -1;
    }
    else
    {
      int v26 = v45;
    }
    int v4 = v49;
    if (!v49) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
  int v26 = 0;
  if (v4) {
LABEL_43:
  }
    void *v4 = *((void *)&__src[1045] + 1);
LABEL_44:
  if (v26)
  {
    if (*((void *)&__src[1045] + 1)) {
      free(*((void **)&__src[1045] + 1));
    }
    goto LABEL_82;
  }
  memcpy(v12, __src, 0x4160uLL);
  return v12;
}

uint64_t add_data_in_datablock(void *a1, char *a2, unint64_t a3)
{
  if (!a1) {
    return 4294967192;
  }
  unint64_t v3 = a3;
  int v6 = (void *)a1[1];
  if (v6)
  {
    if (!a3) {
      return 0;
    }
  }
  else
  {
    long long v8 = (char *)malloc(0x1010uLL);
    if (!v8)
    {
      *a1 = 0;
      a1[1] = 0;
      return 4294967192;
    }
    int v6 = v8;
    *(void *)long long v8 = 0;
    *(_OWORD *)(v8 + 8) = xmmword_230B07010;
    *a1 = v8;
    a1[1] = v8;
    if (!v3) {
      return 0;
    }
  }
  unint64_t v9 = v6[1];
  while (v9)
  {
    uint64_t v10 = v6[2];
LABEL_13:
    if (v9 >= v3) {
      unsigned int v12 = v3;
    }
    else {
      unsigned int v12 = v9;
    }
    if (v12)
    {
      uint64_t v13 = (char *)v6 + v10 + 32;
      uint64_t v14 = v12;
      unint64_t v15 = a2;
      do
      {
        char v16 = *v15++;
        *v13++ = v16;
        --v14;
      }
      while (v14);
      unint64_t v9 = v6[1];
      uint64_t v10 = v6[2];
    }
    v9 -= v12;
    v6[1] = v9;
    std::logic_error v6[2] = v10 + v12;
    a2 += v12;
    v3 -= v12;
    if (!v3) {
      return 0;
    }
  }
  uint64_t v11 = (char *)malloc(0x1010uLL);
  if (v11)
  {
    uint64_t v10 = 0;
    *(void *)uint64_t v11 = 0;
    *(_OWORD *)(v11 + 8) = xmmword_230B07010;
    void *v6 = v11;
    unint64_t v9 = 4080;
    int v6 = v11;
    a1[1] = v11;
    goto LABEL_13;
  }
  void *v6 = 0;
  return 4294967192;
}

void *vinyl_zipOpen(uint64_t a1)
{
  return vinyl_zipOpen2(a1);
}

uint64_t vinyl_zipOpenNewFileInZip3(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, char *a6, unsigned int a7, char *__s, int a9, int a10, int a11, int a12, int a13, int a14, unsigned char *a15, uint64_t a16)
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  uint64_t result = 4294967194;
  if (!a1) {
    return result;
  }
  if ((a9 & 0xFFFFFFF7) != 0) {
    return result;
  }
  if (*(_DWORD *)(a1 + 88) == 1)
  {
    uint64_t result = vinyl_zipCloseFileInZipRaw(a1, 0, 0);
    if (result) {
      return result;
    }
  }
  unsigned int v95 = a5;
  if (a2) {
    unint64_t v25 = a2;
  }
  else {
    unint64_t v25 = "-";
  }
  uint64_t v94 = a4;
  if (__s) {
    unsigned int v26 = strlen(__s);
  }
  else {
    unsigned int v26 = 0;
  }
  unsigned int v27 = strlen(v25);
  if (a3)
  {
    unint64_t v28 = *(void *)(a3 + 24);
    if (!v28)
    {
      uint64_t v29 = *(unsigned int *)(a3 + 20);
      uint64_t v30 = v29 - 80;
      if (v29 <= 0x50) {
        uint64_t v30 = *(unsigned int *)(a3 + 20);
      }
      if (v29 <= 0x7BC) {
        uint64_t v31 = v30;
      }
      else {
        uint64_t v31 = v29 - 1980;
      }
      unint64_t v28 = ((32 * *(_DWORD *)(a3 + 4) + (*(_DWORD *)a3 >> 1))
           + ((unint64_t)*(unsigned int *)(a3 + 8) << 11)) | (((unint64_t)(*(_DWORD *)(a3 + 12) + 32 * *(_DWORD *)(a3 + 16) + 32) << 16)
                                                                   + (v31 << 25));
    }
  }
  else
  {
    unint64_t v28 = 0;
  }
  *(void *)(a1 + 1664pthread_mutex_init(this, 0) = v28;
  uint64_t v32 = 2 * ((a10 & 0xFFFFFFFE) == 8);
  *(void *)(a1 + 24pthread_mutex_init(this, 0) = v32;
  if (a10 == 1)
  {
    uint64_t v32 = 6;
  }
  else
  {
    if (a10 != 2) {
      goto LABEL_25;
    }
    v32 |= 4uLL;
  }
  *(void *)(a1 + 24pthread_mutex_init(this, 0) = v32;
LABEL_25:
  if (a15) {
    *(void *)(a1 + 24pthread_mutex_init(this, 0) = v32 | 1;
  }
  *(void *)(a1 + 16648) = 0;
  *(_DWORD *)(a1 + 16656) = 0;
  *(void *)(a1 + 208) = 0;
  *(_DWORD *)(a1 + 248) = a9;
  *(_DWORD *)(a1 + 252) = a11;
  uint64_t v33 = (*(uint64_t (**)(void, void))(a1 + 24))(*(void *)(a1 + 56), *(void *)(a1 + 64));
  *(void *)(a1 + 216) = v33;
  size_t v34 = a7 + v26 + v27 + 46;
  *(void *)(a1 + 232) = v34;
  uint64_t v35 = malloc(v34);
  *(void *)(a1 + 224) = v35;
  _DWORD *v35 = 33639248;
  v35[1] = 1310720;
  unint64_t v36 = *(void *)(a1 + 240);
  *((_WORD *)v35 + 4) = v36;
  if (v36 >= 0x10000) {
    *((_WORD *)v35 + 4) = -1;
  }
  unsigned int v37 = *(_DWORD *)(a1 + 248);
  *((_WORD *)v35 + 5) = v37;
  if (v37 >= 0x10000) {
    *((_WORD *)v35 + 5) = -1;
  }
  uint64_t v38 = 0;
  std::string v39 = v35 + 3;
  unint64_t v40 = *(void *)(a1 + 16640);
  do
  {
    unint64_t v41 = v40;
    *((unsigned char *)v39 + v38) = v40;
    v40 >>= 8;
    ++v38;
  }
  while (v38 != 4);
  if (v41 >= 0x100) {
    _DWORD *v39 = -1;
  }
  *((void *)v35 + 2) = 0;
  v35[6] = 0;
  *((_WORD *)v35 + 14) = v27;
  if (v27 >= 0x10000uLL) {
    *((_WORD *)v35 + 14) = -1;
  }
  *((_WORD *)v35 + 15) = a7;
  if (a7 >= 0x10000) {
    *((_WORD *)v35 + 15) = -1;
  }
  *((_WORD *)v35 + 16) = v26;
  if (v26 >= 0x10000) {
    *((_WORD *)v35 + 16) = -1;
  }
  *((_WORD *)v35 + 17) = 0;
  uint64_t v42 = v26;
  if (a3)
  {
    unint64_t v43 = *(void *)(a3 + 32);
    *((_WORD *)v35 + 18) = v43;
    if (v43 >= 0x10000) {
      *((_WORD *)v35 + 18) = -1;
    }
    uint64_t v44 = 0;
    int v45 = (_DWORD *)((char *)v35 + 38);
    unint64_t v46 = *(void *)(a3 + 40);
    do
    {
      unint64_t v47 = v46;
      *((unsigned char *)v45 + v44) = v46;
      v46 >>= 8;
      ++v44;
    }
    while (v44 != 4);
    if (v47 >= 0x100) {
      *int v45 = -1;
    }
  }
  else
  {
    *((_WORD *)v35 + 18) = 0;
    *(_DWORD *)((char *)v35 + 38) = 0;
  }
  uint64_t v48 = 0;
  uint64_t v49 = (_DWORD *)((char *)v35 + 42);
  unint64_t v50 = v33 - *(void *)(a1 + 16712);
  do
  {
    unint64_t v51 = v50;
    *((unsigned char *)v49 + v48) = v50;
    v50 >>= 8;
    ++v48;
  }
  while (v48 != 4);
  if (v51 >= 0x100) {
    *uint64_t v49 = -1;
  }
  if (v27)
  {
    for (uint64_t i = 0; i != v27; ++i)
      *(unsigned char *)(*(void *)(a1 + 224) + i + 46) = v25[i];
  }
  if (a7)
  {
    uint64_t v53 = v27 + 46;
    uint64_t v54 = a7;
    do
    {
      char v55 = *a6++;
      *(unsigned char *)(*(void *)(a1 + 224) + v53++) = v55;
      --v54;
    }
    while (v54);
  }
  if (v26)
  {
    unint64_t v56 = a7 + (unint64_t)v27 + 46;
    do
    {
      char v57 = *__s++;
      *(unsigned char *)(*(void *)(a1 + 224) + v56++) = v57;
      --v42;
    }
    while (v42);
  }
  if (!*(void *)(a1 + 224)) {
    return 4294967192;
  }
  v96[0] = 67324752;
  if ((*(uint64_t (**)(void, void, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), v96, 4) != 4)goto LABEL_91; {
  LOWORD(v96[0]) = 20;
  }
  if ((*(uint64_t (**)(void, void, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), v96, 2) != 2)goto LABEL_91; {
  uint64_t v58 = *(void *)(a1 + 64);
  }
  unint64_t v59 = *(void *)(a1 + 240);
  LOWORD(v96[0]) = v59;
  if (v59 >= 0x10000) {
    LOWORD(v96[0]) = -1;
  }
  if ((*(uint64_t (**)(void, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v58, v96, 2) != 2) {
    goto LABEL_91;
  }
  uint64_t v60 = *(void *)(a1 + 64);
  unsigned int v61 = *(_DWORD *)(a1 + 248);
  LOWORD(v96[0]) = v61;
  if (v61 >= 0x10000) {
    LOWORD(v96[0]) = -1;
  }
  if ((*(uint64_t (**)(void, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v60, v96, 2) != 2) {
    goto LABEL_91;
  }
  uint64_t v62 = 0;
  uint64_t v63 = *(void *)(a1 + 64);
  unint64_t v64 = *(void *)(a1 + 16640);
  do
  {
    unint64_t v65 = v64;
    *((unsigned char *)v96 + v62) = v64;
    v64 >>= 8;
    ++v62;
  }
  while (v62 != 4);
  if (v65 >= 0x100) {
    v96[0] = -1;
  }
  if ((*(uint64_t (**)(void, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v63, v96, 4) != 4) {
    goto LABEL_91;
  }
  v96[0] = 0;
  if ((*(uint64_t (**)(void, void, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), v96, 4) != 4)goto LABEL_91; {
  v96[0] = 0;
  }
  if ((*(uint64_t (**)(void, void, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), v96, 4) != 4)goto LABEL_91; {
  v96[0] = 0;
  }
  if ((*(uint64_t (**)(void, void, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), v96, 4) != 4)goto LABEL_91; {
  uint64_t v66 = *(void *)(a1 + 64);
  }
  LOWORD(v96[0]) = v27;
  if (v27 >= 0x10000uLL) {
    LOWORD(v96[0]) = -1;
  }
  if ((*(uint64_t (**)(void, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v66, v96, 2) != 2) {
    goto LABEL_91;
  }
  uint64_t v67 = *(void *)(a1 + 64);
  LOWORD(v96[0]) = v95;
  if (v95 >= 0x10000) {
    LOWORD(v96[0]) = -1;
  }
  uint64_t v68 = (*(uint64_t (**)(void, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v67, v96, 2);
  BOOL v69 = v68 != 2;
  if (v68 == 2 && v27) {
    BOOL v69 = (*(uint64_t (**)(void, void, const char *, void))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), v25, v27) != v27;
  }
  unsigned int v70 = v95;
  if (v95 && !v69)
  {
    if ((*(uint64_t (**)(void, void, uint64_t, void))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), v94, v95) == v70)
    {
      *(_DWORD *)(a1 + 104) = 0;
      *(_DWORD *)(a1 + 128) = 0x4000;
      *(void *)(a1 + 112) = 0;
      *(void *)(a1 + 12pthread_mutex_init(this, 0) = a1 + 256;
      *(void *)(a1 + 136) = 0;
      uint64_t v71 = (_DWORD *)(a1 + 16656);
      uint64_t v72 = a15;
      goto LABEL_97;
    }
LABEL_91:
    *(_DWORD *)(a1 + 104) = 0;
    *(_DWORD *)(a1 + 128) = 0x4000;
    *(void *)(a1 + 112) = 0;
    *(void *)(a1 + 12pthread_mutex_init(this, 0) = a1 + 256;
    uint64_t result = 0xFFFFFFFFLL;
    *(void *)(a1 + 136) = 0;
    uint64_t v71 = (_DWORD *)(a1 + 16656);
    goto LABEL_92;
  }
  *(_DWORD *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 128) = 0x4000;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 12pthread_mutex_init(this, 0) = a1 + 256;
  *(void *)(a1 + 136) = 0;
  uint64_t v71 = (_DWORD *)(a1 + 16656);
  uint64_t v72 = a15;
  if (v69)
  {
    uint64_t result = 0xFFFFFFFFLL;
    goto LABEL_92;
  }
LABEL_97:
  if (*(_DWORD *)(a1 + 248) != 8 || *(_DWORD *)(a1 + 252)) {
    goto LABEL_99;
  }
  if (a12 < 0) {
    int v93 = a12;
  }
  else {
    int v93 = -a12;
  }
  *(void *)(a1 + 16pthread_mutex_init(this, 0) = 0;
  *(void *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = 0;
  uint64_t result = deflateInit2_((z_streamp)(a1 + 96), a10, 8, v93, a13, a14, "1.2.12", 112);
  if (result)
  {
LABEL_92:
    v71[10] = 0;
    return result;
  }
  *(_DWORD *)(a1 + 208) = 1;
  uint64_t v72 = a15;
LABEL_99:
  v71[10] = 0;
  if (!v72) {
    goto LABEL_107;
  }
  _DWORD *v71 = 1;
  crc_table = get_crc_table();
  *(void *)(a1 + 16688) = crc_table;
  if (!crypthead_calls++)
  {
    int v75 = time(0);
    srand(v75 ^ 0xBB40E64E);
  }
  init_keys(a15, a1 + 16664, (uint64_t)crc_table);
  for (uint64_t j = 0; j != 10; v99[j++] = ((unsigned __int16)((v78 & 0xFFFD ^ 3) * (v78 | 2)) >> 8) ^ (v77 >> 7))
  {
    unsigned int v77 = rand();
    unint64_t v78 = *(void *)(a1 + 16680);
    z_crc_t v79 = crc_table[(*(void *)(a1 + 16664) ^ (v77 >> 7))] ^ (*(void *)(a1 + 16664) >> 8);
    *(void *)(a1 + 16664) = v79;
    uint64_t v80 = 134775813 * (*(void *)(a1 + 16672) + v79) + 1;
    *(void *)(a1 + 16672) = v80;
    *(void *)(a1 + 1668pthread_mutex_init(this, 0) = crc_table[(v78 ^ BYTE3(v80))] ^ (v78 >> 8);
  }
  init_keys(a15, a1 + 16664, (uint64_t)crc_table);
  uint64_t v81 = 0;
  z_crc_t v82 = *(void *)(a1 + 16680);
  z_crc_t v83 = *(void *)(a1 + 16664);
  uint64_t v84 = *(void *)(a1 + 16672);
  do
  {
    __int16 v85 = (v82 & 0xFFFD ^ 3) * (v82 | 2);
    char v86 = v99[v81];
    z_crc_t v83 = crc_table[(v86 ^ v83)] ^ (v83 >> 8);
    *(void *)(a1 + 16664) = v83;
    uint64_t v84 = 134775813 * (v84 + v83) + 1;
    *(void *)(a1 + 16672) = v84;
    z_crc_t v82 = crc_table[(v82 ^ BYTE3(v84))] ^ (v82 >> 8);
    *(void *)(a1 + 1668pthread_mutex_init(this, 0) = v82;
    *((unsigned char *)v96 + v81++) = v86 ^ HIBYTE(v85);
  }
  while (v81 != 10);
  int v87 = ((v82 & 0xFFFFFFFD ^ 3) * (v82 | 2)) >> 8;
  z_crc_t v88 = crc_table[(v83 ^ BYTE2(a16))] ^ (v83 >> 8);
  *(void *)(a1 + 16664) = v88;
  uint64_t v89 = 134775813 * (v84 + v88) + 1;
  *(void *)(a1 + 16672) = v89;
  z_crc_t v90 = crc_table[(v82 ^ BYTE3(v89))] ^ (v82 >> 8);
  *(void *)(a1 + 1668pthread_mutex_init(this, 0) = v90;
  char v97 = v87 ^ BYTE2(a16);
  z_crc_t v91 = crc_table[v88 ^ BYTE3(a16)] ^ (v88 >> 8);
  *(void *)(a1 + 16664) = v91;
  uint64_t v92 = 134775813 * (v89 + v91) + 1;
  *(void *)(a1 + 16672) = v92;
  *(void *)(a1 + 1668pthread_mutex_init(this, 0) = crc_table[(v90 ^ BYTE3(v92))] ^ (v90 >> 8);
  char v98 = ((unsigned __int16)((v90 & 0xFFFD ^ 3) * (v90 | 2)) >> 8) ^ BYTE3(a16);
  *(_DWORD *)(a1 + 16696) = 12;
  if ((*(uint64_t (**)(void, void, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), v96, 12) != 12)return 0xFFFFFFFFLL; {
LABEL_107:
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 88) = 1;
  return result;
}

uint64_t vinyl_zipCloseFileInZip(uint64_t a1)
{
  return vinyl_zipCloseFileInZipRaw(a1, 0, 0);
}

uint64_t vinyl_zipOpenNewFileInZip2(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, char *a6, unsigned int a7, char *a8, int a9, int a10, int a11)
{
  return vinyl_zipOpenNewFileInZip3(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, -15, 8, 0, 0, 0);
}

uint64_t vinyl_zipOpenNewFileInZip(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, char *a6, unsigned int a7, char *a8, int a9, int a10)
{
  return vinyl_zipOpenNewFileInZip3(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, 0, -15, 8, 0, 0, 0);
}

uint64_t vinyl_zipWriteInFileInZip(uint64_t a1, const Bytef *a2, uInt a3)
{
  if (!a1) {
    return 4294967194;
  }
  if (!*(_DWORD *)(a1 + 88)) {
    return 4294967194;
  }
  *(void *)(a1 + 96) = a2;
  *(_DWORD *)(a1 + 104) = a3;
  *(void *)(a1 + 16648) = crc32(*(void *)(a1 + 16648), a2, a3);
  while (*(_DWORD *)(a1 + 104))
  {
    unsigned int v4 = *(_DWORD *)(a1 + 128);
    if (v4 {
      || (uint64_t result = zipFlushWriteBuffer(a1),
    }
          unsigned int v4 = 0x4000,
          *(_DWORD *)(a1 + 128) = 0x4000,
          *(void *)(a1 + 12pthread_mutex_init(this, 0) = a1 + 256,
          result != -1))
    {
      if (*(_DWORD *)(a1 + 248) == 8 && !*(_DWORD *)(a1 + 252))
      {
        int v11 = *(_DWORD *)(a1 + 136);
        uint64_t result = deflate((z_streamp)(a1 + 96), 0);
        LODWORD(v7) = *(_DWORD *)(a1 + 136) - v11;
      }
      else
      {
        unsigned int v6 = *(_DWORD *)(a1 + 104);
        uint64_t v7 = v6 >= v4 ? v4 : v6;
        if (v7)
        {
          for (uint64_t i = 0; i != v7; ++i)
            *(unsigned char *)(*(void *)(a1 + 120) + i) = *(unsigned char *)(*(void *)(a1 + 96) + i);
          unsigned int v6 = *(_DWORD *)(a1 + 104);
          unsigned int v4 = *(_DWORD *)(a1 + 128);
          uint64_t v9 = v7;
        }
        else
        {
          uint64_t v9 = 0;
        }
        uint64_t result = 0;
        *(_DWORD *)(a1 + 104) = v6 - v7;
        *(_DWORD *)(a1 + 128) = v4 - v7;
        *(void *)(a1 + 96) += v9;
        uint64_t v10 = *(void *)(a1 + 120) + v9;
        *(void *)(a1 + 112) += v9;
        *(void *)(a1 + 12pthread_mutex_init(this, 0) = v10;
        *(void *)(a1 + 136) += v9;
      }
      *(_DWORD *)(a1 + 212) += v7;
      if (!result) {
        continue;
      }
    }
    return result;
  }
  return 0;
}

uint64_t zipFlushWriteBuffer(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 212);
  if (*(_DWORD *)(a1 + 16656) && v2)
  {
    unint64_t v3 = (unsigned char *)(a1 + 256);
    uint64_t v4 = *(unsigned int *)(a1 + 212);
    do
    {
      unint64_t v5 = *(void *)(a1 + 16680);
      uint64_t v6 = *(void *)(a1 + 16688);
      uint64_t v7 = *(void *)(v6 + 8 * (*v3 ^ *(void *)(a1 + 16664))) ^ (*(void *)(a1 + 16664) >> 8);
      *(void *)(a1 + 16664) = v7;
      uint64_t v8 = 134775813 * (*(void *)(a1 + 16672) + v7) + 1;
      *(void *)(a1 + 16672) = v8;
      *(void *)(a1 + 1668pthread_mutex_init(this, 0) = *(void *)(v6 + 8 * (v5 ^ BYTE3(v8))) ^ (v5 >> 8);
      *v3++ ^= (unsigned __int16)((v5 & 0xFFFD ^ 3) * (v5 | 2)) >> 8;
      --v4;
    }
    while (v4);
  }
  if ((*(uint64_t (**)(void, void, uint64_t, void))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), a1 + 256, v2) == *(_DWORD *)(a1 + 212))uint64_t result = 0; {
  else
  }
    uint64_t result = 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 212) = 0;
  return result;
}

uint64_t vinyl_zipCloseFileInZipRaw(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (!a1 || !*(_DWORD *)(a1 + 88)) {
    return 4294967194;
  }
  uint64_t v6 = 0;
  *(_DWORD *)(a1 + 104) = 0;
  if (*(_DWORD *)(a1 + 248) == 8)
  {
    if (*(_DWORD *)(a1 + 252))
    {
      uint64_t v6 = 0;
    }
    else
    {
      do
      {
        if (!*(_DWORD *)(a1 + 128))
        {
          int v33 = zipFlushWriteBuffer(a1);
          *(_DWORD *)(a1 + 128) = 0x4000;
          *(void *)(a1 + 12pthread_mutex_init(this, 0) = a1 + 256;
          if (v33 == -1)
          {
            uint64_t v6 = 0xFFFFFFFFLL;
            goto LABEL_10;
          }
        }
        int v34 = *(_DWORD *)(a1 + 136);
        unsigned int v35 = deflate((z_streamp)(a1 + 96), 4);
        *(_DWORD *)(a1 + 212) += *(_DWORD *)(a1 + 136) - v34;
      }
      while (!v35);
      if (v35 == 1) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = v35;
      }
      if (v6) {
        goto LABEL_10;
      }
    }
  }
  if (*(_DWORD *)(a1 + 212))
  {
    if (zipFlushWriteBuffer(a1) == -1) {
      uint64_t v6 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v6 = 0;
    }
  }
LABEL_10:
  if (*(_DWORD *)(a1 + 248) == 8 && !(*(_DWORD *)(a1 + 252) | v6))
  {
    uint64_t v6 = deflateEnd((z_streamp)(a1 + 96));
    *(_DWORD *)(a1 + 208) = 0;
  }
  if (!*(_DWORD *)(a1 + 252))
  {
    a3 = *(void *)(a1 + 16648);
    a2 = *(void *)(a1 + 112);
  }
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)(a1 + 136);
  uint64_t v9 = *(int *)(a1 + 16696);
  uint64_t v10 = (_DWORD *)(*(void *)(a1 + 224) + 16);
  unint64_t v11 = a3;
  do
  {
    unint64_t v12 = v11;
    *((unsigned char *)v10 + v7) = v11;
    v11 >>= 8;
    ++v7;
  }
  while (v7 != 4);
  unint64_t v13 = v8 + v9;
  if (v12 >= 0x100) {
    _DWORD *v10 = -1;
  }
  uint64_t v14 = 0;
  unint64_t v15 = (_DWORD *)(*(void *)(a1 + 224) + 20);
  unint64_t v16 = v8 + v9;
  do
  {
    unint64_t v17 = v16;
    *((unsigned char *)v15 + v14) = v16;
    v16 >>= 8;
    ++v14;
  }
  while (v14 != 4);
  if (v17 >= 0x100) {
    *unint64_t v15 = -1;
  }
  if (*(_DWORD *)(a1 + 184) == 1) {
    *(_WORD *)(*(void *)(a1 + 224) + 36) = 1;
  }
  uint64_t v18 = 0;
  uint64_t v19 = (_DWORD *)(*(void *)(a1 + 224) + 24);
  unint64_t v20 = a2;
  do
  {
    unint64_t v21 = v20;
    *((unsigned char *)v19 + v18) = v20;
    v20 >>= 8;
    ++v18;
  }
  while (v18 != 4);
  if (v21 >= 0x100) {
    *uint64_t v19 = -1;
  }
  if (v6)
  {
    free(*(void **)(a1 + 224));
  }
  else
  {
    uint64_t v6 = add_data_in_datablock((void *)(a1 + 72), *(char **)(a1 + 224), *(void *)(a1 + 232));
    free(*(void **)(a1 + 224));
    if (!v6)
    {
      uint64_t v22 = (*(uint64_t (**)(void, void))(a1 + 24))(*(void *)(a1 + 56), *(void *)(a1 + 64));
      if ((*(uint64_t (**)(void, void, uint64_t, void))(a1 + 32))(*(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 216) + 14, 0))
      {
        goto LABEL_59;
      }
      uint64_t v23 = 0;
      uint64_t v24 = *(void *)(a1 + 64);
      do
      {
        unint64_t v25 = a3;
        *((unsigned char *)&v37 + v23) = a3;
        a3 >>= 8;
        ++v23;
      }
      while (v23 != 4);
      if (v25 >= 0x100) {
        int v37 = -1;
      }
      if ((*(uint64_t (**)(void, uint64_t, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v24, &v37, 4) != 4) {
        goto LABEL_59;
      }
      uint64_t v26 = 0;
      uint64_t v27 = *(void *)(a1 + 64);
      do
      {
        unint64_t v28 = v13;
        *((unsigned char *)&v38 + v26) = v13;
        v13 >>= 8;
        ++v26;
      }
      while (v26 != 4);
      if (v28 >= 0x100) {
        int v38 = -1;
      }
      if ((*(uint64_t (**)(void, uint64_t, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v27, &v38, 4) == 4)
      {
        uint64_t v29 = 0;
        uint64_t v30 = *(void *)(a1 + 64);
        do
        {
          unint64_t v31 = a2;
          *((unsigned char *)&v39 + v29) = a2;
          a2 >>= 8;
          ++v29;
        }
        while (v29 != 4);
        if (v31 >= 0x100) {
          int v39 = -1;
        }
        if ((*(uint64_t (**)(void, uint64_t, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v30, &v39, 4) == 4)unsigned int v32 = 0; {
        else
        }
          unsigned int v32 = -1;
      }
      else
      {
LABEL_59:
        unsigned int v32 = -1;
      }
      if ((*(uint64_t (**)(void, void, uint64_t, void))(a1 + 32))(*(void *)(a1 + 56), *(void *)(a1 + 64), v22, 0))
      {
        uint64_t v6 = 0xFFFFFFFFLL;
      }
      else
      {
        uint64_t v6 = v32;
      }
    }
  }
  ++*(void *)(a1 + 16720);
  *(_DWORD *)(a1 + 88) = 0;
  return v6;
}

uint64_t vinyl_zipClose(uint64_t a1, const char *a2)
{
  if (!a1) {
    return 4294967194;
  }
  unsigned int v2 = a2;
  if (*(_DWORD *)(a1 + 88) != 1)
  {
    unsigned int v4 = 0;
    if (!a2) {
      goto LABEL_7;
    }
LABEL_8:
    unsigned int v6 = strlen(v2);
    goto LABEL_9;
  }
  unsigned int v4 = vinyl_zipCloseFileInZipRaw(a1, 0, 0);
  if (v2) {
    goto LABEL_8;
  }
LABEL_7:
  unsigned int v2 = *(const char **)(a1 + 16728);
  if (v2) {
    goto LABEL_8;
  }
  unsigned int v6 = 0;
LABEL_9:
  uint64_t v7 = (*(uint64_t (**)(void, void))(a1 + 24))(*(void *)(a1 + 56), *(void *)(a1 + 64));
  if (!v4)
  {
    uint64_t v9 = *(void **)(a1 + 72);
    if (v9)
    {
      unint64_t v8 = 0;
      unsigned int v4 = 0;
      do
      {
        uint64_t v10 = v9[2];
        if (v4)
        {
          unsigned int v4 = -1;
        }
        else if (v10)
        {
          uint64_t v11 = (*(uint64_t (**)(void, void, void *))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), v9 + 4);
          uint64_t v10 = v9[2];
          if (v11 == v10) {
            unsigned int v4 = 0;
          }
          else {
            unsigned int v4 = -1;
          }
        }
        else
        {
          unsigned int v4 = 0;
        }
        v8 += v10;
        uint64_t v9 = (void *)*v9;
      }
      while (v9);
      goto LABEL_21;
    }
    unsigned int v4 = 0;
  }
  unint64_t v8 = 0;
LABEL_21:
  unint64_t v12 = *(void **)(a1 + 72);
  if (v12)
  {
    do
    {
      unint64_t v13 = (void *)*v12;
      free(v12);
      unint64_t v12 = v13;
    }
    while (v13);
  }
  if (!v4)
  {
    int v31 = 101010256;
    if ((*(uint64_t (**)(void, void, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), &v31, 4) != 4)goto LABEL_53; {
    LOWORD(v31) = 0;
    }
    if ((*(uint64_t (**)(void, void, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), &v31, 2) != 2)goto LABEL_53; {
    LOWORD(v31) = 0;
    }
    if ((*(uint64_t (**)(void, void, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), &v31, 2) != 2)goto LABEL_53; {
    uint64_t v14 = *(void *)(a1 + 64);
    }
    unint64_t v15 = *(void *)(a1 + 16720);
    LOWORD(v31) = v15;
    if (v15 >= 0x10000) {
      LOWORD(v31) = -1;
    }
    if ((*(uint64_t (**)(void, uint64_t, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v14, &v31, 2) != 2) {
      goto LABEL_53;
    }
    uint64_t v16 = *(void *)(a1 + 64);
    unint64_t v17 = *(void *)(a1 + 16720);
    LOWORD(v31) = v17;
    if (v17 >= 0x10000) {
      LOWORD(v31) = -1;
    }
    if ((*(uint64_t (**)(void, uint64_t, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v16, &v31, 2) != 2) {
      goto LABEL_53;
    }
    uint64_t v18 = 0;
    uint64_t v19 = *(void *)(a1 + 64);
    do
    {
      unint64_t v20 = v8;
      *((unsigned char *)&v31 + v18) = v8;
      v8 >>= 8;
      ++v18;
    }
    while (v18 != 4);
    if (v20 >= 0x100) {
      int v31 = -1;
    }
    if ((*(uint64_t (**)(void, uint64_t, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v19, &v31, 4) != 4) {
      goto LABEL_53;
    }
    uint64_t v21 = 0;
    uint64_t v22 = *(void *)(a1 + 64);
    unint64_t v23 = v7 - *(void *)(a1 + 16712);
    do
    {
      unint64_t v24 = v23;
      *((unsigned char *)&v31 + v21) = v23;
      v23 >>= 8;
      ++v21;
    }
    while (v21 != 4);
    if (v24 >= 0x100) {
      int v31 = -1;
    }
    if ((*(uint64_t (**)(void, uint64_t, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v22, &v31, 4) == 4)
    {
      uint64_t v25 = *(void *)(a1 + 64);
      LOWORD(v31) = v6;
      if (v6 >= 0x10000) {
        LOWORD(v31) = -1;
      }
      uint64_t v26 = (*(uint64_t (**)(void, uint64_t, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v25, &v31, 2);
      if (v26 == 2) {
        unsigned int v4 = 0;
      }
      else {
        unsigned int v4 = -1;
      }
      if (v26 == 2 && v6)
      {
        if ((*(uint64_t (**)(void, void, const char *, void))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), v2, v6) == v6)unsigned int v4 = 0; {
        else
        }
          unsigned int v4 = -1;
      }
    }
    else
    {
LABEL_53:
      unsigned int v4 = -1;
    }
  }
  int v27 = (*(uint64_t (**)(void, void))(a1 + 40))(*(void *)(a1 + 56), *(void *)(a1 + 64));
  if (v4) {
    unsigned int v28 = v4;
  }
  else {
    unsigned int v28 = -1;
  }
  if (v27) {
    uint64_t v5 = v28;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v29 = *(void **)(a1 + 16728);
  if (v29) {
    free(v29);
  }
  free((void *)a1);
  return v5;
}

unsigned char *init_keys(unsigned char *result, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = 878082192;
  *(_OWORD *)a2 = xmmword_230B06B70;
  *(void *)(a2 + 16) = 878082192;
  int v4 = *result;
  if (*result)
  {
    uint64_t v5 = result + 1;
    unint64_t v6 = 305419896;
    uint64_t v7 = 591751049;
    do
    {
      unint64_t v6 = *(void *)(a3 + 8 * (v4 ^ v6)) ^ (v6 >> 8);
      uint64_t v7 = 134775813 * (v7 + v6) + 1;
      *(void *)a2 = v6;
      *(void *)(a2 + 8) = v7;
      unint64_t v3 = *(void *)(a3 + 8 * (v3 ^ BYTE3(v7))) ^ (v3 >> 8);
      *(void *)(a2 + 16) = v3;
      int v8 = *v5++;
      int v4 = v8;
    }
    while (v8);
  }
  return result;
}

uint64_t Options::Options(uint64_t a1, const __CFDictionary **a2)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  *(_DWORD *)a1 = 255;
  uint64_t v4 = a1 + 16;
  *(void *)(a1 + 4) = 0;
  std::string::basic_string[abi:ne180100]<0>((void *)(a1 + 16), "");
  *(_WORD *)(a1 + 4pthread_mutex_init(this, 0) = 0;
  *(unsigned char *)(a1 + 42) = 0;
  uint64_t v5 = (void **)(a1 + 48);
  std::string::basic_string[abi:ne180100]<0>((void *)(a1 + 48), "");
  *(unsigned char *)(a1 + 72) = 0;
  unint64_t v6 = (void **)(a1 + 80);
  std::string::basic_string[abi:ne180100]<0>((void *)(a1 + 80), "");
  uint64_t v7 = (void **)(a1 + 104);
  std::string::basic_string[abi:ne180100]<0>((void *)(a1 + 104), "");
  if (*a2) {
    int v8 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    int v8 = 0;
  }
  if (v8)
  {
    ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v38, *a2);
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(*a2, @"BasebandUpdater");
    ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v37, Value);
    *(unsigned char *)(a1 + 11) = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v37, @"VinylForceGold");
    *(unsigned char *)(a1 + 1pthread_mutex_init(this, 0) = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v37, @"VinylForceMain");
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
    *(_OWORD *)unint64_t v6 = *(_OWORD *)__p;
    *(void *)(a1 + 96) = v40;
    ctu::cf::map_adapter::getString();
    if (*(char *)(a1 + 127) < 0) {
      operator delete(*v7);
    }
    *(_OWORD *)uint64_t v7 = *(_OWORD *)__p;
    *(void *)(a1 + 12pthread_mutex_init(this, 0) = v40;
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
    unint64_t v12 = std::remove_if[abi:ne180100]<std::__wrap_iter<char *>,int (*)(int)>(v11, &v11[v10], (unsigned int (*)(void))isblank);
    if (*(char *)(a1 + 127) < 0)
    {
      uint64_t v14 = *(void *)(a1 + 104);
      unint64_t v13 = (char *)(v14 + *(void *)(a1 + 112));
    }
    else
    {
      unint64_t v13 = (char *)v7 + *(unsigned __int8 *)(a1 + 127);
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
    unint64_t v17 = std::remove_if[abi:ne180100]<std::__wrap_iter<char *>,int (*)(int)>(v16, &v16[v15], (unsigned int (*)(void))iscntrl);
    if (*(char *)(a1 + 127) < 0)
    {
      uint64_t v19 = *(void *)(a1 + 104);
      uint64_t v18 = (char *)(v19 + *(void *)(a1 + 112));
    }
    else
    {
      uint64_t v18 = (char *)v7 + *(unsigned __int8 *)(a1 + 127);
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
      *(_WORD *)(a1 + 1pthread_mutex_init(this, 0) = 257;
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
        int v31 = exception;
        unsigned int v32 = v35;
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
    MEMORY[0x230FC7740](v37);
    MEMORY[0x230FC7740](v38);
  }
  return a1;
}

void sub_230AF80A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, char *a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  __cxa_free_exception(v35);
  std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::destroy((uint64_t)&a12, a13);
  if (a20 < 0) {
    operator delete(__p);
  }
  MEMORY[0x230FC7740](&a21);
  MEMORY[0x230FC7740](&a23);
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
    unsigned int v2 = "No Action";
  }
  else {
    unsigned int v2 = off_264BA2618[a1 - 1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

uint64_t Options::ToString(Options *this)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v59);
  uint64_t v2 = v59[0];
  *(_DWORD *)((char *)&v59[1] + *(void *)(v59[0] - 24)) |= 1u;
  *(_DWORD *)((char *)&v59[1] + *(void *)(v2 - 24)) = *(_DWORD *)((unsigned char *)&v59[1] + *(void *)(v2 - 24)) & 0xFFFFFFB5 | 8;
  unint64_t v3 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v59, (uint64_t)"=========== Vinyl eUICC Options ============\n", 45);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)"uimSlot               ", 22);
  uint64_t v4 = (void *)std::ostream::operator<<();
  uint64_t v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"skipAll               ", 22);
  unint64_t v6 = (void *)std::ostream::operator<<();
  uint64_t v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)"onlyPerso             ", 22);
  int v8 = (void *)std::ostream::operator<<();
  uint64_t v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"forceMain             ", 22);
  uint64_t v10 = (void *)std::ostream::operator<<();
  uint64_t v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"forceGold             ", 22);
  unint64_t v12 = (void *)std::ostream::operator<<();
  unint64_t v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"forcePerso            ", 22);
  uint64_t v14 = (void *)std::ostream::operator<<();
  uint64_t v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)"\n", 1);
  uint64_t v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"alderHost             ", 22);
  int v17 = *((char *)this + 39);
  if (v17 >= 0) {
    uint64_t v18 = (char *)this + 16;
  }
  else {
    uint64_t v18 = (char *)*((void *)this + 2);
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
  unint64_t v24 = (void *)std::ostream::operator<<();
  uint64_t v25 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)"\n", 1);
  uint64_t v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)"postProcess           ", 22);
  unsigned int v27 = *((_DWORD *)this + 1) - 1;
  if (v27 > 3) {
    uint64_t v28 = "No Action";
  }
  else {
    uint64_t v28 = off_264BA2618[v27];
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
  int v31 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)v29, v30);
  unsigned int v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)"\n", 1);
  int v33 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)"twoPhaseRefurbRef     ", 22);
  int v34 = *((char *)this + 127);
  if (v34 >= 0) {
    unsigned int v35 = (char *)this + 104;
  }
  else {
    unsigned int v35 = (char *)*((void *)this + 13);
  }
  if (v34 >= 0) {
    uint64_t v36 = *((unsigned __int8 *)this + 127);
  }
  else {
    uint64_t v36 = *((void *)this + 14);
  }
  int v37 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, (uint64_t)v35, v36);
  int v38 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v37, (uint64_t)"\n", 1);
  int v39 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v38, (uint64_t)"twoPhaseUrl           ", 22);
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
  uint64_t v44 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v43, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v44, (uint64_t)"twoPhasePresenceCheck ", 22);
  int v45 = (void *)std::ostream::operator<<();
  unint64_t v46 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v45, (uint64_t)"\n", 1);
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
  char v55 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v54, (uint64_t)"\n", 1);
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
  return MEMORY[0x230FC7DB0](&v61);
}

void sub_230AF87FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
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

void sub_230AF899C(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x230FC7DB0](v1);
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
  MEMORY[0x230FC7DB0](a1 + 112);
  return a1;
}

uint64_t std::map<std::string,VinylRefurbAction,BBUpdaterCommon::case_insensitive_key_comparer,std::allocator<std::pair<std::string const,VinylRefurbAction>>>::map[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 8);
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

void sub_230AF8B30(_Unwind_Exception *a1)
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
    std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__insert_node_at(a1, (uint64_t)v10, v6, v8);
    return v8;
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__find_equal<std::string>(uint64_t **a1, uint64_t *a2, uint64_t **a3, uint64_t **a4, uint64_t a5)
{
  uint64_t v9 = a1 + 1;
  if (a1 + 1 == (uint64_t **)a2
    || (*(char *)(a5 + 23) >= 0 ? (uint64_t v11 = (const char *)a5) : (uint64_t v11 = *(const char **)a5),
        *((char *)a2 + 55) >= 0 ? (unint64_t v12 = (const char *)(a2 + 4)) : (unint64_t v12 = (const char *)a2[4]),
        strcasecmp(v11, v12) < 0))
  {
    unint64_t v13 = (uint64_t *)*a2;
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
      uint64_t v18 = a2;
      do
      {
        uint64_t v15 = (uint64_t *)v18[2];
        BOOL v19 = *v15 == (void)v18;
        uint64_t v18 = v15;
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

void sub_230AF8E44(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,VinylRefurbAction>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void *std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__find_equal<std::string>(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void **)(a1 + 8);
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
        int v8 = v4 + 4;
        uint64_t v9 = v10;
        uint64_t v11 = (const char *)(*((char *)v8 + 23) >= 0 ? v8 : v9);
        if ((strcasecmp(v6, v11) & 0x80000000) == 0) {
          break;
        }
        uint64_t v4 = (void *)*v7;
        uint64_t v5 = v7;
        if (!*v7) {
          goto LABEL_15;
        }
      }
      if ((strcasecmp(v11, v6) & 0x80000000) == 0) {
        break;
      }
      uint64_t v5 = v7 + 1;
      uint64_t v4 = (void *)v7[1];
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
  uint64_t v6 = *(char *)(a2 + 23) >= 0 ? (const char *)a2 : *(const char **)a2;
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
      uint64_t v6 = (const char *)a2;
    }
    else {
      uint64_t v6 = *(const char **)a2;
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
  MEMORY[0x230FC7BF0](v13, a1);
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
  MEMORY[0x230FC7C00](v13);
  return a1;
}

void sub_230AF91FC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x230FC7C00](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x230AF91DCLL);
}

void sub_230AF9250(_Unwind_Exception *a1)
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
      unint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
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

void sub_230AF93D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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

unint64_t BBULogModuleEnabled(char a1)
{
  return ((unint64_t)sLogInternalMask >> a1) & 1;
}

uint64_t gBBULogMaskGet(void)
{
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_1);
  }
  return gBBULogMaskGet(void)::sBBULogMask;
}

void *___Z14gBBULogMaskGetv_block_invoke()
{
  uint64_t result = operator new(8uLL);
  *uint64_t result = sLogInternalMask;
  gBBULogMaskGet(void)::sBBULogMask = (uint64_t)result;
  return result;
}

void BBULogSetMask(unsigned int a1)
{
  uint64_t v1 = a1;
  sLogInternalMask = a1;
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_1);
  }
  *(void *)gBBULogMaskGet(void)::sBBULogMask = v1;
}

uint64_t BBULogSetVerbosity(uint64_t result)
{
  gBBULogVerbosity = result;
  return result;
}

void BBULogSetExtraVerbosity(unsigned int a1)
{
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_1);
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
  uint64_t v11 = (pthread_mutex_t *)gLockGet(void)::_gLock;
  BBUpdaterCommon::BBUMutex::lock((pthread_mutex_t *)gLockGet(void)::_gLock);
  if (sLogBufferGet(void)::once != -1) {
    dispatch_once(&sLogBufferGet(void)::once, &__block_literal_global_46);
  }
  if (*(void *)sLogBufferGet(void)::sLogBuffer || (((unint64_t)sLogInternalMask >> a1) & 1) != 0)
  {
    vsnprintf(gTempLogBuffer, 0x400uLL, a5, a6);
    gettimeofday(&v39, 0);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v36);
    int64_t v12 = (void *)std::ostream::operator<<();
    LOBYTE(__p[0]) = 46;
    unint64_t v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)__p, 1);
    *(void *)((char *)v13 + *(void *)(*v13 - 24) + 24) = 3;
    char v35 = 48;
    std::operator<<[abi:ne180100]<std::char_traits<char>>(v13, &v35);
    uint64_t v14 = (void *)std::ostream::operator<<();
    *(void *)((char *)v14 + *(void *)(*v14 - 24) + 24) = 1;
    LOBYTE(__p[0]) = 91;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)__p, 1);
    uint64_t v15 = (void *)std::ostream::operator<<();
    LOBYTE(__p[0]) = 46;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)__p, 1);
    uint64_t v16 = (void *)std::ostream::operator<<();
    LOBYTE(__p[0]) = 93;
    int v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)__p, 1);
    size_t v18 = strlen(a3);
    BOOL v19 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)a3, v18);
    char v20 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)"::", 2);
    size_t v21 = strlen(a4);
    unint64_t v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)a4, v21);
    unsigned __int8 v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)": ", 2);
    size_t v24 = strlen(gTempLogBuffer);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)gTempLogBuffer, v24);
    std::stringbuf::str();
    if (sLogBufferGet(void)::once != -1) {
      dispatch_once(&sLogBufferGet(void)::once, &__block_literal_global_46);
    }
    if (*(void *)sLogBufferGet(void)::sLogBuffer)
    {
      if ((v34 & 0x80u) == 0) {
        uint64_t v25 = __p;
      }
      else {
        uint64_t v25 = (void **)__p[0];
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
          unsigned int v27 = __p;
        }
        else {
          unsigned int v27 = (void **)__p[0];
        }
        gBBULogSinkFunc(gBBULogSinkContext, (1 << a1), v27);
      }
      else
      {
        Stream = (FILE *)_BBULogGetStream(a1);
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
            int v31 = __p;
          }
          else {
            int v31 = (void **)__p[0];
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
    MEMORY[0x230FC7DB0](&v38);
  }
  return BBUpdaterCommon::BBUMutex::unlock(v11);
}

void sub_230AF9A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16)
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
  uint64_t v11 = (pthread_mutex_t *)gLockGet(void)::_gLock;
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
        unint64_t v13 = __p;
      }
      else {
        unint64_t v13 = (void **)__p[0];
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
          uint64_t v15 = __p;
        }
        else {
          uint64_t v15 = (void **)__p[0];
        }
        gBBULogSinkFunc(gBBULogSinkContext, (1 << a1), v15);
      }
      else
      {
        Stream = (FILE *)_BBULogGetStream(a1);
        if ((v22 & 0x80u) == 0) {
          int v17 = __p;
        }
        else {
          int v17 = (void **)__p[0];
        }
        fputs((const char *)v17, Stream);
        fflush(Stream);
        size_t v18 = (FILE **)MEMORY[0x263EF8358];
        if (Stream != (FILE *)*MEMORY[0x263EF8358])
        {
          if ((v22 & 0x80u) == 0) {
            BOOL v19 = __p;
          }
          else {
            BOOL v19 = (void **)__p[0];
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
    MEMORY[0x230FC7DB0](v25);
  }
  return BBUpdaterCommon::BBUMutex::unlock(v11);
}

void sub_230AFA06C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
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
      *(_OWORD *)int v41 = 0uLL;
      long long v39 = 0uLL;
      int v17 = a3;
      if (v16)
      {
        uint64_t v18 = (54 - 3 * v16) - 3;
        uint64_t v19 = v16;
        char v20 = (char *)&v39 + 1;
        size_t v21 = (unsigned __int8 *)(a5 + v12);
        do
        {
          unsigned int v22 = *v21++;
          char v23 = a0123456789abcd[v22 & 0xF];
          *(v20 - 1) = a0123456789abcd[(unint64_t)v22 >> 4];
          *char v20 = v23;
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
        int v17 = a3;
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
        *(_OWORD *)int v41 = v29;
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
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_1);
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
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_1);
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
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_1);
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
    *(_OWORD *)std::string __p = *(_OWORD *)v13;
    uint64_t v4 = (void *)HIBYTE(v14);
    if ((v14 & 0x8000000000000000) != 0) {
      uint64_t v4 = v13[1];
    }
    if (v4)
    {
      v13[0] = 0;
      v13[1] = 0;
      unint64_t v14 = 0;
      BBUpdaterCommon::BBUStringToArgv((char *)__p, v13);
      uint64_t v5 = (_DWORD *)MEMORY[0x263EF89F8];
      uint64_t v6 = (const char **)MEMORY[0x263EF89E0];
      *MEMORY[0x263EF89E8] = 1;
      _DWORD *v5 = 1;
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
            sLogInternalMask = v9;
            if (gBBULogMaskGet(void)::once != -1) {
              dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_1);
            }
            *(void *)gBBULogMaskGet(void)::sBBULogMask = v10;
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
    MEMORY[0x230FC7740](v15);
    MEMORY[0x230FC7740](v16);
    if (SHIBYTE(v18) < 0) {
      operator delete(__p[0]);
    }
  }
}

void sub_230AFA810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (__p) {
    operator delete(__p);
  }
  MEMORY[0x230FC7740](&a13);
  MEMORY[0x230FC7740](&a15);
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
  uint64_t v0 = BBUFSDebugRegisterDelegate((void **)&BBULogRegisterRemoteFSDelegate(void)::delegate);
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
  uint64_t v5 = (std::__shared_weak_count *)v2[1];
  void *v2 = v4;
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
  gLockGet(void)::_gLock = (uint64_t)v0;
  return result;
}

void sub_230AFAA3C(_Unwind_Exception *a1)
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
  *uint64_t v0 = *MEMORY[0x263EF8358];
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

void sub_230AFAAF0(_Unwind_Exception *a1)
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
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_1);
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
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = "send";
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
    MEMORY[0x230FC7BC0](__p, "(snipped)");
    unint64_t v6 = 2048;
  }
  gettimeofday(&v13, 0);
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_1);
  }
  if ((*(void *)gBBULogMaskGet(void)::sBBULogMask & (1 << a1)) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
  {
    _BBULogPlain(a1, "%u.%03u: %s: %u%s\n", v7, v8, v9, v10, v11, v12, v13.tv_sec);
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_1);
    }
  }
  if ((*(void *)gBBULogMaskGet(void)::sBBULogMask & (1 << a1)) != 0 && (gBBULogVerbosity & 0x80000000) == 0) {
    _BBULogBinary(a1, 0, "BBULog", "", a3, v6, 32, v12);
  }
  if (SHIBYTE(v15) < 0) {
    operator delete(__p[0]);
  }
}

void sub_230AFADEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
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
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = "send";
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
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = "send";
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
  uint64_t v5 = &v4[v3];
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
  uint64_t v5 = &v4[v3];
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
  void v8[3] = *MEMORY[0x263EF8340];
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
  v10[2] = *MEMORY[0x263EF8340];
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
  v12[3] = *MEMORY[0x263EF8340];
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
  v9[2] = *MEMORY[0x263EF8340];
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
                unsigned char *v23 = 0;
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

uint64_t VinylRestore::init(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1);
}

{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
}

atomic_ullong *std::future<std::shared_ptr<ctu::Http::HttpResponse>>::get(atomic_ullong *result)
{
  if (!atomic_fetch_add(result + 1, 0xFFFFFFFFFFFFFFFFLL)) {
    return (atomic_ullong *)(*(uint64_t (**)(void))(*result + 16))();
  }
  return result;
}

void ctu::llvm::StringRef::StringRef()
{
}

uint64_t VinylController::VinylController(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t AMSupportDigestSha256()
{
  return MEMORY[0x270F97A50]();
}

uint64_t AMSupportSafeRetain()
{
  return MEMORY[0x270F97B48]();
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

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x270EE4788](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
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

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
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

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
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

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
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

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x270EE51C8](str);
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

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x270EE53A0](allocator, url);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE5400](allocator, URLString, baseURL);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5440](anURL);
}

uint64_t DEREncoderAddData()
{
  return MEMORY[0x270F97B70]();
}

uint64_t DEREncoderAddSequenceFromEncoder()
{
  return MEMORY[0x270F97B98]();
}

uint64_t DEREncoderCreate()
{
  return MEMORY[0x270F97BB8]();
}

uint64_t DEREncoderCreateEncodedBuffer()
{
  return MEMORY[0x270F97BC0]();
}

uint64_t DEREncoderDestroy()
{
  return MEMORY[0x270F97BC8]();
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

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
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

uint64_t ACFUCommon::createURLByAppendingStrings(ACFUCommon *this, const __CFString *a2, const __CFString *a3)
{
  return MEMORY[0x270F0D1B0](this, a2, a3);
}

uint64_t ACFULogging::handleMessage()
{
  return MEMORY[0x270F0D1C8]();
}

uint64_t ACFULogging::getLogInstance(ACFULogging *this)
{
  return MEMORY[0x270F0D1D0](this);
}

uint64_t ACFULogging::handleMessageCFType()
{
  return MEMORY[0x270F0D1F0]();
}

uint64_t ACFULogging::initLog(ACFULogging *this, const __CFDictionary *a2, void (*a3)(void *, const char *), void *a4)
{
  return MEMORY[0x270F0D208](this, a2, a3, a4);
}

uint64_t ACFURestore::isPreflight(ACFURestore *this)
{
  return MEMORY[0x270F0D240](this);
}

uint64_t ACFURestore::executeCommand()
{
  return MEMORY[0x270F0D268]();
}

uint64_t ACFURestore::getErrorHandle(ACFURestore *this)
{
  return MEMORY[0x270F0D278](this);
}

uint64_t ACFURestore::restoreCommand(ACFURestore *this, const __CFString *a2)
{
  return MEMORY[0x270F0D288](this, a2);
}

uint64_t ACFURestore::isRestoreComplete(ACFURestore *this)
{
  return MEMORY[0x270F0D2A0](this);
}

uint64_t ACFURestore::init(ACFURestore *this, const __CFDictionary *a2, const void *a3)
{
  return MEMORY[0x270F0D2B8](this, a2, a3);
}

void ACFURestore::ACFURestore(ACFURestore *this)
{
}

void ACFURestore::~ACFURestore(ACFURestore *this)
{
}

uint64_t RestoreStep::operator=()
{
  return MEMORY[0x270F0D308]();
}

uint64_t ACFURTKitROM::create()
{
  return MEMORY[0x270F0D350]();
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

uint64_t ACFUTransport::init()
{
  return MEMORY[0x270F0D358]();
}

void ACFUTransport::ACFUTransport(ACFUTransport *this)
{
}

uint64_t RTKitFirmware::create()
{
  return MEMORY[0x270F0D3A0]();
}

uint64_t ACFUDiagnostics::copyDiagnosticsPath(ACFUDiagnostics *this)
{
  return MEMORY[0x270F0D3B8](this);
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

uint64_t AriSdk::ARI_IBIVinylInstallFwReq_SDK::ARI_IBIVinylInstallFwReq_SDK(AriSdk::ARI_IBIVinylInstallFwReq_SDK *this)
{
  return MEMORY[0x270F8DB68](this);
}

void AriSdk::ARI_IBIVinylInstallFwReq_SDK::~ARI_IBIVinylInstallFwReq_SDK(AriSdk::ARI_IBIVinylInstallFwReq_SDK *this)
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

uint64_t AriSdk::ARI_IBISimAccessGetSimDataReq_SDK::ARI_IBISimAccessGetSimDataReq_SDK(AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *this)
{
  return MEMORY[0x270F8EE50](this);
}

void AriSdk::ARI_IBISimAccessGetSimDataReq_SDK::~ARI_IBISimAccessGetSimDataReq_SDK(AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *this)
{
}

uint64_t ACFUError::getCFError(ACFUError *this)
{
  return MEMORY[0x270F0D4D0](this);
}

uint64_t ACFUError::addError()
{
  return MEMORY[0x270F0D4F0]();
}

void ACFUError::ACFUError(ACFUError *this, const __CFString *a2)
{
}

void ACFUError::~ACFUError(ACFUError *this)
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

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x270F985E0](this, *(void *)&__ec.__val_, __ec.__cat_);
}

void std::future_error::~future_error(std::future_error *this)
{
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

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x270F98C18]();
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x270F98F30](lpsrc, lpstype, lpdtype, s2d);
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

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x270F9C690](crc, buf, *(void *)&len);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C698](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C6A8](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x270F9C6B0](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
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

FILE *__cdecl fmemopen(void *__buf, size_t __size, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99C8](__buf, __size, __mode);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
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

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

const z_crc_t *get_crc_table(void)
{
  return (const z_crc_t *)MEMORY[0x270F9C6C8]();
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return MEMORY[0x270ED9CC0](*(void *)&a1, a2, a3, a4, a5);
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

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDB128](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

void srand(unsigned int a1)
{
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

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}