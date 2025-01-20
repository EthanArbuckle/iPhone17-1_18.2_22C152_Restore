uint64_t sub_1000031FC(unsigned int a1, const void *a2, size_t a3)
{
  CFDictionaryRef v5;
  io_service_t MatchingService;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  io_object_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char outputStruct;
  uint64_t input;
  io_connect_t connect;

  connect = 0;
  input = a1;
  v5 = IOServiceMatching("AppleEffaceableStorage");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
  v13 = MatchingService;
  if (MatchingService)
  {
    v14 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
    if (v14)
    {
      v28 = v14;
      sub_100017164("storeBlastableBytes", @"Unable to open service: 0x%08x", v15, v16, v17, v18, v19, v20, v14);
    }
    else
    {
      v21 = IOConnectCallMethod(connect, 6u, &input, 1u, a2, a3, 0, 0, 0, 0);
      v28 = v21;
      if (v21) {
        sub_100017164("storeBlastableBytes", @"Can't store blastable bytes: %08x", v22, v23, v24, v25, v26, v27, v21);
      }
    }
  }
  else
  {
    sub_100017164("storeBlastableBytes", @"Can't find EffaceableStorage kext!", v7, v8, v9, v10, v11, v12, outputStruct);
    v28 = 3758097084;
  }
  if (connect) {
    IOServiceClose(connect);
  }
  if (v13) {
    IOObjectRelease(v13);
  }
  return v28;
}

uint64_t sub_100003330(unsigned int a1, void *a2, size_t *a3)
{
  io_connect_t connect = 0;
  uint64_t input = a1;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  CFDictionaryRef v5 = IOServiceMatching("AppleEffaceableStorage");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
  io_object_t v13 = MatchingService;
  if (MatchingService)
  {
    uint64_t v14 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
    if (v14)
    {
      uint64_t v28 = v14;
      sub_100017164("loadBlastableBytes", @"Unable to open service: 0x%08x", v15, v16, v17, v18, v19, v20, v14);
    }
    else
    {
      uint64_t v21 = IOConnectCallMethod(connect, 5u, &input, 1u, 0, 0, &output, &outputCnt, a2, a3);
      uint64_t v28 = v21;
      if (v21) {
        sub_100017164("loadBlastableBytes", @"Can't load blastable bytes: %08x", v22, v23, v24, v25, v26, v27, v21);
      }
    }
  }
  else
  {
    sub_100017164("loadBlastableBytes", @"Can't find EffaceableStorage kext!", v7, v8, v9, v10, v11, v12, outputStruct);
    uint64_t v28 = 3758097084;
  }
  if (connect) {
    IOServiceClose(connect);
  }
  if (v13) {
    IOObjectRelease(v13);
  }
  return v28;
}

uint64_t sub_10000346C(unsigned int a1)
{
  bzero(v33, 0x400uLL);
  size_t v32 = 1024;
  io_connect_t connect = 0;
  uint64_t input = a1;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  CFDictionaryRef v2 = IOServiceMatching("AppleEffaceableStorage");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  io_object_t v10 = MatchingService;
  if (MatchingService)
  {
    uint64_t v11 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
    if (v11)
    {
      uint64_t v18 = v11;
      sub_100017164("effaceBlastableBytes", @"Unable to open service: 0x%08x", v12, v13, v14, v15, v16, v17, v11);
    }
    else
    {
      uint64_t v18 = IOConnectCallMethod(connect, 5u, &input, 1u, 0, 0, &output, &outputCnt, v33, &v32);
      if (!v18)
      {
        uint64_t v19 = IOConnectCallMethod(connect, 7u, &input, 1u, 0, 0, &output, &outputCnt, 0, 0);
        uint64_t v18 = v19;
        if (v19) {
          sub_100017164("effaceBlastableBytes", @"efface failed: 0x%x", v20, v21, v22, v23, v24, v25, v19);
        }
      }
    }
  }
  else
  {
    sub_100017164("effaceBlastableBytes", @"Can't find EffaceableStorage kext!", v4, v5, v6, v7, v8, v9, outputStruct);
    uint64_t v18 = 3758097084;
  }
  if (connect) {
    IOServiceClose(connect);
  }
  if (v10) {
    IOObjectRelease(v10);
  }
  return v18;
}

id sub_1000036A8(uint64_t a1)
{
  if ([+[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/root/Library/Preferences/spaced_repetition.plist"])
  {
    [+[NSFileManager defaultManager] moveItemAtPath:@"/private/var/root/Library/Preferences/spaced_repetition.plist" toPath:@"/private/var/root/Library/Preferences/com.apple.spaced_repetition.plist" error:0];
  }
  id result = [objc_alloc(*(Class *)(a1 + 32)) initialize];
  qword_100039888 = (uint64_t)result;
  return result;
}

void sub_100003DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100003F28(uint64_t a1)
{
  NSLog(@"setting next verification timer[%d] for %lu seconds", ++dword_100039854, *(void *)(a1 + 40));
  CFDictionaryRef v2 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(void *)(a1 + 32), "repetitionPeriodTimer:", +[NSNumber numberWithInt:dword_100039854], 0, (double)*(uint64_t *)(a1 + 40));
  v3 = +[NSRunLoop currentRunLoop];

  return [(NSRunLoop *)v3 addTimer:v2 forMode:NSRunLoopCommonModes];
}

uint64_t sub_100004190()
{
  if (sub_100010F50()
    || ![+[SpacedRepetitionManager sharedInstance] beginNewRepetitionPeriod])
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_1000041D0()
{
  if (sub_100010F50()
    || ![+[SpacedRepetitionManager sharedInstance] continueRepetitionPeriod])
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 0;
  }
}

void sub_100004210(uint64_t a1, uint64_t a2)
{
}

void sub_100004220(uint64_t a1)
{
}

Class sub_10000422C(uint64_t a1)
{
  sub_100004284();
  Class result = objc_getClass("BKDeviceManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    sub_100021184();
  }
  qword_100039890 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

void sub_100004284()
{
  v0[0] = 0;
  if (!qword_100039898)
  {
    v0[1] = _NSConcreteStackBlock;
    v0[2] = (void *)3221225472;
    v0[3] = sub_100004378;
    v0[4] = &unk_100030CB0;
    v0[5] = v0;
    long long v1 = off_100030C98;
    uint64_t v2 = 0;
    qword_100039898 = _sl_dlopen();
  }
  if (!qword_100039898) {
    sub_1000211EC(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t sub_100004378()
{
  uint64_t result = _sl_dlopen();
  qword_100039898 = result;
  return result;
}

Class sub_1000043EC(uint64_t a1)
{
  sub_100004284();
  Class result = objc_getClass("BKDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    sub_100021254();
  }
  qword_1000398A0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

CFDictionaryRef sub_100004444()
{
  CFDictionaryRef v15 = 0;
  snprintf(__str, 0x401uLL, "%s%s", "/private/var/", "keybags");
  CFDictionaryRef v6 = 0;
  if (!sub_100004540(__str, "systembag", (CFPropertyListRef *)&v15))
  {
    CFDictionaryRef v6 = v15;
    if (v15)
    {
      if (!sub_1000106EC(v15, @"KeyBagKeys"))
      {
        sub_100017164("KBLoadSystemKeyBag", @"Keybag %s doesn't actually contain keys", v8, v9, v10, v11, v12, v13, (char)__str);
        CFRelease(v6);
        return 0;
      }
    }
    else
    {
      sub_100017164("KBLoadSystemKeyBag", @" Empty Keybag returned from KBLoadLoadKeyBagFile", v0, v1, v2, v3, v4, v5, v14);
    }
  }
  return v6;
}

uint64_t sub_100004540(const char *a1, const char *a2, CFPropertyListRef *a3)
{
  snprintf((char *)__str, 0x401uLL, "%s/%s.kb", a1, a2);
  CFDictionaryRef v4 = (const __CFDictionary *)sub_100010D10((const char *)__str);
  CFDictionaryRef v5 = v4;
  if (v4) {
    BOOL v6 = CFDictionaryGetValue(v4, @"KeybagxART") != 0;
  }
  else {
    BOOL v6 = 0;
  }
  int v7 = sub_100007F40(":/defaults", @"no-effaceable-storage");
  if (v6 || v7)
  {
    *a3 = 0;
    uint64_t v16 = sub_100010D10((const char *)__str);
    *a3 = v16;
    if (!v16)
    {
      snprintf(v26, 0x401uLL, "%s.writing", (const char *)__str);
      uint64_t v17 = sub_100010D10(v26);
      *a3 = v17;
      if (!v17)
      {
        uint64_t v15 = 4294967289;
        sub_100017164("KBLoadLoadKeyBagFile", @"Unable to load keybag with No Crypto: %d", v18, v19, v20, v21, v22, v23, -7);
        if (!v5) {
          return v15;
        }
        goto LABEL_13;
      }
    }
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v8 = sub_1000087EC(__str, a3);
    uint64_t v15 = v8;
    if (v8)
    {
      sub_100017164("KBLoadLoadKeyBagFile", @"Unable to load keybag with Crypto: %d", v9, v10, v11, v12, v13, v14, v8);
      if (!v5) {
        return v15;
      }
      goto LABEL_13;
    }
  }
  if (v5) {
LABEL_13:
  }
    CFRelease(v5);
  return v15;
}

CFMutableDictionaryRef sub_1000046AC(uint64_t a1)
{
  CFDictionaryRef v16 = 0;
  snprintf(__str, 0x401uLL, "%s%s", "/private/var/", "keybags");
  int v2 = sub_100004540(__str, "userbag", (CFPropertyListRef *)&v16);
  CFDictionaryRef v3 = v16;
  if (!v2 && v16)
  {
    CFStringRef v4 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", a1);
    if (!v4)
    {
      CFMutableDictionaryRef MutableCopy = 0;
      goto LABEL_10;
    }
    CFDictionaryRef v5 = (const __CFDictionary *)v4;
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v3, v4);
    if (Value)
    {
      CFDictionaryRef v7 = Value;
      if (sub_1000106EC(Value, @"KeyBagKeys"))
      {
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v7);
LABEL_9:
        CFRelease(v3);
        CFDictionaryRef v3 = v5;
LABEL_10:
        CFRelease(v3);
        return MutableCopy;
      }
      sub_100017164("KBLoadUserKeybag", @"Keybag %s doesn't actually contain keys", v8, v9, v10, v11, v12, v13, (char)__str);
    }
    CFMutableDictionaryRef MutableCopy = 0;
    goto LABEL_9;
  }
  CFMutableDictionaryRef MutableCopy = 0;
  CFMutableDictionaryRef result = 0;
  if (v16) {
    goto LABEL_10;
  }
  return result;
}

uint64_t sub_100004814(const void *a1)
{
  snprintf(__str, 0x401uLL, "%s/%s", "/private/var/", "keybags");
  int v2 = sub_100004444();
  if (!v2) {
    return 0;
  }
  CFDictionaryRef v3 = v2;
  if (a1) {
    CFDictionarySetValue(v2, @"BackupKeyBagKeys", a1);
  }
  else {
    CFDictionaryRemoveValue(v2, @"BackupKeyBagKeys");
  }
  if (sub_100004900(v3, __str, 1111574321, "systembag", 0, v4, v5, v6)) {
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v7 = 0;
  }
  CFRelease(v3);
  return v7;
}

uint64_t sub_100004900(const __CFDictionary *a1, const char *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a5;
  unsigned int v10 = a3;
  unsigned int v13 = sub_100008E38(-1, a1, a3, (uint64_t)a4, a5, a6, a7, a8);
  CFDictionarySetValue(a1, @"KeyBagVersion", @"1");
  if (v13) {
    CFDictionarySetValue(a1, @"KeybagxART", @"1");
  }
  if (mkdir(a2, 0x1C0u) && *__error() != 17)
  {
    v40 = __error();
    strerror(*v40);
    sub_100017164("KBSaveKeyBag", @"Can't create %s: %s", v41, v42, v43, v44, v45, v46, (char)a2);
    return 0xFFFFFFFFLL;
  }
  snprintf((char *)__str, 0x401uLL, "%s/%s.kb", a2, a4);
  if (sub_100007F40(":/defaults", @"no-effaceable-storage")) {
    char v14 = 1;
  }
  else {
    char v14 = v13;
  }
  if (v14)
  {
    if (v13 && !sub_100007F40(":/defaults", @"no-effaceable-storage")) {
      sub_10000346C(0x42414731u);
    }
    bzero(&__from, 0x401uLL);
    uint64_t v15 = 0xFFFFFFFFLL;
    int v192 = -1;
    snprintf((char *)&__from, 0x401uLL, "%s.writing", (const char *)__str);
    if (!sub_100010A8C(a1, (const char *)&__from, &v192))
    {
      if (renamex_np((const char *)&__from, (const char *)__str, 2u) && (__error(), rename(&__from, __str, v16), v17))
      {
        v171 = __error();
        strerror(*v171);
        sub_100017164("KBSecureSaveObjectNoCrypto", @"could not rename %s to %s: %s (%d)", v172, v173, v174, v175, v176, v177, (char)&__from);
      }
      else if (fcntl(v192, 51))
      {
        v154 = __error();
        strerror(*v154);
        sub_100017164("KBSecureSaveObjectNoCrypto", @"Unable to fsync %s: %s", v155, v156, v157, v158, v159, v160, (char)&__from);
      }
      else
      {
        if (unlink((const char *)&__from))
        {
          uint64_t v18 = __error();
          char v19 = strerror(*v18);
          sub_100017164("KBSecureSaveObjectNoCrypto", @"unlink failed: %s", v20, v21, v22, v23, v24, v25, v19);
        }
        uint64_t v15 = 0;
      }
    }
    if (v192 != -1 && close(v192))
    {
      char v26 = v192;
      uint64_t v27 = __error();
      strerror(*v27);
      sub_100017164("KBSecureSaveObjectNoCrypto", @"failed to close(%d): %s", v28, v29, v30, v31, v32, v33, v26);
    }
    return v15;
  }
  size_t dataOutMoved = 0;
  CCCryptorRef cryptorRef = 0;
  size_t v183 = 52;
  memset(v190, 0, sizeof(v190));
  int v191 = 0;
  if (!v8)
  {
    if (SecRandomCopyBytes(kSecRandomDefault, 0x20uLL, (char *)&v190[1] + 4))
    {
      CFStringRef v179 = @"Can't create key";
    }
    else
    {
      if (!SecRandomCopyBytes(kSecRandomDefault, 0x10uLL, (char *)v190 + 4))
      {
LABEL_28:
        CFDataRef v53 = CFDataCreate(0, (const UInt8 *)&v190[1] + 4, 32);
        if (v53)
        {
          CFDataRef v60 = v53;
          CFDataRef v61 = CFDataCreate(0, (const UInt8 *)v190 + 4, 16);
          if (v61)
          {
            CFDataRef v68 = v61;
            CFDataRef v69 = (const __CFData *)sub_10001087C(a1);
            if (!v69)
            {
              sub_100017164("KBSecureSaveObjectWithCrypto", @"Can't serialize object", v70, v71, v72, v73, v74, v75, v180);
              v93 = 0;
              uint64_t v15 = 4294967291;
LABEL_59:
              CFRelease(v60);
              CFRelease(v68);
              if (v93) {
                CFRelease(v93);
              }
              goto LABEL_61;
            }
            CFDataRef v76 = v69;
            CCCryptorStatus v77 = CCCryptorCreate(0, 0, 1u, (char *)&v190[1] + 4, 0x20uLL, (char *)v190 + 4, &cryptorRef);
            if (v77)
            {
              sub_100017164("KBSecureSaveObjectWithCrypto", @"Can't create cryptor: %d", v78, v79, v80, v81, v82, v83, v77);
              v93 = 0;
            }
            else
            {
              size_t Length = CFDataGetLength(v76);
              Outputsize_t Length = CCCryptorGetOutputLength(cryptorRef, Length, 1);
              Mutable = CFDataCreateMutable(0, OutputLength);
              v93 = Mutable;
              if (!Mutable)
              {
                v161 = "KBSecureSaveObjectWithCrypto";
                CFStringRef v162 = @"Can't create crypt buffer";
LABEL_74:
                sub_100017164(v161, v162, v87, v88, v89, v90, v91, v92, v180);
                uint64_t v15 = 4294967291;
                goto LABEL_58;
              }
              CFDataSetLength(Mutable, OutputLength);
              v94 = cryptorRef;
              BytePtr = CFDataGetBytePtr(v76);
              MutableBytePtr = CFDataGetMutableBytePtr(v93);
              CCCryptorStatus v97 = CCCryptorUpdate(v94, BytePtr, Length, MutableBytePtr, OutputLength, &dataOutMoved);
              if (!v97)
              {
                v104 = cryptorRef;
                v105 = CFDataGetMutableBytePtr(v93);
                CCCryptorFinal(v104, &v105[dataOutMoved], OutputLength - dataOutMoved, &dataOutMoved);
                unsigned int valuePtr = v10;
                CFTypeRef cf = 0;
                int v186 = -1;
                CFMutableDictionaryRef v106 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                if (v106)
                {
                  v107 = v106;
                  CFNumberRef v108 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
                  if (!v108) {
                    goto LABEL_81;
                  }
                  CFDictionaryAddValue(v107, @"_MKBIV", v68);
                  CFDictionaryAddValue(v107, @"_MKBWIPEID", v108);
                  CFDictionaryAddValue(v107, @"_MKBPAYLOAD", v93);
                  snprintf((char *)&__from, 0x401uLL, "%s.writing", (const char *)__str);
                  if (sub_100010A8C(v107, (const char *)&__from, &v186)) {
                    goto LABEL_81;
                  }
                  if (renamex_np((const char *)&__from, (const char *)__str, 2u))
                  {
                    __error();
                    rename(&__from, __str, v109);
                    if (v110)
                    {
                      v178 = __error();
                      strerror(*v178);
                      p_from = &__from;
                      CFStringRef v170 = @"could not rename %s to %s: %s (%d)";
LABEL_80:
                      sub_100017164("KBSecureSaveObject", v170, v131, v132, v133, v134, v135, v136, (char)p_from);
                      goto LABEL_81;
                    }
                  }
                  if (fcntl(v186, 51))
                  {
                    v163 = __error();
                    strerror(*v163);
                    sub_100017164("KBSecureSaveObject", @"Unable to fsync %s: %s", v164, v165, v166, v167, v168, v169, (char)&__from);
LABEL_81:
                    uint64_t v15 = 0xFFFFFFFFLL;
LABEL_51:
                    if (v186 != -1 && close(v186))
                    {
                      char v145 = v186;
                      v146 = __error();
                      strerror(*v146);
                      sub_100017164("KBSecureSaveObject", @"failed to close(%d): %s", v147, v148, v149, v150, v151, v152, v145);
                    }
                    CFRelease(v107);
                    if (cf) {
                      CFRelease(cf);
                    }
                    if (v108) {
                      CFRelease(v108);
                    }
                    goto LABEL_58;
                  }
                  if ((v8 & 1) == 0)
                  {
                    unsigned int v111 = valuePtr;
                    if (CFDataGetLength(v68) != 16 || CFDataGetLength(v60) != 32)
                    {
                      sub_100017164("storeWipeIDInfo", @"trying to store invalid iv or secret", v112, v113, v114, v115, v116, v117, (char)p_from);
                      goto LABEL_46;
                    }
                    memset(v194, 0, 32);
                    long long v193 = 0u;
                    int v192 = v111;
                    v196.location = 0;
                    v196.length = 16;
                    CFDataGetBytes(v68, v196, (UInt8 *)&v193);
                    v197.location = 0;
                    v197.length = 32;
                    CFDataGetBytes(v60, v197, v194);
                    int v118 = sub_1000031FC(v111, &v192, 0x34uLL);
                    if (v118)
                    {
                      sub_100017164("storeWipeIDInfo", @"Unable to save wipe info: %08x", v119, v120, v121, v122, v123, v124, v118);
LABEL_46:
                      sub_100017164("KBSecureSaveObject", @"Oh no! Can't save wipe ID", v125, v126, v127, v128, v129, v130, v182);
                    }
                  }
                  if (!sub_1000087EC(__str, &cf))
                  {
                    if (unlink((const char *)&__from))
                    {
                      v137 = __error();
                      char v138 = strerror(*v137);
                      sub_100017164("KBSecureSaveObject", @"unlink failed: %s", v139, v140, v141, v142, v143, v144, v138);
                    }
                    uint64_t v15 = 0;
                    goto LABEL_51;
                  }
                  CFStringRef v170 = @"failed to validate newly created bag -- should never happen";
                  goto LABEL_80;
                }
                v161 = "KBSecureSaveObject";
                CFStringRef v162 = @"Can't create dict";
                goto LABEL_74;
              }
              sub_100017164("KBSecureSaveObjectWithCrypto", @"Can't encrypt: %d", v98, v99, v100, v101, v102, v103, v97);
            }
            uint64_t v15 = 4294967289;
LABEL_58:
            CFRelease(v76);
            goto LABEL_59;
          }
          sub_100017164("KBSecureSaveObjectWithCrypto", @"Can't create iv data", v62, v63, v64, v65, v66, v67, v180);
          CFRelease(v60);
        }
        else
        {
          sub_100017164("KBSecureSaveObjectWithCrypto", @"Can't create key data", v54, v55, v56, v57, v58, v59, v180);
        }
        uint64_t v15 = 4294967291;
        goto LABEL_61;
      }
      CFStringRef v179 = @"Can't create IV";
    }
    sub_100017164("KBSecureSaveObjectWithCrypto", v179, v47, v48, v49, v50, v51, v52, v180);
    goto LABEL_85;
  }
  if (!sub_100003330(v10, v190, &v183)) {
    goto LABEL_28;
  }
  sub_100017164("KBSecureSaveObjectWithCrypto", @"Unable to load wipe info:%08x", v34, v35, v36, v37, v38, v39, v10);
LABEL_85:
  uint64_t v15 = 0xFFFFFFFFLL;
LABEL_61:
  if (cryptorRef) {
    CCCryptorRelease(cryptorRef);
  }
  return v15;
}

uint64_t sub_10000514C(int a1, const char *a2, const void *a3, int a4, uint64_t a5)
{
  if (sub_1000053A0() && a1) {
    return 0;
  }
  if (a5) {
    CFStringRef v16 = @"Saving SystemBag with NO EFFACEABLE ROLL";
  }
  else {
    CFStringRef v16 = @"Saving SystemBag with EFFACEABLE ROLL";
  }
  sub_100017164("KBSaveSystemBagHandle", v16, v10, v11, v12, v13, v14, v15, v38);
  int v17 = sub_1000053A0();
  if (a1 || !v17)
  {
    v41[0] = 0;
    *(_DWORD *)bytes = 0;
    if (!aks_save_bag())
    {
      CFDataRef v26 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v41[0], *(int *)bytes, kCFAllocatorDefault);
      if (v26)
      {
        CFDataRef v25 = v26;
        goto LABEL_14;
      }
    }
    return 0xFFFFFFFFLL;
  }
  *(_DWORD *)bytes = 1752065072;
  LODWORD(v41[0]) = -1;
  if (aks_load_bag()) {
    return 0xFFFFFFFFLL;
  }
  aks_unload_bag();
  CFDataRef v18 = CFDataCreate(kCFAllocatorDefault, bytes, 4);
  if (!v18) {
    return 0xFFFFFFFFLL;
  }
  CFDataRef v25 = v18;
  sub_100017164("KBSaveSystemBagHandle", @"Saving handle 0 with the magic handle", v19, v20, v21, v22, v23, v24, v39);
LABEL_14:
  uint64_t v27 = sub_100010E70();
  if (v27)
  {
    uint64_t v28 = v27;
    CFDictionaryAddValue(v27, @"KeyBagKeys", v25);
    if (a3) {
      CFDictionaryAddValue(v28, @"OpaqueStuff", a3);
    }
    if (a4)
    {
      CFDictionaryRef v29 = sub_100004444();
      if (v29)
      {
        CFDictionaryRef v30 = v29;
        CFDictionaryRef Value = CFDictionaryGetValue(v29, @"BackupKeyBagKeys");
        if (Value)
        {
          uint64_t v32 = Value;
          CFRetain(Value);
          CFRelease(v30);
          CFDictionarySetValue(v28, @"BackupKeyBagKeys", v32);
          CFDictionaryRef v30 = (const __CFDictionary *)v32;
        }
        CFRelease(v30);
      }
    }
    snprintf((char *)v41, 0x401uLL, "%s/%s", a2, "keybags");
    if (sub_100004900(v28, (const char *)v41, 1111574321, "systembag", a5, v33, v34, v35)) {
      uint64_t v36 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v36 = 0;
    }
    CFRelease(v28);
  }
  else
  {
    uint64_t v36 = 0xFFFFFFFFLL;
  }
  CFRelease(v25);
  return v36;
}

uint64_t sub_1000053A0()
{
  if ((byte_1000398A9 & 1) == 0)
  {
    int v0 = sub_100007F40(":/filesystems", @"e-apfs");
    size_t __len = 1023;
    bzero(__big, 0x400uLL);
    if ((byte_1000398AB & 1) == 0)
    {
      if (!sysctlbyname("kern.bootargs", __big, &__len, 0, 0) && strnstr(__big, "-apfs_shared_datavolume", __len)) {
        byte_1000398AC = 1;
      }
      byte_1000398AB = 1;
    }
    if (v0 == 1) {
      char v7 = 1;
    }
    else {
      char v7 = byte_1000398AC;
    }
    byte_1000398AA = v7;
    sub_100017164("MKBDeviceSupportsEnhancedAPFS", @"dt = %d, bootarg = %d", v1, v2, v3, v4, v5, v6, v0);
    byte_1000398A9 = 1;
  }
  return byte_1000398AA;
}

uint64_t sub_1000054C8(int a1, uint64_t a2, const void *a3, int a4)
{
  memset((char *)&theDict[1] + 4, 0, 12);
  theDict[0] = 0;
  if (sub_1000053A0()) {
    return 0;
  }
  if (a4) {
    CFStringRef v14 = @"Saving UserBag for uid %d with NO EFFACEABLE ROLL";
  }
  else {
    CFStringRef v14 = @"Saving UserBag for uid %d with EFFACEABLE ROLL";
  }
  sub_100017164("KBSaveUserBagHandle", v14, v8, v9, v10, v11, v12, v13, a2);
  snprintf(__str, 0x401uLL, "%s%s", "/private/var/", "keybags");
  uint64_t v15 = sub_100004540(__str, "userbag", (CFPropertyListRef *)theDict);
  if (!v15
    || (theDict[0] = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks)) != 0)
  {
    CFStringRef v16 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", a2);
    if (v16)
    {
      if (a1 == -1)
      {
        CFDictionaryRef v21 = theDict[0];
        CFDictionaryRemoveValue(theDict[0], v16);
        CFDataRef v18 = 0;
        uint64_t v20 = 0;
        goto LABEL_16;
      }
      if (!aks_save_bag())
      {
        CFDataRef v17 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, (const UInt8 *)theDict[2], SHIDWORD(theDict[1]), kCFAllocatorDefault);
        if (v17)
        {
          CFDataRef v18 = v17;
          Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          if (!Mutable)
          {
            CFDateRef v23 = 0;
            CFDateRef v26 = 0;
LABEL_32:
            CFRelease(v18);
LABEL_33:
            if (theDict[0])
            {
              CFRelease(theDict[0]);
              theDict[0] = 0;
            }
            if (v16) {
              CFRelease(v16);
            }
            if (v23) {
              CFRelease(v23);
            }
            if (v26) {
              CFRelease(v26);
            }
            return v15;
          }
          uint64_t v20 = Mutable;
          CFDictionarySetValue(Mutable, @"KeyBagKeys", v18);
          if (a3) {
            CFDictionarySetValue(v20, @"OpaqueStuff", a3);
          }
          CFDictionaryRef v21 = theDict[0];
          CFDictionarySetValue(theDict[0], v16, v20);
LABEL_16:
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          CFDateRef v23 = CFDateCreate(kCFAllocatorDefault, Current);
          CFDateRef Value = (const __CFDate *)CFDictionaryGetValue(v21, @"LastWipeKeyUpdateTimeStamp");
          if (Value)
          {
            CFAbsoluteTime AbsoluteTime = CFDateGetAbsoluteTime(Value);
            CFDateRef v26 = CFDateCreate(kCFAllocatorDefault, AbsoluteTime + 86400.0);
            if (CFDateCompare(v26, v23, 0) != kCFCompareLessThan)
            {
              if ((a4 & 1) == 0) {
                CFDictionarySetValue(v21, @"WipeKeyUpdatePending", kCFBooleanTrue);
              }
              goto LABEL_23;
            }
            CFDictionaryRef v30 = CFDictionaryGetValue(v21, @"WipeKeyUpdatePending");
            if (!CFEqual(v30, kCFBooleanTrue) && (a4 & 1) != 0)
            {
LABEL_23:
              uint64_t v31 = 1;
              goto LABEL_26;
            }
            CFDictionarySetValue(v21, @"LastWipeKeyUpdateTimeStamp", v23);
            CFDictionarySetValue(v21, @"WipeKeyUpdatePending", kCFBooleanFalse);
          }
          else
          {
            CFDictionarySetValue(v21, @"WipeKeyUpdatePending", kCFBooleanFalse);
            CFDictionarySetValue(v21, @"LastWipeKeyUpdateTimeStamp", v23);
            CFDateRef v26 = 0;
          }
          uint64_t v31 = 0;
LABEL_26:
          if (sub_100004900(v21, __str, 1111574322, "userbag", v31, v27, v28, v29)) {
            uint64_t v15 = v15;
          }
          else {
            uint64_t v15 = 0;
          }
          if (v20) {
            CFRelease(v20);
          }
          if (!v18) {
            goto LABEL_33;
          }
          goto LABEL_32;
        }
      }
    }
    CFDateRef v23 = 0;
    CFDateRef v26 = 0;
    goto LABEL_33;
  }
  return v15;
}

BOOL sub_100005878(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v30 = 0;
  v29[0] = 0;
  v29[1] = 0;
  CFDataRef theData = 0;
  uint64_t v27 = 0;
  char v25 = -1;
  uint64_t v28 = sub_10001E97C(65000, &v30, (uint64_t)v29, a4, a5, a6, a7, a8);
  if (v28)
  {
    unint64_t v8 = sub_10001FA8C((id *)&v28, (CFTypeRef *)&theData, (uint64_t)&v25, (uint64_t)&v27, (uint64_t)&v27 + 4);
    if (v8 == 0x900000000000)
    {
      BOOL v22 = CFDataGetLength(theData) > 10;
    }
    else
    {
      sub_100017164("seshat_supports_upgraded_jcop_kud_policy", @"getData() -> 0x%x:0x%x", v9, v10, v11, v12, v13, v14, v8);
      BOOL v22 = 0;
    }
    if (v28) {
      sub_10001EDD8((id *)&v28, v15, v16, v17, v18, v19, v20, v21, v24);
    }
  }
  else
  {
    BOOL v22 = 0;
  }
  if (theData) {
    CFRelease(theData);
  }
  return v22;
}

uint64_t sub_100005948(int a1, int a2, CFDataRef theData, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8)
{
  if (!theData)
  {
    char Length = -1;
LABEL_7:
    sub_100017164("seshat_migrate_slot_to_v2", @"Invalid args %ld", (uint64_t)theData, a4, a5, a6, (uint64_t)a7, a8, Length);
    uint64_t v19 = 28;
    goto LABEL_9;
  }
  if (CFDataGetLength(theData) != 16)
  {
    char Length = CFDataGetLength(theData);
    goto LABEL_7;
  }
  int reset_pubkey = aks_se_get_reset_pubkey();
  if (reset_pubkey)
  {
    sub_100017164("seshat_migrate_slot_to_v2", @"failed to fetch pubkey 0x%x", v11, v12, v13, v14, v15, v16, reset_pubkey);
    uint64_t v19 = 21;
  }
  else
  {
    sub_100017164("seshat_migrate_slot_to_v2", @"invalid pubkey %zu", v11, v12, v13, v14, v15, v16, 0);
    uint64_t v19 = 22;
  }
LABEL_9:
  if (a7) {
    *a7 = v19;
  }
  free(0);
  return 0xFFFFFFFFLL;
}

uint64_t sub_100005E98(uint64_t a1, uint64_t a2, unsigned int a3)
{
  char v13 = 0;
  int v12 = 0;
  sub_100020950(a2, a3, (uint64_t)&v12);
  int v3 = aks_se_set_nonce();
  uint64_t v10 = 0;
  if (v3)
  {
    sub_100017164("seshat_arm_nonce", @"failed to set nonce 0x%x", v4, v5, v6, v7, v8, v9, v3);
    return 0xFFFFFFFFLL;
  }
  return v10;
}

uint64_t sub_100005F18(uint64_t a1, CFDataRef *a2, CFDataRef *a3)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t reset_sig = aks_se_get_reset_sig();
  if (reset_sig)
  {
    uint64_t v14 = reset_sig;
    sub_100017164("seshat_get_reset_sig", @"failed to get sig %x", v6, v7, v8, v9, v10, v11, reset_sig);
    return v14;
  }
  CFDataRef v12 = CFDataCreate(0, 0, 0);
  *a2 = v12;
  if (v12 && (!a3 || (CFDataRef v13 = CFDataCreate(0, 0, 0), (*a3 = v13) != 0))) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_100006014()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  uint64_t v1 = MGCopyAnswer();
  CFBooleanRef v8 = (const __CFBoolean *)v1;
  if (v0) {
    BOOL v9 = v1 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    if (CFBooleanGetValue(v0))
    {
      if (CFBooleanGetValue(v8))
      {
        uint64_t v16 = sub_10001E788();
        goto LABEL_8;
      }
      CFStringRef v18 = @"seshat_support: cond 2 not satisfied";
    }
    else
    {
      CFStringRef v18 = @"seshat_support: cond 1 not satisfied";
    }
    sub_100017164("seshat_is_supported", v18, v10, v11, v12, v13, v14, v15, v19);
  }
  uint64_t v16 = 0;
LABEL_8:
  if ((byte_1000398A8 & 1) == 0)
  {
    sub_100017164("seshat_is_supported", @"result: %d", v2, v3, v4, v5, v6, v7, v16);
    byte_1000398A8 = 1;
  }
  if (v0) {
    CFRelease(v0);
  }
  if (v8) {
    CFRelease(v8);
  }
  return v16;
}

void sub_100006110()
{
  if (aks_se_support_in_rm_is_set())
  {
    CFStringRef v6 = @"cant fetch state";
LABEL_3:
    sub_100017164("seshat_sep_rm_init", v6, v0, v1, v2, v3, v4, v5, v30);
    return;
  }
  uint64_t v7 = sub_100006014();
  if (v7)
  {
    BOOL v15 = sub_100005878(v7, v8, v9, v10, v11, v12, v13, v14);
    char v22 = v15;
    if (v15) {
      aks_set_jcop_supports_updated_kud_policy();
    }
    sub_100017164("seshat_sep_rm_init", @"JCOP kud support: %d, %d", v16, v17, v18, v19, v20, v21, v22);
    char v23 = sub_100020578();
    sub_100017164("seshat_sep_rm_init", @"SERM support: %d", v24, v25, v26, v27, v28, v29, v23);
    if (aks_se_support_in_rm())
    {
      CFStringRef v6 = @"failed to indicate se rm support (expected on devices where feature is disabled)";
      goto LABEL_3;
    }
  }
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1000061D4(uint64_t a1, char a2)
{
  unsigned int v12 = 0;
  sub_10001EE48(&v13);
  BYTE6(v13) = ((v13 | ((unint64_t)(WORD2(v13) | (BYTE6(v13) << 16)) << 32)) & 0xFFF9FFFFFFFFFFFFLL | ((unint64_t)(a2 & 3) << 49)) >> 48;
  CFDictionaryRef v3 = sub_100011DE8();
  if (v3)
  {
    CFDictionaryRef v4 = v3;
    if (sub_100011904(v3)) {
      BYTE6(v13) = (v13 | ((unint64_t)(WORD2(v13) | (BYTE6(v13) << 16)) << 32) | 0x1000000000000) >> 48;
    }
    CFDictionaryRef v5 = sub_100011CBC(v4);
    if (v5)
    {
      CFArrayRef v6 = v5;
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 == CFArrayGetTypeID())
      {
        unsigned int v8 = sub_10000631C(v6, &v12);
        unsigned __int8 v9 = -1;
        if (v8 <= 0xFE) {
          unsigned __int8 v9 = sub_10000631C(v6, &v12);
        }
        unint64_t v10 = (v13 | ((unint64_t)(WORD2(v13) | (BYTE6(v13) << 16)) << 32)) & 0xFFFF0000FFFFFFFFLL;
        if (v12 >= 0xFF) {
          uint64_t v11 = 255;
        }
        else {
          uint64_t v11 = v12;
        }
        WORD2(v13) = (v10 | ((unint64_t)v9 << 32) | (v11 << 40)) >> 32;
        BYTE6(v13) = (v10 | ((unint64_t)v9 << 32) | (v11 << 40)) >> 48;
      }
    }
    CFRelease(v4);
  }
}

uint64_t sub_10000631C(CFArrayRef theArray, _DWORD *a2)
{
  if (!theArray) {
    return 0;
  }
  if (a2)
  {
    if (CFArrayGetCount(theArray) < 0) {
      int Count = 0;
    }
    else {
      int Count = CFArrayGetCount(theArray);
    }
    *a2 = Count;
  }
  uint64_t valuePtr = 0;
  if (CFArrayGetCount(theArray) < 1) {
    return 0;
  }
  CFIndex v5 = 0;
  LODWORD(v6) = 0;
  do
  {
    CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(theArray, v5);
    if (CFNumberGetValue(ValueAtIndex, kCFNumberSInt64Type, &valuePtr)) {
      BOOL v8 = valuePtr == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8) {
      uint64_t v6 = v6;
    }
    else {
      uint64_t v6 = (v6 + 1);
    }
    ++v5;
  }
  while (CFArrayGetCount(theArray) > v5);
  return v6;
}

void sub_1000063DC(id *a1, uint64_t a2)
{
  unsigned __int8 v21 = -18;
  uint64_t v19 = 0;
  CFDataRef theData = 0;
  char v18 = -1;
  uint64_t v17 = 0;
  if ((sub_100006014() & 1) == 0)
  {
    CFStringRef v15 = @"unsupported";
    goto LABEL_25;
  }
  if (!a1)
  {
    uint64_t v17 = sub_10001EDCC(65000, v4, v5, v6, v7, v8, v9, v10);
    if (!v17)
    {
      CFStringRef v15 = @"CreateSession() failed";
      goto LABEL_25;
    }
    a1 = (id *)&v17;
  }
  if (sub_100006664(a2, 0, 0, &v21, 0, 0)) {
    int v11 = 238;
  }
  else {
    int v11 = v21;
  }
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  if (aks_memento_get_state() || (v23 & 0x400000000) == 0)
  {
    int v12 = 238;
  }
  else
  {
    int v12 = v22;
    unsigned __int8 v21 = v22;
  }
  if (sub_10001FA8C(a1, (CFTypeRef *)&theData, (uint64_t)&v18, (uint64_t)&v19, (uint64_t)&v19 + 4) != 0x900000000000)
  {
    CFStringRef v15 = @"SeshatGetData() failed";
    goto LABEL_25;
  }
  uint64_t v13 = 0;
  while (1)
  {
    if (CFDataGetBytePtr(theData)[v13] != 238)
    {
      if (v11 == v13 || v12 == v13)
      {
        sub_100017164("KBSeshatEffaceUnusedSlots", @"not effacing slot %d thats currently referenced by handle %d, (main:%d, memento:%d)", v5, v6, v7, v8, v9, v10, v13);
        goto LABEL_19;
      }
      sub_100017164("KBSeshatEffaceUnusedSlots", @"effacing se slot %d", v5, v6, v7, v8, v9, v10, v13);
      if (sub_10001F8C8(a1, v13, (uint64_t)&v19 + 4) != 0x900000000000) {
        break;
      }
    }
LABEL_19:
    if (++v13 == 10) {
      goto LABEL_20;
    }
  }
  char v16 = v13;
  CFStringRef v15 = @"SeshatDeleteSlot() failed %d";
LABEL_25:
  sub_100017164("KBSeshatEffaceUnusedSlots", v15, v5, v6, v7, v8, v9, v10, v16);
LABEL_20:
  if (theData)
  {
    CFRelease(theData);
    CFDataRef theData = 0;
  }
  if (v17) {
    sub_10001EDD8((id *)&v17, v14, v5, v6, v7, v8, v9, v10, v16);
  }
}

uint64_t sub_1000065E4(uint64_t a1, unsigned char *a2, uint64_t a3, _DWORD *a4)
{
  return sub_100006664(a1, 0, 0, a2, a3, a4);
}

uint64_t sub_1000065FC()
{
  return 0xFFFFFFFFLL;
}

uint64_t sub_100006664(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, uint64_t a5, _DWORD *a6)
{
  if (a3) {
    uint64_t reset_token_for_memento_secret = aks_se_get_reset_token_for_memento_secret();
  }
  else {
    uint64_t reset_token_for_memento_secret = aks_se_get_reset_token();
  }
  uint64_t v17 = reset_token_for_memento_secret;
  if (reset_token_for_memento_secret)
  {
    sub_100017164("KBGetSEStuffForMementoPasscode", @"aks_se_get_reset_token(memento:%d) -> 0x%x", v11, v12, v13, v14, v15, v16, a3 != 0);
  }
  else
  {
    if (a4) {
      *a4 = 0;
    }
    if (a6) {
      *a6 = 1;
    }
    if (a5)
    {
      sub_100017164("KBGetSEStuffForMementoPasscode", @"no resetToken avaialble", v11, v12, v13, v14, v15, v16, v19);
      return 4294967283;
    }
    else
    {
      return 0;
    }
  }
  return v17;
}

uint64_t sub_10000677C(char *cStr, _DWORD *a2, char **a3)
{
  CFStringRef v5 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  io_registry_entry_t v6 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (v6)
  {
    io_object_t v13 = v6;
    CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v6, v5, 0, 0);
    if (CFProperty)
    {
      CFStringRef v21 = CFProperty;
      if (a2) {
        *a2 = 1;
      }
      if (a3)
      {
        CFTypeID v22 = CFGetTypeID(CFProperty);
        if (v22 == CFStringGetTypeID())
        {
          if (CFStringGetCString(v21, buffer, 1024, 0x8000100u)) {
            *a3 = strdup(buffer);
          }
        }
        else
        {
          CFTypeID v24 = CFGetTypeID(v21);
          if (v24 == CFDataGetTypeID())
          {
            size_t Length = CFDataGetLength((CFDataRef)v21);
            uint64_t v26 = (char *)malloc_type_calloc(1uLL, Length + 1, 0xEFD9411AuLL);
            *a3 = v26;
            if (v26)
            {
              uint64_t v27 = v26;
              BytePtr = CFDataGetBytePtr((CFDataRef)v21);
              memcpy(v27, BytePtr, Length);
            }
          }
          else
          {
            *a3 = 0;
          }
        }
      }
      CFRelease(v21);
    }
    else
    {
      sub_100017164("getNVRam", @"Could not create string for value", v15, v16, v17, v18, v19, v20, v30);
      if (a2) {
        *a2 = 0;
      }
    }
    IOObjectRelease(v13);
    uint64_t v23 = 0;
  }
  else
  {
    sub_100017164("getNVRam", @"Could not get options entry from the device tree", v7, v8, v9, v10, v11, v12, v30);
    uint64_t v23 = 0xFFFFFFFFLL;
  }
  CFRelease(v5);
  return v23;
}

uint64_t sub_100006950(char *cStr, const char *a2)
{
  kern_return_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v29;

  CFStringRef v3 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  io_registry_entry_t v4 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (v4)
  {
    io_registry_entry_t v11 = v4;
    CFStringRef v12 = CFStringCreateWithCString(0, a2, 0x8000100u);
    if (v12)
    {
      CFStringRef v19 = v12;
      uint64_t v20 = IORegistryEntrySetCFProperty(v11, v3, v12);
      if (v20)
      {
        sub_100017164("setNVRam", @"Could not save value:%08x", v21, v22, v23, v24, v25, v26, v20);
        uint64_t v27 = 0xFFFFFFFFLL;
      }
      else
      {
        uint64_t v27 = 0;
      }
      CFRelease(v19);
    }
    else
    {
      sub_100017164("setNVRam", @"Could not create string for value", v13, v14, v15, v16, v17, v18, v29);
      uint64_t v27 = 0xFFFFFFFFLL;
    }
    IOObjectRelease(v11);
  }
  else
  {
    sub_100017164("setNVRam", @"Could not get options entry from the device tree", v5, v6, v7, v8, v9, v10, v29);
    uint64_t v27 = 0xFFFFFFFFLL;
  }
  CFRelease(v3);
  return v27;
}

uint64_t sub_100006A60(const char *a1)
{
  return sub_100006950("IONVRAM-DELETE-PROPERTY", a1);
}

uint64_t sub_100006A70(int a1, BOOL *a2)
{
  if (!sub_1000053A0())
  {
    CFUUIDRef v13 = 0;
    CFUUIDRef v23 = 0;
    BOOL v24 = a1 == 0;
LABEL_14:
    uint64_t v25 = 0;
    *a2 = v24;
    goto LABEL_15;
  }
  if (!AKSIdentityGetPrimary() || aks_get_configuration()) {
    goto LABEL_21;
  }
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(0, kAKSConfigUserUUID);
  if (!Value || (CFDataRef v11 = Value, v12 = CFGetTypeID(Value), v12 != CFDataGetTypeID()) || CFDataGetLength(v11) != 16)
  {
    sub_100017164("is_user_primary", @"no user uuid in the bag %d", v5, v6, v7, v8, v9, v10, a1);
LABEL_21:
    CFUUIDRef v13 = 0;
    goto LABEL_23;
  }
  CFUUIDBytes v27 = *(CFUUIDBytes *)CFDataGetBytePtr(v11);
  CFUUIDRef v13 = CFUUIDCreateFromUUIDBytes(0, v27);
  CFDataRef v14 = (const __CFData *)CFDictionaryGetValue(0, kAKSConfigGroupUUID);
  if (v14)
  {
    CFDataRef v21 = v14;
    CFTypeID v22 = CFGetTypeID(v14);
    if (v22 == CFDataGetTypeID() && CFDataGetLength(v21) == 16)
    {
      CFUUIDBytes v28 = *(CFUUIDBytes *)CFDataGetBytePtr(v21);
      CFUUIDRef v23 = CFUUIDCreateFromUUIDBytes(0, v28);
      if (CFEqual(v23, 0)) {
        BOOL v24 = CFEqual(v13, 0) != 0;
      }
      else {
        BOOL v24 = 0;
      }
      goto LABEL_14;
    }
  }
  sub_100017164("is_user_primary", @"no group uuid in the bag %d", v15, v16, v17, v18, v19, v20, a1);
LABEL_23:
  CFUUIDRef v23 = 0;
  uint64_t v25 = 0xFFFFFFFFLL;
LABEL_15:
  if (v13) {
    CFRelease(v13);
  }
  if (v23) {
    CFRelease(v23);
  }
  return v25;
}

uint64_t sub_100006C74()
{
  int v7 = 0;
  __str = 0;
  int v0 = sub_10000677C("seshat-count", &v7, &__str);
  uint64_t v1 = __str;
  if (v0) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = __str == 0;
  }
  if (v2
    || (__endptr = 0, *__error() = 0, LODWORD(v3) = strtol(__str, &__endptr, 10), uint64_t v1 = __str, !*__str)
    || *__endptr)
  {
    uint64_t v3 = 0;
    if (v1) {
LABEL_8:
    }
      free(v1);
  }
  else
  {
    if (*__error() == 34) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = v3;
    }
    uint64_t v1 = __str;
    if (__str) {
      goto LABEL_8;
    }
  }
  return v3;
}

uint64_t sub_100006D2C(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0 && !aks_memento_get_state()) {
    aks_get_lock_state();
  }
  return 0;
}

uint64_t sub_100006D98(int a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFData *a5, uint64_t a6, const void *a7, unsigned int a8)
{
  uint64_t v15 = 0xFFFFFFFFLL;
  unsigned int v295 = -1;
  if (!aks_get_system())
  {
    v288 = a7;
    uint64_t v289 = a3;
    CFDataRef v292 = a5;
    int v294 = 0;
    aks_get_lock_state();
    unsigned int v290 = a8;
    int v16 = sub_100006D2C(v295, a8);
    BOOL v17 = 0;
    if (sub_100006014())
    {
      if (sub_100020914()) {
        BOOL v17 = !sub_100010F50();
      }
      else {
        BOOL v17 = 0;
      }
    }
    BOOL v293 = 0;
    int v24 = sub_10001FD40();
    if ((v24 & 0x20000) != 0) {
      sub_100017164("KBChangeSystemSecret", @"disabled immediate enrollment", v18, v19, v20, v21, v22, v23, v281);
    }
    if (!v17)
    {
      BOOL v40 = 0;
      goto LABEL_26;
    }
    LODWORD(v298[0]) = 0;
    CFDictionaryRef v25 = sub_100011DE8();
    CFDictionaryRef v26 = v25;
    if (v25 && sub_100011CBC(v25) && sub_100011904(v26))
    {
      sub_100017164("seshat_preflight_for_passcode_change", @"health data contains failures", v27, v28, v29, v30, v31, v32, v281);
      int v64 = -1;
    }
    else
    {
      if (!MGGetBoolAnswer() || (sub_10001FD40() & 0x800) != 0)
      {
        unsigned int v41 = sub_100006C74();
        if (v41 >= 2)
        {
          sub_100017164("seshat_preflight_for_passcode_change", @"bad user experience = %u", v42, v43, v44, v45, v46, v47, v41);
          int v64 = -1;
          if (!v26) {
            goto LABEL_25;
          }
          goto LABEL_24;
        }
      }
      else
      {
        char v33 = sub_100006C74();
        sub_100017164("seshat_preflight_for_passcode_change", @"ignoring recovery count (%d)", v34, v35, v36, v37, v38, v39, v33);
      }
      uint64_t v48 = sub_10001FDE0(1, (uint64_t)&stru_100030CF0, v298);
      sub_1000061D4(v48, 2);
      sub_100017164("seshat_preflight_for_passcode_change", @"Seshat preflight = %llx (%llx)", v49, v50, v51, v52, v53, v54, v48);
      uint64_t v310 = v48;
      sub_100013798((unsigned int *)&v310, v55, v56, v57, v58, v59, v60, v61, v282);
      int v63 = v48 != 14 && v48 != 0;
      int v64 = v63 << 31 >> 31;
      if (!v26) {
        goto LABEL_25;
      }
    }
LABEL_24:
    CFRelease(v26);
LABEL_25:
    BOOL v40 = v64 == 0;
LABEL_26:
    if (sub_100006A70(a1, &v293))
    {
      sub_100017164("KBChangeSystemSecret", @"unable to determine if handle:%d is pirmary", v65, v66, v67, v68, v69, v70, a1);
      return 0xFFFFFFFFLL;
    }
    BOOL v71 = v293;
    sub_100017164("KBChangeSystemSecret", @"handle: %d, se-support: %d, primary-user: %d, no-passcode: %d, preflight: %d, se_bound: %d, se_unenroll:%d, dis-imm-enr: %d", v65, v66, v67, v68, v69, v70, a1);
    if (!v17
      || (v292 ? (BOOL v72 = !v71) : (BOOL v72 = 1),
          !v72 ? (BOOL v73 = a6 == 0) : (BOOL v73 = 1),
          !v73 ? (BOOL v74 = v40) : (BOOL v74 = 0),
          (*(void *)&v24 & 0x20000) != 0 || ((!v74 | v16) & 1) != 0))
    {
      if (sub_100007BBC(a1, a2, v289, a4, (uint64_t)v292, a6, a7, v290))
      {
        CFStringRef v278 = @"Failed to change non-se pw";
        goto LABEL_149;
      }
      if (!a6) {
        return 0;
      }
      goto LABEL_143;
    }
    uint64_t v75 = v295;
    CFTypeRef v307 = 0;
    CFDataRef v308 = 0;
    CFDataRef v305 = 0;
    CFDataRef v306 = 0;
    uint64_t v303 = 0;
    CFDataRef v304 = 0;
    unsigned __int8 v302 = -1;
    unsigned __int8 v301 = 0;
    unsigned int v300 = -1;
    unsigned __int8 v299 = 0;
    v298[0] = 0;
    v298[1] = 0;
    int v297 = 0;
    int lock_state = aks_get_lock_state();
    BOOL v84 = (v297 & 0x2000) == 0 || lock_state != 0;
    unsigned int v286 = sub_100008E38(v75, 0, v77, v78, v79, v80, v81, v82);
    if (v286) {
      v85 = "single";
    }
    else {
      v85 = "two";
    }
    sub_100006110();
    sub_100017164("KBChangeSystemSeSecret", @"changing SE bound passcode %s phase, memento_recovery: %s", v86, v87, v88, v89, v90, v91, (char)v85);
    uint64_t v309 = sub_10001E97C(65000, &v299, (uint64_t)v298, v92, v93, v94, v95, v96);
    uint64_t v285 = (int)a6;
    if (v309)
    {
      CFDataRef v103 = sub_10001FCA4(v292);
      if (!v103)
      {
        sub_100017164("KBChangeSystemSeSecret", @"failed to derive SE passcode", v104, v105, v106, v107, v108, v109, v283);
        LODWORD(v118) = 0;
        int v250 = 0;
        uint64_t v253 = 0;
        CFTypeRef cf = 0;
        int v167 = -1;
        char v251 = 1;
        int v252 = 1;
        int v254 = 1;
LABEL_157:
        v178 = v288;
        goto LABEL_181;
      }
      uint64_t v110 = (uint64_t)v103;
      unint64_t v111 = sub_10001FA8C((id *)&v309, (CFTypeRef *)&v304, (uint64_t)&v302, (uint64_t)&v303, (uint64_t)&v303 + 4);
      unint64_t v118 = HIDWORD(v111);
      CFTypeRef cf = (CFTypeRef)v110;
      if (v111 == 0x900000000000)
      {
        unsigned int v287 = v75;
        if (v84)
        {
          BOOL v119 = 0;
          uint64_t v120 = v289;
        }
        else
        {
          uint64_t v120 = v289;
          if (v290)
          {
            uint64_t v310 = 0;
            uint64_t v311 = 0;
            if (aks_memento_get_state() || (v311 & 0x400000000) == 0)
            {
              CFStringRef v159 = @"KBGetMementoSESlot() failed";
              goto LABEL_175;
            }
            unsigned __int8 v301 = v310;
          }
          else
          {
            int v133 = sub_100006664(v287, 0, 0, &v301, 0, 0);
            if (v133)
            {
              int v167 = v133;
              CFStringRef v280 = @"KBGetSEStuff() failed";
              goto LABEL_185;
            }
          }
          BytePtr = CFDataGetBytePtr(v304);
          if (BytePtr[v301] == 238)
          {
            BOOL v119 = 0;
          }
          else
          {
            uint64_t v141 = CFDataGetBytePtr(v304);
            BOOL v119 = (v141[v301] & 0x80u) != 0;
          }
        }
        unsigned int v142 = sub_10001FD90(v304);
        int v149 = v142;
        if (v142 >= 0xA)
        {
          sub_100017164("KBChangeSystemSeSecret", @"unexpected slot %d", v143, v144, v145, v146, v147, v148, v142);
          int v250 = 0;
          int v254 = 0;
          int v167 = -1;
          uint64_t v253 = 0x400000000000000;
          char v251 = 1;
          LODWORD(v118) = 36864;
          goto LABEL_160;
        }
        if (!v84 && v119 && sub_100005E98(v287, 0, HIDWORD(v303)))
        {
          int v250 = 0;
          uint64_t v253 = 0;
          int v167 = -1000;
LABEL_187:
          char v251 = 1;
          LODWORD(v118) = 36864;
          int v252 = 1;
          int v254 = 1;
          goto LABEL_188;
        }
        if (v290)
        {
          int v151 = aks_verify_password_memento();
          if (v151)
          {
            sub_100017164("KBChangeSystemSeSecret", @"cant verify old memento passcode 0x%x", v152, v153, v154, v155, v156, v157, v151);
LABEL_176:
            int v250 = 0;
            uint64_t v253 = 0;
            int v167 = -1;
            goto LABEL_187;
          }
        }
        else
        {
          int v158 = aks_verify_password();
          if (v158)
          {
            char v283 = v158;
            CFStringRef v159 = @"cant verify old passcode 0x%x";
            goto LABEL_175;
          }
        }
        if (v84) {
          goto LABEL_79;
        }
        if (v119)
        {
          if (sub_100005F18(v287, &v306, 0))
          {
            CFStringRef v159 = @"cant fetch sig";
LABEL_175:
            sub_100017164("KBChangeSystemSeSecret", v159, v127, v128, v129, v130, v131, v132, v283);
            goto LABEL_176;
          }
          goto LABEL_79;
        }
        if (v290)
        {
          int v160 = sub_100006664(v287, v120, (int)a4, 0, (uint64_t)&v306, 0);
          if (v160)
          {
            int v167 = v160;
            sub_100017164("KBChangeSystemSeSecret", @"KBGetSEStuffForMementoPasscode() -> 0x%x", v161, v162, v163, v164, v165, v166, v160);
LABEL_186:
            int v250 = 0;
            uint64_t v253 = 0;
            goto LABEL_187;
          }
LABEL_79:
          char v169 = v301;
          if (v84)
          {
            char v169 = -18;
            CFDataRef v170 = 0;
          }
          else
          {
            CFDataRef v170 = v306;
          }
          unint64_t v171 = sub_10001F1DC((id *)&v309, v149, v169, (uint64_t)v170, (CFTypeRef *)&v305, (uint64_t)&v303 + 4);
          unint64_t v118 = HIDWORD(v171);
          if (v171 == 0x900000000000)
          {
            v178 = v288;
            if (v305)
            {
              unint64_t v179 = sub_10001F37C((id *)&v309, v149, v110, (CFTypeRef *)&v308, (uint64_t)&v303 + 4, (uint64_t)v298);
              unint64_t v118 = HIDWORD(v179);
              if (v179 == 0x900000000000)
              {
                unint64_t v186 = sub_10001F37C((id *)&v309, v149, v110, &v307, (uint64_t)&v303 + 4, (uint64_t)v298);
                unint64_t v118 = HIDWORD(v186);
                if (v186 == 0x900000000000)
                {
                  if (CFEqual(v308, v307))
                  {
                    unint64_t v199 = sub_10001F678((id *)&v309, v149, (uint64_t)v305, (uint64_t)&v303 + 4, v195, v196, v197, v198);
                    unint64_t v118 = HIDWORD(v199);
                    if (v199 == 0x900000000000)
                    {
                      if (v308)
                      {
                        CFDataGetBytePtr(v308);
                        if (v308) {
                          CFDataGetLength(v308);
                        }
                      }
                      char Length = (char)v305;
                      if (v305)
                      {
                        CFDataGetBytePtr(v305);
                        char Length = (char)v305;
                        if (v305) {
                          char Length = CFDataGetLength(v305);
                        }
                      }
                      char v207 = v286;
                      char v283 = Length;
                      int v208 = aks_change_secret_opts();
                      if (v208)
                      {
                        sub_100017164("KBChangeSystemSeSecret", @"change passcode: %x", v209, v210, v211, v212, v213, v214, v208);
                        int v250 = 0;
                        char v251 = 0;
                        uint64_t v253 = 0;
                        int v167 = -1;
                        int v252 = 1;
                        LODWORD(v118) = 36864;
                        int v254 = 1;
                        uint64_t v75 = v287;
                        goto LABEL_108;
                      }
                      if (v286)
                      {
                        uint64_t v75 = v287;
                        unsigned int v300 = v287;
                        uint64_t v221 = (int)a6;
                        if (sub_10000514C(v287, "/private/var/", v288, 1, 0)) {
                          goto LABEL_169;
                        }
                      }
                      else
                      {
                        uint64_t v221 = (int)a6;
                        uint64_t v75 = v287;
                        if (v300 == -1 || v300 == v287)
                        {
                          sub_100017164("KBChangeSystemSeSecret", @"temp handle is invalid: %d", v209, v210, v211, v212, v213, v214, v300);
                          goto LABEL_178;
                        }
                        if (sub_10000514C(v300, "/private/var/", v288, 1, 0))
                        {
LABEL_169:
                          sub_100017164("KBChangeSystemSeSecret", @"unable to save bag %d", v215, v216, v217, v218, v219, v220, v300);
LABEL_178:
                          int v250 = 0;
                          char v251 = 0;
                          uint64_t v253 = 0;
                          int v167 = -1;
                          int v252 = 1;
                          LODWORD(v118) = 36864;
LABEL_180:
                          int v254 = 1;
                          goto LABEL_181;
                        }
                        int v222 = aks_set_system_with_passcode();
                        if (v222)
                        {
                          sub_100017164("KBChangeSystemSeSecret", @"set-system failed %d", v223, v224, v225, v226, v227, v228, v222);
                          char v251 = 0;
                          uint64_t v253 = 0;
                          int v167 = -1;
                          int v250 = 1;
                          LODWORD(v118) = 36864;
                          int v252 = 1;
                          goto LABEL_180;
                        }
                      }
                      int v229 = aks_change_secret_epilogue();
                      if (!v229)
                      {
                        char v207 = v286;
                        if (v302 == 238
                          || (unint64_t v236 = sub_10001F7C8((id *)&v309, 1, v149, (uint64_t)v305, (uint64_t)&v303 + 4),
                              unint64_t v118 = HIDWORD(v236),
                              v236 == 0x900000000000))
                        {
                          uint64_t v310 = 0;
                          if (sub_100005948(v75, v149, v305, (uint64_t)&v309, (uint64_t)v292, v221, &v310, v235))
                          {
                            uint64_t v242 = v310;
                            sub_1000061D4(v310, 2);
                            unint64_t v296 = v242;
                            sub_100013798((unsigned int *)&v296, v243, v244, v245, v246, v247, v248, v249, v283);
                          }
                          int v250 = 0;
                          char v251 = 0;
                          int v252 = 0;
                          uint64_t v253 = 0;
                          int v167 = 0;
                          int v254 = 1;
                          LODWORD(v118) = 36864;
                        }
                        else
                        {
                          sub_100017164("KBChangeSystemSeSecret", @"AuthorizeUpdate() -> 0x%x:0x%x", v237, v238, v239, v240, v241, v235, v236);
                          int v250 = 0;
                          char v251 = 0;
                          int v252 = 0;
                          int v254 = 0;
                          int v167 = 0;
                          uint64_t v253 = 0xA00000000000000;
                        }
LABEL_108:
                        if (v304) {
                          CFRelease(v304);
                        }
                        uint64_t v255 = v309;
                        if (v309) {
                          char v256 = v251;
                        }
                        else {
                          char v256 = 1;
                        }
                        if ((v256 & 1) == 0)
                        {
                          sub_1000063DC((id *)&v309, v75);
                          uint64_t v255 = v309;
                        }
                        if (v255) {
                          sub_10001EDD8((id *)&v309, v150, v121, v122, v123, v124, v125, v126, v283);
                        }
                        if (v308) {
                          CFRelease(v308);
                        }
                        if (v307) {
                          CFRelease(v307);
                        }
                        if (cf) {
                          CFRelease(cf);
                        }
                        if (v306) {
                          CFRelease(v306);
                        }
                        if (v305) {
                          CFRelease(v305);
                        }
                        if (v300 == -1) {
                          char v257 = 1;
                        }
                        else {
                          char v257 = v207;
                        }
                        if ((v257 & 1) == 0) {
                          aks_unload_bag();
                        }
                        if (v250 && sub_10000514C(v75, "/private/var/", v178, 1, 1)) {
                          sub_100017164("KBChangeSystemSeSecret", @"welp, unable to persist old bag", v121, v122, v123, v124, v125, v126, v283);
                        }
                        if (((v290 | v254) & 1) == 0)
                        {
                          sub_1000208D8(v118, v150, v121, v122, v123, v124, v125, v126);
                          unint64_t v296 = ((unint64_t)(unsigned __int16)v118 << 40) | ((unint64_t)v299 << 6) | v253 | 8;
                          sub_100013A34(&v296, v258, v259, v260, v261, v262, v263, v264, v283);
                          sub_100017164("KBChangeSystemSeSecret", @"SE failed, trying soft recovery (%d)", v265, v266, v267, v268, v269, v270, v252);
                          if (v252)
                          {
                            int v271 = aks_se_recover();
                            if (!v271)
                            {
                              sub_1000063DC(0, v75);
                              if (sub_100007BBC(v75, 0, v289, (int)a4, (uint64_t)v292, v285, v178, v290))
                              {
LABEL_139:
                                CFStringRef v278 = @"Failed to change pw";
LABEL_149:
                                sub_100017164("KBChangeSystemSecret", v278, v121, v122, v123, v124, v125, v126, v283);
                                return 0xFFFFFFFFLL;
                              }
                              goto LABEL_143;
                            }
                          }
                          else
                          {
                            int v271 = aks_se_recover();
                            if (!v271)
                            {
                              sub_1000063DC(0, v75);
LABEL_143:
                              sub_100004190();
                              return 0;
                            }
                          }
                          sub_100017164("KBChangeSystemSeSecret", @"soft recovery failed 0x%x", v272, v273, v274, v275, v276, v277, v271);
                          int v167 = -1;
                        }
                        if (v167) {
                          goto LABEL_139;
                        }
                        goto LABEL_143;
                      }
                      int v167 = v229;
                      sub_100017164("KBChangeSystemSeSecret", @"aks_change_secret_epilogue() failed %x", v230, v231, v232, v233, v234, v235, v229);
                      int v250 = 0;
                      char v251 = 0;
                      uint64_t v253 = 0;
                      int v252 = 1;
                      LODWORD(v118) = 36864;
                      int v254 = 1;
LABEL_181:
                      char v207 = v286;
                      goto LABEL_108;
                    }
                    sub_100017164("KBChangeSystemSeSecret", @"resetCounter() -> 0x%x:0x%x", v200, v201, v202, v203, v204, v205, v199);
                    int v250 = 0;
                    char v251 = 0;
                    int v254 = 0;
                    int v167 = -1;
                    uint64_t v253 = 0x800000000000000;
                    goto LABEL_167;
                  }
                  sub_100017164("KBChangeSystemSeSecret", @"se-sec comparisson failed", v193, v194, v195, v196, v197, v198, v283);
                  int v250 = 0;
                  char v251 = 0;
                  int v254 = 0;
                  int v167 = -1;
                  uint64_t v253 = 0x900000000000000;
                  int v252 = 1;
                  LODWORD(v118) = 36864;
LABEL_189:
                  char v207 = v286;
                  uint64_t v75 = v287;
                  goto LABEL_108;
                }
                sub_100017164("KBChangeSystemSeSecret", @"derive2() -> 0x%x:0x%x", v187, v188, v189, v190, v191, v192, v186);
              }
              else
              {
                sub_100017164("KBChangeSystemSeSecret", @"derive() -> 0x%x:0x%x", v180, v181, v182, v183, v184, v185, v179);
              }
              int v250 = 0;
              char v251 = 0;
              int v254 = 0;
              int v167 = -1;
              uint64_t v253 = 0x700000000000000;
LABEL_167:
              int v252 = 1;
              goto LABEL_189;
            }
            sub_100017164("KBChangeSystemSeSecret", @"no reset token returned", v172, v173, v174, v175, v176, v177, v283);
            int v250 = 0;
            char v251 = 0;
            uint64_t v253 = 0;
            int v167 = -1;
            int v252 = 1;
            LODWORD(v118) = 36864;
            int v254 = 1;
            goto LABEL_189;
          }
          sub_100017164("KBChangeSystemSeSecret", @"allocateSlot() -> 0x%x:0x%x", v172, v173, v174, v175, v176, v177, v171);
          int v250 = 0;
          int v254 = 0;
          int v167 = -1;
          uint64_t v253 = 0x600000000000000;
          char v251 = 1;
LABEL_160:
          int v252 = 1;
LABEL_188:
          v178 = v288;
          goto LABEL_189;
        }
        int v168 = sub_100006664(v287, 0, 0, 0, (uint64_t)&v306, 0);
        if (!v168) {
          goto LABEL_79;
        }
        int v167 = v168;
        CFStringRef v280 = @"KBGetSEStuff() failed -- unlock required to change passcode";
LABEL_185:
        sub_100017164("KBChangeSystemSeSecret", v280, v134, v135, v136, v137, v138, v139, v283);
        goto LABEL_186;
      }
      sub_100017164("KBChangeSystemSeSecret", @"SeshatGetData() failed", v112, v113, v114, v115, v116, v117, v283);
      int v250 = 0;
      int v254 = 0;
      int v167 = -1;
      uint64_t v253 = 0x300000000000000;
    }
    else
    {
      sub_100017164("KBChangeSystemSeSecret", @"CreateSession() failed", v97, v98, v99, v100, v101, v102, v283);
      LODWORD(v118) = 0;
      int v250 = 0;
      int v254 = 0;
      CFTypeRef cf = 0;
      int v167 = -1;
      uint64_t v253 = 0x200000000000000;
    }
    char v251 = 1;
    int v252 = 1;
    goto LABEL_157;
  }
  return v15;
}

uint64_t sub_100007BBC(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const void *a7, uint64_t a8)
{
  int v65 = -1;
  unsigned int v11 = sub_100008E38(a1, 0, a3, a4, a5, a6, (uint64_t)a7, a8);
  char v18 = v11;
  uint64_t v19 = "two";
  if (v11) {
    uint64_t v19 = "single";
  }
  sub_100017164("KBChangeSystemNonSeSecret", @"changing non-SE passcode %s phase, (params:%d)", v12, v13, v14, v15, v16, v17, (char)v19);
  char v64 = 0;
  int v20 = aks_change_secret_opts();
  if (v20)
  {
    sub_100017164("KBChangeSystemNonSeSecret", @"change-secret failed %x", v21, v22, v23, v24, v25, v26, v20);
    goto LABEL_31;
  }
  if ((v18 & 1) == 0)
  {
    sub_100017164("KBChangeSystemNonSeSecret", @"temp handle is invalid: %d", v21, v22, v23, v24, v25, v26, -1);
LABEL_31:
    int v55 = 0;
    goto LABEL_32;
  }
  int v65 = a1;
  if (a1)
  {
    uint64_t v27 = sub_1000054C8(a1, a2, a7, 0);
    if (v27)
    {
      uint64_t v34 = v27;
      sub_100017164("KBChangeSystemNonSeSecret", @"unable to save bag %d", v28, v29, v30, v31, v32, v33, a1);
LABEL_15:
      int v55 = 0;
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  if (sub_10000514C(0, "/private/var/", a7, 1, 0))
  {
    sub_100017164("KBChangeSystemNonSeSecret", @"unable to save bag %d", v35, v36, v37, v38, v39, v40, a1);
    goto LABEL_31;
  }
LABEL_11:
  if ((v18 & 1) != 0 || (int v41 = aks_set_system_with_passcode()) == 0)
  {
    uint64_t v48 = aks_change_secret_epilogue();
    uint64_t v34 = v48;
    if (v48) {
      sub_100017164("KBChangeSystemNonSeSecret", @"aks_change_secret_epilogue() failed %x", v49, v50, v51, v52, v53, v54, v48);
    }
    goto LABEL_15;
  }
  sub_100017164("KBChangeSystemNonSeSecret", @"set-system failed %d", v42, v43, v44, v45, v46, v47, v41);
  int v55 = 1;
LABEL_32:
  uint64_t v34 = 0xFFFFFFFFLL;
LABEL_16:
  if (v65 == -1) {
    char v56 = 1;
  }
  else {
    char v56 = v18;
  }
  if ((v56 & 1) == 0) {
    aks_unload_bag();
  }
  if (v55)
  {
    if (!a1)
    {
      if (!sub_10000514C(0, "/private/var/", a7, 1, 1)) {
        return v34;
      }
      goto LABEL_24;
    }
    if (sub_1000054C8(a1, a2, a7, 1)) {
LABEL_24:
    }
      sub_100017164("KBChangeSystemNonSeSecret", @"welp, unable to persist old bag", v57, v58, v59, v60, v61, v62, v64);
  }
  return v34;
}

uint64_t sub_100007E5C(const __CFData *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const void *a7)
{
  if (a1)
  {
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }
  if (aks_recover_with_escrow_bag()) {
    return 0xFFFFFFFFLL;
  }
  if (sub_1000053A0()) {
    return 0;
  }

  return sub_10000514C(0, "/private/var/", a7, 1, 0);
}

uint64_t sub_100007F40(const char *a1, const __CFString *a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  size_t v4 = strlen(a1) + 13;
  uint64_t v5 = (char *)malloc_type_malloc(v4, 0x5189311FuLL);
  if (!v5) {
    return 4294967291;
  }
  uint64_t v6 = v5;
  snprintf(v5, v4, "%s%s", "IODeviceTree", a1);
  io_registry_entry_t v7 = IORegistryEntryFromPath(kIOMainPortDefault, v6);
  if (v7)
  {
    io_object_t v8 = v7;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v7, a2, kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      CFRelease(CFProperty);
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v10 = 0;
    }
    IOObjectRelease(v8);
  }
  else
  {
    uint64_t v10 = 4294967288;
  }
  free(v6);
  return v10;
}

uint64_t sub_100008028(int a1, uint64_t a2)
{
  if (a1) {
    CFDictionaryRef v4 = sub_1000046AC(-a1);
  }
  else {
    CFDictionaryRef v4 = sub_100004444();
  }
  CFDictionaryRef v11 = v4;
  if (v4)
  {
    CFDataRef Value = CFDictionaryGetValue(v4, @"OpaqueStuff");
    uint64_t v13 = Value;
    if (Value) {
      CFRetain(Value);
    }
    CFRelease(v11);
    sub_100017164("KBUpdateKeyBag", @"Got opaqueStuff from ondisk keybag", v14, v15, v16, v17, v18, v19, v29);
    if (aks_get_system())
    {
      uint64_t v27 = 0xFFFFFFFFLL;
      if (!v13) {
        return v27;
      }
      goto LABEL_13;
    }
    if (a1) {
      uint64_t v20 = sub_1000054C8(0, -a1, v13, a2);
    }
    else {
      uint64_t v20 = sub_10000514C(0, "/private/var/", v13, 1, a2);
    }
    uint64_t v27 = v20;
    sub_100017164("KBUpdateKeyBag", @"Saved new keybag for handle %d with result %d", v21, v22, v23, v24, v25, v26, a1);
    if (v13) {
LABEL_13:
    }
      CFRelease(v13);
  }
  else
  {
    sub_100017164("KBUpdateKeyBag", @"failed to open ondisk keybag, failing UpdateKeyBag", v5, v6, v7, v8, v9, v10, v29);
    return 0xFFFFFFFFLL;
  }
  return v27;
}

void sub_100008150(uint64_t a1, uint64_t a2, void *a3, void *a4, int a5)
{
  uint64_t v9 = dlopen("/System/Library/PrivateFrameworks/APFS.framework/APFS", 2);
  if (!v9)
  {
    CFStringRef v24 = @"Failed to open APFS framework";
    goto LABEL_8;
  }
  uint64_t v16 = dlsym(v9, "APFSVolumePayloadSet");
  if (!v16)
  {
    CFStringRef v24 = @"Failed to resolve gAPFSVolumePayloadSet";
LABEL_8:
    sub_100017164("KBSetCookie", v24, v10, v11, v12, v13, v14, v15, v34);
    uint64_t v16 = 0;
    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  if (a5)
  {
LABEL_4:
    int v17 = aks_copy_volume_cookie_persona();
    if (v17)
    {
      sub_100017164("KBSetCookie", @"Failed to get keybag persona Cookiefrom AKS:0x%x", v18, v19, v20, v21, v22, v23, v17);
      goto LABEL_17;
    }
    CFStringRef v26 = @"Retrieved keybag persona Cookie from AKS, setting in APFS volume";
    goto LABEL_13;
  }
LABEL_9:
  int v25 = aks_copy_volume_cookie();
  if (v25)
  {
    sub_100017164("KBSetCookie", @"Failed to get keybag Cookie from AKS:0x%x", v18, v19, v20, v21, v22, v23, v25);
    goto LABEL_17;
  }
  CFStringRef v26 = @"Retrieved keybag Cookie from AKS, setting in APFS volume";
LABEL_13:
  sub_100017164("KBSetCookie", v26, v18, v19, v20, v21, v22, v23, v34);
  if (v16)
  {
    int v27 = ((uint64_t (*)(uint64_t, void, void, void))v16)(a2, 0, 0, 0);
    if (v27) {
      sub_100017164("KBSetCookie", @"APFSVolumePayloadSet failed with %d", v28, v29, v30, v31, v32, v33, v27);
    }
    else {
      sub_100017164("KBSetCookie", @"APFSVolumePayloadSet succeeded", v28, v29, v30, v31, v32, v33, v35);
    }
  }
LABEL_17:
  if (a3)
  {
    if (a4)
    {
      *a3 = 0;
      *a4 = 0;
    }
  }
}

uint64_t sub_1000082E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  size_t size = 0;
  int v65 = 0;
  uint64_t v8 = dlopen("/System/Library/PrivateFrameworks/APFS.framework/APFS", 2);
  if (!v8)
  {
    CFStringRef v43 = @"Failed to open APFS framework";
    goto LABEL_11;
  }
  uint64_t v15 = v8;
  uint64_t v22 = dlsym(v8, "APFSVolumePayloadGet");
  if (!v22) {
    sub_100017164("KBMapVolume", @"Failed to resolve gAPFSVolumePayloadGet", v16, v17, v18, v19, v20, v21, v63);
  }
  if (!dlsym(v15, "APFSVolumePayloadSet")) {
    sub_100017164("KBMapVolume", @"Failed to resolve gAPFSVolumePayloadSet", v23, v24, v25, v26, v27, v28, v63);
  }
  if (v22)
  {
    int v29 = ((uint64_t (*)(uint64_t, void, void, size_t *))v22)(a3, 0, 0, &size);
    if (v29)
    {
      int v36 = v29;
      sub_100017164("KBMapVolume", @"APFSVolumePayloadGet failed with %d", v30, v31, v32, v33, v34, v35, v29);
      if (v36 == 49154)
      {
        sub_100017164("KBMapVolume", @"Not cookie in this volume, attempting to write it", v37, v38, v39, v40, v41, v42, v63);
        sub_100008150(a1, a3, &v65, &size, a5);
      }
      goto LABEL_12;
    }
    sub_100017164("KBMapVolume", @"APFSVolumePayloadGet len reveived to be %zd", v30, v31, v32, v33, v34, v35, size);
    int v55 = malloc_type_malloc(size, 0x21D0A9C3uLL);
    int v65 = v55;
    if (v55)
    {
      int v56 = ((uint64_t (*)(uint64_t, void, void *, size_t *))v22)(a3, 0, v55, &size);
      if (v56) {
        sub_100017164("KBMapVolume", @"Failed to  obtain cookie from the volume with error %d", v57, v58, v59, v60, v61, v62, v56);
      }
      else {
        sub_100017164("KBMapVolume", @"Successfully obtained the cookie for the volume with length:%zd", v57, v58, v59, v60, v61, v62, size);
      }
      goto LABEL_12;
    }
    CFStringRef v43 = @"Failed to allocate Cookie malloc space";
LABEL_11:
    sub_100017164("KBMapVolume", v43, v9, v10, v11, v12, v13, v14, v63);
  }
LABEL_12:
  if (a5)
  {
    uint64_t v44 = aks_set_keybag_for_volume_with_cookie_persona();
    uint64_t v51 = v44;
    if (v44)
    {
      sub_100017164("KBMapVolume", @"aks_set_keybag_for_volume_with_cookie_persona FAIL with 0x%x", v45, v46, v47, v48, v49, v50, v44);
      goto LABEL_20;
    }
    CFStringRef v53 = @"aks_set_keybag_for_volume_with_cookie_persona SUCCESS";
  }
  else
  {
    uint64_t v52 = aks_set_keybag_for_volume_with_cookie();
    uint64_t v51 = v52;
    if (v52)
    {
      sub_100017164("KBMapVolume", @"aks_set_keybag_for_volume_with_cookie FAIL with 0x%x", v45, v46, v47, v48, v49, v50, v52);
      goto LABEL_20;
    }
    CFStringRef v53 = @"aks_set_keybag_for_volume_with_cookie SUCCESS";
  }
  sub_100017164("KBMapVolume", v53, v45, v46, v47, v48, v49, v50, v63);
LABEL_20:
  if (v65) {
    free(v65);
  }
  return v51;
}

uint64_t sub_10000855C(const char *a1, int a2)
{
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  memset(v48, 0, 512);
  memset(&v50, 0, 512);
  if (statfs(a1, &v50))
  {
    uint64_t v10 = __error();
    char v44 = strerror(*v10);
    sub_100017164("has_data_protection", @"Statfs failed due to:%s on  (%s)", v11, v12, v13, v14, v15, v16, v44);
LABEL_5:
    sub_100017164("has_data_protection", @"mount point (%s) does not support Data Protection", v17, v18, v19, v20, v21, v22, (char)a1);
    return 0;
  }
  if ((v50.f_flags & 0x80) == 0)
  {
    sub_100017164("has_data_protection", @"mount is with NO CPROTECT:0x%x on  (%s)", v4, v5, v6, v7, v8, v9, v50.f_flags);
    goto LABEL_5;
  }
  LOWORD(v45) = 5;
  LODWORD(v46) = -2147188736;
  if (getattrlist(a1, &v45, v48, 0x41CuLL, 0))
  {
    __error();
    sub_100017164("KBMapDeviceBag", @"Could not get %s volume attributes (errno=%d)", v30, v31, v32, v33, v34, v35, (char)a1);
    return 4294967290;
  }
  int v36 = (char *)v48 + SDWORD1(v48[0]) + 4;
  if (v36 >= v49 || &v36[DWORD2(v48[0])] >= v49)
  {
    sub_100017164("KBMapDeviceBag", @"Attribute buffer too small. offset=%d, lenght=%u", (uint64_t)v36, v25, v26, v27, v28, v29, SBYTE4(v48[0]));
    return 4294967290;
  }
  uint64_t v37 = sub_1000082E0(0, 0, (uint64_t)v36, (unint64_t)v48 | 0xC, a2);
  uint64_t v23 = sub_100010F88(v37);
  if (v23) {
    sub_100017164("KBMapDeviceBag", @"Could not map %s volume (ret=%d)", v38, v39, v40, v41, v42, v43, (char)a1);
  }
  return v23;
}

uint64_t sub_1000087EC(const std::__fs::filesystem::path *a1, CFPropertyListRef *a2)
{
  CFDataRef theData = 0;
  CFDataRef v80 = 0;
  size_t v77 = 0;
  CCCryptorRef cryptorRef = 0;
  size_t dataOutMoved = 0;
  *a2 = 0;
  bzero(__str, 0x401uLL);
  CFDataRef v81 = 0;
  int v4 = sub_100008B18((const char *)a1, &v81, (CFTypeRef *)&v80, (CFTypeRef *)&theData);
  if (v4)
  {
    sub_100017164("KBSecureLoadObject", @"Failed to validate keybag file: %d, %d", v5, v6, v7, v8, v9, v10, v4);
    snprintf((char *)__str, 0x401uLL, "%s.writing", (const char *)a1);
    int v11 = sub_100008B18((const char *)__str, &v81, (CFTypeRef *)&v80, (CFTypeRef *)&theData);
    if (v11 || !v81)
    {
      sub_100017164("KBSecureLoadObject", @"Failed to validate keybag file: %d", (uint64_t)v12, v13, v14, v15, v16, v17, v11);
    }
    else
    {
      rename(__str, a1, v12);
      if (!v18) {
        goto LABEL_5;
      }
      uint64_t v68 = __error();
      strerror(*v68);
      sub_100017164("KBSecureLoadObject", @"could not rename %s to %s: %s", v69, v70, v71, v72, v73, v74, (char)__str);
    }
    uint64_t v60 = 4294967288;
    sub_100017164("KBSecureLoadObjectWithCrypto", @"Can't load secure keybag Object: %d", v62, v63, v64, v65, v66, v67, -8);
    CFDataRef v19 = 0;
    goto LABEL_12;
  }
LABEL_5:
  CFDataRef v19 = v81;
  BytePtr = CFDataGetBytePtr(theData);
  size_t Length = CFDataGetLength(theData);
  uint64_t v22 = CFDataGetBytePtr(v80);
  CCCryptorStatus v23 = CCCryptorCreate(1u, 0, 1u, BytePtr, Length, v22, &cryptorRef);
  if (v23)
  {
    sub_100017164("KBSecureLoadObjectWithCrypto", @"Can't create decryptor: %d", v24, v25, v26, v27, v28, v29, v23);
    uint64_t v60 = 4294967289;
    goto LABEL_12;
  }
  uint64_t v30 = CFDataGetBytePtr(v19);
  size_t v31 = CFDataGetLength(v19);
  uint64_t v32 = (UInt8 *)malloc_type_malloc(v31, 0x47E4BB70uLL);
  if (!v32)
  {
    sub_100017164("KBSecureLoadObjectWithCrypto", @"Can't allocate decryption buffer", v33, v34, v35, v36, v37, v38, v75);
    uint64_t v60 = 4294967291;
    goto LABEL_12;
  }
  uint64_t v39 = v32;
  uint64_t v40 = cryptorRef;
  size_t v41 = CFDataGetLength(v19);
  size_t v42 = CFDataGetLength(v19);
  CCCryptorStatus v43 = CCCryptorUpdate(v40, v30, v41, v39, v42, &dataOutMoved);
  if (v43)
  {
    sub_100017164("KBSecureLoadObjectWithCrypto", @"Unable to decrypt: %d", v44, v45, v46, v47, v48, v49, v43);
  }
  else
  {
    statfs v50 = cryptorRef;
    uint64_t v51 = &v39[dataOutMoved];
    CFIndex v52 = CFDataGetLength(v19);
    CCCryptorStatus v53 = CCCryptorFinal(v50, v51, v52 - dataOutMoved, &v77);
    if (!v53)
    {
      uint64_t v60 = 0;
      *a2 = sub_100010924(v39, (v77 + dataOutMoved));
      goto LABEL_10;
    }
    sub_100017164("KBSecureLoadObjectWithCrypto", @"Unable to finalize: %d", v54, v55, v56, v57, v58, v59, v53);
  }
  uint64_t v60 = 4294967289;
LABEL_10:
  if (v39 != v30) {
    free(v39);
  }
LABEL_12:
  if (v80)
  {
    CFRelease(v80);
    CFDataRef v80 = 0;
  }
  if (theData)
  {
    CFRelease(theData);
    CFDataRef theData = 0;
  }
  if (v19) {
    CFRelease(v19);
  }
  CCCryptorRelease(cryptorRef);
  return v60;
}

uint64_t sub_100008B18(const char *a1, void *a2, CFTypeRef *a3, CFTypeRef *a4)
{
  char v7 = (char)a1;
  CFDictionaryRef v8 = (const __CFDictionary *)sub_100010D10(a1);
  if (!v8)
  {
    sub_100017164("validateSecureFile", @"Unable to load %s", v9, v10, v11, v12, v13, v14, v7);
    return 0xFFFFFFFFLL;
  }
  CFDictionaryRef v15 = v8;
  unsigned int valuePtr = 0;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v8, @"_MKBWIPEID");
  if (!Value || (CFNumberRef v23 = Value, v24 = CFGetTypeID(Value), v24 != CFNumberGetTypeID()))
  {
    sub_100017164("validateSecureFile", @"%s missing wipeID", v17, v18, v19, v20, v21, v22, v7);
LABEL_35:
    CFRelease(v15);
    return 0xFFFFFFFFLL;
  }
  uint64_t v25 = CFDictionaryGetValue(v15, @"_MKBIV");
  if (!v25 || (uint64_t v32 = v25, v33 = CFGetTypeID(v25), v33 != CFDataGetTypeID()))
  {
    sub_100017164("validateSecureFile", @"%s missing IV", v26, v27, v28, v29, v30, v31, v7);
    goto LABEL_35;
  }
  uint64_t v34 = CFDictionaryGetValue(v15, @"_MKBPAYLOAD");
  if (!v34 || (size_t v41 = v34, v42 = CFGetTypeID(v34), v42 != CFDataGetTypeID()))
  {
    sub_100017164("validateSecureFile", @"%s missing payload", v35, v36, v37, v38, v39, v40, v7);
    goto LABEL_35;
  }
  CFNumberGetValue(v23, kCFNumberIntType, &valuePtr);
  unsigned int v43 = valuePtr;
  int v86 = 0;
  memset(v85, 0, sizeof(v85));
  size_t v84 = 52;
  int v44 = sub_100003330(valuePtr, v85, &v84);
  if (v44)
  {
    sub_100017164("loadWipeIDInfo", @"Unable to load wipe info: %08x", v45, v46, v47, v48, v49, v50, v44);
LABEL_34:
    sub_100017164("validateSecureFile", @"Can't load wipe info for ID:%08x", v76, v77, v78, v79, v80, v81, valuePtr);
    goto LABEL_35;
  }
  if (LODWORD(v85[0]) != v43)
  {
    sub_100017164("loadWipeIDInfo", @"Wipe Info ID is wrong: %d", v45, v46, v47, v48, v49, v50, v85[0]);
    goto LABEL_34;
  }
  CFDataRef v51 = CFDataCreate(0, (const UInt8 *)v85 + 4, 16);
  if (!v51)
  {
    sub_100017164("loadWipeIDInfo", @"Can't create iv data", v52, v53, v54, v55, v56, v57, v82);
    goto LABEL_34;
  }
  CFDataRef v58 = v51;
  CFDataRef v59 = CFDataCreate(0, (const UInt8 *)&v85[1] + 4, 32);
  if (!v59)
  {
    sub_100017164("loadWipeIDInfo", @"Can't create key data", v60, v61, v62, v63, v64, v65, v82);
    CFRelease(v58);
    goto LABEL_34;
  }
  CFDataRef v66 = v59;
  if (CFEqual(v32, v58))
  {
    if (a3) {
      *a3 = CFRetain(v58);
    }
    if (a4) {
      *a4 = CFRetain(v66);
    }
    if (!a2)
    {
      uint64_t v74 = 0;
      goto LABEL_23;
    }
    CFTypeRef v73 = CFRetain(v41);
    uint64_t v74 = 0;
    goto LABEL_21;
  }
  sub_100017164("validateSecureFile", @"fileIV to wipeIV mismatch, no payload returned", v67, v68, v69, v70, v71, v72, v82);
  CFShow(v32);
  CFShow(v58);
  uint64_t v74 = 4294967287;
  if (a2)
  {
    CFTypeRef v73 = 0;
LABEL_21:
    *a2 = v73;
  }
LABEL_23:
  CFRelease(v15);
  CFRelease(v58);
  CFRelease(v66);
  return v74;
}

CFDataRef sub_100008E38(int a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 != -1)
  {
    int lock_state = aks_get_lock_state();
    if (!lock_state)
    {
      CFDataRef v9 = 0;
      goto LABEL_7;
    }
    sub_100017164("KBisxARTBasedKeyBag", @"get_lock_state() -> 0x%x", a3, a4, a5, a6, a7, a8, lock_state);
LABEL_9:
    CFDataRef v9 = 0;
    goto LABEL_7;
  }
  if (!a2) {
    goto LABEL_9;
  }
  CFDataRef v10 = (const __CFData *)sub_1000106EC(a2, @"KeyBagKeys");
  CFDataRef v9 = v10;
  if (v10)
  {
    CFDataGetBytePtr(v10);
    CFDataGetLength(v9);
    CFDataRef v9 = (const __CFData *)aks_bag_in_xart();
  }
LABEL_7:
  sub_100017164("KBisxARTBasedKeyBag", @"Result = %d", a3, a4, a5, a6, a7, a8, (char)v9);
  return v9;
}

BOOL sub_100008F08(id a1, void *a2)
{
  if (!aks_get_lock_state()) {
    return 1;
  }
  sub_100017164("seshat_preflight_condition_for_pw_change_block_invoke", @"no lock state", v2, v3, v4, v5, v6, v7, v9);
  return 0;
}

uint64_t sub_100008F6C(uint64_t result)
{
  qword_1000398B0 = result;
  return result;
}

uint64_t sub_100008F78(uint64_t result)
{
  qword_1000398B8 = result;
  return result;
}

uint64_t sub_1000090B8()
{
  objc_opt_class();
  qword_1000398C0 = objc_opt_new();

  return _objc_release_x1();
}

void sub_1000096F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100009728(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100009738(uint64_t a1)
{
}

void sub_100009740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v9 = "NULL";
  if (*(void *)(a1 + 64) && *(void *)(a1 + 72)) {
    char v9 = "SECRET";
  }
  sub_100017164("-[KBXPCService changeSystemSecretfromOldSecret:oldSize:toNewSecret:newSize:opaqueData:withParams:reply:]_block_invoke", @"oldpass=%s newpass=%s %s (params:%d)", a3, a4, a5, a6, a7, a8, (char)v9);
  uint64_t v10 = *(void *)(a1 + 64);
  if (v10)
  {
    uint64_t v10 = *(void *)(a1 + 72);
    if (v10)
    {
      uint64_t v10 = *(void *)(a1 + 80);
      if (v10) {
        LOBYTE(v10) = *(void *)(a1 + 88) != 0;
      }
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
  uint64_t v11 = sub_100017160();
  int v12 = sub_100017488();
  uint64_t v13 = *(void *)(a1 + 72);
  if (v13) {
    uint64_t v14 = *(void *)(a1 + 64);
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = *(void *)(a1 + 88);
  if (v15) {
    CFDataRef v16 = *(const __CFData **)(a1 + 80);
  }
  else {
    CFDataRef v16 = 0;
  }
  int v17 = sub_100006D98(v12, v11, v14, v13, v16, v15, *(const void **)(a1 + 32), *(_DWORD *)(a1 + 96));
  if (v17)
  {
    int v24 = v17;
    sub_100017164("-[KBXPCService changeSystemSecretfromOldSecret:oldSize:toNewSecret:newSize:opaqueData:withParams:reply:]_block_invoke", @"Can't change passcode: 0x%08x", v18, v19, v20, v21, v22, v23, v17);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v24 userInfo:0];
    _objc_release_x1();
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    sub_100017164("-[KBXPCService changeSystemSecretfromOldSecret:oldSize:toNewSecret:newSize:opaqueData:withParams:reply:]_block_invoke", @"change passcode success", v18, v19, v20, v21, v22, v23, v38);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      sub_100017164("-[KBXPCService changeSystemSecretfromOldSecret:oldSize:toNewSecret:newSize:opaqueData:withParams:reply:]_block_invoke", @"Posting analytics stats", v25, v26, v27, v28, v29, v30, v39);
      uint64_t v41 = 1;
      sub_10001497C(&v41, v31, v32, v33, v34, v35, v36, v37, v40);
    }
  }
}

void sub_100009F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_100009FB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = "NULL";
  if (*(void *)(a1 + 64) && *(void *)(a1 + 72)) {
    uint64_t v10 = "SECRET";
  }
  sub_100017164("-[KBXPCService changeSystemSecretWithEscrow:fromOldSecret:oldSize:toNewSecret:newSize:opaqueData:keepstate:reply:]_block_invoke", @"oldpass=%s newpass=%s %s", a3, a4, a5, a6, a7, a8, (char)v10);
  uint64_t v11 = *(void *)(a1 + 72);
  if (v11) {
    uint64_t v12 = *(void *)(a1 + 64);
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = *(void *)(a1 + 88);
  if (v13) {
    uint64_t v14 = *(void *)(a1 + 80);
  }
  else {
    uint64_t v14 = 0;
  }
  int v15 = sub_100007E5C(*(const __CFData **)(a1 + 40), v12, v11, v14, v13, *(unsigned __int8 *)(a1 + 96), *(const void **)(a1 + 32));
  if (v15)
  {
    int v22 = v15;
    sub_100017164("-[KBXPCService changeSystemSecretWithEscrow:fromOldSecret:oldSize:toNewSecret:newSize:opaqueData:keepstate:reply:]_block_invoke", @"Can't change passcode: 0x%08x", v16, v17, v18, v19, v20, v21, v15);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v22 userInfo:0];
    _objc_release_x1();
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    sub_100017164("-[KBXPCService changeSystemSecretWithEscrow:fromOldSecret:oldSize:toNewSecret:newSize:opaqueData:keepstate:reply:]_block_invoke", @"change passcode success", v16, v17, v18, v19, v20, v21, a9);
  }
}

uint64_t sub_10000BC0C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000C290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_10000C2B8(uint64_t a1)
{
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3) {
    uint64_t v4 = *(void *)(a1 + 72);
  }
  else {
    uint64_t v4 = 0;
  }
  int v5 = sub_100015FB0(v2, *(unsigned int *)(a1 + 80), v4, v3, *(_DWORD *)(a1 + 84), *(const void **)(a1 + 40));
  if (v5)
  {
    int v12 = v5;
    sub_100017164("-[KBXPCService createKeybagForUserSession:withSessionUID:WithSecret:secretSize:withGracePeriod:withOpaqeStuff:withReply:]_block_invoke", @"Can't createKeybag for usersession(uid=%d): 0x%08x", v6, v7, v8, v9, v10, v11, *(_DWORD *)(a1 + 80));
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v12 userInfo:0];
    _objc_release_x1();
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    sub_100017164("-[KBXPCService createKeybagForUserSession:withSessionUID:WithSecret:secretSize:withGracePeriod:withOpaqeStuff:withReply:]_block_invoke", @"Created keybag for user:%d success", v6, v7, v8, v9, v10, v11, *(_DWORD *)(a1 + 80));
  }
}

void sub_10000C734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_10000C75C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFDictionaryRef v10 = *(const __CFDictionary **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    uint64_t v12 = *(void *)(a1 + 64);
  }
  else {
    uint64_t v12 = 0;
  }
  int v13 = sub_1000158DC(v10, *(unsigned int *)(a1 + 72), v12, v11, *(unsigned __int8 *)(a1 + 80), *(_DWORD *)(a1 + 76), *(unsigned __int8 *)(a1 + 81));
  if (v13)
  {
    int v20 = v13;
    sub_100017164("-[KBXPCService loadKeybagForUserSession:withSessionID:withSecret:secretSize:shouldSetGracePeriod:withGracePeriod:isInEarlyStar:withReply:]_block_invoke", @"Can't loadkeybag for usersession(uid=%d): 0x%08x", v14, v15, v16, v17, v18, v19, *(_DWORD *)(a1 + 72));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v20 userInfo:0];
    _objc_release_x1();
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    sub_100017164("-[KBXPCService loadKeybagForUserSession:withSessionID:withSecret:secretSize:shouldSetGracePeriod:withGracePeriod:isInEarlyStar:withReply:]_block_invoke", @"loadUserKeybag successful", v14, v15, v16, v17, v18, v19, a9);
  }
}

void sub_10000C9B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000C9C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10 = sub_1000162E8(*(_DWORD *)(a1 + 40), a2, a3, a4, a5, a6, a7, a8);
  if (v10)
  {
    int v17 = v10;
    sub_100017164("-[KBXPCService unloadKeybagForUserSession:withReply:]_block_invoke", @"Can't unloadkeybag for usersession(uid=%d): 0x%08x", v11, v12, v13, v14, v15, v16, *(_DWORD *)(a1 + 40));
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v17 userInfo:0];
    _objc_release_x1();
  }
  else
  {
    sub_100017164("-[KBXPCService unloadKeybagForUserSession:withReply:]_block_invoke", @"unloadUserKeybag successful", v11, v12, v13, v14, v15, v16, a9);
  }
}

void sub_10000CC0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000CC24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10 = sub_1000054C8(-1, *(unsigned int *)(a1 + 40), 0, 0);
  if (v10)
  {
    int v17 = v10;
    sub_100017164("-[KBXPCService deleteKeybagForUserSession:withReply:]_block_invoke", @"Can't invalidate keybag for usersession(uid=%d): 0x%08x", v11, v12, v13, v14, v15, v16, *(_DWORD *)(a1 + 40));
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v17 userInfo:0];
    _objc_release_x1();
  }
  else
  {
    sub_100017164("-[KBXPCService deleteKeybagForUserSession:withReply:]_block_invoke", @"deleteUserKeybag successful", v11, v12, v13, v14, v15, v16, a9);
  }
}

void sub_10000CEA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000CEB8(uint64_t a1)
{
  memset(uu, 0, sizeof(uu));
  bzero(buffer, 0x400uLL);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  *(_OWORD *)in = 0u;
  long long v30 = 0u;
  if (CFStringGetCString(*(CFStringRef *)(a1 + 32), buffer, 1024, 0x8000100u))
  {
    if (CFStringGetCString(*(CFStringRef *)(a1 + 40), in, 256, 0x8000100u))
    {
      if (uuid_parse(in, uu))
      {
        uint64_t v5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
        uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v7 = *(void **)(v6 + 40);
        *(void *)(v6 + 40) = v5;

        CFStringRef v14 = @"failed to parse unique string to uuid_t";
      }
      else
      {
        int v22 = sub_10001625C(0, 0, 0, buffer, (uint64_t)uu, v2, v3, v4);
        if (v22)
        {
          int v23 = v22;
          sub_100017164("-[KBXPCService setVolumeToPersona:withPersonaString:withReply:]_block_invoke", @"Can't map volumepath:%s to uuid with error: 0x%08x", v8, v9, v10, v11, v12, v13, (char)buffer);
          uint64_t v24 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v23 userInfo:0];
          uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v26 = *(void **)(v25 + 40);
          *(void *)(v25 + 40) = v24;

          return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
        }
        CFStringRef v14 = @"setupKeybagForPersona successful";
      }
    }
    else
    {
      uint64_t v18 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
      int v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;

      CFStringRef v14 = @"Failed to get cstring from uuid string";
    }
  }
  else
  {
    uint64_t v15 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    int v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    CFStringRef v14 = @"Failed to get volume path";
  }
  sub_100017164("-[KBXPCService setVolumeToPersona:withPersonaString:withReply:]_block_invoke", v14, v8, v9, v10, v11, v12, v13, v27);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000D2AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D2C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10 = sub_1000163B8(*(void *)(a1 + 32), *(unsigned int *)(a1 + 48), a3, a4, a5, a6, a7, a8);
  if (v10)
  {
    int v17 = v10;
    sub_100017164("-[KBXPCService createSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", @"Can't unloadkeybag for usersession(uid=%d): 0x%08x", v11, v12, v13, v14, v15, v16, *(_DWORD *)(a1 + 48));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v17 userInfo:0];
    _objc_release_x1();
  }
  else
  {
    sub_100017164("-[KBXPCService createSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", @"createSyncbag successful", v11, v12, v13, v14, v15, v16, a9);
  }
}

void sub_10000D524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D53C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10 = sub_100016648(*(const __CFDictionary **)(a1 + 32), *(unsigned int *)(a1 + 48), a3, a4, a5, a6, a7, a8);
  if (v10)
  {
    int v17 = v10;
    sub_100017164("-[KBXPCService loadSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", @"Can't unloadkeybag for usersession(uid=%d): 0x%08x", v11, v12, v13, v14, v15, v16, *(_DWORD *)(a1 + 48));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v17 userInfo:0];
    _objc_release_x1();
  }
  else
  {
    sub_100017164("-[KBXPCService loadSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", @"loadSyncbag successful", v11, v12, v13, v14, v15, v16, a9);
  }
}

void sub_10000D79C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D7B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10 = sub_100016BC8(*(void *)(a1 + 32), *(unsigned int *)(a1 + 48));
  if (v10)
  {
    int v17 = v10;
    sub_100017164("-[KBXPCService verifySyncBagForUserSession:withSessionUID:withReply:]_block_invoke", @"Can't unloadkeybag for usersession(uid=%d): 0x%08x", v11, v12, v13, v14, v15, v16, *(_DWORD *)(a1 + 48));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v17 userInfo:0];
    _objc_release_x1();
  }
  else
  {
    sub_100017164("-[KBXPCService verifySyncBagForUserSession:withSessionUID:withReply:]_block_invoke", @"verifySyncbag successful", v11, v12, v13, v14, v15, v16, a9);
  }
}

void sub_10000DA14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000DA2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10 = sub_100017160();
  sub_100017164("-[KBXPCService unloadSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", @"currentFGID:%d, session uid:%d", v11, v12, v13, v14, v15, v16, v10);
  if (*(_DWORD *)(a1 + 48) == v10)
  {
    CFStringRef v23 = @"No need to unload syncbag for current user, skip..";
LABEL_8:
    sub_100017164("-[KBXPCService unloadSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", v23, v17, v18, v19, v20, v21, v22, a9);
    return;
  }
  sub_100017164("-[KBXPCService unloadSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", @"Unloading the bag", v17, v18, v19, v20, v21, v22, v32);
  int v30 = sub_100016CA0(*(void *)(a1 + 32), *(_DWORD *)(a1 + 48), v24, v25, v26, v27, v28, v29);
  if (!v30)
  {
    CFStringRef v23 = @"unloadSyncbag successful";
    goto LABEL_8;
  }
  int v31 = v30;
  sub_100017164("-[KBXPCService unloadSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", @"Can't unloadkeybag for usersession(uid=%d): 0x%08x", v17, v18, v19, v20, v21, v22, *(_DWORD *)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v31 userInfo:0];

  _objc_release_x1();
}

void sub_10000DCDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000DCF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10 = sub_100017160();
  sub_100017164("-[KBXPCService removeSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", @"currentFGID:%d, session uid:%d", v11, v12, v13, v14, v15, v16, v10);
  int v23 = *(_DWORD *)(a1 + 48);
  BOOL v24 = v23 == v10;
  BOOL v25 = v23 != v10;
  if (v24) {
    CFStringRef v26 = @"removing syncbag for current user, only sync bag will be cleared";
  }
  else {
    CFStringRef v26 = @"Syncbag removal for non foreground user, unloading session bag as well";
  }
  sub_100017164("-[KBXPCService removeSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", v26, v17, v18, v19, v20, v21, v22, v40);
  int v32 = sub_100016930(*(__CFDictionary **)(a1 + 32), *(unsigned int *)(a1 + 48), v25, v27, v28, v29, v30, v31);
  if (v32)
  {
    int v39 = v32;
    sub_100017164("-[KBXPCService removeSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", @"Can't unloadkeybag for usersession(uid=%d): 0x%08x", v33, v34, v35, v36, v37, v38, *(_DWORD *)(a1 + 48));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v39 userInfo:0];
    _objc_release_x1();
  }
  else
  {
    sub_100017164("-[KBXPCService removeSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", @"removeSyncbag successful", v33, v34, v35, v36, v37, v38, a9);
  }
}

void sub_10000E1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_10000E1C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10 = sub_100016D74(*(unsigned int *)(a1 + 80), *(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40));
  if (v10)
  {
    int v17 = v10;
    sub_100017164("-[KBXPCService createPersonaKeyForUserSession:forPath:withUID:WithSecret:secretSize:withReply:]_block_invoke", @"Can't create persona key for user with error: 0x%08x", v11, v12, v13, v14, v15, v16, v10);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v17 userInfo:0];
    _objc_release_x1();
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    sub_100017164("-[KBXPCService createPersonaKeyForUserSession:forPath:withUID:WithSecret:secretSize:withReply:]_block_invoke", @"createPersonaKey successful", v11, v12, v13, v14, v15, v16, a9);
  }
}

void sub_10000E46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10 = sub_100016F60(*(_DWORD *)(a1 + 56), *(CFStringRef *)(a1 + 32), *(const __CFString **)(a1 + 40));
  if (v10)
  {
    int v17 = v10;
    sub_100017164("-[KBXPCService removePersonaKeyForUserSession:withUID:withVolumeUUIDString:withReply:]_block_invoke", @"Can't delete persona key for user: 0x%08x", v11, v12, v13, v14, v15, v16, v10);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v17 userInfo:0];
    _objc_release_x1();
  }
  else
  {
    sub_100017164("-[KBXPCService removePersonaKeyForUserSession:withUID:withVolumeUUIDString:withReply:]_block_invoke", @"removePersonaKey successful", v11, v12, v13, v14, v15, v16, a9);
  }
}

id sub_10000E54C()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_1000398D8;
  qword_1000398D8 = v0;

  id v2 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.mobile.keybagd.xpc"];
  uint64_t v3 = (void *)qword_1000398D0;
  qword_1000398D0 = (uint64_t)v2;

  [(id)qword_1000398D0 setDelegate:qword_1000398D8];
  uint64_t v4 = (void *)qword_1000398D0;

  return [v4 resume];
}

void sub_10000E6BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000E6D0(id a1)
{
  qword_1000398E0 = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);
}

id sub_10000E890(uint64_t a1)
{
  return [*(id *)(a1 + 32) _persistentStateQueue_beginSpeculativeFailureCharge];
}

id sub_10000E90C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _persistentStateQueue_rollbackSpeculativeFailureCharge];
}

id sub_10000E988(uint64_t a1)
{
  return [*(id *)(a1 + 32) _persistentStateQueue_unlockSucceeded];
}

id sub_10000EA04(uint64_t a1)
{
  return [*(id *)(a1 + 32) _persistentStateQueue_unlockFailed];
}

uint64_t sub_10000EABC(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 57);
  return result;
}

double sub_10000EBC4(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 64);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t sub_10000EC84(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 56);
  return result;
}

uint64_t sub_10000ED44(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 72);
  return result;
}

NSDictionary *sub_10000F3F8(uint64_t a1)
{
  id v1 = +[MKBDeviceLockModelEducationalMode sharedLockModelWithUID:a1];
  [v1 timeUntilUnblockedSinceReferenceDate];
  double v3 = v2;
  [+[NSDate date] timeIntervalSinceReferenceDate];
  double v5 = v4;
  double v6 = 0.0;
  if (v3 > v5) {
    [+[NSDate dateWithTimeIntervalSinceReferenceDate:v3] timeIntervalSinceNow];
  }
  v8[0] = @"TimeUntilUnblockedSinceReferenceDate";
  v9[0] = +[NSNumber numberWithDouble:v6];
  v8[1] = @"FailedPasscodeAttempts";
  v9[1] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v1 failedPasscodeAttempts]);
  v8[2] = @"IsPermanentlyBlocked";
  v9[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 isPermanentlyBlocked]);
  v8[3] = @"IsWipePending";
  v9[3] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 isWipePending]);
  return +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];
}

id sub_10000F564(uint64_t a1)
{
  id v1 = +[MKBDeviceLockModelEducationalMode sharedLockModelWithUID:a1];

  return [v1 notePasscodeEntryBegan];
}

id sub_10000F598(uint64_t a1)
{
  id v1 = +[MKBDeviceLockModelEducationalMode sharedLockModelWithUID:a1];

  return [v1 notePasscodeUnlockSucceeded];
}

id sub_10000F5CC(uint64_t a1)
{
  id v1 = +[MKBDeviceLockModelEducationalMode sharedLockModelWithUID:a1];

  return [v1 notePasscodeUnlockFailed];
}

uint64_t sub_10000F600(sqlite3 *a1, int a2)
{
  errmsg = 0;
  if (a2) {
    double v2 = "BEGIN TRANSACTION";
  }
  else {
    double v2 = "END TRANSACTION";
  }
  uint64_t v3 = sqlite3_exec(a1, v2, 0, 0, &errmsg);
  if (errmsg) {
    sqlite3_free(errmsg);
  }
  return v3;
}

BOOL sub_10000F664(sqlite3 *a1)
{
  ppStmt = 0;
  BOOL v2 = sqlite3_prepare_v2(a1, "PRAGMA integrity_check;", -1, &ppStmt, 0)
    || sqlite3_step(ppStmt) != 100
    || (id v1 = sqlite3_column_text(ppStmt, 0)) == 0
    || strncasecmp((const char *)v1, "ok", 3uLL) != 0;
  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  return v2;
}

uint64_t sub_10000F6F8(sqlite3 *a1)
{
  uint64_t v2 = sqlite3_file_control(a1, 0, 101, 0);
  if (!v2) {
    return (sub_10000F758(a1, v3, v4, v5, v6, v7, v8, v9) - 1);
  }
  uint64_t v10 = v2;
  sub_100017164("db_truncate", @"unable to truncate", v4, v5, v6, v7, v8, v9, v12);
  return v10;
}

BOOL sub_10000F758(sqlite3 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  errmsg = 0;
  sub_100017164("init_db", @"initializing sqlite db", a3, a4, a5, a6, a7, a8, v17);
  int v15 = sqlite3_exec(a1, "DROP TABLE IF EXISTS WrappedKeys;CREATE TABLE WrappedKeys(Inode INT, Uuid BLOB, Key BLOB, Flagged BOOLEAN DEFA"
          "ULT 0, AddTime TIMESTAMP DEFAULT 0, ClearTime TIMESTAMP DEFAULT 0, AccessTime TIMESTAMP DEFAULT 0, unique(Inod"
          "e, Uuid));CREATE INDEX Inode ON WrappedKeys(Inode);CREATE INDEX InodeUuid ON WrappedKeys(Inode, Uuid);PRAGMA u"
          "ser_version = 3;",
          0,
          0,
          &errmsg);
  if (v15)
  {
    sub_100017164("init_db", @"sqlite error: %s", v9, v10, v11, v12, v13, v14, (char)errmsg);
    sqlite3_free(errmsg);
  }
  return v15 == 0;
}

sqlite3 *sub_10000F7E8(const char *a1, int a2, int a3, uint64_t a4)
{
  char v5 = a3;
  ppDb = 0;
  memset(&v43, 0, sizeof(v43));
  if (a2 && a3)
  {
    if (!a4) {
      return 0;
    }
    int v40 = 1;
LABEL_48:
    double result = 0;
    *(_DWORD *)(a4 + 20) = v40;
    return result;
  }
  if (a3) {
    int v7 = 1;
  }
  else {
    int v7 = 2;
  }
  if (a2) {
    int v8 = v7 | 4;
  }
  else {
    int v8 = v7;
  }
  if (!sub_100017520())
  {
    if (!a4) {
      return 0;
    }
    int v40 = 2;
    goto LABEL_48;
  }
  int v42 = 0;
  char v9 = 0;
  int v10 = v8 | 0x300000;
  char v11 = 1;
  while (1)
  {
    char v12 = v11;
    int v13 = stat(a1, &v43);
    BOOL v14 = v13 == 0;
    int v15 = sqlite3_open_v2(a1, &ppDb, v10, 0);
    if (v15)
    {
      if (a4) {
        *(_DWORD *)(a4 + 24) = v15;
      }
      int v22 = 4;
      goto LABEL_23;
    }
    if (_sqlite3_maintain_load_factor()) {
      sub_100017164("db_open_mode_with_stats", @"_sqlite3_maintain_load_factor for %s failed: %d", v16, v17, v18, v19, v20, v21, (char)a1);
    }
    double result = ppDb;
    if (v13)
    {
      if (!ppDb) {
        goto LABEL_44;
      }
      goto LABEL_38;
    }
    if (sub_10000FA90(ppDb) != 2) {
      break;
    }
    uint64_t v31 = ppDb;
    errmsg = 0;
    sub_100017164("db_migrate_from_v2", @"Migrating backup db from v2", v25, v26, v27, v28, v29, v30, v41);
    if (!sqlite3_exec(v31, "ALTER TABLE WrappedKeys ADD COLUMN AddTime TIMESTAMP DEFAULT 0;ALTER TABLE WrappedKeys ADD COLUMN AccessTime"
            " TIMESTAMP DEFAULT 0;ALTER TABLE WrappedKeys ADD COLUMN ClearTime TIMESTAMP DEFAULT 0;PRAGMA user_version = 3;",
            0,
            0,
            &errmsg))
      break;
    sub_100017164("db_migrate_from_v2", @"sqlite error: %s", v32, v33, v34, v35, v36, v37, (char)errmsg);
    sqlite3_free(errmsg);
    int v22 = 7;
LABEL_23:
    int v42 = v22;
    sub_100017164("db_open_mode_with_stats", @"db(%d) @ %s has a problem, rc=%d, version=%d", v16, v17, v18, v19, v20, v21, v9);
    if (ppDb)
    {
      if (v5)
      {
        sqlite3_close(ppDb);
        ppDb = 0;
      }
      else
      {
        int v38 = sub_10000F6F8(ppDb);
        if (a4) {
          *(unsigned char *)(a4 + 28) = 1;
        }
        sqlite3_close(ppDb);
        ppDb = 0;
        if (v38)
        {
          unlink(a1);
          if (a4) {
            *(unsigned char *)(a4 + 29) = 1;
          }
        }
      }
    }
    char v11 = 0;
    char v9 = 1;
    if ((v12 & 1) == 0) {
      goto LABEL_36;
    }
  }
  if (sub_10000FA90(ppDb) != 3)
  {
    int v22 = 6;
    goto LABEL_23;
  }
  BOOL v14 = 1;
LABEL_36:
  double result = ppDb;
  if (!ppDb)
  {
LABEL_44:
    int v40 = v42;
    if (a4) {
      goto LABEL_48;
    }
    return 0;
  }
  if (v14) {
    return result;
  }
LABEL_38:
  BOOL v39 = sub_10000F758(result, v23, v16, v17, v18, v19, v20, v21);
  double result = ppDb;
  if (v39) {
    return result;
  }
  sqlite3_close(ppDb);
  if (a4)
  {
    int v40 = 3;
    goto LABEL_48;
  }
  return 0;
}

uint64_t sub_10000FA90(sqlite3 *a1)
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(a1, "PRAGMA user_version;", -1, &ppStmt, 0) || sqlite3_step(ppStmt) != 100) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = sqlite3_column_int(ppStmt, 0);
  }
  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  return v1;
}

sqlite3 *sub_10000FB0C(const char *a1, int a2, int a3)
{
  return sub_10000F7E8(a1, a2, a3, 0);
}

uint64_t sub_10000FB14(sqlite3 *a1)
{
  uint64_t v1 = sqlite3_close(a1);
  uint64_t v8 = v1;
  if (v1) {
    sub_100017164("db_close", @"failed to close sqlite with %d", v2, v3, v4, v5, v6, v7, v1);
  }
  return v8;
}

uint64_t sub_10000FB60(sqlite3 *a1, sqlite3_int64 *a2, const void *a3, int *a4)
{
  ppStmt = 0;
  int v8 = sqlite3_prepare_v2(a1, "REPLACE INTO WrappedKeys (Inode, Uuid, Key, AddTime) VALUES(?, ?, ?, datetime('now', 'subsec'))", -1, &ppStmt, 0);
  if (v8)
  {
    int v22 = v8;
    char v23 = sqlite3_errmsg(a1);
    sub_100017164("db_add_item_with_error", @"Cannot prepare statement: %s", v24, v25, v26, v27, v28, v29, v23);
    uint64_t v20 = 2;
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
  int v9 = sqlite3_bind_int64(ppStmt, 1, *a2);
  if (v9)
  {
    int v22 = v9;
    char v30 = sqlite3_errmsg(a1);
    sub_100017164("db_add_item_with_error", @"Cannot bind inode int64 %s", v31, v32, v33, v34, v35, v36, v30);
    uint64_t v20 = 3;
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
  int v10 = sqlite3_bind_blob(ppStmt, 2, a2 + 1, 16, 0);
  if (v10)
  {
    int v22 = v10;
    char v37 = sqlite3_errmsg(a1);
    sub_100017164("db_add_item_with_error", @"Cannot bind uuid blob %s", v38, v39, v40, v41, v42, v43, v37);
    uint64_t v20 = 4;
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
  int v11 = sqlite3_bind_blob(ppStmt, 3, a3, 108, 0);
  if (v11)
  {
    int v22 = v11;
    char v44 = sqlite3_errmsg(a1);
    sub_100017164("db_add_item_with_error", @"Cannot bind key blob %s", v45, v46, v47, v48, v49, v50, v44);
    uint64_t v20 = 5;
    if (!a4) {
      goto LABEL_7;
    }
LABEL_19:
    *a4 = v22;
    goto LABEL_7;
  }
  int v12 = sqlite3_step(ppStmt);
  if (v12 == 101)
  {
    uint64_t v20 = 0;
    goto LABEL_7;
  }
  int v22 = v12;
  char v51 = sqlite3_errmsg(a1);
  sub_100017164("db_add_item_with_error", @"step failed: %s", v52, v53, v54, v55, v56, v57, v51);
  uint64_t v20 = 6;
  if (a4) {
    goto LABEL_19;
  }
LABEL_7:
  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  uint64_t v59 = v20;
  sub_1000147A4((uint64_t)&v59, v13, v14, v15, v16, v17, v18, v19, v58);
  return v20;
}

uint64_t sub_10000FD38(sqlite3 *a1, sqlite3_int64 *a2, _OWORD *a3, CFTypeRef *a4)
{
  ppStmt = 0;
  int v8 = sqlite3_prepare_v2(a1, "UPDATE WrappedKeys SET AccessTime = (CASE WHEN Key NOT NULL THEN datetime('now', 'subsec') END) WHERE Inode = ? AND Uuid = ? RETURNING Key, AddTime, AccessTime, ClearTime", -1, &ppStmt, 0);
  if (v8)
  {
    int v38 = v8;
    char v39 = sqlite3_errmsg(a1);
    sub_100017164("db_get_item", @"Failed to execute get statement: %s\n", v40, v41, v42, v43, v44, v45, v39);
    uint64_t v13 = 0;
    char v37 = 0;
    uint64_t v14 = 0;
    uint64_t v30 = 2;
  }
  else
  {
    int v9 = sqlite3_bind_int64(ppStmt, 1, *a2);
    if (v9)
    {
      int v38 = v9;
      char v46 = sqlite3_errmsg(a1);
      sub_100017164("db_get_item", @"Cannot bind inode int64 %s", v47, v48, v49, v50, v51, v52, v46);
      uint64_t v13 = 0;
      char v37 = 0;
      uint64_t v14 = 0;
      uint64_t v30 = 3;
    }
    else
    {
      int v10 = sqlite3_bind_blob(ppStmt, 2, a2 + 1, 16, 0);
      if (v10)
      {
        int v38 = v10;
        char v53 = sqlite3_errmsg(a1);
        sub_100017164("db_get_item", @"Cannot bind uuid blob %s", v54, v55, v56, v57, v58, v59, v53);
        uint64_t v13 = 0;
        char v37 = 0;
        uint64_t v14 = 0;
        uint64_t v30 = 4;
      }
      else
      {
        int v11 = sqlite3_step(ppStmt);
        if (v11 == 100)
        {
          int v12 = sqlite3_column_bytes(ppStmt, 0);
          uint64_t v13 = (char *)sqlite3_column_text(ppStmt, 1);
          uint64_t v14 = (char *)sqlite3_column_text(ppStmt, 2);
          uint64_t v15 = sqlite3_column_text(ppStmt, 3);
          if (v12 == 108)
          {
            int v22 = sqlite3_column_blob(ppStmt, 0);
            uint64_t v30 = 0;
            long long v32 = v22[1];
            long long v31 = v22[2];
            *a3 = *v22;
            a3[1] = v32;
            a3[2] = v31;
            long long v34 = v22[4];
            long long v33 = v22[5];
            long long v35 = v22[3];
            *(_OWORD *)((char *)a3 + 92) = *(_OWORD *)((char *)v22 + 92);
            a3[4] = v34;
            a3[5] = v33;
            a3[3] = v35;
            goto LABEL_7;
          }
          char v37 = (char *)v15;
          if (v12)
          {
            sub_100017164("db_get_item", @"Invalid Key", v16, v17, v18, v19, v20, v21, v75);
            int v38 = 100;
            uint64_t v30 = 8;
          }
          else
          {
            sub_100017164("db_get_item", @"Cleared Key", v16, v17, v18, v19, v20, v21, v75);
            int v38 = 100;
            uint64_t v30 = 7;
          }
        }
        else
        {
          int v38 = v11;
          sqlite3_errmsg(a1);
          sub_100017164("db_get_item", @"Step failed rc=%d, %s", v60, v61, v62, v63, v64, v65, v38);
          uint64_t v13 = 0;
          char v37 = 0;
          uint64_t v14 = 0;
          uint64_t v30 = 6;
        }
      }
    }
  }
  if (a4)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    int valuePtr = v38;
    CFNumberRef v67 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v67)
    {
      CFNumberRef v74 = v67;
      CFDictionaryAddValue(Mutable, @"sqlError", v67);
      CFRelease(v74);
    }
    else
    {
      sub_100017164("CFDictionaryAddInt", @"Internal error: could not create CFNumber from int", v68, v69, v70, v71, v72, v73, v75);
    }
    sub_100010090(Mutable, @"added", v13);
    sub_100010090(Mutable, @"accessed", v14);
    sub_100010090(Mutable, @"cleared", v37);
    if (*a4) {
      CFRelease(*a4);
    }
    *a4 = CFErrorCreate(kCFAllocatorDefault, @"MobileKeyBagError.DbGetError", v30, Mutable);
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
LABEL_7:
  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  uint64_t v76 = v30;
  sub_100014890((uint64_t)&v76, v23, v24, v25, v26, v27, v28, v29, v75);
  return v30;
}

void sub_100010090(__CFDictionary *a1, const void *a2, char *cStr)
{
  if (cStr)
  {
    char v3 = (char)cStr;
    CFStringRef v6 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
    if (v6)
    {
      CFStringRef v13 = v6;
      CFDictionaryAddValue(a1, a2, v6);
      CFRelease(v13);
    }
    else
    {
      sub_100017164("CFDictionaryAddSQLStringIfNotNull", @"Internal error: could not create CFString from C string %s", v7, v8, v9, v10, v11, v12, v3);
    }
  }
}

uint64_t sub_100010140(sqlite3 *a1, const void *a2)
{
  ppStmt = 0;
  uint64_t v4 = 0xFFFFFFFFLL;
  if (sqlite3_prepare_v2(a1, "DELETE FROM WrappedKeys WHERE Uuid = ?", -1, &ppStmt, 0))
  {
    CFStringRef v6 = @"Failed to execute get statement: %s\n";
  }
  else if (sqlite3_bind_blob(ppStmt, 1, a2, 16, 0))
  {
    uint64_t v4 = 5;
    CFStringRef v6 = @"Cannot bind uuid blob %s";
  }
  else
  {
    if (sqlite3_step(ppStmt) == 101)
    {
      uint64_t v4 = 0;
      goto LABEL_5;
    }
    CFStringRef v6 = @"step failed: %s";
  }
  char v7 = sqlite3_errmsg(a1);
  sub_100017164("db_delete_volume", v6, v8, v9, v10, v11, v12, v13, v7);
LABEL_5:
  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  return v4;
}

uint64_t sub_10001021C(sqlite3 *a1, const void *a2)
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(a1, "UPDATE WrappedKeys SET Flagged = 1 WHERE Uuid = ?", -1, &ppStmt, 0))
  {
    char v6 = sqlite3_errmsg(a1);
    sub_100017164("db_flag_volume", @"Failed to execute get statement: %s\n", v7, v8, v9, v10, v11, v12, v6);
    uint64_t v4 = 0xFFFFFFFFLL;
  }
  else if (sqlite3_bind_blob(ppStmt, 1, a2, 16, 0))
  {
    char v13 = sqlite3_errmsg(a1);
    sub_100017164("db_flag_volume", @"Cannot bind uuid blob %s", v14, v15, v16, v17, v18, v19, v13);
    uint64_t v4 = 5;
  }
  else if (sqlite3_step(ppStmt) == 101)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 0xFFFFFFFFLL;
  }
  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  return v4;
}

uint64_t sub_1000102F4(sqlite3 *a1)
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(a1, "UPDATE WrappedKeys SET Flagged = 1", -1, &ppStmt, 0))
  {
    char v4 = sqlite3_errmsg(a1);
    sub_100017164("db_flag_all", @"Failed to execute get statement: %s\n", v5, v6, v7, v8, v9, v10, v4);
    uint64_t v2 = 0xFFFFFFFFLL;
  }
  else if (sqlite3_step(ppStmt) == 101)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = 0xFFFFFFFFLL;
  }
  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  return v2;
}

uint64_t sub_100010384(sqlite3 *a1, const void *a2)
{
  ppStmt = 0;
  uint64_t v4 = 0xFFFFFFFFLL;
  if (sqlite3_prepare_v2(a1, "UPDATE WrappedKeys SET Key = NULL, Flagged = 0, ClearTime = datetime('now', 'subsec') WHERE Flagged = 1 AND Key NOT NULL AND Uuid = ?", -1, &ppStmt, 0))
  {
    CFStringRef v6 = @"Failed to execute get statement: %s\n";
  }
  else if (sqlite3_bind_blob(ppStmt, 1, a2, 16, 0))
  {
    uint64_t v4 = 5;
    CFStringRef v6 = @"Cannot bind uuid blob %s";
  }
  else
  {
    if (sqlite3_step(ppStmt) == 101)
    {
      uint64_t v4 = 0;
      goto LABEL_5;
    }
    uint64_t v4 = 6;
    CFStringRef v6 = @"step failed: %s";
  }
  char v7 = sqlite3_errmsg(a1);
  sub_100017164("db_clear_flagged_volume", v6, v8, v9, v10, v11, v12, v13, v7);
LABEL_5:
  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  return v4;
}

uint64_t sub_100010464(sqlite3 *a1)
{
  ppStmt = 0;
  uint64_t v2 = 0xFFFFFFFFLL;
  if (sqlite3_prepare_v2(a1, "UPDATE WrappedKeys SET Key = NULL, ClearTime = datetime('now', 'subsec') WHERE Flagged = 1 AND Key NOT NULL;",
         -1,
         &ppStmt,
         0))
  {
    CFStringRef v4 = @"Failed to execute get statement: %s\n";
  }
  else
  {
    if (sqlite3_step(ppStmt) == 101)
    {
      uint64_t v2 = 0;
      goto LABEL_4;
    }
    uint64_t v2 = 6;
    CFStringRef v4 = @"step failed: %s";
  }
  char v5 = sqlite3_errmsg(a1);
  sub_100017164("db_clear_flagged", v4, v6, v7, v8, v9, v10, v11, v5);
LABEL_4:
  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  return v2;
}

uint64_t sub_100010514(sqlite3 *a1, sqlite3_int64 a2)
{
  ppStmt = 0;
  uint64_t v4 = 0xFFFFFFFFLL;
  if (sqlite3_prepare_v2(a1, "DELETE FROM WrappedKeys WHERE Flagged = 1 AND Key IS NULL AND unixepoch('now') - unixepoch(ClearTime) > ? ;",
         -1,
         &ppStmt,
         0))
  {
    CFStringRef v6 = @"Failed to prepare get statement: %s\n";
  }
  else if (sqlite3_bind_int64(ppStmt, 1, a2))
  {
    CFStringRef v6 = @"Cannot bind age: %s\n";
  }
  else
  {
    if (sqlite3_step(ppStmt) == 101)
    {
      uint64_t v4 = 0;
      goto LABEL_5;
    }
    uint64_t v4 = 6;
    CFStringRef v6 = @"step failed: %s";
  }
  char v7 = sqlite3_errmsg(a1);
  sub_100017164("db_delete_flagged_old", v6, v8, v9, v10, v11, v12, v13, v7);
LABEL_5:
  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  return v4;
}

uint64_t sub_1000105E8(const char *a1, int a2, int a3)
{
  char v4 = (char)a1;
  if (a3)
  {
    char v5 = opendir(a1);
    if (v5)
    {
      CFStringRef v6 = v5;
      int v7 = dirfd(v5);
      if (v7 == -1)
      {
        BOOL v10 = 1;
        goto LABEL_16;
      }
      int v8 = v7;
LABEL_7:
      if (fcntl(v8, 63) == 3)
      {
        BOOL v10 = 1;
      }
      else
      {
        int v11 = fcntl(v8, 64, 3);
        BOOL v10 = v11 == 0;
        if (v11 && a2)
        {
          __error();
          sub_100017164("db_move_to_class_c", @"Failed to set class C on file:%s with error %d", v12, v13, v14, v15, v16, v17, v4);
          BOOL v10 = 0;
        }
      }
      if (!v6)
      {
        close(v8);
        return v10;
      }
LABEL_16:
      closedir(v6);
      return v10;
    }
  }
  else
  {
    int v9 = open(a1, 2);
    if (v9 != -1)
    {
      int v8 = v9;
      CFStringRef v6 = 0;
      goto LABEL_7;
    }
  }
  return 1;
}

const void *sub_1000106EC(const __CFDictionary *a1, const void *a2)
{
  double result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    char v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    if (v4 == CFDataGetTypeID()) {
      return v3;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100010728(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2 = -1;
  uint64_t valuePtr = -1;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    CFNumberRef v4 = Value;
    CFTypeID v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberLongLongType, &valuePtr);
      return valuePtr;
    }
    else
    {
      return -1;
    }
  }
  return v2;
}

CFBooleanRef sub_100010794(const __CFDictionary *a1, const void *a2)
{
  CFBooleanRef result = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    CFBooleanRef v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    if (v4 == CFBooleanGetTypeID()) {
      return (const __CFBoolean *)(CFBooleanGetValue(v3) != 0);
    }
    else {
      return 0;
    }
  }
  return result;
}

const void *sub_1000107E8(const __CFDictionary *a1, const void *a2)
{
  CFNumberRef Value = CFDictionaryGetValue(a1, a2);
  if (!Value) {
    return 0;
  }
  CFBooleanRef v3 = Value;
  CFTypeID v4 = CFGetTypeID(Value);
  if (v4 != CFStringGetTypeID()) {
    return 0;
  }
  return v3;
}

BOOL sub_10001082C(const __CFDictionary *a1, const void *a2, char *a3, int a4)
{
  CFStringRef v6 = (const __CFString *)sub_1000107E8(a1, a2);
  return v6 && CFStringGetCString(v6, a3, a4, 0x8000100u);
}

CFTypeRef sub_10001087C(const void *a1)
{
  uint64_t v2 = CFWriteStreamCreateWithAllocatedBuffers(kCFAllocatorDefault, kCFAllocatorDefault);
  if (!v2) {
    return 0;
  }
  CFBooleanRef v3 = v2;
  if (CFWriteStreamOpen(v2))
  {
    if (CFPropertyListWrite(a1, v3, kCFPropertyListBinaryFormat_v1_0, 0, 0) < 1) {
      CFTypeRef v4 = 0;
    }
    else {
      CFTypeRef v4 = CFWriteStreamCopyProperty(v3, kCFStreamPropertyDataWritten);
    }
    CFWriteStreamClose(v3);
  }
  else
  {
    CFTypeRef v4 = 0;
  }
  CFRelease(v3);
  return v4;
}

CFPropertyListRef sub_100010924(UInt8 *bytes, CFIndex length)
{
  CFPropertyListFormat format = kCFPropertyListBinaryFormat_v1_0;
  uint64_t v2 = CFReadStreamCreateWithBytesNoCopy(kCFAllocatorDefault, bytes, length, kCFAllocatorNull);
  if (v2)
  {
    int v9 = v2;
    if (CFReadStreamOpen(v2))
    {
      CFPropertyListRef v22 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v9, 0, 2uLL, &format, 0);
      if (!v22) {
        sub_100017164("convertBinaryToObject", @"Could not create object from stream", v16, v17, v18, v19, v20, v21, v24);
      }
      CFReadStreamClose(v9);
    }
    else
    {
      sub_100017164("convertBinaryToObject", @"Could not open the stream", v10, v11, v12, v13, v14, v15, v24);
      CFPropertyListRef v22 = 0;
    }
    CFRelease(v9);
  }
  else
  {
    sub_100017164("convertBinaryToObject", @"Could not create stream for serialized data", v3, v4, v5, v6, v7, v8, v24);
    return 0;
  }
  return v22;
}

size_t sub_100010A10(int __fd, char *__buf, size_t __nbyte)
{
  size_t v3 = __nbyte;
  if (__nbyte)
  {
    size_t v6 = __nbyte;
    do
    {
      ssize_t v7 = write(__fd, __buf, v6);
      if (v7 == -1)
      {
        if (*__error() != 4) {
          return -1;
        }
        ssize_t v7 = 0;
      }
      __buf += v7;
      v6 -= v7;
    }
    while (v6);
  }
  return v3;
}

uint64_t sub_100010A8C(const void *a1, const char *a2, int *a3)
{
  CFDataRef v5 = (const __CFData *)sub_10001087C(a1);
  if (!v5)
  {
    sub_100017164("store_binary_dict_fd", @"Can't serialize dictionary", v6, v7, v8, v9, v10, v11, v34);
    return 0xFFFFFFFFLL;
  }
  CFDataRef v12 = v5;
  int v13 = open_dprotected_np(a2, 1537, 4, 0, 420);
  if (v13 == -1)
  {
    uint64_t v18 = __error();
    strerror(*v18);
    sub_100017164("store_binary_dict_fd", @"Could not create %s: %s", v19, v20, v21, v22, v23, v24, (char)a2);
    uint64_t v17 = 0xFFFFFFFFLL;
    goto LABEL_7;
  }
  int v14 = v13;
  BytePtr = (char *)CFDataGetBytePtr(v12);
  size_t Length = CFDataGetLength(v12);
  if (sub_100010A10(v14, BytePtr, Length) == -1)
  {
    CFStringRef v25 = @"Could not write to %s: %s";
LABEL_12:
    uint64_t v26 = __error();
    strerror(*v26);
    sub_100017164("store_binary_dict_fd", v25, v27, v28, v29, v30, v31, v32, (char)a2);
    uint64_t v17 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }
  if (fcntl(v14, 51))
  {
    CFStringRef v25 = @"Unable to fsync %s: %s";
    goto LABEL_12;
  }
  uint64_t v17 = 0;
  if (!a3)
  {
LABEL_13:
    CFRelease(v12);
    close(v14);
    return v17;
  }
  *a3 = v14;
LABEL_7:
  CFRelease(v12);
  return v17;
}

uint64_t sub_100010BE4(const void *a1, const char *a2)
{
  return sub_100010A8C(a1, a2, 0);
}

const void *sub_100010BEC(UInt8 *bytes, CFIndex length)
{
  uint64_t v2 = 0;
  CFPropertyListFormat format = kCFPropertyListBinaryFormat_v1_0;
  if (bytes && length)
  {
    uint64_t v4 = CFReadStreamCreateWithBytesNoCopy(kCFAllocatorDefault, bytes, length, kCFAllocatorNull);
    if (!v4)
    {
      sub_100017164("load_binary_dict_from_buffer", @"Could not create stream from serialized data", v5, v6, v7, v8, v9, v10, v27);
      return 0;
    }
    uint64_t v11 = v4;
    if (CFReadStreamOpen(v4))
    {
      CFPropertyListRef v18 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v11, length, 2uLL, &format, 0);
      uint64_t v2 = v18;
      if (!v18)
      {
        sub_100017164("load_binary_dict_from_buffer", @"Could not create dictionary from stream", v19, v20, v21, v22, v23, v24, v27);
        goto LABEL_9;
      }
      CFTypeID v25 = CFGetTypeID(v18);
      if (v25 == CFDictionaryGetTypeID())
      {
LABEL_9:
        CFReadStreamClose(v11);
        CFRelease(v11);
        return v2;
      }
      CFRelease(v2);
    }
    else
    {
      sub_100017164("load_binary_dict_from_buffer", @"Could not open the stream", v12, v13, v14, v15, v16, v17, v27);
    }
    uint64_t v2 = 0;
    goto LABEL_9;
  }
  return v2;
}

const void *sub_100010D10(const char *a1)
{
  char v1 = (char)a1;
  memset(&v31, 0, sizeof(v31));
  int v2 = open(a1, 0);
  if (v2 == -1)
  {
    uint64_t v14 = __error();
    strerror(*v14);
    sub_100017164("load_binary_dict", @"Could not open %s: %s", v15, v16, v17, v18, v19, v20, v1);
    uint64_t v10 = 0;
    uint64_t v12 = 0;
    goto LABEL_7;
  }
  int v3 = v2;
  if (fstat(v2, &v31))
  {
    uint64_t v21 = __error();
    strerror(*v21);
    sub_100017164("load_binary_dict", @"Could not fstat %s: %s", v22, v23, v24, v25, v26, v27, v1);
    uint64_t v12 = 0;
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  uint64_t v10 = malloc_type_malloc(LODWORD(v31.st_size), 0x9026304CuLL);
  if (!v10)
  {
    CFStringRef v28 = @"Could not allocate buffer";
LABEL_12:
    sub_100017164("load_binary_dict", v28, v4, v5, v6, v7, v8, v9, v30);
    uint64_t v12 = 0;
    goto LABEL_6;
  }
  ssize_t v11 = read(v3, v10, v31.st_size);
  if (v11 != v31.st_size)
  {
    uint64_t v29 = __error();
    char v30 = v1;
    strerror(*v29);
    CFStringRef v28 = @"Could not read %s: %s";
    goto LABEL_12;
  }
  uint64_t v12 = sub_100010BEC((UInt8 *)v10, v11);
LABEL_6:
  close(v3);
LABEL_7:
  free(v10);
  return v12;
}

CFMutableDictionaryRef sub_100010E70()
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!result)
  {
    sub_100017164("create_dict", @"Out of Memory!!! Dying!...so...cold....", v1, v2, v3, v4, v5, v6, vars0);
    exit(-1);
  }
  return result;
}

uint64_t sub_100010EC8(uint32_t *a1)
{
  uint32_t multiuser_flags = 0;
  mach_port_t v2 = mach_host_self();
  uint64_t result = host_get_multiuser_config_flags(v2, &multiuser_flags);
  if (a1)
  {
    if (!result) {
      *a1 = multiuser_flags;
    }
  }
  return result;
}

uint64_t sub_100010F10()
{
  int v3 = 0;
  int v0 = sub_100010EC8((uint32_t *)&v3);
  if (v3 >= 0) {
    uint32_t v1 = -1;
  }
  else {
    uint32_t v1 = v3 & 0x3FFFFFFF;
  }
  if (v0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v1;
  }
}

BOOL sub_100010F50()
{
  int v2 = 0;
  return !sub_100010EC8((uint32_t *)&v2) && v2 < 0;
}

uint64_t sub_100010F88(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((int)a1 > -536363001)
  {
    switch(a1)
    {
      case 0xE007C00E:
        return 4294967283;
      case 0xE007C00F:
      case 0xE007C010:
      case 0xE007C011:
      case 0xE007C012:
      case 0xE007C016:
      case 0xE007C017:
        goto LABEL_20;
      case 0xE007C013:
        return 4294967276;
      case 0xE007C014:
        return 0;
      case 0xE007C015:
        return 4294967282;
      case 0xE007C018:
        return 4294967277;
      default:
        if (a1 == -536363000) {
          return 4294967282;
        }
        if (!a1) {
          return v1;
        }
        break;
    }
    goto LABEL_20;
  }
  uint64_t v2 = 4294967294;
  if ((int)a1 <= -536870195)
  {
    switch(a1)
    {
      case 0xE00002C1:
        return v2;
      case 0xE00002C2:
        return 4294967279;
      case 0xE00002C9:
        return 4294967287;
    }
LABEL_20:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = v1;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unexpected AppleKeyStore error: %d\n", (uint8_t *)v4, 8u);
    }
    return 0xFFFFFFFFLL;
  }
  if ((int)a1 > -536870175)
  {
    if (a1 == -536870174) {
      return v2;
    }
    if (a1 == -536870160) {
      return 4294967288;
    }
    goto LABEL_20;
  }
  if (a1 == -536870194) {
    return 4294967293;
  }
  if (a1 != -536870184) {
    goto LABEL_20;
  }
  return 4294967283;
}

uint64_t sub_10001119C(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    uint64_t result = mach_absolute_time();
    *uint64_t v1 = result;
  }
  return result;
}

double sub_1000111CC(uint64_t a1, void *a2)
{
  uint64_t v4 = mach_absolute_time();
  if (qword_1000398F0)
  {
    if (!a2) {
      return result;
    }
  }
  else
  {
    uint64_t v6 = mach_absolute_time();
    qword_1000398F0 = mach_absolute_time() - v6;
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    LODWORD(v8) = info.denom;
    LODWORD(v7) = info.numer;
    double result = (double)v7 / (double)v8;
    qword_1000398F8 = *(void *)&result;
    if (!a2) {
      return result;
    }
  }
  double result = *(double *)&qword_1000398F8 * (double)(v4 - a1 - qword_1000398F0) / 1000.0;
  *a2 = (unint64_t)result;
  return result;
}

uint64_t sub_10001128C()
{
  int v2 = -1;
  uint64_t result = sub_100011504();
  if (result)
  {
    uint64_t result = sub_100011318();
    if (result)
    {
      unsigned int v1 = [[objc_msgSend((id)sub_100011318(), "sharedConnection") unlockScreenTypeWithOutSimplePasscodeType:&v2];
      if (v1 == 2)
      {
        return 4;
      }
      else if (v1 == 1)
      {
        return 3;
      }
      else if (v1)
      {
        return 0;
      }
      else if (v2 == 1)
      {
        return 2;
      }
      else
      {
        return v2 == 0;
      }
    }
  }
  return result;
}

uint64_t sub_100011318()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3052000000;
  uint64_t v6 = sub_100011648;
  unint64_t v7 = sub_100011658;
  uint64_t v0 = qword_100039908;
  uint64_t v8 = qword_100039908;
  if (!qword_100039908)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_100011664;
    v2[3] = &unk_100030C78;
    v2[4] = &v3;
    sub_100011664((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1000113F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011408(unsigned char *a1)
{
  if (!a1 || !sub_1000116E8()) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v2 = (uint64_t (*)(void))off_100039918;
  uint64_t v9 = off_100039918;
  if (!off_100039918)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001182C;
    v5[3] = &unk_100030C78;
    v5[4] = &v6;
    sub_10001182C((uint64_t)v5);
    int v2 = (uint64_t (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2) {
    sub_1000212BC();
  }
  char v3 = v2();
  uint64_t result = 0;
  *a1 = v3;
  return result;
}

void sub_1000114EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011504()
{
  if (!qword_100039900) {
    qword_100039900 = _sl_dlopen();
  }
  return qword_100039900;
}

uint64_t sub_1000115D4()
{
  uint64_t result = _sl_dlopen();
  qword_100039900 = result;
  return result;
}

void sub_100011648(uint64_t a1, uint64_t a2)
{
}

void sub_100011658(uint64_t a1)
{
}

Class sub_100011664(uint64_t a1)
{
  char v3 = 0;
  if (!sub_100011504()) {
    sub_100021324(&v3);
  }
  Class result = objc_getClass("MCProfileConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    sub_10002138C();
  }
  qword_100039908 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t sub_1000116E8()
{
  if (!qword_100039910) {
    qword_100039910 = _sl_dlopen();
  }
  return qword_100039910;
}

uint64_t sub_1000117B8()
{
  uint64_t result = _sl_dlopen();
  qword_100039910 = result;
  return result;
}

void *sub_10001182C(uint64_t a1)
{
  uint64_t v4 = 0;
  int v2 = (void *)sub_1000116E8();
  if (!v2) {
    sub_1000213F4(&v4);
  }
  uint64_t result = dlsym(v2, "MAGetActivationState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100039918 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

CFDictionaryRef sub_1000118B0(const __CFDictionary *result)
{
  if (result) {
    return (const __CFDictionary *)CFDictionaryGetValue(result, @"_DSEUN");
  }
  return result;
}

uint64_t sub_1000118C4(CFMutableDictionaryRef theDict, void *value)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (theDict)
  {
    if (value)
    {
      CFDictionarySetValue(theDict, @"_DSEUN", value);
      return 0;
    }
  }
  return result;
}

CFDictionaryRef sub_100011904(const __CFDictionary *result)
{
  uint64_t valuePtr = 0;
  if (result)
  {
    uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(result, @"_DFAIL");
    if (result)
    {
      CFNumberRef v1 = result;
      CFTypeID v2 = CFGetTypeID(result);
      if (v2 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
        return (const __CFDictionary *)valuePtr;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_100011974(__CFDictionary *a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  CFNumberRef v3 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
  if (!v3)
  {
    sub_100017164("HealthPlistSetFailed", @"unable to allocate", v4, v5, v6, v7, v8, v9, v11);
    return 0xFFFFFFFFLL;
  }
  CFDictionarySetValue(a1, @"_DFAIL", v3);
  return 0;
}

uint64_t sub_1000119F4(CFMutableDictionaryRef theDict, uint64_t a2)
{
  uint64_t valuePtr = a2;
  if (!theDict) {
    return 0xFFFFFFFFLL;
  }
  if (a2 < 1)
  {
    CFDictionaryRemoveValue(theDict, @"_DTTR");
    return 0;
  }
  CFNumberRef v3 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
  if (!v3)
  {
    sub_100017164("HealthPlistSetTTR", @"unable to allocate", v4, v5, v6, v7, v8, v9, v12);
    return 0xFFFFFFFFLL;
  }
  CFNumberRef v10 = v3;
  CFDictionarySetValue(theDict, @"_DTTR", v3);
  CFRelease(v10);
  return 0;
}

uint64_t sub_100011A9C(CFDictionaryRef theDict, void *a2)
{
  uint64_t valuePtr = 0;
  uint64_t result = 0xFFFFFFFFLL;
  if (theDict && a2)
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"_DTTR");
    if (Value)
    {
      if (CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr))
      {
        CFDictionaryRemoveValue(theDict, @"_DTTR");
        uint64_t result = 0;
        *a2 = valuePtr;
        return result;
      }
      sub_100017164("HealthPlistConsumeTTR", @"invalid ttr format", v6, v7, v8, v9, v10, v11, v12);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_100011B34(__CFDictionary *a1, int a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  if (v3)
  {
    CFDictionarySetValue(a1, @"_DVERS", v3);
    return 0;
  }
  else
  {
    sub_100017164("HealthPlistSetVersion", @"cant allocate mem", v4, v5, v6, v7, v8, v9, v11);
    return 0xFFFFFFFFLL;
  }
}

CFDictionaryRef sub_100011BC0(const __CFDictionary *result)
{
  uint64_t valuePtr = 0;
  if (result)
  {
    uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(result, @"_DTIME");
    if (result)
    {
      CFNumberRef v1 = result;
      CFTypeID v2 = CFGetTypeID(result);
      if (v2 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
        return (const __CFDictionary *)valuePtr;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_100011C30(__CFDictionary *a1, uint64_t a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
  if (v3)
  {
    CFDictionarySetValue(a1, @"_DTIME", v3);
    return 0;
  }
  else
  {
    sub_100017164("HealthPlistSetTime", @"cant allocate mem", v4, v5, v6, v7, v8, v9, v11);
    return 0xFFFFFFFFLL;
  }
}

CFDictionaryRef sub_100011CBC(const __CFDictionary *result)
{
  if (result) {
    return (const __CFDictionary *)CFDictionaryGetValue(result, @"_DDATA");
  }
  return result;
}

uint64_t sub_100011CD0(const __CFDictionary *a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  CFNumberRef v3 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
  if (!v3)
  {
    sub_100017164("HealthPlistAddToData", @"unable to allocate", v4, v5, v6, v7, v8, v9, v20);
    return 0xFFFFFFFFLL;
  }
  CFNumberRef v10 = v3;
  CFNumberRef Value = (__CFArray *)CFDictionaryGetValue(a1, @"_DDATA");
  if (Value)
  {
    Mutable = Value;
    CFRetain(Value);
  }
  else
  {
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  }
  CFArrayAppendValue(Mutable, v10);
  if (CFArrayGetCount(Mutable) >= 15)
  {
    sub_100017164("HealthPlistAddToData", @"at capacity, forgetting oldest data entry", v13, v14, v15, v16, v17, v18, v20);
    CFArrayRemoveValueAtIndex(Mutable, 0);
  }
  CFDictionarySetValue(a1, @"_DDATA", Mutable);
  CFRelease(v10);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return 0;
}

CFDictionaryRef sub_100011DE8()
{
  CFDictionaryRef v0 = (const __CFDictionary *)sub_100010D10("/var/root/.mkb_seshat_health");
  if (v0)
  {
    CFDictionaryRef Mutable = v0;
    int valuePtr = 0;
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v0, @"_DVERS");
    if (!Value)
    {
      CFStringRef v54 = @"no version";
      goto LABEL_34;
    }
    CFNumberRef v15 = Value;
    CFTypeID v16 = CFGetTypeID(Value);
    if (v16 == CFNumberGetTypeID())
    {
      uint64_t v58 = 0;
      if (CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr))
      {
        if (valuePtr != 7)
        {
          sub_100017164("validate_health_plist", @"non-current version %d", v9, v10, v11, v12, v13, v14, valuePtr);
          goto LABEL_28;
        }
        CFNumberRef v17 = (const __CFNumber *)CFDictionaryGetValue(Mutable, @"_DTIME");
        if (v17)
        {
          CFNumberRef v18 = v17;
          CFTypeID v19 = CFGetTypeID(v17);
          if (v19 != CFNumberGetTypeID())
          {
            CFStringRef v54 = @"time stamp is of wrong type";
            goto LABEL_34;
          }
          if (!CFNumberGetValue(v18, kCFNumberLongType, &v58))
          {
            CFStringRef v54 = @"invalid timestamp";
            goto LABEL_34;
          }
        }
        char v20 = (__CFArray *)CFDictionaryGetValue(Mutable, @"_DDATA");
        CFMutableArrayRef MutableCopy = v20;
        if (!v20)
        {
LABEL_17:
          CFNumberRef v26 = (const __CFNumber *)CFDictionaryGetValue(Mutable, @"_DFAIL");
          if (!v26) {
            goto LABEL_20;
          }
          CFNumberRef v27 = v26;
          uint64_t v57 = 0;
          CFTypeID v28 = CFGetTypeID(v26);
          if (v28 != CFNumberGetTypeID())
          {
            CFStringRef v55 = @"fail indicator is of wrong type";
            goto LABEL_47;
          }
          if (!CFNumberGetValue(v27, kCFNumberLongType, &v57))
          {
            CFStringRef v55 = @"invalid fail indicator";
          }
          else
          {
LABEL_20:
            long long v35 = CFDictionaryGetValue(Mutable, @"_DSEUN");
            if (v35 && (CFTypeID v36 = CFGetTypeID(v35), v36 != CFStringGetTypeID()))
            {
              CFStringRef v55 = @"build is of wrong type";
            }
            else
            {
              CFNumberRef v37 = (const __CFNumber *)CFDictionaryGetValue(Mutable, @"_DTTR");
              if (!v37) {
                goto LABEL_25;
              }
              CFNumberRef v38 = v37;
              CFTypeID v39 = CFGetTypeID(v37);
              if (v39 == CFNumberGetTypeID())
              {
                if (CFNumberGetValue(v38, kCFNumberSInt64Type, &v58))
                {
LABEL_25:
                  char v40 = 1;
                  if (!MutableCopy) {
                    goto LABEL_27;
                  }
                  goto LABEL_26;
                }
                CFStringRef v55 = @"invalid ttr timestamp";
              }
              else
              {
                CFStringRef v55 = @"ttr time stamp is of wrong type";
              }
            }
          }
LABEL_47:
          sub_100017164("validate_health_plist", v55, v29, v30, v31, v32, v33, v34, v56);
          char v40 = 0;
          if (!MutableCopy)
          {
LABEL_27:
            if (v40) {
              goto LABEL_30;
            }
            goto LABEL_28;
          }
LABEL_26:
          CFRelease(MutableCopy);
          goto LABEL_27;
        }
        CFTypeID v22 = CFGetTypeID(v20);
        if (v22 == CFArrayGetTypeID())
        {
          if (CFArrayGetCount(MutableCopy) >= 1)
          {
            CFIndex v23 = 0;
            while (1)
            {
              CFNumberRef ValueAtIndex = CFArrayGetValueAtIndex(MutableCopy, v23);
              if (!ValueAtIndex) {
                break;
              }
              CFTypeID v25 = CFGetTypeID(ValueAtIndex);
              if (v25 != CFNumberGetTypeID()) {
                break;
              }
              if (CFArrayGetCount(MutableCopy) <= ++v23) {
                goto LABEL_16;
              }
            }
            CFStringRef v54 = @"data inconsistent";
            goto LABEL_34;
          }
LABEL_16:
          CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, MutableCopy);
          CFDictionarySetValue(Mutable, @"_DDATA", MutableCopy);
          goto LABEL_17;
        }
        CFStringRef v54 = @"data is of wrong type";
      }
      else
      {
        CFStringRef v54 = @"invalid version format";
      }
    }
    else
    {
      CFStringRef v54 = @"version is of wrong type";
    }
LABEL_34:
    sub_100017164("validate_health_plist", v54, v9, v10, v11, v12, v13, v14, v56);
LABEL_28:
    CFRelease(Mutable);
  }
  sub_100017164("HealthPlistCopyOrCreateNew", @"health plist doesnt exist or wrong version, creating new one", v1, v2, v3, v4, v5, v6, v56);
  CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    sub_100017164("HealthPlistCopyOrCreateNew", @"Can't create dict", v41, v42, v43, v44, v45, v46, v56);
    return Mutable;
  }
LABEL_30:
  if (sub_100011B34(Mutable, 7))
  {
    sub_100017164("HealthPlistCopyOrCreateNew", @"cant set version", v47, v48, v49, v50, v51, v52, v56);
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

uint64_t sub_1000121C8(const void *a1)
{
  if (sub_100010BE4(a1, "/var/root/.mkb_seshat_health")) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t sub_1000121F0(CFStringRef theString1, unsigned int a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  if (!theString1 || a2 && arc4random() % a2) {
    return 0xFFFFFFFFLL;
  }
  int v4 = sub_1000125B4(theString1);
  uint64_t v79 = v4;
  if (v4 == -1)
  {
    CFStringRef v73 = @"unsupported key";
LABEL_32:
    sub_100017164("analytics_persist_event", v73, v5, v6, v7, v8, v9, v10, v77);
    return 0xFFFFFFFFLL;
  }
  CFDictionaryRef Mutable = sub_10001261C();
  if (!Mutable)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (!Mutable)
    {
      CFStringRef v73 = @"Can't create dict";
      goto LABEL_32;
    }
  }
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(Mutable, @"DATA");
  if (Value)
  {
    CFArrayRef v13 = Value;
    CFTypeID v14 = CFGetTypeID(Value);
    if (v14 != CFArrayGetTypeID())
    {
      CFStringRef v74 = @"wrong type";
      goto LABEL_45;
    }
    CFAllocatorRef v21 = kCFAllocatorDefault;
    CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, v13);
  }
  else
  {
    CFAllocatorRef v21 = kCFAllocatorDefault;
    CFMutableArrayRef MutableCopy = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  }
  CFIndex v23 = MutableCopy;
  if (!MutableCopy)
  {
    CFStringRef v74 = @"unable to allocate array";
LABEL_45:
    sub_100017164("analytics_persist_event", v74, v15, v16, v17, v18, v19, v20, v77);
    CFDictionaryRef v75 = Mutable;
    goto LABEL_46;
  }
  CFNumberRef v24 = CFNumberCreate(v21, kCFNumberSInt64Type, &valuePtr);
  if (!v24)
  {
    sub_100017164("analytics_persist_event", @"unable to allocate", v25, v26, v27, v28, v29, v30, v77);
    CFRelease(Mutable);
    CFDictionaryRef v75 = v23;
LABEL_46:
    CFRelease(v75);
    return 0xFFFFFFFFLL;
  }
  CFNumberRef v31 = v24;
  CFNumberRef v38 = CFNumberCreate(v21, kCFNumberSInt64Type, &v79);
  if (v38)
  {
    CFTypeID v39 = CFArrayCreateMutable(v21, 0, &kCFTypeArrayCallBacks);
    char v40 = v39;
    if (v39)
    {
      CFArrayAppendValue(v39, v38);
      CFArrayAppendValue(v40, v31);
      CFArrayAppendValue(v23, v40);
      if (CFArrayGetCount(v23) >= 6)
      {
        sub_100017164("analytics_persist_event", @"at capacity, discarding oldest data entry", v41, v42, v43, v44, v45, v46, v77);
        CFArrayRemoveValueAtIndex(v23, 0);
      }
      CFDictionarySetValue(Mutable, @"DATA", v23);
      int v78 = 0;
      CFNumberRef v47 = CFNumberCreate(v21, kCFNumberSInt32Type, &v78);
      if (v47)
      {
        CFNumberRef v48 = v47;
        CFDictionarySetValue(Mutable, @"VERS", v47);
        io_registry_entry_t v49 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
        CFTypeRef v50 = sub_10001087C(Mutable);
        if (v50)
        {
          uint64_t v57 = v50;
          if (IORegistryEntrySetCFProperty(v49, @"mkb-reports", v50))
          {
            sub_100017164("SetPersistedReports", @"cant set", v58, v59, v60, v61, v62, v63, v77);
            int v64 = -1;
          }
          else
          {
            int v64 = 0;
          }
          CFRelease(v57);
          if (!v49) {
            goto LABEL_23;
          }
        }
        else
        {
          sub_100017164("SetPersistedReports", @"Can't serialize dictionary", v51, v52, v53, v54, v55, v56, v77);
          int v64 = -1;
          if (!v49) {
            goto LABEL_23;
          }
        }
        IOObjectRelease(v49);
LABEL_23:
        if (v64)
        {
          sub_100017164("analytics_persist_event", @"failed to persist dict", v65, v66, v67, v68, v69, v70, v77);
          uint64_t v71 = 0xFFFFFFFFLL;
        }
        else
        {
          uint64_t v71 = 0;
        }
        CFRelease(v48);
        CFRelease(Mutable);
        CFRelease(v31);
        goto LABEL_26;
      }
      CFStringRef v76 = @"cant allocate mem";
    }
    else
    {
      CFStringRef v76 = @"cant allocate";
    }
  }
  else
  {
    char v40 = 0;
    CFStringRef v76 = @"unable to allocate";
  }
  sub_100017164("analytics_persist_event", v76, v32, v33, v34, v35, v36, v37, v77);
  CFRelease(Mutable);
  CFRelease(v31);
  uint64_t v71 = 0xFFFFFFFFLL;
  if (v38) {
LABEL_26:
  }
    CFRelease(v38);
  CFRelease(v23);
  if (v40) {
    CFRelease(v40);
  }
  return v71;
}

uint64_t sub_1000125B4(CFStringRef theString1)
{
  if (!theString1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = 0;
  for (i = (CFStringRef *)&off_100039788; !*i || CFStringCompare(theString1, *i, 1uLL); i += 2)
  {
    if (++v2 == 4) {
      return 0xFFFFFFFFLL;
    }
  }
  return v2;
}

CFDictionaryRef sub_10001261C()
{
  io_registry_entry_t v0 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v0) {
    return 0;
  }
  io_object_t v1 = v0;
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v0, @"mkb-reports", kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    IOObjectRelease(v1);
    return 0;
  }
  CFDataRef v3 = CFProperty;
  BytePtr = (UInt8 *)CFDataGetBytePtr(CFProperty);
  CFIndex Length = CFDataGetLength(v3);
  CFDictionaryRef v6 = (const __CFDictionary *)sub_100010BEC(BytePtr, Length);
  CFDictionaryRef v7 = v6;
  if (!v6) {
    goto LABEL_24;
  }
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v6, @"VERS");
  if (!Value)
  {
    CFStringRef v28 = @"no version";
LABEL_22:
    sub_100017164("analytics_persistance_validate_dict", v28, v9, v10, v11, v12, v13, v14, v36);
LABEL_23:
    CFRelease(v7);
    sub_100017164("CopyPersistedReports", @"invalid dict", v29, v30, v31, v32, v33, v34, v37);
    CFDictionaryRef v7 = 0;
    goto LABEL_24;
  }
  CFNumberRef v15 = Value;
  CFTypeID v16 = CFGetTypeID(Value);
  if (v16 != CFNumberGetTypeID())
  {
    CFStringRef v28 = @"version is of wrong type";
    goto LABEL_22;
  }
  int valuePtr = 0;
  if (!CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr))
  {
    CFStringRef v28 = @"invalid version format";
    goto LABEL_22;
  }
  if (valuePtr)
  {
    sub_100017164("analytics_persistance_validate_dict", @"non-current version %d", v9, v10, v11, v12, v13, v14, valuePtr);
    goto LABEL_23;
  }
  CFArrayRef v17 = (const __CFArray *)CFDictionaryGetValue(v7, @"DATA");
  if (!v17)
  {
    CFStringRef v28 = @"no data";
    goto LABEL_22;
  }
  CFArrayRef v18 = v17;
  CFTypeID v19 = CFGetTypeID(v17);
  if (v19 != CFArrayGetTypeID())
  {
    CFStringRef v28 = @"data is of wrong type";
    goto LABEL_22;
  }
  if (CFArrayGetCount(v18) > 5)
  {
    CFStringRef v28 = @"too many entries";
    goto LABEL_22;
  }
  if (CFArrayGetCount(v18) >= 1)
  {
    CFIndex v20 = 0;
    while (2)
    {
      CFNumberRef ValueAtIndex = CFArrayGetValueAtIndex(v18, v20);
      CFTypeID v22 = CFGetTypeID(ValueAtIndex);
      if (v22 == CFArrayGetTypeID())
      {
        if (CFArrayGetCount((CFArrayRef)ValueAtIndex) == 2)
        {
          CFIndex v23 = 0;
          char v24 = 1;
          do
          {
            char v25 = v24;
            uint64_t v26 = CFArrayGetValueAtIndex((CFArrayRef)ValueAtIndex, v23);
            if (!v26 || (CFTypeID v27 = CFGetTypeID(v26), v27 != CFNumberGetTypeID()))
            {
              char v36 = v23;
              CFStringRef v28 = @"sub%d is of wrong type";
              goto LABEL_22;
            }
            char v24 = 0;
            CFIndex v23 = 1;
          }
          while ((v25 & 1) != 0);
          if (CFArrayGetCount(v18) > ++v20) {
            continue;
          }
          break;
        }
        CFStringRef v28 = @"sub has unexpected number of data";
      }
      else
      {
        CFStringRef v28 = @"sub is of wrong type";
      }
      goto LABEL_22;
    }
  }
LABEL_24:
  IOObjectRelease(v1);
  CFRelease(v3);
  return v7;
}

uint64_t sub_100012900(uint64_t a1)
{
  unint64_t v20 = 0;
  uint64_t valuePtr = 0;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  CFDictionaryRef v2 = sub_10001261C();
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  CFDictionaryRef v3 = v2;
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v2, @"DATA");
  if (Value)
  {
    CFArrayRef v11 = Value;
    if (CFArrayGetCount(Value) >= 1)
    {
      CFIndex v12 = 0;
      do
      {
        CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(v11, v12);
        CFNumberRef v14 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
        CFNumberGetValue(v14, kCFNumberSInt64Type, &v20);
        CFNumberRef v15 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 1);
        CFNumberGetValue(v15, kCFNumberSInt64Type, &valuePtr);
        if (v20 <= 0xFFFFFFFE && (v20 & 0xFFFFFFFC) == 0)
        {
          uint64_t v17 = *((void *)&off_100039788 + 2 * v20);
          if (v17) {
            (*(void (**)(uint64_t, uint64_t, uint64_t, void, uint64_t))(a1 + 16))(a1, v17, 1, 0, valuePtr);
          }
        }
        ++v12;
      }
      while (CFArrayGetCount(v11) > v12);
    }
    uint64_t v18 = 0;
  }
  else
  {
    sub_100017164("analytics_iterate_persisted_eventsWithBlock", @"no data", v5, v6, v7, v8, v9, v10, v20);
    uint64_t v18 = 0xFFFFFFFFLL;
  }
  CFRelease(v3);
  return v18;
}

uint64_t sub_100012A44(uint64_t a1)
{
  kern_return_t v8;
  char v10;

  if (sub_100012900(a1)) {
    return 0xFFFFFFFFLL;
  }
  io_registry_entry_t v1 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  uint64_t v8 = IORegistryEntrySetCFProperty(v1, @"IONVRAM-DELETE-PROPERTY", @"mkb-reports");
  if (v8)
  {
    sub_100017164("DeletePersistedReports", @"cant delete", v2, v3, v4, v5, v6, v7, v10);
    if (!v1) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (v1) {
LABEL_4:
  }
    IOObjectRelease(v1);
LABEL_5:
  if (!v8) {
    return 0;
  }
  sub_100017164("analytics_submit_persisted_eventsWithBlock", @"cant delete", v2, v3, v4, v5, v6, v7, v10);
  return 0xFFFFFFFFLL;
}

uint64_t sub_100012AEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = a1;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000;
  char v15 = 0;
  if (a1)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 0x40000000;
    v11[2] = sub_100012BC0;
    v11[3] = &unk_100030F68;
    v11[4] = &v12;
    v11[5] = a1;
    sub_100012900((uint64_t)v11);
  }
  sub_100017164("analytics_is_event_persisted", @"event %@ is already persisted: %d", a3, a4, a5, a6, a7, a8, v8);
  uint64_t v9 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t sub_100012BC0(uint64_t a1, const void *a2)
{
  if (CFEqual(*(CFTypeRef *)(a1 + 40), a2)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return 0;
}

uint64_t sub_100012C00()
{
  return sub_100012A44((uint64_t)&stru_100030FA8);
}

int sub_100012C0C(id a1, __CFString *a2, BOOL a3, int a4, int64_t a5)
{
  BOOL v6 = a3;
  char CStringPtr = CFStringGetCStringPtr(a2, 0x8000100u);
  sub_100017164("analytics_submit_persisted_events_block_invoke", @"persisted-report-submit %s:%llx", v9, v10, v11, v12, v13, v14, CStringPtr);
  unsigned int v15 = sub_1000125B4(a2);
  if (v15 <= 3) {
    (*((void (**)(int64_t))&off_100039788 + 2 * v15 + 1))(a5);
  }

  return sub_100015844((uint64_t)a2, v6, 0);
}

void sub_100012CB4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9 = a1;
  sub_100013A34(&v9, a2, a3, a4, a5, a6, a7, a8, v8);
}

void sub_100012CDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1;
  sub_100014048(&v9, a2, a3, a4, a5, a6, a7, a8, v8);
}

void sub_100012D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1;
  sub_1000141A8(&v9, a2, a3, a4, a5, a6, a7, a8, v8);
}

void sub_100012D2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1;
  sub_100014C34(&v9, a2, a3, a4, a5, a6, a7, a8, v8);
}

void sub_100012D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (&_analytics_send_event_lazy)
  {
    analytics_send_event_lazy();
  }
  else
  {
    sub_100017164("analytics_send_nfc_hardware_state", @"CA fwk missing, not sending event", a3, a4, a5, a6, a7, a8, a9);
  }
}

xpc_object_t sub_100012DF4(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "timedout", **(unsigned char **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "duration", *(unsigned int *)(*(void *)(a1 + 32) + 4));
  xpc_dictionary_set_uint64(v2, "state", *(unsigned int *)(*(void *)(a1 + 32) + 8));
  return v2;
}

void sub_100012E70(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_100017164("analytics_send_passcode_status", @"AnalyticsEvent: is_set: %llu, type: %llu, activation_status: %llu, inactivity_reboot: %llu, hours_since_locked: %llu, version: %llu", a3, a4, a5, a6, a7, a8, *a1);
  if (&_analytics_send_event_lazy)
  {
    analytics_send_event_lazy();
  }
  else
  {
    sub_100017164("analytics_send_passcode_status", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t sub_100012F60(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "is_set", **(unsigned char **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "type", *(unsigned int *)(*(void *)(a1 + 32) + 4));
  xpc_dictionary_set_uint64(v2, "activation_status", *(unsigned int *)(*(void *)(a1 + 32) + 8));
  xpc_dictionary_set_BOOL(v2, "inactivity_reboot", *(unsigned char *)(*(void *)(a1 + 32) + 12));
  xpc_dictionary_set_uint64(v2, "hours_since_locked", *(unsigned int *)(*(void *)(a1 + 32) + 16));
  xpc_dictionary_set_uint64(v2, "version", *(unsigned __int8 *)(*(void *)(a1 + 32) + 20));
  return v2;
}

void sub_100013024(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_100017164("analytics_send_seshat_debug", @"AnalyticsEvent: debug: %llu", a3, a4, a5, a6, a7, a8, *a1);
  if (&_analytics_send_event_lazy)
  {
    analytics_send_event_lazy();
  }
  else
  {
    sub_100017164("analytics_send_seshat_debug", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t sub_1000130FC(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "debug", **(void **)(a1 + 32));
  return v2;
}

void sub_100013148(__int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  __int16 v9 = *a1;
  *a1 = *a1 & 0xFC3F | 0x80;
  sub_100017164("analytics_send_seshat_enroll", @"AnalyticsEvent: X: %llu, Sampling: %llu, Vslot: %llu, version: %llu, WCProtected: %llu, SEPRMProtected: %llu, AKPUProtected: %llu, PSProtected: %llu, SeshatRM: %llu, unhealthy: %llu", a3, a4, a5, a6, a7, a8, v9 & 1);
  if (sub_10001FD4C(v10, v11, v12, v13, v14, v15, v16, v17))
  {
    if (&_analytics_send_event_lazy)
    {
      analytics_send_event_lazy();
      return;
    }
    CFStringRef v24 = @"CA fwk missing, not sending event";
  }
  else
  {
    CFStringRef v24 = @"runtime condition not sastisifed";
  }

  sub_100017164("analytics_send_seshat_enroll", v24, v18, v19, v20, v21, v22, v23, a9);
}

xpc_object_t sub_100013280(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "X", **(_WORD **)(a1 + 32) & 1);
  xpc_dictionary_set_uint64(v2, "Sampling", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 1) & 1);
  xpc_dictionary_set_uint64(v2, "Vslot", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 2) & 0xF);
  xpc_dictionary_set_uint64(v2, "version", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 6) & 0xF);
  xpc_dictionary_set_uint64(v2, "WCProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 10) & 1);
  xpc_dictionary_set_uint64(v2, "SEPRMProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 11) & 1);
  xpc_dictionary_set_uint64(v2, "AKPUProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 12) & 1);
  xpc_dictionary_set_uint64(v2, "PSProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 13) & 1);
  xpc_dictionary_set_uint64(v2, "SeshatRM", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 14) & 1);
  xpc_dictionary_set_uint64(v2, "unhealthy", (unint64_t)**(unsigned __int16 **)(a1 + 32) >> 15);
  return v2;
}

void sub_1000133CC(__int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  __int16 v9 = *a1;
  *a1 = *a1 & 0xFC3F | 0x80;
  sub_100017164("analytics_send_seshat_unenroll", @"AnalyticsEvent: X: %llu, Sampling: %llu, Vslot: %llu, version: %llu, WCProtected: %llu, SEPRMProtected: %llu, AKPUProtected: %llu, PSProtected: %llu, SeshatRM: %llu, unhealthy: %llu", a3, a4, a5, a6, a7, a8, v9 & 1);
  if (sub_10001FD4C(v10, v11, v12, v13, v14, v15, v16, v17))
  {
    if (&_analytics_send_event_lazy)
    {
      analytics_send_event_lazy();
      return;
    }
    CFStringRef v24 = @"CA fwk missing, not sending event";
  }
  else
  {
    CFStringRef v24 = @"runtime condition not sastisifed";
  }

  sub_100017164("analytics_send_seshat_unenroll", v24, v18, v19, v20, v21, v22, v23, a9);
}

xpc_object_t sub_100013504(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "X", **(_WORD **)(a1 + 32) & 1);
  xpc_dictionary_set_uint64(v2, "Sampling", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 1) & 1);
  xpc_dictionary_set_uint64(v2, "Vslot", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 2) & 0xF);
  xpc_dictionary_set_uint64(v2, "version", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 6) & 0xF);
  xpc_dictionary_set_uint64(v2, "WCProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 10) & 1);
  xpc_dictionary_set_uint64(v2, "SEPRMProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 11) & 1);
  xpc_dictionary_set_uint64(v2, "AKPUProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 12) & 1);
  xpc_dictionary_set_uint64(v2, "PSProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 13) & 1);
  xpc_dictionary_set_uint64(v2, "SeshatRM", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 14) & 1);
  xpc_dictionary_set_uint64(v2, "unhealthy", (unint64_t)**(unsigned __int16 **)(a1 + 32) >> 15);
  return v2;
}

void sub_100013650(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_100017164("analytics_send_seshat_eol", @"AnalyticsEvent: occured: %llu", a3, a4, a5, a6, a7, a8, *a1 & 1);
  if (sub_10001FD4C(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    if (&_analytics_send_event_lazy)
    {
      analytics_send_event_lazy();
      return;
    }
    CFStringRef v23 = @"CA fwk missing, not sending event";
  }
  else
  {
    CFStringRef v23 = @"runtime condition not sastisifed";
  }

  sub_100017164("analytics_send_seshat_eol", v23, v17, v18, v19, v20, v21, v22, a9);
}

xpc_object_t sub_100013748(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "occured", **(unsigned char **)(a1 + 32) & 1);
  return v2;
}

void sub_100013798(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v9 = *((unsigned __int16 *)a1 + 2);
  int v10 = v9 | (*((unsigned __int8 *)a1 + 6) << 16);
  unsigned int v11 = *a1;
  *((_WORD *)a1 + 2) = v9;
  *((unsigned char *)a1 + 6) = BYTE2(v10);
  *a1 = v11 & 0xFFFFFF1F | 0x60;
  sub_100017164("analytics_send_preflight_result", @"AnalyticsEvent: reason: %llu, version: %llu, nf_result: %llu, applet_result: %llu, num_fails: %llu, num_preflights: %llu, failed: %llu, calling_ctx: %llu, jcop_seq_gen: %llu, jcop_seq_gen2: %llu", a3, a4, a5, a6, a7, a8, v11 & 0x1F);
  if (sub_10001FD4C(v12, v13, v14, v15, v16, v17, v18, v19))
  {
    if (&_analytics_send_event_lazy)
    {
      analytics_send_event_lazy();
      return;
    }
    CFStringRef v26 = @"CA fwk missing, not sending event";
  }
  else
  {
    CFStringRef v26 = @"runtime condition not sastisifed";
  }

  sub_100017164("analytics_send_preflight_result", v26, v20, v21, v22, v23, v24, v25, a9);
}

xpc_object_t sub_1000138F8(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "reason", **(_DWORD **)(a1 + 32) & 0x1FLL);
  xpc_dictionary_set_uint64(v2, "version", **(_DWORD **)(a1 + 32) >> 5);
  xpc_dictionary_set_uint64(v2, "nf_result", *(unsigned __int8 *)(*(void *)(a1 + 32) + 1));
  xpc_dictionary_set_uint64(v2, "applet_result", *(unsigned __int16 *)(*(void *)(a1 + 32) + 2));
  xpc_dictionary_set_uint64(v2, "num_fails", *(unsigned __int8 *)(*(void *)(a1 + 32) + 4));
  xpc_dictionary_set_uint64(v2, "num_preflights", *(unsigned __int8 *)(*(void *)(a1 + 32) + 5));
  xpc_dictionary_set_uint64(v2, "failed", *(unsigned char *)(*(void *)(a1 + 32) + 6) & 1);
  xpc_dictionary_set_uint64(v2, "calling_ctx", ((unint64_t)*(unsigned __int8 *)(*(void *)(a1 + 32) + 6) >> 1) & 3);
  xpc_dictionary_set_uint64(v2, "jcop_seq_gen", ((unint64_t)*(unsigned __int8 *)(*(void *)(a1 + 32) + 6) >> 3) & 1);
  xpc_dictionary_set_uint64(v2, "jcop_seq_gen2", ((unint64_t)*(unsigned __int8 *)(*(void *)(a1 + 32) + 6) >> 4) & 1);
  return v2;
}

void sub_100013A34(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  *a1 = *a1 & 0xFFFFFFFFFFFFFFF8 | 5;
  sub_100017164("analytics_send_seshat_recovery_required", @"AnalyticsEvent: version: %llu, context: %llu, timedout: %llu, padding: %llu, nf_result: %llu, applet_result: %llu, reason: %llu", a3, a4, a5, a6, a7, a8, 5);
  if (sub_10001FD4C(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    if (&_analytics_send_event_lazy)
    {
      analytics_send_event_lazy();
      return;
    }
    CFStringRef v23 = @"CA fwk missing, not sending event";
  }
  else
  {
    CFStringRef v23 = @"runtime condition not sastisifed";
  }

  sub_100017164("analytics_send_seshat_recovery_required", v23, v17, v18, v19, v20, v21, v22, a9);
}

xpc_object_t sub_100013B5C(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "version", **(void **)(a1 + 32) & 7);
  xpc_dictionary_set_uint64(v2, "context", (**(void **)(a1 + 32) >> 3) & 7);
  xpc_dictionary_set_uint64(v2, "timedout", (**(void **)(a1 + 32) >> 6) & 1);
  xpc_dictionary_set_uint64(v2, "padding", (**(void **)(a1 + 32) >> 7) & 1);
  xpc_dictionary_set_uint64(v2, "nf_result", *(unsigned int *)(*(void *)(a1 + 32) + 1));
  xpc_dictionary_set_uint64(v2, "applet_result", *(unsigned __int16 *)(*(void *)(a1 + 32) + 5));
  xpc_dictionary_set_uint64(v2, "reason", *(unsigned __int8 *)(*(void *)(a1 + 32) + 7));
  return v2;
}

void sub_100013C48(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_100017164("analytics_send_seshat_recovery_success", @"AnalyticsEvent: occured: %llu", a3, a4, a5, a6, a7, a8, *a1 & 1);
  if (sub_10001FD4C(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    if (&_analytics_send_event_lazy)
    {
      analytics_send_event_lazy();
      return;
    }
    CFStringRef v23 = @"CA fwk missing, not sending event";
  }
  else
  {
    CFStringRef v23 = @"runtime condition not sastisifed";
  }

  sub_100017164("analytics_send_seshat_recovery_success", v23, v17, v18, v19, v20, v21, v22, a9);
}

xpc_object_t sub_100013D40(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "occured", **(unsigned char **)(a1 + 32) & 1);
  return v2;
}

void sub_100013D90(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_100017164("analytics_send_seshat_unexpected_sentinel", @"AnalyticsEvent: occured: %llu", a3, a4, a5, a6, a7, a8, *a1);
  if (sub_10001FD4C(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    if (&_analytics_send_event_lazy)
    {
      analytics_send_event_lazy();
      return;
    }
    CFStringRef v23 = @"CA fwk missing, not sending event";
  }
  else
  {
    CFStringRef v23 = @"runtime condition not sastisifed";
  }

  sub_100017164("analytics_send_seshat_unexpected_sentinel", v23, v17, v18, v19, v20, v21, v22, a9);
}

xpc_object_t sub_100013E84(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "occured", **(void **)(a1 + 32));
  return v2;
}

void sub_100013ED0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_100017164("analytics_send_seshat_write_count", @"AnalyticsEvent: writes: %llu", a3, a4, a5, a6, a7, a8, *a1);
  if (sub_10001FD4C(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    HIDWORD(v23) = -858993459 * arc4random();
    LODWORD(v23) = HIDWORD(v23);
    if ((v23 >> 1) >= 0x1999999A)
    {
      CFStringRef v24 = @"sampling condition not sastisifed";
    }
    else
    {
      if (&_analytics_send_event_lazy)
      {
        analytics_send_event_lazy();
        return;
      }
      CFStringRef v24 = @"CA fwk missing, not sending event";
    }
  }
  else
  {
    CFStringRef v24 = @"runtime condition not sastisifed";
  }

  sub_100017164("analytics_send_seshat_write_count", v24, v17, v18, v19, v20, v21, v22, a9);
}

xpc_object_t sub_100013FFC(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "writes", **(void **)(a1 + 32));
  return v2;
}

void sub_100014048(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_100017164("analytics_send_seshat_report", @"AnalyticsEvent: key: %llu, value: %llu", a3, a4, a5, a6, a7, a8, *a1);
  if (sub_10001FD4C(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    if (&_analytics_send_event_lazy)
    {
      analytics_send_event_lazy();
      return;
    }
    CFStringRef v23 = @"CA fwk missing, not sending event";
  }
  else
  {
    CFStringRef v23 = @"runtime condition not sastisifed";
  }

  sub_100017164("analytics_send_seshat_report", v23, v17, v18, v19, v20, v21, v22, a9);
}

xpc_object_t sub_100014144(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "key", **(unsigned int **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "value", *(unsigned int *)(*(void *)(a1 + 32) + 4));
  return v2;
}

void sub_1000141A8(_WORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  *a1 = *a1 & 0xFFF0 | 1;
  sub_100017164("analytics_send_sidp_recovery", @"AnalyticsEvent: version: %llu, type: %llu, event: %llu, recoverable: %llu, recovery_required: %llu, se_entangled: %llu, se_recovery_required: %llu, smdk_entalgned: %llu", a3, a4, a5, a6, a7, a8, 1);
  if (&_analytics_send_event_lazy)
  {
    analytics_send_event_lazy();
  }
  else
  {
    sub_100017164("analytics_send_sidp_recovery", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t sub_1000142B8(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "version", **(_WORD **)(a1 + 32) & 0xFLL);
  xpc_dictionary_set_uint64(v2, "type", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 4) & 3);
  xpc_dictionary_set_uint64(v2, "event", **(_WORD **)(a1 + 32) >> 6);
  xpc_dictionary_set_uint64(v2, "recoverable", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 8) & 1);
  xpc_dictionary_set_uint64(v2, "recovery_required", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 9) & 1);
  xpc_dictionary_set_uint64(v2, "se_entangled", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 10) & 1);
  xpc_dictionary_set_uint64(v2, "se_recovery_required", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 11) & 1);
  xpc_dictionary_set_uint64(v2, "smdk_entalgned", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 12) & 1);
  return v2;
}

void sub_1000143CC(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  *a1 &= 0xE0u;
  sub_100017164("analytics_send_first_unlock", @"AnalyticsEvent: version: %llu, se_entangled: %llu, smdk_entalgned: %llu", a3, a4, a5, a6, a7, a8, 0);
  if (sub_10001FD4C(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    if (&_analytics_send_event_lazy)
    {
      analytics_send_event_lazy();
      return;
    }
    CFStringRef v23 = @"CA fwk missing, not sending event";
  }
  else
  {
    CFStringRef v23 = @"runtime condition not sastisifed";
  }

  sub_100017164("analytics_send_first_unlock", v23, v17, v18, v19, v20, v21, v22, a9);
}

xpc_object_t sub_1000144D4(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "version", **(unsigned char **)(a1 + 32) & 0x1F);
  xpc_dictionary_set_uint64(v2, "se_entangled", ((unint64_t)**(unsigned __int8 **)(a1 + 32) >> 5) & 1);
  xpc_dictionary_set_uint64(v2, "smdk_entalgned", ((unint64_t)**(unsigned __int8 **)(a1 + 32) >> 6) & 1);
  return v2;
}

void sub_10001455C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_100017164("analytics_send_db_filekey_found", @"AnalyticsEvent: filekey_count: %llu", a3, a4, a5, a6, a7, a8, *a1);
  if (&_analytics_send_event_lazy)
  {
    analytics_send_event_lazy();
  }
  else
  {
    sub_100017164("analytics_send_db_filekey_found", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t sub_100014634(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "filekey_count", **(void **)(a1 + 32));
  return v2;
}

void sub_100014680(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_100017164("analytics_send_db_filekey_not_found", @"AnalyticsEvent: filekey_count: %llu", a3, a4, a5, a6, a7, a8, *a1);
  if (&_analytics_send_event_lazy)
  {
    analytics_send_event_lazy();
  }
  else
  {
    sub_100017164("analytics_send_db_filekey_not_found", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t sub_100014758(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "filekey_count", **(void **)(a1 + 32));
  return v2;
}

void sub_1000147A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (&_analytics_send_event_lazy)
  {
    analytics_send_event_lazy();
  }
  else
  {
    sub_100017164("analytics_send_db_add", @"CA fwk missing, not sending event", a3, a4, a5, a6, a7, a8, a9);
  }
}

xpc_object_t sub_100014844(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "status", **(void **)(a1 + 32));
  return v2;
}

void sub_100014890(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (&_analytics_send_event_lazy)
  {
    analytics_send_event_lazy();
  }
  else
  {
    sub_100017164("analytics_send_db_get", @"CA fwk missing, not sending event", a3, a4, a5, a6, a7, a8, a9);
  }
}

xpc_object_t sub_100014930(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "status", **(void **)(a1 + 32));
  return v2;
}

void sub_10001497C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_100017164("analytics_send_passphrase_change", @"AnalyticsEvent: change_count: %llu", a3, a4, a5, a6, a7, a8, *a1);
  if (&_analytics_send_event_lazy)
  {
    analytics_send_event_lazy();
  }
  else
  {
    sub_100017164("analytics_send_passphrase_change", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t sub_100014A54(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "change_count", **(void **)(a1 + 32));
  return v2;
}

void sub_100014AA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (&_analytics_send_event_lazy)
  {
    analytics_send_event_lazy();
  }
  else
  {
    sub_100017164("analytics_send_backup_key_drain", @"CA fwk missing, not sending event", a3, a4, a5, a6, a7, a8, a9);
  }
}

xpc_object_t sub_100014B40(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "filekey_count", **(void **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "fault", *(unsigned int *)(*(void *)(a1 + 32) + 8));
  xpc_dictionary_set_BOOL(v2, "first_unlocked", *(unsigned char *)(*(void *)(a1 + 32) + 12));
  xpc_dictionary_set_uint64(v2, "add_error", *(unsigned int *)(*(void *)(a1 + 32) + 16));
  xpc_dictionary_set_uint64(v2, "open_error", *(unsigned int *)(*(void *)(a1 + 32) + 20));
  xpc_dictionary_set_uint64(v2, "sqlite_error", *(unsigned int *)(*(void *)(a1 + 32) + 24));
  xpc_dictionary_set_BOOL(v2, "truncated", *(unsigned char *)(*(void *)(a1 + 32) + 28));
  xpc_dictionary_set_BOOL(v2, "unlinked", *(unsigned char *)(*(void *)(a1 + 32) + 29));
  return v2;
}

void sub_100014C34(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_100017164("analytics_send_forgotten_passcode_event", @"AnalyticsEvent: days_since_passcode_change: %llu, passcode_reset_expired: %llu, passcode_reset_exists: %llu", a3, a4, a5, a6, a7, a8, *a1);
  if (&_analytics_send_event_lazy)
  {
    analytics_send_event_lazy();
  }
  else
  {
    sub_100017164("analytics_send_forgotten_passcode_event", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t sub_100014D1C(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "days_since_passcode_change", **(unsigned int **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "passcode_reset_expired", *(unsigned char *)(*(void *)(a1 + 32) + 4) & 1);
  xpc_dictionary_set_uint64(v2, "passcode_reset_exists", ((unint64_t)*(unsigned __int8 *)(*(void *)(a1 + 32) + 4) >> 1) & 1);
  return v2;
}

void sub_100014DA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_100017164("analytics_send_user_keybag", @"AnalyticsEvent: report_version: %llu, grace_period: %llu, failed_unlock_attempts: %llu, max_unlock_attempts: %llu, recovery_iterations: %llu, recovery_target_iterations: %llu, recovery_wc_protected: %llu, recovery_restricted: %llu, recovery_ps_protected: %llu, recovery_akpu_protected: %llu, recovery_auto: %llu, memento_supported: %llu, memento_exists: %llu, memento_passcode_generation: %llu, passcode_generation: %llu, inactivity_reboot_enabled: %llu, oneness_automatic_mode: %llu, user_uuid_mismatch: %llu, zero_user_uuid: %llu, group_uuid_mismatch: %llu, zero_group_uuid: %llu, keybag_state_no_pin: %llu, keybag_state_been_unlocked: %llu, keybag_state_passcode_threshold: %llu, keybag_state_mesa_token: %llu, keybag_state_recovery_required: %llu, keybag_state_not_recoverable: %llu, keybag_state_stash_unlocked: %llu, keybag_state_escrow_unwrap_required: %llu, keybag_state_smdk_entangled: %llu, keybag_state_staged_manifest: %llu, keybag_state_se_unrecoverable: %llu, keybag_state_se_recovery_required: %llu, keybag_state_se_entangled: %llu, keybag_state_se_healthy: %llu, keybag_state_se_been_unlocked: %llu, keybag_state_art_loaded: %llu, keybag_state_xart_unlock_policy: %llu, keybag_state_xart_policy_cached: %llu, keybag_state_xart_policy_dirty: %llu, keybag_state_xart_policy_enforced: %llu, keybag_state_ps_entangled: %llu, keybag_state_from_xart: %llu, keybag_state_allow_test_keys: %llu, keybag_state_remote_session_unlocked: %llu, keybag_state_has_group_seed: %llu, keybag_state_been_passcode_unlocked: %llu, keybag_state_has_auto_recovery: %llu, keybag_state_has_lkgp_recovery: %llu, keybag_state_has_fv_recovery: %llu, keybag_state_has_memento_blob: %llu, keybag_more_state_cx_expiring: %llu, keybag_more_state_cx_expired: %llu, keybag_more_state_recovery_ps_fua_cached: %llu, keybag_more_state_unlocked_with_escrow: %llu, keybag_more_state_oneness_assert: %llu, hours_since_locked: %llu, cx_hours_remaining: %llu, days_since_passcode_change: %llu, memento_flags_blob_exists: %llu, memento_flags_se: %llu, memento_flags_ps: %llu, memento_flags_se_reset_token: %llu, memento_flags_tombstone: %llu, memento_failed_unlock_attempts: %llu, memento_se_slot: %llu, aks_get_extended_device_state_failure: %llu, AKSIdentityGetSessionTimeWindowsFailure: %llu, aks_get_seconds_since_passcode_change_failure: %llu, aks_memento_get_state_failure: %llu", *(unsigned int *)(a1 + 120), *(unsigned int *)(a1 + 116), *(unsigned __int8 *)(a1 + 112), *(unsigned __int8 *)(a1 + 111), *(unsigned __int8 *)(a1 + 110), *(unsigned __int8 *)(a1 + 109), *(_OWORD *)a1);
  if (&_analytics_send_event_lazy)
  {
    analytics_send_event_lazy();
  }
  else
  {
    sub_100017164("analytics_send_user_keybag", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t sub_100015180(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "report_version", **(void **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "grace_period", *(void *)(*(void *)(a1 + 32) + 8));
  xpc_dictionary_set_uint64(v2, "failed_unlock_attempts", *(void *)(*(void *)(a1 + 32) + 16));
  xpc_dictionary_set_uint64(v2, "max_unlock_attempts", *(void *)(*(void *)(a1 + 32) + 24));
  xpc_dictionary_set_uint64(v2, "recovery_iterations", *(void *)(*(void *)(a1 + 32) + 32));
  xpc_dictionary_set_uint64(v2, "recovery_target_iterations", *(void *)(*(void *)(a1 + 32) + 40));
  xpc_dictionary_set_BOOL(v2, "recovery_wc_protected", *(unsigned char *)(*(void *)(a1 + 32) + 48));
  xpc_dictionary_set_BOOL(v2, "recovery_restricted", *(unsigned char *)(*(void *)(a1 + 32) + 49));
  xpc_dictionary_set_BOOL(v2, "recovery_ps_protected", *(unsigned char *)(*(void *)(a1 + 32) + 50));
  xpc_dictionary_set_BOOL(v2, "recovery_akpu_protected", *(unsigned char *)(*(void *)(a1 + 32) + 51));
  xpc_dictionary_set_BOOL(v2, "recovery_auto", *(unsigned char *)(*(void *)(a1 + 32) + 52));
  xpc_dictionary_set_BOOL(v2, "memento_supported", *(unsigned char *)(*(void *)(a1 + 32) + 53));
  xpc_dictionary_set_BOOL(v2, "memento_exists", *(unsigned char *)(*(void *)(a1 + 32) + 54));
  xpc_dictionary_set_uint64(v2, "memento_passcode_generation", *(void *)(*(void *)(a1 + 32) + 56));
  xpc_dictionary_set_uint64(v2, "passcode_generation", *(void *)(*(void *)(a1 + 32) + 64));
  xpc_dictionary_set_BOOL(v2, "inactivity_reboot_enabled", *(unsigned char *)(*(void *)(a1 + 32) + 72));
  xpc_dictionary_set_BOOL(v2, "oneness_automatic_mode", *(unsigned char *)(*(void *)(a1 + 32) + 73));
  xpc_dictionary_set_BOOL(v2, "user_uuid_mismatch", *(unsigned char *)(*(void *)(a1 + 32) + 74));
  xpc_dictionary_set_BOOL(v2, "zero_user_uuid", *(unsigned char *)(*(void *)(a1 + 32) + 75));
  xpc_dictionary_set_BOOL(v2, "group_uuid_mismatch", *(unsigned char *)(*(void *)(a1 + 32) + 76));
  xpc_dictionary_set_BOOL(v2, "zero_group_uuid", *(unsigned char *)(*(void *)(a1 + 32) + 77));
  xpc_dictionary_set_BOOL(v2, "keybag_state_no_pin", *(unsigned char *)(*(void *)(a1 + 32) + 78));
  xpc_dictionary_set_BOOL(v2, "keybag_state_been_unlocked", *(unsigned char *)(*(void *)(a1 + 32) + 79));
  xpc_dictionary_set_BOOL(v2, "keybag_state_passcode_threshold", *(unsigned char *)(*(void *)(a1 + 32) + 80));
  xpc_dictionary_set_BOOL(v2, "keybag_state_mesa_token", *(unsigned char *)(*(void *)(a1 + 32) + 81));
  xpc_dictionary_set_BOOL(v2, "keybag_state_recovery_required", *(unsigned char *)(*(void *)(a1 + 32) + 82));
  xpc_dictionary_set_BOOL(v2, "keybag_state_not_recoverable", *(unsigned char *)(*(void *)(a1 + 32) + 83));
  xpc_dictionary_set_BOOL(v2, "keybag_state_stash_unlocked", *(unsigned char *)(*(void *)(a1 + 32) + 84));
  xpc_dictionary_set_BOOL(v2, "keybag_state_escrow_unwrap_required", *(unsigned char *)(*(void *)(a1 + 32) + 85));
  xpc_dictionary_set_BOOL(v2, "keybag_state_smdk_entangled", *(unsigned char *)(*(void *)(a1 + 32) + 86));
  xpc_dictionary_set_BOOL(v2, "keybag_state_staged_manifest", *(unsigned char *)(*(void *)(a1 + 32) + 87));
  xpc_dictionary_set_BOOL(v2, "keybag_state_se_unrecoverable", *(unsigned char *)(*(void *)(a1 + 32) + 88));
  xpc_dictionary_set_BOOL(v2, "keybag_state_se_recovery_required", *(unsigned char *)(*(void *)(a1 + 32) + 89));
  xpc_dictionary_set_BOOL(v2, "keybag_state_se_entangled", *(unsigned char *)(*(void *)(a1 + 32) + 90));
  xpc_dictionary_set_BOOL(v2, "keybag_state_se_healthy", *(unsigned char *)(*(void *)(a1 + 32) + 91));
  xpc_dictionary_set_BOOL(v2, "keybag_state_se_been_unlocked", *(unsigned char *)(*(void *)(a1 + 32) + 92));
  xpc_dictionary_set_BOOL(v2, "keybag_state_art_loaded", *(unsigned char *)(*(void *)(a1 + 32) + 93));
  xpc_dictionary_set_BOOL(v2, "keybag_state_xart_unlock_policy", *(unsigned char *)(*(void *)(a1 + 32) + 94));
  xpc_dictionary_set_BOOL(v2, "keybag_state_xart_policy_cached", *(unsigned char *)(*(void *)(a1 + 32) + 95));
  xpc_dictionary_set_BOOL(v2, "keybag_state_xart_policy_dirty", *(unsigned char *)(*(void *)(a1 + 32) + 96));
  xpc_dictionary_set_BOOL(v2, "keybag_state_xart_policy_enforced", *(unsigned char *)(*(void *)(a1 + 32) + 97));
  xpc_dictionary_set_BOOL(v2, "keybag_state_ps_entangled", *(unsigned char *)(*(void *)(a1 + 32) + 98));
  xpc_dictionary_set_BOOL(v2, "keybag_state_from_xart", *(unsigned char *)(*(void *)(a1 + 32) + 99));
  xpc_dictionary_set_BOOL(v2, "keybag_state_allow_test_keys", *(unsigned char *)(*(void *)(a1 + 32) + 100));
  xpc_dictionary_set_BOOL(v2, "keybag_state_remote_session_unlocked", *(unsigned char *)(*(void *)(a1 + 32) + 101));
  xpc_dictionary_set_BOOL(v2, "keybag_state_has_group_seed", *(unsigned char *)(*(void *)(a1 + 32) + 102));
  xpc_dictionary_set_BOOL(v2, "keybag_state_been_passcode_unlocked", *(unsigned char *)(*(void *)(a1 + 32) + 103));
  xpc_dictionary_set_BOOL(v2, "keybag_state_has_auto_recovery", *(unsigned char *)(*(void *)(a1 + 32) + 104));
  xpc_dictionary_set_BOOL(v2, "keybag_state_has_lkgp_recovery", *(unsigned char *)(*(void *)(a1 + 32) + 105));
  xpc_dictionary_set_BOOL(v2, "keybag_state_has_fv_recovery", *(unsigned char *)(*(void *)(a1 + 32) + 106));
  xpc_dictionary_set_BOOL(v2, "keybag_state_has_memento_blob", *(unsigned char *)(*(void *)(a1 + 32) + 107));
  xpc_dictionary_set_BOOL(v2, "keybag_more_state_cx_expiring", *(unsigned char *)(*(void *)(a1 + 32) + 108));
  xpc_dictionary_set_BOOL(v2, "keybag_more_state_cx_expired", *(unsigned char *)(*(void *)(a1 + 32) + 109));
  xpc_dictionary_set_BOOL(v2, "keybag_more_state_recovery_ps_fua_cached", *(unsigned char *)(*(void *)(a1 + 32) + 110));
  xpc_dictionary_set_BOOL(v2, "keybag_more_state_unlocked_with_escrow", *(unsigned char *)(*(void *)(a1 + 32) + 111));
  xpc_dictionary_set_BOOL(v2, "keybag_more_state_oneness_assert", *(unsigned char *)(*(void *)(a1 + 32) + 112));
  xpc_dictionary_set_uint64(v2, "hours_since_locked", *(unsigned int *)(*(void *)(a1 + 32) + 116));
  xpc_dictionary_set_uint64(v2, "cx_hours_remaining", *(unsigned int *)(*(void *)(a1 + 32) + 120));
  xpc_dictionary_set_uint64(v2, "days_since_passcode_change", *(unsigned int *)(*(void *)(a1 + 32) + 124));
  xpc_dictionary_set_BOOL(v2, "memento_flags_blob_exists", *(unsigned char *)(*(void *)(a1 + 32) + 128));
  xpc_dictionary_set_BOOL(v2, "memento_flags_se", *(unsigned char *)(*(void *)(a1 + 32) + 129));
  xpc_dictionary_set_BOOL(v2, "memento_flags_ps", *(unsigned char *)(*(void *)(a1 + 32) + 130));
  xpc_dictionary_set_BOOL(v2, "memento_flags_se_reset_token", *(unsigned char *)(*(void *)(a1 + 32) + 131));
  xpc_dictionary_set_BOOL(v2, "memento_flags_tombstone", *(unsigned char *)(*(void *)(a1 + 32) + 132));
  xpc_dictionary_set_uint64(v2, "memento_failed_unlock_attempts", *(unsigned int *)(*(void *)(a1 + 32) + 136));
  xpc_dictionary_set_uint64(v2, "memento_se_slot", *(unsigned int *)(*(void *)(a1 + 32) + 140));
  xpc_dictionary_set_BOOL(v2, "aks_get_extended_device_state_failure", *(unsigned char *)(*(void *)(a1 + 32) + 144));
  xpc_dictionary_set_BOOL(v2, "AKSIdentityGetSessionTimeWindowsFailure", *(unsigned char *)(*(void *)(a1 + 32) + 145));
  xpc_dictionary_set_BOOL(v2, "aks_get_seconds_since_passcode_change_failure", *(unsigned char *)(*(void *)(a1 + 32) + 146));
  xpc_dictionary_set_BOOL(v2, "aks_memento_get_state_failure", *(unsigned char *)(*(void *)(a1 + 32) + 147));
  return v2;
}

uint64_t sub_100015844(uint64_t a1, int a2, unsigned int a3)
{
  if (&_ADClientAddValueForScalarKey) {
    BOOL v3 = &_ADClientSetValueForScalarKey == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3 || a1 == 0) {
    return 0xFFFFFFFFLL;
  }
  if (a3 && arc4random() % a3) {
    return 0xFFFFFFFFLL;
  }
  if (a2) {
    ADClientSetValueForScalarKey();
  }
  else {
    ADClientAddValueForScalarKey();
  }
  return 0;
}

uint64_t sub_1000158DC(const __CFDictionary *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7)
{
  unsigned int v101 = -1;
  int v102 = -1;
  uint64_t system = aks_get_system();
  if (system == -536870160)
  {
    if (a7)
    {
      sub_100017164("loadKeybagForUserSession", @"From EARLYSTART skip check switch between users", v14, v15, v16, v17, v18, v19, v98);
    }
    else if (sub_100010F10() == a2)
    {
      sub_100017164("loadKeybagForUserSession", @"LOADING FOREGROUND USER, SKIP loading Keybag and head to Unlock", v22, v23, v24, v25, v26, v27, v98);
      CFDictionaryRef v21 = 0;
      uint64_t v20 = 3758097136;
      goto LABEL_9;
    }
    CFDictionaryRef v37 = sub_1000046AC(a2);
    if (!v37)
    {
      sub_100017164("loadKeybagForUserSession", @"no user bag found for UID %d", v38, v39, v40, v41, v42, v43, a2);
      uint64_t v20 = 4294967288;
      goto LABEL_42;
    }
    CFDictionaryRef v21 = v37;
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v37, @"KeyBagKeys");
    if (Value)
    {
      CFDataRef v51 = Value;
      CFDataGetBytePtr(Value);
      CFDataGetLength(v51);
      uint64_t bag = aks_load_bag();
      if (bag)
      {
        uint64_t v20 = bag;
        sub_100017164("loadKeybagForUserSession", @"failed to load bag for user %d: 0x%x", v53, v54, v55, v56, v57, v58, a2);
      }
      else
      {
        uint64_t v74 = aks_set_system();
        if (v74)
        {
          uint64_t v20 = v74;
          sub_100017164("loadKeybagForUserSession", @"failed to set bag handle %d as session bag for UID %d: 0x%x", v75, v76, v77, v78, v79, v80, v101);
        }
        else
        {
          if (a2 != 502)
          {
            sub_100017164("loadKeybagForUserSession", @"seting APFSVolumeID For KeyBag", v75, v76, v77, v78, v79, v80, v98);
            sub_100015CF4(v101, a2, a1, 0, v87, v88, v89, v90, v99);
          }
          uint64_t v20 = aks_get_system();
          if (!v20) {
            goto LABEL_9;
          }
          sub_100017164("loadKeybagForUserSession", @"loaded bag handle %ld as session bag for %d, but got no session handle back: 0x%x", v91, v92, v93, v94, v95, v96, v101);
        }
      }
      uint64_t v20 = sub_100010F88(v20);
    }
    else
    {
      sub_100017164("loadKeybagForUserSession", @"no keybag in user bag plist", v45, v46, v47, v48, v49, v50, v98);
      uint64_t v20 = 4294966296;
    }
LABEL_41:
    CFRelease(v21);
    goto LABEL_42;
  }
  uint64_t v20 = system;
  if (system)
  {
    uint64_t v20 = sub_100010F88(system);
    goto LABEL_42;
  }
  CFDictionaryRef v21 = 0;
LABEL_9:
  if (a3)
  {
    id v28 = +[MKBDeviceLockModelEducationalMode sharedLockModelWithUID:a2];
    [v28 notePasscodeEntryBegan];
    uint64_t v29 = aks_unlock_device();
    if (v29)
    {
      uint64_t v36 = v29;
      sub_100017164("loadKeybagForUserSession", @"failed to unlock session bag handle %ld: 0x%x", v30, v31, v32, v33, v34, v35, v102);
      uint64_t v20 = sub_100010F88(v36);
      [v28 notePasscodeUnlockFailed];
      if ([v28 isWipePending])
      {
        uint64_t v20 = 4294967281;
      }
      else if (([v28 isTemporarilyBlocked] & 1) != 0 {
             || [v28 isPermanentlyBlocked])
      }
      {
        uint64_t v20 = 4294967282;
      }
    }
    else
    {
      [v28 notePasscodeUnlockSucceeded];
      if (a5)
      {
        sub_100017164("loadKeybagForUserSession", @"TRYING TO UPDATE GRACE PERIOD FOR USER:%d with %d secs", v59, v60, v61, v62, v63, v64, a2);
        uint64_t v65 = sub_100010E70();
        uint64_t valuePtr = a6;
        CFNumberRef v66 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
        if (v66)
        {
          CFNumberRef v67 = v66;
          CFDictionarySetValue(v65, kAKSConfigGracePeriod, v66);
          CFRelease(v67);
        }
        uint64_t v20 = aks_set_configuration();
        if (v65) {
          CFRelease(v65);
        }
        if (v20)
        {
          sub_100017164("loadKeybagForUserSession", @"FAILED TO AKS update Graceperiod of %d secs FOR USER:%d with error:%d", v68, v69, v70, v71, v72, v73, a6);
        }
        else
        {
          sub_100017164("loadKeybagForUserSession", @"SUCCESSFUL AKS update of Graceperiod FOR USER:%d with %d secs", v68, v69, v70, v71, v72, v73, a2);
          uint64_t v20 = sub_1000054C8(v102, a2, 0, 0);
          if (v20) {
            sub_100017164("loadKeybagForUserSession", @"FAILED to save Keybag FOR USER:%d with Graceperiod of %d secs", v81, v82, v83, v84, v85, v86, a2);
          }
          else {
            sub_100017164("loadKeybagForUserSession", @"SUCCESSFUL  saving of Keybag FOR USER:%d with Graceperiod of %d secs", v81, v82, v83, v84, v85, v86, a2);
          }
        }
      }
      else
      {
        uint64_t v20 = 0;
      }
    }
  }
  if (v21) {
    goto LABEL_41;
  }
LABEL_42:
  if (v101 != -1) {
    aks_unload_bag();
  }
  return v20;
}

void sub_100015CF4(uint64_t a1, uint64_t a2, const __CFDictionary *a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  bzero(v38, 0x3FBuLL);
  qmemcpy(v37, "/dev/", sizeof(v37));
  if (!a3)
  {
    CFStringRef v33 = @"PASSED in NULL Session";
LABEL_12:
    sub_100017164("setAPFSVolumeIDForKeyBag", v33, v13, v14, v15, v16, v17, v18, a9);
    return;
  }
  memset(v39, 0, sizeof(v39));
  sub_100017164("setAPFSVolumeIDForKeyBag", @"Passed in session is %@", v13, v14, v15, v16, v17, v18, (char)a3);
  if (!CFDictionaryContainsKey(a3, kMKBUserSessionVolumeDeviceNodeKey))
  {
    CFStringRef v33 = @"NO device node key to map.., returning";
    goto LABEL_12;
  }
  sub_10001082C(a3, kMKBUserSessionVolumeDeviceNodeKey, (char *)v39, 256);
  if (LODWORD(v39[0]) == 1802725732)
  {
    __strlcat_chk();
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (a4) {
LABEL_5:
  }
    sub_100008150(a1, (uint64_t)v37, 0, 0, 0);
LABEL_6:
  if (CFDictionaryContainsKey(a3, kMKBUserSessionVolumeUUIDKey))
  {
    uint64_t v25 = sub_1000107E8(a3, kMKBUserSessionVolumeUUIDKey);
    if (!v25) {
      return;
    }
    memset(uu, 0, sizeof(uu));
    sub_100017164("setAPFSVolumeIDForKeyBag", @"Updating VolumeUUID %@", v26, v27, v28, v29, v30, v31, (char)v25);
    bzero(in, 0x400uLL);
    sub_10001082C(a3, kMKBUserSessionVolumeUUIDKey, in, 1024);
    if (!uuid_parse(in, uu))
    {
      sub_100017164("setAPFSVolumeIDForKeyBag", @"uuid_parse SUCCESS", v19, v20, v21, v22, v23, v24, v34);
      sub_1000082E0(a1, a2, (uint64_t)v37, (uint64_t)uu, 0);
      return;
    }
    CFStringRef v32 = @"uuid_parse failed";
  }
  else
  {
    CFStringRef v32 = @"No VolumeUUID key present in the session";
  }
  sub_100017164("setAPFSVolumeIDForKeyBag", v32, v19, v20, v21, v22, v23, v24, v34);
}

uint64_t sub_100015FB0(const __CFDictionary *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, const void *a6)
{
  unsigned int v64 = -1;
  CFMutableDictionaryRef v10 = sub_1000046AC(a2);
  if (v10)
  {
    CFRelease(v10);
    return 0;
  }
  else
  {
    uint64_t bag = aks_create_bag();
    if (bag)
    {
      uint64_t v19 = bag;
      sub_100017164("createKeybagForUserSession", @"Failed to create bag with aks error:0x%x", v13, v14, v15, v16, v17, v18, bag);
      uint64_t v11 = sub_100010F88(v19);
    }
    else
    {
      sub_100017164("createKeybagForUserSession", @"Created keybag for uid:%d", v13, v14, v15, v16, v17, v18, a2);
      if (a5 >= 1)
      {
        sub_100017164("createKeybagForUserSession", @"TRYING TO SET GRACE PERIOD FOR USER with %d secs", v20, v21, v22, v23, v24, v25, a5);
        uint64_t v26 = sub_100010E70();
        uint64_t valuePtr = a5;
        CFNumberRef v27 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
        if (v27)
        {
          CFNumberRef v28 = v27;
          CFDictionarySetValue(v26, kAKSConfigGracePeriod, v27);
          CFRelease(v28);
        }
        int v35 = aks_set_configuration();
        if (v26) {
          CFRelease(v26);
        }
        if (v35) {
          sub_100017164("createKeybagForUserSession", @"FAILED TO SET  Graceperiod of %d secs with error:%d", v29, v30, v31, v32, v33, v34, a5);
        }
        else {
          sub_100017164("createKeybagForUserSession", @"SUCCESSFUL Setting of Graceperiod of %d secs", v29, v30, v31, v32, v33, v34, a5);
        }
      }
      sub_100017164("createKeybagForUserSession", @"Saving keybag for uid:%d", v20, v21, v22, v23, v24, v25, a2);
      uint64_t v11 = sub_1000054C8(v64, a2, a6, 0);
      if (!v11)
      {
        sub_100017164("createKeybagForUserSession", @"Setting it to  System for user:%d", v36, v37, v38, v39, v40, v41, a2);
        uint64_t v43 = aks_set_system_with_passcode();
        if (v43)
        {
          uint64_t v50 = v43;
          sub_100017164("createKeybagForUserSession", @"Failed to setsystem for the bag with aks error:0x%x", v44, v45, v46, v47, v48, v49, v43);
          uint64_t v11 = sub_100010F88(v50);
          if (sub_1000054C8(-1, a2, 0, 0)) {
            sub_100017164("createKeybagForUserSession", @"Failed to remove user bag for session %d: %d", v51, v52, v53, v54, v55, v56, a2);
          }
        }
        else
        {
          if (a2 != 502)
          {
            sub_100017164("createKeybagForUserSession", @"seting APFSVolumeID For KeyBag ", v44, v45, v46, v47, v48, v49, v61);
            sub_100015CF4(v64, a2, a1, 1, v57, v58, v59, v60, v62);
          }
          uint64_t v11 = 0;
        }
      }
    }
    if (v64 != -1) {
      aks_unload_bag();
    }
  }
  return v11;
}

uint64_t sub_10001625C(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100017164("setupKeybagForPersona", @"CAlling KBMapDeviceBag with volume %s", a3, (uint64_t)a4, a5, a6, a7, a8, (char)a4);
  uint64_t v9 = sub_10000855C(a4, 1);
  uint64_t v16 = v9;
  if (v9) {
    sub_100017164("setupKeybagForPersona", @"KBMapDeviceBag failed with error %d", v10, v11, v12, v13, v14, v15, v9);
  }
  else {
    sub_100017164("setupKeybagForPersona", @"KBMapDeviceBag Success", v10, v11, v12, v13, v14, v15, v18);
  }
  return v16;
}

uint64_t sub_1000162E8(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100017164("unloadUserSessionUserBag", @"Unloading UserKeyBag for User:%d", a3, a4, a5, a6, a7, a8, a1);
  if (aks_get_system())
  {
    sub_100017164("unloadUserSessionUserBag", @"no Userbag found for UID %d with error:0x%x", v9, v10, v11, v12, v13, v14, a1);
    return 0;
  }
  else
  {
    sub_100017164("unloadUserSessionUserBag", @"Found loaded SyncBag and unloading the bag", v9, v10, v11, v12, v13, v14, v23);
    uint64_t v15 = aks_unload_bag();
    if (v15) {
      sub_100017164("unloadUserSessionUserBag", @"failed to unload SyncBag for UID:%d with error:0x%x", v16, v17, v18, v19, v20, v21, a1);
    }
    else {
      sub_100017164("unloadUserSessionUserBag", @"Unloaded of SyncBag for UID:%d , Successful", v16, v17, v18, v19, v20, v21, a1);
    }
  }
  return v15;
}

uint64_t sub_1000163B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v68 = -1;
  int v69 = -1;
  CFNumberRef v67 = 0;
  int v66 = 0;
  sub_100017164("createSyncBagForSyncBubble", @"Creating a new SyncBag for User %d", a3, a4, a5, a6, a7, a8, a2);
  uint64_t system = aks_get_system();
  if (system)
  {
    uint64_t v16 = system;
    sub_100017164("createSyncBagForSyncBubble", @"Unable to find user session_handle for user %d with error:0x%x", v10, v11, v12, v13, v14, v15, a2);
LABEL_7:
    uint64_t v31 = sub_100010F88(v16);
    goto LABEL_8;
  }
  sync_uint64_t bag = aks_create_sync_bag();
  if (sync_bag)
  {
    uint64_t v16 = sync_bag;
    sub_100017164("createSyncBagForSyncBubble", @"failed to create SyncBag for uid %d: with error: 0x%x", v18, v19, v20, v21, v22, v23, a2);
    goto LABEL_7;
  }
  sub_100017164("createSyncBagForSyncBubble", @"Saving content in usersyncbag for User %d", v18, v19, v20, v21, v22, v23, a2);
  uint64_t v24 = aks_save_bag();
  if (v24)
  {
    uint64_t v16 = v24;
    sub_100017164("createSyncBagForSyncBubble", @"failed to retrive SyncBag content from keybag for uid %d: with error: 0x%x", v25, v26, v27, v28, v29, v30, a2);
    goto LABEL_7;
  }
  CFDataRef v33 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v67, v66, kCFAllocatorDefault);
  if (!v33)
  {
    sub_100017164("createSyncBagForSyncBubble", @"failed to retrive SyncBag content from keybag for uid %d: with error: 0x%x", v34, v35, v36, v37, v38, v39, a2);
    uint64_t v16 = 5;
    goto LABEL_7;
  }
  CFDataRef v40 = v33;
  memset(&v65, 0, sizeof(v65));
  if (stat("/private/var//keybags/usersyncbag.kb", &v65)
    || (sub_100017164("createSyncBagForSyncBubble", @"Existing SyncBag needs update", v41, v42, v43, v44, v45, v46, v62), (uint64_t v47 = (__CFDictionary *)sub_100010D10("/private/var//keybags/usersyncbag.kb")) == 0))
  {
    uint64_t v47 = sub_100010E70();
  }
  CFStringRef v48 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", a2);
  if (CFDictionaryContainsKey(v47, v48)) {
    CFDictionaryReplaceValue(v47, v48, v40);
  }
  else {
    CFDictionaryAddValue(v47, v48, v40);
  }
  if (sub_100010BE4(v47, "/private/var//keybags/usersyncbag.kb")) {
    CFStringRef v55 = @"Failed to save UserSyncBag";
  }
  else {
    CFStringRef v55 = @"Saved UserSyncBag";
  }
  sub_100017164("createSyncBagForSyncBubble", v55, v49, v50, v51, v52, v53, v54, v63);
  sub_100017164("createSyncBagForSyncBubble", @"SyncBag Creation completed", v56, v57, v58, v59, v60, v61, v64);
  CFRelease(v40);
  if (v48) {
    CFRelease(v48);
  }
  if (v47) {
    CFRelease(v47);
  }
  uint64_t v31 = 0;
LABEL_8:
  if (v69 != -1) {
    aks_unload_bag();
  }
  return v31;
}

uint64_t sub_100016648(const __CFDictionary *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100017164("loadSyncBagForSyncBubble", @"Loading SyncBag for the User:%d", a3, a4, a5, a6, a7, a8, a2);
  uint64_t v10 = sub_1000158DC(a1, a2, 0, 0, 0, 0, 0);
  if (!v10)
  {
    sub_100017164("loadSyncBagForSyncBubble", @"LOAD SyncBag for uid %d", v11, v12, v13, v14, v15, v16, a2);
    uint64_t system = aks_get_system();
    if (system != -536870160)
    {
      uint64_t v25 = system;
      if (system)
      {
        sub_100017164("loadSyncBagForSyncBubble", @"error with user session_handle for user %d with error:0x%x", v19, v20, v21, v22, v23, v24, a2);
        goto LABEL_22;
      }
      sub_100017164("loadSyncBagForSyncBubble", @"KeyBag for uid %d loaded and ready for syncbag", v19, v20, v21, v22, v23, v24, a2);
    }
    CFDictionaryRef v26 = (const __CFDictionary *)sub_100010D10("/private/var//keybags/usersyncbag.kb");
    if (!v26)
    {
      sub_100017164("loadSyncBagForSyncBubble", @"Failed to load userSyncBagDict file", v27, v28, v29, v30, v31, v32, v63);
      uint64_t v25 = 5;
      return sub_100010F88(v25);
    }
    CFDictionaryRef v33 = v26;
    CFStringRef v34 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", a2);
    if (CFDictionaryContainsKey(v33, v34))
    {
      CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v33, v34);
      if (Value)
      {
        CFDataRef v48 = Value;
        sub_100017164("loadSyncBagForSyncBubble", @"SyncBagContent is being loaded to keybag %d", v42, v43, v44, v45, v46, v47, a2);
        CFDataGetBytePtr(v48);
        CFDataGetLength(v48);
        uint64_t v49 = aks_unlock_with_sync_bag();
        uint64_t v25 = v49;
        if (v49)
        {
          sub_100017164("loadSyncBagForSyncBubble", @"Failed to load SyncBag data with error 0x%x, clearing syncBag for user:%d", v50, v51, v52, v53, v54, v55, v49);
          if (sub_100016930(a1, a2, 0, v56, v57, v58, v59, v60))
          {
            sub_100017164("loadSyncBagForSyncBubble", @"Failed to clear SyncBag content for User:%d", v50, v51, v52, v53, v54, v55, a2);
            goto LABEL_20;
          }
          char v64 = a2;
          CFStringRef v61 = @"Cleared SyncBag content for User:%d";
        }
        else
        {
          CFStringRef v61 = @"SyncBag loaded and unlocked";
        }
        sub_100017164("loadSyncBagForSyncBubble", v61, v50, v51, v52, v53, v54, v55, v64);
LABEL_20:
        CFRelease(v33);
        if (v34) {
          CFRelease(v34);
        }
LABEL_22:
        if (!v25) {
          return 0;
        }
        return sub_100010F88(v25);
      }
      sub_100017164("loadSyncBagForSyncBubble", @"No SyncBagContent in userSyncBagDict for User %d", v42, v43, v44, v45, v46, v47, a2);
    }
    else
    {
      sub_100017164("loadSyncBagForSyncBubble", @"No syncbag uidkey for the user:%d in userSyncBagDict", v35, v36, v37, v38, v39, v40, a2);
      CFDictionarySetValue(a1, @"MKBUserSessionHasSyncBag", kCFBooleanFalse);
    }
    uint64_t v25 = 5;
    goto LABEL_20;
  }
  uint64_t v17 = v10;
  sub_100017164("loadSyncBagForSyncBubble", @"Failed to load User keybag for user:%d", v11, v12, v13, v14, v15, v16, a2);
  return v17;
}

uint64_t sub_100016930(__CFDictionary *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3)
  {
    int v10 = sub_100016CA0((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
    if (!v10)
    {
      CFStringRef v11 = @"Unload of SyncBag successful";
      goto LABEL_6;
    }
  }
  else
  {
    LOBYTE(v10) = 5;
  }
  char v65 = v10;
  CFStringRef v11 = @"Unload of SyncBag failed with error:%d";
LABEL_6:
  sub_100017164("removeSyncBagForSyncBubble", v11, a3, a4, a5, a6, a7, a8, v65);
  uint64_t v12 = (void *)sub_100010D10("/private/var//keybags/usersyncbag.kb");
  if (v12)
  {
    CFStringRef v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", a2);
    if (!CFDictionaryContainsKey((CFDictionaryRef)v12, v13))
    {
      sub_100017164("removeSyncBagForSyncBubble", @"No syncbag uidkey for the user:%d in userSyncBagDict, removing hasSyncKey", v14, v15, v16, v17, v18, v19, a2);
      CFDictionarySetValue(a1, @"MKBUserSessionHasSyncBag", kCFBooleanFalse);
LABEL_14:
      CFRelease(v12);
      if (v13) {
        CFRelease(v13);
      }
      return sub_100010F88(5);
    }
    CFDictionaryRemoveValue((CFMutableDictionaryRef)v12, v13);
    sub_100017164("removeSyncBagForSyncBubble", @"Removed SyncBag coontent from UserSyncBag for user :%d", v20, v21, v22, v23, v24, v25, a2);
    if (CFDictionaryGetCount((CFDictionaryRef)v12))
    {
      if (sub_100010BE4(v12, "/private/var//keybags/usersyncbag.kb"))
      {
        sub_100017164("removeSyncBagForSyncBubble", @"Failed to save Updated UserSyncBag", v32, v33, v34, v35, v36, v37, v67);
        goto LABEL_14;
      }
      sub_100017164("removeSyncBagForSyncBubble", @"Saved UserSyncBag and removal of user:%d syncbag completed", v32, v33, v34, v35, v36, v37, a2);
    }
    else
    {
      sub_100017164("removeSyncBagForSyncBubble", @"NO SyncBag for any Users, removing file..", v26, v27, v28, v29, v30, v31, v67);
      unlink("/private/var//keybags/usersyncbag.kb");
      sub_100017164("removeSyncBagForSyncBubble", @"Invalidate all SyncBags", v52, v53, v54, v55, v56, v57, v69);
      int v58 = aks_invalidate_sync_bags();
      if (v58) {
        sub_100017164("removeSyncBagForSyncBubble", @"Failed to invalidate all syncbags with error:0x%x", v59, v60, v61, v62, v63, v64, v58);
      }
      else {
        sub_100017164("removeSyncBagForSyncBubble", @"XXXXXXXXXXXXXXXX INVALIDATED ALL SYNCBAGS XXXXXXXXXXXXXXXX", v59, v60, v61, v62, v63, v64, v70);
      }
    }
  }
  else
  {
    memset(&v71, 0, sizeof(v71));
    int v38 = stat("/private/var//keybags/usersyncbag.kb", &v71);
    sub_100017164("removeSyncBagForSyncBubble", @"Failed to load userSyncBagDict file", v39, v40, v41, v42, v43, v44, v66);
    if (!v38) {
      return sub_100010F88(5);
    }
    CFStringRef v13 = 0;
  }
  sub_100017164("removeSyncBagForSyncBubble", @"RESET kMKBUserSessionHasSyncBagKey", v45, v46, v47, v48, v49, v50, v68);
  CFDictionarySetValue(a1, @"MKBUserSessionHasSyncBag", kCFBooleanFalse);
  if (!v12)
  {
    if (!v13) {
      return 0;
    }
    goto LABEL_23;
  }
  CFRelease(v12);
  if (v13) {
LABEL_23:
  }
    CFRelease(v13);
  return 0;
}

uint64_t sub_100016BC8(uint64_t a1, uint64_t a2)
{
  CFDictionaryRef v3 = (const __CFDictionary *)sub_100010D10("/private/var//keybags/usersyncbag.kb");
  if (v3)
  {
    CFDictionaryRef v10 = v3;
    CFStringRef v11 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", a2);
    int v12 = CFDictionaryContainsKey(v10, v11);
    if (v12) {
      CFStringRef v19 = @"Bag exists in UserSyncBag for user :%d";
    }
    else {
      CFStringRef v19 = @"No syncbag uidkey for the user:%d in userSyncBagDict, removing hasSyncKey";
    }
    if (v12) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = 5;
    }
    sub_100017164("verifySyncBagForSyncBubbleExists", v19, v13, v14, v15, v16, v17, v18, a2);
    CFRelease(v10);
    if (v11) {
      CFRelease(v11);
    }
  }
  else
  {
    sub_100017164("verifySyncBagForSyncBubbleExists", @"Failed to load userSyncBagDict file", v4, v5, v6, v7, v8, v9, v22);
    return 5;
  }
  return v20;
}

uint64_t sub_100016CA0(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100017164("unloadSyncBagForSyncBubble", @"Unloading UserKeyBag for User:%d", a3, a4, a5, a6, a7, a8, a2);
  if (aks_get_system())
  {
    sub_100017164("unloadSyncBagForSyncBubble", @"no SyncBag found for UID %d with error:0x%x", v9, v10, v11, v12, v13, v14, a2);
    return 0;
  }
  sub_100017164("unloadSyncBagForSyncBubble", @"Found loaded SyncBag and unloading the bag", v9, v10, v11, v12, v13, v14, v24);
  uint64_t v16 = aks_unload_bag();
  if (!v16)
  {
    sub_100017164("unloadSyncBagForSyncBubble", @"Unloaded of SyncBag for UID:%d , Successful", v17, v18, v19, v20, v21, v22, a2);
    return 0;
  }
  uint64_t v23 = v16;
  sub_100017164("unloadSyncBagForSyncBubble", @"failed to unload SyncBag for UID:%d with error:0x%x", v17, v18, v19, v20, v21, v22, a2);
  return sub_100010F88(v23);
}

uint64_t sub_100016D74(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  memset(uu, 0, sizeof(uu));
  bzero(buffer, 0x400uLL);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  *(_OWORD *)in = 0u;
  long long v32 = 0u;
  if (CFStringGetCString(a2, buffer, 1024, 0x8000100u))
  {
    if (CFStringGetCString(a3, in, 256, 0x8000100u))
    {
      if (uuid_parse(in, uu))
      {
        CFStringRef v11 = @"failed to parse unique string to uuid_t";
      }
      else
      {
        int v12 = aks_keybag_persona_create();
        if (v12)
        {
          char v28 = v12;
          CFStringRef v11 = @"Failed to create persona key with error:0x%x";
        }
        else
        {
          sub_100017164("createPersonaKeyForUser", @"Created persona key in the keybag", v5, v6, v7, v8, v9, v10, v28);
          int v20 = sub_10001625C(v14, v15, v16, buffer, (uint64_t)uu, v17, v18, v19);
          if (!v20)
          {
            sub_100017164("createPersonaKeyForUser", @" Successful Setup of keybag with persona key", v21, v22, v23, v24, v25, v26, v29);
            return 0;
          }
          sub_100017164("createPersonaKeyForUser", @"failed to Setup keybag with persona key:%d", v21, v22, v23, v24, v25, v26, v20);
          int v27 = aks_keybag_persona_delete();
          if (v27)
          {
            sub_100017164("createPersonaKeyForUser", @"Failed to delete persona key with error:0x%x", v5, v6, v7, v8, v9, v10, v27);
            return 22;
          }
          CFStringRef v11 = @"Successful deleted persona key";
        }
      }
    }
    else
    {
      CFStringRef v11 = @"Failed to get cstring from uuid string";
    }
  }
  else
  {
    CFStringRef v11 = @"Failed to get volume path";
  }
  sub_100017164("createPersonaKeyForUser", v11, v5, v6, v7, v8, v9, v10, v28);
  return 22;
}

uint64_t sub_100016F60(int a1, CFStringRef theString, const __CFString *a3)
{
  memset(uu, 0, sizeof(uu));
  *(_OWORD *)buffer = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  if (!CFStringGetCString(theString, buffer, 256, 0x8000100u))
  {
    CFStringRef v10 = @"Failed to get cstring from uuid string";
    goto LABEL_5;
  }
  if (uuid_parse(buffer, uu))
  {
    CFStringRef v10 = @"failed to parse unique string to uuid_t";
LABEL_5:
    sub_100017164("deletePersonaKeyForUser", v10, v4, v5, v6, v7, v8, v9, v34);
    return 22;
  }
  uint64_t v13 = aks_keybag_persona_delete();
  uint64_t v11 = v13;
  if (!a3 || v13)
  {
    if (v13) {
      sub_100017164("deletePersonaKeyForUser", @"persona key delete failed with 0x%x", v14, v15, v16, v17, v18, v19, v13);
    }
  }
  else
  {
    memset(v36, 0, sizeof(v36));
    sub_100017164("deletePersonaKeyForUser", @"Non Null VolumeID, parsing the uuid", v14, v15, v16, v17, v18, v19, v34);
    bzero(in, 0x400uLL);
    if (!CFStringGetCString(a3, in, 1024, 0x8000100u))
    {
      CFStringRef v26 = @"failed to convert to CString";
      goto LABEL_16;
    }
    if (uuid_parse(in, v36))
    {
      CFStringRef v26 = @"volume uuid_parse failed";
LABEL_16:
      sub_100017164("deletePersonaKeyForUser", v26, v20, v21, v22, v23, v24, v25, v35);
      return 0;
    }
    sub_100017164("deletePersonaKeyForUser", @"uuid_parse SUCCESS, Unmaping the Persona Volume", v20, v21, v22, v23, v24, v25, v35);
    uint64_t v27 = aks_set_keybag_for_volume();
    uint64_t v11 = v27;
    if (v27) {
      sub_100017164("deletePersonaKeyForUser", @"persona volume unmap failed with 0x%x", v28, v29, v30, v31, v32, v33, v27);
    }
  }
  return v11;
}

void sub_100017164(void *a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!a1) {
    a1 = &unk_10002AE19;
  }
  sub_1000171A0((int)a1, a2, &a9);
}

void sub_1000171A0(int a1, CFStringRef format, va_list arguments)
{
  if (dword_100039868)
  {
    if (&_MOLogWriteV) {
      BOOL v3 = qword_100039940 == 0;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3) {
      MOLogWriteV();
    }
  }
  else
  {
    CFStringRef v4 = CFStringCreateWithFormatAndArguments(0, 0, format, arguments);
    if (v4)
    {
      CFStringRef v5 = v4;
      if (CFStringGetCString(v4, buffer, 1024, 0x8000100u))
      {
        size_t v6 = strlen(buffer);
        if (v6)
        {
          size_t v7 = v6;
          if (v6 <= 0x3FF)
          {
            buffer[v6] = 10;
            size_t v7 = v6 + 1;
          }
          fprintf(__stdoutp, "MKB_INIT: %s", buffer);
          if (dword_1000397C8 != -1) {
            sub_100010A10(dword_1000397C8, buffer, v7);
          }
        }
      }
      CFRelease(v5);
    }
  }
}

void sub_1000172D8(const char *a1)
{
  time_t v19 = 0;
  time(&v19);
  xpc_object_t v2 = localtime(&v19);
  BOOL v3 = asctime(v2);
  snprintf(__str, 0x50uLL, "%s-%s", a1, v3);
  __str[strlen(__str) - 1] = 0;
  sub_100017164("fatality", @"FATAL KEYBAG ERROR: %s", v4, v5, v6, v7, v8, v9, (char)a1);
  sub_100006950("keybagd", __str);
  sub_100006950("auto-boot", "false");
  sub_100017164("fatality", @"Rebooting...", v10, v11, v12, v13, v14, v15, v18);
  uint64_t v16 = fopen("/dev/console", "a");
  if (v16)
  {
    uint64_t v17 = v16;
    fprintf(v16, "FATAL KEYBAG ERROR: %s\n", a1);
    fwrite("REBOOTING INTO RECOVERY MODE.\n", 0x1EuLL, 1uLL, v17);
    fclose(v17);
  }
  reboot(0);
  exit(71);
}

BOOL sub_1000173E0()
{
  size_t __len = 1023;
  bzero(__big, 0x400uLL);
  return !sysctlbyname("kern.bootargs", __big, &__len, 0, 0) && strnstr(__big, "keybag_initlog", __len) != 0;
}

uint64_t sub_100017488()
{
  int v0 = sub_100017160();
  uint64_t v1 = 4294967293;
  if ((sub_1000053A0() & 1) == 0)
  {
    current_persona_proximate_mach_timebase_info info = voucher_get_current_persona_proximate_info();
    int v3 = 0;
    if (current_persona_proximate_info) {
      int v3 = -1;
    }
    if (v3 != v0 || v0 == -1) {
      return 0;
    }
    else {
      return 4294967293;
    }
  }
  return v1;
}

uint64_t sub_100017520()
{
  if ((byte_100039920 & 1) == 0)
  {
    sub_100017488();
    aks_get_lock_state();
  }
  return byte_100039920;
}

sqlite3 *sub_100017578(uint64_t a1)
{
  uint64_t result = sub_10000FB0C("/private/var//keybags/backup/backup_keys_cache.sql3", 0, 0);
  if (result)
  {
    int v3 = result;
    if (sub_100010140(result, *(const void **)(a1 + 32)))
    {
      memset(out, 0, 37);
      uuid_unparse(*(const unsigned __int8 **)(a1 + 32), out);
      sub_100017164("clear_volume_backup_keys_block_invoke", @"Failed to delete cached keys for volume %s (err=%d)", v4, v5, v6, v7, v8, v9, (char)out);
    }
    return (sqlite3 *)sub_10000FB14(v3);
  }
  return result;
}

uint64_t sub_100017644()
{
  int v0 = aks_clear_backup_bag();
  if (v0)
  {
    sub_100017164("unregister_backup_bag", @"Can't unregister OTA Backup bag with AppleKeyStore: %x.", v1, v2, v3, v4, v5, v6, v0);
    return 0xFFFFFFFFLL;
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100017578;
    block[3] = &unk_100031288;
    block[4] = &unk_100039930;
    dispatch_sync((dispatch_queue_t)qword_100039928, block);
    return 0;
  }
}

uint64_t sub_1000176F0(const __CFData *a1, uint64_t a2, uint64_t a3, CFDataRef *a4, int a5)
{
  uint64_t v5 = 0xFFFFFFFFLL;
  if (!a1) {
    return v5;
  }
  CFDataGetBytePtr(a1);
  CFDataGetLength(a1);
  int bag = aks_load_bag();
  if (bag)
  {
    sub_100017164("register_backup_bag", @"Can't read OTA Backup bag: %x.", v10, v11, v12, v13, v14, v15, bag);
    return 0xFFFFFFFFLL;
  }
  int v16 = aks_set_backup_bag();
  if (v16)
  {
    sub_100017164("register_backup_bag", @"Can't register OTA Backup bag with AppleKeyStore: %x.", v17, v18, v19, v20, v21, v22, v16);
    return 0xFFFFFFFFLL;
  }
  if (a4) {
    *a4 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, 0, 0, kCFAllocatorDefault);
  }
  if (a5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100017578;
    block[3] = &unk_100031288;
    block[4] = &unk_100039930;
    dispatch_sync((dispatch_queue_t)qword_100039928, block);
  }
  return 0;
}

uint64_t start(int a1, uint64_t a2)
{
  int v4 = setiopolicy_np(9, 0, 1);
  if (v4) {
    sub_100017164("main", @"Error setting io policy: %d", v5, v6, v7, v8, v9, v10, v4);
  }
  if (a1 == 2 && !strcmp(*(const char **)(a2 + 8), "--init"))
  {
    if (sub_100007F40(":/product", @"boot-ios-diagnostics") == 1)
    {
      long long v39 = __stdoutp;
      long long v40 = "****** DIAGNOSTICS MODE ENABLED, SKIP INIT ****\n";
      size_t v41 = 48;
    }
    else if (os_variant_uses_ephemeral_storage())
    {
      long long v39 = __stdoutp;
      long long v40 = "****** DEVICE HAS EPHEMERAL DATA VOLUME, SKIP INIT ****\n";
      size_t v41 = 56;
    }
    else
    {
      if (sub_1000173E0())
      {
        dword_1000397C8 = open("/var/logs/keybagd_init.log", 522, 448);
        if (dword_1000397C8 == -1) {
          fwrite("****** FAILED TO OPEN LOGFILE ****\n", 0x23uLL, 1uLL, __stdoutp);
        }
      }
      sub_100008F6C((uint64_t)sub_100017164);
      sub_100008F78((uint64_t)sub_1000171A0);
      fwrite("****** IN MKB_INIT ****\n", 0x18uLL, 1uLL, __stdoutp);
      qword_100039928 = (uint64_t)dispatch_queue_create("com.apple.mobile.keybagd.db", 0);
      sub_100017D64();
      sub_100018014();
      if (dword_1000397C8 != -1) {
        close(dword_1000397C8);
      }
      long long v39 = __stdoutp;
      long long v40 = "****** DONE MKB_INIT ****\n";
      size_t v41 = 26;
    }
    fwrite(v40, v41, 1uLL, v39);
    exit(0);
  }
  sub_100008F6C((uint64_t)sub_100017164);
  sub_100008F78((uint64_t)sub_1000171A0);
  uint64_t v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  BOOL v12 = sub_100010F50();
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  if (v12)
  {
    uint64_t v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    uint64_t v13 = v11;
  }
  qword_100039870 = (uint64_t)dispatch_queue_create("com.apple.mobile.keybagd.passcode", v13);
  qword_100039928 = (uint64_t)dispatch_queue_create("com.apple.mobile.keybagd.db", v14);
  qword_100039878 = (uint64_t)dispatch_queue_create("com.apple.mobile.keybagd.seshat", v11);
  if (!qword_100039870 || !qword_100039928)
  {
    sub_100017164("main", @"Can't create dispatch resources.", v15, v16, v17, v18, v19, v20, v42);
    return 71;
  }
  if (sub_1000210E4()) {
    sub_100017164("main", @"Can't register for notifications with AppleKeyStore", v21, v22, v23, v24, v25, v26, v42);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", global_queue, &stru_1000312C8);
  sub_10000E54C();
  openlog("keybagd", 1, 24);
  uint64_t v28 = getenv("__OSINSTALL_ENVIRONMENT");
  if (v28 || (&_MOLogEnableDiskLogging ? (BOOL v29 = &_MOLogOpen == 0) : (BOOL v29 = 1), v29))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 67109120;
    BOOL v44 = v28 == 0;
    uint64_t v31 = "MOLog* unavailable, disabling MOLog*() based logging (enable: %d).";
    uint32_t v32 = 8;
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v31, buf, v32);
    goto LABEL_24;
  }
  qword_100039940 = MOLogOpen();
  if (!qword_100039940)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    uint64_t v31 = "MOLogOpen() failed, disabling MOLog*() based logging.";
    uint32_t v32 = 2;
    goto LABEL_23;
  }
  MOLogEnableDiskLogging();
LABEL_24:
  sub_100008F6C((uint64_t)sub_100017164);
  sub_100008F78((uint64_t)sub_1000171A0);
  dword_100039868 = 1;
  if (sub_1000053A0()) {
    sub_100017164("main", @"enhanced apfs mode", v33, v34, v35, v36, v37, v38, v42);
  }
  sub_100006110();
  dispatch_sync((dispatch_queue_t)qword_100039878, &stru_100031758);
  dispatch_async((dispatch_queue_t)qword_100039878, &stru_100031798);
  xpc_activity_register("com.apple.mobile.keybagd.data-analytics", XPC_ACTIVITY_CHECK_IN, &stru_1000317D8);
  dispatch_async((dispatch_queue_t)qword_100039870, &stru_100031878);
  xpc_activity_register("com.apple.mobile.keybagd.space_repetition", XPC_ACTIVITY_CHECK_IN, &stru_1000318B8);
  fsctl("/private/var/", 0x40104A60uLL, &unk_100039930, 0);
  sub_1000041D0();
  CFRunLoopRun();
  return 0;
}

uint64_t sub_100017D64()
{
  CFDictionaryRef v6 = sub_100004444();
  if (!v6)
  {
    if (aks_get_system() != -536870160) {
      goto LABEL_18;
    }
    goto LABEL_10;
  }
  sub_100017164("load_devicebag", @"Found system keybag plist on filesystem.", v0, v1, v2, v3, v4, v5, v60);
  CFDataRef v13 = (const __CFData *)sub_1000106EC(v6, @"KeyBagKeys");
  if (!v13) {
    sub_100017164("load_devicebag", @"No valid keybag data found in plist.", v7, v8, v9, v10, v11, v12, v60);
  }
  CFDataRef Value = CFDictionaryGetValue(v6, @"KeybagxART");
  if (aks_get_system() == -536870160)
  {
    if (v13)
    {
      sub_100017164("load_devicebag", @"Try to load filesystem bag as handle 0.", v15, v16, v17, v18, v19, v20, v60);
      if (Value)
      {
        int v21 = sub_1000053A0();
        char Length = CFDataGetLength(v13);
        if (v21)
        {
          sub_100017164("load_devicebag", @"xART based bag should have been loaded at startup, let's ignore it (eAPFS, len=%d)", v23, v24, v25, v26, v27, v28, Length);
          goto LABEL_18;
        }
        sub_100017164("load_devicebag", @"xART based bag should have been loaded at startup, let's try to load it anyway (NOT eAPFS, len=%d)", v23, v24, v25, v26, v27, v28, Length);
      }
      CFDataGetBytePtr(v13);
      CFDataGetLength(v13);
      int bag = aks_load_bag();
      if (bag)
      {
        sub_100017164("load_devicebag", @"Uh Oh! Kernel doesn't like this keybag: 0x%08x.", v31, v32, v33, v34, v35, v36, bag);
        goto LABEL_18;
      }
      int v37 = aks_set_system();
      aks_unload_bag();
      if (v37)
      {
        sub_100017164("load_devicebag", @"Uh Oh! Can't set system keybag:0x%08x.", v15, v16, v17, v18, v19, v20, v37);
        goto LABEL_18;
      }
      CFStringRef v29 = @"Handle 0 loaded.";
      goto LABEL_17;
    }
LABEL_10:
    CFStringRef v29 = @"No system keybag found on filesystem.";
LABEL_17:
    sub_100017164("load_devicebag", v29, v15, v16, v17, v18, v19, v20, v60);
  }
LABEL_18:
  char v38 = sub_1000053A0();
  int system = aks_get_system();
  if (v38)
  {
    if (system)
    {
      sub_100017164("load_devicebag", @"No system keybag loaded.", v40, v41, v42, v43, v44, v45, v60);
      if (!v6) {
        goto LABEL_26;
      }
LABEL_25:
      CFRelease(v6);
      goto LABEL_26;
    }
    sub_100017164("load_devicebag", @"Update system keybag on disk after load.", v40, v41, v42, v43, v44, v45, v60);
    sub_100008028(0, 0);
    if (v6) {
      goto LABEL_25;
    }
  }
  else
  {
    if (system) {
      sub_1000172D8("failed to load system bag");
    }
    if (sub_10000855C("/private/var/", 0)) {
      sub_1000172D8("data volume mapping");
    }
    if (v6) {
      goto LABEL_25;
    }
  }
LABEL_26:
  sub_100017164("load_devicebag", @"Setup allow list:", v46, v47, v48, v49, v50, v51, v60);
  int v52 = aks_setupallowlist_fs();
  if (v52) {
    sub_100017164("load_devicebag", @"aks_setupallowlist_fs completed with %d", v53, v54, v55, v56, v57, v58, v52);
  }
  unlink("/private/var//keybags/backup/backup_keys_cache.db");
  return unlink("/private/var//keybags/backup/backup_keys_cache_old.db");
}

uint64_t sub_100018014()
{
  memset(&v1, 0, sizeof(v1));
  if (stat("/private/var//keybags/backup", &v1) < 0 && *__error() == 2) {
    mkdir("/private/var//keybags/backup", 0x1C0u);
  }
  return sub_1000105E8("/private/var//keybags/backup", 0, 1);
}

void sub_100018090(id a1, void *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (!strcmp(string, "com.apple.mobile.keybagd.first_unlock"))
  {
    byte_100039920 = 1;
    sub_100017488();
    unsigned int v13 = 0;
    uint64_t v12 = 0;
    int lock_state = aks_get_lock_state();
    if (lock_state)
    {
      sub_100017164("report_first_unlock", @"get_lock_state() -> 0x%x", v5, v6, v7, v8, v9, v10, lock_state);
    }
    else
    {
      LOBYTE(v12) = BYTE1(v13) & 0x20 | (v13 >> 3) & 0x40;
      sub_1000143CC(&v12, v4, v5, v6, v7, v8, v9, v10, v11);
    }
    dispatch_async((dispatch_queue_t)qword_100039878, &stru_100031308);
  }
}

void sub_10001814C()
{
  time_t v9 = 0;
  CFDictionaryRef v0 = sub_100011DE8();
  if (v0)
  {
    CFDictionaryRef v1 = v0;
    if (!sub_100011A9C(v0, &v9))
    {
      if (sub_1000121C8(v1)) {
        sub_100017164("KBSeshatProcessTTR", @"failed to serialize TTR", v2, v3, v4, v5, v6, v7, v8);
      }
      else {
        sub_10001E80C(v9);
      }
    }
    CFRelease(v1);
  }
}

void sub_1000181C0(int a1, char a2)
{
  xpc_transaction_begin();
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10001824C;
  block[3] = &unk_100031328;
  int v5 = a1;
  char v6 = a2;
  dispatch_async((dispatch_queue_t)qword_100039870, block);
}

void sub_10001824C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100017164("update_system_keybag_block_invoke", @"Updating Keybag handle %ld with %s", a3, a4, a5, a6, a7, a8, *(_DWORD *)(a1 + 32));
  sub_100008028(*(_DWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 36));

  xpc_transaction_end();
}

void sub_1000182C8(int a1)
{
  if (a1 == 1)
  {
    sub_100017488();
    sub_100018414();
  }
  else if (!a1)
  {
    dispatch_async((dispatch_queue_t)qword_100039878, &stru_100031368);
    unlink("/var/root/.mkb_seshat_health");
    char v1 = 1;
    goto LABEL_6;
  }
  char v1 = 2;
LABEL_6:
  dispatch_async((dispatch_queue_t)qword_100039878, &stru_1000313A8);

  sub_100018644(1, v1);
}

void sub_10001834C(id a1)
{
  *(void *)__str = 0;
  uint64_t v20 = 0;
  int v1 = sub_100006C74();
  snprintf(__str, 0x10uLL, "%u", v1 + 1);
  if (sub_100006950("seshat-count", __str))
  {
    CFStringRef v8 = @"failed to update nvram";
  }
  else
  {
    uint64_t v16 = __str;
    CFStringRef v8 = @"success setting to '%s'";
  }
  sub_100017164("handle_recovery_completion_block_invoke", v8, v2, v3, v4, v5, v6, v7, (char)v16);
  uint64_t v18 = 1;
  sub_100013C48(&v18, v9, v10, v11, v12, v13, v14, v15, v17);
}

void sub_100018414()
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2000000000;
  int v16 = -1;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2000000000;
  v12[3] = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2000000000;
  v11[3] = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2000000000;
  v10[3] = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2000000000;
  char v9 = 0;
  int lock_state = aks_get_lock_state();
  if (lock_state)
  {
    int v7 = lock_state;
    sub_100017164("seshat_reset_count_after_wc_recovery", @"get_lock_state() -> 0x%x", v1, v2, v3, v4, v5, v6, lock_state);
    *((_DWORD *)v14 + 6) = v7;
  }
  else
  {
    *((_DWORD *)v14 + 6) = 0;
  }
  if (*((_DWORD *)v14 + 6)) {
    sub_100017164("seshat_reset_count_after_wc_recovery", @"failed to reset SEshat: %x", v1, v2, v3, v4, v5, v6, *((_DWORD *)v14 + 6));
  }
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v13, 8);
}

void sub_100018614(id a1)
{
  uint64_t v1 = sub_100017488();

  sub_1000063DC(0, v1);
}

void sub_100018644(int a1, char a2)
{
  unsigned int v13 = 1;
  uint64_t v12 = 0;
  sub_100017488();
  if (!aks_get_lock_state())
  {
    LOWORD(v12) = ((4 * v13) & 0x100 | (((v13 >> 5) & 1) << 9) & 0xEFFF | (v13 >> 3) & 0x400 | (v13 >> 1) & 0x800 | (((v13 >> 9) & 1) << 12) | ((16 * (a2 & 3)) | ((_BYTE)a1 << 6)) | 1) ^ 0x100;
    switch(a1)
    {
      case 2:
LABEL_5:
        sub_1000121F0(@"com.apple.mobile.keybagd.sidp.recovery", 0, v12);
        return;
      case 1:
        sub_1000141A8(&v12, v4, v5, v6, v7, v8, v9, v10, v11);
        break;
      case 0:
        goto LABEL_5;
      default:
        sub_100017164("_collect_recovery_stats", @"invalid event %d", v5, v6, v7, v8, v9, v10, a1);
        break;
    }
  }
}

void sub_100018730()
{
  xpc_transaction_begin();
  CFDictionaryRef v0 = qword_100039928;

  dispatch_async(v0, &stru_1000313E8);
}

void sub_100018768(id a1)
{
  sub_100018790();

  xpc_transaction_end();
}

uint64_t sub_100018790()
{
  if ((byte_100039948 & 1) == 0)
  {
    CFDictionaryRef v0 = sub_10000F7E8("/private/var//keybags/backup/backup_keys_cache.sql3", 0, 0, 0);
    if (v0)
    {
      uint64_t v1 = v0;
      BOOL v2 = sub_10000F664(v0);
      sub_10000FB14(v1);
      if (v2)
      {
        sub_100017164("db_check_once", @"%s is corrupted, discarding", v3, v4, v5, v6, v7, v8, (char)"/private/var//keybags/backup/backup_keys_cache.sql3");
        unlink("/private/var//keybags/backup/backup_keys_cache.sql3");
      }
      else
      {
        sub_100017164("db_check_once", @"%s is ok", v3, v4, v5, v6, v7, v8, (char)"/private/var//keybags/backup/backup_keys_cache.sql3");
      }
      byte_100039948 = 1;
    }
  }
  aks_drain_backup_keys_info();
  return 0;
}

uint64_t sub_100018A7C(char a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000;
  uint64_t v8 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000;
  v3[2] = sub_100018B30;
  v3[3] = &unk_100031410;
  char v4 = a1;
  v3[4] = &v5;
  dispatch_sync((dispatch_queue_t)qword_100039870, v3);
  uint64_t v1 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v1;
}

void sub_100018B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (sub_100017488())
  {
    uint64_t v10 = sub_100017160();
    CFDictionaryRef v11 = sub_1000046AC(v10);
  }
  else
  {
    CFDictionaryRef v11 = sub_100004444();
  }
  CFDictionaryRef v18 = v11;
  if (v11)
  {
    if (*(unsigned char *)(a1 + 40)) {
      CFStringRef v19 = @"BackupKeyBagKeys";
    }
    else {
      CFStringRef v19 = @"OpaqueStuff";
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFDictionaryGetValue(v11, v19);
    uint64_t v20 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (v20) {
      CFRetain(v20);
    }
    CFRelease(v18);
  }
  else
  {
    sub_100017164("keybagd_getpasscodeblob_block_invoke", @"Huh? can't load the bag. That makes no sense", v12, v13, v14, v15, v16, v17, a9);
  }
}

uint64_t sub_100018BF4(uint64_t a1)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2000000000;
  int v7 = -1;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000;
  v3[2] = sub_100018CA8;
  v3[3] = &unk_100031438;
  v3[4] = &v4;
  void v3[5] = a1;
  dispatch_sync((dispatch_queue_t)qword_100039870, v3);
  uint64_t v1 = *((unsigned int *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t sub_100018CA8(uint64_t a1)
{
  if (sub_100017488())
  {
    int v2 = sub_100017488();
    uint64_t v3 = sub_100017160();
    uint64_t result = sub_1000054C8(v2, v3, *(const void **)(a1 + 40), 0);
  }
  else
  {
    uint64_t result = sub_10000514C(0, "/private/var/", *(const void **)(a1 + 40), 1, 0);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_100018D18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2000000000;
  int v9 = -1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000;
  v5[2] = sub_100018DD0;
  v5[3] = &unk_100031460;
  v5[4] = &v6;
  void v5[5] = a1;
  v5[6] = a2;
  v5[7] = a3;
  dispatch_sync((dispatch_queue_t)qword_100039870, v5);
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_100018DD0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100017164("keybagd_registerbackup_block_invoke", @"handle_registerbackupbag", a3, a4, a5, a6, a7, a8, v11);
  CFDataRef v9 = (const __CFData *)a1[5];
  if (v9)
  {
    CFTypeRef cf = 0;
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = sub_1000176F0(v9, a1[6], a1[7], (CFDataRef *)&cf, 1);
    if (*(_DWORD *)(*(void *)(a1[4] + 8) + 24)) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = cf == 0;
    }
    if (!v10)
    {
      sub_100004814(cf);
      CFRelease(cf);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = sub_100017644();
    sub_100004814(0);
  }
}

uint64_t sub_100018E90(const __CFData *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = 0;
  CFStringRef v19 = &v18;
  uint64_t v20 = 0x2000000000;
  uint64_t v21 = 0;
  if (CFDataGetLength(a1) == 16)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100018FCC;
    block[3] = &unk_100031488;
    void block[4] = &v18;
    void block[5] = a1;
    block[6] = a2;
    block[7] = a3;
    dispatch_sync((dispatch_queue_t)qword_100039928, block);
    if (v19[3])
    {
      int v13 = ++dword_10003994C;
    }
    else
    {
      ++dword_100039950;
      int v13 = dword_10003994C;
    }
    if (v13 >= 64)
    {
      uint64_t v22 = v13;
      sub_10001455C(&v22, v6, v7, v8, v9, v10, v11, v12, v16);
      dword_10003994C = 0;
    }
    if (dword_100039950 >= 64)
    {
      uint64_t v22 = dword_100039950;
      sub_100014680(&v22, v6, v7, v8, v9, v10, v11, v12, v16);
      dword_100039950 = 0;
    }
  }
  uint64_t v14 = v19[3];
  _Block_object_dispose(&v18, 8);
  return v14;
}

uint64_t sub_100018FCC(uint64_t a1)
{
  memset(dst, 0, sizeof(dst));
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
  uuid_copy(dst, BytePtr);
  uint64_t result = (uint64_t)sub_100019080(dst, *(void *)(a1 + 48), *(CFTypeRef **)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t result = sub_100018790();
    if (result)
    {
      uint64_t result = (uint64_t)sub_100019080(dst, *(void *)(a1 + 48), *(CFTypeRef **)(a1 + 56));
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    }
  }
  return result;
}

CFDataRef sub_100019080(unsigned __int8 *src, unint64_t a2, CFTypeRef *a3)
{
  v14[0] = 0;
  v14[1] = 0;
  long long v11 = 0u;
  memset(v12, 0, sizeof(v12));
  long long v9 = 0u;
  long long v10 = 0u;
  memset(v8, 0, sizeof(v8));
  unint64_t v13 = bswap64(a2);
  uuid_copy((unsigned __int8 *)v14, src);
  uint64_t v4 = sub_10000FB0C("/private/var//keybags/backup/backup_keys_cache.sql3", 0, 0);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  if (sub_10000FD38(v4, (sqlite3_int64 *)&v13, v8, a3)) {
    CFDataRef v6 = 0;
  }
  else {
    CFDataRef v6 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v8, bswap32(v9) + 36);
  }
  sub_10000FB14(v5);
  return v6;
}

uint64_t sub_100019180(CFDataRef theData, char a2)
{
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x2000000000;
  int v11 = -1;
  if (theData && CFDataGetLength(theData) != 16)
  {
    uint64_t v4 = 4294966296;
    *((_DWORD *)v9 + 6) = -1000;
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100019268;
    block[3] = &unk_1000314B0;
    char v7 = a2;
    void block[4] = &v8;
    void block[5] = theData;
    dispatch_sync((dispatch_queue_t)qword_100039928, block);
    uint64_t v4 = *((unsigned int *)v9 + 6);
  }
  _Block_object_dispose(&v8, 8);
  return v4;
}

void sub_100019268(uint64_t a1)
{
  memset(dst, 0, sizeof(dst));
  memset(out, 0, 37);
  CFDataRef v2 = *(const __CFData **)(a1 + 40);
  if (v2)
  {
    BytePtr = CFDataGetBytePtr(v2);
    uuid_copy(dst, BytePtr);
    uuid_unparse(dst, out);
  }
  uint64_t v4 = sub_10000FB0C("/private/var//keybags/backup/backup_keys_cache.sql3", 0, 0);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 48))
    {
      if (v6) {
        int v7 = sub_10001021C(v4, dst);
      }
      else {
        int v7 = sub_1000102F4(v4);
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;
    }
    else
    {
      if (v6) {
        int v8 = sub_100010384(v4, dst);
      }
      else {
        int v8 = sub_100010464(v4);
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
      sub_100010514(v5, 259200);
    }
    sub_10000FB14(v5);
    uint64_t v15 = "Start";
    if (!*(unsigned char *)(a1 + 48)) {
      uint64_t v15 = "End";
    }
    sub_100017164("keybagd_startstopBackup_block_invoke", @"%s backup session (volume: %s - rc: %d)", v9, v10, v11, v12, v13, v14, (char)v15);
  }
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == -1 && *__error() == 2) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

uint64_t sub_100019414(const __CFData *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  int v14 = -1;
  if (CFDataGetLength(a1) == 16)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100019508;
    block[3] = &unk_1000314D8;
    void block[6] = a2;
    block[7] = a3;
    void block[8] = a4;
    void block[4] = &v11;
    void block[5] = a1;
    dispatch_sync((dispatch_queue_t)qword_100039870, block);
    uint64_t v8 = *((unsigned int *)v12 + 6);
  }
  else
  {
    uint64_t v8 = 4294966296;
    *((_DWORD *)v12 + 6) = -1000;
  }
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t sub_100019508(uint64_t a1)
{
  memset(dst, 0, sizeof(dst));
  memset(out, 0, 37);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
  uuid_copy(dst, BytePtr);
  uuid_unparse(dst, out);
  sub_100017164("keybagd_enablebackup_block_invoke", @"Enabling backup for volume %s", v3, v4, v5, v6, v7, v8, (char)out);
  uint64_t v15 = aks_backup_enable_volume();
  if (v15)
  {
    sub_100017164("keybagd_enablebackup_block_invoke", @"Could not enable backup for volume %s, err=%x", v9, v10, v11, v12, v13, v14, (char)out);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100017578;
    block[3] = &unk_100031288;
    void block[4] = dst;
    dispatch_sync((dispatch_queue_t)qword_100039928, block);
    **(void **)(a1 + 64) = CFDataCreate(kCFAllocatorDefault, 0, 0);
  }
  uint64_t result = sub_100010F88(v15);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_100019678(const __CFData *a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000;
  int v8 = -1;
  if (CFDataGetLength(a1) == 16)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 0x40000000;
    _DWORD v4[2] = sub_100019738;
    v4[3] = &unk_100031500;
    v4[4] = &v5;
    v4[5] = a1;
    dispatch_sync((dispatch_queue_t)qword_100039870, v4);
  }
  uint64_t v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_100019738(uint64_t a1)
{
  memset(dst, 0, sizeof(dst));
  memset(out, 0, 37);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
  uuid_copy(dst, BytePtr);
  uuid_unparse(dst, out);
  sub_100017164("keybagd_disablebackup_block_invoke", @"Disabling backup for volume %s", v3, v4, v5, v6, v7, v8, (char)out);
  uint64_t v15 = aks_backup_disable_volume();
  if (v15)
  {
    sub_100017164("keybagd_disablebackup_block_invoke", @"Could not disable backup for volume %s, err=%x", v9, v10, v11, v12, v13, v14, (char)out);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100017578;
    block[3] = &unk_100031288;
    void block[4] = dst;
    dispatch_sync((dispatch_queue_t)qword_100039928, block);
  }
  uint64_t result = sub_100010F88(v15);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_10001987C(uint64_t a1, uint64_t a2, int a3, char a4, int a5)
{
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2000000000;
  int v42 = -1;
  int v38 = 1;
  int v10 = sub_100017488();
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2800000000;
  v37[3] = 0;
  v37[4] = 0;
  if ((a4 & 2) != 0) {
    int v11 = -a5;
  }
  else {
    int v11 = v10;
  }
  int lock_state = aks_get_lock_state();
  *((_DWORD *)v40 + 6) = lock_state;
  if (lock_state)
  {
    sub_100017164("keybagd_stashcreate", @"get_lock_state() -> 0x%x", v13, v14, v15, v16, v17, v18, lock_state);
    goto LABEL_25;
  }
  int v19 = a4 & 4;
  if ((a3 - 1) >= 2)
  {
    int v36 = -1;
    if (sub_100019B50(0, 0, &v36)) {
      BOOL v21 = 0;
    }
    else {
      BOOL v21 = v36 == 1;
    }
    int v20 = v21;
    if ((a4 & 4) == 0) {
      goto LABEL_16;
    }
  }
  else
  {
    int v20 = 0;
    if ((a4 & 4) == 0) {
      goto LABEL_16;
    }
  }
  sub_100017164("keybagd_stashcreate", @"Skipping SE KUD", v13, v14, v15, v16, v17, v18, v25);
LABEL_16:
  int v22 = a4 & 1;
  if (v20) {
    sub_100017164("keybagd_stashcreate", @"WA: Preserving SE KUD since stash is committed", v13, v14, v15, v16, v17, v18, v25);
  }
  if ((a3 - 1) <= 1 && !v19 && (v38 & 0x2000) != 0)
  {
    sub_100018414();
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100019C7C;
    block[3] = &unk_100031520;
    int v35 = v11;
    dispatch_sync((dispatch_queue_t)qword_100039878, block);
  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 0x40000000;
  v30[2] = sub_100019DFC;
  v30[3] = &unk_100031548;
  v30[6] = a1;
  v30[7] = a2;
  int v31 = v11;
  int v32 = a3;
  int v33 = v22;
  v30[4] = &v39;
  v30[5] = v37;
  dispatch_sync((dispatch_queue_t)qword_100039870, v30);
  if (!(*((_DWORD *)v40 + 6) | v19) && (v38 & 0x2000) != 0)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 0x40000000;
    v26[2] = sub_100019EE4;
    v26[3] = &unk_100031570;
    BOOL v28 = (a3 - 1) < 2;
    char v29 = v20;
    int v27 = v11;
    v26[4] = &v39;
    v26[5] = a1;
    v26[6] = a2;
    dispatch_sync((dispatch_queue_t)qword_100039878, v26);
  }
LABEL_25:
  uint64_t v23 = *((unsigned int *)v40 + 6);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(&v39, 8);
  return v23;
}

uint64_t sub_100019B50(int a1, char a2, _DWORD *a3)
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2000000000;
  int v19 = 0;
  if ((a2 & 2) != 0) {
    int v4 = -a1;
  }
  else {
    int v4 = sub_100017488();
  }
  v14[0] = 0;
  v14[1] = v14;
  void v14[2] = 0x2000000000;
  char v15 = 0;
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2000000000;
  int v13 = 2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000;
  _OWORD v8[2] = sub_10001A5F8;
  void v8[3] = &unk_1000315E8;
  int v9 = v4;
  void v8[4] = v14;
  v8[5] = &v16;
  v8[6] = &v10;
  dispatch_sync((dispatch_queue_t)qword_100039870, v8);
  uint64_t v5 = v17;
  uint64_t v6 = *((unsigned int *)v17 + 6);
  if (a3 && !v6)
  {
    *a3 = *((_DWORD *)v11 + 6);
    uint64_t v6 = *((unsigned int *)v5 + 6);
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v16, 8);
  return v6;
}

void sub_100019C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned __int8 v45 = 0;
  unsigned int v43 = 0;
  int v42 = 0;
  CFDataRef theData = 0;
  char v40 = -1;
  uint64_t v44 = sub_10001EDCC(65000, a2, a3, a4, a5, a6, a7, a8);
  if (v44)
  {
    unint64_t v15 = sub_10001FA8C((id *)&v44, (CFTypeRef *)&theData, (uint64_t)&v40, (uint64_t)&v42, (uint64_t)&v43);
    if (v15 == 0x900000000000)
    {
      if (sub_1000065E4(*(unsigned int *)(a1 + 32), &v45, 0, 0))
      {
        sub_100017164("keybagd_stashcreate_block_invoke", @"KBGetSEStuff() failed", v22, v23, v24, v25, v26, v27, v38);
      }
      else
      {
        sub_100017164("keybagd_stashcreate_block_invoke", @"got slot = %d, gwc = %d", v22, v23, v24, v25, v26, v27, v45);
        BytePtr = CFDataGetBytePtr(theData);
        if (BytePtr[v45] != 238)
        {
          int v36 = CFDataGetBytePtr(theData);
          if ((char)v36[v45] < 0)
          {
            sub_100017164("keybagd_stashcreate_block_invoke", @"slot is v2", v30, v31, v32, v33, v34, v35, v39);
            int v37 = sub_100005E98(*(unsigned int *)(a1 + 32), 3, v43);
            if (v37) {
              sub_100017164("keybagd_stashcreate_block_invoke", @"arming of nonce failed %x", v30, v31, v32, v33, v34, v35, v37);
            }
          }
        }
      }
    }
    else
    {
      sub_100017164("keybagd_stashcreate_block_invoke", @"getData() -> 0x%x:0x%x", v16, v17, v18, v19, v20, v21, v15);
    }
    if (v44) {
      sub_10001EDD8((id *)&v44, v29, v30, v31, v32, v33, v34, v35, v39);
    }
  }
  else
  {
    sub_100017164("keybagd_stashcreate_block_invoke", @"no SE ctx", v9, v10, v11, v12, v13, v14, v38);
  }
  if (theData) {
    CFRelease(theData);
  }
}

void sub_100019DFC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = "NULL";
  if (a1[6] && a1[7]) {
    uint64_t v10 = "SECRET";
  }
  sub_100017164("keybagd_stashcreate_block_invoke_2", @"passcode=%s", a3, a4, a5, a6, a7, a8, (char)v10);
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = aks_stash_create_for_bag_and_kek();
  uint64_t v17 = *(void *)(a1[4] + 8);
  if (*(_DWORD *)(v17 + 24))
  {
    sub_100017164("keybagd_stashcreate_block_invoke_2", @"aks_stash_create_for_bag_and_kek failed %x", v11, v12, v13, v14, v15, v16, *(_DWORD *)(v17 + 24));
  }
  else
  {
    *(_DWORD *)(v17 + 24) = 0;
    sub_100017164("keybagd_stashcreate_block_invoke_2", @"aks_stash_create_for_bag_and_kek success", v11, v12, v13, v14, v15, v16, a9);
  }
}

void sub_100019EE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFDataRef v101 = 0;
  uint64_t v102 = 0;
  CFDataRef v100 = 0;
  unsigned int v99 = 0;
  int v98 = 0;
  unsigned __int8 v97 = 0;
  CFDataRef theData = 0;
  char v95 = -1;
  unsigned __int8 v94 = 0;
  uint64_t v92 = 0;
  uint64_t v93 = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -1;
  if (*(unsigned char *)(a1 + 60))
  {
    uint64_t v9 = (const char *)&unk_10002AE19;
  }
  else if (*(unsigned char *)(a1 + 61))
  {
    uint64_t v9 = "not de-";
  }
  else
  {
    uint64_t v9 = "de-";
  }
  sub_100017164("keybagd_stashcreate_block_invoke_3", @"%sauthorizing SE update", a3, a4, a5, a6, a7, a8, (char)v9);
  uint64_t v102 = sub_10001E97C(65000, &v94, (uint64_t)&v92, v10, v11, v12, v13, v14);
  if (!v102)
  {
    sub_100017164("keybagd_stashcreate_block_invoke_3", @"no SE ctx", v16, v17, v18, v19, v20, v21, v87);
    char v59 = 0;
    LODWORD(v35) = 0;
    uint64_t v58 = 0x200000000000000;
    goto LABEL_20;
  }
  if (!*(unsigned char *)(a1 + 60))
  {
    if (*(unsigned char *)(a1 + 61))
    {
      LODWORD(v35) = 0;
      goto LABEL_18;
    }
    unint64_t v79 = sub_10001F7C8((id *)&v102, 0, 238, 0, (uint64_t)&v99);
    unint64_t v35 = HIDWORD(v79);
    if (v79 != 0x900000000000)
    {
      sub_100017164("keybagd_stashcreate_block_invoke_3", @"resetCounter() -> 0x%x:0x%x", v51, v52, v53, v54, v55, v56, v79);
      uint64_t v58 = 0;
      goto LABEL_19;
    }
    CFStringRef v57 = @"de-authorized SE update";
LABEL_15:
    sub_100017164("keybagd_stashcreate_block_invoke_3", v57, v51, v52, v53, v54, v55, v56, v87);
    LODWORD(v35) = 36864;
LABEL_18:
    uint64_t v58 = 0;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
LABEL_19:
    char v59 = 1;
    goto LABEL_20;
  }
  if (sub_1000065E4(*(unsigned int *)(a1 + 56), &v97, 0, 0))
  {
    sub_100017164("keybagd_stashcreate_block_invoke_3", @"KBGetSEStuff() failed", v22, v23, v24, v25, v26, v27, v87);
    uint64_t v58 = 0;
    LODWORD(v35) = 0;
    goto LABEL_19;
  }
  unint64_t v28 = sub_10001FA8C((id *)&v102, (CFTypeRef *)&theData, (uint64_t)&v95, (uint64_t)&v98, (uint64_t)&v99);
  unint64_t v35 = HIDWORD(v28);
  if (v28 != 0x900000000000)
  {
    sub_100017164("keybagd_stashcreate_block_invoke_3", @"getData() -> 0x%x:0x%x", v29, v30, v31, v32, v33, v34, v28);
    char v59 = 0;
    uint64_t v58 = 0x300000000000000;
    goto LABEL_20;
  }
  sub_100017164("keybagd_stashcreate_block_invoke_3", @"got slot = %d, gwc = %d", v29, v30, v31, v32, v33, v34, v97);
  BytePtr = CFDataGetBytePtr(theData);
  if (BytePtr[v97] != 238)
  {
    unsigned int v43 = CFDataGetBytePtr(theData);
    if ((char)v43[v97] < 0)
    {
      sub_100017164("keybagd_stashcreate_block_invoke_3", @"slot is v2", v37, v38, v39, v40, v41, v42, v88);
      if (!sub_100005F18(*(unsigned int *)(a1 + 56), &v101, &v100)
        && (sub_100020968(3, v99, v100, v81, v82, v83, v84, v85) & 1) != 0)
      {
        goto LABEL_13;
      }
      sub_100017164("keybagd_stashcreate_block_invoke_3", @"no nonce, or is out of date", v80, v81, v82, v83, v84, v85, v87);
      if (v101)
      {
        CFRelease(v101);
        CFDataRef v101 = 0;
      }
      if (v100)
      {
        CFRelease(v100);
        CFDataRef v100 = 0;
      }
      if (sub_100005E98(*(unsigned int *)(a1 + 56), 3, v99))
      {
        uint64_t v58 = 0;
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -1000;
        goto LABEL_50;
      }
      if (aks_verify_password())
      {
        CFStringRef v86 = @"cant verify passcode";
      }
      else
      {
        if (!sub_100005F18(*(unsigned int *)(a1 + 56), &v101, &v100)) {
          goto LABEL_13;
        }
        CFStringRef v86 = @"cant fetch sig";
      }
LABEL_49:
      sub_100017164("keybagd_stashcreate_block_invoke_3", v86, v44, v45, v46, v47, v48, v49, v87);
      uint64_t v58 = 0;
LABEL_50:
      LODWORD(v35) = 36864;
      goto LABEL_19;
    }
  }
  sub_100017164("keybagd_stashcreate_block_invoke_3", @"slot is v1", v37, v38, v39, v40, v41, v42, v88);
  if (sub_1000065E4(*(unsigned int *)(a1 + 56), &v97, (uint64_t)&v101, 0))
  {
    CFStringRef v86 = @"KBGetSEStuff() failed";
    goto LABEL_49;
  }
LABEL_13:
  unint64_t v50 = sub_10001F7C8((id *)&v102, 1, v97, (uint64_t)v101, (uint64_t)&v99);
  unint64_t v35 = HIDWORD(v50);
  if (v50 == 0x900000000000)
  {
    CFStringRef v57 = @"authorized SE update";
    goto LABEL_15;
  }
  sub_100017164("keybagd_stashcreate_block_invoke_3", @"resetCounter() -> 0x%x:0x%x", v51, v52, v53, v54, v55, v56, v50);
  char v59 = 0;
  uint64_t v58 = 0xA00000000000000;
LABEL_20:
  if (v102) {
    sub_10001EDD8((id *)&v102, v15, v16, v17, v18, v19, v20, v21, v87);
  }
  if (v100)
  {
    CFRelease(v100);
    CFDataRef v100 = 0;
  }
  if (v101)
  {
    CFRelease(v101);
    CFDataRef v101 = 0;
  }
  if (theData)
  {
    CFRelease(theData);
    CFDataRef theData = 0;
  }
  if ((v59 & 1) == 0)
  {
    sub_1000208D8(v35, v15, v16, v17, v18, v19, v20, v21);
    unint64_t v91 = ((unint64_t)v94 << 6) | ((unint64_t)v93 << 8) | ((unint64_t)(unsigned __int16)v35 << 40) | v58 | 0x10;
    sub_100013A34(&v91, v60, v61, v62, v63, v64, v65, v66, v87);
    sub_100017164("keybagd_stashcreate_block_invoke_3", @"SE failed, trying soft recovery", v67, v68, v69, v70, v71, v72, v89);
    if (!aks_se_recover())
    {
      sub_100017164("keybagd_stashcreate_block_invoke_3", @"SE soft recovery success", v73, v74, v75, v76, v77, v78, v90);
      sub_1000063DC(0, *(unsigned int *)(a1 + 56));
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    }
  }
}

uint64_t sub_10001A398(int a1, char a2)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000;
  int v10 = -1;
  if ((a2 & 2) != 0) {
    int v2 = -a1;
  }
  else {
    int v2 = sub_100017488();
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000;
  v5[2] = sub_10001A464;
  v5[3] = &unk_100031598;
  v5[4] = &v7;
  int v6 = v2;
  dispatch_sync((dispatch_queue_t)qword_100039870, v5);
  uint64_t v3 = *((unsigned int *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void sub_10001A464(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = aks_stash_commit();
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  int v9 = *(_DWORD *)(v8 + 24);
  if (v9)
  {
    sub_100017164("keybagd_stashcommit_block_invoke", @"aks_stash_commit failed %x (handle:%d)", v2, v3, v4, v5, v6, v7, v9);
  }
  else
  {
    *(_DWORD *)(v8 + 24) = 0;
    sub_100017164("keybagd_stashcommit_block_invoke", @"success (handle:%d)", v2, v3, v4, v5, v6, v7, *(_DWORD *)(a1 + 40));
  }
}

uint64_t sub_10001A4EC()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2000000000;
  int v6 = -1;
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10001A59C;
  block[3] = &unk_1000315C0;
  void block[4] = &v3;
  dispatch_sync((dispatch_queue_t)qword_100039870, block);
  uint64_t v0 = *((unsigned int *)v4 + 6);
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10001A59C(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = aks_stash_destroy();
  sub_100017164("keybagd_stashdestroy_block_invoke", @"aks_stash_destroy %x", v2, v3, v4, v5, v6, v7, *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

void sub_10001A5F8(uint64_t a1)
{
  int v2 = aks_stash_verify();
  if (v2)
  {
    sub_100017164("keybagd_stashverify_block_invoke", @"aks_stash_verify failed %x (handle:%d)", v3, v4, v5, v6, v7, v8, v2);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -1;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32)
                                                                                                 + 8)
                                                                                     + 24);
    sub_100017164("keybagd_stashverify_block_invoke", @"AKS STASH VERIFY success (handle:%d)", v3, v4, v5, v6, v7, v8, *(_DWORD *)(a1 + 56));
  }
}

uint64_t sub_10001A69C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000;
  int v10 = -1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000;
  v5[2] = sub_10001A758;
  v5[3] = &unk_100031610;
  v5[4] = &v7;
  void v5[5] = a1;
  v5[6] = a2;
  int v6 = a3;
  dispatch_sync((dispatch_queue_t)qword_100039870, v5);
  uint64_t v3 = *((unsigned int *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void sub_10001A758(uint64_t a1)
{
  sub_100017488();
  if (!aks_get_system())
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = aks_change_secret();
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      goto LABEL_15;
    }
    if (sub_100017488())
    {
      uint64_t v2 = sub_100017160();
      CFMutableDictionaryRef v3 = sub_1000046AC(v2);
    }
    else
    {
      CFMutableDictionaryRef v3 = sub_100004444();
    }
    CFDictionaryRef v10 = v3;
    sub_100017164("keybagd_changegeneration_block_invoke", @"Starting transition to new system bag at handle %d", v4, v5, v6, v7, v8, v9, 0);
    if (v10)
    {
      CFDataRef Value = CFDictionaryGetValue(v10, @"OpaqueStuff");
      if (Value)
      {
        uint64_t v18 = Value;
        CFRetain(Value);
        CFRelease(v10);
        sub_100017164("keybagd_changegeneration_block_invoke", @"Got opaqueStuff from ondisk keybag", v19, v20, v21, v22, v23, v24, v35);
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sub_10000514C(0, "/private/var/", v18, 1, 0);
        CFRelease(v18);
      }
      else
      {
        CFRelease(v10);
        sub_100017164("keybagd_changegeneration_block_invoke", @"Got opaqueStuff from ondisk keybag", v26, v27, v28, v29, v30, v31, v35);
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sub_10000514C(0, "/private/var/", 0, 1, 0);
      }
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) || !*(_DWORD *)(a1 + 56))
      {
LABEL_15:
        uint64_t v32 = *(void *)(*(void *)(a1 + 32) + 8);
        int v33 = *(_DWORD *)(v32 + 24);
        if (v33 > -536870175)
        {
          if (!v33) {
            return;
          }
          if (v33 != -536870174) {
            goto LABEL_22;
          }
        }
        else if (v33 != -536870194)
        {
          if (v33 == -536870184)
          {
            int v34 = -13;
LABEL_23:
            *(_DWORD *)(v32 + 24) = v34;
            return;
          }
LABEL_22:
          int v34 = -1000;
          goto LABEL_23;
        }
        int v34 = -3;
        goto LABEL_23;
      }
      sub_100017488();
      int v25 = aks_set_system_with_passcode();
    }
    else
    {
      sub_100017164("keybagd_changegeneration_block_invoke", @"Failed to load system keybag", v11, v12, v13, v14, v15, v16, v35);
      int v25 = -1;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v25;
    goto LABEL_15;
  }
}

uint64_t sub_10001A988(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  int v9 = 2;
  v4[0] = 0;
  v4[1] = v4;
  _DWORD v4[2] = 0x2000000000;
  int v5 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10001AA5C;
  block[3] = &unk_100031638;
  void block[4] = v4;
  void block[5] = &v6;
  void block[6] = a1;
  dispatch_sync((dispatch_queue_t)qword_100039870, block);
  uint64_t v1 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(v4, 8);
  _Block_object_dispose(&v6, 8);
  return v1;
}

void sub_10001AA5C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (sub_10000677C("enable-rolld-dev1", (_DWORD *)(*(void *)(a1[4] + 8) + 24), 0))
  {
    sub_100017164("keybagd_iskeyrolling_block_invoke", @"nvram keyroll check failed", v10, v11, v12, v13, v14, v15, a9);
  }
  else
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = 0;
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = *(_DWORD *)(*(void *)(a1[4] + 8) + 24) != 0;
    sub_100017164("keybagd_iskeyrolling_block_invoke", @"nvram keyroll check success", v10, v11, v12, v13, v14, v15, v17);
    uint64_t v16 = (_DWORD *)a1[6];
    if (v16) {
      *uint64_t v16 = *(_DWORD *)(*(void *)(a1[4] + 8) + 24);
    }
  }
}

uint64_t sub_10001AB1C(int a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000;
  uint64_t v8 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000;
  v3[2] = sub_10001ABD0;
  v3[3] = &unk_100031660;
  int v4 = a1;
  v3[4] = &v5;
  dispatch_sync((dispatch_queue_t)qword_100039870, v3);
  uint64_t v1 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v1;
}

uint64_t sub_10001ABD0(uint64_t a1)
{
  uint64_t result = sub_100017488();
  if (result)
  {
    uint64_t v3 = *(unsigned int *)(a1 + 40);
    if (!v3) {
      uint64_t v3 = sub_100017160();
    }
    uint64_t result = (uint64_t)sub_10000F3F8(v3);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_10001AC14()
{
}

void sub_10001AC28(id a1)
{
  if (sub_100012AEC(@"com.apple.mobile.keybagd.forgotten_passcode", v1, v2, v3, v4, v5, v6, v7))
  {
    sub_100017164("keybagd_forgottenPasscodeEvent_block_invoke", @"event already persisted", v8, v9, v10, v11, v12, v13, v23);
  }
  else if (!aks_get_extended_device_state() && !aks_memento_get_state())
  {
    if (aks_get_seconds_since_passcode_change()) {
      uint64_t v14 = 60;
    }
    else {
      uint64_t v14 = 0;
    }
    if (sub_1000121F0(@"com.apple.mobile.keybagd.forgotten_passcode", 0, v14)) {
      sub_100017164("keybagd_forgottenPasscodeEvent_block_invoke", @"analytics_persist_event failed", v15, v16, v17, v18, v19, v20, v21);
    }
  }
}

void sub_10001AD90(uint64_t a1, uint64_t a2, const void *a3, const void *a4)
{
  CFDictionaryRef v31 = 0;
  *(void *)bytes = 0;
  uint64_t v30 = 0;
  long long v29 = 0u;
  memset(v28, 0, sizeof(v28));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  __int16 v38 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v33 = 0;
  CFDataRef v6 = CFDataCreateWithBytesNoCopy(0, bytes, 16, kCFAllocatorNull);
  *(void *)&long long v24 = 1;
  if (!aks_get_configuration())
  {
    uint64_t v7 = (const void *)kAKSConfigGracePeriod;
    *((void *)&v24 + 1) = sub_100010728(v31, kAKSConfigGracePeriod);
    uint64_t v8 = sub_1000106EC(v31, kAKSConfigUserUUID);
    uint64_t v9 = sub_1000106EC(v31, kAKSConfigGroupUUID);
    if (v8)
    {
      if (a3) {
        BYTE10(v28[0]) = CFEqual(v8, a3) != 0;
      }
      BYTE11(v28[0]) = CFEqual(v8, v6) != 0;
    }
    if (v9)
    {
      if (a4) {
        BYTE12(v28[0]) = CFEqual(v9, a4) != 0;
      }
      BYTE13(v28[0]) = CFEqual(v9, v6) != 0;
    }
    *((void *)&v24 + 1) = sub_100010728(v31, v7);
    *((void *)&v25 + 1) = sub_100010728(v31, kAKSConfigMaxUnlockAttempts);
    *(void *)&long long v26 = sub_100010728(v31, kAKSConfigRecoveryIterations);
    *((void *)&v26 + 1) = sub_100010728(v31, kAKSConfigRecoveryTargetIterations);
    char v10 = sub_100010728(v31, kAKSConfigRecoveryFlags);
    LOBYTE(v27) = (v10 & 8) != 0;
    BYTE1(v27) = v10 & 1;
    BYTE2(v27) = (v10 & 4) != 0;
    BYTE3(v27) = (v10 & 2) != 0;
    BYTE4(v27) = (v10 & 0x10) != 0;
    BYTE5(v27) = sub_100010794(v31, kAKSConfigMementoSupported) != 0;
    BYTE6(v27) = sub_100010794(v31, kAKSConfigMementoBlobExists) != 0;
    *((void *)&v27 + 1) = sub_100010728(v31, kAKSConfigMementoPasscodeGeneration);
    *(void *)&v28[0] = sub_100010728(v31, kAKSConfigPasscodeGeneration);
    BYTE8(v28[0]) = sub_100010794(v31, kAKSConfigInactivityRebootEnabled) != 0;
    BYTE9(v28[0]) = sub_100010794(v31, kAKSConfigOnenessAutomaticMode) != 0;
    if (aks_get_extended_device_state())
    {
      LOBYTE(v30) = 1;
    }
    else
    {
      v11.i64[0] = *(void *)&vshl_u16((uint16x4_t)(*(void *)&vdup_n_s16(v34) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFBFFFCFFFDFFFELL) & 0xFF01FF01FF01FF01;
      *(_DWORD *)((char *)v28 + 15) = vmovn_s16(v11).u32[0];
      BYTE3(v28[1]) = (v34 & 0x40) != 0;
      BYTE4(v28[1]) = (v34 & 0x80) != 0;
      uint32x4_t v12 = (uint32x4_t)vdupq_n_s32(v34);
      BYTE9(v28[2]) = (v34 & 0x10000000) != 0;
      BYTE10(v28[2]) = (v34 & 0x20000000) != 0;
      BYTE11(v28[2]) = (v34 & 0x40000000) != 0;
      BYTE12(v28[2]) = BYTE2(v36) & 1;
      v13.i64[0] = 0x101010101010101;
      v13.i64[1] = 0x101010101010101;
      *(int8x16_t *)((char *)&v28[1] + 5) = vandq_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vshlq_u32(v12, (uint32x4_t)xmmword_10002D050), (int16x8_t)vshlq_u32(v12, (uint32x4_t)xmmword_10002D040)), (int8x16_t)vuzp1q_s16((int16x8_t)vshlq_u32(v12, (uint32x4_t)xmmword_10002D070), (int16x8_t)vshlq_u32(v12, (uint32x4_t)xmmword_10002D060))), v13);
      int16x8_t v14 = (int16x8_t)vshlq_u32(v12, (uint32x4_t)xmmword_10002D080);
      v14.i64[0] = *(void *)&vmovn_s32((int32x4_t)v14) & 0xFF01FF01FF01FF01;
      *(_DWORD *)((char *)&v28[2] + 5) = vmovn_s16(v14).u32[0];
      v14.i64[0] = *(void *)&vshl_u16((uint16x4_t)(*(void *)&vdup_n_s16(BYTE2(v36)) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL) & 0xFF01FF01FF01FF01;
      *(_DWORD *)((char *)&v28[2] + 13) = vmovn_s16(v14).u32[0];
      *(void *)&long long v25 = v35;
    }
    if (AKSIdentityGetSessionTimeWindows()) {
      *(void *)((char *)&v28[3] + 4) = 0;
    }
    else {
      BYTE1(v30) = 1;
    }
    if (aks_get_seconds_since_passcode_change()) {
      BYTE2(v30) = 1;
    }
    else {
      HIDWORD(v28[3]) = 0;
    }
    if (aks_memento_get_state())
    {
      BYTE3(v30) = 1;
    }
    else
    {
      v22.i64[0] = *(void *)&vshl_u16((uint16x4_t)(*(void *)&vdup_n_s16(0) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL) & 0xFF01FF01FF01FF01;
      LODWORD(v29) = vmovn_s16(v22).u32[0];
      BYTE4(v29) = 0;
      *((void *)&v29 + 1) = 0;
    }
    sub_100014DA0((uint64_t)&v24, v15, v16, v17, v18, v19, v20, v21, v23);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v31) {
    CFRelease(v31);
  }
}

BOOL sub_10001B2BC(uint64_t a1, int a2, _DWORD *a3)
{
  sub_100017488();
  if (a2) {
    int extended_device_state = aks_get_extended_device_state();
  }
  else {
    int extended_device_state = aks_get_device_state();
  }
  int v12 = extended_device_state;
  if (extended_device_state)
  {
    sub_100017164("keybagd_getDeviceLockState", @"aks_get_device_state/aks_get_extended_device_state failed with %d", v6, v7, v8, v9, v10, v11, extended_device_state);
  }
  else if (a3)
  {
    *a3 = 0;
  }
  return v12 == 0;
}

BOOL sub_10001B388(uint64_t a1, _DWORD *a2)
{
  sub_100017488();
  int extended_device_state = aks_get_extended_device_state();
  int v10 = extended_device_state;
  if (extended_device_state) {
    sub_100017164("keybagd_getDeviceExtendedState", @"aks_get_extended_device_state failed with %d", v4, v5, v6, v7, v8, v9, extended_device_state);
  }
  else {
    *a2 = 0;
  }
  return v10 == 0;
}

uint64_t sub_10001B438(const UInt8 *a1, CFIndex a2)
{
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2000000000;
  char v18 = 0;
  if (sub_100010F50())
  {
    sub_100017164("keybagd_SeshatEnroll", @"not enrolling in multiuser", v4, v5, v6, v7, v8, v9, v16[0]);
  }
  else if (a1)
  {
    CFDataRef v10 = CFDataCreate(kCFAllocatorDefault, a1, a2);
    if (v10)
    {
      CFDataRef v11 = v10;
      if (CFDataGetLength(v10) >= 1)
      {
        CFIndex Length = CFDataGetLength(v11);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 0x40000000;
        v16[2] = sub_10001B588;
        v16[3] = &unk_1000316C8;
        v16[4] = v17;
        v16[5] = CFDataCreateMutableCopy(0, Length, v11);
        dispatch_async((dispatch_queue_t)qword_100039870, v16);
      }
      if (CFDataGetBytePtr(v11))
      {
        BytePtr = (UInt8 *)CFDataGetBytePtr(v11);
        size_t v14 = CFDataGetLength(v11);
        bzero(BytePtr, v14);
        CFRelease(v11);
      }
    }
  }
  _Block_object_dispose(v17, 8);
  return 0;
}

void sub_10001B588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFDataRef v123 = 0;
  CFTypeRef cf = 0;
  CFDataRef theData = 0;
  uint64_t v119 = 0;
  uint64_t v120 = 0;
  v118[0] = 0;
  v118[1] = 0;
  if (!*(void *)(a1 + 40))
  {
    CFStringRef v110 = @"no passcode";
LABEL_66:
    sub_100017164("keybagd_SeshatEnroll_block_invoke", v110, a3, a4, a5, a6, a7, a8, v111);
    goto LABEL_67;
  }
  sub_100006110();
  if ((sub_100020914() & 1) == 0)
  {
    CFStringRef v110 = @"Seshat is disabled";
    goto LABEL_66;
  }
  sleep(5u);
  uint64_t v9 = sub_10001FDE0(1, (uint64_t)&stru_1000318F8, &v119);
  sub_1000061D4(v9, 1);
  sub_100017164("keybagd_SeshatEnroll_block_invoke", @"Seshat preflight = %llx (%llx)", v10, v11, v12, v13, v14, v15, v9);
  uint64_t v117 = v9;
  sub_100013798((unsigned int *)&v117, v16, v17, v18, v19, v20, v21, v22, v112);
  if ((v119 & 1) == 0)
  {
    sub_100017164("keybagd_SeshatEnroll_block_invoke", @"v1 preflight failed %llx", v23, v24, v25, v26, v27, v28, v9);
    goto LABEL_67;
  }
  if (MGGetBoolAnswer()) {
    unint64_t v29 = ((unint64_t)sub_10001FD40() >> 11) & 1;
  }
  else {
    LOBYTE(v29) = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v29;
  int v30 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  unsigned int v31 = sub_100006C74();
  if (v30)
  {
    if (v31 >= 2)
    {
      sub_100017164("keybagd_SeshatEnroll_block_invoke", @"bad user experience = %u", v33, v34, v35, v36, v37, v38, v31);
LABEL_67:
      CFDataRef v56 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    sub_100017164("keybagd_SeshatEnroll_block_invoke", @"ignoring recovery count (%d)", v33, v34, v35, v36, v37, v38, v31);
  }
  uint64_t v120 = sub_10001EDCC(65000, v32, v33, v34, v35, v36, v37, v38);
  if (!v120)
  {
    CFStringRef v110 = @"CreateSession() failed";
    goto LABEL_66;
  }
  unint64_t v46 = sub_10001F1DC((id *)&v120, 0, 238, 0, (CFTypeRef *)&v123, (uint64_t)&v119 + 4);
  if (v46 != 0x900000000000)
  {
    char v111 = v46;
    CFStringRef v110 = @"allocateSlot() -> 0x%x:0x%x";
    goto LABEL_66;
  }
  CFDataRef v47 = *(const __CFData **)(a1 + 40);
  if (v47)
  {
    BytePtr = CFDataGetBytePtr(v47);
    CFDataRef v49 = *(const __CFData **)(a1 + 40);
    if (v49) {
      CFDataGetLength(v49);
    }
  }
  else
  {
    BytePtr = 0;
  }
  CFDataRef v56 = sub_10001FCA4((CFDataRef)BytePtr);
  if (!v56)
  {
    CFStringRef v108 = @"failed to derive SE passcode";
    goto LABEL_46;
  }
  unint64_t v57 = sub_10001F37C((id *)&v120, 0, (uint64_t)v56, (CFTypeRef *)&theData, (uint64_t)&v119 + 4, (uint64_t)v118);
  if (v57 != 0x900000000000)
  {
    sub_100017164("keybagd_SeshatEnroll_block_invoke", @"derive() -> 0x%x:0x%x", v58, v59, v60, v61, v62, v63, v57);
    goto LABEL_47;
  }
  unint64_t v64 = sub_10001F37C((id *)&v120, 0, (uint64_t)v56, &cf, (uint64_t)&v119 + 4, (uint64_t)v118);
  if (v64 != 0x900000000000)
  {
    sub_100017164("keybagd_SeshatEnroll_block_invoke", @"derive2() -> 0x%x:0x%x", v65, v66, v67, v68, v69, v70, v64);
    goto LABEL_47;
  }
  if (!CFEqual(theData, cf))
  {
    CFStringRef v108 = @"se-sec comparisson failed";
    goto LABEL_46;
  }
  unint64_t v71 = sub_10001F678((id *)&v120, 0, (uint64_t)v123, (uint64_t)&v119 + 4, v52, v53, v54, v55);
  if (v71 != 0x900000000000)
  {
    sub_100017164("keybagd_SeshatEnroll_block_invoke", @"resetCounter() -> 0x%x:0x%x", v72, v73, v74, v75, v76, v77, v71);
    goto LABEL_47;
  }
  sub_100017488();
  CFDataRef v78 = *(const __CFData **)(a1 + 40);
  if (v78)
  {
    CFDataGetBytePtr(v78);
    CFDataRef v79 = *(const __CFData **)(a1 + 40);
    if (v79)
    {
      CFDataGetLength(v79);
      CFDataRef v80 = *(const __CFData **)(a1 + 40);
      if (v80)
      {
        CFDataGetBytePtr(v80);
        CFDataRef v81 = *(const __CFData **)(a1 + 40);
        if (v81) {
          CFDataGetLength(v81);
        }
      }
    }
  }
  if (theData)
  {
    CFDataGetBytePtr(theData);
    if (theData) {
      CFDataGetLength(theData);
    }
  }
  char Length = (char)v123;
  if (v123)
  {
    CFDataGetBytePtr(v123);
    char Length = (char)v123;
    if (v123) {
      char Length = CFDataGetLength(v123);
    }
  }
  char v114 = Length;
  int v83 = aks_change_secret_se();
  sub_100017164("keybagd_SeshatEnroll_block_invoke", @"attempting upgrade to v2", v84, v85, v86, v87, v88, v89, v114);
  uint64_t v116 = 0;
  int v91 = sub_100017488();
  CFDataRef v92 = v123;
  CFDataRef v93 = *(const __CFData **)(a1 + 40);
  if (!v93)
  {
    unsigned __int8 v94 = 0;
    goto LABEL_37;
  }
  unsigned __int8 v94 = CFDataGetBytePtr(v93);
  CFDataRef v95 = *(const __CFData **)(a1 + 40);
  if (!v95)
  {
LABEL_37:
    uint64_t v96 = 0;
    goto LABEL_38;
  }
  uint64_t v96 = (int)CFDataGetLength(v95);
LABEL_38:
  if (sub_100005948(v91, 0, v92, (uint64_t)&v120, (uint64_t)v94, v96, &v116, v90))
  {
    uint64_t v97 = v116;
    sub_1000061D4(v116, 1);
    uint64_t v115 = v97;
    sub_100013798((unsigned int *)&v115, v98, v99, v100, v101, v102, v103, v104, v111);
  }
  if (v83)
  {
    CFStringRef v108 = @"aks_change_secret_se() failed";
    goto LABEL_46;
  }
  sub_100017488();
  CFDataRef v105 = *(const __CFData **)(a1 + 40);
  if (v105)
  {
    CFDataGetBytePtr(v105);
    CFDataRef v106 = *(const __CFData **)(a1 + 40);
    if (v106) {
      CFDataGetLength(v106);
    }
  }
  int v107 = aks_change_secret_epilogue();
  if (!v107)
  {
    CFStringRef v108 = @"success enroll";
LABEL_46:
    sub_100017164("keybagd_SeshatEnroll_block_invoke", v108, v50, v51, v52, v53, v54, v55, v111);
    goto LABEL_47;
  }
  sub_100017164("keybagd_SeshatEnroll_block_invoke", @"aks_change_secret_epilogue() failed %x", v50, v51, v52, v53, v54, v55, v107);
LABEL_47:
  if (v123) {
    CFRelease(v123);
  }
  if (theData) {
    CFRelease(theData);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v56) {
    CFRelease(v56);
  }
  uint64_t v109 = *(__CFData **)(a1 + 40);
  if (v109)
  {
    v124.length = CFDataGetLength(*(CFDataRef *)(a1 + 40));
    v124.location = 0;
    CFDataDeleteBytes(v109, v124);
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
  if (v120) {
    sub_10001EDD8((id *)&v120, v39, v40, v41, v42, v43, v44, v45, v113);
  }
}

uint64_t sub_10001BB10(UInt8 *bytes, CFIndex length, int a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v126 = 0;
  uint64_t v127 = &v126;
  uint64_t v128 = 0x2000000000;
  int v129 = -536870194;
  uint64_t v122 = 0;
  CFDataRef v123 = (id *)&v122;
  uint64_t v124 = 0x2000000000;
  uint64_t v125 = 0;
  v121[0] = 0;
  v121[1] = v121;
  v121[2] = 0x2000000000;
  v121[3] = 0;
  v120[0] = 0;
  v120[1] = v120;
  v120[2] = 0x2000000000;
  v120[3] = 0;
  uint64_t v116 = 0;
  uint64_t v117 = &v116;
  uint64_t v118 = 0x2000000000;
  char v119 = 0;
  uint64_t v112 = 0;
  char v113 = &v112;
  uint64_t v114 = 0x2000000000;
  char v115 = 1;
  uint64_t v108 = 0;
  uint64_t v109 = &v108;
  uint64_t v110 = 0x2000000000;
  CFDataRef v111 = 0;
  CFDataRef v111 = CFDataCreate(kCFAllocatorDefault, bytes, length);
  CFDataRef v10 = (const __CFData *)v109[3];
  if (!v10 || CFDataGetLength(v10) <= 0)
  {
    (*(void (**)(uint64_t, uint64_t))(a6 + 16))(a6, 4294967279);
    goto LABEL_33;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10001C290;
  block[3] = &unk_1000316F0;
  char v106 = a3;
  void block[4] = &v112;
  void block[5] = &v126;
  void block[6] = &v108;
  void block[7] = v121;
  void block[8] = &v122;
  void block[9] = v120;
  block[10] = &v116;
  block[11] = a5;
  char v107 = a4;
  dispatch_sync((dispatch_queue_t)qword_100039878, block);
  (*(void (**)(uint64_t, void))(a6 + 16))(a6, *((unsigned int *)v127 + 6));
  if (*((_DWORD *)v127 + 6))
  {
    sub_100017164("keybagd_SeshatUnlock", @"seshat unlock failed %d", v11, v12, v13, v14, v15, v16, *((unsigned char *)v113 + 24));
    goto LABEL_33;
  }
  if (!*((unsigned char *)v113 + 24))
  {
    sub_100017164("keybagd_SeshatUnlock", @"no reset needed", v11, v12, v13, v14, v15, v16, v103);
    goto LABEL_33;
  }
  uint64_t v17 = *((unsigned __int8 *)v117 + 24);
  CFDataRef v18 = (const __CFData *)v109[3];
  CFDataRef v138 = 0;
  CFDataRef v139 = 0;
  uint64_t v137 = 0;
  char v136 = -1;
  uint64_t v134 = 0;
  CFDataRef v135 = 0;
  uint64_t v20 = v123 + 3;
  id v19 = v123[3];
  char v133 = 0;
  if (!v19)
  {
    CFStringRef v39 = @"no session failed";
    goto LABEL_63;
  }
  if (!v18)
  {
    CFStringRef v39 = @"no passcode";
    goto LABEL_63;
  }
  unint64_t v21 = sub_10001FA8C(v20, (CFTypeRef *)&v135, (uint64_t)&v136, (uint64_t)&v137, (uint64_t)&v137 + 4);
  if (v21 != 0x900000000000)
  {
    sub_100017164("seshat_reset", @"getData() -> 0x%x:0x%x", v23, v24, v25, v26, v27, v28, v21);
LABEL_64:
    uint64_t v134 = 0x100000002;
    sub_100014048(&v134, v95, v96, v97, v98, v99, v100, v101, v103);
    goto LABEL_27;
  }
  uint64_t v132 = 1000 * ((HIDWORD(v137) + 999) / 0x3E8u);
  sub_100013ED0(&v132, v22, v23, v24, v25, v26, v27, v28, v103);
  if (CFDataGetBytePtr(v135)[v17] != 238 && (char)CFDataGetBytePtr(v135)[v17] < 0)
  {
    sub_100017164("seshat_reset", @"slot is v%d", v29, v30, v31, v32, v33, v34, 2);
    sleep(1u);
    uint64_t v84 = sub_100017488();
    if (sub_100005F18(v84, &v139, &v138)
      || (sub_100020968(2, HIDWORD(v137), v138, v86, v13, v14, v15, v16) & 1) == 0)
    {
      sub_100017164("seshat_reset", @"cant fetch async sig or is invalid", v85, v86, v13, v14, v15, v16, v103);
      if (v138)
      {
        CFRelease(v138);
        CFDataRef v138 = 0;
      }
      if (v139)
      {
        CFRelease(v139);
        CFDataRef v139 = 0;
      }
      uint64_t v134 = 0x100000001;
      sub_100014048(&v134, v87, v88, v89, v90, v91, v92, v93, v104);
      uint64_t v94 = sub_100017488();
      if (sub_100005E98(v94, 2, HIDWORD(v137))) {
        goto LABEL_64;
      }
      sub_100017488();
      CFDataGetBytePtr(v18);
      CFDataGetLength(v18);
      if (a3)
      {
        if (aks_verify_password_memento())
        {
          CFStringRef v39 = @"cant verify passcode for memento";
          goto LABEL_63;
        }
      }
      else if (aks_verify_password())
      {
        CFStringRef v39 = @"cant verify passcode";
        goto LABEL_63;
      }
      uint64_t v102 = sub_100017488();
      if (sub_100005F18(v102, &v139, 0))
      {
        CFStringRef v39 = @"cant fetch sig";
        goto LABEL_63;
      }
    }
    char v40 = 1;
  }
  else
  {
    sub_100017164("seshat_reset", @"slot is v%d", v29, v30, v31, v32, v33, v34, 1);
    uint64_t v35 = sub_100017488();
    uint64_t v36 = v35;
    if (a3)
    {
      BytePtr = CFDataGetBytePtr(v18);
      int v38 = CFDataGetLength(v18);
      if (sub_100006664(v36, (uint64_t)BytePtr, v38, 0, (uint64_t)&v139, 0))
      {
        CFStringRef v39 = @"KBGetSEStuffForMementoPasscode() -> failed";
LABEL_63:
        sub_100017164("seshat_reset", v39, v11, v12, v13, v14, v15, v16, v103);
        goto LABEL_64;
      }
    }
    else if (sub_1000065E4(v35, &v133, (uint64_t)&v139, 0))
    {
      CFStringRef v39 = @"KBGetSEStuff() failed";
      goto LABEL_63;
    }
    char v40 = 0;
  }
  unint64_t v41 = sub_10001F678(v20, v17, (uint64_t)v139, (uint64_t)&v137 + 4, v13, v14, v15, v16);
  if (v41 != 0x900000000000)
  {
    sub_100017164("seshat_reset", @"resetCounter() -> 0x%x:0x%x", v42, v43, v44, v45, v46, v47, v41);
    goto LABEL_64;
  }
  unint64_t v48 = sub_10001F7C8(v20, 0, 238, 0, (uint64_t)&v137 + 4);
  unint64_t v56 = HIDWORD(v48);
  if (v48 != 0x900000000000) {
    sub_100017164("seshat_reset", @"DeAuthorizeUpdate() -> 0x%x:0x%x", v50, v51, v52, v53, v54, v55, v48);
  }
  if (a3) {
    goto LABEL_27;
  }
  if (((sub_10002091C() & 1) != 0 || v137 >= 0x65 && (v137 - 100) < HIDWORD(v137))
    && (unint64_t v131 = ((unint64_t)(unsigned __int16)v56 << 40) | 0x500000000000018,
        sub_100013A34(&v131, v49, v50, v51, v52, v53, v54, v55, v103),
        sub_100017488(),
        CFDataGetBytePtr(v18),
        CFDataGetLength(v18),
        int v57 = aks_se_recover(),
        sub_100017164("seshat_reset", @"pre-emptive unbind from Seshat (0x%x:0x%x -> 0x%x)", v58, v59, v60, v61, v62, v63, SBYTE4(v137)), !v57))
  {
    uint64_t v77 = sub_100017488();
    sub_1000063DC(0, v77);
    if ((v40 & 1) == 0)
    {
LABEL_24:
      sub_100017164("seshat_reset", @"attempting upgrade to v2", v50, v51, v52, v53, v54, v55, v103);
      unint64_t v131 = 0;
      int v64 = sub_100017488();
      CFDataRef v65 = v139;
      uint64_t v66 = CFDataGetBytePtr(v18);
      int v67 = CFDataGetLength(v18);
      if (sub_100005948(v64, v17, v65, (uint64_t)v20, (uint64_t)v66, v67, (uint64_t *)&v131, v68))
      {
        unint64_t v69 = v131;
        sub_1000061D4(v131, 1);
        unint64_t v130 = v69;
        sub_100013798((unsigned int *)&v130, v70, v71, v72, v73, v74, v75, v76, v103);
      }
    }
  }
  else if ((v40 & 1) == 0)
  {
    goto LABEL_24;
  }
LABEL_27:
  if (v139)
  {
    CFRelease(v139);
    CFDataRef v139 = 0;
  }
  if (v138)
  {
    CFRelease(v138);
    CFDataRef v138 = 0;
  }
  if (v135) {
    CFRelease(v135);
  }
LABEL_33:
  if (v123[3]) {
    sub_10001EDD8(v123 + 3, v49, v50, v51, v52, v53, v54, v55, v103);
  }
  CFDataRef v78 = (const __CFData *)v109[3];
  if (v78)
  {
    if (CFDataGetBytePtr(v78))
    {
      CFDataRef v79 = (UInt8 *)CFDataGetBytePtr((CFDataRef)v109[3]);
      size_t v80 = CFDataGetLength((CFDataRef)v109[3]);
      bzero(v79, v80);
      CFDataRef v81 = (const void *)v109[3];
      if (v81)
      {
        CFRelease(v81);
        v109[3] = 0;
      }
    }
  }
  uint64_t v82 = *((unsigned int *)v127 + 6);
  _Block_object_dispose(&v108, 8);
  _Block_object_dispose(&v112, 8);
  _Block_object_dispose(&v116, 8);
  _Block_object_dispose(v120, 8);
  _Block_object_dispose(v121, 8);
  _Block_object_dispose(&v122, 8);
  _Block_object_dispose(&v126, 8);
  return v82;
}

void sub_10001C290(uint64_t a1)
{
  CFDataRef theData = 0;
  int v133 = 1;
  unsigned int v134 = 0;
  int v132 = 0;
  unsigned __int8 v131 = 0;
  uint64_t v129 = 0;
  uint64_t v130 = 0;
  if (!*(unsigned char *)(a1 + 96))
  {
    sub_100017488();
    aks_get_lock_state();
  }
  sub_100006110();
  sub_10001119C(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = sub_10001E97C(9000, &v131, (uint64_t)&v129, v2, v3, v4, v5, v6);
  sub_1000111CC(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), (void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SeshatCreateSessionWithTimeout() -> %llu us", buf, 0xCu);
    }
    CFDataRef v14 = *(const __CFData **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v14)
    {
      BytePtr = CFDataGetBytePtr(v14);
      CFDataRef v16 = *(const __CFData **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      if (v16) {
        CFDataGetLength(v16);
      }
    }
    else
    {
      BytePtr = 0;
    }
    CFDataRef v17 = sub_10001FCA4((CFDataRef)BytePtr);
    if (v17)
    {
      CFDataRef v24 = v17;
      int v25 = *(unsigned __int8 *)(a1 + 96);
      uint64_t v26 = sub_100017488();
      if (v25)
      {
        if (sub_1000065FC())
        {
          CFStringRef v33 = @"KBGetMementoSESlot() failed";
LABEL_95:
          sub_100017164("keybagd_SeshatUnlock_block_invoke", v33, v27, v28, v29, v30, v31, v32, v124);
          int v39 = 0;
          uint64_t v41 = 0;
          LODWORD(v37) = 0;
          int v36 = 0;
          goto LABEL_72;
        }
      }
      else if (sub_1000065E4(v26, (unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), 0, &v133))
      {
        CFStringRef v33 = @"KBGetSEStuff() failed";
        goto LABEL_95;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = v34;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v133;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got slot = %d, ver = %d", buf, 0xEu);
      }
      unint64_t v35 = sub_10001F37C((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), (uint64_t)v24, (CFTypeRef *)&theData, (uint64_t)&v134, (uint64_t)&v129);
      int v36 = v35;
      unint64_t v37 = HIDWORD(v35);
      if (v35) {
        BOOL v38 = 0;
      }
      else {
        BOOL v38 = HIDWORD(v35) == 36864;
      }
      int v39 = !v38;
      int v40 = *(unsigned __int8 *)(a1 + 96);
      if (!v38)
      {
        if (*(unsigned char *)(a1 + 96) || aks_se_stage_stash())
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10002145C(v36, v37);
          }
          int v39 = 0;
          uint64_t v41 = 7;
          goto LABEL_72;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v49 = "staged SE stash";
          uint32_t v50 = 2;
LABEL_48:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v49, buf, v50);
          goto LABEL_49;
        }
        goto LABEL_49;
      }
      sub_100017488();
      if (v40)
      {
        if (theData)
        {
          CFDataGetBytePtr(theData);
          if (theData) {
            CFDataGetLength(theData);
          }
        }
        int v42 = aks_se_set_secret_memento();
      }
      else
      {
        if (theData)
        {
          CFDataGetBytePtr(theData);
          if (theData) {
            CFDataGetLength(theData);
          }
        }
        int v42 = aks_se_set_secret();
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v42;
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        sub_100017164("keybagd_SeshatUnlock_block_invoke", @"aks_se_set_secret() -> %d", v43, v44, v45, v46, v47, v48, *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
        int v39 = 0;
        uint64_t v41 = 0;
        int v36 = 0;
      }
      else
      {
        int v51 = v133;
        BOOL v52 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
        if (v51 < 2)
        {
          if (v52)
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v51;
            uint64_t v49 = "NOT prearming nonce %d";
            uint32_t v50 = 8;
            goto LABEL_48;
          }
LABEL_49:
          if (*(unsigned char *)(a1 + 96))
          {
            sub_100017488();
            CFDataRef v54 = *(const __CFData **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
            if (v54)
            {
              CFDataGetBytePtr(v54);
              CFDataRef v55 = *(const __CFData **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
              if (v55) {
                CFDataGetLength(v55);
              }
            }
            CFDataRef v59 = *(const __CFData **)(a1 + 88);
            if (v59)
            {
              CFDataGetBytePtr(v59);
              CFDataRef v60 = *(const __CFData **)(a1 + 88);
              if (v60) {
                CFDataGetLength(v60);
              }
            }
            int v61 = aks_verify_password_memento();
          }
          else
          {
            int v56 = *(unsigned __int8 *)(a1 + 97);
            sub_100017488();
            CFDataRef v57 = *(const __CFData **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
            if (v56)
            {
              if (v57)
              {
                CFDataGetBytePtr(v57);
                CFDataRef v58 = *(const __CFData **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
                if (v58) {
                  CFDataGetLength(v58);
                }
              }
              CFDataRef v69 = *(const __CFData **)(a1 + 88);
              if (v69)
              {
                CFDataGetBytePtr(v69);
                CFDataRef v70 = *(const __CFData **)(a1 + 88);
                if (v70) {
                  CFDataGetLength(v70);
                }
              }
              int v61 = aks_verify_password();
            }
            else
            {
              if (v57)
              {
                CFDataGetBytePtr(v57);
                CFDataRef v68 = *(const __CFData **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
                if (v68) {
                  CFDataGetLength(v68);
                }
              }
              int v61 = aks_unlock_device();
            }
          }
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v61;
          if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
            sub_100017164("keybagd_SeshatUnlock_block_invoke", @"unlock(memento:%d, verify_only: %d) -> %d", v62, v63, v64, v65, v66, v67, *(unsigned char *)(a1 + 96));
          }
          uint64_t v41 = 0;
          goto LABEL_72;
        }
        if (v52)
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&uint8_t buf[4] = v51;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = v134;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "prearming nonce %d,%u", buf, 0xEu);
        }
        uint64_t v53 = sub_100017488();
        if (!sub_100005E98(v53, 2, v134)) {
          goto LABEL_49;
        }
        int v39 = 0;
        uint64_t v41 = 0;
        int v36 = 0;
        *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -1000;
      }
      LODWORD(v37) = 36864;
LABEL_72:
      CFRelease(v24);
      goto LABEL_73;
    }
    sub_100017164("keybagd_SeshatUnlock_block_invoke", @"failed to derive SE passcode", v18, v19, v20, v21, v22, v23, v124);
    int v36 = 0;
    LODWORD(v37) = 0;
    uint64_t v41 = 0;
    int v39 = 0;
  }
  else
  {
    sub_100017164("keybagd_SeshatUnlock_block_invoke", @"SeshatCreateSessionWithTimeout() failed", v7, v8, v9, v10, v11, v12, v124);
    int v36 = 0;
    LODWORD(v37) = 0;
    int v39 = 0;
    uint64_t v41 = 2;
  }
LABEL_73:
  if (theData) {
    CFRelease(theData);
  }
  if (v39)
  {
    sub_100017488();
    CFDataRef v78 = *(const __CFData **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v78)
    {
      CFDataGetBytePtr(v78);
      CFDataRef v79 = *(const __CFData **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      if (v79) {
        CFDataGetLength(v79);
      }
    }
    int v116 = aks_se_recover();
    sub_100017164("keybagd_SeshatUnlock_block_invoke", @"stash driven unbind from Seshat (0x%x -> 0x%x)", v117, v118, v119, v120, v121, v122, v134);
    if (!v116)
    {
      uint64_t v123 = sub_100017488();
      sub_1000063DC(0, v123);
    }
  }
  else if (v41)
  {
    int v80 = v36 << 8;
    *(void *)buf = ((unint64_t)(v80 & 0xFF00 | (8 * sub_10001CC08()) | (32 * v41) | (v37 << 16) | 2) << 32) | 3;
    sub_1000121F0(@"com.apple.mobile.keybagd.seshat.report", 0, *(uint64_t *)buf);
    sub_100014048(buf, v81, v82, v83, v84, v85, v86, v87, v124);
    sub_1000208D8(v37, v88, v89, v90, v91, v92, v93, v94);
    unint64_t v128 = ((unint64_t)v130 << 8) | ((unint64_t)v131 << 6) | ((unint64_t)(unsigned __int16)v37 << 40) | (v41 << 56);
    sub_100013A34(&v128, v95, v96, v97, v98, v99, v100, v101, v125);
    uint64_t v127 = v129;
    sub_100013D90(&v127, v102, v103, v104, v105, v106, v107, v108, v126);
    if (!*(unsigned char *)(a1 + 96))
    {
      sub_100017164("keybagd_SeshatUnlock_block_invoke", @"Unable to unlock SE bound keybag -- requesting recovery 0x%x (0x%x)", v109, v110, v111, v112, v113, v114, *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
      sub_100017488();
      aks_se_fail();
      sub_100017488();
      if (!aks_get_lock_state() && (v132 & 0x800) != 0)
      {
        int v115 = sub_10001CC08();
        sub_1000121F0(@"com.apple.mobile.keybagd.seshat.report", 0, ((unint64_t)((32 * v41) | (v37 << 16) | (v80 | (16 * v115)) & 0xFF10 | 2u) << 32) | 5);
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -536362987;
  }
  else if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *(void *)buf = 6;
    sub_100014048(buf, v71, v72, v73, v74, v75, v76, v77, v124);
  }
}

uint64_t sub_10001CC08()
{
  CFDictionaryRef v0 = sub_100011DE8();
  if (v0)
  {
    CFDictionaryRef v7 = v0;
    uint64_t v8 = (uint64_t)sub_1000118B0(v0);
    if (v8)
    {
      CFStringRef v9 = (const __CFString *)MGCopyAnswer();
      if (v9)
      {
        CFStringRef v10 = v9;
        if (CFStringCompare(v9, (CFStringRef)v8, 0)) {
          uint64_t v8 = 2;
        }
        else {
          uint64_t v8 = 1;
        }
        CFRelease(v10);
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
    CFRelease(v7);
  }
  else
  {
    sub_100017164("keybagd_has_current_build_seen_successful_se_unlocks", @"Can't load dict", v1, v2, v3, v4, v5, v6, v12);
    return 0;
  }
  return v8;
}

uint64_t sub_10001CCAC(UInt8 *bytes, CFIndex length)
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2000000000;
  int v28 = -536870194;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2000000000;
  v24[3] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2000000000;
  v23[3] = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2000000000;
  v22[3] = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2000000000;
  char v21 = 0;
  uint64_t v16 = 0;
  CFDataRef v17 = &v16;
  uint64_t v18 = 0x2000000000;
  CFDataRef v19 = 0;
  CFDataRef v19 = CFDataCreate(kCFAllocatorDefault, bytes, length);
  CFDataRef v8 = (const __CFData *)v17[3];
  if (v8 && CFDataGetLength(v8) > 0)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 0x40000000;
    v15[2] = sub_10001CEAC;
    v15[3] = &unk_100031718;
    v15[4] = v23;
    v15[5] = v24;
    v15[6] = v22;
    v15[7] = &v16;
    v15[8] = v20;
    v15[9] = &v25;
    dispatch_sync((dispatch_queue_t)qword_100039878, v15);
  }
  else
  {
    sub_100017164("keybagd_SeshatRecover", @"SE w/ empty", v2, v3, v4, v5, v6, v7, v15[0]);
  }
  CFDataRef v9 = (const __CFData *)v17[3];
  if (v9)
  {
    if (CFDataGetBytePtr(v9))
    {
      BytePtr = (UInt8 *)CFDataGetBytePtr((CFDataRef)v17[3]);
      size_t v11 = CFDataGetLength((CFDataRef)v17[3]);
      bzero(BytePtr, v11);
      char v12 = (const void *)v17[3];
      if (v12)
      {
        CFRelease(v12);
        void v17[3] = 0;
      }
    }
  }
  uint64_t v13 = *((unsigned int *)v26 + 6);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v25, 8);
  return v13;
}

void sub_10001CEAC(void *a1)
{
  CFDataRef theData = 0;
  unsigned int v73 = 0;
  v72[0] = 0;
  v72[1] = 0;
  int v71 = 1;
  sub_10001119C(*(void *)(a1[4] + 8) + 24);
  *(void *)(*(void *)(a1[5] + 8) + 24) = sub_10001EDCC(65000, v2, v3, v4, v5, v6, v7, v8);
  sub_1000111CC(*(void *)(*(void *)(a1[4] + 8) + 24), (void *)(*(void *)(a1[6] + 8) + 24));
  if (*(void *)(*(void *)(a1[5] + 8) + 24))
  {
    sub_100017164("keybagd_SeshatRecover_block_invoke", @"SeshatCreateSessionWithTimeout() -> %llu us", v9, v10, v11, v12, v13, v14, *(void *)(*(void *)(a1[6] + 8) + 24));
    CFDataRef v15 = *(const __CFData **)(*(void *)(a1[7] + 8) + 24);
    if (v15)
    {
      BytePtr = CFDataGetBytePtr(v15);
      CFDataRef v17 = *(const __CFData **)(*(void *)(a1[7] + 8) + 24);
      if (v17) {
        CFDataGetLength(v17);
      }
    }
    else
    {
      BytePtr = 0;
    }
    CFDataRef v24 = sub_10001FCA4((CFDataRef)BytePtr);
    if (v24)
    {
      uint64_t v25 = sub_100017488();
      if (!sub_1000065E4(v25, (unsigned char *)(*(void *)(a1[8] + 8) + 24), 0, &v71))
      {
        sub_100017164("keybagd_SeshatRecover_block_invoke", @"got slot = %d, ver = %d", v18, v19, v20, v21, v22, v23, *(unsigned char *)(*(void *)(a1[8] + 8) + 24));
        unint64_t v26 = sub_10001F37C((id *)(*(void *)(a1[5] + 8) + 24), *(unsigned char *)(*(void *)(a1[8] + 8) + 24), (uint64_t)v24, (CFTypeRef *)&theData, (uint64_t)&v73, (uint64_t)v72);
        unsigned __int8 v33 = v26;
        unint64_t v34 = HIDWORD(v26);
        if (v26 != 0x900000000000)
        {
          sub_100017164("keybagd_SeshatRecover_block_invoke", @"SE slot is not available. fail. derive() -> 0x%x:0x%x", v27, v28, v29, v30, v31, v32, v26);
          sub_100017488();
          aks_se_fail();
          char v42 = 0;
          int v43 = v33 << 8;
          int v44 = (v34 << 16) | 2;
          int v45 = 224;
          goto LABEL_26;
        }
        sub_100017488();
        if (theData)
        {
          CFDataGetBytePtr(theData);
          if (theData) {
            CFDataGetLength(theData);
          }
        }
        int v44 = -1879048190;
        *(_DWORD *)(*(void *)(a1[9] + 8) + 24) = aks_se_set_secret();
        if (*(_DWORD *)(*(void *)(a1[9] + 8) + 24))
        {
          sub_100017164("keybagd_SeshatRecover_block_invoke", @"aks_se_set_secret() -> %d", v46, v47, v48, v49, v50, v51, *(_DWORD *)(*(void *)(a1[9] + 8) + 24));
        }
        else
        {
          if (v71 < 2)
          {
            sub_100017164("keybagd_SeshatRecover_block_invoke", @"NOT prearming nonce %d", v46, v47, v48, v49, v50, v51, v71);
          }
          else
          {
            sub_100017164("keybagd_SeshatRecover_block_invoke", @"prearming nonce %d", v46, v47, v48, v49, v50, v51, v71);
            uint64_t v52 = sub_100017488();
            if (sub_100005E98(v52, 2, v73))
            {
              int v45 = 0;
              int v43 = 0;
              *(_DWORD *)(*(void *)(a1[9] + 8) + 24) = -1000;
LABEL_25:
              char v42 = 1;
              goto LABEL_26;
            }
          }
          sub_100017488();
          CFDataRef v53 = *(const __CFData **)(*(void *)(a1[7] + 8) + 24);
          if (v53)
          {
            CFDataGetBytePtr(v53);
            CFDataRef v54 = *(const __CFData **)(*(void *)(a1[7] + 8) + 24);
            if (v54)
            {
              CFDataGetLength(v54);
              CFDataRef v55 = *(const __CFData **)(*(void *)(a1[7] + 8) + 24);
              if (v55)
              {
                CFDataGetBytePtr(v55);
                CFDataRef v56 = *(const __CFData **)(*(void *)(a1[7] + 8) + 24);
                if (v56) {
                  CFDataGetLength(v56);
                }
              }
            }
          }
          *(_DWORD *)(*(void *)(a1[9] + 8) + 24) = aks_change_secret();
          sub_100017164("keybagd_SeshatRecover_block_invoke", @"recovery start -> 0x%x", v57, v58, v59, v60, v61, v62, *(_DWORD *)(*(void *)(a1[9] + 8) + 24));
        }
        int v45 = 0;
        int v43 = 0;
        goto LABEL_25;
      }
      CFStringRef v67 = @"KBGetSEStuff() failed";
    }
    else
    {
      CFStringRef v67 = @"failed to derive SE passcode";
    }
    sub_100017164("keybagd_SeshatRecover_block_invoke", v67, v18, v19, v20, v21, v22, v23, v69);
    int v45 = 0;
    int v43 = 0;
    char v42 = 1;
  }
  else
  {
    sub_100017164("keybagd_SeshatRecover_block_invoke", @"SeshatCreateSessionWithTimeout() failed", v9, v10, v11, v12, v13, v14, v68);
    char v42 = 0;
    int v43 = 0;
    CFDataRef v24 = 0;
    int v45 = 64;
  }
  int v44 = 2;
LABEL_26:
  uint64_t v63 = *(void *)(a1[5] + 8);
  uint64_t v65 = *(void *)(v63 + 24);
  uint64_t v64 = (id *)(v63 + 24);
  if (v65)
  {
    sub_10001EDD8(v64, v35, v36, v37, v38, v39, v40, v41, v70);
    *(void *)(*(void *)(a1[5] + 8) + 24) = 0;
  }
  if ((v42 & 1) == 0)
  {
    char v66 = sub_10001CC08();
    sub_1000121F0(@"com.apple.mobile.keybagd.seshat.report", 0, ((unint64_t)(v44 | v45 | v43 | (16 * (v66 & 1u))) << 32) | 5);
  }
  if (v24) {
    CFRelease(v24);
  }
  if (theData) {
    CFRelease(theData);
  }
}

uint64_t sub_10001D320(int a1)
{
  uint64_t v1 = a1;
  char v2 = sub_10001FD2C(a1);
  sub_100017164("keybagd_SeshatDebug", @"Posting analyitcs", v3, v4, v5, v6, v7, v8, v23);
  uint64_t v25 = v1;
  sub_100013024(&v25, v9, v10, v11, v12, v13, v14, v15, v24);
  sub_100017164("keybagd_SeshatDebug", @"Seshat Debug changed from 0x%llx to 0x%llx", v16, v17, v18, v19, v20, v21, v2);
  return 0;
}

void sub_10001D398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (sub_100017520())
  {
    time_t v9 = time(0);
    sub_10001E80C(v9);
    return;
  }
  CFDictionaryRef v10 = sub_100011DE8();
  if (v10)
  {
    CFDictionaryRef v17 = v10;
    time_t v18 = time(0);
    if (sub_1000119F4(v17, v18))
    {
      CFStringRef v25 = @"failed to set TTR";
    }
    else
    {
      if (!sub_1000121C8(v17))
      {
LABEL_8:
        CFRelease(v17);
        return;
      }
      CFStringRef v25 = @"failed to serialize plist";
    }
    sub_100017164("KBSeshatRequestTTR", v25, v19, v20, v21, v22, v23, v24, v26);
    goto LABEL_8;
  }

  sub_100017164("KBSeshatRequestTTR", @"failed to get dict", v11, v12, v13, v14, v15, v16, a9);
}

void sub_10001D474(char a1)
{
  if (a1)
  {
    if ((a1 & 2) != 0) {
      dispatch_sync((dispatch_queue_t)qword_100039878, &stru_100031960);
    }
    sub_100012C00();
  }
  if ((a1 & 4) != 0)
  {
    sub_100018644(0, 0);
  }
}

void sub_10001D4DC(id a1)
{
  int v6 = 0;
  __endptr = 0;
  __str = 0;
  if (sub_10000677C("seshat-debug", &v6, &__str)) {
    BOOL v1 = 1;
  }
  else {
    BOOL v1 = __str == 0;
  }
  if (!v1)
  {
    *__error() = 0;
    uint64_t v2 = strtoll(__str, &__endptr, 16);
    if (*__str)
    {
      if (!*__endptr)
      {
        uint64_t v3 = v2;
        if (*__error() != 34)
        {
          fprintf(__stdoutp, "******** setting debug to 0x%llx", v3);
          sub_10001FD2C(v3);
        }
      }
    }
  }
  free(__str);
}

void sub_10001D59C(id a1)
{
  int v7 = 0;
  sub_100017488();
  aks_get_lock_state();
  sub_100017164("seshat_init_block_invoke_2", @"not se entangled or been unlocked or unsupported, not prewarming state: 0x%x", v1, v2, v3, v4, v5, v6, 0);
  sub_10001D670(0);
}

void sub_10001D670(const __CFDictionary *a1)
{
  if (a1)
  {
    CFDictionaryRef v1 = a1;
    CFRetain(a1);
  }
  else
  {
    CFDictionaryRef v1 = sub_100011DE8();
    if (!v1) {
      return;
    }
  }
  CFArrayRef v2 = sub_100011CBC(v1);
  if (v2 && CFArrayGetCount(v2) > 13)
  {
    if (sub_100011904(v1))
    {
      CFStringRef v9 = @"health data contains failures";
    }
    else
    {
      sub_100017488();
      char v10 = aks_se_set_healthy();
      CFStringRef v9 = @"setting healthy indicator 0x%x";
    }
  }
  else
  {
    CFStringRef v9 = @"not enough health data";
  }
  sub_100017164("seshat_evaluate_health_plist", v9, v3, v4, v5, v6, v7, v8, v10);

  CFRelease(v1);
}

void sub_10001D740(id a1, _xpc_activity_s *a2)
{
  xpc_activity_state_t state = xpc_activity_get_state(a2);
  if (state == 2)
  {
    sub_100017164("data_analytics_init_block_invoke", @"data analytics activity", v4, v5, v6, v7, v8, v9, v44);
    int v49 = 0;
    uint64_t v18 = sub_100017488();
    int lock_state = aks_get_lock_state();
    if (lock_state)
    {
      sub_100017164("data_analytics_init_block_invoke", @"get_lock_state() -> 0x%x", v20, v21, v22, v23, v24, v25, lock_state);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_10001DA34;
      block[3] = &unk_1000317F8;
      int v47 = v18;
      int v48 = v49;
      dispatch_sync((dispatch_queue_t)qword_100039878, block);
      if ((v49 & 0x2000) != 0) {
        sub_100017164("data_analytics_init_block_invoke", @"Keybag is bound to SE - not collecting health data", v28, v29, v30, v31, v32, v33, v45);
      }
      else {
        dispatch_sync((dispatch_queue_t)qword_100039878, &stru_100031838);
      }
      long long v53 = xmmword_10002D090;
      CFDataRef v54 = &_mh_execute_header;
      char v52 = 0;
      LOBYTE(v53) = (v49 & 2) == 0;
      if ((v49 & 2) == 0) {
        DWORD1(v53) = sub_10001128C();
      }
      int v34 = sub_100011408(&v52);
      if (v52) {
        int v35 = 1;
      }
      else {
        int v35 = 2;
      }
      if (v34) {
        int v35 = 0;
      }
      DWORD2(v53) = v35;
      int v51 = 0;
      if (!sub_10000677C("aks-inactivity", &v51, 0) && v51 == 1)
      {
        sub_100006A60("aks-inactivity");
        BYTE12(v53) = 1;
      }
      unint64_t v50 = 0;
      if (AKSIdentityGetSessionTimeWindows() && v50 != -1) {
        LODWORD(v54) = v50 / 0xE10;
      }
      sub_100012E70((char *)&v53, v36, v37, v38, v39, v40, v41, v42, v45);
      sub_10001AD90(v18, v43, 0, 0);
    }
  }
  else if (!state)
  {
    sub_100017164("data_analytics_init_block_invoke", @"Checking in for data analytics", v4, v5, v6, v7, v8, v9, v44);
    xpc_object_t v10 = xpc_activity_copy_criteria(a2);
    if (v10)
    {
      xpc_release(v10);
      CFStringRef v17 = @"activity criteria already set";
    }
    else
    {
      xpc_object_t v26 = xpc_dictionary_create(0, 0, 0);
      if ((sub_10001FD40() & 0x80) != 0) {
        int64_t v27 = 30;
      }
      else {
        int64_t v27 = 86400;
      }
      xpc_dictionary_set_int64(v26, XPC_ACTIVITY_INTERVAL, v27);
      xpc_dictionary_set_string(v26, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
      xpc_dictionary_set_BOOL(v26, XPC_ACTIVITY_ALLOW_BATTERY, 1);
      xpc_activity_set_criteria(a2, v26);
      xpc_release(v26);
      CFStringRef v17 = @"set activity criteria";
    }
    sub_100017164("data_analytics_init_block_invoke", v17, v11, v12, v13, v14, v15, v16, v56);
  }
}

void sub_10001DA34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v9 = *(_DWORD *)(a1 + 36);
  *(void *)int v51 = 0;
  if ((v9 & 2) != 0)
  {
    sub_100017164("report_seshat_usage", @"report: cond 1 not satisified", a3, a4, a5, a6, a7, a8, a9);
    return;
  }
  if (sub_100020578()) {
    __int16 v10 = 16387;
  }
  else {
    __int16 v10 = 3;
  }
  CFDictionaryRef v11 = sub_100011DE8();
  CFDictionaryRef v19 = v11;
  if (v11) {
    v10 |= (sub_100011904(v11) != 0) << 15;
  }
  v51[0] = v10;
  if ((v9 & 0x2000) == 0)
  {
    sub_1000133CC(v51, v12, v13, v14, v15, v16, v17, v18, v50);
    if (!v19) {
      return;
    }
    goto LABEL_26;
  }
  uint64_t v20 = sub_100017488();
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  unsigned __int8 v54 = 0;
  CFDataRef theData = 0;
  char v52 = -1;
  if (sub_1000065E4(v20, &v54, 0, 0))
  {
    CFStringRef v49 = @"KBGetSEStuff() failed";
  }
  else
  {
    uint64_t v56 = sub_10001EDCC(65000, v21, v22, v23, v24, v25, v26, v27);
    if (v56)
    {
      unint64_t v28 = sub_10001FA8C((id *)&v56, (CFTypeRef *)&theData, (uint64_t)&v52, (uint64_t)&v55, (uint64_t)&v55 + 4);
      if (v28 == 0x900000000000)
      {
        BytePtr = CFDataGetBytePtr(theData);
        if (BytePtr[v54] == 238)
        {
          LOWORD(v37) = 0;
        }
        else
        {
          uint64_t v38 = CFDataGetBytePtr(theData);
          int v37 = (v38[v54] >> 5) & 4;
        }
        char v39 = 1;
        goto LABEL_17;
      }
      char v50 = v28;
      CFStringRef v49 = @"getData() -> 0x%x:0x%x";
    }
    else
    {
      CFStringRef v49 = @"unable to create a sesssion";
    }
  }
  sub_100017164("is_slot_v2", v49, v22, v23, v24, v25, v26, v27, v50);
  LOWORD(v37) = 0;
  char v39 = 0;
LABEL_17:
  if (v56) {
    sub_10001EDD8((id *)&v56, v30, v31, v32, v33, v34, v35, v36, v50);
  }
  if (theData) {
    CFRelease(theData);
  }
  if ((v39 & 1) == 0)
  {
    sub_100017164("report_seshat_usage", @"unable to determine slot version", v31, v32, v33, v34, v35, v36, v50);
    if (!v19) {
      return;
    }
    goto LABEL_26;
  }
  if (aks_get_configuration())
  {
    LOWORD(v47) = v51[0];
  }
  else
  {
    unsigned int v48 = sub_100010728(0, kAKSConfigRecoveryFlags);
    unsigned int v47 = v51[0] & 0xC3FF | (((v48 >> 3) & 1) << 10) & 0xFFFFC7FF | ((v48 & 1) << 11) & 0xCFFF | (((v48 >> 2) & 1) << 13) | (((v48 >> 1) & 1) << 12);
  }
  v51[0] = v47 & 0xFFC3 | v37;
  sub_100013148(v51, v40, v41, v42, v43, v44, v45, v46, v50);
  if (v19) {
LABEL_26:
  }
    CFRelease(v19);
}

void sub_10001DC94(id a1)
{
  int v63 = 0;
  if (sub_100006014())
  {
    CFDictionaryRef v7 = sub_100011DE8();
    if (!v7) {
      return;
    }
    CFDictionaryRef v8 = v7;
    time_t v62 = (time_t)sub_100011BC0(v7);
    if (v62)
    {
      if ((sub_10001FD40() & 0x80) != 0)
      {
        sub_100017164("collect_seshat_health_data", @"skipping interval check", v9, v10, v11, v12, v13, v14, v58);
      }
      else
      {
        time_t v15 = time(0);
        char v16 = ctime(&v62);
        sub_100017164("collect_seshat_health_data", @"last entry ran = %s", v17, v18, v19, v20, v21, v22, v16);
        if (v15 - 86400 < v62)
        {
          sub_100017164("collect_seshat_health_data", @"not enough time has passed since last check (last:%zd, now:%zd)", v23, v24, v25, v26, v27, v28, v62);
LABEL_19:
          CFRelease(v8);
          return;
        }
      }
    }
    CFRelease(v8);
    uint64_t v29 = sub_10001FDE0(0, (uint64_t)&stru_1000318F8, &v63);
    if (sub_10002092C(v29))
    {
      sub_100017164("collect_seshat_health_data", @"not recording transient errors in health plist", v30, v31, v32, v33, v34, v35, v58);
      return;
    }
    CFDictionaryRef v36 = sub_100011DE8();
    if (v36)
    {
      CFDictionaryRef v8 = v36;
      sub_1000061D4(v29, 0);
      sub_100017164("collect_seshat_health_data", @"preflight -> %llx (%llx)", v37, v38, v39, v40, v41, v42, v29);
      uint64_t v61 = v29;
      sub_100013798((unsigned int *)&v61, v43, v44, v45, v46, v47, v48, v49, v59);
      if (v29 && (v63 & 1) == 0)
      {
        if (sub_100011974(v8, v29))
        {
          CFStringRef v57 = @"failed to set fail indicator";
          goto LABEL_18;
        }
        sub_100017164("collect_seshat_health_data", @"saved failure in plist", v50, v51, v52, v53, v54, v55, v60);
      }
      if (sub_100011CD0(v8, v29))
      {
        CFStringRef v57 = @"cant add to data";
      }
      else
      {
        time_t v56 = time(0);
        if (sub_100011C30(v8, v56))
        {
          CFStringRef v57 = @"cant set time";
        }
        else
        {
          sub_10001D670(v8);
          if (sub_1000121C8(v8)) {
            goto LABEL_19;
          }
          CFStringRef v57 = @"saved data";
        }
      }
LABEL_18:
      sub_100017164("collect_seshat_health_data", v57, v50, v51, v52, v53, v54, v55, v60);
      goto LABEL_19;
    }
  }
  else
  {
    sub_100017164("collect_seshat_health_data", @"unsupported", v1, v2, v3, v4, v5, v6, v65);
  }
}

void sub_10001DED0(id a1)
{
}

void sub_10001DF0C(id a1, _xpc_activity_s *a2)
{
  if (!xpc_activity_get_state(a2))
  {
    sub_100017164("space_repetition_kick_block_invoke", @"space_repetition Check in", v3, v4, v5, v6, v7, v8, v18);
    xpc_object_t v9 = xpc_activity_copy_criteria(a2);
    if (v9)
    {
      xpc_release(v9);
      CFStringRef v16 = @"space_repetition activity criteria already set";
    }
    else
    {
      xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v17, XPC_ACTIVITY_INTERVAL, 3600);
      xpc_dictionary_set_string(v17, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
      xpc_dictionary_set_BOOL(v17, XPC_ACTIVITY_ALLOW_BATTERY, 1);
      xpc_activity_set_criteria(a2, v17);
      xpc_release(v17);
      CFStringRef v16 = @"space_repetition set activity criteria";
    }
    sub_100017164("space_repetition_kick_block_invoke", v16, v10, v11, v12, v13, v14, v15, v20);
  }
}

BOOL sub_10001E004(id a1, void *a2)
{
  sub_100017488();
  if (!aks_get_lock_state()) {
    return 1;
  }
  sub_100017164("seshat_preflight_condition_block_invoke", @"no lock state", v2, v3, v4, v5, v6, v7, v9);
  return 0;
}

void sub_10001E068(uint64_t a1)
{
  CFDataRef v58 = 0;
  CFDataRef v59 = 0;
  *(void *)time_t v56 = 0;
  CFDataRef theData = 0;
  char v55 = -1;
  if (sub_1000065E4(*(unsigned int *)(a1 + 72), (unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), 0, 0))
  {
LABEL_21:
    CFStringRef v49 = @"KBGetSEStuff() failed";
    goto LABEL_25;
  }
  sub_10001119C(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = sub_10001EDCC(65000, v8, v9, v10, v11, v12, v13, v14);
  sub_1000111CC(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v17 = *(void *)(v15 + 24);
  CFStringRef v16 = (id *)(v15 + 24);
  if (!v17)
  {
    CFStringRef v49 = @"SeshatCreateSessionWithTimeout() failed";
    goto LABEL_25;
  }
  unint64_t v18 = sub_10001FA8C(v16, (CFTypeRef *)&theData, (uint64_t)&v55, (uint64_t)v56, (uint64_t)&v56[1]);
  if (v18 != 0x900000000000)
  {
    sub_100017164("seshat_reset_count_after_wc_recovery_block_invoke", @"getData() -> 0x%x:0x%x", v19, v20, v21, v22, v23, v24, v18);
    goto LABEL_9;
  }
  sub_100017164("seshat_reset_count_after_wc_recovery_block_invoke", @"got slot = %d, gwc = %d", v19, v20, v21, v22, v23, v24, *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  uint64_t v54 = 1000 * ((v56[1] + 999) / 0x3E8u);
  sub_100013ED0(&v54, v25, v26, v27, v28, v29, v30, v31, v51);
  if (CFDataGetBytePtr(theData)[*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)] == 238
    || ((char)CFDataGetBytePtr(theData)[*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)] & 0x80000000) == 0)
  {
    sub_100017164("seshat_reset_count_after_wc_recovery_block_invoke", @"slot is v1", v32, v33, v34, v35, v36, v37, v52);
    if (!sub_1000065E4(*(unsigned int *)(a1 + 72), (unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), (uint64_t)&v59, 0))
    {
LABEL_7:
      unint64_t v38 = sub_10001F678((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), (uint64_t)v59, (uint64_t)&v56[1], v4, v5, v6, v7);
      if (v38 == 0x900000000000)
      {
        sub_100017164("seshat_reset_count_after_wc_recovery_block_invoke", @"reset SEshat", v2, v3, v4, v5, v6, v7, v50);
        *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
        goto LABEL_9;
      }
      char v50 = v38;
      CFStringRef v49 = @"resetCounter() -> 0x%x:0x%x";
      goto LABEL_25;
    }
    goto LABEL_21;
  }
  sub_100017164("seshat_reset_count_after_wc_recovery_block_invoke", @"slot is v2", v32, v33, v34, v35, v36, v37, v52);
  if (sub_100005F18(*(unsigned int *)(a1 + 72), &v59, &v58))
  {
    CFStringRef v49 = @"nothing to reset with";
  }
  else
  {
    if (sub_100020968(2, v56[1], v58, v3, v4, v5, v6, v7)) {
      goto LABEL_7;
    }
    CFStringRef v49 = @"armed nonce is out of date";
  }
LABEL_25:
  sub_100017164("seshat_reset_count_after_wc_recovery_block_invoke", v49, v2, v3, v4, v5, v6, v7, v50);
LABEL_9:
  if (v59)
  {
    CFRelease(v59);
    CFDataRef v59 = 0;
  }
  if (v58)
  {
    CFRelease(v58);
    CFDataRef v58 = 0;
  }
  if (theData)
  {
    CFRelease(theData);
    CFDataRef theData = 0;
  }
  uint64_t v46 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v48 = *(void *)(v46 + 24);
  uint64_t v47 = (id *)(v46 + 24);
  if (v48) {
    sub_10001EDD8(v47, v39, v40, v41, v42, v43, v44, v45, v53);
  }
}

void sub_10001E350(id a1)
{
  CFDictionaryRef v1 = sub_100011DE8();
  if (v1)
  {
    CFDictionaryRef v2 = v1;
    uint64_t v3 = (void *)MGCopyAnswer();
    if (v3)
    {
      uint64_t v10 = v3;
      if (sub_1000118C4(v2, v3)) {
        sub_100017164("keybagd_update_last_unlocked_build_block_invoke", @"cant set build", v11, v12, v13, v14, v15, v16, v17);
      }
      else {
        sub_1000121C8(v2);
      }
      CFRelease(v10);
    }
    else
    {
      sub_100017164("keybagd_update_last_unlocked_build_block_invoke", @"cant query MG", v4, v5, v6, v7, v8, v9, v17);
    }
    CFRelease(v2);
  }
}

uint64_t sub_10001E538(uint64_t a1)
{
  unsigned int v32 = 0;
  uint64_t v31 = 0;
  if ((byte_100039959 & 1) == 0)
  {
    unint64_t v29 = 0;
    uint64_t v30 = 0;
    sub_10001119C((uint64_t)&v30);
    CFDictionaryRef v2 = objc_alloc_init(NFHWMonitor);
    [objc_msgSend((id)sub_10001E698(), "sharedHardwareManager") registerEventListener:v2];
    unsigned int v3 = [[objc_msgSend((id)sub_10001E698(), "sharedHardwareManager") getHwSupport];
    if ((v3 & 0xFFFFFFFD) == 1)
    {
      LOBYTE(v31) = [(NFHWMonitor *)v2 waitForNotificationOrTimeout:a1] != 0;
      unsigned int v4 = [[objc_msgSend((id)sub_10001E698(), "sharedHardwareManager") getHwSupport];
    }
    else
    {
      unsigned int v4 = v3;
    }
    [objc_msgSend((id)sub_10001E698(), "sharedHardwareManager") unregisterEventListener:v2];

    if (v4 == 5 || v4 == 2)
    {
      byte_100039958 = 1;
    }
    else
    {
      sub_100017164("SeshatHWAvailable", @"getHwSupport=%d, prev=%d. timedout=%d, intepreting as unsupported.", v5, v6, v7, v8, v9, v10, v4);
      byte_100039958 = 0;
      byte_100039959 = 1;
      sub_10001D398(v11, v12, v13, v14, v15, v16, v17, v18, v28);
    }
    sub_1000111CC(v30, &v29);
    HIDWORD(v31) = v29 / 0xF4240;
    unsigned int v32 = v4;
    sub_100012D54((uint64_t)&v31, v19, v20, v21, v22, v23, v24, v25, v27);
  }
  return byte_100039958;
}

uint64_t sub_10001E698()
{
  uint64_t v3 = 0;
  unsigned int v4 = &v3;
  uint64_t v5 = 0x3052000000;
  uint64_t v6 = sub_10001F340;
  uint64_t v7 = sub_10001F350;
  uint64_t v0 = qword_100039968;
  uint64_t v8 = qword_100039968;
  if (!qword_100039968)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_100020A40;
    v2[3] = &unk_100030C78;
    v2[4] = &v3;
    sub_100020A40((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10001E770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001E788()
{
  uint64_t result = sub_10001E7C0();
  if (result)
  {
    return sub_10001E538(20);
  }
  return result;
}

uint64_t sub_10001E7C0()
{
  if (byte_100039978) {
    return 1;
  }
  uint64_t result = sub_100020ADC();
  if (result) {
    uint64_t result = sub_10001E698() != 0;
  }
  byte_100039978 = result;
  return result;
}

void sub_10001E80C(time_t a1)
{
  time_t v17 = a1;
  if (sub_10001E7C0())
  {
    sub_100017164("SeshatTTR", @"requesting NF TTR", v2, v3, v4, v5, v6, v7, v15);
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3052000000;
    uint64_t v22 = sub_10001F340;
    uint64_t v23 = sub_10001F350;
    uint64_t v8 = (void *)qword_100039980;
    uint64_t v24 = qword_100039980;
    if (!qword_100039980)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100020C20;
      v18[3] = &unk_100030C78;
      v18[4] = &v19;
      sub_100020C20((uint64_t)v18);
      uint64_t v8 = (void *)v20[5];
    }
    _Block_object_dispose(&v19, 8);
    char v16 = ctime(&v17);
    [v8 requestTapToRadar:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SesHat session failure on %s", @"com.apple.keybagd.ttr" preferences];
    sub_100017164("SeshatTTR", @"requested NF TTR", v9, v10, v11, v12, v13, v14, v16);
  }
}

void sub_10001E964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001E97C(int a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001ECF0(1, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v35);
  unsigned int v17 = 0;
  uint64_t v18 = 1000000 * a1;
  do
  {
    if (v17)
    {
      timespec __rqtp = (timespec)xmmword_10002D0B0;
      nanosleep(&__rqtp, 0);
    }
    sub_100017164("SeshatCreateSessionWithTimeoutVerbose", @"asking for session with timeout of %lld nsec (attempt: %d)", v11, v12, v13, v14, v15, v16, v18);
    if (a3)
    {
      *(void *)a3 = 0;
      *(_DWORD *)(a3 + 8) = 0;
    }
    if (a2) {
      *a2 = 0;
    }
    uint64_t v54 = 0;
    char v55 = &v54;
    uint64_t v56 = 0x3052000000;
    CFStringRef v57 = sub_10001F340;
    CFDataRef v58 = sub_10001F350;
    uint64_t v59 = 0;
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x2020000000;
    char v53 = 0;
    uint64_t v46 = 0;
    uint64_t v47 = &v46;
    uint64_t v48 = 0x3052000000;
    CFStringRef v49 = sub_10001F340;
    char v50 = sub_10001F350;
    uint64_t v51 = 0;
    if (sub_10001E7C0() && (sub_10001E538(20) & 1) != 0 && (qword_100039960 & 0x100) == 0)
    {
      if (a2) {
        *a2 = 0;
      }
      if (qword_100039998 != -1) {
        dispatch_once(&qword_100039998, &stru_100031A70);
      }
      uint64_t v19 = dispatch_semaphore_create(0);
      dispatch_retain(v19);
      id v20 = [(id)sub_10001E698() sharedHardwareManager];
      __rqtp.tv_sec = (__darwin_time_t)_NSConcreteStackBlock;
      __rqtp.tv_nsec = 3221225472;
      uint64_t v40 = sub_100020CA4;
      uint64_t v41 = &unk_100031AC0;
      uint64_t v42 = v19;
      uint64_t v43 = v52;
      uint64_t v44 = &v46;
      uint64_t v45 = &v54;
      id v21 = [v20 startSesHatSession:&__rqtp];
      dispatch_time_t v22 = dispatch_time(0, v18);
      dispatch_semaphore_wait(v19, v22);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100020E08;
      block[3] = &unk_100031AE8;
      void block[4] = v21;
      void block[5] = v52;
      void block[6] = a2;
      dispatch_sync((dispatch_queue_t)qword_100039990, block);
      dispatch_release(v19);
    }
    uint64_t v23 = (void *)v47[5];
    if (a3 && v23)
    {
      *(_DWORD *)(a3 + 8) = [(id)sub_10001F588() smallCrumbsFromError:v47[5]];
      *(void *)a3 = [(id)sub_10001F588() largeCrumbsFromError:v47[5]];
      uint64_t v23 = (void *)v47[5];
    }
    if (v23) {

    }
    uint64_t v24 = v55[5];
    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(v52, 8);
    _Block_object_dispose(&v54, 8);
    if (v17 > 3) {
      break;
    }
    ++v17;
  }
  while (!v24);
  if (!v24)
  {
    sub_10001ECF0(0, v25, v11, v12, v13, v14, v15, v16, v36);
    sub_10001D398(v26, v27, v28, v29, v30, v31, v32, v33, v37);
  }
  return v24;
}

void sub_10001ECC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 200), 8);
  _Block_object_dispose((const void *)(v32 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_10001ECF0(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (byte_10003998C == a1)
  {
    sub_100017164("SeshatPowerAssertion", @"not doing anything %d:%d", a3, a4, a5, a6, a7, a8, a1);
  }
  else if (a1)
  {
    if (IOPMAssertionDeclareSystemActivity()) {
      sub_100017164("SeshatPowerAssertion", @"Unable to take power assertion.", v9, v10, v11, v12, v13, v14, v21);
    }
    else {
      byte_10003998C = 1;
    }
  }
  else if (IOPMAssertionRelease(dword_100039988))
  {
    sub_100017164("SeshatPowerAssertion", @"Unable to remove power assertion.", v15, v16, v17, v18, v19, v20, a9);
  }
  else
  {
    byte_10003998C = 0;
  }
}

uint64_t sub_10001EDCC(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_10001E97C(a1, 0, 0, a4, a5, a6, a7, a8);
}

void sub_10001EDD8(id *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (sub_10001E7C0())
  {
    int v10 = sub_10001E538(20);
    if (a1)
    {
      if (v10)
      {
        id v11 = *a1;
        if (*a1)
        {
          [*a1 endSession];

          *a1 = 0;
          sub_10001ECF0(0, v12, v13, v14, v15, v16, v17, v18, a9);
        }
      }
    }
  }
}

uint64_t sub_10001EE48(unint64_t *a1)
{
  unint64_t v2 = *a1;
  uint64_t result = sub_10001E7C0();
  if (result)
  {
    uint64_t result = sub_10001E538(20);
    if (result)
    {
      uint64_t result = (uint64_t)[(id)sub_10001EF3C() embeddedSecureElement];
      if (result)
      {
        uint64_t v4 = (void *)result;
        unint64_t v5 = v2 & 0xFF00000000000000;
        unsigned int v6 = [(id)result hwType];
        if (v6 == 3)
        {
          unint64_t v7 = v2 & 0xE7FFFFFFFFFFFFLL | ((unint64_t)((unint64_t)[[[v4 sequenceCounter] unsignedLongValue] > 0x1E9]) << 51);
          BOOL v8 = [(unint64_t)[v4 sequenceCounter] unsignedLongValue] > 0x22F;
        }
        else
        {
          if (v6 != 1)
          {
            uint64_t v10 = v2 & 0xF7FFFFFFFFFFFFLL;
LABEL_13:
            *a1 = v10 | v5;
            return 1;
          }
          unint64_t v7 = v2 & 0xE7FFFFFFFFFFFFLL | ((unint64_t)((unint64_t)[[objc_msgSend(objc_msgSend(v4, "sequenceCounter"), "unsignedLongValue") >> 4 > 0x102) << 51);
          BOOL v8 = (unint64_t)[v4 sequenceCounter] >> 2 > 0x48E;
        }
        uint64_t v9 = v8;
        uint64_t v10 = v7 | (v9 << 52);
        goto LABEL_13;
      }
    }
  }
  return result;
}

uint64_t sub_10001EF3C()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3052000000;
  unsigned int v6 = sub_10001F340;
  unint64_t v7 = sub_10001F350;
  uint64_t v0 = qword_1000399A0;
  uint64_t v8 = qword_1000399A0;
  if (!qword_1000399A0)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_100020E6C;
    v2[3] = &unk_100030C78;
    v2[4] = &v3;
    sub_100020E6C((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10001F014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001F02C()
{
  if (!sub_10001E7C0() || !sub_10001E538(20)) {
    return 0;
  }
  id v0 = [(id)sub_10001E698() sharedHardwareManager];

  return [v0 preWarm];
}

unint64_t sub_10001F078(id *a1, uint64_t a2)
{
  if (sub_10001E7C0() && sub_10001E538(20))
  {
    unsigned int v10 = 0;
    unsigned int v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = (uint64_t)*a1;
    while (1)
    {
      if (v10)
      {
        long long v36 = xmmword_10002D0B0;
        nanosleep((const timespec *)&v36, 0);
      }
      if (v10 > 2 || v11 == 7)
      {
        sub_100017164("SeshatRetry", @"transient error, re-creating session", v4, v5, v6, v7, v8, v9, v36);
        sub_10001EDD8(a1, v14, v15, v16, v17, v18, v19, v20, v36);
        uint64_t v13 = sub_10001E97C(65000, 0, 0, v21, v22, v23, v24, v25);
        *a1 = (id)v13;
        if (!v13) {
          break;
        }
      }
      if ((qword_100039960 & 0x400) != 0 && (arc4random() & 0xF) == 0)
      {
        uint64_t v12 = 0xFFFFLL;
        unsigned int v11 = 7;
      }
      else
      {
        unint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v13);
        unsigned int v11 = v32;
        uint64_t v12 = HIDWORD(v32);
      }
      if (v11) {
        BOOL v33 = 0;
      }
      else {
        BOOL v33 = v12 == 36864;
      }
      char v34 = !v33;
      if (v10 <= 3)
      {
        ++v10;
        if (v34) {
          continue;
        }
      }
      return v11 | (unint64_t)(v12 << 32);
    }
    sub_100017164("SeshatRetry", @"failed to re-create session", v26, v27, v28, v29, v30, v31, v36);
  }
  else
  {
    uint64_t v12 = 0xFFFFLL;
    unsigned int v11 = 6;
  }
  return v11 | (unint64_t)(v12 << 32);
}

unint64_t sub_10001F1DC(id *a1, char a2, char a3, uint64_t a4, CFTypeRef *a5, uint64_t a6)
{
  unint64_t v6 = 0xFFFF0000000ALL;
  if (a1 && *a1 && (qword_100039960 & 1) == 0)
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3052000000;
    uint64_t v22 = sub_10001F340;
    uint64_t v23 = sub_10001F350;
    uint64_t v24 = 0;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001F35C;
    v16[3] = &unk_100031988;
    char v17 = a2;
    char v18 = a3;
    v16[4] = &v19;
    v16[5] = a4;
    void v16[6] = a6;
    unint64_t v6 = sub_10001F078(a1, (uint64_t)v16);
    uint64_t v14 = (const void *)v20[5];
    if (v14) {
      *a5 = CFRetain(v14);
    }
    _Block_object_dispose(&v19, 8);
  }
  return v6;
}

void sub_10001F324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001F340(uint64_t a1, uint64_t a2)
{
}

void sub_10001F350(uint64_t a1)
{
}

id sub_10001F35C(uint64_t a1, void *a2)
{
  return [a2 allocateSlot:*(unsigned __int8 *)(a1 + 56) authorizingUser:*(unsigned __int8 *)(a1 + 57) authorizingUserToken:*(void *)(a1 + 40) outToken:*(void *)(*(void *)(a1 + 32) + 8) + 40 outWriteCount:*(void *)(a1 + 48)];
}

unint64_t sub_10001F37C(id *a1, char a2, uint64_t a3, CFTypeRef *a4, uint64_t a5, uint64_t a6)
{
  unint64_t v6 = 0xFFFF0000000ALL;
  if (a1 && *a1 && (qword_100039960 & 2) == 0)
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3052000000;
    uint64_t v27 = sub_10001F340;
    uint64_t v28 = sub_10001F350;
    uint64_t v29 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3052000000;
    uint64_t v21 = sub_10001F340;
    uint64_t v22 = sub_10001F350;
    uint64_t v23 = 0;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001F564;
    v16[3] = &unk_1000319B0;
    char v17 = a2;
    void v16[6] = a3;
    void v16[7] = a5;
    v16[4] = &v24;
    v16[5] = &v18;
    unint64_t v6 = sub_10001F078(a1, (uint64_t)v16);
    uint64_t v14 = (const void *)v25[5];
    if (v14) {
      *a4 = CFRetain(v14);
    }
    if (v19[5])
    {
      *(_DWORD *)(a6 + 8) = [(id)sub_10001F588() smallCrumbsFromError:v19[5]];
      *(void *)a6 = [(id)sub_10001F588() largeCrumbsFromError:v19[5]];
    }
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
  return v6;
}

void sub_10001F53C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_10001F564(uint64_t a1, void *a2)
{
  return [a2 derive:*(unsigned __int8 *)(a1 + 64) userHash:*(void *)(a1 + 48) outData:*(void *)(*(void *)(a1 + 32) + 8) + 40 outWriteCount:*(void *)(a1 + 56) trackingError:*(void *)(*(void *)(a1 + 40) + 8) + 40];
}

uint64_t sub_10001F588()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3052000000;
  unint64_t v6 = sub_10001F340;
  uint64_t v7 = sub_10001F350;
  uint64_t v0 = qword_1000399A8;
  uint64_t v8 = qword_1000399A8;
  if (!qword_1000399A8)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_100020EC4;
    v2[3] = &unk_100030C78;
    v2[4] = &v3;
    sub_100020EC4((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10001F660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t sub_10001F678(id *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = 0xFFFF0000000ALL;
  if (a1 && *a1 && (qword_100039960 & 4) == 0)
  {
    CFDataRef v11 = (const __CFData *)a3;
    if ((qword_100039960 & 0x2000) != 0)
    {
      sub_100017164("SeshatResetCounter", @"corrupting reset token", a3, a4, a5, a6, a7, a8, v17);
      CFIndex Length = CFDataGetLength(v11);
      CFMutableArrayRef MutableCopy = CFDataCreateMutableCopy(0, Length, v11);
      v20.location = 0;
      v20.length = 4;
      CFDataReplaceBytes(MutableCopy, v20, (const UInt8 *)"0000", 4);
      CFDataRef v11 = MutableCopy;
    }
    else
    {
      CFMutableArrayRef MutableCopy = 0;
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001F7B8;
    v18[3] = &unk_1000319D0;
    char v19 = a2;
    v18[4] = v11;
    void v18[5] = a4;
    unint64_t v8 = sub_10001F078(a1, (uint64_t)v18);
    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
  }
  return v8;
}

id sub_10001F7B8(uint64_t a1, void *a2)
{
  return [a2 resetCounter:*(unsigned __int8 *)(a1 + 48) userToken:*(void *)(a1 + 32) outWriteCount:*(void *)(a1 + 40)];
}

unint64_t sub_10001F7C8(id *a1, int a2, char a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5 = 0xFFFF0000000ALL;
  if (a1 && (qword_100039960 & 8) == 0 && *a1)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001F8AC;
    v13[3] = &unk_1000319F0;
    int v14 = a2;
    char v15 = a3;
    v13[4] = a4;
    v13[5] = a5;
    unint64_t v5 = sub_10001F078(a1, (uint64_t)v13);
  }
  return v5;
}

id sub_10001F8AC(uint64_t a1, void *a2)
{
  return [a2 authorizeUpdate:*(_DWORD *)(a1 + 48) != 0 slotIndex:*(unsigned __int8 *)(a1 + 52) userToken:*(void *)(a1 + 32) outWriteCount:*(void *)(a1 + 40)];
}

unint64_t sub_10001F8C8(id *a1, char a2, uint64_t a3)
{
  unint64_t v3 = 0xFFFF0000000ALL;
  if (a1 && *a1 && (qword_100039960 & 0x10) == 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001F998;
    v9[3] = &unk_100031A10;
    char v10 = a2;
    void v9[4] = a3;
    unint64_t v3 = sub_10001F078(a1, (uint64_t)v9);
  }
  return v3;
}

id sub_10001F998(uint64_t a1, void *a2)
{
  return [a2 deleteSlot:*(unsigned __int8 *)(a1 + 40) outWriteCount:*(void *)(a1 + 32)];
}

unint64_t sub_10001F9A8(id *a1, char a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = 0xFFFF0000000ALL;
  if (a1 && (qword_100039960 & 0x1000) == 0 && *a1)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001FA7C;
    v11[3] = &unk_1000319D0;
    char v12 = a2;
    void v11[4] = a3;
    v11[5] = a4;
    unint64_t v4 = sub_10001F078(a1, (uint64_t)v11);
  }
  return v4;
}

id sub_10001FA7C(uint64_t a1, void *a2)
{
  return [a2 upgradeKey:*(unsigned __int8 *)(a1 + 48) inputData:*(void *)(a1 + 32) outWriteCount:*(void *)(a1 + 40)];
}

unint64_t sub_10001FA8C(id *a1, CFTypeRef *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5 = 0xFFFF0000000ALL;
  if (a1 && *a1 && (qword_100039960 & 0x20) == 0)
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3052000000;
    uint64_t v18 = sub_10001F340;
    char v19 = sub_10001F350;
    uint64_t v20 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    void v14[2] = sub_10001FBE4;
    void v14[3] = &unk_100031A38;
    v14[4] = &v15;
    v14[5] = a3;
    v14[6] = a4;
    v14[7] = a5;
    unint64_t v5 = sub_10001F078(a1, (uint64_t)v14);
    char v12 = (const void *)v16[5];
    if (v12) {
      *a2 = CFRetain(v12);
    }
    _Block_object_dispose(&v15, 8);
  }
  return v5;
}

void sub_10001FBC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001FBE4(void *a1, void *a2)
{
  return [a2 getData:*(void *)(a1[4] + 8) + 40 updateKUD:a1[5] outWriteLimit:a1[6] outWriteCount:a1[7]];
}

uint64_t sub_10001FBFC()
{
  id v4 = 0;
  uint64_t v1 = 0xFFFFFFFFLL;
  if (objc_msgSend(objc_msgSend((id)sub_10001E698(), "sharedHardwareManager"), "secureElementBootHistory:", &v4)&& v4)
  {
    if ((int)[v4 count] < 1)
    {
      uint64_t v1 = 0;
    }
    else
    {
      uint64_t v2 = 0;
      LODWORD(v1) = 0;
      do
        uint64_t v1 = [[v4 objectAtIndex:v2++] intValue] + v1;
      while (v2 < (int)[v4 count]);
    }
  }
  return v1;
}

CFDataRef sub_10001FCA4(CFDataRef result)
{
  memset(v1, 0, sizeof(v1));
  if (result)
  {
    ccsha256_di();
    ccdigest();
    return CFDataCreate(0, (const UInt8 *)v1, 32);
  }
  return result;
}

uint64_t sub_10001FD2C(uint64_t a1)
{
  uint64_t v1 = qword_100039960;
  qword_100039960 = a1;
  return v1;
}

uint64_t sub_10001FD40()
{
  return qword_100039960;
}

BOOL sub_10001FD4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = qword_100039960;
  if (qword_100039960) {
    sub_100017164("SeshatIsReportingEnabled", @"not reporting aggd data, since debugging mode is enabled", a3, a4, a5, a6, a7, a8, v10);
  }
  return v8 == 0;
}

uint64_t sub_10001FD90(CFDataRef theData)
{
  if (theData)
  {
    uint64_t v2 = 0;
    while (CFDataGetBytePtr(theData)[v2] != 238)
    {
      if (++v2 == 10) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    LOBYTE(v2) = -1;
  }
  return v2;
}

uint64_t sub_10001FDE0(int a1, uint64_t a2, unsigned char *a3)
{
  CFTypeRef v71 = 0;
  CFDataRef v72 = 0;
  CFDataRef v69 = 0;
  CFTypeRef v70 = 0;
  CFTypeRef v67 = 0;
  CFTypeRef cf = 0;
  char v66 = -1;
  unsigned int v64 = 0;
  unsigned int v65 = 0;
  id v63 = 0;
  unsigned __int8 v62 = 0;
  uint64_t v60 = 0;
  uint64_t v61 = 0;
  CFDataRef v11 = CFDataCreate(0, byte_100039830, 32);
  if (a1)
  {
    int v12 = sub_10001FBFC();
    if ((sub_100020578() & 1) == 0)
    {
      if (v12)
      {
        int v15 = 0;
        LOBYTE(v16) = -1;
        uint64_t v17 = 1;
        goto LABEL_64;
      }
    }
  }
  uint64_t v18 = (void *)sub_10001E97C(65000, &v62, (uint64_t)&v60, v6, v7, v8, v9, v10);
  id v63 = v18;
  if (!v18)
  {
    LOWORD(v34) = 0;
    int v15 = 0;
    LOBYTE(v16) = -1;
    uint64_t v36 = 0x200000000000000;
    uint64_t v17 = 2;
    goto LABEL_63;
  }
  if (a2 && ((*(uint64_t (**)(uint64_t, void *))(a2 + 16))(a2, v18) & 1) == 0)
  {
    sub_100017164("SeshatPreflightCheck", @"unsatisfactory condition for preflight", v19, v20, v21, v22, v23, v24, v57);
    int v15 = 0;
    LOBYTE(v16) = -1;
    uint64_t v17 = 14;
    goto LABEL_64;
  }
  unint64_t v25 = sub_10001FA8C(&v63, (CFTypeRef *)&v69, (uint64_t)&v66, (uint64_t)&v65, (uint64_t)&v64);
  unsigned __int8 v33 = v25;
  unint64_t v34 = HIDWORD(v25);
  if (v25 != 0x900000000000)
  {
    if (HIDWORD(v25) == 27266)
    {
      sub_100017164("SeshatPreflightCheck", @"no seshat applet", v27, v28, v29, v30, v31, v32, v57);
      uint64_t v37 = 13;
    }
    else if (HIDWORD(v25) == 26277)
    {
      sub_100017164("SeshatPreflightCheck", @"restricted mode", v27, v28, v29, v30, v31, v32, v57);
      uint64_t v37 = 12;
    }
    else
    {
      sub_100017164("SeshatPreflightCheck", @"unknown getData() -> 0x%x:0x%x", v27, v28, v29, v30, v31, v32, v25);
      uint64_t v37 = 3;
    }
    int v15 = 0;
    uint64_t v17 = (v34 << 16) | ((unint64_t)v33 << 8) | v37;
    LOBYTE(v16) = -1;
    goto LABEL_62;
  }
  uint64_t v59 = 1000 * ((v64 + 999) / 0x3E8);
  sub_100013ED0(&v59, v26, v27, v28, v29, v30, v31, v32, v57);
  CFDataRef v35 = v69;
  if (!v69)
  {
    int v15 = 0;
    LOBYTE(v16) = -1;
LABEL_89:
    uint64_t v36 = 0x400000000000000;
    uint64_t v17 = 4;
    goto LABEL_103;
  }
  uint64_t v16 = 0;
  uint64_t v17 = 4;
  LOWORD(v34) = -28672;
  while (CFDataGetBytePtr(v35)[v16] != 238)
  {
    if (++v16 == 10)
    {
      int v15 = 0;
      LOBYTE(v16) = -1;
      uint64_t v36 = 0x400000000000000;
      goto LABEL_63;
    }
  }
  if (v16 > 9u)
  {
    int v15 = 0;
    goto LABEL_89;
  }
  uint64_t v17 = 2415919109;
  sub_100017164("SeshatPreflightCheck", @"globalWriteCounter = %d, globalWriteCounterLimit = %d, slot = %d\n", v14, v6, v7, v8, v9, v10, v64);
  int v15 = 0;
  uint64_t v36 = 0x500000000000000;
  LOWORD(v34) = -28672;
  if (v65 < 0x2711 || v64 >= v65 - 10000) {
    goto LABEL_63;
  }
  unint64_t v38 = sub_10001F1DC(&v63, v16, 238, 0, (CFTypeRef *)&v72, (uint64_t)&v64);
  unint64_t v34 = HIDWORD(v38);
  if (v38 || v34 != 36864)
  {
    int v15 = 0;
    uint64_t v17 = (HIDWORD(v38) << 16) | ((unint64_t)v38 << 8) | 6;
    uint64_t v36 = 0x600000000000000;
    goto LABEL_63;
  }
  CFDataRef v39 = v72;
  if (!v72)
  {
    sub_100017164("SeshatPreflightCheck", @"no reset token returned", v14, v6, v7, v8, v9, v10, v57);
    int v15 = 1;
    uint64_t v36 = 0x600000000000000;
    uint64_t v17 = 6;
    goto LABEL_103;
  }
  CFRelease(v35);
  CFDataRef v69 = 0;
  unint64_t v40 = sub_10001FA8C(&v63, (CFTypeRef *)&v69, (uint64_t)&v66, (uint64_t)&v65, (uint64_t)&v64);
  unsigned __int8 v41 = v40;
  unint64_t v34 = HIDWORD(v40);
  if (v40 || v34 != 36864)
  {
    unint64_t v55 = (HIDWORD(v40) << 16) | ((unint64_t)v40 << 8);
LABEL_101:
    uint64_t v17 = v55 | 3;
    int v15 = 1;
LABEL_62:
    uint64_t v36 = 0x300000000000000;
LABEL_63:
    unint64_t v58 = (((unint64_t)v62 << 6) | ((unint64_t)v61 << 8)) & 0xFF0000FFFFFFFFFFLL | ((unint64_t)(unsigned __int16)v34 << 40) | v36 | 0x28;
    sub_100013A34(&v58, v13, v14, v6, v7, v8, v9, v10, v57);
    goto LABEL_64;
  }
  CFDataRef v42 = v69;
  if (CFDataGetBytePtr(v69)[v16] != 238 && (char)CFDataGetBytePtr(v42)[v16] < 0)
  {
    uint64_t v17 = ((unint64_t)v41 << 8) | 0x90000006;
    int v15 = 1;
  }
  else
  {
    unint64_t v43 = sub_10001F37C(&v63, v16, (uint64_t)v11, &v71, (uint64_t)&v64, (uint64_t)&v60);
    unint64_t v34 = HIDWORD(v43);
    if (v43 || v34 != 36864) {
      goto LABEL_85;
    }
    unint64_t v44 = sub_10001F678(&v63, v16, (uint64_t)v39, (uint64_t)&v64, v7, v8, v9, v10);
    unint64_t v34 = HIDWORD(v44);
    if (v44 || v34 != 36864) {
      goto LABEL_86;
    }
    unint64_t v43 = sub_10001F37C(&v63, v16, (uint64_t)v11, &v70, (uint64_t)&v64, (uint64_t)&v60);
    unint64_t v34 = HIDWORD(v43);
    if (v43 || v34 != 36864)
    {
LABEL_85:
      uint64_t v17 = (v34 << 16) | ((unint64_t)v43 << 8) | 7;
      int v15 = 1;
      uint64_t v36 = 0x700000000000000;
      goto LABEL_63;
    }
    if (CFEqual(v70, v71))
    {
      unint64_t v44 = sub_10001F678(&v63, v16, (uint64_t)v39, (uint64_t)&v64, v7, v8, v9, v10);
      unint64_t v34 = HIDWORD(v44);
      if (!v44 && v34 == 36864)
      {
        unint64_t v45 = sub_10001F7C8(&v63, 1, v16, (uint64_t)v39, (uint64_t)&v64);
        unint64_t v34 = HIDWORD(v45);
        if (v45 || v34 != 36864)
        {
          unint64_t v56 = (HIDWORD(v45) << 16) | ((unint64_t)v45 << 8);
        }
        else
        {
          unint64_t v46 = sub_10001F7C8(&v63, 0, v16, (uint64_t)v39, (uint64_t)&v64);
          unsigned __int8 v47 = v46;
          unint64_t v34 = HIDWORD(v46);
          if (!v46 && v34 == 36864)
          {
            if (a3) {
              *a3 |= 1u;
            }
            if (!sub_1000205C0(v64, v39, (CFDataRef *)&cf, (CFDataRef *)&v67))
            {
              unint64_t v48 = sub_10001F9A8(&v63, v16, (uint64_t)cf, (uint64_t)&v64);
              unint64_t v34 = HIDWORD(v48);
              if (v48 || v34 != 36864)
              {
                uint64_t v17 = (HIDWORD(v48) << 16) | ((unint64_t)v48 << 8) | 0xF;
                int v15 = 1;
                uint64_t v36 = 0xF00000000000000;
                goto LABEL_63;
              }
              unint64_t v49 = sub_10001F678(&v63, v16, (uint64_t)v67, (uint64_t)&v64, v7, v8, v9, v10);
              unint64_t v34 = HIDWORD(v49);
              if (v49 || v34 != 36864)
              {
                uint64_t v17 = (HIDWORD(v49) << 16) | ((unint64_t)v49 << 8) | 0x12;
                int v15 = 1;
                uint64_t v36 = 0x1200000000000000;
                goto LABEL_63;
              }
              if (v42)
              {
                CFRelease(v42);
                CFDataRef v69 = 0;
              }
              unint64_t v50 = sub_10001FA8C(&v63, (CFTypeRef *)&v69, (uint64_t)&v66, (uint64_t)&v65, (uint64_t)&v64);
              unsigned __int8 v51 = v50;
              unint64_t v34 = HIDWORD(v50);
              if (!v50 && v34 == 36864)
              {
                CFDataRef v52 = v69;
                if (CFDataGetBytePtr(v69)[v16] == 238 || ((char)CFDataGetBytePtr(v52)[v16] & 0x80000000) == 0)
                {
                  uint64_t v17 = ((unint64_t)v51 << 8) | 0x90000013;
                  int v15 = 1;
                  uint64_t v36 = 0x1300000000000000;
                }
                else
                {
                  if ((CFDataGetBytePtr(v52)[v16] & 0x7F) == 0)
                  {
                    if (a3) {
                      *a3 |= 2u;
                    }
                    unint64_t v53 = sub_10001F8C8(&v63, v16, (uint64_t)&v64);
                    unint64_t v34 = HIDWORD(v53);
                    if (!v53 && v34 == 36864)
                    {
                      uint64_t v17 = 0;
                      int v15 = 0;
                      goto LABEL_64;
                    }
                    uint64_t v17 = (HIDWORD(v53) << 16) | ((unint64_t)v53 << 8) | 0xB;
                    int v15 = 1;
                    uint64_t v36 = 0xB00000000000000;
                    goto LABEL_63;
                  }
                  uint64_t v17 = ((unint64_t)v51 << 8) | 0x90000014;
                  int v15 = 1;
                  uint64_t v36 = 0x1400000000000000;
                }
                goto LABEL_103;
              }
              unint64_t v55 = (HIDWORD(v50) << 16) | ((unint64_t)v50 << 8);
              goto LABEL_101;
            }
            uint64_t v17 = ((unint64_t)v47 << 8) | 0x90000010;
            int v15 = 1;
            uint64_t v36 = 0x1000000000000000;
LABEL_103:
            LOWORD(v34) = -28672;
            goto LABEL_63;
          }
          unint64_t v56 = (HIDWORD(v46) << 16) | ((unint64_t)v46 << 8);
        }
        uint64_t v17 = v56 | 0xA;
        int v15 = 1;
        uint64_t v36 = 0xA00000000000000;
        goto LABEL_63;
      }
LABEL_86:
      uint64_t v17 = (v34 << 16) | ((unint64_t)v44 << 8) | 8;
      int v15 = 1;
      uint64_t v36 = 0x800000000000000;
      goto LABEL_63;
    }
    int v15 = 1;
    uint64_t v17 = 9;
  }
LABEL_64:
  if (v63)
  {
    if (v15) {
      sub_10001F8C8(&v63, v16, (uint64_t)&v64);
    }
    sub_10001EDD8(&v63, v13, v14, v6, v7, v8, v9, v10, v57);
  }
  if (v72) {
    CFRelease(v72);
  }
  if (v71) {
    CFRelease(v71);
  }
  if (v70) {
    CFRelease(v70);
  }
  if (v69) {
    CFRelease(v69);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v67) {
    CFRelease(v67);
  }
  return v17;
}

uint64_t sub_100020578()
{
  uint64_t result = sub_10001E7C0();
  if (result)
  {
    uint64_t result = sub_10001E538(20);
    if (result)
    {
      id v1 = [(id)sub_10001EF3C() embeddedSecureElement];
      if (v1) {
        LODWORD(v1) = [v1 isSeshatAvailabledInRestrictedMode];
      }
      return v1 | ((BYTE1(qword_100039960) & 0x40) >> 6);
    }
  }
  return result;
}

uint64_t sub_1000205C0(unsigned int a1, const __CFData *a2, CFDataRef *a3, CFDataRef *a4)
{
  int v20 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  ccec_cp_256();
  __chkstk_darwin();
  LOBYTE(v19[1]) = 0;
  v19[0] = 2;
  long long v23 = xmmword_10002D0E0;
  long long v24 = unk_10002D0F0;
  long long v25 = xmmword_10002D100;
  long long v26 = unk_10002D110;
  long long v21 = xmmword_10002D0C0;
  long long v22 = unk_10002D0D0;
  char v27 = -121;
  cczp_bitlen();
  __chkstk_darwin();
  uint64_t v9 = (const UInt8 *)&v17 - ((v8 + 24) & 0x7FFFFFFFFFFFFFF0);
  CFIndex v18 = v10;
  uint64_t v11 = 0xFFFFFFFFLL;
  if (a2)
  {
    if (a3)
    {
      if (a4)
      {
        ccrng();
        if (!v20)
        {
          if (ccec_x963_import_priv()) {
            return 0xFFFFFFFFLL;
          }
          *(_DWORD *)((char *)v19 + 1) = bswap32(a1);
          ccsha256_di();
          ccdigest();
          if (ccec_sign())
          {
            return 0xFFFFFFFFLL;
          }
          else
          {
            unint64_t v12 = (((unint64_t)(cczp_bitlen() + 7) >> 2) | 1) + 16;
            uint64_t v13 = (UInt8 *)malloc_type_malloc(v12, 0xE0546DF0uLL);
            ccec_x963_export();
            *(_OWORD *)uint64_t v13 = *(_OWORD *)CFDataGetBytePtr(a2);
            __chkstk_darwin();
            ccec_x963_import_pub();
            HIBYTE(v17) = 0;
            if (ccec_verify() || !HIBYTE(v17))
            {
              puts("validation failed");
              uint64_t v11 = 0xFFFFFFFFLL;
            }
            else
            {
              CFDataRef v14 = CFDataCreate(0, v13, v12);
              *a3 = v14;
              if (v14)
              {
                CFDataRef v15 = CFDataCreate(0, v9, v18);
                *a4 = v15;
                if (v15) {
                  uint64_t v11 = 0;
                }
                else {
                  uint64_t v11 = 0xFFFFFFFFLL;
                }
              }
              else
              {
                uint64_t v11 = 0xFFFFFFFFLL;
              }
            }
            if (v13) {
              free(v13);
            }
          }
        }
      }
    }
  }
  return v11;
}

void sub_1000208D8(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 == 27268)
  {
    v11[1] = v8;
    v11[2] = v9;
    v11[0] = 1;
    sub_100013650(v11, a2, a3, a4, a5, a6, a7, a8, v10);
  }
}

uint64_t sub_100020914()
{
  return 1;
}

uint64_t sub_10002091C()
{
  return BYTE1(qword_100039960) >> 7;
}

BOOL sub_10002092C(__int16 a1)
{
  return (a1 & 0x1F) == 2 || (a1 & 0x1F) == 14 || (a1 & 0xFF00) == 1792;
}

uint64_t sub_100020950(uint64_t result, unsigned int a2, uint64_t a3)
{
  *(_DWORD *)a3 = 0;
  *(unsigned char *)(a3 + 4) = 0;
  *(unsigned char *)a3 = result;
  *(_DWORD *)(a3 + 1) = bswap32(a2);
  return result;
}

CFDataRef sub_100020968(char a1, unsigned int a2, CFDataRef theData, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((qword_100039960 & 0x10000) != 0)
  {
    sub_100017164("SeshatIsNonceEquivalent", @"not eq", (uint64_t)theData, a4, a5, a6, a7, a8, v13);
    return 0;
  }
  else
  {
    CFDataRef v8 = theData;
    v14[0] = a1;
    *(_DWORD *)&v14[1] = bswap32(a2);
    if (theData)
    {
      if (CFDataGetLength(theData) == 5)
      {
        BytePtr = CFDataGetBytePtr(v8);
        CFDataRef v8 = (const __CFData *)(*(_DWORD *)v14 == *(_DWORD *)BytePtr && v14[4] == BytePtr[4]);
      }
      else
      {
        CFDataRef v8 = 0;
      }
    }
    sub_100017164("SeshatIsNonceEquivalent", @"nonce eq: %d,%u -> %d", (uint64_t)theData, a4, a5, a6, a7, a8, a1);
  }
  return v8;
}

Class sub_100020A40(uint64_t a1)
{
  sub_100020A98();
  Class result = objc_getClass("NFHardwareManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    sub_1000214E8();
  }
  qword_100039968 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

void sub_100020A98()
{
  uint64_t v0 = 0;
  if (!sub_100020ADC()) {
    sub_100021550(&v0);
  }
}

uint64_t sub_100020ADC()
{
  if (!qword_100039970) {
    qword_100039970 = _sl_dlopen();
  }
  return qword_100039970;
}

uint64_t sub_100020BAC()
{
  uint64_t result = _sl_dlopen();
  qword_100039970 = result;
  return result;
}

Class sub_100020C20(uint64_t a1)
{
  sub_100020A98();
  Class result = objc_getClass("NFTapToRadar");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    sub_1000215B8();
  }
  qword_100039980 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

void sub_100020C78(id a1)
{
  qword_100039990 = (uint64_t)dispatch_queue_create("com.apple.mobile.keybagd.seshat.sesion-timeout", 0);
}

void sub_100020CA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  _DWORD v4[2] = sub_100020D34;
  void v4[3] = &unk_100031A98;
  long long v5 = *(_OWORD *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  v4[4] = a3;
  v4[5] = v3;
  uint64_t v6 = *(void *)(a1 + 56);
  void v4[6] = a2;
  dispatch_sync((dispatch_queue_t)qword_100039990, v4);
}

void sub_100020D34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v9 + 24))
  {
    sub_100017164("_SeshatCreateSessionWithTimeout_block_invoke_3", @"doing nothing due to poison", a3, a4, a5, a6, a7, a8, v21);
  }
  else
  {
    char v10 = *(void **)(a1 + 32);
    if (v10)
    {
      char v11 = [objc_msgSend(v10, "description") cStringUsingEncoding:1];
      sub_100017164("_SeshatCreateSessionWithTimeout_block_invoke_3", @"ERROR: %s", v12, v13, v14, v15, v16, v17, v11);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      id v18 = *(id *)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 64);
    }
    else
    {
      *(unsigned char *)(v9 + 24) = 1;
      id v18 = *(id *)(a1 + 48);
      uint64_t v19 = *(void *)(a1 + 72);
    }
    *(void *)(*(void *)(v19 + 8) + 40) = v18;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  int v20 = *(NSObject **)(a1 + 40);

  dispatch_release(v20);
}

void *sub_100020E08(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(unsigned char *)(*(void *)(result[5] + 8) + 24))
  {
    CFDataRef v8 = result;
    sub_100017164("_SeshatCreateSessionWithTimeout_block_invoke_4", @"signaling end of session due to failure to start", a3, a4, a5, a6, a7, a8, v10);
    Class result = [(id)v8[4] endSession];
    uint64_t v9 = (unsigned char *)v8[6];
    *(unsigned char *)(*(void *)(v8[5] + 8) + 24) = 1;
    if (v9) {
      *uint64_t v9 = 1;
    }
  }
  return result;
}

Class sub_100020E6C(uint64_t a1)
{
  sub_100020A98();
  Class result = objc_getClass("NFSecureElement");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    sub_100021620();
  }
  qword_1000399A0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

Class sub_100020EC4(uint64_t a1)
{
  sub_100020A98();
  Class result = objc_getClass("NFSeshatSession");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    sub_100021688();
  }
  qword_1000399A8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

void sub_100020F1C(id a1)
{
  if (bootstrap_check_in(bootstrap_port, "com.apple.mobile.keybagd.mach", (mach_port_t *)&dword_1000399B8))
  {
    sub_100017164("serverPort_block_invoke", @"failed to create notification port", v1, v2, v3, v4, v5, v6, v11);
  }
  else
  {
    uintptr_t v7 = dword_1000399B8;
    global_queue = dispatch_get_global_queue(0, 0);
    qword_1000399C0 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, v7, 0, global_queue);
    dispatch_source_set_event_handler((dispatch_source_t)qword_1000399C0, &stru_100031B68);
    uint64_t v9 = qword_1000399C0;
    dispatch_resume(v9);
  }
}

void sub_100020FDC(id a1)
{
  mach_msg_return_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned char msg[32];
  long long v9;
  long long v10;
  long long v11;
  long long v12;
  int v13;

  uint64_t v13 = 0;
  char v11 = 0u;
  uint64_t v12 = 0u;
  uint64_t v9 = 0u;
  char v10 = 0u;
  memset(msg, 0, sizeof(msg));
  uint64_t v1 = mach_msg((mach_msg_header_t *)msg, 2, 0, 0x64u, dword_1000399B8, 0, 0);
  if (v1)
  {
LABEL_2:
    sub_100017164("serverPort_block_invoke_2", @"mach_msg error: %x", v2, v3, v4, v5, v6, v7, v1);
    return;
  }
  if (*(_DWORD *)&msg[20] == 44)
  {
    sub_100017164("serverPort_block_invoke_2", @"aks notification for recovery completion %d", v2, v3, v4, v5, v6, v7, msg[28]);
    sub_1000182C8(*(int *)&msg[28]);
    return;
  }
  if (*(_DWORD *)&msg[20] != 43)
  {
    if (*(_DWORD *)&msg[20] == 42)
    {
      sub_100018730();
      return;
    }
    goto LABEL_2;
  }
  if (!*(_DWORD *)&msg[24]) {
    sub_1000181C0(0, *(_DWORD *)&msg[28] == 0);
  }
}

uint64_t sub_1000210E4()
{
  if (qword_1000399B0 != -1) {
    dispatch_once(&qword_1000399B0, &stru_100031B28);
  }
  uint64_t result = aks_register_for_notifications();
  if (!result)
  {
    if (qword_1000399B0 != -1) {
      dispatch_once(&qword_1000399B0, &stru_100031B28);
    }
    return aks_register_for_notifications();
  }
  return result;
}

void sub_100021184()
{
}

void sub_1000211EC(void *a1)
{
}

void sub_100021254()
{
}

void sub_1000212BC()
{
}

void sub_100021324(void *a1)
{
}

void sub_10002138C()
{
}

void sub_1000213F4(void *a1)
{
}

void sub_10002145C(int a1, int a2)
{
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Can't stage SE stash; fail. derive() -> 0x%x:0x%x",
    (uint8_t *)v2,
    0xEu);
}

void sub_1000214E8()
{
}

void sub_100021550(void *a1)
{
}

void sub_1000215B8()
{
}

void sub_100021620()
{
}

void sub_100021688()
{
}

uint64_t ADClientAddValueForScalarKey()
{
  return _ADClientAddValueForScalarKey();
}

uint64_t ADClientSetValueForScalarKey()
{
  return _ADClientSetValueForScalarKey();
}

uint64_t AKSIdentityGetPrimary()
{
  return _AKSIdentityGetPrimary();
}

uint64_t AKSIdentityGetSessionTimeWindows()
{
  return _AKSIdentityGetSessionTimeWindows();
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return _CCCryptorCreate(op, alg, options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorFinal(CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return _CCCryptorFinal(cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

size_t CCCryptorGetOutputLength(CCCryptorRef cryptorRef, size_t inputLength, BOOL final)
{
  return _CCCryptorGetOutputLength(cryptorRef, inputLength, final);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return _CCCryptorRelease(cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return _CCCryptorUpdate(cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return _CFArrayCreateMutableCopy(allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return _CFDataCreateMutableCopy(allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range)
{
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return _CFDataGetMutableBytePtr(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return _CFDateCompare(theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return _CFDateCreate(allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  return _CFDateGetAbsoluteTime(theDate);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
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
  return _CFEqual(cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return _CFErrorCreate(allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithStream(allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListWrite(propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFReadStreamCreateWithBytesNoCopy(alloc, bytes, length, bytesDeallocator);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return _CFReadStreamOpen(stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopRun(void)
{
}

void CFShow(CFTypeRef obj)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return _CFStringCreateWithFormatAndArguments(alloc, formatOptions, format, arguments);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return _CFUUIDCreateFromUUIDBytes(alloc, bytes);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return _CFWriteStreamCopyProperty(stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return _CFWriteStreamCreateWithAllocatedBuffers(alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return _CFWriteStreamOpen(stream);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

uint64_t IOPMAssertionDeclareSystemActivity()
{
  return _IOPMAssertionDeclareSystemActivity();
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MOLogEnableDiskLogging()
{
  return _MOLogEnableDiskLogging();
}

uint64_t MOLogOpen()
{
  return _MOLogOpen();
}

uint64_t MOLogWriteV()
{
  return _MOLogWriteV();
}

void NSLog(NSString *format, ...)
{
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return _SecRandomCopyBytes(rnd, count, bytes);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _sqlite3_maintain_load_factor()
{
  return __sqlite3_maintain_load_factor();
}

uint64_t aks_backup_disable_volume()
{
  return _aks_backup_disable_volume();
}

uint64_t aks_backup_enable_volume()
{
  return _aks_backup_enable_volume();
}

uint64_t aks_bag_in_xart()
{
  return _aks_bag_in_xart();
}

uint64_t aks_change_secret()
{
  return _aks_change_secret();
}

uint64_t aks_change_secret_epilogue()
{
  return _aks_change_secret_epilogue();
}

uint64_t aks_change_secret_opts()
{
  return _aks_change_secret_opts();
}

uint64_t aks_change_secret_se()
{
  return _aks_change_secret_se();
}

uint64_t aks_clear_backup_bag()
{
  return _aks_clear_backup_bag();
}

uint64_t aks_copy_volume_cookie()
{
  return _aks_copy_volume_cookie();
}

uint64_t aks_copy_volume_cookie_persona()
{
  return _aks_copy_volume_cookie_persona();
}

uint64_t aks_create_bag()
{
  return _aks_create_bag();
}

uint64_t aks_create_sync_bag()
{
  return _aks_create_sync_bag();
}

uint64_t aks_drain_backup_keys_info()
{
  return _aks_drain_backup_keys_info();
}

uint64_t aks_get_configuration()
{
  return _aks_get_configuration();
}

uint64_t aks_get_device_state()
{
  return _aks_get_device_state();
}

uint64_t aks_get_extended_device_state()
{
  return _aks_get_extended_device_state();
}

uint64_t aks_get_lock_state()
{
  return _aks_get_lock_state();
}

uint64_t aks_get_seconds_since_passcode_change()
{
  return _aks_get_seconds_since_passcode_change();
}

uint64_t aks_get_system()
{
  return _aks_get_system();
}

uint64_t aks_invalidate_sync_bags()
{
  return _aks_invalidate_sync_bags();
}

uint64_t aks_keybag_persona_create()
{
  return _aks_keybag_persona_create();
}

uint64_t aks_keybag_persona_delete()
{
  return _aks_keybag_persona_delete();
}

uint64_t aks_load_bag()
{
  return _aks_load_bag();
}

uint64_t aks_memento_get_state()
{
  return _aks_memento_get_state();
}

uint64_t aks_migrate_fs()
{
  return _aks_migrate_fs();
}

uint64_t aks_recover_with_escrow_bag()
{
  return _aks_recover_with_escrow_bag();
}

uint64_t aks_register_for_notifications()
{
  return _aks_register_for_notifications();
}

uint64_t aks_save_bag()
{
  return _aks_save_bag();
}

uint64_t aks_se_delete_reset_token()
{
  return _aks_se_delete_reset_token();
}

uint64_t aks_se_fail()
{
  return _aks_se_fail();
}

uint64_t aks_se_get_reset_pubkey()
{
  return _aks_se_get_reset_pubkey();
}

uint64_t aks_se_get_reset_sig()
{
  return _aks_se_get_reset_sig();
}

uint64_t aks_se_get_reset_token()
{
  return _aks_se_get_reset_token();
}

uint64_t aks_se_get_reset_token_for_memento_secret()
{
  return _aks_se_get_reset_token_for_memento_secret();
}

uint64_t aks_se_recover()
{
  return _aks_se_recover();
}

uint64_t aks_se_set_healthy()
{
  return _aks_se_set_healthy();
}

uint64_t aks_se_set_nonce()
{
  return _aks_se_set_nonce();
}

uint64_t aks_se_set_secret()
{
  return _aks_se_set_secret();
}

uint64_t aks_se_set_secret_memento()
{
  return _aks_se_set_secret_memento();
}

uint64_t aks_se_stage_stash()
{
  return _aks_se_stage_stash();
}

uint64_t aks_se_support_in_rm()
{
  return _aks_se_support_in_rm();
}

uint64_t aks_se_support_in_rm_is_set()
{
  return _aks_se_support_in_rm_is_set();
}

uint64_t aks_set_backup_bag()
{
  return _aks_set_backup_bag();
}

uint64_t aks_set_configuration()
{
  return _aks_set_configuration();
}

uint64_t aks_set_jcop_supports_updated_kud_policy()
{
  return _aks_set_jcop_supports_updated_kud_policy();
}

uint64_t aks_set_keybag_for_volume()
{
  return _aks_set_keybag_for_volume();
}

uint64_t aks_set_keybag_for_volume_with_cookie()
{
  return _aks_set_keybag_for_volume_with_cookie();
}

uint64_t aks_set_keybag_for_volume_with_cookie_persona()
{
  return _aks_set_keybag_for_volume_with_cookie_persona();
}

uint64_t aks_set_system()
{
  return _aks_set_system();
}

uint64_t aks_set_system_with_passcode()
{
  return _aks_set_system_with_passcode();
}

uint64_t aks_setupallowlist_fs()
{
  return _aks_setupallowlist_fs();
}

uint64_t aks_stash_commit()
{
  return _aks_stash_commit();
}

uint64_t aks_stash_create_for_bag_and_kek()
{
  return _aks_stash_create_for_bag_and_kek();
}

uint64_t aks_stash_destroy()
{
  return _aks_stash_destroy();
}

uint64_t aks_stash_verify()
{
  return _aks_stash_verify();
}

uint64_t aks_unload_bag()
{
  return _aks_unload_bag();
}

uint64_t aks_unlock_device()
{
  return _aks_unlock_device();
}

uint64_t aks_unlock_with_sync_bag()
{
  return _aks_unlock_with_sync_bag();
}

uint64_t aks_verify_password()
{
  return _aks_verify_password();
}

uint64_t aks_verify_password_memento()
{
  return _aks_verify_password_memento();
}

uint64_t analytics_send_event_lazy()
{
  return _analytics_send_event_lazy();
}

uint32_t arc4random(void)
{
  return _arc4random();
}

char *__cdecl asctime(const tm *a1)
{
  return _asctime(a1);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_check_in(bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccdigest()
{
  return _ccdigest();
}

uint64_t ccec_cp_256()
{
  return _ccec_cp_256();
}

uint64_t ccec_sign()
{
  return _ccec_sign();
}

uint64_t ccec_verify()
{
  return _ccec_verify();
}

uint64_t ccec_x963_export()
{
  return _ccec_x963_export();
}

uint64_t ccec_x963_import_priv()
{
  return _ccec_x963_import_priv();
}

uint64_t ccec_x963_import_pub()
{
  return _ccec_x963_import_pub();
}

uint64_t ccrng()
{
  return _ccrng();
}

uint64_t ccsha256_di()
{
  return _ccsha256_di();
}

uint64_t cczp_bitlen()
{
  return _cczp_bitlen();
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

char *__cdecl ctime(const time_t *a1)
{
  return _ctime(a1);
}

int dirfd(DIR *dirp)
{
  return _dirfd(dirp);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

kern_return_t host_get_multiuser_config_flags(host_t host, uint32_t *multiuser_flags)
{
  return _host_get_multiuser_config_flags(host, multiuser_flags);
}

tm *__cdecl localtime(const time_t *a1)
{
  return _localtime(a1);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return _memset_s(__s, __smax, __c, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return _nanosleep(__rqtp, __rmtp);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

void openlog(const char *a1, int a2, int a3)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_uses_ephemeral_storage()
{
  return _os_variant_uses_ephemeral_storage();
}

int puts(const char *a1)
{
  return _puts(a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

int reboot(int a1)
{
  return _reboot(a1);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return _renamex_np(a1, a2, a3);
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return _setiopolicy_np(a1, a2, a3);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_blob(a1, iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_bytes(a1, iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return _sqlite3_file_control(a1, zDbName, op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

void sqlite3_free(void *a1)
{
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return _strncasecmp(a1, a2, a3);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return _strnstr(__big, __little, __len);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return _strtoll(__str, __endptr, __base);
}

void sync(void)
{
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return _uuid_parse(in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

uint64_t voucher_get_current_persona_proximate_info()
{
  return _voucher_get_current_persona_proximate_info();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_release(xpc_object_t object)
{
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

void xpc_transaction_begin(void)
{
}

void xpc_transaction_end(void)
{
}

id objc_msgSend__loadLockState(void *a1, const char *a2, ...)
{
  return [a1 _loadLockState];
}

id objc_msgSend_availableDevices(void *a1, const char *a2, ...)
{
  return [a1 availableDevices];
}

id objc_msgSend_beginNewRepetitionPeriod(void *a1, const char *a2, ...)
{
  return [a1 beginNewRepetitionPeriod];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_checkForVerificationEpoch(void *a1, const char *a2, ...)
{
  return [a1 checkForVerificationEpoch];
}

id objc_msgSend_commitNextVerificationEpoch(void *a1, const char *a2, ...)
{
  return [a1 commitNextVerificationEpoch];
}

id objc_msgSend_continueRepetitionPeriod(void *a1, const char *a2, ...)
{
  return [a1 continueRepetitionPeriod];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_embeddedSecureElement(void *a1, const char *a2, ...)
{
  return [a1 embeddedSecureElement];
}

id objc_msgSend_endSession(void *a1, const char *a2, ...)
{
  return [a1 endSession];
}

id objc_msgSend_failedPasscodeAttempts(void *a1, const char *a2, ...)
{
  return [a1 failedPasscodeAttempts];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_getHwSupport(void *a1, const char *a2, ...)
{
  return [a1 getHwSupport];
}

id objc_msgSend_getNextVerificationEpoch(void *a1, const char *a2, ...)
{
  return [a1 getNextVerificationEpoch];
}

id objc_msgSend_getSpacedRepetitionTimeout(void *a1, const char *a2, ...)
{
  return [a1 getSpacedRepetitionTimeout];
}

id objc_msgSend_handleVerificationEpoch(void *a1, const char *a2, ...)
{
  return [a1 handleVerificationEpoch];
}

id objc_msgSend_hwType(void *a1, const char *a2, ...)
{
  return [a1 hwType];
}

id objc_msgSend_initialize(void *a1, const char *a2, ...)
{
  return [a1 initialize];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isPermanentlyBlocked(void *a1, const char *a2, ...)
{
  return [a1 isPermanentlyBlocked];
}

id objc_msgSend_isSeshatAvailabledInRestrictedMode(void *a1, const char *a2, ...)
{
  return [a1 isSeshatAvailabledInRestrictedMode];
}

id objc_msgSend_isTemporarilyBlocked(void *a1, const char *a2, ...)
{
  return [a1 isTemporarilyBlocked];
}

id objc_msgSend_isWipePending(void *a1, const char *a2, ...)
{
  return [a1 isWipePending];
}

id objc_msgSend_notePasscodeEntryBegan(void *a1, const char *a2, ...)
{
  return [a1 notePasscodeEntryBegan];
}

id objc_msgSend_notePasscodeUnlockFailed(void *a1, const char *a2, ...)
{
  return [a1 notePasscodeUnlockFailed];
}

id objc_msgSend_notePasscodeUnlockSucceeded(void *a1, const char *a2, ...)
{
  return [a1 notePasscodeUnlockSucceeded];
}

id objc_msgSend_readConfig(void *a1, const char *a2, ...)
{
  return [a1 readConfig];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_sequenceCounter(void *a1, const char *a2, ...)
{
  return [a1 sequenceCounter];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_setupIntervals(void *a1, const char *a2, ...)
{
  return [a1 setupIntervals];
}

id objc_msgSend_setupNextTimer(void *a1, const char *a2, ...)
{
  return [a1 setupNextTimer];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedHardwareManager(void *a1, const char *a2, ...)
{
  return [a1 sharedHardwareManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_stopSpacedRepetition(void *a1, const char *a2, ...)
{
  return [a1 stopSpacedRepetition];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeUntilUnblockedSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeUntilUnblockedSinceReferenceDate];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_userDeleted(void *a1, const char *a2, ...)
{
  return [a1 userDeleted];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_writeConfig(void *a1, const char *a2, ...)
{
  return [a1 writeConfig];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 atomically:x1];
}