uint64_t sub_1000016D4(char *__s2, char *a2, char *a3, size_t a4, char **a5)
{
  uint64_t v10;
  char *v11;
  uint64_t result;

  if (!strncmp("/dev/", __s2, 5uLL)) {
    v10 = 5;
  }
  else {
    v10 = 0;
  }
  v11 = &__s2[v10];
  if (!strncmp(&__s2[v10], "disk", 4uLL))
  {
    result = snprintf(a2, a4, "%s%s", "/dev/", v11);
    if (a3) {
      result = snprintf(a3, a4, "%sr%s");
    }
    goto LABEL_14;
  }
  if (!strncmp(v11, "rdisk", 5uLL))
  {
    result = snprintf(a2, a4, "%s%s", "/dev/", v11 + 1);
    if (a3) {
      result = snprintf(a3, a4, "%s%s");
    }
LABEL_14:
    if (!a5) {
      return result;
    }
    a2 += 5;
    goto LABEL_16;
  }
  result = strlcpy(a2, __s2, a4);
  if (a3) {
    result = strlcpy(a3, __s2, a4);
  }
  if (a5) {
LABEL_16:
  }
    *a5 = a2;
  return result;
}

uint64_t start()
{
  kern_return_t ParentEntry;
  CFBooleanRef v37;
  CFBooleanRef v38;
  int v39;
  int v40;
  __int16 v41;
  CFStringRef v42;
  CFStringRef v43;
  CFTypeID v44;
  CFMutableDictionaryRef v45;
  __int16 v46;
  CFStringRef v47;
  CFStringRef v48;
  CFURLRef v49;
  CFURLRef v50;
  CFDataRef v51;
  CFDataRef v52;
  CFTypeID v53;
  CFStringEncoding SystemEncoding;
  CFStringRef v55;
  CFStringRef v56;
  CFStringEncoding v57;
  const char *CStringPtr;
  CFStringEncoding v59;
  int v60;
  uint64_t result;
  char *v62;
  int v63;
  char *v64;
  char *v65;
  int Value;
  CFMutableDictionaryRef properties;
  io_registry_entry_t parent;
  int v69[4];
  uint64_t v70;
  uint64_t v71;
  stat v72;
  int v73[2];
  _OWORD v74[2];
  char *__endptr[2];
  _OWORD v76[63];
  _DWORD v77[256];
  char v78[1024];
  statfs __b;
  long long v80;
  _OWORD v81[16];
  long long v82;
  long long v83;
  uint64_t v84;
  char *__s1[2];
  _OWORD v86[19];
  int v87;
  uint64_t v88;

  int v0 = __chkstk_darwin();
  v2 = v1;
  int v3 = v0;
  v4.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v4.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  v74[0] = v4;
  v74[1] = v4;
  *(void *)v73 = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v72.st_blksize = v4;
  *(timespec *)v72.st_qspare = v4;
  v72.st_birthtimespec = v4;
  *(timespec *)&v72.st_size = v4;
  v72.st_mtimespec = v4;
  v72.st_ctimespec = v4;
  *(timespec *)&v72.uid_t st_uid = v4;
  v72.st_atimespec = v4;
  *(timespec *)&v72.st_dev = v4;
  memset(&__b, 170, sizeof(__b));
  memset(v78, 170, sizeof(v78));
  memset(v77, 170, sizeof(v77));
  __strlcpy_chk();
  __strlcpy_chk();
  sub_100002C64(0, (int *)v74);
  sub_100002F10(0, v73);
  v80 = 0u;
  memset(v81, 0, sizeof(v81));
  v82 = 0u;
  v83 = 0u;
  v84 = 0;
  v87 = 0;
  memset(v86, 0, sizeof(v86));
  *(_OWORD *)__s1 = 0u;
  v88 = -1;
  v70 = 0;
  v71 = 0;
  err_set_exit((void (__cdecl *)(int))sub_100002658);
  int v5 = 0;
  v64 = 0;
  v65 = 0;
  int v6 = 0;
  int v7 = 0;
  int v8 = 0;
  v63 = 0;
  v62 = 0;
  while (2)
  {
    while (1)
    {
      int v9 = getopt(v3, v2, ":cCF:g:M:o:P:rRnSs:u:E:T:");
      if (v9 <= 98) {
        break;
      }
      switch(v9)
      {
        case 'g':
          v11 = optarg;
          __endptr[0] = (char *)0xAAAAAAAAAAAAAAAALL;
          int gr_gid = strtol(optarg, __endptr, 0);
          if (*__endptr[0])
          {
            v13 = getgrnam(v11);
            if (!v13)
            {
              HIDWORD(v88) = -1;
              sub_10000324C();
            }
            int gr_gid = v13->gr_gid;
          }
          HIDWORD(v88) = gr_gid;
          if (gr_gid == -1) {
            sub_10000324C();
          }
          return result;
        case 'h':
        case 'i':
        case 'j':
        case 'k':
        case 'l':
        case 'm':
        case 'p':
        case 'q':
        case 't':
          continue;
        case 'n':
          v73[1] |= 4u;
          break;
        case 'o':
          if (sub_100002FAC(optarg, (uint64_t (*)(const char *, uint64_t))sub_100002C64, (uint64_t)v74, (uint64_t (*)(const char *, uint64_t))sub_100002F10, (uint64_t)v73))
          {
            errx(64, "unrecognized option '%s'");
          }
          return result;
        case 'r':
          v63 = 1;
          break;
        case 's':
          v62 = optarg;
          break;
        case 'u':
          v14 = optarg;
          __endptr[0] = (char *)0xAAAAAAAAAAAAAAAALL;
          int pw_uid = strtol(optarg, __endptr, 0);
          if (*__endptr[0])
          {
            v16 = getpwnam(v14);
            if (!v16)
            {
              LODWORD(v88) = -1;
              sub_10000327C();
            }
            int pw_uid = v16->pw_uid;
          }
          LODWORD(v88) = pw_uid;
          if (pw_uid == -1) {
            sub_10000327C();
          }
          return result;
        default:
          if (v9 == 99) {
            int v8 = 1;
          }
          break;
      }
    }
    switch(v9)
    {
      case '?':
        sub_1000032AC();
      case '@':
      case 'A':
      case 'B':
      case 'D':
      case 'G':
      case 'H':
      case 'I':
      case 'J':
      case 'K':
      case 'L':
      case 'N':
      case 'O':
      case 'Q':
        continue;
      case 'C':
        goto LABEL_31;
      case 'E':
        v10 = optarg;
        int v6 = 4;
        if (strcasecmp(optarg, "generic"))
        {
          int v6 = 5;
          if (strcasecmp(v10, "supplemental"))
          {
            int v6 = 6;
            if (strcasecmp(v10, "pdi_nonce"))
            {
              int v6 = 8;
              if (strcasecmp(v10, "mobile_asset")) {
                errx(64, "invalid auth environment '%s'");
              }
            }
          }
        }
        continue;
      case 'F':
        sub_100002670(optarg, (char *)&v86[8] + 12, 0x80uLL);
LABEL_31:
        int v7 = 1;
        continue;
      case 'M':
        v64 = sub_1000029F0(optarg, &v70);
        continue;
      case 'P':
        v65 = sub_1000029F0(optarg, &v71);
        continue;
      case 'R':
        v73[1] |= 2u;
        continue;
      case 'S':
        v73[1] |= 8u;
        continue;
      case 'T':
        v17 = optarg;
        int v5 = 1735681910;
        if (strcasecmp(optarg, "generic"))
        {
          int v5 = 1937334626;
          if (strcasecmp(v17, "brain")) {
            errx(64, "invalid cryptex type '%s'");
          }
        }
        continue;
      default:
        if (v9 != -1)
        {
          if (v9 == 58) {
            sub_1000032DC();
          }
          continue;
        }
        if (v3 - optind != 2) {
          sub_100003220(v3 - optind);
        }
        int v18 = v73[0];
        if (v7 && v8 | v73[0] & 0x10000) {
          sub_1000030A0();
        }
        if ((v65 != 0) != (v64 != 0)) {
          sub_1000030BC();
        }
        if (v65 && !v71 || v64 && !v70) {
          sub_1000030D8();
        }
        if (v6 && !v65) {
          sub_1000030F4();
        }
        if (v5 && !v65) {
          sub_100003110();
        }
        v19 = (char **)&v2[optind];
        if ((v73[0] & 0x10000) == 0)
        {
          if (v65)
          {
            *(void *)((char *)&v86[16] + 12) = v65;
            *(void *)((char *)&v86[17] + 4) = v71;
            *(void *)((char *)&v86[17] + 12) = v64;
            *(void *)((char *)&v86[18] + 4) = v70;
            HIDWORD(v86[18]) = v5;
            v87 = v6;
          }
          if (v7)
          {
            __int16 v20 = 4;
            goto LABEL_61;
          }
          if (v8)
          {
            if (v63) {
              __int16 v20 = 7;
            }
            else {
              __int16 v20 = 5;
            }
LABEL_61:
            LOWORD(v86[0]) = v20;
            sub_100002670(*v19, (char *)v86 + 12, 0x80uLL);
          }
          else if (v62)
          {
            if (v65) {
              v41 = 3;
            }
            else {
              v41 = 2;
            }
            LOWORD(v86[0]) = v41;
            if (fstatat(-2, *v19, &v72, 512)) {
              sub_1000031F8((const char **)v19);
            }
            if ((v72.st_mode & 0xF000) == 0x6000)
            {
              if (!sub_100002B3C(*v19, (char *)v77, (_DWORD *)v86 + 2)) {
                __s1[0] = (char *)v77;
              }
            }
            else
            {
              DWORD2(v86[0]) = v72.st_dev;
            }
            __strlcpy_chk();
          }
          else
          {
            if (v65) {
              v46 = 8;
            }
            else {
              v46 = 1;
            }
            LOWORD(v86[0]) = v46;
            if (!sub_100002B3C(*v19, (char *)v77, (_DWORD *)v86 + 2)) {
              __s1[0] = (char *)v77;
            }
          }
        }
        if ((v73[0] & 0x8000000) != 0)
        {
          if ((unint64_t)__strlcpy_chk() >= 0x400) {
            err(1, "realpath [2] %s", v78);
          }
        }
        else if (!realpath_DARWIN_EXTSN(v19[1], v78))
        {
          err(66, "%s");
        }
        if ((v18 & 0x10000) != 0)
        {
          if (v8)
          {
            sub_100002670(*v19, (char *)v77, 0x400uLL);
            DWORD2(v82) = 2;
            uint64_t v21 = 5;
            if (v77[0] ^ 0x7665642F | LOBYTE(v77[1]) ^ 0x2F) {
              uint64_t v21 = 0;
            }
            CFDictionaryRef v22 = IOBSDNameMatching(kIOMainPortDefault, 0, (const char *)v77 + v21);
            io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v22);
            if (!MatchingService)
            {
              int v28 = 2;
              goto LABEL_179;
            }
            io_registry_entry_t v24 = MatchingService;
            *(void *)((char *)v76 + 13) = 0xAAAAAAAAAAAAAAAALL;
            *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
            *(_OWORD *)__endptr = v25;
            v76[0] = v25;
            if (IOObjectConformsTo(MatchingService, "AppleAPFSVolume"))
            {
              CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v24, @"UUID", kCFAllocatorDefault, 0);
              if (CFProperty)
              {
                CFStringRef v27 = CFProperty;
                if (CFStringGetCString(CFProperty, (char *)__endptr, 37, 0x8000100u))
                {
                  int v28 = uuid_parse((const char *)__endptr, (unsigned __int8 *)v81);
                  CFRelease(v27);
                  IOObjectRelease(v24);
                  if (!v28)
                  {
                    if (fsctl(v78, 0x81384A06uLL, &v80, 0)) {
                      sub_100003174();
                    }
                    goto LABEL_157;
                  }
LABEL_179:
                  errc(66, v28, "switch crypto context");
                }
              }
              int v28 = 2;
            }
            else
            {
              int v28 = 22;
            }
            IOObjectRelease(v24);
            goto LABEL_179;
          }
        }
        else
        {
          if (*(unsigned __int16 *)v78 == 47 || stat(v78, &v72)) {
            memset(&v72, 0, sizeof(v72));
          }
          if (v88 == -1)
          {
            if ((v73[0] & 0x200000) != 0) {
              uid_t st_uid = 99;
            }
            else {
              uid_t st_uid = v72.st_uid;
            }
            LODWORD(v88) = st_uid;
          }
          if (HIDWORD(v88) == -1)
          {
            if ((v73[0] & 0x200000) != 0) {
              gid_t st_gid = 99;
            }
            else {
              gid_t st_gid = v72.st_gid;
            }
            HIDWORD(v88) = st_gid;
          }
        }
        *(_OWORD *)v69 = xmmword_100003F50;
        __s1[1] = *(char **)v73;
        v31 = __s1[0];
        if (!__s1[0]
          || (strncmp(__s1[0], "/dev/", 5uLL) ? (uint64_t v32 = 0) : (uint64_t v32 = 5),
              CFDictionaryRef v33 = IOBSDNameMatching(kIOMainPortDefault, 0, &v31[v32]),
              (io_service_t v34 = IOServiceGetMatchingService(kIOMainPortDefault, v33)) == 0))
        {
          v40 = 0;
          v39 = -1;
          if ((v18 & 0x10000) == 0) {
            goto LABEL_149;
          }
          goto LABEL_150;
        }
        io_registry_entry_t v35 = v34;
        Value = 0;
        while (2)
        {
          parent = -1431655766;
          ParentEntry = IORegistryEntryGetParentEntry(v35, "IOService", &parent);
          IOObjectRelease(v35);
          if (ParentEntry)
          {
LABEL_103:
            v39 = -1;
            v40 = Value;
            if ((v18 & 0x10000) == 0) {
              goto LABEL_149;
            }
            goto LABEL_150;
          }
          if (IOObjectConformsTo(parent, "AppleAPFSContainerScheme"))
          {
            v37 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(parent, @"APFSComposited", kCFAllocatorDefault, 0);
            if (v37)
            {
              v38 = v37;
              Value = CFBooleanGetValue(v37);
              CFRelease(v38);
            }
          }
          if (!IOObjectConformsTo(parent, "IOHDIXHDDriveOutKernel"))
          {
            if (IOObjectConformsTo(parent, "AppleDiskImageDevice"))
            {
              properties = 0;
              if (IORegistryEntryCreateCFProperties(parent, &properties, kCFAllocatorDefault, 0)) {
                goto LABEL_123;
              }
              if (CFDictionaryGetValue(properties, @"sparse-backend") != kCFBooleanTrue)
              {
                v39 = -1;
LABEL_146:
                v45 = properties;
                goto LABEL_147;
              }
              v47 = (const __CFString *)CFDictionaryGetValue(properties, @"DiskImageURL");
              if (!v47) {
                sub_1000031B4((const char **)v19);
              }
              v48 = v47;
              bzero(__endptr, 0x400uLL);
              v49 = CFURLCreateWithString(kCFAllocatorDefault, v48, 0);
              if (!v49)
              {
                v39 = -1;
                goto LABEL_146;
              }
              v50 = v49;
              if (!CFURLGetFileSystemRepresentation(v49, 0, (UInt8 *)__endptr, 1024)) {
                sub_1000031DC();
              }
              CFRelease(v50);
              v39 = open((const char *)__endptr, 0, 0);
              v69[2] = v39;
              if ((v39 & 0x80000000) == 0) {
                goto LABEL_146;
              }
LABEL_184:
              err(66, "cannot open backing store '%s' for '%s'");
            }
            io_registry_entry_t v35 = parent;
            if (!parent) {
              goto LABEL_103;
            }
            continue;
          }
          break;
        }
        __endptr[0] = 0;
        if (IORegistryEntryCreateCFProperties(parent, (CFMutableDictionaryRef *)__endptr, kCFAllocatorDefault, 0))
        {
LABEL_123:
          v39 = -1;
          goto LABEL_148;
        }
        v42 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)__endptr[0], @"image-type");
        if (!v42
          || (v43 = v42, v44 = CFGetTypeID(v42), v44 != CFStringGetTypeID())
          || CFStringCompare(v43, @"sparse disk image", 0)
          && CFStringCompare(v43, @"sparse bundle disk image", 0))
        {
          v39 = -1;
          goto LABEL_121;
        }
        v51 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)__endptr[0], @"image-path");
        if (!v51
          || (v52 = v51, v53 = CFGetTypeID(v51), v53 != CFDataGetTypeID())
          || (SystemEncoding = CFStringGetSystemEncoding(),
              (v55 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, v52, SystemEncoding)) == 0))
        {
          sub_1000031B4((const char **)v19);
        }
        v56 = v55;
        v57 = CFStringGetSystemEncoding();
        CStringPtr = CFStringGetCStringPtr(v56, v57);
        if (!CStringPtr)
        {
          v59 = CFStringGetSystemEncoding();
          CStringPtr = byte_100008210;
          CFStringGetCString(v56, byte_100008210, 4096, v59);
        }
        v60 = open(CStringPtr, 0, 0);
        v69[2] = v60;
        if (v60 < 0) {
          goto LABEL_184;
        }
        v39 = v60;
        CFRelease(v56);
LABEL_121:
        v45 = (CFMutableDictionaryRef)__endptr[0];
LABEL_147:
        CFRelease(v45);
LABEL_148:
        v40 = Value;
        IOObjectRelease(parent);
        if ((v18 & 0x10000) != 0)
        {
LABEL_150:
          __s1[0] = 0;
          goto LABEL_151;
        }
LABEL_149:
        if (*(unsigned __int16 *)v78 == 47) {
          goto LABEL_150;
        }
LABEL_151:
        if (mount("apfs", v78, v73[0], __s1)) {
          sub_100003190();
        }
        if ((v39 & 0x80000000) == 0)
        {
          if (fsctl(v78, 0x80106807uLL, v69, 0) && *__error() != 37)
          {
            warn("cannot propagate backing store information to %s", v78);
            if (v40) {
              goto LABEL_163;
            }
          }
          else
          {
            if (!v40) {
              goto LABEL_156;
            }
LABEL_163:
            warnx("APFS Fusion is not guaranteed to work reliably on top of sparse images");
          }
LABEL_156:
          close(v69[2]);
        }
LABEL_157:
        if (v73[0] & 0x10001) == 0 && !statfs(v78, &__b) && (__b.f_flags) {
          sub_10000312C((uint64_t)__s1);
        }
        return 0;
    }
  }
}

void sub_100002658(int a1)
{
  if (a1 == 64) {
    warnx("[-o options] [-u UID] [-g GID] [-n] [-c [-r] | [-C|-F <tier2 device>]] [-s snapshot] [-P <im4p file> -M <im4m file> [-T <generic | brain>] [-E <generic | supplemental | pdi_nonce | mobile_asset]] <volume | device> <directory>");
  }
}

uint64_t sub_100002670(char *a1, char *a2, size_t a3)
{
  if (!strncasecmp(a1, "ROLE=", 5uLL))
  {
    int v7 = a1 + 5;
    if (strcasecmp(v7, "SYSTEM")
      && strcasecmp(v7, "USER")
      && strcasecmp(v7, "RECOVERY")
      && strcasecmp(v7, "VM")
      && strcasecmp(v7, "PREBOOT")
      && strcasecmp(v7, "INSTALLER")
      && strcasecmp(v7, "DATA")
      && strcasecmp(v7, "BASEBAND")
      && strcasecmp(v7, "XART")
      && strcasecmp(v7, "INTERNAL")
      && strcasecmp(v7, "BACKUP")
      && strcasecmp(v7, "UPDATE")
      && strcasecmp(v7, "HARDWARE")
      && strcasecmp(v7, "SIDECAR")
      && strcasecmp(v7, "ENTERPRISE")
      && strcasecmp(v7, "IDIAGS")
      && strcasecmp(v7, "OVERPROVISION"))
    {
      errx(64, "Unknown role: %s", v7);
    }
    memset(&__b, 170, sizeof(__b));
    if (statfs("/", &__b)) {
      errx(66, "statfs has failed, err %i");
    }
    if (APFSVolumeRoleFind()) {
      errx(66, "Failed to find a volume with role %s on disk %s, status: %x");
    }
    if (CFArrayGetCount((CFArrayRef)0xAAAAAAAAAAAAAAAALL) <= 0) {
      errx(66, "No volumes with role %s were found on disk %s");
    }
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)0xAAAAAAAAAAAAAAAALL, 0);
    uint64_t result = CFStringGetCString(ValueAtIndex, a2, a3, 0x8000100u);
    if (!result) {
      sub_10000330C();
    }
  }
  else
  {
    return sub_1000016D4(a1, a2, 0, a3, 0);
  }
  return result;
}

char *sub_1000029F0(const char *a1, void *a2)
{
  int v3 = open(a1, 0);
  if (v3 == -1) {
    err(66, "cannot open %s");
  }
  int v4 = v3;
  v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v13.st_blksize = v5;
  *(timespec *)v13.st_qspare = v5;
  v13.st_birthtimespec = v5;
  *(timespec *)&v13.unint64_t st_size = v5;
  v13.st_mtimespec = v5;
  v13.st_ctimespec = v5;
  *(timespec *)&v13.uid_t st_uid = v5;
  v13.st_atimespec = v5;
  *(timespec *)&v13.st_dev = v5;
  if (fstat(v3, &v13) == -1) {
    err(66, "cannot stat %s");
  }
  if (v13.st_size > 0x100000uLL) {
    errx(66, "file %s is too large");
  }
  int v6 = (char *)malloc_type_malloc(v13.st_size, 0x4DFD6DE3uLL);
  if (!v6) {
    errx(66, "failed to allocate memory for %s");
  }
  int v7 = v6;
  unint64_t st_size = v13.st_size;
  if (!v13.st_size)
  {
    uint64_t v9 = 0;
    if (!a2) {
      return v7;
    }
    goto LABEL_14;
  }
  uint64_t v9 = 0;
  do
  {
    if (st_size >= 0x10000) {
      size_t v10 = 0x10000;
    }
    else {
      size_t v10 = st_size;
    }
    ssize_t v11 = read(v4, &v7[v9], v10);
    if (!v11) {
      break;
    }
    if (v11 == -1) {
      err(66, "cannot read %s into memory");
    }
    v9 += v11;
    st_size -= v11;
  }
  while (st_size);
  if (a2) {
LABEL_14:
  }
    *a2 = v9;
  return v7;
}

BOOL sub_100002B3C(char *a1, char *a2, _DWORD *a3)
{
  int v18 = (statfs *)0xAAAAAAAAAAAAAAAALL;
  sub_100002670(a1, a2, 0x400uLL);
  int v5 = getmntinfo(&v18, 2);
  if (v5 < 1) {
    return 0;
  }
  unsigned int v6 = v5;
  int v7 = v18;
  f_mntfromname = v18->f_mntfromname;
  uint64_t v9 = strrchr(v18->f_mntfromname, 64);
  if (v9) {
    size_t v10 = v9 + 1;
  }
  else {
    size_t v10 = f_mntfromname;
  }
  unint64_t v11 = 0;
  if (strcmp(v10, a2))
  {
    unint64_t v12 = v6;
    stat v13 = v7[1].f_mntfromname;
    while (v12 - 1 != v11)
    {
      v14 = strrchr(v13, 64);
      if (v14) {
        v15 = v14 + 1;
      }
      else {
        v15 = v13;
      }
      v13 += 2168;
      ++v11;
      if (!strcmp(v15, a2))
      {
        BOOL v16 = v11 < v12;
        if (a3) {
          goto LABEL_16;
        }
        return v16;
      }
    }
    return 0;
  }
  BOOL v16 = 1;
  if (a3)
  {
LABEL_16:
    if (strcmp(v7[v11].f_fstypename, "apfs")) {
      sub_100003328();
    }
    *a3 = v7[v11].f_fsid.val[0];
  }
  return v16;
}

char *sub_100002C64(char *a1, int *a2)
{
  getmnt_silent = 1;
  if (!a1)
  {
    *(_OWORD *)a2 = 0u;
    *((_OWORD *)a2 + 1) = 0u;
    a2[1] = -1;
    return 0;
  }
  int v12 = *a2;
  unsigned int v4 = *((unsigned __int16 *)a2 + 4);
  int v5 = (v4 >> 6) & 8 | v4 & 5 | (v4 >> 8) & 0x10;
  int v6 = v4 << 18;
  if ((v4 & 0x1000) != 0) {
    int v7 = 32;
  }
  else {
    int v7 = 64;
  }
  unsigned int v11 = v7 & (v6 >> 31) | v5;
  if (!getmntopts()) {
    return "";
  }
  *a2 = v12;
  *((_WORD *)a2 + 4) = a2[2] & 0xCDFA | v11 & 1 | v11 & 4 | (((v11 & 0x30) != 0) << 12) | (((v11 & 0x60) != 0) << 13) | (((v11 >> 3) & 1) << 9);
  if ((v11 & 2) != 0)
  {
    int v10 = getmntoptnum();
    a2[1] = v10;
    if (v10 == -1) {
      int v8 = "checkpoint";
    }
    else {
      int v8 = 0;
    }
  }
  else
  {
    int v8 = 0;
  }
  freemntopts();
  uint64_t result = sub_100002DCC((const char **)&off_100004260, a1, v8);
  if (!result) {
    return 0;
  }
  return result;
}

char *sub_100002DCC(const char **a1, char *__s1, const char *a3)
{
  unsigned int v4 = __s1;
  int v6 = strdup(__s1);
  if (v6)
  {
    int v7 = v6;
    __lasts = (char *)0xAAAAAAAAAAAAAAAALL;
    int v8 = strtok_r(v6, ",", &__lasts);
    if (v8)
    {
      uint64_t v9 = v8;
      while (1)
      {
        int v10 = strncmp(v9, "no", 2uLL);
        unsigned int v11 = &v9[2 * (v10 == 0)];
        int v12 = strchr(v11, 61);
        if (v12) {
          *int v12 = 0;
        }
        stat v13 = *a1;
        if (!*a1) {
          break;
        }
        v14 = a1 + 3;
        while (strcasecmp(v13, v11))
        {
          v15 = *v14;
          v14 += 3;
          stat v13 = v15;
          if (!v15) {
            goto LABEL_15;
          }
        }
        if (a3 && !strcasecmp(v11, a3)) {
          break;
        }
        uint64_t v9 = strtok_r(0, ",", &__lasts);
        if (!v9) {
          goto LABEL_14;
        }
      }
LABEL_15:
      uint64_t v16 = -2;
      if (v10) {
        uint64_t v16 = 0;
      }
      unsigned int v4 = &v11[(void)v4 + v16 - (void)v7];
    }
    else
    {
LABEL_14:
      unsigned int v4 = 0;
    }
    free(v7);
  }
  return v4;
}

char *sub_100002F10(char *a1, void *a2)
{
  getmnt_silent = 1;
  if (!a1)
  {
    *a2 = 0;
    return 0;
  }
  int v5 = *(_DWORD *)a2;
  if (getmntopts())
  {
    *(_DWORD *)a2 = v5;
    freemntopts();
    uint64_t result = sub_100002DCC((const char **)&off_100008000, a1, 0);
    if (result) {
      return result;
    }
    return 0;
  }
  return "";
}

const char *sub_100002FAC(const char *a1, uint64_t (*a2)(const char *, uint64_t), uint64_t a3, uint64_t (*a4)(const char *, uint64_t), uint64_t a5)
{
  size_t v10 = strlen(a1);
  size_t v11 = 0;
  size_t v12 = 0;
  do
  {
    if (v11 != v10 && v11 <= v12)
    {
      stat v13 = (char *)a2(&a1[v11], a3);
      size_t v11 = v10;
      if (v13)
      {
        size_t v11 = v13 - a1;
        if (v13 - a1 < v12)
        {
          v14 = strchr(v13, 44);
          if (v14) {
            size_t v11 = v14 - a1;
          }
          else {
            size_t v11 = v10;
          }
        }
      }
    }
    if (v12 != v10 && v12 <= v11)
    {
      v15 = (char *)a4(&a1[v12], a5);
      size_t v12 = v10;
      if (v15)
      {
        size_t v12 = v15 - a1;
        if (v15 - a1 < v11)
        {
          uint64_t v16 = strchr(v15, 44);
          if (v16) {
            size_t v12 = v16 - a1;
          }
          else {
            size_t v12 = v10;
          }
        }
      }
    }
  }
  while (v11 != v12);
  if (v11 == v10) {
    return 0;
  }
  else {
    return &a1[v11];
  }
}

void sub_1000030A0()
{
}

void sub_1000030BC()
{
}

void sub_1000030D8()
{
}

void sub_1000030F4()
{
}

void sub_100003110()
{
}

void sub_10000312C(uint64_t a1)
{
  if (*(_WORD *)(a1 + 16) == 2) {
    v1 = "snapshot ";
  }
  else {
    v1 = "";
  }
  warnx("%simplicitly mounted readonly", v1);
}

void sub_100003174()
{
}

void sub_100003190()
{
  __error();
  int v0 = sysexit_np();
  err(v0, "volume could not be mounted");
}

void sub_1000031B4(const char **a1)
{
}

void sub_1000031DC()
{
}

void sub_1000031F8(const char **a1)
{
}

void sub_100003220(int a1)
{
  if (a1 > 2) {
    errx(64, "unexpected argument");
  }
  errx(64, "missing argument");
}

void sub_10000324C()
{
}

void sub_10000327C()
{
}

void sub_1000032AC()
{
}

void sub_1000032DC()
{
}

void sub_10000330C()
{
}

void sub_100003328()
{
}

uint64_t APFSVolumeRoleFind()
{
  return _APFSVolumeRoleFind();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
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

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return _CFStringGetSystemEncoding();
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return _CFURLCreateWithString(allocator, URLString, baseURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return _CFURLGetFileSystemRepresentation(url, resolveAgainstBase, buffer, maxBufLen);
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return _IOBSDNameMatching(mainPort, options, bsdName);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
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

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

void err(int a1, const char *a2, ...)
{
}

void err_set_exit(void (__cdecl *a1)(int))
{
}

void errc(int a1, int a2, const char *a3, ...)
{
}

void errx(int a1, const char *a2, ...)
{
}

void free(void *a1)
{
}

uint64_t freemntopts()
{
  return _freemntopts();
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return _fstatat(a1, a2, a3, a4);
}

group *__cdecl getgrnam(const char *a1)
{
  return _getgrnam(a1);
}

int getmntinfo(statfs **a1, int a2)
{
  return _getmntinfo(a1, a2);
}

uint64_t getmntoptnum()
{
  return _getmntoptnum();
}

uint64_t getmntopts()
{
  return _getmntopts();
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

int mount(const char *a1, const char *a2, int a3, void *a4)
{
  return _mount(a1, a2, a3, a4);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return _strncasecmp(a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return _strtok_r(__str, __sep, __lasts);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

uint64_t sysexit_np()
{
  return _sysexit_np();
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return _uuid_parse(in, uu);
}

void warn(const char *a1, ...)
{
}

void warnx(const char *a1, ...)
{
}