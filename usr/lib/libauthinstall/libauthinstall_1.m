const char *SavageRestoreInfoLog(const char *a1, uint64_t a2, ...)
{
  const char *result;
  char __str[4096];
  uint64_t v4;
  va_list va;

  va_start(va, a2);
  result = (const char *)MEMORY[0x270FA5388](a1, a2);
  v4 = *MEMORY[0x263EF8340];
  if (logSinkFunc)
  {
    vsnprintf(__str, 0x1000uLL, result, va);
    return (const char *)logSinkFunc(logContext, __str);
  }
  return result;
}

CFTypeRef CreateFileData(const __CFDictionary *a1, const __CFString *a2, CFTypeRef *a3)
{
  CFTypeRef cf = 0;
  CFStringRef v6 = CFCopyDescription(a1);
  if (v6)
  {
    CFStringRef v7 = v6;
    CFIndex Length = CFStringGetLength(v6);
    CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    v10 = (char *)malloc(MaximumSizeForEncoding + 1);
    v12 = CFStringGetCString(v7, v10, MaximumSizeForEncoding, 0x8000100u) ? v10 : "No C string description available.";
    SavageRestoreInfoLog("%s [input]: Input Options - %s \n", v11, "CreateFileData", v12);
    CFRelease(v7);
    if (v10) {
      free(v10);
    }
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"BundleDataDict");
  if (Value)
  {
    CFDictionaryRef v15 = Value;
    SavageRestoreInfoLog("%s: Device side restoreInfo path \n", v14, "CreateFileData");
    v16 = CFDictionaryGetValue(v15, a2);
    CFTypeRef cf = SafeRetain(v16);
    if (cf)
    {
      CFDictionaryRef v17 = 0;
      CFDictionaryRef v18 = 0;
      CFDictionaryRef v19 = 0;
      CFTypeRef v20 = 0;
      CFTypeRef v21 = 0;
      CFStringRef v31 = CFCopyDescription(cf);
      if (!v31)
      {
        SavageRestoreInfoLog("%s [output]: %s \n", v32, "CreateFileData", "No C string description available.");
        goto LABEL_23;
      }
      CFStringRef v33 = v31;
      if (CFStringGetCString(v31, logString, 4096, 0)) {
        v35 = logString;
      }
      else {
        v35 = "No C string description available.";
      }
      SavageRestoreInfoLog("%s [output]: %s \n", v34, "CreateFileData", v35);
      CFErrorRef v36 = (CFErrorRef)v33;
      goto LABEL_22;
    }
    CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"CreateFileData: bundleDataDict missing expected tag", 0x13u, (uint64_t)a1, @"SavageErrorDomain");
    CFDictionaryRef v17 = 0;
    goto LABEL_36;
  }
  SavageRestoreInfoLog("%s: Host side restoreInfo path \n", v14, "CreateFileData");
  v22 = CFDictionaryGetValue(a1, @"BuildIdentity");
  CFDictionaryRef v23 = (const __CFDictionary *)SafeRetain(v22);
  CFDictionaryRef v17 = v23;
  if (!v23)
  {
    CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"CreateFileData: Missing kSavageOptionBuildIdentity", 0xAu, (uint64_t)a1, @"SavageErrorDomain");
LABEL_36:
    CFDictionaryRef v18 = 0;
    CFDictionaryRef v19 = 0;
LABEL_39:
    CFTypeRef v20 = 0;
    CFTypeRef v21 = 0;
    goto LABEL_43;
  }
  v24 = CFDictionaryGetValue(v23, a2);
  CFDictionaryRef v25 = (const __CFDictionary *)SafeRetain(v24);
  CFDictionaryRef v19 = v25;
  if (!v25)
  {
    CStringPtr = CFStringGetCStringPtr(a2, 0x600u);
    CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)CStringPtr, 0xAu, (uint64_t)a1, @"SavageErrorDomain");
    CFDictionaryRef v18 = 0;
    goto LABEL_39;
  }
  v26 = CFDictionaryGetValue(v25, @"Info");
  CFDictionaryRef v27 = (const __CFDictionary *)SafeRetain(v26);
  CFDictionaryRef v18 = v27;
  if (!v27)
  {
    CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"CreateFileData: Missing kSavageBuildIdentityInfoKey", 0xCu, (uint64_t)a1, @"SavageErrorDomain");
    goto LABEL_39;
  }
  v28 = CFDictionaryGetValue(v27, @"Path");
  CFTypeRef v21 = SafeRetain(v28);
  if (v21)
  {
    v29 = CFDictionaryGetValue(a1, @"BundlePath");
    CFTypeRef v20 = SafeRetain(v29);
    if (v20)
    {
      unsigned int v30 = AMSupportPlatformCopyURLWithAppendedComponent();
      v40 = "CreateFileData: Fail to run AMSupportPlatformCopyURLWithAppendedComponent with srcBundleURL";
    }
    else
    {
      v40 = "CreateFileData: Missing kSavageOptionSourceBundlePath";
      unsigned int v30 = 10;
    }
    CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)v40, v30, (uint64_t)a1, @"SavageErrorDomain");
  }
  else
  {
    CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"CreateFileData: Missing kSavageBuildIdentityPathKey", 0xCu, (uint64_t)a1, @"SavageErrorDomain");
    CFTypeRef v20 = 0;
  }
LABEL_43:
  if (a3 && CFErrorWithDomain)
  {
    *a3 = SafeRetain(CFErrorWithDomain);
    CFStringRef v41 = CFErrorCopyDescription(CFErrorWithDomain);
    if (v41)
    {
      CFStringRef v43 = v41;
      int CString = CFStringGetCString(v41, logString, 4096, 0);
      v46 = logString;
      if (!CString) {
        v46 = "No C string description available.";
      }
      SavageRestoreInfoLog("%s [error]: %s \n", v45, "CreateFileData", v46);
      CFRelease(v43);
    }
    else
    {
      SavageRestoreInfoLog("%s [error]: %s \n", v42, "CreateFileData", "No C string description available.");
    }
    goto LABEL_52;
  }
  if (CFErrorWithDomain)
  {
LABEL_52:
    CFErrorRef v36 = CFErrorWithDomain;
LABEL_22:
    CFRelease(v36);
  }
LABEL_23:
  if (v20) {
    CFRelease(v20);
  }
  if (v21) {
    CFRelease(v21);
  }
  if (v18) {
    CFRelease(v18);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v17) {
    CFRelease(v17);
  }
  return cf;
}

uint64_t CreateMeasurementDict(const __CFData *a1, CFTypeRef *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  *(void *)buffer = 0;
  uint64_t v17 = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  CFStringRef v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *(_OWORD *)md = 0u;
  long long v20 = 0u;
  v8 = CFDictionaryCreateMutable(0, 0, v5, v6);
  v9 = 0;
  if (v8) {
    BOOL v10 = Mutable == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    uint64_t v11 = 2;
    if (a1 && a2)
    {
      v22.location = 0;
      v22.length = 16;
      CFDataGetBytes(a1, v22, buffer);
      if (*(_DWORD *)&buffer[4])
      {
        v9 = (UInt8 *)calloc(*(unsigned int *)&buffer[4], 1uLL);
        if (v9)
        {
          v23.length = *(unsigned int *)&buffer[4];
          v23.location = 16;
          CFDataGetBytes(a1, v23, v9);
          CC_LONG v12 = *(_DWORD *)&buffer[4];
          if (!(*(_DWORD *)&buffer[4] >> 20))
          {
            CC_SHA256_Init(&c);
            CC_SHA256_Update(&c, v9, v12);
            CC_SHA256_Final(md, &c);
          }
          CFDataRef v13 = CFDataCreate(v4, md, 32);
          if (v13)
          {
            CFDataRef v14 = v13;
            CFDictionarySetValue(Mutable, @"Digest", v13);
            CFDictionarySetValue(v8, @"MeasurementDictPatch", Mutable);
            *a2 = SafeRetain(v8);
            CFRelease(v14);
            uint64_t v11 = 0;
          }
          else
          {
            uint64_t v11 = 8;
          }
        }
        else
        {
          uint64_t v11 = 3;
        }
      }
      else
      {
        v9 = 0;
        uint64_t v11 = 4;
      }
    }
    goto LABEL_13;
  }
  uint64_t v11 = 3;
  if (Mutable) {
LABEL_13:
  }
    CFRelease(Mutable);
  if (v8) {
    CFRelease(v8);
  }
  if (v9) {
    free(v9);
  }
  return v11;
}

void SavageCFDictionarySetInteger32(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  if (!v5) {
    SavageCFDictionarySetInteger32_cold_1();
  }
  CFNumberRef v6 = v5;
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v6);
}

uint64_t SavageCFStringToUInt32(const __CFString *a1, _DWORD *a2, int a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t result = CFStringGetCString(a1, buffer, 32, 0x600u);
  if (result)
  {
    *__error() = 0;
    *a2 = strtol(buffer, 0, a3);
    return *__error() == 0;
  }
  return result;
}

CFErrorRef createCFErrorWithDomain(uint64_t a1, unsigned int a2, uint64_t a3, const __CFString *a4)
{
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@: %s", a4, a1);
  if (!v8) {
    return 0;
  }
  v9 = v8;
  CFStringRef v10 = CFStringCreateWithFormat(v7, 0, @"%@: Input Options: %@", v8, a3);
  if (!v10)
  {
    CFErrorRef v13 = 0;
    goto LABEL_4;
  }
  CFStringRef v11 = v10;
  Mutable = CFDictionaryCreateMutable(v7, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263EFFC70], v9);
  CFErrorRef v13 = CFErrorCreate(v7, a4, a2, Mutable);
  CFRelease(v11);
  CFRelease(v9);
  v9 = Mutable;
  if (Mutable) {
LABEL_4:
  }
    CFRelease(v9);
  return v13;
}

uint64_t GetRelevantMeasurementTags(CFDictionaryRef theDict, __CFString **a2, __CFString **a3)
{
  uint64_t result = 2;
  if (theDict && a2 && a3)
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"Savage,ProductionMode");
    if (!Value) {
      return 17;
    }
    CFBooleanRef v8 = Value;
    CFTypeID v9 = CFGetTypeID(Value);
    if (v9 != CFBooleanGetTypeID()) {
      return 17;
    }
    int v10 = CFBooleanGetValue(v8);
    CFDataRef v11 = (const __CFData *)CFDictionaryGetValue(theDict, @"Savage,Revision");
    if (!v11) {
      return 17;
    }
    CFDataRef v12 = v11;
    CFTypeID v13 = CFGetTypeID(v11);
    if (v13 != CFDataGetTypeID()) {
      return 17;
    }
    BytePtr = CFDataGetBytePtr(v12);
    if (BytePtr)
    {
      unsigned int v15 = *BytePtr;
      int v16 = ((v15 & 0xF0) + 96) >> 4;
      if ((v16 - 8) < 2)
      {
        CFDictionaryRef v19 = &kSavageTagMeasurementB2ProdPatch;
        long long v20 = &kSavageTagMeasurementB2DevPatch;
LABEL_23:
        BOOL v22 = v10 == 0;
        if (!v10) {
          CFDictionaryRef v19 = v20;
        }
        *a2 = *v19;
        CFRange v23 = &kSavageTagMeasurementBFProdPatch;
        v24 = &kSavageTagMeasurementBFDevPatch;
LABEL_26:
        if (v22) {
          CFRange v23 = v24;
        }
        CFDictionaryRef v25 = *v23;
        goto LABEL_29;
      }
      if (!(((v15 & 0xF0) + 96) >> 4))
      {
        uint64_t v21 = &kSavageTagMeasurementBAProdPatch;
        BOOL v22 = v10 == 0;
        if (!v10) {
          uint64_t v21 = &kSavageTagMeasurementBADevPatch;
        }
        *a2 = *v21;
        CFRange v23 = &kSavageTagMeasurementBEProdPatch;
        v24 = &kSavageTagMeasurementBEDevPatch;
        goto LABEL_26;
      }
      if (v16 == 4)
      {
        uint64_t v17 = &kSavageTagMeasurementBEProdPatch;
        CFDictionaryRef v18 = &kSavageTagMeasurementBEDevPatch;
LABEL_19:
        if (!v10) {
          uint64_t v17 = v18;
        }
        CFDictionaryRef v25 = *v17;
        *a2 = v25;
LABEL_29:
        uint64_t result = 0;
        *a3 = v25;
        return result;
      }
      if (v15 >= 0xF0)
      {
        uint64_t v17 = &kSavageTagMeasurementBFProdPatch;
        CFDictionaryRef v18 = &kSavageTagMeasurementBFDevPatch;
        goto LABEL_19;
      }
    }
    CFDictionaryRef v19 = &kSavageTagMeasurementB0ProdPatch;
    long long v20 = &kSavageTagMeasurementB0DevPatch;
    goto LABEL_23;
  }
  return result;
}

uint64_t GetYonkersMeasurementTags(CFDictionaryRef theDict, CFTypeRef *a2, CFTypeRef *a3)
{
  int valuePtr = 0;
  uint64_t result = 2;
  if (theDict && a2)
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"Yonkers,ProductionMode");
    if (Value
      && (CFBooleanRef v8 = Value, v9 = CFGetTypeID(Value), v9 == CFBooleanGetTypeID())
      && (BOOL v10 = CFBooleanGetValue(v8) != 0,
          (CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"Yonkers,FabRevision")) != 0)
      && (CFNumberRef v12 = v11, v13 = CFGetTypeID(v11), v13 == CFNumberGetTypeID()))
    {
      CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
      return GetYonkersFabRevisionTags(valuePtr, v10, a2, a3);
    }
    else
    {
      return 17;
    }
  }
  return result;
}

uint64_t GetYonkersFabRevisionTags(int a1, int a2, CFTypeRef *a3, CFTypeRef *a4)
{
  int v8 = 0;
  uint64_t v9 = 0;
  while (dword_217B32C70[v9] != a1)
  {
    ++v9;
    v8 -= 2;
    if (v9 == 6)
    {
      CFStringRef v10 = 0;
      CFStringRef v11 = 0;
      uint64_t v12 = 2;
      goto LABEL_6;
    }
  }
  BOOL v13 = a2 != 0;
  uint64_t v14 = v13 | (8 * (v9 < 4));
  CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"Yonkers,SysTopPatch%X", (v13 - v8));
  CFStringRef v11 = CFStringCreateWithFormat(v15, 0, @"Yonkers,SysTopPatch%X", v14);
  uint64_t v12 = 0;
LABEL_6:
  uint64_t v16 = 0;
  uint64_t v17 = &dword_217B32C88;
  while (1)
  {
    int v18 = *v17++;
    if (v18 == a1) {
      break;
    }
    v16 -= 2;
    if (v16 == -16)
    {
      if (!a3) {
        goto LABEL_17;
      }
      goto LABEL_15;
    }
  }
  BOOL v19 = a2 != 0;
  if ((v19 - v16) < 8) {
    int v20 = 8;
  }
  else {
    int v20 = -8;
  }
  uint64_t v21 = (v20 | v19) - v16;
  CFAllocatorRef v22 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"Yonkers,SysTopPatch%X", v19 - v16);
  CFStringRef v11 = CFStringCreateWithFormat(v22, 0, @"Yonkers,SysTopPatch%X", v21);
  uint64_t v12 = 0;
  if (!a3) {
    goto LABEL_17;
  }
LABEL_15:
  if (v10) {
    *a3 = CFRetain(v10);
  }
LABEL_17:
  if (a4 && v11) {
    *a4 = CFRetain(v11);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v11) {
    CFRelease(v11);
  }
  return v12;
}

void SavageCFDictionarySetInteger32_cold_1()
{
  __assert_rtn("SavageCFDictionarySetInteger32", "SavagePrivateHelper.cpp", 35, "num != NULL");
}

void VinylRestoreHost::create(VinylRestoreHost *this@<X0>, const __CFDictionary *a2@<X1>, VinylRestoreHost **a3@<X8>)
{
  LogInstance = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: VinylRestoreHost: %s\n", v8, v9, v10, v11, v12, (char)"VinylRestoreHost");
  uint64_t v14 = ACFULogging::getLogInstance(v13);
  ACFULogging::handleMessage((uint64_t)v14, 0, "%s::%s: VinylUpdater Version: %s\n", v15, v16, v17, v18, v19, (char)"VinylRestoreHost");
  int v20 = (VinylRestoreHost *)operator new(0xE8uLL);
  VinylRestoreHost::VinylRestoreHost(v20);
  *a3 = v20;
  if (((*(uint64_t (**)(VinylRestoreHost *, VinylRestoreHost *, const __CFDictionary *))(*(void *)v20 + 32))(v20, this, a2) & 1) == 0)
  {
    *a3 = 0;
    uint64_t v21 = (ACFULogging *)(*(uint64_t (**)(VinylRestoreHost *))(*(void *)v20 + 24))(v20);
    CFAllocatorRef v22 = ACFULogging::getLogInstance(v21);
    ACFULogging::handleMessage((uint64_t)v22, 4u, "%s::%s: leaving: VinylRestoreHost: %s\n", v23, v24, v25, v26, v27, (char)"VinylRestoreHost");
  }
}

void sub_217B03DF8(_Unwind_Exception *exception_object)
{
  void *v1 = 0;
  _Unwind_Resume(exception_object);
}

ACFULogging *VinylRestoreHost::createRequest(ACFULogging *a1, const __CFData *a2)
{
  v54 = 0;
  CFDictionaryRef v55 = 0;
  CFErrorRef error = 0;
  LogInstance = ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 0, "%s::%s: entering: %s\n", v5, v6, v7, v8, v9, (char)"VinylRestoreHost");
  uint64_t v10 = (ACFULogging *)CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, 0, 0, &error);
  uint64_t v11 = v54;
  v54 = v10;
  __p[0] = v11;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
  if (v54) {
    uint64_t v12 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  }
  else {
    uint64_t v12 = 0;
  }
  if (!v12)
  {
    uint64_t v32 = ACFULogging::getLogInstance(v54);
    std::string::basic_string[abi:ne180100]<0>(&v49, "VinylRestoreHost");
    CFStringRef v33 = std::string::append(&v49, "::");
    long long v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
    v50.__r_.__value_.__r.__words[2] = v33->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v50.__r_.__value_.__l.__data_ = v34;
    v33->__r_.__value_.__l.__size_ = 0;
    v33->__r_.__value_.__r.__words[2] = 0;
    v33->__r_.__value_.__r.__words[0] = 0;
    v35 = std::string::append(&v50, "createRequest");
    long long v36 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
    std::string::size_type v52 = v35->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v36;
    v35->__r_.__value_.__l.__size_ = 0;
    v35->__r_.__value_.__r.__words[2] = 0;
    v35->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v32, (uint64_t *)__p, 2, (uint64_t)"Failed to create propertylist from data, error: ", (uint64_t)error);
LABEL_20:
    if (SHIBYTE(v52) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v50.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v49.__r_.__value_.__l.__data_);
    }
    goto LABEL_29;
  }
  CFTypeID v13 = CFGetTypeID(v54);
  TypeID = (ACFULogging *)CFDictionaryGetTypeID();
  if ((ACFULogging *)v13 != TypeID)
  {
    v37 = ACFULogging::getLogInstance(TypeID);
    std::string::basic_string[abi:ne180100]<0>(&v49, "VinylRestoreHost");
    v38 = std::string::append(&v49, "::");
    long long v39 = *(_OWORD *)&v38->__r_.__value_.__l.__data_;
    v50.__r_.__value_.__r.__words[2] = v38->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v50.__r_.__value_.__l.__data_ = v39;
    v38->__r_.__value_.__l.__size_ = 0;
    v38->__r_.__value_.__r.__words[2] = 0;
    v38->__r_.__value_.__r.__words[0] = 0;
    v40 = std::string::append(&v50, "createRequest");
    long long v41 = *(_OWORD *)&v40->__r_.__value_.__l.__data_;
    std::string::size_type v52 = v40->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v41;
    v40->__r_.__value_.__l.__size_ = 0;
    v40->__r_.__value_.__r.__words[2] = 0;
    v40->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v37, (uint64_t *)__p, 2, (uint64_t)"Deserialized plist data is not a dictionary firmwarePlist: ", (uint64_t)v54);
    goto LABEL_20;
  }
  v50.__r_.__value_.__r.__words[0] = (std::string::size_type)v54;
  ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(__p, (CFTypeRef *)&v50.__r_.__value_.__l.__data_);
  CFDictionaryRef v15 = v55;
  CFDictionaryRef v55 = (const __CFDictionary *)__p[0];
  __p[0] = v15;
  uint64_t v16 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
  if (v55) {
    uint64_t v17 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    uint64_t v17 = 0;
  }
  if (!v17)
  {
    uint64_t v42 = ACFULogging::getLogInstance((ACFULogging *)v16);
    v48 = "%s::%s: Failed fo retain firmwareDict\n";
LABEL_28:
    ACFULogging::handleMessage((uint64_t)v42, 2u, v48, v43, v44, v45, v46, v47, (char)"VinylRestoreHost");
LABEL_29:
    uint64_t v24 = 0;
    goto LABEL_17;
  }
  uint64_t v18 = ACFULogging::getLogInstance((ACFULogging *)v16);
  std::string::basic_string[abi:ne180100]<0>(&v49, "VinylRestoreHost");
  uint64_t v19 = std::string::append(&v49, "::");
  long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  v50.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v50.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  uint64_t v21 = std::string::append(&v50, "createRequest");
  long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  std::string::size_type v52 = v21->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v18, (uint64_t *)__p, 0, (uint64_t)"firmwareDict: ", (uint64_t)v55);
  if (SHIBYTE(v52) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v50.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v49.__r_.__value_.__l.__data_);
  }
  RequestDict = VinylRestoreHost::createRequestDict((CFDictionaryRef *)a1, v55);
  uint64_t v24 = RequestDict;
  if (!RequestDict)
  {
    uint64_t v42 = ACFULogging::getLogInstance(0);
    v48 = "%s::%s: failed to create output request dictionary\n";
    goto LABEL_28;
  }
LABEL_17:
  uint64_t v25 = ACFULogging::getLogInstance(RequestDict);
  ACFULogging::handleMessage((uint64_t)v25, 4u, "%s::%s: leaving: %s\n", v26, v27, v28, v29, v30, (char)"VinylRestoreHost");
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v54);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v55);
  return v24;
}

void sub_217B041D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
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
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v30 - 48));
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v30 - 40));
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get(uint64_t a1)
{
  return *(void *)a1;
}

CFMutableDictionaryRef VinylRestoreHost::createRequestDict(CFDictionaryRef *this, const __CFDictionary *a2)
{
  LogInstance = ACFULogging::getLogInstance((ACFULogging *)this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: VinylRestoreHost: %s\n", v5, v6, v7, v8, v9, (char)"VinylRestoreHost");
  v127 = 0;
  v128 = 0;
  v125 = 0;
  v126 = 0;
  uint64_t v11 = ACFULogging::getLogInstance(v10);
  ACFULogging::handleMessage((uint64_t)v11, 4u, "%s::%s: VinylRestoreHost::createRequestDict\n", v12, v13, v14, v15, v16, (char)"VinylRestoreHost");
  uint64_t v18 = ACFULogging::getLogInstance(v17);
  std::string::basic_string[abi:ne180100]<0>(&v121, "VinylRestoreHost");
  uint64_t v19 = std::string::append(&v121, "::");
  long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  v122.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v122.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  uint64_t v21 = std::string::append(&v122, "createRequestDict");
  long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  std::string::size_type v124 = v21->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v18, (uint64_t *)__p, 4, (uint64_t)"firmwareInfoDict: ", (uint64_t)a2);
  if (SHIBYTE(v124) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v122.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v121.__r_.__value_.__l.__data_);
  }
  CFBooleanRef Value = (VinylFirmware *)CFDictionaryGetValue(a2, @"eUICC,Im4pGold");
  uint64_t v24 = (ACFULogging *)CFDictionaryGetValue(a2, @"eUICC,Im4pMain");
  if (!Value || (uint64_t v25 = v24) == 0)
  {
    v108 = ACFULogging::getLogInstance(v24);
    v114 = "%s::%s: failed to get im4p values\n";
    goto LABEL_90;
  }
  VinylFirmware::generateMeasurement(Value, (CFDataRef *)&v122);
  __p[0] = v128;
  v128 = (void *)v122.__r_.__value_.__r.__words[0];
  v122.__r_.__value_.__r.__words[0] = 0;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v122.__r_.__value_.__l.__data_);
  VinylFirmware::generateMeasurement(v25, (CFDataRef *)&v122);
  __p[0] = v127;
  v127 = (void *)v122.__r_.__value_.__r.__words[0];
  v122.__r_.__value_.__r.__words[0] = 0;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
  uint64_t v26 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v122.__r_.__value_.__l.__data_);
  if (v128) {
    uint64_t v27 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  }
  else {
    uint64_t v27 = 0;
  }
  if (!v27
    || (v127
      ? (uint64_t v28 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get)
      : (uint64_t v28 = 0),
        !v28))
  {
    v108 = ACFULogging::getLogInstance((ACFULogging *)v26);
    v114 = "%s::%s: failed to get measurements\n";
LABEL_90:
    ACFULogging::handleMessage((uint64_t)v108, 2u, v114, v109, v110, v111, v112, v113, (char)"VinylRestoreHost");
LABEL_97:
    CFMutableDictionaryRef Mutable = 0;
    goto LABEL_78;
  }
  CFAllocatorRef v29 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFMutableDictionaryRef v31 = CFDictionaryCreateMutable(v29, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v32 = v126;
  v126 = v31;
  __p[0] = v32;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
  CFMutableDictionaryRef v33 = CFDictionaryCreateMutable(v29, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  long long v34 = v125;
  v125 = v33;
  __p[0] = v34;
  v35 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
  if (!Mutable
    || (v126
      ? (long long v36 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get)
      : (long long v36 = 0),
        !v36
     || (v125
       ? (v37 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get)
       : (v37 = 0),
         !v37)))
  {
    v101 = ACFULogging::getLogInstance((ACFULogging *)v35);
    v107 = "%s::%s: failed to get create request Dictionary\n";
LABEL_94:
    ACFULogging::handleMessage((uint64_t)v101, 2u, v107, v102, v103, v104, v105, v106, (char)"VinylRestoreHost");
LABEL_95:
    if (!Mutable) {
      goto LABEL_78;
    }
    goto LABEL_96;
  }
  CFDictionaryRef v38 = (const __CFDictionary *)CFDictionaryGetValue(this[2], @"DeviceInfo");
  if (!v38)
  {
    v115 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v115, 2u, "%s::%s: failed to get deviceInfoDict\n", v116, v117, v118, v119, v120, (char)"VinylRestoreHost");
LABEL_96:
    CFRelease(Mutable);
    goto LABEL_97;
  }
  long long v39 = (const void **)this[8];
  v40 = (const void **)this[9];
  while (v39 != v40)
  {
    long long v41 = *v39;
    if (!CFDictionaryGetValue(v38, *v39))
    {
      v91 = ACFULogging::getLogInstance(0);
      std::string::basic_string[abi:ne180100]<0>(&v121, "VinylRestoreHost");
      v92 = std::string::append(&v121, "::");
      long long v93 = *(_OWORD *)&v92->__r_.__value_.__l.__data_;
      v122.__r_.__value_.__r.__words[2] = v92->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v122.__r_.__value_.__l.__data_ = v93;
      v92->__r_.__value_.__l.__size_ = 0;
      v92->__r_.__value_.__r.__words[2] = 0;
      v92->__r_.__value_.__r.__words[0] = 0;
      v94 = std::string::append(&v122, "createRequestDict");
      long long v95 = *(_OWORD *)&v94->__r_.__value_.__l.__data_;
      std::string::size_type v124 = v94->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v95;
      v94->__r_.__value_.__l.__size_ = 0;
      v94->__r_.__value_.__r.__words[2] = 0;
      v94->__r_.__value_.__r.__words[0] = 0;
      ACFULogging::handleMessageCFType((uint64_t)v91, (uint64_t *)__p, 2, (uint64_t)"Failed to find deviceTag: ", (uint64_t)v41);
LABEL_81:
      if (SHIBYTE(v124) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v122.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v121.__r_.__value_.__l.__data_);
      }
      goto LABEL_95;
    }
    uint64_t v42 = CFDictionaryGetValue(v38, v41);
    CFDictionarySetValue(Mutable, v41, v42);
    ++v39;
  }
  uint64_t v43 = (const void **)this[11];
  uint64_t v44 = (const void **)this[12];
  while (v43 != v44)
  {
    uint64_t v45 = *v43;
    if (!CFDictionaryGetValue(v38, *v43))
    {
      v96 = ACFULogging::getLogInstance(0);
      std::string::basic_string[abi:ne180100]<0>(&v121, "VinylRestoreHost");
      v97 = std::string::append(&v121, "::");
      long long v98 = *(_OWORD *)&v97->__r_.__value_.__l.__data_;
      v122.__r_.__value_.__r.__words[2] = v97->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v122.__r_.__value_.__l.__data_ = v98;
      v97->__r_.__value_.__l.__size_ = 0;
      v97->__r_.__value_.__r.__words[2] = 0;
      v97->__r_.__value_.__r.__words[0] = 0;
      v99 = std::string::append(&v122, "createRequestDict");
      long long v100 = *(_OWORD *)&v99->__r_.__value_.__l.__data_;
      std::string::size_type v124 = v99->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v100;
      v99->__r_.__value_.__l.__size_ = 0;
      v99->__r_.__value_.__r.__words[2] = 0;
      v99->__r_.__value_.__r.__words[0] = 0;
      ACFULogging::handleMessageCFType((uint64_t)v96, (uint64_t *)__p, 2, (uint64_t)"Failed to find requestTag: ", (uint64_t)v45);
      goto LABEL_81;
    }
    uint64_t v46 = CFDictionaryGetValue(v38, v45);
    CFDictionarySetValue(Mutable, v45, v46);
    ++v43;
  }
  CFDictionaryRef v47 = (const __CFDictionary *)CFDictionaryGetValue(Mutable, @"eUICC,Gold");
  v48 = (ACFULogging *)CFDictionaryGetValue(v47, @"Nonce");
  std::string v49 = v48;
  if (!v48)
  {
    v101 = ACFULogging::getLogInstance(0);
    v107 = "%s::%s: failed to get goldNonce\n";
    goto LABEL_94;
  }
  std::string v50 = ACFULogging::getLogInstance(v48);
  std::string::basic_string[abi:ne180100]<0>(&v121, "VinylRestoreHost");
  v51 = std::string::append(&v121, "::");
  long long v52 = *(_OWORD *)&v51->__r_.__value_.__l.__data_;
  v122.__r_.__value_.__r.__words[2] = v51->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v122.__r_.__value_.__l.__data_ = v52;
  v51->__r_.__value_.__l.__size_ = 0;
  v51->__r_.__value_.__r.__words[2] = 0;
  v51->__r_.__value_.__r.__words[0] = 0;
  v53 = std::string::append(&v122, "createRequestDict");
  long long v54 = *(_OWORD *)&v53->__r_.__value_.__l.__data_;
  std::string::size_type v124 = v53->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v54;
  v53->__r_.__value_.__l.__size_ = 0;
  v53->__r_.__value_.__r.__words[2] = 0;
  v53->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v50, (uint64_t *)__p, 4, (uint64_t)"goldNonce: ", (uint64_t)v49);
  if (SHIBYTE(v124) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v122.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v121.__r_.__value_.__l.__data_);
  }
  CFDictionaryRef v55 = (const __CFDictionary *)CFDictionaryGetValue(Mutable, @"eUICC,Main");
  v56 = (ACFULogging *)CFDictionaryGetValue(v55, @"Nonce");
  v57 = v56;
  if (!v56)
  {
    v101 = ACFULogging::getLogInstance(0);
    v107 = "%s::%s: failed to get mainNonce\n";
    goto LABEL_94;
  }
  v58 = ACFULogging::getLogInstance(v56);
  std::string::basic_string[abi:ne180100]<0>(&v121, "VinylRestoreHost");
  v59 = std::string::append(&v121, "::");
  long long v60 = *(_OWORD *)&v59->__r_.__value_.__l.__data_;
  v122.__r_.__value_.__r.__words[2] = v59->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v122.__r_.__value_.__l.__data_ = v60;
  v59->__r_.__value_.__l.__size_ = 0;
  v59->__r_.__value_.__r.__words[2] = 0;
  v59->__r_.__value_.__r.__words[0] = 0;
  v61 = std::string::append(&v122, "createRequestDict");
  long long v62 = *(_OWORD *)&v61->__r_.__value_.__l.__data_;
  std::string::size_type v124 = v61->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v62;
  v61->__r_.__value_.__l.__size_ = 0;
  v61->__r_.__value_.__r.__words[2] = 0;
  v61->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v58, (uint64_t *)__p, 4, (uint64_t)"mainNonce: ", (uint64_t)v57);
  if (SHIBYTE(v124) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v122.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v121.__r_.__value_.__l.__data_);
  }
  if (v126) {
    v63 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  }
  else {
    v63 = 0;
  }
  if (v63)
  {
    CFDictionarySetValue(v126, @"Digest", v128);
    CFDictionarySetValue(v126, @"Nonce", v49);
    v65 = ACFULogging::getLogInstance(v64);
    std::string::basic_string[abi:ne180100]<0>(&v121, "VinylRestoreHost");
    v66 = std::string::append(&v121, "::");
    long long v67 = *(_OWORD *)&v66->__r_.__value_.__l.__data_;
    v122.__r_.__value_.__r.__words[2] = v66->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v122.__r_.__value_.__l.__data_ = v67;
    v66->__r_.__value_.__l.__size_ = 0;
    v66->__r_.__value_.__r.__words[2] = 0;
    v66->__r_.__value_.__r.__words[0] = 0;
    v68 = std::string::append(&v122, "createRequestDict");
    long long v69 = *(_OWORD *)&v68->__r_.__value_.__l.__data_;
    std::string::size_type v124 = v68->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v69;
    v68->__r_.__value_.__l.__size_ = 0;
    v68->__r_.__value_.__r.__words[2] = 0;
    v68->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v65, (uint64_t *)__p, 4, (uint64_t)"goldDict: ", (uint64_t)v126);
    if (SHIBYTE(v124) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v122.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v121.__r_.__value_.__l.__data_);
    }
    CFDictionaryReplaceValue(Mutable, @"eUICC,Gold", v126);
  }
  v70 = v125;
  if (v125) {
    v71 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  }
  else {
    v71 = 0;
  }
  if (v71)
  {
    CFDictionarySetValue(v125, @"Digest", v127);
    CFDictionarySetValue(v125, @"Nonce", v57);
    v73 = ACFULogging::getLogInstance(v72);
    std::string::basic_string[abi:ne180100]<0>(&v121, "VinylRestoreHost");
    v74 = std::string::append(&v121, "::");
    long long v75 = *(_OWORD *)&v74->__r_.__value_.__l.__data_;
    v122.__r_.__value_.__r.__words[2] = v74->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v122.__r_.__value_.__l.__data_ = v75;
    v74->__r_.__value_.__l.__size_ = 0;
    v74->__r_.__value_.__r.__words[2] = 0;
    v74->__r_.__value_.__r.__words[0] = 0;
    v76 = std::string::append(&v122, "createRequestDict");
    long long v77 = *(_OWORD *)&v76->__r_.__value_.__l.__data_;
    std::string::size_type v124 = v76->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v77;
    v76->__r_.__value_.__l.__size_ = 0;
    v76->__r_.__value_.__r.__words[2] = 0;
    v76->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v73, (uint64_t *)__p, 4, (uint64_t)"mainDict: ", (uint64_t)v125);
    if (SHIBYTE(v124) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v122.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v121.__r_.__value_.__l.__data_);
    }
    CFDictionaryReplaceValue(Mutable, @"eUICC,Main", v125);
  }
  v78 = ACFULogging::getLogInstance(v70);
  std::string::basic_string[abi:ne180100]<0>(&v121, "VinylRestoreHost");
  v79 = std::string::append(&v121, "::");
  long long v80 = *(_OWORD *)&v79->__r_.__value_.__l.__data_;
  v122.__r_.__value_.__r.__words[2] = v79->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v122.__r_.__value_.__l.__data_ = v80;
  v79->__r_.__value_.__l.__size_ = 0;
  v79->__r_.__value_.__r.__words[2] = 0;
  v79->__r_.__value_.__r.__words[0] = 0;
  v81 = std::string::append(&v122, "createRequestDict");
  long long v82 = *(_OWORD *)&v81->__r_.__value_.__l.__data_;
  std::string::size_type v124 = v81->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v82;
  v81->__r_.__value_.__l.__size_ = 0;
  v81->__r_.__value_.__r.__words[2] = 0;
  v81->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v78, (uint64_t *)__p, 4, (uint64_t)"requestDict after digest: ", (uint64_t)Mutable);
  if (SHIBYTE(v124) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v122.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v121.__r_.__value_.__l.__data_);
  }
  v84 = ACFULogging::getLogInstance(v83);
  ACFULogging::handleMessage((uint64_t)v84, 4u, "%s::%s: leaving: VinylRestoreHost: %s\n", v85, v86, v87, v88, v89, (char)"VinylRestoreHost");
LABEL_78:
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v125);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v126);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v127);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v128);
  return Mutable;
}

void sub_217B04C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
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
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v30 - 96));
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v30 - 88));
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v30 - 80));
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v30 - 72));
  _Unwind_Resume(a1);
}

void VinylRestoreHost::~VinylRestoreHost(VinylRestoreHost *this)
{
  *(void *)this = &unk_26C808EF0;
  LogInstance = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: VinylRestoreHost: destructor\n", v3, v4, v5, v6, v7, (char)"VinylRestoreHost");

  ACFURestoreHost::~ACFURestoreHost(this);
}

{
  void *v1;
  uint64_t vars8;

  VinylRestoreHost::~VinylRestoreHost(this);

  operator delete(v1);
}

void VinylRestoreHost::VinylRestoreHost(VinylRestoreHost *this)
{
  ACFURestoreHost::ACFURestoreHost(this);
  *(void *)v1 = &unk_26C808EF0;
  LogInstance = ACFULogging::getLogInstance(v1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: VinylRestoreHost: constructor\n", v3, v4, v5, v6, v7, (char)"VinylRestoreHost");
}

void sub_217B04EB8(_Unwind_Exception *a1)
{
  ACFURestoreHost::~ACFURestoreHost(v1);
  _Unwind_Resume(a1);
}

ACFULogging *VinylRestoreHost::init(VinylRestoreHost *this, const __CFDictionary *a2, const __CFString *a3)
{
  v29[1] = *MEMORY[0x263EF8340];
  LogInstance = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: VinylRestoreHost: %s\n", v7, v8, v9, v10, v11, (char)"VinylRestoreHost");
  __srCC_SHA256_CTX c = xmmword_2642BBBD0;
  *(void *)&long long v26 = @"eUICC,Main";
  std::vector<__CFString const*>::__assign_with_size[abi:ne180100]<__CFString const* const*,__CFString const* const*>((char *)this + 40, (char *)&__src, (uint64_t)&v26 + 8, 3uLL);
  __srCC_SHA256_CTX c = xmmword_2642BBBE8;
  long long v26 = *(_OWORD *)&off_2642BBBF8;
  long long v27 = xmmword_2642BBC08;
  std::vector<__CFString const*>::__assign_with_size[abi:ne180100]<__CFString const* const*,__CFString const* const*>((char *)this + 64, (char *)&__src, (uint64_t)v28, 6uLL);
  *(void *)&__srCC_SHA256_CTX c = @"@eUICC,Ticket";
  std::vector<__CFString const*>::__assign_with_size[abi:ne180100]<__CFString const* const*,__CFString const* const*>((char *)this + 88, (char *)&__src, (uint64_t)&__src + 8, 1uLL);
  *(void *)&__srCC_SHA256_CTX c = @"eUICC,Ticket";
  std::vector<__CFString const*>::__assign_with_size[abi:ne180100]<__CFString const* const*,__CFString const* const*>((char *)this + 112, (char *)&__src, (uint64_t)&__src + 8, 1uLL);
  CFTypeID TypeID = CFNumberGetTypeID();
  *(void *)&__srCC_SHA256_CTX c = @"eUICC,ChipID";
  *((void *)&__src + 1) = TypeID;
  CFTypeID v13 = CFDataGetTypeID();
  *(void *)&long long v26 = @"eUICC,EID";
  *((void *)&v26 + 1) = v13;
  CFTypeID v14 = CFDataGetTypeID();
  *(void *)&long long v27 = @"eUICC,GoldNonce";
  *((void *)&v27 + 1) = v14;
  CFTypeID v15 = CFDataGetTypeID();
  v28[0] = @"eUICC,MainNonce";
  v28[1] = v15;
  CFTypeID v16 = CFDataGetTypeID();
  v28[2] = @"eUICC,RootKeyIdentifier";
  v28[3] = v16;
  std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__assign_unique<std::pair<__CFString const* const,unsigned long> const*>((uint64_t **)this + 20, (unint64_t *)&__src, v29);
  *(void *)&__srCC_SHA256_CTX c = @"eUICC,Gold";
  WORD4(__src) = 0;
  *(void *)&long long v26 = @"eUICC,Main";
  WORD4(v26) = 0;
  std::__tree<std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>>>::__assign_unique<std::pair<__CFString const* const,ACFURestoreHost::DemoteConfig> const*>((uint64_t **)this + 25, (unint64_t *)&__src, (unint64_t *)&v27);
  __srCC_SHA256_CTX c = xmmword_2642BBC18;
  long long v26 = *(_OWORD *)&off_2642BBC28;
  std::vector<ACFURestoreHost::FileList>::__assign_with_size[abi:ne180100]<ACFURestoreHost::FileList const*,ACFURestoreHost::FileList const*>((char *)this + 136, (char *)&__src, (uint64_t)&v27, 2uLL);
  *((void *)this + 28) = @"Vinyl";
  uint64_t v17 = (ACFULogging *)ACFURestoreHost::init((const void **)this, a2, a3);
  uint64_t v18 = ACFULogging::getLogInstance(v17);
  ACFULogging::handleMessage((uint64_t)v18, 4u, "%s::%s: leaving: VinylRestoreHost: %s\n", v19, v20, v21, v22, v23, (char)"VinylRestoreHost");
  return v17;
}

uint64_t ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get(uint64_t a1)
{
  return *(void *)a1;
}

ACFULogging *VinylRestoreHost::copyFirmwareUpdater(ACFULogging **a1, const __CFDictionary *a2, int a3)
{
  LogInstance = ACFULogging::getLogInstance((ACFULogging *)a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: VinylRestoreHost: %s\n", v7, v8, v9, v10, v11, (char)"VinylRestoreHost");
  CFErrorRef error = 0;
  if (!a2)
  {
    v135 = ACFULogging::getLogInstance(v12);
    ACFULogging::handleMessage((uint64_t)v135, 2u, "%s::%s: firmwareFileDictionary is null\n", v136, v137, v138, v139, v140, (char)"VinylRestoreHost");
    return 0;
  }
  CFBooleanRef Value = (ACFULogging *)CFDictionaryGetValue(a1[2], @"DeviceInfo");
  if (!Value
    || (CFDictionaryRef v14 = Value,
        CFTypeID v15 = CFGetTypeID(Value),
        CFBooleanRef Value = (ACFULogging *)CFDictionaryGetTypeID(),
        (ACFULogging *)v15 != Value))
  {
    uint64_t v105 = ACFULogging::getLogInstance(Value);
    ACFULogging::handleMessage((uint64_t)v105, 2u, "%s::%s: Deviceinfo is not a dictionary\n", v106, v107, v108, v109, v110, (char)"VinylRestoreHost");
    return 0;
  }
  CFTypeID v16 = ACFULogging::getLogInstance(Value);
  std::string::basic_string[abi:ne180100]<0>(&v157, "VinylRestoreHost");
  uint64_t v17 = std::string::append(&v157, "::");
  long long v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
  v158.__r_.__value_.__r.__words[2] = v17->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v158.__r_.__value_.__l.__data_ = v18;
  v17->__r_.__value_.__l.__size_ = 0;
  v17->__r_.__value_.__r.__words[2] = 0;
  v17->__r_.__value_.__r.__words[0] = 0;
  uint64_t v19 = std::string::append(&v158, "copyFirmwareUpdater");
  long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  std::string::size_type v160 = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v16, (uint64_t *)__p, 4, (uint64_t)"VinylRestore::copyFirmwareUpdater kUpdaterDeviceInfo value : ", (uint64_t)v14);
  if (SHIBYTE(v160) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v158.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v157.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v157.__r_.__value_.__l.__data_);
  }
  CFTypeID TypeID = (ACFULogging *)CFDictionaryGetValue(v14, @"eUICC,RootKeyIdentifier");
  if (!TypeID
    || (v22 = TypeID, CFTypeID v23 = CFGetTypeID(TypeID), TypeID = (ACFULogging *)CFDataGetTypeID(), (ACFULogging *)v23 != TypeID))
  {
    uint64_t v111 = ACFULogging::getLogInstance(TypeID);
    ACFULogging::handleMessage((uint64_t)v111, 2u, "%s::%s: certIdentifier is not a CFData type\n", v112, v113, v114, v115, v116, (char)"VinylRestoreHost");
    return 0;
  }
  uint64_t v24 = ACFULogging::getLogInstance(TypeID);
  std::string::basic_string[abi:ne180100]<0>(&v157, "VinylRestoreHost");
  uint64_t v25 = std::string::append(&v157, "::");
  long long v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
  v158.__r_.__value_.__r.__words[2] = v25->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v158.__r_.__value_.__l.__data_ = v26;
  v25->__r_.__value_.__l.__size_ = 0;
  v25->__r_.__value_.__r.__words[2] = 0;
  v25->__r_.__value_.__r.__words[0] = 0;
  long long v27 = std::string::append(&v158, "copyFirmwareUpdater");
  long long v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
  std::string::size_type v160 = v27->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v28;
  v27->__r_.__value_.__l.__size_ = 0;
  v27->__r_.__value_.__r.__words[2] = 0;
  v27->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v24, (uint64_t *)__p, 4, (uint64_t)"VinylTransport::getTicket  certIdentifier: ", (uint64_t)v22);
  if (SHIBYTE(v160) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v158.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v157.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v157.__r_.__value_.__l.__data_);
  }
  CFAllocatorRef v29 = (ACFULogging *)CFDictionaryGetValue(v14, @"eUICC,FirmwareLoaderVersion");
  if (!v29 || (CFDataRef v30 = v29, v31 = CFGetTypeID(v29), v29 = (ACFULogging *)CFDataGetTypeID(), (ACFULogging *)v31 != v29))
  {
    uint64_t v117 = ACFULogging::getLogInstance(v29);
    ACFULogging::handleMessage((uint64_t)v117, 2u, "%s::%s: firmwareLoaderVersion is not a CFData type\n", v118, v119, v120, v121, v122, (char)"VinylRestoreHost");
    return 0;
  }
  uint64_t v32 = ACFULogging::getLogInstance(v29);
  std::string::basic_string[abi:ne180100]<0>(&v157, "VinylRestoreHost");
  CFMutableDictionaryRef v33 = std::string::append(&v157, "::");
  long long v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
  v158.__r_.__value_.__r.__words[2] = v33->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v158.__r_.__value_.__l.__data_ = v34;
  v33->__r_.__value_.__l.__size_ = 0;
  v33->__r_.__value_.__r.__words[2] = 0;
  v33->__r_.__value_.__r.__words[0] = 0;
  v35 = std::string::append(&v158, "copyFirmwareUpdater");
  long long v36 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
  std::string::size_type v160 = v35->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v36;
  v35->__r_.__value_.__l.__size_ = 0;
  v35->__r_.__value_.__r.__words[2] = 0;
  v35->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v32, (uint64_t *)__p, 4, (uint64_t)"VinylTransport::getTicket  firmwareLoaderVersion: ", (uint64_t)v30);
  if (SHIBYTE(v160) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v158.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v157.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v157.__r_.__value_.__l.__data_);
  }
  v37 = (ACFULogging *)CFDictionaryGetValue(v14, @"eUICC,MainFwMac");
  if (!v37 || (v38 = v37, CFTypeID v39 = CFGetTypeID(v37), v37 = (ACFULogging *)CFDataGetTypeID(), (ACFULogging *)v39 != v37))
  {
    v123 = ACFULogging::getLogInstance(v37);
    ACFULogging::handleMessage((uint64_t)v123, 2u, "%s::%s: mainFwMac is not a CFData type\n", v124, v125, v126, v127, v128, (char)"VinylRestoreHost");
    return 0;
  }
  v40 = ACFULogging::getLogInstance(v37);
  std::string::basic_string[abi:ne180100]<0>(&v157, "VinylRestoreHost");
  long long v41 = std::string::append(&v157, "::");
  long long v42 = *(_OWORD *)&v41->__r_.__value_.__l.__data_;
  v158.__r_.__value_.__r.__words[2] = v41->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v158.__r_.__value_.__l.__data_ = v42;
  v41->__r_.__value_.__l.__size_ = 0;
  v41->__r_.__value_.__r.__words[2] = 0;
  v41->__r_.__value_.__r.__words[0] = 0;
  uint64_t v43 = std::string::append(&v158, "copyFirmwareUpdater");
  long long v44 = *(_OWORD *)&v43->__r_.__value_.__l.__data_;
  std::string::size_type v160 = v43->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v44;
  v43->__r_.__value_.__l.__size_ = 0;
  v43->__r_.__value_.__r.__words[2] = 0;
  v43->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v40, (uint64_t *)__p, 4, (uint64_t)"VinylTransport::getTicket  mainFwMac: ", (uint64_t)v38);
  if (SHIBYTE(v160) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v158.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v157.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v157.__r_.__value_.__l.__data_);
  }
  uint64_t v45 = (ACFULogging *)CFDictionaryGetValue(v14, @"eUICC,GoldFwMac");
  if (!v45 || (v46 = v45, v47 = CFGetTypeID(v45), uint64_t v45 = (ACFULogging *)CFDataGetTypeID(), (ACFULogging *)v47 != v45))
  {
    v129 = ACFULogging::getLogInstance(v45);
    ACFULogging::handleMessage((uint64_t)v129, 2u, "%s::%s: goldFwMac is not a CFData type\n", v130, v131, v132, v133, v134, (char)"VinylRestoreHost");
    return 0;
  }
  v48 = ACFULogging::getLogInstance(v45);
  std::string::basic_string[abi:ne180100]<0>(&v157, "VinylRestoreHost");
  std::string v49 = std::string::append(&v157, "::");
  long long v50 = *(_OWORD *)&v49->__r_.__value_.__l.__data_;
  v158.__r_.__value_.__r.__words[2] = v49->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v158.__r_.__value_.__l.__data_ = v50;
  v49->__r_.__value_.__l.__size_ = 0;
  v49->__r_.__value_.__r.__words[2] = 0;
  v49->__r_.__value_.__r.__words[0] = 0;
  v51 = std::string::append(&v158, "copyFirmwareUpdater");
  long long v52 = *(_OWORD *)&v51->__r_.__value_.__l.__data_;
  std::string::size_type v160 = v51->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v52;
  v51->__r_.__value_.__l.__size_ = 0;
  v51->__r_.__value_.__r.__words[2] = 0;
  v51->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v48, (uint64_t *)__p, 0, (uint64_t)"VinylTransport::getTicket  goldFwMac: ", (uint64_t)v46);
  if (SHIBYTE(v160) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v158.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v157.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v157.__r_.__value_.__l.__data_);
  }
  long long v54 = ACFULogging::getLogInstance(v53);
  std::string::basic_string[abi:ne180100]<0>(&v157, "VinylRestoreHost");
  CFDictionaryRef v55 = std::string::append(&v157, "::");
  long long v56 = *(_OWORD *)&v55->__r_.__value_.__l.__data_;
  v158.__r_.__value_.__r.__words[2] = v55->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v158.__r_.__value_.__l.__data_ = v56;
  v55->__r_.__value_.__l.__size_ = 0;
  v55->__r_.__value_.__r.__words[2] = 0;
  v55->__r_.__value_.__r.__words[0] = 0;
  v57 = std::string::append(&v158, "copyFirmwareUpdater");
  long long v58 = *(_OWORD *)&v57->__r_.__value_.__l.__data_;
  std::string::size_type v160 = v57->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v58;
  v57->__r_.__value_.__l.__size_ = 0;
  v57->__r_.__value_.__r.__words[2] = 0;
  v57->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v54, (uint64_t *)__p, 4, (uint64_t)"Firmware File Dictionary: ", (uint64_t)a2);
  if (SHIBYTE(v160) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v158.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v157.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v157.__r_.__value_.__l.__data_);
  }
  if (CFDictionaryContainsKey(a2, a1[1])) {
    v59 = a1[1];
  }
  else {
    v59 = (ACFULogging *)@"eUICC,Gold";
  }
  long long v60 = (ACFULogging *)ACFURestoreHost::copyDataFromFileDictionary(v59, a2, a3);
  v61 = ACFULogging::getLogInstance(v60);
  uint64_t v67 = (uint64_t)v61;
  if (!v60)
  {
    ACFULogging::handleMessage((uint64_t)v61, 2u, "%s::%s: failed to get fwZipData\n", v62, v63, v64, v65, v66, (char)"VinylRestoreHost");
    return v60;
  }
  std::string::basic_string[abi:ne180100]<0>(&v157, "VinylRestoreHost");
  v68 = std::string::append(&v157, "::");
  long long v69 = *(_OWORD *)&v68->__r_.__value_.__l.__data_;
  v158.__r_.__value_.__r.__words[2] = v68->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v158.__r_.__value_.__l.__data_ = v69;
  v68->__r_.__value_.__l.__size_ = 0;
  v68->__r_.__value_.__r.__words[2] = 0;
  v68->__r_.__value_.__r.__words[0] = 0;
  v70 = std::string::append(&v158, "copyFirmwareUpdater");
  long long v71 = *(_OWORD *)&v70->__r_.__value_.__l.__data_;
  std::string::size_type v160 = v70->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v71;
  v70->__r_.__value_.__l.__size_ = 0;
  v70->__r_.__value_.__r.__words[2] = 0;
  v70->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType(v67, (uint64_t *)__p, 4, (uint64_t)"fwData: ", (uint64_t)v60);
  if (SHIBYTE(v160) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v158.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v157.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v157.__r_.__value_.__l.__data_);
  }
  v72 = VinylGoldFirmwareCreate(v60, v22, v30, v46);
  v73 = VinylMainFirmwareCreate(v60, v22, v30, v38);
  v74 = v73;
  if (v72 && v73)
  {
    CFAllocatorRef v75 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (Mutable)
    {
      long long v77 = Mutable;
      Im4p = (const void *)VinylFirmware::getIm4p(v72);
      CFDictionarySetValue(v77, @"eUICC,Im4pGold", Im4p);
      FwData = (const void *)VinylFirmware::getFwData(v72);
      CFDictionarySetValue(v77, @"eUICC,Gold", FwData);
      if (VinylFirmware::getRecoveryFwData(v72))
      {
        RecoveryFwData = (const void *)VinylFirmware::getRecoveryFwData(v72);
        CFDictionarySetValue(v77, @"eUICC,GoldRecoveryFw", RecoveryFwData);
      }
      InfoPlistData = (const void *)VinylFirmware::getInfoPlistData(v72);
      CFDictionarySetValue(v77, @"eUICC,InfoPlistDataGold", InfoPlistData);
      ProfileData = (const void *)VinylFirmware::getProfileData(v72);
      CFDictionarySetValue(v77, @"eUICC,ProfileDataGold", ProfileData);
      v83 = (const void *)VinylFirmware::getIm4p(v74);
      CFDictionarySetValue(v77, @"eUICC,Im4pMain", v83);
      v84 = (const void *)VinylFirmware::getFwData(v74);
      CFDictionarySetValue(v77, @"eUICC,Main", v84);
      if (VinylFirmware::getRecoveryFwData(v74))
      {
        uint64_t v85 = (const void *)VinylFirmware::getRecoveryFwData(v74);
        CFDictionarySetValue(v77, @"eUICC,MainRecoveryFw", v85);
      }
      uint64_t v86 = (const void *)VinylFirmware::getInfoPlistData(v74);
      CFDictionarySetValue(v77, @"eUICC,InfoPlistDataMain", v86);
      uint64_t v87 = (const void *)VinylFirmware::getProfileData(v74);
      CFDictionarySetValue(v77, @"eUICC,ProfileDataMain", v87);
      uint64_t v88 = CFPropertyListCreateData(v75, v77, kCFPropertyListXMLFormat_v1_0, 0, &error);
      uint64_t v89 = ACFULogging::getLogInstance(v88);
      std::string::basic_string[abi:ne180100]<0>(&v157, "VinylRestoreHost");
      v90 = std::string::append(&v157, "::");
      long long v91 = *(_OWORD *)&v90->__r_.__value_.__l.__data_;
      v158.__r_.__value_.__r.__words[2] = v90->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v158.__r_.__value_.__l.__data_ = v91;
      v90->__r_.__value_.__l.__size_ = 0;
      v90->__r_.__value_.__r.__words[2] = 0;
      v90->__r_.__value_.__r.__words[0] = 0;
      v92 = std::string::append(&v158, "copyFirmwareUpdater");
      long long v93 = *(_OWORD *)&v92->__r_.__value_.__l.__data_;
      std::string::size_type v160 = v92->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v93;
      v92->__r_.__value_.__l.__size_ = 0;
      v92->__r_.__value_.__r.__words[2] = 0;
      v92->__r_.__value_.__r.__words[0] = 0;
      ACFULogging::handleMessageCFType((uint64_t)v89, (uint64_t *)__p, 0, (uint64_t)"firmwareInfoDict: ", (uint64_t)v77);
      if (SHIBYTE(v160) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v158.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v157.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v157.__r_.__value_.__l.__data_);
      }
      long long v95 = ACFULogging::getLogInstance(v94);
      uint64_t v101 = (uint64_t)v95;
      if (v88)
      {
        ACFULogging::handleMessage((uint64_t)v95, 0, "%s::%s: leaving: VinylRestoreHost: %s\n", v96, v97, v98, v99, v100, (char)"VinylRestoreHost");
      }
      else
      {
        std::string::basic_string[abi:ne180100]<0>(&v157, "VinylRestoreHost");
        v153 = std::string::append(&v157, "::");
        long long v154 = *(_OWORD *)&v153->__r_.__value_.__l.__data_;
        v158.__r_.__value_.__r.__words[2] = v153->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v158.__r_.__value_.__l.__data_ = v154;
        v153->__r_.__value_.__l.__size_ = 0;
        v153->__r_.__value_.__r.__words[2] = 0;
        v153->__r_.__value_.__r.__words[0] = 0;
        v155 = std::string::append(&v158, "copyFirmwareUpdater");
        long long v156 = *(_OWORD *)&v155->__r_.__value_.__l.__data_;
        std::string::size_type v160 = v155->__r_.__value_.__r.__words[2];
        *(_OWORD *)__p = v156;
        v155->__r_.__value_.__l.__size_ = 0;
        v155->__r_.__value_.__r.__words[2] = 0;
        v155->__r_.__value_.__r.__words[0] = 0;
        ACFULogging::handleMessageCFType(v101, (uint64_t *)__p, 2, (uint64_t)"Failed to serialize dictionary, error: ", (uint64_t)error);
        if (SHIBYTE(v160) < 0) {
          operator delete(__p[0]);
        }
        if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v158.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v157.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v157.__r_.__value_.__l.__data_);
        }
      }
      CFRelease(v77);
    }
    else
    {
      v147 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v147, 2u, "%s::%s: failed to get create firmwareInfoDict\n", v148, v149, v150, v151, v152, (char)"VinylRestoreHost");
      uint64_t v88 = 0;
    }
    CFRelease(v60);
    goto LABEL_75;
  }
  v141 = ACFULogging::getLogInstance(v73);
  ACFULogging::handleMessage((uint64_t)v141, 2u, "%s::%s: failed to get firmware object\n", v142, v143, v144, v145, v146, (char)"VinylRestoreHost");
  CFRelease(v60);
  uint64_t v88 = 0;
  long long v60 = 0;
  if (v72)
  {
LABEL_75:
    VinylFirmware::~VinylFirmware(v72);
    operator delete(v102);
    long long v60 = v88;
  }
  if (v74)
  {
    VinylFirmware::~VinylFirmware(v74);
    operator delete(v103);
  }
  return v60;
}

void sub_217B05C08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
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

const void **ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(const void **a1)
{
  v2 = *a1;
  if (v2) {
    CFRelease(v2);
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

void *ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(void *a1, CFTypeRef *a2)
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
        CFTypeID v13 = v12;
        if (v11 >= 5)
        {
          CFDictionaryRef v14 = v12 + 1;
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
      amai_unzGoToFirstFile(v8);
    }
  }
  return v8;
}

void *vinyl_unzOpen(uint64_t a1, uint64_t a2)
{
  return vinyl_unzOpen2(a1, 0, a2);
}

void *eUICCFwReaderOpen(ACFULogging *a1)
{
  LogInstance = ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: %s\n", v3, v4, v5, v6, v7, (char)"eUICCFwReader");
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  unint64_t v10 = vinyl_unzOpen((uint64_t)BytePtr, Length);
  if (!v10)
  {
    unint64_t v11 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v11, 2u, "%s::%s: failed to open bbfw archive for reading eUICCFwReaderOpen\n", v12, v13, v14, v15, v16, (char)"eUICCFwReader");
  }
  return v10;
}

uint64_t eUICCFwReaderClose(ACFULogging *a1)
{
  LogInstance = ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: %s\n", v3, v4, v5, v6, v7, (char)"eUICCFwReader");
  if (a1) {
    amai_unzClose((uint64_t)a1);
  }
  return 0;
}

ACFULogging *eUICCFwReaderFindAndCopyFileData(ACFULogging *a1, CFStringRef theString, CFTypeRef *a3)
{
  CFTypeRef v39 = 0;
  if (theString)
  {
    LogInstance = ACFULogging::getLogInstance(a1);
    std::string::basic_string[abi:ne180100]<0>(&v35, "eUICCFwReader");
    uint64_t v7 = std::string::append(&v35, "::");
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v36.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    unint64_t v9 = std::string::append(&v36, "eUICCFwReaderFindAndCopyFileData");
    long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    std::string::size_type v38 = v9->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)LogInstance, (uint64_t *)__p, 4, (uint64_t)"filename ", (uint64_t)theString);
    if (SHIBYTE(v38) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v36.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v35.__r_.__value_.__l.__data_);
    }
  }
  File = (ACFULogging *)BbfwReaderFindFile((uint64_t)a1, theString);
  if (File)
  {
    uint64_t v12 = File;
    uint64_t v13 = ACFULogging::getLogInstance(File);
    ACFULogging::handleMessage((uint64_t)v13, 2u, "%s::%s: failed to find bbfw item status %d\n", v14, v15, v16, v17, v18, (char)"eUICCFwReader");
    return v12;
  }
  else
  {
    long long v20 = (ACFULogging *)eUICCFwReaderCopyFileData((uint64_t)a1, &v39);
    uint64_t v19 = v20;
    if (v20)
    {
      unint64_t v21 = ACFULogging::getLogInstance(v20);
      ACFULogging::handleMessage((uint64_t)v21, 2u, "%s::%s: failed to extract bbfw item status %d\n", v22, v23, v24, v25, v26, (char)"eUICCFwReader");
      CFTypeRef v27 = v39;
      if (!v39) {
        return v19;
      }
    }
    else
    {
      CFTypeRef v27 = v39;
      if (!v39)
      {
        int v29 = ACFULogging::getLogInstance(v20);
        ACFULogging::handleMessage((uint64_t)v29, 2u, "%s::%s: failed to extract bbfw item fileData is NULL\n", v30, v31, v32, v33, v34, (char)"eUICCFwReader");
        return 0;
      }
      *a3 = CFRetain(v39);
    }
    CFRelease(v27);
  }
  return v19;
}

void sub_217B063E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
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
  if (amai_unzGetCurrentFileInfo(a1, (uint64_t)&v10, (uint64_t)v12, 0x400uLL, 0, 0, 0, 0)) {
    return 15;
  }
  uint64_t v4 = (const UInt8 *)malloc(__size);
  if (!v4) {
    return 2;
  }
  uint64_t v5 = v4;
  if (amai_unzOpenCurrentFile(a1)) {
    return 15;
  }
  int CurrentFile = amai_unzReadCurrentFile(a1, (uint64_t)v5, __size);
  if (__size != CurrentFile) {
    return 4;
  }
  if (amai_unzCloseCurrentFile(a1)) {
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
  uint64_t v34 = *MEMORY[0x263EF8340];
  LogInstance = ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: %s\n", v7, v8, v9, v10, v11, (char)"eUICCFwReader");
  uint64_t v12 = (ACFULogging *)eUICCFwReaderOpen(a1);
  if (!v12)
  {
    uint64_t v26 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v26, 2u, "%s::%s: failed to open bbfw archive for reading\n", v27, v28, v29, v30, v31, (char)"eUICCFwReader");
    uint64_t v17 = 4;
    goto LABEL_9;
  }
  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  while (1)
  {
    if (amai_unzGetCurrentFileInfo((uint64_t)v12, (uint64_t)v32, (uint64_t)cStr, 0x400uLL, 0, 0, 0, 0))
    {
      uint64_t v17 = 15;
      goto LABEL_9;
    }
    if (cStr[0]) {
      break;
    }
LABEL_7:
    if (amai_unzGoToNextFile(v12))
    {
LABEL_8:
      uint64_t v17 = 0;
      goto LABEL_9;
    }
  }
  CFStringRef v14 = CFStringCreateWithCString(v13, cStr, 0x8000100u);
  if (v14)
  {
    CFStringRef v15 = v14;
    char v16 = a2(a3, v14, v12);
    CFRelease(v15);
    if ((v16 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v17 = 3;
LABEL_9:
  uint64_t v18 = (ACFULogging *)eUICCFwReaderClose(v12);
  uint64_t v19 = ACFULogging::getLogInstance(v18);
  ACFULogging::handleMessage((uint64_t)v19, 4u, "%s::%s: leaving: %s\n", v20, v21, v22, v23, v24, (char)"eUICCFwReader");
  return v17;
}

ACFULogging *VinylUpdaterGetTags(ACFULogging *a1, void (*a2)(void *, const char *), void *a3, ACFULogging **a4)
{
  LogInstance = (ACFULogging *)ACFULogging::getLogInstance(a1);
  inited = (ACFULogging *)ACFULogging::initLog(LogInstance, a1, a2, a3);
  if (a4)
  {
    int v10 = (int)inited;
    uint64_t v11 = ACFULogging::getLogInstance(inited);
    if (v10)
    {
      ACFULogging::handleMessage((uint64_t)v11, 2u, "%s::%s: failed to init logging\n", v12, v13, v14, v15, v16, (char)"VinylRestoreHost");
      Error = CFErrorCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], @"VinylRestoreInfo", v10, 0);
      uint64_t v18 = 0;
    }
    else
    {
      ACFULogging::handleMessage((uint64_t)v11, 4u, "%s::%s: entering: VinylRestoreInfo: %s\n", v12, v13, v14, v15, v16, (char)"VinylRestoreHost");
      VinylRestoreHost::create(a1, (const __CFDictionary *)@"VinylRestoreInfo", &v46);
      uint64_t v18 = v46;
      if (v46)
      {
        Error = (ACFULogging *)(**(uint64_t (***)(VinylRestoreHost *))v46)(v46);
        uint64_t v20 = Error;
        if (Error) {
          goto LABEL_5;
        }
        uint64_t v40 = ACFULogging::getLogInstance(0);
        ACFULogging::handleMessage((uint64_t)v40, 2u, "%s::%s: failed to get tags\n", v41, v42, v43, v44, v45, (char)"VinylRestoreHost");
        Error = ACFURestoreHost::getError(v18);
      }
      else
      {
        uint64_t v34 = ACFULogging::getLogInstance(v17);
        ACFULogging::handleMessage((uint64_t)v34, 2u, "%s::%s: failed to create host object\n", v35, v36, v37, v38, v39, (char)"VinylRestoreHost");
        Error = CFErrorCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], @"VinylRestoreInfo", 4000, 0);
      }
    }
    uint64_t v20 = 0;
    *a4 = Error;
  }
  else
  {
    uint64_t v28 = ACFULogging::getLogInstance(inited);
    ACFULogging::handleMessage((uint64_t)v28, 2u, "%s::%s: invalid error parameter passed\n", v29, v30, v31, v32, v33, (char)"VinylRestoreHost");
    uint64_t v18 = 0;
    uint64_t v20 = 0;
  }
LABEL_5:
  uint64_t v21 = ACFULogging::getLogInstance(Error);
  ACFULogging::handleMessage((uint64_t)v21, 4u, "%s::%s: leaving: VinylRestoreInfo: %s\n", v22, v23, v24, v25, v26, (char)"VinylRestoreHost");
  if (v18) {
    (*(void (**)(ACFURestoreHost *))(*(void *)v18 + 24))(v18);
  }
  return v20;
}

void sub_217B068E0(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 24))(v1);
  _Unwind_Resume(a1);
}

ACFULogging *VinylUpdaterCopyFirmware(ACFULogging *a1, void (*a2)(void *, const char *), void *a3, CFErrorRef *a4)
{
  LogInstance = ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: VinylRestoreInfo: %s\n", v9, v10, v11, v12, v13, (char)"VinylRestoreHost");
  uint64_t v15 = (ACFULogging *)ACFULogging::getLogInstance(v14);
  inited = (ACFULogging *)ACFULogging::initLog(v15, a1, a2, a3);
  if (inited)
  {
    int v28 = (int)inited;
    uint64_t v29 = ACFULogging::getLogInstance(inited);
    ACFULogging::handleMessage((uint64_t)v29, 2u, "%s::%s: failed to init logging\n", v30, v31, v32, v33, v34, (char)"VinylRestoreHost");
    if (a4)
    {
      CFAllocatorRef v35 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFIndex v36 = v28;
LABEL_11:
      uint64_t v20 = 0;
      *a4 = CFErrorCreate(v35, @"VinylRestoreInfo", v36, 0);
      return v20;
    }
    return 0;
  }
  VinylRestoreHost::create(a1, (const __CFDictionary *)@"VinylRestoreInfo", &v49);
  uint64_t v18 = v49;
  if (!v49)
  {
    uint64_t v37 = ACFULogging::getLogInstance(v17);
    ACFULogging::handleMessage((uint64_t)v37, 2u, "%s::%s: failed to create host object\n", v38, v39, v40, v41, v42, (char)"VinylRestoreHost");
    if (a4)
    {
      CFAllocatorRef v35 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFIndex v36 = 4000;
      goto LABEL_11;
    }
    return 0;
  }
  uint64_t v19 = ACFURestoreHost::copyFirmware(v49);
  uint64_t v20 = v19;
  if (v19)
  {
    uint64_t v21 = ACFULogging::getLogInstance(v19);
    ACFULogging::handleMessage((uint64_t)v21, 4u, "%s::%s: leaving: VinylRestoreInfo: %s\n", v22, v23, v24, v25, v26, (char)"VinylRestoreHost");
  }
  else
  {
    uint64_t v43 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v43, 2u, "%s::%s: failed to copy firmware\n", v44, v45, v46, v47, v48, (char)"VinylRestoreHost");
    if (a4) {
      *a4 = ACFURestoreHost::getError(v18);
    }
  }
  (*(void (**)(ACFURestoreHost *))(*(void *)v18 + 24))(v18);
  return v20;
}

void sub_217B06AD4(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 24))(v1);
  _Unwind_Resume(a1);
}

ACFULogging *VinylUpdaterCreateRequest(ACFULogging *a1, void (*a2)(void *, const char *), void *a3, CFErrorRef *a4)
{
  LogInstance = ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: VinylRestoreInfo: %s\n", v9, v10, v11, v12, v13, (char)"VinylRestoreHost");
  uint64_t v14 = ACFUError::ACFUError((ACFUError *)v65, @"VinylRestoreInfo");
  __int16 v64 = 0;
  v63[1] = (VinylRestoreHost *)@"eUICC,ApProductionMode";
  v63[2] = (VinylRestoreHost *)@"eUICC,ApSecMode";
  uint64_t v15 = (ACFULogging *)ACFULogging::getLogInstance(v14);
  inited = (ACFULogging *)ACFULogging::initLog(v15, a1, a2, a3);
  uint64_t v17 = ACFULogging::getLogInstance(inited);
  ACFULogging::handleMessage((uint64_t)v17, 4u, "%s::%s: VinylUpdaterCreateRequest  ACFUInitLog returning %d\n", v18, v19, v20, v21, v22, (char)"VinylRestoreHost");
  if (inited)
  {
    CFIndex v36 = ACFULogging::getLogInstance(v23);
    ACFULogging::handleMessage((uint64_t)v36, 2u, "%s::%s: failed to init logging\n", v37, v38, v39, v40, v41, (char)"VinylRestoreHost");
    CFIndex v42 = (int)inited;
    goto LABEL_11;
  }
  VinylRestoreHost::create(a1, (const __CFDictionary *)@"VinylRestoreInfo", v63);
  uint64_t v25 = v63[0];
  if (!v63[0])
  {
    uint64_t v43 = ACFULogging::getLogInstance(v24);
    ACFULogging::handleMessage((uint64_t)v43, 2u, "%s::%s: failed to create host object\n", v44, v45, v46, v47, v48, (char)"VinylRestoreHost");
    if (!a4)
    {
LABEL_12:
      int v28 = 0;
      goto LABEL_7;
    }
    CFIndex v42 = 4000;
LABEL_11:
    *a4 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], @"VinylRestoreInfo", v42, 0);
    goto LABEL_12;
  }
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(a1, @"FirmwareData");
  if (!Value)
  {
    std::string v49 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v49, 0, "%s::%s: Invalid or no firmware file present in restore options\n", v50, v51, v52, v53, v54, (char)"VinylRestoreHost");
    goto LABEL_18;
  }
  Request = VinylRestoreHost::createRequest(v25, Value);
  int v28 = Request;
  if (!Request)
  {
    CFDictionaryRef v55 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v55, 2u, "%s::%s: failed to create request dict\n", v56, v57, v58, v59, v60, (char)"VinylRestoreHost");
    std::string::basic_string[abi:ne180100]<0>(__p, "VinylUpdaterCreateRequest: failed to create request dict");
    ACFUError::addError((uint64_t)v65, (uint64_t)__p, 0xFA1uLL, 0);
    if (v62 < 0) {
      operator delete(__p[0]);
    }
    if (a4)
    {
      int v28 = 0;
      *a4 = ACFURestoreHost::getError(v25);
      goto LABEL_6;
    }
LABEL_18:
    int v28 = 0;
    goto LABEL_6;
  }
  uint64_t v29 = ACFULogging::getLogInstance(Request);
  ACFULogging::handleMessage((uint64_t)v29, 4u, "%s::%s: leaving: VinylRestoreInfo: %s\n", v30, v31, v32, v33, v34, (char)"VinylRestoreHost");
LABEL_6:
  (*(void (**)(ACFULogging *))(*(void *)v25 + 24))(v25);
LABEL_7:
  ACFUError::~ACFUError((ACFUError *)v65);
  return v28;
}

void sub_217B06D60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  (*(void (**)(uint64_t))(*(void *)v17 + 24))(v17);
  ACFUError::~ACFUError((ACFUError *)(v18 - 64));
  _Unwind_Resume(a1);
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

VinylFirmware *VinylGoldFirmwareCreate(const __CFData *a1, const __CFData *a2, const __CFData *a3, const __CFData *a4)
{
  LogInstance = ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: %s\n", v9, v10, v11, v12, v13, (char)"VinylFirmware");
  uint64_t v15 = ACFULogging::getLogInstance(v14);
  std::string::basic_string[abi:ne180100]<0>(&v37, "VinylFirmware");
  uint64_t v16 = std::string::append(&v37, "::");
  long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  uint64_t v18 = std::string::append(&v38, "VinylGoldFirmwareCreate");
  long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  std::string::size_type v40 = v18->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v15, (uint64_t *)__p, 0, (uint64_t)"fwZipData: ", (uint64_t)a1);
  if (SHIBYTE(v40) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v38.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }
  uint64_t v20 = (VinylFirmware *)operator new(0xC0uLL);
  VinylFirmware::VinylFirmware((uint64_t)v20, @"/update/gold/firmware.der", @"/update/gold/info.plist", @"/update/gold/profile.bin", off_2642BBC98);
  uint64_t v21 = (ACFULogging *)VinylFirmware::setFwInfo(v20, a1, a2, a3);
  if (v21)
  {
    uint64_t v22 = ACFULogging::getLogInstance(v21);
    ACFULogging::handleMessage((uint64_t)v22, 2u, "%s::%s: setFwInfo failed delete vinylFirmware object\n", v23, v24, v25, v26, v27, (char)"VinylFirmware");
    VinylFirmware::~VinylFirmware(v20);
    operator delete(v28);
    uint64_t v20 = 0;
  }
  uint64_t v29 = VinylFirmware::setRecoveryFwInfo(v20, a1, a2, a3, 0, a4);
  uint64_t v30 = ACFULogging::getLogInstance((ACFULogging *)v29);
  ACFULogging::handleMessage((uint64_t)v30, 4u, "%s::%s: leaving: %s\n", v31, v32, v33, v34, v35, (char)"VinylFirmware");
  return v20;
}

void sub_217B070B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  operator delete(v30);
  _Unwind_Resume(a1);
}

uint64_t VinylFirmware::setFwInfo(VinylFirmware *this, const __CFData *a2, const __CFData *a3, const __CFData *a4)
{
  uint64_t v48 = 0;
  LogInstance = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: %s\n", v9, v10, v11, v12, v13, (char)"VinylFirmware");
  CFDataRef theData = 0;
  uint64_t v47 = 0;
  *((void *)this + 15) = 0;
  if (!a2 || !a3 || !a4)
  {
    uint64_t v32 = ACFULogging::getLogInstance(v14);
    std::string v38 = "%s::%s: invalid params passed\n";
    goto LABEL_28;
  }
  FWSrcPath = (__CFString *)VinylFirmware::getFWSrcPath(v14, a3, a4);
  uint64_t v16 = v47;
  uint64_t v47 = FWSrcPath;
  error[0] = (CFErrorRef)v16;
  long long v17 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)error);
  if (v47) {
    uint64_t v18 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
  }
  else {
    uint64_t v18 = 0;
  }
  if (!v18)
  {
    uint64_t v32 = ACFULogging::getLogInstance((ACFULogging *)v17);
    std::string v38 = "%s::%s: Get FW source path failed\n";
    goto LABEL_28;
  }
  CFDataRef FileDataFromZip = (const __CFData *)VinylFirmware::getFileDataFromZip((VinylFirmware *)v17, a2, v47, *((const __CFString **)this + 12));
  uint64_t v20 = theData;
  CFDataRef theData = FileDataFromZip;
  error[0] = v20;
  uint64_t v21 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)error);
  if (theData) {
    uint64_t v22 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  }
  else {
    uint64_t v22 = 0;
  }
  if (!v22 || !theData)
  {
    uint64_t v32 = ACFULogging::getLogInstance((ACFULogging *)v21);
    std::string v38 = "%s::%s: Get FW Data from Zip failed\n";
LABEL_28:
    ACFULogging::handleMessage((uint64_t)v32, 2u, v38, v33, v34, v35, v36, v37, (char)"VinylFirmware");
    uint64_t v28 = 99;
    goto LABEL_19;
  }
  uint64_t v23 = (VinylFirmware *)VinylFirmware::getFileDataFromZip((VinylFirmware *)v21, a2, v47, *((const __CFString **)this + 13));
  *((void *)this + 18) = v23;
  if (!v23)
  {
    uint64_t v32 = ACFULogging::getLogInstance(0);
    std::string v38 = "%s::%s: Get InfoPlist Data from Zip failed\n";
    goto LABEL_28;
  }
  CFTypeRef v24 = VinylFirmware::getFileDataFromZip(v23, a2, v47, *((const __CFString **)this + 14));
  *((void *)this + 19) = v24;
  if (!v24)
  {
    uint64_t v32 = ACFULogging::getLogInstance(0);
    std::string v38 = "%s::%s: Get Profile Data from Zip failed\n";
    goto LABEL_28;
  }
  CFAllocatorRef v25 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDataRef MutableCopy = CFDataCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, theData);
  *((void *)this + 15) = MutableCopy;
  if (!MutableCopy)
  {
    uint64_t v32 = ACFULogging::getLogInstance(0);
    std::string v38 = "%s::%s: Create FwData copy failed\n";
    goto LABEL_28;
  }
  Im4p = (ACFULogging *)VinylFirmware::createIm4p(this, a2, (uint64_t *)this + 2, (uint64_t *)this + 17);
  uint64_t v28 = (uint64_t)Im4p;
  if (Im4p)
  {
    uint64_t v39 = ACFULogging::getLogInstance(Im4p);
    ACFULogging::handleMessage((uint64_t)v39, 2u, "%s::%s: error getting properlylist\n", v40, v41, v42, v43, v44, (char)"VinylFirmware");
    goto LABEL_19;
  }
  CFDataRef v29 = (const __CFData *)*((void *)this + 18);
  error[0] = 0;
  error[1] = (CFErrorRef)&v48;
  *((void *)this + 21) = CFPropertyListCreateWithData(v25, v29, 0, 0, error);
  uint64_t v30 = ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)error);
  if (!*((void *)this + 21))
  {
    uint64_t v32 = ACFULogging::getLogInstance((ACFULogging *)v30);
    std::string v38 = "%s::%s: error getting properlylist\n";
    goto LABEL_28;
  }
  uint64_t v28 = 0;
LABEL_19:
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&theData);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v47);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&v48);
  return v28;
}

void sub_217B07374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va3, a4);
  va_start(va2, a4);
  va_start(va1, a4);
  va_start(va, a4);
  uint64_t v5 = va_arg(va1, const void *);
  uint64_t v7 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v8 = va_arg(va2, const void *);
  va_copy(va3, va2);
  uint64_t v10 = va_arg(va3, const void *);
  ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)va);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)va1);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)va2);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)va3);
  _Unwind_Resume(a1);
}

const void **VinylFirmware::setRecoveryFwInfo(VinylFirmware *this, const __CFData *a2, const __CFData *a3, const __CFData *a4, unsigned int a5, const __CFData *a6)
{
  uint64_t v159 = *MEMORY[0x263EF8340];
  CFStringRef v154 = 0;
  v155 = 0;
  CFDataRef v152 = 0;
  v153 = 0;
  CFDataRef data = 0;
  *((void *)this + 16) = 0;
  LogInstance = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 0, "%s::%s: entering: %s\n", v10, v11, v12, v13, v14, (char)"VinylFirmware");
  if (!a2 || !a3 || !a4 || !a6)
  {
    uint64_t v122 = ACFULogging::getLogInstance(v15);
    uint64_t v128 = "%s::%s: invalid params passed\n";
LABEL_91:
    ACFULogging::handleMessage((uint64_t)v122, 2u, v128, v123, v124, v125, v126, v127, (char)"VinylFirmware");
    goto LABEL_83;
  }
  FwMaCC_SHA256_CTX c = (ACFULogging *)VinylFirmware::getFwMac(v15, *((CFDictionaryRef *)this + 21));
  CFDataRef v17 = FwMac;
  if (!FwMac)
  {
    uint64_t v122 = ACFULogging::getLogInstance(0);
    uint64_t v128 = "%s::%s: Failed getting FW MAC\n";
    goto LABEL_91;
  }
  uint64_t v18 = ACFULogging::getLogInstance(FwMac);
  std::string::basic_string[abi:ne180100]<0>(&v147, "VinylFirmware");
  long long v19 = std::string::append(&v147, "::");
  long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  v148.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v148.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  uint64_t v21 = std::string::append(&v148, "setRecoveryFwInfo");
  long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  std::string::size_type v150 = v21->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v18, (uint64_t *)__p, 0, (uint64_t)"fwMac : ", (uint64_t)v17);
  if (SHIBYTE(v150) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v148.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v148.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v147.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v147.__r_.__value_.__l.__data_);
  }
  CFTypeRef v24 = ACFULogging::getLogInstance(v23);
  std::string::basic_string[abi:ne180100]<0>(&v147, "VinylFirmware");
  CFAllocatorRef v25 = std::string::append(&v147, "::");
  long long v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
  v148.__r_.__value_.__r.__words[2] = v25->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v148.__r_.__value_.__l.__data_ = v26;
  v25->__r_.__value_.__l.__size_ = 0;
  v25->__r_.__value_.__r.__words[2] = 0;
  v25->__r_.__value_.__r.__words[0] = 0;
  uint64_t v27 = "setRecoveryFwInfo";
  uint64_t v28 = std::string::append(&v148, "setRecoveryFwInfo");
  long long v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
  std::string::size_type v150 = v28->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v29;
  v28->__r_.__value_.__l.__size_ = 0;
  v28->__r_.__value_.__r.__words[2] = 0;
  v28->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v24, (uint64_t *)__p, 0, (uint64_t)"mac : ", (uint64_t)a6);
  if (SHIBYTE(v150) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v148.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v148.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v147.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v147.__r_.__value_.__l.__data_);
  }
  BytePtr = CFDataGetBytePtr(v17);
  uint64_t v31 = CFDataGetBytePtr(a6);
  CFIndex Length = CFDataGetLength(v17);
  if (Length >= CFDataGetLength(a6)) {
    CFDataRef v33 = a6;
  }
  else {
    CFDataRef v33 = v17;
  }
  size_t v34 = CFDataGetLength(v33);
  uint64_t v35 = (ACFULogging *)memcmp(BytePtr, v31, v34);
  int v36 = (int)v35;
  uint64_t v37 = ACFULogging::getLogInstance(v35);
  uint64_t v141 = a5;
  ACFULogging::handleMessage((uint64_t)v37, 0, "%s::%s: SM::Recovery -- normal? %d macMatchRequired %d\n", v38, v39, v40, v41, v42, (char)"VinylFirmware");
  if (v36)
  {
    if ((a5 & 1) == 0)
    {
      strcpy(v158, "/recovery/gold-");
      strcpy(v157, "/firmware.der");
      strcpy(v156, "/info.plist");
      FWSrcPath = (__CFString *)VinylFirmware::getFWSrcPath(v43, a3, a4);
      uint64_t v146 = FWSrcPath;
      if (FWSrcPath) {
        uint64_t v45 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
      }
      else {
        uint64_t v45 = 0;
      }
      if (v45)
      {
        uint64_t v46 = (char *)malloc(0x22uLL);
        uint64_t v47 = (ACFULogging *)malloc(0x20uLL);
        uint64_t v48 = (char *)v47;
        if (v46 && v47)
        {
          uint64_t v49 = 0;
          CFAllocatorRef v50 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          uint64_t v51 = "%s%03d%s";
          uint64_t v142 = v46;
          while (1)
          {
            uint64_t v52 = (ACFULogging *)snprintf(v46, 0x22uLL, v51, v158, v49, v157, v141);
            v46[33] = 0;
            uint64_t v53 = ACFULogging::getLogInstance(v52);
            ACFULogging::handleMessage((uint64_t)v53, 0, "%s::%s: fwFileName %s\n", v54, v55, v56, v57, v58, (char)"VinylFirmware");
            CFStringRef v59 = CFStringCreateWithCString(v50, v46, 0x8000100u);
            CFStringRef v60 = v154;
            CFStringRef v154 = v59;
            __p[0] = (void *)v60;
            v61 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
            if (v154) {
              char v62 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
            }
            else {
              char v62 = 0;
            }
            if (!v62)
            {
              uint64_t v115 = ACFULogging::getLogInstance((ACFULogging *)v61);
              uint64_t v121 = "%s::%s: Failed to alloc create fwFilePath CFString\n";
              goto LABEL_86;
            }
            uint64_t v63 = ACFULogging::getLogInstance((ACFULogging *)v61);
            std::string::basic_string[abi:ne180100]<0>(&v147, "VinylFirmware");
            __int16 v64 = std::string::append(&v147, "::");
            long long v65 = *(_OWORD *)&v64->__r_.__value_.__l.__data_;
            v148.__r_.__value_.__r.__words[2] = v64->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v148.__r_.__value_.__l.__data_ = v65;
            v64->__r_.__value_.__l.__size_ = 0;
            v64->__r_.__value_.__r.__words[2] = 0;
            v64->__r_.__value_.__r.__words[0] = 0;
            uint64_t v66 = std::string::append(&v148, v27);
            long long v67 = *(_OWORD *)&v66->__r_.__value_.__l.__data_;
            std::string::size_type v150 = v66->__r_.__value_.__r.__words[2];
            *(_OWORD *)__p = v67;
            v66->__r_.__value_.__l.__size_ = 0;
            v66->__r_.__value_.__r.__words[2] = 0;
            v66->__r_.__value_.__r.__words[0] = 0;
            ACFULogging::handleMessageCFType((uint64_t)v63, (uint64_t *)__p, 0, (uint64_t)"fwFilePath : ", (uint64_t)v154);
            if (SHIBYTE(v150) < 0) {
              operator delete(__p[0]);
            }
            if (SHIBYTE(v148.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v148.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v147.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v147.__r_.__value_.__l.__data_);
            }
            v68 = (ACFULogging *)snprintf(v48, 0x20uLL, v51, v158, v49, v156);
            v48[31] = 0;
            long long v69 = ACFULogging::getLogInstance(v68);
            ACFULogging::handleMessage((uint64_t)v69, 0, "%s::%s: plistFileName %s\n", v70, v71, v72, v73, v74, (char)"VinylFirmware");
            CFAllocatorRef v75 = (__CFString *)CFStringCreateWithCString(v50, v48, 0x8000100u);
            v76 = v153;
            v153 = v75;
            __p[0] = v76;
            long long v77 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
            if (!(v153
                 ? ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get
                 : 0))
              break;
            v79 = ACFULogging::getLogInstance((ACFULogging *)v77);
            std::string::basic_string[abi:ne180100]<0>(&v147, "VinylFirmware");
            long long v80 = std::string::append(&v147, "::");
            long long v81 = *(_OWORD *)&v80->__r_.__value_.__l.__data_;
            v148.__r_.__value_.__r.__words[2] = v80->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v148.__r_.__value_.__l.__data_ = v81;
            v80->__r_.__value_.__l.__size_ = 0;
            v80->__r_.__value_.__r.__words[2] = 0;
            v80->__r_.__value_.__r.__words[0] = 0;
            long long v82 = std::string::append(&v148, v27);
            long long v83 = *(_OWORD *)&v82->__r_.__value_.__l.__data_;
            std::string::size_type v150 = v82->__r_.__value_.__r.__words[2];
            *(_OWORD *)__p = v83;
            v82->__r_.__value_.__l.__size_ = 0;
            v82->__r_.__value_.__r.__words[2] = 0;
            v82->__r_.__value_.__r.__words[0] = 0;
            ACFULogging::handleMessageCFType((uint64_t)v79, (uint64_t *)__p, 0, (uint64_t)"plistFilePath : ", (uint64_t)v153);
            if (SHIBYTE(v150) < 0) {
              operator delete(__p[0]);
            }
            if (SHIBYTE(v148.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v148.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v147.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v147.__r_.__value_.__l.__data_);
            }
            CFDataRef FileDataFromZip = (const __CFData *)VinylFirmware::getFileDataFromZip(v84, a2, v146, v154);
            CFDataRef v86 = v152;
            CFDataRef v152 = FileDataFromZip;
            __p[0] = v86;
            uint64_t v87 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
            CFDataRef v88 = (const __CFData *)VinylFirmware::getFileDataFromZip((VinylFirmware *)v87, a2, v146, v153);
            CFDataRef v89 = data;
            CFDataRef data = v88;
            __p[0] = v89;
            ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
            if (v152) {
              v90 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
            }
            else {
              v90 = 0;
            }
            if (!v90) {
              goto LABEL_69;
            }
            long long v91 = data
                ? ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get
                : 0;
            if (!v91 || !v152 || !data) {
              goto LABEL_69;
            }
            v92 = v48;
            long long v93 = v27;
            v94 = v51;
            __p[0] = 0;
            __p[1] = &v155;
            CFAllocatorRef v95 = v50;
            v148.__r_.__value_.__r.__words[0] = (std::string::size_type)CFPropertyListCreateWithData(v50, data, 0, 0, (CFErrorRef *)__p);
            uint64_t v96 = ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)__p);
            CFDataRef v97 = (const __CFData *)VinylFirmware::getFwMac((VinylFirmware *)v96, (CFDictionaryRef)v148.__r_.__value_.__l.__data_);
            uint64_t v98 = CFDataGetBytePtr(v97);
            uint64_t v99 = CFDataGetBytePtr(a6);
            CFIndex v100 = CFDataGetLength(v97);
            if (v100 >= CFDataGetLength(a6)) {
              size_t v101 = CFDataGetLength(a6);
            }
            else {
              size_t v101 = CFDataGetLength(v97);
            }
            CFAllocatorRef v50 = v95;
            if (!memcmp(v98, v99, v101))
            {
              CFMutableDataRef MutableCopy = CFDataCreateMutableCopy(v95, 0, v152);
              uint64_t v48 = v92;
              *((void *)this + 16) = MutableCopy;
              ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v148.__r_.__value_.__l.__data_);
              uint64_t v46 = v142;
LABEL_69:
              uint64_t v43 = (VinylFirmware *)ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v146);
              goto LABEL_70;
            }
            uint64_t v51 = v94;
            ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v148.__r_.__value_.__l.__data_);
            uint64_t v49 = (v49 + 1);
            uint64_t v27 = v93;
            uint64_t v48 = v92;
            uint64_t v46 = v142;
            if (v49 == 1000) {
              goto LABEL_69;
            }
          }
          uint64_t v115 = ACFULogging::getLogInstance((ACFULogging *)v77);
          uint64_t v121 = "%s::%s: Failed to alloc create plistFilePath CFString\n";
LABEL_86:
          ACFULogging::handleMessage((uint64_t)v115, 2u, v121, v116, v117, v118, v119, v120, (char)"VinylFirmware");
        }
        else
        {
          v135 = ACFULogging::getLogInstance(v47);
          ACFULogging::handleMessage((uint64_t)v135, 2u, "%s::%s: Failed to alloc memory for filename\n", v136, v137, v138, v139, v140, (char)"VinylFirmware");
        }
      }
      else
      {
        v129 = ACFULogging::getLogInstance((ACFULogging *)FWSrcPath);
        ACFULogging::handleMessage((uint64_t)v129, 2u, "%s::%s: Get FW source path failed\n", v130, v131, v132, v133, v134, (char)"VinylFirmware");
        uint64_t v48 = 0;
        uint64_t v46 = 0;
      }
      ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v146);
      if (!v46) {
        goto LABEL_81;
      }
      goto LABEL_80;
    }
  }
  else
  {
    *((void *)this + 16) = *((void *)this + 15);
    uint64_t v43 = (VinylFirmware *)AMSupportSafeRetain();
  }
  uint64_t v48 = 0;
  uint64_t v46 = 0;
LABEL_70:
  if (!*((void *)this + 16))
  {
    uint64_t v108 = ACFULogging::getLogInstance(v43);
    ACFULogging::handleMessage((uint64_t)v108, 0, "%s::%s: Recovery Fw is not available\n", v109, v110, v111, v112, v113, (char)"VinylFirmware");
    goto LABEL_79;
  }
  uint64_t v103 = ACFULogging::getLogInstance(v43);
  std::string::basic_string[abi:ne180100]<0>(&v147, "VinylFirmware");
  uint64_t v104 = std::string::append(&v147, "::");
  long long v105 = *(_OWORD *)&v104->__r_.__value_.__l.__data_;
  v148.__r_.__value_.__r.__words[2] = v104->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v148.__r_.__value_.__l.__data_ = v105;
  v104->__r_.__value_.__l.__size_ = 0;
  v104->__r_.__value_.__r.__words[2] = 0;
  v104->__r_.__value_.__r.__words[0] = 0;
  uint64_t v106 = std::string::append(&v148, "setRecoveryFwInfo");
  long long v107 = *(_OWORD *)&v106->__r_.__value_.__l.__data_;
  std::string::size_type v150 = v106->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v107;
  v106->__r_.__value_.__l.__size_ = 0;
  v106->__r_.__value_.__r.__words[2] = 0;
  v106->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v103, (uint64_t *)__p, 0, (uint64_t)"recoveryFwData : ", *((void *)this + 16));
  if (SHIBYTE(v150) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v148.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v148.__r_.__value_.__l.__data_);
  }
  if ((SHIBYTE(v147.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_79:
    if (!v46) {
      goto LABEL_81;
    }
    goto LABEL_80;
  }
  operator delete(v147.__r_.__value_.__l.__data_);
  if (v46) {
LABEL_80:
  }
    free(v46);
LABEL_81:
  if (v48) {
    free(v48);
  }
LABEL_83:
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&data);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v152);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v153);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v154);
  return ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&v155);
}

void sub_217B07D60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, const void *a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36,const void *a37,const void *a38,const void *a39)
{
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&a17);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&a37);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&a38);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&a39);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v39 - 160));
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v39 - 152));
  _Unwind_Resume(a1);
}

VinylFirmware *VinylMainFirmwareCreate(const __CFData *a1, const __CFData *a2, const __CFData *a3, const __CFData *a4)
{
  LogInstance = ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: %s\n", v9, v10, v11, v12, v13, (char)"VinylFirmware");
  uint64_t v15 = ACFULogging::getLogInstance(v14);
  std::string::basic_string[abi:ne180100]<0>(&v37, "VinylFirmware");
  uint64_t v16 = std::string::append(&v37, "::");
  long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  uint64_t v18 = std::string::append(&v38, "VinylMainFirmwareCreate");
  long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  std::string::size_type v40 = v18->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v15, (uint64_t *)__p, 0, (uint64_t)"fwZipData: ", (uint64_t)a1);
  if (SHIBYTE(v40) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v38.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }
  long long v20 = (VinylFirmware *)operator new(0xC0uLL);
  VinylFirmware::VinylFirmware((uint64_t)v20, @"/update/main/firmware.der", @"/update/main/info.plist", @"/update/main/profile.bin", off_2642BBC38);
  uint64_t v21 = (ACFULogging *)VinylFirmware::setFwInfo(v20, a1, a2, a3);
  if (v21)
  {
    long long v22 = ACFULogging::getLogInstance(v21);
    ACFULogging::handleMessage((uint64_t)v22, 2u, "%s::%s: setFwInfo failed delete vinylFirmware object\n", v23, v24, v25, v26, v27, (char)"VinylFirmware");
    VinylFirmware::~VinylFirmware(v20);
    operator delete(v28);
    long long v20 = 0;
  }
  long long v29 = VinylFirmware::setRecoveryFwInfo(v20, a1, a2, a3, 1u, a4);
  uint64_t v30 = ACFULogging::getLogInstance((ACFULogging *)v29);
  ACFULogging::handleMessage((uint64_t)v30, 4u, "%s::%s: leaving: %s\n", v31, v32, v33, v34, v35, (char)"VinylFirmware");
  return v20;
}

void sub_217B08084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  operator delete(v30);
  _Unwind_Resume(a1);
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
  *(_OWORD *)(a1 + 80) = v9;
  *(_OWORD *)(a1 + 32) = v7;
  *(_OWORD *)(a1 + 48) = v8;
  *(void *)(a1 + 96) = a2;
  *(void *)(a1 + 104) = a3;
  *(void *)(a1 + 112) = a4;
  *(void *)(a1 + 120) = 0;
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

void VinylFirmware::~VinylFirmware(VinylFirmware *this)
{
  LogInstance = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: VinylFirmware destructor called\n", v3, v4, v5, v6, v7, (char)"VinylFirmware");
  long long v8 = (const void *)*((void *)this + 12);
  if (v8)
  {
    CFRelease(v8);
    *((void *)this + 12) = 0;
  }
  long long v9 = (const void *)*((void *)this + 13);
  if (v9)
  {
    CFRelease(v9);
    *((void *)this + 13) = 0;
  }
  uint64_t v10 = (const void *)*((void *)this + 14);
  if (v10)
  {
    CFRelease(v10);
    *((void *)this + 14) = 0;
  }
  uint64_t v11 = (const void *)*((void *)this + 15);
  if (v11)
  {
    CFRelease(v11);
    *((void *)this + 15) = 0;
  }
  uint64_t v12 = (const void *)*((void *)this + 16);
  if (v12)
  {
    CFRelease(v12);
    *((void *)this + 16) = 0;
  }
  uint64_t v13 = (const void *)*((void *)this + 17);
  if (v13)
  {
    CFRelease(v13);
    *((void *)this + 17) = 0;
  }
  uint64_t v14 = (const void *)*((void *)this + 18);
  if (v14)
  {
    CFRelease(v14);
    *((void *)this + 18) = 0;
  }
  uint64_t v15 = (const void *)*((void *)this + 19);
  if (v15)
  {
    CFRelease(v15);
    *((void *)this + 19) = 0;
  }
  uint64_t v16 = (const void *)*((void *)this + 21);
  if (v16)
  {
    CFRelease(v16);
    *((void *)this + 21) = 0;
  }
  long long v17 = (void *)*((void *)this + 23);
  if (v17)
  {
    dlclose(v17);
    *((void *)this + 23) = 0;
  }
}

ACFULogging *VinylFirmware::getFWSrcPath(VinylFirmware *this, const __CFData *a2, const __CFData *a3)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  uint64_t v5 = (ACFULogging *)malloc(0x41uLL);
  if (!v5)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: srcPath memory alloc failed\n", v65, v66, v67, v68, v69, (char)"VinylFirmware");
    return 0;
  }
  uint64_t v6 = (char *)v5;
  if (!a2 || !a3)
  {
    uint64_t v70 = ACFULogging::getLogInstance(v5);
    ACFULogging::handleMessage((uint64_t)v70, 2u, "%s::%s: invalid params passed\n", v71, v72, v73, v74, v75, (char)"VinylFirmware");
LABEL_41:
    uint64_t v51 = 0;
    goto LABEL_36;
  }
  CFMutableDataRef MutableCopy = CFDataCreateMutableCopy(0, 0, a2);
  long long v8 = ACFULogging::getLogInstance(MutableCopy);
  uint64_t v14 = (uint64_t)v8;
  if (!MutableCopy)
  {
    ACFULogging::handleMessage((uint64_t)v8, 2u, "%s::%s: certPlusLdrVer memory alloc failed\n", v9, v10, v11, v12, v13, (char)"VinylFirmware");
    goto LABEL_41;
  }
  std::string::basic_string[abi:ne180100]<0>(&v82, "VinylFirmware");
  uint64_t v15 = std::string::append(&v82, "::");
  long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  v83.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v83.__r_.__value_.__l.__data_ = v16;
  v15->__r_.__value_.__l.__size_ = 0;
  v15->__r_.__value_.__r.__words[2] = 0;
  v15->__r_.__value_.__r.__words[0] = 0;
  long long v17 = std::string::append(&v83, "getFWSrcPath");
  long long v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
  std::string::size_type v85 = v17->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v18;
  v17->__r_.__value_.__l.__size_ = 0;
  v17->__r_.__value_.__r.__words[2] = 0;
  v17->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType(v14, (uint64_t *)__p, 4, (uint64_t)"vinylgetFwData certPlusLdrVer just certIdentifier: ", (uint64_t)MutableCopy);
  if (SHIBYTE(v85) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v83.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v82.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v82.__r_.__value_.__l.__data_);
  }
  BytePtr = CFDataGetBytePtr(a3);
  CFIndex Length = CFDataGetLength(a3);
  CFDataAppendBytes(MutableCopy, BytePtr, Length - 1);
  long long v22 = ACFULogging::getLogInstance(v21);
  std::string::basic_string[abi:ne180100]<0>(&v82, "VinylFirmware");
  uint64_t v23 = std::string::append(&v82, "::");
  long long v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
  v83.__r_.__value_.__r.__words[2] = v23->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v83.__r_.__value_.__l.__data_ = v24;
  v23->__r_.__value_.__l.__size_ = 0;
  v23->__r_.__value_.__r.__words[2] = 0;
  v23->__r_.__value_.__r.__words[0] = 0;
  uint64_t v25 = std::string::append(&v83, "getFWSrcPath");
  long long v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
  std::string::size_type v85 = v25->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v26;
  v25->__r_.__value_.__l.__size_ = 0;
  v25->__r_.__value_.__r.__words[2] = 0;
  v25->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v22, (uint64_t *)__p, 0, (uint64_t)"vinylgetFwData certPlusLdrVer: ", (uint64_t)MutableCopy);
  if (SHIBYTE(v85) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v83.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v82.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v82.__r_.__value_.__l.__data_);
  }
  CFDataGetBytePtr(MutableCopy);
  CFDataGetLength(MutableCopy);
  uint64_t v27 = (ACFULogging *)AMSupportDigestSha256();
  if (v27)
  {
    v76 = ACFULogging::getLogInstance(v27);
    ACFULogging::handleMessage((uint64_t)v76, 0, "%s::%s: AMSupportDigestSha256 failed:\n", v77, v78, v79, v80, v81, (char)"VinylFirmware");
  }
  else
  {
    uint64_t v28 = CFDataCreate(0, bytes, 32);
    long long v29 = ACFULogging::getLogInstance(v28);
    uint64_t v35 = (uint64_t)v29;
    if (v28)
    {
      std::string::basic_string[abi:ne180100]<0>(&v82, "VinylFirmware");
      int v36 = std::string::append(&v82, "::");
      long long v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
      v83.__r_.__value_.__r.__words[2] = v36->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v83.__r_.__value_.__l.__data_ = v37;
      v36->__r_.__value_.__l.__size_ = 0;
      v36->__r_.__value_.__r.__words[2] = 0;
      v36->__r_.__value_.__r.__words[0] = 0;
      std::string v38 = std::string::append(&v83, "getFWSrcPath");
      long long v39 = *(_OWORD *)&v38->__r_.__value_.__l.__data_;
      std::string::size_type v85 = v38->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v39;
      v38->__r_.__value_.__l.__size_ = 0;
      v38->__r_.__value_.__r.__words[2] = 0;
      v38->__r_.__value_.__r.__words[0] = 0;
      ACFULogging::handleMessageCFType(v35, (uint64_t *)__p, 0, (uint64_t)"digestRef: ", (uint64_t)v28);
      if (SHIBYTE(v85) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v83.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v82.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v82.__r_.__value_.__l.__data_);
      }
      std::string::size_type v40 = bytes;
      size_t v41 = 65;
      uint64_t v42 = v6;
      do
      {
        int v43 = *v40++;
        uint64_t v44 = (ACFULogging *)snprintf(v42, v41, "%02x", v43);
        v42 += 2;
        v41 -= 2;
      }
      while (v41 != 1);
      v6[64] = 0;
      uint64_t v45 = ACFULogging::getLogInstance(v44);
      ACFULogging::handleMessage((uint64_t)v45, 4u, "%s::%s: vinylgetFwData srcPath %s:\n", v46, v47, v48, v49, v50, (char)"VinylFirmware");
      uint64_t v51 = (ACFULogging *)CFStringCreateWithCString(0, v6, 0x8000100u);
      uint64_t v52 = ACFULogging::getLogInstance(v51);
      uint64_t v58 = (uint64_t)v52;
      if (v51)
      {
        std::string::basic_string[abi:ne180100]<0>(&v82, "VinylFirmware");
        CFStringRef v59 = std::string::append(&v82, "::");
        long long v60 = *(_OWORD *)&v59->__r_.__value_.__l.__data_;
        v83.__r_.__value_.__r.__words[2] = v59->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v83.__r_.__value_.__l.__data_ = v60;
        v59->__r_.__value_.__l.__size_ = 0;
        v59->__r_.__value_.__r.__words[2] = 0;
        v59->__r_.__value_.__r.__words[0] = 0;
        v61 = std::string::append(&v83, "getFWSrcPath");
        long long v62 = *(_OWORD *)&v61->__r_.__value_.__l.__data_;
        std::string::size_type v85 = v61->__r_.__value_.__r.__words[2];
        *(_OWORD *)__p = v62;
        v61->__r_.__value_.__l.__size_ = 0;
        v61->__r_.__value_.__r.__words[2] = 0;
        v61->__r_.__value_.__r.__words[0] = 0;
        ACFULogging::handleMessageCFType(v58, (uint64_t *)__p, 0, (uint64_t)"vinylgetFwData fwSrcpath: ", (uint64_t)v51);
        if (SHIBYTE(v85) < 0) {
          operator delete(__p[0]);
        }
        if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v83.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v82.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v82.__r_.__value_.__l.__data_);
        }
      }
      else
      {
        ACFULogging::handleMessage((uint64_t)v52, 2u, "%s::%s: fwSrcPath memory alloc failed\n", v53, v54, v55, v56, v57, (char)"VinylFirmware");
      }
      CFRelease(v28);
      goto LABEL_35;
    }
    ACFULogging::handleMessage((uint64_t)v29, 2u, "%s::%s: digestRef memory alloc failed\n", v30, v31, v32, v33, v34, (char)"VinylFirmware");
  }
  uint64_t v51 = 0;
LABEL_35:
  CFRelease(MutableCopy);
LABEL_36:
  free(v6);
  return v51;
}

void sub_217B087BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
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
  CFTypeRef v47 = 0;
  LogInstance = ACFULogging::getLogInstance(this);
  std::string::basic_string[abi:ne180100]<0>(&v43, "VinylFirmware");
  long long v8 = std::string::append(&v43, "::");
  long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v44.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  uint64_t v10 = std::string::append(&v44, "getFileDataFromZip");
  long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  std::string::size_type v46 = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)LogInstance, (uint64_t *)__p, 4, (uint64_t)"getFileDataFromZip fwSrcPath: ", (uint64_t)a3);
  if (SHIBYTE(v46) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v44.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v43.__r_.__value_.__l.__data_);
  }
  uint64_t v13 = ACFULogging::getLogInstance(v12);
  std::string::basic_string[abi:ne180100]<0>(&v43, "VinylFirmware");
  uint64_t v14 = std::string::append(&v43, "::");
  long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v44.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  long long v16 = std::string::append(&v44, "getFileDataFromZip");
  long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  std::string::size_type v46 = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v13, (uint64_t *)__p, 4, (uint64_t)"getFileDataFromZip filePath: ", (uint64_t)a4);
  if (SHIBYTE(v46) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v44.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v43.__r_.__value_.__l.__data_);
  }
  long long v19 = "%s::%s: invalid params passed\n";
  if (!a2 || !a3 || !a4) {
    goto LABEL_28;
  }
  CFMutableDictionaryRef Mutable = (ACFULogging *)CFStringCreateMutable(0, 0);
  if (!Mutable)
  {
    long long v19 = "%s::%s: Unable to allocate memory for fullPath:\n";
LABEL_28:
    uint64_t v30 = ACFULogging::getLogInstance(Mutable);
    ACFULogging::handleMessage((uint64_t)v30, 2u, v19, v31, v32, v33, v34, v35, (char)"VinylFirmware");
    eUICCFwReaderClose(0);
    return 0;
  }
  long long v20 = (__CFString *)Mutable;
  CFStringAppend((CFMutableStringRef)Mutable, a3);
  CFStringAppend(v20, a4);
  long long v22 = ACFULogging::getLogInstance(v21);
  std::string::basic_string[abi:ne180100]<0>(&v43, "VinylFirmware");
  uint64_t v23 = std::string::append(&v43, "::");
  long long v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
  v44.__r_.__value_.__r.__words[2] = v23->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v24;
  v23->__r_.__value_.__l.__size_ = 0;
  v23->__r_.__value_.__r.__words[2] = 0;
  v23->__r_.__value_.__r.__words[0] = 0;
  uint64_t v25 = std::string::append(&v44, "getFileDataFromZip");
  long long v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
  std::string::size_type v46 = v25->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v26;
  v25->__r_.__value_.__l.__size_ = 0;
  v25->__r_.__value_.__r.__words[2] = 0;
  v25->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v22, (uint64_t *)__p, 4, (uint64_t)"getFileDataFromZip fullPath: ", (uint64_t)v20);
  if (SHIBYTE(v46) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v44.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v43.__r_.__value_.__l.__data_);
  }
  uint64_t v27 = (ACFULogging *)eUICCFwReaderOpen(a2);
  uint64_t v28 = v27;
  if (!v27)
  {
    int v36 = "%s::%s: Unable to unzip the fwdata:\n";
LABEL_31:
    long long v37 = ACFULogging::getLogInstance(v27);
    ACFULogging::handleMessage((uint64_t)v37, 2u, v36, v38, v39, v40, v41, v42, (char)"VinylFirmware");
    goto LABEL_25;
  }
  uint64_t v27 = eUICCFwReaderFindAndCopyFileData(v27, v20, &v47);
  if (v27)
  {
    int v36 = "%s::%s: Unable to copy the firmware:\n";
    goto LABEL_31;
  }
LABEL_25:
  eUICCFwReaderClose(v28);
  CFRelease(v20);
  return v47;
}

void sub_217B08B70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
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

uint64_t ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t VinylFirmware::createIm4p(ACFULogging *a1, ACFULogging *a2, uint64_t *a3, uint64_t *a4)
{
  values[2] = *(void **)MEMORY[0x263EF8340];
  v186 = 0;
  unsigned int v185 = 0;
  LogInstance = ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: %s\n", v7, v8, v9, v10, v11, (char)"VinylFirmware");
  uint64_t v12 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
  CFArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  CFMutableArrayRef v13 = CFArrayCreateMutable(0, 0, v12);
  CFMutableArrayRef v14 = v13;
  long long v15 = 0;
  values[0] = Mutable;
  values[1] = v13;
  uint64_t v16 = 1;
  if (!a2 || !a3) {
    goto LABEL_107;
  }
  long long v17 = 0;
  if (!a4) {
    goto LABEL_87;
  }
  long long v15 = 0;
  uint64_t v16 = 2;
  if (!Mutable)
  {
LABEL_107:
    long long v17 = 0;
    goto LABEL_87;
  }
  long long v17 = 0;
  if (!v13) {
    goto LABEL_87;
  }
  CFArrayRef theArray = v13;
  CFArrayRef v18 = CFArrayCreate(0, (const void **)values, 2, MEMORY[0x263EFFF70]);
  a3[6] = (uint64_t)v18;
  if (!v18) {
    goto LABEL_114;
  }
  v182[0] = a1;
  v182[1] = a3;
  long long v19 = (ACFULogging *)eUICCFwReaderStart(a2, (uint64_t (*)(uint64_t, CFStringRef, ACFULogging *))VinylFirmwareReaderInfoPlistCallback, (uint64_t)v182);
  uint64_t v16 = (uint64_t)v19;
  if (v19)
  {
    uint64_t v120 = ACFULogging::getLogInstance(v19);
    ACFULogging::handleMessage((uint64_t)v120, 2u, "%s::%s: failed to read zip file\n", v121, v122, v123, v124, v125, (char)"VinylFirmware");
LABEL_114:
    long long v17 = 0;
    long long v15 = 0;
LABEL_115:
    CFMutableArrayRef v14 = theArray;
    CFArrayRef v98 = Mutable;
    goto LABEL_88;
  }
  if (!a3[7])
  {
    uint64_t v126 = ACFULogging::getLogInstance(v19);
    ACFULogging::handleMessage((uint64_t)v126, 2u, "%s::%s: Failed to build vinyl info.plist dictionary\n", v127, v128, v129, v130, v131, (char)"VinylFirmware");
LABEL_113:
    uint64_t v16 = 0;
    goto LABEL_114;
  }
  uint64_t v16 = eUICCFwReaderStart(a2, (uint64_t (*)(uint64_t, CFStringRef, ACFULogging *))VinylFirmwareReaderCallback, (uint64_t)v182);
  long long v20 = ACFULogging::getLogInstance((ACFULogging *)v16);
  uint64_t v26 = (uint64_t)v20;
  if (v16)
  {
    ACFULogging::handleMessage((uint64_t)v20, 2u, "%s::%s: failed to read zip file\n", v21, v22, v23, v24, v25, (char)"VinylFirmware");
    goto LABEL_114;
  }
  std::string::basic_string[abi:ne180100]<0>(&v178, "VinylFirmware");
  uint64_t v27 = std::string::append(&v178, "::");
  long long v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
  v179.__r_.__value_.__r.__words[2] = v27->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v179.__r_.__value_.__l.__data_ = v28;
  v27->__r_.__value_.__l.__size_ = 0;
  v27->__r_.__value_.__r.__words[2] = 0;
  v27->__r_.__value_.__r.__words[0] = 0;
  long long v29 = std::string::append(&v179, "createIm4p");
  long long v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
  std::string::size_type v181 = v29->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v30;
  v29->__r_.__value_.__l.__size_ = 0;
  v29->__r_.__value_.__r.__words[2] = 0;
  v29->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType(v26, (uint64_t *)__p, 0, (uint64_t)"tag4cc : ", *a3);
  if (SHIBYTE(v181) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v179.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v179.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v178.__r_.__value_.__l.__data_);
  }
  uint64_t v32 = ACFULogging::getLogInstance(v31);
  std::string::basic_string[abi:ne180100]<0>(&v178, "VinylFirmware");
  uint64_t v33 = std::string::append(&v178, "::");
  long long v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
  v179.__r_.__value_.__r.__words[2] = v33->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v179.__r_.__value_.__l.__data_ = v34;
  v33->__r_.__value_.__l.__size_ = 0;
  v33->__r_.__value_.__r.__words[2] = 0;
  v33->__r_.__value_.__r.__words[0] = 0;
  uint64_t v35 = std::string::append(&v179, "createIm4p");
  long long v36 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
  std::string::size_type v181 = v35->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v36;
  v35->__r_.__value_.__l.__size_ = 0;
  v35->__r_.__value_.__r.__words[2] = 0;
  v35->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v32, (uint64_t *)__p, 0, (uint64_t)"filename : ", a3[1]);
  if (SHIBYTE(v181) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v179.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v179.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v178.__r_.__value_.__l.__data_);
  }
  uint64_t v38 = ACFULogging::getLogInstance(v37);
  std::string::basic_string[abi:ne180100]<0>(&v178, "VinylFirmware");
  uint64_t v39 = std::string::append(&v178, "::");
  long long v40 = *(_OWORD *)&v39->__r_.__value_.__l.__data_;
  v179.__r_.__value_.__r.__words[2] = v39->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v179.__r_.__value_.__l.__data_ = v40;
  v39->__r_.__value_.__l.__size_ = 0;
  v39->__r_.__value_.__r.__words[2] = 0;
  v39->__r_.__value_.__r.__words[0] = 0;
  uint64_t v41 = std::string::append(&v179, "createIm4p");
  CFArrayRef v42 = Mutable;
  long long v43 = *(_OWORD *)&v41->__r_.__value_.__l.__data_;
  std::string::size_type v181 = v41->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v43;
  v41->__r_.__value_.__l.__size_ = 0;
  v41->__r_.__value_.__r.__words[2] = 0;
  v41->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v38, (uint64_t *)__p, 0, (uint64_t)"plist_filename : ", a3[2]);
  if (SHIBYTE(v181) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v179.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v179.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v178.__r_.__value_.__l.__data_);
  }
  if (a3[3])
  {
    uint64_t v45 = ACFULogging::getLogInstance(v44);
    std::string::basic_string[abi:ne180100]<0>(&v178, "VinylFirmware");
    std::string::size_type v46 = std::string::append(&v178, "::");
    long long v47 = *(_OWORD *)&v46->__r_.__value_.__l.__data_;
    v179.__r_.__value_.__r.__words[2] = v46->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v179.__r_.__value_.__l.__data_ = v47;
    v46->__r_.__value_.__l.__size_ = 0;
    v46->__r_.__value_.__r.__words[2] = 0;
    v46->__r_.__value_.__r.__words[0] = 0;
    uint64_t v48 = std::string::append(&v179, "createIm4p");
    CFArrayRef v42 = Mutable;
    long long v49 = *(_OWORD *)&v48->__r_.__value_.__l.__data_;
    std::string::size_type v181 = v48->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v49;
    v48->__r_.__value_.__l.__size_ = 0;
    v48->__r_.__value_.__r.__words[2] = 0;
    v48->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v45, (uint64_t *)__p, 0, (uint64_t)"data : ", a3[3]);
    if (SHIBYTE(v181) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v179.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v179.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v178.__r_.__value_.__l.__data_);
    }
  }
  if (a3[4])
  {
    uint64_t v50 = ACFULogging::getLogInstance(v44);
    std::string::basic_string[abi:ne180100]<0>(&v178, "VinylFirmware");
    uint64_t v51 = std::string::append(&v178, "::");
    long long v52 = *(_OWORD *)&v51->__r_.__value_.__l.__data_;
    v179.__r_.__value_.__r.__words[2] = v51->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v179.__r_.__value_.__l.__data_ = v52;
    v51->__r_.__value_.__l.__size_ = 0;
    v51->__r_.__value_.__r.__words[2] = 0;
    v51->__r_.__value_.__r.__words[0] = 0;
    uint64_t v53 = std::string::append(&v179, "createIm4p");
    CFArrayRef v42 = Mutable;
    long long v54 = *(_OWORD *)&v53->__r_.__value_.__l.__data_;
    std::string::size_type v181 = v53->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v54;
    v53->__r_.__value_.__l.__size_ = 0;
    v53->__r_.__value_.__r.__words[2] = 0;
    v53->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v50, (uint64_t *)__p, 0, (uint64_t)"certIdToFind : ", a3[4]);
    if (SHIBYTE(v181) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v179.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v179.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v178.__r_.__value_.__l.__data_);
    }
  }
  if (a3[5])
  {
    uint64_t v55 = ACFULogging::getLogInstance(v44);
    std::string::basic_string[abi:ne180100]<0>(&v178, "VinylFirmware");
    uint64_t v56 = std::string::append(&v178, "::");
    long long v57 = *(_OWORD *)&v56->__r_.__value_.__l.__data_;
    v179.__r_.__value_.__r.__words[2] = v56->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v179.__r_.__value_.__l.__data_ = v57;
    v56->__r_.__value_.__l.__size_ = 0;
    v56->__r_.__value_.__r.__words[2] = 0;
    v56->__r_.__value_.__r.__words[0] = 0;
    uint64_t v58 = std::string::append(&v179, "createIm4p");
    CFArrayRef v42 = Mutable;
    long long v59 = *(_OWORD *)&v58->__r_.__value_.__l.__data_;
    std::string::size_type v181 = v58->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v59;
    v58->__r_.__value_.__l.__size_ = 0;
    v58->__r_.__value_.__r.__words[2] = 0;
    v58->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v55, (uint64_t *)__p, 0, (uint64_t)"tafwLdrVerToFindg4cc : ", a3[5]);
    if (SHIBYTE(v181) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v179.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v179.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v178.__r_.__value_.__l.__data_);
    }
  }
  if (a3[6])
  {
    long long v60 = ACFULogging::getLogInstance(v44);
    std::string::basic_string[abi:ne180100]<0>(&v178, "VinylFirmware");
    v61 = std::string::append(&v178, "::");
    long long v62 = *(_OWORD *)&v61->__r_.__value_.__l.__data_;
    v179.__r_.__value_.__r.__words[2] = v61->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v179.__r_.__value_.__l.__data_ = v62;
    v61->__r_.__value_.__l.__size_ = 0;
    v61->__r_.__value_.__r.__words[2] = 0;
    v61->__r_.__value_.__r.__words[0] = 0;
    uint64_t v63 = std::string::append(&v179, "createIm4p");
    CFArrayRef v42 = Mutable;
    long long v64 = *(_OWORD *)&v63->__r_.__value_.__l.__data_;
    std::string::size_type v181 = v63->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v64;
    v63->__r_.__value_.__l.__size_ = 0;
    v63->__r_.__value_.__r.__words[2] = 0;
    v63->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v60, (uint64_t *)__p, 0, (uint64_t)"array : ", a3[6]);
    if (SHIBYTE(v181) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v179.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v179.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v178.__r_.__value_.__l.__data_);
    }
  }
  Count = (ACFULogging *)CFArrayGetCount(v42);
  CFIndex v66 = (CFIndex)Count;
  if ((uint64_t)Count <= 0)
  {
    uint64_t v132 = ACFULogging::getLogInstance(Count);
    ACFULogging::handleMessage((uint64_t)v132, 2u, "%s::%s: No sources found \n", v133, v134, v135, v136, v137, (char)"VinylFirmware");
    goto LABEL_113;
  }
  uint64_t v67 = (ACFULogging *)CFArrayGetCount(theArray);
  if ((ACFULogging *)v66 != v67)
  {
    uint64_t v138 = ACFULogging::getLogInstance(v67);
    ACFULogging::handleMessage((uint64_t)v138, 2u, "%s::%s: Count of certID != hashVad \n", v139, v140, v141, v142, v143, (char)"VinylFirmware");
    goto LABEL_113;
  }
  long long v17 = (const void **)malloc(8 * v66);
  uint64_t v68 = (ACFULogging *)malloc(8 * v66);
  long long v15 = (const void **)v68;
  if (!v17 || !v68)
  {
    uint64_t v144 = ACFULogging::getLogInstance(v68);
    ACFULogging::handleMessage((uint64_t)v144, 2u, "%s::%s: Memory alloc failed certIds/VadDigest\n", v145, v146, v147, v148, v149, (char)"VinylFirmware");
    uint64_t v16 = 0;
    goto LABEL_115;
  }
  v188.location = 0;
  v188.length = v66;
  CFArrayGetValues(Mutable, v188, v17);
  v189.location = 0;
  v189.length = v66;
  CFArrayGetValues(theArray, v189, v15);
  DEREncoderCreate();
  DEREncoderCreate();
  uint64_t v69 = 0;
  do
  {
    DEREncoderCreate();
    uint64_t v70 = (CFDataRef *)&v17[v69];
    CFDataGetBytePtr(*v70);
    CFDataGetLength(*v70);
    uint64_t v71 = (ACFULogging *)DEREncoderAddData();
    if (v71)
    {
      uint64_t v102 = ACFULogging::getLogInstance(v71);
      ACFULogging::handleMessage((uint64_t)v102, 2u, "%s::%s: failed to add certId\n", v103, v104, v105, v106, v107, (char)"VinylFirmware");
LABEL_105:
      uint64_t v16 = 0;
LABEL_106:
      CFMutableArrayRef v14 = theArray;
      goto LABEL_87;
    }
    uint64_t v72 = (CFDataRef *)&v15[v69];
    CFDataGetBytePtr(*v72);
    CFDataGetLength(*v72);
    uint64_t v73 = (ACFULogging *)DEREncoderAddData();
    if (v73)
    {
      uint64_t v108 = ACFULogging::getLogInstance(v73);
      ACFULogging::handleMessage((uint64_t)v108, 2u, "%s::%s: failed to add VAD\n", v109, v110, v111, v112, v113, (char)"VinylFirmware");
      goto LABEL_105;
    }
    uint64_t v74 = (ACFULogging *)DEREncoderAddSequenceFromEncoder();
    if (v74)
    {
      uint64_t v114 = ACFULogging::getLogInstance(v74);
      ACFULogging::handleMessage((uint64_t)v114, 2u, "%s::%s: failed to add certId-VAD sequence\n", v115, v116, v117, v118, v119, (char)"VinylFirmware");
      goto LABEL_105;
    }
    DEREncoderDestroy();
    ++v69;
  }
  while (v66 != v69);
  uint64_t v75 = (ACFULogging *)DEREncoderAddSequenceFromEncoder();
  if (v75)
  {
    std::string::size_type v150 = ACFULogging::getLogInstance(v75);
    ACFULogging::handleMessage((uint64_t)v150, 2u, "%s::%s: failed to add top-level sequence\n", v151, v152, v153, v154, v155, (char)"VinylFirmware");
LABEL_119:
    uint64_t v16 = 3;
    goto LABEL_106;
  }
  DEREncoderDestroy();
  EncodedBuffer = (ACFULogging *)DEREncoderCreateEncodedBuffer();
  if (EncodedBuffer)
  {
    long long v156 = ACFULogging::getLogInstance(EncodedBuffer);
    ACFULogging::handleMessage((uint64_t)v156, 2u, "%s::%s: failed to encode DER buffer\n", v157, v158, v159, v160, v161, (char)"VinylFirmware");
    goto LABEL_119;
  }
  CFDataRef v77 = CFDataCreateWithBytesNoCopy(0, v186, v185, (CFAllocatorRef)*MEMORY[0x263EFFB18]);
  if (!v77)
  {
    uint64_t v16 = 2;
    goto LABEL_106;
  }
  if (!CFStringGetCString((CFStringRef)*a3, buffer, 5, 0x8000100u)) {
    goto LABEL_119;
  }
  int CString = (ACFULogging *)CFStringGetCString(@"1.0", v183, 5, 0x8000100u);
  if (!CString) {
    goto LABEL_119;
  }
  uint64_t v79 = ACFULogging::getLogInstance(CString);
  std::string::basic_string[abi:ne180100]<0>(&v178, "VinylFirmware");
  uint64_t v80 = std::string::append(&v178, "::");
  long long v81 = *(_OWORD *)&v80->__r_.__value_.__l.__data_;
  v179.__r_.__value_.__r.__words[2] = v80->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v179.__r_.__value_.__l.__data_ = v81;
  v80->__r_.__value_.__l.__size_ = 0;
  v80->__r_.__value_.__r.__words[2] = 0;
  v80->__r_.__value_.__r.__words[0] = 0;
  std::string v82 = std::string::append(&v179, "createIm4p");
  long long v83 = *(_OWORD *)&v82->__r_.__value_.__l.__data_;
  std::string::size_type v181 = v82->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v83;
  v82->__r_.__value_.__l.__size_ = 0;
  v82->__r_.__value_.__r.__words[2] = 0;
  v82->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v79, (uint64_t *)__p, 0, (uint64_t)"measurementSeq : ", (uint64_t)v77);
  if (SHIBYTE(v181) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v179.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v179.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v178.__r_.__value_.__l.__data_);
  }
  v84 = (void *)*((void *)a1 + 23);
  if (!v84)
  {
    v162 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v162, 2u, "%s::%s: failed to open libauthinstall dylib\n", v163, v164, v165, v166, v167, (char)"VinylFirmware");
LABEL_123:
    uint64_t v16 = 99;
    goto LABEL_106;
  }
  std::string::size_type v85 = dlsym(v84, "AMAuthInstallApImg4CreatePayload");
  CFDataRef v86 = dlerror();
  if (v86 || !v85)
  {
    v168 = ACFULogging::getLogInstance((ACFULogging *)v86);
    ACFULogging::handleMessage((uint64_t)v168, 2u, "%s::%s: failed to initialize LAI lib create function\n", v169, v170, v171, v172, v173, (char)"VinylFirmware");
    goto LABEL_123;
  }
  uint64_t v16 = ((uint64_t (*)(char *, char *, CFDataRef, void, void, uint64_t *))v85)(buffer, v183, v77, 0, 0, a4);
  uint64_t v87 = ACFULogging::getLogInstance((ACFULogging *)v16);
  uint64_t v93 = (uint64_t)v87;
  if (v16)
  {
    ACFULogging::handleMessage((uint64_t)v87, 0, "%s::%s: failed to create im4p\n", v88, v89, v90, v91, v92, (char)"VinylFirmware");
    goto LABEL_106;
  }
  std::string::basic_string[abi:ne180100]<0>(&v178, "VinylFirmware");
  v94 = std::string::append(&v178, "::");
  long long v95 = *(_OWORD *)&v94->__r_.__value_.__l.__data_;
  v179.__r_.__value_.__r.__words[2] = v94->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v179.__r_.__value_.__l.__data_ = v95;
  v94->__r_.__value_.__l.__size_ = 0;
  v94->__r_.__value_.__r.__words[2] = 0;
  v94->__r_.__value_.__r.__words[0] = 0;
  uint64_t v96 = std::string::append(&v179, "createIm4p");
  long long v97 = *(_OWORD *)&v96->__r_.__value_.__l.__data_;
  std::string::size_type v181 = v96->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v97;
  v96->__r_.__value_.__l.__size_ = 0;
  v96->__r_.__value_.__r.__words[2] = 0;
  v96->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType(v93, (uint64_t *)__p, 0, (uint64_t)"outPayload : ", *a4);
  CFMutableArrayRef v14 = theArray;
  if (SHIBYTE(v181) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v179.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v179.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v178.__r_.__value_.__l.__data_);
  }
  uint64_t v16 = 0;
LABEL_87:
  CFArrayRef v98 = Mutable;
  if (Mutable) {
LABEL_88:
  }
    CFRelease(v98);
  if (v14) {
    CFRelease(v14);
  }
  if (v17) {
    free(v17);
  }
  if (v15) {
    free(v15);
  }
  DEREncoderDestroy();
  DEREncoderDestroy();
  uint64_t v99 = (const void *)a3[6];
  if (v99)
  {
    CFRelease(v99);
    a3[6] = 0;
  }
  CFIndex v100 = (const void *)a3[7];
  if (v100)
  {
    CFRelease(v100);
    a3[7] = 0;
  }
  if (v186) {
    free(v186);
  }
  return v16;
}

void sub_217B09908(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34)
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

const void *VinylFirmware::getFwMac(VinylFirmware *this, CFDictionaryRef theDict)
{
  CFDataRef Value = CFDictionaryGetValue(theDict, @"com.apple.EmbeddedSoftwareRestore.eUICC.firmwareMac");
  if (Value)
  {
    CFTypeID TypeID = CFDataGetTypeID();
    CFIndex Length = (ACFULogging *)CFGetTypeID(Value);
    if ((ACFULogging *)TypeID == Length
      && (CFIndex Length = (ACFULogging *)CFDataGetLength((CFDataRef)Value), Length == (ACFULogging *)8))
    {
      LogInstance = ACFULogging::getLogInstance((ACFULogging *)8);
      std::string::basic_string[abi:ne180100]<0>(&v23, "VinylFirmware");
      uint64_t v6 = std::string::append(&v23, "::");
      long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
      v24.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v7;
      v6->__r_.__value_.__l.__size_ = 0;
      v6->__r_.__value_.__r.__words[2] = 0;
      v6->__r_.__value_.__r.__words[0] = 0;
      uint64_t v8 = std::string::append(&v24, "getFwMac");
      long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      std::string::size_type v26 = v8->__r_.__value_.__r.__words[2];
      long long v25 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      ACFULogging::handleMessageCFType((uint64_t)LogInstance, (uint64_t *)&v25, 0, (uint64_t)"fwMacData: ", (uint64_t)Value);
      if (SHIBYTE(v26) < 0) {
        operator delete((void *)v25);
      }
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v24.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v23.__r_.__value_.__l.__data_);
      }
    }
    else
    {
      uint64_t v11 = ACFULogging::getLogInstance(Length);
      ACFULogging::handleMessage((uint64_t)v11, 2u, "%s::%s: fwMacData is wrong type\n", v12, v13, v14, v15, v16, (char)"VinylFirmware");
    }
  }
  else
  {
    long long v17 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v17, 2u, "%s::%s: Missing firmwareMac in info.plist -- firmware too old\n", v18, v19, v20, v21, v22, (char)"VinylFirmware");
  }
  return Value;
}

void sub_217B09B28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
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
  LogInstance = ACFULogging::getLogInstance(this);
  std::string::basic_string[abi:ne180100]<0>(&v14, "VinylFirmware");
  uint64_t v3 = std::string::append(&v14, "::");
  long long v4 = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
  v15.__r_.__value_.__r.__words[2] = v3->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v4;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  uint64_t v5 = std::string::append(&v15, "getRecoveryFwData");
  long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
  std::string::size_type v17 = v5->__r_.__value_.__r.__words[2];
  long long v16 = v6;
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)LogInstance, (uint64_t *)&v16, 0, (uint64_t)"recoveryFwData : ", *((void *)this + 16));
  if (SHIBYTE(v17) < 0) {
    operator delete((void *)v16);
  }
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  uint64_t v8 = ACFULogging::getLogInstance(v7);
  std::string::basic_string[abi:ne180100]<0>(&v14, "VinylFirmware");
  long long v9 = std::string::append(&v14, "::");
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v15.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  uint64_t v11 = std::string::append(&v15, "getRecoveryFwData");
  long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  std::string::size_type v17 = v11->__r_.__value_.__r.__words[2];
  long long v16 = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v8, (uint64_t *)&v16, 0, (uint64_t)"fwData : ", *((void *)this + 15));
  if (SHIBYTE(v17) < 0) {
    operator delete((void *)v16);
  }
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  return *((void *)this + 16);
}

void sub_217B09D18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
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

BOOL VinylFirmwareReaderInfoPlistCallback(VinylFirmware *a1, CFStringRef theString, ACFULogging *a3)
{
  if (a1)
  {
    uint64_t v5 = (void *)*((void *)a1 + 1);
    return VinylFirmware::fwReaderInfoPlistCallback(a1, v5, theString, a3);
  }
  else
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: context passed is null\n", v8, v9, v10, v11, v12, (char)"VinylFirmware");
    return 0;
  }
}

uint64_t VinylFirmwareReaderCallback(VinylFirmware **a1, CFStringRef theString, ACFULogging *a3)
{
  if (a1)
  {
    uint64_t v5 = a1[1];
    long long v6 = *a1;
    return VinylFirmware::fwReaderCallback(v6, v5, theString, a3);
  }
  else
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: context passed is null\n", v9, v10, v11, v12, v13, (char)"VinylFirmware");
    return 0;
  }
}

CFStringRef VinylFirmware::getPathComponent(VinylFirmware *this, const __CFString *a2)
{
  if (!a2)
  {
    LogInstance = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: fullPath is null\n", v11, v12, v13, v14, v15, (char)"VinylFirmware");
    return 0;
  }
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFURLRef v3 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, kCFURLPOSIXPathStyle, 0);
  if (!v3)
  {
    long long v16 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v16, 2u, "%s::%s: failed to create fullURL\n", v17, v18, v19, v20, v21, (char)"VinylFirmware");
    return 0;
  }
  CFURLRef v4 = v3;
  CFURLRef PathComponent = CFURLCreateCopyDeletingLastPathComponent(v2, v3);
  if (!PathComponent)
  {
    uint64_t v22 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v22, 2u, "%s::%s: failed to create dirURL\n", v23, v24, v25, v26, v27, (char)"VinylFirmware");
    CFRelease(v4);
    return 0;
  }
  CFURLRef v6 = PathComponent;
  CFStringRef v7 = CFURLGetString(PathComponent);
  CFStringRef Copy = CFStringCreateCopy(v2, v7);
  if (!Copy)
  {
    long long v28 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v28, 2u, "%s::%s: failed to create dirPath\n", v29, v30, v31, v32, v33, (char)"VinylFirmware");
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
    LogInstance = ACFULogging::getLogInstance(Count);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: ldrVers count is zero\n", v14, v15, v16, v17, v18, (char)"VinylFirmware");
    return 1;
  }
  CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0);
  if (!ValueAtIndex)
  {
    uint64_t v19 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v19, 2u, "%s::%s: failed to get ldrVer\n", v20, v21, v22, v23, v24, (char)"VinylFirmware");
    return 1;
  }
  CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, ValueAtIndex, @".");
  if (!ArrayBySeparatingStrings)
  {
    uint64_t v25 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v25, 2u, "%s::%s: ldrVerComponents count is not expected\n", v26, v27, v28, v29, v30, (char)"VinylFirmware");
    return 1;
  }
  CFArrayRef v6 = ArrayBySeparatingStrings;
  CFStringRef v7 = (ACFULogging *)CFArrayGetCount(ArrayBySeparatingStrings);
  if (v7 == (ACFULogging *)2)
  {
    CFStringRef v8 = (const __CFString *)CFArrayGetValueAtIndex(v6, 0);
    IntCFDataRef Value = CFStringGetIntValue(v8);
    CFStringRef v10 = (const __CFString *)CFArrayGetValueAtIndex(v6, 1);
    BOOL v11 = (((unsigned __int16)CFStringGetIntValue(v10) | (unsigned __int16)(IntValue << 8)) & 0x7FFFu) < 0x301;
  }
  else
  {
    uint64_t v31 = ACFULogging::getLogInstance(v7);
    ACFULogging::handleMessage((uint64_t)v31, 2u, "%s::%s: ldrVerComponents count is not expected\n", v32, v33, v34, v35, v36, (char)"VinylFirmware");
    BOOL v11 = 1;
  }
  CFRelease(v6);
  return v11;
}

const __CFData *VinylFirmware::fwLdrVerEqual(VinylFirmware *this, CFArrayRef theArray, const UInt8 *a3)
{
  if (!theArray || (this = (VinylFirmware *)CFArrayGetCount(theArray), (uint64_t)this <= 0))
  {
    LogInstance = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: ldrVersStrArray count is zero\n", v15, v16, v17, v18, v19, (char)"VinylFirmware");
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
          BytePtr = CFDataGetBytePtr((CFDataRef)a3);
          a3 = BytePtr;
          if (!BytePtr)
          {
            uint64_t v45 = ACFULogging::getLogInstance(0);
            ACFULogging::handleMessage((uint64_t)v45, 2u, "%s::%s: failed to get byte ptr of fwldrver\n", v46, v47, v48, v49, v50, (char)"VinylFirmware");
            goto LABEL_17;
          }
          int v10 = *BytePtr;
          CFStringRef v11 = (const __CFString *)CFArrayGetValueAtIndex(v7, 0);
          if (CFStringGetIntValue(v11) == v10)
          {
            int v12 = a3[1];
            CFStringRef v13 = (const __CFString *)CFArrayGetValueAtIndex(v7, 1);
            a3 = (const UInt8 *)(CFStringGetIntValue(v13) == v12);
LABEL_17:
            CFRelease(v7);
            return (const __CFData *)a3;
          }
        }
        else
        {
          uint64_t v38 = ACFULogging::getLogInstance(Count);
          ACFULogging::handleMessage((uint64_t)v38, 2u, "%s::%s: ldrVerComponents count is not expected\n", v39, v40, v41, v42, v43, (char)"VinylFirmware");
        }
        a3 = 0;
        goto LABEL_17;
      }
      uint64_t v32 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v32, 2u, "%s::%s: ldrVerComponents count is not expected\n", v33, v34, v35, v36, v37, (char)"VinylFirmware");
    }
    else
    {
      uint64_t v26 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v26, 2u, "%s::%s: failed to get ldrVer\n", v27, v28, v29, v30, v31, (char)"VinylFirmware");
    }
    return 0;
  }
  uint64_t v20 = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)v20, 2u, "%s::%s: fwldrver is null\n", v21, v22, v23, v24, v25, (char)"VinylFirmware");
  return (const __CFData *)a3;
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
    LogInstance = ACFULogging::getLogInstance(v11);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to find and/or copy data\n", v17, v18, v19, v20, v21, (char)"VinylFirmware");
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
  uint64_t v69 = *MEMORY[0x263EF8340];
  CFTypeRef cf1 = 0;
  CFDataRef theData = 0;
  if (!a2 || !theString)
  {
    CFArrayRef ArrayBySeparatingStrings = 0;
LABEL_57:
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
LABEL_54:
    uint64_t v5 = 0;
    CFDataRef v4 = 0;
    CFArrayRef MutableCopy = 0;
    CFStringRef PathComponent = 0;
    goto LABEL_39;
  }
  CFPropertyListRef v13 = (void *)*((void *)this + 23);
  if (!v13)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to open libauthinstall dylib\n", v37, v38, v39, v40, v41, (char)"VinylFirmware");
    goto LABEL_54;
  }
  uint64_t v14 = (uint64_t (*)(void, const void *, CFTypeRef *))dlsym(v13, "AMAuthInstallSupportCopyDataFromHexString");
  uint64_t v15 = dlerror();
  if (v15 || !v14)
  {
    uint64_t v42 = ACFULogging::getLogInstance((ACFULogging *)v15);
    ACFULogging::handleMessage((uint64_t)v42, 2u, "%s::%s: failed to initialize LAI lib create function\n", v43, v44, v45, v46, v47, (char)"VinylFirmware");
    goto LABEL_54;
  }
  CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 0);
  int v17 = v14(0, ValueAtIndex, &cf1);
  CFDataRef v4 = 0;
  uint64_t v5 = 0;
  if (!cf1 || v17) {
    goto LABEL_57;
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
    goto LABEL_62;
  }
  BOOL v22 = VinylFirmware::checkVinylFwLdrVerLegacy(v21, v21);
  uint64_t v23 = (const void *)*((void *)a2 + 4);
  if (!v23)
  {
    CFDataRef v4 = 0;
    CFArrayRef MutableCopy = 0;
    goto LABEL_28;
  }
  uint64_t v24 = (const UInt8 *)*((void *)a2 + 5);
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
LABEL_62:
    uint64_t v5 = 0;
    CFDataRef v4 = 0;
    goto LABEL_39;
  }
  BytePtr = CFDataGetBytePtr(*((CFDataRef *)a2 + 5));
  CFIndex Length = CFDataGetLength(*((CFDataRef *)a2 + 5));
  CFDataAppendBytes(MutableCopy, BytePtr, Length - 1);
  CFDataGetBytePtr(MutableCopy);
  CFDataGetLength(MutableCopy);
  uint64_t v28 = (ACFULogging *)AMSupportDigestSha256();
  if (v28)
  {
    long long v60 = ACFULogging::getLogInstance(v28);
    ACFULogging::handleMessage((uint64_t)v60, 2u, "%s::%s: failed to compute digest\n", v61, v62, v63, v64, v65, (char)"VinylFirmware");
    goto LABEL_62;
  }
  CFDataRef v4 = CFDataCreate(0, bytes, 32);
  if (!v4) {
    goto LABEL_59;
  }
  if (CFEqual(cf1, v4))
  {
LABEL_27:
    uint64_t v29 = eUICCFwReaderFindAndCopyFileData(a4, theString, (CFTypeRef *)a2 + 3);
    if (v29)
    {
LABEL_58:
      uint64_t v48 = ACFULogging::getLogInstance(v29);
      ACFULogging::handleMessage((uint64_t)v48, 2u, "%s::%s: failed to find and/or copy data\n", v49, v50, v51, v52, v53, (char)"VinylFirmware");
      goto LABEL_59;
    }
  }
LABEL_28:
  CFArrayRef v30 = (const __CFArray *)*((void *)a2 + 6);
  if (!v30) {
    goto LABEL_38;
  }
  uint64_t v31 = (__CFArray *)CFArrayGetValueAtIndex(v30, 0);
  uint64_t v32 = (__CFArray *)CFArrayGetValueAtIndex(*((CFArrayRef *)a2 + 6), 1);
  uint64_t v5 = 0;
  if (v31)
  {
    uint64_t v33 = v32;
    if (v32)
    {
      if (cf1)
      {
        CFArrayAppendValue(v31, cf1);
        uint64_t v29 = eUICCFwReaderFindAndCopyFileData(a4, theString, (CFTypeRef *)&theData);
        if (!v29)
        {
          CFDataGetBytePtr(theData);
          CFDataGetLength(theData);
          uint64_t v34 = (ACFULogging *)AMSupportDigestSha256();
          if (v34)
          {
            long long v54 = ACFULogging::getLogInstance(v34);
            ACFULogging::handleMessage((uint64_t)v54, 2u, "%s::%s: failed to compute digest\n", v55, v56, v57, v58, v59, (char)"VinylFirmware");
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
          goto LABEL_59;
        }
        goto LABEL_58;
      }
LABEL_59:
      uint64_t v5 = 0;
    }
  }
LABEL_39:
  if (theData)
  {
    CFRelease(theData);
    CFDataRef theData = 0;
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

void VinylFirmware::generateMeasurement(VinylFirmware *this@<X0>, CFDataRef *a2@<X8>)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  LogInstance = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: %s\n", v6, v7, v8, v9, v10, (char)"VinylFirmware");
  *a2 = 0;
  CFDataGetBytePtr(this);
  CFDataGetLength(this);
  CFStringRef v11 = (ACFULogging *)AMSupportDigestSha256();
  if (v11)
  {
    uint64_t v26 = ACFULogging::getLogInstance(v11);
    ACFULogging::handleMessage((uint64_t)v26, 2u, "%s::%s: failed to compute digest\n", v27, v28, v29, v30, v31, (char)"VinylFirmware");
  }
  else
  {
    CFDataRef v12 = CFDataCreate(0, bytes, 32);
    *a2 = v12;
    __p[0] = 0;
    CFPropertyListRef v13 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
    uint64_t v14 = ACFULogging::getLogInstance((ACFULogging *)v13);
    std::string::basic_string[abi:ne180100]<0>(&v32, "VinylFirmware");
    uint64_t v15 = std::string::append(&v32, "::");
    long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
    v33.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v33.__r_.__value_.__l.__data_ = v16;
    v15->__r_.__value_.__l.__size_ = 0;
    v15->__r_.__value_.__r.__words[2] = 0;
    v15->__r_.__value_.__r.__words[0] = 0;
    int v17 = std::string::append(&v33, "generateMeasurement");
    long long v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
    std::string::size_type v35 = v17->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v18;
    v17->__r_.__value_.__l.__size_ = 0;
    v17->__r_.__value_.__r.__words[2] = 0;
    v17->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v14, (uint64_t *)__p, 0, (uint64_t)"digestRef: ", (uint64_t)v12);
    if (SHIBYTE(v35) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v33.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v32.__r_.__value_.__l.__data_);
    }
    uint64_t v20 = ACFULogging::getLogInstance(v19);
    ACFULogging::handleMessage((uint64_t)v20, 4u, "%s::%s: leaving: %s\n", v21, v22, v23, v24, v25, (char)"VinylFirmware");
  }
}

void sub_217B0AAA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
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
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(v30);
  _Unwind_Resume(a1);
}

const void **ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy(const void **a1)
{
  CFAllocatorRef v2 = (const void **)a1[1];
  if (*a1)
  {
    CFURLRef v3 = *v2;
    const void *v2 = *a1;
    uint64_t v6 = v3;
  }
  else
  {
    CFDataRef v4 = *v2;
    const void *v2 = 0;
    uint64_t v6 = v4;
  }
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&v6);
  return a1;
}

void _AMAuthInstallFinalize_cold_1()
{
  __assert_rtn("_AMAuthInstallFinalize", "AMAuthInstall.c", 686, "type != NULL");
}

void _AMAuthInstallCopyFormattingDescription_cold_1()
{
  __assert_rtn("_AMAuthInstallCopyFormattingDescription", "AMAuthInstall.c", 741, "type != NULL");
}

void AMAuthInstallApImg4Stitch_cold_1(uint64_t a1)
{
  CFAllocatorRef v2 = __error();
  char v3 = strerror(*v2);
  AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4Stitch", a1, v4, v5, v6, v7, v8, v3);
  perror("error:");
}

void AMAuthInstallApImg4Stitch_cold_2()
{
  v0 = __error();
  char v1 = strerror(*v0);
  AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4Stitch", (uint64_t)"failed to write img4 string to dst file: %s", v2, v3, v4, v5, v6, v1);
  perror("error:");
}

void AMAuthInstallApImg4Stitch_cold_3()
{
  v0 = __error();
  char v1 = strerror(*v0);
  AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4Stitch", (uint64_t)"failed to write header to dst file: %s", v2, v3, v4, v5, v6, v1);
  perror("error:");
}

void AMAuthInstallApImg4StitchRestoreInfoWithAMAI_cold_1()
{
  __assert_rtn("_AMAuthInstallApImg4CreateDefaultRestoreInfo", "AMAuthInstallApImg4.c", 1376, "item->objectTag != NULL");
}

void AMAuthInstallApImg4StitchRestoreInfoWithAMAI_cold_2()
{
  __assert_rtn("_AMAuthInstallApImg4CreateDefaultRestoreInfo", "AMAuthInstallApImg4.c", 1382, "defaultTag->tag != NULL");
}

void AMAuthInstallApImg4StitchRestoreInfoWithAMAI_cold_3()
{
  __assert_rtn("_AMAuthInstallApImg4CreateDefaultRestoreInfo", "AMAuthInstallApImg4.c", 1383, "defaultTag->copyValue != NULL");
}

void _AMAuthInstallCopyPsiMeasurementAndVersion_cold_1()
{
  __assert_rtn("_AMAuthInstallCopyPsiMeasurementAndVersion", "AMAuthInstallBasebandICE3.c", 135, "outPartialHash != NULL");
}

void _AMAuthInstallCopyPsiMeasurementAndVersion_cold_2()
{
  __assert_rtn("_AMAuthInstallCopyPsiMeasurementAndVersion", "AMAuthInstallBasebandICE3.c", 136, "outVersionStr != NULL");
}

void _AMAuthInstallBundlePopulatePersonalizedBundle_cold_1()
{
  __assert_rtn("_AMAuthInstallBundlePopulatePersonalizedBundle", "AMAuthInstallBundle.c", 2394, "entryName != NULL");
}

void _AMAuthInstallBundlePopulatePersonalizedBundle_cold_2()
{
  __assert_rtn("_AMAuthInstallBundlePopulatePersonalizedBundle", "AMAuthInstallBundle.c", 2544, "relativePath != NULL");
}

void _AMAuthInstallBundlePopulatePersonalizedBundle_cold_3()
{
  __assert_rtn("_AMAuthInstallBundlePopulatePersonalizedBundle", "AMAuthInstallBundle.c", 2465, "entryName != NULL");
}

void AMAuthInstallBundleSetPropertiesWithBoardConfig_cold_1()
{
  __assert_rtn("AMAuthInstallBundleSetPropertiesWithBoardConfig", "AMAuthInstallBundle.c", 4830, "variant != NULL");
}

void _DefaultLogHandler_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_217A74000, v0, OS_LOG_TYPE_FAULT, "%{public}s", v1, 0xCu);
}

void _DefaultLogHandler_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_217A74000, v0, OS_LOG_TYPE_ERROR, "%{public}s", v1, 0xCu);
}

void _DefaultLogHandler_cold_3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_217A74000, v0, OS_LOG_TYPE_DEBUG, "%{public}s", v1, 0xCu);
}

void _DefaultLogHandler_cold_4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_217A74000, v0, OS_LOG_TYPE_DEBUG, "%s", v1, 0xCu);
}

void _AMAuthInstallPlatformConstantsInitialize_cold_1()
{
  __assert_rtn("_AMAuthInstallPlatformTempDirURLInitialize", "AMAuthInstallPlatform.c", 714, "_tempDirURL != NULL");
}

void _CFDictionarySetInteger64_cold_1()
{
  __assert_rtn("_CFDictionarySetInteger64", "AMAuthInstallSupport.c", 222, "num != NULL");
}

void _CFDictionarySetInteger32_cold_1()
{
  __assert_rtn("_CFDictionarySetInteger32", "AMAuthInstallSupport.c", 233, "num != NULL");
}

void _AMAuthInstallUpdaterFinalize_cold_1()
{
  __assert_rtn("_AMAuthInstallUpdaterFinalize", "AMAuthInstallUpdater.c", 324, "type != NULL");
}

void DERDecoderInitialize_cold_1()
{
  __assert_rtn("DERDecoderInitialize", "DERDecoder.c", 348, "decoder != NULL");
}

void DERDecoderInitialize_cold_2()
{
  __assert_rtn("DERDecoderInitialize", "DERDecoder.c", 349, "buffer != NULL");
}

void DERDecoderInitialize_cold_3()
{
  __assert_rtn("DERDecoderInitialize", "DERDecoder.c", 350, "ioBufferLength != NULL");
}

void _DERDecodeTag_cold_1()
{
  __assert_rtn("_DERDecodeTag", "DERDecoder.c", 62, "buffer != NULL");
}

void _DERDecodeTag_cold_2()
{
  __assert_rtn("_DERDecodeTag", "DERDecoder.c", 63, "outTagClass != NULL");
}

void _DERDecodeTag_cold_3()
{
  __assert_rtn("_DERDecodeTag", "DERDecoder.c", 64, "outTag != NULL");
}

void _DERDecodeTag_cold_4()
{
  __assert_rtn("_DERDecodeTag", "DERDecoder.c", 65, "outIsConstructed != NULL");
}

void _DERDecodeTag_cold_5()
{
  __assert_rtn("_DERDecodeTag", "DERDecoder.c", 66, "outConsumed != NULL");
}

void _DERDecodeLength_cold_1()
{
  __assert_rtn("_DERDecodeLength", "DERDecoder.c", 146, "buffer != NULL");
}

void _DERDecodeLength_cold_2()
{
  __assert_rtn("_DERDecodeLength", "DERDecoder.c", 147, "outLength != NULL");
}

void _DERDecodeLength_cold_3()
{
  __assert_rtn("_DERDecodeLength", "DERDecoder.c", 148, "outConsumed != NULL");
}

void DERDecoderGetDataWithTag_cold_1()
{
  __assert_rtn("DERDecoderGetDataWithTag", "DERDecoder.c", 418, "decoder != NULL");
}

void DERDecoderGetDataWithTag_cold_2()
{
  __assert_rtn("DERDecoderGetDataWithTag", "DERDecoder.c", 434, "callbackData.foundItem.data != NULL");
}

void _DERDecoderTraverseAllItems_cold_1()
{
  __assert_rtn("_DERDecoderTraverseAllItems", "DERDecoder.c", 223, "decoder != NULL");
}

void _DERDecoderTraverseAllItems_cold_2()
{
}

void _DERDecoderTraverseAllItems_cold_3()
{
}

void DERDecoderGetEncodingWithTag_cold_1()
{
  __assert_rtn("DERDecoderGetEncodingWithTag", "DERDecoder.c", 468, "decoder != NULL");
}

void DERDecoderGetEncodingWithTag_cold_2()
{
  __assert_rtn("DERDecoderGetEncodingWithTag", "DERDecoder.c", 484, "callbackData.foundItem.buffer != NULL");
}

void _FlsParserFinalize()
{
  __assert_rtn("_FlsParserFinalize", "FlsParser.cpp", 125, "type != NULL");
}

void _FlsParserCopyFormattingDescription()
{
  __assert_rtn("_FlsParserCopyFormattingDescription", "FlsParser.cpp", 143, "type != NULL");
}

void _FlsParserCopyDebugDescription()
{
  __assert_rtn("_FlsParserCopyDebugDescription", "FlsParser.cpp", 159, "type != NULL");
}

uint64_t AMSupportCFDictionaryGetBoolean()
{
  return MEMORY[0x270F979A0]();
}

uint64_t AMSupportCFDictionarySetBoolean()
{
  return MEMORY[0x270F979A8]();
}

uint64_t AMSupportCFDictionarySetInteger32()
{
  return MEMORY[0x270F979B0]();
}

uint64_t AMSupportCopyDataFromAsciiEncodedHex()
{
  return MEMORY[0x270F979C0]();
}

uint64_t AMSupportCopyURLWithAppendedComponent()
{
  return MEMORY[0x270F979F8]();
}

uint64_t AMSupportCreateDataFromFileURL()
{
  return MEMORY[0x270F97A08]();
}

uint64_t AMSupportCreateErrorInternal()
{
  return MEMORY[0x270F97A20]();
}

uint64_t AMSupportCreateMergedDictionary()
{
  return MEMORY[0x270F97A28]();
}

uint64_t AMSupportCreateURLFromString()
{
  return MEMORY[0x270F97A38]();
}

uint64_t AMSupportDigestSha256()
{
  return MEMORY[0x270F97A50]();
}

uint64_t AMSupportFileURLExists()
{
  return MEMORY[0x270F97A80]();
}

uint64_t AMSupportGetValueForKeyPathInDict()
{
  return MEMORY[0x270F97A90]();
}

uint64_t AMSupportHttpSendSync()
{
  return MEMORY[0x270F97AA0]();
}

uint64_t AMSupportLogInternal()
{
  return MEMORY[0x270F97AC0]();
}

uint64_t AMSupportMakeDirectory()
{
  return MEMORY[0x270F97AD0]();
}

uint64_t AMSupportPlatformCopyURLWithAppendedComponent()
{
  return MEMORY[0x270F97AD8]();
}

uint64_t AMSupportPlatformFileURLExists()
{
  return MEMORY[0x270F97AE0]();
}

uint64_t AMSupportRemoveFile()
{
  return MEMORY[0x270F97AF8]();
}

uint64_t AMSupportSafeFree()
{
  return MEMORY[0x270F97B38]();
}

uint64_t AMSupportSafeRelease()
{
  return MEMORY[0x270F97B40]();
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

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AF0](data, *(void *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7AF8](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7B00](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B08](c, data, *(void *)&len);
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

unsigned __int8 *__cdecl CC_SHA512(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B68](data, *(void *)&len, md);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B70](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B78](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B80](c, data, *(void *)&len);
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x270EE4298](allocator, context);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x270EE42A8]();
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE42E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x270EE42F8](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4310](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE4338](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
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

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x270EE47B0](type_id);
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

void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range)
{
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

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
}

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
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

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x270EE4910](allocator, theDict);
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

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
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

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x270EE49D8](err);
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x270EE49E0]();
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFHTTPMessageRef CFHTTPMessageCreateRequest(CFAllocatorRef alloc, CFStringRef requestMethod, CFURLRef url, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x270EE2890](alloc, requestMethod, url, httpVersion);
}

void CFHTTPMessageSetBody(CFHTTPMessageRef message, CFDataRef bodyData)
{
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x270EE4BD8](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return (CFNumberFormatterRef)MEMORY[0x270EE4BF8](allocator, locale, style);
}

CFNumberRef CFNumberFormatterCreateNumberFromString(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFStringRef string, CFRange *rangep, CFOptionFlags options)
{
  return (CFNumberRef)MEMORY[0x270EE4C00](allocator, formatter, string, rangep, options);
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

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D20](allocator, propertyList, mutabilityOption);
}

CFPropertyListRef CFPropertyListCreateFromXMLData(CFAllocatorRef allocator, CFDataRef xmlData, CFOptionFlags mutabilityOption, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D30](allocator, xmlData, mutabilityOption, errorString);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
}

CFDataRef CFPropertyListCreateXMLData(CFAllocatorRef allocator, CFPropertyListRef propertyList)
{
  return (CFDataRef)MEMORY[0x270EE4D50](allocator, propertyList);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x270EE4ED0](mode, returnAfterSourceHandled, seconds);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
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

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x270EE5090](alloc, theArray, separatorString);
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

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE50F0](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x270EE5118](alloc, formatOptions, format, arguments);
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

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5160](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x270EE51C8](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x270EE5210]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x270EE5228](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x270EE5230](theString, suffix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

void CFStringPad(CFMutableStringRef theString, CFStringRef padString, CFIndex length, CFIndex indexIntoPad)
{
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x270EE5328](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x270EE5338](url);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x270EE5350](url);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5368](anURL);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE5390](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyAppendingPathExtension(CFAllocatorRef allocator, CFURLRef url, CFStringRef extension)
{
  return (CFURLRef)MEMORY[0x270EE5398](allocator, url, extension);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x270EE53A0](allocator, url);
}

CFURLRef CFURLCreateCopyDeletingPathExtension(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x270EE53A8](allocator, url);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53C0](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE5400](allocator, URLString, baseURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE5430](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5440](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x270EE5448]();
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x270EE5450](anURL);
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

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x270EE54B8](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFDictionaryRef CFUserNotificationGetResponseDictionary(CFUserNotificationRef userNotification)
{
  return (CFDictionaryRef)MEMORY[0x270EE54E8](userNotification);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE5500](userNotification, responseFlags, timeout);
}

uint64_t DEREncoderAddData()
{
  return MEMORY[0x270F97B70]();
}

uint64_t DEREncoderAddDataFromEncoderNoCopy()
{
  return MEMORY[0x270F97B80]();
}

uint64_t DEREncoderAddDataNoCopy()
{
  return MEMORY[0x270F97B88]();
}

uint64_t DEREncoderAddPrivateFromEncoder()
{
  return MEMORY[0x270F97B90]();
}

uint64_t DEREncoderAddSequenceFromEncoder()
{
  return MEMORY[0x270F97B98]();
}

uint64_t DEREncoderAddSetFromEncoder()
{
  return MEMORY[0x270F97BA0]();
}

uint64_t DEREncoderAddUInt32()
{
  return MEMORY[0x270F97BA8]();
}

uint64_t DEREncoderAddUInt64()
{
  return MEMORY[0x270F97BB0]();
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

uint64_t DeviceIdentityCreateClientCertificateRequest()
{
  return MEMORY[0x270F25E58]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x270EFD988](query, attributesToUpdate);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x270EE55F0]();
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

std::string::size_type std::string::rfind(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x270F98240](this, __c, __pos);
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

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984E0](this, __pos, __s);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x270F98548](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
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

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98B78](__str, __idx, *(void *)&__base);
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

unint64_t std::stoul(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98BC8](__str, __idx, *(void *)&__base);
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E28](retstr, __val);
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

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x270F98F30](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x270ED8480](a1, *(void *)&a2);
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
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

uint64_t ccdigest()
{
  return MEMORY[0x270ED8A40]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x270ED8D70]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x270ED8D78]();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

int feof(FILE *a1)
{
  return MEMORY[0x270ED9910](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x270ED9918](a1);
}

FILE *__cdecl fmemopen(void *__buf, size_t __size, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99C8](__buf, __size, __mode);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
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

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
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

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
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

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDA120](a1, a2);
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

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x270EDA528](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
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

void perror(const char *a1)
{
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDB128](a1);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDB150](__ptr, __size);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x270EDB1E8](__p, __ec);
}

void rewind(FILE *a1)
{
}

int rmdir(const char *a1)
{
  return MEMORY[0x270EDB268](a1);
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

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
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

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x270EDB650](__s1, __n);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x270EDB688](__stringp, __delim);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB770](a1, a2);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x270EDB7C8](*(void *)&a1);
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

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x270EDBA30](in, uu);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA58](a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}