_DWORD *CrashIfClientProvidedBogusAudioBufferList(unsigned int *a1, char a2)
{
  _DWORD *result;
  uint64_t v3;
  unsigned int v4;
  int v5;
  int v6;
  _DWORD *v7;
  unsigned char *v8;
  int v9;

  v4 = *a1;
  result = a1 + 2;
  v3 = v4;
  if (v4)
  {
    v5 = 0;
    v6 = 0;
    v7 = &result[4 * v3];
    while (1)
    {
      v8 = (unsigned char *)*((void *)result + 1);
      if (v8)
      {
        v9 = result[1];
        if (v9) {
          v6 |= (char)(v8[v9 - 1] | *v8);
        }
      }
      else
      {
        if ((a2 & 1) == 0)
        {
          __break(1u);
          return result;
        }
        v5 = 1;
      }
      result += 4;
      if (result >= v7) {
        return (_DWORD *)(v5 | v6 & 0xFFFFFFFE);
      }
    }
  }
  v6 = 0;
  v5 = 0;
  return (_DWORD *)(v5 | v6 & 0xFFFFFFFE);
}

uint64_t BaseOpaqueObject::checkRTTI(uint64_t a1)
{
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 24))(a1)) {
    return a1;
  }
  else {
    return 0;
  }
}

void CASerializer::~CASerializer(const void **this)
{
  v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void CASerializer::CASerializer(CASerializer *this, CFTypeRef cf)
{
  *(void *)this = 0;
  if (cf)
  {
    *(void *)this = cf;
    CFRetain(cf);
  }
}

{
  *(void *)this = 0;
  if (cf)
  {
    *(void *)this = cf;
    CFRetain(cf);
  }
}

void CADeserializer::CADeserializer(CADeserializer *this, char *a2, uint64_t a3)
{
  *((unsigned char *)this + 32) = 0;
  *(void *)this = 0;
  *((void *)this + 1) = a2;
  *((void *)this + 2) = a2;
  *((void *)this + 3) = &a2[a3];
}

{
  *((unsigned char *)this + 32) = 0;
  *(void *)this = 0;
  *((void *)this + 1) = a2;
  *((void *)this + 2) = a2;
  *((void *)this + 3) = &a2[a3];
}

uint64_t CACFString::operator=(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v4 = *(CFTypeRef *)a1;
  if (v4 != cf)
  {
    if (v4) {
      BOOL v5 = *(unsigned char *)(a1 + 8) == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5) {
      CFRelease(v4);
    }
    *(void *)a1 = cf;
  }
  *(unsigned char *)(a1 + 8) = 1;
  CFRetain(cf);
  return a1;
}

uint64_t PlatformUtilities::IsInternalBuild(PlatformUtilities *this)
{
  if (queryBuildType(void)::once != -1) {
    dispatch_once(&queryBuildType(void)::once, &__block_literal_global_99);
  }
  return gIsInternal;
}

uint64_t ___ZN12CADeprecated15XBasicMIGServer22SetServerDispatchQueueERKN10applesauce8dispatch2v15queueE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 72)) {
    mach_absolute_time();
  }
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(v2 + 24);
  uint64_t v4 = *(void *)(v2 + 32);

  return MEMORY[0x1F40CBB78](v3, v4, v5);
}

void CADeserializer::~CADeserializer(const void **this)
{
  v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void CAAudioChannelLayout::CAAudioChannelLayout(CAAudioChannelLayout *this, atomic_uint **a2)
{
  *(void *)this = 0;
  CAAudioChannelLayout::operator=((atomic_uint **)this, a2);
}

{
  *(void *)this = 0;
  CAAudioChannelLayout::operator=((atomic_uint **)this, a2);
}

BOOL MinimalSafetyCheck(const AudioStreamBasicDescription *a1)
{
  BOOL result = 0;
  if (a1->mSampleRate >= 0.0 && a1->mSampleRate < 3000000.0)
  {
    UInt32 mBytesPerPacket = a1->mBytesPerPacket;
    if (mBytesPerPacket >= 0xF4240) {
      return 0;
    }
    UInt32 mFramesPerPacket = a1->mFramesPerPacket;
    if (mFramesPerPacket >= 0xF4240) {
      return 0;
    }
    UInt32 mBytesPerFrame = a1->mBytesPerFrame;
    if (mBytesPerFrame >= 0xF4240) {
      return 0;
    }
    BOOL result = 0;
    if (a1->mChannelsPerFrame - 1 > 0x3FF || a1->mBitsPerChannel > 0x400) {
      return result;
    }
    AudioFormatID mFormatID = a1->mFormatID;
    if (!mFormatID) {
      return 0;
    }
    BOOL v8 = mFramesPerPacket == 1 && mBytesPerPacket == mBytesPerFrame;
    return mFormatID != 1819304813 || v8;
  }
  return result;
}

uint64_t CACFDictionary::GetBool(CACFDictionary *this, const __CFString *a2, BOOL *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFBooleanRef v5 = (const __CFBoolean *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFBooleanGetTypeID())
      {
        BOOL v7 = CFBooleanGetValue(v5) == 0;
      }
      else
      {
        CFTypeID v8 = CFGetTypeID(v5);
        if (v8 != CFNumberGetTypeID()) {
          return 0;
        }
        int valuePtr = 0;
        CFNumberGetValue(v5, kCFNumberSInt32Type, &valuePtr);
        BOOL v7 = valuePtr == 0;
      }
      BOOL v9 = !v7;
      *a3 = v9;
      return 1;
    }
  }
  return result;
}

uint64_t CACFArray::AppendString(CACFArray *this, const __CFString *a2)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    if (*((unsigned char *)this + 9))
    {
      CFArrayAppendValue((CFMutableArrayRef)result, a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void XPC_Object::~XPC_Object(XPC_Object *this)
{
  *(void *)this = &unk_1F0302FD0;
  if (*((void *)this + 1))
  {
    unsigned __int8 v1 = atomic_load((unsigned __int8 *)this + 16);
    if (v1) {
      xpc_release(*((xpc_object_t *)this + 1));
    }
  }
}

{
  uint64_t vars8;

  XPC_Object::~XPC_Object(this);

  JUMPOUT(0x1AD112B70);
}

const __CFDictionary *CACFDictionary::GetCACFString(const __CFDictionary **a1, void *key, uint64_t a3)
{
  if (*(void *)a3)
  {
    if (*(unsigned char *)(a3 + 8)) {
      CFRelease(*(CFTypeRef *)a3);
    }
    *(void *)a3 = 0;
  }
  *(unsigned char *)(a3 + 8) = 1;
  CFDictionaryRef result = *a1;
  if (*a1)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, key);
    if (result)
    {
      CFDictionaryRef v7 = result;
      CFTypeID v8 = CFGetTypeID(result);
      CFDictionaryRef result = (const __CFDictionary *)CFStringGetTypeID();
      if ((const __CFDictionary *)v8 == result)
      {
        return (const __CFDictionary *)CACFString::operator=(a3, v7);
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetArray(CACFDictionary *this, const __CFString *a2, const __CFArray **a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFArrayRef v5 = (const __CFArray *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFArrayGetTypeID())
      {
        *a3 = v5;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

BOOL CACFPreferencesGetAppBooleanValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  uint64_t v4 = (CASmartPreferences *)CFPreferencesCopyAppValue(a1, a2);
  CFTypeID v6 = v4;
  if (a3) {
    CFDictionaryRef v7 = a3;
  }
  else {
    CFDictionaryRef v7 = (BOOL *)&v10;
  }
  BOOL v8 = CASmartPreferences::InterpretBoolean(v4, v7, v5);
  if (v6) {
    CFRelease(v6);
  }
  return v8;
}

BOOL CASmartPreferences::InterpretBoolean(CASmartPreferences *this, unsigned char *a2, BOOL *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int valuePtr = 0;
  *a2 = 0;
  if (this)
  {
    CFBooleanRef v4 = this;
    CFTypeID v5 = CFGetTypeID(this);
    if (v5 == CFBooleanGetTypeID())
    {
      LODWORD(this) = CFBooleanGetValue(v4);
LABEL_6:
      *a2 = 1;
      return this != 0;
    }
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
      LODWORD(this) = valuePtr != 0;
      goto LABEL_6;
    }
    if (v5 != CFStringGetTypeID())
    {
      LODWORD(this) = 0;
      return this != 0;
    }
    CFStringGetCString((CFStringRef)v4, buffer, 64, 0x600u);
    if (sscanf(buffer, "%d", &valuePtr) == 1)
    {
      *a2 = 1;
      LODWORD(this) = valuePtr != 0;
      return this != 0;
    }
    char v7 = buffer[0];
    if (buffer[0])
    {
      BOOL v8 = &buffer[1];
      do
      {
        *(v8 - 1) = __tolower(v7);
        int v9 = *v8++;
        char v7 = v9;
      }
      while (v9);
    }
    if (!(*(unsigned __int16 *)buffer ^ 0x6F6E | buffer[2])
      || (*(_DWORD *)buffer == 1936482662 ? (BOOL v10 = v13 == 101) : (BOOL v10 = 0), v10))
    {
      LODWORD(this) = 0;
      goto LABEL_6;
    }
    if (*(_DWORD *)buffer == 7562617 || !(*(_DWORD *)buffer ^ 0x65757274 | v13))
    {
      LODWORD(this) = 1;
      *a2 = 1;
    }
    else
    {
      LODWORD(this) = valuePtr;
    }
  }
  return this != 0;
}

atomic_uint **CAAudioChannelLayout::operator=(atomic_uint **a1, atomic_uint **a2)
{
  uint64_t v3 = *a1;
  CFBooleanRef v4 = *a2;
  if (v3 != *a2)
  {
    if (v3)
    {
      if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
      }
      CFBooleanRef v4 = *a2;
    }
    *a1 = v4;
    if (v4) {
      atomic_fetch_add(v4 + 2, 1u);
    }
  }
  return a1;
}

atomic_uint **CAAudioChannelLayout::operator=(atomic_uint **a1, CAAudioChannelLayout::RefCountedLayout *this)
{
  CFBooleanRef v4 = *a1;
  if (v4)
  {
    if (v4 + 4 == (atomic_uint *)this) {
      return a1;
    }
    if (atomic_fetch_add(v4 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v4 + 16))(v4);
    }
  }
  if (this) {
    CFTypeID v5 = CAAudioChannelLayout::RefCountedLayout::CreateWithLayout(this, (const AudioChannelLayout *)this);
  }
  else {
    CFTypeID v5 = CAAudioChannelLayout::RefCountedLayout::CreateWithNumberChannelDescriptions(0);
  }
  *a1 = v5;
  return a1;
}

void CAAudioChannelLayout::~CAAudioChannelLayout(atomic_uint **this)
{
  uint64_t v2 = *this;
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
    }
    *this = 0;
  }
}

uint64_t CAReferenceCounted::releaseObject(uint64_t this)
{
  if (this) {
    return (*(uint64_t (**)(void))(*(void *)this + 8))();
  }
  return this;
}

_DWORD *CAAudioChannelLayout::RefCountedLayout::CreateWithLayout(CAAudioChannelLayout::RefCountedLayout *this, const AudioChannelLayout *a2)
{
  int v3 = caulk::numeric::exceptional_mul<unsigned int>(*((_DWORD *)this + 2));
  unsigned int v4 = caulk::numeric::exceptional_add<unsigned int>(v3);
  CFTypeID v5 = CAAudioChannelLayout::RefCountedLayout::operator new((CAAudioChannelLayout::RefCountedLayout *)v4);
  v5[2] = 1;
  v5[3] = v4;
  *(void *)CFTypeID v5 = &unk_1F03034A8;
  bzero(v5 + 4, v4);
  memcpy(v5 + 4, this, v4);
  return v5;
}

void CAAudioChannelLayout::CAAudioChannelLayout(CAAudioChannelLayout *this)
{
  *(void *)this = CAAudioChannelLayout::RefCountedLayout::CreateWithNumberChannelDescriptions(0);
}

{
  *(void *)this = CAAudioChannelLayout::RefCountedLayout::CreateWithNumberChannelDescriptions(0);
}

_DWORD *CAAudioChannelLayout::RefCountedLayout::CreateWithNumberChannelDescriptions(CAAudioChannelLayout::RefCountedLayout *this)
{
  int v1 = caulk::numeric::exceptional_mul<unsigned int>(this);
  unsigned int v2 = caulk::numeric::exceptional_add<unsigned int>(v1);
  int v3 = CAAudioChannelLayout::RefCountedLayout::operator new((CAAudioChannelLayout::RefCountedLayout *)v2);
  v3[2] = 1;
  v3[3] = v2;
  *(void *)int v3 = &unk_1F03034A8;
  bzero(v3 + 4, v2);
  return v3;
}

uint64_t caulk::numeric::exceptional_mul<unsigned int>(unsigned int a1)
{
  uint64_t result = 20 * a1;
  if ((result & 0xFFFFFFFF00000000) != 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::overflow_error::overflow_error[abi:ne180100](exception, "arithmetic multiplication overflow");
  }
  return result;
}

void sub_1ABACA32C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t caulk::numeric::exceptional_add<unsigned int>(int a1)
{
  BOOL v1 = __CFADD__(a1, 12);
  uint64_t result = (a1 + 12);
  if (v1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::overflow_error::overflow_error[abi:ne180100](exception, "arithmetic addition overflow");
  }
  return result;
}

void sub_1ABACA39C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *CAAudioChannelLayout::RefCountedLayout::operator new(CAAudioChannelLayout::RefCountedLayout *this)
{
  uint64_t result = malloc_type_malloc((size_t)this + 16, 0x7C51E058uLL);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    int v3 = std::bad_alloc::bad_alloc(exception);
  }
  return result;
}

BOOL CADeserializer::Read(CADeserializer *this, void *a2, unsigned int a3, int a4)
{
  Ptr = (const void *)CADeserializer::GetAndAdvanceReadPtr(this, a3, a4);
  if (Ptr) {
    memcpy(a2, Ptr, a3);
  }
  else {
    bzero(a2, a3);
  }
  return Ptr != 0;
}

uint64_t Read(CADeserializer *a1, AudioChannelLayout **a2, unint64_t *a3)
{
  *a2 = 0;
  *a3 = 0;
  Ptr = (AudioChannelLayoutTag *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (Ptr) {
    AudioChannelLayoutTag v7 = *Ptr;
  }
  else {
    AudioChannelLayoutTag v7 = 0;
  }
  BOOL v8 = (AudioChannelBitmap *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (v8) {
    AudioChannelBitmap v9 = *v8;
  }
  else {
    AudioChannelBitmap v9 = 0;
  }
  BOOL v10 = (UInt32 *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (v10)
  {
    UInt32 v11 = *v10;
    if (*v10 > 0x400) {
      return 0;
    }
  }
  else
  {
    UInt32 v11 = 0;
  }
  if (*((unsigned char *)a1 + 32)) {
    return 0;
  }
  size_t v13 = 20 * v11 + 12;
  *a3 = v13;
  uint64_t v14 = (AudioChannelLayout *)malloc_type_malloc(v13, 0xE884350DuLL);
  *a2 = v14;
  v14->mChannelLayoutTag = v7;
  v14->mChannelBitmap = v9;
  v14->mNumberChannelDescriptions = v11;
  if (v11)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 20 * v11;
    do
    {
      v17 = (char *)*a2;
      v18 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
      if (v18) {
        int v19 = *v18;
      }
      else {
        int v19 = 0;
      }
      *(_DWORD *)&v17[v15 + 12] = v19;
      v20 = (char *)*a2;
      v21 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
      if (v21) {
        int v22 = *v21;
      }
      else {
        int v22 = 0;
      }
      *(_DWORD *)&v20[v15 + 16] = v22;
      v23 = (char *)*a2;
      v24 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
      if (v24) {
        int v25 = *v24;
      }
      else {
        int v25 = 0;
      }
      *(_DWORD *)&v23[v15 + 20] = v25;
      v26 = (char *)*a2;
      v27 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
      if (v27) {
        int v28 = *v27;
      }
      else {
        int v28 = 0;
      }
      *(_DWORD *)&v26[v15 + 24] = v28;
      v29 = (char *)*a2;
      v30 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
      if (v30) {
        int v31 = *v30;
      }
      else {
        int v31 = 0;
      }
      *(_DWORD *)&v29[v15 + 28] = v31;
      v15 += 20;
    }
    while (v16 != v15);
  }
  if (!*((unsigned char *)a1 + 32)) {
    return 1;
  }
  free(*a2);
  uint64_t result = 0;
  *a2 = 0;
  *a3 = 0;
  return result;
}

uint64_t CADeserializer::GetAndAdvanceReadPtr(CADeserializer *this, unsigned int a2, int a3)
{
  uint64_t result = *((void *)this + 2);
  if (a3)
  {
    int v5 = (a3 - 1) & (result - *((_DWORD *)this + 2));
    if (v5)
    {
      uint64_t v6 = (a3 - v5);
      if (*((void *)this + 3) - result < v6)
      {
LABEL_6:
        uint64_t result = 0;
        *((unsigned char *)this + 32) = 1;
        return result;
      }
      result += v6;
      *((void *)this + 2) = result;
    }
  }
  if (*((void *)this + 3) - result < a2) {
    goto LABEL_6;
  }
  *((void *)this + 2) = result + a2;
  return result;
}

void CABundleLocker::~CABundleLocker(CABundleLocker *this)
{
}

{
  pthread_mutex_unlock(&sCABundleLocker);
}

void CABundleLocker::CABundleLocker(CABundleLocker *this)
{
}

{
  pthread_mutex_lock(&sCABundleLocker);
}

void BaseOpaqueObject::destroyOpaqueRef(BaseOpaqueObject *this)
{
  int v1 = *((_DWORD *)this + 2);
  if (v1)
  {
    caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::remove(OpaqueObjectMgr::sInstance, v1);
    *((_DWORD *)this + 2) = 0;
  }
}

void BaseOpaqueObject::~BaseOpaqueObject(BaseOpaqueObject *this)
{
  *(void *)this = &unk_1F0303130;
  int v2 = *((_DWORD *)this + 2);
  if (v2)
  {
    caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::remove(OpaqueObjectMgr::sInstance, v2);
    *((_DWORD *)this + 2) = 0;
  }
}

void caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::remove(uint64_t a1, int a2)
{
  unsigned int v4 = (std::mutex *)(a1 + 80);
  std::mutex::lock((std::mutex *)(a1 + 80));
  unint64_t v5 = atomic_load((unint64_t *)(a1 + 40));
  if (v5)
  {
    unint64_t SlotForKey = caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl::findSlotForKey((uint64_t *)v5, a2);
    if (SlotForKey)
    {
      BOOL v8 = v7;
      atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(v5 + 8 * HIDWORD(SlotForKey) + 16));
      if (v7)
      {
        int v9 = atomic_load((unsigned int *)(a1 + 48));
        if (v9 >= 1)
        {
          do
          {
            std::this_thread::sleep_for[abi:ne180100]<long long,std::ratio<1l,1000000l>>(50);
            int v10 = atomic_load((unsigned int *)(a1 + 48));
          }
          while (v10 > 0);
        }
        if ((unsigned __int16)atomic_load(v8))
        {
          std::mutex::unlock(v4);
          while ((unsigned __int16)atomic_load(v8))
            std::this_thread::sleep_for[abi:ne180100]<long long,std::ratio<1l,1000000l>>(500);
          std::mutex::lock(v4);
          unint64_t v5 = atomic_load((unint64_t *)(a1 + 40));
        }
        caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::element_t::release(v8);
        int v13 = *(_DWORD *)(a1 + 32) - 1;
        *(_DWORD *)(a1 + 32) = v13;
        if (v5)
        {
          unsigned int v14 = 16 * v13;
          unsigned int v15 = *(_DWORD *)(v5 + 8);
          if (v14 / v15 <= 2 && v15 >= 9) {
            caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::rehash((unint64_t *)a1, v15 >> 1);
          }
        }
      }
    }
  }
  caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::emptyReleasePool(a1);

  std::mutex::unlock(v4);
}

void sub_1ABACA8F4(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

unsigned int *caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::element_t::release(unsigned int *result)
{
  if ((atomic_fetch_add((atomic_uint *volatile)result, 0xFFFF0000) & 0xFFFF0000) == 0x10000)
  {
    if (atomic_load(result))
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
    else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
    {
      __break(0xC471u);
    }
    JUMPOUT(0x1AD112B70);
  }
  return result;
}

uint64_t XOSTransactor::beginTransaction(uint64_t this)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)this)
  {
    int v1 = (void *)this;
    if (!*(void *)(this + 24))
    {
      int v2 = *(const char **)(this + 8);
      unsigned int v3 = *(_DWORD *)(this + 16);
      PlatformUtilities::processName((PlatformUtilities *)v3, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      snprintf(__str, 0x80uLL, "%s %p (%d:%s)", v2, v1, v3, (const char *)p_p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      this = os_transaction_create();
      v1[3] = this;
    }
  }
  return this;
}

void PlatformUtilities::processName(PlatformUtilities *this@<X0>, std::string *a2@<X8>)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  size_t v3 = 648;
  *(void *)unsigned int v4 = 0xE00000001;
  int v5 = 1;
  int v6 = (int)this;
  if (sysctl(v4, 4u, v7, &v3, 0, 0) == -1)
  {
    perror("sysctl");
  }
  else if (v3)
  {
    std::string::__assign_external(a2, v8);
  }
}

void sub_1ABACAB10(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = this->__r_.__value_.__r.__words[2];
    unint64_t v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __n)
    {
      std::string::size_type size = this->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    unint64_t v6 = HIBYTE(v10);
    uint64_t v7 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    uint64_t v7 = this;
    if (__n > 0x16)
    {
      std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      unint64_t v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(this, v9, __n - v9, size, 0, size, __n, __s);
      return this;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0) {
    this->__r_.__value_.__l.__size_ = __n;
  }
  else {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
  }
  v7->__r_.__value_.__s.__data_[__n] = 0;
  return this;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  size_t v4 = strlen(__s);

  return std::string::__assign_external(this, __s, v4);
}

void *CALog::Scope::SetPriorityThresholdFromPreference(CALog::Scope *this, const __CFString *a2, const __CFString *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v11[0] = &unk_1F0303680;
  v11[1] = this;
  v11[3] = v11;
  CASmartPreferences::instance(this);
  v12 = CALog::PrefValueToPriority;
  std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)v13, (uint64_t)v11);
  uint64_t v16 = 0;
  int v5 = operator new(0x30uLL);
  unint64_t v6 = v5;
  uint64_t v7 = v12;
  BOOL v8 = v14;
  *int v5 = &unk_1F0303638;
  v5[1] = v7;
  if (v8)
  {
    if (v8 == v13)
    {
      v5[5] = v5 + 2;
      (*(void (**)(void *))(v13[0] + 24))(v13);
      goto LABEL_7;
    }
    unint64_t v9 = &v14;
    v5[5] = v8;
  }
  else
  {
    unint64_t v9 = v5 + 5;
  }
  *unint64_t v9 = 0;
LABEL_7:
  uint64_t v16 = v6;
  CASmartPreferences::_RegisterFirstHandler((uint64_t)&CASmartPreferences::instance(void)::global, a3, a2, (uint64_t)v15);
  std::__function::__value_func<BOOL ()(void const*)>::~__value_func[abi:ne180100](v15);
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](v13);
  return std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](v11);
}

void sub_1ABACADA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void *std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](void *a1)
{
  int v2 = (void *)a1[3];
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

void *CASmartPreferences::instance(CASmartPreferences *this)
{
  {
    CASmartPreferences::CASmartPreferences((CASmartPreferences *)&CASmartPreferences::instance(void)::global);
  }
  return &CASmartPreferences::instance(void)::global;
}

void sub_1ABACAECC(_Unwind_Exception *a1)
{
}

void CASmartPreferences::_RegisterFirstHandler(uint64_t a1, const void *a2, const __CFString *a3, uint64_t a4)
{
  std::mutex::lock((std::mutex *)a1);
  if ((CASmartPreferences::HavePref((CASmartPreferences *)a1, a2, a3) & 1) == 0)
  {
    CFRetain(a2);
    CFRetain(a3);
    unint64_t v8 = *(void *)(a1 + 88);
    unint64_t v9 = *(void *)(a1 + 80);
    if (v9 < v8)
    {
      std::construct_at[abi:ne180100]<CASmartPreferences::Pref,__CFString const*&,__CFString const*&,std::function<BOOL ()(void const*)> &,CASmartPreferences::Pref*>(*(void **)(a1 + 80), (uint64_t)a2, (uint64_t)a3, a4);
      uint64_t v10 = v9 + 48;
      *(void *)(a1 + 80) = v9 + 48;
LABEL_26:
      *(void *)(a1 + 80) = v10;
      CFSetAddValue(*(CFMutableSetRef *)(a1 + 64), a3);
      CASmartPreferences::Pref::Load((CFStringRef *)(*(void *)(a1 + 80) - 48));
      goto LABEL_27;
    }
    uint64_t v11 = *(void *)(a1 + 72);
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - v11) >> 4);
    if (v12 + 1 > 0x555555555555555) {
      std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - v11) >> 4);
    uint64_t v14 = 2 * v13;
    if (2 * v13 <= v12 + 1) {
      uint64_t v14 = v12 + 1;
    }
    if (v13 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v15 = 0x555555555555555;
    }
    else {
      unint64_t v15 = v14;
    }
    uint64_t v30 = a1 + 88;
    if (v15)
    {
      if (v15 > 0x555555555555555) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v16 = (char *)operator new(48 * v15);
    }
    else
    {
      uint64_t v16 = 0;
    }
    v27 = v16;
    v28.i64[0] = (uint64_t)&v16[48 * v12];
    v29 = &v16[48 * v15];
    std::construct_at[abi:ne180100]<CASmartPreferences::Pref,__CFString const*&,__CFString const*&,std::function<BOOL ()(void const*)> &,CASmartPreferences::Pref*>(v28.i64[0], (uint64_t)a2, (uint64_t)a3, a4);
    uint64_t v17 = v28.i64[0];
    uint64_t v10 = v28.i64[0] + 48;
    v28.i64[1] = v28.i64[0] + 48;
    uint64_t v19 = *(void *)(a1 + 72);
    unint64_t v18 = *(void *)(a1 + 80);
    if (v18 == v19)
    {
      int64x2_t v25 = vdupq_n_s64(v18);
LABEL_25:
      *(void *)(a1 + 72) = v17;
      *(void *)(a1 + 80) = v10;
      int64x2_t v28 = v25;
      v26 = *(char **)(a1 + 88);
      *(void *)(a1 + 88) = v29;
      v29 = v26;
      v27 = (char *)v25.i64[0];
      std::__split_buffer<CASmartPreferences::Pref>::~__split_buffer((uint64_t)&v27);
      goto LABEL_26;
    }
    uint64_t v20 = 0;
    uint64_t v21 = v28.i64[0];
    while (1)
    {
      uint64_t v22 = v17 + v20;
      *(_OWORD *)(v17 + v20 - 48) = *(_OWORD *)(v18 + v20 - 48);
      uint64_t v23 = v18 + v20 - 8;
      uint64_t v24 = *(void *)v23;
      if (*(void *)v23)
      {
        if (v18 + v20 - 32 == v24)
        {
          *(void *)(v22 - 8) = v22 - 32;
          (*(void (**)(void))(**(void **)v23 + 24))();
          goto LABEL_22;
        }
        *(void *)(v22 - 8) = v24;
      }
      else
      {
        uint64_t v23 = v21 - 8;
      }
      *(void *)uint64_t v23 = 0;
LABEL_22:
      v21 -= 48;
      v20 -= 48;
      if (v18 + v20 == v19)
      {
        v17 += v20;
        int64x2_t v25 = *(int64x2_t *)(a1 + 72);
        uint64_t v10 = v28.i64[1];
        goto LABEL_25;
      }
    }
  }
LABEL_27:
  std::mutex::unlock((std::mutex *)a1);
}

void sub_1ABACB138(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<CASmartPreferences::Pref>::~__split_buffer((uint64_t)va);
  std::mutex::unlock(v2);
  _Unwind_Resume(a1);
}

uint64_t CASmartPreferences::HavePref(CASmartPreferences *this, CFTypeRef cf1, const __CFString *a3)
{
  size_t v3 = (CFTypeRef *)*((void *)this + 9);
  size_t v4 = (CFTypeRef *)*((void *)this + 10);
  if (v3 == v4) {
    return 0;
  }
  while (!CFEqual(cf1, *v3) || !CFEqual(a3, v3[1]))
  {
    v3 += 6;
    if (v3 == v4) {
      return 0;
    }
  }
  return 1;
}

void *std::construct_at[abi:ne180100]<CASmartPreferences::Pref,__CFString const*&,__CFString const*&,std::function<BOOL ()(void const*)> &,CASmartPreferences::Pref*>(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v8[4] = *MEMORY[0x1E4F143B8];
  std::__function::__value_func<BOOL ()(void const*)>::__value_func[abi:ne180100]((uint64_t)v8, a4);
  *a1 = a2;
  a1[1] = a3;
  std::__function::__value_func<BOOL ()(void const*)>::__value_func[abi:ne180100]((uint64_t)(a1 + 2), (uint64_t)v8);
  std::__function::__value_func<BOOL ()(void const*)>::~__value_func[abi:ne180100](v8);
  return a1;
}

void sub_1ABACB268(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<BOOL ()(void const*)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__value_func<BOOL ()(void const*)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
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

void *std::__function::__value_func<BOOL ()(void const*)>::~__value_func[abi:ne180100](void *a1)
{
  int v2 = (void *)a1[3];
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

CFPropertyListRef CASmartPreferences::Pref::Load(CFStringRef *this)
{
  CFPropertyListRef result = CFPreferencesCopyAppValue(*this, this[1]);
  if (result)
  {
    CFPropertyListRef v4 = result;
    CFStringRef v3 = this[5];
    if (!v3) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    return (CFPropertyListRef)(*((uint64_t (**)(CFStringRef, CFPropertyListRef *))v3->isa + 6))(v3, &v4);
  }
  return result;
}

uint64_t std::__split_buffer<CASmartPreferences::Pref>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 48;
    std::__function::__value_func<BOOL ()(void const*)>::~__value_func[abi:ne180100]((void *)(i - 32));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::destroy_deallocate(void *a1)
{
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](a1 + 2);

  operator delete(a1);
}

void *std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::__clone(uint64_t a1)
{
  int v2 = operator new(0x30uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *int v2 = &unk_1F0303638;
  v2[1] = v3;
  std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)(v2 + 2), a1 + 16);
  return v2;
}

void sub_1ABACB4F8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
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

uint64_t std::__function::__func<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0,std::allocator<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0>,void ()(int)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1F0303680;
  a2[1] = v2;
  return result;
}

void CASmartPreferences::CASmartPreferences(CASmartPreferences *this)
{
  *(void *)this = 850045863;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = CFSetCreateMutable(0, 0, MEMORY[0x1E4F1D548]);
  global_queue = dispatch_get_global_queue(0, 0);
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  uint64_t v3 = dispatch_source_create(MEMORY[0x1E4F14480], 1uLL, 0, global_queue);
  *((void *)this + 12) = v3;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 0x40000000;
  handler[2] = ___ZN18CASmartPreferencesC2Ev_block_invoke;
  handler[3] = &__block_descriptor_tmp_383;
  handler[4] = this;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_resume(*((dispatch_object_t *)this + 12));
}

void sub_1ABACB6B8(_Unwind_Exception *a1)
{
  std::mutex::~mutex(v1);
  _Unwind_Resume(a1);
}

void *swix::ipc_interface::ipc_interface(void *result, uint64_t a2)
{
  *CFPropertyListRef result = &unk_1F0303548;
  result[1] = 0;
  if (*(unsigned char *)(a2 + 128)) {
    operator new();
  }
  return result;
}

void sub_1ABACB778(_Unwind_Exception *a1)
{
  MEMORY[0x1AD112B70](v2, 0x10A1C404C29359ELL);
  uint64_t v4 = *(void *)(v1 + 8);
  *(void *)(v1 + 8) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  _Unwind_Resume(a1);
}

void swix::ipc_endpoint::ipc_endpoint(swix::ipc_endpoint *this, const swix::connection_config *a2, swix::ipc_interface *a3)
{
}

void sub_1ABACB894(_Unwind_Exception *a1)
{
  xpc_release(*(xpc_object_t *)(v2 - 24));
  std::__function::__value_func<void ()(swix::ipc_endpoint &,applesauce::xpc::object const&)>::~__value_func[abi:ne180100](v1 + 3);
  void *v1 = &unk_1F03034F8;
  uint64_t v4 = (std::__shared_weak_count *)v1[2];
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  _Unwind_Resume(a1);
}

void swix::connection::connection(swix::connection *this, const swix::connection_config *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = &unk_1F03034F8;
  swix::connection_config::connection_config(&v6, a2);
  if (!object)
  {
    uint64_t v2 = dispatch_queue_create("", 0);
    uint64_t v3 = object;
    dispatch_object_t object = v2;
    if (v3) {
      dispatch_release(v3);
    }
  }
  swix::make_connection(&v5, (uint64_t)&v6);
  uint64_t v4 = operator new(0xD0uLL);
  v4[1] = 0;
  int v4[2] = 0;
  *uint64_t v4 = &unk_1F0303798;
  swix::connection::state::state((swix::connection::state *)(v4 + 3), (const swix::connection_config *)&v6, (const applesauce::xpc::connection *)&v5);
}

void sub_1ABACBAB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, char a12)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void swix::make_connection(void *a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x1AD1137F0](*(void *)(a2 + 48));
  uint64_t v5 = MEMORY[0x1E4F14578];
  int v6 = v4 == MEMORY[0x1E4F14578];
  int v7 = *(char *)(a2 + 23);
  uint64_t v8 = *(void *)(a2 + 8);
  if (v7 >= 0) {
    uint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  uint64_t v9 = *(unsigned __int8 *)(a2 + 47);
  int v10 = (char)v9;
  if ((v9 & 0x80u) != 0) {
    uint64_t v9 = *(void *)(a2 + 32);
  }
  if (v8) {
    ++v6;
  }
  if (v9) {
    ++v6;
  }
  if (v6 != 1) {
    std::terminate();
  }
  if (v8)
  {
    if (v7 >= 0) {
      uint64_t v11 = (const char *)a2;
    }
    else {
      uint64_t v11 = *(const char **)a2;
    }
    xpc_connection_t mach_service = xpc_connection_create_mach_service(v11, 0, 0);
    if (mach_service)
    {
      xpc_object_t v13 = mach_service;
      *a1 = mach_service;
      goto LABEL_23;
    }
    xpc_object_t v13 = xpc_null_create();
    *a1 = v13;
    if (v13)
    {
LABEL_23:
      if (MEMORY[0x1AD1137F0](v13) != v5) {
        goto LABEL_29;
      }
LABEL_30:
      xpc_retain(v13);
      goto LABEL_31;
    }
  }
  else
  {
    if (!v9)
    {
      xpc_object_t v16 = xpc_null_create();
      *a1 = *(void *)(a2 + 48);
      *(void *)(a2 + 48) = xpc_null_create();
      xpc_object_t v17 = xpc_null_create();
      unint64_t v18 = *(void **)(a2 + 48);
      *(void *)(a2 + 48) = v16;
      xpc_release(v18);
      xpc_release(v17);
      return;
    }
    if (v10 >= 0) {
      uint64_t v14 = (const char *)(a2 + 24);
    }
    else {
      uint64_t v14 = *(const char **)(a2 + 24);
    }
    xpc_connection_t v15 = xpc_connection_create(v14, 0);
    xpc_object_t v13 = v15;
    if (v15)
    {
      *a1 = v15;
    }
    else
    {
      xpc_object_t v13 = xpc_null_create();
      *a1 = v13;
      if (!v13) {
        goto LABEL_29;
      }
    }
    if (MEMORY[0x1AD1137F0](v13) == v5) {
      goto LABEL_30;
    }
  }
LABEL_29:
  *a1 = xpc_null_create();
LABEL_31:
  xpc_release(v13);
}

void swix::connection::state::state(swix::connection::state *this, const swix::connection_config *a2, const applesauce::xpc::connection *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  uint64_t v5 = (swix::connection::state *)((char *)this + 16);
  swix::connection_config::connection_config((std::string *)((char *)this + 16), a2);
  *((void *)this + 18) = 0;
  swix::detail::connection_impl::create(v5, a3, v6);
}

void sub_1ABACBE40(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v3);
  operator delete(v5);
  int v6 = *(const void **)(v1 + 144);
  if (v6) {
    _Block_release(v6);
  }
  swix::connection_config::~connection_config(v2);
  uint64_t v7 = *(std::__shared_weak_count **)(v1 + 8);
  if (v7) {
    std::__shared_weak_count::__release_weak(v7);
  }
  _Unwind_Resume(a1);
}

std::string *swix::connection_config::connection_config(std::string *this, const swix::connection_config *a2)
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
  int v6 = (void *)*((void *)a2 + 6);
  this[2].__r_.__value_.__r.__words[0] = (std::string::size_type)v6;
  if (v6) {
    xpc_retain(v6);
  }
  else {
    this[2].__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  }
  uint64_t v7 = *((void *)a2 + 7);
  this[2].__r_.__value_.__l.__size_ = (std::string::size_type)v7;
  if (v7) {
    dispatch_retain(v7);
  }
  std::string::size_type v8 = *((void *)a2 + 8);
  LOWORD(this[3].__r_.__value_.__l.__data_) = *((_WORD *)a2 + 36);
  this[2].__r_.__value_.__r.__words[2] = v8;
  this[3].__r_.__value_.__s.__data_[8] = 0;
  this[5].__r_.__value_.__s.__data_[0] = 0;
  if (*((unsigned char *)a2 + 120))
  {
    this[3].__r_.__value_.__l.__size_ = *((void *)a2 + 10);
    std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)&this[3].__r_.__value_.__r.__words[2], (uint64_t)a2 + 88);
    this[5].__r_.__value_.__s.__data_[0] = 1;
  }
  return this;
}

void sub_1ABACBF9C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
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

void swix::detail::connection_impl::create(swix::detail::connection_impl *this, const swix::connection_config *a2, const applesauce::xpc::connection *a3)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  operator new();
}

void sub_1ABACC22C(_Unwind_Exception *a1)
{
  applesauce::xpc::connection::~connection(v2);
  long long v4 = *(NSObject **)(v1 + 8);
  if (v4) {
    dispatch_release(v4);
  }
  MEMORY[0x1AD112B70](v1, 0xE0C40F9C386F3);
  _Unwind_Resume(a1);
}

void applesauce::xpc::connection::to_debug_string(applesauce::xpc::connection *this, uint64_t a2)
{
  uint64_t v3 = (char *)MEMORY[0x1AD113770](a2);
  std::string::basic_string[abi:ne180100]<0>(this, v3);

  free(v3);
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

void swix::connection::state::set_handler(uint64_t a1, _xpc_connection_s *a2, void *aBlock)
{
  if (*(void *)(a1 + 168))
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 0x40000000;
    v9[2] = ___ZN4swix10connection5state11set_handlerEP17_xpc_connection_sU13block_pointerFvPvE_block_invoke;
    v9[3] = &unk_1E5E39FA0;
    v9[4] = aBlock;
    v9[5] = a1;
    size_t v5 = _Block_copy(v9);
    int v6 = *(const void **)(a1 + 144);
    *(void *)(a1 + 144) = v5;
    if (v6) {
      _Block_release(v6);
    }
  }
  else
  {
    if (aBlock) {
      uint64_t v7 = _Block_copy(aBlock);
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(const void **)(a1 + 144);
    *(void *)(a1 + 144) = v7;
    if (v8) {
      _Block_release(v8);
    }
  }
  xpc_connection_set_event_handler(a2, *(xpc_handler_t *)(a1 + 144));
}

uint64_t CADeprecated::XBasicMIGServer::SetServerDispatchQueue(uint64_t result, dispatch_queue_t *a2)
{
  if (atomic_load_explicit(*(atomic_uint *volatile *)(result + 40), memory_order_acquire))
  {
    uint64_t v3 = result;
    uintptr_t explicit = atomic_load_explicit(*(atomic_uint *volatile *)(result + 40), memory_order_acquire);
    size_t v5 = dispatch_source_create(MEMORY[0x1E4F14458], explicit, 0, *a2);
    int v6 = v5;
    handler[6] = v5;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 1174405120;
    handler[2] = ___ZN12CADeprecated15XBasicMIGServer22SetServerDispatchQueueERKN10applesauce8dispatch2v15queueE_block_invoke;
    handler[3] = &__block_descriptor_tmp_8;
    handler[4] = v3;
    void handler[5] = v5;
    if (v5) {
      dispatch_retain(v5);
    }
    dispatch_source_set_event_handler(v6, handler);
    uint64_t v7 = *(void *)(v3 + 40);
    uint64_t v8 = *(void *)(v3 + 48);
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 1174405120;
    v9[2] = ___ZN12CADeprecated15XBasicMIGServer22SetServerDispatchQueueERKN10applesauce8dispatch2v15queueE_block_invoke_9;
    v9[3] = &__block_descriptor_tmp_10;
    v9[4] = v7;
    v9[5] = v8;
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    dispatch_source_set_cancel_handler(v6, v9);
    CADeprecated::XMachPortServicer::SetQueueAndSource();
  }
  return result;
}

void sub_1ABACC5F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,dispatch_object_t object)
{
  if (a15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a15);
  }
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  if (object) {
    dispatch_release(object);
  }
  if (v21) {
    dispatch_release(v21);
  }
  _Unwind_Resume(exception_object);
}

void CADeprecated::XMachServer::DoForEachClient(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a1 + 112;
  uint64_t v4 = *(void *)(a1 + 112);
  uint64_t v7 = a1 + 112;
  char v8 = (*(uint64_t (**)(uint64_t))(v4 + 16))(a1 + 112);
  int v6 = *(void **)(v5 + 88);
  if (v6 != *(void **)(v5 + 96))
  {
    do
      (*(void (**)(uint64_t, void))(a2 + 16))(a2, *v6++);
    while (v6 != *(void **)(a1 + 208));
  }
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v7);
}

void sub_1ABACC6CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void CADeprecated::CAMutex::Locker::~Locker(CADeprecated::CAMutex::Locker *this)
{
  if (*((unsigned char *)this + 8)) {
    (*(void (**)(void))(**(void **)this + 24))();
  }
}

void BaseOpaqueObject::BaseOpaqueObject(BaseOpaqueObject *this)
{
  *(void *)this = &unk_1F0303130;
  uint64_t v2 = (atomic_uint *)OpaqueObjectMgrInstance();
  *((_DWORD *)this + 2) = OpaqueObjectMgr::add(v2, this);
}

uint64_t OpaqueObjectMgr::add(atomic_uint *this, BaseOpaqueObject *a2)
{
  do
  {
    uint64_t add = atomic_fetch_add(this + 36, 1u);
    if ((add & 0x80000000) != 0)
    {
      uint64_t v4 = (add - 2147479552);
      atomic_compare_exchange_strong(this + 36, (unsigned int *)&add, v4);
      uint64_t add = v4;
    }
    uint64_t v5 = caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::lookup<(caulk::concurrent::guarded_lookup_hash_table_options)0,void>((uint64_t)this, add);
    if (v6) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 1;
    }
  }
  while (!v7);
  caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::_addOrReplace((uint64_t)this, add);
  return add;
}

uint64_t BaseOpaqueObject::ResolveOpaqueRef(uint64_t a1, int a2)
{
  uint64_t result = OpaqueObjectMgr::sInstance;
  if (OpaqueObjectMgr::sInstance)
  {
    uint64_t v4 = caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::lookup<(caulk::concurrent::guarded_lookup_hash_table_options)0,void>(OpaqueObjectMgr::sInstance, a2);
    if (v5) {
      BOOL v6 = v4 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      return 0;
    }
    else
    {
      BOOL v7 = v4;
      if ((*(unsigned int (**)(uint64_t *, uint64_t))(*v4 + 24))(v4, a1)) {
        return (uint64_t)v7;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

uint64_t *caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::lookup<(caulk::concurrent::guarded_lookup_hash_table_options)0,void>(uint64_t a1, int a2)
{
  uint64_t v2 = (atomic_uint *)(a1 + 48);
  atomic_fetch_add((atomic_uint *volatile)(a1 + 48), 1u);
  uint64_t result = (uint64_t *)atomic_load((unint64_t *)(a1 + 40));
  if (result)
  {
    caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl::findSlotForKey(result, a2);
    if (v4) {
      uint64_t result = *(uint64_t **)(v4 + 8);
    }
    else {
      uint64_t result = 0;
    }
  }
  atomic_fetch_add(v2, 0xFFFFFFFF);
  return result;
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::table_impl::findSlotForKey(uint64_t *a1, int a2)
{
  int v3 = *((_DWORD *)a1 + 2);
  uint64_t v4 = *a1;
  int v17 = a2;
  uint64_t v5 = *(void *)(v4 + 24);
  if (!v5) {
    goto LABEL_24;
  }
  uint64_t v7 = (*(unsigned int (**)(uint64_t, int *))(*(void *)v5 + 48))(v5, &v17) % *((_DWORD *)a1 + 2);
  if ((int)v7 >= 3) {
    int v8 = 0;
  }
  else {
    int v8 = v3;
  }
  uint64_t v9 = (v7 + v8 - 3);
  uint64_t v10 = 0xFFFFFFFFLL;
  uint64_t v11 = 1;
  uint64_t v12 = v7;
  while (1)
  {
    uint64_t v13 = v9;
    unint64_t v14 = atomic_load((unint64_t *)&a1[v12 + 2]);
    if (v14 != -1) {
      break;
    }
    if ((int)v10 >= 0) {
      uint64_t v10 = v10;
    }
    else {
      uint64_t v10 = v12;
    }
LABEL_13:
    if ((int)v9 >= 3) {
      int v15 = 0;
    }
    else {
      int v15 = v3;
    }
    uint64_t v9 = (v9 + v15 - 3);
    uint64_t v12 = v13;
    if (v13 == v7)
    {
      if ((v10 & 0x80000000) == 0)
      {
        uint64_t v11 = 0;
        uint64_t v12 = v10;
        return v11 | (v12 << 32);
      }
      __break(1u);
LABEL_24:
      std::__throw_bad_function_call[abi:ne180100]();
    }
  }
  if (v14)
  {
    if (*(_DWORD *)(v14 + 4) == a2) {
      return v11 | (v12 << 32);
    }
    goto LABEL_13;
  }
  uint64_t v11 = 0;
  if ((int)v10 >= 0) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v12;
  }
  return v11 | (v12 << 32);
}

uint64_t std::__function::__func<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0,std::allocator<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0>,unsigned int ()(unsigned int)>::operator()(uint64_t a1, unsigned int *a2)
{
  return *a2;
}

void caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::_addOrReplace(uint64_t a1, int a2)
{
  uint64_t v4 = (std::mutex *)(a1 + 80);
  std::mutex::lock((std::mutex *)(a1 + 80));
  uint64_t v5 = (uint64_t *)atomic_load((unint64_t *)(a1 + 40));
  int v6 = *(_DWORD *)(a1 + 32) + 1;
  *(_DWORD *)(a1 + 32) = v6;
  if (v5)
  {
    unsigned int v7 = 16 * v6;
    unsigned int v8 = *((_DWORD *)v5 + 2);
    if (v7 / v8 < 0xB) {
      goto LABEL_6;
    }
    unsigned int v9 = 2 * v8;
  }
  else
  {
    unsigned int v9 = 8;
  }
  uint64_t v5 = (uint64_t *)caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::rehash((unint64_t *)a1, v9);
LABEL_6:
  if ((caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl::findSlotForKey(v5, a2) & 1) == 0)operator new(); {
  --*(_DWORD *)(a1 + 32);
  }

  std::mutex::unlock(v4);
}

void sub_1ABACCB00(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

BOOL CADeprecated::CAMutex::Lock(CADeprecated::CAMutex *this)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = pthread_self();
  int v3 = pthread_equal(v2, (pthread_t)atomic_load_explicit((atomic_ullong *volatile)this + 2, memory_order_acquire));
  if (!v3)
  {
    int v4 = pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
    if (v4)
    {
      int v6 = v4;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v8 = 136315394;
        unsigned int v9 = "CAMutex.cpp";
        __int16 v10 = 1024;
        int v11 = 106;
        _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAMutex::Lock: Could not lock the mutex", (uint8_t *)&v8, 0x12u);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = off_1F0303008;
      exception[2] = v6;
    }
    atomic_store((unint64_t)v2, (unint64_t *)this + 2);
  }
  return v3 == 0;
}

void CADeprecated::CAMutex::Unlock(CADeprecated::CAMutex *this)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = pthread_self();
  if (pthread_equal(v2, (pthread_t)atomic_load_explicit((atomic_ullong *volatile)this + 2, memory_order_acquire)))
  {
    atomic_store(0, (unint64_t *)this + 2);
    int v3 = pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 24));
    if (v3)
    {
      int v4 = v3;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315394;
        unsigned int v7 = "CAMutex.cpp";
        __int16 v8 = 1024;
        int v9 = 152;
        _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAMutex::Unlock: Could not unlock the mutex", (uint8_t *)&v6, 0x12u);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = off_1F0303008;
      exception[2] = v4;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    unsigned int v7 = "CAMutex.cpp";
    __int16 v8 = 1024;
    int v9 = 160;
    _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  CAMutex::Unlock: A thread is attempting to unlock a Mutex it doesn't own", (uint8_t *)&v6, 0x12u);
  }
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::emptyReleasePool(uint64_t result)
{
  int v1 = atomic_load((unsigned int *)(result + 48));
  if (v1 <= 0)
  {
    uint64_t v2 = result;
    int v4 = *(uint64_t **)(result + 56);
    for (uint64_t i = *(uint64_t **)(result + 64);
          i != v4;
          uint64_t result = std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl>>::reset[abi:ne180100](i))
    {
      --i;
    }
    *(void *)(v2 + 64) = v4;
  }
  return result;
}

uint64_t OpaqueObjectMgrInstance(void)
{
  if (atomic_load_explicit((atomic_ullong *volatile)&OpaqueObjectMgrInstance(void)::onceflag, memory_order_acquire) != -1)
  {
    int v3 = &v1;
    uint64_t v2 = &v3;
    std::__call_once(&OpaqueObjectMgrInstance(void)::onceflag, &v2, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<OpaqueObjectMgrInstance(void)::$_0 &&>>);
  }
  return OpaqueObjectMgr::sInstance;
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void CADeprecated::XMachPortServicer::SetQueueAndSource()
{
}

void *CADeprecated::XMachPortServicer::DispatchImpl::DispatchImpl(void *a1, dispatch_queue_t *a2, dispatch_object_t *a3)
{
  int v6 = *a2;
  *a1 = &unk_1F03032F8;
  a1[1] = v6;
  if (v6) {
    dispatch_retain(v6);
  }
  unsigned int v7 = *a3;
  a1[2] = *a3;
  if (v7) {
    dispatch_retain(v7);
  }
  dispatch_set_target_queue(*a3, *a2);
  dispatch_resume(*a3);
  return a1;
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
    __int16 v8 = (std::string *)operator new(v6 + 1);
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

_DWORD *caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::rehash(unint64_t *a1, unsigned int a2)
{
  int v4 = a1 + 5;
  unint64_t v5 = atomic_load(a1 + 5);
  std::string::size_type v6 = operator new(8 * (a2 - 1) + 24);
  *(void *)std::string::size_type v6 = a1;
  v6[2] = a2;
  *((void *)v6 + 2) = 0;
  bzero(v6 + 4, 8 * a2);
  if (v5)
  {
    uint64_t v7 = *(unsigned int *)(v5 + 8);
    if (v7)
    {
      __int16 v8 = (atomic_uint **)(v5 + 16);
      do
      {
        int v9 = *v8;
        if ((unint64_t)*v8 + 1 >= 2)
        {
          unint64_t SlotForKey = caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl::findSlotForKey((uint64_t *)v6, v9[1]);
          if ((SlotForKey & 1) == 0)
          {
            atomic_fetch_add(v9, 0x10000u);
            atomic_store((unint64_t)v9, (unint64_t *)&v6[2 * HIDWORD(SlotForKey) + 4]);
          }
        }
        ++v8;
        --v7;
      }
      while (v7);
    }
    atomic_store((unint64_t)v6, a1 + 5);
    uint64_t v12 = (unint64_t *)a1[8];
    unint64_t v11 = a1[9];
    if ((unint64_t)v12 >= v11)
    {
      unint64_t v14 = (void *)a1[7];
      uint64_t v15 = v12 - v14;
      unint64_t v16 = v15 + 1;
      if ((unint64_t)(v15 + 1) >> 61) {
        std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v17 = v11 - (void)v14;
      if (v17 >> 2 > v16) {
        unint64_t v16 = v17 >> 2;
      }
      if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v18 = v16;
      }
      if (v18)
      {
        if (v18 >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        uint64_t v19 = (char *)operator new(8 * v18);
      }
      else
      {
        uint64_t v19 = 0;
      }
      uint64_t v20 = (unint64_t *)&v19[8 * v15];
      unint64_t *v20 = v5;
      uint64_t v13 = v20 + 1;
      while (v12 != v14)
      {
        unint64_t v21 = *--v12;
        *uint64_t v12 = 0;
        *--uint64_t v20 = v21;
      }
      long long v22 = *(_OWORD *)(a1 + 7);
      a1[7] = (unint64_t)v20;
      a1[8] = (unint64_t)v13;
      a1[9] = (unint64_t)&v19[8 * v18];
      uint64_t v23 = (uint64_t *)*((void *)&v22 + 1);
      uint64_t v24 = (uint64_t *)v22;
      while (v23 != v24)
        std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl>>::reset[abi:ne180100](--v23);
      if (v24) {
        operator delete(v24);
      }
    }
    else
    {
      *uint64_t v12 = v5;
      uint64_t v13 = v12 + 1;
    }
    a1[8] = (unint64_t)v13;
  }
  else
  {
    atomic_store((unint64_t)v6, v4);
  }
  return v6;
}

uint64_t swix::detail::watchdog_timer::watchdog_timer(uint64_t a1, void *a2)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = *a2;
  int v3 = a2 + 4;
  int v4 = (void *)a2[4];
  if (!v4)
  {
    int v3 = (void *)(a1 + 48);
    goto LABEL_5;
  }
  if (v4 != a2 + 1)
  {
    *(void *)(a1 + 48) = v4;
LABEL_5:
    *int v3 = 0;
    goto LABEL_7;
  }
  *(void *)(a1 + 48) = a1 + 24;
  (*(void (**)(void))(*(void *)*v3 + 24))();
LABEL_7:
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  unint64_t v5 = (NSObject **)(a1 + 56);
  if (!*(void *)(a1 + 48)) {
    std::terminate();
  }
  global_queue = dispatch_get_global_queue(25, 0);
  uint64_t v7 = dispatch_queue_create_with_target_V2("", 0, global_queue);
  __int16 v8 = *v5;
  *unint64_t v5 = v7;
  if (v8)
  {
    dispatch_release(v8);
    uint64_t v7 = *v5;
  }
  int v9 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v7);
  uint64_t v10 = *(NSObject **)(a1 + 64);
  *(void *)(a1 + 64) = v9;
  if (v10)
  {
    dispatch_release(v10);
    int v9 = *(NSObject **)(a1 + 64);
  }
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 0x40000000;
  handler[2] = ___ZN4swix6detail14watchdog_timerC2ENS_14timeout_configE_block_invoke;
  handler[3] = &__block_descriptor_tmp_209;
  handler[4] = a1;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume(*(dispatch_object_t *)(a1 + 64));
  return a1;
}

void std::__shared_ptr_emplace<swix::connection::state>::__on_zero_shared(uint64_t a1)
{
}

void swix::connection::state::~state(swix::connection::state *this)
{
  swix::connection::state::cancel_connection((uint64_t)this, 1);
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 22);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  int v3 = (const void *)*((void *)this + 18);
  if (v3) {
    _Block_release(v3);
  }
  if (*((unsigned char *)this + 136)) {
    std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)this + 13);
  }
  int v4 = *((void *)this + 9);
  if (v4) {
    dispatch_release(v4);
  }
  xpc_release(*((xpc_object_t *)this + 8));
  *((void *)this + 8) = 0;
  if (*((char *)this + 63) < 0) {
    operator delete(*((void **)this + 5));
  }
  if (*((char *)this + 39) < 0) {
    operator delete(*((void **)this + 2));
  }
  unint64_t v5 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
}

void swix::connection::state::cancel_connection(uint64_t a1, int a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v4 = (os_unfair_lock_s *)(a1 + 152);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  uint64_t v5 = *(void *)(a1 + 160);
  *(void *)(a1 + 160) = 0;
  os_unfair_lock_unlock(v4);
  if (v5)
  {
    swix::detail::connection_impl::get((swix::detail::connection_impl *)&v21, *(void **)(v5 + 16));
    std::string::size_type v6 = v21;
    if (MEMORY[0x1AD1137F0](v21) == MEMORY[0x1E4F14578])
    {
      uint64_t v7 = *(NSObject **)v5;
      if (os_log_type_enabled(*(os_log_t *)v5, OS_LOG_TYPE_DEBUG))
      {
        applesauce::xpc::connection::to_debug_string((applesauce::xpc::connection *)block, *(void *)(v5 + 16));
        unint64_t v14 = SHIBYTE(v17) >= 0 ? block : (void **)block[0];
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v14;
        _os_log_debug_impl(&dword_1ABAC8000, v7, OS_LOG_TYPE_DEBUG, "canceling connection %s", buf, 0xCu);
        if (SHIBYTE(v17) < 0) {
          operator delete(block[0]);
        }
      }
      block[0] = (void *)MEMORY[0x1E4F143A8];
      block[1] = (void *)1174405120;
      uint64_t v17 = ___ZN4swix6detail15connection_impl6cancelENS_19CancellationContextE_block_invoke;
      unint64_t v18 = &__block_descriptor_tmp_18;
      uint64_t v19 = v5;
      xpc_object_t object = v6;
      if (v6) {
        xpc_retain(v6);
      }
      else {
        xpc_object_t object = xpc_null_create();
      }
      __int16 v8 = *(NSObject **)(v5 + 8);
      if (a2)
      {
        if (v8) {
          dispatch_retain(*(dispatch_object_t *)(v5 + 8));
        }
        dispatch_assert_queue_not_V2(v8);
        if (v8) {
          dispatch_release(v8);
        }
        int v9 = *(NSObject **)(v5 + 8);
        if (v9)
        {
          dispatch_retain(*(dispatch_object_t *)(v5 + 8));
          dispatch_barrier_async_and_wait(v9, block);
          dispatch_release(v9);
        }
        else
        {
          dispatch_barrier_async_and_wait(0, block);
        }
      }
      else
      {
        if (v8) {
          dispatch_retain(*(dispatch_object_t *)(v5 + 8));
        }
        dispatch_assert_queue_V2(v8);
        if (v8) {
          dispatch_release(v8);
        }
        v17((uint64_t)block);
      }
      uint64_t v10 = *(NSObject **)v5;
      if (os_log_type_enabled(*(os_log_t *)v5, OS_LOG_TYPE_DEBUG))
      {
        applesauce::xpc::connection::to_debug_string((applesauce::xpc::connection *)buf, *(void *)(v5 + 16));
        if (v23 >= 0) {
          uint64_t v15 = buf;
        }
        else {
          uint64_t v15 = *(unsigned char **)buf;
        }
        *(_DWORD *)uint64_t v24 = 136315138;
        int64x2_t v25 = v15;
        _os_log_debug_impl(&dword_1ABAC8000, v10, OS_LOG_TYPE_DEBUG, "proceeding after canceling %s", v24, 0xCu);
        if (v23 < 0) {
          operator delete(*(void **)buf);
        }
      }
      xpc_object_t v11 = xpc_null_create();
      xpc_object_t v12 = xpc_null_create();
      uint64_t v13 = *(void **)(v5 + 16);
      *(void *)(v5 + 16) = v11;
      xpc_release(v13);
      xpc_release(v12);
      xpc_release(object);
      xpc_object_t object = 0;
    }
    xpc_release(v6);
  }
}

void sub_1ABACD7E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, xpc_object_t object)
{
  xpc_release(object);
  xpc_release(v15);
  _Unwind_Resume(a1);
}

void CADeprecated::XMachReceivePort::~XMachReceivePort(CADeprecated::XMachReceivePort *this)
{
}

uint64_t CADeprecated::XMachReceivePort::CreateMachPort(atomic_uint *this, integer_t a2)
{
  kern_return_t attributes;
  mach_error_t v10;
  char *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  mach_error_t v16;
  mach_error_t v17;
  char *v18;
  uint64_t v19;
  mach_msg_type_number_t port_info_outCnt;
  integer_t port_info_out;
  mach_port_name_t name;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E4F143B8];
  CADeprecated::XMachReceivePort::SetMachPort(this, 0);
  name = 0;
  int v4 = (ipc_space_t *)MEMORY[0x1E4F14960];
  uint64_t v5 = mach_port_allocate(*MEMORY[0x1E4F14960], 1u, &name);
  if (v5)
  {
    uint64_t v19 = v5;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      int64x2_t v25 = "XMachServer.cpp";
      uint64_t v26 = 1024;
      v27 = 149;
      int64x2_t v28 = 2080;
      v29 = "ret = mach_port_allocate(mach_task_self(), MACH_PORT_RIGHT_RECEIVE, &port)";
      uint64_t v30 = 1024;
      int v31 = v19;
      _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d  ca_verify_noerr: [%s, %d]", buf, 0x22u);
    }
  }
  else
  {
    uint64_t inserted = mach_port_insert_right(*v4, name, name, 0x14u);
    if (!inserted)
    {
      atomic_store(name, (unsigned int *)this);
      if (a2 >= 1)
      {
        port_info_outCnt = 1;
        ipc_space_read_t v7 = *v4;
        mach_port_name_t v8 = atomic_load((unsigned int *)this);
        attributes = mach_port_get_attributes(v7, v8, 1, &port_info_out, &port_info_outCnt);
        if (!attributes)
        {
          port_info_out = a2;
          unint64_t v14 = *v4;
          uint64_t v15 = atomic_load((unsigned int *)this);
          unint64_t v16 = MEMORY[0x1AD1130D0](v14, v15, 1, &port_info_out, 1);
          if (!v16) {
            return 0;
          }
          uint64_t v17 = v16;
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            return 0;
          }
          unint64_t v18 = mach_error_string(v17);
          *(_DWORD *)buf = 136315650;
          int64x2_t v25 = "XMachServer.cpp";
          uint64_t v26 = 1024;
          v27 = 169;
          int64x2_t v28 = 2080;
          v29 = v18;
          xpc_object_t v12 = MEMORY[0x1E4F14500];
          uint64_t v13 = "%25s:%-5d couldn't set mach port limits info (%s)";
          goto LABEL_10;
        }
        uint64_t v10 = attributes;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          xpc_object_t v11 = mach_error_string(v10);
          *(_DWORD *)buf = 136315650;
          int64x2_t v25 = "XMachServer.cpp";
          uint64_t v26 = 1024;
          v27 = 164;
          int64x2_t v28 = 2080;
          v29 = v11;
          xpc_object_t v12 = MEMORY[0x1E4F14500];
          uint64_t v13 = "%25s:%-5d couldn't get mach port limits info (%s)";
LABEL_10:
          _os_log_impl(&dword_1ABAC8000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x1Cu);
        }
      }
      return 0;
    }
    uint64_t v19 = inserted;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      int64x2_t v25 = "XMachServer.cpp";
      uint64_t v26 = 1024;
      v27 = 153;
      int64x2_t v28 = 2080;
      v29 = "ret = mach_port_insert_right(mach_task_self(), port, port, MACH_MSG_TYPE_MAKE_SEND)";
      uint64_t v30 = 1024;
      int v31 = v19;
      _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d  ca_verify_noerr: [%s, %d]", buf, 0x22u);
    }
    mach_port_mod_refs(*v4, name, 1u, -1);
  }
  return v19;
}

atomic_uint *CADeprecated::XMachReceivePort::SetMachPort(atomic_uint *this, unsigned int a2)
{
  mach_port_name_t v2 = atomic_exchange(this, a2);
  if (v2)
  {
    int v3 = (ipc_space_t *)MEMORY[0x1E4F14960];
    mach_port_mod_refs(*MEMORY[0x1E4F14960], v2, 1u, -1);
    ipc_space_t v4 = *v3;
    return (atomic_uint *)mach_port_deallocate(v4, v2);
  }
  return this;
}

BOOL PlatformUtilities_iOS::ProductIsAppleTV(PlatformUtilities_iOS *this)
{
  return MGGetSInt32Answer() == 4;
}

void __copy_helper_block_e8_40c37_ZTSN10applesauce8dispatch2v16sourceE(uint64_t a1, uint64_t a2)
{
  int v3 = *(NSObject **)(a2 + 40);
  *(void *)(a1 + 4CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = v3;
  if (v3) {
    dispatch_retain(v3);
  }
}

uint64_t CAAudioChannelLayout::NumberChannels(CAAudioChannelLayout *this, const AudioChannelLayout *a2)
{
  if (*(_DWORD *)this == 0x10000)
  {
    uint8x8_t v3 = (uint8x8_t)vcnt_s8((int8x8_t)*((unsigned int *)this + 1));
    v3.i16[0] = vaddlv_u8(v3);
    return v3.u32[0];
  }
  else if (*(_DWORD *)this)
  {
    return (unsigned __int16)*(_DWORD *)this;
  }
  else
  {
    return *((unsigned int *)this + 2);
  }
}

const __CFData **operator<<(const __CFData **a1, CFDataRef *a2)
{
  if (*a2) {
    int Length = CFDataGetLength(*a2);
  }
  else {
    int Length = -1;
  }
  *(_DWORD *)bytes = Length;
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, bytes, 4);
  if (*(int *)bytes >= 1)
  {
    BytePtr = CFDataGetBytePtr(*a2);
    CFIndex v6 = *(unsigned int *)bytes;
    Mutable = *a1;
    if (!*a1)
    {
      Mutable = CFDataCreateMutable(0, 0);
      *a1 = Mutable;
    }
    CFDataAppendBytes(Mutable, BytePtr, v6);
  }
  return a1;
}

void CASerializer::Write(const __CFData **this, const UInt8 *a2, unsigned int a3, int a4)
{
  CASerializer::PrepareToWrite(this, a4);
  ipc_space_read_t v7 = *this;

  CFDataAppendBytes(v7, a2, a3);
}

const __CFData **operator<<(const __CFData **a1, const UInt8 *a2)
{
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2, 4);
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2 + 4, 4);
  ipc_space_t v4 = (unsigned int *)(a2 + 8);
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2 + 8, 4);
  if (*((_DWORD *)a2 + 2))
  {
    unint64_t v5 = 0;
    CFIndex v6 = a2 + 28;
    do
    {
      CASerializer::PrepareToWrite(a1, 4);
      CFDataAppendBytes(*a1, v6 - 16, 4);
      CASerializer::PrepareToWrite(a1, 4);
      CFDataAppendBytes(*a1, v6 - 12, 4);
      CASerializer::PrepareToWrite(a1, 4);
      CFDataAppendBytes(*a1, v6 - 8, 4);
      CASerializer::PrepareToWrite(a1, 4);
      CFDataAppendBytes(*a1, v6 - 4, 4);
      CASerializer::PrepareToWrite(a1, 4);
      CFDataAppendBytes(*a1, v6, 4);
      ++v5;
      v6 += 20;
    }
    while (v5 < *v4);
  }
  return a1;
}

{
  CASerializer::PrepareToWrite(a1, 8);
  CFDataAppendBytes(*a1, a2, 8);
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2 + 8, 4);
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2 + 12, 4);
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2 + 16, 4);
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2 + 20, 4);
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2 + 24, 4);
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2 + 28, 4);
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2 + 32, 4);
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2 + 36, 4);
  return a1;
}

{
  CASerializer::PrepareToWrite(a1, 8);
  CFDataAppendBytes(*a1, a2, 8);
  CASerializer::PrepareToWrite(a1, 8);
  CFDataAppendBytes(*a1, a2 + 8, 8);
  return a1;
}

void CASerializer::PrepareToWrite(const __CFData **this, int a2)
{
  CFDataRef Mutable = *this;
  if (Mutable)
  {
    if (!a2) {
      return;
    }
  }
  else
  {
    CFDataRef Mutable = CFDataCreateMutable(0, 0);
    *this = Mutable;
    if (!a2) {
      return;
    }
  }
  int v5 = (a2 - 1) & CFDataGetLength(Mutable);
  if (v5)
  {
    CFIndex v6 = *this;
    CFDataAppendBytes(v6, CASerializer::PrepareToWrite::pad, (a2 - v5));
  }
}

uint64_t __copy_helper_block_e8_32c60_ZTSNSt3__110shared_ptrIN12CADeprecated16XMachReceivePortEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 4CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

BOOL PlatformUtilities_iOS::ProductIsAPhone(PlatformUtilities_iOS *this)
{
  return MGGetSInt32Answer() == 1;
}

uint64_t ___ZN14XPC_Connection10InitializeEv_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

void sub_1ABACDFD8(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

uint64_t XPC_Connection::ProcessMessage(XPC_Connection *this, void *a2)
{
  if (MEMORY[0x1AD1137F0](a2) == MEMORY[0x1E4F145A8])
  {
    uint64_t result = *((void *)this + 5);
    if (!result) {
      return result;
    }
  }
  else
  {
    uint64_t result = *((void *)this + 3);
    if (!result) {
      return result;
    }
  }
  ipc_space_t v4 = *(uint64_t (**)(void))(result + 16);

  return v4();
}

uint64_t SharableMemoryBlock::MachClientToken::Reset(uint64_t this)
{
  uint64_t v1 = this;
  mach_port_name_t v2 = *(_DWORD *)(this + 16);
  if (v2)
  {
    this = mach_port_deallocate(*MEMORY[0x1E4F14960], v2);
    if (this) {
      this = LogMachError("mach_port_deallocate", this);
    }
    *(_DWORD *)(v1 + 16) = 0;
  }
  *(_DWORD *)(v1 + 12) = 0;
  return this;
}

void RateRamp::RateRamp(RateRamp *this)
{
  __asm { FMOV            V1.2D, #1.0 }
  *(_OWORD *)this = _Q1;
  *((_OWORD *)this + 1) = xmmword_1ABAFBCE0;
  *((_OWORD *)this + 2) = xmmword_1ABAFBCE0;
  *((void *)this + 6) = 0;
}

{
  __asm { FMOV            V1.2D, #1.0 }
  *(_OWORD *)this = _Q1;
  *((_OWORD *)this + 1) = xmmword_1ABAFBCE0;
  *((_OWORD *)this + 2) = xmmword_1ABAFBCE0;
  *((void *)this + 6) = 0;
}

uint64_t CADeprecated::CAMutex::Try(CADeprecated::CAMutex *this, BOOL *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  *a2 = 0;
  ipc_space_t v4 = pthread_self();
  if (pthread_equal(v4, (pthread_t)atomic_load_explicit((atomic_ullong *volatile)this + 2, memory_order_acquire)))
  {
    BOOL v5 = 0;
  }
  else
  {
    int v6 = pthread_mutex_trylock((pthread_mutex_t *)((char *)this + 24));
    if (v6 == 16)
    {
      BOOL v5 = 0;
      uint64_t result = 0;
      goto LABEL_7;
    }
    if (v6)
    {
      v10[0] = HIBYTE(v6);
      v10[1] = BYTE2(v6);
      v10[2] = BYTE1(v6);
      int v8 = v6;
      v10[3] = v6;
      v10[4] = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        xpc_object_t v12 = "CAMutex.cpp";
        __int16 v13 = 1024;
        int v14 = 224;
        __int16 v15 = 1024;
        int v16 = v8;
        __int16 v17 = 2080;
        unint64_t v18 = v10;
        _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAMutex::Try: call to pthread_mutex_trylock failed, Error: %d (%s)", buf, 0x22u);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = off_1F0303008;
      exception[2] = v8;
    }
    atomic_store((unint64_t)v4, (unint64_t *)this + 2);
    BOOL v5 = 1;
  }
  uint64_t result = 1;
LABEL_7:
  *a2 = v5;
  return result;
}

uint64_t MSHMIGDispatchMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  memset(v4, 0, sizeof(v4));
  uint64_t v5 = a3;
  return mshMIGPerform(a1, a2, a3, v4);
}

uint64_t mshMIGPerform(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  mach_msg_return_t v26;
  FILE *v27;
  pid_t v28;
  uint64_t v30;
  mach_port_t previous;
  mach_port_mscount_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *((void *)a4 + 4);
  int v7 = *(_DWORD *)(a1 + 20);
  int v8 = *(_DWORD *)(v6 + 8);
  if (*(_DWORD *)(v6 + 12) <= v7 || v7 < v8)
  {
    MEMORY[0x1F4188790]();
    xpc_object_t v11 = (mach_msg_header_t *)&v30;
    int v12 = 0;
    __int16 v13 = 0;
  }
  else
  {
    __int16 v13 = *(void (**)(uint64_t, mach_msg_header_t *))(v6 + 40 * (v7 - v8) + 40);
    size_t v14 = MEMORY[0x1F4188790]();
    xpc_object_t v11 = (mach_msg_header_t *)((char *)&previous - v15);
    if (v14 <= 0x2000)
    {
      int v12 = 0;
    }
    else
    {
      xpc_object_t v11 = (mach_msg_header_t *)malloc_type_malloc(v14, 0x4EC6FE9BuLL);
      int v10 = *(_DWORD *)(a1 + 20);
      int v12 = 1;
    }
  }
  v11->msgh_bits = *(_DWORD *)a1 & 0x1F;
  unsigned int v16 = *(_DWORD *)(a1 + 8);
  v11->msgh_std::string::size_type size = 36;
  *(void *)&v11->mach_port_t msgh_remote_port = v16;
  v11->msgh_id = v10 + 100;
  if (!v13)
  {
    int v18 = *(_DWORD *)(a1 + 20);
    if (v18 == 71)
    {
      uint64_t v24 = (void (*)(uint64_t, void))*((void *)a4 + 3);
      if (v24) {
        v24(a1, *((void *)a4 + 1));
      }
    }
    else
    {
      if (v18 != 70)
      {
        *(void *)&v11[1].msgh_bits = *MEMORY[0x1E4F14068];
        v11[1].mach_port_t msgh_remote_port = -303;
        goto LABEL_28;
      }
      uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, void))*((void *)a4 + 2);
      if (v19)
      {
        uint64_t v20 = *(unsigned int *)(a1 + 32);
        v32 = *(_DWORD *)(a1 + 32);
        if (*(unsigned __int8 *)(a1 + 28) != *(unsigned __int8 *)(MEMORY[0x1E4F14068] + 4)) {
          uint64_t v20 = bswap32(v32);
        }
        mach_port_mscount_t v21 = v19(v20, a1, *((void *)a4 + 1));
        v32 = v21;
        if (v21)
        {
          previous = 0;
          mach_port_name_t v22 = *a4;
          ipc_space_t v23 = *MEMORY[0x1E4F14960];
          mach_port_request_notification(*MEMORY[0x1E4F14960], v22, 70, v21, v22, 0x15u, &previous);
          if (previous) {
            mach_port_mod_refs(v23, previous, 2u, -1);
          }
        }
        else
        {
          *((void *)a4 + 2) = 0;
        }
      }
    }
    if ((v12 & 1) == 0) {
      return 0;
    }
    goto LABEL_39;
  }
  if ((a4[1] & 2) != 0) {
    *(_DWORD *)(a1 + 12) = *((void *)a4 + 1);
  }
  v13(a1, v11);
  if ((v11->msgh_bits & 0x80000000) != 0) {
    goto LABEL_30;
  }
  mach_port_t msgh_remote_port = v11[1].msgh_remote_port;
  if (!msgh_remote_port) {
    goto LABEL_30;
  }
  if (msgh_remote_port == -305)
  {
    v11->mach_port_t msgh_remote_port = 0;
    goto LABEL_38;
  }
LABEL_28:
  if ((*(_DWORD *)a1 & 0x80000000) != 0)
  {
    *(_DWORD *)(a1 + 8) = 0;
    mach_msg_destroy((mach_msg_header_t *)a1);
  }
LABEL_30:
  if (v11->msgh_remote_port)
  {
    if ((v11->msgh_bits & 0x1F) == 0x12) {
      mach_msg_option_t v25 = 1;
    }
    else {
      mach_msg_option_t v25 = 17;
    }
    uint64_t v26 = mach_msg(v11, v25, v11->msgh_size, 0, 0, 0, 0);
    if ((v26 - 268435459) >= 2)
    {
      if (v26)
      {
        v27 = (FILE *)*MEMORY[0x1E4F143C8];
        int64x2_t v28 = getpid();
        fprintf(v27, "%d: badly generated MIG reply for port %x\n", v28, *a4);
      }
    }
    else
    {
      mach_msg_destroy(v11);
    }
  }
LABEL_38:
  if (v12) {
LABEL_39:
  }
    free(v11);
  return 0;
}

uint64_t CACFArray::GetUInt32(CFArrayRef *this, unsigned int a2, unsigned int *a3)
{
  CFTypeRef cf = 0;
  unsigned int CFType = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFNumberRef v6 = (const __CFNumber *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetDictionary(CFArrayRef *this, unsigned int a2, const __CFDictionary **a3)
{
  CFTypeRef cf = 0;
  unsigned int CFType = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFDictionaryRef v6 = (const __CFDictionary *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFDictionaryGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

const __CFArray *CACFArray::GetCFType(CFArrayRef *this, unsigned int a2, const void **a3)
{
  CFArrayRef result = *this;
  if (result)
  {
    if (CFArrayGetCount(result) <= a2)
    {
      return 0;
    }
    else
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*this, a2);
      *a3 = ValueAtIndex;
      return (const __CFArray *)(ValueAtIndex != 0);
    }
  }
  return result;
}

void XOSTransactor::endTransaction(XOSTransactor *this)
{
  mach_port_name_t v2 = (void *)*((void *)this + 3);
  if (v2)
  {
    os_release(v2);
    *((void *)this + 3) = 0;
  }
}

uint64_t CACFDictionary::GetUInt32(CACFDictionary *this, const __CFString *a2, unsigned int *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFNumberRef v5 = (const __CFNumber *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetString(CACFDictionary *this, const __CFString *a2, const __CFString **a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFStringRef v5 = (const __CFString *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFStringGetTypeID())
      {
        *a3 = v5;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t PropertyMarshaller::Serialize(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5 = a1[3];
  if (a1[5]) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (v6) {
    return 829646194;
  }
  int v12 = (unsigned char *)(*(uint64_t (**)(void *))(*a1 + 16))(a1);
  uint64_t v13 = a1[5];
  a1[5] = v12;
  if (v13)
  {
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
    int v12 = (unsigned char *)a1[5];
  }
  if (v12)
  {
    if (a5 == 1) {
      v12[32] = 1;
    }
    if ((*(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)v12 + 16))(v12, v5, a3, a4)) {
      return 0;
    }
    size_t v14 = *(uint64_t (**)(void *))(*a1 + 32);
    uint64_t v15 = a1;
  }
  else
  {
    size_t v14 = *(uint64_t (**)(void *))(*a1 + 24);
    uint64_t v15 = a1;
  }
  return v14(v15);
}

uint64_t PropertyMarshaller::Deserialize(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5 = a1[4];
  if (a1[5]) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (v6) {
    return 829646194;
  }
  uint64_t v12 = (*(uint64_t (**)(void *))(*a1 + 16))(a1);
  uint64_t v13 = a1[5];
  a1[5] = v12;
  if (v13)
  {
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
    uint64_t v12 = a1[5];
  }
  if (!v12)
  {
    size_t v14 = *(uint64_t (**)(void *))(*a1 + 24);
    uint64_t v15 = a1;
    return v14(v15);
  }
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v12 + 24))(v12, v5, a3, a4))
  {
    size_t v14 = *(uint64_t (**)(void *))(*a1 + 32);
    uint64_t v15 = a1;
    return v14(v15);
  }
  uint64_t result = 0;
  if (!a5) {
    *(void *)(a1[5] + 16) = *(void *)(a1[5] + 8);
  }
  return result;
}

uint64_t PlatformUtilities_iOS::ProductIsMuseDevice(PlatformUtilities_iOS *this)
{
  {
    uint64_t v2 = MGGetBoolAnswer();
    BOOL v4 = (v2 & 1) != 0
      || (ProductType = (PlatformUtilities_iOS *)PlatformUtilities_iOS::GetProductType((PlatformUtilities_iOS *)v2),
          ProductType == 173)
      || PlatformUtilities_iOS::GetProductType(ProductType) == 188;
    PlatformUtilities_iOS::ProductIsMuseDevice(void)::isMuseDevice = v4;
  }
  return PlatformUtilities_iOS::ProductIsMuseDevice(void)::isMuseDevice;
}

void sub_1ABACEBB4(_Unwind_Exception *a1)
{
}

uint64_t CACFDictionary::GetDictionary(CACFDictionary *this, const __CFString *a2, const __CFDictionary **a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFDictionaryRef v5 = (const __CFDictionary *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFDictionaryGetTypeID())
      {
        *a3 = v5;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

void ___ZN12CADeprecated17XMachPortServicer12DispatchImplD2Ev_block_invoke(uint64_t a1)
{
}

atomic_uint *___ZN12CADeprecated15XBasicMIGServer22SetServerDispatchQueueERKN10applesauce8dispatch2v15queueE_block_invoke_9(uint64_t a1)
{
  return CADeprecated::XMachReceivePort::SetMachPort(*(atomic_uint **)(a1 + 32), 0);
}

void __destroy_helper_block_e8_40c37_ZTSN10applesauce8dispatch2v16sourceE(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

void __destroy_helper_block_e8_32c60_ZTSNSt3__110shared_ptrIN12CADeprecated16XMachReceivePortEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

uint64_t ___ZN12CADeprecated22XMachPortDeathListener33SetDeathNotificationDispatchQueueERKN10applesauce8dispatch2v15queueE_block_invoke(uint64_t a1)
{
  return CADeprecated::XMachPortDeathListener::ReadPortDeathMessage(*(CADeprecated::XMachPortDeathListener **)(a1 + 32), *(_DWORD *)(a1 + 40));
}

void swix::connection::description(os_unfair_lock_s **this@<X0>, void *a2@<X8>)
{
  swix::connection::state::xpc_connection(this[1], (swix::detail::connection_impl *)&v7);
  uint8x8_t v3 = v7;
  uint64_t v4 = MEMORY[0x1AD1137F0](v7);
  uint64_t v5 = MEMORY[0x1E4F14578];
  if (v4 == MEMORY[0x1E4F14578])
  {
    CFTypeID v6 = (char *)MEMORY[0x1AD113770](v3);
    std::string::basic_string[abi:ne180100]<0>(a2, v6);
    free(v6);
  }
  xpc_release(v3);
  if (v4 != v5)
  {
    std::string::basic_string[abi:ne180100]<0>(a2, "(destroyed connection)");
  }
}

void sub_1ABACED40(_Unwind_Exception *a1)
{
  xpc_release(v1);
  _Unwind_Resume(a1);
}

void swix::connection::audit_token(os_unfair_lock_s **this@<X0>, uint64_t a2@<X8>)
{
  swix::connection::state::xpc_connection(this[1], (swix::detail::connection_impl *)&v4);
  uint8x8_t v3 = v4;
  if (MEMORY[0x1AD1137F0](v4) == MEMORY[0x1E4F14578])
  {
    xpc_connection_get_audit_token();
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(unsigned char *)(a2 + 32) = 1;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 32) = 0;
  }
  xpc_release(v3);
}

void sub_1ABACEDE0(_Unwind_Exception *a1)
{
  xpc_release(v1);
  _Unwind_Resume(a1);
}

void ___ZN4swix10connection5state11set_handlerEP17_xpc_connection_sU13block_pointerFvPvE_block_invoke(uint64_t a1, uint64_t a2)
{
  uint8x8_t v3 = *(std::__shared_weak_count ***)(*(void *)(a1 + 40) + 168);
  uint64_t v5 = *v3;
  uint64_t v4 = v3[1];
  int v9 = *v3;
  if (!v4 || (int v10 = std::__shared_weak_count::lock(v4)) == 0) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  shared_weak_owners = v5[2].__shared_weak_owners_;
  dispatch_time_t v8 = dispatch_time(0, v5->__shared_weak_owners_);
  dispatch_source_set_timer(shared_weak_owners, v8, 0xFFFFFFFFFFFFFFFFLL, v5->__shared_weak_owners_ >> 6);
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2);
  swix::detail::watchdog_timer::transaction::~transaction(&v9);
}

void sub_1ABACEE9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::__shared_weak_count *a9)
{
}

void swix::detail::watchdog_timer::transaction::~transaction(std::__shared_weak_count **this)
{
  dispatch_source_set_timer((dispatch_source_t)(*this)[2].__shared_weak_owners_, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  uint64_t v2 = this[1];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

void ___ZN4swix12ipc_endpointC2ERKNS_17connection_configERNS_13ipc_interfaceE_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v2 = *(void *)(a1 + 32);
  xpc_object_t objecta = object;
  if (object) {
    xpc_retain(object);
  }
  else {
    xpc_object_t objecta = xpc_null_create();
  }
  swix::ipc_endpoint::handle_event_or_error(v2, &objecta);
  xpc_release(objecta);
}

void swix::ipc_endpoint::handle_event_or_error(uint64_t a1, void *a2)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  xpc_object_t v4 = (xpc_object_t)*a2;
  uint64_t v5 = MEMORY[0x1E4F14590];
  if (*a2 && MEMORY[0x1AD1137F0](*a2) == v5) {
    xpc_retain(v4);
  }
  else {
    xpc_object_t v4 = xpc_null_create();
  }
  if (MEMORY[0x1AD1137F0](v4) == v5)
  {
    v7[0] = v4;
    if (v4)
    {
      xpc_retain(v4);
      xpc_object_t v6 = v4;
    }
    else
    {
      xpc_object_t v6 = xpc_null_create();
      v7[0] = v6;
    }
    swix::ipc_endpoint::handle_event(a1, v7);
    xpc_release(v6);
  }
  else
  {
    swix::ipc_endpoint::handle_error(a1, a2);
  }
  xpc_release(v4);
}

void sub_1ABACF054(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, uint64_t a10)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void swix::ipc_endpoint::handle_event(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 8);
  if (*(unsigned char *)(v4 + 88))
  {
    uint64_t v5 = *(NSObject **)(v4 + 80);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      swix::connection::xpc_connection((os_unfair_lock_s **)a1, (const swix::connection_config *)&object);
      xpc_object_t v6 = object;
      CFTypeID v7 = (char *)MEMORY[0x1AD113770](*a2);
      std::string::basic_string[abi:ne180100]<0>(__p, v7);
      free(v7);
      if (v12 >= 0) {
        dispatch_time_t v8 = __p;
      }
      else {
        dispatch_time_t v8 = (void **)__p[0];
      }
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_1ABAC8000, v5, OS_LOG_TYPE_DEFAULT, "%p received event %s", buf, 0x16u);
      if (v12 < 0) {
        operator delete(__p[0]);
      }
      xpc_release(object);
    }
  }
  xpc_object_t v9 = (xpc_object_t)*a2;
  *(void *)buf = v9;
  uint64_t v10 = MEMORY[0x1E4F14590];
  if (v9 && MEMORY[0x1AD1137F0](v9) == v10)
  {
    xpc_retain(v9);
  }
  else
  {
    xpc_object_t v9 = xpc_null_create();
    *(void *)buf = v9;
  }
  swix::decode_message::decode_message((uint64_t)__p, (xpc_object_t *)buf, *(void *)(*(void *)(a1 + 8) + 80));
  xpc_release(v9);
  (*(void (**)(unsigned char *__return_ptr))(**(void **)(a1 + 56) + 16))(buf);
  if (MEMORY[0x1AD1137F0](*(void *)&buf[8]) == v10) {
    swix::connection::send((os_unfair_lock_s **)a1, (const swix::encode_message *)buf);
  }
  xpc_release(*(xpc_object_t *)&buf[8]);
  xpc_release(__p[1]);
}

void sub_1ABACF358(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t a11, uint64_t a12, uint64_t a13, xpc_object_t object, uint64_t a15, xpc_object_t a16)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t swix::decode_message::decode_message(uint64_t a1, xpc_object_t *a2, uint64_t a3)
{
  xpc_object_t v5 = *a2;
  if (*a2) {
    xpc_retain(*a2);
  }
  else {
    xpc_object_t v5 = xpc_null_create();
  }
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = v5;
  xpc_object_t v6 = xpc_null_create();
  *(void *)(a1 + 16) = 0;
  xpc_release(v6);
  *(void *)(a1 + 24) = a3;
  if (MEMORY[0x1AD1137F0](*(void *)(a1 + 8)) != MEMORY[0x1E4F14590])
  {
    xpc_object_t v9 = *(NSObject **)(a1 + 24);
    std::string::basic_string[abi:ne180100]<0>(&v12, "!(is_valid())");
    swix::decode_message::throw_error(v9, -304, &v12);
  }
  int64_t int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 8), "#");
  if (int64 != (int)int64)
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = &unk_1F03034D0;
  }
  *(_DWORD *)a1 = int64;
  if (!int64)
  {
    xpc_object_t v11 = *(NSObject **)(a1 + 24);
    std::string::basic_string[abi:ne180100]<0>(&v12, "!(mMessageID != 0)");
    swix::decode_message::throw_error(v11, -303, &v12);
  }
  return a1;
}

void sub_1ABACF50C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  swix::message::~message(v15);
  _Unwind_Resume(a1);
}

void swix::connection::send(os_unfair_lock_s **this, const swix::encode_message *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  swix::connection::xpc_connection(this, (const swix::connection_config *)&connection);
  swix::encode_message::xpc_message(a2, &message);
  uint64_t v4 = this[1];
  if (LOBYTE(v4[22]._os_unfair_lock_opaque))
  {
    xpc_object_t v5 = *(NSObject **)&v4[20]._os_unfair_lock_opaque;
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    xpc_object_t v7 = message;
    if (v6)
    {
      xpc_connection_t v8 = connection;
      xpc_object_t v9 = (char *)MEMORY[0x1AD113770](message);
      std::string::basic_string[abi:ne180100]<0>(__p, v9);
      free(v9);
      if (v12 >= 0) {
        uint64_t v10 = __p;
      }
      else {
        uint64_t v10 = (void **)__p[0];
      }
      *(_DWORD *)buf = 134218242;
      xpc_connection_t v16 = v8;
      __int16 v17 = 2080;
      int v18 = v10;
      _os_log_impl(&dword_1ABAC8000, v5, OS_LOG_TYPE_DEFAULT, "%p send msg %s", buf, 0x16u);
      if (v12 < 0) {
        operator delete(__p[0]);
      }
    }
  }
  else
  {
    xpc_object_t v7 = message;
  }
  xpc_connection_send_message(connection, v7);
  xpc_release(v7);
  xpc_release(connection);
}

void sub_1ABACF69C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object)
{
  xpc_release(v14);
  xpc_release(object);
  _Unwind_Resume(a1);
}

void swix::connection::send_and_await_reply(os_unfair_lock_s **this@<X0>, const swix::encode_message *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  swix::connection::xpc_connection(this, (const swix::connection_config *)&connection);
  swix::encode_message::xpc_message(a2, &message);
  BOOL v6 = this[1];
  if (LOBYTE(v6[22]._os_unfair_lock_opaque))
  {
    xpc_object_t v7 = *(NSObject **)&v6[20]._os_unfair_lock_opaque;
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    xpc_object_t v9 = message;
    if (v8)
    {
      xpc_connection_t v10 = connection;
      xpc_object_t v11 = (char *)MEMORY[0x1AD113770](message);
      std::string::basic_string[abi:ne180100]<0>(&v42, v11);
      free(v11);
      char v12 = (v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v42
          : (std::string *)v42.__r_.__value_.__r.__words[0];
      LODWORD(buf.__r_.__value_.__l.__data_) = 134218242;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v10;
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2080;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v12;
      _os_log_impl(&dword_1ABAC8000, v7, OS_LOG_TYPE_DEFAULT, "%p send msg %s", (uint8_t *)&buf, 0x16u);
      if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v42.__r_.__value_.__l.__data_);
      }
    }
  }
  else
  {
    xpc_object_t v9 = message;
  }
  xpc_object_t v13 = xpc_connection_send_message_with_reply_sync(connection, v9);
  xpc_object_t v34 = v13;
  if (!v13)
  {
    xpc_object_t v13 = xpc_null_create();
    xpc_object_t v34 = v13;
  }
  size_t v14 = this[1];
  if (LOBYTE(v14[22]._os_unfair_lock_opaque))
  {
    uint64_t v15 = *(NSObject **)&v14[20]._os_unfair_lock_opaque;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      xpc_connection_t v16 = connection;
      __int16 v17 = (char *)MEMORY[0x1AD113770](v13);
      std::string::basic_string[abi:ne180100]<0>(&v42, v17);
      free(v17);
      int v18 = (v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v42
          : (std::string *)v42.__r_.__value_.__r.__words[0];
      LODWORD(buf.__r_.__value_.__l.__data_) = 134218242;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v16;
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2080;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v18;
      _os_log_impl(&dword_1ABAC8000, v15, OS_LOG_TYPE_DEFAULT, "%p msg reply %s", (uint8_t *)&buf, 0x16u);
      if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v42.__r_.__value_.__l.__data_);
      }
    }
  }
  swix::connection::check_valid_reply((uint64_t)this, &v34);
  v42.__r_.__value_.__r.__words[0] = (std::string::size_type)v13;
  if (v13 && MEMORY[0x1AD1137F0](v13) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v13);
    xpc_object_t v19 = v13;
  }
  else
  {
    xpc_object_t v19 = xpc_null_create();
    v42.__r_.__value_.__r.__words[0] = (std::string::size_type)v19;
  }
  swix::decode_message::decode_message(a3, (xpc_object_t *)&v42.__r_.__value_.__l.__data_, *(void *)&this[1][20]._os_unfair_lock_opaque);
  xpc_release(v19);
  int v20 = *(_DWORD *)a2;
  if (*(_DWORD *)a3 + *(_DWORD *)a2)
  {
    mach_port_mscount_t v21 = *(NSObject **)(a3 + 24);
    std::string::basic_string[abi:ne180100]<0>(&v39, "unexpected message ID (");
    std::to_string(&v38, -v20);
    if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      mach_port_name_t v22 = &v38;
    }
    else {
      mach_port_name_t v22 = (std::string *)v38.__r_.__value_.__r.__words[0];
    }
    if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v38.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v38.__r_.__value_.__l.__size_;
    }
    uint64_t v24 = std::string::append(&v39, (const std::string::value_type *)v22, size);
    long long v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
    v40.__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v40.__r_.__value_.__l.__data_ = v25;
    v24->__r_.__value_.__l.__size_ = 0;
    v24->__r_.__value_.__r.__words[2] = 0;
    v24->__r_.__value_.__r.__words[0] = 0;
    uint64_t v26 = std::string::append(&v40, "/", 1uLL);
    long long v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
    v41.__r_.__value_.__r.__words[2] = v26->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v41.__r_.__value_.__l.__data_ = v27;
    v26->__r_.__value_.__l.__size_ = 0;
    v26->__r_.__value_.__r.__words[2] = 0;
    v26->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v37, *(_DWORD *)a3);
    if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int64x2_t v28 = &v37;
    }
    else {
      int64x2_t v28 = (std::string *)v37.__r_.__value_.__r.__words[0];
    }
    if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v29 = HIBYTE(v37.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v29 = v37.__r_.__value_.__l.__size_;
    }
    uint64_t v30 = std::string::append(&v41, (const std::string::value_type *)v28, v29);
    long long v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
    buf.__r_.__value_.__r.__words[2] = v30->__r_.__value_.__r.__words[2];
    *(_OWORD *)&buf.__r_.__value_.__l.__data_ = v31;
    v30->__r_.__value_.__l.__size_ = 0;
    v30->__r_.__value_.__r.__words[2] = 0;
    v30->__r_.__value_.__r.__words[0] = 0;
    v32 = std::string::append(&buf, ")", 1uLL);
    long long v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
    v42.__r_.__value_.__r.__words[2] = v32->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v33;
    v32->__r_.__value_.__l.__size_ = 0;
    v32->__r_.__value_.__r.__words[2] = 0;
    v32->__r_.__value_.__r.__words[0] = 0;
    swix::decode_message::throw_error(v21, -301, &v42);
  }
  xpc_release(v13);
  xpc_release(message);
  xpc_release(connection);
}

void sub_1ABACFA98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, xpc_object_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42)
{
  if (*(char *)(v44 - 121) < 0) {
    operator delete(*(void **)(v44 - 144));
  }
  if (*(char *)(v44 - 89) < 0) {
    operator delete(*(void **)(v44 - 112));
  }
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a42 < 0) {
    operator delete(a37);
  }
  if (a35 < 0) {
    operator delete(a30);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  swix::decode_message::~decode_message(v42);
  xpc_release(v43);
  xpc_release(object);
  xpc_release(a11);
  _Unwind_Resume(a1);
}

void swix::connection::xpc_connection(os_unfair_lock_s **this@<X0>, const swix::connection_config *a2@<X8>)
{
  swix::connection::state::xpc_connection(this[1], (swix::detail::connection_impl *)&v13);
  xpc_object_t v4 = v13;
  if (MEMORY[0x1AD1137F0](v13) == MEMORY[0x1E4F14578])
  {
    *(void *)a2 = v4;
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t v13 = v4;
  }
  else
  {
    uint64_t v5 = (uint64_t)this[1];
    int v6 = *(unsigned __int8 *)(v5 + 89);
    xpc_object_t v7 = *(NSObject **)(v5 + 80);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (!v6)
    {
      if (v8)
      {
        LOWORD(v10.__r_.__value_.__l.__data_) = 0;
        _os_log_error_impl(&dword_1ABAC8000, v7, OS_LOG_TYPE_ERROR, "null connection", (uint8_t *)&v10, 2u);
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x18uLL);
      std::string::basic_string[abi:ne180100]<0>(&v10, "null connection");
      std::runtime_error::runtime_error(exception, &v10);
      exception->__vftable = (std::runtime_error_vtbl *)&unk_1F03035A0;
      LODWORD(exception[1].__vftable) = -2;
    }
    if (v8)
    {
      LOWORD(v10.__r_.__value_.__l.__data_) = 0;
      _os_log_error_impl(&dword_1ABAC8000, v7, OS_LOG_TYPE_ERROR, "rebuilding null connection", (uint8_t *)&v10, 2u);
      uint64_t v5 = (uint64_t)this[1];
    }
    v10.__r_.__value_.__r.__words[0] = (std::string::size_type)this;
    xpc_object_t v11 = caulk::function_ref<void ()(applesauce::xpc::connection const&)>::functor_invoker<swix::connection::xpc_connection(void)::$_0>;
    char v12 = &v10;
    swix::connection::state::rebuild_connection(v5, a2);
  }
  xpc_release(v4);
}

void sub_1ABACFD78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0)
    {
LABEL_6:
      xpc_release(v14);
      _Unwind_Resume(a1);
    }
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

void swix::connection::state::xpc_connection(os_unfair_lock_s *this@<X0>, swix::detail::connection_impl *a2@<X8>)
{
  xpc_object_t v4 = this + 38;
  os_unfair_lock_lock(this + 38);
  uint64_t v5 = *(void *)&this[40]._os_unfair_lock_opaque;
  if (v5) {
    swix::detail::connection_impl::get(a2, *(void **)(v5 + 16));
  }
  else {
    *(void *)a2 = xpc_null_create();
  }

  os_unfair_lock_unlock(v4);
}

xpc_object_t swix::detail::connection_impl::get(swix::detail::connection_impl *this, void *a2)
{
  *(void *)this = a2;
  if (a2) {
    return xpc_retain(a2);
  }
  xpc_object_t result = xpc_null_create();
  *(void *)this = result;
  return result;
}

xpc_object_t swix::encode_message::xpc_message@<X0>(swix::encode_message *this@<X0>, void *a2@<X8>)
{
  if (*((_DWORD *)this + 1)) {
    xpc_dictionary_set_uint64(*((xpc_object_t *)this + 1), ".optionals", *((void *)this + 2));
  }
  xpc_object_t v4 = (void *)*((void *)this + 1);
  *a2 = v4;
  if (v4) {
    return xpc_retain(v4);
  }
  xpc_object_t result = xpc_null_create();
  *a2 = result;
  return result;
}

void swix::connection::check_valid_reply(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*a2 == MEMORY[0x1E4F14520])
  {
    uint8x8_t v3 = *(NSObject **)(*(void *)(a1 + 8) + 80);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 134217984;
      uint64_t v6 = a1;
      xpc_object_t v4 = "%p reply: XPC_ERROR_CONNECTION_INTERRUPTED";
      goto LABEL_8;
    }
  }
  else if (*a2 == MEMORY[0x1E4F14528])
  {
    uint8x8_t v3 = *(NSObject **)(*(void *)(a1 + 8) + 80);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 134217984;
      uint64_t v6 = a1;
      xpc_object_t v4 = "%p reply: XPC_ERROR_CONNECTION_INVALID";
LABEL_8:
      _os_log_error_impl(&dword_1ABAC8000, v3, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v5, 0xCu);
    }
  }
}

void ___ZN4swix8listenerC2ERKNS_17connection_configE_block_invoke(uint64_t a1, void *a2)
{
}

void sub_1ABACFFFC(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

void swix::listener::handle_connection_event(swix::listener *this, xpc_object_t object)
{
  xpc_object_t v2 = object;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (object)
  {
    xpc_retain(object);
    xpc_object_t v4 = v2;
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
  }
  int v5 = *(NSObject **)(*((void *)this + 1) + 80);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    swix::connection::xpc_connection((os_unfair_lock_s **)this, (const swix::connection_config *)&objecta);
    xpc_object_t v6 = objecta;
    uint64_t v7 = (char *)MEMORY[0x1AD113770](v4);
    std::string::basic_string[abi:ne180100]<0>(__p, v7);
    free(v7);
    if (v13 >= 0) {
      BOOL v8 = __p;
    }
    else {
      BOOL v8 = (void **)__p[0];
    }
    *(_DWORD *)std::string buf = 134218242;
    xpc_object_t v16 = v6;
    __int16 v17 = 2080;
    int v18 = v8;
    _os_log_impl(&dword_1ABAC8000, v5, OS_LOG_TYPE_DEFAULT, "%p connection event %s", buf, 0x16u);
    if (v13 < 0) {
      operator delete(__p[0]);
    }
    xpc_release(objecta);
  }
  uint64_t v9 = MEMORY[0x1E4F14578];
  if (v2)
  {
    xpc_retain(v2);
    __p[0] = v2;
  }
  else
  {
    xpc_object_t v2 = xpc_null_create();
    __p[0] = v2;
    if (!v2)
    {
LABEL_15:
      __p[0] = xpc_null_create();
      goto LABEL_17;
    }
  }
  if (MEMORY[0x1AD1137F0](v2) != v9) {
    goto LABEL_15;
  }
  xpc_retain(v2);
LABEL_17:
  xpc_release(v2);
  if (MEMORY[0x1AD1137F0](__p[0]) == v9)
  {
    if ((*(uint64_t (**)(swix::listener *, void **))(*(void *)this + 24))(this, __p))
    {
      xpc_connection_activate((xpc_connection_t)__p[0]);
    }
    else
    {
      xpc_object_t v11 = *(NSObject **)(*((void *)this + 1) + 80);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_error_impl(&dword_1ABAC8000, v11, OS_LOG_TYPE_ERROR, "rejecting connection", buf, 2u);
      }
      xpc_connection_cancel((xpc_connection_t)__p[0]);
    }
  }
  else
  {
    std::string v10 = *(NSObject **)(*((void *)this + 1) + 80);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_error_impl(&dword_1ABAC8000, v10, OS_LOG_TYPE_ERROR, "object not a connection?", buf, 2u);
    }
  }
  xpc_release(__p[0]);
  xpc_release(v4);
}

void sub_1ABAD029C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

int *swix::encode_message::encode_message(int *a1, uint64_t a2)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a2 + 8));
  if ((reply || (xpc_object_t reply = xpc_null_create()) != 0) && MEMORY[0x1AD1137F0](reply) == MEMORY[0x1E4F14590])
  {
    xpc_retain(reply);
    xpc_object_t v5 = reply;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
  }
  *(void *)a1 = -*(_DWORD *)a2;
  *((void *)a1 + 1) = v5;
  xpc_object_t v6 = xpc_null_create();
  *((void *)a1 + 2) = 0;
  xpc_release(v6);
  xpc_release(reply);
  xpc_dictionary_set_int64(*((xpc_object_t *)a1 + 1), "#", *a1);
  return a1;
}

void sub_1ABAD03BC(_Unwind_Exception *a1)
{
  swix::message::~message(v1);
  _Unwind_Resume(a1);
}

swix::encode_message *swix::encode_message::encode_message(swix::encode_message *this, int a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (!v4)
  {
    xpc_object_t v4 = xpc_null_create();
    if (!v4)
    {
      xpc_object_t v5 = 0;
      goto LABEL_7;
    }
  }
  if (MEMORY[0x1AD1137F0](v4) != MEMORY[0x1E4F14590])
  {
    xpc_object_t v5 = v4;
LABEL_7:
    xpc_object_t v4 = xpc_null_create();
    goto LABEL_8;
  }
  xpc_retain(v4);
  xpc_object_t v5 = v4;
LABEL_8:
  xpc_release(v5);
  *(_DWORD *)this = a2;
  *((_DWORD *)this + 1) = 0;
  *((void *)this + 1) = v4;
  xpc_object_t v6 = xpc_null_create();
  *((void *)this + 2) = 0;
  xpc_release(v6);
  xpc_dictionary_set_int64(*((xpc_object_t *)this + 1), "#", *(int *)this);
  return this;
}

void sub_1ABAD04A4(_Unwind_Exception *a1)
{
  swix::message::~message(v1);
  _Unwind_Resume(a1);
}

CADeprecated::CAGuard *CADeprecated::CAGuard::CAGuard(CADeprecated::CAGuard *this, const char *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint8x8_t v3 = CADeprecated::CAMutex::CAMutex(this, a2);
  *(void *)uint8x8_t v3 = &unk_1F0303380;
  int v4 = pthread_cond_init((pthread_cond_t *)((char *)v3 + 88), 0);
  if (v4)
  {
    int v6 = v4;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      uint64_t v9 = "CAGuard.cpp";
      __int16 v10 = 1024;
      int v11 = 66;
      _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAGuard::CAGuard: Could not init the cond var", (uint8_t *)&v8, 0x12u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_1F0303008;
    exception[2] = v6;
  }
  return this;
}

void sub_1ABAD0600(_Unwind_Exception *a1)
{
  CADeprecated::CAMutex::~CAMutex(v1);
  _Unwind_Resume(a1);
}

CADeprecated::CAMutex *CADeprecated::CAMutex::CAMutex(CADeprecated::CAMutex *this, const char *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  *(void *)this = &unk_1F03033F0;
  *((void *)this + 1) = a2;
  *((void *)this + 2) = 0;
  int v3 = pthread_mutex_init((pthread_mutex_t *)((char *)this + 24), 0);
  if (v3)
  {
    int v5 = v3;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      int v8 = "CAMutex.cpp";
      __int16 v9 = 1024;
      int v10 = 56;
      _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAMutex::CAMutex: Could not init the mutex", (uint8_t *)&v7, 0x12u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_1F0303008;
    exception[2] = v5;
  }
  return this;
}

void CADeprecated::XMachServer::AddMachClient(void *a1, uint64_t a2)
{
  CADeprecated::XMachPortDeathListener::RequestPortDeathNotification((CADeprecated::XMachPortDeathListener *)(a1 + 10), *(_DWORD *)(a2 + 12));
  uint64_t v4 = a1[14];
  xpc_object_t v16 = a1 + 14;
  char v17 = (*(uint64_t (**)(void *))(v4 + 16))(a1 + 14);
  int v6 = (void *)a1[26];
  unint64_t v5 = a1[27];
  if ((unint64_t)v6 >= v5)
  {
    int v8 = (void *)a1[25];
    uint64_t v9 = v6 - v8;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v5 - (void)v8;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      if (v12 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      char v13 = (char *)operator new(8 * v12);
    }
    else
    {
      char v13 = 0;
    }
    size_t v14 = &v13[8 * v9];
    *(void *)size_t v14 = a2;
    int v7 = v14 + 8;
    if (v6 != v8)
    {
      do
      {
        uint64_t v15 = *--v6;
        *((void *)v14 - 1) = v15;
        v14 -= 8;
      }
      while (v6 != v8);
      int v6 = (void *)a1[25];
    }
    a1[25] = v14;
    a1[26] = v7;
    a1[27] = &v13[8 * v12];
    if (v6) {
      operator delete(v6);
    }
  }
  else
  {
    *int v6 = a2;
    int v7 = v6 + 1;
  }
  a1[26] = v7;
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v16);
}

void sub_1ABAD088C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void CADeprecated::XMachPortDeathListener::RequestPortDeathNotification(CADeprecated::XMachPortDeathListener *this, mach_port_name_t a2)
{
  kern_return_t v8;
  kern_return_t v9;
  uint64_t v10;
  mach_port_t v11;
  uint64_t v12;
  mach_port_t previous;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  mach_port_t v21;
  uint64_t v22;

  mach_port_name_t v22 = *MEMORY[0x1E4F143B8];
  if (CADeprecated::XMachPortDeathListener::GetPortDeathCFPort(this))
  {
    previous = 0;
    uint64_t v4 = (ipc_space_t *)MEMORY[0x1E4F14960];
    ipc_space_t v5 = *MEMORY[0x1E4F14960];
    PortDeathCFmach_port_t Port = CADeprecated::XMachPortDeathListener::GetPortDeathCFPort(this);
    mach_port_t Port = CFMachPortGetPort(PortDeathCFPort);
    int v8 = mach_port_request_notification(v5, a2, 72, 1u, Port, 0x15u, &previous);
    if (v8)
    {
      uint64_t v9 = v8;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v10 = (*(uint64_t (**)(CADeprecated::XMachPortDeathListener *))(*(void *)this + 24))(this);
        *(_DWORD *)std::string buf = 136315906;
        uint64_t v15 = "XMachServer.cpp";
        xpc_object_t v16 = 1024;
        char v17 = 103;
        int v18 = 2080;
        uint64_t v19 = v10;
        int v20 = 1024;
        mach_port_mscount_t v21 = v9;
        _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: XMachServer couldn't request port-death notification (0x%x)", buf, 0x22u);
      }
    }
    uint64_t v11 = previous;
    if (previous)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        unint64_t v12 = (*(uint64_t (**)(CADeprecated::XMachPortDeathListener *))(*(void *)this + 24))(this);
        *(_DWORD *)std::string buf = 136315906;
        uint64_t v15 = "XMachServer.cpp";
        xpc_object_t v16 = 1024;
        char v17 = 116;
        int v18 = 2080;
        uint64_t v19 = v12;
        int v20 = 1024;
        mach_port_mscount_t v21 = previous;
        _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%25s:%-5d %s is deallocating notification port (0x%x) because a new notification port has been registered.", buf, 0x22u);
        uint64_t v11 = previous;
      }
      mach_port_deallocate(*v4, v11);
    }
  }
}

CFMachPortRef CADeprecated::XMachPortDeathListener::GetPortDeathCFPort(CADeprecated::XMachPortDeathListener *this)
{
  CFMachPortRef result = (CFMachPortRef)*((void *)this + 2);
  if (!result)
  {
    Boolean shouldFreeInfo = 0;
    v3.version = 0;
    v3.info = this;
    memset(&v3.retain, 0, 24);
    CFMachPortRef result = CFMachPortCreate(0, (CFMachPortCallBack)CADeprecated::XMachPortDeathListener::PortDeathListenerProc, &v3, &shouldFreeInfo);
    *((void *)this + 2) = result;
  }
  return result;
}

void CADeprecated::CAMutex::~CAMutex(CADeprecated::CAMutex *this)
{
  *(void *)this = &unk_1F03033F0;
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 24));
}

{
  uint64_t vars8;

  CADeprecated::CAMutex::~CAMutex(this);

  JUMPOUT(0x1AD112B70);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<OpaqueObjectMgrInstance(void)::$_0 &&>>()
{
}

void sub_1ABAD0B94(_Unwind_Exception *a1)
{
  MEMORY[0x1AD112B70](v1, 0x1020C400FEAF0FDLL);
  _Unwind_Resume(a1);
}

void OpaqueObjectMgr::OpaqueObjectMgr(OpaqueObjectMgr *this)
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F03035F0;
  v2[3] = v2;
  *((void *)this + 3) = this;
  std::__function::__func<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0,std::allocator<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0>,unsigned int ()>::__clone((uint64_t)v2, this);
  *((_DWORD *)this + 8) = 0;
  *((void *)this + 5) = 0;
  *((_DWORD *)this + 12) = 0;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  *((void *)this + 1CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 850045863;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 12CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 0u;
  *((void *)this + 17) = 0;
  std::__function::__value_func<unsigned int ()>::~__value_func[abi:ne180100](v2);
  *((_DWORD *)this + 36) = 0;
  atomic_store((getpid() & 0x3FFFF) << 12, (unsigned int *)this + 36);
}

void sub_1ABAD0C90(_Unwind_Exception *a1)
{
  caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::~guarded_lookup_hash_table(v1);
  _Unwind_Resume(a1);
}

void *std::__function::__value_func<unsigned int ()(unsigned int)>::~__value_func[abi:ne180100](void *a1)
{
  xpc_object_t v2 = (void *)a1[3];
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

void std::__function::__func<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0,std::allocator<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0>,unsigned int ()(unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_1F03035F0;
}

uint64_t CADeprecated::CAGuard::NotifyAll(CADeprecated::CAGuard *this)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t result = pthread_cond_broadcast((pthread_cond_t *)((char *)this + 88));
  if (result)
  {
    int v3 = result;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 136315394;
      ipc_space_t v5 = "CAGuard.cpp";
      __int16 v6 = 1024;
      int v7 = 320;
      _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAGuard::NotifyAll: failed", buf, 0x12u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_1F0303008;
    exception[2] = v3;
  }
  return result;
}

uint64_t SharableMemoryBlock::InitServer(uint64_t a1, size_t a2, _DWORD *a3)
{
  address[8] = *MEMORY[0x1E4F143B8];
  (*(void (**)(uint64_t))(*(void *)a1 + 16))(a1);
  int v6 = a3[2];
  if (v6 == 2)
  {
    unsigned int v12 = atomic_fetch_add_explicit(&SharableMemoryBlock::InitServer(unsigned long,SharableMemoryBlock::ServerToken &)::gBufSerialNum, 1u, memory_order_relaxed)+ 1;
    *(_DWORD *)(a1 + 4CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = v12;
    pid_t v13 = getpid();
    snprintf((char *)address, 0x40uLL, "AppleABL.%x.%x", v13, v12);
    int v14 = shm_open((const char *)address, 514, 511);
    *(_DWORD *)(a1 + 36) = v14;
    if (v14 == -1)
    {
      LogPosixError("shm_open");
      return *__error();
    }
    ftruncate(v14, a2);
    *(void *)(a1 + 16) = a2;
    uint64_t v15 = mmap(0, a2, 3, 1, *(_DWORD *)(a1 + 36), 0);
    *(void *)(a1 + 24) = v15;
    if ((unint64_t)v15 + 1 <= 1)
    {
      uint64_t memory_entry_64 = *__error();
      LogPosixError("mmap");
      close(*(_DWORD *)(a1 + 36));
      *(_DWORD *)(a1 + 36) = -1;
      shm_unlink((const char *)address);
      return memory_entry_64;
    }
    uint64_t memory_entry_64 = 0;
    *(_WORD *)(a1 + 8) = 257;
    a3[3] = *(void *)(a1 + 16);
    int v17 = *(_DWORD *)(a1 + 36);
LABEL_22:
    a3[4] = v17;
    return memory_entry_64;
  }
  if (v6 == 1)
  {
    *(void *)(a1 + 16) = a2;
    xpc_object_t v16 = mmap(0, a2, 3, 4097, -1, 0);
    *(void *)(a1 + 24) = v16;
    if ((unint64_t)v16 + 1 <= 1)
    {
      uint64_t memory_entry_64 = *__error();
      LogPosixError("mmap");
      return memory_entry_64;
    }
    *(_WORD *)(a1 + 8) = 257;
    xpc_object_t v19 = xpc_shmem_create(v16, *(void *)(a1 + 16));
    if (!v19) {
      xpc_object_t v19 = xpc_null_create();
    }
    int v20 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v19;
    xpc_release(v20);
    a3[3] = *(void *)(a1 + 16);
    xpc_object_t v21 = *(xpc_object_t *)(a1 + 48);
    if (v21) {
      xpc_retain(v21);
    }
    else {
      xpc_object_t v21 = xpc_null_create();
    }
    mach_port_name_t v22 = (void *)*((void *)a3 + 2);
    *((void *)a3 + 2) = v21;
    xpc_release(v22);
    return 0;
  }
  if (v6) {
    return 0;
  }
  uint64_t v7 = a2 + *MEMORY[0x1E4F14B00] - 1;
  uint64_t v8 = -*MEMORY[0x1E4F14B00];
  address[0] = 0;
  memory_object_size_t v9 = v7 & v8;
  if ((v7 & v8) == 0)
  {
    int v17 = 0;
    vm_address_t v18 = 0;
    *(_DWORD *)(a1 + 32) = 0;
LABEL_13:
    uint64_t memory_entry_64 = 0;
    *(_WORD *)(a1 + 8) = 257;
    *(void *)(a1 + 16) = v9;
    *(void *)(a1 + 24) = v18;
    a3[3] = v9;
    goto LABEL_22;
  }
  unint64_t v10 = (vm_map_t *)MEMORY[0x1E4F14960];
  uint64_t memory_entry_64 = vm_allocate(*MEMORY[0x1E4F14960], address, v7 & v8, 1);
  if (!memory_entry_64)
  {
    memory_object_size_t size = v9;
    uint64_t memory_entry_64 = mach_make_memory_entry_64(*v10, &size, address[0], 3, (mach_port_t *)(a1 + 32), 0);
    if (memory_entry_64)
    {
      MEMORY[0x1AD113660](*v10, address[0], v9);
      LogMachError("mach_make_memory_entry_64", memory_entry_64);
      return memory_entry_64;
    }
    ++debugSerial;
    vm_address_t v18 = address[0];
    *(_DWORD *)address[0] = debugSerial;
    int v17 = *(_DWORD *)(a1 + 32);
    goto LABEL_13;
  }
  LogMachError("vm_allocate", memory_entry_64);
  return memory_entry_64;
}

void sub_1ABAD1184(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t SharableMemoryBlock::InitClient(uint64_t a1, _DWORD *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  (*(void (**)(uint64_t))(*(void *)a1 + 16))(a1);
  int v4 = a2[2];
  if (v4 == 2)
  {
    int v10 = a2[4];
    *(_DWORD *)(a1 + 36) = v10;
    a2[4] = -1;
    size_t v11 = a2[3];
    *(void *)(a1 + 16) = v11;
    unsigned int v12 = mmap(0, v11, 3, 1, v10, 0);
    *(void *)(a1 + 24) = v12;
    if ((unint64_t)v12 + 1 < 2)
    {
      uint64_t v8 = *__error();
      LogPosixError("mmap");
      close(*(_DWORD *)(a1 + 36));
      *(_DWORD *)(a1 + 36) = -1;
      return v8;
    }
    goto LABEL_13;
  }
  if (v4 != 1)
  {
    if (v4) {
      return 0;
    }
    *(void *)address = 0;
    mem_entry_name_port_t v5 = a2[4];
    vm_size_t v6 = (*MEMORY[0x1E4F14B00] + a2[3] - 1) & -*MEMORY[0x1E4F14B00];
    *(_DWORD *)(a1 + 32) = v5;
    a2[4] = 0;
    uint64_t v7 = (ipc_space_t *)MEMORY[0x1E4F14960];
    uint64_t v8 = vm_map(*MEMORY[0x1E4F14960], (vm_address_t *)address, v6, 0xFuLL, 1, v5, 0, 0, 3, 3, 1u);
    if (v8)
    {
      mach_port_deallocate(*v7, *(_DWORD *)(a1 + 32));
      *(_DWORD *)(a1 + 32) = 0;
      LogMachError("vm_map", v8);
    }
    else
    {
      *(_WORD *)(a1 + 8) = 256;
      uint64_t v17 = *(void *)address;
      *(void *)(a1 + 16) = v6;
      *(void *)(a1 + 24) = v17;
    }
    return v8;
  }
  xpc_object_t v9 = (xpc_object_t)*((void *)a2 + 2);
  if (v9) {
    xpc_retain(*((xpc_object_t *)a2 + 2));
  }
  else {
    xpc_object_t v9 = xpc_null_create();
  }
  pid_t v13 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v9;
  xpc_release(v13);
  xpc_object_t v14 = xpc_null_create();
  uint64_t v15 = (void *)*((void *)a2 + 2);
  *((void *)a2 + 2) = v14;
  xpc_release(v15);
  size_t v16 = xpc_shmem_map(*(xpc_object_t *)(a1 + 48), (void **)(a1 + 24));
  *(void *)(a1 + 16) = v16;
  if (v16)
  {
LABEL_13:
    uint64_t v8 = 0;
    *(_WORD *)(a1 + 8) = 256;
    return v8;
  }
  xpc_object_t v18 = xpc_null_create();
  xpc_object_t v19 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v18;
  xpc_release(v19);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)address = 136315394;
    *(void *)&address[4] = "SharableMemory.cpp";
    __int16 v22 = 1024;
    int v23 = 211;
    _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d xpc_shmem_map failed", address, 0x12u);
  }
  return 0xFFFFFFFFLL;
}

void sub_1ABAD1430(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void SharableMemoryBlock::Free(SharableMemoryBlock *this)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*((void *)this + 3))
  {
    if (*((unsigned char *)this + 9))
    {
      if (*((_DWORD *)this + 8))
      {
        xpc_object_t v2 = (ipc_space_t *)MEMORY[0x1E4F14960];
        uint64_t v3 = MEMORY[0x1AD113660](*MEMORY[0x1E4F14960]);
        if (v3) {
          LogMachError("vm_deallocate", v3);
        }
        mach_port_name_t v4 = *((_DWORD *)this + 8);
        if (v4)
        {
          uint64_t v5 = mach_port_deallocate(*v2, v4);
          if (v5) {
            LogMachError("mach_port_deallocate", v5);
          }
        }
        *((unsigned char *)this + 9) = 0;
        *((_DWORD *)this + 8) = 0;
      }
      else if (MEMORY[0x1AD1137F0](*((void *)this + 6)) == MEMORY[0x1E4F145D8])
      {
        if (*((_DWORD *)this + 9) != -1)
        {
          if (munmap(*((void **)this + 3), *((void *)this + 2))) {
            LogPosixError("munmap");
          }
          if (close(*((_DWORD *)this + 9))) {
            LogPosixError("close");
          }
          if (*((unsigned char *)this + 8))
          {
            int v8 = *((_DWORD *)this + 10);
            pid_t v9 = getpid();
            snprintf(__str, 0x40uLL, "AppleABL.%x.%x", v9, v8);
            if (shm_unlink(__str)) {
              LogPosixError("shm_unlink");
            }
          }
          *((_DWORD *)this + 9) = -1;
        }
      }
      else
      {
        xpc_object_t v6 = xpc_null_create();
        uint64_t v7 = (void *)*((void *)this + 6);
        *((void *)this + 6) = v6;
        xpc_release(v7);
        if (munmap(*((void **)this + 3), *((void *)this + 2))) {
          LogPosixError("munmap");
        }
      }
    }
    else if (*((unsigned char *)this + 8))
    {
      free(*((void **)this + 3));
    }
  }
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
}

void sub_1ABAD1610(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t operator>>(uint64_t a1, CFDataRef *a2)
{
  Ptr = (unsigned int *)CADeserializer::GetAndAdvanceReadPtr((CADeserializer *)a1, 4u, 4);
  if (Ptr)
  {
    unsigned int v5 = *Ptr;
    if ((*Ptr & 0x80000000) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    unsigned int v5 = 0;
  }
  if (!*(unsigned char *)(a1 + 32))
  {
    int v8 = *(const UInt8 **)(a1 + 16);
    if (*(void *)(a1 + 24) - (void)v8 < (uint64_t)v5)
    {
      CFDataRef v6 = 0;
      *(unsigned char *)(a1 + 32) = 1;
      goto LABEL_7;
    }
    *(void *)(a1 + 16) = &v8[v5];
    if (v8)
    {
      CFDataRef v6 = CFDataCreate(0, v8, v5);
      goto LABEL_7;
    }
  }
LABEL_6:
  CFDataRef v6 = 0;
LABEL_7:
  *a2 = v6;
  return a1;
}

BOOL CADeprecated::CAGuard::WaitFor(CADeprecated::CAGuard *this, unint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  mach_port_name_t v4 = pthread_self();
  unsigned int v5 = (_opaque_pthread_t *)atomic_load((unint64_t *)this + 2);
  if (!pthread_equal(v4, v5))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 136315394;
      xpc_object_t v14 = "CAGuard.cpp";
      __int16 v15 = 1024;
      int v16 = 130;
      _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAGuard::WaitFor: A thread has to have locked a guard be for it can wait", buf, 0x12u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_1F0303008;
    exception[2] = 1;
LABEL_14:
  }
  if (a2 <= 0x3B9AC9FF)
  {
    __darwin_time_t v6 = 0;
  }
  else
  {
    __darwin_time_t v6 = a2 / 0x3B9ACA00;
    a2 %= 0x3B9ACA00uLL;
  }
  v12.tv_sec = v6;
  v12.tv_nsec = a2;
  uint64_t v7 = (unint64_t *)((char *)this + 16);
  atomic_store(0, (unint64_t *)this + 2);
  int v8 = pthread_cond_timedwait_relative_np((pthread_cond_t *)((char *)this + 88), (pthread_mutex_t *)((char *)this + 24), &v12);
  int v9 = v8;
  if (v8 && v8 != 60)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 136315394;
      xpc_object_t v14 = "CAGuard.cpp";
      __int16 v15 = 1024;
      int v16 = 169;
      _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAGuard::WaitFor: Wait got an error", buf, 0x12u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_1F0303008;
    exception[2] = v9;
    goto LABEL_14;
  }
  atomic_store((unint64_t)pthread_self(), v7);
  return v9 == 60;
}

void CADeprecated::XMachPortSendRight::~XMachPortSendRight(mach_port_name_t *this)
{
  if (*this) {
    mach_port_deallocate(*MEMORY[0x1E4F14960], *this);
  }
}

void XPC_Connection::Initialize(XPC_Connection *this)
{
  xpc_object_t v2 = (_xpc_connection_s *)*((void *)this + 1);
  if (v2)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 0x40000000;
    handler[2] = ___ZN14XPC_Connection10InitializeEv_block_invoke;
    handler[3] = &__block_descriptor_tmp_314;
    handler[4] = this;
    xpc_connection_set_event_handler(v2, handler);
    xpc_connection_set_context(*((xpc_connection_t *)this + 1), this);
  }
}

void SharableMemoryBlock::XPCServerToken::~XPCServerToken(xpc_object_t *this)
{
  *this = &unk_1F0303488;
  xpc_release(this[2]);
  this[2] = 0;
}

{
  uint64_t vars8;

  SharableMemoryBlock::XPCServerToken::~XPCServerToken(this);

  JUMPOUT(0x1AD112B70);
}

void SharableMemoryBlock::XPCClientToken::~XPCClientToken(xpc_object_t *this)
{
  *this = &unk_1F0303460;
  xpc_release(this[2]);
  this[2] = 0;
}

{
  uint64_t vars8;

  SharableMemoryBlock::XPCClientToken::~XPCClientToken(this);

  JUMPOUT(0x1AD112B70);
}

void swix::ipc_interface::~ipc_interface(swix::ipc_interface *this)
{
  uint64_t v2 = *((void *)this + 1);
  *(void *)this = &unk_1F0303548;
  *((void *)this + 1) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
}

void swix::ipc_endpoint::~ipc_endpoint(swix::ipc_endpoint *this)
{
  *(void *)this = &unk_1F0303520;
  std::__function::__value_func<void ()(swix::ipc_endpoint &,applesauce::xpc::object const&)>::~__value_func[abi:ne180100]((void *)this + 3);
  *(void *)this = &unk_1F03034F8;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  JUMPOUT(0x1AD112B70);
}

{
  std::__shared_weak_count *v2;

  *(void *)this = &unk_1F0303520;
  std::__function::__value_func<void ()(swix::ipc_endpoint &,applesauce::xpc::object const&)>::~__value_func[abi:ne180100]((void *)this + 3);
  *(void *)this = &unk_1F03034F8;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

void *std::__function::__value_func<void ()(swix::ipc_endpoint &,applesauce::xpc::object const&)>::~__value_func[abi:ne180100](void *a1)
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

uint64_t CACFDictionary::GetFloat32(CACFDictionary *this, const __CFString *a2, float *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFNumberRef v5 = (const __CFNumber *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberFloat32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CADeprecated::XMachPortDeathListener::ReadPortDeathMessage(CADeprecated::XMachPortDeathListener *this, mach_port_name_t rcv_name)
{
  msg.not_header.msgh_bits = 0;
  msg.not_header.mach_port_t msgh_remote_port = 0;
  msg.not_header.msgh_local_port = rcv_name;
  *(void *)&msg.not_header.msgh_voucher_port = 0;
  mach_msg(&msg.not_header, 2, 0, 0x38u, rcv_name, 0, 0);
  return CADeprecated::XMachPortDeathListener::DispatchPortDeathMessage((uint64_t)this, &msg);
}

uint64_t CADeprecated::XMachPortDeathListener::DispatchPortDeathMessage(uint64_t this, const mach_dead_name_notification_t *a2)
{
  if (a2->not_header.msgh_id == 72)
  {
    uint64_t v2 = this;
    uint64_t not_port = a2->not_port;
    mach_port_deallocate(*MEMORY[0x1E4F14960], a2->not_port);
    mach_port_name_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)v2 + 16);
    return v4(v2, not_port);
  }
  return this;
}

void CADeprecated::XMachPortServicer::DispatchImpl::~DispatchImpl(CADeprecated::XMachPortServicer::DispatchImpl *this)
{
  CADeprecated::XMachPortServicer::DispatchImpl::~DispatchImpl(this);

  JUMPOUT(0x1AD112B70);
}

{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  void block[5];

  *(void *)this = &unk_1F03032F8;
  uint64_t v2 = *((void *)this + 1);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZN12CADeprecated17XMachPortServicer12DispatchImplD2Ev_block_invoke;
  block[3] = &__block_descriptor_tmp_7;
  block[4] = this;
  dispatch_barrier_sync(v2, block);
  uint64_t v3 = *((void *)this + 2);
  if (v3) {
    dispatch_release(v3);
  }
  mach_port_name_t v4 = *((void *)this + 1);
  if (v4) {
    dispatch_release(v4);
  }
}

os_log_t *swix::detail::connection_impl::connection_impl(swix::connection_config const&,applesauce::xpc::connection const&)::{lambda(void *)#1}::__invoke(os_log_t *result)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *result;
    if (os_log_type_enabled(*result, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      CFNumberRef v5 = v1;
      _os_log_impl(&dword_1ABAC8000, v2, OS_LOG_TYPE_DEFAULT, "destructor connimpl %p", (uint8_t *)&v4, 0xCu);
    }
    xpc_release(v1[2]);
    v1[2] = 0;
    uint64_t v3 = v1[1];
    if (v3) {
      dispatch_release(v3);
    }
    JUMPOUT(0x1AD112B70);
  }
  return result;
}

void sub_1ABAD1EF0(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

CFDictionaryRef CACFPreferences::CopyMultipleValues(CACFPreferences *this, const __CFArray *a2, int a3)
{
  int v4 = (int)a2;
  CACFPreferences::Synchronize(a2, a3, 0);
  uint64_t v6 = (const __CFString **)MEMORY[0x1E4F1D3F0];
  if (!v4) {
    uint64_t v6 = (const __CFString **)MEMORY[0x1E4F1D3D0];
  }
  CFStringRef v7 = *v6;
  int v8 = (const __CFString **)MEMORY[0x1E4F1D3E0];
  if (!a3) {
    int v8 = (const __CFString **)MEMORY[0x1E4F1D3C8];
  }
  CFStringRef v9 = *v8;
  CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1D3B8];

  return CFPreferencesCopyMultiple(this, v10, v7, v9);
}

uint64_t CACFPreferences::Synchronize(CACFPreferences *this, int a2, char a3)
{
  int v4 = (int)this;
  if ((a3 & 1) != 0 || (uint64_t result = CACFPreferences::ArePrefsOutOfDate(this, a2), result))
  {
    uint64_t v6 = (const __CFString **)MEMORY[0x1E4F1D3F0];
    if (!v4) {
      uint64_t v6 = (const __CFString **)MEMORY[0x1E4F1D3D0];
    }
    CFStringRef v7 = *v6;
    int v8 = (CFStringRef *)MEMORY[0x1E4F1D3E0];
    if (!a2) {
      int v8 = (CFStringRef *)MEMORY[0x1E4F1D3C8];
    }
    uint64_t result = CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E4F1D3B8], v7, *v8);
    if ((v4 & 1) != 0 || a2)
    {
      if (((a2 ^ 1) & 1) != 0 || v4)
      {
        if (((v4 ^ 1) & 1) != 0 || a2)
        {
          if ((v4 ^ 1 | a2 ^ 1)) {
            return result;
          }
          CFStringRef v9 = &CACFPreferences::sCurrentUserCurrentHostPrefsOutOfDate;
        }
        else
        {
          CFStringRef v9 = &CACFPreferences::sCurrentUserAnyHostPrefsOutOfDate;
        }
      }
      else
      {
        CFStringRef v9 = &CACFPreferences::sAnyUserCurrentHostPrefsOutOfDate;
      }
    }
    else
    {
      CFStringRef v9 = &CACFPreferences::sAnyUserAnyHostPrefsOutOfDate;
    }
    *CFStringRef v9 = 0;
  }
  return result;
}

BOOL CACFPreferences::ArePrefsOutOfDate(CACFPreferences *this, int a2)
{
  if (this & 1) != 0 || (a2)
  {
    if ((a2 ^ 1) & 1) != 0 || (this)
    {
      if ((this ^ 1) & 1) != 0 || (a2)
      {
        if ((this ^ 1 | a2 ^ 1)) {
          return 0;
        }
        int v2 = CACFPreferences::sCurrentUserCurrentHostPrefsOutOfDate;
      }
      else
      {
        int v2 = CACFPreferences::sCurrentUserAnyHostPrefsOutOfDate;
      }
    }
    else
    {
      int v2 = CACFPreferences::sAnyUserCurrentHostPrefsOutOfDate;
    }
  }
  else
  {
    int v2 = CACFPreferences::sAnyUserAnyHostPrefsOutOfDate;
  }
  return v2 != 0;
}

uint64_t CACFPreferencesGetAppIntegerValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  CFStringRef v4 = (const __CFString *)CFPreferencesCopyAppValue(a1, a2);
  CFStringRef v6 = v4;
  if (a3) {
    CFStringRef v7 = a3;
  }
  else {
    CFStringRef v7 = (BOOL *)&v10;
  }
  uint64_t v8 = CASmartPreferences::InterpretInteger(v4, v7, v5);
  if (v6) {
    CFRelease(v6);
  }
  return v8;
}

uint64_t CASmartPreferences::InterpretInteger(const __CFString *this, unsigned char *a2, BOOL *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int valuePtr = 0;
  *a2 = 0;
  if (this)
  {
    CFTypeID v5 = CFGetTypeID(this);
    if (v5 == CFBooleanGetTypeID())
    {
      int valuePtr = CFBooleanGetValue((CFBooleanRef)this);
LABEL_6:
      *a2 = 1;
      return valuePtr;
    }
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)this, kCFNumberIntType, &valuePtr);
      goto LABEL_6;
    }
    if (v5 == CFStringGetTypeID())
    {
      CFStringGetCString(this, buffer, 64, 0x600u);
      if (sscanf(buffer, "%d", &valuePtr) == 1) {
        goto LABEL_6;
      }
    }
  }
  return valuePtr;
}

uint64_t SincKernelFactory::ReferenceSincKernel(SincKernelFactory *this, int a2, int a3, double a4, double a5)
{
  uint64_t v5 = *((void *)this + 1) - *(void *)this;
  if (!v5) {
LABEL_8:
  }
    operator new();
  uint64_t v6 = 0;
  unint64_t v7 = v5 >> 3;
  unsigned int v8 = 1;
  while (1)
  {
    uint64_t v9 = *(void *)(*(void *)this + 8 * v6);
    if (*(double *)(v9 + 32) == a5
      && *(double *)(v9 + 24) == a4
      && *(_DWORD *)(v9 + 12) == a2
      && *(_DWORD *)(v9 + 16) == a3)
    {
      break;
    }
    uint64_t v6 = v8;
    if (v7 <= v8++) {
      goto LABEL_8;
    }
  }
  ++*(_DWORD *)(v9 + 8);
  return v9;
}

void sub_1ABAD23E8(_Unwind_Exception *a1)
{
  MEMORY[0x1AD112B70](v1, 0x1080C4003DAF236);
  _Unwind_Resume(a1);
}

void SincKernel::SincKernel(SincKernel *this, int a2, int a3, double a4, double a5)
{
  *(void *)this = 0;
  *((_DWORD *)this + 2) = 0;
  *((_DWORD *)this + 3) = a2;
  *((_DWORD *)this + 4) = a3;
  *((_DWORD *)this + 5) = 0;
  *((double *)this + 3) = a4;
  *((double *)this + 4) = a5;
  *(void *)this = malloc_type_calloc(a2 + a2 * a3, 4uLL, 0x100004052888210uLL);
  SincKernel::CalculateFilterCoefficients(this);
}

void SincKernel::CalculateFilterCoefficients(SincKernel *this)
{
}

uint64_t GetKaiser(int a1, double a2)
{
  {
    GetKaiser(unsigned int,double)::sKaiserWindows = 0;
    qword_1EB3D3B78 = 0;
    xmmword_1EB3D3B68 = 0uLL;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&GetKaiser(unsigned int,double)::sKaiserWindows);
  uint64_t v4 = *((void *)&xmmword_1EB3D3B68 + 1);
  if ((void)xmmword_1EB3D3B68 == *((void *)&xmmword_1EB3D3B68 + 1))
  {
LABEL_7:
    if (*((void *)&xmmword_1EB3D3B68 + 1) >= (unint64_t)qword_1EB3D3B78)
    {
      unint64_t v7 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)&xmmword_1EB3D3B68 + 1) - xmmword_1EB3D3B68) >> 3);
      if (v7 + 1 > 0x666666666666666) {
        std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v8 = 0x999999999999999ALL * ((qword_1EB3D3B78 - (uint64_t)xmmword_1EB3D3B68) >> 3);
      if (v8 <= v7 + 1) {
        unint64_t v8 = v7 + 1;
      }
      if (0xCCCCCCCCCCCCCCCDLL * ((qword_1EB3D3B78 - (uint64_t)xmmword_1EB3D3B68) >> 3) >= 0x333333333333333) {
        unint64_t v9 = 0x666666666666666;
      }
      else {
        unint64_t v9 = v8;
      }
      std::string::size_type v29 = &qword_1EB3D3B78;
      if (v9)
      {
        if (v9 > 0x666666666666666) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        char v10 = (char *)operator new(40 * v9);
      }
      else
      {
        char v10 = 0;
      }
      long long v27 = v10;
      *(void *)int64x2_t v28 = &v10[40 * v7];
      *(void *)&v28[16] = &v10[40 * v9];
      KaiserWindow::KaiserWindow(*(KaiserWindow **)v28, a1, a2);
      uint64_t v12 = *(void *)v28;
      *(void *)&v28[8] = *(void *)v28 + 40;
      uint64_t v13 = *((void *)&xmmword_1EB3D3B68 + 1);
      uint64_t v14 = xmmword_1EB3D3B68;
      *(void *)&long long v33 = *(void *)v28;
      *((void *)&v33 + 1) = *(void *)v28;
      long long v32 = v33;
      v30[0] = &qword_1EB3D3B78;
      v30[1] = &v32;
      v30[2] = &v33;
      char v31 = 0;
      while (v13 != v14)
      {
        long long v15 = *(_OWORD *)(v13 - 40);
        *(void *)(v12 - 24) = 0;
        uint64_t v16 = v12 - 24;
        *(_OWORD *)(v12 - 4CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = v15;
        *(void *)(v16 + 8) = 0;
        *(void *)(v16 + 16) = 0;
        xpc_object_t v18 = *(unsigned char **)(v13 - 24);
        uint64_t v17 = *(unsigned char **)(v13 - 16);
        int64_t v19 = v17 - v18;
        if (v17 != v18)
        {
          std::vector<float>::__vallocate[abi:ne180100]((void *)(v12 - 24), v19 >> 2);
          int v20 = *(char **)(v12 - 16);
          memmove(v20, v18, v19);
          *(void *)(v12 - 16) = &v20[4 * (v19 >> 2)];
        }
        v13 -= 40;
        uint64_t v12 = *((void *)&v33 + 1) - 40;
        *((void *)&v33 + 1) -= 40;
      }
      char v31 = 1;
      std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<KaiserWindow>,std::reverse_iterator<KaiserWindow*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v30);
      uint64_t v21 = qword_1EB3D3B78;
      long long v22 = *(_OWORD *)&v28[8];
      uint64_t v26 = *(void *)&v28[8];
      long long v23 = xmmword_1EB3D3B68;
      *(void *)&xmmword_1EB3D3B68 = v12;
      *(_OWORD *)int64x2_t v28 = v23;
      *(long long *)((char *)&xmmword_1EB3D3B68 + 8) = v22;
      *(void *)&v28[16] = v21;
      long long v27 = (char *)v23;
      std::__split_buffer<KaiserWindow>::~__split_buffer((uint64_t)&v27);
      uint64_t v6 = v26;
    }
    else
    {
      KaiserWindow::KaiserWindow(*((KaiserWindow **)&xmmword_1EB3D3B68 + 1), a1, a2);
      uint64_t v6 = v4 + 40;
      *((void *)&xmmword_1EB3D3B68 + 1) = v4 + 40;
    }
    *((void *)&xmmword_1EB3D3B68 + 1) = v6;
    uint64_t v11 = (uint64_t *)(v6 - 24);
  }
  else
  {
    uint64_t v5 = xmmword_1EB3D3B68;
    while (*(_DWORD *)v5 != a1 || *(double *)(v5 + 8) != a2)
    {
      v5 += 40;
      if (v5 == *((void *)&xmmword_1EB3D3B68 + 1)) {
        goto LABEL_7;
      }
    }
    uint64_t v11 = (uint64_t *)(v5 + 16);
  }
  uint64_t v24 = *v11;
  os_unfair_lock_unlock((os_unfair_lock_t)&GetKaiser(unsigned int,double)::sKaiserWindows);
  return v24;
}

void sub_1ABAD2968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::__split_buffer<KaiserWindow>::~__split_buffer((uint64_t)va);
  os_unfair_lock_unlock((os_unfair_lock_t)&GetKaiser(unsigned int,double)::sKaiserWindows);
  _Unwind_Resume(a1);
}

void *SincKernelFactory::ReleaseSincKernel(void *result, uint64_t a2)
{
  if (a2)
  {
    int v3 = *(_DWORD *)(a2 + 8) - 1;
    *(_DWORD *)(a2 + 8) = v3;
    if (!v3)
    {
      uint64_t v4 = result;
      uint64_t v6 = *result;
      uint64_t v5 = result[1];
      if (v5 != *result)
      {
        uint64_t v7 = 0;
        unsigned int v8 = 1;
        do
        {
          if (*(void *)(v6 + 8 * v7) == a2)
          {
            uint64_t v10 = v6 + 8 * v7;
            uint64_t v11 = v5 - (v10 + 8);
            if (v5 != v10 + 8) {
              memmove((void *)(v6 + 8 * v7), (const void *)(v10 + 8), v5 - (v10 + 8));
            }
            v4[1] = v10 + v11;
            free(*(void **)a2);
            JUMPOUT(0x1AD112B70);
          }
          uint64_t v7 = v8;
        }
        while ((v5 - *result) >> 3 > (unint64_t)v8++);
      }
    }
  }
  return result;
}

void CADeprecated::XMachServer::RemoveMachClient(void *a1, uint64_t a2)
{
  CADeprecated::XMachPortDeathListener::CancelPortDeathNotification((CADeprecated::XMachPortDeathListener *)(a1 + 10), *(_DWORD *)(a2 + 12));
  uint64_t v4 = a1[14];
  unsigned int v8 = a1 + 14;
  char v9 = (*(uint64_t (**)(void *))(v4 + 16))(a1 + 14);
  uint64_t v6 = (char *)a1[25];
  uint64_t v5 = (char *)a1[26];
  while (v6 != v5)
  {
    if (*(void *)v6 == a2)
    {
      int64_t v7 = v5 - (v6 + 8);
      if (v5 != v6 + 8) {
        memmove(v6, v6 + 8, v5 - (v6 + 8));
      }
      a1[26] = &v6[v7];
      break;
    }
    v6 += 8;
  }
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v8);
}

void CADeprecated::XMachPortDeathListener::CancelPortDeathNotification(CADeprecated::XMachPortDeathListener *this, mach_port_name_t a2)
{
  kern_return_t v4;
  kern_return_t v5;
  uint64_t v6;
  mach_port_t previous;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  kern_return_t v15;
  uint64_t v16;

  uint64_t v16 = *MEMORY[0x1E4F143B8];
  previous = 0;
  int v3 = (ipc_space_t *)MEMORY[0x1E4F14960];
  uint64_t v4 = mach_port_request_notification(*MEMORY[0x1E4F14960], a2, 72, 1u, 0, 0x15u, &previous);
  if (v4)
  {
    uint64_t v5 = v4;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (*(uint64_t (**)(CADeprecated::XMachPortDeathListener *))(*(void *)this + 24))(this);
      *(_DWORD *)std::string buf = 136315906;
      char v9 = "XMachServer.cpp";
      uint64_t v10 = 1024;
      uint64_t v11 = 128;
      uint64_t v12 = 2080;
      uint64_t v13 = v6;
      uint64_t v14 = 1024;
      long long v15 = v5;
      _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: XMachServer couldn't cancel port-death notification (0x%x)", buf, 0x22u);
    }
  }
  else
  {
    mach_port_deallocate(*v3, previous);
  }
}

void ___ZN4swix6detail15connection_impl6cancelENS_19CancellationContextE_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  xpc_connection_set_event_handler(*(xpc_connection_t *)(a1 + 40), &__block_literal_global_17);
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
  int v3 = *(NSObject **)v2;
  if (os_log_type_enabled(*(os_log_t *)v2, OS_LOG_TYPE_DEBUG))
  {
    applesauce::xpc::connection::to_debug_string((applesauce::xpc::connection *)__p, *(void *)(v2 + 16));
    if (v6 >= 0) {
      uint64_t v4 = __p;
    }
    else {
      uint64_t v4 = (void **)__p[0];
    }
    *(_DWORD *)std::string buf = 136315138;
    unsigned int v8 = v4;
    _os_log_debug_impl(&dword_1ABAC8000, v3, OS_LOG_TYPE_DEBUG, "canceled connection %s", buf, 0xCu);
    if (v6 < 0) {
      operator delete(__p[0]);
    }
  }
}

void swix::listener::listener(swix::listener *this, const swix::connection_config *a2)
{
}

void sub_1ABAD2E38(_Unwind_Exception *a1)
{
  xpc_release(*(xpc_object_t *)(v2 - 24));
  void *v1 = &unk_1F03034F8;
  uint64_t v4 = (std::__shared_weak_count *)v1[2];
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  _Unwind_Resume(a1);
}

void swix::ipc_endpoint::handle_error(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(NSObject **)(v4 + 80);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    swix::connection::description((os_unfair_lock_s **)a1, v21);
    if (v22 >= 0) {
      uint64_t v11 = v21;
    }
    else {
      uint64_t v11 = (void **)v21[0];
    }
    uint64_t v12 = (char *)MEMORY[0x1AD113770](*a2);
    std::string::basic_string[abi:ne180100]<0>(__p, v12);
    free(v12);
    if (v16 >= 0) {
      uint64_t v13 = __p;
    }
    else {
      uint64_t v13 = *(unsigned char **)__p;
    }
    *(_DWORD *)std::string buf = 136315394;
    xpc_object_t v18 = v11;
    __int16 v19 = 2080;
    int v20 = v13;
    _os_log_error_impl(&dword_1ABAC8000, v5, OS_LOG_TYPE_ERROR, "connection %s : error %s", buf, 0x16u);
    if (v16 < 0) {
      operator delete(*(void **)__p);
    }
    if (v22 < 0) {
      operator delete(v21[0]);
    }
    uint64_t v4 = *(void *)(a1 + 8);
  }
  int v6 = *(unsigned __int8 *)(v4 + 89);
  uint64_t v7 = *(void *)(a1 + 48);
  if (!v7)
  {
    long long v23 = 0;
    goto LABEL_9;
  }
  if (v7 == a1 + 24)
  {
    long long v23 = v21;
    (*(void (**)(uint64_t, void **))(*(void *)v7 + 24))(v7, v21);
    uint64_t v8 = (uint64_t)v23;
    if (!v23) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 16))(v7);
  long long v23 = (void **)v8;
  if (v8) {
LABEL_8:
  }
    (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v8 + 48))(v8, a1, a2);
LABEL_9:
  std::__function::__value_func<void ()(swix::ipc_endpoint &,applesauce::xpc::object const&)>::~__value_func[abi:ne180100](v21);
  if (v6)
  {
    uint64_t v9 = *(void *)(a1 + 8);
    uint64_t v10 = *(NSObject **)(v9 + 80);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      swix::connection::description((os_unfair_lock_s **)a1, v21);
      if (v22 >= 0) {
        uint64_t v14 = v21;
      }
      else {
        uint64_t v14 = (void **)v21[0];
      }
      *(_DWORD *)std::string __p = 136315138;
      *(void *)&__p[4] = v14;
      _os_log_error_impl(&dword_1ABAC8000, v10, OS_LOG_TYPE_ERROR, "auto-cancelling %s", __p, 0xCu);
      if (v22 < 0) {
        operator delete(v21[0]);
      }
      uint64_t v9 = *(void *)(a1 + 8);
    }
    swix::connection::state::cancel_connection(v9, 0);
  }
}

void sub_1ABAD3110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
}

void swix::connection::~connection(swix::connection *this)
{
  *(void *)this = &unk_1F03034F8;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_1F03034F8;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x1AD112B70);
}

{
  std::__shared_weak_count *v1;

  *(void *)this = &unk_1F03034F8;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void __clang_call_terminate(void *a1)
{
}

void *MIDIPacketList_New(const MIDIPacketList *a1)
{
  unint64_t packet = (unint64_t)a1->packet;
  if ((int)a1->numPackets >= 1)
  {
    UInt32 v3 = a1->numPackets + 1;
    do
    {
      unint64_t packet = (packet + *(unsigned __int16 *)(packet + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
      --v3;
    }
    while (v3 > 1);
  }
  size_t v4 = packet - (void)a1;
  uint64_t v5 = malloc_type_malloc(packet - (void)a1, 0x6BE2FA03uLL);

  return memcpy(v5, a1, v4);
}

unint64_t MIDIPacketList_Size(const MIDIPacketList *a1)
{
  unint64_t packet = (unint64_t)a1->packet;
  if ((int)a1->numPackets >= 1)
  {
    UInt32 v2 = a1->numPackets + 1;
    do
    {
      unint64_t packet = (packet + *(unsigned __int16 *)(packet + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
      --v2;
    }
    while (v2 > 1);
  }
  return packet - (void)a1;
}

char *MIDIPacketList_New(uint64_t a1, size_t a2, const unsigned __int8 *a3)
{
  int v6 = (char *)malloc_type_malloc(a2 + 14, 0x6BE2FA03uLL);
  *(_DWORD *)int v6 = 1;
  *(void *)(v6 + 4) = a1;
  *((_WORD *)v6 + 6) = a2;
  memcpy(v6 + 14, a3, a2);
  return v6;
}

_WORD *MIDIPacketList_Split(MIDIPacketList *a1, unint64_t a2)
{
  if (a2 <= 0x11) {
    __assert_rtn("MIDIPacketList_Split", "MIDIPacket.cpp", 46, "maxLen >= offsetof(MIDIPacketList, packet[0].data[4])");
  }
  unint64_t packet = (unint64_t)a1->packet;
  UInt32 numPackets = a1->numPackets;
  if ((int)a1->numPackets < 1) {
    return 0;
  }
  UInt32 v5 = 0;
  int v6 = (unsigned __int16 *)a1->packet;
  while (1)
  {
    uint64_t v7 = v6[4];
    unint64_t v8 = ((unint64_t)v6 + v7 + 13) & 0xFFFFFFFFFFFFFFFCLL;
    if (v8 - (unint64_t)a1 > a2) {
      break;
    }
    ++v5;
    int v6 = (unsigned __int16 *)(((unint64_t)v6 + v7 + 13) & 0xFFFFFFFFFFFFFFFCLL);
    if (numPackets == v5) {
      return 0;
    }
  }
  if (!v5)
  {
    uint64_t v13 = (char *)a1 + a2;
    if ((unint64_t)a1 + a2 < v8 && (*v13 & 0x80000000) == 0)
    {
      if (*(v13 - 1) < 0)
      {
        --v13;
      }
      else if (*(v13 - 2) < 0)
      {
        v13 -= 2;
      }
    }
    unsigned int v14 = numPackets + 1;
    do
    {
      unint64_t packet = (packet + *(unsigned __int16 *)(packet + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
      --v14;
    }
    while (v14 > 1);
    uint64_t v15 = v13 - (char *)v6 - 10;
    size_t v16 = v7 - v15;
    uint64_t v9 = malloc_type_malloc(packet - ((void)a1 + v15) + 8, 0x6BE2FA03uLL);
    *(_DWORD *)uint64_t v9 = a1->numPackets;
    *(void *)(v9 + 2) = *(void *)v6;
    uint64_t v17 = v9 + 2;
    void v9[6] = v16;
    memcpy(v9 + 7, v13, v16);
    UInt32 v18 = a1->numPackets;
    if ((signed int)(a1->numPackets - 1) >= 1)
    {
      do
      {
        int v6 = (unsigned __int16 *)(((unint64_t)v6 + v6[4] + 13) & 0xFFFFFFFFFFFFFFFCLL);
        uint64_t v17 = (unsigned __int16 *)(((unint64_t)v17 + v17[4] + 13) & 0xFFFFFFFFFFFFFFFCLL);
        memcpy(v17, v6, v6[4] + 10);
        --v18;
      }
      while (v18 > 1);
    }
    a1->UInt32 numPackets = 1;
    a1->packet[0].length = v15;
    return v9;
  }
  UInt32 v12 = *((_DWORD *)v6 - 1);
  uint64_t v11 = (MIDIPacketList *)(v6 - 2);
  v11->UInt32 numPackets = numPackets - v5;
  uint64_t result = MIDIPacketList_New(v11);
  v11->UInt32 numPackets = v12;
  a1->UInt32 numPackets = v5;
  return result;
}

const unsigned __int8 *NextMIDIEvent(const MIDIPacket *a1, Byte *a2)
{
  UInt32 v2 = &a1->data[a1->length];
  if (a1->data <= a2 && v2 > a2) {
    return NextMIDIEvent(a2, v2);
  }
  else {
    return &a1->data[a1->length];
  }
}

const unsigned __int8 *NextMIDIEvent(const unsigned __int8 *a1, const unsigned __int8 *a2)
{
  unsigned int v2 = *a1 >> 4;
  if (v2 > 0xF) {
    goto LABEL_8;
  }
  if (((1 << v2) & 0x4F00) != 0)
  {
LABEL_3:
    UInt32 v3 = a1 + 3;
    goto LABEL_18;
  }
  if (((1 << v2) & 0x3000) != 0)
  {
LABEL_5:
    UInt32 v3 = a1 + 2;
    goto LABEL_18;
  }
  if (v2 == 15)
  {
    switch(*a1)
    {
      case 0xF0u:
        goto LABEL_8;
      case 0xF1u:
      case 0xF3u:
        goto LABEL_5;
      case 0xF2u:
        goto LABEL_3;
      default:
        UInt32 v3 = a1 + 1;
        break;
    }
  }
  else
  {
LABEL_8:
    size_t v4 = a1 + 1;
    UInt32 v5 = a1 + 1;
    do
    {
      int v7 = *v5++;
      int v6 = v7;
      BOOL v9 = (v7 & 0x80u) == 0 || v6 == 247;
      if (v4 >= a2) {
        break;
      }
      size_t v4 = v5;
    }
    while (v9);
    UInt32 v3 = v5 - 1;
  }
LABEL_18:
  if (v3 >= a2) {
    return a2;
  }
  else {
    return v3;
  }
}

void MIDIPacketList_Dump(__sFILE *a1, const MIDIPacketList *a2, const char *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    DumpMIDIPacketList(a1, a2, a3);
  }
  else
  {
    int v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    int v6 = funopen(&v6, 0, (int (__cdecl *)(void *, const char *, int))CAMemoryStream::Write, 0, 0);
    DumpMIDIPacketList(v6, a2, a3);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      fflush(v6);
      UInt32 v5 = v7;
      if (!v7)
      {
        UInt32 v5 = malloc_type_malloc(1uLL, 0xADAE35E5uLL);
        int v7 = v5;
        uint64_t v9 = 1;
      }
      *((unsigned char *)v5 + v8) = 0;
      *(_DWORD *)std::string buf = 136315138;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
    fclose(v6);
    free(v7);
  }
}

void sub_1ABAD3734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, FILE *a9, void *a10)
{
}

uint64_t DumpMIDIPacketList(__sFILE *a1, const MIDIPacketList *a2, const char *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  fprintf(a1, "%s ", a3);
  *(void *)&long long v6 = 0x2020202020202020;
  *((void *)&v6 + 1) = 0x2020202020202020;
  v19[3] = v6;
  v19[4] = v6;
  v19[1] = v6;
  v19[2] = v6;
  v19[0] = v6;
  uint64_t result = strlen(a3);
  uint64_t v8 = 79;
  if ((unint64_t)(result + 1) < 0x4F) {
    uint64_t v8 = result + 1;
  }
  *((unsigned char *)v19 + v8) = 0;
  UInt32 numPackets = a2->numPackets;
  if (DumpMIDIPacketList(__sFILE *,MIDIPacketList const*,char const*)::baseTime)
  {
    if (!numPackets) {
      return result;
    }
  }
  else
  {
    if (!numPackets) {
      return result;
    }
    DumpMIDIPacketList(__sFILE *,MIDIPacketList const*,char const*)::baseTime = a2->packet[0].timeStamp;
  }
  UInt32 v10 = 0;
  unint64_t packet = (unint64_t)a2->packet;
  do
  {
    unint64_t v12 = *(void *)packet;
    if (*(void *)packet)
    {
      unint64_t v13 = DumpMIDIPacketList(__sFILE *,MIDIPacketList const*,char const*)::baseTime;
      uint64_t v14 = __udivti3();
      if (v12 >= v13) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = -v14;
      }
      snprintf(__str, 0x14uLL, "%.3f", (double)v15 * 0.000000001);
    }
    else
    {
      strcpy(__str, "---");
    }
    size_t v16 = "";
    if (v10) {
      size_t v16 = (const char *)v19;
    }
    fprintf(a1, "%s[%2d] %s : ", v16, v10, __str);
    if (*(_WORD *)(packet + 8))
    {
      unint64_t v17 = 0;
      do
        fprintf(a1, "%02X ", *(unsigned __int8 *)(packet + 10 + v17++));
      while (v17 < *(unsigned __int16 *)(packet + 8));
    }
    uint64_t result = fputc(10, a1);
    unint64_t packet = (packet + *(unsigned __int16 *)(packet + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
    ++v10;
  }
  while (v10 < a2->numPackets);
  return result;
}

const char *CAMemoryStream::Write(CAMemoryStream *this, void *a2, const char *a3)
{
  UInt32 v3 = a3;
  if ((int)a3 >= 1)
  {
    uint64_t v6 = *((void *)this + 2);
    uint64_t v7 = v6 + a3;
    if ((unint64_t)(v7 + 1) <= *((void *)this + 3))
    {
      uint64_t v8 = (char *)*((void *)this + 1);
    }
    else
    {
      uint64_t v8 = (char *)malloc_type_realloc(*((void **)this + 1), (v7 & 0xFFFFFFFFFFFFFF80) + 128, 0x2426ABB1uLL);
      if (!v8)
      {
        fwrite("realloc failed", 0xEuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
        return (const char *)0xFFFFFFFFLL;
      }
      *((void *)this + 1) = v8;
      *((void *)this + 3) = (v7 & 0xFFFFFFFFFFFFFF80) + 128;
      uint64_t v6 = *((void *)this + 2);
    }
    memcpy(&v8[v6], a2, v3);
    *((void *)this + 2) = v7;
  }
  return v3;
}

void TuningPListMgr::TuningPListMgr(TuningPListMgr *this)
{
  *(void *)this = 0;
  *((unsigned char *)this + 8) = 1;
  *((void *)this + 6) = 0;
  std::string::basic_string[abi:ne180100]<0>(&__p, "0");
  CAFileSystemUtilities::GetTemporaryDirectorySubpathString((uint64_t)&__p, &v10);
  if (v9 < 0) {
    operator delete(__p);
  }
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unsigned int v2 = &v10;
  }
  else {
    unsigned int v2 = (std::string *)v10.__r_.__value_.__r.__words[0];
  }
  std::string __p = (void *)CFStringCreateWithCString(0, (const char *)v2, 0x600u);
  char v8 = 1;
  CACFString::operator=((uint64_t)this, (uint64_t)&__p);
  CACFString::~CACFString((CACFString *)&__p);
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v4 = 16;
  UInt32 v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
  uint64_t v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
  do
  {
    *(void *)((char *)this + v4) = CFDictionaryCreateMutable(v3, 0, v5, v6);
    v4 += 8;
  }
  while (v4 != 48);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
}

void sub_1ABAD3B30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  CACFString::~CACFString((CACFString *)&a9);
  if (a20 < 0) {
    operator delete(__p);
  }
  CACFString::~CACFString(v20);
  _Unwind_Resume(a1);
}

uint64_t CACFString::operator=(uint64_t a1, uint64_t a2)
{
  CFAllocatorRef v3 = *(const void **)a2;
  if (*(void *)a2 != *(void *)a1)
  {
    if (*(void *)a1) {
      BOOL v5 = *(unsigned char *)(a1 + 8) == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5)
    {
      CFRelease(*(CFTypeRef *)a1);
      CFAllocatorRef v3 = *(const void **)a2;
    }
    *(void *)a1 = v3;
    int v6 = *(unsigned __int8 *)(a2 + 8);
    *(unsigned char *)(a1 + 8) = v6;
    if (v6) {
      BOOL v7 = v3 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7) {
      CFRetain(v3);
    }
  }
  return a1;
}

void CACFString::~CACFString(CACFString *this)
{
  if (*((unsigned char *)this + 8))
  {
    unsigned int v2 = *(const void **)this;
    if (*(void *)this) {
      CFRelease(v2);
    }
  }
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_1ABAD3C90(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void TuningPListMgr::~TuningPListMgr(TuningPListMgr *this)
{
  for (uint64_t i = 16; i != 48; i += 8)
  {
    CFAllocatorRef v3 = *(const void **)((char *)this + i);
    if (v3)
    {
      CFRelease(v3);
      *(void *)((char *)this + i) = 0;
    }
  }
  uint64_t v4 = (PListLogger *)*((void *)this + 6);
  if (v4)
  {
    PListLogger::~PListLogger(v4);
    MEMORY[0x1AD112B70]();
  }

  CACFString::~CACFString(this);
}

void PListLogger::~PListLogger(PListLogger *this)
{
  if (*(_DWORD *)this != -1)
  {
    PListLogger::log(this, "*** done.\n");
    close(*(_DWORD *)this);
    *(_DWORD *)this = -1;
  }
}

uint64_t PListLogger::log(PListLogger *this, const char *a2, ...)
{
  va_start(va, a2);
  return vdprintf(*(_DWORD *)this, a2, va);
}

PListLogger *TuningPListMgr::enableLogging(TuningPListMgr *this, int a2)
{
  uint64_t result = (PListLogger *)*((void *)this + 6);
  if (a2)
  {
    if (!result) {
      operator new();
    }
  }
  else if (result)
  {
    PListLogger::~PListLogger(result);
    uint64_t result = (PListLogger *)MEMORY[0x1AD112B70]();
    *((void *)this + 6) = 0;
  }
  return result;
}

void sub_1ABAD3E54(_Unwind_Exception *a1)
{
  MEMORY[0x1AD112B70](v1, 0x1000C4005A209FELL);
  _Unwind_Resume(a1);
}

void PListLogger::PListLogger(PListLogger *this)
{
  *(void *)this = 0xFFFFFFFFLL;
  *((unsigned char *)this + 8) = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "plist-logger.log");
  CAFileSystemUtilities::GetTemporaryDirectorySubpathString((uint64_t)__p, &v5);
  if (v4 < 0) {
    operator delete(__p[0]);
  }
  if ((v5.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unsigned int v2 = &v5;
  }
  else {
    unsigned int v2 = (std::string *)v5.__r_.__value_.__r.__words[0];
  }
  *(_DWORD *)this = open((const char *)v2, 522, 420);
  PListLogger::log(this, "\n***\n*** New Sesssion\n***\n");
  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v5.__r_.__value_.__l.__data_);
  }
}

void sub_1ABAD3F24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t TuningPListMgr::loadPListFile_(TuningPListMgr *this, const __CFString *a2, __CFDictionary **a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  std::string v10 = 0;
  CFDataRef Mutable = (TuningPListMgr *)CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 512);
  int v6 = Mutable;
  if (!a3)
  {
    char v8 = (NSObject **)logSubsystem();
    if (v8)
    {
      char v9 = *v8;
      if (!*v8) {
        goto LABEL_10;
      }
    }
    else
    {
      char v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 136315394;
      unint64_t v12 = "TuningPListMgr.cpp";
      __int16 v13 = 1024;
      int v14 = 109;
      _os_log_impl(&dword_1ABAC8000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d invalid parameter", buf, 0x12u);
    }
    goto LABEL_10;
  }
  if (TuningPListMgr::createPlistFromFile_(Mutable, a2, &v10, (__CFString *)Mutable))
  {
    *a3 = v10;
    CFRelease(v6);
    return 0;
  }
LABEL_10:
  CFRelease(v6);
  return 0xFFFFFFFFLL;
}

uint64_t logSubsystem(void)
{
  if (atomic_load_explicit((atomic_ullong *volatile)&logSubsystem(void)::onceflag, memory_order_acquire) != -1)
  {
    CFAllocatorRef v3 = &v1;
    unsigned int v2 = &v3;
    std::__call_once(&logSubsystem(void)::onceflag, &v2, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<logSubsystem(void)::$_0 &&>>);
  }
  return logSubsystem(void)::scope;
}

uint64_t TuningPListMgr::createPlistFromFile_(TuningPListMgr *this, const __CFString *a2, const __CFDictionary **a3, __CFString *a4)
{
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFURLRef v8 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, kCFURLPOSIXPathStyle, 0);
  if (v8
    && (CFURLRef v9 = v8, v10 = CFReadStreamCreateWithFile(v7, v8), CFRelease(v9), v10)
    && (CFReadStreamOpen(v10),
        CFDictionaryRef v11 = (const __CFDictionary *)CFPropertyListCreateWithStream(v7, v10, 0, 0, 0, 0),
        CFReadStreamClose(v10),
        CFRelease(v10),
        v11))
  {
    *a3 = v11;
    return 1;
  }
  else
  {
    if (a4)
    {
      CFStringAppend(a4, @"Error loading plist file ");
      CFStringAppend(a4, a2);
      CFStringAppend(a4, @"\n");
    }
    return 0;
  }
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<logSubsystem(void)::$_0 &&>>()
{
}

uint64_t TuningPListMgr::loadTuningInSubdirs_(CFStringRef *a1, const __CFString ***a2, unsigned int a3, signed int a4)
{
  CFTypeRef cf = 0;
  if (a3)
  {
    CFStringRef v8 = **a2;
    if (v8 && CFStringHasPrefix(v8, @"/")) {
      CFStringRef v9 = &stru_1F0303980;
    }
    else {
      CFStringRef v9 = *a1;
    }
    MutableCopy = CFStringCreateMutableCopy(0, 0, v9);
    CFMutableStringRef theString = MutableCopy;
    char v22 = 1;
    uint64_t v11 = a3 - 1;
    unint64_t v12 = a2;
    if (!MutableCopy) {
      goto LABEL_9;
    }
LABEL_7:
    CFStringAppend(MutableCopy, @"/");
    if (theString) {
      CFStringAppend(theString, **v12);
    }
LABEL_9:
    while (v11)
    {
      MutableCopy = theString;
      --v11;
      ++v12;
      if (theString) {
        goto LABEL_7;
      }
    }
  }
  else
  {
    CFMutableStringRef theString = CFStringCreateMutableCopy(0, 0, *a1);
    char v22 = 1;
  }
  if (a4 > 4) {
    a4 = 0;
  }
  size_t v13 = strlen(TuningPListMgr::kTuningFileTypeSuffixMap[a4]);
  CFStringRef v14 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)TuningPListMgr::kTuningFileTypeSuffixMap[a4], v13, 0x600u, 0, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  HasSuffix = (TuningPListMgr *)theString;
  if (theString)
  {
    HasSuffix = (TuningPListMgr *)CFStringHasSuffix(theString, v14);
    CFStringRef v16 = theString;
    if (!HasSuffix)
    {
      CFStringAppend(theString, v14);
      CFStringRef v16 = theString;
    }
  }
  else
  {
    CFStringRef v16 = 0;
  }
  if (TuningPListMgr::loadPListFile_(HasSuffix, v16, (__CFDictionary **)&cf))
  {
    uint64_t v18 = 0xFFFFFFFFLL;
    if (!v14) {
      goto LABEL_26;
    }
LABEL_25:
    CFRelease(v14);
    goto LABEL_26;
  }
  CFMutableStringRef v19 = (CFMutableStringRef)*a2[a3 - 1];
  if (!a4)
  {
    TuningPListMgr::addLegacyStripNameKeys_(&cf, (const void **)&v19->isa, v17);
    CFMutableStringRef v19 = theString;
  }
  TuningPListMgr::installTuning_((uint64_t)a1, v19, (CFDictionaryRef)cf, a4);
  uint64_t v18 = 0;
  if (v14) {
    goto LABEL_25;
  }
LABEL_26:
  if (cf) {
    CFRelease(cf);
  }
  CACFMutableString::~CACFMutableString((CACFMutableString *)&theString);
  return v18;
}

void sub_1ABAD4434(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFMutableString::~CACFMutableString((CACFMutableString *)va);
  _Unwind_Resume(a1);
}

void TuningPListMgr::addLegacyStripNameKeys_(CFTypeRef *this, const void **a2, const __CFString *a3)
{
  uint64_t v5 = 0;
  MutableCopy = 0;
  CFAllocatorRef v7 = 0;
  CFDictionaryRef v8 = (const __CFDictionary *)*this;
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  do
  {
    std::string v10 = kLegacyStripNameKeys[v5];
    if (!CFDictionaryContainsKey(v8, v10))
    {
      if (!v7)
      {
        CFIndex Count = CFDictionaryGetCount(v8);
        MutableCopy = CFDictionaryCreateMutableCopy(v9, Count + 2, v8);
      }
      CFDictionaryAddValue(MutableCopy, v10, a2);
      CFAllocatorRef v7 = MutableCopy;
    }
    ++v5;
  }
  while (v5 != 2);
  if (MutableCopy)
  {
    CFRelease(*this);
    *this = MutableCopy;
  }
}

void sub_1ABAD452C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::ObjectRef<__CFDictionary *>::~ObjectRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t TuningPListMgr::installTuning_(uint64_t a1, const void *a2, CFDictionaryRef theDict, unsigned int a4)
{
  Value = CFDictionaryGetValue(theDict, @"name");
  uint64_t v9 = a1 + 8 * a4;
  if (Value)
  {
    std::string v10 = Value;
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v10) && CFDictionaryGetCount(*(CFDictionaryRef *)(v9 + 16)) >= 1) {
      operator new[]();
    }
  }
  size_t v13 = *(__CFDictionary **)(v9 + 16);
  unint64_t v12 = (const __CFString **)(v9 + 16);
  CFDictionarySetValue(v13, a2, theDict);
  uint64_t v15 = *(PListLogger **)(a1 + 48);
  if (v15) {
    PListLogger::logItemEntry(*v12, "@@ Strips Nov 11 2024 20:56:53", v15, v14);
  }
  return 0;
}

void CACFMutableString::~CACFMutableString(CACFMutableString *this)
{
  if (*((unsigned char *)this + 8))
  {
    unsigned int v2 = *(const void **)this;
    if (*(void *)this) {
      CFRelease(v2);
    }
  }
}

void PListLogger::logItemEntry(const __CFString *this, const char *a2, PListLogger *a3, void *a4)
{
  CFTypeID v7 = CFGetTypeID(this);
  if (CFStringGetTypeID() == v7)
  {
    PListLogger::logItem(a3, this, a2);
  }
  else if (CFNumberGetTypeID() == v7)
  {
    PListLogger::logItem(a3, (CFNumberRef)this, a2);
  }
  else if (CFDictionaryGetTypeID() == v7)
  {
    PListLogger::logItem(a3, (const __CFDictionary *)this, a2);
  }
  else if (CFArrayGetTypeID() == v7)
  {
    PListLogger::logItem(a3, (CFArrayRef)this, a2);
  }
  else if (CFDataGetTypeID() == v7)
  {
    PListLogger::logItem(a3, (const __CFData *)this, a2);
  }
  else
  {
    PListLogger::logItemUnknown(a3, a2, v7);
  }
}

uint64_t PListLogger::logItem(PListLogger *this, const __CFString *a2, const char *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v6 = *((_DWORD *)this + 1);
  if (v6 >= 127) {
    size_t v7 = 127;
  }
  else {
    size_t v7 = v6;
  }
  v11[(int)v7] = 0;
  if (v7) {
    memset(&v11[(int)v7 - 1 - (v7 - 1)], 32, v7);
  }
  PListLogger::log(this, "%s", v11);
  int v8 = CFGetRetainCount(a2);
  CStringPtr = CFStringGetCStringPtr(a2, 0);
  return PListLogger::log(this, "'%s' | String{%d} | \"%s\"\n", a3, v8, CStringPtr);
}

uint64_t PListLogger::logItem(PListLogger *this, CFNumberRef number, const char *a3)
{
  valuePtr[16] = *MEMORY[0x1E4F143B8];
  CFNumberType Type = CFNumberGetType(number);
  int v7 = *((_DWORD *)this + 1);
  if (v7 >= 127) {
    size_t v8 = 127;
  }
  else {
    size_t v8 = v7;
  }
  *((unsigned char *)valuePtr + (int)v8) = 0;
  if (v8) {
    memset((char *)valuePtr + (int)v8 - (v8 - 1) - 1, 32, v8);
  }
  PListLogger::log(this, "%s", (const char *)valuePtr);
  if ((unint64_t)Type <= kCFNumberDoubleType)
  {
    if (((1 << Type) & 0x3060) != 0)
    {
      valuePtr[0] = 0;
      CFNumberGetValue(number, Type, valuePtr);
      CFGetRetainCount(number);
      return PListLogger::log(this, "'%s' | Number(float){%d} | %f\n");
    }
    if (((1 << Type) & 0x82) != 0)
    {
      LOBYTE(valuePtr[0]) = 0;
      CFNumberGetValue(number, Type, valuePtr);
      CFGetRetainCount(number);
      return PListLogger::log(this, "'%s' | Number(SInt8){%d} | 0x%02x\n");
    }
    if (((1 << Type) & 0x104) != 0)
    {
      LOWORD(valuePtr[0]) = 0;
      CFNumberGetValue(number, Type, valuePtr);
      CFGetRetainCount(number);
      return PListLogger::log(this, "'%s' | Number(SInt16){%d} | 0x%04x\n");
    }
  }
  LODWORD(valuePtr[0]) = 0;
  CFNumberGetValue(number, Type, valuePtr);
  CFIndex v10 = CFGetRetainCount(number);
  return PListLogger::log(this, "'%s' | Number(SInt32){%d} | %-6d 0x%08x %c%c%c%c\n", a3, v10);
}

void PListLogger::logItem(PListLogger *this, const __CFDictionary *a2, const char *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v6 = *((_DWORD *)this + 1);
  if (v6 >= 127) {
    size_t v7 = 127;
  }
  else {
    size_t v7 = v6;
  }
  v10[(int)v7] = 0;
  if (v7) {
    memset(&v10[(int)v7 - 1 - (v7 - 1)], 32, v7);
  }
  PListLogger::log(this, "%s", v10);
  int v8 = CFGetRetainCount(a2);
  int Count = CFDictionaryGetCount(a2);
  PListLogger::log(this, "'%s' | Dictionary{%d} | %d key/value pairs\n", a3, v8, Count);
  if (!strcmp("aupreset", a3)) {
    *((unsigned char *)this + 8) = 1;
  }
  *((_DWORD *)this + 1) += 4;
  CFDictionaryApplyFunction(a2, (CFDictionaryApplierFunction)PListLogger::logDictEntry, this);
  *((_DWORD *)this + 1) -= 4;
  *((unsigned char *)this + 8) = 0;
}

uint64_t PListLogger::logItem(PListLogger *this, CFArrayRef theArray, const char *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  CFIndex Count = CFArrayGetCount(theArray);
  int v7 = *((_DWORD *)this + 1);
  if (v7 >= 127) {
    size_t v8 = 127;
  }
  else {
    size_t v8 = v7;
  }
  __str[(int)v8] = 0;
  if (v8) {
    memset(&__str[(int)v8 - 1 - (v8 - 1)], 32, v8);
  }
  PListLogger::log(this, "%s", __str);
  int v9 = CFGetRetainCount(theArray);
  uint64_t result = PListLogger::log(this, "'%s' | Array{%d} | %d ordered objects\n", a3, v9, Count);
  int v11 = *((_DWORD *)this + 1);
  *((_DWORD *)this + 1) = v11 + 4;
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      ValueAtIndex = (PListLogger *)CFArrayGetValueAtIndex(theArray, i);
      snprintf(__str, 0x10uLL, "[%u]", i);
      uint64_t result = PListLogger::logItemEntry(ValueAtIndex, __str, (const char *)this, v14);
    }
    int v11 = *((_DWORD *)this + 1) - 4;
  }
  *((_DWORD *)this + 1) = v11;
  return result;
}

uint64_t PListLogger::logItem(PListLogger *this, const __CFData *a2, const char *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v6 = *((_DWORD *)this + 1);
  if (v6 >= 127) {
    size_t v7 = 127;
  }
  else {
    size_t v7 = v6;
  }
  v12[(int)v7] = 0;
  if (v7) {
    memset(&v12[(int)v7 - 1 - (v7 - 1)], 32, v7);
  }
  PListLogger::log(this, "%s", v12);
  if (*((unsigned char *)this + 8)) {
    size_t v8 = "AUPreset";
  }
  else {
    size_t v8 = "";
  }
  int v9 = CFGetRetainCount(a2);
  int Length = CFDataGetLength(a2);
  return PListLogger::log(this, "'%s' | %sData{%d} | %d bytes\n", a3, v8, v9, Length);
}

uint64_t PListLogger::logItemUnknown(PListLogger *this, const char *a2, int a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v6 = *((_DWORD *)this + 1);
  if (v6 >= 127) {
    size_t v7 = 127;
  }
  else {
    size_t v7 = v6;
  }
  v9[(int)v7] = 0;
  if (v7) {
    memset(&v9[(int)v7 - 1 - (v7 - 1)], 32, v7);
  }
  PListLogger::log(this, "%s", v9);
  return PListLogger::log(this, "'%s' | <unknown type id: %d)>\n", a2, a3);
}

uint64_t PListLogger::logDictEntry(const __CFString *this, PListLogger *a2, const char *a3, void *a4)
{
  CStringPtr = CFStringGetCStringPtr(this, 0);

  return PListLogger::logItemEntry(a2, CStringPtr, a3, v7);
}

const void **applesauce::CF::ObjectRef<__CFDictionary *>::~ObjectRef(const void **a1)
{
  unsigned int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t TuningPListMgr::cfGetString_(uint64_t this, void *a2, const __CFString **a3)
{
  if (this)
  {
    char v4 = (const void *)this;
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v4))
    {
      *a2 = v4;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return this;
}

uint64_t TuningPListMgr::cfGetDictionary_(TuningPListMgr *this, TuningPListMgr **a2, const __CFDictionary **a3)
{
  if (this && (char v4 = this, TypeID = CFDictionaryGetTypeID(), TypeID == CFGetTypeID(v4)))
  {
    uint64_t result = 1;
  }
  else
  {
    char v4 = 0;
    uint64_t result = 0;
  }
  *a2 = v4;
  return result;
}

uint64_t TuningPListMgr::loadTunings(const __CFString **this)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)uint64_t v18 = 1024;
  CACFString::GetCString(*this, __source, v18, (unsigned int *)0x8000100);
  unsigned int v2 = opendir((const char *)__source);
  if (v2)
  {
    while (1)
    {
      while (1)
      {
        do
        {
          uint64_t result = (uint64_t)readdir(v2);
          if (!result) {
            return result;
          }
          char v4 = (const char *)(result + 21);
        }
        while (!strcmp((const char *)(result + 21), ".") || !strcmp(v4, ".."));
        strlcpy(__dst, (const char *)__source, 0x400uLL);
        strlcat(__dst, "/", 0x400uLL);
        strlcat(__dst, v4, 0x400uLL);
        if (lstat(__dst, &v19) < 0) {
          break;
        }
        if ((v19.st_mode & 0xF000) == 0x8000)
        {
          CFStringRef v5 = CFStringCreateWithCString(0, __dst, 0x600u);
          buf[8] = 1;
          uint64_t v20 = (const __CFString **)buf;
          *(void *)std::string buf = v5;
          TuningPListMgr::loadTuningInSubdirs_(this, &v20, 1u, 0);
          CACFString::~CACFString((CACFString *)buf);
        }
        else
        {
          size_t v8 = (NSObject **)logSubsystem();
          if (!v8)
          {
            int v9 = MEMORY[0x1E4F14500];
            goto LABEL_18;
          }
          int v9 = *v8;
          if (*v8)
          {
LABEL_18:
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)std::string buf = 136315650;
              *(void *)&uint8_t buf[4] = "TuningPListMgr.cpp";
              __int16 v22 = 1024;
              int v23 = 267;
              __int16 v24 = 2080;
              long long v25 = __dst;
              _os_log_impl(&dword_1ABAC8000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d \"%s\" exists but is not a regular file\n", buf, 0x1Cu);
            }
          }
        }
      }
      int v6 = (NSObject **)logSubsystem();
      if (!v6) {
        break;
      }
      size_t v7 = *v6;
      if (*v6)
      {
LABEL_15:
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = __error();
          int v11 = strerror(*v10);
          int v12 = *__error();
          *(_DWORD *)std::string buf = 136316162;
          *(void *)&uint8_t buf[4] = "TuningPListMgr.cpp";
          __int16 v22 = 1024;
          int v23 = 262;
          __int16 v24 = 2080;
          long long v25 = __dst;
          __int16 v26 = 2080;
          long long v27 = v11;
          __int16 v28 = 1024;
          int v29 = v12;
          _os_log_impl(&dword_1ABAC8000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to lstat() \"%s\", errno: %s(%d)\n", buf, 0x2Cu);
        }
      }
    }
    size_t v7 = MEMORY[0x1E4F14500];
    goto LABEL_15;
  }
  uint64_t v13 = (NSObject **)logSubsystem();
  if (!v13)
  {
    CFStringRef v14 = MEMORY[0x1E4F14500];
LABEL_24:
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = __error();
      uint64_t v16 = strerror(*v15);
      int v17 = *__error();
      *(_DWORD *)__dst = 136316162;
      char v31 = "TuningPListMgr.cpp";
      __int16 v32 = 1024;
      int v33 = 247;
      __int16 v34 = 2080;
      v35 = __source;
      __int16 v36 = 2080;
      std::string v37 = v16;
      __int16 v38 = 1024;
      int v39 = v17;
      _os_log_impl(&dword_1ABAC8000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to open dir \"%s\", errno: %s(%d)\n", (uint8_t *)__dst, 0x2Cu);
    }
    return 0xFFFFFFFFLL;
  }
  CFStringRef v14 = *v13;
  if (*v13) {
    goto LABEL_24;
  }
  return 0xFFFFFFFFLL;
}

void sub_1ABAD54D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

BOOL TuningPListMgr::cfGetUInt32_(TuningPListMgr *this, void *a2, unsigned int *a3)
{
  BOOL result = 0;
  if (this)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(this))
    {
      if (CFNumberGetValue(this, kCFNumberSInt32Type, a2)) {
        return 1;
      }
    }
  }
  return result;
}

uint64_t TuningPListMgr::cfGetArray_(uint64_t this, void *a2, const __CFArray **a3)
{
  if (this)
  {
    char v4 = (const void *)this;
    CFTypeID TypeID = CFArrayGetTypeID();
    if (TypeID == CFGetTypeID(v4))
    {
      *a2 = v4;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return this;
}

uint64_t TuningPListMgr::_replaceAUPreset(TuningPListMgr *this, __CFDictionary *a2, const __CFDictionary *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef AUPresetFromUnit = (const __CFDictionary *)TuningPListMgr::getAUPresetFromUnit(this, a2);
  if (AUPresetFromUnit)
  {
    CFDictionaryRef v6 = AUPresetFromUnit;
    uint64_t valuePtr = 0;
    long long v21 = 0uLL;
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(AUPresetFromUnit, @"type");
    CFNumberRef v8 = (const __CFNumber *)CFDictionaryGetValue(v6, @"subtype");
    CFNumberRef v9 = (const __CFNumber *)CFDictionaryGetValue(v6, @"manufacturer");
    CFNumberGetValue(Value, kCFNumberSInt32Type, (char *)&valuePtr + 4);
    CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
    CFNumberGetValue(v9, kCFNumberSInt32Type, (char *)&v21 + 12);
    CFNumberRef v10 = (const __CFNumber *)CFDictionaryGetValue(a3, @"type");
    CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(a3, @"subtype");
    CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue(a3, @"manufacturer");
    CFNumberGetValue(v10, kCFNumberSInt32Type, (char *)&v21 + 8);
    CFNumberGetValue(v11, kCFNumberSInt32Type, (char *)&v21 + 4);
    CFNumberGetValue(v12, kCFNumberSInt32Type, &v21);
    if (valuePtr == *(void *)((char *)&v21 + 4) && HIDWORD(v21) == v21)
    {
      CFDictionaryReplaceValue(a2, @"aupreset", a3);
      CFRelease(@"aupreset");
      return 0;
    }
    CFStringRef v14 = (NSObject **)logSubsystem();
    if (v14)
    {
      uint64_t v15 = *v14;
      if (!*v14) {
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      uint64_t v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v28, HIDWORD(valuePtr));
      CAX4CCString::CAX4CCString((CAX4CCString *)v27, valuePtr);
      CAX4CCString::CAX4CCString((CAX4CCString *)v26, HIDWORD(v21));
      CAX4CCString::CAX4CCString((CAX4CCString *)v25, DWORD2(v21));
      CAX4CCString::CAX4CCString((CAX4CCString *)v24, DWORD1(v21));
      CAX4CCString::CAX4CCString((CAX4CCString *)v23, v21);
      *(_DWORD *)std::string buf = 136316930;
      uint64_t v30 = "TuningPListMgr.cpp";
      __int16 v31 = 1024;
      int v32 = 366;
      __int16 v33 = 2080;
      __int16 v34 = v28;
      __int16 v35 = 2080;
      __int16 v36 = v27;
      __int16 v37 = 2080;
      __int16 v38 = v26;
      __int16 v39 = 2080;
      std::string v40 = v25;
      __int16 v41 = 2080;
      std::string v42 = v24;
      __int16 v43 = 2080;
      uint64_t v44 = v23;
      uint64_t v18 = "%25s:%-5d au tuple mismatch: tuple in strip: %s - %s - %s, tuple in preset: %s - %s - %s";
      stat v19 = v15;
      uint32_t v20 = 78;
LABEL_17:
      _os_log_impl(&dword_1ABAC8000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
    }
  }
  else
  {
    uint64_t v16 = (NSObject **)logSubsystem();
    if (v16)
    {
      int v17 = *v16;
      if (!*v16) {
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      int v17 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 136315394;
      uint64_t v30 = "TuningPListMgr.cpp";
      __int16 v31 = 1024;
      int v32 = 344;
      uint64_t v18 = "%25s:%-5d cannot find preset in au";
      stat v19 = v17;
      uint32_t v20 = 18;
      goto LABEL_17;
    }
  }
  return 0xFFFFFFFFLL;
}

const void *TuningPListMgr::getAUPresetFromUnit(TuningPListMgr *this, CFDictionaryRef theDict)
{
  if (!theDict) {
    return 0;
  }
  BOOL result = CFDictionaryGetValue(theDict, @"aupreset");
  if (result)
  {
    CFAllocatorRef v3 = result;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v3)) {
      return v3;
    }
    else {
      return 0;
    }
  }
  return result;
}

void CAX4CCString::CAX4CCString(CAX4CCString *this, unsigned int a2)
{
  unsigned int v4 = bswap32(a2);
  *(_DWORD *)((char *)this + 1) = v4;
  uint64_t v5 = MEMORY[0x1E4F14390];
  if ((v4 & 0x80) != 0)
  {
    if (!__maskrune((char)v4, 0x40000uLL)) {
      goto LABEL_17;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * (char)v4 + 60) & 0x40000) == 0)
  {
    goto LABEL_17;
  }
  unsigned int v6 = *((char *)this + 2);
  if ((v6 & 0x80000000) != 0)
  {
    if (!__maskrune(v6, 0x40000uLL)) {
      goto LABEL_17;
    }
  }
  else if ((*(_DWORD *)(v5 + 4 * v6 + 60) & 0x40000) == 0)
  {
    goto LABEL_17;
  }
  unsigned int v7 = *((char *)this + 3);
  if ((v7 & 0x80000000) != 0)
  {
    if (!__maskrune(v7, 0x40000uLL)) {
      goto LABEL_17;
    }
LABEL_13:
    unsigned int v8 = *((char *)this + 4);
    if ((v8 & 0x80000000) != 0)
    {
      if (!__maskrune(v8, 0x40000uLL)) {
        goto LABEL_17;
      }
    }
    else if ((*(_DWORD *)(v5 + 4 * v8 + 60) & 0x40000) == 0)
    {
      goto LABEL_17;
    }
    *(_WORD *)((char *)this + 5) = 39;
    *(unsigned char *)this = 39;
    return;
  }
  if ((*(_DWORD *)(v5 + 4 * v7 + 60) & 0x40000) != 0) {
    goto LABEL_13;
  }
LABEL_17:
  if (a2 + 199999 > 0x61A7E) {
    snprintf((char *)this, 0x10uLL, "0x%x");
  }
  else {
    snprintf((char *)this, 0x10uLL, "%d");
  }
}

const void *TuningPListMgr::lookupPlist_(uint64_t a1, const char *a2, int a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3 > 3) {
    return 0;
  }
  uint64_t v4 = a1 + 8 * a3;
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v5 = (const __CFDictionary **)(v4 + 16);
  if (!v6) {
    return 0;
  }
  CFStringRef v7 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, 0, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  if (!v7) {
    return 0;
  }
  CFStringRef v8 = v7;
  CFDictionaryRef v9 = *v5;
  if ((a3 - 1) > 2)
  {
    if (CFDictionaryGetCount(v9) > 0) {
      operator new[]();
    }
    CFRelease(v8);
    return 0;
  }
  CFNumberRef Value = CFDictionaryGetValue(v9, v8);
  if (!Value || (CFNumberRef v11 = Value, TypeID = CFDictionaryGetTypeID(), TypeID != CFGetTypeID(v11)))
  {
    CFRelease(v8);
    uint64_t v13 = (NSObject **)logSubsystem();
    if (v13)
    {
      CFStringRef v14 = *v13;
      if (!*v13) {
        return 0;
      }
    }
    else
    {
      CFStringRef v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315394;
      int v17 = "TuningPListMgr.cpp";
      __int16 v18 = 1024;
      int v19 = 435;
      _os_log_impl(&dword_1ABAC8000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d return dictionary is null", (uint8_t *)&v16, 0x12u);
    }
    return 0;
  }
  CFRelease(v8);
  return v11;
}

CFIndex TuningPListMgr::getNumEffects(TuningPListMgr *this, CFDictionaryRef theDict)
{
  if (!theDict) {
    return 0;
  }
  CFNumberRef Value = CFDictionaryGetValue(theDict, @"strips");
  if (!Value) {
    return 0;
  }
  CFAllocatorRef v3 = Value;
  CFTypeID TypeID = CFArrayGetTypeID();
  if (TypeID != CFGetTypeID(v3)) {
    return 0;
  }

  return CFArrayGetCount((CFArrayRef)v3);
}

const void *TuningPListMgr::getEffect(TuningPListMgr *this, CFDictionaryRef theDict, CFIndex a3)
{
  if (!theDict) {
    return 0;
  }
  BOOL result = CFDictionaryGetValue(theDict, @"strips");
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  CFTypeID TypeID = CFArrayGetTypeID();
  if (TypeID != CFGetTypeID(v5) || CFArrayGetCount((CFArrayRef)v5) <= a3) {
    return 0;
  }
  BOOL result = CFArrayGetValueAtIndex((CFArrayRef)v5, a3);
  if (!result) {
    return result;
  }
  CFStringRef v7 = result;
  CFTypeID v8 = CFDictionaryGetTypeID();
  if (v8 != CFGetTypeID(v7)) {
    return 0;
  }
  BOOL result = CFDictionaryGetValue((CFDictionaryRef)v7, @"effects");
  if (result)
  {
    CFDictionaryRef v9 = result;
    CFTypeID v10 = CFArrayGetTypeID();
    if (v10 == CFGetTypeID(v9)) {
      return v9;
    }
    else {
      return 0;
    }
  }
  return result;
}

CFIndex TuningPListMgr::getNumUnits(TuningPListMgr *this, CFArrayRef theArray)
{
  if (theArray) {
    return CFArrayGetCount(theArray);
  }
  else {
    return 0;
  }
}

const void *TuningPListMgr::getUnitByNumber(TuningPListMgr *this, CFArrayRef theArray, CFIndex a3)
{
  if (!theArray) {
    return 0;
  }
  if (CFArrayGetCount(theArray) <= a3) {
    return 0;
  }
  BOOL result = CFArrayGetValueAtIndex(theArray, a3);
  if (result)
  {
    uint64_t v6 = result;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v6)) {
      return v6;
    }
    else {
      return 0;
    }
  }
  return result;
}

const __CFDictionary *TuningPListMgr::getUnitByName(TuningPListMgr *this, CFArrayRef theArray, const char *a3)
{
  if (!theArray) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count < 1) {
    return 0;
  }
  CFIndex v6 = Count;
  CFStringRef v7 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, 0, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  if (!v7) {
    return 0;
  }
  CFStringRef v8 = v7;
  CFIndex v9 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v9);
    if (ValueAtIndex)
    {
      CFDictionaryRef v11 = ValueAtIndex;
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (TypeID == CFGetTypeID(v11))
      {
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v11, @"displayname");
        if (Value)
        {
          CFStringRef v14 = Value;
          CFTypeID v15 = CFStringGetTypeID();
          if (v15 == CFGetTypeID(v14) && CFEqual(v8, v14)) {
            break;
          }
        }
      }
    }
    if (v6 == ++v9)
    {
      CFDictionaryRef v11 = 0;
      break;
    }
  }
  CFRelease(v8);
  return v11;
}

CFIndex TuningPListMgr::getUnitIndexByName(TuningPListMgr *this, CFArrayRef theArray, const __CFString *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!theArray) {
    return -1;
  }
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count < 1) {
    return -1;
  }
  if (!a3)
  {
    CFStringRef v14 = (NSObject **)logSubsystem();
    if (v14)
    {
      CFTypeID v15 = *v14;
      if (!*v14) {
        return -1;
      }
    }
    else
    {
      CFTypeID v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315394;
      __int16 v18 = "TuningPListMgr.cpp";
      __int16 v19 = 1024;
      int v20 = 553;
      _os_log_impl(&dword_1ABAC8000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d invalid nickname passed", (uint8_t *)&v17, 0x12u);
    }
    return -1;
  }
  CFIndex v6 = Count;
  CFIndex v7 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v7);
    if (ValueAtIndex)
    {
      CFDictionaryRef v9 = ValueAtIndex;
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (TypeID == CFGetTypeID(v9))
      {
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v9, @"displayname");
        if (Value)
        {
          CFStringRef v12 = Value;
          CFTypeID v13 = CFStringGetTypeID();
          if (v13 == CFGetTypeID(v12) && CFEqual(a3, v12)) {
            break;
          }
        }
      }
    }
    if (v6 == ++v7) {
      return v6;
    }
  }
  return v7;
}

const __CFDictionary *TuningPListMgr::getUnitByTuple(TuningPListMgr *this, CFArrayRef theArray, unsigned int a3, unsigned int a4, int a5, int a6)
{
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      CFIndex v12 = Count;
      int v27 = a5;
      for (CFIndex i = 0; i != v12; ++i)
      {
        uint64_t v29 = 0;
        int v28 = 0;
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, i);
        if (ValueAtIndex)
        {
          CFDictionaryRef v15 = ValueAtIndex;
          CFTypeID TypeID = CFDictionaryGetTypeID();
          if (TypeID == CFGetTypeID(v15))
          {
            CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v15, @"unit");
            if (Value)
            {
              CFDictionaryRef v18 = Value;
              CFTypeID v19 = CFDictionaryGetTypeID();
              if (v19 == CFGetTypeID(v18))
              {
                int v20 = (TuningPListMgr *)CFDictionaryGetValue(v18, @"manufacturer");
                if (TuningPListMgr::cfGetUInt32_(v20, (char *)&v29 + 4, v21))
                {
                  __int16 v22 = (TuningPListMgr *)CFDictionaryGetValue(v18, @"type");
                  if (TuningPListMgr::cfGetUInt32_(v22, &v29, v23))
                  {
                    __int16 v24 = (TuningPListMgr *)CFDictionaryGetValue(v18, @"subtype");
                    if (TuningPListMgr::cfGetUInt32_(v24, &v28, v25) && v29 == __PAIR64__(a3, a4) && v28 == v27)
                    {
                      if (!a6) {
                        return v15;
                      }
                      --a6;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return 0;
}

uint64_t TuningPListMgr::getAUBypassStateFromUnit(TuningPListMgr *this, CFDictionaryRef theDict)
{
  if (!theDict) {
    return 0;
  }
  unsigned int v5 = 0;
  CFDictionaryRef Value = (TuningPListMgr *)CFDictionaryGetValue(theDict, @"bypass");
  if (TuningPListMgr::cfGetUInt32_(Value, &v5, v3)) {
    return v5;
  }
  else {
    return 0;
  }
}

const void *TuningPListMgr::getAUPresetByNumber(TuningPListMgr *this, const char *a2, CFIndex a3, CFIndex a4)
{
  CFIndex v6 = (TuningPListMgr *)TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (!v6) {
    return 0;
  }
  Effect = (TuningPListMgr *)TuningPListMgr::getEffect(v6, v6, a3);
  if (!Effect) {
    return 0;
  }
  UnitByNumber = (TuningPListMgr *)TuningPListMgr::getUnitByNumber(Effect, Effect, a4);
  if (!UnitByNumber) {
    return 0;
  }

  return TuningPListMgr::getAUPresetFromUnit(UnitByNumber, UnitByNumber);
}

const void *TuningPListMgr::getAUPresetByTuple(TuningPListMgr *this, const char *a2, char *a3, unsigned int a4, unsigned int a5, int a6, int a7)
{
  uint64_t Value = (uint64_t)TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (!Value) {
    return 0;
  }
  CFDictionaryRef v13 = (const __CFDictionary *)Value;
  CFStringRef v14 = a3;
  if (a3 == (char *)-1)
  {
    uint64_t Value = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)Value, @"strips");
    CFStringRef v14 = (char *)Value;
    if (Value)
    {
      CFTypeID TypeID = CFArrayGetTypeID();
      uint64_t Value = CFGetTypeID(v14);
      if (TypeID == Value)
      {
        uint64_t Value = CFArrayGetCount((CFArrayRef)v14);
        a3 = (char *)(Value - 1);
        if (Value < 1) {
          return 0;
        }
      }
      else
      {
        a3 = 0;
      }
      CFStringRef v14 = 0;
    }
    else
    {
      a3 = 0;
    }
  }
  int v16 = a3 + 1;
  while (1)
  {
    uint64_t Value = (uint64_t)TuningPListMgr::getEffect((TuningPListMgr *)Value, v13, (CFIndex)v14);
    if (Value)
    {
      uint64_t Value = (uint64_t)TuningPListMgr::getUnitByTuple((TuningPListMgr *)Value, (CFArrayRef)Value, a4, a5, a6, a7);
      if (Value) {
        break;
      }
    }
    if (v16 == ++v14) {
      return 0;
    }
  }

  return TuningPListMgr::getAUPresetFromUnit((TuningPListMgr *)Value, (CFDictionaryRef)Value);
}

const void *TuningPListMgr::getAUPresetAndBypassStateByTuple(TuningPListMgr *this, const char *a2, uint64_t a3, unsigned int a4, unsigned int a5, int a6, int a7, unsigned int *a8)
{
  uint64_t Value = (uint64_t)TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (!Value) {
    return 0;
  }
  CFDictionaryRef v15 = (const __CFDictionary *)Value;
  int v16 = (char *)a3;
  if (a3 == -1)
  {
    uint64_t Value = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)Value, @"strips");
    int v16 = (char *)Value;
    if (!Value)
    {
      a3 = 0;
      goto LABEL_10;
    }
    CFTypeID TypeID = CFArrayGetTypeID();
    uint64_t Value = CFGetTypeID(v16);
    if (TypeID == Value)
    {
      uint64_t Value = CFArrayGetCount((CFArrayRef)v16);
      a3 = Value - 1;
      if (Value < 1) {
        return 0;
      }
    }
    else
    {
      a3 = 0;
    }
    int v16 = 0;
  }
LABEL_10:
  while (1)
  {
    uint64_t Value = (uint64_t)TuningPListMgr::getEffect((TuningPListMgr *)Value, v15, (CFIndex)v16);
    if (Value)
    {
      uint64_t Value = (uint64_t)TuningPListMgr::getUnitByTuple((TuningPListMgr *)Value, (CFArrayRef)Value, a4, a5, a6, a7);
      if (Value) {
        break;
      }
    }
    if ((char *)(a3 + 1) == ++v16) {
      return 0;
    }
  }
  CFDictionaryRef v19 = (const __CFDictionary *)Value;
  CFDictionaryRef AUPresetFromUnit = TuningPListMgr::getAUPresetFromUnit((TuningPListMgr *)Value, (CFDictionaryRef)Value);
  unsigned int v25 = 0;
  uint64_t v21 = (TuningPListMgr *)CFDictionaryGetValue(v19, @"bypass");
  BOOL UInt32 = TuningPListMgr::cfGetUInt32_(v21, &v25, v22);
  unsigned int v24 = v25;
  if (!UInt32) {
    unsigned int v24 = 0;
  }
  *a8 = v24;
  return AUPresetFromUnit;
}

const void *TuningPListMgr::getAUPresetByName(TuningPListMgr *this, const char *a2, char *a3, const char *a4)
{
  uint64_t Value = (uint64_t)TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (!Value) {
    return 0;
  }
  CFDictionaryRef v7 = (const __CFDictionary *)Value;
  CFStringRef v8 = a3;
  if (a3 == (char *)-1)
  {
    uint64_t Value = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)Value, @"strips");
    CFStringRef v8 = (char *)Value;
    if (Value)
    {
      CFTypeID TypeID = CFArrayGetTypeID();
      uint64_t Value = CFGetTypeID(v8);
      if (TypeID == Value)
      {
        uint64_t Value = CFArrayGetCount((CFArrayRef)v8);
        a3 = (char *)(Value - 1);
        if (Value < 1) {
          return 0;
        }
      }
      else
      {
        a3 = 0;
      }
      CFStringRef v8 = 0;
    }
    else
    {
      a3 = 0;
    }
  }
  CFTypeID v10 = a3 + 1;
  while (1)
  {
    uint64_t Value = (uint64_t)TuningPListMgr::getEffect((TuningPListMgr *)Value, v7, (CFIndex)v8);
    if (Value)
    {
      uint64_t Value = (uint64_t)TuningPListMgr::getUnitByName((TuningPListMgr *)Value, (CFArrayRef)Value, a4);
      if (Value) {
        break;
      }
    }
    if (v10 == ++v8) {
      return 0;
    }
  }

  return TuningPListMgr::getAUPresetFromUnit((TuningPListMgr *)Value, (CFDictionaryRef)Value);
}

const void *TuningPListMgr::getAUPresetByName(TuningPListMgr *this, const char *a2)
{
  return TuningPListMgr::lookupPlist_((uint64_t)this, a2, 1);
}

const void *TuningPListMgr::getAUPListByName(TuningPListMgr *this, const char *a2)
{
  return TuningPListMgr::lookupPlist_((uint64_t)this, a2, 2);
}

const void *TuningPListMgr::getPropertyStripByName(TuningPListMgr *this, const char *a2)
{
  return TuningPListMgr::lookupPlist_((uint64_t)this, a2, 3);
}

const void *TuningPListMgr::getAUPresetAndBypassStateByName(TuningPListMgr *this, const char *a2, uint64_t a3, const char *a4, unsigned int *a5)
{
  *a5 = 0;
  uint64_t Value = (uint64_t)TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (!Value) {
    return 0;
  }
  CFDictionaryRef v9 = (const __CFDictionary *)Value;
  CFTypeID v10 = (char *)a3;
  if (a3 == -1)
  {
    uint64_t Value = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)Value, @"strips");
    CFTypeID v10 = (char *)Value;
    if (!Value)
    {
      a3 = 0;
      goto LABEL_10;
    }
    CFTypeID TypeID = CFArrayGetTypeID();
    uint64_t Value = CFGetTypeID(v10);
    if (TypeID == Value)
    {
      uint64_t Value = CFArrayGetCount((CFArrayRef)v10);
      a3 = Value - 1;
      if (Value < 1) {
        return 0;
      }
    }
    else
    {
      a3 = 0;
    }
    CFTypeID v10 = 0;
  }
LABEL_10:
  while (1)
  {
    uint64_t Value = (uint64_t)TuningPListMgr::getEffect((TuningPListMgr *)Value, v9, (CFIndex)v10);
    if (Value)
    {
      uint64_t Value = (uint64_t)TuningPListMgr::getUnitByName((TuningPListMgr *)Value, (CFArrayRef)Value, a4);
      if (Value) {
        break;
      }
    }
    if ((char *)(a3 + 1) == ++v10) {
      return 0;
    }
  }
  CFDictionaryRef v13 = (const __CFDictionary *)Value;
  CFDictionaryRef AUPresetFromUnit = TuningPListMgr::getAUPresetFromUnit((TuningPListMgr *)Value, (CFDictionaryRef)Value);
  unsigned int v19 = 0;
  CFDictionaryRef v15 = (TuningPListMgr *)CFDictionaryGetValue(v13, @"bypass");
  BOOL UInt32 = TuningPListMgr::cfGetUInt32_(v15, &v19, v16);
  unsigned int v18 = v19;
  if (!UInt32) {
    unsigned int v18 = 0;
  }
  *a5 = v18;
  return AUPresetFromUnit;
}

uint64_t TuningPListMgr::addAUPresetByNumber(TuningPListMgr *this, const char *a2, CFIndex Count, const __CFDictionary *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t result = (uint64_t)TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (!result) {
    return result;
  }
  CFArrayRef Effect = (const __CFArray *)TuningPListMgr::getEffect((TuningPListMgr *)result, (CFDictionaryRef)result, 0);
  if (!Effect)
  {
    CFDictionaryRef v9 = (NSObject **)logSubsystem();
    if (v9)
    {
      CFTypeID v10 = *v9;
      if (!*v9) {
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      CFTypeID v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315650;
      CFIndex v12 = "TuningPListMgr.cpp";
      __int16 v13 = 1024;
      int v14 = 869;
      __int16 v15 = 1024;
      int v16 = Count;
      _os_log_impl(&dword_1ABAC8000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d cannot add preset at the index: %d", (uint8_t *)&v11, 0x18u);
    }
    return 0xFFFFFFFFLL;
  }
  CFStringRef v8 = Effect;
  if (Count == -1) {
    CFIndex Count = CFArrayGetCount(Effect);
  }
  CFArrayInsertValueAtIndex(v8, Count, a4);
  return 0;
}

uint64_t TuningPListMgr::removeAUPresetByName(TuningPListMgr *this, const char *a2, const __CFString *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t result = (uint64_t)TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (result)
  {
    CFArrayRef Effect = (TuningPListMgr *)TuningPListMgr::getEffect((TuningPListMgr *)result, (CFDictionaryRef)result, 0);
    if (Effect)
    {
      CFIndex v6 = Effect;
      CFIndex UnitIndexByName = TuningPListMgr::getUnitIndexByName(Effect, Effect, a3);
      if ((UnitIndexByName & 0x8000000000000000) == 0)
      {
        CFIndex v8 = UnitIndexByName;
        if (UnitIndexByName <= CFArrayGetCount(v6))
        {
          CFArrayRemoveValueAtIndex(v6, v8);
          return 0;
        }
      }
      return 0xFFFFFFFFLL;
    }
    CFDictionaryRef v9 = (NSObject **)logSubsystem();
    if (v9)
    {
      CFTypeID v10 = *v9;
      if (!*v9) {
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      CFTypeID v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      CFIndex v12 = "TuningPListMgr.cpp";
      __int16 v13 = 1024;
      int v14 = 898;
      _os_log_impl(&dword_1ABAC8000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot get the effects array", (uint8_t *)&v11, 0x12u);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t TuningPListMgr::replaceAUPresetByNumber(TuningPListMgr *this, const char *a2, CFIndex a3, const __CFDictionary *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t result = (uint64_t)TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (!result) {
    return result;
  }
  CFArrayRef Effect = (TuningPListMgr *)TuningPListMgr::getEffect((TuningPListMgr *)result, (CFDictionaryRef)result, 0);
  if (!Effect)
  {
    CFIndex v8 = (NSObject **)logSubsystem();
    if (v8)
    {
      CFDictionaryRef v9 = *v8;
      if (!*v8) {
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      CFDictionaryRef v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315650;
      int v11 = "TuningPListMgr.cpp";
      __int16 v12 = 1024;
      int v13 = 928;
      __int16 v14 = 1024;
      int v15 = a3;
      _os_log_impl(&dword_1ABAC8000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d cannot get au by index: %d", (uint8_t *)&v10, 0x18u);
    }
    return 0xFFFFFFFFLL;
  }
  uint64_t result = (uint64_t)TuningPListMgr::getUnitByNumber(Effect, Effect, a3);
  if (result)
  {
    return TuningPListMgr::_replaceAUPreset((TuningPListMgr *)result, (__CFDictionary *)result, a4);
  }
  return result;
}

uint64_t TuningPListMgr::replaceAUPresetByTuple(TuningPListMgr *this, const char *a2, unsigned int a3, unsigned int a4, unsigned int a5, int a6, const __CFDictionary *a7)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t result = (uint64_t)TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (!result) {
    return result;
  }
  CFArrayRef Effect = (TuningPListMgr *)TuningPListMgr::getEffect((TuningPListMgr *)result, (CFDictionaryRef)result, 0);
  if (!Effect)
  {
    __int16 v14 = (NSObject **)logSubsystem();
    if (v14)
    {
      int v15 = *v14;
      if (!*v14) {
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      int v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v18, a3);
      CAX4CCString::CAX4CCString((CAX4CCString *)v17, a4);
      CAX4CCString::CAX4CCString((CAX4CCString *)v16, a5);
      *(_DWORD *)std::string buf = 136316162;
      int v20 = "TuningPListMgr.cpp";
      __int16 v21 = 1024;
      int v22 = 958;
      __int16 v23 = 2080;
      unsigned int v24 = v18;
      __int16 v25 = 2080;
      __int16 v26 = v17;
      __int16 v27 = 2080;
      int v28 = v16;
      _os_log_impl(&dword_1ABAC8000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d cannot get au by tuple: %s-%s-%s", buf, 0x30u);
    }
    return 0xFFFFFFFFLL;
  }
  uint64_t result = (uint64_t)TuningPListMgr::getUnitByTuple(Effect, Effect, a5, a3, a4, a6);
  if (result)
  {
    return TuningPListMgr::_replaceAUPreset((TuningPListMgr *)result, (__CFDictionary *)result, a7);
  }
  return result;
}

uint64_t TuningPListMgr::replaceAUPresetByName(TuningPListMgr *this, const char *a2, const char *a3, const __CFDictionary *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t result = (uint64_t)TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (!result) {
    return result;
  }
  CFArrayRef Effect = (TuningPListMgr *)TuningPListMgr::getEffect((TuningPListMgr *)result, (CFDictionaryRef)result, 0);
  if (!Effect)
  {
    CFIndex v8 = (NSObject **)logSubsystem();
    if (v8)
    {
      CFDictionaryRef v9 = *v8;
      if (!*v8) {
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      CFDictionaryRef v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315650;
      int v11 = "TuningPListMgr.cpp";
      __int16 v12 = 1024;
      int v13 = 989;
      __int16 v14 = 2080;
      int v15 = a3;
      _os_log_impl(&dword_1ABAC8000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d cannot get au by name: %s", (uint8_t *)&v10, 0x1Cu);
    }
    return 0xFFFFFFFFLL;
  }
  uint64_t result = (uint64_t)TuningPListMgr::getUnitByName(Effect, Effect, a3);
  if (result)
  {
    return TuningPListMgr::_replaceAUPreset((TuningPListMgr *)result, (__CFDictionary *)result, a4);
  }
  return result;
}

uint64_t TuningPListMgr::flushTuning(TuningPListMgr *this, const char *a2, const char *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 512);
  CFDictionaryRef v7 = (const __CFDictionary *)TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (!v7)
  {
    int v11 = (NSObject **)logSubsystem();
    if (v11)
    {
      __int16 v12 = *v11;
      if (!*v11)
      {
LABEL_18:
        uint64_t v10 = 0xFFFFFFFFLL;
        goto LABEL_19;
      }
    }
    else
    {
      __int16 v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = "TuningPListMgr.cpp";
      __int16 v19 = 1024;
      int v20 = 1010;
      _os_log_impl(&dword_1ABAC8000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d cannot get strip data", buf, 0x12u);
    }
    goto LABEL_18;
  }
  CFDictionaryRef v8 = v7;
  *(void *)std::string buf = CFStringCreateWithCString(0, a3, 0x600u);
  buf[8] = 1;
  BOOL v9 = TuningPListMgr::savePlistFile_(*(TuningPListMgr **)buf, *(const __CFString **)buf, v8, Mutable);
  CACFString::~CACFString((CACFString *)buf);
  if (!v9)
  {
    int v13 = (NSObject **)logSubsystem();
    if (v13)
    {
      __int16 v14 = *v13;
      if (!*v13)
      {
LABEL_16:
        if (Mutable)
        {
          int v15 = (FILE *)*MEMORY[0x1E4F143C8];
          CStringPtr = CFStringGetCStringPtr(Mutable, 0);
          fprintf(v15, "errorString: %s\n", CStringPtr);
        }
        goto LABEL_18;
      }
    }
    else
    {
      __int16 v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = "TuningPListMgr.cpp";
      __int16 v19 = 1024;
      int v20 = 1017;
      _os_log_impl(&dword_1ABAC8000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d error writing xml data to file", buf, 0x12u);
    }
    goto LABEL_16;
  }
  uint64_t v10 = 0;
LABEL_19:
  CFRelease(Mutable);
  return v10;
}

void sub_1ABAD71F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  CACFString::~CACFString((CACFString *)va);
  _Unwind_Resume(a1);
}

BOOL TuningPListMgr::savePlistFile_(TuningPListMgr *this, const __CFString *a2, const __CFDictionary *a3, __CFString *a4)
{
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFURLRef v8 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, kCFURLPOSIXPathStyle, 0);
  if (!v8)
  {
    BOOL v11 = 0;
LABEL_6:
    if (!a4) {
      return v11;
    }
    goto LABEL_10;
  }
  CFURLRef v9 = v8;
  uint64_t v10 = CFWriteStreamCreateWithFile(v7, v8);
  BOOL v11 = v10 != 0;
  CFRelease(v9);
  if (!v10) {
    goto LABEL_6;
  }
  if (CFWriteStreamOpen(v10)) {
    BOOL v11 = CFPropertyListWrite(a3, v10, kCFPropertyListXMLFormat_v1_0, 0, 0) != 0;
  }
  else {
    BOOL v11 = 0;
  }
  CFWriteStreamClose(v10);
  CFRelease(v10);
  if (a4)
  {
LABEL_10:
    if (!v11)
    {
      CFStringAppend(a4, @"Error saving plist file ");
      CFStringAppend(a4, a2);
      CFStringAppend(a4, @"\n");
    }
  }
  return v11;
}

uint64_t TuningPListMgr::changeStripName(TuningPListMgr *this, const char *a2, const char *a3)
{
  uint64_t v4 = (__CFDictionary *)TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  size_t v5 = strlen(a3);
  if (a3)
  {
    a3 = (const char *)CFStringCreateWithBytes(0, (const UInt8 *)a3, v5, 0x8000100u, 0);
    if (!a3)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Could not construct");
    }
  }
  for (uint64_t i = 0; i != 2; ++i)
    CFDictionaryReplaceValue(v4, kLegacyStripNameKeys[i], a3);
  if (a3) {
    CFRelease(a3);
  }
  return 0;
}

void sub_1ABAD73FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

void applesauce::CF::StringRef::~StringRef(const void **this)
{
  char v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t PListLogger::vlog(PListLogger *this, const char *a2, va_list a3)
{
  return vdprintf(*(_DWORD *)this, a2, a3);
}

void PListLogger::logArrayEntry(const __CFString *this, const void *a2, PListLogger *a3, void *a4)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  snprintf(__str, 0x10uLL, "[%u]", a2);
  PListLogger::logItemEntry(this, __str, a3, v6);
}

float CACFNumber::GetFixed32(const __CFNumber **this)
{
  int valuePtr = 0;
  CFNumberRef v1 = *this;
  if (v1)
  {
    CFNumberGetValue(v1, kCFNumberSInt32Type, &valuePtr);
    int v2 = valuePtr;
    float v3 = 1.0;
    if (valuePtr < 0) {
      float v3 = -1.0;
    }
  }
  else
  {
    int v2 = 0;
    float v3 = 1.0;
  }
  return v3
       * (float)((float)((float)(unsigned __int16)(v2 * (int)v3) * 0.000015259)
               + (float)(((v2 * (int)v3) >> 16) & 0x7FFF));
}

double CACFNumber::GetFixed64(const __CFNumber **this)
{
  uint64_t valuePtr = 0;
  CFNumberRef v1 = *this;
  if (v1)
  {
    CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
    uint64_t v2 = valuePtr;
    double v3 = 1.0;
    if (valuePtr < 0) {
      double v3 = -1.0;
    }
  }
  else
  {
    uint64_t v2 = 0;
    double v3 = 1.0;
  }
  return v3
       * ((double)(v2 * (uint64_t)v3) * 2.32830644e-10
        + (double)(((unint64_t)(v2 * (uint64_t)v3) >> 32) & 0x7FFFFFFF));
}

void CACFNumber::PrintToLog(CACFNumber *this, const __CFNumber *a2)
{
  LODWORD(v2) = a2;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  CFNumberType Type = CFNumberGetType(this);
  if (v2)
  {
    uint64_t v2 = v2;
    memset(__b, 9, v2);
  }
  else
  {
    uint64_t v2 = 0;
  }
  __b[v2] = 0;
  switch(Type)
  {
    case kCFNumberSInt8Type:
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315906;
        uint64_t v10 = "CACFNumber.cpp";
        __int16 v11 = 1024;
        int v12 = 62;
        __int16 v13 = 2080;
        __int16 v14 = __b;
        __int16 v15 = 1024;
        LODWORD(v16) = SLOBYTE(valuePtr);
        size_t v5 = MEMORY[0x1E4F14500];
        CFIndex v6 = "%25s:%-5d  %s%i";
        goto LABEL_15;
      }
      break;
    case kCFNumberSInt16Type:
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315906;
        uint64_t v10 = "CACFNumber.cpp";
        __int16 v11 = 1024;
        int v12 = 70;
        __int16 v13 = 2080;
        __int16 v14 = __b;
        __int16 v15 = 1024;
        LODWORD(v16) = SLOWORD(valuePtr);
        size_t v5 = MEMORY[0x1E4F14500];
        CFIndex v6 = "%25s:%-5d  %s%i";
        goto LABEL_15;
      }
      break;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      CFNumberGetValue(this, kCFNumberSInt64Type, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315906;
        uint64_t v10 = "CACFNumber.cpp";
        __int16 v11 = 1024;
        int v12 = 86;
        __int16 v13 = 2080;
        __int16 v14 = __b;
        __int16 v15 = 2048;
        double v16 = valuePtr;
        size_t v5 = MEMORY[0x1E4F14500];
        CFIndex v6 = "%25s:%-5d  %s%lli";
        goto LABEL_24;
      }
      break;
    case kCFNumberFloat32Type:
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315906;
        uint64_t v10 = "CACFNumber.cpp";
        __int16 v11 = 1024;
        int v12 = 94;
        __int16 v13 = 2080;
        __int16 v14 = __b;
        __int16 v15 = 2048;
        double v16 = *(float *)&valuePtr;
        size_t v5 = MEMORY[0x1E4F14500];
        CFIndex v6 = "%25s:%-5d  %s%f";
        goto LABEL_24;
      }
      break;
    case kCFNumberFloat64Type:
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315906;
        uint64_t v10 = "CACFNumber.cpp";
        __int16 v11 = 1024;
        int v12 = 102;
        __int16 v13 = 2080;
        __int16 v14 = __b;
        __int16 v15 = 2048;
        double v16 = valuePtr;
        size_t v5 = MEMORY[0x1E4F14500];
        CFIndex v6 = "%25s:%-5d  %s%f";
        goto LABEL_24;
      }
      break;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      CFNumberGetValue(this, kCFNumberLongType, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315906;
        uint64_t v10 = "CACFNumber.cpp";
        __int16 v11 = 1024;
        int v12 = 109;
        __int16 v13 = 2080;
        __int16 v14 = __b;
        __int16 v15 = 2048;
        double v16 = valuePtr;
        size_t v5 = MEMORY[0x1E4F14500];
        CFIndex v6 = "%25s:%-5d  %s%li";
        goto LABEL_24;
      }
      break;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      CFNumberGetValue(this, kCFNumberLongLongType, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315906;
        uint64_t v10 = "CACFNumber.cpp";
        __int16 v11 = 1024;
        int v12 = 116;
        __int16 v13 = 2080;
        __int16 v14 = __b;
        __int16 v15 = 2048;
        double v16 = valuePtr;
        size_t v5 = MEMORY[0x1E4F14500];
        CFIndex v6 = "%25s:%-5d  %s%lli";
        goto LABEL_24;
      }
      break;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      CFNumberGetValue(this, kCFNumberCFIndexType, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315906;
        uint64_t v10 = "CACFNumber.cpp";
        __int16 v11 = 1024;
        int v12 = 123;
        __int16 v13 = 2080;
        __int16 v14 = __b;
        __int16 v15 = 2048;
        double v16 = valuePtr;
        size_t v5 = MEMORY[0x1E4F14500];
        CFIndex v6 = "%25s:%-5d  %s%li";
LABEL_24:
        uint32_t v7 = 38;
        goto LABEL_25;
      }
      break;
    default:
      LODWORD(valuePtr) = 0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315906;
        uint64_t v10 = "CACFNumber.cpp";
        __int16 v11 = 1024;
        int v12 = 79;
        __int16 v13 = 2080;
        __int16 v14 = __b;
        __int16 v15 = 1024;
        LODWORD(v16) = LODWORD(valuePtr);
        size_t v5 = MEMORY[0x1E4F14500];
        CFIndex v6 = "%25s:%-5d  %s%i";
LABEL_15:
        uint32_t v7 = 34;
LABEL_25:
        _os_log_impl(&dword_1ABAC8000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, v7);
      }
      break;
  }
}

void CACFBoolean::PrintToLog(CACFBoolean *this, const __CFBoolean *a2)
{
  LODWORD(v2) = a2;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int Value = CFBooleanGetValue(this);
  if (v2)
  {
    uint64_t v2 = v2;
    memset(__b, 9, v2);
  }
  else
  {
    uint64_t v2 = 0;
  }
  __b[v2] = 0;
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  if (Value)
  {
    if (!v4) {
      return;
    }
    int v7 = 136315650;
    uint64_t v8 = "CACFNumber.cpp";
    __int16 v9 = 1024;
    int v10 = 143;
    __int16 v11 = 2080;
    int v12 = __b;
    size_t v5 = MEMORY[0x1E4F14500];
    CFIndex v6 = "%25s:%-5d  %strue";
  }
  else
  {
    if (!v4) {
      return;
    }
    int v7 = 136315650;
    uint64_t v8 = "CACFNumber.cpp";
    __int16 v9 = 1024;
    int v10 = 147;
    __int16 v11 = 2080;
    int v12 = __b;
    size_t v5 = MEMORY[0x1E4F14500];
    CFIndex v6 = "%25s:%-5d  %sfalse";
  }
  _os_log_impl(&dword_1ABAC8000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 0x1Cu);
}

void XPC_Service::ConnectionHandler(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(uint64_t))(*(void *)a1 + 16))(a1);
}

void sub_1ABAD7D9C(void *a1)
{
}

void sub_1ABAD7DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t non-virtual thunk to'CADeprecated::XMachServer::GetDebugName(CADeprecated::XMachServer *this)
{
  return *((void *)this - 9);
}

void non-virtual thunk to'CADeprecated::XMachServer::PortDied(CADeprecated::XMachServer *this, int a2)
{
}

void CADeprecated::XMachServer::PortDied(CADeprecated::XMachServer *this, int a2)
{
  size_t v5 = (char *)this + 112;
  uint64_t v4 = *((void *)this + 14);
  int v10 = (char *)this + 112;
  char v11 = (*(uint64_t (**)(char *))(v4 + 16))((char *)this + 112);
  int v7 = (uint64_t *)*((void *)v5 + 11);
  CFIndex v6 = (uint64_t *)*((void *)v5 + 12);
  while (1)
  {
    if (v7 == v6)
    {
      CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v10);
      return;
    }
    uint64_t v8 = *v7;
    if (*(_DWORD *)(*v7 + 12) == a2) {
      break;
    }
    ++v7;
  }
  uint64_t v9 = (char *)v6 - (char *)(v7 + 1);
  if (v6 != v7 + 1) {
    memmove(v7, v7 + 1, (char *)v6 - (char *)(v7 + 1));
  }
  *((void *)this + 26) = (char *)v7 + v9;
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v10);
  (*(void (**)(CADeprecated::XMachServer *, uint64_t))(*(void *)this + 32))(this, v8);
}

uint64_t CADeprecated::XMachServer::GetDebugName(CADeprecated::XMachServer *this)
{
  return *((void *)this + 1);
}

void std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  CFNumberRef v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t CADeprecated::XMachPortDeathListener::PortDeathListenerProc(CADeprecated::XMachPortDeathListener *this, const mach_dead_name_notification_t *a2, void *a3, CADeprecated::XMachPortDeathListener *a4, void *a5)
{
  return CADeprecated::XMachPortDeathListener::DispatchPortDeathMessage((uint64_t)a4, a2);
}

uint64_t CADeprecated::XRemoteMachServer::GetDebugName(CADeprecated::XRemoteMachServer *this)
{
  return *((void *)this + 4);
}

uint64_t CADeprecated::XRemoteMachServer::PortDied(CADeprecated::XRemoteMachServer *this, int a2)
{
  size_t v5 = (char *)this + 80;
  uint64_t v4 = *((void *)this + 10);
  char v11 = (char *)this + 80;
  char v12 = (*(uint64_t (**)(char *))(v4 + 16))((char *)this + 80);
  int v7 = (char *)*((void *)v5 - 3);
  CFIndex v6 = (char *)*((void *)v5 - 2);
  while (1)
  {
    if (v7 == v6) {
      goto LABEL_8;
    }
    if (*(_DWORD *)v7 == a2) {
      break;
    }
    v7 += 8;
  }
  uint64_t v8 = *((unsigned int *)v7 + 1);
  int64_t v9 = v6 - (v7 + 8);
  if (v6 != v7 + 8) {
    memmove(v7, v7 + 8, v6 - (v7 + 8));
  }
  *((void *)this + 8) = &v7[v9];
  if (!v8)
  {
LABEL_8:
    if (*((_DWORD *)this + 12) == a2) {
      uint64_t v8 = *((unsigned int *)this + 13);
    }
    else {
      uint64_t v8 = 0;
    }
  }
  *((void *)this + 6) = 0;
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v11);
  return (*(uint64_t (**)(CADeprecated::XRemoteMachServer *, uint64_t))(*(void *)this + 32))(this, v8);
}

void *CADeprecated::XMachPortDeathListener::XMachPortDeathListener(void *this)
{
  *this = &unk_1F0303350;
  this[1] = 0;
  this[2] = 0;
  this[3] = 0;
  return this;
}

void CADeprecated::XMachPortDeathListener::~XMachPortDeathListener(CADeprecated::XMachPortDeathListener *this)
{
  *(void *)this = &unk_1F0303350;
  uint64_t v2 = (const void *)*((void *)this + 2);
  if (v2) {
    CFRelease(v2);
  }
  id v3 = (const void *)*((void *)this + 3);
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
}

void CADeprecated::XMachPortDeathListener::SetDeathNotificationRunLoopAndMode(CADeprecated::XMachPortDeathListener *this, __CFRunLoop *a2, const __CFString *a3)
{
  if (!*((void *)this + 3))
  {
    PortDeathCFmach_port_t Port = CADeprecated::XMachPortDeathListener::GetPortDeathCFPort(this);
    *((void *)this + 3) = CFMachPortCreateRunLoopSource(0, PortDeathCFPort, 1);
  }
  operator new();
}

void sub_1ABAD821C(_Unwind_Exception *a1)
{
  MEMORY[0x1AD112B70](v1, 0xE1C405CB88AE7);
  _Unwind_Resume(a1);
}

void CADeprecated::XMachPortServicer::RunLoopImpl::~RunLoopImpl(CADeprecated::XMachPortServicer::RunLoopImpl *this)
{
  CADeprecated::XMachPortServicer::RunLoopImpl::~RunLoopImpl(this);

  JUMPOUT(0x1AD112B70);
}

{
  *(void *)this = &unk_1F03032D8;
  CFRunLoopRemoveSource(*((CFRunLoopRef *)this + 1), *((CFRunLoopSourceRef *)this + 3), *((CFRunLoopMode *)this + 2));
  CFRelease(*((CFTypeRef *)this + 1));
  CFRelease(*((CFTypeRef *)this + 2));
  CFRelease(*((CFTypeRef *)this + 3));
}

void CADeprecated::XMachPortDeathListener::SetDeathNotificationDispatchQueue(CADeprecated::XMachPortDeathListener *a1, dispatch_queue_t *a2)
{
  PortDeathCFmach_port_t Port = CADeprecated::XMachPortDeathListener::GetPortDeathCFPort(a1);
  mach_port_t Port = CFMachPortGetPort(PortDeathCFPort);
  dispatch_source_t v8 = dispatch_source_create(MEMORY[0x1E4F14458], Port, 0, *a2);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 0x40000000;
  handler[2] = ___ZN12CADeprecated22XMachPortDeathListener33SetDeathNotificationDispatchQueueERKN10applesauce8dispatch2v15queueE_block_invoke;
  handler[3] = &__block_descriptor_tmp;
  handler[4] = a1;
  mach_port_t v7 = Port;
  dispatch_source_set_event_handler(v8, handler);
  CADeprecated::XMachPortServicer::SetQueueAndSource();
}

void sub_1ABAD83B8(_Unwind_Exception *exception_object)
{
  if (v1) {
    dispatch_release(v1);
  }
  _Unwind_Resume(exception_object);
}

mach_port_name_t *CADeprecated::XMachPortSendRight::SetMachPort(mach_port_name_t *this, mach_port_name_t a2)
{
  id v3 = this;
  if (*this) {
    this = (mach_port_name_t *)mach_port_deallocate(*MEMORY[0x1E4F14960], *this);
  }
  *id v3 = a2;
  return this;
}

uint64_t CADeprecated::XMachServer::CreateServerPort(CADeprecated::XMachServer *this, const char *a2, kern_return_t *a3, int *a4)
{
  kern_return_t v8;
  kern_return_t v9;
  uint64_t v10;
  kern_return_t v11;
  char *v12;
  kern_return_t inserted;
  mach_port_t special_port[2];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  CADeprecated::XMachServer *v21;
  __int16 v22;
  kern_return_t v23;
  __int16 v24;
  char *v25;
  uint64_t v26;

  char v5 = (char)a2;
  __int16 v26 = *MEMORY[0x1E4F143B8];
  *(void *)special_port = 0;
  mach_port_t v7 = (ipc_space_t *)MEMORY[0x1E4F14960];
  dispatch_source_t v8 = task_get_special_port(*MEMORY[0x1E4F14960], 4, special_port);
  if (v8)
  {
    int64_t v9 = v8;
    goto LABEL_3;
  }
  if (v5)
  {
    char v11 = bootstrap_check_in(special_port[0], (const char *)this, &special_port[1]);
    if (!v11)
    {
      uint64_t inserted = mach_port_insert_right(*v7, special_port[1], special_port[1], 0x14u);
      int v10 = special_port[1];
      if (inserted | special_port[1]) {
        goto LABEL_16;
      }
      int64_t v9 = 0;
      if ((v5 & 2) == 0) {
        goto LABEL_3;
      }
LABEL_11:
      uint64_t inserted = mach_port_allocate(*v7, 1u, &special_port[1]);
      int v10 = special_port[1];
      if (!inserted)
      {
        int64_t v9 = mach_port_insert_right(*v7, special_port[1], special_port[1], 0x14u);
        int v10 = special_port[1];
        goto LABEL_17;
      }
LABEL_16:
      int64_t v9 = inserted;
      goto LABEL_17;
    }
    int64_t v9 = v11;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      char v12 = mach_error_string(v9);
      *(_DWORD *)std::string buf = 136316162;
      uint64_t v17 = "XMachServer.cpp";
      uint64_t v18 = 1024;
      __int16 v19 = 227;
      int v20 = 2080;
      uint64_t v21 = this;
      int v22 = 1024;
      __int16 v23 = v9;
      unsigned int v24 = 2080;
      __int16 v25 = v12;
      _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d bootstrap_check_in(%s) failed: 0x%x; %s",
        buf,
        0x2Cu);
    }
  }
  else
  {
    int64_t v9 = 0;
  }
  int v10 = special_port[1];
  if (special_port[1]) {
    goto LABEL_17;
  }
  if ((v5 & 2) != 0) {
    goto LABEL_11;
  }
LABEL_3:
  int v10 = 0;
LABEL_17:
  *a3 = v9;
  return v10;
}

uint64_t CADeprecated::XMachServer::XMachServer(uint64_t a1, long long *a2, CADeprecated::XMachServer *a3, const char *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  *(void *)a1 = &unk_1F03032B8;
  long long v7 = *a2;
  *(_OWORD *)(a1 + 24) = a2[1];
  *(_OWORD *)(a1 + 8) = v7;
  dispatch_source_t v8 = operator new(0x20uLL);
  v8[1] = 0;
  v8[2] = 0;
  *dispatch_source_t v8 = &unk_1F0303760;
  *((_DWORD *)v8 + 6) = 0;
  *(void *)(a1 + 4CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = v8 + 3;
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(unsigned char *)(a1 + 72) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(void *)a1 = &unk_1F0303240;
  *(void *)(a1 + 8CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = &unk_1F0303288;
  *(void *)(a1 + 88) = 0;
  CADeprecated::CAMutex::CAMutex((CADeprecated::CAMutex *)(a1 + 112), "XMachServer.mLock");
  *(void *)(a1 + 20CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 0;
  *(void *)(a1 + 208) = 0;
  *(void *)(a1 + 216) = 0;
  mach_error_t error_value = 0;
  int64_t v9 = *(atomic_uint **)(a1 + 40);
  unsigned int v11 = CADeprecated::XMachServer::CreateServerPort(a3, a4, &error_value, v10);
  CADeprecated::XMachReceivePort::SetMachPort(v9, v11);
  if (error_value)
  {
    mach_error_t v15 = error_value;
    __int16 v13 = mach_error_string(error_value);
    snprintf(__str, 0x200uLL, "XMachServer init for service %s failed: %s", (const char *)a3, v13);
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v17, v15);
      *(_DWORD *)std::string buf = 136315906;
      __int16 v19 = "XMachServer.cpp";
      __int16 v20 = 1024;
      int v21 = 262;
      __int16 v22 = 2080;
      __int16 v23 = v17;
      __int16 v24 = 2080;
      __int16 v25 = __str;
      _os_log_impl(&dword_1ABAC8000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
    }
    exception = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(exception, __str, v15);
  }
  return a1;
}

void sub_1ABAD8814(_Unwind_Exception *a1)
{
  CFIndex v6 = *v4;
  if (*v4)
  {
    *((void *)v1 + 26) = v6;
    operator delete(v6);
  }
  CADeprecated::CAMutex::~CAMutex(v3);
  CADeprecated::XMachPortDeathListener::~XMachPortDeathListener(v2);
  CADeprecated::XBasicMIGServer::~XBasicMIGServer(v1);
  _Unwind_Resume(a1);
}

void CAXException::CAXException(CAXException *this, const char *__s, int a3)
{
  *(void *)this = &unk_1F0303060;
  *((_DWORD *)this + 66) = a3;
  if (__s)
  {
    size_t v5 = strlen(__s);
    CFIndex v6 = (char *)this + 8;
    if (v5 < 0x100)
    {
      strlcpy(v6, __s, 0x100uLL);
    }
    else
    {
      long long v7 = *(_OWORD *)__s;
      long long v8 = *((_OWORD *)__s + 1);
      long long v9 = *((_OWORD *)__s + 3);
      *(_OWORD *)((char *)this + 4CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = *((_OWORD *)__s + 2);
      *(_OWORD *)((char *)this + 56) = v9;
      *(_OWORD *)CFIndex v6 = v7;
      *(_OWORD *)((char *)this + 24) = v8;
      long long v10 = *((_OWORD *)__s + 4);
      long long v11 = *((_OWORD *)__s + 5);
      long long v12 = *((_OWORD *)__s + 7);
      *(_OWORD *)((char *)this + 104) = *((_OWORD *)__s + 6);
      *(_OWORD *)((char *)this + 12CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = v12;
      *(_OWORD *)((char *)this + 72) = v10;
      *(_OWORD *)((char *)this + 88) = v11;
      long long v13 = *((_OWORD *)__s + 8);
      long long v14 = *((_OWORD *)__s + 9);
      long long v15 = *((_OWORD *)__s + 11);
      *(_OWORD *)((char *)this + 168) = *((_OWORD *)__s + 10);
      *(_OWORD *)((char *)this + 184) = v15;
      *(_OWORD *)((char *)this + 136) = v13;
      *(_OWORD *)((char *)this + 152) = v14;
      long long v16 = *((_OWORD *)__s + 12);
      long long v17 = *((_OWORD *)__s + 13);
      long long v18 = *((_OWORD *)__s + 14);
      *(_OWORD *)((char *)this + 247) = *(_OWORD *)(__s + 239);
      *(_OWORD *)((char *)this + 216) = v17;
      *(_OWORD *)((char *)this + 232) = v18;
      *(_OWORD *)((char *)this + 20CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = v16;
      *((unsigned char *)this + 263) = 0;
    }
  }
  else
  {
    *((unsigned char *)this + 8) = 0;
  }
}

void sub_1ABAD8934(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void CADeprecated::XBasicMIGServer::~XBasicMIGServer(CADeprecated::XBasicMIGServer *this)
{
  *(void *)this = &unk_1F03032B8;
  uint64_t v2 = (const void *)*((void *)this + 8);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *((void *)this + 7);
  *((void *)this + 7) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 6);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

{
  uint64_t vars8;

  CADeprecated::XBasicMIGServer::~XBasicMIGServer(this);

  JUMPOUT(0x1AD112B70);
}

void std::__shared_ptr_emplace<CADeprecated::XMachReceivePort>::__on_zero_shared(uint64_t a1)
{
}

void std::__shared_ptr_emplace<CADeprecated::XMachReceivePort>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F0303760;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1AD112B70);
}

void std::__shared_ptr_emplace<CADeprecated::XMachReceivePort>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F0303760;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void CADeprecated::XMachServer::DoForEachClient(uint64_t a1, void (*a2)(void, uint64_t), uint64_t a3)
{
  uint64_t v7 = a1 + 112;
  uint64_t v6 = *(void *)(a1 + 112);
  uint64_t v10 = a1 + 112;
  char v11 = (*(uint64_t (**)(uint64_t))(v6 + 16))(a1 + 112);
  long long v9 = *(void **)(v7 + 88);
  for (uint64_t i = *(void **)(v7 + 96); v9 != i; uint64_t i = *(void **)(a1 + 208))
    a2(*v9++, a3);
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v10);
}

void sub_1ABAD8B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

CADeprecated::XRemoteMachServer *CADeprecated::XRemoteMachServer::XRemoteMachServer(CADeprecated::XRemoteMachServer *this, const char *a2, const char *a3)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = a2;
  *(void *)this = &unk_1F0303318;
  *((void *)this + 5) = a3;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  CADeprecated::CAMutex::CAMutex((CADeprecated::XRemoteMachServer *)((char *)this + 80), "XRemoteMachServer.mLock");
  *((void *)this + 6) = 0;
  return this;
}

void sub_1ABAD8BB0(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;
  size_t v5 = *v3;
  if (*v3)
  {
    *((void *)v1 + 8) = v5;
    operator delete(v5);
  }
  CADeprecated::XMachPortDeathListener::~XMachPortDeathListener(v1);
  _Unwind_Resume(a1);
}

void CADeprecated::XRemoteMachServer::~XRemoteMachServer(CADeprecated::XRemoteMachServer *this)
{
  *(void *)this = &unk_1F0303318;
  CADeprecated::CAMutex::~CAMutex((CADeprecated::XRemoteMachServer *)((char *)this + 80));
  uint64_t v2 = (void *)*((void *)this + 7);
  if (v2)
  {
    *((void *)this + 8) = v2;
    operator delete(v2);
  }

  CADeprecated::XMachPortDeathListener::~XMachPortDeathListener(this);
}

void CADeprecated::XRemoteMachServer::SetServerPort(CADeprecated::XRemoteMachServer *this, mach_port_name_t a2, int a3)
{
  uint64_t v7 = (char *)this + 80;
  uint64_t v6 = *((void *)this + 10);
  __int16 v19 = (char *)this + 80;
  char v20 = (*(uint64_t (**)(char *))(v6 + 16))((char *)this + 80);
  *((_DWORD *)v7 - 8) = a2;
  *((_DWORD *)v7 - 7) = a3;
  if (a2)
  {
    long long v9 = (void *)*((void *)this + 8);
    unint64_t v8 = *((void *)this + 9);
    if ((unint64_t)v9 >= v8)
    {
      char v11 = (void *)*((void *)this + 7);
      uint64_t v12 = v9 - v11;
      unint64_t v13 = v12 + 1;
      if ((unint64_t)(v12 + 1) >> 61) {
        std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v14 = v8 - (void)v11;
      if (v14 >> 2 > v13) {
        unint64_t v13 = v14 >> 2;
      }
      if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v15 = v13;
      }
      if (v15)
      {
        if (v15 >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        long long v16 = (char *)operator new(8 * v15);
      }
      else
      {
        long long v16 = 0;
      }
      long long v17 = &v16[8 * v12];
      *(void *)long long v17 = *((void *)this + 6);
      uint64_t v10 = v17 + 8;
      if (v9 != v11)
      {
        do
        {
          uint64_t v18 = *--v9;
          *((void *)v17 - 1) = v18;
          v17 -= 8;
        }
        while (v9 != v11);
        long long v9 = (void *)*((void *)this + 7);
      }
      *((void *)this + 7) = v17;
      *((void *)this + 8) = v10;
      *((void *)this + 9) = &v16[8 * v15];
      if (v9) {
        operator delete(v9);
      }
    }
    else
    {
      *long long v9 = *((void *)this + 6);
      uint64_t v10 = v9 + 1;
    }
    *((void *)this + 8) = v10;
    CADeprecated::XMachPortDeathListener::RequestPortDeathNotification(this, a2);
  }
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v19);
}

void sub_1ABAD8D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void CADeprecated::RealtimeMessenger::RealtimeMessenger(CADeprecated::RealtimeMessenger *this)
{
  dispatch_object_t object = 0;
  CADeprecated::RealtimeMessenger::RealtimeMessenger((uint64_t)this, &object);
}

{
  dispatch_object_t object;

  dispatch_object_t object = 0;
  CADeprecated::RealtimeMessenger::RealtimeMessenger((uint64_t)this, &object);
}

void sub_1ABAD8DF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object)
{
  if (object) {
    dispatch_release(object);
  }
  _Unwind_Resume(exception_object);
}

void CADeprecated::RealtimeMessenger::RealtimeMessenger(uint64_t a1, dispatch_queue_t *a2)
{
  *(_DWORD *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  uint64_t v4 = (NSObject **)(a1 + 16);
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 4CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 0;
  *(void *)(a1 + 48) = 8;
  *(unsigned char *)(a1 + 64) = 0;
  MEMORY[0x1AD112A40](a1 + 72);
  CADeprecated::XMachReceivePort::CreateMachPort((atomic_uint *)a1, 0);
  if (!*a2)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    if (global_queue)
    {
      uint64_t v10 = global_queue;
      dispatch_retain(global_queue);
      char v11 = *a2;
      *a2 = v10;
      if (v11) {
        dispatch_release(v11);
      }
    }
    else
    {
      *a2 = 0;
    }
  }
  size_t v5 = dispatch_queue_create("RealtimeMessenger.mServiceQueue", 0);
  uint64_t v6 = *v4;
  *uint64_t v4 = v5;
  if (v6)
  {
    dispatch_release(v6);
    size_t v5 = *v4;
  }
  dispatch_set_target_queue(v5, *a2);
  uintptr_t explicit = atomic_load_explicit((atomic_uint *volatile)a1, memory_order_acquire);
  unint64_t v8 = dispatch_source_create(MEMORY[0x1E4F14458], explicit, 0, *(dispatch_queue_t *)(a1 + 16));
  v12[4] = a1;
  v12[5] = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 0x40000000;
  v12[2] = ___ZN12CADeprecated17RealtimeMessengerC2EN10applesauce8dispatch2v15queueE_block_invoke;
  v12[3] = &__block_descriptor_tmp_48;
  dispatch_source_set_event_handler(v8, v12);
  CADeprecated::XMachPortServicer::SetQueueAndSource();
}

void sub_1ABAD8F7C(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;
  if (v6) {
    dispatch_release(v6);
  }
  std::recursive_mutex::~recursive_mutex(v4);
  if (*v3) {
    dispatch_release(*v3);
  }
  uint64_t v8 = *v2;
  *uint64_t v2 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  CADeprecated::XMachReceivePort::~XMachReceivePort(v1);
  _Unwind_Resume(a1);
}

void ___ZN12CADeprecated17RealtimeMessengerC2EN10applesauce8dispatch2v15queueE_block_invoke(uint64_t a1)
{
}

void CADeprecated::RealtimeMessenger::ReceivePing(CADeprecated::RealtimeMessenger *this)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  msg.msgh_bits = 0;
  mach_port_t explicit = atomic_load_explicit((atomic_uint *volatile)this, memory_order_acquire);
  msg.mach_port_t msgh_remote_port = 0;
  msg.msgh_local_port = explicit;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 0;
  mach_msg(&msg, 2, 0, 0x2Cu, atomic_load_explicit((atomic_uint *volatile)this, memory_order_acquire), 0, 0);
  atomic_store(0, (unsigned __int8 *)this + 64);
  CADeprecated::RealtimeMessenger::_PerformPendingMessages(this);
}

void CADeprecated::RealtimeMessenger::_PerformPendingMessages(CADeprecated::RealtimeMessenger *this)
{
  uint64_t v2 = (std::recursive_mutex *)((char *)this + 72);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)this + 72));
  while (1)
  {
    uint64_t v3 = OSAtomicDequeue((OSQueueHead *)this + 2, *((void *)this + 6));
    if (!v3) {
      break;
    }
    v3[16] = 0;
    (*(void (**)(unsigned char *))(*(void *)v3 + 16))(v3);
  }

  std::recursive_mutex::unlock(v2);
}

void sub_1ABAD9118(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1ABAD9170(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object)
{
  if (object) {
    dispatch_release(object);
  }
  _Unwind_Resume(exception_object);
}

void CADeprecated::RealtimeMessenger::~RealtimeMessenger(CADeprecated::RealtimeMessenger *this)
{
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)((char *)this + 72));
  uint64_t v2 = *((void *)this + 2);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }

  CADeprecated::XMachReceivePort::~XMachReceivePort(this);
}

void CADeprecated::RealtimeMessenger::PerformAsync(uint64_t a1, unsigned char *__new)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (__new[16])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v4 = 136315650;
      *(void *)&v4[4] = "RealtimeMessenger.cpp";
      uint64_t v5 = 0x800000000490400;
      uint64_t v6 = __new;
      _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d RealtimeMessenger: trying to enqueue duplicate invocation on message %p", v4, 0x1Cu);
    }
  }
  else
  {
    __new[16] = 1;
    OSAtomicEnqueue((OSQueueHead *)(a1 + 32), __new, *(void *)(a1 + 48));
    if ((atomic_exchange((atomic_uchar *volatile)(a1 + 64), 1u) & 1) == 0)
    {
      *(void *)uint64_t v4 = 0x1C00000013;
      *(_DWORD *)&v4[8] = atomic_load_explicit((atomic_uint *volatile)a1, memory_order_acquire);
      uint64_t v6 = 0;
      uint64_t v5 = 0;
      mach_msg((mach_msg_header_t *)v4, 1, 0x1Cu, 0, 0, 0, 0);
    }
  }
}

void SincKernel::~SincKernel(void **this)
{
}

{
  free(*this);
}

double SincKernel::SincKernel(uint64_t *a1, uint64_t *a2)
{
  a1[4] = 0;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  return SincKernel::operator=(a1, a2);
}

{
  a1[4] = 0;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  return SincKernel::operator=(a1, a2);
}

double SincKernel::operator=(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  *a1 = *a2;
  *a2 = v2;
  LODWORD(v2) = *((_DWORD *)a1 + 2);
  *((_DWORD *)a1 + 2) = *((_DWORD *)a2 + 2);
  *((_DWORD *)a2 + 2) = v2;
  LODWORD(v2) = *((_DWORD *)a1 + 3);
  *((_DWORD *)a1 + 3) = *((_DWORD *)a2 + 3);
  *((_DWORD *)a2 + 3) = v2;
  LODWORD(v2) = *((_DWORD *)a1 + 4);
  *((_DWORD *)a1 + 4) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v2;
  LODWORD(v2) = *((_DWORD *)a1 + 5);
  *((_DWORD *)a1 + 5) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v2;
  uint64_t v3 = a1[3];
  a1[3] = a2[3];
  a2[3] = v3;
  double result = *((double *)a1 + 4);
  a1[4] = a2[4];
  *((double *)a2 + 4) = result;
  return result;
}

char *PlatformUtilities::ProcessName(PlatformUtilities *this)
{
  PlatformUtilities::processName(this, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  strlcpy(PlatformUtilities::ProcessName(int)::namebuf, (const char *)p_p, 0x20uLL);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return PlatformUtilities::ProcessName(int)::namebuf;
}

void sub_1ABAD94A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

__CFString *PlatformUtilities::CopyHardwareModelFullName(PlatformUtilities *this)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (Mutable)
  {
    long long v6 = 0u;
    long long v7 = 0u;
    *(_OWORD *)cStr = 0u;
    long long v5 = 0u;
    size_t v3 = 64;
    sysctlbyname("hw.model", cStr, &v3, 0, 0);
    CFStringAppendCString(Mutable, cStr, 0);
  }
  return Mutable;
}

__CFString *PlatformUtilities::CopyHardwareModelShortName(PlatformUtilities *this)
{
  uint64_t v1 = PlatformUtilities::CopyHardwareModelFullName(this);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v1);
  CFRelease(v2);
  PlatformUtilities_iOS::TrimHardwareModelShortName(MutableCopy, v4);
  return MutableCopy;
}

uint64_t CAIsDebuggerAttached(void)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(void *)uint64_t v4 = 0xE00000001;
  int v5 = 1;
  pid_t v6 = getpid();
  size_t v1 = 648;
  unsigned int v3 = 0;
  sysctl(v4, 4u, v2, &v1, 0, 0);
  return (v3 >> 11) & 1;
}

char *CAStringForOSType(unsigned int a1, char *__dst, size_t a3, int16x8_t a4)
{
  a4.i32[0] = bswap32(a1);
  *(int8x8_t *)a4.i8 = vzip1_s8(*(int8x8_t *)a4.i8, *(int8x8_t *)a4.i8);
  v5.i64[0] = 0x1F0000001FLL;
  v5.i64[1] = 0x1F0000001FLL;
  v6.i64[0] = 0x5F0000005FLL;
  v6.i64[1] = 0x5F0000005FLL;
  *(int8x8_t *)a4.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)vcgtq_u32(v6, (uint32x4_t)vsraq_n_s32(v5, vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)a4.i8), 0x18uLL), 0x18uLL))), *(int8x8_t *)a4.i8, (int8x8_t)0x2E002E002E002ELL);
  char v9 = 4;
  *(_DWORD *)__source = vmovn_s16(a4).u32[0];
  __source[4] = 0;
  strlcpy(__dst, __source, a3);
  if (v9 < 0) {
    operator delete(*(void **)__source);
  }
  return __dst;
}

void sub_1ABAD96F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

_DWORD *CAStreamBasicDescription::VirtualizeLinearPCMFormat(_DWORD *this, AudioStreamBasicDescription *a2)
{
  if (this[2] == 1819304813 && (this[3] & 0x40) == 0)
  {
    int v2 = 4 * this[7];
    this[3] = 9;
    this[4] = v2;
    this[5] = 1;
    this[6] = v2;
    this[8] = 32;
  }
  return this;
}

uint64_t CAStreamBasicDescription::VirtualizeLinearPCMFormat(uint64_t this, _DWORD *a2, AudioStreamBasicDescription *a3)
{
  if (a2[2] == 1819304813 && (a2[3] & 0x40) == 0)
  {
    if (this) {
      int v3 = 9;
    }
    else {
      int v3 = 11;
    }
    int v4 = 4 * a2[7];
    a2[3] = v3;
    a2[4] = v4;
    a2[5] = 1;
    a2[6] = v4;
    a2[8] = 32;
  }
  return this;
}

double CAStreamBasicDescription::ResetFormat(CAStreamBasicDescription *this, AudioStreamBasicDescription *a2)
{
  *((_DWORD *)this + 8) = 0;
  double result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  return result;
}

uint64_t CAStreamBasicDescription::FillOutFormat(uint64_t this, AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3)
{
  if (*(double *)this == 0.0) {
    *(Float64 *)this = a2->mSampleRate;
  }
  if (!*(_DWORD *)(this + 8)) {
    *(_DWORD *)(this + 8) = a2->mFormatID;
  }
  if (!*(_DWORD *)(this + 12)) {
    *(_DWORD *)(this + 12) = a2->mFormatFlags;
  }
  if (!*(_DWORD *)(this + 16)) {
    *(_DWORD *)(this + 16) = a2->mBytesPerPacket;
  }
  if (!*(_DWORD *)(this + 20)) {
    *(_DWORD *)(this + 2CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = a2->mFramesPerPacket;
  }
  if (!*(_DWORD *)(this + 24)) {
    *(_DWORD *)(this + 24) = a2->mBytesPerFrame;
  }
  if (!*(_DWORD *)(this + 28)) {
    *(_DWORD *)(this + 28) = a2->mChannelsPerFrame;
  }
  if (!*(_DWORD *)(this + 32)) {
    *(_DWORD *)(this + 32) = a2->mBitsPerChannel;
  }
  return this;
}

BOOL CAStreamBasicDescription::IsEqual(CAStreamBasicDescription *this, const AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3)
{
  double v3 = *(double *)this;
  if (a3)
  {
    if (v3 == 0.0 || (a2->mSampleRate != 0.0 ? (BOOL v4 = v3 == a2->mSampleRate) : (BOOL v4 = 1), v4))
    {
      int v5 = *((_DWORD *)this + 2);
      if (!v5 || (AudioFormatID mFormatID = a2->mFormatID) == 0 || v5 == mFormatID)
      {
        int v7 = *((_DWORD *)this + 4);
        if (!v7 || (UInt32 mBytesPerPacket = a2->mBytesPerPacket) == 0 || v7 == mBytesPerPacket)
        {
          int v9 = *((_DWORD *)this + 5);
          if (!v9 || (UInt32 mFramesPerPacket = a2->mFramesPerPacket) == 0 || v9 == mFramesPerPacket)
          {
            int v11 = *((_DWORD *)this + 6);
            if (!v11 || (UInt32 mBytesPerFrame = a2->mBytesPerFrame) == 0 || v11 == mBytesPerFrame)
            {
              int v13 = *((_DWORD *)this + 7);
              if (!v13 || (UInt32 mChannelsPerFrame = a2->mChannelsPerFrame) == 0 || v13 == mChannelsPerFrame)
              {
                int v15 = *((_DWORD *)this + 8);
                if (!v15) {
                  return CA::Implementation::EquivalentFormatFlags(this, a2, a3);
                }
                UInt32 mBitsPerChannel = a2->mBitsPerChannel;
                if (!mBitsPerChannel || v15 == mBitsPerChannel) {
                  return CA::Implementation::EquivalentFormatFlags(this, a2, a3);
                }
              }
            }
          }
        }
      }
    }
  }
  else if (v3 == a2->mSampleRate {
         && *((_DWORD *)this + 2) == a2->mFormatID
  }
         && *((_DWORD *)this + 3) == a2->mFormatFlags
         && *((_DWORD *)this + 4) == a2->mBytesPerPacket
         && *((_DWORD *)this + 5) == a2->mFramesPerPacket
         && *((_DWORD *)this + 6) == a2->mBytesPerFrame
         && *((_DWORD *)this + 7) == a2->mChannelsPerFrame)
  {
    return *((_DWORD *)this + 8) == a2->mBitsPerChannel;
  }
  return 0;
}

{
  int v4;
  AudioFormatID mFormatID;
  int v7;
  UInt32 mBytesPerPacket;
  int v9;
  UInt32 mFramesPerPacket;
  int v11;
  UInt32 mBytesPerFrame;
  int v13;
  UInt32 mChannelsPerFrame;
  int v15;
  UInt32 mBitsPerChannel;

  if (*(double *)this != 0.0 && a2->mSampleRate != 0.0 && *(double *)this != a2->mSampleRate) {
    return 0;
  }
  BOOL v4 = *((_DWORD *)this + 2);
  if (v4)
  {
    AudioFormatID mFormatID = a2->mFormatID;
    if (mFormatID && v4 != mFormatID) {
      return 0;
    }
  }
  int v7 = *((_DWORD *)this + 4);
  if (v7)
  {
    UInt32 mBytesPerPacket = a2->mBytesPerPacket;
    if (mBytesPerPacket)
    {
      if (v7 != mBytesPerPacket) {
        return 0;
      }
    }
  }
  int v9 = *((_DWORD *)this + 5);
  if (v9)
  {
    UInt32 mFramesPerPacket = a2->mFramesPerPacket;
    if (mFramesPerPacket)
    {
      if (v9 != mFramesPerPacket) {
        return 0;
      }
    }
  }
  int v11 = *((_DWORD *)this + 6);
  if (v11)
  {
    UInt32 mBytesPerFrame = a2->mBytesPerFrame;
    if (mBytesPerFrame)
    {
      if (v11 != mBytesPerFrame) {
        return 0;
      }
    }
  }
  int v13 = *((_DWORD *)this + 7);
  if (v13)
  {
    UInt32 mChannelsPerFrame = a2->mChannelsPerFrame;
    if (mChannelsPerFrame)
    {
      if (v13 != mChannelsPerFrame) {
        return 0;
      }
    }
  }
  int v15 = *((_DWORD *)this + 8);
  return (!v15 || (UInt32 mBitsPerChannel = a2->mBitsPerChannel) == 0 || v15 == mBitsPerChannel)
      && CA::Implementation::EquivalentFormatFlags(this, a2, a3);
}

BOOL CA::Implementation::EquivalentFormatFlags(CA::Implementation *this, const AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3)
{
  uint64_t v3 = *((void *)this + 1);
  long long v4 = *(_OWORD *)&a2->mFormatID;
  v5.i64[0] = *(void *)&a2->mFormatID;
  v5.i64[1] = v3;
  if (vmaxv_u16((uint16x4_t)vmovn_s32(vceqzq_s32(v5)))) {
    return 1;
  }
  unsigned int v7 = HIDWORD(*(void *)&a2->mFormatID);
  if (v3 != 1819304813) {
    return HIDWORD(v3) == DWORD1(v4);
  }
  if ((v3 & 0x7FFFFFFF00000000) != 0) {
    int v8 = HIDWORD(v3) & 0x7FFFFFFF;
  }
  else {
    int v8 = HIDWORD(v3);
  }
  unsigned int v9 = *((_DWORD *)this + 6);
  if (v9)
  {
    int v10 = *((_DWORD *)this + 7);
    if ((v3 & 0x2000000000) != 0) {
      unsigned int v11 = 1;
    }
    else {
      unsigned int v11 = *((_DWORD *)this + 7);
    }
    if (v11)
    {
      unsigned int v9 = 8 * (v9 / v11);
      unsigned int v12 = *((_DWORD *)this + 8);
      int v13 = v8 | 8;
      BOOL v14 = v9 == v12;
      goto LABEL_17;
    }
    unsigned int v9 = 0;
    unsigned int v12 = *((_DWORD *)this + 8);
    int v13 = v8 | 8;
  }
  else
  {
    int v13 = v8 | 8;
    int v10 = *((_DWORD *)this + 7);
    unsigned int v12 = *((_DWORD *)this + 8);
  }
  BOOL v14 = v12 == 0;
LABEL_17:
  if (v14) {
    int v8 = v13;
  }
  BOOL v16 = (v12 & 7) == 0 && v9 == v12;
  unsigned int v17 = v8 & 0xFFFFFFEF;
  if (!v16) {
    unsigned int v17 = v8;
  }
  if (v17) {
    v17 &= ~4u;
  }
  BOOL v18 = (v17 & 8) == 0 || v12 > 8;
  int v19 = v17 & 2;
  if (v18) {
    int v19 = v17;
  }
  if (v10 == 1) {
    unsigned int v20 = v19 & 0xFFFFFFDF;
  }
  else {
    unsigned int v20 = v19;
  }
  if (!v20) {
    unsigned int v20 = 0x80000000;
  }
  if (v4 != 1819304813) {
    return v20 == v7;
  }
  if ((DWORD1(v4) & 0x7FFFFFFF) != 0) {
    int v21 = DWORD1(v4) & 0x7FFFFFFF;
  }
  else {
    int v21 = HIDWORD(*(void *)&a2->mFormatID);
  }
  UInt32 mBytesPerFrame = a2->mBytesPerFrame;
  if (!mBytesPerFrame)
  {
    int v26 = v21 | 8;
    UInt32 mChannelsPerFrame = a2->mChannelsPerFrame;
    UInt32 mBitsPerChannel = a2->mBitsPerChannel;
LABEL_48:
    BOOL v27 = mBitsPerChannel == 0;
    goto LABEL_49;
  }
  UInt32 mChannelsPerFrame = a2->mChannelsPerFrame;
  if ((BYTE4(v4) & 0x20) != 0) {
    UInt32 v24 = 1;
  }
  else {
    UInt32 v24 = a2->mChannelsPerFrame;
  }
  if (!v24)
  {
    UInt32 mBytesPerFrame = 0;
    UInt32 mBitsPerChannel = a2->mBitsPerChannel;
    int v26 = v21 | 8;
    goto LABEL_48;
  }
  UInt32 mBytesPerFrame = 8 * (mBytesPerFrame / v24);
  UInt32 mBitsPerChannel = a2->mBitsPerChannel;
  int v26 = v21 | 8;
  BOOL v27 = mBytesPerFrame == mBitsPerChannel;
LABEL_49:
  if (v27) {
    int v21 = v26;
  }
  BOOL v28 = (mBitsPerChannel & 7) == 0 && mBytesPerFrame == mBitsPerChannel;
  unsigned int v29 = v21 & 0xFFFFFFEF;
  if (!v28) {
    unsigned int v29 = v21;
  }
  if (v29) {
    v29 &= ~4u;
  }
  BOOL v30 = (v29 & 8) == 0 || mBitsPerChannel > 8;
  unsigned int v7 = v29 & 2;
  if (v30) {
    unsigned int v7 = v29;
  }
  if (mChannelsPerFrame == 1) {
    v7 &= ~0x20u;
  }
  if (!v7) {
    unsigned int v7 = 0x80000000;
  }
  return v20 == v7;
}

uint64_t CAStreamBasicDescription::FromText(CAStreamBasicDescription *this, char *a2, AudioStreamBasicDescription *a3)
{
  if (*(unsigned char *)this == 45) {
    int32x4_t v5 = (CAStreamBasicDescription *)((char *)this + 1);
  }
  else {
    int32x4_t v5 = this;
  }
  int v6 = *(unsigned __int8 *)v5;
  if (v6 == 76)
  {
    uint64_t v7 = 2 * (*((unsigned char *)v5 + 1) == 69);
    int i = 12;
  }
  else
  {
    if (v6 != 66)
    {
      int i = 12;
      goto LABEL_12;
    }
    uint64_t v7 = 2 * (*((unsigned char *)v5 + 1) == 69);
    if (*((unsigned char *)v5 + 1) == 69) {
      int i = 14;
    }
    else {
      int i = 12;
    }
  }
  int32x4_t v5 = (CAStreamBasicDescription *)((char *)v5 + v7);
  int v6 = *(unsigned __int8 *)v5;
LABEL_12:
  unsigned int v9 = (FILE **)MEMORY[0x1E4F143C8];
  switch(v6)
  {
    case 'U':
      i &= 0xAu;
      int v10 = *((unsigned __int8 *)v5 + 1);
      int32x4_t v5 = (CAStreamBasicDescription *)((char *)v5 + 1);
      int v6 = v10;
      break;
    case 'F':
      int i = i & 0xFFFFFFFA | 1;
      goto LABEL_17;
    case 'I':
LABEL_17:
      unsigned int v12 = (CAStreamBasicDescription *)((char *)v5 + 1);
      int v11 = *((char *)v5 + 1);
      if (v11 < 0)
      {
        int v13 = 0;
      }
      else if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * *((unsigned __int8 *)v5 + 1) + 60) & 0x400) != 0)
      {
        int v13 = 0;
        unsigned int v12 = (CAStreamBasicDescription *)((char *)v5 + 2);
        while (1)
        {
          int v13 = 10 * v13 + v11 - 48;
          int v11 = *(char *)v12;
          if (v11 < 0) {
            break;
          }
          unsigned int v12 = (CAStreamBasicDescription *)((char *)v12 + 1);
          if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v11 + 60) & 0x400) == 0)
          {
            int32x4_t v5 = (CAStreamBasicDescription *)((char *)v12 - 2);
            unsigned int v12 = (CAStreamBasicDescription *)((char *)v12 - 1);
            goto LABEL_33;
          }
        }
      }
      else
      {
        int v13 = 0;
LABEL_33:
        if (v11 == 46)
        {
          int v20 = *((char *)v5 + 2);
          BOOL v18 = (CAStreamBasicDescription *)((char *)v5 + 2);
          unsigned __int8 v19 = v20;
          if (v20 < 0 || (*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v19 + 60) & 0x400) == 0)
          {
            int v21 = (FILE *)*MEMORY[0x1E4F143C8];
            __int16 v22 = "Expected fractional bits following '.'\n";
            size_t v23 = 39;
LABEL_37:
            fwrite(v22, v23, 1uLL, v21);
            goto LABEL_102;
          }
          int v27 = 0;
          unsigned int v12 = v18;
          while ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v19 + 60) & 0x400) != 0)
          {
            int v28 = *((char *)v12 + 1);
            unsigned int v12 = (CAStreamBasicDescription *)((char *)v12 + 1);
            LOBYTE(v11) = v28;
            int v27 = 10 * v27 + v19 - 48;
            unsigned __int8 v19 = v28;
            if (v28 < 0) {
              goto LABEL_49;
            }
          }
          LOBYTE(v11) = v19;
LABEL_49:
          v13 += v27;
          i |= v27 << 7;
        }
      }
      unsigned int v26 = 1819304813;
      unsigned int v24 = (v13 + 7) >> 3;
      if ((v13 & 7) != 0) {
        int i = i & 0xFFFFFFE7 | 0x10;
      }
      int v25 = 1;
      goto LABEL_53;
  }
  uint64_t v14 = 0;
  int __c = 538976288;
  int v15 = this;
  unsigned int v12 = this;
  while (1)
  {
    int v17 = *(unsigned __int8 *)v12;
    unsigned int v12 = (CAStreamBasicDescription *)((char *)v12 + 1);
    int v16 = v17;
    if (v17 == 92)
    {
      if (*(unsigned char *)v12 != 120) {
        return 0;
      }
      int v48 = 0;
      if (sscanf((const char *)v15 + 2, "%02X", &v48) != 1) {
        return 0;
      }
      *((unsigned char *)&__c + v14) = v48;
      unsigned int v12 = (CAStreamBasicDescription *)((char *)v15 + 4);
      goto LABEL_26;
    }
    *((unsigned char *)&__c + v14) = v16;
    if (!v16) {
      break;
    }
LABEL_26:
    ++v14;
    int v15 = v12;
    if (v14 == 4) {
      goto LABEL_41;
    }
  }
  if (v14 != 3) {
    return 0;
  }
  *((unsigned char *)&__c + v14) = 32;
  unsigned int v12 = v15;
LABEL_41:
  if (memchr("-@/#", SHIBYTE(__c), 5uLL))
  {
    HIBYTE(__c) = 32;
    unsigned int v12 = (CAStreamBasicDescription *)((char *)v12 - 1);
  }
  int i = 0;
  unsigned int v24 = 0;
  int v25 = 0;
  int v13 = 0;
  unsigned int v26 = bswap32(__c);
  LOBYTE(v11) = *(unsigned char *)v12;
LABEL_53:
  double v29 = 0.0;
  if (v11 != 64)
  {
LABEL_58:
    if (v11 == 47)
    {
      for (int i = 0; ; int i = (v33 + v32) | (16 * i))
      {
        unsigned int v12 = (CAStreamBasicDescription *)((char *)v12 + 1);
        int v32 = *(char *)v12;
        if ((v32 - 48) >= 0xA)
        {
          int v11 = *(unsigned __int8 *)v12;
          if ((v11 - 65) >= 6)
          {
            if ((v11 - 97) > 5) {
              break;
            }
            int v33 = -87;
          }
          else
          {
            int v33 = -55;
          }
        }
        else
        {
          int v33 = -48;
        }
      }
    }
    if (v11 == 35)
    {
      int v35 = *((char *)v12 + 1);
      unsigned int v12 = (CAStreamBasicDescription *)((char *)v12 + 1);
      unsigned __int8 v34 = v35;
      if (v35 < 0) {
        goto LABEL_101;
      }
      int v36 = v25;
      while ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v34 + 60) & 0x400) != 0)
      {
        int v36 = 10 * v36 + v34 - 48;
        int v37 = *((char *)v12 + 1);
        unsigned int v12 = (CAStreamBasicDescription *)((char *)v12 + 1);
        unsigned __int8 v34 = v37;
        if (v37 < 0) {
          goto LABEL_101;
        }
      }
    }
    else
    {
      unsigned __int8 v34 = v11;
      int v36 = v25;
    }
    if (v34 == 58)
    {
      i &= 0xFFFFFFE7;
      int v38 = *((unsigned __int8 *)v12 + 1);
      if (v38 != 76)
      {
        if (v38 != 72) {
          goto LABEL_102;
        }
        i |= 0x10u;
      }
      int v39 = *((char *)v12 + 2);
      unsigned int v12 = (CAStreamBasicDescription *)((char *)v12 + 2);
      unsigned __int8 v34 = v39;
      if (v39 < 0) {
        goto LABEL_101;
      }
      unsigned int v24 = 0;
      while ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v34 + 60) & 0x400) != 0)
      {
        int v40 = *((char *)v12 + 1);
        unsigned int v12 = (CAStreamBasicDescription *)((char *)v12 + 1);
        unsigned int v24 = 10 * v24 + v34 - 48;
        unsigned __int8 v34 = v40;
        if (v40 < 0) {
          goto LABEL_101;
        }
      }
    }
    if (v34 != 44) {
      goto LABEL_100;
    }
    __int16 v41 = (char *)v12 + 1;
    int v42 = *((unsigned __int8 *)v12 + 1);
    if ((*((char *)v12 + 1) & 0x80000000) == 0
      && (*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * *((unsigned __int8 *)v12 + 1) + 60) & 0x400) != 0)
    {
      int v25 = 0;
      __int16 v43 = (char *)v12 + 2;
      do
      {
        __int16 v41 = v43;
        int v25 = v42 + 10 * v25 - 48;
        int v44 = *v43;
        int v42 = v44;
        if (v44 < 0) {
          break;
        }
        int v45 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v44 + 60);
        __int16 v43 = v41 + 1;
      }
      while ((v45 & 0x400) != 0);
      unsigned int v12 = (CAStreamBasicDescription *)(v41 - 1);
    }
    else
    {
      int v25 = 0;
    }
    if (v42 == 73)
    {
      __int16 v41 = (char *)v12 + 2;
    }
    else if (v42 == 68)
    {
      if (v26 != 1819304813)
      {
        int v21 = *v9;
        __int16 v22 = "non-interleaved flag invalid for non-PCM formats\n";
        size_t v23 = 49;
        goto LABEL_37;
      }
      unsigned int v12 = (CAStreamBasicDescription *)((char *)v12 + 2);
      i |= 0x20u;
LABEL_100:
      if (*(unsigned char *)v12) {
        goto LABEL_101;
      }
      *(double *)a2 = v29;
      *((_DWORD *)a2 + 2) = v26;
      *((_DWORD *)a2 + 3) = i;
      *((_DWORD *)a2 + 4) = v24;
      *((_DWORD *)a2 + 5) = v36;
      *((_DWORD *)a2 + 6) = v24;
      *((_DWORD *)a2 + 7) = v25;
      uint64_t result = 1;
      *((_DWORD *)a2 + 8) = v13;
      *((_DWORD *)a2 + 9) = 0;
      return result;
    }
    if (v26 == 1819304813) {
      int v46 = v25;
    }
    else {
      int v46 = 1;
    }
    v24 *= v46;
    unsigned int v12 = (CAStreamBasicDescription *)v41;
    goto LABEL_100;
  }
  int v30 = *((char *)v12 + 1);
  unsigned int v12 = (CAStreamBasicDescription *)((char *)v12 + 1);
  LOBYTE(v11) = v30;
  if ((v30 & 0x80000000) == 0)
  {
    while ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v11 + 60) & 0x400) != 0)
    {
      double v29 = (double)(v11 - 48) + v29 * 10.0;
      int v31 = *((char *)v12 + 1);
      unsigned int v12 = (CAStreamBasicDescription *)((char *)v12 + 1);
      LOBYTE(v11) = v31;
      if (v31 < 0) {
        goto LABEL_101;
      }
    }
    goto LABEL_58;
  }
LABEL_101:
  fprintf(*v9, "extra characters at end of format string: %s\n", (const char *)v12);
LABEL_102:
  fprintf(*v9, "Invalid format string: %s\n", (const char *)this);
  fwrite("Syntax of format strings is: \n", 0x1EuLL, 1uLL, *v9);
  return 0;
}

const __CFString *CACFString::GetStringByteLength(const __CFString *this, const __CFString *a2)
{
  CFIndex usedBufLen = 0;
  if (this)
  {
    CFStringEncoding v2 = a2;
    CFStringRef v3 = this;
    v5.length = CFStringGetLength(this);
    v5.location = 0;
    CFStringGetBytes(v3, v5, v2, 0, 0, 0, 0x7FFFFFFFLL, &usedBufLen);
    return (const __CFString *)usedBufLen;
  }
  return this;
}

const __CFString *CACFString::GetCString(const __CFString *theString, __CFString *a2, char *a3, unsigned int *a4)
{
  if (*(_DWORD *)a3)
  {
    CFStringRef v6 = theString;
    if (theString)
    {
      CFStringEncoding v7 = a4;
      CFIndex usedBufLen = 0;
      v11.length = CFStringGetLength(theString);
      v11.location = 0;
      CFMutableStringRef theString = (const __CFString *)CFStringGetBytes(v6, v11, v7, 0, 0, (UInt8 *)a2, (*(_DWORD *)a3 - 1), &usedBufLen);
      int v8 = usedBufLen;
      *((unsigned char *)&a2->isa + usedBufLen) = 0;
      int v9 = v8 + 1;
    }
    else
    {
      LOBYTE(a2->isa) = 0;
      int v9 = 1;
    }
    *(_DWORD *)a3 = v9;
  }
  return theString;
}

void CACFString::GetUnicodeString(CFStringRef theString, __CFString *a2, unsigned __int16 *a3, unsigned int *a4)
{
  if (*(_DWORD *)a3)
  {
    if (theString)
    {
      CFIndex Length = CFStringGetLength(theString);
      if (*(_DWORD *)a3 >= Length) {
        CFIndex v8 = Length;
      }
      else {
        CFIndex v8 = *(unsigned int *)a3;
      }
      v9.location = 0;
      v9.length = v8;
      CFStringGetCharacters(theString, v9, (UniChar *)a2);
    }
    else
    {
      LODWORD(v8) = 0;
      LOWORD(a2->isa) = 0;
    }
    *(_DWORD *)a3 = v8;
  }
}

void CACFString::PrintToLog(const __CFString *this, const __CFString *a2)
{
  LODWORD(v2) = a2;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v13 = 0u;
  memset(__b, 0, sizeof(__b));
  if (CFStringGetCString(this, buffer, 512, 0x600u))
  {
    if (v2)
    {
      uint64_t v2 = v2;
      memset(__b, 9, v2);
    }
    else
    {
      uint64_t v2 = 0;
    }
    *((unsigned char *)__b + v2) = 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315906;
      long long v4 = "CACFString.cpp";
      __int16 v5 = 1024;
      int v6 = 81;
      __int16 v7 = 2080;
      CFIndex v8 = __b;
      __int16 v9 = 2080;
      int v10 = buffer;
      _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  %s%s", (uint8_t *)&v3, 0x26u);
    }
  }
}

void swix::message::~message(xpc_object_t *this)
{
  this[1] = 0;
}

void swix::decode_message::throw_error(NSObject *a1, int a2, std::string *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(a1, OS_LOG_TYPE_ERROR))
  {
    if ((a3->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int v6 = a3;
    }
    else {
      int v6 = (std::string *)a3->__r_.__value_.__r.__words[0];
    }
    int v8 = 136315138;
    __int16 v9 = v6;
    _os_log_error_impl(&dword_1ABAC8000, a1, OS_LOG_TYPE_ERROR, "throwing swix::exception: %s", (uint8_t *)&v8, 0xCu);
  }
  exception = (std::runtime_error *)__cxa_allocate_exception(0x18uLL);
  swix::exception::exception(exception, a2, a3);
}

void sub_1ABADA534(_Unwind_Exception *exception_object)
{
}

void gsl::narrowing_error::~narrowing_error(std::exception *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x1AD112B70);
}

std::runtime_error *swix::exception::exception(std::runtime_error *a1, int a2, std::string *a3)
{
  uint64_t result = std::runtime_error::runtime_error(a1, a3);
  result->__vftable = (std::runtime_error_vtbl *)&unk_1F03035A0;
  LODWORD(result[1].__vftable) = a2;
  return result;
}

void swix::exception::~exception(std::runtime_error *this)
{
  std::runtime_error::~runtime_error(this);

  JUMPOUT(0x1AD112B70);
}

uint64_t CATimeUtilities::GetCurrentGregorianDate(CATimeUtilities *this)
{
  double Current = CFAbsoluteTimeGetCurrent();

  return CATimeUtilities::GregorianDateFromAbsoluteTime(v1, Current);
}

uint64_t CATimeUtilities::GregorianDateFromAbsoluteTime(CATimeUtilities *this, CFAbsoluteTime a2)
{
  {
    CATimeUtilities::GregorianDateFromAbsoluteTime(double)::tz = (uint64_t)CFTimeZoneCopySystem();
  }
  CFTimeZoneRef v3 = (const __CFTimeZone *)CATimeUtilities::GregorianDateFromAbsoluteTime(double)::tz;

  return *(_OWORD *)&CFAbsoluteTimeGetGregorianDate(a2, v3);
}

void sub_1ABADA6B8(_Unwind_Exception *a1)
{
}

std::runtime_error *std::overflow_error::overflow_error[abi:ne180100](std::runtime_error *a1, const char *a2)
{
  uint64_t result = std::runtime_error::runtime_error(a1, a2);
  result->__vftable = (std::runtime_error_vtbl *)(MEMORY[0x1E4FBA4E0] + 16);
  return result;
}

void CAAudioChannelLayout::CAAudioChannelLayout(CAAudioChannelLayout *this, CAAudioChannelLayout::RefCountedLayout *a2, int a3)
{
  unsigned int v3 = a2;
  int v5 = 6553601;
  switch((int)a2)
  {
    case 1:
      goto LABEL_17;
    case 2:
      int v6 = 6619138;
      int v7 = 6946818;
      BOOL v8 = a3 == 0;
      goto LABEL_12;
    case 4:
      if (a3) {
        int v5 = 7012356;
      }
      else {
        int v5 = 7077892;
      }
      goto LABEL_17;
    case 5:
      BOOL v8 = a3 == 0;
      int v6 = 7143429;
      int v7 = 7733253;
      goto LABEL_12;
    case 6:
      BOOL v8 = a3 == 0;
      int v6 = 7208966;
      int v7 = 9109510;
LABEL_12:
      if (v8) {
        int v5 = v6;
      }
      else {
        int v5 = v7;
      }
      goto LABEL_17;
    case 7:
      int v5 = 9175047;
      goto LABEL_17;
    case 8:
      int v5 = 7274504;
LABEL_17:
      unsigned int v12 = CAAudioChannelLayout::RefCountedLayout::CreateWithNumberChannelDescriptions(0);
      v12[4] = v5;
      *(void *)this = v12;
      break;
    default:
      __int16 v9 = CAAudioChannelLayout::RefCountedLayout::CreateWithNumberChannelDescriptions(a2);
      *(void *)this = v9;
      *((void *)v9 + 2) = 0;
      void v9[6] = v3;
      if (v3)
      {
        uint64_t v10 = v3;
        CFRange v11 = v9 + 8;
        do
        {
          *((_DWORD *)v11 - 1) = -1;
          *CFRange v11 = 0;
          v11[1] = 0;
          CFRange v11 = (void *)((char *)v11 + 20);
          --v10;
        }
        while (v10);
      }
      break;
  }
}

void CAAudioChannelLayout::CAAudioChannelLayout(CAAudioChannelLayout *this, atomic_uint a2)
{
  *(void *)this = 0;
  CAAudioChannelLayout::SetWithTag((atomic_uint **)this, a2);
}

{
  *(void *)this = 0;
  CAAudioChannelLayout::SetWithTag((atomic_uint **)this, a2);
}

atomic_uint *CAAudioChannelLayout::SetWithTag(atomic_uint **this, atomic_uint a2)
{
  long long v4 = *this;
  if (v4 && atomic_fetch_add(v4 + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *))(*(void *)v4 + 16))(v4);
  }
  uint64_t result = CAAudioChannelLayout::RefCountedLayout::CreateWithNumberChannelDescriptions(0);
  result[4] = a2;
  *this = result;
  return result;
}

void CAAudioChannelLayout::CAAudioChannelLayout(CAAudioChannelLayout *this, CAAudioChannelLayout::RefCountedLayout *a2)
{
  *(void *)this = 0;
  CAAudioChannelLayout::operator=((atomic_uint **)this, a2);
}

{
  *(void *)this = 0;
  CAAudioChannelLayout::operator=((atomic_uint **)this, a2);
}

uint64_t CAAudioChannelLayout::Clear(CAAudioChannelLayout *this)
{
  return CAAudioChannelLayout::Set(this, 0, 0);
}

uint64_t CAAudioChannelLayout::Set(CAAudioChannelLayout *this, AudioChannelLayout *a2, unint64_t a3)
{
  uint64_t v6 = *(void *)this;
  if (v6)
  {
    if ((AudioChannelLayout *)(v6 + 16) == a2) {
      return 1;
    }
    if (atomic_fetch_add((atomic_uint *volatile)(v6 + 8), 0xFFFFFFFF) == 1) {
      (*(void (**)(uint64_t))(*(void *)v6 + 16))(v6);
    }
  }
  if (!a2)
  {
    CFRange v11 = CAAudioChannelLayout::RefCountedLayout::CreateWithNumberChannelDescriptions(0);
LABEL_11:
    __int16 v9 = v11;
    uint64_t result = 1;
    goto LABEL_12;
  }
  int v7 = caulk::numeric::exceptional_mul<unsigned int>(a2->mNumberChannelDescriptions);
  if (caulk::numeric::exceptional_add<unsigned int>(v7) <= a3)
  {
    CFRange v11 = CAAudioChannelLayout::RefCountedLayout::CreateWithLayout((CAAudioChannelLayout::RefCountedLayout *)a2, v8);
    goto LABEL_11;
  }
  __int16 v9 = CAAudioChannelLayout::RefCountedLayout::CreateWithNumberChannelDescriptions(0);
  uint64_t result = 0;
LABEL_12:
  *(void *)this = v9;
  return result;
}

BOOL CAAudioChannelLayout::operator==(void *a1, void *a2)
{
  uint64_t v2 = (_DWORD *)*a1;
  unsigned int v3 = (_DWORD *)*a2;
  if (*a1 == *a2) {
    return 1;
  }
  int v4 = v2[4];
  if (v4 == v3[4])
  {
    if (v4)
    {
      if (v4 == 0x10000) {
        return v2[5] == v3[5];
      }
      return 1;
    }
    uint64_t v6 = v2[6];
    if (v6 == v3[6])
    {
      if (v6)
      {
        int v7 = v3 + 7;
        BOOL v8 = v2 + 7;
        BOOL result = 1;
        while (*v8 == *v7)
        {
          if (*v8 == 100)
          {
            BOOL v9 = *(void *)v8 == *(void *)v7 && *((void *)v8 + 1) == *((void *)v7 + 1);
            if (!v9 || v8[4] != (unint64_t)v7[4]) {
              break;
            }
          }
          v7 += 5;
          v8 += 5;
          if (!--v6) {
            return result;
          }
        }
        return 0;
      }
      return 1;
    }
  }
  return 0;
}

BOOL CAAudioChannelLayout::operator!=(void *a1, void *a2)
{
  uint64_t v2 = (_DWORD *)*a1;
  unsigned int v3 = (_DWORD *)*a2;
  if (*a1 == *a2) {
    return 0;
  }
  int v4 = v2[4];
  if (v4 == v3[4])
  {
    if (v4)
    {
      if (v4 == 0x10000) {
        return v2[5] != v3[5];
      }
      return 0;
    }
    uint64_t v6 = v2[6];
    if (v6 == v3[6])
    {
      if (v6)
      {
        int v7 = v3 + 7;
        for (int i = v2 + 7; *i == *v7; i += 5)
        {
          if (*i == 100)
          {
            BOOL v9 = *(void *)i == *(void *)v7 && *((void *)i + 1) == *((void *)v7 + 1);
            if (!v9 || i[4] != (unint64_t)v7[4]) {
              break;
            }
          }
          BOOL result = 0;
          v7 += 5;
          if (!--v6) {
            return result;
          }
        }
        return 1;
      }
      return 0;
    }
  }
  return 1;
}

size_t CAAudioChannelLayout::Print(CAAudioChannelLayout *this, __sFILE *__stream)
{
  return CAShowAudioChannelLayout(__stream, (_DWORD *)(*(void *)this + 16));
}

void TruePeak::TruePeak(TruePeak *this)
{
  *((_WORD *)this + 56) = 1;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_DWORD *)this + 18) = 0;
  *((void *)this + 8) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
}

{
  *((_WORD *)this + 56) = 1;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_DWORD *)this + 18) = 0;
  *((void *)this + 8) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
}

double TruePeak::Reset(TruePeak *this)
{
  double result = 0.0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 17) = 0;
  *((_DWORD *)this + 18) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  return result;
}

double TruePeak::ResetStats(TruePeak *this)
{
  *((_DWORD *)this + 17) = 0;
  *((_DWORD *)this + 18) = 0;
  double result = 0.0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  return result;
}

float TruePeak::GetStats(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 80);
  float v4 = *(float *)(a1 + 68);
  if (v4 < 1.1755e-38) {
    float v4 = 1.1755e-38;
  }
  *(float *)a2 = fmaxf(log10f(v4) * 20.0, -200.0);
  if (*(unsigned char *)(a1 + 112))
  {
    float v5 = *(float *)(a1 + 72);
  }
  else
  {
    float v5 = *(float *)(a1 + 96);
    if (v5 <= *(float *)(a1 + 100)) {
      float v5 = *(float *)(a1 + 100);
    }
    float v6 = *(float *)(a1 + 104);
    if (v6 <= *(float *)(a1 + 108)) {
      float v6 = *(float *)(a1 + 108);
    }
    if (v5 <= v6) {
      float v5 = v6;
    }
  }
  if (v5 < *(float *)(a1 + 68)) {
    float v5 = *(float *)(a1 + 68);
  }
  if (v5 < 1.1755e-38) {
    float v5 = 1.1755e-38;
  }
  float result = fmaxf(log10f(v5) * 20.0, -200.0);
  *(float *)(a2 + 4) = result;
  return result;
}

uint64_t TruePeak::Process(uint64_t this, int a2, const float *a3, int8x16_t a4, int8x16_t a5)
{
  if (!*(unsigned char *)(this + 112))
  {
    a4.i32[0] = 0;
    a5.i32[0] = *(unsigned __int8 *)(this + 113);
    int8x16_t v23 = vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(a5, a4), 0);
    float32x4_t v24 = (float32x4_t)vbslq_s8(v23, (int8x16_t)xmmword_1ABAFBC30, (int8x16_t)xmmword_1ABAFBC20);
    float32x4_t v25 = (float32x4_t)vbslq_s8(v23, (int8x16_t)xmmword_1ABAFBC50, (int8x16_t)xmmword_1ABAFBC40);
    float32x4_t v26 = (float32x4_t)vbslq_s8(v23, (int8x16_t)xmmword_1ABAFBC70, (int8x16_t)xmmword_1ABAFBC60);
    float32x4_t v27 = (float32x4_t)vbslq_s8(v23, (int8x16_t)xmmword_1ABAFBC90, (int8x16_t)xmmword_1ABAFBC80);
    float32x4_t v28 = (float32x4_t)vbslq_s8(v23, (int8x16_t)xmmword_1ABAFBCB0, (int8x16_t)xmmword_1ABAFBCA0);
    float32x4_t v29 = (float32x4_t)vbslq_s8(v23, (int8x16_t)xmmword_1ABAFBCD0, (int8x16_t)xmmword_1ABAFBCC0);
    float32x4_t v30 = *(float32x4_t *)this;
    float32x4_t v31 = *(float32x4_t *)(this + 16);
    int8x16_t v32 = *(int8x16_t *)(this + 32);
    float32x4_t v33 = *(float32x4_t *)(this + 96);
    int v34 = *(_DWORD *)(this + 68);
    if (*(unsigned char *)(this + 113))
    {
      if (a2 >= 1)
      {
        float32x4_t v35 = 0uLL;
        do
        {
          __int32 v36 = *(_DWORD *)a3++;
          float32x4_t v30 = (float32x4_t)vextq_s8((int8x16_t)v30, (int8x16_t)v31, 4uLL);
          float32x4_t v31 = (float32x4_t)vextq_s8((int8x16_t)v31, v32, 4uLL);
          v37.i32[0] = vdupq_lane_s32(*(int32x2_t *)v32.i8, 1).u32[0];
          *(uint64_t *)((char *)v37.i64 + 4) = v32.i64[1];
          v37.i32[3] = v36;
          int v38 = v36 & 0x7FFFFFFF;
          if ((v36 & 0x7FFFFFFF) > v34) {
            int v34 = v38;
          }
          float32x4_t v39 = vmlaq_f32(vmlaq_f32(vmulq_f32(v24, v30), v25, v31), v26, v37);
          int8x16_t v40 = (int8x16_t)vmlaq_f32(vmlaq_f32(vmulq_f32(v29, v30), v28, v31), v27, v37);
          *(float32x2_t *)v39.f32 = vadd_f32(*(float32x2_t *)v39.f32, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v39, (int8x16_t)v39, 8uLL));
          *(float32x2_t *)v40.i8 = vadd_f32(*(float32x2_t *)v40.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v40, v40, 8uLL));
          *(float32x2_t *)v39.f32 = vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v39.f32, *(int32x2_t *)v40.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v39.f32, *(int32x2_t *)v40.i8));
          v39.i64[1] = vextq_s8((int8x16_t)v35, (int8x16_t)v35, 8uLL).u64[0];
          float32x4_t v35 = vabsq_f32(v39);
          float32x4_t v33 = vmaxq_f32(v33, v35);
          int8x16_t v32 = (int8x16_t)v37;
          --a2;
        }
        while (a2);
        goto LABEL_78;
      }
    }
    else if (a2 >= 1)
    {
      int8x16_t v64 = (int8x16_t)vrev64q_s32((int32x4_t)v26);
      float32x4_t v65 = (float32x4_t)vextq_s8(v64, v64, 8uLL);
      int8x16_t v66 = (int8x16_t)vrev64q_s32((int32x4_t)v25);
      float32x4_t v67 = (float32x4_t)vextq_s8(v66, v66, 8uLL);
      int8x16_t v68 = (int8x16_t)vrev64q_s32((int32x4_t)v24);
      float32x4_t v69 = (float32x4_t)vextq_s8(v68, v68, 8uLL);
      int8x16_t v70 = (int8x16_t)vrev64q_s32((int32x4_t)v29);
      float32x4_t v71 = (float32x4_t)vextq_s8(v70, v70, 8uLL);
      int8x16_t v72 = (int8x16_t)vrev64q_s32((int32x4_t)v28);
      float32x4_t v73 = (float32x4_t)vextq_s8(v72, v72, 8uLL);
      int8x16_t v74 = (int8x16_t)vrev64q_s32((int32x4_t)v27);
      float32x4_t v75 = (float32x4_t)vextq_s8(v74, v74, 8uLL);
      do
      {
        unsigned int v76 = *(_DWORD *)a3++;
        float32x4_t v30 = (float32x4_t)vextq_s8((int8x16_t)v30, (int8x16_t)v31, 4uLL);
        v37.i32[0] = vdupq_lane_s32(*(int32x2_t *)v32.i8, 1).u32[0];
        v37.i32[1] = v32.i32[2];
        v37.i64[1] = __PAIR64__(v76, v32.u32[3]);
        float32x4_t v31 = (float32x4_t)vextq_s8((int8x16_t)v31, v32, 4uLL);
        int v77 = v76 & 0x7FFFFFFF;
        int8x16_t v78 = (int8x16_t)vmlaq_f32(vmlaq_f32(vmulq_f32(v24, v30), v25, v31), v26, v37);
        int8x16_t v79 = (int8x16_t)vmlaq_f32(vmlaq_f32(vmulq_f32(v65, v30), v67, v31), v69, v37);
        *(float32x2_t *)v78.i8 = vadd_f32(*(float32x2_t *)v78.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v78, v78, 8uLL));
        *(float32x2_t *)v79.i8 = vadd_f32(*(float32x2_t *)v79.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v79, v79, 8uLL));
        int8x16_t v80 = (int8x16_t)vmlaq_f32(vmlaq_f32(vmulq_f32(v27, v30), v28, v31), v29, v37);
        int8x16_t v81 = (int8x16_t)vmlaq_f32(vmlaq_f32(vmulq_f32(v71, v30), v73, v31), v75, v37);
        *(float32x2_t *)v80.i8 = vadd_f32(*(float32x2_t *)v80.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v80, v80, 8uLL));
        *(float32x2_t *)v81.i8 = vadd_f32(*(float32x2_t *)v81.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v81, v81, 8uLL));
        *(int32x2_t *)v82.f32 = vzip1_s32(*(int32x2_t *)v78.i8, *(int32x2_t *)v79.i8);
        v82.i64[1] = __PAIR64__(v81.u32[0], v80.u32[0]);
        *(int32x2_t *)v83.f32 = vzip2_s32(*(int32x2_t *)v78.i8, *(int32x2_t *)v79.i8);
        v83.i64[1] = __PAIR64__(v81.u32[1], vdup_lane_s32(*(int32x2_t *)v80.i8, 1).u32[0]);
        if ((int)(v76 & 0x7FFFFFFF) > v34) {
          int v34 = v77;
        }
        float32x4_t v33 = vmaxq_f32(v33, vabsq_f32(vaddq_f32(v82, v83)));
        int8x16_t v32 = (int8x16_t)v37;
        --a2;
      }
      while (a2);
      goto LABEL_78;
    }
    float32x4_t v37 = *(float32x4_t *)(this + 32);
LABEL_78:
    *(float32x4_t *)this = v30;
    *(float32x4_t *)(this + 16) = v31;
    *(float32x4_t *)(this + 32) = v37;
    *(float32x4_t *)(this + 96) = v33;
    *(_DWORD *)(this + 68) = v34;
    return this;
  }
  float v5 = *(float *)(this + 68);
  float v6 = *(float *)(this + 72);
  int v7 = *(_DWORD *)(this + 64);
  if (*(unsigned char *)(this + 113))
  {
    if (a2 >= 1)
    {
      uint64_t v8 = 0;
      int v9 = 0;
      int v10 = 0;
      while (1)
      {
        uint64_t v11 = 0;
        char v12 = v7;
        *(float *)(this + 4 * v7) = a3[v8];
        char v13 = v7 + 1;
        int v7 = ((_BYTE)v7 + 1) & 0xF;
        float v14 = fabsf(*(float *)(this + 4 * ((v12 + 11) & 0xF)));
        char v15 = (v13 & 0xF) - 12;
        float v16 = 0.0;
        do
        {
          float v16 = v16 + (float)(TruePeak::sSincByTwo[v11] * *(float *)(this + 4 * ((v15 + (_BYTE)v11) & 0xF)));
          ++v11;
        }
        while (v11 != 12);
        uint64_t v17 = 0;
        float v18 = fabsf(v16);
        char v19 = ((v12 + 1) & 0xF) - 12;
        float v20 = 0.0;
        do
        {
          float v20 = v20 + (float)(TruePeak::sSincByTwo[v17 + 12] * *(float *)(this + 4 * ((v19 + (_BYTE)v17) & 0xF)));
          ++v17;
        }
        while (v17 != 12);
        if (v5 < v14) {
          float v5 = v14;
        }
        if (v6 < v18) {
          float v6 = v18;
        }
        float v21 = fabsf(v20);
        if (v21 <= 1.0)
        {
          if (v6 < v21) {
            float v6 = v21;
          }
          if (v14 <= 1.0 && v18 <= 1.0) {
            goto LABEL_24;
          }
        }
        else if (v6 < v21)
        {
          float v6 = v21;
        }
        ++v9;
LABEL_24:
        v10 += v14 > 1.0;
        if (++v8 == a2) {
          goto LABEL_70;
        }
      }
    }
    goto LABEL_69;
  }
  if (a2 >= 1)
  {
    uint64_t v41 = 0;
    int v9 = 0;
    int v10 = 0;
    uint64_t v42 = a2;
    while (1)
    {
      uint64_t v43 = 0;
      char v44 = v7;
      *(float *)(this + 4 * v7) = a3[v41];
      char v45 = v7 + 1;
      int v7 = ((_BYTE)v7 + 1) & 0xF;
      float v46 = fabsf(*(float *)(this + 4 * ((v44 + 11) & 0xF)));
      char v47 = (v45 & 0xF) - 12;
      float v48 = 0.0;
      do
      {
        float v48 = v48 + (float)(TruePeak::sSinc[v43] * *(float *)(this + 4 * ((v47 + (_BYTE)v43) & 0xF)));
        ++v43;
      }
      while (v43 != 12);
      uint64_t v49 = 0;
      float v50 = fabsf(v48);
      float v51 = 0.0;
      do
      {
        float v51 = v51
            + (float)(TruePeak::sSinc[v49 + 12] * *(float *)(this + 4 * ((((v44 + 1) & 0xF) - 12 + (_BYTE)v49) & 0xF)));
        ++v49;
      }
      while (v49 != 12);
      uint64_t v52 = 0;
      if (v5 < v46) {
        float v5 = v46;
      }
      v10 += v46 > 1.0;
      BOOL v53 = v46 > 1.0 || v50 > 1.0;
      if (v6 < v50) {
        float v6 = v50;
      }
      float v54 = fabsf(v51);
      if (v54 > 1.0) {
        BOOL v53 = 1;
      }
      float v55 = 0.0;
      do
      {
        float v55 = v55
            + (float)(TruePeak::sSinc[v52 + 24] * *(float *)(this + 4 * ((((v44 + 1) & 0xF) - 12 + (_BYTE)v52) & 0xF)));
        ++v52;
      }
      while (v52 != 12);
      uint64_t v56 = 0;
      float v57 = fabsf(v55);
      char v58 = ((v44 + 1) & 0xF) - 12;
      float v59 = 0.0;
      do
      {
        float v59 = v59 + (float)(TruePeak::sSinc[v56 + 36] * *(float *)(this + 4 * ((v58 + (_BYTE)v56) & 0xF)));
        ++v56;
      }
      while (v56 != 12);
      if (v6 < v54) {
        float v6 = v54;
      }
      if (v6 < v57) {
        float v6 = v57;
      }
      float v60 = fabsf(v59);
      if (v60 <= 1.0)
      {
        int v61 = v57 > 1.0 || v53;
        if (v6 < v60) {
          float v6 = v60;
        }
        if (v61 != 1) {
          goto LABEL_67;
        }
      }
      else if (v6 < v60)
      {
        float v6 = v60;
      }
      ++v9;
LABEL_67:
      if (++v41 == v42) {
        goto LABEL_70;
      }
    }
  }
LABEL_69:
  int v10 = 0;
  int v9 = 0;
LABEL_70:
  *(_DWORD *)(this + 64) = v7;
  *(float *)(this + 68) = v5;
  *(float *)(this + 72) = v6;
  uint64_t v62 = *(void *)(this + 80) + v10;
  uint64_t v63 = *(void *)(this + 88) + v9;
  *(void *)(this + 8CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = v62;
  *(void *)(this + 88) = v63;
  return this;
}

BOOL PlatformUtilities_iOS::ProductIsAppleWatch(PlatformUtilities_iOS *this)
{
  return MGGetSInt32Answer() == 6;
}

BOOL PlatformUtilities_iOS::ProductIsiPod(PlatformUtilities_iOS *this)
{
  return MGGetSInt32Answer() == 2;
}

BOOL PlatformUtilities_iOS::ProductIsiPad(PlatformUtilities_iOS *this)
{
  return MGGetSInt32Answer() == 3;
}

BOOL PlatformUtilities_iOS::ProductIsHomePod(PlatformUtilities_iOS *this)
{
  ProductCFNumberType Type = (PlatformUtilities_iOS *)PlatformUtilities_iOS::GetProductType(this);
  if (ProductType == 2) {
    return 1;
  }
  uint64_t v2 = (PlatformUtilities_iOS *)PlatformUtilities_iOS::GetProductType(ProductType);
  if (v2 == 3) {
    return 1;
  }
  unsigned int v3 = (PlatformUtilities_iOS *)PlatformUtilities_iOS::GetProductType(v2);
  return v3 == 4 || PlatformUtilities_iOS::GetProductType(v3) == 5;
}

uint64_t PlatformUtilities_iOS::GetProductType(PlatformUtilities_iOS *this)
{
  if (PlatformUtilities_iOS::GetProductType(void)::sCompletedCheck == 1) {
    return PlatformUtilities_iOS::GetProductType(void)::sType;
  }
  PlatformUtilities_iOS::GetProductType(void)::sCompletedCheck = 1;
  uint64_t v2 = MGGetProductType();
  if (v2 > 2159747552)
  {
    if (v2 <= 3196805750)
    {
      if (v2 > 2688879998)
      {
        if (v2 <= 2940697644)
        {
          if (v2 > 2781508712)
          {
            if (v2 <= 2797549162)
            {
              switch(v2)
              {
                case 2781508713:
                  uint64_t result = 6;
                  goto LABEL_481;
                case 2793418701:
                  uint64_t result = 19;
                  goto LABEL_481;
                case 2795618603:
                  uint64_t result = 42;
                  goto LABEL_481;
              }
              goto LABEL_480;
            }
            if (v2 > 2880863277)
            {
              if (v2 != 2880863278)
              {
                if (v2 == 2903084588)
                {
                  uint64_t result = 85;
                  goto LABEL_481;
                }
                goto LABEL_480;
              }
              goto LABEL_367;
            }
            if (v2 == 2797549163)
            {
              uint64_t result = 113;
              goto LABEL_481;
            }
            uint64_t v3 = 2823174122;
LABEL_289:
            if (v2 == v3)
            {
              uint64_t result = 109;
              goto LABEL_481;
            }
            goto LABEL_480;
          }
          if (v2 > 2722529671)
          {
            switch(v2)
            {
              case 2722529672:
                uint64_t result = 28;
                goto LABEL_481;
              case 2730762296:
                uint64_t result = 112;
                goto LABEL_481;
              case 2751865418:
                uint64_t result = 143;
                goto LABEL_481;
            }
            goto LABEL_480;
          }
          if (v2 == 2688879999)
          {
            uint64_t result = 39;
            goto LABEL_481;
          }
          if (v2 != 2692844695)
          {
            if (v2 == 2702125347)
            {
              uint64_t result = 3;
              goto LABEL_481;
            }
            goto LABEL_480;
          }
LABEL_389:
          uint64_t result = 197;
          goto LABEL_481;
        }
        if (v2 <= 3101941569)
        {
          if (v2 <= 2959111091)
          {
            switch(v2)
            {
              case 2940697645:
                uint64_t result = 38;
                goto LABEL_481;
              case 2941181571:
                uint64_t result = 41;
                goto LABEL_481;
              case 2943112657:
                uint64_t result = 149;
                goto LABEL_481;
            }
            goto LABEL_480;
          }
          if (v2 > 3001488777)
          {
            if (v2 == 3001488778)
            {
              uint64_t result = 34;
              goto LABEL_481;
            }
            if (v2 != 3054476161) {
              goto LABEL_480;
            }
            goto LABEL_323;
          }
          if (v2 == 2959111092)
          {
            uint64_t result = 95;
            goto LABEL_481;
          }
          if (v2 == 2979575960)
          {
            uint64_t result = 155;
            goto LABEL_481;
          }
          goto LABEL_480;
        }
        if (v2 <= 3133873108)
        {
          if (v2 != 3101941570)
          {
            if (v2 == 3104290450) {
              goto LABEL_344;
            }
            uint64_t v9 = 3128362815;
            goto LABEL_260;
          }
          goto LABEL_351;
        }
        if (v2 <= 3184375230)
        {
          if (v2 == 3133873109)
          {
            uint64_t result = 62;
            goto LABEL_481;
          }
          if (v2 == 3143587592)
          {
            uint64_t result = 166;
            goto LABEL_481;
          }
          goto LABEL_480;
        }
        if (v2 == 3184375231)
        {
LABEL_397:
          uint64_t result = 77;
          goto LABEL_481;
        }
        uint64_t v8 = 3196158497;
        goto LABEL_373;
      }
      if (v2 <= 2458172801)
      {
        if (v2 > 2309863437)
        {
          if (v2 <= 2385671068)
          {
            if (v2 == 2309863438)
            {
              uint64_t result = 37;
              goto LABEL_481;
            }
            if (v2 == 2311900306)
            {
              uint64_t result = 14;
              goto LABEL_481;
            }
            if (v2 != 2336512887) {
              goto LABEL_480;
            }
            goto LABEL_212;
          }
          if (v2 > 2445473384)
          {
            if (v2 == 2445473385)
            {
              uint64_t result = 124;
              goto LABEL_481;
            }
            if (v2 == 2454275343)
            {
              uint64_t result = 63;
              goto LABEL_481;
            }
            goto LABEL_480;
          }
          if (v2 != 2385671069)
          {
            if (v2 == 2418348558)
            {
              uint64_t result = 135;
              goto LABEL_481;
            }
            goto LABEL_480;
          }
LABEL_310:
          uint64_t result = 50;
          goto LABEL_481;
        }
        if (v2 > 2262113698)
        {
          if (v2 != 2262113699)
          {
            if (v2 == 2270970153)
            {
              uint64_t result = 21;
              goto LABEL_481;
            }
            if (v2 != 2288107369) {
              goto LABEL_480;
            }
            goto LABEL_396;
          }
          goto LABEL_390;
        }
        if (v2 == 2159747553)
        {
          uint64_t result = 26;
          goto LABEL_481;
        }
        if (v2 == 2162679683)
        {
LABEL_383:
          uint64_t result = 122;
          goto LABEL_481;
        }
        uint64_t v8 = 2236272848;
LABEL_373:
        if (v2 != v8) {
          goto LABEL_480;
        }
LABEL_374:
        uint64_t result = 87;
        goto LABEL_481;
      }
      if (v2 > 2619317133)
      {
        if (v2 <= 2628394913)
        {
          if (v2 != 2619317134)
          {
            if (v2 != 2622433984)
            {
              if (v2 == 2625074843)
              {
                uint64_t result = 161;
                goto LABEL_481;
              }
              goto LABEL_480;
            }
            goto LABEL_385;
          }
          goto LABEL_395;
        }
        if (v2 <= 2644487443)
        {
          if (v2 == 2628394914) {
            goto LABEL_323;
          }
          uint64_t v6 = 2634105757;
          goto LABEL_109;
        }
        if (v2 == 2644487444)
        {
          uint64_t result = 92;
          goto LABEL_481;
        }
        if (v2 != 2673319456) {
          goto LABEL_480;
        }
LABEL_360:
        uint64_t result = 73;
        goto LABEL_481;
      }
      if (v2 > 2516717267)
      {
        if (v2 != 2516717268)
        {
          if (v2 == 2566016329)
          {
            uint64_t result = 94;
            goto LABEL_481;
          }
          if (v2 != 2614323575) {
            goto LABEL_480;
          }
          goto LABEL_310;
        }
        goto LABEL_360;
      }
      if (v2 == 2458172802) {
        goto LABEL_374;
      }
      if (v2 == 2468178735) {
        goto LABEL_384;
      }
      if (v2 != 2487868872) {
        goto LABEL_480;
      }
LABEL_392:
      uint64_t result = 107;
      goto LABEL_481;
    }
    if (v2 <= 3711192743)
    {
      if (v2 <= 3540156651)
      {
        if (v2 <= 3300281075)
        {
          if (v2 <= 3228373940)
          {
            if (v2 == 3196805751)
            {
              uint64_t result = 7;
              goto LABEL_481;
            }
            if (v2 == 3215673114)
            {
              uint64_t result = 75;
              goto LABEL_481;
            }
            uint64_t v7 = 3217792190;
            goto LABEL_147;
          }
          if (v2 == 3228373941) {
            goto LABEL_391;
          }
          if (v2 != 3241053352)
          {
            if (v2 == 3242623367)
            {
              uint64_t result = 15;
              goto LABEL_481;
            }
            goto LABEL_480;
          }
          goto LABEL_392;
        }
        if (v2 <= 3397214290)
        {
          if (v2 == 3300281076)
          {
            uint64_t result = 54;
            goto LABEL_481;
          }
          if (v2 == 3348380076)
          {
            uint64_t result = 4;
            goto LABEL_481;
          }
          if (v2 != 3361025853) {
            goto LABEL_480;
          }
          goto LABEL_388;
        }
        if (v2 > 3417429876)
        {
          if (v2 != 3417429877)
          {
            if (v2 == 3455223061)
            {
              uint64_t result = 83;
              goto LABEL_481;
            }
            goto LABEL_480;
          }
          goto LABEL_379;
        }
        if (v2 == 3397214291)
        {
          uint64_t result = 74;
          goto LABEL_481;
        }
        if (v2 == 3402870384)
        {
          uint64_t result = 70;
          goto LABEL_481;
        }
LABEL_480:
        uint64_t result = 0;
        goto LABEL_481;
      }
      if (v2 > 3637438249)
      {
        if (v2 <= 3670339450)
        {
          if (v2 == 3637438250)
          {
            uint64_t result = 52;
            goto LABEL_481;
          }
          if (v2 != 3645319985)
          {
            if (v2 == 3663011141)
            {
              uint64_t result = 156;
              goto LABEL_481;
            }
            goto LABEL_480;
          }
          goto LABEL_386;
        }
        if (v2 > 3683904381)
        {
          if (v2 == 3683904382)
          {
            uint64_t result = 137;
            goto LABEL_481;
          }
          uint64_t v5 = 3707345671;
          goto LABEL_366;
        }
        if (v2 == 3670339451) {
          goto LABEL_240;
        }
        uint64_t v6 = 3677894691;
LABEL_109:
        if (v2 == v6)
        {
          uint64_t result = 102;
          goto LABEL_481;
        }
        goto LABEL_480;
      }
      if (v2 <= 3585085678)
      {
        if (v2 == 3540156652)
        {
          uint64_t result = 93;
          goto LABEL_481;
        }
        if (v2 != 3543203160)
        {
          if (v2 == 3571532206)
          {
            uint64_t result = 151;
            goto LABEL_481;
          }
          goto LABEL_480;
        }
        goto LABEL_240;
      }
      if (v2 == 3585085679)
      {
        uint64_t result = 10;
        goto LABEL_481;
      }
      if (v2 != 3599094683)
      {
        uint64_t v8 = 3636345305;
        goto LABEL_373;
      }
    }
    else
    {
      if (v2 > 3885279869)
      {
        if (v2 > 4068102501)
        {
          if (v2 <= 4231109336)
          {
            switch(v2)
            {
              case 4068102502:
                uint64_t result = 168;
                goto LABEL_481;
              case 4172444931:
                uint64_t result = 132;
                goto LABEL_481;
              case 4201643249:
                uint64_t result = 35;
                goto LABEL_481;
            }
            goto LABEL_480;
          }
          if (v2 > 4240173201)
          {
            if (v2 == 4240173202)
            {
              uint64_t result = 2;
              goto LABEL_481;
            }
            if (v2 == 4242862982)
            {
              uint64_t result = 80;
              goto LABEL_481;
            }
            goto LABEL_480;
          }
          if (v2 != 4231109337)
          {
            if (v2 == 4232256925)
            {
              uint64_t result = 114;
              goto LABEL_481;
            }
            goto LABEL_480;
          }
          goto LABEL_231;
        }
        if (v2 <= 3953847431)
        {
          if (v2 == 3885279870)
          {
            uint64_t result = 32;
            goto LABEL_481;
          }
          if (v2 != 3933865620)
          {
            if (v2 == 3933982784)
            {
              uint64_t result = 53;
              goto LABEL_481;
            }
            goto LABEL_480;
          }
          goto LABEL_240;
        }
        if (v2 > 4055323050)
        {
          if (v2 == 4055323051)
          {
            uint64_t result = 58;
            goto LABEL_481;
          }
          if (v2 == 4067129264)
          {
            uint64_t result = 139;
            goto LABEL_481;
          }
        }
        else
        {
          if (v2 == 3953847432)
          {
            uint64_t result = 170;
            goto LABEL_481;
          }
          if (v2 == 4025247511)
          {
            uint64_t result = 133;
            goto LABEL_481;
          }
        }
        goto LABEL_480;
      }
      if (v2 <= 3825599859)
      {
        if (v2 <= 3767261005)
        {
          switch(v2)
          {
            case 3711192744:
              uint64_t result = 84;
              goto LABEL_481;
            case 3742999858:
              uint64_t result = 159;
              goto LABEL_481;
            case 3743999268:
              uint64_t result = 24;
              goto LABEL_481;
          }
          goto LABEL_480;
        }
        if (v2 == 3767261006)
        {
          uint64_t result = 153;
          goto LABEL_481;
        }
        if (v2 != 3801472101)
        {
          if (v2 == 3819635030)
          {
            uint64_t result = 160;
            goto LABEL_481;
          }
          goto LABEL_480;
        }
        goto LABEL_302;
      }
      if (v2 <= 3863625341)
      {
        switch(v2)
        {
          case 3825599860:
            uint64_t result = 20;
            goto LABEL_481;
          case 3839750255:
            uint64_t result = 169;
            goto LABEL_481;
          case 3856877970:
            uint64_t result = 110;
            goto LABEL_481;
        }
        goto LABEL_480;
      }
      if (v2 > 3865922941)
      {
        if (v2 == 3865922942)
        {
          uint64_t result = 56;
          goto LABEL_481;
        }
        if (v2 == 3867318491)
        {
          uint64_t result = 162;
          goto LABEL_481;
        }
        goto LABEL_480;
      }
      if (v2 != 3863625342)
      {
        if (v2 == 3865897231)
        {
          uint64_t result = 79;
          goto LABEL_481;
        }
        goto LABEL_480;
      }
    }
    uint64_t result = 97;
    goto LABEL_481;
  }
  if (v2 > 1325975681)
  {
    if (v2 > 1737882205)
    {
      if (v2 > 2032616840)
      {
        if (v2 <= 2089455187)
        {
          if (v2 <= 2080700390)
          {
            if (v2 != 2032616841)
            {
              if (v2 == 2048538371)
              {
                uint64_t result = 60;
                goto LABEL_481;
              }
              if (v2 == 2078329141)
              {
                uint64_t result = 31;
                goto LABEL_481;
              }
              goto LABEL_480;
            }
            goto LABEL_394;
          }
          if (v2 > 2084894488)
          {
            if (v2 == 2084894489)
            {
              uint64_t result = 164;
              goto LABEL_481;
            }
            if (v2 == 2085054105)
            {
              uint64_t result = 158;
              goto LABEL_481;
            }
            goto LABEL_480;
          }
          if (v2 == 2080700391)
          {
            uint64_t result = 46;
            goto LABEL_481;
          }
          if (v2 != 2081274472) {
            goto LABEL_480;
          }
          goto LABEL_383;
        }
        if (v2 > 2132302343)
        {
          if (v2 <= 2144123135)
          {
            if (v2 == 2132302344)
            {
              uint64_t result = 148;
              goto LABEL_481;
            }
            uint64_t v7 = 2141052862;
LABEL_147:
            if (v2 != v7) {
              goto LABEL_480;
            }
            goto LABEL_240;
          }
          if (v2 != 2144123136)
          {
            uint64_t v10 = 2158787296;
LABEL_377:
            if (v2 == v10)
            {
              uint64_t result = 69;
              goto LABEL_481;
            }
            goto LABEL_480;
          }
LABEL_379:
          uint64_t result = 194;
          goto LABEL_481;
        }
        if (v2 != 2089455188)
        {
          if (v2 != 2095883268)
          {
            if (v2 != 2103978418) {
              goto LABEL_480;
            }
            goto LABEL_265;
          }
          goto LABEL_389;
        }
LABEL_388:
        uint64_t result = 105;
        goto LABEL_481;
      }
      if (v2 <= 1878257789)
      {
        if (v2 <= 1770142588)
        {
          if (v2 == 1737882206)
          {
            uint64_t result = 116;
            goto LABEL_481;
          }
          if (v2 != 1744899922)
          {
            if (v2 == 1756509290)
            {
              uint64_t result = 144;
              goto LABEL_481;
            }
            goto LABEL_480;
          }
          goto LABEL_240;
        }
        if (v2 == 1770142589)
        {
          uint64_t result = 163;
          goto LABEL_481;
        }
        if (v2 == 1834147427) {
          goto LABEL_323;
        }
        uint64_t v11 = 1868379043;
LABEL_350:
        if (v2 != v11) {
          goto LABEL_480;
        }
        goto LABEL_351;
      }
      if (v2 > 1990293941)
      {
        if (v2 <= 2021146988)
        {
          if (v2 == 1990293942)
          {
            uint64_t result = 140;
            goto LABEL_481;
          }
          uint64_t v4 = 2001966017;
LABEL_172:
          if (v2 != v4) {
            goto LABEL_480;
          }
          goto LABEL_302;
        }
        if (v2 == 2021146989)
        {
          uint64_t result = 18;
          goto LABEL_481;
        }
        uint64_t v11 = 2023824667;
        goto LABEL_350;
      }
      if (v2 == 1878257790)
      {
        uint64_t result = 81;
        goto LABEL_481;
      }
      if (v2 == 1895344378)
      {
        uint64_t result = 86;
        goto LABEL_481;
      }
      if (v2 != 1908832379) {
        goto LABEL_480;
      }
LABEL_231:
      uint64_t result = 196;
      goto LABEL_481;
    }
    if (v2 <= 1517755654)
    {
      if (v2 > 1402208363)
      {
        if (v2 <= 1415625991)
        {
          switch(v2)
          {
            case 1402208364:
              uint64_t result = 130;
              goto LABEL_481;
            case 1408738134:
              uint64_t result = 150;
              goto LABEL_481;
            case 1412429328:
              uint64_t result = 65;
              goto LABEL_481;
          }
        }
        else if (v2 > 1429914405)
        {
          if (v2 == 1429914406)
          {
            uint64_t result = 23;
            goto LABEL_481;
          }
          if (v2 == 1434404433)
          {
            uint64_t result = 17;
            goto LABEL_481;
          }
        }
        else
        {
          if (v2 == 1415625992)
          {
            uint64_t result = 136;
            goto LABEL_481;
          }
          if (v2 == 1419435331)
          {
            uint64_t result = 142;
            goto LABEL_481;
          }
        }
        goto LABEL_480;
      }
      if (v2 <= 1371389548)
      {
        if (v2 == 1325975682)
        {
          uint64_t result = 67;
          goto LABEL_481;
        }
        if (v2 != 1353145733)
        {
          uint64_t v9 = 1364038516;
          goto LABEL_260;
        }
LABEL_302:
        uint64_t result = 88;
        goto LABEL_481;
      }
      if (v2 == 1371389549)
      {
        uint64_t result = 27;
        goto LABEL_481;
      }
      if (v2 != 1373516433)
      {
        if (v2 == 1380747801)
        {
          uint64_t result = 127;
          goto LABEL_481;
        }
        goto LABEL_480;
      }
LABEL_351:
      uint64_t result = 100;
      goto LABEL_481;
    }
    if (v2 <= 1602181455)
    {
      if (v2 > 1554479184)
      {
        switch(v2)
        {
          case 1554479185:
            uint64_t result = 167;
            goto LABEL_481;
          case 1559256613:
            uint64_t result = 55;
            goto LABEL_481;
          case 1573906122:
            uint64_t result = 138;
            goto LABEL_481;
        }
      }
      else
      {
        switch(v2)
        {
          case 1517755655:
            uint64_t result = 171;
            goto LABEL_481;
          case 1540760353:
            uint64_t result = 5;
            goto LABEL_481;
          case 1549248876:
            uint64_t result = 172;
            goto LABEL_481;
        }
      }
      goto LABEL_480;
    }
    if (v2 > 1644180311)
    {
      if (v2 > 1721691076)
      {
        if (v2 == 1721691077)
        {
          uint64_t result = 16;
          goto LABEL_481;
        }
        if (v2 == 1733600853)
        {
          uint64_t result = 128;
          goto LABEL_481;
        }
      }
      else
      {
        if (v2 == 1644180312)
        {
          uint64_t result = 145;
          goto LABEL_481;
        }
        if (v2 == 1701146937)
        {
          uint64_t result = 49;
          goto LABEL_481;
        }
      }
      goto LABEL_480;
    }
    if (v2 == 1602181456)
    {
      uint64_t result = 154;
      goto LABEL_481;
    }
    if (v2 == 1608945770)
    {
      uint64_t result = 192;
      goto LABEL_481;
    }
    if (v2 != 1625227434) {
      goto LABEL_480;
    }
LABEL_391:
    uint64_t result = 104;
    goto LABEL_481;
  }
  if (v2 <= 676119127)
  {
    if (v2 <= 337183580)
    {
      if (v2 > 133314239)
      {
        if (v2 <= 228444037)
        {
          if (v2 == 133314240)
          {
            uint64_t result = 40;
            goto LABEL_481;
          }
          if (v2 != 157833461)
          {
            if (v2 == 173258742)
            {
              uint64_t result = 59;
              goto LABEL_481;
            }
            goto LABEL_480;
          }
          goto LABEL_387;
        }
        if (v2 > 262180326)
        {
          if (v2 == 262180327)
          {
            uint64_t result = 123;
            goto LABEL_481;
          }
          if (v2 == 330877086)
          {
            uint64_t result = 43;
            goto LABEL_481;
          }
          goto LABEL_480;
        }
        if (v2 != 228444038)
        {
          if (v2 != 253148925) {
            goto LABEL_480;
          }
LABEL_384:
          uint64_t result = 120;
          goto LABEL_481;
        }
LABEL_386:
        uint64_t result = 72;
        goto LABEL_481;
      }
      if (v2 <= 42878381)
      {
        switch(v2)
        {
          case 23433786:
            uint64_t result = 61;
            goto LABEL_481;
          case 33245053:
            uint64_t result = 68;
            goto LABEL_481;
          case 40511012:
            uint64_t result = 134;
            goto LABEL_481;
        }
        goto LABEL_480;
      }
      if (v2 == 42878382)
      {
        uint64_t result = 12;
        goto LABEL_481;
      }
      if (v2 != 79936591)
      {
        if (v2 != 88647037) {
          goto LABEL_480;
        }
        goto LABEL_397;
      }
LABEL_390:
      uint64_t result = 76;
      goto LABEL_481;
    }
    if (v2 > 363237282)
    {
      if (v2 > 502329936)
      {
        if (v2 <= 555503453)
        {
          if (v2 == 502329937)
          {
            uint64_t result = 22;
            goto LABEL_481;
          }
          uint64_t v5 = 551446205;
LABEL_366:
          if (v2 != v5) {
            goto LABEL_480;
          }
          goto LABEL_367;
        }
        if (v2 != 555503454)
        {
          if (v2 == 574536383)
          {
            uint64_t result = 30;
            goto LABEL_481;
          }
          goto LABEL_480;
        }
LABEL_395:
        uint64_t result = 106;
        goto LABEL_481;
      }
      if (v2 != 363237283)
      {
        if (v2 == 425046865)
        {
          uint64_t result = 157;
          goto LABEL_481;
        }
        if (v2 == 445396642)
        {
          uint64_t result = 117;
          goto LABEL_481;
        }
        goto LABEL_480;
      }
LABEL_240:
      uint64_t result = 193;
      goto LABEL_481;
    }
    if (v2 > 344862119)
    {
      switch(v2)
      {
        case 344862120:
          uint64_t result = 115;
          goto LABEL_481;
        case 355234908:
          uint64_t result = 129;
          goto LABEL_481;
        case 358923952:
          uint64_t result = 126;
          goto LABEL_481;
      }
      goto LABEL_480;
    }
    if (v2 == 337183581)
    {
      uint64_t result = 11;
      goto LABEL_481;
    }
    if (v2 == 340218669)
    {
      uint64_t result = 111;
      goto LABEL_481;
    }
    uint64_t v4 = 341800273;
    goto LABEL_172;
  }
  if (v2 <= 952317140)
  {
    if (v2 > 776033018)
    {
      if (v2 > 851437780)
      {
        if (v2 <= 910181309)
        {
          if (v2 == 851437781)
          {
            uint64_t result = 29;
            goto LABEL_481;
          }
          if (v2 == 896202454)
          {
            uint64_t result = 71;
            goto LABEL_481;
          }
          goto LABEL_480;
        }
        if (v2 != 910181310)
        {
          if (v2 != 910313402) {
            goto LABEL_480;
          }
LABEL_344:
          uint64_t result = 195;
          goto LABEL_481;
        }
LABEL_394:
        uint64_t result = 25;
        goto LABEL_481;
      }
      if (v2 == 776033019)
      {
        uint64_t result = 57;
        goto LABEL_481;
      }
      if (v2 != 810906663)
      {
        uint64_t v10 = 820711327;
        goto LABEL_377;
      }
LABEL_385:
      uint64_t result = 98;
      goto LABEL_481;
    }
    if (v2 <= 746003605)
    {
      if (v2 == 676119128)
      {
        uint64_t result = 146;
        goto LABEL_481;
      }
      if (v2 == 689804742)
      {
        uint64_t result = 36;
        goto LABEL_481;
      }
      uint64_t v9 = 698697055;
LABEL_260:
      if (v2 != v9) {
        goto LABEL_480;
      }
      goto LABEL_379;
    }
    if (v2 != 746003606)
    {
      if (v2 == 749116821)
      {
        uint64_t result = 165;
        goto LABEL_481;
      }
      uint64_t v3 = 761631964;
      goto LABEL_289;
    }
LABEL_323:
    uint64_t result = 101;
    goto LABEL_481;
  }
  if (v2 > 1234705394)
  {
    if (v2 > 1293446024)
    {
      if (v2 <= 1302273957)
      {
        if (v2 != 1293446025)
        {
          if (v2 == 1294429942)
          {
            uint64_t result = 147;
            goto LABEL_481;
          }
          goto LABEL_480;
        }
LABEL_265:
        uint64_t result = 96;
        goto LABEL_481;
      }
      if (v2 != 1302273958)
      {
        if (v2 == 1309571158)
        {
          uint64_t result = 141;
          goto LABEL_481;
        }
        goto LABEL_480;
      }
LABEL_396:
      uint64_t result = 108;
      goto LABEL_481;
    }
    if (v2 == 1234705395)
    {
      uint64_t result = 125;
      goto LABEL_481;
    }
    if (v2 != 1280441783)
    {
      if (v2 == 1280909812)
      {
        uint64_t result = 152;
        goto LABEL_481;
      }
      goto LABEL_480;
    }
LABEL_387:
    uint64_t result = 78;
    goto LABEL_481;
  }
  if (v2 <= 1110205731)
  {
    if (v2 != 952317141)
    {
      if (v2 == 1060988941)
      {
        uint64_t result = 9;
        goto LABEL_481;
      }
      if (v2 == 1085318934)
      {
        uint64_t result = 131;
        goto LABEL_481;
      }
      goto LABEL_480;
    }
LABEL_212:
    uint64_t result = 121;
    goto LABEL_481;
  }
  if (v2 > 1119807501)
  {
    if (v2 != 1119807502)
    {
      if (v2 == 1169082144)
      {
        uint64_t result = 33;
        goto LABEL_481;
      }
      goto LABEL_480;
    }
LABEL_367:
    uint64_t result = 51;
    goto LABEL_481;
  }
  if (v2 == 1110205732)
  {
    uint64_t result = 48;
    goto LABEL_481;
  }
  if (v2 != 1114644381) {
    goto LABEL_480;
  }
  uint64_t result = 82;
LABEL_481:
  PlatformUtilities_iOS::GetProductType(void)::sCFNumberType Type = result;
  return result;
}

uint64_t PlatformUtilities_iOS::ProductSupportsAssistant(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsCarPlay(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsLivePhoto(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsVibrator(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsHaptics(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsSiriBargeIn(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsClosedLoopHaptics(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsWirelessCharging(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsPictureInPicture(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::CopyProductAssignedName(PlatformUtilities_iOS *this)
{
  return MEMORY[0x1F417CE38](@"UserAssignedDeviceName");
}

uint64_t PlatformUtilities_iOS::IsTelephonyCaptureAllowed(int a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (queryBuildType(void)::once != -1) {
    dispatch_once(&queryBuildType(void)::once, &__block_literal_global_99);
  }
  if (!gIsInternal && !gIsCarrier) {
    return 0;
  }
  CFPreferencesAppSynchronize(@"com.apple.coreaudio");
  uint64_t result = CACFPreferencesGetAppIntegerValue(@"EnableTelephonyMonitor", @"com.apple.coreaudio", 0);
  if (result)
  {
    switch(a1)
    {
      case 0:
        CFStringRef v3 = @"com.apple.coreaudio";
        CFPreferencesAppSynchronize(@"com.apple.coreaudio");
        CFStringRef v4 = @"EnableVPTelephonyMonitor";
        break;
      case 1:
        CFStringRef v3 = @"com.apple.audio.virtualaudio";
        CFPreferencesAppSynchronize(@"com.apple.audio.virtualaudio");
        CFStringRef v4 = @"EnableVADTelephonyMonitor";
        break;
      case 2:
        CFStringRef v3 = @"com.apple.coreaudio";
        CFPreferencesAppSynchronize(@"com.apple.coreaudio");
        CFStringRef v4 = @"EnableHALTelephonyMonitor";
        break;
      case 3:
        CFStringRef v3 = @"com.apple.audio.virtualaudio";
        CFPreferencesAppSynchronize(@"com.apple.audio.virtualaudio");
        CFStringRef v4 = @"EnableEANCTelephonyMonitor";
        break;
      default:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          int v5 = 136315394;
          uint64_t v6 = "PlatformUtilities_iOS.cpp";
          __int16 v7 = 1024;
          int v8 = 253;
          _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d  Unhandled case in switch", (uint8_t *)&v5, 0x12u);
        }
        __break(1u);
        JUMPOUT(0x1ABADCD30);
    }
    return CACFPreferencesGetAppIntegerValue(v4, v3, 0) != 0;
  }
  return result;
}

void ___ZL14queryBuildTypev_block_invoke()
{
  v0 = (const void *)MGCopyAnswer();
  uint64_t v11 = v0;
  char v12 = 1;
  size_t v1 = (CFTypeRef *)MEMORY[0x1E4F1CFD0];
  if (v0) {
    BOOL v2 = CFEqual(v0, (CFTypeRef)*MEMORY[0x1E4F1CFD0]) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  gIsInternal = v2;
  CFStringRef v3 = (const __CFString *)MGCopyAnswer();
  CFStringRef v9 = v3;
  char v10 = 1;
  if (v3) {
    BOOL v4 = CFEqual(@"Carrier", v3);
  }
  else {
    BOOL v4 = 0;
  }
  gIsCarrier = v4;
  int v5 = (const void *)MGCopyAnswer();
  __int16 v7 = v5;
  char v8 = 1;
  if (v5) {
    BOOL v6 = CFEqual(v5, *v1) != 0;
  }
  else {
    BOOL v6 = 0;
  }
  gIsUI = v6;
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v7);
  CACFString::~CACFString((CACFString *)&v9);
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v11);
}

void sub_1ABADCE50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
}

void CACFBoolean::~CACFBoolean(CACFBoolean *this)
{
  if (*((unsigned char *)this + 8))
  {
    BOOL v2 = *(const void **)this;
    if (*(void *)this) {
      CFRelease(v2);
    }
  }
}

uint64_t PlatformUtilities_iOS::IsInternalBuild(PlatformUtilities_iOS *this)
{
  if (queryBuildType(void)::once != -1) {
    dispatch_once(&queryBuildType(void)::once, &__block_literal_global_99);
  }
  return gIsInternal;
}

uint64_t PlatformUtilities_iOS::IsCarrierBuild(PlatformUtilities_iOS *this)
{
  if (queryBuildType(void)::once != -1) {
    dispatch_once(&queryBuildType(void)::once, &__block_literal_global_99);
  }
  return gIsCarrier;
}

uint64_t PlatformUtilities_iOS::ProductSupportsTelephonyOverUSB(PlatformUtilities_iOS *this)
{
  uint64_t result = MGGetBoolAnswer();
  if (result)
  {
    return MGGetBoolAnswer();
  }
  return result;
}

uint64_t PlatformUtilities_iOS::ProductSupportsSiriSpeaks(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsStereoRecording(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsBrook(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::IsUIBuild(PlatformUtilities_iOS *this)
{
  if (queryBuildType(void)::once != -1) {
    dispatch_once(&queryBuildType(void)::once, &__block_literal_global_99);
  }
  return gIsUI;
}

uint64_t PlatformUtilities_iOS::_eaJyFmO(PlatformUtilities_iOS *this)
{
  if (PlatformUtilities_iOS::_eaJyFmO(void)::once != -1) {
    dispatch_once(&PlatformUtilities_iOS::_eaJyFmO(void)::once, &__block_literal_global);
  }
  return PlatformUtilities_iOS::_eaJyFmO(void)::isMonarchLowEndHardware;
}

void ___ZN21PlatformUtilities_iOS8_eaJyFmOEv_block_invoke()
{
  v0 = (const void *)MGCopyAnswer();
  BOOL v2 = v0;
  char v3 = 1;
  if (v0) {
    BOOL v1 = CFEqual(v0, (CFTypeRef)*MEMORY[0x1E4F1CFD0]) != 0;
  }
  else {
    BOOL v1 = 0;
  }
  PlatformUtilities_iOS::_eaJyFmO(void)::isMonarchLowEndHardware = v1;
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v2);
}

void sub_1ABADD0B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t PlatformUtilities_iOS::ProductHasAOP(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductHasBaseband(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

void PlatformUtilities_iOS::TrimHardwareModelShortName(__CFString *this, __CFString *a2)
{
  if (!this) {
    return;
  }
  CFStringRef v3 = @"AP";
  if (CFStringHasSuffix(this, @"AP")
    || (CFStringRef v3 = @"DEV", CFStringHasSuffix(this, @"DEV"))
    || (CFStringRef v3 = @"ap", CFStringHasSuffix(this, @"ap"))
    || (CFStringRef v3 = @"dev", CFStringHasSuffix(this, @"dev")))
  {
    CFStringTrim(this, v3);
  }
  CFStringRef suffix = 0;
  char v10 = 1;
  uint64_t v4 = MGGetProductType();
  if (v4 == 952317141)
  {
    CFStringRef v7 = CFStringCreateWithCString(0, "u", 0x600u);
    char v8 = 1;
    CACFString::operator=((uint64_t)&suffix, (uint64_t)&v7);
  }
  else
  {
    if (v4 != 2081274472 && v4 != 2468178735) {
      goto LABEL_14;
    }
    CFStringRef v7 = CFStringCreateWithCString(0, "m", 0x600u);
    char v8 = 1;
    CACFString::operator=((uint64_t)&suffix, (uint64_t)&v7);
  }
  CACFString::~CACFString((CACFString *)&v7);
LABEL_14:
  CFStringRef v5 = suffix;
  if (suffix)
  {
    if (CFStringHasSuffix(this, suffix))
    {
      CFIndex Length = CFStringGetLength(this);
      v11.length = CFStringGetLength(v5);
      v11.location = Length - v11.length;
      CFStringFindAndReplace(this, v5, &stru_1F0303980, v11, 1uLL);
    }
  }
  CACFString::~CACFString((CACFString *)&suffix);
}

void sub_1ABADD2A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
}

uint64_t PlatformUtilities_iOS::GetBuiltInMicCount(PlatformUtilities_iOS *this)
{
  {
    PlatformUtilities_iOS::GetBuiltInMicCount(void)::sMicCFIndex Count = PlatformUtilities_iOS::GetBuiltInMicCount(void)::$_0::operator()();
  }
  return PlatformUtilities_iOS::GetBuiltInMicCount(void)::sMicCount;
}

void sub_1ABADD338(_Unwind_Exception *a1)
{
}

const __CFNumber *PlatformUtilities_iOS::GetBuiltInMicCount(void)::$_0::operator()()
{
  CFNumberRef result = (const __CFNumber *)MGCopyAnswer();
  unsigned int valuePtr = 0;
  if (result)
  {
    CFNumberRef v1 = result;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v1);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

CFStringRef PlatformUtilities_iOS::CopyAcousticIDFilePrefix(PlatformUtilities_iOS *this)
{
  if (MGIsQuestionValid()) {
    MGGetSInt32Answer();
  }
  uint64_t v1 = MEMORY[0x1E4FBA488] + 104;
  v44[0] = MEMORY[0x1E4FBA488] + 104;
  uint64_t v2 = MEMORY[0x1E4FBA488] + 64;
  uint64_t v38 = MEMORY[0x1E4FBA488] + 64;
  CFStringRef v3 = (void *)MEMORY[0x1E4FBA408];
  uint64_t v4 = *(void *)(MEMORY[0x1E4FBA408] + 24);
  v37[0] = *(void *)(MEMORY[0x1E4FBA408] + 16);
  *(void *)((char *)v37 + *(void *)(v37[0] - 24)) = v4;
  v37[1] = 0;
  CFStringRef v5 = (std::ios_base *)((char *)v37 + *(void *)(v37[0] - 24));
  std::ios_base::init(v5, v39);
  uint64_t v6 = MEMORY[0x1E4FBA488] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  uint64_t v7 = v3[5];
  uint64_t v38 = v3[4];
  *(void *)((char *)&v39[-1] + *(void *)(v38 - 24)) = v7;
  v37[0] = v3[1];
  *(void *)((char *)v37 + *(void *)(v37[0] - 24)) = v3[6];
  v44[0] = v1;
  v37[0] = v6;
  uint64_t v38 = v2;
  std::streambuf::basic_streambuf();
  uint64_t v8 = MEMORY[0x1E4FBA470] + 16;
  v39[0] = MEMORY[0x1E4FBA470] + 16;
  *(_OWORD *)std::string __p = 0u;
  long long v42 = 0u;
  int v43 = 24;
  MEMORY[0x1AD1129C0](__dst, &v38);
  if (LOBYTE(__dst[0]))
  {
    CFStringRef v9 = (char *)&v39[-1] + *(void *)(v38 - 24);
    uint64_t v10 = *((void *)v9 + 5);
    int v11 = *((_DWORD *)v9 + 2);
    int v12 = *((_DWORD *)v9 + 36);
    if (v12 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)&v39[-1] + *(void *)(v38 - 24)));
      char v13 = std::locale::use_facet(&__b, MEMORY[0x1E4FBA258]);
      int v12 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 32);
      std::locale::~locale(&__b);
      *((_DWORD *)v9 + 36) = v12;
    }
    if ((v11 & 0xB0) == 0x20) {
      float v14 = "";
    }
    else {
      float v14 = "AID";
    }
    if (!v10) {
      goto LABEL_31;
    }
    uint64_t v15 = *((void *)v9 + 3);
    BOOL v16 = v15 <= 3;
    uint64_t v17 = v15 - 3;
    size_t v18 = v16 ? 0 : v17;
    if (v14 - "AID" >= 1
      && (*(uint64_t (**)(uint64_t, const char *, int64_t))(*(void *)v10 + 96))(v10, "AID", v14 - "AID") != v14 - "AID")
    {
      goto LABEL_31;
    }
    if ((uint64_t)v18 >= 1)
    {
      if (v18 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v18 >= 0x17)
      {
        uint64_t v20 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v18 | 7) != 0x17) {
          uint64_t v20 = v18 | 7;
        }
        uint64_t v21 = v20 + 1;
        p_b = (std::locale::__imp *)operator new(v20 + 1);
        size_t v46 = v18;
        int64_t v47 = v21 | 0x8000000000000000;
        __b.__locale_ = p_b;
      }
      else
      {
        HIBYTE(v47) = v18;
        p_b = (std::locale::__imp *)&__b;
      }
      memset(p_b, v12, v18);
      *((unsigned char *)p_b + v18) = 0;
      if (v47 >= 0) {
        locale = &__b;
      }
      else {
        locale = __b.__locale_;
      }
      uint64_t v23 = (*(uint64_t (**)(uint64_t, void *, size_t))(*(void *)v10 + 96))(v10, locale, v18);
      if (SHIBYTE(v47) < 0) {
        operator delete(__b.__locale_);
      }
      if (v23 != v18) {
        goto LABEL_31;
      }
    }
    uint64_t v24 = "AID" - v14 + 3;
    if (v24 < 1
      || (*(uint64_t (**)(uint64_t, char *, int64_t))(*(void *)v10 + 96))(v10, v14, "AID" - v14 + 3) == v24)
    {
      *((void *)v9 + 3) = 0;
      CFStringRef v3 = (void *)MEMORY[0x1E4FBA408];
    }
    else
    {
LABEL_31:
      CFStringRef v3 = (void *)MEMORY[0x1E4FBA408];
      std::ios_base::clear((std::ios_base *)((char *)&v39[-1] + *(void *)(v38 - 24)), *(_DWORD *)((char *)&v39[3] + *(void *)(v38 - 24)) | 5);
    }
  }
  MEMORY[0x1AD1129D0](__dst);
  std::ostream::operator<<();
  if ((v43 & 0x10) != 0)
  {
    unint64_t v27 = *((void *)&v42 + 1);
    if (*((void *)&v42 + 1) < v40)
    {
      *((void *)&v42 + 1) = v40;
      unint64_t v27 = v40;
    }
    float32x4_t v28 = (const void *)v39[5];
  }
  else
  {
    if ((v43 & 8) == 0)
    {
      size_t v25 = 0;
      HIBYTE(v36) = 0;
      float32x4_t v26 = __dst;
      goto LABEL_47;
    }
    float32x4_t v28 = (const void *)v39[2];
    unint64_t v27 = v39[4];
  }
  size_t v25 = v27 - (void)v28;
  if (v27 - (unint64_t)v28 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v25 >= 0x17)
  {
    uint64_t v29 = (v25 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v25 | 7) != 0x17) {
      uint64_t v29 = v25 | 7;
    }
    uint64_t v30 = v29 + 1;
    float32x4_t v26 = (void **)operator new(v29 + 1);
    __dst[1] = (void *)v25;
    int64_t v36 = v30 | 0x8000000000000000;
    __dst[0] = v26;
    goto LABEL_46;
  }
  HIBYTE(v36) = v27 - (_BYTE)v28;
  float32x4_t v26 = __dst;
  if (v25) {
LABEL_46:
  }
    memmove(v26, v28, v25);
LABEL_47:
  *((unsigned char *)v26 + v25) = 0;
  if (v36 >= 0) {
    float32x4_t v31 = (const char *)__dst;
  }
  else {
    float32x4_t v31 = (const char *)__dst[0];
  }
  CFStringRef v32 = CFStringCreateWithCString(0, v31, 0x600u);
  if (SHIBYTE(v36) < 0) {
    operator delete(__dst[0]);
  }
  v37[0] = *v3;
  uint64_t v33 = v3[9];
  *(void *)((char *)v37 + *(void *)(v37[0] - 24)) = v3[8];
  uint64_t v38 = v33;
  v39[0] = v8;
  if (SBYTE7(v42) < 0) {
    operator delete(__p[0]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1AD112B00](v44);
  return v32;
}

void sub_1ABADDAEC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19, uint64_t a20,uint64_t a21)
{
  if (*(char *)(v22 - 89) < 0) {
    operator delete(*(void **)(v22 - 112));
  }
  MEMORY[0x1AD1129D0](&__p);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)(v21 + *(void *)(a21 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1ABADD8E4);
}

void sub_1ABADDB88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __cxa_end_catch();
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1ABADDB98()
{
  std::iostream::~basic_iostream();
  MEMORY[0x1AD112B00](v0);
  JUMPOUT(0x1ABADDBCCLL);
}

void sub_1ABADDBBC()
{
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA408];
  uint64_t v3 = *MEMORY[0x1E4FBA408];
  *(void *)a1 = *MEMORY[0x1E4FBA408];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x1E4FBA470] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1AD112B00](a1 + 128);
  return a1;
}

CFStringRef PlatformUtilities_iOS::CopyProductTypeFilePrefix(int a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  __str[0] = 0;
  switch(a1)
  {
    case 1:
      uint64_t v27 = 0;
      int v1 = 184;
      goto LABEL_8;
    case 2:
      uint64_t v27 = 0;
      goto LABEL_5;
    case 3:
      uint64_t v27 = 97;
LABEL_5:
      int v1 = 238;
      goto LABEL_8;
    case 4:
      uint64_t v27 = 0;
      int v1 = 520;
      goto LABEL_8;
    case 5:
      uint64_t v27 = 0;
      int v1 = 620;
LABEL_8:
      uint64_t v2 = 98;
      goto LABEL_233;
    case 6:
      uint64_t v27 = 0;
      int v1 = 10;
      goto LABEL_50;
    case 7:
      uint64_t v27 = 0;
      int v1 = 11;
      goto LABEL_50;
    case 8:
      uint64_t v27 = 0;
      int v1 = 12;
      goto LABEL_50;
    case 9:
      uint64_t v27 = 0;
      int v1 = 16;
      goto LABEL_50;
    case 10:
      uint64_t v27 = 0;
      int v1 = 17;
      goto LABEL_50;
    case 11:
      uint64_t v27 = 0;
      int v1 = 101;
      goto LABEL_50;
    case 12:
      uint64_t v27 = 0;
      int v1 = 111;
      goto LABEL_50;
    case 13:
      uint64_t v27 = 0;
      int v1 = 121;
      goto LABEL_50;
    case 14:
      uint64_t v27 = 0;
      int v1 = 20;
      goto LABEL_50;
    case 15:
      uint64_t v27 = 0;
      int v1 = 21;
      goto LABEL_50;
    case 16:
      uint64_t v27 = 0;
      int v1 = 22;
      goto LABEL_50;
    case 17:
      uint64_t v27 = 0;
      goto LABEL_49;
    case 18:
      uint64_t v27 = 0;
      int v1 = 28;
      goto LABEL_50;
    case 19:
      uint64_t v27 = 0;
      int v1 = 37;
      goto LABEL_50;
    case 20:
      uint64_t v27 = 0;
      int v1 = 38;
      goto LABEL_50;
    case 21:
      uint64_t v27 = 0;
      int v1 = 201;
      goto LABEL_50;
    case 22:
      uint64_t v27 = 0;
      int v1 = 211;
      goto LABEL_50;
    case 23:
      uint64_t v27 = 0;
      int v1 = 221;
      goto LABEL_50;
    case 24:
      uint64_t v27 = 0;
      int v1 = 32;
      goto LABEL_50;
    case 25:
      uint64_t v27 = 0;
      int v1 = 33;
      goto LABEL_50;
    case 26:
      uint64_t v27 = 0;
      int v1 = 79;
      goto LABEL_50;
    case 27:
      uint64_t v27 = 0;
      int v1 = 42;
      goto LABEL_50;
    case 28:
      uint64_t v27 = 0;
      int v1 = 43;
      goto LABEL_50;
    case 29:
      uint64_t v27 = 0;
      int v1 = 47;
      goto LABEL_50;
    case 30:
      uint64_t v27 = 0;
      int v1 = 48;
      goto LABEL_50;
    case 31:
      uint64_t v27 = 0;
      int v1 = 49;
      goto LABEL_50;
    case 32:
      uint64_t v27 = 103;
      int v1 = 52;
      goto LABEL_50;
    case 33:
      uint64_t v3 = 103;
      goto LABEL_38;
    case 34:
      uint64_t v3 = 112;
LABEL_38:
      uint64_t v27 = v3;
      int v1 = 53;
      goto LABEL_50;
    case 35:
      uint64_t v27 = 112;
      int v1 = 54;
      goto LABEL_50;
    case 36:
      uint64_t v27 = 0;
      int v1 = 63;
      goto LABEL_50;
    case 37:
      uint64_t v27 = 0;
      int v1 = 64;
      goto LABEL_50;
    case 38:
      uint64_t v27 = 0;
      int v1 = 73;
      goto LABEL_50;
    case 39:
      uint64_t v27 = 0;
      int v1 = 74;
      goto LABEL_50;
    case 40:
      uint64_t v27 = 0;
      int v1 = 83;
      goto LABEL_50;
    case 41:
      uint64_t v27 = 0;
      int v1 = 84;
      goto LABEL_50;
    case 42:
      uint64_t v27 = 0;
      int v1 = 93;
      goto LABEL_50;
    case 43:
      uint64_t v27 = 0;
      int v1 = 94;
      goto LABEL_50;
    case 44:
      uint64_t v27 = 117;
LABEL_49:
      int v1 = 27;
LABEL_50:
      uint64_t v2 = 100;
      goto LABEL_233;
    case 45:
      uint64_t v27 = 0;
      int v1 = 59;
      goto LABEL_243;
    case 46:
      uint64_t v27 = 0;
      int v1 = 104;
      goto LABEL_232;
    case 47:
      uint64_t v27 = 0;
      goto LABEL_55;
    case 48:
      uint64_t v27 = 100;
LABEL_55:
      int v1 = 42;
      goto LABEL_123;
    case 49:
      uint64_t v27 = 0;
      goto LABEL_60;
    case 50:
      uint64_t v4 = 98;
      goto LABEL_59;
    case 51:
      uint64_t v4 = 115;
LABEL_59:
      uint64_t v27 = v4;
LABEL_60:
      int v1 = 71;
      goto LABEL_123;
    case 52:
      uint64_t v27 = 0;
      int v1 = 72;
      goto LABEL_123;
    case 53:
      uint64_t v27 = 0;
      int v1 = 73;
      goto LABEL_123;
    case 54:
      uint64_t v27 = 0;
      int v1 = 81;
      goto LABEL_123;
    case 55:
      uint64_t v27 = 0;
      int v1 = 82;
      goto LABEL_123;
    case 56:
      uint64_t v27 = 0;
      goto LABEL_67;
    case 57:
      uint64_t v27 = 109;
LABEL_67:
      int v1 = 85;
      goto LABEL_123;
    case 58:
      uint64_t v27 = 0;
      goto LABEL_70;
    case 59:
      uint64_t v27 = 109;
LABEL_70:
      int v1 = 86;
      goto LABEL_123;
    case 60:
      uint64_t v27 = 0;
      goto LABEL_73;
    case 61:
      uint64_t v27 = 109;
LABEL_73:
      int v1 = 87;
      goto LABEL_123;
    case 62:
      uint64_t v27 = 0;
      int v1 = 96;
      goto LABEL_123;
    case 63:
      uint64_t v27 = 0;
      int v1 = 97;
      goto LABEL_123;
    case 64:
      uint64_t v27 = 0;
      goto LABEL_78;
    case 65:
      uint64_t v27 = 97;
LABEL_78:
      int v1 = 98;
      goto LABEL_123;
    case 66:
      uint64_t v27 = 0;
      goto LABEL_81;
    case 67:
      uint64_t v27 = 97;
LABEL_81:
      int v1 = 99;
      goto LABEL_123;
    case 68:
      uint64_t v27 = 97;
      int v1 = 105;
      goto LABEL_123;
    case 69:
      uint64_t v27 = 0;
      int v1 = 120;
      goto LABEL_123;
    case 70:
      uint64_t v27 = 0;
      int v1 = 127;
      goto LABEL_123;
    case 71:
      uint64_t v27 = 0;
      int v1 = 128;
      goto LABEL_123;
    case 72:
      uint64_t v27 = 0;
      goto LABEL_88;
    case 73:
      uint64_t v27 = 97;
LABEL_88:
      int v1 = 171;
      goto LABEL_123;
    case 74:
      uint64_t v27 = 0;
      int v1 = 181;
      goto LABEL_123;
    case 75:
      uint64_t v27 = 0;
      int v1 = 182;
      goto LABEL_123;
    case 76:
      uint64_t v27 = 0;
      int v1 = 207;
      goto LABEL_123;
    case 77:
      uint64_t v27 = 0;
      int v1 = 210;
      goto LABEL_123;
    case 78:
      uint64_t v27 = 0;
      int v1 = 217;
      goto LABEL_123;
    case 79:
      uint64_t v27 = 0;
      int v1 = 255;
      goto LABEL_123;
    case 80:
      uint64_t v27 = 0;
      int v1 = 271;
      goto LABEL_123;
    case 81:
      uint64_t v27 = 0;
      int v1 = 272;
      goto LABEL_123;
    case 82:
      uint64_t v27 = 0;
      int v1 = 305;
      goto LABEL_123;
    case 83:
      uint64_t v27 = 0;
      int v1 = 307;
      goto LABEL_123;
    case 84:
      uint64_t v27 = 0;
      int v1 = 308;
      goto LABEL_123;
    case 85:
      uint64_t v27 = 0;
      int v1 = 310;
      goto LABEL_123;
    case 86:
      uint64_t v27 = 0;
      int v1 = 311;
      goto LABEL_123;
    case 87:
      uint64_t v27 = 0;
      int v1 = 317;
      goto LABEL_123;
    case 88:
      uint64_t v27 = 0;
      int v1 = 320;
      goto LABEL_123;
    case 89:
      uint64_t v27 = 0;
      int v1 = 348;
      goto LABEL_123;
    case 90:
      uint64_t v27 = 0;
      int v1 = 381;
      goto LABEL_123;
    case 91:
      uint64_t v27 = 0;
      int v1 = 382;
      goto LABEL_123;
    case 92:
      uint64_t v27 = 0;
      int v1 = 407;
      goto LABEL_123;
    case 93:
      uint64_t v27 = 0;
      int v1 = 408;
      goto LABEL_123;
    case 94:
      uint64_t v27 = 0;
      int v1 = 410;
      goto LABEL_123;
    case 95:
      uint64_t v27 = 0;
      int v1 = 411;
      goto LABEL_123;
    case 96:
      uint64_t v27 = 0;
      int v1 = 417;
      goto LABEL_123;
    case 97:
      uint64_t v27 = 0;
      int v1 = 420;
      goto LABEL_123;
    case 98:
      uint64_t v27 = 0;
      int v1 = 507;
      goto LABEL_123;
    case 99:
      uint64_t v27 = 0;
      int v1 = 508;
      goto LABEL_123;
    case 100:
      uint64_t v27 = 0;
      int v1 = 517;
      goto LABEL_123;
    case 101:
      uint64_t v27 = 0;
      int v1 = 522;
      goto LABEL_123;
    case 102:
      uint64_t v27 = 0;
      int v1 = 537;
      goto LABEL_123;
    case 103:
      uint64_t v27 = 0;
      int v1 = 538;
      goto LABEL_123;
    case 104:
      uint64_t v27 = 0;
      int v1 = 617;
      goto LABEL_123;
    case 105:
      uint64_t v27 = 0;
      int v1 = 620;
      goto LABEL_123;
    case 106:
      uint64_t v27 = 0;
      int v1 = 717;
      goto LABEL_123;
    case 107:
      uint64_t v27 = 0;
      int v1 = 720;
LABEL_123:
      uint64_t v2 = 106;
      goto LABEL_233;
    case 108:
      uint64_t v27 = 97;
      int v1 = 27;
      goto LABEL_232;
    case 109:
      uint64_t v27 = 97;
      int v1 = 28;
      goto LABEL_232;
    case 110:
      uint64_t v27 = 0;
      int v1 = 41;
      goto LABEL_232;
    case 111:
      uint64_t v27 = 0;
      int v1 = 42;
      goto LABEL_232;
    case 112:
      uint64_t v27 = 0;
      int v1 = 48;
      goto LABEL_232;
    case 113:
      uint64_t v27 = 0;
      int v1 = 49;
      goto LABEL_232;
    case 114:
      uint64_t v27 = 0;
      int v1 = 51;
      goto LABEL_232;
    case 115:
      uint64_t v27 = 0;
      int v1 = 53;
      goto LABEL_232;
    case 116:
      uint64_t v27 = 0;
      int v1 = 56;
      goto LABEL_232;
    case 117:
      uint64_t v27 = 0;
      int v1 = 61;
      goto LABEL_232;
    case 118:
      uint64_t v27 = 0;
      int v1 = 64;
      goto LABEL_232;
    case 119:
      uint64_t v27 = 0;
      int v1 = 65;
      goto LABEL_232;
    case 120:
      uint64_t v27 = 0;
      int v1 = 66;
      goto LABEL_232;
    case 121:
      uint64_t v27 = 0;
      int v1 = 69;
      goto LABEL_232;
    case 122:
      uint64_t v27 = 0;
      int v1 = 71;
      goto LABEL_232;
    case 123:
      uint64_t v27 = 0;
      int v1 = 74;
      goto LABEL_232;
    case 124:
      uint64_t v27 = 0;
      int v1 = 75;
      goto LABEL_232;
    case 125:
      uint64_t v27 = 0;
      int v1 = 841;
      goto LABEL_232;
    case 126:
      uint64_t v27 = 0;
      int v1 = 102;
      goto LABEL_232;
    case 127:
      uint64_t v27 = 0;
      int v1 = 112;
      goto LABEL_232;
    case 128:
      uint64_t v5 = 115;
      goto LABEL_146;
    case 129:
      uint64_t v5 = 98;
LABEL_146:
      uint64_t v27 = v5;
      int v1 = 111;
      goto LABEL_232;
    case 130:
      uint64_t v6 = 115;
      goto LABEL_149;
    case 131:
      uint64_t v6 = 98;
LABEL_149:
      uint64_t v27 = v6;
      int v1 = 121;
      goto LABEL_232;
    case 132:
      uint64_t v7 = 115;
      goto LABEL_152;
    case 133:
      uint64_t v7 = 98;
LABEL_152:
      uint64_t v27 = v7;
      int v1 = 131;
      goto LABEL_232;
    case 134:
      uint64_t v8 = 115;
      goto LABEL_155;
    case 135:
      uint64_t v8 = 98;
LABEL_155:
      uint64_t v27 = v8;
      int v1 = 140;
      goto LABEL_232;
    case 136:
      uint64_t v9 = 115;
      goto LABEL_158;
    case 137:
      uint64_t v9 = 98;
LABEL_158:
      uint64_t v27 = v9;
      int v1 = 141;
      goto LABEL_232;
    case 138:
      uint64_t v10 = 115;
      goto LABEL_161;
    case 139:
      uint64_t v10 = 98;
LABEL_161:
      uint64_t v27 = v10;
      int v1 = 142;
      goto LABEL_232;
    case 140:
      uint64_t v11 = 98;
      goto LABEL_164;
    case 141:
      uint64_t v11 = 115;
LABEL_164:
      uint64_t v27 = v11;
      int v1 = 143;
      goto LABEL_232;
    case 142:
      uint64_t v12 = 115;
      goto LABEL_167;
    case 143:
      uint64_t v12 = 98;
LABEL_167:
      uint64_t v27 = v12;
      int v1 = 144;
      goto LABEL_232;
    case 144:
      uint64_t v13 = 115;
      goto LABEL_170;
    case 145:
      uint64_t v13 = 98;
LABEL_170:
      uint64_t v27 = v13;
      int v1 = 146;
      goto LABEL_232;
    case 146:
      uint64_t v14 = 98;
      goto LABEL_173;
    case 147:
      uint64_t v14 = 115;
LABEL_173:
      uint64_t v27 = v14;
      int v1 = 149;
      goto LABEL_232;
    case 148:
      uint64_t v15 = 115;
      goto LABEL_176;
    case 149:
      uint64_t v15 = 98;
LABEL_176:
      uint64_t v27 = v15;
      int v1 = 157;
      goto LABEL_232;
    case 150:
      uint64_t v16 = 115;
      goto LABEL_179;
    case 151:
      uint64_t v16 = 98;
LABEL_179:
      uint64_t v27 = v16;
      int v1 = 158;
      goto LABEL_232;
    case 152:
      uint64_t v17 = 115;
      goto LABEL_182;
    case 153:
      uint64_t v17 = 98;
LABEL_182:
      uint64_t v27 = v17;
      int v1 = 187;
      goto LABEL_232;
    case 154:
      uint64_t v18 = 115;
      goto LABEL_185;
    case 155:
      uint64_t v18 = 98;
LABEL_185:
      uint64_t v27 = v18;
      int v1 = 188;
      goto LABEL_232;
    case 156:
      uint64_t v19 = 115;
      goto LABEL_188;
    case 157:
      uint64_t v19 = 98;
LABEL_188:
      uint64_t v27 = v19;
      int v1 = 197;
      goto LABEL_232;
    case 158:
      uint64_t v20 = 115;
      goto LABEL_191;
    case 159:
      uint64_t v20 = 98;
LABEL_191:
      uint64_t v27 = v20;
      int v1 = 198;
      goto LABEL_232;
    case 160:
      uint64_t v27 = 0;
      int v1 = 199;
      goto LABEL_232;
    case 161:
      uint64_t v21 = 115;
      goto LABEL_195;
    case 162:
      uint64_t v21 = 98;
LABEL_195:
      uint64_t v27 = v21;
      int v1 = 207;
      goto LABEL_232;
    case 163:
      uint64_t v22 = 115;
      goto LABEL_198;
    case 164:
      uint64_t v22 = 98;
LABEL_198:
      uint64_t v27 = v22;
      int v1 = 208;
      goto LABEL_232;
    case 165:
      uint64_t v23 = 115;
      goto LABEL_201;
    case 166:
      uint64_t v23 = 98;
LABEL_201:
      uint64_t v27 = v23;
      int v1 = 217;
      goto LABEL_232;
    case 167:
      uint64_t v24 = 115;
      goto LABEL_204;
    case 168:
      uint64_t v24 = 98;
LABEL_204:
      uint64_t v27 = v24;
      int v1 = 218;
      goto LABEL_232;
    case 169:
      uint64_t v27 = 0;
      int v1 = 210;
      goto LABEL_232;
    case 170:
      uint64_t v27 = 0;
      int v1 = 101;
      goto LABEL_209;
    case 171:
      uint64_t v27 = 0;
      int v1 = 102;
      goto LABEL_209;
    case 172:
      uint64_t v27 = 0;
      int v1 = 103;
LABEL_209:
      uint64_t v2 = 112;
      goto LABEL_233;
    case 173:
      uint64_t v25 = 110;
      goto LABEL_212;
    case 174:
      uint64_t v25 = 112;
LABEL_212:
      uint64_t v27 = v25;
      int v1 = 398;
      goto LABEL_229;
    case 175:
      uint64_t v27 = 0;
      int v1 = 456;
      goto LABEL_229;
    case 176:
      uint64_t v27 = 112;
      int v1 = 698;
      goto LABEL_229;
    case 177:
      uint64_t v27 = 0;
      int v1 = 720;
      goto LABEL_229;
    case 178:
      uint64_t v27 = 0;
      int v1 = 721;
      goto LABEL_229;
    case 179:
      uint64_t v27 = 0;
      int v1 = 734;
      goto LABEL_229;
    case 180:
      uint64_t v27 = 0;
      int v1 = 742;
      goto LABEL_229;
    case 181:
      uint64_t v27 = 0;
      int v1 = 1125;
      goto LABEL_229;
    case 182:
      uint64_t v27 = 0;
      int v1 = 1153;
      goto LABEL_229;
    case 183:
      uint64_t v27 = 0;
      int v1 = 1232;
      goto LABEL_229;
    case 184:
      uint64_t v27 = 0;
      int v1 = 1250;
      goto LABEL_229;
    case 185:
      uint64_t v27 = 0;
      int v1 = 1251;
      goto LABEL_229;
    case 186:
      uint64_t v27 = 0;
      int v1 = 1252;
      goto LABEL_229;
    case 187:
      uint64_t v27 = 0;
      int v1 = 1253;
      goto LABEL_229;
    case 188:
      snprintf(__str, 0x18uLL, "%c%d%c", 116, 698, 116);
      goto LABEL_234;
    case 189:
      uint64_t v27 = 0;
      int v1 = 6502;
      goto LABEL_229;
    case 190:
      uint64_t v27 = 0;
      int v1 = 6809;
LABEL_229:
      uint64_t v2 = 116;
      goto LABEL_233;
    case 191:
      uint64_t v27 = 0;
      int v1 = 100;
      uint64_t v2 = 113;
      goto LABEL_233;
    case 192:
      uint64_t v27 = 0;
      int v1 = 301;
LABEL_232:
      uint64_t v2 = 110;
      goto LABEL_233;
    case 193:
      uint64_t v27 = 0;
      int v1 = 101;
      goto LABEL_243;
    case 194:
      uint64_t v27 = 0;
      int v1 = 201;
      goto LABEL_243;
    case 195:
      uint64_t v27 = 0;
      int v1 = 301;
      goto LABEL_243;
    case 196:
      uint64_t v27 = 0;
      int v1 = 401;
      goto LABEL_243;
    case 197:
      uint64_t v27 = 0;
      int v1 = 501;
LABEL_243:
      uint64_t v2 = 118;
LABEL_233:
      snprintf(__str, 0x18uLL, "%c%d%c", v2, v1, v27);
LABEL_234:
      if (!__str[0]) {
        goto LABEL_236;
      }
      CFStringRef result = CFStringCreateWithCString(0, __str, 0x600u);
      break;
    default:
LABEL_236:
      CFStringRef result = 0;
      break;
  }
  return result;
}

uint64_t CADeprecated::CAPThread::Start(uint64_t this)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (atomic_load((unint64_t *)(this + 8)))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      LODWORD(v17.__sig) = 136315394;
      *(uint64_t *)((char *)&v17.__sig + 4) = (uint64_t)"CAPThread.cpp";
      *(_WORD *)&v17.__opaque[4] = 1024;
      *(_DWORD *)&v17.__opaque[6] = 248;
      _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAPThread::Start: can't start because the thread is already running", (uint8_t *)&v17, 0x12u);
    }
    __break(1u);
  }
  if (!atomic_load((unint64_t *)(this + 8)))
  {
    uint64_t v3 = this;
    int v4 = pthread_attr_init(&v17);
    if (v4)
    {
      int v7 = v4;
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      *(_DWORD *)std::string buf = 136315394;
      uint64_t v14 = "CAPThread.cpp";
      __int16 v15 = 1024;
      int v16 = 255;
      uint64_t v8 = MEMORY[0x1E4F14500];
      uint64_t v9 = "%25s:%-5d  CAPThread::Start: Thread attributes could not be created.";
    }
    else
    {
      int v5 = pthread_attr_setdetachstate(&v17, 2);
      if (v5)
      {
        int v7 = v5;
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_21;
        }
        *(_DWORD *)std::string buf = 136315394;
        uint64_t v14 = "CAPThread.cpp";
        __int16 v15 = 1024;
        int v16 = 258;
        uint64_t v8 = MEMORY[0x1E4F14500];
        uint64_t v9 = "%25s:%-5d  CAPThread::Start: A thread could not be created in the detached state.";
      }
      else
      {
        pthread_attr_getschedparam(&v17, &v12);
        v12.sched_priority = *(_DWORD *)(v3 + 104);
        pthread_attr_setschedparam(&v17, &v12);
        if (*(unsigned char *)(v3 + 122)) {
          pthread_attr_setschedpolicy(&v17, 4);
        }
        unint64_t v11 = 0;
        int v6 = pthread_create((pthread_t *)&v11, &v17, (void *(__cdecl *)(void *))CADeprecated::CAPThread::Entry, (void *)v3);
        if (!v6 && v11)
        {
          atomic_store(v11, (unint64_t *)(v3 + 8));
          return pthread_attr_destroy(&v17);
        }
        int v7 = v6;
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
LABEL_21:
          exception = __cxa_allocate_exception(0x10uLL);
          *(void *)exception = off_1F0303008;
          exception[2] = v7;
        }
        *(_DWORD *)std::string buf = 136315394;
        uint64_t v14 = "CAPThread.cpp";
        __int16 v15 = 1024;
        int v16 = 272;
        uint64_t v8 = MEMORY[0x1E4F14500];
        uint64_t v9 = "%25s:%-5d  CAPThread::Start: Could not create a thread.";
      }
    }
    _os_log_impl(&dword_1ABAC8000, v8, OS_LOG_TYPE_ERROR, v9, buf, 0x12u);
    goto LABEL_21;
  }
  return this;
}

uint64_t CADeprecated::CAPThread::Entry(CADeprecated::CAPThread *this, void *a2)
{
  atomic_store((unint64_t)pthread_self(), (unint64_t *)this + 1);
  if (*((unsigned char *)this + 40)) {
    pthread_setname_np((const char *)this + 40);
  }
  if (*((unsigned char *)this + 121)) {
    CADeprecated::CAPThread::SetTimeConstraints(this, *((_DWORD *)this + 27), *((_DWORD *)this + 28), *((_DWORD *)this + 29), *((unsigned char *)this + 120));
  }
  uint64_t v3 = (uint64_t (*)(void))*((void *)this + 3);
  if (v3) {
    uint64_t v4 = v3(*((void *)this + 4));
  }
  else {
    uint64_t v4 = 0;
  }
  atomic_store(0, (unint64_t *)this + 1);
  if (*((unsigned char *)this + 123)) {
    (*(void (**)(CADeprecated::CAPThread *))(*(void *)this + 8))(this);
  }
  return v4;
}

void CADeprecated::CAPThread::SetTimeConstraints(CADeprecated::CAPThread *this, int a2, int a3, int a4, char a5)
{
  kern_return_t v9;
  kern_return_t v10;
  unsigned char v11[5];
  integer_t policy_info[2];
  int v13;
  int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  kern_return_t v20;
  __int16 v21;
  unsigned char *v22;
  uint64_t v23;

  uint64_t v23 = *MEMORY[0x1E4F143B8];
  *((_DWORD *)this + 27) = a2;
  *((_DWORD *)this + 28) = a3;
  *((_DWORD *)this + 29) = a4;
  *((unsigned char *)this + 12CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = a5;
  *((unsigned char *)this + 121) = 1;
  if (atomic_load((unint64_t *)this + 1))
  {
    *(void *)policy_info = *(void *)((char *)this + 108);
    int v6 = *((unsigned __int8 *)this + 120);
    uint64_t v13 = *((_DWORD *)this + 29);
    uint64_t v14 = v6;
    int v7 = (_opaque_pthread_t *)atomic_load((unint64_t *)this + 1);
    thread_act_t v8 = pthread_mach_thread_np(v7);
    uint64_t v9 = thread_policy_set(v8, 2u, policy_info, 4u);
    if (v9)
    {
      v11[0] = HIBYTE(v9);
      v11[1] = BYTE2(v9);
      v11[2] = BYTE1(v9);
      uint64_t v10 = v9;
      v11[3] = v9;
      void v11[4] = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::string buf = 136315906;
        int v16 = "CAPThread.cpp";
        pthread_attr_t v17 = 1024;
        uint64_t v18 = 219;
        uint64_t v19 = 1024;
        uint64_t v20 = v10;
        uint64_t v21 = 2080;
        uint64_t v22 = v11;
        _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAPThread::SetTimeConstraints: thread_policy_set failed, Error: %d (%s)", buf, 0x22u);
      }
      __break(1u);
    }
  }
}

void CADeprecated::CAPThread::~CAPThread(CADeprecated::CAPThread *this)
{
}

CADeprecated::CAPThread *CADeprecated::CAPThread::CAPThread(CADeprecated::CAPThread *this, void *(*a2)(void *), void *a3, int a4, char a5, char a6, const char *a7)
{
  *(void *)this = &unk_1F0303438;
  *((void *)this + 1) = 0;
  uint64_t v14 = pthread_self();
  *((_DWORD *)this + 4) = CADeprecated::CAPThread::getScheduledPriority(v14, 0);
  *((void *)this + 3) = a2;
  *((void *)this + 4) = a3;
  *((_DWORD *)this + 26) = a4;
  *((_DWORD *)this + 27) = 0;
  *((void *)this + 14) = 0;
  *((_WORD *)this + 6CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 1;
  *((unsigned char *)this + 122) = a5;
  __int16 v15 = (char *)this + 40;
  *((unsigned char *)this + 123) = a6;
  if (a7)
  {
    strlcpy(v15, a7, 0x40uLL);
  }
  else
  {
    *(_OWORD *)((char *)this + 72) = 0u;
    *(_OWORD *)((char *)this + 88) = 0u;
    *(_OWORD *)__int16 v15 = 0u;
    *(_OWORD *)((char *)this + 56) = 0u;
  }
  return this;
}

_opaque_pthread_t *CADeprecated::CAPThread::getScheduledPriority(_opaque_pthread_t *this, _opaque_pthread_t *a2)
{
  if (this)
  {
    int v2 = (int)a2;
    uint64_t v3 = this;
    mach_msg_type_number_t thread_info_outCnt = 10;
    thread_inspect_t v4 = pthread_mach_thread_np(this);
    thread_info(v4, 3u, thread_info_out, &thread_info_outCnt);
    switch(v13)
    {
      case 4:
        mach_msg_type_number_t thread_info_outCnt = 4;
        thread_inspect_t v6 = pthread_mach_thread_np(v3);
        thread_info(v6, 0xCu, v11, &thread_info_outCnt);
        if (v2 == 1 && v11[2]) {
          return (_opaque_pthread_t *)v11[3];
        }
        else {
          return (_opaque_pthread_t *)v11[1];
        }
      case 2:
        mach_msg_type_number_t thread_info_outCnt = 5;
        thread_inspect_t v7 = pthread_mach_thread_np(v3);
        thread_info(v7, 0xBu, v10, &thread_info_outCnt);
        if (v2 == 1 && v10[3]) {
          return (_opaque_pthread_t *)v10[4];
        }
        else {
          return (_opaque_pthread_t *)v10[1];
        }
      case 1:
        mach_msg_type_number_t thread_info_outCnt = 5;
        thread_inspect_t v5 = pthread_mach_thread_np(v3);
        thread_info(v5, 0xAu, v9, &thread_info_outCnt);
        if (v2 == 1) {
          return (_opaque_pthread_t *)v9[2];
        }
        else {
          return (_opaque_pthread_t *)v9[1];
        }
      default:
        return 0;
    }
  }
  return this;
}

CADeprecated::CAPThread *CADeprecated::CAPThread::CAPThread(CADeprecated::CAPThread *this, void *(*a2)(void *), void *a3, int a4, int a5, int a6, char a7, char a8, const char *a9)
{
  *(void *)this = &unk_1F0303438;
  *((void *)this + 1) = 0;
  pthread_attr_t v17 = pthread_self();
  *((_DWORD *)this + 4) = CADeprecated::CAPThread::getScheduledPriority(v17, 0);
  *((void *)this + 3) = a2;
  *((void *)this + 4) = a3;
  *((_DWORD *)this + 26) = 31;
  *((_DWORD *)this + 27) = a4;
  *((_DWORD *)this + 28) = a5;
  *((_DWORD *)this + 29) = a6;
  *((unsigned char *)this + 12CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = a7;
  *(_WORD *)((char *)this + 121) = 1;
  uint64_t v18 = (char *)this + 40;
  *((unsigned char *)this + 123) = a8;
  if (a9)
  {
    strlcpy(v18, a9, 0x40uLL);
  }
  else
  {
    *(_OWORD *)((char *)this + 72) = 0u;
    *(_OWORD *)((char *)this + 88) = 0u;
    *(_OWORD *)uint64_t v18 = 0u;
    *(_OWORD *)((char *)this + 56) = 0u;
  }
  return this;
}

{
  return CADeprecated::CAPThread::CAPThread(this, a2, a3, a4, a5, a6, a7, a8, a9);
}

_opaque_pthread_t *CADeprecated::CAPThread::GetScheduledPriority(CADeprecated::CAPThread *this)
{
  int v1 = (_opaque_pthread_t *)atomic_load((unint64_t *)this + 1);
  return CADeprecated::CAPThread::getScheduledPriority(v1, (_opaque_pthread_t *)1);
}

_opaque_pthread_t *CADeprecated::CAPThread::GetScheduledPriority(_opaque_pthread_t *this, _opaque_pthread_t *a2)
{
  return CADeprecated::CAPThread::getScheduledPriority(this, (_opaque_pthread_t *)1);
}

void CADeprecated::CAPThread::SetPriority(CADeprecated::CAPThread *this, int a2, char a3)
{
  *((_DWORD *)this + 26) = a2;
  *((unsigned char *)this + 121) = 0;
  *((unsigned char *)this + 122) = a3;
  if (atomic_load((unint64_t *)this + 1))
  {
    thread_inspect_t v4 = (_opaque_pthread_t *)atomic_load((unint64_t *)this + 1);
    CADeprecated::CAPThread::SetPriority(v4, (_opaque_pthread_t *)*((unsigned int *)this + 26), *((unsigned __int8 *)this + 122));
  }
}

void CADeprecated::CAPThread::SetPriority(pthread_t this, _opaque_pthread_t *a2, int a3)
{
  kern_return_t v6;
  _opaque_pthread_t *v7;
  thread_act_t v8;
  kern_return_t v9;
  kern_return_t v10;
  NSObject *v11;
  const char *v12;
  kern_return_t v13;
  integer_t policy_info;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  kern_return_t v20;
  uint64_t v21;

  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (this)
  {
    int v3 = (int)a2;
    if (a3
      && (policy_info = 0, thread_act_t v5 = pthread_mach_thread_np(this), (v6 = thread_policy_set(v5, 1u, &policy_info, 1u)) != 0))
    {
      int v13 = v6;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::string buf = 136315650;
        int v16 = "CAPThread.cpp";
        pthread_attr_t v17 = 1024;
        uint64_t v18 = 161;
        uint64_t v19 = 1024;
        uint64_t v20 = v13;
        unint64_t v11 = MEMORY[0x1E4F14500];
        sched_param v12 = "%25s:%-5d  CAPThread::SetPriority: failed to set the fixed-priority policy, Error: 0x%X";
        goto LABEL_10;
      }
    }
    else
    {
      thread_inspect_t v7 = pthread_self();
      policy_info = v3 - CADeprecated::CAPThread::getScheduledPriority(v7, 0);
      thread_act_t v8 = pthread_mach_thread_np(this);
      uint64_t v9 = thread_policy_set(v8, 3u, &policy_info, 1u);
      if (!v9) {
        return;
      }
      uint64_t v10 = v9;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::string buf = 136315650;
        int v16 = "CAPThread.cpp";
        pthread_attr_t v17 = 1024;
        uint64_t v18 = 168;
        uint64_t v19 = 1024;
        uint64_t v20 = v10;
        unint64_t v11 = MEMORY[0x1E4F14500];
        sched_param v12 = "%25s:%-5d  CAPThread::SetPriority: failed to set the precedence policy, Error: 0x%X";
LABEL_10:
        _os_log_impl(&dword_1ABAC8000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x18u);
      }
    }
    __break(1u);
  }
}

double CADeprecated::CAPThread::SetName(CADeprecated::CAPThread *this, const char *a2)
{
  int v2 = (char *)this + 40;
  if (a2)
  {
    strlcpy(v2, a2, 0x40uLL);
  }
  else
  {
    double result = 0.0;
    *((_OWORD *)v2 + 2) = 0u;
    *((_OWORD *)v2 + 3) = 0u;
    *(_OWORD *)int v2 = 0u;
    *((_OWORD *)v2 + 1) = 0u;
  }
  return result;
}

BOOL SharableMemoryBlock::XPCClientToken::IsValid(SharableMemoryBlock::XPCClientToken *this)
{
  return MEMORY[0x1AD1137F0](*((void *)this + 2)) != MEMORY[0x1E4F145D8];
}

uint64_t LogMachError(const char *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v5 = 136316162;
    thread_inspect_t v6 = "SharableMemory.cpp";
    __int16 v7 = 1024;
    int v8 = 52;
    __int16 v9 = 2080;
    uint64_t v10 = a1;
    __int16 v11 = 1024;
    int v12 = a2;
    __int16 v13 = 2080;
    uint64_t v14 = mach_error_string(a2);
    _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d %s failed: 0x%x (%s)", (uint8_t *)&v5, 0x2Cu);
  }
  return a2;
}

void LogPosixError(const char *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v2 = *__error();
    int v3 = 136315906;
    thread_inspect_t v4 = "SharableMemory.cpp";
    __int16 v5 = 1024;
    int v6 = 58;
    __int16 v7 = 2080;
    int v8 = a1;
    __int16 v9 = 1024;
    int v10 = v2;
    _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d %s failed: errno %d", (uint8_t *)&v3, 0x22u);
  }
}

void SharableMemoryBlock::~SharableMemoryBlock(xpc_object_t *this)
{
  SharableMemoryBlock::~SharableMemoryBlock(this);

  JUMPOUT(0x1AD112B70);
}

{
  *this = &unk_1F0303160;
  SharableMemoryBlock::Free((SharableMemoryBlock *)this);
  xpc_release(this[6]);
  this[6] = 0;
}

uint64_t SharableMemoryBase::AllocNonShared(SharableMemoryBase *this, size_t size)
{
  *((unsigned char *)this + 8) = 1;
  thread_inspect_t v4 = malloc_type_malloc(size, 0x7C51E058uLL);
  if (size && !v4)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    __int16 v7 = std::bad_alloc::bad_alloc(exception);
  }
  *((void *)this + 2) = size;
  *((void *)this + 3) = v4;
  if (v4) {
    return 0;
  }
  else {
    return 4294967188;
  }
}

uint64_t SharableMemoryBase::Set(uint64_t this, void *a2, uint64_t a3)
{
  *(unsigned char *)(this + 8) = 0;
  *(void *)(this + 16) = a3;
  *(void *)(this + 24) = a2;
  return this;
}

void SharableMemoryBlock::XPCClientToken::Reset(SharableMemoryBlock::XPCClientToken *this)
{
  xpc_object_t v2 = xpc_null_create();
  int v3 = (void *)*((void *)this + 2);
  *((void *)this + 2) = v2;
  xpc_release(v3);
  *((_DWORD *)this + 3) = 0;
}

uint64_t SharableMemoryBlock::FDClientToken::Reset(SharableMemoryBlock::FDClientToken *this)
{
  uint64_t result = *((unsigned int *)this + 4);
  if (result != -1)
  {
    uint64_t result = close(result);
    *((_DWORD *)this + 4) = -1;
  }
  *((_DWORD *)this + 3) = 0;
  return result;
}

void KaiserWindow::KaiserWindow(KaiserWindow *this, int a2, double a3)
{
  int v6 = 0;
  *(_DWORD *)this = a2;
  *((double *)this + 1) = a3;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  uint64_t v7 = (a2 + 1);
  if (a2 != -1)
  {
    std::vector<float>::__vallocate[abi:ne180100]((void *)this + 2, (a2 + 1));
    int v8 = (char *)*((void *)this + 3);
    bzero(v8, 4 * v7);
    *((void *)this + 3) = &v8[4 * v7];
    int v6 = (_DWORD *)*((void *)this + 2);
  }
  if (a3 >= 50.0)
  {
    double v9 = (a3 + -8.7) * 0.1102;
  }
  else
  {
    double v9 = 0.0;
    if (a3 > 21.0) {
      double v9 = (a3 + -21.0) * 0.07886 + pow(a3 + -21.0, 0.4) * 0.5842;
    }
  }
  bessi0(v9);
  if (a2)
  {
    uint64_t v11 = 0;
    double v12 = 1.0 / v10;
    do
    {
      bessi0(v9* sqrt(1.0- ((double)v11 - (double)((a2 - 1) >> 1))/ (double)((a2 - 1) >> 1)* (((double)v11 - (double)((a2 - 1) >> 1))/ (double)((a2 - 1) >> 1))));
      *(float *)&double v13 = v12 * v13;
      v6[++v11] = LODWORD(v13);
    }
    while (a2 != v11);
  }
  *int v6 = 0;
}

void sub_1ABADF92C(_Unwind_Exception *exception_object)
{
  thread_inspect_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 24) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__split_buffer<KaiserWindow>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != v3)
  {
    *(void *)(a1 + 16) = v2 - 40;
    thread_inspect_t v4 = *(void **)(v2 - 24);
    if (v4)
    {
      *(void *)(v2 - 16) = v4;
      operator delete(v4);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 40;
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<KaiserWindow>,std::reverse_iterator<KaiserWindow*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 16) + 8);
    uint64_t v4 = *(void *)(*(void *)(a1 + 8) + 8);
    while (v3 != v4)
    {
      __int16 v5 = *(void **)(v3 + 16);
      if (v5)
      {
        *(void *)(v3 + 24) = v5;
        operator delete(v5);
      }
      v3 += 40;
    }
  }
  return a1;
}

char *std::vector<float>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)operator new(4 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * a2];
  return result;
}

void bessi0(double a1)
{
  double v1 = fabs(a1);
  if (v1 >= 3.75) {
    exp(v1);
  }
}

void KaiserWindow::~KaiserWindow(KaiserWindow *this)
{
  uint64_t v2 = (void *)*((void *)this + 2);
  if (v2)
  {
    *((void *)this + 3) = v2;
    operator delete(v2);
  }
}

{
  void *v2;

  uint64_t v2 = (void *)*((void *)this + 2);
  if (v2)
  {
    *((void *)this + 3) = v2;
    operator delete(v2);
  }
}

CFRunLoopSourceRef MSHCreateMachServerSource(const __CFAllocator *a1, CFIndex a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  int perform_high = a5;
  HIDWORD(v15.perform) = a5;
  double v12 = malloc_type_malloc(0x18uLL, 0x1080040D2F62047uLL);
  v15.version = 1;
  v15.info = v12;
  v15.retain = 0;
  v15.release = (void (__cdecl *)(const void *))mshRelease;
  v15.copyDescription = (CFStringRef (__cdecl *)(const void *))mshCopyDescription;
  v15.equal = (Boolean (__cdecl *)(const void *, const void *))mshEqual;
  v15.hash = (CFHashCode (__cdecl *)(const void *))mshHash;
  v15.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))mshGetPort;
  v15.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))mshPerform;
  ipc_space_t v13 = *MEMORY[0x1E4F14960];
  if (!perform_high)
  {
    if (mach_port_allocate(*MEMORY[0x1E4F14960], 1u, (mach_port_name_t *)&v15.perform + 1)) {
      goto LABEL_9;
    }
    if ((a4 & 4) == 0 && mach_port_insert_right(v13, HIDWORD(v15.perform), HIDWORD(v15.perform), 0x14u)) {
      goto LABEL_8;
    }
    a4 &= ~1u;
    int perform_high = HIDWORD(v15.perform);
  }
  *((void *)v12 + 1) = a6;
  *((void *)v12 + 2) = a3;
  *double v12 = perform_high;
  v12[1] = a4;
  CFRunLoopSourceRef result = CFRunLoopSourceCreate(a1, a2, &v15);
  if (result) {
    return result;
  }
  if ((a4 & 1) == 0)
  {
    mach_port_mod_refs(v13, HIDWORD(v15.perform), 0, -1);
LABEL_8:
    mach_port_mod_refs(v13, HIDWORD(v15.perform), 1u, -1);
  }
LABEL_9:
  free(v12);
  return 0;
}

uint64_t mshPerform(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return 0;
}

uint64_t mshGetPort(unsigned int *a1)
{
  return *a1;
}

uint64_t mshHash(unsigned int *a1)
{
  return *a1;
}

BOOL mshEqual(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

CFStringRef mshCopyDescription(unsigned int *a1)
{
  return CFStringCreateWithFormat(0, 0, @"<MSHRunLoopSource %p> {port = %x, callback = %p}", a1, *a1, *((void *)a1 + 2));
}

void mshRelease(mach_port_name_t *a1)
{
  mach_port_name_t v2 = a1[1];
  if ((v2 & 1) == 0)
  {
    ipc_space_t v3 = *MEMORY[0x1E4F14960];
    mach_port_name_t v4 = *a1;
    if ((v2 & 4) == 0) {
      mach_port_mod_refs(*MEMORY[0x1E4F14960], *a1, 0, -1);
    }
    mach_port_mod_refs(v3, v4, 1u, -1);
  }

  free(a1);
}

CFRunLoopSourceRef MSHCreateMIGServerSource(const __CFAllocator *a1, CFIndex a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  int perform_high = a5;
  HIDWORD(v15.perform) = a5;
  double v12 = malloc_type_malloc(0x28uLL, 0x10A0040C7231A41uLL);
  v15.version = 1;
  v15.info = v12;
  v15.retain = 0;
  v15.release = (void (__cdecl *)(const void *))mshRelease;
  v15.copyDescription = (CFStringRef (__cdecl *)(const void *))mshCopyDescription;
  v15.equal = (Boolean (__cdecl *)(const void *, const void *))mshEqual;
  v15.hash = (CFHashCode (__cdecl *)(const void *))mshHash;
  v15.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))mshGetPort;
  v15.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))mshMIGPerform;
  ipc_space_t v13 = *MEMORY[0x1E4F14960];
  if (!perform_high)
  {
    if (mach_port_allocate(*MEMORY[0x1E4F14960], 1u, (mach_port_name_t *)&v15.perform + 1)) {
      goto LABEL_9;
    }
    if ((a4 & 4) == 0 && mach_port_insert_right(v13, HIDWORD(v15.perform), HIDWORD(v15.perform), 0x14u)) {
      goto LABEL_8;
    }
    a4 &= ~1u;
    int perform_high = HIDWORD(v15.perform);
  }
  *double v12 = perform_high;
  v12[1] = a4;
  *((void *)v12 + 3) = 0;
  *((void *)v12 + 4) = a3;
  *((void *)v12 + 1) = a6;
  *((void *)v12 + 2) = 0;
  CFRunLoopSourceRef result = CFRunLoopSourceCreate(a1, a2, &v15);
  if (result) {
    return result;
  }
  if ((a4 & 1) == 0)
  {
    mach_port_mod_refs(v13, HIDWORD(v15.perform), 0, -1);
LABEL_8:
    mach_port_mod_refs(v13, HIDWORD(v15.perform), 1u, -1);
  }
LABEL_9:
  free(v12);
  return 0;
}

uint64_t MSHGetMachPortFromSource(__CFRunLoopSource *a1)
{
  memset(&v2, 0, sizeof(v2));
  CFRunLoopSourceGetContext(a1, &v2);
  if (v2.version == 1) {
    return ((uint64_t (*)(void *))v2.schedule)(v2.info);
  }
  else {
    return 0;
  }
}

BOOL MSHMIGSourceSetNoSendersCallback(__CFRunLoopSource *a1, uint64_t a2, mach_port_mscount_t a3)
{
  kern_return_t v12;
  mach_port_t v13;
  ipc_space_t v14;
  mach_port_name_t v15;
  mach_port_mscount_t v16;
  mach_msg_type_name_t v17;
  mach_port_t previous;
  CFRunLoopSourceContext context;

  memset(&context, 0, sizeof(context));
  CFRunLoopSourceGetContext(a1, &context);
  info = context.info;
  if (context.info) {
    BOOL v7 = context.version == 1;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7) {
    return 0;
  }
  mach_port_name_t v9 = MSHGetMachPortFromSource(a1);
  previous = 0;
  ipc_space_t v10 = *MEMORY[0x1E4F14960];
  uint64_t v11 = info[2];
  if (a2)
  {
    if (!v11) {
      goto LABEL_13;
    }
    double v12 = mach_port_request_notification(*MEMORY[0x1E4F14960], v9, 70, 0, 0, 0x12u, &previous);
    if (v12)
    {
LABEL_15:
      info[2] = a2;
      goto LABEL_16;
    }
    ipc_space_t v13 = previous;
    if (previous)
    {
      uint64_t v14 = v10;
      CFRunLoopSourceContext v15 = v9;
      int v16 = a3;
      pthread_attr_t v17 = 18;
    }
    else
    {
LABEL_13:
      uint64_t v14 = v10;
      CFRunLoopSourceContext v15 = v9;
      int v16 = a3;
      ipc_space_t v13 = v9;
      pthread_attr_t v17 = 21;
    }
    double v12 = mach_port_request_notification(v14, v15, 70, v16, v13, v17, &previous);
    goto LABEL_15;
  }
  if (!v11) {
    return 0;
  }
  info[2] = 0;
  double v12 = mach_port_request_notification(v10, v9, 70, 0, 0, 0x12u, &previous);
LABEL_16:
  if (previous) {
    mach_port_mod_refs(v10, previous, 2u, -1);
  }
  return v12 == 0;
}

void MSHMIGSourceSetSendOnceCallback(__CFRunLoopSource *a1, uint64_t a2)
{
  memset(&v4, 0, sizeof(v4));
  CFRunLoopSourceGetContext(a1, &v4);
  if (v4.info) {
    BOOL v3 = v4.version == 1;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3) {
    *((void *)v4.info + 3) = a2;
  }
}

uint64_t MSHMIGReceiveAndDispatchMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  mach_port_t v3 = MEMORY[0x1F4188790]();
  int v8 = (mach_msg_header_t *)((char *)v14 - v7);
  v8->msgh_bits = 0;
  v8->mach_port_t msgh_remote_port = 0;
  v8->msgh_local_port = v3;
  *(void *)&v8->msgh_voucher_port = 0;
  if (v6) {
    mach_msg_option_t v9 = 117441794;
  }
  else {
    mach_msg_option_t v9 = 117440514;
  }
  uint64_t v12 = mach_msg(v8, v9, 0, v4, v5, v6, 0);
  if (!v12)
  {
    memset(v14, 0, sizeof(v14));
    uint64_t v15 = a2;
    mshMIGPerform((uint64_t)v8, v10, v11, v14);
  }
  return v12;
}

void CACFDistributedNotification::AddObserver(CACFDistributedNotification *this, void (__cdecl *a2)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef), const __CFString *a3, const __CFString *a4, CFNotificationSuspensionBehavior a5)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(DarwinNotifyCenter, this, a2, a3, 0, (CFNotificationSuspensionBehavior)0);
}

void CACFDistributedNotification::RemoveObserver(CACFDistributedNotification *this, const __CFString *a2, const __CFString *a3)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, this, a2, 0);
}

void CACFDistributedNotification::PostNotification(const __CFString *this, const __CFString *a2, const __CFDictionary *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v7 = 136315394;
    int v8 = "CACFDistributedNotification.cpp";
    __int16 v9 = 1024;
    int v10 = 52;
    mach_port_name_t v5 = MEMORY[0x1E4F14500];
    mach_msg_timeout_t v6 = "%25s:%-5d  CACFDistributedNotification::PostNotification: distributed notifications do not support a payload";
    goto LABEL_10;
  }
  if ((a3 & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v7 = 136315394;
    int v8 = "CACFDistributedNotification.cpp";
    __int16 v9 = 1024;
    int v10 = 53;
    mach_port_name_t v5 = MEMORY[0x1E4F14500];
    mach_msg_timeout_t v6 = "%25s:%-5d  CACFDistributedNotification::PostNotification: distributed notifications do not support per-session delivery";
LABEL_10:
    _os_log_impl(&dword_1ABAC8000, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v7, 0x12u);
LABEL_11:
    __break(1u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, this, 0, 0, 0);
}

const char *CAException::what(CAException *this)
{
  return "CAException";
}

void CAException::~CAException(std::exception *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x1AD112B70);
}

uint64_t CAXException::what(CAXException *this)
{
  return (uint64_t)this + 8;
}

void CAXException::~CAXException(std::exception *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x1AD112B70);
}

void virtual thunk to'CAException::~CAException(CAException *this)
{
}

{
  uint64_t vars8;

  std::exception::~exception((std::exception *)((char *)this + *(void *)(*(void *)this - 24)));

  JUMPOUT(0x1AD112B70);
}

uint64_t CAFileSystemUtilities::FileExistsAtPath(uint64_t a1, unsigned char *a2)
{
  char v9 = 0;
  mach_msg_size_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (*(char *)(a1 + 23) >= 0) {
    mach_port_name_t v5 = (const char *)a1;
  }
  else {
    mach_port_name_t v5 = *(const char **)a1;
  }
  CFStringRef v6 = CFStringCreateWithCString(0, v5, 0x8000100u);
  uint64_t v7 = [v4 fileExistsAtPath:v6 isDirectory:&v9];
  CFRelease(v6);

  if (a2) {
    *a2 = v9;
  }
  return v7;
}

void sub_1ABAE0640(_Unwind_Exception *a1)
{
  CFRelease(v2);

  _Unwind_Resume(a1);
}

uint64_t CAFileSystemUtilities::CreateDirectoryAtPath(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (*(char *)(a1 + 23) >= 0) {
    char v9 = (const char *)a1;
  }
  else {
    char v9 = *(const char **)a1;
  }
  CFStringRef v10 = CFStringCreateWithCString(0, v9, 0x8000100u);
  id v15 = 0;
  uint64_t v11 = [v8 createDirectoryAtPath:v10 withIntermediateDirectories:a2 attributes:a3 error:&v15];
  id v12 = v15;
  CFRelease(v10);

  if (a4)
  {
    if (v12) {
      id v13 = v12;
    }
    *a4 = v12;
  }

  return v11;
}

void sub_1ABAE0734(_Unwind_Exception *a1)
{
  CFRelease(v2);

  _Unwind_Resume(a1);
}

void CAFileSystemUtilities::ContentsOfDirectoryAtPath(uint64_t a1@<X0>, void *a2@<X1>, int64x2_t *a3@<X8>)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  a3->i64[0] = 0;
  a3->i64[1] = 0;
  a3[1].i64[0] = 0;
  mach_port_name_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (*(char *)(a1 + 23) >= 0) {
    CFStringRef v6 = (const char *)a1;
  }
  else {
    CFStringRef v6 = *(const char **)a1;
  }
  CFStringRef v7 = CFStringCreateWithCString(0, v6, 0x8000100u);
  id v38 = 0;
  int v8 = [v5 contentsOfDirectoryAtPath:v7 error:&v38];
  id v30 = v38;
  CFRelease(v7);

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(id *)(*((void *)&v34 + 1) + 8 * i);
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v12 UTF8String]);
        unint64_t v14 = a3->u64[1];
        unint64_t v13 = a3[1].u64[0];
        if (v14 >= v13)
        {
          unint64_t v16 = a3->i64[0];
          unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v14 - a3->i64[0]) >> 3);
          unint64_t v18 = v17 + 1;
          if (v17 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v13 - v16) >> 3);
          if (2 * v19 > v18) {
            unint64_t v18 = 2 * v19;
          }
          if (v19 >= 0x555555555555555) {
            unint64_t v20 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v20 = v18;
          }
          v39.__end_cap_.__value_ = (std::allocator<std::string> *)&a3[1];
          if (v20)
          {
            if (v20 > 0xAAAAAAAAAAAAAAALL) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            uint64_t v21 = (std::string *)operator new(24 * v20);
          }
          else
          {
            uint64_t v21 = 0;
          }
          std::__split_buffer<std::string>::pointer begin = v21 + v17;
          v39.__first_ = v21;
          v39.__begin_ = begin;
          v39.__end_ = begin;
          v39.__end_cap_.__value_ = &v21[v20];
          if (SHIBYTE(v33) < 0)
          {
            std::string::__init_copy_ctor_external(begin, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
            unint64_t v16 = a3->i64[0];
            unint64_t v14 = a3->u64[1];
            std::__split_buffer<std::string>::pointer begin = v39.__begin_;
            std::__split_buffer<std::string>::pointer end = v39.__end_;
          }
          else
          {
            *(_OWORD *)&begin->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
            begin->__r_.__value_.__r.__words[2] = v33;
            std::__split_buffer<std::string>::pointer end = v21 + v17;
          }
          std::__split_buffer<std::string>::pointer v22 = end + 1;
          v39.__end_ = end + 1;
          if (v14 == v16)
          {
            int64x2_t v26 = vdupq_n_s64(v16);
          }
          else
          {
            do
            {
              long long v25 = *(_OWORD *)(v14 - 24);
              begin[-1].__r_.__value_.__r.__words[2] = *(void *)(v14 - 8);
              *(_OWORD *)&begin[-1].__r_.__value_.__l.__data_ = v25;
              --begin;
              *(void *)(v14 - 16) = 0;
              *(void *)(v14 - 8) = 0;
              *(void *)(v14 - 24) = 0;
              v14 -= 24;
            }
            while (v14 != v16);
            int64x2_t v26 = *a3;
            std::__split_buffer<std::string>::pointer v22 = v39.__end_;
          }
          a3->i64[0] = (uint64_t)begin;
          a3->i64[1] = (uint64_t)v22;
          *(int64x2_t *)&v39.__begin_ = v26;
          uint64_t v27 = (std::string *)a3[1].i64[0];
          a3[1].i64[0] = (uint64_t)v39.__end_cap_.__value_;
          v39.__end_cap_.__value_ = v27;
          v39.__first_ = (std::__split_buffer<std::string>::pointer)v26.i64[0];
          std::__split_buffer<std::string>::~__split_buffer(&v39);
        }
        else
        {
          if (SHIBYTE(v33) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)a3->i64[1], (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
          }
          else
          {
            long long v15 = *(_OWORD *)__p;
            *(void *)(v14 + 16) = v33;
            *(_OWORD *)unint64_t v14 = v15;
          }
          std::__split_buffer<std::string>::pointer v22 = (std::__split_buffer<std::string>::pointer)(v14 + 24);
          a3->i64[1] = v14 + 24;
        }
        a3->i64[1] = (uint64_t)v22;
        if (SHIBYTE(v33) < 0) {
          operator delete(__p[0]);
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v9);
  }

  if (a2)
  {
    if (v30) {
      id v28 = v30;
    }
    *a2 = v30;
  }
}

void sub_1ABAE0ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *__p, uint64_t a7, int a8, __int16 a9, char a10, char a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *__pa, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,std::__split_buffer<std::string> *a21)
{
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  _Unwind_Resume(a1);
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  double v1 = *a1;
  CFRunLoopSourceContext v2 = (void **)**a1;
  if (v2)
  {
    mach_msg_size_t v4 = (void **)v1[1];
    mach_port_name_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 1) < 0) {
          operator delete(*(v4 - 3));
        }
        v4 -= 3;
      }
      while (v4 != v2);
      mach_port_name_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::pointer begin = this->__begin_;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  if (end != begin)
  {
    do
    {
      std::__split_buffer<std::string>::pointer v4 = end - 1;
      this->__end_ = end - 1;
      if (SHIBYTE(end[-1].__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v4->__r_.__value_.__l.__data_);
        std::__split_buffer<std::string>::pointer v4 = this->__end_;
      }
      std::__split_buffer<std::string>::pointer end = v4;
    }
    while (v4 != begin);
  }
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void CAFileSystemUtilities::GetTemporaryDirectoryPathString(void *a1@<X8>)
{
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  mach_port_t v3 = [v5 temporaryDirectory];
  id v4 = [v3 path];
  std::string::basic_string[abi:ne180100]<0>(a1, (char *)[v4 UTF8String]);
}

void sub_1ABAE0D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void CAFileSystemUtilities::GetTemporaryDirectorySubpathString(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  CAFileSystemUtilities::GetTemporaryDirectoryPathString(&v10);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 23);
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *(void *)(a1 + 8);
  }
  if (v4)
  {
    std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(&v8, (uint64_t)&v10);
    std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(&__p, a1);
    if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v9, v8.__r_.__value_.__l.__data_, v8.__r_.__value_.__l.__size_);
    }
    else {
      std::string v9 = v8;
    }
    if (std::__fs::filesystem::path::__root_directory((const std::__fs::filesystem::path *)&__p).__size_)
    {
      std::string::operator=(&v9, &__p);
    }
    else
    {
      if (std::__fs::filesystem::path::__filename((const std::__fs::filesystem::path *)&v9).__size_) {
        std::string::push_back(&v9, 47);
      }
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
      std::string::append(&v9, (const std::string::value_type *)p_p, size);
    }
    if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(a2, v9.__r_.__value_.__l.__data_, v9.__r_.__value_.__l.__size_);
      if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v9.__r_.__value_.__l.__data_);
      }
    }
    else
    {
      *a2 = v9;
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v8.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v11) < 0) {
      operator delete((void *)v10);
    }
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = v10;
    a2->__r_.__value_.__r.__words[2] = v11;
  }
}

void sub_1ABAE0E90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  if (*(char *)(v26 - 17) < 0) {
    operator delete(*(void **)(v26 - 40));
  }
  _Unwind_Resume(exception_object);
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(std::string *this, uint64_t a2)
{
  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  int v3 = *(char *)(a2 + 23);
  if (v3 >= 0) {
    uint64_t v4 = (std::string *)a2;
  }
  else {
    uint64_t v4 = *(std::string **)a2;
  }
  if (v3 >= 0) {
    std::string::size_type v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    std::string::size_type v5 = *(void *)(a2 + 8);
  }
  if (v5)
  {
    if (v4 >= this && (std::string *)((char *)&this->__r_.__value_.__l.__data_ + 1) > v4)
    {
      if (v5 >= 0x7FFFFFFFFFFFFFF8) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v5 > 0x16)
      {
        uint64_t v10 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v5 | 7) != 0x17) {
          uint64_t v10 = v5 | 7;
        }
        uint64_t v11 = v10 + 1;
        p_p = (std::string::value_type *)operator new(v10 + 1);
        std::string::size_type v17 = v5;
        int64_t v18 = v11 | 0x8000000000000000;
        std::string __p = p_p;
      }
      else
      {
        HIBYTE(v18) = v5;
        p_p = (std::string::value_type *)&__p;
      }
      do
      {
        std::string::value_type v12 = v4->__r_.__value_.__s.__data_[0];
        uint64_t v4 = (std::string *)((char *)v4 + 1);
        *p_p++ = v12;
        --v5;
      }
      while (v5);
      std::string::value_type *p_p = 0;
      if (v18 >= 0) {
        unint64_t v13 = (const std::string::value_type *)&__p;
      }
      else {
        unint64_t v13 = (const std::string::value_type *)__p;
      }
      if (v18 >= 0) {
        std::string::size_type v14 = HIBYTE(v18);
      }
      else {
        std::string::size_type v14 = v17;
      }
      std::string::append(this, v13, v14);
      if (SHIBYTE(v18) < 0) {
        operator delete(__p);
      }
    }
    else
    {
      CFStringRef v7 = this;
      if (v5 >= 0x17)
      {
        std::string::__grow_by(this, 0x16uLL, v5 - 22, 0, 0, 0, 0);
        this->__r_.__value_.__l.__size_ = 0;
        CFStringRef v7 = this;
        if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
          CFStringRef v7 = (std::string *)this->__r_.__value_.__r.__words[0];
        }
      }
      for (uint64_t i = 0; i != v5; ++i)
        v7->__r_.__value_.__s.__data_[i] = v4->__r_.__value_.__s.__data_[i];
      v7->__r_.__value_.__s.__data_[i] = 0;
      if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
        this->__r_.__value_.__l.__size_ = v5;
      }
      else {
        *((unsigned char *)&this->__r_.__value_.__s + 23) = v5 & 0x7F;
      }
    }
  }
  return this;
}

void sub_1ABAE1074(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CAFileSystemUtilities::GetTemporarySubDirectory@<X0>(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  CAFileSystemUtilities::GetTemporaryDirectorySubpathString(a1, a2);
  char v4 = 0;
  uint64_t result = CAFileSystemUtilities::FileExistsAtPath((uint64_t)a2, &v4);
  if ((result & 1) == 0) {
    return CAFileSystemUtilities::CreateDirectoryAtPath((uint64_t)a2, 1, 0, 0);
  }
  return result;
}

void sub_1ABAE10FC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void swix::connection::configure_rebuilt_connection()
{
}

void swix::ipc_endpoint::configure_rebuilt_connection(uint64_t a1, xpc_connection_t *a2)
{
  int v3 = *a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN4swix12ipc_endpoint28configure_rebuilt_connectionERKN10applesauce3xpc10connectionE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_10_192;
  aBlock[4] = a1;
  swix::connection::state::set_handler(*(void *)(a1 + 8), v3, aBlock);
  xpc_connection_activate(*a2);
}

void ___ZN4swix12ipc_endpoint28configure_rebuilt_connectionERKN10applesauce3xpc10connectionE_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v2 = *(void *)(a1 + 32);
  xpc_object_t objecta = object;
  if (object) {
    xpc_retain(object);
  }
  else {
    xpc_object_t objecta = xpc_null_create();
  }
  swix::ipc_endpoint::handle_event_or_error(v2, &objecta);
  xpc_release(objecta);
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x1E4FBA438] + 16;
}

void __destroy_helper_block_e8_40c35_ZTSKN10applesauce3xpc10connectionE(uint64_t a1)
{
  *(void *)(a1 + 4CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 0;
}

xpc_object_t __copy_helper_block_e8_40c35_ZTSKN10applesauce3xpc10connectionE(uint64_t a1, uint64_t a2)
{
  int v3 = *(void **)(a2 + 40);
  *(void *)(a1 + 4CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = v3;
  if (v3) {
    return xpc_retain(v3);
  }
  xpc_object_t result = xpc_null_create();
  *(void *)(a1 + 4CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = result;
  return result;
}

void swix::connection::state::rebuild_connection(uint64_t a1@<X0>, const swix::connection_config *a2@<X8>)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v4 = (os_unfair_lock_s *)(a1 + 152);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  uint64_t v5 = *(void *)(a1 + 160);
  if (!v5)
  {
    swix::connection_config::connection_config(&v7, (const swix::connection_config *)(a1 + 16));
    swix::make_connection(a2, (uint64_t)&v7);
    swix::detail::connection_impl::create((swix::detail::connection_impl *)&v7, a2, v6);
  }
  swix::detail::connection_impl::get(a2, *(void **)(v5 + 16));
  os_unfair_lock_unlock(v4);
}

void sub_1ABAE144C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void applesauce::xpc::connection::~connection(xpc_object_t *this)
{
  *this = 0;
}

void swix::connection_config::~connection_config(swix::connection_config *this)
{
  if (*((unsigned char *)this + 120)) {
    std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)this + 11);
  }
  uint64_t v2 = *((void *)this + 7);
  if (v2) {
    dispatch_release(v2);
  }
  xpc_release(*((xpc_object_t *)this + 6));
  *((void *)this + 6) = 0;
  if (*((char *)this + 47) < 0) {
    operator delete(*((void **)this + 3));
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*(void **)this);
  }
}

uint64_t caulk::function_ref<void ()(applesauce::xpc::connection const&)>::functor_invoker<swix::connection::xpc_connection(void)::$_0>(uint64_t a1)
{
  return (*(uint64_t (**)(void))(***(void ***)a1 + 16))();
}

void swix::xpc_object_description(swix *this@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  char v4 = (char *)MEMORY[0x1AD113770](this, a2);
  std::string::basic_string[abi:ne180100]<0>(a3, v4);

  free(v4);
}

uint64_t ___ZN4swix6detail14watchdog_timerC2ENS_14timeout_configE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 48);
  if (!v1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);

  return v2();
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x1AD112B70);
}

uint64_t swix::detail::watchdog_timer::timer_fired(swix::detail::watchdog_timer *this)
{
  uint64_t v1 = *((void *)this + 6);
  if (!v1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);

  return v2();
}

void swix::detail::watchdog_timer::~watchdog_timer(dispatch_source_t *this)
{
  dispatch_source_cancel(this[8]);
  dispatch_sync(this[7], &__block_literal_global_210);
  uint64_t v2 = this[8];
  if (v2) {
    dispatch_release(v2);
  }
  int v3 = this[7];
  if (v3) {
    dispatch_release(v3);
  }
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](this + 3);
  char v4 = (std::__shared_weak_count *)this[1];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
}

void std::__shared_ptr_emplace<swix::detail::watchdog_timer>::__on_zero_shared(uint64_t a1)
{
}

void std::__shared_ptr_emplace<swix::detail::watchdog_timer>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F03037D0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1AD112B70);
}

void std::__shared_ptr_emplace<swix::detail::watchdog_timer>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F03037D0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<swix::connection::state>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F0303798;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1AD112B70);
}

void std::__shared_ptr_emplace<swix::connection::state>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F0303798;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void swix::decode_message::~decode_message(xpc_object_t *this)
{
  this[1] = 0;
}

void swix::connection::send_with_async_reply(uint64_t a1, swix::encode_message *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  swix::connection::xpc_connection((os_unfair_lock_s **)a1, (const swix::connection_config *)&connection);
  swix::encode_message::xpc_message(a2, &message);
  uint64_t v6 = *(void *)(a1 + 8);
  if (*(unsigned char *)(v6 + 88))
  {
    std::string v7 = *(NSObject **)(v6 + 80);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    xpc_object_t v9 = message;
    if (v8)
    {
      xpc_connection_t v10 = connection;
      uint64_t v11 = (char *)MEMORY[0x1AD113770](message);
      std::string::basic_string[abi:ne180100]<0>(__p, v11);
      free(v11);
      if (v15 >= 0) {
        std::string::value_type v12 = __p;
      }
      else {
        std::string::value_type v12 = (void **)__p[0];
      }
      *(_DWORD *)std::string buf = 134218242;
      xpc_connection_t v19 = v10;
      __int16 v20 = 2080;
      uint64_t v21 = v12;
      _os_log_impl(&dword_1ABAC8000, v7, OS_LOG_TYPE_DEFAULT, "%p send msg %s", buf, 0x16u);
      if (v15 < 0) {
        operator delete(__p[0]);
      }
    }
  }
  else
  {
    xpc_object_t v9 = message;
  }
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 0x40000000;
  handler[2] = ___ZN4swix10connection21send_with_async_replyERKNS_14encode_messageEU13block_pointerFvPvE_block_invoke;
  handler[3] = &unk_1E5E39FC8;
  handler[4] = a3;
  void handler[5] = a1;
  xpc_connection_send_message_with_reply(connection, v9, 0, handler);
  xpc_release(v9);
  xpc_release(connection);
}

void sub_1ABAE1AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, xpc_object_t object)
{
  xpc_release(v20);
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t ___ZN4swix10connection21send_with_async_replyERKNS_14encode_messageEU13block_pointerFvPvE_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v4 = *(void *)(a1 + 40);
  xpc_object_t v8 = object;
  if (object)
  {
    xpc_retain(object);
    xpc_object_t v5 = object;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    xpc_object_t v8 = v5;
  }
  swix::connection::check_valid_reply(v4, &v8);
  xpc_release(v5);
  uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v6();
}

void RateRamp::RateRamp(RateRamp *this, double a2)
{
  *(double *)this = a2;
  *((double *)this + 1) = a2;
  *((_OWORD *)this + 1) = xmmword_1ABAFBCE0;
  *((_OWORD *)this + 2) = xmmword_1ABAFBCE0;
  *((void *)this + 6) = 0;
}

{
  *(double *)this = a2;
  *((double *)this + 1) = a2;
  *((_OWORD *)this + 1) = xmmword_1ABAFBCE0;
  *((_OWORD *)this + 2) = xmmword_1ABAFBCE0;
  *((void *)this + 6) = 0;
}

void RateRamp::RateRamp(RateRamp *this, double a2, double a3, double a4, double a5, double a6)
{
  *(double *)this = a2;
  *((double *)this + 1) = a3;
  *((double *)this + 2) = a4;
  *((double *)this + 3) = a5;
  double v6 = (a5 - a4) / ((a2 + a3) * 0.5);
  *((double *)this + 4) = a6;
  *((double *)this + 5) = v6 + a6;
  double v7 = 0.0;
  if (v6 != 0.0) {
    double v7 = (a3 - a2) / v6;
  }
  *((double *)this + 6) = v7;
}

{
  double v6;
  double v7;

  *(double *)this = a2;
  *((double *)this + 1) = a3;
  *((double *)this + 2) = a4;
  *((double *)this + 3) = a5;
  double v6 = (a5 - a4) / ((a2 + a3) * 0.5);
  *((double *)this + 4) = a6;
  *((double *)this + 5) = v6 + a6;
  double v7 = 0.0;
  if (v6 != 0.0) {
    double v7 = (a3 - a2) / v6;
  }
  *((double *)this + 6) = v7;
}

double *RateRamp::UpdateSlopeAndOutputEndTime(double *this)
{
  double v1 = *this;
  double v2 = this[1];
  double v3 = (this[3] - this[2]) / ((*this + v2) * 0.5);
  this[5] = this[4] + v3;
  double v4 = 0.0;
  if (v3 != 0.0) {
    double v4 = (v2 - v1) / v3;
  }
  this[6] = v4;
  return this;
}

float64x2_t *RateRamp::RateRamp(float64x2_t *result, float64x2_t *a2, double a3, double a4, double a5)
{
  float64x2_t v5 = vmulq_n_f64(*a2, a3);
  float64x2_t v6 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a4, 0);
  float64x2_t v7 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v5, v6), (int8x16_t)v5, (int8x16_t)v6);
  float64x2_t v8 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a5, 0);
  float64x2_t v9 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v8, v7), (int8x16_t)v7, (int8x16_t)v8);
  *xpc_object_t result = v9;
  v8.f64[0] = a2[1].f64[0];
  double v10 = a2[1].f64[1];
  result[1].f64[0] = v8.f64[0];
  result[1].f64[1] = v10;
  double v11 = a2[2].f64[0];
  double v12 = (v10 - v8.f64[0]) / (vaddvq_f64(v9) * 0.5);
  result[2].f64[0] = v11;
  result[2].f64[1] = v11 + v12;
  double v13 = 0.0;
  if (v12 != 0.0) {
    double v13 = (v9.f64[1] - v9.f64[0]) / v12;
  }
  result[3].f64[0] = v13;
  return result;
}

{
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  double v10;
  double v11;
  double v12;
  double v13;

  float64x2_t v5 = vmulq_n_f64(*a2, a3);
  float64x2_t v6 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a4, 0);
  float64x2_t v7 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v5, v6), (int8x16_t)v5, (int8x16_t)v6);
  float64x2_t v8 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a5, 0);
  float64x2_t v9 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v8, v7), (int8x16_t)v7, (int8x16_t)v8);
  *xpc_object_t result = v9;
  v8.f64[0] = a2[1].f64[0];
  double v10 = a2[1].f64[1];
  result[1].f64[0] = v8.f64[0];
  result[1].f64[1] = v10;
  double v11 = a2[2].f64[0];
  double v12 = (v10 - v8.f64[0]) / (vaddvq_f64(v9) * 0.5);
  result[2].f64[0] = v11;
  result[2].f64[1] = v11 + v12;
  double v13 = 0.0;
  if (v12 != 0.0) {
    double v13 = (v9.f64[1] - v9.f64[0]) / v12;
  }
  result[3].f64[0] = v13;
  return result;
}

double RateRamp::AdjustStartTime(RateRamp *this, double result)
{
  double v2 = result - *((double *)this + 4);
  double v3 = *((double *)this + 6) * v2;
  double v4 = *(double *)this;
  *((double *)this + 2) = *((double *)this + 2) + v2 * (*(double *)this + v3 * 0.5);
  *(double *)this = v4 + v3;
  *((double *)this + 4) = result;
  return result;
}

double *RateRamp::AdjustEndTime(double *this, double a2)
{
  this[5] = a2;
  double v2 = a2 - a2;
  double v3 = this[1];
  this[3] = v2 * v3 + this[3];
  this[1] = v3;
  return this;
}

double RateRamp::InputTimeForOutputTime(RateRamp *this, double a2)
{
  double v2 = *((double *)this + 5);
  if (v2 <= a2)
  {
    double v4 = (a2 - v2) * *((double *)this + 1);
    double v3 = *((double *)this + 3);
  }
  else
  {
    double v3 = (a2 - *((double *)this + 4)) * (*(double *)this + *((double *)this + 6) * 0.5 * (a2 - *((double *)this + 4)));
    double v4 = *((double *)this + 2);
  }
  return v4 + v3;
}

double RateRamp::RateForOutputTime(RateRamp *this, double a2)
{
  if (*((double *)this + 5) <= a2) {
    return *((double *)this + 1);
  }
  else {
    return *(double *)this + *((double *)this + 6) * (a2 - *((double *)this + 4));
  }
}

double *RateRamp::StartAfter(double *this, const RateRamp *a2)
{
  double v2 = *((double *)a2 + 3);
  this[2] = v2;
  double v3 = *((double *)a2 + 5);
  double v4 = this[3] - v2;
  double v5 = *this;
  double v6 = this[1];
  double v7 = v4 / ((*this + v6) * 0.5);
  this[4] = v3;
  this[5] = v3 + v7;
  double v8 = 0.0;
  if (v7 != 0.0) {
    double v8 = (v6 - v5) / v7;
  }
  this[6] = v8;
  return this;
}

float64x2_t RateRamp::OffsetTimes(float64x2_t *this, double a2, double a3)
{
  float64x2_t result = vaddq_f64(this[1], (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a2, 0));
  float64x2_t v4 = vaddq_f64(this[2], (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0));
  this[1] = result;
  this[2] = v4;
  return result;
}

float64x2_t RateRamp::ScaleRates(float64x2_t *this, double a2)
{
  float64x2_t result = vmulq_n_f64(*this, a2);
  *this = result;
  return result;
}

double *RateRamp::operator=(double *result, double *a2)
{
  double v2 = *a2;
  double v3 = a2[1];
  *float64x2_t result = *a2;
  result[1] = v3;
  double v4 = a2[2];
  double v5 = a2[3];
  result[2] = v4;
  result[3] = v5;
  double v6 = a2[4];
  double v7 = (v5 - v4) / ((v2 + v3) * 0.5);
  result[4] = v6;
  result[5] = v6 + v7;
  double v8 = 0.0;
  if (v7 != 0.0) {
    double v8 = (v3 - v2) / v7;
  }
  result[6] = v8;
  return result;
}

__n128 RateRamp::operator AURateRampStruct@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v2;
  __n128 result = *(__n128 *)(a1 + 32);
  *(__n128 *)(a2 + 32) = result;
  return result;
}

BOOL RateRamp::IsInputTimeInRange(RateRamp *this, double a2)
{
  return *((double *)this + 2) <= a2 && *((double *)this + 3) > a2;
}

BOOL RateRamp::IsOutputTimeInRange(RateRamp *this, double a2)
{
  return *((double *)this + 4) <= a2 && *((double *)this + 5) > a2;
}

double RateRamp::OutputTimeForInputTime(RateRamp *this, double a2)
{
  double v2 = *((double *)this + 3);
  if (v2 <= a2)
  {
    double v8 = (double *)((char *)this + 40);
    double v7 = (a2 - v2) / *((double *)this + 1);
  }
  else
  {
    double v3 = a2 - *((double *)this + 2);
    double v4 = *((double *)this + 6);
    BOOL v5 = v4 == 0.0;
    double v6 = (sqrt(*(double *)this * *(double *)this + (v4 + v4) * v3) - *(double *)this) / v4;
    double v7 = v3 / *(double *)this;
    if (!v5) {
      double v7 = v6;
    }
    double v8 = (double *)((char *)this + 32);
  }
  return v7 + *v8;
}

uint64_t RateRamp::Segment(RateRamp *this, double a2, double *a3, double a4, RateRamp *a5)
{
  double v9 = *a3;
  if (*a3 > a4) {
    double v9 = a4;
  }
  *a3 = v9;
  double v10 = *((double *)this + 5);
  if (v10 <= a2)
  {
    *((void *)a5 + 6) = 0;
    uint64_t v12 = *((void *)this + 1);
    *(void *)a5 = v12;
    *((void *)a5 + 1) = v12;
    *((double *)a5 + 4) = a2;
    double v13 = *((double *)this + 1);
    double v14 = (a2 - v10) * v13;
    double v15 = *((double *)this + 3);
    *((double *)a5 + 2) = v14 + v15;
    double v16 = floor(v10 + (v14 + a4) / v13);
    if (*a3 + a2 < v16) {
      double v16 = *a3 + a2;
    }
    *((double *)a5 + 5) = v16;
    double v17 = *((double *)this + 5);
    if (v17 <= v16)
    {
      double v18 = v13 * (v16 - v17);
    }
    else
    {
      double v15 = (v16 - *((double *)this + 4))
          * (*(double *)this + *((double *)this + 6) * 0.5 * (v16 - *((double *)this + 4)));
      double v18 = *((double *)this + 2);
    }
    *((double *)a5 + 3) = v15 + v18;
    *a3 = v16 - a2;
  }
  else
  {
    if (*((double *)this + 4) > a2) {
      return 0;
    }
    *((void *)a5 + 6) = *((void *)this + 6);
    *((double *)a5 + 4) = a2;
    double v19 = *((double *)this + 4);
    double v20 = *((double *)this + 6) * 0.5;
    double v21 = *(double *)this;
    double v22 = *((double *)this + 2) + (a2 - v19) * (*(double *)this + v20 * (a2 - v19));
    *((double *)a5 + 2) = v22;
    double v23 = floor(RateRamp::OutputTimeForInputTime(this, v22 + a4));
    if (v10 < v23) {
      double v23 = v10;
    }
    if (*a3 + a2 < v23) {
      double v23 = *a3 + a2;
    }
    *((double *)a5 + 5) = v23;
    double v24 = *((double *)this + 5);
    if (v24 <= v23)
    {
      double v26 = (v23 - v24) * *((double *)this + 1);
      double v25 = *((double *)this + 3);
    }
    else
    {
      double v25 = (v23 - v19) * (v21 + v20 * (v23 - v19));
      double v26 = *((double *)this + 2);
    }
    *((double *)a5 + 3) = v25 + v26;
    *a3 = v23 - a2;
    double v27 = *((double *)a5 + 4);
    double v28 = *((double *)this + 5);
    if (v28 <= v27) {
      double v29 = *((double *)this + 1);
    }
    else {
      double v29 = *(double *)this + *((double *)this + 6) * (v27 - *((double *)this + 4));
    }
    *(double *)a5 = v29;
    double v30 = *((double *)a5 + 5);
    if (v28 <= v30) {
      double v31 = *((double *)this + 1);
    }
    else {
      double v31 = *(double *)this + *((double *)this + 6) * (v30 - *((double *)this + 4));
    }
    *((double *)a5 + 1) = v31;
  }
  return 1;
}

double RateRamp::OutputDuration(RateRamp *this)
{
  return *((double *)this + 5) - *((double *)this + 4);
}

double RateRamp::InputDuration(RateRamp *this)
{
  return *((double *)this + 3) - *((double *)this + 2);
}

void RampList::~RampList(RampList *this)
{
}

{
  RampList::clear(this);
}

void *RampList::clear(RampList *this)
{
  __n128 result = (void *)*((void *)this + 1);
  if (result)
  {
    do
    {
      double v3 = (void *)*result;
      MEMORY[0x1AD112B70]();
      *((void *)this + 1) = v3;
      __n128 result = v3;
    }
    while (v3);
  }
  *(void *)this = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 2) = 0;
  return result;
}

void *RampList::Writer::clear(RampList **this)
{
  return RampList::clear(this[1]);
}

void RampList::Writer::push(RampList::Writer *this, const RateRamp *a2)
{
}

uint64_t RampList::Writer::front(RampList::Writer *this)
{
  return *(void *)(*((void *)this + 1) + 8) + 8;
}

{
  return *(void *)(*((void *)this + 1) + 8) + 8;
}

uint64_t RampList::Writer::back(RampList::Writer *this)
{
  return *(void *)(*((void *)this + 1) + 16) + 8;
}

{
  return *(void *)(*((void *)this + 1) + 16) + 8;
}

uint64_t RampList::Reader::front(RampList::Reader *this)
{
  return **((void **)this + 1) + 8;
}

{
  return **((void **)this + 1) + 8;
}

uint64_t RampList::Reader::AdvanceOutputTime(uint64_t this, double a2)
{
  double v2 = *(double ***)(this + 8);
  double v3 = *v2;
  if (*v2)
  {
    do
    {
      double v4 = v3;
      double v3 = *(double **)v3;
    }
    while (v3 && v4[6] < a2);
    *double v2 = v4;
  }
  return this;
}

uint64_t RampList::Reader::Segment(RampList::Reader *this, double a2, double *a3, double a4, RateRamp *a5)
{
  BOOL v5 = **(uint64_t ***)(*(void *)this + 8);
  do
  {
    double v6 = v5;
    if (!v5) {
      break;
    }
    if (*((double *)v5 + 6) > a2) {
      break;
    }
    BOOL v5 = (uint64_t *)*v5;
  }
  while (*v6);
  return RateRamp::Segment((RateRamp *)(v6 + 1), a2, a3, a4, a5);
}

unsigned int RateRamp::GetNumberOfInputFrames(RateRamp *this, double a2, unsigned int a3)
{
  double v3 = *((double *)this + 5);
  if (v3 <= a2)
  {
    double v5 = (a2 - v3) * *((double *)this + 1);
    double v4 = *((double *)this + 3);
  }
  else
  {
    double v4 = (a2 - *((double *)this + 4)) * (*(double *)this + *((double *)this + 6) * 0.5 * (a2 - *((double *)this + 4)));
    double v5 = *((double *)this + 2);
  }
  double v6 = (double)a3 + a2;
  if (v3 <= v6)
  {
    double v8 = (v6 - v3) * *((double *)this + 1);
    double v7 = *((double *)this + 3);
  }
  else
  {
    double v7 = (v6 - *((double *)this + 4)) * (*(double *)this + *((double *)this + 6) * 0.5 * (v6 - *((double *)this + 4)));
    double v8 = *((double *)this + 2);
  }
  return vcvtpd_u64_f64(v7 + v8 - (v4 + v5));
}

unsigned int RampList::Reader::GetNumberOfInputFrames(RampList::Reader *this, double a2, unsigned int a3)
{
  double v5 = **(double ***)(*(void *)this + 8);
  double v6 = RampList::RampListTimeFunctions<RampList::Reader>::InputTimeForOutputTime(v5, a2);
  return vcvtpd_u64_f64(RampList::RampListTimeFunctions<RampList::Reader>::InputTimeForOutputTime(v5, (double)a3 + a2) - v6);
}

double RampList::RampListTimeFunctions<RampList::Reader>::InputTimeForOutputTime(double *a1, double result)
{
  if (a1)
  {
    do
    {
      double v2 = a1;
      double v3 = a1[6];
      if (v3 > result) {
        break;
      }
      a1 = *(double **)a1;
    }
    while (*(void *)v2);
    if (v3 <= result)
    {
      double v5 = (result - v3) * v2[2];
      double v4 = v2[4];
    }
    else
    {
      double v4 = (result - v2[5]) * (v2[1] + v2[7] * 0.5 * (result - v2[5]));
      double v5 = v2[3];
    }
    return v4 + v5;
  }
  return result;
}

uint64_t RampList::Writer::AddRamp(RampList::Writer *this, RateRamp *a2)
{
  uint64_t v4 = *((void *)this + 1);
  double v5 = *(double *)(v4 + 32);
  double v7 = *((double *)a2 + 2);
  double v6 = *((double *)a2 + 3);
  double v8 = *(double *)a2;
  double v9 = *((double *)a2 + 1);
  double v10 = (v6 - v7) / ((*(double *)a2 + v9) * 0.5);
  *((double *)a2 + 4) = v5;
  *((double *)a2 + 5) = v5 + v10;
  double v11 = 0.0;
  if (v10 != 0.0) {
    double v11 = (v9 - v8) / v10;
  }
  *((double *)a2 + 6) = v11;
  if (!*(void *)(v4 + 8)) {
LABEL_11:
  }
    RampList::Writer::push(this, a2);
  uint64_t v12 = *(double **)(v4 + 16);
  double v13 = v12[4];
  if (v6 >= v13)
  {
    if (v7 - v13 > 1.0)
    {
      double v15 = v12[2];
      double v16 = v12[6];
      *(double *)double v19 = v15;
      *(double *)&v19[1] = v15;
      *(double *)&v19[2] = v13;
      *(double *)&v19[3] = v7;
      double v17 = (v7 - v13) / ((v15 + v15) * 0.5);
      *(double *)&v19[4] = v16;
      *(double *)&_OWORD v19[5] = v16 + v17;
      double v18 = 0.0;
      if (v17 != 0.0) {
        double v18 = (v15 - v15) / v17;
      }
      *(double *)&v19[6] = v18;
      RampList::Writer::push(this, (const RateRamp *)v19);
    }
    RateRamp::StartAfter((double *)a2, (const RateRamp *)(v12 + 1));
    goto LABEL_11;
  }
  return 0;
}

void *RampList::Writer::AddRamps(RampList::Writer *a1, int a2, uint64_t a3, double a4, double a5, double a6)
{
  LODWORD(v7) = a2;
  __n128 result = RampList::Writer::AdvanceOutputTime(a1);
  if (v7)
  {
    uint64_t v7 = v7;
    float64x2_t v25 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a4, 0);
    float64x2_t v26 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a6, 0);
    double v10 = (double *)(a3 + 32);
    float64x2_t v23 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a5, 0);
    do
    {
      double v11 = (const double *)(*((void *)a1 + 1) + 40);
      float64x2_t v12 = vld1q_dup_f64(v11);
      float64x2_t v13 = *(float64x2_t *)(v10 - 4);
      float64x2_t v14 = vaddq_f64(v12, *(float64x2_t *)(v10 - 2));
      *((float64x2_t *)v10 - 1) = v14;
      float64x2_t v15 = vmulq_n_f64(v13, a6);
      float64x2_t v16 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v15, v25), (int8x16_t)v15, (int8x16_t)v25);
      float64x2_t v17 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v23, v16), (int8x16_t)v16, (int8x16_t)v23);
      float64x2_t v28 = v17;
      v13.f64[0] = *(v10 - 1);
      double v18 = *v10;
      float64_t v29 = v14.f64[0];
      float64_t v30 = v13.f64[0];
      double v19 = (v13.f64[0] - v14.f64[0]) / (vaddvq_f64(v17) * 0.5);
      *(double *)&long long v31 = v18;
      *((double *)&v31 + 1) = v18 + v19;
      double v20 = 0.0;
      if (v19 != 0.0) {
        double v20 = (v17.f64[1] - v17.f64[0]) / v19;
      }
      double v32 = v20;
      __n128 result = (void *)RampList::Writer::AddRamp(a1, (RateRamp *)&v28);
      long long v21 = v31;
      *((float64x2_t *)v10 - 2) = vdivq_f64(v28, v26);
      *(_OWORD *)double v10 = v21;
      v10 += 6;
      --v7;
    }
    while (v7);
  }
  return result;
}

void *RampList::Writer::AdvanceOutputTime(RampList::Writer *this)
{
  double v3 = (void *)**((void **)this + 1);
  __n128 result = *(void **)(*((void *)this + 1) + 8);
  if (result != v3)
  {
    do
    {
      uint64_t v4 = (void *)*result;
      MEMORY[0x1AD112B70]();
      double v5 = (void *)*((void *)this + 1);
      --v5[3];
      v5[1] = v4;
      __n128 result = v4;
    }
    while (v4 != (void *)*v5);
  }
  return result;
}

uint64_t RampList::Writer::GetRamps(uint64_t result, unsigned int *a2, uint64_t a3, double a4)
{
  unint64_t v4 = *a2;
  double v5 = *(uint64_t **)(*(void *)(result + 8) + 8);
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v7 = (_OWORD *)(a3 + 32);
    unint64_t v8 = 1;
    do
    {
      float64x2_t v9 = *(float64x2_t *)(v5 + 1);
      long long v10 = *(_OWORD *)(v5 + 5);
      *(v7 - 1) = *(_OWORD *)(v5 + 3);
      *uint64_t v7 = v10;
      *(v7 - 2) = vmulq_n_f64(v9, a4);
      if (v8 >= v4) {
        break;
      }
      double v5 = (uint64_t *)*v5;
      ++v8;
      v7 += 3;
    }
    while (v5);
  }
  return result;
}

uint64_t RampList::Writer::SetOrigin(uint64_t this, double a2, double a3)
{
  uint64_t v3 = *(void *)(this + 8);
  unint64_t v4 = *(uint64_t **)(v3 + 8);
  if (v4)
  {
    double v5 = *(double *)(v3 + 40);
    double v6 = *(double *)(v3 + 48);
    *(double *)(v3 + 4CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = a2;
    *(double *)(v3 + 48) = a3;
    *(double *)&uint64_t v7 = a2 - v5;
    double v8 = a3 - v6;
    float64x2_t v9 = (float64x2_t)vdupq_lane_s64(v7, 0);
    float64x2_t v10 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v8, 0);
    do
    {
      *(float64x2_t *)(v4 + 3) = vaddq_f64(v9, *(float64x2_t *)(v4 + 3));
      *(float64x2_t *)(v4 + 5) = vaddq_f64(v10, *(float64x2_t *)(v4 + 5));
      unint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
    *(double *)(v3 + 32) = v8 + *(double *)(v3 + 32);
  }
  else
  {
    *(double *)(v3 + 32) = a3;
  }
  return this;
}

uint64_t RampList::Writer::ScaleRates(uint64_t this, double a2)
{
  for (uint64_t i = *(uint64_t **)(*(void *)(this + 8) + 8); i; uint64_t i = (uint64_t *)*i)
    *(float64x2_t *)(i + 1) = vmulq_n_f64(*(float64x2_t *)(i + 1), a2);
  return this;
}

uint64_t RampList::Writer::Print(uint64_t this, __sFILE *a2)
{
  for (uint64_t i = *(void **)(*(void *)(this + 8) + 8); i; uint64_t i = (void *)*i)
    this = RateRamp::Print((RateRamp *)(i + 1), a2);
  return this;
}

uint64_t RateRamp::Print(RateRamp *this, __sFILE *a2)
{
  return fprintf(a2, "    Slope                     %12.6f\n", *((double *)this + 6));
}

uint64_t RampList::Reader::Print(uint64_t this, __sFILE *a2)
{
  for (uint64_t i = **(void ***)(this + 8); i; uint64_t i = (void *)*i)
    this = RateRamp::Print((RateRamp *)(i + 1), a2);
  return this;
}

BOOL CACFDictionary::HasKey(CFDictionaryRef *this, const __CFString *a2)
{
  return CFDictionaryContainsKey(*this, a2) != 0;
}

const __CFDictionary *CACFDictionary::Size(const __CFDictionary **this)
{
  CFDictionaryRef result = *this;
  if (result) {
    return (const __CFDictionary *)CFDictionaryGetCount(result);
  }
  return result;
}

void CACFDictionary::GetKeys(CFDictionaryRef *this, const void **a2)
{
}

void CACFDictionary::GetKeysAndValues(CFDictionaryRef *this, const void **a2, const void **a3)
{
}

const __CFDictionary *CACFDictionary::GetCFType(const __CFDictionary **this, const __CFString *a2, const void **a3)
{
  CFDictionaryRef result = *this;
  if (result)
  {
    int Value = CFDictionaryGetValue(result, a2);
    *a3 = Value;
    return Value;
  }
  return result;
}

uint64_t CACFDictionary::GetSInt32(CACFDictionary *this, const __CFString *a2, int *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFNumberRef v5 = (const __CFNumber *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetSInt64(CACFDictionary *this, const __CFString *a2, uint64_t *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFNumberRef v5 = (const __CFNumber *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetUInt64(CACFDictionary *this, const __CFString *a2, unint64_t *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFNumberRef v5 = (const __CFNumber *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetFloat32FromString(CACFDictionary *this, const __CFString *a2, float *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFStringRef v5 = (const __CFString *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFStringGetTypeID())
      {
        Doubleint Value = CFStringGetDoubleValue(v5);
        *a3 = DoubleValue;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetUInt32FromString(CACFDictionary *this, const __CFString *a2, SInt32 *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFStringRef v5 = (const __CFString *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFStringGetTypeID())
      {
        *a3 = CFStringGetIntValue(v5);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetFloat64(CACFDictionary *this, const __CFString *a2, double *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFNumberRef v5 = (const __CFNumber *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberFloat64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetFixed32(CACFDictionary *this, const __CFString *a2, float *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFNumberRef v5 = (const __CFNumber *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        int valuePtr = 0;
        CFNumberGetValue(v5, kCFNumberSInt32Type, &valuePtr);
        float v7 = 1.0;
        if (valuePtr < 0) {
          float v7 = -1.0;
        }
        *a3 = v7
            * (float)((float)((float)(unsigned __int16)(valuePtr * (int)v7) * 0.000015259)
                    + (float)(((valuePtr * (int)v7) >> 16) & 0x7FFF));
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetFixed64(CACFDictionary *this, const __CFString *a2, double *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFNumberRef v5 = (const __CFNumber *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        uint64_t valuePtr = 0;
        CFNumberGetValue(v5, kCFNumberSInt64Type, &valuePtr);
        *a3 = (double)valuePtr * 2.32830644e-10 + (double)(valuePtr >> 32);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::Get4CC(CACFDictionary *this, const __CFString *a2, unsigned int *a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFNumberRef v5 = (const __CFNumber *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
        return 1;
      }
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 == CFStringGetTypeID() && CFStringGetLength((CFStringRef)v5) == 4)
      {
        CFStringGetCString((CFStringRef)v5, buffer, 5, 0x600u);
        *a3 = bswap32(*(unsigned int *)buffer);
        return 1;
      }
      return 0;
    }
  }
  return result;
}

uint64_t CACFDictionary::GetData(CACFDictionary *this, const __CFString *a2, const __CFData **a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFDataRef v5 = (const __CFData *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFDataGetTypeID())
      {
        *a3 = v5;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetURL(CACFDictionary *this, const __CFString *a2, const __CFURL **a3)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      CFURLRef v5 = (const __CFURL *)result;
      CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFURLGetTypeID())
      {
        *a3 = v5;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

BOOL CACFDictionary::GetCFTypeWithCStringKey(CFDictionaryRef *this, const char *a2, const void **a3)
{
  if (!*this) {
    return 0;
  }
  CFStringRef v5 = CFStringCreateWithCString(0, a2, 0x600u);
  CFStringRef v9 = v5;
  char v10 = 1;
  if (v5 && *this)
  {
    int Value = CFDictionaryGetValue(*this, v5);
    *a3 = Value;
    BOOL v7 = Value != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  CACFString::~CACFString((CACFString *)&v9);
  return v7;
}

void sub_1ABAE317C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

const __CFDictionary *CACFDictionary::GetCACFArray(const __CFDictionary **this, const __CFString *a2, CACFArray *a3)
{
  CACFArray::operator=((uint64_t)a3, 0);
  CFDictionaryRef result = *this;
  if (*this)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFDictionaryRef v7 = result;
      CFTypeID v8 = CFGetTypeID(result);
      CFDictionaryRef result = (const __CFDictionary *)CFArrayGetTypeID();
      if ((const __CFDictionary *)v8 == result)
      {
        return (const __CFDictionary *)CACFArray::operator=((uint64_t)a3, v7);
      }
    }
  }
  return result;
}

uint64_t CACFArray::operator=(uint64_t a1, const void *a2)
{
  if (!*(unsigned char *)(a1 + 8))
  {
    *(void *)a1 = a2;
    *(unsigned char *)(a1 + 9) = 0;
    return a1;
  }
  unint64_t v4 = *(const void **)a1;
  if (!*(void *)a1)
  {
    *(void *)a1 = a2;
    *(unsigned char *)(a1 + 9) = 0;
    if (!a2) {
      return a1;
    }
LABEL_8:
    CFRetain(a2);
    return a1;
  }
  CFRelease(v4);
  int v5 = *(unsigned __int8 *)(a1 + 8);
  *(void *)a1 = a2;
  *(unsigned char *)(a1 + 9) = 0;
  if (a2 && v5) {
    goto LABEL_8;
  }
  return a1;
}

const __CFDictionary *CACFDictionary::GetCACFDictionary(const __CFDictionary **this, const __CFString *a2, CACFDictionary *a3)
{
  CACFArray::operator=((uint64_t)a3, 0);
  CFDictionaryRef result = *this;
  if (*this)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFDictionaryRef v7 = result;
      CFTypeID v8 = CFGetTypeID(result);
      CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetTypeID();
      if ((const __CFDictionary *)v8 == result)
      {
        return (const __CFDictionary *)CACFArray::operator=((uint64_t)a3, v7);
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::AddBool(CACFDictionary *this, const __CFString *key, int a3)
{
  int v5 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    int v5 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  CFTypeID v6 = *v5;
  double v11 = v6;
  char v12 = 1;
  if (v6) {
    CFRetain(v6);
  }
  if (!*((unsigned char *)this + 9) || ((v7 = *(__CFDictionary **)this, v6) ? (BOOL v8 = v7 == 0) : (BOOL v8 = 1), v8))
  {
    uint64_t v9 = 0;
  }
  else
  {
    CFDictionarySetValue(v7, key, v6);
    uint64_t v9 = 1;
  }
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v11);
  return v9;
}

void sub_1ABAE33C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t CACFDictionary::AddCFType(CACFDictionary *this, const __CFString *a2, const void *a3)
{
  if (!*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t result = 0;
  if (a3)
  {
    int v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddSInt32(CFMutableDictionaryRef *this, const __CFString *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (*((unsigned char *)this + 9))
  {
    uint64_t v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_1ABAE34B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

void CACFNumber::~CACFNumber(CACFNumber *this)
{
  if (*((unsigned char *)this + 8))
  {
    double v2 = *(const void **)this;
    if (*(void *)this) {
      CFRelease(v2);
    }
  }
}

uint64_t CACFDictionary::AddUInt32(CFMutableDictionaryRef *this, const __CFString *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (*((unsigned char *)this + 9))
  {
    uint64_t v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_1ABAE3590(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddSInt64(CFMutableDictionaryRef *this, const __CFString *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (*((unsigned char *)this + 9))
  {
    uint64_t v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_1ABAE3634(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddUInt64(CFMutableDictionaryRef *this, const __CFString *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (*((unsigned char *)this + 9))
  {
    uint64_t v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_1ABAE36D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddFloat32(CFMutableDictionaryRef *this, const __CFString *a2, float a3)
{
  float valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (*((unsigned char *)this + 9))
  {
    uint64_t v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_1ABAE377C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddFloat64(CFMutableDictionaryRef *this, const __CFString *a2, double a3)
{
  double valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberFloat64Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (*((unsigned char *)this + 9))
  {
    uint64_t v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_1ABAE3820(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddNumber(CACFDictionary *this, const __CFString *a2, const __CFNumber *a3)
{
  if (!*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t result = 0;
  if (a3)
  {
    CFNumberRef v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddString(CACFDictionary *this, const __CFString *a2, const __CFString *a3)
{
  if (!*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t result = 0;
  if (a3)
  {
    CFNumberRef v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddArray(CACFDictionary *this, const __CFString *a2, const __CFArray *a3)
{
  if (!*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t result = 0;
  if (a3)
  {
    CFNumberRef v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddDictionary(CACFDictionary *this, const __CFString *a2, const __CFDictionary *a3)
{
  if (!*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t result = 0;
  if (a3)
  {
    CFNumberRef v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddData(CACFDictionary *this, const __CFString *a2, const __CFData *a3)
{
  if (!*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t result = 0;
  if (a3)
  {
    CFNumberRef v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddURL(CACFDictionary *this, const __CFString *a2, const __CFURL *a3)
{
  if (!*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t result = 0;
  if (a3)
  {
    CFNumberRef v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddCFTypeWithCStringKey(CFMutableDictionaryRef *this, const char *a2, const void *a3)
{
  if (!a2) {
    return 0;
  }
  CFStringRef v5 = CFStringCreateWithCString(0, a2, 0x600u);
  CFStringRef v8 = v5;
  char v9 = 1;
  if (v5 && *((unsigned char *)this + 9))
  {
    uint64_t v6 = 0;
    if (a3 && *this)
    {
      CFDictionarySetValue(*this, v5, a3);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  CACFString::~CACFString((CACFString *)&v8);
  return v6;
}

void sub_1ABAE3A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t CACFDictionary::AddCString(CFMutableDictionaryRef *this, const __CFString *a2, const char *cStr)
{
  if (!cStr) {
    return 0;
  }
  CFStringRef v5 = CFStringCreateWithCString(0, cStr, 0x600u);
  CFStringRef v8 = v5;
  char v9 = 1;
  if (v5 && *((unsigned char *)this + 9) && *this)
  {
    CFDictionarySetValue(*this, a2, v5);
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
  }
  CACFString::~CACFString((CACFString *)&v8);
  return v6;
}

void sub_1ABAE3B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void CACFDictionary::PrintToLog(CACFDictionary *this, const __CFString *a2)
{
  unint64_t Count = CFDictionaryGetCount(this);
  if (Count)
  {
    unint64_t v5 = Count;
    if (Count >> 61) {
      std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v6 = operator new(8 * Count);
    bzero(v6, 8 * v5);
    CFDictionaryRef v7 = operator new(8 * v5);
    bzero(v7, 8 * v5);
    CFDictionaryGetKeysAndValues(this, (const void **)v6, (const void **)v7);
    for (uint64_t i = 0; i != v5; ++i)
    {
      CACFString::PrintToLog(*((const __CFString **)v6 + i), a2);
      CFTypeID v9 = CFGetTypeID(*((CFTypeRef *)v7 + i));
      if (v9 == CFBooleanGetTypeID())
      {
        CACFBoolean::PrintToLog(*((CACFBoolean **)v7 + i), (const __CFBoolean *)(a2 + 1));
      }
      else if (v9 == CFNumberGetTypeID())
      {
        CACFNumber::PrintToLog(*((CACFNumber **)v7 + i), (const __CFNumber *)(a2 + 1));
      }
      else if (v9 == CFStringGetTypeID())
      {
        CACFString::PrintToLog(*((const __CFString **)v7 + i), (const __CFString *)(a2 + 1));
      }
      else if (v9 == CFDictionaryGetTypeID())
      {
        CACFDictionary::PrintToLog(*((CACFDictionary **)v7 + i), (const __CFDictionary *)(a2 + 1), v10);
      }
      else if (v9 == CFArrayGetTypeID())
      {
        CACFArray::PrintToLog(*((CACFArray **)v7 + i), (const __CFArray *)(a2 + 1));
      }
    }
    operator delete(v7);
    operator delete(v6);
  }
}

void sub_1ABAE3C90(_Unwind_Exception *a1)
{
  operator delete(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void RamstadKernel::RamstadKernel(RamstadKernel *this, int a2, int a3, double a4, int a5)
{
  *(double *)this = a4;
  double v6 = 1.0 / (double)a3;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = a3;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  memset(v16, 0, sizeof(v16));
  uint64_t v15 = 0;
  CFDictionaryRef v7 = (char **)((char *)this + 40);
  int v8 = a5 + a3;
  memset(v14, 0, sizeof(v14));
  if (a2 > 10)
  {
    *((_DWORD *)this + 2) = 11;
    _ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((void *)this + 2, 0, 4uLL, (char *)v16);
    _ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_(v7, *v7, 4 * v8, (char *)v16);
    uint64_t v11 = *((void *)this + 2);
    ramstadPrecalculateCoeffs<float>(*((_DWORD *)this + 2), (uint64_t)&kRamstadASRCPoles22, (uint64_t)&kRamstadASRCResidues22, (uint64_t)v14, (float *)v11, (float *)(v11 + 64), *(double *)this);
    *(_OWORD *)(v11 + 48) = *(_OWORD *)(v11 + 32);
    *(_OWORD *)(v11 + 112) = *(_OWORD *)(v11 + 96);
    if (v8 >= 1)
    {
      uint64_t v12 = (uint64_t)(*v7 + 64);
      double v13 = 0.0;
      do
      {
        ramstadBackEndCoeffs<float>(*((_DWORD *)this + 2), (uint64_t)v14, (float *)(v12 - 64), (_DWORD *)v12, v13);
        *(_OWORD *)(v12 - 16) = *(_OWORD *)(v12 - 32);
        *(_OWORD *)(v12 + 48) = *(_OWORD *)(v12 + 32);
        v12 += 128;
        double v13 = v6 + v13;
        --v8;
      }
      while (v8);
    }
  }
  else
  {
    *((_DWORD *)this + 2) = 8;
    _ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((void *)this + 2, 0, 2uLL, (char *)v16);
    _ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_(v7, *v7, 2 * v8, (char *)v16);
    ramstadPrecalculateCoeffs<float>(*((_DWORD *)this + 2), (uint64_t)&kRamstadASRCPoles16, (uint64_t)&kRamstadASRCResidues16, (uint64_t)v14, *((float **)this + 2), (float *)(*((void *)this + 2) + 32), *(double *)this);
    if (v8 >= 1)
    {
      CFTypeID v9 = *v7;
      double v10 = 0.0;
      do
      {
        ramstadBackEndCoeffs<float>(*((_DWORD *)this + 2), (uint64_t)v14, (float *)v9, (_DWORD *)v9 + 8, v10);
        v9 += 64;
        double v10 = v6 + v10;
        --v8;
      }
      while (v8);
    }
  }
}

void sub_1ABAE3EC8(_Unwind_Exception *exception_object)
{
  unint64_t v5 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 48) = v5;
    operator delete(v5);
  }
  double v6 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 24) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

void _ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_(void *a1, char *__src, unint64_t a3, char *a4)
{
  if (a3)
  {
    unint64_t v4 = a4;
    double v6 = __src;
    CFTypeID v9 = (char *)a1[1];
    uint64_t v8 = a1[2];
    if (a3 <= (v8 - (uint64_t)v9) >> 5)
    {
      uint64_t v15 = v9 - __src;
      float64x2_t v16 = (char *)a1[1];
      uint64_t v17 = a3;
      if (a3 <= (v9 - __src) >> 5) {
        goto LABEL_16;
      }
      uint64_t v18 = 0;
      uint64_t v17 = v15 >> 5;
      float64x2_t v16 = &v9[32 * (a3 - (v15 >> 5))];
      uint64_t v19 = 32 * a3 - 32 * (v15 >> 5);
      do
      {
        double v20 = &v9[v18];
        long long v21 = *((_OWORD *)a4 + 1);
        *(_OWORD *)double v20 = *(_OWORD *)a4;
        *((_OWORD *)v20 + 1) = v21;
        v18 += 32;
      }
      while (v19 != v18);
      a1[1] = v16;
      if (v9 != __src)
      {
LABEL_16:
        double v22 = &__src[32 * a3];
        float64x2_t v23 = &v16[-32 * a3];
        double v24 = v16;
        if (v23 < v9)
        {
          double v24 = v16;
          do
          {
            long long v25 = *(_OWORD *)v23;
            long long v26 = *((_OWORD *)v23 + 1);
            v23 += 32;
            *(_OWORD *)double v24 = v25;
            *((_OWORD *)v24 + 1) = v26;
            v24 += 32;
          }
          while (v23 < v9);
        }
        a1[1] = v24;
        if (v16 != v22) {
          memmove(&v16[-32 * ((v16 - v22) >> 5)], __src, v16 - v22);
        }
        if (v6 <= v4)
        {
          if (a1[1] <= (unint64_t)v4) {
            unint64_t v27 = 0;
          }
          else {
            unint64_t v27 = a3;
          }
          v4 += 32 * v27;
        }
        do
        {
          long long v28 = *((_OWORD *)v4 + 1);
          *(_OWORD *)double v6 = *(_OWORD *)v4;
          *((_OWORD *)v6 + 1) = v28;
          v6 += 32;
          --v17;
        }
        while (v17);
      }
    }
    else
    {
      double v10 = (char *)*a1;
      unint64_t v11 = a3 + ((uint64_t)&v9[-*a1] >> 5);
      if (v11 >> 59) {
        std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v12 = v8 - (void)v10;
      if (v12 >> 4 > v11) {
        unint64_t v11 = v12 >> 4;
      }
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v13 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v13 = v11;
      }
      if (v13)
      {
        if (v13 >> 59) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        float64x2_t v14 = (char *)operator new(32 * v13);
      }
      else
      {
        float64x2_t v14 = 0;
      }
      float64_t v29 = &v14[32 * ((v6 - v10) >> 5)];
      float64_t v30 = &v29[32 * a3];
      uint64_t v31 = 32 * a3;
      double v32 = v29;
      do
      {
        long long v33 = *((_OWORD *)v4 + 1);
        *(_OWORD *)double v32 = *(_OWORD *)v4;
        *((_OWORD *)v32 + 1) = v33;
        v32 += 32;
        v31 -= 32;
      }
      while (v31);
      long long v34 = (char *)*a1;
      if ((char *)*a1 != v6)
      {
        long long v35 = v6;
        do
        {
          long long v36 = *((_OWORD *)v35 - 2);
          long long v37 = *((_OWORD *)v35 - 1);
          v35 -= 32;
          *((_OWORD *)v29 - 2) = v36;
          *((_OWORD *)v29 - 1) = v37;
          v29 -= 32;
        }
        while (v35 != v34);
        CFTypeID v9 = (char *)a1[1];
      }
      id v38 = &v14[32 * v13];
      if (v9 != v6) {
        memmove(v30, v6, v9 - v6);
      }
      std::__split_buffer<std::string> v39 = (char *)*a1;
      *a1 = v29;
      a1[1] = &v30[v9 - v6];
      a1[2] = v38;
      if (v39)
      {
        operator delete(v39);
      }
    }
  }
}

void ramstadPrecalculateCoeffs<float>(int a1, uint64_t a2, uint64_t a3, uint64_t a4, float *a5, float *a6, double a7)
{
  if (a1 >= 1)
  {
    double v9 = a7 * 3.14159265;
    uint64_t v10 = a1;
    unint64_t v11 = (double *)(a2 + 8);
    uint64_t v12 = (double *)(a3 + 8);
    unint64_t v13 = (double *)(a4 + 176);
    do
    {
      long double v14 = v9 * *(v11 - 1);
      double v15 = *v11;
      v11 += 2;
      double v16 = v9 * v15;
      double v17 = exp(v14);
      float v18 = (v17 + v17) * cos(v9 * v15);
      *a5++ = v18;
      float v19 = exp(v14 + v14);
      *a6++ = -v19;
      long double v20 = v9 * *(v12 - 1);
      double v21 = *v12;
      v12 += 2;
      long double v22 = hypot(v20, v9 * v21);
      *(v13 - 22) = v22 + v22;
      *(v13 - 11) = atan2(v9 * v21, v20);
      *unint64_t v13 = v14;
      v13[22] = v17;
      v13[11] = v16;
      ++v13;
      --v10;
    }
    while (v10);
  }
}

void ramstadBackEndCoeffs<float>(int a1, uint64_t a2, float *a3, _DWORD *a4, double a5)
{
  if (a1 >= 1)
  {
    uint64_t v8 = a1;
    double v9 = (double *)(a2 + 176);
    do
    {
      double v10 = *(v9 - 22);
      long double v11 = v10 * exp(*v9 * a5);
      double v12 = *(v9 - 11);
      double v13 = v9[11];
      double v14 = cos(v12 + v13 * a5);
      double v15 = v9[22];
      long double v16 = cos(v12 - v13 + v13 * a5);
      float v17 = v11 * v14;
      *a3++ = v17;
      *(float *)&long double v16 = v11 * -(v15 * v16);
      *a4++ = LODWORD(v16);
      ++v9;
      --v8;
    }
    while (v8);
  }
}

void RamstadKernelD::RamstadKernelD(RamstadKernelD *this, int a2, int a3, double a4, int a5)
{
  *(double *)this = a4;
  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = a3;
  double v6 = 1.0 / (double)a3;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  memset(v20, 0, sizeof(v20));
  uint64_t v19 = 0;
  CFDictionaryRef v7 = (double **)((char *)this + 40);
  int v8 = a5 + a3;
  memset(v18, 0, sizeof(v18));
  if (a2 > 10)
  {
    *((_DWORD *)this + 2) = 11;
    _ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((void *)this + 2, 0, 4uLL, (char *)v20);
    _ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_(v7, (char *)*v7, 4 * v8, (char *)v20);
    uint64_t v11 = *((void *)this + 2);
    ramstadPrecalculateCoeffs<double>(*((_DWORD *)this + 2), (uint64_t)&kRamstadASRCPoles22, (uint64_t)&kRamstadASRCResidues22, (uint64_t)v18, (long double *)v11, (long double *)(v11 + 128), *(double *)this);
    long long v12 = *(_OWORD *)(v11 + 80);
    *(_OWORD *)(v11 + 96) = *(_OWORD *)(v11 + 64);
    *(_OWORD *)(v11 + 112) = v12;
    long long v13 = *(_OWORD *)(v11 + 208);
    *(_OWORD *)(v11 + 224) = *(_OWORD *)(v11 + 192);
    *(_OWORD *)(v11 + 24CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = v13;
    if (v8 >= 1)
    {
      uint64_t v14 = (uint64_t)(*v7 + 16);
      double v15 = 0.0;
      do
      {
        ramstadBackEndCoeffs<double>(*((_DWORD *)this + 2), (uint64_t)v18, (double *)(v14 - 128), (double *)v14, v15);
        long long v16 = *(_OWORD *)(v14 - 48);
        *(_OWORD *)(v14 - 32) = *(_OWORD *)(v14 - 64);
        *(_OWORD *)(v14 - 16) = v16;
        long long v17 = *(_OWORD *)(v14 + 80);
        *(_OWORD *)(v14 + 96) = *(_OWORD *)(v14 + 64);
        *(_OWORD *)(v14 + 112) = v17;
        v14 += 256;
        double v15 = v6 + v15;
        --v8;
      }
      while (v8);
    }
  }
  else
  {
    *((_DWORD *)this + 2) = 8;
    _ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((void *)this + 2, 0, 2uLL, (char *)v20);
    _ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_(v7, (char *)*v7, 2 * v8, (char *)v20);
    ramstadPrecalculateCoeffs<double>(*((_DWORD *)this + 2), (uint64_t)&kRamstadASRCPoles16, (uint64_t)&kRamstadASRCResidues16, (uint64_t)v18, *((long double **)this + 2), (long double *)(*((void *)this + 2) + 64), *(double *)this);
    if (v8 >= 1)
    {
      double v9 = *v7;
      double v10 = 0.0;
      do
      {
        ramstadBackEndCoeffs<double>(*((_DWORD *)this + 2), (uint64_t)v18, v9, v9 + 8, v10);
        v9 += 16;
        double v10 = v6 + v10;
        --v8;
      }
      while (v8);
    }
  }
}

void sub_1ABAE44F4(_Unwind_Exception *exception_object)
{
  unint64_t v5 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 48) = v5;
    operator delete(v5);
  }
  double v6 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 24) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

void _ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_(void *a1, char *__src, unint64_t a3, char *a4)
{
  if (a3)
  {
    unint64_t v4 = a4;
    double v6 = __src;
    double v9 = (char *)a1[1];
    uint64_t v8 = a1[2];
    if (a3 <= (v8 - (uint64_t)v9) >> 6)
    {
      uint64_t v15 = v9 - __src;
      long long v16 = (char *)a1[1];
      uint64_t v17 = a3;
      if (a3 <= (v9 - __src) >> 6) {
        goto LABEL_16;
      }
      uint64_t v18 = 0;
      uint64_t v17 = v15 >> 6;
      long long v16 = &v9[64 * (a3 - (v15 >> 6))];
      uint64_t v19 = (a3 << 6) - (v15 >> 6 << 6);
      do
      {
        long double v20 = &v9[v18];
        long long v22 = *(_OWORD *)a4;
        long long v21 = *((_OWORD *)a4 + 1);
        long long v23 = *((_OWORD *)a4 + 3);
        *((_OWORD *)v20 + 2) = *((_OWORD *)a4 + 2);
        *((_OWORD *)v20 + 3) = v23;
        *(_OWORD *)long double v20 = v22;
        *((_OWORD *)v20 + 1) = v21;
        v18 += 64;
      }
      while (v19 != v18);
      a1[1] = v16;
      if (v9 != __src)
      {
LABEL_16:
        double v24 = &__src[64 * a3];
        long long v25 = &v16[-64 * a3];
        long long v26 = v16;
        if (v25 < v9)
        {
          long long v26 = v16;
          do
          {
            long long v28 = *(_OWORD *)v25;
            long long v27 = *((_OWORD *)v25 + 1);
            long long v29 = *((_OWORD *)v25 + 3);
            *((_OWORD *)v26 + 2) = *((_OWORD *)v25 + 2);
            *((_OWORD *)v26 + 3) = v29;
            *(_OWORD *)long long v26 = v28;
            *((_OWORD *)v26 + 1) = v27;
            v26 += 64;
            v25 += 64;
          }
          while (v25 < v9);
        }
        a1[1] = v26;
        if (v16 != v24) {
          memmove(&v16[-64 * ((v16 - v24) >> 6)], __src, v16 - v24);
        }
        if (v6 <= v4)
        {
          if (a1[1] <= (unint64_t)v4) {
            unint64_t v30 = 0;
          }
          else {
            unint64_t v30 = a3;
          }
          v4 += 64 * v30;
        }
        do
        {
          long long v32 = *(_OWORD *)v4;
          long long v31 = *((_OWORD *)v4 + 1);
          long long v33 = *((_OWORD *)v4 + 3);
          *((_OWORD *)v6 + 2) = *((_OWORD *)v4 + 2);
          *((_OWORD *)v6 + 3) = v33;
          *(_OWORD *)double v6 = v32;
          *((_OWORD *)v6 + 1) = v31;
          v6 += 64;
          --v17;
        }
        while (v17);
      }
    }
    else
    {
      double v10 = (char *)*a1;
      unint64_t v11 = a3 + ((uint64_t)&v9[-*a1] >> 6);
      if (v11 >> 58) {
        std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v12 = v8 - (void)v10;
      if (v12 >> 5 > v11) {
        unint64_t v11 = v12 >> 5;
      }
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFC0) {
        unint64_t v13 = 0x3FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v13 = v11;
      }
      if (v13)
      {
        if (v13 >> 58) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        uint64_t v14 = (char *)operator new(v13 << 6);
      }
      else
      {
        uint64_t v14 = 0;
      }
      long long v34 = &v14[64 * ((v6 - v10) >> 6)];
      long long v35 = &v34[64 * a3];
      unint64_t v36 = a3 << 6;
      long long v37 = v34;
      do
      {
        long long v39 = *(_OWORD *)v4;
        long long v38 = *((_OWORD *)v4 + 1);
        long long v40 = *((_OWORD *)v4 + 3);
        *((_OWORD *)v37 + 2) = *((_OWORD *)v4 + 2);
        *((_OWORD *)v37 + 3) = v40;
        *(_OWORD *)long long v37 = v39;
        *((_OWORD *)v37 + 1) = v38;
        v37 += 64;
        v36 -= 64;
      }
      while (v36);
      uint64_t v41 = (char *)*a1;
      if ((char *)*a1 != v6)
      {
        long long v42 = v6;
        do
        {
          long long v43 = *((_OWORD *)v42 - 4);
          v42 -= 64;
          long long v45 = *((_OWORD *)v42 + 2);
          long long v44 = *((_OWORD *)v42 + 3);
          long long v46 = *((_OWORD *)v42 + 1);
          *((_OWORD *)v34 - 4) = v43;
          v34 -= 64;
          *((_OWORD *)v34 + 2) = v45;
          *((_OWORD *)v34 + 3) = v44;
          *((_OWORD *)v34 + 1) = v46;
        }
        while (v42 != v41);
        double v9 = (char *)a1[1];
      }
      int64_t v47 = &v14[64 * v13];
      if (v9 != v6) {
        memmove(v35, v6, v9 - v6);
      }
      float v48 = (char *)*a1;
      *a1 = v34;
      a1[1] = &v35[v9 - v6];
      a1[2] = v47;
      if (v48)
      {
        operator delete(v48);
      }
    }
  }
}

void ramstadPrecalculateCoeffs<double>(int a1, uint64_t a2, uint64_t a3, uint64_t a4, long double *a5, long double *a6, double a7)
{
  if (a1 >= 1)
  {
    double v9 = a7 * 3.14159265;
    uint64_t v10 = a1;
    unint64_t v11 = (double *)(a2 + 8);
    uint64_t v12 = (double *)(a3 + 8);
    unint64_t v13 = (double *)(a4 + 176);
    do
    {
      long double v14 = v9 * *(v11 - 1);
      double v15 = *v11;
      v11 += 2;
      double v16 = v9 * v15;
      double v17 = exp(v14);
      *a5++ = (v17 + v17) * cos(v9 * v15);
      *a6++ = -exp(v14 + v14);
      long double v18 = v9 * *(v12 - 1);
      double v19 = *v12;
      v12 += 2;
      long double v20 = hypot(v18, v9 * v19);
      *(v13 - 22) = v20 + v20;
      *(v13 - 11) = atan2(v9 * v19, v18);
      *unint64_t v13 = v14;
      v13[22] = v17;
      v13[11] = v16;
      ++v13;
      --v10;
    }
    while (v10);
  }
}

void ramstadBackEndCoeffs<double>(int a1, uint64_t a2, double *a3, double *a4, double a5)
{
  if (a1 >= 1)
  {
    uint64_t v8 = a1;
    double v9 = (double *)(a2 + 176);
    do
    {
      double v10 = *(v9 - 22);
      long double v11 = v10 * exp(*v9 * a5);
      double v12 = *(v9 - 11);
      double v13 = v9[11];
      double v14 = cos(v12 + v13 * a5);
      double v15 = v9[22];
      long double v16 = cos(v12 - v13 + v13 * a5);
      *a3++ = v11 * v14;
      *a4++ = v11 * -(v15 * v16);
      ++v9;
      --v8;
    }
    while (v8);
  }
}

void RamstadSRC::RamstadSRC(RamstadSRC *this, double a2, double a3, int a4, unsigned int a5)
{
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((double *)this + 4) = a2;
  *((double *)this + 5) = a3;
  *((_DWORD *)this + 12) = a4;
  *((_DWORD *)this + 18) = 0;
  *((_DWORD *)this + 22) = 1;
  *((unsigned char *)this + 92) = 0;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 1CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *((_OWORD *)this + 15) = 0u;
  *((void *)this + 32) = -1;
  if (a5 <= 0x3F) {
    int v5 = 8;
  }
  else {
    int v5 = 11;
  }
  *((_DWORD *)this + 66) = -1;
  *((_DWORD *)this + 14) = v5;
  *((unsigned char *)this + 93) = a5 > 0x5F;
  double v6 = floor(a2);
  BOOL v7 = v6 == a2;
  double v8 = a2 / a3;
  *((double *)this + 13) = dbl_1ABAFBCF0[a5 - 33 < 2];
  if (!v7 || (double v9 = floor(a3), v9 != a3))
  {
    *((void *)this + 12) = 0x3E80000000000000;
    *((unsigned char *)this + 92) = 0;
    *((_DWORD *)this + 13) = 256;
    uint64_t v18 = vcvtmd_s64_f64(v8);
    *((_DWORD *)this + 15) = v18;
    signed int v19 = vcvtmd_s64_f64((v8 - floor(v8)) * 2147483650.0);
    *((_DWORD *)this + 17) = v19;
    *((void *)this + 1CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = (v18 << 32 >> 1) + v19;
    *((void *)this + 32) = -1;
LABEL_26:
    *((_DWORD *)this + 66) = -1;
    goto LABEL_27;
  }
  int v10 = (int)v6;
  int v11 = (int)v9;
  if ((int)v6 >= 0) {
    int v12 = (int)v6;
  }
  else {
    int v12 = -v10;
  }
  if (v11 >= 0) {
    unsigned int v13 = (int)v9;
  }
  else {
    unsigned int v13 = -v11;
  }
  int v14 = 1;
  if (v12 >= 2 && v13 >= 2)
  {
    int v14 = v13;
    do
    {
      if (v12 <= v14) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v12;
      }
      if (v12 < v14) {
        int v14 = v12;
      }
      int v12 = v15 % v14;
    }
    while ((int)(v15 % v14) > 0);
  }
  int v16 = v11 / v14;
  if (v16 > 1280)
  {
    *((void *)this + 12) = 0x3E80000000000000;
    *((unsigned char *)this + 92) = 0;
    *((_DWORD *)this + 13) = 256;
    uint64_t v20 = vcvtmd_s64_f64(v8);
    *((_DWORD *)this + 15) = v20;
    signed int v21 = vcvtmd_s64_f64((v8 - floor(v8)) * 2147483650.0);
    *((_DWORD *)this + 17) = v21;
    *((void *)this + 1CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = (v20 << 32 >> 1) + v21;
    *((void *)this + 32) = -1;
    goto LABEL_26;
  }
  *((unsigned char *)this + 92) = 1;
  int v17 = v10 / v14;
  *((_DWORD *)this + 13) = v16;
  *((_DWORD *)this + 15) = v17 / v16;
  *((_DWORD *)this + 16) = v17;
  *((_DWORD *)this + 17) = v17 % v16;
LABEL_27:
  *((_DWORD *)this + 18) = 0;
  RamstadSRC::initFilter(this, 1.0 / v8, a5);
}

void sub_1ABAE4B38(_Unwind_Exception *exception_object)
{
  unint64_t v4 = (void *)v1[29];
  if (v4)
  {
    v1[30] = v4;
    operator delete(v4);
  }
  int v5 = (void *)v1[26];
  if (v5)
  {
    v1[27] = v5;
    operator delete(v5);
  }
  double v6 = (void *)v1[23];
  if (v6)
  {
    v1[24] = v6;
    operator delete(v6);
  }
  BOOL v7 = (void *)v1[20];
  if (v7)
  {
    v1[21] = v7;
    operator delete(v7);
  }
  double v8 = (void *)v1[17];
  if (v8)
  {
    v1[18] = v8;
    operator delete(v8);
  }
  double v9 = *v2;
  if (*v2)
  {
    v1[15] = v9;
    operator delete(v9);
  }
  int v10 = (std::__shared_weak_count *)v1[3];
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  int v11 = (std::__shared_weak_count *)v1[1];
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  _Unwind_Resume(exception_object);
}

char *RamstadSRC::initFilter(RamstadSRC *this, double a2, int a3)
{
  if (a3 == 34) {
    unsigned int v4 = vcvtpd_s64_f64(*((double *)this + 4) / *((double *)this + 5));
  }
  else {
    unsigned int v4 = 1;
  }
  *((_DWORD *)this + 22) = v4;
  double v5 = fmin(a2, 1.0) * *((double *)this + 13);
  unsigned int v6 = *((_DWORD *)this + 12);
  if (*((_DWORD *)this + 14) == 8) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = (3 * v6 + 1) >> 1;
  }
  if (!*((unsigned char *)this + 93))
  {
    long long v58 = 0u;
    long long v59 = 0u;
    _ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((void *)this + 14, *((char **)this + 14), v7, (char *)&v58);
    _ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((void *)this + 17, *((char **)this + 17), v7, (char *)&v58);
    {
      GetKernelFactory(void)::sFactory.__m_.__sig = 850045863;
      *(_OWORD *)GetKernelFactory(void)::sFactory.__m_.__opaque = 0u;
      *(_OWORD *)&GetKernelFactory(void)::sFactory.__m_.__opaque[16] = 0u;
      *(_OWORD *)&GetKernelFactory(void)::sFactory.__m_.__opaque[32] = 0u;
      *(_OWORD *)&GetKernelFactory(void)::sFactory.__m_.__opaque[48] = 0u;
      *(_OWORD *)&qword_1E98D1C50 = 0u;
    }
    int v27 = *((_DWORD *)this + 13);
    int v26 = *((_DWORD *)this + 14);
    int v28 = *((unsigned __int8 *)this + 92) ^ 1;
    std::mutex::lock(&GetKernelFactory(void)::sFactory);
    unint64_t v30 = qword_1E98D1C48;
    uint64_t v29 = qword_1E98D1C50;
    unint64_t v31 = qword_1E98D1C48;
    if (!qword_1E98D1C48 && qword_1E98D1C50) {
LABEL_55:
    }
      __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
    while (1)
    {
      unint64_t v32 = v30 + 40 * v29;
      if (v31 == v32) {
        break;
      }
      uint64_t v33 = *(void *)(v31 + 32);
      if (!v33 || *(void *)(v33 + 8) == -1)
      {
        if (v30 > v31) {
          goto LABEL_77;
        }
        if (!v30 && v29) {
          __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
        }
        if (v31 >= v32) {
LABEL_77:
        }
          __assert_rtn("erase", "vector.hpp", 2092, "this->priv_in_range(position)");
        if (v31 + 40 != v32)
        {
          uint64_t v34 = v31;
          do
          {
            uint64_t v35 = v34 + 40;
            uint64_t v36 = boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>::operator=(v34, v34 + 40)+ 80;
            uint64_t v34 = v35;
          }
          while (v36 != v32);
        }
        long long v37 = *(std::__shared_weak_count **)(v32 - 8);
        if (v37) {
          std::__shared_weak_count::__release_weak(v37);
        }
        unint64_t v30 = qword_1E98D1C48;
        uint64_t v29 = --qword_1E98D1C50;
      }
      else
      {
        v31 += 40;
      }
      if (v30) {
        BOOL v38 = 1;
      }
      else {
        BOOL v38 = v29 == 0;
      }
      if (!v38) {
        goto LABEL_55;
      }
    }
    int v62 = v26;
    int v63 = v27;
    double v64 = v5;
    char v65 = v28;
    long long v39 = (void *)boost::container::flat_map<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>,std::less<std::tuple<int,int,double,BOOL>>,void>::priv_subscript((uint64_t)&v62);
    long long v40 = (std::__shared_weak_count *)v39[1];
    if (v40)
    {
      uint64_t v41 = std::__shared_weak_count::lock(v40);
      long long v42 = v41;
      if (v41 && *v39)
      {
        *(void *)&long long v43 = *v39;
        *((void *)&v43 + 1) = v41;
        long long v57 = v43;
        goto LABEL_73;
      }
    }
    else
    {
      long long v42 = 0;
    }
    uint64_t v52 = operator new(0x58uLL);
    v52[1] = 0;
    v52[2] = 0;
    *uint64_t v52 = &unk_1F03036F0;
    RamstadKernel::RamstadKernel((RamstadKernel *)(v52 + 3), v26, v27, v5, v28 != 0);
    if (v42) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v42);
    }
    BOOL v53 = (void *)boost::container::flat_map<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>,std::less<std::tuple<int,int,double,BOOL>>,void>::priv_subscript((uint64_t)&v62);
    *(void *)&long long v54 = v52 + 3;
    *((void *)&v54 + 1) = v52;
    long long v57 = v54;
    atomic_fetch_add_explicit(v52 + 2, 1uLL, memory_order_relaxed);
    float v55 = (std::__shared_weak_count *)v53[1];
    *BOOL v53 = v52 + 3;
    v53[1] = v52;
    if (v55) {
      std::__shared_weak_count::__release_weak(v55);
    }
LABEL_73:
    std::mutex::unlock(&GetKernelFactory(void)::sFactory);
    float v48 = (std::__shared_weak_count *)*((void *)this + 1);
    *(_OWORD *)this = v57;
    if (!v48) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  _ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((void *)this + 20, *((char **)this + 20), v7, (char *)&v58);
  _ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((void *)this + 23, *((char **)this + 23), v7, (char *)&v58);
  {
    GetKernelFactoryD(void)::sFactory.__m_.__sig = 850045863;
    *(_OWORD *)GetKernelFactoryD(void)::sFactory.__m_.__opaque = 0u;
    *(_OWORD *)&GetKernelFactoryD(void)::sFactory.__m_.__opaque[16] = 0u;
    *(_OWORD *)&GetKernelFactoryD(void)::sFactory.__m_.__opaque[32] = 0u;
    *(_OWORD *)&GetKernelFactoryD(void)::sFactory.__m_.__opaque[48] = 0u;
    *(_OWORD *)&qword_1E98D1BF0 = 0u;
  }
  int v9 = *((_DWORD *)this + 13);
  int v8 = *((_DWORD *)this + 14);
  int v10 = *((unsigned __int8 *)this + 92) ^ 1;
  std::mutex::lock(&GetKernelFactoryD(void)::sFactory);
  unint64_t v12 = qword_1E98D1BE8;
  uint64_t v11 = qword_1E98D1BF0;
  unint64_t v13 = qword_1E98D1BE8;
  if (!qword_1E98D1BE8 && qword_1E98D1BF0) {
LABEL_29:
  }
    __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
  while (1)
  {
    unint64_t v14 = v12 + 40 * v11;
    if (v13 == v14) {
      break;
    }
    uint64_t v15 = *(void *)(v13 + 32);
    if (!v15 || *(void *)(v15 + 8) == -1)
    {
      if (v12 > v13) {
        goto LABEL_75;
      }
      if (!v12 && v11) {
        __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
      }
      if (v13 >= v14) {
LABEL_75:
      }
        __assert_rtn("erase", "vector.hpp", 2092, "this->priv_in_range(position)");
      if (v13 + 40 != v14)
      {
        uint64_t v16 = v13;
        do
        {
          uint64_t v17 = v16 + 40;
          uint64_t v18 = boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>::operator=(v16, v16 + 40)+ 80;
          uint64_t v16 = v17;
        }
        while (v18 != v14);
      }
      signed int v19 = *(std::__shared_weak_count **)(v14 - 8);
      if (v19) {
        std::__shared_weak_count::__release_weak(v19);
      }
      unint64_t v12 = qword_1E98D1BE8;
      uint64_t v11 = --qword_1E98D1BF0;
    }
    else
    {
      v13 += 40;
    }
    if (v12) {
      BOOL v20 = 1;
    }
    else {
      BOOL v20 = v11 == 0;
    }
    if (!v20) {
      goto LABEL_29;
    }
  }
  int v62 = v8;
  int v63 = v9;
  double v64 = v5;
  char v65 = v10;
  signed int v21 = (void *)boost::container::flat_map<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>,std::less<std::tuple<int,int,double,BOOL>>,void>::priv_subscript((uint64_t)&v62);
  long long v22 = (std::__shared_weak_count *)v21[1];
  if (v22)
  {
    long long v23 = std::__shared_weak_count::lock(v22);
    double v24 = v23;
    if (v23 && *v21)
    {
      *(void *)&long long v25 = *v21;
      *((void *)&v25 + 1) = v23;
      long long v56 = v25;
      goto LABEL_65;
    }
  }
  else
  {
    double v24 = 0;
  }
  long long v44 = operator new(0x58uLL);
  v44[1] = 0;
  v44[2] = 0;
  *long long v44 = &unk_1F0303728;
  RamstadKernelD::RamstadKernelD((RamstadKernelD *)(v44 + 3), v8, v9, v5, v10 != 0);
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  long long v45 = (void *)boost::container::flat_map<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>,std::less<std::tuple<int,int,double,BOOL>>,void>::priv_subscript((uint64_t)&v62);
  *(void *)&long long v46 = v44 + 3;
  *((void *)&v46 + 1) = v44;
  long long v56 = v46;
  atomic_fetch_add_explicit(v44 + 2, 1uLL, memory_order_relaxed);
  int64_t v47 = (std::__shared_weak_count *)v45[1];
  *long long v45 = v44 + 3;
  v45[1] = v44;
  if (v47) {
    std::__shared_weak_count::__release_weak(v47);
  }
LABEL_65:
  std::mutex::unlock(&GetKernelFactoryD(void)::sFactory);
  float v48 = (std::__shared_weak_count *)*((void *)this + 3);
  *((_OWORD *)this + 1) = v56;
  if (v48) {
LABEL_66:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v48);
LABEL_67:
  unint64_t v49 = *((unsigned int *)this + 12);
  LODWORD(v58) = 0;
  std::vector<float>::assign((char **)this + 26, v49, &v58);
  unint64_t v50 = *((unsigned int *)this + 12);
  LODWORD(v58) = 0;
  return std::vector<float>::assign((char **)this + 29, v50, &v58);
}

void sub_1ABAE51DC(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  std::mutex::unlock(&GetKernelFactory(void)::sFactory);
  _Unwind_Resume(a1);
}

char *std::vector<float>::assign(char **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v6 = (uint64_t)a1[2];
  uint64_t result = *a1;
  if (a2 <= (v6 - (uint64_t)result) >> 2)
  {
    unint64_t v13 = a1[1];
    unint64_t v14 = (v13 - result) >> 2;
    if (v14 >= a2) {
      uint64_t v15 = a2;
    }
    else {
      uint64_t v15 = (v13 - result) >> 2;
    }
    if (v15)
    {
      uint64_t v16 = result;
      do
      {
        *(_DWORD *)uint64_t v16 = *a3;
        v16 += 4;
        --v15;
      }
      while (v15);
    }
    if (a2 <= v14)
    {
      a1[1] = &result[4 * a2];
    }
    else
    {
      uint64_t v17 = &v13[4 * (a2 - v14)];
      uint64_t v18 = 4 * a2 - 4 * v14;
      do
      {
        *(_DWORD *)unint64_t v13 = *a3;
        v13 += 4;
        v18 -= 4;
      }
      while (v18);
      a1[1] = v17;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    uint64_t v8 = v6 >> 1;
    if (v6 >> 1 <= a2) {
      uint64_t v8 = a2;
    }
    if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v9 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v9 = v8;
    }
    uint64_t result = std::vector<float>::__vallocate[abi:ne180100](a1, v9);
    int v10 = a1[1];
    uint64_t v11 = &v10[4 * a2];
    uint64_t v12 = 4 * a2;
    do
    {
      *(_DWORD *)int v10 = *a3;
      v10 += 4;
      v12 -= 4;
    }
    while (v12);
    a1[1] = v11;
  }
  return result;
}

unint64_t boost::container::flat_map<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>,std::less<std::tuple<int,int,double,BOOL>>,void>::priv_subscript(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  unint64_t v1 = qword_1E98D1C48;
  uint64_t v2 = qword_1E98D1C50;
  if (qword_1E98D1C48) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = qword_1E98D1C50 == 0;
  }
  if (!v3) {
    __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
  }
  unint64_t v5 = qword_1E98D1C48;
  if (qword_1E98D1C50)
  {
    unint64_t v5 = qword_1E98D1C48;
    unint64_t v6 = qword_1E98D1C50;
    do
    {
      if (v6 != 1 && !v5) {
        __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
      }
      if (!v5) {
        __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
      }
      unsigned __int8 v7 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>(v5 + 40 * (v6 >> 1), a1);
      if (v7 != 129 && (v7 & 0x80u) != 0)
      {
        v5 += 40 * (v6 >> 1) + 40;
        v6 += ~(v6 >> 1);
      }
      else
      {
        v6 >>= 1;
      }
    }
    while (v6);
  }
  uint64_t v8 = (const char *)(v1 + 40 * v2);
  if ((const char *)v5 == v8) {
    goto LABEL_19;
  }
  if (!v5) {
    __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
  }
  unsigned __int8 v9 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>(a1, v5);
  if (v9 != 129 && (char)v9 < 0)
  {
LABEL_19:
    long long v32 = *(_OWORD *)a1;
    uint64_t v10 = *(void *)(a1 + 16);
    v34[0] = 0;
    v34[1] = 0;
    uint64_t v33 = v10;
    if (v1 > v5 || v5 > (unint64_t)v8)
    {
      long long v25 = "this->priv_in_range_or_end(hint)";
      int v26 = 879;
      int v27 = "flat_tree.hpp";
      int v28 = "insert_unique";
      goto LABEL_66;
    }
    uint64_t v29 = 0;
    if ((const char *)v5 != v8)
    {
      if (!v5) {
        __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
      }
      unsigned __int8 v12 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>((uint64_t)&v32, v5);
      if (v12 == 129 || ((char)v12 & 0x80000000) == 0)
      {
        unint64_t v30 = v1 + 40 * v2;
        if (!boost::container::dtl::flat_tree<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>,boost::container::dtl::select1st<std::tuple<int,int,double,BOOL>>,std::less<std::tuple<int,int,double,BOOL>>,boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>>>::priv_insert_unique_prepare(v5, &v30, (uint64_t)&v32, (uint64_t *)&v29))goto LABEL_51; {
LABEL_37:
        }
        uint64_t v15 = v29;
        uint64_t v16 = qword_1E98D1C48;
        if (qword_1E98D1C48 > (unint64_t)v29) {
          goto LABEL_63;
        }
        uint64_t v17 = qword_1E98D1C50;
        if (!qword_1E98D1C48 && qword_1E98D1C50) {
          __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
        }
        unint64_t v18 = qword_1E98D1C48 + 40 * qword_1E98D1C50;
        if ((unint64_t)v29 > v18)
        {
LABEL_63:
          long long v25 = "this->priv_in_range_or_end(position)";
          int v26 = 1862;
          int v27 = "vector.hpp";
          int v28 = "emplace";
        }
        else
        {
          if (qword_1E98D1C58 >= (unint64_t)qword_1E98D1C50)
          {
            if (qword_1E98D1C58 == qword_1E98D1C50)
            {
              boost::container::vector<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>,boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>>,void>::priv_insert_forward_range_no_capacity<boost::container::dtl::insert_emplace_proxy<boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>>,boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>*,boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>>>((boost::container *)&v31, v29, &v32);
            }
            else
            {
              if ((char *)v18 == v29)
              {
                long long v23 = v32;
                *((void *)v29 + 2) = v33;
                *(_OWORD *)uint64_t v15 = v23;
                *(_OWORD *)(v16 + 40 * v17 + 24) = *(_OWORD *)v34;
                v34[0] = 0;
                v34[1] = 0;
                ++qword_1E98D1C50;
              }
              else
              {
                uint64_t v19 = v18 - 40;
                *(_OWORD *)unint64_t v18 = *(_OWORD *)(v18 - 40);
                *(void *)(v18 + 16) = *(void *)(v18 - 24);
                *(_OWORD *)(v16 + 40 * v17 + 24) = *(_OWORD *)(v18 - 16);
                *(void *)(v18 - 16) = 0;
                *(void *)(v18 - 8) = 0;
                ++qword_1E98D1C50;
                if ((char *)(v18 - 40) != v15)
                {
                  do
                  {
                    BOOL v20 = (char *)(v19 - 40);
                    boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>::operator=(v19, v19 - 40);
                    uint64_t v19 = (uint64_t)v20;
                  }
                  while (v20 != v15);
                }
                *(_OWORD *)uint64_t v15 = v32;
                v15[16] = v33;
                long long v21 = *(_OWORD *)v34;
                v34[0] = 0;
                v34[1] = 0;
                long long v22 = (std::__shared_weak_count *)*((void *)v15 + 4);
                *(_OWORD *)(v15 + 24) = v21;
                if (v22) {
                  std::__shared_weak_count::__release_weak(v22);
                }
              }
              unint64_t v31 = v15;
            }
            goto LABEL_54;
          }
          long long v25 = "this->m_holder.capacity() >= this->m_holder.m_size";
          int v26 = 2821;
          int v27 = "vector.hpp";
          int v28 = "priv_insert_forward_range";
        }
LABEL_66:
        __assert_rtn(v28, v27, v26, v25);
      }
      uint64_t v8 = (const char *)v5;
    }
    uint64_t v29 = (char *)v8;
    if (v8 != (const char *)v1)
    {
      if (!v8) {
        __assert_rtn("operator--", "vector.hpp", 174, "!!m_ptr");
      }
      unsigned __int8 v13 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>((uint64_t)(v8 - 40), (uint64_t)&v32);
      if (v13 == 129 || ((char)v13 & 0x80000000) == 0)
      {
        unsigned __int8 v14 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>((uint64_t)&v32, (uint64_t)(v8 - 40));
        if (v14 == 129 || ((char)v14 & 0x80000000) == 0)
        {
          uint64_t v29 = (char *)(v8 - 40);
          goto LABEL_51;
        }
        unint64_t v31 = v8 - 40;
        if (!boost::container::dtl::flat_tree<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>,boost::container::dtl::select1st<std::tuple<int,int,double,BOOL>>,std::less<std::tuple<int,int,double,BOOL>>,boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>>>::priv_insert_unique_prepare(v1, &v31, (uint64_t)&v32, (uint64_t *)&v29))
        {
LABEL_51:
          if (!qword_1E98D1C48 && v29) {
            __assert_rtn("operator+", "vector.hpp", 188, "x.m_ptr || !off");
          }
          unint64_t v31 = v29;
LABEL_54:
          if (v34[1]) {
            std::__shared_weak_count::__release_weak(v34[1]);
          }
          unint64_t v5 = (unint64_t)v31;
          if (!v31) {
            __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
          }
          return v5 + 24;
        }
      }
    }
    goto LABEL_37;
  }
  return v5 + 24;
}

void sub_1ABAE58A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void std::__shared_ptr_emplace<RamstadKernel>::__on_zero_shared(void *a1)
{
  uint64_t v2 = (void *)a1[8];
  if (v2)
  {
    a1[9] = v2;
    operator delete(v2);
  }
  BOOL v3 = (void *)a1[5];
  if (v3)
  {
    a1[6] = v3;
    operator delete(v3);
  }
}

void std::__shared_ptr_emplace<RamstadKernel>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F03036F0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1AD112B70);
}

void std::__shared_ptr_emplace<RamstadKernel>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F03036F0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

uint64_t std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 < *(_DWORD *)a2) {
    uint64_t v2 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v2 = 1;
  }
  if (*(_DWORD *)a1 == *(_DWORD *)a2)
  {
    int v3 = *(_DWORD *)(a1 + 4);
    int v4 = *(_DWORD *)(a2 + 4);
    BOOL v5 = v3 == v4;
    uint64_t v2 = v3 < v4 ? 0xFFFFFFFFLL : 1;
    if (v5)
    {
      double v6 = *(double *)(a1 + 8);
      double v7 = *(double *)(a2 + 8);
      if (v6 == v7) {
        LODWORD(v2) = 0;
      }
      else {
        LODWORD(v2) = -127;
      }
      if (v6 > v7) {
        LODWORD(v2) = 1;
      }
      if (v6 < v7) {
        uint64_t v2 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v2 = v2;
      }
      if (!v2)
      {
        unsigned int v8 = *(unsigned __int8 *)(a1 + 16);
        unsigned int v9 = *(unsigned __int8 *)(a2 + 16);
        BOOL v10 = v8 == v9;
        if (v8 < v9) {
          LODWORD(v2) = -1;
        }
        else {
          LODWORD(v2) = 1;
        }
        if (v10) {
          return 0;
        }
        else {
          return v2;
        }
      }
    }
  }
  return v2;
}

uint64_t boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>::operator=(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 24);
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  int v4 = *(std::__shared_weak_count **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = v3;
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void boost::container::vector<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>,boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>>,void>::priv_insert_forward_range_no_capacity<boost::container::dtl::insert_emplace_proxy<boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>>,boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>*,boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>>>(boost::container *a1, const char *a2, long long *a3)
{
  if (qword_1E98D1C58 != qword_1E98D1C50) {
    __assert_rtn("next_capacity", "vector.hpp", 473, "additional_objects > size_type(this->m_capacity - this->m_size)");
  }
  if (qword_1E98D1C58 == 0x333333333333333) {
    goto LABEL_30;
  }
  if ((unint64_t)qword_1E98D1C58 >> 61 > 4) {
    uint64_t v3 = -1;
  }
  else {
    uint64_t v3 = 8 * qword_1E98D1C58;
  }
  if ((unint64_t)qword_1E98D1C58 >> 61) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 8 * qword_1E98D1C58 / 5uLL;
  }
  if (v4 >= 0x333333333333333) {
    unint64_t v4 = 0x333333333333333;
  }
  unint64_t v5 = qword_1E98D1C58 + 1 > v4 ? qword_1E98D1C58 + 1 : v4;
  if (v5 > 0x333333333333333) {
LABEL_30:
  }
    boost::container::throw_length_error(a1, a2);
  uint64_t v9 = qword_1E98D1C48;
  BOOL v10 = (char *)operator new(40 * v5);
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = qword_1E98D1C48;
  uint64_t v13 = qword_1E98D1C48 + 40 * qword_1E98D1C50;
  unsigned __int8 v14 = v10;
  if ((const char *)qword_1E98D1C48 != a2)
  {
    uint64_t v15 = qword_1E98D1C48;
    unsigned __int8 v14 = v10;
    do
    {
      long long v16 = *(_OWORD *)v15;
      *((void *)v14 + 2) = *(void *)(v15 + 16);
      *(_OWORD *)unsigned __int8 v14 = v16;
      *(_OWORD *)(v14 + 24) = *(_OWORD *)(v15 + 24);
      *(void *)(v15 + 24) = 0;
      *(void *)(v15 + 32) = 0;
      v14 += 40;
      v15 += 40;
    }
    while ((const char *)v15 != a2);
  }
  long long v17 = *a3;
  *((void *)v14 + 2) = *((void *)a3 + 2);
  *(_OWORD *)unsigned __int8 v14 = v17;
  *(_OWORD *)(v14 + 24) = *(long long *)((char *)a3 + 24);
  *((void *)a3 + 3) = 0;
  *((void *)a3 + 4) = 0;
  if ((const char *)v13 != a2)
  {
    unint64_t v18 = v14 + 64;
    uint64_t v19 = a2;
    do
    {
      long long v20 = *(_OWORD *)v19;
      *((void *)v18 - 1) = *((void *)v19 + 2);
      *(_OWORD *)((char *)v18 - 24) = v20;
      _OWORD *v18 = *(_OWORD *)(v19 + 24);
      unint64_t v18 = (_OWORD *)((char *)v18 + 40);
      *((void *)v19 + 3) = 0;
      *((void *)v19 + 4) = 0;
      v19 += 40;
    }
    while (v19 != (const char *)v13);
  }
  if (v12)
  {
    uint64_t v21 = qword_1E98D1C50;
    if (qword_1E98D1C50)
    {
      long long v22 = (std::__shared_weak_count **)(v12 + 32);
      do
      {
        if (*v22) {
          std::__shared_weak_count::__release_weak(*v22);
        }
        v22 += 5;
        --v21;
      }
      while (v21);
    }
    operator delete((void *)qword_1E98D1C48);
  }
  qword_1E98D1C48 = v11;
  ++qword_1E98D1C50;
  qword_1E98D1C58 = v5;
  *(void *)a1 = &a2[v11 - v9];
}

void boost::container::throw_length_error(boost::container *this, const char *a2)
{
  exception = __cxa_allocate_exception(0x10uLL);
  void *exception = &unk_1F03035C8;
  exception[1] = "get_next_capacity, allocator's max size reached";
}

const char *boost::container::exception::what(boost::container::exception *this)
{
  if (*((void *)this + 1)) {
    return (const char *)*((void *)this + 1);
  }
  else {
    return "unknown boost::container exception";
  }
}

void boost::container::out_of_range::~out_of_range(std::exception *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x1AD112B70);
}

BOOL boost::container::dtl::flat_tree<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>,boost::container::dtl::select1st<std::tuple<int,int,double,BOOL>>,std::less<std::tuple<int,int,double,BOOL>>,boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>>>::priv_insert_unique_prepare(uint64_t a1, void *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = a1;
  if (*a2 != a1)
  {
    unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * ((*a2 - a1) >> 3);
    do
    {
      if (v8 != 1 && !v7) {
        __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
      }
      if (!v7) {
        __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
      }
      unsigned __int8 v9 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>(v7 + 40 * (v8 >> 1), a3);
      if (v9 != 129 && (v9 & 0x80u) != 0)
      {
        v7 += 40 * (v8 >> 1) + 40;
        v8 += ~(v8 >> 1);
      }
      else
      {
        v8 >>= 1;
      }
    }
    while (v8);
  }
  *a4 = v7;
  if (v7 == *a2) {
    return 1;
  }
  if (!v7) {
    __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
  }
  unsigned __int8 v10 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>(a3, v7);
  return v10 != 129 && (v10 & 0x80u) != 0;
}

unint64_t boost::container::flat_map<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>,std::less<std::tuple<int,int,double,BOOL>>,void>::priv_subscript(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  unint64_t v1 = qword_1E98D1BE8;
  uint64_t v2 = qword_1E98D1BF0;
  if (qword_1E98D1BE8) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = qword_1E98D1BF0 == 0;
  }
  if (!v3) {
    __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
  }
  unint64_t v5 = qword_1E98D1BE8;
  if (qword_1E98D1BF0)
  {
    unint64_t v5 = qword_1E98D1BE8;
    unint64_t v6 = qword_1E98D1BF0;
    do
    {
      if (v6 != 1 && !v5) {
        __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
      }
      if (!v5) {
        __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
      }
      unsigned __int8 v7 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>(v5 + 40 * (v6 >> 1), a1);
      if (v7 != 129 && (v7 & 0x80u) != 0)
      {
        v5 += 40 * (v6 >> 1) + 40;
        v6 += ~(v6 >> 1);
      }
      else
      {
        v6 >>= 1;
      }
    }
    while (v6);
  }
  unint64_t v8 = (const char *)(v1 + 40 * v2);
  if ((const char *)v5 == v8) {
    goto LABEL_19;
  }
  if (!v5) {
    __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
  }
  unsigned __int8 v9 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>(a1, v5);
  if (v9 != 129 && (char)v9 < 0)
  {
LABEL_19:
    long long v32 = *(_OWORD *)a1;
    uint64_t v10 = *(void *)(a1 + 16);
    v34[0] = 0;
    v34[1] = 0;
    uint64_t v33 = v10;
    if (v1 > v5 || v5 > (unint64_t)v8)
    {
      long long v25 = "this->priv_in_range_or_end(hint)";
      int v26 = 879;
      int v27 = "flat_tree.hpp";
      int v28 = "insert_unique";
      goto LABEL_66;
    }
    uint64_t v29 = 0;
    if ((const char *)v5 != v8)
    {
      if (!v5) {
        __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
      }
      unsigned __int8 v12 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>((uint64_t)&v32, v5);
      if (v12 == 129 || ((char)v12 & 0x80000000) == 0)
      {
        unint64_t v30 = v1 + 40 * v2;
        if (!boost::container::dtl::flat_tree<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>,boost::container::dtl::select1st<std::tuple<int,int,double,BOOL>>,std::less<std::tuple<int,int,double,BOOL>>,boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>>>::priv_insert_unique_prepare(v5, &v30, (uint64_t)&v32, (uint64_t *)&v29))goto LABEL_51; {
LABEL_37:
        }
        uint64_t v15 = v29;
        uint64_t v16 = qword_1E98D1BE8;
        if (qword_1E98D1BE8 > (unint64_t)v29) {
          goto LABEL_63;
        }
        uint64_t v17 = qword_1E98D1BF0;
        if (!qword_1E98D1BE8 && qword_1E98D1BF0) {
          __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
        }
        unint64_t v18 = qword_1E98D1BE8 + 40 * qword_1E98D1BF0;
        if ((unint64_t)v29 > v18)
        {
LABEL_63:
          long long v25 = "this->priv_in_range_or_end(position)";
          int v26 = 1862;
          int v27 = "vector.hpp";
          int v28 = "emplace";
        }
        else
        {
          if (qword_1E98D1BF8 >= (unint64_t)qword_1E98D1BF0)
          {
            if (qword_1E98D1BF8 == qword_1E98D1BF0)
            {
              boost::container::vector<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>,boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>>,void>::priv_insert_forward_range_no_capacity<boost::container::dtl::insert_emplace_proxy<boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>>,boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>*,boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>>>((boost::container *)&v31, v29, &v32);
            }
            else
            {
              if ((char *)v18 == v29)
              {
                long long v23 = v32;
                *((void *)v29 + 2) = v33;
                *(_OWORD *)uint64_t v15 = v23;
                *(_OWORD *)(v16 + 40 * v17 + 24) = *(_OWORD *)v34;
                v34[0] = 0;
                v34[1] = 0;
                ++qword_1E98D1BF0;
              }
              else
              {
                uint64_t v19 = v18 - 40;
                *(_OWORD *)unint64_t v18 = *(_OWORD *)(v18 - 40);
                *(void *)(v18 + 16) = *(void *)(v18 - 24);
                *(_OWORD *)(v16 + 40 * v17 + 24) = *(_OWORD *)(v18 - 16);
                *(void *)(v18 - 16) = 0;
                *(void *)(v18 - 8) = 0;
                ++qword_1E98D1BF0;
                if ((char *)(v18 - 40) != v15)
                {
                  do
                  {
                    long long v20 = (char *)(v19 - 40);
                    boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>::operator=(v19, v19 - 40);
                    uint64_t v19 = (uint64_t)v20;
                  }
                  while (v20 != v15);
                }
                *(_OWORD *)uint64_t v15 = v32;
                v15[16] = v33;
                long long v21 = *(_OWORD *)v34;
                v34[0] = 0;
                v34[1] = 0;
                long long v22 = (std::__shared_weak_count *)*((void *)v15 + 4);
                *(_OWORD *)(v15 + 24) = v21;
                if (v22) {
                  std::__shared_weak_count::__release_weak(v22);
                }
              }
              unint64_t v31 = v15;
            }
            goto LABEL_54;
          }
          long long v25 = "this->m_holder.capacity() >= this->m_holder.m_size";
          int v26 = 2821;
          int v27 = "vector.hpp";
          int v28 = "priv_insert_forward_range";
        }
LABEL_66:
        __assert_rtn(v28, v27, v26, v25);
      }
      unint64_t v8 = (const char *)v5;
    }
    uint64_t v29 = (char *)v8;
    if (v8 != (const char *)v1)
    {
      if (!v8) {
        __assert_rtn("operator--", "vector.hpp", 174, "!!m_ptr");
      }
      unsigned __int8 v13 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>((uint64_t)(v8 - 40), (uint64_t)&v32);
      if (v13 == 129 || ((char)v13 & 0x80000000) == 0)
      {
        unsigned __int8 v14 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>((uint64_t)&v32, (uint64_t)(v8 - 40));
        if (v14 == 129 || ((char)v14 & 0x80000000) == 0)
        {
          uint64_t v29 = (char *)(v8 - 40);
          goto LABEL_51;
        }
        unint64_t v31 = v8 - 40;
        if (!boost::container::dtl::flat_tree<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>,boost::container::dtl::select1st<std::tuple<int,int,double,BOOL>>,std::less<std::tuple<int,int,double,BOOL>>,boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>>>::priv_insert_unique_prepare(v1, &v31, (uint64_t)&v32, (uint64_t *)&v29))
        {
LABEL_51:
          if (!qword_1E98D1BE8 && v29) {
            __assert_rtn("operator+", "vector.hpp", 188, "x.m_ptr || !off");
          }
          unint64_t v31 = v29;
LABEL_54:
          if (v34[1]) {
            std::__shared_weak_count::__release_weak(v34[1]);
          }
          unint64_t v5 = (unint64_t)v31;
          if (!v31) {
            __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
          }
          return v5 + 24;
        }
      }
    }
    goto LABEL_37;
  }
  return v5 + 24;
}

void sub_1ABAE6388(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void std::__shared_ptr_emplace<RamstadKernelD>::__on_zero_shared(void *a1)
{
  uint64_t v2 = (void *)a1[8];
  if (v2)
  {
    a1[9] = v2;
    operator delete(v2);
  }
  BOOL v3 = (void *)a1[5];
  if (v3)
  {
    a1[6] = v3;
    operator delete(v3);
  }
}

void std::__shared_ptr_emplace<RamstadKernelD>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F0303728;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1AD112B70);
}

void std::__shared_ptr_emplace<RamstadKernelD>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F0303728;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void boost::container::vector<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>,boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>>,void>::priv_insert_forward_range_no_capacity<boost::container::dtl::insert_emplace_proxy<boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>>,boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>*,boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>>>(boost::container *a1, const char *a2, long long *a3)
{
  if (qword_1E98D1BF8 != qword_1E98D1BF0) {
    __assert_rtn("next_capacity", "vector.hpp", 473, "additional_objects > size_type(this->m_capacity - this->m_size)");
  }
  if (qword_1E98D1BF8 == 0x333333333333333) {
    goto LABEL_30;
  }
  if ((unint64_t)qword_1E98D1BF8 >> 61 > 4) {
    uint64_t v3 = -1;
  }
  else {
    uint64_t v3 = 8 * qword_1E98D1BF8;
  }
  if ((unint64_t)qword_1E98D1BF8 >> 61) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 8 * qword_1E98D1BF8 / 5uLL;
  }
  if (v4 >= 0x333333333333333) {
    unint64_t v4 = 0x333333333333333;
  }
  unint64_t v5 = qword_1E98D1BF8 + 1 > v4 ? qword_1E98D1BF8 + 1 : v4;
  if (v5 > 0x333333333333333) {
LABEL_30:
  }
    boost::container::throw_length_error(a1, a2);
  uint64_t v9 = qword_1E98D1BE8;
  uint64_t v10 = (char *)operator new(40 * v5);
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = qword_1E98D1BE8;
  uint64_t v13 = qword_1E98D1BE8 + 40 * qword_1E98D1BF0;
  unsigned __int8 v14 = v10;
  if ((const char *)qword_1E98D1BE8 != a2)
  {
    uint64_t v15 = qword_1E98D1BE8;
    unsigned __int8 v14 = v10;
    do
    {
      long long v16 = *(_OWORD *)v15;
      *((void *)v14 + 2) = *(void *)(v15 + 16);
      *(_OWORD *)unsigned __int8 v14 = v16;
      *(_OWORD *)(v14 + 24) = *(_OWORD *)(v15 + 24);
      *(void *)(v15 + 24) = 0;
      *(void *)(v15 + 32) = 0;
      v14 += 40;
      v15 += 40;
    }
    while ((const char *)v15 != a2);
  }
  long long v17 = *a3;
  *((void *)v14 + 2) = *((void *)a3 + 2);
  *(_OWORD *)unsigned __int8 v14 = v17;
  *(_OWORD *)(v14 + 24) = *(long long *)((char *)a3 + 24);
  *((void *)a3 + 3) = 0;
  *((void *)a3 + 4) = 0;
  if ((const char *)v13 != a2)
  {
    unint64_t v18 = v14 + 64;
    uint64_t v19 = a2;
    do
    {
      long long v20 = *(_OWORD *)v19;
      *((void *)v18 - 1) = *((void *)v19 + 2);
      *(_OWORD *)((char *)v18 - 24) = v20;
      _OWORD *v18 = *(_OWORD *)(v19 + 24);
      unint64_t v18 = (_OWORD *)((char *)v18 + 40);
      *((void *)v19 + 3) = 0;
      *((void *)v19 + 4) = 0;
      v19 += 40;
    }
    while (v19 != (const char *)v13);
  }
  if (v12)
  {
    uint64_t v21 = qword_1E98D1BF0;
    if (qword_1E98D1BF0)
    {
      long long v22 = (std::__shared_weak_count **)(v12 + 32);
      do
      {
        if (*v22) {
          std::__shared_weak_count::__release_weak(*v22);
        }
        v22 += 5;
        --v21;
      }
      while (v21);
    }
    operator delete((void *)qword_1E98D1BE8);
  }
  qword_1E98D1BE8 = v11;
  ++qword_1E98D1BF0;
  qword_1E98D1BF8 = v5;
  *(void *)a1 = &a2[v11 - v9];
}

BOOL boost::container::dtl::flat_tree<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>,boost::container::dtl::select1st<std::tuple<int,int,double,BOOL>>,std::less<std::tuple<int,int,double,BOOL>>,boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>>>::priv_insert_unique_prepare(uint64_t a1, void *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = a1;
  if (*a2 != a1)
  {
    unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * ((*a2 - a1) >> 3);
    do
    {
      if (v8 != 1 && !v7) {
        __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
      }
      if (!v7) {
        __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
      }
      unsigned __int8 v9 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>(v7 + 40 * (v8 >> 1), a3);
      if (v9 != 129 && (v9 & 0x80u) != 0)
      {
        v7 += 40 * (v8 >> 1) + 40;
        v8 += ~(v8 >> 1);
      }
      else
      {
        v8 >>= 1;
      }
    }
    while (v8);
  }
  *a4 = v7;
  if (v7 == *a2) {
    return 1;
  }
  if (!v7) {
    __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
  }
  unsigned __int8 v10 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>(a3, v7);
  return v10 != 129 && (v10 & 0x80u) != 0;
}

uint64_t RamstadSRC::initQuality(uint64_t this, unsigned int a2)
{
  if (a2 <= 0x3F) {
    int v2 = 8;
  }
  else {
    int v2 = 11;
  }
  *(_DWORD *)(this + 56) = v2;
  *(unsigned char *)(this + 93) = a2 > 0x5F;
  return this;
}

double RamstadSRC::initPassbandWidth(RamstadSRC *this, int a2)
{
  double result = dbl_1ABAFBCF0[(a2 - 33) < 2];
  *((double *)this + 13) = result;
  return result;
}

double RamstadSRC::useInterpolationMethod(RamstadSRC *this, double a2)
{
  *((void *)this + 12) = 0x3E80000000000000;
  *((unsigned char *)this + 92) = 0;
  *((_DWORD *)this + 13) = 256;
  uint64_t v2 = vcvtmd_s64_f64(a2);
  *((_DWORD *)this + 15) = v2;
  signed int v3 = vcvtmd_s64_f64((a2 - floor(a2)) * 2147483650.0);
  *((void *)this + 1CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = (v2 << 32 >> 1) + v3;
  double result = NAN;
  *((void *)this + 32) = -1;
  *((_DWORD *)this + 66) = -1;
  *((_DWORD *)this + 17) = v3;
  *((_DWORD *)this + 18) = 0;
  return result;
}

void RamstadSRC::RamstadSRC(RamstadSRC *this, double a2, double a3, int a4, unsigned int a5, double a6)
{
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 1CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *((_OWORD *)this + 15) = 0u;
  if (a5 <= 0x3F) {
    int v6 = 8;
  }
  else {
    int v6 = 11;
  }
  double v7 = dbl_1ABAFBCF0[a5 - 33 < 2];
  *((_DWORD *)this + 22) = 1;
  *((double *)this + 4) = a2;
  *((double *)this + 5) = a3;
  *((unsigned char *)this + 93) = a5 > 0x5F;
  *((double *)this + 13) = v7;
  double v8 = a2 / a3;
  *((void *)this + 12) = 0x3E80000000000000;
  *((unsigned char *)this + 92) = 0;
  *((_DWORD *)this + 12) = a4;
  *((_DWORD *)this + 13) = 256;
  uint64_t v9 = vcvtmd_s64_f64(v8);
  *((_DWORD *)this + 14) = v6;
  *((_DWORD *)this + 15) = v9;
  signed int v10 = vcvtmd_s64_f64((v8 - floor(v8)) * 2147483650.0);
  *((void *)this + 1CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = (v9 << 32 >> 1) + v10;
  *((void *)this + 32) = -1;
  *((_DWORD *)this + 66) = -1;
  *((_DWORD *)this + 17) = v10;
  *((_DWORD *)this + 18) = 0;
  RamstadSRC::initFilter(this, (1.0 - a6) / v8, a5);
}

void sub_1ABAE6984(_Unwind_Exception *exception_object)
{
  unint64_t v4 = (void *)v1[29];
  if (v4)
  {
    v1[30] = v4;
    operator delete(v4);
  }
  unint64_t v5 = (void *)v1[26];
  if (v5)
  {
    v1[27] = v5;
    operator delete(v5);
  }
  int v6 = (void *)v1[23];
  if (v6)
  {
    v1[24] = v6;
    operator delete(v6);
  }
  double v7 = (void *)v1[20];
  if (v7)
  {
    v1[21] = v7;
    operator delete(v7);
  }
  double v8 = (void *)v1[17];
  if (v8)
  {
    v1[18] = v8;
    operator delete(v8);
  }
  uint64_t v9 = *v2;
  if (*v2)
  {
    v1[15] = v9;
    operator delete(v9);
  }
  signed int v10 = (std::__shared_weak_count *)v1[3];
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  uint64_t v11 = (std::__shared_weak_count *)v1[1];
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  _Unwind_Resume(exception_object);
}

double RamstadSRC::setRate@<D0>(RamstadSRC *this@<X0>, double a2@<D0>, uint64_t a3@<X8>)
{
  LODWORD(a3) = vcvtmd_s64_f64(a2);
  *((_DWORD *)this + 15) = a3;
  signed int v3 = vcvtmd_s64_f64((a2 - floor(a2)) * 2147483650.0);
  *((_DWORD *)this + 17) = v3;
  *((void *)this + 1CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = (a3 << 32 >> 1) + v3;
  double result = NAN;
  *((void *)this + 32) = -1;
  *((_DWORD *)this + 66) = -1;
  return result;
}

void RamstadSRC::~RamstadSRC(RamstadSRC *this)
{
  uint64_t v2 = (void *)*((void *)this + 29);
  if (v2)
  {
    *((void *)this + 3CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = v2;
    operator delete(v2);
  }
  signed int v3 = (void *)*((void *)this + 26);
  if (v3)
  {
    *((void *)this + 27) = v3;
    operator delete(v3);
  }
  unint64_t v4 = (void *)*((void *)this + 23);
  if (v4)
  {
    *((void *)this + 24) = v4;
    operator delete(v4);
  }
  unint64_t v5 = (void *)*((void *)this + 20);
  if (v5)
  {
    *((void *)this + 21) = v5;
    operator delete(v5);
  }
  int v6 = (void *)*((void *)this + 17);
  if (v6)
  {
    *((void *)this + 18) = v6;
    operator delete(v6);
  }
  double v7 = (void *)*((void *)this + 14);
  if (v7)
  {
    *((void *)this + 15) = v7;
    operator delete(v7);
  }
  double v8 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  uint64_t v9 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

void RamstadSRC::reset(RamstadSRC *this)
{
  *((_DWORD *)this + 18) = 0;
  *((_DWORD *)this + 22) = 1;
  if (*((unsigned char *)this + 93))
  {
    uint64_t v2 = (void *)*((void *)this + 20);
    uint64_t v3 = *((void *)this + 21) - (void)v2;
    if (v3 >= 1) {
      bzero(v2, ((((unint64_t)v3 >> 6) - ((unint64_t)v3 > 0x3F)) << 6) + 64);
    }
    unint64_t v4 = (void *)*((void *)this + 23);
    uint64_t v5 = *((void *)this + 24) - (void)v4;
    if (v5 >= 1)
    {
      unint64_t v6 = (unint64_t)v5 >> 6;
      BOOL v7 = (unint64_t)v5 > 0x3F;
      char v8 = 6;
LABEL_10:
      bzero(v4, (v6 - v7 + 1) << v8);
    }
  }
  else
  {
    uint64_t v9 = (void *)*((void *)this + 14);
    uint64_t v10 = *((void *)this + 15) - (void)v9;
    if (v10 >= 1) {
      bzero(v9, 32 * (((unint64_t)v10 >> 5) - ((unint64_t)v10 > 0x1F)) + 32);
    }
    unint64_t v4 = (void *)*((void *)this + 17);
    uint64_t v11 = *((void *)this + 18) - (void)v4;
    if (v11 >= 1)
    {
      unint64_t v6 = (unint64_t)v11 >> 5;
      BOOL v7 = (unint64_t)v11 > 0x1F;
      char v8 = 5;
      goto LABEL_10;
    }
  }
}

double RamstadSRC::processMono(RamstadSRC *this, const float *a2, float *a3, int a4, int a5, int a6, int a7)
{
  if (*((_DWORD *)this + 12) != 1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "RamstadSRC::processMono, wrong channel count");
  }
  RamstadSRC::checkPreflight(this, a4, a5);
  if (*((unsigned char *)this + 93))
  {
    if (*((unsigned char *)this + 92)) {
      RamstadSRC::processMonoIntD(this, a2, a3, a4, a5, a6, a7);
    }
    else {
      RamstadSRC::processMonoFracD(this, a2, a3, a4, a5, a6, a7);
    }
  }
  else if (*((unsigned char *)this + 92))
  {
    RamstadSRC::processMonoInt(this, a2, a3, a4, a5, a6, a7);
  }
  else
  {
    RamstadSRC::processMonoFrac(this, a2, a3, a4, a5, a6, a7);
  }
  double result = NAN;
  *((void *)this + 32) = -1;
  *((_DWORD *)this + 66) = -1;
  return result;
}

void sub_1ABAE6CEC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  *(void *)(v1 + 256) = -1;
  *(_DWORD *)(v1 + 264) = -1;
  _Unwind_Resume(a1);
}

_DWORD *RamstadSRC::checkPreflight(_DWORD *this, int a2, int a3)
{
  unint64_t v4 = this;
  int v5 = this[66];
  if (v5 == -1)
  {
    this = (_DWORD *)RamstadSRC::outputSamplesForInputSamples((RamstadSRC *)this, a2, &v7);
    if (v4[66] == a3) {
      return this;
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "RamstadSRC process called without preflight and arguments don't match preflight.");
LABEL_10:
  }
  if (v5 != a3)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "RamstadSRC process called for different number of output samples than preflight.");
    goto LABEL_10;
  }
  if (this[64] > a2 || this[65] < a2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "RamstadSRC process called for number of input samples than outside range of preflight.");
    goto LABEL_10;
  }
  return this;
}

void sub_1ABAE6DF8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t RamstadSRC::processMonoIntD(RamstadSRC *this, const float *a2, float *a3, int a4, int a5, int a6, int a7)
{
  int v8 = *((_DWORD *)this + 17);
  int v7 = *((_DWORD *)this + 18);
  int v9 = *((_DWORD *)this + 22);
  uint64_t v10 = *((void *)this + 2);
  uint64_t v11 = *(float64x2_t **)(v10 + 16);
  uint64_t v12 = *(void *)(v10 + 40);
  uint64_t v13 = (float64x2_t *)*((void *)this + 20);
  unsigned __int8 v14 = (float64x2_t *)*((void *)this + 23);
  int v15 = *((_DWORD *)this + 13);
  int v16 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a5 < 1)
    {
      uint64_t v18 = 0;
    }
    else
    {
      int v17 = 0;
      LODWORD(v18) = 0;
      do
      {
        float64x2_t v20 = v13[2];
        float64x2_t v19 = v13[3];
        int v21 = v9;
        float64x2_t v23 = *v13;
        float64x2_t v22 = v13[1];
        if (v9 >= 1)
        {
          do
          {
            float64x2_t v24 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
            float64x2_t v25 = vmlaq_f64(v24, v20, v11[2]);
            float64x2_t v26 = vmlaq_f64(v24, v19, v11[3]);
            float64x2_t v27 = vmlaq_f64(v24, v23, *v11);
            float64x2_t v28 = vmlaq_f64(vmlaq_f64(v24, v22, v11[1]), v14[1], v11[5]);
            float64x2_t v29 = vmlaq_f64(v27, *v14, v11[4]);
            float64x2_t v30 = vmlaq_f64(v26, v14[3], v11[7]);
            float64x2_t v31 = vmlaq_f64(v25, v14[2], v11[6]);
            *unsigned __int8 v14 = v23;
            v14[1] = v22;
            _OWORD v14[2] = v20;
            v14[3] = v19;
            v13[2] = v31;
            void v13[3] = v30;
            a2 += a6;
            float64x2_t v23 = v29;
            *uint64_t v13 = v29;
            v13[1] = v28;
            float64x2_t v22 = v28;
            float64x2_t v20 = v31;
            float64x2_t v19 = v30;
            --v21;
          }
          while (v21);
        }
        uint64_t v18 = (v18 + v9);
        long long v32 = (float64x2_t *)(v12 + ((uint64_t)(2 * v7) << 6));
        float v33 = vaddvq_f64(vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v32[4], *v14), v23, *v32), vmlaq_f64(vmulq_f64(v32[6], v14[2]), v20, v32[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v32[5], v14[1]), v22, v32[1]), vmlaq_f64(vmulq_f64(v32[7], v14[3]), v19, v32[3]))));
        *a3 = v33;
        a3 += a7;
        int v34 = v7 + v8;
        if (v34 < v15) {
          int v9 = v16;
        }
        else {
          int v9 = v16 + 1;
        }
        if (v34 < v15) {
          int v35 = 0;
        }
        else {
          int v35 = v15;
        }
        int v7 = v34 - v35;
        ++v17;
      }
      while (v17 != a5);
    }
    int v62 = a4 - v18;
    if (a4 > (int)v18)
    {
      if (v9 < v62) {
        int v62 = v9;
      }
      if (v62 >= 1)
      {
        float64x2_t v64 = v13[2];
        float64x2_t v63 = v13[3];
        float64x2_t v66 = *v13;
        float64x2_t v65 = v13[1];
        int v67 = v62;
        do
        {
          float64x2_t v68 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
          float64x2_t v69 = vmlaq_f64(v68, v64, v11[2]);
          float64x2_t v70 = vmlaq_f64(v68, v63, v11[3]);
          float64x2_t v71 = vmlaq_f64(v68, v66, *v11);
          float64x2_t v72 = vmlaq_f64(vmlaq_f64(v68, v65, v11[1]), v14[1], v11[5]);
          float64x2_t v73 = vmlaq_f64(v71, *v14, v11[4]);
          float64x2_t v74 = vmlaq_f64(v70, v14[3], v11[7]);
          float64x2_t v75 = vmlaq_f64(v69, v14[2], v11[6]);
          *unsigned __int8 v14 = v66;
          v14[1] = v65;
          _OWORD v14[2] = v64;
          v14[3] = v63;
          v13[2] = v75;
          void v13[3] = v74;
          a2 += a6;
          float64x2_t v66 = v73;
          *uint64_t v13 = v73;
          v13[1] = v72;
          float64x2_t v65 = v72;
          float64x2_t v64 = v75;
          float64x2_t v63 = v74;
          --v67;
        }
        while (v67);
      }
LABEL_44:
      v9 -= v62;
      uint64_t v18 = (v62 + v18);
    }
  }
  else
  {
    if (a5 < 1)
    {
      uint64_t v18 = 0;
    }
    else
    {
      int v36 = 0;
      LODWORD(v18) = 0;
      do
      {
        if (v9 < 1)
        {
          float64x2_t v53 = v13[6];
          float64x2_t v52 = v13[7];
          float64x2_t v55 = v13[4];
          float64x2_t v54 = v13[5];
        }
        else
        {
          int v37 = v9;
          do
          {
            float64x2_t v38 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
            float64x2_t v39 = *v13;
            float64x2_t v40 = v13[1];
            float64x2_t v41 = v13[2];
            float64x2_t v42 = v13[3];
            float64x2_t v43 = vmlaq_f64(vmlaq_f64(v38, *v13, *v11), *v14, v11[8]);
            float64x2_t v44 = vmlaq_f64(vmlaq_f64(v38, v40, v11[1]), v14[1], v11[9]);
            float64x2_t v45 = vmlaq_f64(vmlaq_f64(v38, v41, v11[2]), v14[2], v11[10]);
            float64x2_t v46 = vmlaq_f64(vmlaq_f64(v38, v42, v11[3]), v14[3], v11[11]);
            _OWORD v14[2] = v41;
            v14[3] = v42;
            *unsigned __int8 v14 = v39;
            v14[1] = v40;
            v13[2] = v45;
            void v13[3] = v46;
            *uint64_t v13 = v43;
            v13[1] = v44;
            float64x2_t v48 = v13[4];
            float64x2_t v47 = v13[5];
            float64x2_t v50 = v13[6];
            float64x2_t v49 = v13[7];
            float64x2_t v51 = vmlaq_f64(v38, v48, v11[4]);
            float64x2_t v52 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v49, v11[7]), v14[7], v11[15]);
            float64x2_t v53 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v50, v11[6]), v14[6], v11[14]);
            float64x2_t v54 = vmlaq_f64(vmlaq_f64(v38, v47, v11[5]), v14[5], v11[13]);
            float64x2_t v55 = vmlaq_f64(v51, v14[4], v11[12]);
            v14[4] = v48;
            v14[5] = v47;
            v14[6] = v50;
            v14[7] = v49;
            v13[6] = v53;
            v13[7] = v52;
            v13[4] = v55;
            v13[5] = v54;
            a2 += a6;
            --v37;
          }
          while (v37);
        }
        uint64_t v18 = (v18 + v9);
        long long v56 = (float64x2_t *)(v12 + ((uint64_t)(4 * v7) << 6));
        float64x2_t v57 = vmlaq_f64(vmulq_f64(v56[13], v14[5]), v54, v56[5]);
        int64x2_t v58 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v56[8], *v14), *v13, *v56), vmlaq_f64(vmulq_f64(v56[10], v14[2]), v13[2], v56[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v56[9], v14[1]), v13[1], v56[1]), vmlaq_f64(vmulq_f64(v56[11], v14[3]), v13[3], v56[3])));
        int64x2_t v59 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v56[12], v14[4]), v55, v56[4]), vmlaq_f64(vmulq_f64(v56[14], v14[6]), v53, v56[6])), vaddq_f64(v57, vmlaq_f64(vmulq_f64(v56[15], v14[7]), v52, v56[7])));
        *(float *)v58.i32 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v58, v59), (float64x2_t)vzip2q_s64(v58, v59)));
        *a3 = *(float *)v58.i32;
        a3 += a7;
        int v60 = v7 + v8;
        if (v60 < v15) {
          int v9 = v16;
        }
        else {
          int v9 = v16 + 1;
        }
        if (v60 < v15) {
          int v61 = 0;
        }
        else {
          int v61 = v15;
        }
        int v7 = v60 - v61;
        ++v36;
      }
      while (v36 != a5);
    }
    int v62 = a4 - v18;
    if (a4 > (int)v18)
    {
      if (v9 < v62) {
        int v62 = v9;
      }
      if (v62 >= 1)
      {
        int v76 = v62;
        do
        {
          float64x2_t v77 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
          float64x2_t v78 = *v13;
          float64x2_t v79 = v13[1];
          float64x2_t v80 = v13[2];
          float64x2_t v81 = v13[3];
          float64x2_t v82 = vmlaq_f64(vmlaq_f64(v77, *v13, *v11), *v14, v11[8]);
          float64x2_t v83 = vmlaq_f64(vmlaq_f64(v77, v79, v11[1]), v14[1], v11[9]);
          float64x2_t v84 = vmlaq_f64(vmlaq_f64(v77, v80, v11[2]), v14[2], v11[10]);
          float64x2_t v85 = vmlaq_f64(vmlaq_f64(v77, v81, v11[3]), v14[3], v11[11]);
          _OWORD v14[2] = v80;
          v14[3] = v81;
          *unsigned __int8 v14 = v78;
          v14[1] = v79;
          v13[2] = v84;
          void v13[3] = v85;
          *uint64_t v13 = v82;
          v13[1] = v83;
          float64x2_t v87 = v13[4];
          float64x2_t v86 = v13[5];
          float64x2_t v89 = v13[6];
          float64x2_t v88 = v13[7];
          float64x2_t v90 = vmlaq_f64(v77, v87, v11[4]);
          float64x2_t v91 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v88, v11[7]), v14[7], v11[15]);
          float64x2_t v92 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v89, v11[6]), v14[6], v11[14]);
          float64x2_t v93 = vmlaq_f64(vmlaq_f64(v77, v86, v11[5]), v14[5], v11[13]);
          float64x2_t v94 = vmlaq_f64(v90, v14[4], v11[12]);
          v14[4] = v87;
          v14[5] = v86;
          v14[6] = v89;
          v14[7] = v88;
          v13[6] = v92;
          v13[7] = v91;
          v13[4] = v94;
          v13[5] = v93;
          a2 += a6;
          --v76;
        }
        while (v76);
      }
      goto LABEL_44;
    }
  }
  *((_DWORD *)this + 18) = v7;
  *((_DWORD *)this + 22) = v9;
  return v18;
}

uint64_t RamstadSRC::processMonoFracD(RamstadSRC *this, const float *a2, float *a3, int a4, int a5, int a6, int a7)
{
  int v8 = *((_DWORD *)this + 17);
  unsigned int v7 = *((_DWORD *)this + 18);
  int v9 = *((_DWORD *)this + 22);
  uint64_t v10 = *((void *)this + 2);
  uint64_t v11 = *(float64x2_t **)(v10 + 16);
  uint64_t v12 = *(void *)(v10 + 40);
  uint64_t v13 = (float64x2_t *)*((void *)this + 20);
  unsigned __int8 v14 = (float64x2_t *)*((void *)this + 23);
  int v15 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a5 < 1)
    {
      uint64_t v16 = 0;
    }
    else
    {
      LODWORD(v16) = 0;
      for (int i = 0; i != a5; ++i)
      {
        float64x2_t v19 = v13[2];
        float64x2_t v18 = v13[3];
        int v20 = v9;
        float64x2_t v22 = *v13;
        float64x2_t v21 = v13[1];
        if (v9 >= 1)
        {
          do
          {
            float64x2_t v23 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
            float64x2_t v24 = vmlaq_f64(v23, v19, v11[2]);
            float64x2_t v25 = vmlaq_f64(v23, v18, v11[3]);
            float64x2_t v26 = vmlaq_f64(v23, v22, *v11);
            float64x2_t v27 = vmlaq_f64(vmlaq_f64(v23, v21, v11[1]), v14[1], v11[5]);
            float64x2_t v28 = vmlaq_f64(v26, *v14, v11[4]);
            float64x2_t v29 = vmlaq_f64(v25, v14[3], v11[7]);
            float64x2_t v30 = vmlaq_f64(v24, v14[2], v11[6]);
            *unsigned __int8 v14 = v22;
            v14[1] = v21;
            _OWORD v14[2] = v19;
            v14[3] = v18;
            v13[2] = v30;
            void v13[3] = v29;
            a2 += a6;
            float64x2_t v22 = v28;
            *uint64_t v13 = v28;
            v13[1] = v27;
            float64x2_t v21 = v27;
            float64x2_t v19 = v30;
            float64x2_t v18 = v29;
            --v20;
          }
          while (v20);
        }
        uint64_t v16 = (v16 + v9);
        uint64_t v31 = (v7 >> 22) & 0x1FE;
        long long v32 = (float64x2_t *)(v12 + (v31 << 6));
        float v33 = (float64x2_t *)(v12 + ((unint64_t)(v31 + 2) << 6));
        float64x2_t v34 = v14[2];
        float64x2_t v35 = v14[3];
        float64x2_t v36 = v14[1];
        int64x2_t v37 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v32[4], *v14), v22, *v32), vmlaq_f64(vmulq_f64(v32[6], v34), v19, v32[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v32[5], v36), v21, v32[1]), vmlaq_f64(vmulq_f64(v32[7], v35), v18, v32[3])));
        int64x2_t v38 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(*v14, v33[4]), v22, *v33), vmlaq_f64(vmulq_f64(v34, v33[6]), v19, v33[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v36, v33[5]), v21, v33[1]), vmlaq_f64(vmulq_f64(v35, v33[7]), v18, v33[3])));
        float64x2_t v39 = vaddq_f64((float64x2_t)vzip1q_s64(v38, v37), (float64x2_t)vzip2q_s64(v38, v37));
        *(float *)v39.f64 = v39.f64[1] + *((double *)this + 12) * (double)(v7 & 0x7FFFFF) * (v39.f64[0] - v39.f64[1]);
        *a3 = *(float *)v39.f64;
        a3 += a7;
        LODWORD(v33) = v7 + v8;
        unsigned int v7 = (v7 + v8) & 0x7FFFFFFF;
        int v9 = v15 + (v33 >> 31);
      }
    }
    int v79 = a4 - v16;
    if (a4 > (int)v16)
    {
      if (v9 < v79) {
        int v79 = v9;
      }
      if (v79 >= 1)
      {
        float64x2_t v81 = v13[2];
        float64x2_t v80 = v13[3];
        float64x2_t v83 = *v13;
        float64x2_t v82 = v13[1];
        int v84 = v79;
        do
        {
          float64x2_t v85 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
          float64x2_t v86 = vmlaq_f64(v85, v81, v11[2]);
          float64x2_t v87 = vmlaq_f64(v85, v80, v11[3]);
          float64x2_t v88 = vmlaq_f64(v85, v83, *v11);
          float64x2_t v89 = vmlaq_f64(vmlaq_f64(v85, v82, v11[1]), v14[1], v11[5]);
          float64x2_t v90 = vmlaq_f64(v88, *v14, v11[4]);
          float64x2_t v91 = vmlaq_f64(v87, v14[3], v11[7]);
          float64x2_t v92 = vmlaq_f64(v86, v14[2], v11[6]);
          *unsigned __int8 v14 = v83;
          v14[1] = v82;
          _OWORD v14[2] = v81;
          v14[3] = v80;
          v13[2] = v92;
          void v13[3] = v91;
          a2 += a6;
          float64x2_t v83 = v90;
          *uint64_t v13 = v90;
          v13[1] = v89;
          float64x2_t v82 = v89;
          float64x2_t v81 = v92;
          float64x2_t v80 = v91;
          --v84;
        }
        while (v84);
      }
LABEL_32:
      v9 -= v79;
      uint64_t v16 = (v79 + v16);
    }
  }
  else
  {
    if (a5 < 1)
    {
      uint64_t v16 = 0;
    }
    else
    {
      LODWORD(v16) = 0;
      for (int j = 0; j != a5; ++j)
      {
        if (v9 < 1)
        {
          float64x2_t v57 = v13[6];
          float64x2_t v56 = v13[7];
          float64x2_t v59 = v13[4];
          float64x2_t v58 = v13[5];
        }
        else
        {
          int v41 = v9;
          do
          {
            float64x2_t v42 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
            float64x2_t v43 = *v13;
            float64x2_t v44 = v13[1];
            float64x2_t v45 = v13[2];
            float64x2_t v46 = v13[3];
            float64x2_t v47 = vmlaq_f64(vmlaq_f64(v42, *v13, *v11), *v14, v11[8]);
            float64x2_t v48 = vmlaq_f64(vmlaq_f64(v42, v44, v11[1]), v14[1], v11[9]);
            float64x2_t v49 = vmlaq_f64(vmlaq_f64(v42, v45, v11[2]), v14[2], v11[10]);
            float64x2_t v50 = vmlaq_f64(vmlaq_f64(v42, v46, v11[3]), v14[3], v11[11]);
            _OWORD v14[2] = v45;
            v14[3] = v46;
            *unsigned __int8 v14 = v43;
            v14[1] = v44;
            v13[2] = v49;
            void v13[3] = v50;
            *uint64_t v13 = v47;
            v13[1] = v48;
            float64x2_t v52 = v13[4];
            float64x2_t v51 = v13[5];
            float64x2_t v54 = v13[6];
            float64x2_t v53 = v13[7];
            float64x2_t v55 = vmlaq_f64(v42, v52, v11[4]);
            float64x2_t v56 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v53, v11[7]), v14[7], v11[15]);
            float64x2_t v57 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v54, v11[6]), v14[6], v11[14]);
            float64x2_t v58 = vmlaq_f64(vmlaq_f64(v42, v51, v11[5]), v14[5], v11[13]);
            float64x2_t v59 = vmlaq_f64(v55, v14[4], v11[12]);
            v14[4] = v52;
            v14[5] = v51;
            v14[6] = v54;
            v14[7] = v53;
            v13[6] = v57;
            v13[7] = v56;
            v13[4] = v59;
            v13[5] = v58;
            a2 += a6;
            --v41;
          }
          while (v41);
        }
        uint64_t v16 = (v16 + v9);
        uint64_t v60 = (v7 >> 21) & 0x3FC;
        int v61 = (float64x2_t *)(v12 + (v60 << 6));
        int v62 = (float64x2_t *)(v12 + ((unint64_t)(v60 + 4) << 6));
        float64x2_t v63 = v13[1];
        float64x2_t v65 = v13[2];
        float64x2_t v64 = v13[3];
        float64x2_t v66 = v14[2];
        float64x2_t v67 = v14[3];
        float64x2_t v68 = v14[1];
        float64x2_t v69 = v14[6];
        float64x2_t v70 = v14[7];
        float64x2_t v71 = v14[4];
        float64x2_t v72 = v14[5];
        int64x2_t v73 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v61[8], *v14), *v13, *v61), vmlaq_f64(vmulq_f64(v61[10], v66), v65, v61[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v61[9], v68), v63, v61[1]), vmlaq_f64(vmulq_f64(v61[11], v67), v64, v61[3])));
        int64x2_t v74 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v61[12], v71), v59, v61[4]), vmlaq_f64(vmulq_f64(v61[14], v69), v57, v61[6])), vaddq_f64(vmlaq_f64(vmulq_f64(v61[13], v72), v58, v61[5]), vmlaq_f64(vmulq_f64(v61[15], v70), v56, v61[7])));
        float64x2_t v75 = vmlaq_f64(vmulq_f64(v72, v62[13]), v58, v62[5]);
        int64x2_t v76 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(*v14, v62[8]), *v13, *v62), vmlaq_f64(vmulq_f64(v66, v62[10]), v65, v62[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v68, v62[9]), v63, v62[1]), vmlaq_f64(vmulq_f64(v67, v62[11]), v64, v62[3])));
        int64x2_t v77 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v71, v62[12]), v59, v62[4]), vmlaq_f64(vmulq_f64(v69, v62[14]), v57, v62[6])), vaddq_f64(v75, vmlaq_f64(vmulq_f64(v70, v62[15]), v56, v62[7])));
        float64x2_t v78 = vaddq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v76, v73), (float64x2_t)vzip2q_s64(v76, v73)), vaddq_f64((float64x2_t)vzip1q_s64(v77, v74), (float64x2_t)vzip2q_s64(v77, v74)));
        *(float *)v78.f64 = v78.f64[1] + *((double *)this + 12) * (double)(v7 & 0x7FFFFF) * (v78.f64[0] - v78.f64[1]);
        *a3 = *(float *)v78.f64;
        a3 += a7;
        LODWORD(v62) = v7 + v8;
        unsigned int v7 = (v7 + v8) & 0x7FFFFFFF;
        int v9 = v15 + (v62 >> 31);
      }
    }
    int v79 = a4 - v16;
    if (a4 > (int)v16)
    {
      if (v9 < v79) {
        int v79 = v9;
      }
      if (v79 >= 1)
      {
        int v93 = v79;
        do
        {
          float64x2_t v94 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
          float64x2_t v95 = *v13;
          float64x2_t v96 = v13[1];
          float64x2_t v97 = v13[2];
          float64x2_t v98 = v13[3];
          float64x2_t v99 = vmlaq_f64(vmlaq_f64(v94, *v13, *v11), *v14, v11[8]);
          float64x2_t v100 = vmlaq_f64(vmlaq_f64(v94, v96, v11[1]), v14[1], v11[9]);
          float64x2_t v101 = vmlaq_f64(vmlaq_f64(v94, v97, v11[2]), v14[2], v11[10]);
          float64x2_t v102 = vmlaq_f64(vmlaq_f64(v94, v98, v11[3]), v14[3], v11[11]);
          _OWORD v14[2] = v97;
          v14[3] = v98;
          *unsigned __int8 v14 = v95;
          v14[1] = v96;
          v13[2] = v101;
          void v13[3] = v102;
          *uint64_t v13 = v99;
          v13[1] = v100;
          float64x2_t v104 = v13[4];
          float64x2_t v103 = v13[5];
          float64x2_t v106 = v13[6];
          float64x2_t v105 = v13[7];
          float64x2_t v107 = vmlaq_f64(v94, v104, v11[4]);
          float64x2_t v108 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v105, v11[7]), v14[7], v11[15]);
          float64x2_t v109 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v106, v11[6]), v14[6], v11[14]);
          float64x2_t v110 = vmlaq_f64(vmlaq_f64(v94, v103, v11[5]), v14[5], v11[13]);
          float64x2_t v111 = vmlaq_f64(v107, v14[4], v11[12]);
          v14[4] = v104;
          v14[5] = v103;
          v14[6] = v106;
          v14[7] = v105;
          v13[6] = v109;
          v13[7] = v108;
          v13[4] = v111;
          v13[5] = v110;
          a2 += a6;
          --v93;
        }
        while (v93);
      }
      goto LABEL_32;
    }
  }
  *((_DWORD *)this + 18) = v7;
  *((_DWORD *)this + 22) = v9;
  return v16;
}

uint64_t RamstadSRC::processMonoInt(RamstadSRC *this, const float *a2, float *a3, int a4, int a5, int a6, int a7)
{
  int v8 = *((_DWORD *)this + 17);
  int v7 = *((_DWORD *)this + 18);
  int v9 = *((_DWORD *)this + 22);
  uint64_t v10 = *(float32x4_t **)(*(void *)this + 16);
  uint64_t v11 = *(void *)(*(void *)this + 40);
  uint64_t v12 = (float32x4_t *)*((void *)this + 14);
  uint64_t v13 = (float32x4_t *)*((void *)this + 17);
  int v14 = *((_DWORD *)this + 13);
  int v15 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a5 < 1)
    {
      uint64_t v17 = 0;
    }
    else
    {
      int v16 = 0;
      LODWORD(v17) = 0;
      do
      {
        float32x4_t v19 = *v12;
        float32x4_t v20 = v12[1];
        int v21 = v9;
        if (v9 >= 1)
        {
          do
          {
            float32x4_t v22 = vld1q_dup_f32(a2);
            uint64_t v18 = 4 * a6;
            a2 = (const float *)((char *)a2 + v18);
            float32x4_t v23 = vmlaq_f32(v22, v20, v10[1]);
            float32x4_t v24 = vmlaq_f32(vmlaq_f32(v22, v19, *v10), *v13, v10[2]);
            float32x4_t v25 = vmlaq_f32(v23, v13[1], v10[3]);
            *uint64_t v13 = v19;
            v13[1] = v20;
            *uint64_t v12 = v24;
            v12[1] = v25;
            float32x4_t v19 = v24;
            float32x4_t v20 = v25;
            --v21;
          }
          while (v21);
        }
        uint64_t v17 = (v17 + v9);
        int8x16_t v26 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(*(float32x4_t *)(v11 + 64 * v7 + 32), *v13), v19, *(float32x4_t *)(v11 + 64 * v7)), vmlaq_f32(vmulq_f32(*(float32x4_t *)(v11 + 64 * v7 + 48), v13[1]), v20, *(float32x4_t *)(v11 + 64 * v7 + 16)));
        *a3 = vaddv_f32(vadd_f32(*(float32x2_t *)v26.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v26, v26, 8uLL)));
        a3 += a7;
        int v27 = v7 + v8;
        if (v27 < v14) {
          int v9 = v15;
        }
        else {
          int v9 = v15 + 1;
        }
        if (v27 < v14) {
          int v28 = 0;
        }
        else {
          int v28 = v14;
        }
        int v7 = v27 - v28;
        ++v16;
      }
      while (v16 != a5);
    }
    int v46 = a4 - v17;
    if (a4 > (int)v17)
    {
      if (v9 < v46) {
        int v46 = v9;
      }
      if (v46 >= 1)
      {
        float32x4_t v48 = *v12;
        float32x4_t v47 = v12[1];
        int v50 = v46;
        do
        {
          float32x4_t v51 = vld1q_dup_f32(a2);
          uint64_t v49 = 4 * a6;
          a2 = (const float *)((char *)a2 + v49);
          float32x4_t v52 = vmlaq_f32(v51, v47, v10[1]);
          float32x4_t v53 = vmlaq_f32(vmlaq_f32(v51, v48, *v10), *v13, v10[2]);
          float32x4_t v54 = vmlaq_f32(v52, v13[1], v10[3]);
          *uint64_t v13 = v48;
          v13[1] = v47;
          *uint64_t v12 = v53;
          v12[1] = v54;
          float32x4_t v48 = v53;
          float32x4_t v47 = v54;
          --v50;
        }
        while (v50);
      }
LABEL_44:
      v9 -= v46;
      uint64_t v17 = (v46 + v17);
    }
  }
  else
  {
    if (a5 < 1)
    {
      uint64_t v17 = 0;
    }
    else
    {
      int v29 = 0;
      LODWORD(v17) = 0;
      do
      {
        if (v9 < 1)
        {
          float32x4_t v39 = v12[2];
          float32x4_t v38 = v12[3];
        }
        else
        {
          int v31 = v9;
          do
          {
            float32x4_t v32 = vld1q_dup_f32(a2);
            uint64_t v30 = 4 * a6;
            a2 = (const float *)((char *)a2 + v30);
            float32x4_t v33 = v12[1];
            float32x4_t v34 = vmlaq_f32(vmlaq_f32(v32, *v12, *v10), *v13, v10[4]);
            float32x4_t v35 = vmlaq_f32(vmlaq_f32(v32, v33, v10[1]), v13[1], v10[5]);
            *uint64_t v13 = *v12;
            v13[1] = v33;
            *uint64_t v12 = v34;
            v12[1] = v35;
            float32x4_t v36 = v12[2];
            float32x4_t v37 = v12[3];
            float32x4_t v38 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v37, v10[3]), v13[3], v10[7]);
            float32x4_t v39 = vmlaq_f32(vmlaq_f32(v32, v36, v10[2]), v13[2], v10[6]);
            v13[2] = v36;
            void v13[3] = v37;
            v12[2] = v39;
            v12[3] = v38;
            --v31;
          }
          while (v31);
        }
        uint64_t v17 = (v17 + v9);
        float64x2_t v40 = (float32x4_t *)(v11 + 128 * v7);
        float32x4_t v41 = vmlaq_f32(vmulq_f32(v40[6], v13[2]), v39, v40[2]);
        int8x16_t v42 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v40[4], *v13), *v12, *v40), vmlaq_f32(vmulq_f32(v40[5], v13[1]), v12[1], v40[1]));
        *(float32x2_t *)v42.i8 = vadd_f32(*(float32x2_t *)v42.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v42, v42, 8uLL));
        int8x16_t v43 = (int8x16_t)vaddq_f32(v41, vmlaq_f32(vmulq_f32(v40[7], v13[3]), v38, v40[3]));
        *(float32x2_t *)v43.i8 = vadd_f32(*(float32x2_t *)v43.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v43, v43, 8uLL));
        *a3 = vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v42.i8, *(int32x2_t *)v43.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v42.i8, *(int32x2_t *)v43.i8)));
        a3 += a7;
        int v44 = v7 + v8;
        if (v44 < v14) {
          int v9 = v15;
        }
        else {
          int v9 = v15 + 1;
        }
        if (v44 < v14) {
          int v45 = 0;
        }
        else {
          int v45 = v14;
        }
        int v7 = v44 - v45;
        ++v29;
      }
      while (v29 != a5);
    }
    int v46 = a4 - v17;
    if (a4 > (int)v17)
    {
      if (v9 < v46) {
        int v46 = v9;
      }
      if (v46 >= 1)
      {
        int v56 = v46;
        do
        {
          float32x4_t v57 = vld1q_dup_f32(a2);
          uint64_t v55 = 4 * a6;
          a2 = (const float *)((char *)a2 + v55);
          float32x4_t v58 = v12[1];
          float32x4_t v59 = vmlaq_f32(vmlaq_f32(v57, *v12, *v10), *v13, v10[4]);
          float32x4_t v60 = vmlaq_f32(vmlaq_f32(v57, v58, v10[1]), v13[1], v10[5]);
          *uint64_t v13 = *v12;
          v13[1] = v58;
          *uint64_t v12 = v59;
          v12[1] = v60;
          float32x4_t v61 = v12[2];
          float32x4_t v62 = v12[3];
          float32x4_t v63 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v62, v10[3]), v13[3], v10[7]);
          float32x4_t v64 = vmlaq_f32(vmlaq_f32(v57, v61, v10[2]), v13[2], v10[6]);
          v13[2] = v61;
          void v13[3] = v62;
          v12[2] = v64;
          v12[3] = v63;
          --v56;
        }
        while (v56);
      }
      goto LABEL_44;
    }
  }
  *((_DWORD *)this + 18) = v7;
  *((_DWORD *)this + 22) = v9;
  return v17;
}

uint64_t RamstadSRC::processMonoFrac(RamstadSRC *this, const float *a2, float *a3, int a4, int a5, int a6, int a7)
{
  int v8 = *((_DWORD *)this + 17);
  unsigned int v7 = *((_DWORD *)this + 18);
  int v9 = *((_DWORD *)this + 22);
  uint64_t v10 = *(float32x4_t **)(*(void *)this + 16);
  uint64_t v11 = *(void *)(*(void *)this + 40);
  uint64_t v12 = (float32x4_t *)*((void *)this + 14);
  uint64_t v13 = (float32x4_t *)*((void *)this + 17);
  int v14 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a5 < 1)
    {
      uint64_t v15 = 0;
    }
    else
    {
      LODWORD(v15) = 0;
      for (int i = 0; i != a5; ++i)
      {
        float32x4_t v18 = *v12;
        float32x4_t v19 = v12[1];
        int v20 = v9;
        if (v9 >= 1)
        {
          do
          {
            float32x4_t v21 = vld1q_dup_f32(a2);
            uint64_t v17 = 4 * a6;
            a2 = (const float *)((char *)a2 + v17);
            float32x4_t v22 = vmlaq_f32(v21, v19, v10[1]);
            float32x4_t v23 = vmlaq_f32(vmlaq_f32(v21, v18, *v10), *v13, v10[2]);
            float32x4_t v24 = vmlaq_f32(v22, v13[1], v10[3]);
            *uint64_t v13 = v18;
            v13[1] = v19;
            *uint64_t v12 = v23;
            v12[1] = v24;
            float32x4_t v18 = v23;
            float32x4_t v19 = v24;
            --v20;
          }
          while (v20);
        }
        uint64_t v15 = (v15 + v9);
        float v25 = *((double *)this + 12) * (double)(v7 & 0x7FFFFF);
        uint64_t v26 = (v7 >> 22) & 0x1FE;
        float32x4_t v27 = v13[1];
        int8x16_t v28 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(*(float32x4_t *)(v11 + 32 * v26 + 32), *v13), v18, *(float32x4_t *)(v11 + 32 * v26)), vmlaq_f32(vmulq_f32(*(float32x4_t *)(v11 + 32 * v26 + 48), v27), v19, *(float32x4_t *)(v11 + 32 * v26 + 16)));
        *(float32x2_t *)v28.i8 = vadd_f32(*(float32x2_t *)v28.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v28, v28, 8uLL));
        int8x16_t v29 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(*v13, *(float32x4_t *)(v11 + 32 * (v26 + 2) + 32)), v18, *(float32x4_t *)(v11 + 32 * (v26 + 2))), vmlaq_f32(vmulq_f32(v27, *(float32x4_t *)(v11 + 32 * (v26 + 2) + 48)), v19, *(float32x4_t *)(v11 + 32 * (v26 + 2) + 16)));
        *(float32x2_t *)v29.i8 = vadd_f32(*(float32x2_t *)v29.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v29, v29, 8uLL));
        *(float32x2_t *)v29.i8 = vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v29.i8, *(int32x2_t *)v28.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v29.i8, *(int32x2_t *)v28.i8));
        *a3 = *(float *)&v29.i32[1] + (float)(v25 * (float)(*(float *)v29.i32 - *(float *)&v29.i32[1]));
        a3 += a7;
        LODWORD(v26) = v7 + v8;
        unsigned int v7 = (v7 + v8) & 0x7FFFFFFF;
        int v9 = v14 + (v26 >> 31);
      }
    }
    int v54 = a4 - v15;
    if (a4 > (int)v15)
    {
      if (v9 < v54) {
        int v54 = v9;
      }
      if (v54 >= 1)
      {
        float32x4_t v56 = *v12;
        float32x4_t v55 = v12[1];
        int v58 = v54;
        do
        {
          float32x4_t v59 = vld1q_dup_f32(a2);
          uint64_t v57 = 4 * a6;
          a2 = (const float *)((char *)a2 + v57);
          float32x4_t v60 = vmlaq_f32(v59, v55, v10[1]);
          float32x4_t v61 = vmlaq_f32(vmlaq_f32(v59, v56, *v10), *v13, v10[2]);
          float32x4_t v62 = vmlaq_f32(v60, v13[1], v10[3]);
          *uint64_t v13 = v56;
          v13[1] = v55;
          *uint64_t v12 = v61;
          v12[1] = v62;
          float32x4_t v56 = v61;
          float32x4_t v55 = v62;
          --v58;
        }
        while (v58);
      }
LABEL_32:
      v9 -= v54;
      uint64_t v15 = (v54 + v15);
    }
  }
  else
  {
    if (a5 < 1)
    {
      uint64_t v15 = 0;
    }
    else
    {
      LODWORD(v15) = 0;
      for (int j = 0; j != a5; ++j)
      {
        if (v9 < 1)
        {
          float32x4_t v40 = v12[2];
          float32x4_t v39 = v12[3];
        }
        else
        {
          int v32 = v9;
          do
          {
            float32x4_t v33 = vld1q_dup_f32(a2);
            uint64_t v31 = 4 * a6;
            a2 = (const float *)((char *)a2 + v31);
            float32x4_t v34 = v12[1];
            float32x4_t v35 = vmlaq_f32(vmlaq_f32(v33, *v12, *v10), *v13, v10[4]);
            float32x4_t v36 = vmlaq_f32(vmlaq_f32(v33, v34, v10[1]), v13[1], v10[5]);
            *uint64_t v13 = *v12;
            v13[1] = v34;
            *uint64_t v12 = v35;
            v12[1] = v36;
            float32x4_t v37 = v12[2];
            float32x4_t v38 = v12[3];
            float32x4_t v39 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v38, v10[3]), v13[3], v10[7]);
            float32x4_t v40 = vmlaq_f32(vmlaq_f32(v33, v37, v10[2]), v13[2], v10[6]);
            v13[2] = v37;
            void v13[3] = v38;
            v12[2] = v40;
            v12[3] = v39;
            --v32;
          }
          while (v32);
        }
        uint64_t v15 = (v15 + v9);
        float v41 = *((double *)this + 12) * (double)(v7 & 0x7FFFFF);
        uint64_t v42 = (v7 >> 21) & 0x3FC;
        int8x16_t v43 = (float32x4_t *)(v11 + 32 * v42);
        int v44 = (float32x4_t *)(v11 + 32 * (v42 + 4));
        float32x4_t v45 = v12[1];
        float32x4_t v46 = v13[1];
        float32x4_t v48 = v13[2];
        float32x4_t v47 = v13[3];
        int8x16_t v49 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v43[4], *v13), *v12, *v43), vmlaq_f32(vmulq_f32(v43[5], v46), v45, v43[1]));
        *(float32x2_t *)v49.i8 = vadd_f32(*(float32x2_t *)v49.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v49, v49, 8uLL));
        int8x16_t v50 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v43[6], v48), v40, v43[2]), vmlaq_f32(vmulq_f32(v43[7], v47), v39, v43[3]));
        *(float32x2_t *)v50.i8 = vadd_f32(*(float32x2_t *)v50.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v50, v50, 8uLL));
        float32x4_t v51 = vmlaq_f32(vmulq_f32(v48, v44[6]), v40, v44[2]);
        int8x16_t v52 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(*v13, v44[4]), *v12, *v44), vmlaq_f32(vmulq_f32(v46, v44[5]), v45, v44[1]));
        *(float32x2_t *)v52.i8 = vadd_f32(*(float32x2_t *)v52.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v52, v52, 8uLL));
        int8x16_t v53 = (int8x16_t)vaddq_f32(v51, vmlaq_f32(vmulq_f32(v47, v44[7]), v39, v44[3]));
        *(float32x2_t *)v53.i8 = vadd_f32(*(float32x2_t *)v53.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v53, v53, 8uLL));
        *(float32x2_t *)v52.i8 = vadd_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v52.i8, *(int32x2_t *)v49.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v52.i8, *(int32x2_t *)v49.i8)), vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v53.i8, *(int32x2_t *)v50.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v53.i8, *(int32x2_t *)v50.i8)));
        *a3 = *(float *)&v52.i32[1] + (float)(v41 * (float)(*(float *)v52.i32 - *(float *)&v52.i32[1]));
        a3 += a7;
        LODWORD(v44) = v7 + v8;
        unsigned int v7 = (v7 + v8) & 0x7FFFFFFF;
        int v9 = v14 + (v44 >> 31);
      }
    }
    int v54 = a4 - v15;
    if (a4 > (int)v15)
    {
      if (v9 < v54) {
        int v54 = v9;
      }
      if (v54 >= 1)
      {
        int v64 = v54;
        do
        {
          float32x4_t v65 = vld1q_dup_f32(a2);
          uint64_t v63 = 4 * a6;
          a2 = (const float *)((char *)a2 + v63);
          float32x4_t v66 = v12[1];
          float32x4_t v67 = vmlaq_f32(vmlaq_f32(v65, *v12, *v10), *v13, v10[4]);
          float32x4_t v68 = vmlaq_f32(vmlaq_f32(v65, v66, v10[1]), v13[1], v10[5]);
          *uint64_t v13 = *v12;
          v13[1] = v66;
          *uint64_t v12 = v67;
          v12[1] = v68;
          float32x4_t v69 = v12[2];
          float32x4_t v70 = v12[3];
          float32x4_t v71 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v70, v10[3]), v13[3], v10[7]);
          float32x4_t v72 = vmlaq_f32(vmlaq_f32(v65, v69, v10[2]), v13[2], v10[6]);
          v13[2] = v69;
          void v13[3] = v70;
          v12[2] = v72;
          v12[3] = v71;
          --v64;
        }
        while (v64);
      }
      goto LABEL_32;
    }
  }
  *((_DWORD *)this + 18) = v7;
  *((_DWORD *)this + 22) = v9;
  return v15;
}

uint64_t RamstadSRC::outputSamplesForInputSamples(RamstadSRC *this, int a2, int *a3)
{
  int v5 = 0;
  uint64_t v6 = 0;
  *a3 = 0;
  int v7 = *((_DWORD *)this + 22);
  BOOL v8 = __OFSUB__(a2, v7);
  int v9 = a2 - v7;
  if (v9 < 0 == v8)
  {
    if (*((unsigned char *)this + 92))
    {
      uint64_t v11 = *((int *)this + 13) * (uint64_t)v9;
      uint64_t v12 = *((int *)this + 18);
      uint64_t v13 = *((int *)this + 16);
    }
    else
    {
      uint64_t v12 = (uint64_t)v9 << 31;
      uint64_t v11 = *((int *)this + 18);
      uint64_t v13 = *((void *)this + 10);
    }
    uint64_t v14 = ((v12 + v11 + v13 - 1) / v13) + 1;
    unsigned int v15 = vcvtpd_s64_f64(*((double *)this + 5) / *((double *)this + 4));
    int v16 = v14 + 2 * v15;
    for (int i = v14 - 2 * v15; ; int i = v6)
    {
      while (1)
      {
        uint64_t v6 = v14;
        int v5 = RamstadSRC::inputSamplesForOutputSamples(this, v14);
        if (v5 <= a2) {
          break;
        }
        uint64_t v14 = (i + (((int)v6 - i) >> 1));
        int v16 = v6;
        if (v14 == v6) {
          goto LABEL_11;
        }
      }
      if ((v16 - v6) < 2) {
        break;
      }
      uint64_t v14 = (v6 + ((v16 - (int)v6) >> 1));
    }
LABEL_11:
    *a3 = v5;
  }
  *((_DWORD *)this + 64) = v5;
  *((_DWORD *)this + 65) = a2;
  *((_DWORD *)this + 66) = v6;
  return v6;
}

uint64_t RamstadSRC::inputSamplesForOutputSamples(RamstadSRC *this, int a2)
{
  uint64_t v2 = (a2 - 1);
  if (a2 < 1) {
    return 0;
  }
  if (*((unsigned char *)this + 92)) {
    unint64_t v3 = (*((int *)this + 18) + *((int *)this + 16) * v2) / *((int *)this + 13);
  }
  else {
    unint64_t v3 = (unint64_t)(*((int *)this + 18) + *((void *)this + 10) * v2) >> 31;
  }
  uint64_t v4 = (*((_DWORD *)this + 22) + v3);
  *((_DWORD *)this + 64) = v4;
  *((_DWORD *)this + 65) = v4;
  *((_DWORD *)this + 66) = a2;
  return v4;
}

uint64_t RamstadSRC::crashIfClientProvidedBogusBuffer(RamstadSRC *this, const float *a2, int a3)
{
  if (a3 < 1) {
    return 0;
  }
  if (a2) {
    return (LODWORD(a2[a3 - 1]) + *(_DWORD *)a2);
  }
  return result;
}

double RamstadSRC::processStereo(RamstadSRC *this, const float *a2, const float *a3, float *a4, float *a5, int a6, int a7, int a8, int a9)
{
  if (*((_DWORD *)this + 12) != 2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "RamstadSRC::processStereo, wrong channel count");
  }
  RamstadSRC::checkPreflight(this, a6, a7);
  if (*((unsigned char *)this + 93))
  {
    if (*((unsigned char *)this + 92)) {
      RamstadSRC::processStereoIntD(this, a2, a3, a4, a5, a6, a7, a8, a9);
    }
    else {
      RamstadSRC::processStereoFracD(this, a2, a3, a4, a5, a6, a7, a8, a9);
    }
  }
  else if (*((unsigned char *)this + 92))
  {
    RamstadSRC::processStereoInt(this, a2, a3, a4, a5, a6, a7, a8, a9);
  }
  else
  {
    RamstadSRC::processStereoFrac(this, a2, a3, a4, a5, a6, a7, a8, a9);
  }
  double result = NAN;
  *((void *)this + 32) = -1;
  *((_DWORD *)this + 66) = -1;
  return result;
}

void sub_1ABAE8388(_Unwind_Exception *exception_object)
{
  *(void *)(v1 + 256) = -1;
  *(_DWORD *)(v1 + 264) = -1;
  _Unwind_Resume(exception_object);
}

uint64_t RamstadSRC::processStereoIntD(RamstadSRC *this, const float *a2, const float *a3, float *a4, float *a5, int a6, int a7, int a8, int a9)
{
  int v10 = *((_DWORD *)this + 17);
  int v9 = *((_DWORD *)this + 18);
  int v11 = *((_DWORD *)this + 22);
  uint64_t v12 = *((void *)this + 2);
  uint64_t v13 = *(float64x2_t **)(v12 + 16);
  uint64_t v14 = *(void *)(v12 + 40);
  unsigned int v15 = (float64x2_t *)*((void *)this + 20);
  int v16 = (float64x2_t *)*((void *)this + 23);
  int v17 = *((_DWORD *)this + 13);
  int v18 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a7 < 1)
    {
      uint64_t v20 = 0;
    }
    else
    {
      int v19 = 0;
      LODWORD(v2CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 0;
      do
      {
        if (v11 < 1)
        {
          float64x2_t v46 = v15[6];
          float64x2_t v45 = v15[7];
          float64x2_t v44 = v15[4];
          float64x2_t v43 = v15[5];
        }
        else
        {
          uint64_t v21 = 0;
          int v22 = v11;
          do
          {
            float64x2_t v23 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v21]), 0);
            float64x2_t v24 = *v15;
            float64x2_t v25 = v15[1];
            float64x2_t v26 = v15[2];
            float64x2_t v27 = v15[3];
            float64x2_t v28 = vmlaq_f64(v23, v27, v13[3]);
            float64x2_t v29 = vmlaq_f64(v23, v26, v13[2]);
            float64x2_t v30 = vmlaq_f64(v23, v25, v13[1]);
            float64x2_t v31 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v21]), 0);
            float64x2_t v32 = vmlaq_f64(vmlaq_f64(v23, *v15, *v13), *v16, v13[4]);
            float64x2_t v33 = vmlaq_f64(v30, v16[1], v13[5]);
            float64x2_t v34 = vmlaq_f64(v29, v16[2], v13[6]);
            float64x2_t v35 = vmlaq_f64(v28, v16[3], v13[7]);
            _OWORD v16[2] = v26;
            v16[3] = v27;
            *int v16 = v24;
            v16[1] = v25;
            v15[2] = v34;
            void v15[3] = v35;
            *unsigned int v15 = v32;
            v15[1] = v33;
            float64x2_t v37 = v15[4];
            float64x2_t v36 = v15[5];
            float64x2_t v39 = v15[6];
            float64x2_t v38 = v15[7];
            float64x2_t v40 = vmlaq_f64(v31, v39, v13[2]);
            float64x2_t v41 = vmlaq_f64(v31, v38, v13[3]);
            float64x2_t v42 = vmlaq_f64(v31, v37, *v13);
            float64x2_t v43 = vmlaq_f64(vmlaq_f64(v31, v36, v13[1]), v16[5], v13[5]);
            float64x2_t v44 = vmlaq_f64(v42, v16[4], v13[4]);
            float64x2_t v45 = vmlaq_f64(v41, v16[7], v13[7]);
            float64x2_t v46 = vmlaq_f64(v40, v16[6], v13[6]);
            v16[4] = v37;
            v16[5] = v36;
            v16[6] = v39;
            v16[7] = v38;
            v15[6] = v46;
            v15[7] = v45;
            v15[4] = v44;
            v15[5] = v43;
            v21 += a8;
            --v22;
          }
          while (v22);
          a2 = (const float *)((char *)a2 + v21 * 4);
          a3 = (const float *)((char *)a3 + v21 * 4);
        }
        uint64_t v20 = (v20 + v11);
        float32x4_t v47 = (float64x2_t *)(v14 + ((uint64_t)(2 * v9) << 6));
        float64x2_t v48 = v47[1];
        float64x2_t v50 = v47[2];
        float64x2_t v49 = v47[3];
        float64x2_t v51 = v47[6];
        float64x2_t v52 = v47[7];
        float64x2_t v53 = v47[4];
        float64x2_t v54 = v47[5];
        float64x2_t v55 = vmlaq_f64(vmulq_f64(v51, v16[6]), v46, v50);
        float64x2_t v56 = vmlaq_f64(vmulq_f64(v53, v16[4]), v44, *v47);
        float64x2_t v57 = vmlaq_f64(vmulq_f64(v52, v16[7]), v45, v49);
        float64x2_t v58 = vmlaq_f64(vmulq_f64(v54, v16[5]), v43, v48);
        float v59 = vaddvq_f64(vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v53, *v16), *v15, *v47), vmlaq_f64(vmulq_f64(v51, v16[2]), v15[2], v50)), vaddq_f64(vmlaq_f64(vmulq_f64(v54, v16[1]), v15[1], v48), vmlaq_f64(vmulq_f64(v52, v16[3]), v15[3], v49))));
        *a4 = v59;
        float v60 = vaddvq_f64(vaddq_f64(vaddq_f64(v56, v55), vaddq_f64(v58, v57)));
        *a5 = v60;
        a4 += a9;
        a5 += a9;
        int v61 = v9 + v10;
        if (v61 < v17) {
          int v11 = v18;
        }
        else {
          int v11 = v18 + 1;
        }
        if (v61 < v17) {
          int v62 = 0;
        }
        else {
          int v62 = v17;
        }
        int v9 = v61 - v62;
        ++v19;
      }
      while (v19 != a7);
    }
    int v119 = a6 - v20;
    if (a6 > (int)v20)
    {
      if (v11 < v119) {
        int v119 = v11;
      }
      if (v119 >= 1)
      {
        uint64_t v120 = 0;
        int v121 = v119;
        do
        {
          float64x2_t v122 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v120]), 0);
          float64x2_t v123 = *v15;
          float64x2_t v124 = v15[1];
          float64x2_t v125 = v15[2];
          float64x2_t v126 = v15[3];
          float64x2_t v127 = vmlaq_f64(v122, v126, v13[3]);
          float64x2_t v128 = vmlaq_f64(v122, v125, v13[2]);
          float64x2_t v129 = vmlaq_f64(v122, v124, v13[1]);
          float64x2_t v130 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v120]), 0);
          float64x2_t v131 = vmlaq_f64(vmlaq_f64(v122, *v15, *v13), *v16, v13[4]);
          float64x2_t v132 = vmlaq_f64(v129, v16[1], v13[5]);
          float64x2_t v133 = vmlaq_f64(v128, v16[2], v13[6]);
          float64x2_t v134 = vmlaq_f64(v127, v16[3], v13[7]);
          _OWORD v16[2] = v125;
          v16[3] = v126;
          *int v16 = v123;
          v16[1] = v124;
          v15[2] = v133;
          void v15[3] = v134;
          *unsigned int v15 = v131;
          v15[1] = v132;
          float64x2_t v136 = v15[4];
          float64x2_t v135 = v15[5];
          float64x2_t v138 = v15[6];
          float64x2_t v137 = v15[7];
          float64x2_t v139 = vmlaq_f64(v130, v138, v13[2]);
          float64x2_t v140 = vmlaq_f64(v130, v137, v13[3]);
          float64x2_t v141 = vmlaq_f64(v130, v136, *v13);
          float64x2_t v142 = vmlaq_f64(vmlaq_f64(v130, v135, v13[1]), v16[5], v13[5]);
          float64x2_t v143 = vmlaq_f64(v141, v16[4], v13[4]);
          float64x2_t v144 = vmlaq_f64(v140, v16[7], v13[7]);
          float64x2_t v145 = vmlaq_f64(v139, v16[6], v13[6]);
          v16[4] = v136;
          v16[5] = v135;
          v16[6] = v138;
          v16[7] = v137;
          v15[6] = v145;
          v15[7] = v144;
          v15[4] = v143;
          v15[5] = v142;
          v120 += a8;
          --v121;
        }
        while (v121);
      }
LABEL_47:
      v11 -= v119;
      uint64_t v20 = (v119 + v20);
    }
  }
  else
  {
    if (a7 < 1)
    {
      uint64_t v20 = 0;
    }
    else
    {
      int v63 = 0;
      LODWORD(v2CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 0;
      do
      {
        if (v11 < 1)
        {
          float64x2_t v93 = v15[10];
          float64x2_t v92 = v15[11];
          float64x2_t v91 = v15[8];
          float64x2_t v90 = v15[9];
        }
        else
        {
          uint64_t v64 = 0;
          int v65 = v11;
          do
          {
            float64x2_t v66 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v64]), 0);
            float64x2_t v67 = *v15;
            float64x2_t v68 = v15[1];
            float64x2_t v69 = v15[2];
            float64x2_t v70 = v15[3];
            float64x2_t v71 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v64]), 0);
            float64x2_t v72 = vmlaq_f64(vmlaq_f64(v66, *v15, *v13), *v16, v13[8]);
            float64x2_t v73 = vmlaq_f64(vmlaq_f64(v66, v68, v13[1]), v16[1], v13[9]);
            float64x2_t v74 = vmlaq_f64(vmlaq_f64(v66, v69, v13[2]), v16[2], v13[10]);
            float64x2_t v75 = vmlaq_f64(vmlaq_f64(v66, v70, v13[3]), v16[3], v13[11]);
            _OWORD v16[2] = v69;
            v16[3] = v70;
            *int v16 = v67;
            v16[1] = v68;
            v15[2] = v74;
            void v15[3] = v75;
            *unsigned int v15 = v72;
            v15[1] = v73;
            float64x2_t v76 = v15[4];
            float64x2_t v77 = v15[5];
            float64x2_t v78 = v15[6];
            float64x2_t v79 = v15[7];
            float64x2_t v80 = vmlaq_f64(vmlaq_f64(v71, v76, *v13), v16[4], v13[8]);
            float64x2_t v81 = vmlaq_f64(vmlaq_f64(v71, v77, v13[1]), v16[5], v13[9]);
            float64x2_t v82 = vmlaq_f64(vmlaq_f64(v71, v78, v13[2]), v16[6], v13[10]);
            float64x2_t v83 = vmlaq_f64(vmlaq_f64(v71, v79, v13[3]), v16[7], v13[11]);
            v16[4] = v76;
            v16[5] = v77;
            v16[6] = v78;
            v16[7] = v79;
            v15[6] = v82;
            v15[7] = v83;
            v15[4] = v80;
            v15[5] = v81;
            float64x2_t v85 = v15[8];
            float64x2_t v84 = v15[9];
            float64x2_t v87 = v15[10];
            float64x2_t v86 = v15[11];
            float64x2_t v88 = vmlaq_f64(v71, v87, v13[6]);
            float64x2_t v89 = vmlaq_f64(v66, v85, v13[4]);
            float64x2_t v90 = vmlaq_f64(vmlaq_f64(v66, v84, v13[5]), v16[9], v13[13]);
            float64x2_t v91 = vmlaq_f64(v89, v16[8], v13[12]);
            float64x2_t v92 = vmlaq_f64(vmlaq_f64(v71, v86, v13[7]), v16[11], v13[15]);
            float64x2_t v93 = vmlaq_f64(v88, v16[10], v13[14]);
            v16[8] = v85;
            v16[9] = v84;
            v16[10] = v87;
            v16[11] = v86;
            v15[10] = v93;
            v15[11] = v92;
            v15[8] = v91;
            v15[9] = v90;
            v64 += a8;
            --v65;
          }
          while (v65);
          a2 = (const float *)((char *)a2 + v64 * 4);
          a3 = (const float *)((char *)a3 + v64 * 4);
        }
        uint64_t v20 = (v20 + v11);
        float64x2_t v94 = (float64x2_t *)(v14 + ((uint64_t)(4 * v9) << 6));
        float64x2_t v95 = v94[1];
        float64x2_t v97 = v94[2];
        float64x2_t v96 = v94[3];
        float64x2_t v98 = v94[10];
        float64x2_t v99 = v94[11];
        float64x2_t v100 = v94[8];
        float64x2_t v101 = v94[9];
        float64x2_t v102 = vmlaq_f64(vmulq_f64(v98, v16[2]), v15[2], v97);
        float64x2_t v103 = vmlaq_f64(vmulq_f64(v100, *v16), *v15, *v94);
        float64x2_t v104 = vmlaq_f64(vmulq_f64(v99, v16[3]), v15[3], v96);
        float64x2_t v105 = vmlaq_f64(vmulq_f64(v101, v16[1]), v15[1], v95);
        float64x2_t v106 = vmlaq_f64(vmulq_f64(v98, v16[6]), v15[6], v97);
        float64x2_t v107 = vmlaq_f64(vmulq_f64(v100, v16[4]), v15[4], *v94);
        float64x2_t v108 = vmlaq_f64(vmulq_f64(v99, v16[7]), v15[7], v96);
        float64x2_t v109 = vmlaq_f64(vmulq_f64(v101, v16[5]), v15[5], v95);
        float64x2_t v110 = vmlaq_f64(vmulq_f64(v94[15], v16[11]), v92, v94[7]);
        float64x2_t v111 = vmlaq_f64(vmulq_f64(v94[14], v16[10]), v93, v94[6]);
        float64x2_t v112 = vmlaq_f64(vmulq_f64(v94[13], v16[9]), v90, v94[5]);
        int64x2_t v113 = (int64x2_t)vaddq_f64(vaddq_f64(v103, v102), vaddq_f64(v105, v104));
        int64x2_t v114 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v94[12], v16[8]), v91, v94[4]), v112);
        *(float *)v113.i32 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v113, v114), (float64x2_t)vzip2q_s64(v113, v114)));
        *a4 = *(float *)v113.i32;
        int64x2_t v115 = (int64x2_t)vaddq_f64(vaddq_f64(v107, v106), vaddq_f64(v109, v108));
        int64x2_t v116 = (int64x2_t)vaddq_f64(v111, v110);
        *(float *)v115.i32 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v115, v116), (float64x2_t)vzip2q_s64(v115, v116)));
        *a5 = *(float *)v115.i32;
        a4 += a9;
        a5 += a9;
        int v117 = v9 + v10;
        if (v117 < v17) {
          int v11 = v18;
        }
        else {
          int v11 = v18 + 1;
        }
        if (v117 < v17) {
          int v118 = 0;
        }
        else {
          int v118 = v17;
        }
        int v9 = v117 - v118;
        ++v63;
      }
      while (v63 != a7);
    }
    int v119 = a6 - v20;
    if (a6 > (int)v20)
    {
      if (v11 < v119) {
        int v119 = v11;
      }
      if (v119 >= 1)
      {
        uint64_t v146 = 0;
        int v147 = v119;
        do
        {
          float64x2_t v148 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v146]), 0);
          float64x2_t v149 = *v15;
          float64x2_t v150 = v15[1];
          float64x2_t v151 = v15[2];
          float64x2_t v152 = v15[3];
          float64x2_t v153 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v146]), 0);
          float64x2_t v154 = vmlaq_f64(vmlaq_f64(v148, *v15, *v13), *v16, v13[8]);
          float64x2_t v155 = vmlaq_f64(vmlaq_f64(v148, v150, v13[1]), v16[1], v13[9]);
          float64x2_t v156 = vmlaq_f64(vmlaq_f64(v148, v151, v13[2]), v16[2], v13[10]);
          float64x2_t v157 = vmlaq_f64(vmlaq_f64(v148, v152, v13[3]), v16[3], v13[11]);
          _OWORD v16[2] = v151;
          v16[3] = v152;
          *int v16 = v149;
          v16[1] = v150;
          v15[2] = v156;
          void v15[3] = v157;
          *unsigned int v15 = v154;
          v15[1] = v155;
          float64x2_t v158 = v15[4];
          float64x2_t v159 = v15[5];
          float64x2_t v160 = v15[6];
          float64x2_t v161 = v15[7];
          float64x2_t v162 = vmlaq_f64(vmlaq_f64(v153, v158, *v13), v16[4], v13[8]);
          float64x2_t v163 = vmlaq_f64(vmlaq_f64(v153, v159, v13[1]), v16[5], v13[9]);
          float64x2_t v164 = vmlaq_f64(vmlaq_f64(v153, v160, v13[2]), v16[6], v13[10]);
          float64x2_t v165 = vmlaq_f64(vmlaq_f64(v153, v161, v13[3]), v16[7], v13[11]);
          v16[4] = v158;
          v16[5] = v159;
          v16[6] = v160;
          v16[7] = v161;
          v15[6] = v164;
          v15[7] = v165;
          v15[4] = v162;
          v15[5] = v163;
          float64x2_t v167 = v15[8];
          float64x2_t v166 = v15[9];
          float64x2_t v169 = v15[10];
          float64x2_t v168 = v15[11];
          float64x2_t v170 = vmlaq_f64(v153, v169, v13[6]);
          float64x2_t v171 = vmlaq_f64(v148, v167, v13[4]);
          float64x2_t v172 = vmlaq_f64(vmlaq_f64(v148, v166, v13[5]), v16[9], v13[13]);
          float64x2_t v173 = vmlaq_f64(v171, v16[8], v13[12]);
          float64x2_t v174 = vmlaq_f64(vmlaq_f64(v153, v168, v13[7]), v16[11], v13[15]);
          float64x2_t v175 = vmlaq_f64(v170, v16[10], v13[14]);
          v16[8] = v167;
          v16[9] = v166;
          v16[10] = v169;
          v16[11] = v168;
          v15[10] = v175;
          v15[11] = v174;
          v15[8] = v173;
          v15[9] = v172;
          v146 += a8;
          --v147;
        }
        while (v147);
      }
      goto LABEL_47;
    }
  }
  *((_DWORD *)this + 18) = v9;
  *((_DWORD *)this + 22) = v11;
  return v20;
}

uint64_t RamstadSRC::processStereoFracD(RamstadSRC *this, const float *a2, const float *a3, float *a4, float *a5, int a6, int a7, int a8, int a9)
{
  int v10 = *((_DWORD *)this + 17);
  unsigned int v9 = *((_DWORD *)this + 18);
  int v11 = *((_DWORD *)this + 22);
  uint64_t v12 = *((void *)this + 2);
  uint64_t v13 = *(float64x2_t **)(v12 + 16);
  uint64_t v14 = *(void *)(v12 + 40);
  unsigned int v15 = (float64x2_t *)*((void *)this + 20);
  int v16 = (float64x2_t *)*((void *)this + 23);
  int v17 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a7 < 1)
    {
      uint64_t v18 = 0;
    }
    else
    {
      LODWORD(v18) = 0;
      for (int i = 0; i != a7; ++i)
      {
        if (v11 < 1)
        {
          float64x2_t v45 = v15[6];
          float64x2_t v44 = v15[7];
          float64x2_t v43 = v15[4];
          float64x2_t v42 = v15[5];
        }
        else
        {
          uint64_t v20 = 0;
          int v21 = v11;
          do
          {
            float64x2_t v22 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v20]), 0);
            float64x2_t v23 = *v15;
            float64x2_t v24 = v15[1];
            float64x2_t v25 = v15[2];
            float64x2_t v26 = v15[3];
            float64x2_t v27 = vmlaq_f64(v22, v26, v13[3]);
            float64x2_t v28 = vmlaq_f64(v22, v25, v13[2]);
            float64x2_t v29 = vmlaq_f64(v22, v24, v13[1]);
            float64x2_t v30 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v20]), 0);
            float64x2_t v31 = vmlaq_f64(vmlaq_f64(v22, *v15, *v13), *v16, v13[4]);
            float64x2_t v32 = vmlaq_f64(v29, v16[1], v13[5]);
            float64x2_t v33 = vmlaq_f64(v28, v16[2], v13[6]);
            float64x2_t v34 = vmlaq_f64(v27, v16[3], v13[7]);
            _OWORD v16[2] = v25;
            v16[3] = v26;
            *int v16 = v23;
            v16[1] = v24;
            v15[2] = v33;
            void v15[3] = v34;
            *unsigned int v15 = v31;
            v15[1] = v32;
            float64x2_t v36 = v15[4];
            float64x2_t v35 = v15[5];
            float64x2_t v38 = v15[6];
            float64x2_t v37 = v15[7];
            float64x2_t v39 = vmlaq_f64(v30, v38, v13[2]);
            float64x2_t v40 = vmlaq_f64(v30, v37, v13[3]);
            float64x2_t v41 = vmlaq_f64(v30, v36, *v13);
            float64x2_t v42 = vmlaq_f64(vmlaq_f64(v30, v35, v13[1]), v16[5], v13[5]);
            float64x2_t v43 = vmlaq_f64(v41, v16[4], v13[4]);
            float64x2_t v44 = vmlaq_f64(v40, v16[7], v13[7]);
            float64x2_t v45 = vmlaq_f64(v39, v16[6], v13[6]);
            v16[4] = v36;
            v16[5] = v35;
            v16[6] = v38;
            v16[7] = v37;
            v15[6] = v45;
            v15[7] = v44;
            v15[4] = v43;
            v15[5] = v42;
            v20 += a8;
            --v21;
          }
          while (v21);
          a2 = (const float *)((char *)a2 + v20 * 4);
          a3 = (const float *)((char *)a3 + v20 * 4);
        }
        uint64_t v18 = (v18 + v11);
        float v46 = *((double *)this + 12) * (double)(v9 & 0x7FFFFF);
        uint64_t v47 = (v9 >> 22) & 0x1FE;
        float64x2_t v48 = (float64x2_t *)(v14 + (v47 << 6));
        float64x2_t v49 = (float64x2_t *)(v14 + ((unint64_t)(v47 + 2) << 6));
        float64x2_t v50 = v48[1];
        float64x2_t v52 = v48[2];
        float64x2_t v51 = v48[3];
        float64x2_t v53 = v15[1];
        float64x2_t v55 = v15[2];
        float64x2_t v54 = v15[3];
        float64x2_t v56 = v48[6];
        float64x2_t v57 = v48[7];
        float64x2_t v58 = v48[4];
        float64x2_t v59 = v48[5];
        float64x2_t v60 = v16[2];
        float64x2_t v61 = v16[3];
        float64x2_t v62 = v16[1];
        float64x2_t v63 = vmlaq_f64(vmulq_f64(v59, v62), v53, v50);
        float64x2_t v64 = v16[6];
        float64x2_t v65 = v16[7];
        float64x2_t v66 = v16[4];
        float64x2_t v67 = v16[5];
        float64x2_t v68 = vmlaq_f64(vmulq_f64(v59, v67), v42, v50);
        int64x2_t v69 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v58, *v16), *v15, *v48), vmlaq_f64(vmulq_f64(v56, v60), v55, v52)), vaddq_f64(v63, vmlaq_f64(vmulq_f64(v57, v61), v54, v51)));
        int64x2_t v70 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v58, v66), v43, *v48), vmlaq_f64(vmulq_f64(v56, v64), v45, v52)), vaddq_f64(v68, vmlaq_f64(vmulq_f64(v57, v65), v44, v51)));
        float64x2_t v71 = v49[1];
        float64x2_t v73 = v49[2];
        float64x2_t v72 = v49[3];
        float64x2_t v74 = v49[6];
        float64x2_t v75 = v49[7];
        float64x2_t v76 = v49[4];
        float64x2_t v77 = v49[5];
        float64x2_t v78 = vmlaq_f64(vmulq_f64(v62, v77), v53, v71);
        float64x2_t v79 = vmlaq_f64(vmulq_f64(v67, v77), v42, v71);
        int64x2_t v80 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(*v16, v76), *v15, *v49), vmlaq_f64(vmulq_f64(v60, v74), v55, v73)), vaddq_f64(v78, vmlaq_f64(vmulq_f64(v61, v75), v54, v72)));
        *(float32x2_t *)v80.i8 = vcvt_f32_f64(vaddq_f64((float64x2_t)vzip1q_s64(v80, v69), (float64x2_t)vzip2q_s64(v80, v69)));
        int64x2_t v81 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v66, v76), v43, *v49), vmlaq_f64(vmulq_f64(v64, v74), v45, v73)), vaddq_f64(v79, vmlaq_f64(vmulq_f64(v65, v75), v44, v72)));
        *(float32x2_t *)v81.i8 = vcvt_f32_f64(vaddq_f64((float64x2_t)vzip1q_s64(v81, v70), (float64x2_t)vzip2q_s64(v81, v70)));
        *a4 = *(float *)&v80.i32[1] + (float)(v46 * (float)(*(float *)v80.i32 - *(float *)&v80.i32[1]));
        *a5 = *(float *)&v81.i32[1] + (float)(v46 * (float)(*(float *)v81.i32 - *(float *)&v81.i32[1]));
        a4 += a9;
        a5 += a9;
        LODWORD(v49) = v9 + v10;
        unsigned int v9 = (v9 + v10) & 0x7FFFFFFF;
        int v11 = v17 + (v49 >> 31);
      }
    }
    int v178 = a6 - v18;
    if (a6 > (int)v18)
    {
      if (v11 < v178) {
        int v178 = v11;
      }
      if (v178 >= 1)
      {
        uint64_t v179 = 0;
        int v180 = v178;
        do
        {
          float64x2_t v181 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v179]), 0);
          float64x2_t v182 = *v15;
          float64x2_t v183 = v15[1];
          float64x2_t v184 = v15[2];
          float64x2_t v185 = v15[3];
          float64x2_t v186 = vmlaq_f64(v181, v185, v13[3]);
          float64x2_t v187 = vmlaq_f64(v181, v184, v13[2]);
          float64x2_t v188 = vmlaq_f64(v181, v183, v13[1]);
          float64x2_t v189 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v179]), 0);
          float64x2_t v190 = vmlaq_f64(vmlaq_f64(v181, *v15, *v13), *v16, v13[4]);
          float64x2_t v191 = vmlaq_f64(v188, v16[1], v13[5]);
          float64x2_t v192 = vmlaq_f64(v187, v16[2], v13[6]);
          float64x2_t v193 = vmlaq_f64(v186, v16[3], v13[7]);
          _OWORD v16[2] = v184;
          v16[3] = v185;
          *int v16 = v182;
          v16[1] = v183;
          v15[2] = v192;
          void v15[3] = v193;
          *unsigned int v15 = v190;
          v15[1] = v191;
          float64x2_t v195 = v15[4];
          float64x2_t v194 = v15[5];
          float64x2_t v197 = v15[6];
          float64x2_t v196 = v15[7];
          float64x2_t v198 = vmlaq_f64(v189, v197, v13[2]);
          float64x2_t v199 = vmlaq_f64(v189, v196, v13[3]);
          float64x2_t v200 = vmlaq_f64(v189, v195, *v13);
          float64x2_t v201 = vmlaq_f64(vmlaq_f64(v189, v194, v13[1]), v16[5], v13[5]);
          float64x2_t v202 = vmlaq_f64(v200, v16[4], v13[4]);
          float64x2_t v203 = vmlaq_f64(v199, v16[7], v13[7]);
          float64x2_t v204 = vmlaq_f64(v198, v16[6], v13[6]);
          v16[4] = v195;
          v16[5] = v194;
          v16[6] = v197;
          v16[7] = v196;
          v15[6] = v204;
          v15[7] = v203;
          v15[4] = v202;
          v15[5] = v201;
          v179 += a8;
          --v180;
        }
        while (v180);
      }
LABEL_35:
      v11 -= v178;
      uint64_t v18 = (v178 + v18);
    }
  }
  else
  {
    if (a7 < 1)
    {
      uint64_t v18 = 0;
    }
    else
    {
      int v82 = 0;
      LODWORD(v18) = 0;
      do
      {
        if (v11 < 1)
        {
          float64x2_t v112 = v15[10];
          float64x2_t v111 = v15[11];
          float64x2_t v110 = v15[8];
          float64x2_t v109 = v15[9];
        }
        else
        {
          uint64_t v83 = 0;
          int v84 = v11;
          do
          {
            float64x2_t v85 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v83]), 0);
            float64x2_t v86 = *v15;
            float64x2_t v87 = v15[1];
            float64x2_t v88 = v15[2];
            float64x2_t v89 = v15[3];
            float64x2_t v90 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v83]), 0);
            float64x2_t v91 = vmlaq_f64(vmlaq_f64(v85, *v15, *v13), *v16, v13[8]);
            float64x2_t v92 = vmlaq_f64(vmlaq_f64(v85, v87, v13[1]), v16[1], v13[9]);
            float64x2_t v93 = vmlaq_f64(vmlaq_f64(v85, v88, v13[2]), v16[2], v13[10]);
            float64x2_t v94 = vmlaq_f64(vmlaq_f64(v85, v89, v13[3]), v16[3], v13[11]);
            _OWORD v16[2] = v88;
            v16[3] = v89;
            *int v16 = v86;
            v16[1] = v87;
            v15[2] = v93;
            void v15[3] = v94;
            *unsigned int v15 = v91;
            v15[1] = v92;
            float64x2_t v95 = v15[4];
            float64x2_t v96 = v15[5];
            float64x2_t v97 = v15[6];
            float64x2_t v98 = v15[7];
            float64x2_t v99 = vmlaq_f64(vmlaq_f64(v90, v95, *v13), v16[4], v13[8]);
            float64x2_t v100 = vmlaq_f64(vmlaq_f64(v90, v96, v13[1]), v16[5], v13[9]);
            float64x2_t v101 = vmlaq_f64(vmlaq_f64(v90, v97, v13[2]), v16[6], v13[10]);
            float64x2_t v102 = vmlaq_f64(vmlaq_f64(v90, v98, v13[3]), v16[7], v13[11]);
            v16[4] = v95;
            v16[5] = v96;
            v16[6] = v97;
            v16[7] = v98;
            v15[6] = v101;
            v15[7] = v102;
            v15[4] = v99;
            v15[5] = v100;
            float64x2_t v104 = v15[8];
            float64x2_t v103 = v15[9];
            float64x2_t v106 = v15[10];
            float64x2_t v105 = v15[11];
            float64x2_t v107 = vmlaq_f64(v90, v106, v13[6]);
            float64x2_t v108 = vmlaq_f64(v85, v104, v13[4]);
            float64x2_t v109 = vmlaq_f64(vmlaq_f64(v85, v103, v13[5]), v16[9], v13[13]);
            float64x2_t v110 = vmlaq_f64(v108, v16[8], v13[12]);
            float64x2_t v111 = vmlaq_f64(vmlaq_f64(v90, v105, v13[7]), v16[11], v13[15]);
            float64x2_t v112 = vmlaq_f64(v107, v16[10], v13[14]);
            v16[8] = v104;
            v16[9] = v103;
            v16[10] = v106;
            v16[11] = v105;
            v15[10] = v112;
            v15[11] = v111;
            v15[8] = v110;
            v15[9] = v109;
            v83 += a8;
            --v84;
          }
          while (v84);
          a2 = (const float *)((char *)a2 + v83 * 4);
          a3 = (const float *)((char *)a3 + v83 * 4);
        }
        uint64_t v113 = (v9 >> 21) & 0x3FC;
        int64x2_t v114 = (float64x2_t *)(v14 + (v113 << 6));
        int64x2_t v115 = (float64x2_t *)(v14 + ((unint64_t)(v113 + 4) << 6));
        float64x2_t v116 = v114[1];
        float64x2_t v118 = v114[2];
        float64x2_t v117 = v114[3];
        float64x2_t v236 = v15[1];
        float64x2_t v120 = v15[2];
        float64x2_t v119 = v15[3];
        float64x2_t v122 = v114[10];
        float64x2_t v121 = v114[11];
        float64x2_t v124 = v114[8];
        float64x2_t v123 = v114[9];
        float64x2_t v126 = v16[2];
        float64x2_t v125 = v16[3];
        float64x2_t v127 = v16[1];
        float64x2_t v128 = vmlaq_f64(vmulq_f64(v122, v126), v120, v118);
        float64x2_t v129 = vmlaq_f64(vmulq_f64(v124, *v16), *v15, *v114);
        float64x2_t v130 = vmlaq_f64(vmulq_f64(v121, v125), v119, v117);
        float64x2_t v131 = vmlaq_f64(vmulq_f64(v123, v127), v236, v116);
        float64x2_t v132 = v15[4];
        float64x2_t v133 = v15[5];
        float64x2_t v134 = v15[6];
        float64x2_t v135 = v15[7];
        float64x2_t v136 = v16[6];
        float64x2_t v137 = v16[7];
        float64x2_t v138 = v16[4];
        float64x2_t v139 = v16[5];
        float64x2_t v140 = vmlaq_f64(vmulq_f64(v122, v136), v134, v118);
        float64x2_t v141 = vmlaq_f64(vmulq_f64(v124, v138), v132, *v114);
        float64x2_t v142 = vmlaq_f64(vmulq_f64(v121, v137), v135, v117);
        float64x2_t v143 = vmlaq_f64(vmulq_f64(v123, v139), v133, v116);
        float64x2_t v144 = v115[2];
        float64x2_t v145 = v115[10];
        float64x2_t v146 = v115[11];
        float64x2_t v147 = vmlaq_f64(vmulq_f64(v126, v145), v120, v144);
        float64x2_t v149 = v115[8];
        float64x2_t v148 = v115[9];
        float64x2_t v150 = vmlaq_f64(vmulq_f64(*v16, v149), *v15, *v115);
        float64x2_t v151 = vmulq_f64(v138, v149);
        float64x2_t v152 = vmlaq_f64(vmulq_f64(v136, v145), v134, v144);
        float64x2_t v153 = vmlaq_f64(v151, v132, *v115);
        float64x2_t v155 = v16[10];
        float64x2_t v154 = v16[11];
        float64x2_t v156 = vmlaq_f64(vmulq_f64(v114[15], v154), v111, v114[7]);
        float64x2_t v157 = vmlaq_f64(vmulq_f64(v114[14], v155), v112, v114[6]);
        float64x2_t v158 = v115[3];
        float64x2_t v159 = vmlaq_f64(vmulq_f64(v125, v146), v119, v158);
        float64x2_t v160 = v115[1];
        float64x2_t v161 = vmlaq_f64(vmulq_f64(v127, v148), v236, v160);
        float64x2_t v162 = vmlaq_f64(vmulq_f64(v139, v148), v133, v160);
        float64x2_t v163 = vmlaq_f64(vmulq_f64(v154, v115[15]), v111, v115[7]);
        float64x2_t v165 = v16[8];
        float64x2_t v164 = v16[9];
        float64x2_t v166 = vmlaq_f64(vmulq_f64(v155, v115[14]), v112, v115[6]);
        int64x2_t v167 = (int64x2_t)vaddq_f64(vaddq_f64(v129, v128), vaddq_f64(v131, v130));
        int64x2_t v168 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v114[12], v165), v110, v114[4]), vmlaq_f64(vmulq_f64(v114[13], v164), v109, v114[5]));
        int64x2_t v169 = (int64x2_t)vaddq_f64(vaddq_f64(v141, v140), vaddq_f64(v143, v142));
        int64x2_t v170 = (int64x2_t)vaddq_f64(v157, v156);
        int64x2_t v171 = (int64x2_t)vaddq_f64(vaddq_f64(v150, v147), vaddq_f64(v161, v159));
        int64x2_t v172 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v165, v115[12]), v110, v115[4]), vmlaq_f64(vmulq_f64(v164, v115[13]), v109, v115[5]));
        float64x2_t v173 = vaddq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v171, v167), (float64x2_t)vzip2q_s64(v171, v167)), vaddq_f64((float64x2_t)vzip1q_s64(v172, v168), (float64x2_t)vzip2q_s64(v172, v168)));
        int64x2_t v174 = (int64x2_t)vaddq_f64(vaddq_f64(v153, v152), vaddq_f64(v162, vmlaq_f64(vmulq_f64(v137, v146), v135, v158)));
        int64x2_t v175 = (int64x2_t)vaddq_f64(v166, v163);
        float v176 = *((double *)this + 12) * (double)(v9 & 0x7FFFFF);
        *(float32x2_t *)&v173.f64[0] = vcvt_f32_f64(v173);
        *(float32x2_t *)v174.i8 = vcvt_f32_f64(vaddq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v174, v169), (float64x2_t)vzip2q_s64(v174, v169)), vaddq_f64((float64x2_t)vzip1q_s64(v175, v170), (float64x2_t)vzip2q_s64(v175, v170))));
        *a4 = *((float *)v173.f64 + 1) + (float)(v176 * (float)(*(float *)v173.f64 - *((float *)v173.f64 + 1)));
        *a5 = *(float *)&v174.i32[1] + (float)(v176 * (float)(*(float *)v174.i32 - *(float *)&v174.i32[1]));
        uint64_t v18 = (v18 + v11);
        a4 += a9;
        a5 += a9;
        unsigned int v177 = v9 + v10;
        unsigned int v9 = (v9 + v10) & 0x7FFFFFFF;
        int v11 = v17 + (v177 >> 31);
        ++v82;
      }
      while (v82 != a7);
    }
    int v178 = a6 - v18;
    if (a6 > (int)v18)
    {
      if (v11 < v178) {
        int v178 = v11;
      }
      if (v178 >= 1)
      {
        uint64_t v205 = 0;
        int v206 = v178;
        do
        {
          float64x2_t v207 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v205]), 0);
          float64x2_t v208 = *v15;
          float64x2_t v209 = v15[1];
          float64x2_t v210 = v15[2];
          float64x2_t v211 = v15[3];
          float64x2_t v212 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v205]), 0);
          float64x2_t v213 = vmlaq_f64(vmlaq_f64(v207, *v15, *v13), *v16, v13[8]);
          float64x2_t v214 = vmlaq_f64(vmlaq_f64(v207, v209, v13[1]), v16[1], v13[9]);
          float64x2_t v215 = vmlaq_f64(vmlaq_f64(v207, v210, v13[2]), v16[2], v13[10]);
          float64x2_t v216 = vmlaq_f64(vmlaq_f64(v207, v211, v13[3]), v16[3], v13[11]);
          _OWORD v16[2] = v210;
          v16[3] = v211;
          *int v16 = v208;
          v16[1] = v209;
          v15[2] = v215;
          void v15[3] = v216;
          *unsigned int v15 = v213;
          v15[1] = v214;
          float64x2_t v217 = v15[4];
          float64x2_t v218 = v15[5];
          float64x2_t v219 = v15[6];
          float64x2_t v220 = v15[7];
          float64x2_t v221 = vmlaq_f64(vmlaq_f64(v212, v217, *v13), v16[4], v13[8]);
          float64x2_t v222 = vmlaq_f64(vmlaq_f64(v212, v218, v13[1]), v16[5], v13[9]);
          float64x2_t v223 = vmlaq_f64(vmlaq_f64(v212, v219, v13[2]), v16[6], v13[10]);
          float64x2_t v224 = vmlaq_f64(vmlaq_f64(v212, v220, v13[3]), v16[7], v13[11]);
          v16[4] = v217;
          v16[5] = v218;
          v16[6] = v219;
          v16[7] = v220;
          v15[6] = v223;
          v15[7] = v224;
          v15[4] = v221;
          v15[5] = v222;
          float64x2_t v226 = v15[8];
          float64x2_t v225 = v15[9];
          float64x2_t v228 = v15[10];
          float64x2_t v227 = v15[11];
          float64x2_t v229 = vmlaq_f64(v212, v228, v13[6]);
          float64x2_t v230 = vmlaq_f64(v207, v226, v13[4]);
          float64x2_t v231 = vmlaq_f64(vmlaq_f64(v207, v225, v13[5]), v16[9], v13[13]);
          float64x2_t v232 = vmlaq_f64(v230, v16[8], v13[12]);
          float64x2_t v233 = vmlaq_f64(vmlaq_f64(v212, v227, v13[7]), v16[11], v13[15]);
          float64x2_t v234 = vmlaq_f64(v229, v16[10], v13[14]);
          v16[8] = v226;
          v16[9] = v225;
          v16[10] = v228;
          v16[11] = v227;
          v15[10] = v234;
          v15[11] = v233;
          v15[8] = v232;
          v15[9] = v231;
          v205 += a8;
          --v206;
        }
        while (v206);
      }
      goto LABEL_35;
    }
  }
  *((_DWORD *)this + 18) = v9;
  *((_DWORD *)this + 22) = v11;
  return v18;
}

uint64_t RamstadSRC::processStereoInt(RamstadSRC *this, const float *a2, const float *a3, float *a4, float *a5, int a6, int a7, int a8, int a9)
{
  int v10 = *((_DWORD *)this + 17);
  int v9 = *((_DWORD *)this + 18);
  int v11 = *((_DWORD *)this + 22);
  uint64_t v12 = *(float32x4_t **)(*(void *)this + 16);
  uint64_t v13 = *(void *)(*(void *)this + 40);
  uint64_t v14 = (float32x4_t *)*((void *)this + 14);
  unsigned int v15 = (float32x4_t *)*((void *)this + 17);
  int v16 = *((_DWORD *)this + 13);
  int v17 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a7 < 1)
    {
      uint64_t v19 = 0;
    }
    else
    {
      int v18 = 0;
      LODWORD(v19) = 0;
      do
      {
        if (v11 < 1)
        {
          float32x4_t v33 = v14[2];
          float32x4_t v34 = v14[3];
        }
        else
        {
          uint64_t v20 = 0;
          int v21 = v11;
          do
          {
            float64x2_t v22 = &a2[v20];
            float64x2_t v23 = &a3[v20];
            float32x4_t v24 = vld1q_dup_f32(v22);
            float32x4_t v25 = vld1q_dup_f32(v23);
            float32x4_t v26 = v14[1];
            float32x4_t v27 = vmlaq_f32(v24, v26, v12[1]);
            float32x4_t v28 = vmlaq_f32(vmlaq_f32(v24, *v14, *v12), *v15, v12[2]);
            float32x4_t v29 = vmlaq_f32(v27, v15[1], v12[3]);
            *unsigned int v15 = *v14;
            v15[1] = v26;
            *uint64_t v14 = v28;
            v14[1] = v29;
            float32x4_t v30 = v14[2];
            float32x4_t v31 = v14[3];
            float32x4_t v32 = vmlaq_f32(v25, v31, v12[1]);
            float32x4_t v33 = vmlaq_f32(vmlaq_f32(v25, v30, *v12), v15[2], v12[2]);
            float32x4_t v34 = vmlaq_f32(v32, v15[3], v12[3]);
            v15[2] = v30;
            void v15[3] = v31;
            _OWORD v14[2] = v33;
            v14[3] = v34;
            v20 += a8;
            --v21;
          }
          while (v21);
          a2 = (const float *)((char *)a2 + v20 * 4);
          a3 = (const float *)((char *)a3 + v20 * 4);
        }
        uint64_t v19 = (v19 + v11);
        float64x2_t v35 = (float32x4_t *)(v13 + 64 * v9);
        float32x4_t v36 = v35[1];
        float32x4_t v38 = v35[2];
        float32x4_t v37 = v35[3];
        float32x4_t v39 = vmlaq_f32(vmulq_f32(v37, v15[3]), v34, v36);
        float32x4_t v40 = vmlaq_f32(vmulq_f32(v38, v15[2]), v33, *v35);
        int8x16_t v41 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v38, *v15), *v14, *v35), vmlaq_f32(vmulq_f32(v37, v15[1]), v14[1], v36));
        *a4 = vaddv_f32(vadd_f32(*(float32x2_t *)v41.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v41, v41, 8uLL)));
        int8x16_t v42 = (int8x16_t)vaddq_f32(v40, v39);
        *a5 = vaddv_f32(vadd_f32(*(float32x2_t *)v42.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v42, v42, 8uLL)));
        a4 += a9;
        a5 += a9;
        int v43 = v9 + v10;
        if (v43 < v16) {
          int v11 = v17;
        }
        else {
          int v11 = v17 + 1;
        }
        if (v43 < v16) {
          int v44 = 0;
        }
        else {
          int v44 = v16;
        }
        int v9 = v43 - v44;
        ++v18;
      }
      while (v18 != a7);
    }
    int v79 = a6 - v19;
    if (a6 > (int)v19)
    {
      if (v11 < v79) {
        int v79 = v11;
      }
      if (v79 >= 1)
      {
        uint64_t v80 = 0;
        int v81 = v79;
        do
        {
          int v82 = &a2[v80];
          uint64_t v83 = &a3[v80];
          float32x4_t v84 = vld1q_dup_f32(v82);
          float32x4_t v85 = vld1q_dup_f32(v83);
          float32x4_t v86 = v14[1];
          float32x4_t v87 = vmlaq_f32(v84, v86, v12[1]);
          float32x4_t v88 = vmlaq_f32(vmlaq_f32(v84, *v14, *v12), *v15, v12[2]);
          float32x4_t v89 = vmlaq_f32(v87, v15[1], v12[3]);
          *unsigned int v15 = *v14;
          v15[1] = v86;
          *uint64_t v14 = v88;
          v14[1] = v89;
          float32x4_t v90 = v14[2];
          float32x4_t v91 = v14[3];
          float32x4_t v92 = vmlaq_f32(v85, v91, v12[1]);
          float32x4_t v93 = vmlaq_f32(vmlaq_f32(v85, v90, *v12), v15[2], v12[2]);
          float32x4_t v94 = vmlaq_f32(v92, v15[3], v12[3]);
          v15[2] = v90;
          void v15[3] = v91;
          _OWORD v14[2] = v93;
          v14[3] = v94;
          v80 += a8;
          --v81;
        }
        while (v81);
      }
LABEL_47:
      v11 -= v79;
      uint64_t v19 = (v79 + v19);
    }
  }
  else
  {
    if (a7 < 1)
    {
      uint64_t v19 = 0;
    }
    else
    {
      int v45 = 0;
      LODWORD(v19) = 0;
      do
      {
        if (v11 < 1)
        {
          float32x4_t v61 = v14[4];
          float32x4_t v62 = v14[5];
        }
        else
        {
          uint64_t v46 = 0;
          int v47 = v11;
          do
          {
            float64x2_t v48 = &a2[v46];
            float64x2_t v49 = &a3[v46];
            float32x4_t v50 = vld1q_dup_f32(v48);
            float32x4_t v51 = v14[1];
            float32x4_t v52 = vld1q_dup_f32(v49);
            float32x4_t v53 = vmlaq_f32(vmlaq_f32(v50, *v14, *v12), *v15, v12[4]);
            float32x4_t v54 = vmlaq_f32(vmlaq_f32(v50, v51, v12[1]), v15[1], v12[5]);
            *unsigned int v15 = *v14;
            v15[1] = v51;
            *uint64_t v14 = v53;
            v14[1] = v54;
            float32x4_t v55 = v14[2];
            float32x4_t v56 = v14[3];
            float32x4_t v57 = vmlaq_f32(vmlaq_f32(v52, v55, *v12), v15[2], v12[4]);
            float32x4_t v58 = vmlaq_f32(vmlaq_f32(v52, v56, v12[1]), v15[3], v12[5]);
            v15[2] = v55;
            void v15[3] = v56;
            _OWORD v14[2] = v57;
            v14[3] = v58;
            float32x4_t v59 = v14[4];
            float32x4_t v60 = v14[5];
            float32x4_t v61 = vmlaq_f32(vmlaq_f32(v50, v59, v12[2]), v15[4], v12[6]);
            float32x4_t v62 = vmlaq_f32(vmlaq_f32(v52, v60, v12[3]), v15[5], v12[7]);
            v15[4] = v59;
            v15[5] = v60;
            v14[4] = v61;
            v14[5] = v62;
            v46 += a8;
            --v47;
          }
          while (v47);
          a2 = (const float *)((char *)a2 + v46 * 4);
          a3 = (const float *)((char *)a3 + v46 * 4);
        }
        uint64_t v19 = (v19 + v11);
        float64x2_t v63 = (float32x4_t *)(v13 + 128 * v9);
        float32x4_t v64 = v63[1];
        float32x4_t v66 = v63[4];
        float32x4_t v65 = v63[5];
        float32x4_t v67 = vmlaq_f32(vmulq_f32(v65, v15[1]), v14[1], v64);
        float32x4_t v68 = vmlaq_f32(vmulq_f32(v66, *v15), *v14, *v63);
        float32x4_t v69 = vmlaq_f32(vmulq_f32(v65, v15[3]), v14[3], v64);
        float32x4_t v70 = vmlaq_f32(vmulq_f32(v66, v15[2]), v14[2], *v63);
        int8x16_t v71 = (int8x16_t)vmlaq_f32(vmulq_f32(v63[7], v15[5]), v62, v63[3]);
        int8x16_t v72 = (int8x16_t)vmlaq_f32(vmulq_f32(v63[6], v15[4]), v61, v63[2]);
        int8x16_t v73 = (int8x16_t)vaddq_f32(v68, v67);
        *(float32x2_t *)v73.i8 = vadd_f32(*(float32x2_t *)v73.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v73, v73, 8uLL));
        int32x2_t v74 = (int32x2_t)vadd_f32(*(float32x2_t *)v72.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v72, v72, 8uLL));
        *a4 = vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v73.i8, v74), (float32x2_t)vzip2_s32(*(int32x2_t *)v73.i8, v74)));
        int8x16_t v75 = (int8x16_t)vaddq_f32(v70, v69);
        *(float32x2_t *)v75.i8 = vadd_f32(*(float32x2_t *)v75.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v75, v75, 8uLL));
        int32x2_t v76 = (int32x2_t)vadd_f32(*(float32x2_t *)v71.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v71, v71, 8uLL));
        *a5 = vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v75.i8, v76), (float32x2_t)vzip2_s32(*(int32x2_t *)v75.i8, v76)));
        a4 += a9;
        a5 += a9;
        int v77 = v9 + v10;
        if (v77 < v16) {
          int v11 = v17;
        }
        else {
          int v11 = v17 + 1;
        }
        if (v77 < v16) {
          int v78 = 0;
        }
        else {
          int v78 = v16;
        }
        int v9 = v77 - v78;
        ++v45;
      }
      while (v45 != a7);
    }
    int v79 = a6 - v19;
    if (a6 > (int)v19)
    {
      if (v11 < v79) {
        int v79 = v11;
      }
      if (v79 >= 1)
      {
        uint64_t v95 = 0;
        int v96 = v79;
        do
        {
          float64x2_t v97 = &a2[v95];
          float64x2_t v98 = &a3[v95];
          float32x4_t v99 = vld1q_dup_f32(v97);
          float32x4_t v100 = v14[1];
          float32x4_t v101 = vld1q_dup_f32(v98);
          float32x4_t v102 = vmlaq_f32(vmlaq_f32(v99, *v14, *v12), *v15, v12[4]);
          float32x4_t v103 = vmlaq_f32(vmlaq_f32(v99, v100, v12[1]), v15[1], v12[5]);
          *unsigned int v15 = *v14;
          v15[1] = v100;
          *uint64_t v14 = v102;
          v14[1] = v103;
          float32x4_t v104 = v14[2];
          float32x4_t v105 = v14[3];
          float32x4_t v106 = vmlaq_f32(vmlaq_f32(v101, v104, *v12), v15[2], v12[4]);
          float32x4_t v107 = vmlaq_f32(vmlaq_f32(v101, v105, v12[1]), v15[3], v12[5]);
          v15[2] = v104;
          void v15[3] = v105;
          _OWORD v14[2] = v106;
          v14[3] = v107;
          float32x4_t v108 = v14[4];
          float32x4_t v109 = v14[5];
          float32x4_t v110 = vmlaq_f32(vmlaq_f32(v99, v108, v12[2]), v15[4], v12[6]);
          float32x4_t v111 = vmlaq_f32(vmlaq_f32(v101, v109, v12[3]), v15[5], v12[7]);
          v15[4] = v108;
          v15[5] = v109;
          v14[4] = v110;
          v14[5] = v111;
          v95 += a8;
          --v96;
        }
        while (v96);
      }
      goto LABEL_47;
    }
  }
  *((_DWORD *)this + 18) = v9;
  *((_DWORD *)this + 22) = v11;
  return v19;
}

uint64_t RamstadSRC::processStereoFrac(RamstadSRC *this, const float *a2, const float *a3, float *a4, float *a5, int a6, int a7, int a8, int a9)
{
  int v10 = *((_DWORD *)this + 17);
  unsigned int v9 = *((_DWORD *)this + 18);
  int v11 = *((_DWORD *)this + 22);
  uint64_t v12 = *(float32x4_t **)(*(void *)this + 16);
  uint64_t v13 = *(void *)(*(void *)this + 40);
  uint64_t v14 = (float32x4_t *)*((void *)this + 14);
  unsigned int v15 = (float32x4_t *)*((void *)this + 17);
  int v16 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a7 >= 1)
    {
      LODWORD(v17) = 0;
      int v18 = 0;
      while (1)
      {
        uint64_t v17 = (v17 + v11);
        if ((int)v17 > *((_DWORD *)this + 64)) {
          goto LABEL_39;
        }
        if (v11 < 1)
        {
          float32x4_t v31 = v14[2];
          float32x4_t v32 = v14[3];
        }
        else
        {
          uint64_t v19 = 0;
          do
          {
            uint64_t v20 = &a2[v19];
            int v21 = &a3[v19];
            float32x4_t v22 = vld1q_dup_f32(v20);
            float32x4_t v23 = vld1q_dup_f32(v21);
            float32x4_t v24 = v14[1];
            float32x4_t v25 = vmlaq_f32(v22, v24, v12[1]);
            float32x4_t v26 = vmlaq_f32(vmlaq_f32(v22, *v14, *v12), *v15, v12[2]);
            float32x4_t v27 = vmlaq_f32(v25, v15[1], v12[3]);
            *unsigned int v15 = *v14;
            v15[1] = v24;
            *uint64_t v14 = v26;
            v14[1] = v27;
            float32x4_t v28 = v14[2];
            float32x4_t v29 = v14[3];
            float32x4_t v30 = vmlaq_f32(v23, v29, v12[1]);
            float32x4_t v31 = vmlaq_f32(vmlaq_f32(v23, v28, *v12), v15[2], v12[2]);
            float32x4_t v32 = vmlaq_f32(v30, v15[3], v12[3]);
            v15[2] = v28;
            void v15[3] = v29;
            _OWORD v14[2] = v31;
            v14[3] = v32;
            v19 += a8;
            --v11;
          }
          while (v11);
          a2 = (const float *)((char *)a2 + v19 * 4);
          a3 = (const float *)((char *)a3 + v19 * 4);
        }
        float v33 = *((double *)this + 12) * (double)(v9 & 0x7FFFFF);
        uint64_t v34 = (v9 >> 22) & 0x1FE;
        float64x2_t v35 = (float32x4_t *)(v13 + 32 * v34);
        float32x4_t v36 = (float32x4_t *)(v13 + 32 * (v34 + 2));
        float32x4_t v37 = v35[1];
        float32x4_t v38 = v14[1];
        float32x4_t v40 = v35[2];
        float32x4_t v39 = v35[3];
        float32x4_t v41 = v15[1];
        float32x4_t v43 = v15[2];
        float32x4_t v42 = v15[3];
        int8x16_t v44 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v40, *v15), *v14, *v35), vmlaq_f32(vmulq_f32(v39, v41), v38, v37));
        *(float32x2_t *)v44.i8 = vadd_f32(*(float32x2_t *)v44.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v44, v44, 8uLL));
        int8x16_t v45 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v40, v43), v31, *v35), vmlaq_f32(vmulq_f32(v39, v42), v32, v37));
        *(float32x2_t *)v45.i8 = vadd_f32(*(float32x2_t *)v45.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v45, v45, 8uLL));
        float32x4_t v46 = v36[1];
        float32x4_t v48 = v36[2];
        float32x4_t v47 = v36[3];
        float32x4_t v49 = vmlaq_f32(vmulq_f32(v43, v48), v31, *v36);
        int8x16_t v50 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(*v15, v48), *v14, *v36), vmlaq_f32(vmulq_f32(v41, v47), v38, v46));
        *(float32x2_t *)v50.i8 = vadd_f32(*(float32x2_t *)v50.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v50, v50, 8uLL));
        *(float32x2_t *)v50.i8 = vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v50.i8, *(int32x2_t *)v44.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v50.i8, *(int32x2_t *)v44.i8));
        int8x16_t v51 = (int8x16_t)vaddq_f32(v49, vmlaq_f32(vmulq_f32(v42, v47), v32, v46));
        *(float32x2_t *)v51.i8 = vadd_f32(*(float32x2_t *)v51.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v51, v51, 8uLL));
        *(float32x2_t *)v51.i8 = vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v51.i8, *(int32x2_t *)v45.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v51.i8, *(int32x2_t *)v45.i8));
        *a4 = *(float *)&v50.i32[1] + (float)(v33 * (float)(*(float *)v50.i32 - *(float *)&v50.i32[1]));
        *a5 = *(float *)&v51.i32[1] + (float)(v33 * (float)(*(float *)v51.i32 - *(float *)&v51.i32[1]));
        a4 += a9;
        a5 += a9;
        LODWORD(v36) = v9 + v10;
        unsigned int v9 = (v9 + v10) & 0x7FFFFFFF;
        int v11 = v16 + (v36 >> 31);
        if (++v18 == a7) {
          goto LABEL_23;
        }
      }
    }
    uint64_t v17 = 0;
LABEL_23:
    int v101 = a6 - v17;
    if (a6 > (int)v17)
    {
      if (v11 < v101) {
        int v101 = v11;
      }
      if (v101 >= 1)
      {
        uint64_t v102 = 0;
        int v103 = v101;
        do
        {
          float32x4_t v104 = &a2[v102];
          float32x4_t v105 = &a3[v102];
          float32x4_t v106 = vld1q_dup_f32(v104);
          float32x4_t v107 = vld1q_dup_f32(v105);
          float32x4_t v108 = v14[1];
          float32x4_t v109 = vmlaq_f32(v106, v108, v12[1]);
          float32x4_t v110 = vmlaq_f32(vmlaq_f32(v106, *v14, *v12), *v15, v12[2]);
          float32x4_t v111 = vmlaq_f32(v109, v15[1], v12[3]);
          *unsigned int v15 = *v14;
          v15[1] = v108;
          *uint64_t v14 = v110;
          v14[1] = v111;
          float32x4_t v112 = v14[2];
          float32x4_t v113 = v14[3];
          float32x4_t v114 = vmlaq_f32(v107, v113, v12[1]);
          float32x4_t v115 = vmlaq_f32(vmlaq_f32(v107, v112, *v12), v15[2], v12[2]);
          float32x4_t v116 = vmlaq_f32(v114, v15[3], v12[3]);
          v15[2] = v112;
          void v15[3] = v113;
          _OWORD v14[2] = v115;
          v14[3] = v116;
          v102 += a8;
          --v103;
        }
        while (v103);
      }
LABEL_37:
      v11 -= v101;
      uint64_t v17 = (v101 + v17);
    }
  }
  else
  {
    if (a7 >= 1)
    {
      int v52 = 0;
      LODWORD(v17) = 0;
      while (1)
      {
        uint64_t v17 = (v17 + v11);
        if ((int)v17 > *((_DWORD *)this + 64)) {
          break;
        }
        if (v11 < 1)
        {
          float32x4_t v67 = v14[4];
          float32x4_t v68 = v14[5];
        }
        else
        {
          uint64_t v53 = 0;
          do
          {
            float32x4_t v54 = &a2[v53];
            float32x4_t v55 = &a3[v53];
            float32x4_t v56 = vld1q_dup_f32(v54);
            float32x4_t v57 = v14[1];
            float32x4_t v58 = vld1q_dup_f32(v55);
            float32x4_t v59 = vmlaq_f32(vmlaq_f32(v56, *v14, *v12), *v15, v12[4]);
            float32x4_t v60 = vmlaq_f32(vmlaq_f32(v56, v57, v12[1]), v15[1], v12[5]);
            *unsigned int v15 = *v14;
            v15[1] = v57;
            *uint64_t v14 = v59;
            v14[1] = v60;
            float32x4_t v61 = v14[2];
            float32x4_t v62 = v14[3];
            float32x4_t v63 = vmlaq_f32(vmlaq_f32(v58, v61, *v12), v15[2], v12[4]);
            float32x4_t v64 = vmlaq_f32(vmlaq_f32(v58, v62, v12[1]), v15[3], v12[5]);
            v15[2] = v61;
            void v15[3] = v62;
            _OWORD v14[2] = v63;
            v14[3] = v64;
            float32x4_t v65 = v14[4];
            float32x4_t v66 = v14[5];
            float32x4_t v67 = vmlaq_f32(vmlaq_f32(v56, v65, v12[2]), v15[4], v12[6]);
            float32x4_t v68 = vmlaq_f32(vmlaq_f32(v58, v66, v12[3]), v15[5], v12[7]);
            v15[4] = v65;
            v15[5] = v66;
            v14[4] = v67;
            v14[5] = v68;
            v53 += a8;
            --v11;
          }
          while (v11);
          a2 = (const float *)((char *)a2 + v53 * 4);
          a3 = (const float *)((char *)a3 + v53 * 4);
        }
        float v69 = *((double *)this + 12) * (double)(v9 & 0x7FFFFF);
        uint64_t v70 = (v9 >> 21) & 0x3FC;
        int8x16_t v71 = (float32x4_t *)(v13 + 32 * v70);
        int8x16_t v72 = (float32x4_t *)(v13 + 32 * (v70 + 4));
        float32x4_t v73 = v71[1];
        float32x4_t v74 = v14[1];
        float32x4_t v76 = v71[4];
        float32x4_t v75 = v71[5];
        float32x4_t v77 = v15[1];
        float32x4_t v78 = vmlaq_f32(vmulq_f32(v75, v77), v74, v73);
        float32x4_t v79 = v14[2];
        float32x4_t v80 = v14[3];
        float32x4_t v82 = v15[2];
        float32x4_t v81 = v15[3];
        float32x4_t v83 = vmlaq_f32(vmulq_f32(v75, v81), v80, v73);
        float32x4_t v85 = v15[4];
        float32x4_t v84 = v15[5];
        int8x16_t v86 = (int8x16_t)vmlaq_f32(vmulq_f32(v71[7], v84), v68, v71[3]);
        int8x16_t v87 = (int8x16_t)vmlaq_f32(vmulq_f32(v71[6], v85), v67, v71[2]);
        int8x16_t v88 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v76, *v15), *v14, *v71), v78);
        *(float32x2_t *)v88.i8 = vadd_f32(*(float32x2_t *)v88.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v88, v88, 8uLL));
        *(float32x2_t *)v73.f32 = vadd_f32(*(float32x2_t *)v87.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v87, v87, 8uLL));
        int8x16_t v89 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v76, v82), v79, *v71), v83);
        *(float32x2_t *)v89.i8 = vadd_f32(*(float32x2_t *)v89.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v89, v89, 8uLL));
        *(float32x2_t *)v76.f32 = vadd_f32(*(float32x2_t *)v86.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v86, v86, 8uLL));
        float32x4_t v90 = v72[1];
        float32x4_t v92 = v72[4];
        float32x4_t v91 = v72[5];
        float32x4_t v93 = vmlaq_f32(vmulq_f32(v77, v91), v74, v90);
        float32x4_t v94 = vmlaq_f32(vmulq_f32(v81, v91), v80, v90);
        float32x4_t v95 = vmlaq_f32(vmulq_f32(v82, v92), v79, *v72);
        int8x16_t v96 = (int8x16_t)vmlaq_f32(vmulq_f32(v84, v72[7]), v68, v72[3]);
        int8x16_t v97 = (int8x16_t)vmlaq_f32(vmulq_f32(v85, v72[6]), v67, v72[2]);
        int8x16_t v98 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(*v15, v92), *v14, *v72), v93);
        *(float32x2_t *)v98.i8 = vadd_f32(*(float32x2_t *)v98.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v98, v98, 8uLL));
        int32x2_t v99 = (int32x2_t)vadd_f32(*(float32x2_t *)v97.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v97, v97, 8uLL));
        *(float32x2_t *)v98.i8 = vadd_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v98.i8, *(int32x2_t *)v88.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v98.i8, *(int32x2_t *)v88.i8)), vadd_f32((float32x2_t)vzip1_s32(v99, *(int32x2_t *)v73.f32), (float32x2_t)vzip2_s32(v99, *(int32x2_t *)v73.f32)));
        int8x16_t v100 = (int8x16_t)vaddq_f32(v95, v94);
        *(float32x2_t *)v100.i8 = vadd_f32(*(float32x2_t *)v100.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v100, v100, 8uLL));
        *(float32x2_t *)v88.i8 = vadd_f32(*(float32x2_t *)v96.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v96, v96, 8uLL));
        *(float32x2_t *)v100.i8 = vadd_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v100.i8, *(int32x2_t *)v89.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v100.i8, *(int32x2_t *)v89.i8)), vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v88.i8, *(int32x2_t *)v76.f32), (float32x2_t)vzip2_s32(*(int32x2_t *)v88.i8, *(int32x2_t *)v76.f32)));
        *a4 = *(float *)&v98.i32[1] + (float)(v69 * (float)(*(float *)v98.i32 - *(float *)&v98.i32[1]));
        *a5 = *(float *)&v100.i32[1] + (float)(v69 * (float)(*(float *)v100.i32 - *(float *)&v100.i32[1]));
        a4 += a9;
        a5 += a9;
        LODWORD(v72) = v9 + v10;
        unsigned int v9 = (v9 + v10) & 0x7FFFFFFF;
        int v11 = v16 + (v72 >> 31);
        if (++v52 == a7) {
          goto LABEL_31;
        }
      }
LABEL_39:
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "RamstadSRC::processStereoFrac preflight prediction failed.");
    }
    uint64_t v17 = 0;
LABEL_31:
    int v101 = a6 - v17;
    if (a6 > (int)v17)
    {
      if (v11 < v101) {
        int v101 = v11;
      }
      if (v101 >= 1)
      {
        uint64_t v117 = 0;
        int v118 = v101;
        do
        {
          float64x2_t v119 = &a2[v117];
          float64x2_t v120 = &a3[v117];
          float32x4_t v121 = vld1q_dup_f32(v119);
          float32x4_t v122 = v14[1];
          float32x4_t v123 = vld1q_dup_f32(v120);
          float32x4_t v124 = vmlaq_f32(vmlaq_f32(v121, *v14, *v12), *v15, v12[4]);
          float32x4_t v125 = vmlaq_f32(vmlaq_f32(v121, v122, v12[1]), v15[1], v12[5]);
          *unsigned int v15 = *v14;
          v15[1] = v122;
          *uint64_t v14 = v124;
          v14[1] = v125;
          float32x4_t v126 = v14[2];
          float32x4_t v127 = v14[3];
          float32x4_t v128 = vmlaq_f32(vmlaq_f32(v123, v126, *v12), v15[2], v12[4]);
          float32x4_t v129 = vmlaq_f32(vmlaq_f32(v123, v127, v12[1]), v15[3], v12[5]);
          v15[2] = v126;
          void v15[3] = v127;
          _OWORD v14[2] = v128;
          v14[3] = v129;
          float32x4_t v130 = v14[4];
          float32x4_t v131 = v14[5];
          float32x4_t v132 = vmlaq_f32(vmlaq_f32(v121, v130, v12[2]), v15[4], v12[6]);
          float32x4_t v133 = vmlaq_f32(vmlaq_f32(v123, v131, v12[3]), v15[5], v12[7]);
          v15[4] = v130;
          v15[5] = v131;
          v14[4] = v132;
          v14[5] = v133;
          v117 += a8;
          --v118;
        }
        while (v118);
      }
      goto LABEL_37;
    }
  }
  *((_DWORD *)this + 18) = v9;
  *((_DWORD *)this + 22) = v11;
  return v17;
}

void sub_1ABAE9F8C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

double RamstadSRC::processMulti(RamstadSRC *this, const float *const *a2, float *const *a3, int a4, int a5, int a6, int a7)
{
  RamstadSRC::checkPreflight(this, a4, a5);
  if (*((unsigned char *)this + 93))
  {
    if (*((unsigned char *)this + 92)) {
      RamstadSRC::processMultiIntD(this, a2, a3, a4, a5, a6, a7);
    }
    else {
      RamstadSRC::processMultiFracD(this, a2, a3, a4, a5, a6, a7);
    }
  }
  else if (*((unsigned char *)this + 92))
  {
    RamstadSRC::processMultiInt(this, a2, a3, a4, a5, a6, a7);
  }
  else
  {
    RamstadSRC::processMultiFrac(this, a2, a3, a4, a5, a6, a7);
  }
  double result = NAN;
  *((void *)this + 32) = -1;
  *((_DWORD *)this + 66) = -1;
  return result;
}

void sub_1ABAEA05C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 256) = -1;
  *(_DWORD *)(v1 + 264) = -1;
  _Unwind_Resume(a1);
}

uint64_t RamstadSRC::processMultiIntD(RamstadSRC *this, const float *const *a2, float *const *a3, int a4, int a5, int a6, int a7)
{
  int v8 = *((_DWORD *)this + 17);
  int v7 = *((_DWORD *)this + 18);
  int v9 = *((_DWORD *)this + 22);
  uint64_t v10 = *((void *)this + 2);
  int v11 = *(float64x2_t **)(v10 + 16);
  uint64_t v12 = *(void *)(v10 + 40);
  uint64_t v13 = (float64x2_t *)*((void *)this + 20);
  uint64_t v14 = (float64x2_t *)*((void *)this + 23);
  int v15 = *((_DWORD *)this + 13);
  int v16 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a5 < 1)
    {
      uint64_t v20 = 0;
      LODWORD(v19) = 0;
    }
    else
    {
      uint64_t v17 = 0;
      int v18 = 0;
      LODWORD(v19) = 0;
      LODWORD(v2CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 0;
      do
      {
        if (v9 >= 1)
        {
          int v21 = 0;
          uint64_t v19 = (int)v19;
          do
          {
            uint64_t v22 = *((unsigned int *)this + 12);
            if (v22)
            {
              float32x4_t v23 = a2;
              float32x4_t v24 = v13;
              float32x4_t v25 = v14;
              do
              {
                uint64_t v26 = (uint64_t)*v23++;
                float64x2_t v27 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(v26 + 4 * v19)), 0);
                float64x2_t v29 = *v24;
                float64x2_t v28 = v24[1];
                float64x2_t v31 = v24[2];
                float64x2_t v30 = v24[3];
                float64x2_t v32 = vmlaq_f64(v27, v31, v11[2]);
                float64x2_t v33 = vmlaq_f64(v27, v30, v11[3]);
                float64x2_t v34 = vmlaq_f64(v27, *v24, *v11);
                float64x2_t v35 = vmlaq_f64(vmlaq_f64(v27, v28, v11[1]), v25[1], v11[5]);
                float64x2_t v36 = vmlaq_f64(v34, *v25, v11[4]);
                float64x2_t v37 = vmlaq_f64(v33, v25[3], v11[7]);
                float64x2_t v38 = vmlaq_f64(v32, v25[2], v11[6]);
                v25[2] = v31;
                v25[3] = v30;
                *float32x4_t v25 = v29;
                v25[1] = v28;
                v25 += 4;
                v24[2] = v38;
                v24[3] = v37;
                float64x2_t *v24 = v36;
                v24[1] = v35;
                v24 += 4;
                --v22;
              }
              while (v22);
            }
            v19 += a6;
            ++v21;
          }
          while (v21 != v9);
        }
        uint64_t v39 = *((unsigned int *)this + 12);
        if (v39)
        {
          float32x4_t v41 = v13;
          float32x4_t v42 = v14;
          float32x4_t v43 = a3;
          do
          {
            float64x2_t v44 = v42[2];
            float64x2_t v45 = v42[3];
            float64x2_t v46 = *v42;
            float64x2_t v47 = v42[1];
            v42 += 4;
            uint64_t v48 = (uint64_t)*v43++;
            float32x4_t v40 = (float64x2_t *)(v12 + ((uint64_t)(2 * v7) << 6));
            float v49 = vaddvq_f64(vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v40[4], v46), *v41, *v40), vmlaq_f64(vmulq_f64(v40[6], v44), v41[2], v40[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v40[5], v47), v41[1], v40[1]), vmlaq_f64(vmulq_f64(v40[7], v45), v41[3], v40[3]))));
            *(float *)(v48 + 4 * v17) = v49;
            v41 += 4;
            --v39;
          }
          while (v39);
        }
        uint64_t v20 = (v20 + v9);
        int v50 = v7 + v8;
        if (v50 < v15) {
          int v9 = v16;
        }
        else {
          int v9 = v16 + 1;
        }
        if (v50 < v15) {
          int v51 = 0;
        }
        else {
          int v51 = v15;
        }
        int v7 = v50 - v51;
        ++v18;
        v17 += a7;
      }
      while (v18 != a5);
    }
    int v133 = a4 - v20;
    if (a4 > (int)v20)
    {
      if (v9 < v133) {
        int v133 = v9;
      }
      if (v133 >= 1)
      {
        int v134 = 0;
        uint64_t v135 = (int)v19;
        uint64_t v136 = a6;
        do
        {
          uint64_t v137 = *((unsigned int *)this + 12);
          if (v137)
          {
            float64x2_t v138 = a2;
            float64x2_t v139 = v13;
            float64x2_t v140 = v14;
            do
            {
              uint64_t v141 = (uint64_t)*v138++;
              float64x2_t v142 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(v141 + 4 * v135)), 0);
              float64x2_t v144 = *v139;
              float64x2_t v143 = v139[1];
              float64x2_t v146 = v139[2];
              float64x2_t v145 = v139[3];
              float64x2_t v147 = vmlaq_f64(v142, v146, v11[2]);
              float64x2_t v148 = vmlaq_f64(v142, v145, v11[3]);
              float64x2_t v149 = vmlaq_f64(v142, *v139, *v11);
              float64x2_t v150 = vmlaq_f64(vmlaq_f64(v142, v143, v11[1]), v140[1], v11[5]);
              float64x2_t v151 = vmlaq_f64(v149, *v140, v11[4]);
              float64x2_t v152 = vmlaq_f64(v148, v140[3], v11[7]);
              float64x2_t v153 = vmlaq_f64(v147, v140[2], v11[6]);
              v140[2] = v146;
              v140[3] = v145;
              *float64x2_t v140 = v144;
              v140[1] = v143;
              v140 += 4;
              v139[2] = v153;
              v139[3] = v152;
              *float64x2_t v139 = v151;
              v139[1] = v150;
              v139 += 4;
              --v137;
            }
            while (v137);
          }
          v135 += v136;
          ++v134;
        }
        while (v134 != v133);
      }
LABEL_67:
      v9 -= v133;
      uint64_t v20 = (v133 + v20);
    }
  }
  else
  {
    if (a5 < 1)
    {
      uint64_t v20 = 0;
      LODWORD(v54) = 0;
    }
    else
    {
      uint64_t v52 = 0;
      int v53 = 0;
      LODWORD(v54) = 0;
      LODWORD(v2CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 0;
      do
      {
        if (v9 >= 1)
        {
          int v55 = 0;
          uint64_t v54 = (int)v54;
          do
          {
            int v56 = *((_DWORD *)this + 12);
            float32x4_t v57 = v13;
            float32x4_t v58 = v14;
            unint64_t v59 = v56 - (v56 != 0);
            if (v59)
            {
              unint64_t v60 = 0;
              float32x4_t v58 = v14;
              float32x4_t v57 = v13;
              do
              {
                float32x4_t v61 = &a2[v60];
                float64x2_t v62 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((*v61)[v54]), 0);
                float64x2_t v63 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(*((void *)v61 + 1) + 4 * v54)), 0);
                float64x2_t v64 = *v57;
                float64x2_t v65 = v57[1];
                float64x2_t v66 = v57[2];
                float64x2_t v67 = v57[3];
                float64x2_t v68 = vmlaq_f64(vmlaq_f64(v62, *v57, *v11), *v58, v11[8]);
                float64x2_t v69 = vmlaq_f64(vmlaq_f64(v62, v65, v11[1]), v58[1], v11[9]);
                float64x2_t v70 = vmlaq_f64(vmlaq_f64(v62, v66, v11[2]), v58[2], v11[10]);
                float64x2_t v71 = vmlaq_f64(vmlaq_f64(v62, v67, v11[3]), v58[3], v11[11]);
                v58[2] = v66;
                v58[3] = v67;
                *float32x4_t v58 = v64;
                v58[1] = v65;
                v57[2] = v70;
                v57[3] = v71;
                *float32x4_t v57 = v68;
                v57[1] = v69;
                float64x2_t v72 = v57[4];
                float64x2_t v73 = v57[5];
                float64x2_t v74 = v57[6];
                float64x2_t v75 = v57[7];
                float64x2_t v76 = vmlaq_f64(vmlaq_f64(v63, v72, *v11), v58[4], v11[8]);
                float64x2_t v77 = vmlaq_f64(vmlaq_f64(v63, v73, v11[1]), v58[5], v11[9]);
                float64x2_t v78 = vmlaq_f64(vmlaq_f64(v63, v74, v11[2]), v58[6], v11[10]);
                float64x2_t v79 = vmlaq_f64(vmlaq_f64(v63, v75, v11[3]), v58[7], v11[11]);
                v58[4] = v72;
                v58[5] = v73;
                v58[6] = v74;
                v58[7] = v75;
                v57[6] = v78;
                v57[7] = v79;
                v57[4] = v76;
                v57[5] = v77;
                float64x2_t v81 = v57[8];
                float64x2_t v80 = v57[9];
                float64x2_t v83 = v57[10];
                float64x2_t v82 = v57[11];
                float64x2_t v84 = vmlaq_f64(v63, v83, v11[6]);
                float64x2_t v85 = vmlaq_f64(v62, v81, v11[4]);
                float64x2_t v86 = vmlaq_f64(vmlaq_f64(v62, v80, v11[5]), v58[9], v11[13]);
                float64x2_t v87 = vmlaq_f64(v85, v58[8], v11[12]);
                float64x2_t v88 = vmlaq_f64(vmlaq_f64(v63, v82, v11[7]), v58[11], v11[15]);
                float64x2_t v89 = vmlaq_f64(v84, v58[10], v11[14]);
                v58[8] = v81;
                v58[9] = v80;
                v58[10] = v83;
                v58[11] = v82;
                v57[10] = v89;
                v57[11] = v88;
                v57[8] = v87;
                v57[9] = v86;
                v57 += 12;
                v58 += 12;
                v60 += 2;
              }
              while (v60 < v59);
            }
            if (v56)
            {
              float64x2_t v90 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v56 - 1][v54]), 0);
              float64x2_t v91 = *v57;
              float64x2_t v92 = v57[1];
              float64x2_t v93 = v57[2];
              float64x2_t v94 = v57[3];
              float64x2_t v95 = vmlaq_f64(vmlaq_f64(v90, *v57, *v11), *v58, v11[8]);
              float64x2_t v96 = vmlaq_f64(vmlaq_f64(v90, v92, v11[1]), v58[1], v11[9]);
              float64x2_t v97 = vmlaq_f64(vmlaq_f64(v90, v93, v11[2]), v58[2], v11[10]);
              float64x2_t v98 = vmlaq_f64(vmlaq_f64(v90, v94, v11[3]), v58[3], v11[11]);
              v58[2] = v93;
              v58[3] = v94;
              *float32x4_t v58 = v91;
              v58[1] = v92;
              v57[2] = v97;
              v57[3] = v98;
              *float32x4_t v57 = v95;
              v57[1] = v96;
              float64x2_t v100 = v57[4];
              float64x2_t v99 = v57[5];
              float64x2_t v102 = v57[6];
              float64x2_t v101 = v57[7];
              float64x2_t v103 = vmlaq_f64(v90, v100, v11[4]);
              float64x2_t v104 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v101, v11[7]), v58[7], v11[15]);
              float64x2_t v105 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v102, v11[6]), v58[6], v11[14]);
              float64x2_t v106 = vmlaq_f64(vmlaq_f64(v90, v99, v11[5]), v58[5], v11[13]);
              float64x2_t v107 = vmlaq_f64(v103, v58[4], v11[12]);
              v58[4] = v100;
              v58[5] = v99;
              v58[6] = v102;
              v58[7] = v101;
              v57[6] = v105;
              v57[7] = v104;
              v57[4] = v107;
              v57[5] = v106;
            }
            v54 += a6;
            ++v55;
          }
          while (v55 != v9);
        }
        float32x4_t v108 = (float64x2_t *)(v12 + ((uint64_t)(4 * v7) << 6));
        int v109 = *((_DWORD *)this + 12);
        float32x4_t v110 = v13;
        float32x4_t v111 = v14;
        unint64_t v112 = v109 - (v109 != 0);
        if (v112)
        {
          unint64_t v113 = 0;
          float32x4_t v111 = v14;
          float32x4_t v110 = v13;
          do
          {
            float32x4_t v114 = &a3[v113];
            float64x2_t v115 = v108[1];
            float64x2_t v117 = v108[2];
            float64x2_t v116 = v108[3];
            float64x2_t v118 = v108[10];
            float64x2_t v119 = v108[11];
            float64x2_t v120 = v108[8];
            float64x2_t v121 = v108[9];
            float64x2_t v122 = vmlaq_f64(vmulq_f64(v121, v111[5]), v110[5], v115);
            float32x4_t v124 = *v114;
            uint64_t v123 = *((void *)v114 + 1);
            int64x2_t v125 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v120, *v111), *v110, *v108), vmlaq_f64(vmulq_f64(v118, v111[2]), v110[2], v117)), vaddq_f64(vmlaq_f64(vmulq_f64(v121, v111[1]), v110[1], v115), vmlaq_f64(vmulq_f64(v119, v111[3]), v110[3], v116)));
            int64x2_t v126 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v108[12], v111[8]), v110[8], v108[4]), vmlaq_f64(vmulq_f64(v108[13], v111[9]), v110[9], v108[5]));
            *(double *)v126.i64 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v125, v126), (float64x2_t)vzip2q_s64(v125, v126)));
            int64x2_t v127 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v120, v111[4]), v110[4], *v108), vmlaq_f64(vmulq_f64(v118, v111[6]), v110[6], v117)), vaddq_f64(v122, vmlaq_f64(vmulq_f64(v119, v111[7]), v110[7], v116)));
            int64x2_t v128 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v108[14], v111[10]), v110[10], v108[6]), vmlaq_f64(vmulq_f64(v108[15], v111[11]), v110[11], v108[7]));
            *(float *)v126.i32 = *(double *)v126.i64;
            *(float *)v127.i32 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v127, v128), (float64x2_t)vzip2q_s64(v127, v128)));
            v124[v52] = *(float *)v126.i32;
            *(_DWORD *)(v123 + 4 * v52) = v127.i32[0];
            v110 += 12;
            v111 += 12;
            v113 += 2;
          }
          while (v113 < v112);
        }
        if (v109)
        {
          int64x2_t v129 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v108[8], *v111), *v110, *v108), vmlaq_f64(vmulq_f64(v108[10], v111[2]), v110[2], v108[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v108[9], v111[1]), v110[1], v108[1]), vmlaq_f64(vmulq_f64(v108[11], v111[3]), v110[3], v108[3])));
          int64x2_t v130 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v108[12], v111[4]), v110[4], v108[4]), vmlaq_f64(vmulq_f64(v108[14], v111[6]), v110[6], v108[6])), vaddq_f64(vmlaq_f64(vmulq_f64(v108[13], v111[5]), v110[5], v108[5]), vmlaq_f64(vmulq_f64(v108[15], v111[7]), v110[7], v108[7])));
          *(float *)v129.i32 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v129, v130), (float64x2_t)vzip2q_s64(v129, v130)));
          LODWORD(a3[v109 - 1][v52]) = v129.i32[0];
        }
        uint64_t v20 = (v20 + v9);
        int v131 = v7 + v8;
        if (v131 < v15) {
          int v9 = v16;
        }
        else {
          int v9 = v16 + 1;
        }
        if (v131 < v15) {
          int v132 = 0;
        }
        else {
          int v132 = v15;
        }
        int v7 = v131 - v132;
        ++v53;
        v52 += a7;
      }
      while (v53 != a5);
    }
    int v133 = a4 - v20;
    if (a4 > (int)v20)
    {
      if (v9 < v133) {
        int v133 = v9;
      }
      if (v133 >= 1)
      {
        int v154 = 0;
        uint64_t v155 = (int)v54;
        uint64_t v156 = a6;
        do
        {
          int v157 = *((_DWORD *)this + 12);
          float64x2_t v158 = v13;
          float64x2_t v159 = v14;
          unint64_t v160 = v157 - (v157 != 0);
          if (v160)
          {
            unint64_t v161 = 0;
            float64x2_t v159 = v14;
            float64x2_t v158 = v13;
            do
            {
              float64x2_t v162 = &a2[v161];
              float64x2_t v163 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((*v162)[v155]), 0);
              float64x2_t v164 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(*((void *)v162 + 1) + 4 * v155)), 0);
              float64x2_t v165 = *v158;
              float64x2_t v166 = v158[1];
              float64x2_t v167 = v158[2];
              float64x2_t v168 = v158[3];
              float64x2_t v169 = vmlaq_f64(vmlaq_f64(v163, *v158, *v11), *v159, v11[8]);
              float64x2_t v170 = vmlaq_f64(vmlaq_f64(v163, v166, v11[1]), v159[1], v11[9]);
              float64x2_t v171 = vmlaq_f64(vmlaq_f64(v163, v167, v11[2]), v159[2], v11[10]);
              float64x2_t v172 = vmlaq_f64(vmlaq_f64(v163, v168, v11[3]), v159[3], v11[11]);
              v159[2] = v167;
              v159[3] = v168;
              *float64x2_t v159 = v165;
              v159[1] = v166;
              v158[2] = v171;
              v158[3] = v172;
              *float64x2_t v158 = v169;
              v158[1] = v170;
              float64x2_t v173 = v158[4];
              float64x2_t v174 = v158[5];
              float64x2_t v175 = v158[6];
              float64x2_t v176 = v158[7];
              float64x2_t v177 = vmlaq_f64(vmlaq_f64(v164, v173, *v11), v159[4], v11[8]);
              float64x2_t v178 = vmlaq_f64(vmlaq_f64(v164, v174, v11[1]), v159[5], v11[9]);
              float64x2_t v179 = vmlaq_f64(vmlaq_f64(v164, v175, v11[2]), v159[6], v11[10]);
              float64x2_t v180 = vmlaq_f64(vmlaq_f64(v164, v176, v11[3]), v159[7], v11[11]);
              v159[4] = v173;
              v159[5] = v174;
              v159[6] = v175;
              v159[7] = v176;
              v158[6] = v179;
              v158[7] = v180;
              v158[4] = v177;
              v158[5] = v178;
              float64x2_t v182 = v158[8];
              float64x2_t v181 = v158[9];
              float64x2_t v184 = v158[10];
              float64x2_t v183 = v158[11];
              float64x2_t v185 = vmlaq_f64(v164, v184, v11[6]);
              float64x2_t v186 = vmlaq_f64(v163, v182, v11[4]);
              float64x2_t v187 = vmlaq_f64(vmlaq_f64(v163, v181, v11[5]), v159[9], v11[13]);
              float64x2_t v188 = vmlaq_f64(v186, v159[8], v11[12]);
              float64x2_t v189 = vmlaq_f64(vmlaq_f64(v164, v183, v11[7]), v159[11], v11[15]);
              float64x2_t v190 = vmlaq_f64(v185, v159[10], v11[14]);
              v159[8] = v182;
              v159[9] = v181;
              v159[10] = v184;
              v159[11] = v183;
              v158[10] = v190;
              v158[11] = v189;
              v158[8] = v188;
              v158[9] = v187;
              v158 += 12;
              v159 += 12;
              v161 += 2;
            }
            while (v161 < v160);
          }
          if (v157)
          {
            float64x2_t v191 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v157 - 1][v155]), 0);
            float64x2_t v192 = *v158;
            float64x2_t v193 = v158[1];
            float64x2_t v194 = v158[2];
            float64x2_t v195 = v158[3];
            float64x2_t v196 = vmlaq_f64(vmlaq_f64(v191, *v158, *v11), *v159, v11[8]);
            float64x2_t v197 = vmlaq_f64(vmlaq_f64(v191, v193, v11[1]), v159[1], v11[9]);
            float64x2_t v198 = vmlaq_f64(vmlaq_f64(v191, v194, v11[2]), v159[2], v11[10]);
            float64x2_t v199 = vmlaq_f64(vmlaq_f64(v191, v195, v11[3]), v159[3], v11[11]);
            v159[2] = v194;
            v159[3] = v195;
            *float64x2_t v159 = v192;
            v159[1] = v193;
            v158[2] = v198;
            v158[3] = v199;
            *float64x2_t v158 = v196;
            v158[1] = v197;
            float64x2_t v201 = v158[4];
            float64x2_t v200 = v158[5];
            float64x2_t v203 = v158[6];
            float64x2_t v202 = v158[7];
            float64x2_t v204 = vmlaq_f64(v191, v201, v11[4]);
            float64x2_t v205 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v202, v11[7]), v159[7], v11[15]);
            float64x2_t v206 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v203, v11[6]), v159[6], v11[14]);
            float64x2_t v207 = vmlaq_f64(vmlaq_f64(v191, v200, v11[5]), v159[5], v11[13]);
            float64x2_t v208 = vmlaq_f64(v204, v159[4], v11[12]);
            v159[4] = v201;
            v159[5] = v200;
            v159[6] = v203;
            v159[7] = v202;
            v158[6] = v206;
            v158[7] = v205;
            v158[4] = v208;
            v158[5] = v207;
          }
          v155 += v156;
          ++v154;
        }
        while (v154 != v133);
      }
      goto LABEL_67;
    }
  }
  *((_DWORD *)this + 18) = v7;
  *((_DWORD *)this + 22) = v9;
  return v20;
}

uint64_t RamstadSRC::processMultiFracD(RamstadSRC *this, const float *const *a2, float *const *a3, int a4, int a5, int a6, int a7)
{
  int v8 = *((_DWORD *)this + 17);
  unsigned int v7 = *((_DWORD *)this + 18);
  int v9 = *((_DWORD *)this + 22);
  uint64_t v10 = *((void *)this + 2);
  int v11 = *(float64x2_t **)(v10 + 16);
  uint64_t v12 = *(void *)(v10 + 40);
  uint64_t v13 = (float64x2_t *)*((void *)this + 20);
  uint64_t v14 = (float64x2_t *)*((void *)this + 23);
  int v15 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a5 < 1)
    {
      LODWORD(v18) = 0;
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v16 = 0;
      LODWORD(v17) = 0;
      LODWORD(v18) = 0;
      for (int i = 0; i != a5; ++i)
      {
        if (v9 >= 1)
        {
          int v20 = 0;
          uint64_t v18 = (int)v18;
          do
          {
            uint64_t v21 = *((unsigned int *)this + 12);
            if (v21)
            {
              uint64_t v22 = a2;
              float32x4_t v23 = v13;
              float32x4_t v24 = v14;
              do
              {
                uint64_t v25 = (uint64_t)*v22++;
                float64x2_t v26 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(v25 + 4 * v18)), 0);
                float64x2_t v28 = *v23;
                float64x2_t v27 = v23[1];
                float64x2_t v30 = v23[2];
                float64x2_t v29 = v23[3];
                float64x2_t v31 = vmlaq_f64(v26, v30, v11[2]);
                float64x2_t v32 = vmlaq_f64(v26, v29, v11[3]);
                float64x2_t v33 = vmlaq_f64(v26, *v23, *v11);
                float64x2_t v34 = vmlaq_f64(vmlaq_f64(v26, v27, v11[1]), v24[1], v11[5]);
                float64x2_t v35 = vmlaq_f64(v33, *v24, v11[4]);
                float64x2_t v36 = vmlaq_f64(v32, v24[3], v11[7]);
                float64x2_t v37 = vmlaq_f64(v31, v24[2], v11[6]);
                v24[2] = v30;
                v24[3] = v29;
                float64x2_t *v24 = v28;
                v24[1] = v27;
                v24 += 4;
                v23[2] = v37;
                v23[3] = v36;
                float64x2_t *v23 = v35;
                v23[1] = v34;
                v23 += 4;
                --v21;
              }
              while (v21);
            }
            v18 += a6;
            ++v20;
          }
          while (v20 != v9);
        }
        uint64_t v38 = *((unsigned int *)this + 12);
        if (v38)
        {
          float v39 = *((double *)this + 12) * (double)(v7 & 0x7FFFFF);
          uint64_t v40 = (v7 >> 22) & 0x1FE;
          float32x4_t v41 = (float64x2_t *)(v12 + (v40 << 6));
          float32x4_t v42 = (float64x2_t *)(v12 + ((unint64_t)(v40 + 2) << 6));
          float32x4_t v43 = (float *)*((void *)this + 26);
          float64x2_t v44 = v13;
          float64x2_t v45 = v14;
          float64x2_t v46 = v43;
          uint64_t v47 = *((unsigned int *)this + 12);
          do
          {
            float64x2_t v48 = v45[2];
            float64x2_t v49 = v45[3];
            float64x2_t v50 = *v45;
            float64x2_t v51 = v45[1];
            v45 += 4;
            float v52 = vaddvq_f64(vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v41[4], v50), *v44, *v41), vmlaq_f64(vmulq_f64(v41[6], v48), v44[2], v41[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v41[5], v51), v44[1], v41[1]), vmlaq_f64(vmulq_f64(v41[7], v49), v44[3], v41[3]))));
            *v46++ = v52;
            v44 += 4;
            --v47;
          }
          while (v47);
          int v53 = (float *)*((void *)this + 29);
          uint64_t v54 = v13;
          int v55 = v14;
          int v56 = v53;
          uint64_t v57 = v38;
          do
          {
            float64x2_t v58 = v55[2];
            float64x2_t v59 = v55[3];
            float64x2_t v60 = *v55;
            float64x2_t v61 = v55[1];
            v55 += 4;
            float v62 = vaddvq_f64(vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v42[4], v60), *v54, *v42), vmlaq_f64(vmulq_f64(v42[6], v58), v54[2], v42[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v42[5], v61), v54[1], v42[1]), vmlaq_f64(vmulq_f64(v42[7], v59), v54[3], v42[3]))));
            *v56++ = v62;
            v54 += 4;
            --v57;
          }
          while (v57);
          float64x2_t v63 = a3;
          do
          {
            float v64 = *v43++;
            float v65 = v64;
            float v66 = *v53++;
            float v67 = v65 + (float)(v39 * (float)(v66 - v65));
            uint64_t v68 = (uint64_t)*v63++;
            *(float *)(v68 + 4 * v16) = v67;
            --v38;
          }
          while (v38);
        }
        uint64_t v17 = (v17 + v9);
        unsigned int v69 = v7 + v8;
        unsigned int v7 = (v7 + v8) & 0x7FFFFFFF;
        int v9 = v15 + (v69 >> 31);
        v16 += a7;
      }
    }
    int v180 = a4 - v17;
    if (a4 > (int)v17)
    {
      if (v9 < v180) {
        int v180 = v9;
      }
      if (v180 >= 1)
      {
        int v181 = 0;
        uint64_t v182 = (int)v18;
        uint64_t v183 = a6;
        do
        {
          uint64_t v184 = *((unsigned int *)this + 12);
          if (v184)
          {
            float64x2_t v185 = a2;
            float64x2_t v186 = v13;
            float64x2_t v187 = v14;
            do
            {
              uint64_t v188 = (uint64_t)*v185++;
              float64x2_t v189 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(v188 + 4 * v182)), 0);
              float64x2_t v191 = *v186;
              float64x2_t v190 = v186[1];
              float64x2_t v193 = v186[2];
              float64x2_t v192 = v186[3];
              float64x2_t v194 = vmlaq_f64(v189, v193, v11[2]);
              float64x2_t v195 = vmlaq_f64(v189, v192, v11[3]);
              float64x2_t v196 = vmlaq_f64(v189, *v186, *v11);
              float64x2_t v197 = vmlaq_f64(vmlaq_f64(v189, v190, v11[1]), v187[1], v11[5]);
              float64x2_t v198 = vmlaq_f64(v196, *v187, v11[4]);
              float64x2_t v199 = vmlaq_f64(v195, v187[3], v11[7]);
              float64x2_t v200 = vmlaq_f64(v194, v187[2], v11[6]);
              v187[2] = v193;
              v187[3] = v192;
              *float64x2_t v187 = v191;
              v187[1] = v190;
              v187 += 4;
              v186[2] = v200;
              v186[3] = v199;
              *float64x2_t v186 = v198;
              v186[1] = v197;
              v186 += 4;
              --v184;
            }
            while (v184);
          }
          v182 += v183;
          ++v181;
        }
        while (v181 != v180);
      }
LABEL_67:
      v9 -= v180;
      uint64_t v17 = (v180 + v17);
      goto LABEL_68;
    }
    goto LABEL_68;
  }
  if (a5 >= 1)
  {
    uint64_t v70 = 0;
    LODWORD(v17) = 0;
    int v71 = 0;
    LODWORD(v72) = 0;
    while (1)
    {
      if (v9 >= 1)
      {
        int v73 = 0;
        uint64_t v72 = (int)v72;
        do
        {
          int v74 = *((_DWORD *)this + 12);
          float64x2_t v75 = v13;
          float64x2_t v76 = v14;
          unint64_t v77 = v74 - (v74 != 0);
          if (v77)
          {
            unint64_t v78 = 0;
            float64x2_t v76 = v14;
            float64x2_t v75 = v13;
            do
            {
              float64x2_t v79 = &a2[v78];
              float64x2_t v80 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((*v79)[v72]), 0);
              float64x2_t v81 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(*((void *)v79 + 1) + 4 * v72)), 0);
              float64x2_t v82 = *v75;
              float64x2_t v83 = v75[1];
              float64x2_t v84 = v75[2];
              float64x2_t v85 = v75[3];
              float64x2_t v86 = vmlaq_f64(vmlaq_f64(v80, *v75, *v11), *v76, v11[8]);
              float64x2_t v87 = vmlaq_f64(vmlaq_f64(v80, v83, v11[1]), v76[1], v11[9]);
              float64x2_t v88 = vmlaq_f64(vmlaq_f64(v80, v84, v11[2]), v76[2], v11[10]);
              float64x2_t v89 = vmlaq_f64(vmlaq_f64(v80, v85, v11[3]), v76[3], v11[11]);
              v76[2] = v84;
              v76[3] = v85;
              *float64x2_t v76 = v82;
              v76[1] = v83;
              v75[2] = v88;
              v75[3] = v89;
              *float64x2_t v75 = v86;
              v75[1] = v87;
              float64x2_t v90 = v75[4];
              float64x2_t v91 = v75[5];
              float64x2_t v92 = v75[6];
              float64x2_t v93 = v75[7];
              float64x2_t v94 = vmlaq_f64(vmlaq_f64(v81, v90, *v11), v76[4], v11[8]);
              float64x2_t v95 = vmlaq_f64(vmlaq_f64(v81, v91, v11[1]), v76[5], v11[9]);
              float64x2_t v96 = vmlaq_f64(vmlaq_f64(v81, v92, v11[2]), v76[6], v11[10]);
              float64x2_t v97 = vmlaq_f64(vmlaq_f64(v81, v93, v11[3]), v76[7], v11[11]);
              v76[4] = v90;
              v76[5] = v91;
              v76[6] = v92;
              v76[7] = v93;
              v75[6] = v96;
              v75[7] = v97;
              v75[4] = v94;
              v75[5] = v95;
              float64x2_t v99 = v75[8];
              float64x2_t v98 = v75[9];
              float64x2_t v101 = v75[10];
              float64x2_t v100 = v75[11];
              float64x2_t v102 = vmlaq_f64(v81, v101, v11[6]);
              float64x2_t v103 = vmlaq_f64(v80, v99, v11[4]);
              float64x2_t v104 = vmlaq_f64(vmlaq_f64(v80, v98, v11[5]), v76[9], v11[13]);
              float64x2_t v105 = vmlaq_f64(v103, v76[8], v11[12]);
              float64x2_t v106 = vmlaq_f64(vmlaq_f64(v81, v100, v11[7]), v76[11], v11[15]);
              float64x2_t v107 = vmlaq_f64(v102, v76[10], v11[14]);
              v76[8] = v99;
              v76[9] = v98;
              v76[10] = v101;
              v76[11] = v100;
              v75[10] = v107;
              v75[11] = v106;
              v75[8] = v105;
              v75[9] = v104;
              v75 += 12;
              v76 += 12;
              v78 += 2;
            }
            while (v78 < v77);
          }
          if (v74)
          {
            float64x2_t v108 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v74 - 1][v72]), 0);
            float64x2_t v109 = *v75;
            float64x2_t v110 = v75[1];
            float64x2_t v111 = v75[2];
            float64x2_t v112 = v75[3];
            float64x2_t v113 = vmlaq_f64(vmlaq_f64(v108, *v75, *v11), *v76, v11[8]);
            float64x2_t v114 = vmlaq_f64(vmlaq_f64(v108, v110, v11[1]), v76[1], v11[9]);
            float64x2_t v115 = vmlaq_f64(vmlaq_f64(v108, v111, v11[2]), v76[2], v11[10]);
            float64x2_t v116 = vmlaq_f64(vmlaq_f64(v108, v112, v11[3]), v76[3], v11[11]);
            v76[2] = v111;
            v76[3] = v112;
            *float64x2_t v76 = v109;
            v76[1] = v110;
            v75[2] = v115;
            v75[3] = v116;
            *float64x2_t v75 = v113;
            v75[1] = v114;
            float64x2_t v118 = v75[4];
            float64x2_t v117 = v75[5];
            float64x2_t v120 = v75[6];
            float64x2_t v119 = v75[7];
            float64x2_t v121 = vmlaq_f64(v108, v118, v11[4]);
            float64x2_t v122 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v119, v11[7]), v76[7], v11[15]);
            float64x2_t v123 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v120, v11[6]), v76[6], v11[14]);
            float64x2_t v124 = vmlaq_f64(vmlaq_f64(v108, v117, v11[5]), v76[5], v11[13]);
            float64x2_t v125 = vmlaq_f64(v121, v76[4], v11[12]);
            v76[4] = v118;
            v76[5] = v117;
            v76[6] = v120;
            v76[7] = v119;
            v75[6] = v123;
            v75[7] = v122;
            v75[4] = v125;
            v75[5] = v124;
          }
          v72 += a6;
          ++v73;
        }
        while (v73 != v9);
      }
      double v126 = *((double *)this + 12);
      uint64_t v127 = (v7 >> 21) & 0x3FC;
      int64x2_t v128 = (float64x2_t *)(v12 + (v127 << 6));
      uint64_t v129 = *((unsigned int *)this + 12);
      int64x2_t v130 = (float *)*((void *)this + 26);
      int v131 = v13;
      int v132 = v14;
      unint64_t v133 = v129 - (*((_DWORD *)this + 12) != 0);
      if (v133)
      {
        unint64_t v134 = 0;
        uint64_t v135 = (float32x2_t *)*((void *)this + 26);
        int v132 = v14;
        int v131 = v13;
        do
        {
          float64x2_t v136 = v128[1];
          float64x2_t v138 = v128[2];
          float64x2_t v137 = v128[3];
          float64x2_t v139 = v128[10];
          float64x2_t v140 = v128[11];
          float64x2_t v141 = v128[8];
          float64x2_t v142 = v128[9];
          float64x2_t v143 = vmlaq_f64(vmulq_f64(v142, v132[1]), v131[1], v136);
          float64x2_t v144 = vmlaq_f64(vmulq_f64(v142, v132[5]), v131[5], v136);
          int64x2_t v145 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v128[12], v132[8]), v131[8], v128[4]), vmlaq_f64(vmulq_f64(v128[13], v132[9]), v131[9], v128[5]));
          int64x2_t v146 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v141, *v132), *v131, *v128), vmlaq_f64(vmulq_f64(v139, v132[2]), v131[2], v138)), vaddq_f64(v143, vmlaq_f64(vmulq_f64(v140, v132[3]), v131[3], v137)));
          int64x2_t v147 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v141, v132[4]), v131[4], *v128), vmlaq_f64(vmulq_f64(v139, v132[6]), v131[6], v138)), vaddq_f64(v144, vmlaq_f64(vmulq_f64(v140, v132[7]), v131[7], v137)));
          int64x2_t v148 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v128[14], v132[10]), v131[10], v128[6]), vmlaq_f64(vmulq_f64(v128[15], v132[11]), v131[11], v128[7]));
          *v135++ = vcvt_f32_f64(vaddq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v146, v147), (float64x2_t)vzip2q_s64(v146, v147)), vaddq_f64((float64x2_t)vzip1q_s64(v145, v148), (float64x2_t)vzip2q_s64(v145, v148))));
          v131 += 12;
          v132 += 12;
          v134 += 2;
        }
        while (v134 < v133);
      }
      if (v129)
      {
        int64x2_t v149 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v128[8], *v132), *v131, *v128), vmlaq_f64(vmulq_f64(v128[10], v132[2]), v131[2], v128[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v128[9], v132[1]), v131[1], v128[1]), vmlaq_f64(vmulq_f64(v128[11], v132[3]), v131[3], v128[3])));
        int64x2_t v150 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v128[12], v132[4]), v131[4], v128[4]), vmlaq_f64(vmulq_f64(v128[14], v132[6]), v131[6], v128[6])), vaddq_f64(vmlaq_f64(vmulq_f64(v128[13], v132[5]), v131[5], v128[5]), vmlaq_f64(vmulq_f64(v128[15], v132[7]), v131[7], v128[7])));
        *(float *)v149.i32 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v149, v150), (float64x2_t)vzip2q_s64(v149, v150)));
        v130[(v129 - 1)] = *(float *)v149.i32;
      }
      float64x2_t v151 = (float64x2_t *)(v12 + ((unint64_t)(v127 + 4) << 6));
      float64x2_t v152 = (float *)*((void *)this + 29);
      float64x2_t v153 = v13;
      int v154 = v14;
      if (v133)
      {
        unint64_t v155 = 0;
        uint64_t v156 = (float32x2_t *)*((void *)this + 29);
        int v154 = v14;
        float64x2_t v153 = v13;
        do
        {
          float64x2_t v157 = v151[1];
          float64x2_t v159 = v151[2];
          float64x2_t v158 = v151[3];
          float64x2_t v160 = v151[10];
          float64x2_t v161 = v151[11];
          float64x2_t v162 = v151[8];
          float64x2_t v163 = v151[9];
          float64x2_t v164 = vmlaq_f64(vmulq_f64(v163, v154[1]), v153[1], v157);
          float64x2_t v165 = vmlaq_f64(vmulq_f64(v163, v154[5]), v153[5], v157);
          int64x2_t v166 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v151[12], v154[8]), v153[8], v151[4]), vmlaq_f64(vmulq_f64(v151[13], v154[9]), v153[9], v151[5]));
          int64x2_t v167 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v162, *v154), *v153, *v151), vmlaq_f64(vmulq_f64(v160, v154[2]), v153[2], v159)), vaddq_f64(v164, vmlaq_f64(vmulq_f64(v161, v154[3]), v153[3], v158)));
          int64x2_t v168 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v162, v154[4]), v153[4], *v151), vmlaq_f64(vmulq_f64(v160, v154[6]), v153[6], v159)), vaddq_f64(v165, vmlaq_f64(vmulq_f64(v161, v154[7]), v153[7], v158)));
          int64x2_t v169 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v151[14], v154[10]), v153[10], v151[6]), vmlaq_f64(vmulq_f64(v151[15], v154[11]), v153[11], v151[7]));
          *v156++ = vcvt_f32_f64(vaddq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v167, v168), (float64x2_t)vzip2q_s64(v167, v168)), vaddq_f64((float64x2_t)vzip1q_s64(v166, v169), (float64x2_t)vzip2q_s64(v166, v169))));
          v153 += 12;
          v154 += 12;
          v155 += 2;
        }
        while (v155 < v133);
      }
      float v170 = v126 * (double)(v7 & 0x7FFFFF);
      if (v129) {
        break;
      }
      float64x2_t v171 = a3;
      if (v129) {
        goto LABEL_41;
      }
LABEL_42:
      uint64_t v17 = (v17 + v9);
      unsigned int v179 = v7 + v8;
      unsigned int v7 = (v7 + v8) & 0x7FFFFFFF;
      int v9 = v15 + (v179 >> 31);
      ++v71;
      v70 += a7;
      if (v71 == a5) {
        goto LABEL_56;
      }
    }
    int64x2_t v172 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v151[8], *v154), *v153, *v151), vmlaq_f64(vmulq_f64(v151[10], v154[2]), v153[2], v151[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v151[9], v154[1]), v153[1], v151[1]), vmlaq_f64(vmulq_f64(v151[11], v154[3]), v153[3], v151[3])));
    int64x2_t v173 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v151[12], v154[4]), v153[4], v151[4]), vmlaq_f64(vmulq_f64(v151[14], v154[6]), v153[6], v151[6])), vaddq_f64(vmlaq_f64(vmulq_f64(v151[13], v154[5]), v153[5], v151[5]), vmlaq_f64(vmulq_f64(v151[15], v154[7]), v153[7], v151[7])));
    *(float *)v172.i32 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v172, v173), (float64x2_t)vzip2q_s64(v172, v173)));
    v152[(v129 - 1)] = *(float *)v172.i32;
    float64x2_t v171 = a3;
    do
    {
LABEL_41:
      float v174 = *v130++;
      float v175 = v174;
      float v176 = *v152++;
      float v177 = v175 + (float)(v170 * (float)(v176 - v175));
      uint64_t v178 = (uint64_t)*v171++;
      *(float *)(v178 + 4 * v7CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = v177;
      --v129;
    }
    while (v129);
    goto LABEL_42;
  }
  LODWORD(v72) = 0;
  uint64_t v17 = 0;
LABEL_56:
  int v180 = a4 - v17;
  if (a4 > (int)v17)
  {
    if (v9 < v180) {
      int v180 = v9;
    }
    if (v180 >= 1)
    {
      int v201 = 0;
      uint64_t v202 = (int)v72;
      uint64_t v203 = a6;
      do
      {
        int v204 = *((_DWORD *)this + 12);
        float64x2_t v205 = v13;
        float64x2_t v206 = v14;
        unint64_t v207 = v204 - (v204 != 0);
        if (v207)
        {
          unint64_t v208 = 0;
          float64x2_t v206 = v14;
          float64x2_t v205 = v13;
          do
          {
            float64x2_t v209 = &a2[v208];
            float64x2_t v210 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((*v209)[v202]), 0);
            float64x2_t v211 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(*((void *)v209 + 1) + 4 * v202)), 0);
            float64x2_t v212 = *v205;
            float64x2_t v213 = v205[1];
            float64x2_t v214 = v205[2];
            float64x2_t v215 = v205[3];
            float64x2_t v216 = vmlaq_f64(vmlaq_f64(v210, *v205, *v11), *v206, v11[8]);
            float64x2_t v217 = vmlaq_f64(vmlaq_f64(v210, v213, v11[1]), v206[1], v11[9]);
            float64x2_t v218 = vmlaq_f64(vmlaq_f64(v210, v214, v11[2]), v206[2], v11[10]);
            float64x2_t v219 = vmlaq_f64(vmlaq_f64(v210, v215, v11[3]), v206[3], v11[11]);
            v206[2] = v214;
            v206[3] = v215;
            *float64x2_t v206 = v212;
            v206[1] = v213;
            v205[2] = v218;
            v205[3] = v219;
            *float64x2_t v205 = v216;
            v205[1] = v217;
            float64x2_t v220 = v205[4];
            float64x2_t v221 = v205[5];
            float64x2_t v222 = v205[6];
            float64x2_t v223 = v205[7];
            float64x2_t v224 = vmlaq_f64(vmlaq_f64(v211, v220, *v11), v206[4], v11[8]);
            float64x2_t v225 = vmlaq_f64(vmlaq_f64(v211, v221, v11[1]), v206[5], v11[9]);
            float64x2_t v226 = vmlaq_f64(vmlaq_f64(v211, v222, v11[2]), v206[6], v11[10]);
            float64x2_t v227 = vmlaq_f64(vmlaq_f64(v211, v223, v11[3]), v206[7], v11[11]);
            v206[4] = v220;
            v206[5] = v221;
            v206[6] = v222;
            v206[7] = v223;
            v205[6] = v226;
            v205[7] = v227;
            v205[4] = v224;
            v205[5] = v225;
            float64x2_t v229 = v205[8];
            float64x2_t v228 = v205[9];
            float64x2_t v231 = v205[10];
            float64x2_t v230 = v205[11];
            float64x2_t v232 = vmlaq_f64(v211, v231, v11[6]);
            float64x2_t v233 = vmlaq_f64(v210, v229, v11[4]);
            float64x2_t v234 = vmlaq_f64(vmlaq_f64(v210, v228, v11[5]), v206[9], v11[13]);
            float64x2_t v235 = vmlaq_f64(v233, v206[8], v11[12]);
            float64x2_t v236 = vmlaq_f64(vmlaq_f64(v211, v230, v11[7]), v206[11], v11[15]);
            float64x2_t v237 = vmlaq_f64(v232, v206[10], v11[14]);
            v206[8] = v229;
            v206[9] = v228;
            v206[10] = v231;
            v206[11] = v230;
            v205[10] = v237;
            v205[11] = v236;
            v205[8] = v235;
            v205[9] = v234;
            v205 += 12;
            v206 += 12;
            v208 += 2;
          }
          while (v208 < v207);
        }
        if (v204)
        {
          float64x2_t v238 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v204 - 1][v202]), 0);
          float64x2_t v239 = *v205;
          float64x2_t v240 = v205[1];
          float64x2_t v241 = v205[2];
          float64x2_t v242 = v205[3];
          float64x2_t v243 = vmlaq_f64(vmlaq_f64(v238, *v205, *v11), *v206, v11[8]);
          float64x2_t v244 = vmlaq_f64(vmlaq_f64(v238, v240, v11[1]), v206[1], v11[9]);
          float64x2_t v245 = vmlaq_f64(vmlaq_f64(v238, v241, v11[2]), v206[2], v11[10]);
          float64x2_t v246 = vmlaq_f64(vmlaq_f64(v238, v242, v11[3]), v206[3], v11[11]);
          v206[2] = v241;
          v206[3] = v242;
          *float64x2_t v206 = v239;
          v206[1] = v240;
          v205[2] = v245;
          v205[3] = v246;
          *float64x2_t v205 = v243;
          v205[1] = v244;
          float64x2_t v248 = v205[4];
          float64x2_t v247 = v205[5];
          float64x2_t v250 = v205[6];
          float64x2_t v249 = v205[7];
          float64x2_t v251 = vmlaq_f64(v238, v248, v11[4]);
          float64x2_t v252 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v249, v11[7]), v206[7], v11[15]);
          float64x2_t v253 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v250, v11[6]), v206[6], v11[14]);
          float64x2_t v254 = vmlaq_f64(vmlaq_f64(v238, v247, v11[5]), v206[5], v11[13]);
          float64x2_t v255 = vmlaq_f64(v251, v206[4], v11[12]);
          v206[4] = v248;
          v206[5] = v247;
          v206[6] = v250;
          v206[7] = v249;
          v205[6] = v253;
          v205[7] = v252;
          v205[4] = v255;
          v205[5] = v254;
        }
        v202 += v203;
        ++v201;
      }
      while (v201 != v180);
    }
    goto LABEL_67;
  }
LABEL_68:
  *((_DWORD *)this + 18) = v7;
  *((_DWORD *)this + 22) = v9;
  return v17;
}

uint64_t RamstadSRC::processMultiInt(RamstadSRC *this, const float *const *a2, float *const *a3, int a4, int a5, int a6, int a7)
{
  int v8 = *((_DWORD *)this + 17);
  int v7 = *((_DWORD *)this + 18);
  int v9 = *((_DWORD *)this + 22);
  uint64_t v10 = *(float32x4_t **)(*(void *)this + 16);
  uint64_t v11 = *(void *)(*(void *)this + 40);
  uint64_t v12 = (float32x4_t *)*((void *)this + 14);
  uint64_t v13 = (float32x4_t *)*((void *)this + 17);
  int v14 = *((_DWORD *)this + 13);
  int v15 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a5 < 1)
    {
      uint64_t v19 = 0;
      LODWORD(v18) = 0;
    }
    else
    {
      uint64_t v16 = 0;
      int v17 = 0;
      LODWORD(v18) = 0;
      LODWORD(v19) = 0;
      do
      {
        if (v9 >= 1)
        {
          int v20 = 0;
          uint64_t v18 = (int)v18;
          do
          {
            uint64_t v21 = *((unsigned int *)this + 12);
            if (v21)
            {
              uint64_t v22 = a2;
              float32x4_t v23 = v12;
              float32x4_t v24 = v13;
              do
              {
                uint64_t v25 = (uint64_t)*v22++;
                float64x2_t v26 = (const float *)(v25 + 4 * v18);
                float32x4_t v27 = vld1q_dup_f32(v26);
                float32x4_t v28 = v23[1];
                float32x4_t v29 = vmlaq_f32(v27, v28, v10[1]);
                float32x4_t v30 = vmlaq_f32(vmlaq_f32(v27, *v23, *v10), *v24, v10[2]);
                float32x4_t v31 = vmlaq_f32(v29, v24[1], v10[3]);
                float32x4_t *v24 = *v23;
                v24[1] = v28;
                v24 += 2;
                float32x4_t *v23 = v30;
                v23[1] = v31;
                v23 += 2;
                --v21;
              }
              while (v21);
            }
            v18 += a6;
            ++v20;
          }
          while (v20 != v9);
        }
        uint64_t v32 = *((unsigned int *)this + 12);
        if (v32)
        {
          float64x2_t v33 = v12;
          float64x2_t v34 = v13;
          float64x2_t v35 = a3;
          do
          {
            float32x4_t v36 = *v33;
            float32x4_t v37 = v33[1];
            v33 += 2;
            float32x4_t v39 = *v34;
            float32x4_t v38 = v34[1];
            v34 += 2;
            int8x16_t v40 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(*(float32x4_t *)(v11 + 64 * v7 + 32), v39), v36, *(float32x4_t *)(v11 + 64 * v7)), vmlaq_f32(vmulq_f32(*(float32x4_t *)(v11 + 64 * v7 + 48), v38), v37, *(float32x4_t *)(v11 + 64 * v7 + 16)));
            uint64_t v41 = (uint64_t)*v35++;
            *(float *)(v41 + 4 * v16) = vaddv_f32(vadd_f32(*(float32x2_t *)v40.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v40, v40, 8uLL)));
            --v32;
          }
          while (v32);
        }
        uint64_t v19 = (v19 + v9);
        int v42 = v7 + v8;
        if (v42 < v14) {
          int v9 = v15;
        }
        else {
          int v9 = v15 + 1;
        }
        if (v42 < v14) {
          int v43 = 0;
        }
        else {
          int v43 = v14;
        }
        int v7 = v42 - v43;
        ++v17;
        v16 += a7;
      }
      while (v17 != a5);
    }
    int v101 = a4 - v19;
    if (a4 > (int)v19)
    {
      if (v9 < v101) {
        int v101 = v9;
      }
      if (v101 >= 1)
      {
        int v102 = 0;
        uint64_t v103 = (int)v18;
        uint64_t v104 = a6;
        do
        {
          uint64_t v105 = *((unsigned int *)this + 12);
          if (v105)
          {
            float64x2_t v106 = a2;
            float64x2_t v107 = v12;
            float64x2_t v108 = v13;
            do
            {
              uint64_t v109 = (uint64_t)*v106++;
              float64x2_t v110 = (const float *)(v109 + 4 * v103);
              float32x4_t v111 = vld1q_dup_f32(v110);
              float32x4_t v112 = v107[1];
              float32x4_t v113 = vmlaq_f32(v111, v112, v10[1]);
              float32x4_t v114 = vmlaq_f32(vmlaq_f32(v111, *v107, *v10), *v108, v10[2]);
              float32x4_t v115 = vmlaq_f32(v113, v108[1], v10[3]);
              *float64x2_t v108 = *v107;
              v108[1] = v112;
              v108 += 2;
              *float64x2_t v107 = v114;
              v107[1] = v115;
              v107 += 2;
              --v105;
            }
            while (v105);
          }
          v103 += v104;
          ++v102;
        }
        while (v102 != v101);
      }
LABEL_67:
      v9 -= v101;
      uint64_t v19 = (v101 + v19);
    }
  }
  else
  {
    if (a5 < 1)
    {
      uint64_t v19 = 0;
      LODWORD(v46) = 0;
    }
    else
    {
      uint64_t v44 = 0;
      int v45 = 0;
      LODWORD(v46) = 0;
      LODWORD(v19) = 0;
      do
      {
        if (v9 >= 1)
        {
          int v47 = 0;
          uint64_t v46 = (int)v46;
          do
          {
            int v48 = *((_DWORD *)this + 12);
            float64x2_t v49 = v12;
            float64x2_t v50 = v13;
            unint64_t v51 = v48 - (v48 != 0);
            if (v51)
            {
              unint64_t v52 = 0;
              float64x2_t v50 = v13;
              float64x2_t v49 = v12;
              do
              {
                int v53 = &a2[v52];
                uint64_t v54 = &(*v53)[v46];
                int v55 = (const float *)(*((void *)v53 + 1) + 4 * v46);
                float32x4_t v56 = vld1q_dup_f32(v54);
                float32x4_t v57 = vld1q_dup_f32(v55);
                float32x4_t v58 = v49[1];
                float32x4_t v59 = vmlaq_f32(vmlaq_f32(v56, *v49, *v10), *v50, v10[4]);
                float32x4_t v60 = vmlaq_f32(vmlaq_f32(v56, v58, v10[1]), v50[1], v10[5]);
                *float64x2_t v50 = *v49;
                v50[1] = v58;
                *float64x2_t v49 = v59;
                v49[1] = v60;
                float32x4_t v61 = v49[2];
                float32x4_t v62 = v49[3];
                float32x4_t v63 = vmlaq_f32(vmlaq_f32(v57, v61, *v10), v50[2], v10[4]);
                float32x4_t v64 = vmlaq_f32(vmlaq_f32(v57, v62, v10[1]), v50[3], v10[5]);
                v50[2] = v61;
                v50[3] = v62;
                v49[2] = v63;
                v49[3] = v64;
                float32x4_t v65 = v49[4];
                float32x4_t v66 = v49[5];
                float32x4_t v67 = vmlaq_f32(vmlaq_f32(v56, v65, v10[2]), v50[4], v10[6]);
                float32x4_t v68 = vmlaq_f32(vmlaq_f32(v57, v66, v10[3]), v50[5], v10[7]);
                v50[4] = v65;
                v50[5] = v66;
                v49[4] = v67;
                v49[5] = v68;
                v49 += 6;
                v50 += 6;
                v52 += 2;
              }
              while (v52 < v51);
            }
            if (v48)
            {
              unsigned int v69 = &a2[v48 - 1][v46];
              float32x4_t v70 = vld1q_dup_f32(v69);
              float32x4_t v71 = v49[1];
              float32x4_t v72 = vmlaq_f32(vmlaq_f32(v70, *v49, *v10), *v50, v10[4]);
              float32x4_t v73 = vmlaq_f32(vmlaq_f32(v70, v71, v10[1]), v50[1], v10[5]);
              *float64x2_t v50 = *v49;
              v50[1] = v71;
              *float64x2_t v49 = v72;
              v49[1] = v73;
              float32x4_t v74 = v49[2];
              float32x4_t v75 = v49[3];
              float32x4_t v76 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v75, v10[3]), v50[3], v10[7]);
              float32x4_t v77 = vmlaq_f32(vmlaq_f32(v70, v74, v10[2]), v50[2], v10[6]);
              v50[2] = v74;
              v50[3] = v75;
              v49[2] = v77;
              v49[3] = v76;
            }
            v46 += a6;
            ++v47;
          }
          while (v47 != v9);
        }
        unint64_t v78 = (float32x4_t *)(v11 + 128 * v7);
        int v79 = *((_DWORD *)this + 12);
        float64x2_t v80 = v12;
        float64x2_t v81 = v13;
        unint64_t v82 = v79 - (v79 != 0);
        if (v82)
        {
          unint64_t v83 = 0;
          float64x2_t v81 = v13;
          float64x2_t v80 = v12;
          do
          {
            float64x2_t v84 = &a3[v83];
            float32x4_t v85 = v78[1];
            float32x4_t v87 = v78[4];
            float32x4_t v86 = v78[5];
            float32x4_t v88 = vmlaq_f32(vmulq_f32(v86, v81[1]), v80[1], v85);
            float32x4_t v89 = vmlaq_f32(vmulq_f32(v86, v81[3]), v80[3], v85);
            float64x2_t v91 = *v84;
            uint64_t v90 = *((void *)v84 + 1);
            int8x16_t v92 = (int8x16_t)vmlaq_f32(vmulq_f32(v78[7], v81[5]), v80[5], v78[3]);
            int8x16_t v93 = (int8x16_t)vmlaq_f32(vmulq_f32(v78[6], v81[4]), v80[4], v78[2]);
            int8x16_t v94 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v87, *v81), *v80, *v78), v88);
            *(float32x2_t *)v94.i8 = vadd_f32(*(float32x2_t *)v94.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v94, v94, 8uLL));
            int32x2_t v95 = (int32x2_t)vadd_f32(*(float32x2_t *)v93.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v93, v93, 8uLL));
            *(float32x2_t *)v94.i8 = vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v94.i8, v95), (float32x2_t)vzip2_s32(*(int32x2_t *)v94.i8, v95));
            int8x16_t v96 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v87, v81[2]), v80[2], *v78), v89);
            *(float32x2_t *)v96.i8 = vadd_f32(*(float32x2_t *)v96.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v96, v96, 8uLL));
            *(float32x2_t *)v92.i8 = vadd_f32(*(float32x2_t *)v92.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v92, v92, 8uLL));
            v91[v44] = vaddv_f32(*(float32x2_t *)v94.i8);
            *(float *)(v90 + 4 * v44) = vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v96.i8, *(int32x2_t *)v92.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v96.i8, *(int32x2_t *)v92.i8)));
            v80 += 6;
            v81 += 6;
            v83 += 2;
          }
          while (v83 < v82);
        }
        if (v79)
        {
          int8x16_t v97 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v78[4], *v81), *v80, *v78), vmlaq_f32(vmulq_f32(v78[5], v81[1]), v80[1], v78[1]));
          *(float32x2_t *)v97.i8 = vadd_f32(*(float32x2_t *)v97.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v97, v97, 8uLL));
          int8x16_t v98 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v78[6], v81[2]), v80[2], v78[2]), vmlaq_f32(vmulq_f32(v78[7], v81[3]), v80[3], v78[3]));
          *(float32x2_t *)v98.i8 = vadd_f32(*(float32x2_t *)v98.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v98, v98, 8uLL));
          a3[v79 - 1][v44] = vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v97.i8, *(int32x2_t *)v98.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v97.i8, *(int32x2_t *)v98.i8)));
        }
        uint64_t v19 = (v19 + v9);
        int v99 = v7 + v8;
        if (v99 < v14) {
          int v9 = v15;
        }
        else {
          int v9 = v15 + 1;
        }
        if (v99 < v14) {
          int v100 = 0;
        }
        else {
          int v100 = v14;
        }
        int v7 = v99 - v100;
        ++v45;
        v44 += a7;
      }
      while (v45 != a5);
    }
    int v101 = a4 - v19;
    if (a4 > (int)v19)
    {
      if (v9 < v101) {
        int v101 = v9;
      }
      if (v101 >= 1)
      {
        int v116 = 0;
        uint64_t v117 = (int)v46;
        uint64_t v118 = a6;
        do
        {
          int v119 = *((_DWORD *)this + 12);
          float64x2_t v120 = v12;
          float64x2_t v121 = v13;
          unint64_t v122 = v119 - (v119 != 0);
          if (v122)
          {
            unint64_t v123 = 0;
            float64x2_t v121 = v13;
            float64x2_t v120 = v12;
            do
            {
              float64x2_t v124 = &a2[v123];
              float64x2_t v125 = &(*v124)[v117];
              double v126 = (const float *)(*((void *)v124 + 1) + 4 * v117);
              float32x4_t v127 = vld1q_dup_f32(v125);
              float32x4_t v128 = vld1q_dup_f32(v126);
              float32x4_t v129 = v120[1];
              float32x4_t v130 = vmlaq_f32(vmlaq_f32(v127, *v120, *v10), *v121, v10[4]);
              float32x4_t v131 = vmlaq_f32(vmlaq_f32(v127, v129, v10[1]), v121[1], v10[5]);
              *float64x2_t v121 = *v120;
              v121[1] = v129;
              *float64x2_t v120 = v130;
              v120[1] = v131;
              float32x4_t v132 = v120[2];
              float32x4_t v133 = v120[3];
              float32x4_t v134 = vmlaq_f32(vmlaq_f32(v128, v132, *v10), v121[2], v10[4]);
              float32x4_t v135 = vmlaq_f32(vmlaq_f32(v128, v133, v10[1]), v121[3], v10[5]);
              v121[2] = v132;
              v121[3] = v133;
              v120[2] = v134;
              v120[3] = v135;
              float32x4_t v136 = v120[4];
              float32x4_t v137 = v120[5];
              float32x4_t v138 = vmlaq_f32(vmlaq_f32(v127, v136, v10[2]), v121[4], v10[6]);
              float32x4_t v139 = vmlaq_f32(vmlaq_f32(v128, v137, v10[3]), v121[5], v10[7]);
              v121[4] = v136;
              v121[5] = v137;
              v120[4] = v138;
              v120[5] = v139;
              v120 += 6;
              v121 += 6;
              v123 += 2;
            }
            while (v123 < v122);
          }
          if (v119)
          {
            float64x2_t v140 = &a2[v119 - 1][v117];
            float32x4_t v141 = vld1q_dup_f32(v140);
            float32x4_t v142 = v120[1];
            float32x4_t v143 = vmlaq_f32(vmlaq_f32(v141, *v120, *v10), *v121, v10[4]);
            float32x4_t v144 = vmlaq_f32(vmlaq_f32(v141, v142, v10[1]), v121[1], v10[5]);
            *float64x2_t v121 = *v120;
            v121[1] = v142;
            *float64x2_t v120 = v143;
            v120[1] = v144;
            float32x4_t v145 = v120[2];
            float32x4_t v146 = v120[3];
            float32x4_t v147 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v146, v10[3]), v121[3], v10[7]);
            float32x4_t v148 = vmlaq_f32(vmlaq_f32(v141, v145, v10[2]), v121[2], v10[6]);
            v121[2] = v145;
            v121[3] = v146;
            v120[2] = v148;
            v120[3] = v147;
          }
          v117 += v118;
          ++v116;
        }
        while (v116 != v101);
      }
      goto LABEL_67;
    }
  }
  *((_DWORD *)this + 18) = v7;
  *((_DWORD *)this + 22) = v9;
  return v19;
}

uint64_t RamstadSRC::processMultiFrac(RamstadSRC *this, const float *const *a2, float *const *a3, int a4, int a5, int a6, int a7)
{
  int v8 = *((_DWORD *)this + 17);
  unsigned int v7 = *((_DWORD *)this + 18);
  int v9 = *((_DWORD *)this + 22);
  uint64_t v10 = *(float32x4_t **)(*(void *)this + 16);
  uint64_t v11 = *(void *)(*(void *)this + 40);
  uint64_t v12 = (float32x4_t *)*((void *)this + 14);
  uint64_t v13 = (float32x4_t *)*((void *)this + 17);
  int v14 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a5 < 1)
    {
      LODWORD(v17) = 0;
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v15 = 0;
      LODWORD(v16) = 0;
      LODWORD(v17) = 0;
      for (int i = 0; i != a5; ++i)
      {
        if (v9 >= 1)
        {
          int v19 = 0;
          uint64_t v17 = (int)v17;
          do
          {
            uint64_t v20 = *((unsigned int *)this + 12);
            if (v20)
            {
              uint64_t v21 = a2;
              uint64_t v22 = v12;
              float32x4_t v23 = v13;
              do
              {
                uint64_t v24 = (uint64_t)*v21++;
                uint64_t v25 = (const float *)(v24 + 4 * v17);
                float32x4_t v26 = vld1q_dup_f32(v25);
                float32x4_t v27 = v22[1];
                float32x4_t v28 = vmlaq_f32(v26, v27, v10[1]);
                float32x4_t v29 = vmlaq_f32(vmlaq_f32(v26, *v22, *v10), *v23, v10[2]);
                float32x4_t v30 = vmlaq_f32(v28, v23[1], v10[3]);
                float32x4_t *v23 = *v22;
                v23[1] = v27;
                v23 += 2;
                *uint64_t v22 = v29;
                v22[1] = v30;
                v22 += 2;
                --v20;
              }
              while (v20);
            }
            v17 += a6;
            ++v19;
          }
          while (v19 != v9);
        }
        uint64_t v31 = *((unsigned int *)this + 12);
        if (v31)
        {
          float v32 = *((double *)this + 12) * (double)(v7 & 0x7FFFFF);
          uint64_t v33 = (v7 >> 22) & 0x1FE;
          float64x2_t v34 = (float32x4_t *)(v11 + 32 * v33);
          float64x2_t v35 = (float32x4_t *)(v11 + 32 * (v33 + 2));
          float32x4_t v36 = (float *)*((void *)this + 26);
          float32x4_t v37 = v12;
          float32x4_t v38 = v13;
          float32x4_t v39 = v36;
          uint64_t v40 = *((unsigned int *)this + 12);
          do
          {
            float32x4_t v41 = *v37;
            float32x4_t v42 = v37[1];
            v37 += 2;
            float32x4_t v44 = *v38;
            float32x4_t v43 = v38[1];
            v38 += 2;
            int8x16_t v45 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v34[2], v44), v41, *v34), vmlaq_f32(vmulq_f32(v34[3], v43), v42, v34[1]));
            *v39++ = vaddv_f32(vadd_f32(*(float32x2_t *)v45.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v45, v45, 8uLL)));
            --v40;
          }
          while (v40);
          uint64_t v46 = (float *)*((void *)this + 29);
          int v47 = v12;
          int v48 = v13;
          float64x2_t v49 = v46;
          uint64_t v50 = v31;
          do
          {
            float32x4_t v51 = *v47;
            float32x4_t v52 = v47[1];
            v47 += 2;
            float32x4_t v54 = *v48;
            float32x4_t v53 = v48[1];
            v48 += 2;
            int8x16_t v55 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v35[2], v54), v51, *v35), vmlaq_f32(vmulq_f32(v35[3], v53), v52, v35[1]));
            *v49++ = vaddv_f32(vadd_f32(*(float32x2_t *)v55.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v55, v55, 8uLL)));
            --v50;
          }
          while (v50);
          float32x4_t v56 = a3;
          do
          {
            float v57 = *v36++;
            float v58 = v57;
            float v59 = *v46++;
            float v60 = v58 + (float)(v32 * (float)(v59 - v58));
            uint64_t v61 = (uint64_t)*v56++;
            *(float *)(v61 + 4 * v15) = v60;
            --v31;
          }
          while (v31);
        }
        uint64_t v16 = (v16 + v9);
        unsigned int v62 = v7 + v8;
        unsigned int v7 = (v7 + v8) & 0x7FFFFFFF;
        int v9 = v14 + (v62 >> 31);
        v15 += a7;
      }
    }
    int v143 = a4 - v16;
    if (a4 > (int)v16)
    {
      if (v9 < v143) {
        int v143 = v9;
      }
      if (v143 >= 1)
      {
        int v144 = 0;
        uint64_t v145 = (int)v17;
        uint64_t v146 = a6;
        do
        {
          uint64_t v147 = *((unsigned int *)this + 12);
          if (v147)
          {
            float32x4_t v148 = a2;
            int64x2_t v149 = v12;
            int64x2_t v150 = v13;
            do
            {
              uint64_t v151 = (uint64_t)*v148++;
              float64x2_t v152 = (const float *)(v151 + 4 * v145);
              float32x4_t v153 = vld1q_dup_f32(v152);
              float32x4_t v154 = v149[1];
              float32x4_t v155 = vmlaq_f32(v153, v154, v10[1]);
              float32x4_t v156 = vmlaq_f32(vmlaq_f32(v153, *v149, *v10), *v150, v10[2]);
              float32x4_t v157 = vmlaq_f32(v155, v150[1], v10[3]);
              *int64x2_t v150 = *v149;
              v150[1] = v154;
              v150 += 2;
              *int64x2_t v149 = v156;
              v149[1] = v157;
              v149 += 2;
              --v147;
            }
            while (v147);
          }
          v145 += v146;
          ++v144;
        }
        while (v144 != v143);
      }
LABEL_67:
      v9 -= v143;
      uint64_t v16 = (v143 + v16);
      goto LABEL_68;
    }
    goto LABEL_68;
  }
  if (a5 >= 1)
  {
    uint64_t v63 = 0;
    LODWORD(v16) = 0;
    int v64 = 0;
    LODWORD(v65) = 0;
    while (1)
    {
      if (v9 >= 1)
      {
        int v66 = 0;
        uint64_t v65 = (int)v65;
        do
        {
          int v67 = *((_DWORD *)this + 12);
          float32x4_t v68 = v12;
          unsigned int v69 = v13;
          unint64_t v70 = v67 - (v67 != 0);
          if (v70)
          {
            unint64_t v71 = 0;
            unsigned int v69 = v13;
            float32x4_t v68 = v12;
            do
            {
              float32x4_t v72 = &a2[v71];
              float32x4_t v73 = &(*v72)[v65];
              float32x4_t v74 = (const float *)(*((void *)v72 + 1) + 4 * v65);
              float32x4_t v75 = vld1q_dup_f32(v73);
              float32x4_t v76 = vld1q_dup_f32(v74);
              float32x4_t v77 = v68[1];
              float32x4_t v78 = vmlaq_f32(vmlaq_f32(v75, *v68, *v10), *v69, v10[4]);
              float32x4_t v79 = vmlaq_f32(vmlaq_f32(v75, v77, v10[1]), v69[1], v10[5]);
              *unsigned int v69 = *v68;
              v69[1] = v77;
              *float32x4_t v68 = v78;
              v68[1] = v79;
              float32x4_t v80 = v68[2];
              float32x4_t v81 = v68[3];
              float32x4_t v82 = vmlaq_f32(vmlaq_f32(v76, v80, *v10), v69[2], v10[4]);
              float32x4_t v83 = vmlaq_f32(vmlaq_f32(v76, v81, v10[1]), v69[3], v10[5]);
              v69[2] = v80;
              v69[3] = v81;
              v68[2] = v82;
              v68[3] = v83;
              float32x4_t v84 = v68[4];
              float32x4_t v85 = v68[5];
              float32x4_t v86 = vmlaq_f32(vmlaq_f32(v75, v84, v10[2]), v69[4], v10[6]);
              float32x4_t v87 = vmlaq_f32(vmlaq_f32(v76, v85, v10[3]), v69[5], v10[7]);
              v69[4] = v84;
              v69[5] = v85;
              v68[4] = v86;
              v68[5] = v87;
              v68 += 6;
              v69 += 6;
              v71 += 2;
            }
            while (v71 < v70);
          }
          if (v67)
          {
            float32x4_t v88 = &a2[v67 - 1][v65];
            float32x4_t v89 = vld1q_dup_f32(v88);
            float32x4_t v90 = v68[1];
            float32x4_t v91 = vmlaq_f32(vmlaq_f32(v89, *v68, *v10), *v69, v10[4]);
            float32x4_t v92 = vmlaq_f32(vmlaq_f32(v89, v90, v10[1]), v69[1], v10[5]);
            *unsigned int v69 = *v68;
            v69[1] = v90;
            *float32x4_t v68 = v91;
            v68[1] = v92;
            float32x4_t v93 = v68[2];
            float32x4_t v94 = v68[3];
            float32x4_t v95 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v94, v10[3]), v69[3], v10[7]);
            float32x4_t v96 = vmlaq_f32(vmlaq_f32(v89, v93, v10[2]), v69[2], v10[6]);
            v69[2] = v93;
            v69[3] = v94;
            v68[2] = v96;
            v68[3] = v95;
          }
          v65 += a6;
          ++v66;
        }
        while (v66 != v9);
      }
      double v97 = *((double *)this + 12);
      uint64_t v98 = (v7 >> 21) & 0x3FC;
      int v99 = (float32x4_t *)(v11 + 32 * v98);
      uint64_t v100 = *((unsigned int *)this + 12);
      int v101 = (float *)*((void *)this + 26);
      int v102 = v12;
      uint64_t v103 = v13;
      unint64_t v104 = v100 - (*((_DWORD *)this + 12) != 0);
      if (v104)
      {
        unint64_t v105 = 0;
        float64x2_t v106 = (float32x2_t *)*((void *)this + 26);
        uint64_t v103 = v13;
        int v102 = v12;
        do
        {
          float32x4_t v107 = v99[1];
          float32x4_t v109 = v99[4];
          float32x4_t v108 = v99[5];
          float32x4_t v110 = vmlaq_f32(vmulq_f32(v108, v103[1]), v102[1], v107);
          float32x4_t v111 = vmlaq_f32(vmulq_f32(v108, v103[3]), v102[3], v107);
          int8x16_t v112 = (int8x16_t)vmlaq_f32(vmulq_f32(v99[7], v103[5]), v102[5], v99[3]);
          int8x16_t v113 = (int8x16_t)vmlaq_f32(vmulq_f32(v99[6], v103[4]), v102[4], v99[2]);
          int8x16_t v114 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v109, *v103), *v102, *v99), v110);
          *(float32x2_t *)v113.i8 = vadd_f32(*(float32x2_t *)v113.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v113, v113, 8uLL));
          *(float32x2_t *)v114.i8 = vadd_f32(*(float32x2_t *)v114.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v114, v114, 8uLL));
          int8x16_t v115 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v109, v103[2]), v102[2], *v99), v111);
          *(float32x2_t *)v115.i8 = vadd_f32(*(float32x2_t *)v115.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v115, v115, 8uLL));
          *(float32x2_t *)v112.i8 = vadd_f32(*(float32x2_t *)v112.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v112, v112, 8uLL));
          *v106++ = vadd_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v114.i8, *(int32x2_t *)v115.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v114.i8, *(int32x2_t *)v115.i8)), vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v113.i8, *(int32x2_t *)v112.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v113.i8, *(int32x2_t *)v112.i8)));
          v102 += 6;
          v103 += 6;
          v105 += 2;
        }
        while (v105 < v104);
      }
      if (v100)
      {
        int8x16_t v116 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v99[4], *v103), *v102, *v99), vmlaq_f32(vmulq_f32(v99[5], v103[1]), v102[1], v99[1]));
        *(float32x2_t *)v116.i8 = vadd_f32(*(float32x2_t *)v116.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v116, v116, 8uLL));
        int8x16_t v117 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v99[6], v103[2]), v102[2], v99[2]), vmlaq_f32(vmulq_f32(v99[7], v103[3]), v102[3], v99[3]));
        *(float32x2_t *)v117.i8 = vadd_f32(*(float32x2_t *)v117.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v117, v117, 8uLL));
        v101[(v100 - 1)] = vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v116.i8, *(int32x2_t *)v117.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v116.i8, *(int32x2_t *)v117.i8)));
      }
      uint64_t v118 = (float32x4_t *)(v11 + 32 * (v98 + 4));
      int v119 = (float *)*((void *)this + 29);
      float64x2_t v120 = v12;
      float64x2_t v121 = v13;
      if (v104)
      {
        unint64_t v122 = 0;
        unint64_t v123 = (float32x2_t *)*((void *)this + 29);
        float64x2_t v121 = v13;
        float64x2_t v120 = v12;
        do
        {
          float32x4_t v124 = v118[1];
          float32x4_t v126 = v118[4];
          float32x4_t v125 = v118[5];
          float32x4_t v127 = vmlaq_f32(vmulq_f32(v125, v121[1]), v120[1], v124);
          float32x4_t v128 = vmlaq_f32(vmulq_f32(v125, v121[3]), v120[3], v124);
          int8x16_t v129 = (int8x16_t)vmlaq_f32(vmulq_f32(v118[7], v121[5]), v120[5], v118[3]);
          int8x16_t v130 = (int8x16_t)vmlaq_f32(vmulq_f32(v118[6], v121[4]), v120[4], v118[2]);
          int8x16_t v131 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v126, *v121), *v120, *v118), v127);
          *(float32x2_t *)v130.i8 = vadd_f32(*(float32x2_t *)v130.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v130, v130, 8uLL));
          *(float32x2_t *)v131.i8 = vadd_f32(*(float32x2_t *)v131.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v131, v131, 8uLL));
          int8x16_t v132 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v126, v121[2]), v120[2], *v118), v128);
          *(float32x2_t *)v132.i8 = vadd_f32(*(float32x2_t *)v132.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v132, v132, 8uLL));
          *(float32x2_t *)v129.i8 = vadd_f32(*(float32x2_t *)v129.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v129, v129, 8uLL));
          *v123++ = vadd_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v131.i8, *(int32x2_t *)v132.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v131.i8, *(int32x2_t *)v132.i8)), vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v130.i8, *(int32x2_t *)v129.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v130.i8, *(int32x2_t *)v129.i8)));
          v120 += 6;
          v121 += 6;
          v122 += 2;
        }
        while (v122 < v104);
      }
      float v133 = v97 * (double)(v7 & 0x7FFFFF);
      if (v100) {
        break;
      }
      float32x4_t v134 = a3;
      if (v100) {
        goto LABEL_41;
      }
LABEL_42:
      uint64_t v16 = (v16 + v9);
      unsigned int v142 = v7 + v8;
      unsigned int v7 = (v7 + v8) & 0x7FFFFFFF;
      int v9 = v14 + (v142 >> 31);
      ++v64;
      v63 += a7;
      if (v64 == a5) {
        goto LABEL_56;
      }
    }
    int8x16_t v135 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v118[4], *v121), *v120, *v118), vmlaq_f32(vmulq_f32(v118[5], v121[1]), v120[1], v118[1]));
    *(float32x2_t *)v135.i8 = vadd_f32(*(float32x2_t *)v135.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v135, v135, 8uLL));
    int8x16_t v136 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v118[6], v121[2]), v120[2], v118[2]), vmlaq_f32(vmulq_f32(v118[7], v121[3]), v120[3], v118[3]));
    *(float32x2_t *)v136.i8 = vadd_f32(*(float32x2_t *)v136.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v136, v136, 8uLL));
    v119[(v100 - 1)] = vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v135.i8, *(int32x2_t *)v136.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v135.i8, *(int32x2_t *)v136.i8)));
    float32x4_t v134 = a3;
    do
    {
LABEL_41:
      float v137 = *v101++;
      float v138 = v137;
      float v139 = *v119++;
      float v140 = v138 + (float)(v133 * (float)(v139 - v138));
      uint64_t v141 = (uint64_t)*v134++;
      *(float *)(v141 + 4 * v63) = v140;
      --v100;
    }
    while (v100);
    goto LABEL_42;
  }
  LODWORD(v65) = 0;
  uint64_t v16 = 0;
LABEL_56:
  int v143 = a4 - v16;
  if (a4 > (int)v16)
  {
    if (v9 < v143) {
      int v143 = v9;
    }
    if (v143 >= 1)
    {
      int v158 = 0;
      uint64_t v159 = (int)v65;
      uint64_t v160 = a6;
      do
      {
        int v161 = *((_DWORD *)this + 12);
        float64x2_t v162 = v12;
        float64x2_t v163 = v13;
        unint64_t v164 = v161 - (v161 != 0);
        if (v164)
        {
          unint64_t v165 = 0;
          float64x2_t v163 = v13;
          float64x2_t v162 = v12;
          do
          {
            int64x2_t v166 = &a2[v165];
            int64x2_t v167 = &(*v166)[v159];
            int64x2_t v168 = (const float *)(*((void *)v166 + 1) + 4 * v159);
            float32x4_t v169 = vld1q_dup_f32(v167);
            float32x4_t v170 = vld1q_dup_f32(v168);
            float32x4_t v171 = v162[1];
            float32x4_t v172 = vmlaq_f32(vmlaq_f32(v169, *v162, *v10), *v163, v10[4]);
            float32x4_t v173 = vmlaq_f32(vmlaq_f32(v169, v171, v10[1]), v163[1], v10[5]);
            *float64x2_t v163 = *v162;
            v163[1] = v171;
            *float64x2_t v162 = v172;
            v162[1] = v173;
            float32x4_t v174 = v162[2];
            float32x4_t v175 = v162[3];
            float32x4_t v176 = vmlaq_f32(vmlaq_f32(v170, v174, *v10), v163[2], v10[4]);
            float32x4_t v177 = vmlaq_f32(vmlaq_f32(v170, v175, v10[1]), v163[3], v10[5]);
            v163[2] = v174;
            v163[3] = v175;
            v162[2] = v176;
            v162[3] = v177;
            float32x4_t v178 = v162[4];
            float32x4_t v179 = v162[5];
            float32x4_t v180 = vmlaq_f32(vmlaq_f32(v169, v178, v10[2]), v163[4], v10[6]);
            float32x4_t v181 = vmlaq_f32(vmlaq_f32(v170, v179, v10[3]), v163[5], v10[7]);
            v163[4] = v178;
            v163[5] = v179;
            v162[4] = v180;
            v162[5] = v181;
            v162 += 6;
            v163 += 6;
            v165 += 2;
          }
          while (v165 < v164);
        }
        if (v161)
        {
          uint64_t v182 = &a2[v161 - 1][v159];
          float32x4_t v183 = vld1q_dup_f32(v182);
          float32x4_t v184 = v162[1];
          float32x4_t v185 = vmlaq_f32(vmlaq_f32(v183, *v162, *v10), *v163, v10[4]);
          float32x4_t v186 = vmlaq_f32(vmlaq_f32(v183, v184, v10[1]), v163[1], v10[5]);
          *float64x2_t v163 = *v162;
          v163[1] = v184;
          *float64x2_t v162 = v185;
          v162[1] = v186;
          float32x4_t v187 = v162[2];
          float32x4_t v188 = v162[3];
          float32x4_t v189 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v188, v10[3]), v163[3], v10[7]);
          float32x4_t v190 = vmlaq_f32(vmlaq_f32(v183, v187, v10[2]), v163[2], v10[6]);
          v163[2] = v187;
          v163[3] = v188;
          v162[2] = v190;
          v162[3] = v189;
        }
        v159 += v160;
        ++v158;
      }
      while (v158 != v143);
    }
    goto LABEL_67;
  }
LABEL_68:
  *((_DWORD *)this + 18) = v7;
  *((_DWORD *)this + 22) = v9;
  return v16;
}

double RamstadSRC::latencySeconds(RamstadSRC *this)
{
  double v1 = *((double *)this + 5);
  double v2 = *((double *)this + 4) / v1;
  if (v2 >= 1.0) {
    double v3 = dbl_1ABAFBD10[*((_DWORD *)this + 14) == 8];
  }
  else {
    double v3 = dbl_1ABAFBD00[*((_DWORD *)this + 14) == 8] / v2;
  }
  return v3 / v1;
}

double RamstadSRC::latencySamples(RamstadSRC *this)
{
  double v1 = *((double *)this + 4) / *((double *)this + 5);
  if (v1 >= 1.0) {
    return dbl_1ABAFBD10[*((_DWORD *)this + 14) == 8];
  }
  else {
    return dbl_1ABAFBD00[*((_DWORD *)this + 14) == 8] / v1;
  }
}

void TFileBSD::Clear(FILE **this)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (kTFileBSDSubsystem)
  {
    double v2 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(void *)kTFileBSDSubsystem) {
      goto LABEL_7;
    }
  }
  else
  {
    double v2 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315906;
    unsigned int v7 = "TFileBSD.cpp";
    __int16 v8 = 1024;
    int v9 = 571;
    __int16 v10 = 2080;
    uint64_t v11 = "Clear";
    __int16 v12 = 2048;
    uint64_t v13 = this;
    _os_log_impl(&dword_1ABAC8000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&v6, 0x26u);
  }
LABEL_7:
  if (((uint64_t (*)(FILE **))(*this)->_lb._base)(this))
  {
    int v3 = fileno(this[2]);
    ftruncate(v3, 0);
  }
  else
  {
    ((void (*)(FILE **, uint64_t))(*this)->_extra)(this, 1);
    int v4 = fileno(this[2]);
    ftruncate(v4, 0);
    (*(void (**)(FILE **))&(*this)->_ur)(this);
  }
  this[3] = 0;
  this[4] = 0;
  if (kTFileBSDSubsystem)
  {
    if (*(unsigned char *)(kTFileBSDSubsystem + 8))
    {
      int v5 = *(NSObject **)kTFileBSDSubsystem;
      if (*(void *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          int v6 = 136315906;
          unsigned int v7 = "TFileBSD.cpp";
          __int16 v8 = 1024;
          int v9 = 589;
          __int16 v10 = 2080;
          uint64_t v11 = "Clear";
          __int16 v12 = 2048;
          uint64_t v13 = this;
          _os_log_impl(&dword_1ABAC8000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", (uint8_t *)&v6, 0x26u);
        }
      }
    }
  }
}

BOOL TFileBSD::IsOpen(TFileBSD *this)
{
  return *((void *)this + 2) != 0;
}

void TFileBSD::Close(TFileBSD *this)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (kTFileBSDSubsystem)
  {
    double v2 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(void *)kTFileBSDSubsystem) {
      goto LABEL_7;
    }
  }
  else
  {
    double v2 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)std::string buf = 136315906;
    int v9 = "TFileBSD.cpp";
    __int16 v10 = 1024;
    int v11 = 347;
    __int16 v12 = 2080;
    uint64_t v13 = "Close";
    __int16 v14 = 2048;
    uint64_t v15 = (const char *)this;
    _os_log_impl(&dword_1ABAC8000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", buf, 0x26u);
  }
LABEL_7:
  int v3 = (FILE *)*((void *)this + 2);
  if (v3 && fclose(v3))
  {
    int v5 = *__error() + 100000;
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v7, v5);
      *(_DWORD *)std::string buf = 136315906;
      int v9 = "TFileBSD.cpp";
      __int16 v10 = 1024;
      int v11 = 351;
      __int16 v12 = 2080;
      uint64_t v13 = v7;
      __int16 v14 = 2080;
      uint64_t v15 = "Close::fclose failed";
      _os_log_impl(&dword_1ABAC8000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
    }
    exception = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(exception, "Close::fclose failed", v5);
  }
  *((void *)this + 2) = 0;
  if (kTFileBSDSubsystem)
  {
    if (*(unsigned char *)(kTFileBSDSubsystem + 8))
    {
      int v4 = *(NSObject **)kTFileBSDSubsystem;
      if (*(void *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)std::string buf = 136315906;
          int v9 = "TFileBSD.cpp";
          __int16 v10 = 1024;
          int v11 = 354;
          __int16 v12 = 2080;
          uint64_t v13 = "Close";
          __int16 v14 = 2048;
          uint64_t v15 = (const char *)this;
          _os_log_impl(&dword_1ABAC8000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", buf, 0x26u);
        }
      }
    }
  }
}

void sub_1ABAECC5C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void TFileBSD::Open(const char **this, unsigned int a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (kTFileBSDSubsystem)
  {
    int v4 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(void *)kTFileBSDSubsystem) {
      goto LABEL_7;
    }
  }
  else
  {
    int v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)std::string buf = 136315906;
    uint64_t v15 = "TFileBSD.cpp";
    __int16 v16 = 1024;
    int v17 = 310;
    __int16 v18 = 2080;
    int v19 = "Open";
    __int16 v20 = 2048;
    uint64_t v21 = (const char *)this;
    _os_log_impl(&dword_1ABAC8000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", buf, 0x26u);
  }
LABEL_7:
  if (((*((uint64_t (**)(const char **))*this + 15))(this) & 1) == 0)
  {
    if (a2 >= 2)
    {
      if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
      {
        CAX4CCString::CAX4CCString((CAX4CCString *)v13, 0xFFFFFFCE);
        *(_DWORD *)std::string buf = 136315906;
        uint64_t v15 = "TFileBSD.cpp";
        __int16 v16 = 1024;
        int v17 = 315;
        __int16 v18 = 2080;
        int v19 = v13;
        __int16 v20 = 2080;
        uint64_t v21 = "Open - file open invalid file permission";
        _os_log_impl(&dword_1ABAC8000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
      }
      exception = (CAXException *)__cxa_allocate_exception(0x110uLL);
      CAXException::CAXException(exception, "Open - file open invalid file permission", -50);
    }
    if (access(this[1], 2 * (a2 != 0)))
    {
      int v5 = *__error();
      if (v5 == 13 || v5 == 1)
      {
        if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
        {
          CAX4CCString::CAX4CCString((CAX4CCString *)v13, 0xFFFFFFCA);
          *(_DWORD *)std::string buf = 136315906;
          uint64_t v15 = "TFileBSD.cpp";
          __int16 v16 = 1024;
          int v17 = 321;
          __int16 v18 = 2080;
          int v19 = v13;
          __int16 v20 = 2080;
          uint64_t v21 = "Open: Permission denied";
          _os_log_impl(&dword_1ABAC8000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
        }
        int v9 = (CAXException *)__cxa_allocate_exception(0x110uLL);
        CAXException::CAXException(v9, "Open: Permission denied", -54);
      }
    }
    if (a2) {
      int v6 = "r+b";
    }
    else {
      int v6 = "rb";
    }
    unsigned int v7 = fopen(this[1], v6);
    this[2] = (const char *)v7;
    if (!v7)
    {
      int v11 = *__error() + 100000;
      if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
      {
        CAX4CCString::CAX4CCString((CAX4CCString *)v13, v11);
        *(_DWORD *)std::string buf = 136315906;
        uint64_t v15 = "TFileBSD.cpp";
        __int16 v16 = 1024;
        int v17 = 327;
        __int16 v18 = 2080;
        int v19 = v13;
        __int16 v20 = 2080;
        uint64_t v21 = "Open::fopen failed";
        _os_log_impl(&dword_1ABAC8000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
      }
      __int16 v12 = (CAXException *)__cxa_allocate_exception(0x110uLL);
      CAXException::CAXException(v12, "Open::fopen failed", v11);
    }
    if ((uint64_t)this[4] >= 1) {
      (*((void (**)(const char **, void))*this + 5))(this, 0);
    }
    this[5] = (const char *)(*((uint64_t (**)(const char **))*this + 9))(this);
  }
  if (kTFileBSDSubsystem)
  {
    if (*(unsigned char *)(kTFileBSDSubsystem + 8))
    {
      __int16 v8 = *(NSObject **)kTFileBSDSubsystem;
      if (*(void *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)std::string buf = 136315906;
          uint64_t v15 = "TFileBSD.cpp";
          __int16 v16 = 1024;
          int v17 = 338;
          __int16 v18 = 2080;
          int v19 = "Open";
          __int16 v20 = 2048;
          uint64_t v21 = (const char *)this;
          _os_log_impl(&dword_1ABAC8000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", buf, 0x26u);
        }
      }
    }
  }
}

void sub_1ABAED164(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void TFileBSD::DeleteFile(const std::__fs::filesystem::path **this)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (kTFileBSDSubsystem)
  {
    double v2 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(void *)kTFileBSDSubsystem) {
      goto LABEL_7;
    }
  }
  else
  {
    double v2 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315906;
    int v6 = "TFileBSD.cpp";
    __int16 v7 = 1024;
    int v8 = 290;
    __int16 v9 = 2080;
    __int16 v10 = "DeleteFile";
    __int16 v11 = 2048;
    __int16 v12 = this;
    _os_log_impl(&dword_1ABAC8000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&v5, 0x26u);
  }
LABEL_7:
  if (((unsigned int (*)(const std::__fs::filesystem::path **))(*this)[5].__pn_.__r_.__value_.__l.__data_)(this)) {
    ((void (*)(const std::__fs::filesystem::path **))(*this)[4].__pn_.__r_.__value_.__r.__words[2])(this);
  }
  remove(this[1], v3);
  if (kTFileBSDSubsystem)
  {
    if (*(unsigned char *)(kTFileBSDSubsystem + 8))
    {
      int v4 = *(NSObject **)kTFileBSDSubsystem;
      if (*(void *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          int v5 = 136315906;
          int v6 = "TFileBSD.cpp";
          __int16 v7 = 1024;
          int v8 = 301;
          __int16 v9 = 2080;
          __int16 v10 = "DeleteFile";
          __int16 v11 = 2048;
          __int16 v12 = this;
          _os_log_impl(&dword_1ABAC8000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", (uint8_t *)&v5, 0x26u);
        }
      }
    }
  }
}

void TFileBSD::Create(TFileBSD *this)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (kTFileBSDSubsystem)
  {
    double v2 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(void *)kTFileBSDSubsystem) {
      goto LABEL_7;
    }
  }
  else
  {
    double v2 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)std::string buf = 136315906;
    __int16 v12 = "TFileBSD.cpp";
    __int16 v13 = 1024;
    int v14 = 262;
    __int16 v15 = 2080;
    __int16 v16 = "Create";
    __int16 v17 = 2048;
    __int16 v18 = (const char *)this;
    _os_log_impl(&dword_1ABAC8000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", buf, 0x26u);
  }
LABEL_7:
  if (((*(uint64_t (**)(TFileBSD *))(*(void *)this + 80))(this) & 1) == 0)
  {
    int v3 = (const char *)*((void *)this + 1);
    if (v3)
    {
      int v4 = fopen(v3, "w+b");
      if (!v4)
      {
        int v6 = *__error() + 100000;
        if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
        {
          CAX4CCString::CAX4CCString((CAX4CCString *)v10, v6);
          *(_DWORD *)std::string buf = 136315906;
          __int16 v12 = "TFileBSD.cpp";
          __int16 v13 = 1024;
          int v14 = 268;
          __int16 v15 = 2080;
          __int16 v16 = v10;
          __int16 v17 = 2080;
          __int16 v18 = "Create::fopen failed";
          _os_log_impl(&dword_1ABAC8000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
        }
        exception = (CAXException *)__cxa_allocate_exception(0x110uLL);
        CAXException::CAXException(exception, "Create::fopen failed", v6);
      }
      if (fclose(v4))
      {
        int v8 = *__error() + 100000;
        if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
        {
          CAX4CCString::CAX4CCString((CAX4CCString *)v10, v8);
          *(_DWORD *)std::string buf = 136315906;
          __int16 v12 = "TFileBSD.cpp";
          __int16 v13 = 1024;
          int v14 = 269;
          __int16 v15 = 2080;
          __int16 v16 = v10;
          __int16 v17 = 2080;
          __int16 v18 = "Create::fclose failed";
          _os_log_impl(&dword_1ABAC8000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
        }
        __int16 v9 = (CAXException *)__cxa_allocate_exception(0x110uLL);
        CAXException::CAXException(v9, "Create::fclose failed", v8);
      }
    }
  }
  if (kTFileBSDSubsystem)
  {
    if (*(unsigned char *)(kTFileBSDSubsystem + 8))
    {
      int v5 = *(NSObject **)kTFileBSDSubsystem;
      if (*(void *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)std::string buf = 136315906;
          __int16 v12 = "TFileBSD.cpp";
          __int16 v13 = 1024;
          int v14 = 281;
          __int16 v15 = 2080;
          __int16 v16 = "Create";
          __int16 v17 = 2048;
          __int16 v18 = (const char *)this;
          _os_log_impl(&dword_1ABAC8000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", buf, 0x26u);
        }
      }
    }
  }
}

void sub_1ABAED6F8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL TFileBSD::Exists(const char **this)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (kTFileBSDSubsystem)
  {
    double v2 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(void *)kTFileBSDSubsystem) {
      goto LABEL_7;
    }
  }
  else
  {
    double v2 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v6.st_dev = 136315906;
    *(void *)&v6.st_mode = "TFileBSD.cpp";
    WORD2(v6.st_ino) = 1024;
    *(_DWORD *)((char *)&v6.st_ino + 6) = 236;
    HIWORD(v6.st_uid) = 2080;
    *(void *)&v6.st_gid = "Exists";
    *((_WORD *)&v6.st_rdev + 2) = 2048;
    *(void *)((char *)&v6.st_rdev + 6) = this;
    _os_log_impl(&dword_1ABAC8000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&v6, 0x26u);
  }
LABEL_7:
  BOOL v3 = ((*((uint64_t (**)(const char **))*this + 15))(this) & 1) != 0 || stat(this[1], &v6) == 0;
  if (kTFileBSDSubsystem)
  {
    if (*(unsigned char *)(kTFileBSDSubsystem + 8))
    {
      int v4 = *(NSObject **)kTFileBSDSubsystem;
      if (*(void *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          v6.st_dev = 136315906;
          *(void *)&v6.st_mode = "TFileBSD.cpp";
          WORD2(v6.st_ino) = 1024;
          *(_DWORD *)((char *)&v6.st_ino + 6) = 252;
          HIWORD(v6.st_uid) = 2080;
          *(void *)&v6.st_gid = "Exists";
          *((_WORD *)&v6.st_rdev + 2) = 2048;
          *(void *)((char *)&v6.st_rdev + 6) = this;
          _os_log_impl(&dword_1ABAC8000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", (uint8_t *)&v6, 0x26u);
        }
      }
    }
  }
  return v3;
}

off_t TFileBSD::GetLength(FILE **this)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (kTFileBSDSubsystem)
  {
    double v2 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(void *)kTFileBSDSubsystem) {
      goto LABEL_7;
    }
  }
  else
  {
    double v2 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    buf.st_dev = 136315906;
    *(void *)&buf.st_mode = "TFileBSD.cpp";
    WORD2(buf.st_ino) = 1024;
    *(_DWORD *)((char *)&buf.st_ino + 6) = 429;
    HIWORD(buf.st_uid) = 2080;
    *(void *)&buf.st_gid = "GetLength";
    *((_WORD *)&buf.st_rdev + 2) = 2048;
    *(void *)((char *)&buf.st_rdev + 6) = this;
    _os_log_impl(&dword_1ABAC8000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&buf, 0x26u);
  }
LABEL_7:
  if ((((uint64_t (*)(FILE **))(*this)->_lb._base)(this) & 1) == 0)
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v11, 0xFFFFFFDA);
      buf.st_dev = 136315906;
      *(void *)&buf.st_mode = "TFileBSD.cpp";
      WORD2(buf.st_ino) = 1024;
      *(_DWORD *)((char *)&buf.st_ino + 6) = 433;
      HIWORD(buf.st_uid) = 2080;
      *(void *)&buf.st_gid = v11;
      *((_WORD *)&buf.st_rdev + 2) = 2080;
      *(void *)((char *)&buf.st_rdev + 6) = "GetLength - file not open";
      _os_log_impl(&dword_1ABAC8000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", (uint8_t *)&buf, 0x26u);
    }
    exception = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(exception, "GetLength - file not open", -38);
  }
  int v3 = fileno(this[2]);
  if (fstat(v3, &buf))
  {
    int v8 = *__error() + 100000;
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v10, v8);
      *(_DWORD *)__int16 v11 = 136315906;
      __int16 v12 = "TFileBSD.cpp";
      __int16 v13 = 1024;
      int v14 = 436;
      __int16 v15 = 2080;
      __int16 v16 = v10;
      __int16 v17 = 2080;
      __int16 v18 = "GetLength::fstat failed";
      _os_log_impl(&dword_1ABAC8000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", v11, 0x26u);
    }
    __int16 v9 = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(v9, "GetLength::fstat failed", v8);
  }
  st_std::string::size_type size = buf.st_size;
  if (kTFileBSDSubsystem)
  {
    if (*(unsigned char *)(kTFileBSDSubsystem + 8))
    {
      int v5 = *(NSObject **)kTFileBSDSubsystem;
      if (*(void *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)__int16 v11 = 136315906;
          __int16 v12 = "TFileBSD.cpp";
          __int16 v13 = 1024;
          int v14 = 439;
          __int16 v15 = 2080;
          __int16 v16 = "GetLength";
          __int16 v17 = 2048;
          __int16 v18 = (const char *)this;
          _os_log_impl(&dword_1ABAC8000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", v11, 0x26u);
        }
      }
    }
  }
  return st_size;
}

void sub_1ABAEDC64(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void TFileBSD::Skip(FILE **this, off_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (kTFileBSDSubsystem)
  {
    int v4 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(void *)kTFileBSDSubsystem) {
      goto LABEL_7;
    }
  }
  else
  {
    int v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 136315906;
    __int16 v11 = "TFileBSD.cpp";
    __int16 v12 = 1024;
    int v13 = 409;
    __int16 v14 = 2080;
    __int16 v15 = "Skip";
    __int16 v16 = 2048;
    __int16 v17 = (const char *)this;
    _os_log_impl(&dword_1ABAC8000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", buf, 0x26u);
  }
LABEL_7:
  if ((((uint64_t (*)(FILE **))(*this)->_lb._base)(this) & 1) == 0)
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v9, 0xFFFFFFDA);
      *(_DWORD *)stat buf = 136315906;
      __int16 v11 = "TFileBSD.cpp";
      __int16 v12 = 1024;
      int v13 = 412;
      __int16 v14 = 2080;
      __int16 v15 = v9;
      __int16 v16 = 2080;
      __int16 v17 = "Skip - file not open";
      _os_log_impl(&dword_1ABAC8000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
    }
    exception = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(exception, "Skip - file not open", -38);
  }
  if (fseeko(this[2], a2, 1))
  {
    int v7 = *__error() + 100000;
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v9, v7);
      *(_DWORD *)stat buf = 136315906;
      __int16 v11 = "TFileBSD.cpp";
      __int16 v12 = 1024;
      int v13 = 414;
      __int16 v14 = 2080;
      __int16 v15 = v9;
      __int16 v16 = 2080;
      __int16 v17 = "Skip::fseeko failed";
      _os_log_impl(&dword_1ABAC8000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
    }
    int v8 = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(v8, "Skip::fseeko failed", v7);
  }
  this[3] = (FILE *)((char *)this[3] + a2);
  if (kTFileBSDSubsystem)
  {
    if (*(unsigned char *)(kTFileBSDSubsystem + 8))
    {
      int v5 = *(NSObject **)kTFileBSDSubsystem;
      if (*(void *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)stat buf = 136315906;
          __int16 v11 = "TFileBSD.cpp";
          __int16 v12 = 1024;
          int v13 = 420;
          __int16 v14 = 2080;
          __int16 v15 = "Skip";
          __int16 v16 = 2048;
          __int16 v17 = (const char *)this;
          _os_log_impl(&dword_1ABAC8000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", buf, 0x26u);
        }
      }
    }
  }
}

void sub_1ABAEE000(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t TFileBSD::GetPosition(TFileBSD *this)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = kTFileBSDSubsystem;
  if (kTFileBSDSubsystem)
  {
    int v3 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(void *)kTFileBSDSubsystem)
    {
LABEL_8:
      if (*(unsigned char *)(v2 + 8))
      {
        int v4 = *(NSObject **)v2;
        if (*(void *)v2)
        {
          if (os_log_type_enabled(*(os_log_t *)v2, OS_LOG_TYPE_DEBUG))
          {
            int v6 = 136315906;
            int v7 = "TFileBSD.cpp";
            __int16 v8 = 1024;
            int v9 = 399;
            __int16 v10 = 2080;
            __int16 v11 = "GetPosition";
            __int16 v12 = 2048;
            int v13 = this;
            _os_log_impl(&dword_1ABAC8000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", (uint8_t *)&v6, 0x26u);
          }
        }
      }
      return *((void *)this + 3);
    }
  }
  else
  {
    int v3 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315906;
    int v7 = "TFileBSD.cpp";
    __int16 v8 = 1024;
    int v9 = 397;
    __int16 v10 = 2080;
    __int16 v11 = "GetPosition";
    __int16 v12 = 2048;
    int v13 = this;
    _os_log_impl(&dword_1ABAC8000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&v6, 0x26u);
    uint64_t v2 = kTFileBSDSubsystem;
  }
  if (v2) {
    goto LABEL_8;
  }
  return *((void *)this + 3);
}

void TFileBSD::SeekAsync(TFileBSD *this, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = kTFileBSDSubsystem;
  if (kTFileBSDSubsystem)
  {
    int v5 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(void *)kTFileBSDSubsystem)
    {
      *((void *)this + 3) = a2;
LABEL_8:
      if (*(unsigned char *)(v4 + 8))
      {
        int v6 = *(NSObject **)v4;
        if (*(void *)v4)
        {
          if (os_log_type_enabled(*(os_log_t *)v4, OS_LOG_TYPE_DEBUG))
          {
            int v7 = 136315906;
            __int16 v8 = "TFileBSD.cpp";
            __int16 v9 = 1024;
            int v10 = 387;
            __int16 v11 = 2080;
            __int16 v12 = "SeekAsync";
            __int16 v13 = 2048;
            uint64_t v14 = this;
            _os_log_impl(&dword_1ABAC8000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", (uint8_t *)&v7, 0x26u);
          }
        }
      }
      return;
    }
  }
  else
  {
    int v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315906;
    __int16 v8 = "TFileBSD.cpp";
    __int16 v9 = 1024;
    int v10 = 383;
    __int16 v11 = 2080;
    __int16 v12 = "SeekAsync";
    __int16 v13 = 2048;
    uint64_t v14 = this;
    _os_log_impl(&dword_1ABAC8000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&v7, 0x26u);
    uint64_t v4 = kTFileBSDSubsystem;
  }
  *((void *)this + 3) = a2;
  if (v4) {
    goto LABEL_8;
  }
}

void TFileBSD::Seek(FILE **this, FILE *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (kTFileBSDSubsystem)
  {
    uint64_t v4 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(void *)kTFileBSDSubsystem) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 136315906;
    __int16 v11 = "TFileBSD.cpp";
    __int16 v12 = 1024;
    int v13 = 364;
    __int16 v14 = 2080;
    uint64_t v15 = "Seek";
    __int16 v16 = 2048;
    __int16 v17 = (const char *)this;
    _os_log_impl(&dword_1ABAC8000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", buf, 0x26u);
  }
LABEL_7:
  if ((((uint64_t (*)(FILE **))(*this)->_lb._base)(this) & 1) == 0)
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v9, 0xFFFFFFDA);
      *(_DWORD *)stat buf = 136315906;
      __int16 v11 = "TFileBSD.cpp";
      __int16 v12 = 1024;
      int v13 = 367;
      __int16 v14 = 2080;
      uint64_t v15 = v9;
      __int16 v16 = 2080;
      __int16 v17 = "Seek - file not open";
      _os_log_impl(&dword_1ABAC8000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
    }
    exception = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(exception, "Seek - file not open", -38);
  }
  if (fseeko(this[2], (off_t)a2 + (void)this[4], 0))
  {
    int v7 = *__error() + 100000;
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v9, v7);
      *(_DWORD *)stat buf = 136315906;
      __int16 v11 = "TFileBSD.cpp";
      __int16 v12 = 1024;
      int v13 = 369;
      __int16 v14 = 2080;
      uint64_t v15 = v9;
      __int16 v16 = 2080;
      __int16 v17 = "Seek::fseeko failed";
      _os_log_impl(&dword_1ABAC8000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
    }
    __int16 v8 = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(v8, "Seek::fseeko failed", v7);
  }
  this[3] = a2;
  if (kTFileBSDSubsystem)
  {
    if (*(unsigned char *)(kTFileBSDSubsystem + 8))
    {
      int v5 = *(NSObject **)kTFileBSDSubsystem;
      if (*(void *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)stat buf = 136315906;
          __int16 v11 = "TFileBSD.cpp";
          __int16 v12 = 1024;
          int v13 = 374;
          __int16 v14 = 2080;
          uint64_t v15 = "Seek";
          __int16 v16 = 2048;
          __int16 v17 = (const char *)this;
          _os_log_impl(&dword_1ABAC8000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", buf, 0x26u);
        }
      }
    }
  }
}

void sub_1ABAEE6C8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t TFileBSD::ReadAsync(void *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (kTFileBSDSubsystem)
  {
    int v10 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(void *)kTFileBSDSubsystem) {
      goto LABEL_7;
    }
  }
  else
  {
    int v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v22 = 136315906;
    float32x4_t v23 = "TFileBSD.cpp";
    __int16 v24 = 1024;
    int v25 = 508;
    __int16 v26 = 2080;
    float32x4_t v27 = "ReadAsync";
    __int16 v28 = 2048;
    float32x4_t v29 = a1;
    _os_log_impl(&dword_1ABAC8000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&v22, 0x26u);
  }
LABEL_7:
  if (((*(uint64_t (**)(void *))(*a1 + 120))(a1) & 1) == 0)
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136315394;
      float32x4_t v23 = "TFileBSD.cpp";
      __int16 v24 = 1024;
      int v25 = 511;
      _os_log_impl(&dword_1ABAC8000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(IsOpen()) != 0 is false]: ", (uint8_t *)&v22, 0x12u);
    }
    __break(1u);
  }
  if (!(*(unsigned int (**)(void *))(*a1 + 120))(a1)) {
    return 4294967258;
  }
  uint64_t v11 = a1[5];
  uint64_t v12 = a1[3];
  uint64_t v13 = v12 + a3;
  int v14 = v11 - v12;
  if (v13 <= (int)v11) {
    int v15 = a3;
  }
  else {
    int v15 = v14;
  }
  if (v15 < 1)
  {
    uint64_t v19 = 0;
    if (!v15) {
      --*(_DWORD *)sReadCounter_BSD;
    }
  }
  else
  {
    LOBYTE(v22) = 0;
    __int16 v16 = (TFileBSD *)(*(uint64_t (**)(uint64_t, int *))(*(void *)TFileBSD::sGuard + 32))(TFileBSD::sGuard, &v22);
    if (v16)
    {
      FreeRequestBlock = TFileBSD::GetFreeRequestBlock(v16);
      if (!FreeRequestBlock) {
        return 0xFFFFFFFFLL;
      }
      *((void *)FreeRequestBlock + 1) = a4;
      *((void *)FreeRequestBlock + 2) = a5;
      uint64_t v18 = a1[3];
      *((_DWORD *)FreeRequestBlock + 6) = v18;
      a1[3] = v18 + v15;
      *((_DWORD *)FreeRequestBlock + 7) = v15;
      *((void *)FreeRequestBlock + 4) = a2;
      *((void *)FreeRequestBlock + 5) = a1;
      unsigned char *FreeRequestBlock = 1;
      (*(void (**)(uint64_t))(*(void *)TFileBSD::sGuard + 80))(TFileBSD::sGuard);
      if ((_BYTE)v22) {
        (*(void (**)(uint64_t))(*(void *)TFileBSD::sGuard + 24))(TFileBSD::sGuard);
      }
      uint64_t v19 = 0;
    }
    else
    {
      uint64_t v19 = 0xFFFFFFFFLL;
    }
  }
  if (kTFileBSDSubsystem)
  {
    if (*(unsigned char *)(kTFileBSDSubsystem + 8))
    {
      uint64_t v20 = *(NSObject **)kTFileBSDSubsystem;
      if (*(void *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          int v22 = 136315906;
          float32x4_t v23 = "TFileBSD.cpp";
          __int16 v24 = 1024;
          int v25 = 561;
          __int16 v26 = 2080;
          float32x4_t v27 = "ReadAsync";
          __int16 v28 = 2048;
          float32x4_t v29 = a1;
          _os_log_impl(&dword_1ABAC8000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", (uint8_t *)&v22, 0x26u);
        }
      }
    }
  }
  return v19;
}

unsigned char *TFileBSD::GetFreeRequestBlock(TFileBSD *this)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (kTFileBSDSubsystem)
  {
    double v1 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(void *)kTFileBSDSubsystem) {
      goto LABEL_7;
    }
  }
  else
  {
    double v1 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315650;
    int v7 = "TFileBSD.cpp";
    __int16 v8 = 1024;
    int v9 = 598;
    __int16 v10 = 2080;
    uint64_t v11 = "GetFreeRequestBlock";
    _os_log_impl(&dword_1ABAC8000, v1, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s", (uint8_t *)&v6, 0x1Cu);
  }
LABEL_7:
  uint64_t v2 = (unsigned char *)(*(void *)TFileBSD::sRequestBlockList + 48 * TFileBSD::sAsyncRequestWriteIndex);
  if (*v2) {
    return 0;
  }
  int v4 = (TFileBSD::sAsyncRequestWriteIndex + 1) & 0x7F;
  if (TFileBSD::sAsyncRequestWriteIndex + 1 <= 0) {
    int v4 = -(-(TFileBSD::sAsyncRequestWriteIndex + 1) & 0x7F);
  }
  TFileBSD::sAsyncRequestWriteIndex = v4;
  if (kTFileBSDSubsystem)
  {
    if (*(unsigned char *)(kTFileBSDSubsystem + 8))
    {
      int v5 = *(NSObject **)kTFileBSDSubsystem;
      if (*(void *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          int v6 = 136315650;
          int v7 = "TFileBSD.cpp";
          __int16 v8 = 1024;
          int v9 = 605;
          __int16 v10 = 2080;
          uint64_t v11 = "GetFreeRequestBlock";
          _os_log_impl(&dword_1ABAC8000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s", (uint8_t *)&v6, 0x1Cu);
        }
      }
    }
  }
  return v2;
}

size_t TFileBSD::Write(FILE **this, void *a2, size_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (kTFileBSDSubsystem)
  {
    int v6 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(void *)kTFileBSDSubsystem) {
      goto LABEL_7;
    }
  }
  else
  {
    int v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 136315906;
    __int16 v16 = "TFileBSD.cpp";
    __int16 v17 = 1024;
    int v18 = 479;
    __int16 v19 = 2080;
    uint64_t v20 = "Write";
    __int16 v21 = 2048;
    int v22 = (const char *)this;
    _os_log_impl(&dword_1ABAC8000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", buf, 0x26u);
  }
LABEL_7:
  if ((((uint64_t (*)(FILE **))(*this)->_lb._base)(this) & 1) == 0)
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v14, 0xFFFFFFDA);
      *(_DWORD *)stat buf = 136315906;
      __int16 v16 = "TFileBSD.cpp";
      __int16 v17 = 1024;
      int v18 = 482;
      __int16 v19 = 2080;
      uint64_t v20 = v14;
      __int16 v21 = 2080;
      int v22 = "Write - file not open";
      _os_log_impl(&dword_1ABAC8000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
    }
    exception = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(exception, "Write - file not open", -38);
  }
  if (a3)
  {
    size_t v7 = fwrite(a2, 1uLL, a3, this[2]);
    if (v7 < a3)
    {
      int v8 = ferror(this[2]);
      if (v8)
      {
        unsigned int v12 = v8;
        if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
        {
          CAX4CCString::CAX4CCString((CAX4CCString *)v14, v12);
          *(_DWORD *)stat buf = 136315906;
          __int16 v16 = "TFileBSD.cpp";
          __int16 v17 = 1024;
          int v18 = 492;
          __int16 v19 = 2080;
          uint64_t v20 = v14;
          __int16 v21 = 2080;
          int v22 = "Write::fwrite";
          _os_log_impl(&dword_1ABAC8000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
        }
        uint64_t v13 = (CAXException *)__cxa_allocate_exception(0x110uLL);
        CAXException::CAXException(v13, "Write::fwrite", v12);
      }
    }
    this[3] = (FILE *)((char *)this[3] + v7);
  }
  else
  {
    size_t v7 = 0;
  }
  if (kTFileBSDSubsystem)
  {
    if (*(unsigned char *)(kTFileBSDSubsystem + 8))
    {
      int v9 = *(NSObject **)kTFileBSDSubsystem;
      if (*(void *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)stat buf = 136315906;
          __int16 v16 = "TFileBSD.cpp";
          __int16 v17 = 1024;
          int v18 = 498;
          __int16 v19 = 2080;
          uint64_t v20 = "Write";
          __int16 v21 = 2048;
          int v22 = (const char *)this;
          _os_log_impl(&dword_1ABAC8000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", buf, 0x26u);
        }
      }
    }
  }
  return v7;
}

void sub_1ABAEEFBC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

size_t TFileBSD::Read(FILE **this, void *a2, size_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (kTFileBSDSubsystem)
  {
    int v6 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(void *)kTFileBSDSubsystem) {
      goto LABEL_7;
    }
  }
  else
  {
    int v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 136315906;
    __int16 v16 = "TFileBSD.cpp";
    __int16 v17 = 1024;
    int v18 = 449;
    __int16 v19 = 2080;
    uint64_t v20 = "Read";
    __int16 v21 = 2048;
    int v22 = (const char *)this;
    _os_log_impl(&dword_1ABAC8000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", buf, 0x26u);
  }
LABEL_7:
  if ((((uint64_t (*)(FILE **))(*this)->_lb._base)(this) & 1) == 0)
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v14, 0xFFFFFFDA);
      *(_DWORD *)stat buf = 136315906;
      __int16 v16 = "TFileBSD.cpp";
      __int16 v17 = 1024;
      int v18 = 452;
      __int16 v19 = 2080;
      uint64_t v20 = v14;
      __int16 v21 = 2080;
      int v22 = "Read - file not open";
      _os_log_impl(&dword_1ABAC8000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
    }
    exception = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(exception, "Read - file not open", -38);
  }
  if (a3)
  {
    size_t v7 = fread(a2, 1uLL, a3, this[2]);
    if (v7 < a3 && !feof(this[2]))
    {
      int v8 = ferror(this[2]);
      if (v8)
      {
        unsigned int v12 = v8;
        if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
        {
          CAX4CCString::CAX4CCString((CAX4CCString *)v14, v12);
          *(_DWORD *)stat buf = 136315906;
          __int16 v16 = "TFileBSD.cpp";
          __int16 v17 = 1024;
          int v18 = 463;
          __int16 v19 = 2080;
          uint64_t v20 = v14;
          __int16 v21 = 2080;
          int v22 = "Read::fread";
          _os_log_impl(&dword_1ABAC8000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
        }
        uint64_t v13 = (CAXException *)__cxa_allocate_exception(0x110uLL);
        CAXException::CAXException(v13, "Read::fread", v12);
      }
    }
    this[3] = (FILE *)((char *)this[3] + v7);
  }
  else
  {
    size_t v7 = 0;
  }
  if (kTFileBSDSubsystem)
  {
    if (*(unsigned char *)(kTFileBSDSubsystem + 8))
    {
      int v9 = *(NSObject **)kTFileBSDSubsystem;
      if (*(void *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)stat buf = 136315906;
          __int16 v16 = "TFileBSD.cpp";
          __int16 v17 = 1024;
          int v18 = 469;
          __int16 v19 = 2080;
          uint64_t v20 = "Read";
          __int16 v21 = 2048;
          int v22 = (const char *)this;
          _os_log_impl(&dword_1ABAC8000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", buf, 0x26u);
        }
      }
    }
  }
  return v7;
}

void sub_1ABAEF38C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void TFileBSD::~TFileBSD(TFileBSD *this)
{
  TFileBSD::~TFileBSD(this);

  JUMPOUT(0x1AD112B70);
}

{
  unsigned int (**v2)(TFileBSD *);
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  TFileBSD *v13;
  uint64_t v14;

  int v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (unsigned int (**)(TFileBSD *))&unk_1F0303188;
  *(void *)this = &unk_1F0303188;
  if (kTFileBSDSubsystem)
  {
    int v3 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(void *)kTFileBSDSubsystem) {
      goto LABEL_7;
    }
  }
  else
  {
    int v3 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315906;
    size_t v7 = "TFileBSD.cpp";
    int v8 = 1024;
    int v9 = 132;
    __int16 v10 = 2080;
    uint64_t v11 = "~TFileBSD";
    unsigned int v12 = 2048;
    uint64_t v13 = this;
    _os_log_impl(&dword_1ABAC8000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&v6, 0x26u);
    uint64_t v2 = *(unsigned int (***)(TFileBSD *))this;
  }
LABEL_7:
  if (v2[15](this)) {
    (*(void (**)(TFileBSD *))(*(void *)this + 112))(this);
  }
  if (kTFileBSDSubsystem)
  {
    if (*(unsigned char *)(kTFileBSDSubsystem + 8))
    {
      int v4 = *(NSObject **)kTFileBSDSubsystem;
      if (*(void *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          int v6 = 136315906;
          size_t v7 = "TFileBSD.cpp";
          int v8 = 1024;
          int v9 = 141;
          __int16 v10 = 2080;
          uint64_t v11 = "~TFileBSD";
          unsigned int v12 = 2048;
          uint64_t v13 = this;
          _os_log_impl(&dword_1ABAC8000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", (uint8_t *)&v6, 0x26u);
        }
      }
    }
  }
  int v5 = (void *)*((void *)this + 1);
  if (v5)
  {
    free(v5);
    *((void *)this + 1) = 0;
  }
}

void sub_1ABAEF5FC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, long long a10)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __cxa_begin_catch(a1);
  uint64_t v11 = *(NSObject ***)(v10 + 3184);
  if (v11)
  {
    unsigned int v12 = *v11;
    if (!*v11) {
      goto LABEL_8;
    }
  }
  else
  {
    unsigned int v12 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LODWORD(a9) = 136315906;
    *(void *)((char *)&a9 + 4) = "TFileBSD.cpp";
    WORD6(a9) = 1024;
    *(_DWORD *)((char *)&a9 + 14) = 138;
    WORD1(a1CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 2080;
    *(void *)((char *)&a10 + 4) = "~TFileBSD";
    WORD6(a1CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 2048;
    _os_log_impl(&dword_1ABAC8000, v12, OS_LOG_TYPE_INFO, "%25s:%-5d <-%s %p: Swallowed exception from Close()", (uint8_t *)&a9, 0x26u);
  }
LABEL_8:
  __cxa_end_catch();
  JUMPOUT(0x1ABAEF524);
}

void TFileBSD::TFileBSD(TFileBSD *this, const __CFURL *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  *(void *)this = &unk_1F0303188;
  *((void *)this + 1) = 0;
  int v4 = (void **)((char *)this + 8);
  if (TFileBSD::TFileBSD(__CFURL const*)::once != -1) {
    dispatch_once(&TFileBSD::TFileBSD(__CFURL const*)::once, &__block_literal_global_293);
  }
  if (kTFileBSDSubsystem)
  {
    int v5 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(void *)kTFileBSDSubsystem) {
      goto LABEL_9;
    }
  }
  else
  {
    int v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315906;
    int v8 = "TFileBSD.cpp";
    __int16 v9 = 1024;
    int v10 = 77;
    __int16 v11 = 2080;
    unsigned int v12 = "TFileBSD";
    __int16 v13 = 2048;
    int v14 = this;
    _os_log_impl(&dword_1ABAC8000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&v7, 0x26u);
  }
LABEL_9:
  TFileBSD::Initialize(this);
  if (a2)
  {
    CADeprecated::CAAutoFree<char>::allocBytes(v4);
    if (*v4)
    {
      if (CFURLGetFileSystemRepresentation(a2, 1u, (UInt8 *)*v4, 1024) != 1 && *v4) {
        *(unsigned char *)*int v4 = 0;
      }
    }
  }
  if (kTFileBSDSubsystem)
  {
    if (*(unsigned char *)(kTFileBSDSubsystem + 8))
    {
      int v6 = *(NSObject **)kTFileBSDSubsystem;
      if (*(void *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          int v7 = 136315906;
          int v8 = "TFileBSD.cpp";
          __int16 v9 = 1024;
          int v10 = 102;
          __int16 v11 = 2080;
          unsigned int v12 = "TFileBSD";
          __int16 v13 = 2048;
          int v14 = this;
          _os_log_impl(&dword_1ABAC8000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", (uint8_t *)&v7, 0x26u);
        }
      }
    }
  }
}

void sub_1ABAEF8DC(_Unwind_Exception *exception_object)
{
  if (*v1)
  {
    free(*v1);
    void *v1 = 0;
  }
  _Unwind_Resume(exception_object);
}

void TFileBSD::Initialize(TFileBSD *this)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = kTFileBSDSubsystem;
  if (kTFileBSDSubsystem)
  {
    int v3 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(void *)kTFileBSDSubsystem)
    {
      *((_OWORD *)this + 1) = 0u;
      *((_OWORD *)this + 2) = 0u;
LABEL_8:
      if (*(unsigned char *)(v2 + 8))
      {
        int v4 = *(NSObject **)v2;
        if (*(void *)v2)
        {
          if (os_log_type_enabled(*(os_log_t *)v2, OS_LOG_TYPE_DEBUG))
          {
            int v5 = 136315906;
            int v6 = "TFileBSD.cpp";
            __int16 v7 = 1024;
            int v8 = 155;
            __int16 v9 = 2080;
            int v10 = "Initialize";
            __int16 v11 = 2048;
            unsigned int v12 = this;
            _os_log_impl(&dword_1ABAC8000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", (uint8_t *)&v5, 0x26u);
          }
        }
      }
      return;
    }
  }
  else
  {
    int v3 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315906;
    int v6 = "TFileBSD.cpp";
    __int16 v7 = 1024;
    int v8 = 150;
    __int16 v9 = 2080;
    int v10 = "Initialize";
    __int16 v11 = 2048;
    unsigned int v12 = this;
    _os_log_impl(&dword_1ABAC8000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&v5, 0x26u);
    uint64_t v2 = kTFileBSDSubsystem;
  }
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  if (v2) {
    goto LABEL_8;
  }
}

void *CADeprecated::CAAutoFree<char>::allocBytes(void **a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    free(v2);
    *a1 = 0;
  }
  double result = malloc_type_malloc(0x400uLL, 0x7C51E058uLL);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    int v5 = std::bad_alloc::bad_alloc(exception);
  }
  *a1 = result;
  return result;
}

void ___ZN8TFileBSDC2EPK7__CFURL_block_invoke()
{
}

void TFileBSD::TFileBSD(TFileBSD *this, const char **a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  *(void *)this = &unk_1F0303188;
  *((void *)this + 1) = 0;
  int v4 = (void **)((char *)this + 8);
  if (kTFileBSDSubsystem)
  {
    int v5 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(void *)kTFileBSDSubsystem) {
      goto LABEL_7;
    }
  }
  else
  {
    int v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315906;
    int v10 = "TFileBSD.cpp";
    __int16 v11 = 1024;
    int v12 = 112;
    __int16 v13 = 2080;
    int v14 = "TFileBSD";
    __int16 v15 = 2048;
    __int16 v16 = this;
    _os_log_impl(&dword_1ABAC8000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&v9, 0x26u);
  }
LABEL_7:
  TFileBSD::Initialize(this);
  if (a2[1])
  {
    CADeprecated::CAAutoFree<char>::allocBytes(v4);
    int v6 = *v4;
    if (v6)
    {
      size_t v7 = strlen(a2[1]);
      memcpy(v6, a2[1], v7 + 1);
    }
  }
  *((void *)this + 4) = a2[4];
  if (kTFileBSDSubsystem)
  {
    if (*(unsigned char *)(kTFileBSDSubsystem + 8))
    {
      int v8 = *(NSObject **)kTFileBSDSubsystem;
      if (*(void *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          int v9 = 136315906;
          int v10 = "TFileBSD.cpp";
          __int16 v11 = 1024;
          int v12 = 123;
          __int16 v13 = 2080;
          int v14 = "TFileBSD";
          __int16 v15 = 2048;
          __int16 v16 = this;
          _os_log_impl(&dword_1ABAC8000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", (uint8_t *)&v9, 0x26u);
        }
      }
    }
  }
}

void sub_1ABAEFD68(_Unwind_Exception *exception_object)
{
  if (*v1)
  {
    free(*v1);
    void *v1 = 0;
  }
  _Unwind_Resume(exception_object);
}

uint64_t TFileBSD::InitializeAsync(TFileBSD *this, int *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (kTFileBSDSubsystem)
  {
    int v3 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(void *)kTFileBSDSubsystem) {
      goto LABEL_7;
    }
  }
  else
  {
    int v3 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315650;
    size_t v7 = "TFileBSD.cpp";
    __int16 v8 = 1024;
    int v9 = 177;
    __int16 v10 = 2080;
    __int16 v11 = "InitializeAsync";
    _os_log_impl(&dword_1ABAC8000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s", (uint8_t *)&v6, 0x1Cu);
  }
LABEL_7:
  pthread_mutex_lock(&sTFileMutex);
  if (!sReadCounter_BSD)
  {
    sReadCounter_BSD = (uint64_t)this;
    operator new();
  }
  if (kTFileBSDSubsystem)
  {
    if (*(unsigned char *)(kTFileBSDSubsystem + 8))
    {
      int v4 = *(NSObject **)kTFileBSDSubsystem;
      if (*(void *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          int v6 = 136315650;
          size_t v7 = "TFileBSD.cpp";
          __int16 v8 = 1024;
          int v9 = 194;
          __int16 v10 = 2080;
          __int16 v11 = "InitializeAsync";
          _os_log_impl(&dword_1ABAC8000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s", (uint8_t *)&v6, 0x1Cu);
        }
      }
    }
  }
  return pthread_mutex_unlock(&sTFileMutex);
}

void sub_1ABAF004C(_Unwind_Exception *a1)
{
  MEMORY[0x1AD112B70](v1, 0x10F1C4021999281);
  pthread_mutex_unlock(&sTFileMutex);
  _Unwind_Resume(a1);
}

uint64_t TFileBSD::AsyncFileIOHandler(TFileBSD *this, void *a2)
{
  uint64_t v2 = (uint64_t *)TFileBSD::sRequestBlockList;
  if (TFileBSD::sRequestBlockList)
  {
    if (!TFileBSD::sKillAsyncThread)
    {
      uint64_t v3 = TFileBSD::sGuard;
      int v4 = TFileBSD::sAsyncRequestReadIndex;
      do
      {
        uint64_t v13 = v3;
        char v14 = 0;
        char v14 = (*(uint64_t (**)(uint64_t, void *))(*(void *)v3 + 16))(v3, a2);
        if (!(*(unsigned __int8 *)(*v2 + 48 * v4) | TFileBSD::sKillAsyncThread)) {
          (*(void (**)(uint64_t))(*(void *)v3 + 56))(v3);
        }
        uint64_t v5 = v4;
        CADeprecated::CAGuard::Locker::~Locker((CADeprecated::CAGuard::Locker *)&v13);
        uint64_t v6 = *v2;
        for (uint64_t i = 48 * v4; *(unsigned char *)(v6 + i) && TFileBSD::sKillAsyncThread == 0; uint64_t i = 48 * v4)
        {
          uint64_t v9 = 3 * v5;
          uint64_t v10 = v6 + 48 * v5;
          uint64_t v11 = 16 * v9;
          fseek(*(FILE **)(*(void *)(v10 + 40) + 16), *(unsigned int *)(v10 + 24), 0);
          fread(*(void **)(v10 + 32), 1uLL, *(unsigned int *)(v10 + 28), *(FILE **)(*(void *)(v10 + 40) + 16));
          --*(_DWORD *)sReadCounter_BSD;
          uint64_t v6 = *v2;
          *(unsigned char *)(*v2 + v11) = 0;
          if (v4 + 1 <= 0) {
            int v4 = -(-(v4 + 1) & 0x7F);
          }
          else {
            int v4 = (v4 + 1) & 0x7F;
          }
          uint64_t v5 = v4;
        }
        TFileBSD::sAsyncRequestReadIndex = v4;
      }
      while (!TFileBSD::sKillAsyncThread);
    }
    TFileBSD::sKillAsyncThread = 0;
  }
  return 0;
}

void sub_1ABAF0270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void CADeprecated::CAGuard::Locker::~Locker(CADeprecated::CAGuard::Locker *this)
{
  if (*((unsigned char *)this + 8)) {
    (*(void (**)(void))(**(void **)this + 24))();
  }
}

uint64_t TFileBSD::ShutdownAsync(TFileBSD *this)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (kTFileBSDSubsystem)
  {
    uint64_t v1 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(void *)kTFileBSDSubsystem) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v1 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t v6 = 136315650;
    *(void *)&v6[4] = "TFileBSD.cpp";
    __int16 v7 = 1024;
    int v8 = 203;
    __int16 v9 = 2080;
    uint64_t v10 = "ShutdownAsync";
    _os_log_impl(&dword_1ABAC8000, v1, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s", v6, 0x1Cu);
  }
LABEL_7:
  pthread_mutex_lock(&sTFileMutex);
  if (sReadCounter_BSD)
  {
    *(void *)uint64_t v6 = TFileBSD::sGuard;
    v6[8] = (*(uint64_t (**)(uint64_t))(*(void *)TFileBSD::sGuard + 16))(TFileBSD::sGuard);
    TFileBSD::sKillAsyncThread = 1;
    (*(void (**)(uint64_t))(*(void *)TFileBSD::sGuard + 80))(TFileBSD::sGuard);
    CADeprecated::CAGuard::Locker::~Locker((CADeprecated::CAGuard::Locker *)v6);
    while (TFileBSD::sKillAsyncThread)
      usleep(0x2710u);
    if (TFileBSD::sAsyncCommandThread) {
      (*(void (**)(uint64_t))(*(void *)TFileBSD::sAsyncCommandThread + 8))(TFileBSD::sAsyncCommandThread);
    }
    if (TFileBSD::sGuard) {
      (*(void (**)(uint64_t))(*(void *)TFileBSD::sGuard + 8))(TFileBSD::sGuard);
    }
    uint64_t v2 = TFileBSD::sRequestBlockList;
    if (TFileBSD::sRequestBlockList)
    {
      uint64_t v3 = *(void **)TFileBSD::sRequestBlockList;
      if (*(void *)TFileBSD::sRequestBlockList)
      {
        *(void *)(TFileBSD::sRequestBlockList + 8) = v3;
        operator delete(v3);
      }
      MEMORY[0x1AD112B70](v2, 0x20C40960023A9);
    }
    TFileBSD::sRequestBlockList = 0;
    sReadCounter_BSD = 0;
  }
  if (kTFileBSDSubsystem)
  {
    if (*(unsigned char *)(kTFileBSDSubsystem + 8))
    {
      int v4 = *(NSObject **)kTFileBSDSubsystem;
      if (*(void *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)uint64_t v6 = 136315650;
          *(void *)&v6[4] = "TFileBSD.cpp";
          __int16 v7 = 1024;
          int v8 = 227;
          __int16 v9 = 2080;
          uint64_t v10 = "ShutdownAsync";
          _os_log_impl(&dword_1ABAC8000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s", v6, 0x1Cu);
        }
      }
    }
  }
  return pthread_mutex_unlock(&sTFileMutex);
}

void sub_1ABAF058C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t CAVectorUnit_Examine()
{
  if (getenv("CA_NoVector"))
  {
    fwrite("CA_NoVector set; Vector unit optimized routines will be bypassed\n",
      0x41uLL,
      1uLL,
      (FILE *)*MEMORY[0x1E4F143C8]);
    return 0;
  }
  else
  {
    uint64_t result = 200;
    gCAVectorUnitCFNumberType Type = 200;
  }
  return result;
}

uint64_t CAVectorUnit_GetByteWidth(int a1)
{
  if (a1 == 112) {
    int v1 = 64;
  }
  else {
    int v1 = 16;
  }
  if (a1 == 111) {
    unsigned int v2 = 32;
  }
  else {
    unsigned int v2 = v1;
  }
  if (a1) {
    return v2;
  }
  else {
    return 0;
  }
}

void XPC_Connection::~XPC_Connection(XPC_Connection *this)
{
  XPC_Connection::~XPC_Connection(this);

  JUMPOUT(0x1AD112B70);
}

{
  const void *v2;
  const void *v3;
  uint64_t vars8;

  *(void *)this = &unk_1F03030E8;
  unsigned int v2 = (const void *)*((void *)this + 3);
  if (v2)
  {
    _Block_release(v2);
    *((void *)this + 3) = 0;
  }
  uint64_t v3 = (const void *)*((void *)this + 5);
  if (v3)
  {
    _Block_release(v3);
    *((void *)this + 5) = 0;
  }

  XPC_Object::~XPC_Object(this);
}

uint64_t XPC_Connection::Finalize(uint64_t this, XPC_Connection *a2)
{
  if (this) {
    return (*(uint64_t (**)(void))(*(void *)this + 8))();
  }
  return this;
}

BOOL std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v7 = 0;
  int v4 = (*(uint64_t (**)(uint64_t, char *))(a1 + 8))(v3, &v7);
  if (!v7) {
    return 0;
  }
  int v8 = v4;
  uint64_t v5 = *(void *)(a1 + 40);
  if (!v5) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t, int *))(*(void *)v5 + 48))(v5, &v8);
  return v7 != 0;
}

void *std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::destroy(uint64_t a1)
{
  return std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100]((void *)(a1 + 16));
}

uint64_t std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::__clone(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  *a2 = &unk_1F0303638;
  a2[1] = v2;
  return std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)(a2 + 2), a1 + 16);
}

void std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::~__func(void *a1)
{
  *a1 = &unk_1F0303638;
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](a1 + 2);

  JUMPOUT(0x1AD112B70);
}

void *std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::~__func(void *a1)
{
  *a1 = &unk_1F0303638;
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](a1 + 2);
  return a1;
}

uint64_t CALog::PrefValueToPriority(const __CFString *this, BOOL *a2, BOOL *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int valuePtr = -1;
  CFTypeID v5 = CFGetTypeID(this);
  if (v5 == CFNumberGetTypeID())
  {
    CFNumberGetValue((CFNumberRef)this, kCFNumberIntType, &valuePtr);
    int v6 = valuePtr + 3;
  }
  else
  {
    if (v5 != CFStringGetTypeID()) {
      goto LABEL_22;
    }
    if (CFEqual(this, @"error"))
    {
      int v6 = 1;
      goto LABEL_23;
    }
    if (CFEqual(this, @"warning"))
    {
      int v6 = 2;
      goto LABEL_23;
    }
    if (CFEqual(this, @"note") || CFEqual(this, @"notice"))
    {
      int v6 = 3;
      goto LABEL_23;
    }
    if (CFEqual(this, @"info"))
    {
      int v6 = 4;
      goto LABEL_23;
    }
    if (CFEqual(this, @"details"))
    {
      int v6 = 5;
      goto LABEL_23;
    }
    if (CFEqual(this, @"minutiae"))
    {
      int v6 = 6;
      goto LABEL_23;
    }
    if (CFEqual(this, @"spew"))
    {
      int v6 = 7;
      goto LABEL_23;
    }
    if (!CFStringGetCString(this, buffer, 64, 0x8000100u))
    {
LABEL_22:
      int v6 = -1;
      goto LABEL_23;
    }
    int v10 = 0;
    int v7 = sscanf(buffer, "%d", &v10);
    int v6 = v10 + 3;
    if (v7 != 1) {
      int v6 = -1;
    }
  }
LABEL_23:
  *a2 = v6 > 0;
  return v6 & ~(v6 >> 31);
}

uint64_t std::__function::__func<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0,std::allocator<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0>,void ()(int)>::operator()(uint64_t result, int *a2)
{
  uint64_t v2 = 3;
  if (*a2 <= 6) {
    uint64_t v2 = 1;
  }
  *(void *)(*(void *)(result + 8) + 8) = v2;
  return result;
}

void *std::__function::__func<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0,std::allocator<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0>,void ()(int)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1F0303680;
  result[1] = v3;
  return result;
}

void std::__function::__func<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0,std::allocator<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0>,void ()(int)>::~__func()
{
}

uint64_t XPC_Service::ConnectionHandler(XPC_Service *this, _xpc_connection_s *a2)
{
  return (*(uint64_t (**)(XPC_Service *, _xpc_connection_s *))(*(void *)this + 16))(this, a2);
}

void sub_1ABAF0B38(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

void XPC_Service::~XPC_Service(XPC_Service *this)
{
}

void CAVolumeCurve::CAVolumeCurve(CAVolumeCurve *this)
{
  *(_DWORD *)this = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 1) = (char *)this + 16;
  *((unsigned char *)this + 32) = 1;
  *((_DWORD *)this + 9) = 5;
  *((void *)this + 5) = 0x3F80000040000000;
}

{
  *(_DWORD *)this = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 1) = (char *)this + 16;
  *((unsigned char *)this + 32) = 1;
  *((_DWORD *)this + 9) = 5;
  *((void *)this + 5) = 0x3F80000040000000;
}

uint64_t CAVolumeCurve::GetMinimumRaw(CAVolumeCurve *this)
{
  if (*((void *)this + 3)) {
    return *(unsigned int *)(*((void *)this + 1) + 28);
  }
  else {
    return 0;
  }
}

uint64_t CAVolumeCurve::GetMaximumRaw(CAVolumeCurve *this)
{
  uint64_t v1 = *((void *)this + 3);
  if (!v1) {
    return 0;
  }
  uint64_t v3 = (void *)*((void *)this + 1);
  std::__advance[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<CARawPoint,CADBPoint>,std::__tree_node<std::__value_type<CARawPoint,CADBPoint>,void *> *,long>>>(&v3, (int)v1 - 1);
  return *((unsigned int *)v3 + 8);
}

void **std::__advance[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<CARawPoint,CADBPoint>,std::__tree_node<std::__value_type<CARawPoint,CADBPoint>,void *> *,long>>>(void **result, uint64_t a2)
{
  if (a2 < 0)
  {
    int v7 = *result;
    do
    {
      int v8 = (void *)*v7;
      if (*v7)
      {
        do
        {
          int v4 = v8;
          int v8 = (void *)v8[1];
        }
        while (v8);
      }
      else
      {
        do
        {
          int v4 = (void *)v7[2];
          BOOL v5 = *v4 == (void)v7;
          int v7 = v4;
        }
        while (v5);
      }
      int v7 = v4;
    }
    while (!__CFADD__(a2++, 1));
  }
  else
  {
    if (!a2) {
      return result;
    }
    uint64_t v2 = *result;
    do
    {
      uint64_t v3 = (void *)v2[1];
      if (v3)
      {
        do
        {
          int v4 = v3;
          uint64_t v3 = (void *)*v3;
        }
        while (v3);
      }
      else
      {
        do
        {
          int v4 = (void *)v2[2];
          BOOL v5 = *v4 == (void)v2;
          uint64_t v2 = v4;
        }
        while (!v5);
      }
      uint64_t v2 = v4;
    }
    while (a2-- > 1);
  }
  *uint64_t result = v4;
  return result;
}

double CAVolumeCurve::GetMinimumDB(CAVolumeCurve *this)
{
  if (!*((void *)this + 3)) {
    return 0.0;
  }
  LODWORD(result) = *(_DWORD *)(*((void *)this + 1) + 36);
  return result;
}

double CAVolumeCurve::GetMaximumDB(CAVolumeCurve *this)
{
  uint64_t v1 = *((void *)this + 3);
  if (!v1) {
    return 0.0;
  }
  uint64_t v3 = (void *)*((void *)this + 1);
  std::__advance[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<CARawPoint,CADBPoint>,std::__tree_node<std::__value_type<CARawPoint,CADBPoint>,void *> *,long>>>(&v3, (int)v1 - 1);
  LODWORD(result) = *((_DWORD *)v3 + 10);
  return result;
}

uint64_t CAVolumeCurve::SetTransferFunction(uint64_t this, unsigned int a2)
{
  *(_DWORD *)(this + 36) = a2;
  if (a2 > 0xF)
  {
    float v4 = 1.0;
    float v3 = 2.0;
    char v2 = 1;
  }
  else
  {
    char v2 = byte_1ABAFBD50[a2];
    float v3 = flt_1ABAFC1A0[a2];
    float v4 = flt_1ABAFC1E0[a2];
  }
  *(unsigned char *)(this + 32) = v2;
  *(float *)(this + 4CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = v3;
  *(float *)(this + 44) = v4;
  return this;
}

void CAVolumeCurve::AddRange(CAVolumeCurve *this, signed int a2, signed int a3, double a4, float a5)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  int v6 = (void **)*((void *)this + 1);
  int v7 = (void **)((char *)this + 16);
  if (v6 == (void **)((char *)this + 16)) {
    goto LABEL_25;
  }
  do
  {
    int v8 = *((_DWORD *)v6 + 7);
    BOOL v9 = *((_DWORD *)v6 + 8) > a2 && v8 < a3;
    char v10 = v9;
    if (v9 || v8 <= a2)
    {
      uint64_t v12 = v6;
    }
    else
    {
      uint64_t v11 = (void **)v6[1];
      if (v11)
      {
        do
        {
          uint64_t v12 = v11;
          uint64_t v11 = (void **)*v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          uint64_t v12 = (void **)v6[2];
          BOOL v13 = *v12 == v6;
          int v6 = v12;
        }
        while (!v13);
      }
    }
    if (v12 == v7) {
      char v14 = 1;
    }
    else {
      char v14 = v10;
    }
    if (v14) {
      break;
    }
    int v6 = v12;
  }
  while (v8 > a2);
  if ((v10 & 1) == 0)
  {
LABEL_25:
    __int16 v15 = (char *)*v7;
    __int16 v16 = (char **)((char *)this + 16);
    uint64_t v17 = (char **)((char *)this + 16);
    if (*v7)
    {
      while (1)
      {
        while (1)
        {
          uint64_t v17 = (char **)v15;
          int v18 = *((_DWORD *)v15 + 7);
          if (v18 <= a2) {
            break;
          }
          __int16 v15 = *v17;
          __int16 v16 = v17;
          if (!*v17) {
            goto LABEL_32;
          }
        }
        if (v18 >= a2) {
          break;
        }
        __int16 v15 = v17[1];
        if (!v15)
        {
          __int16 v16 = v17 + 1;
          goto LABEL_32;
        }
      }
    }
    else
    {
LABEL_32:
      *((float *)&a4 + 1) = a5;
      double v34 = a4;
      unint64_t v35 = __PAIR64__(a3, a2);
      __int16 v19 = (char *)operator new(0x30uLL);
      *(void *)(v19 + 28) = v35;
      *(double *)(v19 + 36) = v34;
      *(void *)__int16 v19 = 0;
      *((void *)v19 + 1) = 0;
      *((void *)v19 + 2) = v17;
      *__int16 v16 = v19;
      uint64_t v20 = **((void **)this + 1);
      if (v20)
      {
        *((void *)this + 1) = v20;
        __int16 v19 = *v16;
      }
      __int16 v21 = *v7;
      BOOL v13 = v19 == *v7;
      v19[24] = v13;
      if (!v13)
      {
        do
        {
          uint64_t v22 = *((void *)v19 + 2);
          if (*(unsigned char *)(v22 + 24)) {
            break;
          }
          uint64_t v23 = *(unsigned char **)(v22 + 16);
          uint64_t v24 = *(void *)v23;
          if (*(void *)v23 == v22)
          {
            uint64_t v27 = *((void *)v23 + 1);
            if (!v27 || (v28 = *(unsigned __int8 *)(v27 + 24), int v25 = (unsigned char *)(v27 + 24), v28))
            {
              if (*(char **)v22 == v19)
              {
                float32x4_t v29 = (uint64_t *)*((void *)v19 + 2);
              }
              else
              {
                float32x4_t v29 = *(uint64_t **)(v22 + 8);
                uint64_t v30 = *v29;
                *(void *)(v22 + 8) = *v29;
                if (v30)
                {
                  *(void *)(v30 + 16) = v22;
                  uint64_t v23 = *(unsigned char **)(v22 + 16);
                }
                v29[2] = (uint64_t)v23;
                *(void *)(*(void *)(v22 + 16) + 8 * (**(void **)(v22 + 16) != v22)) = v29;
                uint64_t *v29 = v22;
                *(void *)(v22 + 16) = v29;
                uint64_t v23 = (unsigned char *)v29[2];
                uint64_t v22 = *(void *)v23;
              }
              *((unsigned char *)v29 + 24) = 1;
              v23[24] = 0;
              uint64_t v33 = *(void *)(v22 + 8);
              *(void *)uint64_t v23 = v33;
              if (v33) {
                *(void *)(v33 + 16) = v23;
              }
              *(void *)(v22 + 16) = *((void *)v23 + 2);
              *(void *)(*((void *)v23 + 2) + 8 * (**((void **)v23 + 2) != (void)v23)) = v22;
              *(void *)(v22 + 8) = v23;
              goto LABEL_60;
            }
          }
          else if (!v24 || (v26 = *(unsigned __int8 *)(v24 + 24), int v25 = (unsigned char *)(v24 + 24), v26))
          {
            if (*(char **)v22 == v19)
            {
              uint64_t v31 = *((void *)v19 + 1);
              *(void *)uint64_t v22 = v31;
              if (v31)
              {
                *(void *)(v31 + 16) = v22;
                uint64_t v23 = *(unsigned char **)(v22 + 16);
              }
              *((void *)v19 + 2) = v23;
              *(void *)(*(void *)(v22 + 16) + 8 * (**(void **)(v22 + 16) != v22)) = v19;
              *((void *)v19 + 1) = v22;
              *(void *)(v22 + 16) = v19;
              uint64_t v23 = (unsigned char *)*((void *)v19 + 2);
            }
            else
            {
              __int16 v19 = (char *)*((void *)v19 + 2);
            }
            v19[24] = 1;
            v23[24] = 0;
            uint64_t v22 = *((void *)v23 + 1);
            float v32 = *(char **)v22;
            *((void *)v23 + 1) = *(void *)v22;
            if (v32) {
              *((void *)v32 + 2) = v23;
            }
            *(void *)(v22 + 16) = *((void *)v23 + 2);
            *(void *)(*((void *)v23 + 2) + 8 * (**((void **)v23 + 2) != (void)v23)) = v22;
            *(void *)uint64_t v22 = v23;
LABEL_60:
            *((void *)v23 + 2) = v22;
            break;
          }
          *(unsigned char *)(v22 + 24) = 1;
          __int16 v19 = v23;
          v23[24] = v23 == v21;
          *int v25 = 1;
        }
        while (v23 != v21);
      }
      ++*((void *)this + 3);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 136315394;
    float32x4_t v37 = "CAVolumeCurve.cpp";
    __int16 v38 = 1024;
    int v39 = 214;
    _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  CAVolumeCurve::AddRange: new point overlaps", buf, 0x12u);
  }
}

void CAVolumeCurve::ResetRange(CAVolumeCurve *this)
{
  uint64_t v1 = (void *)((char *)this + 16);
  std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy(*((void **)this + 2));
  *(v1 - 1) = v1;
  void *v1 = 0;
  v1[1] = 0;
}

void std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy(*a1);
    std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

BOOL CAVolumeCurve::CheckForContinuity(CAVolumeCurve *this)
{
  uint64_t v1 = (char *)*((void *)this + 1);
  char v2 = (char *)this + 16;
  if (v1 == (char *)this + 16) {
    return 1;
  }
  int v3 = *((_DWORD *)v1 + 7);
  float v4 = *((float *)v1 + 9);
  do
  {
    BOOL v5 = (char *)*((void *)v1 + 1);
    int v6 = v1;
    if (v5)
    {
      do
      {
        int v7 = v5;
        BOOL v5 = *(char **)v5;
      }
      while (v5);
    }
    else
    {
      do
      {
        int v7 = (char *)*((void *)v6 + 2);
        BOOL v10 = *(void *)v7 == (void)v6;
        int v6 = v7;
      }
      while (!v10);
    }
    int v8 = *((_DWORD *)v1 + 7);
    float v9 = *((float *)v1 + 9);
    BOOL v10 = v4 == v9 && v3 == v8;
    BOOL result = v10;
    if (v7 == v2) {
      break;
    }
    int v3 = v3 - v8 + *((_DWORD *)v1 + 8);
    float v4 = v4 + (float)(*((float *)v1 + 10) - v9);
    uint64_t v1 = v7;
  }
  while (result);
  return result;
}

uint64_t CAVolumeCurve::ConvertDBToRaw(CAVolumeCurve *this, float a2)
{
  if (*((void *)this + 3)) {
    float v4 = *(float *)(*((void *)this + 1) + 36);
  }
  else {
    float v4 = 0.0;
  }
  double MaximumDB = CAVolumeCurve::GetMaximumDB(this);
  if (v4 <= a2) {
    float v6 = a2;
  }
  else {
    float v6 = v4;
  }
  if (v6 <= *(float *)&MaximumDB) {
    *(float *)&double MaximumDB = v6;
  }
  int v7 = (void *)*((void *)this + 1);
  uint64_t result = *((unsigned int *)v7 + 7);
  if (v7 != (void *)((char *)this + 16))
  {
    do
    {
      int v9 = *((_DWORD *)v7 + 8) - *((_DWORD *)v7 + 7);
      float v10 = *((float *)v7 + 10);
      if (*(float *)&MaximumDB > v10)
      {
        uint64_t result = (v9 + result);
      }
      else
      {
        unsigned int v11 = llroundf((float)(*(float *)&MaximumDB - *((float *)v7 + 9))/ (float)((float)(v10 - *((float *)v7 + 9)) / (float)v9));
        BOOL v12 = __OFADD__(result, v11);
        unsigned int v13 = result + v11;
        unsigned int v14 = ((int)(result | v11) >> 31) ^ 0x7FFFFFFF;
        if (v12) {
          uint64_t result = v14;
        }
        else {
          uint64_t result = v13;
        }
      }
      __int16 v15 = (void *)v7[1];
      if (v15)
      {
        do
        {
          __int16 v16 = v15;
          __int16 v15 = (void *)*v15;
        }
        while (v15);
      }
      else
      {
        do
        {
          __int16 v16 = (void *)v7[2];
          BOOL v17 = *v16 == (void)v7;
          int v7 = v16;
        }
        while (!v17);
      }
      BOOL v17 = *(float *)&MaximumDB <= v10 || v16 == (void *)((char *)this + 16);
      int v7 = v16;
    }
    while (!v17);
  }
  return result;
}

uint64_t CAVolumeCurve::ConvertRawToDB(CAVolumeCurve *this, int a2)
{
  if (*((void *)this + 3)) {
    int v4 = *(_DWORD *)(*((void *)this + 1) + 28);
  }
  else {
    int v4 = 0;
  }
  uint64_t result = CAVolumeCurve::GetMaximumRaw(this);
  if (v4 <= a2) {
    int v6 = a2;
  }
  else {
    int v6 = v4;
  }
  if (v6 >= (int)result) {
    int v6 = result;
  }
  int v7 = v6 - v4;
  int v8 = (float *)*((void *)this + 1);
  float v9 = v8[9];
  float v10 = (float *)((char *)this + 16);
  BOOL v11 = v7 < 1 || v8 == v10;
  if (!v11)
  {
    do
    {
      int v12 = *((_DWORD *)v8 + 8) - *((_DWORD *)v8 + 7);
      if (v7 >= v12) {
        int v13 = *((_DWORD *)v8 + 8) - *((_DWORD *)v8 + 7);
      }
      else {
        int v13 = v7;
      }
      unsigned int v14 = (float *)*((void *)v8 + 1);
      __int16 v15 = v8;
      if (v14)
      {
        do
        {
          __int16 v16 = v14;
          unsigned int v14 = *(float **)v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          __int16 v16 = (float *)*((void *)v15 + 2);
          BOOL v11 = *(void *)v16 == (void)v15;
          __int16 v15 = v16;
        }
        while (!v11);
      }
      float v9 = v9 + (float)((float)v13 * (float)((float)(v8[10] - v8[9]) / (float)v12));
      v7 -= v13;
      if (v7 < 1) {
        break;
      }
      int v8 = v16;
    }
    while (v16 != v10);
  }
  return result;
}

float CAVolumeCurve::ConvertRawToScalar(CAVolumeCurve *this, int a2)
{
  if (*((void *)this + 3)) {
    int v4 = *(_DWORD *)(*((void *)this + 1) + 28);
  }
  else {
    int v4 = 0;
  }
  int MaximumRaw = CAVolumeCurve::GetMaximumRaw(this);
  if (v4 <= a2) {
    int v6 = a2;
  }
  else {
    int v6 = v4;
  }
  if (v6 >= MaximumRaw) {
    int v6 = MaximumRaw;
  }
  float v7 = (float)(v6 - v4) / (float)(MaximumRaw - v4);
  if (!CAVolumeCurve::GetIsApplyingTransferFunction(this)) {
    return v7;
  }
  float v8 = *((float *)this + 10) / *((float *)this + 11);

  return powf(v7, v8);
}

BOOL CAVolumeCurve::GetIsApplyingTransferFunction(CAVolumeCurve *this)
{
  if (*((void *)this + 3)) {
    float v2 = *(float *)(*((void *)this + 1) + 36);
  }
  else {
    float v2 = 0.0;
  }
  double MaximumDB = CAVolumeCurve::GetMaximumDB(this);
  return (float)(*(float *)&MaximumDB - v2) > 30.0 && *((unsigned char *)this + 32) != 0;
}

float CAVolumeCurve::ConvertDBToScalar(CAVolumeCurve *this, float a2)
{
  int v3 = CAVolumeCurve::ConvertDBToRaw(this, a2);

  return CAVolumeCurve::ConvertRawToScalar(this, v3);
}

uint64_t CAVolumeCurve::ConvertScalarToRaw(CAVolumeCurve *this, float a2)
{
  float v3 = fmaxf(a2, 0.0);
  if (*((void *)this + 3)) {
    int v4 = *(_DWORD *)(*((void *)this + 1) + 28);
  }
  else {
    int v4 = 0;
  }
  float v5 = fminf(v3, 1.0);
  int MaximumRaw = CAVolumeCurve::GetMaximumRaw(this);
  if (CAVolumeCurve::GetIsApplyingTransferFunction(this)) {
    float v5 = powf(v5, *((float *)this + 11) / *((float *)this + 10));
  }
  unsigned int v7 = llroundf(v5 * (float)(MaximumRaw - v4));
  BOOL v8 = __OFADD__(v4, v7);
  unsigned int v9 = v4 + v7;
  unsigned int v10 = ((int)(v4 | v7) >> 31) ^ 0x7FFFFFFF;
  if (v8) {
    return v10;
  }
  else {
    return v9;
  }
}

uint64_t CAVolumeCurve::ConvertScalarToDB(CAVolumeCurve *this, float a2)
{
  int v3 = CAVolumeCurve::ConvertScalarToRaw(this, a2);

  return CAVolumeCurve::ConvertRawToDB(this, v3);
}

void ResamplerInitLocker::ResamplerInitLocker(ResamplerInitLocker *this)
{
}

{
  pthread_mutex_lock(&sInitLocker);
}

void ResamplerInitLocker::~ResamplerInitLocker(ResamplerInitLocker *this)
{
}

{
  pthread_mutex_unlock(&sInitLocker);
}

void CADeserializer::CADeserializer(CADeserializer *this, CFTypeRef cf)
{
  *((unsigned char *)this + 32) = 0;
  *(void *)this = cf;
  CFRetain(cf);
  BytePtr = CFDataGetBytePtr((CFDataRef)cf);
  *((void *)this + 1) = BytePtr;
  *((void *)this + 2) = BytePtr;
  *((void *)this + 3) = &BytePtr[CFDataGetLength((CFDataRef)cf)];
}

CFDataRef CADeserializer::ReadAllData(CADeserializer *this)
{
  uint64_t v1 = (const UInt8 *)*((void *)this + 2);
  CFIndex v2 = (*((_DWORD *)this + 6) - v1);
  if (*((void *)this + 3) - (void)v1 >= v2)
  {
    *((void *)this + 2) = &v1[v2];
  }
  else
  {
    uint64_t v1 = 0;
    *((unsigned char *)this + 32) = 1;
  }
  return CFDataCreate(0, v1, v2);
}

void CASerializer::WriteData(__CFData **this, CFDataRef theData)
{
  int v3 = *this;
  if (*this)
  {
    BytePtr = CFDataGetBytePtr(theData);
    CFIndex Length = CFDataGetLength(theData);
    CFDataAppendBytes(v3, BytePtr, Length);
  }
  else
  {
    *this = CFDataCreateMutableCopy(0, 0, theData);
  }
}

UInt8 *CASerializer::AllocWritePtr(const __CFData **this, unsigned int a2, int a3)
{
  CASerializer::PrepareToWrite(this, a3);
  int Length = CFDataGetLength(*this);
  CFDataIncreaseLength(*this, a2);
  return &CFDataGetMutableBytePtr(*this)[Length];
}

void CASerializer::WritePlist(const __CFData **this, const void *a2)
{
  CFDataRef Data = CFPropertyListCreateData(0, a2, kCFPropertyListXMLFormat_v1_0, 0, 0);
  CFDataRef v4 = Data;
  operator<<(this, &v4);
  if (Data)
  {
    CFRelease(Data);
  }
}

CFPropertyListRef CADeserializer::ReadPlist(CADeserializer *this)
{
  CFDataRef data = 0;
  operator>>((uint64_t)this, &data);
  CFDataRef v1 = data;
  if (!data) {
    return 0;
  }
  CFPropertyListRef v2 = CFPropertyListCreateWithData(0, data, 0, 0, 0);
  CFRelease(v1);
  return v2;
}

const __CFData **operator<<(const __CFData **a1, CFStringRef *a2)
{
  if (*a2) {
    int Length = CFStringGetLength(*a2);
  }
  else {
    int Length = -1;
  }
  *(_DWORD *)bytes = Length;
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, bytes, 4);
  CFIndex v5 = *(unsigned int *)bytes;
  if (*(int *)bytes >= 1)
  {
    CFStringRef v6 = *a2;
    unsigned int v7 = CASerializer::AllocWritePtr(a1, 2 * *(_DWORD *)bytes, 0);
    v10.location = 0;
    v10.length = v5;
    CFStringGetCharacters(v6, v10, (UniChar *)v7);
  }
  return a1;
}

uint64_t operator>>(uint64_t a1, CFStringRef *a2)
{
  Ptr = (unsigned int *)CADeserializer::GetAndAdvanceReadPtr((CADeserializer *)a1, 4u, 4);
  if (Ptr)
  {
    unsigned int v5 = *Ptr;
    if ((*Ptr & 0x80000000) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    unsigned int v5 = 0;
  }
  if (!*(unsigned char *)(a1 + 32))
  {
    unint64_t v8 = 2 * v5;
    unsigned int v9 = *(const UniChar **)(a1 + 16);
    if (*(void *)(a1 + 24) - (void)v9 < (int64_t)v8)
    {
      CFStringRef v6 = 0;
      *(unsigned char *)(a1 + 32) = 1;
      goto LABEL_7;
    }
    *(void *)(a1 + 16) = &v9[v8 / 2];
    if (v9)
    {
      CFStringRef v6 = CFStringCreateWithCharacters(0, v9, v5);
      goto LABEL_7;
    }
  }
LABEL_6:
  CFStringRef v6 = 0;
LABEL_7:
  *a2 = v6;
  return a1;
}

const __CFData **operator<<(const __CFData **a1, CFURLRef *a2)
{
  CFURLRef v3 = CFURLCopyAbsoluteURL(*a2);
  CFStringRef v5 = CFURLGetString(v3);
  operator<<(a1, &v5);
  CFRelease(v3);
  return a1;
}

uint64_t operator>>(uint64_t a1, CFURLRef *a2)
{
  CFStringRef URLString = 0;
  operator>>(a1, &URLString);
  CFStringRef v4 = URLString;
  if (URLString)
  {
    *a2 = CFURLCreateWithString(0, URLString, 0);
    CFRelease(v4);
  }
  else
  {
    *a2 = 0;
  }
  return a1;
}

CADeserializer *operator>>(CADeserializer *a1, uint64_t a2)
{
  Ptr = (uint64_t *)CADeserializer::GetAndAdvanceReadPtr(a1, 8u, 8);
  if (Ptr) {
    uint64_t v5 = *Ptr;
  }
  else {
    uint64_t v5 = 0;
  }
  *(void *)a2 = v5;
  CFStringRef v6 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (v6) {
    int v7 = *v6;
  }
  else {
    int v7 = 0;
  }
  *(_DWORD *)(a2 + 8) = v7;
  unint64_t v8 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (v8) {
    int v9 = *v8;
  }
  else {
    int v9 = 0;
  }
  *(_DWORD *)(a2 + 12) = v9;
  CFRange v10 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (v10) {
    int v11 = *v10;
  }
  else {
    int v11 = 0;
  }
  *(_DWORD *)(a2 + 16) = v11;
  int v12 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (v12) {
    int v13 = *v12;
  }
  else {
    int v13 = 0;
  }
  *(_DWORD *)(a2 + 2CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = v13;
  unsigned int v14 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (v14) {
    int v15 = *v14;
  }
  else {
    int v15 = 0;
  }
  *(_DWORD *)(a2 + 24) = v15;
  __int16 v16 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (v16) {
    int v17 = *v16;
  }
  else {
    int v17 = 0;
  }
  *(_DWORD *)(a2 + 28) = v17;
  int v18 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (v18) {
    int v19 = *v18;
  }
  else {
    int v19 = 0;
  }
  *(_DWORD *)(a2 + 32) = v19;
  uint64_t v20 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (v20) {
    int v21 = *v20;
  }
  else {
    int v21 = 0;
  }
  *(_DWORD *)(a2 + 36) = v21;
  return a1;
}

CADeserializer *operator>>(CADeserializer *a1, void *a2)
{
  Ptr = (uint64_t *)CADeserializer::GetAndAdvanceReadPtr(a1, 8u, 8);
  if (Ptr) {
    uint64_t v5 = *Ptr;
  }
  else {
    uint64_t v5 = 0;
  }
  *a2 = v5;
  CFStringRef v6 = (uint64_t *)CADeserializer::GetAndAdvanceReadPtr(a1, 8u, 8);
  if (v6) {
    uint64_t v7 = *v6;
  }
  else {
    uint64_t v7 = 0;
  }
  a2[1] = v7;
  return a1;
}

BOOL CADeprecated::CAMutex::IsOwnedByCurrentThread(atomic_ullong *this)
{
  CFPropertyListRef v2 = pthread_self();
  return pthread_equal(v2, (pthread_t)atomic_load_explicit(this + 2, memory_order_acquire)) != 0;
}

BOOL CADeprecated::CAMutex::IsFree(atomic_ullong *this)
{
  return atomic_load_explicit(this + 2, memory_order_acquire) == 0;
}

CADeprecated::CAMutex::Unlocker *CADeprecated::CAMutex::Unlocker::Unlocker(CADeprecated::CAMutex::Unlocker *this, CADeprecated::CAMutex *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  *(void *)this = a2;
  *((unsigned char *)this + 8) = 0;
  if (((*(uint64_t (**)(CADeprecated::CAMutex *))(*(void *)a2 + 48))(a2) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      uint64_t v5 = "CAMutex.cpp";
      __int16 v6 = 1024;
      int v7 = 304;
      _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d  Major problem: Unlocker attempted to unlock a mutex not owned by the current thread!", (uint8_t *)&v4, 0x12u);
    }
    __break(1u);
  }
  (*(void (**)(void))(**(void **)this + 24))();
  *((unsigned char *)this + 8) = 1;
  return this;
}

void CADeprecated::CAMutex::Unlocker::~Unlocker(CADeprecated::CAMutex::Unlocker *this)
{
  if (*((unsigned char *)this + 8)) {
    (*(void (**)(void))(**(void **)this + 16))();
  }
}

void PowerMeter::PowerMeter(PowerMeter *this)
{
  *(unsigned char *)this = 0;
  *(_OWORD *)((char *)this + 8) = xmmword_1ABAFBD20;
  *(_OWORD *)((char *)this + 24) = xmmword_1ABAFBD30;
  *((void *)this + 8) = 0;
  *((_WORD *)this + 28) = 0;
  *((void *)this + 1CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 13) = 0;
  *((void *)this + 14) = 0;
  *((void *)this + 15) = 0;
  *((void *)this + 5) = 0x3F90624DD2F1A9FCLL;
  *((void *)this + 6) = 0xFFFFFFFFLL;
}

{
  *(unsigned char *)this = 0;
  *(_OWORD *)((char *)this + 8) = xmmword_1ABAFBD20;
  *(_OWORD *)((char *)this + 24) = xmmword_1ABAFBD30;
  *((void *)this + 8) = 0;
  *((_WORD *)this + 28) = 0;
  *((void *)this + 1CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 13) = 0;
  *((void *)this + 14) = 0;
  *((void *)this + 15) = 0;
  *((void *)this + 5) = 0x3F90624DD2F1A9FCLL;
  *((void *)this + 6) = 0xFFFFFFFFLL;
}

uint64_t PowerMeter::Reset(uint64_t this)
{
  *(void *)(this + 64) = 0;
  *(_WORD *)(this + 56) = 0;
  *(void *)(this + 8CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 0;
  *(void *)(this + 88) = 0;
  *(void *)(this + 96) = 0;
  *(void *)(this + 104) = 0;
  *(void *)(this + 112) = 0;
  *(void *)(this + 12CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 0;
  *(void *)(this + 48) = 0xFFFFFFFFLL;
  return this;
}

uint64_t PowerMeter::ClearClipping(uint64_t this)
{
  *(_WORD *)(this + 56) = 0;
  *(_DWORD *)(this + 52) = 0;
  return this;
}

void PowerMeter::SetSampleRate(PowerMeter *this, double a2)
{
  *((double *)this + 1) = a2;
  double v4 = a2 * 2.5;
  if (v4 >= 2.22507386e-308) {
    double v5 = -6.90775528 / v4;
  }
  else {
    double v5 = -INFINITY;
  }
  double v6 = exp(v5);
  if (v5 < -708.4) {
    double v6 = 0.0;
  }
  *((double *)this + 2) = v6;
  if (a2 * 1.24 >= 2.22507386e-308) {
    double v7 = -6.90775528 / (a2 * 1.24);
  }
  else {
    double v7 = -INFINITY;
  }
  double v8 = exp(v7);
  if (v7 < -708.4) {
    double v8 = 0.0;
  }
  *((double *)this + 4) = v8;
}

double PowerMeter::ProcessSilence(PowerMeter *this)
{
  *((void *)this + 8) = 0;
  double result = 0.0;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  return result;
}

void PowerMeter::ScaleDecayConstants(PowerMeter *this, int a2)
{
  if (*((_DWORD *)this + 12) != a2)
  {
    if (*((double *)this + 1) == 0.0)
    {
      *(_OWORD *)((char *)this + 8) = xmmword_1ABAFBD40;
      *((void *)this + 4) = 0x3FEFFEF71A09F35FLL;
      long double v4 = 0.999937347;
      long double v5 = 0.999873687;
    }
    else
    {
      long double v4 = *((double *)this + 2);
      long double v5 = *((double *)this + 4);
    }
    *((long double *)this + 3) = 1.0 - pow(v4, (double)a2);
    *((long double *)this + 5) = 1.0 - pow(v5, (double)a2);
    *((_DWORD *)this + 12) = a2;
  }
}

long double PowerMeter::LinearToDB(PowerMeter *this, long double a2)
{
  if (a2 <= 0.000001) {
    return -120.0;
  }
  if (a2 < 2.22507386e-308) {
    a2 = 2.22507386e-308;
  }
  return log10(a2) * 20.0;
}

uint64_t PowerMeter::Process(PowerMeter *this, float *a2, int a3, int a4)
{
  double v6 = a2;
  uint64_t v31 = a2;
  PowerMeter::ScaleDecayConstants(this, a4);
  int v30 = a4;
  double v8 = *((double *)this + 8);
  double v29 = v8;
  float v28 = 0.0;
  uint64_t result = gCAVectorUnitType;
  if (gCAVectorUnitType == -1) {
    uint64_t result = CAVectorUnit_Examine();
  }
  float v10 = 0.0;
  int v11 = a4;
  if ((v6 & 0xF) == 0 && (int)result >= 1)
  {
    uint64_t result = (uint64_t)PowerMeter::ProcessVector((float32x4_t *)this, (const float **)&v31, &v30, &v28, &v29);
    int v11 = v30;
    double v6 = v31;
    float v10 = v28;
    double v8 = v29;
  }
  if (v11 >= 1)
  {
    do
    {
      float v12 = *v6;
      if (*v6 < 0.0) {
        float v12 = -*v6;
      }
      if (v12 > v10) {
        float v10 = v12;
      }
      double v8 = v8 + ((float)(v12 * v12) - v8) * 0.03;
      v6 += a3;
      --v11;
    }
    while (v11);
  }
  if (v10 > *((float *)this + 13)) {
    *((float *)this + 13) = v10;
  }
  if (v8 != 0.0 && fabs(v8) == INFINITY)
  {
    *((unsigned char *)this + 56) = 1;
    double v8 = 0.0;
    float v10 = 1.0;
  }
  int v13 = *(unsigned __int8 *)this;
  if (*(unsigned char *)this)
  {
    v14.f64[0] = v10;
  }
  else
  {
    double v15 = *((double *)this + 13);
    v14.f64[0] = v10;
    if (v15 > v14.f64[0]) {
      v14.f64[0] = v15 + (v14.f64[0] - v15) * *((double *)this + 5);
    }
  }
  int v16 = *((_DWORD *)this + 25) + a4;
  *((_DWORD *)this + 25) = v16;
  double v17 = *((double *)this + 15);
  if (v16 >= (int)(*((double *)this + 1) * 0.907029478)) {
    double v17 = v17 - v17 * *((double *)this + 3);
  }
  double v18 = sqrt(v8);
  if (v17 < v14.f64[0])
  {
    *((_DWORD *)this + 25) = 0;
    double v17 = v14.f64[0];
  }
  double v19 = v18 * 1.41421356;
  if (!v13)
  {
    double v20 = *((double *)this + 14);
    if (v20 > v19) {
      double v19 = v20 + (v19 - v20) * *((double *)this + 5);
    }
  }
  if (v19 > v17) {
    double v19 = v17;
  }
  double v21 = fabs(v8);
  if (v21 >= 1.0e15 || v21 <= 1.0e-15) {
    double v23 = 0.0;
  }
  else {
    double v23 = v8;
  }
  v14.f64[1] = v19;
  *((double *)this + 8) = v23;
  float64x2_t v24 = vabsq_f64(v14);
  *(int8x16_t *)((char *)this + 104) = vandq_s8((int8x16_t)v14, vandq_s8((int8x16_t)vcgtq_f64(v24, (float64x2_t)vdupq_n_s64(0x3CD203AF9EE75616uLL)), (int8x16_t)vcgtq_f64((float64x2_t)vdupq_n_s64(0x430C6BF526340000uLL), v24)));
  double v25 = fabs(v17);
  if (v25 >= 1.0e15 || v25 <= 1.0e-15) {
    double v27 = 0.0;
  }
  else {
    double v27 = v17;
  }
  *((double *)this + 15) = v27;
  return result;
}

float32x4_t *PowerMeter::ProcessVector(float32x4_t *this, const float **a2, int *a3, float *a4, double *a5)
{
  float32x4_t v5 = this[5];
  int v6 = *a3;
  double v7 = *a2;
  float32x4_t v8 = 0uLL;
  if ((*a3 + 3) >= 7)
  {
    if (v6 < 0) {
      int v6 = *a3 + 3;
    }
    int v9 = v6 >> 2;
    uint64_t v10 = 16 * (v9 - 1);
    float32x4_t v11 = (float32x4_t)vdupq_n_s32(0x3DEAEB81u);
    float v12 = (float32x4_t *)*a2;
    do
    {
      float32x4_t v13 = *v12++;
      float32x4_t v8 = vmaxq_f32(v8, vabsq_f32(v13));
      float32x4_t v5 = vmlaq_f32(v5, v11, vsubq_f32(vmulq_f32(v13, v13), v5));
      --v9;
    }
    while (v9);
    double v7 = (const float *)((char *)v7 + v10 + 16);
  }
  *a2 = v7;
  this[5] = v8;
  *a4 = v8.f32[0];
  float v14 = this[5].f32[1];
  if (v14 > v8.f32[0])
  {
    *a4 = v14;
    v8.f32[0] = v14;
  }
  float v15 = this[5].f32[2];
  if (v15 > v8.f32[0])
  {
    *a4 = v15;
    v8.f32[0] = v15;
  }
  float v16 = this[5].f32[3];
  if (v16 > v8.f32[0]) {
    *a4 = v16;
  }
  this[5] = v5;
  *a5 = vaddq_f32(vaddq_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 1), v5), (float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 2)), (float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 3)).f32[0]* 0.25;
  float32x4_t v17 = this[5];
  float32x4_t v18 = vabsq_f32(v17);
  float64x2_t v19 = vcvt_hight_f64_f32(v18);
  float64x2_t v20 = vcvtq_f64_f32(*(float32x2_t *)v18.f32);
  float64x2_t v21 = (float64x2_t)vdupq_n_s64(0x3CD203AF9EE75616uLL);
  float64x2_t v22 = (float64x2_t)vdupq_n_s64(0x430C6BF526340000uLL);
  this[5] = (float32x4_t)vandq_s8((int8x16_t)v17, (int8x16_t)vuzp1q_s32((int32x4_t)vandq_s8((int8x16_t)vcgtq_f64(v20, v21), (int8x16_t)vcgtq_f64(v22, v20)), (int32x4_t)vandq_s8((int8x16_t)vcgtq_f64(v19, v21), (int8x16_t)vcgtq_f64(v22, v19))));
  int v23 = *a3 & 3;
  if (*a3 <= 0) {
    int v23 = -(-*a3 & 3);
  }
  *a3 = v23;
  return this;
}

unsigned __int8 *PowerMeter::SavePeaks(unsigned __int8 *this, int a2, int a3, int a4)
{
  float v4 = (double)a4 * 0.0000305175781;
  *((_DWORD *)this + 24) = a3;
  int v5 = *this;
  if (*this)
  {
    double v6 = v4;
  }
  else
  {
    double v7 = *((double *)this + 13);
    double v6 = v4;
    if (v7 > v6) {
      double v6 = v7 + (v6 - v7) * *((double *)this + 5);
    }
  }
  *((double *)this + 13) = v6;
  int v8 = *((_DWORD *)this + 25) + a2;
  *((_DWORD *)this + 25) = v8;
  double v9 = *((double *)this + 15);
  if (v8 >= (int)(*((double *)this + 1) * 0.907029478))
  {
    double v9 = v9 - v9 * *((double *)this + 3);
    *((double *)this + 15) = v9;
  }
  double v10 = sqrt((double)a3 * 9.31322575e-10);
  if (v9 < v6)
  {
    *((double *)this + 15) = v6;
    *((_DWORD *)this + 25) = 0;
    double v9 = v6;
  }
  double v11 = v10 * 1.41421356;
  if (!v5)
  {
    double v12 = *((double *)this + 14);
    if (v12 > v11) {
      double v11 = v12 + (v11 - v12) * *((double *)this + 5);
    }
  }
  *((double *)this + 14) = v11;
  if (v11 > v9) {
    *((double *)this + 14) = v9;
  }
  return this;
}

unsigned __int8 *PowerMeter::Process_Int16(PowerMeter *this, const __int16 *a2, int a3, int a4)
{
  PowerMeter::ScaleDecayConstants(this, a4);
  int v8 = *((_DWORD *)this + 24);
  if (a4 < 1)
  {
    int v9 = 0;
  }
  else
  {
    int v9 = 0;
    unsigned int v10 = a4 + 1;
    do
    {
      int v11 = *a2;
      if (v11 < 0) {
        int v11 = -v11;
      }
      if (v9 <= v11) {
        int v9 = v11;
      }
      v8 += (v11 * v11 - v8) >> 5;
      --v10;
      a2 += a3;
    }
    while (v10 > 1);
  }

  return PowerMeter::SavePeaks((unsigned __int8 *)this, a4, v8, v9);
}

unsigned __int8 *PowerMeter::Process_Int32(PowerMeter *this, const int *a2, int a3, int a4)
{
  PowerMeter::ScaleDecayConstants(this, a4);
  int v8 = *((_DWORD *)this + 24);
  if (a4 < 1)
  {
    int v9 = 0;
  }
  else
  {
    int v9 = 0;
    unsigned int v10 = a4 + 1;
    do
    {
      if (*a2 >= 0) {
        int v11 = *a2 >> 9;
      }
      else {
        int v11 = -(*a2 >> 9);
      }
      if (v11 > v9) {
        int v9 = v11;
      }
      v8 += (v11 * v11 - v8) >> 5;
      --v10;
      a2 += a3;
    }
    while (v10 > 1);
  }

  return PowerMeter::SavePeaks((unsigned __int8 *)this, a4, v8, v9);
}

uint64_t TStream::ReadByte(TStream *this)
{
  unsigned __int8 v2 = 0;
  (*(void (**)(TStream *, unsigned __int8 *, uint64_t))(*(void *)this + 16))(this, &v2, 1);
  return v2;
}

uint64_t TStream::ReadBig16(TStream *this)
{
  unsigned __int16 v2 = 0;
  (*(void (**)(TStream *, unsigned __int16 *, uint64_t))(*(void *)this + 16))(this, &v2, 2);
  return bswap32(v2) >> 16;
}

uint64_t TStream::ReadBig32(TStream *this)
{
  unsigned int v2 = 0;
  (*(void (**)(TStream *, unsigned int *, uint64_t))(*(void *)this + 16))(this, &v2, 4);
  return bswap32(v2);
}

float TStream::ReadBigFloat32(TStream *this)
{
  unsigned int v2 = 0;
  (*(void (**)(TStream *, unsigned int *, uint64_t))(*(void *)this + 16))(this, &v2, 4);
  return COERCE_FLOAT(bswap32(v2));
}

double TStream::ReadBigFloat64(TStream *this)
{
  unint64_t v2 = 0;
  (*(void (**)(TStream *, unint64_t *, uint64_t))(*(void *)this + 16))(this, &v2, 8);
  return COERCE_DOUBLE(bswap64(v2));
}

uint64_t TStream::ReadLittle16(TStream *this)
{
  unsigned __int16 v2 = 0;
  (*(void (**)(TStream *, unsigned __int16 *, uint64_t))(*(void *)this + 16))(this, &v2, 2);
  return v2;
}

uint64_t TStream::ReadLittle32(TStream *this)
{
  unsigned int v2 = 0;
  (*(void (**)(TStream *, unsigned int *, uint64_t))(*(void *)this + 16))(this, &v2, 4);
  return v2;
}

float TStream::ReadLittleFloat32(TStream *this)
{
  float v2 = 0.0;
  (*(void (**)(TStream *, float *, uint64_t))(*(void *)this + 16))(this, &v2, 4);
  return v2;
}

double TStream::ReadLittleFloat64(TStream *this)
{
  double v2 = 0.0;
  (*(void (**)(TStream *, double *, uint64_t))(*(void *)this + 16))(this, &v2, 8);
  return v2;
}

uint64_t TStream::WriteByte(TStream *this, char a2)
{
  char v3 = a2;
  return (*(uint64_t (**)(TStream *, char *, uint64_t))(*(void *)this + 24))(this, &v3, 1);
}

uint64_t TStream::WriteBig16(TStream *this, unsigned int a2)
{
  __int16 v3 = __rev16(a2);
  return (*(uint64_t (**)(TStream *, __int16 *, uint64_t))(*(void *)this + 24))(this, &v3, 2);
}

uint64_t TStream::WriteBig32(TStream *this, unsigned int a2)
{
  unsigned int v3 = bswap32(a2);
  return (*(uint64_t (**)(TStream *, unsigned int *, uint64_t))(*(void *)this + 24))(this, &v3, 4);
}

uint64_t TStream::WriteBigFloat32(TStream *this, float a2)
{
  unsigned int v3 = bswap32(LODWORD(a2));
  return (*(uint64_t (**)(TStream *, unsigned int *, uint64_t))(*(void *)this + 24))(this, &v3, 4);
}

uint64_t TStream::WriteBigFloat64(TStream *this, double a2)
{
  unint64_t v3 = bswap64(*(unint64_t *)&a2);
  return (*(uint64_t (**)(TStream *, unint64_t *, uint64_t))(*(void *)this + 24))(this, &v3, 8);
}

uint64_t TStream::WriteLittle16(TStream *this, __int16 a2)
{
  __int16 v3 = a2;
  return (*(uint64_t (**)(TStream *, __int16 *, uint64_t))(*(void *)this + 24))(this, &v3, 2);
}

uint64_t TStream::WriteLittle32(TStream *this, int a2)
{
  int v3 = a2;
  return (*(uint64_t (**)(TStream *, int *, uint64_t))(*(void *)this + 24))(this, &v3, 4);
}

uint64_t TStream::WriteLittleFloat32(TStream *this, float a2)
{
  float v3 = a2;
  return (*(uint64_t (**)(TStream *, float *, uint64_t))(*(void *)this + 24))(this, &v3, 4);
}

uint64_t TStream::WriteLittleFloat64(TStream *this, double a2)
{
  double v3 = a2;
  return (*(uint64_t (**)(TStream *, double *, uint64_t))(*(void *)this + 24))(this, &v3, 8);
}

uint64_t CADeprecated::CABufferList::AllocateBuffers(uint64_t this, unsigned int a2)
{
  if (*(_DWORD *)(this + 36) < a2) {
    operator new[]();
  }
  return this;
}

uint64_t CADeprecated::CABufferList::AllocateBuffersAndCopyFrom(uint64_t this, unsigned int a2, CADeprecated::CABufferList *a3, CADeprecated::CABufferList *a4)
{
  int v4 = *(_DWORD *)(this + 24);
  if (v4 == *((_DWORD *)a3 + 6) && v4 == *((_DWORD *)a4 + 6))
  {
    uint64_t v8 = this;
    unsigned int v9 = *(_DWORD *)(this + 36);
    this = CADeprecated::CABufferList::VerifyNotTrashingOwnedBuffer(*((void *)a4 + 1));
    unsigned int v10 = *((_DWORD *)a3 + 9);
    int v11 = *(_DWORD *)(v8 + 24);
    if (v9 < a2) {
      operator new[]();
    }
    if (v11)
    {
      double v12 = (void *)((char *)a4 + 40);
      float32x4_t v13 = (unsigned int *)((char *)a3 + 36);
      float v14 = (void **)(v8 + 40);
      do
      {
        --v11;
        this = (uint64_t)memmove(*v14, *(const void **)(v13 + 1), *v13);
        float v15 = *v14;
        v14 += 2;
        *double v12 = v15;
        LODWORD(v15) = *v13;
        v13 += 4;
        *((_DWORD *)v12 - 1) = v15;
        v12 += 2;
      }
      while (v11);
    }
    if (a3 != a4)
    {
      return CADeprecated::CABufferList::BytesConsumed(a3, v10);
    }
  }
  return this;
}

uint64_t CADeprecated::CABufferList::VerifyNotTrashingOwnedBuffer(uint64_t this)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (this)
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      int v1 = 136315394;
      double v2 = "CABufferList.h";
      __int16 v3 = 1024;
      int v4 = 276;
      _os_log_impl(&dword_1ABAC8000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(mBufferMemory == __null) != 0 is false]: ", (uint8_t *)&v1, 0x12u);
    }
    __break(1u);
  }
  return this;
}

uint64_t CADeprecated::CABufferList::BytesConsumed(CADeprecated::CABufferList *this, unsigned int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t result = CADeprecated::CABufferList::VerifyNotTrashingOwnedBuffer(*((void *)this + 1));
  int v5 = *((_DWORD *)this + 6);
  if (v5)
  {
    double v6 = (void *)((char *)this + 40);
    do
    {
      unsigned int v7 = *((_DWORD *)v6 - 1);
      BOOL v8 = v7 >= a2;
      unsigned int v9 = v7 - a2;
      if (!v8)
      {
        if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
        {
          int v11 = 136315394;
          double v12 = "CABufferList.h";
          __int16 v13 = 1024;
          int v14 = 184;
          _os_log_impl(&dword_1ABAC8000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(nBytes <= buf->mDataByteSize) != 0 is false]: ", (uint8_t *)&v11, 0x12u);
        }
        __break(1u);
      }
      *v6 += a2;
      *((_DWORD *)v6 - 1) = v9;
      v6 += 2;
      --v5;
    }
    while (v5);
  }
  return result;
}

uint64_t CADeprecated::CABufferList::DeallocateBuffers(CADeprecated::CABufferList *this)
{
  int v2 = *((_DWORD *)this + 6);
  if (v2)
  {
    __int16 v3 = (void *)((char *)this + 40);
    do
    {
      *__int16 v3 = 0;
      *((_DWORD *)v3 - 1) = 0;
      v3 += 2;
      --v2;
    }
    while (v2);
  }
  uint64_t result = *((void *)this + 1);
  if (result)
  {
    uint64_t result = MEMORY[0x1AD112B50](result, 0x1000C8077774924);
    *((void *)this + 1) = 0;
    *((_DWORD *)this + 4) = 0;
  }
  return result;
}

uint64_t CAShowAudioBufferList(const AudioBufferList *a1, int a2, const AudioStreamBasicDescription *a3, const char *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  AudioFormatID mFormatID = a3->mFormatID;
  AudioFormatFlags mFormatFlags = a3->mFormatFlags;
  UInt32 mBytesPerFrame = a3->mBytesPerFrame;
  UInt32 mChannelsPerFrame = a3->mChannelsPerFrame;
  UInt32 mBitsPerChannel = a3->mBitsPerChannel;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  *(_OWORD *)__str = 0u;
  if (mFormatID != 1819304813) {
    goto LABEL_10;
  }
  if (mFormatFlags)
  {
    if (mBitsPerChannel == 32)
    {
      if ((mFormatFlags & 2) != 0)
      {
        strcpy(__str, ", BEF");
        int v12 = 10;
      }
      else
      {
        strcpy(__str, ", LEF");
        int v12 = -10;
      }
      return show(a1, a2, v12, a4, __str);
    }
LABEL_10:
    int v12 = 1;
    return show(a1, a2, v12, a4, __str);
  }
  if (!mBytesPerFrame)
  {
LABEL_6:
    int v12 = 0;
    return show(a1, a2, v12, a4, __str);
  }
  if ((mFormatFlags & 0x20) != 0)
  {
    UInt32 mChannelsPerFrame = 1;
  }
  else if (!mChannelsPerFrame)
  {
    goto LABEL_6;
  }
  int v12 = mBytesPerFrame / mChannelsPerFrame;
  if ((int)(mBytesPerFrame / mChannelsPerFrame) >= 1)
  {
    if (((mFormatFlags >> 7) & 0x3F) != 0) {
      snprintf(__str, 0x50uLL, ", %d.%d-bit");
    }
    else {
      snprintf(__str, 0x50uLL, ", %d-bit");
    }
    if ((mFormatFlags & 2) != 0)
    {
      int v14 = " BEI";
    }
    else
    {
      int v12 = -v12;
      int v14 = " LEI";
    }
    strlcat(__str, v14, 0x50uLL);
  }
  return show(a1, a2, v12, a4, __str);
}

uint64_t show(const AudioBufferList *a1, int a2, int a3, const char *a4, const char *a5)
{
  BOOL v8 = "AudioBufferList";
  if (a4) {
    BOOL v8 = a4;
  }
  unsigned int v9 = "";
  if (a5) {
    unsigned int v9 = a5;
  }
  uint64_t result = printf("%s %p (%d fr%s):\n", v8, a1, a2, v9);
  if (a1->mNumberBuffers)
  {
    UInt32 v11 = 0;
    mBuffers = a1->mBuffers;
    int v13 = a3 + 10;
    do
    {
      printf("    [%2d] %5dbytes %dch @ %p", v11, mBuffers->mDataByteSize, mBuffers->mNumberChannels, mBuffers->mData);
      if (a2)
      {
        if (mBuffers->mData)
        {
          putchar(58);
          int v14 = mBuffers->mNumberChannels * a2;
          if (v14 >= 1)
          {
            mCFDataRef Data = (unsigned __int8 *)mBuffers->mData;
            unsigned int v16 = v14 + 1;
            do
            {
              switch(v13)
              {
                case 0:
                case 10:
                  mData += 4;
                  goto LABEL_24;
                case 6:
                  mData += 4;
                  goto LABEL_22;
                case 7:
                  int v17 = (mData[2] << 16) | (mData[1] << 8);
                  int v18 = *mData;
                  goto LABEL_20;
                case 8:
                  mData += 2;
                  goto LABEL_18;
                case 9:
                case 11:
                  ++mData;
                  printf(" %02X");
                  break;
                case 12:
                  mData += 2;
LABEL_18:
                  printf(" %04X");
                  break;
                case 13:
                  int v17 = (*mData << 16) | (mData[1] << 8);
                  int v18 = mData[2];
LABEL_20:
                  printf(" %06X", v17 | v18);
                  mData += 3;
                  break;
                case 14:
                  mData += 4;
LABEL_22:
                  printf(" %08X");
                  break;
                case 20:
                  mData += 4;
LABEL_24:
                  printf(" %6.3f");
                  break;
                default:
                  break;
              }
              --v16;
            }
            while (v16 > 1);
          }
        }
      }
      uint64_t result = putchar(10);
      ++v11;
      ++mBuffers;
    }
    while (v11 < a1->mNumberBuffers);
  }
  return result;
}

uint64_t CAShowAudioBufferList(const AudioBufferList *a1, int a2, int a3, const char *a4)
{
  return show(a1, a2, a3, a4, 0);
}

uint64_t CAShowAudioBufferList(const AudioBufferList *a1, int a2, int a3)
{
  return show(a1, a2, a3, 0, 0);
}

const __CFArray *CACFArray::HasItem(CFArrayRef *this, const void *a2)
{
  CFArrayRef result = *this;
  if (result)
  {
    v5.length = CFArrayGetCount(result);
    v5.location = 0;
    return (const __CFArray *)(CFArrayContainsValue(*this, v5, a2) != 0);
  }
  return result;
}

const __CFArray *CACFArray::GetIndexOfItem(CFArrayRef *this, const void *a2, unsigned int *a3)
{
  *a3 = 0;
  CFArrayRef result = *this;
  if (result)
  {
    v8.length = CFArrayGetCount(result);
    v8.location = 0;
    FirstIndexOfint Value = CFArrayGetFirstIndexOfValue(*this, v8, a2);
    if (FirstIndexOfValue == -1)
    {
      return 0;
    }
    else
    {
      *a3 = FirstIndexOfValue;
      return (const __CFArray *)1;
    }
  }
  return result;
}

uint64_t CACFArray::GetBool(CFArrayRef *this, unsigned int a2, BOOL *a3)
{
  CFTypeRef cf = 0;
  uint64_t result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if (!result) {
    return result;
  }
  CFTypeRef v5 = cf;
  if (!cf) {
    return 0;
  }
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 != CFBooleanGetTypeID())
  {
    CFTypeID v8 = CFGetTypeID(v5);
    if (v8 == CFNumberGetTypeID())
    {
      int valuePtr = 0;
      CFNumberGetValue((CFNumberRef)v5, kCFNumberSInt32Type, &valuePtr);
      BOOL v7 = valuePtr == 0;
      goto LABEL_7;
    }
    return 0;
  }
  BOOL v7 = CFBooleanGetValue((CFBooleanRef)v5) == 0;
LABEL_7:
  BOOL v9 = !v7;
  *a3 = v9;
  return 1;
}

uint64_t CACFArray::GetSInt32(CFArrayRef *this, unsigned int a2, int *a3)
{
  CFTypeRef cf = 0;
  unsigned int CFType = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFNumberRef v6 = (const __CFNumber *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetSInt64(CFArrayRef *this, unsigned int a2, uint64_t *a3)
{
  CFTypeRef cf = 0;
  unsigned int CFType = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFNumberRef v6 = (const __CFNumber *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetUInt64(CFArrayRef *this, unsigned int a2, unint64_t *a3)
{
  CFTypeRef cf = 0;
  unsigned int CFType = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFNumberRef v6 = (const __CFNumber *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetFloat32(CFArrayRef *this, unsigned int a2, float *a3)
{
  CFTypeRef cf = 0;
  unsigned int CFType = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFNumberRef v6 = (const __CFNumber *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberFloat32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetFloat64(CFArrayRef *this, unsigned int a2, double *a3)
{
  CFTypeRef cf = 0;
  unsigned int CFType = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFNumberRef v6 = (const __CFNumber *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberFloat64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::Get4CC(CFArrayRef *this, unsigned int a2, unsigned int *a3)
{
  CFTypeRef cf = 0;
  uint64_t result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if (result)
  {
    CFNumberRef v5 = (const __CFNumber *)cf;
    if (cf)
    {
      CFTypeID v6 = CFGetTypeID(cf);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
        return 1;
      }
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 == CFStringGetTypeID() && CFStringGetLength((CFStringRef)v5) == 4)
      {
        CFStringGetCString((CFStringRef)v5, (char *)&v8, 5, 0x600u);
        *a3 = bswap32(v8);
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t CACFArray::GetString(CFArrayRef *this, unsigned int a2, const __CFString **a3)
{
  CFTypeRef cf = 0;
  unsigned int CFType = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFStringRef v6 = (const __CFString *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFStringGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetArray(CFArrayRef *this, unsigned int a2, const __CFArray **a3)
{
  CFTypeRef cf = 0;
  unsigned int CFType = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFArrayRef v6 = (const __CFArray *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFArrayGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetData(CFArrayRef *this, unsigned int a2, const __CFData **a3)
{
  CFTypeRef cf = 0;
  unsigned int CFType = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFDataRef v6 = (const __CFData *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFDataGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetUUID(CFArrayRef *this, unsigned int a2, const __CFUUID **a3)
{
  CFTypeRef cf = 0;
  unsigned int CFType = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFUUIDRef v6 = (const __CFUUID *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFUUIDGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetCACFString(CFArrayRef *this, unsigned int a2, CFTypeRef *a3)
{
  if (*a3)
  {
    if (*((unsigned char *)a3 + 8)) {
      CFRelease(*a3);
    }
    *a3 = 0;
  }
  *((unsigned char *)a3 + 8) = 1;
  CFTypeRef cf = 0;
  uint64_t result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if (result)
  {
    CFTypeRef v7 = cf;
    if (cf)
    {
      CFTypeID v8 = CFGetTypeID(cf);
      uint64_t result = CFStringGetTypeID();
      if (v8 == result)
      {
        return CACFString::operator=((uint64_t)a3, v7);
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetCACFArray(CFArrayRef *this, unsigned int a2, CACFArray *a3)
{
  CACFArray::operator=((uint64_t)a3, 0);
  CFTypeRef cf = 0;
  uint64_t result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if (result)
  {
    CFTypeRef v7 = cf;
    if (cf)
    {
      CFTypeID v8 = CFGetTypeID(cf);
      uint64_t result = CFArrayGetTypeID();
      if (v8 == result)
      {
        return CACFArray::operator=((uint64_t)a3, v7);
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetCACFDictionary(CFArrayRef *this, unsigned int a2, CACFDictionary *a3)
{
  CACFArray::operator=((uint64_t)a3, 0);
  CFTypeRef cf = 0;
  uint64_t result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if (result)
  {
    CFTypeRef v7 = cf;
    if (cf)
    {
      CFTypeID v8 = CFGetTypeID(cf);
      uint64_t result = CFDictionaryGetTypeID();
      if (v8 == result)
      {
        return CACFArray::operator=((uint64_t)a3, v7);
      }
    }
  }
  return result;
}

uint64_t CACFArray::AppendBool(CACFArray *this, int a2)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  __int16 v3 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!a2) {
    __int16 v3 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  int v4 = *v3;
  CFTypeRef v7 = v4;
  char v8 = 1;
  if (v4 && (CFRetain(v4), *(void *)this) && *((unsigned char *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v4);
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v7);
  return v5;
}

void sub_1ABAF4170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t CACFArray::AppendCFType(CACFArray *this, const void *a2)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    if (*((unsigned char *)this + 9))
    {
      CFArrayAppendValue((CFMutableArrayRef)result, a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CACFArray::AppendSInt32(CACFArray *this, int a2)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v6 = v3;
  char v7 = 1;
  if (v3 && *(void *)this && *((unsigned char *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_1ABAF4250(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendUInt32(CACFArray *this, int a2)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v6 = v3;
  char v7 = 1;
  if (v3 && *(void *)this && *((unsigned char *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_1ABAF42F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendSInt64(CACFArray *this, uint64_t a2)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v6 = v3;
  char v7 = 1;
  if (v3 && *(void *)this && *((unsigned char *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_1ABAF43A0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendUInt64(CACFArray *this, uint64_t a2)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v6 = v3;
  char v7 = 1;
  if (v3 && *(void *)this && *((unsigned char *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_1ABAF4448(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendFloat32(CACFArray *this, float a2)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  float valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
  CFNumberRef v6 = v3;
  char v7 = 1;
  if (v3 && *(void *)this && *((unsigned char *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_1ABAF44F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendFloat64(CACFArray *this, double a2)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  double valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberFloat64Type, &valuePtr);
  CFNumberRef v6 = v3;
  char v7 = 1;
  if (v3 && *(void *)this && *((unsigned char *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_1ABAF4598(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendArray(CACFArray *this, const __CFArray *a2)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    if (*((unsigned char *)this + 9))
    {
      CFArrayAppendValue((CFMutableArrayRef)result, a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CACFArray::AppendDictionary(CACFArray *this, const __CFDictionary *a2)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    if (*((unsigned char *)this + 9))
    {
      CFArrayAppendValue((CFMutableArrayRef)result, a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CACFArray::AppendData(CACFArray *this, const __CFData *a2)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    if (*((unsigned char *)this + 9))
    {
      CFArrayAppendValue((CFMutableArrayRef)result, a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFArray *CACFArray::InsertBool(CACFArray *this, unsigned int a2, int a3)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t v4 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    uint64_t v4 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v5 = *v4;
  BOOL v9 = v5;
  char v10 = 1;
  if (v5)
  {
    CFRetain(v5);
    CFArrayRef inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  }
  else
  {
    CFArrayRef inserted = 0;
  }
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v9);
  return inserted;
}

void sub_1ABAF46FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

const __CFArray *CACFArray::InsertCFType(__CFArray **this, unsigned int a2, const void *a3)
{
  CFArrayRef result = *this;
  if (result)
  {
    if (*((unsigned char *)this + 9))
    {
      unsigned int Count = CFArrayGetCount(result);
      char v8 = *this;
      if (Count <= a2) {
        CFArrayAppendValue(v8, a3);
      }
      else {
        CFArrayInsertValueAtIndex(v8, a2, a3);
      }
      return (const __CFArray *)1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFArray *CACFArray::InsertSInt32(CACFArray *this, unsigned int a2, int a3)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (v5) {
    CFArrayRef inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  }
  else {
    CFArrayRef inserted = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_1ABAF4818(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertUInt32(CACFArray *this, unsigned int a2, int a3)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (v5) {
    CFArrayRef inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  }
  else {
    CFArrayRef inserted = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_1ABAF48BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertSInt64(CACFArray *this, unsigned int a2, uint64_t a3)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (v5) {
    CFArrayRef inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  }
  else {
    CFArrayRef inserted = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_1ABAF4960(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertUInt64(CACFArray *this, unsigned int a2, uint64_t a3)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (v5) {
    CFArrayRef inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  }
  else {
    CFArrayRef inserted = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_1ABAF4A04(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertFloat32(CACFArray *this, unsigned int a2, float a3)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  float valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (v5) {
    CFArrayRef inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  }
  else {
    CFArrayRef inserted = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_1ABAF4AA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertFloat64(CACFArray *this, unsigned int a2, double a3)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  double valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberFloat64Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (v5) {
    CFArrayRef inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  }
  else {
    CFArrayRef inserted = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_1ABAF4B4C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetBool(const __CFArray **this, unsigned int a2, int a3)
{
  CFArrayRef v4 = *this;
  if (!v4 || !*((unsigned char *)this + 9) || CFArrayGetCount(v4) < a2) {
    return 0;
  }
  char v9 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    char v9 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  char v10 = *v9;
  UInt32 v11 = v10;
  char v12 = 1;
  if (v10)
  {
    CFRetain(v10);
    CFArrayRef v7 = CACFArray::SetCFType(this, a2, v10);
  }
  else
  {
    CFArrayRef v7 = 0;
  }
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v11);
  return v7;
}

void sub_1ABAF4C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

const __CFArray *CACFArray::SetCFType(CFMutableArrayRef *this, unsigned int a2, const void *a3)
{
  CFArrayRef result = *this;
  if (result)
  {
    if (*((unsigned char *)this + 9) && CFArrayGetCount(result) >= a2)
    {
      CFArraySetValueAtIndex(*this, a2, a3);
      return (const __CFArray *)1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFArray *CACFArray::SetSInt32(const __CFArray **this, unsigned int a2, int a3)
{
  CFArrayRef v4 = *this;
  if (!v4 || !*((unsigned char *)this + 9) || CFArrayGetCount(v4) < a2) {
    return 0;
  }
  int valuePtr = a3;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v10 = v9;
  char v11 = 1;
  if (v9) {
    CFArrayRef v7 = CACFArray::SetCFType(this, a2, v9);
  }
  else {
    CFArrayRef v7 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_1ABAF4D4C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetUInt32(const __CFArray **this, unsigned int a2, int a3)
{
  CFArrayRef v4 = *this;
  if (!v4 || !*((unsigned char *)this + 9) || CFArrayGetCount(v4) < a2) {
    return 0;
  }
  int valuePtr = a3;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v10 = v9;
  char v11 = 1;
  if (v9) {
    CFArrayRef v7 = CACFArray::SetCFType(this, a2, v9);
  }
  else {
    CFArrayRef v7 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_1ABAF4E08(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetSInt64(const __CFArray **this, unsigned int a2, uint64_t a3)
{
  CFArrayRef v4 = *this;
  if (!v4 || !*((unsigned char *)this + 9) || CFArrayGetCount(v4) < a2) {
    return 0;
  }
  uint64_t valuePtr = a3;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v10 = v9;
  char v11 = 1;
  if (v9) {
    CFArrayRef v7 = CACFArray::SetCFType(this, a2, v9);
  }
  else {
    CFArrayRef v7 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_1ABAF4EC4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetUInt64(const __CFArray **this, unsigned int a2, uint64_t a3)
{
  CFArrayRef v4 = *this;
  if (!v4 || !*((unsigned char *)this + 9) || CFArrayGetCount(v4) < a2) {
    return 0;
  }
  uint64_t valuePtr = a3;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v10 = v9;
  char v11 = 1;
  if (v9) {
    CFArrayRef v7 = CACFArray::SetCFType(this, a2, v9);
  }
  else {
    CFArrayRef v7 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_1ABAF4F80(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetFloat32(const __CFArray **this, unsigned int a2, float a3)
{
  CFArrayRef v4 = *this;
  if (!v4 || !*((unsigned char *)this + 9) || CFArrayGetCount(v4) < a2) {
    return 0;
  }
  float valuePtr = a3;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
  CFNumberRef v10 = v9;
  char v11 = 1;
  if (v9) {
    CFArrayRef v7 = CACFArray::SetCFType(this, a2, v9);
  }
  else {
    CFArrayRef v7 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_1ABAF503C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetFloat64(const __CFArray **this, unsigned int a2, double a3)
{
  CFArrayRef v4 = *this;
  if (!v4 || !*((unsigned char *)this + 9) || CFArrayGetCount(v4) < a2) {
    return 0;
  }
  double valuePtr = a3;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberFloat64Type, &valuePtr);
  CFNumberRef v10 = v9;
  char v11 = 1;
  if (v9) {
    CFArrayRef v7 = CACFArray::SetCFType(this, a2, v9);
  }
  else {
    CFArrayRef v7 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_1ABAF50F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

void CACFArray::PrintToLog(CACFArray *this, const __CFArray *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  CFIndex Count = CFArrayGetCount(this);
  if (a2)
  {
    uint64_t v5 = a2;
    memset(__b, 9, a2);
  }
  else
  {
    uint64_t v5 = 0;
  }
  __b[v5] = 0;
  if (Count >= 1)
  {
    CFIndex v6 = 0;
    CFArrayRef v7 = MEMORY[0x1E4F14500];
    unsigned int v12 = a2 + 1;
    do
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 136315906;
        int v14 = "CACFArray.cpp";
        __int16 v15 = 1024;
        int v16 = 795;
        __int16 v17 = 2080;
        int v18 = __b;
        __int16 v19 = 1024;
        int v20 = v6;
        _os_log_impl(&dword_1ABAC8000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d  %sitem %d", buf, 0x22u);
      }
      CFDictionaryRef ValueAtIndex = (__CFString *)CFArrayGetValueAtIndex(this, v6);
      CFTypeID v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFBooleanGetTypeID())
      {
        CACFBoolean::PrintToLog((CACFBoolean *)ValueAtIndex, a2);
      }
      else if (v9 == CFNumberGetTypeID())
      {
        CACFNumber::PrintToLog((CACFNumber *)ValueAtIndex, a2);
      }
      else if (v9 == CFStringGetTypeID())
      {
        CACFString::PrintToLog(ValueAtIndex, (const __CFString *)a2);
      }
      else if (v9 == CFDictionaryGetTypeID())
      {
        CACFDictionary::PrintToLog((CACFDictionary *)ValueAtIndex, (const __CFDictionary *)v12, v10);
      }
      else if (v9 == CFArrayGetTypeID())
      {
        CACFArray::PrintToLog((CACFArray *)ValueAtIndex, (const __CFArray *)v12, v11);
      }
      ++v6;
    }
    while (Count != v6);
  }
}

unint64_t MultiRadixFFT::NearestSupportedSizes(MultiRadixFFT *this)
{
  if (this >= 0x11)
  {
    if (this >> 20)
    {
      LODWORD(this) = 0x100000;
      uint64_t v1 = 0x100000;
    }
    else
    {
      unsigned int v2 = 1 << (__clz(this) ^ 0x1F);
      uint64_t v3 = (1 << -(char)__clz(this - 1));
      if (v2 >= v3)
      {
        LODWORD(this) = v2;
        uint64_t v1 = v3;
      }
      else
      {
        char v4 = __clz(this / 0xF);
        unsigned int v5 = 15 << ~v4;
        char v6 = __clz(this / 5);
        unsigned int v7 = 5 << ~v6;
        char v8 = __clz(this / 3);
        if (v7 <= 3 << ~v8) {
          unsigned int v7 = 3 << ~v8;
        }
        if (v5 <= v7) {
          unsigned int v5 = v7;
        }
        if (v2 <= v5) {
          unsigned int v2 = v5;
        }
        uint64_t v1 = (uint64_t)this;
        if (v2 != this)
        {
          unsigned int v9 = 30 << (31 - v4);
          unsigned int v10 = 10 << (31 - v6);
          unsigned int v11 = 6 << (31 - v8);
          if (v11 < v10) {
            unsigned int v10 = v11;
          }
          if (v10 < v9) {
            unsigned int v9 = v10;
          }
          if (v9 >= v3) {
            uint64_t v1 = v3;
          }
          else {
            uint64_t v1 = v9;
          }
          LODWORD(this) = v2;
        }
      }
    }
  }
  else
  {
    LODWORD(this) = 16;
    uint64_t v1 = 16;
  }
  return this | (unint64_t)(v1 << 32);
}

uint64_t MultiRadixFFT::Initialize(MultiRadixFFT *this, unsigned int a2)
{
  {
    operator new();
  }
  uint64_t v4 = DFTSetupList<true>::instance(void)::global;
  os_unfair_lock_lock((os_unfair_lock_t)DFTSetupList<true>::instance(void)::global);
  unsigned int v5 = std::remove_if[abi:ne180100]<std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> *>,caulk::shared_instance_manager<DFTSetups>::remove_expired(void)::{lambda(std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> *> const&)#1}>(*(uint64_t **)(v4 + 8), *(uint64_t **)(v4 + 16));
  std::vector<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>>::erase(v4 + 8, (uint64_t)v5, *(void *)(v4 + 16));
  char v6 = *(void **)(v4 + 8);
  unsigned int v7 = *(void **)(v4 + 16);
  while (1)
  {
    if (v6 == v7)
    {
      Setup = vDSP_DFT_zop_CreateSetup(0, a2, vDSP_DFT_FORWARD);
      if (Setup) {
        vDSP_DFT_zop_CreateSetup(Setup, a2, vDSP_DFT_INVERSE);
      }
      operator new();
    }
    char v8 = (std::__shared_weak_count *)v6[1];
    if (v8)
    {
      unsigned int v9 = std::__shared_weak_count::lock(v8);
      if (v9) {
        break;
      }
    }
LABEL_9:
    v6 += 2;
  }
  unsigned int v10 = v9;
  if (!*v6 || (uint64_t v11 = *(void *)(*v6 + 16), *(_DWORD *)v11 != a2))
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    goto LABEL_9;
  }
  atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  os_unfair_lock_unlock((os_unfair_lock_t)v4);
  if (*(void *)(v11 + 8) && *(void *)(v11 + 16))
  {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    char v13 = 0;
    uint64_t v14 = 0;
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    uint64_t v14 = 1936292453;
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    uint64_t v11 = 0;
    unsigned int v10 = 0;
    char v13 = 1;
  }
  __int16 v15 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v11;
  *((void *)this + 1) = v10;
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  if ((v13 & 1) == 0) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  return v14;
}

void sub_1ABAF56A0(_Unwind_Exception *a1)
{
}

void std::allocate_shared[abi:ne180100]<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>,std::allocator<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>,std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer,void>(void *a1, uint64_t *a2, std::__shared_weak_count_vtbl **a3)
{
  char v6 = (std::__shared_weak_count *)operator new(0x38uLL);
  v6->__shared_weak_owners_ = 0;
  v6->__shared_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F0303808;
  v6[1].__vftable = 0;
  uint64_t v7 = *a2;
  *a2 = 0;
  v6[1].__shared_owners_ = 0;
  v6[1].__shared_weak_owners_ = v7;
  v6[2].__vftable = *a3;
  *a1 = v6 + 1;
  a1[1] = v6;
  atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  v6[1].__vftable = (std::__shared_weak_count_vtbl *)&v6[1];
  v6[1].__shared_owners_ = (uint64_t)v6;

  std::__shared_weak_count::__release_shared[abi:ne180100](v6);
}

void DFTSetups::~DFTSetups(DFTSetups *this)
{
  unsigned int v2 = (vDSP_DFT_SetupStruct *)*((void *)this + 2);
  if (v2) {
    vDSP_DFT_DestroySetup(v2);
  }
  uint64_t v3 = (vDSP_DFT_SetupStruct *)*((void *)this + 1);
  if (v3) {
    vDSP_DFT_DestroySetup(v3);
  }
}

void std::vector<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>>::emplace_back<std::shared_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> &>(uint64_t a1, long long *a2)
{
  unsigned int v5 = *(void **)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16);
  if ((unint64_t)v5 >= v4)
  {
    char v8 = *(void **)a1;
    uint64_t v9 = ((uint64_t)v5 - *(void *)a1) >> 4;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 60) {
      std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v4 - (void)v8;
    if (v11 >> 3 > v10) {
      unint64_t v10 = v11 >> 3;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12 >> 60) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    char v13 = (char *)operator new(16 * v12);
    uint64_t v14 = &v13[16 * v9];
    long long v15 = *a2;
    *(_OWORD *)uint64_t v14 = *a2;
    if (*((void *)&v15 + 1))
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v15 + 1) + 16), 1uLL, memory_order_relaxed);
      char v8 = *(void **)a1;
      unsigned int v5 = *(void **)(a1 + 8);
    }
    int v16 = &v13[16 * v12];
    uint64_t v7 = v14 + 16;
    if (v5 == v8)
    {
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v7;
      *(void *)(a1 + 16) = v16;
    }
    else
    {
      do
      {
        long long v17 = *((_OWORD *)v5 - 1);
        v5 -= 2;
        *((_OWORD *)v14 - 1) = v17;
        v14 -= 16;
        *unsigned int v5 = 0;
        v5[1] = 0;
      }
      while (v5 != v8);
      char v8 = *(void **)a1;
      int v18 = *(void **)(a1 + 8);
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v7;
      *(void *)(a1 + 16) = v16;
      while (v18 != v8)
      {
        __int16 v19 = (std::__shared_weak_count *)*(v18 - 1);
        if (v19) {
          std::__shared_weak_count::__release_weak(v19);
        }
        v18 -= 2;
      }
    }
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    uint64_t v6 = *((void *)a2 + 1);
    *unsigned int v5 = *(void *)a2;
    v5[1] = v6;
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 16), 1uLL, memory_order_relaxed);
    }
    uint64_t v7 = v5 + 2;
  }
  *(void *)(a1 + 8) = v7;
}

DFTSetups *std::unique_ptr<DFTSetups>::reset[abi:ne180100](DFTSetups **a1)
{
  CFArrayRef result = *a1;
  *a1 = 0;
  if (result)
  {
    DFTSetups::~DFTSetups(result);
    JUMPOUT(0x1AD112B70);
  }
  return result;
}

void std::__shared_ptr_emplace<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (os_unfair_lock_trylock((os_unfair_lock_t)v2))
  {
    uint64_t v3 = std::remove_if[abi:ne180100]<std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> *>,caulk::shared_instance_manager<DFTSetups>::remove_expired(void)::{lambda(std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> *> const&)#1}>(*(uint64_t **)(v2 + 8), *(uint64_t **)(v2 + 16));
    std::vector<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>>::erase(v2 + 8, (uint64_t)v3, *(void *)(v2 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)v2);
  }
  std::unique_ptr<DFTSetups>::reset[abi:ne180100]((DFTSetups **)(a1 + 40));
  unint64_t v4 = *(std::__shared_weak_count **)(a1 + 32);
  if (v4)
  {
    std::__shared_weak_count::__release_weak(v4);
  }
}

uint64_t *std::remove_if[abi:ne180100]<std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> *>,caulk::shared_instance_manager<DFTSetups>::remove_expired(void)::{lambda(std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> *> const&)#1}>(uint64_t *a1, uint64_t *a2)
{
  if (a1 == a2) {
    return a2;
  }
  uint64_t v3 = a1;
  while (1)
  {
    uint64_t v4 = v3[1];
    if (!v4 || *(void *)(v4 + 8) == -1) {
      break;
    }
    v3 += 2;
    if (v3 == a2) {
      return a2;
    }
  }
  if (v3 != a2)
  {
    for (uint64_t i = v3 + 2; i != a2; i += 2)
    {
      uint64_t v7 = i[1];
      if (v7 && *(void *)(v7 + 8) != -1)
      {
        uint64_t v8 = *i;
        *uint64_t i = 0;
        i[1] = 0;
        uint64_t v9 = (std::__shared_weak_count *)v3[1];
        *uint64_t v3 = v8;
        v3[1] = v7;
        if (v9) {
          std::__shared_weak_count::__release_weak(v9);
        }
        v3 += 2;
      }
    }
  }
  return v3;
}

void std::vector<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>>::erase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 != a3)
  {
    uint64_t v3 = a3;
    uint64_t v4 = a2;
    uint64_t v6 = *(void *)(a1 + 8);
    if (a3 != v6)
    {
      uint64_t v7 = 16 * ((a3 - a2) >> 4);
      do
      {
        uint64_t v8 = (void *)(v4 + v7);
        long long v9 = *(_OWORD *)(v4 + v7);
        *uint64_t v8 = 0;
        v8[1] = 0;
        unint64_t v10 = *(std::__shared_weak_count **)(v4 + 8);
        *(_OWORD *)uint64_t v4 = v9;
        if (v10) {
          std::__shared_weak_count::__release_weak(v10);
        }
        v4 += 16;
      }
      while (v4 + v7 != v6);
      uint64_t v3 = *(void *)(a1 + 8);
    }
    while (v3 != v4)
    {
      uint64_t v11 = *(std::__shared_weak_count **)(v3 - 8);
      if (v11) {
        std::__shared_weak_count::__release_weak(v11);
      }
      v3 -= 16;
    }
    *(void *)(a1 + 8) = v4;
  }
}

void std::__shared_ptr_emplace<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F0303808;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1AD112B70);
}

void std::__shared_ptr_emplace<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F0303808;
  std::__shared_weak_count::~__shared_weak_count(this);
}

uint64_t MultiRadixFFT::Size(MultiRadixFFT *this)
{
  if (*(void *)this) {
    return **(unsigned int **)this;
  }
  else {
    return 0;
  }
}

uint64_t MultiRadixRealFFT::Initialize(MultiRadixRealFFT *this, unsigned int a2)
{
  {
    operator new();
  }
  uint64_t v4 = DFTSetupList<false>::instance(void)::global;
  os_unfair_lock_lock((os_unfair_lock_t)DFTSetupList<false>::instance(void)::global);
  unsigned int v5 = std::remove_if[abi:ne180100]<std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> *>,caulk::shared_instance_manager<DFTSetups>::remove_expired(void)::{lambda(std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> *> const&)#1}>(*(uint64_t **)(v4 + 8), *(uint64_t **)(v4 + 16));
  std::vector<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>>::erase(v4 + 8, (uint64_t)v5, *(void *)(v4 + 16));
  uint64_t v6 = *(void **)(v4 + 8);
  uint64_t v7 = *(void **)(v4 + 16);
  while (1)
  {
    if (v6 == v7)
    {
      Setup = vDSP_DFT_zrop_CreateSetup(0, a2, vDSP_DFT_FORWARD);
      if (Setup) {
        vDSP_DFT_zrop_CreateSetup(Setup, a2, vDSP_DFT_INVERSE);
      }
      operator new();
    }
    uint64_t v8 = (std::__shared_weak_count *)v6[1];
    if (v8)
    {
      long long v9 = std::__shared_weak_count::lock(v8);
      if (v9) {
        break;
      }
    }
LABEL_9:
    v6 += 2;
  }
  unint64_t v10 = v9;
  if (!*v6 || (uint64_t v11 = *(void *)(*v6 + 16), *(_DWORD *)v11 != a2))
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    goto LABEL_9;
  }
  atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  os_unfair_lock_unlock((os_unfair_lock_t)v4);
  if (*(void *)(v11 + 8) && *(void *)(v11 + 16))
  {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    char v13 = 0;
    uint64_t v14 = 0;
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    uint64_t v14 = 1936292453;
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    uint64_t v11 = 0;
    unint64_t v10 = 0;
    char v13 = 1;
  }
  long long v15 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v11;
  *((void *)this + 1) = v10;
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  if ((v13 & 1) == 0) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  return v14;
}

void sub_1ABAF5E28(_Unwind_Exception *a1)
{
}

uint64_t MultiRadixRealFFT::Size(MultiRadixRealFFT *this)
{
  if (*(void *)this) {
    return **(unsigned int **)this;
  }
  else {
    return 0;
  }
}

uint64_t MultiRadixFFT::CplxInPlaceTransform(MultiRadixFFT *this, DSPSplitComplex *a2, int a3)
{
  return 0;
}

uint64_t MultiRadixFFT::CplxOutOfPlaceTransform(MultiRadixFFT *this, const DSPSplitComplex *a2, DSPSplitComplex *a3, int a4)
{
  if (!*(void *)this) {
    abort();
  }
  uint64_t v4 = 16;
  if (a4 == 1) {
    uint64_t v4 = 8;
  }
  vDSP_DFT_Execute(*(const vDSP_DFT_SetupStruct **)(*(void *)this + v4), a2->realp, a2->imagp, a3->realp, a3->imagp);
  return 0;
}

uint64_t MultiRadixRealFFT::RealInPlaceTransform(MultiRadixRealFFT *this, DSPSplitComplex *a2, int a3, float a4)
{
  if (!*(void *)this) {
    abort();
  }
  uint64_t v8 = 16;
  if (a3 == 1) {
    uint64_t v8 = 8;
  }
  vDSP_DFT_Execute(*(const vDSP_DFT_SetupStruct **)(*(void *)this + v8), a2->realp, a2->imagp, a2->realp, a2->imagp);
  if (a3 == 1)
  {
    float __B = a4 * 0.5;
    vDSP_vsmul(a2->realp, 1, &__B, a2->realp, 1, (unint64_t)**(unsigned int **)this >> 1);
    vDSP_vsmul(a2->imagp, 1, &__B, a2->imagp, 1, (unint64_t)**(unsigned int **)this >> 1);
  }
  return 0;
}

uint64_t MultiRadixRealFFT::RealOutOfPlaceForwardTransform(MultiRadixRealFFT *this, DSPComplex *__C, DSPSplitComplex *a3, float a4)
{
  return 0;
}

uint64_t MultiRadixRealFFT::RealOutOfPlaceInverseTransform(MultiRadixRealFFT *this, const DSPSplitComplex *a2, DSPComplex *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!*(void *)this) {
    abort();
  }
  MEMORY[0x1F4188790]();
  uint64_t v6 = (float *)((char *)&v12 - ((v5 + 15) & 0x7FFFFFFF0));
  __Z.realp = v6;
  __Z.imagp = (float *)((char *)v6 + ((2 * v7) & 0x1FFFFFFFCLL));
  vDSP_DFT_Execute(*(const vDSP_DFT_SetupStruct **)(v8 + 16), *v9, v9[1], v6, __Z.imagp);
  if (*(void *)this) {
    vDSP_Length v10 = (unint64_t)**(unsigned int **)this >> 1;
  }
  else {
    vDSP_Length v10 = 0;
  }
  vDSP_ztoc(&__Z, 1, a3, 2, v10);
  return 0;
}

void MultiRadixFFT_Create()
{
}

uint64_t MultiRadixFFT_Dispose(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(std::__shared_weak_count **)(result + 8);
    if (v1) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v1);
    }
    JUMPOUT(0x1AD112B70);
  }
  return result;
}

unsigned int **MultiRadixFFT_Size(unsigned int **result)
{
  if (result)
  {
    if (*result) {
      return (unsigned int **)**result;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t MultiRadixFFT_CplxInPlaceTransform(MultiRadixFFT *a1, DSPSplitComplex *a2, int a3)
{
  if (!a1) {
    return 561214580;
  }
  MultiRadixFFT::CplxOutOfPlaceTransform(a1, a2, a2, a3);
  return 0;
}

uint64_t MultiRadixFFT_CplxOutOfPlaceTransform(MultiRadixFFT *a1, const DSPSplitComplex *a2, DSPSplitComplex *a3, int a4)
{
  if (!a1) {
    return 561214580;
  }
  MultiRadixFFT::CplxOutOfPlaceTransform(a1, a2, a3, a4);
  return 0;
}

void MultiRadixRealFFT_Create()
{
}

uint64_t MultiRadixRealFFT_Dispose(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(std::__shared_weak_count **)(result + 8);
    if (v1) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v1);
    }
    JUMPOUT(0x1AD112B70);
  }
  return result;
}

unsigned int **MultiRadixRealFFT_Size(unsigned int **result)
{
  if (result)
  {
    if (*result) {
      return (unsigned int **)**result;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t MultiRadixRealFFT_RealInPlaceTransform(MultiRadixRealFFT *a1, DSPSplitComplex *a2, int a3)
{
  if (!a1) {
    return 561214580;
  }
  MultiRadixRealFFT::RealInPlaceTransform(a1, a2, a3, 1.0);
  return 0;
}

uint64_t MultiRadixRealFFT_RealOutOfPlaceForwardTransform(MultiRadixRealFFT *a1, DSPComplex *__C, DSPSplitComplex *a3)
{
  if (!a1) {
    return 561214580;
  }
  vDSP_ctoz(__C, 2, a3, 1, (unint64_t)**(unsigned int **)a1 >> 1);
  MultiRadixRealFFT::RealInPlaceTransform(a1, a3, 1, 1.0);
  return 0;
}

uint64_t MultiRadixRealFFT_RealOutOfPlaceInverseTransform(MultiRadixRealFFT *a1, const DSPSplitComplex *a2, DSPComplex *a3)
{
  if (!a1) {
    return 561214580;
  }
  MultiRadixRealFFT::RealOutOfPlaceInverseTransform(a1, a2, a3);
  return 0;
}

float realFFTMultiply(float *a1, float *a2, float *a3, float *a4, float *a5, float *a6, unsigned int a7)
{
  __A.realp = a1;
  __A.imagp = a2;
  __B.realp = a3;
  __B.imagp = a4;
  v13.realp = a5;
  v13.imagp = a6;
  float v7 = *a1;
  float v8 = *a2;
  float v9 = *a3;
  float v10 = *a4;
  vDSP_zvmul(&__A, 1, &__B, 1, &v13, 1, a7 >> 1, 1);
  imagp = v13.imagp;
  *v13.realp = v7 * v9;
  float result = v8 * v10;
  float *imagp = v8 * v10;
  return result;
}

void realFFTZeroPad(const DSPComplex *a1, float *a2, float *a3, unsigned int a4, int a5, MultiRadixRealFFT *a6)
{
  v11.realp = a2;
  v11.imagp = a3;
  vDSP_Length v9 = a4 >> 1;
  vDSP_ctoz(a1, 2, &v11, 1, v9);
  if (a5 - a4 >= 2)
  {
    size_t v10 = 4 * (((a5 - a4) >> 1) - 1) + 4;
    bzero(&v11.realp[v9], v10);
    bzero(&v11.imagp[v9], v10);
  }
  if (a6) {
    MultiRadixRealFFT::RealInPlaceTransform(a6, &v11, 1, 1.0);
  }
}

void realIFFTUnload(float *a1, float *a2, DSPComplex *__C, unsigned int a4, unsigned int a5, MultiRadixRealFFT *this, float a7)
{
  v11.realp = a1;
  v11.imagp = a2;
  float __B = a7;
  __Z.realp = &a1[a5 >> 1];
  __Z.imagp = &a2[a5 >> 1];
  if (this) {
    MultiRadixRealFFT::RealInPlaceTransform(this, &v11, -1, 1.0);
  }
  vDSP_ztoc(&__Z, 1, __C, 2, a4 >> 1);
  vDSP_vsmul((const float *)__C, 1, &__B, (float *)__C, 1, a4);
}

uint64_t CADeprecated::XThread::RunHelper(CADeprecated::XThread *this, void *a2)
{
  return 0;
}

uint64_t CADeprecated::XThread::Stop(CADeprecated::XThread *this)
{
  int v2 = *((unsigned __int8 *)this + 123);
  *((unsigned char *)this + 123) = 0;
  for (uint64_t result = (*(uint64_t (**)(CADeprecated::XThread *))(*(void *)this + 24))(this);
        atomic_load((unint64_t *)this + 1);
  if (v2)
  {
    uint64_t v5 = *(uint64_t (**)(CADeprecated::XThread *))(*(void *)this + 8);
    return v5(this);
  }
  return result;
}

void XPC_Dictionary::~XPC_Dictionary(XPC_Dictionary *this)
{
  XPC_Object::~XPC_Object(this);

  JUMPOUT(0x1AD112B70);
}

uint64_t XPC_Dictionary::GetArray(uint64_t a1, char *key, uint64_t a3)
{
  if (*(void *)(a3 + 8))
  {
    unsigned __int8 v6 = atomic_load((unsigned __int8 *)(a3 + 16));
    if (v6) {
      xpc_release(*(xpc_object_t *)(a3 + 8));
    }
    *(void *)(a3 + 8) = 0;
    atomic_store(0, (unsigned __int8 *)(a3 + 16));
  }
  uint64_t result = *(void *)(a1 + 8);
  if (result)
  {
    uint64_t result = (uint64_t)xpc_dictionary_get_value((xpc_object_t)result, key);
    if (result)
    {
      uint64_t v8 = result;
      if (MEMORY[0x1AD1137F0]() == MEMORY[0x1E4F14568])
      {
        if (*(void *)(a3 + 8))
        {
          unsigned __int8 v9 = atomic_load((unsigned __int8 *)(a3 + 16));
          if (v9) {
            xpc_release(*(xpc_object_t *)(a3 + 8));
          }
        }
        *(void *)(a3 + 8) = v8;
        atomic_store(0, (unsigned __int8 *)(a3 + 16));
        unsigned __int8 v10 = atomic_load((unsigned __int8 *)(a3 + 16));
        if (v10) {
          xpc_retain(*(xpc_object_t *)(a3 + 8));
        }
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t XPC_Dictionary::GetDictionary(XPC_Dictionary *this, const char *key, XPC_Dictionary *a3)
{
  if (*((void *)a3 + 1))
  {
    unsigned __int8 v6 = atomic_load((unsigned __int8 *)a3 + 16);
    if (v6) {
      xpc_release(*((xpc_object_t *)a3 + 1));
    }
    *((void *)a3 + 1) = 0;
    atomic_store(0, (unsigned __int8 *)a3 + 16);
  }
  uint64_t result = *((void *)this + 1);
  if (result)
  {
    uint64_t result = (uint64_t)xpc_dictionary_get_value((xpc_object_t)result, key);
    if (result)
    {
      uint64_t v8 = result;
      if (MEMORY[0x1AD1137F0]() == MEMORY[0x1E4F14590])
      {
        if (*((void *)a3 + 1))
        {
          unsigned __int8 v9 = atomic_load((unsigned __int8 *)a3 + 16);
          if (v9) {
            xpc_release(*((xpc_object_t *)a3 + 1));
          }
        }
        *((void *)a3 + 1) = v8;
        atomic_store(0, (unsigned __int8 *)a3 + 16);
        unsigned __int8 v10 = atomic_load((unsigned __int8 *)a3 + 16);
        if (v10) {
          xpc_retain(*((xpc_object_t *)a3 + 1));
        }
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t MemoryStream::GetLength(MemoryStream *this)
{
  return *((void *)this + 3);
}

uint64_t MemoryStream::Skip(uint64_t this, uint64_t a2)
{
  uint64_t v2 = *(void *)(this + 24);
  uint64_t v3 = *(void *)(this + 32);
  uint64_t v4 = -v3;
  uint64_t v5 = v2 - v3;
  uint64_t v6 = v3 + a2;
  if (v5 > a2) {
    uint64_t v2 = v6;
  }
  if (v4 >= a2) {
    uint64_t v2 = 0;
  }
  *(void *)(this + 32) = v2;
  return this;
}

uint64_t MemoryStream::GetPosition(MemoryStream *this)
{
  return *((void *)this + 4);
}

uint64_t MemoryStream::Seek(uint64_t this, uint64_t a2)
{
  if (a2 < 0)
  {
    *(void *)(this + 32) = 0;
  }
  else
  {
    uint64_t v2 = *(void *)(this + 24);
    if (v2 <= a2) {
      *(void *)(this + 32) = v2;
    }
    else {
      *(void *)(this + 32) = a2;
    }
  }
  return this;
}

uint64_t TStream::ReadAsync()
{
  return 4294967292;
}

void MemoryStream::Write(MemoryStream *this, const UInt8 *__src, size_t __n)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *((void *)this + 2);
  if (!v6)
  {
    int Length = CFDataGetLength(*((CFDataRef *)this + 1));
    unsigned __int8 v9 = (void *)((char *)this + 32);
    v11.location = *((void *)this + 4);
    if (v11.location == Length)
    {
      CFDataAppendBytes(*((CFMutableDataRef *)this + 1), __src, __n);
      *((void *)this + 3) = CFDataGetLength(*((CFDataRef *)this + 1));
    }
    else
    {
      v11.length = (int)__n;
      CFDataReplaceBytes(*((CFMutableDataRef *)this + 1), v11, __src, (int)__n);
    }
    goto LABEL_8;
  }
  if (!*((unsigned char *)this + 41))
  {
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = -54;
  }
  uint64_t v8 = (char *)this + 32;
  uint64_t v7 = *((void *)this + 4);
  if (*((void *)this + 3) - v7 >= __n)
  {
    memcpy((void *)(v6 + v7), __src, __n);
    unsigned __int8 v9 = v8;
LABEL_8:
    *v9 += __n;
    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v13 = 136315394;
    uint64_t v14 = "MemoryStream.cpp";
    __int16 v15 = 1024;
    int v16 = 184;
    _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d  failed assertion: goodToCopy", (uint8_t *)&v13, 0x12u);
  }
  __break(1u);
}

size_t MemoryStream::Read(MemoryStream *this, void *__dst, size_t a3)
{
  uint64_t v3 = *((void *)this + 4);
  uint64_t v4 = *((void *)this + 2);
  if (v4) {
    BOOL v5 = *((void *)this + 3) - v3 >= a3;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = -39;
  }
  memcpy(__dst, (const void *)(v4 + v3), a3);
  *((void *)this + 4) += a3;
  return a3;
}

void MemoryStream::~MemoryStream(MemoryStream *this)
{
  MemoryStream::~MemoryStream(this);

  JUMPOUT(0x1AD112B70);
}

{
  const void *v2;
  void *v3;

  *(void *)this = &unk_1F0303088;
  uint64_t v2 = (const void *)*((void *)this + 1);
  if (v2)
  {
    CFRelease(v2);
  }
  else
  {
    uint64_t v3 = (void *)*((void *)this + 2);
    if (v3)
    {
      if (*((unsigned char *)this + 40)) {
        free(v3);
      }
    }
  }
}

void MemoryStream::MemoryStream(MemoryStream *this, TStream *a2, int a3)
{
  uint64_t v5 = a3;
  uint64_t v6 = malloc_type_malloc(a3, 0x217192ADuLL);
  *((void *)this + 2) = v6;
  *((void *)this + 3) = v5;
  *((void *)this + 4) = 0;
  *(void *)this = &unk_1F0303088;
  *((void *)this + 1) = 0;
  *((unsigned char *)this + 4CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 1;
  if (v6) {
    (*(void (**)(TStream *, void *, uint64_t))(*(void *)a2 + 16))(a2, v6, v5);
  }
}

{
  uint64_t v5;
  void *v6;

  uint64_t v5 = a3;
  uint64_t v6 = malloc_type_malloc(a3, 0x217192ADuLL);
  *((void *)this + 2) = v6;
  *((void *)this + 3) = v5;
  *((void *)this + 4) = 0;
  *(void *)this = &unk_1F0303088;
  *((void *)this + 1) = 0;
  *((unsigned char *)this + 4CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 1;
  if (v6) {
    (*(void (**)(TStream *, void *, uint64_t))(*(void *)a2 + 16))(a2, v6, v5);
  }
}

void sub_1ABAF6C68(_Unwind_Exception *a1)
{
  MemoryStream::~MemoryStream(v1);
  _Unwind_Resume(a1);
}

void sub_1ABAF6D20(_Unwind_Exception *a1)
{
  MemoryStream::~MemoryStream(v1);
  _Unwind_Resume(a1);
}

uint64_t MemoryStream::MemoryStream(uint64_t a1, void *a2, int a3)
{
  uint64_t v5 = a3;
  uint64_t v6 = malloc_type_malloc(a3, 0xEE979C34uLL);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = 0;
  *(void *)a1 = &unk_1F0303088;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 4CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 1;
  if (v6) {
    (*(void (**)(void, void *, uint64_t))(*(void *)*a2 + 16))(*a2, v6, v5);
  }
  return a1;
}

{
  uint64_t v5;
  void *v6;

  uint64_t v5 = a3;
  uint64_t v6 = malloc_type_malloc(a3, 0xEE979C34uLL);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = 0;
  *(void *)a1 = &unk_1F0303088;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 4CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 1;
  if (v6) {
    (*(void (**)(void, void *, uint64_t))(*(void *)*a2 + 16))(*a2, v6, v5);
  }
  return a1;
}

void sub_1ABAF6DD8(_Unwind_Exception *a1)
{
  MemoryStream::~MemoryStream(v1);
  _Unwind_Resume(a1);
}

void sub_1ABAF6E90(_Unwind_Exception *a1)
{
  MemoryStream::~MemoryStream(v1);
  _Unwind_Resume(a1);
}

void MemoryStream::MemoryStream(MemoryStream *this, CFDataRef theData)
{
  BytePtr = CFDataGetBytePtr(theData);
  CFIndex Length = CFDataGetLength(theData);
  *(void *)this = &unk_1F0303088;
  *((void *)this + 2) = BytePtr;
  *((void *)this + 3) = Length;
  *((void *)this + 4) = 0;
  *((void *)this + 1) = CFRetain(theData);
  *((unsigned char *)this + 4CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 1;
}

{
  const UInt8 *BytePtr;
  CFIndex Length;

  BytePtr = CFDataGetBytePtr(theData);
  CFIndex Length = CFDataGetLength(theData);
  *(void *)this = &unk_1F0303088;
  *((void *)this + 2) = BytePtr;
  *((void *)this + 3) = Length;
  *((void *)this + 4) = 0;
  *((void *)this + 1) = CFRetain(theData);
  *((unsigned char *)this + 4CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 1;
}

void sub_1ABAF6F20(_Unwind_Exception *a1)
{
  MemoryStream::~MemoryStream(v1);
  _Unwind_Resume(a1);
}

void sub_1ABAF6FB0(_Unwind_Exception *a1)
{
  MemoryStream::~MemoryStream(v1);
  _Unwind_Resume(a1);
}

void MemoryStream::MemoryStream(MemoryStream *this)
{
  *(void *)this = &unk_1F0303088;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 1) = CFDataCreateMutable(0, 0);
  *((unsigned char *)this + 4CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 1;
}

{
  *(void *)this = &unk_1F0303088;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 1) = CFDataCreateMutable(0, 0);
  *((unsigned char *)this + 4CADeprecated::XMachReceivePort::SetMachPort((atomic_uint *)this, 0) = 1;
}

void sub_1ABAF7024(_Unwind_Exception *a1)
{
  MemoryStream::~MemoryStream(v1);
  _Unwind_Resume(a1);
}

void sub_1ABAF7098(_Unwind_Exception *a1)
{
  MemoryStream::~MemoryStream(v1);
  _Unwind_Resume(a1);
}

CFTypeRef MemoryStream::GetData(CFTypeRef *this)
{
  return CFRetain(this[1]);
}

void ___ZN18CASmartPreferencesC2Ev_block_invoke(uint64_t a1)
{
}

void CASmartPreferences::RereadPrefs(CASmartPreferences *this)
{
  std::mutex::lock((std::mutex *)this);
  CFSetApplyFunction(*((CFSetRef *)this + 8), (CFSetApplierFunction)SynchronizePrefDomain, 0);
  uint64_t v2 = (CFStringRef *)*((void *)this + 9);
  uint64_t v3 = (CFStringRef *)*((void *)this + 10);
  while (v2 != v3)
  {
    CASmartPreferences::Pref::Load(v2);
    v2 += 6;
  }

  std::mutex::unlock((std::mutex *)this);
}

void sub_1ABAF7134(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t SynchronizePrefDomain(const __CFString *a1, void *a2)
{
  return CFPreferencesSynchronize(a1, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
}

double CACFPreferencesGetAppFloatValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  CFStringRef v4 = (const __CFString *)CFPreferencesCopyAppValue(a1, a2);
  CFStringRef v6 = v4;
  if (a3) {
    uint64_t v7 = a3;
  }
  else {
    uint64_t v7 = (BOOL *)&v10;
  }
  double v8 = CASmartPreferences::InterpretFloat(v4, v7, v5);
  if (v6) {
    CFRelease(v6);
  }
  return v8;
}

double CASmartPreferences::InterpretFloat(const __CFString *this, unsigned char *a2, BOOL *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double valuePtr = 0.0;
  *a2 = 0;
  if (this)
  {
    CFTypeID v5 = CFGetTypeID(this);
    if (v5 == CFBooleanGetTypeID())
    {
      double valuePtr = (double)CFBooleanGetValue((CFBooleanRef)this);
LABEL_6:
      *a2 = 1;
      return valuePtr;
    }
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)this, kCFNumberDoubleType, &valuePtr);
      goto LABEL_6;
    }
    if (v5 == CFStringGetTypeID())
    {
      CFStringGetCString(this, buffer, 64, 0x600u);
      if (sscanf(buffer, "%lf", &valuePtr) == 1) {
        goto LABEL_6;
      }
    }
  }
  return valuePtr;
}

uint64_t CACFPreferencesGetAppFourCCValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CFStringRef v4 = (const __CFString *)CFPreferencesCopyAppValue(a1, a2);
  if (!v4)
  {
    uint64_t v7 = 0;
    BOOL v8 = 0;
    if (!a3) {
      return v7;
    }
    goto LABEL_7;
  }
  CFStringRef v5 = v4;
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 == CFStringGetTypeID() && (CFStringGetCString(v5, buffer, 64, 0x600u), strlen(buffer) == 4))
  {
    uint64_t v7 = bswap32(*(unsigned int *)buffer);
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v7 = 0;
    BOOL v8 = 0;
  }
  CFRelease(v5);
  if (a3) {
LABEL_7:
  }
    *a3 = v8;
  return v7;
}

void *CASharedLibrary::LoadLibraryAndGetRoutineAddress(CASharedLibrary *this, const char *a2, const char *__path, const char *a4)
{
  uint64_t result = dlopen(__path, 1);
  if (result)
  {
    return dlsym(result, (const char *)this + 1);
  }
  return result;
}

void *CASharedLibrary::GetRoutineAddressIfLibraryLoaded(CASharedLibrary *this, const char *a2, const char *__path, const char *a4)
{
  uint64_t result = dlopen(__path, 17);
  if (result)
  {
    return dlsym(result, (const char *)this + 1);
  }
  return result;
}

CFPropertyListRef CACFPreferences::CopyValue(const __CFString *this, __CFString *a2, int a3)
{
  int v4 = (int)a2;
  CACFPreferences::Synchronize((CACFPreferences *)a2, a3, 0);
  CFTypeID v6 = (const __CFString **)MEMORY[0x1E4F1D3F0];
  if (!v4) {
    CFTypeID v6 = (const __CFString **)MEMORY[0x1E4F1D3D0];
  }
  CFStringRef v7 = *v6;
  BOOL v8 = (const __CFString **)MEMORY[0x1E4F1D3E0];
  if (!a3) {
    BOOL v8 = (const __CFString **)MEMORY[0x1E4F1D3C8];
  }
  CFStringRef v9 = *v8;
  CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1D3B8];

  return CFPreferencesCopyValue(this, v10, v7, v9);
}

const void *CACFPreferences::CopyStringValue(const __CFString *this, __CFString *a2, int a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CFPropertyListRef v3 = CACFPreferences::CopyValue(this, a2, a3);
  int v4 = v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 != CFStringGetTypeID())
    {
      CFRelease(v4);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315394;
        BOOL v8 = "CACFPreferences.cpp";
        __int16 v9 = 1024;
        int v10 = 49;
        _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  CACFPreferences::CopyStringValue: not a CFString", (uint8_t *)&v7, 0x12u);
      }
      return 0;
    }
  }
  return v4;
}

const void *CACFPreferences::CopyNumberValue(const __CFString *this, __CFString *a2, int a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CFPropertyListRef v3 = CACFPreferences::CopyValue(this, a2, a3);
  int v4 = v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 != CFNumberGetTypeID())
    {
      CFRelease(v4);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315394;
        BOOL v8 = "CACFPreferences.cpp";
        __int16 v9 = 1024;
        int v10 = 75;
        _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  CACFPreferences::CopyNumberValue: not a CFNumber", (uint8_t *)&v7, 0x12u);
      }
      return 0;
    }
  }
  return v4;
}

const void *CACFPreferences::CopyArrayValue(const __CFString *this, __CFString *a2, int a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CFPropertyListRef v3 = CACFPreferences::CopyValue(this, a2, a3);
  int v4 = v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 != CFArrayGetTypeID())
    {
      CFRelease(v4);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315394;
        BOOL v8 = "CACFPreferences.cpp";
        __int16 v9 = 1024;
        int v10 = 101;
        _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  CACFPreferences::CopyArrayValue: not a CFArray", (uint8_t *)&v7, 0x12u);
      }
      return 0;
    }
  }
  return v4;
}

const void *CACFPreferences::CopyDictionaryValue(const __CFString *this, __CFString *a2, int a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CFPropertyListRef v3 = CACFPreferences::CopyValue(this, a2, a3);
  int v4 = v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 != CFDictionaryGetTypeID())
    {
      CFRelease(v4);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315394;
        BOOL v8 = "CACFPreferences.cpp";
        __int16 v9 = 1024;
        int v10 = 127;
        _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  CACFPreferences::CopyDictionaryValue: not a CFDictionary", (uint8_t *)&v7, 0x12u);
      }
      return 0;
    }
  }
  return v4;
}

void CACFPreferences::SetValue(const __CFString *this, const __CFString *a2, CACFPreferences *a3, int a4, int a5)
{
  BOOL v8 = (const __CFString **)MEMORY[0x1E4F1D3F0];
  if (!a3) {
    BOOL v8 = (const __CFString **)MEMORY[0x1E4F1D3D0];
  }
  CFStringRef v9 = *v8;
  int v10 = (CFStringRef *)MEMORY[0x1E4F1D3E0];
  if (!a4) {
    int v10 = (CFStringRef *)MEMORY[0x1E4F1D3C8];
  }
  CFPreferencesSetValue(this, a2, (CFStringRef)*MEMORY[0x1E4F1D3B8], v9, *v10);
  if (a5)
  {
    CACFPreferences::Synchronize(a3, a4, 1);
  }
}

void CACFPreferences::DeleteValue(const __CFString *this, const __CFString *a2, int a3, int a4)
{
  CFTypeID v6 = (const __CFString **)MEMORY[0x1E4F1D3F0];
  if (!a2) {
    CFTypeID v6 = (const __CFString **)MEMORY[0x1E4F1D3D0];
  }
  CFStringRef v7 = *v6;
  BOOL v8 = (CFStringRef *)MEMORY[0x1E4F1D3E0];
  if (!a3) {
    BOOL v8 = (CFStringRef *)MEMORY[0x1E4F1D3C8];
  }
  CFPreferencesSetValue(this, 0, (CFStringRef)*MEMORY[0x1E4F1D3B8], v7, *v8);
  if (a4)
  {
    CACFPreferences::Synchronize((CACFPreferences *)(v7 != 0), a3, 1);
  }
}

uint64_t CACFPreferences::MarkPrefsClean(uint64_t this, int a2)
{
  if ((this & 1) != 0 || a2)
  {
    if (((a2 ^ 1) & 1) != 0 || this)
    {
      if (((this ^ 1) & 1) != 0 || a2)
      {
        if ((this ^ 1 | a2 ^ 1)) {
          return this;
        }
        uint64_t v2 = &CACFPreferences::sCurrentUserCurrentHostPrefsOutOfDate;
      }
      else
      {
        uint64_t v2 = &CACFPreferences::sCurrentUserAnyHostPrefsOutOfDate;
      }
    }
    else
    {
      uint64_t v2 = &CACFPreferences::sAnyUserCurrentHostPrefsOutOfDate;
    }
  }
  else
  {
    uint64_t v2 = &CACFPreferences::sAnyUserAnyHostPrefsOutOfDate;
  }
  *uint64_t v2 = 0;
  return this;
}

uint64_t CACFPreferences::MarkPrefsOutOfDate(uint64_t this, int a2)
{
  if ((this & 1) != 0 || a2)
  {
    if (((a2 ^ 1) & 1) != 0 || this)
    {
      if (((this ^ 1) & 1) != 0 || a2)
      {
        if ((this ^ 1 | a2 ^ 1)) {
          return this;
        }
        uint64_t v2 = &CACFPreferences::sCurrentUserCurrentHostPrefsOutOfDate;
      }
      else
      {
        uint64_t v2 = &CACFPreferences::sCurrentUserAnyHostPrefsOutOfDate;
      }
    }
    else
    {
      uint64_t v2 = &CACFPreferences::sAnyUserCurrentHostPrefsOutOfDate;
    }
  }
  else
  {
    uint64_t v2 = &CACFPreferences::sAnyUserAnyHostPrefsOutOfDate;
  }
  *uint64_t v2 = 1;
  return this;
}

void CACFPreferences::SendNotification(const __CFString *this, const __CFString *a2)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, this, 0, 0, 0);
}

BOOL BaseOpaqueObject::isa(uint64_t a1, void *a2)
{
  return a2 == &BaseOpaqueObject::sBaseRTTI;
}

void *caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::~guarded_lookup_hash_table(uint64_t a1)
{
  if (atomic_load((unsigned int *)(a1 + 48)))
  {
    _os_assert_log();
    uint64_t result = (void *)_os_crash();
    __break(1u);
  }
  else
  {
    uint64_t v3 = atomic_load((unint64_t *)(a1 + 40));
    if (v3)
    {
      uint64_t v4 = caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl::~table_impl(v3);
      MEMORY[0x1AD112B70](v4, 0x1060C402CF69088);
    }
    std::mutex::~mutex((std::mutex *)(a1 + 80));
    CFTypeID v5 = *(uint64_t **)(a1 + 56);
    if (v5)
    {
      CFTypeID v6 = *(uint64_t **)(a1 + 64);
      CFStringRef v7 = *(void **)(a1 + 56);
      if (v6 != v5)
      {
        do
          std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl>>::reset[abi:ne180100](--v6);
        while (v6 != v5);
        CFStringRef v7 = *(void **)(a1 + 56);
      }
      *(void *)(a1 + 64) = v5;
      operator delete(v7);
    }
    return std::__function::__value_func<unsigned int ()>::~__value_func[abi:ne180100]((void *)a1);
  }
  return result;
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::table_impl::~table_impl(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (unsigned int **)(a1 + 16);
    do
    {
      if ((unint64_t)*v3 + 1 >= 2) {
        caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::element_t::release(*v3);
      }
      ++v3;
      --v2;
    }
    while (v2);
  }
  return a1;
}

uint64_t std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::table_impl>>::reset[abi:ne180100](uint64_t *a1)
{
  uint64_t result = *a1;
  *a1 = 0;
  if (result)
  {
    caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl::~table_impl(result);
    JUMPOUT(0x1AD112B70);
  }
  return result;
}

void *std::__function::__func<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0,std::allocator<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0>,unsigned int ()(unsigned int)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &unk_1F03035F0;
  return result;
}

void std::__function::__func<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0,std::allocator<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0>,unsigned int ()(unsigned int)>::~__func()
{
}

uint64_t *OpaqueObjectMgr::lookup(OpaqueObjectMgr *this, int a2)
{
  uint64_t result = caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::lookup<(caulk::concurrent::guarded_lookup_hash_table_options)0,void>((uint64_t)this, a2);
  if (!v3) {
    return 0;
  }
  return result;
}

void std::this_thread::sleep_for[abi:ne180100]<long long,std::ratio<1l,1000000l>>(uint64_t a1)
{
  if (a1 >= 1)
  {
    uint64_t v7 = v1;
    uint64_t v8 = v2;
    if ((double)a1 == 9.22337204e15) {
      int v3 = 0;
    }
    else {
      int v3 = -127;
    }
    if ((double)a1 > 9.22337204e15) {
      int v3 = 1;
    }
    if ((double)a1 < 9.22337204e15) {
      int v3 = -1;
    }
    BOOL v4 = v3 >= 0 || v3 == -127;
    std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v5 = 1000 * a1;
    if (v4) {
      std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v5 = 0x7FFFFFFFFFFFFFFFLL;
    }
    __ns.__rep_ = v5;
    std::this_thread::sleep_for (&__ns);
  }
}

void BaseOpaqueObject::BaseOpaqueObject(BaseOpaqueObject *this, int a2)
{
  *(void *)this = &unk_1F0303130;
  *((_DWORD *)this + 2) = a2;
  uint64_t v3 = OpaqueObjectMgrInstance();
  caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::_addOrReplace(v3, a2);
}

float DFT_split_180_execute(vDSP_DFT_SetupStruct *__Setup, float32x2_t *a2, float32x2_t *a3, float *a4, float *a5, vDSP_DFT_Direction a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,int a44,uint64_t a45,uint64_t a46)
{
  unint64_t v47 = 0;
  if (a6 == vDSP_DFT_INVERSE) {
    int v48 = a4;
  }
  else {
    int v48 = a5;
  }
  if (a6 == vDSP_DFT_INVERSE) {
    float64x2_t v49 = a5;
  }
  else {
    float64x2_t v49 = a4;
  }
  if (a6 == vDSP_DFT_INVERSE) {
    uint64_t v50 = a2;
  }
  else {
    uint64_t v50 = a3;
  }
  if (a6 == vDSP_DFT_INVERSE) {
    float32x4_t v51 = (const float *)a3;
  }
  else {
    float32x4_t v51 = (const float *)a2;
  }
  unint64_t v52 = -8;
  do
  {
    float32x4_t v54 = *(float32x4_t *)&v51[v47 / 4];
    float32x4_t v53 = *(float32x4_t *)&v51[v47 / 4 + 4];
    float32x4_t v56 = *(float32x4_t *)v50[v47 / 8].f32;
    float32x4_t v55 = *(float32x4_t *)v50[v47 / 8 + 2].f32;
    float32x4_t v58 = *(float32x4_t *)&v51[v47 / 4 + 90];
    float32x4_t v57 = *(float32x4_t *)&v51[v47 / 4 + 94];
    float32x4_t v60 = *(float32x4_t *)v50[v47 / 8 + 45].f32;
    float32x4_t v59 = *(float32x4_t *)v50[v47 / 8 + 47].f32;
    float32x4_t v62 = *(float32x4_t *)((char *)&DFT_split_180_execute(vDSP_DFT_SetupStruct *,float const*,float const*,float *,float *,vDSP_DFT_Direction)::kCos_2PiOver180
                         + v47);
    float32x4_t v61 = *(float32x4_t *)((char *)&DFT_split_180_execute(vDSP_DFT_SetupStruct *,float const*,float const*,float *,float *,vDSP_DFT_Direction)::kCos_2PiOver180
                         + v47
                         + 16);
    float32x4_t v63 = *(float32x4_t *)((char *)&DFT_split_180_execute(vDSP_DFT_SetupStruct *,float const*,float const*,float *,float *,vDSP_DFT_Direction)::kSin_2PiOver180
                         + v47);
    float32x4_t v64 = *(float32x4_t *)((char *)&DFT_split_180_execute(vDSP_DFT_SetupStruct *,float const*,float const*,float *,float *,vDSP_DFT_Direction)::kSin_2PiOver180
                         + v47
                         + 16);
    uint64_t v65 = (float32x4_t *)((char *)&STACK[0x890] + v47);
    *uint64_t v65 = vaddq_f32(v54, v58);
    v65[1] = vaddq_f32(v53, v57);
    int v66 = (float32x4_t *)((char *)&v98 + v47);
    *int v66 = vaddq_f32(v56, v60);
    v66[1] = vaddq_f32(v55, v59);
    float32x4_t v67 = vsubq_f32(v53, v57);
    float32x4_t v68 = vsubq_f32(v54, v58);
    float32x4_t v69 = vsubq_f32(v56, v60);
    float32x4_t v70 = vsubq_f32(v55, v59);
    unint64_t v71 = (float32x4_t *)((char *)&STACK[0x890] + v47 + 360);
    *unint64_t v71 = vmlaq_f32(vmulq_f32(v69, v63), v62, v68);
    v71[1] = vmlaq_f32(vmulq_f32(v70, v64), v61, v67);
    float32x4_t v72 = (float32x4_t *)((char *)&a44 + v47);
    *float32x4_t v72 = vmlaq_f32(vmulq_f32(v63, vnegq_f32(v68)), v62, v69);
    v72[1] = vmlaq_f32(vmulq_f32(v64, vnegq_f32(v67)), v61, v70);
    v52 += 8;
    v47 += 32;
  }
  while (v52 < 0x4B);
  float32x2_t v73 = *(float32x2_t *)(v51 + 88);
  float32x2_t v74 = *(float32x2_t *)(v51 + 178);
  float32x2_t v75 = vsub_f32(v73, v74);
  float32x2_t v76 = vsub_f32(v50[44], v50[89]);
  STACK[0x9F0] = (unint64_t)vadd_f32(v73, v74);
  STACK[0xB58] = (unint64_t)vmla_f32(vmul_f32(v76, (float32x2_t)0x3D0EF2AD3D8EDC7BLL), (float32x2_t)0xBF7FD814BF7F605CLL, v75);
  STACK[0x878] = (unint64_t)vmla_f32(vmul_f32(v75, (float32x2_t)0xBD0EF2ADBD8EDC7BLL), (float32x2_t)0xBF7FD814BF7F605CLL, v76);
  vDSP_DFT_Execute(__Setup, (const float *)&STACK[0x890], (const float *)&v98, (float *)&STACK[0x890], (float *)&v98);
  vDSP_DFT_Execute(__Setup, (const float *)&STACK[0x9F8], (const float *)&a44, (float *)&STACK[0x9F8], (float *)&a44);
  uint64_t v77 = 0;
  unint64_t v78 = -8;
  float32x4_t v79 = v49;
  float32x4_t v80 = (int32x4_t *)v48;
  do
  {
    int32x4_t v82 = *(int32x4_t *)((char *)&STACK[0x890] + v77);
    int32x4_t v81 = *(int32x4_t *)((char *)&STACK[0x890] + v77 + 16);
    int32x4_t v84 = *(int32x4_t *)((char *)&v98 + v77);
    int32x4_t v83 = *(int32x4_t *)((char *)&v98 + v77 + 16);
    float32x4_t v85 = (int32x4_t *)((char *)&STACK[0x890] + v77 + 360);
    int32x4_t v86 = *(int32x4_t *)((char *)&STACK[0x890] + v77 + 376);
    int32x4_t v87 = vzip1q_s32(v82, *v85);
    int32x4_t v88 = vzip2q_s32(v82, *v85);
    int32x4_t v89 = vzip1q_s32(v81, v86);
    int32x4_t v90 = vzip2q_s32(v81, v86);
    int32x4_t v91 = *(int32x4_t *)((char *)&a46 + v77);
    int32x4_t v92 = vzip2q_s32(v84, *(int32x4_t *)((char *)&a44 + v77));
    int32x4_t v93 = vzip1q_s32(v84, *(int32x4_t *)((char *)&a44 + v77));
    v79[2] = v89;
    v79[3] = v90;
    *float32x4_t v79 = v87;
    v79[1] = v88;
    v79 += 4;
    v80[2] = vzip1q_s32(v83, v91);
    v80[3] = vzip2q_s32(v83, v91);
    v78 += 8;
    *float32x4_t v80 = v93;
    v80[1] = v92;
    v80 += 4;
    v77 += 32;
  }
  while (v78 < 0x4B);
  uint64_t v94 = 0;
  float32x4_t v95 = v48 + 177;
  float32x4_t v96 = v49 + 177;
  do
  {
    *(v96 - 1) = *(_DWORD *)((char *)&STACK[0x890] + v94 + 352);
    *(v95 - 1) = *(float *)((char *)&v98 + v94 + 352);
    *float32x4_t v96 = *(_DWORD *)((char *)&STACK[0x890] + v94 + 712);
    v96 += 2;
    float result = *(float *)((char *)&STACK[0x878] + v94);
    *float32x4_t v95 = result;
    v95 += 2;
    v94 += 4;
  }
  while (v94 != 8);
  return result;
}

uint64_t CADeprecated::CAGuard::Notify(CADeprecated::CAGuard *this)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t result = pthread_cond_signal((pthread_cond_t *)((char *)this + 88));
  if (result)
  {
    int v3 = result;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136315394;
      std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v5 = "CAGuard.cpp";
      __int16 v6 = 1024;
      int v7 = 302;
      _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAGuard::Notify: failed", buf, 0x12u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_1F0303008;
    exception[2] = v3;
  }
  return result;
}

uint64_t CADeprecated::CAGuard::WaitUntil(CADeprecated::CAGuard *this, unint64_t a2)
{
  mach_absolute_time();
  unint64_t v4 = __udivti3();
  if (a2 <= v4) {
    return 1;
  }
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v5 = *(uint64_t (**)(CADeprecated::CAGuard *, unint64_t))(*(void *)this + 64);

  return v5(this, a2 - v4);
}

pthread_t CADeprecated::CAGuard::Wait(CADeprecated::CAGuard *this)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = pthread_self();
  int v3 = (_opaque_pthread_t *)atomic_load((unint64_t *)this + 2);
  if (!pthread_equal(v2, v3))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      CFStringRef v9 = "CAGuard.cpp";
      __int16 v10 = 1024;
      int v11 = 88;
      _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAGuard::Wait: A thread has to have locked a guard before it can wait", (uint8_t *)&v8, 0x12u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_1F0303008;
    exception[2] = 1;
LABEL_10:
  }
  atomic_store(0, (unint64_t *)this + 2);
  int v4 = pthread_cond_wait((pthread_cond_t *)((char *)this + 88), (pthread_mutex_t *)((char *)this + 24));
  if (v4)
  {
    int v7 = v4;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      CFStringRef v9 = "CAGuard.cpp";
      __int16 v10 = 1024;
      int v11 = 97;
      _os_log_impl(&dword_1ABAC8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAGuard::Wait: Could not wait for a signal", (uint8_t *)&v8, 0x12u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_1F0303008;
    exception[2] = v7;
    goto LABEL_10;
  }
  pthread_t result = pthread_self();
  atomic_store((unint64_t)result, (unint64_t *)this + 2);
  return result;
}

void CADeprecated::CAGuard::~CAGuard(CADeprecated::CAGuard *this)
{
  CADeprecated::CAGuard::~CAGuard(this);

  JUMPOUT(0x1AD112B70);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1F0303380;
  pthread_cond_destroy((pthread_cond_t *)((char *)this + 88));

  CADeprecated::CAMutex::~CAMutex(this);
}

void XPC_Array::~XPC_Array(XPC_Array *this)
{
  XPC_Object::~XPC_Object(this);

  JUMPOUT(0x1AD112B70);
}

uint64_t XPC_Array::GetArray(XPC_Array *this, size_t a2, XPC_Array *a3)
{
  if (*((void *)a3 + 1))
  {
    unsigned __int8 v6 = atomic_load((unsigned __int8 *)a3 + 16);
    if (v6) {
      xpc_release(*((xpc_object_t *)a3 + 1));
    }
    *((void *)a3 + 1) = 0;
    atomic_store(0, (unsigned __int8 *)a3 + 16);
  }
  uint64_t result = *((void *)this + 1);
  if (result)
  {
    if (xpc_array_get_count((xpc_object_t)result) <= a2) {
      return 0;
    }
    uint64_t result = (uint64_t)xpc_array_get_value(*((xpc_object_t *)this + 1), a2);
    if (!result) {
      return result;
    }
    uint64_t v8 = result;
    if (MEMORY[0x1AD1137F0]() == MEMORY[0x1E4F14568])
    {
      if (*((void *)a3 + 1))
      {
        unsigned __int8 v9 = atomic_load((unsigned __int8 *)a3 + 16);
        if (v9) {
          xpc_release(*((xpc_object_t *)a3 + 1));
        }
      }
      *((void *)a3 + 1) = v8;
      atomic_store(0, (unsigned __int8 *)a3 + 16);
      unsigned __int8 v10 = atomic_load((unsigned __int8 *)a3 + 16);
      if (v10) {
        xpc_retain(*((xpc_object_t *)a3 + 1));
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t XPC_Array::GetDictionary(XPC_Array *this, size_t a2, XPC_Dictionary *a3)
{
  if (*((void *)a3 + 1))
  {
    unsigned __int8 v6 = atomic_load((unsigned __int8 *)a3 + 16);
    if (v6) {
      xpc_release(*((xpc_object_t *)a3 + 1));
    }
    *((void *)a3 + 1) = 0;
    atomic_store(0, (unsigned __int8 *)a3 + 16);
  }
  uint64_t result = *((void *)this + 1);
  if (result)
  {
    if (xpc_array_get_count((xpc_object_t)result) <= a2) {
      return 0;
    }
    uint64_t result = (uint64_t)xpc_array_get_value(*((xpc_object_t *)this + 1), a2);
    if (!result) {
      return result;
    }
    uint64_t v8 = result;
    if (MEMORY[0x1AD1137F0]() == MEMORY[0x1E4F14590])
    {
      if (*((void *)a3 + 1))
      {
        unsigned __int8 v9 = atomic_load((unsigned __int8 *)a3 + 16);
        if (v9) {
          xpc_release(*((xpc_object_t *)a3 + 1));
        }
      }
      *((void *)a3 + 1) = v8;
      atomic_store(0, (unsigned __int8 *)a3 + 16);
      unsigned __int8 v10 = atomic_load((unsigned __int8 *)a3 + 16);
      if (v10) {
        xpc_retain(*((xpc_object_t *)a3 + 1));
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

char *CAAudioChannelLayout::Create(CAAudioChannelLayout *this)
{
  unsigned int v1 = this;
  int v2 = caulk::numeric::exceptional_mul<unsigned int>(this);
  unsigned int v3 = caulk::numeric::exceptional_add<unsigned int>(v2);
  int v4 = (char *)malloc_type_malloc(v3, 0x2C8E6D5CuLL);
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v5 = v4;
  if (v3 && !v4)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    unsigned __int8 v10 = std::bad_alloc::bad_alloc(exception);
  }
  bzero(v4, v3);
  if (v5)
  {
    *(void *)std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v5 = 0;
    *((_DWORD *)v5 + 2) = v1;
    if (v1)
    {
      uint64_t v6 = v1;
      int v7 = v5 + 16;
      do
      {
        *((_DWORD *)v7 - 1) = -1;
        *int v7 = 0;
        v7[1] = 0;
        int v7 = (void *)((char *)v7 + 20);
        --v6;
      }
      while (v6);
    }
  }
  return v5;
}

uint64_t CAAudioChannelLayout::SetAllToUnknown(uint64_t this, AudioChannelLayout *a2)
{
  *(void *)this = 0;
  *(_DWORD *)(this + 8) = a2;
  if (a2)
  {
    uint64_t v2 = a2;
    unsigned int v3 = (void *)(this + 16);
    do
    {
      *((_DWORD *)v3 - 1) = -1;
      *unsigned int v3 = 0;
      v3[1] = 0;
      unsigned int v3 = (void *)((char *)v3 + 20);
      --v2;
    }
    while (v2);
  }
  return this;
}

size_t CAShowAudioChannelLayout(FILE *__stream, _DWORD *a2)
{
  if (a2)
  {
    fprintf(__stream, "\tTag=0x%X, ", *a2);
    if (*a2 == 0x10000)
    {
      return fprintf(__stream, "Using Bitmap:0x%X\n", a2[1]);
    }
    else
    {
      size_t result = fprintf(__stream, "Num Chan Descs=%d\n", a2[2]);
      if (a2[2])
      {
        unsigned int v5 = 0;
        uint64_t v6 = (float *)(a2 + 3);
        do
        {
          fprintf(__stream, "\t\tLabel=%d, Flags=0x%X, ", *(_DWORD *)v6, *((_DWORD *)v6 + 1));
          size_t result = fprintf(__stream, "[az=%f,el=%f,dist=%f]\n", v6[2], v6[3], v6[4]);
          ++v5;
          v6 += 5;
        }
        while (v5 < a2[2]);
      }
    }
  }
  else
  {
    return fwrite("\tNULL layout\n", 0xDuLL, 1uLL, __stream);
  }
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  uint64_t v2 = MEMORY[0x1F40D70D8](tz, at);
  result.second = v3;
  result.year = v2;
  result.month = BYTE4(v2);
  result.day = BYTE5(v2);
  result.hour = BYTE6(v2);
  result.minute = HIBYTE(v2);
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
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
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7810](allocator, capacity, theData);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
}

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
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
  return MEMORY[0x1F40D7968](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
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
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B68](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFMachPortRef CFMachPortCreate(CFAllocatorRef allocator, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1F40D7C58](allocator, callout, context, shouldFreeInfo);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D7C60](allocator, port, order);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x1F40D7C78](port);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotificationWithOptions(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, CFOptionFlags options)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E08](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7EC0](keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F58](allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x1F40D7F70](propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1F40D7FC0](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1F40D7FF8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopSourceGetContext(CFRunLoopSourceRef source, CFRunLoopSourceContext *context)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8440](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8458](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1F40D8460](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D84D0](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

double CFStringGetDoubleValue(CFStringRef str)
{
  MEMORY[0x1F40D8548](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1F40D8568](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1F40D8608](theString, suffix);
}

void CFStringTrim(CFMutableStringRef theString, CFStringRef trimString)
{
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return (CFTimeZoneRef)MEMORY[0x1F40D86F8]();
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1F40D8740](relativeURL);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1F40D88C0](allocator, URLString, baseURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8908](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8918](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1F40D8928]();
}

CFTypeID CFUUIDGetTypeID(void)
{
  return MEMORY[0x1F40D89D8]();
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x1F40D8AB0](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1F40D8AD0](stream);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x1F417CE50]();
}

void *__cdecl OSAtomicDequeue(OSQueueHead *__list, size_t a2)
{
  return (void *)MEMORY[0x1F40C99E8](__list, a2);
}

void OSAtomicEnqueue(OSQueueHead *__list, void *__new, size_t a3)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  unsigned int v1 = (const std::string_view::value_type *)MEMORY[0x1F417E3C0](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  unsigned int v1 = (const std::string_view::value_type *)MEMORY[0x1F417E3D8](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4B8](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1F417E4D0](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4D8](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

void std::this_thread::sleep_for (const std::chrono::nanoseconds *__ns)
{
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E898]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1F417E940]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::recursive_mutex::lock(std::recursive_mutex *this)
{
}

void std::recursive_mutex::unlock(std::recursive_mutex *this)
{
}

std::recursive_mutex *__cdecl std::recursive_mutex::recursive_mutex(std::recursive_mutex *this)
{
  return (std::recursive_mutex *)MEMORY[0x1F417E9D0](this);
}

void std::recursive_mutex::~recursive_mutex(std::recursive_mutex *this)
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1F417EA90](this);
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
  return MEMORY[0x1F417EE40]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1F417EE70](retstr, *(void *)&__val);
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1F417EEC8](this);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
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

void operator new[]()
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
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
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
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

uint64_t __udivti3()
{
  return MEMORY[0x1F40C9D08]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1F40C9F90]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
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

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1F40CA538](*(void *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_barrier_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
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
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x1F40CC098](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1F40CC0A0](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1F40CC110](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1F40CC1E8](*(void *)&a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1F40CC290](a1, a2, *(void *)&a3);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1F40CC298](__stream, a2, *(void *)&__whence);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

FILE *__cdecl funopen(const void *a1, int (__cdecl *a2)(void *, char *, int), int (__cdecl *a3)(void *, const char *, int), fpos_t (__cdecl *a4)(void *, fpos_t, int), int (__cdecl *a5)(void *))
{
  return (FILE *)MEMORY[0x1F40CC320](a1, a2, a3, a4, a5);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x1F40CC630](__x, __y);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

float log10f(float a1)
{
  MEMORY[0x1F40CC888](a1);
  return result;
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x1F40CC958](*(void *)&target_task, size, offset, *(void *)&permission, object_handle, *(void *)&parent_entry);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1F40CC9A0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_get_attributes(ipc_space_read_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x1F40CC9E0](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1F40CCA08](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1F40CCA10](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1F40CCA28](*(void *)&task, *(void *)&name, *(void *)&msgid, *(void *)&sync, *(void *)&notify, *(void *)&notifyPoly, previous);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1F40CCA30](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info, *(void *)&port_infoCnt);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
{
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1F40CD120](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1F40CD5F0](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

void perror(const char *a1)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD918](a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x1F40CD920](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD930](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1F40CD940](a1, *(void *)&a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x1F40CD950](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1F40CD958](a1, *(void *)&a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD978](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD980](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1F40CD988](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD990](a1);
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x1F40CD9A0](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1F40CD9A8](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40CD9B8](a1, a2, a3, a4);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return MEMORY[0x1F40CD9E0](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1F40CDA60](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA90](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1F40CDB60](a1);
}

int putchar(int a1)
{
  return MEMORY[0x1F40CDBA8](*(void *)&a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1F40CDC60](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1F40CDD10](__p, __ec);
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CDFE0](a1, *(void *)&a2);
}

int shm_unlink(const char *a1)
{
  return MEMORY[0x1F40CDFE8](a1);
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1A8](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x1F40CE460](*(void *)&task, *(void *)&which_port, special_port);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1F40CE530](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1F40CE540](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

void vDSP_DFT_DestroySetup(vDSP_DFT_Setup __Setup)
{
}

void vDSP_DFT_Execute(const vDSP_DFT_SetupStruct *__Setup, const float *__Ir, const float *__Ii, float *__Or, float *__Oi)
{
}

vDSP_DFT_Setup vDSP_DFT_zop_CreateSetup(vDSP_DFT_Setup __Previous, vDSP_Length __Length, vDSP_DFT_Direction __Direction)
{
  return (vDSP_DFT_Setup)MEMORY[0x1F40D1978](__Previous, __Length, *(void *)&__Direction);
}

vDSP_DFT_Setup vDSP_DFT_zrop_CreateSetup(vDSP_DFT_Setup __Previous, vDSP_Length __Length, vDSP_DFT_Direction __Direction)
{
  return (vDSP_DFT_Setup)MEMORY[0x1F40D1980](__Previous, __Length, *(void *)&__Direction);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_ztoc(const DSPSplitComplex *__Z, vDSP_Stride __IZ, DSPComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zvmul(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N, int __Conjugate)
{
}

int vdprintf(int a1, const char *a2, va_list a3)
{
  return MEMORY[0x1F40CE688](*(void *)&a1, a2, a3);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1F40CE6A8](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

kern_return_t vm_map(vm_map_t target_task, vm_address_t *address, vm_size_t size, vm_address_t mask, int flags, mem_entry_name_port_t object, vm_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1F40CE6C8](*(void *)&target_task, address, size, mask, *(void *)&flags, *(void *)&object, offset, *(void *)&copy);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEAA8](xarray, index);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBA8](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1F40CEBE8]();
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x1F40CEBF8](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1F40CF040](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1F40CF208]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CF268](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x1F40CF278](xshmem, region);
}