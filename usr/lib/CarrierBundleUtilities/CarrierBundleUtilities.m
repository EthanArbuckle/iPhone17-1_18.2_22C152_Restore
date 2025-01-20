void ComputeHash::ComputeHash(ComputeHash *this)
{
  *(void *)this = &unk_26D1919F8;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((_DWORD *)this + 2) = 2;
}

{
  *(void *)this = &unk_26D1919F8;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((_DWORD *)this + 2) = 2;
}

void ComputeHash::setDigestGenerator(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v2 = a2[1];
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  v4 = *(std::__shared_weak_count **)(a1 + 24);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v2;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

uint64_t ComputeHash::init(ComputeHash *this)
{
  if (*((_DWORD *)this + 2) != 2
    || ((***((uint64_t (****)(void))this + 2))(*((void *)this + 2)) & 0x80000000) != 0)
  {
    return 0;
  }
  *((_DWORD *)this + 2) = 0;
  return 1;
}

const UInt8 *ComputeHash::digest_file(ComputeHash *this, FileSystemManager *a2)
{
  if (*((_DWORD *)this + 2)) {
    return 0;
  }
  FileSystemManager::fileContentsAtPath((uint64_t)a2, &cf);
  CFTypeRef v5 = cf;
  if (cf) {
    CFRetain(cf);
  }
  uint64_t v2 = ComputeHash::digest_data((uint64_t)this, (CFDataRef *)&v5);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v5);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&cf);
  return v2;
}

void sub_21FDC69CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

const UInt8 *ComputeHash::digest_data(uint64_t a1, CFDataRef *a2)
{
  if (*(_DWORD *)(a1 + 8)) {
    return 0;
  }
  if (!(*a2
       ? ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get
       : 0))
    return 0;
  CFIndex Length = CFDataGetLength(*a2);
  result = CFDataGetBytePtr(*a2);
  if (result) {
    return (const UInt8 *)((*(int (**)(void, const UInt8 *, CFIndex))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), result, Length) >= 0);
  }
  return result;
}

BOOL ComputeHash::digest_length(ComputeHash *this, unsigned int a2)
{
  unsigned int v3 = bswap32(a2);
  return !*((_DWORD *)this + 2)
      && (*(int (**)(void, unsigned int *, uint64_t))(**((void **)this + 2) + 8))(*((void *)this + 2), &v3, 4) >= 0;
}

BOOL ComputeHash::digest_string(uint64_t a1, CFStringRef *a2)
{
  if (*(_DWORD *)(a1 + 8)) {
    return 0;
  }
  CFIndex Length = CFStringGetLength(*a2);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  v7 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding, 0x180DA719uLL);
  if (!v7) {
    return 0;
  }
  v8 = v7;
  CFIndex usedBufLen = 0;
  v13.location = 0;
  v13.length = Length;
  CFIndex Bytes = CFStringGetBytes(*a2, v13, 0x8000100u, 0, 0, v7, MaximumSizeForEncoding, &usedBufLen);
  BOOL v2 = 0;
  if (Bytes == Length)
  {
    unsigned int v12 = bswap32(usedBufLen);
    BOOL v2 = !*(_DWORD *)(a1 + 8)
      && ((*(uint64_t (**)(void, unsigned int *, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), &v12, 4) & 0x80000000) == 0&& (*(int (**)(void, UInt8 *, void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), v8, usedBufLen) >= 0;
  }
  free(v8);
  return v2;
}

uint64_t ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get(uint64_t a1)
{
  return *(void *)a1;
}

const UInt8 *ComputeHash::digest_data_xml(uint64_t a1, CFDataRef *a2)
{
  if (*(_DWORD *)(a1 + 8)) {
    return 0;
  }
  if (!(*a2
       ? ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get
       : 0))
    return 0;
  CFIndex Length = CFDataGetLength(*a2);
  unsigned int v7 = bswap32(Length);
  if (!*(_DWORD *)(a1 + 8)) {
    (*(void (**)(void, unsigned int *, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), &v7, 4);
  }
  result = CFDataGetBytePtr(*a2);
  if (result) {
    return (const UInt8 *)((*(int (**)(void, const UInt8 *, CFIndex))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), result, Length) >= 0);
  }
  return result;
}

const UInt8 *ComputeHash::digest_plist_file(ComputeHash *this, char *a2)
{
  if (*((_DWORD *)this + 2)) {
    return 0;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  CFDataRef v4 = FileSystemManager::copyBinaryPlistAsXML((uint64_t)__p);
  CFDataRef v10 = v4;
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  if (v4) {
    CFTypeRef v5 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  }
  else {
    CFTypeRef v5 = 0;
  }
  if (v5)
  {
    CFDataRef v7 = v4;
    if (v4) {
      CFRetain(v4);
    }
    BOOL v2 = ComputeHash::digest_data((uint64_t)this, &v7);
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v7);
  }
  else
  {
    BOOL v2 = 0;
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v10);
  return v2;
}

void sub_21FDC6E00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a10);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v16 - 24));
  _Unwind_Resume(a1);
}

uint64_t ComputeHash::digest_files(ComputeHash *a1, uint64_t a2)
{
  if (!*((_DWORD *)a1 + 2))
  {
    char v5 = 0;
    uint64_t v6 = *(void *)(a2 + 8);
    while (1)
    {
      if (v6 == a2)
      {
LABEL_18:
        char v2 = v5 ^ 1;
        return v2 & 1;
      }
      memset(&v12, 0, sizeof(v12));
      CFDataRef v7 = (FileSystemManager *)(v6 + 16);
      FileSystemManager::getFileExtension((uint64_t *)(v6 + 16));
      int v8 = std::string::compare(&v12, "plist");
      int v9 = *(char *)(v6 + 39);
      if (v8)
      {
        if (v9 < 0) {
          CFDataRef v7 = *(FileSystemManager **)v7;
        }
        if (!ComputeHash::digest_file(a1, v7)) {
          goto LABEL_13;
        }
      }
      else
      {
        if (v9 < 0) {
          CFDataRef v7 = *(FileSystemManager **)v7;
        }
        if ((ComputeHash::digest_plist_file(a1, (char *)v7) & 1) == 0)
        {
LABEL_13:
          char v10 = 0;
          char v5 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v6 = *(void *)(v6 + 8);
      char v10 = 1;
LABEL_14:
      if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v12.__r_.__value_.__l.__data_);
        if ((v10 & 1) == 0) {
          goto LABEL_18;
        }
      }
      else if ((v10 & 1) == 0)
      {
        goto LABEL_18;
      }
    }
  }
  char v2 = 0;
  return v2 & 1;
}

void sub_21FDC6F2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL ComputeHash::digest_BOOL(uint64_t a1, const void **a2)
{
  if (*(_DWORD *)(a1 + 8)) {
    return 0;
  }
  char v5 = *a2;
  if (*a2) {
    uint64_t v6 = ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::get;
  }
  else {
    uint64_t v6 = 0;
  }
  if (v6)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 != CFBooleanGetTypeID()) {
      return 0;
    }
    char v5 = *a2;
  }
  Boolean Value = CFBooleanGetValue((CFBooleanRef)v5);
  return (*(unsigned int (**)(void, Boolean *, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), &Value, 1) != 0;
}

uint64_t ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ComputeHash::digest_number(uint64_t a1, CFNumberRef *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!*(_DWORD *)(a1 + 8) && !CFNumberIsFloatType(*a2))
  {
    CFIndex ByteSize = CFNumberGetByteSize(*a2);
    if (ByteSize >= 9)
    {
      unsigned int v7 = bswap32(ByteSize);
      if (!*(_DWORD *)(a1 + 8)) {
        (*(void (**)(void, unsigned int *, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), &v7, 4);
      }
      CFNumberType Type = CFNumberGetType(*a2);
      CFNumberGetValue(*a2, Type, &v7);
    }
  }
  return 0;
}

const UInt8 *ComputeHash::digest_date(uint64_t a1, const void **a2)
{
  if (!*(_DWORD *)(a1 + 8))
  {
    CFTypeRef cf = 0;
    char v5 = *a2;
    if (v5) {
      uint64_t v6 = ctu::SharedRef<__CFDate const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDate const>::get;
    }
    else {
      uint64_t v6 = 0;
    }
    if (!v6)
    {
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 != CFDateGetTypeID()) {
        goto LABEL_16;
      }
      char v5 = *a2;
    }
    CFDataRef Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x263EFFB08], v5, kCFPropertyListXMLFormat_v1_0, 0, 0);
    CFTypeRef v9 = cf;
    CFTypeRef cf = Data;
    v14 = v9;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v14);
    if (cf) {
      char v10 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
    }
    else {
      char v10 = 0;
    }
    if (v10)
    {
      CFTypeRef v12 = cf;
      if (cf) {
        CFRetain(cf);
      }
      char v2 = ComputeHash::digest_data(a1, (CFDataRef *)&v12);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v12);
      goto LABEL_17;
    }
LABEL_16:
    char v2 = 0;
LABEL_17:
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&cf);
    return v2;
  }
  return 0;
}

void sub_21FDC71FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  unsigned int v3 = va_arg(va1, const void *);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va1);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFDate const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDate const>::get(uint64_t a1)
{
  return *(void *)a1;
}

BOOL ComputeHash::digest_array(uint64_t a1, CFArrayRef *a2)
{
  if (*(_DWORD *)(a1 + 8)) {
    return 0;
  }
  v31 = 0;
  CFIndex Count = CFArrayGetCount(*a2);
  MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], Count, *a2);
  CFMutableArrayRef theArray = MutableCopy;
  if (MutableCopy) {
    CFTypeID v7 = ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::get;
  }
  else {
    CFTypeID v7 = 0;
  }
  if (v7) {
    BOOL v8 = Count < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    BOOL v2 = 0;
    goto LABEL_36;
  }
  ValueAtIndex = CFArrayGetValueAtIndex(MutableCopy, 0);
  ctu::cf::CFSharedRef<void const>::operator=(&v31, &ValueAtIndex);
  CFTypeID v9 = CFGetTypeID(v31);
  CFTypeID TypeID = CFStringGetTypeID();
  CFTypeID v11 = CFDictionaryGetTypeID();
  CFTypeID v12 = CFNumberGetTypeID();
  CFTypeID v13 = CFBooleanGetTypeID();
  CFTypeID v21 = CFDataGetTypeID();
  CFTypeID v20 = CFDateGetTypeID();
  CFTypeID v19 = CFArrayGetTypeID();
  v14 = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))MEMORY[0x263EFF3C0];
  if (v9 == TypeID
    || (v14 = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))MEMORY[0x263EFF3A8], v9 == v12)
    || (v14 = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))MEMORY[0x263EFF388], v9 == v20))
  {
    v32.location = 0;
    v32.length = Count;
    CFArraySortValues(theArray, v32, v14, 0);
  }
  BOOL v2 = 0;
  CFIndex v15 = 0;
  unsigned __int8 v16 = 0;
  while (1)
  {
    v17 = CFArrayGetValueAtIndex(theArray, v15);
    ValueAtIndex = v17;
    if (v17) {
      CFRetain(v17);
    }
    if (v9 == TypeID)
    {
      ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(&v28, &ValueAtIndex);
      unsigned __int8 v16 = ComputeHash::digest_string(a1, (CFStringRef *)&v28);
      ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v28);
      goto LABEL_32;
    }
    if (v9 != v11) {
      break;
    }
    ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(&v27, &ValueAtIndex);
    unsigned __int8 v16 = ComputeHash::digest_dictionary(a1, &v27);
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v27);
LABEL_32:
    ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&ValueAtIndex);
    if (v16)
    {
      BOOL v2 = ++v15 >= Count;
      unsigned __int8 v16 = 1;
      if (Count != v15) {
        continue;
      }
    }
    goto LABEL_36;
  }
  if (v9 != v12)
  {
    if (v9 == v13)
    {
      ctu::cf::CFSharedRef<__CFBoolean const>::CFSharedRef<void const,void>(&v25, &ValueAtIndex);
      unsigned __int8 v16 = ComputeHash::digest_BOOL(a1, &v25);
      ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef(&v25);
    }
    else if (v9 == v21)
    {
      ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&v24, &ValueAtIndex);
      unsigned __int8 v16 = ComputeHash::digest_data_xml(a1, (CFDataRef *)&v24);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v24);
    }
    else if (v9 == v20)
    {
      ctu::cf::CFSharedRef<__CFDate const>::CFSharedRef<void const,void>(&v23, &ValueAtIndex);
      unsigned __int8 v16 = ComputeHash::digest_date(a1, &v23);
      ctu::SharedRef<__CFDate const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDate const>::~SharedRef(&v23);
    }
    else if (v9 == v19)
    {
      ctu::cf::CFSharedRef<__CFArray const>::CFSharedRef<void const,void>(&v22, &ValueAtIndex);
      unsigned __int8 v16 = ComputeHash::digest_array(a1, &v22);
      ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef(&v22);
    }
    goto LABEL_32;
  }
  ctu::cf::CFSharedRef<__CFNumber const>::CFSharedRef<void const,void>(&v26, &ValueAtIndex);
  ComputeHash::digest_number(a1, (CFNumberRef *)&v26);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&v26);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&ValueAtIndex);
LABEL_36:
  ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)&theArray);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&v31);
  return v2;
}

void sub_21FDC754C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va2, a9);
  va_start(va1, a9);
  va_start(va, a9);
  CFTypeID v11 = va_arg(va1, const void *);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  va_copy(va2, va1);
  CFIndex v15 = va_arg(va2, const void *);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)va);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)va1);
  ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)va2);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v9 - 88));
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::get(uint64_t a1)
{
  return *(void *)a1;
}

const void **ctu::cf::CFSharedRef<void const>::operator=(const void **a1, CFTypeRef *a2)
{
  CFTypeRef v3 = *a2;
  if (*a2) {
    CFRetain(*a2);
  }
  CFDataRef v4 = *a1;
  *a1 = v3;
  uint64_t v6 = v4;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&v6);
  return a1;
}

BOOL ComputeHash::digest_dictionary(uint64_t a1, CFDictionaryRef *a2)
{
  if (*(_DWORD *)(a1 + 8)) {
    return 0;
  }
  if (!(*a2
       ? ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get
       : 0))
  {
    return 0;
  }
  else
  {
    CFIndex Count = CFDictionaryGetCount(*a2);
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], Count, MEMORY[0x263EFFF70]);
    CFDictionaryApplyFunction(*a2, (CFDictionaryApplierFunction)add_key, Mutable);
    uint64_t v7 = CFArrayGetCount(Mutable);
    v31.location = 0;
    v31.length = v7;
    CFArraySortValues(Mutable, v31, MEMORY[0x263EFF3C0], 0);
    if (v7 < 1)
    {
      BOOL v2 = 1;
    }
    else
    {
      BOOL v2 = 0;
      CFIndex v8 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(Mutable, v8);
        v29 = ValueAtIndex;
        if (ValueAtIndex)
        {
          CFRetain(ValueAtIndex);
          v28 = v29;
          if (v29) {
            CFRetain(v29);
          }
        }
        else
        {
          v28 = 0;
        }
        BOOL v10 = ComputeHash::digest_string(a1, (CFStringRef *)&v28);
        ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v28);
        if (!v10) {
          break;
        }
        Boolean Value = CFDictionaryGetValue(*a2, v29);
        CFTypeRef cf = Value;
        if (Value)
        {
          CFRetain(Value);
          Boolean Value = cf;
        }
        CFTypeID v12 = CFGetTypeID(Value);
        if (v12 == CFStringGetTypeID())
        {
          ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(&v26, &cf);
          BOOL v13 = ComputeHash::digest_string(a1, (CFStringRef *)&v26);
          ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v26);
          if (!v13) {
            goto LABEL_38;
          }
        }
        else if (v12 == CFDictionaryGetTypeID())
        {
          ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(&v25, &cf);
          char v14 = ComputeHash::digest_dictionary(a1, &v25);
          ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v25);
          if ((v14 & 1) == 0) {
            goto LABEL_38;
          }
        }
        else
        {
          if (v12 == CFNumberGetTypeID())
          {
            ctu::cf::CFSharedRef<__CFNumber const>::CFSharedRef<void const,void>(&v24, &cf);
            ComputeHash::digest_number(a1, (CFNumberRef *)&v24);
            ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&v24);
LABEL_38:
            ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&cf);
            break;
          }
          if (v12 == CFBooleanGetTypeID())
          {
            ctu::cf::CFSharedRef<__CFBoolean const>::CFSharedRef<void const,void>(&v23, &cf);
            BOOL v15 = ComputeHash::digest_BOOL(a1, &v23);
            ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef(&v23);
            if (!v15) {
              goto LABEL_38;
            }
          }
          else if (v12 == CFDataGetTypeID())
          {
            ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&v22, &cf);
            unsigned __int8 v16 = ComputeHash::digest_data_xml(a1, (CFDataRef *)&v22);
            ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v22);
            if ((v16 & 1) == 0) {
              goto LABEL_38;
            }
          }
          else if (v12 == CFDateGetTypeID())
          {
            ctu::cf::CFSharedRef<__CFDate const>::CFSharedRef<void const,void>(&v21, &cf);
            unsigned __int8 v17 = ComputeHash::digest_date(a1, &v21);
            ctu::SharedRef<__CFDate const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDate const>::~SharedRef(&v21);
            if ((v17 & 1) == 0) {
              goto LABEL_38;
            }
          }
          else if (v12 == CFArrayGetTypeID())
          {
            ctu::cf::CFSharedRef<__CFArray const>::CFSharedRef<void const,void>(&v20, &cf);
            BOOL v18 = ComputeHash::digest_array(a1, (CFArrayRef *)&v20);
            ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef(&v20);
            if (!v18) {
              goto LABEL_38;
            }
          }
        }
        ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&cf);
        ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v29);
        BOOL v2 = ++v8 >= v7;
        if (v7 == v8) {
          goto LABEL_40;
        }
      }
      ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v29);
    }
LABEL_40:
    ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)&Mutable);
  }
  return v2;
}

void sub_21FDC7980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va1, a6);
  va_start(va, a6);
  CFIndex v8 = va_arg(va1, const void *);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)va);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)va1);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)(v6 - 64));
  ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)(v6 - 56));
  _Unwind_Resume(a1);
}

void add_key(const void *a1, const void *a2, __CFArray *a3)
{
  if (!CFEqual(a1, @"signature"))
  {
    CFArrayAppendValue(a3, a1);
  }
}

uint64_t ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ComputeHash::finalize@<X0>(ComputeHash *this@<X0>, CFDataRef *a2@<X8>)
{
  v8[1] = *(const void **)MEMORY[0x263EF8340];
  *a2 = 0;
  size_t v4 = (*(unsigned __int8 (**)(void))(**((void **)this + 2) + 24))(*((void *)this + 2));
  uint64_t result = MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)v8 - v6;
  if (!*((_DWORD *)this + 2))
  {
    bzero(v7, v4);
    uint64_t result = (*(uint64_t (**)(void, char *))(**((void **)this + 2) + 16))(*((void *)this + 2), v7);
    if ((result & 0x80000000) == 0)
    {
      *a2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)v7, v4);
      v8[0] = 0;
      uint64_t result = (uint64_t)ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v8);
      *((_DWORD *)this + 2) = 1;
    }
  }
  return result;
}

void sub_21FDC7BD4(_Unwind_Exception *a1)
{
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v1);
  _Unwind_Resume(a1);
}

uint64_t ComputeHash::reset_state(uint64_t this)
{
  *(_DWORD *)(this + 8) = 2;
  return this;
}

uint64_t ComputeHash::get_digest_size(ComputeHash *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 2) + 24))();
}

void ComputeHash::~ComputeHash(ComputeHash *this)
{
  *(void *)this = &unk_26D1919F8;
  v1 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;

  *(void *)this = &unk_26D1919F8;
  v1 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void __clang_call_terminate(void *a1)
{
}

const void **ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(const void **a1)
{
  BOOL v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(const void **a1)
{
  BOOL v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(const void **a1)
{
  BOOL v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(const void **a1)
{
  BOOL v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef(const void **a1)
{
  BOOL v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFDate const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDate const>::~SharedRef(const void **a1)
{
  BOOL v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef(const void **a1)
{
  BOOL v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(const void **a1)
{
  BOOL v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef(const void **a1)
{
  BOOL v2 = *a1;
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

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264538250, MEMORY[0x263F8C060]);
}

void sub_21FDC7FB4(_Unwind_Exception *a1)
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
      size_t v5 = v3;
    }
    else {
      size_t v5 = 0;
    }
  }
  else
  {
    size_t v5 = 0;
  }

  return ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::SharedRef(a1, v5);
}

void *ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::SharedRef(void *a1, CFTypeRef cf)
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
      size_t v5 = v3;
    }
    else {
      size_t v5 = 0;
    }
  }
  else
  {
    size_t v5 = 0;
  }

  return ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(a1, v5);
}

void *ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(void *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf) {
    CFRetain(cf);
  }
  return a1;
}

void *ctu::cf::CFSharedRef<__CFNumber const>::CFSharedRef<void const,void>(void *a1, CFTypeRef *a2)
{
  CFTypeRef v3 = *a2;
  if (*a2)
  {
    CFTypeID v4 = CFGetTypeID(*a2);
    if (v4 == CFNumberGetTypeID()) {
      size_t v5 = v3;
    }
    else {
      size_t v5 = 0;
    }
  }
  else
  {
    size_t v5 = 0;
  }

  return ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::SharedRef(a1, v5);
}

void *ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::SharedRef(void *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf) {
    CFRetain(cf);
  }
  return a1;
}

void *ctu::cf::CFSharedRef<__CFBoolean const>::CFSharedRef<void const,void>(void *a1, CFTypeRef *a2)
{
  CFTypeRef v3 = *a2;
  if (*a2)
  {
    CFTypeID v4 = CFGetTypeID(*a2);
    if (v4 == CFBooleanGetTypeID()) {
      size_t v5 = v3;
    }
    else {
      size_t v5 = 0;
    }
  }
  else
  {
    size_t v5 = 0;
  }

  return ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::SharedRef(a1, v5);
}

void *ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::SharedRef(void *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf) {
    CFRetain(cf);
  }
  return a1;
}

void *ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(void *a1, CFTypeRef *a2)
{
  CFTypeRef v3 = *a2;
  if (*a2)
  {
    CFTypeID v4 = CFGetTypeID(*a2);
    if (v4 == CFDataGetTypeID()) {
      size_t v5 = v3;
    }
    else {
      size_t v5 = 0;
    }
  }
  else
  {
    size_t v5 = 0;
  }

  return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(a1, v5);
}

void *ctu::cf::CFSharedRef<__CFDate const>::CFSharedRef<void const,void>(void *a1, CFTypeRef *a2)
{
  CFTypeRef v3 = *a2;
  if (*a2)
  {
    CFTypeID v4 = CFGetTypeID(*a2);
    if (v4 == CFDateGetTypeID()) {
      size_t v5 = v3;
    }
    else {
      size_t v5 = 0;
    }
  }
  else
  {
    size_t v5 = 0;
  }

  return ctu::SharedRef<__CFDate const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDate const>::SharedRef(a1, v5);
}

void *ctu::SharedRef<__CFDate const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDate const>::SharedRef(void *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf) {
    CFRetain(cf);
  }
  return a1;
}

void *ctu::cf::CFSharedRef<__CFArray const>::CFSharedRef<void const,void>(void *a1, CFTypeRef *a2)
{
  CFTypeRef v3 = *a2;
  if (*a2)
  {
    CFTypeID v4 = CFGetTypeID(*a2);
    if (v4 == CFArrayGetTypeID()) {
      size_t v5 = v3;
    }
    else {
      size_t v5 = 0;
    }
  }
  else
  {
    size_t v5 = 0;
  }

  return ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::SharedRef(a1, v5);
}

void *ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::SharedRef(void *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf) {
    CFRetain(cf);
  }
  return a1;
}

uint64_t defaultLogFunction(const char *a1)
{
  return printf("%s", a1);
}

void CBSignUtilityLogger::CBSignUtilityLogger(CBSignUtilityLogger *this)
{
  *(void *)this = defaultLogFunction;
}

{
  *(void *)this = defaultLogFunction;
}

void *CBSignUtilityLogger::setLogFunction(void *this, void (*a2)(const char *))
{
  *this = a2;
  return this;
}

uint64_t CBSignUtilityLogger::getLogFunction(CBSignUtilityLogger *this)
{
  return *(void *)this;
}

uint64_t CBSignUtilityLogger::getMyInstance(CBSignUtilityLogger *this)
{
  uint64_t result = CBSignUtilityLogger::myInstance;
  if (!CBSignUtilityLogger::myInstance) {
    operator new();
  }
  return result;
}

void CBSignUtilityLogger::destroyMyInstance(CBSignUtilityLogger *this)
{
  if (!CBSignUtilityLogger::myInstance) {
    CBSignUtilityLogger::myInstance = 0;
  }
}

uint64_t writeLog(const char *__format, ...)
{
  va_start(va, __format);
  uint64_t v3 = *MEMORY[0x263EF8340];
  vsnprintf(__str, 0x400uLL, __format, va);
  if (!CBSignUtilityLogger::myInstance) {
    operator new();
  }
  return (*(uint64_t (**)(char *))CBSignUtilityLogger::myInstance)(__str);
}

void *PublicKeys::get_sha1_development_publickey(PublicKeys *this)
{
  return &PublicKeys::pkcs1_sha1_development_publickey;
}

void *PublicKeys::get_sha1_production_publickey(PublicKeys *this)
{
  return &PublicKeys::pkcs1_sha1_production_publickey;
}

void *PublicKeys::get_sha2_256_development_publickey(PublicKeys *this)
{
  return &PublicKeys::pkcs1_sha2_256_development_publickey;
}

void *PublicKeys::get_sha2_256_production_publickey(PublicKeys *this)
{
  return &PublicKeys::pkcs1_sha2_256_production_publickey;
}

void *PublicKeys::get_sha2_384_development_publickey(PublicKeys *this)
{
  return &PublicKeys::pkcs1_sha2_384_development_publickey;
}

void *PublicKeys::get_sha2_384_production_publickey(PublicKeys *this)
{
  return &PublicKeys::pkcs1_sha2_384_production_publickey;
}

uint64_t PublicKeys::get_sha1_development_keysize(PublicKeys *this)
{
  return 140;
}

uint64_t PublicKeys::get_sha1_production_keysize(PublicKeys *this)
{
  return 140;
}

uint64_t PublicKeys::get_sha2_256_development_keysize(PublicKeys *this)
{
  return 270;
}

uint64_t PublicKeys::get_sha2_256_production_keysize(PublicKeys *this)
{
  return 270;
}

uint64_t PublicKeys::get_sha2_384_development_keysize(PublicKeys *this)
{
  return 97;
}

uint64_t PublicKeys::get_sha2_384_production_keysize(PublicKeys *this)
{
  return 97;
}

void *PublicKeys::get_public_key(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = &PublicKeys::pkcs1_sha2_384_production_publickey;
  if (a3 != 1) {
    uint64_t v3 = 0;
  }
  if (!a3) {
    uint64_t v3 = &PublicKeys::pkcs1_sha2_384_development_publickey;
  }
  CFTypeID v4 = &PublicKeys::pkcs1_sha2_256_production_publickey;
  if (a3 != 1) {
    CFTypeID v4 = 0;
  }
  if (!a3) {
    CFTypeID v4 = &PublicKeys::pkcs1_sha2_256_development_publickey;
  }
  size_t v5 = &PublicKeys::pkcs1_sha1_production_publickey;
  if (a3 != 1) {
    size_t v5 = 0;
  }
  if (!a3) {
    size_t v5 = &PublicKeys::pkcs1_sha1_development_publickey;
  }
  if (a2) {
    size_t v5 = 0;
  }
  if (a2 != 1) {
    CFTypeID v4 = v5;
  }
  if (a2 == 2) {
    return v3;
  }
  else {
    return v4;
  }
}

uint64_t PublicKeys::get_public_key_size(uint64_t a1, int a2, unsigned int a3)
{
  if (a3 >= 2) {
    unsigned int v3 = -1;
  }
  else {
    unsigned int v3 = 97;
  }
  if (a3 >= 2) {
    int v4 = -1;
  }
  else {
    int v4 = 270;
  }
  if (a3 >= 2) {
    int v5 = -1;
  }
  else {
    int v5 = 140;
  }
  if (a2) {
    unsigned int v6 = -1;
  }
  else {
    unsigned int v6 = v5;
  }
  if (a2 == 1) {
    unsigned int v6 = v4;
  }
  if (a2 == 2) {
    return v3;
  }
  else {
    return v6;
  }
}

void *CarrierBundle::CarrierBundle(void *result, uint64_t a2)
{
  result[2] = 0;
  std::logic_error *result = a2;
  result[1] = result + 2;
  result[5] = 0;
  result[3] = 0;
  result[4] = result + 5;
  result[8] = 0;
  result[6] = 0;
  result[7] = result + 8;
  result[12] = 0;
  result[11] = 0;
  result[9] = 0;
  result[10] = result + 11;
  return result;
}

{
  result[2] = 0;
  std::logic_error *result = a2;
  result[1] = result + 2;
  result[5] = 0;
  result[3] = 0;
  result[4] = result + 5;
  result[8] = 0;
  result[6] = 0;
  result[7] = result + 8;
  result[12] = 0;
  result[11] = 0;
  result[9] = 0;
  result[10] = result + 11;
  return result;
}

void CarrierBundle::~CarrierBundle(CarrierBundle *this)
{
}

uint64_t CarrierBundle::print(CarrierBundle *this)
{
  uint64_t v2 = CarrierBundle::printDeviceModelFileMap((uint64_t)this, (void *)this + 1);
  CarrierBundle::printDeviceModelFileMap(v2, (void *)this + 4);

  return CarrierBundle::printDeviceModelFileDataMap((uint64_t)this);
}

uint64_t CarrierBundle::printDeviceModelFileMap(uint64_t a1, void *a2)
{
  uint64_t v2 = a2 + 1;
  unsigned int v3 = (void *)*a2;
  if ((void *)*a2 != a2 + 1)
  {
    do
    {
      writeLog("-----------------------------------------------------------\n");
      int v4 = (const char *)(v3 + 4);
      if (*((char *)v3 + 55) < 0) {
        int v4 = *(const char **)v4;
      }
      writeLog("Class name: %s\n", v4);
      uint64_t result = writeLog("---------- List of files in the class ---------------------\n");
      for (uint64_t i = v3[8]; (void *)i != v3 + 7; uint64_t i = *(void *)(i + 8))
      {
        uint64_t v7 = (const char *)(i + 16);
        if (*(char *)(i + 39) < 0) {
          uint64_t v7 = *(const char **)v7;
        }
        uint64_t result = writeLog("%s\n", v7);
      }
      uint64_t v8 = (void *)v3[1];
      if (v8)
      {
        do
        {
          uint64_t v9 = v8;
          uint64_t v8 = (void *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          uint64_t v9 = (void *)v3[2];
          BOOL v10 = *v9 == (void)v3;
          unsigned int v3 = v9;
        }
        while (!v10);
      }
      unsigned int v3 = v9;
    }
    while (v9 != v2);
  }
  return result;
}

uint64_t CarrierBundle::printDeviceModelFileDataMap(uint64_t this)
{
  v1 = *(void **)(this + 56);
  uint64_t v2 = (void *)(this + 64);
  if (v1 != (void *)(this + 64))
  {
    do
    {
      writeLog("-----------------------------------------------------------\n");
      unsigned int v3 = (const char *)(v1 + 4);
      if (*((char *)v1 + 55) < 0) {
        unsigned int v3 = *(const char **)v3;
      }
      this = writeLog("Device Class = %s\n", v3);
      int v4 = (void *)v1[7];
      if (v4 != v1 + 8)
      {
        do
        {
          FileSystemManager::basename((uint64_t)(v4 + 4), __p);
          if (v12 >= 0) {
            int v5 = __p;
          }
          else {
            int v5 = (void **)__p[0];
          }
          writeLog("\t\t FileName = %s\t", (const char *)v5);
          if (v12 < 0) {
            operator delete(__p[0]);
          }
          if (CFDataGetBytePtr((CFDataRef)v4[7]))
          {
            CFDataGetLength((CFDataRef)v4[7]);
            this = writeLog("fileDataCFIndex Length = %ld \n");
          }
          else
          {
            this = writeLog("FileData is NULL\n");
          }
          unsigned int v6 = (void *)v4[1];
          if (v6)
          {
            do
            {
              uint64_t v7 = v6;
              unsigned int v6 = (void *)*v6;
            }
            while (v6);
          }
          else
          {
            do
            {
              uint64_t v7 = (void *)v4[2];
              BOOL v8 = *v7 == (void)v4;
              int v4 = v7;
            }
            while (!v8);
          }
          int v4 = v7;
        }
        while (v7 != v1 + 8);
      }
      uint64_t v9 = (void *)v1[1];
      if (v9)
      {
        do
        {
          BOOL v10 = v9;
          uint64_t v9 = (void *)*v9;
        }
        while (v9);
      }
      else
      {
        do
        {
          BOOL v10 = (void *)v1[2];
          BOOL v8 = *v10 == (void)v1;
          v1 = v10;
        }
        while (!v8);
      }
      v1 = v10;
    }
    while (v10 != v2);
  }
  return this;
}

void sub_21FDC8B10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CarrierBundle::classifyFiles(uint64_t a1, char *a2, uint64_t **a3)
{
  uint64_t v24 = (uint64_t)&v24;
  v25 = &v24;
  unint64_t v26 = 0;
  if (FileSystemManager::directoryContentsAtPath(a2, &v24, 1))
  {
    std::list<std::string>::__sort<std::__less<void,void>>((uint64_t)v25, (uint64_t)&v24, v26, (uint64_t)&v19);
    int v5 = v25;
    if (v25 != &v24)
    {
      while (1)
      {
        memset(&v23, 0, sizeof(v23));
        FileSystemManager::getFileExtension(v5 + 2);
        if (!std::string::compare(&v23, "lproj") || !std::string::compare(&v23, "loctable")) {
          break;
        }
        FileSystemManager::basename((uint64_t)(v5 + 2), &v19);
        if (!std::string::compare(&v19, "version.plist"))
        {
          BOOL v6 = 1;
        }
        else
        {
          FileSystemManager::basename((uint64_t)(v5 + 2), &v22);
          BOOL v6 = std::string::compare(&v22, "signatures") == 0;
          if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v22.__r_.__value_.__l.__data_);
          }
        }
        if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v19.__r_.__value_.__l.__data_);
          if (v6) {
            break;
          }
        }
        else if (v6)
        {
          break;
        }
        if (FileSystemManager::isDirectory((const char *)v5 + 16))
        {
          if (CarrierBundle::classifyFiles(a1, v5 + 2, a3)) {
            goto LABEL_40;
          }
        }
        else
        {
          if (!FileSystemManager::isRegularFile((const char *)v5 + 16)) {
            goto LABEL_40;
          }
          FileSystemManager::basename((uint64_t)(v5 + 2), v17);
          CarrierBundle::getDeviceModelName((uint64_t)v17, &v19);
          std::string v22 = v19;
          memset(&v19, 0, sizeof(v19));
          if (v21 < 0)
          {
            operator delete(__p);
            if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v19.__r_.__value_.__l.__data_);
            }
          }
          if (SHIBYTE(v18) < 0) {
            operator delete(v17[0]);
          }
          if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type size = HIBYTE(v22.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type size = v22.__r_.__value_.__l.__size_;
          }
          if (size)
          {
            uint64_t v9 = std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::find<std::string>((uint64_t)a3, (const void **)&v22.__r_.__value_.__l.__data_);
            uint64_t v10 = v9;
            if (a3 + 1 == (uint64_t **)v9)
            {
              v17[0] = v17;
              v17[1] = v17;
              uint64_t v18 = 0;
              BOOL v13 = std::__list_imp<std::string>::__create_node[abi:ne180100]<std::string const&>((uint64_t)v17, 0, 0, (uint64_t)(v5 + 2));
              char v14 = v17[0];
              *BOOL v13 = v17[0];
              v13[1] = v17;
              v14[1] = v13;
              v17[0] = v13;
              ++v18;
              std::pair<std::string,std::list<std::string>>::pair[abi:ne180100]<std::string&,std::list<std::string>&,0>(&v19, (long long *)&v22, (uint64_t)v17);
              std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,std::list<std::string>>>(a3, (const void **)&v19.__r_.__value_.__l.__data_, (uint64_t)&v19);
              std::__list_imp<std::string>::clear(&__p);
              if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v19.__r_.__value_.__l.__data_);
              }
              std::__list_imp<std::string>::clear(v17);
            }
            else
            {
              uint64_t v11 = std::__list_imp<std::string>::__create_node[abi:ne180100]<std::string const&>(v9 + 56, 0, 0, (uint64_t)(v5 + 2));
              v11[1] = v10 + 56;
              uint64_t v12 = *(void *)(v10 + 56);
              *uint64_t v11 = v12;
              *(void *)(v12 + 8) = v11;
              *(void *)(v10 + 56) = v11;
              ++*(void *)(v10 + 72);
            }
          }
          else
          {
            writeLog("Invalid file format\n");
          }
          if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(v22.__r_.__value_.__l.__data_);
            if (size)
            {
LABEL_40:
              int v7 = 0;
              goto LABEL_12;
            }
          }
          else if (size)
          {
            goto LABEL_40;
          }
        }
        int v7 = 1;
LABEL_13:
        if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v23.__r_.__value_.__l.__data_);
        }
        if ((v7 | 2) != 2) {
          goto LABEL_43;
        }
        if (v5 == &v24) {
          goto LABEL_44;
        }
      }
      int v7 = 2;
LABEL_12:
      int v5 = (uint64_t *)v5[1];
      goto LABEL_13;
    }
LABEL_44:
    uint64_t v15 = 1;
  }
  else
  {
LABEL_43:
    uint64_t v15 = 0;
  }
  std::__list_imp<std::string>::clear(&v24);
  return v15;
}

void sub_21FDC8E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  std::pair<std::string,std::list<std::string>>::~pair((uint64_t)&a18);
  std::__list_imp<std::string>::clear(&a12);
  if (a32 < 0) {
    operator delete(__p);
  }
  if (a38 < 0) {
    operator delete(a33);
  }
  std::__list_imp<std::string>::clear((void *)(v38 - 112));
  _Unwind_Resume(a1);
}

void CarrierBundle::getDeviceModelName(uint64_t a1@<X1>, std::string *a2@<X8>)
{
  memset(&v23, 0, sizeof(v23));
  memset(&__p, 0, sizeof(__p));
  uint64_t v3 = *(unsigned __int8 *)(a1 + 23);
  if ((v3 & 0x80u) != 0) {
    uint64_t v3 = *(void *)(a1 + 8);
  }
  if (!v3) {
    goto LABEL_7;
  }
  MEMORY[0x223C5E9C0](&v23, "common");
  unint64_t v5 = *(unsigned __int8 *)(a1 + 23);
  if ((v5 & 0x80u) != 0) {
    unint64_t v5 = *(void *)(a1 + 8);
  }
  if (v5 <= 8)
  {
LABEL_7:
    std::pair<std::string,std::string>::pair[abi:ne180100]<std::string&,std::string&,0>(a2, (long long *)&v23, (long long *)&__p);
    goto LABEL_21;
  }
  std::string::basic_string(&v21, (const std::string *)a1, 0, 9uLL, (std::allocator<char> *)&__str);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
  {
    if (v21.__r_.__value_.__l.__size_ != 9) {
      goto LABEL_18;
    }
    BOOL v6 = (std::string *)v21.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) != 9) {
      goto LABEL_18;
    }
    BOOL v6 = &v21;
  }
  std::string::size_type v7 = v6->__r_.__value_.__r.__words[0];
  int v8 = v6->__r_.__value_.__s.__data_[8];
  if (v7 == 0x656469727265766FLL && v8 == 115)
  {
    std::string::basic_string(&__str, (const std::string *)a1, 9uLL, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v19);
    std::string::size_type size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = __str.__r_.__value_.__l.__size_;
    }
    if (size && *std::string::at(&__str, 0) == 42)
    {
      p_str = &__str;
      std::string::erase(&__str, 0, 1uLL);
      if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        std::string::size_type v12 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
      }
      else
      {
        std::string::size_type v12 = __str.__r_.__value_.__l.__size_;
        p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
      }
      for (; v12; --v12)
      {
        int v13 = p_str->__r_.__value_.__s.__data_[0];
        if (v13 == 46) {
          break;
        }
        if (v13 == 95) {
          break;
        }
        std::string::push_back(&__p, v13);
        p_str = (std::string *)((char *)p_str + 1);
      }
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v14 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v14 = __p.__r_.__value_.__l.__size_;
    }
    std::string::basic_string(&v19, &__str, v14, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v24);
    std::string::size_type v15 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type v15 = __str.__r_.__value_.__l.__size_;
    }
    if (v15 && *std::string::at(&v19, 0) == 95)
    {
      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
      {
        *v23.__r_.__value_.__l.__data_ = 0;
        v23.__r_.__value_.__l.__size_ = 0;
      }
      else
      {
        v23.__r_.__value_.__s.__data_[0] = 0;
        *((unsigned char *)&v23.__r_.__value_.__s + 23) = 0;
      }
      unsigned __int8 v16 = &v19;
      std::string::erase(&v19, 0, 1uLL);
      if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        std::string::size_type v17 = HIBYTE(v19.__r_.__value_.__r.__words[2]);
      }
      else
      {
        std::string::size_type v17 = v19.__r_.__value_.__l.__size_;
        unsigned __int8 v16 = (std::string *)v19.__r_.__value_.__r.__words[0];
      }
      for (; v17; --v17)
      {
        int v18 = v16->__r_.__value_.__s.__data_[0];
        if (v18 == 46) {
          break;
        }
        std::string::push_back(&v23, v18);
        unsigned __int8 v16 = (std::string *)((char *)v16 + 1);
      }
    }
    std::pair<std::string,std::string>::pair[abi:ne180100]<std::string&,std::string&,0>(a2, (long long *)&v23, (long long *)&__p);
    if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v19.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__str.__r_.__value_.__l.__data_);
    }
    goto LABEL_19;
  }
LABEL_18:
  std::pair<std::string,std::string>::pair[abi:ne180100]<std::string&,std::string&,0>(a2, (long long *)&v23, (long long *)&__p);
LABEL_19:
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v21.__r_.__value_.__l.__data_);
  }
LABEL_21:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v23.__r_.__value_.__l.__data_);
  }
}

void sub_21FDC9228(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a32 < 0) {
    operator delete(a27);
  }
  if (*(char *)(v32 - 41) < 0) {
    operator delete(*(void **)(v32 - 64));
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<std::string,std::list<std::string>>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t CarrierBundle::readBundle(CarrierBundle *this)
{
  if (!CarrierBundle::classifyFiles((uint64_t)this, *(char **)this, (uint64_t **)this + 1)) {
    return 0;
  }
  CarrierBundle::getSignatureDirPath((const std::string **)this, &v33);
  if (FileSystemManager::isRegularFile((const char *)&v33))
  {
    uint64_t v2 = &v33;
    if ((v33.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      uint64_t v2 = (std::string *)v33.__r_.__value_.__r.__words[0];
    }
    writeLog("signatures at path %s should be a directory, not a regular file : \n", (const char *)v2);
LABEL_75:
    uint64_t v3 = 0;
  }
  else
  {
    if ((CarrierBundle::classifyFiles((uint64_t)this, (char *)&v33, (uint64_t **)this + 4) & 1) == 0)
    {
      int v4 = &v33;
      if ((v33.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        int v4 = (std::string *)v33.__r_.__value_.__r.__words[0];
      }
      writeLog("Unable to read and classify the signatures fies : %s\n", (const char *)v4);
    }
    unint64_t v5 = (CarrierBundle *)*((void *)this + 1);
    if (v5 != (CarrierBundle *)((char *)this + 16))
    {
      do
      {
        CFRange v31 = 0;
        uint64_t v32 = 0;
        v30 = (uint64_t *)&v31;
        for (uint64_t i = *((void *)v5 + 8); (CarrierBundle *)i != (CarrierBundle *)((char *)v5 + 56); uint64_t i = *(void *)(i + 8))
        {
          if (*(char *)(i + 39) < 0) {
            std::string::__init_copy_ctor_external(&v29, *(const std::string::value_type **)(i + 16), *(void *)(i + 24));
          }
          else {
            std::string v29 = *(std::string *)(i + 16);
          }
          CarrierBundle::readFile((uint64_t)&v29, (const void **)v22);
          if (v22[0]) {
            std::string::size_type v7 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
          }
          else {
            std::string::size_type v7 = 0;
          }
          if (v7)
          {
            std::pair<std::string,ctu::cf::CFSharedRef<__CFData const>>::pair[abi:ne180100]<std::string&,ctu::cf::CFSharedRef<__CFData const>&,0>(&__p, (long long *)&v29, (const void **)v22);
            std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,ctu::cf::CFSharedRef<__CFData const>>>(&v30, (const void **)&__p.__r_.__value_.__l.__data_, (long long *)&__p);
            ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v27);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
          }
          else
          {
            if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              int v8 = &v29;
            }
            else {
              int v8 = (std::string *)v29.__r_.__value_.__r.__words[0];
            }
            writeLog("Error in readBundle : Unable to read the file : %s \n", (const char *)v8);
          }
          ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)v22);
          if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v29.__r_.__value_.__l.__data_);
          }
          if (!v7)
          {
            std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy((uint64_t)&v30, v31);
            goto LABEL_75;
          }
        }
        std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>::pair[abi:ne180100]<std::string const&,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>&,0>(&__p, (long long *)v5 + 2, (const void ***)&v30);
        std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>((uint64_t **)this + 7, (const void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&__p);
        std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy((uint64_t)&v27, v28);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy((uint64_t)&v30, v31);
        uint64_t v9 = (CarrierBundle *)*((void *)v5 + 1);
        if (v9)
        {
          do
          {
            uint64_t v10 = v9;
            uint64_t v9 = *(CarrierBundle **)v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            uint64_t v10 = (CarrierBundle *)*((void *)v5 + 2);
            BOOL v11 = *(void *)v10 == (void)v5;
            unint64_t v5 = v10;
          }
          while (!v11);
        }
        unint64_t v5 = v10;
      }
      while (v10 != (CarrierBundle *)((char *)this + 16));
    }
    std::string::size_type v12 = (long long *)*((void *)this + 4);
    int v13 = (char *)this + 40;
    if (v12 == (long long *)((char *)this + 40))
    {
      uint64_t v3 = 1;
    }
    else
    {
      std::string::size_type v14 = (uint64_t **)((char *)this + 80);
      do
      {
        CFRange v31 = 0;
        uint64_t v32 = 0;
        v30 = (uint64_t *)&v31;
        for (uint64_t j = *((void *)v12 + 8); (long long *)j != (long long *)((char *)v12 + 56); uint64_t j = *(void *)(j + 8))
        {
          if (*(char *)(j + 39) < 0) {
            std::string::__init_copy_ctor_external(&v29, *(const std::string::value_type **)(j + 16), *(void *)(j + 24));
          }
          else {
            std::string v29 = *(std::string *)(j + 16);
          }
          ctu::ns::AutoPool::AutoPool((ctu::ns::AutoPool *)v25);
          FileSystemManager::dictionaryFromPath((uint64_t *)&v29, &v24);
          if (v24) {
            unsigned __int8 v16 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
          }
          else {
            unsigned __int8 v16 = 0;
          }
          if (v16)
          {
            FileSystemManager::basename((uint64_t)&v29, v22);
            *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *(_OWORD *)v22;
            std::string::size_type v17 = v23;
            v22[1] = 0;
            std::string::size_type v23 = 0;
            v22[0] = 0;
            __p.__r_.__value_.__r.__words[2] = v17;
            v27 = v24;
            if (v24) {
              CFRetain(v24);
            }
            std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>(&v30, (const void **)&__p.__r_.__value_.__l.__data_, (long long *)&__p);
            ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v27);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v23) < 0) {
              operator delete(v22[0]);
            }
          }
          else
          {
            if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              int v18 = &v29;
            }
            else {
              int v18 = (std::string *)v29.__r_.__value_.__r.__words[0];
            }
            writeLog("Error in readBundle : Failed to load signature file at path: %s\n", (const char *)v18);
          }
          ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v24);
          MEMORY[0x223C5E920](v25);
          if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v29.__r_.__value_.__l.__data_);
          }
          if (!v16)
          {
            std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::destroy((uint64_t)&v30, v31);
            goto LABEL_75;
          }
        }
        std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>::pair[abi:ne180100]<std::string const&,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>&,0>(&__p, v12 + 2, (const void ***)&v30);
        std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>(v14, (const void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&__p);
        std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::destroy((uint64_t)&v27, v28);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::destroy((uint64_t)&v30, v31);
        std::string v19 = (long long *)*((void *)v12 + 1);
        if (v19)
        {
          do
          {
            CFTypeID v20 = v19;
            std::string v19 = *(long long **)v19;
          }
          while (v19);
        }
        else
        {
          do
          {
            CFTypeID v20 = (long long *)*((void *)v12 + 2);
            BOOL v11 = *(void *)v20 == (void)v12;
            std::string::size_type v12 = v20;
          }
          while (!v11);
        }
        uint64_t v3 = 1;
        std::string::size_type v12 = v20;
      }
      while (v20 != (long long *)v13);
    }
  }
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v33.__r_.__value_.__l.__data_);
  }
  return v3;
}

void sub_21FDC9784(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18, int a19, __int16 a20,char a21,char a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37,char a38,void *a39)
{
  std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>::~pair((uint64_t)&a24);
  std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::destroy((uint64_t)&a38, a39);
  if (*(char *)(v39 - 89) < 0) {
    operator delete(*(void **)(v39 - 112));
  }
  _Unwind_Resume(a1);
}

std::string *CarrierBundle::getSignatureDirPath@<X0>(const std::string **this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::operator=(a2, *this);
  int v4 = *this;
  if (SHIBYTE((*this)->__r_.__value_.__r.__words[2]) < 0) {
    std::string::size_type size = v4->__r_.__value_.__l.__size_;
  }
  else {
    std::string::size_type size = HIBYTE((*this)->__r_.__value_.__r.__words[2]);
  }
  if (*std::string::at(v4, size - 1) != 47) {
    std::string::append(a2, "/");
  }
  return std::string::append(a2, "signatures");
}

void sub_21FDC9910(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void CarrierBundle::readFile(uint64_t a1@<X1>, const void **a2@<X8>)
{
  *a2 = 0;
  memset(&v10, 0, sizeof(v10));
  FileSystemManager::getFileExtension((uint64_t *)a1);
  if (!std::string::compare(&v10, "plist"))
  {
    if (*(char *)(a1 + 23) >= 0) {
      unint64_t v5 = (char *)a1;
    }
    else {
      unint64_t v5 = *(char **)a1;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v5);
    CFDataRef v6 = FileSystemManager::copyBinaryPlistAsXML((uint64_t)__p);
    std::string::size_type v7 = *a2;
    *a2 = v6;
    BOOL v11 = v7;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v11);
    if (v9 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    if (*(char *)(a1 + 23) >= 0) {
      uint64_t v4 = a1;
    }
    else {
      uint64_t v4 = *(void *)a1;
    }
    FileSystemManager::fileContentsAtPath(v4, &v11);
    if (&v11 != a2)
    {
      __p[0] = (void *)*a2;
      *a2 = v11;
      BOOL v11 = 0;
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
    }
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v11);
  }
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
}

void sub_21FDC9A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v21);
  _Unwind_Resume(a1);
}

uint64_t std::pair<std::string,ctu::cf::CFSharedRef<__CFData const>>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::pair<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t CarrierBundle::verifySignatures(uint64_t a1, int a2, uint64_t a3, BOOL a4, int a5)
{
  if (!CarrierBundle::verifySignaturesOfGroup(a1, a2, a3, a4))
  {
    writeLog("Unable to verify the signatures of the some of the groups\n");
    return 0;
  }
  if (!a5) {
    return 1;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "pri");
  BOOL v10 = CarrierBundle::verifySignaturesOfFiles(a1, a2, v9, a4, (uint64_t)__p);
  BOOL v11 = v10;
  if (v17 < 0)
  {
    operator delete(__p[0]);
    if (v11) {
      goto LABEL_5;
    }
LABEL_12:
    writeLog("Unable to verify the signatures of the %s files \n");
    return 0;
  }
  if (!v10) {
    goto LABEL_12;
  }
LABEL_5:
  std::string::basic_string[abi:ne180100]<0>(__p, "gri");
  BOOL v13 = CarrierBundle::verifySignaturesOfFiles(a1, a2, v12, a4, (uint64_t)__p);
  BOOL v14 = v13;
  if (v17 < 0)
  {
    operator delete(__p[0]);
    if (v14) {
      return 1;
    }
  }
  else if (v13)
  {
    return 1;
  }
  writeLog("Unable to verify the signatures of the %s files s\n");
  return 0;
}

void sub_21FDC9C70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL CarrierBundle::verifySignaturesOfGroup(uint64_t a1, int a2, uint64_t a3, BOOL a4)
{
  DigestForCBSignatureCFNumberType Type = (void *)getDigestForCBSignatureType(a2);
  v41[0] = 0;
  v41[1] = 0;
  v40 = (uint64_t *)v41;
  if ((CarrierBundle::computeHash(a1, DigestForCBSignatureType, &v40) & 1) == 0)
  {
    writeLog("Unable to compute hash for digestType %d", DigestForCBSignatureType);
    goto LABEL_52;
  }
  std::string::size_type v7 = v40;
  if (v40 == (uint64_t *)v41)
  {
    BOOL v23 = 1;
    goto LABEL_54;
  }
  uint64_t v8 = a1 + 80;
  uint64_t v9 = a1 + 88;
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  while (1)
  {
    BOOL v11 = (const char *)(v7 + 4);
    uint64_t v12 = std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::find<std::string>(v8, (const void **)v7 + 4);
    if (v9 == v12) {
      break;
    }
    getSignatureFileName((std::string *)(v7 + 4), &v39);
    uint64_t v13 = std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::find<std::string>(v12 + 56, (const void **)&v39.__r_.__value_.__l.__data_);
    if (v12 + 64 == v13)
    {
      std::string v21 = &v39;
      if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string v21 = (std::string *)v39.__r_.__value_.__r.__words[0];
      }
      writeLog("Unable to find the signature dictionary for the file %s\n", (const char *)v21);
      int v20 = 1;
      goto LABEL_41;
    }
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef((const void **)&theDict, (const void **)(v13 + 56));
    getPrefixForDigestType(DigestForCBSignatureType, v36);
    unint64_t v14 = v37;
    if ((v37 & 0x80u) != 0) {
      unint64_t v14 = (unint64_t)v36[1];
    }
    if (v14)
    {
      std::operator+<char>();
      if (v35 >= 0) {
        std::string::size_type v15 = (const char *)&v34;
      }
      else {
        std::string::size_type v15 = (const char *)v34;
      }
      CFStringRef v16 = CFStringCreateWithCString(v10, v15, 0x8000100u);
      CFStringRef v33 = v16;
      if (v16) {
        char v17 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
      }
      else {
        char v17 = 0;
      }
      if (v17)
      {
        *(void *)&long long v42 = CFDictionaryGetValue(theDict, v16);
        ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&cf, (CFTypeRef *)&v42);
        if (cf) {
          int v18 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
        }
        else {
          int v18 = 0;
        }
        if (v18)
        {
          ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v29, (const void **)v7 + 7);
          CFTypeRef v28 = cf;
          if (cf) {
            CFRetain(cf);
          }
          BOOL v19 = VerifyDigest(&v29, &v28, a4, (int)DigestForCBSignatureType);
          ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v28);
          ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v29);
          if (v19)
          {
            int v20 = 0;
            goto LABEL_35;
          }
          writeLog("Verification of the signed digest failed\n");
        }
        else
        {
          long long v42 = 0uLL;
          uint64_t v43 = 0;
          ctu::cf::assign();
          *(_OWORD *)std::string __p = v42;
          uint64_t v31 = v43;
          std::string v22 = (void **)v42;
          if (v43 >= 0) {
            std::string v22 = __p;
          }
          writeLog("Error: Failed to lookup for signature key %s in signing plist\n", (const char *)v22);
          if (SHIBYTE(v31) < 0) {
            operator delete(__p[0]);
          }
        }
        int v20 = 1;
LABEL_35:
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&cf);
      }
      else
      {
        int v20 = 1;
      }
      ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v33);
      if (v35 < 0) {
        operator delete(v34);
      }
      goto LABEL_38;
    }
    writeLog("Error: Failed to get the prefix for digest type: %d\n", DigestForCBSignatureType);
    int v20 = 1;
LABEL_38:
    if ((char)v37 < 0) {
      operator delete(v36[0]);
    }
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&theDict);
LABEL_41:
    if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v39.__r_.__value_.__l.__data_);
    }
    BOOL v23 = v20 == 0;
    if (!v20)
    {
      char v24 = (uint64_t *)v7[1];
      if (v24)
      {
        do
        {
          v25 = v24;
          char v24 = (uint64_t *)*v24;
        }
        while (v24);
      }
      else
      {
        do
        {
          v25 = (uint64_t *)v7[2];
          BOOL v26 = *v25 == (void)v7;
          std::string::size_type v7 = v25;
        }
        while (!v26);
      }
      std::string::size_type v7 = v25;
      if (v25 != (uint64_t *)v41) {
        continue;
      }
    }
    goto LABEL_54;
  }
  if (*((char *)v7 + 55) < 0) {
    BOOL v11 = *(const char **)v11;
  }
  writeLog("Unable to find the signatures for the device model %s\n", v11);
LABEL_52:
  BOOL v23 = 0;
LABEL_54:
  std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy((uint64_t)&v40, v41[0]);
  return v23;
}

void sub_21FDCA018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, int a12, __int16 a13, char a14, char a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,char a25,int a26,__int16 a27,char a28,char a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,char a42,void *a43,uint64_t a44,int a45,__int16 a46,char a47,char a48)
{
  std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy(v48 - 136, *(void **)(v48 - 128));
  _Unwind_Resume(a1);
}

BOOL CarrierBundle::verifySignaturesOfFiles(uint64_t a1, int a2, uint64_t a3, BOOL a4, uint64_t a5)
{
  DigestForCBSignatureCFNumberType Type = (void *)getDigestForCBSignatureType(a2);
  v48[0] = 0;
  v48[1] = 0;
  v47 = (uint64_t *)v48;
  if (CarrierBundle::computeHashForFiles(a1, DigestForCBSignatureType, &v47, a5))
  {
    uint64_t v9 = v47;
    if (v47 == (uint64_t *)v48)
    {
      BOOL v29 = 1;
      goto LABEL_67;
    }
    uint64_t v10 = a1 + 80;
    uint64_t v34 = a1 + 88;
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    while (1)
    {
      uint64_t v12 = (const char *)(v9 + 4);
      uint64_t v13 = std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::find<std::string>(v10, (const void **)v9 + 4);
      if (v34 == v13) {
        break;
      }
      getSignatureFileName((std::string *)(v9 + 4), &v46);
      uint64_t v14 = std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::find<std::string>(v13 + 56, (const void **)&v46.__r_.__value_.__l.__data_);
      if (v13 + 64 == v14)
      {
        CFTypeRef v28 = &v46;
        if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          CFTypeRef v28 = (std::string *)v46.__r_.__value_.__r.__words[0];
        }
        writeLog("Unable to find the signature dictionary for the file %s\n", (const char *)v28);
        int v27 = 1;
      }
      else
      {
        ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef((const void **)&theDict, (const void **)(v14 + 56));
        getPrefixForDigestType(DigestForCBSignatureType, v43);
        unint64_t v15 = v44;
        if ((v44 & 0x80u) != 0) {
          unint64_t v15 = (unint64_t)v43[1];
        }
        if (v15)
        {
          CFStringRef v16 = (uint64_t *)v9[7];
          if (v16 != v9 + 8)
          {
            while (1)
            {
              std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)v16 + 4, (const void **)v43, (uint64_t)v41);
              if (v42 >= 0) {
                char v17 = v41;
              }
              else {
                char v17 = (void **)v41[0];
              }
              CFStringRef v18 = CFStringCreateWithCString(v11, (const char *)v17, 0x8000100u);
              CFStringRef v40 = v18;
              if (v18) {
                BOOL v19 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
              }
              else {
                BOOL v19 = 0;
              }
              if (!v19)
              {
                int v22 = 1;
                goto LABEL_33;
              }
              *(void *)&long long v49 = CFDictionaryGetValue(theDict, v18);
              ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&cf, (CFTypeRef *)&v49);
              if (!(cf
                   ? ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get
                   : 0))
                break;
              ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v36, (const void **)v16 + 7);
              CFTypeRef v35 = cf;
              if (cf) {
                CFRetain(cf);
              }
              BOOL v21 = VerifyDigest(&v36, &v35, a4, (int)DigestForCBSignatureType);
              ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v35);
              ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v36);
              if (!v21)
              {
                writeLog("Verification of the signed digest failed\n");
LABEL_31:
                int v22 = 1;
                goto LABEL_32;
              }
              int v22 = 0;
LABEL_32:
              ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&cf);
LABEL_33:
              ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v40);
              if (v42 < 0) {
                operator delete(v41[0]);
              }
              if (v22) {
                goto LABEL_47;
              }
              char v24 = (uint64_t *)v16[1];
              if (v24)
              {
                do
                {
                  v25 = v24;
                  char v24 = (uint64_t *)*v24;
                }
                while (v24);
              }
              else
              {
                do
                {
                  v25 = (uint64_t *)v16[2];
                  BOOL v26 = *v25 == (void)v16;
                  CFStringRef v16 = v25;
                }
                while (!v26);
              }
              CFStringRef v16 = v25;
              if (v25 == v9 + 8) {
                goto LABEL_42;
              }
            }
            long long v49 = 0uLL;
            uint64_t v50 = 0;
            ctu::cf::assign();
            *(_OWORD *)std::string __p = v49;
            uint64_t v38 = v50;
            BOOL v23 = (void **)v49;
            if (v50 >= 0) {
              BOOL v23 = __p;
            }
            writeLog("Error: Failed to lookup for signature key %s in signing plist\n", (const char *)v23);
            if (SHIBYTE(v38) < 0) {
              operator delete(__p[0]);
            }
            goto LABEL_31;
          }
LABEL_42:
          int v27 = 0;
        }
        else
        {
          writeLog("Error: Failed to get the prefix for digest type: %d\n", DigestForCBSignatureType);
LABEL_47:
          int v27 = 1;
        }
        if ((char)v44 < 0) {
          operator delete(v43[0]);
        }
        ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&theDict);
      }
      if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v46.__r_.__value_.__l.__data_);
      }
      BOOL v29 = v27 == 0;
      if (!v27)
      {
        v30 = (uint64_t *)v9[1];
        if (v30)
        {
          do
          {
            uint64_t v31 = v30;
            v30 = (uint64_t *)*v30;
          }
          while (v30);
        }
        else
        {
          do
          {
            uint64_t v31 = (uint64_t *)v9[2];
            BOOL v26 = *v31 == (void)v9;
            uint64_t v9 = v31;
          }
          while (!v26);
        }
        uint64_t v9 = v31;
        if (v31 != (uint64_t *)v48) {
          continue;
        }
      }
      goto LABEL_67;
    }
    if (*((char *)v9 + 55) < 0) {
      uint64_t v12 = *(const char **)v12;
    }
    writeLog("Unable to find the signatures for the device model %s\n", v12);
  }
  else
  {
    if (*(char *)(a5 + 23) >= 0) {
      uint64_t v32 = (const char *)a5;
    }
    else {
      uint64_t v32 = *(const char **)a5;
    }
    writeLog("Unable to compute the hash for the file types : %s \n", v32);
  }
  BOOL v29 = 0;
LABEL_67:
  std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::destroy((uint64_t)&v47, v48[0]);
  return v29;
}

void sub_21FDCA4F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, int a12, __int16 a13, char a14, char a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,char a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,void *__p,uint64_t a37,int a38,__int16 a39,char a40,char a41,char a42,void *a43,uint64_t a44,int a45,__int16 a46,char a47,char a48)
{
  std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::destroy(v48 - 136, *(void **)(v48 - 128));
  _Unwind_Resume(a1);
}

uint64_t CarrierBundle::computeHash(uint64_t a1, void *a2, uint64_t **a3)
{
  CFDataRef v6 = (void *)(a1 + 56);
  std::string::basic_string[abi:ne180100]<0>(__p, "common");
  uint64_t v7 = std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::find<std::string>((uint64_t)v6, (const void **)__p);
  if (v28 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v8 = (void *)(a1 + 64);
  if (a1 + 64 == v7)
  {
    writeLog("Error : No set of common files found. Bundle may be missing something\n");
    return 0;
  }
  DigestGenerator::getDigestGenerator(a2, &v29);
  ComputeHash::ComputeHash((ComputeHash *)__p);
  uint64_t v25 = v29;
  BOOL v26 = v30;
  if (v30) {
    atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ComputeHash::setDigestGenerator((uint64_t)__p, &v25);
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }
  uint64_t v9 = ComputeHash::init((ComputeHash *)__p);
  if ((v9 & 1) == 0)
  {
    writeLog("Error:ComputeHash object needs to be reset before initilazing\n");
LABEL_36:
    uint64_t v18 = 0;
    goto LABEL_46;
  }
  if ((CarrierBundle::computeDigestForFileDataMap(v9, (void *)(v7 + 56), (uint64_t)__p) & 1) == 0)
  {
    writeLog("Error : Unable to compute digest for FileDataMap\n");
    goto LABEL_36;
  }
  ComputeHash::finalize((ComputeHash *)__p, (CFDataRef *)&cf);
  std::pair<std::string,ctu::cf::CFSharedRef<__CFData const>>::pair[abi:ne180100]<std::string&,ctu::cf::CFSharedRef<__CFData const>&,0>(&v22, (long long *)(v7 + 32), &cf);
  std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,ctu::cf::CFSharedRef<__CFData const>>>(a3, (const void **)&v22.__r_.__value_.__l.__data_, (long long *)&v22);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v23);
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
  uint64_t v10 = (void *)*v6;
  if ((void *)*v6 == v8)
  {
LABEL_32:
    uint64_t v18 = 1;
    goto LABEL_45;
  }
  while (1)
  {
    ComputeHash::reset_state((uint64_t)__p);
    CFAllocatorRef v11 = (const char *)(v10 + 4);
    if (!std::string::compare((const std::string *)(v10 + 4), "common")) {
      goto LABEL_26;
    }
    if (!ComputeHash::init((ComputeHash *)__p)) {
      goto LABEL_38;
    }
    CFTypeRef v21 = cf;
    if (cf) {
      CFRetain(cf);
    }
    uint64_t v12 = (uint64_t)ComputeHash::digest_data((uint64_t)__p, (CFDataRef *)&v21);
    if ((v12 & 1) == 0) {
      break;
    }
    char v13 = CarrierBundle::computeDigestForFileDataMap(v12, v10 + 7, (uint64_t)__p);
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v21);
    if ((v13 & 1) == 0) {
      goto LABEL_38;
    }
    ComputeHash::finalize((ComputeHash *)__p, (CFDataRef *)&v20);
    if (v20) {
      uint64_t v14 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
    }
    else {
      uint64_t v14 = 0;
    }
    if (!v14)
    {
      if (*((char *)v10 + 55) < 0) {
        CFAllocatorRef v11 = *(const char **)v11;
      }
      writeLog("Error : Unable to compute the digest for FileDigestMap associated with %s\n", v11);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v20);
      goto LABEL_44;
    }
    std::pair<std::string,ctu::cf::CFSharedRef<__CFData const>>::pair[abi:ne180100]<std::string&,ctu::cf::CFSharedRef<__CFData const>&,0>(&v22, (long long *)v10 + 2, &v20);
    std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,ctu::cf::CFSharedRef<__CFData const>>>(a3, (const void **)&v22.__r_.__value_.__l.__data_, (long long *)&v22);
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v23);
    if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v22.__r_.__value_.__l.__data_);
    }
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v20);
LABEL_26:
    unint64_t v15 = (void *)v10[1];
    if (v15)
    {
      do
      {
        CFStringRef v16 = v15;
        unint64_t v15 = (void *)*v15;
      }
      while (v15);
    }
    else
    {
      do
      {
        CFStringRef v16 = (void *)v10[2];
        BOOL v17 = *v16 == (void)v10;
        uint64_t v10 = v16;
      }
      while (!v17);
    }
    uint64_t v10 = v16;
    if (v16 == v8) {
      goto LABEL_32;
    }
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v21);
LABEL_38:
  if (*((char *)v10 + 55) < 0) {
    CFAllocatorRef v11 = *(const char **)v11;
  }
  writeLog("Error : Unable to compute the digest for FileDigestMap associated with %s\n", v11);
LABEL_44:
  uint64_t v18 = 0;
LABEL_45:
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&cf);
LABEL_46:
  ComputeHash::~ComputeHash((ComputeHash *)__p);
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
  return v18;
}

void sub_21FDCA8E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10, __int16 a11, char a12, char a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,const void *a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a10);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a21);
  ComputeHash::~ComputeHash((ComputeHash *)&__p);
  uint64_t v31 = *(std::__shared_weak_count **)(v29 - 72);
  if (v31) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v31);
  }
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t CarrierBundle::computeHashForFiles(uint64_t a1, void *a2, uint64_t **a3, uint64_t a4)
{
  DigestGenerator::getDigestGenerator(a2, &v39);
  ComputeHash::ComputeHash((ComputeHash *)v38);
  uint64_t v36 = v39;
  unsigned __int8 v37 = v40;
  if (v40) {
    atomic_fetch_add_explicit(&v40->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ComputeHash::setDigestGenerator(v6, &v36);
  if (v37) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v37);
  }
  if (ComputeHash::init((ComputeHash *)v38))
  {
    uint64_t v7 = *(long long **)(a1 + 56);
    if (v7 == (long long *)(a1 + 64))
    {
LABEL_54:
      uint64_t v22 = 1;
      goto LABEL_58;
    }
    while (1)
    {
      ComputeHash::reset_state((uint64_t)v38);
      v35[0] = 0;
      v35[1] = 0;
      uint64_t v34 = (uint64_t *)v35;
      uint64_t v8 = (const void **)*((void *)v7 + 7);
      if (v8 != (const void **)(v7 + 4)) {
        break;
      }
LABEL_46:
      std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>::pair[abi:ne180100]<std::string const&,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>&,0>(&__p, v7 + 2, (const void ***)&v34);
      std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>(a3, (const void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&__p);
      std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy((uint64_t)v26, (void *)v26[1]);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy((uint64_t)&v34, v35[0]);
      int v20 = (long long *)*((void *)v7 + 1);
      if (v20)
      {
        do
        {
          CFTypeRef v21 = v20;
          int v20 = *(long long **)v20;
        }
        while (v20);
      }
      else
      {
        do
        {
          CFTypeRef v21 = (long long *)*((void *)v7 + 2);
          BOOL v15 = *(void *)v21 == (void)v7;
          uint64_t v7 = v21;
        }
        while (!v15);
      }
      uint64_t v7 = v21;
      if (v21 == (long long *)(a1 + 64)) {
        goto LABEL_54;
      }
    }
    while (1)
    {
      FileSystemManager::basename((uint64_t)(v8 + 4), v32);
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      FileSystemManager::getFileExtension((uint64_t *)v32);
      int v9 = *(char *)(a4 + 23);
      unint64_t v10 = v31 >= 0 ? HIBYTE(v31) : v30;
      CFAllocatorRef v11 = v31 >= 0 ? &v29 : (void **)v29;
      unint64_t v12 = v9 >= 0 ? *(unsigned __int8 *)(a4 + 23) : *(void *)(a4 + 8);
      char v13 = v9 >= 0 ? (const void *)a4 : *(const void **)a4;
      size_t v14 = v12 >= v10 ? v10 : v12;
      BOOL v15 = !memcmp(v11, v13, v14) && v12 == v10;
      if (v15)
      {
        ComputeHash::reset_state((uint64_t)v38);
        if (ComputeHash::init((ComputeHash *)v38)
          && (ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v28, v8 + 7), unsigned __int8 v17 = ComputeHash::digest_data((uint64_t)v38, (CFDataRef *)&v28), ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v28), (v17 & 1) != 0))
        {
          ComputeHash::finalize((ComputeHash *)v38, (CFDataRef *)&v27);
          std::pair<std::string,ctu::cf::CFSharedRef<__CFData const>>::pair[abi:ne180100]<std::string&,ctu::cf::CFSharedRef<__CFData const>&,0>(&__p, (long long *)v32, &v27);
          std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,ctu::cf::CFSharedRef<__CFData const>>>(&v34, (const void **)&__p.__r_.__value_.__l.__data_, (long long *)&__p);
          ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v26);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
          ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v27);
          int v16 = 0;
        }
        else
        {
          int v16 = 1;
        }
      }
      else
      {
        int v16 = 7;
      }
      if (SHIBYTE(v31) < 0) {
        operator delete(v29);
      }
      if (v33 < 0) {
        operator delete(v32[0]);
      }
      if (v16 != 7 && v16) {
        break;
      }
      uint64_t v18 = (const void **)v8[1];
      if (v18)
      {
        do
        {
          BOOL v19 = (const void ***)v18;
          uint64_t v18 = (const void **)*v18;
        }
        while (v18);
      }
      else
      {
        do
        {
          BOOL v19 = (const void ***)v8[2];
          BOOL v15 = *v19 == v8;
          uint64_t v8 = (const void **)v19;
        }
        while (!v15);
      }
      uint64_t v8 = (const void **)v19;
      if (v19 == (const void ***)(v7 + 4)) {
        goto LABEL_46;
      }
    }
    std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy((uint64_t)&v34, v35[0]);
  }
  else
  {
    writeLog("Error:ComputeHash object needs to be reset before initilazing\n");
  }
  uint64_t v22 = 0;
LABEL_58:
  ComputeHash::~ComputeHash((ComputeHash *)v38);
  if (v40) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v40);
  }
  return v22;
}

void sub_21FDCACAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, int a18, __int16 a19, char a20,char a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,std::__shared_weak_count *a38)
{
  if (a38) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a38);
  }
  ComputeHash::~ComputeHash((ComputeHash *)(v38 - 136));
  CFStringRef v40 = *(std::__shared_weak_count **)(v38 - 96);
  if (v40) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v40);
  }
  _Unwind_Resume(a1);
}

uint64_t std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>@<X0>(const void **a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  if (*((char *)a1 + 23) >= 0) {
    size_t v5 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v5 = (size_t)a1[1];
  }
  if (*((char *)a2 + 23) >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  uint64_t result = std::string::basic_string[abi:ne180100](a3, v6 + v5);
  if (*(char *)(result + 23) >= 0) {
    uint64_t v8 = (char *)result;
  }
  else {
    uint64_t v8 = *(char **)result;
  }
  if (v5)
  {
    if (*((char *)a1 + 23) >= 0) {
      int v9 = a1;
    }
    else {
      int v9 = *a1;
    }
    uint64_t result = (uint64_t)memmove(v8, v9, v5);
  }
  unint64_t v10 = &v8[v5];
  if (v6)
  {
    if (*((char *)a2 + 23) >= 0) {
      CFAllocatorRef v11 = a2;
    }
    else {
      CFAllocatorRef v11 = *a2;
    }
    uint64_t result = (uint64_t)memmove(v10, v11, v6);
  }
  v10[v6] = 0;
  return result;
}

uint64_t CarrierBundle::removeSignaturesDir(uint64_t **this)
{
  uint64_t v2 = *this;
  std::string::basic_string[abi:ne180100]<0>(__p, "signatures");
  uint64_t v3 = FileSystemManager::removeItem(v2, (uint64_t *)__p);
  uint64_t v4 = v3;
  if (v8 < 0)
  {
    operator delete(__p[0]);
    if (v4) {
      return v4;
    }
  }
  else if (v3)
  {
    return v4;
  }
  size_t v5 = (const char *)*this;
  if (*((char *)*this + 23) < 0) {
    size_t v5 = *(const char **)v5;
  }
  writeLog("Error: Unable remove signatures directory from bundle at path: %s\n", v5);
  return v4;
}

void sub_21FDCAEC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CarrierBundle::computeDigestForFileDataMap(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2 + 1;
  size_t v5 = (void *)*a2;
  if ((void *)*a2 == a2 + 1)
  {
LABEL_10:
    if (v5 == v4) {
      return 1;
    }
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    while (1)
    {
      FileSystemManager::basename((uint64_t)(v5 + 4), __p);
      if (v26 >= 0) {
        unint64_t v12 = __p;
      }
      else {
        unint64_t v12 = (void **)__p[0];
      }
      char v13 = CFStringCreateWithCString(v11, (const char *)v12, 0x8000100u);
      CFTypeRef cf = v13;
      if (SHIBYTE(v26) < 0)
      {
        operator delete(__p[0]);
        char v13 = cf;
      }
      uint64_t v22 = v13;
      if (v13) {
        CFRetain(v13);
      }
      BOOL v14 = ComputeHash::digest_string(a3, (CFStringRef *)&v22);
      ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v22);
      if (!v14) {
        break;
      }
      ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&cf);
      BOOL v15 = (void *)v5[1];
      if (v15)
      {
        do
        {
          int v16 = v15;
          BOOL v15 = (void *)*v15;
        }
        while (v15);
      }
      else
      {
        do
        {
          int v16 = (void *)v5[2];
          BOOL v10 = *v16 == (void)v5;
          size_t v5 = v16;
        }
        while (!v10);
      }
      size_t v5 = v16;
      if (v16 == v4) {
        return 1;
      }
    }
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v26 = 0;
    ctu::cf::assign();
    *(_OWORD *)int v20 = *(_OWORD *)__p;
    uint64_t v21 = v26;
    BOOL v19 = v20;
    if (v26 < 0) {
      BOOL v19 = (void **)__p[0];
    }
    writeLog("Error: Failed to compute digest for basename of file at path: %s\n", (const char *)v19);
    if (SHIBYTE(v21) < 0) {
      operator delete(v20[0]);
    }
    ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&cf);
  }
  else
  {
    while (1)
    {
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v24, (const void **)v5 + 7);
      unsigned __int8 v7 = ComputeHash::digest_data(a3, (CFDataRef *)&v24);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v24);
      if ((v7 & 1) == 0) {
        break;
      }
      char v8 = (void *)v5[1];
      if (v8)
      {
        do
        {
          int v9 = v8;
          char v8 = (void *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          int v9 = (void *)v5[2];
          BOOL v10 = *v9 == (void)v5;
          size_t v5 = v9;
        }
        while (!v10);
      }
      size_t v5 = v9;
      if (v9 == v4)
      {
        size_t v5 = (void *)*a2;
        goto LABEL_10;
      }
    }
    uint64_t v18 = (const char *)(v5 + 4);
    if (*((char *)v5 + 55) < 0) {
      uint64_t v18 = *(const char **)v18;
    }
    writeLog("Error: Failed to compute digest of the fileData associated with the file : %s\n", v18);
  }
  return 0;
}

void sub_21FDCB0E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, char a18, int a19, const void *a20,__int16 a21,char a22,char a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a16 < 0) {
    operator delete(a11);
  }
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&a20);
  _Unwind_Resume(a1);
}

void CarrierBundle::printDeviceModelDigestMap(uint64_t a1, void *a2)
{
  uint64_t v2 = a2 + 1;
  uint64_t v3 = (void *)*a2;
  if ((void *)*a2 != a2 + 1)
  {
    do
    {
      writeLog("-----------------------------------------------------------\n");
      uint64_t v4 = (const char *)(v3 + 4);
      if (*((char *)v3 + 55) < 0) {
        uint64_t v4 = *(const char **)v4;
      }
      writeLog("Class name : %s, ", v4);
      BytePtr = CFDataGetBytePtr((CFDataRef)v3[7]);
      CFIndex Length = CFDataGetLength((CFDataRef)v3[7]);
      if (!BytePtr) {
        writeLog("dataBytes array returns a NULL pointer");
      }
      writeLog("Digest length = %ld, ", Length);
      writeLog("Digest : ");
      if (Length >= 1)
      {
        uint64_t v7 = 0;
        unsigned int v8 = 1;
        do
        {
          writeLog("%02x", BytePtr[v7]);
          uint64_t v7 = v8;
        }
        while (Length > v8++);
      }
      writeLog("\n");
      BOOL v10 = (void *)v3[1];
      if (v10)
      {
        do
        {
          CFAllocatorRef v11 = v10;
          BOOL v10 = (void *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          CFAllocatorRef v11 = (void *)v3[2];
          BOOL v12 = *v11 == (void)v3;
          uint64_t v3 = v11;
        }
        while (!v12);
      }
      uint64_t v3 = v11;
    }
    while (v11 != v2);
  }
}

void CarrierBundle::printDeviceFilesDigestMap(uint64_t a1, void *a2)
{
  uint64_t v2 = a2 + 1;
  uint64_t v3 = (void *)*a2;
  if ((void *)*a2 != a2 + 1)
  {
    do
    {
      writeLog("-----------------------------------------------------------\n");
      uint64_t v4 = (const char *)(v3 + 4);
      if (*((char *)v3 + 55) < 0) {
        uint64_t v4 = *(const char **)v4;
      }
      writeLog("Device Class = %s\n", v4);
      size_t v5 = (void *)v3[7];
      if (v5 != v3 + 8)
      {
        do
        {
          FileSystemManager::basename((uint64_t)(v5 + 4), __p);
          if (v13 >= 0) {
            size_t v6 = __p;
          }
          else {
            size_t v6 = (void **)__p[0];
          }
          writeLog("\t\t FileName = %s\t", (const char *)v6);
          if (v13 < 0) {
            operator delete(__p[0]);
          }
          if (CFDataGetBytePtr((CFDataRef)v5[7]))
          {
            CFDataGetLength((CFDataRef)v5[7]);
            writeLog("fileDataCFIndex Length = %ld \n");
          }
          else
          {
            writeLog("FileData is NULL\n");
          }
          uint64_t v7 = (void *)v5[1];
          if (v7)
          {
            do
            {
              unsigned int v8 = v7;
              uint64_t v7 = (void *)*v7;
            }
            while (v7);
          }
          else
          {
            do
            {
              unsigned int v8 = (void *)v5[2];
              BOOL v9 = *v8 == (void)v5;
              size_t v5 = v8;
            }
            while (!v9);
          }
          size_t v5 = v8;
        }
        while (v8 != v3 + 8);
      }
      BOOL v10 = (void *)v3[1];
      if (v10)
      {
        do
        {
          CFAllocatorRef v11 = v10;
          BOOL v10 = (void *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          CFAllocatorRef v11 = (void *)v3[2];
          BOOL v9 = *v11 == (void)v3;
          uint64_t v3 = v11;
        }
        while (!v9);
      }
      uint64_t v3 = v11;
    }
    while (v11 != v2);
  }
}

void sub_21FDCB434(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__list_imp<std::string>::clear(void *a1)
{
  if (a1[2])
  {
    uint64_t v3 = *a1;
    uint64_t v2 = a1[1];
    uint64_t v4 = *(void **)v2;
    v4[1] = *(void *)(*a1 + 8);
    **(void **)(v3 + 8) = v4;
    a1[2] = 0;
    while ((void *)v2 != a1)
    {
      uint64_t v5 = *(void *)(v2 + 8);
      std::__list_imp<std::string>::__delete_node[abi:ne180100]<>((int)a1, (void **)v2);
      uint64_t v2 = v5;
    }
  }
}

void std::__list_imp<std::string>::__delete_node[abi:ne180100]<>(int a1, void **__p)
{
  if (*((char *)__p + 39) < 0) {
    operator delete(__p[2]);
  }

  operator delete(__p);
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

const void **ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(const void **a1, const void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  if (v3) {
    CFRetain(v3);
  }
  return a1;
}

void std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::list<std::string>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::list<std::string>>,0>(uint64_t a1)
{
  std::__list_imp<std::string>::clear((void *)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

void std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,0>(uint64_t a1)
{
  std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy(a1 + 24, *(void **)(a1 + 32));
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

void std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,0>(uint64_t a1)
{
  std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::destroy(a1 + 24, *(void **)(a1 + 32));
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

uint64_t *std::list<std::string>::__sort<std::__less<void,void>>(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a1;
  if (a3 >= 2)
  {
    if (a3 == 2)
    {
      uint64_t v7 = *(uint64_t **)a2;
      if (std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>(a4, (const void **)(*(void *)a2 + 16), (const void **)(a1 + 16)))
      {
        uint64_t v8 = *v7;
        *(void *)(v8 + 8) = v7[1];
        *(void *)v7[1] = v8;
        uint64_t v9 = *(void *)v4;
        *(void *)(v9 + 8) = v7;
        uint64_t *v7 = v9;
        *(void *)uint64_t v4 = v7;
        v7[1] = v4;
        return v7;
      }
    }
    else
    {
      unint64_t v11 = a3 >> 1;
      unint64_t v12 = (a3 >> 1) + 1;
      uint64_t v13 = a1;
      do
      {
        uint64_t v13 = *(void *)(v13 + 8);
        --v12;
      }
      while (v12 > 1);
      uint64_t v14 = std::list<std::string>::__sort<std::__less<void,void>>(a1, v13, a3 >> 1, a4);
      uint64_t v4 = std::list<std::string>::__sort<std::__less<void,void>>(v13, a2, a3 - v11, a4);
      if (std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>(a4, (const void **)(v4 + 16), (const void **)(v14 + 16)))
      {
        for (uint64_t i = *(void *)(v4 + 8); i != a2; uint64_t i = *(void *)(i + 8))
        {
          if (!std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>(a4, (const void **)(i + 16), (const void **)(v14 + 16)))goto LABEL_14; {
        }
          }
        uint64_t i = a2;
LABEL_14:
        uint64_t v17 = *(void *)i;
        uint64_t v18 = *(void *)v4;
        *(void *)(v18 + 8) = *(void *)(*(void *)i + 8);
        **(void **)(v17 + 8) = v18;
        uint64_t v19 = *(void *)v14;
        int v16 = *(uint64_t **)(v14 + 8);
        *(void *)(v19 + 8) = v4;
        *(void *)uint64_t v4 = v19;
        *(void *)uint64_t v14 = v17;
        *(void *)(v17 + 8) = v14;
      }
      else
      {
        int v16 = *(uint64_t **)(v14 + 8);
        uint64_t i = v4;
        uint64_t v4 = v14;
      }
      if (v16 != (uint64_t *)i && i != a2)
      {
        uint64_t v20 = i;
        do
        {
          if (std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>(a4, (const void **)(i + 16), (const void **)v16 + 2))
          {
            for (uint64_t j = *(void *)(i + 8); j != a2; uint64_t j = *(void *)(j + 8))
            {
              if (!std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>(a4, (const void **)(j + 16), (const void **)v16 + 2))goto LABEL_25; {
            }
              }
            uint64_t j = a2;
LABEL_25:
            uint64_t v22 = *(void *)j;
            uint64_t v23 = *(void *)i;
            *(void *)(v23 + 8) = *(void *)(*(void *)j + 8);
            **(void **)(v22 + 8) = v23;
            if (v20 == i) {
              uint64_t v20 = j;
            }
            uint64_t v25 = (void *)*v16;
            char v24 = (uint64_t *)v16[1];
            v25[1] = i;
            *(void *)uint64_t i = v25;
            *int v16 = v22;
            *(void *)(v22 + 8) = v16;
            int v16 = v24;
            uint64_t i = j;
          }
          else
          {
            int v16 = (uint64_t *)v16[1];
          }
        }
        while (v16 != (uint64_t *)v20 && i != a2);
      }
    }
  }
  return (uint64_t *)v4;
}

BOOL std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>(uint64_t a1, const void **a2, const void **a3)
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
    size_t v6 = a2;
  }
  else {
    size_t v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = *a3;
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

uint64_t std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::find<std::string>(uint64_t a1, const void **a2)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 16;
  uint64_t v6 = a1 + 8;
  do
  {
    BOOL v7 = std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>(v5, (const void **)(v3 + 32), a2);
    uint64_t v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      uint64_t v8 = (uint64_t *)v3;
      uint64_t v6 = v3;
    }
    uint64_t v3 = *v8;
  }
  while (*v8);
  if (v6 == v2
    || std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>(v5, a2, (const void **)(v6 + 32)))
  {
    return v2;
  }
  return v6;
}

void *std::__list_imp<std::string>::__create_node[abi:ne180100]<std::string const&>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v7 = operator new(0x28uLL);
  void *v7 = a2;
  v7[1] = a3;
  uint64_t v8 = (std::string *)(v7 + 2);
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

void sub_21FDCBAE8(_Unwind_Exception *a1)
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

std::string *std::pair<std::string,std::list<std::string>>::pair[abi:ne180100]<std::string&,std::list<std::string>&,0>(std::string *this, long long *a2, uint64_t a3)
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
  std::list<std::string>::list((uint64_t *)&this[1], a3);
  return this;
}

void sub_21FDCBBFC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::list<std::string>::list(uint64_t *a1, uint64_t a2)
{
  *a1 = (uint64_t)a1;
  a1[1] = (uint64_t)a1;
  a1[2] = 0;
  for (uint64_t i = *(void *)(a2 + 8); i != a2; uint64_t i = *(void *)(i + 8))
  {
    long long v5 = std::__list_imp<std::string>::__create_node[abi:ne180100]<std::string const&>((uint64_t)a1, 0, 0, i + 16);
    uint64_t v6 = *a1;
    *long long v5 = *a1;
    v5[1] = a1;
    *(void *)(v6 + 8) = v5;
    *a1 = (uint64_t)v5;
    ++a1[2];
  }
  return a1;
}

void sub_21FDCBC98(_Unwind_Exception *a1)
{
  std::__list_imp<std::string>::clear(v1);
  _Unwind_Resume(a1);
}

char *std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,std::list<std::string>>>(uint64_t **a1, const void **a2, uint64_t a3)
{
  long long v5 = (void **)std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__find_equal<std::string>((uint64_t)a1, &v12, a2);
  uint64_t v6 = (char *)*v5;
  if (!*v5)
  {
    std::string::size_type v7 = (uint64_t **)v5;
    uint64_t v6 = (char *)operator new(0x50uLL);
    v10[1] = a1 + 1;
    *((_OWORD *)v6 + 2) = *(_OWORD *)a3;
    uint64_t v8 = *(void *)(a3 + 16);
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *((void *)v6 + 6) = v8;
    *((void *)v6 + 7) = v6 + 56;
    *((void *)v6 + 8) = v6 + 56;
    *((void *)v6 + 9) = 0;
    std::list<std::string>::splice((uint64_t)(v6 + 56), (uint64_t *)v6 + 7, (void *)(a3 + 24));
    char v11 = 1;
    std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__insert_node_at(a1, v12, v7, (uint64_t *)v6);
    v10[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::list<std::string>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::list<std::string>>,void *>>>>::reset[abi:ne180100]((uint64_t)v10, 0);
  }
  return v6;
}

void *std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__find_equal<std::string>(uint64_t a1, void *a2, const void **a3)
{
  long long v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v8 = (void *)v4;
        size_t v9 = (const void **)(v4 + 32);
        if (!std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>(v7, a3, (const void **)(v4 + 32)))break; {
        uint64_t v4 = *v8;
        }
        long long v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>(v7, v9, a3)) {
        break;
      }
      long long v5 = v8 + 1;
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

uint64_t *std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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

uint64_t std::list<std::string>::splice(uint64_t result, uint64_t *a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (v3)
  {
    uint64_t v5 = *a3;
    uint64_t v4 = (uint64_t *)a3[1];
    uint64_t v6 = *v4;
    *(void *)(v6 + 8) = *(void *)(*a3 + 8);
    **(void **)(v5 + 8) = v6;
    uint64_t v7 = *a2;
    *(void *)(v7 + 8) = v4;
    uint64_t *v4 = v7;
    *a2 = v5;
    *(void *)(v5 + 8) = a2;
    *(void *)(result + 16) += v3;
    a3[2] = 0;
  }
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
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            size_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            size_t v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              void v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)vstd::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::destroy((uint64_t)this + 8, *((void **)this + 2)) = v9;
            *size_t v9 = v2;
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
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)vstd::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::destroy((uint64_t)this + 8, *((void **)this + 2)) = a2;
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

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::list<std::string>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::list<std::string>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::list<std::string>>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

void std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,ctu::cf::CFSharedRef<__CFData const>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,ctu::cf::CFSharedRef<__CFData const>>,0>(uint64_t a1)
{
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

std::string *std::pair<std::string,ctu::cf::CFSharedRef<__CFData const>>::pair[abi:ne180100]<std::string&,ctu::cf::CFSharedRef<__CFData const>&,0>(std::string *this, long long *a2, const void **a3)
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
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef((const void **)&this[1].__r_.__value_.__l.__data_, a3);
  return this;
}

_OWORD *std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,ctu::cf::CFSharedRef<__CFData const>>>(uint64_t **a1, const void **a2, long long *a3)
{
  long long v5 = (void **)std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__find_equal<std::string>((uint64_t)a1, &v14, a2);
  int v6 = *v5;
  if (!*v5)
  {
    uint64_t v7 = (uint64_t **)v5;
    int v6 = operator new(0x40uLL);
    v12[1] = a1 + 1;
    long long v8 = *a3;
    *(void *)a3 = 0;
    *((void *)a3 + 1) = 0;
    uint64_t v9 = *((void *)a3 + 2);
    uint64_t v10 = *((void *)a3 + 3);
    *((void *)a3 + 2) = 0;
    *((void *)a3 + 3) = 0;
    v6[2] = v8;
    *((void *)v6 + 6) = v9;
    *((void *)v6 + 7) = v10;
    char v13 = 1;
    std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__insert_node_at(a1, v14, v7, (uint64_t *)v6);
    v12[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,void *>>>>::reset[abi:ne180100]((uint64_t)v12, 0);
  }
  return v6;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,ctu::cf::CFSharedRef<__CFData const>>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

std::string *std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>::pair[abi:ne180100]<std::string const&,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>&,0>(std::string *this, long long *a2, const void ***a3)
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
  std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>::map[abi:ne180100]((uint64_t *)&this[1], a3);
  return this;
}

void sub_21FDCC32C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>::map[abi:ne180100](uint64_t *a1, const void ***a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,void *> *,long>>>(a1, *a2, a2 + 1);
  return a1;
}

void sub_21FDCC388(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,void *> *,long>>>(uint64_t *result, const void **a2, const void ***a3)
{
  if (a2 != (const void **)a3)
  {
    uint64_t v4 = a2;
    long long v5 = (uint64_t **)result;
    int v6 = result + 1;
    do
    {
      uint64_t result = std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,ctu::cf::CFSharedRef<__CFData const>> const&>(v5, v6, v4 + 4, (long long *)v4 + 2);
      uint64_t v7 = (const void **)v4[1];
      if (v7)
      {
        do
        {
          long long v8 = (const void ***)v7;
          uint64_t v7 = (const void **)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          long long v8 = (const void ***)v4[2];
          BOOL v9 = *v8 == v4;
          uint64_t v4 = (const void **)v8;
        }
        while (!v9);
      }
      uint64_t v4 = (const void **)v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,ctu::cf::CFSharedRef<__CFData const>> const&>(uint64_t **a1, uint64_t *a2, const void **a3, long long *a4)
{
  int v6 = std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__find_equal<std::string>(a1, a2, &v12, &v11, a3);
  uint64_t v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    long long v8 = (uint64_t **)v6;
    std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__construct_node<std::pair<std::string const,ctu::cf::CFSharedRef<__CFData const>> const&>((uint64_t)a1, a4, (uint64_t)v10);
    std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__insert_node_at(a1, (uint64_t)v12, v8, v10[0]);
    uint64_t v7 = v10[0];
    v10[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,void *>>>>::reset[abi:ne180100]((uint64_t)v10, 0);
  }
  return v7;
}

const void **std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__find_equal<std::string>(void *a1, uint64_t *a2, const void ***a3, uint64_t *a4, const void **a5)
{
  BOOL v9 = (const void **)(a1 + 1);
  if (a1 + 1 != a2
    && !std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>((uint64_t)(a1 + 2), a5, (const void **)a2 + 4))
  {
    if (!std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>((uint64_t)(a1 + 2), (const void **)a2 + 4, a5))
    {
      *a3 = (const void **)a2;
      *a4 = (uint64_t)a2;
      return (const void **)a4;
    }
    a4 = a2 + 1;
    uint64_t v13 = a2[1];
    if (v13)
    {
      uint64_t v14 = (const void **)a2[1];
      do
      {
        BOOL v15 = v14;
        uint64_t v14 = (const void **)*v14;
      }
      while (v14);
    }
    else
    {
      uint64_t v18 = (const void **)a2;
      do
      {
        BOOL v15 = (const void **)v18[2];
        BOOL v17 = *v15 == v18;
        uint64_t v18 = v15;
      }
      while (!v17);
    }
    if (v15 != v9)
    {
      if (!std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>((uint64_t)(a1 + 2), a5, v15 + 4)) {
        goto LABEL_28;
      }
      uint64_t v13 = *a4;
    }
    if (v13)
    {
      *a3 = v15;
      return v15;
    }
    else
    {
      *a3 = (const void **)a2;
    }
    return (const void **)a4;
  }
  if ((uint64_t *)*a1 == a2)
  {
    uint64_t v12 = (const void **)a2;
LABEL_16:
    if (*a2)
    {
      *a3 = v12;
      return v12 + 1;
    }
    else
    {
      *a3 = (const void **)a2;
      return (const void **)a2;
    }
  }
  uint64_t v11 = (const void **)*a2;
  if (*a2)
  {
    do
    {
      uint64_t v12 = v11;
      uint64_t v11 = (const void **)v11[1];
    }
    while (v11);
  }
  else
  {
    int v16 = a2;
    do
    {
      uint64_t v12 = (const void **)v16[2];
      BOOL v17 = *v12 == v16;
      int v16 = (uint64_t *)v12;
    }
    while (v17);
  }
  if (std::__less<void,void>::operator()[abi:ne180100]<std::string,std::string>((uint64_t)(a1 + 2), v12 + 4, a5)) {
    goto LABEL_16;
  }
LABEL_28:

  return (const void **)std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__find_equal<std::string>((uint64_t)a1, a3, a5);
}

std::string *std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__construct_node<std::pair<std::string const,ctu::cf::CFSharedRef<__CFData const>> const&>@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  int v6 = (char *)operator new(0x40uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t result = std::pair<std::string const,ctu::cf::CFSharedRef<__CFData const>>::pair[abi:ne180100]((std::string *)(v6 + 32), a2);
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_21FDCC6C4(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,ctu::cf::CFSharedRef<__CFData const>>::pair[abi:ne180100](std::string *this, long long *a2)
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
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef((const void **)&this[1].__r_.__value_.__l.__data_, (const void **)a2 + 3);
  return this;
}

uint64_t *std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>(uint64_t **a1, const void **a2, uint64_t a3)
{
  uint64_t v5 = (uint64_t **)std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__find_equal<std::string>((uint64_t)a1, &v10, a2);
  int v6 = *v5;
  if (!*v5)
  {
    uint64_t v7 = v5;
    std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::__construct_node<std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>((uint64_t)a1, a3, (uint64_t)v9);
    std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__insert_node_at(a1, v10, v7, v9[0]);
    int v6 = v9[0];
    v9[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,void *>>>>::reset[abi:ne180100]((uint64_t)v9, 0);
  }
  return v6;
}

_OWORD *std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::__construct_node<std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t result = operator new(0x50uLL);
  *(void *)a3 = result;
  *(void *)(a3 + 8) = v5;
  result[2] = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  *(void *)(a2 + 16) = 0;
  BOOL v9 = (void *)(a2 + 32);
  uint64_t v10 = *(void *)(a2 + 32);
  *((void *)result + 6) = v7;
  *((void *)result + 7) = v8;
  *((void *)result + 8) = v10;
  uint64_t v11 = (char *)(result + 4);
  uint64_t v12 = *(void *)(a2 + 40);
  *((void *)result + 9) = v12;
  if (v12)
  {
    *(void *)(v10 + 16) = v11;
    *(void *)(a2 + 24) = v9;
    *BOOL v9 = 0;
    *(void *)(a2 + 40) = 0;
  }
  else
  {
    *((void *)result + 7) = v11;
  }
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

void std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,ctu::cf::CFSharedRef<__CFDictionary const>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,ctu::cf::CFSharedRef<__CFDictionary const>>,0>(uint64_t a1)
{
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

_OWORD *std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>(uint64_t **a1, const void **a2, long long *a3)
{
  uint64_t v5 = (void **)std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__find_equal<std::string>((uint64_t)a1, &v14, a2);
  int v6 = *v5;
  if (!*v5)
  {
    uint64_t v7 = (uint64_t **)v5;
    int v6 = operator new(0x40uLL);
    v12[1] = a1 + 1;
    long long v8 = *a3;
    *(void *)a3 = 0;
    *((void *)a3 + 1) = 0;
    uint64_t v9 = *((void *)a3 + 2);
    uint64_t v10 = *((void *)a3 + 3);
    *((void *)a3 + 2) = 0;
    *((void *)a3 + 3) = 0;
    v6[2] = v8;
    *((void *)v6 + 6) = v9;
    *((void *)v6 + 7) = v10;
    char v13 = 1;
    std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__insert_node_at(a1, v14, v7, (uint64_t *)v6);
    v12[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,void *>>>>::reset[abi:ne180100]((uint64_t)v12, 0);
  }
  return v6;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,ctu::cf::CFSharedRef<__CFDictionary const>>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

std::string *std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>::pair[abi:ne180100]<std::string const&,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>&,0>(std::string *this, long long *a2, const void ***a3)
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
  std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>::map[abi:ne180100]((uint64_t *)&this[1], a3);
  return this;
}

void sub_21FDCCAD0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>::map[abi:ne180100](uint64_t *a1, const void ***a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,void *> *,long>>>(a1, *a2, a2 + 1);
  return a1;
}

void sub_21FDCCB2C(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,void *> *,long>>>(uint64_t *result, const void **a2, const void ***a3)
{
  if (a2 != (const void **)a3)
  {
    long long v4 = a2;
    long long v5 = (uint64_t **)result;
    int v6 = result + 1;
    do
    {
      uint64_t result = std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,ctu::cf::CFSharedRef<__CFDictionary const>> const&>(v5, v6, v4 + 4, (long long *)v4 + 2);
      uint64_t v7 = (const void **)v4[1];
      if (v7)
      {
        do
        {
          long long v8 = (const void ***)v7;
          uint64_t v7 = (const void **)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          long long v8 = (const void ***)v4[2];
          BOOL v9 = *v8 == v4;
          long long v4 = (const void **)v8;
        }
        while (!v9);
      }
      long long v4 = (const void **)v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,ctu::cf::CFSharedRef<__CFDictionary const>> const&>(uint64_t **a1, uint64_t *a2, const void **a3, long long *a4)
{
  int v6 = std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFData const>>>>::__find_equal<std::string>(a1, a2, &v12, &v11, a3);
  uint64_t v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    long long v8 = (uint64_t **)v6;
    std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::__construct_node<std::pair<std::string const,ctu::cf::CFSharedRef<__CFDictionary const>> const&>((uint64_t)a1, a4, (uint64_t)v10);
    std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__insert_node_at(a1, (uint64_t)v12, v8, v10[0]);
    uint64_t v7 = v10[0];
    v10[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,void *>>>>::reset[abi:ne180100]((uint64_t)v10, 0);
  }
  return v7;
}

std::string *std::__tree<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>::__construct_node<std::pair<std::string const,ctu::cf::CFSharedRef<__CFDictionary const>> const&>@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  int v6 = (char *)operator new(0x40uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t result = std::pair<std::string const,ctu::cf::CFSharedRef<__CFDictionary const>>::pair[abi:ne180100]((std::string *)(v6 + 32), a2);
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_21FDCCCBC(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,ctu::cf::CFSharedRef<__CFDictionary const>>::pair[abi:ne180100](std::string *this, long long *a2)
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
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef((const void **)&this[1].__r_.__value_.__l.__data_, (const void **)a2 + 3);
  return this;
}

uint64_t *std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>>(uint64_t **a1, const void **a2, uint64_t a3)
{
  uint64_t v5 = (uint64_t **)std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__find_equal<std::string>((uint64_t)a1, &v10, a2);
  int v6 = *v5;
  if (!*v5)
  {
    uint64_t v7 = v5;
    std::__tree<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>>::__construct_node<std::pair<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFData const>>>>((uint64_t)a1, a3, (uint64_t)v9);
    std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__insert_node_at(a1, v10, v7, v9[0]);
    int v6 = v9[0];
    v9[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,void *>>>>::reset[abi:ne180100]((uint64_t)v9, 0);
  }
  return v6;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::map<std::string,ctu::cf::CFSharedRef<__CFDictionary const>>>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
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
    int v6 = operator new(v4 + 1);
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

std::string *std::pair<std::string,std::string>::pair[abi:ne180100]<std::string&,std::string&,0>(std::string *this, long long *a2, long long *a3)
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
  int v6 = this + 1;
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *(const std::string::value_type **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v7 = *a3;
    this[1].__r_.__value_.__r.__words[2] = *((void *)a3 + 2);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  return this;
}

void sub_21FDCCF20(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void getSignatureFileName(std::string *a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0;
  long long v12 = 0uLL;
  if (std::string::compare(a1, "common"))
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "overrides");
    uint64_t v4 = std::string::append(&__p, "_");
    long long v5 = (void *)v4->__r_.__value_.__r.__words[0];
    v13.__r_.__value_.__r.__words[0] = v4->__r_.__value_.__l.__size_;
    *(std::string::size_type *)((char *)v13.__r_.__value_.__r.__words + 7) = *(std::string::size_type *)((char *)&v4->__r_.__value_.__r.__words[1] + 7);
    char v6 = HIBYTE(v4->__r_.__value_.__r.__words[2]);
    v4->__r_.__value_.__l.__size_ = 0;
    v4->__r_.__value_.__r.__words[2] = 0;
    v4->__r_.__value_.__r.__words[0] = 0;
    *(void *)((char *)&v12 + 7) = *(std::string::size_type *)((char *)v13.__r_.__value_.__r.__words + 7);
    uint64_t v11 = v5;
    *(void *)&long long v12 = v13.__r_.__value_.__r.__words[0];
    HIBYTE(v12) = v6;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)&v11, (const void **)&a1->__r_.__value_.__l.__data_, (uint64_t)&v13);
  long long v7 = std::string::append(&v13, ".");
  long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v8;
  v7->__r_.__value_.__l.__size_ = 0;
  v7->__r_.__value_.__r.__words[2] = 0;
  v7->__r_.__value_.__r.__words[0] = 0;
  BOOL v9 = std::string::append(&__p, "plist");
  *a2 = *v9;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v12) < 0) {
    operator delete(v11);
  }
}

void sub_21FDCD09C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::string *getSignatureDirPath@<X0>(std::string *__str@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::operator=(a2, __str);
  std::string::size_type size = HIBYTE(__str->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) != 0) {
    std::string::size_type size = __str->__r_.__value_.__l.__size_;
  }
  if (*std::string::at(__str, size - 1) != 47) {
    std::string::append(a2, "/");
  }
  return std::string::append(a2, "signatures");
}

void sub_21FDCD188(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void FileSystemManager::FileSystemManager(FileSystemManager *this)
{
  *(void *)this = objc_alloc_init(MEMORY[0x263F086B0]);
}

{
  *(void *)this = objc_alloc_init(MEMORY[0x263F086B0]);
}

void FileSystemManager::~FileSystemManager(id *this)
{
}

{
}

void *FileSystemManager::basename@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (*(char *)(a1 + 23) >= 0) {
    uint64_t v3 = (const char *)a1;
  }
  else {
    uint64_t v3 = *(const char **)a1;
  }
  strlcpy(__dst, v3, 0x400uLL);
  uint64_t v4 = basename(__dst);
  return std::string::basic_string[abi:ne180100]<0>(a2, v4);
}

void *FileSystemManager::dirname@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (*(char *)(a1 + 23) >= 0) {
    uint64_t v3 = (const char *)a1;
  }
  else {
    uint64_t v3 = *(const char **)a1;
  }
  strlcpy(__dst, v3, 0x400uLL);
  uint64_t v4 = dirname(__dst);
  return std::string::basic_string[abi:ne180100]<0>(a2, v4);
}

BOOL FileSystemManager::directoryContentsAtPath(char *a1, void *a2, int a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v34 = 0;
  char v6 = (void *)[MEMORY[0x263F08850] defaultManager];
  if (a1[23] >= 0) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = *(char **)a1;
  }
  obuint64_t j = (id)[v6 contentsOfDirectoryAtPath:[NSString stringWithUTF8String:v7] error:&v34];
  if (obj)
  {
    std::__list_imp<std::string>::clear(a2);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          std::string __p = 0;
          long long v29 = 0uLL;
          if (a3)
          {
            if (a1[23] >= 0) {
              size_t v12 = a1[23];
            }
            else {
              size_t v12 = *((void *)a1 + 1);
            }
            std::string::basic_string[abi:ne180100]((uint64_t)&v27, v12 + 1);
            if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string v13 = &v27;
            }
            else {
              std::string v13 = (std::string *)v27.__r_.__value_.__r.__words[0];
            }
            if (v12)
            {
              if (a1[23] >= 0) {
                uint64_t v14 = a1;
              }
              else {
                uint64_t v14 = *(char **)a1;
              }
              memmove(v13, v14, v12);
            }
            *(_WORD *)((char *)&v13->__r_.__value_.__l.__data_ + v12) = 47;
            std::string::basic_string[abi:ne180100]<0>(v25, (char *)[v11 UTF8String]);
            if ((v26 & 0x80u) == 0) {
              BOOL v15 = v25;
            }
            else {
              BOOL v15 = (void **)v25[0];
            }
            if ((v26 & 0x80u) == 0) {
              std::string::size_type v16 = v26;
            }
            else {
              std::string::size_type v16 = (std::string::size_type)v25[1];
            }
            BOOL v17 = std::string::append(&v27, (const std::string::value_type *)v15, v16);
            uint64_t v18 = (void *)v17->__r_.__value_.__r.__words[0];
            v35[0] = v17->__r_.__value_.__l.__size_;
            *(void *)((char *)v35 + 7) = *(std::string::size_type *)((char *)&v17->__r_.__value_.__r.__words[1] + 7);
            char v19 = HIBYTE(v17->__r_.__value_.__r.__words[2]);
            v17->__r_.__value_.__l.__size_ = 0;
            v17->__r_.__value_.__r.__words[2] = 0;
            v17->__r_.__value_.__r.__words[0] = 0;
            if (SHIBYTE(v29) < 0) {
              operator delete(__p);
            }
            std::string __p = v18;
            *(void *)&long long v29 = v35[0];
            *(void *)((char *)&v29 + 7) = *(void *)((char *)v35 + 7);
            HIBYTE(v29) = v19;
            if ((char)v26 < 0) {
              operator delete(v25[0]);
            }
            if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v27.__r_.__value_.__l.__data_);
            }
          }
          else
          {
            MEMORY[0x223C5E9C0](&__p, [v11 UTF8String]);
          }
          uint64_t v20 = std::__list_imp<std::string>::__create_node[abi:ne180100]<std::string const&>((uint64_t)a2, 0, 0, (uint64_t)&__p);
          *uint64_t v20 = a2;
          uint64_t v21 = (void *)a2[1];
          v20[1] = v21;
          *uint64_t v21 = v20;
          uint64_t v22 = a2[2] + 1;
          a2[1] = v20;
          a2[2] = v22;
          if (SHIBYTE(v29) < 0) {
            operator delete(__p);
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v8);
    }
  }
  return !v34 || [v34 code] == 0;
}

void sub_21FDCD648(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

BOOL FileSystemManager::isRegularFile(const char *a1)
{
  memset(&v2, 0, sizeof(v2));
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  return !lstat(a1, &v2) && (v2.st_mode & 0xF000) == 0x8000;
}

BOOL FileSystemManager::isDirectory(const char *a1)
{
  memset(&v2, 0, sizeof(v2));
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  return !lstat(a1, &v2) && (v2.st_mode & 0xF000) == 0x4000;
}

BOOL FileSystemManager::isSymlink(const char *a1)
{
  memset(&v2, 0, sizeof(v2));
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  return !lstat(a1, &v2) && (v2.st_mode & 0xF000) == 0xA000;
}

CFDataRef FileSystemManager::copyBinaryPlistAsXML(uint64_t a1)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (*(char *)(a1 + 23) >= 0) {
    stat v2 = (const char *)a1;
  }
  else {
    stat v2 = *(const char **)a1;
  }
  CFStringRef v3 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v2, 0x8000100u);
  CFStringRef v16 = v3;
  if (v3) {
    uint64_t v4 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
  }
  else {
    uint64_t v4 = 0;
  }
  if (v4)
  {
    CFURLRef v5 = CFURLCreateWithFileSystemPath(v1, v3, kCFURLPOSIXPathStyle, 0);
    CFURLRef v15 = v5;
    if (v5) {
      char v6 = ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::get;
    }
    else {
      char v6 = 0;
    }
    if (v6)
    {
      uint64_t v7 = CFReadStreamCreateWithFile(v1, v5);
      CFReadStreamRef stream = v7;
      if (v7) {
        uint64_t v8 = ctu::SharedRef<__CFReadStream,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFReadStream>::get;
      }
      else {
        uint64_t v8 = 0;
      }
      if (v8 && CFReadStreamOpen(v7))
      {
        CFPropertyListRef v9 = CFPropertyListCreateWithStream(v1, stream, 0, 0, 0, 0);
        std::string v13 = v9;
        if (v9) {
          uint64_t v10 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
        }
        else {
          uint64_t v10 = 0;
        }
        if (v10)
        {
          CFDataRef Data = CFPropertyListCreateData(v1, v9, kCFPropertyListXMLFormat_v1_0, 0, 0);
          CFReadStreamClose(stream);
        }
        else
        {
          CFDataRef Data = 0;
        }
        ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&v13);
      }
      else
      {
        CFDataRef Data = 0;
      }
      ctu::SharedRef<__CFReadStream,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFReadStream>::~SharedRef((const void **)&stream);
    }
    else
    {
      CFDataRef Data = 0;
    }
    ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::~SharedRef((const void **)&v15);
  }
  else
  {
    CFDataRef Data = 0;
  }
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v16);
  return Data;
}

void sub_21FDCD960(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  CFStringRef v3 = va_arg(va1, const void *);
  va_copy(va2, va1);
  CFURLRef v5 = va_arg(va2, const void *);
  ctu::SharedRef<__CFReadStream,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFReadStream>::~SharedRef((const void **)va);
  ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::~SharedRef((const void **)va1);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)va2);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ctu::SharedRef<__CFReadStream,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFReadStream>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get(uint64_t a1)
{
  return *(void *)a1;
}

BOOL FileSystemManager::isHiddenFile(uint64_t a1)
{
  FileSystemManager::basename(a1, &v3);
  int v1 = *std::string::at(&v3, 0);
  if (SHIBYTE(v3.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v3.__r_.__value_.__l.__data_);
  }
  return v1 == 46;
}

void sub_21FDCDA14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void FileSystemManager::getFileExtension(uint64_t *a1)
{
  if (*((char *)a1 + 23) >= 0) {
    int v1 = a1;
  }
  else {
    int v1 = (uint64_t *)*a1;
  }
  [((id)objc_msgSend((id)objc_msgSend(NSString, "stringWithCString:encoding:", v1, 4), "pathExtension")) cStringUsingEncoding:4];

  JUMPOUT(0x223C5E9C0);
}

void FileSystemManager::getFileNameWithExtensionRemoved(uint64_t *a1)
{
  if (*((char *)a1 + 23) >= 0) {
    int v1 = a1;
  }
  else {
    int v1 = (uint64_t *)*a1;
  }
  [((id)objc_msgSend((id)objc_msgSend(NSString, "stringWithCString:encoding:", v1, 4), "stringByDeletingPathExtension")) cStringUsingEncoding:4];

  JUMPOUT(0x223C5E9C0);
}

ssize_t FileSystemManager::readLink@<X0>(const char *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  ssize_t result = readlink(a1, v4, 0x3FFuLL);
  if (result != -1)
  {
    v4[result] = 0;
    return MEMORY[0x223C5E9C0](a2, v4);
  }
  return result;
}

void sub_21FDCDB9C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t FileSystemManager::copyItem(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *((unsigned __int8 *)a1 + 23);
  if ((v2 & 0x80u) != 0) {
    uint64_t v2 = a1[1];
  }
  if (!v2) {
    return 0;
  }
  if (*((char *)a2 + 23) < 0)
  {
    if (!a2[1]) {
      return 0;
    }
    a2 = (uint64_t *)*a2;
  }
  else if (!*((unsigned char *)a2 + 23))
  {
    return 0;
  }
  uint64_t v4 = [NSString stringWithCString:a2 encoding:4];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:", v4)
    && !objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtPath:error:", v4, 0))
  {
    return 0;
  }
  if (*((char *)a1 + 23) >= 0) {
    uint64_t v5 = a1;
  }
  else {
    uint64_t v5 = (uint64_t *)*a1;
  }
  uint64_t v6 = [NSString stringWithCString:v5 encoding:4];
  uint64_t v7 = (void *)[MEMORY[0x263F08850] defaultManager];

  return [v7 copyItemAtPath:v6 toPath:v4 error:0];
}

uint64_t FileSystemManager::removeItem(uint64_t *a1, uint64_t *a2)
{
  if (*((char *)a1 + 23) >= 0) {
    std::string v3 = a1;
  }
  else {
    std::string v3 = (uint64_t *)*a1;
  }
  uint64_t v4 = (void *)[NSString stringWithCString:v3 encoding:4];
  if (*((char *)a2 + 23) >= 0) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = (uint64_t *)*a2;
  }
  uint64_t v6 = [v4 stringByAppendingPathComponent:[NSString stringWithCString:v5 encoding:4]];
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:", v6)) {
    return 1;
  }
  uint64_t result = [[(id)objc_msgSend(MEMORY[0x263F08850], "defaultManager") removeItemAtPath:v6 error:0];
  if (result) {
    return 1;
  }
  return result;
}

void *FileSystemManager::dictionaryFromPath@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  if (*((char *)a1 + 23) >= 0) {
    std::string v3 = a1;
  }
  else {
    std::string v3 = (uint64_t *)*a1;
  }
  uint64_t v4 = (const void *)[NSDictionary dictionaryWithContentsOfFile:[NSString stringWithCString:v3 encoding:1]];

  return ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(a2, v4);
}

uint64_t FileSystemManager::fileContentsAtPath@<X0>(uint64_t this@<X0>, void *a2@<X8>)
{
  if (this)
  {
    uint64_t v4 = this;
    id v5 = objc_alloc(MEMORY[0x263EFF8F8]);
    this = [v5 initWithContentsOfFile:[NSString stringWithUTF8String:v4]];
  }
  *a2 = this;
  return this;
}

uint64_t FileSystemManager::writeDictionaryToPath(uint64_t *a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  if (*((char *)a1 + 23) >= 0) {
    std::string v3 = a1;
  }
  else {
    std::string v3 = (uint64_t *)*a1;
  }
  uint64_t v4 = [NSString stringWithUTF8String:v3];

  return [a2 writeToFile:v4 atomically:1];
}

const void **ctu::SharedRef<__CFReadStream,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFReadStream>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void ComputeHashForCarrierBundle::getDeviceModelName(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  memset(&v23, 0, sizeof(v23));
  memset(&__p, 0, sizeof(__p));
  uint64_t v3 = *(unsigned __int8 *)(a1 + 23);
  if ((v3 & 0x80u) != 0) {
    uint64_t v3 = *(void *)(a1 + 8);
  }
  if (!v3) {
    goto LABEL_7;
  }
  MEMORY[0x223C5E9C0](&v23, "common");
  unint64_t v5 = *(unsigned __int8 *)(a1 + 23);
  if ((v5 & 0x80u) != 0) {
    unint64_t v5 = *(void *)(a1 + 8);
  }
  if (v5 <= 8)
  {
LABEL_7:
    std::pair<std::string,std::string>::pair[abi:ne180100]<std::string&,std::string&,0>(a2, (long long *)&v23, (long long *)&__p);
    goto LABEL_21;
  }
  std::string::basic_string(&v21, (const std::string *)a1, 0, 9uLL, (std::allocator<char> *)&__str);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
  {
    if (v21.__r_.__value_.__l.__size_ != 9) {
      goto LABEL_18;
    }
    uint64_t v6 = (std::string *)v21.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) != 9) {
      goto LABEL_18;
    }
    uint64_t v6 = &v21;
  }
  std::string::size_type v7 = v6->__r_.__value_.__r.__words[0];
  int v8 = v6->__r_.__value_.__s.__data_[8];
  if (v7 == 0x656469727265766FLL && v8 == 115)
  {
    std::string::basic_string(&__str, (const std::string *)a1, 9uLL, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v19);
    std::string::size_type size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = __str.__r_.__value_.__l.__size_;
    }
    if (size && *std::string::at(&__str, 0) == 42)
    {
      p_str = &__str;
      std::string::erase(&__str, 0, 1uLL);
      if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        std::string::size_type v12 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
      }
      else
      {
        std::string::size_type v12 = __str.__r_.__value_.__l.__size_;
        p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
      }
      for (; v12; --v12)
      {
        int v13 = p_str->__r_.__value_.__s.__data_[0];
        if (v13 == 46) {
          break;
        }
        if (v13 == 95) {
          break;
        }
        std::string::push_back(&__p, v13);
        p_str = (std::string *)((char *)p_str + 1);
      }
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v14 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v14 = __p.__r_.__value_.__l.__size_;
    }
    std::string::basic_string(&v19, &__str, v14, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v24);
    std::string::size_type v15 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type v15 = __str.__r_.__value_.__l.__size_;
    }
    if (v15 && *std::string::at(&v19, 0) == 95)
    {
      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
      {
        *v23.__r_.__value_.__l.__data_ = 0;
        v23.__r_.__value_.__l.__size_ = 0;
      }
      else
      {
        v23.__r_.__value_.__s.__data_[0] = 0;
        *((unsigned char *)&v23.__r_.__value_.__s + 23) = 0;
      }
      CFStringRef v16 = &v19;
      std::string::erase(&v19, 0, 1uLL);
      if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        std::string::size_type v17 = HIBYTE(v19.__r_.__value_.__r.__words[2]);
      }
      else
      {
        std::string::size_type v17 = v19.__r_.__value_.__l.__size_;
        CFStringRef v16 = (std::string *)v19.__r_.__value_.__r.__words[0];
      }
      for (; v17; --v17)
      {
        int v18 = v16->__r_.__value_.__s.__data_[0];
        if (v18 == 46) {
          break;
        }
        std::string::push_back(&v23, v18);
        CFStringRef v16 = (std::string *)((char *)v16 + 1);
      }
    }
    std::pair<std::string,std::string>::pair[abi:ne180100]<std::string&,std::string&,0>(a2, (long long *)&v23, (long long *)&__p);
    if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v19.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__str.__r_.__value_.__l.__data_);
    }
    goto LABEL_19;
  }
LABEL_18:
  std::pair<std::string,std::string>::pair[abi:ne180100]<std::string&,std::string&,0>(a2, (long long *)&v23, (long long *)&__p);
LABEL_19:
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v21.__r_.__value_.__l.__data_);
  }
LABEL_21:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v23.__r_.__value_.__l.__data_);
  }
}

void sub_21FDCE200(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a32 < 0) {
    operator delete(a27);
  }
  if (*(char *)(v32 - 41) < 0) {
    operator delete(*(void **)(v32 - 64));
  }
  _Unwind_Resume(exception_object);
}

uint64_t ComputeHashForCarrierBundle::computeIpccDigest(char *a1, ComputeHash *this, const void **a3)
{
  if ((ComputeHash::init(this) & 1) == 0)
  {
    writeLog("Error:ComputeHash object needs to be reset before initilazing\n");
    return 0;
  }
  if (a1[23] >= 0) {
    uint64_t v6 = (FileSystemManager *)a1;
  }
  else {
    uint64_t v6 = *(FileSystemManager **)a1;
  }
  if ((ComputeHash::digest_file(this, v6) & 1) == 0)
  {
    writeLog("Error: Failed to compute digest for %s\n");
    return 0;
  }
  ComputeHash::finalize(this, (CFDataRef *)&v9);
  if (&v9 != a3)
  {
    std::string::size_type v7 = *a3;
    *a3 = v9;
    CFPropertyListRef v9 = 0;
    uint64_t v10 = v7;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v10);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v9);
  return 1;
}

BOOL ComputeHashForCarrierBundle::computeVersionXmlDigestLegacy(uint64_t a1, ComputeHash *this, CFDictionaryRef *a3)
{
  if ((ComputeHash::init(this) & 1) == 0)
  {
    writeLog("Error:ComputeHash object needs to be reset before initilazing\n");
    return 0;
  }
  uint64_t v6 = *(unsigned __int8 *)(a1 + 23);
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *(void *)(a1 + 8);
  }
  if (!v6)
  {
    writeLog("Error: Invalid version.xml file");
    return 0;
  }
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  FileSystemManager::dictionaryFromPath((uint64_t *)a1, &theDict);
  CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v7, 0, theDict);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&theDict);
  if (MutableCopy) {
    int v8 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  }
  else {
    int v8 = 0;
  }
  if (v8)
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(MutableCopy, @"MobileDeviceCarrierBundlesByProductVersion");
    CFDictionaryRef v10 = Value;
    CFDictionaryRef v17 = Value;
    if (Value)
    {
      uint64_t v11 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
      CFRetain(Value);
    }
    else
    {
      uint64_t v11 = 0;
    }
    if (v11)
    {
      CFStringRef v16 = CFDictionaryCreateMutableCopy(v7, 0, v10);
      CFDictionaryRemoveValue(v16, @"signature");
      ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(&v15, (CFTypeRef *)&v16);
      BOOL v12 = ComputeHash::digest_dictionary((uint64_t)this, (CFDictionaryRef *)&v15);
      ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v15);
      if (v12)
      {
        ComputeHash::finalize(this, &v14);
        if (&v14 != a3)
        {
          CFDictionaryRef theDict = *a3;
          *a3 = v14;
          CFDictionaryRef v14 = 0;
          ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&theDict);
        }
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v14);
      }
      ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&v16);
    }
    else
    {
      writeLog("Error: Missing MobileDeviceCarrierBundlesByProductVersion from version.xml");
      BOOL v12 = 0;
    }
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v17);
  }
  else
  {
    writeLog("Error: Invalid version.xml file");
    BOOL v12 = 0;
  }
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&MutableCopy);
  return v12;
}

void sub_21FDCE548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v4 = va_arg(va1, const void *);
  va_copy(va2, va1);
  uint64_t v6 = va_arg(va2, const void *);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)va);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)va1);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)va2);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ComputeHashForCarrierBundle::computeVersionXmlDigest(const void **a1, ComputeHash *this, const void **a3)
{
  if ((ComputeHash::init(this) & 1) == 0)
  {
    writeLog("Error:ComputeHash object needs to be reset before initilazing\n");
    return 0;
  }
  if (*a1) {
    uint64_t v6 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    uint64_t v6 = 0;
  }
  if (!v6) {
    return 0;
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(&v10, a1);
  BOOL v7 = ComputeHash::digest_dictionary((uint64_t)this, (CFDictionaryRef *)&v10);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v10);
  if (!v7) {
    return 0;
  }
  ComputeHash::finalize(this, (CFDataRef *)&v9);
  if (&v9 != a3)
  {
    uint64_t v11 = *a3;
    *a3 = v9;
    CFPropertyListRef v9 = 0;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v11);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v9);
  return 1;
}

void sub_21FDCE694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

const void **ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *DigestGenerator::getDigestGenerator@<X0>(void *result@<X0>, void *a2@<X8>)
{
  switch(result)
  {
    case 2:
      uint64_t result = operator new(0xF8uLL);
      result[1] = 0;
      result[2] = 0;
      std::string *result = &unk_26D191BF0;
      uint64_t v3 = (char *)(result + 3);
      result[3] = &unk_26D191A80;
      *((unsigned char *)result + 240) = 48;
      goto LABEL_7;
    case 1:
      uint64_t result = operator new(0x90uLL);
      result[1] = 0;
      result[2] = 0;
      std::string *result = &unk_26D191BA0;
      uint64_t v3 = (char *)(result + 3);
      result[3] = &unk_26D191A50;
      *((unsigned char *)result + 136) = 32;
      goto LABEL_7;
    case 0:
      uint64_t result = operator new(0x88uLL);
      result[1] = 0;
      result[2] = 0;
      std::string *result = &unk_26D191B50;
      uint64_t v3 = (char *)(result + 3);
      result[3] = &unk_26D191A20;
      *((unsigned char *)result + 128) = 20;
LABEL_7:
      *a2 = v3;
      a2[1] = result;
      return result;
  }
  *a2 = 0;
  a2[1] = 0;
  return result;
}

void DigestGenerator160::DigestGenerator160(DigestGenerator160 *this)
{
  *(void *)this = &unk_26D191A20;
  *((unsigned char *)this + 104) = 20;
}

{
  *(void *)this = &unk_26D191A20;
  *((unsigned char *)this + 104) = 20;
}

uint64_t DigestGenerator160::get_digest_size(DigestGenerator160 *this)
{
  return *((unsigned __int8 *)this + 104);
}

uint64_t DigestGenerator160::sha_init(DigestGenerator160 *this)
{
  return CC_SHA1_Init((CC_SHA1_CTX *)((char *)this + 8));
}

uint64_t DigestGenerator160::sha_update(DigestGenerator160 *this, const void *a2, CC_LONG a3)
{
  return CC_SHA1_Update((CC_SHA1_CTX *)((char *)this + 8), a2, a3);
}

uint64_t DigestGenerator160::sha_final(DigestGenerator160 *this, unsigned __int8 *md)
{
  return CC_SHA1_Final(md, (CC_SHA1_CTX *)((char *)this + 8));
}

void DigestGenerator256::DigestGenerator256(DigestGenerator256 *this)
{
  *(void *)this = &unk_26D191A50;
  *((unsigned char *)this + 112) = 32;
}

{
  *(void *)this = &unk_26D191A50;
  *((unsigned char *)this + 112) = 32;
}

uint64_t DigestGenerator256::get_digest_size(DigestGenerator256 *this)
{
  return *((unsigned __int8 *)this + 112);
}

uint64_t DigestGenerator256::sha_init(DigestGenerator256 *this)
{
  return CC_SHA256_Init((CC_SHA256_CTX *)((char *)this + 8));
}

uint64_t DigestGenerator256::sha_update(DigestGenerator256 *this, const void *a2, CC_LONG a3)
{
  return CC_SHA256_Update((CC_SHA256_CTX *)((char *)this + 8), a2, a3);
}

uint64_t DigestGenerator256::sha_final(DigestGenerator256 *this, unsigned __int8 *md)
{
  return CC_SHA256_Final(md, (CC_SHA256_CTX *)((char *)this + 8));
}

void DigestGenerator384::DigestGenerator384(DigestGenerator384 *this)
{
  *(void *)this = &unk_26D191A80;
  *((unsigned char *)this + 216) = 48;
}

{
  *(void *)this = &unk_26D191A80;
  *((unsigned char *)this + 216) = 48;
}

uint64_t DigestGenerator384::sha_init(DigestGenerator384 *this)
{
  return CC_SHA384_Init((CC_SHA512_CTX *)((char *)this + 8));
}

uint64_t DigestGenerator384::sha_update(DigestGenerator384 *this, const void *a2, CC_LONG a3)
{
  return CC_SHA384_Update((CC_SHA512_CTX *)((char *)this + 8), a2, a3);
}

uint64_t DigestGenerator384::sha_final(DigestGenerator384 *this, unsigned __int8 *md)
{
  return CC_SHA384_Final(md, (CC_SHA512_CTX *)((char *)this + 8));
}

uint64_t DigestGenerator384::get_digest_size(DigestGenerator384 *this)
{
  return *((unsigned __int8 *)this + 216);
}

void DigestGenerator512::DigestGenerator512(DigestGenerator512 *this)
{
  *(void *)this = &unk_26D191AB0;
  *((unsigned char *)this + 216) = 64;
}

{
  *(void *)this = &unk_26D191AB0;
  *((unsigned char *)this + 216) = 64;
}

uint64_t DigestGenerator512::sha_init(DigestGenerator512 *this)
{
  return CC_SHA512_Init((CC_SHA512_CTX *)((char *)this + 8));
}

uint64_t DigestGenerator512::sha_update(DigestGenerator512 *this, const void *a2, CC_LONG a3)
{
  return CC_SHA512_Update((CC_SHA512_CTX *)((char *)this + 8), a2, a3);
}

uint64_t DigestGenerator512::sha_final(DigestGenerator512 *this, unsigned __int8 *md)
{
  return CC_SHA512_Final(md, (CC_SHA512_CTX *)((char *)this + 8));
}

uint64_t DigestGenerator512::get_digest_size(DigestGenerator512 *this)
{
  return *((unsigned __int8 *)this + 216);
}

void std::__shared_ptr_emplace<DigestGenerator160>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D191B50;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<DigestGenerator160>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D191B50;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x223C5EA50);
}

void std::__shared_ptr_emplace<DigestGenerator256>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D191BA0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<DigestGenerator256>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D191BA0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x223C5EA50);
}

void std::__shared_ptr_emplace<DigestGenerator384>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D191BF0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<DigestGenerator384>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D191BF0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x223C5EA50);
}

void *getDigestGeneratorFor@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  switch(result)
  {
    case 2:
      uint64_t result = _ZNSt3__115allocate_sharedB8ne180100I18DigestGenerator384NS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v3);
      goto LABEL_7;
    case 1:
      uint64_t result = _ZNSt3__115allocate_sharedB8ne180100I18DigestGenerator256NS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v3);
      goto LABEL_7;
    case 0:
      uint64_t result = _ZNSt3__115allocate_sharedB8ne180100I18DigestGenerator160NS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v3);
LABEL_7:
      *(_OWORD *)a2 = v3;
      return result;
  }
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  return result;
}

uint64_t getDigestForCBSignatureType(int a1)
{
  if (a1 == 2) {
    return 2;
  }
  else {
    return a1 == 1;
  }
}

void *getPrefixForDigestType@<X0>(void *result@<X0>, void *a2@<X8>)
{
  switch(result)
  {
    case 2:
      uint64_t v2 = "3";
      return std::string::basic_string[abi:ne180100]<0>(a2, v2);
    case 1:
      uint64_t v2 = "2";
      return std::string::basic_string[abi:ne180100]<0>(a2, v2);
    case 0:
      uint64_t v2 = "1";
      return std::string::basic_string[abi:ne180100]<0>(a2, v2);
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return result;
}

char *asString(unsigned int a1)
{
  if (a1 > 2) {
    return (char *)&unk_21FDD455F;
  }
  else {
    return off_264538288[a1];
  }
}

const char *asString(int a1)
{
  uint64_t v1 = "Unknown Format";
  if (a1 == 1) {
    uint64_t v1 = "Format2";
  }
  if (a1) {
    return v1;
  }
  else {
    return "Format1";
  }
}

{
  const char *v1;

  uint64_t v1 = "Unknown";
  if (a1 == 1) {
    uint64_t v1 = "production";
  }
  if (a1) {
    return v1;
  }
  else {
    return "development";
  }
}

{
  if (a1) {
    return "Unknown Format";
  }
  else {
    return "Format1";
  }
}

BOOL doSecVerify_iOS(const void **a1, const void **a2, BOOL a3, int a4)
{
  BOOL v4 = a3;
  if (a3)
  {
    if (a4 == 2)
    {
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v14, a1);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v13, a2);
      BOOL v4 = SecKeyVerifySignature_OSX_iOS((__SecKey *)v4, (const __CFData **)&v14, (const __CFData **)&v13);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v13);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v14);
    }
    else
    {
      if (a4 == 1) {
        SecPadding v7 = 32772;
      }
      else {
        SecPadding v7 = 32770;
      }
      BytePtr = CFDataGetBytePtr((CFDataRef)*a1);
      size_t Length = CFDataGetLength((CFDataRef)*a1);
      CFDictionaryRef v10 = CFDataGetBytePtr((CFDataRef)*a2);
      size_t v11 = CFDataGetLength((CFDataRef)*a2);
      return SecKeyRawVerify((SecKeyRef)v4, v7, BytePtr, Length, v10, v11) == 0;
    }
  }
  else
  {
    writeLog("signKeyRef is NULL");
  }
  return v4;
}

void sub_21FDCEDD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

BOOL SecKeyVerifySignature_OSX_iOS(__SecKey *a1, const __CFData **a2, const __CFData **a3)
{
  CFStringRef v6 = (const __CFString *)*MEMORY[0x263F172B0];
  if (!SecKeyIsAlgorithmSupported(a1, kSecKeyOperationTypeVerify, (SecKeyAlgorithm)*MEMORY[0x263F172B0])) {
    writeLog("kSecKeyAlgorithmECDSASignatureDigestX962SHA384 algorithm is not supported\n");
  }
  CFDataRef v7 = *a2;
  CFDataRef v8 = *a3;
  error[0] = 0;
  error[1] = (CFErrorRef)&v12;
  BOOL v12 = 0;
  BOOL v9 = SecKeyVerifySignature(a1, v6, v7, v8, error) != 0;
  ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)error);
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(&v12);
  return v9;
}

void sub_21FDCEE90(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  long long v3 = va_arg(va1, const void *);
  uint64_t v5 = va_arg(va1, void);
  ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)va);
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)va1);
  _Unwind_Resume(a1);
}

uint64_t createSecKeyRef(const unsigned __int8 *a1)
{
  uint64_t RSAPublicKey = SecKeyCreateRSAPublicKey();
  if (!RSAPublicKey) {
    writeLog("Unable to create the RSA Public SecKey Ref\n");
  }
  return RSAPublicKey;
}

uint64_t createECDSASecKeyRef(const unsigned __int8 *a1)
{
  uint64_t v1 = SecKeyCreateFromPublicBytes();
  if (!v1) {
    writeLog("Unable to create the ECDSA SecKey Ref\n");
  }
  return v1;
}

uint64_t getSecKeyRef(const unsigned __int8 *a1, uint64_t a2, int a3)
{
  if (a3 == 2) {
    return createECDSASecKeyRef(a1);
  }
  else {
    return createSecKeyRef(a1);
  }
}

BOOL VerifyDigest(const void **a1, const void **a2, BOOL a3, int a4)
{
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v10, a1);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v9, a2);
  BOOL v7 = doSecVerify_iOS(&v10, &v9, a3, a4);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v9);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v10);
  return v7;
}

void sub_21FDCEFD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

uint64_t VerifyCarrierBundleSignature(uint64_t a1, int a2, uint64_t a3)
{
  std::allocate_shared[abi:ne180100]<CarrierBundle,std::allocator<CarrierBundle>,std::string const&,void>(a1, &v14);
  if ((CarrierBundle::readBundle(v14) & 1) == 0)
  {
    writeLog("Unable to read the CarrierBundle");
    uint64_t v7 = 0;
    goto LABEL_19;
  }
  _ZNSt3__115allocate_sharedB8ne180100I10PublicKeysNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v12);
  if (v12)
  {
    public_key = (const unsigned __int8 *)PublicKeys::get_public_key(v12, a2, a3);
    PublicKeys::get_public_key_size(v12, a2, a3);
    if (a2 == 2) {
      uint64_t ECDSASecKeyRef = createECDSASecKeyRef(public_key);
    }
    else {
      uint64_t ECDSASecKeyRef = createSecKeyRef(public_key);
    }
    CFDataRef v8 = (const void *)ECDSASecKeyRef;
    if (ECDSASecKeyRef)
    {
      int v9 = CarrierBundle::verifySignatures((uint64_t)v14, a2, a3, ECDSASecKeyRef, 0);
      CFRelease(v8);
      if (v9)
      {
        CFDictionaryRef v10 = "Unknown";
        if (a3 == 1) {
          CFDictionaryRef v10 = "production";
        }
        if (!a3) {
          CFDictionaryRef v10 = "development";
        }
        writeLog("Signature verification has passed with the %s keys\n", v10);
        uint64_t v7 = 1;
        goto LABEL_17;
      }
    }
    else
    {
      writeLog("Unable to create the SecKeyRef\n");
    }
  }
  else
  {
    writeLog("Unable to create the public keys\n");
  }
  uint64_t v7 = 0;
LABEL_17:
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
LABEL_19:
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  return v7;
}

void sub_21FDCF154(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, uint64_t a12, std::__shared_weak_count *a13)
{
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a11);
  }
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a13);
  }
  _Unwind_Resume(exception_object);
}

uint64_t VerifyCarrierBundleSignatureForType(uint64_t a1, int a2)
{
  std::allocate_shared[abi:ne180100]<CarrierBundle,std::allocator<CarrierBundle>,std::string const&,void>(a1, &v14);
  if ((CarrierBundle::readBundle(v14) & 1) == 0)
  {
    writeLog("Unable to read the CarrierBundle");
    uint64_t v5 = 0;
    goto LABEL_23;
  }
  _ZNSt3__115allocate_sharedB8ne180100I10PublicKeysNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v12);
  if (v12)
  {
    public_key = (const unsigned __int8 *)PublicKeys::get_public_key(v12, a2, 1);
    PublicKeys::get_public_key_size(v12, a2, 1u);
    if (a2 == 2) {
      uint64_t ECDSASecKeyRef = createECDSASecKeyRef(public_key);
    }
    else {
      uint64_t ECDSASecKeyRef = createSecKeyRef(public_key);
    }
    CFStringRef v6 = (const void *)ECDSASecKeyRef;
    if (ECDSASecKeyRef)
    {
      char v7 = CarrierBundle::verifySignatures((uint64_t)v14, a2, 1, ECDSASecKeyRef, 0);
      CFRelease(v6);
      if (v7)
      {
        writeLog("Signature verification has passed the production signing\n");
LABEL_18:
        uint64_t v5 = 1;
        goto LABEL_21;
      }
      writeLog("Fallback to the dev signing verification\n");
      CFDataRef v8 = (const unsigned __int8 *)PublicKeys::get_public_key(v12, a2, 0);
      PublicKeys::get_public_key_size(v12, a2, 0);
      if (a2 == 2) {
        uint64_t SecKeyRef = createECDSASecKeyRef(v8);
      }
      else {
        uint64_t SecKeyRef = createSecKeyRef(v8);
      }
      CFDictionaryRef v10 = (const void *)SecKeyRef;
      if (SecKeyRef)
      {
        uint64_t v5 = CarrierBundle::verifySignatures((uint64_t)v14, a2, 0, SecKeyRef, 0);
        CFRelease(v10);
        if (!v5) {
          goto LABEL_21;
        }
        writeLog("Signature verification has passed the dev signing\n");
        goto LABEL_18;
      }
    }
    writeLog("Unable to create the SecKeyRef\n");
  }
  else
  {
    writeLog("Unable to create the public keys\n");
  }
  uint64_t v5 = 0;
LABEL_21:
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
LABEL_23:
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  return v5;
}

void sub_21FDCF35C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, uint64_t a12, std::__shared_weak_count *a13)
{
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a11);
  }
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a13);
  }
  _Unwind_Resume(exception_object);
}

uint64_t VerifyCarrierBundleVersionsXMLSignature(const __CFDictionary *a1, uint64_t a2, int a3)
{
  if (!a1) {
    return 0;
  }
  if (a3 != 2)
  {
    writeLog("Error : Unsupported signature type for version xml verification.\n", v3, v4);
    return 0;
  }
  if (a2 != 1)
  {
    if (!a2)
    {
      return VerifyCarrierBundleVersionsXMLFormat1(a1, a2, 1);
    }
    return 0;
  }
  return VerifyCarrierBundleVersionsXMLFormat2(a1, a2, 1);
}

uint64_t VerifyCarrierBundleVersionsXMLFormat1(const __CFDictionary *a1, uint64_t a2, int a3)
{
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"MobileDeviceCarrierBundlesByProductVersion");
  if (!Value || (v6 = Value, CFTypeID v7 = CFGetTypeID(Value), v7 != CFDictionaryGetTypeID()))
  {
    writeLog("MobileDeviceCarrierBundlesByProductVersion is not found in version.xml");
    return 0;
  }
  CFDictionaryRef v8 = (const __CFDictionary *)CFDictionaryGetValue(a1, @"CarrierBundleSignatures");
  if (!v8 || (CFDictionaryRef v9 = v8, v10 = CFGetTypeID(v8), v10 != CFDictionaryGetTypeID()))
  {
    writeLog("CarrierBundleSignatures is not found in version.xml");
    return 0;
  }
  CFDictionaryRef v11 = (const __CFDictionary *)CFDictionaryGetValue(v9, @"Format1");
  if (!v11 || (CFDictionaryRef v12 = v11, v13 = CFGetTypeID(v11), v13 != CFDictionaryGetTypeID()))
  {
    writeLog("Format1 is not found in the CarrierBundleSignatures of version.xml");
    return 0;
  }
  CFDictionaryRef MutableCopy = (__CFDictionary *)CFDictionaryGetValue(v12, @"signature3");
  ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&cf, (CFTypeRef *)&MutableCopy);
  if (cf) {
    CFDictionaryRef v14 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  }
  else {
    CFDictionaryRef v14 = 0;
  }
  if (v14)
  {
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v6);
    CFDictionaryRemoveValue(MutableCopy, @"signature");
    ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(&v19, (CFTypeRef *)&MutableCopy);
    CFTypeRef v18 = cf;
    if (cf) {
      CFRetain(cf);
    }
    uint64_t v15 = VerifyXMLDigestForType(&v19, &v18, (void *)2, a3);
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v18);
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v19);
    CFStringRef v16 = "Unknown";
    if (a3 == 1) {
      CFStringRef v16 = "production";
    }
    if (!a3) {
      CFStringRef v16 = "development";
    }
    if (v15) {
      writeLog("version XML CarrierBundle signatures verification of %s passed using the %s key\n", "Format1", v16);
    }
    else {
      writeLog("Error : Version XML CarrierBundle signatures verification failed on Format1 using %skeys\n", v16);
    }
    ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&MutableCopy);
  }
  else
  {
    writeLog("Error: signature3 key is not present in the Format1 signatures dictionary of the version xml");
    uint64_t v15 = 0;
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&cf);
  return v15;
}

void sub_21FDCF608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t VerifyCarrierBundleVersionsXMLFormat2(const __CFDictionary *a1, uint64_t a2, int a3)
{
  CFDictionaryRef v5 = (const __CFDictionary *)CFDictionaryGetValue(a1, @"CarrierBundleSignatures");
  if (v5 && (v6 = v5, CFTypeID v7 = CFGetTypeID(v5), v7 == CFDictionaryGetTypeID()))
  {
    CFDictionaryRef v8 = (const __CFDictionary *)CFDictionaryGetValue(v6, @"Format2");
    if (v8)
    {
      CFDictionaryRef v9 = v8;
      CFTypeID v10 = CFGetTypeID(v8);
      if (v10 == CFDictionaryGetTypeID())
      {
        CFDictionaryRef MutableCopy = (const __CFDictionary *)CFDictionaryGetValue(v9, @"signature3");
        ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&v30, (CFTypeRef *)&MutableCopy);
        if (v30) {
          CFDictionaryRef v11 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
        }
        else {
          CFDictionaryRef v11 = 0;
        }
        if (v11)
        {
          CFDictionaryRef v12 = (const __CFDictionary *)CFDictionaryGetValue(a1, @"CarrierBundles");
          CFDictionaryRef v13 = v12;
          if (v12)
          {
            CFTypeID v14 = CFGetTypeID(v12);
            if (v14 == CFDictionaryGetTypeID())
            {
              CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
              CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v13);
              CFDictionaryRef v16 = (const __CFDictionary *)CFDictionaryGetValue(MutableCopy, @"Watch");
              CFDictionaryRef theDict = v16;
              if (v16)
              {
                CFRetain(v16);
                CFDictionaryRef v17 = theDict;
              }
              else
              {
                CFDictionaryRef v17 = 0;
              }
              CFMutableDictionaryRef v27 = CFDictionaryCreateMutableCopy(v15, 0, v17);
              CFDictionaryRef v20 = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"Bundles");
              CFDictionaryRef v21 = v20;
              CFDictionaryRef v26 = v20;
              if (v20) {
                CFRetain(v20);
              }
              value = CFDictionaryCreateMutableCopy(v15, 0, v21);
              CFDictionaryRemoveValue((CFMutableDictionaryRef)value, @"signature");
              CFDictionarySetValue(v27, @"Bundles", value);
              CFDictionarySetValue(MutableCopy, @"Watch", v27);
              ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(&v24, (CFTypeRef *)&MutableCopy);
              std::string v23 = v30;
              if (v30) {
                CFRetain(v30);
              }
              uint64_t v18 = VerifyXMLDigestForType(&v24, &v23, (void *)2, a3);
              ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v23);
              ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v24);
              uint64_t v22 = "Unknown";
              if (a3 == 1) {
                uint64_t v22 = "production";
              }
              if (!a3) {
                uint64_t v22 = "development";
              }
              if (v18) {
                writeLog("version XML CarrierBundle signatures verification of %s passed using the %s key\n", "Format2", v22);
              }
              else {
                writeLog("Error : Version XML CarrierBundle signatures verification failed on Format2 using %s keys\n", v22);
              }
              ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&value);
              ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v26);
              ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&v27);
              ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&theDict);
              ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&MutableCopy);
              goto LABEL_20;
            }
          }
          writeLog("CarrierBundles key is not found in version.xml");
        }
        else
        {
          writeLog("Error: signature3 key is not present in the Format2 signatures dictionary of the version xml");
        }
        uint64_t v18 = 0;
LABEL_20:
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v30);
        return v18;
      }
    }
    writeLog("Format2 is not found in the CarrierBundleSignatures of version.xml");
  }
  else
  {
    writeLog("CarrierBundleSignatures is not found in version.xml");
  }
  return 0;
}

void sub_21FDCF924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va5, a3);
  va_start(va4, a3);
  va_start(va3, a3);
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  CFDictionaryRef v5 = va_arg(va1, const void *);
  va_copy(va2, va1);
  CFTypeID v7 = va_arg(va2, const void *);
  va_copy(va3, va2);
  CFDictionaryRef v9 = va_arg(va3, const void *);
  va_copy(va4, va3);
  CFDictionaryRef v11 = va_arg(va4, const void *);
  va_copy(va5, va4);
  CFDictionaryRef v13 = va_arg(va5, const void *);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)va1);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)va2);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)va3);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)va4);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)va5);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)(v3 - 48));
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v3 - 40));
  _Unwind_Resume(a1);
}

uint64_t VerifyCarrierBundleVersionsXMLSignatureWithKeyType(const __CFDictionary *a1, uint64_t a2, int a3, int a4)
{
  if (!a1) {
    return 0;
  }
  if (a3 != 2)
  {
    writeLog("Error : Unsupported signature type for version xml verification.\n", v4, v5);
    return 0;
  }
  if (a2 != 1)
  {
    if (!a2)
    {
      return VerifyCarrierBundleVersionsXMLFormat1(a1, a2, a4);
    }
    return 0;
  }
  return VerifyCarrierBundleVersionsXMLFormat2(a1, a2, a4);
}

uint64_t VerifyXMLDigestForType(const void **a1, const void **a2, void *a3, int a4)
{
  int v5 = (int)a3;
  getDigestGeneratorFor(a3, (uint64_t)&v27);
  uint64_t v8 = v27;
  if (!v27)
  {
    writeLog("Error: Failed to get digest generator for digest type: %d\n", v5);
    uint64_t v13 = 0;
    CFDictionaryRef v9 = v28;
    if (!v28) {
      return v13;
    }
    goto LABEL_31;
  }
  ComputeHash::ComputeHash((ComputeHash *)v26);
  CFDictionaryRef v9 = v28;
  uint64_t v24 = v8;
  uint64_t v25 = v28;
  if (v28) {
    atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ComputeHash::setDigestGenerator((uint64_t)v26, &v24);
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  if ((ComputeHash::init((ComputeHash *)v26) & 1) == 0)
  {
    writeLog("Error:ComputeHash object needs to be reset before initilazing\n");
LABEL_16:
    uint64_t v13 = 0;
    goto LABEL_30;
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(&v23, a1);
  BOOL v10 = ComputeHash::digest_dictionary((uint64_t)v26, (CFDictionaryRef *)&v23);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v23);
  if (!v10)
  {
    writeLog("Error Failed to generate digest for the dictionary");
    goto LABEL_16;
  }
  ComputeHash::finalize((ComputeHash *)v26, (CFDataRef *)&cf);
  _ZNSt3__115allocate_sharedB8ne180100I10PublicKeysNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v20);
  if (!v20)
  {
    writeLog("Error : Unable to get the public keys\n");
    goto LABEL_26;
  }
  if (a4)
  {
    if (a4 != 1)
    {
      writeLog("Error : Unknown signature key type\n");
      goto LABEL_26;
    }
    sha2_384_production_publickey = (const unsigned __int8 *)PublicKeys::get_sha2_384_production_publickey(v20);
    PublicKeys::get_sha2_384_production_keysize(v20);
    uint64_t ECDSASecKeyRef = createECDSASecKeyRef(sha2_384_production_publickey);
  }
  else
  {
    sha2_384_development_publickey = (const unsigned __int8 *)PublicKeys::get_sha2_384_development_publickey(v20);
    PublicKeys::get_sha2_384_development_keysize(v20);
    uint64_t ECDSASecKeyRef = createECDSASecKeyRef(sha2_384_development_publickey);
  }
  CFAllocatorRef v15 = (const void *)ECDSASecKeyRef;
  if (!ECDSASecKeyRef)
  {
LABEL_26:
    uint64_t v13 = 0;
    goto LABEL_27;
  }
  CFTypeRef v19 = cf;
  if (cf) {
    CFRetain(cf);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v18, a2);
  BOOL v16 = VerifyDigest(&v19, &v18, (BOOL)v15, v5);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v18);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v19);
  CFRelease(v15);
  if (!v16)
  {
    writeLog("Verification of the digest failed\n");
    goto LABEL_26;
  }
  uint64_t v13 = 1;
LABEL_27:
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&cf);
LABEL_30:
  ComputeHash::~ComputeHash((ComputeHash *)v26);
  if (v9) {
LABEL_31:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  return v13;
}

void sub_21FDCFC34(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va3, a2);
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  int v5 = va_arg(va1, const void *);
  va_copy(va2, va1);
  CFTypeID v7 = va_arg(va2, const void *);
  uint64_t v9 = va_arg(va2, void);
  BOOL v10 = va_arg(va2, std::__shared_weak_count *);
  va_copy(va3, va2);
  CFDictionaryRef v11 = va_arg(va3, const void *);
  uint64_t v13 = va_arg(va3, void);
  uint64_t v14 = va_arg(va3, void);
  uint64_t v15 = va_arg(va3, void);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va1);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va2);
  ComputeHash::~ComputeHash((ComputeHash *)va3);
  uint64_t v4 = *(std::__shared_weak_count **)(v2 - 64);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  _Unwind_Resume(a1);
}

uint64_t VerifyCountryBundleVersionsXMLSignatureWithKeyType(const __CFDictionary *a1, uint64_t a2, int a3, int a4)
{
  if (!a1) {
    return 0;
  }
  if (a3 != 2)
  {
    writeLog("Error : Unsupported signature type for version xml verification.\n", v4, v5);
    return 0;
  }
  if (a2) {
    return 0;
  }
  return VerifyCountryBundleVersionsXMLFormat1(a1, a2, a4);
}

uint64_t VerifyCountryBundleVersionsXMLFormat1(const __CFDictionary *a1, uint64_t a2, int a3)
{
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"CountryBundleSignatures");
  if (Value && (v6 = Value, CFTypeID v7 = CFGetTypeID(Value), v7 == CFDictionaryGetTypeID()))
  {
    CFDictionaryRef v8 = (const __CFDictionary *)CFDictionaryGetValue(v6, @"Format1");
    if (v8)
    {
      CFDictionaryRef v9 = v8;
      CFTypeID v10 = CFGetTypeID(v8);
      if (v10 == CFDictionaryGetTypeID())
      {
        cf[0] = CFDictionaryGetValue(v9, @"signature3");
        ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&v22, cf);
        if ((void)v22) {
          CFDictionaryRef v11 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
        }
        else {
          CFDictionaryRef v11 = 0;
        }
        if (!v11)
        {
          writeLog("Error: signature3 key is not present in the Format1 signatures dictionary of the version xml");
          uint64_t v15 = 0;
LABEL_33:
          ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v22);
          return v15;
        }
        CFTypeRef v19 = CFDictionaryGetValue(a1, @"CountryBundles");
        ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(cf, &v19);
        if (cf[0]) {
          CFDictionaryRef v12 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
        }
        else {
          CFDictionaryRef v12 = 0;
        }
        if (v12)
        {
          CFTypeRef v18 = cf[0];
          if (cf[0]) {
            CFRetain(cf[0]);
          }
          CFDictionaryRef v17 = (const void *)v22;
          if ((void)v22) {
            CFRetain((CFTypeRef)v22);
          }
          char v13 = VerifyXMLDigestForType(&v18, &v17, (void *)2, a3);
          ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v17);
          ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v18);
          uint64_t v14 = "Unknown";
          if (a3 == 1) {
            uint64_t v14 = "production";
          }
          if (!a3) {
            uint64_t v14 = "development";
          }
          if (v13)
          {
            writeLog("version XML CountryBundle signatures verification of %s passed using the %s key\n", "Format1", v14);
            uint64_t v15 = 1;
LABEL_32:
            ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(cf);
            goto LABEL_33;
          }
          writeLog("Error : Version XML CountryBundle signatures verification failed on %s using %s keys\n", "Format1", v14);
        }
        else
        {
          writeLog("CountryBundles key is not found in version.xml");
        }
        uint64_t v15 = 0;
        goto LABEL_32;
      }
    }
    writeLog("Format1 is not found in the CountryBundleSignatures of version.xml");
  }
  else
  {
    long long v22 = 0uLL;
    uint64_t v23 = 0;
    ctu::cf::assign();
    *(_OWORD *)CFTypeRef cf = 0uLL;
    uint64_t v21 = 0;
    writeLog("%s is not found in version.xml", (const char *)cf);
    if (SHIBYTE(v21) < 0) {
      operator delete((void *)cf[0]);
    }
  }
  return 0;
}

void sub_21FDCFF78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v23 - 56));
  _Unwind_Resume(a1);
}

uint64_t VerifyCarrierBundleSignature_OSX(uint64_t a1, uint64_t a2, int **a3)
{
  std::allocate_shared[abi:ne180100]<CarrierBundle,std::allocator<CarrierBundle>,std::string const&,void>(a1, &v19);
  if ((CarrierBundle::readBundle(v19) & 1) == 0)
  {
    writeLog("Unable to read the CarrierBundle");
    uint64_t v14 = 0;
    goto LABEL_25;
  }
  _ZNSt3__115allocate_sharedB8ne180100I10PublicKeysNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v17);
  if (v17)
  {
    uint64_t v5 = *a3;
    CFDictionaryRef v6 = a3[1];
    if (*a3 == v6)
    {
LABEL_14:
      uint64_t v14 = 1;
      goto LABEL_23;
    }
    while (1)
    {
      unsigned int v7 = *v5;
      public_key = (const unsigned __int8 *)PublicKeys::get_public_key(v17, *v5, a2);
      PublicKeys::get_public_key_size(v17, v7, a2);
      if (v7 == 2) {
        uint64_t ECDSASecKeyRef = createECDSASecKeyRef(public_key);
      }
      else {
        uint64_t ECDSASecKeyRef = createSecKeyRef(public_key);
      }
      CFTypeID v10 = (const void *)ECDSASecKeyRef;
      if (!ECDSASecKeyRef)
      {
        writeLog("Unable to create the SecKeyRef\n");
        goto LABEL_22;
      }
      CFDictionaryRef v11 = (const char *)&unk_21FDD455F;
      if (v7 <= 2) {
        CFDictionaryRef v11 = off_264538288[v7];
      }
      writeLog("Verifying %s \n", v11);
      int v12 = CarrierBundle::verifySignatures((uint64_t)v19, v7, a2, (BOOL)v10, 1);
      CFRelease(v10);
      if (!v12) {
        break;
      }
      char v13 = (const char *)&unk_21FDD455F;
      if (v7 <= 2) {
        char v13 = off_264538288[v7];
      }
      writeLog("%s Verification succeeded\n", v13);
      if (++v5 == v6) {
        goto LABEL_14;
      }
    }
    if (v7 > 2) {
      uint64_t v15 = (const char *)&unk_21FDD455F;
    }
    else {
      uint64_t v15 = off_264538288[v7];
    }
    writeLog("%s Verifications failed\n", v15);
  }
  else
  {
    writeLog("Unable to create the public keys\n");
  }
LABEL_22:
  uint64_t v14 = 0;
LABEL_23:
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
LABEL_25:
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  return v14;
}

void sub_21FDD01D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, uint64_t a12, std::__shared_weak_count *a13)
{
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a11);
  }
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a13);
  }
  _Unwind_Resume(exception_object);
}

void findMatchingFile_Internal(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v4 = a4;
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  v71[0] = 0;
  v71[1] = 0;
  v70 = v71;
  uint64_t v5 = *(void *)(a1 + 8);
  if (v5 == a1) {
    goto LABEL_88;
  }
  uint64_t v7 = a1;
  do
  {
    CFDictionaryRef v8 = (const char *)(v5 + 16);
    v67 = 0;
    size_t v68 = 0;
    uint64_t v69 = 0;
    FileSystemManager::getFileExtension((uint64_t *)(v5 + 16));
    uint64_t v9 = HIBYTE(v69);
    char v10 = HIBYTE(v69);
    if (v69 >= 0) {
      size_t v11 = HIBYTE(v69);
    }
    else {
      size_t v11 = v68;
    }
    uint64_t v12 = a2[23];
    int v13 = (char)v12;
    if ((v12 & 0x80u) != 0) {
      uint64_t v12 = *((void *)a2 + 1);
    }
    if (v11 != v12) {
      goto LABEL_73;
    }
    if (v13 >= 0) {
      uint64_t v14 = a2;
    }
    else {
      uint64_t v14 = *(unsigned __int8 **)a2;
    }
    if (SHIBYTE(v69) < 0)
    {
      if (memcmp(v67, v14, v68)) {
        goto LABEL_74;
      }
    }
    else if (HIBYTE(v69))
    {
      uint64_t v15 = &v67;
      do
      {
        if (*(unsigned __int8 *)v15 != *v14) {
          goto LABEL_73;
        }
        uint64_t v15 = (void **)((char *)v15 + 1);
        ++v14;
        --v9;
      }
      while (v9);
    }
    v64 = 0;
    uint64_t v65 = 0;
    uint64_t v66 = 0;
    v61 = 0;
    uint64_t v62 = 0;
    uint64_t v63 = 0;
    ComputeHashForCarrierBundle::getDeviceModelName(v5 + 16, &v58);
    v56 = &v61;
    v57 = &v64;
    std::tuple<std::string &,std::string &>::operator=[abi:ne180100]<std::string,std::string,0>(&v56, (long long *)&v58);
    if (v60 < 0) {
      operator delete(__p);
    }
    if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v58.__r_.__value_.__l.__data_);
    }
    char v16 = HIBYTE(v63);
    if (SHIBYTE(v63) < 0)
    {
      if (v62 == 6)
      {
        uint64_t v17 = (unsigned __int16 *)v61;
LABEL_28:
        int v18 = *(_DWORD *)v17;
        int v19 = v17[2];
        BOOL v20 = v18 == 1835888483 && v19 == 28271;
        if (v20) {
          goto LABEL_68;
        }
      }
    }
    else if (SHIBYTE(v63) == 6)
    {
      uint64_t v17 = (unsigned __int16 *)&v61;
      goto LABEL_28;
    }
    uint64_t v21 = HIBYTE(v66);
    uint64_t v22 = v65;
    ctu::tokenize();
    if ((v21 & 0x80u) == 0) {
      uint64_t v23 = v21;
    }
    else {
      uint64_t v23 = v22;
    }
    BOOL v24 = v23 != 0;
    CFDictionaryRef v26 = v56;
    uint64_t v25 = v57;
    if (v57 == v56) {
      goto LABEL_67;
    }
    int v54 = 1431655766 * ((unint64_t)((char *)v57 - (char *)v56) >> 3) - v24;
    uint64_t v27 = a3[23];
    char v28 = *(const void **)a3;
    size_t v29 = *((void *)a3 + 1);
    if ((v27 & 0x80u) == 0) {
      long long v30 = (void *)a3[23];
    }
    else {
      long long v30 = (void *)*((void *)a3 + 1);
    }
    while (1)
    {
      char v31 = *((unsigned char *)v26 + 23);
      if (v31 < 0)
      {
        if (!v26[1]) {
          goto LABEL_57;
        }
      }
      else if (!*((unsigned char *)v26 + 23))
      {
        goto LABEL_57;
      }
      if (v31 >= 0) {
        uint64_t v32 = (void *)*((unsigned __int8 *)v26 + 23);
      }
      else {
        uint64_t v32 = v26[1];
      }
      if (v30 != v32) {
        goto LABEL_57;
      }
      long long v33 = v31 >= 0 ? v26 : (void **)*v26;
      if ((v27 & 0x80) != 0) {
        break;
      }
      if (!v27) {
        goto LABEL_59;
      }
      id v34 = a3;
      uint64_t v35 = v27;
      while (*v34 == *(unsigned __int8 *)v33)
      {
        ++v34;
        long long v33 = (void **)((char *)v33 + 1);
        if (!--v35) {
          goto LABEL_59;
        }
      }
LABEL_57:
      v26 += 3;
      if (v26 == v25) {
        goto LABEL_67;
      }
    }
    uint64_t v36 = v7;
    uint64_t v37 = v28;
    int v38 = memcmp(v28, v33, v29);
    char v28 = v37;
    uint64_t v7 = v36;
    if (v38) {
      goto LABEL_57;
    }
LABEL_59:
    LODWORD(v58.__r_.__value_.__l.__data_) = v54;
    if (*(char *)(v5 + 39) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&v58.__r_.__value_.__r.__words[1], *(const std::string::value_type **)(v5 + 16), *(void *)(v5 + 24));
    }
    else
    {
      long long v39 = *(_OWORD *)v8;
      std::string __p = *(void **)(v5 + 32);
      *(_OWORD *)&v58.__r_.__value_.__r.__words[1] = v39;
    }
    std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::__emplace_unique_key_args<int,std::pair<int,std::string>>((uint64_t **)&v70, (int *)&v58, (uint64_t)&v58);
    if (SHIBYTE(__p) < 0) {
      operator delete((void *)v58.__r_.__value_.__l.__size_);
    }
    if (*(char *)(v5 + 39) < 0) {
      CFDictionaryRef v8 = *(const char **)v8;
    }
    writeLog("Found match, file %s contains this device's specific signature plist\n", v8);
LABEL_67:
    v58.__r_.__value_.__r.__words[0] = (std::string::size_type)&v56;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v58);
    char v16 = HIBYTE(v63);
LABEL_68:
    if (v16 < 0) {
      operator delete(v61);
    }
    if (SHIBYTE(v66) < 0) {
      operator delete(v64);
    }
    char v10 = HIBYTE(v69);
LABEL_73:
    if (v10 < 0) {
LABEL_74:
    }
      operator delete(v67);
    uint64_t v5 = *(void *)(v5 + 8);
  }
  while (v5 != v7);
  CFStringRef v40 = (uint64_t *)v70;
  uint64_t v4 = a4;
  if (v70 == v71)
  {
LABEL_88:
    unint64_t v41 = v4[1];
    goto LABEL_89;
  }
  unint64_t v41 = a4[1];
  do
  {
    char v42 = (long long *)(v40 + 5);
    if (v41 >= a4[2])
    {
      unint64_t v41 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a4, v42);
    }
    else
    {
      std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)a4, v42);
      v41 += 24;
    }
    a4[1] = v41;
    uint64_t v43 = (char *)v40[1];
    if (v43)
    {
      do
      {
        unsigned __int8 v44 = (char **)v43;
        uint64_t v43 = *(char **)v43;
      }
      while (v43);
    }
    else
    {
      do
      {
        unsigned __int8 v44 = (char **)v40[2];
        BOOL v20 = *v44 == (char *)v40;
        CFStringRef v40 = (uint64_t *)v44;
      }
      while (!v20);
    }
    CFStringRef v40 = (uint64_t *)v44;
  }
  while (v44 != v71);
LABEL_89:
  unint64_t v45 = *v4;
  unint64_t v46 = v41 - 24;
  if (*v4 != v41 && v46 > v45)
  {
    unint64_t v48 = v45 + 24;
    do
    {
      std::string v58 = *(std::string *)(v48 - 24);
      long long v49 = *(_OWORD *)&v58.__r_.__value_.__l.__data_;
      std::string::size_type v50 = v58.__r_.__value_.__r.__words[2];
      uint64_t v51 = *(void *)(v46 + 16);
      *(_OWORD *)(v48 - 24) = *(_OWORD *)v46;
      *(void *)(v48 - 8) = v51;
      *(void *)(v46 + 16) = v50;
      *(_OWORD *)unint64_t v46 = v49;
      v46 -= 24;
      BOOL v52 = v48 >= v46;
      v48 += 24;
    }
    while (!v52);
  }
  std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::destroy((uint64_t)&v70, v71[0]);
}

void sub_21FDD067C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char *a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, char *a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  a19 = &a16;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  if (a34 < 0) {
    operator delete(__p);
  }
  if (a40 < 0) {
    operator delete(a35);
  }
  if (*(char *)(v40 - 113) < 0) {
    operator delete(*(void **)(v40 - 136));
  }
  std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::destroy(v40 - 112, *(char **)(v40 - 104));
  a19 = a12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  _Unwind_Resume(a1);
}

void *std::tuple<std::string &,std::string &>::operator=[abi:ne180100]<std::string,std::string,0>(void *a1, long long *a2)
{
  uint64_t v4 = *a1;
  if (*(char *)(*a1 + 23) < 0) {
    operator delete(*(void **)v4);
  }
  long long v5 = *a2;
  *(void *)(v4 + 16) = *((void *)a2 + 2);
  *(_OWORD *)uint64_t v4 = v5;
  *((unsigned char *)a2 + 23) = 0;
  *(unsigned char *)a2 = 0;
  uint64_t v6 = a1[1];
  if (*(char *)(v6 + 23) < 0) {
    operator delete(*(void **)v6);
  }
  long long v7 = *(long long *)((char *)a2 + 24);
  *(void *)(v6 + 16) = *((void *)a2 + 5);
  *(_OWORD *)uint64_t v6 = v7;
  *((unsigned char *)a2 + 47) = 0;
  *((unsigned char *)a2 + 24) = 0;
  return a1;
}

void findMatchingFile(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v5 = *(unsigned __int8 *)(a1 + 23);
  if ((v5 & 0x80u) != 0) {
    uint64_t v5 = *(void *)(a1 + 8);
  }
  if (!v5) {
    goto LABEL_15;
  }
  uint64_t v7 = *(unsigned __int8 *)(a2 + 23);
  if ((v7 & 0x80u) != 0) {
    uint64_t v7 = *(void *)(a2 + 8);
  }
  if (!v7) {
    goto LABEL_15;
  }
  uint64_t v9 = *(unsigned __int8 *)(a3 + 23);
  if ((v9 & 0x80u) != 0) {
    uint64_t v9 = *(void *)(a3 + 8);
  }
  if (v9)
  {
    long long v16 = 0uLL;
    uint64_t v17 = 0;
    v15[0] = 0;
    v15[1] = 0;
    uint64_t v14 = v15;
    FileSystemManager::FileSystemManager((FileSystemManager *)&v13);
    v12[0] = v12;
    v12[1] = v12;
    void v12[2] = 0;
    if (FileSystemManager::directoryContentsAtPath((char *)a1, v12, 0))
    {
      if (*(char *)(a2 + 23) >= 0) {
        size_t v11 = (const char *)a2;
      }
      else {
        size_t v11 = *(const char **)a2;
      }
      writeLog("Going through the contents in the directory searching for pattern '%s', and extension: '%s'\n", "overrides", v11);
      findMatchingFile_Internal((uint64_t)v12, (unsigned __int8 *)a2, (unsigned __int8 *)a3, a4);
    }
    else
    {
      *(_OWORD *)a4 = v16;
      a4[2] = v17;
      uint64_t v17 = 0;
      long long v16 = 0uLL;
    }
    std::__list_imp<std::string>::clear(v12);
    FileSystemManager::~FileSystemManager(&v13);
    std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::destroy((uint64_t)&v14, v15[0]);
    uint64_t v14 = (char **)&v16;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  }
  else
  {
LABEL_15:
    writeLog("None of the arguments to this function can be empty\n");
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
  }
}

void sub_21FDD0904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void **a16, char *a17)
{
  std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::destroy((uint64_t)&a16, a17);
  a16 = (void **)(v17 - 64);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

void dictAfterMergingPlistsAtPath(const void **a1@<X0>, uint64_t *a2@<X1>, const __CFDictionary **a3@<X8>)
{
  *a3 = 0;
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  if (*a2 != v4)
  {
    do
    {
      if (*((char *)a1 + 23) >= 0) {
        size_t v7 = *((unsigned __int8 *)a1 + 23);
      }
      else {
        size_t v7 = (size_t)a1[1];
      }
      std::string::basic_string[abi:ne180100]((uint64_t)&v20, v7 + 1);
      if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        CFDictionaryRef v8 = &v20;
      }
      else {
        CFDictionaryRef v8 = (std::string *)v20.__r_.__value_.__r.__words[0];
      }
      if (v7)
      {
        if (*((char *)a1 + 23) >= 0) {
          uint64_t v9 = a1;
        }
        else {
          uint64_t v9 = *a1;
        }
        memmove(v8, v9, v7);
      }
      *(_WORD *)((char *)&v8->__r_.__value_.__l.__data_ + v7) = 47;
      int v10 = *(char *)(v3 + 23);
      if (v10 >= 0) {
        size_t v11 = (const std::string::value_type *)v3;
      }
      else {
        size_t v11 = *(const std::string::value_type **)v3;
      }
      if (v10 >= 0) {
        std::string::size_type v12 = *(unsigned __int8 *)(v3 + 23);
      }
      else {
        std::string::size_type v12 = *(void *)(v3 + 8);
      }
      id v13 = std::string::append(&v20, v11, v12);
      long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
      int64_t v22 = v13->__r_.__value_.__r.__words[2];
      *(_OWORD *)std::string __p = v14;
      v13->__r_.__value_.__l.__size_ = 0;
      v13->__r_.__value_.__r.__words[2] = 0;
      v13->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v20.__r_.__value_.__l.__data_);
      }
      FileSystemManager::dictionaryFromPath((uint64_t *)__p, &v19);
      if (v19) {
        uint64_t v15 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
      }
      else {
        uint64_t v15 = 0;
      }
      if (v15)
      {
        if (*a3) {
          long long v16 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
        }
        else {
          long long v16 = 0;
        }
        if (v16)
        {
          copyMergedDictionaries(*a3, v19, &v18);
          if (&v18 != a3)
          {
            v20.__r_.__value_.__r.__words[0] = (std::string::size_type)*a3;
            *a3 = v18;
            CFDictionaryRef v18 = 0;
            ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v20.__r_.__value_.__l.__data_);
          }
          ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v18);
        }
        else
        {
          ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::operator=((const void **)a3, (const void **)&v19);
        }
      }
      else
      {
        uint64_t v17 = __p;
        if (v22 < 0) {
          uint64_t v17 = (void **)__p[0];
        }
        writeLog("Signature dict for file at path %s is nil\n", (const char *)v17);
      }
      ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v19);
      if (SHIBYTE(v22) < 0) {
        operator delete(__p[0]);
      }
      v3 += 24;
    }
    while (v3 != v4);
  }
}

void sub_21FDD0B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, const void *a11, uint64_t a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&a11);
  if (a23 < 0) {
    operator delete(__p);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(v23);
  _Unwind_Resume(a1);
}

const void **copyMergedDictionaries@<X0>(const __CFDictionary *a1@<X0>, const __CFDictionary *a2@<X1>, void *a3@<X8>)
{
  CFMutableDictionaryRef theDict = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, a1);
  CFIndex Count = CFDictionaryGetCount(a2);
  std::vector<void const*>::vector(keys, Count);
  std::vector<void const*>::vector(values, Count);
  CFDictionaryGetKeysAndValues(a2, (const void **)keys[0], (const void **)values[0]);
  if (Count >= 1)
  {
    for (uint64_t i = 0; i != Count; ++i)
    {
      CFDictionaryRef v8 = CFDictionaryGetValue(a1, keys[0][i]);
      uint64_t v9 = CFDictionaryGetValue(a2, keys[0][i]);
      int v10 = v9;
      if (v8 && (CFTypeID v11 = CFGetTypeID(v9), v11 == CFDictionaryGetTypeID()))
      {
        CFTypeID v12 = CFGetTypeID(v8);
        if (v12 != CFDictionaryGetTypeID()) {
          CFDictionaryRef v8 = 0;
        }
        if (v10)
        {
          CFTypeID v13 = CFGetTypeID(v10);
          if (v13 == CFDictionaryGetTypeID()) {
            CFDictionaryRef v14 = (const __CFDictionary *)v10;
          }
          else {
            CFDictionaryRef v14 = 0;
          }
        }
        else
        {
          CFDictionaryRef v14 = 0;
        }
        copyMergedDictionaries((uint64_t *)&value, (const __CFDictionary *)v8, v14);
        CFDictionarySetValue(theDict, keys[0][i], value);
        ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&value);
      }
      else
      {
        CFDictionarySetValue(theDict, keys[0][i], v10);
      }
    }
  }
  ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(a3, (CFTypeRef *)&theDict);
  if (values[0])
  {
    values[1] = values[0];
    operator delete(values[0]);
  }
  if (keys[0])
  {
    keys[1] = keys[0];
    operator delete(keys[0]);
  }
  return ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&theDict);
}

void sub_21FDD0D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, const void *a16)
{
  if (__p) {
    operator delete(__p);
  }
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(&a16);
  _Unwind_Resume(a1);
}

void copyPRISignatureForDeviceNameOnSHA(const void **a1@<X0>, uint64_t a2@<X1>, const void **a3@<X2>, int a4@<W3>, void *a5@<X8>)
{
  *(void *)&long long v40 = *MEMORY[0x263EF8340];
  writeLog("-------------------------------------copyPRISignatureForDeviceName begins-------------------------------------------\n");
  *a5 = 0;
  if (*((char *)a1 + 23) >= 0) {
    size_t v10 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v10 = (size_t)a1[1];
  }
  CFTypeID v11 = &v35;
  std::string::basic_string[abi:ne180100]((uint64_t)&v35, v10 + 1);
  if ((v35.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    CFTypeID v11 = (std::string *)v35.__r_.__value_.__r.__words[0];
  }
  if (v10)
  {
    if (*((char *)a1 + 23) >= 0) {
      CFTypeID v12 = a1;
    }
    else {
      CFTypeID v12 = *a1;
    }
    memmove(v11, v12, v10);
  }
  *(_WORD *)((char *)&v11->__r_.__value_.__l.__data_ + v10) = 47;
  CFTypeID v13 = std::string::append(&v35, "signatures");
  long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  std::string::size_type v37 = v13->__r_.__value_.__r.__words[2];
  *(_OWORD *)uint64_t v36 = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v35.__r_.__value_.__l.__data_);
  }
  uint64_t v15 = (std::string *)std::string::basic_string[abi:ne180100]<0>(&v39, "common");
  long long v16 = std::string::append(v15, ".");
  long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v35.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v35.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  CFDictionaryRef v18 = std::string::append(&v35, "plist");
  int v19 = (std::string::value_type *)v18->__r_.__value_.__r.__words[0];
  std::string::size_type size = v18->__r_.__value_.__l.__size_;
  v34[0] = v18->__r_.__value_.__r.__words[2];
  *(_DWORD *)((char *)v34 + 3) = *(_DWORD *)((char *)&v18->__r_.__value_.__r.__words[2] + 3);
  int v21 = SHIBYTE(v18->__r_.__value_.__r.__words[2]);
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v35.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v39.__r_.__value_.__l.__data_);
    if ((v21 & 0x80000000) == 0) {
      goto LABEL_17;
    }
  }
  else if ((v21 & 0x80000000) == 0)
  {
LABEL_17:
    v39.__r_.__value_.__r.__words[0] = (std::string::size_type)v19;
    v39.__r_.__value_.__l.__size_ = size;
    LODWORD(v39.__r_.__value_.__r.__words[2]) = v34[0];
    *(_DWORD *)((char *)&v39.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v34 + 3);
    *((unsigned char *)&v39.__r_.__value_.__s + 23) = v21;
    goto LABEL_20;
  }
  std::string::__init_copy_ctor_external(&v39, v19, size);
LABEL_20:
  memset(&v35, 0, sizeof(v35));
  std::string __p = &v35;
  LOBYTE(v32) = 0;
  v35.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x18uLL);
  v35.__r_.__value_.__l.__size_ = v35.__r_.__value_.__r.__words[0];
  v35.__r_.__value_.__r.__words[2] = v35.__r_.__value_.__r.__words[0] + 24;
  v35.__r_.__value_.__l.__size_ = (std::string::size_type)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v35.__r_.__value_.__r.__words[2], (long long *)&v39, &v40, (std::string *)v35.__r_.__value_.__l.__data_);
  if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v39.__r_.__value_.__l.__data_);
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "plist");
  findMatchingFile((uint64_t)v36, (uint64_t)&__p, a2, (uint64_t *)&v39);
  if (SHIBYTE(v33) < 0) {
    operator delete(__p);
  }
  std::vector<std::string>::__insert_with_size[abi:ne180100]<std::__wrap_iter<std::string*>,std::__wrap_iter<std::string*>>((std::vector<std::string> *)&v35, (std::string *)v35.__r_.__value_.__l.__size_, (std::string *)v39.__r_.__value_.__l.__data_, (long long *)v39.__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v39.__r_.__value_.__l.__size_ - v39.__r_.__value_.__r.__words[0]) >> 3));
  dictAfterMergingPlistsAtPath((const void **)v36, (uint64_t *)&v35, &theDict);
  std::string __p = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  if (a4 == 1)
  {
    int64_t v22 = "2";
  }
  else
  {
    if (a4 != 2) {
      goto LABEL_39;
    }
    int64_t v22 = "3";
  }
  MEMORY[0x223C5E9C0](&__p, v22);
  if (theDict) {
    uint64_t v23 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    uint64_t v23 = 0;
  }
  if (v23)
  {
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a3, (const void **)&__p, (uint64_t)cStr);
    if (v29 < 0)
    {
      if (!cStr[1])
      {
LABEL_38:
        operator delete(cStr[0]);
        goto LABEL_39;
      }
      BOOL v24 = cStr[0];
    }
    else
    {
      if (!v29) {
        goto LABEL_39;
      }
      BOOL v24 = (const char *)cStr;
    }
    CFStringRef v27 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v24, 0x8000100u);
    CFTypeRef Value = CFDictionaryGetValue(theDict, v27);
    uint64_t v25 = (const void **)ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&v38, &Value);
    *a5 = v38;
    uint64_t v38 = 0;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v25);
    ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v27);
    if ((v29 & 0x80000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_39:
  writeLog("-------------------------------------copyPRISignatureForDeviceName ends----------------------------------------------\n");
  if (SHIBYTE(v33) < 0) {
    operator delete(__p);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&theDict);
  std::string __p = &v39;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  v39.__r_.__value_.__r.__words[0] = (std::string::size_type)&v35;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v39);
  if (v21 < 0) {
    operator delete(v19);
  }
  if (SHIBYTE(v37) < 0) {
    operator delete(v36[0]);
  }
}

void sub_21FDD1178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, const void *a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&a17);
  a18 = (void *)(v40 - 112);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a18);
  *(void *)(v40 - 112) = &a25;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v40 - 112));
  if (v39 < 0) {
    operator delete(v38);
  }
  if (a37 < 0) {
    operator delete(a32);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v37);
  _Unwind_Resume(a1);
}

void getDigestForIpcc(char *a1@<X0>, void *a2@<X1>, CFDataRef *a3@<X8>)
{
  int v3 = (int)a2;
  getDigestGeneratorFor(a2, (uint64_t)&v13);
  uint64_t v6 = v13;
  if (v13)
  {
    ComputeHash::ComputeHash((ComputeHash *)v12);
    size_t v7 = v14;
    uint64_t v10 = v6;
    CFTypeID v11 = v14;
    if (v14) {
      atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ComputeHash::setDigestGenerator((uint64_t)v12, &v10);
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
    if (ComputeHash::init((ComputeHash *)v12))
    {
      if (a1[23] >= 0) {
        CFDictionaryRef v8 = (FileSystemManager *)a1;
      }
      else {
        CFDictionaryRef v8 = *(FileSystemManager **)a1;
      }
      if (ComputeHash::digest_file((ComputeHash *)v12, v8))
      {
        ComputeHash::finalize((ComputeHash *)v12, a3);
        goto LABEL_20;
      }
      if (a1[23] >= 0) {
        uint64_t v9 = a1;
      }
      else {
        uint64_t v9 = *(const char **)a1;
      }
      writeLog("Error: Failed to compute digest for %s\n", v9);
    }
    else
    {
      writeLog("Error:ComputeHash object needs to be reset before initilazing\n");
    }
    *a3 = 0;
LABEL_20:
    ComputeHash::~ComputeHash((ComputeHash *)v12);
    if (!v7) {
      return;
    }
    goto LABEL_21;
  }
  writeLog("Error: Failed to get digest generator for digest type: %d\n", v3);
  *a3 = 0;
  size_t v7 = v14;
  if (v14) {
LABEL_21:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
}

void sub_21FDD13E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  uint64_t v15 = *(std::__shared_weak_count **)(v13 - 40);
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  _Unwind_Resume(exception_object);
}

const void **ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::operator=(const void **a1, const void **a2)
{
  if (a1 != a2)
  {
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(&v5, a2);
    int v3 = *a1;
    *a1 = v5;
    uint64_t v5 = v3;
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v5);
  }
  return a1;
}

void *std::vector<void const*>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<void const*>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_21FDD1504(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<void const*>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<void const*>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void std::vector<void const*>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void *_ZNSt3__115allocate_sharedB8ne180100I18DigestGenerator160NS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_@<X0>(void *a1@<X8>)
{
  uint64_t v2 = operator new(0x88uLL);
  uint64_t result = _ZNSt3__120__shared_ptr_emplaceI18DigestGenerator160NS_9allocatorIS1_EEEC2B8ne180100IJES3_Li0EEES3_DpOT_(v2);
  *a1 = v2 + 3;
  a1[1] = v2;
  return result;
}

void sub_21FDD1620(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *_ZNSt3__120__shared_ptr_emplaceI18DigestGenerator160NS_9allocatorIS1_EEEC2B8ne180100IJES3_Li0EEES3_DpOT_(void *a1)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26D191B50;
  DigestGenerator160::DigestGenerator160((DigestGenerator160 *)(a1 + 3));
  return a1;
}

void sub_21FDD167C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void *_ZNSt3__115allocate_sharedB8ne180100I18DigestGenerator256NS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_@<X0>(void *a1@<X8>)
{
  uint64_t v2 = operator new(0x90uLL);
  uint64_t result = _ZNSt3__120__shared_ptr_emplaceI18DigestGenerator256NS_9allocatorIS1_EEEC2B8ne180100IJES3_Li0EEES3_DpOT_(v2);
  *a1 = v2 + 3;
  a1[1] = v2;
  return result;
}

void sub_21FDD16C8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *_ZNSt3__120__shared_ptr_emplaceI18DigestGenerator256NS_9allocatorIS1_EEEC2B8ne180100IJES3_Li0EEES3_DpOT_(void *a1)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26D191BA0;
  DigestGenerator256::DigestGenerator256((DigestGenerator256 *)(a1 + 3));
  return a1;
}

void sub_21FDD1724(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void *_ZNSt3__115allocate_sharedB8ne180100I18DigestGenerator384NS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_@<X0>(void *a1@<X8>)
{
  uint64_t v2 = operator new(0xF8uLL);
  uint64_t result = _ZNSt3__120__shared_ptr_emplaceI18DigestGenerator384NS_9allocatorIS1_EEEC2B8ne180100IJES3_Li0EEES3_DpOT_(v2);
  *a1 = v2 + 3;
  a1[1] = v2;
  return result;
}

void sub_21FDD1770(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *_ZNSt3__120__shared_ptr_emplaceI18DigestGenerator384NS_9allocatorIS1_EEEC2B8ne180100IJES3_Li0EEES3_DpOT_(void *a1)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26D191BF0;
  DigestGenerator384::DigestGenerator384((DigestGenerator384 *)(a1 + 3));
  return a1;
}

void sub_21FDD17CC(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

const void **ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy(const void **a1)
{
  uint64_t v2 = (const void **)a1[1];
  if (*a1)
  {
    int v3 = *v2;
    *uint64_t v2 = *a1;
    uint64_t v6 = v3;
  }
  else
  {
    uint64_t v4 = *v2;
    *uint64_t v2 = 0;
    uint64_t v6 = v4;
  }
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(&v6);
  return a1;
}

void *std::allocate_shared[abi:ne180100]<CarrierBundle,std::allocator<CarrierBundle>,std::string const&,void>@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0x80uLL);
  uint64_t result = std::__shared_ptr_emplace<CarrierBundle>::__shared_ptr_emplace[abi:ne180100]<std::string const&,std::allocator<CarrierBundle>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_21FDD1880(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<CarrierBundle>::__shared_ptr_emplace[abi:ne180100]<std::string const&,std::allocator<CarrierBundle>,0>(void *a1, uint64_t a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26D191C40;
  CarrierBundle::CarrierBundle(a1 + 3, a2);
  return a1;
}

void sub_21FDD18DC(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<CarrierBundle>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D191C40;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<CarrierBundle>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D191C40;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x223C5EA50);
}

void std::__shared_ptr_emplace<CarrierBundle>::__on_zero_shared(uint64_t a1)
{
}

void *_ZNSt3__115allocate_sharedB8ne180100I10PublicKeysNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_@<X0>(void *a1@<X8>)
{
  uint64_t v2 = operator new(0x20uLL);
  uint64_t result = _ZNSt3__120__shared_ptr_emplaceI10PublicKeysNS_9allocatorIS1_EEEC2B8ne180100IJES3_Li0EEES3_DpOT_(v2);
  *a1 = v2 + 3;
  a1[1] = v2;
  return result;
}

void sub_21FDD19A8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *_ZNSt3__120__shared_ptr_emplaceI10PublicKeysNS_9allocatorIS1_EEEC2B8ne180100IJES3_Li0EEES3_DpOT_(void *a1)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26D191C90;
  PublicKeys::PublicKeys((PublicKeys *)(a1 + 3));
  return a1;
}

void sub_21FDD1A04(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<PublicKeys>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D191C90;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<PublicKeys>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D191C90;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x223C5EA50);
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    int v3 = **a1;
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

void std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::destroy(a1, *(void *)a2);
    std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::destroy(a1, *((void *)a2 + 1));
    if (a2[63] < 0) {
      operator delete(*((void **)a2 + 5));
    }
    operator delete(a2);
  }
}

uint64_t **std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::__emplace_unique_key_args<int,std::pair<int,std::string>>(uint64_t **a1, int *a2, uint64_t a3)
{
  uint64_t v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    int v7 = *a2;
    while (1)
    {
      while (1)
      {
        CFDictionaryRef v8 = (uint64_t **)v5;
        int v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9) {
          break;
        }
        uint64_t v5 = *v8;
        uint64_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      uint64_t v5 = v8[1];
      if (!v5)
      {
        uint64_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    CFDictionaryRef v8 = a1 + 1;
LABEL_10:
    uint64_t v10 = (char *)operator new(0x40uLL);
    *((_DWORD *)v10 + 8) = *(_DWORD *)a3;
    *(_OWORD *)(v10 + 40) = *(_OWORD *)(a3 + 8);
    *((void *)v10 + 7) = *(void *)(a3 + 24);
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)(a3 + 24) = 0;
    std::__tree<std::__value_type<std::string,std::list<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<std::string>>>>::__insert_node_at(a1, (uint64_t)v8, v6, (uint64_t *)v10);
    return (uint64_t **)v10;
  }
  return v8;
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

void sub_21FDD1CC8(_Unwind_Exception *a1)
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
    std::vector<void const*>::__throw_length_error[abi:ne180100]();
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
    uint64_t v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
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

void sub_21FDD1DE0(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  void v12[2] = &v15;
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

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  unint64_t v4 = this;
  CFTypeID v11 = this;
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
        unint64_t v4 = v12;
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

void sub_21FDD2110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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

std::string *std::vector<std::string>::__insert_with_size[abi:ne180100]<std::__wrap_iter<std::string*>,std::__wrap_iter<std::string*>>(std::vector<std::string> *a1, std::string *a2, std::string *a3, long long *a4, uint64_t a5)
{
  unint64_t v5 = a2;
  if (a5 >= 1)
  {
    value = a1->__end_cap_.__value_;
    p_end_cap = (std::allocator<std::string> *)&a1->__end_cap_;
    char v10 = value;
    long long v12 = (std::string *)*((void *)p_end_cap - 1);
    if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)v12) >> 3)) >= a5)
    {
      uint64_t v20 = (char *)v12 - (char *)a2;
      if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * (((char *)v12 - (char *)a2) >> 3)) >= a5)
      {
        int v21 = (long long *)&a3[a5];
      }
      else
      {
        int v21 = (long long *)(&a3->__r_.__value_.__l.__data_ + (((char *)v12 - (char *)a2) >> 3));
        a1->__end_ = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)p_end_cap, v21, a4, *((std::string **)p_end_cap - 1));
        if (v20 < 1) {
          return v5;
        }
      }
      std::vector<std::string>::__move_range(a1, v5, v12, &v5[a5]);
      std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<std::string *>,std::__wrap_iter<std::string *>,std::string *,0>(a3, (std::string *)v21, v5);
    }
    else
    {
      std::vector<std::string>::pointer begin = a1->__begin_;
      unint64_t v14 = a5 - 0x5555555555555555 * (((char *)v12 - (char *)a1->__begin_) >> 3);
      if (v14 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<void const*>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)begin) >> 3);
      unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * (((char *)v10 - (char *)begin) >> 3);
      uint64_t v17 = 2 * v16;
      if (2 * v16 <= v14) {
        uint64_t v17 = v14;
      }
      if (v16 >= 0x555555555555555) {
        unint64_t v18 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v18 = v17;
      }
      __v.__end_cap_.__value_ = p_end_cap;
      if (v18) {
        int v19 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)p_end_cap, v18);
      }
      else {
        int v19 = 0;
      }
      __v.__first_ = v19;
      __v.__begin_ = v19 + v15;
      __v.__end_ = __v.__begin_;
      __v.__end_cap_.__value_ = &v19[v18];
      std::__split_buffer<std::string>::__construct_at_end_with_size<std::__wrap_iter<std::string*>>((uint64_t)&__v, (long long *)a3, a5);
      unint64_t v5 = std::vector<std::string>::__swap_out_circular_buffer(a1, &__v, v5);
      std::__split_buffer<std::string>::~__split_buffer(&__v);
    }
  }
  return v5;
}

void sub_21FDD2348(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__split_buffer<std::string> *a10)
{
  *(void *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

void std::vector<std::string>::__move_range(std::vector<std::string> *this, std::vector<std::string>::pointer __from_s, std::vector<std::string>::pointer __from_e, std::vector<std::string>::pointer __to)
{
  std::vector<std::string>::pointer end = this->__end_;
  long long v7 = (char *)__from_s + (char *)end - (char *)__to;
  std::vector<std::string>::pointer v8 = end;
  if (v7 < (char *)__from_e)
  {
    unint64_t v9 = (unint64_t)v7;
    std::vector<std::string>::pointer v8 = this->__end_;
    do
    {
      long long v10 = *(_OWORD *)v9;
      v8->__r_.__value_.__r.__words[2] = *(void *)(v9 + 16);
      *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v10;
      ++v8;
      *(void *)(v9 + 8) = 0;
      *(void *)(v9 + 16) = 0;
      *(void *)unint64_t v9 = 0;
      v9 += 24;
    }
    while (v9 < (unint64_t)__from_e);
  }
  this->__end_ = v8;
  std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::string *,std::string *,std::string *>((uint64_t)&v11, (uint64_t)__from_s, (uint64_t)v7, (uint64_t)end);
}

void std::__split_buffer<std::string>::__construct_at_end_with_size<std::__wrap_iter<std::string*>>(uint64_t a1, long long *a2, uint64_t a3)
{
  unint64_t v4 = *(std::string **)(a1 + 16);
  if (a3)
  {
    uint64_t v6 = &v4[a3];
    uint64_t v7 = 24 * a3;
    do
    {
      if (*((char *)a2 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)a2, *((void *)a2 + 1));
      }
      else
      {
        long long v8 = *a2;
        v4->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v8;
      }
      ++v4;
      a2 = (long long *)((char *)a2 + 24);
      v7 -= 24;
    }
    while (v7);
    unint64_t v4 = v6;
  }
  *(void *)(a1 + 16) = v4;
}

void sub_21FDD2464(_Unwind_Exception *a1)
{
  *(void *)(v1 + 16) = v2;
  _Unwind_Resume(a1);
}

std::vector<std::string>::pointer std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v, std::vector<std::string>::pointer __p)
{
  std::vector<std::string>::pointer begin = __v->__begin_;
  p_end_cap = &this->__end_cap_;
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)__p, (uint64_t)__p, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)begin, (uint64_t)begin);
  __v->__begin_ = v8;
  __v->__end_ = (std::__split_buffer<std::string>::pointer)std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)p_end_cap, (long long *)__p, (long long *)this->__end_, (uint64_t)__v->__end_);
  unint64_t v9 = this->__begin_;
  this->__begin_ = __v->__begin_;
  __v->__begin_ = v9;
  std::vector<std::string>::pointer end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
  return begin;
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  unint64_t v4 = this;
  char v11 = this;
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
        unint64_t v4 = v12;
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

void sub_21FDD25CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::string *,std::string *,std::string *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 != a2)
  {
    uint64_t v6 = a3;
    do
    {
      uint64_t v7 = a4 - 24;
      if (*(char *)(a4 - 1) < 0) {
        operator delete(*(void **)v7);
      }
      long long v8 = *(_OWORD *)(v6 - 24);
      *(void *)(v7 + 16) = *(void *)(v6 - 8);
      *(_OWORD *)uint64_t v7 = v8;
      *(unsigned char *)(v6 - 1) = 0;
      *(unsigned char *)(v6 - 24) = 0;
      a4 = v7;
      v6 -= 24;
    }
    while (v6 != a2);
  }
  return a3;
}

std::string *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<std::string *>,std::__wrap_iter<std::string *>,std::string *,0>(std::string *__str, std::string *a2, std::string *this)
{
  unint64_t v4 = __str;
  if (__str != a2)
  {
    do
      std::string::operator=(this++, v4++);
    while (v4 != a2);
    return a2;
  }
  return (std::string *)v4;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v9 = a4;
  v7[0] = a1;
  v7[1] = &v9;
  v7[2] = &v10;
  if (a2 != a3)
  {
    do
    {
      long long v5 = *a2;
      *(void *)(v4 + 16) = *((void *)a2 + 2);
      *(_OWORD *)uint64_t v4 = v5;
      v4 += 24;
      *((void *)a2 + 1) = 0;
      *((void *)a2 + 2) = 0;
      *(void *)a2 = 0;
      a2 = (long long *)((char *)a2 + 24);
    }
    while (a2 != a3);
    uint64_t v10 = v4;
  }
  char v8 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v7);
  return v4;
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

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
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

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
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

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x270EE48D8]();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
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

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFIndex CFNumberGetByteSize(CFNumberRef number)
{
  return MEMORY[0x270EE4C48](number);
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

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x270EE4C78](number);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D48](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x270EE4D90](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x270EE4DB8](stream);
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

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

uint64_t SecKeyCreateFromPublicBytes()
{
  return MEMORY[0x270EFDA20]();
}

uint64_t SecKeyCreateRSAPublicKey()
{
  return MEMORY[0x270EFDA38]();
}

Boolean SecKeyIsAlgorithmSupported(SecKeyRef key, SecKeyOperationType operation, SecKeyAlgorithm algorithm)
{
  return MEMORY[0x270EFDAA8](key, operation, algorithm);
}

OSStatus SecKeyRawVerify(SecKeyRef key, SecPadding padding, const uint8_t *signedData, size_t signedDataLen, const uint8_t *sig, size_t sigLen)
{
  return MEMORY[0x270EFDAB8](key, *(void *)&padding, signedData, signedDataLen, sig, sigLen);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x270EFDAC8](key, algorithm, signedData, signature, error);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x270F97550]();
}

uint64_t ctu::ns::AutoPool::AutoPool(ctu::ns::AutoPool *this)
{
  return MEMORY[0x270F97610](this);
}

void ctu::ns::AutoPool::~AutoPool(ctu::ns::AutoPool *this)
{
}

uint64_t ctu::tokenize()
{
  return MEMORY[0x270F97708]();
}

std::string::const_reference std::string::at(const std::string *this, std::string::size_type __n)
{
  return (std::string::const_reference)MEMORY[0x270F98228](this, __n);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x270F98248](this, __s);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string::reference std::string::at(std::string *this, std::string::size_type __n)
{
  return (std::string::reference)MEMORY[0x270F98478](this, __n);
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

void std::string::push_back(std::string *this, std::string::value_type __c)
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

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
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

char *__cdecl basename(char *a1)
{
  return (char *)MEMORY[0x270ED8740](a1);
}

void bzero(void *a1, size_t a2)
{
}

char *__cdecl dirname(char *a1)
{
  return (char *)MEMORY[0x270ED9190](a1);
}

void free(void *a1)
{
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDA120](a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

void objc_enumerationMutation(id obj)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x270EDB138](a1, a2, a3);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}