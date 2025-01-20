uint64_t start(int a1, uint64_t a2)
{
  kern_return_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  int v10;
  unsigned __int8 v11;
  unsigned __int8 *v12;
  char *v13;
  kern_return_t CFProperties;
  const char *v15;
  const char *v16;
  int v17;
  int v18;
  UInt8 *v19;
  UInt8 *v20;
  ssize_t v21;
  __CFReadStream *v22;
  __CFReadStream *v23;
  CFDictionaryRef v24;
  CFDictionaryRef v25;
  CFDictionaryRef v26;
  kern_return_t v27;
  CFDataRef Data;
  CFDataRef v29;
  const UInt8 *BytePtr;
  size_t Length;
  const char *v32;
  mach_error_t v33;
  FILE *v34;
  FILE *v35;
  int v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  mach_error_t v41;
  __uint32_t v42;
  FILE *v43;
  FILE *v44;
  int v45;
  unsigned int v46;
  uint64_t v47;
  __uint32_t v48;
  int v49;
  char *v50;
  const char *v51;
  char *v52;
  CFStringRef v53;
  __CFString *v54;
  __CFData *MutableCopy;
  int v56;
  int v57;
  CFStringRef v58;
  __CFString *CFProperty;
  CFTypeID v60;
  size_t v61;
  CFIndex v62;
  CFIndex v63;
  char *v64;
  size_t v65;
  CFTypeID v66;
  CFIndex v67;
  size_t v68;
  size_t v69;
  const UInt8 *v70;
  CFTypeID v71;
  CFIndex v72;
  CFIndex MaximumSizeForEncoding;
  char *v74;
  int CString;
  CFTypeID v76;
  char *v77;
  char *v78;
  const char *v79;
  size_t v80;
  mach_error_t v81;
  uint64_t v82;
  io_object_t v83;
  uint64_t result;
  FILE *v85;
  char *v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  mach_port_t mainPort;
  stat properties[14];
  CFPropertyListFormat context[32];

  mainPort = 0;
  byte_100008000 = os_variant_allows_internal_security_policies();
  v4 = IOMainPort(bootstrap_port, &mainPort);
  if (v4) {
    sub_100003020(v4);
  }
  v5 = &byte_100008000;
  dword_100008004 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  if (!dword_100008004) {
    sub_100002D70();
  }
  v6 = &byte_100008000;
  dword_100008008 = IORegistryEntryFromPath(mainPort, "IOService:/options/options-system");
  dword_10000800C = dword_100008004;
  if (a1 >= 2)
  {
    v90 = 0;
    v91 = 0;
    v7 = a1;
    v87 = a1;
    v8 = 1;
    v88 = a2;
    v89 = a1;
    while (1)
    {
      v9 = *(unsigned __int8 **)(a2 + 8 * v8);
      v10 = *v9;
      if (v10 == 45)
      {
        v12 = v9 + 1;
        v11 = v9[1];
        if (v11)
        {
          while (1)
          {
            switch(v11)
            {
              case 'b':
                if (a1 != 4) {
                  sub_100001E90("missing arguments");
                }
                if (v8 + 1 >= v7 || (v13 = *(char **)(a2 + 8 * (v8 + 1)), *v13 == 45))
                {
                  ++v8;
                }
                else
                {
                  v8 += 2;
                  v43 = fopen(*(const char **)(a2 + 8 * v8), "r");
                  if (!v43) {
                    err(1, "Couldn't open binary file - '%s'");
                  }
                  v44 = v43;
                  v45 = getc(v43);
                  if (v45 == -1) {
                    goto LABEL_201;
                  }
                  v46 = v45;
                  v47 = 0;
                  do
                  {
                    if (v47 >= 2048) {
                      sub_100002E80();
                    }
                    if (v46 > 0x7F) {
                      v48 = __maskrune(v46, 0x40000uLL);
                    }
                    else {
                      v48 = _DefaultRuneLocale.__runetype[v46] & 0x40000;
                    }
                    if (v46 == 37 || !v48) {
                      v47 += sprintf((char *)properties + v47, "%%%02x", v46);
                    }
                    else {
                      *((unsigned char *)&properties[0].st_dev + v47++) = v46;
                    }
                    v46 = getc(v44);
                  }
                  while (v46 != -1);
                  if (v47 <= 0) {
LABEL_201:
                  }
                    sub_100002E5C();
                  *((unsigned char *)&properties[0].st_dev + v47) = 0;
                  v41 = sub_100001FA8(v13, (const char *)properties);
                  if (v41)
                  {
LABEL_177:
                    mach_error_string(v41);
                    errx(1, "Error setting variable - '%s': %s");
                  }
                  v7 = v89;
                }
                goto LABEL_112;
              case 'c':
                *(void *)&properties[0].st_dev = 0;
                CFProperties = IORegistryEntryCreateCFProperties(dword_10000800C, (CFMutableDictionaryRef *)properties, 0, 0);
                LODWORD(context[0]) = CFProperties;
                if (CFProperties) {
                  sub_100002E34(CFProperties);
                }
                CFDictionaryApplyFunction(*(CFDictionaryRef *)&properties[0].st_dev, (CFDictionaryApplierFunction)sub_100002C40, context);
                CFRelease(*(CFTypeRef *)&properties[0].st_dev);
                v91 = LODWORD(context[0]);
                goto LABEL_112;
              case 'd':
                if (++v8 >= v7) {
                  goto LABEL_176;
                }
                v15 = *(const char **)(a2 + 8 * v8);
                if (*v15 == 45) {
                  goto LABEL_176;
                }
                sub_100001FA8("IONVRAM-DELETE-PROPERTY", v15);
                goto LABEL_112;
              case 'e':
              case 'g':
              case 'i':
              case 'j':
              case 'k':
              case 'l':
              case 'm':
              case 'n':
              case 'o':
              case 'q':
              case 't':
              case 'u':
              case 'v':
              case 'w':
              case 'y':
                goto LABEL_179;
              case 'f':
                if (++v8 >= v7 || (v16 = *(const char **)(a2 + 8 * v8), *v16 == 45)) {
                  sub_100001E90("missing filename");
                }
                if (byte_100008011 == 1)
                {
                  memset(properties, 0, 144);
                  context[0] = kCFPropertyListBinaryFormat_v1_0;
                  v17 = open(v16, 256, 0x8000);
                  if (v17 == -1) {
                    sub_100002EA8(v16);
                  }
                  v18 = v17;
                  if (fstat(v17, properties) == -1) {
                    sub_100002EE0(v16);
                  }
                  if (properties[0].st_size >= (uint64_t)&_mh_execute_header) {
                    sub_100002F18();
                  }
                  v19 = (UInt8 *)malloc_type_malloc(properties[0].st_size, 0x876E783DuLL);
                  if (!v19) {
                    sub_100002F34();
                  }
                  v20 = v19;
                  v21 = read(v18, v19, properties[0].st_size);
                  if (v21 != properties[0].st_size) {
                    sub_100002FA4(v16);
                  }
                  close(v18);
                  v22 = CFReadStreamCreateWithBytesNoCopy(kCFAllocatorDefault, v20, properties[0].st_size, kCFAllocatorNull);
                  if (!v22) {
                    sub_100002F50();
                  }
                  v23 = v22;
                  if (!CFReadStreamOpen(v22)) {
                    sub_100002F6C();
                  }
                  v24 = (const __CFDictionary *)CFPropertyListCreateWithStream(kCFAllocatorDefault, v23, properties[0].st_size, 0, context, 0);
                  if (!v24) {
                    sub_100002F88();
                  }
                  v25 = v24;
                  CFReadStreamClose(v23);
                  CFRelease(v23);
                  free(v20);
                  CFDictionaryApplyFunction(v25, (CFDictionaryApplierFunction)sub_100002440, 0);
                  v26 = v25;
LABEL_48:
                  CFRelease(v26);
                }
                else
                {
                  v34 = fopen(*(const char **)(a2 + 8 * v8), "r");
                  if (!v34) {
                    err(1, "Couldn't open patch file - '%s'");
                  }
                  v35 = v34;
                  v36 = getc(v34);
                  if (v36 != -1)
                  {
                    v37 = v36;
                    v38 = 0;
                    v39 = 0;
                    v40 = 0;
                    while (2)
                    {
                      if (v39 == 255) {
                        sub_100002FDC();
                      }
                      if (v38 == 2047) {
                        sub_100002E80();
                      }
                      switch(v40)
                      {
                        case 0:
                          if (v37 == 10)
                          {
                            v38 = 0;
                            v39 = 0;
                            goto LABEL_57;
                          }
                          if (v37 == 35)
                          {
                            v38 = 0;
                            v39 = 0;
                            v40 = 1;
                            goto LABEL_90;
                          }
                          if (v37 > 0x7F) {
                            v42 = __maskrune(v37, 0x4000uLL);
                          }
                          else {
                            v42 = _DefaultRuneLocale.__runetype[v37] & 0x4000;
                          }
                          v38 = 0;
                          if (v42)
                          {
                            v39 = 0;
                            goto LABEL_89;
                          }
                          LOBYTE(context[0]) = v37;
                          v39 = 1;
                          goto LABEL_85;
                        case 1:
                          v40 = v37 != 10;
                          goto LABEL_90;
                        case 2:
                          if (v37 == 10) {
                            goto LABEL_57;
                          }
                          if (v37 > 0x7F)
                          {
                            if (!__maskrune(v37, 0x4000uLL)) {
                              goto LABEL_84;
                            }
                          }
                          else if ((_DefaultRuneLocale.__runetype[v37] & 0x4000) == 0)
                          {
                            goto LABEL_84;
                          }
LABEL_89:
                          v40 = 2;
                          goto LABEL_90;
                        case 3:
                          if (v37 == 10)
                          {
                            *((unsigned char *)context + v39) = 0;
                            warnx("Name must be followed by white space - '%s'", (const char *)context);
LABEL_57:
                            v40 = 0;
                          }
                          else
                          {
                            if (v37 > 0x7F)
                            {
                              if (__maskrune(v37, 0x4000uLL))
                              {
LABEL_79:
                                v40 = 4;
                                goto LABEL_90;
                              }
                            }
                            else if ((_DefaultRuneLocale.__runetype[v37] & 0x4000) != 0)
                            {
                              goto LABEL_79;
                            }
LABEL_84:
                            *((unsigned char *)context + v39++) = v37;
LABEL_85:
                            v40 = 3;
                          }
LABEL_90:
                          v37 = getc(v35);
                          if (v37 != -1) {
                            continue;
                          }
                          a2 = v88;
                          v7 = v89;
                          if (v40) {
                            sub_100003004();
                          }
                          return result;
                        case 4:
                        case 6:
                          if (v37 == 10) {
                            goto LABEL_56;
                          }
                          if (v37 > 0x7F)
                          {
                            if (__maskrune(v37, 0x4000uLL)) {
                              goto LABEL_90;
                            }
                          }
                          else if ((_DefaultRuneLocale.__runetype[v37] & 0x4000) != 0)
                          {
                            goto LABEL_90;
                          }
LABEL_77:
                          *((unsigned char *)&properties[0].st_dev + v38++) = v37;
                          v40 = 5;
                          goto LABEL_90;
                        case 5:
                          if (v37 != 10) {
                            goto LABEL_77;
                          }
                          if (*((unsigned char *)properties + v38 - 1) == 92)
                          {
                            *((unsigned char *)properties + v38 - 1) = 13;
                            v40 = 6;
                            goto LABEL_90;
                          }
LABEL_56:
                          *((unsigned char *)context + v39) = 0;
                          *((unsigned char *)&properties[0].st_dev + v38) = 0;
                          v41 = sub_100001FA8((char *)context, (const char *)properties);
                          if (v41) {
                            goto LABEL_177;
                          }
                          goto LABEL_57;
                        case 7:
                          goto LABEL_56;
                        default:
                          goto LABEL_90;
                      }
                    }
                  }
                }
                goto LABEL_112;
              case 'h':
                sub_100001E90((const char *)&unk_1000035FF);
              case 'p':
                *(void *)&properties[0].st_dev = 0;
                v27 = IORegistryEntryCreateCFProperties(dword_10000800C, (CFMutableDictionaryRef *)properties, 0, 0);
                if (v27) {
                  sub_100002E34(v27);
                }
                if (byte_100008011 == 1)
                {
                  Data = CFPropertyListCreateData(kCFAllocatorDefault, *(CFPropertyListRef *)&properties[0].st_dev, kCFPropertyListXMLFormat_v1_0, 0, 0);
                  if (!Data) {
                    sub_100002E18();
                  }
                  v29 = Data;
                  BytePtr = CFDataGetBytePtr(Data);
                  Length = CFDataGetLength(v29);
                  fwrite(BytePtr, 1uLL, Length, __stdoutp);
                  CFRelease(v29);
                  v7 = v89;
                }
                else
                {
                  CFDictionaryApplyFunction(*(CFDictionaryRef *)&properties[0].st_dev, (CFDictionaryApplierFunction)sub_100002720, 0);
                }
                v26 = *(const __CFDictionary **)&properties[0].st_dev;
                goto LABEL_48;
              case 'r':
                if (++v8 >= v7 || (v32 = *(const char **)(a2 + 8 * v8), *v32 == 45)) {
LABEL_176:
                }
                  sub_100001E90("missing name");
                v33 = sub_100001FA8("IONVRAM-DELETEWRET-PROPERTY", v32);
                if (v33)
                {
                  mach_error_string(v33);
                  errx(1, "Error deleting variable - '%s': %s (0x%08x)");
                }
                v91 = 0;
                goto LABEL_112;
              case 's':
                byte_100008012 = 1;
                goto LABEL_112;
              case 'x':
                if (byte_100008010 == 1)
                {
                  v82 = 1;
                  fwrite("-x not supported with -X hex mode.\n", 0x23uLL, 1uLL, __stderrp);
                  return v82;
                }
                byte_100008011 = 1;
LABEL_112:
                v49 = *++v12;
                v11 = v49;
                if (!v49) {
                  goto LABEL_161;
                }
                break;
              case 'z':
                if (!byte_100008000) {
                  sub_100001E90("unsupported option -z");
                }
                if (dword_100008008)
                {
                  fwrite("Selecting options-system node.\n", 0x1FuLL, 1uLL, __stderrp);
                  dword_10000800C = dword_100008008;
                }
                else
                {
                  fwrite("No options-system node, using options.\n", 0x27uLL, 1uLL, __stderrp);
                }
                goto LABEL_112;
              default:
                if (v11 != 88)
                {
LABEL_179:
                  strcpy((char *)properties, "no such option as --");
                  *((unsigned char *)properties + strlen((const char *)properties) - 1) = v11;
                  sub_100001E90((const char *)properties);
                }
                if (byte_100008011 == 1)
                {
                  fwrite("-X hex mode not supported with -x XMLmode.\n", 0x2BuLL, 1uLL, __stderrp);
                  return 1;
                }
                byte_100008010 = 1;
                goto LABEL_112;
            }
          }
        }
      }
      v50 = (char *)(v9 + 1);
      ++v90;
      while (v10 <= 44)
      {
        if (v10 != 43)
        {
          if (!v10)
          {
            v56 = 0;
            v57 = 0;
            v51 = v50 - 1;
            goto LABEL_129;
          }
          goto LABEL_125;
        }
        v10 = *v50;
        if (v10 == 61)
        {
          v56 = 0;
          v57 = 1;
          goto LABEL_128;
        }
LABEL_126:
        ++v50;
      }
      if (v10 != 45) {
        break;
      }
      v10 = *v50;
      if (v10 != 61) {
        goto LABEL_126;
      }
      v57 = 0;
      v56 = 1;
LABEL_128:
      *(_WORD *)(v50 - 1) = 0;
      v51 = v50 + 1;
LABEL_129:
      v58 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)v9, 0x8000100u);
      if (!v58) {
        errx(1, "Error creating CFString for key %s");
      }
      v54 = (__CFString *)v58;
      CFProperty = (__CFString *)IORegistryEntryCreateCFProperty(dword_10000800C, v58, 0, 0);
      if (!CFProperty) {
        sub_100002D8C((const char *)v9);
      }
      v53 = CFProperty;
      if (!v57)
      {
        if (!v56)
        {
          sub_100002720(v54, CFProperty);
          MutableCopy = 0;
          v52 = 0;
          a1 = v87;
          v7 = v89;
          goto LABEL_154;
        }
        MutableCopy = 0;
        v52 = 0;
LABEL_141:
        v71 = CFGetTypeID(v53);
        if (v71 == CFStringGetTypeID())
        {
          v72 = CFStringGetLength(v53);
          MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(v72, 0x8000100u);
          v74 = (char *)malloc_type_calloc(MaximumSizeForEncoding + 1, 1uLL, 0x5561CCDFuLL);
          if (!v74
            || (v50 = v74,
                CString = CFStringGetCString(v53, v74, MaximumSizeForEncoding, 0x8000100u),
                v52 = v50,
                !CString))
          {
            sub_100002DE0();
          }
        }
        else
        {
          v76 = CFGetTypeID(v53);
          if (v76 != CFDataGetTypeID()) {
            sub_100002DFC();
          }
          v50 = (char *)CFDataGetBytePtr((CFDataRef)v53);
        }
        v77 = strstr(v50, v51);
        if (!v77) {
          errx(1, "substring %s not found in %s\n");
        }
        v78 = v77;
        v79 = &v77[strlen(v51)];
        v80 = strlen(v79);
        memmove(v78, v79, v80 + 1);
        goto LABEL_151;
      }
      v60 = CFGetTypeID(CFProperty);
      if (v60 != CFStringGetTypeID())
      {
        v66 = CFGetTypeID(v53);
        if (v66 != CFDataGetTypeID()) {
          sub_100002DFC();
        }
        v67 = CFDataGetLength((CFDataRef)v53);
        v68 = strlen(v51);
        MutableCopy = CFDataCreateMutableCopy(kCFAllocatorDefault, v67 + v68 + 1, (CFDataRef)v53);
        v69 = strlen(v51);
        CFDataAppendBytes(MutableCopy, (const UInt8 *)v51, v69 + 1);
        v70 = CFDataGetBytePtr(MutableCopy);
        v52 = 0;
        if ((v56 & 1) == 0)
        {
          v50 = (char *)v70;
          goto LABEL_151;
        }
        goto LABEL_141;
      }
      v61 = strlen(v51);
      v62 = CFStringGetLength(v53);
      v63 = CFStringGetMaximumSizeForEncoding(v62, 0x8000100u) + v61;
      v64 = (char *)malloc_type_calloc(v63 + 1, 1uLL, 0x4AD4FBE4uLL);
      if (!v64 || (v52 = v64, !CFStringGetCString(v53, v64, v63, 0x8000100u))) {
        sub_100002DC4();
      }
      v65 = strlen(v52);
      strcpy(&v52[v65], v51);
      MutableCopy = 0;
      if (v56) {
        goto LABEL_141;
      }
      v50 = v52;
LABEL_151:
      a1 = v87;
      v7 = v89;
LABEL_152:
      v81 = sub_100001FA8((char *)v9, v50);
      sub_100001F7C();
      if (v81)
      {
        v85 = __stderrp;
        v86 = mach_error_string(v81);
        fprintf(v85, "Error setting variable - '%s': %s.\n", (const char *)v9, v86);
        if (v81 == -536870211) {
          sub_100002508();
        }
        exit(1);
      }
      if (v54) {
LABEL_154:
      }
        CFRelease(v54);
      if (v53) {
        CFRelease(v53);
      }
      if (v52) {
        free(v52);
      }
      a2 = v88;
      if (MutableCopy) {
        CFRelease(MutableCopy);
      }
LABEL_161:
      if (++v8 >= v7)
      {
        v5 = &byte_100008000;
        v6 = &byte_100008000;
        v82 = v91;
        if (!v90) {
          goto LABEL_165;
        }
        goto LABEL_167;
      }
    }
    if (v10 == 61)
    {
      v52 = 0;
      v53 = 0;
      v54 = 0;
      MutableCopy = 0;
      *(v50 - 1) = 0;
      goto LABEL_152;
    }
LABEL_125:
    v10 = *v50;
    goto LABEL_126;
  }
  v82 = 0;
LABEL_165:
  if (byte_100008012 == 1) {
    sub_100001F7C();
  }
LABEL_167:
  if (a1 == 1) {
    sub_100001E90("no arguments specified");
  }
  IOObjectRelease(*((_DWORD *)v5 + 1));
  v83 = *((_DWORD *)v6 + 2);
  if (v83) {
    IOObjectRelease(v83);
  }
  return v82;
}

void sub_100001E90(const char *a1)
{
  puts("nvram [-x|-X] [-p] [-f filename] [-d name] [-c] name[=value] ...");
  puts("\t-x         use XML format for printing or reading variables");
  puts("\t           (must appear before -p or -f)");
  puts("\t-X         use HEX format for printing or reading variables");
  puts("\t           (must appear before -p or -f)");
  puts("\t-p         print all firmware variables");
  puts("\t-f         set firmware variables from a text file");
  puts("\t-d         delete the named variable(does not return error code)");
  puts("\t-r         delete the named variable(returns error code if any)");
  puts("\t-c         delete all variables");
  puts("\t-b         set variable using binary file. invoked with the following format: nvram -b <variable name> <binary file>");
  if (byte_100008000) {
    puts("\t-z         use system-options node if available (internal builds only)");
  }
  puts("\tname=value set named variable");
  puts("\tname       print variable");
  puts("Note that arguments and options are executed in order.");
  exit(1);
}

uint64_t sub_100001F7C()
{
  if (byte_100008012) {
    return sub_100001FA8("IONVRAM-FORCESYNCNOW-PROPERTY", "IONVRAM-FORCESYNCNOW-PROPERTY");
  }
  else {
    return sub_100001FA8("IONVRAM-SYNCNOW-PROPERTY", "IONVRAM-SYNCNOW-PROPERTY");
  }
}

uint64_t sub_100001FA8(char *cStr, const char *a2)
{
  CFStringRef v4 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  if (!v4) {
    errx(1, "Error creating CFString for key %s");
  }
  CFStringRef v5 = v4;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(dword_10000800C, v4, 0, 0);
  if (CFProperty)
  {
    v7 = CFProperty;
    CFTypeID v8 = CFGetTypeID(CFProperty);
    CFRelease(v7);
    CFDataRef v9 = sub_100002188(v8, a2);
    if (!v9) {
      errx(1, "Error creating CFTypeRef for value %s");
    }
LABEL_4:
    uint64_t v10 = IORegistryEntrySetCFProperty(dword_10000800C, v5, v9);
    goto LABEL_5;
  }
  if (!strncmp(cStr, "IONVRAM-DELETEWRET-PROPERTY", 0x1BuLL) || !strncmp(cStr, "IONVRAM-DELETE-PROPERTY", 0x17uLL))
  {
    CFTypeID TypeID = CFStringGetTypeID();
    CFDataRef v9 = sub_100002188(TypeID, a2);
    if (!v9)
    {
      uint64_t v10 = 0;
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v18[0] = CFDataGetTypeID();
  v18[1] = CFStringGetTypeID();
  v18[2] = CFNumberGetTypeID();
  uint64_t v12 = 0;
  uint64_t v10 = 0;
  v18[3] = CFBooleanGetTypeID();
  do
  {
    CFDataRef v13 = sub_100002188(v18[v12], a2);
    if (v13)
    {
      uint64_t v14 = IORegistryEntrySetCFProperty(dword_10000800C, v5, v13);
      uint64_t v10 = v14;
      BOOL v15 = v14 == -536870211 || v14 == -536870181;
      if (v15 || v14 == 0) {
        break;
      }
    }
    ++v12;
  }
  while (v12 != 4);
LABEL_5:
  CFRelease(v5);
  return v10;
}

CFDataRef sub_100002188(uint64_t a1, const char *a2)
{
  if (CFBooleanGetTypeID() == a1)
  {
    if (!strcmp("true", a2))
    {
      return kCFBooleanTrue;
    }
    else if (!strcmp("false", a2))
    {
      return kCFBooleanFalse;
    }
    else
    {
      return 0;
    }
  }
  else if (CFNumberGetTypeID() == a1)
  {
    uint64_t valuePtr = strtol(a2, 0, 0);
    return CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  }
  else if (CFStringGetTypeID() == a1)
  {
    return (CFDataRef)CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  }
  else if (CFDataGetTypeID() == a1)
  {
    int64_t v5 = strlen(a2);
    uint64_t v6 = __chkstk_darwin();
    v7 = (const UInt8 *)&valuePtr - ((v6 + 16) & 0xFFFFFFFFFFFFFFF0);
    if (v6 < 1)
    {
      CFIndex v8 = 0;
    }
    else
    {
      CFIndex v8 = 0;
      uint64_t v9 = 0;
      do
      {
        int v10 = a2[v9];
        if (v10 == 37)
        {
          uint64_t v11 = v9 + 2;
          if (v9 + 2 > v5) {
            return 0;
          }
          uint64_t v12 = v9 + 1;
          __darwin_ct_rune_t v13 = a2[v9 + 1];
          if (v13 < 0)
          {
            if (!__maskrune(v13, 0x10000uLL)) {
              return 0;
            }
          }
          else if ((_DefaultRuneLocale.__runetype[v13] & 0x10000) == 0)
          {
            return 0;
          }
          __darwin_ct_rune_t v14 = a2[v11];
          if (v14 < 0)
          {
            if (!__maskrune(v14, 0x10000uLL)) {
              return 0;
            }
          }
          else if ((_DefaultRuneLocale.__runetype[v14] & 0x10000) == 0)
          {
            return 0;
          }
          unsigned int v15 = __toupper(a2[v12]) - 48;
          __darwin_ct_rune_t v16 = __toupper(a2[v11]);
          unsigned int v17 = v16 - 48;
          char v18 = 16 * v15;
          if (v15 > 9) {
            char v18 = 16 * v15 - 112;
          }
          if (v17 > 9) {
            LOBYTE(v17) = v16 - 55;
          }
          LOBYTE(v10) = v17 + v18;
        }
        else
        {
          uint64_t v11 = v9;
        }
        v7[v8] = v10;
        uint64_t v9 = v11 + 1;
        ++v8;
      }
      while (v11 + 1 < v5);
    }
    return CFDataCreate(kCFAllocatorDefault, v7, v8);
  }
  else
  {
    return 0;
  }
}

uint64_t sub_100002440(CFStringRef propertyName, CFTypeRef property)
{
  uint64_t result = IORegistryEntrySetCFProperty(dword_10000800C, propertyName, property);
  if (result)
  {
    mach_error_t error_value = result;
    CFIndex Length = CFStringGetLength(propertyName);
    CFIndex v5 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    uint64_t v6 = (char *)malloc_type_malloc(v5, 0x67656A6CuLL);
    if (!v6 || (v7 = v6, !CFStringGetCString(propertyName, v6, v5, 0x8000100u)))
    {
      warnx("Unable to convert property name to C string");
      v7 = "<UNPRINTABLE>";
    }
    CFIndex v8 = mach_error_string(error_value);
    errx(1, "Error setting variable - '%s': %s", v7, v8);
  }
  return result;
}

void sub_100002508()
{
  kern_return_t v0;
  int64_t Count;
  const void **v2;
  const void **v3;
  const void **v4;
  const void **v5;
  void *v6;
  void *v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  FILE *v14;
  const char *CStringPtr;
  void __compar[5];
  CFMutableDictionaryRef properties;

  properties = 0;
  v0 = IORegistryEntryCreateCFProperties(dword_100008004, &properties, 0, 0);
  if (v0) {
    sub_100002E34(v0);
  }
  Count = CFDictionaryGetCount(properties);
  v2 = (const void **)malloc_type_calloc(Count, 8uLL, 0x80040B8603338uLL);
  if (!v2) {
    sub_100003048();
  }
  v3 = v2;
  CFStringRef v4 = (const void **)malloc_type_calloc(Count, 8uLL, 0x80040B8603338uLL);
  if (!v4) {
    sub_100003048();
  }
  CFIndex v5 = v4;
  uint64_t v6 = malloc_type_calloc(Count, 8uLL, 0x100004000313F17uLL);
  if (!v6) {
    sub_100003048();
  }
  v7 = v6;
  if (Count)
  {
    for (i = 0; i != Count; ++i)
      *((void *)v6 + i) = i;
  }
  CFDictionaryGetKeysAndValues(properties, v3, v5);
  __compar[0] = _NSConcreteStackBlock;
  __compar[1] = 0x40000000;
  __compar[2] = sub_100002B5C;
  __compar[3] = &unk_1000042A0;
  __compar[4] = v5;
  qsort_b(v7, Count, 8uLL, __compar);
  fwrite("key\tbytes\n", 0xAuLL, 1uLL, __stderrp);
  uint64_t v9 = Count - 1;
  if (Count >= 1)
  {
    if (v9 >= 4) {
      uint64_t v9 = 4;
    }
    int v10 = v9 + 1;
    uint64_t v11 = v7;
    do
    {
      uint64_t v12 = sub_100002BB0((const __CFString *)v5[*v11]);
      if (v12)
      {
        __darwin_ct_rune_t v13 = v12;
        __darwin_ct_rune_t v14 = __stderrp;
        CStringPtr = CFStringGetCStringPtr((CFStringRef)v3[*v11], 0x8000100u);
        fprintf(v14, "%s\t%zu\n", CStringPtr, v13);
      }
      ++v11;
      --v10;
    }
    while (v10);
  }
  free(v3);
  free(v5);
  free(v7);
  CFRelease(properties);
}

void sub_100002720(__CFString *a1, __CFString *a2)
{
  values = a2;
  keys = a1;
  unsigned int valuePtr = 0;
  if (byte_100008011 == 1)
  {
    CFDictionaryRef v2 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (!v2) {
      sub_100003064();
    }
    CFDictionaryRef v3 = v2;
    CFDataRef Data = CFPropertyListCreateData(kCFAllocatorDefault, v2, kCFPropertyListXMLFormat_v1_0, 0, 0);
    if (!Data) {
      sub_100003080();
    }
    CFDataRef v5 = Data;
    BytePtr = CFDataGetBytePtr(Data);
    size_t Length = CFDataGetLength(v5);
    fwrite(BytePtr, 1uLL, Length, __stdoutp);
    CFRelease(v3);
    CFRelease(v5);
    return;
  }
  CFIndex v10 = CFStringGetLength(a1);
  CFIndex v11 = CFStringGetMaximumSizeForEncoding(v10, 0x8000100u) + 1;
  uint64_t v12 = (char *)malloc_type_malloc(v11, 0xFECDAE7BuLL);
  if (!v12 || (__darwin_ct_rune_t v13 = v12, !CFStringGetCString(a1, v12, v11, 0x8000100u)))
  {
    warnx("Unable to convert property name to C string");
    __darwin_ct_rune_t v13 = "<UNPRINTABLE>";
  }
  CFTypeID v14 = CFGetTypeID(a2);
  if (v14 == CFBooleanGetTypeID())
  {
    unsigned int v15 = 0;
    if (CFBooleanGetValue((CFBooleanRef)a2)) {
      __darwin_ct_rune_t v16 = "true";
    }
    else {
      __darwin_ct_rune_t v16 = "false";
    }
    goto LABEL_33;
  }
  if (v14 == CFNumberGetTypeID())
  {
    CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt32Type, &valuePtr);
    if (valuePtr == -1)
    {
      unsigned int v17 = "-1";
    }
    else
    {
      if (valuePtr > 0x3E7 || (byte_100008010 & 1) != 0) {
        unsigned int v17 = "0x%x";
      }
      else {
        unsigned int v17 = "%d";
      }
      uint64_t v30 = valuePtr;
    }
    __darwin_ct_rune_t v16 = v34;
    __sprintf_chk(v34, 0, 0xAuLL, v17, v30);
    unsigned int v15 = 0;
    goto LABEL_33;
  }
  if (v14 == CFStringGetTypeID())
  {
    CFIndex v18 = CFStringGetLength(a2);
    CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(v18, 0x8000100u);
    unsigned int v15 = (char *)malloc_type_malloc(MaximumSizeForEncoding + 2, 0xEE68A485uLL);
    if (v15 && CFStringGetCString(a2, v15, MaximumSizeForEncoding + 1, 0x8000100u))
    {
      __darwin_ct_rune_t v16 = v15;
    }
    else
    {
      warnx("Unable to convert value to C string");
      __darwin_ct_rune_t v16 = "<UNPRINTABLE>";
    }
    goto LABEL_33;
  }
  if (v14 != CFDataGetTypeID())
  {
    unsigned int v15 = 0;
    __darwin_ct_rune_t v16 = "<INVALID>";
LABEL_33:
    printf("%s\t%s\n", v13, v16);
LABEL_34:
    if (!v12) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  CFIndex v20 = CFDataGetLength((CFDataRef)a2);
  if (!v20)
  {
    unsigned int v15 = 0;
    __darwin_ct_rune_t v16 = (char *)&unk_1000035FF;
    goto LABEL_33;
  }
  uint64_t v21 = v20;
  unsigned int v15 = (char *)malloc_type_malloc(3 * v20 + 3, 0x8C7815FFuLL);
  if (!v15) {
    goto LABEL_34;
  }
  v22 = CFDataGetBytePtr((CFDataRef)a2);
  if (byte_100008010 == 1)
  {
    strcpy(v15, "0x");
    uint64_t v23 = 2;
  }
  else
  {
    uint64_t v23 = 0;
  }
  if (v21 >= 1)
  {
    while (1)
    {
      unsigned int v25 = *v22++;
      uint64_t v24 = v25;
      if (byte_100008010 == 1) {
        break;
      }
      if ((char)v24 < 0) {
        __uint32_t v27 = __maskrune(v24, 0x40000uLL);
      }
      else {
        __uint32_t v27 = _DefaultRuneLocale.__runetype[v24] & 0x40000;
      }
      v28 = &v15[v23];
      if (!v27 || (char)v24 == 37)
      {
        int v26 = sprintf(v28, "%%%02x");
        goto LABEL_50;
      }
      char *v28 = v24;
      uint64_t v29 = 1;
LABEL_51:
      v23 += v29;
      if (!--v21) {
        goto LABEL_52;
      }
    }
    int v26 = sprintf(&v15[v23], "%02x");
LABEL_50:
    uint64_t v29 = v26;
    goto LABEL_51;
  }
LABEL_52:
  v15[v23] = 0;
  printf("%s\t%s\n", v13, v15);
  free(v15);
  unsigned int v15 = 0;
  if (v12) {
LABEL_35:
  }
    free(v12);
LABEL_36:
  if (v15) {
    free(v15);
  }
}

uint64_t sub_100002B5C(uint64_t a1, void *a2, void *a3)
{
  int v5 = sub_100002BB0(*(const __CFString **)(*(void *)(a1 + 32) + 8 * *a3));
  return v5 - sub_100002BB0(*(const __CFString **)(*(void *)(a1 + 32) + 8 * *a2));
}

uint64_t sub_100002BB0(const __CFString *a1)
{
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 == CFStringGetTypeID())
  {
    return CFStringGetLength(a1);
  }
  else if (v2 == CFDataGetTypeID())
  {
    return CFDataGetLength((CFDataRef)a1);
  }
  else
  {
    return 8 * (v2 == CFNumberGetTypeID());
  }
}

void sub_100002C40(const __CFString *property, uint64_t a2, mach_error_t *a3)
{
  kern_return_t v5;
  mach_error_t v6;
  CFTypeID v7;
  const char *CStringPtr;
  CFIndex Length;
  CFIndex v10;
  char *v11;
  const char *v12;
  char *v13;

  int v5 = IORegistryEntrySetCFProperty(dword_10000800C, @"IONVRAM-DELETE-PROPERTY", property);
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = CFGetTypeID(property);
    if (v7 != CFStringGetTypeID()) {
      sub_10000309C();
    }
    CStringPtr = CFStringGetCStringPtr(property, 0x8000100u);
    if (CStringPtr)
    {
      uint64_t v12 = CStringPtr;
      CFIndex v11 = 0;
    }
    else
    {
      size_t Length = CFStringGetLength(property);
      CFIndex v10 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
      CFIndex v11 = (char *)malloc_type_malloc(v10, 0x4F92C1D3uLL);
      if (v11 && CFStringGetCString(property, v11, v10, 0x8000100u))
      {
        uint64_t v12 = v11;
      }
      else
      {
        warnx("Unable to convert property name to C string");
        uint64_t v12 = "<UNPRINTABLE>";
      }
    }
    __darwin_ct_rune_t v13 = mach_error_string(v6);
    warnx("Error clearing firmware variable %s: %s", v12, v13);
    if (v11) {
      free(v11);
    }
    if (a3) {
      *a3 = v6;
    }
  }
}

void sub_100002D70()
{
}

void sub_100002D8C(const char *a1)
{
  CFTypeID v2 = mach_error_string(-536870160);
  errx(1, "Error getting variable - '%s': %s", a1, v2);
}

void sub_100002DC4()
{
}

void sub_100002DE0()
{
}

void sub_100002DFC()
{
}

void sub_100002E18()
{
}

void sub_100002E34(mach_error_t a1)
{
  v1 = mach_error_string(a1);
  errx(1, "Error getting the firmware variables: %s", v1);
}

void sub_100002E5C()
{
}

void sub_100002E80()
{
}

void sub_100002EA8(const char *a1)
{
  CFTypeID v2 = __error();
  CFDictionaryRef v3 = strerror(*v2);
  errx(1, "Could not open %s: %s", a1, v3);
}

void sub_100002EE0(const char *a1)
{
  CFTypeID v2 = __error();
  CFDictionaryRef v3 = strerror(*v2);
  errx(1, "Could not fstat %s: %s", a1, v3);
}

void sub_100002F18()
{
}

void sub_100002F34()
{
}

void sub_100002F50()
{
}

void sub_100002F6C()
{
}

void sub_100002F88()
{
}

void sub_100002FA4(const char *a1)
{
  CFTypeID v2 = __error();
  CFDictionaryRef v3 = strerror(*v2);
  errx(1, "Could not read %s: %s", a1, v3);
}

void sub_100002FDC()
{
}

void sub_100003004()
{
}

void sub_100003020(mach_error_t a1)
{
  v1 = mach_error_string(a1);
  errx(1, "Error getting the IOMainPort: %s", v1);
}

void sub_100003048()
{
}

void sub_100003064()
{
}

void sub_100003080()
{
}

void sub_10000309C()
{
  __assert_rtn("ClearOFVariable", "nvram.c", 1158, "CFGetTypeID(key) == CFStringGetTypeID()");
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

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return _CFDataCreateMutableCopy(allocator, capacity, theData);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
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

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithStream(allocator, stream, streamLength, options, format, error);
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

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
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

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMainPort(bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return ___sprintf_chk(a1, a2, a3, a4);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return ___toupper(a1);
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

int close(int a1)
{
  return _close(a1);
}

void err(int a1, const char *a2, ...)
{
}

void errx(int a1, const char *a2, ...)
{
}

void exit(int a1)
{
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

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getc(FILE *a1)
{
  return _getc(a1);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return _strcpy(__dst, __src);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

void warnx(const char *a1, ...)
{
}