id VSGetLogDefault()
{
  void *v0;
  uint64_t vars8;

  if (VSGetLogDefault_onceToken != -1) {
    dispatch_once(&VSGetLogDefault_onceToken, &__block_literal_global_124);
  }
  v0 = (void *)VSGetLogDefault___profile_log_default;
  return v0;
}

void sub_20CAC0008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CAC3920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_20CAC452C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CAC5BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_20CAC809C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t VSRecognitionGetTypeID()
{
  return __VSRecognitionTypeID;
}

uint64_t _VSRecognitionRegisterClass()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __VSRecognitionTypeID = result;
  return result;
}

CFStringRef _VSRecognitionCopyDescription(void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, @"<VSRecognition: %p model=%@>", a1, a1[11]);
}

BOOL _VSRecognitionEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _VSRecognitionDestroy(uint64_t a1)
{
  CFAllocatorRef v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  uint64_t v3 = *(void *)(a1 + 80);
  if (v3)
  {
    _VSServerConnectionInvalidate(v3);
    CFRelease(*(CFTypeRef *)(a1 + 80));
  }
  v4 = *(const void **)(a1 + 88);
  if (v4) {
    CFRelease(v4);
  }
  v5 = *(const void **)(a1 + 176);
  if (v5) {
    CFRelease(v5);
  }
  v6 = *(const void **)(a1 + 184);
  if (v6) {
    CFRelease(v6);
  }
  v7 = *(const void **)(a1 + 136);
  if (v7) {
    CFRelease(v7);
  }
  v8 = *(const void **)(a1 + 152);
  if (v8) {
    CFRelease(v8);
  }
  v9 = *(void **)(a1 + 168);
  if (v9) {
    munmap(v9, 4uLL);
  }
  pthread_mutex_unlock(v2);
  return pthread_mutex_destroy(v2);
}

uint64_t VSRecognitionCreate(const __CFAllocator *a1, const __CFString *a2, long long *a3, uint64_t a4)
{
  return _VSRecognitionCreate(a1, a2, 0, a3, a4);
}

uint64_t _VSRecognitionCreate(const __CFAllocator *a1, const __CFString *a2, const void *a3, long long *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  pthread_once(&VSRecognitionGetTypeID___VSRecognitionRegisterOnce, (void (*)(void))_VSRecognitionRegisterClass);
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v11 = Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = 850045863;
    *(_OWORD *)(Instance + 24) = 0u;
    *(_OWORD *)(Instance + 40) = 0u;
    *(_OWORD *)(Instance + 56) = 0u;
    *(_OWORD *)(Instance + 72) = 0u;
    *(_DWORD *)(Instance + 96) = -1;
    *(void *)(Instance + 176) = 0;
    *(void *)(Instance + 88) = CFStringCreateCopy(a1, a2);
    *(_DWORD *)(v11 + 128) = 0;
    *(void *)(v11 + 136) = 0;
    *(_WORD *)(v11 + 144) = 0;
    *(void *)(v11 + 160) = 0;
    *(void *)(v11 + 168) = 0;
    *(void *)(v11 + 152) = 0;
    v12 = (_OWORD *)(v11 + 104);
    *(void *)(v11 + 192) = a5;
    if (a4)
    {
      long long v13 = *a4;
      *(void *)(v11 + 120) = *((void *)a4 + 2);
      _OWORD *v12 = v13;
      if (a3)
      {
LABEL_5:
        *(void *)(v11 + 184) = a3;
        CFRetain(a3);
        return v11;
      }
    }
    else
    {
      *(void *)v12 = 0;
      *(void *)(v11 + 112) = 0;
      *(void *)(v11 + 120) = 0;
      if (a3) {
        goto LABEL_5;
      }
    }
    *(void *)(v11 + 184) = 0;
  }
  return v11;
}

uint64_t VSRecognitionSetPreferredEngine(uint64_t a1, int a2)
{
  v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(_DWORD *)(a1 + 96) == -1)
  {
    *(_DWORD *)(a1 + 128) = a2;
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t VSRecognitionGetPreferredEngine(uint64_t a1)
{
  return *(unsigned int *)(a1 + 128);
}

uint64_t VSRecognitionSetDebugDumpPath(uint64_t a1, const void *a2)
{
  v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(_DWORD *)(a1 + 96) != -1) {
    goto LABEL_2;
  }
  v6 = *(const void **)(a1 + 136);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(a1 + 136) = 0;
  }
  if ((const void *)*MEMORY[0x263EFFD08] != a2)
  {
    if (a2)
    {
      CFRetain(a2);
      *(void *)(a1 + 136) = a2;
    }
    goto LABEL_10;
  }
  CFAllocatorRef v7 = CFGetAllocator((CFTypeRef)a1);
  CFURLRef v8 = VSLogBundleCreate(v7);
  if (v8)
  {
    CFURLRef v9 = v8;
    *(void *)(a1 + 136) = CFURLCopyFileSystemPath(v8, kCFURLPOSIXPathStyle);
    CFRelease(v9);
LABEL_10:
    uint64_t v5 = 1;
    goto LABEL_11;
  }
LABEL_2:
  uint64_t v5 = 0;
LABEL_11:
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t VSRecognitionCopyDebugDumpPath(uint64_t a1)
{
  CFAllocatorRef v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  uint64_t v3 = *(const void **)(a1 + 136);
  if (v3)
  {
    CFRetain(v3);
    uint64_t v4 = *(void *)(a1 + 136);
  }
  else
  {
    uint64_t v4 = 0;
  }
  pthread_mutex_unlock(v2);
  return v4;
}

uint64_t VSRecognitionSetEngineResetRequired(uint64_t a1, char a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(_DWORD *)(a1 + 96) == -1)
  {
    *(unsigned char *)(a1 + 144) = a2;
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t VSRecognitionSetAudioInputPath(uint64_t a1, const void *a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(_DWORD *)(a1 + 96) == -1)
  {
    v6 = *(const void **)(a1 + 152);
    if (v6) {
      CFRelease(v6);
    }
    *(void *)(a1 + 152) = a2;
    if (a2) {
      CFRetain(a2);
    }
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t VSRecognitionSetBluetoothInputAllowed(uint64_t a1, char a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(_DWORD *)(a1 + 96) == -1)
  {
    *(unsigned char *)(a1 + 145) = a2;
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t VSRecognitionPrepare(char *a1, void *a2)
{
  return _VSRecognitionPrepareAndBegin(a1, 0, a2);
}

uint64_t _VSRecognitionPrepareAndBegin(char *cf, int a2, void *a3)
{
  mach_msg_return_t v20;
  CFErrorRef v21;
  void *v22;
  uint64_t v23;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v25;
  CFTypeRef BinaryXMLData;
  CFStringRef v27;
  CFStringRef v28;
  CFStringRef v29;
  CFIndex Length;
  uint64_t MaximumSizeForEncoding;
  UInt8 *v32;
  mach_port_t v33;
  int v34;
  double v35;
  int v36;
  const UInt8 *BytePtr;
  int v38;
  uint64_t v39;
  void *v40;
  int v42;
  int v43;
  mach_port_t v44;
  int v45;
  CFDataRef theData;
  CFIndex usedBufLen;
  char v48;
  UInt8 buffer[8];
  void *userInfoValues[128];
  mach_msg_header_t userInfoKeys;
  int v52;
  mach_port_t v53;
  long long v54;
  void *v55;
  void *v56[3];
  CFRange v57;

  uint64_t v3 = (uint64_t)a3;
  v56[1] = *(void **)MEMORY[0x263EF8340];
  v48 = 1;
  if (a3) {
    *a3 = 0;
  }
  usedBufLen = 0;
  CFAllocatorRef v6 = CFGetAllocator(cf);
  pthread_mutex_lock((pthread_mutex_t *)(cf + 16));
  int v7 = *((_DWORD *)cf + 24);
  if ((v7 - 1) <= 1)
  {
    if (v3)
    {
      *(void *)&userInfoKeys.msgh_bits = *MEMORY[0x263EFFC48];
      userInfoValues[0] = @"recognition is already active";
      CFAllocatorRef v8 = v6;
      CFIndex v9 = -4000;
LABEL_20:
      uint64_t v14 = 0;
      *(void *)uint64_t v3 = CFErrorCreateWithUserInfoKeysAndValues(v8, @"VSErrorDomain", v9, (const void *const *)&userInfoKeys, (const void *const *)userInfoValues, 1);
      goto LABEL_90;
    }
    goto LABEL_37;
  }
  BOOL v11 = a2 == 1 && v7 == 0;
  if (v7 != -1 && !v11)
  {
LABEL_18:
    if (v3)
    {
      CFAllocatorRef v8 = CFGetAllocator(cf);
      *(void *)&userInfoKeys.msgh_bits = *MEMORY[0x263EFFC48];
      userInfoValues[0] = @"recognition reuse attempted";
      CFIndex v9 = -4003;
      goto LABEL_20;
    }
LABEL_37:
    uint64_t v14 = 0;
    goto LABEL_90;
  }
  uint64_t v13 = *((void *)cf + 10);
  if (v13)
  {
    if (v7 == -1) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v13 = _VSServerConnectionCreate(v6, (uint64_t)_VSRecognitionNotificationCallBack, (uint64_t)cf);
    *((void *)cf + 10) = v13;
    if (!v13)
    {
      if (v3)
      {
        *(void *)&userInfoKeys.msgh_bits = *MEMORY[0x263EFFC48];
        userInfoValues[0] = @"couldn't establish connection";
        CFAllocatorRef v8 = v6;
        CFIndex v9 = -4004;
        goto LABEL_20;
      }
      goto LABEL_37;
    }
  }
  v15 = (__CFMachPort *)_VSServerConnectionCopyServerPort(v13);
  v16 = (__CFMachPort *)_VSServerConnectionCopyClientPort(*((void *)cf + 10));
  v17 = v16;
  if (v15 && v16)
  {
    if (*((_DWORD *)cf + 24) != -1)
    {
      mach_port_t Port = CFMachPortGetPort(v15);
      v54 = 0u;
      v52 = 1;
      v53 = CFMachPortGetPort(v17);
      DWORD1(v54) = 1245184;
      mach_port_t reply_port = mig_get_reply_port();
      userInfoKeys.msgh_local_port = reply_port;
      *(void *)&userInfoKeys.msgh_bits = 2147489043;
      userInfoKeys.msgh_remote_port = Port;
      *(void *)&userInfoKeys.msgh_voucher_port = 0xF54BF00000000;
      if (MEMORY[0x263EF8B00])
      {
        voucher_mach_msg_set(&userInfoKeys);
        mach_port_t reply_port = userInfoKeys.msgh_local_port;
      }
      v20 = mach_msg(&userInfoKeys, 3, 0x28u, 0x30u, reply_port, 0, 0);
      if ((v20 - 268435458) <= 0xE && ((1 << (v20 - 2)) & 0x4003) != 0)
      {
        mig_put_reply_port(userInfoKeys.msgh_local_port);
      }
      else if (v20)
      {
        mig_dealloc_reply_port(userInfoKeys.msgh_local_port);
      }
      else if (userInfoKeys.msgh_id != 1004835 {
             || (userInfoKeys.msgh_bits & 0x80000000) != 0
      }
             || *(void *)&userInfoKeys.msgh_size != 40
             || v54)
      {
        mach_msg_destroy(&userInfoKeys);
      }
      else
      {
        v48 = BYTE4(v54);
      }
      goto LABEL_82;
    }
    v23 = *((void *)cf + 23);
    if (v23)
    {
      DictionaryRepresentation = VSRecognitionDisambiguationContextCreateDictionaryRepresentation(v6, v23);
      if (!DictionaryRepresentation)
      {
        if (v3)
        {
          *(void *)&userInfoKeys.msgh_bits = *MEMORY[0x263EFFC48];
          userInfoValues[0] = @"error converting disambiguation context to server";
          *(void *)uint64_t v3 = CFErrorCreateWithUserInfoKeysAndValues(v6, @"VSErrorDomain", -4007, (const void *const *)&userInfoKeys, (const void *const *)userInfoValues, 1);
        }
        BinaryXMLData = 0;
        v48 = 0;
        LOBYTE(userInfoKeys.msgh_bits) = 0;
        LOBYTE(userInfoValues[0]) = 0;
        goto LABEL_64;
      }
      v25 = DictionaryRepresentation;
      BinaryXMLData = VSCFPropertyListCreateBinaryXMLData(v6, DictionaryRepresentation);
      CFRelease(v25);
    }
    else
    {
      BinaryXMLData = 0;
    }
    v27 = (const __CFString *)*((void *)cf + 17);
    if (!v27 || !CFStringGetFileSystemRepresentation(v27, (char *)&userInfoKeys, 1024)) {
      LOBYTE(userInfoKeys.msgh_bits) = 0;
    }
    v28 = (const __CFString *)*((void *)cf + 19);
    if (v28)
    {
      if (!CFStringGetFileSystemRepresentation(v28, (char *)userInfoValues, 1024))
      {
        if (v3)
        {
          *(void *)buffer = *MEMORY[0x263EFFC48];
          v56[0] = @"error converting audio input path to server";
          *(void *)uint64_t v3 = CFErrorCreateWithUserInfoKeysAndValues(v6, @"VSErrorDomain", -4007, (const void *const *)buffer, (const void *const *)v56, 1);
        }
        v48 = 0;
LABEL_64:
        v32 = 0;
        usedBufLen = 0;
LABEL_77:
        if (BinaryXMLData) {
          CFRelease(BinaryXMLData);
        }
        if (v32 && v32 != buffer) {
          free(v32);
        }
LABEL_82:
        if (v48 == 1)
        {
          *((_DWORD *)cf + 24) = a2 != 0;
          uint64_t v3 = 1;
          goto LABEL_87;
        }
        if (!v3) {
          goto LABEL_87;
        }
        if (!*(void *)v3) {
          goto LABEL_32;
        }
        goto LABEL_33;
      }
    }
    else
    {
      LOBYTE(userInfoValues[0]) = 0;
    }
    theData = (const __CFData *)BinaryXMLData;
    v29 = (const __CFString *)*((void *)cf + 11);
    if (v29)
    {
      Length = CFStringGetLength(v29);
      MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      usedBufLen = MaximumSizeForEncoding;
      if (MaximumSizeForEncoding >= 257) {
        v32 = (UInt8 *)malloc_type_malloc(Length, 0xD3D88AF1uLL);
      }
      else {
        v32 = buffer;
      }
      v57.location = 0;
      v57.length = Length;
      if (!CFStringGetBytes(*((CFStringRef *)cf + 11), v57, 0x8000100u, 0, 0, v32, MaximumSizeForEncoding, &usedBufLen))
      {
        if (v3)
        {
          v40 = (void *)*MEMORY[0x263EFFC48];
          v55 = @"error converting model identifier";
          v56[0] = v40;
          *(void *)uint64_t v3 = CFErrorCreateWithUserInfoKeysAndValues(v6, @"VSErrorDomain", -4007, (const void *const *)v56, (const void *const *)&v55, 1);
        }
        v48 = 0;
        goto LABEL_76;
      }
    }
    else
    {
      v32 = 0;
      usedBufLen = 0;
    }
    v45 = CFMachPortGetPort(v15);
    v33 = CFMachPortGetPort(v17);
    v34 = *((_DWORD *)cf + 32);
    v35 = *((double *)cf + 20);
    v36 = usedBufLen;
    if (theData)
    {
      v43 = *((_DWORD *)cf + 32);
      v44 = v33;
      v42 = usedBufLen;
      BytePtr = CFDataGetBytePtr(theData);
      v38 = CFDataGetLength(theData);
      v39 = (uint64_t)BytePtr;
      v36 = v42;
      v34 = v43;
      v33 = v44;
    }
    else
    {
      v39 = 0;
      v38 = 0;
    }
    remote_VSRecognitionPrepareOrBegin(v45, v33, v34, (char *)&userInfoKeys, (const char *)userInfoValues, (uint64_t)v32, v36, v39, v35, v38, a2 == 0, *((_WORD *)cf + 72), HIBYTE(*((_WORD *)cf + 72)), &v48);
LABEL_76:
    BinaryXMLData = theData;
    goto LABEL_77;
  }
  CFRelease(*((CFTypeRef *)cf + 10));
  *((void *)cf + 10) = 0;
  if (v3)
  {
    *(void *)&userInfoKeys.msgh_bits = *MEMORY[0x263EFFC48];
    userInfoValues[0] = @"connection failure";
    v21 = CFErrorCreateWithUserInfoKeysAndValues(v6, @"VSErrorDomain", -4004, (const void *const *)&userInfoKeys, (const void *const *)userInfoValues, 1);
    *(void *)uint64_t v3 = v21;
    if (!v21)
    {
LABEL_32:
      v22 = (void *)*MEMORY[0x263EFFC48];
      v55 = @"recognition request denied";
      v56[0] = v22;
      *(void *)uint64_t v3 = CFErrorCreateWithUserInfoKeysAndValues(v6, @"VSErrorDomain", -4000, (const void *const *)v56, (const void *const *)&v55, 1);
    }
  }
LABEL_33:
  uint64_t v3 = 0;
  uint64_t v14 = 0;
  if (v15)
  {
LABEL_87:
    CFRelease(v15);
    uint64_t v14 = v3;
  }
  if (v17) {
    CFRelease(v17);
  }
LABEL_90:
  pthread_mutex_unlock((pthread_mutex_t *)(cf + 16));
  return v14;
}

void _VSRecognitionNotificationCallBack(int a1, CFStringRef theString1, const __CFDictionary *Mutable, uint64_t a4)
{
  userInfoValues[1] = *(void **)MEMORY[0x263EF8340];
  uint64_t valuePtr = -4001;
  if (!a4) {
    return;
  }
  if (CFEqual(theString1, @"note.recog.prepare"))
  {
    pthread_mutex_lock((pthread_mutex_t *)(a4 + 16));
    unsigned int v11 = *(_DWORD *)(a4 + 96);
    pthread_mutex_unlock((pthread_mutex_t *)(a4 + 16));
    if (v11 > 1) {
      return;
    }
    v12 = *(void (**)(uint64_t, uint64_t))(a4 + 104);
    if (!v12) {
      return;
    }
    goto LABEL_17;
  }
  if (CFEqual(theString1, @"note.recog.start"))
  {
    pthread_mutex_lock((pthread_mutex_t *)(a4 + 16));
    int v13 = *(_DWORD *)(a4 + 96);
    pthread_mutex_unlock((pthread_mutex_t *)(a4 + 16));
    if (v13 != 1) {
      return;
    }
    v12 = *(void (**)(uint64_t, uint64_t))(a4 + 112);
    if (!v12) {
      return;
    }
LABEL_17:
    uint64_t v14 = *(void *)(a4 + 192);
    v12(a4, v14);
    return;
  }
  if (CFEqual(theString1, @"note.recog.results"))
  {
    if (Mutable)
    {
      CFAllocatorRef v15 = CFGetAllocator((CFTypeRef)a4);
      CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(Mutable, @"key.recog.results");
      if (!Value
        || (CFArrayRef v17 = Value, Count = CFArrayGetCount(Value), Count < 1)
        || (CFIndex v19 = Count, TypeID = CFArrayGetTypeID(), TypeID != CFGetTypeID(v17)))
      {
        CFErrorRef v24 = 0;
        Mutable = 0;
        goto LABEL_32;
      }
      Mutable = CFArrayCreateMutable(v15, 0, MEMORY[0x263EFFF70]);
      v37.location = 0;
      v37.length = v19;
      CFArrayApplyFunction(v17, v37, (CFArrayApplierFunction)_ConvertSingleRecognitionResultDictionaryRepresentation, Mutable);
      if (Mutable)
      {
        CFIndex v21 = CFArrayGetCount(Mutable);
        CFIndex v22 = v19 - v21;
        if (v19 != v21)
        {
          v23 = VSGetLogDefault();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)userInfoKeys = 134217984;
            *(void *)&userInfoKeys[4] = v22;
            _os_log_error_impl(&dword_20CABC000, v23, OS_LOG_TYPE_ERROR, "Failed to convert %ld recognition results\n", userInfoKeys, 0xCu);
          }
        }
      }
    }
    CFErrorRef v24 = 0;
LABEL_32:
    int v26 = 2;
    goto LABEL_39;
  }
  if (CFEqual(theString1, @"note.recog.cancel"))
  {
    CFAllocatorRef v9 = CFGetAllocator((CFTypeRef)a4);
    *(void *)userInfoKeys = *MEMORY[0x263EFFC48];
    userInfoValues[0] = @"recognition cancelled";
    CFIndex v10 = -4002;
    goto LABEL_30;
  }
  if (CFEqual(theString1, @"note.recog.error"))
  {
    if (Mutable)
    {
      v27 = (void *)CFDictionaryGetValue(Mutable, @"key.recog.errordesc");
      CFNumberRef v28 = (const __CFNumber *)CFDictionaryGetValue(Mutable, @"key.recog.errorcode");
      if (v28) {
        CFNumberGetValue(v28, kCFNumberCFIndexType, &valuePtr);
      }
    }
    else
    {
      v27 = 0;
    }
    CFAllocatorRef v9 = CFGetAllocator((CFTypeRef)a4);
    CFIndex v10 = valuePtr;
    *(void *)userInfoKeys = *MEMORY[0x263EFFC48];
    userInfoValues[0] = v27;
    CFIndex v25 = v27 != 0;
    goto LABEL_38;
  }
  if (CFEqual(theString1, @"note.server.died"))
  {
    pthread_mutex_lock((pthread_mutex_t *)(a4 + 16));
    unsigned int v7 = *(_DWORD *)(a4 + 96);
    CFAllocatorRef v8 = *(const void **)(a4 + 80);
    if (v8)
    {
      CFRelease(v8);
      *(void *)(a4 + 80) = 0;
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a4 + 16));
    if (v7 <= 1)
    {
      CFAllocatorRef v9 = CFGetAllocator((CFTypeRef)a4);
      *(void *)userInfoKeys = *MEMORY[0x263EFFC48];
      userInfoValues[0] = @"connection lost";
      CFIndex v10 = -4004;
LABEL_30:
      CFIndex v25 = 1;
LABEL_38:
      CFErrorRef v24 = CFErrorCreateWithUserInfoKeysAndValues(v9, @"VSErrorDomain", v10, (const void *const *)userInfoKeys, (const void *const *)userInfoValues, v25);
      Mutable = 0;
      int v26 = -1;
LABEL_39:
      pthread_mutex_lock((pthread_mutex_t *)(a4 + 16));
      *(_DWORD *)(a4 + 96) = v26;
      v29 = *(void **)(a4 + 168);
      if (v29) {
        munmap(v29, 4uLL);
      }
      v30 = *(const void **)(a4 + 176);
      if (Mutable)
      {
        if (v30) {
          CFRelease(v30);
        }
        *(void *)(a4 + 176) = Mutable;
      }
      else
      {
        Mutable = *(const __CFDictionary **)(a4 + 176);
        if (!v30)
        {
          char v31 = 1;
          goto LABEL_47;
        }
      }
      CFRetain(Mutable);
      char v31 = 0;
LABEL_47:
      pthread_mutex_unlock((pthread_mutex_t *)(a4 + 16));
      v32 = *(void (**)(uint64_t, const __CFDictionary *, CFErrorRef, void))(a4 + 120);
      if (v32) {
        v32(a4, Mutable, v24, *(void *)(a4 + 192));
      }
      if ((v31 & 1) == 0) {
        CFRelease(Mutable);
      }
      if (v24) {
        CFRelease(v24);
      }
    }
  }
}

void _ConvertSingleRecognitionResultDictionaryRepresentation(const __CFDictionary *a1, void *a2)
{
  if (a1)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(a1))
    {
      int v5 = CFGetAllocator(a2);
      CFAllocatorRef v6 = VSRecognitionResultCreateFromDictionaryRepresentation(v5, a1);
      if (v6)
      {
        unsigned int v7 = v6;
        CFArrayAppendValue((CFMutableArrayRef)a2, v6);
        CFRelease(v7);
      }
    }
  }
}

uint64_t VSRecognitionBegin(char *a1, void *a2)
{
  return _VSRecognitionPrepareAndBegin(a1, 1, a2);
}

BOOL VSRecognitionCancel(uint64_t a1, CFErrorRef *a2)
{
  mach_msg_return_t v9;
  BOOL v10;
  CFIndex v11;
  CFAllocatorRef v12;
  CFErrorRef v13;
  unsigned char msg[28];
  mach_port_t v16;
  int v17;
  int v18;
  void *userInfoValues[2];

  userInfoValues[1] = *(void **)MEMORY[0x263EF8340];
  if (a2) {
    *a2 = 0;
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  uint64_t v4 = *(void *)(a1 + 80);
  if (!v4 || *(_DWORD *)(a1 + 96) > 1u)
  {
    CFIndex v10 = 1;
    goto LABEL_21;
  }
  int v5 = (__CFMachPort *)_VSServerConnectionCopyServerPort(v4);
  CFAllocatorRef v6 = (__CFMachPort *)_VSServerConnectionCopyClientPort(*(void *)(a1 + 80));
  unsigned int v7 = v6;
  if (v5 && v6)
  {
    mach_port_t Port = CFMachPortGetPort(v5);
    CFArrayRef v17 = 0;
    *(_OWORD *)&msg[4] = 0u;
    v16 = CFMachPortGetPort(v7);
    v18 = 1245184;
    *(_DWORD *)msg = -2147483629;
    *(_DWORD *)&msg[8] = Port;
    *(void *)&msg[20] = 0x1000F54C2;
    if (MEMORY[0x263EF8B00]) {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
    }
    CFAllocatorRef v9 = mach_msg((mach_msg_header_t *)msg, 1, 0x28u, 0, 0, 0, 0);
    CFIndex v10 = v9 == 0;
    if (!a2 || !v9) {
      goto LABEL_17;
    }
    unsigned int v11 = -4001;
  }
  else
  {
    if (!a2)
    {
      CFIndex v10 = 0;
      goto LABEL_17;
    }
    unsigned int v11 = -4004;
  }
  v12 = CFGetAllocator((CFTypeRef)a1);
  *(void *)msg = *MEMORY[0x263EFFC48];
  userInfoValues[0] = 0;
  int v13 = CFErrorCreateWithUserInfoKeysAndValues(v12, @"VSErrorDomain", v11, (const void *const *)msg, (const void *const *)userInfoValues, 0);
  CFIndex v10 = 0;
  *a2 = v13;
LABEL_17:
  *(_DWORD *)(a1 + 96) = -1;
  _VSServerConnectionInvalidate(*(void *)(a1 + 80));
  CFRelease(*(CFTypeRef *)(a1 + 80));
  *(void *)(a1 + 80) = 0;
  if (v5) {
    CFRelease(v5);
  }
  if (v7) {
    CFRelease(v7);
  }
LABEL_21:
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  return v10;
}

BOOL VSRecognitionIsActive(uint64_t a1)
{
  return *(_DWORD *)(a1 + 96) == 1;
}

uint64_t VSRecognitionSetInputLevelUpdateInterval(uint64_t a1, double a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(_DWORD *)(a1 + 96) == -1)
  {
    *(double *)(a1 + 160) = a2;
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  pthread_mutex_unlock(v4);
  return v5;
}

float VSRecognitionGetInputLevel(uint64_t a1)
{
  mach_msg_return_t v10;
  mach_msg_header_t v12;
  int v13;
  mach_port_t v14;
  long long v15;

  CFAllocatorRef v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  float v3 = 0.0;
  if (*(_DWORD *)(a1 + 96) != 1) {
    goto LABEL_24;
  }
  uint64_t v4 = *(void *)(a1 + 80);
  if (!v4) {
    goto LABEL_24;
  }
  uint64_t v5 = (__CFMachPort *)_VSServerConnectionCopyServerPort(v4);
  CFAllocatorRef v6 = (__CFMachPort *)_VSServerConnectionCopyClientPort(*(void *)(a1 + 80));
  unsigned int v7 = v6;
  if (v5 && v6)
  {
    mach_port_t Port = CFMachPortGetPort(v5);
    int v13 = 1;
    CFAllocatorRef v15 = 0u;
    v12.msgh_size = 0;
    uint64_t v14 = CFMachPortGetPort(v7);
    DWORD1(v15) = 1245184;
    mach_port_t reply_port = mig_get_reply_port();
    v12.msgh_remote_port = Port;
    v12.msgh_local_port = reply_port;
    v12.msgh_bits = -2147478253;
    *(void *)&v12.msgh_voucher_port = 0xF54C000000000;
    if (MEMORY[0x263EF8B00])
    {
      voucher_mach_msg_set(&v12);
      mach_port_t reply_port = v12.msgh_local_port;
    }
    CFIndex v10 = mach_msg(&v12, 3, 0x28u, 0x30u, reply_port, 0, 0);
    if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(v12.msgh_local_port);
    }
    else if (v10)
    {
      mig_dealloc_reply_port(v12.msgh_local_port);
    }
    else if (v12.msgh_id != 1004836 {
           || (v12.msgh_bits & 0x80000000) != 0
    }
           || v12.msgh_size != 40
           || v12.msgh_remote_port
           || v15)
    {
      mach_msg_destroy(&v12);
    }
    else
    {
      float v3 = *((float *)&v15 + 1);
    }
    goto LABEL_21;
  }
  if (v5) {
LABEL_21:
  }
    CFRelease(v5);
  if (v7) {
    CFRelease(v7);
  }
LABEL_24:
  pthread_mutex_unlock(v2);
  return v3;
}

float VSRecognitionGetInputLevelDB(uint64_t a1)
{
  mach_msg_return_t v10;
  mach_msg_header_t v12;
  int v13;
  mach_port_t v14;
  long long v15;

  CFAllocatorRef v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  float v3 = 0.0;
  if (*(_DWORD *)(a1 + 96) != 1) {
    goto LABEL_24;
  }
  uint64_t v4 = *(void *)(a1 + 80);
  if (!v4) {
    goto LABEL_24;
  }
  uint64_t v5 = (__CFMachPort *)_VSServerConnectionCopyServerPort(v4);
  CFAllocatorRef v6 = (__CFMachPort *)_VSServerConnectionCopyClientPort(*(void *)(a1 + 80));
  unsigned int v7 = v6;
  if (v5 && v6)
  {
    mach_port_t Port = CFMachPortGetPort(v5);
    int v13 = 1;
    CFAllocatorRef v15 = 0u;
    v12.msgh_size = 0;
    uint64_t v14 = CFMachPortGetPort(v7);
    DWORD1(v15) = 1245184;
    mach_port_t reply_port = mig_get_reply_port();
    v12.msgh_remote_port = Port;
    v12.msgh_local_port = reply_port;
    v12.msgh_bits = -2147478253;
    *(void *)&v12.msgh_voucher_port = 0xF54C100000000;
    if (MEMORY[0x263EF8B00])
    {
      voucher_mach_msg_set(&v12);
      mach_port_t reply_port = v12.msgh_local_port;
    }
    CFIndex v10 = mach_msg(&v12, 3, 0x28u, 0x30u, reply_port, 0, 0);
    if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(v12.msgh_local_port);
    }
    else if (v10)
    {
      mig_dealloc_reply_port(v12.msgh_local_port);
    }
    else if (v12.msgh_id != 1004837 {
           || (v12.msgh_bits & 0x80000000) != 0
    }
           || v12.msgh_size != 40
           || v12.msgh_remote_port
           || v15)
    {
      mach_msg_destroy(&v12);
    }
    else
    {
      float v3 = *((float *)&v15 + 1);
    }
    goto LABEL_21;
  }
  if (v5) {
LABEL_21:
  }
    CFRelease(v5);
  if (v7) {
    CFRelease(v7);
  }
LABEL_24:
  pthread_mutex_unlock(v2);
  return v3;
}

BOOL VSRecognitionIsPrepared(uint64_t a1)
{
  return *(_DWORD *)(a1 + 96) == 0;
}

uint64_t VSRecognitionGetModelIdentifier(uint64_t a1)
{
  return *(void *)(a1 + 88);
}

uint64_t VSRecognitionCopyResults(uint64_t a1)
{
  CFAllocatorRef v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(_DWORD *)(a1 + 96) == 2 && (float v3 = *(const void **)(a1 + 176)) != 0)
  {
    CFRetain(v3);
    uint64_t v4 = *(void *)(a1 + 176);
  }
  else
  {
    uint64_t v4 = 0;
  }
  pthread_mutex_unlock(v2);
  return v4;
}

void __VSGetLogDefault_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.voiceserviceslogging", "default");
  v1 = (void *)VSGetLogDefault___profile_log_default;
  VSGetLogDefault___profile_log_default = (uint64_t)v0;
}

id VSGetLogEvent()
{
  if (VSGetLogEvent_onceToken != -1) {
    dispatch_once(&VSGetLogEvent_onceToken, &__block_literal_global_4);
  }
  os_log_t v0 = (void *)VSGetLogEvent___profile_log_event;
  return v0;
}

void __VSGetLogEvent_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.voiceserviceslogging", "event");
  v1 = (void *)VSGetLogEvent___profile_log_event;
  VSGetLogEvent___profile_log_event = (uint64_t)v0;
}

double VSAbsoluteTimeToSecond(unint64_t a1)
{
  if (VSAbsoluteTimeToSecond_onceToken != -1) {
    dispatch_once(&VSAbsoluteTimeToSecond_onceToken, &__block_literal_global_7);
  }
  return *(double *)&VSAbsoluteTimeToSecond_clockFactor * (double)a1;
}

double __VSAbsoluteTimeToSecond_block_invoke()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  double result = (double)v0 / (double)v1 / 1000000000.0;
  VSAbsoluteTimeToSecond_clockFactor = *(void *)&result;
  return result;
}

uint64_t _VSServerConnectionRegisterClass()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __VSServerConnectionCFTypeID TypeID = result;
  return result;
}

BOOL _VSServerConnectionEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _VSServerConnectionDestroy(uint64_t a1)
{
  _VSServerConnectionInvalidate(a1);
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 16));
}

uint64_t _VSServerConnectionInvalidate(uint64_t a1)
{
  CFAllocatorRef v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  float v3 = *(__CFRunLoopSource **)(a1 + 96);
  if (v3)
  {
    CFRunLoopSourceInvalidate(v3);
    CFRelease(*(CFTypeRef *)(a1 + 96));
    *(void *)(a1 + 96) = 0;
  }
  uint64_t v4 = *(__CFRunLoopSource **)(a1 + 104);
  if (v4)
  {
    CFRunLoopSourceInvalidate(v4);
    CFRelease(*(CFTypeRef *)(a1 + 104));
    *(void *)(a1 + 104) = 0;
  }
  uint64_t v5 = *(const void **)(a1 + 112);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 112) = 0;
  }
  uint64_t v6 = *(void *)(a1 + 80);
  if (v6)
  {
    pthread_mutex_lock(&__ServerPortLock);
    if (__ServerInvalidationSet && __ServerPort == v6) {
      CFSetRemoveValue((CFMutableSetRef)__ServerInvalidationSet, (const void *)a1);
    }
    pthread_mutex_unlock(&__ServerPortLock);
    CFRelease(*(CFTypeRef *)(a1 + 80));
    *(void *)(a1 + 80) = 0;
  }
  unsigned int v7 = *(__CFMachPort **)(a1 + 88);
  if (v7)
  {
    CFMachPortSetInvalidationCallBack(v7, 0);
    CFMachPortInvalidate(*(CFMachPortRef *)(a1 + 88));
    mach_port_t Port = CFMachPortGetPort(*(CFMachPortRef *)(a1 + 88));
    if (Port - 1 <= 0xFFFFFFFD)
    {
      mach_port_name_t v9 = Port;
      CFIndex v10 = (ipc_space_t *)MEMORY[0x263EF8960];
      mach_port_mod_refs(*MEMORY[0x263EF8960], Port, 1u, -1);
      mach_port_deallocate(*v10, v9);
    }
    CFRelease(*(CFTypeRef *)(a1 + 88));
    *(void *)(a1 + 88) = 0;
  }
  return pthread_mutex_unlock(v2);
}

uint64_t _VSServerConnectionCreate(const __CFAllocator *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (ipc_space_t *)MEMORY[0x263EF8960];
  mach_port_name_t name = 0;
  uint64_t v7 = *MEMORY[0x263EF8960];
  memset(&v22, 0, sizeof(v22));
  pthread_once(&_VSServerConnectionGetTypeID___VSServerConnectionRegisterOnce, (void (*)(void))_VSServerConnectionRegisterClass);
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v9 = Instance;
  if (!Instance) {
    return v9;
  }
  int v24 = 0;
  v21.version = 0;
  memset(&v21.retain, 0, 56);
  v21.mach_timebase_info info = (void *)Instance;
  v21.perform = (void (__cdecl *)(void *))_VSServerConnectionProcessInvalidation;
  *(void *)(Instance + 16) = 850045863;
  *(_OWORD *)(Instance + 56) = 0u;
  *(_OWORD *)(Instance + 40) = 0u;
  *(_OWORD *)(Instance + 24) = 0u;
  *(void *)(Instance + 120) = a2;
  *(void *)(Instance + 72) = 0;
  *(void *)(Instance + 80) = 0;
  *(void *)(Instance + 88) = 0;
  *(void *)(Instance + 96) = 0;
  *(void *)(Instance + 104) = CFRunLoopSourceCreate(a1, 0, &v21);
  *(void *)(v9 + 128) = a3;
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  *(void *)(v9 + 112) = Current;
  CFRetain(Current);
  unsigned int v11 = *(__CFRunLoopSource **)(v9 + 104);
  if (v11)
  {
    CFRunLoopAddSource(*(CFRunLoopRef *)(v9 + 112), v11, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
    CFRunLoopAddSource(*(CFRunLoopRef *)(v9 + 112), *(CFRunLoopSourceRef *)(v9 + 104), @"com.apple.voiceservices");
  }
  mach_port_type_t ptype = 0x10000;
  ipc_space_t v12 = *v6;
  pthread_mutex_lock(&__ServerPortLock);
  if (__ServerPort)
  {
    mach_port_t Port = CFMachPortGetPort((CFMachPortRef)__ServerPort);
    if (Port - 1 > 0xFFFFFFFD || mach_port_type(v12, Port, &ptype) || (ptype & 0x100000) != 0)
    {
      uint64_t v14 = (__CFMachPort *)__ServerPort;
      pthread_mutex_unlock(&__ServerPortLock);
      _VSServerConnectionServerPortInvalidated(v14);
      pthread_mutex_lock(&__ServerPortLock);
    }
    CFMachPortRef v15 = (CFMachPortRef)__ServerPort;
    if (__ServerPort)
    {
      int v16 = 0;
LABEL_16:
      CFRetain(v15);
      Mutable = (__CFSet *)__ServerInvalidationSet;
      if (!__ServerInvalidationSet)
      {
        Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFFA0]);
        __ServerInvalidationSet = (uint64_t)Mutable;
      }
      CFSetAddValue(Mutable, (const void *)v9);
      goto LABEL_19;
    }
  }
  *(void *)special_port = 0;
  memset(&context, 0, sizeof(context));
  task_get_special_port(v12, 4, &special_port[1]);
  if (special_port[1] && !bootstrap_look_up(special_port[1], "com.apple.voiced", special_port))
  {
    CFMachPortRef v15 = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x263EFFB08], special_port[0], (CFMachPortCallBack)_VSServerConnectionPortEmptyCallback, &context, 0);
    __Servermach_port_t Port = (uint64_t)v15;
    int v16 = 1;
    if (v15) {
      goto LABEL_16;
    }
  }
  else
  {
    int v16 = 0;
    CFMachPortRef v15 = (CFMachPortRef)__ServerPort;
    if (__ServerPort) {
      goto LABEL_16;
    }
  }
LABEL_19:
  pthread_mutex_unlock(&__ServerPortLock);
  if (v16 && v15)
  {
    CFMachPortSetInvalidationCallBack(v15, (CFMachPortInvalidationCallBack)_VSServerConnectionServerPortInvalidated);
  }
  else if (!v15)
  {
LABEL_25:
    *(void *)(v9 + 80) = v15;
    *(void *)(v9 + 88) = 0;
LABEL_26:
    CFRelease((CFTypeRef)v9);
    return 0;
  }
  if (mach_port_allocate(v7, 1u, &name) || mach_port_insert_right(v7, name, name, 0x14u)) {
    goto LABEL_25;
  }
  v22.mach_timebase_info info = (void *)v9;
  CFIndex v19 = CFMachPortCreateWithPort(a1, name, (CFMachPortCallBack)_VSServerConnectionPortEmptyCallback, &v22, 0);
  int v24 = 16;
  MEMORY[0x2105543B0](v7, name, 1, &v24, 1);
  *(void *)(v9 + 80) = v15;
  *(void *)(v9 + 88) = v19;
  if (!v19) {
    goto LABEL_26;
  }
  CFMachPortGetPort(v19);
  v20 = (__CFRunLoopSource *)CPCreateMIGServerSourceWithContext();
  *(void *)(v9 + 96) = v20;
  if (v20)
  {
    CFRunLoopAddSource(*(CFRunLoopRef *)(v9 + 112), v20, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
    CFRunLoopAddSource(*(CFRunLoopRef *)(v9 + 112), *(CFRunLoopSourceRef *)(v9 + 96), @"com.apple.voiceservices");
  }
  return v9;
}

void _VSServerConnectionServerPortInvalidated(__CFMachPort *a1)
{
  pthread_mutex_lock(&__ServerPortLock);
  if ((__CFMachPort *)__ServerPort == a1)
  {
    CFSetRef v2 = (const __CFSet *)__ServerInvalidationSet;
    __ServerInvalidationSet = 0;
    __Servermach_port_t Port = 0;
    pthread_mutex_unlock(&__ServerPortLock);
    if (a1)
    {
      CFMachPortSetInvalidationCallBack(a1, 0);
      CFMachPortInvalidate(a1);
      mach_port_t Port = CFMachPortGetPort(a1);
      if (Port - 1 <= 0xFFFFFFFD) {
        mach_port_deallocate(*MEMORY[0x263EF8960], Port);
      }
      CFRelease(a1);
    }
    if (v2)
    {
      CFSetApplyFunction(v2, (CFSetApplierFunction)_InvalidateSingleConnection, 0);
      CFRelease(v2);
    }
  }
  else
  {
    pthread_mutex_unlock(&__ServerPortLock);
  }
}

uint64_t _InvalidateSingleConnection(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    CFSetRef v2 = (pthread_mutex_t *)(result + 16);
    pthread_mutex_lock((pthread_mutex_t *)(result + 16));
    float v3 = *(const void **)(v1 + 80);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(v1 + 80) = 0;
    }
    uint64_t v4 = *(__CFRunLoopSource **)(v1 + 104);
    if (v4 && *(void *)(v1 + 112))
    {
      CFRunLoopSourceSignal(v4);
      CFRunLoopWakeUp(*(CFRunLoopRef *)(v1 + 112));
    }
    return pthread_mutex_unlock(v2);
  }
  return result;
}

uint64_t _VSServerConnectionProcessInvalidation(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, __CFString *, void, void))(a1 + 120))(a1, @"note.server.died", 0, *(void *)(a1 + 128));
}

const void *_VSServerConnectionCopyServerPort(uint64_t a1)
{
  CFSetRef v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  float v3 = *(const void **)(a1 + 80);
  if (v3) {
    CFRetain(v3);
  }
  pthread_mutex_unlock(v2);
  return v3;
}

const void *_VSServerConnectionCopyClientPort(uint64_t a1)
{
  CFSetRef v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  float v3 = *(const void **)(a1 + 88);
  if (v3) {
    CFRetain(v3);
  }
  pthread_mutex_unlock(v2);
  return v3;
}

void client_VSPostNotification(const char *a1, const UInt8 *a2, unsigned int a3)
{
  uint64_t v6 = (void *)CPGetContextForCalloutCurrentMIGServerSource();
  if (!v6) {
    return;
  }
  uint64_t v7 = v6;
  if (!v6[15]) {
    return;
  }
  CFAllocatorRef v8 = CFGetAllocator(v6);
  CFStringRef v9 = CFStringCreateWithCString(v8, a1, 0x8000100u);
  if (!v9) {
    return;
  }
  CFStringRef v10 = v9;
  if (!CFStringGetLength(v9))
  {
LABEL_12:
    unsigned int v11 = 0;
    goto LABEL_13;
  }
  unsigned int v11 = 0;
  if (a2 && a3)
  {
    CFDataRef v12 = CFDataCreateWithBytesNoCopy(v8, a2, a3, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
    if (v12)
    {
      CFDataRef v13 = v12;
      CFPropertyListRef v14 = VSCFPropertyListCreateFromBinaryXMLData(v8, v12);
      unsigned int v11 = v14;
      if (v14)
      {
        CFTypeID v15 = CFGetTypeID(v14);
        if (v15 != CFDictionaryGetTypeID())
        {
          CFRelease(v11);
          unsigned int v11 = 0;
        }
      }
      CFRelease(v13);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_13:
  ((void (*)(void *, const __CFString *, const void *, void))v7[15])(v7, v10, v11, v7[16]);
  CFRelease(v10);
  if (v11)
  {
    CFRelease(v11);
  }
}

CFURLRef VSLogBundleCreate(const __CFAllocator *a1)
{
  valuePtr[128] = *MEMORY[0x263EF8340];
  char v25 = 0;
  pthread_once(&_VSLogBundleGetMainDirectoryURL___CreateMainDirectoryOnce, _VSLogBundleCreateMainLogDirectory);
  CFURLRef v2 = (const __CFURL *)__MainDirectory;
  float v3 = (__CFDateFormatter *)__DateFormatter;
  if (__MainDirectory) {
    BOOL v4 = __DateFormatter == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    return 0;
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFStringRef StringWithAbsoluteTime = CFDateFormatterCreateStringWithAbsoluteTime(a1, v3, Current);
  if (!StringWithAbsoluteTime) {
    return 0;
  }
  CFStringRef v7 = StringWithAbsoluteTime;
  CFURLRef v8 = CFURLCreateCopyAppendingPathComponent(a1, v2, StringWithAbsoluteTime, 1u);
  CFURLRef v9 = v8;
  if (v8)
  {
    if (VSDirectoryExistsAtURL((uint64_t)v8, 1, &v25)
      || VSCreateDirectory(v2) && VSDirectoryExistsAtURL((uint64_t)v9, 1, &v25))
    {
      pthread_once(&_VSLogBundleGetMainDirectoryURL___CreateMainDirectoryOnce, _VSLogBundleCreateMainLogDirectory);
      CFArrayRef v10 = (const __CFArray *)VSCopyContentsOfDirectoryAtURL(__MainDirectory, 0);
      CFArrayRef v11 = v10;
      if (v10) {
        CFIndex Count = CFArrayGetCount(v10);
      }
      else {
        CFIndex Count = 0;
      }
      uint64_t v13 = 25;
      valuePtr[0] = 25;
      CFNumberRef v14 = (const __CFNumber *)CFPreferencesCopyAppValue(@"MaxLogCount", @"com.apple.voiceservices");
      if (v14)
      {
        CFNumberRef v15 = v14;
        CFNumberGetValue(v14, kCFNumberCFIndexType, valuePtr);
        if (valuePtr[0] <= 24) {
          valuePtr[0] = 25;
        }
        CFRelease(v15);
        uint64_t v13 = valuePtr[0];
      }
      if (Count > v13)
      {
        MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v11);
        if (MutableCopy)
        {
          CFArrayRef v17 = MutableCopy;
          v28.location = 0;
          v28.length = Count;
          CFArraySortValues(MutableCopy, v28, (CFComparatorFunction)_CompareURLsByModificationDate, 0);
          v29.length = Count - valuePtr[0];
          v29.location = 0;
          CFArrayApplyFunction(v17, v29, (CFArrayApplierFunction)_DeleteLogURL, 0);
          CFRelease(v17);
        }
      }
      if (v11) {
        CFRelease(v11);
      }
      if (v25)
      {
        CFStringRef PathComponent = CFURLCopyLastPathComponent(v9);
        if (PathComponent)
        {
          CFStringRef v19 = PathComponent;
          if (CFStringGetFileSystemRepresentation(PathComponent, (char *)valuePtr, 1024))
          {
            pthread_once(&_VSLogBundleGetMainDirectoryURL___CreateMainDirectoryOnce, _VSLogBundleCreateMainLogDirectory);
            CFURLRef v20 = (const __CFURL *)__MainDirectory;
            if (__MainDirectory)
            {
              CFAllocatorRef v21 = CFGetAllocator(v9);
              CFURLRef v22 = CFURLCreateCopyAppendingPathComponent(v21, v20, @"Latest.vslog", 0);
              if (v22)
              {
                CFURLRef v23 = v22;
                if (CFURLGetFileSystemRepresentation(v22, 1u, buffer, 1024))
                {
                  unlink((const char *)buffer);
                  symlink((const char *)valuePtr, (const char *)buffer);
                }
                CFRelease(v23);
              }
            }
          }
          CFRelease(v19);
        }
      }
    }
    else
    {
      CFRelease(v9);
      CFURLRef v9 = 0;
    }
  }
  CFRelease(v7);
  return v9;
}

uint64_t _DeleteLogURL(uint64_t a1)
{
  VSCFURLDeleteDirectoryContents(a1);
  CFURLRef v2 = (void *)[MEMORY[0x263F08850] defaultManager];
  return [v2 removeItemAtURL:a1 error:0];
}

uint64_t _CompareURLsByModificationDate(void *a1, void *a2)
{
  CFDateRef v3 = (const __CFDate *)VSCopyModificationDateForFileAtURL(a1);
  CFDateRef v4 = (const __CFDate *)VSCopyModificationDateForFileAtURL(a2);
  CFDateRef v5 = v4;
  if (v3 && v4)
  {
    uint64_t v6 = CFDateCompare(v3, v4, 0);
  }
  else if (!v3 || v4)
  {
    if (v4) {
      BOOL v7 = v3 == 0;
    }
    else {
      BOOL v7 = 0;
    }
    uint64_t v8 = v7;
    uint64_t v6 = v8 << 63 >> 63;
    if (!v3) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v6 = 1;
  }
  CFRelease(v3);
LABEL_15:
  if (v5) {
    CFRelease(v5);
  }
  return v6;
}

void _VSLogBundleCreateMainLogDirectory()
{
  CFLocaleRef v0 = CFLocaleCopyCurrent();
  CFTypeRef cf = 0;
  CFTypeRef v6 = 0;
  CFTypeRef v4 = 0;
  uint64_t v1 = CFDateFormatterCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  __DateFormatter = (uint64_t)v1;
  if (v1) {
    CFDateFormatterSetFormat(v1, @"yyyy-MM-dd-HH-mm-ss'.vslog'");
  }
  if (v0) {
    CFRelease(v0);
  }
  CFURLRef v2 = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (v2)
  {
    CFURLRef v3 = v2;
    if (VSCreateURLAndDirectory(v2, @"Library", (const __CFURL **)&v6) && v6)
    {
      if (VSCreateURLAndDirectory((CFURLRef)v6, @"Logs", (const __CFURL **)&v4) && v4)
      {
        if (VSCreateURLAndDirectory((CFURLRef)v4, @"CrashReporter", (const __CFURL **)&cf) && cf)
        {
          VSCreateURLAndDirectory((CFURLRef)cf, @"VoiceServicesRecognition", (const __CFURL **)&__MainDirectory);
          CFRelease(cf);
        }
        if (v4) {
          CFRelease(v4);
        }
      }
      if (v6) {
        CFRelease(v6);
      }
    }
    CFRelease(v3);
  }
}

CFURLRef VSLogBundleCreateFromPath(const __CFAllocator *a1, const __CFString *a2)
{
  CFURLRef v2 = CFURLCreateWithFileSystemPath(a1, a2, kCFURLPOSIXPathStyle, 1u);
  CFURLRef v3 = v2;
  if (v2 && !VSDirectoryExistsAtURL((uint64_t)v2, 1, 0))
  {
    CFRelease(v3);
    return 0;
  }
  return v3;
}

CFURLRef VSLogBundleCopyPath(const __CFURL *result)
{
  if (result) {
    return (const __CFURL *)CFURLCopyFileSystemPath(result, kCFURLPOSIXPathStyle);
  }
  return result;
}

CFTypeRef VSLogBundleCopyURL(CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  return cf;
}

CFURLRef VSLogBundleCopyPathForFile(const __CFURL *a1, const __CFString *a2, int a3)
{
  CFURLRef result = VSLogBundleCopyURLForFile(a1, a2, a3);
  if (result)
  {
    CFURLRef v4 = result;
    CFStringRef v5 = CFURLCopyFileSystemPath(result, kCFURLPOSIXPathStyle);
    CFRelease(v4);
    return (const __CFURL *)v5;
  }
  return result;
}

CFURLRef VSLogBundleCopyURLForFile(const __CFURL *cf, const __CFString *a2, int a3)
{
  CFURLRef v3 = cf;
  if (!cf) {
    return v3;
  }
  CFAllocatorRef v6 = CFGetAllocator(cf);
  if (a3)
  {
    pthread_once(&VSLogBundleCopyURLForFile___CreateTimeFormatterOnce, _VSLogBundleCreateTimeFormatter);
    BOOL v7 = (__CFDateFormatter *)__TimeFormatter;
    if (__TimeFormatter)
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      CFStringRef StringWithAbsoluteTime = CFDateFormatterCreateStringWithAbsoluteTime(v6, v7, Current);
      if (StringWithAbsoluteTime)
      {
        CFStringRef v10 = StringWithAbsoluteTime;
        MutableCopy = CFStringCreateMutableCopy(v6, 0, StringWithAbsoluteTime);
        CFDataRef v12 = MutableCopy;
        if (MutableCopy)
        {
          CFStringAppend(MutableCopy, a2);
          a2 = v12;
        }
        CFRelease(v10);
        CFURLRef v3 = CFURLCreateCopyAppendingPathComponent(v6, v3, a2, 0);
        if (v12) {
          CFRelease(v12);
        }
        return v3;
      }
    }
  }
  return CFURLCreateCopyAppendingPathComponent(v6, v3, a2, 0);
}

void _VSLogBundleCreateTimeFormatter()
{
  CFLocaleRef v0 = CFLocaleCopyCurrent();
  uint64_t v1 = CFDateFormatterCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  __TimeFormatter = (uint64_t)v1;
  if (v0)
  {
    CFRelease(v0);
    uint64_t v1 = (__CFDateFormatter *)__TimeFormatter;
  }
  if (v1)
  {
    CFDateFormatterSetFormat(v1, @"HH-mm-ss-");
  }
}

uint64_t VSRecognitionResultGetTypeID()
{
  return __VSRecognitionResultTypeID;
}

uint64_t _VSRecognitionResultRegisterClass()
{
  __VSRecognitionResultCFTypeID TypeID = _CFRuntimeRegisterClass();
  return MEMORY[0x270EE56E8]();
}

__CFString *_VSRecognitionResultCopyDescription(uint64_t a1)
{
  return VSRecognitionResultCopyDescriptionWithIndent(a1, 0);
}

__CFString *VSRecognitionResultCopyDescriptionWithIndent(uint64_t a1, uint64_t a2)
{
  CFArrayRef v3 = *(const __CFArray **)(a1 + 24);
  if (!v3) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount(v3);
  if (Count < 1) {
    return 0;
  }
  CFIndex v6 = Count;
  CFAllocatorRef v7 = CFGetAllocator((CFTypeRef)a1);
  Mutable = CFStringCreateMutable(v7, 0);
  for (CFIndex i = 0; i != v6; ++i)
  {
    if (i) {
      CFStringAppend(Mutable, @" + ");
    }
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 24), i);
    CFStringAppend(Mutable, ValueAtIndex);
  }
  CFStringAppend(Mutable, @"\n");
  CFArrayRef v11 = *(const __CFArray **)(a1 + 16);
  if (v11)
  {
    CFIndex v12 = CFArrayGetCount(v11);
    if (v12)
    {
      uint64_t v13 = v12;
      if (a2 >= 1)
      {
        do
        {
          CFStringAppend(Mutable, @" ");
          --a2;
        }
        while (a2);
      }
      if (v13 >= 1)
      {
        for (CFIndex j = 0; j != v13; ++j)
        {
          if (j) {
            CFStringRef v15 = @" + ";
          }
          else {
            CFStringRef v15 = CFSTR("  (");
          }
          CFStringAppend(Mutable, v15);
          CFStringRef v16 = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 16), j);
          CFStringAppend(Mutable, v16);
        }
        CFStringAppendFormat(Mutable, 0, @" <%@>"), *(void *)(a1 + 32));
      }
    }
  }
  return Mutable;
}

BOOL _VSRecognitionResultEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void _VSRecognitionResultDestroy(void *a1)
{
  CFURLRef v2 = (const void *)a1[2];
  if (v2) {
    CFRelease(v2);
  }
  CFArrayRef v3 = (const void *)a1[3];
  if (v3) {
    CFRelease(v3);
  }
  CFURLRef v4 = (const void *)a1[4];
  if (v4) {
    CFRelease(v4);
  }
  CFStringRef v5 = (const void *)a1[5];
  if (v5)
  {
    CFRelease(v5);
  }
}

void *VSRecognitionResultCreate(int a1, const void *a2, const void *a3, const __CFArray *a4)
{
  return VSRecognitionResultCreateWithHandlerInfo(a1, a2, a3, a4, 0);
}

void *VSRecognitionResultCreateWithHandlerInfo(int a1, const void *a2, const void *a3, CFArrayRef theArray, const void *a5)
{
  CFStringRef v5 = 0;
  if (a3 && theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count == CFArrayGetCount((CFArrayRef)a3))
    {
      pthread_once(&VSRecognitionResultGetTypeID___VSRecognitionResultRegisterOnce, (void (*)(void))_VSRecognitionResultRegisterClass);
      uint64_t Instance = _CFRuntimeCreateInstance();
      CFStringRef v5 = (void *)Instance;
      if (Instance)
      {
        *(void *)(Instance + 16) = a3;
        CFRetain(a3);
        v5[3] = theArray;
        CFRetain(theArray);
        v5[4] = a2;
        if (a2) {
          CFRetain(a2);
        }
        v5[5] = a5;
        if (a5) {
          CFRetain(a5);
        }
        v5[6] = 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

void *VSRecognitionResultCreateFromDictionaryRepresentation(int a1, CFDictionaryRef theDict)
{
  CFArrayRef Value = CFDictionaryGetValue(theDict, @"classes");
  CFStringRef v5 = CFDictionaryGetValue(theDict, @"phrases");
  CFIndex v6 = CFDictionaryGetValue(theDict, @"modelid");
  CFAllocatorRef v7 = CFDictionaryGetValue(theDict, @"handler");
  if (!v5) {
    return 0;
  }
  if (!Value) {
    return 0;
  }
  if (!v6) {
    return 0;
  }
  uint64_t v8 = v7;
  CFTypeID v9 = CFGetTypeID(v5);
  if (v9 != CFArrayGetTypeID()) {
    return 0;
  }
  CFTypeID v10 = CFGetTypeID(Value);
  if (v10 != CFArrayGetTypeID()) {
    return 0;
  }
  CFTypeID v11 = CFGetTypeID(v6);
  if (v11 != CFStringGetTypeID()) {
    return 0;
  }
  return VSRecognitionResultCreateWithHandlerInfo(a1, v6, Value, (CFArrayRef)v5, v8);
}

uint64_t VSRecognitionResultGetModelIdentifier(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

CFArrayRef VSRecognitionResultGetPhraseCount(uint64_t a1)
{
  CFArrayRef result = *(const __CFArray **)(a1 + 24);
  if (result) {
    return (const __CFArray *)CFArrayGetCount(result);
  }
  return result;
}

CFArrayRef VSRecognitionResultGetPhraseAtIndex(uint64_t a1, CFIndex a2, const __CFArray **a3, const __CFArray **a4)
{
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  CFArrayRef result = *(const __CFArray **)(a1 + 24);
  if (result)
  {
    CFArrayRef result = (const __CFArray *)CFArrayGetCount(result);
    if ((uint64_t)result > a2)
    {
      if (a4)
      {
        CFArrayRef result = (const __CFArray *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 24), a2);
        *a4 = result;
      }
      if (a3)
      {
        CFArrayRef result = (const __CFArray *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 16), a2);
        *a3 = result;
      }
    }
  }
  return result;
}

CFTypeRef *VSRecognitionResultCopyClassIDsAndPhrases(CFTypeRef *result, void *a2, void *a3)
{
  CFURLRef v4 = result;
  if (a2)
  {
    *a2 = result[2];
    CFArrayRef result = (CFTypeRef *)CFRetain(result[2]);
  }
  if (a3)
  {
    *a3 = v4[3];
    CFTypeRef v5 = v4[3];
    return (CFTypeRef *)CFRetain(v5);
  }
  return result;
}

uint64_t VSRecognitionResultSetContext(uint64_t result, uint64_t a2)
{
  *(void *)(result + 48) = a2;
  return result;
}

uint64_t VSRecognitionResultGetContext(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

uint64_t VSRecognitionResultGetHandlerInfoString(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

__CFDictionary *VSRecognitionResultCreateDictionaryRepresentationWithResultHandlerInfo(void *a1, const void *a2)
{
  CFAllocatorRef v4 = CFGetAllocator(a1);
  Mutable = CFDictionaryCreateMutable(v4, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFIndex v6 = Mutable;
  CFAllocatorRef v7 = (const void *)a1[3];
  if (v7) {
    CFDictionarySetValue(Mutable, @"phrases", v7);
  }
  uint64_t v8 = (const void *)a1[2];
  if (v8) {
    CFDictionarySetValue(v6, @"classes", v8);
  }
  CFTypeID v9 = (const void *)a1[4];
  if (v9) {
    CFDictionarySetValue(v6, @"modelid", v9);
  }
  if (a2) {
    CFDictionarySetValue(v6, @"handler", a2);
  }
  return v6;
}

__CFDictionary *VSRecognitionResultCreateDictionaryRepresentation(void *a1)
{
  return VSRecognitionResultCreateDictionaryRepresentationWithResultHandlerInfo(a1, 0);
}

BOOL VSPluginRegistryRebuild(char a1)
{
  uint64_t v2 = _VSServerConnectionCreate((const __CFAllocator *)*MEMORY[0x263EFFB08], 0, 0);
  if (!v2) {
    return 0;
  }
  CFArrayRef v3 = (const void *)v2;
  CFAllocatorRef v4 = (__CFMachPort *)_VSServerConnectionCopyServerPort(v2);
  if (v4)
  {
    CFTypeRef v5 = v4;
    mach_port_t Port = CFMachPortGetPort(v4);
    uint64_t v10 = *MEMORY[0x263EF80C8];
    char v11 = a1;
    __int16 v12 = 0;
    char v13 = 0;
    *(void *)&msg.msgh_bits = 19;
    msg.msgh_voucher_port = 0;
    msg.msgh_id = 1004742;
    msg.msgh_remote_port = Port;
    msg.msgh_local_port = 0;
    if (MEMORY[0x263EF8B00]) {
      voucher_mach_msg_set(&msg);
    }
    BOOL v7 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0) == 0;
    CFRelease(v5);
  }
  else
  {
    BOOL v7 = 0;
  }
  _VSServerConnectionInvalidate((uint64_t)v3);
  CFRelease(v3);
  return v7;
}

BOOL VSRecognitionConfigurationCacheUpdate(const __CFString *a1, const __CFString *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v4 = _VSServerConnectionCreate((const __CFAllocator *)*MEMORY[0x263EFFB08], 0, 0);
  if (v4)
  {
    CFTypeRef v5 = (const void *)v4;
    CFIndex v20 = 0;
    CFIndex usedBufLen = 0;
    CFIndex v6 = (__CFMachPort *)_VSServerConnectionCopyServerPort(v4);
    if (!v6)
    {
      BOOL v12 = 0;
LABEL_28:
      _VSServerConnectionInvalidate((uint64_t)v5);
      CFRelease(v5);
      return v12;
    }
    BOOL v7 = v6;
    if (a1)
    {
      CFIndex Length = CFStringGetLength(a1);
      CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      CFIndex v10 = MaximumSizeForEncoding;
      CFIndex usedBufLen = MaximumSizeForEncoding;
      if (MaximumSizeForEncoding >= 257) {
        char v11 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding, 0x59F980F3uLL);
      }
      else {
        char v11 = buffer;
      }
      v36.location = 0;
      v36.length = Length;
      BOOL v13 = CFStringGetBytes(a1, v36, 0x8000100u, 0, 0, v11, v10, &usedBufLen) != 0;
      if (a2)
      {
LABEL_12:
        CFIndex v15 = CFStringGetLength(a2);
        CFIndex v16 = CFStringGetMaximumSizeForEncoding(v15, 0x8000100u);
        CFIndex v17 = v16;
        CFIndex v20 = v16;
        if (v16 >= 257) {
          CFNumberRef v14 = (UInt8 *)malloc_type_malloc(v16, 0x178D8BDBuLL);
        }
        else {
          CFNumberRef v14 = v33;
        }
        v37.location = 0;
        v37.length = v15;
        if (!CFStringGetBytes(a2, v37, 0x8000100u, 0, 0, v14, v17, &v20)) {
          goto LABEL_20;
        }
        goto LABEL_16;
      }
    }
    else
    {
      char v11 = 0;
      CFIndex usedBufLen = 0;
      BOOL v13 = 1;
      if (a2) {
        goto LABEL_12;
      }
    }
    CFNumberRef v14 = 0;
    CFIndex v20 = 0;
LABEL_16:
    if (v13)
    {
      mach_port_t Port = CFMachPortGetPort(v7);
      CFURLRef v23 = v11;
      int v24 = 16777472;
      int v25 = usedBufLen;
      int v26 = v14;
      int v27 = 16777472;
      int v28 = v20;
      uint64_t v29 = *MEMORY[0x263EF80C8];
      int v30 = 0;
      int v31 = usedBufLen;
      int v32 = v20;
      *(void *)mach_msg_header_t msg = 2147483667;
      *(_DWORD *)&msg[8] = Port;
      *(_OWORD *)&msg[12] = xmmword_20CB03480;
      if (MEMORY[0x263EF8B00]) {
        voucher_mach_msg_set((mach_msg_header_t *)msg);
      }
      BOOL v12 = mach_msg((mach_msg_header_t *)msg, 1, 0x50u, 0, 0, 0, 0) == 0;
      goto LABEL_21;
    }
LABEL_20:
    BOOL v12 = 0;
LABEL_21:
    if (v11 && v11 != buffer) {
      free(v11);
    }
    if (v14 && v14 != v33) {
      free(v14);
    }
    CFRelease(v7);
    goto LABEL_28;
  }
  return 0;
}

const void *VSCopyUpdatableRecognitionModelDataProviderInfos()
{
  mach_msg_return_t v7;
  const void *v8;
  vm_size_t v9;
  vm_address_t v10;
  CFDataRef v11;
  CFDataRef v12;
  CFPropertyListRef v13;
  CFTypeID v14;
  int msg;
  int msg_4;
  mach_port_t msg_8;
  mach_port_t msg_12;
  unsigned char msg_16[48];
  uint64_t v21;

  CFAllocatorRef v21 = *MEMORY[0x263EF8340];
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v1 = _VSServerConnectionCreate((const __CFAllocator *)*MEMORY[0x263EFFB08], 0, 0);
  if (v1)
  {
    uint64_t v2 = (const void *)v1;
    CFArrayRef v3 = (__CFMachPort *)_VSServerConnectionCopyServerPort(v1);
    if (!v3)
    {
      uint64_t v8 = 0;
LABEL_28:
      _VSServerConnectionInvalidate((uint64_t)v2);
      CFRelease(v2);
      return v8;
    }
    uint64_t v4 = v3;
    mach_port_t Port = CFMachPortGetPort(v3);
    memset(&msg_16[4], 0, 44);
    msg_4 = 0;
    mach_port_t reply_port = mig_get_reply_port();
    msg_8 = Port;
    msg_12 = reply_port;
    mach_msg_header_t msg = 5395;
    *(void *)msg_16 = 0xF54C400000000;
    if (MEMORY[0x263EF8B00])
    {
      voucher_mach_msg_set((mach_msg_header_t *)&msg);
      mach_port_t reply_port = msg_12;
    }
    BOOL v7 = mach_msg((mach_msg_header_t *)&msg, 3, 0x18u, 0x40u, reply_port, 0, 0);
    if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg_12);
    }
    else if (v7)
    {
      mig_dealloc_reply_port(msg_12);
    }
    else
    {
      if (*(_DWORD *)&msg_16[4] == 1004840
        && msg < 0
        && *(_DWORD *)&msg_16[8] == 1
        && msg_4 == 56
        && !msg_8
        && msg_16[23] == 1)
      {
        CFTypeID v9 = *(unsigned int *)&msg_16[24];
        if (*(_DWORD *)&msg_16[24] == *(_DWORD *)&msg_16[36])
        {
          uint64_t v8 = 0;
          CFIndex v10 = *(void *)&msg_16[12];
          if (*(void *)&msg_16[12])
          {
            char v11 = CFDataCreateWithBytesNoCopy(v0, *(const UInt8 **)&msg_16[12], *(unsigned int *)&msg_16[24], (CFAllocatorRef)*MEMORY[0x263EFFB28]);
            if (v11)
            {
              BOOL v12 = v11;
              BOOL v13 = VSCFPropertyListCreateFromBinaryXMLData(v0, v11);
              uint64_t v8 = v13;
              if (v13)
              {
                CFNumberRef v14 = CFGetTypeID(v13);
                if (v14 != CFDictionaryGetTypeID())
                {
                  CFRelease(v8);
                  uint64_t v8 = 0;
                }
              }
              CFRelease(v12);
            }
            else
            {
              uint64_t v8 = 0;
            }
            mig_deallocate(v10, v9);
          }
          goto LABEL_27;
        }
      }
      mach_msg_destroy((mach_msg_header_t *)&msg);
    }
    uint64_t v8 = 0;
LABEL_27:
    CFRelease(v4);
    goto LABEL_28;
  }
  return 0;
}

CFStringRef VSRecognitionPluginInfoCreateString(const __CFURL *a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  if (!a2) {
    return 0;
  }
  CFStringRef v3 = CFURLCopyFileSystemPath(a1, kCFURLPOSIXPathStyle);
  if (!v3) {
    return 0;
  }
  CFStringRef v4 = v3;
  CFStringRef v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@:%@", a2, v3);
  CFRelease(v4);
  return v5;
}

uint64_t VSRecognitionPluginStringCopyInfo(CFStringRef theString, CFURLRef *a2, CFStringRef *a3)
{
  if (a3) {
    *a3 = 0;
  }
  if (a2) {
    *a2 = 0;
  }
  if (!theString) {
    return 0;
  }
  CFRange v6 = CFStringFind(theString, @":", 0);
  if (v6.location == -1) {
    return 0;
  }
  CFIndex Length = CFStringGetLength(theString);
  uint64_t v8 = 0;
  if (v6.location >= 1)
  {
    CFIndex v9 = Length - (v6.location + v6.length);
    if (Length > v6.location + v6.length)
    {
      CFIndex v10 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
      if (a3)
      {
        v15.location = 0;
        v15.length = v6.location;
        *a3 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x263EFFB08], theString, v15);
      }
      if (a2
        && (CFAllocatorRef v11 = *v10,
            v16.location = v6.location + v6.length,
            v16.length = v9,
            (CFStringRef v12 = CFStringCreateWithSubstring(*v10, theString, v16)) != 0))
      {
        CFStringRef v13 = v12;
        uint64_t v8 = 1;
        *a2 = CFURLCreateWithFileSystemPath(v11, v12, kCFURLPOSIXPathStyle, 1u);
        CFRelease(v13);
      }
      else
      {
        return 1;
      }
    }
  }
  return v8;
}

uint64_t VSRecognitionDisambiguationContextGetTypeID()
{
  return __VSRecognitionDisambiguationContextTypeID;
}

uint64_t _VSRecognitionDisambiguationContextRegisterClass()
{
  __VSRecognitionDisambiguationContextCFTypeID TypeID = _CFRuntimeRegisterClass();
  return MEMORY[0x270EE56E8]();
}

__CFString *_VSRecognitionDisambiguationContextDescribe(uint64_t a1)
{
  CFAllocatorRef v2 = CFGetAllocator((CFTypeRef)a1);
  Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, @"<VSRecognitionDisambiguationContext %p [%@]> ", a1, *(void *)(a1 + 16));
  CFStringAppendFormat(Mutable, 0, @" will disambiguate with sequence tag %@\n", *(void *)(a1 + 24));
  uint64_t v4 = *(void *)(a1 + 40);
  CFMachPortContext context = Mutable;
  uint64_t v7 = v4;
  CFStringAppend(Mutable, @" known class values:\n");
  CFDictionaryApplyFunction(*(CFDictionaryRef *)(a1 + 32), (CFDictionaryApplierFunction)_AppendKnownValueToString, &context);
  uint64_t v7 = *(void *)(a1 + 56);
  CFStringAppend(Mutable, @" \nconstrained ambiguous classes:\n");
  CFDictionaryApplyFunction(*(CFDictionaryRef *)(a1 + 48), (CFDictionaryApplierFunction)_AppendAmbiguousClassToString, &context);
  return Mutable;
}

void _AppendAmbiguousClassToString(void *key, const __CFArray *a2, uint64_t a3)
{
  CFDictionaryRef v6 = *(const __CFDictionary **)(a3 + 8);
  if (v6) {
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v6, key);
  }
  else {
    CFArrayRef Value = 0;
  }
  CFIndex Count = CFArrayGetCount(a2);
  CFStringAppendFormat(*(CFMutableStringRef *)a3, 0, @"  %@ =\n", key);
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      if (Value
        && (CFStringRef v10 = (const __CFString *)CFArrayGetValueAtIndex(Value, i)) != 0
        && (CFStringRef v11 = v10, CFStringGetLength(v10)))
      {
        CFStringRef v12 = *(__CFString **)a3;
        CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(a2, i);
        CFStringAppendFormat(v12, 0, @"     \"%@\" (%@)\n", ValueAtIndex, v11);
      }
      else
      {
        CFStringRef v13 = *(__CFString **)a3;
        CFRange v15 = CFArrayGetValueAtIndex(a2, i);
        CFStringAppendFormat(v13, 0, @"     \"%@\"\n", v15, v16);
      }
    }
  }
}

void _AppendKnownValueToString(void *key, uint64_t a2, uint64_t a3)
{
  CFDictionaryRef v6 = *(const __CFDictionary **)(a3 + 8);
  if (v6
    && (CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v6, key)) != 0
    && (CFStringRef v8 = Value, CFStringGetLength(Value)))
  {
    CFStringAppendFormat(*(CFMutableStringRef *)a3, 0, @"  %@ = \"%@\" (%@)\n", key, a2, v8);
  }
  else
  {
    CFStringAppendFormat(*(CFMutableStringRef *)a3, 0, @"  %@ = \"%@\"\n", key, a2);
  }
}

BOOL _VSRecognitionDisambiguationContextEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void _VSRecognitionDisambiguationContextDestroy(void *a1)
{
  CFAllocatorRef v2 = (const void *)a1[2];
  if (v2) {
    CFRelease(v2);
  }
  CFStringRef v3 = (const void *)a1[3];
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (const void *)a1[4];
  if (v4) {
    CFRelease(v4);
  }
  CFStringRef v5 = (const void *)a1[5];
  if (v5) {
    CFRelease(v5);
  }
  CFDictionaryRef v6 = (const void *)a1[6];
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = (const void *)a1[7];
  if (v7)
  {
    CFRelease(v7);
  }
}

void *VSRecognitionDisambiguationContextCreate(int a1, const void *a2, const void *a3, CFDictionaryRef theDict, const void *a5, const void *a6, const void *a7)
{
  uint64_t Instance = 0;
  if (a2)
  {
    if (a3)
    {
      if (theDict)
      {
        CFIndex Count = CFDictionaryGetCount(theDict);
        uint64_t Instance = 0;
        if (a6)
        {
          if (Count)
          {
            if (CFDictionaryGetCount((CFDictionaryRef)a6))
            {
              pthread_once(&VSRecognitionDisambiguationContextGetTypeID___VSRecognitionDisambiguationContextRegisterOnce, (void (*)(void))_VSRecognitionDisambiguationContextRegisterClass);
              uint64_t Instance = (void *)_CFRuntimeCreateInstance();
              Instance[2] = a2;
              CFRetain(a2);
              Instance[3] = a3;
              CFRetain(a3);
              Instance[4] = theDict;
              CFRetain(theDict);
              Instance[5] = a5;
              if (a5) {
                CFRetain(a5);
              }
              Instance[6] = a6;
              CFRetain(a6);
              Instance[7] = a7;
              if (a7) {
                CFRetain(a7);
              }
            }
            else
            {
              return 0;
            }
          }
        }
      }
    }
  }
  return Instance;
}

void *VSRecognitionDisambiguationContextCreateFromDictionaryRepresentation(int a1, CFDictionaryRef theDict)
{
  CFStringRef Value = CFDictionaryGetValue(theDict, @"modelid");
  CFStringRef v5 = CFDictionaryGetValue(theDict, @"seqtag");
  CFDictionaryRef v6 = CFDictionaryGetValue(theDict, @"known");
  uint64_t v7 = CFDictionaryGetValue(theDict, @"knownp");
  CFStringRef v8 = CFDictionaryGetValue(theDict, @"ambig");
  CFIndex v9 = CFDictionaryGetValue(theDict, @"ambigp");
  CFTypeID TypeID = CFStringGetTypeID();
  CFTypeID v11 = CFDictionaryGetTypeID();
  if (!Value) {
    return 0;
  }
  if (!v5) {
    return 0;
  }
  if (!v6) {
    return 0;
  }
  if (!v8) {
    return 0;
  }
  CFTypeID v12 = v11;
  if (CFGetTypeID(Value) != TypeID
    || CFGetTypeID(v5) != TypeID
    || CFGetTypeID(v6) != v12
    || CFGetTypeID(v8) != v12
    || v7 && CFGetTypeID(v7) != v12)
  {
    return 0;
  }
  if (!v9)
  {
    int v13 = a1;
    CFNumberRef v14 = Value;
    CFRange v15 = v5;
    CFDictionaryRef v16 = (const __CFDictionary *)v6;
    CFIndex v17 = v7;
    v18 = v8;
    CFStringRef v19 = 0;
    goto LABEL_16;
  }
  if (CFGetTypeID(v9) != v12) {
    return 0;
  }
  int v13 = a1;
  CFNumberRef v14 = Value;
  CFRange v15 = v5;
  CFDictionaryRef v16 = (const __CFDictionary *)v6;
  CFIndex v17 = v7;
  v18 = v8;
  CFStringRef v19 = v9;
LABEL_16:
  return VSRecognitionDisambiguationContextCreate(v13, v14, v15, v16, v17, v18, v19);
}

CFDictionaryRef VSRecognitionDisambiguationContextCreateDictionaryRepresentation(const __CFAllocator *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  *(_OWORD *)keys = xmmword_2640E8338;
  long long v13 = *(_OWORD *)&off_2640E8348;
  uint64_t v2 = *(void *)(a2 + 40);
  uint64_t v3 = *(void *)(a2 + 48);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = v3;
  long long v14 = xmmword_2640E8358;
  long long v7 = *(_OWORD *)(a2 + 16);
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  if (v2)
  {
    *(void *)&long long v14 = @"knownp";
    uint64_t v10 = v2;
    CFIndex v4 = 5;
  }
  else
  {
    CFIndex v4 = 4;
  }
  uint64_t v5 = *(void *)(a2 + 56);
  if (v5)
  {
    keys[v4] = @"ambigp";
    *((void *)&v7 + v4++) = v5;
  }
  return CFDictionaryCreate(a1, (const void **)keys, (const void **)&v7, v4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
}

uint64_t VSRecognitionDisambiguationContextGetModelIdentifier(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t VSRecognitionDisambiguationContextGetSequenceTag(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t VSRecognitionDisambiguationContextGetKnownClassValues(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t VSRecognitionDisambiguationContextGetAmbiguousClassValues(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

uint64_t VSRecognitionDisambiguationContextGetKnownClassValue(uint64_t a1, void *key, void *a3, const void **a4)
{
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, key);
    if (result)
    {
      if (a3) {
        *a3 = result;
      }
      if (a4)
      {
        CFDictionaryRef v9 = *(const __CFDictionary **)(a1 + 40);
        if (v9) {
          *a4 = CFDictionaryGetValue(v9, key);
        }
      }
      return 1;
    }
  }
  return result;
}

uint64_t VSRecognitionDisambiguationContextGetAmbiguousClassValueAtIndex(uint64_t a1, void *key, CFIndex a3, const void **a4, const void **a5)
{
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, key);
    if (result)
    {
      CFArrayRef v11 = (const __CFArray *)result;
      if (CFArrayGetCount((CFArrayRef)result) <= a3)
      {
        return 0;
      }
      else
      {
        if (a4) {
          *a4 = CFArrayGetValueAtIndex(v11, a3);
        }
        if (a5)
        {
          CFDictionaryRef v12 = *(const __CFDictionary **)(a1 + 56);
          if (v12)
          {
            CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v12, key);
            if (Value) {
              *a5 = CFArrayGetValueAtIndex(Value, a3);
            }
          }
        }
        return 1;
      }
    }
  }
  return result;
}

CFTypeRef VSCFPropertyListCreateBinaryXMLData(CFAllocatorRef bufferAllocator, const void *a2)
{
  uint64_t v3 = CFWriteStreamCreateWithAllocatedBuffers(bufferAllocator, bufferAllocator);
  if (!v3) {
    return 0;
  }
  CFIndex v4 = v3;
  if (CFWriteStreamOpen(v3))
  {
    if (CFPropertyListWrite(a2, v4, kCFPropertyListBinaryFormat_v1_0, 0, 0)) {
      CFTypeRef v5 = CFWriteStreamCopyProperty(v4, (CFStreamPropertyKey)*MEMORY[0x263EFFE98]);
    }
    else {
      CFTypeRef v5 = 0;
    }
    CFWriteStreamClose(v4);
  }
  else
  {
    CFTypeRef v5 = 0;
  }
  CFRelease(v4);
  return v5;
}

CFPropertyListRef VSCFPropertyListCreateFromBinaryXMLData(const __CFAllocator *a1, CFDataRef theData)
{
  BytePtr = CFDataGetBytePtr(theData);
  CFIndex Length = CFDataGetLength(theData);
  CFDictionaryRef v6 = CFReadStreamCreateWithBytesNoCopy(a1, BytePtr, Length, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  if (!v6) {
    return 0;
  }
  long long v7 = v6;
  if (CFReadStreamOpen(v6))
  {
    CFPropertyListRef v8 = CFPropertyListCreateWithStream(a1, v7, 0, 0, 0, 0);
    CFReadStreamClose(v7);
  }
  else
  {
    CFPropertyListRef v8 = 0;
  }
  CFRelease(v7);
  return v8;
}

void sub_20CAD0530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
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
    CFDictionaryRef v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    CFDictionaryRef v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void SiriTTS::TextToPhoneme::~TextToPhoneme(SiriTTS::TextToPhoneme *this)
{
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void __clang_call_terminate(void *a1)
{
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2640E7EF0, MEMORY[0x263F8C060]);
}

void sub_20CAD0940(_Unwind_Exception *a1)
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

CFMutableDictionaryRef VSKeywordIndexCreate(const __CFAllocator *a1)
{
  return CFDictionaryCreateMutable(a1, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
}

const void *VSKeywordIndexCreateWithURL(const __CFAllocator *a1, const __CFURL *a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v3 = CFReadStreamCreateWithFile(a1, a2);
  if (!v3) {
    return 0;
  }
  size_t v4 = v3;
  if (CFReadStreamOpen(v3))
  {
    CFPropertyListRef v5 = CFPropertyListCreateWithStream(a1, v4, 0, 1uLL, 0, 0);
    CFDictionaryRef v6 = v5;
    if (v5)
    {
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 != CFDictionaryGetTypeID())
      {
        CFRelease(v6);
        CFDictionaryRef v6 = 0;
      }
    }
    CFReadStreamClose(v4);
  }
  else
  {
    CFDictionaryRef v6 = 0;
  }
  CFRelease(v4);
  return v6;
}

CFURLRef VSKeywordIndexCopyDefaultURL(const __CFAllocator *a1)
{
  mach_msg_return_t v8;
  CFURLRef v9;
  BOOL v10;
  int v12;
  CFStringRef v13;
  CFStringRef v14;
  _OWORD v16[64];
  int msg;
  int msg_4;
  mach_port_t msg_8;
  mach_port_t msg_12;
  unsigned char msg_16[20];
  _DWORD v22[260];
  uint64_t v23;

  CFURLRef v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = _VSServerConnectionCreate(a1, 0, 0);
  if (v2)
  {
    uint64_t v3 = (const void *)v2;
    memset(v16, 0, 512);
    size_t v4 = (__CFMachPort *)_VSServerConnectionCopyServerPort(v2);
    if (!v4)
    {
      CFDictionaryRef v9 = 0;
LABEL_34:
      _VSServerConnectionInvalidate((uint64_t)v3);
      CFRelease(v3);
      return v9;
    }
    CFPropertyListRef v5 = v4;
    mach_port_t Port = CFMachPortGetPort(v4);
    memset(v22, 0, 476);
    *(_OWORD *)&msg_16[4] = 0u;
    msg_4 = 0;
    mach_port_t reply_port = mig_get_reply_port();
    msg_12 = reply_port;
    mach_msg_header_t msg = 5395;
    msg_8 = Port;
    *(void *)msg_16 = 0xF54C500000000;
    if (MEMORY[0x263EF8B00])
    {
      voucher_mach_msg_set((mach_msg_header_t *)&msg);
      mach_port_t reply_port = msg_12;
    }
    uint64_t v8 = mach_msg((mach_msg_header_t *)&msg, 3, 0x18u, 0x434u, reply_port, 0, 0);
    if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg_12);
      goto LABEL_32;
    }
    if (v8)
    {
      mig_dealloc_reply_port(msg_12);
      goto LABEL_32;
    }
    if (*(_DWORD *)&msg_16[4] == 71)
    {
      CFDictionaryRef v12 = -308;
      goto LABEL_29;
    }
    if (*(_DWORD *)&msg_16[4] != 1004841)
    {
      CFDictionaryRef v12 = -301;
      goto LABEL_29;
    }
    if ((msg & 0x80000000) == 0)
    {
      if ((msg_4 - 1069) <= 0xFFFFFBFE)
      {
        if (msg_8) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = *(_DWORD *)&msg_16[16] == 0;
        }
        if (!v10 && msg_4 == 36) {
          CFDictionaryRef v12 = *(_DWORD *)&msg_16[16];
        }
        else {
          CFDictionaryRef v12 = -300;
        }
        goto LABEL_29;
      }
      if (!msg_8)
      {
        CFDictionaryRef v12 = *(_DWORD *)&msg_16[16];
        if (!*(_DWORD *)&msg_16[16])
        {
          CFDictionaryRef v12 = -300;
          if (v22[1] <= 0x400u && (msg_4 - 44) >= v22[1] && msg_4 == ((v22[1] + 3) & 0xFFFFFFFC) + 44)
          {
            mig_strncpy((char *)v16, (const char *)&v22[2], 1024);
LABEL_30:
            long long v13 = CFStringCreateWithFileSystemRepresentation(a1, (const char *)v16);
            if (v13)
            {
              long long v14 = v13;
              CFDictionaryRef v9 = CFURLCreateWithFileSystemPath(a1, v13, kCFURLPOSIXPathStyle, 0);
              CFRelease(v14);
LABEL_33:
              CFRelease(v5);
              goto LABEL_34;
            }
LABEL_32:
            CFDictionaryRef v9 = 0;
            goto LABEL_33;
          }
        }
LABEL_29:
        mach_msg_destroy((mach_msg_header_t *)&msg);
        if (v12) {
          goto LABEL_32;
        }
        goto LABEL_30;
      }
    }
    CFDictionaryRef v12 = -300;
    goto LABEL_29;
  }
  return 0;
}

BOOL VSKeywordIndexSaveToURL(const void *a1, const __CFURL *a2)
{
  BOOL v2 = 0;
  if (a1 && a2)
  {
    CFAllocatorRef v5 = CFGetAllocator(a1);
    CFDictionaryRef v6 = CFWriteStreamCreateWithFile(v5, a2);
    if (v6)
    {
      CFTypeID v7 = v6;
      if (CFWriteStreamOpen(v6))
      {
        BOOL v2 = CFPropertyListWrite(a1, v7, kCFPropertyListBinaryFormat_v1_0, 0, 0) != 0;
        CFWriteStreamClose(v7);
      }
      else
      {
        BOOL v2 = 0;
      }
      CFRelease(v7);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

void VSKeywordIndexSetKeywordsForClassIdentifier(const __CFDictionary *a1, int a2, void *key, const void *a4, const __CFArray *a5)
{
  CFArrayRef Value = (__CFDictionary *)CFDictionaryGetValue(a1, key);
  CFArrayRef v11 = Value;
  if (!a5)
  {
    BOOL v13 = 1;
    if (!Value) {
      return;
    }
    goto LABEL_10;
  }
  CFIndex Count = CFArrayGetCount(a5);
  BOOL v13 = Count == 0;
  if (!v11 && Count)
  {
    CFAllocatorRef v14 = CFGetAllocator(a1);
    Mutable = CFDictionaryCreateMutable(v14, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFArrayRef v11 = Mutable;
    CFDictionaryRef v16 = (const void **)MEMORY[0x263EFFB40];
    if (!a2) {
      CFDictionaryRef v16 = (const void **)MEMORY[0x263EFFB38];
    }
    CFDictionarySetValue(Mutable, @"top-level", *v16);
    CFDictionarySetValue(a1, key, v11);
    CFRelease(v11);
    BOOL v13 = 0;
  }
  if (v11)
  {
LABEL_10:
    CFTypeID TypeID = CFDictionaryGetTypeID();
    ValueIfType = (void *)VSCFDictionaryGetValueIfType(v11, @"class-kws", TypeID);
    if (ValueIfType) {
      char v19 = 1;
    }
    else {
      char v19 = v13;
    }
    if ((v19 & 1) == 0)
    {
      CFAllocatorRef v20 = CFGetAllocator(a1);
      ValueIfType = CFDictionaryCreateMutable(v20, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFDictionarySetValue(v11, @"class-kws", ValueIfType);
      CFRelease(ValueIfType);
    }
    if (ValueIfType)
    {
      if (v13)
      {
        CFDictionaryRemoveValue((CFMutableDictionaryRef)ValueIfType, a4);
      }
      else
      {
        CFDictionarySetValue((CFMutableDictionaryRef)ValueIfType, a4, a5);
      }
    }
  }
}

void VSKeywordIndexSetKeywordsForModelIdentifier(const __CFDictionary *a1, int a2, void *a3, const __CFArray *a4)
{
}

CFMutableArrayRef VSKeywordIndexCopyKeywordsForModelIdentifier(const __CFDictionary *a1, const void *a2)
{
  CFTypeID TypeID = CFDictionaryGetTypeID();
  CFDictionaryRef ValueIfType = (const __CFDictionary *)VSCFDictionaryGetValueIfType(a1, a2, TypeID);
  if (!ValueIfType) {
    return 0;
  }
  CFDictionaryRef v6 = (const __CFDictionary *)VSCFDictionaryGetValueIfType(ValueIfType, @"class-kws", TypeID);
  if (!v6) {
    return 0;
  }
  CFDictionaryRef v7 = v6;
  CFTypeID v8 = CFArrayGetTypeID();
  CFArrayRef v9 = (const __CFArray *)VSCFDictionaryGetValueIfType(v7, @"__model-kws", v8);
  if (v9 && (CFMutableArrayRef Mutable = v9, CFArrayGetCount(v9)))
  {
    CFRetain(Mutable);
  }
  else
  {
    CFAllocatorRef v11 = CFGetAllocator(a1);
    CFMutableArrayRef Mutable = CFArrayCreateMutable(v11, 0, MEMORY[0x263EFFF70]);
    CFDictionaryApplyFunction(v7, (CFDictionaryApplierFunction)_FoldClassKeywordsIntoArray, Mutable);
  }
  return Mutable;
}

void _FoldClassKeywordsIntoArray(uint64_t a1, const void *a2, __CFArray *a3)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (a2)
  {
    uint64_t v6 = TypeID;
    CFTypeID v7 = CFGetTypeID(a2);
    if (v7 == CFArrayGetTypeID())
    {
      CFIndex Count = CFArrayGetCount((CFArrayRef)a2);
      if (Count >= 1)
      {
        CFIndex v9 = Count;
        for (CFIndex i = 0; i != v9; ++i)
        {
          ValueAtIndexIfType = VSCFArrayGetValueAtIndexIfType((const __CFArray *)a2, i, v6);
          if (ValueAtIndexIfType) {
            CFArrayAppendValue(a3, ValueAtIndexIfType);
          }
        }
      }
    }
  }
}

CFMutableArrayRef VSKeywordIndexCopyKeywordsForTopLevelModels(const void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(v2, 0, MEMORY[0x263EFFF70]);
  CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)_FoldTopLevelModelKeywordsIntoArray, Mutable);
  return Mutable;
}

void _FoldTopLevelModelKeywordsIntoArray(uint64_t a1, const __CFDictionary *a2, __CFArray *a3)
{
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (a2)
  {
    uint64_t v6 = TypeID;
    if (CFGetTypeID(a2) == TypeID)
    {
      CFTypeID v7 = CFBooleanGetTypeID();
      CFDictionaryRef ValueIfType = VSCFDictionaryGetValueIfType(a2, @"top-level", v7);
      if (ValueIfType)
      {
        if (CFEqual(ValueIfType, (CFTypeRef)*MEMORY[0x263EFFB40]))
        {
          CFDictionaryRef v9 = (const __CFDictionary *)VSCFDictionaryGetValueIfType(a2, @"class-kws", v6);
          if (v9)
          {
            CFDictionaryRef v10 = v9;
            CFTypeID v11 = CFArrayGetTypeID();
            CFArrayRef v12 = (const __CFArray *)VSCFDictionaryGetValueIfType(v10, @"__model-kws", v11);
            if (v12 && (CFArrayRef v13 = v12, CFArrayGetCount(v12)))
            {
              CFArrayAppendValue(a3, v13);
            }
            else
            {
              CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
              CFDictionaryApplyFunction(v10, (CFDictionaryApplierFunction)_FoldClassKeywordsIntoArray, Mutable);
              if (CFArrayGetCount(Mutable)) {
                CFArrayAppendValue(a3, Mutable);
              }
              CFRelease(Mutable);
            }
          }
        }
      }
    }
  }
}

CFMutableArrayRef VSCFSetCreateMutableArray(const __CFAllocator *a1, CFSetRef theSet, CFIndex a3, const CFArrayCallBacks *a4)
{
  if (!theSet || CFSetGetCount(theSet) < 1) {
    return 0;
  }
  CFMutableArrayRef Mutable = CFArrayCreateMutable(a1, a3, a4);
  CFSetApplyFunction(theSet, (CFSetApplierFunction)_AddSetElementsToArray, Mutable);
  return Mutable;
}

void _AddSetElementsToArray(void *value, CFMutableArrayRef theArray)
{
  if (theArray) {
    CFArrayAppendValue(theArray, value);
  }
}

void VSCFSetSendDifferences(const __CFSet *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  context[0] = a2;
  context[1] = a3;
  context[2] = a4;
  CFSetApplyFunction(a1, (CFSetApplierFunction)_SendDifferenceElements, context);
}

uint64_t _SendDifferenceElements(uint64_t value, uint64_t *a2)
{
  if (a2)
  {
    uint64_t v3 = (const void *)value;
    value = *a2;
    if (!*a2 || (value = CFSetContainsValue((CFSetRef)value, v3), !value))
    {
      size_t v4 = (uint64_t (*)(const void *, uint64_t))a2[1];
      if (v4)
      {
        uint64_t v5 = a2[2];
        return v4(v3, v5);
      }
    }
  }
  return value;
}

const void *VSCFDictionaryGetValueIfType(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    uint64_t v5 = result;
    if (CFGetTypeID(result) == a3) {
      return v5;
    }
    else {
      return 0;
    }
  }
  return result;
}

const void *VSCFArrayGetValueAtIndexIfType(const __CFArray *a1, CFIndex a2, uint64_t a3)
{
  uint64_t result = CFArrayGetValueAtIndex(a1, a2);
  if (result)
  {
    uint64_t v5 = result;
    if (CFGetTypeID(result) == a3) {
      return v5;
    }
    else {
      return 0;
    }
  }
  return result;
}

void __assign_helper_atomic_property_(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v2 = a2[1];
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  size_t v4 = (std::__shared_weak_count *)a1[1];
  *a1 = v3;
  a1[1] = v2;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

void *__copy_helper_atomic_property_(void *result, void *a2)
{
  uint64_t v2 = a2[1];
  *uint64_t result = *a2;
  result[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::vector<TTSSynthesizer::Marker>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 56)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void sub_20CAD1980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20CAD1AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
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
    CFTypeID v8 = (std::string *)operator new(v6 + 1);
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

void sub_20CAD2228(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<TTSSynthesizer::Marker>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void sub_20CAD234C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20CAD25F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_20CAD2CB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, std::__shared_weak_count *a19, uint64_t a20,std::__shared_weak_count *a21,uint64_t a22,std::__shared_weak_count *a23,uint64_t a24,std::__shared_weak_count *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,void *__p,uint64_t a48,int a49,__int16 a50,char a51,char a52,uint64_t a53,char a54)
{
  if (a19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a19);
  }
  if (a21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a21);
  }
  if (a23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a23);
  }
  if (a25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a25);
  }
  std::__function::__value_func<int ()(TTSSynthesizer::CallbackMessage)>::~__value_func[abi:ne180100]((void *)(v58 - 144));

  _Unwind_Resume(a1);
}

void sub_20CAD2E80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__function::__value_func<void ()(void const*)>::~__value_func[abi:ne180100](void *a1)
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

void *std::__function::__value_func<int ()(TTSSynthesizer::CallbackMessage)>::~__value_func[abi:ne180100](void *a1)
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

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return 1;
  }
  if ((a2 & a1) < 0 != __OFSUB__(a1, a2)) {
    return strcmp((const char *)(a1 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(a2 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void sub_20CAD3434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, std::__split_buffer<std::string> *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a12);
  *(void *)(v13 + 8) = v12;
  _Unwind_Resume(a1);
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

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v3 = **(void **)(a1 + 16);
    uint64_t v4 = **(void **)(a1 + 8);
    while (v3 != v4)
    {
      if (*(char *)(v3 - 1) < 0) {
        operator delete(*(void **)(v3 - 24));
      }
      v3 -= 24;
    }
  }
  return a1;
}

void *std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::target_type()
{
}

uint64_t std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"U13block_pointerFiN14TTSSynthesizer15CallbackMessageEE"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

void std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = 0;
}

uint64_t std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26C1AF660;
  uint64_t result = MEMORY[0x210554730](*(void *)(a1 + 8));
  a2[1] = result;
  return result;
}

uint64_t std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::__clone()
{
  return 0;
}

void std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::~__func(uint64_t a1)
{
  JUMPOUT(0x2105540B0);
}

uint64_t std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::~__func(uint64_t a1)
{
  return a1;
}

void sub_20CAD3DE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20CAD4120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20CAD43D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, std::__shared_weak_count *a19)
{
  if (a19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a19);
  }

  _Unwind_Resume(a1);
}

void sub_20CAD4A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint8_t buf,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  _Unwind_Resume(a1);
}

void sub_20CAD4F28()
{
  _Unwind_Resume(v3);
}

void sub_20CAD4F44()
{
  _Unwind_Resume(v3);
}

void sub_20CAD4F4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  JUMPOUT(0x20CAD4F64);
}

void sub_20CAD4FF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20CAD5064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_20CAD5108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFPropertyListRef VSPreferencesCopyValueForKey(const __CFString *a1)
{
  return CFPreferencesCopyAppValue(a1, @"com.apple.voiceservices");
}

uint64_t VSPreferencesSetValueForKey(const __CFString *a1, const void *a2)
{
  CFPreferencesSetAppValue(a1, a2, @"com.apple.voiceservices");
  return CFPreferencesAppSynchronize(@"com.apple.voiceservices");
}

void VSPreferencesSetSpokenLanguageIdentifier(const __CFString *a1)
{
  CFStringRef v2 = (const __CFString *)VSPreferencesCopySpokenLanguageIdentifier();
  CFStringRef v3 = v2;
  if (v2 == a1) {
    goto LABEL_10;
  }
  if (!a1 || !v2 || CFStringCompare(v2, a1, 0))
  {
    CFPreferencesSetAppValue(@"lang-id", a1, @"com.apple.voiceservices");
    CFPreferencesAppSynchronize(@"com.apple.voiceservices");
    pthread_mutex_lock(&__VSPreferencesSpokenLanguageLock);
    if (__VSPreferencesSpokenLanguage) {
      CFRelease((CFTypeRef)__VSPreferencesSpokenLanguage);
    }
    __VSPreferencesSpokenLanguage = (uint64_t)a1;
    if (a1) {
      CFRetain(a1);
    }
    ++__VSPreferencesSpokenLanguageChangedCount;
    pthread_mutex_unlock(&__VSPreferencesSpokenLanguageLock);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.voiceservices.language", 0, 0, 1u);
LABEL_10:
    if (!v3) {
      return;
    }
  }
  CFRelease(v3);
}

void *VSPreferencesCopySpokenLanguageIdentifier()
{
  VSPreferencesInitialize();
  pthread_mutex_lock(&__VSPreferencesSpokenLanguageLock);
  SpokenLanguageIdentifier = _VSPreferencesGetSpokenLanguageIdentifier();
  uint64_t v1 = SpokenLanguageIdentifier;
  if (SpokenLanguageIdentifier) {
    CFRetain(SpokenLanguageIdentifier);
  }
  pthread_mutex_unlock(&__VSPreferencesSpokenLanguageLock);
  return v1;
}

uint64_t VSPreferencesInitialize()
{
  pthread_mutex_lock(&__VSPreferencesSpokenLanguageLock);
  if ((VSPreferencesInitialize___ObservingChanges & 1) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_VSPreferencesSpokenLanguageChangedHandler, @"com.apple.voiceservices.language", 0, CFNotificationSuspensionBehaviorDrop);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_VSPreferencesSpokenLanguageChangedHandler, (CFStringRef)*MEMORY[0x263EFFCC8], 0, CFNotificationSuspensionBehaviorDrop);
    VSPreferencesInitialize___ObservingChanges = 1;
  }
  return pthread_mutex_unlock(&__VSPreferencesSpokenLanguageLock);
}

void *_VSPreferencesGetSpokenLanguageIdentifier()
{
  uint64_t result = (void *)__VSPreferencesSpokenLanguage;
  if (!__VSPreferencesSpokenLanguage)
  {
    uint64_t result = (void *)CFPreferencesCopyAppValue(@"lang-id", @"com.apple.voiceservices");
    __VSPreferencesSpokenLanguage = (uint64_t)result;
    if (!result)
    {
      uint64_t result = (void *)_VSPreferencesCopyDefaultSpokenLanguageIdentifierForUserPreferences();
      __VSPreferencesSpokenLanguage = (uint64_t)result;
      if (!result)
      {
        uint64_t result = (void *)_VSPreferencesCopySystemLanguageIdentifier();
        __VSPreferencesSpokenLanguage = (uint64_t)result;
      }
    }
  }
  return result;
}

const void *_VSPreferencesCopyDefaultSpokenLanguageIdentifierForUserPreferences()
{
  uint64_t result = (const void *)__VSPreferencesDefaultSpokenLanguage;
  if (!__VSPreferencesDefaultSpokenLanguage)
  {
    CFLocaleRef v1 = CFLocaleCopyCurrent();
    if (!v1) {
      goto LABEL_14;
    }
    CFLocaleRef v2 = v1;
    CFStringRef v3 = _VSCopyLanguageIdentifierForLocale(v1);
    __VSPreferencesDefaultSpokenLanguage = (uint64_t)v3;
    if (!v3) {
      goto LABEL_11;
    }
    CFStringRef v4 = v3;
    uint64_t v5 = (__CFSet *)__VSPreferencesValidSpokenLanguageIds;
    if (!__VSPreferencesValidSpokenLanguageIds)
    {
      uint64_t v5 = _VSCopyAvailableLanguageIdentifiers();
      __VSPreferencesValidSpokenLanguageIds = (uint64_t)v5;
      if (!v5) {
        goto LABEL_10;
      }
      CFStringRef v4 = (CFStringRef)__VSPreferencesDefaultSpokenLanguage;
    }
    if (CFSetContainsValue(v5, v4))
    {
      if (__VSPreferencesDefaultSpokenLanguage)
      {
LABEL_13:
        CFRelease(v2);
LABEL_14:
        uint64_t result = (const void *)__VSPreferencesDefaultSpokenLanguage;
        if (!__VSPreferencesDefaultSpokenLanguage) {
          return result;
        }
        goto LABEL_15;
      }
LABEL_11:
      pthread_once(&_VSFrameworkBundle_bundleInitOnce, (void (*)(void))_VSSetFrameworkBundle);
      CFURLRef v6 = CFBundleCopyResourceURL((CFBundleRef)__VSBundle, @"language_fallbacks.plist", 0, @"RecognitionResources/Express");
      if (v6)
      {
        CFURLRef v7 = v6;
        __VSPreferencesDefaultSpokenLanguage = (uint64_t)_VSCopyFallbackLanguageIdentifierForLocale(v2, v6);
        CFRelease(v7);
      }
      goto LABEL_13;
    }
LABEL_10:
    CFRelease((CFTypeRef)__VSPreferencesDefaultSpokenLanguage);
    __VSPreferencesDefaultSpokenLanguage = 0;
    goto LABEL_11;
  }
LABEL_15:
  CFRetain(result);
  return (const void *)__VSPreferencesDefaultSpokenLanguage;
}

CFStringRef _VSPreferencesCopySystemLanguageIdentifier()
{
  CFArrayRef v0 = CFLocaleCopyPreferredLanguages();
  if (CFArrayGetCount(v0))
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v0, 0);
    CFStringRef Copy = CFStringCreateCopy(0, ValueAtIndex);
  }
  else
  {
    CFStringRef Copy = 0;
  }
  CFRelease(v0);
  return Copy;
}

void _VSPreferencesSpokenLanguageChangedHandler()
{
  pthread_mutex_lock(&__VSPreferencesSpokenLanguageLock);
  if (__VSPreferencesSpokenLanguageChangedCount < 1)
  {
    CFPreferencesAppSynchronize(@"com.apple.voiceservices");
    if (__VSPreferencesDefaultSpokenLanguage)
    {
      CFRelease((CFTypeRef)__VSPreferencesDefaultSpokenLanguage);
      __VSPreferencesDefaultSpokenLanguage = 0;
    }
    if (__VSPreferencesDefaultOutputLanguage)
    {
      CFRelease((CFTypeRef)__VSPreferencesDefaultOutputLanguage);
      __VSPreferencesDefaultOutputLanguage = 0;
    }
    CFStringRef v0 = (const __CFString *)__VSPreferencesSpokenLanguage;
    if (__VSPreferencesSpokenLanguage)
    {
      __VSPreferencesSpokenLanguage = 0;
      CFStringRef SpokenLanguageIdentifier = (const __CFString *)_VSPreferencesGetSpokenLanguageIdentifier();
      CFComparisonResult v2 = CFStringCompare(v0, SpokenLanguageIdentifier, 0);
      CFRelease(v0);
      pthread_mutex_unlock(&__VSPreferencesSpokenLanguageLock);
      if (v2 == kCFCompareEqualTo) {
        return;
      }
    }
    else
    {
      pthread_mutex_unlock(&__VSPreferencesSpokenLanguageLock);
    }
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, @"com.apple.voiceservices.language", 0, 0, 1u);
  }
  else
  {
    --__VSPreferencesSpokenLanguageChangedCount;
    pthread_mutex_unlock(&__VSPreferencesSpokenLanguageLock);
  }
}

uint64_t VSPreferencesGetLogging()
{
  AppIntegerCFArrayRef Value = CFPreferencesGetAppIntegerValue(@"VSLogLevel", @"com.apple.voiceservices.logging", 0);
  uint64_t v1 = MEMORY[0x263EFFB40];
  if (AppIntegerValue <= 0) {
    uint64_t v1 = MEMORY[0x263EFFB38];
  }
  return *(void *)v1;
}

CFIndex VSPreferencesGetLoggingLevel()
{
  return CFPreferencesGetAppIntegerValue(@"VSLogLevel", @"com.apple.voiceservices.logging", 0);
}

void VSPreferencesSetLogging(uint64_t a1)
{
  id v2 = [NSString alloc];
  CFStringRef v3 = @"/";
  id v8 = (id)[v2 initWithFormat:@"%@Library/Managed Preferences/mobile/%@.plist", @"/", @"com.apple.voiceservices.logging"];

  CFStringRef v4 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithContentsOfFile:v8];
  uint64_t v5 = [v4 objectForKey:@"VSLogLevel"];

  if (v5)
  {
    [v4 removeObjectForKey:@"VSLogLevel"];
    _CFPreferencesWriteManagedDomainForUser();
  }
  if (*MEMORY[0x263EFFB40] != a1 || a1 == 0) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = 6;
  }
  VSPreferencesSetLoggingLevel(v7);
}

uint64_t VSPreferencesSetLoggingLevel(uint64_t a1)
{
  id v2 = (const void *)[NSNumber numberWithLong:a1];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPreferencesSetValue(@"VSLogLevel", v2, @"com.apple.voiceservices.logging", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
  CFPreferencesSetValue(@"VSOutputLevel", (CFPropertyListRef)[NSNumber numberWithLong:a1], @"com.apple.voiceservices.logging", @"mobile", v3);
  CFPreferencesSynchronize(@"com.apple.voiceservices.logging", @"mobile", v3);
  return notify_post("com.apple.AppSupport.loggingDefaultsChanged");
}

CFStringRef VSPreferencesCopySpokenLanguageIdentifierArray()
{
  CFStringRef result = (const __CFString *)VSPreferencesCopySpokenLanguageIdentifier();
  if (result)
  {
    CFStringRef v1 = result;
    CFArrayRef v2 = _VSCopyLanguageArrayForLanguageIdentifier(result);
    CFRelease(v1);
    return (const __CFString *)v2;
  }
  return result;
}

const void *VSPreferencesCopyDefaultSpokenLanguageIdentifierForUserPreferences()
{
  pthread_mutex_lock(&__VSPreferencesSpokenLanguageLock);
  CFStringRef v0 = _VSPreferencesCopyDefaultSpokenLanguageIdentifierForUserPreferences();
  pthread_mutex_unlock(&__VSPreferencesSpokenLanguageLock);
  return v0;
}

CFStringRef VSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences()
{
  VSPreferencesInitialize();
  pthread_mutex_lock(&__VSPreferencesSpokenLanguageLock);
  CFStringRef v0 = (const __CFString *)__VSPreferencesDefaultOutputLanguage;
  if (__VSPreferencesDefaultOutputLanguage) {
    goto LABEL_16;
  }
  CFLocaleRef v1 = CFLocaleCopyCurrent();
  if (v1)
  {
    CFLocaleRef v2 = v1;
    CFStringRef v3 = _VSCopyLanguageIdentifierForLocale(v1);
    __VSPreferencesDefaultOutputLanguage = (uint64_t)v3;
    if (!v3) {
      goto LABEL_11;
    }
    CFStringRef v4 = v3;
    uint64_t v5 = (__CFSet *)__VSPreferencesValidOutputLanguageIds;
    if (!__VSPreferencesValidOutputLanguageIds)
    {
      uint64_t v5 = _VSCopyAvailableOutputLanguageIdentifiers();
      __VSPreferencesValidOutputLanguageIds = (uint64_t)v5;
      if (!v5) {
        goto LABEL_10;
      }
      CFStringRef v4 = (CFStringRef)__VSPreferencesDefaultOutputLanguage;
    }
    if (CFSetContainsValue(v5, v4))
    {
      if (__VSPreferencesDefaultOutputLanguage)
      {
LABEL_13:
        CFRelease(v2);
        goto LABEL_14;
      }
LABEL_11:
      pthread_once(&_VSFrameworkBundle_bundleInitOnce, (void (*)(void))_VSSetFrameworkBundle);
      CFURLRef v6 = CFBundleCopyResourceURL((CFBundleRef)__VSBundle, @"language_fallbacks.plist", 0, @"TTSResources");
      if (v6)
      {
        CFURLRef v7 = v6;
        __VSPreferencesDefaultOutputLanguage = (uint64_t)_VSCopyFallbackLanguageIdentifierForLocale(v2, v6);
        CFRelease(v7);
      }
      goto LABEL_13;
    }
LABEL_10:
    CFRelease((CFTypeRef)__VSPreferencesDefaultOutputLanguage);
    __VSPreferencesDefaultOutputLanguage = 0;
    goto LABEL_11;
  }
LABEL_14:
  CFStringRef v0 = (const __CFString *)__VSPreferencesDefaultOutputLanguage;
  if (!__VSPreferencesDefaultOutputLanguage)
  {
    CFStringRef v0 = _VSPreferencesCopySystemLanguageIdentifier();
    __VSPreferencesDefaultOutputLanguage = (uint64_t)v0;
    if (!v0)
    {
      CFStringRef Copy = 0;
      goto LABEL_17;
    }
  }
LABEL_16:
  CFStringRef Copy = CFStringCreateCopy(0, v0);
LABEL_17:
  pthread_mutex_unlock(&__VSPreferencesSpokenLanguageLock);
  return Copy;
}

__CFSet *VSPreferencesCopyAvailableLanguageIdentifiers()
{
  pthread_mutex_lock(&__VSPreferencesSpokenLanguageLock);
  CFStringRef v0 = (__CFSet *)__VSPreferencesValidSpokenLanguageIds;
  if (__VSPreferencesValidSpokenLanguageIds
    || (CFStringRef v0 = _VSCopyAvailableLanguageIdentifiers(), (__VSPreferencesValidSpokenLanguageIds = (uint64_t)v0) != 0))
  {
    CFRetain(v0);
  }
  pthread_mutex_unlock(&__VSPreferencesSpokenLanguageLock);
  return v0;
}

__CFSet *VSPreferencesCopyAvailableOutputLanguageIdentifiers()
{
  pthread_mutex_lock(&__VSPreferencesSpokenLanguageLock);
  CFStringRef v0 = (__CFSet *)__VSPreferencesValidOutputLanguageIds;
  if (__VSPreferencesValidOutputLanguageIds
    || (CFStringRef v0 = _VSCopyAvailableOutputLanguageIdentifiers(), (__VSPreferencesValidOutputLanguageIds = (uint64_t)v0) != 0))
  {
    CFRetain(v0);
  }
  pthread_mutex_unlock(&__VSPreferencesSpokenLanguageLock);
  return v0;
}

CFStringRef _VSCopyLanguageCodeFromLanguageIdentifier(const __CFString *a1)
{
  CFIndex location = CFStringFind(a1, @"-", 0).location;
  if (location == -1)
  {
    return (CFStringRef)CFRetain(a1);
  }
  else
  {
    v4.length = location;
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    v4.CFIndex location = 0;
    return CFStringCreateWithSubstring(v3, a1, v4);
  }
}

BOOL _VSLanguageIdentifierIsLanguageOnly(const __CFString *a1)
{
  return CFStringFind(a1, @"-", 0).location == -1;
}

CFStringRef _VSCopyLocalizedString(const __CFString *a1, const __CFString *a2)
{
  pthread_once(&_VSFrameworkBundle_bundleInitOnce, (void (*)(void))_VSSetFrameworkBundle);
  CFRange v4 = (__CFBundle *)__VSBundle;
  if (__VSBundle)
  {
    return CFBundleCopyLocalizedString(v4, a1, a1, a2);
  }
  else
  {
    return (CFStringRef)CFRetain(a1);
  }
}

CFBundleRef _VSSetFrameworkBundle()
{
  CFBundleRef result = CFBundleGetBundleWithIdentifier(@"com.apple.voiceservices");
  __VSBundle = (uint64_t)result;
  if (result)
  {
    return (CFBundleRef)CFRetain(result);
  }
  return result;
}

const void *_VSCopyFallbackLanguageIdentifierForLocale(const __CFLocale *a1, const __CFURL *a2)
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFRange v4 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x263EFFB08], a2);
  if (v4)
  {
    uint64_t v5 = v4;
    if (CFReadStreamOpen(v4))
    {
      CFDictionaryRef v6 = (const __CFDictionary *)CFPropertyListCreateWithStream(v3, v5, 0, 0, 0, 0);
      if (v6)
      {
        CFDictionaryRef v7 = v6;
        CFTypeID v8 = CFGetTypeID(v6);
        if (v8 == CFDictionaryGetTypeID())
        {
          CFStringRef v9 = _VSCopyLanguageIdentifierForLocale(a1);
          if (v9)
          {
            CFStringRef v10 = v9;
            CFArrayRef Value = CFDictionaryGetValue(v7, v9);
            CFRelease(v10);
            if (Value) {
              goto LABEL_9;
            }
          }
          key = 0;
          _VSCopyLanguageCodes(&key, 0);
          uint64_t v12 = key;
          if (key)
          {
            CFArrayRef Value = CFDictionaryGetValue(v7, key);
            CFRelease(v12);
            if (!Value)
            {
LABEL_14:
              CFReadStreamClose(v5);
              CFRelease(v7);
              goto LABEL_15;
            }
LABEL_9:
            CFRetain(Value);
            goto LABEL_14;
          }
        }
        CFArrayRef Value = 0;
        goto LABEL_14;
      }
      CFReadStreamClose(v5);
    }
    CFArrayRef Value = 0;
LABEL_15:
    CFRelease(v5);
    return Value;
  }
  return 0;
}

CFStringRef _VSCopyLanguageIdentifierForLocale(const __CFLocale *a1)
{
  CFTypeRef cf = 0;
  CFStringRef theString1 = 0;
  _VSCopyLanguageCodes(&cf, &theString1);
  if (theString1)
  {
    CFComparisonResult v2 = CFStringCompare(theString1, @"en-GB", 1uLL);
    if (!a1 || v2) {
      goto LABEL_14;
    }
  }
  else if (!a1)
  {
    goto LABEL_14;
  }
  if (!cf) {
    return theString1;
  }
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(a1, (CFLocaleKey)*MEMORY[0x263EFFCB0]);
  if (Value)
  {
    CFStringRef v4 = Value;
    if (theString1)
    {
      if (CFStringCompare(Value, @"AU", 1uLL) && CFStringCompare(v4, @"NZ", 1uLL)) {
        goto LABEL_14;
      }
      if (theString1) {
        CFRelease(theString1);
      }
    }
    CFStringRef theString1 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@-%@", cf, v4);
  }
LABEL_14:
  if (cf) {
    CFRelease(cf);
  }
  return theString1;
}

uint64_t _VSCopyLanguageCodes(void *a1, void *a2)
{
  pthread_mutex_lock(&__VSLanguageLock);
  if (!__VSLanguage)
  {
    pthread_once(&_VSCopyLanguageCodes___SetLanguageOnce, _VSRegisterLanguageChanges);
    CFArrayRef v4 = CFLocaleCopyPreferredLanguages();
    if (v4)
    {
      CFArrayRef v5 = v4;
      if (CFArrayGetCount(v4) >= 1)
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v5, 0);
        CFRange v7 = CFStringFind(ValueAtIndex, @"-", 0);
        if (v7.location != -1 && v7.location + v7.length == CFStringGetLength(ValueAtIndex) - 2)
        {
          __VSLanguageCode = (uint64_t)ValueAtIndex;
          CFRetain(ValueAtIndex);
        }
        if (CFStringFind(ValueAtIndex, @"zh-Hans", 8uLL).location != -1)
        {
          __VSLanguageCode = @"zh-CN";
          CFRetain(@"zh-CN");
        }
        __VSLanguage = (uint64_t)_VSCopyLanguageCodeFromLanguageIdentifier(ValueAtIndex);
      }
      CFRelease(v5);
    }
  }
  if (a1)
  {
    CFTypeID v8 = (const void *)__VSLanguage;
    *a1 = __VSLanguage;
    if (v8) {
      CFRetain(v8);
    }
  }
  if (a2)
  {
    CFStringRef v9 = (const void *)__VSLanguageCode;
    *a2 = __VSLanguageCode;
    if (v9) {
      CFRetain(v9);
    }
  }
  return pthread_mutex_unlock(&__VSLanguageLock);
}

void _VSRegisterLanguageChanges()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_VSDeviceLanguageChangedHandler, @"com.apple.language.changed", 0, CFNotificationSuspensionBehaviorDrop);
}

uint64_t _VSDeviceLanguageChangedHandler()
{
  pthread_mutex_lock(&__VSLanguageLock);
  if (__VSLanguage)
  {
    CFRelease((CFTypeRef)__VSLanguage);
    __VSLanguage = 0;
  }
  if (__VSLanguageCode)
  {
    CFRelease((CFTypeRef)__VSLanguageCode);
    __VSLanguageCode = 0;
  }
  uint64_t v0 = pthread_mutex_unlock(&__VSLanguageLock);
  return _VSPreferencesSpokenLanguageChangedHandler(v0);
}

CFStringRef _VSCopyQualifiedLanguageIdentifierForLanguageCode(const void *a1, CFStringRef theString)
{
  if (theString)
  {
    CFRange v4 = CFStringFind(theString, @"-", 0);
    if (v4.location != -1)
    {
      CFIndex Length = CFStringGetLength(theString);
      if (Length > v4.location + v4.length)
      {
        CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        v14.CFIndex location = v4.location + v4.length;
        v14.length = Length - (v4.location + v4.length);
        CFStringRef v7 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x263EFFB08], theString, v14);
        if (v7)
        {
          CFStringRef v8 = v7;
          goto LABEL_9;
        }
      }
    }
  }
  CFLocaleRef v9 = CFLocaleCopyCurrent();
  if (!v9)
  {
LABEL_12:
    CFRetain(a1);
    return (CFStringRef)a1;
  }
  CFLocaleRef v10 = v9;
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(v9, (CFLocaleKey)*MEMORY[0x263EFFCB0]);
  if (!Value)
  {
    CFRelease(v10);
    goto LABEL_12;
  }
  CFStringRef v8 = Value;
  CFRetain(Value);
  CFRelease(v10);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
LABEL_9:
  CFStringRef v12 = CFStringCreateWithFormat(v6, 0, @"%@-%@", a1, v8);
  CFRelease(v8);
  if (!v12) {
    goto LABEL_12;
  }
  return v12;
}

const void *_VSCopyFallbackLanguageIdentifierForLanguageIdentifier(const __CFString *a1, const __CFURL *a2)
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFRange v4 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x263EFFB08], a2);
  if (v4)
  {
    CFArrayRef v5 = v4;
    if (CFReadStreamOpen(v4))
    {
      CFDictionaryRef v6 = (const __CFDictionary *)CFPropertyListCreateWithStream(v3, v5, 0, 0, 0, 0);
      if (v6)
      {
        CFDictionaryRef v7 = v6;
        CFTypeID v8 = CFGetTypeID(v6);
        if (v8 == CFDictionaryGetTypeID())
        {
          CFStringRef Value = CFDictionaryGetValue(v7, a1);
          if (Value)
          {
LABEL_6:
            CFRetain(Value);
LABEL_14:
            CFReadStreamClose(v5);
            CFRelease(v7);
            goto LABEL_15;
          }
          CFStringRef v10 = _VSCopyLanguageCodeFromLanguageIdentifier(a1);
          if (v10)
          {
            CFStringRef v11 = v10;
            CFStringRef Value = CFDictionaryGetValue(v7, v10);
            CFRelease(v11);
            if (!Value) {
              goto LABEL_14;
            }
            goto LABEL_6;
          }
        }
        CFStringRef Value = 0;
        goto LABEL_14;
      }
      CFReadStreamClose(v5);
    }
    CFStringRef Value = 0;
LABEL_15:
    CFRelease(v5);
    return Value;
  }
  return 0;
}

CFArrayRef _VSCopyLanguageArrayForLanguageIdentifier(const __CFString *a1)
{
  CFStringRef v1 = a1;
  uint64_t v8 = *MEMORY[0x263EF8340];
  CFDictionaryRef v6 = 0;
  uint64_t v7 = 0;
  if (a1)
  {
    CFStringRef v2 = _VSCopyLanguageCodeFromLanguageIdentifier(a1);
    CFStringRef v5 = v1;
    if (CFStringCompare(v1, @"zh-HK", 0))
    {
      CFIndex v3 = 1;
      if (v2)
      {
LABEL_4:
        *(&v5 + v3) = v2;
        CFStringRef v1 = (const __CFString *)CFArrayCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)&v5, v3 + 1, MEMORY[0x263EFFF70]);
        CFRelease(v2);
        return (CFArrayRef)v1;
      }
    }
    else
    {
      CFDictionaryRef v6 = @"zh-TW";
      CFIndex v3 = 2;
      if (v2) {
        goto LABEL_4;
      }
    }
    return CFArrayCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)&v5, v3, MEMORY[0x263EFFF70]);
  }
  return (CFArrayRef)v1;
}

__CFSet *_VSCopyAvailableLanguageIdentifiers()
{
  pthread_once(&_VSFrameworkBundle_bundleInitOnce, (void (*)(void))_VSSetFrameworkBundle);
  CFArrayRef v0 = CFBundleCopyResourceURLsOfType((CFBundleRef)__VSBundle, @"bin", @"RecognitionResources/Express");
  if (!v0) {
    return 0;
  }
  CFArrayRef v1 = v0;
  CFIndex Count = CFArrayGetCount(v0);
  if (Count >= 1)
  {
    CFIndex v3 = Count;
    CFMutableArrayRef Mutable = 0;
    CFIndex v5 = 0;
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v7 = (const CFSetCallBacks *)MEMORY[0x263EFFFA0];
    while (1)
    {
      CFURLRef ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v1, v5);
      CFStringRef PathComponent = CFURLCopyLastPathComponent(ValueAtIndex);
      if (PathComponent) {
        break;
      }
LABEL_10:
      if (v3 == ++v5) {
        goto LABEL_16;
      }
    }
    CFStringRef v10 = PathComponent;
    CFIndex location = CFStringFind(PathComponent, @".", 0).location;
    if ((unint64_t)(location - 1) >= 0xFFFFFFFFFFFFFFFELL)
    {
      CFRetain(v10);
      CFStringRef v12 = v10;
      if (Mutable) {
        goto LABEL_8;
      }
    }
    else
    {
      v14.length = location;
      v14.CFIndex location = 0;
      CFStringRef v12 = CFStringCreateWithSubstring(v6, v10, v14);
      if (!v12)
      {
LABEL_9:
        CFRelease(v10);
        goto LABEL_10;
      }
      if (Mutable)
      {
LABEL_8:
        CFSetAddValue(Mutable, v12);
        CFRelease(v12);
        goto LABEL_9;
      }
    }
    CFMutableArrayRef Mutable = CFSetCreateMutable(v6, 0, v7);
    goto LABEL_8;
  }
  CFMutableArrayRef Mutable = 0;
LABEL_16:
  CFRelease(v1);
  return Mutable;
}

__CFSet *_VSCopyAvailableOutputLanguageIdentifiers()
{
  pthread_once(&_VSFrameworkBundle_bundleInitOnce, (void (*)(void))_VSSetFrameworkBundle);
  CFArrayRef v0 = CFBundleCopyResourceURLsOfType((CFBundleRef)__VSBundle, 0, @"TTSResources");
  if (!v0) {
    return 0;
  }
  CFArrayRef v1 = v0;
  CFIndex Count = CFArrayGetCount(v0);
  if (Count < 1)
  {
    CFMutableArrayRef Mutable = 0;
  }
  else
  {
    CFIndex v3 = Count;
    CFMutableArrayRef Mutable = 0;
    CFIndex v5 = 0;
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v7 = (const CFSetCallBacks *)MEMORY[0x263EFFFA0];
    do
    {
      CFURLRef ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v1, v5);
      CFStringRef PathComponent = CFURLCopyLastPathComponent(ValueAtIndex);
      if (PathComponent)
      {
        CFStringRef v10 = PathComponent;
        if (CFStringFind(PathComponent, @"-", 0).location != -1)
        {
          if (!Mutable) {
            CFMutableArrayRef Mutable = CFSetCreateMutable(v6, 0, v7);
          }
          CFSetAddValue(Mutable, v10);
        }
        CFRelease(v10);
      }
      ++v5;
    }
    while (v3 != v5);
  }
  CFRelease(v1);
  return Mutable;
}

CFURLRef _VSCopyDefaultLanguageIdentifierFallbackMapURL()
{
  pthread_once(&_VSFrameworkBundle_bundleInitOnce, (void (*)(void))_VSSetFrameworkBundle);
  CFArrayRef v0 = (__CFBundle *)__VSBundle;
  return CFBundleCopyResourceURL(v0, @"language_fallbacks.plist", 0, @"RecognitionResources/Express");
}

CFURLRef _VSCopyDefaultOutputLanguageIdentifierFallbackMapURL()
{
  pthread_once(&_VSFrameworkBundle_bundleInitOnce, (void (*)(void))_VSSetFrameworkBundle);
  CFArrayRef v0 = (__CFBundle *)__VSBundle;
  return CFBundleCopyResourceURL(v0, @"language_fallbacks.plist", 0, @"TTSResources");
}

CFURLRef _VSBundleCopyResourceURL(CFBundleRef bundle, void *a2, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  values = a2;
  if (!a2) {
    return CFBundleCopyResourceURL(bundle, resourceName, resourceType, subDirName);
  }
  CFArrayRef v9 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)&values, 1, 0);
  CFArrayRef v10 = CFBundleCopyBundleLocalizations(bundle);
  if (!v10 || (CFArrayRef v11 = v10, v12 = CFBundleCopyLocalizationsForPreferences(v10, v9), CFRelease(v11), !v12))
  {
    CFRelease(v9);
    return CFBundleCopyResourceURL(bundle, resourceName, resourceType, subDirName);
  }
  if (CFArrayGetCount(v12) < 1)
  {
    CFURLRef v14 = 0;
  }
  else
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v12, 0);
    CFURLRef v14 = CFBundleCopyResourceURLForLocalization(bundle, resourceName, resourceType, subDirName, ValueAtIndex);
  }
  CFRelease(v12);
  CFRelease(v9);
  if (!v14) {
    return CFBundleCopyResourceURL(bundle, resourceName, resourceType, subDirName);
  }
  return v14;
}

__CFArray *VSAttributedStringCreateSerializedAttributes(const __CFAllocator *a1, CFAttributedStringRef aStr)
{
  if (!aStr) {
    return 0;
  }
  CFIndex Length = CFAttributedStringGetLength(aStr);
  if (Length < 1) {
    return 0;
  }
  CFIndex v5 = Length;
  CFMutableArrayRef Mutable = 0;
  CFIndex v7 = 0;
  v17.CFIndex location = 0;
  v17.length = 0;
  uint64_t v8 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
  do
  {
    v18.length = v5 - v7;
    v18.CFIndex location = v7;
    CFDictionaryRef AttributesAndLongestEffectiveRange = CFAttributedStringGetAttributesAndLongestEffectiveRange(aStr, v7, v18, &v17);
    if (AttributesAndLongestEffectiveRange)
    {
      CFDictionaryRef v10 = AttributesAndLongestEffectiveRange;
      CFDataRef v11 = CFDataCreate(a1, (const UInt8 *)&v17, 16);
      if (v11)
      {
        CFDataRef v12 = v11;
        MutableCFStringRef Copy = CFDictionaryCreateMutableCopy(a1, 0, v10);
        if (MutableCopy)
        {
          CFURLRef v14 = MutableCopy;
          CFDictionarySetValue(MutableCopy, @"range", v12);
          if (!Mutable) {
            CFMutableArrayRef Mutable = CFArrayCreateMutable(a1, 0, v8);
          }
          CFArrayAppendValue(Mutable, v14);
          CFRelease(v14);
        }
        CFRelease(v12);
      }
      CFIndex v15 = v17.length;
    }
    else
    {
      CFIndex v15 = 1;
    }
    v7 += v15;
  }
  while (v7 < v5);
  return Mutable;
}

__CFAttributedString *VSAttributedStringCreateFromSerializedAttributes(const __CFAllocator *a1, CFStringRef theString, const __CFArray *a3)
{
  if (!theString) {
    return 0;
  }
  uint64_t Length = CFStringGetLength(theString);
  v20.CFIndex location = 0;
  v20.length = 0;
  if (Length < 1) {
    return 0;
  }
  CFIndex v7 = Length;
  CFMutableArrayRef Mutable = CFAttributedStringCreateMutable(a1, Length);
  v21.CFIndex location = 0;
  v21.length = 0;
  CFAttributedStringReplaceString(Mutable, v21, theString);
  if (a3)
  {
    CFIndex Count = CFArrayGetCount(a3);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (Count >= 1)
    {
      uint64_t v11 = TypeID;
      for (CFIndex i = 0; i != Count; ++i)
      {
        CFDictionaryRef ValueAtIndexIfType = (const __CFDictionary *)VSCFArrayGetValueAtIndexIfType(a3, i, v11);
        if (ValueAtIndexIfType)
        {
          CFDictionaryRef v14 = ValueAtIndexIfType;
          CFDataRef Value = (const __CFData *)CFDictionaryGetValue(ValueAtIndexIfType, @"range");
          if (Value)
          {
            CFDataRef v16 = Value;
            if (CFDataGetLength(Value) == 16)
            {
              v22.CFIndex location = 0;
              v22.length = 16;
              CFDataGetBytes(v16, v22, (UInt8 *)&v20);
              if ((v20.location & 0x8000000000000000) == 0 && v20.length + v20.location <= v7)
              {
                MutableCFStringRef Copy = CFDictionaryCreateMutableCopy(a1, 0, v14);
                if (MutableCopy)
                {
                  CFDictionaryRef v18 = MutableCopy;
                  CFDictionaryRemoveValue(MutableCopy, @"range");
                  CFAttributedStringSetAttributes(Mutable, v20, v18, 1u);
                  CFRelease(v18);
                }
              }
            }
          }
        }
      }
    }
  }
  return Mutable;
}

CFTypeRef VSCFAttributedStringGetAttributeAndLongestEffectiveRange(const __CFAttributedString *a1, CFIndex a2, const __CFString *a3, CFIndex a4, CFIndex a5, CFRange *effectiveRange)
{
  CFTypeRef result = CFAttributedStringGetAttribute(a1, a2, a3, effectiveRange);
  if (effectiveRange)
  {
    if (result)
    {
      v13.CFIndex location = a4;
      v13.CFIndex length = a5;
      return CFAttributedStringGetAttributeAndLongestEffectiveRange(a1, a2, a3, v13, effectiveRange);
    }
    else
    {
      CFRange v23 = *effectiveRange;
      CFIndex v14 = a4 + a5;
      for (CFIndex i = v23.length + v23.location; i > v14; CFIndex i = v16.length + v16.location)
      {
        CFTypeRef result = CFAttributedStringGetAttribute(a1, i, a3, &v23);
        if (result) {
          goto LABEL_11;
        }
        CFRange v16 = v23;
        effectiveRange->length += v23.length;
      }
      CFTypeRef result = 0;
LABEL_11:
      CFRange v23 = *effectiveRange;
      if (!result)
      {
        CFIndex v17 = v23.location - 1;
        if (v23.location - 1 > a4)
        {
          while (1)
          {
            CFTypeRef result = CFAttributedStringGetAttribute(a1, v17, a3, &v23);
            if (result) {
              break;
            }
            CFIndex location = v23.location;
            CFIndex v19 = effectiveRange->length + v23.length;
            effectiveRange->CFIndex location = v23.location;
            effectiveRange->CFIndex length = v19;
            CFIndex v17 = location - 1;
            if (location - 1 <= a4)
            {
              CFTypeRef result = 0;
              break;
            }
          }
        }
      }
      CFIndex v21 = effectiveRange->location;
      CFIndex length = effectiveRange->length;
      if (effectiveRange->location < a4)
      {
        length += effectiveRange->location - a4;
        effectiveRange->CFIndex location = a4;
        effectiveRange->CFIndex length = length;
        CFIndex v21 = a4;
      }
      CFIndex v22 = length + v21;
      if (v22 > v14) {
        effectiveRange->CFIndex length = length + v14 - v22;
      }
    }
  }
  return result;
}

__CFString *VSCFAttributedStringCreateStringByBracketingAttributeWithString(const __CFAllocator *a1, CFAttributedStringRef aStr, const __CFString *a3, const __CFString *a4)
{
  CFIndex Length = CFAttributedStringGetLength(aStr);
  CFStringRef String = CFAttributedStringGetString(aStr);
  if (Length >= 1)
  {
    CFStringRef v10 = String;
    CFMutableArrayRef Mutable = 0;
    CFIndex v12 = 0;
    while (1)
    {
      CFRange effectiveRange = (CFRange)xmmword_20CB034B0;
      if (VSCFAttributedStringGetAttributeAndLongestEffectiveRange(aStr, v12, a3, v12, Length - v12, &effectiveRange)) {
        BOOL v13 = effectiveRange.length < 1;
      }
      else {
        BOOL v13 = 1;
      }
      char v14 = v13;
      if (Mutable)
      {
        if ((v14 & 1) == 0) {
          goto LABEL_13;
        }
      }
      else
      {
        CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0);
        if ((v14 & 1) == 0)
        {
LABEL_13:
          CFStringAppend(Mutable, a4);
          CFStringRef v16 = CFStringCreateWithSubstring(a1, v10, effectiveRange);
          CFStringAppend(Mutable, v16);
          CFRelease(v16);
          CFStringAppend(Mutable, a4);
          goto LABEL_14;
        }
      }
      CFStringRef v15 = CFStringCreateWithSubstring(a1, v10, effectiveRange);
      CFStringAppend(Mutable, v15);
      CFRelease(v15);
LABEL_14:
      v12 += effectiveRange.length;
      if (v12 >= Length) {
        return Mutable;
      }
    }
  }
  return 0;
}

void sub_20CAD80A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getTTSSpeechTransformTextWithLanguageSymbolLoc_block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!TextToSpeechLibraryCore_frameworkLibrary)
  {
    v5[1] = (void *)MEMORY[0x263EF8330];
    v5[2] = (void *)3221225472;
    v5[3] = __TextToSpeechLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2640E83C8;
    uint64_t v7 = 0;
    TextToSpeechLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  CFStringRef v2 = (void *)TextToSpeechLibraryCore_frameworkLibrary;
  if (!TextToSpeechLibraryCore_frameworkLibrary)
  {
    a1 = [MEMORY[0x263F08690] currentHandler];
    CFStringRef v2 = [NSString stringWithUTF8String:"void *TextToSpeechLibrary(void)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, @"NSString+VSSpeechService.m", 17, @"%s", v5[0]);

    __break(1u);
    goto LABEL_7;
  }
  CFIndex v3 = v5[0];
  if (v5[0]) {
LABEL_7:
  }
    free(v3);
  CFTypeRef result = dlsym(v2, "TTSSpeechTransformTextWithLanguage");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  getTTSSpeechTransformTextWithLanguageSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(a1[4] + 8) + 24);
  return result;
}

uint64_t __TextToSpeechLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TextToSpeechLibraryCore_frameworkLibrary = result;
  return result;
}

CFURLRef VSVocalizerCopyPathForResources()
{
  CFURLRef result = _VSVocalizerCopyURLForFrameworkResources();
  if (result)
  {
    CFURLRef v1 = result;
    CFStringRef v2 = CFURLCopyFileSystemPath(result, kCFURLPOSIXPathStyle);
    CFRelease(v1);
    return (const __CFURL *)v2;
  }
  return result;
}

CFURLRef _VSVocalizerCopyURLForFrameworkResources()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFURLRef result = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x263EFFB08], @"/System/Library/PrivateFrameworks/VoiceServices.framework/", kCFURLPOSIXPathStyle, 1u);
  if (result)
  {
    CFURLRef v2 = result;
    CFURLRef v3 = CFURLCreateCopyAppendingPathComponent(v0, result, @"TTSResources", 1u);
    CFRelease(v2);
    return v3;
  }
  return result;
}

CFStringRef VSVocalizerCopyPathForCommonResources()
{
  CFURLRef v0 = _VSVocalizerCopyURLForFrameworkResources();
  CFURLRef v1 = _VSVocalizerCopyURLForResourcesInDirectory(@"common", v0);
  if (!v1)
  {
    CFStringRef v3 = 0;
    if (!v0) {
      return v3;
    }
    goto LABEL_3;
  }
  CFURLRef v2 = v1;
  CFStringRef v3 = CFURLCopyFileSystemPath(v1, kCFURLPOSIXPathStyle);
  CFRelease(v2);
  if (v0) {
LABEL_3:
  }
    CFRelease(v0);
  return v3;
}

CFURLRef _VSVocalizerCopyURLForResourcesInDirectory(CFStringRef pathComponent, const __CFURL *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (!a2) {
    return 0;
  }
  CFURLRef v2 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, pathComponent, 1u);
  CFURLRef v3 = v2;
  if (v2)
  {
    memset(&v5, 0, sizeof(v5));
    if (!CFURLGetFileSystemRepresentation(v2, 1u, buffer, 1024) || stat((const char *)buffer, &v5))
    {
      CFRelease(v3);
      return 0;
    }
  }
  return v3;
}

CFStringRef VSVocalizerCopyPathForBuiltInVoice(const __CFString *a1, void *a2)
{
  CFURLRef v4 = _VSVocalizerCopyURLForFrameworkResources();
  CFURLRef v5 = _VSVocalizerCopyURLForLocalizedResourcesFoundAtURL(a1, a2, v4);
  if (!v5)
  {
    CFStringRef v6 = (const __CFString *)_VSVocalizerCopyFallbackLanguageIdentifier(a1, a1);
    CFURLRef v5 = _VSVocalizerCopyURLForLocalizedResourcesFoundAtURL(v6, a2, v4);
    if (v6) {
      CFRelease(v6);
    }
    if (!v5)
    {
      CFStringRef v7 = 0;
      if (!v4) {
        return v7;
      }
      goto LABEL_6;
    }
  }
  CFStringRef v7 = CFURLCopyFileSystemPath(v5, kCFURLPOSIXPathStyle);
  CFRelease(v5);
  if (v4) {
LABEL_6:
  }
    CFRelease(v4);
  return v7;
}

CFURLRef _VSVocalizerCopyURLForLocalizedResourcesFoundAtURL(CFStringRef pathComponent, void *a2, const __CFURL *a3)
{
  if (a2) {
    *a2 = 0;
  }
  CFURLRef v5 = 0;
  if (pathComponent)
  {
    if (a3)
    {
      CFURLRef v6 = _VSVocalizerCopyURLForResourcesInDirectory(pathComponent, a3);
      CFURLRef v5 = v6;
      if (a2)
      {
        if (v6)
        {
          *a2 = pathComponent;
          CFRetain(pathComponent);
        }
      }
    }
  }
  return v5;
}

const void *_VSVocalizerCopyFallbackLanguageIdentifier(const __CFString *a1, const __CFString *a2)
{
  CFURLRef v4 = _VSVocalizerCopyURLForFrameworkResources();
  CFURLRef v5 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x263EFFB08], v4, @"language_fallbacks.plist", 0);
  if (!v5)
  {
    uint64_t v8 = 0;
    if (!v4) {
      return v8;
    }
    goto LABEL_10;
  }
  CFURLRef v6 = v5;
  CFStringRef v7 = 0;
  if (CFStringFind(a1, @"-", 0).location == -1) {
    CFStringRef v7 = _VSCopyQualifiedLanguageIdentifierForLanguageCode(a1, a2);
  }
  if (a1 && !v7)
  {
    CFRetain(a1);
    CFStringRef v7 = a1;
  }
  uint64_t v8 = _VSCopyFallbackLanguageIdentifierForLanguageIdentifier(v7, v6);
  CFRelease(v6);
  if (v7) {
    CFRelease(v7);
  }
  if (v4) {
LABEL_10:
  }
    CFRelease(v4);
  return v8;
}

CFStringRef VSVocalizerCopyPathForLocalizedResources(const __CFString *a1, void *a2, const __CFString *a3, int a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  CFURLRef v8 = _VSVocalizerCopyURLForFrameworkResources();
  CFURLRef v9 = VSVocalizerCopyURLForAssets();
  if (!a1) {
    goto LABEL_38;
  }
  if (a4)
  {
    CFStringRef v10 = VSGetLogDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v29) = 0;
      _os_log_debug_impl(&dword_20CABC000, v10, OS_LOG_TYPE_DEBUG, "compact explicitly specified, look at framework asset first\n", (uint8_t *)&v29, 2u);
    }
    CFURLRef v11 = _VSVocalizerCopyURLForLocalizedResourcesFoundAtURL(a1, a2, v8);
    if (v11) {
      goto LABEL_9;
    }
  }
  if (!VSVocalizerShouldUseAssetForLanguage((BOOL)a1))
  {
    CFURLRef v11 = 0;
LABEL_12:
    char v13 = 1;
    goto LABEL_13;
  }
  _VSVocalizerFinishInstallingAssetForLang(a1);
  CFIndex v12 = VSGetLogDefault();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    if (v9) {
      CFStringRef v26 = CFURLGetString(v9);
    }
    else {
      CFStringRef v26 = 0;
    }
    int v29 = 138412290;
    CFStringRef v30 = v26;
    _os_log_debug_impl(&dword_20CABC000, v12, OS_LOG_TYPE_DEBUG, "Looking for the resources in %@\n", (uint8_t *)&v29, 0xCu);
  }
  CFURLRef v11 = _VSVocalizerCopyURLForLocalizedResourcesFoundAtURL(a1, a2, v9);
  if (!v11) {
    goto LABEL_12;
  }
LABEL_9:
  if (_VSVocalizerIsValidAssetAtURLMigratingIfNeeded(v11)) {
    goto LABEL_31;
  }
  char v13 = 0;
LABEL_13:
  char v14 = VSGetLogDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    if (v8) {
      CFStringRef v25 = CFURLGetString(v8);
    }
    else {
      CFStringRef v25 = 0;
    }
    int v29 = 138412290;
    CFStringRef v30 = v25;
    _os_log_debug_impl(&dword_20CABC000, v14, OS_LOG_TYPE_DEBUG, "Looking for the resources in %@\n", (uint8_t *)&v29, 0xCu);
    if (v13) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if ((v13 & 1) == 0) {
LABEL_15:
  }
    CFRelease(v11);
LABEL_16:
  CFURLRef v11 = _VSVocalizerCopyURLForLocalizedResourcesFoundAtURL(a1, a2, v8);
  if (v11) {
    goto LABEL_31;
  }
  CFStringRef v15 = (const __CFString *)_VSVocalizerCopyFallbackLanguageIdentifier(a1, a3);
  CFStringRef v16 = VSGetLogDefault();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v29 = 138412290;
    CFStringRef v30 = v15;
    _os_log_debug_impl(&dword_20CABC000, v16, OS_LOG_TYPE_DEBUG, "Now looking for the fallback language: %@\n", (uint8_t *)&v29, 0xCu);
  }
  if (!VSVocalizerShouldUseAssetForLanguage((BOOL)v15)) {
    goto LABEL_23;
  }
  _VSVocalizerFinishInstallingAssetForLang(v15);
  CFIndex v17 = VSGetLogDefault();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    if (v9) {
      CFStringRef v28 = CFURLGetString(v9);
    }
    else {
      CFStringRef v28 = 0;
    }
    int v29 = 138412290;
    CFStringRef v30 = v28;
    _os_log_debug_impl(&dword_20CABC000, v17, OS_LOG_TYPE_DEBUG, "Looking for the resources in %@\n", (uint8_t *)&v29, 0xCu);
  }
  CFURLRef v18 = _VSVocalizerCopyURLForLocalizedResourcesFoundAtURL(v15, a2, v9);
  if (!v18 || (CFURLRef v11 = v18, !_VSVocalizerIsValidAssetAtURLMigratingIfNeeded(v18)))
  {
LABEL_23:
    CFIndex v19 = VSGetLogDefault();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      if (v8) {
        CFStringRef v27 = CFURLGetString(v8);
      }
      else {
        CFStringRef v27 = 0;
      }
      int v29 = 138412290;
      CFStringRef v30 = v27;
      _os_log_debug_impl(&dword_20CABC000, v19, OS_LOG_TYPE_DEBUG, "Looking for the resources in %@\n", (uint8_t *)&v29, 0xCu);
    }
    CFURLRef v11 = _VSVocalizerCopyURLForLocalizedResourcesFoundAtURL(v15, a2, v8);
    if (!v11)
    {
      CFRange v20 = VSGetLogDefault();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v29) = 0;
        _os_log_error_impl(&dword_20CABC000, v20, OS_LOG_TYPE_ERROR, "Can't find the resources anywhere!\n", (uint8_t *)&v29, 2u);
      }
      CFURLRef v11 = 0;
    }
  }
  if (v15) {
    CFRelease(v15);
  }
  if (v11)
  {
LABEL_31:
    CFIndex v21 = VSGetLogDefault();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v24 = CFURLGetString(v11);
      int v29 = 138412290;
      CFStringRef v30 = v24;
      _os_log_debug_impl(&dword_20CABC000, v21, OS_LOG_TYPE_DEBUG, "Found the resources here: %@\n", (uint8_t *)&v29, 0xCu);
    }
    CFStringRef v22 = CFURLCopyFileSystemPath(v11, kCFURLPOSIXPathStyle);
    CFRelease(v11);
    if (v8) {
      goto LABEL_34;
    }
    goto LABEL_35;
  }
LABEL_38:
  CFStringRef v22 = 0;
  if (v8) {
LABEL_34:
  }
    CFRelease(v8);
LABEL_35:
  if (v9) {
    CFRelease(v9);
  }
  return v22;
}

CFURLRef VSVocalizerCopyURLForAssets()
{
  CFURLRef result = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (result)
  {
    CFURLRef v1 = result;
    CFURLRef v2 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x263EFFB08], result, @"Library/VoiceServices/Assets", 1u);
    CFRelease(v1);
    return v2;
  }
  return result;
}

uint64_t VSVocalizerShouldUseAssetForLanguage(BOOL a1)
{
  BOOL v1 = a1;
  if (a1)
  {
    CFArrayRef v2 = _VSVocalizerCopyAssetLanguages();
    if (v2
      && (CFArrayRef v3 = v2,
          v8.CFIndex length = CFArrayGetCount(v2),
          v8.CFIndex location = 0,
          int v4 = CFArrayContainsValue(v3, v8, (const void *)v1),
          CFRelease(v3),
          v4))
    {
      return 1;
    }
    else
    {
      CFStringRef v5 = VSVocalizerCopyDefaultAssetLanguage();
      if (v5)
      {
        CFStringRef v6 = v5;
        BOOL v1 = CFEqual(v5, (CFStringRef)v1);
        CFRelease(v6);
      }
      else
      {
        return 0;
      }
    }
  }
  return v1;
}

void _VSVocalizerFinishInstallingAssetForLang(const __CFString *a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (a1)
  {
    CFURLRef v2 = _VSVocalizerCopyTemporaryAssetURLForLang((uint64_t)a1);
    if (v2)
    {
      CFURLRef v3 = v2;
      memset(&v22, 0, sizeof(v22));
      if (!CFURLGetFileSystemRepresentation(v2, 1u, (UInt8 *)buffer, 1024)) {
        goto LABEL_19;
      }
      if (stat((const char *)buffer, &v22)) {
        goto LABEL_19;
      }
      CFURLRef v4 = _VSVocalizerCopyAssetURLForLang(a1);
      if (!v4) {
        goto LABEL_19;
      }
      CFURLRef v5 = v4;
      int v6 = open((const char *)buffer, 32, *(_OWORD *)&v22.st_dev, *(_OWORD *)&v22.st_uid, *(_OWORD *)&v22.st_atimespec, *(_OWORD *)&v22.st_mtimespec, *(_OWORD *)&v22.st_ctimespec, *(_OWORD *)&v22.st_birthtimespec, *(_OWORD *)&v22.st_size, *(_OWORD *)&v22.st_blksize, *(_OWORD *)v22.st_qspare);
      if (v6 < 0)
      {
        char v14 = VSGetLogDefault();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          int v15 = *__error();
          LODWORD(v29[0].__pn_.__r_.__value_.__l.__data_) = 136315394;
          *(std::string::size_type *)((char *)v29[0].__pn_.__r_.__value_.__r.__words + 4) = (std::string::size_type)buffer;
          WORD2(v29[0].__pn_.__r_.__value_.__r.__words[1]) = 1024;
          *(_DWORD *)((char *)&v29[0].__pn_.__r_.__value_.__r.__words[1] + 6) = v15;
          _os_log_debug_impl(&dword_20CABC000, v14, OS_LOG_TYPE_DEBUG, "Unable to lock temporary asset: %s; presumably peer was first - error: %d\n",
            (uint8_t *)v29,
            0x12u);
        }
        goto LABEL_18;
      }
      int v7 = v6;
      if (stat((const char *)buffer, &v22) < 0)
      {
        CFStringRef v16 = VSGetLogDefault();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_17;
        }
        int v17 = *__error();
        LODWORD(v29[0].__pn_.__r_.__value_.__l.__data_) = 136315394;
        *(std::string::size_type *)((char *)v29[0].__pn_.__r_.__value_.__r.__words + 4) = (std::string::size_type)buffer;
        WORD2(v29[0].__pn_.__r_.__value_.__r.__words[1]) = 1024;
        *(_DWORD *)((char *)&v29[0].__pn_.__r_.__value_.__r.__words[1] + 6) = v17;
        CFURLRef v18 = "Temporary asset: %s has moved; presumably peer was first - error: %d\n";
        CFIndex v19 = v29;
        CFRange v20 = v16;
        uint32_t v21 = 18;
      }
      else
      {
        _VSVocalizerDeleteAssetAtURL(v5);
        if (!CFURLGetFileSystemRepresentation(v5, 1u, (UInt8 *)v29, 1024)) {
          goto LABEL_17;
        }
        rename(buffer, v29, v8);
        int v10 = v9;
        CFURLRef v11 = VSGetLogDefault();
        CFIndex v12 = v11;
        if (v10)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            int v13 = *__error();
            *(_DWORD *)buf = 136315650;
            CFStringRef v24 = buffer;
            __int16 v25 = 2080;
            CFStringRef v26 = v29;
            __int16 v27 = 1024;
            int v28 = v13;
            _os_log_error_impl(&dword_20CABC000, v12, OS_LOG_TYPE_ERROR, "Couldn't move the temporary asset: %s to the real asset: %s - error: %d\n", buf, 0x1Cu);
          }
          goto LABEL_17;
        }
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
LABEL_17:
          close(v7);
LABEL_18:
          CFRelease(v5);
LABEL_19:
          CFRelease(v3);
          return;
        }
        *(_DWORD *)buf = 136315394;
        CFStringRef v24 = buffer;
        __int16 v25 = 2080;
        CFStringRef v26 = v29;
        CFURLRef v18 = "Moved the temporary asset: %s to the real asset: %s\n";
        CFIndex v19 = (std::__fs::filesystem::path *)buf;
        CFRange v20 = v12;
        uint32_t v21 = 22;
      }
      _os_log_debug_impl(&dword_20CABC000, v20, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)v19, v21);
      goto LABEL_17;
    }
  }
}

BOOL _VSVocalizerIsValidAssetAtURLMigratingIfNeeded(const __CFURL *a1)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  if (_VSVocalizerIsValidAssetAtURL(a1)) {
    return 1;
  }
  CFURLRef v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buffer[0].__pn_.__r_.__value_.__l.__data_) = 138412290;
    *(std::string::size_type *)((char *)buffer[0].__pn_.__r_.__value_.__r.__words + 4) = (std::string::size_type)CFURLGetString(a1);
    _os_log_debug_impl(&dword_20CABC000, v2, OS_LOG_TYPE_DEBUG, "Trying to migrate asset because it's not valid: %@\n", (uint8_t *)buffer, 0xCu);
  }
  CFURLRef v3 = _VSVocalizerCopyURLForFrameworkResources();
  if (!v3) {
    goto LABEL_88;
  }
  CFURLRef v4 = v3;
  CFStringRef PathComponent = CFURLCopyLastPathComponent(a1);
  if (PathComponent)
  {
    CFStringRef v6 = PathComponent;
    if (!_VSVocalizerStringIsALanguageString(PathComponent)) {
      goto LABEL_86;
    }
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFURLRef url = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x263EFFB08], v4, v6, 1u);
    if (!url) {
      goto LABEL_86;
    }
    CFStringRef v8 = CFURLCopyLastPathComponent(a1);
    if (v8)
    {
      CFStringRef v9 = v8;
      if (_VSVocalizerStringIsALanguageString(v8)) {
        _VSVocalizerFinishInstallingAssetForLang(v9);
      }
      CFRelease(v9);
    }
    if (!_VSVocalizerEngineFormatVersionMatchesAssetFormatVersionAtURL(a1))
    {
      v43 = VSGetLogDefault();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        CFStringRef v44 = CFURLGetString(a1);
        LODWORD(buffer[0].__pn_.__r_.__value_.__l.__data_) = 138412290;
        *(std::string::size_type *)((char *)buffer[0].__pn_.__r_.__value_.__r.__words + 4) = (std::string::size_type)v44;
        _os_log_debug_impl(&dword_20CABC000, v43, OS_LOG_TYPE_DEBUG, "Deleting the asset located here: %@ because the format versions don't match\n", (uint8_t *)buffer, 0xCu);
      }
      _VSVocalizerDeleteAssetAtURL(a1);
      goto LABEL_85;
    }
    CFArrayRef v10 = (const __CFArray *)VSCopyContentsOfDirectoryAtURL((uint64_t)url, 0);
    if (v10)
    {
      CFArrayRef v11 = v10;
      CFIndex Count = CFArrayGetCount(v10);
      if (Count >= 1)
      {
        CFIndex v13 = Count;
        CFIndex v14 = 0;
        while (1)
        {
          CFURLRef ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v11, v14);
          CFStringRef v16 = CFURLCopyLastPathComponent(ValueAtIndex);
          if (v16) {
            break;
          }
LABEL_31:
          if (v13 == ++v14) {
            goto LABEL_35;
          }
        }
        CFStringRef v17 = v16;
        if (CFEqual(v16, @"broker.hdr"))
        {
LABEL_30:
          CFRelease(v17);
          goto LABEL_31;
        }
        CFURLRef v18 = CFURLCreateCopyAppendingPathComponent(v7, url, v17, 0);
        CFURLRef v19 = CFURLCreateCopyAppendingPathComponent(v7, a1, v17, 0);
        CFURLRef v20 = v19;
        if (v18 && v19)
        {
          if (CFURLGetFileSystemRepresentation(v19, 0, (UInt8 *)buffer, 1024)
            && CFURLGetFileSystemRepresentation(v18, 0, (UInt8 *)v80, 1024))
          {
            if (symlink((const char *)v80, (const char *)buffer))
            {
              if (*__error() != 17)
              {
                log = VSGetLogDefault();
                if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
                {
                  int streama = *__error();
                  uint32_t v21 = __error();
                  stat v22 = strerror(*v21);
                  *(_DWORD *)buf = 67109890;
                  int v73 = streama;
                  __int16 v74 = 2080;
                  v75 = v22;
                  __int16 v76 = 2080;
                  v77 = v80;
                  __int16 v78 = 2080;
                  v79 = buffer;
                  _os_log_error_impl(&dword_20CABC000, log, OS_LOG_TYPE_ERROR, "***ERROR*** There was an error (%d - %s) when trying to symlink %s to %s\n", buf, 0x26u);
                }
              }
            }
            else
            {
              CFStringGetCString(v17, (char *)buf, 1024, 0x8000100u);
              loga = VSGetLogDefault();
              if (os_log_type_enabled(loga, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v68 = 136315394;
                v69 = buf;
                __int16 v70 = 2080;
                v71 = buffer;
                _os_log_debug_impl(&dword_20CABC000, loga, OS_LOG_TYPE_DEBUG, "Symlinked %s to %s\n", v68, 0x16u);
              }
            }
          }
        }
        else if (!v18)
        {
          goto LABEL_28;
        }
        CFRelease(v18);
LABEL_28:
        if (v20) {
          CFRelease(v20);
        }
        goto LABEL_30;
      }
LABEL_35:
      CFRelease(v11);
    }
    CFURLRef v23 = CFURLCreateCopyAppendingPathComponent(v7, a1, @"broker.hdr", 0);
    CFURLRef v24 = CFURLCreateCopyAppendingPathComponent(v7, a1, @"broker.hdr.tmp", 0);
    CFURLRef v25 = CFURLCreateCopyAppendingPathComponent(v7, url, @"broker.hdr", 0);
    CFURLRef v26 = CFURLCreateCopyAppendingPathComponent(v7, a1, @"broker.hdr.asset", 0);
    CFURLRef v27 = v26;
    if (!v23 || !v24 || !v26 || !v25)
    {
      if (!v23) {
        goto LABEL_74;
      }
      goto LABEL_73;
    }
    CFDataRef v28 = (const __CFData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:v26];
    CFDataRef v29 = (const __CFData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:v25];
    CFDataRef v30 = v29;
    if (v28 && v29)
    {
      theData = CFDataCreateMutableCopy(v7, 0, v29);
      if (theData)
      {
        CFDataRef v65 = v30;
        BytePtr = CFDataGetBytePtr(v28);
        CFDataRef v32 = v28;
        if (BytePtr)
        {
          v33 = BytePtr;
          CFIndex Length = CFDataGetLength(v32);
          CFDataAppendBytes(theData, v33, Length);
        }
        uint64_t v35 = CFWriteStreamCreateWithFile(v7, v24);
        CFDataRef v28 = v32;
        CFDataRef v30 = v65;
        if (v35)
        {
          os_log_t logb = (os_log_t)v23;
          CFRange v36 = v35;
          if (CFWriteStreamOpen(v35))
          {
            CFDataRef v59 = v28;
            MutableBytePtr = CFDataGetMutableBytePtr(theData);
            CFIndex v38 = CFDataGetLength(theData);
            stream = v36;
            CFIndex v39 = CFWriteStreamWrite(v36, MutableBytePtr, v38);
            v40 = VSGetLogDefault();
            v41 = v40;
            if (v39 < 1)
            {
              CFURLRef v42 = (const __CFURL *)logb;
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                int v58 = *__error();
                v53 = __error();
                v54 = strerror(*v53);
                LODWORD(buffer[0].__pn_.__r_.__value_.__l.__data_) = 67109378;
                HIDWORD(buffer[0].__pn_.__r_.__value_.__r.__words[0]) = v58;
                LOWORD(buffer[0].__pn_.__r_.__value_.__r.__words[1]) = 2080;
                *(std::string::size_type *)((char *)&buffer[0].__pn_.__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)v54;
                _os_log_error_impl(&dword_20CABC000, v41, OS_LOG_TYPE_ERROR, "***ERROR*** couldn't append broker header files (%d - %s)\n", (uint8_t *)buffer, 0x12u);
              }
            }
            else
            {
              CFURLRef v42 = (const __CFURL *)logb;
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              {
                LOWORD(buffer[0].__pn_.__r_.__value_.__l.__data_) = 0;
                _os_log_debug_impl(&dword_20CABC000, v41, OS_LOG_TYPE_DEBUG, "Successfully appended broker header files\n", (uint8_t *)buffer, 2u);
              }
            }
            CFWriteStreamClose(stream);
            CFDataRef v28 = v59;
            if (CFURLGetFileSystemRepresentation(v24, 1u, (UInt8 *)buffer, 1024))
            {
              if (v39 < 1)
              {
                unlink((const char *)buffer);
              }
              else
              {
                if (CFURLGetFileSystemRepresentation(v42, 1u, (UInt8 *)v80, 1024))
                {
                  rename(buffer, v80, v45);
                  if (v46 < 0)
                  {
                    v47 = VSGetLogDefault();
                    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                    {
                      int v55 = *__error();
                      v56 = __error();
                      v57 = strerror(*v56);
                      *(_DWORD *)buf = 67109378;
                      int v73 = v55;
                      __int16 v74 = 2080;
                      v75 = v57;
                      _os_log_error_impl(&dword_20CABC000, v47, OS_LOG_TYPE_ERROR, "***ERROR*** couldn't move broker header file to final location (%d - %s)\n", buf, 0x12u);
                    }
                  }
                }
                CFDataRef v28 = v59;
              }
            }
            CFDataRef v30 = v65;
            CFRange v36 = stream;
          }
          CFRelease(v36);
          CFURLRef v23 = (CFURLRef)logb;
        }
        CFRelease(theData);
      }
    }
    else if (!v28)
    {
LABEL_71:
      if (v30) {
        CFRelease(v30);
      }
LABEL_73:
      CFRelease(v23);
LABEL_74:
      if (v24) {
        CFRelease(v24);
      }
      if (v25) {
        CFRelease(v25);
      }
      if (v27) {
        CFRelease(v27);
      }
      CFURLRef v48 = CFURLCreateCopyAppendingPathComponent(v7, a1, @".migrated", 0);
      if (v48)
      {
        CFURLRef v49 = v48;
        if (CFURLGetFileSystemRepresentation(v48, 1u, (UInt8 *)buffer, 1024))
        {
          int v50 = open((const char *)buffer, 512, 384);
          if (v50 != -1) {
            close(v50);
          }
        }
        CFRelease(v49);
      }
LABEL_85:
      CFRelease(url);
LABEL_86:
      CFRelease(v6);
      goto LABEL_87;
    }
    CFRelease(v28);
    goto LABEL_71;
  }
LABEL_87:
  CFRelease(v4);
LABEL_88:
  if (_VSVocalizerIsValidAssetAtURL(a1)) {
    return 1;
  }
  v52 = VSGetLogDefault();
  BOOL result = os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG);
  if (result)
  {
    LOWORD(buffer[0].__pn_.__r_.__value_.__l.__data_) = 0;
    _os_log_debug_impl(&dword_20CABC000, v52, OS_LOG_TYPE_DEBUG, "After migrating asset, it's still not valid -- sorry\n", (uint8_t *)buffer, 2u);
    return 0;
  }
  return result;
}

CFURLRef _VSVocalizerIsValidAssetAtURL(CFURLRef url)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  CFURLRef result = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x263EFFB08], url, @".migrated", 0);
  if (result)
  {
    CFURLRef v3 = result;
    memset(&v5, 0, sizeof(v5));
    if (CFURLGetFileSystemRepresentation(result, 1u, buffer, 1024))
    {
      int v4 = stat((const char *)buffer, &v5);
      CFRelease(v3);
      if (!v4) {
        return (const __CFURL *)(_VSVocalizerEngineFormatVersionMatchesAssetFormatVersionAtURL(url) != 0);
      }
    }
    else
    {
      CFRelease(v3);
    }
    return 0;
  }
  return result;
}

BOOL _VSVocalizerStringIsALanguageString(const __CFString *a1)
{
  return CFStringGetLength(a1) == 5 && CFStringGetCharacterAtIndex(a1, 2) == 45;
}

uint64_t _VSVocalizerEngineFormatVersionMatchesAssetFormatVersionAtURL(const __CFURL *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  CFDictionaryRef v1 = _VSVocalizerCopyVoiceAssetFormatVersionFoundAtURL(a1, &cf);
  if (v1 && cf)
  {
    CFArrayRef v2 = _VSVocalizerCopyVoiceEngineFormatVersionsForLanguage(cf);
    CFArrayRef v3 = v2;
    if (!v2 || (v16.length = CFArrayGetCount(v2), v16.CFIndex location = 0, CFArrayGetFirstIndexOfValue(v3, v16, v1) == -1))
    {
      CFStringRef v8 = VSGetLogDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        CFDictionaryRef v14 = v1;
        _os_log_debug_impl(&dword_20CABC000, v8, OS_LOG_TYPE_DEBUG, "---> asset's version is %@\n", buf, 0xCu);
      }
      CFStringRef v9 = VSGetLogDefault();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, 0);
        *(_DWORD *)buf = 138412290;
        CFDictionaryRef v14 = ValueAtIndex;
        _os_log_debug_impl(&dword_20CABC000, v9, OS_LOG_TYPE_DEBUG, "---> engine's version is %@\n", buf, 0xCu);
      }
      uint64_t v4 = 0;
      uint64_t v6 = 0;
      if (!v3) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v4 = 1;
    }
    CFRelease(v3);
    uint64_t v6 = v4;
LABEL_16:
    CFRelease(v1);
    uint64_t v7 = v6;
    goto LABEL_17;
  }
  stat v5 = VSGetLogDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_20CABC000, v5, OS_LOG_TYPE_ERROR, "Couldn't get asset's version and/or language\n", buf, 2u);
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  if (v1) {
    goto LABEL_16;
  }
LABEL_17:
  if (cf) {
    CFRelease(cf);
  }
  return v7;
}

uint64_t _VSVocalizerDeleteAssetAtURL(const __CFURL *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  CFArrayRef v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    CFStringRef v7 = CFURLGetString(a1);
    _os_log_debug_impl(&dword_20CABC000, v2, OS_LOG_TYPE_DEBUG, "Deleting asset at url: %@\n", (uint8_t *)&v6, 0xCu);
  }
  CFURLRef v3 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x263EFFB08], a1, @"voice_format_version.plist", 0);
  if (v3)
  {
    CFURLRef v4 = v3;
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtURL:error:", v3, 0);
    CFRelease(v4);
  }
  VSCFURLDeleteDirectoryContents((uint64_t)a1);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtURL:error:", a1, 0);
}

CFDictionaryRef _VSVocalizerCopyVoiceAssetFormatVersionFoundAtURL(const __CFURL *a1, void *a2)
{
  v18[1] = *MEMORY[0x263EF8340];
  if (a2) {
    *a2 = 0;
  }
  CFDictionaryRef v3 = (const __CFDictionary *)_VSVocalizerCopyFormatVersionInfoFoundAtURL(a1);
  if (v3)
  {
    CFDictionaryRef v4 = v3;
    if (CFDictionaryContainsKey(v3, @"FormatVersion"))
    {
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v4, @"FormatVersion");
      CFDictionaryRef v6 = Value;
      if (Value) {
        CFRetain(Value);
      }
      if (a2)
      {
        if (CFDictionaryContainsKey(v4, @"Language"))
        {
          CFStringRef v7 = CFDictionaryGetValue(v4, @"Language");
          *a2 = v7;
          if (v7) {
            CFRetain(v7);
          }
        }
      }
      goto LABEL_25;
    }
    if (CFDictionaryGetCount(v4) < 1)
    {
      CFDictionaryRef v6 = 0;
    }
    else
    {
      MEMORY[0x270FA5388]();
      CFStringRef v9 = (const void **)((char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
      if (v8 >= 0x200) {
        size_t v10 = 512;
      }
      else {
        size_t v10 = v8;
      }
      bzero((char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
      CFDictionaryGetKeysAndValues(v4, v9, 0);
      CFArrayRef v11 = *v9;
      if (!*v9 || (CFTypeID v12 = CFGetTypeID(*v9), v12 != CFStringGetTypeID()))
      {
LABEL_22:
        CFDictionaryRef v6 = 0;
        goto LABEL_25;
      }
      CFDictionaryRef v13 = (const __CFDictionary *)CFDictionaryGetValue(v4, v11);
      CFDictionaryRef v6 = v13;
      if (v13)
      {
        CFTypeID v14 = CFGetTypeID(v13);
        if (v14 == CFDictionaryGetTypeID())
        {
          CFBooleanRef v15 = (const __CFBoolean *)CFDictionaryGetValue(v6, @"NotForSiri");
          if (!v15 || !CFBooleanGetValue(v15))
          {
            CFDictionaryRef v17 = (const __CFDictionary *)CFDictionaryGetValue(v6, @"FormatVersion");
            CFDictionaryRef v6 = v17;
            if (v17) {
              CFRetain(v17);
            }
            if (a2)
            {
              *a2 = v11;
              CFRetain(v11);
            }
            goto LABEL_25;
          }
        }
        goto LABEL_22;
      }
    }
LABEL_25:
    CFRelease(v4);
    return v6;
  }
  return 0;
}

CFArrayRef _VSVocalizerCopyVoiceEngineFormatVersionsForLanguage(const void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  pthread_once(&_VSVocalizerCopyVoiceEngineFormatVersionsForLanguage___InitializeVoiceFormatVersionOnce, _VSVocalizerInitializeVoiceEngineFormatVersions);
  if (!a1) {
    return 0;
  }
  if (!__VoiceEngineFormatVersions)
  {
    CFStringRef v9 = VSGetLogDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      CFDictionaryRef v6 = "VoiceEngineFormatVersions hasn't been initialized, voices may not be compatible\n";
      CFStringRef v7 = v9;
      uint32_t v8 = 2;
      goto LABEL_12;
    }
    return 0;
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)__VoiceEngineFormatVersions, a1);
  if (!Value
    || (CFStringRef v3 = (const __CFString *)CFDictionaryGetValue(Value, @"FormatVersion")) == 0
    || (CFArrayRef result = CFStringCreateArrayBySeparatingStrings(0, v3, @",")) == 0)
  {
    stat v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      CFArrayRef v11 = a1;
      CFDictionaryRef v6 = "Couldn't get the engine format version for language %{public}@\n";
      CFStringRef v7 = v5;
      uint32_t v8 = 12;
LABEL_12:
      _os_log_error_impl(&dword_20CABC000, v7, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v10, v8);
      return 0;
    }
    return 0;
  }
  return result;
}

void _VSVocalizerInitializeVoiceEngineFormatVersions()
{
  CFURLRef v0 = _VSVocalizerCopyURLForFrameworkResources();
  if (v0)
  {
    CFURLRef v1 = v0;
    __VoiceEngineFormatVersions = (uint64_t)_VSVocalizerCopyFormatVersionInfoFoundAtURL(v0);
    if (!__VoiceEngineFormatVersions)
    {
      CFArrayRef v2 = VSGetLogDefault();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CFStringRef v3 = 0;
        _os_log_error_impl(&dword_20CABC000, v2, OS_LOG_TYPE_ERROR, "Couldn't initialize the engine voice format versions\n", v3, 2u);
      }
      __VoiceEngineFormatVersions = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    }
    CFRelease(v1);
  }
}

const void *_VSVocalizerCopyFormatVersionInfoFoundAtURL(CFURLRef url)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFURLRef v2 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x263EFFB08], url, @"voice_format_version.plist", 0);
  if (!v2) {
    return 0;
  }
  CFURLRef v3 = v2;
  CFDictionaryRef v4 = CFReadStreamCreateWithFile(v1, v2);
  if (v4)
  {
    stat v5 = v4;
    if (CFReadStreamOpen(v4))
    {
      CFPropertyListRef v6 = CFPropertyListCreateWithStream(v1, v5, 0, 0, 0, 0);
      CFStringRef v7 = v6;
      if (v6)
      {
        CFTypeID v8 = CFGetTypeID(v6);
        if (v8 != CFDictionaryGetTypeID())
        {
          CFRelease(v7);
          CFStringRef v7 = 0;
        }
      }
      CFReadStreamClose(v5);
    }
    else
    {
      CFStringRef v7 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    CFStringRef v7 = 0;
  }
  CFRelease(v3);
  return v7;
}

CFURLRef _VSVocalizerCopyTemporaryAssetURLForLang(uint64_t a1)
{
  CFURLRef v2 = VSVocalizerCopyURLForAssets();
  if (!v2) {
    return 0;
  }
  CFURLRef v3 = v2;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@%@", a1, @".tmp");
  if (v5)
  {
    CFStringRef v6 = v5;
    CFURLRef v7 = CFURLCreateCopyAppendingPathComponent(v4, v3, v5, 1u);
    CFRelease(v6);
  }
  else
  {
    CFURLRef v7 = 0;
  }
  CFRelease(v3);
  return v7;
}

CFURLRef _VSVocalizerCopyAssetURLForLang(const __CFString *a1)
{
  CFURLRef result = VSVocalizerCopyURLForAssets();
  if (result)
  {
    CFURLRef v3 = result;
    CFURLRef v4 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x263EFFB08], result, a1, 1u);
    CFRelease(v3);
    return v4;
  }
  return result;
}

CFArrayRef _VSVocalizerCopyAssetLanguages()
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  CFURLRef v0 = VSVocalizerCopyURLForAssets();
  if (!v0) {
    return 0;
  }
  CFURLRef v1 = v0;
  CFTypeRef cf = 0;
  id v2 = VSCopyContentsOfDirectoryAtURL((uint64_t)v0, &cf);
  CFURLRef v3 = v2;
  if (cf) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v2 == 0;
  }
  if (v4)
  {
    CFStringRef v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      CFIndex Code = (CFIndex)cf;
      if (cf) {
        CFIndex Code = CFErrorGetCode((CFErrorRef)cf);
      }
      *(_DWORD *)buf = 134217984;
      CFIndex v30 = Code;
      _os_log_debug_impl(&dword_20CABC000, v5, OS_LOG_TYPE_DEBUG, "Couldn't get the contents of the assets directory (error %ld)\n", buf, 0xCu);
    }
    if (cf) {
      CFRelease(cf);
    }
    CFArrayRef Mutable = 0;
    if (!v3) {
      goto LABEL_37;
    }
LABEL_36:
    CFRelease(v3);
    goto LABEL_37;
  }
  CFArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  CFIndex Count = CFArrayGetCount((CFArrayRef)v3);
  if (Count < 1) {
    goto LABEL_36;
  }
  CFIndex v8 = Count;
  CFURLRef v26 = v1;
  CFURLRef v27 = v3;
  for (CFIndex i = 0; i != v8; ++i)
  {
    CFURLRef ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex((CFArrayRef)v3, i);
    if (!ValueAtIndex) {
      continue;
    }
    CFURLRef v11 = ValueAtIndex;
    CFStringRef v12 = _VSVocalizerCopyLangFromTemporaryAssetURL(ValueAtIndex);
    if (!v12) {
      goto LABEL_28;
    }
    CFStringRef v13 = v12;
    CFURLRef v14 = _VSVocalizerCopyTemporaryAssetURLForLang((uint64_t)v12);
    if (!v14)
    {
      CFRelease(v13);
      goto LABEL_28;
    }
    CFURLRef v15 = v14;
    CFArrayRef v16 = Mutable;
    CFURLRef v17 = CFURLCopyAbsoluteURL(v11);
    CFURLRef v18 = CFURLCopyAbsoluteURL(v15);
    CFURLRef v19 = v18;
    if (v17 && v18)
    {
      BOOL v20 = CFEqual(v17, v18) != 0;
    }
    else
    {
      BOOL v20 = 0;
      BOOL v21 = 0;
      if (!v17) {
        goto LABEL_24;
      }
    }
    CFRelease(v17);
    BOOL v21 = v20;
LABEL_24:
    if (v19) {
      CFRelease(v19);
    }
    CFRelease(v15);
    CFRelease(v13);
    CFArrayRef Mutable = v16;
    CFURLRef v3 = v27;
    if (v21)
    {
      CFStringRef PathComponent = _VSVocalizerCopyLangFromTemporaryAssetURL(v11);
      goto LABEL_29;
    }
LABEL_28:
    CFStringRef PathComponent = CFURLCopyLastPathComponent(v11);
LABEL_29:
    CFStringRef v23 = PathComponent;
    if (PathComponent)
    {
      if (_VSVocalizerStringIsALanguageString(PathComponent))
      {
        v32.CFIndex length = CFArrayGetCount(Mutable);
        v32.CFIndex location = 0;
        if (!CFArrayContainsValue(Mutable, v32, v23)) {
          CFArrayAppendValue(Mutable, v23);
        }
      }
      CFRelease(v23);
    }
  }
  CFURLRef v1 = v26;
  if (v3) {
    goto LABEL_36;
  }
LABEL_37:
  CFRelease(v1);
  return Mutable;
}

CFStringRef VSVocalizerCopyDefaultAssetLanguage()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  CFStringRef v0 = (const __CFString *)VSPreferencesCopySpokenLanguageIdentifier();
  CFURLRef v1 = _VSVocalizerCopyURLForFrameworkResources();
  CFURLRef v2 = v1;
  if (v0 && v1 && (CFURLRef v3 = _VSVocalizerCopyURLForResourcesInDirectory(v0, v1)) != 0)
  {
    CFURLRef v4 = v3;
    CFRelease(v2);
    CFRelease(v4);
    return v0;
  }
  else
  {
    CFStringRef v6 = VSGetLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412290;
      CFStringRef v11 = v0;
      _os_log_debug_impl(&dword_20CABC000, v6, OS_LOG_TYPE_DEBUG, "No TTS resources for asset. Trying fallback language for %@", (uint8_t *)&v10, 0xCu);
    }
    CFStringRef v7 = (const __CFString *)_VSVocalizerCopyFallbackLanguageIdentifier(v0, 0);
    if (v7)
    {
      CFStringRef v5 = v7;
      if (v0) {
        CFRelease(v0);
      }
      CFIndex v8 = VSGetLogDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v10 = 138412290;
        CFStringRef v11 = v5;
        _os_log_debug_impl(&dword_20CABC000, v8, OS_LOG_TYPE_DEBUG, "Using asset fallback language %@", (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      CFStringRef v5 = v0;
    }
    if (v2) {
      CFRelease(v2);
    }
  }
  return v5;
}

CFStringRef _VSVocalizerCopyLangFromTemporaryAssetURL(CFURLRef url)
{
  CFURLRef v1 = CFURLCreateCopyDeletingPathExtension((CFAllocatorRef)*MEMORY[0x263EFFB08], url);
  if (!v1) {
    return 0;
  }
  CFURLRef v2 = v1;
  CFStringRef PathComponent = CFURLCopyLastPathComponent(v1);
  CFStringRef v4 = PathComponent;
  if (PathComponent && !_VSVocalizerStringIsALanguageString(PathComponent))
  {
    CFRelease(v4);
    CFStringRef v4 = 0;
  }
  CFRelease(v2);
  return v4;
}

BOOL VSVocalizerAssetExistsForLanguage(const __CFString *a1)
{
  CFArrayRef v2 = _VSVocalizerCopyAssetLanguages();
  CFArrayRef v3 = v2;
  BOOL v4 = 0;
  if (!a1 || !v2) {
    goto LABEL_10;
  }
  CFIndex Count = CFArrayGetCount(v2);
  if (Count >= 1)
  {
    CFIndex v6 = Count;
    uint64_t v7 = 1;
    do
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v3, v7 - 1);
      if (ValueAtIndex) {
        BOOL v4 = CFEqual(a1, ValueAtIndex);
      }
      else {
        BOOL v4 = 0;
      }
      if (v7 >= v6) {
        break;
      }
      ++v7;
    }
    while (!v4);
LABEL_10:
    if (!v3) {
      return v4;
    }
    goto LABEL_13;
  }
  BOOL v4 = 0;
LABEL_13:
  CFRelease(v3);
  return v4;
}

void VSVocalizerDeleteAssetForLanguage(const __CFString *a1)
{
  if (a1)
  {
    if (!VSVocalizerShouldUseAssetForLanguage((BOOL)a1) && _VSVocalizerStringIsALanguageString(a1))
    {
      _VSVocalizerFinishInstallingAssetForLang(a1);
      CFURLRef v2 = _VSVocalizerCopyAssetURLForLang(a1);
      if (v2)
      {
        CFURLRef v3 = v2;
        _VSVocalizerDeleteAssetAtURL(v2);
        CFRelease(v3);
      }
    }
  }
}

CFURLRef VSVocalizerCopyPathForTones()
{
  CFURLRef result = _VSVocalizerCopyURLForTones();
  if (result)
  {
    CFURLRef v1 = result;
    CFStringRef v2 = CFURLCopyFileSystemPath(result, kCFURLPOSIXPathStyle);
    CFRelease(v1);
    return (const __CFURL *)v2;
  }
  return result;
}

CFURLRef _VSVocalizerCopyURLForTones()
{
  CFURLRef result = _VSVocalizerCopyURLForFrameworkResources();
  if (result)
  {
    CFURLRef v1 = result;
    CFURLRef v2 = _VSVocalizerCopyURLForResourcesInDirectory(@"Tones", result);
    CFRelease(v1);
    return v2;
  }
  return result;
}

const void *VSVocalizerCopyFileNameForToneName(const void *a1)
{
  pthread_once(&VSVocalizerCopyFileNameForToneName___InitializeTonePathsOnce, _VSVocalizerInitializeToneDictionary);
  if (!__ToneMapping) {
    return 0;
  }
  CFDictionaryRef Value = CFDictionaryGetValue((CFDictionaryRef)__ToneMapping, a1);
  CFURLRef v3 = Value;
  if (Value) {
    CFRetain(Value);
  }
  return v3;
}

void _VSVocalizerInitializeToneDictionary()
{
  CFURLRef v0 = _VSVocalizerCopyURLForTones();
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  __ToneMapping = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v0)
  {
    CFArrayRef v2 = (const __CFArray *)VSCopyContentsOfDirectoryAtURL((uint64_t)v0, 0);
    if (v2)
    {
      CFArrayRef v3 = v2;
      CFIndex Count = CFArrayGetCount(v2);
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        CFIndex v6 = 0;
        while (1)
        {
          CFURLRef ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v3, v6);
          if (ValueAtIndex) {
            break;
          }
LABEL_15:
          if (v5 == ++v6) {
            goto LABEL_16;
          }
        }
        CFURLRef v8 = ValueAtIndex;
        CFStringRef PathComponent = CFURLCopyLastPathComponent(ValueAtIndex);
        CFStringRef v10 = CFURLCopyPathExtension(v8);
        if (v10 && PathComponent)
        {
          if (CFStringFind(PathComponent, v10, 0xCuLL).location != -1)
          {
            CFIndex Length = CFStringGetLength(PathComponent);
            v15.CFIndex length = Length + ~CFStringGetLength(v10);
            v15.CFIndex location = 0;
            CFStringRef v12 = CFStringCreateWithSubstring(v1, PathComponent, v15);
            if (v12)
            {
              CFStringRef v13 = v12;
              CFDictionarySetValue((CFMutableDictionaryRef)__ToneMapping, v12, PathComponent);
              CFRelease(v13);
            }
          }
        }
        else if (!PathComponent)
        {
          goto LABEL_13;
        }
        CFRelease(PathComponent);
LABEL_13:
        if (v10) {
          CFRelease(v10);
        }
        goto LABEL_15;
      }
LABEL_16:
      CFRelease(v3);
    }
    CFRelease(v0);
  }
}

CFDictionaryRef VSVocalizerCopyVoiceEngineFormatVersions()
{
  pthread_once(&_VSVocalizerCopyVoiceEngineFormatVersionsForLanguage___InitializeVoiceFormatVersionOnce, _VSVocalizerInitializeVoiceEngineFormatVersions);
  CFDictionaryRef v0 = (const __CFDictionary *)__VoiceEngineFormatVersions;
  if (__VoiceEngineFormatVersions)
  {
    CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    return CFDictionaryCreateCopy(v1, v0);
  }
  else
  {
    CFArrayRef v3 = VSGetLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_error_impl(&dword_20CABC000, v3, OS_LOG_TYPE_ERROR, "VoiceEngineFormatVersions hasn't been initialized, voices may not be compatible\n", v4, 2u);
    }
    return 0;
  }
}

const void *VSVocalizerCopyVoiceEngineFormatVersionForLanguage(const void *a1)
{
  CFArrayRef v1 = _VSVocalizerCopyVoiceEngineFormatVersionsForLanguage(a1);
  if (!v1) {
    return 0;
  }
  CFArrayRef v2 = v1;
  CFURLRef ValueAtIndex = CFArrayGetValueAtIndex(v1, 0);
  CFRetain(ValueAtIndex);
  CFRelease(v2);
  return ValueAtIndex;
}

uint64_t VSCreateDirectory(const __CFURL *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  memset(&v2, 0, sizeof(v2));
  uint64_t result = CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1023);
  if (result)
  {
    buffer[1023] = 0;
    mkdir((const char *)buffer, 0x1C0u);
    return stat((const char *)buffer, &v2) == 0;
  }
  return result;
}

uint64_t VSCreateURLAndDirectory(CFURLRef url, CFStringRef pathComponent, const __CFURL **a3)
{
  if (!url) {
    return 0;
  }
  CFURLRef v4 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x263EFFB08], url, pathComponent, 1u);
  if (!v4) {
    return 0;
  }
  CFURLRef v5 = v4;
  uint64_t v6 = VSCreateDirectory(v4);
  uint64_t v7 = v6;
  if (a3 && v6)
  {
    *a3 = v5;
    return 1;
  }
  else
  {
    CFRelease(v5);
  }
  return v7;
}

uint64_t VSDirectoryExistsAtURL(uint64_t result, int a2, unsigned char *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a3) {
    *a3 = 0;
  }
  if (result)
  {
    memset(&v6, 0, sizeof(v6));
    uint64_t result = CFURLGetFileSystemRepresentation((CFURLRef)result, 1u, buffer, 1024);
    if (result)
    {
      if (stat((const char *)buffer, &v6))
      {
        if (a2 == 1)
        {
          int v5 = mkdir((const char *)buffer, 0x1C0u);
          uint64_t result = v5 == 0;
          if (a3)
          {
            if (!v5)
            {
              uint64_t result = 1;
              *a3 = 1;
            }
          }
        }
        else
        {
          return 0;
        }
      }
      else
      {
        return 1;
      }
    }
  }
  return result;
}

uint64_t VSFileExistsAtURL(uint64_t a1)
{
  return VSDirectoryExistsAtURL(a1, 0, 0);
}

BOOL VSCreateTemporaryDirectory(const void *a1, CFStringRef theString, CFURLRef *a3)
{
  v17[1] = *MEMORY[0x263EF8340];
  CFIndex v6 = CFStringGetLength(theString) + 1025;
  uint64_t v7 = (char *)v17 - ((MEMORY[0x270FA5388]() + 1040) & 0xFFFFFFFFFFFFFFF0);
  CFAllocatorRef v8 = CFGetAllocator(a1);
  CFAllocatorRef v9 = v8;
  if (a3) {
    *a3 = 0;
  }
  CFURLRef v10 = CFURLCreateCopyAppendingPathComponent(v8, (CFURLRef)a1, theString, 1u);
  if (!v10) {
    return 0;
  }
  CFURLRef v11 = v10;
  if (CFURLGetFileSystemRepresentation(v10, 1u, (UInt8 *)v7, v6))
  {
    CFStringRef v12 = mkdtemp(v7);
    BOOL v13 = v12 != 0;
    if (a3 && v12)
    {
      CFStringRef v14 = CFStringCreateWithFileSystemRepresentation(v9, v12);
      if (v14)
      {
        CFStringRef v15 = v14;
        BOOL v13 = 1;
        *a3 = CFURLCreateWithFileSystemPath(v9, v14, kCFURLPOSIXPathStyle, 1u);
        CFRelease(v15);
      }
      else
      {
        BOOL v13 = 1;
      }
    }
  }
  else
  {
    BOOL v13 = 0;
  }
  CFRelease(v11);
  return v13;
}

void VSCFURLDeleteDirectoryContents(uint64_t a1)
{
  CFArrayRef v1 = (const __CFArray *)VSCopyContentsOfDirectoryAtURL(a1, 0);
  if (v1)
  {
    CFArrayRef v2 = v1;
    v4.CFIndex length = CFArrayGetCount(v1);
    v4.CFIndex location = 0;
    CFArrayApplyFunction(v2, v4, (CFArrayApplierFunction)_DeleteURL, 0);
    CFRelease(v2);
  }
}

id VSCopyContentsOfDirectoryAtURL(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v5 = (void *)MEMORY[0x210554510]();
  id v18 = 0;
  CFIndex v6 = (void *)[MEMORY[0x263F08850] defaultManager];
  uint64_t v7 = (void *)[v6 contentsOfDirectoryAtURL:a1 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:0 error:&v18];
  if (a2) {
    *a2 = v18;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "path"), "stringByStandardizingPath");
        objc_msgSend(v4, "addObject:", objc_msgSend(NSURL, "fileURLWithPath:", v12));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v9);
  }
  return v4;
}

void _DeleteURL(const __CFURL *a1)
{
  if (CFURLHasDirectoryPath(a1))
  {
    CFStringRef PathComponent = CFURLCopyLastPathComponent(a1);
    if (PathComponent)
    {
      CFStringRef v3 = PathComponent;
      if (CFEqual(PathComponent, @".")
        || CFEqual(v3, @".."))
      {
        VSCFURLDeleteDirectoryContents(a1);
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtURL:error:", a1, 0);
      }
      CFRelease(v3);
    }
  }
  else
  {
    id v4 = (void *)[MEMORY[0x263F08850] defaultManager];
    [v4 removeItemAtURL:a1 error:0];
  }
}

uint64_t VSDeleteItemAtURL(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtURL:error:", a1, a2);
}

uint64_t VSCreateDataFromContentsOfURL(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263EFF8F8]);
  return [v2 initWithContentsOfURL:a1];
}

id VSCopyModificationDateForFileAtURL(void *a1)
{
  uint64_t v1 = objc_msgSend((id)objc_msgSend(a1, "filePathURL"), "path");
  id v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "attributesOfItemAtPath:error:", v1, 0);
  CFStringRef v3 = (void *)[v2 objectForKey:*MEMORY[0x263F08048]];
  return v3;
}

uint64_t _VSRecognitionSessionKeywordIndexChangedNotificationHandler(uint64_t a1, void *a2)
{
  return [a2 _keywordIndexChanged];
}

void sub_20CADE308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CADEABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t AudioConverterFillComplexBuffer_BlockInvoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = (uint64_t (**)(void, void, void, void))MEMORY[0x210554730](a5);
  uint64_t v9 = v8[2](v8, a2, a3, a4);

  return v9;
}

__CFString *VSLoggingStringForUtterance(void *a1, int a2)
{
  id v3 = a1;
  if (![v3 length] || objc_msgSend(v3, "isEqualToString:", @" "))
  {
    id v4 = (__CFString *)v3;
LABEL_4:
    int v5 = v4;
    goto LABEL_5;
  }
  if (a2)
  {
    id v4 = [v3 stringByReplacingOccurrencesOfString:@"\x1B" withString:@"\\e"];
    goto LABEL_4;
  }
  int v5 = @"<private>";
LABEL_5:

  return v5;
}

uint64_t _AddKnownKeywords(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 addObject:a2];
}

unint64_t _AddAmbiguousKeywords(uint64_t a1, void *a2, void *a3)
{
  unint64_t result = [a2 count];
  if (result >= 2)
  {
    return [a3 addObjectsFromArray:a2];
  }
  return result;
}

uint64_t _RecognitionCompletedCallBack(uint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4) {
    return [a4 _handleRecognitionCompleted:result withResults:a2 error:a3];
  }
  return result;
}

uint64_t _RecognitionStartedCallBack(uint64_t result, void *a2)
{
  if (a2) {
    return [a2 _handleRecognitionStarted:result];
  }
  return result;
}

uint64_t _RecognitionPreparedCallBack(uint64_t result, void *a2)
{
  if (a2) {
    return [a2 _handleRecognitionPrepared:result];
  }
  return result;
}

void _AddDataProviderToArrayFromInfo(uint64_t a1, CFStringRef theString, id *a3)
{
  CFURLRef v10 = 0;
  aClassName = 0;
  if (theString
    && a1
    && a3
    && VSRecognitionPluginStringCopyInfo(theString, &v10, (CFStringRef *)&aClassName))
  {
    int v5 = objc_msgSend(MEMORY[0x263F086E0], "bundleWithPath:", -[__CFURL path](v10, "path"));
    if (v5)
    {
      [v5 load];
      Class v6 = NSClassFromString(aClassName);
      if (v6)
      {
        uint64_t v7 = v6;
        if ([(objc_class *)v6 conformsToProtocol:&unk_26C1C7490])
        {
          if ([(objc_class *)v7 instancesRespondToSelector:sel_beginReportingChanges]&& [(objc_class *)v7 instancesRespondToSelector:sel_stopReportingChanges])
          {
            id v8 = objc_alloc_init(v7);
            id v9 = *a3;
            if (!*a3)
            {
              id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              *a3 = v9;
            }
            objc_msgSend(v9, "setObject:forKey:", v8, a1, v10);
          }
        }
      }
    }
  }
}

id VSRecognitionModelDataProviderChanged(uint64_t a1, uint64_t a2)
{
  id result = +[VSCacheUpdateListener sharedListenerIfExists];
  if (result)
  {
    return (id)[result performUpdateForModelIdentifier:a1 classIdentifier:a2];
  }
  return result;
}

CFStringRef VSCreate4CCString(unsigned int a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = bswap32(a1);
  int v8 = v2;
  if ((v2 & 0x80) != 0)
  {
    if (!__maskrune((char)v2, 0x40000uLL)) {
      goto LABEL_17;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * (char)v2 + 60) & 0x40000) == 0)
  {
    goto LABEL_17;
  }
  unsigned int v3 = (__int16)v2 >> 8;
  if ((v2 & 0x8000) != 0)
  {
    if (!__maskrune(v3, 0x40000uLL)) {
      goto LABEL_17;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v3 + 60) & 0x40000) == 0)
  {
    goto LABEL_17;
  }
  unsigned int v4 = v2 << 8 >> 24;
  if ((v2 & 0x800000) != 0)
  {
    if (!__maskrune(v4, 0x40000uLL)) {
      goto LABEL_17;
    }
LABEL_13:
    unsigned int v5 = v2 >> 24;
    if (v2 < 0)
    {
      if (!__maskrune(v5, 0x40000uLL)) {
        goto LABEL_17;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v5 + 60) & 0x40000) == 0)
    {
      goto LABEL_17;
    }
    __int16 v9 = 39;
    char __str = 39;
    return CFStringCreateWithCString(0, &__str, 0x600u);
  }
  if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v4 + 60) & 0x40000) != 0) {
    goto LABEL_13;
  }
LABEL_17:
  if (a1 + 199999 > 0x61A7E) {
    snprintf(&__str, 0x10uLL, "0x%x");
  }
  else {
    snprintf(&__str, 0x10uLL, "%d");
  }
  return CFStringCreateWithCString(0, &__str, 0x600u);
}

uint64_t VSRecognitionModelCopyResourceURLForLanguage(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFString *a5)
{
  uint64_t result = _VSRecognitionModelCopyResourceURLForLanguageString(a1, a2, a3, a4, (uint64_t)a5);
  if (!result)
  {
    uint64_t result = (uint64_t)_VSCopyLanguageCodeFromLanguageIdentifier(a5);
    if (result)
    {
      uint64_t v11 = (const void *)result;
      uint64_t v12 = _VSRecognitionModelCopyResourceURLForLanguageString(a1, a2, a3, a4, result);
      CFRelease(v11);
      return v12;
    }
  }
  return result;
}

uint64_t _VSRecognitionModelCopyResourceURLForLanguageString(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v8 = (void *)[[NSString alloc] initWithFormat:@"%@-%@", a2, a5];
  __int16 v9 = (void *)[a1 pathForResource:v8 ofType:a3 inDirectory:a4];
  if ([v9 length]) {
    uint64_t v10 = [objc_alloc(NSURL) initFileURLWithPath:v9];
  }
  else {
    uint64_t v10 = 0;
  }

  return v10;
}

CFStringRef VSRecognitionModelCopyLanguageResourceURL(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CFStringRef result = (const __CFString *)VSPreferencesCopySpokenLanguageIdentifier();
  if (result)
  {
    CFStringRef v9 = result;
    uint64_t v10 = VSRecognitionModelCopyResourceURLForLanguage(a1, a2, a3, a4, result);
    CFRelease(v9);
    return (const __CFString *)v10;
  }
  return result;
}

uint64_t VSRecognitionModelCopyResourceURL(void *a1, uint64_t a2, uint64_t a3)
{
  CFStringRef v6 = VSPreferencesCopySpokenLanguageIdentifierArray();
  if (v6)
  {
    CFStringRef v7 = v6;
    CFArrayRef v8 = CFBundleCopyLocalizationsForPreferences((CFArrayRef)[a1 localizations], (CFArrayRef)v6);
    if (v8)
    {
      CFArrayRef v9 = v8;
      if ([(__CFArray *)v8 count])
      {
        uint64_t v10 = objc_msgSend(a1, "pathForResource:ofType:inDirectory:forLocalization:", a2, a3, 0, -[__CFArray objectAtIndex:](v9, "objectAtIndex:", 0));
        if (v10) {
          uint64_t v10 = [objc_alloc(NSURL) initFileURLWithPath:v10];
        }
      }
      else
      {
        uint64_t v10 = 0;
      }

      CFRelease(v7);
      if (v10) {
        return v10;
      }
    }
    else
    {
      CFRelease(v7);
    }
  }
  uint64_t v11 = [a1 pathForResource:a2 ofType:a3 inDirectory:0];
  if (!v11) {
    return 0;
  }
  uint64_t v12 = v11;
  id v13 = objc_alloc(NSURL);
  return [v13 initFileURLWithPath:v12];
}

void sub_20CAE6B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CAE9880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20CAE9ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFAudioPowerUpdaterClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x263EF8330];
    v6[2] = (void *)3221225472;
    v6[3] = __AssistantServicesLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_2640E8AC0;
    uint64_t v8 = 0;
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    unsigned int v3 = [MEMORY[0x263F08690] currentHandler];
    unsigned int v4 = [NSString stringWithUTF8String:"void *AssistantServicesLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"VSSpeechSynthesizer.m", 47, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("AFAudioPowerUpdater");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    unsigned int v3 = [MEMORY[0x263F08690] currentHandler];
    unsigned int v5 = [NSString stringWithUTF8String:"Class getAFAudioPowerUpdaterClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"VSSpeechSynthesizer.m", 48, @"Unable to find class %s", "AFAudioPowerUpdater");

LABEL_10:
    __break(1u);
  }
  getAFAudioPowerUpdaterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AssistantServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __Block_byref_object_copy__2824(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2825(uint64_t a1)
{
}

void sub_20CAEEB68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CAF17A4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void soft_BYSetupAssistantNeedsToRun()
{
  uint64_t v4 = 0;
  unsigned int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  CFDictionaryRef v0 = (void (*)(void))getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  long long v7 = getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  if (!getBYSetupAssistantNeedsToRunSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke;
    v3[3] = &unk_2640E8AE0;
    v3[4] = &v4;
    __getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke(v3);
    CFDictionaryRef v0 = (void (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (v0)
  {
    v0();
  }
  else
  {
    uint64_t v1 = [MEMORY[0x263F08690] currentHandler];
    int v2 = [NSString stringWithUTF8String:"BOOL soft_BYSetupAssistantNeedsToRun(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"VSPreferencesInterface.m", 24, @"%s", dlerror());

    __break(1u);
  }
}

void sub_20CAF3954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v5[1] = (void *)MEMORY[0x263EF8330];
    v5[2] = (void *)3221225472;
    v5[3] = __SetupAssistantLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2640E8B00;
    uint64_t v7 = 0;
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  int v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    a1 = [MEMORY[0x263F08690] currentHandler];
    int v2 = [NSString stringWithUTF8String:"void *SetupAssistantLibrary(void)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, @"VSPreferencesInterface.m", 23, @"%s", v5[0]);

    __break(1u);
    goto LABEL_7;
  }
  unsigned int v3 = v5[0];
  if (v5[0]) {
LABEL_7:
  }
    free(v3);
  uint64_t result = dlsym(v2, "BYSetupAssistantNeedsToRun");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  getBYSetupAssistantNeedsToRunSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(a1[4] + 8) + 24);
  return result;
}

uint64_t __SetupAssistantLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_20CAF43D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20CAF5550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CAF570C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CAF5AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CAF5C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CAF5EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3218(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3219(uint64_t a1)
{
}

void sub_20CAF60CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CAF63F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CAF7778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20CAFC064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20CAFC4A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20CAFD168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void remote_VSRecognitionPrepareOrBegin(mach_port_t a1, int a2, int a3, char *src, const char *a5, uint64_t a6, int a7, uint64_t a8, double a9, int a10, char a11, char a12, char a13, unsigned char *a14)
{
  mach_msg_return_t v30;
  mach_msg_header_t rcv_name;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int v37;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t v41;
  _OWORD v42[131];
  uint64_t v43;

  v43 = *MEMORY[0x263EF8340];
  v41 = 0;
  memset(v42, 0, 432);
  v34 = 0x13000000000000;
  memset(&rcv_name, 0, sizeof(rcv_name));
  CFRange v32 = 3;
  v33 = a2;
  uint64_t v35 = a6;
  CFRange v36 = 16777472;
  CFRange v37 = a7;
  CFIndex v38 = a8;
  CFIndex v39 = 16777472;
  v40 = a10;
  v41 = *MEMORY[0x263EF80C8];
  LODWORD(v42[0]) = a3;
  uint64_t v18 = MEMORY[0x263EF89D0];
  if (MEMORY[0x263EF89D0]) {
    int v19 = mig_strncpy_zerofill((char *)v42 + 12, src, 1024);
  }
  else {
    int v19 = mig_strncpy((char *)v42 + 12, src, 1024);
  }
  DWORD1(v42[0]) = 0;
  DWORD2(v42[0]) = v19;
  uint64_t v20 = (v19 + 3) & 0xFFFFFFFC;
  int v21 = v20 + 128;
  stat v22 = (char *)&rcv_name + v20;
  CFStringRef v23 = v22 - 1024;
  CFURLRef v24 = v22 + 100;
  if (v18) {
    int v25 = mig_strncpy_zerofill(v24, a5, 1024);
  }
  else {
    int v25 = mig_strncpy(v24, a5, 1024);
  }
  *((_DWORD *)v23 + 280) = v25;
  *((_DWORD *)v23 + 279) = 0;
  uint64_t v26 = (v25 + 3) & 0xFFFFFFFC;
  CFURLRef v27 = &v23[v26];
  *(double *)&v23[v26 + 1124] = a9;
  *((_DWORD *)v27 + 283) = a7;
  *((_DWORD *)v27 + 284) = a10;
  v27[1140] = a11;
  v27[1143] = 0;
  *(_WORD *)&v23[v26 + 1141] = 0;
  v27[1144] = a12;
  v27[1147] = 0;
  *(_WORD *)&v23[v26 + 1145] = 0;
  v27[1148] = a13;
  v27[1151] = 0;
  mach_msg_size_t v28 = v21 + v26;
  *(_WORD *)&v23[v26 + 1149] = 0;
  mach_port_t reply_port = mig_get_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(void *)&rcv_name.msgh_voucher_port = 0xF54BE00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&rcv_name);
    mach_port_t reply_port = rcv_name.msgh_local_port;
  }
  CFIndex v30 = mach_msg(&rcv_name, 3, v28, 0x30u, reply_port, 0, 0);
  if ((v30 - 268435458) <= 0xE && ((1 << (v30 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name.msgh_local_port);
  }
  else if (v30)
  {
    mig_dealloc_reply_port(rcv_name.msgh_local_port);
  }
  else if (rcv_name.msgh_id != 1004834 {
         || (rcv_name.msgh_bits & 0x80000000) != 0
  }
         || rcv_name.msgh_size != 40
         || rcv_name.msgh_remote_port
         || v34)
  {
    mach_msg_destroy(&rcv_name);
  }
  else
  {
    *a14 = BYTE4(v34);
  }
}

void _XPostNotification(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 1) {
    goto LABEL_3;
  }
  unsigned int v5 = *(_DWORD *)(a1 + 4);
  if (v5 < 0x40 || v5 > 0x440) {
    goto LABEL_3;
  }
  if (*(unsigned char *)(a1 + 39) != 1) {
    goto LABEL_16;
  }
  unsigned int v6 = *(_DWORD *)(a1 + 56);
  if (v6 > 0x400)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
    return;
  }
  int v3 = -304;
  if (v5 - 64 < v6) {
    goto LABEL_3;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v5 != v7 + 64) {
    goto LABEL_3;
  }
  unsigned int v8 = *(_DWORD *)(a1 + 40);
  if (v8 != *(_DWORD *)(a1 + v7 + 60))
  {
LABEL_16:
    int v3 = -300;
    goto LABEL_3;
  }
  uint64_t v9 = 1084;
  if (*(unsigned int *)(a1 + 4) < 0x43CuLL) {
    uint64_t v9 = *(unsigned int *)(a1 + 4);
  }
  if (!memchr((void *)(a1 + 60), 0, v9 - 60)) {
    goto LABEL_2;
  }
  client_VSPostNotification((const char *)(a1 + 60), *(const UInt8 **)(a1 + 28), v8);
  *(_DWORD *)(a2 + 32) = 0;
  mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(void *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 40) = 0;
}

void (*VoiceServicesClient_server_routine(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 1004734) {
    return _XPostNotification;
  }
  else {
    return 0;
  }
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

OSStatus AudioConverterDispose(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x270EE2090](inAudioConverter);
}

OSStatus AudioConverterFillComplexBuffer(AudioConverterRef inAudioConverter, AudioConverterComplexInputDataProc inInputDataProc, void *inInputDataProcUserData, UInt32 *ioOutputDataPacketSize, AudioBufferList *outOutputData, AudioStreamPacketDescription *outPacketDescription)
{
  return MEMORY[0x270EE2098](inAudioConverter, inInputDataProc, inInputDataProcUserData, ioOutputDataPacketSize, outOutputData, outPacketDescription);
}

OSStatus AudioConverterNew(const AudioStreamBasicDescription *inSourceFormat, const AudioStreamBasicDescription *inDestinationFormat, AudioConverterRef *outAudioConverter)
{
  return MEMORY[0x270EE20B8](inSourceFormat, inDestinationFormat, outAudioConverter);
}

OSStatus AudioConverterReset(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x270EE20C0](inAudioConverter);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
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

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFMutableAttributedStringRef CFAttributedStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableAttributedStringRef)MEMORY[0x270EE43C0](alloc, maxLength);
}

CFTypeRef CFAttributedStringGetAttribute(CFAttributedStringRef aStr, CFIndex loc, CFStringRef attrName, CFRange *effectiveRange)
{
  return (CFTypeRef)MEMORY[0x270EE43E0](aStr, loc, attrName, effectiveRange);
}

CFTypeRef CFAttributedStringGetAttributeAndLongestEffectiveRange(CFAttributedStringRef aStr, CFIndex loc, CFStringRef attrName, CFRange inRange, CFRange *longestEffectiveRange)
{
  return (CFTypeRef)MEMORY[0x270EE43E8](aStr, loc, attrName, inRange.location, inRange.length, longestEffectiveRange);
}

CFDictionaryRef CFAttributedStringGetAttributesAndLongestEffectiveRange(CFAttributedStringRef aStr, CFIndex loc, CFRange inRange, CFRange *longestEffectiveRange)
{
  return (CFDictionaryRef)MEMORY[0x270EE43F8](aStr, loc, inRange.location, inRange.length, longestEffectiveRange);
}

CFIndex CFAttributedStringGetLength(CFAttributedStringRef aStr)
{
  return MEMORY[0x270EE4400](aStr);
}

CFStringRef CFAttributedStringGetString(CFAttributedStringRef aStr)
{
  return (CFStringRef)MEMORY[0x270EE4408](aStr);
}

void CFAttributedStringReplaceString(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef replacement)
{
}

void CFAttributedStringSetAttributes(CFMutableAttributedStringRef aStr, CFRange range, CFDictionaryRef replacement, Boolean clearOtherAttributes)
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

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x270EE4540](bundle);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x270EE4570](locArray, prefArray);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x270EE4578](bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x270EE4590](bundle, resourceName, resourceType, subDirName);
}

CFURLRef CFBundleCopyResourceURLForLocalization(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName, CFStringRef localizationName)
{
  return (CFURLRef)MEMORY[0x270EE4598](bundle, resourceName, resourceType, subDirName, localizationName);
}

CFArrayRef CFBundleCopyResourceURLsOfType(CFBundleRef bundle, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFArrayRef)MEMORY[0x270EE45A8](bundle, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x270EE45C8](bundleID);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4750](theSetIdentifier);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x270EE4788](cf);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x270EE4798]();
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

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x270EE4858](theDate, otherDate, context);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x270EE4870](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x270EE4890](allocator, formatter, at);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
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

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x270EE49C8](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x270EE4A20](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x270EE4A48](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x270EE4A60]();
}

CFArrayRef CFLocaleCopyPreferredLanguages(void)
{
  return (CFArrayRef)MEMORY[0x270EE4A78]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x270EE4A80](allocator, localeIdentifier);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x270EE4AD0](locale, key);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x270EE4AF0](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x270EE4B00](port);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

void CFMachPortSetInvalidationCallBack(CFMachPortRef port, CFMachPortInvalidationCallBack callout)
{
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B98]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D48](allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x270EE4D60](propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFReadStreamRef)MEMORY[0x270EE4D88](alloc, bytes, length, bytesDeallocator);
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

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4EE0](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x270EE4F48](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x270EE4F70](theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
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

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5058](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
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

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x270EE5108](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x270EE5148](theString, stringToFind, compareOptions);
  result.CFIndex length = v4;
  result.CFIndex location = v3;
  return result;
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5158](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
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

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE51B8](string, buffer, maxBufLen);
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

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x270EE5278](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x270EE5290](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x270EE52A0](tokenizer);
  result.CFIndex length = v2;
  result.CFIndex location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x270EE5320](relativeURL);
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

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE5390](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyDeletingPathExtension(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x270EE53A8](allocator, url);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE5430](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5440](anURL);
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x270EE5450](anURL);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x270EE5528](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x270EE5530](alloc, bufferAllocator);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x270EE5538](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x270EE5558](stream);
}

CFIndex CFWriteStreamWrite(CFWriteStreamRef stream, const UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x270EE5590](stream, buffer, bufferLength);
}

uint64_t CPCreateMIGServerSourceWithContext()
{
  return MEMORY[0x270F0CD28]();
}

uint64_t CPGetContextForCalloutCurrentMIGServerSource()
{
  return MEMORY[0x270F0CD48]();
}

uint64_t MAMigrateAssets()
{
  return MEMORY[0x270F4A8F8]();
}

uint64_t MAStringForMACancelDownloadResult()
{
  return MEMORY[0x270F4A928]();
}

uint64_t MAStringForMADownloadResult()
{
  return MEMORY[0x270F4A930]();
}

uint64_t MAStringForMAOperationResult()
{
  return MEMORY[0x270F4A938]();
}

uint64_t MAStringForMAPurgeResult()
{
  return MEMORY[0x270F4A940]();
}

uint64_t MAStringForMAQueryResult()
{
  return MEMORY[0x270F4A948]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPreferencesWriteManagedDomainForUser()
{
  return MEMORY[0x270EE56B8]();
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

uint64_t Observable::remove_observer()
{
  return MEMORY[0x270F71E18]();
}

uint64_t Observable::on_event()
{
  return MEMORY[0x270F71E20]();
}

uint64_t NeuralTTSUtils::compile_ane_model(NeuralTTSUtils *this, const char *a2)
{
  return MEMORY[0x270F71E38](this, a2);
}

uint64_t NeuralTTSUtils::has_ota_ane_model(NeuralTTSUtils *this, const char *a2)
{
  return MEMORY[0x270F71E40](this, a2);
}

uint64_t NeuralTTSUtils::is_ane_model_compiled(NeuralTTSUtils *this, const char *a2)
{
  return MEMORY[0x270F71E50](this, a2);
}

uint64_t NeuralTTSUtils::is_neural_voice_ready(NeuralTTSUtils *this, const char *a2)
{
  return MEMORY[0x270F71E58](this, a2);
}

uint64_t NeuralTTSUtils::should_use_neural_voice(NeuralTTSUtils *this, const char *a2)
{
  return MEMORY[0x270F71E68](this, a2);
}

uint64_t NeuralTTSUtils::has_compact_neural_fallback(NeuralTTSUtils *this, const char *a2)
{
  return MEMORY[0x270F71E70](this, a2);
}

uint64_t NeuralTTSUtils::check_thermal_critical_conditions(NeuralTTSUtils *this)
{
  return MEMORY[0x270F71E78](this);
}

uint64_t TTSSynthesizer::initialize()
{
  return MEMORY[0x270F71E88]();
}

uint64_t TTSSynthesizer::get_event_bus(TTSSynthesizer *this)
{
  return MEMORY[0x270F71E90](this);
}

uint64_t TTSSynthesizer::stop_synthesis(TTSSynthesizer *this)
{
  return MEMORY[0x270F71EA8](this);
}

uint64_t TTSSynthesizer::set_neural_cost()
{
  return MEMORY[0x270F71EB0]();
}

uint64_t TTSSynthesizer::unload_resource()
{
  return MEMORY[0x270F71EC0]();
}

uint64_t TTSSynthesizer::load_voice_resource()
{
  return MEMORY[0x270F71ED8]();
}

uint64_t TTSSynthesizer::set_global_property()
{
  return MEMORY[0x270F71EE0]();
}

uint64_t TTSSynthesizer::has_phatic_responses()
{
  return MEMORY[0x270F71EE8]();
}

uint64_t TTSSynthesizer::set_censor_plaintext(TTSSynthesizer *this)
{
  return MEMORY[0x270F71EF0](this);
}

uint64_t TTSSynthesizer::get_voice_description(TTSSynthesizer *this)
{
  return MEMORY[0x270F71F00](this);
}

uint64_t TTSSynthesizer::get_engine_description(TTSSynthesizer *this)
{
  return MEMORY[0x270F71F08](this);
}

uint64_t TTSSynthesizer::synthesize_text_with_markers_async()
{
  return MEMORY[0x270F71F20]();
}

uint64_t TTSSynthesizer::preheat(TTSSynthesizer *this)
{
  return MEMORY[0x270F71F28](this);
}

void TTSSynthesizer::TTSSynthesizer(TTSSynthesizer *this)
{
}

void TTSSynthesizer::~TTSSynthesizer(TTSSynthesizer *this)
{
}

uint64_t SiriTTS::TextToPhoneme::text_to_phoneme()
{
  return MEMORY[0x270F71F50]();
}

uint64_t SiriTTS::TextToPhoneme::TextToPhoneme()
{
  return MEMORY[0x270F71F58]();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
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

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x270ED8770](*(void *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B30](*(void *)&a1, a2);
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x270EDA1B0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x270EDA200](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x270EDA228](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info, *(void *)&port_infoCnt);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x270EDA240](*(void *)&task, *(void *)&name, ptype);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x270EDA4E8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x270EDA500](dest, src, *(void *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x270EDA508](dest, src, *(void *)&len);
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
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

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

uint64_t random(void)
{
  return MEMORY[0x270EDB0E8]();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

void srandom(unsigned int a1)
{
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB770](a1, a2);
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x270EDB850](*(void *)&task, *(void *)&which_port, special_port);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x270EDBAF0](msg);
}