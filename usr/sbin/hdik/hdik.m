uint64_t start(int a1, char **a2)
{
  uint64_t *v4;
  __CFDictionary *Mutable;
  const char *v6;
  uint64_t v7;
  const char *v8;
  int v9;
  char *v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  char *v15;
  const char *v16;
  CFStringRef v17;
  CFStringRef v18;
  CFTypeID v19;
  char *v20;
  int v21;
  CFNumberRef v22;
  size_t v23;
  uint64_t v24;
  uint64_t j;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  __CFDictionary *v30;
  CFDataRef v31;
  CFDataRef v32;
  const CFBooleanRef *v33;
  const void *v34;
  CFTypeID v35;
  CFNumberRef v36;
  CFTypeID v37;
  CFNumberRef v38;
  CFUUIDRef v39;
  CFUUIDRef v40;
  CFStringRef v41;
  const char *v42;
  int v43;
  int v44;
  int v45;
  uint64_t v46;
  const char *v47;
  size_t v48;
  CFDataRef v49;
  CFDataRef Value;
  CFStringRef v51;
  CFStringRef v52;
  CFURLRef v53;
  CFURLRef v54;
  CFStringRef v55;
  CFStringRef v56;
  __CFDictionary *v57;
  CFArrayRef v58;
  __CFDictionary *v59;
  CFDictionaryRef v60;
  io_service_t MatchingService;
  io_object_t v62;
  kern_return_t MatchingServices;
  CFDictionaryRef v64;
  CFDictionaryRef v65;
  io_service_t v66;
  io_object_t v67;
  uint64_t v68;
  CFDataRef Data;
  CFDataRef v70;
  io_registry_entry_t v71;
  kern_return_t v72;
  IONotificationPortRef v73;
  IONotificationPort *v74;
  CFDictionaryRef v75;
  kern_return_t v76;
  __CFRunLoop *Current;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *v79;
  __CFRunLoopSource *v80;
  uint64_t Count;
  CFIndex i;
  CFDictionaryRef ValueAtIndex;
  CFStringRef v84;
  CFStringRef v85;
  const char *v86;
  char *v87;
  const char *v88;
  char *v89;
  kern_return_t v90;
  const void *v91;
  uint64_t v93;
  uint64_t v94;
  CFNumberRef cf;
  char *v96;
  CFNumberRef v97;
  char *v98;
  __CFDictionary *theDict;
  void *values;
  int outputStruct;
  stat __endptr;
  stat valuePtr[7];
  CFRange v104;

  v98 = basename(*a2);
  v4 = &qword_100008000;
  if (a1 <= 1)
  {
    warnx("no image specified");
    Mutable = 0;
    goto LABEL_175;
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v6 = 0;
  LODWORD(v7) = 1;
  theDict = Mutable;
  while (1)
  {
    v8 = v6;
    v6 = a2[(int)v7];
    if (!strcasecmp(v6, "-help") || !strcasecmp(v6, "-h"))
    {
      sub_100003118(v98);
      exit(0);
    }
    v9 = v7;
    if (!strcasecmp(v6, "-e"))
    {
      if (v7 + 1 == a1 || (v42 = a2[(int)v7 + 1], *v42 == 45))
      {
        warnx("you must specify a device to eject", v93);
        goto LABEL_175;
      }
      if (geteuid()) {
        goto LABEL_99;
      }
      if (!strncmp(v42, "/dev/", 5uLL))
      {
        memset(valuePtr, 0, 144);
        if (stat(v42, valuePtr))
        {
          warn("%s", v42);
          v46 = 3758097136;
          goto LABEL_163;
        }
        if ((valuePtr[0].st_mode & 0x6000) != 0)
        {
          v43 = open(v42, 0);
          if (v43 == -1)
          {
            warn("could not open %s", v42);
            v46 = 5;
            goto LABEL_163;
          }
          v44 = v43;
          v45 = ioctl(v43, 0x20006415uLL, 0);
          if (v45 == -1)
          {
            warn("could not eject %s", v42);
            v46 = 5;
            if (v44 < 0)
            {
LABEL_75:
              if (v45 != -1) {
                goto LABEL_150;
              }
LABEL_163:
              warnx("eject failed: error 0x%x = %d");
              goto LABEL_176;
            }
          }
          else
          {
            fprintf(__stdoutp, "%s ejected successfully.\n", v42);
            v46 = 0;
            if (v44 < 0) {
              goto LABEL_75;
            }
          }
          close(v44);
          goto LABEL_75;
        }
        warn("%s doesn't appear to be a device node");
      }
      else
      {
        warn("eject requires input of the form %sdiskX");
      }
      v46 = 3758097090;
      goto LABEL_163;
    }
    if (!strcasecmp(v6, "-shadow"))
    {
      warnx("-shadow option not supported", v93);
      goto LABEL_175;
    }
    if (strcasecmp(v6, "-nomount")) {
      break;
    }
    CFDictionarySetValue(Mutable, @"autodiskmount", kCFBooleanFalse);
    v6 = v8;
LABEL_61:
    LODWORD(v7) = v7 + 1;
    if ((int)v7 >= a1)
    {
      if (!geteuid())
      {
        v39 = CFUUIDCreate(kCFAllocatorDefault);
        if (v39)
        {
          v40 = v39;
          v41 = CFUUIDCreateString(kCFAllocatorDefault, v39);
          CFRelease(v40);
        }
        else
        {
          v41 = 0;
        }
        qword_100008000 = (uint64_t)v41;
        CFDictionarySetValue(Mutable, @"hdik-unique-identifier", v41);
        v47 = (const char *)valuePtr;
        if (!realpath_DARWIN_EXTSN(v6, (char *)valuePtr)) {
          v47 = v6;
        }
        v48 = strlen(v47);
        v49 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v47, v48);
        CFDictionarySetValue(Mutable, @"image-path", v49);
        if (v49) {
          CFRelease(v49);
        }
        values = 0;
        Value = (const __CFData *)CFDictionaryGetValue(Mutable, @"image-path");
        if (!Value)
        {
          v46 = 22;
          goto LABEL_157;
        }
        v51 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, Value, 0x8000100u);
        if (v51)
        {
          v52 = v51;
          v53 = CFURLCreateWithString(kCFAllocatorDefault, v51, 0);
          if (v53)
          {
            v54 = v53;
            memset(&__endptr, 0, sizeof(__endptr));
            v55 = CFURLCopyScheme(v53);
            v56 = v55;
            if (v55 && CFStringCompare(v55, @"file", 0))
            {
              CFRelease(v52);
              v57 = 0;
              v58 = 0;
              v46 = 0;
LABEL_104:
              CFRelease(v56);
LABEL_105:
              CFRelease(v54);
              if (values)
              {
                CFRelease(values);
                values = 0;
              }
              if (v58) {
                CFRelease(v58);
              }
              if (v57) {
                CFRelease(v57);
              }
              if (!v46)
              {
                __endptr.st_dev = 0;
                *(void *)&valuePtr[0].st_dev = 0;
                v60 = IOServiceMatching("IOHDIXController");
                MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v60);
                if (MatchingService)
                {
                  v62 = MatchingService;
                  goto LABEL_114;
                }
                v64 = IOServiceMatching("IOResources");
                MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v64, (io_iterator_t *)&__endptr);
                if (!MatchingServices)
                {
                  if (!IOIteratorIsValid(__endptr.st_dev)) {
                    IOIteratorReset(__endptr.st_dev);
                  }
                  v71 = IOIteratorNext(__endptr.st_dev);
                  if (v71)
                  {
                    v62 = v71;
                    v72 = IORegistryEntrySetCFProperty(v71, @"com.apple.AppleDiskImageController.load", kCFBooleanTrue);
                    if (v72)
                    {
                      MatchingServices = v72;
                      goto LABEL_115;
                    }
                    *(void *)&valuePtr[0].st_dev = 5;
                    v90 = IOKitWaitQuiet(kIOMasterPortDefault, (mach_timespec_t *)valuePtr);
                    if (v90) {
                      warnx("IOKit timed out waiting for driver to load: error %08x.", v90);
                    }
LABEL_114:
                    MatchingServices = 0;
LABEL_115:
                    IOObjectRelease(v62);
                    goto LABEL_117;
                  }
                  MatchingServices = -536870208;
                }
LABEL_117:
                if (__endptr.st_dev) {
                  IOObjectRelease(__endptr.st_dev);
                }
                if (MatchingServices)
                {
                  warnx("unable to load driver", v93);
                  goto LABEL_175;
                }
                LODWORD(values) = 0;
                v65 = IOServiceMatching("IOHDIXController");
                v66 = IOServiceGetMatchingService(kIOMasterPortDefault, v65);
                if (v66)
                {
                  v67 = v66;
                  memset(valuePtr, 0, 256);
                  outputStruct = 0;
                  v68 = IOServiceOpen(v66, mach_task_self_, 0, (io_connect_t *)&values);
                  if (!v68)
                  {
                    Data = CFPropertyListCreateData(kCFAllocatorDefault, Mutable, kCFPropertyListXMLFormat_v1_0, 0, 0);
                    if (Data)
                    {
                      v70 = Data;
                      memset(&valuePtr[0].st_rdev, 0, 232);
                      *(void *)&valuePtr[0].st_dev = 0x1BEEFFEEDLL;
                      valuePtr[0].st_ino = (__darwin_ino64_t)CFDataGetBytePtr(Data);
                      *(void *)&valuePtr[0].st_uid = CFDataGetLength(v70);
                      *(void *)&__endptr.st_dev = 4;
                      v68 = IOConnectCallStructMethod((mach_port_t)values, 0, valuePtr, 0x100uLL, &outputStruct, (size_t *)&__endptr);
                      CFRelease(v70);
                    }
                    else
                    {
                      v68 = 4;
                    }
                  }
                  IOObjectRelease(v67);
                  if (values) {
                    IOServiceClose((io_connect_t)values);
                  }
                  if (!v68)
                  {
                    v4[2] = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
                    valuePtr[0].st_dev = 0;
                    v73 = IONotificationPortCreate(kIOMasterPortDefault);
                    if (!v73) {
                      goto LABEL_151;
                    }
                    v74 = v73;
                    v75 = IOServiceMatching("IOMedia");
                    v76 = IOServiceAddMatchingNotification(v74, "IOServiceMatched", v75, (IOServiceMatchingCallback)sub_1000031F0, 0, (io_iterator_t *)valuePtr);
                    if (!v76)
                    {
                      sub_1000031F0(0, valuePtr[0].st_dev);
                      if (!byte_100008008)
                      {
                        Current = CFRunLoopGetCurrent();
                        RunLoopSource = IONotificationPortGetRunLoopSource(v74);
                        CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
                        v79 = CFRunLoopGetCurrent();
                        v80 = IONotificationPortGetRunLoopSource(v74);
                        CFRunLoopRemoveSource(v79, v80, kCFRunLoopDefaultMode);
                      }
                    }
                    IONotificationPortDestroy(v74);
                    if (valuePtr[0].st_dev) {
                      IOObjectRelease(valuePtr[0].st_dev);
                    }
                    if (v76)
                    {
LABEL_151:
                      warnx("unable to locate attached image");
                      v46 = 2;
                      goto LABEL_176;
                    }
                    Count = CFArrayGetCount((CFArrayRef)v4[2]);
                    v104.location = 0;
                    v104.length = Count;
                    CFArraySortValues((CFMutableArrayRef)v4[2], v104, (CFComparatorFunction)sub_1000033F4, 0);
                    if (Count >= 1)
                    {
                      for (i = 0; i != Count; ++i)
                      {
                        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v4[2], i);
                        v84 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"dev-entry");
                        v85 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"content-hint");
                        v86 = (const char *)sub_100003458(v84, 0x8000100u);
                        if (v86)
                        {
                          v87 = (char *)v86;
                          printf("%-20.20s", v86);
                          free(v87);
                        }
                        else
                        {
                          printf("%-20.20s", " ");
                        }
                        putchar(9);
                        v88 = (const char *)sub_100003458(v85, 0x8000100u);
                        if (v88)
                        {
                          v89 = (char *)v88;
                          printf("%-31.31s", v88);
                          free(v89);
                        }
                        else
                        {
                          printf("%-31.31s", " ");
                        }
                        putchar(9);
                        putchar(10);
                      }
                      v46 = 0;
                      Mutable = theDict;
                      goto LABEL_176;
                    }
LABEL_150:
                    v46 = 0;
                    goto LABEL_176;
                  }
                }
                else
                {
                  v68 = 3758097088;
                }
                warnx("attach failed: error 0x%x = %d", v68, v68);
                v46 = v68;
                goto LABEL_176;
              }
LABEL_157:
              warnx("couldn't construct backing store identifier");
              goto LABEL_176;
            }
            if (!CFURLGetFileSystemRepresentation(v54, 1u, (UInt8 *)valuePtr, 1024)
              || stat((const char *)valuePtr, &__endptr) < 0)
            {
              v58 = 0;
              v57 = 0;
              v46 = 2;
              goto LABEL_103;
            }
            values = (void *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"d%d:i%llu", __endptr.st_dev, __endptr.st_ino);
            if (values)
            {
              v58 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1, &kCFTypeArrayCallBacks);
              if (v58)
              {
                v59 = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                v57 = v59;
                if (v59)
                {
                  CFDictionarySetValue(v59, @"writeable-components", v58);
                  CFDictionarySetValue(Mutable, @"backingstore-id", v57);
                  v46 = 0;
                  goto LABEL_103;
                }
                goto LABEL_102;
              }
            }
            else
            {
              v58 = 0;
            }
            v57 = 0;
LABEL_102:
            v46 = 12;
LABEL_103:
            CFRelease(v52);
            if (!v56) {
              goto LABEL_105;
            }
            goto LABEL_104;
          }
          CFRelease(v52);
        }
        v46 = 12;
        goto LABEL_157;
      }
LABEL_99:
      warnx("must be run by root");
      v46 = 1;
      goto LABEL_176;
    }
  }
  if (strcasecmp(v6, "-drivekey"))
  {
    if (!strcasecmp(v6, "-encryption"))
    {
      v7 = (int)v7 + 1;
      if (v9 + 1 == a1)
      {
        warnx("missing <encryption-key+hmacsha1-key> parameter", v93);
      }
      else
      {
        v23 = strlen(a2[v7]);
        LOBYTE(values) = 0;
        if (v23 == 72)
        {
          printf("encryption-key:");
          v24 = 0;
          for (j = 0; j != 16; ++j)
          {
            v26 = sscanf(&a2[v7][v24], "%02hhx", &values);
            printf("%02x", values);
            fflush(0);
            if (v26 != 1)
            {
              Mutable = theDict;
              warnx("improper encryption-key portion of string", v94);
              goto LABEL_175;
            }
            *((unsigned char *)&__endptr.st_dev + j) = (_BYTE)values;
            v24 += 2;
          }
          putchar(10);
          printf("hmacsha1-key:");
          v27 = 0;
          v28 = 32;
          while (1)
          {
            v29 = sscanf(&a2[v7][v28], "%02hhx", &values);
            printf("%02x", values);
            if (v29 != 1) {
              break;
            }
            *((unsigned char *)&valuePtr[0].st_dev + v27++) = (_BYTE)values;
            v28 += 2;
            if (v27 == 20)
            {
              putchar(10);
              Mutable = theDict;
              CFDictionarySetValue(theDict, @"image-encrypted", kCFBooleanTrue);
              v30 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
              v31 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)&__endptr, 16);
              CFDictionarySetValue(v30, @"encryption-key", v31);
              CFRelease(v31);
              v32 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)valuePtr, 20);
              CFDictionarySetValue(v30, @"hmacsha1-key", v32);
              CFRelease(v32);
              CFDictionarySetValue(theDict, @"image-secrets", v30);
              CFRelease(v30);
              v6 = v8;
              v4 = &qword_100008000;
              goto LABEL_61;
            }
          }
          Mutable = theDict;
          v4 = &qword_100008000;
          warnx("improper hmacsha1-key portion of string", v93);
        }
        else
        {
          warnx("<encryption-key+hmacsha1-key> must be 72 ASCII chars");
        }
      }
      goto LABEL_175;
    }
    if (*v6 == 45)
    {
      warnx("unknown option \"%s\"");
      goto LABEL_175;
    }
    if (v8)
    {
      warnx("only one image may be specified", v93);
      goto LABEL_175;
    }
    goto LABEL_61;
  }
  v7 = (int)v7 + 1;
  if (v9 + 1 == a1)
  {
    warnx("missing -drivekey parameter", v93);
    goto LABEL_175;
  }
  v10 = a2[v7];
  v11 = strchr(v10, 61);
  if (!v11 || v11 == v10 || !v11[1]) {
    goto LABEL_174;
  }
  v12 = strlen(v10) + 1;
  v13 = (char *)malloc_type_malloc(v12, 0x62D022F1uLL);
  if (v13)
  {
    v14 = v13;
    strlcpy(v13, v10, v12);
    v15 = strchr(v14, 61);
    *v15 = 0;
    v16 = v15 + 1;
    v17 = CFStringCreateWithCString(kCFAllocatorDefault, v14, 0x8000100u);
    v18 = CFStringCreateWithCString(kCFAllocatorDefault, v16, 0x8000100u);
    if (CFStringCompare(v18, @"yes", 1uLL) && CFStringCompare(v18, @"true", 1uLL))
    {
      if (CFStringCompare(v18, @"no", 1uLL) && CFStringCompare(v18, @"false", 1uLL))
      {
        values = 0;
        v19 = CFGetTypeID(v18);
        if (v19 == CFStringGetTypeID())
        {
          v20 = (char *)sub_100003458(v18, 0x600u);
          if (v20)
          {
            *(void *)&__endptr.st_dev = 0;
            if (*v20)
            {
              v96 = v20;
              v21 = 0;
              *(void *)&valuePtr[0].st_dev = strtouq(v20, (char **)&__endptr, 0);
              v20 = v96;
              if (!**(unsigned char **)&__endptr.st_dev)
              {
                v22 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, valuePtr);
                if (v22)
                {
                  cf = v22;
                  v21 = CFNumberGetValue(v22, kCFNumberSInt64Type, &values);
                  CFRelease(cf);
                }
                else
                {
                  v21 = 0;
                }
                v20 = v96;
              }
            }
            else
            {
              v21 = 0;
            }
            free(v20);
LABEL_52:
            if (v21)
            {
              v38 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &values);
              if (v38)
              {
                v34 = v38;
LABEL_41:
                CFDictionarySetValue(theDict, v17, v34);
                CFRelease(v34);
LABEL_56:
                v4 = &qword_100008000;
                if (v17) {
                  CFRelease(v17);
                }
                if (v18) {
                  CFRelease(v18);
                }
                free(v14);
                v6 = v8;
                Mutable = theDict;
                goto LABEL_61;
              }
            }
LABEL_55:
            CFDictionarySetValue(theDict, v17, v18);
            goto LABEL_56;
          }
        }
        else
        {
          v35 = CFGetTypeID(v18);
          if (v35 != CFBooleanGetTypeID())
          {
            v37 = CFGetTypeID(v18);
            if (v37 == CFNumberGetTypeID())
            {
              v21 = CFNumberGetValue((CFNumberRef)v18, kCFNumberSInt64Type, &values);
              goto LABEL_52;
            }
            goto LABEL_55;
          }
          valuePtr[0].st_dev = CFBooleanGetValue((CFBooleanRef)v18) != 0;
          v36 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, valuePtr);
          if (v36)
          {
            v97 = v36;
            v21 = CFNumberGetValue(v36, kCFNumberSInt64Type, &values);
            CFRelease(v97);
            goto LABEL_52;
          }
        }
        v21 = 0;
        goto LABEL_52;
      }
      v33 = &kCFBooleanFalse;
    }
    else
    {
      v33 = &kCFBooleanTrue;
    }
    v34 = *v33;
    if (*v33) {
      goto LABEL_41;
    }
    goto LABEL_55;
  }
  Mutable = theDict;
LABEL_174:
  warnx("unable to process -drivekey parameter \"%s\"");
LABEL_175:
  v46 = 22;
LABEL_176:
  v91 = (const void *)v4[2];
  if (v91)
  {
    CFRelease(v91);
    v4[2] = 0;
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v46 == 22)
  {
    sub_100003118(v98);
    exit(1);
  }
  return v46;
}

size_t sub_100003118(const char *a1)
{
  fprintf(__stderrp, "Usage:\t%s [options] <image>\n", a1);
  fprintf(__stderrp, "\t%s -e <device>\n", a1);
  fprintf(__stderrp, "\t%s -help\n", a1);
  fwrite("\toptions:\n", 0xAuLL, 1uLL, __stderrp);
  fwrite("\t    -nomount\n", 0xEuLL, 1uLL, __stderrp);
  fwrite("\t    -drivekey <key>=<value>\n", 0x1DuLL, 1uLL, __stderrp);
  v2 = __stderrp;

  return fwrite("\t    -encryption <encryption-key+hmacsha1-key>\n", 0x2FuLL, 1uLL, v2);
}

uint64_t sub_1000031F0(int a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    io_registry_entry_t v4 = result;
    int v5 = 0;
    do
    {
      CFTypeRef v6 = IORegistryEntrySearchCFProperty(v4, "IOService", @"hdik-unique-identifier", kCFAllocatorDefault, 3u);
      if (v6)
      {
        v7 = v6;
        CFTypeID v8 = CFGetTypeID(v6);
        if (v8 == CFStringGetTypeID() && CFEqual((CFTypeRef)qword_100008000, v7))
        {
          CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v4, @"BSD Name", kCFAllocatorDefault, 0);
          if (CFProperty)
          {
            v10 = CFProperty;
            CFArrayRef v11 = (const __CFArray *)qword_100008010;
            v16.length = CFArrayGetCount((CFArrayRef)qword_100008010);
            v16.location = 0;
            if (!CFArrayContainsValue(v11, v16, v10))
            {
              Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
              CFStringRef v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"/dev/%@", v10);
              CFDictionarySetValue(Mutable, @"dev-entry", v13);
              if (v13) {
                CFRelease(v13);
              }
              CFTypeRef v14 = IORegistryEntryCreateCFProperty(v4, @"Content", kCFAllocatorDefault, 0);
              if (v14)
              {
                v15 = v14;
                CFDictionarySetValue(Mutable, @"content-hint", v14);
                CFRelease(v15);
              }
              CFArrayAppendValue((CFMutableArrayRef)qword_100008010, Mutable);
              if (Mutable) {
                CFRelease(Mutable);
              }
            }
            CFRelease(v10);
          }
          int v5 = 1;
        }
        IOObjectRelease(v4);
        CFRelease(v7);
      }
      else
      {
        IOObjectRelease(v4);
      }
      uint64_t result = IOIteratorNext(iterator);
      io_registry_entry_t v4 = result;
    }
    while (result);
    if (v5) {
      byte_100008008 = 1;
    }
  }
  return result;
}

CFComparisonResult sub_1000033F4(const __CFDictionary *a1, const __CFDictionary *a2)
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, @"dev-entry");
  CFStringRef v4 = (const __CFString *)CFDictionaryGetValue(a2, @"dev-entry");

  return CFStringCompare(Value, v4, 0);
}

void *sub_100003458(const __CFString *a1, CFStringEncoding a2)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v5 = CFStringGetMaximumSizeForEncoding(Length, a2) + 1;
  CFTypeRef v6 = (char *)malloc_type_malloc(v5, 0x6C7A34EFuLL);
  if (!v6) {
    return 0;
  }
  v7 = v6;
  if (!CFStringGetCString(a1, v6, v5, a2))
  {
    free(v7);
    return 0;
  }
  size_t v8 = strlen(v7) + 1;

  return reallocf(v7, v8);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
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

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
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

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return _CFStringCreateFromExternalRepresentation(alloc, data, encoding);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return _CFURLCopyScheme(anURL);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return _CFURLCreateWithString(allocator, URLString, baseURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return _CFURLGetFileSystemRepresentation(url, resolveAgainstBase, buffer, maxBufLen);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return _IOIteratorIsValid(iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
}

kern_return_t IOKitWaitQuiet(mach_port_t mainPort, mach_timespec_t *waitTime)
{
  return _IOKitWaitQuiet(mainPort, waitTime);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

char *__cdecl basename(char *a1)
{
  return _basename(a1);
}

int close(int a1)
{
  return _close(a1);
}

void exit(int a1)
{
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uid_t geteuid(void)
{
  return _geteuid();
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int putchar(int a1)
{
  return _putchar(a1);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return _reallocf(__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

unint64_t strtouq(const char *__str, char **__endptr, int __base)
{
  return _strtouq(__str, __endptr, __base);
}

void warn(const char *a1, ...)
{
}

void warnx(const char *a1, ...)
{
}