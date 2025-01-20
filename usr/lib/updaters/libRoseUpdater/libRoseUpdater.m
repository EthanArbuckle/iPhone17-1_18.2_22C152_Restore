uint64_t RoseRestoreHost::create@<X0>(RoseRestoreHost *this@<X0>, const __CFString *a2@<X1>, ACFURestoreHost **a3@<X8>)
{
  ACFURestoreHost *v7;
  uint64_t result;
  uint64_t (*v9)(ACFURestoreHost *);
  uint64_t vars8;

  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  v7 = (ACFURestoreHost *)operator new(0xF8uLL);
  ACFURestoreHost::ACFURestoreHost(v7);
  *(void *)v7 = &unk_26E056850;
  *((void *)v7 + 29) = 0;
  *((void *)v7 + 30) = 0;
  *a3 = v7;
  result = RoseRestoreHost::init(v7, this, a2);
  if ((result & 1) == 0)
  {
    *a3 = 0;
    v9 = *(uint64_t (**)(ACFURestoreHost *))(*(void *)v7 + 24);
    return v9(v7);
  }
  return result;
}

void sub_22CFD5500(_Unwind_Exception *a1)
{
  void *v1 = 0;
  (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  _Unwind_Resume(a1);
}

void RoseRestoreHost::RoseRestoreHost(RoseRestoreHost *this)
{
  ACFURestoreHost::ACFURestoreHost(this);
  void *v1 = &unk_26E056850;
  v1[29] = 0;
  v1[30] = 0;
}

__CFDictionary *RoseRestoreHost::createRequest(ACFULogging *a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a3 + 17))
  {
    ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage();
    return 0;
  }
  else
  {
    v4 = *(std::__shared_weak_count **)(a2 + 8);
    v8 = v4;
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    Request = (__CFDictionary *)ACFURestoreHost::createRequest();
    v6 = (ACFULogging *)v8;
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    if (Request)
    {
      if (*(unsigned char *)(a3 + 16)) {
        CFDictionaryRemoveValue(Request, @"Rap,RestoreRTKitOS");
      }
    }
    else
    {
      ACFULogging::getLogInstance(v6);
      ACFULogging::handleMessage();
    }
  }
  return Request;
}

void sub_22CFD5660(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

void RoseRestoreHost::~RoseRestoreHost(RoseRestoreHost *this)
{
  *(void *)this = &unk_26E056850;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 30);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  MEMORY[0x270F0D428](this);
}

{
  void *v1;
  uint64_t vars8;

  RoseRestoreHost::~RoseRestoreHost(this);

  operator delete(v1);
}

uint64_t RoseRestoreHost::init(RoseRestoreHost *this, CFTypeRef cf, const __CFString *a3)
{
  v70[1] = *MEMORY[0x263EF8340];
  if (!cf) {
    goto LABEL_74;
  }
  v5 = this;
  v6 = (RoseRestoreHost *)CFGetTypeID(cf);
  this = (RoseRestoreHost *)CFDictionaryGetTypeID();
  if (v6 != this) {
    goto LABEL_74;
  }
  this = (RoseRestoreHost *)CFDictionaryGetValue((CFDictionaryRef)cf, @"DeviceInfo");
  if (!this) {
    goto LABEL_74;
  }
  CFDictionaryRef v7 = this;
  v8 = (RoseRestoreHost *)CFGetTypeID(this);
  this = (RoseRestoreHost *)CFDictionaryGetTypeID();
  if (v8 != this
    || (this = (RoseRestoreHost *)CFDictionaryGetValue(v7, @"Rap,ChipID")) == 0
    || (CFDataRef v9 = this, v10 = (RoseRestoreHost *)CFGetTypeID(this), this = (RoseRestoreHost *)CFDataGetTypeID(), v10 != this)
    || (this = (RoseRestoreHost *)CFDataGetLength(v9), this != (RoseRestoreHost *)2))
  {
LABEL_74:
    ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage();
    return 0;
  }
  BytePtr = CFDataGetBytePtr(v9);
  RoseCapabilities::create((RoseCapabilities *)*(unsigned __int16 *)BytePtr, (RoseCapabilities **)&__src);
  long long v12 = __src;
  long long __src = 0uLL;
  v13 = (std::__shared_weak_count *)*((void *)v5 + 30);
  *(_OWORD *)((char *)v5 + 232) = v12;
  if (v13)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    v13 = (std::__shared_weak_count *)*((void *)&__src + 1);
    if (*((void *)&__src + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&__src + 1));
    }
    if (*((void *)v5 + 29))
    {
LABEL_12:
      long long __src = xmmword_2649389B8;
      long long v65 = *(_OWORD *)&off_2649389C8;
      v14 = (char **)((char *)v5 + 40);
      std::vector<__CFString const*>::__assign_with_size[abi:ne180100]<__CFString const* const*,__CFString const* const*>((char *)v5 + 40, (char *)&__src, (uint64_t)&v66, 4uLL);
      if (RoseCapabilities::supportsRTKitIOConfig(*((RoseCapabilities **)v5 + 29)))
      {
        unint64_t v15 = *((void *)v5 + 7);
        v16 = (void *)*((void *)v5 + 6);
        if ((unint64_t)v16 >= v15)
        {
          uint64_t v18 = ((char *)v16 - *v14) >> 3;
          if ((unint64_t)(v18 + 1) >> 61) {
            std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v19 = v15 - (void)*v14;
          uint64_t v20 = v19 >> 2;
          if (v19 >> 2 <= (unint64_t)(v18 + 1)) {
            uint64_t v20 = v18 + 1;
          }
          if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v21 = v20;
          }
          if (v21) {
            v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<__CFString const*>>((uint64_t)v5 + 56, v21);
          }
          else {
            v22 = 0;
          }
          v23 = &v22[8 * v18];
          v24 = &v22[8 * v21];
          *(void *)v23 = @"Rap,RTKitIOConfig";
          v17 = v23 + 8;
          v26 = (char *)*((void *)v5 + 5);
          v25 = (char *)*((void *)v5 + 6);
          if (v25 != v26)
          {
            do
            {
              uint64_t v27 = *((void *)v25 - 1);
              v25 -= 8;
              *((void *)v23 - 1) = v27;
              v23 -= 8;
            }
            while (v25 != v26);
            v25 = *v14;
          }
          *((void *)v5 + 5) = v23;
          *((void *)v5 + 6) = v17;
          *((void *)v5 + 7) = v24;
          if (v25) {
            operator delete(v25);
          }
        }
        else
        {
          void *v16 = @"Rap,RTKitIOConfig";
          v17 = v16 + 1;
        }
        *((void *)v5 + 6) = v17;
      }
      if (RoseCapabilities::requiresSeparateFirmwareTargetForCertification(*((RoseCapabilities **)v5 + 29)))
      {
        unint64_t v28 = *((void *)v5 + 7);
        v29 = (void *)*((void *)v5 + 6);
        if ((unint64_t)v29 >= v28)
        {
          uint64_t v31 = ((char *)v29 - *v14) >> 3;
          if ((unint64_t)(v31 + 1) >> 61) {
            std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v32 = v28 - (void)*v14;
          uint64_t v33 = v32 >> 2;
          if (v32 >> 2 <= (unint64_t)(v31 + 1)) {
            uint64_t v33 = v31 + 1;
          }
          if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v34 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v34 = v33;
          }
          if (v34) {
            v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<__CFString const*>>((uint64_t)v5 + 56, v34);
          }
          else {
            v35 = 0;
          }
          v36 = &v35[8 * v31];
          v37 = &v35[8 * v34];
          *(void *)v36 = @"Rap,RestoreRTKitOS";
          v30 = v36 + 8;
          v39 = (char *)*((void *)v5 + 5);
          v38 = (char *)*((void *)v5 + 6);
          if (v38 != v39)
          {
            do
            {
              uint64_t v40 = *((void *)v38 - 1);
              v38 -= 8;
              *((void *)v36 - 1) = v40;
              v36 -= 8;
            }
            while (v38 != v39);
            v38 = *v14;
          }
          *((void *)v5 + 5) = v36;
          *((void *)v5 + 6) = v30;
          *((void *)v5 + 7) = v37;
          if (v38) {
            operator delete(v38);
          }
        }
        else
        {
          void *v29 = @"Rap,RestoreRTKitOS";
          v30 = v29 + 1;
        }
        *((void *)v5 + 6) = v30;
      }
      long long __src = xmmword_2649389E8;
      long long v65 = *(_OWORD *)&off_2649389F8;
      long long v66 = xmmword_264938A08;
      v67 = @"Rap,SecurityDomain";
      std::vector<__CFString const*>::__assign_with_size[abi:ne180100]<__CFString const* const*,__CFString const* const*>((char *)v5 + 64, (char *)&__src, (uint64_t)&v68, 7uLL);
      *(void *)&long long __src = @"@Rap,Ticket";
      std::vector<__CFString const*>::__assign_with_size[abi:ne180100]<__CFString const* const*,__CFString const* const*>((char *)v5 + 88, (char *)&__src, (uint64_t)&__src + 8, 1uLL);
      *(void *)&long long __src = @"Rap,Ticket";
      std::vector<__CFString const*>::__assign_with_size[abi:ne180100]<__CFString const* const*,__CFString const* const*>((char *)v5 + 112, (char *)&__src, (uint64_t)&__src + 8, 1uLL);
      long long __src = xmmword_264938A20;
      long long v65 = *(_OWORD *)&off_264938A30;
      long long v66 = xmmword_264938A40;
      v41 = (void *)((char *)v5 + 136);
      std::vector<ACFURestoreHost::FileList>::__assign_with_size[abi:ne180100]<ACFURestoreHost::FileList const*,ACFURestoreHost::FileList const*>((char *)v5 + 136, (char *)&__src, (uint64_t)&v67, 3uLL);
      if (RoseCapabilities::supportsRTKitIOConfig(*((RoseCapabilities **)v5 + 29)))
      {
        unint64_t v42 = *((void *)v5 + 19);
        unint64_t v43 = *((void *)v5 + 18);
        if (v43 >= v42)
        {
          uint64_t v45 = (uint64_t)(v43 - *v41) >> 4;
          unint64_t v46 = v45 + 1;
          if ((unint64_t)(v45 + 1) >> 60) {
            std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v47 = v42 - *v41;
          if (v47 >> 3 > v46) {
            unint64_t v46 = v47 >> 3;
          }
          if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v48 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v48 = v46;
          }
          if (v48) {
            v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ACFURestoreHost::FileList>>((uint64_t)v5 + 152, v48);
          }
          else {
            v49 = 0;
          }
          v50 = &v49[16 * v45];
          v51 = &v49[16 * v48];
          *(void *)v50 = @"Rap,RTKitIOConfig";
          v50[8] = 1;
          v44 = v50 + 16;
          v53 = (unsigned char *)*((void *)v5 + 17);
          v52 = (unsigned char *)*((void *)v5 + 18);
          if (v52 != v53)
          {
            do
            {
              uint64_t v54 = *((void *)v52 - 2);
              v52 -= 16;
              char v55 = v52[8];
              *((void *)v50 - 2) = v54;
              v50 -= 16;
              v50[8] = v55;
            }
            while (v52 != v53);
            v52 = (unsigned char *)*v41;
          }
          *((void *)v5 + 17) = v50;
          *((void *)v5 + 18) = v44;
          *((void *)v5 + 19) = v51;
          if (v52) {
            operator delete(v52);
          }
        }
        else
        {
          *(void *)unint64_t v43 = @"Rap,RTKitIOConfig";
          *(unsigned char *)(v43 + 8) = 1;
          v44 = (char *)(v43 + 16);
        }
        *((void *)v5 + 18) = v44;
      }
      CFTypeID TypeID = CFNumberGetTypeID();
      *(void *)&long long __src = @"Rap,ChipID";
      *((void *)&__src + 1) = TypeID;
      CFTypeID v57 = CFNumberGetTypeID();
      *(void *)&long long v65 = @"Rap,BoardID";
      *((void *)&v65 + 1) = v57;
      CFTypeID v58 = CFNumberGetTypeID();
      *(void *)&long long v66 = @"Rap,SecurityDomain";
      *((void *)&v66 + 1) = v58;
      CFTypeID v59 = CFBooleanGetTypeID();
      v67 = @"Rap,ProductionMode";
      CFTypeID v68 = v59;
      CFTypeID v60 = CFBooleanGetTypeID();
      v69[0] = (unint64_t)@"Rap,SecurityMode";
      v69[1] = v60;
      CFTypeID v61 = CFNumberGetTypeID();
      v69[2] = (unint64_t)@"Rap,ECID";
      v69[3] = v61;
      CFTypeID v62 = CFDataGetTypeID();
      v69[4] = (unint64_t)@"Rap,Nonce";
      v69[5] = v62;
      std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__assign_unique<std::pair<__CFString const* const,unsigned long> const*>((uint64_t **)v5 + 20, (unint64_t *)&__src, v70);
      if (RoseCapabilities::supportsRTKitIOConfig(*((RoseCapabilities **)v5 + 29))) {
        *((void *)v5 + 23) = @"Rap,FdrRootCaDigest";
      }
      if (RoseCapabilities::supportsRTKitIOConfig(*((RoseCapabilities **)v5 + 29))) {
        *((void *)v5 + 24) = @"Rap,FDRAllowUnsealed";
      }
      *(void *)&long long __src = @"Rap,RTKitOS";
      WORD4(__src) = 1;
      *(void *)&long long v65 = @"Rap,RestoreRTKitOS";
      WORD4(v65) = 1;
      *(void *)&long long v66 = @"Rap,SoftwareBinaryDsp1";
      WORD4(v66) = 0;
      v67 = @"Rap,RTKitIOConfig";
      LOWORD(v68) = 0;
      std::__tree<std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>>>::__assign_unique<std::pair<__CFString const* const,ACFURestoreHost::DemoteConfig> const*>((uint64_t **)v5 + 25, (unint64_t *)&__src, v69);
      *((void *)v5 + 28) = @"Rose";
      v13 = (std::__shared_weak_count *)ACFURestoreHost::init(v5, (const __CFDictionary *)cf, a3);
      if (v13) {
        return 1;
      }
    }
  }
  else if ((void)v12)
  {
    goto LABEL_12;
  }
  ACFULogging::getLogInstance((ACFULogging *)v13);
  ACFULogging::handleMessage();
  return 0;
}

const void *RoseRestoreHost::copyFirmwareUpdater(uint64_t a1, const __CFDictionary *a2)
{
  GetRoseTatsuTagToFileNameMap((uint64_t)&v110);
  v3 = (const std::string::value_type **)std::map<__CFString const*,std::string>::at((uint64_t)&v110, (unint64_t *)&kRoseRestoreRtkitos);
  if (*((char *)v3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v111, *v3, (std::string::size_type)v3[1]);
  }
  else
  {
    long long v4 = *(_OWORD *)v3;
    v111.__r_.__value_.__r.__words[2] = (std::string::size_type)v3[2];
    *(_OWORD *)&v111.__r_.__value_.__l.__data_ = v4;
  }
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v110, (char *)v110.__r_.__value_.__l.__size_);
  GetRoseTatsuTagToFileNameMap((uint64_t)&v109);
  v5 = (const std::string::value_type **)std::map<__CFString const*,std::string>::at((uint64_t)&v109, (unint64_t *)kRoseRtkitos);
  if (*((char *)v5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v110, *v5, (std::string::size_type)v5[1]);
  }
  else
  {
    long long v6 = *(_OWORD *)v5;
    v110.__r_.__value_.__r.__words[2] = (std::string::size_type)v5[2];
    *(_OWORD *)&v110.__r_.__value_.__l.__data_ = v6;
  }
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v109, (char *)v109.__r_.__value_.__l.__size_);
  GetRoseTatsuTagToFileNameMap((uint64_t)&v108);
  CFDictionaryRef v7 = (const std::string::value_type **)std::map<__CFString const*,std::string>::at((uint64_t)&v108, (unint64_t *)&kRoseSwDsp1);
  if (*((char *)v7 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v109, *v7, (std::string::size_type)v7[1]);
  }
  else
  {
    long long v8 = *(_OWORD *)v7;
    v109.__r_.__value_.__r.__words[2] = (std::string::size_type)v7[2];
    *(_OWORD *)&v109.__r_.__value_.__l.__data_ = v8;
  }
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v108, (char *)v108.__r_.__value_.__l.__size_);
  GetRoseTatsuTagToFileNameMap((uint64_t)&v106);
  CFDataRef v9 = (const std::string::value_type **)std::map<__CFString const*,std::string>::at((uint64_t)&v106, (unint64_t *)&kRoseRtkitosICNF);
  if (*((char *)v9 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v108, *v9, (std::string::size_type)v9[1]);
  }
  else
  {
    long long v10 = *(_OWORD *)v9;
    v108.__r_.__value_.__r.__words[2] = (std::string::size_type)v9[2];
    *(_OWORD *)&v108.__r_.__value_.__l.__data_ = v10;
  }
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v106, *((char **)&v106 + 1));
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"DeviceInfo");
  CFDictionaryRef v12 = Value;
  if (!Value || (CFTypeID v13 = CFGetTypeID(Value), v13 != CFDictionaryGetTypeID()))
  {
    std::string::basic_string[abi:ne180100]<0>(&v104, "copyFirmwareUpdater: failed to get device info list");
    CFTypeID v58 = (ACFULogging *)ACFUError::addError();
    if (v105 < 0) {
      operator delete(v104);
    }
    ACFULogging::getLogInstance(v58);
    goto LABEL_110;
  }
  CFDataRef v14 = (const __CFData *)CFDictionaryGetValue(v12, @"Rap,RestoreBootNonce");
  if (v14 && (CFTypeID TypeID = CFDataGetTypeID(), v16 = (ACFULogging *)CFGetTypeID(v14), (ACFULogging *)TypeID == v16))
  {
    ACFULogging::getLogInstance(v16);
    ACFULogging::handleMessage();
    if (CFDataGetLength(v14) != 8)
    {
      std::string::basic_string[abi:ne180100]<0>(&v102, "copyFirmwareUpdater: nonce is of unexpected size");
      v70 = (ACFULogging *)ACFUError::addError();
      if (v103 < 0) {
        operator delete(v102);
      }
      ACFULogging::getLogInstance(v70);
      goto LABEL_110;
    }
    unint64_t v71 = *(void *)CFDataGetBytePtr(v14);
  }
  else
  {
    unint64_t v71 = 0;
  }
  v17 = CFDictionaryGetValue(v12, @"Rap,ChipRev");
  uint64_t v18 = CFDictionaryGetValue(v12, @"Rap,BoardID");
  if (!v17
    || (uint64_t v19 = v18) == 0
    || (CFTypeID v20 = CFDataGetTypeID(), v20 != CFGetTypeID(v17))
    || (CFTypeID v21 = CFDataGetTypeID(), v21 != CFGetTypeID(v19)))
  {
    std::string::basic_string[abi:ne180100]<0>(&v100, "copyFirmwareUpdater: unexpected device info parameters");
    CFTypeID v57 = (ACFULogging *)ACFUError::addError();
    if (v101 < 0) {
      operator delete(v100);
    }
    ACFULogging::getLogInstance(v57);
    goto LABEL_110;
  }
  if (CFDataGetLength((CFDataRef)v17) != 2 || CFDataGetLength((CFDataRef)v19) != 2)
  {
    std::string::basic_string[abi:ne180100]<0>(&v98, "copyFirmwareUpdater: bad device info parameters");
    CFTypeID v59 = (ACFULogging *)ACFUError::addError();
    if (v99 < 0) {
      operator delete(v98);
    }
    ACFULogging::getLogInstance(v59);
LABEL_110:
    v30 = 0;
    v41 = 0;
    v36 = 0;
    ACFULogging::handleMessage();
    v49 = 0;
    goto LABEL_86;
  }
  CFDataGetBytePtr((CFDataRef)v17);
  BytePtr = (ACFULogging *)CFDataGetBytePtr((CFDataRef)v19);
  ACFULogging::getLogInstance(BytePtr);
  v23 = (ACFULogging *)ACFULogging::handleMessage();
  ACFULogging::getLogInstance(v23);
  std::string::basic_string[abi:ne180100]<0>(&v96, "RoseRestoreHost");
  v24 = std::string::append(&v96, "::");
  long long v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
  v97.__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v97.__r_.__value_.__l.__data_ = v25;
  v24->__r_.__value_.__l.__size_ = 0;
  v24->__r_.__value_.__r.__words[2] = 0;
  v24->__r_.__value_.__r.__words[0] = 0;
  v26 = std::string::append(&v97, "copyFirmwareUpdater");
  long long v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
  std::string::size_type v107 = v26->__r_.__value_.__r.__words[2];
  long long v106 = v27;
  v26->__r_.__value_.__l.__size_ = 0;
  v26->__r_.__value_.__r.__words[2] = 0;
  v26->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v107) < 0) {
    operator delete((void *)v106);
  }
  if (SHIBYTE(v97.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v97.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v96.__r_.__value_.__l.__data_);
  }
  unint64_t v28 = (const void *)ACFURestoreHost::copyDataFromFileDictionary();
  CFTypeRef cf = v28;
  if (v28)
  {
    CFTypeID v29 = CFGetTypeID(v28);
    if (v29 == CFDataGetTypeID())
    {
      ACFUFTABFile::create();
      v30 = (ACFUFTABFile *)v106;
      if (!(void)v106)
      {
        std::string::basic_string[abi:ne180100]<0>(&v92, "copyFirmware: failed to init bundle firmware");
        long long v65 = (ACFULogging *)ACFUError::addError();
        if (v93 < 0) {
          operator delete(v92);
        }
        ACFULogging::getLogInstance(v65);
        v30 = 0;
        v41 = 0;
        v36 = 0;
        ACFULogging::handleMessage();
        unint64_t v48 = 0;
        unint64_t v34 = 0;
        v39 = 0;
        v49 = 0;
        goto LABEL_80;
      }
      if (!(*(unsigned int (**)(void, std::string *))(*(void *)v106 + 16))(v106, &v109)
        || ((*(uint64_t (**)(ACFUFTABFile *, std::string *))(*(void *)v30 + 16))(v30, &v110) & 1) == 0)
      {
        std::string::basic_string[abi:ne180100]<0>(&v90, "copyFirmware: bundle firmware specified is invalid");
        CFTypeID v61 = (ACFULogging *)ACFUError::addError();
        if (v91 < 0) {
          operator delete(v90);
        }
        ACFULogging::getLogInstance(v61);
        v41 = 0;
        v36 = 0;
        ACFULogging::handleMessage();
        unint64_t v48 = 0;
        unint64_t v34 = 0;
        v39 = 0;
        v49 = 0;
        goto LABEL_80;
      }
      if (RoseCapabilities::supportsRTKitIOConfig(*(RoseCapabilities **)(a1 + 232)))
      {
        uint64_t v31 = (ACFULogging *)(*(uint64_t (**)(ACFUFTABFile *, std::string *))(*(void *)v30 + 16))(v30, &v108);
        if ((v31 & 1) == 0)
        {
          ACFULogging::getLogInstance(v31);
          ACFULogging::handleMessage();
        }
      }
      uint64_t v32 = (ACFULogging *)CFDictionaryContainsKey(a2, *(const void **)(a1 + 8));
      if (v32)
      {
        uint64_t v33 = (const void *)ACFURestoreHost::copyDataFromFileDictionary();
        unint64_t v34 = v33;
        if (!v33 || (CFTypeID v35 = CFGetTypeID(v33), v35 != CFDataGetTypeID()))
        {
          std::string::basic_string[abi:ne180100]<0>(&v88, "copyFirmware: rooted override data unavailable");
          v63 = (ACFULogging *)ACFUError::addError();
          if (v89 < 0) {
            operator delete(v88);
          }
          ACFULogging::getLogInstance(v63);
          goto LABEL_124;
        }
        ACFUFTABFile::create();
        v36 = (uint64_t (***)(void, std::string *))v106;
        if (!(void)v106)
        {
          std::string::basic_string[abi:ne180100]<0>(&__p, "copyFirmware: failed to init ftab file object");
          v37 = (ACFULogging *)ACFUError::addError();
          if (v87 < 0) {
            operator delete(__p);
          }
          ACFULogging::getLogInstance(v37);
LABEL_124:
          v41 = 0;
          v36 = 0;
          ACFULogging::handleMessage();
          unint64_t v48 = 0;
          v39 = 0;
          v49 = 0;
LABEL_80:
          CFRelease(cf);
          if (v39) {
            CFRelease(v39);
          }
          if (v34) {
            CFRelease(v34);
          }
          if (v48) {
            CFRelease(v48);
          }
          goto LABEL_86;
        }
      }
      else
      {
        ACFULogging::getLogInstance(v32);
        v36 = 0;
        ACFULogging::handleMessage();
        unint64_t v34 = 0;
      }
      if (CFDictionaryContainsKey(a2, @"Rap,RestoreRTKitOS"))
      {
        v38 = (const void *)ACFURestoreHost::copyDataFromFileDictionary();
        v39 = v38;
        if (v38 && (CFTypeID v40 = CFGetTypeID(v38), v40 == CFDataGetTypeID()))
        {
          ACFUFTABFile::create();
          v41 = (uint64_t (***)(void, std::string *))v106;
          if ((void)v106)
          {
            if (((*(uint64_t (**)(void, std::string *))(*(void *)v106 + 16))(v106, &v111) & 1) == 0)
            {
              std::string::basic_string[abi:ne180100]<0>(&v80, "copyFirmware: bundle cert firmware doesn't have rrko");
              v67 = (ACFULogging *)ACFUError::addError();
              if (v81 < 0) {
                operator delete(v80);
              }
              ACFULogging::getLogInstance(v67);
              ACFULogging::handleMessage();
              goto LABEL_141;
            }
            if (v36) {
              goto LABEL_54;
            }
            goto LABEL_61;
          }
          std::string::basic_string[abi:ne180100]<0>(&v82, "copyFirmware: failed to init certification firmware");
          long long v66 = (ACFULogging *)ACFUError::addError();
          if (v83 < 0) {
            operator delete(v82);
          }
          ACFULogging::getLogInstance(v66);
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>(&v84, "copyFirmware: rrko bundle data unavailable");
          v64 = (ACFULogging *)ACFUError::addError();
          if (v85 < 0) {
            operator delete(v84);
          }
          ACFULogging::getLogInstance(v64);
        }
        v41 = 0;
        ACFULogging::handleMessage();
        unint64_t v48 = 0;
        v49 = 0;
        goto LABEL_80;
      }
      v41 = 0;
      v39 = 0;
      if (v36)
      {
LABEL_54:
        int v42 = (*v36)[2](v36, &v111);
        int v43 = (*v36)[2](v36, &v110);
        if (v42) {
          v44 = v36;
        }
        else {
          v44 = v41;
        }
        if (v43) {
          uint64_t v45 = (ACFUFTABFile *)v36;
        }
        else {
          uint64_t v45 = v30;
        }
        goto LABEL_62;
      }
LABEL_61:
      v44 = v41;
      uint64_t v45 = v30;
LABEL_62:
      char v46 = (*(uint64_t (**)(ACFUFTABFile *, std::string *))(*(void *)v45 + 16))(v45, &v111);
      if (v44) {
        char v47 = v46;
      }
      else {
        char v47 = 1;
      }
      if (v47)
      {
        unint64_t v48 = 0;
LABEL_69:
        if (v71) {
          ACFUFTABFile::setBootNonce(v45);
        }
        v49 = (const void *)(*(uint64_t (**)(ACFUFTABFile *))(*(void *)v45 + 40))(v45);
        if (v49 && (CFTypeID v50 = CFDataGetTypeID(), v51 = (ACFULogging *)CFGetTypeID(v49), (ACFULogging *)v50 == v51))
        {
          ACFULogging::getLogInstance(v51);
          std::string::basic_string[abi:ne180100]<0>(&v96, "RoseRestoreHost");
          v52 = std::string::append(&v96, "::");
          long long v53 = *(_OWORD *)&v52->__r_.__value_.__l.__data_;
          v97.__r_.__value_.__r.__words[2] = v52->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v97.__r_.__value_.__l.__data_ = v53;
          v52->__r_.__value_.__l.__size_ = 0;
          v52->__r_.__value_.__r.__words[2] = 0;
          v52->__r_.__value_.__r.__words[0] = 0;
          uint64_t v54 = std::string::append(&v97, "copyFirmwareUpdater");
          long long v55 = *(_OWORD *)&v54->__r_.__value_.__l.__data_;
          std::string::size_type v107 = v54->__r_.__value_.__r.__words[2];
          long long v106 = v55;
          v54->__r_.__value_.__l.__size_ = 0;
          v54->__r_.__value_.__r.__words[2] = 0;
          v54->__r_.__value_.__r.__words[0] = 0;
          ACFULogging::handleMessageCFType();
          if (SHIBYTE(v107) < 0) {
            operator delete((void *)v106);
          }
          if (SHIBYTE(v97.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v97.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v96.__r_.__value_.__l.__data_);
          }
          (*(void (**)(ACFUFTABFile *))(*(void *)v45 + 24))(v45);
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>(&v74, "copyFirmware: could not create output data");
          CFTypeID v62 = (ACFULogging *)ACFUError::addError();
          if (v75 < 0) {
            operator delete(v74);
          }
          ACFULogging::getLogInstance(v62);
          ACFULogging::handleMessage();
        }
        goto LABEL_80;
      }
      unint64_t v48 = (const void *)(**v44)(v44, &v111);
      if (v48)
      {
        if (ACFUFTABFile::addNewFileToFTAB()) {
          goto LABEL_69;
        }
        std::string::basic_string[abi:ne180100]<0>(&v76, "copyFirmware: could not add 'rrko' object to final ftab");
        v69 = (ACFULogging *)ACFUError::addError();
        if (v77 < 0) {
          operator delete(v76);
        }
        ACFULogging::getLogInstance(v69);
        ACFULogging::handleMessage();
LABEL_145:
        v49 = 0;
        goto LABEL_80;
      }
      std::string::basic_string[abi:ne180100]<0>(&v78, "copyFirmware: could not get 'rrko' object from ftab");
      CFTypeID v68 = (ACFULogging *)ACFUError::addError();
      if (v79 < 0) {
        operator delete(v78);
      }
      ACFULogging::getLogInstance(v68);
      ACFULogging::handleMessage();
LABEL_141:
      unint64_t v48 = 0;
      goto LABEL_145;
    }
  }
  std::string::basic_string[abi:ne180100]<0>(&v94, "copyFirmware: rkos bundle data unavailable");
  CFTypeID v60 = (ACFULogging *)ACFUError::addError();
  if (v95 < 0) {
    operator delete(v94);
  }
  ACFULogging::getLogInstance(v60);
  ACFULogging::handleMessage();
  unint64_t v48 = 0;
  unint64_t v34 = 0;
  v39 = 0;
  v49 = 0;
  v36 = 0;
  v41 = 0;
  v30 = 0;
  if (cf) {
    goto LABEL_80;
  }
LABEL_86:
  if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v108.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v109.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v109.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v110.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v111.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v111.__r_.__value_.__l.__data_);
  }
  if (v36) {
    ((void (*)(uint64_t (***)(void, std::string *)))(*v36)[7])(v36);
  }
  if (v41) {
    ((void (*)(uint64_t (***)(void, std::string *)))(*v41)[7])(v41);
  }
  if (v30) {
    (*(void (**)(ACFUFTABFile *))(*(void *)v30 + 56))(v30);
  }
  return v49;
}

void sub_22CFD6F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,void *a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,void *__p)
{
  if (a68 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v68 - 185) < 0) {
    operator delete(*(void **)(v68 - 208));
  }
  if (*(char *)(v68 - 153) < 0) {
    operator delete(*(void **)(v68 - 176));
  }
  if (*(char *)(v68 - 121) < 0) {
    operator delete(*(void **)(v68 - 144));
  }
  if (*(char *)(v68 - 89) < 0) {
    operator delete(*(void **)(v68 - 112));
  }
  _Unwind_Resume(a1);
}

void *std::map<__CFString const*,std::string>::at(uint64_t a1, unint64_t *a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (!v2) {
LABEL_8:
  }
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  unint64_t v3 = *a2;
  while (1)
  {
    while (1)
    {
      unint64_t v4 = v2[4];
      if (v3 >= v4) {
        break;
      }
      uint64_t v2 = (void *)*v2;
      if (!v2) {
        goto LABEL_8;
      }
    }
    if (v4 >= v3) {
      return v2 + 5;
    }
    uint64_t v2 = (void *)v2[1];
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
  __cxa_throw(exception, (struct type_info *)off_264938928, MEMORY[0x263F8C060]);
}

void sub_22CFD740C(_Unwind_Exception *a1)
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

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  size_t v5 = this;
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
    size_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

char *std::vector<__CFString const*>::__assign_with_size[abi:ne180100]<__CFString const* const*,__CFString const* const*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  std::string::size_type v7 = result;
  uint64_t v8 = *((void *)result + 2);
  CFDataRef v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 3)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *std::string::size_type v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 61) {
      std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 2;
    if (v8 >> 2 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    result = std::vector<__CFString const*>::__vallocate[abi:ne180100](v7, v11);
    CFTypeID v13 = (char *)v7[1];
    CFDictionaryRef v12 = (void **)(v7 + 1);
    CFDataRef v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      uint64_t v18 = v9;
      uint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  CFDictionaryRef v12 = (void **)(result + 8);
  CFDataRef v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 3;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  v16 = &__src[8 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    CFDataRef v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    uint64_t v18 = v9;
    uint64_t v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *CFDictionaryRef v12 = &v9[v17];
  return result;
}

char *std::vector<__CFString const*>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
  }
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<__CFString const*>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void std::vector<__CFString const*>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<__CFString const*>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

char *std::vector<ACFURestoreHost::FileList>::__assign_with_size[abi:ne180100]<ACFURestoreHost::FileList const*,ACFURestoreHost::FileList const*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  std::string::size_type v7 = result;
  uint64_t v8 = *((void *)result + 2);
  CFDataRef v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 4)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *std::string::size_type v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 60) {
      std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
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
    result = std::vector<ACFURestoreHost::FileList>::__vallocate[abi:ne180100](v7, v11);
    CFTypeID v13 = (char *)v7[1];
    CFDictionaryRef v12 = (void **)(v7 + 1);
    CFDataRef v9 = v13;
LABEL_16:
    uint64_t v17 = a3 - (void)__src;
    if (v17)
    {
      size_t v18 = v17 - 7;
      uint64_t v19 = v9;
      CFTypeID v20 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  CFDictionaryRef v12 = (void **)(result + 8);
  CFDataRef v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 4;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  v16 = &__src[16 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9 - 7);
    CFDataRef v9 = (char *)*v12;
  }
  uint64_t v17 = a3 - (void)v16;
  if (v17)
  {
    size_t v18 = v17 - 7;
    uint64_t v19 = v9;
    CFTypeID v20 = v16;
LABEL_18:
    result = (char *)memmove(v19, v20, v18);
  }
LABEL_19:
  *CFDictionaryRef v12 = &v9[v17];
  return result;
}

char *std::vector<ACFURestoreHost::FileList>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
  }
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ACFURestoreHost::FileList>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ACFURestoreHost::FileList>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

uint64_t **std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__assign_unique<std::pair<__CFString const* const,unsigned long> const*>(uint64_t **result, unint64_t *a2, unint64_t *a3)
{
  size_t v5 = result;
  if (result[2])
  {
    std::string::size_type v6 = *result;
    std::string::size_type v7 = result[1];
    char *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1]) {
      uint64_t v8 = (uint64_t *)v6[1];
    }
    else {
      uint64_t v8 = v6;
    }
    uint64_t v10 = result;
    unint64_t v11 = v8;
    CFDictionaryRef v12 = v8;
    if (v8)
    {
      unint64_t v11 = std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::__detach_next((uint64_t)v8);
      while (a2 != a3)
      {
        std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__node_assign_unique(v5, a2, v8);
        if (v9)
        {
          uint64_t v8 = v11;
          CFDictionaryRef v12 = v11;
          if (!v11)
          {
            a2 += 2;
            break;
          }
          unint64_t v11 = std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::__detach_next((uint64_t)v11);
        }
        else
        {
          uint64_t v8 = v12;
        }
        a2 += 2;
        if (!v8) {
          break;
        }
      }
    }
    result = (uint64_t **)std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v10);
  }
  while (a2 != a3)
  {
    result = std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__emplace_unique_key_args<__CFString const*,std::pair<__CFString const* const,unsigned long> const&>(v5, a2, a2);
    a2 += 2;
  }
  return result;
}

void sub_22CFD79C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__node_assign_unique(uint64_t **a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t v4 = a1 + 1;
  size_t v5 = a1[1];
  unint64_t v6 = *a2;
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        std::string::size_type v7 = (uint64_t **)v5;
        unint64_t v8 = v5[4];
        if (v6 >= v8) {
          break;
        }
        size_t v5 = *v7;
        uint64_t v4 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if (v8 >= v6) {
        return (uint64_t *)v7;
      }
      size_t v5 = v7[1];
      if (!v5)
      {
        uint64_t v4 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    std::string::size_type v7 = a1 + 1;
LABEL_9:
    uint64_t v9 = a2[1];
    a3[4] = v6;
    a3[5] = v9;
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__insert_node_at(a1, (uint64_t)v7, v4, a3);
  }
  return a3;
}

uint64_t *std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      unint64_t v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
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
              unint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *uint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            unint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *unint64_t v3 = v13;
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
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            unint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          unint64_t v3 = (uint64_t *)a2[2];
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
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void *std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  result = *(void **)(a1 + 16);
  if (result)
  {
    unint64_t v3 = (void *)*result;
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
          result = v4;
          uint64_t v4 = (void *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; unint64_t v3 = (void *)result[1])
      {
        do
        {
          result = v3;
          unint64_t v3 = (void *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy(*(void *)a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    unint64_t v3 = (void *)v2[2];
    if (v3)
    {
      do
      {
        uint64_t v2 = v3;
        unint64_t v3 = (void *)v3[2];
      }
      while (v3);
      *(void *)(a1 + 8) = v2;
    }
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy(*(void *)a1, v2);
  }
  return a1;
}

void std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t **std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__emplace_unique_key_args<__CFString const*,std::pair<__CFString const* const,unsigned long> const&>(uint64_t **a1, unint64_t *a2, _OWORD *a3)
{
  int v6 = a1 + 1;
  size_t v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        int v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
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
        break;
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
    uint64_t v10 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v10 + 2) = *a3;
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

uint64_t **std::__tree<std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>>>::__assign_unique<std::pair<__CFString const* const,ACFURestoreHost::DemoteConfig> const*>(uint64_t **result, unint64_t *a2, unint64_t *a3)
{
  size_t v5 = result;
  if (result[2])
  {
    int v6 = *result;
    unint64_t v7 = result[1];
    void *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1]) {
      int v8 = (uint64_t *)v6[1];
    }
    else {
      int v8 = v6;
    }
    uint64_t v10 = result;
    uint64_t v11 = v8;
    uint64_t v12 = v8;
    if (v8)
    {
      uint64_t v11 = std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::__detach_next((uint64_t)v8);
      while (a2 != a3)
      {
        std::__tree<std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>>>::__node_assign_unique(v5, a2, (uint64_t)v8);
        if (v9)
        {
          int v8 = v11;
          uint64_t v12 = v11;
          if (!v11)
          {
            a2 += 2;
            break;
          }
          uint64_t v11 = std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::__detach_next((uint64_t)v11);
        }
        else
        {
          int v8 = v12;
        }
        a2 += 2;
        if (!v8) {
          break;
        }
      }
    }
    result = (uint64_t **)std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v10);
  }
  while (a2 != a3)
  {
    result = std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__emplace_unique_key_args<__CFString const*,std::pair<__CFString const* const,unsigned long> const&>(v5, a2, a2);
    a2 += 2;
  }
  return result;
}

void sub_22CFD7F08(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t **std::__tree<std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>>>::__node_assign_unique(uint64_t **a1, unint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1 + 1;
  size_t v5 = a1[1];
  unint64_t v6 = *a2;
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        unint64_t v7 = (uint64_t **)v5;
        unint64_t v8 = v5[4];
        if (v6 >= v8) {
          break;
        }
        size_t v5 = *v7;
        uint64_t v4 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if (v8 >= v6) {
        return v7;
      }
      size_t v5 = v7[1];
      if (!v5)
      {
        uint64_t v4 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    unint64_t v7 = a1 + 1;
LABEL_9:
    *(void *)(a3 + 32) = v6;
    *(_WORD *)(a3 + 40) = *((_WORD *)a2 + 4);
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__insert_node_at(a1, (uint64_t)v7, v4, (uint64_t *)a3);
  }
  return (uint64_t **)a3;
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

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264938930, MEMORY[0x263F8C068]);
}

void sub_22CFD8060(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

uint64_t RoseBootstrappedPreflight::getUnsignedFirmwarePath(RoseBootstrappedPreflight *this)
{
  if (RoseBootstrappedPreflight::getUnsignedFirmwarePath(void)::only_once != -1) {
    dispatch_once(&RoseBootstrappedPreflight::getUnsignedFirmwarePath(void)::only_once, &__block_literal_global);
  }
  return RoseBootstrappedPreflight::getUnsignedFirmwarePath(void)::path;
}

uint64_t ___ZN25RoseBootstrappedPreflight23getUnsignedFirmwarePathEv_block_invoke()
{
  v0 = @"/usr/standalone/firmware/Rose/r1p0/ftab.bin";
  uint64_t result = MGGetProductType();
  if (result > 2625074842)
  {
    if (result <= 3571532205)
    {
      if (result <= 2941181570)
      {
        if (result <= 2793418700)
        {
          if (result != 2625074843)
          {
            if (result != 2688879999)
            {
              uint64_t v2 = 2722529672;
              goto LABEL_59;
            }
LABEL_45:
            v0 = @"/usr/standalone/firmware/Rose/r1p3/ftab.bin";
            goto LABEL_82;
          }
LABEL_77:
          v0 = @"/usr/standalone/firmware/Rose/r2w0/ftab.bin";
          goto LABEL_82;
        }
        if (result != 2793418701)
        {
          if (result != 2795618603)
          {
            if (result == 2940697645) {
              goto LABEL_45;
            }
            goto LABEL_83;
          }
LABEL_80:
          v0 = @"/usr/standalone/firmware/Rose/r2p1/ftab.bin";
          goto LABEL_82;
        }
LABEL_81:
        v0 = @"/usr/standalone/firmware/Rose/r2p0/ftab.bin";
        goto LABEL_82;
      }
      if (result <= 3001488777)
      {
        if (result == 2941181571) {
          goto LABEL_80;
        }
        if (result != 2943112657)
        {
          if (result != 2979575960) {
            goto LABEL_83;
          }
LABEL_61:
          v0 = @"/usr/standalone/firmware/Rose/r1w1/ftab.bin";
          goto LABEL_82;
        }
LABEL_72:
        v0 = @"/usr/standalone/firmware/Rose/r1w0/ftab.bin";
        goto LABEL_82;
      }
      if (result != 3001488778)
      {
        if (result == 3143587592) {
          goto LABEL_77;
        }
        if (result == 3348380076)
        {
          v0 = @"/usr/standalone/firmware/Rose/r1hp0/ftab.bin";
          goto LABEL_82;
        }
        goto LABEL_83;
      }
LABEL_76:
      v0 = @"/usr/standalone/firmware/Rose/r1p1/ftab.bin";
      goto LABEL_82;
    }
    if (result <= 3825599859)
    {
      if (result > 3742999857)
      {
        if (result == 3742999858) {
          goto LABEL_71;
        }
        if (result == 3767261006) {
          goto LABEL_61;
        }
        uint64_t v3 = 3819635030;
        goto LABEL_54;
      }
      if (result == 3571532206) {
        goto LABEL_72;
      }
      if (result != 3585085679)
      {
        uint64_t v3 = 3663011141;
LABEL_54:
        if (result != v3) {
          goto LABEL_83;
        }
        goto LABEL_71;
      }
LABEL_70:
      v0 = @"/usr/standalone/firmware/Rose/r1p2/ftab.bin";
      goto LABEL_82;
    }
    if (result > 3885279869)
    {
      if (result != 4201643249)
      {
        if (result == 4068102502) {
          goto LABEL_77;
        }
        if (result != 3885279870) {
          goto LABEL_83;
        }
      }
      goto LABEL_76;
    }
    if (result == 3825599860) {
      goto LABEL_81;
    }
    if (result == 3839750255) {
      goto LABEL_77;
    }
    uint64_t v5 = 3867318491;
    goto LABEL_49;
  }
  if (result > 1408738133)
  {
    if (result <= 2021146988)
    {
      if (result <= 1554479184)
      {
        switch(result)
        {
          case 1408738134:
            goto LABEL_72;
          case 1434404433:
            goto LABEL_45;
          case 1540760353:
            v0 = @"/usr/standalone/firmware/Rose/r1hp1/ftab.bin";
            goto LABEL_82;
        }
LABEL_83:
        v0 = 0;
        goto LABEL_82;
      }
      if (result == 1554479185) {
        goto LABEL_77;
      }
      if (result == 1602181456) {
        goto LABEL_61;
      }
      uint64_t v5 = 1770142589;
LABEL_49:
      if (result == v5) {
        goto LABEL_77;
      }
      goto LABEL_83;
    }
    if (result <= 2085054104)
    {
      if (result == 2021146989) {
        goto LABEL_45;
      }
      if (result == 2080700391) {
        goto LABEL_82;
      }
      uint64_t v5 = 2084894489;
      goto LABEL_49;
    }
    if (result == 2085054105) {
      goto LABEL_71;
    }
    if (result == 2132302344) {
      goto LABEL_72;
    }
    uint64_t v4 = 2309863438;
LABEL_69:
    if (result != v4) {
      goto LABEL_83;
    }
    goto LABEL_70;
  }
  if (result <= 749116820)
  {
    if (result <= 425046864)
    {
      if (result != 133314240 && result != 330877086) {
        goto LABEL_83;
      }
      goto LABEL_80;
    }
    if (result == 425046865)
    {
LABEL_71:
      v0 = @"/usr/standalone/firmware/Rose/r1w2/ftab.bin";
      goto LABEL_82;
    }
    if (result == 574536383) {
      goto LABEL_80;
    }
    uint64_t v4 = 689804742;
    goto LABEL_69;
  }
  if (result <= 1169082143)
  {
    if (result == 749116821) {
      goto LABEL_77;
    }
    if (result == 851437781) {
      goto LABEL_80;
    }
    uint64_t v4 = 1060988941;
    goto LABEL_69;
  }
  if (result == 1169082144) {
    goto LABEL_76;
  }
  if (result == 1280909812) {
    goto LABEL_61;
  }
  uint64_t v2 = 1371389549;
LABEL_59:
  if (result != v2) {
    goto LABEL_83;
  }
LABEL_82:
  RoseBootstrappedPreflight::getUnsignedFirmwarePath(void)::path = (uint64_t)v0;
  return result;
}

std::__shared_weak_count *RoseBootstrappedPreflight::bootstrappedPreflight(RoseBootstrappedPreflight *this, const __CFString *a2, __CFString *a3, const __CFString *a4)
{
  BOOL v130 = 1;
  uint64_t v128 = 0;
  v129 = 0;
  v126 = 0;
  v127 = 0;
  v124 = 0;
  v125 = 0;
  v122 = 0;
  v123 = 0;
  CFTypeRef v120 = 0;
  CFTypeRef v121 = 0;
  CFTypeRef cf = 0;
  __int16 v118 = -1;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (!a2)
  {
    if (RoseBootstrappedPreflight::getUnsignedFirmwarePath(void)::only_once != -1) {
      dispatch_once(&RoseBootstrappedPreflight::getUnsignedFirmwarePath(void)::only_once, &__block_literal_global);
    }
    a2 = (const __CFString *)RoseBootstrappedPreflight::getUnsignedFirmwarePath(void)::path;
  }
  CFAllocatorRef allocator = v5;
  CFURLRef v94 = CFURLCreateWithString(v5, a2, 0);
  if (!v94)
  {
    ACFULogging::getLogInstance(0);
LABEL_265:
    uint64_t v19 = 0;
    ACFULogging::handleMessage();
    __handle = 0;
    value = 0;
    theDict = 0;
    v24 = 0;
    long long v25 = 0;
    std::string v97 = 0;
    CFURLRef v55 = 0;
    URLByAppendingStrings = 0;
    CFDataRef v57 = 0;
    goto LABEL_117;
  }
  DataFromFileURL = (ACFULogging *)AMSupportCreateDataFromFileURL();
  if (DataFromFileURL)
  {
    ACFULogging::getLogInstance(DataFromFileURL);
    unint64_t v7 = (ACFULogging *)ACFULogging::handleMessage();
    ACFULogging::getLogInstance(v7);
    ACFULogging::handleMessage();
    v139 = "/usr/standalone/firmware/Rose";
    std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>((std::string *)&v133, &v139);
    MEMORY[0x230F78F40](&__ns, &v133, 0, 0);
    if (*(char *)(&v133.__rec_ + 7) < 0) {
      operator delete(v133.__imp_.__ptr_);
    }
    rep = (std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp>::element_type *)__ns.__rep_;
    char v9 = v136;
    if (v136)
    {
      atomic_fetch_add_explicit(&v136->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v10 = v136;
      v133.__imp_.__ptr_ = rep;
      v133.__imp_.__cntrl_ = v9;
      v133.__rec_ = v137;
      if (v136)
      {
        atomic_fetch_add_explicit(&v136->__shared_owners_, 1uLL, memory_order_relaxed);
        std::__shared_weak_count::__release_shared[abi:ne180100](v10);
      }
    }
    else
    {
      v133.__imp_.__ptr_ = (std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp>::element_type *)__ns.__rep_;
      v133.__imp_.__cntrl_ = 0;
      v133.__rec_ = v137;
    }
    while (v133.__imp_.__ptr_)
    {
      v23 = (ACFULogging *)std::__fs::filesystem::recursive_directory_iterator::__dereference(&v133);
      ACFULogging::getLogInstance(v23);
      ACFULogging::handleMessage();
      std::__fs::filesystem::recursive_directory_iterator::__increment(&v133, 0);
    }
    if (v133.__imp_.__cntrl_) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v133.__imp_.__cntrl_);
    }
    if (v136) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v136);
    }
    uint64_t v19 = 0;
    goto LABEL_48;
  }
  ACFUDiagnostics::create((ACFUDiagnostics *)a3, (const __CFString *)1);
  std::shared_ptr<ACFUDiagnostics>::operator=[abi:ne180100]<ACFUDiagnostics,std::default_delete<ACFUDiagnostics>,void>(&v124, &__ns.__rep_);
  uint64_t v11 = (ACFULogging *)__ns.__rep_;
  __ns.__rep_ = 0;
  if (v11)
  {
    uint64_t v12 = (void *)MEMORY[0x230F78D00]();
    operator delete(v12);
  }
  if (!v124)
  {
    ACFULogging::getLogInstance(v11);
    goto LABEL_265;
  }
  v116 = v124;
  v117 = v125;
  if (v125) {
    atomic_fetch_add_explicit(&v125->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  RoseTransport::create((uint64_t *)&v116, 0, 0, &__ns);
  std::shared_ptr<RoseTransport>::operator=[abi:ne180100]<RoseTransport,std::default_delete<RoseTransport>,void>(&v122, &__ns.__rep_);
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v13 = __ns.__rep_;
  __ns.__rep_ = 0;
  if (v13) {
    (*(void (**)(std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep))(*(void *)v13 + 64))(v13);
  }
  if (v117) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v117);
  }
  if (!v122)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_265;
  }
  PowerState = (ACFULogging *)RoseTransport::getPowerState((RoseTransport *)v122, &v130);
  if (PowerState
    || !v130 && (PowerState = (ACFULogging *)RoseTransport::setPowerState(v122, 1), PowerState))
  {
    ACFULogging::getLogInstance(PowerState);
    goto LABEL_265;
  }
  unint64_t v15 = 0;
  unsigned int v16 = 1;
  do
  {
    ACFULogging::getLogInstance(PowerState);
    ACFULogging::handleMessage();
    uint64_t v17 = (ACFULogging *)(*((uint64_t (**)(RoseCapabilities **))*v122 + 4))(v122);
    if (v17)
    {
      ACFULogging::getLogInstance(v17);
      ACFULogging::handleMessage();
      __handle = 0;
      value = 0;
      theDict = 0;
      v24 = 0;
      long long v25 = 0;
      std::string v97 = 0;
      CFURLRef v55 = 0;
      URLByAppendingStrings = 0;
      CFDataRef v57 = 0;
      uint64_t v19 = v15;
      goto LABEL_117;
    }
    (*(void (**)(std::chrono::nanoseconds *__return_ptr))*v122)(&__ns);
    std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v18 = __ns.__rep_;
    uint64_t v19 = v136;
    if (v136) {
      atomic_fetch_add_explicit(&v136->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
    BOOL v20 = v137;
    PowerState = (ACFULogging *)v136;
    if (v136) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v136);
    }
    if (!v20) {
      break;
    }
    unint64_t v15 = v19;
    BOOL v21 = v16++ >= 5;
  }
  while (!v21);
  if (v20) {
    goto LABEL_225;
  }
  if (v19)
  {
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
    int v22 = *(unsigned __int8 *)(v18 + 176);
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
    if (v22)
    {
      atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
      goto LABEL_53;
    }
    goto LABEL_225;
  }
  if (!*(unsigned char *)(v18 + 176)) {
    goto LABEL_225;
  }
LABEL_53:
  PowerState = ACFUCommon::Parameter::GetDataAsType<unsigned short>(v18 + 168, &v118);
  char v26 = (char)PowerState;
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if ((v26 & 1) == 0)
  {
LABEL_225:
    ACFULogging::getLogInstance(PowerState);
LABEL_228:
    ACFULogging::handleMessage();
LABEL_48:
    value = 0;
LABEL_49:
    theDict = 0;
LABEL_50:
    v24 = 0;
    long long v25 = 0;
LABEL_51:
    std::string v97 = 0;
    __handle = 0;
LABEL_114:
    CFURLRef v55 = 0;
LABEL_115:
    URLByAppendingStrings = 0;
LABEL_116:
    CFDataRef v57 = 0;
    goto LABEL_117;
  }
  ACFUFTABFile::create();
  std::shared_ptr<ACFUFTABFile>::operator=[abi:ne180100]<ACFUFTABFile,std::default_delete<ACFUFTABFile>,void>(&v128, &__ns.__rep_);
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v27 = __ns.__rep_;
  __ns.__rep_ = 0;
  if (v27) {
    (*(void (**)(std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep))(*(void *)v27 + 56))(v27);
  }
  uint64_t v28 = v128;
  if (!v128)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_228;
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
    uint64_t v28 = v128;
  }
  PowerState = (ACFULogging *)(*(uint64_t (**)(uint64_t))(*(void *)v28 + 40))(v28);
  CFTypeRef cf = PowerState;
  if (!PowerState) {
    goto LABEL_225;
  }
  CFTypeID v29 = CFGetTypeID(PowerState);
  PowerState = (ACFULogging *)CFDataGetTypeID();
  if ((ACFULogging *)v29 != PowerState) {
    goto LABEL_225;
  }
  v30 = v129;
  uint64_t v128 = 0;
  v129 = 0;
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
  GetRoseTatsuTagToFileNameMap((uint64_t)v114);
  RTKitFirmware::create();
  std::shared_ptr<RTKitFirmware>::operator=[abi:ne180100]<RTKitFirmware,std::default_delete<RTKitFirmware>,void>(&v126, &__ns.__rep_);
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v31 = __ns.__rep_;
  __ns.__rep_ = 0;
  if (v31) {
    (*(void (**)(std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep))(*(void *)v31 + 56))(v31);
  }
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)v114, v115);
  if (!v126) {
    goto LABEL_227;
  }
  if (v19) {
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v32 = (ACFULogging *)(**(uint64_t (***)(std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep))v18)(v18);
  value = v32;
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (!value)
  {
LABEL_227:
    ACFULogging::getLogInstance(v32);
    goto LABEL_228;
  }
  Mutable = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  unint64_t v34 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFTypeID v35 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  v36 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  v37 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  v38 = v37;
  if (Mutable && v34 && v35 && v36 && v37)
  {
    v39 = (const void *)*MEMORY[0x263EFFB40];
    CFDictionaryAddValue(v35, @"Trusted", (const void *)*MEMORY[0x263EFFB40]);
    CFDictionaryAddValue(v36, @"Trusted", v39);
    CFDictionaryAddValue(v38, @"Trusted", v39);
    CFDictionaryAddValue(v34, @"Rap,RTKitOS", v35);
    CFDictionaryAddValue(v34, @"Rap,SoftwareBinaryDsp1", v36);
    CFDictionaryAddValue(v34, @"Rap,RTKitIOConfig", v38);
    CFDictionaryAddValue(Mutable, @"BuildIdentity", v34);
    CFDictionaryAddValue(Mutable, @"DeviceInfo", value);
    goto LABEL_79;
  }
  ACFULogging::getLogInstance(v37);
  CFTypeID v40 = (ACFULogging *)ACFULogging::handleMessage();
  if (Mutable) {
    CFRelease(Mutable);
  }
  Mutable = 0;
  theDict = 0;
  if (v34)
  {
LABEL_79:
    CFRelease(v34);
    theDict = Mutable;
  }
  if (v35) {
    CFRelease(v35);
  }
  if (v36) {
    CFRelease(v36);
  }
  if (v38) {
    CFRelease(v38);
  }
  if (!theDict)
  {
    ACFULogging::getLogInstance(v40);
    ACFULogging::handleMessage();
    goto LABEL_49;
  }
  CFTypeRef v120 = (CFTypeRef)ACFUFirmware::copyFWContainer(v126);
  CFDictionarySetValue(theDict, @"FirmwareData", v120);
  v139 = 0;
  v140 = 0;
  LOWORD(v137) = 0;
  __ns.__rep_ = (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep)@"Rap,ProductionMode";
  v136 = (std::__shared_weak_count *)@"Rap,SecurityMode";
  v41 = (ACFULogging *)RoseRestoreHost::create(theDict, @"RoseBootstrappedPreflight", &v134);
  int v42 = v134;
  if (!v134)
  {
    ACFULogging::getLogInstance(v41);
    char v47 = (ACFULogging *)ACFULogging::handleMessage();
LABEL_235:
    ACFULogging::getLogInstance(v47);
    ACFULogging::handleMessage();
    goto LABEL_50;
  }
  int v43 = (ACFULogging *)CFDictionaryGetValue(theDict, @"FirmwareData");
  v44 = v43;
  if (!v43) {
    goto LABEL_240;
  }
  CFTypeID TypeID = CFDataGetTypeID();
  int v43 = (ACFULogging *)CFGetTypeID(v44);
  if ((ACFULogging *)TypeID != v43) {
    goto LABEL_240;
  }
  GetRoseTatsuTagToFileNameMap((uint64_t)&v133);
  RTKitFirmware::create();
  std::shared_ptr<RTKitFirmware>::operator=[abi:ne180100]<RTKitFirmware,std::default_delete<RTKitFirmware>,void>(&v139, (uint64_t *)&v134);
  char v46 = v134;
  v134 = 0;
  if (v46) {
    (*(void (**)(ACFURestoreHost *))(*(void *)v46 + 56))(v46);
  }
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v133, (char *)v133.__imp_.__cntrl_);
  if (!v139) {
    goto LABEL_240;
  }
  v131 = v139;
  v132 = v140;
  if (v140) {
    atomic_fetch_add_explicit(&v140->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  long long v25 = (const void *)(*(uint64_t (**)(ACFURestoreHost *, char **, std::chrono::nanoseconds *))(*(void *)v42 + 8))(v42, &v131, &__ns);
  int v43 = (ACFULogging *)v132;
  if (v132) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v132);
  }
  if (!v25)
  {
LABEL_240:
    ACFULogging::getLogInstance(v43);
    ACFULogging::handleMessage();
    long long v25 = 0;
  }
  (*(void (**)(ACFURestoreHost *))(*(void *)v42 + 24))(v42);
  char v47 = (ACFULogging *)v140;
  if (v140) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v140);
  }
  if (!v25) {
    goto LABEL_235;
  }
  unint64_t v48 = dlopen("/usr/lib/libauthinstall.dylib", 1);
  __handle = v48;
  if (!v48)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    v24 = 0;
    goto LABEL_51;
  }
  v49 = (uint64_t (*)(const __CFAllocator *))dlsym(v48, "AMAuthInstallCreate");
  CFTypeID v50 = dlerror();
  if (v50
    || !v49
    || (v51 = (uint64_t (*)(ACFULogging *, const void *, CFTypeRef *))dlsym(__handle, "AMAuthInstallRequestSendSync"), (CFTypeID v50 = dlerror()) != 0)|| !v51)
  {
    ACFULogging::getLogInstance((ACFULogging *)v50);
LABEL_242:
    ACFULogging::handleMessage();
    v24 = 0;
    std::string v97 = 0;
    goto LABEL_114;
  }
  v52 = (ACFULogging *)v49(allocator);
  std::string v97 = v52;
  if (!v52)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_242;
  }
  int v53 = 1;
  while (1)
  {
    ACFULogging::getLogInstance(v52);
    ACFULogging::handleMessage();
    int v54 = v51(v97, v25, &v121);
    v52 = (ACFULogging *)v121;
    if (!v54) {
      break;
    }
    if (v121)
    {
      CFRelease(v121);
      CFTypeRef v121 = 0;
    }
    __ns.__rep_ = 4000000000;
    std::this_thread::sleep_for (&__ns);
    if (++v53 == 6) {
      goto LABEL_112;
    }
  }
  if (!v121
    || (v52 = (ACFULogging *)CFDictionaryGetValue((CFDictionaryRef)v121, @"Rap,Ticket"), (CFTypeID v59 = v52) == 0)
    || (CFTypeID v60 = CFDataGetTypeID(), v52 = (ACFULogging *)CFGetTypeID(v59), (ACFULogging *)v60 != v52))
  {
LABEL_112:
    ACFULogging::getLogInstance(v52);
    ACFULogging::handleMessage();
LABEL_113:
    v24 = 0;
    goto LABEL_114;
  }
  (*(void (**)(ACFUFirmware *, ACFULogging *))(*(void *)v126 + 72))(v126, v59);
  CFTypeID v61 = v122;
  v112 = v126;
  v113 = v127;
  if (v127) {
    atomic_fetch_add_explicit(&v127->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v62 = (*((uint64_t (**)(RoseCapabilities **, ACFUFirmware **))*v61 + 2))(v61, &v112);
  v63 = (ACFULogging *)v113;
  if (v113) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v113);
  }
  v90 = v25;
  if (v62)
  {
    ACFULogging::getLogInstance(v63);
    ACFULogging::handleMessage();
    v24 = v123;
    v111[0] = (uint64_t)v122;
    v111[1] = (uint64_t)v123;
    if (v123) {
      atomic_fetch_add_explicit(&v123->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v88 = v125;
    v110[0] = v124;
    v110[1] = (ACFUDiagnostics *)v125;
    if (v125) {
      atomic_fetch_add_explicit(&v125->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    saveDebugInfo(v111, v110);
    goto LABEL_258;
  }
  v64 = (ACFULogging *)(*((uint64_t (**)(RoseCapabilities **))*v122 + 3))(v122);
  if (v64)
  {
    ACFULogging::getLogInstance(v64);
    ACFULogging::handleMessage();
    v24 = v123;
    v109[0] = (uint64_t)v122;
    v109[1] = (uint64_t)v123;
    if (v123) {
      atomic_fetch_add_explicit(&v123->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v88 = v125;
    v108[0] = v124;
    v108[1] = (ACFUDiagnostics *)v125;
    if (v125) {
      atomic_fetch_add_explicit(&v125->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    saveDebugInfo(v109, v108);
    goto LABEL_258;
  }
  unsigned int v65 = 1;
  long long v66 = v19;
  do
  {
    ACFULogging::getLogInstance(v64);
    ACFULogging::handleMessage();
    (*(void (**)(std::chrono::nanoseconds *__return_ptr))*v122)(&__ns);
    std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v67 = __ns.__rep_;
    uint64_t v19 = v136;
    if (v136) {
      atomic_fetch_add_explicit(&v136->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (v66) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v66);
    }
    BOOL v68 = v137;
    v64 = (ACFULogging *)v136;
    if (v136) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v136);
    }
    if (!v68) {
      break;
    }
    long long v66 = v19;
    BOOL v21 = v65++ >= 5;
  }
  while (!v21);
  if (v68)
  {
    ACFULogging::getLogInstance(v64);
    ACFULogging::handleMessage();
    v24 = v123;
    v107[0] = (uint64_t)v122;
    v107[1] = (uint64_t)v123;
    if (v123) {
      atomic_fetch_add_explicit(&v123->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v88 = v125;
    v106[0] = v124;
    v106[1] = (ACFUDiagnostics *)v125;
    if (v125) {
      atomic_fetch_add_explicit(&v125->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    saveDebugInfo(v107, v106);
LABEL_258:
    if (v88) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v88);
    }
    if (v24)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v24);
      v24 = 0;
    }
    CFURLRef v55 = 0;
    URLByAppendingStrings = 0;
    CFDataRef v57 = 0;
    goto LABEL_290;
  }
  if (!this)
  {
    ACFULogging::getLogInstance(v64);
    long long v25 = v90;
    ACFULogging::handleMessage();
    CFURLRef v55 = 0;
    URLByAppendingStrings = 0;
    CFDataRef v57 = 0;
    goto LABEL_212;
  }
  ACFULogging::getLogInstance(v64);
  long long v25 = v90;
  ACFUCommon::stringFromCFString(&__ns.__rep_, this, v69);
  if ((v138 & 0x80u) == 0) {
    unint64_t v71 = v138;
  }
  else {
    unint64_t v71 = (unint64_t)v136;
  }
  if (v71) {
    ACFUCommon::stringFromCFString((uint64_t *)&v133, this, v70);
  }
  ACFULogging::handleMessage();
  if (v71 && *(char *)(&v133.__rec_ + 7) < 0) {
    operator delete(v133.__imp_.__ptr_);
  }
  if ((char)v138 < 0) {
    operator delete((void *)__ns.__rep_);
  }
  v72 = CFURLCreateWithString(allocator, (CFStringRef)this, 0);
  CFURLRef v55 = v72;
  if (!v72)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    goto LABEL_113;
  }
  if (v19)
  {
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
    int v73 = *(unsigned __int8 *)(v67 + 80);
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
    if (v73)
    {
      v74 = v126;
      atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
      goto LABEL_193;
    }
    goto LABEL_267;
  }
  if (!*(unsigned char *)(v67 + 80)) {
    goto LABEL_267;
  }
  v74 = v126;
LABEL_193:
  (*(void (**)(ACFUFirmware *, void))(*(void *)v74 + 16))(v74, *(void *)(v67 + 72));
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  v72 = (ACFULogging *)RTKitFirmware::saveFirmwareToPath(v126, v55);
  if (v72
    || (v72 = (ACFULogging *)(*((uint64_t (**)(RoseCapabilities **))*v122 + 4))(v122), v72))
  {
LABEL_267:
    ACFULogging::getLogInstance(v72);
LABEL_270:
    ACFULogging::handleMessage();
    v24 = 0;
    goto LABEL_115;
  }
  if (v120)
  {
    CFRelease(v120);
    CFTypeRef v120 = 0;
  }
  URLByAppendingStrings = (const void *)ACFUCommon::createURLByAppendingStrings(this, @"ftab.bin", v75);
  if (!URLByAppendingStrings)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_270;
  }
  v76 = (ACFULogging *)AMSupportCreateDataFromFileURL();
  if (v76)
  {
    ACFULogging::getLogInstance(v76);
    ACFULogging::handleMessage();
LABEL_273:
    v24 = 0;
    goto LABEL_116;
  }
  GetRoseTatsuTagToFileNameMap((uint64_t)v104);
  RTKitFirmware::create();
  std::shared_ptr<RTKitFirmware>::operator=[abi:ne180100]<RTKitFirmware,std::default_delete<RTKitFirmware>,void>(&v126, &__ns.__rep_);
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v77 = __ns.__rep_;
  __ns.__rep_ = 0;
  if (v77) {
    (*(void (**)(std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep))(*(void *)v77 + 56))(v77);
  }
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)v104, v105);
  if (!v126
    || (CFDataRef v78 = (const __CFData *)(*(uint64_t (**)(ACFUFirmware *))(*(void *)v126 + 32))(v126),
        (CFDataRef v57 = v78) == 0))
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    goto LABEL_273;
  }
  char v79 = v122;
  BytePtr = CFDataGetBytePtr(v78);
  CFIndex Length = CFDataGetLength(v57);
  v82 = (ACFULogging *)(*((uint64_t (**)(RoseCapabilities **, const UInt8 *, CFIndex))*v79 + 1))(v79, BytePtr, Length);
  if (v82)
  {
    ACFULogging::getLogInstance(v82);
    ACFULogging::handleMessage();
    goto LABEL_275;
  }
  char v83 = v122;
  v102 = v126;
  char v103 = v127;
  if (v127) {
    atomic_fetch_add_explicit(&v127->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v84 = (*((uint64_t (**)(RoseCapabilities **, ACFUFirmware **))*v83 + 2))(v83, &v102);
  char v85 = (ACFULogging *)v103;
  if (v103) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v103);
  }
  if (v84)
  {
    ACFULogging::getLogInstance(v85);
    ACFULogging::handleMessage();
    v24 = v123;
    v101[0] = (uint64_t)v122;
    v101[1] = (uint64_t)v123;
    if (v123) {
      atomic_fetch_add_explicit(&v123->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    char v89 = v125;
    v100[0] = v124;
    v100[1] = (ACFUDiagnostics *)v125;
    if (v125) {
      atomic_fetch_add_explicit(&v125->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    saveDebugInfo(v101, v100);
    goto LABEL_286;
  }
  v86 = (ACFULogging *)(*((uint64_t (**)(RoseCapabilities **))*v122 + 3))(v122);
  if (v86)
  {
    ACFULogging::getLogInstance(v86);
    ACFULogging::handleMessage();
    v24 = v123;
    v99[0] = (uint64_t)v122;
    v99[1] = (uint64_t)v123;
    if (v123) {
      atomic_fetch_add_explicit(&v123->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    char v89 = v125;
    v98[0] = v124;
    v98[1] = (ACFUDiagnostics *)v125;
    if (v125) {
      atomic_fetch_add_explicit(&v125->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    saveDebugInfo(v99, v98);
LABEL_286:
    if (v89) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v89);
    }
    if (v24)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v24);
      v24 = 0;
    }
LABEL_290:
    long long v25 = v90;
    goto LABEL_117;
  }
LABEL_212:
  char v87 = (ACFULogging *)(*((uint64_t (**)(RoseCapabilities **))*v122 + 4))(v122);
  if (v87)
  {
    ACFULogging::getLogInstance(v87);
    ACFULogging::handleMessage();
LABEL_275:
    v24 = 0;
    goto LABEL_117;
  }
  if (v19) {
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v24 = (std::__shared_weak_count *)(**(uint64_t (***)(std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep))v67)(v67);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
LABEL_117:
  if (!v130 && v122) {
    RoseTransport::setPowerState(v122, 0);
  }
  if (v97) {
    CFRelease(v97);
  }
  if (value) {
    CFRelease(value);
  }
  if (theDict) {
    CFRelease(theDict);
  }
  if (v120)
  {
    CFRelease(v120);
    CFTypeRef v120 = 0;
  }
  if (v55) {
    CFRelease(v55);
  }
  if (URLByAppendingStrings) {
    CFRelease(URLByAppendingStrings);
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v94) {
    CFRelease(v94);
  }
  if (v25) {
    CFRelease(v25);
  }
  if (v121)
  {
    CFRelease(v121);
    CFTypeRef v121 = 0;
  }
  if (v57) {
    CFRelease(v57);
  }
  if (__handle) {
    dlclose(__handle);
  }
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (v123) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v123);
  }
  if (v125) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v125);
  }
  if (v127) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v127);
  }
  if (v129) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v129);
  }
  return v24;
}

void sub_22CFD9B90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52)
{
  if (v53) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v53);
  }
  if (v52) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v52);
  }
  if (v54) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v54);
  }
  CFDataRef v57 = *(std::__shared_weak_count **)(v55 - 248);
  if (v57) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v57);
  }
  CFTypeID v58 = *(std::__shared_weak_count **)(v55 - 232);
  if (v58) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v58);
  }
  CFTypeID v59 = *(std::__shared_weak_count **)(v55 - 216);
  if (v59) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v59);
  }
  CFTypeID v60 = *(std::__shared_weak_count **)(v55 - 200);
  if (v60) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v60);
  }
  _Unwind_Resume(exception_object);
}

void sub_22CFD9EA0()
{
}

void *std::shared_ptr<ACFUDiagnostics>::operator=[abi:ne180100]<ACFUDiagnostics,std::default_delete<ACFUDiagnostics>,void>(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (*a2)
  {
    CFAllocatorRef v5 = operator new(0x20uLL);
    void *v5 = &unk_26E056928;
    v5[1] = 0;
    v5[2] = 0;
    v5[3] = v4;
  }
  else
  {
    CFAllocatorRef v5 = 0;
  }
  *a2 = 0;
  unint64_t v6 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v5;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  return a1;
}

void *std::shared_ptr<RoseTransport>::operator=[abi:ne180100]<RoseTransport,std::default_delete<RoseTransport>,void>(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (*a2)
  {
    CFAllocatorRef v5 = operator new(0x20uLL);
    void *v5 = &unk_26E056988;
    v5[1] = 0;
    v5[2] = 0;
    v5[3] = v4;
  }
  else
  {
    CFAllocatorRef v5 = 0;
  }
  *a2 = 0;
  unint64_t v6 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v5;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  return a1;
}

const __CFData *ACFUCommon::Parameter::GetDataAsType<unsigned short>(uint64_t a1, _WORD *a2)
{
  if (!*(unsigned char *)(a1 + 8)) {
    return 0;
  }
  CFDataRef result = *(const __CFData **)a1;
  if (!result) {
    return result;
  }
  BytePtr = CFDataGetBytePtr(result);
  unint64_t Length = CFDataGetLength(*(CFDataRef *)a1);
  if (Length > 2) {
    return 0;
  }
  *a2 = 0;
  memcpy(a2, BytePtr, Length);
  return (const __CFData *)1;
}

void *std::shared_ptr<ACFUFTABFile>::operator=[abi:ne180100]<ACFUFTABFile,std::default_delete<ACFUFTABFile>,void>(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (*a2)
  {
    CFAllocatorRef v5 = operator new(0x20uLL);
    void *v5 = &unk_26E0569E8;
    v5[1] = 0;
    v5[2] = 0;
    v5[3] = v4;
  }
  else
  {
    CFAllocatorRef v5 = 0;
  }
  *a2 = 0;
  unint64_t v6 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v5;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  return a1;
}

void *std::shared_ptr<RTKitFirmware>::operator=[abi:ne180100]<RTKitFirmware,std::default_delete<RTKitFirmware>,void>(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (*a2)
  {
    CFAllocatorRef v5 = operator new(0x20uLL);
    void *v5 = &unk_26E0568C8;
    v5[1] = 0;
    v5[2] = 0;
    v5[3] = v4;
  }
  else
  {
    CFAllocatorRef v5 = 0;
  }
  *a2 = 0;
  unint64_t v6 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v5;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  return a1;
}

void saveDebugInfo(uint64_t *a1, ACFUDiagnostics **a2)
{
  uint64_t v2 = *a1;
  if (v2 && *a2)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    int v4 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)v2 + 40))(v2, &v5, 1);
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
    if (!v4) {
      ACFUDiagnostics::perform(*a2);
    }
  }
}

void sub_22CFDA1B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void __clang_call_terminate(void *a1)
{
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(std::string *this, char **a2)
{
  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  uint64_t v3 = *a2;
  int v4 = v3 - 1;
  while (*++v4)
    ;
  std::string::append[abi:ne180100]<char const*,0>(this, v3, v4);
  return this;
}

void sub_22CFDA220(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

std::string *std::string::append[abi:ne180100]<char const*,0>(std::string *this, char *a2, char *a3)
{
  int v4 = a2;
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  unint64_t v7 = a3 - a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    unint64_t v11 = this->__r_.__value_.__r.__words[2];
    std::string::size_type v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    uint64_t v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    unint64_t v6 = HIBYTE(v11);
  }
  else
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v9 = 22;
    uint64_t v10 = this;
  }
  if (v10 > (std::string *)v4 || (char *)&v10->__r_.__value_.__l.__data_ + size + 1 <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
    }
    CFDataRef v14 = this;
    if ((v6 & 0x80) != 0) {
      CFDataRef v14 = (std::string *)this->__r_.__value_.__r.__words[0];
    }
    for (i = (char *)v14 + size; v4 != a3; ++i)
    {
      char v16 = *v4++;
      unsigned char *i = v16;
    }
    unsigned char *i = 0;
    std::string::size_type v17 = v7 + size;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      this->__r_.__value_.__l.__size_ = v17;
    }
    else {
      *((unsigned char *)&this->__r_.__value_.__s + 23) = v17 & 0x7F;
    }
  }
  else
  {
    std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, v4, a3, v7);
    if ((v20 & 0x80u) == 0) {
      uint64_t v12 = __p;
    }
    else {
      uint64_t v12 = (void **)__p[0];
    }
    if ((v20 & 0x80u) == 0) {
      std::string::size_type v13 = v20;
    }
    else {
      std::string::size_type v13 = (std::string::size_type)__p[1];
    }
    std::string::append(this, (const std::string::value_type *)v12, v13);
    if ((char)v20 < 0) {
      operator delete(__p[0]);
    }
  }
  return this;
}

void sub_22CFDA398(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::__init_with_size[abi:ne180100]<char const*,char const*>(void *result, char *a2, char *a3, unint64_t a4)
{
  int v4 = result;
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
    CFDataRef result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    void *v4 = result;
    int v4 = result;
  }
  else
  {
    *((unsigned char *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    char v10 = *a2++;
    *(unsigned char *)int v4 = v10;
    int v4 = (void *)((char *)v4 + 1);
  }
  *(unsigned char *)int v4 = 0;
  return result;
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

void std::__shared_ptr_pointer<ACFUDiagnostics  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<ACFUDiagnostics  *>::__on_zero_shared(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    uint64_t v1 = (void *)MEMORY[0x230F78D00]();
    operator delete(v1);
  }
}

uint64_t std::__shared_ptr_pointer<ACFUDiagnostics  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else {
    return 0;
  }
}

void std::__shared_ptr_pointer<RoseTransport  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<RoseTransport  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 64))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<RoseTransport  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else {
    return 0;
  }
}

void std::__shared_ptr_pointer<ACFUFTABFile  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<ACFUFTABFile  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 56))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<ACFUFTABFile  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else {
    return 0;
  }
}

void RoseCapabilities::create(RoseCapabilities *this@<X0>, RoseCapabilities **a2@<X8>)
{
  int v2 = (int)this;
  int v4 = operator new(4uLL);
  std::shared_ptr<RoseCapabilities>::shared_ptr[abi:ne180100]<RoseCapabilities,void>(a2, (uint64_t)v4);
  if (*a2)
  {
    uint64_t v5 = RoseCapabilities::init(*a2, v2);
    if ((v5 & 1) == 0)
    {
      ACFULogging::getLogInstance((ACFULogging *)v5);
      ACFULogging::handleMessage();
      unint64_t v6 = (std::__shared_weak_count *)a2[1];
      *a2 = 0;
      a2[1] = 0;
      if (v6)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      }
    }
  }
  else
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
  }
}

void sub_22CFDA814(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t RoseCapabilities::init(RoseCapabilities *this, int a2)
{
  if (a2 == 8228)
  {
    ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage();
    uint64_t result = 1;
    *(_DWORD *)this = 1;
  }
  else if (a2 == 8198)
  {
    ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage();
    *(_DWORD *)this = 0;
    return 1;
  }
  else
  {
    ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage();
    return 0;
  }
  return result;
}

BOOL RoseCapabilities::supportsRTKitIOConfig(RoseCapabilities *this)
{
  return *(_DWORD *)this != 0;
}

uint64_t RoseCapabilities::supportsFirmwareLogCollectionFromRoseController(RoseCapabilities *this)
{
  return 1;
}

BOOL RoseCapabilities::requiresSeparateFirmwareTargetForCertification(RoseCapabilities *this)
{
  return *(_DWORD *)this == 0;
}

uint64_t RoseCapabilities::supportsRoseSEPairing(RoseCapabilities *this, unsigned int a2)
{
  int v2 = *(_DWORD *)this;
  unint64_t v3 = (0x15001100100uLL >> a2) & 1;
  if (a2 > 0x28) {
    LOBYTE(v3) = 0;
  }
  LOBYTE(v4) = (a2 & 0xFC) == 8;
  if (v2) {
    int v4 = *(_DWORD *)this;
  }
  if (v2 == 1) {
    char v5 = v3;
  }
  else {
    char v5 = v4;
  }
  return v5 & 1;
}

void RoseCapabilities::supportedFDRDataClassesForCalibrationType(_DWORD *a1@<X0>, int a2@<W1>, std::string **a3@<X8>)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!*a1)
  {
    if (a2 != 1)
    {
      if (!a2)
      {
        ACFUCommon::FDRDataClass::FDRDataClass((ACFUCommon::FDRDataClass *)v9, "rMCl");
        *a3 = 0;
        a3[1] = 0;
        a3[2] = 0;
        unint64_t v6 = (std::string *)operator new(0x30uLL);
        *a3 = v6;
        a3[1] = v6;
        a3[2] = v6 + 2;
        char v5 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ACFUCommon::FDRDataClass>,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass*>((uint64_t)(a3 + 2), (ACFUCommon::FDRDataClass *)v9, (ACFUCommon::FDRDataClass *)&v13, v6);
        goto LABEL_13;
      }
LABEL_9:
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      return;
    }
LABEL_12:
    ACFUCommon::FDRDataClass::FDRDataClass((ACFUCommon::FDRDataClass *)v9, "rSCl");
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
    uint64_t v8 = (std::string *)operator new(0x30uLL);
    *a3 = v8;
    a3[1] = v8;
    a3[2] = v8 + 2;
    char v5 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ACFUCommon::FDRDataClass>,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass*>((uint64_t)(a3 + 2), (ACFUCommon::FDRDataClass *)v9, (ACFUCommon::FDRDataClass *)&v13, v8);
    goto LABEL_13;
  }
  if (a2 == 2)
  {
    ACFUCommon::FDRDataClass::FDRDataClass((ACFUCommon::FDRDataClass *)v9, "rMNB", "rMC2");
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
    unint64_t v7 = (std::string *)operator new(0x30uLL);
    *a3 = v7;
    a3[1] = v7;
    a3[2] = v7 + 2;
    char v5 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ACFUCommon::FDRDataClass>,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass*>((uint64_t)(a3 + 2), (ACFUCommon::FDRDataClass *)v9, (ACFUCommon::FDRDataClass *)&v13, v7);
    goto LABEL_13;
  }
  if (a2 == 1) {
    goto LABEL_12;
  }
  if (a2) {
    goto LABEL_9;
  }
  ACFUCommon::FDRDataClass::FDRDataClass((ACFUCommon::FDRDataClass *)v9, "rMUB", "rMC2");
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  int v4 = (std::string *)operator new(0x30uLL);
  *a3 = v4;
  a3[1] = v4;
  a3[2] = v4 + 2;
  char v5 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ACFUCommon::FDRDataClass>,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass*>((uint64_t)(a3 + 2), (ACFUCommon::FDRDataClass *)v9, (ACFUCommon::FDRDataClass *)&v13, v4);
LABEL_13:
  a3[1] = v5;
  if (v12 < 0) {
    operator delete(__p);
  }
  if (v10 < 0) {
    operator delete(v9[0]);
  }
}

void sub_22CFDABD8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  unint64_t v6 = va_arg(va1, void **);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v4 = v3;
  *(void *)(v2 + 8) = v4;
  std::vector<ACFUCommon::FDRDataClass>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  ACFUCommon::FDRDataClass::~FDRDataClass((void **)va1);
  _Unwind_Resume(a1);
}

void ACFUCommon::FDRDataClass::~FDRDataClass(void **this)
{
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

__CFString *RoseCapabilities::chipNameForCertification(RoseCapabilities *this)
{
  if (*(_DWORD *)this) {
    return @"R2";
  }
  else {
    return @"R1";
  }
}

ACFUCommon::FDRDataClass *ACFUCommon::FDRDataClass::FDRDataClass(ACFUCommon::FDRDataClass *this, char *a2)
{
  uint64_t v3 = std::string::basic_string[abi:ne180100]<0>(this, a2);
  std::string::basic_string[abi:ne180100]<0>(v3 + 3, (char *)&unk_22CFE9A21);
  return this;
}

void sub_22CFDACD8(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

ACFUCommon::FDRDataClass *ACFUCommon::FDRDataClass::FDRDataClass(ACFUCommon::FDRDataClass *this, char *a2, char *a3)
{
  char v5 = std::string::basic_string[abi:ne180100]<0>(this, a2);
  std::string::basic_string[abi:ne180100]<0>(v5 + 3, a3);
  return this;
}

void sub_22CFDAD2C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::shared_ptr<RoseCapabilities>::shared_ptr[abi:ne180100]<RoseCapabilities,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = operator new(0x20uLL);
  void *v4 = &unk_26E056A48;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_22CFDADA0(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<RoseCapabilities *,std::shared_ptr<RoseCapabilities>::__shared_ptr_default_delete<RoseCapabilities,RoseCapabilities>,std::allocator<RoseCapabilities>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<RoseCapabilities *,std::shared_ptr<RoseCapabilities>::__shared_ptr_default_delete<RoseCapabilities,RoseCapabilities>,std::allocator<RoseCapabilities>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  if (v1) {
    operator delete(v1);
  }
}

uint64_t std::__shared_ptr_pointer<RoseCapabilities *,std::shared_ptr<RoseCapabilities>::__shared_ptr_default_delete<RoseCapabilities,RoseCapabilities>,std::allocator<RoseCapabilities>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ACFUCommon::FDRDataClass>,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass*>(uint64_t a1, ACFUCommon::FDRDataClass *a2, ACFUCommon::FDRDataClass *a3, std::string *this)
{
  uint64_t v4 = this;
  char v10 = this;
  unint64_t v11 = this;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    unint64_t v6 = a2;
    do
    {
      ACFUCommon::FDRDataClass::FDRDataClass(v4, v6);
      unint64_t v6 = (const ACFUCommon::FDRDataClass *)((char *)v6 + 48);
      uint64_t v4 = v11 + 2;
      v11 += 2;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ACFUCommon::FDRDataClass>,ACFUCommon::FDRDataClass*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_22CFDAEC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

std::string *ACFUCommon::FDRDataClass::FDRDataClass(std::string *this, const ACFUCommon::FDRDataClass *a2)
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
  char v5 = this + 1;
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)a2 + 3), *((void *)a2 + 4));
  }
  else
  {
    long long v6 = *(_OWORD *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((void *)a2 + 5);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  return this;
}

void sub_22CFDAF58(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ACFUCommon::FDRDataClass>,ACFUCommon::FDRDataClass*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<ACFUCommon::FDRDataClass>,ACFUCommon::FDRDataClass*>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<ACFUCommon::FDRDataClass>,ACFUCommon::FDRDataClass*>::operator()[abi:ne180100](uint64_t *a1)
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
      std::allocator<ACFUCommon::FDRDataClass>::destroy[abi:ne180100](v5, v3);
    }
    while (v3 != v4);
  }
}

void std::allocator<ACFUCommon::FDRDataClass>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
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

void std::vector<ACFUCommon::FDRDataClass>::__destroy_vector::operator()[abi:ne180100](void ***a1)
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
        std::allocator<ACFUCommon::FDRDataClass>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t RoseEvent::create@<X0>(ACFULogging *a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, void *a4@<X8>)
{
  *a4 = 0;
  if (!a1 || a2 <= 3)
  {
    ACFULogging::getLogInstance(a1);
    return ACFULogging::handleMessage();
  }
  int v8 = *(_DWORD *)a1 & 0x3FF;
  switch(v8)
  {
    case 525:
      char v9 = operator new(0x18uLL);
      v9[1] = 0;
      char v10 = &unk_26E056B50;
      break;
    case 144:
      char v9 = operator new(0x18uLL);
      v9[1] = 0;
      char v10 = &unk_26E056B20;
      break;
    case 128:
      char v9 = operator new(0x18uLL);
      v9[1] = 0;
      char v10 = &unk_26E056AF0;
      break;
    default:
      ACFULogging::getLogInstance(a1);
      char v12 = (ACFULogging *)ACFULogging::handleMessage();
      ACFULogging::getLogInstance(v12);
      return ACFULogging::handleMessage();
  }
  *char v9 = v10;
  *a4 = v9;
  uint64_t result = RoseEvent::init((uint64_t)v9, (const UInt8 *)a1, a2, a3);
  if ((result & 1) == 0)
  {
    ACFULogging::getLogInstance((ACFULogging *)result);
    return ACFULogging::handleMessage();
  }
  return result;
}

void sub_22CFDB29C(_Unwind_Exception *exception_object)
{
  void *v1 = 0;
  _Unwind_Resume(exception_object);
}

uint64_t RoseEvent::init(uint64_t a1, const UInt8 *a2, CFIndex a3, int a4)
{
  if (a2 && a3)
  {
    CFDataRef v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, a3);
    *(void *)(a1 + 8) = v6;
    if (v6)
    {
      *(_DWORD *)(a1 + 16) = a4;
      return 1;
    }
    ACFULogging::getLogInstance(0);
  }
  else
  {
    ACFULogging::getLogInstance((ACFULogging *)a1);
  }
  ACFULogging::handleMessage();
  return 0;
}

uint64_t RoseEvent::validate(CFDataRef *this)
{
  BytePtr = CFDataGetBytePtr(this[1]);
  unint64_t Length = (ACFULogging *)CFDataGetLength(this[1]);
  if (BytePtr)
  {
    unint64_t v4 = (unint64_t)Length - 113;
    ACFULogging::getLogInstance(Length);
    if (v4 > 0xFFFFFFFFFFFFFF94)
    {
      std::string::basic_string[abi:ne180100]<0>(&v11, "RoseEvent");
      uint64_t v5 = std::string::append(&v11, "::");
      long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
      v12.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v12.__r_.__value_.__l.__data_ = v6;
      v5->__r_.__value_.__l.__size_ = 0;
      v5->__r_.__value_.__r.__words[2] = 0;
      v5->__r_.__value_.__r.__words[0] = 0;
      unint64_t v7 = std::string::append(&v12, "validate");
      long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
      std::string::size_type v14 = v7->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v8;
      v7->__r_.__value_.__l.__size_ = 0;
      v7->__r_.__value_.__r.__words[2] = 0;
      v7->__r_.__value_.__r.__words[0] = 0;
      char v9 = (ACFULogging *)ACFULogging::handleMessageBinary();
      if (SHIBYTE(v14) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v12.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v11.__r_.__value_.__l.__data_);
      }
      if ((~*(_DWORD *)BytePtr & 0xC000) == 0) {
        return 1;
      }
      ACFULogging::getLogInstance(v9);
    }
  }
  else
  {
    ACFULogging::getLogInstance(Length);
  }
  ACFULogging::handleMessage();
  return 0;
}

void sub_22CFDB530(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
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

void RoseEvent::~RoseEvent(RoseEvent *this)
{
  *(void *)this = &unk_26E056AC0;
  uint64_t v2 = (const void *)*((void *)this + 1);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 1) = 0;
  }
}

void RoseEvent::RoseEvent(RoseEvent *this)
{
  *(void *)this = &unk_26E056AC0;
  *((void *)this + 1) = 0;
}

void RoseCommandCompleteEvent::RoseCommandCompleteEvent(RoseCommandCompleteEvent *this)
{
  *(void *)this = &unk_26E056AF0;
  *((void *)this + 1) = 0;
}

uint64_t RoseCommandCompleteEvent::validate(CFDataRef *a1, int a2)
{
  CFIndex Length = CFDataGetLength(a1[1]);
  BytePtr = CFDataGetBytePtr(a1[1]);
  long long v6 = (ACFULogging *)(*(uint64_t (**)(CFDataRef *))*a1)(a1);
  if ((v6 & 1) != 0 && ((*(_DWORD *)BytePtr & 0x3C00) == 0x800 ? (BOOL v7 = Length == 10) : (BOOL v7 = 0), v7))
  {
    if (*((unsigned __int16 *)BytePtr + 3) == a2 && !*((_WORD *)BytePtr + 2))
    {
      (*((void (**)(CFDataRef *))*a1 + 3))(a1);
      return 1;
    }
    ACFULogging::getLogInstance(v6);
    ACFULogging::handleMessage();
    (*((void (**)(CFDataRef *))*a1 + 3))(a1);
  }
  else
  {
    ACFULogging::getLogInstance(v6);
    ACFULogging::handleMessage();
  }
  return 0;
}

uint64_t RoseCommandCompleteEvent::log(CFDataRef *this)
{
  BytePtr = (ACFULogging *)CFDataGetBytePtr(this[1]);
  if (BytePtr && (BytePtr = (ACFULogging *)CFDataGetLength(this[1]), BytePtr == (ACFULogging *)10))
  {
    ACFULogging::getLogInstance((ACFULogging *)0xA);
    uint64_t v3 = (ACFULogging *)ACFULogging::handleMessage();
    ACFULogging::getLogInstance(v3);
  }
  else
  {
    ACFULogging::getLogInstance(BytePtr);
  }
  return ACFULogging::handleMessage();
}

void RoseFDRTrustEvaluationCompleteEvent::RoseFDRTrustEvaluationCompleteEvent(RoseFDRTrustEvaluationCompleteEvent *this)
{
  *(void *)this = &unk_26E056B20;
  *((void *)this + 1) = 0;
}

uint64_t RoseFDRTrustEvaluationCompleteEvent::validate(CFDataRef *this)
{
  CFIndex Length = CFDataGetLength(this[1]);
  BytePtr = CFDataGetBytePtr(this[1]);
  uint64_t v4 = RoseEvent::validate(this);
  if ((v4 & 1) != 0 && (*(_DWORD *)BytePtr & 0x3FFF) == 0x890 && Length == 48)
  {
    if (!*(void *)(BytePtr + 6) && !*((_WORD *)BytePtr + 2))
    {
      (*((void (**)(CFDataRef *))*this + 3))(this);
      return 1;
    }
    ACFULogging::getLogInstance((ACFULogging *)v4);
    ACFULogging::handleMessage();
    (*((void (**)(CFDataRef *))*this + 3))(this);
  }
  else
  {
    ACFULogging::getLogInstance((ACFULogging *)v4);
    ACFULogging::handleMessage();
  }
  return 0;
}

uint64_t RoseFDRTrustEvaluationCompleteEvent::log(CFDataRef *this)
{
  BytePtr = (ACFULogging *)CFDataGetBytePtr(this[1]);
  if (BytePtr && (BytePtr = (ACFULogging *)CFDataGetLength(this[1]), BytePtr == (ACFULogging *)48))
  {
    ACFULogging::getLogInstance((ACFULogging *)0x30);
    uint64_t v3 = (ACFULogging *)ACFULogging::handleMessage();
    ACFULogging::getLogInstance(v3);
  }
  else
  {
    ACFULogging::getLogInstance(BytePtr);
  }
  return ACFULogging::handleMessage();
}

void RoseInitDoneEvent::RoseInitDoneEvent(RoseInitDoneEvent *this)
{
  *(void *)this = &unk_26E056B50;
  *((void *)this + 1) = 0;
}

uint64_t RoseInitDoneEvent::validate(CFDataRef *this)
{
  CFIndex Length = CFDataGetLength(this[1]);
  BytePtr = CFDataGetBytePtr(this[1]);
  uint64_t v4 = RoseEvent::validate(this);
  if ((v4 & 1) == 0) {
    goto LABEL_16;
  }
  int v5 = *((_DWORD *)this + 4);
  if (v5 == 1)
  {
    if ((*(_DWORD *)BytePtr & 0x3C00) != 0
      || (*(_DWORD *)BytePtr & 0x3FF) != 0x20D
      || (unint64_t)Length < 0x70
      || Length >= 129)
    {
      goto LABEL_16;
    }
  }
  else if (v5 {
         || (*(_DWORD *)BytePtr & 0x3C00) != 0
  }
         || (*(_DWORD *)BytePtr & 0x3FF) != 0x20D
         || (unint64_t)Length < 0x46
         || Length > 128
         || Length != BytePtr[42] + 43)
  {
LABEL_16:
    ACFULogging::getLogInstance((ACFULogging *)v4);
    ACFULogging::handleMessage();
    return 0;
  }
  if (!*((_WORD *)BytePtr + 2))
  {
    (*((void (**)(CFDataRef *))*this + 3))(this);
    return 1;
  }
  ACFULogging::getLogInstance((ACFULogging *)v4);
  ACFULogging::handleMessage();
  (*((void (**)(CFDataRef *))*this + 3))(this);
  return 0;
}

uint64_t RoseInitDoneEvent::log(CFDataRef *this)
{
  uint64_t v1 = (RoseInitDoneEvent *)this;
  int v2 = *((_DWORD *)this + 4);
  if (v2 != 1)
  {
    if (!v2)
    {
      this = (CFDataRef *)CFDataGetBytePtr(this[1]);
      if (this)
      {
        uint64_t v3 = (RoseInitDoneEvent *)this;
        this = (CFDataRef *)CFDataGetLength(*((CFDataRef *)v1 + 1));
        if ((unint64_t)this > 0x45)
        {
          ACFULogging::getLogInstance((ACFULogging *)this);
          uint64_t v4 = (ACFULogging *)ACFULogging::handleMessage();
          ACFULogging::getLogInstance(v4);
          ACFULogging::handleMessage();
          return RoseCommand::parsePingInfo((uint64_t)v3 + 6);
        }
      }
    }
LABEL_13:
    ACFULogging::getLogInstance((ACFULogging *)this);
    return ACFULogging::handleMessage();
  }
  this = (CFDataRef *)CFDataGetBytePtr(this[1]);
  if (!this) {
    goto LABEL_13;
  }
  long long v6 = (RoseInitDoneEvent *)this;
  this = (CFDataRef *)CFDataGetLength(*((CFDataRef *)v1 + 1));
  if ((unint64_t)this <= 0x6F) {
    goto LABEL_13;
  }
  ACFULogging::getLogInstance((ACFULogging *)this);
  ACFULogging::handleMessage();

  return RoseCommand::parsePingInfo((uint64_t)v6 + 4);
}

void RoseCommandCompleteEvent::~RoseCommandCompleteEvent(RoseCommandCompleteEvent *this)
{
  RoseEvent::~RoseEvent(this);

  operator delete(v1);
}

void RoseFDRTrustEvaluationCompleteEvent::~RoseFDRTrustEvaluationCompleteEvent(RoseFDRTrustEvaluationCompleteEvent *this)
{
  RoseEvent::~RoseEvent(this);

  operator delete(v1);
}

void RoseInitDoneEvent::~RoseInitDoneEvent(RoseInitDoneEvent *this)
{
  RoseEvent::~RoseEvent(this);

  operator delete(v1);
}

BOOL RoseCommand::parsePingInfo(uint64_t a1)
{
  BOOL v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  int v2 = operator new(0x28uLL);
  uint64_t v19 = v2;
  long long v20 = xmmword_22CFED210;
  long long v3 = *(_OWORD *)(a1 + 16);
  *int v2 = *(_OWORD *)a1;
  v2[1] = v3;
  *((unsigned char *)v2 + 32) = 0;
  ACFULogging::getLogInstance((ACFULogging *)v2);
  uint64_t v4 = (ACFULogging *)ACFULogging::handleMessage();
  unsigned int v5 = *(unsigned __int8 *)(a1 + 36);
  if (v5 <= 0x1A)
  {
    ACFULogging::getLogInstance(v4);
    ACFULogging::handleMessage();
  }
  else
  {
    long long v6 = *(void **)(a1 + 41);
    uint64_t v7 = *(void *)(a1 + 49);
    if (SHIBYTE(v23) < 0) {
      operator delete(v21);
    }
    BOOL v21 = v6;
    uint64_t v22 = v7;
    LOBYTE(v23) = 0;
    HIBYTE(v23) = 16;
    ACFULogging::getLogInstance(v4);
    long long v8 = (ACFULogging *)ACFULogging::handleMessage();
    if (*(unsigned __int8 *)(a1 + 36) >= 0x1Cu)
    {
      ACFULogging::getLogInstance(v8);
      char v9 = (ACFULogging *)ACFULogging::handleMessage();
      ACFULogging::getLogInstance(v9);
      std::string::basic_string[abi:ne180100]<0>(&v15, "RoseCommand");
      char v10 = std::string::append(&v15, "::");
      long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
      v16.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v11;
      v10->__r_.__value_.__l.__size_ = 0;
      v10->__r_.__value_.__r.__words[2] = 0;
      v10->__r_.__value_.__r.__words[0] = 0;
      std::string v12 = std::string::append(&v16, "parsePingInfo");
      long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
      std::string::size_type v18 = v12->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v13;
      v12->__r_.__value_.__l.__size_ = 0;
      v12->__r_.__value_.__r.__words[2] = 0;
      v12->__r_.__value_.__r.__words[0] = 0;
      ACFULogging::handleMessageBinary();
      if (SHIBYTE(v18) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v16.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v15.__r_.__value_.__l.__data_);
      }
    }
  }
  if (SHIBYTE(v20) < 0) {
    operator delete(v19);
  }
  if (SHIBYTE(v23) < 0) {
    operator delete(v21);
  }
  return v5 > 0x1A;
}

void sub_22CFDC1CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  if (a36 < 0) {
    operator delete(__p);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v36 - 89) < 0) {
    operator delete(*(void **)(v36 - 112));
  }
  if (*(char *)(v36 - 65) < 0) {
    operator delete(*(void **)(v36 - 88));
  }
  _Unwind_Resume(exception_object);
}

uint64_t RoseCommand::parsePingInfo(uint64_t a1)
{
  long long v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  int v2 = operator new(0x28uLL);
  std::string::size_type v18 = v2;
  long long v19 = xmmword_22CFED210;
  long long v3 = *(_OWORD *)(a1 + 18);
  *int v2 = *(_OWORD *)(a1 + 2);
  v2[1] = v3;
  *((unsigned char *)v2 + 32) = 0;
  ACFULogging::getLogInstance((ACFULogging *)v2);
  uint64_t v4 = (ACFULogging *)ACFULogging::handleMessage();
  unsigned int v5 = *(void **)(a1 + 42);
  uint64_t v6 = *(void *)(a1 + 50);
  if (SHIBYTE(v22) < 0) {
    operator delete(v20);
  }
  long long v20 = v5;
  uint64_t v21 = v6;
  LOBYTE(v22) = 0;
  HIBYTE(v22) = 16;
  ACFULogging::getLogInstance(v4);
  uint64_t v7 = (ACFULogging *)ACFULogging::handleMessage();
  ACFULogging::getLogInstance(v7);
  long long v8 = (ACFULogging *)ACFULogging::handleMessage();
  ACFULogging::getLogInstance(v8);
  std::string::basic_string[abi:ne180100]<0>(&v14, "RoseCommand");
  char v9 = std::string::append(&v14, "::");
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v15.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  long long v11 = std::string::append(&v15, "parsePingInfo");
  long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  std::string::size_type v17 = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageBinary();
  if (SHIBYTE(v17) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v19) < 0) {
    operator delete(v18);
  }
  if (SHIBYTE(v22) < 0) {
    operator delete(v20);
  }
  return 1;
}

void sub_22CFDC488(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  if (a36 < 0) {
    operator delete(__p);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v36 - 73) < 0) {
    operator delete(*(void **)(v36 - 96));
  }
  if (*(char *)(v36 - 49) < 0) {
    operator delete(*(void **)(v36 - 72));
  }
  _Unwind_Resume(exception_object);
}

void *RoseCommand::create(int a1, int a2, unint64_t a3, char a4)
{
  long long v8 = operator new(0x30uLL);
  v8[1] = 0;
  v8[2] = 0;
  void *v8 = 0;
  *((_DWORD *)v8 + 6) = a2;
  *((_DWORD *)v8 + 7) = a1;
  *((unsigned char *)v8 + 32) = a4;
  v8[5] = 0;
  BOOL v9 = RoseCommand::init((RoseCommand *)v8, a3);
  if (!v9)
  {
    ACFULogging::getLogInstance((ACFULogging *)v9);
    ACFULogging::handleMessage();
    if (*v8) {
      operator delete((void *)*v8);
    }
    operator delete(v8);
    return 0;
  }
  return v8;
}

uint64_t RoseCommand::RoseCommand(uint64_t result, int a2, int a3, char a4)
{
  *(void *)uint64_t result = 0;
  *(void *)(result + 8) = 0;
  *(void *)(result + 16) = 0;
  *(_DWORD *)(result + 24) = a3;
  *(_DWORD *)(result + 28) = a2;
  *(unsigned char *)(result + 32) = a4;
  *(void *)(result + 40) = 0;
  return result;
}

BOOL RoseCommand::init(RoseCommand *this, unint64_t a2)
{
  if (a2 >= 0x2D)
  {
    ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage();
  }
  else
  {
    *((void *)this + 5) = a2 + 4;
    char v8 = 0;
    std::vector<unsigned char>::vector(&v9, a2 + 4, &v8);
    uint64_t v4 = *(void **)this;
    if (*(void *)this)
    {
      *((void *)this + 1) = v4;
      operator delete(v4);
    }
    unsigned int v5 = (unsigned int *)v9;
    *(_OWORD *)this = v9;
    *((void *)this + 2) = v10;
    unsigned int v6 = *v5 & 0xFFFFC3FF | ((*((_DWORD *)this + 7) & 0xF) << 10);
    unsigned int *v5 = v6;
    unsigned int *v5 = v6 & 0xFFFF3C00 | *((_DWORD *)this + 6) & 0x3FF | 0x4000;
  }
  return a2 < 0x2D;
}

void RoseCommand::~RoseCommand(RoseCommand *this)
{
  int v2 = *(void **)this;
  if (v2)
  {
    *((void *)this + 1) = v2;
    operator delete(v2);
  }
}

uint64_t RoseCommand::getPayload(RoseCommand *this)
{
  return *(void *)this + 4;
}

uint64_t RoseCommand::getPacketData(RoseCommand *this)
{
  return *(void *)this;
}

uint64_t RoseCommand::getPacketLength(RoseCommand *this)
{
  return *((void *)this + 5);
}

BOOL RoseCommand::setPayloadLength(RoseCommand *this, uint64_t a2)
{
  unint64_t v2 = a2 + 4;
  if ((unint64_t)(a2 + 4) <= 0x30)
  {
    unint64_t v4 = *((void *)this + 1) - *(void *)this;
    if (v2 > v4)
    {
      char v6 = 0;
      std::vector<unsigned char>::__append(this, v2 - v4, &v6);
    }
    *((void *)this + 5) = v2;
  }
  return v2 < 0x31;
}

uint64_t RoseCommand::validateResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((unint64_t)(a3 - 113) > 0xFFFFFFFFFFFFFF94 && ((*(_DWORD *)a2 >> 10) & 0xF) == *(_DWORD *)(a1 + 28))
  {
    BOOL v3 = (*(_DWORD *)a2 & 0xC000) == 0x8000 && (*(_DWORD *)a2 & 0x3FF) == *(_DWORD *)(a1 + 24);
    if (v3 && (!*(unsigned char *)(a1 + 32) || !*(_WORD *)(a2 + 4))) {
      return 1;
    }
  }
  ACFULogging::getLogInstance((ACFULogging *)a1);
  ACFULogging::handleMessage();
  return 0;
}

void *std::vector<unsigned char>::vector(void *a1, size_t a2, unsigned char *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    size_t v5 = a2;
    std::vector<unsigned char>::__vallocate[abi:ne180100](a1, a2);
    char v6 = (unsigned char *)a1[1];
    uint64_t v7 = &v6[v5];
    do
    {
      *v6++ = *a3;
      --v5;
    }
    while (v5);
    a1[1] = v7;
  }
  return a1;
}

void sub_22CFDC8E4(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(void **)v1;
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
    std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void std::vector<unsigned char>::__append(void *a1, unint64_t a2, unsigned char *a3)
{
  unint64_t v4 = a2;
  uint64_t v7 = (unsigned char *)a1[1];
  uint64_t v6 = a1[2];
  if (v6 - (uint64_t)v7 >= a2)
  {
    if (a2)
    {
      long long v13 = &v7[a2];
      do
      {
        *v7++ = *a3;
        --v4;
      }
      while (v4);
      uint64_t v7 = v13;
    }
    a1[1] = v7;
  }
  else
  {
    char v8 = &v7[-*a1];
    unint64_t v9 = (unint64_t)&v8[a2];
    if ((uint64_t)&v8[a2] < 0) {
      std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = v6 - *a1;
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v11 = v9;
    }
    if (v11) {
      long long v12 = operator new(v11);
    }
    else {
      long long v12 = 0;
    }
    std::string v14 = &v8[(void)v12];
    std::string v15 = &v8[(void)v12 + v4];
    std::string v16 = &v8[(void)v12];
    do
    {
      *v16++ = *a3;
      --v4;
    }
    while (v4);
    std::string::size_type v17 = (unsigned char *)*a1;
    if (v7 != (unsigned char *)*a1)
    {
      do
      {
        char v18 = *--v7;
        *--std::string v14 = v18;
      }
      while (v7 != v17);
      uint64_t v7 = (unsigned char *)*a1;
    }
    *a1 = v14;
    a1[1] = v15;
    a1[2] = (char *)v12 + v11;
    if (v7)
    {
      operator delete(v7);
    }
  }
}

uint64_t RoseCalibration::sendCalibration(uint64_t *a1, uint64_t a2, long long *a3)
{
  uint64_t v6 = (int *)operator new(0xCuLL);
  v18[1] = v6 + 3;
  v18[2] = v6 + 3;
  *(void *)uint64_t v6 = 0x100000000;
  v6[2] = 2;
  v18[0] = v6;
  uint64_t v7 = *a1;
  char v8 = (std::__shared_weak_count *)a1[1];
  v14[0] = v7;
  v14[1] = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unint64_t v9 = *(_DWORD **)a2;
  uint64_t v10 = *(void *)(a2 + 8);
  v13[0] = v9;
  v13[1] = (_DWORD *)v10;
  if (v10) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
  }
  RoseCalibration::sendCalibration((uint64_t)v14, v13, a3, v18, (uint64_t)v15);
  uint64_t v11 = v17;
  std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy((uint64_t)v15, v16);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10);
  }
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  operator delete(v6);
  return v11;
}

void sub_22CFDCB50(_Unwind_Exception *a1)
{
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  operator delete(v1);
  _Unwind_Resume(a1);
}

void RoseCalibration::sendCalibration(uint64_t a1@<X0>, _DWORD **a2@<X1>, long long *a3@<X2>, int **a4@<X3>, uint64_t a5@<X8>)
{
  v58[4] = *MEMORY[0x263EF8340];
  v51[0] = 0;
  v51[1] = 0;
  unint64_t v49 = 0;
  CFTypeID v50 = (uint64_t *)v51;
  char v47 = 0;
  unint64_t v48 = 0;
  v46[0] = 0;
  v46[1] = 0;
  uint64_t v45 = v46;
  long long v8 = *a3;
  LOBYTE(v44) = *((unsigned char *)a3 + 16);
  long long v43 = v8;
  unint64_t v9 = (char *)operator new(0x20uLL);
  *(void *)unint64_t v9 = &unk_26E056BD8;
  *(_OWORD *)(v9 + 8) = v43;
  *((void *)v9 + 3) = v44;
  v58[3] = v9;
  uint64_t v10 = *a4;
  uint64_t v36 = a5;
  v37 = a4[1];
  if (*a4 != v37)
  {
LABEL_2:
    RoseCapabilities::supportedFDRDataClassesForCalibrationType(*a2, *v10, (std::string **)&v42);
    std::string::size_type size = v42.__r_.__value_.__l.__size_;
    for (std::string::size_type i = v42.__r_.__value_.__r.__words[0]; ; i += 48)
    {
      if (i == size)
      {
LABEL_37:
        v53.__r_.__value_.__r.__words[0] = (std::string::size_type)&v42;
        std::vector<ACFUCommon::FDRDataClass>::__destroy_vector::operator()[abi:ne180100]((void ***)&v53);
        if (++v10 != v37) {
          goto LABEL_2;
        }
        uint64_t v22 = v47;
        uint64_t v23 = v48;
        memset(&v53, 0, sizeof(v53));
        if (v47 != v48)
        {
          v24 = 0;
          size_t v25 = 0;
          do
          {
            int v26 = (char)v25;
            if ((v25 & 0x80u) == 0) {
              size_t v27 = v25;
            }
            else {
              size_t v27 = v53.__r_.__value_.__l.__size_;
            }
            std::string::basic_string[abi:ne180100]((uint64_t)&v42, v27 + 1);
            if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              uint64_t v28 = &v42;
            }
            else {
              uint64_t v28 = (std::string *)v42.__r_.__value_.__r.__words[0];
            }
            if (v27)
            {
              if ((v25 & 0x80u) == 0) {
                CFTypeID v29 = &v53;
              }
              else {
                CFTypeID v29 = v24;
              }
              memmove(v28, v29, v27);
            }
            *(_WORD *)((char *)&v28->__r_.__value_.__l.__data_ + v27) = 32;
            int v30 = SHIBYTE(v22->__r_.__value_.__r.__words[2]);
            if (v30 >= 0) {
              std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v31 = (const std::string::value_type *)v22;
            }
            else {
              std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v31 = (const std::string::value_type *)v22->__r_.__value_.__r.__words[0];
            }
            if (v30 >= 0) {
              std::string::size_type v32 = HIBYTE(v22->__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type v32 = v22->__r_.__value_.__l.__size_;
            }
            unint64_t v9 = (char *)std::string::append(&v42, v31, v32);
            std::string::size_type v33 = *(void *)v9;
            *(void *)&long long v56 = *((void *)v9 + 1);
            *(void *)((char *)&v56 + 7) = *(void *)(v9 + 15);
            size_t v25 = v9[23];
            *(void *)unint64_t v9 = 0;
            *((void *)v9 + 1) = 0;
            *((void *)v9 + 2) = 0;
            if (v26 < 0) {
              operator delete(v24);
            }
            v53.__r_.__value_.__r.__words[0] = v33;
            v53.__r_.__value_.__l.__size_ = v56;
            *(std::string::size_type *)((char *)&v53.__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)&v56 + 7);
            *((unsigned char *)&v53.__r_.__value_.__s + 23) = v25;
            if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v42.__r_.__value_.__l.__data_);
            }
            ++v22;
            v24 = (std::string *)v33;
          }
          while (v22 != v23);
        }
        goto LABEL_64;
      }
      if (*((unsigned char *)a3 + 16))
      {
        if (*(char *)(i + 47) < 0)
        {
          if (!*(void *)(i + 32)) {
            goto LABEL_10;
          }
        }
        else if (!*(unsigned char *)(i + 47))
        {
          goto LABEL_10;
        }
        long long v13 = (ACFULogging *)std::__tree<std::string>::__count_unique<std::string>((uint64_t)&v45, (const void **)(i + 24));
        if (v13)
        {
          ACFULogging::getLogInstance(v13);
          ACFULogging::handleMessage();
          goto LABEL_37;
        }
      }
LABEL_10:
      ACFUCommon::FDRDataClass::FDRDataClass(&v53, (const ACFUCommon::FDRDataClass *)i);
      long long v56 = 0uLL;
      uint64_t v57 = 0;
      v41.__r_.__value_.__r.__words[0] = (std::string::size_type)&v56;
      v41.__r_.__value_.__s.__data_[8] = 0;
      *(void *)&long long v56 = operator new(0x30uLL);
      *((void *)&v56 + 1) = v56;
      uint64_t v57 = v56 + 48;
      *((void *)&v56 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ACFUCommon::FDRDataClass>,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass*>((uint64_t)&v57, (ACFUCommon::FDRDataClass *)&v53, (ACFUCommon::FDRDataClass *)&v56, (std::string *)v56);
      if (v55 < 0) {
        operator delete(v54);
      }
      if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v53.__r_.__value_.__l.__data_);
      }
      (*(void (**)(std::string *__return_ptr))(**(void **)a1 + 24))(&v53);
      memset(&v41, 0, sizeof(v41));
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v41, (long long *)v53.__r_.__value_.__l.__data_, (long long *)v53.__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v53.__r_.__value_.__l.__size_ - v53.__r_.__value_.__r.__words[0]) >> 3));
      long long v14 = *(_OWORD *)&v41.__r_.__value_.__l.__data_;
      v52 = &v41;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v52);
      if ((void)v14 != *((void *)&v14 + 1))
      {
        std::__tree<RoseCapabilities::CalibrationType>::__emplace_unique_key_args<RoseCapabilities::CalibrationType,RoseCapabilities::CalibrationType const&>(&v50, v10, v10);
        if (*((unsigned char *)a3 + 16))
        {
          if (*(char *)(i + 47) < 0)
          {
            if (*(void *)(i + 32))
            {
LABEL_18:
              std::string v16 = v48;
              if ((unint64_t)v48 >= v49)
              {
                long long v20 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v47, (long long *)(i + 24));
              }
              else
              {
                if ((*(unsigned char *)(i + 47) & 0x80) != 0)
                {
                  std::string::__init_copy_ctor_external(v48, *(const std::string::value_type **)(i + 24), *(void *)(i + 32));
                }
                else
                {
                  long long v17 = *(_OWORD *)(i + 24);
                  v48->__r_.__value_.__r.__words[2] = *(void *)(i + 40);
                  *(_OWORD *)&v16->__r_.__value_.__l.__data_ = v17;
                }
                long long v20 = v16 + 1;
              }
              unint64_t v48 = v20;
              std::string v15 = (std::string *)std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t **)&v45, (const void **)(i + 24), i + 24);
              goto LABEL_33;
            }
          }
          else if (*(unsigned char *)(i + 47))
          {
            goto LABEL_18;
          }
        }
        char v18 = v48;
        if ((unint64_t)v48 >= v49)
        {
          std::string v15 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v47, (long long *)i);
        }
        else
        {
          if (*(char *)(i + 23) < 0)
          {
            std::string::__init_copy_ctor_external(v48, *(const std::string::value_type **)i, *(void *)(i + 8));
          }
          else
          {
            long long v19 = *(_OWORD *)i;
            v48->__r_.__value_.__r.__words[2] = *(void *)(i + 16);
            *(_OWORD *)&v18->__r_.__value_.__l.__data_ = v19;
          }
          std::string v15 = v18 + 1;
        }
        unint64_t v48 = v15;
      }
LABEL_33:
      if (v54)
      {
        ACFULogging::getLogInstance((ACFULogging *)v15);
        ACFULogging::handleMessage();
        int v35 = (int)v54;
        v41.__r_.__value_.__r.__words[0] = (std::string::size_type)&v53;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v41);
        v53.__r_.__value_.__r.__words[0] = (std::string::size_type)&v56;
        std::vector<ACFUCommon::FDRDataClass>::__destroy_vector::operator()[abi:ne180100]((void ***)&v53);
        v53.__r_.__value_.__r.__words[0] = (std::string::size_type)&v42;
        std::vector<ACFUCommon::FDRDataClass>::__destroy_vector::operator()[abi:ne180100]((void ***)&v53);
        uint64_t v34 = v36;
        goto LABEL_67;
      }
      memset(&v41, 0, sizeof(v41));
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v41, (long long *)v53.__r_.__value_.__l.__data_, (long long *)v53.__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v53.__r_.__value_.__l.__size_ - v53.__r_.__value_.__r.__words[0]) >> 3));
      long long v21 = *(_OWORD *)&v41.__r_.__value_.__l.__data_;
      v52 = &v41;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v52);
      v41.__r_.__value_.__r.__words[0] = (std::string::size_type)&v53;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v41);
      v53.__r_.__value_.__r.__words[0] = (std::string::size_type)&v56;
      std::vector<ACFUCommon::FDRDataClass>::__destroy_vector::operator()[abi:ne180100]((void ***)&v53);
      if ((void)v21 != *((void *)&v21 + 1)) {
        goto LABEL_37;
      }
    }
  }
  memset(&v53, 0, sizeof(v53));
LABEL_64:
  ACFULogging::getLogInstance((ACFULogging *)v9);
  ACFULogging::handleMessage();
  uint64_t v34 = v36;
  if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v53.__r_.__value_.__l.__data_);
  }
  int v35 = 0;
LABEL_67:
  std::set<RoseCapabilities::CalibrationType>::set[abi:ne180100](v40, (uint64_t)&v50);
  std::set<RoseCapabilities::CalibrationType>::set[abi:ne180100]((uint64_t *)v34, (uint64_t)v40);
  *(_DWORD *)(v34 + 24) = v35;
  std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy((uint64_t)v40, (void *)v40[1]);
  std::__function::__value_func<ACFUErrorCode ()(std::shared_ptr<ACFUTransport>,std::shared_ptr<ACFUFirmware>,std::string const&,__CFData const*)>::~__value_func[abi:ne180100](v58);
  std::__tree<std::string>::destroy((uint64_t)&v45, v46[0]);
  v53.__r_.__value_.__r.__words[0] = (std::string::size_type)&v47;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v53);
  std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy((uint64_t)&v50, v51[0]);
}

void sub_22CFDD1F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,char *a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,char a40,void *a41)
{
  a21 = v41 - 208;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a21);
  *(void *)(v41 - 208) = v41 - 160;
  std::vector<ACFUCommon::FDRDataClass>::__destroy_vector::operator()[abi:ne180100]((void ***)(v41 - 208));
  *(void *)(v41 - 208) = &__p;
  std::vector<ACFUCommon::FDRDataClass>::__destroy_vector::operator()[abi:ne180100]((void ***)(v41 - 208));
  std::__function::__value_func<ACFUErrorCode ()(std::shared_ptr<ACFUTransport>,std::shared_ptr<ACFUFirmware>,std::string const&,__CFData const*)>::~__value_func[abi:ne180100]((void *)(v41 - 136));
  std::__tree<std::string>::destroy((uint64_t)&a34, a35);
  *(void *)(v41 - 208) = &a37;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v41 - 208));
  std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy((uint64_t)&a40, a41);
  _Unwind_Resume(a1);
}

void *std::__function::__value_func<ACFUErrorCode ()(std::shared_ptr<ACFUTransport>,std::shared_ptr<ACFUFirmware>,std::string const&,__CFData const*)>::~__value_func[abi:ne180100](void *a1)
{
  unint64_t v2 = (void *)a1[3];
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

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  unint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    BOOL v3 = **a1;
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

void std::__tree<std::string>::destroy(uint64_t a1, char *a2)
{
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

__n128 std::__function::__func<RoseCalibration::sendCalibration(std::shared_ptr<ACFUROM>,std::shared_ptr<RoseCapabilities>,ACFUFDR::Config const&,std::vector<RoseCapabilities::CalibrationType> &)::$_0,std::allocator<RoseCalibration::sendCalibration(std::shared_ptr<ACFUROM>,std::shared_ptr<RoseCapabilities>,ACFUFDR::Config const&,std::vector<RoseCapabilities::CalibrationType> &)::$_0>,ACFUErrorCode ()(std::shared_ptr<ACFUTransport>,std::shared_ptr<ACFUFirmware>,std::string const&,__CFData const*)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = &unk_26E056BD8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<RoseCalibration::sendCalibration(std::shared_ptr<ACFUROM>,std::shared_ptr<RoseCapabilities>,ACFUFDR::Config const&,std::vector<RoseCapabilities::CalibrationType> &)::$_0,std::allocator<RoseCalibration::sendCalibration(std::shared_ptr<ACFUROM>,std::shared_ptr<RoseCapabilities>,ACFUFDR::Config const&,std::vector<RoseCapabilities::CalibrationType> &)::$_0>,ACFUErrorCode ()(std::shared_ptr<ACFUTransport>,std::shared_ptr<ACFUFirmware>,std::string const&,__CFData const*)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E056BD8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<RoseCalibration::sendCalibration(std::shared_ptr<ACFUROM>,std::shared_ptr<RoseCapabilities>,ACFUFDR::Config const&,std::vector<RoseCapabilities::CalibrationType> &)::$_0,std::allocator<RoseCalibration::sendCalibration(std::shared_ptr<ACFUROM>,std::shared_ptr<RoseCapabilities>,ACFUFDR::Config const&,std::vector<RoseCapabilities::CalibrationType> &)::$_0>,ACFUErrorCode ()(std::shared_ptr<ACFUTransport>,std::shared_ptr<ACFUFirmware>,std::string const&,__CFData const*)>::operator()(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, const __CFData **a5)
{
  uint64_t v6 = *(ACFULogging **)a2;
  uint64_t v7 = *(std::__shared_weak_count **)(a2 + 8);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  long long v8 = (std::__shared_weak_count *)a3[1];
  *a3 = 0;
  a3[1] = 0;
  if (v6 {
    && (CFDataRef v10 = *a5,
  }
  {
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v11 = RoseTransport::sendCalibration(v6, v10, *(unsigned __int8 *)(a1 + 24), a4);
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }
  else
  {
    ACFULogging::getLogInstance(v6);
    ACFULogging::handleMessage();
    uint64_t v11 = 1;
  }
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  return v11;
}

void sub_22CFDD64C(_Unwind_Exception *exception_object)
{
  if (v1)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
    if (!v2)
    {
LABEL_3:
      if (!v1) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (!v2)
  {
    goto LABEL_3;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  if (!v1) {
LABEL_5:
  }
    _Unwind_Resume(exception_object);
LABEL_4:
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  goto LABEL_5;
}

uint64_t std::__function::__func<RoseCalibration::sendCalibration(std::shared_ptr<ACFUROM>,std::shared_ptr<RoseCapabilities>,ACFUFDR::Config const&,std::vector<RoseCapabilities::CalibrationType> &)::$_0,std::allocator<RoseCalibration::sendCalibration(std::shared_ptr<ACFUROM>,std::shared_ptr<RoseCapabilities>,ACFUFDR::Config const&,std::vector<RoseCapabilities::CalibrationType> &)::$_0>,ACFUErrorCode ()(std::shared_ptr<ACFUTransport>,std::shared_ptr<ACFUFirmware>,std::string const&,__CFData const*)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<RoseCalibration::sendCalibration(std::shared_ptr<ACFUROM>,std::shared_ptr<RoseCapabilities>,ACFUFDR::Config const&,std::vector<RoseCapabilities::CalibrationType> &)::$_0,std::allocator<RoseCalibration::sendCalibration(std::shared_ptr<ACFUROM>,std::shared_ptr<RoseCapabilities>,ACFUFDR::Config const&,std::vector<RoseCapabilities::CalibrationType> &)::$_0>,ACFUErrorCode ()(std::shared_ptr<ACFUTransport>,std::shared_ptr<ACFUFirmware>,std::string const&,__CFData const*)>::target_type()
{
}

uint64_t std::__tree<std::string>::__count_unique<std::string>(uint64_t a1, const void **a2)
{
  uint64_t v2 = *(const void ***)(a1 + 8);
  if (v2)
  {
    uint64_t v4 = a1 + 16;
    uint64_t v5 = 1;
    do
    {
      if (!std::less<std::string>::operator()[abi:ne180100](v4, a2, v2 + 4))
      {
        if (!std::less<std::string>::operator()[abi:ne180100](v4, v2 + 4, a2)) {
          return v5;
        }
        ++v2;
      }
      uint64_t v2 = (const void **)*v2;
    }
    while (v2);
  }
  return 0;
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    long long v8 = a3;
  }
  else {
    long long v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

std::string *std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(std::string *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    __n128 result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_22CFDD834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::string>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  uint64_t v4 = this;
  uint64_t v11 = this;
  long long v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
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
      uint64_t v6 = (long long *)((char *)v6 + 24);
      long long v12 = ++v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_22CFDD99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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

uint64_t **std::__tree<RoseCapabilities::CalibrationType>::__emplace_unique_key_args<RoseCapabilities::CalibrationType,RoseCapabilities::CalibrationType const&>(uint64_t **a1, int *a2, _DWORD *a3)
{
  uint64_t v6 = a1 + 1;
  size_t v5 = a1[1];
  if (v5)
  {
    int v7 = *a2;
    while (1)
    {
      while (1)
      {
        long long v8 = (uint64_t **)v5;
        int v9 = *((_DWORD *)v5 + 7);
        if (v7 >= v9) {
          break;
        }
        size_t v5 = *v8;
        uint64_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      size_t v5 = v8[1];
      if (!v5)
      {
        uint64_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    long long v8 = a1 + 1;
LABEL_10:
    char v10 = (uint64_t *)operator new(0x20uLL);
    *((_DWORD *)v10 + 7) = *a3;
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
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
    char v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  }
  else {
    char v10 = 0;
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

void sub_22CFDDBFC(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
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
  v12[2] = &v15;
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

uint64_t *std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>(uint64_t **a1, const void **a2, uint64_t a3)
{
  unint64_t v5 = (uint64_t **)std::__tree<std::string>::__find_equal<std::string>((uint64_t)a1, &v8, a2);
  __n128 result = *v5;
  if (!*v5)
  {
    std::__tree<std::string>::__construct_node<std::string const&>((uint64_t)a1, a3, (uint64_t)&v7);
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__insert_node_at(a1, v8, v5, v7);
    return v7;
  }
  return result;
}

void *std::__tree<std::string>::__find_equal<std::string>(uint64_t a1, void *a2, const void **a3)
{
  unint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v8 = (void *)v4;
        uint64_t v9 = (const void **)(v4 + 32);
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        unint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v7, v9, a3)) {
        break;
      }
      unint64_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

void std::__tree<std::string>::__construct_node<std::string const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x38uLL);
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
    v7->__r_.__value_.__r.__words[2] = *(void *)(a2 + 16);
  }
  *(unsigned char *)(a3 + 16) = 1;
}

void sub_22CFDDFDC(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::string,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
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

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    uint64_t v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 23) = a2;
  }
  return a1;
}

uint64_t *std::set<RoseCapabilities::CalibrationType>::set[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::set<RoseCapabilities::CalibrationType>::insert[abi:ne180100]<std::__tree_const_iterator<RoseCapabilities::CalibrationType,std::__tree_node<RoseCapabilities::CalibrationType,void *> *,long>>(a1, *(int **)a2, (int *)(a2 + 8));
  return a1;
}

void sub_22CFDE120(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::set<RoseCapabilities::CalibrationType>::insert[abi:ne180100]<std::__tree_const_iterator<RoseCapabilities::CalibrationType,std::__tree_node<RoseCapabilities::CalibrationType,void *> *,long>>(uint64_t *result, int *a2, int *a3)
{
  if (a2 != a3)
  {
    uint64_t v4 = a2;
    uint64_t v5 = (uint64_t **)result;
    uint64_t v6 = result + 1;
    do
    {
      __n128 result = std::__tree<RoseCapabilities::CalibrationType>::__emplace_hint_unique_key_args<RoseCapabilities::CalibrationType,RoseCapabilities::CalibrationType const&>(v5, v6, v4 + 7, v4 + 7);
      uint64_t v7 = (int *)*((void *)v4 + 1);
      if (v7)
      {
        do
        {
          uint64_t v8 = v7;
          uint64_t v7 = *(int **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          uint64_t v8 = (int *)*((void *)v4 + 2);
          BOOL v9 = *(void *)v8 == (void)v4;
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

uint64_t *std::__tree<RoseCapabilities::CalibrationType>::__emplace_hint_unique_key_args<RoseCapabilities::CalibrationType,RoseCapabilities::CalibrationType const&>(uint64_t **a1, uint64_t *a2, int *a3, _DWORD *a4)
{
  uint64_t v6 = std::__tree<RoseCapabilities::CalibrationType>::__find_equal<RoseCapabilities::CalibrationType>(a1, a2, &v11, &v10, a3);
  uint64_t v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    uint64_t v7 = (uint64_t *)operator new(0x20uLL);
    *((_DWORD *)v7 + 7) = *a4;
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__insert_node_at(a1, (uint64_t)v11, v8, v7);
  }
  return v7;
}

uint64_t *std::__tree<RoseCapabilities::CalibrationType>::__find_equal<RoseCapabilities::CalibrationType>(void *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  uint64_t v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, int v7 = *((_DWORD *)a2 + 7), *a5 < v7))
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
      BOOL v9 = (uint64_t *)*a2;
      do
      {
        uint64_t v10 = v9;
        BOOL v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      char v13 = a2;
      do
      {
        uint64_t v10 = (uint64_t *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        char v13 = v10;
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
          long long v17 = (uint64_t *)v16;
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
      long long v17 = a1 + 1;
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
    long long v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      long long v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    long long v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      long long v19 = a4;
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
          long long v21 = (uint64_t *)v20;
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
      long long v21 = a1 + 1;
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

void RoseTransport::create(uint64_t *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, void *a4@<X8>)
{
  uint64_t v8 = (char *)operator new(0x78uLL);
  ACFUTransport::ACFUTransport((ACFUTransport *)v8);
  *(void *)uint64_t v8 = &unk_26E056C68;
  *(_OWORD *)(v8 + 24) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  v8[72] = 0;
  *((void *)v8 + 10) = 0;
  *((void *)v8 + 11) = 0;
  v8[96] = 0;
  *(void *)(v8 + 108) = 0;
  *(void *)(v8 + 100) = 0;
  *((_DWORD *)v8 + 29) = 0;
  *a4 = v8;
  uint64_t v9 = *a1;
  uint64_t v10 = (std::__shared_weak_count *)a1[1];
  v14[0] = v9;
  v14[1] = (uint64_t)v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  BOOL v11 = RoseTransport::init((uint64_t)v8, v14, a2, a3);
  BOOL v12 = v11;
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  if (!v12)
  {
    ACFULogging::getLogInstance((ACFULogging *)v11);
    ACFULogging::handleMessage();
    *a4 = 0;
    char v13 = *(void (**)(char *))(*(void *)v8 + 64);
    v13(v8);
  }
}

void sub_22CFDE548(_Unwind_Exception *a1)
{
  *uint64_t v2 = 0;
  (*(void (**)(uint64_t))(*(void *)v1 + 64))(v1);
  _Unwind_Resume(a1);
}

void RoseTransport::RoseTransport(RoseTransport *this)
{
  ACFUTransport::ACFUTransport(this);
  *(void *)uint64_t v1 = &unk_26E056C68;
  *(_OWORD *)(v1 + 24) = 0u;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_OWORD *)(v1 + 56) = 0u;
  *(unsigned char *)(v1 + 72) = 0;
  *(void *)(v1 + 80) = 0;
  *(void *)(v1 + 88) = 0;
  *(unsigned char *)(v1 + 96) = 0;
  *(void *)(v1 + 108) = 0;
  *(void *)(v1 + 100) = 0;
  *(_DWORD *)(v1 + 116) = 0;
}

BOOL RoseTransport::init(uint64_t a1, uint64_t *a2, uint64_t a3, int a4)
{
  BOOL v18 = 0;
  unsigned __int16 v17 = -8531;
  int v7 = (std::__shared_weak_count *)a2[1];
  uint64_t v15 = *a2;
  uint64_t v16 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  char v8 = ACFUTransport::init();
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  if ((v8 & 1) == 0) {
    return 0;
  }
  *(_DWORD *)(a1 + 100) = a4;
  *(void *)(a1 + 32) = a3;
  if (a3 || (BOOL result = RoseTransport::createRoseController((RoseTransport *)a1)))
  {
    PowerState = (ACFULogging *)RoseTransport::getPowerState((RoseTransport *)a1, &v18);
    if (PowerState
      || !v18
      && (ACFULogging::getLogInstance(PowerState),
          ACFULogging::handleMessage(),
          PowerState = (ACFULogging *)RoseTransport::setPowerState((RoseCapabilities **)a1, 1),
          PowerState))
    {
      ACFULogging::getLogInstance(PowerState);
    }
    else
    {
      if ((*(unsigned int (**)(void, unsigned __int16 *))(**(void **)(a1 + 32) + 120))(*(void *)(a1 + 32), &v17))
      {
        BOOL v11 = 1;
      }
      else
      {
        BOOL v11 = v17 == 57005;
      }
      if (v11)
      {
        ACFULogging::getLogInstance((ACFULogging *)v17);
      }
      else
      {
        RoseCapabilities::create((RoseCapabilities *)v17, (RoseCapabilities **)&v14);
        long long v12 = v14;
        long long v14 = 0uLL;
        char v13 = *(std::__shared_weak_count **)(a1 + 112);
        *(_OWORD *)(a1 + 104) = v12;
        if (v13)
        {
          std::__shared_weak_count::__release_shared[abi:ne180100](v13);
          char v13 = (std::__shared_weak_count *)*((void *)&v14 + 1);
          if (*((void *)&v14 + 1)) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v14 + 1));
          }
          if (*(void *)(a1 + 104)) {
            return 1;
          }
        }
        else if ((void)v12)
        {
          return 1;
        }
        ACFULogging::getLogInstance((ACFULogging *)v13);
      }
    }
    ACFULogging::handleMessage();
    return 0;
  }
  return result;
}

void sub_22CFDE7E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17)
{
  if (a17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a17);
  }
  _Unwind_Resume(exception_object);
}

BOOL RoseTransport::createRoseController(RoseTransport *this)
{
  kern_return_t ChildEntry;
  ACFULogging *v7;
  io_service_t v8;
  BOOL v9;
  CFAllocatorRef v10;
  CFUUIDRef v11;
  CFUUIDRef v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, void, void, char *);
  CFUUIDRef v16;
  CFUUIDBytes v17;
  uint64_t v18;
  dispatch_queue_t v19;
  void *v20;
  char *v21;
  ACFULogging *v22;
  char *v23;
  uint64_t v25;
  io_registry_entry_t child[2];

  *(void *)child = 0;
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceNameMatching("rose");
  MatchingService = (ACFULogging *)IOServiceGetMatchingService(v2, v3);
  if (MatchingService)
  {
    io_object_t v5 = MatchingService;
    ChildEntry = IORegistryEntryGetChildEntry((io_registry_entry_t)MatchingService, "IOService", child);
    int v7 = (ACFULogging *)IOObjectRelease(v5);
    char v8 = child[0];
    if (ChildEntry) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = child[0] == 0;
    }
    if (v9) {
      goto LABEL_24;
    }
    uint64_t v10 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
    BOOL v11 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0xAu, 0x3Au, 0xB3u, 0x17u, 0x88u, 0xE7u, 0x40u, 0xA0u, 0x89u, 0x68u, 0x33u, 0x55u, 0x58u, 0x14u, 0x66u, 0x63u);
    long long v12 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    char v13 = (uint64_t *)((char *)this + 24);
    LODWORD(v11) = IOCreatePlugInInterfaceForService(v8, v11, v12, (IOCFPlugInInterface ***)this + 3, (SInt32 *)&child[1]);
    int v7 = (ACFULogging *)IOObjectRelease(child[0]);
    if (v11) {
      goto LABEL_24;
    }
    long long v14 = *v13;
    if (!*v13) {
      goto LABEL_24;
    }
    uint64_t v15 = *(void (**)(uint64_t, void, void, char *))(*(void *)v14 + 8);
    uint64_t v16 = CFUUIDGetConstantUUIDWithBytes(v10, 0x10u, 0x3Au, 0xBDu, 0x4Au, 0x60u, 0x94u, 0x4Bu, 0xC0u, 0xAEu, 0xEEu, 0x3Eu, 0x37u, 0xF5u, 0xA2u, 0xFu, 0x3Bu);
    unsigned __int16 v17 = CFUUIDGetUUIDBytes(v16);
    v15(v14, *(void *)&v17.byte0, *(void *)&v17.byte8, (char *)this + 32);
    BOOL v18 = *((void *)this + 4);
    if (!v18)
    {
      ACFULogging::getLogInstance(0);
      goto LABEL_26;
    }
    int v7 = (ACFULogging *)(*(uint64_t (**)(uint64_t, ACFULogging *(*)(ACFULogging *, void *, os_log_type_t, const char *), void))(*(void *)v18 + 64))(v18, RoseTransport::roseControllerLogSink, 0);
    if (v7
      || (long long v19 = dispatch_queue_create("RoseQueue", 0),
          uint64_t v20 = (void *)*((void *)this + 5),
          *((void *)this + 5) = v19,
          v20,
          !*((void *)this + 5)))
    {
LABEL_24:
      ACFULogging::getLogInstance(v7);
      goto LABEL_26;
    }
    long long v21 = (char *)operator new(0x78uLL);
    *((void *)v21 + 14) = 0;
    *(void *)long long v21 = 1018212795;
    *(_OWORD *)(v21 + 8) = 0u;
    *(_OWORD *)(v21 + 24) = 0u;
    *((void *)v21 + 5) = 0;
    *((void *)v21 + 6) = 850045863;
    *(_OWORD *)(v21 + 56) = 0u;
    *(_OWORD *)(v21 + 72) = 0u;
    *(_OWORD *)(v21 + 88) = 0u;
    *(_OWORD *)(v21 + 100) = 0u;
    size_t v25 = 0;
    std::unique_ptr<ACFUSynchronize::Syncher>::reset[abi:ne180100]((uint64_t *)this + 7, (uint64_t)v21);
    std::unique_ptr<ACFUSynchronize::Syncher>::reset[abi:ne180100](&v25, 0);
    if (*((void *)this + 7))
    {
      uint64_t v23 = (char *)operator new(0x78uLL);
      *((void *)v23 + 14) = 0;
      *(void *)uint64_t v23 = 1018212795;
      *(_OWORD *)(v23 + 8) = 0u;
      *(_OWORD *)(v23 + 24) = 0u;
      *((void *)v23 + 5) = 0;
      *((void *)v23 + 6) = 850045863;
      *(_OWORD *)(v23 + 56) = 0u;
      *(_OWORD *)(v23 + 72) = 0u;
      *(_OWORD *)(v23 + 88) = 0u;
      *(_OWORD *)(v23 + 100) = 0u;
      size_t v25 = 0;
      std::unique_ptr<ACFUSynchronize::Syncher>::reset[abi:ne180100]((uint64_t *)this + 6, (uint64_t)v23);
      std::unique_ptr<ACFUSynchronize::Syncher>::reset[abi:ne180100](&v25, 0);
      if (*((void *)this + 6))
      {
        int v22 = (ACFULogging *)(*(uint64_t (**)(void, void))(**((void **)this + 4) + 72))(*((void *)this + 4), *((void *)this + 5));
        if (!v22)
        {
          int v22 = (ACFULogging *)(*(uint64_t (**)(void, void, RoseTransport *))(**((void **)this + 4)
                                                                                          + 336))(*((void *)this + 4), RoseTransport::eventCallback, this);
          if (!v22)
          {
            int v22 = (ACFULogging *)(*(uint64_t (**)(void, ACFULogging *(*)(ACFULogging *, uint64_t), RoseTransport *))(**((void **)this + 4) + 384))(*((void *)this + 4), RoseTransport::crashCallback, this);
            if (!v22)
            {
              *((unsigned char *)this + 96) = 1;
              goto LABEL_17;
            }
          }
        }
      }
    }
    ACFULogging::getLogInstance(v22);
  }
  else
  {
    ACFULogging::getLogInstance(MatchingService);
  }
LABEL_26:
  ACFULogging::handleMessage();
LABEL_17:
  if (*((unsigned char *)this + 96)) {
    return 1;
  }
  RoseTransport::destroyRoseController(this);
  return *((unsigned char *)this + 96) != 0;
}

uint64_t RoseTransport::getPowerState(RoseTransport *this, BOOL *a2)
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    ACFULogging::getLogInstance(0);
LABEL_13:
    ACFULogging::handleMessage();
    return 3029;
  }
  io_object_t v5 = Mutable;
  if (RoseTransport::getRoseDebugInfoDict(this, Mutable))
  {
    CFRelease(v5);
    ACFULogging::getLogInstance(v10);
    goto LABEL_13;
  }
  value = 0;
  int valuePtr = 0;
  ValueIfPresent = (ACFULogging *)CFDictionaryGetValueIfPresent(v5, @"RosePowerState", (const void **)&value);
  if (!ValueIfPresent)
  {
    ACFULogging::getLogInstance(ValueIfPresent);
LABEL_8:
    ACFULogging::handleMessage();
    uint64_t v8 = 3029;
    goto LABEL_9;
  }
  int v7 = (ACFULogging *)CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, &valuePtr);
  if (!v7)
  {
    ACFULogging::getLogInstance(v7);
    goto LABEL_8;
  }
  uint64_t v8 = 0;
  *a2 = valuePtr != 0;
LABEL_9:
  CFRelease(v5);
  return v8;
}

uint64_t RoseTransport::setPowerState(RoseCapabilities **this, uint64_t a2)
{
  if ((a2 & 1) == 0 && RoseCapabilities::supportsRTKitIOConfig(this[13]))
  {
    uint64_t v4 = (ACFULogging *)RoseTransport::applyResetGlitchWorkaround((RoseTransport *)this);
    if ((v4 & 1) == 0)
    {
      ACFULogging::getLogInstance(v4);
      ACFULogging::handleMessage();
    }
  }
  io_object_t v5 = (ACFULogging *)(*(uint64_t (**)(RoseCapabilities *, uint64_t))(*(void *)this[4] + 408))(this[4], a2);
  ACFULogging::getLogInstance(v5);
  ACFULogging::handleMessage();
  if (v5) {
    return 3028;
  }
  else {
    return 0;
  }
}

ACFULogging *RoseTransport::roseControllerLogSink(ACFULogging *this, void *a2, os_log_type_t a3, const char *a4)
{
  if ((int)a2 <= 1)
  {
    if (a2 > 1) {
      return this;
    }
    goto LABEL_7;
  }
  if (a2 == 2 || a2 == 16 || a2 == 17)
  {
LABEL_7:
    ACFULogging::getLogInstance(this);
    return (ACFULogging *)ACFULogging::handleMessage();
  }
  return this;
}

void *RoseTransport::eventCallback(RoseTransport *this, void *a2, uint64_t a3)
{
  if (this)
  {
    return RoseTransport::eventHandler(this, a2, a3);
  }
  else
  {
    ACFULogging::getLogInstance((ACFULogging *)this);
    return (void *)ACFULogging::handleMessage();
  }
}

ACFULogging *RoseTransport::crashCallback(ACFULogging *a1, uint64_t a2)
{
  ACFULogging::getLogInstance(a1);
  uint64_t v4 = (ACFULogging *)ACFULogging::handleMessage();
  if (a1)
  {
    return RoseTransport::crashHandler(a1, a2);
  }
  else
  {
    ACFULogging::getLogInstance(v4);
    return (ACFULogging *)ACFULogging::handleMessage();
  }
}

IOCFPlugInInterface **RoseTransport::destroyRoseController(RoseTransport *this)
{
  BOOL result = (IOCFPlugInInterface **)*((void *)this + 3);
  if (result)
  {
    uint64_t v3 = *((void *)this + 4);
    if (v3)
    {
      (*(void (**)(void))(*(void *)v3 + 24))(*((void *)this + 4));
      *((void *)this + 4) = 0;
      BOOL result = (IOCFPlugInInterface **)*((void *)this + 3);
    }
    BOOL result = (IOCFPlugInInterface **)IODestroyPlugInInterface(result);
    *((void *)this + 3) = 0;
  }
  return result;
}

uint64_t RoseTransport::getBootNonceHash(RoseTransport *this, unsigned __int8 *a2, size_t a3, unint64_t *a4)
{
  v13[1] = *MEMORY[0x263EF8340];
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = 0;
  bzero(v9, v8);
  uint64_t v10 = (ACFULogging *)(*(uint64_t (**)(void, unsigned __int8 *, size_t, size_t *))(**((void **)this + 4)
                                                                                              + 152))(*((void *)this + 4), a2, a3, v13);
  if (v10) {
    goto LABEL_12;
  }
  if (v13[0] - 1 < a3)
  {
    uint64_t v10 = (ACFULogging *)memcmp(v9, a2, v13[0]);
    if (v10)
    {
LABEL_8:
      ACFULogging::getLogInstance(v10);
      ACFULogging::handleMessage();
      uint64_t result = 0;
      *a4 = v13[0];
      return result;
    }
    BOOL v11 = (ACFULogging *)(*(uint64_t (**)(void))(**((void **)this + 4) + 144))(*((void *)this + 4));
    if (v11)
    {
      ACFULogging::getLogInstance(v11);
      ACFULogging::handleMessage();
      return 3008;
    }
    v13[0] = 0;
    uint64_t v10 = (ACFULogging *)(*(uint64_t (**)(void, unsigned __int8 *, size_t, size_t *))(**((void **)this + 4)
                                                                                                + 152))(*((void *)this + 4), a2, a3, v13);
    if (!v10)
    {
      if (v13[0] - 1 < a3)
      {
        uint64_t v10 = (ACFULogging *)memcmp(v9, a2, v13[0]);
        if (v10) {
          goto LABEL_8;
        }
      }
      goto LABEL_13;
    }
LABEL_12:
    ACFULogging::getLogInstance(v10);
    ACFULogging::handleMessage();
    return 3007;
  }
LABEL_13:
  ACFULogging::getLogInstance(v10);
  ACFULogging::handleMessage();
  return 3009;
}

void RoseTransport::getBoardParameters(RoseTransport *this@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  *(_WORD *)std::string v53 = -8531;
  *(_WORD *)v52 = -8531;
  unint64_t v50 = 0;
  *(void *)v51 = 0xDEADBEEFDEADBEEFLL;
  *(_OWORD *)bytes = 0u;
  long long v56 = 0u;
  *(void *)int v54 = 0;
  uint64_t v49 = 0;
  UInt8 v48 = -34;
  UInt8 v47 = -34;
  UInt8 v46 = -34;
  UInt8 v45 = -34;
  *(_WORD *)uint64_t v44 = -8531;
  size_t v8 = operator new(0x50uLL);
  std::string v42 = v8 + 5;
  long long v43 = v8 + 5;
  v8[2] = xmmword_264938AA0;
  void v8[3] = *(_OWORD *)&off_264938AB0;
  v8[4] = xmmword_264938AC0;
  _OWORD *v8 = xmmword_264938A80;
  v8[1] = *(_OWORD *)&off_264938A90;
  __p = v8;
  std::allocate_shared[abi:ne180100]<ACFUCommon::PersonalizeParams,std::allocator<ACFUCommon::PersonalizeParams>,std::vector<__CFString const*> &,void>((uint64_t)&__p, &v39);
  if (a3)
  {
    int BootNonceHash = RoseTransport::getBootNonceHash(this, bytes, 0x20uLL, &v50);
    if (BootNonceHash) {
      goto LABEL_14;
    }
    uint64_t v10 = v39;
    CFDataRef v11 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, 32);
    *((void *)v10 + 7) = v11;
    *((unsigned char *)v10 + 64) = v11 != 0;
  }
  if (a2)
  {
    long long v12 = (ACFULogging *)(*(uint64_t (**)(void, UInt8 *, uint64_t, uint64_t *))(**((void **)this + 4) + 160))(*((void *)this + 4), v54, 8, &v49);
    if (v12)
    {
      ACFULogging::getLogInstance(v12);
      ACFULogging::handleMessage();
      int BootNonceHash = 3007;
      goto LABEL_14;
    }
    ACFULogging::getLogInstance(v12);
    char v13 = (ACFULogging *)ACFULogging::handleMessage();
    if ((unint64_t)(v49 - 9) <= 0xFFFFFFFFFFFFFFF7)
    {
      ACFULogging::getLogInstance(v13);
      ACFULogging::handleMessage();
      int BootNonceHash = 3009;
      goto LABEL_14;
    }
    long long v14 = v39;
    CFDataRef v15 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v54, 8);
    *((void *)v14 + 9) = v15;
    *((unsigned char *)v14 + 80) = v15 != 0;
  }
  uint64_t v16 = (ACFULogging *)(*(uint64_t (**)(void, UInt8 *))(**((void **)this + 4) + 120))(*((void *)this + 4), v53);
  if (v16
    || *(unsigned __int16 *)v53 == 57005
    || (uint64_t v16 = (ACFULogging *)(*(uint64_t (**)(void, UInt8 *))(**((void **)this + 4) + 128))(*((void *)this + 4), v52), v16)|| *(unsigned __int16 *)v52 == 57005|| (uint64_t v16 = (ACFULogging *)(*(uint64_t (**)(void, UInt8 *))(**((void **)this + 4) + 136))(*((void *)this + 4), v51), v16)|| !*(void *)v51|| *(void *)v51 == 0xDEADBEEFDEADBEEFLL|| (uint64_t v16 = (ACFULogging *)(*(uint64_t (**)(void, UInt8 *))(**((void **)this + 4) + 224))(*((void *)this + 4), &v47), v16)|| v47 >= 2u|| (uint64_t v16 = (ACFULogging *)(*(uint64_t (**)(void, UInt8 *))(**((void **)this + 4) + 216))(*((void *)this + 4), &v48), v16)
    || v48 >= 2u
    || (uint64_t v16 = (ACFULogging *)(*(uint64_t (**)(void, UInt8 *))(**((void **)this + 4) + 232))(*((void *)this + 4), &v46), v16)|| v46 == 222|| (uint64_t v16 = (ACFULogging *)(*(uint64_t (**)(void, UInt8 *))(**((void **)this + 4) + 240))(*((void *)this + 4), &v45), v16)|| v45 == 222|| (uint64_t v16 = (ACFULogging *)(*(uint64_t (**)(void, UInt8 *))(**((void **)this + 4) + 352))(*((void *)this + 4), v44), v16)|| *(unsigned __int16 *)v44 == 57005)
  {
    ACFULogging::getLogInstance(v16);
    ACFULogging::handleMessage();
    int BootNonceHash = 3011;
  }
  else
  {
    uint64_t v20 = v39;
    CFAllocatorRef v21 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDataRef v22 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v51, 8);
    *((void *)v20 + 5) = v22;
    *((unsigned char *)v20 + 48) = v22 != 0;
    uint64_t v23 = v39;
    CFDataRef v24 = CFDataCreate(v21, v52, 2);
    *((void *)v23 + 3) = v24;
    *((unsigned char *)v23 + 32) = v24 != 0;
    size_t v25 = v39;
    CFDataRef v26 = CFDataCreate(v21, v53, 2);
    *((void *)v25 + 1) = v26;
    *((unsigned char *)v25 + 16) = v26 != 0;
    size_t v27 = v39;
    CFDataRef v28 = CFDataCreate(v21, &v48, 1);
    *((void *)v27 + 11) = v28;
    *((unsigned char *)v27 + 96) = v28 != 0;
    CFTypeID v29 = v39;
    CFDataRef v30 = CFDataCreate(v21, &v47, 1);
    *((void *)v29 + 13) = v30;
    *((unsigned char *)v29 + 112) = v30 != 0;
    std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v31 = v39;
    CFDataRef v32 = CFDataCreate(v21, &v46, 1);
    *((void *)v31 + 17) = v32;
    *((unsigned char *)v31 + 144) = v32 != 0;
    std::string::size_type v33 = v39;
    CFDataRef v34 = CFDataCreate(v21, &v45, 1);
    *((void *)v33 + 19) = v34;
    *((unsigned char *)v33 + 160) = v34 != 0;
    int v35 = v39;
    CFDataRef v36 = CFDataCreate(v21, v44, 2);
    *((void *)v35 + 21) = v36;
    *((unsigned char *)v35 + 176) = v36 != 0;
    v37 = (ACFULogging *)ACFUCommon::PersonalizeParams::logParameters(v39);
    if (*(_WORD *)v52 && v46 - 4 <= 0xFFFFFFFC)
    {
      ACFULogging::getLogInstance(v37);
      ACFULogging::handleMessage();
      v38 = v40;
      v39 = 0;
      CFTypeID v40 = 0;
      if (v38) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v38);
      }
      int BootNonceHash = 3006;
    }
    else
    {
      int BootNonceHash = 0;
    }
  }
LABEL_14:
  BOOL v18 = v39;
  unsigned __int16 v17 = v40;
  if (v40)
  {
    atomic_fetch_add_explicit(&v40->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
    long long v19 = v40;
    *(void *)a4 = v18;
    *(void *)(a4 + 8) = v17;
    *(_DWORD *)(a4 + 16) = BootNonceHash;
    if (v19) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v19);
    }
  }
  else
  {
    *(void *)a4 = v39;
    *(void *)(a4 + 8) = 0;
    *(_DWORD *)(a4 + 16) = BootNonceHash;
  }
  if (__p)
  {
    std::string v42 = __p;
    operator delete(__p);
  }
}

void sub_22CFDFA58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t RoseTransport::setNonce(uint64_t this, void *a2, uint64_t a3)
{
  if (!a2
    || !a3
    || (this = (*(uint64_t (**)(void))(**(void **)(this + 32) + 168))(*(void *)(this + 32)),
        this))
  {
    ACFULogging::getLogInstance((ACFULogging *)this);
    ACFULogging::handleMessage();
    return 3028;
  }
  return this;
}

uint64_t RoseTransport::pushFirmware(uint64_t a1, ACFUFirmware **a2)
{
  v44[4] = *MEMORY[0x263EF8340];
  CFDataRef Manifest = (const __CFData *)ACFUFirmware::getManifest(*a2);
  uint64_t v5 = ACFUFirmware::copyFWDataByTag(*a2, @"Rap,RTKitOS");
  int v6 = (ACFULogging *)ACFUFirmware::copyFWDataByTag(*a2, @"Rap,SoftwareBinaryDsp1");
  unsigned int v43 = -559038737;
  CFDataRef v40 = v6;
  CFDataRef theData = (const __CFData *)v5;
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (!Manifest)
    {
      ACFULogging::getLogInstance(v6);
      ACFULogging::handleMessage();
      CFDataRef v42 = 0;
      uint64_t v11 = 1001;
      goto LABEL_29;
    }
    if (RoseCapabilities::supportsRTKitIOConfig(*(RoseCapabilities **)(a1 + 104)))
    {
      uint64_t v8 = ACFUFirmware::copyFWDataByTag(*a2, @"Rap,RTKitIOConfig");
      if (!v8)
      {
        ACFULogging::getLogInstance(0);
        v38 = "pushFirmware";
        ACFULogging::handleMessage();
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    CFDataRef v42 = (const __CFData *)v8;
    if (*(unsigned char *)(a1 + 96))
    {
      uint64_t v9 = (ACFULogging *)RoseTransport::flushDebugInfo((RoseTransport *)a1);
      if (!v9)
      {
        uint64_t v11 = 0;
LABEL_15:
        long long v12 = (ACFULogging *)(*(uint64_t (**)(void, void))(**(void **)(a1 + 32) + 184))(*(void *)(a1 + 32), 0);
        if (v12)
        {
          ACFULogging::getLogInstance(v12);
          ACFULogging::handleMessage();
        }
        else
        {
          char v13 = (ACFULogging *)(*(uint64_t (**)(void, unsigned int *))(**(void **)(a1 + 32) + 192))(*(void *)(a1 + 32), &v43);
          if (v13) {
            BOOL v14 = 1;
          }
          else {
            BOOL v14 = v43 >= 2;
          }
          if (v14)
          {
            ACFULogging::getLogInstance(v13);
            ACFULogging::handleMessage();
          }
          else
          {
            if (!v43)
            {
              CFDataRef v15 = *(uint64_t **)(a1 + 32);
              uint64_t v16 = *v15;
              if (v8)
              {
                unsigned __int16 v17 = *(uint64_t (**)(uint64_t *, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const char *, ACFULogging *))(v16 + 448);
                BytePtr = CFDataGetBytePtr(Manifest);
                CFIndex Length = CFDataGetLength(Manifest);
                uint64_t v20 = CFDataGetBytePtr(theData);
                CFIndex v21 = CFDataGetLength(theData);
                CFDataRef v22 = CFDataGetBytePtr(v40);
                CFIndex v23 = CFDataGetLength(v40);
                CFDataRef v24 = CFDataGetBytePtr(v42);
                CFIndex v25 = CFDataGetLength(v42);
                CFDataRef v26 = (ACFULogging *)v17(v15, BytePtr, Length, v20, v21, v22, v23, v24, v25, v38, v39);
                if (v26)
                {
                  ACFULogging::getLogInstance(v26);
                  ACFULogging::handleMessage();
LABEL_42:
                  uint64_t v11 = 3001;
                  goto LABEL_29;
                }
              }
              else
              {
                size_t v27 = *(uint64_t (**)(uint64_t *, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const UInt8 *, CFIndex))(v16 + 96);
                CFDataRef v28 = CFDataGetBytePtr(Manifest);
                CFIndex v29 = CFDataGetLength(Manifest);
                CFDataRef v30 = CFDataGetBytePtr(theData);
                CFIndex v31 = CFDataGetLength(theData);
                CFDataRef v32 = CFDataGetBytePtr(v40);
                CFIndex v33 = CFDataGetLength(v40);
                CFDataRef v34 = (ACFULogging *)v27(v15, v28, v29, v30, v31, v32, v33);
                if (v34)
                {
                  ACFULogging::getLogInstance(v34);
                  ACFULogging::handleMessage();
                  CFDataRef v42 = 0;
                  goto LABEL_42;
                }
              }
              if (*(unsigned char *)(a1 + 96)
                && (v44[0] = &unk_26E056D50,
                    v44[1] = a1,
                    v44[3] = v44,
                    char v35 = ACFUSynchronize::Syncher::wait(),
                    CFDataRef v36 = (ACFULogging *)std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v44),
                    (v35 & 1) == 0))
              {
                ACFULogging::getLogInstance(v36);
                ACFULogging::handleMessage();
                uint64_t v11 = 3002;
              }
              else
              {
                uint64_t v11 = 0;
              }
              goto LABEL_29;
            }
            ACFULogging::getLogInstance(v13);
            ACFULogging::handleMessage();
            uint64_t v11 = 3010;
          }
        }
LABEL_29:
        CFRelease(theData);
        goto LABEL_30;
      }
      uint64_t v10 = v9;
      ACFULogging::getLogInstance(v9);
      v38 = "pushFirmware";
      v39 = v10;
      ACFULogging::handleMessage();
    }
    uint64_t v11 = 3000;
    goto LABEL_15;
  }
  ACFULogging::getLogInstance(v6);
  ACFULogging::handleMessage();
  CFDataRef v42 = 0;
  uint64_t v11 = 1000;
  if (v5) {
    goto LABEL_29;
  }
LABEL_30:
  if (v40) {
    CFRelease(v40);
  }
  if (v42) {
    CFRelease(v42);
  }
  return v11;
}

void sub_22CFE0008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t RoseTransport::flushDebugInfo(RoseTransport *this)
{
  v14[0] = 0;
  std::vector<unsigned char>::vector(__p, 0x2000uLL, v14);
  uint64_t v15 = 0;
  if (RoseCapabilities::supportsFirmwareLogCollectionFromRoseController(*((RoseCapabilities **)this + 13)))
  {
    mach_port_t v2 = (ACFULogging *)(*(uint64_t (**)(void))(**((void **)this + 4) + 272))(*((void *)this + 4));
    if (v2)
    {
      ACFULogging::getLogInstance(v2);
      ACFULogging::handleMessage();
      uint64_t v3 = 3000;
      goto LABEL_16;
    }
    while (1)
    {
      uint64_t v10 = (ACFULogging *)(*(uint64_t (**)(void, void *, unint64_t, uint64_t *))(**((void **)this + 4)
                                                                                                  + 280))(*((void *)this + 4), __p[0], v17 - (unint64_t)__p[0], &v15);
      if (v10 || v15 == 0) {
        break;
      }
      ACFULogging::getLogInstance(v10);
      ACFULogging::handleMessage();
      uint64_t v15 = 0;
    }
    if (v10)
    {
      ACFULogging::getLogInstance(v10);
      ACFULogging::handleMessage();
      uint64_t v3 = 3000;
    }
    else
    {
      uint64_t v3 = 0;
    }
    long long v12 = (ACFULogging *)(*(uint64_t (**)(void))(**((void **)this + 4) + 288))(*((void *)this + 4));
    if (v12)
    {
      ACFULogging::getLogInstance(v12);
      ACFULogging::handleMessage();
      uint64_t v3 = 3000;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  unsigned __int8 v4 = 0;
  char v5 = 1;
  do
  {
    char v6 = v5;
    unint64_t v13 = 0;
    while (RoseTransport::isCrashLogAvailable(this, v4, &v13))
    {
      unint64_t v13 = 0;
      BOOL v7 = (ACFULogging *)(*(uint64_t (**)(void, void, unsigned char *, void *, unint64_t, unint64_t *))(**((void **)this + 4) + 360))(*((void *)this + 4), v4, v14, __p[0], v17 - (unint64_t)__p[0], &v13);
      if (v7) {
        BOOL v8 = 1;
      }
      else {
        BOOL v8 = v13 == 0;
      }
      if (v8)
      {
        ACFULogging::getLogInstance(v7);
        uint64_t v3 = 3000;
      }
      else
      {
        ACFULogging::getLogInstance(v7);
      }
      ACFULogging::handleMessage();
    }
    char v5 = 0;
    unsigned __int8 v4 = 1;
  }
  while ((v6 & 1) != 0);
LABEL_16:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v3;
}

void sub_22CFE02A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL RoseTransport::isCrashLogAvailable(RoseTransport *this, uint64_t a2, unint64_t *a3)
{
  if (a3)
  {
    this = (RoseTransport *)(*(uint64_t (**)(void, uint64_t, void, void, void, unint64_t *))(**((void **)this + 4) + 360))(*((void *)this + 4), a2, 0, 0, 0, a3);
    if (!this && *a3 <= 0x200000) {
      return *a3 != 0;
    }
  }
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  return 0;
}

void RoseTransport::collectFirmwareLogs(RoseCapabilities **this)
{
  unint64_t v15 = 0;
  mach_port_t v2 = (ACFULogging *)RoseCapabilities::supportsFirmwareLogCollectionFromRoseController(this[13]);
  char v3 = (char)v2;
  ACFULogging::getLogInstance(v2);
  if (v3)
  {
    ACFULogging::handleMessage();
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (Mutable)
    {
      char v6 = (ACFULogging *)(*(uint64_t (**)(RoseCapabilities *))(*(void *)this[4] + 272))(this[4]);
      if (v6)
      {
        ACFULogging::getLogInstance(v6);
      }
      else
      {
        LODWORD(v7) = 0;
        while (1)
        {
          CFDataIncreaseLength(Mutable, 1024);
          MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
          uint64_t v9 = (ACFULogging *)(*(uint64_t (**)(RoseCapabilities *, UInt8 *, uint64_t, unint64_t *))(*(void *)this[4] + 280))(this[4], &MutableBytePtr[v7], 1024, &v15);
          if (v9 || v15 >= 0x401) {
            break;
          }
          CFIndex v7 = (v7 + v15);
          if (!v15)
          {
            if (!v7)
            {
              ACFULogging::getLogInstance(v9);
              goto LABEL_15;
            }
            CFIndex v10 = v7;
            goto LABEL_10;
          }
        }
        ACFULogging::getLogInstance(v9);
        ACFULogging::handleMessage();
        if (!v7) {
          goto LABEL_16;
        }
        CFIndex v10 = v7;
LABEL_10:
        CFDataSetLength(Mutable, v10);
        CFStringRef v11 = CFStringCreateWithFormat(v4, 0, @"%@.log", @"FirmwareLogs", "collectFirmwareLogs");
        if (v11)
        {
          CFStringRef v12 = v11;
          unint64_t v13 = (ACFULogging *)ACFUDiagnostics::addItem();
          ACFULogging::getLogInstance(v13);
          ACFULogging::handleMessage();
          CFRelease(v12);
          goto LABEL_16;
        }
        ACFULogging::getLogInstance(0);
      }
    }
    else
    {
      ACFULogging::getLogInstance(0);
    }
LABEL_15:
    ACFULogging::handleMessage();
LABEL_16:
    BOOL v14 = (ACFULogging *)(*(uint64_t (**)(RoseCapabilities *))(*(void *)this[4] + 288))(this[4]);
    if (v14)
    {
      ACFULogging::getLogInstance(v14);
      ACFULogging::handleMessage();
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
  else
  {
    ACFULogging::handleMessage();
  }
}

void RoseTransport::logCrashLogReason(RoseTransport *this, const unsigned __int8 *a2, unint64_t a3)
{
  if (a3 >= 0x51)
  {
    uint64_t v3 = 32;
    while (1)
    {
      CFAllocatorRef v4 = &a2[v3];
      uint64_t v5 = *(unsigned int *)&a2[v3 + 12];
      if (v5 <= 0xF) {
        break;
      }
      if (*(_DWORD *)v4 == 1131639922)
      {
        if (*((_DWORD *)v4 + 2) == 257 && v5 >= 0x15 && v3 + v5 + 32 <= a3)
        {
          CFIndex v7 = (ACFULogging *)std::string::basic_string[abi:ne180100](&__p, (void *)(v4 + 20), (int)v5 - 20);
          ACFULogging::getLogInstance(v7);
          ACFULogging::handleMessage();
          if (v9 < 0) {
            operator delete(__p);
          }
          return;
        }
        break;
      }
      v3 += v5;
      if (v3 + 48 >= a3) {
        return;
      }
    }
  }
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
}

void sub_22CFE07F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void RoseTransport::collectCrashLogs(BOOL this)
{
  uint64_t v1 = (RoseTransport *)this;
  uint64_t v2 = 0;
  char v3 = 1;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  do
  {
    char v30 = v3;
    unint64_t v34 = 0;
    CFIndex v33 = 0;
    ACFULogging::getLogInstance((ACFULogging *)this);
    ACFULogging::handleMessage();
    this = RoseTransport::isCrashLogAvailable(v1, v2, &v34);
    if (!this) {
      goto LABEL_24;
    }
    uint64_t v5 = 1;
    while (1)
    {
      ACFULogging::getLogInstance((ACFULogging *)this);
      ACFULogging::handleMessage();
      Mutable = CFDataCreateMutable(v4, 0);
      if (Mutable) {
        break;
      }
      ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage();
LABEL_21:
      uint64_t v5 = (v5 + 1);
      this = RoseTransport::isCrashLogAvailable(v1, v2, &v34);
      if (!this) {
        goto LABEL_24;
      }
    }
    CFIndex v7 = Mutable;
    CFAllocatorRef v8 = v4;
    CFDataIncreaseLength(Mutable, v34);
    memset(v32, 0, 15);
    char v9 = v1;
    uint64_t v10 = *((void *)v1 + 4);
    CFStringRef v11 = *(uint64_t (**)(uint64_t, void, void *, UInt8 *, CFIndex, unsigned __int8 **))(*(void *)v10 + 360);
    MutableBytePtr = CFDataGetMutableBytePtr(v7);
    CFIndex Length = CFDataGetLength(v7);
    BOOL v14 = (ACFULogging *)v11(v10, v2, v32, MutableBytePtr, Length, &v33);
    if (!v14)
    {
      if (v33 != (unsigned __int8 *)v34)
      {
        ACFULogging::getLogInstance(v14);
        BOOL v14 = (ACFULogging *)ACFULogging::handleMessage();
      }
      ACFULogging::getLogInstance(v14);
      uint64_t v28 = BYTE6(v32[1]);
      uint64_t v29 = BYTE4(v32[1]);
      uint64_t v26 = v32[0];
      uint64_t v27 = BYTE5(v32[1]);
      ACFULogging::handleMessage();
      BytePtr = CFDataGetBytePtr(v7);
      CFAllocatorRef v4 = v8;
      uint64_t v1 = v9;
      if (!BytePtr) {
        goto LABEL_17;
      }
      uint64_t v16 = BytePtr;
      if ((unint64_t)CFDataGetLength(v7) < 0x20 || *((_DWORD *)v16 + 3) > 0x3Fu) {
        goto LABEL_17;
      }
      if (v30)
      {
        uint64_t v17 = (ACFUMachO32 *)CFDataGetBytePtr(v7);
        ACFUMachO32::create(v17, v33);
        uint64_t v18 = v31;
        uint64_t v31 = 0;
        uint64_t v19 = *((void *)v9 + 10);
        *((void *)v9 + 10) = v18;
        if (!v19) {
          goto LABEL_17;
        }
      }
      else
      {
        uint64_t v20 = (ACFUMachO64 *)CFDataGetBytePtr(v7);
        ACFUMachO64::create(v20, v33);
        uint64_t v21 = v31;
        uint64_t v31 = 0;
        uint64_t v19 = *((void *)v9 + 11);
        *((void *)v9 + 11) = v21;
        if (!v19)
        {
LABEL_17:
          CFDataRef v22 = (RoseTransport *)CFDataGetBytePtr(v7);
          RoseTransport::logCrashLogReason(v22, (const unsigned __int8 *)v22, (unint64_t)v33);
          CFStringRef v23 = CFStringCreateWithFormat(v8, 0, @"%@-%d.bin", kRoseCoreToCrashLogKey[v2], v5, v26, v27, v28, v29);
          if (v23)
          {
            CFStringRef v24 = v23;
            CFIndex v25 = (ACFULogging *)ACFUDiagnostics::addItem();
            ACFULogging::getLogInstance(v25);
            ACFULogging::handleMessage();
            CFRelease(v24);
          }
          else
          {
            ACFULogging::getLogInstance(0);
            ACFULogging::handleMessage();
          }
          CFRelease(v7);
          goto LABEL_21;
        }
      }
      (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
      uint64_t v31 = 0;
      goto LABEL_17;
    }
    ACFULogging::getLogInstance(v14);
    ACFULogging::handleMessage();
    CFRelease(v7);
    CFAllocatorRef v4 = v8;
    uint64_t v1 = v9;
LABEL_24:
    char v3 = 0;
    uint64_t v2 = 1;
  }
  while ((v30 & 1) != 0);
}

uint64_t RoseTransport::isCoreDumpAvailable(RoseTransport *this, uint64_t a2, unsigned int *a3)
{
  if (a3)
  {
    memset(v7, 0, 15);
    CFAllocatorRef v4 = (ACFULogging *)(*(uint64_t (**)(void, uint64_t, void *))(**((void **)this + 4) + 368))(*((void *)this + 4), a2, v7);
    if (v4)
    {
      ACFULogging::getLogInstance(v4);
    }
    else
    {
      unsigned int v5 = LODWORD(v7[1]) - 2097153;
      ACFULogging::getLogInstance(v4);
      if (v5 >> 21 == 2047)
      {
        ACFULogging::handleMessage();
        *a3 = v7[1];
        return 1;
      }
    }
  }
  else
  {
    ACFULogging::getLogInstance(this);
  }
  ACFULogging::handleMessage();
  return 0;
}

uint64_t RoseTransport::collectCoreDump(RoseTransport *this)
{
  uint64_t v1 = this;
  uint64_t v2 = 0;
  char v3 = 1;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  do
  {
    char v5 = v3;
    ACFULogging::getLogInstance(this);
    uint64_t v21 = v2;
    ACFULogging::handleMessage();
    LODWORD(extraLength) = 0;
    this = (RoseTransport *)RoseTransport::isCoreDumpAvailable(v1, v2, (unsigned int *)&extraLength);
    if (!this) {
      goto LABEL_20;
    }
    uint64_t v23 = 0;
    CFMutableDataRef Mutable = CFDataCreateMutable(v4, 0);
    if (!Mutable)
    {
      ACFULogging::getLogInstance(0);
      this = (RoseTransport *)ACFULogging::handleMessage();
      goto LABEL_20;
    }
    CFIndex v7 = Mutable;
    if (v5)
    {
      CFAllocatorRef v8 = (ACFUMachO *)*((void *)v1 + 10);
      if (!v8) {
        goto LABEL_11;
      }
    }
    else
    {
      CFAllocatorRef v8 = (ACFUMachO *)*((void *)v1 + 11);
      if (!v8) {
        goto LABEL_11;
      }
    }
    CFDataRef MachoHeaderData = (const __CFData *)ACFUMachO::getMachoHeaderData(v8);
    if (MachoHeaderData)
    {
      CFDataRef v10 = MachoHeaderData;
      unsigned int Length = CFDataGetLength(MachoHeaderData);
      BytePtr = CFDataGetBytePtr(v10);
      CFDataAppendBytes(v7, BytePtr, Length);
      CFStringRef v13 = @"%@-raw.bin";
      goto LABEL_12;
    }
LABEL_11:
    unsigned int Length = 0;
    CFStringRef v13 = @"%@.bin";
LABEL_12:
    CFDataIncreaseLength(v7, extraLength);
    MutableBytePtr = CFDataGetMutableBytePtr(v7);
    unint64_t v15 = (ACFULogging *)(*(uint64_t (**)(void, void, void, void, UInt8 *, uint64_t *))(**((void **)v1 + 4) + 376))(*((void *)v1 + 4), v2, 0, extraLength, &MutableBytePtr[Length], &v23);
    if (v15)
    {
      ACFULogging::getLogInstance(v15);
    }
    else
    {
      if (v23 != extraLength)
      {
        ACFULogging::getLogInstance(v15);
        uint64_t v21 = v23;
        uint64_t v22 = extraLength;
        ACFULogging::handleMessage();
      }
      CFStringRef v17 = CFStringCreateWithFormat(v4, 0, v13, kRoseCoreToCoreDumpKey[v2], "collectCoreDump", v21, v22);
      if (v17)
      {
        CFStringRef v18 = v17;
        ACFUDiagnostics::addItem();
        CFRelease(v7);
        uint64_t v16 = (__CFData *)v18;
        goto LABEL_19;
      }
      ACFULogging::getLogInstance(0);
    }
    ACFULogging::handleMessage();
    uint64_t v16 = v7;
LABEL_19:
    CFRelease(v16);
LABEL_20:
    char v3 = 0;
    uint64_t v2 = 1;
  }
  while ((v5 & 1) != 0);
  uint64_t v19 = *((void *)v1 + 10);
  *((void *)v1 + 10) = 0;
  if (v19) {
    (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
  }
  uint64_t result = *((void *)v1 + 11);
  *((void *)v1 + 11) = 0;
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
  }
  return result;
}

void RoseTransport::collectIOReport(RoseTransport *this)
{
  uint64_t v1 = IOReportCopyAllChannels();
  if (!v1)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    return;
  }
  uint64_t v2 = (const void *)v1;
  uint64_t v3 = IOReportSelectChannelsInGroup();
  if (v3)
  {
    ACFULogging::getLogInstance((ACFULogging *)v3);
  }
  else
  {
    ChannelCount = (ACFULogging *)IOReportGetChannelCount();
    ACFULogging::getLogInstance(ChannelCount);
    if ((int)ChannelCount > 0)
    {
      ACFULogging::handleMessage();
      uint64_t Subscription = IOReportCreateSubscription();
      if (Subscription)
      {
        char v6 = (const void *)Subscription;
        CFIndex v7 = (ACFULogging *)IOReportGetChannelCount();
        if ((int)v7 < 1 || (int)v7 > (int)ChannelCount)
        {
          ACFULogging::getLogInstance(v7);
          ACFULogging::handleMessage();
          CFArrayRef Mutable = 0;
          Samples = 0;
        }
        else
        {
          if (v7 < ChannelCount)
          {
            ACFULogging::getLogInstance(v7);
            ACFULogging::handleMessage();
          }
          Samples = (const void *)IOReportCreateSamples();
          if (Samples)
          {
            CFArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
            if (Mutable)
            {
              CFDataRef v10 = (ACFULogging *)IOReportIterate();
              if (v10)
              {
                ACFULogging::getLogInstance(v10);
                ACFULogging::handleMessage();
              }
              if (CFArrayGetCount(Mutable)) {
                ACFUDiagnostics::addItem();
              }
            }
            else
            {
              ACFULogging::getLogInstance(0);
              ACFULogging::handleMessage();
            }
          }
          else
          {
            ACFULogging::getLogInstance(0);
            ACFULogging::handleMessage();
            CFArrayRef Mutable = 0;
          }
        }
        CFRelease(v6);
        goto LABEL_16;
      }
      ACFULogging::getLogInstance(0);
    }
  }
  ACFULogging::handleMessage();
  Samples = 0;
  CFArrayRef Mutable = 0;
LABEL_16:
  CFRelease(v2);
  if (Samples) {
    CFRelease(Samples);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

uint64_t ___ZN13RoseTransport15collectIOReportEv_block_invoke(uint64_t a1)
{
  uint64_t v2 = (const void *)IOReportSampleCopyDescription();
  if (v2)
  {
    uint64_t v3 = v2;
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v2);
    CFRelease(v3);
  }
  else
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
  }
  return 0;
}

uint64_t RoseTransport::getDebugInfo(uint64_t a1, uint64_t a2, int a3)
{
  char v10 = 1;
  if (!*(void *)(a1 + 8))
  {
    ACFULogging::getLogInstance((ACFULogging *)a1);
LABEL_11:
    ACFULogging::handleMessage();
    return 3000;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_11;
  }
  CFMutableDictionaryRef v6 = Mutable;
  CFIndex v7 = (ACFULogging *)(*(uint64_t (**)(void, CFMutableDictionaryRef))(**(void **)(a1 + 32) + 248))(*(void *)(a1 + 32), Mutable);
  if (v7)
  {
    ACFULogging::getLogInstance(v7);
    ACFULogging::handleMessage();
    uint64_t v8 = 3015;
  }
  else
  {
    ACFUDiagnostics::addItem();
    uint64_t v8 = (*(uint64_t (**)(void, char *))(**(void **)(a1 + 32) + 304))(*(void *)(a1 + 32), &v10);
    ACFULogging::getLogInstance((ACFULogging *)v8);
    if (v8)
    {
      ACFULogging::handleMessage();
      uint64_t v8 = 3000;
    }
    else
    {
      ACFULogging::handleMessage();
      if (a3)
      {
        RoseTransport::waitForFatalCrashCB((RoseTransport *)a1);
        *(unsigned char *)(a1 + 72) = 0;
        RoseTransport::collectCrashLogs(a1);
        RoseTransport::collectCoreDump((RoseTransport *)a1);
        RoseTransport::collectFirmwareLogs((RoseCapabilities **)a1);
        RoseTransport::collectIOReport((RoseTransport *)a1);
        uint64_t v8 = 0;
      }
    }
  }
  CFRelease(v6);
  return v8;
}

uint64_t RoseTransport::waitForFatalCrashCB(RoseTransport *this)
{
  v4[4] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26E056DE0;
  v4[3] = v4;
  char v2 = ACFUSynchronize::Syncher::wait();
  uint64_t result = (uint64_t)std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v4);
  if ((v2 & 1) == 0)
  {
    ACFULogging::getLogInstance((ACFULogging *)result);
    uint64_t result = ACFULogging::handleMessage();
    if (!*((unsigned char *)this + 72))
    {
      uint64_t result = RoseTransport::triggerCrashLog(this);
      if (result) {
        return RoseTransport::waitForFatalCrashCB(this);
      }
    }
  }
  return result;
}

void sub_22CFE164C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

BOOL RoseTransport::triggerCrashLog(RoseTransport *this)
{
  char v2 = (ACFULogging *)(*(uint64_t (**)(void))(**((void **)this + 4) + 344))(*((void *)this + 4));
  ACFULogging::getLogInstance(v2);
  ACFULogging::handleMessage();
  if (!v2) {
    *((unsigned char *)this + 72) = 1;
  }
  return v2 == 0;
}

ACFULogging *RoseTransport::crashHandler(ACFULogging *result, uint64_t a2)
{
  v2[4] = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (*(unsigned char *)(a2 + 60))
    {
      ACFULogging::getLogInstance(result);
      ACFULogging::handleMessage();
      v2[0] = &unk_26E056E60;
      v2[3] = v2;
      ACFUSynchronize::Syncher::notify();
      return (ACFULogging *)std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v2);
    }
  }
  else
  {
    ACFULogging::getLogInstance(result);
    return (ACFULogging *)ACFULogging::handleMessage();
  }
  return result;
}

void sub_22CFE17FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t RoseTransport::reset(RoseCapabilities **this)
{
  uint64_t v2 = RoseCapabilities::supportsRTKitIOConfig(this[13]);
  if (v2)
  {
    uint64_t v2 = RoseTransport::applyResetGlitchWorkaround((RoseTransport *)this);
    if ((v2 & 1) == 0)
    {
      ACFULogging::getLogInstance((ACFULogging *)v2);
      uint64_t v2 = ACFULogging::handleMessage();
    }
  }
  ACFULogging::getLogInstance((ACFULogging *)v2);
  ACFULogging::handleMessage();
  uint64_t v3 = (ACFULogging *)(*(uint64_t (**)(RoseCapabilities *))(*(void *)this[4] + 112))(this[4]);
  ACFULogging::getLogInstance(v3);
  ACFULogging::handleMessage();
  if (v3) {
    return 3014;
  }
  else {
    return 0;
  }
}

uint64_t RoseTransport::applyResetGlitchWorkaround(RoseTransport *this)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  uint64_t v2 = (RoseCommand *)RoseCommand::create(0, 112, 0, 1);
  uint64_t v7 = 0;
  uint64_t v3 = RoseTransport::sendRoseCommand(this, v2, (uint64_t)&__ns, &v7, 0x100000096);
  uint64_t v4 = v3;
  if (v3)
  {
    __ns.__rep_ = 70000000;
    std::this_thread::sleep_for (&__ns);
  }
  ACFULogging::getLogInstance((ACFULogging *)v3);
  ACFULogging::handleMessage();
  RoseCommand::~RoseCommand(v2);
  operator delete(v5);
  return v4;
}

void sub_22CFE1A0C(_Unwind_Exception *exception_object)
{
  if (v1)
  {
    RoseCommand::~RoseCommand(v1);
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

ACFULogging *RoseTransport::getRoseDebugInfoDict(RoseTransport *this, __CFDictionary *a2)
{
  if (a2)
  {
    uint64_t v2 = (ACFULogging *)(*(uint64_t (**)(void))(**((void **)this + 4) + 248))(*((void *)this + 4));
    uint64_t v3 = v2;
    if (v2)
    {
      ACFULogging::getLogInstance(v2);
      ACFULogging::handleMessage();
    }
  }
  else
  {
    ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage();
    return (ACFULogging *)3758097084;
  }
  return v3;
}

uint64_t RoseTransport::getCapabilities@<X0>(uint64_t this@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(this + 112);
  *a2 = *(void *)(this + 104);
  a2[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

void *RoseTransport::eventHandler(RoseTransport *this, void *a2, uint64_t a3)
{
  v8[4] = *MEMORY[0x263EF8340];
  CFMutableDictionaryRef v6 = operator new(0x20uLL);
  void *v6 = &unk_26E056EF0;
  v6[1] = this;
  v6[2] = a2;
  v6[3] = a3;
  void v8[3] = v6;
  ACFUSynchronize::Syncher::notify();
  return std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v8);
}

void sub_22CFE1B9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t RoseTransport::sendRoseCommand(ACFULogging *a1, RoseCommand *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v4 = 0;
  return RoseTransport::sendRoseCommand(a1, a2, (uint64_t)v5, &v4, a3);
}

uint64_t RoseTransport::sendRoseCommand(ACFULogging *a1, RoseCommand *a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  if (!a4)
  {
    ACFULogging::getLogInstance(a1);
LABEL_21:
    ACFULogging::handleMessage();
    return 0;
  }
  *a4 = 0;
  ACFULogging::getLogInstance(a1);
  char v10 = (ACFULogging *)ACFULogging::handleMessage();
  ACFULogging::getLogInstance(v10);
  std::string::basic_string[abi:ne180100]<0>(&v30, "RoseTransport");
  CFStringRef v11 = std::string::append(&v30, "::");
  long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  v31.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  CFStringRef v13 = std::string::append(&v31, "sendRoseCommand");
  long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  std::string::size_type v33 = v13->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  RoseCommand::getPacketData(a2);
  RoseCommand::getPacketLength(a2);
  ACFULogging::handleMessageBinary();
  if (SHIBYTE(v33) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v31.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v30.__r_.__value_.__l.__data_);
  }
  unint64_t v15 = (uint64_t *)*((void *)a1 + 4);
  uint64_t v16 = *v15;
  if ((a5 & 0xFF00000000) != 0)
  {
    CFStringRef v17 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))(v16 + 464);
    uint64_t PacketData = RoseCommand::getPacketData(a2);
    Packetunsigned int Length = RoseCommand::getPacketLength(a2);
    uint64_t v20 = (ACFULogging *)v17(v15, PacketData, PacketLength, a3, 112, a4, a5);
    if (v20) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v21 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))(v16 + 256);
    uint64_t v22 = RoseCommand::getPacketData(a2);
    uint64_t v23 = RoseCommand::getPacketLength(a2);
    uint64_t v20 = (ACFULogging *)v21(v15, v22, v23, a3, 112, a4);
    if (v20)
    {
LABEL_20:
      ACFULogging::getLogInstance(v20);
      goto LABEL_21;
    }
  }
  ACFULogging::getLogInstance(v20);
  CFStringRef v24 = (ACFULogging *)ACFULogging::handleMessage();
  ACFULogging::getLogInstance(v24);
  std::string::basic_string[abi:ne180100]<0>(&v30, "RoseTransport");
  CFIndex v25 = std::string::append(&v30, "::");
  long long v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
  v31.__r_.__value_.__r.__words[2] = v25->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v26;
  v25->__r_.__value_.__l.__size_ = 0;
  v25->__r_.__value_.__r.__words[2] = 0;
  v25->__r_.__value_.__r.__words[0] = 0;
  uint64_t v27 = std::string::append(&v31, "sendRoseCommand");
  long long v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
  std::string::size_type v33 = v27->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v28;
  v27->__r_.__value_.__l.__size_ = 0;
  v27->__r_.__value_.__r.__words[2] = 0;
  v27->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageBinary();
  if (SHIBYTE(v33) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v31.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v30.__r_.__value_.__l.__data_);
  }
  return RoseCommand::validateResponse((uint64_t)a2, a3, *a4);
}

void sub_22CFE1F20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
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

uint64_t RoseTransport::copyCalDataToSend(uint64_t this, CFDataRef theData)
{
  if (!theData
    || (this = CFDataGetLength(theData), this < 1)
    || (this = (uint64_t)CFDataGetBytePtr(theData)) == 0
    || (this = (uint64_t)CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)this, *(unsigned __int16 *)this + 8, (CFAllocatorRef)*MEMORY[0x263EFFB28])) == 0)
  {
    ACFULogging::getLogInstance((ACFULogging *)this);
    ACFULogging::handleMessage();
    return 0;
  }
  return this;
}

uint64_t RoseTransport::pingCheck(RoseTransport *this)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = (ACFULogging *)std::string::basic_string[abi:ne180100]<0>(&__p, "RoseTransport-v1");
  unint64_t v13 = 0;
  unint64_t v3 = v16;
  if ((v16 & 0x80u) != 0) {
    unint64_t v3 = v15;
  }
  if (v3 >= 0x21)
  {
    ACFULogging::getLogInstance(v2);
    ACFULogging::handleMessage();
    uint64_t v10 = 3012;
  }
  else
  {
    uint64_t v4 = (RoseCommand *)RoseCommand::create(0, 0, 0x20uLL, 0);
    char v5 = v4;
    if (v4)
    {
      if ((v16 & 0x80u) == 0) {
        p_p = &__p;
      }
      else {
        p_p = __p;
      }
      if ((v16 & 0x80u) == 0) {
        size_t v7 = v16;
      }
      else {
        size_t v7 = v15;
      }
      uint64_t Payload = RoseCommand::getPayload(v4);
      if (v7) {
        uint64_t Payload = (uint64_t)memmove((void *)Payload, p_p, v7);
      }
      int v9 = 1;
      while (1)
      {
        ACFULogging::getLogInstance((ACFULogging *)Payload);
        ACFULogging::handleMessage();
        if (RoseTransport::sendRoseCommand(this, v5, (uint64_t)v18, (uint64_t *)&v13, 0)) {
          break;
        }
        __ns.__rep_ = 500000000;
        std::this_thread::sleep_for (&__ns);
        if (++v9 == 6) {
          goto LABEL_16;
        }
      }
      uint64_t Payload = RoseTransport::parsePingResponse((uint64_t)this, (uint64_t)v18, v13);
      if ((Payload & 1) == 0)
      {
LABEL_16:
        ACFULogging::getLogInstance((ACFULogging *)Payload);
        ACFULogging::handleMessage();
        uint64_t v10 = 3003;
        goto LABEL_19;
      }
      ACFULogging::getLogInstance((ACFULogging *)Payload);
      ACFULogging::handleMessage();
      uint64_t v10 = 0;
LABEL_19:
      RoseCommand::~RoseCommand(v5);
      operator delete(v11);
    }
    else
    {
      ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage();
      uint64_t v10 = 1007;
    }
  }
  if ((char)v16 < 0) {
    operator delete(__p);
  }
  return v10;
}

void sub_22CFE229C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
}

uint64_t RoseTransport::parsePingResponse(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = RoseCapabilities::supportsRTKitIOConfig(*(RoseCapabilities **)(a1 + 104));
  if (v5 == 1)
  {
    if (a3 <= 0x6F) {
      goto LABEL_10;
    }
    uint64_t v5 = RoseCommand::parsePingInfo(a2 + 4);
    if ((v5 & 1) == 0) {
      goto LABEL_10;
    }
    return 1;
  }
  if (!v5 && a3 > 0x43 && *(unsigned __int8 *)(a2 + 40) + 41 == a3)
  {
    uint64_t v5 = RoseCommand::parsePingInfo(a2 + 4);
    if (v5) {
      return 1;
    }
  }
LABEL_10:
  ACFULogging::getLogInstance((ACFULogging *)v5);
  ACFULogging::handleMessage();
  return 0;
}

uint64_t RoseTransport::sendCalibration(ACFULogging *a1, const __CFData *a2, unsigned int a3, uint64_t a4)
{
  size_t v7 = a1;
  uint64_t v36 = *MEMORY[0x263EF8340];
  {
    if (a1)
    {
      RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::hostIdentifier = 0uLL;
      unk_26853CCA0 = 0;
      __cxa_atexit(MEMORY[0x263F8C0B8], &RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::hostIdentifier, &dword_22CFD4000);
    }
  }
  if (!a2)
  {
    ACFULogging::getLogInstance(a1);
    goto LABEL_49;
  }
  CFDataRef cf = a2;
  BOOL v8 = RoseCapabilities::requiresSeparateFirmwareTargetForCertification(*((RoseCapabilities **)v7 + 13));
  if (v8)
  {
    CFDataRef cf = (const __CFData *)RoseTransport::copyCalDataToSend(v8, a2);
    if (!cf)
    {
      ACFULogging::getLogInstance(0);
LABEL_49:
      ACFULogging::handleMessage();
      return 1006;
    }
  }
  else
  {
    CFRetain(a2);
  }
  BytePtr = CFDataGetBytePtr(cf);
  if (!BytePtr)
  {
    ACFULogging::getLogInstance(0);
LABEL_52:
    ACFULogging::handleMessage();
    uint64_t v29 = 1006;
LABEL_53:
    long long v14 = 0;
    goto LABEL_43;
  }
  unsigned int Length = (ACFULogging *)CFDataGetLength(cf);
  if (!(_WORD)Length)
  {
    ACFULogging::getLogInstance(Length);
    goto LABEL_52;
  }
  unsigned __int16 v11 = (unsigned __int16)Length;
  if ((unsigned __int16)Length % 0x29u) {
    unsigned int v12 = (unsigned __int16)Length / 0x29u + 1;
  }
  else {
    unsigned int v12 = (unsigned __int16)Length / 0x29u;
  }
  if (!a3)
  {
    uint64_t v21 = 0;
    int v20 = 32;
LABEL_27:
    uint64_t v19 = (uint64_t)RoseCommand::create(2, v20, 0x2CuLL, 1);
    long long v14 = (RoseCommand *)v19;
    if (v21)
    {
      RoseCommand::~RoseCommand(v21);
      operator delete(v22);
    }
    if (v12)
    {
      int v23 = 0;
      while (1)
      {
        size_t v24 = v11 >= 0x29u ? 41 : v11;
        BOOL v25 = RoseCommand::setPayloadLength(v14, (v24 + 3));
        if (!v25) {
          break;
        }
        uint64_t Payload = (unsigned char *)RoseCommand::getPayload(v14);
        *(_WORD *)uint64_t Payload = v11;
        Payload[2] = v24;
        if (v24) {
          uint64_t Payload = memmove(Payload + 3, BytePtr, v24);
        }
        ACFULogging::getLogInstance((ACFULogging *)Payload);
        ACFULogging::handleMessage();
        uint64_t v33 = 0;
        uint64_t v19 = RoseTransport::sendRoseCommand(v7, v14, (uint64_t)v35, &v33, 0);
        if ((v19 & 1) == 0) {
          goto LABEL_55;
        }
        BytePtr += v24;
        v11 -= v24;
        if (v12 == ++v23) {
          goto LABEL_39;
        }
      }
      ACFULogging::getLogInstance((ACFULogging *)v25);
      ACFULogging::handleMessage();
      uint64_t v29 = 1006;
    }
    else
    {
LABEL_39:
      ACFULogging::getLogInstance((ACFULogging *)v19);
      uint64_t v27 = (ACFULogging *)ACFULogging::handleMessage();
      if (*((unsigned char *)v7 + 96)
        && (v34[0] = &unk_26E056F70,
            v34[1] = v7,
            v34[2] = a3,
            v34[3] = v34,
            char v28 = ACFUSynchronize::Syncher::wait(),
            uint64_t v27 = (ACFULogging *)std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v34),
            (v28 & 1) == 0))
      {
        ACFULogging::getLogInstance(v27);
        ACFULogging::handleMessage();
        uint64_t v29 = 3005;
      }
      else
      {
        ACFULogging::getLogInstance(v27);
        ACFULogging::handleMessage();
        uint64_t v29 = 0;
      }
    }
    goto LABEL_43;
  }
  if (RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::only_once != -1) {
    dispatch_once(&RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::only_once, &__block_literal_global_0);
  }
  uint64_t v13 = *((void *)&RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::hostIdentifier + 1);
  if (byte_26853CCA7 >= 0) {
    uint64_t v13 = byte_26853CCA7;
  }
  if (!v13)
  {
    ACFULogging::getLogInstance(Length);
    ACFULogging::handleMessage();
    uint64_t v29 = 1;
    goto LABEL_53;
  }
  long long v14 = (RoseCommand *)RoseCommand::create(2, 55, 0x2CuLL, 1);
  uint64_t v15 = RoseCommand::getPayload(v14);
  uint64_t v16 = v15;
  *(_OWORD *)(v15 + 28) = 0u;
  *(_OWORD *)uint64_t v15 = 0u;
  *(_OWORD *)(v15 + 16) = 0u;
  if (*(char *)(a4 + 23) >= 0) {
    CFStringRef v17 = (const char *)a4;
  }
  else {
    CFStringRef v17 = *(const char **)a4;
  }
  strlcpy((char *)v15, v17, 8uLL);
  if (byte_26853CCA7 >= 0) {
    CFStringRef v18 = (const char *)&RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::hostIdentifier;
  }
  else {
    CFStringRef v18 = (const char *)RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::hostIdentifier;
  }
  strlcpy((char *)(v16 + 8), v18, 0x20uLL);
  uint64_t v33 = 0;
  uint64_t v19 = RoseTransport::sendRoseCommand(v7, v14, (uint64_t)v35, &v33, 0);
  if (v19)
  {
    int v20 = 56;
    uint64_t v21 = v14;
    goto LABEL_27;
  }
LABEL_55:
  ACFULogging::getLogInstance((ACFULogging *)v19);
  ACFULogging::handleMessage();
  uint64_t v29 = 3004;
LABEL_43:
  CFRelease(cf);
  if (v14)
  {
    RoseCommand::~RoseCommand(v14);
    operator delete(v30);
  }
  return v29;
}

void sub_22CFE2A78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  if (v19)
  {
    RoseCommand::~RoseCommand(v19);
    operator delete(v21);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN13RoseTransport15sendCalibrationEPK8__CFDatabRKNSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEE_block_invoke()
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v21);
  uint64_t v19 = 0;
  uint64_t valuePtr = 0;
  CFTypeID TypeID = (ACFULogging *)MGCopyAnswer();
  CFNumberRef v1 = TypeID;
  if (!TypeID || (CFTypeID v2 = CFGetTypeID(TypeID), TypeID = (ACFULogging *)CFNumberGetTypeID(), (ACFULogging *)v2 != TypeID))
  {
    ACFULogging::getLogInstance(TypeID);
    ACFULogging::handleMessage();
    if (!v1) {
      goto LABEL_12;
    }
    goto LABEL_19;
  }
  CFDictionaryRef Value = (ACFULogging *)CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
  if (!Value)
  {
    ACFULogging::getLogInstance(Value);
    ACFULogging::handleMessage();
LABEL_19:
    CFNumberRef v5 = 0;
    goto LABEL_10;
  }
  uint64_t v4 = (ACFULogging *)MGCopyAnswer();
  CFNumberRef v5 = v4;
  if (v4 && (v6 = CFGetTypeID(v4), uint64_t v4 = (ACFULogging *)CFNumberGetTypeID(), (ACFULogging *)v6 == v4))
  {
    size_t v7 = (ACFULogging *)CFNumberGetValue(v5, kCFNumberSInt64Type, &v19);
    if (v7)
    {
      *(_DWORD *)((char *)&v22[1] + *(void *)(v22[0] - 24)) |= 0x4000u;
      LOBYTE(v16) = 48;
      BOOL v8 = std::operator<<[abi:ne180100]<std::char_traits<char>>(v22, (char *)&v16);
      uint64_t v9 = *v8;
      *(uint64_t *)((char *)v8 + *(void *)(*v8 - 24) + 24) = 8;
      *(_DWORD *)((char *)v8 + *(void *)(v9 - 24) + 8) = *(_DWORD *)((unsigned char *)v8 + *(void *)(v9 - 24) + 8) & 0xFFFFFFB5 | 8;
      uint64_t v10 = (void *)std::ostream::operator<<();
      unsigned __int16 v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"-", 1);
      char v18 = 48;
      unsigned int v12 = std::operator<<[abi:ne180100]<std::char_traits<char>>(v11, &v18);
      uint64_t v13 = *v12;
      *(uint64_t *)((char *)v12 + *(void *)(*v12 - 24) + 24) = 16;
      *(_DWORD *)((char *)v12 + *(void *)(v13 - 24) + 8) = *(_DWORD *)((unsigned char *)v12 + *(void *)(v13 - 24) + 8) & 0xFFFFFFB5 | 8;
      std::ostream::operator<<();
      std::stringbuf::str();
      if (byte_26853CCA7 < 0) {
        operator delete((void *)RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::hostIdentifier);
      }
      RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::hostIdentifier = v16;
      unk_26853CCA0 = v17;
      goto LABEL_10;
    }
    ACFULogging::getLogInstance(v7);
  }
  else
  {
    ACFULogging::getLogInstance(v4);
  }
  ACFULogging::handleMessage();
LABEL_10:
  CFRelease(v1);
  if (v5) {
    CFRelease(v5);
  }
LABEL_12:
  v21[0] = *MEMORY[0x263F8C2B8];
  uint64_t v14 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v21 + *(void *)(v21[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v22[0] = v14;
  v22[1] = MEMORY[0x263F8C318] + 16;
  if (v23 < 0) {
    operator delete((void *)v22[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x230F78FA0](&v24);
}

void sub_22CFE2EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 128) = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  CFNumberRef v5 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  BOOL v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
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

void sub_22CFE3194(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x230F78FA0](v1);
  _Unwind_Resume(a1);
}

void *std::operator<<[abi:ne180100]<std::char_traits<char>>(void *a1, char *a2)
{
  uint64_t v3 = (char *)a1 + *(void *)(*a1 - 24);
  int v4 = *a2;
  if (*((_DWORD *)v3 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
    CFNumberRef v5 = std::locale::use_facet(&v8, MEMORY[0x263F8C108]);
    int v6 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 32);
    std::locale::~locale(&v8);
    *((_DWORD *)v3 + 36) = v6;
  }
  *((_DWORD *)v3 + 36) = v4;
  return a1;
}

void sub_22CFE3270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
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
  MEMORY[0x230F78FA0](a1 + 128);
  return a1;
}

void RoseTransport::runCertification(uint64_t a1@<X0>, int a2@<W1>, ACFUFirmware **a3@<X2>, uint64_t a4@<X8>)
{
  CFIndex v53 = 0;
  int v54 = 0;
  int v52 = -559038737;
  if (a2)
  {
    ACFULogging::getLogInstance((ACFULogging *)a1);
    ACFULogging::handleMessage();
    CFDataRef v43 = 0;
    int v44 = 1010;
    goto LABEL_36;
  }
  if (!RoseCapabilities::requiresSeparateFirmwareTargetForCertification(*(RoseCapabilities **)(a1 + 104)))
  {
    CFDataRef v8 = 0;
    CFDataRef v9 = 0;
    CFDataRef v12 = 0;
    CFDataRef v11 = 0;
    goto LABEL_25;
  }
  CFDataRef Manifest = (const __CFData *)ACFUFirmware::getManifest(*a3);
  CFDataRef v8 = (const __CFData *)ACFUFirmware::copyFWDataByTag(*a3, @"Rap,RestoreRTKitOS");
  CFDataRef v9 = (const __CFData *)ACFUFirmware::copyFWDataByTag(*a3, @"Rap,SoftwareBinaryDsp1");
  uint64_t v10 = (ACFULogging *)(*(uint64_t (**)(void))(*(void *)*a3 + 32))();
  CFDataRef v11 = v10;
  if (!v8 || !v9)
  {
    ACFULogging::getLogInstance(v10);
    ACFULogging::handleMessage();
    CFDataRef v43 = 0;
    CFDataRef v12 = 0;
    int v44 = 1000;
    goto LABEL_28;
  }
  if (!Manifest)
  {
    ACFULogging::getLogInstance(v10);
    ACFULogging::handleMessage();
    CFDataRef v12 = 0;
    CFDataRef v43 = 0;
    int v44 = 1001;
    goto LABEL_29;
  }
  if (!v10)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    CFDataRef v12 = 0;
    CFDataRef v43 = 0;
    int v44 = 1002;
    goto LABEL_29;
  }
  if (RoseCapabilities::supportsRTKitIOConfig(*(RoseCapabilities **)(a1 + 104)))
  {
    CFDataRef v12 = (const __CFData *)ACFUFirmware::copyFWDataByTag(*a3, @"Rap,RTKitIOConfig");
    if (!v12)
    {
      ACFULogging::getLogInstance(0);
      UInt8 v45 = "runCertification";
      ACFULogging::handleMessage();
    }
  }
  else
  {
    CFDataRef v12 = 0;
  }
  (*(void (**)(uint64_t))(*(void *)a1 + 32))(a1);
  if (*(unsigned char *)(a1 + 96))
  {
    uint64_t v13 = (ACFULogging *)RoseTransport::flushDebugInfo((RoseTransport *)a1);
    if (v13)
    {
      uint64_t v14 = v13;
      ACFULogging::getLogInstance(v13);
      UInt8 v45 = "runCertification";
      UInt8 v46 = v14;
      ACFULogging::handleMessage();
    }
  }
  BytePtr = CFDataGetBytePtr(v11);
  CFIndex Length = CFDataGetLength(v11);
  uint64_t v17 = (ACFULogging *)(*(uint64_t (**)(uint64_t, const UInt8 *, CFIndex))(*(void *)a1 + 8))(a1, BytePtr, Length);
  if (v17)
  {
    int v44 = (int)v17;
    ACFULogging::getLogInstance(v17);
    ACFULogging::handleMessage();
    CFDataRef v43 = 0;
    goto LABEL_29;
  }
  char v18 = (ACFULogging *)(*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 32) + 184))(*(void *)(a1 + 32), 1);
  if (v18)
  {
    ACFULogging::getLogInstance(v18);
LABEL_46:
    ACFULogging::handleMessage();
    CFDataRef v43 = 0;
    int v44 = 3010;
    goto LABEL_29;
  }
  uint64_t v19 = (ACFULogging *)(*(uint64_t (**)(void, int *))(**(void **)(a1 + 32) + 192))(*(void *)(a1 + 32), &v52);
  if (v19 || v52 != 1)
  {
    ACFULogging::getLogInstance(v19);
    goto LABEL_46;
  }
  CFDataRef v49 = v11;
  CFDataRef v50 = v8;
  int v20 = *(uint64_t **)(a1 + 32);
  uint64_t v21 = *v20;
  CFDataRef v51 = v9;
  if (!v12)
  {
    std::string v31 = *(uint64_t (**)(uint64_t *, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const UInt8 *, CFIndex))(v21 + 96);
    CFDataRef v32 = CFDataGetBytePtr(Manifest);
    CFIndex v33 = CFDataGetLength(Manifest);
    CFDataRef v34 = v9;
    char v35 = CFDataGetBytePtr(v8);
    CFIndex v36 = CFDataGetLength(v8);
    v37 = CFDataGetBytePtr(v34);
    CFIndex v38 = CFDataGetLength(v34);
    v39 = (ACFULogging *)v31(v20, v32, v33, v35, v36, v37, v38);
    if (!v39)
    {
      CFDataRef v12 = 0;
      goto LABEL_24;
    }
    ACFULogging::getLogInstance(v39);
    ACFULogging::handleMessage();
    CFDataRef v12 = 0;
    CFDataRef v43 = 0;
    int v44 = 3001;
LABEL_49:
    CFDataRef v8 = v50;
    CFDataRef v9 = v51;
    CFDataRef v11 = v49;
    goto LABEL_29;
  }
  uint64_t v47 = a4;
  UInt8 v48 = *(uint64_t (**)(uint64_t *, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const char *, ACFULogging *))(v21 + 448);
  uint64_t v22 = CFDataGetBytePtr(Manifest);
  CFIndex v23 = CFDataGetLength(Manifest);
  uint64_t v24 = CFDataGetBytePtr(v8);
  CFIndex v25 = CFDataGetLength(v8);
  long long v26 = CFDataGetBytePtr(v9);
  CFIndex v27 = CFDataGetLength(v9);
  char v28 = CFDataGetBytePtr(v12);
  CFIndex v29 = CFDataGetLength(v12);
  std::string v30 = (ACFULogging *)v48(v20, v22, v23, v24, v25, v26, v27, v28, v29, v45, v46);
  if (v30)
  {
    ACFULogging::getLogInstance(v30);
    ACFULogging::handleMessage();
    CFDataRef v43 = 0;
    int v44 = 3001;
    a4 = v47;
    goto LABEL_49;
  }
  a4 = v47;
LABEL_24:
  CFDataRef v8 = v50;
  CFDataRef v9 = v51;
  CFDataRef v11 = v49;
LABEL_25:
  uint64_t v40 = *(void *)(a1 + 32);
  CFAllocatorRef v41 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef v42 = (ACFULogging *)(*(uint64_t (**)(uint64_t, void, const UInt8 **, CFIndex *))(*(void *)v40 + 312))(v40, *MEMORY[0x263EFFB08], &v54, &v53);
  if (v42)
  {
    ACFULogging::getLogInstance(v42);
    ACFULogging::handleMessage();
    CFDataRef v43 = 0;
    int v44 = 3013;
  }
  else
  {
    CFDataRef v43 = CFDataCreateWithBytesNoCopy(v41, v54, v53, v41);
    if (v43)
    {
      int v44 = 0;
    }
    else
    {
      ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage();
      int v44 = 4000;
    }
  }
LABEL_28:
  if (v8) {
LABEL_29:
  }
    CFRelease(v8);
  if (v9) {
    CFRelease(v9);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (v11) {
    CFRelease(v11);
  }
LABEL_36:
  *(void *)a4 = v43;
  *(_DWORD *)(a4 + 8) = v44;
}

void RoseTransport::~RoseTransport(RoseTransport *this)
{
  *(void *)this = &unk_26E056C68;
  RoseTransport::destroyRoseController(this);
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 14);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = *((void *)this + 11);
  *((void *)this + 11) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v4 = *((void *)this + 10);
  *((void *)this + 10) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  uint64_t v5 = *((void *)this + 8);
  *((void *)this + 8) = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 16))(v5);
  }
  std::unique_ptr<ACFUSynchronize::Syncher>::reset[abi:ne180100]((uint64_t *)this + 7, 0);
  std::unique_ptr<ACFUSynchronize::Syncher>::reset[abi:ne180100]((uint64_t *)this + 6, 0);

  MEMORY[0x270F0D368](this);
}

{
  void *v1;
  uint64_t vars8;

  RoseTransport::~RoseTransport(this);

  operator delete(v1);
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
    int v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    int v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void std::unique_ptr<ACFUSynchronize::Syncher>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    std::mutex::~mutex((std::mutex *)(v2 + 48));
    std::condition_variable::~condition_variable((std::condition_variable *)v2);
    operator delete(v3);
  }
}

void *std::allocate_shared[abi:ne180100]<ACFUCommon::PersonalizeParams,std::allocator<ACFUCommon::PersonalizeParams>,std::vector<__CFString const*> &,void>@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0xE8uLL);
  uint64_t result = std::__shared_ptr_emplace<ACFUCommon::PersonalizeParams>::__shared_ptr_emplace[abi:ne180100]<std::vector<__CFString const*> &,std::allocator<ACFUCommon::PersonalizeParams>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_22CFE3CA4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<ACFUCommon::PersonalizeParams>::__shared_ptr_emplace[abi:ne180100]<std::vector<__CFString const*> &,std::allocator<ACFUCommon::PersonalizeParams>,0>(void *a1, uint64_t a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26E056D00;
  std::allocator<ACFUCommon::PersonalizeParams>::construct[abi:ne180100]<ACFUCommon::PersonalizeParams,std::vector<__CFString const*> &>((uint64_t)&v4, (uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_22CFE3D14(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<ACFUCommon::PersonalizeParams>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E056D00;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ACFUCommon::PersonalizeParams>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E056D00;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<ACFUCommon::PersonalizeParams>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16))();
}

void std::allocator<ACFUCommon::PersonalizeParams>::construct[abi:ne180100]<ACFUCommon::PersonalizeParams,std::vector<__CFString const*> &>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __p = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  std::vector<__CFString const*>::__init_with_size[abi:ne180100]<__CFString const**,__CFString const**>(&__p, *(const void **)a3, *(void *)(a3 + 8), (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 3);
  MEMORY[0x230F78AA0](a2, &__p);
  if (__p)
  {
    uint64_t v5 = __p;
    operator delete(__p);
  }
}

void sub_22CFE3E14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<__CFString const*>::__init_with_size[abi:ne180100]<__CFString const**,__CFString const**>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<__CFString const*>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_22CFE3E90(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::__function::__func<RoseTransport::pushFirmware(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<RoseTransport::pushFirmware(std::shared_ptr<ACFUFirmware>)::$_0>,BOOL ()(void)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26E056D50;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<RoseTransport::pushFirmware(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<RoseTransport::pushFirmware(std::shared_ptr<ACFUFirmware>)::$_0>,BOOL ()(void)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26E056D50;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<RoseTransport::pushFirmware(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<RoseTransport::pushFirmware(std::shared_ptr<ACFUFirmware>)::$_0>,BOOL ()(void)>::operator()(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t v2 = *(uint64_t **)(v1 + 64);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *v2;
  if (!v4)
  {
    uint64_t v5 = 0;
    *(void *)(v1 + 64) = 0;
    goto LABEL_7;
  }
  uint64_t v5 = (**v4)(v4);
  uint64_t v2 = *(uint64_t **)(v1 + 64);
  *(void *)(v1 + 64) = 0;
  if (v2)
  {
    uint64_t v3 = *v2;
LABEL_7:
    (*(void (**)(uint64_t *))(v3 + 16))(v2);
  }
  return v5;
}

uint64_t std::__function::__func<RoseTransport::pushFirmware(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<RoseTransport::pushFirmware(std::shared_ptr<ACFUFirmware>)::$_0>,BOOL ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<RoseTransport::pushFirmware(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<RoseTransport::pushFirmware(std::shared_ptr<ACFUFirmware>)::$_0>,BOOL ()(void)>::target_type()
{
}

void *std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](void *a1)
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

void *_ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher4waitEjNS_8functionIFbvEEEEd_UlvE_NS_9allocatorIS7_EES5_E7__cloneEv()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_26E056DE0;
  return result;
}

void _ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher4waitEjNS_8functionIFbvEEEEd_UlvE_NS_9allocatorIS7_EES5_E7__cloneEPNS0_6__baseIS5_EE(uint64_t a1, void *a2)
{
  *a2 = &unk_26E056DE0;
}

uint64_t _ZNSt3__110__function6__funcIZN15ACFUSynchronize7Syncher4waitEjNS_8functionIFbvEEEEd_UlvE_NS_9allocatorIS7_EES5_EclEv()
{
  return 1;
}

uint64_t _ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher4waitEjNS_8functionIFbvEEEEd_UlvE_NS_9allocatorIS7_EES5_E6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZN15ACFUSynchronize7Syncher4waitEjNSt3__18functionIFbvEEEEd_UlvE_))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher4waitEjNS_8functionIFbvEEEEd_UlvE_NS_9allocatorIS7_EES5_E11target_typeEv()
{
  return &_ZTIZN15ACFUSynchronize7Syncher4waitEjNSt3__18functionIFbvEEEEd_UlvE_;
}

void *std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](void *a1)
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

void *_ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher6notifyEbNS_8functionIFvvEEEEd_UlvE_NS_9allocatorIS7_EES5_E7__cloneEv()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_26E056E60;
  return result;
}

void _ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher6notifyEbNS_8functionIFvvEEEEd_UlvE_NS_9allocatorIS7_EES5_E7__cloneEPNS0_6__baseIS5_EE(uint64_t a1, void *a2)
{
  *a2 = &unk_26E056E60;
}

uint64_t _ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher6notifyEbNS_8functionIFvvEEEEd_UlvE_NS_9allocatorIS7_EES5_E6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZN15ACFUSynchronize7Syncher6notifyEbNSt3__18functionIFvvEEEEd_UlvE_))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher6notifyEbNS_8functionIFvvEEEEd_UlvE_NS_9allocatorIS7_EES5_E11target_typeEv()
{
  return &_ZTIZN15ACFUSynchronize7Syncher6notifyEbNSt3__18functionIFvvEEEEd_UlvE_;
}

__n128 std::__function::__func<RoseTransport::eventHandler(void *,unsigned long)::$_0,std::allocator<RoseTransport::eventHandler(void *,unsigned long)::$_0>,void ()(void)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = &unk_26E056EF0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<RoseTransport::eventHandler(void *,unsigned long)::$_0,std::allocator<RoseTransport::eventHandler(void *,unsigned long)::$_0>,void ()(void)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E056EF0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<RoseTransport::eventHandler(void *,unsigned long)::$_0,std::allocator<RoseTransport::eventHandler(void *,unsigned long)::$_0>,void ()(void)>::operator()(void *a1)
{
  uint64_t v2 = a1[1];
  uint64_t v1 = (ACFULogging *)a1[2];
  unint64_t v3 = a1[3];
  BOOL v4 = RoseCapabilities::supportsRTKitIOConfig(*(RoseCapabilities **)(v2 + 104));
  RoseEvent::create(v1, v3, v4, &v7);
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  uint64_t result = *(void *)(v2 + 64);
  *(void *)(v2 + 64) = v5;
  if (result)
  {
    (*(void (**)(uint64_t))(*(void *)result + 16))(result);
    uint64_t result = v7;
    uint64_t v7 = 0;
    if (result) {
      return (*(uint64_t (**)(uint64_t))(*(void *)result + 16))(result);
    }
  }
  return result;
}

uint64_t std::__function::__func<RoseTransport::eventHandler(void *,unsigned long)::$_0,std::allocator<RoseTransport::eventHandler(void *,unsigned long)::$_0>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<RoseTransport::eventHandler(void *,unsigned long)::$_0,std::allocator<RoseTransport::eventHandler(void *,unsigned long)::$_0>,void ()(void)>::target_type()
{
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x230F78EA0](v13, a1);
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
  MEMORY[0x230F78EB0](v13);
  return a1;
}

void sub_22CFE45C0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x230F78EB0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x22CFE45A0);
}

void sub_22CFE4614(_Unwind_Exception *a1)
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

void sub_22CFE4794(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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

__n128 std::__function::__func<RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::$_0,std::allocator<RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::$_0>,BOOL ()(void)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26E056F70;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::$_0,std::allocator<RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::$_0>,BOOL ()(void)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E056F70;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::$_0,std::allocator<RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::$_0>,BOOL ()(void)>::operator()(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  unint64_t v3 = *(const void **)(v2 + 64);
  if (!v3) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 16))
  {
    if (v4)
    {
      uint64_t v5 = (**v4)(v4);
LABEL_8:
      uint64_t v6 = v5;
      goto LABEL_10;
    }
  }
  else
  {
    if (v7)
    {
      uint64_t v5 = RoseCommandCompleteEvent::validate(v7, 32);
      goto LABEL_8;
    }
  }
  uint64_t v6 = 0;
LABEL_10:
  uint64_t v8 = *(void *)(v2 + 64);
  *(void *)(v2 + 64) = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 16))(v8);
  }
  return v6;
}

uint64_t std::__function::__func<RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::$_0,std::allocator<RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::$_0>,BOOL ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::$_0,std::allocator<RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::$_0>,BOOL ()(void)>::target_type()
{
}

ACFURestore *RoseRestore::create(RoseRestore *this, const __CFDictionary *a2)
{
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  unint64_t v3 = (ACFURestore *)operator new(0x160uLL);
  ACFURestore::ACFURestore(v3);
  *(void *)unint64_t v3 = &unk_26E056FF0;
  *((_WORD *)v3 + 168) = 0;
  *((void *)v3 + 43) = 0;
  BOOL v4 = (ACFULogging *)RoseRestore::init(v3, this, @"Rap,Ticket");
  if (v4)
  {
    ACFULogging::getLogInstance(v4);
    ACFULogging::handleMessage();
    (*(void (**)(ACFURestore *))(*(void *)v3 + 8))(v3);
    return 0;
  }
  return v3;
}

void sub_22CFE4B30(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void RoseRestore::RoseRestore(RoseRestore *this)
{
  ACFURestore::ACFURestore(this);
  *(void *)uint64_t v1 = &unk_26E056FF0;
  *(_WORD *)(v1 + 336) = 0;
  *(void *)(v1 + 344) = 0;
}

void RoseRestore::queryCmd(RoseRestore *this@<X0>, uint64_t a2@<X8>)
{
  if (ACFURestore::isNeRDOS(this))
  {
    uint64_t v4 = (*(uint64_t (**)(RoseRestore *))(*(void *)this + 16))(this);
    if (v4)
    {
      *(void *)a2 = v4;
      *(unsigned char *)(a2 + 8) = 1;
      return;
    }
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    std::string::basic_string[abi:ne180100]<0>(&__p, "Failed to collect preflight info");
    ACFUError::addError();
    if (v18 < 0) {
      operator delete(__p);
    }
    char v7 = 0;
    CFDictionaryRef v6 = 0;
  }
  else
  {
    Cmd = (ACFULogging *)ACFURestore::queryCmd((uint64_t *)&__s2, this);
    CFDictionaryRef v6 = __s2;
    char v7 = v16;
    if (v16)
    {
      if ((ACFURestore::isPreflight(this) & 1) == 0 && CFDictionaryContainsKey(v6, @"Rap,BoardID"))
      {
        LOWORD(__s2) = 0;
        CFTypeID Value = (CFTypeID)CFDictionaryGetValue(v6, @"Rap,BoardID");
        int v9 = (const void *)Value;
        if (Value)
        {
          CFTypeID TypeID = CFDataGetTypeID();
          CFTypeID Value = CFGetTypeID(v9);
          if (TypeID == Value)
          {
            BytePtr = CFDataGetBytePtr((CFDataRef)v9);
            unint64_t Length = CFDataGetLength((CFDataRef)v9);
            if (Length >= 2) {
              size_t v13 = 2;
            }
            else {
              size_t v13 = Length;
            }
            CFTypeID Value = memcmp(BytePtr, &__s2, v13);
            LODWORD(v9) = Value == 0;
          }
          else
          {
            LODWORD(v9) = 0;
          }
        }
        ACFULogging::getLogInstance((ACFULogging *)Value);
        ACFULogging::handleMessage();
        uint64_t v14 = (const void **)MEMORY[0x263EFFB40];
        if (!v9) {
          uint64_t v14 = (const void **)MEMORY[0x263EFFB38];
        }
        CFDictionaryAddValue(v6, @"LocalSigningID", *v14);
      }
    }
    else
    {
      ACFULogging::getLogInstance(Cmd);
      ACFULogging::handleMessage();
    }
  }
  *(void *)a2 = v6;
  *(unsigned char *)(a2 + 8) = v7;
}

void sub_22CFE4DB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t RoseRestore::performCmd(CFDictionaryRef *this)
{
  uint64_t result = ACFURestore::performCmd((ACFURestore *)this);
  if (result)
  {
    CurrentUpdateStep = (ACFULogging *)ACFURestore::getCurrentUpdateStep((ACFURestore *)this);
    if (CurrentUpdateStep)
    {
      ACFULogging::getLogInstance(CurrentUpdateStep);
      ACFURestore::getCurrentUpdateStep((ACFURestore *)this);
      ACFULogging::handleMessage();
      return 1;
    }
    isPostSealing = (ACFULogging *)ACFURestore::isPostSealing((ACFURestore *)this);
    if (isPostSealing)
    {
      CFTypeID Value = CFDictionaryGetValue(this[16], @"APTicket");
      if (!Value)
      {
        ACFULogging::getLogInstance(0);
        goto LABEL_50;
      }
      CFDictionaryRef v6 = Value;
      CFTypeID v7 = CFGetTypeID(Value);
      CFTypeID TypeID = (ACFULogging *)CFDataGetTypeID();
      if ((ACFULogging *)v7 != TypeID)
      {
        ACFULogging::getLogInstance(TypeID);
        goto LABEL_50;
      }
      LOWORD(v37) = 0;
      *((void *)&v37 + 1) = v6;
      LOBYTE(v38) = *((unsigned char *)this + 337);
      int v9 = (std::__shared_weak_count *)this[7];
      CFDictionaryRef v35 = this[6];
      CFIndex v36 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      CFDictionaryRef v10 = this[21];
      if (v10
      {
        uint64_t v11 = (std::__shared_weak_count *)this[22];
        if (v11) {
          atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
        }
      }
      else
      {
        uint64_t v11 = 0;
      }
      RoseTransport::getCapabilities((uint64_t)v10, &v33);
      int v12 = RoseCalibration::sendCalibration((uint64_t *)&v35, (uint64_t)&v33, &v37);
      if (v34) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v34);
      }
      if (v11) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v11);
      }
      isPostSealing = (ACFULogging *)v36;
      if (v36) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v36);
      }
      if (v12)
      {
        ACFULogging::getLogInstance(isPostSealing);
        goto LABEL_50;
      }
    }
    if (!*((unsigned char *)this + 336)) {
      return 1;
    }
    this[25] = this[41];
    CFDictionaryRef v13 = this[18];
    this[26] = v13;
    if (this[27] && this[28])
    {
      if (v13)
      {
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, this[15]);
        if (MutableCopy)
        {
          uint64_t v15 = MutableCopy;
          char v16 = (const void *)ACFUFirmware::copyFWContainer(this[19]);
          if (v16)
          {
            uint64_t v17 = v16;
            CFDictionarySetValue(v15, @"FirmwareData", v16);
            CFRelease(v17);
            ACFULogging::getLogInstance(v18);
            std::string::basic_string[abi:ne180100]<0>(&v27, "RoseRestore");
            uint64_t v19 = std::string::append(&v27, "::");
            long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
            v28.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v20;
            v19->__r_.__value_.__l.__size_ = 0;
            v19->__r_.__value_.__r.__words[2] = 0;
            v19->__r_.__value_.__r.__words[0] = 0;
            uint64_t v21 = std::string::append(&v28, "performCmd");
            long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
            std::string::size_type v38 = v21->__r_.__value_.__r.__words[2];
            long long v37 = v22;
            v21->__r_.__value_.__l.__size_ = 0;
            v21->__r_.__value_.__r.__words[2] = 0;
            v21->__r_.__value_.__r.__words[0] = 0;
            ACFULogging::handleMessageCFType();
            if (SHIBYTE(v38) < 0) {
              operator delete((void *)v37);
            }
            if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v28.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v27.__r_.__value_.__l.__data_);
            }
            CFIndex v23 = (ACFULogging *)(*(uint64_t (**)(CFDictionaryRef, char *, CFDictionaryRef, __CFDictionary *, void))(*(void *)this[6] + 32))(this[6], (char *)this + 200, this[17], v15, 0);
            if (!v23)
            {
              CFRelease(v15);
              return 1;
            }
            ACFULogging::getLogInstance(v23);
            ACFULogging::handleMessage();
            std::string::basic_string[abi:ne180100]<0>(&v25, "Failed to perform certification step");
            ACFUError::addError();
            if (v26 < 0) {
              operator delete(v25);
            }
          }
          else
          {
            ACFULogging::getLogInstance(0);
            ACFULogging::handleMessage();
          }
          CFRelease(v15);
          return 0;
        }
        ACFULogging::getLogInstance(0);
LABEL_50:
        ACFULogging::handleMessage();
        return 0;
      }
      ACFULogging::getLogInstance(isPostSealing);
      ACFULogging::handleMessage();
      std::string::basic_string[abi:ne180100]<0>(&__p, "No certification URL found for certification step");
      ACFUError::addError();
      if ((v30 & 0x80000000) == 0) {
        return 0;
      }
      uint64_t v24 = __p;
    }
    else
    {
      ACFULogging::getLogInstance(isPostSealing);
      ACFULogging::handleMessage();
      std::string::basic_string[abi:ne180100]<0>(&v31, "Incomplete parameter set for certification");
      ACFUError::addError();
      if ((v32 & 0x80000000) == 0) {
        return 0;
      }
      uint64_t v24 = v31;
    }
    operator delete(v24);
    return 0;
  }
  return result;
}

void sub_22CFE5300(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,int a34,__int16 a35,char a36,char a37,uint64_t a38,uint64_t a39,int a40,__int16 a41,char a42,char a43)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void RoseRestore::~RoseRestore(RoseRestore *this)
{
  ACFURestore::~ACFURestore(this);

  operator delete(v1);
}

ACFULogging *RoseRestore::gatherPreflightParameters(__CFString **this)
{
  isNeRDOS = (ACFULogging *)ACFURestore::isNeRDOS((ACFURestore *)this);
  char v3 = (char)isNeRDOS;
  ACFULogging::getLogInstance(isNeRDOS);
  if (v3)
  {
    ACFULogging::handleMessage();
    uint64_t v5 = (ACFULogging *)RoseBootstrappedPreflight::bootstrappedPreflight(0, 0, this[43], v4);
    CFDictionaryRef v6 = v5;
    CFTypeID v7 = 0;
    if (!v5)
    {
LABEL_9:
      ACFULogging::getLogInstance(v5);
      ACFULogging::handleMessage();
      CFDictionaryRef v6 = 0;
      if (!v7) {
        return v6;
      }
      goto LABEL_13;
    }
  }
  else
  {
    ACFULogging::handleMessage();
    uint64_t v8 = dlopen("/System/Library/PrivateFrameworks/Proximity.framework/Proximity", 1);
    if (!v8)
    {
      ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage();
      return 0;
    }
    CFTypeID v7 = v8;
    int v9 = (ACFULogging *)dlsym(v8, "PRGetPreflightInfo");
    ACFULogging::getLogInstance(v9);
    if (!v9)
    {
      ACFULogging::handleMessage();
      CFDictionaryRef v6 = 0;
      goto LABEL_13;
    }
    uint64_t v5 = (ACFULogging *)ACFULogging::handleMessage();
    int v10 = 1;
    while (1)
    {
      ACFULogging::getLogInstance(v5);
      uint64_t v11 = ACFULogging::handleMessage();
      uint64_t v5 = (ACFULogging *)((uint64_t (*)(uint64_t))v9)(v11);
      if (v5) {
        break;
      }
      ++v10;
      __ns.__rep_ = 1000000000;
      std::this_thread::sleep_for (&__ns);
      if (v10 == 3) {
        goto LABEL_9;
      }
    }
    CFDictionaryRef v6 = v5;
  }
  ACFULogging::getLogInstance(v5);
  ACFULogging::handleMessage();
  if (v7) {
LABEL_13:
  }
    dlclose(v7);
  return v6;
}

uint64_t RoseRestore::init(RoseRestore *this, const __CFDictionary *a2, const void *a3)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  CFStringRef v4 = (ACFULogging *)ACFURestore::init(this, a2, a3);
  if (v4)
  {
    ACFULogging::getLogInstance(v4);
    ACFULogging::handleMessage();
    return 4000;
  }
  if (CFDictionaryContainsKey(*((CFDictionaryRef *)this + 16), @"DebugLogPath"))
  {
    CFTypeID Value = (ACFULogging *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 16), @"DebugLogPath");
    if (!Value
      || (v6 = Value, CFTypeID v7 = CFGetTypeID(Value), Value = (ACFULogging *)CFStringGetTypeID(), (ACFULogging *)v7 != Value))
    {
      ACFULogging::getLogInstance(Value);
      ACFULogging::handleMessage();
      return 4002;
    }
    *((void *)this + 43) = v6;
  }
  uint64_t isPreflight = ACFURestore::isPreflight(this);
  if (isPreflight & 1) != 0 || (uint64_t isPreflight = ACFURestore::isNeRDOS(this), (isPreflight))
  {
    ACFULogging::getLogInstance((ACFULogging *)isPreflight);
    ACFULogging::handleMessage();
    int v10 = 0;
    uint64_t v11 = 0;
    goto LABEL_9;
  }
  int v44 = 1;
  UInt8 v48 = 0;
  uint64_t v49 = 0;
  UInt8 v45 = 0;
  UInt8 v46 = 0;
  uint64_t v47 = (RoseCapabilities *)&v48;
  __int16 v43 = 1;
  URLByAppendingStrings = (std::__shared_weak_count *)ACFUCommon::createURLByAppendingStrings(*((ACFUCommon **)this + 41), @"/usr/standalone/firmware/Rose/", v9);
  int v10 = URLByAppendingStrings;
  if (URLByAppendingStrings)
  {
    UInt8 v45 = @"Rap,Ticket";
    UInt8 v46 = URLByAppendingStrings;
    GetRoseTatsuTagToFileNameMap((uint64_t)&v40);
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v47, v48);
    uint64_t v17 = (char *)v41;
    uint64_t v47 = v40;
    UInt8 v48 = (char *)v41;
    uint64_t v49 = v42;
    if (v42)
    {
      v41->__shared_weak_owners_ = (uint64_t)&v48;
      uint64_t v40 = (RoseCapabilities *)&v41;
      CFAllocatorRef v41 = 0;
      uint64_t v42 = 0;
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v47 = (RoseCapabilities *)&v48;
    }
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v40, v17);
    RTKitFirmware::create();
    std::shared_ptr<RTKitFirmware>::operator=[abi:ne180100]<RTKitFirmware,std::default_delete<RTKitFirmware>,void>((void *)this + 19, (uint64_t *)&v40);
    char v18 = v40;
    uint64_t v40 = 0;
    if (v18) {
      char v18 = (RoseCapabilities *)(*(uint64_t (**)(RoseCapabilities *))(*(void *)v18 + 56))(v18);
    }
    if (*((void *)this + 19))
    {
      uint64_t v19 = (std::__shared_weak_count *)*((void *)this + 24);
      uint64_t v38 = *((void *)this + 23);
      v39 = v19;
      if (v19) {
        atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      RoseTransport::create(&v38, 0, 0, &v40);
      long long v20 = (void **)((char *)this + 168);
      std::shared_ptr<RoseTransport>::operator=[abi:ne180100]<RoseTransport,std::default_delete<RoseTransport>,void>((void *)this + 21, (uint64_t *)&v40);
      uint64_t v21 = v40;
      uint64_t v40 = 0;
      if (v21) {
        (*(void (**)(RoseCapabilities *))(*(void *)v21 + 64))(v21);
      }
      long long v22 = (ACFULogging *)v39;
      if (v39) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v39);
      }
      if (*v20)
      {
        CFIndex v23 = (std::__shared_weak_count *)*((void *)this + 22);
        long long v37 = v23;
        if (v23) {
          atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v24 = (std::__shared_weak_count *)*((void *)this + 20);
        CFIndex v36 = v24;
        if (v24) {
          atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        CFIndex v25 = (std::__shared_weak_count *)*((void *)this + 24);
        CFDictionaryRef v35 = v25;
        if (v25) {
          atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        ACFURTKitROM::create();
        uint64_t v11 = v40;
        int v12 = v41;
        uint64_t v40 = 0;
        CFAllocatorRef v41 = 0;
        if (v35) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v35);
        }
        if (v36) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v36);
        }
        char v26 = (ACFULogging *)v37;
        if (v37) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v37);
        }
        if (v11)
        {
          if (*((void *)this + 18))
          {
            isPostSealing = (ACFULogging *)ACFURestore::isPostSealing(this);
            *((unsigned char *)this + 336) = isPostSealing ^ 1;
            if ((isPostSealing & 1) == 0)
            {
              ACFULogging::getLogInstance(isPostSealing);
              ACFULogging::handleMessage();
              std::string v28 = *v20;
              if (*v20
              {
                CFIndex v29 = (std::__shared_weak_count *)*((void *)this + 22);
                if (v29) {
                  atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
                }
              }
              else
              {
                CFIndex v29 = 0;
              }
              RoseTransport::getCapabilities((uint64_t)v28, &v40);
              char v30 = RoseCapabilities::chipNameForCertification(v40);
              *((void *)this + 25) = 0;
              *((void *)this + 26) = 0;
              *((void *)this + 27) = v30;
              *((void *)this + 28) = @"rcrt";
              *((_DWORD *)this + 58) = 1;
              *((void *)this + 31) = 0;
              *((void *)this + 32) = 0;
              *((void *)this + 30) = 0;
              if (v41) {
                std::__shared_weak_count::__release_shared[abi:ne180100](v41);
              }
              if (v29) {
                std::__shared_weak_count::__release_shared[abi:ne180100](v29);
              }
            }
          }
          else
          {
            *((unsigned char *)this + 336) = 0;
          }
          if (ACFURestore::isPostSealing(this))
          {
            std::string v31 = *v20;
            if (*v20
            {
              char v32 = (std::__shared_weak_count *)*((void *)this + 22);
              if (v32) {
                atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
              }
            }
            else
            {
              char v32 = 0;
            }
            RoseTransport::getCapabilities((uint64_t)v31, &v40);
            *((unsigned char *)this + 337) = RoseCapabilities::supportsRTKitIOConfig(v40);
            if (v41) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v41);
            }
            if (v32) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v32);
            }
            CFDataRef v34 = (ACFULogging *)ACFUCommon::parseDebugArgs((uint64_t *)&v40, *((ACFUCommon **)this + 15), (const __CFDictionary *)"combinedFDRObjects", v33);
            if (!HIDWORD(v40))
            {
              *((unsigned char *)this + 337) = v40 != 0;
              ACFULogging::getLogInstance(v34);
              ACFULogging::handleMessage();
            }
          }
          std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v47, v48);
          if (v12)
          {
            char v13 = 0;
            atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
            int v44 = 0;
            UInt8 v45 = (__CFString *)v11;
            UInt8 v46 = v12;
            atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_10:
            LOWORD(v47) = 3;
            BYTE2(v47) = 1;
            std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__assign_unique<std::pair<ACFURestore::UpdateSteps const,RestoreStep> const*>((uint64_t **)this + 3, &v44, (int *)&v48);
            if (v46) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v46);
            }
            if ((v13 & 1) == 0) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v12);
            }
            ACFUError::createAppendedDomain(*((ACFUError **)this + 13), @"RoseRestore");
            uint64_t v14 = 0;
            if (!v10) {
              goto LABEL_16;
            }
            goto LABEL_15;
          }
LABEL_9:
          int v12 = 0;
          int v44 = 0;
          char v13 = 1;
          UInt8 v45 = (__CFString *)v11;
          UInt8 v46 = 0;
          goto LABEL_10;
        }
        ACFULogging::getLogInstance(v26);
        ACFULogging::handleMessage();
      }
      else
      {
        ACFULogging::getLogInstance(v22);
        int v12 = 0;
        ACFULogging::handleMessage();
      }
      uint64_t v14 = 4008;
    }
    else
    {
      ACFULogging::getLogInstance(v18);
      int v12 = 0;
      ACFULogging::handleMessage();
      uint64_t v14 = 1000;
    }
  }
  else
  {
    ACFULogging::getLogInstance(0);
    int v12 = 0;
    ACFULogging::handleMessage();
    uint64_t v14 = 4000;
  }
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v47, v48);
  if (v10) {
LABEL_15:
  }
    CFRelease(v10);
LABEL_16:
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  return v14;
}

void sub_22CFE5CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,std::__shared_weak_count *a23)
{
  if (a23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a23);
  }
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(v23, *(char **)(v26 - 88));
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  _Unwind_Resume(a1);
}

void sub_22CFE5E10()
{
  if (!v0) {
    JUMPOUT(0x22CFE5DF0);
  }
  JUMPOUT(0x22CFE5DE8);
}

uint64_t **std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__assign_unique<std::pair<ACFURestore::UpdateSteps const,RestoreStep> const*>(uint64_t **result, int *a2, int *a3)
{
  uint64_t v5 = result;
  if (result[2])
  {
    CFDictionaryRef v6 = *result;
    CFTypeID v7 = result[1];
    void *result = (uint64_t *)(result + 1);
    void v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1]) {
      uint64_t v8 = (uint64_t *)v6[1];
    }
    else {
      uint64_t v8 = v6;
    }
    int v10 = result;
    uint64_t v11 = v8;
    int v12 = v8;
    if (v8)
    {
      uint64_t v11 = std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::__detach_next((uint64_t)v8);
      while (a2 != a3)
      {
        std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__node_assign_unique(v5, a2, (uint64_t)v8);
        if (v9)
        {
          uint64_t v8 = v11;
          int v12 = v11;
          if (!v11)
          {
            a2 += 8;
            break;
          }
          uint64_t v11 = std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::__detach_next((uint64_t)v11);
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

void sub_22CFE5F10(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__node_assign_unique(uint64_t **a1, int *a2, uint64_t a3)
{
  char v3 = (uint64_t *)a3;
  CFDictionaryRef v6 = a1 + 1;
  uint64_t v5 = a1[1];
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
        uint64_t v5 = *v8;
        CFDictionaryRef v6 = v8;
        if (!*v8) {
          goto LABEL_9;
        }
      }
      if (v9 >= v7) {
        return (uint64_t *)v8;
      }
      uint64_t v5 = v8[1];
      if (!v5)
      {
        CFDictionaryRef v6 = v8 + 1;
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
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__insert_node_at(a1, (uint64_t)v8, v6, v3);
  }
  return v3;
}

uint64_t std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::destroy(*(void *)a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    char v3 = (void *)v2[2];
    if (v3)
    {
      do
      {
        uint64_t v2 = v3;
        char v3 = (void *)v3[2];
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
    CFStringRef v4 = (std::__shared_weak_count *)a2[6];
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    operator delete(a2);
  }
}

uint64_t **std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__emplace_unique_key_args<ACFURestore::UpdateSteps,std::pair<ACFURestore::UpdateSteps const,RestoreStep> const&>(uint64_t **a1, int *a2, uint64_t a3)
{
  CFDictionaryRef v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    int v7 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v8 = (uint64_t **)v5;
        int v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9) {
          break;
        }
        uint64_t v5 = *v8;
        CFDictionaryRef v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        return v8;
      }
      uint64_t v5 = v8[1];
      if (!v5)
      {
        CFDictionaryRef v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v8 = a1 + 1;
LABEL_10:
    int v10 = operator new(0x40uLL);
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
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__insert_node_at(a1, (uint64_t)v8, v6, (uint64_t *)v10);
  }
  return (uint64_t **)v11;
}

void *RoseUpdaterCreate(const __CFDictionary *a1, void (*a2)(void *, const char *), void *a3, void *a4)
{
  uint64_t v8 = (ACFULogging *)MEMORY[0x230F78DB0](v25, @"RoseUpdaterCreate");
  LogInstance = (ACFULogging *)ACFULogging::getLogInstance(v8);
  inited = (ACFULogging *)ACFULogging::initLog(LogInstance, a1, a2, a3);
  if (inited)
  {
    ACFULogging::getLogInstance(inited);
    ACFULogging::handleMessage();
    std::string::basic_string[abi:ne180100]<0>(v23, "failed to init logging");
    uint64_t v15 = (ACFULogging *)ACFUError::addError();
    Instance = 0;
    if ((v24 & 0x80000000) == 0) {
      goto LABEL_18;
    }
    char v16 = (void **)v23;
    goto LABEL_17;
  }
  if (RoseUpdaterCreate::only_once != -1) {
    dispatch_once(&RoseUpdaterCreate::only_once, &__block_literal_global_1);
  }
  if (!kRoseRestoreObjTypeID)
  {
    ACFULogging::getLogInstance(inited);
    ACFULogging::handleMessage();
    std::string::basic_string[abi:ne180100]<0>(v21, "failed to create Rose CFRuntimeClass");
    uint64_t v15 = (ACFULogging *)ACFUError::addError();
    Instance = 0;
    if ((v22 & 0x80000000) == 0) {
      goto LABEL_18;
    }
    char v16 = (void **)v21;
    goto LABEL_17;
  }
  Instance = (void *)_CFRuntimeCreateInstance();
  if (!Instance)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    std::string::basic_string[abi:ne180100]<0>(v19, "failed to create Rose CFType object");
    uint64_t v15 = (ACFULogging *)ACFUError::addError();
    Instance = 0;
    if ((v20 & 0x80000000) == 0) {
      goto LABEL_18;
    }
    char v16 = (void **)v19;
    goto LABEL_17;
  }
  char v13 = RoseRestore::create(a1, v11);
  Instance[2] = v13;
  if (v13)
  {
    ACFULogging::getLogInstance(v13);
    ACFULogging::handleMessage();
    goto LABEL_8;
  }
  ACFULogging::getLogInstance(0);
  ACFULogging::handleMessage();
  std::string::basic_string[abi:ne180100]<0>(v17, "failed to get the Rose restore instance");
  uint64_t v15 = (ACFULogging *)ACFUError::addError();
  if (v18 < 0)
  {
    char v16 = (void **)v17;
LABEL_17:
    operator delete(*v16);
  }
LABEL_18:
  ACFULogging::getLogInstance(v15);
  ACFULogging::handleMessage();
  *a4 = ACFUError::getCFError((ACFUError *)v25);
  if (Instance)
  {
    CFRelease(Instance);
    Instance = 0;
  }
LABEL_8:
  MEMORY[0x230F78DC0](v25);
  return Instance;
}

void sub_22CFE6438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  MEMORY[0x230F78DC0](v28 - 48);
  _Unwind_Resume(a1);
}

uint64_t __RoseUpdaterCreate_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  kRoseRestoreObjCFTypeID TypeID = result;
  return result;
}

void *RoseRestoreObjDestroy(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[2];
    if (result)
    {
      uint64_t v2 = (ACFULogging *)(*(uint64_t (**)(void *))(*result + 8))(result);
      ACFULogging::getLogInstance(v2);
      uint64_t result = (void *)ACFULogging::handleMessage();
      v1[2] = 0;
    }
  }
  return result;
}

CFStringRef RoseRestoreObjDescribe(CFStringRef result)
{
  if (result)
  {
    CFStringRef v1 = result;
    CFAllocatorRef v2 = CFGetAllocator(result);
    CFAllocatorRef v3 = CFGetAllocator(v1);
    return CFStringCreateWithFormat(v2, 0, @"<RoseRestoreObj %p [%p]>{}", v1, v3);
  }
  return result;
}

uint64_t RoseUpdaterExecCommand(ACFULogging *a1, ACFURestore *this, uint64_t a3, uint64_t a4, void *a5)
{
  if (a1)
  {
    uint64_t v5 = (ACFURestore *)*((void *)a1 + 2);
    if (v5)
    {
      ACFURestore::restoreCommand(this, (const __CFString *)this);
      if (ACFURestore::executeCommand()) {
        return 1;
      }
      ACFURestore::getErrorHandle((uint64_t *)&v9, v5);
      *a5 = ACFUError::getCFError(v9);
      uint64_t v8 = (ACFULogging *)v10;
      if (v10) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v10);
      }
      ACFULogging::getLogInstance(v8);
    }
    else
    {
      ACFULogging::getLogInstance(a1);
    }
  }
  else
  {
    ACFULogging::getLogInstance(0);
  }
  ACFULogging::handleMessage();
  return 0;
}

void sub_22CFE66BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }
  _Unwind_Resume(exception_object);
}

uint64_t RoseUpdaterIsDone(uint64_t result, void *a2)
{
  if (result)
  {
    CFAllocatorRef v3 = *(ACFURestore **)(result + 16);
    if (!v3)
    {
      uint64_t v5 = (ACFULogging *)MEMORY[0x230F78DB0](&v8, @"RoseUpdaterIsDone");
      ACFULogging::getLogInstance(v5);
      ACFULogging::handleMessage();
      std::string::basic_string[abi:ne180100]<0>(&__p, "RoseRestore object doesn't exist");
      ACFUError::addError();
      if (v7 < 0) {
        operator delete(__p);
      }
      *a2 = ACFUError::getCFError((ACFUError *)&v8);
      MEMORY[0x230F78DC0](&v8);
      return 1;
    }
    uint64_t result = ACFURestore::isRestoreComplete(*(ACFURestore **)(result + 16));
    if (result)
    {
      ACFURestore::getErrorHandle((uint64_t *)&v8, v3);
      *a2 = ACFUError::getCFError(v8);
      CFStringRef v4 = (ACFULogging *)v9;
      if (v9) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v9);
      }
      ACFULogging::getLogInstance(v4);
      ACFULogging::handleMessage();
      return 1;
    }
    *a2 = 0;
  }
  return result;
}

void sub_22CFE67F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v19 = *(std::__shared_weak_count **)(v17 - 24);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  _Unwind_Resume(exception_object);
}

void GetRoseTatsuTagToFileNameMap(uint64_t a1@<X8>)
{
  v7[3] = *MEMORY[0x263EF8340];
  CFAllocatorRef v3 = @"Rap,SoftwareBinaryDsp1";
  std::string::basic_string[abi:ne180100]<0>(v4, "sbd1");
  v4[3] = @"Rap,RTKitOS";
  std::string::basic_string[abi:ne180100]<0>(v5, "rkos");
  v5[3] = @"Rap,RestoreRTKitOS";
  std::string::basic_string[abi:ne180100]<0>(v6, "rrko");
  v6[3] = @"Rap,RTKitIOConfig";
  std::string::basic_string[abi:ne180100]<0>(v7, "icnf");
  std::map<__CFString const*,std::string>::map[abi:ne180100](a1, (unint64_t *)&v3, 4);
  for (uint64_t i = 0; i != -16; i -= 4)
  {
    if (SHIBYTE(v7[i + 2]) < 0) {
      operator delete((void *)v7[i]);
    }
  }
}

void sub_22CFE694C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  uint64_t v12 = 0;
  while (1)
  {
    if (*(char *)(v10 + v12 + 127) < 0) {
      operator delete(*(void **)(v10 + v12 + 104));
    }
    v12 -= 32;
    if (v12 == -128) {
      _Unwind_Resume(exception_object);
    }
  }
}

uint64_t std::map<__CFString const*,std::string>::map[abi:ne180100](uint64_t a1, unint64_t *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  CFStringRef v4 = (void *)(a1 + 8);
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

void sub_22CFE6A14(_Unwind_Exception *a1)
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
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__insert_node_at(a1, v10, v6, v8);
    return v8;
  }
  return result;
}

void *std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__find_equal<__CFString const*>(void *a1, void *a2, void *a3, void *a4, unint64_t *a5)
{
  uint64_t v5 = a1 + 1;
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
      char v13 = a2;
      do
      {
        uint64_t v10 = (void *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        char v13 = v10;
      }
      while (v14);
    }
    unint64_t v15 = *a5;
    if (v10[4] < *a5) {
      goto LABEL_17;
    }
    char v16 = (void *)*v5;
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
          char v16 = (void *)*v17;
          uint64_t v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        uint64_t v5 = v17 + 1;
        char v16 = (void *)v17[1];
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
    uint64_t v12 = (void *)a2[1];
    do
    {
      a4 = v12;
      uint64_t v12 = (void *)*v12;
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
    char v20 = (void *)*v5;
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
          char v20 = (void *)*v21;
          uint64_t v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        uint64_t v5 = v21 + 1;
        char v20 = (void *)v21[1];
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

void sub_22CFE6CE8(_Unwind_Exception *a1)
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

uint64_t RoseBootstrappedPreflight::bootstrappedPreflight()
{
  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 56))();
}

{
  uint64_t v0;

  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 56))();
}

{
  uint64_t v0;

  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 64))();
}

uint64_t RoseRestore::init(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1);
}

{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
}

uint64_t AMSupportCreateDataFromFileURL()
{
  return MEMORY[0x270F97A08]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
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

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
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

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
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

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE5400](allocator, URLString, baseURL);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x270EE5498](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x270EE54A8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x270EF3FC8](*(void *)&service, pluginType, interfaceType, theInterface, theScore);
}

kern_return_t IODestroyPlugInInterface(IOCFPlugInInterface **interface)
{
  return MEMORY[0x270EF4008](interface);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IORegistryEntryGetChildEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *child)
{
  return MEMORY[0x270EF49F0](*(void *)&entry, plane, child);
}

uint64_t IOReportCopyAllChannels()
{
  return MEMORY[0x270F92748]();
}

uint64_t IOReportCreateSamples()
{
  return MEMORY[0x270F92780]();
}

uint64_t IOReportCreateSubscription()
{
  return MEMORY[0x270F92798]();
}

uint64_t IOReportGetChannelCount()
{
  return MEMORY[0x270F927A0]();
}

uint64_t IOReportIterate()
{
  return MEMORY[0x270F927D8]();
}

uint64_t IOReportSampleCopyDescription()
{
  return MEMORY[0x270F927F0]();
}

uint64_t IOReportSelectChannelsInGroup()
{
  return MEMORY[0x270F927F8]();
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD8](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
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

uint64_t ACFUCommon::parseDebugArgs(ACFUCommon *this, const __CFDictionary *a2, const char *a3)
{
  return MEMORY[0x270F0D170](this, a2, a3);
}

uint64_t ACFUCommon::PersonalizeParams::logParameters(ACFUCommon::PersonalizeParams *this)
{
  return MEMORY[0x270F0D178](this);
}

uint64_t ACFUCommon::PersonalizeParams::PersonalizeParams()
{
  return MEMORY[0x270F0D190]();
}

uint64_t ACFUCommon::stringFromCFString(ACFUCommon *this, const __CFString *a2)
{
  return MEMORY[0x270F0D1A0](this, a2);
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

uint64_t ACFULogging::handleMessageBinary()
{
  return MEMORY[0x270F0D1E8]();
}

uint64_t ACFULogging::handleMessageCFType()
{
  return MEMORY[0x270F0D1F0]();
}

uint64_t ACFULogging::initLog(ACFULogging *this, const __CFDictionary *a2, void (*a3)(void *, const char *), void *a4)
{
  return MEMORY[0x270F0D208](this, a2, a3, a4);
}

uint64_t ACFUMachO32::create(ACFUMachO32 *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F0D210](this, a2);
}

uint64_t ACFUMachO64::create(ACFUMachO64 *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F0D218](this, a2);
}

uint64_t ACFURestore::performCmd(ACFURestore *this)
{
  return MEMORY[0x270F0D220](this);
}

uint64_t ACFURestore::isPreflight(ACFURestore *this)
{
  return MEMORY[0x270F0D240](this);
}

uint64_t ACFURestore::isPostSealing(ACFURestore *this)
{
  return MEMORY[0x270F0D250](this);
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

uint64_t ACFURestore::getCurrentUpdateStep(ACFURestore *this)
{
  return MEMORY[0x270F0D2B0](this);
}

uint64_t ACFURestore::init(ACFURestore *this, const __CFDictionary *a2, const void *a3)
{
  return MEMORY[0x270F0D2B8](this, a2, a3);
}

uint64_t ACFURestore::isNeRDOS(ACFURestore *this)
{
  return MEMORY[0x270F0D2D0](this);
}

uint64_t ACFURestore::queryCmd(ACFURestore *this)
{
  return MEMORY[0x270F0D2E0](this);
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

uint64_t ACFUFTABFile::setBootNonce(ACFUFTABFile *this)
{
  return MEMORY[0x270F0D318](this);
}

uint64_t ACFUFTABFile::addNewFileToFTAB()
{
  return MEMORY[0x270F0D320]();
}

uint64_t ACFUFTABFile::create()
{
  return MEMORY[0x270F0D328]();
}

uint64_t ACFUFirmware::copyFWContainer(ACFUFirmware *this)
{
  return MEMORY[0x270F0D330](this);
}

uint64_t ACFURTKitROM::create()
{
  return MEMORY[0x270F0D350]();
}

uint64_t ACFUTransport::init()
{
  return MEMORY[0x270F0D358]();
}

void ACFUTransport::ACFUTransport(ACFUTransport *this)
{
}

uint64_t RTKitFirmware::saveFirmwareToPath(RTKitFirmware *this, const __CFURL *a2)
{
  return MEMORY[0x270F0D370](this, a2);
}

uint64_t RTKitFirmware::create()
{
  return MEMORY[0x270F0D380]();
}

{
  return MEMORY[0x270F0D3A0]();
}

uint64_t ACFUDiagnostics::create(ACFUDiagnostics *this, const __CFString *a2)
{
  return MEMORY[0x270F0D3C8](this, a2);
}

uint64_t ACFUDiagnostics::addItem()
{
  return MEMORY[0x270F0D3D8]();
}

uint64_t ACFUDiagnostics::perform(ACFUDiagnostics *this)
{
  return MEMORY[0x270F0D3E8](this);
}

void ACFUDiagnostics::~ACFUDiagnostics(ACFUDiagnostics *this)
{
}

uint64_t ACFURestoreHost::createRequest()
{
  return MEMORY[0x270F0D408]();
}

uint64_t ACFURestoreHost::copyDataFromFileDictionary()
{
  return MEMORY[0x270F0D410]();
}

uint64_t ACFURestoreHost::init(ACFURestoreHost *this, const __CFDictionary *a2, const __CFString *a3)
{
  return MEMORY[0x270F0D418](this, a2, a3);
}

void ACFURestoreHost::ACFURestoreHost(ACFURestoreHost *this)
{
}

uint64_t ACFUSynchronize::Syncher::wait()
{
  return MEMORY[0x270F0D438]();
}

uint64_t ACFUSynchronize::Syncher::notify()
{
  return MEMORY[0x270F0D440]();
}

uint64_t ACFUError::getCFError(ACFUError *this)
{
  return MEMORY[0x270F0D4D0](this);
}

uint64_t ACFUError::createAppendedDomain(ACFUError *this, const __CFString *a2)
{
  return MEMORY[0x270F0D4E8](this, a2);
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

uint64_t ACFUMachO::getMachoHeaderData(ACFUMachO *this)
{
  return MEMORY[0x270F0D528](this);
}

uint64_t ACFUFirmware::getManifest(ACFUFirmware *this)
{
  return MEMORY[0x270F0D530](this);
}

uint64_t ACFUFirmware::copyFWDataByTag(ACFUFirmware *this, const __CFString *a2)
{
  return MEMORY[0x270F0D540](this, a2);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::recursive_directory_iterator::__dereference(const std::__fs::filesystem::recursive_directory_iterator *this)
{
  return (const std::__fs::filesystem::directory_entry *)MEMORY[0x270F98280](this);
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

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::this_thread::sleep_for (const std::chrono::nanoseconds *__ns)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
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

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987D8]();
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

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::__fs::filesystem::recursive_directory_iterator *__cdecl std::__fs::filesystem::recursive_directory_iterator::__increment(std::__fs::filesystem::recursive_directory_iterator *this, std::error_code *__ec)
{
  return (std::__fs::filesystem::recursive_directory_iterator *)MEMORY[0x270F98B20](this, __ec);
}

std::__fs::filesystem::recursive_directory_iterator *__cdecl std::__fs::filesystem::recursive_directory_iterator::recursive_directory_iterator(std::__fs::filesystem::recursive_directory_iterator *this, const std::__fs::filesystem::path *__p, std::__fs::filesystem::directory_options __opt, std::error_code *__ec)
{
  return (std::__fs::filesystem::recursive_directory_iterator *)MEMORY[0x270F98B28](this, __p, __opt, __ec);
}

void std::mutex::~mutex(std::mutex *this)
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

void objc_release(id a1)
{
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}