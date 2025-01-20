uint64_t *sub_1000018C0()
{
  if (!qword_1000244E8 && !sub_100001904()) {
    return 0;
  }
  if (sub_100001970()) {
    return &qword_1000244F0;
  }
  return 0;
}

uint64_t sub_100001904()
{
  if (qword_1000244E8)
  {
    rewind((FILE *)qword_1000244E8);
LABEL_4:
    dword_100024520 = 0;
    return 1;
  }
  qword_1000244E8 = (uint64_t)fopen("/etc/fstab", "r");
  if (qword_1000244E8) {
    goto LABEL_4;
  }
  v1 = __error();
  sub_100001D2C(*v1);
  return 0;
}

uint64_t sub_100001970()
{
  uint64_t result = (uint64_t)fgets(byte_100024524, 1024, (FILE *)qword_1000244E8);
  __stringp = (char *)result;
  if (!result) {
    return result;
  }
  v1 = &OBJC_INSTANCE_METHODS_FSTaskMessageOperations;
  v2 = byte_100024524;
  v3 = &OBJC_INSTANCE_METHODS_FSTaskMessageOperations;
  v4 = &OBJC_INSTANCE_METHODS_FSTaskMessageOperations;
  v5 = &OBJC_INSTANCE_METHODS_FSTaskMessageOperations;
LABEL_3:
  ++dword_100024520;
  do
  {
    v6 = strsep(&__stringp, " \t\n");
    if (!v6)
    {
      v1[158] = 0;
LABEL_33:
      uint64_t result = (uint64_t)fgets(v2, 1024, (FILE *)qword_1000244E8);
      __stringp = (char *)result;
      if (!result) {
        return result;
      }
      goto LABEL_3;
    }
  }
  while (!*v6);
  v1[158] = (__objc2_meth_list)v6;
  if (*v6 == 35) {
    goto LABEL_33;
  }
  do
    v7 = strsep(&__stringp, " \t\n");
  while (v7 && !*v7);
  v3[159] = (__objc2_meth_list)v7;
  do
    v8 = strsep(&__stringp, " \t\n");
  while (v8 && !*v8);
  v4[160] = (__objc2_meth_list)v8;
  do
  {
    v9 = strsep(&__stringp, " \t\n");
    if (!v9)
    {
      qword_100024508 = 0;
      sub_100001D2C(79);
      goto LABEL_33;
    }
  }
  while (!*v9);
  qword_100024508 = (uint64_t)v9;
  sub_100001E58((unsigned __int8 *)qword_1000244F0);
  sub_100001E58((unsigned __int8 *)qword_1000244F8);
  qword_100024518 = 0;
  while (1)
  {
    v10 = strsep(&__stringp, " \t\n");
    if (!v10) {
      break;
    }
    if (*v10)
    {
      LODWORD(qword_100024518) = atoi(v10);
      while (1)
      {
        v11 = strsep(&__stringp, " \t\n");
        if (!v11) {
          goto LABEL_22;
        }
        if (*v11)
        {
          HIDWORD(qword_100024518) = atoi(v11);
          goto LABEL_22;
        }
      }
    }
  }
LABEL_22:
  v12 = v2;
  v13 = v4;
  v14 = v3;
  v15 = v5;
  qword_100024510 = (uint64_t)"??";
  __strlcpy_chk();
  __stringp = &v20;
  v16 = strsep(&__stringp, ",");
  if (!v16) {
    return 1;
  }
  v17 = v16;
  while (1)
  {
    if (strlen(v17) != 2) {
      goto LABEL_30;
    }
    if (!strcmp(v17, "rw"))
    {
      v18 = "rw";
      goto LABEL_41;
    }
    if (!strcmp(v17, "rq"))
    {
      v18 = "rq";
      goto LABEL_41;
    }
    if (!strcmp(v17, "ro"))
    {
      v18 = "ro";
      goto LABEL_41;
    }
    if (!strcmp(v17, "sw")) {
      break;
    }
    if (!strcmp(v17, "xx"))
    {
      v5 = v15;
      v15[162] = (__objc2_meth_list)"xx";
      v3 = v14;
      v4 = v13;
      v2 = v12;
      v1 = &OBJC_INSTANCE_METHODS_FSTaskMessageOperations;
      goto LABEL_33;
    }
LABEL_30:
    v17 = strsep(&__stringp, ",");
    if (!v17) {
      return 1;
    }
  }
  v18 = "sw";
LABEL_41:
  v15[162] = (__objc2_meth_list)v18;
  return 1;
}

uint64_t *sub_100001C84(const char *a1)
{
  if (sub_100001904())
  {
    v2 = &qword_1000244F0;
    while (sub_100001970())
    {
      if (!strcmp((const char *)qword_1000244F0, a1)) {
        return v2;
      }
    }
  }
  return 0;
}

uint64_t *sub_100001CD8(const char *a1)
{
  if (sub_100001904())
  {
    v2 = &qword_1000244F0;
    while (sub_100001970())
    {
      if (!strcmp((const char *)qword_1000244F8, a1)) {
        return v2;
      }
    }
  }
  return 0;
}

ssize_t sub_100001D2C(int a1)
{
  write(2, "fstab: ", 7uLL);
  write(2, "/etc/fstab", 0xAuLL);
  write(2, ":", 1uLL);
  snprintf(__str, 0x1EuLL, "%d: ", dword_100024520);
  size_t v2 = strlen(__str);
  write(2, __str, v2);
  v3 = strerror(a1);
  size_t v4 = strlen(v3);
  write(2, v3, v4);
  return write(2, "\n", 1uLL);
}

uint64_t sub_100001E28()
{
  uint64_t result = qword_1000244E8;
  if (qword_1000244E8)
  {
    uint64_t result = fclose((FILE *)qword_1000244E8);
    qword_1000244E8 = 0;
  }
  return result;
}

unsigned __int8 *sub_100001E58(unsigned __int8 *result)
{
  for (i = result; ; ++i)
  {
    int v2 = *result;
    if (v2 != 92) {
      break;
    }
    int v2 = result[1];
    if (v2 == 92)
    {
      ++result;
    }
    else if (v2 == 48 && result[2] == 52)
    {
      if (result[3] == 48)
      {
        result += 3;
        LOBYTE(v2) = 32;
      }
      else
      {
        LOBYTE(v2) = 92;
      }
    }
    else
    {
      LOBYTE(v2) = 92;
    }
LABEL_13:
    unsigned char *i = v2;
    ++result;
  }
  if (*result) {
    goto LABEL_13;
  }
  unsigned char *i = 0;
  return result;
}

uint64_t *sub_100001ED4()
{
  if (!qword_100024928 && !sub_100001F18()) {
    return 0;
  }
  if (sub_100001FF0()) {
    return &qword_100024930;
  }
  return 0;
}

BOOL sub_100001F18()
{
  if (qword_100024928)
  {
    rewind((FILE *)qword_100024928);
    return 1;
  }
  else
  {
    qword_100024928 = (uint64_t)fopen("/var/db/volinfo.database", "r");
    return qword_100024928 != 0;
  }
}

uint64_t *sub_100001F6C(const char *a1)
{
  if (sub_100001F18())
  {
    int v2 = &qword_100024930;
    while (sub_100001FF0())
    {
      if (!strcmp((const char *)qword_100024930, a1)) {
        return v2;
      }
    }
  }
  return 0;
}

uint64_t sub_100001FC0()
{
  uint64_t result = qword_100024928;
  if (qword_100024928)
  {
    uint64_t result = fclose((FILE *)qword_100024928);
    qword_100024928 = 0;
  }
  return result;
}

char *sub_100001FF0()
{
  uint64_t result = fgets(byte_100024940, 1024, (FILE *)qword_100024928);
  __stringp = result;
  if (result)
  {
    while (1)
    {
      v1 = strsep(&__stringp, ":");
      if (v1)
      {
        if (*v1)
        {
          qword_100024930 = (uint64_t)v1;
          int v2 = strsep(&__stringp, "\n");
          if (v2)
          {
            if (*v2)
            {
              dword_100024938 = strtol(v2, &__stringp, 16);
              if (!*__stringp) {
                break;
              }
            }
          }
        }
      }
      uint64_t result = fgets(byte_100024940, 1024, (FILE *)qword_100024928);
      __stringp = result;
      if (!result) {
        return result;
      }
    }
    return (char *)1;
  }
  return result;
}

BOOL sub_1000020D4(const char *a1)
{
  int v2 = getfsstat(0, 0, 2);
  int v3 = v2;
  if (v2 >= 1 && (size_t v4 = (statfs *)malloc_type_malloc(2168 * v2, 0x100004087E0324AuLL)) != 0)
  {
    v5 = v4;
    int v3 = getfsstat(v4, 2168 * v3, 2);
    if (v3 < 1)
    {
      LODWORD(v6) = 0;
    }
    else
    {
      uint64_t v6 = 0;
      f_fstypename = v5->f_fstypename;
      while (1)
      {
        if (!strcmp(f_fstypename, "autofs"))
        {
          size_t v8 = strlen(f_fstypename + 16);
          if (!strncmp(f_fstypename + 16, a1, v8)) {
            break;
          }
        }
        ++v6;
        f_fstypename += 2168;
        if (v3 == v6)
        {
          LODWORD(v6) = v3;
          break;
        }
      }
    }
    free(v5);
  }
  else
  {
    LODWORD(v6) = 0;
  }
  return (int)v6 < v3;
}

uint64_t sub_1000021E0(const std::__fs::filesystem::path *a1, mode_t a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  __from = 0;
  asprintf((char **)&__from, "%s.XXXXXX", (const char *)a1);
  if (!__from) {
    return 0xFFFFFFFFLL;
  }
  if (mkdtemp((char *)__from))
  {
    uint64_t v5 = chmod((const char *)__from, a2);
    if (v5 || (rename(__from, a1, v4), uint64_t v5 = v6, v6)) {
      rmdir((const char *)__from);
    }
  }
  else
  {
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  free(__from);
  return v5;
}

void sub_100002280()
{
  uint64_t v0 = qword_100024D40;
  if (!qword_100024D40)
  {
    qword_100024D48 = os_transaction_create();
    uint64_t v0 = qword_100024D40;
  }
  qword_100024D40 = v0 + 1;
}

void sub_1000022C8()
{
  if (!--qword_100024D40)
  {
    os_release((void *)qword_100024D48);
    qword_100024D48 = 0;
  }
}

uint64_t sub_100002308()
{
  return qword_100024D48;
}

const void *sub_100002314(const __CFArray *a1, const void *a2)
{
  v7.length = CFArrayGetCount(a1);
  v7.location = 0;
  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(a1, v7, a2);
  if (FirstIndexOfValue == -1) {
    return 0;
  }

  return CFArrayGetValueAtIndex(a1, FirstIndexOfValue);
}

void sub_100002380(const __CFArray *a1, const __CFArray *a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    unint64_t v5 = Count + 1;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, v5 - 2);
      if (!sub_100007C60(a2, ValueAtIndex)) {
        CFArrayRemoveValueAtIndex(a1, v5 - 2);
      }
      --v5;
    }
    while (v5 > 1);
  }
}

CFBundleRef sub_1000023F4(CFURLRef bundleURL, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  CFBundleRef result = CFBundleCreate(kCFAllocatorDefault, bundleURL);
  if (result)
  {
    size_t v8 = result;
    _CFBundleSetStringsFilesShared();
    CFStringRef v9 = CFBundleCopyLocalizedString(v8, a2, a3, a4);
    CFRelease(v8);
    return (CFBundleRef)v9;
  }
  return result;
}

CFURLRef sub_10000246C(const __CFURL *a1, const __CFString *a2)
{
  CFURLRef v3 = CFURLCreateWithFileSystemPathRelativeToBase(kCFAllocatorDefault, a2, kCFURLPOSIXPathStyle, 0, 0);
  if (!v3) {
    return 0;
  }
  CFURLRef v4 = v3;
  CFStringRef PathComponent = CFURLCopyLastPathComponent(v3);
  if (PathComponent)
  {
    CFStringRef v6 = PathComponent;
    CFURLRef v7 = CFURLCreateCopyDeletingLastPathComponent(kCFAllocatorDefault, v4);
    if (v7)
    {
      CFURLRef v8 = v7;
      CFStringRef v9 = CFURLCopyFileSystemPath(v7, kCFURLPOSIXPathStyle);
      if (v9)
      {
        CFStringRef v10 = v9;
        CFURLRef v11 = CFBundleCopyResourceURLInDirectory(a1, v6, 0, v9);
        CFRelease(v10);
      }
      else
      {
        CFURLRef v11 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      CFURLRef v11 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    CFURLRef v11 = 0;
  }
  CFRelease(v4);
  return v11;
}

__CFData *sub_100002550(const __CFAllocator *a1, const __CFString *a2)
{
  Mutable = CFDataCreateMutable(a1, 0);
  if (Mutable)
  {
    CFIndex Length = CFStringGetLength(a2);
    if (Length < 2)
    {
      CFIndex v6 = 0;
    }
    else
    {
      CFIndex v5 = 1;
      while (1)
      {
        CFIndex v6 = v5 - 1;
        UInt8 bytes = 0;
        unsigned int CharacterAtIndex = CFStringGetCharacterAtIndex(a2, v5 - 1);
        unsigned int v8 = CFStringGetCharacterAtIndex(a2, v5);
        if (CharacterAtIndex > 0xFF) {
          break;
        }
        if ((_DefaultRuneLocale.__runetype[CharacterAtIndex] & 0x10000) == 0) {
          break;
        }
        __darwin_ct_rune_t v9 = v8;
        if (v8 > 0xFF || (_DefaultRuneLocale.__runetype[v8] & 0x10000) == 0) {
          break;
        }
        unsigned __int16 v10 = __tolower(CharacterAtIndex) - 48;
        __int16 v11 = __tolower(v9);
        __int16 v12 = v11 - 48;
        if (v10 <= 9u) {
          char v13 = 16 * v10;
        }
        else {
          char v13 = 16 * v10 - 112;
        }
        if ((v12 & 0xFFFEu) > 9) {
          LOBYTE(v12) = v11 - 87;
        }
        UInt8 bytes = v13 | v12;
        CFDataAppendBytes(Mutable, &bytes, 1);
        v5 += 2;
        if (v5 >= Length)
        {
          CFIndex v6 = v5 - 1;
          break;
        }
      }
    }
    if (v6 < Length)
    {
      do
      {
        unsigned int v14 = CFStringGetCharacterAtIndex(a2, v6);
        if (v14 > 0x7F)
        {
          if (!__maskrune(v14, 0x4000uLL))
          {
LABEL_23:
            CFDataSetLength(Mutable, 0);
            break;
          }
        }
        else if ((_DefaultRuneLocale.__runetype[v14] & 0x4000) == 0)
        {
          goto LABEL_23;
        }
        ++v6;
      }
      while (Length != v6);
    }
    if (!CFDataGetLength(Mutable))
    {
      CFRelease(Mutable);
      return 0;
    }
  }
  return Mutable;
}

CFTypeRef sub_100002704(uint64_t a1, const __CFString *a2)
{
  CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(kCFAllocatorDefault, a2, 0x8000100u, 0);
  if (!ExternalRepresentation) {
    return 0;
  }
  CFDataRef v3 = ExternalRepresentation;
  CFPropertyListRef v4 = CFPropertyListCreateWithData(kCFAllocatorDefault, ExternalRepresentation, 0, 0, 0);
  if (v4)
  {
    CFIndex v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFDictionaryGetTypeID()) {
      CFTypeRef v7 = CFRetain(v5);
    }
    else {
      CFTypeRef v7 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    CFTypeRef v7 = 0;
  }
  CFRelease(v3);
  return v7;
}

const void *sub_1000027BC(const __CFDictionary *a1)
{
  CFIndex Count = CFDictionaryGetCount(a1);
  if (!Count) {
    return 0;
  }
  CFDataRef v3 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
  if (!v3) {
    return 0;
  }
  CFPropertyListRef v4 = v3;
  CFDictionaryGetKeysAndValues(a1, 0, v3);
  CFIndex v5 = *v4;
  free(v4);
  return v5;
}

UInt8 *sub_10000282C(char *cStr, va_list a2)
{
  if (!cStr) {
    return 0;
  }
  CFStringRef v3 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  if (!v3) {
    return 0;
  }
  CFStringRef v4 = v3;
  CFStringRef v5 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, v3, a2);
  if (v5)
  {
    CFStringRef v6 = v5;
    CFTypeRef v7 = sub_100007F70(v5);
    CFRelease(v6);
  }
  else
  {
    CFTypeRef v7 = 0;
  }
  CFRelease(v4);
  return v7;
}

BOOL sub_1000028C8(const __CFString *a1, UInt8 *a2, uint64_t a3)
{
  CFIndex v5 = a3 - 1;
  CFIndex usedBufLen = a3 - 1;
  v9.length = CFStringGetLength(a1);
  v9.location = 0;
  CFStringGetBytes(a1, v9, 0x8000100u, 0, 0, a2, v5, &usedBufLen);
  CFIndex v6 = usedBufLen;
  a2[usedBufLen] = 0;
  return v6 != 0;
}

void sub_100002948(__CFString *a1, CFIndex a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_100002974(__CFString *a1, CFIndex a2, const __CFString *a3, va_list a4)
{
  CFStringRef v6 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, a3, a4);
  if (v6)
  {
    CFStringRef v7 = v6;
    CFStringInsert(a1, a2, v6);
    CFRelease(v7);
  }
}

void sub_1000029F0(__CFString *a1, const __CFString *a2, CFIndex a3, CFIndex a4)
{
  if (CFStringGetLength(a1) < a3)
  {
    CFStringPad(a1, a2, a3, a4);
  }
}

CFUUIDRef sub_100002A60(const __CFAllocator *a1, CFUUIDRef uuid, const __CFData *a3)
{
  memset(&c, 0, sizeof(c));
  *(_OWORD *)md = 0u;
  long long v14 = 0u;
  CFUUIDBytes data = CFUUIDGetUUIDBytes(uuid);
  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, &data, 0x10u);
  BytePtr = CFDataGetBytePtr(a3);
  CC_LONG Length = CFDataGetLength(a3);
  CC_SHA256_Update(&c, BytePtr, Length);
  CC_SHA256_Final(md, &c);
  uint64_t v7 = 0;
  uint64_t byte7 = 0;
  uint64_t byte13 = 0;
  do
  {
    *((unsigned char *)&byte7 + (v7 & 0xF)) ^= md[v7];
    ++v7;
  }
  while (v7 != 32);
  return CFUUIDCreateWithBytes(a1, byte7, BYTE1(byte7), BYTE2(byte7), BYTE3(byte7), BYTE4(byte7), BYTE5(byte7), BYTE6(byte7) & 0xF | 0x40u, HIBYTE(byte7), byte13 & 0x3F | 0x80, BYTE1(byte13), BYTE2(byte13), BYTE3(byte13), BYTE4(byte13), BYTE5(byte13), BYTE6(byte13), HIBYTE(byte13));
}

CFUUIDRef sub_100002BB8(const __CFAllocator *a1, CFStringRef theString)
{
  uint64_t Length = CFStringGetLength(theString);
  if (Length)
  {
    for (unint64_t i = 0; Length != i; ++i)
    {
      unsigned int CharacterAtIndex = CFStringGetCharacterAtIndex(theString, i);
      if (i > 0x23)
      {
        if (CharacterAtIndex > 0x7F)
        {
          if (!__maskrune(CharacterAtIndex, 0x4000uLL)) {
            return 0;
          }
        }
        else if ((_DefaultRuneLocale.__runetype[CharacterAtIndex] & 0x4000) == 0)
        {
          return 0;
        }
      }
      else if (i <= 0x17 && ((1 << i) & 0x842100) != 0)
      {
        if (CharacterAtIndex != 45) {
          return 0;
        }
      }
      else if (CharacterAtIndex > 0xFF || (_DefaultRuneLocale.__runetype[CharacterAtIndex] & 0x10000) == 0)
      {
        return 0;
      }
    }
  }

  return CFUUIDCreateFromString(a1, theString);
}

CFStringRef sub_100002CD0(const __CFURL *a1, CFURLPathStyle a2)
{
  CFStringRef v3 = CFURLCopyFileSystemPath(a1, a2);
  if (v3)
  {
    CFStringRef PathComponent = CFURLCopyLastPathComponent(a1);
    if (PathComponent)
    {
      CFStringRef v5 = PathComponent;
      CFAllocatorRef v6 = CFGetAllocator(a1);
      CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(v6, 0, v3);
      if (MutableCopy)
      {
        unsigned int v8 = MutableCopy;
        CFIndex Length = CFStringGetLength(v3);
        CFIndex v10 = CFStringGetLength(v5);
        CFStringInsert(v8, Length - v10, @"r");
        CFRelease(v3);
        CFStringRef v3 = v8;
      }
      CFRelease(v5);
    }
  }
  return v3;
}

uint64_t sub_100002D70(io_registry_entry_t a1, const char *a2, char *a3)
{
  kern_return_t LocationInPlane;
  size_t v9;
  char *v10;
  const char *v11;
  size_t v12;
  io_registry_entry_t parent;
  io_name_t location;
  char name[136];

  uint64_t v6 = 3758097090;
  uint64_t Path = IORegistryEntryGetPath(a1, a2, a3);
  if (Path == -536870206)
  {
    parent = 0;
    uint64_t Path = IORegistryEntryGetParentEntry(a1, a2, &parent);
    if (!Path)
    {
      uint64_t Path = sub_100002D70(parent, a2, a3);
      if (Path) {
        goto LABEL_12;
      }
      memset(name, 0, 128);
      uint64_t Path = IORegistryEntryGetNameInPlane(a1, a2, name);
      if (Path) {
        goto LABEL_12;
      }
      memset(location, 0, sizeof(location));
      LocationInPlane = IORegistryEntryGetLocationInPlane(a1, a2, location);
      CFRange v9 = strlen(a3);
      if (LocationInPlane)
      {
        CFIndex v10 = name;
        if (v9 + strlen(name) + 1 <= 0x3FF)
        {
          __int16 v11 = "/";
LABEL_10:
          strlcat(a3, v11, 0x400uLL);
          strlcat(a3, v10, 0x400uLL);
          uint64_t v6 = 0;
        }
      }
      else
      {
        __int16 v12 = strlen(name);
        if (v9 + v12 + strlen(location) + 2 <= 0x3FF)
        {
          strlcat(a3, "/", 0x400uLL);
          strlcat(a3, name, 0x400uLL);
          CFIndex v10 = location;
          __int16 v11 = "@";
          goto LABEL_10;
        }
      }
      uint64_t Path = v6;
LABEL_12:
      IOObjectRelease(parent);
    }
  }
  return Path;
}

__CFDictionary *sub_100002F40(const __CFAllocator *a1, const void *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, const void *a7, const void *a8)
{
  Mutable = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v16 = Mutable;
  if (Mutable)
  {
    CFDictionarySetValue(Mutable, @"DACallbackSession", a2);
    sub_100007E7C(v16, @"DACallbackAddress", a3);
    sub_100007E7C(v16, @"DACallbackContext", a4);
    sub_100007E7C(v16, @"DACallbackKind", a5);
    sub_100007E7C(v16, @"DACallbackOrder", a6);
    if (a7) {
      CFDictionarySetValue(v16, @"DACallbackMatch", a7);
    }
    if (a8) {
      CFDictionarySetValue(v16, @"DACallbackWatch", a8);
    }
  }
  return v16;
}

CFMutableDictionaryRef sub_100003048(const __CFAllocator *a1, CFDictionaryRef theDict)
{
  return CFDictionaryCreateMutableCopy(a1, 0, theDict);
}

CFNumberRef sub_100003054(const __CFDictionary *a1)
{
  return sub_100007E44(a1, @"DACallbackAddress");
}

const void *sub_100003060(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DACallbackArgument0");
}

const void *sub_10000306C(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DACallbackArgument1");
}

CFNumberRef sub_100003078(const __CFDictionary *a1)
{
  return sub_100007E44(a1, @"DACallbackContext");
}

const void *sub_100003084(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DACallbackDisk");
}

CFNumberRef sub_100003090(const __CFDictionary *a1)
{
  return sub_100007E44(a1, @"DACallbackKind");
}

const void *sub_1000030B0(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DACallbackMatch");
}

CFNumberRef sub_1000030BC(const __CFDictionary *a1)
{
  return sub_100007E44(a1, @"DACallbackOrder");
}

const void *sub_1000030DC(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DACallbackSession");
}

double sub_1000030E8(const __CFDictionary *a1)
{
  CFDateRef Value = (const __CFDate *)CFDictionaryGetValue(a1, @"DACallbackTime");
  if (!Value) {
    return 0.0;
  }

  return CFDateGetAbsoluteTime(Value);
}

const void *sub_100003128(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DACallbackWatch");
}

void sub_100003134(__CFDictionary *a1, void *value)
{
  if (value) {
    CFDictionarySetValue(a1, @"DACallbackArgument0", value);
  }
  else {
    CFDictionaryRemoveValue(a1, @"DACallbackArgument0");
  }
}

void sub_10000314C(__CFDictionary *a1, void *value)
{
  if (value) {
    CFDictionarySetValue(a1, @"DACallbackArgument1", value);
  }
  else {
    CFDictionaryRemoveValue(a1, @"DACallbackArgument1");
  }
}

void sub_100003164(__CFDictionary *a1, void *value)
{
  if (value) {
    CFDictionarySetValue(a1, @"DACallbackDisk", value);
  }
  else {
    CFDictionaryRemoveValue(a1, @"DACallbackDisk");
  }
}

void sub_10000317C(__CFDictionary *a1, void *value)
{
  if (value) {
    CFDictionarySetValue(a1, @"DACallbackMatch", value);
  }
  else {
    CFDictionaryRemoveValue(a1, @"DACallbackMatch");
  }
}

void sub_100003194(__CFDictionary *a1, void *value)
{
  if (value) {
    CFDictionarySetValue(a1, @"DACallbackSession", value);
  }
  else {
    CFDictionaryRemoveValue(a1, @"DACallbackSession");
  }
}

void sub_1000031AC(__CFDictionary *a1, CFAbsoluteTime a2)
{
  CFDateRef v3 = CFDateCreate(kCFAllocatorDefault, a2);
  if (v3)
  {
    CFDateRef v4 = v3;
    CFDictionarySetValue(a1, @"DACallbackTime", v3);
    CFRelease(v4);
  }
}

uint64_t sub_100003218()
{
  pthread_mutex_lock(&stru_1000243C8);
  if (dword_100024D50)
  {
LABEL_2:
    sub_100012CBC();
    qword_100024D58 = dispatch_mach_create_f();
    dispatch_mach_connect();
    goto LABEL_3;
  }
  if (!mach_port_allocate(mach_task_self_, 1u, (mach_port_name_t *)&dword_100024D50)
    && !mach_port_insert_right(mach_task_self_, dword_100024D50, dword_100024D50, 0x14u))
  {
    integer_t port_info = 1;
    mach_port_set_attributes(mach_task_self_, dword_100024D50, 1, &port_info, 1u);
  }
  if (dword_100024D50)
  {
    v1 = sub_100012CBC();
    int v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x14uLL, 0, v1);
    if (!v2)
    {
      mach_port_mod_refs(mach_task_self_, dword_100024D50, 1u, -1);
      dword_100024D50 = 0;
      goto LABEL_3;
    }
    CFDateRef v3 = v2;
    dispatch_source_set_event_handler(v2, &stru_100020C80);
    dispatch_resume(v3);
    if (!dword_100024D50) {
      goto LABEL_3;
    }
    goto LABEL_2;
  }
LABEL_3:
  pthread_mutex_unlock(&stru_1000243C8);
  return qword_100024D58;
}

void sub_10000336C(id a1)
{
  v1 = dispatch_mach_msg_create();
  dispatch_mach_send();
  dispatch_release(v1);
}

void sub_1000033E0(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    int v14 = 0;
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
    pid_t v3 = waitpid(-1, &v14, 1);
    if (v3 >= 1)
    {
      for (pid_t i = v3; i > 0; pid_t i = waitpid(-1, &v14, 1))
      {
        pthread_mutex_lock(&stru_1000243C8);
        uint64_t v5 = qword_100024D60;
        if (qword_100024D60)
        {
          uint64_t v6 = 0;
          while (1)
          {
            uint64_t v7 = v5;
            if (*(_DWORD *)v5 != 1) {
              sub_10001A554();
            }
            if (*(_DWORD *)(v5 + 16) == i) {
              break;
            }
            uint64_t v5 = *(void *)(v5 + 8);
            uint64_t v6 = v7;
            if (!v5) {
              goto LABEL_27;
            }
          }
          if (v6) {
            unsigned int v8 = (uint64_t *)(v6 + 8);
          }
          else {
            unsigned int v8 = &qword_100024D60;
          }
          uint64_t *v8 = *(void *)(v5 + 8);
          pthread_mutex_unlock(&stru_1000243C8);
          if (*(_DWORD *)(v7 + 20) == -1)
          {
            Mutable = 0;
          }
          else
          {
            Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
            if (Mutable)
            {
              CFIndex v10 = (UInt8 *)malloc_type_malloc(0x200uLL, 0xCB0F112EuLL);
              if (v10)
              {
                __int16 v11 = v10;
                int v12 = read(*(_DWORD *)(v7 + 20), v10, 0x200uLL);
                if (v12 >= 1)
                {
                  do
                  {
                    CFDataAppendBytes(Mutable, v11, v12);
                    int v12 = read(*(_DWORD *)(v7 + 20), v11, 0x200uLL);
                  }
                  while (v12 > 0);
                }
                free(v11);
              }
            }
            close(*(_DWORD *)(v7 + 20));
          }
          if ((v14 & 0x7F) != 0) {
            int v13 = v14;
          }
          else {
            int v13 = (__int16)v14 >> 8;
          }
          int v14 = v13;
          (*(void (**)(void))(v7 + 24))();
          if (Mutable) {
            CFRelease(Mutable);
          }
          free((void *)v7);
          pthread_mutex_lock(&stru_1000243C8);
        }
LABEL_27:
        pthread_mutex_unlock(&stru_1000243C8);
      }
    }
    mach_msg_destroy(msg);
  }
}

void sub_1000035CC(const __CFURL *a1, char a2, uid_t a3, gid_t a4, int a5, void (*a6)(uint64_t, void, uint64_t), uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  v43 = &a9;
  size_t v17 = 8;
  do
  {
    v18 = v43++;
    v17 += 8;
  }
  while (*v18);
  v19 = (char **)malloc_type_malloc(v17, 0x10040436913F5uLL);
  if (!v19)
  {
    int v29 = 1;
    uint64_t v30 = 70;
    if (!a6) {
      return;
    }
    goto LABEL_42;
  }
  char v20 = v19;
  bzero(v19, v17);
  v21 = sub_100008040(a1);
  *char v20 = (char *)v21;
  if (v21)
  {
    int v42 = a5;
    v44 = &a10;
    uint64_t v22 = a9;
    if (a9)
    {
      v23 = (UInt8 **)(v20 + 1);
      while (1)
      {
        CFStringRef v24 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@", v22);
        if (v24)
        {
          CFStringRef v25 = v24;
          *v23 = sub_100007F70(v24);
          CFRelease(v25);
        }
        if (!*v23) {
          break;
        }
        v26 = v44++;
        uint64_t v22 = *v26;
        ++v23;
        if (!v22) {
          goto LABEL_11;
        }
      }
      uint64_t v30 = 70;
      int v29 = 1;
    }
    else
    {
LABEL_11:
      *(void *)v47 = -1;
      if (!dword_100024D50) {
        sub_10001A580();
      }
      if ((a2 & 1) != 0 && pipe(v47))
      {
        uint64_t v27 = 66;
        BOOL v28 = 1;
      }
      else
      {
        pthread_mutex_lock(&stru_1000243C8);
        pid_t v31 = fork();
        if (!v31)
        {
          posix_spawn_file_actions_t v45 = 0;
          posix_spawnattr_t v46 = 0;
          if (setgid(a4) == -1 || setuid(a3) == -1) {
            _exit(77);
          }
          if (v47[1] != -1)
          {
            dup2(v47[1], 1);
            close(v47[1]);
          }
          if (!posix_spawnattr_init(&v46))
          {
            if (!posix_spawn_file_actions_init(&v45))
            {
              if (!posix_spawnattr_setflags(&v46, 16448)
                && !posix_spawn_file_actions_addinherit_np(&v45, 1)
                && !posix_spawn_file_actions_addinherit_np(&v45, 2)
                && !posix_spawn_file_actions_addinherit_np(&v45, 0)
                && (v42 < 0 || !posix_spawn_file_actions_addinherit_np(&v45, v42)))
              {
                v40 = *v20;
                v41 = _NSGetEnviron();
                posix_spawn(0, v40, &v45, &v46, v20, *v41);
              }
              posix_spawn_file_actions_destroy(&v45);
            }
            posix_spawnattr_destroy(&v46);
          }
          _exit(71);
        }
        pid_t v32 = v31;
        if (a6)
        {
          if (v31 != -1)
          {
            v33 = malloc_type_malloc(0x28uLL, 0x10A00404821B814uLL);
            if (v33)
            {
              uint64_t v34 = (uint64_t)v33;
              *(_DWORD *)v33 = 1;
              v33[1] = qword_100024D60;
              *((_DWORD *)v33 + 4) = v32;
              int v35 = v47[0];
              if (v47[0] != -1) {
                int v35 = dup(v47[0]);
              }
              *(_DWORD *)(v34 + 20) = v35;
              *(void *)(v34 + 24) = a6;
              *(void *)(v34 + 32) = a7;
              qword_100024D60 = v34;
            }
          }
        }
        pthread_mutex_unlock(&stru_1000243C8);
        BOOL v28 = v32 == -1;
        if (v32 == -1) {
          uint64_t v27 = 71;
        }
        else {
          uint64_t v27 = 0;
        }
      }
      if (v47[0] != -1) {
        close(v47[0]);
      }
      if (v47[1] != -1) {
        close(v47[1]);
      }
      char v36 = !v28;
      if (!a6) {
        char v36 = 1;
      }
      if ((v36 & 1) == 0) {
        a6(v27, 0, a7);
      }
      int v29 = 0;
      uint64_t v30 = 0;
    }
    v37 = *v20;
    if (*v20)
    {
      v38 = v20 + 1;
      do
      {
        free(v37);
        v39 = *v38++;
        v37 = v39;
      }
      while (v39);
    }
  }
  else
  {
    int v29 = 1;
    uint64_t v30 = 65;
  }
  free(v20);
  if (a6)
  {
LABEL_42:
    if (v29) {
      a6(v30, 0, a7);
    }
  }
}

uint64_t sub_100003994(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  v8[0] = 0;
  int v11 = 0;
  long long v13 = 0u;
  v8[1] = a2;
  v8[2] = a3;
  uint64_t v12 = a4;
  int v9 = a1;
  BOOL v10 = a5 == 0;
  uint64_t v7 = sub_100003A54((unsigned int *)v8);
  id v5 = v7;
  AnalyticsSendEventLazy();

  return 0;
}

id sub_100003A54(unsigned int *a1)
{
  int v2 = objc_opt_new();
  pid_t v3 = +[NSNumber numberWithUnsignedInt:*a1];
  [v2 setObject:v3 forKeyedSubscript:@"operation_type"];

  CFStringRef v4 = (const __CFString *)*((void *)a1 + 1);
  if (v4)
  {
    if (CFStringHasSuffix(*((CFStringRef *)a1 + 1), @"_fskit"))
    {
      CFStringRef v5 = sub_100014918(v4);
      CFStringRef v4 = (const __CFString *)sub_100004344(v5);
      CFRelease(v5);
    }
    else
    {
      CFStringRef v4 = (const __CFString *)sub_100004344(v4);
    }
  }
  uint64_t v6 = +[NSNumber numberWithUnsignedInt:v4];
  [v2 setObject:v6 forKeyedSubscript:@"fs_type"];

  if (*a1 != 3
    && ((CFStringRef v7 = (const __CFString *)*((void *)a1 + 2)) == 0
      ? (uint64_t v8 = 0)
      : CFStringCompare(*((CFStringRef *)a1 + 2), @"UserFS", 1uLL) == kCFCompareEqualTo
      ? (uint64_t v8 = 2)
      : (uint64_t v8 = CFStringCompare(v7, @"FSKit", 1uLL) == kCFCompareEqualTo),
        +[NSNumber numberWithUnsignedInt:v8],
        int v9 = objc_claimAutoreleasedReturnValue(),
        [v2 setObject:v9 forKeyedSubscript:@"fs_implementation"],
        v9,
        *a1 == 4))
  {
LABEL_27:
    unsigned int v19 = a1[7];
    if ((v19 & 8) != 0) {
      int v20 = 2;
    }
    else {
      int v20 = (v19 >> 2) & 1;
    }
    if ((v19 & 0x20) != 0) {
      int v21 = 4;
    }
    else {
      int v21 = v20;
    }
    if ((v19 & 0x10) != 0) {
      int v22 = 3;
    }
    else {
      int v22 = v21;
    }
    if ((v19 & 2) != 0) {
      int v23 = 5;
    }
    else {
      int v23 = v22;
    }
    if ((v19 & 0x40) != 0) {
      unsigned int v24 = 6;
    }
    else {
      unsigned int v24 = v23;
    }
    if ((v19 & 0x80) != 0) {
      uint64_t v25 = 7;
    }
    else {
      uint64_t v25 = v24;
    }
    size_t v17 = +[NSNumber numberWithInt:v25];
    CFStringRef v18 = @"disk_state";
LABEL_54:
    [v2 setObject:v17 forKeyedSubscript:v18];
  }
  else
  {
    uint64_t v10 = a1[6];
    if (v10 >= 0xFFFFFFFC) {
      uint64_t v10 = *((unsigned int *)&unk_10001F340 + (int)v10 + 4);
    }
    int v11 = +[NSNumber numberWithInt:v10];
    [v2 setObject:v11 forKeyedSubscript:@"status_code"];

    int v12 = *a1;
    if (*a1 <= 5 && ((1 << v12) & 0x27) != 0)
    {
      long long v13 = +[NSNumber numberWithUnsignedLongLong:*((void *)a1 + 5) / 0xF4240uLL];
      [v2 setObject:v13 forKeyedSubscript:@"duration_ms"];

      int v12 = *a1;
    }
    if (v12 == 5 || v12 == 3)
    {
      unsigned int v14 = a1[13];
      if (v14 == -1)
      {
        v16 = @"n/a";
      }
      else
      {
        int v15 = csops();
        if (v15) {
          sub_100008B14("Unable to get signing information for pid %d: %d", v14, v15);
        }
        v16 = @"other";
      }
      [v2 setObject:v16 forKeyedSubscript:@"dissenter_name"];

      int v12 = *a1;
    }
    switch(v12)
    {
      case 0:
        size_t v17 = +[NSNumber numberWithInt:a1[7] & 1];
        CFStringRef v18 = @"volume_clean";
        goto LABEL_54;
      case 1:
        size_t v17 = +[NSNumber numberWithUnsignedLongLong:*((void *)a1 + 4)];
        CFStringRef v18 = @"volume_size";
        goto LABEL_54;
      case 4:
        goto LABEL_27;
      case 5:
        v26 = +[NSNumber numberWithBool:*((unsigned __int8 *)a1 + 48)];
        [v2 setObject:v26 forKeyedSubscript:@"unmount_forced"];

        if (*((unsigned char *)a1 + 56)) {
          unsigned int v27 = 1;
        }
        else {
          unsigned int v27 = 2;
        }
        if (a1[6]) {
          uint64_t v28 = v27;
        }
        else {
          uint64_t v28 = 0;
        }
        size_t v17 = +[NSNumber numberWithUnsignedInt:v28];
        CFStringRef v18 = @"approval_status";
        goto LABEL_54;
      default:
        break;
    }
  }

  return v2;
}

id sub_100003ED8(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t sub_100003EE0(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  long long v9 = 0u;
  v8[0] = 1;
  v8[1] = a2;
  v8[2] = a3;
  void v8[3] = a1;
  v8[4] = a5;
  v8[5] = a4;
  CFStringRef v7 = sub_100003A54((unsigned int *)v8);
  id v5 = v7;
  AnalyticsSendEventLazy();

  return 0;
}

id sub_100003FA0(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t sub_100003FA8(int a1, uint64_t a2, int a3, uint64_t a4)
{
  long long v8 = 0u;
  long long v9 = 0u;
  LODWORD(v8) = 2;
  CFStringRef v4 = @"kext";
  long long v10 = 0u;
  long long v11 = 0u;
  if (a3) {
    CFStringRef v4 = @"UserFS";
  }
  *((void *)&v8 + 1) = a2;
  *(void *)&long long v9 = v4;
  DWORD2(v9) = a1;
  *((void *)&v10 + 1) = a4;
  CFStringRef v7 = sub_100003A54((unsigned int *)&v8);
  id v5 = v7;
  AnalyticsSendEventLazy();

  return 0;
}

id sub_100004080(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t sub_100004088(int a1, uint64_t a2, int a3)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v6[0] = 3;
  v6[1] = a2;
  DWORD2(v7) = a1;
  DWORD1(v9) = a3;
  id v5 = sub_100003A54((unsigned int *)v6);
  id v3 = v5;
  AnalyticsSendEventLazy();

  return 0;
}

id sub_100004148(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t sub_100004150(uint64_t a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, char a9)
{
  long long v15 = 0u;
  long long v16 = 0u;
  v13[0] = 4;
  v13[1] = a1;
  long long v14 = a2;
  if (a9) {
    int v9 = 128;
  }
  else {
    int v9 = 0;
  }
  if (a4) {
    v9 |= 4u;
  }
  if (a5) {
    v9 |= 8u;
  }
  if (a6) {
    v9 |= 0x10u;
  }
  if (a7) {
    v9 |= 0x20u;
  }
  if (a8) {
    v9 |= 0x40u;
  }
  if (a3) {
    v9 |= 2u;
  }
  DWORD2(v14) = -1;
  HIDWORD(v14) = v9;
  int v12 = sub_100003A54((unsigned int *)v13);
  id v10 = v12;
  AnalyticsSendEventLazy();

  return 0;
}

id sub_100004268(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t sub_100004270(unsigned int a1, uint64_t a2, uint64_t a3, char a4, int a5, char a6, uint64_t a7)
{
  v10[4] = 0;
  long long v11 = 0u;
  v10[0] = 5;
  v10[1] = a2;
  v10[2] = a3;
  v10[3] = a1;
  v10[5] = a7;
  LOBYTE(v11) = a4;
  DWORD1(v11) = a5;
  BYTE8(v11) = a6;
  int v9 = sub_100003A54((unsigned int *)v10);
  id v7 = v9;
  AnalyticsSendEventLazy();

  return 0;
}

id sub_10000433C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t sub_100004344(const __CFString *a1)
{
  uint64_t v2 = 1;
  if (CFStringCompare(a1, @"MSDOS", 1uLL))
  {
    if (CFStringCompare(a1, @"EXFAT", 1uLL))
    {
      if (CFStringCompare(a1, @"APFS", 1uLL))
      {
        if (CFStringCompare(a1, @"HFS", 1uLL))
        {
          if (CFStringCompare(a1, @"NTFS", 1uLL)) {
            return 6;
          }
          else {
            return 5;
          }
        }
        else
        {
          return 4;
        }
      }
      else
      {
        return 3;
      }
    }
    else
    {
      return 2;
    }
  }
  return v2;
}

void sub_100004404(uint64_t a1)
{
}

void sub_100004430(uint64_t a1)
{
}

uint64_t sub_10000445C(uint64_t a1, const void *a2, const void *a3)
{
  CFDateRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), a2);
  if (Value == a3) {
    return 0;
  }
  if (!Value) {
    return -1;
  }
  if (!a3) {
    return 1;
  }
  if (CFEqual(Value, a3)) {
    return 0;
  }
  return -1;
}

uint64_t sub_1000044BC(CFAllocatorRef allocator, io_registry_entry_t entry)
{
  uint64_t valuePtr = 0;
  int v81 = 0;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v116 = 0u;
  CFMutableDictionaryRef properties = 0;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  *(_OWORD *)__s = 0u;
  long long v84 = 0u;
  io_iterator_t iterator = 0;
  CFAbsoluteTime Current = 0.0;
  if (IORegistryEntryCreateCFProperties(entry, &properties, allocator, 0)
    || (CFStringRef Value = (const __CFString *)CFDictionaryGetValue(properties, @"BSD Name")) == 0
    || !CFStringGetCString(Value, buffer, 128, 0x8000100u))
  {
    io_object_t v4 = 0;
    io_object_t v5 = 0;
    uint64_t v6 = 0;
LABEL_3:
    if (!sub_100002D70(entry, "IOService", __s))
    {
      if (v6) {
        id v7 = *(const char **)(v6 + 144);
      }
      else {
        id v7 = 0;
      }
      sub_100008B14("unable to create disk, id = %s.", v7);
    }
    if (v4) {
      IOObjectRelease(v4);
    }
    if (v5) {
      IOObjectRelease(v5);
    }
    if (v6) {
      CFRelease((CFTypeRef)v6);
    }
    if (properties) {
      CFRelease(properties);
    }
    return 0;
  }
  __strlcpy_chk();
  __strlcat_chk();
  uint64_t v6 = sub_1000052CC(allocator, __s);
  if (!v6) {
    goto LABEL_20;
  }
  size_t v9 = strlen(__s);
  CFURLRef v10 = CFURLCreateFromFileSystemRepresentation(allocator, (const UInt8 *)__s, v9, 0);
  *(void *)(v6 + 72) = v10;
  if (!v10) {
    goto LABEL_20;
  }
  *(void *)(v6 + 104) = strdup(__s);
  __strlcpy_chk();
  __strlcat_chk();
  __strlcat_chk();
  *(void *)(v6 + 112) = strdup(__s);
  IOObjectRetain(entry);
  *(_DWORD *)(v6 + 152) = entry;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAVolumeNetwork", kCFBooleanFalse);
  long long v11 = CFDictionaryGetValue(properties, @"Preferred Block Size");
  if (!v11) {
    goto LABEL_20;
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaBlockSize", v11);
  int v12 = CFDictionaryGetValue(properties, @"BSD Name");
  if (!v12) {
    goto LABEL_20;
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaBSDName", v12);
  CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(properties, @"BSD Major");
  if (!v13) {
    goto LABEL_20;
  }
  CFNumberRef v14 = v13;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaBSDMajor", v13);
  CFNumberGetValue(v14, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v15 = (const __CFNumber *)CFDictionaryGetValue(properties, @"BSD Minor");
  if (!v15) {
    goto LABEL_20;
  }
  CFNumberRef v16 = v15;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaBSDMinor", v15);
  CFNumberGetValue(v16, kCFNumberSInt32Type, &v81);
  *(_DWORD *)(v6 + 96) = v81 | (valuePtr << 24);
  CFNumberRef v17 = (const __CFNumber *)CFDictionaryGetValue(properties, @"BSD Unit");
  if (!v17) {
    goto LABEL_20;
  }
  CFNumberRef v18 = v17;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaBSDUnit", v17);
  CFNumberGetValue(v18, kCFNumberSInt32Type, (void *)(v6 + 128));
  unsigned int v19 = CFDictionaryGetValue(properties, @"Content");
  if (!v19) {
    goto LABEL_20;
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaContent", v19);
  int v20 = CFDictionaryGetValue(properties, @"Ejectable");
  if (!v20) {
    goto LABEL_20;
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaEjectable", v20);
  CFTypeRef v21 = IORegistryEntrySearchCFProperty(entry, "IOService", @"IOMediaIcon", allocator, 3u);
  if (!v21) {
    goto LABEL_20;
  }
  int v22 = v21;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaIcon", v21);
  CFRelease(v22);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaKind", @"IOMedia");
  int v23 = CFDictionaryGetValue(properties, @"Leaf");
  if (!v23) {
    goto LABEL_20;
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaLeaf", v23);
  if (IORegistryEntryGetName(entry, buffer)) {
    goto LABEL_20;
  }
  CFStringRef v25 = CFStringCreateWithCString(allocator, buffer, 0x8000100u);
  if (!v25)
  {
    CFStringRef v25 = CFStringCreateWithCString(allocator, buffer, 0);
    if (!v25) {
      goto LABEL_20;
    }
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaName", v25);
  CFRelease(v25);
  if (sub_100002D70(entry, "IODeviceTree", __s))
  {
    if (sub_100002D70(entry, "IOService", __s)) {
      goto LABEL_20;
    }
  }
  CFStringRef v26 = CFStringCreateWithCString(allocator, __s, 0x8000100u);
  if (!v26)
  {
    CFStringRef v26 = CFStringCreateWithCString(allocator, __s, 0);
    if (!v26) {
      goto LABEL_20;
    }
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaPath", v26);
  CFRelease(v26);
  unsigned int v27 = CFDictionaryGetValue(properties, @"Removable");
  if (!v27) {
    goto LABEL_20;
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaRemovable", v27);
  uint64_t v28 = CFDictionaryGetValue(properties, @"Size");
  if (!v28) {
    goto LABEL_20;
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaSize", v28);
  CFStringRef v29 = (const __CFString *)CFDictionaryGetValue(properties, @"UUID");
  if (!v29) {
    goto LABEL_44;
  }
  CFUUIDRef v30 = sub_100002BB8(allocator, v29);
  if (!v30)
  {
LABEL_20:
    io_object_t v4 = 0;
    io_object_t v5 = 0;
    goto LABEL_3;
  }
  CFUUIDRef v31 = v30;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaUUID", v30);
  CFRelease(v31);
LABEL_44:
  pid_t v32 = CFDictionaryGetValue(properties, @"Whole");
  if (!v32) {
    goto LABEL_20;
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaWhole", v32);
  v33 = CFDictionaryGetValue(properties, @"Writable");
  if (!v33) {
    goto LABEL_20;
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaWritable", v33);
  CFRelease(properties);
  CFMutableDictionaryRef properties = 0;
  if (IORegistryEntryCreateIterator(entry, "IOService", 3u, &iterator)) {
    goto LABEL_20;
  }
  io_object_t object = IOIteratorNext(iterator);
  if (object)
  {
    while (!IOObjectConformsTo(object, "IOBlockStorageDevice"))
    {
      IOObjectRelease(object);
      io_object_t object = IOIteratorNext(iterator);
      if (!object) {
        goto LABEL_50;
      }
    }
  }
  else
  {
LABEL_50:
    io_object_t object = 0;
  }
  IOObjectRelease(iterator);
  io_iterator_t iterator = 0;
  if (!object) {
    goto LABEL_20;
  }
  if (IORegistryEntryCreateCFProperties(object, &properties, allocator, 0))
  {
    io_object_t v5 = object;
    io_object_t v4 = 0;
    goto LABEL_3;
  }
  CFDictionaryRef v34 = (const __CFDictionary *)CFDictionaryGetValue(properties, @"Protocol Characteristics");
  if (v34)
  {
    CFDictionaryRef v35 = v34;
    CFStringRef v36 = (const __CFString *)CFDictionaryGetValue(v34, @"Physical Interconnect Location");
    if (v36)
    {
      CFStringRef v37 = v36;
      if (CFStringCompare(v36, @"Internal", 0))
      {
        if (CFEqual(v37, @"External"))
        {
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DADeviceInternal", kCFBooleanFalse);
          *(_DWORD *)(v6 + 176) |= 0x10u;
        }
      }
      else
      {
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DADeviceInternal", kCFBooleanTrue);
      }
    }
    v38 = CFDictionaryGetValue(v35, @"Physical Interconnect");
    if (v38) {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DADeviceProtocol", v38);
    }
  }
  CFDictionaryRef v39 = (const __CFDictionary *)CFDictionaryGetValue(properties, @"Device Characteristics");
  if (v39)
  {
    CFDictionaryRef v40 = v39;
    v41 = CFDictionaryGetValue(v39, @"Product Name");
    if (v41) {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DADeviceModel", v41);
    }
    int v42 = CFDictionaryGetValue(v40, @"Product Revision Level");
    if (v42) {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DADeviceRevision", v42);
    }
    v43 = CFDictionaryGetValue(v40, @"Vendor Name");
    if (v43) {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DADeviceVendor", v43);
    }
  }
  if (sub_100002D70(object, "IOService", __s)) {
    goto LABEL_70;
  }
  CFStringRef v44 = CFStringCreateWithCString(allocator, __s, 0x8000100u);
  if (!v44) {
    goto LABEL_70;
  }
  CFStringRef v45 = v44;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DADevicePath", v44);
  CFRelease(v45);
  CFTypeRef v46 = IORegistryEntrySearchCFProperty(object, "IOService", @"IOUnit", allocator, 3u);
  if (v46)
  {
    v47 = v46;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DADeviceUnit", v46);
    CFRelease(v47);
  }
  CFNumberRef v48 = (const __CFNumber *)IORegistryEntrySearchCFProperty(object, "IOService", @"GUID", allocator, 3u);
  if (!v48) {
    goto LABEL_77;
  }
  CFNumberRef v49 = v48;
  *(void *)UInt8 bytes = 0;
  CFNumberGetValue(v48, kCFNumberSInt64Type, bytes);
  CFRelease(v49);
  *(void *)UInt8 bytes = bswap64(*(unint64_t *)bytes);
  CFDataRef v50 = CFDataCreate(allocator, bytes, 8);
  if (!v50)
  {
LABEL_70:
    io_object_t v4 = 0;
    io_object_t v5 = object;
    goto LABEL_3;
  }
  CFDataRef v51 = v50;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DADeviceGUID", v50);
  CFRelease(v51);
LABEL_77:
  CFTypeRef v52 = IORegistryEntrySearchCFProperty(object, "IOService", @"AppleTDMLocked", allocator, 3u);
  if (v52)
  {
    v53 = v52;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DADeviceTDMLocked", v52);
    CFRelease(v53);
  }
  CFRelease(properties);
  CFMutableDictionaryRef properties = 0;
  if (!IORegistryEntryCreateIterator(object, "IOService", 3u, &iterator))
  {
    io_registry_entry_t entrya = IOIteratorNext(iterator);
    if (entrya)
    {
      while (!IORegistryEntryInPlane(entrya, "IODeviceTree"))
      {
        IOObjectRelease(entrya);
        io_registry_entry_t entrya = IOIteratorNext(iterator);
        if (!entrya) {
          goto LABEL_89;
        }
      }
    }
    else
    {
LABEL_89:
      io_registry_entry_t entrya = 0;
    }
    IOObjectRelease(iterator);
    io_iterator_t iterator = 0;
    if (entrya)
    {
      if (IORegistryEntryGetNameInPlane(entrya, "IODeviceTree", buffer)
        || (CFStringRef v71 = CFStringCreateWithCString(allocator, buffer, 0x8000100u)) == 0
        || (CFStringRef v72 = v71,
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DABusName", v71),
            CFRelease(v72),
            sub_100002D70(entrya, "IODeviceTree", __s))
        || (CFStringRef v73 = CFStringCreateWithCString(allocator, __s, 0x8000100u)) == 0)
      {
        io_object_t v4 = entrya;
        io_object_t v5 = object;
        goto LABEL_3;
      }
      CFStringRef v74 = v73;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DABusPath", v73);
      CFRelease(v74);
      IOObjectRelease(entrya);
    }
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFNumberRef v54 = CFNumberCreate(allocator, kCFNumberDoubleType, &Current);
  if (!v54) {
    goto LABEL_70;
  }
  CFNumberRef v55 = v54;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAAppearanceTime", v54);
  CFRelease(v55);
  HIDWORD(valuePtr) = 0;
  IOServiceGetBusyState(entry, (uint32_t *)&valuePtr + 1);
  if (HIDWORD(valuePtr)) {
    *(CFAbsoluteTime *)(v6 + 16) = CFAbsoluteTimeGetCurrent();
  }
  CFBooleanRef v56 = (CFBooleanRef)IORegistryEntrySearchCFProperty(entry, "IOService", @"quarantine", allocator, 3u);
  if (v56 && v56 == kCFBooleanTrue)
  {
    *(_DWORD *)(v6 + 176) |= 0x40u;
LABEL_94:
    CFRelease(v56);
    goto LABEL_95;
  }
  if (v56) {
    goto LABEL_94;
  }
LABEL_95:
  CFNumberRef v57 = (const __CFNumber *)IORegistryEntrySearchCFProperty(entry, "IOService", @"owner-uid", allocator, 3u);
  if (v57)
  {
    CFNumberRef v58 = v57;
    CFTypeID v59 = CFGetTypeID(v57);
    if (v59 == CFNumberGetTypeID())
    {
      *(_DWORD *)UInt8 bytes = 0;
      CFNumberGetValue(v58, kCFNumberIntType, bytes);
      uid_t v60 = *(_DWORD *)bytes;
      *(_DWORD *)(v6 + 184) = *(_DWORD *)bytes;
      v61 = getpwuid(v60);
      if (v61) {
        *(_DWORD *)(v6 + 180) = v61->pw_gid;
      }
    }
    CFRelease(v58);
  }
  CFNumberRef v62 = (const __CFNumber *)IORegistryEntrySearchCFProperty(entry, "IOService", @"owner-gid", allocator, 3u);
  if (v62)
  {
    CFNumberRef v63 = v62;
    CFTypeID v64 = CFGetTypeID(v62);
    if (v64 == CFNumberGetTypeID())
    {
      *(_DWORD *)UInt8 bytes = 0;
      CFNumberGetValue(v63, kCFNumberIntType, bytes);
      *(_DWORD *)(v6 + 180) = *(_DWORD *)bytes;
    }
    CFRelease(v63);
  }
  CFNumberRef v65 = (const __CFNumber *)IORegistryEntrySearchCFProperty(entry, "IOService", @"owner-mode", allocator, 3u);
  if (v65)
  {
    CFNumberRef v66 = v65;
    CFTypeID v67 = CFGetTypeID(v65);
    if (v67 == CFNumberGetTypeID())
    {
      *(_DWORD *)UInt8 bytes = 0;
      CFNumberGetValue(v66, kCFNumberIntType, bytes);
      *(_WORD *)(v6 + 156) = *(_WORD *)bytes;
    }
    CFRelease(v66);
  }
  CFStringRef v68 = (const __CFString *)IORegistryEntrySearchCFProperty(entry, "IOService", @"dev-name", allocator, 0);
  if (v68)
  {
    CFStringRef v69 = v68;
    CFTypeID v70 = CFGetTypeID(v68);
    if (v70 == CFStringGetTypeID() && CFStringGetCString(v69, buffer, 128, 0x8000100u))
    {
      __strlcpy_chk();
      __strlcat_chk();
      *(void *)(v6 + 80) = strdup(__s);
      __strlcpy_chk();
      __strlcat_chk();
      __strlcat_chk();
      *(void *)(v6 + 88) = strdup(__s);
    }
    CFRelease(v69);
  }
  IOObjectRelease(object);
  return v6;
}

uint64_t sub_1000052CC(const __CFAllocator *a1, const char *a2)
{
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v5 = Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = 0;
    *(_DWORD *)(Instance + 24) = 0;
    *(_OWORD *)(Instance + 32) = 0u;
    *(_OWORD *)(Instance + 48) = 0u;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    *(void *)(v5 + 64) = Mutable;
    *(void *)(v5 + 72) = 0;
    *(void *)(v5 + 80) = 0;
    *(void *)(v5 + 88) = 0;
    *(_DWORD *)(v5 + 96) = 0;
    *(void *)(v5 + 112) = 0;
    *(void *)(v5 + 120) = 0;
    *(void *)(v5 + 104) = 0;
    *(_DWORD *)(v5 + 128) = -1;
    *(void *)(v5 + 136) = 0;
    id v7 = strdup(a2);
    *(void *)(v5 + 144) = v7;
    *(_DWORD *)(v5 + 152) = 0;
    *(_WORD *)(v5 + 156) = 488;
    *(_OWORD *)(v5 + 160) = 0u;
    *(_OWORD *)(v5 + 176) = 0u;
    *(void *)(v5 + 192) = 0;
    if (!Mutable) {
      sub_10001A5AC();
    }
    if (!v7) {
      sub_10001A5D8();
    }
    size_t v8 = strlen(a2);
    CFDataRef v9 = CFDataCreate(a1, (const UInt8 *)a2, v8 + 1);
    if (v9)
    {
      CFDataRef v10 = v9;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v5 + 64), @"DADiskID", v9);
      CFRelease(v10);
    }
  }
  return v5;
}

uint64_t sub_1000053D8(uint64_t a1)
{
  return *(void *)(a1 + 144);
}

uint64_t sub_1000053E0(const __CFAllocator *a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  io_object_t v4 = (const UInt8 *)(a2 + 88);
  size_t v5 = strlen((const char *)(a2 + 88));
  CFURLRef v6 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, v4, v5, 1u);
  if (!v6) {
    return 0;
  }
  CFURLRef v7 = v6;
  CFStringRef v8 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)(a2 + 72), 0x8000100u);
  if (v8)
  {
    CFStringRef v9 = v8;
    CFDataRef v10 = sub_100008424(a2);
    if (v10)
    {
      long long v11 = v10;
      uint64_t v12 = sub_1000052CC(a1, v10);
      if (v12)
      {
        unsigned int v13 = *(_DWORD *)(a2 + 48);
        int v36 = v13 & 0xFFFFFF;
        unsigned int valuePtr = HIBYTE(v13);
        if (!strcmp((const char *)(a2 + 72), "lifs")
          && !strncmp((const char *)(a2 + 1112), "apfs", 4uLL)
          && !sub_1000086C4(a2, __s1, 1024))
        {
          *(void *)(v12 + 104) = strdup(__s1);
          sub_100008B68("Setting device path %s for %s", __s1, v11);
          CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000252B0);
          if (Count >= 1)
          {
            CFIndex v15 = Count;
            CFIndex v16 = 0;
            while (1)
            {
              ValueAtIndex = (const char **)CFArrayGetValueAtIndex((CFArrayRef)qword_1000252B0, v16);
              if ((const char **)v12 != ValueAtIndex)
              {
                CFNumberRef v18 = ValueAtIndex;
                unsigned int v19 = ValueAtIndex[13];
                if (v19)
                {
                  if (!strcmp(v19, __s1) && *((_DWORD *)v18 + 38)) {
                    break;
                  }
                }
              }
              if (v15 == ++v16) {
                goto LABEL_16;
              }
            }
            CFDictionaryRef v34 = *(__CFDictionary **)(v12 + 64);
            CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)v18[8], @"DAMediaWritable");
            CFDictionarySetValue(v34, @"DAMediaWritable", Value);
          }
LABEL_16:
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), @"DAVolumeKind", @"apfs");
          CFStringRef v20 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)(a2 + 1112), 0x8000100u);
          if (v20)
          {
            CFStringRef v21 = v20;
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), @"DAVolumeLifsURL", v20);
            CFRelease(v21);
          }
          CFArrayRef v22 = _FSCopyNameForVolumeFormatAtURL(v7);
          if (v22)
          {
            CFArrayRef v23 = v22;
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), @"DAVolumeType", v22);
            CFRelease(v23);
          }
        }
        *(void *)(v12 + 32) = CFRetain(v7);
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), @"DAVolumePath", v7);
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), @"DAVolumeMountable", kCFBooleanTrue);
        if (!CFDictionaryGetValue(*(CFDictionaryRef *)(v12 + 64), @"DAVolumeKind")) {
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), @"DAVolumeKind", v9);
        }
        CFStringRef v24 = sub_100006268(0, v7, 0);
        if (v24)
        {
          CFStringRef v25 = v24;
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), @"DAVolumeName", v24);
          CFRelease(v25);
        }
        CFNumberRef v26 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        if (v26)
        {
          CFNumberRef v27 = v26;
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), @"DAMediaBSDMajor", v26);
          CFRelease(v27);
        }
        CFNumberRef v28 = CFNumberCreate(0, kCFNumberSInt32Type, &v36);
        if (v28)
        {
          CFNumberRef v29 = v28;
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), @"DAMediaBSDMinor", v28);
          CFRelease(v29);
        }
        if ((*(_DWORD *)(a2 + 64) & 0x1000) != 0) {
          CFBooleanRef v30 = kCFBooleanFalse;
        }
        else {
          CFBooleanRef v30 = kCFBooleanTrue;
        }
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), @"DAVolumeNetwork", v30);
        *(_DWORD *)(v12 + 176) |= 0x70030u;
        uid_t v31 = *(_DWORD *)(a2 + 56);
        *(_DWORD *)(v12 + 184) = v31;
        pid_t v32 = getpwuid(v31);
        if (v32) {
          *(_DWORD *)(v12 + 180) = v32->pw_gid;
        }
      }
      free(v11);
    }
    else
    {
      uint64_t v12 = 0;
    }
    CFRelease(v9);
  }
  else
  {
    uint64_t v12 = 0;
  }
  CFRelease(v7);
  return v12;
}

uint64_t sub_10000580C(uint64_t a1, int a2)
{
  return *(void *)(a1 + 8 * (a2 != 0) + 104);
}

uint64_t sub_100005820(uint64_t a1)
{
  return *(unsigned int *)(a1 + 152);
}

const void *sub_100005828(uint64_t a1, const void *a2)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), a2);
}

double sub_100005830(uint64_t a1)
{
  return *(double *)(a1 + 16);
}

uint64_t sub_100005838(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t sub_100005840(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t sub_100005848(uint64_t a1, int a2)
{
  return *(void *)(a1 + 8 * (a2 != 0) + 80);
}

uint64_t sub_10000585C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 96);
}

uint64_t sub_100005864(uint64_t a1)
{
  return *(unsigned int *)(a1 + 128);
}

uint64_t sub_10000586C(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

uint64_t sub_100005874(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

uint64_t sub_10000587C(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

uint64_t sub_100005884(uint64_t a1)
{
  return *(void *)(a1 + 72);
}

uint64_t sub_10000588C(uint64_t a1)
{
  return *(void *)(a1 + 136);
}

uint64_t sub_100005894(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int16 *)(a1 + 156);
  if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), @"DAMediaWritable") == kCFBooleanFalse) {
    return v1 & 0x16D;
  }
  else {
    return v1;
  }
}

BOOL sub_1000058E4(uint64_t a1, int a2)
{
  return (*(_DWORD *)(a1 + 160) & a2) != 0;
}

uint64_t sub_1000058F4(uint64_t a1)
{
  return *(unsigned int *)(a1 + 160);
}

uint64_t sub_1000058FC(uint64_t a1)
{
  return *(unsigned int *)(a1 + 164);
}

CFMutableDataRef sub_100005904(CFTypeRef cf)
{
  CFMutableDataRef result = (CFMutableDataRef)*((void *)cf + 21);
  if (!result)
  {
    CFAllocatorRef v3 = CFGetAllocator(cf);
    CFMutableDataRef result = sub_100008100(v3, *((CFDictionaryRef *)cf + 8));
    *((void *)cf + 21) = result;
  }
  return result;
}

BOOL sub_100005940(uint64_t a1, int a2)
{
  return (*(_DWORD *)(a1 + 176) & a2) != 0;
}

uint64_t sub_100005950()
{
  return qword_100024D68;
}

uint64_t sub_10000595C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 180);
}

uint64_t sub_100005964(uint64_t a1)
{
  return *(unsigned int *)(a1 + 184);
}

uint64_t sub_10000596C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 188);
}

uint64_t sub_100005974()
{
  uint64_t result = _CFRuntimeRegisterClass();
  qword_100024D68 = result;
  return result;
}

BOOL sub_10000599C(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t context = a1;
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_1000059E4, &context);
  return context != 0;
}

unint64_t sub_1000059E4(unint64_t result, const __CFDictionary *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  if (*a3)
  {
    CFURLRef v6 = (const void *)result;
    if (CFEqual((CFTypeRef)result, @"DAMediaMatch"))
    {
      BOOLean_t matches = 0;
      uint64_t result = IOServiceMatchPropertyTable(*(_DWORD *)(v3 + 152), a2, &matches);
      if (matches) {
        return result;
      }
      goto LABEL_7;
    }
    uint64_t result = (unint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(v3 + 64), v6);
    if (!result || (uint64_t result = CFEqual(a2, (CFTypeRef)result), !result)) {
LABEL_7:
    }
      *a3 = 0;
  }
  return result;
}

uint64_t sub_100005A7C(uint64_t result, double a2)
{
  *(double *)(result + 16) = a2;
  return result;
}

uint64_t sub_100005A84(uint64_t a1, io_object_t object)
{
  uint64_t result = *(unsigned int *)(a1 + 24);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *(_DWORD *)(a1 + 24) = 0;
  }
  if (object)
  {
    uint64_t result = IOObjectRetain(object);
    *(_DWORD *)(a1 + 24) = object;
  }
  return result;
}

void sub_100005AC8(uint64_t a1, CFTypeRef cf)
{
  io_object_t v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 32) = 0;
  }
  if (cf)
  {
    CFRetain(cf);
    *(void *)(a1 + 32) = cf;
  }
}

void sub_100005B0C(uint64_t a1, int a2, char *__s1)
{
  uint64_t v4 = a1 + 8 * (a2 != 0);
  CFURLRef v7 = *(void **)(v4 + 80);
  CFURLRef v6 = (char **)(v4 + 80);
  size_t v5 = v7;
  if (v7)
  {
    free(v5);
    const void *v6 = 0;
  }
  if (__s1) {
    const void *v6 = strdup(__s1);
  }
}

void sub_100005B58(uint64_t a1, CFTypeRef cf)
{
  uint64_t v4 = *(const void **)(a1 + 40);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 40) = 0;
  }
  if (cf)
  {
    CFRetain(cf);
    *(void *)(a1 + 40) = cf;
  }
}

void sub_100005B9C(uint64_t a1, CFTypeRef cf)
{
  uint64_t v4 = *(const void **)(a1 + 48);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 48) = 0;
  }
  if (cf)
  {
    CFRetain(cf);
    *(void *)(a1 + 48) = cf;
  }
}

void sub_100005BE0(uint64_t a1, CFTypeRef cf)
{
  uint64_t v4 = *(const void **)(a1 + 56);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 56) = 0;
  }
  if (cf)
  {
    CFRetain(cf);
    *(void *)(a1 + 56) = cf;
  }
}

void sub_100005C24(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t v4 = *(__CFDictionary **)(a1 + 64);
  if (a3) {
    CFDictionarySetValue(v4, a2, a3);
  }
  else {
    CFDictionaryRemoveValue(v4, a2);
  }
  size_t v5 = *(const void **)(a1 + 168);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 168) = 0;
  }
}

void sub_100005C68(uint64_t a1, CFTypeRef cf)
{
  uint64_t v4 = *(const void **)(a1 + 136);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 136) = 0;
  }
  if (cf)
  {
    CFRetain(cf);
    *(void *)(a1 + 136) = cf;
  }
}

void sub_100005CAC(CFDictionaryRef *a1, const __CFDictionary *a2)
{
  CFMutableSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  CFDictionaryRef v5 = a1[24];
  if (v5)
  {
    CFDictionaryApplyFunction(v5, (CFDictionaryApplierFunction)sub_100005E2C, Mutable);
    CFDictionaryApplyFunction(a1[24], (CFDictionaryApplierFunction)sub_100005E38, a1);
    CFRelease(a1[24]);
    a1[24] = 0;
  }
  if (a2)
  {
    CFDictionaryApplyFunction(a2, (CFDictionaryApplierFunction)sub_100005E2C, Mutable);
    CFDictionaryApplyFunction(a2, (CFDictionaryApplierFunction)sub_100005E48, a1);
    CFRetain(a2);
  }
  a1[24] = a2;
  CFIndex Count = CFSetGetCount(Mutable);
  if (Count)
  {
    CFIndex v7 = Count;
    CFStringRef v8 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    CFSetGetValues(Mutable, v8);
    CFArrayRef v9 = CFArrayCreate(kCFAllocatorDefault, v8, v7, &kCFTypeArrayCallBacks);
    free(v8);
    sub_10000CA44(a1, v9);
    CFRelease(Mutable);
    CFRelease(v9);
  }
}

void sub_100005E2C(void *value, int a2, CFMutableSetRef theSet)
{
}

void sub_100005E38(const void *a1, uint64_t a2, uint64_t a3)
{
}

void sub_100005E48(const void *a1, const void *a2, uint64_t a3)
{
}

uint64_t sub_100005E5C(uint64_t result, int a2, int a3)
{
  if (a3) {
    int v3 = a2;
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(result + 160) = *(_DWORD *)(result + 160) & ~a2 | v3;
  return result;
}

uint64_t sub_100005E78(uint64_t a1, io_object_t object)
{
  uint64_t result = *(unsigned int *)(a1 + 164);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *(_DWORD *)(a1 + 164) = 0;
  }
  if (object)
  {
    uint64_t result = IOObjectRetain(object);
    *(_DWORD *)(a1 + 164) = object;
  }
  return result;
}

uint64_t sub_100005EBC(uint64_t result, int a2, int a3)
{
  if (a3) {
    int v3 = a2;
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(result + 176) = *(_DWORD *)(result + 176) & ~a2 | v3;
  return result;
}

char *sub_100005ED8(uint64_t a1, char *__s1)
{
  uint64_t result = strdup(__s1);
  *(void *)(a1 + 120) = result;
  return result;
}

uint64_t sub_100005F04(uint64_t result, int a2)
{
  *(_DWORD *)(result + 188) = a2;
  return result;
}

uint64_t sub_100005F0C(uint64_t a1)
{
  return *(void *)(a1 + 120);
}

const char **sub_100005F14(uint64_t a1)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000252B0);
  if (*(void *)(a1 + 120)) {
    BOOL v3 = Count < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    return 0;
  }
  CFIndex v4 = Count;
  CFIndex v5 = 0;
  while (1)
  {
    ValueAtIndex = (const char **)CFArrayGetValueAtIndex((CFArrayRef)qword_1000252B0, v5);
    if (!strcmp(ValueAtIndex[18], *(const char **)(a1 + 120))) {
      break;
    }
    if (v4 == ++v5) {
      return 0;
    }
  }
  return ValueAtIndex;
}

void sub_100005FA0(uint64_t a1)
{
  io_object_t v2 = *(_DWORD *)(a1 + 24);
  if (v2) {
    IOObjectRelease(v2);
  }
  BOOL v3 = *(const void **)(a1 + 32);
  if (v3) {
    CFRelease(v3);
  }
  CFIndex v4 = *(const void **)(a1 + 40);
  if (v4) {
    CFRelease(v4);
  }
  CFIndex v5 = *(const void **)(a1 + 48);
  if (v5) {
    CFRelease(v5);
  }
  CFURLRef v6 = *(const void **)(a1 + 56);
  if (v6) {
    CFRelease(v6);
  }
  CFIndex v7 = *(const void **)(a1 + 64);
  if (v7) {
    CFRelease(v7);
  }
  CFStringRef v8 = *(const void **)(a1 + 72);
  if (v8) {
    CFRelease(v8);
  }
  CFArrayRef v9 = *(void **)(a1 + 80);
  if (v9) {
    free(v9);
  }
  CFDataRef v10 = *(void **)(a1 + 88);
  if (v10) {
    free(v10);
  }
  long long v11 = *(void **)(a1 + 104);
  if (v11) {
    free(v11);
  }
  uint64_t v12 = *(void **)(a1 + 112);
  if (v12) {
    free(v12);
  }
  unsigned int v13 = *(const void **)(a1 + 136);
  if (v13) {
    CFRelease(v13);
  }
  CFNumberRef v14 = *(void **)(a1 + 144);
  if (v14) {
    free(v14);
  }
  io_object_t v15 = *(_DWORD *)(a1 + 152);
  if (v15) {
    IOObjectRelease(v15);
  }
  io_object_t v16 = *(_DWORD *)(a1 + 164);
  if (v16) {
    IOObjectRelease(v16);
  }
  CFNumberRef v17 = *(const void **)(a1 + 168);
  if (v17) {
    CFRelease(v17);
  }
  CFNumberRef v18 = *(void **)(a1 + 120);
  if (v18) {
    free(v18);
  }
  unsigned int v19 = *(const void **)(a1 + 192);
  if (v19)
  {
    CFRelease(v19);
  }
}

BOOL sub_1000060B0(uint64_t a1, uint64_t a2)
{
  return strcmp(*(const char **)(a1 + 144), *(const char **)(a2 + 144)) == 0;
}

uint64_t sub_1000060D8(uint64_t a1)
{
  unsigned int v1 = *(const char **)(a1 + 144);
  size_t v2 = strlen(v1);
  if (v2 >= 0x10) {
    uint64_t v3 = 16;
  }
  else {
    uint64_t v3 = v2;
  }

  return _CFHashBytes(v1, v3);
}

CFStringRef sub_100006120(void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, @"%s", a1[18]);
}

CFStringRef sub_100006164(void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  CFAllocatorRef v3 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, @"<DADisk %p [%p]>{id = %s}", a1, v3, a1[18]);
}

CFMutableDictionaryRef sub_1000061BC(const __CFAllocator *a1, int a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v4 = Mutable;
  if (Mutable) {
    sub_100007E7C(Mutable, @"DAStatus", a2);
  }
  return v4;
}

CFNumberRef sub_100006214(const __CFDictionary *a1)
{
  return sub_100007E44(a1, @"DAProcessID");
}

CFNumberRef sub_100006234(const __CFDictionary *a1)
{
  return sub_100007E44(a1, @"DAStatus");
}

void sub_100006254(void *a1, int a2)
{
}

CFStringRef sub_100006268(uint64_t a1, const __CFURL *a2, _OWORD *a3)
{
  bzero(v11, 0x41CuLL);
  v10[2] = 0;
  v10[0] = 5;
  v10[1] = 2147753984;
  CFIndex v5 = sub_100008040(a2);
  if (v5)
  {
    CFURLRef v6 = v5;
    if (getattrlist((const char *)v5, v10, v11, 0x41CuLL, 0) == -1)
    {
      CFStringRef v8 = 0;
LABEL_12:
      free(v6);
      return v8;
    }
    if (v12[1])
    {
      CFStringRef v7 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)v12 + v12[0], 0x8000100u);
      CFStringRef v8 = v7;
      if (!v7 || CFStringGetLength(v7))
      {
LABEL_8:
        if (a3) {
          *a3 = v13;
        }
        goto LABEL_12;
      }
      CFRelease(v8);
    }
    CFStringRef v8 = 0;
    goto LABEL_8;
  }
  return 0;
}

CFUUIDRef sub_100006394(const __CFAllocator *a1, const __CFString *a2)
{
  CFUUIDRef v4 = sub_100002BB8(a1, a2);
  if (!v4)
  {
    CFIndex v5 = sub_100002550(a1, a2);
    if (v5)
    {
      CFDataRef v6 = v5;
      if (CFDataGetLength(v5) == 8)
      {
        if (*(void *)CFDataGetBytePtr(v6))
        {
          CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorDefault, 0xB3u, 0xE2u, 0xFu, 0x39u, 0xF2u, 0x92u, 0x11u, 0xD6u, 0x97u, 0xA4u, 0, 0x30u, 0x65u, 0x43u, 0xECu, 0xACu);
          CFUUIDRef v8 = sub_100002A60(a1, v7, v6);
        }
        else
        {
          CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
          CFUUIDRef v8 = (const __CFUUID *)CFRetain(v9);
        }
        CFUUIDRef v4 = v8;
      }
      else
      {
        CFUUIDRef v4 = 0;
      }
      CFRelease(v6);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

uint64_t sub_1000064B0(uint64_t a1, CFURLRef bundleURL)
{
  CFDictionaryRef v4 = CFBundleCopyInfoDictionaryInDirectory(bundleURL);
  if (!v4) {
    return 0;
  }
  CFDictionaryRef v5 = v4;
  CFURLRef v6 = CFURLCopyAbsoluteURL(bundleURL);
  if (v6)
  {
    CFURLRef v7 = v6;
    uint64_t v8 = sub_100006534(a1, v6, v5);
    CFRelease(v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  CFRelease(v5);
  return v8;
}

uint64_t sub_100006534(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    *(void *)(Instance + 16) = CFRetain(a2);
    *(void *)(Instance + 24) = CFRetain(a3);
  }
  return Instance;
}

uint64_t sub_100006598(const __CFAllocator *a1, CFDictionaryRef theDict)
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, kCFBundleNameKey);
  if (!Value) {
    return 0;
  }
  CFURLRef v5 = CFURLCreateWithFileSystemPath(a1, Value, kCFURLPOSIXPathStyle, 0);
  if (!v5) {
    return 0;
  }
  CFURLRef v6 = v5;
  uint64_t v7 = sub_100006534((uint64_t)a1, v5, theDict);
  CFRelease(v6);
  return v7;
}

const void *sub_100006624(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), kCFBundleNameKey);
}

const void *sub_100006638(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), @"FSMediaTypes");
}

const void *sub_100006648(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), @"FSIsFSModule");
}

uint64_t sub_100006658()
{
  return qword_100024D70;
}

uint64_t sub_100006664()
{
  uint64_t result = _CFRuntimeRegisterClass();
  qword_100024D70 = result;
  return result;
}

void sub_10000668C(uint64_t a1, const __CFURL *a2, const void *a3, const __CFURL *a4, uid_t a5, gid_t a6, void (*a7)(CFIndex, uint64_t), void (*a8)(CFIndex, uint64_t), const __CFString *a9)
{
  sub_1000066BC(a1, a2, a3, a4, a5, a6, a9, a7, a8, 0, vars0);
}

void sub_1000066BC(uint64_t a1, const __CFURL *a2, const void *a3, const __CFURL *a4, uid_t a5, gid_t a6, const __CFString *a7, void (*a8)(CFIndex, uint64_t), void (*a9)(CFIndex, uint64_t), CFStringRef appendedString, uint64_t a11)
{
  int v18 = sub_100006AA8(a1, a7);
  CFURLRef v19 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, @"/sbin/mount", kCFURLPOSIXPathStyle, 0);
  if (!v19)
  {
    CFIndex Length = 45;
    if (!a8) {
      return;
    }
    goto LABEL_39;
  }
  CFURLRef v20 = v19;
  gid_t v41 = a6;
  CFStringRef v21 = (void (**)(CFIndex, uint64_t))malloc_type_malloc(0x40uLL, 0xE0040E5DF33D6uLL);
  if (!v21)
  {
    CFRelease(v20);
    CFIndex Length = 12;
    if (!a8) {
      return;
    }
LABEL_39:
    a8(Length, (uint64_t)a9);
    return;
  }
  CFArrayRef v22 = v21;
  CFStringRef v23 = CFURLCopyFileSystemPath(a2, kCFURLPOSIXPathStyle);
  if (!v23)
  {
    CFRelease(v20);
    CFIndex Length = 22;
    goto LABEL_38;
  }
  CFStringRef v24 = v23;
  if (a4)
  {
    CFStringRef cf = CFURLCopyFileSystemPath(a4, kCFURLPOSIXPathStyle);
    if (!cf)
    {
      CFMutableStringRef Mutable = 0;
      char v26 = 0;
      CFStringRef v27 = 0;
      CFIndex Length = 22;
      goto LABEL_33;
    }
  }
  else
  {
    CFStringRef cf = 0;
  }
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  if (!Mutable)
  {
    char v26 = 0;
    CFIndex Length = 12;
    goto LABEL_24;
  }
  int v42 = (const __CFString **)&a11;
  CFStringRef v29 = appendedString;
  if (appendedString)
  {
    do
    {
      CFStringAppend(Mutable, v29);
      CFStringAppend(Mutable, @",");
      CFBooleanRef v30 = v42++;
      CFStringRef v29 = *v30;
    }
    while (*v30);
  }
  CFStringTrim(Mutable, @",");
  *CFArrayRef v22 = a8;
  v22[1] = a9;
  if (v18)
  {
    CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, v24, @"/");
    if (ArrayBySeparatingStrings)
    {
      CFArrayRef v32 = ArrayBySeparatingStrings;
      CFIndex Count = CFArrayGetCount(ArrayBySeparatingStrings);
      ValueAtIndex = CFArrayGetValueAtIndex(v32, Count - 1);
      v22[2] = (void (*)(CFIndex, uint64_t))CFRetain(ValueAtIndex);
      CFStringRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), kCFBundleNameKey);
      v22[4] = (void (*)(CFIndex, uint64_t))CFRetain(Value);
      CFStringRef v27 = cf;
      if (cf) {
        int v36 = (void (*)(CFIndex, uint64_t))CFRetain(cf);
      }
      else {
        int v36 = 0;
      }
      v22[5] = v36;
      if (a3) {
        CFStringRef v39 = (const __CFString *)CFRetain(a3);
      }
      else {
        CFStringRef v39 = @"Untitled";
      }
      v22[6] = (void (*)(CFIndex, uint64_t))v39;
      CFStringAppend(Mutable, @",");
      CFStringAppend(Mutable, @"nofollow");
      CFStringTrim(Mutable, @",");
      v22[7] = (void (*)(CFIndex, uint64_t))CFRetain(Mutable);
      sub_100017794((uint64_t)sub_100008CEC, (uint64_t)v22, (uint64_t (*)(uint64_t, uint64_t))sub_100006AF8, (uint64_t)v22);
      CFRelease(v32);
      goto LABEL_31;
    }
    char v26 = 0;
    CFIndex Length = 22;
LABEL_24:
    CFStringRef v27 = cf;
    goto LABEL_33;
  }
  CFIndex Length = CFStringGetLength(Mutable);
  CFStringRef v37 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), kCFBundleNameKey);
  if (Length)
  {
    CFStringRef v27 = cf;
    sub_1000035CC(v20, 0, a5, v41, -1, (void (*)(uint64_t, void, uint64_t))sub_100006B78, (uint64_t)v22, v38, @"-t", (uint64_t)v37);
LABEL_31:
    CFIndex Length = 0;
    goto LABEL_32;
  }
  CFStringRef v27 = cf;
  sub_1000035CC(v20, 0, a5, v41, -1, (void (*)(uint64_t, void, uint64_t))sub_100006B78, (uint64_t)v22, v38, @"-t", (uint64_t)v37);
LABEL_32:
  char v26 = 1;
LABEL_33:
  CFRelease(v20);
  CFRelease(v24);
  if (v27) {
    CFRelease(v27);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if ((v26 & 1) == 0)
  {
LABEL_38:
    free(v22);
    if (!a8) {
      return;
    }
    goto LABEL_39;
  }
}

uint64_t sub_100006AA8(uint64_t a1, const __CFString *a2)
{
  if (!a2) {
    return 0;
  }
  if (CFStringCompare(@"UserFS", a2, 1uLL)) {
    return 0;
  }
  return os_variant_has_factory_content() ^ 1;
}

void sub_100006AF8(uint64_t a1, void *a2)
{
  if (*a2) {
    ((void (*)(uint64_t, void))*a2)(a1, a2[1]);
  }
  CFAllocatorRef v3 = (const void *)a2[6];
  if (v3) {
    CFRelease(v3);
  }
  CFDictionaryRef v4 = (const void *)a2[2];
  if (v4) {
    CFRelease(v4);
  }
  CFURLRef v5 = (const void *)a2[4];
  if (v5) {
    CFRelease(v5);
  }
  CFURLRef v6 = (const void *)a2[5];
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = (const void *)a2[7];
  if (v7) {
    CFRelease(v7);
  }

  free(a2);
}

void sub_100006B78(uint64_t a1, int a2, void *a3)
{
  if (*a3) {
    ((void (*)(uint64_t, void))*a3)(a1, a3[1]);
  }

  free(a3);
}

void sub_100006BBC(uint64_t a1, CFURLRef url, const char *a3, const char *a4, void (*a5)(uint64_t, uint64_t, void, void, void, uint64_t), uint64_t a6, int a7)
{
  CFStringRef PathComponent = CFURLCopyLastPathComponent(url);
  if (PathComponent)
  {
    CFStringRef v14 = PathComponent;
    CFStringRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), @"FSIsFSModule");
    CFDictionaryRef v16 = *(const __CFDictionary **)(a1 + 24);
    if (Value)
    {
      CFStringRef v17 = (const __CFString *)CFDictionaryGetValue(v16, kCFBundleNameKey);
      CFStringRef v18 = sub_1000149B4(v17);
      sub_100015490(v14, v18, a7, a5, a6);
      return;
    }
    CFDictionaryRef v20 = (const __CFDictionary *)CFDictionaryGetValue(v16, @"FSPersonalities");
    if (v20)
    {
      CFDictionaryRef v21 = (const __CFDictionary *)sub_1000027BC(v20);
      if (v21)
      {
        CFDictionaryRef v22 = v21;
        CFDictionaryRef v23 = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), @"FSMediaTypes");
        if (v23)
        {
          CFDictionaryRef v24 = (const __CFDictionary *)sub_1000027BC(v23);
          if (v24)
          {
            CFStringRef v25 = (const __CFString *)CFDictionaryGetValue(v24, @"FSProbeExecutable");
            if (v25)
            {
              CFURLRef v26 = sub_10000246C(*(const __CFURL **)(a1 + 16), v25);
              if (v26)
              {
                CFURLRef v27 = v26;
                CFStringRef v28 = (const __CFString *)CFDictionaryGetValue(v22, @"FSRepairExecutable");
                CFURLRef v29 = 0;
                if (a7 && v28 && (CFURLRef v29 = sub_10000246C(*(const __CFURL **)(a1 + 16), v28)) == 0)
                {
                  v33 = 0;
                  uint64_t v19 = 45;
                }
                else
                {
                  CFStringRef v30 = sub_100002CD0(url, kCFURLPOSIXPathStyle);
                  if (v30)
                  {
                    CFStringRef v31 = v30;
                    CFArrayRef v32 = malloc_type_malloc(0x58uLL, 0x10E0040C95B46AEuLL);
                    v33 = v32;
                    if (!v32)
                    {
LABEL_34:
                      uint64_t v19 = 12;
LABEL_35:
                      CFRelease(v14);
LABEL_38:
                      CFRelease(v31);
                      CFRelease(v27);
                      if (v29) {
                        CFRelease(v29);
                      }
                      if (v33) {
                        free(v33);
                      }
                      goto LABEL_29;
                    }
                    *(void *)CFArrayRef v32 = a5;
                    *((void *)v32 + 1) = a6;
                    *((void *)v32 + 2) = v14;
                    *((void *)v32 + 3) = v31;
                    *((void *)v32 + 4) = v27;
                    *((void *)v32 + 5) = v29;
                    v32[12] = -1;
                    *((void *)v32 + 8) = 0;
                    *((void *)v32 + 9) = 0;
                    *((void *)v32 + 7) = 0;
                    *((void *)v32 + 10) = -1;
                    if ((os_variant_is_darwinos() & 1) != 0
                      || (CFDictionaryRef v35 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), kCFBundleNameKey),
                          CFEqual(v35, @"apfs")))
                    {
LABEL_25:
                      int v40 = v33[20];
                      if (v40 < 0)
                      {
                        CFStringRef v41 = 0;
                        goto LABEL_43;
                      }
                      CFStringRef v41 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"/dev/fd/%d", v33[20]);
                      if (v41)
                      {
                        int v40 = v33[20];
LABEL_43:
                        if (v40 == -1) {
                          uint64_t v42 = (uint64_t)v14;
                        }
                        else {
                          uint64_t v42 = (uint64_t)v41;
                        }
                        sub_1000035CC(v27, 1, 0, 0, v40, (void (*)(uint64_t, void, uint64_t))sub_100006F64, (uint64_t)v33, v34, @"-p", v42);
                        return;
                      }
                      goto LABEL_34;
                    }
                    if (a4)
                    {
                      int v36 = sub_100008E20(a4, 0);
                      if (v36 == -1) {
                        goto LABEL_48;
                      }
                      int v37 = v36;
                      v33[21] = dup(v36);
                      close(v37);
                    }
                    int v38 = sub_100008E20(a3, 0);
                    if (v38 != -1)
                    {
                      int v39 = v38;
                      v33[20] = dup(v38);
                      close(v39);
                      goto LABEL_25;
                    }
LABEL_48:
                    uint64_t v19 = *__error();
                    if (!v19) {
                      return;
                    }
                    goto LABEL_35;
                  }
                  v33 = 0;
                  uint64_t v19 = 22;
                }
                CFStringRef v31 = v14;
                goto LABEL_38;
              }
            }
          }
        }
      }
    }
    CFRelease(v14);
    uint64_t v19 = 45;
  }
  else
  {
    uint64_t v19 = 22;
  }
LABEL_29:
  if (a5)
  {
    a5(v19, 0, 0, 0, 0, a6);
  }
}

void sub_100006F64(uint64_t a1, const __CFData *a2, const __CFURL **data, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 != -1)
  {
LABEL_2:
    sub_100007A2C(a1, data);
    return;
  }
  if (a2)
  {
    CFStringRef v9 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, a2, 0x8000100u);
    if (v9)
    {
      CFStringRef v10 = v9;
      if (CFStringGetLength(v9))
      {
        CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, v10);
        data[7] = (const __CFURL *)MutableCopy;
        if (MutableCopy) {
          CFStringTrim(MutableCopy, @"\n");
        }
      }
      CFRelease(v10);
    }
  }
  int v12 = *((_DWORD *)data + 20);
  if (v12 < 0)
  {
    CFStringRef v14 = 0;
  }
  else
  {
    CFStringRef v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"/dev/fd/%d", *((unsigned int *)data + 20));
    if (!v13)
    {
      a1 = 12;
      goto LABEL_2;
    }
    CFStringRef v14 = v13;
    int v12 = *((_DWORD *)data + 20);
  }
  uint64_t v15 = (uint64_t)v14;
  if (v12 == -1) {
    uint64_t v15 = (uint64_t)data[2];
  }
  sub_1000035CC(data[4], 1, 0, 0, v12, (void (*)(uint64_t, void, uint64_t))sub_1000078A4, (uint64_t)data, a8, @"-k", v15);
  if (v14)
  {
    CFRelease(v14);
  }
}

void sub_1000070D0(uint64_t a1, const __CFURL *a2, const __CFString *a3, void (*a4)(uint64_t, uint64_t), uint64_t a5)
{
  uint64_t v15 = 0;
  long long v14 = xmmword_10001F350;
  LOWORD(v14) = 5;
  CFStringRef v9 = (char *)malloc_type_malloc(0x408uLL, 0x1000040F7F14A6DuLL);
  if (v9)
  {
    CFStringRef v10 = v9;
    long long v11 = sub_100008040(a2);
    if (v11)
    {
      int v12 = (char *)v11;
      if (CFStringGetCString(a3, v10 + 8, 1024, 0x8000100u))
      {
        *(_DWORD *)CFStringRef v10 = 8;
        *((_DWORD *)v10 + 1) = strlen(v10 + 8) + 1;
        uint64_t v13 = setattrlist(v12, &v14, v10, 0x408uLL, 0);
        if (v13 == -1) {
          uint64_t v13 = *__error();
        }
      }
      else
      {
        uint64_t v13 = 22;
      }
      free(v10);
      free(v12);
    }
    else
    {
      free(v10);
      uint64_t v13 = 22;
    }
  }
  else
  {
    uint64_t v13 = 12;
  }
  if (a4) {
    a4(v13, a5);
  }
}

void sub_100007200(uint64_t a1, const __CFURL *a2, uint64_t a3, void (*a4)(uint64_t, uint64_t), uint64_t a5)
{
  if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), @"FSIsFSModule"))
  {
    CFStringRef PathComponent = CFURLCopyLastPathComponent(a2);
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), kCFBundleNameKey);
    CFStringRef v11 = sub_1000149B4(Value);
    sub_100015D6C(PathComponent, v11, a4, a5);
    return;
  }
  CFStringRef v12 = sub_100002CD0(a2, kCFURLPOSIXPathStyle);
  if (!v12)
  {
    uint64_t v24 = 22;
    goto LABEL_16;
  }
  CFStringRef v13 = v12;
  CFDictionaryRef v14 = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), @"FSPersonalities");
  if (!v14
    || (CFDictionaryRef v15 = (const __CFDictionary *)sub_1000027BC(v14)) == 0
    || (CFStringRef v16 = (const __CFString *)CFDictionaryGetValue(v15, @"FSRepairExecutable")) == 0
    || (CFURLRef v17 = sub_10000246C(*(const __CFURL **)(a1 + 16), v16)) == 0)
  {
    CFRelease(v13);
    uint64_t v24 = 45;
    goto LABEL_16;
  }
  CFURLRef v18 = v17;
  CFDictionaryRef v20 = malloc_type_malloc(0x40uLL, 0xE0040E5DF33D6uLL);
  if (!v20)
  {
    char v23 = 0;
    CFStringRef v22 = 0;
    goto LABEL_22;
  }
  *CFDictionaryRef v20 = a4;
  v20[1] = a5;
  if (a3 == -1)
  {
    CFStringRef v22 = 0;
    CFStringRef v21 = v13;
  }
  else
  {
    CFStringRef v21 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"/dev/fd/%d", a3);
    CFStringRef v22 = v21;
    if (!v21)
    {
      char v23 = 0;
LABEL_22:
      uint64_t v24 = 12;
      goto LABEL_25;
    }
  }
  sub_1000035CC(v18, 0, 0, 0, a3, (void (*)(uint64_t, void, uint64_t))sub_100006B78, (uint64_t)v20, v19, @"-y", (uint64_t)v21);
  uint64_t v24 = 0;
  char v23 = 1;
LABEL_25:
  CFRelease(v18);
  CFRelease(v13);
  if (v22) {
    CFRelease(v22);
  }
  CFStringRef v25 = a4;
  if ((v23 & 1) == 0)
  {
    if (!v20)
    {
LABEL_17:
      if (v25)
      {
        v25(v24, a5);
      }
      return;
    }
    free(v20);
LABEL_16:
    CFStringRef v25 = a4;
    goto LABEL_17;
  }
}

void sub_100007458(uint64_t a1, const __CFURL *a2, void (*a3)(uint64_t, uint64_t), void (*a4)(uint64_t, uint64_t))
{
  CFURLRef v6 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, @"/sbin/quotacheck", kCFURLPOSIXPathStyle, 0);
  if (v6)
  {
    CFURLRef v7 = v6;
    uint64_t v8 = (void (**)(uint64_t, uint64_t))malloc_type_malloc(0x40uLL, 0xE0040E5DF33D6uLL);
    if (v8)
    {
      CFStringRef v9 = v8;
      if (a2)
      {
        CFStringRef v10 = CFURLCopyFileSystemPath(a2, kCFURLPOSIXPathStyle);
        if (v10)
        {
          CFStringRef v12 = v10;
          char *v9 = a3;
          v9[1] = a4;
          sub_1000035CC(v7, 0, 0, 0, -1, (void (*)(uint64_t, void, uint64_t))sub_100006B78, (uint64_t)v9, v11, @"-g", @"-u");
          CFRelease(v7);
          CFRelease(v12);
          return;
        }
      }
      CFRelease(v7);
      free(v9);
      uint64_t v13 = 22;
    }
    else
    {
      CFRelease(v7);
      uint64_t v13 = 12;
    }
  }
  else
  {
    uint64_t v13 = 45;
  }
  if (a3)
  {
    a3(v13, (uint64_t)a4);
  }
}

void sub_1000075C8(int a1, const __CFURL *a2, void (*a3)(uint64_t, uint64_t), void (*a4)(uint64_t, uint64_t), int a5, int a6, int a7, int a8)
{
  sub_1000075EC(a1, a2, a3, a4, a5, a6, a7, a8, 0, v8);
}

void sub_1000075EC(int a1, const __CFURL *a2, void (*a3)(uint64_t, uint64_t), void (*a4)(uint64_t, uint64_t), int a5, int a6, int a7, int a8, CFTypeRef cf1, uint64_t a10)
{
  CFURLRef v12 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, @"/sbin/umount", kCFURLPOSIXPathStyle, 0);
  if (v12)
  {
    CFURLRef v13 = v12;
    CFDictionaryRef v14 = (void (**)(uint64_t, uint64_t))malloc_type_malloc(0x40uLL, 0xE0040E5DF33D6uLL);
    if (v14)
    {
      CFDictionaryRef v15 = v14;
      CFStringRef v16 = CFURLCopyFileSystemPath(a2, kCFURLPOSIXPathStyle);
      if (v16)
      {
        CFStringRef v18 = v16;
        uint64_t v24 = (CFTypeRef *)&a10;
        CFTypeRef v19 = cf1;
        if (cf1)
        {
          int v20 = 0;
          do
          {
            if (CFEqual(v19, @"force")) {
              int v20 = 0x80000;
            }
            CFStringRef v21 = v24++;
            CFTypeRef v19 = *v21;
          }
          while (*v21);
          __objc2_meth_list *v15 = a3;
          v15[1] = a4;
          if ((v20 & 0x80000) != 0)
          {
            sub_1000035CC(v13, 0, 0, 0, -1, (void (*)(uint64_t, void, uint64_t))sub_100006B78, (uint64_t)v15, v17, @"-f", (uint64_t)v18);
LABEL_20:
            CFRelease(v13);
            CFRelease(v18);
            return;
          }
        }
        else
        {
          __objc2_meth_list *v15 = a3;
          v15[1] = a4;
        }
        sub_1000035CC(v13, 0, 0, 0, -1, (void (*)(uint64_t, void, uint64_t))sub_100006B78, (uint64_t)v15, v17, (uint64_t)v18, 0);
        goto LABEL_20;
      }
      CFRelease(v13);
      free(v15);
      uint64_t v22 = 22;
    }
    else
    {
      CFRelease(v13);
      uint64_t v22 = 12;
    }
  }
  else
  {
    uint64_t v22 = 45;
  }
  if (a3)
  {
    a3(v22, (uint64_t)a4);
  }
}

void sub_1000077A4(uint64_t a1)
{
  CFAllocatorRef v2 = *(const void **)(a1 + 16);
  if (v2) {
    CFRelease(v2);
  }
  CFAllocatorRef v3 = *(const void **)(a1 + 24);
  if (v3)
  {
    CFRelease(v3);
  }
}

uint64_t sub_1000077F4(uint64_t a1, uint64_t a2)
{
  return CFEqual(*(CFTypeRef *)(a1 + 16), *(CFTypeRef *)(a2 + 16));
}

CFHashCode sub_100007800(uint64_t a1)
{
  return CFHash(*(CFTypeRef *)(a1 + 16));
}

CFStringRef sub_100007808(uint64_t a1)
{
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@", *(void *)(a1 + 16));
}

CFStringRef sub_10000784C(void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"<DAFileSystem %p [%p]>{id = %@}", a1, v2, a1[2]);
}

void sub_1000078A4(int a1, const __CFData *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 == -3)
  {
    if (a2)
    {
      CFStringRef v9 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, a2, 0x8000100u);
      if (v9)
      {
        CFStringRef v10 = v9;
        *(void *)(a3 + 72) = sub_100002BB8(kCFAllocatorDefault, v9);
        CFRelease(v10);
      }
    }
  }
  uint64_t v11 = *(void *)(a3 + 40);
  if (v11)
  {
    unsigned int v12 = *(_DWORD *)(a3 + 80);
    int v13 = *(_DWORD *)(a3 + 84);
    if ((v12 & 0x80000000) != 0 && v13 < 0)
    {
      sub_1000035CC((const __CFURL *)v11, 0, 0, 0, -1, sub_100007B00, a3, a8, @"-q", *(void *)(a3 + 24));
      return;
    }
    if (v13 >= 0) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = v12;
    }
    CFStringRef v15 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"/dev/fd/%d", v14);
    if (v15)
    {
      CFStringRef v17 = v15;
      sub_1000035CC(*(const __CFURL **)(a3 + 40), 0, 0, 0, v14, sub_100007B00, a3, v16, @"-q", (uint64_t)v15);
      CFRelease(v17);
      return;
    }
    uint64_t v11 = 12;
  }

  sub_100007B00(v11, (uint64_t)a2, a3);
}

void sub_100007A2C(uint64_t a1, void *a2)
{
  if (*(void *)a2) {
    (*(void (**)(void))a2)();
  }
  CFRelease(*((CFTypeRef *)a2 + 2));
  CFRelease(*((CFTypeRef *)a2 + 3));
  CFRelease(*((CFTypeRef *)a2 + 4));
  CFAllocatorRef v3 = (const void *)*((void *)a2 + 5);
  if (v3) {
    CFRelease(v3);
  }
  CFDictionaryRef v4 = (const void *)*((void *)a2 + 7);
  if (v4) {
    CFRelease(v4);
  }
  CFURLRef v5 = (const void *)*((void *)a2 + 8);
  if (v5) {
    CFRelease(v5);
  }
  CFURLRef v6 = (const void *)*((void *)a2 + 9);
  if (v6) {
    CFRelease(v6);
  }
  int v7 = *((_DWORD *)a2 + 20);
  if (v7 != -1) {
    close(v7);
  }
  int v8 = *((_DWORD *)a2 + 21);
  if (v8 != -1) {
    close(v8);
  }

  free(a2);
}

void sub_100007B00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(a3 + 48) = a1;
  sub_100008B68(" fsck status %d %@", a1, *(void *)(a3 + 24));
  *(void *)(a3 + 64) = _FSCopyNameForVolumeFormatAtNode(*(const __CFString **)(a3 + 24));

  sub_100007A2C(0, (void *)a3);
}

uint64_t sub_100007B64(const char *a1, void *a2, int a3)
{
  int v6 = getfsstat(0, 0, 2);
  if (v6 < 1) {
    return 0xFFFFFFFFLL;
  }
  int v7 = 2168 * v6;
  int v8 = (statfs *)malloc_type_malloc(2168 * v6, 0x100004087E0324AuLL);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  CFStringRef v9 = v8;
  int v10 = getfsstat(v8, v7, a3);
  if (v10 < 1)
  {
    uint64_t v13 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v11 = v10;
    f_mntonname = v9->f_mntonname;
    uint64_t v13 = 0xFFFFFFFFLL;
    do
    {
      if (!strcmp(f_mntonname, a1))
      {
        memcpy(a2, f_mntonname - 88, 0x878uLL);
        int v14 = *((_DWORD *)f_mntonname - 8);
        uint64_t v13 = 0;
        if (v14 == geteuid()) {
          break;
        }
      }
      f_mntonname += 2168;
      --v11;
    }
    while (v11);
  }
  free(v9);
  return v13;
}

uint64_t sub_100007C60(const __CFArray *a1, const void *a2)
{
  v4.length = CFArrayGetCount(a1);
  v4.location = 0;

  return CFArrayContainsValue(a1, v4, a2);
}

BOOL sub_100007CA8(const __CFArray *a1, const __CFString *a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1)
  {
    return 0;
  }
  else
  {
    CFIndex v5 = Count;
    CFIndex v6 = 0;
    BOOL v7 = 1;
    do
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v6);
      CFTypeID v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFStringGetTypeID() && CFStringCompare(ValueAtIndex, a2, 1uLL) == kCFCompareEqualTo) {
        break;
      }
      BOOL v7 = v5 > ++v6;
    }
    while (v5 != v6);
  }
  return v7;
}

void sub_100007D50(const __CFArray *a1, const void *a2)
{
  v6.length = CFArrayGetCount(a1);
  v6.location = 0;
  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(a1, v6, a2);
  if (FirstIndexOfValue != -1)
  {
    CFArrayRemoveValueAtIndex(a1, FirstIndexOfValue);
  }
}

vm_address_t sub_100007DB8(const __CFData *a1, unsigned int *a2)
{
  vm_address_t address = 0;
  unsigned int Length = CFDataGetLength(a1);
  *a2 = Length;
  vm_allocate(mach_task_self_, &address, Length, 1);
  CFIndex v5 = (void *)address;
  if (!address) {
    return 0;
  }
  BytePtr = CFDataGetBytePtr(a1);
  memmove(v5, BytePtr, *a2);
  return address;
}

CFNumberRef sub_100007E44(const __CFDictionary *a1, const void *a2)
{
  uint64_t valuePtr = 0;
  CFNumberRef result = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

void sub_100007E7C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  CFAllocatorRef v5 = CFGetAllocator(a1);
  CFNumberRef v6 = CFNumberCreate(v5, kCFNumberSInt64Type, &valuePtr);
  if (v6)
  {
    CFNumberRef v7 = v6;
    CFDictionarySetValue((CFMutableDictionaryRef)a1, a2, v6);
    CFRelease(v7);
  }
}

CFNumberRef sub_100007EE4(const __CFAllocator *a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  return CFNumberCreate(a1, kCFNumberSInt64Type, &valuePtr);
}

CFNumberRef sub_100007F10(const __CFNumber *result)
{
  uint64_t valuePtr = 0;
  if (result)
  {
    CFNumberRef v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
      return (const __CFNumber *)valuePtr;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

UInt8 *sub_100007F70(const __CFString *a1)
{
  if (!a1) {
    return 0;
  }
  CFIndex maxBufLen = 0;
  CFIndex Length = CFStringGetLength(a1);
  v6.location = 0;
  v6.length = Length;
  if (!CFStringGetBytes(a1, v6, 0x8000100u, 0, 0, 0, 0, &maxBufLen)) {
    return 0;
  }
  CFAllocatorRef v3 = (UInt8 *)malloc_type_malloc(maxBufLen + 1, 0xF4C2DB0DuLL);
  if (v3)
  {
    v7.location = 0;
    v7.length = Length;
    CFStringGetBytes(a1, v7, 0x8000100u, 0, 0, v3, maxBufLen, 0);
    v3[maxBufLen] = 0;
  }
  return v3;
}

UInt8 *sub_100008040(const __CFURL *a1)
{
  if (!a1) {
    return 0;
  }
  CFStringRef v1 = CFURLCopyFileSystemPath(a1, kCFURLPOSIXPathStyle);
  if (!v1) {
    return 0;
  }
  CFStringRef v2 = v1;
  CFAllocatorRef v3 = sub_100007F70(v1);
  CFRelease(v2);
  return v3;
}

const char *sub_10000808C(unsigned int a1)
{
  if (a1 > 0x11) {
    return "Unknown Kind";
  }
  else {
    return (&off_100021028)[a1];
  }
}

CFMutableDataRef sub_1000080B0(const __CFAllocator *a1)
{
  CFMutableDataRef Mutable = CFDataCreateMutable(a1, 0);
  if (Mutable && !__CFBinaryPlistWriteToStream())
  {
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

CFMutableDataRef sub_100008100(const __CFAllocator *a1, CFDictionaryRef theDict)
{
  if (!theDict) {
    return 0;
  }
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(a1, 0, theDict);
  if (!MutableCopy) {
    return 0;
  }
  CFAllocatorRef v5 = MutableCopy;
  CFUUIDRef Value = (const __CFUUID *)CFDictionaryGetValue(theDict, @"DAMediaUUID");
  if (Value)
  {
    CFStringRef v7 = CFUUIDCreateString(a1, Value);
    if (v7)
    {
      CFStringRef v8 = v7;
      CFDictionarySetValue(v5, @"DAMediaUUID", v7);
      CFRelease(v8);
    }
  }
  CFURLRef v9 = (const __CFURL *)CFDictionaryGetValue(theDict, @"DAVolumePath");
  if (v9)
  {
    CFStringRef v10 = CFURLCopyFileSystemPath(v9, kCFURLPOSIXPathStyle);
    if (v10)
    {
      CFStringRef v11 = v10;
      CFDictionarySetValue(v5, @"DAVolumePath", v10);
      CFRelease(v11);
    }
  }
  CFUUIDRef v12 = (const __CFUUID *)CFDictionaryGetValue(theDict, @"DAVolumeUUID");
  if (v12)
  {
    CFStringRef v13 = CFUUIDCreateString(a1, v12);
    if (v13)
    {
      CFStringRef v14 = v13;
      CFDictionarySetValue(v5, @"DAVolumeUUID", v13);
      CFRelease(v14);
    }
  }
  CFMutableDataRef v15 = sub_1000080B0(a1);
  CFRelease(v5);
  return v15;
}

CFPropertyListRef sub_100008230(const __CFAllocator *a1, const __CFData *a2)
{
  return CFPropertyListCreateWithData(a1, a2, 0, 0, 0);
}

__CFDictionary *sub_100008240(const __CFAllocator *a1, const __CFData *a2)
{
  CFDictionaryRef v3 = (const __CFDictionary *)CFPropertyListCreateWithData(a1, a2, 1uLL, 0, 0);
  CFRange v4 = v3;
  if (v3)
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v3, @"DAMediaUUID");
    if (Value)
    {
      CFUUIDRef v6 = CFUUIDCreateFromString(a1, Value);
      if (v6)
      {
        CFUUIDRef v7 = v6;
        CFDictionarySetValue(v4, @"DAMediaUUID", v6);
        CFRelease(v7);
      }
    }
    CFStringRef v8 = (const __CFString *)CFDictionaryGetValue(v4, @"DAVolumePath");
    if (v8)
    {
      CFURLRef v9 = CFURLCreateWithFileSystemPath(a1, v8, kCFURLPOSIXPathStyle, 1u);
      if (v9)
      {
        CFURLRef v10 = v9;
        CFDictionarySetValue(v4, @"DAVolumePath", v9);
        CFRelease(v10);
      }
    }
    CFStringRef v11 = (const __CFString *)CFDictionaryGetValue(v4, @"DAVolumeUUID");
    if (v11)
    {
      CFUUIDRef v12 = CFUUIDCreateFromString(a1, v11);
      if (v12)
      {
        CFUUIDRef v13 = v12;
        CFDictionarySetValue(v4, @"DAVolumeUUID", v12);
        CFRelease(v13);
      }
    }
  }
  return v4;
}

__CFDictionary *sub_100008358(const __CFAllocator *a1, const UInt8 *a2, CFIndex a3)
{
  if (!a2) {
    return 0;
  }
  CFDataRef v4 = CFDataCreateWithBytesNoCopy(a1, a2, a3, kCFAllocatorNull);
  if (!v4) {
    return 0;
  }
  CFDataRef v5 = v4;
  CFUUIDRef v6 = sub_100008240(a1, v4);
  CFRelease(v5);
  return v6;
}

CFPropertyListRef sub_1000083B8(const __CFAllocator *a1, const UInt8 *a2, CFIndex a3)
{
  if (!a2) {
    return 0;
  }
  CFDataRef v4 = CFDataCreateWithBytesNoCopy(a1, a2, a3, kCFAllocatorNull);
  if (!v4) {
    return 0;
  }
  CFDataRef v5 = v4;
  CFPropertyListRef v6 = CFPropertyListCreateWithData(a1, v4, 0, 0, 0);
  CFRelease(v5);
  return v6;
}

char *sub_100008424(uint64_t a1)
{
  CFDictionaryRef v3 = 0;
  if (!strcmp((const char *)(a1 + 72), "lifs") && (__strlcpy_chk(), !sub_100008520(v5, v4, 1024)))
  {
    asprintf(&v3, "/dev/%s");
  }
  else if (!strncmp((const char *)(a1 + 1112), "/dev/", 5uLL))
  {
    asprintf(&v3, "%s");
  }
  else
  {
    asprintf(&v3, "%s?owner=%u");
  }
  return v3;
}

uint64_t sub_100008520(char *a1, char *a2, int a3)
{
  CFPropertyListRef v6 = strstr(a1, "://");
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  CFUUIDRef v7 = v6;
  if (!strncmp(a1, "apfs", 4uLL)) {
    return 0xFFFFFFFFLL;
  }
  CFStringRef v8 = v7 + 3;
  CFURLRef v9 = strrchr(v8, 47);
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  char *v9 = 0;
  strlcpy(a2, v8, a3);
  return 0;
}

char *sub_1000085B0(uint64_t a1)
{
  if (!strcmp((const char *)(a1 + 72), "lifs") && (__strlcpy_chk(), !sub_100008520(v4, v3, 1024)))
  {
    snprintf(byte_100024D78, 0x411uLL, "/dev/%s");
  }
  else if (!strncmp((const char *)(a1 + 1112), "/dev/", 5uLL))
  {
    snprintf(byte_100024D78, 0x411uLL, "%s");
  }
  else
  {
    snprintf(byte_100024D78, 0x411uLL, "%s?owner=%u");
  }
  return byte_100024D78;
}

uint64_t sub_1000086C4(uint64_t a1, char *a2, int a3)
{
  __strlcpy_chk();
  CFDataRef v5 = strstr(__s1, "://");
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  CFPropertyListRef v6 = v5 + 3;
  CFUUIDRef v7 = strrchr(v5 + 3, 47);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  char *v7 = 0;
  strlcpy(a2, "/dev/", a3);
  strlcat(a2, v6, a3);
  return 0;
}

void sub_100008798(char *cStr, ...)
{
  va_start(va, cStr);
  sub_1000087CC(5, cStr, va);
}

void sub_1000087CC(int a1, char *cStr, va_list a3)
{
  if (a3) {
    CFDataRef v4 = (const char *)sub_10000282C(cStr, a3);
  }
  else {
    CFDataRef v4 = strdup(cStr);
  }
  CFDataRef v5 = (char *)v4;
  if (v4)
  {
    switch(a1)
    {
      case 3:
        CFURLRef v9 = qword_1000251B8;
        if (os_log_type_enabled((os_log_t)qword_1000251B8, OS_LOG_TYPE_ERROR)) {
          sub_10001A604((uint64_t)v5, v9);
        }
        goto LABEL_24;
      case 6:
        if (byte_100025190 && qword_100025198) {
          sub_100008C38(v4);
        }
        uint64_t v10 = qword_1000251B8;
        if (!os_log_type_enabled((os_log_t)qword_1000251B8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_24;
        }
        int v11 = 136446210;
        CFUUIDRef v12 = v5;
        break;
      case 7:
        if (byte_100025190)
        {
          if (qword_100025198) {
            sub_100008C38(v4);
          }
        }
        uint64_t v6 = qword_1000251B8;
        if (!os_log_type_enabled((os_log_t)qword_1000251B8, OS_LOG_TYPE_INFO)) {
          goto LABEL_24;
        }
        int v11 = 136446210;
        CFUUIDRef v12 = v5;
        CFUUIDRef v7 = v6;
        os_log_type_t v8 = OS_LOG_TYPE_INFO;
        goto LABEL_23;
      default:
        uint64_t v10 = qword_1000251B8;
        if (!os_log_type_enabled((os_log_t)qword_1000251B8, OS_LOG_TYPE_DEFAULT))
        {
LABEL_24:
          free(v5);
          return;
        }
        int v11 = 136446210;
        CFUUIDRef v12 = v5;
        break;
    }
    CFUUIDRef v7 = v10;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%{public}s", (uint8_t *)&v11, 0xCu);
    goto LABEL_24;
  }
}

void sub_100008998()
{
  byte_100025190 = 0;
  if (qword_100025198)
  {
    fclose((FILE *)qword_100025198);
    qword_100025198 = 0;
  }

  closelog();
}

void sub_1000089E0(char *cStr, ...)
{
  va_start(va, cStr);
  if (byte_1000251A0 == 1)
  {
    CFStringRef v2 = (char *)qword_1000251A8;
    if (!qword_1000251A8) {
      sub_10001A67C();
    }
    if (qword_1000251B0) {
      free((void *)qword_1000251B0);
    }
    qword_1000251B0 = (uint64_t)v2;
    qword_1000251A8 = 0;
    byte_1000251A0 = 0;
    sub_1000087CC(7, v2, 0);
  }
  sub_1000087CC(7, cStr, va);
}

void sub_100008A7C(char *cStr, ...)
{
  va_start(va, cStr);
  if (qword_1000251A8)
  {
    free((void *)qword_1000251A8);
    qword_1000251A8 = 0;
    byte_1000251A0 = 0;
  }
  if (cStr)
  {
    CFStringRef v2 = sub_10000282C(cStr, va);
    if (v2)
    {
      CFDictionaryRef v3 = v2;
      if (qword_1000251B0 && !strcmp((const char *)qword_1000251B0, (const char *)v2))
      {
        free(v3);
      }
      else
      {
        qword_1000251A8 = (uint64_t)v3;
        byte_1000251A0 = 1;
      }
    }
  }
}

void sub_100008B14(char *cStr, ...)
{
  va_start(va, cStr);
  sub_1000087CC(7, cStr, va);
  sub_1000087CC(3, cStr, va);
}

void sub_100008B68(char *cStr, ...)
{
  va_start(va, cStr);
  sub_1000087CC(6, cStr, va);
}

void sub_100008B9C(const char *a1, int a2)
{
  qword_1000251B8 = (uint64_t)os_log_create("com.apple.DiskArbitration.diskarbitrationd", "default");
  openlog(a1, 1, 24);
  if (a2)
  {
    __filename = 0;
    asprintf(&__filename, "/var/log/%s.log", a1);
    if (__filename)
    {
      qword_100025198 = (uint64_t)fopen(__filename, "a");
      free(__filename);
    }
  }
  byte_100025190 = a2;
}

uint64_t sub_100008C38(const char *a1)
{
  time_t v4 = time(0);
  CFStringRef v2 = localtime(&v4);
  if (strftime(v5, 0xAuLL, "%T ", v2)) {
    fputs(v5, (FILE *)qword_100025198);
  }
  fputs(a1, (FILE *)qword_100025198);
  fputc(10, (FILE *)qword_100025198);
  return fflush((FILE *)qword_100025198);
}

uint64_t sub_100008CEC(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 16);
  id v4 = *(id *)(a1 + 40);
  CFDataRef v5 = *(void **)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = v5;
  if (objc_opt_class())
  {
    os_log_type_t v8 = objc_opt_new();
    CFURLRef v9 = [v8 tokenWithRuid:dword_1000252A4];

    if (v9) {
      [v9 audit_token];
    }
    else {
      memset(v12, 0, sizeof(v12));
    }
    uint64_t v10 = (uint64_t)+[FSKitDiskArbHelper DAMountUserFSVolume:v2 deviceName:v3 mountPoint:v4 volumeName:v7 auditToken:v12 mountOptions:v6];
  }
  else
  {
    sub_100008B14("Attempt to use FSKit, when not present, to mount volume of type %@", v2);
    uint64_t v10 = 43;
  }

  return v10;
}

uint64_t sub_100008E20(const char *a1, int a2)
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.filesystems.userfs_helper", 0, 0);
  if (!mach_service) {
    sub_10001A6A8();
  }
  CFDataRef v5 = mach_service;
  if (xpc_get_type(mach_service) != (xpc_type_t)&_xpc_type_connection) {
    sub_10001A6D4();
  }
  xpc_connection_set_event_handler(v5, &stru_1000210D8);
  xpc_connection_resume(v5);
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "path", a1);
  xpc_dictionary_set_int64(v6, "flags", a2);
  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v5, v6);
  os_log_type_t v8 = v7;
  if (!v7)
  {
    CFURLRef v9 = "NULL";
    goto LABEL_7;
  }
  if (xpc_get_type(v7) != (xpc_type_t)&_xpc_type_dictionary)
  {
    CFURLRef v9 = xpc_copy_description(v8);
LABEL_7:
    sub_100008B68("open:invalidReply:%{public}s", v9);
    uint64_t v10 = 0xFFFFFFFFLL;
    LODWORD(int64) = 5;
    goto LABEL_8;
  }
  uint64_t v10 = xpc_dictionary_dup_fd(v8, "fd");
  if ((v10 & 0x80000000) == 0) {
    goto LABEL_9;
  }
  int64_t int64 = xpc_dictionary_get_int64(v8, "error");
  sub_100008B68("open:error:%d", int64);
  if (!int64) {
    LODWORD(int64) = 5;
  }
LABEL_8:
  *__error() = int64;
LABEL_9:
  xpc_connection_cancel(v5);

  return v10;
}

void start(int a1, char **a2)
{
  qword_100025310 = (uint64_t)basename(*a2);
  if (!geteuid())
  {
    while (1)
    {
      int v4 = getopt(a1, a2, "d") << 24;
      if (v4 != 1677721600) {
        break;
      }
      byte_1000251C0 = 1;
    }
    if (v4 == -16777216)
    {
      signal(15, (void (__cdecl *)(int))sub_1000090E8);
      CFDataRef v5 = sub_100012CBC();
      dispatch_async_and_wait_f(v5, 0, (dispatch_function_t)sub_100009100);
      dispatch_main();
    }
    fprintf(__stderrp, "%s: [-d]\n", (const char *)qword_100025310);
    fwrite("options:\n", 9uLL, 1uLL, __stderrp);
    fwrite("\t-d\tenable debugging\n", 0x15uLL, 1uLL, __stderrp);
    exit(64);
  }
  fprintf(__stderrp, "%s: permission denied.\n", (const char *)qword_100025310);
  exit(77);
}

uint64_t sub_1000090E8(uint64_t result)
{
  if (result == 15) {
    byte_1000252B8 = 1;
  }
  return result;
}

uint64_t sub_100009100()
{
  sub_100005974();
  sub_100006664();
  sub_100012FEC();
  qword_100025290 = (uint64_t)CFURLCreateWithFileSystemPath(kCFAllocatorDefault, @"/System/Library/Frameworks/DiskArbitration.framework", kCFURLPOSIXPathStyle, 1u);
  if (!qword_100025290) {
    sub_10001A700();
  }
  sub_100008B9C((const char *)qword_100025310, byte_1000251C0);
  dword_100025308 = getpid();
  asprintf((char **)&qword_100025318, "%s [%d]", (const char *)qword_100025310, dword_100025308);
  if (!qword_100025318) {
    sub_10001A72C();
  }
  qword_1000252B0 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!qword_1000252B0) {
    sub_10001A758();
  }
  qword_1000252C0 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!qword_1000252C0) {
    sub_10001A784();
  }
  qword_1000252C8 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!qword_1000252C8) {
    sub_10001A7B0();
  }
  qword_1000252E8 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!qword_1000252E8) {
    sub_10001A7DC();
  }
  qword_1000252F0 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!qword_1000252F0) {
    sub_10001A808();
  }
  qword_1000252F8 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!qword_1000252F8) {
    sub_10001A834();
  }
  qword_100025300 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!qword_100025300) {
    sub_10001A860();
  }
  qword_100025320 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!qword_100025320) {
    sub_10001A88C();
  }
  qword_100025328 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!qword_100025328) {
    sub_10001A8B8();
  }
  qword_100025330 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!qword_100025330) {
    sub_10001A8E4();
  }
  qword_100025338 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!qword_100025338) {
    sub_10001A910();
  }
  sub_100012D4C();
  IONotificationPortRef v0 = IONotificationPortCreate(kIOMainPortDefault);
  qword_1000252E0 = (uint64_t)v0;
  if (!v0)
  {
    sub_100008B14("could not create I/O Kit notification port.");
    goto LABEL_47;
  }
  CFStringRef v1 = v0;
  id v2 = sub_100012CBC();
  IONotificationPortSetDispatchQueue(v1, v2);
  if (!sub_100006620())
  {
    sub_100008B14("could not create file system run loop channel.");
    goto LABEL_47;
  }
  if (!sub_10001759C())
  {
    sub_100008B14("could not create thread run loop channel.");
    goto LABEL_47;
  }
  id v3 = (IONotificationPort *)qword_1000252E0;
  CFDictionaryRef v4 = IOServiceMatching("IOMedia");
  IOServiceAddMatchingNotification(v3, "IOServiceTerminate", v4, (IOServiceMatchingCallback)sub_100010AB4, 0, (io_iterator_t *)&dword_1000252D8);
  if (!dword_1000252D8)
  {
    sub_100008B14("could not create \"media disappeared\" notification.");
    goto LABEL_47;
  }
  CFDataRef v5 = (IONotificationPort *)qword_1000252E0;
  CFDictionaryRef v6 = IOServiceMatching("IOMedia");
  IOServiceAddMatchingNotification(v5, "IOServiceMatched", v6, (IOServiceMatchingCallback)sub_10000FF28, 0, (io_iterator_t *)&dword_1000252D4);
  if (!dword_1000252D4)
  {
    sub_100008B14("could not create \"media appeared\" notification.");
LABEL_47:
    exit(70);
  }
  if ((os_variant_has_factory_content() & 1) == 0) {
    sub_10000FD98();
  }
  xpc_object_t v7 = sub_100012CBC();
  os_log_type_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vfs, 0, 0x118uLL, v7);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_100009694;
  handler[3] = &unk_1000210F8;
  handler[4] = v8;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume(v8);
  snprintf(__str, 0x400uLL, "/var/run/%s.pid", (const char *)qword_100025310);
  CFURLRef v9 = fopen(__str, "w");
  if (v9)
  {
    uint64_t v10 = v9;
    fprintf(v9, "%d\n", dword_100025308);
    fclose(v10);
  }
  sub_100008B68((char *)&unk_10001D75B);
  sub_100008B68("server has been started.");
  if (qword_100025298) {
    sub_100008B68("  console user = %@ [%d].", qword_100025298, dword_1000252A4);
  }
  else {
    sub_100008B68("  console user = none.", v13, v14);
  }
  sub_100016C90();
  sub_1000148E0();
  sub_100016264();
  sub_100016658();
  sub_100016A78();
  sub_100010AB4(0, dword_1000252D8);
  sub_10000FF28(0, dword_1000252D4);
  memset(v17, 0, 512);
  if (!sub_100007B64("/", v17, 2)) {
    sub_100012A04((uint64_t)v17);
  }
  int v11 = sub_100012CBC();
  xpc_set_event_stream_handler("com.apple.iokit.matching", v11, &stru_100021138);
  return notify_post("com.apple.diskarbitrationd.launched");
}

void sub_100009694(uint64_t a1)
{
  __int16 data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  __int16 v2 = data;
  if ((data & 8) == 0)
  {
    if ((data & 0x10) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    sub_100012C30();
    if ((v2 & 0x100) == 0) {
      return;
    }
    goto LABEL_7;
  }
  sub_100012AF0();
  if ((v2 & 0x10) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v2 & 0x100) == 0) {
    return;
  }
LABEL_7:

  sub_100012C30();
}

void sub_1000096F4(id a1, void *a2)
{
}

void sub_100009700(uint64_t a1, const void *a2, void (*a3)(void, void, void), uint64_t a4, int a5, int a6, int a7, int a8)
{
  sub_100009724(a1, a2, a3, a4, a5, a6, a7, a8, 0, v8);
}

void sub_100009724(uint64_t a1, const void *a2, void (*a3)(void, void, void), uint64_t a4, int a5, int a6, int a7, int a8, const __CFString *cf1, uint64_t a10)
{
  uint64_t v14 = sub_10000588C(a1);
  if (a2) {
    CFRetain(a2);
  }
  long long v93 = 0;
  CFMutableDataRef v15 = malloc_type_malloc(0x68uLL, 0x10E004037EEB672uLL);
  if (!v15)
  {
    CFMutableStringRef Mutable = 0;
    uint64_t v23 = 12;
    if (a2) {
      goto LABEL_89;
    }
    goto LABEL_90;
  }
  uint64_t v16 = (uint64_t)v15;
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  if (!Mutable)
  {
    uint64_t v23 = 12;
    goto LABEL_88;
  }
  uint64_t v87 = a4;
  uint64_t v88 = v14;
  CFStringRef v18 = a3;
  CFTypeRef cf = (CFTypeRef)a1;
  CFTypeRef v19 = a2;
  CFBooleanRef v20 = kCFBooleanTrue;
  long long v93 = (const __CFString **)&a10;
  CFStringRef v21 = cf1;
  if (cf1)
  {
    CFBooleanRef v89 = 0;
    int v91 = 0;
    do
    {
      if (CFEqual(v21, @"force"))
      {
        int v91 = 1;
      }
      else if (CFEqual(v21, @"automatic"))
      {
        CFBooleanRef v20 = 0;
        CFBooleanRef v89 = kCFBooleanTrue;
      }
      else
      {
        CFStringAppend(Mutable, v21);
        CFStringAppend(Mutable, @",");
      }
      uint64_t v22 = v93++;
      CFStringRef v21 = *v22;
    }
    while (*v22);
  }
  else
  {
    int v91 = 0;
    CFBooleanRef v89 = 0;
  }
  CFStringTrim(Mutable, @",");
  uint64_t v24 = (unsigned char *)v16;
  *(unsigned char *)uint64_t v16 = v20 == 0;
  a2 = v19;
  a3 = v18;
  if (sub_100005828((uint64_t)cf, @"DADeviceTDMLocked") == kCFBooleanTrue)
  {
    if (!sub_100017218((uint64_t)cf, 16))
    {
      uint64_t v23 = 1;
      goto LABEL_87;
    }
    uint64_t v24 = (unsigned char *)v16;
    if (!sub_10000A7B4((uint64_t)cf, @"PreBoot"))
    {
      uint64_t v23 = 1;
      goto LABEL_88;
    }
  }
  uint64_t v16 = (uint64_t)v24;
  if (*v24 == 1)
  {
    if (sub_100017218((uint64_t)cf, 16))
    {
      int v25 = sub_10000A7B4((uint64_t)cf, @"System");
      io_registry_entry_t v26 = sub_100005820((uint64_t)cf);
      CFTypeRef v27 = IORegistryEntrySearchCFProperty(v26, "IOService", @"Role", kCFAllocatorDefault, 0);
      if (v27) {
        CFRelease(v27);
      }
      if (v25)
      {
        CFStringInsert(Mutable, 0, @",");
        CFStringInsert(Mutable, 0, @"rdonly");
      }
    }
    if (*(unsigned char *)v16 == 1 && sub_100005940((uint64_t)cf, 64))
    {
      CFStringInsert(Mutable, 0, @",");
      CFStringInsert(Mutable, 0, @"quarantine");
    }
  }
  if (sub_10000A1E4(Mutable, @"update"))
  {
    if (a2) {
      goto LABEL_35;
    }
    CFStringRef v28 = sub_100005828((uint64_t)cf, @"DAVolumePath");
    a2 = v28;
    if (!v28) {
      goto LABEL_35;
    }
    CFRetain(v28);
  }
  if (sub_10000A1E4(Mutable, @"-s="))
  {
    if (!a2 || (uint64_t v29 = (uint64_t)sub_100005828((uint64_t)cf, @"DAVolumePath")) == 0)
    {
LABEL_35:
      uint64_t v23 = 22;
LABEL_87:
      a4 = v87;
      goto LABEL_88;
    }
  }
  else
  {
    uint64_t v29 = sub_100005884((uint64_t)cf);
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000252E8);
  long long v86 = a2;
  uint64_t v85 = v29;
  if (Count < 1) {
    goto LABEL_65;
  }
  CFIndex v31 = Count;
  uint64_t v84 = v16;
  CFIndex v32 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000252E8, v32);
    if (!ValueAtIndex) {
      goto LABEL_50;
    }
    CFDictionaryRef v34 = ValueAtIndex;
    CFStringRef Value = CFDictionaryGetValue(ValueAtIndex, @"DAProbeID");
    int v36 = CFDictionaryGetValue(v34, @"DAProbeKind");
    if (v36)
    {
      int v37 = v36;
      int v38 = sub_100006624(v14);
      if (!CFEqual(v37, v38)) {
        goto LABEL_50;
      }
    }
    CFTypeID v39 = CFGetTypeID(Value);
    if (v39 == CFUUIDGetTypeID())
    {
      uint64_t v40 = (uint64_t)cf;
      CFStringRef v41 = @"DAVolumeUUID";
      goto LABEL_49;
    }
    CFTypeID v42 = CFGetTypeID(Value);
    if (v42 != CFStringGetTypeID()) {
      break;
    }
    uint64_t v40 = (uint64_t)cf;
    CFStringRef v41 = @"DAVolumeName";
LABEL_49:
    if (!sub_10000445C(v40, v41, Value)) {
      goto LABEL_54;
    }
LABEL_50:
    if (v31 == ++v32) {
      goto LABEL_64;
    }
  }
  CFTypeID v43 = CFGetTypeID(Value);
  if (v43 != CFDictionaryGetTypeID()) {
    goto LABEL_50;
  }
  BOOLean_t matches = 0;
  io_service_t v44 = sub_100005820((uint64_t)cf);
  IOServiceMatchPropertyTable(v44, (CFDictionaryRef)Value, &matches);
  if (!matches) {
    goto LABEL_50;
  }
LABEL_54:
  if (!v20)
  {
    CFBooleanRef v20 = (const __CFBoolean *)CFDictionaryGetValue(v34, @"DAMountAutomatic");
    if (v20 == kCFBooleanTrue)
    {
      sub_100005EBC((uint64_t)cf, 16, 1);
      sub_100005EBC((uint64_t)cf, 32, 1);
      CFBooleanRef v20 = kCFBooleanTrue;
    }
  }
  CFStringRef v45 = (const __CFString *)CFDictionaryGetValue(v34, @"DAMountOptions");
  if (v45)
  {
    CFStringRef v46 = v45;
    CFStringInsert(Mutable, 0, @",");
    CFStringInsert(Mutable, 0, v46);
  }
  if (!a2)
  {
    v47 = CFDictionaryGetValue(v34, @"DAMountPath");
    if (v47)
    {
      long long v86 = v47;
      CFRetain(v47);
    }
    else
    {
      long long v86 = 0;
    }
  }
LABEL_64:
  uint64_t v16 = v84;
LABEL_65:
  CFIndex v48 = CFArrayGetCount((CFArrayRef)qword_1000252F0);
  if (v48 >= 1)
  {
    CFIndex v49 = v48;
    CFIndex v50 = 0;
    while (1)
    {
      CFDictionaryRef v51 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000252F0, v50);
      if (v51)
      {
        CFDictionaryRef v52 = v51;
        v53 = CFDictionaryGetValue(v51, @"DAProbeID");
        if (!sub_10000445C((uint64_t)cf, @"DAVolumeUUID", v53)) {
          break;
        }
      }
      if (v49 == ++v50) {
        goto LABEL_73;
      }
    }
    CFStringRef v54 = (const __CFString *)CFDictionaryGetValue(v52, @"DAMountOptions");
    if (v54)
    {
      CFStringRef v55 = v54;
      CFStringInsert(Mutable, 0, @",");
      CFStringInsert(Mutable, 0, v55);
    }
  }
LABEL_73:
  a3 = v18;
  if (!v20)
  {
    if (sub_100005940((uint64_t)cf, 16)) {
      CFBooleanRef v20 = sub_100005940((uint64_t)cf, 32) ? kCFBooleanTrue : 0;
    }
    else {
      CFBooleanRef v20 = kCFBooleanFalse;
    }
    if (!v20 && !byte_100025340)
    {
      if (sub_10000A530((uint64_t)cf, 0))
      {
        sub_100008B68(" No console users yet, delaying mount of %@", cf);
        CFBooleanRef v20 = kCFBooleanFalse;
      }
      else
      {
        CFBooleanRef v20 = 0;
      }
    }
  }
  a2 = v86;
  if (v20 == kCFBooleanFalse)
  {
    uint64_t v23 = 89;
    goto LABEL_87;
  }
  if (sub_100005828((uint64_t)cf, @"DAMediaWritable") == kCFBooleanFalse)
  {
    CFStringInsert(Mutable, 0, @",");
    CFStringInsert(Mutable, 0, @"rdonly");
  }
  CFBooleanRef v56 = v89;
  if (!sub_10000A530((uint64_t)cf, 1))
  {
    CFStringInsert(Mutable, 0, @",");
    CFStringInsert(Mutable, 0, @"nosuid");
    CFStringInsert(Mutable, 0, @",");
    CFStringInsert(Mutable, 0, @"noowners");
    CFStringInsert(Mutable, 0, @",");
    CFStringInsert(Mutable, 0, @"nodev");
  }
  CFNumberRef v57 = sub_100006624(v88);
  a4 = v87;
  if (CFEqual(v57, @"hfs"))
  {
    sub_100002948(Mutable, 0, @"-m=%o,", v58, v59, v60, v61, v62, 237);
    if (sub_10000595C((uint64_t)cf)) {
      char v68 = sub_10000595C((uint64_t)cf);
    }
    else {
      char v68 = 99;
    }
    sub_100002948(Mutable, 0, @"-g=%d,", v63, v64, v65, v66, v67, v68);
    if (sub_100005964((uint64_t)cf)) {
      char v74 = sub_100005964((uint64_t)cf);
    }
    else {
      char v74 = 99;
    }
    sub_100002948(Mutable, 0, @"-u=%d,", v69, v70, v71, v72, v73, v74);
  }
  CFStringTrim(Mutable, @",");
  sub_100008B68(" Mount options %@", Mutable);
  if (!v89 && (CFBooleanRef v56 = kCFBooleanTrue, sub_10000A1E4(Mutable, @"rdonly")) || v56 == kCFBooleanFalse)
  {
    CFBooleanRef v56 = kCFBooleanFalse;
    if (sub_100005940((uint64_t)cf, 2) && !v91)
    {
      uint64_t v23 = 92;
      a3 = v18;
      goto LABEL_88;
    }
  }
  if (v56 == kCFBooleanTrue)
  {
    if (sub_100005940((uint64_t)cf, 2)) {
      CFBooleanRef v56 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v56 = kCFBooleanFalse;
    }
  }
  CFRetain(cf);
  *(_DWORD *)(v16 + 4) = 0;
  *(void *)(v16 + 8) = v18;
  *(void *)(v16 + 16) = v87;
  *(void *)(v16 + 24) = cf;
  *(unsigned char *)(v16 + 32) = v91;
  *(void *)(v16 + 40) = v86;
  *(void *)(v16 + 48) = Mutable;
  *(void *)(v16 + 56) = v85;
  *(void *)(v16 + 64) = 0;
  *(_DWORD *)(v16 + 72) = -1;
  if (v56 != kCFBooleanTrue)
  {
    sub_10000A8A0(89, v16);
    return;
  }
  v75 = sub_100005F14((uint64_t)cf);
  *(void *)(v16 + 64) = v75;
  if (v75)
  {
    v76 = (const char *)sub_10000580C((uint64_t)v75, 1);
    int v77 = sub_100008E20(v76, 2);
    a3 = v18;
    if (v77 != -1)
    {
      int v78 = v77;
      sub_100017434(*(void *)(v16 + 64), 1, 1);
      CFRetain(*(CFTypeRef *)(v16 + 64));
      goto LABEL_123;
    }
LABEL_126:
    uint64_t v23 = *__error();
    if (!v23) {
      return;
    }
LABEL_88:
    free((void *)v16);
    if (a2) {
LABEL_89:
    }
      CFRelease(a2);
LABEL_90:
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (a3) {
      a3(v23, 0, a4);
    }
    return;
  }
  v79 = (const char *)sub_10000580C((uint64_t)cf, 1);
  int v78 = sub_100008E20(v79, 2);
  a3 = v18;
  if (v78 == -1) {
    goto LABEL_126;
  }
LABEL_123:
  int v80 = dup(v78);
  close(v78);
  *(_DWORD *)(v16 + 72) = v80;
  sub_100008B68("repaired disk, id = %@, ongoing.", cf);
  IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", @"com.apple.DiskArbitration.diskarbitrationd", 0, 0, 0, 0.0, 0, (IOPMAssertionID *)(v16 + 4));
  *(void *)(v16 + 80) = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v81 = sub_10000588C((uint64_t)cf);
  uint64_t v82 = *(void *)(v16 + 64);
  if (!v82) {
    uint64_t v82 = (uint64_t)cf;
  }
  CFURLRef v83 = (const __CFURL *)sub_100005884(v82);
  sub_100007200(v81, v83, *(unsigned int *)(v16 + 72), sub_10000A8A0, v16);
}

BOOL sub_10000A1E4(const __CFString *a1, CFStringRef theString)
{
  if (CFStringHasPrefix(theString, @"no"))
  {
    v28.length = CFStringGetLength(theString) - 2;
    v28.location = 2;
    CFDictionaryRef v4 = CFStringCreateWithSubstring(kCFAllocatorDefault, theString, v28);
    CFDataRef v5 = &kCFBooleanFalse;
  }
  else
  {
    CFDictionaryRef v4 = CFRetain(theString);
    CFDataRef v5 = &kCFBooleanTrue;
  }
  CFBooleanRef v6 = *v5;
  if (v4)
  {
    CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, a1, @",");
    if (ArrayBySeparatingStrings)
    {
      CFArrayRef v8 = ArrayBySeparatingStrings;
      CFBooleanRef v27 = v6;
      CFIndex Count = CFArrayGetCount(ArrayBySeparatingStrings);
      if (Count >= 1)
      {
        CFIndex v10 = Count;
        CFBooleanRef v11 = 0;
        CFIndex v12 = 0;
        CFStringRef v13 = @"-s=";
        while (1)
        {
          if (!CFArrayGetValueAtIndex(v8, v12)) {
            goto LABEL_38;
          }
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v8, v12);
          CFMutableDictionaryRef MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, ValueAtIndex);
          if (!MutableCopy) {
            goto LABEL_38;
          }
          CFStringRef v16 = MutableCopy;
          CFStringLowercase(MutableCopy, 0);
          CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, v16);
          if (!Copy) {
            break;
          }
          CFStringRef v18 = Copy;
          CFStringRef v19 = v13;
          if (!CFStringHasPrefix(Copy, @"-o"))
          {
            CFRelease(v16);
LABEL_19:
            if (CFStringHasPrefix(v18, @"no"))
            {
              v30.length = CFStringGetLength(v18) - 2;
              v30.location = 2;
              uint64_t v22 = CFStringCreateWithSubstring(kCFAllocatorDefault, v18, v30);
              uint64_t v23 = &kCFBooleanFalse;
              CFStringRef v13 = v19;
              if (!v22) {
                goto LABEL_37;
              }
            }
            else
            {
              CFStringRef v13 = v19;
              if (CFStringHasPrefix(v18, v19)) {
                CFStringRef v24 = v19;
              }
              else {
                CFStringRef v24 = v18;
              }
              uint64_t v22 = CFRetain(v24);
              uint64_t v23 = &kCFBooleanTrue;
              if (!v22) {
                goto LABEL_37;
              }
            }
            CFBooleanRef v25 = *v23;
            if (CFEqual(v22, @"ro"))
            {
              CFRelease(v22);
              uint64_t v22 = CFRetain(@"rdonly");
            }
            if (CFEqual(v22, @"rw"))
            {
              CFRelease(v22);
              uint64_t v22 = CFRetain(@"rdonly");
              if (v25 == kCFBooleanTrue) {
                CFBooleanRef v25 = kCFBooleanFalse;
              }
              else {
                CFBooleanRef v25 = kCFBooleanTrue;
              }
            }
            if (v22)
            {
              if (CFEqual(v4, v22)) {
                CFBooleanRef v11 = v25;
              }
              CFRelease(v22);
            }
            CFStringRef v13 = v19;
            goto LABEL_37;
          }
          if (CFStringHasPrefix(v18, @"-o=")) {
            uint64_t v20 = 3;
          }
          else {
            uint64_t v20 = 2;
          }
          v29.length = CFStringGetLength(v18) - v20;
          v29.location = v20;
          CFStringRef v21 = CFStringCreateWithSubstring(kCFAllocatorDefault, v18, v29);
          CFRelease(v18);
          CFRelease(v16);
          CFStringRef v18 = v21;
          if (v21) {
            goto LABEL_19;
          }
          CFStringRef v13 = v19;
LABEL_38:
          if (v10 == ++v12) {
            goto LABEL_43;
          }
        }
        CFStringRef v18 = v16;
LABEL_37:
        CFRelease(v18);
        goto LABEL_38;
      }
      CFBooleanRef v11 = 0;
LABEL_43:
      CFRelease(v8);
      CFBooleanRef v6 = v27;
    }
    else
    {
      CFBooleanRef v11 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    CFBooleanRef v11 = 0;
  }
  return v6 == v11;
}

uint64_t sub_10000A528()
{
  return 0;
}

uint64_t sub_10000A530(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 0:
      CFBooleanRef v3 = (const __CFBoolean *)sub_100005828(a1, @"DAMediaRemovable");
      CFBooleanRef v4 = kCFBooleanTrue;
      if (v3 == kCFBooleanTrue)
      {
        CFBooleanRef v9 = v3;
        CFDictionaryRef v6 = (const __CFDictionary *)qword_1000252F8;
        CFStringRef v13 = (const void **)&off_100021448;
        goto LABEL_22;
      }
      CFBooleanRef v5 = (const __CFBoolean *)sub_100005828(a1, @"DADeviceInternal");
      CFDictionaryRef v6 = (const __CFDictionary *)qword_1000252F8;
      if (v5 != kCFBooleanTrue)
      {
        xpc_object_t v7 = (const void **)&off_100021438;
        goto LABEL_26;
      }
      CFBooleanRef v11 = (const void **)&off_100021440;
      goto LABEL_17;
    case 1:
      CFBooleanRef v9 = kCFBooleanTrue;
      if (sub_100005828(a1, @"DAMediaRemovable") == kCFBooleanTrue)
      {
        CFDictionaryRef v6 = (const __CFDictionary *)qword_1000252F8;
        CFBooleanRef v11 = (const void **)&off_100021460;
        goto LABEL_17;
      }
      CFBooleanRef v10 = (const __CFBoolean *)sub_100005828(a1, @"DADeviceInternal");
      CFDictionaryRef v6 = (const __CFDictionary *)qword_1000252F8;
      if (v10 != kCFBooleanTrue)
      {
        CFBooleanRef v11 = (const void **)&off_100021450;
LABEL_17:
        CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(v6, *v11);
        uint64_t v14 = &kCFBooleanFalse;
        goto LABEL_18;
      }
      CFStringRef v13 = (const void **)&off_100021458;
LABEL_22:
      CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(v6, *v13);
      if (!Value) {
        CFBooleanRef Value = v9;
      }
LABEL_28:
      if (!Value) {
        sub_10001A93C();
      }
      return CFBooleanGetValue(Value);
    case 2:
      CFDictionaryRef v6 = (const __CFDictionary *)qword_1000252F8;
      CFBooleanRef v11 = (const void **)&off_100021468;
      goto LABEL_17;
    case 3:
      CFBooleanRef v4 = kCFBooleanFalse;
      if (sub_100005828(a1, @"DADeviceInternal") == kCFBooleanFalse)
      {
        CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)qword_1000252F8, @"DAEnableUserFSMountExternal");
        uint64_t v14 = &kCFBooleanTrue;
LABEL_18:
        CFBooleanRef v15 = *v14;
        if (!Value) {
          CFBooleanRef Value = v15;
        }
      }
      else
      {
        CFBooleanRef v12 = (const __CFBoolean *)sub_100005828(a1, @"DADeviceInternal");
        CFDictionaryRef v6 = (const __CFDictionary *)qword_1000252F8;
        if (v12 == kCFBooleanTrue) {
          xpc_object_t v7 = (const void **)&off_100021478;
        }
        else {
          xpc_object_t v7 = (const void **)&off_100021480;
        }
LABEL_26:
        CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(v6, *v7);
        if (!Value) {
          CFBooleanRef Value = v4;
        }
      }
      goto LABEL_28;
    default:
      CFBooleanRef Value = kCFBooleanFalse;
      goto LABEL_28;
  }
}

uint64_t sub_10000A7B4(uint64_t a1, const __CFString *a2)
{
  io_registry_entry_t v3 = sub_100005820(a1);
  CFArrayRef v4 = (const __CFArray *)IORegistryEntrySearchCFProperty(v3, "IOService", @"Role", kCFAllocatorDefault, 0);
  if (!v4) {
    return 0;
  }
  CFArrayRef v5 = v4;
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 == CFArrayGetTypeID() && (CFIndex Count = CFArrayGetCount(v5), Count >= 1))
  {
    CFIndex v8 = Count;
    CFIndex v9 = 0;
    while (1)
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v5, v9);
      CFTypeID v11 = CFGetTypeID(ValueAtIndex);
      if (v11 == CFStringGetTypeID())
      {
        uint64_t v12 = 1;
        if (CFStringCompare(ValueAtIndex, a2, 1uLL) == kCFCompareEqualTo) {
          break;
        }
      }
      if (v8 == ++v9) {
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    uint64_t v12 = 0;
  }
  CFRelease(v5);
  return v12;
}

void sub_10000A8A0(uint64_t a1, uint64_t a2)
{
  IOPMAssertionID v4 = *(_DWORD *)(a2 + 4);
  if (v4)
  {
    IOPMAssertionRelease(v4);
    *(_DWORD *)(a2 + 4) = 0;
  }
  uint64_t v5 = *(void *)(a2 + 64);
  if (v5)
  {
    sub_100017434(v5, 1, 0);
    CFRelease(*(CFTypeRef *)(a2 + 64));
    *(void *)(a2 + 64) = 0;
  }
  int v6 = *(_DWORD *)(a2 + 72);
  if (v6 != -1) {
    close(v6);
  }
  if (a1)
  {
    if (a1 != 89)
    {
      sub_100008B68("repaired disk, id = %@, failure.", *(void *)(a2 + 24));
      sub_100008B14("unable to repair %@ (status code 0x%08X).", *(void *)(a2 + 24), a1);
      sub_10000AAE8(a1, a2);
      if (!*(unsigned char *)(a2 + 32))
      {
        int v13 = 92;
LABEL_21:
        sub_10000ABB8(v13, (void *)a2, v7, v8, v9, v10, v11, v12);
        return;
      }
    }
  }
  else
  {
    sub_100005EBC(*(void *)(a2 + 24), 2, 0);
    sub_100008B68("repaired disk, id = %@, success.", *(void *)(a2 + 24));
    sub_10000AAE8(0, a2);
  }
  if (!*(void *)(a2 + 40) && sub_10000A530(*(void *)(a2 + 24), 3) != 1)
  {
    int v13 = 28;
    goto LABEL_21;
  }
  sub_100008B68("mounted disk, id = %@, ongoing.", *(void *)(a2 + 24));
  sub_100005EBC(*(void *)(a2 + 24), 0x200000, 1);
  uint64_t v14 = *(const void **)(a2 + 40);
  if (v14) {
    CFArrayAppendValue((CFMutableArrayRef)qword_100025300, v14);
  }
  if (sub_10000A530(*(void *)(a2 + 24), 3) == 1) {
    CFStringRef v15 = @"UserFS";
  }
  else {
    CFStringRef v15 = 0;
  }
  uint64_t v16 = sub_10000588C(*(void *)(a2 + 24));
  *(unsigned char *)(a2 + 96) = sub_100006AA8(v16, v15);
  *(void *)(a2 + 88) = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v17 = sub_10000588C(*(void *)(a2 + 24));
  CFURLRef v18 = *(const __CFURL **)(a2 + 56);
  CFStringRef v19 = sub_100005828(*(void *)(a2 + 24), @"DAVolumeName");
  CFURLRef v20 = *(const __CFURL **)(a2 + 40);
  uid_t v21 = sub_100005964(*(void *)(a2 + 24));
  gid_t v22 = sub_10000595C(*(void *)(a2 + 24));
  sub_1000066BC(v17, v18, v19, v20, v21, v22, v15, sub_10000AC6C, (void (*)(CFIndex, uint64_t))a2, *(CFStringRef *)(a2 + 48), 0);
}

uint64_t sub_10000AAE8(unsigned int a1, uint64_t a2)
{
  CFNumberRef v4 = (const __CFNumber *)sub_100005828(*(void *)(a2 + 24), @"DAMediaSize");
  uint64_t v5 = sub_10000588C(*(void *)(a2 + 24));
  if (v4) {
    CFNumberRef v4 = sub_100007F10(v4);
  }
  CFStringRef v6 = @"kext";
  if (v5)
  {
    uint64_t v7 = sub_100006624(v5);
    if (sub_100006648(v5)) {
      CFStringRef v6 = @"FSKit";
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - *(void *)(a2 + 80);

  return sub_100003EE0(a1, (uint64_t)v7, (uint64_t)v6, v8, (uint64_t)v4);
}

void sub_10000ABB8(int a1, void *a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7, int a8)
{
  if (a1 == 92 && *(unsigned char *)a2)
  {
    sub_100009724(*((void *)a2 + 3), 0, *((void *)a2 + 1), *((void *)a2 + 2), a5, a6, a7, a8, @"force");
    *((void *)a2 + 1) = 0;
  }
  else
  {
    int v9 = (void (*)(void))*((void *)a2 + 1);
    if (v9) {
      v9();
    }
  }
  CFRelease(*((CFTypeRef *)a2 + 3));
  CFRelease(*((CFTypeRef *)a2 + 6));
  int v10 = (const void *)*((void *)a2 + 5);
  if (v10) {
    CFRelease(v10);
  }

  free(a2);
}

void sub_10000AC6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000588C(*(void *)(a2 + 24));
  sub_100005EBC(*(void *)(a2 + 24), 0x200000, 0);
  if (v4) {
    uint64_t v4 = (uint64_t)sub_100006624(v4);
  }
  BOOL v5 = *(unsigned char *)(a2 + 96) != 0;
  __uint64_t v6 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  sub_100003FA8(a1, v4, v5, v6 - *(void *)(a2 + 88));
  uint64_t v7 = *(const void **)(a2 + 40);
  if (v7) {
    sub_100007D50((const __CFArray *)qword_100025300, v7);
  }
  if (a1)
  {
    sub_100008B68("mounted disk, id = %@, failure.", *(void *)(a2 + 24));
    sub_100008B14("unable to mount %@ (status code 0x%08X).", *(void *)(a2 + 24), a1);
    int v14 = a1;
LABEL_7:
    sub_10000ABB8(v14, (void *)a2, v8, v9, v10, v11, v12, v13);
    return;
  }
  sub_100008B68("mounted disk, id = %@, success.", *(void *)(a2 + 24));
  if (sub_100005828(*(void *)(a2 + 24), @"DAMediaEncrypted") == kCFBooleanTrue
    && sub_10000A530(*(void *)(a2 + 24), 0))
  {
    sub_100008B68("setting uid, id = %@ %d, success.", *(void *)(a2 + 24), dword_1000252A4);
    sub_100005F04(*(void *)(a2 + 24), dword_1000252A4);
  }
  BOOL v15 = sub_100005940(*(void *)(a2 + 24), 4);
  uint64_t v16 = *(void *)(a2 + 24);
  if (!v15)
  {
    sub_100005EBC(v16, 4, 0);
    int v14 = 0;
    goto LABEL_7;
  }
  uint64_t v17 = sub_10000588C(v16);
  CFURLRef v18 = *(const __CFURL **)(a2 + 40);

  sub_100007458(v17, v18, (void (*)(uint64_t, uint64_t))sub_10000AE34, (void (*)(uint64_t, uint64_t))a2);
}

void sub_10000AE34(uint64_t a1, uint64_t *a2)
{
  if (a1) {
    sub_100008B14("unable to repair quotas on disk %@ (status code 0x%08X).", a2[3], a1);
  }
  else {
    sub_100005EBC(a2[3], 4, 0);
  }

  sub_10000ABB8(0, a2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_10000AEA0(void *a1)
{
  if (sub_100005828((uint64_t)a1, @"DAVolumePath"))
  {
    io_registry_entry_t v26 = 0;
    int v2 = getmntinfo(&v26, 2);
    if (v2 < 1)
    {
LABEL_6:
      int v7 = sub_100005828((uint64_t)a1, @"DAVolumePath");
      CFRetain(v7);
      sub_100017794((uint64_t)sub_10000B24C, (uint64_t)v7, 0, 0);
      sub_100005AC8((uint64_t)a1, 0);
      if (sub_100005828((uint64_t)a1, @"DAMediaPath"))
      {
        sub_100005C24((uint64_t)a1, @"DAVolumePath", 0);
        sub_10000CA44(a1, @"DAVolumePath");
      }
      else
      {
        sub_100008B68("removed disk, id = %@.", a1);
        sub_10000CB00(a1);
        sub_100005C24((uint64_t)a1, @"DAVolumePath", 0);
        sub_100005EBC((uint64_t)a1, 0x10000000, 1);
        sub_100007D50((const __CFArray *)qword_1000252B0, a1);
      }
      sub_1000135F4(v8);
    }
    else
    {
      unint64_t v3 = 0;
      uint64_t v4 = 2168 * v2;
      while (1)
      {
        int v5 = sub_1000085B0((uint64_t)&v26[v3 / 0x878]);
        int v6 = (const char *)sub_1000053D8((uint64_t)a1);
        if (!strcmp(v5, v6)) {
          break;
        }
        v3 += 2168;
        if (v4 == v3) {
          goto LABEL_6;
        }
      }
      CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
      if (Mutable)
      {
        BOOL v15 = Mutable;
        if (!strcmp(v26[v3 / 0x878].f_fstypename, "hfs"))
        {
          CFURLRef v16 = (const __CFURL *)sub_100005828((uint64_t)a1, @"DAVolumePath");
          CFArrayRef v17 = _FSCopyNameForVolumeFormatAtURL(v16);
          if (sub_10000445C((uint64_t)a1, @"DAVolumeType", v17))
          {
            sub_100005C24((uint64_t)a1, @"DAVolumeType", v17);
            CFArrayAppendValue(v15, @"DAVolumeType");
          }
          if (v17) {
            CFRelease(v17);
          }
        }
        size_t v18 = strlen(v26[v3 / 0x878].f_mntonname);
        CFURLRef v19 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)v26[v3 / 0x878].f_mntonname, v18, 1u);
        if (v19)
        {
          CFURLRef v20 = v19;
          if (sub_10000445C((uint64_t)a1, @"DAVolumePath", v19))
          {
            sub_100005AC8((uint64_t)a1, v20);
            sub_100005C24((uint64_t)a1, @"DAVolumePath", v20);
            sub_100008B68("volume path changed for %@", a1);
            CFArrayAppendValue(v15, @"DAVolumePath");
          }
          CFRelease(v20);
        }
        if (CFArrayGetCount(v15))
        {
          sub_100008B68("updated disk, id = %@.", a1);
          if (sub_100005940((uint64_t)a1, 0x80000)) {
            sub_10000CA44(a1, v15);
          }
        }
        goto LABEL_30;
      }
    }
  }
  else
  {
    io_registry_entry_t v26 = 0;
    int v9 = getmntinfo(&v26, 2);
    if (v9 >= 1)
    {
      unint64_t v10 = 0;
      uint64_t v11 = 2168 * v9;
      while (1)
      {
        int v12 = sub_1000085B0((uint64_t)&v26[v10 / 0x878]);
        int v13 = (const char *)sub_1000053D8((uint64_t)a1);
        if (!strcmp(v12, v13)) {
          break;
        }
        v10 += 2168;
        if (v11 == v10) {
          return 0;
        }
      }
      f_mntonname = v26[v10 / 0x878].f_mntonname;
      size_t v22 = strlen(f_mntonname);
      CFURLRef v23 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)f_mntonname, v22, 1u);
      if (v23)
      {
        BOOL v15 = v23;
        sub_100005AC8((uint64_t)a1, v23);
        sub_100005C24((uint64_t)a1, @"DAVolumePath", v15);
        sub_10000CA44(a1, @"DAVolumePath");
        sub_1000135F4(v24);
LABEL_30:
        CFRelease(v15);
      }
    }
  }
  return 0;
}

uint64_t sub_10000B24C(const void *a1)
{
  return 0;
}

uint64_t sub_10000B27C(uint64_t a1, int a2)
{
  CFURLRef v4 = (const __CFURL *)sub_100005828(a1, @"DAVolumePath");
  if (!v4) {
    return 4175036419;
  }
  CFURLRef v5 = v4;
  sub_10000588C(a1);
  int v6 = sub_100008040(v5);
  if (!v6) {
    return 49174;
  }
  int v7 = v6;
  pid_t v8 = fork();
  int v12 = v8;
  if (v8 == -1)
  {
    int v9 = *__error();
  }
  else
  {
    if (!v8)
    {
      uint64_t v11 = "-a";
      if (!a2) {
        uint64_t v11 = "-d";
      }
      execle("/usr/sbin/vsdbutil", "/usr/sbin/vsdbutil", v11, v7, 0, 0);
      exit(71);
    }
    waitpid(v8, &v12, 0);
    if ((v12 & 0x7F) != 0) {
      int v9 = v12;
    }
    else {
      int v9 = (__int16)v12 >> 8;
    }
  }
  free(v7);
  if (v9) {
    return v9 | 0xC000u;
  }
  else {
    return 0;
  }
}

uint64_t sub_10000B37C(void *a1, int a2)
{
  uint64_t v4 = 4175036417;
  CFURLRef v5 = (const __CFURL *)sub_100005828((uint64_t)a1, @"DAVolumePath");
  if (!v5) {
    return 4175036419;
  }
  CFURLRef v6 = v5;
  sub_10000588C((uint64_t)a1);
  bzero(v27, 0x878uLL);
  int v7 = sub_100008040(v6);
  if (!v7)
  {
    int v10 = 22;
    return v10 | 0xC000u;
  }
  pid_t v8 = v7;
  if (sub_100007B64((const char *)v7, v27, 2) == -1 || (pid_t v9 = fork(), v25 = v9, v9 == -1))
  {
    int v10 = *__error();
  }
  else
  {
    if (!v9)
    {
      snprintf(__str, 0x10uLL, "-o-e=%d", a2);
      CFURLRef v20 = "-onodev";
      if ((v28 & 0x10) == 0) {
        CFURLRef v20 = "-odev";
      }
      uid_t v21 = "-onoexec";
      if ((v28 & 4) == 0) {
        uid_t v21 = "-oexec";
      }
      size_t v22 = "-onosuid";
      if ((v28 & 8) == 0) {
        size_t v22 = "-osuid";
      }
      CFURLRef v23 = "-ordonly";
      if ((v28 & 1) == 0) {
        CFURLRef v23 = "-orw";
      }
      if ((v28 & 0x200000) != 0) {
        uint64_t v24 = "-onoowners";
      }
      else {
        uint64_t v24 = "-oowners";
      }
      execle("/sbin/mount", "/sbin/mount", "-t", &v29, "-u", __str, v20, v21, v22, v23, v24, &v31, &v30, 0, 0);
      exit(71);
    }
    waitpid(v9, &v25, 0);
    if ((v25 & 0x7F) != 0) {
      int v10 = v25;
    }
    else {
      int v10 = (__int16)v25 >> 8;
    }
  }
  free(v8);
  if (v10) {
    return v10 | 0xC000u;
  }
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!Mutable) {
    return 4175036421;
  }
  int v12 = Mutable;
  int v13 = sub_100005828((uint64_t)a1, @"DAVolumeName");
  if (v13 && (int v14 = v13, v15 = sub_10000588C((uint64_t)a1), (v16 = sub_100006268(v15, v6, 0)) != 0))
  {
    CFStringRef v17 = v16;
    int v18 = CFEqual(v14, v16);
    sub_100005C24((uint64_t)a1, @"DAVolumeName", v17);
    CFArrayAppendValue(v12, @"DAVolumeName");
    if (v18)
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = sub_10000A528();
      if (v4)
      {
        sub_100005AC8((uint64_t)a1, (CFTypeRef)v4);
        sub_100005C24((uint64_t)a1, @"DAVolumePath", (const void *)v4);
        CFArrayAppendValue(v12, @"DAVolumePath");
      }
    }
    sub_10000CA44(a1, v12);
    CFRelease(v12);
    CFRelease(v17);
    if (v4)
    {
      CFRelease((CFTypeRef)v4);
      return 0;
    }
  }
  else
  {
    CFRelease(v12);
  }
  return v4;
}

uint64_t sub_10000B6A8()
{
  return 0;
}

void sub_10000B6B0(int a1, void *a2)
{
  uint64_t v4 = (void *)*((void *)a2 + 1);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  CFURLRef v6 = Mutable;
  if (!a1 && Mutable)
  {
    int v7 = (const void **)(*(unsigned char *)a2 ? &kCFBooleanTrue : &kCFBooleanFalse);
    pid_t v8 = *v7;
    if (sub_10000445C((uint64_t)v4, @"DAMediaEncrypted", *v7))
    {
      sub_100005C24((uint64_t)v4, @"DAMediaEncrypted", v8);
      CFArrayAppendValue(v6, @"DAMediaEncrypted");
    }
  }
  if (CFArrayGetCount(v6))
  {
    sub_100008B68("encryption status changed, id = %@.", v4);
    if (sub_100005940((uint64_t)v4, 0x80000)) {
      sub_10000CA44(v4, v6);
    }
  }
  if (v6) {
    CFRelease(v6);
  }
  CFRelease(*((CFTypeRef *)a2 + 1));

  free(a2);
}

BOOL sub_10000B7D4(uint64_t a1)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000252B0);
  if (Count < 1) {
    return 1;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0;
  CFBooleanRef v5 = kCFBooleanTrue;
  while (1)
  {
    CFStringRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_1000252B0, v4);
    int v7 = sub_100005864(a1);
    if (v7 == sub_100005864((uint64_t)ValueAtIndex))
    {
      CFStringRef v8 = (const __CFString *)sub_100005828((uint64_t)ValueAtIndex, @"DAMediaBSDName");
      if (sub_10000586C((uint64_t)ValueAtIndex)) {
        break;
      }
      BOOL result = sub_100005940((uint64_t)ValueAtIndex, 16);
      if (!result) {
        return result;
      }
      if (sub_100005828((uint64_t)ValueAtIndex, @"DAVolumeMountable") == v5) {
        break;
      }
      if (sub_100005828((uint64_t)ValueAtIndex, @"DAMediaLeaf") == kCFBooleanFalse)
      {
        CFIndex v10 = CFArrayGetCount((CFArrayRef)qword_1000252B0);
        if (v10 < 1)
        {
          CFIndex v11 = 0;
        }
        else
        {
          CFIndex v11 = 0;
          while (1)
          {
            int v12 = CFArrayGetValueAtIndex((CFArrayRef)qword_1000252B0, v11);
            if (ValueAtIndex != v12)
            {
              CFStringRef v13 = (const __CFString *)sub_100005828((uint64_t)v12, @"DAMediaBSDName");
              if (v13)
              {
                if (CFStringHasPrefix(v13, v8)) {
                  break;
                }
              }
            }
            if (v10 == ++v11) {
              return 0;
            }
          }
        }
        BOOL v14 = v11 == v10;
        CFBooleanRef v5 = kCFBooleanTrue;
        if (v14) {
          break;
        }
      }
    }
    if (++v4 == v3) {
      return 1;
    }
  }
  return 0;
}

void sub_10000B97C(const void *a1, const void *a2, void (*a3)(uint64_t, uint64_t, void, void, void, void, uint64_t), uint64_t a4)
{
  int v7 = malloc_type_malloc(0x40uLL, 0x10A00405F83DAE1uLL);
  if (v7)
  {
    CFStringRef v8 = v7;
    CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, (CFArrayRef)qword_1000252C8);
    if (MutableCopy)
    {
      CFIndex v10 = MutableCopy;
      CFNumberRef v11 = (const __CFNumber *)sub_100005828((uint64_t)a1, @"DAMediaSize");
      if (v11 && !sub_100007F10(v11)) {
        CFArrayRemoveAllValues(v10);
      }
      CFRetain(a1);
      if (a2)
      {
        sub_100017434((uint64_t)a2, 1, 1);
        CFRetain(a2);
      }
      void *v8 = a3;
      v8[1] = a4;
      v8[2] = v10;
      void v8[3] = a1;
      v8[4] = a2;
      v8[5] = 0;
      void v8[6] = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
      *((_DWORD *)v8 + 14) = 0;
      sub_10000BB08(0xFFFFFFFFLL, 0, 0, 0, 0, (uint64_t)v8);
      return;
    }
    free(v8);
  }
  if (a3)
  {
    a3(12, -1, 0, 0, 0, 0, a4);
  }
}

void sub_10000BB08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = *(void *)(a6 + 40);
  if (!a1)
  {
    CFStringRef v17 = sub_100006624(v12);
    sub_100008B68("probed disk, id = %@, with %@, success.", *(void *)(a6 + 24), v17);
    int v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))a6;
    if (!*(void *)a6)
    {
LABEL_31:
      CFRelease(*(CFTypeRef *)(a6 + 16));
      CFRelease(*(CFTypeRef *)(a6 + 24));
      uint64_t v33 = *(void *)(a6 + 32);
      if (v33)
      {
        sub_100017434(v33, 1, 0);
        CFRelease(*(CFTypeRef *)(a6 + 32));
      }
      CFDictionaryRef v34 = *(const void **)(a6 + 40);
      if (v34) {
        CFRelease(v34);
      }
      free((void *)a6);
      return;
    }
    int v19 = 1;
LABEL_27:
    uint64_t v30 = *(void *)(a6 + 40);
    if (v19 && v30)
    {
      uint64_t v31 = sub_100006624(*(void *)(a6 + 40));
      __uint64_t v32 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
      sub_100003994(a1, (uint64_t)v31, @"kext", v32 - *(void *)(a6 + 48), a2);
      int v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))a6;
      uint64_t v30 = *(void *)(a6 + 40);
    }
    v18(a1, v30, a2, a3, a4, a5, *(void *)(a6 + 8));
    goto LABEL_31;
  }
  BOOL v41 = v12 != 0;
  if (v12)
  {
    CFStringRef v13 = sub_100006624(v12);
    sub_100008B68("probed disk, id = %@, with %@, failure.", *(void *)(a6 + 24), v13);
    if (a1 != -2) {
      sub_100008B14("unable to probe %@ (status code 0x%08X).", *(void *)(a6 + 24), a1);
    }
    CFRelease(*(CFTypeRef *)(a6 + 40));
    *(void *)(a6 + 40) = 0;
  }
  unsigned int v42 = a2;
  uint64_t v14 = a3;
  uint64_t v15 = a4;
  uint64_t v16 = a5;
  BOOL v40 = (sub_100005828(*(void *)(a6 + 24), @"DAMediaRemovable") != kCFBooleanTrue
      || sub_100005828(*(void *)(a6 + 24), @"DADeviceInternal"))
     && sub_100005828(*(void *)(a6 + 24), @"DADeviceInternal") != kCFBooleanTrue;
  if (!CFArrayGetCount(*(CFArrayRef *)(a6 + 16)))
  {
LABEL_19:
    if (!byte_100024441)
    {
      if (_os_feature_enabled_impl())
      {
        if (!*(_DWORD *)(a6 + 56))
        {
          *(_DWORD *)(a6 + 56) = 1;
          CFBooleanRef v27 = malloc_type_malloc(0x40uLL, 0x10A00405F83DAE1uLL);
          if (v27)
          {
            uint64_t v28 = (uint64_t)v27;
            CFRetain(*(CFTypeRef *)(a6 + 24));
            *(_OWORD *)uint64_t v28 = *(_OWORD *)a6;
            *(void *)(v28 + 16) = 0;
            *(_OWORD *)(v28 + 24) = *(_OWORD *)(a6 + 24);
            *(_DWORD *)(v28 + 56) = 1;
            uint64_t v29 = *(void *)(a6 + 48);
            *(void *)(v28 + 40) = 0;
            *(void *)(v28 + 48) = v29;
            sub_100015400(dword_1000252A4, v28);
          }
        }
      }
    }
    int v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))a6;
    a5 = v16;
    a4 = v15;
    a3 = v14;
    a2 = v42;
    if (!*(void *)a6 || *(_DWORD *)(a6 + 56)) {
      goto LABEL_31;
    }
    int v19 = v41;
    goto LABEL_27;
  }
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a6 + 16), 0);
    if (ValueAtIndex)
    {
      CFDictionaryRef v21 = ValueAtIndex;
      CFBooleanRef Value = CFDictionaryGetValue(ValueAtIndex, @"DAFileSystem");
      if (Value)
      {
        CFURLRef v23 = Value;
        CFDictionaryRef v24 = (const __CFDictionary *)CFDictionaryGetValue(v21, @"FSMediaProperties");
        if (v24)
        {
          CFDictionaryRef v25 = v24;
          BOOLean_t matches = 0;
          io_service_t v26 = sub_100005820(*(void *)(a6 + 24));
          IOServiceMatchPropertyTable(v26, v25, &matches);
          if (matches) {
            break;
          }
        }
      }
    }
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a6 + 16), 0);
    if (!CFArrayGetCount(*(CFArrayRef *)(a6 + 16))) {
      goto LABEL_19;
    }
  }
  CFDictionaryRef v35 = sub_100006624((uint64_t)v23);
  CFRetain(v23);
  *(void *)(a6 + 40) = v23;
  if (CFDictionaryGetValue(v21, @"autodiskmount") == kCFBooleanFalse)
  {
    sub_100005EBC(*(void *)(a6 + 24), 16, 0);
    sub_100005EBC(*(void *)(a6 + 24), 32, 0);
  }
  CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a6 + 16), 0);
  sub_100008B68("probed disk, id = %@, with %@, ongoing.", *(void *)(a6 + 24), v35);
  uint64_t v36 = *(void *)(a6 + 32);
  if (v36) {
    int v37 = (const char *)sub_10000580C(v36, 1);
  }
  else {
    int v37 = 0;
  }
  CFURLRef v38 = (const __CFURL *)sub_100005884(*(void *)(a6 + 24));
  CFTypeID v39 = (const char *)sub_10000580C(*(void *)(a6 + 24), 1);
  sub_100006BBC((uint64_t)v23, v38, v39, v37, (void (*)(uint64_t, uint64_t, void, void, void, uint64_t))sub_10000BB08, a6, v40);
}

BOOL sub_10000BF28(const void *a1, int a2)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100025328);
  if (Count < 1) {
    return 0;
  }
  CFIndex v5 = Count;
  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025328, 0);
  CFNumberRef v7 = (const __CFNumber *)sub_10000306C(ValueAtIndex);
  if (sub_100007F10(v7) != (const __CFNumber *)a2)
  {
    CFNumberRef v10 = (const __CFNumber *)a2;
    CFIndex v11 = 1;
    while (v5 != v11)
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025328, v11);
      CFNumberRef v12 = (const __CFNumber *)sub_10000306C(ValueAtIndex);
      ++v11;
      if (sub_100007F10(v12) == v10)
      {
        CFIndex v8 = v11 - 1;
        BOOL v9 = v8 < v5;
        goto LABEL_8;
      }
    }
    return 0;
  }
  CFIndex v8 = 0;
  BOOL v9 = 1;
LABEL_8:
  CFStringRef v13 = sub_100003084(ValueAtIndex);
  unsigned int v14 = sub_100003090(ValueAtIndex);
  switch(v14)
  {
    case 6u:
    case 8u:
    case 0xEu:
      goto LABEL_9;
    case 7u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
    case 0xDu:
      break;
    case 9u:
      CFNumberRef v25 = sub_100003054(ValueAtIndex);
      CFNumberRef v26 = sub_100003078(ValueAtIndex);
      unsigned int v27 = sub_100003090(ValueAtIndex);
      uint64_t v30 = sub_10000808C(v27);
      sub_1000089E0("  dispatched response, id = %016llX:%016llX, kind = %s, disk = %@.", v25, v26, v30, v13);
      break;
    default:
      if (v14 == 2)
      {
LABEL_9:
        if (a1)
        {
          CFDataRef v15 = (const __CFData *)sub_10000587C((uint64_t)v13);
          if (v15)
          {
            BytePtr = CFDataGetBytePtr(v15);
            if (!*((void *)BytePtr + 2)) {
              *((void *)BytePtr + 2) = CFRetain(a1);
            }
          }
          CFNumberRef v17 = sub_100003054(ValueAtIndex);
          CFNumberRef v18 = sub_100003078(ValueAtIndex);
          unsigned int v19 = sub_100003090(ValueAtIndex);
          CFURLRef v20 = sub_10000808C(v19);
          CFNumberRef v21 = sub_100006234((const __CFDictionary *)a1);
          sub_100008B14("  dispatched response, id = %016llX:%016llX, kind = %s, disk = %@, dissented, status = 0x%08X.", v17, v18, v20, v13, v21);
        }
        else
        {
          CFNumberRef v22 = sub_100003054(ValueAtIndex);
          CFNumberRef v23 = sub_100003078(ValueAtIndex);
          unsigned int v24 = sub_100003090(ValueAtIndex);
          uint64_t v29 = sub_10000808C(v24);
          sub_1000089E0("  dispatched response, id = %016llX:%016llX, kind = %s, disk = %@, approved.", v22, v23, v29, v13);
        }
      }
      break;
  }
  CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100025328, v8);
  sub_10000C16C(v13);
  return v9;
}

void sub_10000C16C(const void *a1)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100025328);
  if (Count < 1)
  {
    CFIndex v3 = 0;
  }
  else
  {
    CFIndex v3 = 0;
    while (1)
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025328, v3);
      if (sub_100003084(ValueAtIndex) == a1) {
        break;
      }
      if (Count == ++v3) {
        goto LABEL_8;
      }
    }
  }
  if (v3 == Count)
  {
LABEL_8:
    CFDataRef v5 = (const __CFData *)sub_10000587C((uint64_t)a1);
    BytePtr = CFDataGetBytePtr(v5);
    CFIndex v8 = *(void (**)(const void *, uint64_t))BytePtr;
    uint64_t v7 = *((void *)BytePtr + 1);
    BOOL v9 = (const void *)*((void *)BytePtr + 2);
    sub_100005BE0((uint64_t)a1, 0);
    v8(v9, v7);
    if (v9) {
      CFRelease(v9);
    }
  }
  CFIndex v10 = CFArrayGetCount((CFArrayRef)qword_100025328);
  if (v10 >= 1)
  {
    CFIndex v11 = v10;
    CFIndex v12 = 0;
    double v13 = kCFAbsoluteTimeIntervalSince1904;
    do
    {
      CFDictionaryRef v14 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025328, v12);
      if (v14)
      {
        CFDictionaryRef v15 = v14;
        uint64_t v16 = sub_1000030DC(v14);
        if (!sub_100012FB0((uint64_t)v16, 0x1000000))
        {
          double v17 = sub_1000030E8(v15) + 10.0 + 1.0;
          if (v17 < v13) {
            double v13 = v17;
          }
        }
      }
      ++v12;
    }
    while (v11 != v12);
    if (v13 < kCFAbsoluteTimeIntervalSince1904 && v13 > CFAbsoluteTimeGetCurrent())
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      dispatch_time_t v19 = dispatch_time(0, 1000000000 * (uint64_t)(v13 - Current));
      CFURLRef v20 = sub_100012CBC();
      dispatch_after(v19, v20, &stru_100021178);
    }
  }
}

void sub_10000C328(void *a1)
{
}

void sub_10000C338(int a1, void *a2, void *a3)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100025330);
  if (Count >= 1)
  {
    CFIndex v7 = Count;
    for (CFIndex i = 0; i != v7; ++i)
    {
      CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100025330, i);
      uint64_t v10 = (uint64_t)ValueAtIndex;
      if (a1 == 15)
      {
        if (!sub_100012FC8((uint64_t)ValueAtIndex, 1))
        {
          sub_10000CD3C(v10, 15, a2, a3);
          sub_1000131E0(v10, 1, 1);
        }
      }
      else
      {
        sub_10000CD3C((uint64_t)ValueAtIndex, a1, a2, a3);
      }
    }
  }
}

void sub_10000C408(void *a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4)
{
  sub_10000C45C((uint64_t)a1, a3, a4);
  sub_10000C4E4(a2, a1, 0);

  sub_10000C16C(a1);
}

void sub_10000C45C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFDataRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, 24);
  if (Mutable)
  {
    CFDataRef v7 = Mutable;
    BytePtr = (UInt8 *)CFDataGetBytePtr(Mutable);
    *((void *)BytePtr + 1) = a3;
    *((void *)BytePtr + 2) = 0;
    *(void *)BytePtr = a2;
    sub_100005BE0(a1, v7);
    CFRelease(v7);
  }
}

void sub_10000C4E4(const __CFDictionary *a1, void *a2, void *a3)
{
  CFURLRef v6 = sub_1000030DC(a1);
  sub_100008A7C("%s -> %@", qword_100025318, v6);
  if (!sub_100012FC8((uint64_t)v6, 0x10000000))
  {
    if (sub_100003054(a1))
    {
      CFDictionaryRef v7 = (const __CFDictionary *)sub_1000030B0(a1);
      if (!v7 || sub_10000599C((uint64_t)a2, v7))
      {
        switch(sub_100003090(a1))
        {
          case 0u:
          case 4u:
            CFNumberRef v26 = sub_100003048(kCFAllocatorDefault, a1);
            if (v26)
            {
              unsigned int v27 = v26;
              sub_100003164(v26, a2);
              CFMutableDataRef v28 = sub_100005904(a2);
              sub_100003134(v27, v28);
              sub_100013014((uint64_t)v6, v27);
              CFNumberRef v29 = sub_100003054(v27);
              CFNumberRef v30 = sub_100003078(v27);
              unsigned int v31 = sub_100003090(v27);
              __uint64_t v32 = sub_10000808C(v31);
              sub_1000089E0("  dispatched callback, id = %016llX:%016llX, kind = %s, disk = %@.", v29, v30, v32, a2);
              uint64_t v33 = v27;
              goto LABEL_23;
            }
            return;
          case 1u:
          case 5u:
          case 7u:
          case 0xAu:
          case 0xCu:
          case 0xDu:
          case 0x11u:
            sub_100003164(a1, a2);
            CFMutableDataRef v8 = sub_100005904(a2);
            sub_100003134(a1, v8);
            sub_10000314C(a1, a3);
            sub_100013014((uint64_t)v6, a1);
            CFNumberRef v9 = sub_100003054(a1);
            CFNumberRef v10 = sub_100003078(a1);
            unsigned int v11 = sub_100003090(a1);
            CFIndex v12 = sub_10000808C(v11);
            double v13 = v12;
            if (a3)
            {
              CFNumberRef v55 = sub_100006234((const __CFDictionary *)a3);
              sub_1000089E0("  dispatched callback, id = %016llX:%016llX, kind = %s, disk = %@, status = 0x%08X.", v9, v10, v13, a2, v55);
            }
            else
            {
              sub_1000089E0("  dispatched callback, id = %016llX:%016llX, kind = %s, disk = %@, success.", v9, v10, v12, a2);
            }
            return;
          case 2u:
            if (!sub_100012FC8((uint64_t)v6, 0x1000000))
            {
              if (a3) {
                sub_10001A968();
              }
              goto LABEL_11;
            }
            return;
          case 3u:
            if (sub_100005940((uint64_t)a2, 0x10000000)) {
              return;
            }
            CFArrayRef v40 = (const __CFArray *)sub_100003128(a1);
            if (v40)
            {
              CFArrayRef v41 = v40;
              CFArrayRef MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, (CFArrayRef)a3);
              if (MutableCopy)
              {
                CFArrayRef v43 = MutableCopy;
                sub_100002380(MutableCopy, v41);
                goto LABEL_34;
              }
            }
            else
            {
              CFArrayRef v43 = (const __CFArray *)CFRetain(a3);
              if (v43)
              {
LABEL_34:
                if (CFArrayGetCount(v43))
                {
                  CFMutableDictionaryRef v44 = sub_100003048(kCFAllocatorDefault, a1);
                  if (v44)
                  {
                    CFDictionaryRef v45 = v44;
                    CFIndex Count = CFArrayGetCount(v43);
                    if (Count >= 1)
                    {
                      CFIndex v47 = Count;
                      for (CFIndex i = 0; i != v47; ++i)
                      {
                        CFNumberRef v49 = sub_100003054(v45);
                        CFNumberRef v50 = sub_100003078(v45);
                        unsigned int v51 = sub_100003090(v45);
                        CFDictionaryRef v52 = sub_10000808C(v51);
                        CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v43, i);
                        sub_1000089E0("  dispatched callback, id = %016llX:%016llX, kind = %s, disk = %@, key = %@.", v49, v50, v52, a2, ValueAtIndex);
                      }
                    }
                    sub_100003164(v45, a2);
                    CFMutableDataRef v54 = sub_100005904(a2);
                    sub_100003134(v45, v54);
                    sub_10000314C(v45, v43);
                    sub_100013014((uint64_t)v6, v45);
                    CFRelease(v45);
                  }
                }
                uint64_t v33 = v43;
                goto LABEL_23;
              }
            }
            break;
          case 6u:
          case 8u:
          case 9u:
          case 0xEu:
            if (!sub_100012FC8((uint64_t)v6, 0x1000000))
            {
              if (a3) {
                sub_10001A994();
              }
LABEL_11:
              CFNumberRef v14 = sub_100007EE4(kCFAllocatorDefault, dword_1000251C4);
              if (v14)
              {
                CFNumberRef v15 = v14;
                uint64_t v16 = sub_100003048(kCFAllocatorDefault, a1);
                if (v16)
                {
                  double v17 = v16;
                  sub_100003164(v16, a2);
                  sub_10000314C(v17, v15);
                  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
                  sub_1000031AC(v17, Current);
                  CFArrayAppendValue((CFMutableArrayRef)qword_100025328, v17);
                  CFRelease(v17);
                }
                dispatch_time_t v19 = sub_100003048(kCFAllocatorDefault, a1);
                if (v19)
                {
                  CFURLRef v20 = v19;
                  sub_100003164(v19, a2);
                  CFMutableDataRef v21 = sub_100005904(a2);
                  sub_100003134(v20, v21);
                  sub_10000314C(v20, v15);
                  sub_100013014((uint64_t)v6, v20);
                  CFNumberRef v22 = sub_100003054(v20);
                  CFNumberRef v23 = sub_100003078(v20);
                  unsigned int v24 = sub_100003090(v20);
                  CFNumberRef v25 = sub_10000808C(v24);
                  sub_1000089E0("  dispatched callback, id = %016llX:%016llX, kind = %s, disk = %@.", v22, v23, v25, a2);
                  CFRelease(v20);
                }
                CFRelease(v15);
              }
              ++dword_1000251C4;
            }
            return;
          case 0xFu:
          case 0x10u:
            CFMutableDictionaryRef v34 = sub_100003048(kCFAllocatorDefault, a1);
            if (v34)
            {
              CFDictionaryRef v35 = v34;
              sub_100013014((uint64_t)v6, v34);
              CFNumberRef v36 = sub_100003054(v35);
              CFNumberRef v37 = sub_100003078(v35);
              unsigned int v38 = sub_100003090(v35);
              CFTypeID v39 = sub_10000808C(v38);
              sub_1000089E0("  dispatched callback, id = %016llX:%016llX, kind = %s.", v36, v37, v39);
              uint64_t v33 = v35;
LABEL_23:
              CFRelease(v33);
            }
            return;
          default:
            return;
        }
      }
    }
  }
}

void sub_10000CA44(void *a1, void *cf)
{
  CFTypeID v4 = CFGetTypeID(cf);
  if (v4 == CFArrayGetTypeID())
  {
    sub_10000C338(3, a1, cf);
  }
  else
  {
    CFDataRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(Mutable, cf);
    sub_10000C338(3, a1, Mutable);
    CFRelease(Mutable);
  }
}

void sub_10000CB00(void *a1)
{
}

uint64_t sub_10000CB10(uint64_t a1, unsigned int a2, uint64_t a3)
{
  return sub_10000CB30(5, a1, a2, 0, 0, a3);
}

void sub_10000CB30(unsigned int a1, const void *a2, uint64_t a3, const void *a4, const void *a5, const void *a6)
{
  CFURLRef v6 = sub_10000D500((uint64_t)kCFAllocatorDefault, a1, a2, a3, a4, a5, 0, 0, a6);
  if (v6)
  {
    CFDictionaryRef v7 = v6;
    sub_10000D010(v6);
    CFRelease(v7);
  }
}

void sub_10000CBB8(void *a1, uint64_t a2, uint64_t a3)
{
  sub_10000C45C((uint64_t)a1, a2, a3);
  sub_10000C338(6, a1, 0);

  sub_10000C16C(a1);
}

void sub_10000CC00(const void *a1, const void *a2, unsigned int a3, const void *a4)
{
}

uint64_t sub_10000CC1C(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  return sub_10000CB30(7, a1, a3, a2, a5, a4);
}

void sub_10000CC34(void *a1, uint64_t a2, uint64_t a3)
{
  sub_10000C45C((uint64_t)a1, a2, a3);
  sub_10000C338(8, a1, 0);

  sub_10000C16C(a1);
}

void sub_10000CC7C(const void *a1, const void *a2)
{
}

void sub_10000CC98(const void *a1, const void *a2)
{
}

void sub_10000CCB4(const void *a1, unsigned int a2, const void *a3)
{
}

void sub_10000CCD4(void *a1, uint64_t a2, uint64_t a3)
{
  sub_10000C45C((uint64_t)a1, a2, a3);
  sub_10000C338(14, a1, 0);

  sub_10000C16C(a1);
}

void sub_10000CD1C()
{
}

void sub_10000CD2C()
{
}

void sub_10000CD3C(uint64_t a1, int a2, void *a3, void *a4)
{
  CFArrayRef v7 = (const __CFArray *)sub_100005874(a1);
  if (v7)
  {
    CFArrayRef v8 = v7;
    CFIndex Count = CFArrayGetCount(v7);
    if (Count >= 1)
    {
      CFIndex v10 = Count;
      for (CFIndex i = 0; i != v10; ++i)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, i);
        if (sub_100003090(ValueAtIndex) == a2) {
          sub_10000C4E4(ValueAtIndex, a3, a4);
        }
      }
    }
  }
}

void sub_10000CDD4(const void *a1)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100025328);
  if (Count >= 1)
  {
    unint64_t v3 = Count + 1;
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025328, v3 - 2);
      if (sub_100003084(ValueAtIndex) == a1)
      {
        CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100025328, v3 - 2);
        sub_10000C16C(a1);
      }
      --v3;
    }
    while (v3 > 1);
  }
  CFIndex v5 = CFArrayGetCount((CFArrayRef)qword_100025320);
  if (v5 >= 1)
  {
    unint64_t v6 = v5 + 1;
    do
    {
      CFDictionaryRef v7 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025320, v6 - 2);
      if (sub_10000D808(v7) == a1)
      {
        sub_10000E84C(v7, -119930874);
        CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100025320, v6 - 2);
      }
      --v6;
    }
    while (v6 > 1);
  }
}

void sub_10000CEC0(const void *a1)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100025328);
  if (Count >= 1)
  {
    unint64_t v3 = Count + 1;
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025328, v3 - 2);
      if (sub_1000030DC(ValueAtIndex) == a1)
      {
        CFIndex v5 = sub_100003084(ValueAtIndex);
        CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100025328, v3 - 2);
        sub_10000C16C(v5);
      }
      --v3;
    }
    while (v3 > 1);
  }
  CFIndex v6 = CFArrayGetCount((CFArrayRef)qword_100025320);
  if (v6 >= 1)
  {
    unint64_t v7 = v6 + 1;
    do
    {
      CFDictionaryRef v8 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025320, v7 - 2);
      if (v8)
      {
        CFNumberRef v9 = v8;
        CFDictionaryRef v10 = (const __CFDictionary *)sub_10000E9F8(v8);
        if (v10)
        {
          if (sub_1000030DC(v10) == a1) {
            sub_10000EA94(v9, 0);
          }
        }
      }
      --v7;
    }
    while (v7 > 1);
  }
  CFIndex v11 = CFArrayGetCount((CFArrayRef)qword_1000252B0);
  if (v11 >= 1)
  {
    unint64_t v12 = v11 + 1;
    do
    {
      double v13 = CFArrayGetValueAtIndex((CFArrayRef)qword_1000252B0, v12 - 2);
      if (v13)
      {
        uint64_t v14 = (uint64_t)v13;
        CFDictionaryRef v15 = (const __CFDictionary *)sub_10000586C((uint64_t)v13);
        if (v15)
        {
          if (sub_1000030DC(v15) == a1) {
            sub_100005B58(v14, 0);
          }
        }
      }
      --v12;
    }
    while (v12 > 1);
  }
}

void sub_10000D010(const __CFDictionary *a1)
{
  unsigned int v2 = sub_10000D814(a1);
  if (v2 > 0xD || ((1 << v2) & 0x20A0) == 0)
  {
LABEL_35:
    CFArrayAppendValue((CFMutableArrayRef)qword_100025320, a1);
    sub_1000135F4();
    return;
  }
  unsigned int v3 = sub_10000E9D4(a1);
  CFTypeID v4 = sub_10000D808(a1);
  uint64_t v5 = (sub_10000D814(a1) == 5) | v3;
  if ((v5 & 1) == 0)
  {
    if (!sub_100005940((uint64_t)v4, 128) || sub_10000D814(a1) != 13) {
      goto LABEL_35;
    }
    goto LABEL_21;
  }
  int v6 = -119930868;
  unint64_t v7 = (unint64_t)sub_10000E9E0(a1);
  unint64_t v8 = (unint64_t)sub_10000E9EC(a1);
  CFNumberRef v9 = sub_100005828((uint64_t)v4, @"DAMediaWhole");
  if (sub_100005828((uint64_t)v4, @"DAMediaWhole") != kCFBooleanFalse)
  {
    int v10 = -119930877;
    if (!(v8 | v7)) {
      int v10 = 0;
    }
    int v6 = v9 ? v10 : -119930868;
    if (v9 && (v8 | v7) == 0)
    {
LABEL_21:
      CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
      if (!Mutable) {
        goto LABEL_35;
      }
      CFMutableArrayRef v13 = Mutable;
      CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000252B0);
      if (Count < 1)
      {
LABEL_34:
        sub_10000EAC4(a1, v13);
        CFRelease(v13);
        goto LABEL_35;
      }
      CFIndex v15 = Count;
      CFIndex v16 = 0;
      while (1)
      {
        CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_1000252B0, v16);
        if (v4 != ValueAtIndex)
        {
          CFNumberRef v18 = ValueAtIndex;
          dispatch_time_t v19 = (const char *)sub_10000580C((uint64_t)ValueAtIndex, 0);
          CFURLRef v20 = (const char *)sub_10000580C((uint64_t)v4, 0);
          if (v5)
          {
            int v21 = sub_100005864((uint64_t)v4);
            if (v21 == sub_100005864((uint64_t)v18)) {
              goto LABEL_31;
            }
          }
          else if (v20 && v19 && !strcmp(v20, v19))
          {
LABEL_31:
            unsigned int v22 = sub_10000D814(a1);
            unsigned int v23 = sub_10000EA74(a1);
            unsigned int v24 = sub_10000EA54(a1);
            CFNumberRef v25 = sub_10000D500((uint64_t)kCFAllocatorDefault, v22, v18, v5, 0, 0, v23, v24, 0);
            if (v25)
            {
              CFNumberRef v26 = v25;
              CFArrayAppendValue(v13, v25);
              CFArrayAppendValue((CFMutableArrayRef)qword_100025320, v26);
              CFRelease(v26);
            }
          }
        }
        if (v15 == ++v16) {
          goto LABEL_34;
        }
      }
    }
  }

  sub_10000E84C(a1, v6);
}

void sub_10000D2F4(const __CFDictionary *a1)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100025328);
  if (Count >= 1)
  {
    unint64_t v3 = Count + 1;
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025328, v3 - 2);
      uint64_t v5 = sub_1000030DC(ValueAtIndex);
      if (v5 == sub_1000030DC(a1))
      {
        CFNumberRef v6 = sub_100003054(ValueAtIndex);
        if (v6 == sub_100003054(a1))
        {
          CFNumberRef v7 = sub_100003078(ValueAtIndex);
          if (v7 == sub_100003078(a1))
          {
            unint64_t v8 = sub_100003084(ValueAtIndex);
            CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100025328, v3 - 2);
            sub_10000C16C(v8);
          }
        }
      }
      --v3;
    }
    while (v3 > 1);
  }
}

void sub_10000D3D0(id a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100025328);
  if (Count >= 1)
  {
    unint64_t v3 = Count + 1;
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025328, v3 - 2);
      if (ValueAtIndex)
      {
        CFDictionaryRef v5 = ValueAtIndex;
        CFNumberRef v6 = sub_1000030DC(ValueAtIndex);
        if (!sub_100012FB0((uint64_t)v6, 0x1000000) && sub_1000030E8(v5) + 10.0 < Current)
        {
          CFNumberRef v7 = sub_100003084(v5);
          if (!sub_100012FC8((uint64_t)v6, 0x1000000))
          {
            sub_1000089E0("  timed out session, id = %@.", v6);
            sub_100008B14("%@ not responding.", v6);
            sub_1000131E0((uint64_t)v6, 0x1000000, 1);
          }
          CFRetain(v7);
          CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100025328, v3 - 2);
          sub_10000C16C(v7);
          CFRelease(v7);
        }
      }
      --v3;
    }
    while (v3 > 1);
  }
}

__CFDictionary *sub_10000D500(uint64_t a1, unsigned int a2, const void *a3, uint64_t a4, const void *a5, const void *a6, unsigned int a7, unsigned int a8, const void *a9)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  double v17 = Mutable;
  if (Mutable)
  {
    sub_100007E7C(Mutable, @"DARequestKind", a2);
    if (a3) {
      CFDictionarySetValue(v17, @"DARequestDisk", a3);
    }
    if (a4) {
      sub_100007E7C(v17, @"DARequestArgument1", a4);
    }
    if (a5) {
      CFDictionarySetValue(v17, @"DARequestArgument2", a5);
    }
    if (a6) {
      CFDictionarySetValue(v17, @"DARequestArgument3", a6);
    }
    sub_100007E7C(v17, @"DARequestUserGID", a8);
    sub_100007E7C(v17, @"DARequestUserUID", a7);
    if (a9) {
      CFDictionarySetValue(v17, @"DARequestCallback", a9);
    }
  }
  return v17;
}

uint64_t sub_10000D638(uint64_t result)
{
  if (result)
  {
    CFDictionaryRef v1 = (const __CFDictionary *)result;
    BOOL result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, @"DARequestDisk");
    if (result)
    {
      uint64_t v2 = result;
      if (sub_100005940(result, 1))
      {
        return 0;
      }
      else
      {
        BOOL result = sub_100005940(v2, 0x80000);
        if (result)
        {
          unsigned int v3 = sub_100007E44(v1, @"DARequestKind");
          BOOL result = 0;
          switch(v3)
          {
            case 1u:
              BOOL result = sub_10000D834(v1);
              break;
            case 5u:
              BOOL result = sub_10000DA8C(v1);
              break;
            case 7u:
              BOOL result = sub_10000DC50(v1);
              break;
            case 0xAu:
              BOOL result = sub_10000E048(v1);
              break;
            case 0xBu:
              sub_10000E1B8(v1);
              BOOL result = 1;
              break;
            case 0xCu:
              BOOL result = sub_10000E2B4(v1);
              break;
            case 0xDu:
              BOOL result = sub_10000E4FC(v1);
              break;
            case 0x11u:
              BOOL result = sub_10000E420(v1);
              break;
            default:
              return result;
          }
        }
      }
    }
  }
  return result;
}

const void *sub_10000D808(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DARequestDisk");
}

CFNumberRef sub_10000D814(const __CFDictionary *a1)
{
  return sub_100007E44(a1, @"DARequestKind");
}

uint64_t sub_10000D834(const __CFDictionary *a1)
{
  CFBooleanRef Value = (void *)CFDictionaryGetValue(a1, @"DARequestDisk");
  if ((sub_100007E44(a1, @"DARequestState") & 0x100000) != 0)
  {
    if (CFDictionaryGetValue(a1, @"DARequestDissenter"))
    {
      CFDictionaryRef v5 = (void *)CFDictionaryGetValue(a1, @"DARequestDissenter");
      sub_10000E8C8(a1, v5);
      sub_1000135F4(v6);
      return 1;
    }
    else
    {
      CFRetain(a1);
      sub_100005EBC((uint64_t)Value, 1, 1);
      sub_100005B58((uint64_t)Value, 0);
      CFDictionaryRef v8 = (const __CFDictionary *)CFDictionaryGetValue(a1, @"DARequestCallback");
      if (v8)
      {
        CFNumberRef v9 = sub_1000030DC(v8);
        if (v9)
        {
          int v10 = v9;
          CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(a1, @"DARequestArgument2");
          CFNumberRef v12 = sub_100007F10(v11);
          CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(a1, @"DARequestArgument3");
          CFNumberRef v14 = sub_100007F10(v13);
          CFIndex v15 = sub_100002F40(kCFAllocatorDefault, v10, (uint64_t)v12, (uint64_t)v14, 2u, 0, 0, 0);
          if (v15)
          {
            CFIndex v16 = v15;
            sub_100005B58((uint64_t)Value, v15);
            CFRelease(v16);
          }
        }
      }
      double v17 = CFDictionaryGetValue(a1, @"DARequestDisk");
      sub_100008B68("claimed disk, id = %@, success.", v17);
      sub_10000E8C8(a1, 0);
      uint64_t v7 = 1;
      uint64_t v18 = sub_100005EBC((uint64_t)v17, 1, 0);
      sub_1000135F4(v18);
      CFRelease(a1);
    }
  }
  else
  {
    CFDictionaryRef v3 = (const __CFDictionary *)sub_10000586C((uint64_t)Value);
    CFRetain(a1);
    sub_100005EBC((uint64_t)Value, 1, 1);
    unsigned int v4 = sub_100007E44(a1, @"DARequestState");
    sub_100007E7C(a1, @"DARequestState", v4 | 0x100000);
    if (v3)
    {
      if (sub_100003054(v3))
      {
        sub_10000C408(Value, v3, (uint64_t)sub_10000EB58, (uint64_t)a1);
      }
      else
      {
        CFMutableDictionaryRef v19 = sub_1000061BC(kCFAllocatorDefault, -119930872);
        sub_10000EB58(v19, a1);
        CFRelease(v19);
      }
    }
    else
    {
      sub_10000EB58(0, a1);
    }
    return 0;
  }
  return v7;
}

uint64_t sub_10000DA8C(const __CFDictionary *a1)
{
  CFBooleanRef Value = (void *)CFDictionaryGetValue(a1, @"DARequestDisk");
  if ((sub_100007E44(a1, @"DARequestState") & 0x100000) != 0)
  {
    if (!CFDictionaryGetValue(a1, @"DARequestDissenter"))
    {
      if (!sub_100017274((uint64_t)Value, 1))
      {
        CFRetain(a1);
        uint64_t v7 = 1;
        sub_100005EBC((uint64_t)Value, 1, 1);
        sub_100017434((uint64_t)Value, 1, 1);
        sub_100008B68("ejected disk, id = %@, ongoing.", Value);
        sub_100017794((uint64_t)sub_10000EC18, (uint64_t)Value, (uint64_t (*)(uint64_t, uint64_t))sub_10000ECC8, (uint64_t)a1);
        return v7;
      }
      return 0;
    }
    uint64_t v6 = (void *)CFDictionaryGetValue(a1, @"DARequestDissenter");
    sub_10000E8C8(a1, v6);
  }
  else
  {
    CFDictionaryRef v3 = sub_100005828((uint64_t)Value, @"DAMediaWhole");
    if (sub_100005828((uint64_t)Value, @"DAMediaWhole") != kCFBooleanFalse && v3 != 0)
    {
      CFRetain(a1);
      sub_100005EBC((uint64_t)Value, 1, 1);
      unsigned int v8 = sub_100007E44(a1, @"DARequestState");
      sub_100007E7C(a1, @"DARequestState", v8 | 0x100000);
      sub_10000CBB8(Value, (uint64_t)sub_10000EBB8, (uint64_t)a1);
      return 0;
    }
    sub_10000E84C(a1, -119930868);
  }
  sub_1000135F4(v5);
  return 1;
}

BOOL sub_10000DC50(const __CFDictionary *a1)
{
  CFBooleanRef Value = (void *)CFDictionaryGetValue(a1, @"DARequestDisk");
  if (CFDictionaryGetValue(a1, @"DARequestLink") && sub_100017218((uint64_t)Value, 1)) {
    return 0;
  }
  if ((sub_100007E44(a1, @"DARequestState") & 0x10000) == 0)
  {
    unsigned int v4 = sub_100005828((uint64_t)Value, @"DAMediaPath");
    CFStringRef v5 = (const __CFString *)CFDictionaryGetValue(a1, @"DARequestArgument3");
    if (sub_100005828((uint64_t)Value, @"DAVolumePath"))
    {
      int v6 = -119930878;
      if (!v5) {
        goto LABEL_42;
      }
      if (!sub_10000A1E4(v5, @"update"))
      {
        BOOL v7 = sub_10000A1E4(v5, @"-s=");
        if (v7) {
          int v6 = -119930868;
        }
        else {
          int v6 = -119930878;
        }
        if (!v7 || !v4) {
          goto LABEL_42;
        }
LABEL_27:
        unsigned int v10 = sub_100007E44(a1, @"DARequestState");
        sub_100007E7C(a1, @"DARequestState", v10 & 0xFFFEFFFF | 0x10000);
        CFNumberRef v11 = CFDictionaryGetValue(a1, @"DARequestArgument3");
        if ((!v11 || !CFEqual(v11, @"automatic")) && !sub_100005828((uint64_t)Value, @"DAVolumePath"))
        {
          uint64_t v20 = sub_100005EBC((uint64_t)Value, 0x10000, 0);
          sub_1000135F4(v20);
          return 0;
        }
LABEL_30:
        if ((sub_100007E44(a1, @"DARequestState") & 0x100000) != 0)
        {
          if ((sub_100007E44(a1, @"DARequestState") & 0x200000) == 0)
          {
            unsigned int v13 = sub_100007E44(a1, @"DARequestState");
            sub_100007E7C(a1, @"DARequestState", v13 | 0x200000);
          }
          if (CFDictionaryGetValue(a1, @"DARequestDissenter"))
          {
            CFNumberRef v14 = (void *)CFDictionaryGetValue(a1, @"DARequestDissenter");
            sub_10000E8C8(a1, v14);
LABEL_44:
            sub_1000135F4(v15);
            return 1;
          }
          if (!sub_100017274((uint64_t)Value, 1))
          {
            CFStringRef v18 = (const __CFString *)CFDictionaryGetValue(a1, @"DARequestArgument2");
            if (v18) {
              CFURLRef v19 = CFURLCreateWithString(kCFAllocatorDefault, v18, 0);
            }
            else {
              CFURLRef v19 = 0;
            }
            CFRetain(a1);
            sub_100005EBC((uint64_t)Value, 1, 1);
            sub_100017434((uint64_t)Value, 1, 1);
            if ((sub_100007E44(a1, @"DARequestState") & 0x8000000) != 0)
            {
              CFNumberRef v30 = CFDictionaryGetValue(a1, @"DARequestArgument3");
              sub_100009724((uint64_t)Value, v19, (void (*)(void, void, void))sub_10000F12C, (uint64_t)a1, v25, v26, v27, v28, @"rdonly", (uint64_t)v30);
            }
            else
            {
              CFStringRef cf1 = (const __CFString *)CFDictionaryGetValue(a1, @"DARequestArgument3");
              sub_100009724((uint64_t)Value, v19, (void (*)(void, void, void))sub_10000F12C, (uint64_t)a1, v21, v22, v23, v24, cf1, 0);
            }
            if (v19) {
              CFRelease(v19);
            }
            return 1;
          }
        }
        else
        {
          if (sub_100005828((uint64_t)Value, @"DAVolumeMountable") == kCFBooleanFalse)
          {
            CFDictionaryRef v16 = a1;
            int v17 = -119930868;
LABEL_43:
            sub_10000E84C(v16, v17);
            goto LABEL_44;
          }
          CFRetain(a1);
          sub_100005EBC((uint64_t)Value, 1, 1);
          unsigned int v12 = sub_100007E44(a1, @"DARequestState");
          sub_100007E7C(a1, @"DARequestState", v12 & 0xFFEFFFFF | 0x100000);
          sub_10000CC34(Value, (uint64_t)sub_10000F0CC, (uint64_t)a1);
        }
        return 0;
      }
    }
    else if (v5)
    {
      BOOL v8 = sub_10000A1E4(v5, @"-s=");
      if (v8) {
        int v6 = 22;
      }
      else {
        int v6 = -119930868;
      }
      if (v8 || v4 == 0) {
        goto LABEL_42;
      }
      goto LABEL_27;
    }
    if (v4) {
      goto LABEL_27;
    }
    int v6 = -119930868;
LABEL_42:
    CFDictionaryRef v16 = a1;
    int v17 = v6;
    goto LABEL_43;
  }
  BOOL result = sub_100005940((uint64_t)Value, 0x10000);
  if (result) {
    goto LABEL_30;
  }
  return result;
}

uint64_t sub_10000E048(const __CFDictionary *a1)
{
  CFBooleanRef Value = CFDictionaryGetValue(a1, @"DARequestDisk");
  if ((sub_100007E44(a1, @"DARequestState") & 0x10000) != 0)
  {
    if (!sub_100005940((uint64_t)Value, 0x10000)) {
      return 0;
    }
  }
  else if (!sub_100005828((uint64_t)Value, @"DAVolumePath"))
  {
    unsigned int v3 = sub_100007E44(a1, @"DARequestState");
    sub_100007E7C(a1, @"DARequestState", v3 | 0x10000);
    uint64_t v4 = sub_100005EBC((uint64_t)Value, 0x10000, 0);
    sub_1000135F4(v4);
    return 0;
  }
  if (sub_100017274((uint64_t)Value, 1)) {
    return 0;
  }
  if (sub_100005828((uint64_t)Value, @"DAVolumePath"))
  {
    sub_10000E84C(a1, -119930878);
    sub_1000135F4(v7);
    return 1;
  }
  else
  {
    CFRetain(a1);
    uint64_t v5 = 1;
    sub_100005EBC((uint64_t)Value, 1, 1);
    sub_100017434((uint64_t)Value, 1, 1);
    BOOL v8 = CFDictionaryGetValue(a1, @"DARequestDisk");
    sub_10000E8C8(a1, 0);
    sub_100017434((uint64_t)v8, 1, 0);
    uint64_t v9 = sub_100005EBC((uint64_t)v8, 1, 0);
    sub_1000135F4(v9);
    CFRelease(a1);
  }
  return v5;
}

void sub_10000E1B8(const __CFDictionary *a1)
{
  CFBooleanRef Value = (void *)CFDictionaryGetValue(a1, @"DARequestDisk");
  if (sub_100005828((uint64_t)Value, @"DAVolumeMountable") == kCFBooleanFalse)
  {
    sub_10000E84C(a1, -119930868);
    sub_1000135F4(v7);
  }
  else
  {
    CFRetain(a1);
    sub_100005EBC((uint64_t)Value, 1, 1);
    int v3 = sub_10000AEA0(Value);
    uint64_t v4 = CFDictionaryGetValue(a1, @"DARequestDisk");
    if (v3) {
      int v5 = 49197;
    }
    else {
      int v5 = 0;
    }
    sub_10000E84C(a1, v5);
    uint64_t v6 = sub_100005EBC((uint64_t)v4, 1, 0);
    sub_1000135F4(v6);
    CFRelease(a1);
  }
}

uint64_t sub_10000E2B4(const __CFDictionary *a1)
{
  CFBooleanRef Value = CFDictionaryGetValue(a1, @"DARequestDisk");
  if (sub_100017274((uint64_t)Value, 1)) {
    return 0;
  }
  if (sub_100005828((uint64_t)Value, @"DAVolumeMountable") == kCFBooleanFalse) {
    int v4 = -119930868;
  }
  else {
    int v4 = 0;
  }
  if (!sub_100005828((uint64_t)Value, @"DAVolumePath")) {
    int v4 = -119930873;
  }
  if (CFDictionaryGetValue(a1, @"DARequestArgument2")) {
    int v5 = v4;
  }
  else {
    int v5 = -119930868;
  }
  if (v5)
  {
    sub_10000E84C(a1, v5);
    sub_1000135F4(v6);
    return 1;
  }
  else
  {
    CFRetain(a1);
    uint64_t v3 = 1;
    sub_100005EBC((uint64_t)Value, 1, 1);
    sub_100017434((uint64_t)Value, 1, 1);
    sub_100008B68("renamed disk, id = %@, ongoing.", Value);
    uint64_t v7 = sub_10000588C((uint64_t)Value);
    CFURLRef v8 = (const __CFURL *)sub_100005828((uint64_t)Value, @"DAVolumePath");
    CFStringRef v9 = (const __CFString *)CFDictionaryGetValue(a1, @"DARequestArgument2");
    sub_1000070D0(v7, v8, v9, (void (*)(uint64_t, uint64_t))sub_10000F2A4, (uint64_t)a1);
  }
  return v3;
}

uint64_t sub_10000E420(const __CFDictionary *a1)
{
  uint64_t result = (uint64_t)CFDictionaryGetValue(a1, @"DARequestDisk");
  if (result)
  {
    uint64_t v3 = (CFDictionaryRef *)result;
    int context = 0;
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"DARequestArgument2");
    CFDictionaryRef v5 = Value;
    if (!Value) {
      goto LABEL_5;
    }
    int v6 = -119930877;
    CFTypeID v7 = CFGetTypeID(Value);
    if (v7 != CFDictionaryGetTypeID())
    {
      int v6 = -119930868;
      goto LABEL_7;
    }
    int context = 0;
    CFDictionaryApplyFunction(v5, (CFDictionaryApplierFunction)sub_10000F554, &context);
    if (!context)
    {
LABEL_5:
      sub_100005CAC(v3, v5);
      int v6 = 0;
    }
LABEL_7:
    sub_10000E84C(a1, v6);
    sub_1000135F4(v8);
    return 1;
  }
  return result;
}

uint64_t sub_10000E4FC(const __CFDictionary *a1)
{
  CFDictionaryRef Value = (void *)CFDictionaryGetValue(a1, @"DARequestDisk");
  if (CFDictionaryGetValue(a1, @"DARequestLink") && sub_100017218((uint64_t)Value, 1)) {
    return 0;
  }
  if ((sub_100007E44(a1, @"DARequestState") & 0x100000) != 0)
  {
LABEL_14:
    if (CFDictionaryGetValue(a1, @"DARequestDissenter"))
    {
      unsigned int v12 = (void *)CFDictionaryGetValue(a1, @"DARequestDissenter");
      uint64_t v3 = 1;
      sub_10000F760(a1, 16, 1, 0);
      sub_10000E8C8(a1, v12);
      sub_1000135F4(v13);
      return v3;
    }
    if (!sub_100017274((uint64_t)Value, 1))
    {
      sub_100007E44(a1, @"DARequestArgument1");
      CFRetain(a1);
      uint64_t v3 = 1;
      sub_100005EBC((uint64_t)Value, 1, 1);
      sub_100017434((uint64_t)Value, 1, 1);
      sub_100008B68("unmounted disk, id = %@, ongoing.", Value);
      uint64_t v15 = malloc_type_malloc(0x18uLL, 0x1020040545B2139uLL);
      v15[16] = 0;
      *(void *)uint64_t v15 = a1;
      *((void *)v15 + 1) = 0;
      sub_100017794((uint64_t)sub_10000F8BC, (uint64_t)v15, (uint64_t (*)(uint64_t, uint64_t))sub_10000F98C, (uint64_t)v15);
      return v3;
    }
    return 0;
  }
  int v4 = -119930878;
  CFBooleanRef v5 = (const __CFBoolean *)sub_100005828((uint64_t)Value, @"DAVolumeMountable");
  if (!sub_100005828((uint64_t)Value, @"DAVolumePath"))
  {
    int v4 = -119930873;
    goto LABEL_10;
  }
  CFURLRef v6 = (const __CFURL *)sub_100005828((uint64_t)Value, @"DAVolumePath");
  CFStringRef v7 = CFURLGetString(v6);
  if (CFEqual(v7, @"file:///") || (CFStringRef v8 = CFURLGetString(v6), CFEqual(v8, @"file:///System/Volumes/Data/")))
  {
    CFMutableDictionaryRef v9 = sub_1000061BC(kCFAllocatorDefault, -119930878);
    sub_10000EAAC(a1, v9);
    CFRelease(v9);
LABEL_10:
    sub_10000E84C(a1, v4);
    sub_1000135F4(v10);
    return 1;
  }
  if (v5 == kCFBooleanFalse)
  {
    int v4 = -119930868;
    goto LABEL_10;
  }
  if (sub_100005940((uint64_t)Value, 0x10000000))
  {
    unsigned int v11 = sub_100007E44(a1, @"DARequestState");
    sub_100007E7C(a1, @"DARequestState", v11 & 0xFFEFFFFF | 0x100000);
    goto LABEL_14;
  }
  CFRetain(a1);
  sub_100005EBC((uint64_t)Value, 1, 1);
  unsigned int v16 = sub_100007E44(a1, @"DARequestState");
  sub_100007E7C(a1, @"DARequestState", v16 & 0xFFEFFFFF | 0x100000);
  if (sub_100005828((uint64_t)Value, @"DAMediaWritable") == kCFBooleanTrue) {
    sub_100017794((uint64_t)sub_10000F5C0, (uint64_t)Value, (uint64_t (*)(uint64_t, uint64_t))sub_10000F658, (uint64_t)a1);
  }
  else {
    sub_10000CCD4(Value, (uint64_t)sub_10000F6AC, (uint64_t)a1);
  }
  return 0;
}

void sub_10000E84C(const __CFDictionary *a1, int a2)
{
  if (a2)
  {
    CFMutableDictionaryRef v3 = sub_1000061BC(kCFAllocatorDefault, a2);
    sub_10000E8C8(a1, v3);
    CFRelease(v3);
  }
  else
  {
    sub_10000E8C8(a1, 0);
  }
}

void sub_10000E8C8(const __CFDictionary *a1, void *a2)
{
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"DARequestCallback");
  if (Value)
  {
    CFDictionaryRef v5 = Value;
    CFArrayRef v6 = (const __CFArray *)CFDictionaryGetValue(a1, @"DARequestLink");
    if (v6)
    {
      CFArrayRef v7 = v6;
      a2 = (void *)CFDictionaryGetValue(a1, @"DARequestDissenter");
      if (!a2)
      {
        CFIndex Count = CFArrayGetCount(v7);
        if (Count < 1)
        {
LABEL_8:
          a2 = 0;
        }
        else
        {
          CFIndex v9 = Count;
          CFIndex v10 = 0;
          while (1)
          {
            CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v7, v10);
            unsigned int v12 = (void *)CFDictionaryGetValue(ValueAtIndex, @"DARequestDissenter");
            if (v12) {
              break;
            }
            if (v9 == ++v10) {
              goto LABEL_8;
            }
          }
          a2 = v12;
        }
      }
    }
    uint64_t v13 = (void *)CFDictionaryGetValue(a1, @"DARequestDisk");
    sub_10000C4E4(v5, v13, a2);
  }
}

CFNumberRef sub_10000E9D4(const __CFDictionary *a1)
{
  return sub_100007E44(a1, @"DARequestArgument1");
}

const void *sub_10000E9E0(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DARequestArgument2");
}

const void *sub_10000E9EC(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DARequestArgument3");
}

const void *sub_10000E9F8(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DARequestCallback");
}

const void *sub_10000EA04(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DARequestDissenter");
}

const void *sub_10000EA10(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DARequestLink");
}

BOOL sub_10000EA1C(const __CFDictionary *a1, int a2)
{
  return (sub_100007E44(a1, @"DARequestState") & a2) != 0;
}

CFNumberRef sub_10000EA54(const __CFDictionary *a1)
{
  return sub_100007E44(a1, @"DARequestUserGID");
}

CFNumberRef sub_10000EA74(const __CFDictionary *a1)
{
  return sub_100007E44(a1, @"DARequestUserUID");
}

void sub_10000EA94(__CFDictionary *a1, void *value)
{
  if (value) {
    CFDictionarySetValue(a1, @"DARequestCallback", value);
  }
  else {
    CFDictionaryRemoveValue(a1, @"DARequestCallback");
  }
}

void sub_10000EAAC(__CFDictionary *a1, void *value)
{
  if (value) {
    CFDictionarySetValue(a1, @"DARequestDissenter", value);
  }
  else {
    CFDictionaryRemoveValue(a1, @"DARequestDissenter");
  }
}

void sub_10000EAC4(__CFDictionary *a1, void *value)
{
  if (value) {
    CFDictionarySetValue(a1, @"DARequestLink", value);
  }
  else {
    CFDictionaryRemoveValue(a1, @"DARequestLink");
  }
}

void sub_10000EADC(const __CFDictionary *a1, int a2, int a3)
{
  unsigned int v6 = sub_100007E44(a1, @"DARequestState");
  if (a3) {
    uint64_t v7 = v6 | a2;
  }
  else {
    uint64_t v7 = v6 & ~a2;
  }

  sub_100007E7C(a1, @"DARequestState", v7);
}

void sub_10000EB40(__CFDictionary *a1, void *value)
{
  if (value) {
    CFDictionarySetValue(a1, @"DARequestArgument2", value);
  }
  else {
    CFDictionaryRemoveValue(a1, @"DARequestArgument2");
  }
}

void sub_10000EB58(void *value, __CFDictionary *a2)
{
  sub_10000EAAC(a2, value);
  CFMutableDictionaryRef v3 = CFDictionaryGetValue(a2, @"DARequestDisk");
  uint64_t v4 = sub_100005EBC((uint64_t)v3, 1, 0);
  sub_1000135F4(v4);

  CFRelease(a2);
}

void sub_10000EBB8(void *value, __CFDictionary *a2)
{
  sub_10000EAAC(a2, value);
  CFMutableDictionaryRef v3 = CFDictionaryGetValue(a2, @"DARequestDisk");
  uint64_t v4 = sub_100005EBC((uint64_t)v3, 1, 0);
  sub_1000135F4(v4);

  CFRelease(a2);
}

uint64_t sub_10000EC18(uint64_t a1)
{
  uint64_t v2 = (const char *)sub_10000580C(a1, 1);
  int v3 = open(v2, 0);
  if (v3 == -1)
  {
    unsigned int v6 = __error();
    sub_100008B68("open failed with %d for %@", *v6, a1);
    return *__error();
  }
  else
  {
    int v4 = v3;
    uint64_t v5 = ioctl(v3, 0x20006415uLL, 0);
    if (v5 == -1)
    {
      if (*__error() == 25) {
        uint64_t v5 = 0;
      }
      else {
        uint64_t v5 = *__error();
      }
    }
    close(v4);
  }
  return v5;
}

void sub_10000ECC8(uint64_t a1, CFDictionaryRef theDict)
{
  CFDictionaryRef Value = CFDictionaryGetValue(theDict, @"DARequestDisk");
  uint64_t v5 = sub_10000588C((uint64_t)Value);
  if (v5)
  {
    unsigned int v6 = sub_100006624(v5);
    if (a1) {
      goto LABEL_3;
    }
LABEL_6:
    sub_100008B68("ejected disk, id = %@, success.", Value);
    int v11 = 0;
    uint64_t v12 = (uint64_t)v6;
    int v10 = -1;
    goto LABEL_7;
  }
  unsigned int v6 = 0;
  if (!a1) {
    goto LABEL_6;
  }
LABEL_3:
  CFDictionaryRef v7 = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"DARequestDissenter");
  if (v7)
  {
    CFDictionaryRef v8 = v7;
    unint64_t v9 = (unint64_t)sub_100006234(v7) & 0x3FFF;
    int v10 = sub_100006214(v8);
    int v11 = v9;
    uint64_t v12 = (uint64_t)v6;
LABEL_7:
    sub_100004088(v11, v12, v10);
    if (a1) {
      int v13 = a1 | 0xC000;
    }
    else {
      int v13 = 0;
    }
    sub_10000E84C(theDict, v13);
    sub_100017434((uint64_t)Value, 1, 0);
    uint64_t v14 = sub_100005EBC((uint64_t)Value, 1, 0);
    sub_1000135F4(v14);
    CFRelease(theDict);
    return;
  }
  sub_100008B68("ejected disk, id = %@, failure.", Value);
  sub_100008B68("unable to eject %@ (status code 0x%08X).", Value, a1);
  CFMutableDictionaryRef v15 = sub_1000061BC(kCFAllocatorDefault, a1 | 0xC000);
  sub_10000EAAC(theDict, v15);
  CFRelease(v15);

  sub_100017794((uint64_t)sub_10000EE74, (uint64_t)theDict, (uint64_t (*)(uint64_t, uint64_t))sub_10000ECC8, (uint64_t)theDict);
}

uint64_t sub_10000EE74(const __CFDictionary *a1)
{
  CFDictionaryRef Value = CFDictionaryGetValue(a1, @"DARequestDisk");
  int v3 = (const char *)sub_10000580C((uint64_t)Value, 1);
  int v4 = strdup(v3);
  if (v4)
  {
    uint64_t v5 = v4;
    int buffer = 0;
    proc_listpidspath(1u, 0, v4, 2u, &buffer, 4);
    free(v5);
    if (buffer)
    {
      unsigned int v6 = (void *)CFDictionaryGetValue(a1, @"DARequestDissenter");
      sub_100006254(v6, buffer);
      return 0xFFFFFFFFLL;
    }
    io_registry_entry_t v8 = sub_100005820((uint64_t)Value);
    if (v8)
    {
      io_iterator_t iterator = 0;
      IORegistryEntryCreateIterator(v8, "IOService", 1u, &iterator);
      if (iterator)
      {
        io_object_t v9 = IOIteratorNext(iterator);
        if (!v9) {
          goto LABEL_16;
        }
        io_object_t v10 = v9;
        while (1)
        {
          if (IOObjectConformsTo(v10, "IOMedia"))
          {
            CFAllocatorRef v11 = CFGetAllocator(Value);
            CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v10, @"BSD Name", v11, 0);
            if (CFProperty)
            {
              CFStringRef v13 = CFProperty;
              memset(v19, 0, sizeof(v19));
              CFStringGetCString(CFProperty, (char *)v19, 128, 0x8000100u);
              __strlcpy_chk();
              __strlcat_chk();
              __strlcat_chk();
              int v15 = 0;
              proc_listpidspath(1u, 0, path, 0, &v15, 4);
              if (v15)
              {
                uint64_t v14 = (void *)CFDictionaryGetValue(a1, @"DARequestDissenter");
                sub_100006254(v14, v15);
                CFRelease(v13);
                IOObjectRelease(v10);
LABEL_16:
                IOObjectRelease(iterator);
                return 0xFFFFFFFFLL;
              }
              CFRelease(v13);
            }
          }
          IOObjectRelease(v10);
          io_object_t v10 = IOIteratorNext(iterator);
          if (!v10) {
            goto LABEL_16;
          }
        }
      }
    }
  }
  return 0xFFFFFFFFLL;
}

void sub_10000F0CC(void *value, __CFDictionary *a2)
{
  sub_10000EAAC(a2, value);
  int v3 = CFDictionaryGetValue(a2, @"DARequestDisk");
  uint64_t v4 = sub_100005EBC((uint64_t)v3, 1, 0);
  sub_1000135F4(v4);

  CFRelease(a2);
}

void sub_10000F12C(int a1, const void *a2, CFDictionaryRef theDict)
{
  CFDictionaryRef Value = (void *)CFDictionaryGetValue(theDict, @"DARequestDisk");
  if (a1)
  {
    CFMutableDictionaryRef v7 = sub_1000061BC(kCFAllocatorDefault, a1 | 0xC000u);
    sub_10000EAAC(theDict, v7);
    CFRelease(v7);
  }
  else
  {
    CFStringRef v10 = (const __CFString *)CFDictionaryGetValue(theDict, @"DARequestArgument3");
    if (a2)
    {
      CFStringRef v11 = v10;
      if (v10)
      {
        if (sub_10000A1E4(v10, @"-s=")) {
          goto LABEL_3;
        }
        sub_100005AC8((uint64_t)Value, a2);
        sub_100005C24((uint64_t)Value, @"DAVolumePath", a2);
        if (sub_10000A1E4(v11, @"update")) {
          goto LABEL_3;
        }
      }
      else
      {
        sub_100005AC8((uint64_t)Value, a2);
        sub_100005C24((uint64_t)Value, @"DAVolumePath", a2);
      }
      sub_10000CA44(Value, @"DAVolumePath");
    }
  }
LABEL_3:
  if (a1) {
    int v8 = a1 | 0xC000;
  }
  else {
    int v8 = 0;
  }
  sub_10000E84C(theDict, v8);
  sub_100017434((uint64_t)Value, 1, 0);
  uint64_t v9 = sub_100005EBC((uint64_t)Value, 1, 0);
  sub_1000135F4(v9);

  CFRelease(theDict);
}

void sub_10000F2A4(uint64_t a1, CFDictionaryRef theDict)
{
  CFDictionaryRef Value = (void *)CFDictionaryGetValue(theDict, @"DARequestDisk");
  uint64_t v5 = Value;
  if (a1)
  {
    sub_100008B68("renamed disk, id = %@, failure.", Value);
    sub_100008B68("unable to rename %@ (status code 0x%08X).", v5, a1);
    goto LABEL_20;
  }
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (Mutable)
  {
    CFMutableArrayRef v7 = Mutable;
    int v8 = CFDictionaryGetValue(theDict, @"DARequestArgument2");
    if (!sub_10000445C((uint64_t)v5, @"DAVolumeName", v8))
    {
LABEL_18:
      CFRelease(v7);
      goto LABEL_19;
    }
    sub_100005C24((uint64_t)v5, @"DAVolumeName", v8);
    CFArrayAppendValue(v7, @"DAVolumeName");
    CFURLRef v9 = (const __CFURL *)sub_100005828((uint64_t)v5, @"DAVolumePath");
    if (sub_100005828((uint64_t)v5, @"DAVolumeLifsURL"))
    {
      bzero(v20, 0x878uLL);
      CFStringRef v10 = sub_100008040(v9);
      if (v10)
      {
        CFStringRef v11 = v10;
        if (!sub_100007B64((const char *)v10, v20, 2))
        {
          CFStringRef v12 = CFStringCreateWithCString(kCFAllocatorDefault, v21, 0x8000100u);
          if (v12)
          {
            CFStringRef v13 = v12;
            sub_100005C24((uint64_t)v5, @"DAVolumeLifsURL", v12);
            CFArrayAppendValue(v7, @"DAVolumeLifsURL");
            CFRelease(v13);
          }
        }
        free(v11);
      }
    }
    CFStringRef v14 = CFURLGetString(v9);
    int v15 = CFEqual(v14, @"file:///");
    unsigned int v16 = (const void *)sub_10000A528();
    int v17 = v16;
    if (v15)
    {
      if (v16)
      {
        sub_100005AC8((uint64_t)v5, v16);
LABEL_16:
        CFRelease(v17);
      }
    }
    else if (v16)
    {
      sub_100005AC8((uint64_t)v5, v16);
      sub_100005C24((uint64_t)v5, @"DAVolumePath", v17);
      CFArrayAppendValue(v7, @"DAVolumePath");
      goto LABEL_16;
    }
    sub_10000CA44(v5, v7);
    goto LABEL_18;
  }
LABEL_19:
  sub_100008B68("renamed disk, id = %@, success.", v5);
LABEL_20:
  if (a1) {
    int v18 = a1 | 0xC000;
  }
  else {
    int v18 = 0;
  }
  sub_10000E84C(theDict, v18);
  sub_100017434((uint64_t)v5, 1, 0);
  uint64_t v19 = sub_100005EBC((uint64_t)v5, 1, 0);
  sub_1000135F4(v19);
  CFRelease(theDict);
}

CFIndex sub_10000F554(const __CFString *a1, uint64_t a2, _DWORD *a3)
{
  *(_DWORD *)int buffer = 0;
  v6.location = 0;
  v6.length = 2;
  CFIndex result = CFStringGetBytes(a1, v6, 0x8000100u, 0, 0, buffer, 4, 0);
  if (*(unsigned __int16 *)buffer != 21318) {
    *a3 = 1;
  }
  return result;
}

uint64_t sub_10000F5C0(uint64_t a1)
{
  CFNumberRef v2 = (const __CFNumber *)sub_100005828(a1, @"DAMediaBlockSize");
  CFNumberRef v3 = sub_100007F10(v2);
  if (v3)
  {
    size_t v4 = (size_t)v3;
    uint64_t v5 = malloc_type_malloc((size_t)v3, 0xA40A6D87uLL);
    if (v5)
    {
      CFRange v6 = v5;
      CFMutableArrayRef v7 = (const char *)sub_10000580C(a1, 1);
      int v8 = open(v7, 0);
      if (v8 != -1)
      {
        int v9 = v8;
        read(v8, v6, v4);
        close(v9);
      }
      free(v6);
    }
  }
  return 0;
}

void sub_10000F658(int a1, CFDictionaryRef theDict)
{
  CFDictionaryRef Value = (void *)CFDictionaryGetValue(theDict, @"DARequestDisk");

  sub_10000CCD4(Value, (uint64_t)sub_10000F6AC, (uint64_t)theDict);
}

void sub_10000F6AC(const void *a1, CFDictionaryRef theDict)
{
  if (a1)
  {
    if ((sub_100007E44(theDict, @"DARequestArgument1") & 0x80000) == 0) {
      CFDictionarySetValue(theDict, @"DARequestDissenter", a1);
    }
    if (sub_100006234((const __CFDictionary *)a1) == -119865599) {
      CFDictionarySetValue(theDict, @"DARequestDissenter", a1);
    }
  }
  CFDictionaryRef Value = CFDictionaryGetValue(theDict, @"DARequestDisk");
  uint64_t v5 = sub_100005EBC((uint64_t)Value, 1, 0);
  sub_1000135F4(v5);

  CFRelease(theDict);
}

CFDictionaryRef sub_10000F760(const __CFDictionary *a1, int a2, int a3, uint64_t a4)
{
  LODWORD(v6) = a2;
  CFDictionaryRef Value = CFDictionaryGetValue(a1, @"DARequestDisk");
  CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(a1, @"DARequestDissenter");
  if (!Value) {
    return result;
  }
  CFDictionaryRef v10 = result;
  CFStringRef v11 = (const __CFString *)sub_10000588C((uint64_t)Value);
  int v12 = sub_10000A530((uint64_t)Value, 3);
  if (v11)
  {
    if (v12 == 1) {
      CFStringRef v13 = @"UserFS";
    }
    else {
      CFStringRef v13 = 0;
    }
    CFStringRef v14 = sub_100006624((uint64_t)v11);
    if (sub_100006AA8((uint64_t)v11, v13)) {
      CFStringRef v11 = @"UserFS";
    }
    else {
      CFStringRef v11 = @"kext";
    }
    if (v10) {
      goto LABEL_10;
    }
  }
  else
  {
    CFStringRef v14 = 0;
    if (v10) {
LABEL_10:
    }
      unint64_t v6 = (unint64_t)sub_100006234(v10) & 0x3FFF;
  }
  if (a4)
  {
    char v15 = *(unsigned char *)(a4 + 16) != 0;
    if (v10) {
      goto LABEL_13;
    }
LABEL_19:
    int v16 = -1;
    if (a4) {
      goto LABEL_14;
    }
LABEL_20:
    uint64_t v17 = 0;
    goto LABEL_21;
  }
  char v15 = 0;
  if (!v10) {
    goto LABEL_19;
  }
LABEL_13:
  int v16 = sub_100006214(v10);
  if (!a4) {
    goto LABEL_20;
  }
LABEL_14:
  uint64_t v17 = *(void *)(a4 + 8);
LABEL_21:

  return (const __CFDictionary *)sub_100004270(v6, (uint64_t)v14, (uint64_t)v11, v15, v16, a3 != 0, v17);
}

uint64_t sub_10000F8BC(uint64_t a1)
{
  CFDictionaryRef v2 = *(const __CFDictionary **)a1;
  CFDictionaryRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)a1, @"DARequestDisk");
  CFURLRef v4 = (const __CFURL *)sub_100005828((uint64_t)Value, @"DAVolumePath");
  uint64_t v5 = sub_100008040(v4);
  if (!v5) {
    return 22;
  }
  unint64_t v6 = (char *)v5;
  if ((sub_100007E44(v2, @"DARequestArgument1") & 0x80000) != 0)
  {
    *(unsigned char *)(a1 + 16) = 1;
    int v7 = 0x80000;
  }
  else
  {
    int v7 = 0;
  }
  __uint64_t v9 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v8 = unmount(v6, v7);
  if (v8 == -1) {
    uint64_t v8 = *__error();
  }
  *(void *)(a1 + 8) = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v9;
  free(v6);
  return v8;
}

void sub_10000F98C(uint64_t a1, CFDictionaryRef *a2)
{
  CFDictionaryRef v4 = *a2;
  CFDictionaryRef Value = (void *)CFDictionaryGetValue(*a2, @"DARequestDisk");
  if (!a1)
  {
    sub_10000F760(v4, 0, 0, (uint64_t)a2);
LABEL_11:
    char v15 = sub_100005828((uint64_t)Value, @"DAVolumePath");
    if (!sub_100007C60((const __CFArray *)qword_100025300, v15)) {
      nullsub_4(v15);
    }
    sub_100005AC8((uint64_t)Value, 0);
    sub_100008B68("unmounted disk, id = %@, success.", Value);
    if (sub_100005828((uint64_t)Value, @"DAMediaPath"))
    {
      sub_100005C24((uint64_t)Value, @"DAVolumePath", 0);
      sub_10000CA44(Value, @"DAVolumePath");
    }
    else
    {
      sub_100008B68("removed disk, id = %@.", Value);
      sub_10000CB00(Value);
      sub_100005C24((uint64_t)Value, @"DAVolumePath", 0);
      sub_100005EBC((uint64_t)Value, 0x10000000, 1);
      sub_100007D50((const __CFArray *)qword_1000252B0, Value);
    }
    sub_10000E8C8(v4, 0);
    goto LABEL_17;
  }
  uint64_t v19 = 0;
  int v6 = getmntinfo(&v19, 2);
  int v7 = v6;
  if (v6 < 1)
  {
    int v9 = 0;
  }
  else
  {
    unint64_t v8 = 0;
    int v9 = 0;
    uint64_t v10 = 2168 * v6;
    while (1)
    {
      CFStringRef v11 = sub_1000085B0((uint64_t)&v19[v8 / 0x878]);
      int v12 = (const char *)sub_1000053D8((uint64_t)Value);
      CFStringRef v13 = (const char *)sub_1000053D8((uint64_t)Value);
      size_t v14 = strlen(v13);
      if (!strncmp(v11, v12, v14 + 1)) {
        break;
      }
      ++v9;
      v8 += 2168;
      if (v10 == v8) {
        goto LABEL_10;
      }
    }
  }
  if (v9 == v7)
  {
LABEL_10:
    sub_1000089E0(" %@ is not mounted. Ignore the umount error %d", Value, a1);
    goto LABEL_11;
  }
  uint64_t v17 = (void *)CFDictionaryGetValue(v4, @"DARequestDissenter");
  if (!v17)
  {
    sub_100008B68("unmounted disk, id = %@, failure.", Value);
    sub_100008B14("unable to unmount %@ (status code 0x%08X).", Value, a1);
    CFMutableDictionaryRef v18 = sub_1000061BC(kCFAllocatorDefault, 49168);
    sub_10000EAAC(v4, v18);
    CFRelease(v18);
    sub_100017794((uint64_t)sub_10000FC74, (uint64_t)a2, (uint64_t (*)(uint64_t, uint64_t))sub_10000F98C, (uint64_t)a2);
    return;
  }
  sub_10000E8C8(v4, v17);
  sub_10000F760(v4, a1, 0, (uint64_t)a2);
LABEL_17:
  sub_100017434((uint64_t)Value, 1, 0);
  uint64_t v16 = sub_100005EBC((uint64_t)Value, 1, 0);
  sub_1000135F4(v16);
  CFRelease(v4);
  free(a2);
}

uint64_t sub_10000FC74(CFDictionaryRef *a1)
{
  CFDictionaryRef v1 = *a1;
  CFDictionaryRef Value = CFDictionaryGetValue(*a1, @"DARequestDisk");
  CFURLRef v3 = (const __CFURL *)sub_100005828((uint64_t)Value, @"DAVolumePath");
  CFDictionaryRef v4 = sub_100008040(v3);
  if (v4)
  {
    uint64_t v5 = v4;
    int buffer = 0;
    proc_listpidspath(1u, 0, (const char *)v4, 3u, &buffer, 4);
    if (buffer)
    {
      int v6 = (void *)CFDictionaryGetValue(v1, @"DARequestDissenter");
      sub_100006254(v6, buffer);
    }
    free(v5);
  }
  return 0xFFFFFFFFLL;
}

const void *sub_10000FD14(const char *a1)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000252B0);
  if (Count < 1) {
    return 0;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_1000252B0, v4);
    int v6 = (const char *)sub_1000053D8((uint64_t)ValueAtIndex);
    if (!strcmp(v6, a1)) {
      break;
    }
    if (v3 == ++v4) {
      return 0;
    }
  }
  return ValueAtIndex;
}

void sub_10000FD98()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_10000FE2C, @"com.apple.mobile.keybagd.first_unlock", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  if (MKBGetDeviceLockState() == 3 || MKBDeviceUnlockedSinceBoot())
  {
    sub_100008B68(" Device is unlocked");
    byte_100025340 = 1;
  }
  else
  {
    sub_100008B68(" Device is locked");
  }
}

void sub_10000FE2C()
{
  sub_100008B68("First unlock notification received");
  int v0 = byte_100025340;
  byte_100025340 = 1;
  if (!v0)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000252B0);
    if (Count >= 1)
    {
      CFIndex v2 = Count;
      for (CFIndex i = 0; i != v2; ++i)
      {
        CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_1000252B0, i);
        if (sub_100005828((uint64_t)ValueAtIndex, @"DAVolumeMountable") == kCFBooleanTrue
          && !sub_10000A530((uint64_t)ValueAtIndex, 2))
        {
          if (sub_10000A530((uint64_t)ValueAtIndex, 0)) {
            sub_10000CC1C((uint64_t)ValueAtIndex, 0, 0, 0, @"automatic");
          }
        }
      }
    }
  }
}

void sub_10000FF28(int a1, io_iterator_t iterator)
{
  io_object_t v3 = IOIteratorNext(iterator);
  if (!v3) {
    goto LABEL_44;
  }
  io_object_t v4 = v3;
  CFStringRef v5 = @"DAVolumeMountable";
  CFBooleanRef v6 = kCFBooleanTrue;
  CFBooleanRef v7 = kCFBooleanFalse;
  unint64_t v8 = (const __CFArray **)&qword_1000252B0;
  do
  {
    int v9 = sub_1000104D8(v4);
    if (v9)
    {
      uint64_t v10 = v9;
      sub_10001055C(v4);
      if (sub_100005828((uint64_t)v10, v5) == v6 && sub_100005828((uint64_t)v10, @"DAMediaLeaf") == v7) {
        sub_10000CC7C(v10, 0);
      }
      goto LABEL_43;
    }
    *(void *)notification = 0;
    CFStringRef v11 = v8;
    IOServiceAddInterestNotification((IONotificationPortRef)qword_1000252E0, v4, "IOBusyInterest", (IOServiceInterestCallback)sub_1000109E4, 0, &notification[1]);
    notification[0] = 0;
    IOServiceAddInterestNotification((IONotificationPortRef)qword_1000252E0, v4, "IOGeneralInterest", (IOServiceInterestCallback)sub_1000109E4, 0, notification);
    int v12 = (const void *)sub_1000044BC(kCFAllocatorDefault, v4);
    if (!v12) {
      goto LABEL_39;
    }
    CFStringRef v13 = v12;
    if (sub_100007C60(*v8, v12))
    {
      size_t v14 = sub_100002314(*v8, v13);
      sub_100010AB4((uint64_t)v14, 0);
      if (sub_100007C60(*v8, v13)) {
        sub_10001A9C0();
      }
    }
    if (notification[1]) {
      sub_100005A84((uint64_t)v13, notification[1]);
    }
    if (notification[0]) {
      sub_100005E78((uint64_t)v13, notification[0]);
    }
    if (!sub_100005848((uint64_t)v13, 1)) {
      goto LABEL_20;
    }
    char v15 = (const char *)sub_100005848((uint64_t)v13, 1);
    if (!strncmp(v15, "/dev/disk", 9uLL)) {
      goto LABEL_20;
    }
    uint64_t v16 = (const char *)sub_10000580C((uint64_t)v13, 1);
    uint64_t v17 = (const char *)sub_100005848((uint64_t)v13, 1);
    if (link(v16, v17)) {
      goto LABEL_19;
    }
    CFMutableDictionaryRef v18 = (const char *)sub_10000580C((uint64_t)v13, 0);
    uint64_t v19 = (const char *)sub_100005848((uint64_t)v13, 0);
    if (link(v18, v19))
    {
      uint64_t v20 = (const char *)sub_100005848((uint64_t)v13, 1);
      unlink(v20);
LABEL_19:
      uint64_t v21 = sub_100005848((uint64_t)v13, 1);
      sub_100008B14("unable to link %@ to %s.", v13, v21);
      sub_100005B0C((uint64_t)v13, 1, 0);
      sub_100005B0C((uint64_t)v13, 0, 0);
    }
LABEL_20:
    int v22 = sub_100005828((uint64_t)v13, @"DAMediaContent");
    if (!CFEqual(v22, @"41504653-0000-11AA-AA11-00306543ECAC")) {
      goto LABEL_30;
    }
    CFStringRef v23 = v5;
    sub_100017434((uint64_t)v13, 16, 1);
    io_registry_entry_t parent = 0;
    io_registry_entry_t v24 = sub_100005820((uint64_t)v13);
    IORegistryEntryGetParentEntry(v24, "IOService", &parent);
    io_object_t v25 = parent;
    if (!parent) {
      goto LABEL_29;
    }
    while (1)
    {
      if (!IOObjectConformsTo(v25, "IOMedia")) {
        goto LABEL_26;
      }
      CFAllocatorRef v26 = CFGetAllocator(v13);
      CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v25, @"BSD Unit", v26, 0);
      if (!CFProperty) {
        goto LABEL_26;
      }
      CFNumberRef v28 = CFProperty;
      int valuePtr = 0;
      CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
      int v29 = valuePtr;
      if (v29 != sub_100005864((uint64_t)v13)) {
        break;
      }
      CFRelease(v28);
LABEL_26:
      IORegistryEntryGetParentEntry(v25, "IOService", &parent);
      IOObjectRelease(v25);
      io_object_t v25 = parent;
      io_registry_entry_t parent = 0;
      if (!v25) {
        goto LABEL_29;
      }
    }
    CFAllocatorRef v30 = CFGetAllocator(v13);
    CFStringRef v31 = (const __CFString *)IORegistryEntryCreateCFProperty(v25, @"BSD Name", v30, 0);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    *(_OWORD *)int buffer = 0u;
    long long v39 = 0u;
    CFStringGetCString(v31, buffer, 128, 0x8000100u);
    __strlcpy_chk();
    __strlcat_chk();
    sub_100005ED8((uint64_t)v13, __s1);
    IOObjectRelease(v25);
    CFRelease(v28);
LABEL_29:
    CFStringRef v5 = v23;
    CFBooleanRef v7 = kCFBooleanFalse;
    CFBooleanRef v6 = kCFBooleanTrue;
LABEL_30:
    if (sub_100017218((uint64_t)v13, 16) && sub_100017218((uint64_t)v13, 4)) {
      sub_100005EBC((uint64_t)v13, 0x40000, 1);
    }
    sub_100008B68("created disk, id = %@.", v13);
    sub_100017434((uint64_t)v13, 0x10000, 0);
    CFArrayInsertValueAtIndex(*v11, 0, v13);
    __uint64_t v32 = malloc_type_malloc(0x10uLL, 0x10200405A9B18D6uLL);
    if (v32)
    {
      uint64_t v33 = (uint64_t)v32;
      v32[1] = v13;
      CFRetain(v13);
      sub_100017794((uint64_t)sub_10000B6A8, v33, (uint64_t (*)(uint64_t, uint64_t))sub_10000B6B0, v33);
    }
    if (sub_100005828((uint64_t)v13, @"DADeviceInternal") == v7
      || sub_100005828((uint64_t)v13, @"DAMediaRemovable") == v6)
    {
      sub_100002280();
    }
    CFRelease(v13);
    unint64_t v8 = v11;
LABEL_39:
    if (notification[1]) {
      IOObjectRelease(notification[1]);
    }
    if (notification[0]) {
      IOObjectRelease(notification[0]);
    }
LABEL_43:
    IOObjectRelease(v4);
    io_object_t v4 = IOIteratorNext(iterator);
  }
  while (v4);
LABEL_44:
  sub_1000135F4();
}

const void *sub_1000104D8(io_object_t a1)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000252B0);
  if (Count < 1) {
    return 0;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_1000252B0, v4);
    io_object_t v6 = sub_100005820((uint64_t)ValueAtIndex);
    if (IOObjectIsEqualTo(v6, a1)) {
      break;
    }
    if (v3 == ++v4) {
      return 0;
    }
  }
  return ValueAtIndex;
}

void sub_10001055C(io_object_t a1)
{
  CFIndex v2 = (void *)sub_1000104D8(a1);
  if (v2)
  {
    CFIndex v3 = v2;
    CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      CFStringRef v5 = Mutable;
      CFMutableDictionaryRef properties = 0;
      CFAllocatorRef v6 = CFGetAllocator(v3);
      IORegistryEntryCreateCFProperties(a1, &properties, v6, 0);
      if (properties)
      {
        CFDictionaryRef Value = CFDictionaryGetValue(properties, @"Content");
        if (sub_10000445C((uint64_t)v3, @"DAMediaContent", Value))
        {
          sub_100005C24((uint64_t)v3, @"DAMediaContent", Value);
          CFArrayAppendValue(v5, @"DAMediaContent");
        }
        unint64_t v8 = CFDictionaryGetValue(properties, @"Ejectable");
        if (sub_10000445C((uint64_t)v3, @"DAMediaEjectable", v8))
        {
          sub_100005C24((uint64_t)v3, @"DAMediaEjectable", v8);
          CFArrayAppendValue(v5, @"DAMediaEjectable");
        }
        int v9 = CFDictionaryGetValue(properties, @"Leaf");
        if (sub_10000445C((uint64_t)v3, @"DAMediaLeaf", v9))
        {
          sub_100005C24((uint64_t)v3, @"DAMediaLeaf", v9);
          CFArrayAppendValue(v5, @"DAMediaLeaf");
        }
        uint64_t v10 = CFDictionaryGetValue(properties, @"Preferred Block Size");
        if (sub_10000445C((uint64_t)v3, @"DAMediaBlockSize", v10))
        {
          sub_100005C24((uint64_t)v3, @"DAMediaBlockSize", v10);
          CFArrayAppendValue(v5, @"DAMediaBlockSize");
        }
        CFStringRef v11 = CFDictionaryGetValue(properties, @"Removable");
        if (sub_10000445C((uint64_t)v3, @"DAMediaRemovable", v11))
        {
          sub_100005C24((uint64_t)v3, @"DAMediaRemovable", v11);
          CFArrayAppendValue(v5, @"DAMediaRemovable");
        }
        int v12 = CFDictionaryGetValue(properties, @"Size");
        if (sub_10000445C((uint64_t)v3, @"DAMediaSize", v12))
        {
          sub_100005C24((uint64_t)v3, @"DAMediaSize", v12);
          CFArrayAppendValue(v5, @"DAMediaSize");
        }
        CFStringRef v13 = (const __CFString *)CFDictionaryGetValue(properties, @"UUID");
        if (v13)
        {
          CFUUIDRef v14 = sub_100002BB8(kCFAllocatorDefault, v13);
          if (v14)
          {
            CFUUIDRef v15 = v14;
            if (sub_10000445C((uint64_t)v3, @"DAMediaUUID", v14))
            {
              sub_100005C24((uint64_t)v3, @"DAMediaUUID", v15);
              CFArrayAppendValue(v5, @"DAMediaUUID");
            }
            CFRelease(v15);
          }
        }
        uint64_t v16 = CFDictionaryGetValue(properties, @"Whole");
        if (sub_10000445C((uint64_t)v3, @"DAMediaWhole", v16))
        {
          sub_100005C24((uint64_t)v3, @"DAMediaWhole", v16);
          CFArrayAppendValue(v5, @"DAMediaWhole");
        }
        uint64_t v17 = CFDictionaryGetValue(properties, @"Writable");
        if (sub_10000445C((uint64_t)v3, @"DAMediaWritable", v17))
        {
          sub_100005C24((uint64_t)v3, @"DAMediaWritable", v17);
          CFArrayAppendValue(v5, @"DAMediaWritable");
        }
        CFMutableDictionaryRef v18 = malloc_type_malloc(0x10uLL, 0x10200405A9B18D6uLL);
        if (v18)
        {
          uint64_t v19 = (uint64_t)v18;
          v18[1] = v3;
          CFRetain(v3);
          sub_100017794((uint64_t)sub_10000B6A8, v19, (uint64_t (*)(uint64_t, uint64_t))sub_10000B6B0, v19);
        }
        CFTypeRef v20 = IORegistryEntrySearchCFProperty(a1, "IOService", @"AppleTDMLocked", kCFAllocatorDefault, 3u);
        if (sub_10000445C((uint64_t)v3, @"DADeviceTDMLocked", v20))
        {
          sub_100005C24((uint64_t)v3, @"DADeviceTDMLocked", v20);
          CFArrayAppendValue(v5, @"DADeviceTDMLocked");
        }
        if (v20) {
          CFRelease(v20);
        }
        if (CFArrayGetCount(v5))
        {
          sub_100008B68("updated disk, id = %@.", v3);
          if (sub_100005940((uint64_t)v3, 0x80000)) {
            sub_10000CA44(v3, v5);
          }
        }
        CFRelease(properties);
      }
      CFRelease(v5);
    }
  }
}

void sub_1000109E4(uint64_t a1, io_object_t a2, int a3, uint64_t a4)
{
  if (a3 == -536870608)
  {
    sub_10001055C(a2);
  }
  else if (a3 == -536870624)
  {
    CFStringRef v5 = sub_1000104D8(a2);
    if (v5)
    {
      uint64_t v6 = (uint64_t)v5;
      if (a4)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        sub_100005A7C(v6, Current);
      }
      else
      {
        sub_10000FF28((int)v5, dword_1000252D4);
        sub_100005A7C(v6, 0.0);
        sub_1000135F4();
      }
    }
  }
}

void sub_100010AB4(uint64_t a1, io_iterator_t a2)
{
  theArray = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (a1) {
    io_object_t v4 = sub_100005820(a1);
  }
  else {
    io_object_t v4 = IOIteratorNext(a2);
  }
  io_object_t v5 = v4;
  if (v4)
  {
    CFBooleanRef v6 = kCFBooleanTrue;
    int v27 = -1;
    io_iterator_t v30 = a2;
    uint64_t v29 = a1;
    while (1)
    {
      CFBooleanRef v7 = (void *)sub_1000104D8(v5);
      if (!v7)
      {
        if (a1) {
          sub_10001A9EC();
        }
        sub_10000FF28(0, dword_1000252D4);
        CFBooleanRef v7 = (void *)sub_1000104D8(v5);
        if (!v7) {
          goto LABEL_43;
        }
      }
      sub_100008B68("removed disk, id = %@.", v7);
      if (sub_100005848((uint64_t)v7, 1))
      {
        unint64_t v8 = (const char *)sub_100005848((uint64_t)v7, 1);
        unlink(v8);
      }
      if (sub_100005848((uint64_t)v7, 0))
      {
        int v9 = (const char *)sub_100005848((uint64_t)v7, 0);
        unlink(v9);
      }
      sub_10000CDD4(v7);
      if (sub_100005940((uint64_t)v7, 0x80000)) {
        sub_10000CB00(v7);
      }
      if (sub_100005940((uint64_t)v7, 0x40000))
      {
        sub_100005EBC((uint64_t)v7, 0x80000, 1);
        sub_10000CCB4(v7, 0x80000u, 0);
        CFBooleanRef v10 = (const __CFBoolean *)sub_100005828((uint64_t)v7, @"DAVolumeMountable");
        if (sub_100005828((uint64_t)v7, @"DAVolumePath"))
        {
          if (v10 != kCFBooleanFalse && sub_100005828((uint64_t)v7, @"DAMediaWritable") == v6)
          {
            CFURLRef v11 = (const __CFURL *)sub_100005828((uint64_t)v7, @"DAVolumePath");
            int v12 = sub_100008040(v11);
            if (!v12) {
              goto LABEL_22;
            }
            CFStringRef v13 = v12;
            long long v58 = 0u;
            long long v59 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
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
            memset(v31, 0, sizeof(v31));
            int v14 = sub_100007B64((const char *)v12, v31, 2);
            char v15 = v32;
            free(v13);
            if (v14 || (v15 & 1) == 0)
            {
LABEL_22:
              CFMutableDataRef v16 = sub_100005904(v7);
              if (v27 != -1 && v27 != sub_100005864((uint64_t)v7)) {
                nullsub_4(theArray);
              }
              CFArrayAppendValue(theArray, v16);
              int v27 = sub_100005864((uint64_t)v7);
            }
          }
        }
      }
      uint64_t v17 = sub_10000588C((uint64_t)v7);
      uint64_t v18 = v17;
      if (!v17 || (CFStringRef v19 = @"FSKit", !sub_100006648(v17))) {
        CFStringRef v19 = @"kext";
      }
      BOOL v20 = sub_100005940((uint64_t)v7, 0x100000)
         && sub_100005940((uint64_t)v7, 2)
         && sub_100005940((uint64_t)v7, 16)
         && sub_10000586C((uint64_t)v7) == 0;
      uint64_t v21 = sub_100005828((uint64_t)v7, @"DAVolumePath");
      if (sub_100005940((uint64_t)v7, 0x10000)) {
        break;
      }
      BOOL v22 = 0;
      if (v18) {
        goto LABEL_36;
      }
LABEL_37:
      BOOL v23 = sub_100005940((uint64_t)v7, 0x80000);
      BOOL v24 = sub_100005940((uint64_t)v7, 2);
      BOOL v25 = sub_100005940((uint64_t)v7, 0x200000);
      BOOL v26 = sub_100005940((uint64_t)v7, 0x10000000);
      sub_100004150(v18, (unint64_t)v19, v21 != 0, v23, v22, v24, v25, v20, v26);
      CFBooleanRef v6 = kCFBooleanTrue;
      if (sub_100005828((uint64_t)v7, @"DAMediaWhole") == kCFBooleanTrue)
      {
        sub_100017434((uint64_t)v7, 16, 0);
        sub_100017434((uint64_t)v7, 2, 0);
        sub_100017434((uint64_t)v7, 4, 0);
      }
      sub_100005EBC((uint64_t)v7, 0x10000000, 1);
      a2 = v30;
      a1 = v29;
      if (sub_100005828((uint64_t)v7, @"DADeviceInternal") == kCFBooleanFalse
        || sub_100005828((uint64_t)v7, @"DAMediaRemovable") == kCFBooleanTrue)
      {
        sub_1000022C8();
        sub_10001347C();
      }
      sub_100007D50((const __CFArray *)qword_1000252B0, v7);
      if (v29) {
        goto LABEL_47;
      }
LABEL_43:
      IOObjectRelease(v5);
      io_object_t v5 = IOIteratorNext(a2);
      if (!v5) {
        goto LABEL_47;
      }
    }
    BOOL v22 = sub_100005940((uint64_t)v7, 1);
    if (!v18) {
      goto LABEL_37;
    }
LABEL_36:
    uint64_t v18 = (uint64_t)sub_100006624(v18);
    goto LABEL_37;
  }
LABEL_47:
  if (CFArrayGetCount(theArray)) {
    nullsub_4(theArray);
  }
  CFRelease(theArray);
  sub_1000135F4();
}

void sub_10001100C(int a1, uint64_t a2)
{
  if (a2 == 8)
  {
    sub_100011130(a1);
  }
  else if (a2 == 2)
  {
    uint64_t msg = dispatch_mach_msg_get_msg();
    if ((dispatch_mach_mig_demux() & 1) == 0)
    {
      if (*(_DWORD *)(msg + 20) == 70) {
        sub_1000110D8(a1);
      }
      io_object_t v4 = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
      mach_msg_destroy(v4);
    }
  }
}

void sub_1000110D8(int a1)
{
  sub_100008A7C("? [?]:%d -> %s", a1, (const char *)qword_100025318);
  if (a1)
  {
    CFIndex v2 = sub_100011324(a1);
    if (v2) {
      sub_1000130BC((uint64_t)v2);
    }
  }
}

uint64_t sub_100011130(int a1)
{
  sub_100008A7C("? [?]:%d -> %s", a1, (const char *)qword_100025318);
  if (a1 && (CFIndex v2 = sub_100011324(a1)) != 0)
  {
    CFIndex v3 = v2;
    sub_100008A7C("%@ -> %s", v2, qword_100025318);
    sub_1000089E0("  removed session, id = %@.", v3);
    io_object_t v4 = (__CFArray *)sub_10000586C((uint64_t)v3);
    if (v4) {
      CFArrayRemoveAllValues(v4);
    }
    io_object_t v5 = (__CFArray *)sub_100005874((uint64_t)v3);
    if (v5) {
      CFArrayRemoveAllValues(v5);
    }
    sub_10000CEC0(v3);
    sub_1000131E0((uint64_t)v3, 0x10000000, 1);
    if (!sub_100012FE4((uint64_t)v3))
    {
      sub_1000022C8();
      sub_10001347C();
    }
    sub_100007D50((const __CFArray *)qword_100025330, v3);
    return 0;
  }
  else
  {
    sub_1000089E0("unable to release session, id = ? [?]:%d.", a1);
    return 4175036419;
  }
}

uint64_t sub_100011238(int a1, const char *a2, vm_address_t *a3, unsigned int *a4)
{
  if (!a1 || (unint64_t v8 = sub_100011324(a1)) == 0)
  {
    sub_100008A7C("? [?]:%d -> %s");
LABEL_9:
    uint64_t v13 = 4175036419;
    sub_1000089E0("unable to copy disk description, id = %s (status code 0x%08X).", a2, -119930877);
    return v13;
  }
  int v9 = v8;
  CFBooleanRef v10 = sub_10000FD14(a2);
  if (!v10 || (CFDataRef v11 = sub_100005904(v10)) == 0 || (v12 = sub_100007DB8(v11, a4), (*a3 = v12) == 0))
  {
    sub_100008A7C("? [?]:%d -> %s", a1, (const char *)qword_100025318);
    sub_100008A7C("%@ -> %s", v9, qword_100025318);
    goto LABEL_9;
  }
  return 0;
}

const void *sub_100011324(int a1)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100025330);
  if (Count < 1) {
    return 0;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100025330, v4);
    if (sub_100012FA0((uint64_t)ValueAtIndex) == a1) {
      break;
    }
    if (v3 == ++v4) {
      return 0;
    }
  }
  return ValueAtIndex;
}

uint64_t sub_1000113A4(int a1, const char *a2, _DWORD *a3)
{
  sub_100008A7C("? [?]:%d -> %s", a1, (const char *)qword_100025318);
  if (a1
    && (CFBooleanRef v6 = sub_100011324(a1)) != 0
    && (sub_100008A7C("%@ -> %s", v6, qword_100025318), (CFBooleanRef v7 = sub_10000FD14(a2)) != 0))
  {
    unint64_t v8 = v7;
    uint64_t v9 = sub_1000058F4((uint64_t)v7);
    *a3 = v9;
    sub_1000089E0("  got disk options, id = %@, options = 0x%08X.", v8, v9);
    return 0;
  }
  else
  {
    uint64_t v10 = 4175036419;
    sub_1000089E0("unable to get disk options, id = %s (status code 0x%08X).", a2, -119930877);
  }
  return v10;
}

uint64_t sub_100011468(int a1, const char *a2, _DWORD *a3)
{
  uint64_t v3 = 4175036419;
  if (a1)
  {
    if (sub_100011324(a1))
    {
      CFBooleanRef v6 = sub_10000FD14(a2);
      if (v6)
      {
        uint64_t v3 = 0;
        *a3 = sub_100005964((uint64_t)v6);
      }
    }
  }
  return v3;
}

uint64_t sub_1000114C4(int a1, const char *a2, _DWORD *a3)
{
  sub_100008A7C("? [?]:%d -> %s", a1, (const char *)qword_100025318);
  if (a1
    && (CFBooleanRef v6 = sub_100011324(a1)) != 0
    && (sub_100008A7C("%@ -> %s", v6, qword_100025318), (CFBooleanRef v7 = sub_10000FD14(a2)) != 0))
  {
    unint64_t v8 = v7;
    uint64_t v9 = sub_10000586C((uint64_t)v7);
    *a3 = v9 != 0;
    uint64_t v10 = "false";
    if (v9) {
      uint64_t v10 = "true";
    }
    sub_1000089E0("  got disk claim state, id = %@, claimed = %s.", v8, v10);
    return 0;
  }
  else
  {
    uint64_t v11 = 4175036419;
    sub_1000089E0("unable to get disk claim state, id = %s (status code 0x%08X).", a2, -119930877);
  }
  return v11;
}

uint64_t sub_1000115A4(int a1, const char *a2, int a3, _OWORD *a4)
{
  uint64_t v8 = 4175036419;
  sub_100008A7C("? [?]:%d -> %s", a1, (const char *)qword_100025318);
  if (!a1) {
    goto LABEL_8;
  }
  uint64_t v9 = sub_100011324(a1);
  if (!v9) {
    goto LABEL_8;
  }
  sub_100008A7C("%@ -> %s", v9, qword_100025318);
  uint64_t v10 = sub_10000FD14(a2);
  if (!v10) {
    goto LABEL_8;
  }
  uint64_t v11 = (uint64_t)v10;
  long long v12 = a4[1];
  *(_OWORD *)atoken.val = *a4;
  *(_OWORD *)&atoken.val[4] = v12;
  audit_token_to_euid(&atoken);
  long long v13 = a4[1];
  *(_OWORD *)atoken.val = *a4;
  *(_OWORD *)&atoken.val[4] = v13;
  audit_token_to_egid(&atoken);
  uint64_t v8 = sub_100014910();
  if (v8) {
    goto LABEL_8;
  }
  int v14 = "true";
  if (!a3) {
    int v14 = "false";
  }
  sub_1000089E0("  set disk adoption, id = %@, adoption = %s.", v11, v14);
  uint64_t v8 = sub_10000B27C(v11, a3);
  if (v8) {
LABEL_8:
  }
    sub_1000089E0("unable to set disk adoption, id = %s (status code 0x%08X).", a2, v8);
  return v8;
}

uint64_t sub_1000116E8(int a1, const char *a2, uint64_t a3, _OWORD *a4)
{
  uint64_t v8 = 4175036419;
  sub_100008A7C("? [?]:%d -> %s", a1, (const char *)qword_100025318);
  if (!a1) {
    goto LABEL_6;
  }
  uint64_t v9 = sub_100011324(a1);
  if (!v9) {
    goto LABEL_6;
  }
  sub_100008A7C("%@ -> %s", v9, qword_100025318);
  uint64_t v10 = (void *)sub_10000FD14(a2);
  if (!v10) {
    goto LABEL_6;
  }
  uint64_t v11 = v10;
  long long v12 = a4[1];
  *(_OWORD *)atoken.val = *a4;
  *(_OWORD *)&atoken.val[4] = v12;
  audit_token_to_euid(&atoken);
  long long v13 = a4[1];
  *(_OWORD *)atoken.val = *a4;
  *(_OWORD *)&atoken.val[4] = v13;
  audit_token_to_egid(&atoken);
  uint64_t v8 = sub_100014910();
  if (v8
    || (sub_1000089E0("  set disk encoding, id = %@, encoding = %d.", v11, a3), uint64_t v8 = sub_10000B37C(v11, a3), v8))
  {
LABEL_6:
    sub_1000089E0("unable to set disk encoding, id = %s (status code 0x%08X).", a2, v8);
  }
  return v8;
}

uint64_t sub_100011814(int a1, const char *a2, uint64_t a3, int a4)
{
  sub_100008A7C("? [?]:%d -> %s", a1, (const char *)qword_100025318);
  if (a1
    && (uint64_t v8 = sub_100011324(a1)) != 0
    && (sub_100008A7C("%@ -> %s", v8, qword_100025318), (uint64_t v9 = sub_10000FD14(a2)) != 0))
  {
    uint64_t v10 = (uint64_t)v9;
    uint64_t v11 = "true";
    if (!a4) {
      uint64_t v11 = "false";
    }
    sub_1000089E0("  set disk options, id = %@, options = 0x%08X, value = %s.", v9, a3, v11);
    sub_100005E5C(v10, a3, a4);
    return 0;
  }
  else
  {
    uint64_t v12 = 4175036419;
    sub_1000089E0("unable to set disk options, id = %s (status code 0x%08X).", a2, -119930877);
  }
  return v12;
}

uint64_t sub_100011908(int a1, const char *a2)
{
  sub_100008A7C("? [?]:%d -> %s", a1, (const char *)qword_100025318);
  if (a1
    && (CFIndex v4 = sub_100011324(a1)) != 0
    && (v5 = v4, sub_100008A7C("%@ -> %s", v4, qword_100025318), (CFBooleanRef v6 = sub_10000FD14(a2)) != 0)
    && (v7 = (uint64_t)v6, (CFDictionaryRef v8 = (const __CFDictionary *)sub_10000586C((uint64_t)v6)) != 0)
    && sub_1000030DC(v8) == v5)
  {
    sub_1000089E0("  unclaimed disk, id = %@.", v7);
    sub_100005B58(v7, 0);
    return 0;
  }
  else
  {
    uint64_t v9 = 4175036419;
    sub_1000089E0("unable to unclaim disk, id = %s (status code 0x%08X).", a2, -119930877);
  }
  return v9;
}

uint64_t sub_1000119E4(int a1, vm_address_t *a2, unsigned int *a3)
{
  uint64_t v6 = 4175036419;
  sub_100008A7C("? [?]:%d -> %s", a1, (const char *)qword_100025318);
  if (!a1) {
    goto LABEL_14;
  }
  uint64_t v7 = sub_100011324(a1);
  if (!v7) {
    goto LABEL_14;
  }
  uint64_t v8 = (uint64_t)v7;
  sub_100008A7C("%s -> %@", qword_100025318, v7);
  CFArrayRef v9 = (const __CFArray *)sub_10000586C(v8);
  if (!v9)
  {
    sub_1000131E0(v8, 0x1000000, 0);
LABEL_14:
    sub_1000089E0("unable to copy callback queue (status code 0x%08X).", v6);
    return v6;
  }
  CFArrayRef v10 = v9;
  CFIndex Count = CFArrayGetCount(v9);
  if (Count >= 1)
  {
    CFIndex v12 = Count;
    for (CFIndex i = 0; i != v12; ++i)
    {
      CFDictionaryRef ValueAtIndex = (__CFDictionary *)CFArrayGetValueAtIndex(v10, i);
      sub_100003164(ValueAtIndex, 0);
      sub_10000317C(ValueAtIndex, 0);
      sub_100003194(ValueAtIndex, 0);
    }
  }
  CFDataRef v15 = sub_1000080B0(kCFAllocatorDefault);
  if (v15)
  {
    CFDataRef v16 = v15;
    vm_address_t v17 = sub_100007DB8(v15, a3);
    *a2 = v17;
    if (v17)
    {
      sub_1000089E0("  dispatched callback queue.");
      uint64_t v6 = 0;
    }
    CFRelease(v16);
  }
  CFArrayRemoveAllValues(v10);
  sub_1000131E0(v8, 0x1000000, 0);
  if (v6) {
    goto LABEL_14;
  }
  return v6;
}

BOOL sub_100011B60(_OWORD *a1, const __CFString *a2)
{
  long long v3 = a1[1];
  *(_OWORD *)v10.val = *a1;
  *(_OWORD *)&v10.val[4] = v3;
  CFIndex v4 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v10);
  if (!v4) {
    return 0;
  }
  io_object_t v5 = v4;
  CFTypeRef v6 = SecTaskCopyValueForEntitlement(v4, a2, 0);
  if (v6)
  {
    uint64_t v7 = v6;
    BOOL v8 = CFEqual(v6, kCFBooleanTrue) != 0;
    CFRelease(v7);
  }
  else
  {
    BOOL v8 = 0;
  }
  CFRelease(v5);
  return v8;
}

uint64_t sub_100011C08(int a1, const char *a2, _OWORD *a3, _DWORD *a4)
{
  long long v8 = a3[1];
  *(_OWORD *)atoken.val = *a3;
  *(_OWORD *)&atoken.val[4] = v8;
  pid_t v9 = audit_token_to_pid(&atoken);
  sub_100008A7C("%s [%d] -> %s", a2, v9, (const char *)qword_100025318);
  if (a1)
  {
    long long v10 = a3[1];
    *(_OWORD *)atoken.val = *a3;
    *(_OWORD *)&atoken.val[4] = v10;
    if (sub_100011B60(&atoken, @"com.apple.private.diskarbitrationd.access"))
    {
      long long v11 = a3[1];
      *(_OWORD *)atoken.val = *a3;
      *(_OWORD *)&atoken.val[4] = v11;
      BOOL v12 = sub_100011B60(&atoken, @"com.apple.private.diskarbitrationd.is_fskitd");
      long long v13 = a3[1];
      *(_OWORD *)atoken.val = *a3;
      *(_OWORD *)&atoken.val[4] = v13;
      pid_t v14 = audit_token_to_pid(&atoken);
      uint64_t v15 = sub_100012E28(kCFAllocatorDefault, a2, v14);
      if (v15)
      {
        CFDataRef v16 = (const void *)v15;
        sub_100008A7C("%@ -> %s", v15, qword_100025318);
        sub_1000089E0("  created session, id = %@.", v16);
        *a4 = sub_100012FA0((uint64_t)v16);
        sub_100002280();
        CFArrayAppendValue((CFMutableArrayRef)qword_100025330, v16);
        sub_1000130F4();
        sub_1000131B4((uint64_t)v16, v12);
        CFRelease(v16);
        return 0;
      }
    }
    else
    {
      sub_1000089E0("no entitlement");
    }
  }
  long long v18 = a3[1];
  *(_OWORD *)atoken.val = *a3;
  *(_OWORD *)&atoken.val[4] = v18;
  pid_t v19 = audit_token_to_pid(&atoken);
  sub_1000089E0("unable to create session, id = %s [%d].", a2, v19);
  return 4175036419;
}

uint64_t sub_100011D8C(int a1, unsigned int a2, const char *a3, uint64_t a4, const UInt8 *a5, unsigned int a6, const UInt8 *a7, unsigned int a8, uint64_t a9, uint64_t a10, _OWORD *a11)
{
  uint64_t v18 = a10;
  sub_100008A7C("? [?]:%d -> %s", a1, (const char *)qword_100025318);
  if (!a1
    || (pid_t v19 = sub_100011324(a1)) == 0
    || (BOOL v20 = v19, sub_100008A7C("%@ -> %s", v19, qword_100025318), (v66 = sub_10000FD14(a3)) == 0))
  {
    uint64_t v23 = 4175036419;
LABEL_8:
    BOOL v24 = sub_10000808C(a2);
    sub_1000089E0("unable to queue solicitation, id = %016llX:%016llX, kind = %s, disk = %s (status code 0x%08X).", a9, v18, v24, a3, v23);
    return v23;
  }
  sub_100008A7C("%@ -> %s", v20, qword_100025318);
  if (a5)
  {
    CFStringRef v21 = (const __CFString *)sub_1000083B8(kCFAllocatorDefault, a5, a6);
    if (a7)
    {
LABEL_6:
      CFPropertyListRef v22 = sub_1000083B8(kCFAllocatorDefault, a7, a8);
      goto LABEL_12;
    }
  }
  else
  {
    CFStringRef v21 = 0;
    if (a7) {
      goto LABEL_6;
    }
  }
  CFPropertyListRef v22 = 0;
LABEL_12:
  BOOL v26 = sub_100002F40(kCFAllocatorDefault, v20, a9, a10, a2, 0, 0, 0);
  uint64_t v65 = a4;
  uint64_t v27 = (int)a4;
  long long v28 = a11[1];
  *(_OWORD *)atoken.val = *a11;
  *(_OWORD *)&atoken.val[4] = v28;
  uid_t v29 = audit_token_to_euid(&atoken);
  long long v30 = a11[1];
  *(_OWORD *)atoken.val = *a11;
  *(_OWORD *)&atoken.val[4] = v30;
  gid_t v31 = audit_token_to_egid(&atoken);
  CFStringRef v32 = v21;
  long long v33 = sub_10000D500((uint64_t)kCFAllocatorDefault, a2, v66, v27, v21, v22, v29, v31, v26);
  if (v33)
  {
    long long v34 = v33;
    switch(a2)
    {
      case 5u:
      case 0xCu:
      case 0xDu:
        long long v51 = a11[1];
        *(_OWORD *)atoken.val = *a11;
        *(_OWORD *)&atoken.val[4] = v51;
        audit_token_to_euid(&atoken);
        long long v52 = a11[1];
        *(_OWORD *)atoken.val = *a11;
        *(_OWORD *)&atoken.val[4] = v52;
        audit_token_to_egid(&atoken);
        uint64_t v23 = sub_100014910();
        goto LABEL_30;
      case 7u:
        long long v35 = a11[1];
        *(_OWORD *)atoken.val = *a11;
        *(_OWORD *)&atoken.val[4] = v35;
        audit_token_to_euid(&atoken);
        long long v36 = a11[1];
        *(_OWORD *)atoken.val = *a11;
        *(_OWORD *)&atoken.val[4] = v36;
        audit_token_to_egid(&atoken);
        uint64_t v23 = sub_100014910();
        if (v23) {
          goto LABEL_34;
        }
        long long v37 = sub_100005828((uint64_t)v66, @"DAMediaContent");
        if (CFEqual(v37, @"C12A7328-F81F-11D2-BA4B-00A0C93EC93B"))
        {
          long long v38 = a11[1];
          *(_OWORD *)atoken.val = *a11;
          *(_OWORD *)&atoken.val[4] = v38;
          if (audit_token_to_euid(&atoken))
          {
            long long v39 = a11[1];
            *(_OWORD *)atoken.val = *a11;
            *(_OWORD *)&atoken.val[4] = v39;
            uid_t v40 = audit_token_to_euid(&atoken);
            if (v40 != sub_100005964((uint64_t)v66))
            {
              uint64_t v23 = 4175036424;
              goto LABEL_34;
            }
          }
        }
        if (!v32) {
          goto LABEL_33;
        }
        CFURLRef v41 = CFURLCreateWithString(kCFAllocatorDefault, v32, 0);
        if (!v41) {
          goto LABEL_33;
        }
        CFURLRef v42 = v41;
        memset(&v69, 0, sizeof(v69));
        long long v43 = sub_100008040(v41);
        uint64_t v44 = 4175036419;
        CFURLRef cf = v42;
        if (!v43) {
          goto LABEL_57;
        }
        uint64_t v63 = v43;
        if ((v65 & 2) != 0)
        {
          __strlcpy_chk();
        }
        else
        {
          if (!realpath_DARWIN_EXTSN((const char *)v43, (char *)&atoken)) {
            goto LABEL_57;
          }
          size_t v45 = strlen((const char *)&atoken);
          CFURLRef v46 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)&atoken, v45, 1u);
          if (v46)
          {
            CFURLRef v47 = v46;
            long long v48 = (__CFString *)CFURLGetString(v46);
            sub_10000EB40(v34, v48);
            CFRelease(v47);
          }
        }
        long long v57 = a11[1];
        *(_OWORD *)v68.val = *a11;
        *(_OWORD *)&v68.val[4] = v57;
        if (audit_token_to_euid(&v68))
        {
          if (fstatat(-2, (const char *)&atoken, &v69, 2048))
          {
            uint64_t v44 = *__error() | 0xC000u;
          }
          else
          {
            long long v58 = a11[1];
            *(_OWORD *)v68.val = *a11;
            *(_OWORD *)&v68.val[4] = v58;
            uid_t v59 = audit_token_to_euid(&v68);
            if (v59 == v69.st_uid) {
              uint64_t v44 = 0;
            }
            else {
              uint64_t v44 = 4175036425;
            }
          }
        }
        else
        {
          uint64_t v44 = 0;
        }
        free(v63);
LABEL_57:
        long long v60 = a11[1];
        *(_OWORD *)v68.val = *a11;
        *(_OWORD *)&v68.val[4] = v60;
        if (audit_token_to_euid(&v68))
        {
          long long v61 = a11[1];
          *(_OWORD *)v68.val = *a11;
          *(_OWORD *)&v68.val[4] = v61;
          uid_t v62 = audit_token_to_euid(&v68);
          if (v62 == sub_100005964((uint64_t)v66)) {
            uint64_t v44 = v44;
          }
          else {
            uint64_t v44 = 4175036425;
          }
        }
        CFRelease(cf);
        uint64_t v23 = v44;
        goto LABEL_30;
      case 0xAu:
        long long v49 = a11[1];
        *(_OWORD *)atoken.val = *a11;
        *(_OWORD *)&atoken.val[4] = v49;
        pid_t v50 = audit_token_to_pid(&atoken);
        if (v50 == getpid())
        {
          sub_100008798("_kDADiskProbe authorized ourself");
LABEL_33:
          sub_10000D010(v34);
          long long v53 = sub_10000808C(a2);
          sub_100008B68("  %@ queued solicitation, id = %016llX:%016llX, kind = %s, disk = %@, options = 0x%08X.", v20, a9, a10, v53, v66, v65);
          uint64_t v23 = 0;
          goto LABEL_34;
        }
        int v54 = sub_100012FA8((uint64_t)v20);
        long long v55 = a11[1];
        if (v54) {
          uint64_t v23 = 0;
        }
        else {
          uint64_t v23 = 4175036425;
        }
        *(_OWORD *)atoken.val = *a11;
        *(_OWORD *)&atoken.val[4] = v55;
        pid_t v56 = audit_token_to_pid(&atoken);
        sub_100008798("_kDADiskProbe checking request from pid %u, replying %d", v56, v23);
LABEL_30:
        if (!v23) {
          goto LABEL_33;
        }
LABEL_34:
        CFRelease(v34);
        if (v26) {
          goto LABEL_35;
        }
        goto LABEL_36;
      case 0x11u:
        if (sub_100012FA8((uint64_t)v20)) {
          goto LABEL_33;
        }
        uint64_t v23 = 4175036425;
        goto LABEL_34;
      default:
        goto LABEL_33;
    }
  }
  uint64_t v23 = 4175036419;
  if (v26) {
LABEL_35:
  }
    CFRelease(v26);
LABEL_36:
  if (v32) {
    CFRelease(v32);
  }
  uint64_t v18 = a10;
  if (v22) {
    CFRelease(v22);
  }
  if (v23) {
    goto LABEL_8;
  }
  return v23;
}

uint64_t sub_1000123EC(int a1, uint64_t a2, uint64_t a3, unsigned int a4, const char *a5, const UInt8 *a6, unsigned int a7, int a8)
{
  sub_100008A7C("? [?]:%d -> %s", a1, (const char *)qword_100025318);
  if (a1 && (CFDataRef v16 = sub_100011324(a1)) != 0)
  {
    sub_100008A7C("%@ -> %s", v16, qword_100025318);
    if (a6) {
      a6 = (const UInt8 *)sub_1000083B8(kCFAllocatorDefault, a6, a7);
    }
    if (!sub_10000BF28(a6, a8))
    {
      vm_address_t v17 = sub_10000808C(a4);
      sub_1000089E0("  dispatched response, id = %016llX:%016llX, kind = %s, disk = %s, orphaned.", a2, a3, v17, a5);
    }
    if (a6) {
      CFRelease(a6);
    }
    return 0;
  }
  else
  {
    uint64_t v18 = 4175036419;
    sub_1000089E0("unable to dispatch response, id = %016llX:%016llX, disk = %s (status code 0x%08X).", a2, a3, a5, -119930877);
  }
  return v18;
}

uint64_t sub_100012510(int a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, __CFDictionary *a6, unsigned int a7, const UInt8 *a8, unsigned int a9)
{
  uint64_t v17 = 4175036419;
  sub_100008A7C("? [?]:%d -> %s", a1, (const char *)qword_100025318);
  if (!a1
    || (uint64_t v18 = sub_100011324(a1)) == 0
    || (pid_t v19 = v18, sub_100008A7C("%@ -> %s", v18, qword_100025318), a4 > 0x11))
  {
LABEL_30:
    uint64_t v27 = sub_10000808C(a4);
    sub_1000089E0("unable to register callback, id = %016llX:%016llX, kind = %s (status code 0x%08X).", a2, a3, v27, v17);
    return v17;
  }
  if (a6) {
    a6 = sub_100008358(kCFAllocatorDefault, (const UInt8 *)a6, a7);
  }
  if (a8) {
    a8 = (const UInt8 *)sub_1000083B8(kCFAllocatorDefault, a8, a9);
  }
  BOOL v20 = sub_100002F40(kCFAllocatorDefault, v19, a2, a3, a4, a5, a6, a8);
  if (v20)
  {
    sub_1000130B4((uint64_t)v19, v20);
    CFStringRef v21 = sub_10000808C(a4);
    sub_1000089E0("  registered callback, id = %016llX:%016llX, kind = %s.", a2, a3, v21);
    if (sub_100003090(v20))
    {
      if (sub_100003090(v20) != 15)
      {
LABEL_23:
        CFRelease(v20);
        uint64_t v17 = 0;
        goto LABEL_24;
      }
      if (!byte_100024440)
      {
        int v26 = 0;
        goto LABEL_22;
      }
      sub_10000C4E4(v20, 0, 0);
    }
    else
    {
      CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000252B0);
      if (Count >= 1)
      {
        CFIndex v23 = Count;
        for (CFIndex i = 0; i != v23; ++i)
        {
          CFDictionaryRef ValueAtIndex = (void *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000252B0, i);
          if (sub_100005940((uint64_t)ValueAtIndex, 0x80000)) {
            sub_10000C4E4(v20, ValueAtIndex, 0);
          }
        }
      }
      sub_10000CD3C((uint64_t)v19, 16, 0, 0);
      if (!byte_100024440) {
        goto LABEL_23;
      }
      sub_10000CD3C((uint64_t)v19, 15, 0, 0);
    }
    int v26 = 1;
LABEL_22:
    sub_1000131E0((uint64_t)v19, 1, v26);
    goto LABEL_23;
  }
LABEL_24:
  if (a6) {
    CFRelease(a6);
  }
  if (a8) {
    CFRelease(a8);
  }
  if (!v20) {
    goto LABEL_30;
  }
  return 0;
}

uint64_t sub_100012798(int a1)
{
  sub_100008A7C("? [?]:%d -> %s", a1, (const char *)qword_100025318);
  if (a1 && (CFIndex v2 = sub_100011324(a1)) != 0)
  {
    uint64_t v3 = (uint64_t)v2;
    sub_100008A7C("%@ -> %s", v2, qword_100025318);
    sub_1000089E0("  set keepalive, id = %@.", v3);
    sub_1000131FC(v3, 1);
    sub_1000022C8();
    sub_10001347C();
    return 0;
  }
  else
  {
    uint64_t v4 = 4175036419;
    sub_1000089E0("unable to set keep alive,  (status code 0x%08X).", -119930877);
  }
  return v4;
}

uint64_t sub_10001284C(int a1, int a2)
{
  sub_100008A7C("? [?]:%d -> %s", a1, (const char *)qword_100025318);
  if (a1 && (uint64_t v4 = sub_100011324(a1)) != 0)
  {
    uint64_t v5 = (uint64_t)v4;
    sub_100008A7C("%@ -> %s", v4, qword_100025318);
    sub_10001310C(v5, a2);
    sub_1000089E0("  set client port, id = %@.", v5);
    return 0;
  }
  else
  {
    sub_1000089E0("unable to set client port, id = ? [?]:%d.", a1);
    return 4175036419;
  }
}

uint64_t sub_100012904(int a1, uint64_t a2, uint64_t a3)
{
  sub_100008A7C("? [?]:%d -> %s", a1, (const char *)qword_100025318);
  if (a1
    && (CFTypeRef v6 = sub_100011324(a1)) != 0
    && (uint64_t v7 = v6,
        sub_100008A7C("%@ -> %s", v6, qword_100025318),
        (long long v8 = sub_100002F40(kCFAllocatorDefault, v7, a2, a3, 0, 0, 0, 0)) != 0))
  {
    CFDictionaryRef v9 = v8;
    sub_10000D2F4(v8);
    sub_100013204((uint64_t)v7, v9);
    sub_1000089E0("  unregistered callback, id = %016llX:%016llX.", a2, a3);
    CFRelease(v9);
    return 0;
  }
  else
  {
    uint64_t v10 = 4175036419;
    sub_1000089E0("unable to unregister callback, id = %016llX:%016llX (status code 0x%08X).", a2, a3, -119930877);
  }
  return v10;
}

void sub_100012A04(uint64_t a1)
{
  uint64_t v2 = sub_1000053E0(kCFAllocatorDefault, a1);
  if (v2)
  {
    uint64_t v3 = (const void *)v2;
    sub_100008B68("created disk, id = %@.", v2);
    if ((*(unsigned char *)(a1 + 67) & 0x40) != 0)
    {
      uint64_t v4 = strrchr((char *)(a1 + 1112), 64) + 1;
      if (!strncmp(v4, "/dev/disk", 9uLL))
      {
        uint64_t v5 = sub_10000FD14(v4);
        if (v5)
        {
          if (!sub_100005940((uint64_t)v5, 32)) {
            sub_100005EBC((uint64_t)v3, 32, 0);
          }
        }
      }
    }
    CFArrayInsertValueAtIndex((CFMutableArrayRef)qword_1000252B0, 0, v3);
    CFRelease(v3);
  }
}

void sub_100012AF0()
{
  long long v8 = 0;
  int v0 = getmntinfo(&v8, 2);
  if (v0 >= 1)
  {
    unint64_t v1 = 0;
    uint64_t v2 = 2168 * v0;
    do
    {
      uint64_t v3 = sub_1000085B0((uint64_t)&v8[v1 / 0x878]);
      uint64_t v4 = sub_10000FD14(v3);
      if (v4)
      {
        uint64_t v5 = v4;
        if (!sub_100005828((uint64_t)v4, @"DAVolumePath"))
        {
          if (sub_100005828((uint64_t)v5, @"DAVolumeMountable") == kCFBooleanFalse) {
            sub_10000CC7C(v5, 0);
          }
          sub_10000CC98(v5, 0);
        }
      }
      else
      {
        CFTypeRef v6 = v8;
        uint64_t v7 = &v8[v1 / 0x878];
        if (strncmp(v8[v1 / 0x878].f_mntfromname, "/dev/disk", 9uLL)
          && (v7->f_flags & 0x20) == 0
          && strcmp(v6[v1 / 0x878].f_fstypename, "devfs"))
        {
          sub_100012A04((uint64_t)v7);
          sub_1000135F4();
        }
      }
      v1 += 2168;
    }
    while (v2 != v1);
  }
}

void sub_100012C30()
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000252B0);
  if (Count >= 1)
  {
    CFIndex v1 = Count;
    for (CFIndex i = 0; i != v1; ++i)
    {
      CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_1000252B0, i);
      if (sub_100005828((uint64_t)ValueAtIndex, @"DAVolumePath")) {
        sub_10000CC98(ValueAtIndex, 0);
      }
    }
  }
}

uint64_t sub_100012CBC()
{
  if (qword_1000251C8 != -1) {
    dispatch_once(&qword_1000251C8, &stru_1000211C0);
  }
  return qword_1000251D0;
}

void sub_100012D00(id a1)
{
  qword_1000251D0 = (uint64_t)dispatch_workloop_create_inactive("DAServer");
  dispatch_set_qos_class_fallback();
  CFIndex v1 = qword_1000251D0;

  dispatch_activate(v1);
}

uint64_t sub_100012D4C()
{
  if (dword_1000251D8
    || (uint64_t result = bootstrap_check_in(bootstrap_port, "com.apple.DiskArbitration.diskarbitrationd", (mach_port_t *)&dword_1000251D8), dword_1000251D8))
  {
    if (qword_1000251C8 != -1) {
      dispatch_once(&qword_1000251C8, &stru_1000211C0);
    }
    qword_1000251E0 = dispatch_mach_create_f();
    return dispatch_mach_connect();
  }
  return result;
}

uint64_t sub_100012E20(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t sub_100012E28(const __CFAllocator *a1, const char *a2, int a3)
{
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v7 = Instance;
  if (Instance)
  {
    *(_DWORD *)(Instance + 16) = 0;
    *(void *)(Instance + 24) = 0;
    *(void *)(Instance + 32) = 0;
    *(void *)(Instance + 4sub_10000C338(16, 0, 0) = CFArrayCreateMutable(a1, 0, &kCFTypeArrayCallBacks);
    CFMutableArrayRef Mutable = CFArrayCreateMutable(a1, 0, &kCFTypeArrayCallBacks);
    *(void *)(v7 + 48) = Mutable;
    *(void *)(v7 + 64) = 0;
    *(_WORD *)(v7 + 72) = 0;
    if (!*(void *)(v7 + 40)) {
      sub_10001AA18();
    }
    if (!Mutable) {
      sub_10001AA44();
    }
    mach_port_name_t name = 0;
    if (mach_port_allocate(mach_task_self_, 1u, &name)) {
      goto LABEL_8;
    }
    sub_100012CBC();
    uint64_t f = dispatch_mach_create_f();
    if (!f
      || (uint64_t v10 = f, previous = 0, mach_port_request_notification(mach_task_self_, name, 70, 1u, name, 0x15u, &previous)))
    {
      mach_port_mod_refs(mach_task_self_, name, 1u, -1);
LABEL_8:
      CFRelease((CFTypeRef)v7);
      return 0;
    }
    if (previous) {
      sub_10001AA70();
    }
    *(void *)(v7 + 24) = strdup(a2);
    *(_DWORD *)(v7 + 32) = a3;
    *(void *)(v7 + 56) = v10;
    *(_DWORD *)(v7 + 64) = name;
  }
  return v7;
}

uint64_t sub_100012FA0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 64);
}

uint64_t sub_100012FA8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 73);
}

BOOL sub_100012FB0(uint64_t a1, int a2)
{
  return (*(_DWORD *)(a1 + 36) & a2) != 0;
}

uint64_t sub_100012FC0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 36);
}

BOOL sub_100012FC8(uint64_t a1, int a2)
{
  return (*(_DWORD *)(a1 + 68) & a2) != 0;
}

uint64_t sub_100012FD8()
{
  return qword_1000251E8;
}

uint64_t sub_100012FE4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 72);
}

uint64_t sub_100012FEC()
{
  uint64_t result = _CFRuntimeRegisterClass();
  qword_1000251E8 = result;
  return result;
}

void sub_100013014(uint64_t a1, const void *a2)
{
  *(_DWORD *)(a1 + 68) &= ~1u;
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), a2);
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 40)) == 1)
  {
    mach_port_t v3 = *(_DWORD *)(a1 + 16);
    if (v3)
    {
      *(void *)&msg.msgh_voucher_port = 0;
      msg.msgh_remote_port = v3;
      msg.msgh_local_port = 0;
      *(void *)&msg.msgh_bits = 0x1800000013;
      if (mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0) == 268435460) {
        mach_msg_destroy(&msg);
      }
    }
  }
}

void sub_1000130B4(uint64_t a1, const void *a2)
{
}

void sub_1000130BC(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    dispatch_mach_cancel();
    dispatch_release(*(dispatch_object_t *)(a1 + 56));
    *(void *)(a1 + 56) = 0;
  }
}

uint64_t sub_1000130F4()
{
  return dispatch_mach_connect();
}

void sub_10001310C(uint64_t a1, int a2)
{
  mach_port_name_t v4 = *(_DWORD *)(a1 + 16);
  if (v4) {
    mach_port_deallocate(mach_task_self_, v4);
  }
  *(_DWORD *)(a1 + 16) = a2;
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 40)))
  {
    mach_port_t v5 = *(_DWORD *)(a1 + 16);
    if (v5)
    {
      *(void *)&msg.msgh_voucher_port = 0;
      msg.msgh_remote_port = v5;
      msg.msgh_local_port = 0;
      *(void *)&msg.msgh_bits = 0x1800000013;
      if (mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0) == 268435460) {
        mach_msg_destroy(&msg);
      }
    }
  }
}

uint64_t sub_1000131B4(uint64_t result, int a2)
{
  *(unsigned char *)(result + 73) = a2 != 0;
  return result;
}

uint64_t sub_1000131C4(uint64_t result, int a2, int a3)
{
  if (a3) {
    int v3 = a2;
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(result + 36) = *(_DWORD *)(result + 36) & ~a2 | v3;
  return result;
}

uint64_t sub_1000131E0(uint64_t result, int a2, int a3)
{
  if (a3) {
    int v3 = a2;
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(result + 68) = *(_DWORD *)(result + 68) & ~a2 | v3;
  return result;
}

uint64_t sub_1000131FC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 72) = a2;
  return result;
}

void sub_100013204(uint64_t a1, const __CFDictionary *a2)
{
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 48));
  if (Count >= 1)
  {
    unint64_t v5 = Count + 1;
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 48), v5 - 2);
      CFNumberRef v7 = sub_100003054(ValueAtIndex);
      if (v7 == sub_100003054(a2))
      {
        CFNumberRef v8 = sub_100003078(ValueAtIndex);
        if (v8 == sub_100003078(a2)) {
          CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 48), v5 - 2);
        }
      }
      --v5;
    }
    while (v5 > 1);
  }
  CFIndex v9 = CFArrayGetCount(*(CFArrayRef *)(a1 + 40));
  if (v9 >= 1)
  {
    unint64_t v10 = v9 + 1;
    do
    {
      CFDictionaryRef v11 = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 40), v10 - 2);
      CFNumberRef v12 = sub_100003054(v11);
      if (v12 == sub_100003054(a2))
      {
        CFNumberRef v13 = sub_100003078(v11);
        if (v13 == sub_100003078(a2)) {
          CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 40), v10 - 2);
        }
      }
      --v10;
    }
    while (v10 > 1);
  }
}

void sub_100013320(uint64_t a1)
{
  mach_port_name_t v2 = *(_DWORD *)(a1 + 16);
  if (v2) {
    mach_port_deallocate(mach_task_self_, v2);
  }
  int v3 = *(void **)(a1 + 24);
  if (v3) {
    free(v3);
  }
  mach_port_name_t v4 = *(const void **)(a1 + 40);
  if (v4) {
    CFRelease(v4);
  }
  unint64_t v5 = *(const void **)(a1 + 48);
  if (v5) {
    CFRelease(v5);
  }
  mach_port_name_t v6 = *(_DWORD *)(a1 + 64);
  if (v6)
  {
    mach_port_t v7 = mach_task_self_;
    mach_port_mod_refs(v7, v6, 1u, -1);
  }
}

BOOL sub_1000133AC(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 64) == *(_DWORD *)(a2 + 64);
}

uint64_t sub_1000133C0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 64);
}

CFStringRef sub_1000133C8(uint64_t a1)
{
  CFAllocatorRef v2 = CFGetAllocator((CFTypeRef)a1);
  return CFStringCreateWithFormat(v2, 0, @"%s [%d]:%d", *(void *)(a1 + 24), *(unsigned int *)(a1 + 32), *(unsigned int *)(a1 + 64));
}

CFStringRef sub_100013418(uint64_t a1)
{
  CFAllocatorRef v2 = CFGetAllocator((CFTypeRef)a1);
  CFAllocatorRef v3 = CFGetAllocator((CFTypeRef)a1);
  return CFStringCreateWithFormat(v2, 0, @"<DASession %p [%p]>{id = %s [%d]:%d}", a1, v3, *(void *)(a1 + 24), *(unsigned int *)(a1 + 32), *(unsigned int *)(a1 + 64));
}

void sub_10001347C()
{
  int v0 = byte_100024440;
  int v1 = sub_100002308();
  sub_100008B68("__DASetIdleTimer %d %x", v0, v1);
  if (!sub_100002308() && byte_100024440 == 1)
  {
    qword_100025348 = CFAbsoluteTimeGetCurrent();
    if (!byte_1000252D0)
    {
      sub_100008B68("Idle timer started ");
      byte_1000252D0 = 1;
      dispatch_time_t v2 = dispatch_time(0, 20000000000);
      CFAllocatorRef v3 = sub_100012CBC();
      dispatch_after(v2, v3, &stru_100021260);
    }
  }
}

void sub_100013554(id a1)
{
  sub_100008B68("__DAIdleTimerCallback fired");
  byte_1000252D0 = 0;
  if (byte_100024440 == 1 && !sub_100002308())
  {
    CFAbsoluteTime v1 = *(double *)&qword_100025348 + 20.0;
    if (v1 < CFAbsoluteTimeGetCurrent())
    {
      sub_100008B68("__DAIdleTimerCallback exiting");
      exit(0);
    }
    sub_10001347C();
  }
}

void sub_1000135F4()
{
  if (byte_100024440) {
    sub_100002280();
  }
  byte_100024440 = 0;
  int v0 = sub_100012CBC();

  dispatch_async_f(v0, 0, (dispatch_function_t)sub_100013650);
}

void sub_100013650()
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000252B0);
  if (Count < 1)
  {
    int v3 = 1;
  }
  else
  {
    CFIndex v1 = Count;
    CFIndex v2 = 0;
    int v3 = 1;
    double v4 = kCFAbsoluteTimeIntervalSince1904;
    do
    {
      CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_1000252B0, v2);
      if (ValueAtIndex)
      {
        uint64_t v6 = (uint64_t)ValueAtIndex;
        double v7 = sub_100005830((uint64_t)ValueAtIndex);
        double v8 = v7;
        if (v7 == 0.0)
        {
          if (sub_100005828(v6, @"DAMediaWhole") == kCFBooleanTrue) {
            sub_100017434(v6, 4, 1);
          }
        }
        else
        {
          double v8 = v7 + 10.0;
        }
        if (v8 == 0.0 || v8 < CFAbsoluteTimeGetCurrent())
        {
          if (sub_100005828(v6, @"DAMediaWhole") == kCFBooleanTrue) {
            sub_100017434(v6, 2, 1);
          }
        }
        else
        {
          int v3 = 0;
          if (v8 + 1.0 < v4) {
            double v4 = v8 + 1.0;
          }
        }
      }
      ++v2;
    }
    while (v1 != v2);
    if (kCFAbsoluteTimeIntervalSince1904 > v4 && CFAbsoluteTimeGetCurrent() < v4)
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      dispatch_time_t v10 = dispatch_time(0, 1000000000 * (uint64_t)(v4 - Current));
      CFDictionaryRef v11 = sub_100012CBC();
      dispatch_after(v10, v11, &stru_1000212A0);
    }
  }
  CFIndex v12 = CFArrayGetCount((CFArrayRef)qword_1000252B0);
  if (v12 >= 1)
  {
    CFIndex v13 = v12;
    CFIndex v14 = 0;
    CFAllocatorRef v15 = kCFAllocatorDefault;
    CFDataRef v16 = &byte_100024D78[648];
    CFIndex v70 = v12;
    do
    {
      uint64_t v17 = (void *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000252B0, v14);
      if (!sub_100005940((uint64_t)v17, 1))
      {
        if (sub_100005940((uint64_t)v17, 0x10000))
        {
          if (sub_100005940((uint64_t)v17, 0x20000))
          {
            if (sub_100005940((uint64_t)v17, 0x40000))
            {
              if (sub_100005940((uint64_t)v17, 0x80000))
              {
                if (!qword_1000252A8)
                {
                  if (sub_100005828((uint64_t)v17, @"DAMediaType"))
                  {
                    CFNumberRef v18 = (const __CFNumber *)sub_100005828((uint64_t)v17, @"DAMediaSize");
                    if (v18)
                    {
                      if (!sub_100007F10(v18) && !sub_100017218((uint64_t)v17, 0x10000))
                      {
                        if (sub_10000B7D4((uint64_t)v17)) {
                          sub_10000CB10((uint64_t)v17, 0, 0);
                        }
                        sub_100017434((uint64_t)v17, 0x10000, 1);
                      }
                    }
                  }
                }
                goto LABEL_23;
              }
              sub_100005EBC((uint64_t)v17, 0x80000, 1);
              sub_10000C328(v17);
              sub_1000135F4(v37);
            }
            else
            {
              if (byte_1000252B8) {
                goto LABEL_23;
              }
              if (sub_100005940((uint64_t)v17, 2))
              {
                CFIndex v33 = CFArrayGetCount((CFArrayRef)qword_1000252B0);
                if (v33 < 1)
                {
                  CFIndex v34 = 0;
                }
                else
                {
                  CFIndex v34 = 0;
                  while (1)
                  {
                    long long v35 = CFArrayGetValueAtIndex((CFArrayRef)qword_1000252B0, v34);
                    int v36 = sub_100005864((uint64_t)v17);
                    if (v36 == sub_100005864((uint64_t)v35)
                      && (!sub_100005940((uint64_t)v35, 0x10000)
                       || !sub_100005940((uint64_t)v35, 0x40000) && !sub_100005940((uint64_t)v35, 2)))
                    {
                      break;
                    }
                    if (v33 == ++v34) {
                      goto LABEL_66;
                    }
                  }
                }
                if (v34 == v33) {
LABEL_66:
                }
                  sub_100013F38((uint64_t)v17);
                int v3 = 0;
                goto LABEL_51;
              }
              sub_100013F38((uint64_t)v17);
            }
          }
          else
          {
            CFMutableArrayRef Mutable = CFArrayCreateMutable(v15, 0, &kCFTypeArrayCallBacks);
            if (Mutable)
            {
              CFStringRef v21 = Mutable;
              CFArrayRef v22 = (const __CFArray *)qword_100025330;
              CFIndex v23 = CFArrayGetCount((CFArrayRef)qword_100025330);
              if (v23 >= 1)
              {
                CFIndex v24 = v23;
                for (CFIndex i = 0; i != v24; ++i)
                {
                  int v26 = CFArrayGetValueAtIndex(v22, i);
                  CFArrayRef v27 = (const __CFArray *)sub_100005874((uint64_t)v26);
                  CFIndex v28 = CFArrayGetCount(v27);
                  if (v28 >= 1)
                  {
                    CFIndex v29 = v28;
                    for (CFIndex j = 0; j != v29; ++j)
                    {
                      gid_t v31 = CFArrayGetValueAtIndex(v27, j);
                      if (sub_100003090((const __CFDictionary *)v31) == 9) {
                        CFArrayAppendValue(v21, v31);
                      }
                    }
                  }
                }
              }
              v72.length = CFArrayGetCount(v21);
              v72.location = 0;
              CFArraySortValues(v21, v72, (CFComparatorFunction)sub_100014560, 0);
              CFRetain(v17);
              sub_100005B9C((uint64_t)v17, v21);
              sub_100005EBC((uint64_t)v17, 0x20000, 1);
              uint64_t v32 = sub_100005EBC((uint64_t)v17, 1, 1);
              sub_10001459C(v32, (uint64_t)v17);
              CFRelease(v21);
              int v3 = 0;
              CFAllocatorRef v15 = kCFAllocatorDefault;
              CFIndex v13 = v70;
LABEL_51:
              CFDataRef v16 = byte_100024D78 + 648;
              goto LABEL_23;
            }
          }
        }
        else
        {
          if (v16[496] == 1)
          {
            sub_100016264();
            sub_100016658();
            sub_100016A78();
            v16[496] = 0;
          }
          if (!sub_100017274((uint64_t)v17, 1))
          {
            CFRetain(v17);
            sub_100005EBC((uint64_t)v17, 0x10000, 1);
            sub_100005EBC((uint64_t)v17, 1, 1);
            sub_100017434((uint64_t)v17, 1, 1);
            pid_t v19 = sub_100005F14((uint64_t)v17);
            sub_10000B97C(v17, v19, (void (*)(uint64_t, uint64_t, void, void, void, void, uint64_t))sub_100013FA4, (uint64_t)v17);
          }
        }
      }
      int v3 = 0;
LABEL_23:
      ++v14;
    }
    while (v14 != v13);
  }
  CFIndex v38 = CFArrayGetCount((CFArrayRef)qword_100025320);
  if (v38)
  {
    uint64_t v39 = v38;
    CFMutableSetRef v40 = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
    if (v40)
    {
      CFSetRef v41 = v40;
      if (v39 >= 1)
      {
        CFIndex v42 = 0;
        while (1)
        {
          CFDictionaryRef v43 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025320, v42);
          if (!v43) {
            goto LABEL_100;
          }
          CFDictionaryRef v44 = v43;
          size_t v45 = sub_10000D808(v43);
          if (!v45) {
            break;
          }
          CFArrayRef v46 = (const __CFArray *)sub_10000EA10(v44);
          if (!v46)
          {
            if (CFSetContainsValue(v41, v45)) {
              goto LABEL_95;
            }
LABEL_89:
            if (sub_10000D814(v44) == 7 && byte_1000251F0)
            {
              sub_100016264();
              sub_100016658();
              sub_100016A78();
              byte_1000251F0 = 0;
            }
            if (sub_10000D638((uint64_t)v44))
            {
              CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100025320, v42);
              --v39;
              --v42;
              goto LABEL_100;
            }
            goto LABEL_94;
          }
          CFArrayRef v47 = v46;
          CFIndex v48 = CFArrayGetCount(v46);
          if (v48 < 1)
          {
            BOOL v52 = 0;
          }
          else
          {
            CFIndex v49 = v48;
            CFDictionaryRef v50 = (const __CFDictionary *)CFArrayGetValueAtIndex(v47, 0);
            long long v51 = sub_10000D808(v50);
            if (CFSetContainsValue(v41, v51))
            {
              BOOL v52 = 1;
            }
            else
            {
              CFIndex v53 = 1;
              do
              {
                CFIndex v54 = v53;
                if (v49 == v53) {
                  break;
                }
                CFDictionaryRef v55 = (const __CFDictionary *)CFArrayGetValueAtIndex(v47, v53);
                pid_t v56 = sub_10000D808(v55);
                int v57 = CFSetContainsValue(v41, v56);
                CFIndex v53 = v54 + 1;
              }
              while (!v57);
              BOOL v52 = v54 < v49;
            }
          }
          int v58 = CFSetContainsValue(v41, v45);
          if (!v52 && !v58) {
            goto LABEL_89;
          }
LABEL_94:
          if (v45)
          {
LABEL_95:
            CFArrayRef v59 = (const __CFArray *)sub_10000EA10(v44);
            if (v59)
            {
              CFArrayRef v60 = v59;
              CFIndex v61 = CFArrayGetCount(v59);
              if (v61 >= 1)
              {
                CFIndex v62 = v61;
                for (CFIndex k = 0; k != v62; ++k)
                {
                  CFDictionaryRef v64 = (const __CFDictionary *)CFArrayGetValueAtIndex(v60, k);
                  uint64_t v65 = sub_10000D808(v64);
                  CFSetSetValue(v41, v65);
                }
              }
            }
            CFSetSetValue(v41, v45);
          }
LABEL_100:
          if (++v42 >= v39) {
            goto LABEL_101;
          }
        }
        if (v42) {
          goto LABEL_101;
        }
        goto LABEL_89;
      }
LABEL_101:
      CFRelease(v41);
    }
  }
  else if (v3)
  {
    byte_1000251F0 = 1;
    if (!byte_100024440)
    {
      sub_1000022C8();
      byte_100024440 = 1;
      sub_10001347C();
    }
    sub_10000CD1C();
    if (qword_100025298)
    {
      CFIndex v66 = CFArrayGetCount((CFArrayRef)qword_1000252B0);
      if (v66 >= 1)
      {
        CFIndex v67 = v66;
        for (CFIndex m = 0; m != v67; ++m)
        {
          stat v69 = CFArrayGetValueAtIndex((CFArrayRef)qword_1000252B0, m);
          if (sub_100005828((uint64_t)v69, @"DAMediaWhole") == kCFBooleanTrue
            && !sub_100017218((uint64_t)v69, 0x10000))
          {
            if (sub_10000B7D4((uint64_t)v69)) {
              sub_100004404((uint64_t)v69);
            }
            sub_100017434((uint64_t)v69, 0x10000, 1);
          }
          if (sub_100005828((uint64_t)v69, @"DAVolumePath") && !sub_100005940((uint64_t)v69, 0x100000))
          {
            if (sub_100005940((uint64_t)v69, 2) && sub_100005940((uint64_t)v69, 16) && !sub_10000586C((uint64_t)v69)) {
              sub_100004430((uint64_t)v69);
            }
            sub_100005EBC((uint64_t)v69, 0x100000, 1);
          }
        }
      }
    }
  }
}

uint64_t sub_100013F38(uint64_t a1)
{
  sub_100005EBC(a1, 0x40000, 1);
  uint64_t v2 = sub_10000A530(a1, 2);
  if (!v2) {
    uint64_t v2 = sub_10000CC1C(a1, 0, 0, 0, @"automatic");
  }

  return sub_1000135F4(v2);
}

void sub_100013FA4(int a1, const void *a2, int a3, const void *a4, const void *a5, const void *a6, void *a7)
{
  sub_100005C68((uint64_t)a7, a2);
  sub_100005EBC((uint64_t)a7, 2, 0);
  sub_100005EBC((uint64_t)a7, 4, 0);
  if (a1)
  {
    CFStringRef v14 = 0;
    int v15 = 8;
LABEL_25:
    sub_100005EBC((uint64_t)a7, v15, 1);
    goto LABEL_26;
  }
  CFStringRef v14 = (const __CFString *)sub_100006624((uint64_t)a2);
  if (v14 && sub_100006648((uint64_t)a2))
  {
    sub_100008B68("staged fsmodule, id = %@, with %@, success.", a7, v14);
    CFStringRef v14 = sub_100014918(v14);
  }
  sub_100005EBC((uint64_t)a7, 8, 0);
  CFDataRef v16 = sub_100005828((uint64_t)a7, @"DAMediaContent");
  if (v16
    && CFEqual(v16, @"7C3457EF-0000-11AA-AA11-00306543ECAC")
    && sub_100005828((uint64_t)a7, @"DADeviceInternal") == kCFBooleanFalse)
  {
    sub_100005EBC((uint64_t)a7, 128, 1);
  }
  CFBooleanRef v17 = (CFBooleanRef)sub_100005828((uint64_t)a7, @"DAMediaWritable");
  if (sub_100017218((uint64_t)a7, 16)) {
    BOOL v18 = a3 <= 63;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18 && v17 != kCFBooleanFalse && a3 != 0 || kCFBooleanTrue == kCFBooleanFalse)
  {
    int v15 = 2;
    goto LABEL_25;
  }
LABEL_26:
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (Mutable)
  {
    CFIndex v23 = Mutable;
    if (v14) {
      CFIndex v24 = (const void **)&kCFBooleanTrue;
    }
    else {
      CFIndex v24 = (const void **)&kCFBooleanFalse;
    }
    BOOL v25 = *v24;
    if (sub_10000445C((uint64_t)a7, @"DAVolumeMountable", *v24))
    {
      sub_100005C24((uint64_t)a7, @"DAVolumeMountable", v25);
      CFArrayAppendValue(v23, @"DAVolumeMountable");
    }
    if (sub_10000445C((uint64_t)a7, @"DAVolumeKind", v14))
    {
      sub_100005C24((uint64_t)a7, @"DAVolumeKind", v14);
      CFArrayAppendValue(v23, @"DAVolumeKind");
    }
    if (sub_10000445C((uint64_t)a7, @"DAVolumeName", a4))
    {
      sub_100005C24((uint64_t)a7, @"DAVolumeName", a4);
      CFArrayAppendValue(v23, @"DAVolumeName");
    }
    if (sub_10000445C((uint64_t)a7, @"DAVolumeType", a5))
    {
      sub_100005C24((uint64_t)a7, @"DAVolumeType", a5);
      CFArrayAppendValue(v23, @"DAVolumeType");
    }
    if (sub_10000445C((uint64_t)a7, @"DAVolumeUUID", a6))
    {
      sub_100005C24((uint64_t)a7, @"DAVolumeUUID", a6);
      CFArrayAppendValue(v23, @"DAVolumeUUID");
    }
    if (CFArrayGetCount(v23) && sub_100005940((uint64_t)a7, 0x80000)) {
      sub_10000CA44(a7, v23);
    }
    CFRelease(v23);
  }
  if (!sub_100005940((uint64_t)a7, 0x40000))
  {
    CFDictionaryRef v43 = 0;
    int v27 = getmntinfo(&v43, 2);
    if (v27 >= 1)
    {
      unint64_t v28 = 0;
      uint64_t v29 = 2168 * v27;
      while (1)
      {
        long long v30 = sub_1000085B0((uint64_t)&v43[v28 / 0x878]);
        gid_t v31 = (const char *)sub_1000053D8((uint64_t)a7);
        int v32 = strcmp(v30, v31);
        CFIndex v33 = v43;
        if (!v32) {
          break;
        }
        if (!strcmp(v43[v28 / 0x878].f_fstypename, "lifs") && !strncmp(v33[v28 / 0x878].f_mntfromname, "apfs", 4uLL))
        {
          int v34 = sub_1000086C4((uint64_t)&v33[v28 / 0x878], __s2, 1024);
          long long v35 = (const char *)sub_10000580C((uint64_t)a7, 0);
          if (!v34 && !strcmp(v35, __s2))
          {
            uint64_t v36 = sub_1000053E0(kCFAllocatorDefault, (uint64_t)&v43[v28 / 0x878]);
            if (v36)
            {
              uint64_t v37 = (const void *)v36;
              sub_100008B68("created disk, id = %@.", v36);
              CFArrayInsertValueAtIndex((CFMutableArrayRef)qword_1000252B0, 0, v37);
              CFRelease(v37);
            }
            sub_100005EBC((uint64_t)a7, 2, 0);
            sub_100005EBC((uint64_t)a7, 4, 0);
            sub_100005EBC((uint64_t)a7, 0x40000, 1);
          }
        }
        v28 += 2168;
        if (v29 == v28) {
          goto LABEL_45;
        }
      }
      size_t v38 = strlen(v43[v28 / 0x878].f_mntonname);
      CFURLRef v39 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)v43[v28 / 0x878].f_mntonname, v38, 1u);
      if (v39)
      {
        CFURLRef v40 = v39;
        sub_100005AC8((uint64_t)a7, v39);
        sub_100005C24((uint64_t)a7, @"DAVolumePath", v40);
        CFRelease(v40);
      }
      if (!strcmp(v43[v28 / 0x878].f_mntonname, "/"))
      {
        CFSetRef v41 = (const void *)sub_10000A528();
        if (v41)
        {
          CFIndex v42 = v41;
          sub_100005AC8((uint64_t)a7, v41);
          CFRelease(v42);
        }
        sub_100005EBC((uint64_t)a7, 16, 1);
        sub_100005EBC((uint64_t)a7, 32, 1);
      }
      sub_100005EBC((uint64_t)a7, 2, 0);
      sub_100005EBC((uint64_t)a7, 4, 0);
    }
  }
LABEL_45:
  sub_100017434((uint64_t)a7, 1, 0);
  uint64_t v26 = sub_100005EBC((uint64_t)a7, 1, 0);
  sub_1000135F4(v26);
  CFRelease(a7);
}

uint64_t sub_100014560(const __CFDictionary *a1, const __CFDictionary *a2)
{
  signed int v3 = sub_1000030BC(a1);
  signed int v4 = sub_1000030BC(a2);
  if (v3 >= v4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = -1;
  }
  if (v3 > v4) {
    return 1;
  }
  else {
    return v5;
  }
}

void sub_10001459C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)a2;
  CFArrayRef v3 = (const __CFArray *)sub_100005874(a2);
  if (CFArrayGetCount(v3))
  {
    CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v3, 0);
    CFRetain(ValueAtIndex);
    CFArrayRemoveValueAtIndex(v3, 0);
    sub_10000C408(v2, (const __CFDictionary *)ValueAtIndex, (uint64_t)sub_10001459C, (uint64_t)v2);
    uint64_t v2 = (void *)ValueAtIndex;
  }
  else
  {
    sub_100005EBC((uint64_t)v2, 1, 0);
    sub_100005B9C((uint64_t)v2, 0);
    sub_1000135F4(v5);
  }

  CFRelease(v2);
}

uint64_t sub_1000148E0()
{
  uint64_t result = objc_opt_class();
  if (result) {
    byte_100024441 = 0;
  }
  return result;
}

uint64_t sub_100014910()
{
  return 0;
}

CFStringRef sub_100014918(const __CFString *a1)
{
  range.location = 0;
  range.length = 0;
  CFCharacterSetRef v2 = CFCharacterSetCreateWithCharactersInString(kCFAllocatorDefault, @"_");
  v6.length = CFStringGetLength(a1);
  v6.location = 0;
  CFStringFindCharacterFromSet(a1, v2, v6, 0, &range);
  v7.length = range.location;
  v7.location = 0;
  CFStringRef v3 = CFStringCreateWithSubstring(kCFAllocatorDefault, a1, v7);
  CFRelease(v2);
  return v3;
}

CFStringRef sub_1000149B4(const __CFString *a1)
{
  CFStringRef v1 = sub_100014918(a1);
  CFStringRef v2 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"com.apple.fskit.%@", v1);
  CFRelease(v1);
  return v2;
}

void sub_100014A10(uint64_t a1, uint64_t a2)
{
  CFStringRef v3 = *(void **)(a2 + 16);
  id v4 = *(id *)a2;
  v3[2] = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100014AF0;
  v5[3] = &unk_1000212C8;
  v5[4] = v3;
  [v4 enumerateObjectsUsingBlock:v5];
  sub_100014C38(0xFFFFFFFFLL, 0xFFFFFFFFLL, 0, 0, 0, v3);
  free((void *)a2);
}

void sub_100014AF0(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v3 = sub_100006598(kCFAllocatorDefault, a2);
  if (v3)
  {
    id v4 = (const void *)v3;
    sub_1000089E0(" created filesystem, id = %@.", v3);
    CFDictionaryRef v5 = (const __CFDictionary *)sub_100006638((uint64_t)v4);
    if (v5)
    {
      CFDictionaryRef v6 = v5;
      int Count = CFDictionaryGetCount(v5);
      double v8 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
      CFDictionaryGetKeysAndValues(v6, 0, v8);
      if (Count >= 1)
      {
        uint64_t v9 = Count;
        dispatch_time_t v10 = (CFDictionaryRef *)v8;
        do
        {
          CFArrayRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, *v10);
          if (MutableCopy)
          {
            CFIndex v12 = MutableCopy;
            CFDictionarySetValue(MutableCopy, @"DAFileSystem", v4);
            CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(a1 + 32) + 16), v12);
            CFRelease(v12);
          }
          ++v10;
          --v9;
        }
        while (v9);
      }
      free(v8);
    }
    CFRelease(v4);
  }
}

void sub_100014C38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v12 = a6[3];
  CFURLRef v13 = (const __CFURL *)sub_100005884(v12);
  CFStringRef PathComponent = CFURLCopyLastPathComponent(v13);
  BOOL v15 = (sub_100005828(v12, @"DAMediaRemovable") != kCFBooleanTrue || sub_100005828(v12, @"DADeviceInternal"))&& sub_100005828(v12, @"DADeviceInternal") != kCFBooleanTrue;
  uint64_t v16 = a6[5];
  if (!a1)
  {
    BOOL v25 = sub_100006624(v16);
    sub_100008B68("probed disk, id = %@, with %@, success.", a6[3], v25);
    BOOL v17 = 1;
LABEL_19:
    uint64_t v26 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))*a6;
    if (*a6)
    {
      uint64_t v27 = a6[5];
      char v28 = !v17;
      if (!v27) {
        char v28 = 1;
      }
      if ((v28 & 1) == 0)
      {
        uint64_t v29 = sub_100006624(a6[5]);
        __uint64_t v30 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
        sub_100003994(a1, (uint64_t)v29, @"FSKit", v30 - a6[6], a2);
        uint64_t v26 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))*a6;
        uint64_t v27 = a6[5];
      }
      v26(a1, v27, a2, a3, a4, a5, a6[1]);
    }
    gid_t v31 = (const void *)a6[2];
    if (v31) {
      CFRelease(v31);
    }
    int v32 = (const void *)a6[3];
    if (v32) {
      CFRelease(v32);
    }
    CFIndex v33 = (const void *)a6[5];
    if (v33) {
      CFRelease(v33);
    }
    free(a6);
    return;
  }
  CFStringRef v39 = PathComponent;
  BOOL v17 = v16 != 0;
  if (v16)
  {
    BOOL v18 = sub_100006624(v16);
    sub_100008B68("probed disk, id = %@, with %@, failure.", a6[3], v18);
    if (a1 != -2) {
      sub_100008B14("unable to probe %@ (status code 0x%08X).", a6[3], a1);
    }
    CFRelease((CFTypeRef)a6[5]);
    a6[5] = 0;
  }
  if (CFArrayGetCount((CFArrayRef)a6[2]) < 1) {
    goto LABEL_19;
  }
  char v36 = v15;
  unsigned int v37 = a2;
  uint64_t v38 = a5;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)a6[2], 0);
    CFDictionaryRef Value = CFDictionaryGetValue(ValueAtIndex, @"DAFileSystem");
    if (Value)
    {
      CFStringRef v21 = Value;
      CFDictionaryRef v22 = (const __CFDictionary *)CFDictionaryGetValue(ValueAtIndex, @"FSMediaProperties");
      CFIndex v23 = sub_100006624((uint64_t)v21);
      CFRetain(v21);
      a6[5] = v21;
      if (v22)
      {
        BOOLean_t matches = 0;
        io_service_t v24 = sub_100005820(v12);
        IOServiceMatchPropertyTable(v24, v22, &matches);
        if (matches) {
          break;
        }
      }
    }
    CFArrayRemoveValueAtIndex((CFMutableArrayRef)a6[2], 0);
    if (CFArrayGetCount((CFArrayRef)a6[2]) <= 0)
    {
      a5 = v38;
      a2 = v37;
      goto LABEL_19;
    }
  }
  if (CFDictionaryGetValue(ValueAtIndex, @"autodiskmount") == kCFBooleanFalse)
  {
    sub_100005EBC(v12, 16, 0);
    sub_100005EBC(v12, 32, 0);
  }
  CFArrayRemoveValueAtIndex((CFMutableArrayRef)a6[2], 0);
  sub_100008B68("probed disk, id = %@, with %@, ongoing.", v12, v23);
  CFStringRef v34 = (const __CFString *)sub_100006624((uint64_t)v21);
  CFStringRef v35 = sub_1000149B4(v34);
  sub_100015490(v39, v35, v36, (void (*)(uint64_t, uint64_t, void, void, void, uint64_t))sub_100014C38, (uint64_t)a6);
}

uint64_t sub_100014F78(uint64_t a1)
{
  CFStringRef v2 = objc_opt_new();
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000;
  BOOL v17 = sub_100015148;
  BOOL v18 = sub_100015158;
  id v19 = (id)objc_opt_new();
  uint64_t v3 = dispatch_group_create();
  unsigned int v4 = *(_DWORD *)(a1 + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 501;
  }
  CFDictionaryRef v6 = objc_opt_new();
  CFRange v7 = [v6 tokenWithRuid:v5];

  dispatch_group_enter(v3);
  if (v7 && v2)
  {
    [v7 audit_token];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100015160;
    v9[3] = &unk_100021318;
    CFDictionaryRef v11 = &v14;
    int v12 = v5;
    dispatch_time_t v10 = v3;
    [v2 installedExtensionsForUser:v13 replyHandler:v9];
  }
  else
  {
    sub_100008B14("Unable to retrieve FSModules for uid %u: infrastructure issues", v5);
    dispatch_group_leave(v3);
  }
  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  *(void *)a1 = CFRetain((CFTypeRef)v15[5]);

  _Block_object_dispose(&v14, 8);
  return 0;
}

void sub_100015130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100015148(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4sub_10000C338(16, 0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4sub_10000C338(16, 0, 0) = 0;
  return result;
}

void sub_100015158(uint64_t a1)
{
}

void sub_100015160(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    sub_100008B14("Unable to retrieve FSModules for uid %u: %@", *(unsigned int *)(a1 + 48), a3);
  }
  else
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100015204;
    v4[3] = &unk_1000212F0;
    v4[4] = *(void *)(a1 + 40);
    [a2 enumerateObjectsUsingBlock:v4];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_100015204(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 attributes];
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v4 = [v3 objectForKeyedSubscript:@"FSShortName"];
  uint64_t v5 = +[NSString stringWithFormat:@"%@_fskit", v4];

  CFDictionaryRef v6 = [v3 objectForKeyedSubscript:@"FSSupportsBlockResources"];
  if (v5) {
    BOOL v7 = v13 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7 && [v6 BOOLValue])
  {
    [v13 setValue:v5 forKey:kCFBundleNameKey];
    double v8 = +[NSNumber numberWithBool:1];
    [v13 setValue:v8 forKey:@"FSIsFSModule"];

    [v13 setValue:&off_1000235F8 forKey:@"FSImplementation"];
    uint64_t v9 = [v3 objectForKeyedSubscript:@"FSMediaTypes"];
    uint64_t v10 = [v3 objectForKeyedSubscript:@"FSPersonalities"];
    CFDictionaryRef v11 = (void *)v10;
    if (v9 && v10)
    {
      [v13 setValue:v9 forKey:@"FSMediaTypes"];
      [v13 setValue:v11 forKey:@"FSPersonalities"];
      sub_100008798("Found FSModule: %@", v13);
    }
    else
    {
      sub_100008B14("FSModule missing information");

      id v13 = 0;
    }
  }
  if (v13) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:];
  }

  return _objc_release_x2();
}

_DWORD *sub_100015400(int a1, uint64_t a2)
{
  uint64_t result = malloc_type_malloc(0x18uLL, 0x10E0040F5622EBCuLL);
  if (result)
  {
    *(void *)uint64_t result = 0;
    result[2] = a1;
    *((void *)result + 2) = a2;
    return (_DWORD *)sub_100017794((uint64_t)sub_100014F78, (uint64_t)result, (uint64_t (*)(uint64_t, uint64_t))sub_100014A10, (uint64_t)result);
  }
  return result;
}

void sub_100015490(const void *a1, const void *a2, char a3, void (*a4)(uint64_t, uint64_t, void, void, void, uint64_t), uint64_t a5)
{
  if (byte_100024441)
  {
    uint64_t v9 = 2;
    uint64_t v10 = 2;
LABEL_3:
    a4(v9, v10, 0, 0, 0, a5);
    CFRelease(a2);
    CFRelease(a1);
    return;
  }
  int v12 = malloc_type_malloc(0x40uLL, 0x10E00405BC55978uLL);
  if (!v12)
  {
    uint64_t v9 = 12;
    uint64_t v10 = 12;
    goto LABEL_3;
  }
  void *v12 = a1;
  v12[1] = a2;
  *((unsigned char *)v12 + 16) = a3;
  *(void *)((char *)v12 + 2sub_10000C338(16, 0, 0) = 0;
  *(void *)((char *)v12 + 36) = 0;
  *(void *)((char *)v12 + 28) = 0;
  *((_DWORD *)v12 + 11) = 0;
  v12[6] = a4;
  v12[7] = a5;

  sub_100017794((uint64_t)sub_1000155A8, (uint64_t)v12, (uint64_t (*)(uint64_t, uint64_t))sub_1000159C4, (uint64_t)v12);
}

uint64_t sub_1000155A8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v39 = 0;
  CFURLRef v40 = &v39;
  uint64_t v41 = 0x2020000000;
  int v42 = 0;
  unsigned int v4 = dispatch_group_create();
  group = dispatch_group_create();
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = sub_100015148;
  v37[4] = sub_100015158;
  id v38 = 0;
  CFIndex v23 = objc_opt_new();
  uint64_t v5 = +[FSBlockDeviceResource proxyResourceForBSDName:v2];
  CFDictionaryRef v6 = objc_opt_new();
  BOOL v7 = [v6 tokenWithRuid:501];

  dispatch_group_enter(v4);
  if (v7) {
    [v7 audit_token];
  }
  else {
    memset(v36, 0, sizeof(v36));
  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100015A48;
  v30[3] = &unk_100021340;
  CFIndex v33 = &v39;
  CFStringRef v34 = a1;
  double v8 = v4;
  gid_t v31 = v8;
  id v9 = v5;
  id v32 = v9;
  uint64_t v35 = v3;
  [v23 probeResource:v9 usingBundle:v3 auditToken:v36 replyHandler:v30];
  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v10 = *((unsigned int *)v40 + 6);
  if (v10) {
    goto LABEL_5;
  }
  if (!*((unsigned char *)a1 + 16))
  {
    uint64_t v10 = 0;
LABEL_5:
    CFDictionaryRef v11 = 0;
    int v12 = 0;
    id v13 = 0;
    id v14 = 0;
    goto LABEL_14;
  }
  BOOL v15 = objc_opt_new();
  int v12 = +[FSMessageReceiver receiverWithDelegate:v15];
  id v13 = [v12 getConnection];
  CFDictionaryRef v11 = objc_opt_new();
  uint64_t v16 = +[FSTaskOption optionWithoutValue:@"q"];
  [v11 addOption:v16];

  dispatch_group_enter(group);
  [v15 setDispatch_group:group];
  dispatch_group_enter(group);
  if (v7) {
    [v7 audit_token];
  }
  else {
    memset(v29, 0, sizeof(v29));
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100015C98;
  v24[3] = &unk_1000213A8;
  char v28 = a1;
  id v14 = v15;
  id v25 = v14;
  uint64_t v27 = v37;
  BOOL v17 = group;
  uint64_t v26 = v17;
  [v23 checkResource:v9 usingBundle:v3 options:v11 auditToken:v29 connection:v13 replyHandler:v24];
  dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v18 = [v14 exitError];

  if (v18)
  {
    id v19 = [v14 exitError];
    *((_DWORD *)a1 + 5) = [v19 code];
  }
  BOOL v20 = [v14 exitError];
  sub_100008B68("FSKit check of resource %@ exited with error %@ %d", v9, v20, *((unsigned int *)a1 + 5));

  uint64_t v10 = *((unsigned int *)v40 + 6);
LABEL_14:

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(&v39, 8);

  return v10;
}

void sub_1000159A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1000159C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t, void, void, void, void, void))(a2 + 48);
  if (v3) {
    v3(a1, *(unsigned int *)(a2 + 20), *(void *)(a2 + 24), *(void *)(a2 + 32), *(void *)(a2 + 40), *(void *)(a2 + 56));
  }
  CFRelease(*(CFTypeRef *)(a2 + 8));
  CFRelease(*(CFTypeRef *)a2);
  unsigned int v4 = *(const void **)(a2 + 24);
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = *(const void **)(a2 + 32);
  if (v5) {
    CFRelease(v5);
  }
  CFDictionaryRef v6 = *(const void **)(a2 + 40);
  if (v6) {
    CFRelease(v6);
  }

  free((void *)a2);
}

void sub_100015A48(uint64_t a1, void *a2, void *a3)
{
  id v23 = a2;
  id v5 = a3;
  if (v5)
  {
    unsigned int v6 = [v5 code];
  }
  else
  {
    unsigned int v6 = 5;
    if (v23)
    {
      id v7 = [v23 result];
      if (v7) {
        int v8 = 5;
      }
      else {
        int v8 = 2;
      }
      if (v7 == (id)3) {
        unsigned int v6 = 0;
      }
      else {
        unsigned int v6 = v8;
      }
    }
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
  int v9 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v9)
  {
    *(_DWORD *)(*(void *)(a1 + 56) + 2sub_10000C338(16, 0, 0) = v9;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    goto LABEL_25;
  }
  uint64_t v10 = [*(id *)(a1 + 40) devicePath];
  CFArrayRef v11 = _FSCopyNameForVolumeFormatAtNode(v10);

  if (v11) {
    *(void *)(*(void *)(a1 + 56) + 32) = v11;
  }
  int v12 = [v23 name];

  if (v12)
  {
    id v13 = [v23 name];
    unsigned __int8 v14 = [v13 hasPrefix:&stru_100023050];

    if (v14)
    {
      int v12 = 0;
    }
    else
    {
      BOOL v15 = [v23 name];
      uint64_t v16 = +[NSCharacterSet characterSetWithCharactersInString:&stru_100023050];
      int v12 = [v15 stringByTrimmingCharactersInSet:v16];

      if (v12)
      {
        id v17 = [(__CFString *)v12 length];
        CFStringRef v18 = v12;
        if (v17) {
          goto LABEL_22;
        }
      }
    }
  }
  if ([*(id *)(a1 + 64) hasSuffix:@"msdos"]) {
    CFStringRef v18 = @"NO NAME";
  }
  else {
    CFStringRef v18 = @"Untitled";
  }
LABEL_22:
  *(void *)(*(void *)(a1 + 56) + 24) = CFRetain(v18);
  id v19 = [v23 containerID];

  if (v19)
  {
    BOOL v20 = [v23 containerID];
    CFStringRef v21 = [v20 uuid];
    CFDictionaryRef v22 = [v21 description];
    *(void *)(*(void *)(a1 + 56) + 4sub_10000C338(16, 0, 0) = CFUUIDCreateFromString(kCFAllocatorDefault, v22);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

LABEL_25:
}

void sub_100015C98(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    *(_DWORD *)(*(void *)(a1 + 56) + 2sub_10000C338(16, 0, 0) = [v6 code];
    sub_100008B68("check resource handler called with error %@", v7);
    [*(id *)(a1 + 32) completed:v7 replyHandler:&stru_100021380];
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 56) + 2sub_10000C338(16, 0, 0) = 0;
    sub_100008B68("check resource handler called with error %@", 0);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100015D6C(const void *a1, const void *a2, void (*a3)(uint64_t, uint64_t), uint64_t a4)
{
  id v8 = malloc_type_malloc(0x20uLL, 0xE0040ED91EDF5uLL);
  if (v8)
  {
    void *v8 = a1;
    v8[1] = a2;
    v8[2] = a3;
    void v8[3] = a4;
    sub_100017794((uint64_t)sub_100015E34, (uint64_t)v8, (uint64_t (*)(uint64_t, uint64_t))sub_100016150, (uint64_t)v8);
  }
  else
  {
    a3(12, a4);
    CFRelease(a2);
    CFRelease(a1);
  }
}

uint64_t sub_100015E34(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v32 = 0;
  CFIndex v33 = &v32;
  uint64_t v34 = 0x2020000000;
  int v35 = 0;
  uint64_t v3 = dispatch_group_create();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_100015148;
  void v30[4] = sub_100015158;
  id v31 = 0;
  unsigned int v4 = objc_opt_new();
  id v5 = +[FSBlockDeviceResource proxyResourceForBSDName:v1 writable:1];
  id v6 = objc_opt_new();
  id v7 = +[FSMessageReceiver receiverWithDelegate:v6];
  id v8 = [v7 getConnection];
  int v9 = objc_opt_new();
  uint64_t v10 = +[FSTaskOption optionWithoutValue:@"y"];
  [v9 addOption:v10];

  CFArrayRef v11 = objc_opt_new();
  int v12 = [v11 tokenWithRuid:501];

  dispatch_group_enter(v3);
  [v6 setDispatch_group:v3];
  dispatch_group_enter(v3);
  if (v12) {
    [v12 audit_token];
  }
  else {
    memset(v29, 0, sizeof(v29));
  }
  CFStringRef v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  id v23 = sub_1000161A4;
  io_service_t v24 = &unk_1000213F0;
  uint64_t v27 = &v32;
  id v13 = v6;
  id v25 = v13;
  char v28 = v30;
  unsigned __int8 v14 = v3;
  uint64_t v26 = v14;
  [v4 checkResource:v5 usingBundle:v2 options:v9 auditToken:v29 connection:v8 replyHandler:&v21];
  dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v15 = [v13 exitError];
  sub_100008B68("FSKit check of resource %@ exited with error %@", v5, v15, v21, v22, v23, v24);

  if (!*((_DWORD *)v33 + 6))
  {
    uint64_t v16 = [v13 exitError];

    if (v16)
    {
      id v17 = [v13 exitError];
      unsigned int v18 = [v17 code];
      *((_DWORD *)v33 + 6) = v18;
    }
  }
  uint64_t v19 = *((unsigned int *)v33 + 6);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v32, 8);

  return v19;
}

void sub_10001612C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_100016150(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t, void))(a2 + 16);
  if (v3) {
    v3(a1, *(void *)(a2 + 24));
  }
  CFRelease(*(CFTypeRef *)(a2 + 8));
  CFRelease(*(CFTypeRef *)a2);

  free((void *)a2);
}

void sub_1000161A4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  sub_100008B68("check resource handler called with error %@", v6);
  if (v6)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v6 code];
    [*(id *)(a1 + 32) completed:v6 replyHandler:&stru_1000213C8];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100016264()
{
  memset(&v3, 0, sizeof(v3));
  memset(&v2, 0, sizeof(v2));
  if (stat("/System/Library/Filesystems", &v3))
  {
    qword_1000251F8 = 0;
    qword_100025200 = 0;
  }
  if (stat("/Library/Filesystems", &v2)) {
    xmmword_100025208 = 0uLL;
  }
  if (qword_1000251F8 != v3.st_mtimespec.tv_sec)
  {
    tv_nseCC_SHA256_CTX c = v3.st_mtimespec.tv_nsec;
    goto LABEL_12;
  }
  tv_nseCC_SHA256_CTX c = v3.st_mtimespec.tv_nsec;
  if (qword_100025200 != v3.st_mtimespec.tv_nsec) {
    goto LABEL_12;
  }
  if ((void)xmmword_100025208 != v2.st_mtimespec.tv_sec)
  {
    tv_nseCC_SHA256_CTX c = qword_100025200;
    goto LABEL_12;
  }
  tv_nseCC_SHA256_CTX c = qword_100025200;
  if (*((void *)&xmmword_100025208 + 1) != v2.st_mtimespec.tv_nsec)
  {
LABEL_12:
    qword_1000251F8 = v3.st_mtimespec.tv_sec;
    qword_100025200 = tv_nsec;
    xmmword_100025208 = (__int128)v2.st_mtimespec;
    CFArrayRemoveAllValues((CFMutableArrayRef)qword_1000252C0);
    CFArrayRemoveAllValues((CFMutableArrayRef)qword_1000252C8);
    sub_1000163D0("/System/Library/Filesystems");
    sub_1000163D0("/Library/Filesystems");
    uint64_t v1 = (__CFArray *)qword_1000252C8;
    v4.length = CFArrayGetCount((CFArrayRef)qword_1000252C8);
    v4.location = 0;
    CFArraySortValues(v1, v4, (CFComparatorFunction)sub_1000165D0, 0);
  }
}

void sub_1000163D0(const char *a1)
{
  size_t v2 = strlen(a1);
  CFURLRef v3 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)a1, v2, 1u);
  if (v3)
  {
    CFURLRef v4 = v3;
    id v5 = opendir(a1);
    if (v5)
    {
      id v6 = v5;
      sub_100008A7C("filesystems have been refreshed.");
      for (CFIndex i = readdir(v6); i; CFIndex i = readdir(v6))
      {
        d_mach_port_name_t name = i->d_name;
        int v9 = (char *)&i->d_namlen + strlen(i->d_name);
        if (v9 > d_name && !strcmp(v9, ".fs"))
        {
          if (!byte_100024441 && _os_feature_enabled_impl() && !strcmp(d_name, "msdos.fs"))
          {
            sub_100008B68("Skipping msdos.fs as msdosUseFSKitModule pref is on");
          }
          else
          {
            size_t v10 = strlen(d_name);
            CFURLRef v11 = CFURLCreateFromFileSystemRepresentationRelativeToBase(kCFAllocatorDefault, (const UInt8 *)d_name, v10, 1u, v4);
            if (v11)
            {
              CFURLRef v12 = v11;
              uint64_t v13 = sub_1000064B0((uint64_t)kCFAllocatorDefault, v11);
              if (v13)
              {
                unsigned __int8 v14 = (void *)v13;
                sub_1000089E0("  created filesystem, id = %@.", v13);
                CFArrayAppendValue((CFMutableArrayRef)qword_1000252C0, v14);
                CFDictionaryRef v15 = (const __CFDictionary *)sub_100006638((uint64_t)v14);
                if (v15) {
                  CFDictionaryApplyFunction(v15, (CFDictionaryApplierFunction)sub_100017518, v14);
                }
                CFRelease(v14);
              }
              CFRelease(v12);
            }
          }
        }
      }
      closedir(v6);
    }
    CFRelease(v4);
  }
}

CFComparisonResult sub_1000165D0(const __CFDictionary *a1, const __CFDictionary *a2)
{
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"FSProbeOrder");
  CFNumberRef v4 = (const __CFNumber *)CFDictionaryGetValue(a2, @"FSProbeOrder");
  if (!Value) {
    return 1;
  }
  if (!v4) {
    return -1;
  }

  return CFNumberCompare(Value, v4, 0);
}

uint64_t sub_100016658()
{
  memset(&v26, 0, sizeof(v26));
  uint64_t result = stat("/etc/fstab", &v26);
  if (result)
  {
    uint64_t v1 = 0;
    qword_100025218 = 0;
    qword_100025220 = 0;
  }
  else
  {
    uint64_t v1 = qword_100025218;
  }
  if (v1 != v26.st_mtimespec.tv_sec)
  {
    tv_nseCC_SHA256_CTX c = v26.st_mtimespec.tv_nsec;
    goto LABEL_8;
  }
  tv_nseCC_SHA256_CTX c = v26.st_mtimespec.tv_nsec;
  if (qword_100025220 != v26.st_mtimespec.tv_nsec)
  {
LABEL_8:
    qword_100025218 = v26.st_mtimespec.tv_sec;
    qword_100025220 = tv_nsec;
    CFArrayRemoveAllValues((CFMutableArrayRef)qword_1000252E8);
    uint64_t result = sub_100001904();
    if (!result) {
      return result;
    }
    CFURLRef v3 = sub_1000018C0();
    if (!v3) {
      return sub_100001E28();
    }
    CFNumberRef v4 = v3;
    while (1)
    {
      if (!strcmp((const char *)v4[4], "sw")) {
        goto LABEL_44;
      }
      __stringp = (char *)*v4;
      strsep(&__stringp, "=");
      if (!__stringp) {
        goto LABEL_44;
      }
      CFStringRef v5 = CFStringCreateWithCString(kCFAllocatorDefault, __stringp, 0x8000100u);
      if (!v5) {
        goto LABEL_44;
      }
      CFStringRef v6 = v5;
      id v7 = (const char *)*v4;
      if (!strcmp((const char *)*v4, "UUID")) {
        break;
      }
      if (!strcmp(v7, "LABEL"))
      {
        id v8 = (void *)CFRetain(v6);
LABEL_20:
        int v9 = v8;
        if (v8)
        {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          if (Mutable)
          {
            CFURLRef v11 = Mutable;
            CFMutableStringRef v12 = CFStringCreateMutable(kCFAllocatorDefault, 0);
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v27 = (char *)v4[3];
              unsigned __int8 v14 = strsep(&v27, ",");
              if (v14)
              {
                CFDictionaryRef v15 = v14;
                CFBooleanRef v16 = 0;
                do
                {
                  CFBooleanRef v17 = v16;
                  CFBooleanRef v16 = kCFBooleanTrue;
                  if (strcmp(v15, "auto"))
                  {
                    CFBooleanRef v16 = kCFBooleanFalse;
                    if (strcmp(v15, "noauto"))
                    {
                      CFStringAppendCString(v13, v15, 0x8000100u);
                      CFStringAppendCString(v13, ",", 0x8000100u);
                      CFBooleanRef v16 = v17;
                    }
                  }
                  CFDictionaryRef v15 = strsep(&v27, ",");
                }
                while (v15);
                if (v16) {
                  CFDictionarySetValue(v11, @"DAMountAutomatic", v16);
                }
              }
              if (CFStringGetLength(v13))
              {
                CFStringTrim(v13, @",");
                CFDictionarySetValue(v11, @"DAMountOptions", v13);
              }
              CFRelease(v13);
            }
            unsigned int v18 = (const char *)v4[1];
            if (strcmp(v18, "none"))
            {
              size_t v19 = strlen(v18);
              CFURLRef v20 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)v18, v19, 1u);
              if (v20)
              {
                CFURLRef v21 = v20;
                CFDictionarySetValue(v11, @"DAMountPath", v20);
                CFRelease(v21);
              }
            }
            uint64_t v22 = (const char *)v4[2];
            if (strcmp(v22, "auto"))
            {
              CFStringRef v23 = CFStringCreateWithCString(kCFAllocatorDefault, v22, 0x8000100u);
              if (v23)
              {
                CFStringRef v24 = v23;
                CFDictionarySetValue(v11, @"DAProbeKind", v23);
                CFRelease(v24);
              }
            }
            CFDictionarySetValue(v11, @"DAProbeID", v9);
            CFRelease(v9);
            CFRelease(v6);
            CFArrayAppendValue((CFMutableArrayRef)qword_1000252E8, v11);
            id v25 = v11;
          }
          else
          {
            CFRelease(v9);
            id v25 = v6;
          }
          CFRelease(v25);
          goto LABEL_44;
        }
        goto LABEL_41;
      }
      if (!strcmp(v7, "DEVICE"))
      {
        id v8 = (void *)sub_100002704((uint64_t)kCFAllocatorDefault, v6);
        goto LABEL_20;
      }
LABEL_41:
      CFRelease(v6);
LABEL_44:
      CFNumberRef v4 = sub_1000018C0();
      if (!v4) {
        return sub_100001E28();
      }
    }
    id v8 = sub_100002BB8(kCFAllocatorDefault, v6);
    goto LABEL_20;
  }
  return result;
}

uint64_t sub_100016A78()
{
  memset(&v14, 0, sizeof(v14));
  uint64_t result = stat("/var/db/volinfo.database", &v14);
  if (result)
  {
    uint64_t v1 = 0;
    qword_100025228 = 0;
    qword_100025230 = 0;
  }
  else
  {
    uint64_t v1 = qword_100025228;
  }
  if (v1 != v14.st_mtimespec.tv_sec)
  {
    tv_nseCC_SHA256_CTX c = v14.st_mtimespec.tv_nsec;
    goto LABEL_8;
  }
  tv_nseCC_SHA256_CTX c = v14.st_mtimespec.tv_nsec;
  if (qword_100025230 != v14.st_mtimespec.tv_nsec)
  {
LABEL_8:
    qword_100025228 = v14.st_mtimespec.tv_sec;
    qword_100025230 = tv_nsec;
    CFArrayRemoveAllValues((CFMutableArrayRef)qword_1000252F0);
    uint64_t result = sub_100001F18();
    if (!result) {
      return result;
    }
    CFURLRef v3 = sub_100001ED4();
    if (!v3) {
      return sub_100001FC0();
    }
    CFNumberRef v4 = v3;
    while (1)
    {
      CFStringRef v5 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)*v4, 0x8000100u);
      if (v5) {
        break;
      }
LABEL_25:
      CFNumberRef v4 = sub_100001ED4();
      if (!v4) {
        return sub_100001FC0();
      }
    }
    CFStringRef v6 = (__CFString *)v5;
    CFUUIDRef v7 = sub_100006394(kCFAllocatorDefault, v5);
    if (v7)
    {
      CFUUIDRef v8 = v7;
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (Mutable)
      {
        size_t v10 = Mutable;
        CFURLRef v11 = CFStringCreateMutable(kCFAllocatorDefault, 0);
        if (v11)
        {
          CFMutableStringRef v12 = v11;
          if (v4[1]) {
            CFStringRef v13 = @"owners";
          }
          else {
            CFStringRef v13 = @"noowners";
          }
          CFStringAppend(v11, v13);
          CFStringAppend(v12, @",");
          if (CFStringGetLength(v12))
          {
            CFStringTrim(v12, @",");
            CFDictionarySetValue(v10, @"DAMountOptions", v12);
          }
          CFRelease(v12);
        }
        CFDictionarySetValue(v10, @"DAProbeID", v8);
        CFRelease(v8);
        CFRelease(v6);
        CFArrayAppendValue((CFMutableArrayRef)qword_1000252F0, v10);
        goto LABEL_24;
      }
      CFRelease(v8);
    }
    size_t v10 = (__CFDictionary *)v6;
LABEL_24:
    CFRelease(v10);
    goto LABEL_25;
  }
  return result;
}

void sub_100016C90()
{
  memset(&v51, 0, sizeof(v51));
  memset(&v50, 0, sizeof(v50));
  if (stat("/Library/Preferences/SystemConfiguration/autodiskmount.plist", &v51))
  {
    qword_100025238 = 0;
    qword_100025240 = 0;
  }
  if (stat("/Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist", &v50)) {
    xmmword_100025248 = 0uLL;
  }
  if (qword_100025238 == v51.st_mtimespec.tv_sec)
  {
    tv_nseCC_SHA256_CTX c = v51.st_mtimespec.tv_nsec;
    if (qword_100025240 == v51.st_mtimespec.tv_nsec)
    {
      if ((void)xmmword_100025248 == v50.st_mtimespec.tv_sec)
      {
        tv_nseCC_SHA256_CTX c = qword_100025240;
        if (*((void *)&xmmword_100025248 + 1) == v50.st_mtimespec.tv_nsec) {
          return;
        }
      }
      else
      {
        tv_nseCC_SHA256_CTX c = qword_100025240;
      }
    }
  }
  else
  {
    tv_nseCC_SHA256_CTX c = v51.st_mtimespec.tv_nsec;
  }
  qword_100025238 = v51.st_mtimespec.tv_sec;
  qword_100025240 = tv_nsec;
  xmmword_100025248 = (__int128)v50.st_mtimespec;
  CFDictionaryRemoveAllValues((CFMutableDictionaryRef)qword_1000252F8);
  uint64_t v1 = SCPreferencesCreate(kCFAllocatorDefault, @"autodiskmount", @"autodiskmount.plist");
  if (v1)
  {
    size_t v2 = v1;
    CFBooleanRef Value = (const __CFBoolean *)SCPreferencesGetValue(v1, @"AutomountDisksWithoutUserLogin");
    CFBooleanRef v4 = Value;
    CFBooleanRef v5 = kCFBooleanTrue;
    if (Value == kCFBooleanTrue)
    {
      CFBooleanRef v5 = kCFBooleanFalse;
      CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252F8, @"DAMountDeferExternal", kCFBooleanFalse);
    }
    else
    {
      if (Value != kCFBooleanFalse)
      {
LABEL_18:
        CFRelease(v2);
        goto LABEL_19;
      }
      CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252F8, @"DAMountDeferExternal", Value);
      CFBooleanRef v4 = kCFBooleanTrue;
    }
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252F8, @"DAMountDeferRemovable", v5);
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252F8, @"DAMountTrustExternal", v4);
    goto LABEL_18;
  }
LABEL_19:
  CFStringRef v6 = SCPreferencesCreate(kCFAllocatorDefault, @"com.apple.DiskArbitration.diskarbitrationd", @"com.apple.DiskArbitration.diskarbitrationd.plist");
  if (v6)
  {
    CFUUIDRef v7 = v6;
    CFPropertyListRef v8 = SCPreferencesGetValue(v6, @"DAMountDeferExternal");
    if (v8)
    {
      int v9 = v8;
      CFTypeID v10 = CFGetTypeID(v8);
      if (v10 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252F8, @"DAMountDeferExternal", v9);
      }
    }
    CFPropertyListRef v11 = SCPreferencesGetValue(v7, @"DAMountDeferInternal");
    if (v11)
    {
      CFMutableStringRef v12 = v11;
      CFTypeID v13 = CFGetTypeID(v11);
      if (v13 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252F8, @"DAMountDeferInternal", v12);
      }
    }
    CFPropertyListRef v14 = SCPreferencesGetValue(v7, @"DAMountDeferRemovable");
    if (v14)
    {
      CFDictionaryRef v15 = v14;
      CFTypeID v16 = CFGetTypeID(v14);
      if (v16 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252F8, @"DAMountDeferRemovable", v15);
      }
    }
    CFPropertyListRef v17 = SCPreferencesGetValue(v7, @"DAMountTrustExternal");
    if (v17)
    {
      unsigned int v18 = v17;
      CFTypeID v19 = CFGetTypeID(v17);
      if (v19 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252F8, @"DAMountTrustExternal", v18);
      }
    }
    CFPropertyListRef v20 = SCPreferencesGetValue(v7, @"DAMountTrustInternal");
    if (v20)
    {
      CFURLRef v21 = v20;
      CFTypeID v22 = CFGetTypeID(v20);
      if (v22 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252F8, @"DAMountTrustInternal", v21);
      }
    }
    CFPropertyListRef v23 = SCPreferencesGetValue(v7, @"DAMountTrustRemovable");
    if (v23)
    {
      CFStringRef v24 = v23;
      CFTypeID v25 = CFGetTypeID(v23);
      if (v25 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252F8, @"DAMountTrustRemovable", v24);
      }
    }
    CFPropertyListRef v26 = SCPreferencesGetValue(v7, @"DAAutoMountDisable");
    if (v26)
    {
      uint64_t v27 = v26;
      CFTypeID v28 = CFGetTypeID(v26);
      if (v28 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252F8, @"DAAutoMountDisable", v27);
      }
    }
    CFPropertyListRef v29 = SCPreferencesGetValue(v7, @"DAEnableUserFSMountExternal");
    if (v29)
    {
      __uint64_t v30 = v29;
      CFTypeID v31 = CFGetTypeID(v29);
      if (v31 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252F8, @"DAEnableUserFSMountExternal", v30);
      }
    }
    CFPropertyListRef v32 = SCPreferencesGetValue(v7, @"DAEnableUserFSMountInternal");
    if (v32)
    {
      CFIndex v33 = v32;
      CFTypeID v34 = CFGetTypeID(v32);
      if (v34 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252F8, @"DAEnableUserFSMountInternal", v33);
      }
    }
    CFPropertyListRef v35 = SCPreferencesGetValue(v7, @"DAEnableUserFSMountRemovable");
    if (v35)
    {
      char v36 = v35;
      CFTypeID v37 = CFGetTypeID(v35);
      if (v37 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252F8, @"DAEnableUserFSMountRemovable", v36);
      }
    }
    CFPropertyListRef v38 = SCPreferencesGetValue(v7, @"DAMountMethod");
    if (v38)
    {
      uint64_t v39 = v38;
      CFTypeID v40 = CFGetTypeID(v38);
      if (v40 == CFStringGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252F8, @"DAMountMethod", v39);
      }
    }
    CFPropertyListRef v41 = SCPreferencesGetValue(v7, @"DADisableEjectNotification");
    if (v41)
    {
      int v42 = v41;
      CFTypeID v43 = CFGetTypeID(v41);
      if (v43 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252F8, @"DADisableEjectNotification", v42);
      }
    }
    CFPropertyListRef v44 = SCPreferencesGetValue(v7, @"DADisableUnreadableNotification");
    if (v44)
    {
      size_t v45 = v44;
      CFTypeID v46 = CFGetTypeID(v44);
      if (v46 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252F8, @"DADisableUnreadableNotification", v45);
      }
    }
    CFPropertyListRef v47 = SCPreferencesGetValue(v7, @"DADisableUnrepairableNotification");
    if (v47)
    {
      CFIndex v48 = v47;
      CFTypeID v49 = CFGetTypeID(v47);
      if (v49 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252F8, @"DADisableUnrepairableNotification", v48);
      }
    }
    CFRelease(v7);
  }
}

void *sub_100017218(uint64_t a1, int a2)
{
  uint64_t result = (void *)sub_100005828(a1, @"DAMediaBSDUnit");
  if (result)
  {
    uint64_t result = (void *)CFDictionaryGetValue((CFDictionaryRef)qword_100025338, result);
    if (result) {
      return (void *)((*(_DWORD *)CFDataGetMutableBytePtr((CFMutableDataRef)result) & a2) != 0);
    }
  }
  return result;
}

uint64_t sub_100017274(uint64_t a1, int a2)
{
  if (sub_100017218(a1, a2)) {
    return 1;
  }
  uint64_t result = sub_100005820(a1);
  io_registry_entry_t entry = result;
  if (result)
  {
    char v5 = 0;
    IOOptionBits v6 = 3;
    char v7 = 1;
    do
    {
      char v15 = v7;
      do
      {
        io_iterator_t iterator = 0;
        IORegistryEntryCreateIterator(entry, "IOService", v6, &iterator);
        if (!iterator) {
          break;
        }
        io_object_t v8 = IOIteratorNext(iterator);
        if (v8) {
          IOObjectRelease(v8);
        }
        io_object_t v9 = IOIteratorNext(iterator);
        if (v9)
        {
          io_object_t v10 = v9;
          do
          {
            if (IOObjectConformsTo(v10, "IOMedia"))
            {
              CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v10, @"BSD Unit", kCFAllocatorDefault, 0);
              if (CFProperty)
              {
                CFMutableStringRef v12 = CFProperty;
                CFBooleanRef Value = (__CFData *)CFDictionaryGetValue((CFDictionaryRef)qword_100025338, CFProperty);
                if (Value && (*(_DWORD *)CFDataGetMutableBytePtr(Value) & a2) != 0)
                {
                  CFRelease(v12);
                  IOObjectRelease(v10);
                  IOObjectRelease(iterator);
                  return 1;
                }
                CFRelease(v12);
              }
            }
            else if ((v5 & 1) == 0 && IOObjectConformsTo(v10, "IOBlockStorageDevice"))
            {
              IORegistryIteratorExitEntry(iterator);
            }
            IOObjectRelease(v10);
            io_object_t v10 = IOIteratorNext(iterator);
          }
          while (v10);
        }
        char IsValid = IOIteratorIsValid(iterator);
        IOObjectRelease(iterator);
      }
      while (!IsValid);
      char v7 = 0;
      uint64_t result = 0;
      char v5 = 1;
      IOOptionBits v6 = 1;
    }
    while ((v15 & 1) != 0);
  }
  return result;
}

void sub_100017434(uint64_t a1, int a2, int a3)
{
  char v5 = sub_100005828(a1, @"DAMediaBSDUnit");
  if (v5)
  {
    IOOptionBits v6 = v5;
    CFBooleanRef Value = (__CFData *)CFDictionaryGetValue((CFDictionaryRef)qword_100025338, v5);
    if (Value)
    {
      MutableBytePtr = CFDataGetMutableBytePtr(Value);
      if (a3) {
        int v9 = a2;
      }
      else {
        int v9 = 0;
      }
      *(_DWORD *)MutableBytePtr = *(_DWORD *)MutableBytePtr & ~a2 | v9;
    }
    else
    {
      CFMutableDictionaryRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, 4);
      if (Mutable)
      {
        CFPropertyListRef v11 = Mutable;
        CFMutableStringRef v12 = CFDataGetMutableBytePtr(Mutable);
        if (a3) {
          int v13 = a2;
        }
        else {
          int v13 = 0;
        }
        *(_DWORD *)CFMutableStringRef v12 = v13;
        CFDictionarySetValue((CFMutableDictionaryRef)qword_100025338, v6, v11);
        CFRelease(v11);
      }
    }
  }
}

void sub_100017518(int a1, CFDictionaryRef theDict, const void *a3)
{
  CFArrayRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, theDict);
  if (MutableCopy)
  {
    char v5 = MutableCopy;
    CFDictionarySetValue(MutableCopy, @"DAFileSystem", a3);
    CFArrayAppendValue((CFMutableArrayRef)qword_1000252C8, v5);
    CFRelease(v5);
  }
}

uint64_t sub_10001759C()
{
  if (dword_100025258) {
    goto LABEL_6;
  }
  if (!mach_port_allocate(mach_task_self_, 1u, (mach_port_name_t *)&dword_100025258)
    && !mach_port_insert_right(mach_task_self_, dword_100025258, dword_100025258, 0x14u))
  {
    integer_t port_info = 1;
    mach_port_set_attributes(mach_task_self_, dword_100025258, 1, &port_info, 1u);
  }
  if (dword_100025258)
  {
LABEL_6:
    sub_100012CBC();
    qword_100025260 = dispatch_mach_create_f();
    dispatch_mach_connect();
  }
  return qword_100025260;
}

void sub_100017678(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    mach_msg_header_t msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
    pthread_mutex_lock(&stru_1000244A8);
    uint64_t v3 = qword_100025268;
    if (qword_100025268)
    {
      uint64_t v4 = 0;
      do
      {
        while (1)
        {
          uint64_t v5 = v3;
          if (*(_DWORD *)v3 != 1) {
            sub_10001AA9C();
          }
          if (*(unsigned char *)(v3 + 16)) {
            break;
          }
          uint64_t v3 = *(void *)(v3 + 8);
          uint64_t v4 = v5;
          if (!v3) {
            goto LABEL_14;
          }
        }
        if (v4) {
          IOOptionBits v6 = (uint64_t *)(v4 + 8);
        }
        else {
          IOOptionBits v6 = &qword_100025268;
        }
        uint64_t *v6 = *(void *)(v3 + 8);
        pthread_mutex_unlock(&stru_1000244A8);
        char v7 = *(void (**)(void, void))(v5 + 32);
        if (v7) {
          v7(*(unsigned int *)(v5 + 20), *(void *)(v5 + 40));
        }
        free((void *)v5);
        pthread_mutex_lock(&stru_1000244A8);
        uint64_t v4 = 0;
        uint64_t v3 = qword_100025268;
      }
      while (qword_100025268);
    }
LABEL_14:
    pthread_mutex_unlock(&stru_1000244A8);
    mach_msg_destroy(msg);
  }
}

uint64_t sub_100017794(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t), uint64_t a4)
{
  if (!dword_100025258) {
    sub_10001AAC8();
  }
  pthread_t v11 = 0;
  pthread_mutex_lock(&stru_1000244A8);
  int v8 = pthread_create(&v11, 0, (void *(__cdecl *)(void *))sub_10001788C, 0);
  if (!v8)
  {
    int v9 = malloc_type_malloc(0x40uLL, 0x10A0040B699CF8BuLL);
    if (v9)
    {
      *(_DWORD *)int v9 = 1;
      v9[1] = qword_100025268;
      *((unsigned char *)v9 + 16) = 0;
      *((_DWORD *)v9 + 5) = 0;
      v9[3] = v11;
      void v9[4] = a3;
      v9[5] = a4;
      v9[6] = a1;
      v9[7] = a2;
      qword_100025268 = (uint64_t)v9;
    }
  }
  uint64_t result = pthread_mutex_unlock(&stru_1000244A8);
  if (a3)
  {
    if (v8) {
      return a3(71, a4);
    }
  }
  return result;
}

uint64_t sub_10001788C()
{
  pthread_mutex_lock(&stru_1000244A8);
  uint64_t v0 = qword_100025268;
  if (qword_100025268)
  {
    while (1)
    {
      if (*(_DWORD *)v0 != 1) {
        sub_10001AAF4();
      }
      uint64_t v1 = *(_opaque_pthread_t **)(v0 + 24);
      size_t v2 = pthread_self();
      if (pthread_equal(v1, v2)) {
        break;
      }
      uint64_t v0 = *(void *)(v0 + 8);
      if (!v0) {
        goto LABEL_5;
      }
    }
    pthread_mutex_unlock(&stru_1000244A8);
    *(_DWORD *)(v0 + 2sub_10000C338(16, 0, 0) = (*(uint64_t (**)(void))(v0 + 48))(*(void *)(v0 + 56));
    pthread_mutex_lock(&stru_1000244A8);
    *(unsigned char *)(v0 + 16) = 1;
    pthread_mutex_unlock(&stru_1000244A8);
    uint64_t v3 = dispatch_mach_msg_create();
    dispatch_mach_send();
    dispatch_release(v3);
  }
  else
  {
LABEL_5:
    pthread_mutex_unlock(&stru_1000244A8);
  }
  uint64_t v4 = pthread_self();
  pthread_detach(v4);
  return 0;
}

uint64_t sub_100017998(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 20);
  if (v1 <= 0x10) {
    return (uint64_t)*(&off_1000214A8 + 5 * v1 + 5);
  }
  else {
    return 0;
  }
}

const char *sub_1000179C4(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0
    || (v3 = result, uint64_t v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x428
    || ((v5 = *((_DWORD *)result + 9), v5 <= 0x400) ? (BOOL v6 = (int)v4 - 40 >= v5) : (BOOL v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (BOOL v8 = v4 == v7) : (BOOL v8 = 0),
        !v8 || (uint64_t result = (const char *)memchr((void *)(result + 40), 0, v4 - 40)) == 0))
  {
    *(_DWORD *)(a2 + 32) = -304;
LABEL_12:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = (const char *)sub_100011238(*((_DWORD *)v3 + 3), v3 + 40, (vm_address_t *)(a2 + 28), (unsigned int *)(a2 + 52));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
    goto LABEL_12;
  }
  *(_DWORD *)(a2 + 4sub_10000C338(16, 0, 0) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

const char *sub_100017AC4(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0
    || (v3 = result, uint64_t v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x428
    || ((v5 = *((_DWORD *)result + 9), v5 <= 0x400) ? (BOOL v6 = (int)v4 - 40 >= v5) : (BOOL v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (BOOL v8 = v4 == v7) : (BOOL v8 = 0),
        !v8 || (uint64_t result = (const char *)memchr((void *)(result + 40), 0, v4 - 40)) == 0))
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v9 = NDR_record;
LABEL_12:
    *(NDR_record_t *)(a2 + 24) = v9;
    return result;
  }
  uint64_t result = (const char *)sub_1000113A4(*((_DWORD *)v3 + 3), v3 + 40, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v9 = NDR_record;
  if (result) {
    goto LABEL_12;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

const char *sub_100017B94(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0
    || (v3 = result, uint64_t v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x428
    || ((v5 = *((_DWORD *)result + 9), v5 <= 0x400) ? (BOOL v6 = (int)v4 - 40 >= v5) : (BOOL v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (BOOL v8 = v4 == v7) : (BOOL v8 = 0),
        !v8 || (uint64_t result = (const char *)memchr((void *)(result + 40), 0, v4 - 40)) == 0))
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v9 = NDR_record;
LABEL_12:
    *(NDR_record_t *)(a2 + 24) = v9;
    return result;
  }
  uint64_t result = (const char *)sub_100011468(*((_DWORD *)v3 + 3), v3 + 40, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v9 = NDR_record;
  if (result) {
    goto LABEL_12;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

const char *sub_100017C64(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0
    || (v3 = result, uint64_t v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x428
    || ((v5 = *((_DWORD *)result + 9), v5 <= 0x400) ? (BOOL v6 = (int)v4 - 40 >= v5) : (BOOL v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (BOOL v8 = v4 == v7) : (BOOL v8 = 0),
        !v8 || (uint64_t result = (const char *)memchr((void *)(result + 40), 0, v4 - 40)) == 0))
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v9 = NDR_record;
LABEL_12:
    *(NDR_record_t *)(a2 + 24) = v9;
    return result;
  }
  uint64_t result = (const char *)sub_1000114C4(*((_DWORD *)v3 + 3), v3 + 40, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v9 = NDR_record;
  if (result) {
    goto LABEL_12;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

const char *sub_100017D34(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  uint64_t v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  if (v4 < 0x2C) {
    goto LABEL_16;
  }
  if (v4 > 0x42C) {
    goto LABEL_16;
  }
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || v4 != v6 + 44) {
    goto LABEL_16;
  }
  uint64_t v8 = 1064;
  if (*((unsigned int *)result + 1) < 0x428uLL) {
    uint64_t v8 = *((unsigned int *)result + 1);
  }
  uint64_t result = (const char *)memchr((void *)(result + 40), 0, v8 - 40);
  if (result)
  {
    NDR_record_t v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      int v11 = *((_DWORD *)v3 + 3);
      int v12 = *(_DWORD *)&v3[v6 + 40];
      long long v13 = *(_OWORD *)(v9 + 36);
      v14[0] = *(_OWORD *)(v9 + 20);
      v14[1] = v13;
      uint64_t result = (const char *)sub_1000115A4(v11, v3 + 40, v12, v14);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_18;
    }
    int v10 = -309;
  }
  else
  {
LABEL_16:
    int v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
LABEL_18:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

const char *sub_100017E48(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  uint64_t v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  if (v4 < 0x2C) {
    goto LABEL_16;
  }
  if (v4 > 0x42C) {
    goto LABEL_16;
  }
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || v4 != v6 + 44) {
    goto LABEL_16;
  }
  uint64_t v8 = 1064;
  if (*((unsigned int *)result + 1) < 0x428uLL) {
    uint64_t v8 = *((unsigned int *)result + 1);
  }
  uint64_t result = (const char *)memchr((void *)(result + 40), 0, v8 - 40);
  if (result)
  {
    NDR_record_t v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      int v11 = *((_DWORD *)v3 + 3);
      uint64_t v12 = *(unsigned int *)&v3[v6 + 40];
      long long v13 = *(_OWORD *)(v9 + 36);
      v14[0] = *(_OWORD *)(v9 + 20);
      v14[1] = v13;
      uint64_t result = (const char *)sub_1000116E8(v11, v3 + 40, v12, v14);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_18;
    }
    int v10 = -309;
  }
  else
  {
LABEL_16:
    int v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
LABEL_18:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

const char *sub_100017F5C(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_14;
  }
  uint64_t v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  if (v4 < 0x30) {
    goto LABEL_14;
  }
  if (v4 > 0x430) {
    goto LABEL_14;
  }
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x400) {
    goto LABEL_14;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 48 < v5 || v4 != v6 + 48) {
    goto LABEL_14;
  }
  if (*((unsigned int *)result + 1) >= 0x428uLL) {
    uint64_t v4 = 1064;
  }
  uint64_t result = (const char *)memchr((void *)(result + 40), 0, v4 - 40);
  if (result)
  {
    uint64_t result = (const char *)sub_100011814(*((_DWORD *)v3 + 3), v3 + 40, *(unsigned int *)&v3[v6 + 40], *(_DWORD *)&v3[v6 + 44]);
    *(_DWORD *)(a2 + 32) = result;
  }
  else
  {
LABEL_14:
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

const char *sub_100018024(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0
    && (v3 = result, uint64_t v4 = *((unsigned int *)result + 1), v4 >= 0x28)
    && v4 <= 0x428
    && ((v5 = *((_DWORD *)result + 9), v5 <= 0x400) ? (BOOL v6 = (int)v4 - 40 >= v5) : (BOOL v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (BOOL v8 = v4 == v7) : (BOOL v8 = 0),
        v8 && (uint64_t result = (const char *)memchr((void *)(result + 40), 0, v4 - 40)) != 0))
  {
    uint64_t result = (const char *)sub_100011908(*((_DWORD *)v3 + 3), v3 + 40);
    *(_DWORD *)(a2 + 32) = result;
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  return result;
}

_DWORD *sub_1000180D4(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = (_DWORD *)sub_1000119E4(result[3], (vm_address_t *)(a2 + 28), (unsigned int *)(a2 + 52));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  *(_DWORD *)(a2 + 4sub_10000C338(16, 0, 0) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

const char *sub_100018180(const char *result, _DWORD *a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0
    || (v3 = result, uint64_t v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x428
    || ((v5 = *((_DWORD *)result + 9), v5 <= 0x400) ? (BOOL v6 = (int)v4 - 40 >= v5) : (BOOL v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (BOOL v8 = v4 == v7) : (BOOL v8 = 0),
        !v8 || (uint64_t result = (const char *)memchr((void *)(result + 40), 0, v4 - 40)) == 0))
  {
    int v9 = -304;
LABEL_12:
    a2[8] = v9;
    goto LABEL_13;
  }
  int v10 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
  if (*(_DWORD *)v10 || *((_DWORD *)v10 + 1) <= 0x1Fu)
  {
    int v9 = -309;
    goto LABEL_12;
  }
  *((void *)a2 + 4) = 0x14000000000000;
  int v11 = *((_DWORD *)v3 + 3);
  long long v12 = *(_OWORD *)(v10 + 36);
  v13[0] = *(_OWORD *)(v10 + 20);
  v13[1] = v12;
  uint64_t result = (const char *)sub_100011C08(v11, v3 + 40, v13, a2 + 7);
  if (!result)
  {
    *a2 |= 0x80000000;
    a2[1] = 40;
    a2[6] = 1;
    return result;
  }
  a2[8] = result;
LABEL_13:
  *((NDR_record_t *)a2 + 3) = NDR_record;
  return result;
}

void sub_1000182A0(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 2) {
    goto LABEL_3;
  }
  uint64_t v5 = *(unsigned int *)(a1 + 4);
  if (v5 < 0x6C || v5 > 0x46C) {
    goto LABEL_3;
  }
  if (*(unsigned char *)(a1 + 39) != 1 || *(unsigned char *)(a1 + 55) != 1) {
    goto LABEL_21;
  }
  unsigned int v6 = *(_DWORD *)(a1 + 76);
  if (v6 > 0x400)
  {
LABEL_2:
    int v3 = -304;
    goto LABEL_3;
  }
  int v3 = -304;
  if ((int)v5 - 108 < v6) {
    goto LABEL_3;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v5 != v7 + 108) {
    goto LABEL_3;
  }
  uint64_t v8 = a1 + v7;
  unsigned int v9 = *(_DWORD *)(a1 + 40);
  if (v9 != *(_DWORD *)(v8 + 84) || (uint64_t v10 = v8 - 1024, v11 = *(_DWORD *)(a1 + 56), v11 != *(_DWORD *)(v8 + 88)))
  {
LABEL_21:
    int v3 = -300;
    goto LABEL_3;
  }
  uint64_t v12 = 1104;
  if (*(unsigned int *)(a1 + 4) < 0x450uLL) {
    uint64_t v12 = *(unsigned int *)(a1 + 4);
  }
  if (!memchr((void *)(a1 + 80), 0, v12 - 80)) {
    goto LABEL_2;
  }
  uint64_t v13 = ((v5 + 3) & 0x1FFFFFFFCLL) + a1;
  if (!*(_DWORD *)v13 && *(_DWORD *)(v13 + 4) > 0x1Fu)
  {
    int v14 = *(_DWORD *)(a1 + 12);
    unsigned int v15 = *(_DWORD *)(a1 + 68);
    uint64_t v16 = *(unsigned int *)(v10 + 1104);
    CFPropertyListRef v17 = *(const UInt8 **)(a1 + 28);
    unsigned int v18 = *(const UInt8 **)(a1 + 44);
    uint64_t v19 = *(void *)(v10 + 1116);
    uint64_t v20 = *(void *)(v10 + 1124);
    long long v21 = *(_OWORD *)(v13 + 36);
    v22[0] = *(_OWORD *)(v13 + 20);
    v22[1] = v21;
    *(_DWORD *)(a2 + 32) = sub_100011D8C(v14, v15, (const char *)(a1 + 80), v16, v17, v9, v18, v11, v19, v20, v22);
    mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
    *(void *)(a1 + 44) = 0;
    *(_DWORD *)(a1 + 56) = 0;
    mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
    *(void *)(a1 + 28) = 0;
    *(_DWORD *)(a1 + 4sub_10000C338(16, 0, 0) = 0;
    goto LABEL_4;
  }
  int v3 = -309;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100018468(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 1) {
    goto LABEL_3;
  }
  unsigned int v5 = *(_DWORD *)(a1 + 4);
  if (v5 < 0x58 || v5 > 0x458) {
    goto LABEL_3;
  }
  if (*(unsigned char *)(a1 + 39) != 1) {
    goto LABEL_16;
  }
  unsigned int v6 = *(_DWORD *)(a1 + 76);
  if (v6 > 0x400)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }
  int v3 = -304;
  if (v5 - 88 < v6) {
    goto LABEL_3;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v5 != v7 + 88) {
    goto LABEL_3;
  }
  uint64_t v8 = a1 + v7;
  unsigned int v9 = *(_DWORD *)(a1 + 40);
  if (v9 != *(_DWORD *)(v8 + 80))
  {
LABEL_16:
    int v3 = -300;
    goto LABEL_3;
  }
  uint64_t v10 = 1104;
  if (*(unsigned int *)(a1 + 4) < 0x450uLL) {
    uint64_t v10 = *(unsigned int *)(a1 + 4);
  }
  if (!memchr((void *)(a1 + 80), 0, v10 - 80)) {
    goto LABEL_2;
  }
  *(_DWORD *)(a2 + 32) = sub_1000123EC(*(_DWORD *)(a1 + 12), *(void *)(a1 + 52), *(void *)(a1 + 60), *(_DWORD *)(a1 + 68), (const char *)(a1 + 80), *(const UInt8 **)(a1 + 28), v9, *(_DWORD *)(v8 + 84));
  mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(void *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 4sub_10000C338(16, 0, 0) = 0;
}

void sub_1000185A0(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 2 || *(_DWORD *)(a1 + 4) != 100)
  {
    int v5 = -304;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v5;
    goto LABEL_11;
  }
  if (*(unsigned char *)(a1 + 39) != 1
    || *(unsigned char *)(a1 + 55) != 1
    || (unsigned int v4 = *(_DWORD *)(a1 + 40), v4 != *(_DWORD *)(a1 + 92))
    || *(_DWORD *)(a1 + 56) != *(_DWORD *)(a1 + 96))
  {
    int v5 = -300;
    goto LABEL_10;
  }
  *(_DWORD *)(a2 + 32) = sub_100012510(*(_DWORD *)(a1 + 12), *(void *)(a1 + 68), *(void *)(a1 + 76), *(_DWORD *)(a1 + 84), *(_DWORD *)(a1 + 88), *(__CFDictionary **)(a1 + 28), v4, *(const UInt8 **)(a1 + 44), *(_DWORD *)(a1 + 56));
  mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
  *(void *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(void *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 4sub_10000C338(16, 0, 0) = 0;
LABEL_11:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

_DWORD *sub_100018694(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  else
  {
    uint64_t result = (_DWORD *)sub_100011130(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

_DWORD *sub_1000186F0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    uint64_t result = (_DWORD *)sub_100012798(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10001874C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 40)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1114112)
    {
      uint64_t result = sub_10001284C(*(_DWORD *)(result + 12), *(_DWORD *)(result + 28));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -300;
  }
  else
  {
    int v3 = -304;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000187D4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 48)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  else
  {
    uint64_t result = sub_100012904(*(_DWORD *)(result + 12), *(void *)(result + 32), *(void *)(result + 40));
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t sub_100018838(_DWORD *a1, uint64_t a2)
{
  unsigned int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(void *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 2sub_10000C338(16, 0, 0) = v3;
  unsigned int v4 = a1[5];
  if (v4 <= 0x10 && (int v5 = (void (*)(void))*(&off_1000214A8 + 5 * v4 + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

uint64_t _FSGetTypeInfoFromStatfs(uint64_t a1, char *a2, size_t a3, _DWORD *a4)
{
  if (!sub_1000189D0((const char *)(a1 + 72)))
  {
    __strlcpy_chk();
    if (!a2) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v8 = a1 + 1112;
  unsigned int v9 = strstr((char *)(a1 + 1112), "://");
  if (!v9) {
    return 22;
  }
  if ((unint64_t)&v9[-v8] >= 0xF) {
    uint64_t v10 = 15;
  }
  else {
    uint64_t v10 = (uint64_t)&v9[-v8];
  }
  __memcpy_chk();
  __source[v10] = 0;
  if (a2) {
LABEL_9:
  }
    strlcpy(a2, __source, a3);
LABEL_10:
  uint64_t result = 0;
  if (a4) {
    *a4 = *(_DWORD *)(a1 + 68);
  }
  return result;
}

BOOL sub_1000189D0(const char *a1)
{
  return !strcmp(a1, "lifs") || strcmp(a1, "fskit") == 0;
}

uint64_t _FSGetTypeInfoForPath(const char *a1, char *a2, size_t a3, _DWORD *a4)
{
  memset(&v8, 0, 512);
  if (statfs(a1, &v8) == -1) {
    return *__error();
  }
  else {
    return _FSGetTypeInfoFromStatfs((uint64_t)&v8, a2, a3, a4);
  }
}

uint64_t _FSGetTypeInfoForFileDescriptor(int a1, char *a2, size_t a3, _DWORD *a4)
{
  memset(&v8, 0, 512);
  if (fstatfs(a1, &v8) == -1) {
    return *__error();
  }
  else {
    return _FSGetTypeInfoFromStatfs((uint64_t)&v8, a2, a3, a4);
  }
}

uint64_t _FSGetLocationFromStatfs(uint64_t a1, char *a2, size_t a3)
{
  unsigned int v6 = malloc_type_calloc(1uLL, 0x400uLL, 0x1359B406uLL);
  if (v6)
  {
    unsigned int v7 = v6;
    if (sub_1000189D0((const char *)(a1 + 72)))
    {
      statfs v8 = strstr((char *)(a1 + 1112), "://");
      if (!v8 || (unsigned int v9 = v8 + 3, (v10 = strchr(v8 + 3, 47)) == 0))
      {
        uint64_t v12 = 22;
LABEL_17:
        free(v7);
        return v12;
      }
      if (v10 - v9 >= 1023) {
        uint64_t v11 = 1023;
      }
      else {
        uint64_t v11 = v10 - v9;
      }
      __memcpy_chk();
      *((unsigned char *)v7 + v11) = 0;
      if (!a2)
      {
LABEL_16:
        uint64_t v12 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      if (strncmp((const char *)(a1 + 1112), "/dev/disk", 9uLL)) {
        strncmp((const char *)(a1 + 1112), "/dev/rdisk", 0xAuLL);
      }
      __strlcpy_chk();
      if (!a2) {
        goto LABEL_16;
      }
    }
    strlcpy(a2, (const char *)v7, a3);
    goto LABEL_16;
  }
  return 12;
}

uint64_t _FSGetLocationForPath(const char *a1, char *a2, size_t a3)
{
  memset(&v6, 0, 512);
  if (statfs(a1, &v6) == -1) {
    return *__error();
  }
  else {
    return _FSGetLocationFromStatfs((uint64_t)&v6, a2, a3);
  }
}

uint64_t _FSGetLocationForFileDescriptor(int a1, char *a2, size_t a3)
{
  memset(&v6, 0, 512);
  if (fstatfs(a1, &v6) == -1) {
    return *__error();
  }
  else {
    return _FSGetLocationFromStatfs((uint64_t)&v6, a2, a3);
  }
}

CFArrayRef FSCopyFormatNameForFSType(const __CFArray *result, int a2, unsigned int a3, int a4)
{
  __int16 v57 = a2;
  if (!result) {
    return result;
  }
  CFArrayRef v6 = result;
  CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"%d%@%d", a3, result, a2);
  _os_nospin_lock_lock();
  statfs v8 = &byte_100024D78[648];
  if (qword_100025278)
  {
    CFBooleanRef Value = CFDictionaryGetValue((CFDictionaryRef)qword_100025278, v7);
    _os_nospin_lock_unlock();
    if (Value)
    {
LABEL_70:
      CFRelease(v7);
      CFTypeID v49 = CFGetTypeID(Value);
      if (v49 == CFStringGetTypeID()) {
        return (const __CFArray *)CFRetain(Value);
      }
      CFTypeID v50 = CFGetTypeID(Value);
      if (v50 != CFDictionaryGetTypeID()) {
        return (const __CFArray *)CFRetain(Value);
      }
      unint64_t v51 = 8 * CFDictionaryGetCount((CFDictionaryRef)Value);
      __chkstk_darwin();
      unint64_t v52 = (v51 + 15) & 0xFFFFFFFFFFFFFFF0;
      if (v51 >= 0x200) {
        size_t v53 = 512;
      }
      else {
        size_t v53 = v51;
      }
      bzero((char *)&v54 - v52, v53);
      __chkstk_darwin();
      bzero((char *)&v54 - v52, v53);
      CFDictionaryGetKeysAndValues((CFDictionaryRef)Value, (const void **)((char *)&v54 - v52), (const void **)((char *)&v54 - v52));
      return (const __CFArray *)CFRetain(*(const void ***)((char *)&v54 - v52));
    }
  }
  else
  {
    _os_nospin_lock_unlock();
  }
  uint64_t result = (const __CFArray *)qword_100025280;
  if (qword_100025280) {
    goto LABEL_7;
  }
  uint64_t result = (const __CFArray *)CFCopySearchPathForDirectoriesInDomains();
  if (result)
  {
    CFArrayRef v16 = result;
    CFIndex Count = CFArrayGetCount(result);
    CFArrayRef Mutable = CFArrayCreateMutable(0, Count, 0);
    if (Mutable)
    {
      CFStringRef v55 = v7;
      LODWORD(v54) = a4;
      if (CFArrayGetCount(v16) < 1)
      {
LABEL_25:
        qword_100025280 = (uint64_t)CFArrayCreateCopy(0, Mutable);
      }
      else
      {
        CFIndex v19 = 0;
        while (1)
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v16, v19);
          CFTypeID v21 = CFGetTypeID(ValueAtIndex);
          if (v21 == CFURLGetTypeID())
          {
            if (!CFURLGetFileSystemRepresentation((CFURLRef)ValueAtIndex, 0, (UInt8 *)v60, 1025)) {
              break;
            }
          }
          else
          {
            CFTypeID v22 = CFGetTypeID(ValueAtIndex);
            if (v22 != CFStringGetTypeID()) {
              break;
            }
            CFStringGetCString(ValueAtIndex, v60, 1025, 0x8000100u);
          }
          __strlcat_chk();
          CFStringRef v23 = CFStringCreateWithCString(0, v60, 0x8000100u);
          if (!v23) {
            break;
          }
          CFStringRef v24 = v23;
          CFURLRef v25 = CFURLCreateWithFileSystemPath(0, v23, kCFURLPOSIXPathStyle, 1u);
          if (v25) {
            CFArrayAppendValue(Mutable, v25);
          }
          CFRelease(v24);
          if (++v19 >= CFArrayGetCount(v16)) {
            goto LABEL_25;
          }
        }
      }
      CFStringRef v7 = v55;
      statfs v8 = byte_100024D78 + 648;
    }
    CFRelease(Mutable);
    CFRelease(v16);
    uint64_t result = (const __CFArray *)qword_100025280;
    if (qword_100025280)
    {
LABEL_7:
      if (CFArrayGetCount(result) < 1)
      {
        CFBundleRef v14 = 0;
        char v15 = 1;
LABEL_63:
        CFStringRef v46 = (CFStringRef)qword_100025288;
        if (!qword_100025288)
        {
          MainBundle = CFBundleGetMainBundle();
          CFStringRef v46 = CFBundleCopyLocalizedString(MainBundle, @"Unknown", @"Unknown", 0);
          qword_100025288 = (uint64_t)v46;
        }
        CFBooleanRef Value = CFStringCreateWithFormat(0, 0, @"%@ (%@)", v46, v6);
LABEL_66:
        _os_nospin_lock_lock();
        CFIndex v48 = (__CFDictionary *)*((void *)v8 + 79);
        if (!v48)
        {
          CFIndex v48 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          *((void *)v8 + 79) = v48;
        }
        CFDictionarySetValue(v48, v7, Value);
        _os_nospin_lock_unlock();
        if ((v15 & 1) == 0) {
          CFRelease(v14);
        }
        goto LABEL_70;
      }
      CFStringRef v55 = v7;
      CFIndex v10 = 0;
      while (1)
      {
        CFURLRef v11 = (const __CFURL *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025280, v10);
        CFStringRef v12 = CFStringCreateWithFormat(0, 0, @"%@.fs", v6);
        CFURLRef v13 = CFURLCreateWithFileSystemPathRelativeToBase(0, v12, kCFURLPOSIXPathStyle, 1u, v11);
        CFBundleRef v14 = CFBundleCreate(0, v13);
        CFRelease(v12);
        CFRelease(v13);
        if (v14) {
          break;
        }
        if (++v10 >= CFArrayGetCount((CFArrayRef)qword_100025280))
        {
          CFBundleRef v14 = 0;
          char v15 = 1;
LABEL_37:
          CFStringRef v7 = v55;
          statfs v8 = byte_100024D78 + 648;
          goto LABEL_63;
        }
      }
      CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(v14);
      CFDictionaryRef v27 = InfoDictionary;
      if (a3)
      {
        CFDictionaryRef ValueForInfoDictionaryKey = (const __CFDictionary *)CFBundleGetValueForInfoDictionaryKey(v14, @"FSPersonalities");
        CFDictionaryRef v29 = (const __CFDictionary *)CFDictionaryGetValue(v27, @"FSPersonalities");
        if (ValueForInfoDictionaryKey) {
          BOOL v30 = v29 == 0;
        }
        else {
          BOOL v30 = 1;
        }
        if (v30)
        {
          char v15 = 0;
          goto LABEL_37;
        }
        CFDictionaryRef v31 = v29;
        statfs v8 = byte_100024D78 + 648;
      }
      else
      {
        CFDictionaryRef ValueForInfoDictionaryKey = (const __CFDictionary *)CFDictionaryGetValue(InfoDictionary, @"FSPersonalities");
        CFDictionaryRef v31 = ValueForInfoDictionaryKey;
        statfs v8 = byte_100024D78 + 648;
        if (!ValueForInfoDictionaryKey)
        {
LABEL_42:
          char v15 = 0;
          CFStringRef v7 = v55;
          goto LABEL_63;
        }
      }
      CFIndex v32 = CFDictionaryGetCount(v31);
      if (v32 >= 1)
      {
        CFIndex v33 = v32;
        uint64_t v61 = 0;
        memset(v60, 0, sizeof(v60));
        uint64_t v59 = 0;
        memset(v58, 0, sizeof(v58));
        if ((unint64_t)v32 < 6)
        {
          CFPropertyListRef v35 = (const void **)v58;
          CFTypeID v34 = (const void **)v60;
        }
        else
        {
          CFTypeID v34 = (const void **)malloc_type_malloc(8 * v32, 0x6004044C4A2DFuLL);
          CFPropertyListRef v35 = (const void **)malloc_type_malloc(8 * v33, 0x6004044C4A2DFuLL);
        }
        CFIndex v54 = v35;
        CFDictionaryGetKeysAndValues(v31, v35, v34);
        CFNumberRef v36 = CFNumberCreate(0, kCFNumberSInt16Type, &v57);
        uint64_t v37 = 0;
        CFNumberRef v56 = 0;
        while (CFDictionaryGetValueIfPresent((CFDictionaryRef)v34[v37], @"FSSubType", (const void **)&v56) != 1
             || CFNumberCompare(v36, v56, 0))
        {
          if (v33 == ++v37)
          {
            CFRelease(v36);
            CFPropertyListRef v38 = v54;
LABEL_49:
            uint64_t v39 = v38[v33 - 1];
            goto LABEL_51;
          }
        }
        uint64_t v39 = v54[v37];
        CFPropertyListRef v38 = v54;
        CFRelease(v36);
        if (!v39) {
          goto LABEL_49;
        }
LABEL_51:
        CFDictionaryRef v40 = (const __CFDictionary *)CFDictionaryGetValue(ValueForInfoDictionaryKey, v39);
        if (!v40) {
          goto LABEL_56;
        }
        CFDictionaryRef v41 = v40;
        CFBooleanRef Value = CFDictionaryGetValue(v40, @"FSName");
        int v42 = CFDictionaryGetValue(v41, @"FSEncryptionName");
        CFStringRef v7 = v55;
        if (!Value || (CFTypeID v43 = v42) == 0)
        {
LABEL_58:
          if (v34 != (const void **)v60) {
            free(v34);
          }
          if (v38 != (const void **)v58) {
            free(v38);
          }
          char v15 = 0;
          statfs v8 = &byte_100024D78[648];
          if (Value) {
            goto LABEL_66;
          }
          goto LABEL_63;
        }
        CFPropertyListRef v44 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (v44)
        {
          size_t v45 = v44;
          CFDictionarySetValue(v44, Value, v43);
          CFBooleanRef Value = v45;
        }
        else
        {
LABEL_56:
          CFBooleanRef Value = 0;
        }
        CFStringRef v7 = v55;
        goto LABEL_58;
      }
      goto LABEL_42;
    }
  }
  return result;
}

CFArrayRef _FSCopyLocalizedNameForVolumeFormatAtURL(const __CFURL *a1)
{
  return sub_1000195C8(a1, 1u);
}

CFArrayRef sub_1000195C8(const __CFURL *a1, unsigned int a2)
{
  if (!a1) {
    return 0;
  }
  if (!CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024)) {
    return 0;
  }
  memset(&v9, 0, 512);
  int v6 = 0;
  if (statfs((const char *)buffer, &v9) || _FSGetTypeInfoFromStatfs((uint64_t)&v9, cStr, 0x10uLL, &v6)) {
    return 0;
  }
  CFArrayRef v5 = (const __CFArray *)CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x600u);
  if (_FSGetLocationFromStatfs((uint64_t)&v9, v9.f_mntfromname, 0x400uLL))
  {
    CFArrayRef v3 = 0;
  }
  else
  {
    unsigned __int8 v7 = 0;
    GetFSEncryptionStatus(v9.f_mntfromname, (char *)&v7, 1, 0);
    CFArrayRef v3 = FSCopyFormatNameForFSType(v5, (__int16)v6, a2, v7);
  }
  CFRelease(v5);
  return v3;
}

CFArrayRef _FSCopyNameForVolumeFormatAtURL(const __CFURL *a1)
{
  return sub_1000195C8(a1, 0);
}

CFArrayRef _FSCopyLocalizedNameForVolumeFormatAtNode(const __CFString *a1)
{
  int v6 = 0;
  if (CFStringGetCString(a1, buffer, 1025, 0x8000100u) != 1) {
    return 0;
  }
  cStr[0] = 0;
  GetFSEncryptionStatus(buffer, cStr, 1, 0);
  int v1 = cStr[0];
  *(void *)cStr = 0;
  __int16 v8 = 0;
  CFArrayRef v2 = 0;
  if (getfstype(buffer, (uint64_t)cStr, &v6))
  {
    BOOL v3 = v1 != 0;
    CFArrayRef v4 = (const __CFArray *)CFStringCreateWithCString(0, cStr, 0x600u);
    CFArrayRef v2 = FSCopyFormatNameForFSType(v4, (__int16)v6, 1u, v3);
    CFRelease(v4);
  }
  return v2;
}

uint64_t getfstype(const char *a1, uint64_t a2, int *a3)
{
  if (is_apfs(a1, a3))
  {
    *(unsigned char *)(a2 + 4) = 0;
    int v6 = 1936093281;
  }
  else if (is_hfs(a1, a3))
  {
    int v6 = 7562856;
  }
  else
  {
    uint64_t result = is_msdos(a1, a3);
    if (!result) {
      return result;
    }
    *(_WORD *)(a2 + 4) = 115;
    int v6 = 1868854125;
  }
  *(_DWORD *)a2 = v6;
  return 1;
}

CFArrayRef _FSCopyNameForVolumeFormatAtNode(const __CFString *a1)
{
  int v6 = 0;
  if (CFStringGetCString(a1, buffer, 1025, 0x8000100u) != 1) {
    return 0;
  }
  cStr[0] = 0;
  GetFSEncryptionStatus(buffer, cStr, 1, 0);
  int v1 = cStr[0];
  *(void *)cStr = 0;
  __int16 v8 = 0;
  CFArrayRef v2 = 0;
  if (getfstype(buffer, (uint64_t)cStr, &v6))
  {
    BOOL v3 = v1 != 0;
    CFArrayRef v4 = (const __CFArray *)CFStringCreateWithCString(0, cStr, 0x600u);
    CFArrayRef v2 = FSCopyFormatNameForFSType(v4, (__int16)v6, 0, v3);
    CFRelease(v4);
  }
  return v2;
}

BOOL is_apfs(const char *a1, _DWORD *a2)
{
  uint64_t v4 = 6;
  if (strncmp(a1, "/dev/r", 6uLL))
  {
    uint64_t v4 = 5;
    if (strncmp(a1, "/dev/", 5uLL)) {
      uint64_t v4 = 0;
    }
  }
  CFDictionaryRef v5 = IOBSDNameMatching(kIOMasterPortDefault, 0, &a1[v4]);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v5);
  if (!MatchingService) {
    return 0;
  }
  io_registry_entry_t v7 = MatchingService;
  BOOLean_t v8 = IOObjectConformsTo(MatchingService, "AppleAPFSVolume");
  BOOL v9 = v8 != 0;
  if (v8)
  {
    if (a2) {
      *a2 = 1;
    }
    CFTypeRef v10 = IORegistryEntrySearchCFProperty(v7, "IOService", @"CaseSensitive", kCFAllocatorDefault, 0);
    if (v10)
    {
      CFURLRef v11 = v10;
      int v12 = CFEqual(v10, kCFBooleanTrue);
      if (a2 && v12) {
        *a2 = 0;
      }
      CFRelease(v11);
    }
  }
  IOObjectRelease(v7);
  return v9;
}

uint64_t is_hfs(const char *a1, int *a2)
{
  *a2 = -1;
  size_t v14 = 0;
  int v3 = open(a1, 4, 0);
  if (v3 >= 1)
  {
    int v4 = v3;
    if (ioctl(v3, 0x40046418uLL, &v14) == -1)
    {
      size_t v5 = 512;
      size_t v14 = 512;
    }
    else
    {
      size_t v5 = v14;
      if (v14 > 0x10000) {
        goto LABEL_11;
      }
    }
    io_registry_entry_t v7 = (unsigned __int16 *)malloc_type_malloc(v5, 0x4068C84FuLL);
    if (!v7)
    {
LABEL_11:
      uint64_t v6 = 0;
      goto LABEL_12;
    }
    BOOLean_t v8 = v7;
    if ((unint64_t)readdisk(v4, 0x400uLL, 0x200uLL, v14, v7) < 0x200) {
      goto LABEL_9;
    }
    unsigned int v10 = *v8;
    if (v10 == 17474)
    {
      if (v8[62] == 11080)
      {
        unint64_t v11 = ((unint64_t)(bswap32(v8[14]) >> 16) << 9)
            + bswap32(*((_DWORD *)v8 + 5)) * (unint64_t)(bswap32(v8[63]) >> 16);
        if ((unint64_t)readdisk(v4, v11 + 1024, 0x200uLL, v14, v8) < 0x200) {
          goto LABEL_9;
        }
        unsigned int v10 = *v8;
      }
      else
      {
        unint64_t v11 = 0;
        unsigned int v10 = 17474;
      }
    }
    else
    {
      unint64_t v11 = 0;
    }
    unsigned int v12 = __rev16(v10);
    if (v12 == 16964)
    {
      int v13 = 128;
      goto LABEL_39;
    }
    if (v12 == 18520)
    {
      if (v8[1] != 1280) {
        goto LABEL_9;
      }
    }
    else if (v12 != 18475 || v8[1] != 1024)
    {
      goto LABEL_9;
    }
    if (*((_DWORD *)v8 + 3) && (v8[3] & 0x20) != 0) {
      *a2 = 1;
    }
    if (v10 != 22600)
    {
LABEL_37:
      if ((*a2 & 0x80000000) == 0)
      {
LABEL_40:
        uint64_t v6 = 1;
        goto LABEL_10;
      }
      int v13 = 0;
LABEL_39:
      *a2 = v13;
      goto LABEL_40;
    }
    if ((unint64_t)readdisk(v4, v11 + bswap32(*((_DWORD *)v8 + 10)) * (unint64_t)bswap32(*((_DWORD *)v8 + 72)), 0x78uLL, v14, v8) >= 0x78)
    {
      if (v8[17] == 1026 && *((unsigned __int8 *)v8 + 51) == 188)
      {
        if (*a2 == 1) {
          int v13 = 3;
        }
        else {
          int v13 = 2;
        }
        goto LABEL_39;
      }
      goto LABEL_37;
    }
LABEL_9:
    uint64_t v6 = 0;
LABEL_10:
    free(v8);
LABEL_12:
    close(v4);
    return v6;
  }
  return 0;
}

uint64_t is_msdos(const char *a1, int *a2)
{
  unint64_t v23 = 0;
  *a2 = -1;
  int v4 = (unsigned __int8 *)malloc_type_malloc(0x800uLL, 0x403E892CuLL);
  if (v4)
  {
    size_t v5 = v4;
    int v6 = open(a1, 4, 0);
    if (v6 >= 1)
    {
      int v7 = v6;
      if (ioctl(v6, 0x40046418uLL, &v23) == -1)
      {
        size_t v8 = 512;
        unint64_t v23 = 512;
      }
      else
      {
        size_t v8 = v23;
        if (v23 > 0x800) {
          goto LABEL_14;
        }
      }
      if ((unint64_t)readdisk(v7, 0, 0x200uLL, v8, v5) >= 0x200)
      {
        int v11 = *v5;
        if (v11 == 233 || v11 == 235 && v5[2] == 144)
        {
          unsigned int v12 = *(unsigned __int16 *)(v5 + 11);
          if (v12 >= 0x200)
          {
            uint64_t v9 = 0;
            if (v12 > 0x800) {
              goto LABEL_15;
            }
            v10.i32[0] = *(unsigned __int16 *)(v5 + 11);
            uint8x8_t v14 = (uint8x8_t)vcnt_s8(v10);
            v14.i16[0] = vaddlv_u8(v14);
            if (v14.i32[0] > 1u) {
              goto LABEL_15;
            }
            unsigned int v15 = v5[13];
            if ((v15 & (v15 - 1)) == 0 && v15 != 0)
            {
              int v17 = *((unsigned __int16 *)v5 + 11);
              if (!*((_WORD *)v5 + 11)) {
                int v17 = *((_DWORD *)v5 + 9);
              }
              int v18 = *(unsigned __int16 *)(v5 + 19);
              unsigned int v19 = (v12 - 1 + 32 * *(unsigned __int16 *)(v5 + 17)) / v12;
              if (!*(_WORD *)(v5 + 19)) {
                int v18 = *((_DWORD *)v5 + 8);
              }
              unsigned int v20 = (v18 - (v19 + *((unsigned __int16 *)v5 + 7) + v17 * v5[16])) / v15;
              uint64_t v9 = 1;
              if (v20 < 0xFFF5) {
                int v21 = 1;
              }
              else {
                int v21 = 2;
              }
              if (v20 >= 0xFF5) {
                int v22 = v21;
              }
              else {
                int v22 = 0;
              }
              *a2 = v22;
              goto LABEL_15;
            }
          }
        }
      }
LABEL_14:
      uint64_t v9 = 0;
LABEL_15:
      free(v5);
      close(v7);
      return v9;
    }
    free(v5);
  }
  return 0;
}

uint64_t readdisk(int a1, unint64_t a2, size_t a3, size_t a4, void *a5)
{
  size_t v10 = a2 / a4;
  size_t v11 = (a3 + a2) / a4 - a2 / a4;
  unsigned int v12 = (char *)malloc_type_malloc((v11 + 1) * a4, 0xC06106EuLL);
  if (v11 == -1)
  {
    uint64_t v13 = 0;
LABEL_10:
    memcpy(a5, &v12[a2 - v10 * a4], a3);
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v13 = 0;
    size_t v15 = v11 + 1;
    while (pread(a1, &v12[v13], a4, (v14 + v10) * a4) == a4 || a4 == -1)
    {
      v13 += a4;
      ++v14;
      if (!--v15) {
        goto LABEL_10;
      }
    }
  }
  free(v12);
  return v13;
}

uint64_t GetFSEncryptionStatus(char *a1, char *a2, char a3, _DWORD *a4)
{
  *(void *)io_registry_entry_t entry = 0;
  if (!a2) {
    return 22;
  }
  uint64_t v8 = sub_10001A1F8(a1, &entry[1]);
  if (!v8)
  {
    if (a4) {
      *a4 = 0;
    }
    if (is_apfs(a1, 0)
      && (CFBooleanRef v9 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(entry[1], @"Encrypted", kCFAllocatorDefault, 0)) != 0)
    {
      CFBooleanRef v10 = v9;
      if (CFBooleanGetValue(v9) == 1)
      {
        size_t v11 = strlen(a1);
        unsigned int v12 = &a1[v11];
        uint64_t v13 = &a1[v11 - 1];
        if (v13 < a1 || (int v14 = *v13, (v14 - 48) > 9))
        {
          int v18 = -1;
        }
        else
        {
          int v15 = 0;
          unint64_t v16 = (unint64_t)&a1[v11 - 2];
          int v17 = 1;
          do
          {
            uint64_t v13 = (char *)v16;
            v15 += (v14 - 48) * v17;
            if (v16 < (unint64_t)a1) {
              break;
            }
            v17 *= 10;
            --v16;
            int v14 = *v13;
          }
          while ((v14 - 48) <= 9);
          int v18 = v15 - 1;
          unsigned int v12 = v13 + 1;
        }
        if (v13 > a1 && *v13 == 115)
        {
          if (*(v12 - 2) == 47) {
            int v20 = -1;
          }
          else {
            int v20 = v18;
          }
        }
        else
        {
          int v20 = -1;
        }
        if (IORegistryEntryGetParentEntry(entry[1], "IOService", entry))
        {
          char v19 = 0;
        }
        else
        {
          if (IOObjectConformsTo(entry[0], "AppleAPFSContainer"))
          {
            if (sub_10001A2C8(entry[0], v20))
            {
              if (a4) {
                *a4 |= 2u;
              }
              char v19 = 1;
            }
            else
            {
              char v19 = a3 ^ 1;
            }
          }
          else
          {
            char v19 = 0;
          }
          IOObjectRelease(entry[0]);
        }
        if (a4)
        {
          CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(entry[1], @"EncryptionRolling", kCFAllocatorDefault, 0);
          if (CFProperty)
          {
            CFBooleanRef v22 = CFProperty;
            if (CFBooleanGetValue(CFProperty) == 1)
            {
              *a4 |= 4u;
              CFRelease(v22);
            }
          }
        }
      }
      else
      {
        char v19 = 0;
      }
      *a2 = v19;
      CFRelease(v10);
    }
    else
    {
      *a2 = 0;
    }
  }
  if (entry[1]) {
    IOObjectRelease(entry[1]);
  }
  return v8;
}

uint64_t sub_10001A1F8(char *__s1, io_service_t *a2)
{
  uint64_t result = 22;
  if (__s1 && a2)
  {
    *a2 = 0;
    if (!strncmp(__s1, "/dev/", 5uLL)) {
      uint64_t v5 = 5;
    }
    else {
      uint64_t v5 = 0;
    }
    int v6 = &__s1[v5];
    if (!strncmp(v6, "rdisk", 5uLL)) {
      int v7 = v6 + 1;
    }
    else {
      int v7 = v6;
    }
    uint64_t v8 = IOBSDNameMatching(kIOMasterPortDefault, 0, v7);
    if (v8)
    {
      CFDictionaryRef v9 = v8;
      CFDictionarySetValue(v8, @"IOProviderClass", @"IOMedia");
      io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v9);
      uint64_t result = 0;
      *a2 = MatchingService;
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t sub_10001A2C8(io_service_t a1, int a2)
{
  kern_return_t v3;
  uint64_t result;
  size_t outputStructCnt;
  __int16 outputStruct;
  int inputStruct;
  io_connect_t connect;

  connect = 0;
  outputStruct = 0;
  outputStructCnt = 2;
  if (IOServiceOpen(a1, mach_task_self_, 0, &connect)) {
    return 1;
  }
  inputStruct = a2;
  int v3 = IOConnectCallStructMethod(connect, 0x13u, &inputStruct, 4uLL, &outputStruct, &outputStructCnt);
  IOServiceClose(connect);
  if (v3) {
    return 1;
  }
  uint64_t result = 0;
  if ((_BYTE)outputStruct)
  {
    if (!HIBYTE(outputStruct)) {
      return 1;
    }
  }
  return result;
}

uint64_t GetDiskImageEncryptionStatus(char *a1, BOOL *a2)
{
  io_registry_entry_t entry = 0;
  uint64_t v2 = 22;
  if (a1 && a2)
  {
    uint64_t v2 = sub_10001A1F8(a1, &entry);
    if (!v2)
    {
      CFBooleanRef v4 = (CFBooleanRef)IORegistryEntrySearchCFProperty(entry, "IOService", @"image-encrypted", kCFAllocatorDefault, 3u);
      if (v4)
      {
        *a2 = v4 == kCFBooleanTrue;
        CFRelease(v4);
      }
      else
      {
        *a2 = 0;
      }
    }
    if (entry) {
      IOObjectRelease(entry);
    }
  }
  return v2;
}

uint64_t _FSGetMediaEncryptionStatusAtPath(char *a1, BOOL *a2, _DWORD *a3)
{
  __int16 v9 = 0;
  uint64_t result = 22;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = GetFSEncryptionStatus(a1, (char *)&v9 + 1, 0, a3);
      if (!result)
      {
        if (a3 || !HIBYTE(v9))
        {
          int DiskImageEncryptionStatus = GetDiskImageEncryptionStatus(a1, (BOOL *)&v9);
          int v7 = v9;
          if (!DiskImageEncryptionStatus && a3)
          {
            if ((_BYTE)v9)
            {
              *a3 |= 1u;
              int v7 = 1;
            }
          }
        }
        else
        {
          int v7 = 0;
        }
        uint64_t result = 0;
        *a2 = (HIBYTE(v9) | v7) != 0;
      }
    }
  }
  return result;
}

uint64_t _FSGetMediaEncryptionStatus(const __CFString *a1, BOOL *a2, _DWORD *a3)
{
  if (CFStringGetCString(a1, buffer, 1025, 0x8000100u)) {
    return _FSGetMediaEncryptionStatusAtPath(buffer, a2, a3);
  }
  else {
    return 22;
  }
}

void sub_10001A554()
{
  __assert_rtn("__DACommandMachChannelHandler", "DACommand.c", 269, "job->kind == __kDACommandMachChannelJobKindExecute");
}

void sub_10001A580()
{
}

void sub_10001A5AC()
{
}

void sub_10001A5D8()
{
}

void sub_10001A604(uint64_t a1, NSObject *a2)
{
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}s", (uint8_t *)&v2, 0xCu);
}

void sub_10001A67C()
{
}

void sub_10001A6A8()
{
  __assert_rtn("DAUserFSOpen", "DAUserFSMount.m", 83, "server != NULL");
}

void sub_10001A6D4()
{
  __assert_rtn("DAUserFSOpen", "DAUserFSMount.m", 84, "xpc_get_type(server) == XPC_TYPE_CONNECTION");
}

void sub_10001A700()
{
}

void sub_10001A72C()
{
}

void sub_10001A758()
{
}

void sub_10001A784()
{
}

void sub_10001A7B0()
{
}

void sub_10001A7DC()
{
}

void sub_10001A808()
{
}

void sub_10001A834()
{
}

void sub_10001A860()
{
}

void sub_10001A88C()
{
}

void sub_10001A8B8()
{
}

void sub_10001A8E4()
{
}

void sub_10001A910()
{
}

void sub_10001A93C()
{
}

void sub_10001A968()
{
  __assert_rtn("DAQueueCallback", "DAQueue.c", 552, "argument1 == NULL");
}

void sub_10001A994()
{
  __assert_rtn("DAQueueCallback", "DAQueue.c", 611, "argument1 == NULL");
}

void sub_10001A9C0()
{
  __assert_rtn("_DAMediaAppearedCallback", "DAServer.c", 1146, "___CFArrayContainsValue( gDADiskList, disk) == FALSE");
}

void sub_10001A9EC()
{
  __assert_rtn("_DAMediaDisappearedCallback", "DAServer.c", 1384, "context == NULL");
}

void sub_10001AA18()
{
}

void sub_10001AA44()
{
}

void sub_10001AA70()
{
  __assert_rtn("DASessionCreate", "DASession.c", 218, "port == MACH_PORT_NULL");
}

void sub_10001AA9C()
{
  __assert_rtn("__DAThreadMachChannelHandler", "DAThread.c", 143, "job->kind == __kDAThreadMachChannelJobKindExecute");
}

void sub_10001AAC8()
{
}

void sub_10001AAF4()
{
  __assert_rtn("__DAThreadFunction", "DAThread.c", 77, "job->kind == __kDAThreadMachChannelJobKindExecute");
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
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

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return _CFArrayCreateCopy(allocator, theArray);
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

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayGetFirstIndexOfValue(theArray, range, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
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

CFDictionaryRef CFBundleCopyInfoDictionaryInDirectory(CFURLRef bundleURL)
{
  return _CFBundleCopyInfoDictionaryInDirectory(bundleURL);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return _CFBundleCopyLocalizedString(bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURLInDirectory(CFURLRef bundleURL, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return _CFBundleCopyResourceURLInDirectory(bundleURL, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return _CFBundleCreate(allocator, bundleURL);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return _CFBundleGetInfoDictionary(bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return _CFBundleGetMainBundle();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return _CFBundleGetValueForInfoDictionaryKey(bundle, key);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFCharacterSetCreateWithCharactersInString(alloc, theString);
}

uint64_t CFCopySearchPathForDirectoriesInDomains()
{
  return _CFCopySearchPathForDirectoriesInDomains();
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

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return _CFDataGetMutableBytePtr(theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return _CFDateCreate(allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  return _CFDateGetAbsoluteTime(theDate);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
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

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return _CFDictionaryGetValueIfPresent(theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return _CFGetAllocator(cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return _CFHash(cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return _CFNumberCompare(number, otherNumber, context);
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

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithData(allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return _CFSetContainsValue(theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return _CFSetGetCount(theSet);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return _CFStringCreateArrayBySeparatingStrings(alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return _CFStringCreateExternalRepresentation(alloc, theString, encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return _CFStringCreateFromExternalRepresentation(alloc, data, encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
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

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return _CFStringCreateWithSubstring(alloc, str, range);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return _CFStringFindCharacterFromSet(theString, theSet, rangeToSearch, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return _CFStringGetCharacterAtIndex(theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return _CFStringHasPrefix(theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return _CFStringHasSuffix(theString, suffix);
}

void CFStringInsert(CFMutableStringRef str, CFIndex idx, CFStringRef insertedStr)
{
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

void CFStringPad(CFMutableStringRef theString, CFStringRef padString, CFIndex length, CFIndex indexIntoPad)
{
}

void CFStringTrim(CFMutableStringRef theString, CFStringRef trimString)
{
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return _CFURLCopyAbsoluteURL(relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return _CFURLCopyFileSystemPath(anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return _CFURLCopyLastPathComponent(url);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return _CFURLCreateCopyDeletingLastPathComponent(allocator, url);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return _CFURLCreateFromFileSystemRepresentation(allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateFromFileSystemRepresentationRelativeToBase(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory, CFURLRef baseURL)
{
  return _CFURLCreateFromFileSystemRepresentationRelativeToBase(allocator, buffer, bufLen, isDirectory, baseURL);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPathRelativeToBase(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory, CFURLRef baseURL)
{
  return _CFURLCreateWithFileSystemPathRelativeToBase(allocator, filePath, pathStyle, isDirectory, baseURL);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return _CFURLCreateWithString(allocator, URLString, baseURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return _CFURLGetFileSystemRepresentation(url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return _CFURLGetString(anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return _CFURLGetTypeID();
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return _CFUUIDCreateFromString(alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

CFUUIDRef CFUUIDCreateWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDCreateWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

CFTypeID CFUUIDGetTypeID(void)
{
  return _CFUUIDGetTypeID();
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.uint64_t byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.uint64_t byte7 = HIBYTE(v1);
  return result;
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return _IOBSDNameMatching(mainPort, options, bsdName);
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

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

BOOLean_t IOObjectIsEqualTo(io_object_t object, io_object_t anObject)
{
  return _IOObjectIsEqualTo(object, anObject);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithDescription(AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, Timeout, TimeoutAction, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return _IORegistryEntryCreateIterator(entry, plane, options, iterator);
}

kern_return_t IORegistryEntryGetLocationInPlane(io_registry_entry_t entry, const io_name_t plane, io_name_t location)
{
  return _IORegistryEntryGetLocationInPlane(entry, plane, location);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return _IORegistryEntryGetName(entry, name);
}

kern_return_t IORegistryEntryGetNameInPlane(io_registry_entry_t entry, const io_name_t plane, io_name_t name)
{
  return _IORegistryEntryGetNameInPlane(entry, plane, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IORegistryEntryGetPath(io_registry_entry_t entry, const io_name_t plane, io_string_t path)
{
  return _IORegistryEntryGetPath(entry, plane, path);
}

BOOLean_t IORegistryEntryInPlane(io_registry_entry_t entry, const io_name_t plane)
{
  return _IORegistryEntryInPlane(entry, plane);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IORegistryIteratorExitEntry(io_iterator_t iterator)
{
  return _IORegistryIteratorExitEntry(iterator);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

kern_return_t IOServiceGetBusyState(io_service_t service, uint32_t *busyState)
{
  return _IOServiceGetBusyState(service, busyState);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceMatchPropertyTable(io_service_t service, CFDictionaryRef matching, BOOLean_t *matches)
{
  return _IOServiceMatchPropertyTable(service, matching, matches);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return _SCPreferencesCreate(allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return _SCPreferencesGetValue(prefs, key);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleSetStringsFilesShared()
{
  return __CFBundleSetStringsFilesShared();
}

uint64_t _CFRuntimeCreateInstance()
{
  return __CFRuntimeCreateInstance();
}

uint64_t _CFRuntimeRegisterClass()
{
  return __CFRuntimeRegisterClass();
}

char ***_NSGetEnviron(void)
{
  return __NSGetEnviron();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __CFBinaryPlistWriteToStream()
{
  return ___CFBinaryPlistWriteToStream();
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

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return ___tolower(a1);
}

void _exit(int a1)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_nospin_lock_lock()
{
  return __os_nospin_lock_lock();
}

uint64_t _os_nospin_lock_unlock()
{
  return __os_nospin_lock_unlock();
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

gid_t audit_token_to_egid(audit_token_t *atoken)
{
  return _audit_token_to_egid(atoken);
}

uid_t audit_token_to_euid(audit_token_t *atoken)
{
  return _audit_token_to_euid(atoken);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return _audit_token_to_pid(atoken);
}

char *__cdecl basename(char *a1)
{
  return _basename(a1);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_check_in(bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

void closelog(void)
{
}

uint64_t csops()
{
  return _csops();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

uint64_t dispatch_mach_cancel()
{
  return _dispatch_mach_cancel();
}

uint64_t dispatch_mach_connect()
{
  return _dispatch_mach_connect();
}

uint64_t dispatch_mach_create_f()
{
  return _dispatch_mach_create_f();
}

uint64_t dispatch_mach_mig_demux()
{
  return _dispatch_mach_mig_demux();
}

uint64_t dispatch_mach_msg_create()
{
  return _dispatch_mach_msg_create();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return _dispatch_mach_msg_get_msg();
}

uint64_t dispatch_mach_send()
{
  return _dispatch_mach_send();
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

uint64_t dispatch_set_qos_class_fallback()
{
  return _dispatch_set_qos_class_fallback();
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return _dispatch_source_get_data(source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return _dispatch_workloop_create_inactive(label);
}

int dup(int a1)
{
  return _dup(a1);
}

int dup2(int a1, int a2)
{
  return _dup2(a1, a2);
}

int execle(const char *__path, const char *__arg0, ...)
{
  return _execle(__path, __arg0);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return _fgets(a1, a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

pid_t fork(void)
{
  return _fork();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return _fstatat(a1, a2, a3, a4);
}

int fstatfs(int a1, statfs *a2)
{
  return _fstatfs(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

uid_t geteuid(void)
{
  return _geteuid();
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return _getfsstat(a1, a2, a3);
}

int getmntinfo(statfs **a1, int a2)
{
  return _getmntinfo(a1, a2);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

pid_t getpid(void)
{
  return _getpid();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return _getpwuid(a1);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

int link(const char *a1, const char *a2)
{
  return _link(a1, a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return _localtime(a1);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return _mach_port_allocate(task, right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return _mach_port_insert_right(task, name, poly, polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return _mach_port_request_notification(task, name, msgid, sync, notify, notifyPoly, previous);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return _mach_port_set_attributes(task, name, flavor, port_info, port_infoCnt);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
}

char *__cdecl mkdtemp(char *a1)
{
  return _mkdtemp(a1);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

void openlog(const char *a1, int a2, int a3)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_factory_content()
{
  return _os_variant_has_factory_content();
}

uint64_t os_variant_is_darwinos()
{
  return _os_variant_is_darwinos();
}

int pipe(int a1[2])
{
  return _pipe(a1);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawn(a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addinherit_np(posix_spawn_file_actions_t *a1, int a2)
{
  return _posix_spawn_file_actions_addinherit_np(a1, a2);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_destroy(a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_init(a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return _posix_spawnattr_destroy(a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return _posix_spawnattr_init(a1);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return _posix_spawnattr_setflags(a1, a2);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

int proc_listpidspath(uint32_t type, uint32_t typeinfo, const char *path, uint32_t pathflags, void *buffer, int buffersize)
{
  return _proc_listpidspath(type, typeinfo, path, pathflags, buffer, buffersize);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_detach(pthread_t a1)
{
  return _pthread_detach(a1);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return _pthread_equal(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

void rewind(FILE *a1)
{
}

int rmdir(const char *a1)
{
  return _rmdir(a1);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _setattrlist(a1, a2, a3, a4, a5);
}

int setgid(gid_t a1)
{
  return _setgid(a1);
}

int setuid(uid_t a1)
{
  return _setuid(a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
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

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return _strlcat(__dst, __source, __size);
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

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return _strsep(__stringp, __delim);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int unmount(const char *a1, int a2)
{
  return _unmount(a1, a2);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_dup_fd(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return [a1 containerID];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_devicePath(void *a1, const char *a2, ...)
{
  return [a1 devicePath];
}

id objc_msgSend_exitError(void *a1, const char *a2, ...)
{
  return [a1 exitError];
}

id objc_msgSend_getConnection(void *a1, const char *a2, ...)
{
  return [a1 getConnection];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}