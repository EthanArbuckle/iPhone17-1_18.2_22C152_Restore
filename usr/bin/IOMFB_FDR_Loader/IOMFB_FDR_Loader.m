uint64_t sub_100002E24(io_registry_entry_t a1, const __CFString *a2, uint64_t a3)
{
  CFNumberRef CFProperty;
  CFNumberRef v5;
  uint64_t valuePtr;

  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    v5 = CFProperty;
    valuePtr = a3;
    CFNumberGetValue(CFProperty, kCFNumberLongType, &valuePtr);
    CFRelease(v5);
    return valuePtr;
  }
  return a3;
}

BOOL sub_100002E8C(io_registry_entry_t a1, const __CFString *a2)
{
  CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (!CFProperty) {
    return 0;
  }
  CFBooleanRef v3 = CFProperty;
  BOOL v4 = CFBooleanGetValue(CFProperty) != 0;
  CFRelease(v3);
  return v4;
}

BOOL sub_100002EE4(io_registry_entry_t a1, const __CFString *a2)
{
  CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    char CStringPtr = CFStringGetCStringPtr(a2, 0x600u);
    sub_100002F5C("can't read property '%s'", v8, v9, v10, v11, v12, v13, v14, CStringPtr);
  }
  CFBooleanRef v4 = CFProperty;
  BOOL v5 = CFBooleanGetValue(CFProperty) != 0;
  CFRelease(v4);
  return v5;
}

void sub_100002F5C(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  fwrite("error: ", 7uLL, 1uLL, __stderrp);
  vfprintf(__stderrp, a1, &a9);
  uint64_t v10 = fputc(10, __stderrp);
  if (!byte_100034018) {
    sub_1000084AC(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  exit(1);
}

CFTypeRef sub_100002FD0(io_registry_entry_t a1, const __CFString *a2)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    char CStringPtr = CFStringGetCStringPtr(a2, 0x600u);
    sub_100003034("can't read property '%s'", v5, v6, v7, v8, v9, v10, v11, CStringPtr);
  }
  return CFProperty;
}

uint64_t sub_100003034(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return fputc(10, __stderrp);
}

BOOL sub_1000030A0(io_registry_entry_t a1, const __CFString *a2, int a3)
{
  CFBooleanRef v3 = (CFTypeRef *)&kCFBooleanTrue;
  if (!a3) {
    CFBooleanRef v3 = (CFTypeRef *)&kCFBooleanFalse;
  }
  return IORegistryEntrySetCFProperty(a1, a2, *v3) == 0;
}

__int16 *sub_1000030DC()
{
  return &word_10004F918;
}

void *sub_1000030E8()
{
  return &unk_10004F870;
}

void *sub_1000030F4()
{
  if (dword_10004FA18 == 1) {
    return &unk_10004F9BC;
  }
  else {
    return &unk_10004FA00;
  }
}

void *sub_100003110()
{
  return &unk_10004F8C0;
}

void *sub_10000311C()
{
  if (dword_10004FA18 == 1) {
    return &unk_10004F9BE;
  }
  else {
    return &unk_10004FA02;
  }
}

int *sub_100003138()
{
  return &dword_10004F910;
}

int *sub_100003144()
{
  return &dword_10004F914;
}

uint64_t sub_100003150(uint64_t result)
{
  v1 = &unk_10004F9C8;
  if (dword_10004FA18 != 1) {
    v1 = &unk_10004FA10;
  }
  void *v1 = result;
  return result;
}

uint64_t sub_100003170(uint64_t result)
{
  v1 = &dword_10004F9C0;
  if (dword_10004FA18 != 1) {
    v1 = (int *)&unk_10004FA08;
  }
  *(void *)v1 = result;
  return result;
}

uint64_t sub_100003190@<X0>(const std::string *a1@<X0>, unsigned __int8 a2@<W1>, uint64_t *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v30 = v5;
  long long v31 = v5;
  long long v28 = v5;
  long long v29 = v5;
  long long v26 = v5;
  long long v27 = v5;
  long long v24 = v5;
  long long v25 = v5;
  long long v22 = v5;
  long long v23 = v5;
  *(_OWORD *)v20 = v5;
  long long v21 = v5;
  long long v18 = v5;
  long long v19 = v5;
  long long v16 = v5;
  long long v17 = v5;
  long long v15 = v5;
  sub_100003420((void (__cdecl ***)(std::basic_stringstream<char> *__hidden))&v15, a1, 24);
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v14 = 0;
  while (1)
  {
    uint64_t v6 = sub_1000036E4(&v15, (uint64_t)__p, a2);
    if ((*((unsigned char *)v6 + *(void *)(*v6 - 24) + 32) & 5) != 0) {
      break;
    }
    if (v14 >= 0) {
      uint64_t v7 = (void *)HIBYTE(v14);
    }
    else {
      uint64_t v7 = __p[1];
    }
    if (v7)
    {
      unint64_t v8 = a3[1];
      if (v8 >= a3[2])
      {
        uint64_t v10 = sub_1000099D0(a3, (long long *)__p);
      }
      else
      {
        if (v14 < 0)
        {
          sub_100009AFC((unsigned char *)a3[1], __p[0], (unint64_t)__p[1]);
        }
        else
        {
          long long v9 = *(_OWORD *)__p;
          *(void *)(v8 + 16) = v14;
          *(_OWORD *)unint64_t v8 = v9;
        }
        uint64_t v10 = v8 + 24;
        a3[1] = v8 + 24;
      }
      a3[1] = v10;
    }
  }
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  *(void *)((char *)&v15
  *(void *)&long long v16 = v11;
  if (SHIBYTE(v21) < 0) {
    operator delete(v20[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return std::ios::~ios();
}

void sub_1000033DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16)
{
}

void (__cdecl ***sub_100003420(void (__cdecl ***a1)(std::basic_stringstream<char> *__hidden this), const std::string *a2, int a3))(std::basic_stringstream<char> *__hidden this)
{
  uint64_t v6 = a1 + 2;
  uint64_t v7 = (uint64_t)(a1 + 3);
  *a1 = v9;
  *(void *)((char *)*(v9 - 3) + (void)a1) = v8;
  a1[1] = 0;
  uint64_t v10 = (std::ios_base *)((char *)*(*a1 - 3) + (void)a1);
  std::ios_base::init(v10, a1 + 3);
  v10[1].__vftable = 0;
  v10[1].__fmtflags_ = -1;
  a1[2] = v12;
  *(void *)((char *)*(v12 - 3) + (void)v6) = v11;
  *a1 = v13;
  sub_10000981C(v7, a2, a3);
  return a1;
}

void sub_1000036BC(_Unwind_Exception *a1)
{
}

void *sub_1000036E4(void *a1, uint64_t a2, unsigned __int8 a3)
{
  std::istream::sentry::sentry();
  if (*(char *)(a2 + 23) < 0)
  {
    **(unsigned char **)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 23) = 0;
  }
  uint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = *(void **)((char *)a1 + *(void *)(*a1 - 24) + 40);
    unint64_t v8 = (unsigned char *)v7[3];
    if (v8 != (unsigned char *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(void *))(*v7 + 80))(v7);
    if (v7 == -1) {
      break;
    }
LABEL_9:
    if (v7 == a3)
    {
      int v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(void *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      int v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6) {
    int v9 = 2;
  }
  else {
    int v9 = 6;
  }
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_10000384C(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v2 = *v1;
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v1 + *(void *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x10000380CLL);
  }
  __cxa_rethrow();
}

void sub_1000038C8(_Unwind_Exception *a1)
{
}

uint64_t sub_1000038DC(uint64_t a1)
{
  *(void *)(a1 + 16) = v3;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  std::ios::~ios();
  return a1;
}

void start()
{
  unsigned int v0 = __chkstk_darwin();
  uint64_t v2 = v1;
  unsigned int v3 = v0;
  xpc_set_event_stream_handler("com.apple.iokit.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100030430);
  if ((int)v3 <= 1) {
    sub_100008610(*v2);
  }
  v96 = *v2;
  bzero(&qword_100034000, 0x1BAE0uLL);
  bzero(qword_10004FAE0, 0x68uLL);
  byte_10004FB38 = byte_10004FB38 & 0xF0 | 3;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v101 = v4;
  long long v102 = v4;
  *(_OWORD *)__b = v4;
  __n[0] = 128;
  bzero(byte_10004FB48, 0x80uLL);
  if (sysctlbyname("hw.targettype", byte_10004FB48, __n, 0, 0)) {
    sub_100002F5C("Could not determine device type", v5, v6, v7, v8, v9, v10, v11, v95);
  }
  uint64_t v12 = &qword_100030468;
  size_t v13 = __n[0];
  uint64_t v14 = 98;
  while (strncmp(byte_10004FB48, (const char *)*(v12 - 3), v13))
  {
    v12 += 8;
    if (!--v14)
    {
      sub_100003034("Device %s unknown", v15, v16, v17, v18, v19, v20, v21, (char)byte_10004FB48);
      unsigned int v22 = 0;
      goto LABEL_14;
    }
  }
  unsigned int v22 = *((_DWORD *)v12 - 4);
  if (v22 <= 1) {
    uint64_t v23 = 1;
  }
  else {
    uint64_t v23 = v22;
  }
  long long v24 = &__b[1];
  do
  {
    *(v24 - 1) = *(v12 - 1);
    size_t v25 = *v12;
    v12 += 2;
    *long long v24 = v25;
    v24 += 2;
    --v23;
  }
  while (v23);
LABEL_14:
  int v26 = 0;
  int v27 = 0;
  LODWORD(qword_10004FAEC) = 0;
  qword_10004FB40 = 0;
  unsigned int v98 = v22;
  *(void *)algn_10004FB28 = 0;
  *(void *)&dword_10004FB20 = 0;
  uint64_t v97 = v22;
  long long v28 = v2;
  while (1)
  {
    long long v30 = v28[1];
    ++v28;
    long long v29 = v30;
    if (!strncmp(v30, "-i", 3uLL))
    {
      int v31 = v3 - 2;
      if (v3 <= 2) {
        sub_100008610(v96);
      }
      unint64_t v32 = malloc_type_malloc(0x18uLL, 0xF00400FAC18B6uLL);
      if (!v32) {
        sub_100002F5C("could not create custom file list", v33, v34, v35, v36, v37, v38, v39, v95);
      }
      v41 = v2[2];
      v40 = v2 + 2;
      *unint64_t v32 = v41;
      uint64_t v42 = qword_10004FB40;
      v32[1] = qword_10004FB40;
      if (v42) {
        *(void *)(v42 + 16) = v32 + 1;
      }
      qword_10004FB40 = (uint64_t)v32;
      v32[2] = &qword_10004FB40;
      uint64_t v43 = qword_10004FAEC;
      int v26 = qword_10004FAEC + 1;
      LODWORD(qword_10004FAEC) = qword_10004FAEC + 1;
      v44 = &qword_10004FAE0[2 * v43];
      v44[2] = 0x100000001;
      v44[3] = 0;
      ++v27;
      goto LABEL_33;
    }
    int v31 = v3 - 1;
    if (!strncmp(v29, "-n", 3uLL))
    {
      char v45 = byte_10004FB38 & 0xFE;
LABEL_36:
      byte_10004FB38 = v45;
      goto LABEL_49;
    }
    if (!strncmp(v29, "-C", 3uLL))
    {
      char v45 = byte_10004FB38 & 0xFD;
      goto LABEL_36;
    }
    if (!strncmp(v29, "-F", 3uLL))
    {
      if (v26) {
        sub_100008610(v96);
      }
      qword_10004FAEC = 0x200000001;
      v46 = (uint64_t *)&__b[1];
      uint64_t v47 = v97;
      if (!v98) {
        goto LABEL_46;
      }
      while (*((_DWORD *)v46 - 2) != 2)
      {
        v46 += 2;
        if (!--v47) {
          goto LABEL_46;
        }
      }
LABEL_47:
      dword_10004FAF4 = *((_DWORD *)v46 - 1);
      qword_10004FAF8 = *v46;
LABEL_48:
      ++v27;
      int v26 = 1;
      goto LABEL_49;
    }
    if (!strncmp(v29, "--fs", 5uLL))
    {
      if (v26) {
        sub_100008610(v96);
      }
      qword_10004FAEC = 0x300000001;
      v46 = (uint64_t *)&__b[1];
      uint64_t v48 = v97;
      if (v98)
      {
        while (*((_DWORD *)v46 - 2) != 3)
        {
          v46 += 2;
          if (!--v48) {
            goto LABEL_46;
          }
        }
        goto LABEL_47;
      }
LABEL_46:
      dword_10004FAF4 = 0;
      goto LABEL_48;
    }
    if (!strncmp(v29, "--launchd_boot", 0x10uLL))
    {
      if (v26) {
        sub_100008610(v96);
      }
      byte_10004FB38 |= 4u;
      *(_OWORD *)((char *)&qword_10004FAEC + 4) = *(_OWORD *)__b;
      unk_10004FB00 = v101;
      unk_10004FB10 = v102;
      int v26 = v98;
      LODWORD(qword_10004FAEC) = v98;
      ++v27;
    }
    else
    {
      if (!strncmp(v29, "--pdc_ffr_low", 0x10uLL))
      {
        int v31 = v3 - 2;
        if (v3 <= 2) {
          sub_100008610(v96);
        }
        v49 = v2[2];
        v40 = v2 + 2;
        float v57 = atof(v49);
        if (v57 <= 0.0) {
          sub_100002F5C("pdc bin must be positive.", v50, v51, v52, v53, v54, v55, v56, v95);
        }
        *(float *)&qword_100034908 = v57;
        goto LABEL_33;
      }
      if (!strncmp(v29, "--pdc_ffr_high", 0x10uLL))
      {
        int v31 = v3 - 2;
        if (v3 <= 2) {
          sub_100008610(v96);
        }
        v58 = v2[2];
        v40 = v2 + 2;
        float v66 = atof(v58);
        if (v66 <= 0.0) {
          sub_100002F5C("pdc bin must be positive.", v59, v60, v61, v62, v63, v64, v65, v95);
        }
        *((float *)&qword_100034908 + 1) = v66;
        goto LABEL_33;
      }
      if (!strncmp(v29, "--latleak_bin", 0x10uLL))
      {
        int v31 = v3 - 2;
        if (v3 <= 2) {
          sub_100008610(v96);
        }
        v67 = v2[2];
        v40 = v2 + 2;
        float v75 = atof(v67);
        if (v75 <= 0.0) {
          sub_100002F5C("lateral leakage bin must be positive.", v68, v69, v70, v71, v72, v73, v74, v95);
        }
        dword_10004FAC8 = ((float)(v75 * 65536.0) + 0.5);
        goto LABEL_33;
      }
      if (!strncmp(v29, "--prox_bin_pbds", 0x10uLL))
      {
        int v31 = v3 - 2;
        if (v3 <= 2) {
          sub_100008610(v96);
        }
        v76 = v2[2];
        v40 = v2 + 2;
        *(float *)&int v77 = atof(v76);
        dword_10004FAD0 = v77;
        byte_10004FAD8 = 1;
        goto LABEL_33;
      }
      if (!strncmp(v29, "--prox_bin_pbdd", 0x10uLL))
      {
        int v31 = v3 - 2;
        if (v3 <= 2) {
          sub_100008610(v96);
        }
        v78 = v2[2];
        v40 = v2 + 2;
        *(float *)&int v79 = atof(v78);
        dword_10004FAD4 = v79;
        byte_10004FAD9 = 1;
LABEL_33:
        long long v28 = v40;
        goto LABEL_49;
      }
      if (strncmp(v29, "-v", 2uLL)) {
        sub_100008610(v96);
      }
      byte_100034019 = 1;
    }
LABEL_49:
    unsigned int v3 = v31;
    uint64_t v2 = v28;
    if (v31 <= 1)
    {
      if (v27 <= 0) {
        sub_100008610(v96);
      }
      int MainDisplay = IOMobileFramebufferGetMainDisplay();
      if (!MainDisplay && qword_10004FAE0[0])
      {
        dword_10004FAE8 = IOMobileFramebufferGetServiceObject();
        if (!dword_10004FAE8) {
          sub_100002F5C("Failed to get IOMFB service", v88, v89, v90, v91, v92, v93, v94, v95);
        }
        operator new();
      }
      sub_100002F5C("Failed to connect to IOMFB: 0x%x", v81, v82, v83, v84, v85, v86, v87, MainDisplay);
    }
  }
}

void sub_100005DB0()
{
}

void sub_100005DDC(id a1, void *a2)
{
  char string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  sub_100005E1C("IOMFB_FDR_Loader: handling event %s\n", v3, v4, v5, v6, v7, v8, v9, string);
}

uint64_t sub_100005E1C(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return fputc(10, __stderrp);
}

uint64_t sub_100005E88(io_registry_entry_t a1, int a2)
{
  char v2 = a2;
  uint64_t v4 = (CFTypeRef *)&kCFBooleanTrue;
  if (!a2) {
    uint64_t v4 = (CFTypeRef *)&kCFBooleanFalse;
  }
  uint64_t result = IORegistryEntrySetCFProperty(a1, @"NormalModeEnable", *v4);
  if ((v2 & 1) == 0 && result)
  {
    uint64_t result = sub_100002EE4(a1, @"NormalModeActive");
    if (result) {
      sub_100002F5C("could not switch out of normal mode", v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  return result;
}

uint64_t sub_100005EFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  kern_return_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  const char *v32;
  __CFDictionary *Mutable;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __CFDictionary *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  CFStringRef v59;
  const void *v60;
  CFStringRef v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const void *v81;
  CFStringRef v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  kern_return_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  long long *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  long long *v108;
  kern_return_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  CFDictionaryRef v124;
  CFStringRef v125;
  CFArrayRef v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  CFDataRef Value;
  CFDataRef v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  const void *v170;
  uint64_t v171;
  const void *v172;
  CFStringRef v173;
  char v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  const char *v190;
  const char *v191;
  const char *v192;
  const UInt8 *BytePtr;
  CFIndex Length;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  long long v202;
  uint64_t v203;
  size_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  long long v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t i;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  const char *v236;
  CFArrayRef v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  CFDataRef v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  const UInt8 *v253;
  CFIndex v254;
  const void *v255;
  int v256;
  int v257;
  unsigned int v258;
  unsigned int v259;
  unsigned int v260;
  int v261;
  int v262;
  int v263;
  uint64_t v264;
  unint64_t v265;
  FILE *v266;
  int v267;
  unsigned int v268;
  unsigned int v269;
  int v270;
  void *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  void *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  unsigned int v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  void *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  unint64_t v328;
  unsigned int v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  unint64_t v338;
  unsigned int v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  int v348;
  void *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  unsigned int v365;
  void *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  unint64_t v374;
  unsigned int v375;
  void *v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  unint64_t v384;
  unint64_t v385;
  uint64_t v386;
  unsigned int v387;
  _DWORD *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t j;
  uint64_t k;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  unint64_t v414;
  _WORD *v415;
  uint64_t v416;
  int64x2_t v417;
  _WORD *v418;
  int64x2_t v419;
  int64x2_t v420;
  int8x16_t v421;
  int8x16_t v422;
  uint32x2_t v423;
  int32x2_t v424;
  uint64_t v425;
  __int32 m;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t jj;
  float v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  unsigned int v441;
  FILE *v442;
  int v443;
  unsigned int v444;
  unsigned int v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  int v453;
  BOOL v454;
  unsigned int v455;
  FILE *v456;
  int v457;
  int v458;
  int v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  unint64_t v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  signed int v475;
  char *v476;
  unint64_t v477;
  unsigned int v478;
  FILE *v479;
  int v480;
  int v481;
  unsigned int v482;
  void *v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  unint64_t v491;
  unsigned int v492;
  void *v493;
  unint64_t v494;
  unint64_t v495;
  uint64_t v496;
  __int32 v497;
  int v498;
  int v499;
  int v500;
  int v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  uint64_t v517;
  int *v518;
  __int32 *v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  __int32 *v525;
  uint64_t v526;
  unint64_t v527;
  _WORD *v528;
  uint64_t v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  _WORD *v535;
  uint64_t v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  uint64_t v542;
  uint64_t v543;
  __int16 v544;
  __int16 v545;
  uint64_t v546;
  _WORD *v547;
  uint64_t v548;
  float v549;
  uint64_t v550;
  float v551;
  uint64_t v552;
  uint64_t v553;
  unint64_t v554;
  uint64_t v555;
  uint64_t v556;
  unint64_t v557;
  uint64_t v558;
  __int16 v559;
  float v560;
  int v561;
  int v562;
  uint64_t v563;
  uint64_t v564;
  uint64_t v565;
  uint64_t v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  uint64_t v570;
  uint64_t v571;
  uint64_t v572;
  uint64_t v573;
  uint64_t v574;
  uint64_t v575;
  uint64_t v576;
  uint64_t v577;
  uint64_t v578;
  uint64_t v579;
  _DWORD *v580;
  int v581;
  uint64_t v582;
  uint64_t v583;
  uint64_t v584;
  uint64_t v585;
  uint64_t v586;
  uint64_t v587;
  uint64_t v588;
  int v589;
  uint64_t n;
  uint64_t v591;
  uint64_t v592;
  uint64_t v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;
  int v598;
  int v599;
  uint64_t v600;
  char v601;
  int v602;
  uint64_t v603;
  uint64_t v604;
  uint64_t v605;
  uint64_t v606;
  uint64_t v607;
  uint64_t v608;
  uint64_t v609;
  uint64_t ii;
  uint64_t v611;
  uint64_t v612;
  uint64_t v613;
  uint64_t v614;
  uint64_t v615;
  uint64_t v616;
  uint64_t v617;
  int v618;
  int v619;
  uint64_t v620;
  char v621;
  int v622;
  uint64_t v623;
  uint64_t v624;
  uint64_t v625;
  uint64_t v626;
  uint64_t v627;
  uint64_t v628;
  uint64_t v629;
  int v630;
  uint64_t v631;
  uint64_t v632;
  uint64_t v633;
  uint64_t v634;
  uint64_t v635;
  uint64_t v636;
  uint64_t v637;
  uint64_t v638;
  uint64_t v639;
  uint64_t v640;
  uint64_t v641;
  uint64_t v642;
  uint64_t v644;
  uint64_t v645;
  uint64_t v646;
  uint64_t v647;
  uint64_t v648;
  uint64_t v649;
  uint64_t v650;
  uint64_t v651;
  uint64_t v652;
  uint64_t v653;
  uint64_t v654;
  uint64_t v655;
  uint64_t v656;
  uint64_t v657;
  const char *outputStruct;
  char outputStructa;
  char outputStructb;
  char outputStructd;
  char outputStructc;
  int v663;
  int v664;
  int v665;
  const void *v666;
  CFTypeRef cf;
  unint64_t cfa;
  unint64_t v669;
  int v670;
  uint32_t outputCnt;
  uint64_t output;
  long long v673;
  long long v674;
  int v675;
  io_connect_t connect;
  CC_MD5_CTX v677;
  uint64_t input[4];
  _DWORD md[4];

  v669 = 0xAAAAAAAAAAAAAAAALL;
  v670 = -1431655766;
  if (dword_10004FB20 == 2)
  {
    int v31 = dword_10004FB24;
    unint64_t v32 = *(const char **)algn_10004FB28;
    *(void *)&v677.A = 0;
    sub_100005E1C("fetching signed bundle from FDR", a2, a3, a4, a5, a6, a7, a8, (char)outputStruct);
    AMFDRLogSetHandler();
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v41 = Mutable;
    if (!Mutable)
    {
      uint64_t v62 = "CFDictionaryCreateMutable failed";
LABEL_41:
      sub_100003034(v62, v34, v35, v36, v37, v38, v39, v40, (char)outputStruct);
      uint64_t v61 = 0;
      uint64_t v59 = 0;
      uint64_t v60 = 0;
      cf = 0;
      v666 = 0;
      uint64_t v50 = 0;
      goto LABEL_42;
    }
    CFDictionarySetValue(Mutable, @"CopyAllowUnsealed", kCFBooleanTrue);
    switch(v31)
    {
      case 1:
        uint64_t v60 = (const void *)AMFDRSealingMapCopyInstanceForClass();
        if (v60)
        {
          uint64_t v61 = 0;
          cf = 0;
          v666 = 0;
          uint64_t v50 = 0;
          uint64_t v59 = @"ADCL";
          goto LABEL_53;
        }
        sub_100003034("AMFDRCreateInstanceString failed", v138, v139, v140, v141, v142, v143, v144, (char)outputStruct);
        uint64_t v11 = 0;
        v174 = 0;
        v126 = 0;
        v124 = 0;
        v125 = 0;
        uint64_t v59 = @"ADCL";
        goto LABEL_126;
      case 2:
      case 4:
        uint64_t v42 = MGCopyAnswer();
        if (!v42)
        {
          sub_100003034("Failed to get DIC id", v43, v44, v45, v46, v47, v48, v49, (char)outputStruct);
          uint64_t v11 = 0;
          v174 = 0;
          v126 = 0;
          uint64_t v60 = 0;
          v124 = 0;
          v125 = 0;
          uint64_t v59 = @"SDCl";
          goto LABEL_126;
        }
        uint64_t v50 = (const void *)v42;
        uint64_t v51 = AMFDRCreateInstanceString();
        uint64_t v59 = @"SDCl";
        if (v51)
        {
          uint64_t v60 = (const void *)v51;
          uint64_t v61 = 0;
          cf = 0;
          v666 = 0;
          goto LABEL_53;
        }
        v190 = "AMFDRCreateInstanceString failed";
        goto LABEL_87;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_40;
      case 8:
        v127 = MGGetStringAnswer();
        cf = (CFTypeRef)v127;
        if (v127)
        {
          v135 = v127;
          v136 = MGGetStringAnswer();
          if (v136)
          {
            v666 = (const void *)v136;
            LOBYTE(outputStruct) = v135;
            uint64_t v61 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@-%@");
            if (v61)
            {
              v137 = AMFDRCreateInstanceString();
              if (v137)
              {
                uint64_t v60 = (const void *)v137;
                uint64_t v50 = 0;
                uint64_t v59 = @"AlsH";
                goto LABEL_53;
              }
              v191 = "AMFDRCreateInstanceString failed";
            }
            else
            {
              v191 = "Failed to create acss_id";
            }
          }
          else
          {
            v666 = 0;
            uint64_t v61 = 0;
            v191 = "Failed to get als_id";
          }
        }
        else
        {
          v666 = 0;
          uint64_t v61 = 0;
          v191 = "Failed to get panel_id";
        }
        sub_100003034(v191, v128, v129, v130, v131, v132, v133, v134, (char)outputStruct);
        v125 = 0;
        v124 = 0;
        uint64_t v50 = 0;
        uint64_t v60 = 0;
        uint64_t v59 = @"AlsH";
        goto LABEL_110;
      default:
        if (v31 == 16)
        {
          v161 = MGCopyAnswer();
          if (v161)
          {
            uint64_t v50 = (const void *)v161;
            v169 = AMFDRCreateInstanceString();
            if (v169)
            {
              v170 = (const void *)v169;
              v171 = MGGetStringAnswer();
              cf = v170;
              if (v171)
              {
                v172 = (const void *)v171;
                LOBYTE(outputStruct) = (_BYTE)v170;
                v173 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@-%@");
                v666 = v172;
                if (v173)
                {
                  uint64_t v61 = v173;
                  uint64_t v60 = (const void *)AMFDRCreateInstanceString();
                  uint64_t v59 = @"AlHW";
                  if (!v60)
                  {
LABEL_63:
                    sub_100003034("AMFDRCreateInstanceString failed", v83, v84, v85, v86, v87, v88, v89, (char)outputStruct);
                    uint64_t v11 = 0;
                    v174 = 0;
                    v126 = 0;
                    uint64_t v60 = 0;
                    v124 = 0;
                    v125 = 0;
                    goto LABEL_118;
                  }
                  goto LABEL_53;
                }
                uint64_t v59 = @"AlHW";
                goto LABEL_461;
              }
              v666 = 0;
              uint64_t v59 = @"AlHW";
LABEL_107:
              v236 = "Failed to get als_id";
LABEL_462:
              sub_100003034(v236, v74, v75, v76, v77, v78, v79, v80, (char)outputStruct);
              v125 = 0;
              v124 = 0;
              uint64_t v60 = 0;
              v126 = 0;
              v174 = 0;
              uint64_t v11 = 0;
              v255 = cf;
LABEL_120:
              CFRelease(v255);
LABEL_121:
              if (v666) {
                CFRelease(v666);
              }
              if (!v50)
              {
LABEL_125:
                if (!v41) {
                  goto LABEL_127;
                }
                goto LABEL_126;
              }
LABEL_124:
              CFRelease(v50);
              goto LABEL_125;
            }
            uint64_t v59 = @"AlHW";
LABEL_86:
            v190 = "AMFDRCreateInstanceString for DIC id failed";
LABEL_87:
            sub_100003034(v190, v52, v53, v54, v55, v56, v57, v58, (char)outputStruct);
            v125 = 0;
            v124 = 0;
            uint64_t v60 = 0;
            v126 = 0;
            v174 = 0;
            uint64_t v11 = 0;
            goto LABEL_124;
          }
          sub_100003034("Failed to get DIC id", v162, v163, v164, v165, v166, v167, v168, (char)outputStruct);
          uint64_t v11 = 0;
          v174 = 0;
          v126 = 0;
          uint64_t v60 = 0;
          v124 = 0;
          v125 = 0;
          uint64_t v59 = @"AlHW";
        }
        else
        {
          if (v31 != 64)
          {
LABEL_40:
            uint64_t v62 = "Bad DisplayKey type - ADCL and SDCl supported";
            goto LABEL_41;
          }
          uint64_t v63 = MGCopyAnswer();
          if (v63)
          {
            uint64_t v50 = (const void *)v63;
            uint64_t v71 = AMFDRCreateInstanceString();
            if (v71)
            {
              uint64_t v72 = (const void *)v71;
              uint64_t v73 = MGGetStringAnswer();
              cf = v72;
              if (v73)
              {
                uint64_t v81 = (const void *)v73;
                LOBYTE(outputStruct) = (_BYTE)v72;
                uint64_t v82 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@-%@");
                v666 = v81;
                if (v82)
                {
                  uint64_t v61 = v82;
                  uint64_t v60 = (const void *)AMFDRCreateInstanceString();
                  uint64_t v59 = @"ALCl";
                  if (!v60) {
                    goto LABEL_63;
                  }
LABEL_53:
                  if (v32)
                  {
                    v124 = (const __CFDictionary *)AMFDRSealingMapCopyLocalDict();
                    if (v124)
                    {
                      v125 = CFStringCreateWithCString(kCFAllocatorDefault, v32, 0x600u);
                      if (v125)
                      {
                        Value = (const __CFData *)CFDictionaryGetValue(v124, v125);
                        v160 = Value;
                        if (Value)
                        {
                          CFRetain(Value);
LABEL_67:
                          if (!CFDataGetLength(v160))
                          {
                            v189 = "FDR bundle is empty";
                            goto LABEL_80;
                          }
                          if (AMFDRGetTrustError())
                          {
                            v189 = "FDR bundle is not trusted";
LABEL_80:
                            sub_100003034(v189, v182, v183, v184, v185, v186, v187, v188, (char)outputStruct);
                            goto LABEL_45;
                          }
                          qword_100034010 = (uint64_t)v160;
                          BytePtr = CFDataGetBytePtr(v160);
                          Length = CFDataGetLength(v160);
                          uint64_t v11 = sub_100008B3C((uint64_t)BytePtr, Length);
                          v126 = 0;
                          goto LABEL_114;
                        }
                        v192 = "subCC get returned a null CFDataRef";
                      }
                      else
                      {
                        v192 = "Failed to create cf_subkey";
                      }
                      sub_100003034(v192, v152, v153, v154, v155, v156, v157, v158, (char)outputStruct);
LABEL_44:
                      if (v31 != 8)
                      {
LABEL_45:
                        v126 = 0;
                        goto LABEL_117;
                      }
LABEL_110:
                      sub_100003034("No matching FDR data, using default", v117, v118, v119, v120, v121, v122, v123, (char)outputStruct);
                      v237 = (const __CFArray *)AMFDRSealingManifestCopyMultiInstanceForClass();
                      v126 = v237;
                      if (!v237 || !CFArrayGetCount(v237))
                      {
                        sub_100003034("AMFDR multi instance not found!", v238, v239, v240, v241, v242, v243, v244, (char)outputStruct);
LABEL_117:
                        v174 = 0;
                        uint64_t v11 = 0;
                        if (!v61) {
                          goto LABEL_119;
                        }
                        goto LABEL_118;
                      }
                      CFArrayGetValueAtIndex(v126, 0);
                      v245 = (const __CFData *)AMFDRSealingMapCopyLocalData();
                      uint64_t v11 = (FILE *)v245;
                      if (!v245)
                      {
                        sub_100003034("AMFDR alternative failed to load!", v246, v247, v248, v249, v250, v251, v252, (char)outputStruct);
                        v174 = 0;
                        if (!v61)
                        {
LABEL_119:
                          v255 = cf;
                          if (!cf) {
                            goto LABEL_121;
                          }
                          goto LABEL_120;
                        }
LABEL_118:
                        CFRelease(v61);
                        goto LABEL_119;
                      }
                      qword_100034010 = (uint64_t)v245;
                      v253 = CFDataGetBytePtr(v245);
                      v254 = CFDataGetLength((CFDataRef)v11);
                      uint64_t v11 = sub_100008B3C((uint64_t)v253, v254);
LABEL_114:
                      v174 = 1;
                      if (!v61) {
                        goto LABEL_119;
                      }
                      goto LABEL_118;
                    }
                    sub_100003034("AMFDRSealingMapCopyLocalDict returned a null CFDictionaryRef", v145, v146, v147, v148, v149, v150, v151, (char)outputStruct);
LABEL_43:
                    v125 = 0;
                    goto LABEL_44;
                  }
                  v160 = (const __CFData *)AMFDRSealingMapCopyLocalData();
                  if (v160)
                  {
                    v124 = 0;
                    v125 = 0;
                    goto LABEL_67;
                  }
                  sub_100003034("AMFDRDataCopy returned a null CFDataRef", v175, v176, v177, v178, v179, v180, v181, (char)outputStruct);
LABEL_42:
                  v124 = 0;
                  goto LABEL_43;
                }
                uint64_t v59 = @"ALCl";
LABEL_461:
                v236 = "Failed to create acss_id";
                goto LABEL_462;
              }
              v666 = 0;
              uint64_t v59 = @"ALCl";
              goto LABEL_107;
            }
            uint64_t v59 = @"ALCl";
            goto LABEL_86;
          }
          sub_100003034("Failed to get DIC id", v64, v65, v66, v67, v68, v69, v70, (char)outputStruct);
          uint64_t v11 = 0;
          v174 = 0;
          v126 = 0;
          uint64_t v60 = 0;
          v124 = 0;
          v125 = 0;
          uint64_t v59 = @"ALCl";
        }
LABEL_126:
        CFRelease(v41);
LABEL_127:
        if (v59) {
          CFRelease(v59);
        }
        if (v60) {
          CFRelease(v60);
        }
        if (v126) {
          CFRelease(v126);
        }
        if (v124) {
          CFRelease(v124);
        }
        if (v125) {
          CFRelease(v125);
        }
        if ((v174 & 1) == 0) {
          sub_100003034("fdr_open failed", v117, v118, v119, v120, v121, v122, v123, (char)outputStruct);
        }
        qword_100034008 = (uint64_t)v11;
        if (!v11) {
          return 0;
        }
        goto LABEL_140;
    }
  }
  if (dword_10004FB20 == 4)
  {
    int v12 = dword_10004FB24;
    memset(md, 170, sizeof(md));
    sub_100005E1C("fetching signed bundle from FDR", a2, a3, a4, a5, a6, a7, a8, (char)outputStruct);
    if (v12 != 32) {
      goto LABEL_34;
    }
    CFDictionaryRef v13 = IOServiceMatching("AppleNVMeEAN");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v13);
    if (!MatchingService)
    {
      sub_100005E1C("Couldn't find AppleNVMeEAN object", v15, v16, v17, v18, v19, v20, v21, outputStructa);
      goto LABEL_34;
    }
    io_object_t v22 = MatchingService;
    connect = -1431655766;
    uint64_t v23 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
    IOObjectRelease(v22);
    if (v23)
    {
      sub_100005E1C("IOServiceOpen on AppleNVMeEAN failed, ans = 0x%x \n", v24, v25, v26, v27, v28, v29, v30, v23);
      goto LABEL_34;
    }
    output = 0xAAAAAAAAAAAAAAAALL;
    outputCnt = 1;
    input[2] = 0;
    input[3] = 0xAAAAAAAAAAAAAAAALL;
    input[0] = 1430470988;
    input[1] = 0;
    uint64_t v91 = IOConnectCallScalarMethod(connect, 3u, input, 4u, &output, &outputCnt);
    v99 = v91;
    if (v91 || !output)
    {
      sub_100003034("Get EANSize failed ret 0x%x \n", v92, v93, v94, v95, v96, v97, v98, v91);
      v108 = 0;
    }
    else
    {
      sub_100005E1C("Get EANSize  0x%llx \n", v92, v93, v94, v95, v96, v97, v98, output);
      v100 = (long long *)malloc_type_malloc(output, 0xD5FCF011uLL);
      v108 = v100;
      if (!v100)
      {
        sub_100003034("malloc failed:", v101, v102, v103, v104, v105, v106, v107, outputStructb);
        uint64_t v11 = 0;
        v99 = -536870211;
LABEL_98:
        IOServiceClose(connect);
        if (!v99 && v11)
        {
          qword_100034008 = (uint64_t)v11;
          goto LABEL_140;
        }
        if (v108) {
          free(v108);
        }
        sub_100003034("EAN read failed: 0x%X", v229, v230, v231, v232, v233, v234, v235, v99);
LABEL_34:
        uint64_t v90 = 0;
        qword_100034008 = 0;
        return v90;
      }
      *(void *)&v677.A = 1430470988;
      *(void *)&v677.C = v100;
      *(void *)&v677.Nl = output;
      v109 = IOConnectCallMethod(connect, 4u, (const uint64_t *)&v677.A, 3u, 0, 0, 0, 0, 0, 0);
      v99 = v109;
      if (!v109)
      {
        uint64_t v11 = sub_100008B3C((uint64_t)v108, output);
        if (v11)
        {
          v202 = v108[1];
          v673 = *v108;
          v674 = v202;
          v675 = *((_DWORD *)v108 + 8);
          sub_100005E1C("IOMFB: ADCL version is  %x\n", v195, v196, v197, v198, v199, v200, v201, SBYTE4(v673));
          v203 = 4 * DWORD2(v673);
          v204 = v203 - 36;
          sub_100005E1C("IOMFB: md5 data size is  %llx\n", v205, v206, v207, v208, v209, v210, v211, v203 - 36);
          v212 = malloc_type_malloc(v204, 0xAB929789uLL);
          memcpy(v212, (char *)v108 + 36, v204);
          *(void *)&v213 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v213 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)&v677.data[13] = v213;
          *(_OWORD *)&v677.data[10] = v213;
          *(_OWORD *)&v677.data[2] = v213;
          *(_OWORD *)&v677.data[6] = v213;
          *(_OWORD *)&v677.A = v213;
          *(_OWORD *)&v677.Nl = v213;
          CC_MD5_Init(&v677);
          CC_MD5_Update(&v677, v212, v204);
          CC_MD5_Final((unsigned __int8 *)md, &v677);
          sub_100005E1C("IOMFB: Checking MD5 \n", v214, v215, v216, v217, v218, v219, v220, outputStructd);
          for (i = 0; i != 4; ++i)
          {
            if (*((_DWORD *)&v674 + i + 1) != md[i]) {
              sub_100002F5C("%s: MD5 mismatch --> needed %X, got %X at index %d\n", v221, v222, v223, v224, v225, v226, v227, (char)"ean_open");
            }
          }
          sub_100005E1C("IOMFB: MD5 checksum passed \n", v221, v222, v223, v224, v225, v226, v227, outputStructc);
          if (v212) {
            free(v212);
          }
        }
        v99 = 0;
        goto LABEL_98;
      }
      sub_100003034("Read EAN failed ret 0x%x \n", v110, v111, v112, v113, v114, v115, v116, v109);
    }
    uint64_t v11 = 0;
    goto LABEL_98;
  }
  if (dword_10004FB20 == 3 && (dword_10004FB24 & 6) != 0)
  {
    uint64_t v8 = "Don't support SDCl key from the file system";
LABEL_454:
    sub_100003034(v8, a2, a3, a4, a5, a6, a7, a8, (char)outputStruct);
    return 0;
  }
  uint64_t v9 = (const char *)qword_100034000;
  if (qword_100034000)
  {
    if (!strcmp((const char *)qword_100034000, "-"))
    {
      uint64_t v11 = __stdinp;
      qword_100034008 = (uint64_t)__stdinp;
      if (!__stdinp)
      {
LABEL_23:
        char v10 = qword_100034000;
        goto LABEL_24;
      }
      goto LABEL_140;
    }
    qword_100034008 = (uint64_t)fopen(v9, "rb");
    char v10 = qword_100034000;
    if (!qword_100034008)
    {
LABEL_24:
      sub_100003034("Could not open input file '%s'", a2, a3, a4, a5, a6, a7, a8, v10);
      return 0;
    }
    sub_100005E1C("Processing %s", a2, a3, a4, a5, a6, a7, a8, qword_100034000);
  }
  uint64_t v11 = (FILE *)qword_100034008;
  if (!qword_100034008) {
    goto LABEL_23;
  }
LABEL_140:
  if (dword_10004FB24 == 4)
  {
    v669 = 0x10053505543;
    v670 = 27603;
    sub_100008788((uint64_t)&v669);
    return 1;
  }
  else
  {
    while (1)
    {
      v256 = sub_100008990(v11);
      v257 = sub_100008990(v11);
      v258 = sub_100008990(v11);
      v259 = v258;
      if (v256 == 1094992716 || v256 == 1279476801) {
        break;
      }
      uint64_t v11 = (FILE *)qword_100034008;
      v260 = v258 - 3;
      if (v258 != 3)
      {
        do
        {
          if (v260 >= 0x400) {
            v261 = 1024;
          }
          else {
            v261 = v260;
          }
          v262 = v261;
          do
          {
            sub_100008990(v11);
            --v262;
          }
          while (v262);
          v260 -= v261;
        }
        while (v260);
        uint64_t v11 = (FILE *)qword_100034008;
      }
    }
    if (v257 == 327680)
    {
      v263 = 6;
      do
      {
        sub_100008990((FILE *)qword_100034008);
        --v263;
      }
      while (v263);
      v264 = -9;
    }
    else
    {
      v264 = -3;
    }
    v265 = v264 + v259;
    uint64_t v90 = 1;
    if (v265)
    {
      while (1)
      {
        v266 = (FILE *)qword_100034008;
        v267 = sub_100008990((FILE *)qword_100034008);
        LODWORD(v669) = v267;
        v268 = sub_100008990(v266);
        HIDWORD(v669) = v268;
        v269 = sub_100008990(v266);
        v670 = v269;
        if (v265 < v269) {
          break;
        }
        cfa = v269;
        if (v267 > 1212632899)
        {
          if (v267 > 1347634752)
          {
            if (v267 > 1381520458)
            {
              if (v267 > 1414288194)
              {
                if (v267 != 1414288195 && v267 != 1431323500)
                {
                  v270 = 1431523395;
                  goto LABEL_247;
                }
                goto LABEL_248;
              }
              if (v267 == 1381520459) {
                goto LABEL_248;
              }
              if (v267 != 1397773635) {
                goto LABEL_330;
              }
              goto LABEL_231;
            }
            if (v267 <= 1347704130)
            {
              if (v267 != 1347634753)
              {
                v270 = 1347634765;
                goto LABEL_247;
              }
            }
            else if (v267 != 1347704131 && v267 != 1347704176)
            {
              v270 = 1363498051;
              goto LABEL_247;
            }
          }
          else
          {
            if (v267 > 1346520131)
            {
              if (((v267 - 1346520132) > 0x2C
                 || ((1 << (v267 - 68)) & 0x100000008001) == 0)
                && v267 != 1346650979)
              {
                v270 = 1346650992;
                goto LABEL_247;
              }
              goto LABEL_248;
            }
            if (v267 > 1230128194)
            {
              if (v267 == 1230128195) {
                goto LABEL_248;
              }
              if (v267 != 1279479620)
              {
                v270 = 1280068948;
                goto LABEL_247;
              }
              v387 = HIWORD(v268);
              if (HIWORD(v268) - 3 < 2u) {
                goto LABEL_248;
              }
              if (v387 != 2)
              {
                if (v387 != 1) {
                  sub_100002F5C("Unexpected version [%d] for LCOD block", a2, a3, a4, a5, a6, a7, a8, SBYTE2(v268));
                }
                if (v269 != 160) {
                  sub_100002F5C("PDC table not well formed.", a2, a3, a4, a5, a6, a7, a8, (char)outputStruct);
                }
                if (dword_1000340C8 >= 2) {
                  sub_100002F5C("Inconsistent table versions", a2, a3, a4, a5, a6, a7, a8, (char)outputStruct);
                }
                dword_1000340C8 = 1;
                v388 = malloc_type_malloc(0xDB8uLL, 0x1020040D1459293uLL);
                v396 = (uint64_t)v388;
                if (!v388) {
                  sub_100002F5C("out of memory.", v389, v390, v391, v392, v393, v394, v395, (char)outputStruct);
                }
                v388[8] = 1;
                v388[2] = sub_100008C68((FILE *)qword_100034008);
                *(_DWORD *)(v396 + 12) = sub_100008C68((FILE *)qword_100034008);
                v397 = sub_100008990((FILE *)qword_100034008);
                *(_DWORD *)(v396 + 20) = sub_100008D08(v397, v398, v399, v400, v401, v402, v403, v404);
                for (j = 40; j != 64; j += 4)
                  *(_DWORD *)(v396 + j) = sub_100008990((FILE *)qword_100034008);
                *(_DWORD *)(v396 + 64) = sub_100008990((FILE *)qword_100034008);
                for (k = 68; k != 80; k += 4)
                  *(_DWORD *)(v396 + k) = sub_100008990((FILE *)qword_100034008);
                do
                {
                  *(_WORD *)(v396 + k) = sub_100008C68((FILE *)qword_100034008);
                  k += 2;
                }
                while (k != 658);
                sub_100008C68((FILE *)qword_100034008);
                v414 = 0;
                v415 = (_WORD *)(v396 + 82);
                do
                {
                  v416 = 0;
                  v417 = vdupq_n_s64(v414);
                  v418 = v415;
                  v419 = (int64x2_t)xmmword_100029490;
                  do
                  {
                    v420.i64[0] = -1;
                    v420.i64[1] = -1;
                    v421.i64[0] = 0xFFFFFFFFLL;
                    v421.i64[1] = 0xFFFFFFFFLL;
                    v422 = vorrq_s8((int8x16_t)vceqq_s64(v417, v419), (int8x16_t)vceqq_s64((int64x2_t)vandq_s8((int8x16_t)vaddq_s64(v419, v420), v421), v417));
                    v420.i32[0] = v416 << 8;
                    v420.i32[1] = (v416 << 8) | 0x100;
                    v423 = vmin_u32((uint32x2_t)vand_s8(*(int8x8_t *)v420.i8, (int8x8_t)0xFFFF0000FFFFLL), (uint32x2_t)0xF0000000FLL);
                    v424 = vmovn_s64((int64x2_t)vandq_s8((int8x16_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x11uLL), (uint64x2_t)v419), vorrq_s8(v422, (int8x16_t)vceqq_s64(vaddq_s64(v419, vdupq_n_s64(1uLL)), v417))));
                    if (v424.i8[0]) {
                      *(v418 - 1) = v423.i16[0];
                    }
                    if (v424.i8[4]) {
                      *v418 = v423.i16[2];
                    }
                    v416 += 2;
                    v419 = vaddq_s64(v419, vdupq_n_s64(2uLL));
                    v418 += 2;
                  }
                  while (v416 != 18);
                  ++v414;
                  v415 += 17;
                }
                while (v414 != 17);
                v425 = qword_100034910;
                for (m = *(_DWORD *)(v396 + 8); v425; v425 = *(void *)v425)
                {
                  if (m == *(_DWORD *)(v425 + 8) && *(_DWORD *)(v396 + 12) == *(_DWORD *)(v425 + 12)) {
                    sub_100002F5C("Duplicate PDC table found in input.", v407, v408, v409, v410, v411, v412, v413, (char)outputStruct);
                  }
                }
                sub_100008D80(m, dword_1000340D0, &dword_100034100, v409, v410, v411, v412, v413);
                sub_100008D80(*(_DWORD *)(v396 + 12), dword_100034104, dword_100034134, v427, v428, v429, v430, v431);
                *(void *)v396 = qword_100034910;
                qword_100034910 = v396;
                goto LABEL_249;
              }
              if ((dword_1000340C8 | 2) != 2) {
                sub_100002F5C("Inconsistent table versions", a2, a3, a4, a5, a6, a7, a8, (char)outputStruct);
              }
              dword_1000340C8 = 2;
              if (v269 != 193) {
                sub_100002F5C("PDC table not well formed.", a2, a3, a4, a5, a6, a7, a8, (char)outputStruct);
              }
              v548 = 0;
              word_1000341F8 = sub_100008C68((FILE *)qword_100034008);
              memset(&v677, 255, 24);
              do
              {
                *(CC_LONG *)((char *)&v677.A + v548) = sub_100008990((FILE *)qword_100034008);
                v548 += 4;
              }
              while (v548 != 24);
              if (!byte_100034904)
              {
                v549 = *(float *)&qword_100034908;
                if (*(float *)&qword_100034908 == 0.0) {
                  v549 = (float)sub_100002E24(dword_10004FAE8, @"FFR_raw_index", 0xFFFFFFFFLL)
                }
                       * 0.000015259;
                v550 = 0;
                while (v549 > *((float *)&v677.A + v550))
                {
                  if (++v550 == 6)
                  {
                    word_1000348FC = 6;
                    v551 = 0.0;
                    goto LABEL_412;
                  }
                }
                if (v550 <= 1) {
                  v559 = 1;
                }
                else {
                  v559 = v550;
                }
                word_1000348FC = v559;
                v551 = 0.0;
                if ((v550 - 5) >= 0xFFFFFFFC)
                {
                  v560 = *((float *)&v677.A + (v550 - 1));
                  v551 = (float)(v549 - v560) / (float)(*((float *)&v677.A + v550) - v560);
                }
LABEL_412:
                dword_100034900 = LODWORD(v551);
                byte_100034904 = 1;
              }
              v561 = sub_100008C68((FILE *)qword_100034008);
              v562 = sub_100008C68((FILE *)qword_100034008);
              v563 = sub_100008C68((FILE *)qword_100034008);
              v665 = sub_100008C68((FILE *)qword_100034008);
              v564 = sub_100008990((FILE *)qword_100034008);
              v579 = sub_100008D08(v564, v565, v566, v567, v568, v569, v570, v571);
              if (!v579) {
                sub_100002F5C("useless PDC table", v572, v573, v574, v575, v576, v577, v578, (char)outputStruct);
              }
              v580 = sub_100008E38(v561, ((v562 << 16) / 10), (v665 << 16), v579, v563, v576, v577, v578);
              v580[5] |= v579;
              v581 = 6;
              do
              {
                if (sub_100008990((FILE *)qword_100034008)) {
                  sub_100002F5C("overdrive entries != 0 not supported", v582, v583, v584, v585, v586, v587, v588, (char)outputStruct);
                }
                --v581;
              }
              while (v581);
              sub_100008990((FILE *)qword_100034008);
              v589 = 3;
              do
              {
                sub_100008990((FILE *)qword_100034008);
                --v589;
              }
              while (v589);
              for (n = 0; n != 68; *(_DWORD *)((char *)&qword_100034000 + n + 364) = v598)
              {
                v598 = (int)((float)((float)((float)sub_100008C68((FILE *)qword_100034008) * 65536.0)
                                   / 65535.0)
                           + 0.5);
                v599 = *(_DWORD *)((char *)&qword_100034000 + n + 368);
                if (v599 && v599 != v598) {
                  sub_100002F5C("inconsistent PDC config", v591, v592, v593, v594, v595, v596, v597, (char)outputStruct);
                }
                n += 4;
              }
              v600 = 0;
              word_1000341FE = 17;
              v601 = 1;
              while (2)
              {
                v602 = sub_100008C68((FILE *)qword_100034008);
                if ((v579 & 1) == 0)
                {
                  if ((v579 & 2) == 0) {
                    goto LABEL_426;
                  }
LABEL_431:
                  *(_WORD *)((char *)v580 + v600 + 618) = v602;
                  if ((v579 & 4) == 0) {
                    goto LABEL_428;
                  }
LABEL_427:
                  *(_WORD *)((char *)v580 + v600 + 1196) = v602;
                  goto LABEL_428;
                }
                *(_WORD *)((char *)v580 + v600 + 40) = v602;
                if ((v579 & 2) != 0) {
                  goto LABEL_431;
                }
LABEL_426:
                if ((v579 & 4) != 0) {
                  goto LABEL_427;
                }
LABEL_428:
                v601 &= v602 == 0;
                v600 += 2;
                if (v600 != 578) {
                  continue;
                }
                break;
              }
              if (v601) {
                sub_100002F5C("DCLUT[%d, %d, %d, %d, %d] is all zeros", v603, v604, v605, v606, v607, v608, v609, v561);
              }
              for (ii = 0; ii != 68; *(_DWORD *)((char *)&qword_100034000 + ii + 432) = v618)
              {
                v618 = (int)((float)((float)((float)sub_100008C68((FILE *)qword_100034008) * 65536.0)
                                   / 65535.0)
                           + 0.5);
                v619 = *(_DWORD *)((char *)&qword_100034000 + ii + 436);
                if (v619 && v619 != v618) {
                  sub_100002F5C("inconsistent PDC config", v611, v612, v613, v614, v615, v616, v617, (char)outputStruct);
                }
                ii += 4;
              }
              v620 = 0;
              word_100034200 = 17;
              v621 = 1;
              while (2)
              {
                v622 = sub_100008C68((FILE *)qword_100034008);
                if (v579)
                {
                  *(_WORD *)((char *)v580 + v620 + 1774) = v622;
                  if ((v579 & 2) != 0) {
                    goto LABEL_446;
                  }
LABEL_441:
                  if ((v579 & 4) == 0)
                  {
LABEL_443:
                    v621 &= v622 == 0;
                    v620 += 2;
                    if (v620 == 34)
                    {
                      if (v621) {
                        sub_100002F5C("PMLUT[%d, %d, %d, %d, %d] is all zeros", v623, v624, v625, v626, v627, v628, v629, v561);
                      }
                      v630 = sub_100008C68((FILE *)qword_100034008);
                      if ((v630 - 3) <= 0xFFFFFFFD) {
                        sub_100002F5C("illegal frame count", v631, v632, v633, v634, v635, v636, v637, (char)outputStruct);
                      }
                      if (*((_WORD *)v580 + 938) && *((unsigned __int16 *)v580 + 938) != v630) {
                        sub_100002F5C("inconsistent PDC data", v631, v632, v633, v634, v635, v636, v637, (char)outputStruct);
                      }
                      *((_WORD *)v580 + 938) = v630;
                      sub_100008FA8(v580[2], dword_1000340D0, &word_1000341FA, v633, v634, v635, v636, v637);
                      sub_100008FA8(v580[4], dword_100034120, &word_1000341FC, v638, v639, v640, v641, v642);
                      goto LABEL_249;
                    }
                    continue;
                  }
                }
                else
                {
                  if ((v579 & 2) == 0) {
                    goto LABEL_441;
                  }
LABEL_446:
                  *(_WORD *)((char *)v580 + v620 + 1808) = v622;
                  if ((v579 & 4) == 0) {
                    goto LABEL_443;
                  }
                }
                break;
              }
              *(_WORD *)((char *)v580 + v620 + 1842) = v622;
              goto LABEL_443;
            }
            if (v267 != 1212632900)
            {
              v270 = 1213419587;
              goto LABEL_247;
            }
          }
LABEL_248:
          sub_1000089E0((int *)&v669, a2, a3, a4, a5, a6, a7, a8);
          goto LABEL_249;
        }
        if (v267 <= 1112293703)
        {
          if (v267 <= 861097038)
          {
            if (v267 <= 860177478)
            {
              if (v267 != 538985281)
              {
                v270 = 542134851;
                goto LABEL_247;
              }
              goto LABEL_248;
            }
            if (v267 == 860177479)
            {
              v349 = malloc_type_malloc(0x20uLL, 0x1030040C34A1C5FuLL);
              v357 = (uint64_t)v349;
              if (!v349) {
                sub_100002F5C("out of memory", v350, v351, v352, v353, v354, v355, v356, (char)outputStruct);
              }
              bzero(v349, 0x20uLL);
              *(void *)v357 = qword_10004FAB0;
              qword_10004FAB0 = v357;
              *(unsigned char *)(v357 + 8) = 0;
              if (HIWORD(v268) == 2)
              {
                *(_WORD *)(v357 + 10) = sub_100008C68((FILE *)qword_100034008);
                *(unsigned char *)(v357 + 8) = sub_100008CB8((FILE *)qword_100034008);
                v482 = sub_100008C68((FILE *)qword_100034008);
                *(_WORD *)(v357 + 12) = v482;
                v483 = malloc_type_malloc(v482, 0xE421A4B0uLL);
                *(void *)(v357 + 16) = v483;
                if (!v483) {
                  sub_100002F5C("Out of memory", v484, v485, v486, v487, v488, v489, v490, (char)outputStruct);
                }
                if (*(_WORD *)(v357 + 12))
                {
                  v491 = 0;
                  do
                    *(unsigned char *)(*(void *)(v357 + 16) + v491++) = sub_100008CB8((FILE *)qword_100034008);
                  while (v491 < *(unsigned __int16 *)(v357 + 12));
                }
                v492 = sub_100008C68((FILE *)qword_100034008);
                *(_WORD *)(v357 + 14) = v492;
                v493 = malloc_type_malloc(v492, 0x89DFE9F8uLL);
                *(void *)(v357 + 24) = v493;
                if (!v493) {
                  sub_100002F5C("Out of memory", v377, v378, v379, v380, v381, v382, v383, (char)outputStruct);
                }
                if (*(_WORD *)(v357 + 14))
                {
                  v494 = 0;
                  do
                  {
                    *(unsigned char *)(*(void *)(v357 + 24) + v494++) = sub_100008CB8((FILE *)qword_100034008);
                    v495 = *(unsigned __int16 *)(v357 + 14);
                  }
                  while (v494 < v495);
                  v496 = v495 + 7;
                }
                else
                {
                  v496 = 7;
                }
                v555 = v496 + *(unsigned __int16 *)(v357 + 12);
                if (((unint64_t)(v555 + 3) >> 2) + 3 != cfa) {
                  sub_100002F5C("Invalid size (%d) for 3EDG", v377, v378, v379, v380, v381, v382, v383, cfa);
                }
                v556 = v555 & 3;
                if (v556)
                {
                  v557 = v556 | 0xFFFFFFFFFFFFFFFCLL;
                  do
                  {
                    sub_100008CB8((FILE *)qword_100034008);
                    v454 = __CFADD__(v557++, 1);
                  }
                  while (!v454);
                }
              }
              else
              {
                if (HIWORD(v268) != 1) {
                  sub_100002F5C("Unexpected version [%d] for 3EDG block", v358, v359, v360, v361, v362, v363, v364, SBYTE2(v268));
                }
                *(_WORD *)(v357 + 10) = sub_100008C68((FILE *)qword_100034008);
                v365 = sub_100008C68((FILE *)qword_100034008);
                *(_WORD *)(v357 + 12) = v365;
                v366 = malloc_type_malloc(v365, 0xD931F95CuLL);
                *(void *)(v357 + 16) = v366;
                if (!v366) {
                  sub_100002F5C("Out of memory", v367, v368, v369, v370, v371, v372, v373, (char)outputStruct);
                }
                if (*(_WORD *)(v357 + 12))
                {
                  v374 = 0;
                  do
                    *(unsigned char *)(*(void *)(v357 + 16) + v374++) = sub_100008CB8((FILE *)qword_100034008);
                  while (v374 < *(unsigned __int16 *)(v357 + 12));
                }
                v375 = sub_100008C68((FILE *)qword_100034008);
                *(_WORD *)(v357 + 14) = v375;
                v376 = malloc_type_malloc(v375, 0xC771F807uLL);
                *(void *)(v357 + 24) = v376;
                if (!v376) {
                  sub_100002F5C("Out of memory", v377, v378, v379, v380, v381, v382, v383, (char)outputStruct);
                }
                if (*(_WORD *)(v357 + 14))
                {
                  v384 = 0;
                  do
                  {
                    *(unsigned char *)(*(void *)(v357 + 24) + v384++) = sub_100008CB8((FILE *)qword_100034008);
                    v385 = *(unsigned __int16 *)(v357 + 14);
                  }
                  while (v384 < v385);
                  v386 = v385 + 6;
                }
                else
                {
                  v386 = 6;
                }
                v552 = v386 + *(unsigned __int16 *)(v357 + 12);
                if (((unint64_t)(v552 + 3) >> 2) + 3 != cfa) {
                  sub_100002F5C("Invalid size (%d) for 3EDG", v377, v378, v379, v380, v381, v382, v383, cfa);
                }
                v553 = v552 & 3;
                if (v553)
                {
                  v554 = v553 | 0xFFFFFFFFFFFFFFFCLL;
                  do
                  {
                    sub_100008CB8((FILE *)qword_100034008);
                    v454 = __CFADD__(v554++, 1);
                  }
                  while (!v454);
                }
              }
              v558 = v357;
              while (1)
              {
                v558 = *(void *)v558;
                if (!v558) {
                  break;
                }
                if (*(unsigned __int16 *)(v558 + 10) == *(unsigned __int16 *)(v357 + 10)) {
                  sub_100002F5C("Duplicate 3EDG index value (%d)", v377, v378, v379, v380, v381, v382, v383, *(_WORD *)(v558 + 10));
                }
              }
            }
            else
            {
              if (v267 != 860640596) {
                goto LABEL_330;
              }
              if (HIWORD(v268) == 1) {
                v348 = 10;
              }
              else {
                v348 = 9;
              }
              if (v269 != v348) {
                sub_100002F5C("Bad size for 3LUT", a2, a3, a4, a5, a6, a7, a8, (char)outputStruct);
              }
              if (dword_10004FA18)
              {
                if (dword_10004FA18 != HIWORD(v268)) {
                  sub_100002F5C("Mixed 3LUT block versions. They must all match.", a2, a3, a4, a5, a6, a7, a8, (char)outputStruct);
                }
              }
              else
              {
                dword_10004FA18 = HIWORD(v268);
              }
              v664 = sub_100008C68((FILE *)qword_100034008);
              v663 = sub_100008990((FILE *)qword_100034008);
              v497 = sub_100008990((FILE *)qword_100034008);
              v498 = sub_100008C68((FILE *)qword_100034008);
              v499 = sub_100008C68((FILE *)qword_100034008);
              v500 = sub_100008C68((FILE *)qword_100034008);
              v501 = sub_100008C68((FILE *)qword_100034008);
              v502 = sub_100008990((FILE *)qword_100034008);
              v517 = sub_100008D08(v502, v503, v504, v505, v506, v507, v508, v509);
              if (!v517) {
                sub_100002F5C("useless 3LUT table", v510, v511, v512, v513, v514, v515, v516, (char)outputStruct);
              }
              if (word_10004FA9C == 32) {
                sub_100002F5C("Too many index values for CLUT tables", v510, 32, v512, v513, v514, v515, v516, (char)outputStruct);
              }
              v518 = &dword_10004FA1C[(unsigned __int16)word_10004FA9C];
              v519 = wmemchr(dword_10004FA1C, v497, (unsigned __int16)word_10004FA9C);
              if (v519) {
                v525 = v519;
              }
              else {
                v525 = v518;
              }
              v526 = v525 - dword_10004FA1C;
              if (v526 == (unsigned __int16)word_10004FA9C)
              {
                ++word_10004FA9C;
                dword_10004FA1C[v526] = v497;
                LOBYTE(v677.A) = -86;
                std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>();
              }
              v527 = (v500 << 16) / 0xAuLL;
              if (dword_10004FA18 == 1) {
                v528 = &unk_10004F9BC;
              }
              else {
                v528 = &unk_10004FA00;
              }
              sub_100009048(v527, (uint64_t)&unk_10004F870, v528, v520, v521, v522, v523, v524);
              v534 = (v501 << 16);
              if (dword_10004FA18 == 1) {
                v535 = &unk_10004F9BE;
              }
              else {
                v535 = &unk_10004FA02;
              }
              sub_100009048(v534, (uint64_t)&unk_10004F8C0, v535, v529, v530, v531, v532, v533);
              if (word_10004FA9E)
              {
                if (v664 != (unsigned __int16)word_10004FA9E
                  || v663 != dword_10004FAA0
                  || v498 << 16 != dword_10004F910
                  || (v499 << 16) / 0xAu != dword_10004F914)
                {
                  sub_100002F5C("3LUT data version not constant", v536, v537, v538, v539, v540, v541, v542, (char)outputStruct);
                }
              }
              else
              {
                word_10004FA9E = v664;
                dword_10004FAA0 = v663;
                dword_10004F910 = v498 << 16;
                dword_10004F914 = (v499 << 16) / 0xAu;
              }
              v543 = sub_1000090E0(v497, v527, v534, v517, v539, v540, v541, v542);
              *(_WORD *)(v543 + 84) |= v517;
              if (dword_10004FA18 == 1) {
                v544 = sub_100008C68((FILE *)qword_100034008);
              }
              else {
                v544 = 0;
              }
              v545 = sub_100008C68((FILE *)qword_100034008);
              v546 = 0;
              v547 = (_WORD *)(v543 + 10);
              do
              {
                if ((v517 >> v546))
                {
                  *(v547 - 1) = v544;
                  *v547 = v545;
                }
                ++v546;
                v547 += 2;
              }
              while (v546 != 3);
              if (dword_10004FA18 == 1) {
                goto LABEL_378;
              }
            }
          }
          else
          {
            if (v267 > 1097626439)
            {
              if (v267 == 1097626440 || v267 == 1111703884) {
                goto LABEL_248;
              }
              if (v267 == 1112100436)
              {
                v296 = malloc_type_malloc(0x20uLL, 0x1030040322C5439uLL);
                v304 = (uint64_t)v296;
                if (!v296) {
                  sub_100002F5C("out of memory", v297, v298, v299, v300, v301, v302, v303, (char)outputStruct);
                }
                bzero(v296, 0x20uLL);
                *(void *)v304 = qword_10004FAA8;
                qword_10004FAA8 = v304;
                if (cfa <= 4) {
                  sub_100002F5C("invalid size for BINT", v305, v306, v307, v308, v309, v310, v311, (char)outputStruct);
                }
                *(_WORD *)(v304 + 8) = sub_100008C68((FILE *)qword_100034008);
                *(_WORD *)(v304 + 10) = sub_100008C68((FILE *)qword_100034008);
                v312 = sub_100008C68((FILE *)qword_100034008);
                *(_WORD *)(v304 + 12) = v312;
                if (cfa != v312 + 5) {
                  sub_100002F5C("invalid size for BINT", v313, v314, v315, v316, v317, v318, v319, (char)outputStruct);
                }
                if (v312 - 101 <= 0xFFFFFF9B) {
                  sub_100002F5C("invalid point count for BINT", v313, v314, v315, v316, v317, v318, v319, (char)outputStruct);
                }
                *(void *)(v304 + 16) = malloc_type_malloc(2 * v312, 0x1000040BDFB0063uLL);
                v320 = malloc_type_malloc(2 * *(unsigned __int16 *)(v304 + 12), 0x1000040BDFB0063uLL);
                *(void *)(v304 + 24) = v320;
                if (!*(void *)(v304 + 16) || !v320) {
                  sub_100002F5C("out of memory", v321, v322, v323, v324, v325, v326, v327, (char)outputStruct);
                }
                if (*(_WORD *)(v304 + 12))
                {
                  v328 = 0;
                  do
                  {
                    v329 = sub_100008C68((FILE *)qword_100034008);
                    v337 = *(void *)(v304 + 16);
                    *(_WORD *)(v337 + 2 * v328) = v329;
                    if (v329 <= *(unsigned __int16 *)(v304 + 8) || v329 >= *(unsigned __int16 *)(v304 + 10)) {
                      sub_100002F5C("Malformed BINT brightness sequence", v330, v331, v332, v333, v334, v335, v336, (char)outputStruct);
                    }
                    if (v328 && v329 <= *(unsigned __int16 *)(v337 + 2 * v328 - 2)) {
                      sub_100002F5C("Malformed BINT brightness sequence", v330, v331, v332, v333, v334, v335, v336, (char)outputStruct);
                    }
                    ++v328;
                  }
                  while (v328 < *(unsigned __int16 *)(v304 + 12));
                  if (*(_WORD *)(v304 + 12))
                  {
                    v338 = 0;
                    do
                    {
                      v339 = sub_100008C68((FILE *)qword_100034008);
                      v347 = *(void *)(v304 + 24);
                      *(_WORD *)(v347 + 2 * v338) = v339;
                      if (v338 && v339 > *(unsigned __int16 *)(v347 + 2 * v338 - 2)) {
                        sub_100002F5C("Malformed BINT weight sequence", v340, v341, v342, v343, v344, v345, v346, (char)outputStruct);
                      }
                      ++v338;
                    }
                    while (v338 < *(unsigned __int16 *)(v304 + 12));
                  }
                }
                goto LABEL_378;
              }
LABEL_330:
              v478 = v269 - 3;
              if (v269 != 3)
              {
                v479 = (FILE *)qword_100034008;
                do
                {
                  if (v478 >= 0x400) {
                    v480 = 1024;
                  }
                  else {
                    v480 = v478;
                  }
                  v481 = v480;
                  do
                  {
                    sub_100008990(v479);
                    --v481;
                  }
                  while (v481);
                  v478 -= v480;
                }
                while (v478);
              }
              goto LABEL_249;
            }
            if (v267 != 861097039)
            {
              v270 = 1095128135;
              goto LABEL_247;
            }
            if (v269 != 20) {
              sub_100002F5C("Bad size for 3SLO", a2, a3, a4, a5, a6, a7, a8, (char)outputStruct);
            }
            if ((v268 & 0xFFFF0000) != 0x10000) {
              sub_100002F5C("Bad version (%X) for SLO", a2, a3, a4, a5, a6, a7, a8, v268);
            }
            if (*(float *)&dword_10004F9C0 != 0.0) {
              sub_100002F5C("Multiple 3SLO blocks found", a2, a3, a4, a5, a6, a7, a8, (char)outputStruct);
            }
            for (jj = 0; jj != 17; ++jj)
            {
              LODWORD(v433) = sub_100008990((FILE *)qword_100034008);
              *((float *)&qword_100034000 + jj + 28271) = v433;
              if (jj)
              {
                if (*((float *)&qword_100034000 + (jj - 1) + 28271) >= v433) {
                  sub_100002F5C("Values in 3SLO must be strictly increasing", v434, v435, v436, v437, v438, v439, v440, (char)outputStruct);
                }
              }
              else if (v433 != 0.0)
              {
                sub_100002F5C("first 3SLO value must be zero", v434, v435, v436, v437, v438, v439, v440, (char)outputStruct);
              }
            }
            if (*(float *)&dword_10004F9FC != 1.0) {
              sub_100002F5C("Final 3SLO value must be one", v434, v435, v436, v437, v438, v439, v440, (char)outputStruct);
            }
          }
        }
        else
        {
          if (v267 > 1129664594)
          {
            if (v267 > 1145981267)
            {
              if (v267 != 1145981268)
              {
                if (v267 != 1146110828)
                {
                  v270 = 1162630739;
                  goto LABEL_247;
                }
                goto LABEL_248;
              }
              if (word_10004F918[0]) {
                sub_100002F5C("Multiple DNIT blocks found.", a2, a3, a4, a5, a6, a7, a8, (char)outputStruct);
              }
              if (v269 <= 3) {
                sub_100002F5C("invalid size for DNIT", a2, a3, a4, a5, a6, a7, a8, (char)outputStruct);
              }
              v459 = sub_100008C68((FILE *)qword_100034008);
              word_10004F918[0] = v459;
              if (cfa != v459 + 4) {
                sub_100002F5C("invalid size for DNIT", v460, v461, v462, v463, v464, v465, v466, (char)outputStruct);
              }
              if ((v459 - 21) < 0xFFFFFFEC) {
                sub_100002F5C("invalid point count for DNIT", v460, v461, v462, v463, v464, v465, v466, (char)outputStruct);
              }
              v467 = 0;
              do
              {
                v475 = sub_100008C68((FILE *)qword_100034008) << 16;
                v476 = (char *)&qword_100034000 + 4 * v467;
                *((_DWORD *)v476 + 28231) = v475;
                if (v467 && v475 <= *((_DWORD *)v476 + 28230)) {
                  sub_100002F5C("Malformed DNIT brightness sequence", v468, v469, v470, v471, v472, v473, v474, (char)outputStruct);
                }
                ++v467;
              }
              while (v467 < word_10004F918[0]);
              if (word_10004F918[0])
              {
                v477 = 0;
                do
                  *(_DWORD *)&word_10004F918[2 * v477++ + 42] = sub_100008C68((FILE *)qword_100034008) << 16;
                while (v477 < word_10004F918[0]);
              }
LABEL_378:
              sub_100008C68((FILE *)qword_100034008);
              goto LABEL_249;
            }
            if (v267 != 1129664595)
            {
              v270 = 1145195841;
LABEL_247:
              if (v267 == v270) {
                goto LABEL_248;
              }
              goto LABEL_330;
            }
LABEL_231:
            sub_100008788((uint64_t)&v669);
            goto LABEL_249;
          }
          if (v267 <= 1112298578)
          {
            if (v267 == 1112293704) {
              goto LABEL_248;
            }
            v270 = 1112298320;
            goto LABEL_247;
          }
          switch(v267)
          {
            case 1112298579:
              goto LABEL_248;
            case 1128547908:
              v441 = v269 - 3;
              if (v269 != 3)
              {
                do
                {
                  v442 = (FILE *)qword_100034008;
                  v443 = sub_100008990((FILE *)qword_100034008);
                  v444 = sub_100008990(v442);
                  v445 = sub_100008990(v442);
                  v453 = v445;
                  v454 = v441 >= v445;
                  v441 -= v445;
                  if (!v454) {
                    sub_100002F5C("%s: input data not well-formed.", v446, v447, v448, v449, v450, v451, v452, (char)"read_cdfd");
                  }
                  if (v443 > 1129596996)
                  {
                    if (v443 == 1129596997)
                    {
                      malloc_type_malloc(0x58uLL, 0x1020040BADD1CFBuLL);
                      sub_100002F5C("Invalid theta table size", v651, v652, v653, v654, v655, v656, v657, (char)outputStruct);
                    }
                    if (v443 == 1129597010)
                    {
                      malloc_type_malloc(0x98uLL, 0x1020040E4A17CC5uLL);
                      sub_100002F5C("Invalid threshold table size", v644, v645, v646, v647, v648, v649, v650, (char)outputStruct);
                    }
                  }
                  else
                  {
                    if (v443 == 1128547142)
                    {
                      if (!byte_10003401D)
                      {
                        byte_10003401D = 1;
                        dword_100034020 = 1;
                        sub_100002F5C("Wrong block size for CDFD coeffs", v446, v447, v448, v449, v450, v451, v452, (char)outputStruct);
                      }
                      sub_100002F5C("Duplicate coeffs for CDFD", v446, v447, v448, v449, v450, v451, v452, (char)outputStruct);
                    }
                    if (v443 == 1128547399)
                    {
                      if (!byte_10003401C)
                      {
                        byte_10003401C = 1;
                        dword_100034020 = 1;
                        sub_100002F5C("wrong degamma table size found.", v446, v447, v448, v449, v450, v451, v452, (char)outputStruct);
                      }
                      sub_100002F5C("Duplicate degamma for CDFD", v446, v447, v448, v449, v450, v451, v452, (char)outputStruct);
                    }
                  }
                  v455 = v445 - 3;
                  if (v445 != 3)
                  {
                    v456 = (FILE *)qword_100034008;
                    do
                    {
                      if (v455 >= 0x400) {
                        v457 = 1024;
                      }
                      else {
                        v457 = v455;
                      }
                      v458 = v457;
                      do
                      {
                        sub_100008990(v456);
                        --v458;
                      }
                      while (v458);
                      v455 -= v457;
                    }
                    while (v455);
                  }
                }
                while (v441);
                v669 = __PAIR64__(v444, v443);
                v670 = v453;
              }
              break;
            case 1129076052:
              v271 = malloc_type_malloc(0x2670uLL, 0x1020040706BADFDuLL);
              v279 = (uint64_t)v271;
              if (!v271) {
                sub_100002F5C("out of memory", v272, v273, v274, v275, v276, v277, v278, (char)outputStruct);
              }
              bzero(v271, 0x2670uLL);
              *(void *)v279 = qword_10004FAC0;
              qword_10004FAC0 = v279;
              if (cfa != 2460) {
                sub_100002F5C("Invalid size (%d) for CLUT", v280, v281, v282, v283, v284, v285, v286, cfa);
              }
              v287 = 0;
              *(_WORD *)(v279 + 8) = sub_100008C68((FILE *)qword_100034008);
              do
              {
                *(_WORD *)(v279 + v287 + 10) = sub_100008C68((FILE *)qword_100034008);
                v287 += 2;
              }
              while (v287 != 9826);
              v295 = v279;
              while (1)
              {
                v295 = *(void *)v295;
                if (!v295) {
                  break;
                }
                if (*(unsigned __int16 *)(v295 + 8) == *(unsigned __int16 *)(v279 + 8)) {
                  sub_100002F5C("Duplicate CLUT index value (%d)", v288, v289, v290, v291, v292, v293, v294, *(_WORD *)(v295 + 8));
                }
              }
              break;
            default:
              goto LABEL_330;
          }
        }
LABEL_249:
        v265 -= cfa;
        if (!v265) {
          return 1;
        }
      }
      outputStruct = "read_blocks";
      uint64_t v8 = "%s: input data not well-formed.";
      goto LABEL_454;
    }
  }
  return v90;
}

void sub_1000084AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  byte_100034018 = 1;
  if (byte_10004FB38)
  {
    BOOL v8 = !qword_10004FAE0 || dword_10004FAE8 == 0;
    if (!v8 && (sub_100002EE4() & 1) == 0)
    {
      sub_100005E1C("setting back to normal mode", a2, a3, a4, a5, a6, a7, a8, v19);
      IORegistryEntrySetCFProperty(dword_10004FAE8, @"NormalModeEnable", kCFBooleanTrue);
    }
  }
  if (qword_10004FAE0) {
    CFRelease((CFTypeRef)qword_10004FAE0);
  }
  if (dword_10004FB20 == 3) {
    globfree((glob_t *)&qword_10004FC48);
  }
  if (qword_10004FB30)
  {
    sub_10000C218(qword_10004FB30);
    if (qword_10004FB30) {
      operator delete();
    }
    qword_10004FB30 = 0;
  }
  if (qword_10004FB40)
  {
    sub_100003034("custom input files not all processed, remaining files below: ", a2, a3, a4, a5, a6, a7, a8, v19);
    for (i = (const char **)qword_10004FB40; qword_10004FB40; i = (const char **)qword_10004FB40)
    {
      uint64_t v17 = i[1];
      if (v17) {
        *((void *)v17 + 2) = i[2];
      }
      *(void *)i[2] = v17;
      uint64_t v18 = *i;
      if (!*i) {
        uint64_t v18 = "(null)";
      }
      sub_100005E1C("%s ", v9, v10, v11, v12, v13, v14, v15, (char)v18);
      free(i);
    }
  }
}

void sub_100008610(const char *a1)
{
  fprintf(__stderrp, "usage: %s [-n] [-C] (-F | -i <infile> | --fs | --launchd_boot)\n", a1);
  fwrite("\t-n: do not attempt mode change\n", 0x20uLL, 1uLL, __stderrp);
  fwrite("\t-C: do not ignore CDFD sections\n", 0x21uLL, 1uLL, __stderrp);
  fwrite("\t-F: get data from FDR\n", 0x17uLL, 1uLL, __stderrp);
  fwrite("\t-i: parse unsigned FDR file\n", 0x1DuLL, 1uLL, __stderrp);
  fwrite("\t--fs: read data from /System/Library/Display\n", 0x2EuLL, 1uLL, __stderrp);
  fwrite("\t--launchd_boot: default boot action for this device\n", 0x35uLL, 1uLL, __stderrp);
  fwrite("\t--latleak_bin: set bin (float) for lateral leakage interpolation\n", 0x42uLL, 1uLL, __stderrp);
  size_t v1 = fwrite("\t-v: enable additional parsing information\n", 0x2BuLL, 1uLL, __stderrp);
  sub_1000084AC(v1, v2, v3, v4, v5, v6, v7, v8);
  exit(2);
}

BOOL sub_100008710()
{
  int v0 = IOMobileFramebufferSetBlock();
  int v8 = v0;
  if (v0) {
    sub_100005E1C("Parser SetBlock failed with 0x%x", v1, v2, v3, v4, v5, v6, v7, v0);
  }
  return v8 == 0;
}

uint64_t sub_100008774(const __CFString *a1)
{
  return sub_100002E24(dword_10004FAE8, a1, 0xFFFFFFFFLL);
}

uint64_t sub_100008788(uint64_t a1)
{
  uint64_t v1 = *(_DWORD *)(a1 + 4) >> 8;
  if ((v1 - 5) > 0xFFFFFFFB) {
    operator new[]();
  }
  return printf("%s: Bad SPUC data version %d\n", "read_spuc", v1);
}

uint64_t sub_100008990(FILE *__stream)
{
  unsigned int __ptr = -1431655766;
  if (fread(&__ptr, 1uLL, 4uLL, __stream) != 4) {
    sub_100002F5C("Unexpected EOF on input", v1, v2, v3, v4, v5, v6, v7, v9);
  }
  return __ptr;
}

void sub_1000089E0(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!qword_10004FB30) {
    sub_100002F5C("No parser", a2, a3, a4, a5, a6, a7, a8, v27);
  }
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  __int16 v31 = -21846;
  sub_10000ABB8(qword_10004FB30, *a1, (char *)&v30);
  uint64_t v9 = 4 * (a1[2] - 3);
  uint64_t v10 = malloc_type_malloc(v9, 0x100004052888210uLL);
  if (!v10) {
    sub_100002F5C("Could not allocate memory for %s data\n", v11, v12, v13, v14, v15, v16, v17, (char)&v30);
  }
  uint64_t v18 = v10;
  sub_100008C20((FILE *)qword_100034008, v10, v9);
  int v29 = a1[2];
  uint64_t v28 = *(void *)a1;
  char v19 = sub_10000B14C(qword_10004FB30, (uint64_t)v18, v9, (int *)&v28);
  free(v18);
  if ((v19 & 1) == 0) {
    sub_100003034("Could not configure %s block\n", v20, v21, v22, v23, v24, v25, v26, (char)&v30);
  }
}

uint64_t sub_100008B10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100003034("%s", a2, a3, a4, a5, a6, a7, a8, a2);
}

FILE *sub_100008B3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = malloc_type_malloc(0x10uLL, 0x50040D3D5ADE1uLL);
  *uint64_t v4 = a1;
  v4[1] = a1 + a2;
  uint64_t v5 = funopen(v4, (int (__cdecl *)(void *, char *, int))sub_100008BC0, 0, 0, 0);
  if (!v5) {
    free(v4);
  }
  return v5;
}

uint64_t sub_100008BC0(uint64_t a1, void *__dst, unsigned int a3)
{
  unsigned int v3 = *(_DWORD *)(a1 + 8) - *(void *)a1;
  if (!v3) {
    return 0;
  }
  if ((int)v3 >= (int)a3) {
    uint64_t v5 = a3;
  }
  else {
    uint64_t v5 = v3;
  }
  memcpy(__dst, *(const void **)a1, (int)v5);
  *(void *)a1 += (int)v5;
  return v5;
}

size_t sub_100008C20(FILE *__stream, void *__ptr, size_t __nitems)
{
  int v3 = __nitems;
  size_t result = fread(__ptr, 1uLL, __nitems, __stream);
  if (result != v3) {
    sub_100002F5C("Unexpected EOF on input", v5, v6, v7, v8, v9, v10, v11, v12);
  }
  return result;
}

uint64_t sub_100008C68(FILE *__stream)
{
  unsigned __int16 __ptr = -21846;
  if (fread(&__ptr, 1uLL, 2uLL, __stream) != 2) {
    sub_100002F5C("Unexpected EOF on input", v1, v2, v3, v4, v5, v6, v7, v9);
  }
  return __ptr;
}

uint64_t sub_100008CB8(FILE *__stream)
{
  unsigned __int8 __ptr = -86;
  if (fread(&__ptr, 1uLL, 1uLL, __stream) != 1) {
    sub_100002F5C("Unexpected EOF on input", v1, v2, v3, v4, v5, v6, v7, v9);
  }
  return __ptr;
}

uint64_t sub_100008D08(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    unsigned int v9 = result;
    size_t result = 0;
    do
    {
      if (v9 > 0x46u)
      {
        if (v9 == 71)
        {
          size_t result = result | 2;
        }
        else
        {
          if (v9 != 82) {
LABEL_13:
          }
            sub_100002F5C("Illegal channel code", a2, a3, a4, a5, a6, a7, a8, v8);
          size_t result = result | 1;
        }
      }
      else if (v9 != 32)
      {
        if (v9 != 66) {
          goto LABEL_13;
        }
        size_t result = result | 4;
      }
      BOOL v10 = v9 > 0xFF;
      v9 >>= 8;
    }
    while (v10);
  }
  return result;
}

__int32 *sub_100008D80(__int32 __c, __int32 *__s, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v9 = *a3;
  if (v9 == 12) {
    sub_100002F5C("Too many index values for CLUT tables", (uint64_t)__s, v9, a4, a5, a6, a7, a8, v17);
  }
  char v12 = &__s[v9];
  size_t result = wmemchr(__s, __c, v9);
  if (result) {
    uint64_t v14 = result;
  }
  else {
    uint64_t v14 = v12;
  }
  uint64_t v15 = v14 - __s;
  uint64_t v16 = *a3;
  if (v15 == v16)
  {
    *a3 = v16 + 1;
    __s[v15] = __c;
    return (__int32 *)std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>();
  }
  return result;
}

void sub_100008E24(void *a1)
{
}

_DWORD *sub_100008E38(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a5;
  int v9 = a3;
  int v10 = a2;
  uint64_t v11 = &qword_100034910;
  if ((unsigned __int16)word_1000348FC != a1)
  {
    uint64_t v11 = &qword_100034918;
    if (*(float *)&dword_100034900 == 0.0 || (unsigned __int16)word_1000348FC + 1 != a1)
    {
      if (a4)
      {
        uint64_t v13 = (_DWORD *)qword_100034920;
        if (qword_100034920 || (uint64_t v13 = malloc_type_malloc(0xDB8uLL, 0x1020040D1459293uLL)) != 0)
        {
          bzero(v13, 0xDB8uLL);
          v13[8] = 2;
          v13[3] = v8;
          v13[4] = v9;
          v13[2] = v10;
          qword_100034920 = (uint64_t)v13;
          return v13;
        }
LABEL_20:
        sub_100002F5C("out of memory", v14, v15, v16, v17, v18, v19, v20, v23);
      }
      return 0;
    }
  }
  uint64_t v13 = (_DWORD *)*v11;
  if (!*v11)
  {
LABEL_14:
    if (a4)
    {
      uint64_t v21 = malloc_type_malloc(0xDB8uLL, 0x1020040D1459293uLL);
      if (v21)
      {
        uint64_t v13 = v21;
        bzero(v21, 0xDB8uLL);
        v13[8] = 2;
        v13[3] = v8;
        v13[4] = v9;
        v13[2] = v10;
        *(void *)uint64_t v13 = *v11;
        *uint64_t v11 = (uint64_t)v13;
        return v13;
      }
      goto LABEL_20;
    }
    return 0;
  }
  while (v13[2] != a2 || v13[4] != a3)
  {
    uint64_t v13 = *(_DWORD **)v13;
    if (!v13) {
      goto LABEL_14;
    }
  }
  if ((v13[5] & a4) != 0) {
    sub_100002F5C("Duplicate PDC table (bin=%d temp=%d bright=%d chan=%X) found in input.", a2, a3, a4, a5, a6, a7, a8, a1);
  }
  return v13;
}

__int32 *sub_100008FA8(__int32 __c, __int32 *__s, _WORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v9 = (unsigned __int16)*a3;
  if (v9 == 20) {
    sub_100002F5C("Too many index values for CLUT tables", (uint64_t)__s, 20, a4, a5, a6, a7, a8, v17);
  }
  char v12 = &__s[v9];
  size_t result = wmemchr(__s, __c, v9);
  if (result) {
    uint64_t v14 = result;
  }
  else {
    uint64_t v14 = v12;
  }
  uint64_t v15 = v14 - __s;
  uint64_t v16 = (unsigned __int16)*a3;
  if (v15 == v16)
  {
    *a3 = v16 + 1;
    __s[v15] = __c;
    return (__int32 *)std::__sort<std::__less<int,int> &,int *>();
  }
  return result;
}

uint64_t sub_100009048(uint64_t result, uint64_t a2, _WORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (unsigned __int16)*a3;
  if (v8 == 20) {
    sub_100002F5C("Too many index values for CLUT tables", a2, (uint64_t)a3, a4, a5, a6, a7, a8, vars0);
  }
  if (*a3)
  {
    uint64_t v9 = 0;
    while (1)
    {
      int v10 = *(_DWORD *)(a2 + 4 * v9);
      if (v10 == result) {
        break;
      }
      if (v10 > (int)result) {
        goto LABEL_9;
      }
      if (v8 == ++v9)
      {
        LODWORD(v9) = (unsigned __int16)*a3;
        goto LABEL_12;
      }
    }
  }
  else
  {
    LODWORD(v9) = 0;
LABEL_9:
    if (v9 < v8)
    {
      int v11 = (unsigned __int16)*a3;
      int v12 = v11;
      do
      {
        *(_DWORD *)(a2 + 4 * (unsigned __int16)v12--) = *(_DWORD *)(a2 + 4 * (v11 - 1));
        int v11 = (unsigned __int16)v12;
      }
      while ((unsigned __int16)v12 > (unsigned __int16)v9);
    }
LABEL_12:
    *(_DWORD *)(a2 + 4 * v9) = result;
    *a3 = v8 + 1;
  }
  return result;
}

uint64_t sub_1000090E0(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3;
  int v9 = a2;
  uint64_t v11 = qword_10004FAB8;
  if (qword_10004FAB8)
  {
    while (*(_DWORD *)(v11 + 76) != a2 || *(_DWORD *)(v11 + 80) != a3 || *(_DWORD *)(v11 + 72) != a1)
    {
      uint64_t v11 = *(void *)v11;
      if (!v11) {
        goto LABEL_6;
      }
    }
    if ((*(_WORD *)(v11 + 84) & (unsigned __int16)a4) != 0) {
      sub_100002F5C("Duplicate 3LUT table (bin=%d temp=%d bright=%d chan=%X) found in input.", a2, a3, a4, a5, a6, a7, a8, a1);
    }
  }
  else
  {
LABEL_6:
    if (a4)
    {
      int v12 = malloc_type_malloc(0x58uLL, 0x1020040461574A3uLL);
      if (!v12) {
        sub_100002F5C("out of memory", v13, v14, v15, v16, v17, v18, v19, v21);
      }
      uint64_t v11 = (uint64_t)v12;
      bzero(v12, 0x58uLL);
      *(_DWORD *)(v11 + 72) = a1;
      *(_DWORD *)(v11 + 76) = v9;
      *(_DWORD *)(v11 + 80) = v8;
      *(void *)uint64_t v11 = qword_10004FAB8;
      qword_10004FAB8 = v11;
    }
    else
    {
      return 0;
    }
  }
  return v11;
}

uint64_t sub_1000091D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float a9)
{
  uint64_t v9 = qword_10004FAB8;
  if (!qword_10004FAB8) {
LABEL_35:
  }
    sub_100002F5C("missing entry", a2, a3, a4, a5, a6, a7, a8, v48);
  int v12 = *((_DWORD *)&unk_10004F870 + a4);
  int v13 = *((_DWORD *)&unk_10004F870 + a5 + 20);
  uint64_t v14 = qword_10004FAB8;
  while (*(_DWORD *)(v14 + 76) != v12
       || *(_DWORD *)(v14 + 80) != v13
       || *(_DWORD *)(v14 + 72) != dword_10004F868[a3 + 109])
  {
    uint64_t v14 = *(void *)v14;
    if (!v14) {
      goto LABEL_35;
    }
  }
  if (a9 == 0.0)
  {
    uint64_t v9 = 0;
  }
  else
  {
    while (*(_DWORD *)(v9 + 76) != v12
         || *(_DWORD *)(v9 + 80) != v13
         || *(_DWORD *)(v9 + 72) != *((_DWORD *)&qword_100034000 + a3 + 28296))
    {
      uint64_t v9 = *(void *)v9;
      if (!v9) {
        goto LABEL_35;
      }
    }
  }
  uint64_t v15 = 0;
  uint64_t v16 = 6;
  if (*(_WORD *)(a1 + 58) != 1) {
    uint64_t v16 = 0;
  }
  uint64_t v17 = (_WORD *)(a2 + v16);
  LOWORD(v16) = *(_WORD *)(a1 + 50);
  do
  {
    *(_DWORD *)(*(void *)a1 + 16 * (unsigned __int16)v16) = *(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 24);
    uint64_t v18 = *(void *)(v14 + 8 * v15 + 24);
    *(void *)(a1 + 8) = 0;
    if (v9)
    {
      uint64_t v19 = (unsigned __int16 *)(v18 + 10);
      uint64_t v20 = (unsigned __int16 *)(*(void *)(v9 + 8 * v15 + 24) + 10);
      uint64_t v21 = 4913;
      do
      {
        unsigned int v23 = *v19++;
        unsigned int v22 = v23;
        int v24 = *v20++;
        unsigned int v25 = (int)((float)((float)v22 + (float)(a9 * (float)(int)(v24 - v22))) + 0.5);
        sub_100009728(a1, v25, a3, a4, a5, a6, a7, a8);
        uint64_t result = sub_100009728(a1, v25 >> 8, v26, v27, v28, v29, v30, v31);
        --v21;
      }
      while (v21);
    }
    else
    {
      uint64_t v33 = (unsigned __int16 *)(v18 + 10);
      uint64_t v34 = 4913;
      do
      {
        unsigned int v35 = *v33++;
        sub_100009728(a1, v35, a3, a4, a5, a6, a7, a8);
        uint64_t result = sub_100009728(a1, v35 >> 8, v36, v37, v38, v39, v40, v41);
        --v34;
      }
      while (v34);
    }
    uint64_t v42 = *(void *)a1;
    uint64_t v43 = *(void *)(a1 + 8);
    uint64_t v44 = *(unsigned __int16 *)(a1 + 50);
    char v45 = (unsigned int *)(*(void *)a1 + 16 * v44);
    *((void *)v45 + 1) = v43;
    if (v44)
    {
      uint64_t v46 = 0;
      uint64_t v47 = (void *)(v42 + 8);
      while (1)
      {
        if (*v47 == v43)
        {
          uint64_t result = memcmp((const void *)(*(void *)(a1 + 24) + *((unsigned int *)v47 - 2)), (const void *)(*(void *)(a1 + 24) + *v45), 0x2662uLL);
          if (!result) {
            break;
          }
        }
        ++v46;
        v47 += 2;
        if (v44 == v46) {
          goto LABEL_26;
        }
      }
      LOWORD(v44) = v46;
    }
LABEL_26:
    *v17++ = v44;
    uint64_t v16 = *(unsigned __int16 *)(a1 + 50);
    if (v16 == (unsigned __int16)v44)
    {
      LOWORD(v16) = v44 + 1;
      *(_WORD *)(a1 + 50) = v44 + 1;
    }
    else
    {
      *(void *)(a1 + 32) = *(void *)(a1 + 24) + *(unsigned int *)(*(void *)a1 + 16 * v16);
    }
    ++v15;
  }
  while (v15 != 3);
  return result;
}

uint64_t sub_100009450(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float a9)
{
  uint64_t v9 = qword_10004FAB8;
  if (!qword_10004FAB8) {
LABEL_46:
  }
    sub_100002F5C("missing entry", a2, a3, a4, a5, a6, a7, a8, v50);
  uint64_t v10 = result;
  int v11 = *((_DWORD *)&unk_10004F870 + a4);
  int v12 = *((_DWORD *)&unk_10004F870 + a5 + 20);
  uint64_t v13 = qword_10004FAB8;
  while (*(_DWORD *)(v13 + 76) != v11
       || *(_DWORD *)(v13 + 80) != v12
       || *(_DWORD *)(v13 + 72) != dword_10004F868[a3 + 109])
  {
    uint64_t v13 = *(void *)v13;
    if (!v13) {
      goto LABEL_46;
    }
  }
  if (a9 == 0.0)
  {
    uint64_t v9 = 0;
  }
  else
  {
    while (*(_DWORD *)(v9 + 76) != v11
         || *(_DWORD *)(v9 + 80) != v12
         || *(_DWORD *)(v9 + 72) != *((_DWORD *)&qword_100034000 + a3 + 28296))
    {
      uint64_t v9 = *(void *)v9;
      if (!v9) {
        goto LABEL_46;
      }
    }
  }
  uint64_t v14 = 0;
  uint64_t v51 = v9;
  do
  {
    *(void *)(v10 + 8) = 0;
    uint64_t v15 = *(void *)(v13 + 8 * v14 + 48);
    if (v9 && v15 != *(void *)(v9 + 8 * v14 + 48)) {
      sub_100002F5C("No support curve interpolation", a2, a3, a4, a5, a6, a7, a8, v50);
    }
    uint64_t v53 = v14;
    unint64_t v16 = *(void *)(v10 + 32);
    uint64_t v17 = *(char **)(v10 + 40);
    if ((unint64_t)v17 < v16)
    {
      int v18 = 0;
      size_t v19 = *(unsigned __int16 *)(v15 + 12);
      while (1)
      {
        int v20 = *v17;
        uint64_t v21 = v17 + 3;
        int v22 = *(unsigned __int16 *)(v17 + 1);
        if (v19 == v22)
        {
          uint64_t result = memcmp(*(const void **)(v15 + 16), v21, v19);
          BOOL v23 = result == 0;
        }
        else
        {
          BOOL v23 = 0;
        }
        uint64_t v17 = &v21[v22];
        if (v20 == 1)
        {
          unsigned int v26 = *(unsigned __int16 *)v17;
          int v24 = v17 + 2;
          size_t v25 = v26;
          if (*(unsigned __int16 *)(v15 + 14) == v26)
          {
            uint64_t result = memcmp(*(const void **)(v15 + 24), v24, v25);
            BOOL v27 = result == 0;
          }
          else
          {
            BOOL v27 = 0;
          }
          uint64_t v17 = &v24[v25];
          if (!v23) {
            goto LABEL_28;
          }
        }
        else
        {
          BOOL v27 = 1;
          if (!v23) {
            goto LABEL_28;
          }
        }
        if (v20 != *(unsigned __int8 *)(v15 + 8)) {
          BOOL v27 = 0;
        }
        if (v27) {
          goto LABEL_31;
        }
LABEL_28:
        ++v18;
        if ((unint64_t)v17 >= v16) {
          goto LABEL_31;
        }
      }
    }
    int v18 = 0;
LABEL_31:
    if (v18 == *(unsigned __int16 *)(v10 + 54))
    {
      sub_100009728(v10, *(unsigned __int8 *)(v15 + 8), a3, a4, a5, a6, a7, a8);
      unsigned int v28 = *(unsigned __int16 *)(v15 + 12);
      sub_100009728(v10, *(_WORD *)(v15 + 12), v29, v30, v31, v32, v33, v34);
      uint64_t result = sub_100009728(v10, v28 >> 8, v35, v36, v37, v38, v39, v40);
      if (*(_WORD *)(v15 + 12))
      {
        unint64_t v41 = 0;
        do
          uint64_t result = sub_100009728(v10, *(unsigned __int8 *)(*(void *)(v15 + 16) + v41++), a3, a4, a5, a6, a7, a8);
        while (v41 < *(unsigned __int16 *)(v15 + 12));
      }
      if (*(unsigned char *)(v15 + 8) == 1)
      {
        unsigned int v42 = *(unsigned __int16 *)(v15 + 14);
        sub_100009728(v10, *(_WORD *)(v15 + 14), a3, a4, a5, a6, a7, a8);
        uint64_t result = sub_100009728(v10, v42 >> 8, v43, v44, v45, v46, v47, v48);
        if (*(_WORD *)(v15 + 14))
        {
          unint64_t v49 = 0;
          do
            uint64_t result = sub_100009728(v10, *(unsigned __int8 *)(*(void *)(v15 + 24) + v49++), a3, a4, a5, a6, a7, a8);
          while (v49 < *(unsigned __int16 *)(v15 + 14));
        }
      }
      ++*(_WORD *)(v10 + 54);
    }
    *(_WORD *)(a2 + 2 * v53) = v18;
    uint64_t v14 = v53 + 1;
    uint64_t v9 = v51;
  }
  while (v53 != 2);
  return result;
}

uint64_t sub_100009728(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = *(unsigned char **)(result + 32);
  if ((uint64_t)&v8[-*(void *)(result + 24)] >= *(unsigned int *)(result + 16)) {
    sub_100002F5C("output buffer overflow", a2, a3, a4, a5, a6, a7, a8, vars0);
  }
  *(void *)(result + 32) = v8 + 1;
  *int v8 = a2;
  *(void *)(result + 8) = a2 ^ __ROR8__(*(void *)(result + 8), 7);
  return result;
}

void sub_100009778(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_1000097CC((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_1000097CC(uint64_t *a1)
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

uint64_t sub_10000981C(uint64_t a1, const std::string *a2, int a3)
{
  uint64_t v6 = std::streambuf::basic_streambuf();
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_DWORD *)(v6 + 96) = a3;
  std::string::operator=((std::string *)(v6 + 64), a2);
  sub_1000098BC(a1);
  return a1;
}

void sub_100009898(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 87) < 0) {
    operator delete(*v2);
  }
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

void sub_1000098BC(uint64_t a1)
{
  *(void *)(a1 + 88) = 0;
  uint64_t v2 = (std::string *)(a1 + 64);
  char v3 = *(unsigned char *)(a1 + 87);
  if (v3 < 0)
  {
    uint64_t v4 = *(std::string **)(a1 + 64);
    unint64_t v5 = *(void *)(a1 + 72);
  }
  else
  {
    uint64_t v4 = v2;
    unint64_t v5 = *(unsigned __int8 *)(a1 + 87);
  }
  int v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = (char *)v4 + v5;
  }
  if ((v6 & 0x10) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    std::string::size_type v7 = v3 < 0 ? (*(void *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22;
    std::string::resize(v2, v7, 0);
    uint64_t v8 = *(char *)(a1 + 87) < 0 ? *(void *)(a1 + 72) : *(unsigned __int8 *)(a1 + 87);
    *(void *)(a1 + 40) = v4;
    *(void *)(a1 + 48) = v4;
    *(void *)(a1 + 56) = (char *)v4 + v8;
    if ((*(unsigned char *)(a1 + 96) & 3) != 0)
    {
      if (v5 >> 31)
      {
        uint64_t v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        unint64_t v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
        uint64_t v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
        unint64_t v5 = v5 - v10 - 0x7FFFFFFF;
        *(void *)(a1 + 48) = v4;
      }
      if (v5) {
        *(void *)(a1 + 48) = (char *)v4 + v5;
      }
    }
  }
}

uint64_t sub_1000099D0(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_100009CF0();
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
  int v18 = a1 + 2;
  if (v9) {
    unint64_t v10 = (char *)sub_100009D08(v7, v9);
  }
  else {
    unint64_t v10 = 0;
  }
  int v11 = &v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  unint64_t v16 = v11;
  uint64_t v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_100009AFC(v11, *(void **)a2, *((void *)a2 + 1));
    int v11 = v16;
  }
  else
  {
    long long v12 = *a2;
    *((void *)v11 + 2) = *((void *)a2 + 2);
    *(_OWORD *)int v11 = v12;
  }
  unint64_t v16 = v11 + 24;
  sub_100009C78(a1, v15);
  uint64_t v13 = a1[1];
  sub_100009E74((uint64_t)v15);
  return v13;
}

void sub_100009AE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *sub_100009AFC(unsigned char *__dst, void *__src, unint64_t a3)
{
  unint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_100009B9C();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    unint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *unint64_t v5 = v8;
    unint64_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

void sub_100009B9C()
{
}

void sub_100009BB4(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100009C10(exception, a1);
}

void sub_100009BFC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100009C10(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100009C44()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t sub_100009C78(uint64_t *a1, void *a2)
{
  uint64_t result = sub_100009D50((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void sub_100009CF0()
{
}

void *sub_100009D08(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_100009C44();
  }
  return operator new(24 * a2);
}

uint64_t sub_100009D50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
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
  LOBYTE(v13) = 1;
  sub_100009DF4((uint64_t)v12);
  return a6;
}

uint64_t sub_100009DF4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_100009E2C(a1);
  }
  return a1;
}

void sub_100009E2C(uint64_t a1)
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

uint64_t sub_100009E74(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_100009EAC(uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

uint64_t sub_100009F04(uint64_t a1)
{
  return a1;
}

__n128 sub_100009F4C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_100009F60(uint64_t a1, int *a2, int *a3)
{
  int v3 = *a2;
  *a3 = *a2;
  int v4 = a2[1];
  a3[1] = v4;
  int v5 = a2[2];
  a3[2] = v5;
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  unsigned int v7 = !v6;
  if (v3) {
    return v7;
  }
  else {
    return 0;
  }
}

uint64_t sub_100009F90(uint64_t a1, int *a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 3904);
  BOOL v3 = v2 >= 0xC;
  unsigned int v4 = v2 - 12;
  if (!v3) {
    return 0;
  }
  int v5 = *(int **)(a1 + 3896);
  int v6 = *v5;
  *a2 = *v5;
  int v7 = v5[1];
  a2[1] = v7;
  int v8 = v5[2];
  a2[2] = v8;
  if (!v6) {
    return 0;
  }
  if (!v7 || v8 == 0) {
    return 0;
  }
  *(void *)(a1 + 3896) = v5 + 3;
  *(_DWORD *)(a1 + 3904) = v4;
  return 1;
}

uint64_t sub_100009FE4(uint64_t a1, unsigned __int8 *a2, int a3)
{
  switch(a3)
  {
    case 1:
      uint64_t result = *a2;
      break;
    case 2:
      uint64_t result = *(unsigned __int16 *)a2;
      break;
    case 3:
      uint64_t result = *(unsigned __int16 *)a2 | (a2[2] << 16);
      break;
    case 4:
      uint64_t result = *(unsigned int *)a2;
      break;
    default:
      uint64_t result = 0xFFFFFFFFLL;
      break;
  }
  return result;
}

uint64_t sub_10000A050(uint64_t a1, unsigned __int8 *a2, int a3)
{
  unsigned int v3 = -1;
  switch(a3)
  {
    case 1:
      return *a2;
    case 2:
      return *(unsigned __int16 *)a2;
    case 3:
      return *(unsigned __int16 *)a2 | (a2[2] << 16);
    case 4:
      return *(unsigned int *)a2;
    case 8:
      return *(void *)a2;
    default:
      return v3;
  }
}

uint64_t sub_10000A0D4(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = *(unsigned __int8 **)(a1 + 3896);
  switch(a2)
  {
    case 1u:
      uint64_t v3 = *v2;
      break;
    case 2u:
      uint64_t v3 = *(unsigned __int16 *)v2;
      break;
    case 3u:
      uint64_t v3 = *(unsigned __int16 *)v2 | (v2[2] << 16);
      break;
    case 4u:
      uint64_t v3 = *(unsigned int *)v2;
      break;
    default:
      uint64_t v3 = 0xFFFFFFFFLL;
      break;
  }
  *(void *)(a1 + 3896) = &v2[a2];
  unsigned int v4 = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v4 - a2;
  if (v4 < a2) {
    puts("e: data_sz underflow in get_value");
  }
  return v3;
}

uint64_t sub_10000A184(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = *(unsigned __int8 **)(a1 + 3896);
  unsigned int v3 = -1;
  switch(a2)
  {
    case 1u:
      unsigned int v3 = *v2;
      goto LABEL_6;
    case 2u:
      unsigned int v3 = *(unsigned __int16 *)v2;
      goto LABEL_6;
    case 3u:
      unsigned int v3 = *(unsigned __int16 *)v2 | (v2[2] << 16);
      goto LABEL_6;
    case 4u:
      unsigned int v3 = *(_DWORD *)v2;
      goto LABEL_6;
    case 8u:
      uint64_t v4 = *(void *)v2;
      goto LABEL_7;
    default:
LABEL_6:
      uint64_t v4 = v3;
LABEL_7:
      *(void *)(a1 + 3896) = &v2[a2];
      unsigned int v5 = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v5 - a2;
      if (v5 < a2) {
        puts("e: data_sz underflow in get_long_value");
      }
      return v4;
  }
}

uint64_t sub_10000A24C(uint64_t result, unsigned int a2)
{
  *(void *)(result + 3896) += a2;
  unsigned int v2 = *(_DWORD *)(result + 3904);
  *(_DWORD *)(result + 3904) = v2 - a2;
  if (v2 < a2) {
    return puts("e: data_sz underflow in skip_section");
  }
  return result;
}

BOOL sub_10000A278(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 3904);
  if (v2 >= a2)
  {
    *(void *)(a1 + 3896) += a2;
    *(_DWORD *)(a1 + 3904) = v2 - a2;
  }
  return v2 >= a2;
}

BOOL sub_10000A2A0(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 3904);
  if (v2 >= a2) {
    *(_DWORD *)(a1 + 3904) = a2;
  }
  return v2 >= a2;
}

void sub_10000A2BC(float a1, uint64_t a2, uint64_t a3, int a4, __int16 *a5, float *a6)
{
  if (!a4)
  {
    LODWORD(v6) = 0;
    if (!a5) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  uint64_t v6 = 0;
  while (*(float *)(a3 + 4 * v6) < a1)
  {
    if (a4 == ++v6)
    {
      LODWORD(v6) = a4;
      break;
    }
  }
  if (a5)
  {
LABEL_7:
    if (v6 <= 1) {
      __int16 v7 = 1;
    }
    else {
      __int16 v7 = v6;
    }
    *a5 = v7;
  }
LABEL_11:
  if (a6)
  {
    float v8 = 0.0;
    if ((int)v6 - 1 < (a4 - 2)) {
      float v8 = (float)(a1 - *(float *)(a3 + 4 * (v6 - 1)))
    }
         / (float)(*(float *)(a3 + 4 * v6) - *(float *)(a3 + 4 * (v6 - 1)));
    *a6 = v8;
  }
}

uint64_t sub_10000A334(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v5 = result;
  float v6 = *(float *)(result + 2140);
  if (v6 != 0.0)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_10:
    LODWORD(v7) = 0;
    goto LABEL_11;
  }
  uint64_t result = (*(uint64_t (**)(const __CFString *, void))(result + 8))(@"FFR_raw_index", *(void *)(result + 16));
  float v6 = (float)result * 0.000015259;
  if (result == -1) {
    float v6 = 0.5;
  }
  if (!a3) {
    goto LABEL_10;
  }
LABEL_3:
  uint64_t v7 = 0;
  while (*(float *)(a2 + 4 * v7) < v6)
  {
    if (a3 == ++v7)
    {
      LODWORD(v7) = a3;
      break;
    }
  }
LABEL_11:
  unsigned int v8 = v7 - 1;
  if (v7 <= 1) {
    __int16 v9 = 1;
  }
  else {
    __int16 v9 = v7;
  }
  *(_WORD *)(v5 + 2128) = v9;
  float v10 = 0.0;
  if (v8 < a3 - 2) {
    float v10 = (float)(v6 - *(float *)(a2 + 4 * v8))
  }
        / (float)(*(float *)(a2 + 4 * v7) - *(float *)(a2 + 4 * v8));
  *(float *)(v5 + 2132) = v10;
  *(unsigned char *)(v5 + 2136) = 1;
  return result;
}

uint64_t sub_10000A40C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, float a5)
{
  float v10 = *(float *)(a1 + 2140);
  if (v10 == 0.0)
  {
    unsigned int v11 = (*(uint64_t (**)(const __CFString *, void))(a1 + 8))(@"FFR_raw_index", *(void *)(a1 + 16));
    if (v11 == -1) {
      float v10 = 0.5;
    }
    else {
      float v10 = (float)v11 * 0.000015259;
    }
  }
  float v12 = *(float *)(a1 + 2144);
  if (v12 != 0.0)
  {
    if (a4) {
      goto LABEL_7;
    }
LABEL_14:
    LODWORD(v13) = 0;
    goto LABEL_15;
  }
  unsigned int v14 = (*(uint64_t (**)(const __CFString *, void))(a1 + 8))(@"FFR_raw_high_index", *(void *)(a1 + 16));
  float v12 = (float)v14 * 0.000015259;
  if (v14 == -1) {
    float v12 = 0.5;
  }
  if (!a4) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v13 = 0;
  while (*(float *)(a2 + 4 * v13) < v10)
  {
    if (a4 == ++v13)
    {
      LODWORD(v13) = a4;
      break;
    }
  }
LABEL_15:
  unsigned int v15 = a4 - 2;
  float v16 = 0.0;
  if ((int)v13 - 1 < (a4 - 2)) {
    float v16 = (float)(v10 - *(float *)(a2 + 4 * (v13 - 1)))
  }
        / (float)(*(float *)(a2 + 4 * v13) - *(float *)(a2 + 4 * (v13 - 1)));
  if (a4)
  {
    uint64_t v17 = 0;
    while (*(float *)(a3 + 4 * v17) < v12)
    {
      if (a4 == ++v17)
      {
        LODWORD(v17) = a4;
        break;
      }
    }
  }
  else
  {
    LODWORD(v17) = 0;
  }
  float v18 = 0.0;
  if ((int)v17 - 1 < v15) {
    float v18 = (float)(v12 - *(float *)(a3 + 4 * (v17 - 1)))
  }
        / (float)(*(float *)(a3 + 4 * v17) - *(float *)(a3 + 4 * (v17 - 1)));
  if (v17 <= 1) {
    LOWORD(v17) = 1;
  }
  if (v13 <= 1) {
    LOWORD(v13) = 1;
  }
  float v19 = v16 + (float)(unsigned __int16)v13;
  float v20 = v18 + (float)(unsigned __int16)v17;
  float v21 = (float)((float)(1.0 - a5) * v20) + (float)(a5 * v19);
  uint64_t result = printf("i: PDC mix bin %g and bin %g with %g --> %g\n", v19, v20, a5, v21);
  *(_WORD *)(a1 + 2128) = v21;
  int v23 = (unsigned __int16)v21;
  float v24 = v21 - (float)v23;
  if (v23 > v15) {
    float v24 = 0.0;
  }
  *(float *)(a1 + 2132) = v24;
  *(unsigned char *)(a1 + 2136) = 1;
  return result;
}

uint64_t sub_10000A608(uint64_t a1, unsigned int a2)
{
  uint64_t result = 0;
  if (a2)
  {
    do
    {
      if (a2 > 0x46u)
      {
        if (a2 == 71)
        {
          uint64_t result = result | 2;
        }
        else
        {
          if (a2 != 82)
          {
LABEL_12:
            printf("e: Illegal channel code %c\n", a2);
            return 0;
          }
          uint64_t result = result | 1;
        }
      }
      else if (a2 != 32)
      {
        if (a2 != 66) {
          goto LABEL_12;
        }
        uint64_t result = result | 4;
      }
      BOOL v3 = a2 > 0xFF;
      a2 >>= 8;
    }
    while (v3);
  }
  return result;
}

_DWORD *sub_10000A69C(uint64_t a1, int a2, int a3, unsigned int a4, unsigned int a5, int a6, int a7, int a8)
{
  int v14 = *(unsigned __int16 *)(a1 + 2128);
  if (v14 != a3 && (*(float *)(a1 + 2132) == 0.0 || v14 + 1 != a3))
  {
    if (a6)
    {
      uint64_t v16 = *(void *)(a1 + 2216);
      if (v16)
      {
        if (*(_DWORD *)(v16 + 32) == 5)
        {
          uint64_t v17 = *(void **)(v16 + 48);
          if (v17)
          {
            *(void *)(v16 + 48) = 0;
            free(v17);
            uint64_t v16 = *(void *)(a1 + 2216);
          }
        }
        free((void *)v16);
        *(void *)(a1 + 2216) = 0;
      }
      float v18 = malloc_type_calloc(1uLL, 0xDB8uLL, 0x1020040D1459293uLL);
      float v19 = v18;
      if (v18)
      {
        bzero(v18, 0xDB8uLL);
        v19[8] = a2;
        v19[3] = a7;
        v19[4] = a5;
        v19[2] = a4;
        v19[6] = a8;
      }
      else
      {
        puts("e: Out of memory");
      }
      *(void *)(a1 + 2216) = v19;
      return v19;
    }
    return 0;
  }
  if (v14 == a3) {
    uint64_t v20 = 2200;
  }
  else {
    uint64_t v20 = 2208;
  }
  float v19 = *(_DWORD **)(a1 + v20);
  if (!v19)
  {
LABEL_23:
    if (a6)
    {
      float v21 = malloc_type_calloc(1uLL, 0xDB8uLL, 0x1020040D1459293uLL);
      float v19 = v21;
      if (v21)
      {
        bzero(v21, 0xDB8uLL);
        v19[8] = a2;
        v19[3] = a7;
        v19[4] = a5;
        v19[2] = a4;
        v19[6] = a8;
        *(void *)float v19 = *(void *)(a1 + v20);
        *(void *)(a1 + v20) = v19;
      }
      else
      {
        puts("e: Out of memory");
      }
      return v19;
    }
    return 0;
  }
  while (v19[2] != a4 || v19[4] != a5 || v19[6] != a8 || v19[3] != a7)
  {
    float v19 = *(_DWORD **)v19;
    if (!v19) {
      goto LABEL_23;
    }
  }
  if ((v19[5] & a6) != 0)
  {
    printf("e: Duplicate PDC table (bin=%d temp=%d bright=%d sf=%d param=%d chan=%X) found in input.\n", a3, HIWORD(a4), HIWORD(a5), a7, a8, a6);
    return 0;
  }
  return v19;
}

void sub_10000A888(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a2 == 5)
  {
    unsigned int v2 = *(void **)(a2 + 16);
    if (v2)
    {
      *(void *)(a2 + 16) = 0;
      free(v2);
    }
  }
}

uint64_t *sub_10000A8A8(uint64_t a1, int a2, int a3, int a4, int a5)
{
  uint64_t v5 = 3608;
  if (*(_DWORD *)(a1 + 3564) == a5) {
    uint64_t v5 = 3600;
  }
  for (uint64_t result = *(uint64_t **)(a1 + v5); result; uint64_t result = (uint64_t *)*result)
  {
    if (*((_DWORD *)result + 664) == a2 && *((_DWORD *)result + 665) == a3 && *((_DWORD *)result + 666) == a4) {
      break;
    }
  }
  return result;
}

_WORD *sub_10000A8F4(uint64_t a1, int a2, int a3)
{
  __int16 v3 = a2;
  for (uint64_t i = *(uint64_t **)(a1 + 3776); i; uint64_t i = (uint64_t *)*i)
  {
    if (*((unsigned __int16 *)i + 4) == a2)
    {
      int v6 = *(_DWORD *)((char *)i + 10);
      if (v6 == 2)
      {
        if (*((unsigned __int16 *)i + 16) == a3)
        {
LABEL_11:
          printf("e: Duplicate PTUC table vers=%d (bright=%d, temp=%d) found in input.\n", v6, a2, a3);
          return 0;
        }
      }
      else if (v6 == 1)
      {
        goto LABEL_11;
      }
    }
  }
  uint64_t v7 = malloc_type_calloc(1uLL, 0x20F8uLL, 0x10200406EB0A314uLL);
  unsigned int v8 = v7;
  if (v7)
  {
    bzero(v7, 0x20F8uLL);
    v8[4] = v3;
    *(void *)unsigned int v8 = *(void *)(a1 + 3776);
    *(void *)(a1 + 3776) = v8;
  }
  else
  {
    puts("e: Out of memory");
  }
  return v8;
}

uint64_t sub_10000A9E0(uint64_t a1, int a2)
{
  return (a2 & 0xFFFFC000) + (((a2 & 0x3FFF) != 0) << 14);
}

uint64_t sub_10000A9F4(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = a1 + 8 * a3;
  uint64_t v4 = *(void *)(v3 + 2488);
  if (v4)
  {
    uint64_t v5 = *(uint64_t **)(v3 + 2488);
    while (*(_DWORD *)(a2 + 12) != *((_DWORD *)v5 + 3)
         || *(_DWORD *)(a2 + 8) != *((_DWORD *)v5 + 2)
         || *(_DWORD *)(a2 + 16) != *((_DWORD *)v5 + 4))
    {
      uint64_t v5 = (uint64_t *)*v5;
      if (!v5) {
        goto LABEL_7;
      }
    }
    puts("e: duplicate tables");
    return 0;
  }
  else
  {
LABEL_7:
    *(void *)a2 = v4;
    *(void *)(v3 + 2488) = a2;
    return 1;
  }
}

uint64_t sub_10000AA74(uint64_t a1, int *a2, _DWORD *a3, unsigned int a4, int a5, _DWORD *a6)
{
  char v20 = -86;
  int v19 = -1431655766;
  uint64_t v6 = (a2[2] - 3);
  if (a4 > v6) {
    int v7 = a5;
  }
  else {
    int v7 = 0;
  }
  if (a4 < v6) {
    int v8 = 1;
  }
  else {
    int v8 = v7;
  }
  if (v8 == 1)
  {
    int v9 = *a2;
    v18[0] = HIBYTE(*a2);
    v18[1] = BYTE2(v9);
    v18[2] = BYTE1(v9);
    v18[3] = v9;
    v18[4] = 0;
    printf("e: invalid block length for block %s\n", v18);
  }
  else
  {
    if (a6) {
      *a6 = v6;
    }
    if (v6)
    {
      uint64_t v13 = v6;
      int v14 = a3;
      do
      {
        unsigned int v15 = *(int **)(a1 + 3896);
        int v16 = *v15;
        *(void *)(a1 + 3896) = v15 + 1;
        LODWORD(v15) = *(_DWORD *)(a1 + 3904);
        *(_DWORD *)(a1 + 3904) = v15 - 4;
        if (v15 < 4) {
          puts("e: data_sz underflow in get_value");
        }
        *v14++ = v16;
        --v13;
      }
      while (v13);
    }
    if (a4 > v6) {
      bzero(&a3[v6], 4 * (a4 - v6));
    }
  }
  return v8 ^ 1u;
}

char *sub_10000ABB8(uint64_t a1, int a2, char *a3)
{
  if (a3) {
    uint64_t result = a3;
  }
  else {
    uint64_t result = &byte_10004FD28;
  }
  *uint64_t result = HIBYTE(a2);
  result[1] = BYTE2(a2);
  result[2] = BYTE1(a2);
  result[3] = a2;
  result[4] = 0;
  return result;
}

BOOL sub_10000ABEC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  BOOL result = 0;
  if (a3)
  {
    unint64_t v7 = (a3 + 1);
    if (v7 <= 0xA)
    {
      uint64_t v19 = -1;
      *(void *)&long long v10 = -1;
      *((void *)&v10 + 1) = -1;
      v18[0] = v10;
      v18[1] = v10;
      BOOL result = sub_10000AD4C(a1, (uint64_t)v18, v7, (float (*)(uint64_t))sub_10000AE00);
      if (result)
      {
        if (*(unsigned char *)(a2 + 12)) {
          float v11 = *(float *)(a2 + 8);
        }
        else {
          float v11 = (float)(*(int (**)(uint64_t, void))(a1 + 8))(a4, *(void *)(a1 + 16)) * 0.000000059605;
        }
        unsigned int v12 = 0;
        if (v11 <= *(float *)v18) {
          float v11 = *(float *)v18;
        }
        unsigned int v13 = a3 - 1;
        if (v11 >= *((float *)v18 + (a3 - 1))) {
          float v11 = *((float *)v18 + v13);
        }
        int v14 = (float *)v18 + 1;
        uint64_t v15 = (a3 - 1);
        do
        {
          if (!v15) {
            goto LABEL_16;
          }
          float v16 = *v14++;
          ++v12;
          --v15;
        }
        while (v11 >= v16);
        unsigned int v13 = v12 - 1;
        if (a3 == v12 || (float v17 = *(v14 - 2), v11 == v17))
        {
LABEL_16:
          *(_DWORD *)(a2 + 4) = 0;
          unsigned int v12 = v13 + 1;
          goto LABEL_17;
        }
        *(float *)(a2 + 4) = (float)(v11 - v17) / (float)(*((float *)v18 + v12) - v17);
LABEL_17:
        *(_DWORD *)a2 = v12;
        return 1;
      }
    }
  }
  return result;
}

BOOL sub_10000AD4C(uint64_t a1, uint64_t a2, unint64_t a3, float (*a4)(uint64_t))
{
  if (*(unsigned int *)(a1 + 3904) < 4 * a3) {
    return 0;
  }
  if (!a3) {
    return 1;
  }
  unsigned int v6 = *(_DWORD *)(a1 + 3904);
  if (v6 < 4) {
    return 0;
  }
  uint64_t v9 = 0;
  unint64_t v10 = a3 - 1;
  do
  {
    uint64_t v11 = v9;
    unsigned int v12 = *(unsigned int **)(a1 + 3896);
    uint64_t v13 = *v12;
    *(void *)(a1 + 3896) = v12 + 1;
    *(_DWORD *)(a1 + 3904) = v6 - 4;
    *(float *)(a2 + 4 * v11) = a4(v13);
    if (v10 == v11) {
      break;
    }
    unsigned int v6 = *(_DWORD *)(a1 + 3904);
    uint64_t v9 = v11 + 1;
  }
  while (v6 >= 4);
  return v11 + 1 >= a3;
}

float sub_10000AE00(int a1)
{
  return (float)a1 * 0.000000059605;
}

uint64_t sub_10000AE14(uint64_t a1, unsigned int *a2, unsigned int a3, int a4)
{
  char v4 = 0;
  __int16 v27 = 0;
  uint64_t v26 = 0;
  unsigned int v5 = a3 - 12;
  if (a3 < 0xC) {
    return v4 & 1;
  }
  if (*a2 != 1094992716)
  {
    LODWORD(v26) = bswap32(*a2);
    printf("e: unknown header block name %s\n");
LABEL_17:
    char v4 = 0;
    return v4 & 1;
  }
  if (a3 != 4 * a2[2])
  {
    printf("e: data size %d mismatch header %d\n");
    goto LABEL_17;
  }
  char v8 = 0;
  int v9 = 0;
  unsigned int v23 = 0;
  uint64_t v22 = 0;
  __int16 v25 = 0;
  uint64_t v24 = 0;
  if (v5 >= 0xC)
  {
    char v8 = 0;
    unint64_t v10 = a2 + 3;
    while (1)
    {
      while (1)
      {
        uint64_t v22 = *(void *)v10;
        uint64_t v11 = v10[2];
        unsigned int v23 = v10[2];
        unsigned int v12 = v10 + 3;
        if (v22 == 1447382596) {
          break;
        }
        if (sub_10000B14C(a1, (uint64_t)v12, v5, (int *)&v22))
        {
          char v8 = 1;
        }
        else
        {
          LOBYTE(v24) = BYTE3(v22);
          BYTE1(v24) = BYTE2(v22);
          BYTE2(v24) = BYTE1(v22);
          *(_WORD *)((char *)&v24 + 3) = v22;
          printf("e: failed to process block %s\n", (const char *)&v24);
        }
        int v9 = 0;
        v10 += v23;
        v5 -= 4 * v23;
        if (v5 <= 0xB) {
          goto LABEL_32;
        }
      }
      if (*v12 == a4) {
        break;
      }
      v10 += v11;
      v5 -= 4 * v11;
      if (v5 <= 0xB)
      {
        int v9 = 0;
        goto LABEL_32;
      }
    }
    unsigned int v13 = 4 * v11 - 16;
    if (v13 >= 0xD)
    {
      int v14 = v5 - 16;
      uint64_t v15 = v10 + 4;
      float v16 = "?";
      while (1)
      {
        uint64_t v22 = *(void *)v15;
        uint64_t v17 = v15[2];
        unsigned int v23 = v15[2];
        if (!v22) {
          break;
        }
        if (v17) {
          BOOL v18 = 4 * v17 > (unint64_t)v13;
        }
        else {
          BOOL v18 = 1;
        }
        if (v18)
        {
          LOBYTE(v24) = BYTE3(v22);
          BYTE1(v24) = BYTE2(v22);
          BYTE2(v24) = BYTE1(v22);
          *(_WORD *)((char *)&v24 + 3) = v22;
          float v16 = (const char *)&v24;
          break;
        }
        if ((sub_10000B14C(a1, (uint64_t)(v15 + 3), v14, (int *)&v22) & 1) == 0)
        {
          LOBYTE(v24) = BYTE3(v22);
          BYTE1(v24) = BYTE2(v22);
          BYTE2(v24) = BYTE1(v22);
          *(_WORD *)((char *)&v24 + 3) = v22;
          printf("e: failed to process block %s\n", (const char *)&v24);
        }
        v15 += v23;
        v13 -= 4 * v23;
        if (v13 <= 0xC) {
          goto LABEL_31;
        }
      }
      printf("e: block %s not well formed size %d remaining %d\n", v16, v17, v14);
    }
LABEL_31:
    int v9 = 1;
  }
LABEL_32:
  if (sub_10000B930(a1) && (*(_WORD *)(a1 + 24) & 2) != 0 && sub_10000BAD8(a1)) {
    sub_10000BB98((uint64_t (**)(uint64_t))a1);
  }
  if (v9) {
    uint64_t v19 = "Found";
  }
  else {
    uint64_t v19 = "Did not find";
  }
  printf("VDCL: %s Vendor Specific Calibration Data for idx %d\n", v19, a4);
  if (v8) {
    char v20 = "Found";
  }
  else {
    char v20 = "Did not find";
  }
  printf("VDCL: %s Global Calibration Data for idx %d\n", v20, a4);
  char v4 = v9 | v8;
  return v4 & 1;
}

uint64_t sub_10000B14C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  if (!a2)
  {
    char v8 = "e: no data";
LABEL_14:
    puts(v8);
    return 0;
  }
  if (!*(void *)a1)
  {
    char v8 = "e: no valid set block callback";
    goto LABEL_14;
  }
  *(void *)(a1 + 3896) = a2;
  *(_DWORD *)(a1 + 3904) = a3;
  int v6 = *a4;
  if (*a4 > 1280068947)
  {
    if (v6 <= 1347634764)
    {
      if (v6 <= 1346520175)
      {
        switch(v6)
        {
          case 1280068948:
            return sub_100011D84(a1, (uint64_t)a4);
          case 1346520132:
            return sub_10001117C(a1, (uint64_t)a4);
          case 1346520147:
            return sub_1000116C4(a1, (uint64_t)a4);
        }
      }
      else if (v6 > 1346650991)
      {
        if (v6 == 1346650992)
        {
          return sub_100010E94(a1, (uint64_t)a4);
        }
        if (v6 == 1347634753)
        {
          return sub_10000D564(a1, (uint64_t)a4);
        }
      }
      else
      {
        if (v6 == 1346520176)
        {
          return sub_100010F4C(a1, (uint64_t)a4);
        }
        if (v6 == 1346650979)
        {
          return sub_100010EF0(a1, (uint64_t)a4);
        }
      }
    }
    else if (v6 > 1381520458)
    {
      if (v6 > 1431323499)
      {
        if (v6 == 1431323500)
        {
          return sub_100011C70(a1, (uint64_t)a4);
        }
        if (v6 == 1431523395)
        {
          return sub_10000E31C(a1, (uint64_t)a4);
        }
      }
      else
      {
        if (v6 == 1381520459)
        {
          return sub_100010618(a1, (uint64_t)a4);
        }
        if (v6 == 1414288195)
        {
          return sub_10000DD4C(a1, (uint64_t)a4);
        }
      }
    }
    else if (v6 > 1347704175)
    {
      if (v6 == 1347704176) {
        goto LABEL_90;
      }
      if (v6 == 1363498051)
      {
        return sub_10000DA9C(a1, (uint64_t)a4);
      }
    }
    else
    {
      if (v6 == 1347634765)
      {
        return sub_10000E560(a1, (uint64_t)a4);
      }
      if (v6 == 1347704131)
      {
        return sub_100012330(a1, (uint64_t)a4);
      }
    }
    goto LABEL_138;
  }
  if (v6 <= 1112298578)
  {
    if (v6 > 1097626439)
    {
      if (v6 > 1112293703)
      {
        if (v6 == 1112293704)
        {
          return sub_10000CC20(a1, (uint64_t)a4);
        }
        if (v6 == 1112298320)
        {
          return sub_10000E8A8(a1, (uint64_t)a4);
        }
      }
      else
      {
        if (v6 == 1097626440)
        {
          return sub_10000F4A4(a1, (uint64_t)a4);
        }
        if (v6 == 1111703884)
        {
          return sub_10000C768(a1, (uint64_t)a4);
        }
      }
      goto LABEL_138;
    }
    switch(v6)
    {
      case 538985281:
        return sub_10000EBF8(a1, (uint64_t)a4);
      case 542134851:
        return sub_10000F15C(a1, (uint64_t)a4);
      case 1095128135:
        sub_100011EE8(a1, (uint64_t)a4);
LABEL_90:
        return sub_100011F80(a1, (uint64_t)a4);
    }
LABEL_138:
    byte_10004FD28 = HIBYTE(*a4);
    byte_10004FD29 = BYTE2(v6);
    byte_10004FD2A = BYTE1(v6);
    byte_10004FD2B = v6;
    byte_10004FD2C = 0;
    printf("e: unknown block name %s\n", &byte_10004FD28);
    return 0;
  }
  if (v6 > 1212632899)
  {
    if (v6 > 1230128194)
    {
      if (v6 == 1230128195)
      {
        return sub_100012604(a1, (uint64_t)a4);
      }
      if (v6 == 1279479620)
      {
        return sub_10000D4E4(a1, (uint64_t)a4);
      }
    }
    else
    {
      if (v6 == 1212632900)
      {
        return sub_100010248(a1, (uint64_t)a4);
      }
      if (v6 == 1213419587)
      {
        return sub_10000D848(a1, (uint64_t)a4);
      }
    }
    goto LABEL_138;
  }
  if (v6 > 1146110827)
  {
    if (v6 == 1146110828)
    {
      return sub_10000E098(a1, (uint64_t)a4);
    }
    if (v6 == 1162630739)
    {
      return sub_100012BBC(a1, (uint64_t)a4);
    }
    goto LABEL_138;
  }
  if (v6 != 1112298579)
  {
    if (v6 == 1145195841)
    {
      return sub_10000FBBC(a1, (uint64_t)a4);
    }
    goto LABEL_138;
  }

  return sub_1000103CC(a1, (uint64_t)a4);
}

BOOL sub_10000B930(uint64_t a1)
{
  unint64_t v1 = 0;
  BOOL v2 = 0;
  char v3 = 0;
  uint64_t v4 = a1 + 2232;
  uint64_t v5 = a1 + 2272;
  uint64_t v6 = a1 + 2292;
  do
  {
    unint64_t v7 = *(uint64_t **)(a1 + 8 * v1 + 2488);
    if (v7)
    {
      if (*(_DWORD *)(a1 + 88 * v1 + 2224) == 1)
      {
        char v8 = (unsigned __int16 *)(a1 + 88 * v1);
        if (v8[1148] < v8[1150])
        {
          BOOL v18 = "e: not enough durations provided for LUS LUTs";
LABEL_34:
          puts(v18);
          return v2;
        }
        unsigned int v9 = 0;
        unint64_t v10 = v8 + 1116;
        do
        {
          uint64_t v11 = v10[31];
          if (v10[31])
          {
            uint64_t v12 = 0;
            while (*(_DWORD *)(v4 + 4 * v12) != *((_DWORD *)v7 + 2))
            {
              if (v11 == ++v12) {
                goto LABEL_12;
              }
            }
            LODWORD(v11) = v12;
          }
LABEL_12:
          *((_DWORD *)v7 + 2) = v11;
          uint64_t v13 = v10[32];
          if (v10[32])
          {
            uint64_t v14 = 0;
            while (*((_DWORD *)v7 + 3) != *(unsigned __int16 *)(v5 + 2 * v14))
            {
              if (v13 == ++v14) {
                goto LABEL_18;
              }
            }
            LODWORD(v13) = v14;
          }
LABEL_18:
          *((_DWORD *)v7 + 3) = v13;
          uint64_t v15 = v10[33];
          if (v10[33])
          {
            uint64_t v16 = 0;
            while (*((_DWORD *)v7 + 4) != *(unsigned __int8 *)(v6 + v16))
            {
              if (v15 == ++v16) {
                goto LABEL_24;
              }
            }
            LODWORD(v15) = v16;
          }
LABEL_24:
          *((_DWORD *)v7 + 4) = v15;
          unint64_t v7 = (uint64_t *)*v7;
          ++v9;
        }
        while (v7);
        if (v9 < (v10[34] * v10[33] - v10[34] + v10[32]) * v10[31])
        {
          BOOL v18 = "e: missing LUS LUTs";
          goto LABEL_34;
        }
      }
      char v3 = 1;
    }
    BOOL v2 = v1 > 1;
    v4 += 88;
    v5 += 88;
    v6 += 88;
    ++v1;
  }
  while (v1 != 3);
  if (v3) {
    __int16 v17 = 2;
  }
  else {
    __int16 v17 = 0;
  }
  *(_WORD *)(a1 + 24) = *(_WORD *)(a1 + 24) & 0xFFFD | v17;
  return 1;
}

uint64_t sub_10000BAD8(uint64_t a1)
{
  char v2 = 0;
  unsigned int v3 = 0;
  unsigned int v6 = 0;
  while (!*(void *)(a1 + 8 * v3 + 2488))
  {
LABEL_5:
    unsigned int v6 = ++v3;
    if (v3 >= 3) {
      return v2 & 1;
    }
  }
  uint64_t v4 = a1 + 88 * v3;
  *(_DWORD *)(v4 + 2228) = *(_DWORD *)(v4 + 2224);
  if ((*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, void))a1)(54, v4 + 2228, 76, &v6, 1, *(void *)(a1 + 16)))
  {
    puts("i: set LUS table config succeeded");
    char v2 = 1;
    unsigned int v3 = v6;
    goto LABEL_5;
  }
  puts("e: failed to set LUS table config");
  char v2 = 0;
  return v2 & 1;
}

uint64_t sub_10000BB98(uint64_t (**a1)(uint64_t))
{
  uint64_t v2 = 0;
  char v3 = 1;
  do
  {
    for (uint64_t i = (int32x2_t *)a1[v2 + 311]; i; uint64_t i = (int32x2_t *)*i)
    {
      i[3].i32[0] = (__int32)a1[11 * v2 + 278];
      int32x2_t v6 = vrev64_s32(i[1]);
      __int32 v7 = i[2].i32[0];
      if (((*a1)(53) & 1) == 0)
      {
        printf("e: failed to set LUS LUT [%d %d %d]\n", v6.i32[0], v6.i32[1], v7);
        char v3 = 0;
      }
    }
    ++v2;
  }
  while (v2 != 3);
  if (v3) {
    puts("i: set LUS LUTs succeeded");
  }
  return v3 & 1;
}

BOOL sub_10000BCB8(uint64_t a1, int *a2, unsigned int a3)
{
  BOOL v3 = 0;
  __int16 v22 = 0;
  uint64_t v21 = 0;
  if (a3 < 0xC) {
    return v3;
  }
  int v5 = *a2;
  int v6 = a2[1];
  uint64_t v7 = a2[2];
  *(_WORD *)(a1 + 3814) = 0;
  if (v5 != 1094992716)
  {
    LOBYTE(v21) = HIBYTE(v5);
    BYTE1(v21) = BYTE2(v5);
    BYTE2(v21) = BYTE1(v5);
    *(_WORD *)((char *)&v21 + 3) = v5;
    printf("e: unknown header block name %s\n");
    return 0;
  }
  if (a3 != 4 * v7)
  {
    printf("e: data size %d mismatch header %d\n");
    return 0;
  }
  if (v6 == 327680)
  {
    BOOL v3 = 0;
    unint64_t v8 = a3 - 36;
    if (a3 < 0x24uLL || HIDWORD(v8)) {
      return v3;
    }
    unsigned int v9 = a2 + 9;
    goto LABEL_14;
  }
  unint64_t v8 = a3 - 12;
  if (HIDWORD(v8)) {
    return 0;
  }
  unsigned int v9 = a2 + 3;
LABEL_14:
  uint64_t v11 = "?";
  while (1)
  {
    BOOL v3 = v8 < 0xD;
    if (v8 < 0xD) {
      break;
    }
    uint64_t v19 = *(void *)v9;
    uint64_t v12 = v9[2];
    unsigned int v20 = v9[2];
    if (!v19) {
      goto LABEL_30;
    }
    if (v12) {
      BOOL v13 = 4 * v12 > v8;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      LOBYTE(v21) = BYTE3(v19);
      BYTE1(v21) = BYTE2(v19);
      BYTE2(v21) = BYTE1(v19);
      *(_WORD *)((char *)&v21 + 3) = v19;
      uint64_t v11 = (const char *)&v21;
LABEL_30:
      printf("e: block %s not well formed size %d remaining %d\n", v11, v12, v8);
      break;
    }
    uint64_t v14 = v9 + 3;
    unint64_t v15 = v8 - 12;
    if ((sub_10000B14C(a1, (uint64_t)(v9 + 3), (int)v8 - 12, (int *)&v19) & 1) == 0)
    {
      LOBYTE(v21) = BYTE3(v19);
      BYTE1(v21) = BYTE2(v19);
      BYTE2(v21) = BYTE1(v19);
      *(_WORD *)((char *)&v21 + 3) = v19;
      printf("e: failed to process block %s\n", (const char *)&v21);
    }
    BOOL v3 = 0;
    unint64_t v16 = v20 - 3;
    if (v20 >= 3uLL && !HIDWORD(v16))
    {
      BOOL v3 = 0;
      unint64_t v17 = 4 * v20 - 12;
      BOOL v18 = v15 >= v17;
      unint64_t v8 = v15 - v17;
      if (v18)
      {
        unsigned int v9 = &v14[v16];
        if (!HIDWORD(v8)) {
          continue;
        }
      }
    }
    return v3;
  }
  sub_10000BF18(a1);
  sub_10000BFD8(a1);
  sub_10000C218(a1);
  puts("i: all done");
  return v3;
}

uint64_t sub_10000BF18(uint64_t a1)
{
  int v2 = sub_10001F800(a1);
  BOOL v3 = sub_10000B930(a1);
  BOOL v4 = sub_10001FCA4(a1);
  int v5 = sub_10001D28C(a1);
  int v6 = sub_10001D204(a1);
  int v7 = sub_10001FE24(a1);
  int v8 = sub_10002011C(a1);
  unsigned int v9 = sub_10002021C(a1);
  if (*(void *)(a1 + 3816)) {
    *(_WORD *)(a1 + 24) |= 0x100u;
  }
  return v2 & v3 & v4 & v5 & v6 & v7 & v8 & v9;
}

uint64_t sub_10000BFD8(uint64_t result)
{
  uint64_t v1 = result;
  if (*(_WORD *)(result + 24))
  {
    BOOL result = sub_10001EA38(result);
    if (result) {
      BOOL result = sub_10001EAB8(v1);
    }
  }
  if ((*(_WORD *)(v1 + 24) & 2) != 0)
  {
    BOOL result = sub_10000BAD8(v1);
    if (result) {
      BOOL result = sub_10000BB98((uint64_t (**)(uint64_t))v1);
    }
  }
  if ((*(_WORD *)(v1 + 24) & 4) != 0)
  {
    *(_DWORD *)(v1 + 2516) = 1;
    int v2 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, void, void))v1)(5, v1 + 2516, 308, 0, 0, *(void *)(v1 + 16));
    BOOL v3 = v2 ? "i: set PRC table config succeeded" : "e: failed to set PRC table config";
    BOOL result = puts(v3);
    if (v2) {
      BOOL result = sub_10001F0AC(v1);
    }
  }
  __int16 v4 = *(_WORD *)(v1 + 24);
  if ((v4 & 8) != 0)
  {
    BOOL result = sub_10001D9C0(v1);
    __int16 v4 = *(_WORD *)(v1 + 24);
    if ((v4 & 0x10) == 0)
    {
LABEL_15:
      if ((v4 & 0x20) == 0) {
        goto LABEL_24;
      }
      goto LABEL_19;
    }
  }
  else if ((v4 & 0x10) == 0)
  {
    goto LABEL_15;
  }
  BOOL result = sub_10001D764(v1);
  if ((*(_WORD *)(v1 + 24) & 0x20) == 0) {
    goto LABEL_24;
  }
LABEL_19:
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, void, void))v1)(82, v1 + 2864, 544, 0, 0, *(void *)(v1 + 16));
  if (v5) {
    int v6 = "i: set prox table config succeeded";
  }
  else {
    int v6 = "e: failed to set prox table config";
  }
  BOOL result = puts(v6);
  if (v5) {
    BOOL result = sub_10001F204();
  }
LABEL_24:
  __int16 v7 = *(_WORD *)(v1 + 24);
  if ((v7 & 0x40) != 0)
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, void, void, void))v1)(85, v1 + 3616, 72, 0, 0, *(void *)(v1 + 16)))
    {
      int v8 = "i: set LLMT table config succeeded";
    }
    else
    {
      int v8 = "e: failed to set LLMT table config";
    }
    BOOL result = puts(v8);
    __int16 v7 = *(_WORD *)(v1 + 24);
  }
  if ((v7 & 0x80) != 0)
  {
    int v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, void, void))v1)(111, v1 + 3692, 76, 0, 0, *(void *)(v1 + 16));
    unint64_t v10 = v9 ? "i: set PTUC table config succeeded" : "e: failed to set PTUC table config";
    BOOL result = puts(v10);
    if (v9) {
      BOOL result = sub_10001F734(v1);
    }
  }
  if ((*(_WORD *)(v1 + 24) & 0x100) != 0)
  {
    *(_DWORD *)(v1 + 3788) = 1;
    int v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, void, void))v1)(116, v1 + 3788, 28, 0, 0, *(void *)(v1 + 16));
    uint64_t v12 = v11 ? "i: set ELVS table config succeeded" : "e: failed to set ELVS table config";
    BOOL result = puts(v12);
    if (v11)
    {
      return sub_100012F3C(v1);
    }
  }
  return result;
}

void sub_10000C218(uint64_t a1)
{
  for (uint64_t i = *(void **)(a1 + 2200); i; *(void *)(a1 + 2200) = i)
  {
    BOOL v3 = i;
    uint64_t i = (void *)*i;
    if (*((_DWORD *)v3 + 8) == 5)
    {
      __int16 v4 = (void *)v3[6];
      if (v4)
      {
        v3[6] = 0;
        free(v4);
        BOOL v3 = *(void **)(a1 + 2200);
      }
    }
    free(v3);
  }
  for (j = *(void **)(a1 + 2208); j; *(void *)(a1 + 2208) = j)
  {
    int v6 = j;
    j = (void *)*j;
    if (*((_DWORD *)v6 + 8) == 5)
    {
      __int16 v7 = (void *)v6[6];
      if (v7)
      {
        v6[6] = 0;
        free(v7);
        int v6 = *(void **)(a1 + 2208);
      }
    }
    free(v6);
  }
  uint64_t v8 = *(void *)(a1 + 2216);
  if (v8)
  {
    if (*(_DWORD *)(v8 + 32) == 5)
    {
      int v9 = *(void **)(v8 + 48);
      if (v9)
      {
        *(void *)(v8 + 48) = 0;
        free(v9);
        uint64_t v8 = *(void *)(a1 + 2216);
      }
    }
    free((void *)v8);
  }
  for (uint64_t k = 0; k != 3; ++k)
  {
    uint64_t v11 = a1 + 8 * k;
    uint64_t v12 = *(void **)(v11 + 2488);
    if (v12)
    {
      BOOL v13 = (void *)(v11 + 2488);
      do
      {
        uint64_t v14 = (void *)*v12;
        free(v12);
        *BOOL v13 = v14;
        uint64_t v12 = v14;
      }
      while (v14);
    }
  }
  for (uint64_t m = 0; m != 5; ++m)
  {
    uint64_t v16 = a1 + 8 * m;
    unint64_t v17 = *(void **)(v16 + 3928);
    if (v17)
    {
      BOOL v18 = (void *)(v16 + 3928);
      do
      {
        uint64_t v19 = (void *)*v17;
        free(v17);
        *BOOL v18 = v19;
        unint64_t v17 = v19;
      }
      while (v19);
    }
  }
  bzero((void *)(a1 + 3912), 0x98uLL);
  unsigned int v20 = *(void **)(a1 + 2824);
  if (v20)
  {
    do
    {
      uint64_t v21 = (void *)*v20;
      free(v20);
      *(void *)(a1 + 2824) = v21;
      unsigned int v20 = v21;
    }
    while (v21);
  }
  __int16 v22 = *(void **)(a1 + 3776);
  if (v22)
  {
    do
    {
      unsigned int v23 = (void *)*v22;
      free(v22);
      *(void *)(a1 + 3776) = v23;
      __int16 v22 = v23;
    }
    while (v23);
  }
  uint64_t v24 = *(void **)(a1 + 3816);
  if (v24)
  {
    do
    {
      __int16 v25 = (void *)*v24;
      free(v24);
      *(void *)(a1 + 3816) = v25;
      uint64_t v24 = v25;
    }
    while (v25);
  }
  uint64_t v26 = *(void *)(a1 + 3824);
  if (v26)
  {
    __int16 v27 = *(void **)v26;
    unsigned int v28 = *(void **)(v26 + 8);
    if (*(void **)v26 == v28) {
      goto LABEL_39;
    }
    do
    {
      if (*v27) {
        operator delete();
      }
      ++v27;
    }
    while (v27 != v28);
    uint64_t v26 = *(void *)(a1 + 3824);
    if (v26)
    {
      __int16 v27 = *(void **)v26;
LABEL_39:
      if (v27)
      {
        *(void *)(v26 + 8) = v27;
        operator delete(v27);
      }
      operator delete();
    }
  }
  uint64_t v29 = *(void *)(a1 + 3832);
  if (v29)
  {
    uint64_t v30 = *(void **)v29;
    uint64_t v31 = *(void **)(v29 + 8);
    if (*(void **)v29 == v31) {
      goto LABEL_49;
    }
    do
    {
      if (*v30) {
        operator delete();
      }
      ++v30;
    }
    while (v30 != v31);
    uint64_t v29 = *(void *)(a1 + 3832);
    if (v29)
    {
      uint64_t v30 = *(void **)v29;
LABEL_49:
      if (v30)
      {
        *(void *)(v29 + 8) = v30;
        operator delete(v30);
      }
      operator delete();
    }
  }
  uint64_t v32 = *(void *)(a1 + 3840);
  if (v32)
  {
    uint64_t v33 = *(void **)v32;
    uint64_t v34 = *(void **)(v32 + 8);
    if (*(void **)v32 == v34) {
      goto LABEL_59;
    }
    do
    {
      if (*v33) {
        operator delete();
      }
      ++v33;
    }
    while (v33 != v34);
    uint64_t v32 = *(void *)(a1 + 3840);
    if (v32)
    {
      uint64_t v33 = *(void **)v32;
LABEL_59:
      if (v33)
      {
        *(void *)(v32 + 8) = v33;
        operator delete(v33);
      }
      operator delete();
    }
  }
  uint64_t v35 = *(void *)(a1 + 3848);
  if (v35)
  {
    uint64_t v36 = *(void **)v35;
    uint64_t v37 = *(void **)(v35 + 8);
    if (*(void **)v35 == v37) {
      goto LABEL_69;
    }
    do
    {
      if (*v36) {
        operator delete();
      }
      ++v36;
    }
    while (v36 != v37);
    uint64_t v35 = *(void *)(a1 + 3848);
    if (v35)
    {
      uint64_t v36 = *(void **)v35;
LABEL_69:
      if (v36)
      {
        *(void *)(v35 + 8) = v36;
        operator delete(v36);
      }
      operator delete();
    }
  }
  uint64_t v38 = *(void *)(a1 + 3856);
  if (v38)
  {
    uint64_t v39 = *(void **)v38;
    uint64_t v40 = *(void **)(v38 + 8);
    if (*(void **)v38 == v40) {
      goto LABEL_79;
    }
    do
    {
      if (*v39) {
        operator delete();
      }
      ++v39;
    }
    while (v39 != v40);
    uint64_t v38 = *(void *)(a1 + 3856);
    if (v38)
    {
      uint64_t v39 = *(void **)v38;
LABEL_79:
      if (v39)
      {
        *(void *)(v38 + 8) = v39;
        operator delete(v39);
      }
      operator delete();
    }
  }
  uint64_t v41 = *(void *)(a1 + 3864);
  if (v41)
  {
    unsigned int v42 = *(void **)v41;
    uint64_t v43 = *(void **)(v41 + 8);
    if (*(void **)v41 == v43) {
      goto LABEL_89;
    }
    do
    {
      if (*v42) {
        operator delete();
      }
      ++v42;
    }
    while (v42 != v43);
    uint64_t v41 = *(void *)(a1 + 3864);
    if (v41)
    {
      unsigned int v42 = *(void **)v41;
LABEL_89:
      if (v42)
      {
        *(void *)(v41 + 8) = v42;
        operator delete(v42);
      }
      operator delete();
    }
  }
  uint64_t v44 = *(void *)(a1 + 3872);
  if (v44)
  {
    if (*(unsigned char *)(a1 + 2856)) {
      goto LABEL_94;
    }
    uint64_t v45 = *(void **)v44;
    unint64_t v49 = *(void **)(v44 + 8);
    if (*(void **)v44 == v49)
    {
LABEL_95:
      if (v45)
      {
        *(void *)(v44 + 8) = v45;
        operator delete(v45);
      }
      operator delete();
    }
    do
    {
      if (*v45) {
        operator delete();
      }
      ++v45;
    }
    while (v45 != v49);
    uint64_t v44 = *(void *)(a1 + 3872);
    if (v44)
    {
LABEL_94:
      uint64_t v45 = *(void **)v44;
      goto LABEL_95;
    }
  }
  uint64_t v46 = *(void *)(a1 + 3880);
  if (v46)
  {
    uint64_t v47 = *(void **)v46;
    uint64_t v48 = *(void **)(v46 + 8);
    if (*(void **)v46 == v48) {
      goto LABEL_105;
    }
    do
    {
      if (*v47) {
        operator delete();
      }
      ++v47;
    }
    while (v47 != v48);
    uint64_t v46 = *(void *)(a1 + 3880);
    if (v46)
    {
      uint64_t v47 = *(void **)v46;
LABEL_105:
      if (v47)
      {
        *(void *)(v46 + 8) = v47;
        operator delete(v47);
      }
      operator delete();
    }
  }
  sub_100020884((void *)a1);

  bzero((void *)(a1 + 24), 0xF30uLL);
}

uint64_t sub_10000C768(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 3908)) {
    return 1;
  }
  unsigned int v2 = *(_DWORD *)(a2 + 8);
  if (v2 >> 2 > 0xCBC) {
    return 0;
  }
  if (*(_DWORD *)(a2 + 4) != 0x10000) {
    return 0;
  }
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v55 = v4;
  long long v56 = v4;
  long long v53 = v4;
  long long v54 = v4;
  v52[6] = v4;
  v52[7] = v4;
  v52[4] = v4;
  v52[5] = v4;
  v52[2] = v4;
  v52[3] = v4;
  v52[0] = v4;
  v52[1] = v4;
  long long v50 = v4;
  long long v51 = v4;
  v48[1] = v4;
  long long v49 = v4;
  long long v47 = v4;
  v48[0] = v4;
  int v5 = 4 * v2;
  if (*(_DWORD *)(a1 + 3904) < (v5 - 12)) {
    return 0;
  }
  *(_DWORD *)(a1 + 3904) = v5 - 12;
  LODWORD(v47) = 1;
  if (v5 == 12) {
    return 0;
  }
  uint64_t v6 = *(void *)(a1 + 3896);
  WORD4(v47) = *(_WORD *)v6;
  *(void *)(a1 + 3896) = v6 + 2;
  *(_DWORD *)(a1 + 3904) = v5 - 14;
  if (v5 == 16) {
    return 0;
  }
  HIDWORD(v47) = *(unsigned __int16 *)(v6 + 2) | (*(unsigned __int8 *)(v6 + 4) << 16) | 0xAA000000;
  int v7 = *(unsigned __int16 *)(v6 + 5);
  *(void *)(a1 + 3896) = v6 + 5;
  *(_DWORD *)(a1 + 3904) = v5 - 17;
  int v8 = v7 | (*(unsigned __int8 *)(v6 + 7) << 16);
  *(void *)(a1 + 3896) = v6 + 8;
  LODWORD(v48[0]) = v8 | 0xAA000000;
  *(_DWORD *)(a1 + 3904) = v5 - 20;
  if (v5 == 20) {
    return 0;
  }
  DWORD1(v48[0]) = *(_DWORD *)(v6 + 8);
  uint64_t v9 = v6 + 12;
  *(void *)(a1 + 3896) = v6 + 12;
  int v10 = v5 - 24;
  *(_DWORD *)(a1 + 3904) = v5 - 24;
  if ((v5 - 24) < 0x18) {
    return 0;
  }
  uint64_t v11 = 0;
  uint64_t v12 = (v5 - 28);
  unint64_t v13 = -1;
  do
  {
    *(_WORD *)((char *)v48 + v11 + 8) = *(_WORD *)(v9 + v11);
    uint64_t v14 = v11 + 2;
    ++v13;
    if (v11 == 22) {
      break;
    }
    BOOL v15 = v12 + 2 == v11;
    v11 += 2;
  }
  while (!v15);
  *(void *)(a1 + 3896) = v9 + v14;
  *(_DWORD *)(a1 + 3904) = v10 - v14;
  if (v13 < 0xB || (v10 - v14) < 0x18) {
    return 0;
  }
  uint64_t v16 = 0;
  unint64_t v17 = (v12 - v14 + 2) >> 1;
  if (v17 >= 0xB) {
    unint64_t v17 = 11;
  }
  unint64_t v18 = v17 + 1;
  do
  {
    *((_WORD *)&v49 + v16++) = *(_WORD *)(v9 + v14);
    v14 += 2;
  }
  while (v18 != v16);
  *(void *)(a1 + 3896) = v9 + v14;
  *(_DWORD *)(a1 + 3904) = v10 - v14;
  if ((unint64_t)(v16 - 1) < 0xB || (v10 - v14) < 0xA) {
    return 0;
  }
  uint64_t v19 = 0;
  unint64_t v20 = v12 - v14 + 2;
  uint64_t v21 = v20 >> 1;
  BOOL v15 = ((v20 >> 1) & 0x7FFFFFFC) == 0;
  uint64_t v22 = 4;
  if (v15) {
    uint64_t v22 = v21;
  }
  uint64_t v23 = v22 + 1;
  do
  {
    *((_WORD *)&v50 + v19++ + 4) = *(_WORD *)(v9 + v14);
    v14 += 2;
  }
  while (v23 != v19);
  uint64_t v24 = (__int16 *)(v9 + v14);
  *(void *)(a1 + 3896) = v24;
  unsigned int v25 = v10 - v14;
  *(_DWORD *)(a1 + 3904) = v25;
  if ((unint64_t)(v19 - 1) < 4 || v25 < 0x18) {
    return 0;
  }
  uint64_t v26 = 0;
  int v27 = v12 - v14;
  unsigned int v28 = v27 + 2;
  int v29 = v27 + 1;
  unint64_t v30 = v28 >> 1;
  if (v30 >= 0xB) {
    unint64_t v30 = 11;
  }
  unint64_t v31 = v30 + 1;
  do
  {
    __int16 v32 = *v24++;
    *((_WORD *)&v51 + ++v26) = v32;
    v29 -= 2;
  }
  while (v31 != v26);
  *(void *)(a1 + 3896) = v24;
  *(_DWORD *)(a1 + 3904) = v29 + 3;
  if ((unint64_t)(v26 - 1) < 0xB || (v29 + 3) < 0x78) {
    return 0;
  }
  uint64_t v33 = 0;
  uint64_t v34 = (char *)v24 + 3;
  unint64_t v35 = (unint64_t)(v29 + 1) >> 1;
  if (v35 >= 0x3B) {
    unint64_t v35 = 59;
  }
  unint64_t v36 = v35 + 1;
  do
  {
    *((_WORD *)v52 + v33++ + 5) = *(_WORD *)(v34 - 3);
    v34 += 2;
    v29 -= 2;
  }
  while (v36 != v33);
  *(void *)(a1 + 3896) = v34 - 3;
  *(_DWORD *)(a1 + 3904) = v29 + 3;
  if ((unint64_t)(v33 - 1) < 0x3B) {
    return 0;
  }
  if (v29 == -3) {
    return 0;
  }
  BYTE2(v53) = *(v34 - 3);
  unint64_t v37 = BYTE2(v53);
  *(void *)(a1 + 3896) = v34 - 2;
  *(_DWORD *)(a1 + 3904) = v29 + 2;
  if (v37 > 6) {
    return 0;
  }
  if (v29 == -2) {
    return 0;
  }
  LOBYTE(v54) = *(v34 - 2);
  unsigned int v38 = v54;
  *(void *)(a1 + 3896) = v34 - 1;
  *(_DWORD *)(a1 + 3904) = v29 + 1;
  if (v38 > 5) {
    return 0;
  }
  if (v29 == -1) {
    return 0;
  }
  BYTE12(v54) = *(v34 - 1);
  unsigned int v39 = BYTE12(v54);
  *(void *)(a1 + 3896) = v34;
  *(_DWORD *)(a1 + 3904) = v29;
  if (v39 > 6
    || !sub_100012D2C(a1, (uint64_t)&v53 + 4, v37)
    || !sub_100012D2C(a1, (uint64_t)&v54 + 2, v54)
    || !sub_100012D2C(a1, (uint64_t)&v54 + 14, BYTE12(v54)))
  {
    return 0;
  }
  unsigned int v40 = BYTE2(v53) + BYTE12(v54) * v54;
  DWORD2(v56) = (*(_DWORD *)(a1 + 3904) >> 1) / v40;
  unint64_t v41 = DWORD2(v56) * v40;
  HIDWORD(v55) = ((((WORD4(v56) * (_WORD)v40) & 0x1FFF) != 0) << 14) + ((DWORD2(v56) * v40) >> 13 << 14);
  unsigned int v42 = malloc_type_aligned_alloc(0x4000uLL, HIDWORD(v55), 0xB2E32F46uLL);
  if (!v42)
  {
    puts("e: could not allocate memory for BCAL data");
    return 0;
  }
  uint64_t v43 = v42;
  if (!sub_100012D2C(a1, (uint64_t)v42, v41))
  {
    free(v43);
    return 0;
  }
  *(void *)&long long v56 = v43;
  uint64_t v44 = (*(uint64_t (**)(uint64_t, long long *, uint64_t, void, void, void))a1)(46, &v47, 288, 0, 0, *(void *)(a1 + 16));
  if (v44) {
    uint64_t v45 = "i: set BCAL data succeeded";
  }
  else {
    uint64_t v45 = "e: set BCAL data failed";
  }
  puts(v45);
  free(v43);
  return v44;
}

uint64_t sub_10000CC20(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 3908)) {
    return 1;
  }
  unsigned int v2 = *(_DWORD *)(a2 + 4);
  if (v2 < 0x30000)
  {
    long long v152 = 0u;
    long long v153 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    long long v149 = 0u;
    memset(v148, 0, sizeof(v148));
    memset(&v147[1], 0, 208);
    v147[0] = 1;
    long long v4 = *(unsigned __int16 **)(a1 + 3896);
    int v5 = *v4;
    *(void *)(a1 + 3896) = v4 + 1;
    LODWORD(v4) = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v4 - 2;
    if (v4 < 2) {
      puts("e: data_sz underflow in get_value");
    }
    printf("i: Processing BLAH format version %d data version %d\n", HIWORD(v2), v5);
    uint64_t v6 = *(char **)(a1 + 3896);
    char v9 = *v6;
    int v7 = v6 + 1;
    char v8 = v9;
    *(void *)(a1 + 3896) = v7;
    int v10 = *(_DWORD *)(a1 + 3904);
    BOOL v11 = v10 != 0;
    int v12 = v10 - 1;
    *(_DWORD *)(a1 + 3904) = v12;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      int v7 = *(unsigned char **)(a1 + 3896);
      int v12 = *(_DWORD *)(a1 + 3904);
    }
    LOBYTE(v151) = v8;
    char v15 = *v7;
    unint64_t v13 = (__int16 *)(v7 + 1);
    char v14 = v15;
    *(void *)(a1 + 3896) = v13;
    BOOL v11 = v12 != 0;
    unsigned int v16 = v12 - 1;
    *(_DWORD *)(a1 + 3904) = v16;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      unint64_t v13 = *(__int16 **)(a1 + 3896);
      unsigned int v16 = *(_DWORD *)(a1 + 3904);
    }
    LOBYTE(v147[1]) = v14;
    __int16 v19 = *v13;
    unint64_t v17 = v13 + 1;
    __int16 v18 = v19;
    *(void *)(a1 + 3896) = v17;
    BOOL v11 = v16 >= 2;
    unsigned int v20 = v16 - 2;
    *(_DWORD *)(a1 + 3904) = v20;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      unint64_t v17 = *(_WORD **)(a1 + 3896);
      unsigned int v20 = *(_DWORD *)(a1 + 3904);
    }
    WORD1(v151) = v18;
    __int16 v23 = *v17;
    uint64_t v21 = (char *)(v17 + 1);
    __int16 v22 = v23;
    *(void *)(a1 + 3896) = v21;
    BOOL v11 = v20 >= 2;
    unsigned int v24 = v20 - 2;
    *(_DWORD *)(a1 + 3904) = v24;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      uint64_t v21 = *(char **)(a1 + 3896);
      unsigned int v24 = *(_DWORD *)(a1 + 3904);
    }
    WORD2(v151) = v22;
    char v27 = *v21;
    unsigned int v25 = v21 + 1;
    char v26 = v27;
    *(void *)(a1 + 3896) = v25;
    BOOL v11 = v24 != 0;
    unsigned int v28 = v24 - 1;
    *(_DWORD *)(a1 + 3904) = v28;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      unsigned int v25 = *(char **)(a1 + 3896);
      unsigned int v28 = *(_DWORD *)(a1 + 3904);
    }
    BYTE1(v147[1]) = v26;
    char v31 = *v25;
    int v29 = v25 + 1;
    char v30 = v31;
    *(void *)(a1 + 3896) = v29;
    BOOL v11 = v28 != 0;
    unsigned int v32 = v28 - 1;
    *(_DWORD *)(a1 + 3904) = v32;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      int v29 = *(char **)(a1 + 3896);
      unsigned int v32 = *(_DWORD *)(a1 + 3904);
    }
    BYTE2(v147[1]) = v30;
    char v35 = *v29;
    uint64_t v33 = v29 + 1;
    char v34 = v35;
    *(void *)(a1 + 3896) = v33;
    BOOL v11 = v32 != 0;
    unsigned int v36 = v32 - 1;
    *(_DWORD *)(a1 + 3904) = v36;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      uint64_t v33 = *(unsigned char **)(a1 + 3896);
      unsigned int v36 = *(_DWORD *)(a1 + 3904);
    }
    HIBYTE(v147[1]) = v34;
    char v39 = *v33;
    unint64_t v37 = (int *)(v33 + 1);
    char v38 = v39;
    *(void *)(a1 + 3896) = v37;
    BOOL v11 = v36 != 0;
    unsigned int v40 = v36 - 1;
    *(_DWORD *)(a1 + 3904) = v40;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      unint64_t v37 = *(int **)(a1 + 3896);
      unsigned int v40 = *(_DWORD *)(a1 + 3904);
    }
    LOBYTE(v147[2]) = v38;
    int v43 = *v37;
    unint64_t v41 = v37 + 1;
    int v42 = v43;
    *(void *)(a1 + 3896) = v41;
    BOOL v11 = v40 >= 4;
    unsigned int v44 = v40 - 4;
    *(_DWORD *)(a1 + 3904) = v44;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      unint64_t v41 = *(int **)(a1 + 3896);
      unsigned int v44 = *(_DWORD *)(a1 + 3904);
    }
    v147[3] = v42;
    int v47 = *v41;
    uint64_t v45 = v41 + 1;
    int v46 = v47;
    *(void *)(a1 + 3896) = v45;
    BOOL v11 = v44 >= 4;
    unsigned int v48 = v44 - 4;
    *(_DWORD *)(a1 + 3904) = v48;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      uint64_t v45 = *(int **)(a1 + 3896);
      unsigned int v48 = *(_DWORD *)(a1 + 3904);
    }
    DWORD2(v151) = v46;
    int v51 = *v45;
    long long v49 = v45 + 1;
    int v50 = v51;
    *(void *)(a1 + 3896) = v49;
    BOOL v11 = v48 >= 4;
    unsigned int v52 = v48 - 4;
    *(_DWORD *)(a1 + 3904) = v52;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      long long v49 = *(int **)(a1 + 3896);
      unsigned int v52 = *(_DWORD *)(a1 + 3904);
    }
    HIDWORD(v151) = v50;
    int v55 = *v49;
    long long v53 = v49 + 1;
    int v54 = v55;
    *(void *)(a1 + 3896) = v53;
    BOOL v11 = v52 >= 4;
    unsigned int v56 = v52 - 4;
    *(_DWORD *)(a1 + 3904) = v56;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      long long v53 = *(_DWORD **)(a1 + 3896);
      unsigned int v56 = *(_DWORD *)(a1 + 3904);
    }
    LODWORD(v152) = v54;
    int v59 = *v53;
    float v57 = (unsigned __int8 *)(v53 + 1);
    int v58 = v59;
    *(void *)(a1 + 3896) = v57;
    BOOL v11 = v56 >= 4;
    unsigned int v60 = v56 - 4;
    *(_DWORD *)(a1 + 3904) = v60;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      float v57 = *(unsigned __int8 **)(a1 + 3896);
      unsigned int v60 = *(_DWORD *)(a1 + 3904);
    }
    DWORD1(v152) = v58;
    __int16 v63 = *v57;
    uint64_t v61 = (__int16 *)(v57 + 1);
    __int16 v62 = v63;
    *(void *)(a1 + 3896) = v61;
    BOOL v11 = v60 != 0;
    unsigned int v64 = v60 - 1;
    *(_DWORD *)(a1 + 3904) = v64;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      uint64_t v61 = *(__int16 **)(a1 + 3896);
      unsigned int v64 = *(_DWORD *)(a1 + 3904);
    }
    WORD4(v152) = v62;
    __int16 v65 = *v61;
    *(void *)(a1 + 3896) = v61 + 1;
    *(_DWORD *)(a1 + 3904) = v64 - 2;
    if (v64 < 2) {
      puts("e: data_sz underflow in get_value");
    }
    WORD5(v152) = v65;
    if (!v42 || !v46 || !v54)
    {
      uint64_t v73 = "e: Step values should be nonzero";
LABEL_96:
      puts(v73);
      return 0;
    }
    sub_100012D98(a1, &v147[4], 0x46uLL);
    if (v2 < 0x20000)
    {
      char v72 = 3;
      BYTE2(v147[21]) = 3;
    }
    else
    {
      float v66 = *(char **)(a1 + 3896);
      char v69 = *v66;
      v67 = v66 + 1;
      char v68 = v69;
      *(void *)(a1 + 3896) = v67;
      int v70 = *(_DWORD *)(a1 + 3904);
      BOOL v11 = v70 != 0;
      int v71 = v70 - 1;
      *(_DWORD *)(a1 + 3904) = v71;
      if (!v11)
      {
        puts("e: data_sz underflow in get_value");
        v67 = *(char **)(a1 + 3896);
        int v71 = *(_DWORD *)(a1 + 3904);
      }
      BYTE2(v147[21]) = v68;
      char v72 = *v67;
      *(void *)(a1 + 3896) = v67 + 1;
      *(_DWORD *)(a1 + 3904) = v71 - 1;
      if (!v71) {
        puts("e: data_sz underflow in get_value");
      }
    }
    HIBYTE(v147[21]) = v72;
    sub_100012D98(a1, &v147[22], 0x10uLL);
    sub_100012DE8(a1, &v147[26], 10);
    sub_100012DE8(a1, &v147[31], 11);
    for (uint64_t i = 37; i != 47; ++i)
    {
      float v75 = *(unsigned __int16 **)(a1 + 3896);
      int v76 = *v75;
      int v77 = *((unsigned __int8 *)v75 + 2);
      *(void *)(a1 + 3896) = (char *)v75 + 3;
      LODWORD(v75) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v75 - 3;
      if (v75 < 3) {
        puts("e: data_sz underflow in get_value");
      }
      v147[i] = v76 | (v77 << 16);
    }
    sub_100012DE8(a1, &v147[47], 11);
    sub_100012E38(a1, v148, 10);
    sub_100012DE8(a1, &v149, 11);
    v78 = *(char **)(a1 + 3896);
    char v81 = *v78;
    int v79 = v78 + 1;
    char v80 = v81;
    *(void *)(a1 + 3896) = v79;
    int v82 = *(_DWORD *)(a1 + 3904);
    BOOL v11 = v82 != 0;
    int v83 = v82 - 1;
    *(_DWORD *)(a1 + 3904) = v83;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      int v79 = *(char **)(a1 + 3896);
      int v83 = *(_DWORD *)(a1 + 3904);
    }
    BYTE6(v150) = v80;
    char v86 = *v79;
    uint64_t v84 = v79 + 1;
    char v85 = v86;
    *(void *)(a1 + 3896) = v84;
    BOOL v11 = v83 != 0;
    int v87 = v83 - 1;
    *(_DWORD *)(a1 + 3904) = v87;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      uint64_t v84 = *(char **)(a1 + 3896);
      int v87 = *(_DWORD *)(a1 + 3904);
    }
    BYTE7(v150) = v85;
    char v90 = *v84;
    uint64_t v88 = v84 + 1;
    char v89 = v90;
    *(void *)(a1 + 3896) = v88;
    BOOL v11 = v87 != 0;
    int v91 = v87 - 1;
    *(_DWORD *)(a1 + 3904) = v91;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      uint64_t v88 = *(unsigned char **)(a1 + 3896);
      int v91 = *(_DWORD *)(a1 + 3904);
    }
    BYTE8(v150) = v89;
    char v94 = *v88;
    uint64_t v92 = v88 + 1;
    char v93 = v94;
    *(void *)(a1 + 3896) = v92;
    BOOL v11 = v91 != 0;
    unsigned int v95 = v91 - 1;
    *(_DWORD *)(a1 + 3904) = v95;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      uint64_t v92 = *(_WORD **)(a1 + 3896);
      unsigned int v95 = *(_DWORD *)(a1 + 3904);
    }
    BYTE9(v150) = v93;
    __int16 v98 = *v92;
    v96 = (char *)(v92 + 1);
    __int16 v97 = v98;
    *(void *)(a1 + 3896) = v96;
    BOOL v11 = v95 >= 2;
    unsigned int v99 = v95 - 2;
    *(_DWORD *)(a1 + 3904) = v99;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      v96 = *(char **)(a1 + 3896);
      unsigned int v99 = *(_DWORD *)(a1 + 3904);
    }
    WORD5(v150) = v97;
    char v102 = *v96;
    v100 = v96 + 1;
    char v101 = v102;
    *(void *)(a1 + 3896) = v100;
    BOOL v11 = v99 != 0;
    unsigned int v103 = v99 - 1;
    *(_DWORD *)(a1 + 3904) = v103;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      v100 = *(unsigned char **)(a1 + 3896);
      unsigned int v103 = *(_DWORD *)(a1 + 3904);
    }
    BYTE12(v150) = v101;
    char v106 = *v100;
    v104 = v100 + 1;
    char v105 = v106;
    *(void *)(a1 + 3896) = v104;
    BOOL v11 = v103 != 0;
    unsigned int v107 = v103 - 1;
    *(_DWORD *)(a1 + 3904) = v107;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      v104 = *(_WORD **)(a1 + 3896);
      unsigned int v107 = *(_DWORD *)(a1 + 3904);
    }
    BYTE13(v150) = v105;
    __int16 v110 = *v104;
    v108 = (char *)(v104 + 1);
    __int16 v109 = v110;
    *(void *)(a1 + 3896) = v108;
    BOOL v11 = v107 >= 2;
    unsigned int v111 = v107 - 2;
    *(_DWORD *)(a1 + 3904) = v111;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      v108 = *(char **)(a1 + 3896);
      unsigned int v111 = *(_DWORD *)(a1 + 3904);
    }
    HIWORD(v150) = v109;
    char v114 = *v108;
    v112 = v108 + 1;
    char v113 = v114;
    *(void *)(a1 + 3896) = v112;
    BOOL v11 = v111 != 0;
    unsigned int v115 = v111 - 1;
    *(_DWORD *)(a1 + 3904) = v115;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      v112 = *(char **)(a1 + 3896);
      unsigned int v115 = *(_DWORD *)(a1 + 3904);
    }
    BYTE12(v152) = v113;
    char v118 = *v112;
    v116 = v112 + 1;
    char v117 = v118;
    *(void *)(a1 + 3896) = v116;
    BOOL v11 = v115 != 0;
    unsigned int v119 = v115 - 1;
    *(_DWORD *)(a1 + 3904) = v119;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      v116 = *(char **)(a1 + 3896);
      unsigned int v119 = *(_DWORD *)(a1 + 3904);
    }
    BYTE13(v152) = v117;
    char v122 = *v116;
    v120 = v116 + 1;
    char v121 = v122;
    *(void *)(a1 + 3896) = v120;
    BOOL v11 = v119 != 0;
    unsigned int v123 = v119 - 1;
    *(_DWORD *)(a1 + 3904) = v123;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      v120 = *(char **)(a1 + 3896);
      unsigned int v123 = *(_DWORD *)(a1 + 3904);
    }
    BYTE14(v152) = v121;
    char v126 = *v120;
    v124 = v120 + 1;
    char v125 = v126;
    *(void *)(a1 + 3896) = v124;
    BOOL v11 = v123 != 0;
    unsigned int v127 = v123 - 1;
    *(_DWORD *)(a1 + 3904) = v127;
    if (!v11)
    {
      puts("e: data_sz underflow in get_value");
      v124 = *(char **)(a1 + 3896);
      unsigned int v127 = *(_DWORD *)(a1 + 3904);
    }
    HIBYTE(v152) = v125;
    char v128 = *v124;
    *(void *)(a1 + 3896) = v124 + 1;
    *(_DWORD *)(a1 + 3904) = v127 - 1;
    if (!v127) {
      puts("e: data_sz underflow in get_value");
    }
    LOBYTE(v153) = v128;
    if (v2 >> 17)
    {
      v129 = *(unsigned char **)(a1 + 3896);
      char v132 = *v129;
      v130 = (unsigned __int16 *)(v129 + 1);
      char v131 = v132;
      *(void *)(a1 + 3896) = v130;
      int v133 = *(_DWORD *)(a1 + 3904);
      BOOL v11 = v133 != 0;
      unsigned int v134 = v133 - 1;
      *(_DWORD *)(a1 + 3904) = v134;
      if (!v11)
      {
        puts("e: data_sz underflow in get_value");
        v130 = *(unsigned __int16 **)(a1 + 3896);
        unsigned int v134 = *(_DWORD *)(a1 + 3904);
      }
      BYTE1(v153) = v131;
      int v135 = *v130 | (*((unsigned __int8 *)v130 + 2) << 16);
      v136 = (unsigned __int8 *)v130 + 3;
      *(void *)(a1 + 3896) = v136;
      BOOL v11 = v134 >= 3;
      unsigned int v137 = v134 - 3;
      *(_DWORD *)(a1 + 3904) = v137;
      if (!v11)
      {
        puts("e: data_sz underflow in get_value");
        v136 = *(unsigned __int8 **)(a1 + 3896);
        unsigned int v137 = *(_DWORD *)(a1 + 3904);
      }
      DWORD1(v153) = v135;
      int v138 = *v136;
      *(void *)(a1 + 3896) = v136 + 1;
      *(_DWORD *)(a1 + 3904) = v137 - 1;
      if (!v137)
      {
        puts("e: data_sz underflow in get_value");
        int v135 = DWORD1(v153);
      }
      BYTE8(v153) = v138;
      if (BYTE1(v153) && !v135 && !v138)
      {
        uint64_t v73 = "e: ramp down configurations should be nonzero";
        goto LABEL_96;
      }
      v140 = *(__int16 **)(a1 + 3896);
      __int16 v143 = *v140;
      v141 = v140 + 1;
      __int16 v142 = v143;
      *(void *)(a1 + 3896) = v141;
      unsigned int v144 = *(_DWORD *)(a1 + 3904);
      BOOL v11 = v144 >= 2;
      unsigned int v145 = v144 - 2;
      *(_DWORD *)(a1 + 3904) = v145;
      if (!v11)
      {
        puts("e: data_sz underflow in get_value");
        v141 = *(__int16 **)(a1 + 3896);
        unsigned int v145 = *(_DWORD *)(a1 + 3904);
      }
      WORD5(v153) = v142;
      __int16 v139 = *v141;
      *(void *)(a1 + 3896) = v141 + 1;
      *(_DWORD *)(a1 + 3904) = v145 - 2;
      if (v145 < 2) {
        puts("e: data_sz underflow in get_value");
      }
    }
    else
    {
      __int16 v139 = 0;
      BYTE1(v153) = 0;
      DWORD1(v153) = 0;
      BYTE8(v153) = 0;
      WORD5(v153) = 0;
    }
    WORD6(v153) = v139;
    if (!(*(unsigned int (**)(uint64_t, _DWORD *, uint64_t, void, void, void))a1)(47, v147, 372, 0, 0, *(void *)(a1 + 16)))
    {
      uint64_t v73 = "e: set BLAH data failed";
      goto LABEL_96;
    }
    puts("i: set BLAH data succeeded");
    return 1;
  }
  printf("e: Unexpected BLAH block version 0x%x\n", *(_DWORD *)(a2 + 4));
  return 0;
}

uint64_t sub_10000D4E4(uint64_t a1, uint64_t a2)
{
  int v2 = HIWORD(*(_DWORD *)(a2 + 4));
  if (v2 == 4)
  {
    return sub_1000139D8(a1, a2);
  }
  else if (v2 == 3)
  {
    return sub_1000132DC(a1, a2);
  }
  else
  {
    printf("e: unexpected block version %d\n", HIWORD(*(_DWORD *)(a2 + 4)));
    return 0;
  }
}

uint64_t sub_10000D564(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 3908)) {
    return 1;
  }
  unsigned int v2 = *(_DWORD *)(a2 + 4);
  if (v2 > 0x4FFFF) {
    return 0;
  }
  int v4 = *(_DWORD *)(a2 + 8);
  uint64_t v39 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  LODWORD(v36) = 1;
  if (v2 > 0x2FFFF) {
    BYTE8(v36) = 2;
  }
  int v5 = *(unsigned __int8 **)(a1 + 3896);
  unsigned int v8 = *v5;
  uint64_t v6 = v5 + 1;
  uint64_t v7 = v8;
  *(void *)(a1 + 3896) = v6;
  int v9 = *(_DWORD *)(a1 + 3904);
  BOOL v30 = v9 != 0;
  int v10 = v9 - 1;
  *(_DWORD *)(a1 + 3904) = v10;
  if (!v30)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v6 = *(unsigned __int8 **)(a1 + 3896);
    int v10 = *(_DWORD *)(a1 + 3904);
  }
  BYTE10(v37) = v7;
  unsigned int v13 = *v6;
  BOOL v11 = v6 + 1;
  uint64_t v12 = v13;
  *(void *)(a1 + 3896) = v11;
  BOOL v30 = v10 != 0;
  int v14 = v10 - 1;
  *(_DWORD *)(a1 + 3904) = v14;
  if (!v30)
  {
    puts("e: data_sz underflow in get_value");
    BOOL v11 = *(unsigned __int8 **)(a1 + 3896);
    int v14 = *(_DWORD *)(a1 + 3904);
  }
  int v15 = 4 * v4;
  BYTE11(v37) = v12;
  unsigned int v18 = *v11;
  unsigned int v16 = v11 + 1;
  uint64_t v17 = v18;
  *(void *)(a1 + 3896) = v16;
  BOOL v30 = v14 != 0;
  int v19 = v14 - 1;
  *(_DWORD *)(a1 + 3904) = v19;
  if (!v30)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v16 = *(unsigned __int8 **)(a1 + 3896);
    int v19 = *(_DWORD *)(a1 + 3904);
  }
  unsigned int v20 = v15 - 16;
  BYTE12(v37) = v17;
  uint64_t v21 = *v16;
  *(void *)(a1 + 3896) = v16 + 1;
  *(_DWORD *)(a1 + 3904) = v19 - 1;
  if (!v19) {
    puts("e: data_sz underflow in get_value");
  }
  BYTE13(v37) = v21;
  if ((v2 & 0xFFFD0000) == 0x10000)
  {
    BYTE9(v36) = 0;
    unint64_t v22 = (unint64_t)(((0xA00000000 * v21 + 0xA00000000) * v7
                            + (0xA00000000 * v21 + 0xA00000000) * v7 * v17)
                           * v12) >> 32;
    unsigned int v23 = v22 | 1;
    unsigned int v24 = v22 + 6;
    if (v2 >> 17) {
      unsigned int v25 = v24;
    }
    else {
      unsigned int v25 = v23;
    }
    char v26 = 1;
  }
  else
  {
    char v26 = 1;
    if (HIWORD(v2) == 4 || HIWORD(v2) == 2)
    {
      BYTE9(v36) = 1;
      unsigned int v28 = *(unsigned int **)(a1 + 3896);
      unsigned int v25 = *v28;
      *(void *)(a1 + 3896) = v28 + 1;
      LODWORD(v28) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v28 - 4;
      if (v28 < 4) {
        puts("e: data_sz underflow in get_value");
      }
      char v26 = 0;
      unsigned int v20 = v15 - 36;
    }
    else
    {
      unsigned int v25 = 0;
    }
  }
  int v29 = (v25 & 0x3FFF) != 0;
  LODWORD(v38) = (v25 & 0xFFFFC000) + (v29 << 14);
  BOOL v30 = v25 <= v20 && v25 >= v20 - 3;
  if (!v30)
  {
    char v31 = "e: incoming data not well formed";
LABEL_38:
    puts(v31);
    return 0;
  }
  unsigned int v32 = malloc_type_aligned_alloc(0x4000uLL, (v25 & 0xFFFFC000) + (v29 << 14), 0xA8DDA036uLL);
  if (!v32)
  {
    char v31 = "e: could not allocate memory for PSFA data";
    goto LABEL_38;
  }
  uint64_t v33 = v32;
  memcpy(v32, *(const void **)(a1 + 3896), (int)v25);
  *((void *)&v38 + 1) = v33;
  if ((v26 & 1) == 0) {
    sub_100012D98(a1, (unsigned char *)((unint64_t)&v36 | 0xA), 0x10uLL);
  }
  uint64_t v27 = (*(uint64_t (**)(uint64_t, long long *, uint64_t, void, void, void))a1)(52, &v36, 56, 0, 0, *(void *)(a1 + 16));
  if (v27) {
    char v34 = "i: set PSFA data succeeded";
  }
  else {
    char v34 = "e: set PSFA data failed";
  }
  puts(v34);
  free(v33);
  return v27;
}

uint64_t sub_10000D848(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 3908)) {
    return 1;
  }
  if (*(unsigned __int16 *)(a2 + 6) << 16 == 0x10000)
  {
    bzero(v39, 0x23CuLL);
    int v36 = 1;
    unsigned int v3 = *(_DWORD *)(a1 + 3904);
    unsigned int v4 = v3 - 2;
    if (v3 >= 2)
    {
      int v5 = *(__int16 **)(a1 + 3896);
      __int16 v6 = *v5;
      *(void *)(a1 + 3896) = v5 + 1;
      *(_DWORD *)(a1 + 3904) = v4;
      __int16 v37 = v6;
      if (v4 >= 2)
      {
        unint64_t v7 = 0;
        __int16 v8 = v5[1];
        *(void *)(a1 + 3896) = v5 + 2;
        *(_DWORD *)(a1 + 3904) = v3 - 4;
        __int16 v38 = v8;
        unsigned int v9 = v3 - 6;
        while (((v3 - 4) & 0xFFFFFFFE) != v7)
        {
          __int16 v10 = v5[v7 / 2 + 2];
          *(void *)(a1 + 3896) = &v5[v7 / 2 + 3];
          *(_DWORD *)(a1 + 3904) = v9;
          *(_WORD *)&v39[v7] = v10;
          v7 += 2;
          v9 -= 2;
          if (v7 == 6)
          {
            if (v3 - 10 >= 2)
            {
              __int16 v11 = v5[5];
              *(void *)(a1 + 3896) = v5 + 6;
              *(_DWORD *)(a1 + 3904) = v9;
              __int16 v40 = v11;
              if (v9 >= 2)
              {
                __int16 v12 = v5[6];
                unsigned int v13 = v5 + 3;
                *(void *)(a1 + 3896) = v13 + 4;
                *(_DWORD *)(a1 + 3904) = v3 - 14;
                __int16 v41 = v12;
                if (v3 - 14 >= 2)
                {
                  uint64_t v14 = 0;
                  __int16 v15 = v13[4];
                  unsigned int v16 = v13 + 5;
                  *(void *)(a1 + 3896) = v16;
                  unsigned int v17 = v3 - 16;
                  *(_DWORD *)(a1 + 3904) = v17;
                  __int16 v42 = v15;
                  unsigned int v18 = &v43;
                  while (1)
                  {
                    int v19 = (char *)&v36 + 2 * v14;
                    unsigned int v22 = *((unsigned __int16 *)v19 + 4);
                    unsigned int v20 = (unsigned __int16 *)(v19 + 8);
                    unsigned int v21 = v22;
                    if (v22 > 0x1F) {
                      break;
                    }
                    if (v21)
                    {
                      unint64_t v23 = 0;
                      do
                      {
                        BOOL v24 = v17 >= 2;
                        v17 -= 2;
                        if (!v24) {
                          return 0;
                        }
                        __int16 v25 = *v16++;
                        *(void *)(a1 + 3896) = v16;
                        *(_DWORD *)(a1 + 3904) = v17;
                        *((_WORD *)v18 + v23++) = v25;
                      }
                      while (v23 < *v20);
                    }
                    ++v14;
                    unsigned int v18 = (uint64_t *)((char *)v18 + 62);
                    if (v14 == 3)
                    {
                      uint64_t v26 = 0;
                      for (uint64_t i = &v44; ; i += 31)
                      {
                        unsigned int v28 = (char *)&v36 + 2 * v26;
                        int v30 = *((unsigned __int16 *)v28 + 4);
                        int v29 = (unsigned __int16 *)(v28 + 8);
                        if (v30) {
                          break;
                        }
LABEL_25:
                        if (++v26 == 3)
                        {
                          uint64_t v33 = (*(uint64_t (**)(uint64_t, int *, uint64_t, void, void, void))a1)(89, &v36, 580, 0, 0, *(void *)(a1 + 16));
                          if (v33) {
                            char v34 = "i: set HSPC data succeeded";
                          }
                          else {
                            char v34 = "e: set HSPC data failed";
                          }
                          puts(v34);
                          return v33;
                        }
                      }
                      unint64_t v31 = 0;
                      while (1)
                      {
                        BOOL v24 = v17 >= 4;
                        v17 -= 4;
                        if (!v24) {
                          return 0;
                        }
                        int v32 = *(_DWORD *)v16;
                        v16 += 2;
                        *(void *)(a1 + 3896) = v16;
                        *(_DWORD *)(a1 + 3904) = v17;
                        i[v31++] = v32;
                        if (v31 >= *v29) {
                          goto LABEL_25;
                        }
                      }
                    }
                  }
                }
              }
            }
            return 0;
          }
        }
      }
    }
  }
  return 0;
}

uint64_t sub_10000DA9C(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 3908))
  {
    if (*(unsigned __int16 *)(a2 + 6) << 16 != 0x10000) {
      return 0;
    }
    int v3 = *(_DWORD *)(a2 + 8);
    bzero(v39, 0x7A0uLL);
    int v36 = 1;
    unsigned int v4 = *(__int16 **)(a1 + 3896);
    __int16 v7 = *v4;
    int v5 = v4 + 1;
    __int16 v6 = v7;
    *(void *)(a1 + 3896) = v5;
    unsigned int v8 = *(_DWORD *)(a1 + 3904);
    BOOL v9 = v8 >= 2;
    unsigned int v10 = v8 - 2;
    *(_DWORD *)(a1 + 3904) = v10;
    if (!v9)
    {
      puts("e: data_sz underflow in get_value");
      int v5 = *(_WORD **)(a1 + 3896);
      unsigned int v10 = *(_DWORD *)(a1 + 3904);
    }
    __int16 v37 = v6;
    __int16 v13 = *v5;
    __int16 v11 = v5 + 1;
    __int16 v12 = v13;
    *(void *)(a1 + 3896) = v11;
    BOOL v9 = v10 >= 2;
    unsigned int v14 = v10 - 2;
    *(_DWORD *)(a1 + 3904) = v14;
    if (!v9)
    {
      puts("e: data_sz underflow in get_value");
      __int16 v11 = *(unsigned __int16 **)(a1 + 3896);
      unsigned int v14 = *(_DWORD *)(a1 + 3904);
    }
    __int16 v38 = v12;
    uint64_t v15 = *v11;
    *(void *)(a1 + 3896) = v11 + 1;
    *(_DWORD *)(a1 + 3904) = v14 - 2;
    if (v14 < 2) {
      puts("e: data_sz underflow in get_value");
    }
    v39[0] = v15;
    if (v15 >= 0xF)
    {
      unsigned int v16 = "e: set QETC data failed. Too many brightness levels. ";
LABEL_11:
      puts(v16);
      return 0;
    }
    unsigned int v17 = 4 * v3 - 18;
    uint64_t v18 = 4 * v15;
    unsigned int v19 = v17 - 4 * v15;
    if (v17 < 4 * (int)v15)
    {
LABEL_21:
      printf("e: The data size(%zu)is actually lesser than remaining bytes(%d)\n", v18, v17);
      return 0;
    }
    if (v15)
    {
      unsigned int v20 = &v40;
      uint64_t v21 = v15;
      do
      {
        unsigned int v22 = *(int **)(a1 + 3896);
        int v23 = *v22;
        *(void *)(a1 + 3896) = v22 + 1;
        LODWORD(v22) = *(_DWORD *)(a1 + 3904);
        *(_DWORD *)(a1 + 3904) = v22 - 4;
        if (v22 < 4) {
          puts("e: data_sz underflow in get_value");
        }
        *v20++ = v23;
        --v21;
      }
      while (v21);
      unsigned int v17 = v19;
    }
    unint64_t v24 = v17 - 44;
    if (v17 < 0x2C)
    {
      uint64_t v18 = 44;
      goto LABEL_21;
    }
    for (uint64_t i = 68; i != 112; i += 2)
    {
      uint64_t v27 = *(__int16 **)(a1 + 3896);
      __int16 v28 = *v27;
      *(void *)(a1 + 3896) = v27 + 1;
      LODWORD(v27) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v27 - 2;
      if (v27 < 2) {
        puts("e: data_sz underflow in get_value");
      }
      *(_WORD *)((char *)&v36 + i) = v28;
    }
    if (132 * v15 > v24)
    {
      printf("e: The data size(%zu)is actually lesser than remaining bytes(%d)\n", 132 * v15, v24);
      return 0;
    }
    if (v15)
    {
      uint64_t v29 = 0;
      int v30 = &v41;
      do
      {
        uint64_t v31 = 0;
        int v32 = v30;
        do
        {
          for (uint64_t j = 0; j != 44; j += 2)
          {
            char v34 = *(__int16 **)(a1 + 3896);
            __int16 v35 = *v34;
            *(void *)(a1 + 3896) = v34 + 1;
            LODWORD(v34) = *(_DWORD *)(a1 + 3904);
            *(_DWORD *)(a1 + 3904) = v34 - 2;
            if (v34 < 2) {
              puts("e: data_sz underflow in get_value");
            }
            *(_WORD *)((char *)v32 + j) = v35;
          }
          ++v31;
          int v32 = (uint64_t *)((char *)v32 + 44);
        }
        while (v31 != 3);
        ++v29;
        int v30 = (uint64_t *)((char *)v30 + 132);
      }
      while (v29 != v15);
    }
    if (((*(uint64_t (**)(uint64_t, int *, uint64_t, void, void, void))a1)(101, &v36, 1960, 0, 0, *(void *)(a1 + 16)) & 1) == 0)
    {
      unsigned int v16 = "e: set QETC data failed";
      goto LABEL_11;
    }
    puts("i: set QETC data succeeded");
  }
  return 1;
}

uint64_t sub_10000DD4C(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 3908)) {
    return 1;
  }
  if (*(unsigned __int16 *)(a2 + 6) << 16 != 0x10000) {
    return 0;
  }
  int v3 = *(_DWORD *)(a2 + 8);
  uint64_t v45 = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  memset(v38, 0, sizeof(v38));
  LODWORD(v37) = 1;
  unsigned int v4 = *(__int16 **)(a1 + 3896);
  __int16 v7 = *v4;
  int v5 = v4 + 1;
  __int16 v6 = v7;
  *(void *)(a1 + 3896) = v5;
  unsigned int v8 = *(_DWORD *)(a1 + 3904);
  BOOL v9 = v8 >= 2;
  unsigned int v10 = v8 - 2;
  *(_DWORD *)(a1 + 3904) = v10;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    int v5 = *(_WORD **)(a1 + 3896);
    unsigned int v10 = *(_DWORD *)(a1 + 3904);
  }
  WORD4(v37) = v6;
  __int16 v13 = *v5;
  __int16 v11 = v5 + 1;
  __int16 v12 = v13;
  *(void *)(a1 + 3896) = v11;
  BOOL v9 = v10 >= 2;
  unsigned int v14 = v10 - 2;
  *(_DWORD *)(a1 + 3904) = v14;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    __int16 v11 = *(unsigned __int16 **)(a1 + 3896);
    unsigned int v14 = *(_DWORD *)(a1 + 3904);
  }
  WORD5(v37) = v12;
  uint64_t v15 = *v11;
  *(void *)(a1 + 3896) = v11 + 1;
  *(_DWORD *)(a1 + 3904) = v14 - 2;
  if (v14 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  WORD6(v37) = v15;
  if (v15 >= 0xF) {
    goto LABEL_10;
  }
  unsigned int v18 = 4 * v3 - 18;
  unsigned int v19 = v18 - 4 * v15;
  if (v18 < 4 * (int)v15) {
    goto LABEL_29;
  }
  if (v15)
  {
    unsigned int v20 = v38;
    uint64_t v21 = v15;
    do
    {
      unsigned int v22 = *(int **)(a1 + 3896);
      int v23 = *v22;
      *(void *)(a1 + 3896) = v22 + 1;
      LODWORD(v22) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v22 - 4;
      if (v22 < 4) {
        puts("e: data_sz underflow in get_value");
      }
      *v20++ = v23;
      --v21;
    }
    while (v21);
    unsigned int v18 = v19;
  }
  unint64_t v24 = *(unsigned __int16 **)(a1 + 3896);
  unsigned int v25 = *v24;
  *(void *)(a1 + 3896) = v24 + 1;
  LODWORD(v24) = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v24 - 2;
  if (v24 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  WORD4(v39) = v25;
  if (v25 > 2)
  {
LABEL_10:
    unsigned int v16 = "e: set TLSC data failed. Too many frequency levels. ";
LABEL_11:
    puts(v16);
    return 0;
  }
  if (v18 - 2 < 0x28) {
    goto LABEL_29;
  }
  for (uint64_t i = 76; i != 116; i += 4)
  {
    uint64_t v27 = *(int **)(a1 + 3896);
    int v28 = *v27;
    *(void *)(a1 + 3896) = v27 + 1;
    LODWORD(v27) = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v27 - 4;
    if (v27 < 4) {
      puts("e: data_sz underflow in get_value");
    }
    *(_DWORD *)((char *)&v38[-1] + i) = v28;
  }
  if (v18 - 42 < 0x44)
  {
LABEL_29:
    printf("e: The data size(%zu)is actually lesser than remaining bytes(%d)\n");
    return 0;
  }
  for (uint64_t j = 116; j != 150; j += 2)
  {
    uint64_t v31 = *(__int16 **)(a1 + 3896);
    __int16 v32 = *v31;
    *(void *)(a1 + 3896) = v31 + 1;
    LODWORD(v31) = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v31 - 2;
    if (v31 < 2) {
      puts("e: data_sz underflow in get_value");
    }
    *(_WORD *)((char *)&v38[-1] + j) = v32;
  }
  unsigned int v33 = 1122 * v25 * v15;
  DWORD2(v44) = v33;
  if (v18 - 76 < v33)
  {
    printf("e: The data size(%d)is actually lesser than remaining bytes(%d)\n");
    return 0;
  }
  char v34 = malloc_type_aligned_alloc(0x4000uLL, (v33 & 0xFFFFC000) + (((v33 & 0x3FFE) != 0) << 14), 0x146CD730uLL);
  if (!v34)
  {
    unsigned int v16 = "e: could not allocate memory for TLSC data";
    goto LABEL_11;
  }
  __int16 v35 = v34;
  memcpy(v34, *(const void **)(a1 + 3896), v33 & 0xFFFFFFFE);
  uint64_t v45 = v35;
  uint64_t v17 = (*(uint64_t (**)(uint64_t, long long *, uint64_t, void, void, void))a1)(103, &v37, 168, 0, 0, *(void *)(a1 + 16));
  if (v17) {
    int v36 = "i: set TLSC data succeeded";
  }
  else {
    int v36 = "e: set TLSC data failed";
  }
  puts(v36);
  free(v35);
  return v17;
}

uint64_t sub_10000E098(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 3908)) {
    return 1;
  }
  if (*(unsigned __int16 *)(a2 + 6) << 16 != 0x20000) {
    return 0;
  }
  int v3 = *(_DWORD *)(a2 + 8);
  uint64_t v29 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  memset(v26, 0, sizeof(v26));
  LODWORD(v26[0]) = 1;
  unsigned int v4 = *(unsigned __int16 **)(a1 + 3896);
  uint64_t v5 = *v4;
  *(void *)(a1 + 3896) = v4 + 1;
  LODWORD(v4) = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v4 - 2;
  if (v4 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  WORD4(v26[0]) = v5;
  if (v5 >= 0xF)
  {
    printf("e: DPCl: More brightness taps( %d) then expected (%d) \n");
    return 0;
  }
  int v7 = 4 * v3 - 14;
  if (v5)
  {
    unsigned int v8 = (_DWORD *)((unint64_t)v26 | 0xC);
    uint64_t v9 = v5;
    do
    {
      unsigned int v10 = *(int **)(a1 + 3896);
      int v11 = *v10;
      *(void *)(a1 + 3896) = v10 + 1;
      LODWORD(v10) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v10 - 4;
      if (v10 < 4) {
        puts("e: data_sz underflow in get_value");
      }
      *v8++ = v11;
      --v9;
    }
    while (v9);
    v7 -= 2 * v5;
  }
  __int16 v12 = *(unsigned __int16 **)(a1 + 3896);
  uint64_t v13 = *v12;
  *(void *)(a1 + 3896) = v12 + 1;
  LODWORD(v12) = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v12 - 2;
  if (v12 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  WORD2(v27) = v13;
  if (v13 > 8)
  {
    printf("e: DPCl: More temperature taps( %d) then expected (%d) \n");
    return 0;
  }
  unsigned int v15 = v7 - 2;
  if (v13)
  {
    unsigned int v16 = (_WORD *)&v27 + 3;
    uint64_t v17 = v13;
    do
    {
      unsigned int v18 = *(__int16 **)(a1 + 3896);
      __int16 v19 = *v18;
      *(void *)(a1 + 3896) = v18 + 1;
      LODWORD(v18) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v18 - 2;
      if (v18 < 2) {
        puts("e: data_sz underflow in get_value");
      }
      *v16++ = v19;
      --v17;
    }
    while (v17);
    v15 -= 2 * v13;
  }
  int v20 = 9 * v13 * v5;
  size_t v21 = (36 * v13 * v5);
  DWORD2(v28) = v21;
  if (v15 < 4 * v20)
  {
    unsigned int v22 = "e: DPCl: Data size insufficient for the taps ";
LABEL_34:
    puts(v22);
    return 0;
  }
  int v23 = malloc_type_aligned_alloc(0x4000uLL, (v21 & 0xFFFFC000) + (((v21 & 0x3FFC) != 0) << 14), 0x20154B5AuLL);
  if (!v23)
  {
    unsigned int v22 = "e: DPCl: could not allocate memory for DPCl data";
    goto LABEL_34;
  }
  unint64_t v24 = v23;
  memcpy(v23, *(const void **)(a1 + 3896), v21);
  uint64_t v29 = v24;
  uint64_t v6 = (*(uint64_t (**)(uint64_t, _OWORD *, uint64_t, void, void, void))a1)(92, v26, 104, 0, 0, *(void *)(a1 + 16));
  if (v6) {
    unsigned int v25 = "i: set DPCl data succeeded";
  }
  else {
    unsigned int v25 = "e: set DPCl data failed";
  }
  puts(v25);
  free(v24);
  return v6;
}

uint64_t sub_10000E31C(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 3908)) {
    return 1;
  }
  if (*(unsigned __int16 *)(a2 + 6) > 2u) {
    return 0;
  }
  int v3 = *(_DWORD *)(a2 + 8);
  long long v29 = 0u;
  long long v28 = 0u;
  v27[0] = 1;
  unsigned int v4 = *(int **)(a1 + 3896);
  int v7 = *v4;
  uint64_t v5 = v4 + 1;
  int v6 = v7;
  *(void *)(a1 + 3896) = v5;
  unsigned int v8 = *(_DWORD *)(a1 + 3904);
  BOOL v9 = v8 >= 4;
  unsigned int v10 = v8 - 4;
  *(_DWORD *)(a1 + 3904) = v10;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v5 = *(int **)(a1 + 3896);
    unsigned int v10 = *(_DWORD *)(a1 + 3904);
  }
  v27[1] = v6;
  int v13 = *v5;
  int v11 = v5 + 1;
  int v12 = v13;
  *(void *)(a1 + 3896) = v11;
  BOOL v9 = v10 >= 4;
  unsigned int v14 = v10 - 4;
  *(_DWORD *)(a1 + 3904) = v14;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    int v11 = *(int **)(a1 + 3896);
    unsigned int v14 = *(_DWORD *)(a1 + 3904);
  }
  v27[2] = v12;
  int v15 = *v11;
  *(void *)(a1 + 3896) = v11 + 1;
  *(_DWORD *)(a1 + 3904) = v14 - 4;
  if (v14 < 4) {
    puts("e: data_sz underflow in get_value");
  }
  int v16 = 4 * v3;
  LODWORD(v28) = v15;
  for (uint64_t i = 16; i != 32; ++i)
  {
    unsigned int v18 = *(char **)(a1 + 3896);
    char v19 = *v18;
    *(void *)(a1 + 3896) = v18 + 1;
    LODWORD(v18) = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v18 - 1;
    if (!v18) {
      puts("e: data_sz underflow in get_value");
    }
    *((unsigned char *)v27 + i) = v19;
  }
  int v20 = *(unsigned int **)(a1 + 3896);
  size_t v21 = *v20;
  *(void *)(a1 + 3896) = v20 + 1;
  LODWORD(v20) = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v20 - 4;
  if (v20 < 4) {
    puts("e: data_sz underflow in get_value");
  }
  DWORD1(v29) = v21;
  if (v16 - 44 < v21) {
    printf("e: The data size(%d)is actually lesser than remaining bytes(%d)\n", v21, v16 - 44);
  }
  unsigned int v22 = malloc_type_aligned_alloc(0x4000uLL, (v21 & 0xFFFFC000) + (((v21 & 0x3FFF) != 0) << 14), 0xCA1A915BuLL);
  if (!v22)
  {
    puts("e: could not allocate memory for USPC data");
    return 0;
  }
  int v23 = v22;
  memcpy(v22, *(const void **)(a1 + 3896), v21);
  *((void *)&v29 + 1) = v23;
  uint64_t v24 = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, void, void, void))a1)(90, v27, 44, 0, 0, *(void *)(a1 + 16));
  if (v24) {
    unsigned int v25 = "i: set USPC data succeeded";
  }
  else {
    unsigned int v25 = "e: set USPC data failed";
  }
  puts(v25);
  free(v23);
  return v24;
}

uint64_t sub_10000E560(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 3908)) {
    return 1;
  }
  if (*(unsigned __int16 *)(a2 + 6) > 2u) {
    return 0;
  }
  int v4 = *(_DWORD *)(a2 + 8);
  uint64_t v50 = 0;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  LODWORD(v47) = 1;
  BYTE8(v47) = 1;
  uint64_t v5 = *(unsigned __int8 **)(a1 + 3896);
  int v8 = *v5;
  int v6 = v5 + 1;
  int v7 = v8;
  *(void *)(a1 + 3896) = v6;
  int v9 = *(_DWORD *)(a1 + 3904);
  BOOL v10 = v9 != 0;
  int v11 = v9 - 1;
  *(_DWORD *)(a1 + 3904) = v11;
  if (!v10)
  {
    puts("e: data_sz underflow in get_value");
    int v6 = *(unsigned __int8 **)(a1 + 3896);
    int v11 = *(_DWORD *)(a1 + 3904);
  }
  int v46 = v7;
  LOBYTE(v50) = v7;
  int v14 = *v6;
  int v12 = v6 + 1;
  int v13 = v14;
  *(void *)(a1 + 3896) = v12;
  BOOL v10 = v11 != 0;
  int v15 = v11 - 1;
  *(_DWORD *)(a1 + 3904) = v15;
  if (!v10)
  {
    puts("e: data_sz underflow in get_value");
    int v12 = *(unsigned __int8 **)(a1 + 3896);
    int v15 = *(_DWORD *)(a1 + 3904);
  }
  BYTE1(v50) = v13;
  int v18 = *v12;
  int v16 = v12 + 1;
  int v17 = v18;
  *(void *)(a1 + 3896) = v16;
  BOOL v10 = v15 != 0;
  int v19 = v15 - 1;
  *(_DWORD *)(a1 + 3904) = v19;
  if (!v10)
  {
    puts("e: data_sz underflow in get_value");
    int v16 = *(unsigned __int8 **)(a1 + 3896);
    int v19 = *(_DWORD *)(a1 + 3904);
  }
  BYTE12(v48) = v17;
  int v22 = *v16;
  int v20 = v16 + 1;
  int v21 = v22;
  *(void *)(a1 + 3896) = v20;
  BOOL v10 = v19 != 0;
  int v23 = v19 - 1;
  *(_DWORD *)(a1 + 3904) = v23;
  if (!v10)
  {
    puts("e: data_sz underflow in get_value");
    int v20 = *(unsigned __int8 **)(a1 + 3896);
    int v23 = *(_DWORD *)(a1 + 3904);
  }
  BYTE13(v48) = v21;
  int v26 = *v20;
  uint64_t v24 = v20 + 1;
  int v25 = v26;
  *(void *)(a1 + 3896) = v24;
  BOOL v10 = v23 != 0;
  int v27 = v23 - 1;
  *(_DWORD *)(a1 + 3904) = v27;
  if (!v10)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v24 = *(unsigned __int8 **)(a1 + 3896);
    int v27 = *(_DWORD *)(a1 + 3904);
  }
  BYTE10(v48) = v25;
  int v30 = *v24;
  long long v28 = v24 + 1;
  int v29 = v30;
  *(void *)(a1 + 3896) = v28;
  BOOL v10 = v27 != 0;
  int v31 = v27 - 1;
  *(_DWORD *)(a1 + 3904) = v31;
  if (!v10)
  {
    puts("e: data_sz underflow in get_value");
    long long v28 = *(unsigned __int8 **)(a1 + 3896);
    int v31 = *(_DWORD *)(a1 + 3904);
  }
  BYTE11(v48) = v29;
  int v32 = *v28;
  *(void *)(a1 + 3896) = v28 + 1;
  *(_DWORD *)(a1 + 3904) = v31 - 1;
  if (!v31) {
    puts("e: data_sz underflow in get_value");
  }
  int v33 = 4 * v4;
  BYTE2(v50) = v32;
  int v34 = *(_DWORD *)(a2 + 4);
  char v35 = 1;
  if (v34 == 0x20000)
  {
    BYTE9(v47) = 1;
    long long v39 = *(unsigned int **)(a1 + 3896);
    unsigned int v37 = *v39;
    *(void *)(a1 + 3896) = v39 + 1;
    LODWORD(v39) = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v39 - 4;
    if (v39 < 4) {
      puts("e: data_sz underflow in get_value");
    }
    char v35 = 0;
    unsigned int v36 = v33 - 39;
  }
  else
  {
    unsigned int v36 = v33 - 19;
    if (v34 == 0x10000)
    {
      BYTE9(v47) = 0;
      unsigned int v37 = (v13 + v13 * v21) * (4 * v32 * v25 * v29 + 8 * (v46 + v46 * v17));
    }
    else
    {
      unsigned int v37 = 0;
    }
  }
  int v40 = (v37 & 0x3FFF) != 0;
  LODWORD(v49) = (v37 & 0xFFFFC000) + (v40 << 14);
  if (v37 > v36 || v37 < v36 - 3)
  {
    long long v44 = "e: incoming data not well formed";
LABEL_36:
    puts(v44);
    return 0;
  }
  long long v41 = malloc_type_aligned_alloc(0x4000uLL, (v37 & 0xFFFFC000) + (v40 << 14), 0xD4291D20uLL);
  if (!v41)
  {
    long long v44 = "e: could not allocate memory for PSFM data";
    goto LABEL_36;
  }
  long long v42 = v41;
  memcpy(v41, *(const void **)(a1 + 3896), (int)v37);
  *((void *)&v49 + 1) = v42;
  if ((v35 & 1) == 0) {
    sub_100012D98(a1, (unsigned char *)((unint64_t)&v47 | 0xA), 0x10uLL);
  }
  uint64_t v38 = (*(uint64_t (**)(uint64_t, long long *, uint64_t, void, void, void))a1)(52, &v47, 56, 0, 0, *(void *)(a1 + 16));
  if (v38) {
    long long v43 = "i: set PSFM data succeeded";
  }
  else {
    long long v43 = "e: set PSFM data failed";
  }
  puts(v43);
  free(v42);
  return v38;
}

uint64_t sub_10000E8A8(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 3908)) {
    return 1;
  }
  uint64_t v3 = *(unsigned int *)(a2 + 8);
  if (v3 > 0x14) {
    return 0;
  }
  int v5 = *(_DWORD *)(a2 + 4);
  if (v5 != 0x20000 && v5 != 0x10000) {
    return 0;
  }
  if (v5 == 0x20000) {
    uint64_t v6 = -2;
  }
  else {
    uint64_t v6 = -1;
  }
  int v7 = *(unsigned __int16 **)(a1 + 3896);
  int v10 = *v7;
  int v8 = v7 + 1;
  int v9 = v10;
  *(void *)(a1 + 3896) = v8;
  unsigned int v11 = *(_DWORD *)(a1 + 3904);
  BOOL v12 = v11 >= 2;
  unsigned int v13 = v11 - 2;
  *(_DWORD *)(a1 + 3904) = v13;
  if (!v12)
  {
    puts("e: data_sz underflow in get_value");
    int v8 = *(unsigned __int16 **)(a1 + 3896);
    unsigned int v13 = *(_DWORD *)(a1 + 3904);
  }
  int v16 = *v8;
  int v14 = (unsigned __int8 *)(v8 + 1);
  int v15 = v16;
  *(void *)(a1 + 3896) = v14;
  BOOL v12 = v13 >= 2;
  unsigned int v17 = v13 - 2;
  *(_DWORD *)(a1 + 3904) = v17;
  if (!v12)
  {
    puts("e: data_sz underflow in get_value");
    int v14 = *(unsigned __int8 **)(a1 + 3896);
    unsigned int v17 = *(_DWORD *)(a1 + 3904);
  }
  int v18 = *v14;
  *(void *)(a1 + 3896) = v14 + 1;
  *(_DWORD *)(a1 + 3904) = v17 - 1;
  if (!v17) {
    puts("e: data_sz underflow in get_value");
  }
  if (*(_DWORD *)(a2 + 4) != 0x20000)
  {
    int v20 = 0;
LABEL_22:
    unsigned int v21 = 0;
    goto LABEL_23;
  }
  int v19 = *(int **)(a1 + 3896);
  int v20 = *v19;
  *(void *)(a1 + 3896) = v19 + 1;
  LODWORD(v19) = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v19 - 4;
  if (v19 < 4) {
    puts("e: data_sz underflow in get_value");
  }
  if (v20 != 21474837)
  {
    if (v20 == 17913593)
    {
      unsigned int v21 = 1;
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  unsigned int v21 = 2;
LABEL_23:
  uint64_t v23 = a1 + 88 * v21;
  *(_DWORD *)(v23 + 2224) = 1;
  uint64_t v24 = (int *)malloc_type_calloc(1uLL, 0x60uLL, 0x102004029C71177uLL);
  if (!v24)
  {
    puts("e: no memory");
    return 0;
  }
  int v25 = v24;
  int v26 = v15;
  int v27 = v9;
  unint64_t v28 = (4 * (v3 + v6) - 13) / 3uLL;
  int v29 = 3 * v28;
  uint64_t v30 = a1 + 88 * v21;
  int v31 = *(_DWORD *)(v30 + 2308);
  if (v31)
  {
    if (v29 != v31)
    {
      int v32 = "e: lut sizes should be the same";
LABEL_31:
      puts(v32);
LABEL_46:
      free(v25);
      return 0;
    }
  }
  else
  {
    *(_DWORD *)(v30 + 2308) = v29;
  }
  int v33 = v26 << 8;
  bzero(v24, 0x60uLL);
  v25[2] = v33;
  v25[3] = v27;
  v25[4] = v18;
  v25[5] = v20;
  v25[7] = v28;
  if (v28 > 0x14)
  {
    int v32 = "e: lut size too big";
    goto LABEL_31;
  }
  uint64_t v34 = 0;
  unsigned int v44 = v21;
  uint64_t v45 = v23 + 2232;
  char v35 = v25 + 8;
  do
  {
    uint64_t v36 = v28;
    unsigned int v37 = v35;
    if (v28)
    {
      do
      {
        uint64_t v38 = *(char **)(a1 + 3896);
        char v39 = *v38;
        *(void *)(a1 + 3896) = v38 + 1;
        LODWORD(v38) = *(_DWORD *)(a1 + 3904);
        *(_DWORD *)(a1 + 3904) = v38 - 1;
        if (!v38) {
          puts("e: data_sz underflow in get_value");
        }
        *(unsigned char *)unsigned int v37 = v39;
        unsigned int v37 = (int *)((char *)v37 + 3);
        --v36;
      }
      while (v36);
    }
    ++v34;
    char v35 = (int *)((char *)v35 + 1);
  }
  while (v34 != 3);
  if ((sub_100014B50(a1, v25[2], (int *)v45, (_WORD *)(v45 + 62)) & 1) == 0
    || !sub_100014BFC(a1, *((unsigned __int16 *)v25 + 6), (_WORD *)(v45 + 40), (_WORD *)(v45 + 64))
    || !sub_100014F70(a1, *((unsigned __int8 *)v25 + 16), (unsigned char *)(v45 + 60), (_WORD *)(v45 + 66))
    || !sub_10000A9F4(a1, (uint64_t)v25, v44))
  {
    goto LABEL_46;
  }
  uint64_t result = 1;
  if (v25[4])
  {
    uint64_t v40 = a1 + 88 * v44;
    int v41 = *(_DWORD *)(v40 + 2304);
    int v42 = (1 << v25[3]) | v41;
    *(_DWORD *)(v40 + 2304) = v42;
    __int16 v43 = *(_WORD *)(v45 + 68);
    if (v41 != v42) {
      ++v43;
    }
    *(_WORD *)(v45 + 68) = v43;
  }
  return result;
}

uint64_t sub_10000EBF8(uint64_t a1, uint64_t a2)
{
  memcpy(__dst, &unk_1000294B0, sizeof(__dst));
  int v4 = *(_DWORD *)(a2 + 8);
  char v26 = 0;
  int v25 = 0;
  __dst[0] = 1;
  unsigned int v5 = v4 - 3;
  if (v4 != 3)
  {
    while (1)
    {
      unsigned int v6 = *(_DWORD *)(a1 + 3904);
      unsigned int v7 = v6 - 12;
      if (v6 < 0xC) {
        goto LABEL_71;
      }
      int v8 = *(int **)(a1 + 3896);
      int v9 = *v8;
      int v10 = v8[1];
      v22[0] = v9;
      v22[1] = v10;
      unsigned int v11 = v8[2];
      v22[2] = v11;
      BOOL v12 = !v9 || v10 == 0;
      if (v12 || v11 == 0)
      {
LABEL_71:
        unsigned int v21 = "e: invalid header";
        goto LABEL_73;
      }
      *(void *)(a1 + 3896) = v8 + 3;
      *(_DWORD *)(a1 + 3904) = v7;
      BOOL v14 = v5 >= v11;
      v5 -= v11;
      if (!v14)
      {
        unsigned int v21 = "e: input data not well-formed";
        goto LABEL_73;
      }
      v24[0] = HIBYTE(v9);
      v24[1] = BYTE2(v9);
      v24[2] = BYTE1(v9);
      v24[3] = v9;
      v24[4] = 0;
      if (v9 > 1380734291) {
        break;
      }
      if (v9 <= 1297303107)
      {
        if (v9 <= 1129600587)
        {
          if (v9 == 1129469516)
          {
            uint64_t v15 = a1;
            int v16 = &__dst[618];
          }
          else
          {
            if (v9 != 1129470032) {
              goto LABEL_75;
            }
            uint64_t v15 = a1;
            int v16 = &__dst[617];
          }
LABEL_60:
          unsigned int v17 = 1;
        }
        else
        {
          if (v9 != 1129600588)
          {
            if (v9 == 1129601104)
            {
              uint64_t v15 = a1;
              int v16 = &__dst[619];
              goto LABEL_60;
            }
            if (v9 != 1230128472) {
              goto LABEL_75;
            }
            uint64_t v15 = a1;
            int v16 = &__dst[1];
            goto LABEL_54;
          }
          uint64_t v15 = a1;
          int v16 = &__dst[620];
          unsigned int v17 = 4;
        }
LABEL_61:
        int v18 = 1;
        goto LABEL_62;
      }
      if (v9 <= 1347568470)
      {
        if (v9 == 1297303108)
        {
          if (sub_10000AA74(a1, v22, &__dst[728], 1u, 1, 0)) {
            __dst[0] = 2;
          }
          goto LABEL_64;
        }
        if (v9 != 1347568452)
        {
LABEL_75:
          printf("e: unknown block name %s\n", v24);
          return 0;
        }
        uint64_t v15 = a1;
        int v16 = &__dst[712];
        unsigned int v17 = 16;
        int v18 = 0;
LABEL_62:
        int v19 = 0;
LABEL_63:
        sub_10000AA74(v15, v22, v16, v17, v18, v19);
        goto LABEL_64;
      }
      if (v9 != 1347568471)
      {
        if (v9 == 1380209478)
        {
          uint64_t v15 = a1;
          int v16 = &__dst[695];
        }
        else
        {
          if (v9 != 1380336984) {
            goto LABEL_75;
          }
          uint64_t v15 = a1;
          int v16 = &__dst[694];
        }
        goto LABEL_60;
      }
      sub_100015024(a1, v22, (uint64_t)__dst);
LABEL_64:
      if (!v5) {
        goto LABEL_69;
      }
    }
    if (v9 <= 1446069591)
    {
      if (v9 <= 1395803479)
      {
        if (v9 == 1380734292)
        {
          uint64_t v15 = a1;
          int v19 = &__dst[16];
          int v16 = &__dst[17];
          unsigned int v17 = 600;
          int v18 = 0;
          goto LABEL_63;
        }
        if (v9 != 1395737944) {
          goto LABEL_75;
        }
        uint64_t v15 = a1;
        int v16 = &__dst[7];
      }
      else
      {
        switch(v9)
        {
          case 1395803480:
            uint64_t v15 = a1;
            int v16 = &__dst[10];
            break;
          case 1395869016:
            uint64_t v15 = a1;
            int v16 = &__dst[13];
            break;
          case 1397310808:
            uint64_t v15 = a1;
            int v16 = &__dst[4];
            break;
          default:
            goto LABEL_75;
        }
      }
LABEL_54:
      unsigned int v17 = 3;
    }
    else
    {
      if (v9 <= 1447642455)
      {
        switch(v9)
        {
          case 1446069592:
            uint64_t v15 = a1;
            int v16 = &__dst[691];
            break;
          case 1446135128:
            uint64_t v15 = a1;
            int v16 = &__dst[692];
            break;
          case 1446200664:
            uint64_t v15 = a1;
            int v16 = &__dst[693];
            break;
          default:
            goto LABEL_75;
        }
        goto LABEL_60;
      }
      if (v9 == 1447642456)
      {
        uint64_t v15 = a1;
        int v16 = &__dst[690];
        goto LABEL_60;
      }
      if (v9 == 1447839064)
      {
        uint64_t v15 = a1;
        int v16 = &__dst[624];
        goto LABEL_60;
      }
      if (v9 != 1447843404) {
        goto LABEL_75;
      }
      uint64_t v15 = a1;
      int v16 = &__dst[625];
      unsigned int v17 = 65;
    }
    goto LABEL_61;
  }
LABEL_69:
  if ((*(unsigned int (**)(uint64_t, _DWORD *, uint64_t, void, void, void))a1)(8, __dst, 3108, 0, 0, *(void *)(a1 + 16)))
  {
    puts("i: set CA data succeeded");
    return 1;
  }
  else
  {
    unsigned int v21 = "e: set CA data failed";
LABEL_73:
    puts(v21);
    return 0;
  }
}

uint64_t sub_10000F15C(uint64_t a1, uint64_t a2)
{
  int v3 = HIWORD(*(_DWORD *)(a2 + 4));
  if (v3 == 4)
  {
    return sub_100015180(a1, a2);
  }
  int v5 = *(_DWORD *)(a2 + 8) - 3;
  if (v3 == 1) {
    int v6 = 389;
  }
  else {
    int v6 = 390;
  }
  if (v5 != v6)
  {
    uint64_t v15 = "e: PRC table not well formed";
LABEL_23:
    puts(v15);
    return 0;
  }
  if (*(_DWORD *)(a1 + 3904) < (4 * v5)) {
    return 0;
  }
  unsigned int v7 = 4 * v5;
  *(_DWORD *)(a1 + 3904) = v7;
  if (v3 == 2)
  {
    if (!v7) {
      return 0;
    }
    *(void *)(a1 + 3896) += 2;
    v7 -= 2;
    *(_DWORD *)(a1 + 3904) = v7;
  }
  unsigned int v8 = v7 - 2;
  if (v7 < 2) {
    return 0;
  }
  int v9 = *(unsigned __int16 **)(a1 + 3896);
  unsigned int v10 = *v9;
  *(void *)(a1 + 3896) = v9 + 1;
  *(_DWORD *)(a1 + 3904) = v8;
  if (v8 < 2) {
    return 0;
  }
  unsigned int v11 = v9[1];
  *(void *)(a1 + 3896) = v9 + 2;
  *(_DWORD *)(a1 + 3904) = v7 - 4;
  if (v7 - 4 < 2) {
    return 0;
  }
  unsigned int v12 = v9[2];
  *(void *)(a1 + 3896) = v9 + 3;
  *(_DWORD *)(a1 + 3904) = v7 - 6;
  if (v7 - 6 < 2) {
    return 0;
  }
  unsigned int v13 = v9[3];
  *(void *)(a1 + 3896) = v9 + 4;
  *(_DWORD *)(a1 + 3904) = v7 - 8;
  if (v3 == 2)
  {
    if (v7 - 8 >= 2)
    {
      int v14 = v9[4];
      *(void *)(a1 + 3896) = v9 + 5;
      *(_DWORD *)(a1 + 3904) = v7 - 10;
      if (v14)
      {
        if (v7 - 10 >= 0x60C)
        {
          *(void *)(a1 + 3896) = v9 + 779;
          *(_DWORD *)(a1 + 3904) = v7 - 1558;
          return 1;
        }
        return 0;
      }
      goto LABEL_25;
    }
    return 0;
  }
LABEL_25:
  int v16 = (unsigned int *)malloc_type_calloc(1uLL, 0x628uLL, 0x10200404B1403A4uLL);
  if (!v16)
  {
    uint64_t v15 = "e: out of memory for PRC table";
    goto LABEL_23;
  }
  unsigned int v17 = v16;
  uint64_t v18 = 0;
  v16[5] = v13;
  v16[6] = 2;
  v16[2] = v10;
  v16[3] = v11;
  v16[4] = v12;
  int v19 = v16 + 7;
  unsigned int v20 = *(_DWORD *)(a1 + 3904);
  do
  {
    if (v20 < 0x202) {
      goto LABEL_43;
    }
    uint64_t v21 = 0;
    uint64_t v22 = *(void *)(a1 + 3896);
    unint64_t v23 = v20 - 2;
    uint64_t v24 = v23 >> 1;
    if (v23 >> 1 >= 0x100) {
      uint64_t v24 = 256;
    }
    uint64_t v25 = 2 * v24 + 2;
    unint64_t v26 = -1;
    do
    {
      *(_WORD *)((char *)v19 + v21) = *(_WORD *)(v22 + v21);
      v21 += 2;
      ++v26;
    }
    while (v25 != v21);
    *(void *)(a1 + 3896) = v22 + v21;
    unsigned int v27 = v20 - v21;
    *(_DWORD *)(a1 + 3904) = v27;
    if (v26 < 0x100 || v27 < 2) {
      goto LABEL_43;
    }
    *(void *)(a1 + 3896) = v22 + v21 + 2;
    unsigned int v20 = v23 - v21;
    *(_DWORD *)(a1 + 3904) = v23 - v21;
    ++v18;
    int v19 = (_DWORD *)((char *)v19 + 514);
  }
  while (v18 != 3);
  unint64_t v28 = *(uint64_t **)(a1 + 2824);
  if (v28)
  {
    while (*((_DWORD *)v28 + 2) != v10
         || *((_DWORD *)v28 + 3) != v11
         || *((_DWORD *)v28 + 4) != v12
         || *((_DWORD *)v28 + 5) != v13)
    {
      unint64_t v28 = (uint64_t *)*v28;
      if (!v28) {
        goto LABEL_41;
      }
    }
    puts("e: duplicate PRC table found in input");
    goto LABEL_43;
  }
LABEL_41:
  sub_100015664(a1, v10, (unsigned int *)(a1 + 2520), (unsigned int *)(a1 + 2616));
  sub_100015664(a1, v17[3], (unsigned int *)(a1 + 2720), (unsigned int *)(a1 + 2816));
  sub_100015664(a1, v17[4], (unsigned int *)(a1 + 2620), (unsigned int *)(a1 + 2716));
  unsigned int v29 = v17[5];
  if (v29 >= 2)
  {
    printf("e: unexpected value for polarity %d\n", v17[5]);
LABEL_43:
    free(v17);
    return 0;
  }
  uint64_t result = 1;
  int v30 = *(_DWORD *)(a1 + 2512) | (1 << v29);
  *(_DWORD *)(a1 + 2512) = v30;
  if (v30 == 3) {
    int v31 = 2;
  }
  else {
    int v31 = 1;
  }
  *(_DWORD *)(a1 + 2820) = v31;
  *(void *)unsigned int v17 = *(void *)(a1 + 2824);
  *(void *)(a1 + 2824) = v17;
  return result;
}

uint64_t sub_10000F4A4(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0;
  unint64_t v4 = *(unsigned int *)(a2 + 8);
  if (v4 >= 3 && !((v4 - 3) >> 32))
  {
    __int16 v10 = 0;
    uint64_t v9 = 0;
    uint64_t v5 = *(unsigned int *)(a2 + 4);
    HIDWORD(v6) = *(_DWORD *)(a2 + 4);
    LODWORD(v6) = v5 - 0x40000;
    switch((v6 >> 16))
    {
      case 0u:
        int v7 = 1;
        goto LABEL_8;
      case 1u:
        *(_DWORD *)(a1 + 2832) = 2;
        operator new();
      case 2u:
        int v7 = 3;
LABEL_8:
        *(_DWORD *)(a1 + 2832) = v7;
        operator new();
      case 3u:
        *(_DWORD *)(a1 + 2832) = 4;
        operator new();
      case 4u:
        *(_DWORD *)(a1 + 2832) = 5;
        operator new();
      case 5u:
        *(_DWORD *)(a1 + 2832) = 6;
        operator new();
      default:
        *(_DWORD *)(a1 + 2832) = 0;
        printf("e: unsupported AlsH version: 0x%x\n", v5);
        uint64_t result = 0;
        switch(*(_DWORD *)(a1 + 2832))
        {
          case 1:
          case 3:
            unsigned int v8 = (void *)(a1 + 2840);
            if (*(void *)(a1 + 2840)) {
              goto LABEL_20;
            }
            goto LABEL_21;
          case 2:
            unsigned int v8 = (void *)(a1 + 2840);
            if (*(void *)(a1 + 2840)) {
              goto LABEL_20;
            }
            goto LABEL_21;
          case 4:
            unsigned int v8 = (void *)(a1 + 2840);
            if (*(void *)(a1 + 2840)) {
              goto LABEL_20;
            }
            goto LABEL_21;
          case 6:
            unsigned int v8 = (void *)(a1 + 2840);
            if (*(void *)(a1 + 2840)) {
LABEL_20:
            }
              operator delete();
LABEL_21:
            uint64_t result = 0;
            *unsigned int v8 = 0;
            break;
          default:
            return result;
        }
        break;
    }
  }
  return result;
}

uint64_t sub_10000FBBC(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int16 *)(a2 + 6) > 2u) {
    return 0;
  }
  int v3 = *(_DWORD *)(a2 + 8);
  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  LODWORD(v141) = 1;
  unint64_t v4 = *(char **)(a1 + 3896);
  char v7 = *v4;
  uint64_t v5 = v4 + 1;
  char v6 = v7;
  *(void *)(a1 + 3896) = v5;
  int v8 = *(_DWORD *)(a1 + 3904);
  BOOL v9 = v8 != 0;
  int v10 = v8 - 1;
  *(_DWORD *)(a1 + 3904) = v10;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v5 = *(unsigned char **)(a1 + 3896);
    int v10 = *(_DWORD *)(a1 + 3904);
  }
  LOBYTE(v142) = v6;
  char v13 = *v5;
  unsigned int v11 = (__int16 *)(v5 + 1);
  char v12 = v13;
  *(void *)(a1 + 3896) = v11;
  BOOL v9 = v10 != 0;
  unsigned int v14 = v10 - 1;
  *(_DWORD *)(a1 + 3904) = v14;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v11 = *(__int16 **)(a1 + 3896);
    unsigned int v14 = *(_DWORD *)(a1 + 3904);
  }
  BYTE1(v142) = v12;
  __int16 v17 = *v11;
  uint64_t v15 = v11 + 1;
  __int16 v16 = v17;
  *(void *)(a1 + 3896) = v15;
  BOOL v9 = v14 >= 2;
  unsigned int v18 = v14 - 2;
  *(_DWORD *)(a1 + 3904) = v18;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v15 = *(__int16 **)(a1 + 3896);
    unsigned int v18 = *(_DWORD *)(a1 + 3904);
  }
  WORD1(v142) = v16;
  __int16 v21 = *v15;
  int v19 = v15 + 1;
  __int16 v20 = v21;
  *(void *)(a1 + 3896) = v19;
  BOOL v9 = v18 >= 2;
  unsigned int v22 = v18 - 2;
  *(_DWORD *)(a1 + 3904) = v22;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    int v19 = *(__int16 **)(a1 + 3896);
    unsigned int v22 = *(_DWORD *)(a1 + 3904);
  }
  WORD2(v142) = v20;
  __int16 v25 = *v19;
  unint64_t v23 = v19 + 1;
  __int16 v24 = v25;
  *(void *)(a1 + 3896) = v23;
  BOOL v9 = v22 >= 2;
  unsigned int v26 = v22 - 2;
  *(_DWORD *)(a1 + 3904) = v26;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    unint64_t v23 = *(__int16 **)(a1 + 3896);
    unsigned int v26 = *(_DWORD *)(a1 + 3904);
  }
  WORD3(v142) = v24;
  __int16 v29 = *v23;
  unsigned int v27 = v23 + 1;
  __int16 v28 = v29;
  *(void *)(a1 + 3896) = v27;
  BOOL v9 = v26 >= 2;
  unsigned int v30 = v26 - 2;
  *(_DWORD *)(a1 + 3904) = v30;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v27 = *(__int16 **)(a1 + 3896);
    unsigned int v30 = *(_DWORD *)(a1 + 3904);
  }
  WORD4(v142) = v28;
  __int16 v33 = *v27;
  int v31 = v27 + 1;
  __int16 v32 = v33;
  *(void *)(a1 + 3896) = v31;
  BOOL v9 = v30 >= 2;
  unsigned int v34 = v30 - 2;
  *(_DWORD *)(a1 + 3904) = v34;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    int v31 = *(_WORD **)(a1 + 3896);
    unsigned int v34 = *(_DWORD *)(a1 + 3904);
  }
  WORD5(v142) = v32;
  __int16 v37 = *v31;
  char v35 = v31 + 1;
  __int16 v36 = v37;
  *(void *)(a1 + 3896) = v35;
  BOOL v9 = v34 >= 2;
  unsigned int v38 = v34 - 2;
  *(_DWORD *)(a1 + 3904) = v38;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    char v35 = *(unsigned char **)(a1 + 3896);
    unsigned int v38 = *(_DWORD *)(a1 + 3904);
  }
  WORD6(v142) = v36;
  char v41 = *v35;
  char v39 = (__int16 *)(v35 + 1);
  char v40 = v41;
  *(void *)(a1 + 3896) = v39;
  BOOL v9 = v38 != 0;
  unsigned int v42 = v38 - 1;
  *(_DWORD *)(a1 + 3904) = v42;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    char v39 = *(__int16 **)(a1 + 3896);
    unsigned int v42 = *(_DWORD *)(a1 + 3904);
  }
  BYTE14(v142) = v40;
  __int16 v45 = *v39;
  __int16 v43 = v39 + 1;
  __int16 v44 = v45;
  *(void *)(a1 + 3896) = v43;
  BOOL v9 = v42 >= 2;
  unsigned int v46 = v42 - 2;
  *(_DWORD *)(a1 + 3904) = v46;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    __int16 v43 = *(_WORD **)(a1 + 3896);
    unsigned int v46 = *(_DWORD *)(a1 + 3904);
  }
  LOWORD(v143) = v44;
  __int16 v49 = *v43;
  long long v47 = v43 + 1;
  __int16 v48 = v49;
  *(void *)(a1 + 3896) = v47;
  BOOL v9 = v46 >= 2;
  unsigned int v50 = v46 - 2;
  *(_DWORD *)(a1 + 3904) = v50;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    long long v47 = *(unsigned char **)(a1 + 3896);
    unsigned int v50 = *(_DWORD *)(a1 + 3904);
  }
  WORD1(v143) = v48;
  char v53 = *v47;
  int v51 = (__int16 *)(v47 + 1);
  char v52 = v53;
  *(void *)(a1 + 3896) = v51;
  BOOL v9 = v50 != 0;
  unsigned int v54 = v50 - 1;
  *(_DWORD *)(a1 + 3904) = v54;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    int v51 = *(__int16 **)(a1 + 3896);
    unsigned int v54 = *(_DWORD *)(a1 + 3904);
  }
  BYTE4(v143) = v52;
  __int16 v57 = *v51;
  int v55 = v51 + 1;
  __int16 v56 = v57;
  *(void *)(a1 + 3896) = v55;
  BOOL v9 = v54 >= 2;
  unsigned int v58 = v54 - 2;
  *(_DWORD *)(a1 + 3904) = v58;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    int v55 = *(__int16 **)(a1 + 3896);
    unsigned int v58 = *(_DWORD *)(a1 + 3904);
  }
  WORD3(v143) = v56;
  __int16 v61 = *v55;
  int v59 = v55 + 1;
  __int16 v60 = v61;
  *(void *)(a1 + 3896) = v59;
  BOOL v9 = v58 >= 2;
  unsigned int v62 = v58 - 2;
  *(_DWORD *)(a1 + 3904) = v62;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    int v59 = *(__int16 **)(a1 + 3896);
    unsigned int v62 = *(_DWORD *)(a1 + 3904);
  }
  WORD4(v143) = v60;
  __int16 v65 = *v59;
  __int16 v63 = v59 + 1;
  __int16 v64 = v65;
  *(void *)(a1 + 3896) = v63;
  BOOL v9 = v62 >= 2;
  unsigned int v66 = v62 - 2;
  *(_DWORD *)(a1 + 3904) = v66;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    __int16 v63 = *(__int16 **)(a1 + 3896);
    unsigned int v66 = *(_DWORD *)(a1 + 3904);
  }
  WORD5(v143) = v64;
  __int16 v69 = *v63;
  v67 = v63 + 1;
  __int16 v68 = v69;
  *(void *)(a1 + 3896) = v67;
  BOOL v9 = v66 >= 2;
  unsigned int v70 = v66 - 2;
  *(_DWORD *)(a1 + 3904) = v70;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    v67 = *(__int16 **)(a1 + 3896);
    unsigned int v70 = *(_DWORD *)(a1 + 3904);
  }
  WORD6(v143) = v68;
  __int16 v73 = *v67;
  int v71 = v67 + 1;
  __int16 v72 = v73;
  *(void *)(a1 + 3896) = v71;
  BOOL v9 = v70 >= 2;
  unsigned int v74 = v70 - 2;
  *(_DWORD *)(a1 + 3904) = v74;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    int v71 = *(__int16 **)(a1 + 3896);
    unsigned int v74 = *(_DWORD *)(a1 + 3904);
  }
  HIWORD(v143) = v72;
  __int16 v77 = *v71;
  float v75 = v71 + 1;
  __int16 v76 = v77;
  *(void *)(a1 + 3896) = v75;
  BOOL v9 = v74 >= 2;
  unsigned int v78 = v74 - 2;
  *(_DWORD *)(a1 + 3904) = v78;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    float v75 = *(__int16 **)(a1 + 3896);
    unsigned int v78 = *(_DWORD *)(a1 + 3904);
  }
  LOWORD(v144) = v76;
  __int16 v81 = *v75;
  int v79 = v75 + 1;
  __int16 v80 = v81;
  *(void *)(a1 + 3896) = v79;
  BOOL v9 = v78 >= 2;
  unsigned int v82 = v78 - 2;
  *(_DWORD *)(a1 + 3904) = v82;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    int v79 = *(__int16 **)(a1 + 3896);
    unsigned int v82 = *(_DWORD *)(a1 + 3904);
  }
  WORD1(v144) = v80;
  __int16 v85 = *v79;
  int v83 = v79 + 1;
  __int16 v84 = v85;
  *(void *)(a1 + 3896) = v83;
  BOOL v9 = v82 >= 2;
  unsigned int v86 = v82 - 2;
  *(_DWORD *)(a1 + 3904) = v86;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    int v83 = *(__int16 **)(a1 + 3896);
    unsigned int v86 = *(_DWORD *)(a1 + 3904);
  }
  WORD2(v144) = v84;
  __int16 v89 = *v83;
  int v87 = v83 + 1;
  __int16 v88 = v89;
  *(void *)(a1 + 3896) = v87;
  BOOL v9 = v86 >= 2;
  unsigned int v90 = v86 - 2;
  *(_DWORD *)(a1 + 3904) = v90;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    int v87 = *(__int16 **)(a1 + 3896);
    unsigned int v90 = *(_DWORD *)(a1 + 3904);
  }
  WORD3(v144) = v88;
  __int16 v93 = *v87;
  int v91 = v87 + 1;
  __int16 v92 = v93;
  *(void *)(a1 + 3896) = v91;
  BOOL v9 = v90 >= 2;
  unsigned int v94 = v90 - 2;
  *(_DWORD *)(a1 + 3904) = v94;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    int v91 = *(__int16 **)(a1 + 3896);
    unsigned int v94 = *(_DWORD *)(a1 + 3904);
  }
  WORD4(v144) = v92;
  __int16 v97 = *v91;
  unsigned int v95 = v91 + 1;
  __int16 v96 = v97;
  *(void *)(a1 + 3896) = v95;
  BOOL v9 = v94 >= 2;
  unsigned int v98 = v94 - 2;
  *(_DWORD *)(a1 + 3904) = v98;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v95 = *(__int16 **)(a1 + 3896);
    unsigned int v98 = *(_DWORD *)(a1 + 3904);
  }
  WORD5(v144) = v96;
  __int16 v101 = *v95;
  unsigned int v99 = v95 + 1;
  __int16 v100 = v101;
  *(void *)(a1 + 3896) = v99;
  BOOL v9 = v98 >= 2;
  unsigned int v102 = v98 - 2;
  *(_DWORD *)(a1 + 3904) = v102;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v99 = *(__int16 **)(a1 + 3896);
    unsigned int v102 = *(_DWORD *)(a1 + 3904);
  }
  WORD6(v144) = v100;
  __int16 v105 = *v99;
  unsigned int v103 = v99 + 1;
  __int16 v104 = v105;
  *(void *)(a1 + 3896) = v103;
  BOOL v9 = v102 >= 2;
  unsigned int v106 = v102 - 2;
  *(_DWORD *)(a1 + 3904) = v106;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v103 = *(__int16 **)(a1 + 3896);
    unsigned int v106 = *(_DWORD *)(a1 + 3904);
  }
  HIWORD(v144) = v104;
  __int16 v109 = *v103;
  unsigned int v107 = v103 + 1;
  __int16 v108 = v109;
  *(void *)(a1 + 3896) = v107;
  BOOL v9 = v106 >= 2;
  unsigned int v110 = v106 - 2;
  *(_DWORD *)(a1 + 3904) = v110;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v107 = *(__int16 **)(a1 + 3896);
    unsigned int v110 = *(_DWORD *)(a1 + 3904);
  }
  LOWORD(v145) = v108;
  __int16 v113 = *v107;
  unsigned int v111 = v107 + 1;
  __int16 v112 = v113;
  *(void *)(a1 + 3896) = v111;
  BOOL v9 = v110 >= 2;
  unsigned int v114 = v110 - 2;
  *(_DWORD *)(a1 + 3904) = v114;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v111 = *(__int16 **)(a1 + 3896);
    unsigned int v114 = *(_DWORD *)(a1 + 3904);
  }
  WORD1(v145) = v112;
  __int16 v117 = *v111;
  unsigned int v115 = v111 + 1;
  __int16 v116 = v117;
  *(void *)(a1 + 3896) = v115;
  BOOL v9 = v114 >= 2;
  unsigned int v118 = v114 - 2;
  *(_DWORD *)(a1 + 3904) = v118;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v115 = *(__int16 **)(a1 + 3896);
    unsigned int v118 = *(_DWORD *)(a1 + 3904);
  }
  WORD2(v145) = v116;
  __int16 v121 = *v115;
  unsigned int v119 = v115 + 1;
  __int16 v120 = v121;
  *(void *)(a1 + 3896) = v119;
  BOOL v9 = v118 >= 2;
  unsigned int v122 = v118 - 2;
  *(_DWORD *)(a1 + 3904) = v122;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v119 = *(__int16 **)(a1 + 3896);
    unsigned int v122 = *(_DWORD *)(a1 + 3904);
  }
  WORD3(v145) = v120;
  __int16 v125 = *v119;
  unsigned int v123 = v119 + 1;
  __int16 v124 = v125;
  *(void *)(a1 + 3896) = v123;
  BOOL v9 = v122 >= 2;
  unsigned int v126 = v122 - 2;
  *(_DWORD *)(a1 + 3904) = v126;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v123 = *(__int16 **)(a1 + 3896);
    unsigned int v126 = *(_DWORD *)(a1 + 3904);
  }
  WORD4(v145) = v124;
  __int16 v129 = *v123;
  unsigned int v127 = v123 + 1;
  __int16 v128 = v129;
  *(void *)(a1 + 3896) = v127;
  BOOL v9 = v126 >= 2;
  unsigned int v130 = v126 - 2;
  *(_DWORD *)(a1 + 3904) = v130;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v127 = *(__int16 **)(a1 + 3896);
    unsigned int v130 = *(_DWORD *)(a1 + 3904);
  }
  int v131 = 4 * v3;
  WORD5(v145) = v128;
  __int16 v132 = *v127;
  *(void *)(a1 + 3896) = v127 + 1;
  *(_DWORD *)(a1 + 3904) = v130 - 2;
  if (v130 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  WORD6(v145) = v132;
  size_t v133 = (v131 - 72);
  int v134 = (((_WORD)v131 - 72) & 0x3FFC) != 0;
  size_t v135 = (v133 & 0xFFFFC000) + (v134 << 14);
  DWORD2(v146) = (v133 & 0xFFFFC000) + (v134 << 14);
  v136 = malloc_type_aligned_alloc(0x4000uLL, DWORD2(v146), 0x9D11F806uLL);
  if (!v136)
  {
    puts("e: could not allocate memory for DBMA data");
    return 0;
  }
  unsigned int v137 = v136;
  bzero(v136, v135);
  memcpy(v137, *(const void **)(a1 + 3896), v133);
  *(void *)&long long v146 = v137;
  uint64_t v138 = (*(uint64_t (**)(uint64_t, long long *, uint64_t, void, void, void))a1)(67, &v141, 96, 0, 0, *(void *)(a1 + 16));
  if (v138) {
    __int16 v139 = "i: set DBMA data succeeded";
  }
  else {
    __int16 v139 = "e: set DBMA data failed";
  }
  puts(v139);
  free(v137);
  return v138;
}

uint64_t sub_100010248(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(_DWORD *)(a2 + 4);
  if (HIWORD(v3) != 1)
  {
    if (HIWORD(v3) != 2) {
      goto LABEL_20;
    }
    int v4 = *(_DWORD *)(a2 + 8);
LABEL_5:
    if (v4 == 7) {
      goto LABEL_6;
    }
LABEL_20:
    puts("e: Bad size/version for HGOD");
    return 0;
  }
  int v4 = *(_DWORD *)(a2 + 8);
  if (v4 != 6) {
    goto LABEL_5;
  }
LABEL_6:
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  v22[0] = HIWORD(v3);
  uint64_t v5 = *(int **)(a1 + 3896);
  int v8 = *v5;
  char v6 = v5 + 1;
  int v7 = v8;
  *(void *)(a1 + 3896) = v6;
  unsigned int v9 = *(_DWORD *)(a1 + 3904);
  BOOL v10 = v9 >= 4;
  unsigned int v11 = v9 - 4;
  *(_DWORD *)(a1 + 3904) = v11;
  if (!v10)
  {
    puts("e: data_sz underflow in get_value");
    char v6 = *(int **)(a1 + 3896);
    unsigned int v11 = *(_DWORD *)(a1 + 3904);
  }
  v22[1] = v7;
  int v14 = *v6;
  char v12 = v6 + 1;
  int v13 = v14;
  *(void *)(a1 + 3896) = v12;
  BOOL v10 = v11 >= 4;
  unsigned int v15 = v11 - 4;
  *(_DWORD *)(a1 + 3904) = v15;
  if (!v10)
  {
    puts("e: data_sz underflow in get_value");
    char v12 = *(int **)(a1 + 3896);
    unsigned int v15 = *(_DWORD *)(a1 + 3904);
  }
  v22[2] = v13;
  int v16 = *v12;
  *(void *)(a1 + 3896) = v12 + 1;
  *(_DWORD *)(a1 + 3904) = v15 - 4;
  if (v15 < 4) {
    puts("e: data_sz underflow in get_value");
  }
  LODWORD(v23) = v16;
  if (v3 >= 0x20000)
  {
    __int16 v17 = *(int **)(a1 + 3896);
    int v18 = *v17;
    *(void *)(a1 + 3896) = v17 + 1;
    LODWORD(v17) = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v17 - 4;
    if (v17 < 4) {
      puts("e: data_sz underflow in get_value");
    }
    HIDWORD(v23) = v18 << 16;
  }
  uint64_t v19 = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, void, void, void))a1)(38, v22, 20, 0, 0, *(void *)(a1 + 16));
  if (v19) {
    __int16 v20 = "i: set HGOD data succeeded";
  }
  else {
    __int16 v20 = "e: set HGOD data failed";
  }
  puts(v20);
  return v19;
}

uint64_t sub_1000103CC(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 3908)) {
    return 1;
  }
  unsigned int v2 = *(_DWORD *)(a2 + 4);
  if (v2 < 0x30000)
  {
    int v35 = 0;
    memset(v34, 0, sizeof(v34));
    long long v33 = 0u;
    long long v32 = 0u;
    long long v31 = 0u;
    v30[0] = 1;
    unsigned int v5 = HIWORD(v2);
    char v6 = *(unsigned __int16 **)(a1 + 3896);
    int v7 = *v6;
    *(void *)(a1 + 3896) = v6 + 1;
    LODWORD(v6) = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v6 - 2;
    if (v6 < 2) {
      puts("e: data_sz underflow in get_value");
    }
    printf("i: Processing BLTS format version %d data version %d\n", v5, v7);
    int v8 = *(int **)(a1 + 3896);
    int v11 = *v8;
    unsigned int v9 = v8 + 1;
    int v10 = v11;
    *(void *)(a1 + 3896) = v9;
    unsigned int v12 = *(_DWORD *)(a1 + 3904);
    BOOL v13 = v12 >= 4;
    unsigned int v14 = v12 - 4;
    *(_DWORD *)(a1 + 3904) = v14;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      unsigned int v9 = *(int **)(a1 + 3896);
      unsigned int v14 = *(_DWORD *)(a1 + 3904);
    }
    v30[1] = v10;
    int v17 = *v9;
    unsigned int v15 = v9 + 1;
    int v16 = v17;
    *(void *)(a1 + 3896) = v15;
    BOOL v13 = v14 >= 4;
    unsigned int v18 = v14 - 4;
    *(_DWORD *)(a1 + 3904) = v18;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      unsigned int v15 = *(int **)(a1 + 3896);
      unsigned int v18 = *(_DWORD *)(a1 + 3904);
    }
    LODWORD(v31) = v16;
    int v19 = *v15;
    *(void *)(a1 + 3896) = v15 + 1;
    *(_DWORD *)(a1 + 3904) = v18 - 4;
    if (v18 < 4) {
      puts("e: data_sz underflow in get_value");
    }
    DWORD1(v31) = v19;
    for (uint64_t i = 4; i != 15; ++i)
    {
      __int16 v21 = *(unsigned __int16 **)(a1 + 3896);
      int v22 = *v21;
      int v23 = *((unsigned __int8 *)v21 + 2);
      *(void *)(a1 + 3896) = (char *)v21 + 3;
      LODWORD(v21) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v21 - 3;
      if (v21 < 3) {
        puts("e: data_sz underflow in get_value");
      }
      v30[i] = v22 | (v23 << 16);
    }
    sub_100012DE8(a1, (_WORD *)v34 + 2, 11);
    for (uint64_t j = 21; j != 31; ++j)
    {
      __int16 v25 = *(unsigned __int16 **)(a1 + 3896);
      int v26 = *v25;
      int v27 = *((unsigned __int8 *)v25 + 2);
      *(void *)(a1 + 3896) = (char *)v25 + 3;
      LODWORD(v25) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v25 - 3;
      if (v25 < 3) {
        puts("e: data_sz underflow in get_value");
      }
      v30[j] = v26 | (v27 << 16);
    }
    uint64_t v3 = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, void, void, void))a1)(68, v30, 124, 0, 0, *(void *)(a1 + 16));
    if (v3) {
      __int16 v28 = "i: set BLTS data succeeded";
    }
    else {
      __int16 v28 = "e: set BLTS data failed";
    }
    puts(v28);
  }
  else
  {
    printf("e: Unexpected BLTS block version 0x%x\n", *(_DWORD *)(a2 + 4));
    return 0;
  }
  return v3;
}

uint64_t sub_100010618(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 3908)) {
    return 1;
  }
  unsigned int v2 = *(_DWORD *)(a2 + 4);
  if (v2 < 0x20000)
  {
    bzero(v151, 0x36CuLL);
    v150[0] = 2;
    unsigned int v5 = HIWORD(v2);
    char v6 = *(int **)(a1 + 3896);
    int v7 = *v6;
    *(void *)(a1 + 3896) = v6 + 1;
    LODWORD(v6) = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v6 - 4;
    if (v6 < 4) {
      puts("e: data_sz underflow in get_value");
    }
    printf("i: Processing RXTK format version %d data version %d\n", v5, v7);
    int v8 = *(int **)(a1 + 3896);
    int v11 = *v8;
    unsigned int v9 = v8 + 1;
    int v10 = v11;
    *(void *)(a1 + 3896) = v9;
    unsigned int v12 = *(_DWORD *)(a1 + 3904);
    BOOL v13 = v12 >= 4;
    unsigned int v14 = v12 - 4;
    *(_DWORD *)(a1 + 3904) = v14;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      unsigned int v9 = *(int **)(a1 + 3896);
      unsigned int v14 = *(_DWORD *)(a1 + 3904);
    }
    v150[1] = v10;
    int v17 = *v9;
    unsigned int v15 = v9 + 1;
    int v16 = v17;
    *(void *)(a1 + 3896) = v15;
    BOOL v13 = v14 >= 4;
    unsigned int v18 = v14 - 4;
    *(_DWORD *)(a1 + 3904) = v18;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      unsigned int v15 = *(int **)(a1 + 3896);
      unsigned int v18 = *(_DWORD *)(a1 + 3904);
    }
    v151[0] = v16;
    int v21 = *v15;
    int v19 = v15 + 1;
    int v20 = v21;
    *(void *)(a1 + 3896) = v19;
    BOOL v13 = v18 >= 4;
    unsigned int v22 = v18 - 4;
    *(_DWORD *)(a1 + 3904) = v22;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      int v19 = *(int **)(a1 + 3896);
      unsigned int v22 = *(_DWORD *)(a1 + 3904);
    }
    v151[1] = v20;
    int v25 = *v19;
    int v23 = v19 + 1;
    int v24 = v25;
    *(void *)(a1 + 3896) = v23;
    BOOL v13 = v22 >= 4;
    unsigned int v26 = v22 - 4;
    *(_DWORD *)(a1 + 3904) = v26;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      int v23 = *(int **)(a1 + 3896);
      unsigned int v26 = *(_DWORD *)(a1 + 3904);
    }
    v151[2] = v24;
    int v29 = *v23;
    int v27 = v23 + 1;
    int v28 = v29;
    *(void *)(a1 + 3896) = v27;
    BOOL v13 = v26 >= 4;
    unsigned int v30 = v26 - 4;
    *(_DWORD *)(a1 + 3904) = v30;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      int v27 = *(int **)(a1 + 3896);
      unsigned int v30 = *(_DWORD *)(a1 + 3904);
    }
    v151[3] = v28;
    int v33 = *v27;
    long long v31 = v27 + 1;
    int v32 = v33;
    *(void *)(a1 + 3896) = v31;
    BOOL v13 = v30 >= 4;
    unsigned int v34 = v30 - 4;
    *(_DWORD *)(a1 + 3904) = v34;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      long long v31 = *(int **)(a1 + 3896);
      unsigned int v34 = *(_DWORD *)(a1 + 3904);
    }
    v151[4] = v32;
    int v37 = *v31;
    int v35 = v31 + 1;
    int v36 = v37;
    *(void *)(a1 + 3896) = v35;
    BOOL v13 = v34 >= 4;
    unsigned int v38 = v34 - 4;
    *(_DWORD *)(a1 + 3904) = v38;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      int v35 = *(int **)(a1 + 3896);
      unsigned int v38 = *(_DWORD *)(a1 + 3904);
    }
    v151[5] = v36;
    int v41 = *v35;
    char v39 = v35 + 1;
    int v40 = v41;
    *(void *)(a1 + 3896) = v39;
    BOOL v13 = v38 >= 4;
    unsigned int v42 = v38 - 4;
    *(_DWORD *)(a1 + 3904) = v42;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      char v39 = *(int **)(a1 + 3896);
      unsigned int v42 = *(_DWORD *)(a1 + 3904);
    }
    v151[6] = v40;
    int v45 = *v39;
    __int16 v43 = v39 + 1;
    int v44 = v45;
    *(void *)(a1 + 3896) = v43;
    BOOL v13 = v42 >= 4;
    unsigned int v46 = v42 - 4;
    *(_DWORD *)(a1 + 3904) = v46;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      __int16 v43 = *(int **)(a1 + 3896);
      unsigned int v46 = *(_DWORD *)(a1 + 3904);
    }
    v151[7] = v44;
    int v49 = *v43;
    long long v47 = v43 + 1;
    int v48 = v49;
    *(void *)(a1 + 3896) = v47;
    BOOL v13 = v46 >= 4;
    unsigned int v50 = v46 - 4;
    *(_DWORD *)(a1 + 3904) = v50;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      long long v47 = *(int **)(a1 + 3896);
      unsigned int v50 = *(_DWORD *)(a1 + 3904);
    }
    v151[8] = v48;
    int v53 = *v47;
    int v51 = v47 + 1;
    int v52 = v53;
    *(void *)(a1 + 3896) = v51;
    BOOL v13 = v50 >= 4;
    unsigned int v54 = v50 - 4;
    *(_DWORD *)(a1 + 3904) = v54;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      int v51 = *(_DWORD **)(a1 + 3896);
      unsigned int v54 = *(_DWORD *)(a1 + 3904);
    }
    v151[9] = v52;
    int v57 = *v51;
    int v55 = (unsigned __int8 *)(v51 + 1);
    int v56 = v57;
    *(void *)(a1 + 3896) = v55;
    BOOL v13 = v54 >= 4;
    unsigned int v58 = v54 - 4;
    *(_DWORD *)(a1 + 3904) = v58;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      int v55 = *(unsigned __int8 **)(a1 + 3896);
      unsigned int v58 = *(_DWORD *)(a1 + 3904);
    }
    v151[10] = v56;
    int v61 = *v55;
    int v59 = v55 + 1;
    int v60 = v61;
    *(void *)(a1 + 3896) = v59;
    BOOL v13 = v58 != 0;
    unsigned int v62 = v58 - 1;
    *(_DWORD *)(a1 + 3904) = v62;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      int v59 = *(unsigned __int8 **)(a1 + 3896);
      unsigned int v62 = *(_DWORD *)(a1 + 3904);
    }
    v151[11] = v60;
    int v65 = *v59;
    __int16 v63 = v59 + 1;
    int v64 = v65;
    *(void *)(a1 + 3896) = v63;
    BOOL v13 = v62 != 0;
    unsigned int v66 = v62 - 1;
    *(_DWORD *)(a1 + 3904) = v66;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      __int16 v63 = *(unsigned __int8 **)(a1 + 3896);
      unsigned int v66 = *(_DWORD *)(a1 + 3904);
    }
    v151[12] = v64;
    int v69 = *v63;
    v67 = (unsigned __int16 *)(v63 + 1);
    int v68 = v69;
    *(void *)(a1 + 3896) = v67;
    BOOL v13 = v66 != 0;
    unsigned int v70 = v66 - 1;
    *(_DWORD *)(a1 + 3904) = v70;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      v67 = *(unsigned __int16 **)(a1 + 3896);
      unsigned int v70 = *(_DWORD *)(a1 + 3904);
    }
    v151[13] = v68;
    int v71 = *v67 | (*((unsigned __int8 *)v67 + 2) << 16);
    __int16 v72 = (unsigned __int16 *)((char *)v67 + 3);
    *(void *)(a1 + 3896) = v72;
    BOOL v13 = v70 >= 3;
    unsigned int v73 = v70 - 3;
    *(_DWORD *)(a1 + 3904) = v73;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      __int16 v72 = *(unsigned __int16 **)(a1 + 3896);
      unsigned int v73 = *(_DWORD *)(a1 + 3904);
    }
    v151[14] = v71;
    int v74 = *v72 | (*((unsigned __int8 *)v72 + 2) << 16);
    float v75 = (unsigned __int16 *)((char *)v72 + 3);
    *(void *)(a1 + 3896) = v75;
    BOOL v13 = v73 >= 3;
    unsigned int v76 = v73 - 3;
    *(_DWORD *)(a1 + 3904) = v76;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      float v75 = *(unsigned __int16 **)(a1 + 3896);
      unsigned int v76 = *(_DWORD *)(a1 + 3904);
    }
    v151[15] = v74;
    int v77 = *v75;
    *(void *)(a1 + 3896) = v75 + 1;
    *(_DWORD *)(a1 + 3904) = v76 - 2;
    if (v76 < 2) {
      puts("e: data_sz underflow in get_value");
    }
    v151[16] = v77;
    for (uint64_t i = 19; i != 25; ++i)
    {
      int v79 = *(int **)(a1 + 3896);
      int v80 = *v79;
      *(void *)(a1 + 3896) = v79 + 1;
      LODWORD(v79) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v79 - 4;
      if (v79 < 4) {
        puts("e: data_sz underflow in get_value");
      }
      v150[i] = v80;
    }
    do
    {
      __int16 v81 = *(unsigned __int16 **)(a1 + 3896);
      int v82 = *v81;
      int v83 = *((unsigned __int8 *)v81 + 2);
      *(void *)(a1 + 3896) = (char *)v81 + 3;
      LODWORD(v81) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v81 - 3;
      if (v81 < 3) {
        puts("e: data_sz underflow in get_value");
      }
      v150[i++] = v82 | (v83 << 16);
    }
    while (i != 41);
    do
    {
      __int16 v84 = *(unsigned __int16 **)(a1 + 3896);
      int v85 = *v84;
      int v86 = *((unsigned __int8 *)v84 + 2);
      *(void *)(a1 + 3896) = (char *)v84 + 3;
      LODWORD(v84) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v84 - 3;
      if (v84 < 3) {
        puts("e: data_sz underflow in get_value");
      }
      v150[i++] = v85 | (v86 << 16);
    }
    while (i != 57);
    int v87 = *(unsigned __int16 **)(a1 + 3896);
    int v88 = *v87 | (*((unsigned __int8 *)v87 + 2) << 16);
    __int16 v89 = (unsigned __int16 *)((char *)v87 + 3);
    *(void *)(a1 + 3896) = v89;
    unsigned int v90 = *(_DWORD *)(a1 + 3904);
    BOOL v13 = v90 >= 3;
    unsigned int v91 = v90 - 3;
    *(_DWORD *)(a1 + 3904) = v91;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      __int16 v89 = *(unsigned __int16 **)(a1 + 3896);
      unsigned int v91 = *(_DWORD *)(a1 + 3904);
    }
    v151[55] = v88;
    int v92 = *v89 | (*((unsigned __int8 *)v89 + 2) << 16);
    __int16 v93 = (int *)((char *)v89 + 3);
    *(void *)(a1 + 3896) = v93;
    BOOL v13 = v91 >= 3;
    unsigned int v94 = v91 - 3;
    *(_DWORD *)(a1 + 3904) = v94;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      __int16 v93 = *(int **)(a1 + 3896);
      unsigned int v94 = *(_DWORD *)(a1 + 3904);
    }
    v151[56] = v92;
    int v97 = *v93;
    unsigned int v95 = v93 + 1;
    int v96 = v97;
    *(void *)(a1 + 3896) = v95;
    BOOL v13 = v94 >= 4;
    unsigned int v98 = v94 - 4;
    *(_DWORD *)(a1 + 3904) = v98;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      unsigned int v95 = *(int **)(a1 + 3896);
      unsigned int v98 = *(_DWORD *)(a1 + 3904);
    }
    v151[57] = v96;
    int v101 = *v95;
    unsigned int v99 = v95 + 1;
    int v100 = v101;
    *(void *)(a1 + 3896) = v99;
    BOOL v13 = v98 >= 4;
    unsigned int v102 = v98 - 4;
    *(_DWORD *)(a1 + 3904) = v102;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      unsigned int v99 = *(_DWORD **)(a1 + 3896);
      unsigned int v102 = *(_DWORD *)(a1 + 3904);
    }
    v151[58] = v100;
    int v105 = *v99;
    unsigned int v103 = (unsigned __int8 *)(v99 + 1);
    int v104 = v105;
    *(void *)(a1 + 3896) = v103;
    BOOL v13 = v102 >= 4;
    unsigned int v106 = v102 - 4;
    *(_DWORD *)(a1 + 3904) = v106;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      unsigned int v103 = *(unsigned __int8 **)(a1 + 3896);
      unsigned int v106 = *(_DWORD *)(a1 + 3904);
    }
    v151[59] = v104;
    int v109 = *v103;
    unsigned int v107 = (unsigned __int16 *)(v103 + 1);
    int v108 = v109;
    *(void *)(a1 + 3896) = v107;
    BOOL v13 = v106 != 0;
    unsigned int v110 = v106 - 1;
    *(_DWORD *)(a1 + 3904) = v110;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      unsigned int v107 = *(unsigned __int16 **)(a1 + 3896);
      unsigned int v110 = *(_DWORD *)(a1 + 3904);
    }
    v151[60] = v108;
    int v111 = *v107 | (*((unsigned __int8 *)v107 + 2) << 16);
    __int16 v112 = (unsigned __int16 *)((char *)v107 + 3);
    *(void *)(a1 + 3896) = v112;
    BOOL v13 = v110 >= 3;
    unsigned int v113 = v110 - 3;
    *(_DWORD *)(a1 + 3904) = v113;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      __int16 v112 = *(unsigned __int16 **)(a1 + 3896);
      unsigned int v113 = *(_DWORD *)(a1 + 3904);
    }
    v151[61] = v111;
    int v114 = *v112 | (*((unsigned __int8 *)v112 + 2) << 16);
    unsigned int v115 = (unsigned __int8 *)v112 + 3;
    *(void *)(a1 + 3896) = v115;
    BOOL v13 = v113 >= 3;
    unsigned int v116 = v113 - 3;
    *(_DWORD *)(a1 + 3904) = v116;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      unsigned int v115 = *(unsigned __int8 **)(a1 + 3896);
      unsigned int v116 = *(_DWORD *)(a1 + 3904);
    }
    v151[62] = v114;
    int v119 = *v115;
    __int16 v117 = v115 + 1;
    int v118 = v119;
    *(void *)(a1 + 3896) = v117;
    BOOL v13 = v116 != 0;
    unsigned int v120 = v116 - 1;
    *(_DWORD *)(a1 + 3904) = v120;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      __int16 v117 = *(unsigned __int8 **)(a1 + 3896);
      unsigned int v120 = *(_DWORD *)(a1 + 3904);
    }
    v151[63] = v118;
    int v123 = *v117;
    __int16 v121 = (int *)(v117 + 1);
    int v122 = v123;
    *(void *)(a1 + 3896) = v121;
    BOOL v13 = v120 != 0;
    unsigned int v124 = v120 - 1;
    *(_DWORD *)(a1 + 3904) = v124;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      __int16 v121 = *(int **)(a1 + 3896);
      unsigned int v124 = *(_DWORD *)(a1 + 3904);
    }
    v151[64] = v122;
    int v127 = *v121;
    __int16 v125 = v121 + 1;
    int v126 = v127;
    *(void *)(a1 + 3896) = v125;
    BOOL v13 = v124 >= 4;
    unsigned int v128 = v124 - 4;
    *(_DWORD *)(a1 + 3904) = v128;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      __int16 v125 = *(_DWORD **)(a1 + 3896);
      unsigned int v128 = *(_DWORD *)(a1 + 3904);
    }
    v151[65] = v126;
    int v131 = *v125;
    __int16 v129 = (unsigned __int8 *)(v125 + 1);
    int v130 = v131;
    *(void *)(a1 + 3896) = v129;
    BOOL v13 = v128 >= 4;
    unsigned int v132 = v128 - 4;
    *(_DWORD *)(a1 + 3904) = v132;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      __int16 v129 = *(unsigned __int8 **)(a1 + 3896);
      unsigned int v132 = *(_DWORD *)(a1 + 3904);
    }
    v151[66] = v130;
    int v135 = *v129;
    size_t v133 = v129 + 1;
    int v134 = v135;
    *(void *)(a1 + 3896) = v133;
    BOOL v13 = v132 != 0;
    unsigned int v136 = v132 - 1;
    *(_DWORD *)(a1 + 3904) = v136;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      size_t v133 = *(unsigned __int8 **)(a1 + 3896);
      unsigned int v136 = *(_DWORD *)(a1 + 3904);
    }
    v151[67] = v134;
    int v139 = *v133;
    unsigned int v137 = v133 + 1;
    int v138 = v139;
    *(void *)(a1 + 3896) = v137;
    BOOL v13 = v136 != 0;
    unsigned int v140 = v136 - 1;
    *(_DWORD *)(a1 + 3904) = v140;
    if (!v13)
    {
      puts("e: data_sz underflow in get_value");
      unsigned int v137 = *(unsigned __int8 **)(a1 + 3896);
      unsigned int v140 = *(_DWORD *)(a1 + 3904);
    }
    v151[68] = v138;
    int v141 = *v137;
    *(void *)(a1 + 3896) = v137 + 1;
    *(_DWORD *)(a1 + 3904) = v140 - 1;
    if (!v140) {
      puts("e: data_sz underflow in get_value");
    }
    v151[69] = v141;
    for (uint64_t j = 72; j != 142; ++j)
    {
      long long v143 = *(unsigned __int16 **)(a1 + 3896);
      int v144 = *v143;
      int v145 = *((unsigned __int8 *)v143 + 2);
      *(void *)(a1 + 3896) = (char *)v143 + 3;
      LODWORD(v143) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v143 - 3;
      if (v143 < 3) {
        puts("e: data_sz underflow in get_value");
      }
      v150[j] = v144 | (v145 << 16);
    }
    do
    {
      long long v146 = *(unsigned __int16 **)(a1 + 3896);
      int v147 = *v146;
      int v148 = *((unsigned __int8 *)v146 + 2);
      *(void *)(a1 + 3896) = (char *)v146 + 3;
      LODWORD(v146) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v146 - 3;
      if (v146 < 3) {
        puts("e: data_sz underflow in get_value");
      }
      v150[j++] = v147 | (v148 << 16);
    }
    while (j != 212);
    uint64_t v3 = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, void, void, void))a1)(95, v150, 884, 0, 0, *(void *)(a1 + 16));
    if (v3) {
      printf("i: set RXTK data succeeded");
    }
    else {
      puts("e: set RXTK data failed");
    }
  }
  else
  {
    printf("e: Unexpected RXTK block version 0x%x\n", *(_DWORD *)(a2 + 4));
    return 0;
  }
  return v3;
}

BOOL sub_100010E94(uint64_t a1, uint64_t a2)
{
  if (HIWORD(*(_DWORD *)(a2 + 4)) == 5)
  {
    return sub_100014854(a1, a2);
  }
  else
  {
    printf("e: unexpected version %d for PDCp block\n", HIWORD(*(_DWORD *)(a2 + 4)));
    return 0;
  }
}

uint64_t sub_100010EF0(uint64_t a1, uint64_t a2)
{
  if (HIWORD(*(_DWORD *)(a2 + 4)) == 5)
  {
    return sub_1000140AC(a1, a2);
  }
  else
  {
    printf("e: unexpected version %d for PDCc block\n", HIWORD(*(_DWORD *)(a2 + 4)));
    return 0;
  }
}

uint64_t sub_100010F4C(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) < 0x20000u)
  {
    *(_DWORD *)(a1 + 2864) = 1;
    if (*(_DWORD *)(a2 + 8) == 9)
    {
      if (*(_DWORD *)(a1 + 3904) >= 0x18u)
      {
        uint64_t v3 = *(unsigned __int16 **)(a1 + 3896);
        int v4 = *v3;
        *(_WORD *)(a1 + 2868) = v4;
        *(void *)(a1 + 3896) = v3 + 1;
        *(_DWORD *)(a1 + 3904) = 22;
        printf("i: processing prox data version %d\n", v4);
        unsigned int v5 = *(_DWORD *)(a1 + 3904);
        unsigned int v6 = v5 - 2;
        if (v5 >= 2)
        {
          int v7 = *(_WORD **)(a1 + 3896);
          *(_WORD *)(a1 + 2912) = *v7;
          *(void *)(a1 + 3896) = v7 + 1;
          *(_DWORD *)(a1 + 3904) = v6;
          if (v6 >= 2)
          {
            *(_WORD *)(a1 + 2916) = v7[1];
            *(void *)(a1 + 3896) = v7 + 2;
            *(_DWORD *)(a1 + 3904) = v5 - 4;
            if (v5 - 4 >= 2)
            {
              *(_WORD *)(a1 + 2914) = v7[2];
              *(void *)(a1 + 3896) = v7 + 3;
              *(_DWORD *)(a1 + 3904) = v5 - 6;
              if (v5 - 6 >= 2)
              {
                *(_WORD *)(a1 + 2918) = v7[3];
                *(void *)(a1 + 3896) = v7 + 4;
                *(_DWORD *)(a1 + 3904) = v5 - 8;
                if (v5 - 8 >= 2)
                {
                  *(_WORD *)(a1 + 3164) = v7[4];
                  *(void *)(a1 + 3896) = v7 + 5;
                  *(_DWORD *)(a1 + 3904) = v5 - 10;
                  if (v5 - 10 >= 2)
                  {
                    *(_WORD *)(a1 + 3162) = v7[5];
                    *(void *)(a1 + 3896) = v7 + 6;
                    *(_DWORD *)(a1 + 3904) = v5 - 12;
                    if (v5 - 12 >= 2)
                    {
                      *(_DWORD *)(a1 + 3408) = (unsigned __int16)v7[6];
                      *(void *)(a1 + 3896) = v7 + 7;
                      *(_DWORD *)(a1 + 3904) = v5 - 14;
                      if (v5 - 14 >= 2)
                      {
                        *(_WORD *)(a1 + 2870) = v7[7];
                        *(void *)(a1 + 3896) = v7 + 8;
                        *(_DWORD *)(a1 + 3904) = v5 - 16;
                        if (v5 - 16 >= 2)
                        {
                          *(_WORD *)(a1 + 3160) = v7[8];
                          *(void *)(a1 + 3896) = v7 + 9;
                          *(_DWORD *)(a1 + 3904) = v5 - 18;
                          if (v5 - 18 >= 2)
                          {
                            int v8 = (unsigned __int16)v7[9];
                            *(void *)(a1 + 3896) = v7 + 10;
                            *(_DWORD *)(a1 + 3904) = v5 - 20;
                            if (v8 == 3)
                            {
                              if (v5 - 20 >= 2)
                              {
                                *(_WORD *)(a1 + 3166) = v7[10];
                                *(void *)(a1 + 3896) = v7 + 11;
                                *(_DWORD *)(a1 + 3904) = v5 - 22;
                                *(_OWORD *)(a1 + 3584) = 0u;
                                *(_OWORD *)(a1 + 3600) = 0u;
                                return 1;
                              }
                            }
                            else
                            {
                              puts("e: expected 3 color channels");
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
        }
      }
    }
    else
    {
      printf("e: unexpected PBDp block size %d\n");
    }
  }
  else
  {
    printf("e: unexpected PBDp block version %d\n");
  }
  return 0;
}

uint64_t sub_10001117C(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) >= 0x20000u)
  {
    printf("e: unexpected PBDD version %d\n");
    return 0;
  }
  if (!*(_DWORD *)(a1 + 2864) || !*(_WORD *)(a1 + 2868))
  {
    int v52 = "e: prox LUTs should come after config parameters";
LABEL_72:
    puts(v52);
    return 0;
  }
  int v3 = *(_DWORD *)(a1 + 3408);
  int v4 = v3 * *(unsigned __int16 *)(a1 + 2870);
  int v5 = *(unsigned __int16 *)(a1 + 2912);
  int v6 = *(unsigned __int16 *)(a1 + 2916);
  int v7 = *(unsigned __int16 *)(a1 + 2914);
  int v8 = *(unsigned __int16 *)(a1 + 2918);
  int v9 = v8 * v7 + v6 * v5 + 1;
  if (*(_DWORD *)(a2 + 8) != v3 + v5 + v6 + v7 + v8 + v9 * v4 + 5)
  {
    printf("e: unexpected PBDD block size 0x%x != 0x%x\n");
    return 0;
  }
  *(void *)(a1 + 3896) += 2;
  unsigned int v10 = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v10 - 2;
  if (v10 < 2)
  {
    puts("e: data_sz underflow in get_value");
    int v3 = *(_DWORD *)(a1 + 3408);
  }
  int v11 = (unsigned int *)(a1 + 3548);
  sub_10000ABEC(a1, a1 + 3548, v3, @"DisplayCoexPrioritizeDisplay");
  if (*(_WORD *)(a1 + 2912))
  {
    uint64_t v12 = *(unsigned __int16 *)(a1 + 2912) - 1;
    do
    {
      BOOL v13 = *(int **)(a1 + 3896);
      int v14 = *v13;
      *(void *)(a1 + 3896) = v13 + 1;
      LODWORD(v13) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v13 - 4;
      if (v13 < 4) {
        puts("e: data_sz underflow in get_value");
      }
      *(_WORD *)(a1 + 2 * v12 + 2920) = v14;
    }
    while ((unint64_t)v12--);
  }
  unsigned int v16 = *(unsigned __int16 *)(a1 + 2916);
  if (*(_WORD *)(a1 + 2916))
  {
    unint64_t v17 = 0;
    do
    {
      unsigned int v18 = *(int **)(a1 + 3896);
      int v19 = *v18;
      *(void *)(a1 + 3896) = v18 + 1;
      LODWORD(v18) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v18 - 4;
      if (v18 < 4)
      {
        puts("e: data_sz underflow in get_value");
        unsigned int v16 = *(unsigned __int16 *)(a1 + 2916);
      }
      *(_DWORD *)(a1 + 2960 + 4 * v17++) = v19 << 16;
    }
    while (v17 < v16);
  }
  if (*(_WORD *)(a1 + 2914))
  {
    uint64_t v20 = *(unsigned __int16 *)(a1 + 2914) - 1;
    do
    {
      int v21 = *(int **)(a1 + 3896);
      int v22 = *v21;
      *(void *)(a1 + 3896) = v21 + 1;
      LODWORD(v21) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v21 - 4;
      if (v21 < 4) {
        puts("e: data_sz underflow in get_value");
      }
      *(_WORD *)(a1 + 2 * v20 + 3040) = v22;
    }
    while ((unint64_t)v20--);
  }
  unsigned int v24 = *(unsigned __int16 *)(a1 + 2918);
  if (*(_WORD *)(a1 + 2918))
  {
    unint64_t v25 = 0;
    do
    {
      unsigned int v26 = *(int **)(a1 + 3896);
      int v27 = *v26;
      *(void *)(a1 + 3896) = v26 + 1;
      LODWORD(v26) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v26 - 4;
      if (v26 < 4)
      {
        puts("e: data_sz underflow in get_value");
        unsigned int v24 = *(unsigned __int16 *)(a1 + 2918);
      }
      *(_DWORD *)(a1 + 3080 + 4 * v25++) = v27 << 16;
    }
    while (v25 < v24);
  }
  *(void *)(a1 + 3896) += 2;
  unsigned int v28 = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v28 - 2;
  if (v28 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  uint64_t v29 = 1;
  if (v4)
  {
    int v30 = 0;
    uint64_t v31 = (4 * v9 - 2);
    int v55 = v4;
    uint64_t v54 = v31;
    while (1)
    {
      int v32 = *(unsigned __int16 **)(a1 + 3896);
      unsigned int v33 = *v32;
      *(void *)(a1 + 3896) = v32 + 1;
      LODWORD(v32) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v32 - 2;
      if (v32 < 2) {
        puts("e: data_sz underflow in get_value");
      }
      unsigned int v34 = *v11;
      if (*v11 <= v33
        && ((float v35 = *(float *)(a1 + 3552), v34 + 1 >= v33) || v35 == 0.0)
        && (v35 == 0.0 ? (BOOL v36 = v34 >= v33) : (BOOL v36 = 1), v36))
      {
        int v56 = malloc_type_calloc(1uLL, 0xC90uLL, 0x102004011C89CF6uLL);
        if (!v56)
        {
          int v52 = "e: no memory";
          goto LABEL_72;
        }
        int v37 = *(unsigned __int16 **)(a1 + 3896);
        unsigned int v38 = *v37;
        *(void *)(a1 + 3896) = v37 + 1;
        LODWORD(v37) = *(_DWORD *)(a1 + 3904);
        *(_DWORD *)(a1 + 3904) = v37 - 2;
        if (v37 < 2) {
          puts("e: data_sz underflow in get_value");
        }
        v56[803] = (int)((float)((float)((float)v38 * 65536.0) / 10.0) + 0.5);
        v56[2] = 1;
        uint64_t v39 = *(unsigned __int16 *)(a1 + 2912);
        if (*(_WORD *)(a1 + 2912))
        {
          LODWORD(v40) = *(unsigned __int16 *)(a1 + 2916);
          unsigned int v41 = v39 - 1;
          do
          {
            if (v40)
            {
              unint64_t v42 = 0;
              do
              {
                __int16 v43 = *(int **)(a1 + 3896);
                int v44 = *v43;
                *(void *)(a1 + 3896) = v43 + 1;
                LODWORD(v43) = *(_DWORD *)(a1 + 3904);
                *(_DWORD *)(a1 + 3904) = v43 - 4;
                if (v43 < 4) {
                  puts("e: data_sz underflow in get_value");
                }
                *(float *)&v56[20 * v41 + 3 + v42++] = (float)v44 * 0.125;
                unint64_t v40 = *(unsigned __int16 *)(a1 + 2916);
              }
              while (v42 < v40);
            }
            --v41;
            --v39;
          }
          while (v39);
        }
        uint64_t v45 = *(unsigned __int16 *)(a1 + 2914);
        if (*(_WORD *)(a1 + 2914))
        {
          LODWORD(v46) = *(unsigned __int16 *)(a1 + 2918);
          unsigned int v47 = v45 - 1;
          do
          {
            if (v46)
            {
              unint64_t v48 = 0;
              do
              {
                int v49 = *(int **)(a1 + 3896);
                int v50 = *v49;
                *(void *)(a1 + 3896) = v49 + 1;
                LODWORD(v49) = *(_DWORD *)(a1 + 3904);
                *(_DWORD *)(a1 + 3904) = v49 - 4;
                if (v49 < 4) {
                  puts("e: data_sz underflow in get_value");
                }
                *(float *)&v56[20 * v47 + 403 + v48++] = (float)v50 * 0.125;
                unint64_t v46 = *(unsigned __int16 *)(a1 + 2918);
              }
              while (v48 < v46);
            }
            --v47;
            --v45;
          }
          while (v45);
        }
        if ((sub_10001E8D8(a1, v56[803], (_DWORD *)(a1 + 3508), (unsigned int *)(a1 + 3424)) & 1) == 0)
        {
          free(v56);
          return 0;
        }
        int v11 = (unsigned int *)(a1 + 3548);
        if (*(_DWORD *)(a1 + 3548) == v33)
        {
          *(void *)int v56 = *(void *)(a1 + 3584);
          *(void *)(a1 + 3584) = v56;
        }
        else
        {
          *(void *)int v56 = *(void *)(a1 + 3592);
          *(void *)(a1 + 3592) = v56;
        }
        int v4 = v55;
        uint64_t v31 = v54;
      }
      else
      {
        *(void *)(a1 + 3896) += v31;
        unsigned int v51 = *(_DWORD *)(a1 + 3904);
        *(_DWORD *)(a1 + 3904) = v51 - v31;
        if (v51 < v31) {
          puts("e: data_sz underflow in skip_section");
        }
      }
      if (++v30 == v4) {
        return 1;
      }
    }
  }
  return v29;
}

BOOL sub_1000116C4(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) < 0x20000u)
  {
    if (!*(_DWORD *)(a1 + 2864) || !*(_WORD *)(a1 + 2868))
    {
      puts("e: prox LUTs should come after config parameters");
      return 0;
    }
    int v5 = *(_DWORD *)(a1 + 3408);
    unsigned int v6 = 3 * *(unsigned __int16 *)(a1 + 2870) * v5 * *(unsigned __int16 *)(a1 + 3160) * *(unsigned __int16 *)(a1 + 3166);
    unsigned int v7 = *(unsigned __int16 *)(a1 + 3162);
    unsigned int v8 = *(unsigned __int16 *)(a1 + 3164);
    unsigned int v9 = ((double)v7 * 0.5 * (double)v8 + 3.5 + (double)v8 + 0.9);
    int v10 = v5 + v7 + v8 + v6 * v9 + 5;
    if (*(_DWORD *)(a2 + 8) != v10)
    {
      printf("e: unexpected PBDS block size 0x%x != 0x%x\n");
      return 0;
    }
    int v11 = 4 * v10;
    if (*(_DWORD *)(a1 + 3904) < (v11 - 12)) {
      return 0;
    }
    *(_DWORD *)(a1 + 3904) = v11 - 12;
    if (v11 == 12) {
      return 0;
    }
    uint64_t v12 = (_DWORD *)(a1 + 3564);
    *(void *)(a1 + 3896) += 2;
    *(_DWORD *)(a1 + 3904) = v11 - 14;
    if (!sub_10000ABEC(a1, a1 + 3564, v5, @"DisplayCoexPrioritizeProx")) {
      return 0;
    }
    unint64_t v13 = *(unsigned __int16 *)(a1 + 3164);
    if (v13 > 0x14) {
      return 0;
    }
    if (!sub_10000AD4C(a1, a1 + 3328, v13, (float (*)(uint64_t))sub_100020B0C)) {
      return 0;
    }
    unint64_t v14 = *(unsigned __int16 *)(a1 + 3162);
    if (v14 > 0x14) {
      return 0;
    }
    uint64_t v15 = sub_10000AD4C(a1, a1 + 3248, v14, (float (*)(uint64_t))sub_10001E8C8);
    if (!v15) {
      return 0;
    }
    unsigned int v16 = *(_DWORD *)(a1 + 3904);
    BOOL v17 = v16 >= 2;
    unsigned int v18 = v16 - 2;
    if (!v17) {
      return 0;
    }
    *(void *)(a1 + 3896) += 2;
    *(_DWORD *)(a1 + 3904) = v18;
    if (!v6) {
      return 1;
    }
    BOOL v19 = 0;
    int v20 = 0;
    int v21 = (_DWORD *)(a1 + 2872);
    int v22 = (unsigned int *)(a1 + 3412);
    int v23 = (_DWORD *)(a1 + 3208);
    uint64_t v24 = 4 * v9 - 2;
LABEL_17:
    unsigned int v25 = *(_DWORD *)(a1 + 3904);
    unsigned int v26 = v25 - 2;
    if (v25 < 2) {
      return v19;
    }
    int v27 = *(unsigned __int16 **)(a1 + 3896);
    unsigned int v28 = *v27;
    *(void *)(a1 + 3896) = v27 + 1;
    *(_DWORD *)(a1 + 3904) = v26;
    unsigned int v29 = *(_DWORD *)(a1 + 3564);
    if (v29 > v28 || (float v30 = *(float *)(a1 + 3568), v29 + 1 < v28) && v30 != 0.0 || v29 < v28 && v30 == 0.0)
    {
      if (v26 < v24) {
        return v19;
      }
      *(void *)(a1 + 3896) = (char *)v27 + v24 + 2;
      *(_DWORD *)(a1 + 3904) = v26 - v24;
      goto LABEL_25;
    }
    if (v26 < 2) {
      return v19;
    }
    *(void *)(a1 + 3896) = v27 + 2;
    *(_DWORD *)(a1 + 3904) = v25 - 4;
    if (v25 - 4 < 2) {
      return v19;
    }
    LOWORD(v2) = v27[1];
    *(void *)(a1 + 3896) = v27 + 3;
    *(_DWORD *)(a1 + 3904) = v25 - 6;
    if (v25 - 6 < 4) {
      return v19;
    }
    uint64_t v65 = v24;
    int v61 = v23;
    unsigned int v62 = v22;
    __int16 v63 = v21;
    int v64 = v12;
    LOWORD(v3) = v27[2];
    unsigned int v31 = *(_DWORD *)(v27 + 3);
    *(void *)(a1 + 3896) = v27 + 5;
    *(_DWORD *)(a1 + 3904) = v25 - 10;
    uint64_t v15 = sub_10000A608(v15, v31);
    unsigned int v32 = *(_DWORD *)(a1 + 3904);
    BOOL v17 = v32 >= 4;
    unsigned int v33 = v32 - 4;
    if (!v17) {
      return v19;
    }
    int v34 = v15;
    int v35 = (int)((float)((float)((float)v2 * 65536.0) / 10.0) + 0.5);
    int v36 = (int)((float)((float)v3 * 65536.0) + 0.5);
    int v37 = *(int **)(a1 + 3896);
    int v38 = *v37;
    *(void *)(a1 + 3896) = v37 + 1;
    *(_DWORD *)(a1 + 3904) = v33;
    uint64_t v39 = 3608;
    if (*(_DWORD *)(a1 + 3564) == v28) {
      uint64_t v39 = 3600;
    }
    uint64_t v40 = *(void *)(a1 + v39);
    uint64_t v24 = v65;
    if (v40)
    {
      while (*(_DWORD *)(v40 + 2656) != v35 || *(_DWORD *)(v40 + 2660) != v36 || *(_DWORD *)(v40 + 2664) != v38)
      {
        uint64_t v40 = *(void *)v40;
        if (!v40) {
          goto LABEL_39;
        }
      }
      int v41 = *(_DWORD *)(v40 + 2652);
      char v42 = 1;
    }
    else
    {
LABEL_39:
      uint64_t v15 = (uint64_t)malloc_type_calloc(1uLL, 0xA70uLL, 0x10200402CC89F78uLL);
      if (!v15)
      {
        puts("e: no memory");
        return v19;
      }
      uint64_t v40 = v15;
      int v41 = 0;
      char v42 = 0;
      *(_DWORD *)(v15 + 2656) = v35;
      *(_DWORD *)(v15 + 2660) = v36;
      *(_DWORD *)(v15 + 2664) = v38;
      *(_DWORD *)(v15 + 2652) = 0;
      uint64_t v24 = v65;
    }
    *(_DWORD *)(v40 + 2652) = v41 | v34;
    unsigned int v43 = *(unsigned __int16 *)(a1 + 3164);
    if (v43 > 0x14) {
      return v19;
    }
    LODWORD(v44) = *(unsigned __int16 *)(a1 + 3162);
    if (v44 > 0x14) {
      return v19;
    }
    if (!*(_WORD *)(a1 + 3164)) {
      goto LABEL_71;
    }
    unint64_t v45 = 0;
    unint64_t v46 = (_WORD *)v40;
LABEL_45:
    if (!v44) {
      goto LABEL_58;
    }
    unint64_t v47 = 0;
    unsigned int v48 = *(_DWORD *)(a1 + 3904);
    int v49 = v46;
    while (1)
    {
      BOOL v17 = v48 >= 2;
      v48 -= 2;
      if (!v17) {
        return v19;
      }
      int v50 = *(__int16 **)(a1 + 3896);
      __int16 v51 = *v50;
      *(void *)(a1 + 3896) = v50 + 1;
      *(_DWORD *)(a1 + 3904) = v48;
      if (v34)
      {
        v49[6] = v51;
        if ((v34 & 2) != 0)
        {
LABEL_56:
          v49[406] = v51;
          if ((v34 & 4) == 0) {
            goto LABEL_53;
          }
LABEL_52:
          v49[806] = v51;
          goto LABEL_53;
        }
      }
      else if ((v34 & 2) != 0)
      {
        goto LABEL_56;
      }
      if ((v34 & 4) != 0) {
        goto LABEL_52;
      }
LABEL_53:
      ++v47;
      unint64_t v44 = *(unsigned __int16 *)(a1 + 3162);
      ++v49;
      if (v47 >= v44)
      {
        unsigned int v43 = *(unsigned __int16 *)(a1 + 3164);
LABEL_58:
        ++v45;
        v46 += 20;
        if (v45 >= v43)
        {
          if (v43)
          {
            int v52 = (_DWORD *)(v40 + 2572);
            for (uint64_t i = v43; i; --i)
            {
              unsigned int v54 = *(_DWORD *)(a1 + 3904);
              unsigned int v55 = v54 - 4;
              if (v54 < 4) {
                return v19;
              }
              int v56 = *(int **)(a1 + 3896);
              int v57 = *v56;
              *(void *)(a1 + 3896) = v56 + 1;
              *(_DWORD *)(a1 + 3904) = v55;
              if (v34)
              {
                *(v52 - 40) = v57;
                if ((v34 & 2) != 0)
                {
LABEL_69:
                  *(v52 - 20) = v57;
                  if ((v34 & 4) == 0) {
                    goto LABEL_66;
                  }
LABEL_65:
                  *int v52 = v57;
                  goto LABEL_66;
                }
              }
              else if ((v34 & 2) != 0)
              {
                goto LABEL_69;
              }
              if ((v34 & 4) != 0) {
                goto LABEL_65;
              }
LABEL_66:
              ++v52;
            }
          }
LABEL_71:
          unsigned int v58 = *(_DWORD *)(a1 + 3904);
          BOOL v17 = v58 >= 2;
          unsigned int v59 = v58 - 2;
          if (!v17) {
            return v19;
          }
          *(void *)(a1 + 3896) += 2;
          *(_DWORD *)(a1 + 3904) = v59;
          int v21 = v63;
          uint64_t v12 = v64;
          int v23 = v61;
          int v22 = v62;
          if ((v42 & 1) == 0)
          {
            if (!sub_10001E8D8(a1, *(_DWORD *)(v40 + 2656), v63, v62)
              || !sub_10001E8D8(a1, *(_DWORD *)(v40 + 2660), v61, (unsigned int *)(a1 + 3416))
              || (uint64_t v15 = sub_10001E988(a1, *(_DWORD *)(v40 + 2664), (unsigned int *)(a1 + 3168), (unsigned int *)(a1 + 3420)), (v15 & 1) == 0))
            {
              free((void *)v40);
              return v19;
            }
            if (*v64 == v28)
            {
              *(void *)uint64_t v40 = *(void *)(a1 + 3600);
              *(void *)(a1 + 3600) = v40;
            }
            else
            {
              *(void *)uint64_t v40 = *(void *)(a1 + 3608);
              *(void *)(a1 + 3608) = v40;
            }
            uint64_t v24 = v65;
          }
LABEL_25:
          BOOL v19 = ++v20 >= v6;
          if (v20 == v6) {
            return v19;
          }
          goto LABEL_17;
        }
        goto LABEL_45;
      }
    }
  }
  printf("e: unexpected PBDS version %d\n");
  return 0;
}

uint64_t sub_100011C70(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) < 0x30000u)
  {
    uint64_t v4 = 0;
    int v5 = v12;
    int v13 = 0;
    memset(v12, 0, sizeof(v12));
    int v11 = 1;
    do
    {
      for (uint64_t i = 0; i != 12; i += 4)
      {
        unsigned int v7 = *(int **)(a1 + 3896);
        int v8 = *v7;
        *(void *)(a1 + 3896) = v7 + 1;
        LODWORD(v7) = *(_DWORD *)(a1 + 3904);
        *(_DWORD *)(a1 + 3904) = v7 - 4;
        if (v7 < 4) {
          puts("e: data_sz underflow in get_value");
        }
        *(_DWORD *)((char *)v5 + i) = v8;
      }
      ++v4;
      int v5 = (_OWORD *)((char *)v5 + 12);
    }
    while (v4 != 3);
    uint64_t v2 = (*(uint64_t (**)(uint64_t, int *, uint64_t, void, void, void))a1)(98, &v11, 40, 0, 0, *(void *)(a1 + 16));
    if (v2) {
      unsigned int v9 = "i:  UPCL set DPCL data succeeded";
    }
    else {
      unsigned int v9 = "e: UPCL set DPCL data failed";
    }
    puts(v9);
  }
  else
  {
    printf("e: Unexpected DPCL block version 0x%x\n", *(_DWORD *)(a2 + 4));
    return 0;
  }
  return v2;
}

uint64_t sub_100011D84(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) >= 0x20000u)
  {
    printf("e: unexpected LLMT block version %d\n");
    return 0;
  }
  *(_DWORD *)(a1 + 3616) = 1;
  if (*(_DWORD *)(a2 + 8) != 20)
  {
    printf("e: unexpected LLMT block size %d\n");
    return 0;
  }
  for (uint64_t i = 0; i != 32; i += 2)
  {
    uint64_t v4 = *(__int16 **)(a1 + 3896);
    __int16 v5 = *v4;
    *(void *)(a1 + 3896) = v4 + 1;
    LODWORD(v4) = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v4 - 2;
    if (v4 < 2) {
      puts("e: data_sz underflow in get_value");
    }
    *(_WORD *)(a1 + 3620 + i) = v5;
  }
  for (uint64_t j = 0; j != 32; j += 2)
  {
    unsigned int v7 = *(__int16 **)(a1 + 3896);
    __int16 v8 = *v7;
    *(void *)(a1 + 3896) = v7 + 1;
    LODWORD(v7) = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v7 - 2;
    if (v7 < 2) {
      puts("e: data_sz underflow in get_value");
    }
    *(_WORD *)(a1 + 3652 + j) = v8;
  }
  unsigned int v9 = *(__int16 **)(a1 + 3896);
  __int16 v12 = *v9;
  int v10 = v9 + 1;
  __int16 v11 = v12;
  *(void *)(a1 + 3896) = v10;
  unsigned int v13 = *(_DWORD *)(a1 + 3904);
  BOOL v14 = v13 >= 2;
  unsigned int v15 = v13 - 2;
  *(_DWORD *)(a1 + 3904) = v15;
  if (!v14)
  {
    puts("e: data_sz underflow in get_value");
    int v10 = *(_WORD **)(a1 + 3896);
    unsigned int v15 = *(_DWORD *)(a1 + 3904);
  }
  *(_WORD *)(a1 + 3684) = v11;
  *(void *)(a1 + 3896) = v10 + 1;
  *(_DWORD *)(a1 + 3904) = v15 - 2;
  if (v15 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  return 1;
}

uint64_t sub_100011EE8(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int16 *)(a2 + 6) << 16 == 0x10000 && *(_DWORD *)(a2 + 8) == 4)
  {
    int v4 = **(_DWORD **)(a1 + 3896);
    if ((*(unsigned int (**)(uint64_t, int *, uint64_t, void, void, void))a1)(99, &v4, 4, 0, 0, *(void *)(a1 + 16)))
    {
      puts("i: set user_cal_aft_gain succeeded");
      return 1;
    }
    unsigned int v3 = "e: set user_cal_aft_gain failed";
  }
  else
  {
    unsigned int v3 = "e: Bad size/version for aftg";
  }
  puts(v3);
  return 0;
}

BOOL sub_100011F80(uint64_t a1, uint64_t a2)
{
  int v2 = HIWORD(*(_DWORD *)(a2 + 4));
  unsigned int v3 = v2 - 1;
  if ((v2 - 1) <= 1)
  {
    *(_DWORD *)(a1 + 3692) = v2;
    if (v2 == 2)
    {
      int v35 = *(__int16 **)(a1 + 3896);
      __int16 v36 = *v35;
      *(void *)(a1 + 3896) = v35 + 1;
      LODWORD(v35) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v35 - 2;
      if (v35 < 2) {
        puts("e: data_sz underflow in get_value");
      }
      uint64_t v37 = 0;
      *(_WORD *)(a1 + 3696) = v36;
      do
      {
        int v38 = *(__int16 **)(a1 + 3896);
        __int16 v39 = *v38;
        *(void *)(a1 + 3896) = v38 + 1;
        LODWORD(v38) = *(_DWORD *)(a1 + 3904);
        *(_DWORD *)(a1 + 3904) = v38 - 2;
        if (v38 < 2) {
          puts("e: data_sz underflow in get_value");
        }
        *(_WORD *)(a1 + 3698 + v37) = v39;
        v37 += 2;
      }
      while (v37 != 22);
      uint64_t v40 = *(__int16 **)(a1 + 3896);
      __int16 v43 = *v40;
      int v41 = v40 + 1;
      __int16 v42 = v43;
      *(void *)(a1 + 3896) = v41;
      unsigned int v44 = *(_DWORD *)(a1 + 3904);
      BOOL v15 = v44 >= 2;
      unsigned int v45 = v44 - 2;
      *(_DWORD *)(a1 + 3904) = v45;
      if (!v15)
      {
        puts("e: data_sz underflow in get_value");
        int v41 = *(__int16 **)(a1 + 3896);
        unsigned int v45 = *(_DWORD *)(a1 + 3904);
      }
      *(_WORD *)(a1 + 3720) = v42;
      __int16 v48 = *v41;
      unint64_t v46 = v41 + 1;
      __int16 v47 = v48;
      *(void *)(a1 + 3896) = v46;
      BOOL v15 = v45 >= 2;
      unsigned int v49 = v45 - 2;
      *(_DWORD *)(a1 + 3904) = v49;
      if (!v15)
      {
        puts("e: data_sz underflow in get_value");
        unint64_t v46 = *(__int16 **)(a1 + 3896);
        unsigned int v49 = *(_DWORD *)(a1 + 3904);
      }
      *(_WORD *)(a1 + 3722) = v47;
      __int16 v52 = *v46;
      int v50 = v46 + 1;
      __int16 v51 = v52;
      *(void *)(a1 + 3896) = v50;
      BOOL v15 = v49 >= 2;
      unsigned int v53 = v49 - 2;
      *(_DWORD *)(a1 + 3904) = v53;
      if (!v15)
      {
        puts("e: data_sz underflow in get_value");
        int v50 = *(__int16 **)(a1 + 3896);
        unsigned int v53 = *(_DWORD *)(a1 + 3904);
      }
      *(_WORD *)(a1 + 3724) = v51;
      __int16 v56 = *v50;
      unsigned int v54 = v50 + 1;
      __int16 v55 = v56;
      *(void *)(a1 + 3896) = v54;
      BOOL v15 = v53 >= 2;
      unsigned int v57 = v53 - 2;
      *(_DWORD *)(a1 + 3904) = v57;
      if (!v15)
      {
        puts("e: data_sz underflow in get_value");
        unsigned int v54 = *(__int16 **)(a1 + 3896);
        unsigned int v57 = *(_DWORD *)(a1 + 3904);
      }
      *(_WORD *)(a1 + 3726) = v55;
      __int16 v60 = *v54;
      unsigned int v58 = v54 + 1;
      __int16 v59 = v60;
      *(void *)(a1 + 3896) = v58;
      BOOL v15 = v57 >= 2;
      unsigned int v61 = v57 - 2;
      *(_DWORD *)(a1 + 3904) = v61;
      if (!v15)
      {
        puts("e: data_sz underflow in get_value");
        unsigned int v58 = *(__int16 **)(a1 + 3896);
        unsigned int v61 = *(_DWORD *)(a1 + 3904);
      }
      *(_WORD *)(a1 + 3728) = v59;
      __int16 v62 = *v58;
      *(void *)(a1 + 3896) = v58 + 1;
      *(_DWORD *)(a1 + 3904) = v61 - 2;
      if (v61 < 2) {
        puts("e: data_sz underflow in get_value");
      }
      *(_WORD *)(a1 + 3730) = v62;
    }
    else if (v2 == 1)
    {
      __int16 v5 = *(__int16 **)(a1 + 3896);
      __int16 v6 = *v5;
      *(void *)(a1 + 3896) = v5 + 1;
      LODWORD(v5) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v5 - 2;
      if (v5 < 2) {
        puts("e: data_sz underflow in get_value");
      }
      uint64_t v7 = 0;
      *(_WORD *)(a1 + 3696) = v6;
      do
      {
        __int16 v8 = *(__int16 **)(a1 + 3896);
        __int16 v9 = *v8;
        *(void *)(a1 + 3896) = v8 + 1;
        LODWORD(v8) = *(_DWORD *)(a1 + 3904);
        *(_DWORD *)(a1 + 3904) = v8 - 2;
        if (v8 < 2) {
          puts("e: data_sz underflow in get_value");
        }
        *(_WORD *)(a1 + 3698 + v7) = v9;
        v7 += 2;
      }
      while (v7 != 22);
      int v10 = *(__int16 **)(a1 + 3896);
      __int16 v13 = *v10;
      __int16 v11 = v10 + 1;
      __int16 v12 = v13;
      *(void *)(a1 + 3896) = v11;
      unsigned int v14 = *(_DWORD *)(a1 + 3904);
      BOOL v15 = v14 >= 2;
      unsigned int v16 = v14 - 2;
      *(_DWORD *)(a1 + 3904) = v16;
      if (!v15)
      {
        puts("e: data_sz underflow in get_value");
        __int16 v11 = *(__int16 **)(a1 + 3896);
        unsigned int v16 = *(_DWORD *)(a1 + 3904);
      }
      *(_WORD *)(a1 + 3720) = v12;
      __int16 v17 = *v11;
      *(void *)(a1 + 3896) = v11 + 1;
      *(_DWORD *)(a1 + 3904) = v16 - 2;
      if (v16 < 2) {
        puts("e: data_sz underflow in get_value");
      }
      uint64_t v18 = 0;
      *(_WORD *)(a1 + 3722) = v17;
      do
      {
        BOOL v19 = *(__int16 **)(a1 + 3896);
        __int16 v20 = *v19;
        *(void *)(a1 + 3896) = v19 + 1;
        LODWORD(v19) = *(_DWORD *)(a1 + 3904);
        *(_DWORD *)(a1 + 3904) = v19 - 2;
        if (v19 < 2) {
          puts("e: data_sz underflow in get_value");
        }
        *(_WORD *)(a1 + 3724 + v18) = v20;
        v18 += 2;
      }
      while (v18 != 6);
      for (uint64_t i = 0; i != 6; i += 2)
      {
        int v22 = *(__int16 **)(a1 + 3896);
        __int16 v23 = *v22;
        *(void *)(a1 + 3896) = v22 + 1;
        LODWORD(v22) = *(_DWORD *)(a1 + 3904);
        *(_DWORD *)(a1 + 3904) = v22 - 2;
        if (v22 < 2) {
          puts("e: data_sz underflow in get_value");
        }
        *(_WORD *)(a1 + 3730 + i) = v23;
      }
      uint64_t v24 = *(__int16 **)(a1 + 3896);
      __int16 v27 = *v24;
      unsigned int v25 = v24 + 1;
      __int16 v26 = v27;
      *(void *)(a1 + 3896) = v25;
      unsigned int v28 = *(_DWORD *)(a1 + 3904);
      BOOL v15 = v28 >= 2;
      unsigned int v29 = v28 - 2;
      *(_DWORD *)(a1 + 3904) = v29;
      if (!v15)
      {
        puts("e: data_sz underflow in get_value");
        unsigned int v25 = *(__int16 **)(a1 + 3896);
        unsigned int v29 = *(_DWORD *)(a1 + 3904);
      }
      *(_WORD *)(a1 + 3736) = v26;
      __int16 v32 = *v25;
      float v30 = v25 + 1;
      __int16 v31 = v32;
      *(void *)(a1 + 3896) = v30;
      BOOL v15 = v29 >= 2;
      unsigned int v33 = v29 - 2;
      *(_DWORD *)(a1 + 3904) = v33;
      if (!v15)
      {
        puts("e: data_sz underflow in get_value");
        float v30 = *(__int16 **)(a1 + 3896);
        unsigned int v33 = *(_DWORD *)(a1 + 3904);
      }
      *(_WORD *)(a1 + 3738) = v31;
      __int16 v34 = *v30;
      *(void *)(a1 + 3896) = v30 + 1;
      *(_DWORD *)(a1 + 3904) = v33 - 2;
      if (v33 < 2) {
        puts("e: data_sz underflow in get_value");
      }
      *(_WORD *)(a1 + 3740) = v34;
    }
  }
  return v3 < 2;
}

uint64_t sub_100012330(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(_DWORD *)(a2 + 4);
  if (v3 != 0x20000 && v3 != 0x10000) {
    return 0;
  }
  int v4 = *(_WORD **)(a1 + 3896);
  __int16 v7 = *v4;
  __int16 v5 = v4 + 1;
  __int16 v6 = v7;
  *(void *)(a1 + 3896) = v5;
  unsigned int v8 = *(_DWORD *)(a1 + 3904);
  BOOL v9 = v8 >= 2;
  unsigned int v10 = v8 - 2;
  *(_DWORD *)(a1 + 3904) = v10;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    __int16 v5 = *(void **)(a1 + 3896);
    unsigned int v10 = *(_DWORD *)(a1 + 3904);
  }
  uint64_t v13 = *v5;
  __int16 v11 = (unsigned __int16 *)(v5 + 1);
  uint64_t v12 = v13;
  *(void *)(a1 + 3896) = v11;
  BOOL v9 = v10 >= 8;
  unsigned int v14 = v10 - 8;
  *(_DWORD *)(a1 + 3904) = v14;
  if (!v9)
  {
    puts("e: data_sz underflow in get_long_value");
    __int16 v11 = *(unsigned __int16 **)(a1 + 3896);
    unsigned int v14 = *(_DWORD *)(a1 + 3904);
  }
  unsigned int v15 = HIWORD(v3);
  int v16 = *v11;
  *(void *)(a1 + 3896) = v11 + 1;
  *(_DWORD *)(a1 + 3904) = v14 - 2;
  if (v14 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  if (v15 == 2)
  {
    __int16 v17 = *(unsigned __int16 **)(a1 + 3896);
    int v18 = *v17;
    *(void *)(a1 + 3896) = v17 + 1;
    LODWORD(v17) = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v17 - 2;
    if (v17 < 2) {
      puts("e: data_sz underflow in get_value");
    }
  }
  else
  {
    int v18 = 0;
  }
  BOOL v19 = sub_10000A8F4(a1, v16, v18);
  if (!v19) {
    return 0;
  }
  __int16 v20 = v19;
  *(_DWORD *)(v19 + 5) = v15;
  v19[4] = v16;
  if (v15 != 2)
  {
    if (v15 == 1)
    {
      v19[7] = v6;
      *(void *)(v19 + 11) = v12;
      uint64_t v21 = 17;
      v19[16] = v16;
      do
      {
        int v22 = *(int **)(a1 + 3896);
        int v23 = *v22;
        *(void *)(a1 + 3896) = v22 + 1;
        LODWORD(v22) = *(_DWORD *)(a1 + 3904);
        *(_DWORD *)(a1 + 3904) = v22 - 4;
        if (v22 < 4) {
          puts("e: data_sz underflow in get_value");
        }
        *(_DWORD *)&v20[v21] = v23;
        v21 += 2;
      }
      while (v21 != 59);
      uint64_t v24 = 0;
      int v38 = v20;
      unsigned int v25 = v20 + 59;
      do
      {
        __int16 v39 = v25;
        uint64_t v40 = v24;
        for (uint64_t i = 0; i != 2; ++i)
        {
          uint64_t v27 = 0;
          unsigned int v28 = v25;
          do
          {
            uint64_t v29 = 0;
            float v30 = v28;
            do
            {
              for (uint64_t j = 0; j != 21; ++j)
              {
                __int16 v32 = *(__int16 **)(a1 + 3896);
                unsigned __int16 v33 = *v32;
                *(void *)(a1 + 3896) = v32 + 1;
                LODWORD(v32) = *(_DWORD *)(a1 + 3904);
                *(_DWORD *)(a1 + 3904) = v32 - 2;
                if (v32 < 2) {
                  puts("e: data_sz underflow in get_value");
                }
                v30[j] = v33;
              }
              ++v29;
              v30 += 21;
            }
            while (v29 != 11);
            ++v27;
            v28 += 231;
          }
          while (v27 != 3);
          v25 += 693;
        }
        uint64_t v24 = v40 + 1;
        unsigned int v25 = v39 + 1386;
      }
      while (v40 != 2);
      unsigned int v34 = v38[4];
      int v35 = (_WORD *)(a1 + 3742);
      __int16 v36 = (_WORD *)(a1 + 3758);
      goto LABEL_35;
    }
    return 0;
  }
  v19[7] = v6;
  *(void *)(v19 + 11) = v12;
  v19[15] = v16;
  v19[16] = v18;
  sub_100012E38(a1, v19 + 19, 21);
  sub_100012DE8(a1, v20 + 61, 693);
  if (!sub_100012E88(a1, v20[4], (_WORD *)(a1 + 3732), (_WORD *)(a1 + 3748))) {
    return 0;
  }
  unsigned int v34 = v20[16];
  int v35 = (_WORD *)(a1 + 3750);
  __int16 v36 = (_WORD *)(a1 + 3766);
LABEL_35:

  return sub_100012E88(a1, v34, v35, v36);
}

uint64_t sub_100012604(uint64_t a1, uint64_t a2)
{
  int v4 = (unsigned __int16 *)malloc_type_calloc(1uLL, 0x3B828uLL, 0x1000040B9B2AFE7uLL);
  unsigned int v5 = HIWORD(*(_DWORD *)(a2 + 4));
  if (v5 > 2) {
    return 0;
  }
  memset(v113, 0, 20);
  int v6 = 4 * *(_DWORD *)(a2 + 8);
  if (*(_DWORD *)(a1 + 3904) >= (v6 - 12))
  {
    *(_DWORD *)(a1 + 3904) = v6 - 12;
    *(_DWORD *)int v4 = v5;
    if (v6 != 12)
    {
      __int16 v7 = *(unsigned __int16 **)(a1 + 3896);
      unsigned __int16 v8 = *v7;
      *(void *)(a1 + 3896) = v7 + 1;
      *(_DWORD *)(a1 + 3904) = v6 - 14;
      v4[2] = v8;
      unsigned int v9 = *(_DWORD *)(a1 + 3904);
      unsigned int v10 = v9 - 2;
      if (v9 >= 2)
      {
        __int16 v11 = *(unsigned __int16 **)(a1 + 3896);
        unsigned int v13 = *v11;
        unsigned int v12 = v13;
        *(void *)(a1 + 3896) = v11 + 1;
        *(_DWORD *)(a1 + 3904) = v10;
        v4[3] = v13;
        if (v13 <= 0x2D)
        {
          if (v12)
          {
            unint64_t v14 = 0;
            while (1)
            {
              unsigned int v15 = *(_DWORD *)(a1 + 3904);
              BOOL v16 = v15 >= 4;
              unsigned int v17 = v15 - 4;
              if (!v16) {
                break;
              }
              int v18 = *(int **)(a1 + 3896);
              int v19 = *v18;
              *(void *)(a1 + 3896) = v18 + 1;
              *(_DWORD *)(a1 + 3904) = v17;
              *(_DWORD *)&v4[2 * v14++ + 4] = v19;
              if (v14 >= v4[3]) {
                goto LABEL_13;
              }
            }
          }
          else
          {
LABEL_13:
            __int16 v20 = v4 + 120973;
            uint64_t v21 = 94;
            while (1)
            {
              unsigned int v22 = *(_DWORD *)(a1 + 3904);
              BOOL v16 = v22 >= 2;
              unsigned int v23 = v22 - 2;
              if (!v16) {
                break;
              }
              uint64_t v24 = *(unsigned __int16 **)(a1 + 3896);
              unsigned __int16 v25 = *v24;
              *(void *)(a1 + 3896) = v24 + 1;
              *(_DWORD *)(a1 + 3904) = v23;
              v4[v21++] = v25;
              if (v21 == 108)
              {
                if (v4[3])
                {
                  unint64_t v26 = 0;
                  uint64_t v27 = (char *)(v4 + 108);
LABEL_19:
                  uint64_t v28 = 0;
                  uint64_t v29 = v27;
LABEL_20:
                  uint64_t v30 = 0;
                  while (1)
                  {
                    unsigned int v31 = *(_DWORD *)(a1 + 3904);
                    BOOL v16 = v31 >= 2;
                    unsigned int v32 = v31 - 2;
                    if (!v16) {
                      break;
                    }
                    unsigned __int16 v33 = *(__int16 **)(a1 + 3896);
                    __int16 v34 = *v33;
                    *(void *)(a1 + 3896) = v33 + 1;
                    *(_DWORD *)(a1 + 3904) = v32;
                    *(_WORD *)&v29[v30] = v34;
                    v30 += 2;
                    if (v30 == 32)
                    {
                      ++v28;
                      v29 += 32;
                      if (v28 != 3) {
                        goto LABEL_20;
                      }
                      ++v26;
                      v27 += 96;
                      if (v26 < v4[3]) {
                        goto LABEL_19;
                      }
                      if (!v4[3]) {
                        goto LABEL_33;
                      }
                      unint64_t v35 = 0;
                      __int16 v36 = (char *)(v4 + 2268);
LABEL_28:
                      uint64_t v37 = 0;
                      while (1)
                      {
                        unsigned int v38 = *(_DWORD *)(a1 + 3904);
                        BOOL v16 = v38 >= 2;
                        unsigned int v39 = v38 - 2;
                        if (!v16) {
                          goto LABEL_100;
                        }
                        uint64_t v40 = *(__int16 **)(a1 + 3896);
                        __int16 v41 = *v40;
                        *(void *)(a1 + 3896) = v40 + 1;
                        *(_DWORD *)(a1 + 3904) = v39;
                        *(_WORD *)&v36[v37] = v41;
                        v37 += 2;
                        if (v37 == 32)
                        {
                          ++v35;
                          v36 += 32;
                          if (v35 < v4[3]) {
                            goto LABEL_28;
                          }
                          goto LABEL_33;
                        }
                      }
                    }
                  }
                }
                else
                {
LABEL_33:
                  uint64_t v42 = 2988;
                  while (1)
                  {
                    unsigned int v43 = *(_DWORD *)(a1 + 3904);
                    BOOL v16 = v43 >= 2;
                    unsigned int v44 = v43 - 2;
                    if (!v16) {
                      break;
                    }
                    unsigned int v45 = *(unsigned __int16 **)(a1 + 3896);
                    unsigned __int16 v46 = *v45;
                    *(void *)(a1 + 3896) = v45 + 1;
                    *(_DWORD *)(a1 + 3904) = v44;
                    v4[v42++] = v46;
                    if (v42 == 2992)
                    {
                      if (v4[3])
                      {
                        unint64_t v47 = 0;
                        __int16 v48 = (char *)(v4 + 2992);
LABEL_39:
                        uint64_t v49 = 0;
                        int v50 = v48;
LABEL_40:
                        uint64_t v51 = 0;
                        while (1)
                        {
                          unsigned int v52 = *(_DWORD *)(a1 + 3904);
                          BOOL v16 = v52 >= 4;
                          unsigned int v53 = v52 - 4;
                          if (!v16) {
                            break;
                          }
                          unsigned int v54 = *(int **)(a1 + 3896);
                          int v55 = *v54;
                          *(void *)(a1 + 3896) = v54 + 1;
                          *(_DWORD *)(a1 + 3904) = v53;
                          *(_DWORD *)&v50[v51] = v55;
                          v51 += 4;
                          if (v51 == 1028)
                          {
                            ++v49;
                            v50 += 1028;
                            if (v49 != 3) {
                              goto LABEL_40;
                            }
                            ++v47;
                            v48 += 3084;
                            if (v47 < v4[3]) {
                              goto LABEL_39;
                            }
                            goto LABEL_46;
                          }
                        }
                      }
                      else
                      {
LABEL_46:
                        uint64_t v56 = 0;
                        unsigned int v57 = (char *)(v4 + 72382);
LABEL_47:
                        uint64_t v58 = 0;
                        __int16 v59 = v57;
LABEL_48:
                        uint64_t v60 = 0;
                        unsigned int v61 = v59;
LABEL_49:
                        uint64_t v62 = 0;
                        while (1)
                        {
                          unsigned int v63 = *(_DWORD *)(a1 + 3904);
                          BOOL v16 = v63 >= 2;
                          unsigned int v64 = v63 - 2;
                          if (!v16) {
                            break;
                          }
                          uint64_t v65 = *(__int16 **)(a1 + 3896);
                          __int16 v66 = *v65;
                          *(void *)(a1 + 3896) = v65 + 1;
                          *(_DWORD *)(a1 + 3904) = v64;
                          *(_WORD *)&v61[v62] = v66;
                          v62 += 2;
                          if (v62 == 22)
                          {
                            ++v60;
                            v61 += 22;
                            if (v60 != 21) {
                              goto LABEL_49;
                            }
                            ++v58;
                            v59 += 462;
                            if (v58 != 10) {
                              goto LABEL_48;
                            }
                            ++v56;
                            v57 += 4620;
                            if (v56 != 20) {
                              goto LABEL_47;
                            }
                            uint64_t v67 = 0;
                            int v68 = v4;
                            int v69 = (char *)(v4 + 118582);
LABEL_57:
                            uint64_t v70 = 0;
                            while (1)
                            {
                              unsigned int v71 = *(_DWORD *)(a1 + 3904);
                              BOOL v16 = v71 >= 2;
                              unsigned int v72 = v71 - 2;
                              int v4 = v68;
                              if (!v16) {
                                goto LABEL_100;
                              }
                              unsigned int v73 = *(__int16 **)(a1 + 3896);
                              __int16 v74 = *v73;
                              *(void *)(a1 + 3896) = v73 + 1;
                              *(_DWORD *)(a1 + 3904) = v72;
                              *(_WORD *)&v69[v70] = v74;
                              v70 += 2;
                              if (v70 == 22)
                              {
                                ++v67;
                                v69 += 22;
                                if (v67 != 21) {
                                  goto LABEL_57;
                                }
                                unsigned int v75 = *(_DWORD *)(a1 + 3904);
                                BOOL v16 = v75 >= 2;
                                unsigned int v76 = v75 - 2;
                                int v4 = v68;
                                if (!v16) {
                                  goto LABEL_100;
                                }
                                *(void *)(a1 + 3896) += 2;
                                *(_DWORD *)(a1 + 3904) = v76;
                                if (v5 == 2)
                                {
                                  if (v68[3])
                                  {
                                    unint64_t v77 = 0;
                                    unsigned int v78 = v68 + 118813;
LABEL_67:
                                    uint64_t v79 = 0;
                                    int v80 = v78;
LABEL_68:
                                    uint64_t v81 = 0;
                                    while (1)
                                    {
                                      unsigned int v82 = *(_DWORD *)(a1 + 3904);
                                      BOOL v16 = v82 >= 2;
                                      unsigned int v83 = v82 - 2;
                                      int v4 = v68;
                                      if (!v16) {
                                        goto LABEL_100;
                                      }
                                      __int16 v84 = *(unsigned __int16 **)(a1 + 3896);
                                      unsigned __int16 v85 = *v84;
                                      *(void *)(a1 + 3896) = v84 + 1;
                                      *(_DWORD *)(a1 + 3904) = v83;
                                      v80[v81++] = v85;
                                      if (v81 == 16)
                                      {
                                        ++v79;
                                        v80 += 16;
                                        if (v79 != 3) {
                                          goto LABEL_68;
                                        }
                                        ++v77;
                                        v78 += 48;
                                        if (v77 >= v68[3])
                                        {
                                          unsigned int v76 = *(_DWORD *)(a1 + 3904);
                                          break;
                                        }
                                        goto LABEL_67;
                                      }
                                    }
                                  }
                                  unsigned int v86 = v76 - 2;
                                  int v4 = v68;
                                  if (v76 < 2) {
                                    goto LABEL_100;
                                  }
                                  int v87 = *(__int16 **)(a1 + 3896);
                                  __int16 v88 = *v87;
                                  *(void *)(a1 + 3896) = v87 + 1;
                                  *(_DWORD *)(a1 + 3904) = v86;
                                  *__int16 v20 = v88;
                                  unsigned int v89 = *(_DWORD *)(a1 + 3904);
                                  BOOL v16 = v89 >= 2;
                                  unsigned int v90 = v89 - 2;
                                  if (!v16) {
                                    goto LABEL_100;
                                  }
                                  unsigned int v91 = *(unsigned __int16 **)(a1 + 3896);
                                  unsigned int v93 = *v91;
                                  LODWORD(v92) = v93;
                                  *(void *)(a1 + 3896) = v91 + 1;
                                  *(_DWORD *)(a1 + 3904) = v90;
                                  v20[1] = v93;
                                  if (v93 > 0xA) {
                                    return 0;
                                  }
                                  unsigned int v94 = v68[3];
                                  if (v68[3])
                                  {
                                    unint64_t v95 = 0;
                                    int v96 = v68 + 120975;
                                    int v97 = v92;
                                    do
                                    {
                                      if (v97)
                                      {
                                        unint64_t v98 = 0;
                                        while (1)
                                        {
                                          unsigned int v99 = *(_DWORD *)(a1 + 3904);
                                          BOOL v16 = v99 >= 2;
                                          unsigned int v100 = v99 - 2;
                                          int v4 = v68;
                                          if (!v16) {
                                            goto LABEL_100;
                                          }
                                          int v101 = *(unsigned __int16 **)(a1 + 3896);
                                          unsigned __int16 v102 = *v101;
                                          *(void *)(a1 + 3896) = v101 + 1;
                                          *(_DWORD *)(a1 + 3904) = v100;
                                          v96[v98++] = v102;
                                          unint64_t v92 = (unsigned __int16)v20[1];
                                          if (v98 >= v92)
                                          {
                                            unsigned int v94 = v68[3];
                                            int v97 = (unsigned __int16)v20[1];
                                            break;
                                          }
                                        }
                                      }
                                      ++v95;
                                      v96 += 10;
                                    }
                                    while (v95 < v94);
                                    if (!v94) {
                                      goto LABEL_97;
                                    }
                                    unint64_t v103 = 0;
                                    int v104 = v68 + 121425;
                                    while (!v92)
                                    {
LABEL_96:
                                      ++v103;
                                      v104 += 10;
                                      if (v103 >= v94) {
                                        goto LABEL_97;
                                      }
                                    }
                                    unint64_t v105 = 0;
                                    while (1)
                                    {
                                      unsigned int v106 = *(_DWORD *)(a1 + 3904);
                                      BOOL v16 = v106 >= 2;
                                      unsigned int v107 = v106 - 2;
                                      int v4 = v68;
                                      if (!v16) {
                                        goto LABEL_100;
                                      }
                                      int v108 = *(unsigned __int16 **)(a1 + 3896);
                                      unsigned __int16 v109 = *v108;
                                      *(void *)(a1 + 3896) = v108 + 1;
                                      *(_DWORD *)(a1 + 3904) = v107;
                                      v104[v105++] = v109;
                                      unint64_t v92 = (unsigned __int16)v20[1];
                                      if (v105 >= v92)
                                      {
                                        unsigned int v94 = v68[3];
                                        goto LABEL_96;
                                      }
                                    }
                                  }
LABEL_97:
                                  unsigned int v76 = *(_DWORD *)(a1 + 3904);
                                }
                                if (v76)
                                {
                                  printf("e: IRDC Block data and header size mismatch by %d too many bytes\n", v76);
                                  return 0;
                                }
                                LODWORD(v113[0]) = 1;
                                *(void *)((char *)&v113[1] + 4) = v68;
                                LODWORD(v113[1]) = 245760;
                                BYTE4(v113[0]) = 0;
                                uint64_t v110 = (*(uint64_t (**)(uint64_t, void *, uint64_t, void, void, void))a1)(113, v113, 20, 0, 0, *(void *)(a1 + 16));
                                if (v110) {
                                  __int16 v112 = "i: set IRDC data succeeded";
                                }
                                else {
                                  __int16 v112 = "e: set IRDC data failed";
                                }
                                puts(v112);
                                free(v68);
                                return v110;
                              }
                            }
                          }
                        }
                      }
                      goto LABEL_100;
                    }
                  }
                }
                break;
              }
            }
          }
        }
      }
    }
  }
  else if (!v4)
  {
    return 0;
  }
LABEL_100:
  free(v4);
  return 0;
}

uint64_t sub_100012BBC(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) != 0x10000) {
    return 0;
  }
  unsigned int v3 = *(_DWORD *)(a1 + 3904);
  unsigned int v4 = v3 - 2;
  if (v3 < 2) {
    return 0;
  }
  unsigned int v5 = *(__int16 **)(a1 + 3896);
  __int16 v6 = *v5;
  *(void *)(a1 + 3896) = v5 + 1;
  *(_DWORD *)(a1 + 3904) = v4;
  if (v4 < 2) {
    return 0;
  }
  __int16 v7 = v5[1];
  *(void *)(a1 + 3896) = v5 + 2;
  *(_DWORD *)(a1 + 3904) = v3 - 4;
  if (v3 - 4 < 2) {
    return 0;
  }
  unint64_t v8 = (unsigned __int16)v5[2];
  *(void *)(a1 + 3896) = v5 + 3;
  *(_DWORD *)(a1 + 3904) = v3 - 6;
  *(_WORD *)(a1 + 3792) = v6;
  __int16 v9 = (char)v7;
  unsigned int v10 = sub_10001308C(a1, (char)v7);
  if (!v10) {
    return 0;
  }
  __int16 v11 = v10;
  *(_DWORD *)(v10 + 5) = 1;
  v10[8] = v9;
  v10[4] = v9;
  v10[9] = v8;
  if (v8 > 0x28) {
    return 0;
  }
  unint64_t v12 = *(unsigned int *)(a1 + 3904);
  if (v12 < 2 * v8) {
    return 0;
  }
  if (v8)
  {
    uint64_t v13 = 0;
    unint64_t v14 = *(__int16 **)(a1 + 3896);
    unint64_t v15 = (unint64_t)(v12 - 2) >> 1;
    do
    {
      __int16 v16 = *v14++;
      LODWORD(v12) = v12 - 2;
      v10[v13 + 13] = v16;
      unint64_t v17 = v13 + 1;
      if (v8 - 1 == v13) {
        break;
      }
    }
    while (v15 != v13++);
    *(void *)(a1 + 3896) = v14;
    *(_DWORD *)(a1 + 3904) = v12;
    if (v17 < v8) {
      return 0;
    }
    unint64_t v19 = (unsigned __int16)v10[9];
  }
  else
  {
    unint64_t v19 = 0;
  }
  if (!sub_100013198(a1, (uint64_t)(v10 + 53), v19)) {
    return 0;
  }
  unsigned __int16 v20 = v11[4];

  return sub_10001321C(a1, v20, (unsigned __int16 *)(a1 + 3794), (_WORD *)(a1 + 3814));
}

BOOL sub_100012D2C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3 = *(unsigned int *)(a1 + 3904);
  if (v3 < 2 * a3) {
    return 0;
  }
  if (!a3) {
    return 1;
  }
  if (v3 < 2) {
    return 0;
  }
  uint64_t v4 = 0;
  unsigned int v5 = *(__int16 **)(a1 + 3896);
  do
  {
    __int16 v6 = *v5++;
    LODWORD(v3) = v3 - 2;
    *(_WORD *)(a2 + 2 * v4) = v6;
    unint64_t v7 = v4 + 1;
    if (a3 - 1 == v4) {
      break;
    }
    ++v4;
  }
  while (v3 > 1);
  *(void *)(a1 + 3896) = v5;
  *(_DWORD *)(a1 + 3904) = v3;
  return v7 >= a3;
}

uint64_t sub_100012D98(uint64_t result, unsigned char *a2, unint64_t a3)
{
  unint64_t v3 = *(char **)(result + 3896);
  if (a3)
  {
    unint64_t v4 = a3;
    do
    {
      char v5 = *v3++;
      *a2++ = v5;
      --v4;
    }
    while (v4);
    unint64_t v3 = *(char **)(result + 3896);
  }
  *(void *)(result + 3896) = &v3[a3];
  unint64_t v6 = *(unsigned int *)(result + 3904);
  BOOL v7 = v6 >= a3;
  unint64_t v8 = v6 - a3;
  *(_DWORD *)(result + 3904) = v8;
  if (!v7 || HIDWORD(v8)) {
    return puts("e: data_sz underflow in get_array");
  }
  return result;
}

uint64_t sub_100012DE8(uint64_t result, _WORD *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(result + 3896);
  if (a3)
  {
    unint64_t v4 = *(__int16 **)(result + 3896);
    uint64_t v5 = a3;
    do
    {
      __int16 v6 = *v4++;
      *a2++ = v6;
      --v5;
    }
    while (v5);
  }
  *(void *)(result + 3896) = v3 + 2 * a3;
  unint64_t v7 = *(unsigned int *)(result + 3904);
  BOOL v8 = v7 >= 2 * a3;
  unint64_t v9 = v7 - 2 * a3;
  *(_DWORD *)(result + 3904) = v9;
  if (!v8 || HIDWORD(v9)) {
    return puts("e: data_sz underflow in get_array");
  }
  return result;
}

uint64_t sub_100012E38(uint64_t result, _DWORD *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(result + 3896);
  if (a3)
  {
    unint64_t v4 = *(int **)(result + 3896);
    uint64_t v5 = a3;
    do
    {
      int v6 = *v4++;
      *a2++ = v6;
      --v5;
    }
    while (v5);
  }
  *(void *)(result + 3896) = v3 + 4 * a3;
  unint64_t v7 = *(unsigned int *)(result + 3904);
  BOOL v8 = v7 >= 4 * a3;
  unint64_t v9 = v7 - 4 * a3;
  *(_DWORD *)(result + 3904) = v9;
  if (!v8 || HIDWORD(v9)) {
    return puts("e: data_sz underflow in get_array");
  }
  return result;
}

uint64_t sub_100012E88(uint64_t a1, unsigned int a2, _WORD *a3, _WORD *a4)
{
  unsigned int v4 = (unsigned __int16)*a4;
  if (v4 <= 8)
  {
    if (*a4)
    {
      unint64_t v6 = 0;
      unsigned int v7 = a2;
      while (1)
      {
        unsigned int v8 = (unsigned __int16)a3[v6];
        if (v8 == a2) {
          return 1;
        }
        BOOL v9 = v8 <= a2 && v7 == a2;
        unsigned int v10 = a2;
        if (!v9)
        {
          a3[v6] = v7;
          LOWORD(v4) = *a4;
          unsigned int v10 = v8;
        }
        ++v6;
        unsigned int v7 = v10;
        if (v6 >= (unsigned __int16)v4)
        {
          if ((unsigned __int16)v4 == 8) {
            goto LABEL_2;
          }
          if (v10 > (unsigned __int16)a3[(unsigned __int16)v4 - 1])
          {
            *a4 = v4 + 1;
            a3[(unsigned __int16)v4] = v10;
          }
          return 1;
        }
      }
    }
    else
    {
      uint64_t result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_100012F3C(uint64_t a1)
{
  uint64_t v1 = *(uint64_t ***)(a1 + 3816);
  memset(v5, 0, 20);
  if (v1)
  {
    char v3 = 1;
    do
    {
      LODWORD(v5[0]) = 1;
      *(void *)((char *)&v5[1] + 4) = (char *)v1 + 10;
      LODWORD(v5[1]) = 0x4000;
      BYTE4(v5[0]) = 0;
      if (((*(uint64_t (**)(uint64_t, void *, uint64_t, void, void, void))a1)(117, v5, 20, 0, 0, *(void *)(a1 + 16)) & 1) == 0)
      {
        printf("e: failed to set ELVS LUT temperature %d\n", *((__int16 *)v1 + 4));
        char v3 = 0;
      }
      uint64_t v1 = (uint64_t **)*v1;
    }
    while (v1);
    if ((v3 & 1) == 0) {
      return 0;
    }
  }
  puts("i: set EVLS LUTs succeeded");
  return 1;
}

uint64_t sub_100013008(uint64_t a1)
{
  if (*(void *)(a1 + 3816)) {
    *(_WORD *)(a1 + 24) |= 0x100u;
  }
  return 1;
}

uint64_t sub_100013024(uint64_t a1)
{
  *(_DWORD *)(a1 + 3788) = 1;
  uint64_t v1 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, void, void))a1)(116, a1 + 3788, 28, 0, 0, *(void *)(a1 + 16));
  if (v1) {
    int v2 = "i: set ELVS table config succeeded";
  }
  else {
    int v2 = "e: failed to set ELVS table config";
  }
  puts(v2);
  return v1;
}

_WORD *sub_10001308C(uint64_t a1, int a2)
{
  char v3 = (void *)(a1 + 3816);
  unsigned int v4 = (uint64_t **)(a1 + 3816);
  while (1)
  {
    unsigned int v4 = (uint64_t **)*v4;
    if (!v4) {
      break;
    }
    if (*((unsigned __int16 *)v4 + 4) == (unsigned __int16)a2)
    {
      printf("e: Duplicate elvs table temperature=%d found in input.\n", a2);
      return 0;
    }
  }
  unint64_t v6 = malloc_type_calloc(1uLL, 0x110uLL, 0x10200405058FB69uLL);
  uint64_t v5 = v6;
  if (v6)
  {
    bzero(v6, 0x110uLL);
    v5[4] = a2;
    unsigned int v7 = (void *)*v3;
    if (*v3)
    {
      if (*((__int16 *)v7 + 4) <= a2)
      {
        BOOL v9 = (void *)*v3;
        while (1)
        {
          unsigned int v7 = (void *)*v9;
          if (!*v9) {
            break;
          }
          unsigned int v8 = v9;
          BOOL v9 = (void *)*v9;
          if (*((__int16 *)v7 + 4) > a2) {
            goto LABEL_14;
          }
        }
        *BOOL v9 = v5;
      }
      else
      {
        unsigned int v8 = 0;
LABEL_14:
        if (v8) {
          unsigned int v10 = v8;
        }
        else {
          unsigned int v10 = v3;
        }
        *unsigned int v10 = v5;
        *(void *)uint64_t v5 = v7;
      }
    }
    else
    {
      *char v3 = v5;
    }
  }
  else
  {
    puts("e: Out of memory");
  }
  return v5;
}

BOOL sub_100013198(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (*(unsigned int *)(a1 + 3904) < 4 * a3) {
    return 0;
  }
  if (!a3) {
    return 1;
  }
  unsigned int v3 = *(_DWORD *)(a1 + 3904);
  if (v3 < 4) {
    return 0;
  }
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)(a1 + 3896) + 4;
  do
  {
    uint64_t v6 = v4;
    uint64_t v7 = v5;
    int v8 = *(_DWORD *)(v5 - 4);
    *(_DWORD *)(a1 + 3904) = v3 - 4;
    *(_DWORD *)(a2 + 4 * v4) = v8;
    if (a3 - 1 == v4) {
      break;
    }
    uint64_t v5 = v7 + 4;
    unsigned int v3 = *(_DWORD *)(a1 + 3904);
    ++v4;
  }
  while (v3 >= 4);
  *(void *)(a1 + 3896) = v7;
  return v6 + 1 >= a3;
}

uint64_t sub_10001321C(uint64_t a1, unsigned __int16 a2, unsigned __int16 *a3, _WORD *a4)
{
  unsigned int v4 = (unsigned __int16)*a4;
  if (v4 <= 0xA)
  {
    if (*a4)
    {
      unint64_t v6 = 0;
      int v7 = a2;
      while (1)
      {
        int v8 = a3[v6];
        if (v8 == a2) {
          return 1;
        }
        BOOL v9 = (__int16)v8 <= (__int16)a2 && v7 == a2;
        int v10 = a2;
        if (!v9)
        {
          a3[v6] = v7;
          LOWORD(v4) = *a4;
          int v10 = v8;
        }
        ++v6;
        int v7 = v10;
        if (v6 >= (unsigned __int16)v4)
        {
          if ((unsigned __int16)v4 == 10) {
            goto LABEL_2;
          }
          if ((__int16)a3[(unsigned __int16)v4 - 1] < (__int16)v10)
          {
            *a4 = v4 + 1;
            a3[(unsigned __int16)v4] = v10;
          }
          return 1;
        }
      }
    }
    else
    {
      uint64_t result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_1000132DC(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int16 *)(a2 + 6);
  int v3 = *(_DWORD *)(a1 + 28);
  if (v3) {
    BOOL v4 = v2 == v3;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    printf("e: unexpected block version %d\n");
    return 0;
  }
  uint64_t v5 = a1;
  *(_DWORD *)(a1 + 28) = 3;
  if (*(_DWORD *)(a2 + 8) != 336)
  {
    printf("e: unexpected block size %d\n");
    return 0;
  }
  unint64_t v6 = *(__int16 **)(a1 + 3896);
  __int16 v7 = *v6;
  *(void *)(a1 + 3896) = v6 + 1;
  LODWORD(v6) = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v6 - 2;
  if (v6 < 2) {
    a1 = puts("e: data_sz underflow in get_value");
  }
  uint64_t v8 = 0;
  *(_WORD *)(v5 + 244) = v7;
  memset(v85, 255, sizeof(v85));
  do
  {
    BOOL v9 = *(int **)(v5 + 3896);
    int v10 = *v9;
    *(void *)(v5 + 3896) = v9 + 1;
    LODWORD(v9) = *(_DWORD *)(v5 + 3904);
    *(_DWORD *)(v5 + 3904) = v9 - 4;
    if (v9 < 4) {
      a1 = puts("e: data_sz underflow in get_value");
    }
    *(_DWORD *)&v85[v8] = v10;
    v8 += 4;
  }
  while (v8 != 24);
  if (!*(unsigned char *)(v5 + 2136)) {
    a1 = sub_10000A334(v5, (uint64_t)v85, 6);
  }
  __int16 v11 = *(unsigned __int16 **)(v5 + 3896);
  int v14 = *v11;
  unint64_t v12 = v11 + 1;
  int v13 = v14;
  *(void *)(v5 + 3896) = v12;
  unsigned int v15 = *(_DWORD *)(v5 + 3904);
  BOOL v16 = v15 >= 2;
  unsigned int v17 = v15 - 2;
  *(_DWORD *)(v5 + 3904) = v17;
  if (!v16)
  {
    a1 = puts("e: data_sz underflow in get_value");
    unint64_t v12 = *(unsigned __int16 **)(v5 + 3896);
    unsigned int v17 = *(_DWORD *)(v5 + 3904);
  }
  int v20 = *v12;
  int v18 = v12 + 1;
  int v19 = v20;
  *(void *)(v5 + 3896) = v18;
  BOOL v16 = v17 >= 2;
  unsigned int v21 = v17 - 2;
  *(_DWORD *)(v5 + 3904) = v21;
  if (!v16)
  {
    a1 = puts("e: data_sz underflow in get_value");
    int v18 = *(unsigned __int16 **)(v5 + 3896);
    unsigned int v21 = *(_DWORD *)(v5 + 3904);
  }
  int v24 = *v18;
  unsigned int v22 = v18 + 1;
  int v23 = v24;
  *(void *)(v5 + 3896) = v22;
  BOOL v16 = v21 >= 2;
  unsigned int v25 = v21 - 2;
  *(_DWORD *)(v5 + 3904) = v25;
  if (!v16)
  {
    a1 = puts("e: data_sz underflow in get_value");
    unsigned int v22 = *(unsigned __int16 **)(v5 + 3896);
    unsigned int v25 = *(_DWORD *)(v5 + 3904);
  }
  int v28 = *v22;
  unint64_t v26 = (unsigned int *)(v22 + 1);
  int v27 = v28;
  *(void *)(v5 + 3896) = v26;
  BOOL v16 = v25 >= 2;
  unsigned int v29 = v25 - 2;
  *(_DWORD *)(v5 + 3904) = v29;
  if (!v16)
  {
    a1 = puts("e: data_sz underflow in get_value");
    unint64_t v26 = *(unsigned int **)(v5 + 3896);
    unsigned int v29 = *(_DWORD *)(v5 + 3904);
  }
  unsigned int v30 = *v26;
  *(void *)(v5 + 3896) = v26 + 1;
  *(_DWORD *)(v5 + 3904) = v29 - 4;
  if (v29 < 4) {
    a1 = puts("e: data_sz underflow in get_value");
  }
  int v31 = sub_10000A608(a1, v30);
  if (!v31)
  {
    uint64_t v60 = "e: useless PDC table";
LABEL_69:
    puts(v60);
    return 0;
  }
  int v32 = v31;
  int v33 = (v19 << 16) / 10;
  for (uint64_t i = 260; i != 300; i += 4)
  {
    unint64_t v35 = *(int **)(v5 + 3896);
    int v36 = *v35;
    *(void *)(v5 + 3896) = v35 + 1;
    LODWORD(v35) = *(_DWORD *)(v5 + 3904);
    *(_DWORD *)(v5 + 3904) = v35 - 4;
    if (v35 < 4) {
      puts("e: data_sz underflow in get_value");
    }
    *(_DWORD *)(v5 + i) = v36;
  }
  uint64_t v37 = *(int **)(v5 + 3896);
  int v38 = *v37;
  *(void *)(v5 + 3896) = v37 + 1;
  LODWORD(v37) = *(_DWORD *)(v5 + 3904);
  *(_DWORD *)(v5 + 3904) = v37 - 4;
  if (v37 < 4) {
    puts("e: data_sz underflow in get_value");
  }
  *(_DWORD *)(v5 + 300) = v38;
  for (uint64_t j = 304; j != 320; j += 4)
  {
    uint64_t v40 = *(int **)(v5 + 3896);
    int v41 = *v40;
    *(void *)(v5 + 3896) = v40 + 1;
    LODWORD(v40) = *(_DWORD *)(v5 + 3904);
    *(_DWORD *)(v5 + 3904) = v40 - 4;
    if (v40 < 4) {
      puts("e: data_sz underflow in get_value");
    }
    *(_DWORD *)(v5 + j) = v41;
  }
  for (uint64_t k = 176; k != 210; k += 2)
  {
    unsigned int v43 = *(unsigned __int16 **)(v5 + 3896);
    int v44 = *v43;
    *(void *)(v5 + 3896) = v43 + 1;
    LODWORD(v43) = *(_DWORD *)(v5 + 3904);
    *(_DWORD *)(v5 + 3904) = v43 - 2;
    if (v43 < 2) {
      puts("e: data_sz underflow in get_value");
    }
    if (*(_WORD *)(v5 + k)) {
      BOOL v45 = v44 == *(unsigned __int16 *)(v5 + k);
    }
    else {
      BOOL v45 = 1;
    }
    if (!v45)
    {
      uint64_t v60 = "e: inconsistent DC index";
      goto LABEL_69;
    }
    *(_WORD *)(v5 + k) = v44;
  }
  unsigned int v82 = v33;
  int v46 = v23;
  int v47 = v13;
  *(_WORD *)(v5 + 250) = 17;
  memset(__b, 170, sizeof(__b));
  for (uint64_t m = 0; m != 578; m += 2)
  {
    uint64_t v49 = *(__int16 **)(v5 + 3896);
    __int16 v50 = *v49;
    *(void *)(v5 + 3896) = v49 + 1;
    LODWORD(v49) = *(_DWORD *)(v5 + 3904);
    *(_DWORD *)(v5 + 3904) = v49 - 2;
    if (v49 < 2) {
      puts("e: data_sz underflow in get_value");
    }
    *(_WORD *)&__b[m] = v50;
  }
  for (uint64_t n = 210; n != 244; n += 2)
  {
    unsigned int v52 = *(unsigned __int16 **)(v5 + 3896);
    int v53 = *v52;
    *(void *)(v5 + 3896) = v52 + 1;
    LODWORD(v52) = *(_DWORD *)(v5 + 3904);
    *(_DWORD *)(v5 + 3904) = v52 - 2;
    if (v52 < 2) {
      puts("e: data_sz underflow in get_value");
    }
    if (*(_WORD *)(v5 + n)) {
      BOOL v54 = v53 == *(unsigned __int16 *)(v5 + n);
    }
    else {
      BOOL v54 = 1;
    }
    if (!v54)
    {
      uint64_t v60 = "e: inconsistent PM index";
      goto LABEL_69;
    }
    *(_WORD *)(v5 + n) = v53;
  }
  *(_WORD *)(v5 + 252) = 17;
  memset(v83, 170, sizeof(v83));
  for (iuint64_t i = 0; ii != 578; ii += 2)
  {
    uint64_t v56 = *(__int16 **)(v5 + 3896);
    __int16 v57 = *v56;
    *(void *)(v5 + 3896) = v56 + 1;
    LODWORD(v56) = *(_DWORD *)(v5 + 3904);
    *(_DWORD *)(v5 + 3904) = v56 - 2;
    if (v56 < 2) {
      puts("e: data_sz underflow in get_value");
    }
    *(_WORD *)&v83[ii] = v57;
  }
  uint64_t v58 = *(unsigned __int16 **)(v5 + 3896);
  int v59 = *v58;
  *(void *)(v5 + 3896) = v58 + 1;
  LODWORD(v58) = *(_DWORD *)(v5 + 3904);
  *(_DWORD *)(v5 + 3904) = v58 - 2;
  if (v58 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  if ((v59 - 3) < 0xFFFFFFFE)
  {
    printf("e: illegal frame count %d\n");
    return 0;
  }
  int v62 = v47;
  unsigned int v63 = *(_DWORD **)(v5 + 3896);
  int v66 = *v63;
  unsigned int v64 = (__int16 *)(v63 + 1);
  int v65 = v66;
  *(void *)(v5 + 3896) = v64;
  unsigned int v67 = *(_DWORD *)(v5 + 3904);
  BOOL v16 = v67 >= 4;
  unsigned int v68 = v67 - 4;
  *(_DWORD *)(v5 + 3904) = v68;
  if (!v16)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v64 = *(__int16 **)(v5 + 3896);
    unsigned int v68 = *(_DWORD *)(v5 + 3904);
  }
  __int16 v71 = *v64;
  int v69 = v64 + 1;
  __int16 v70 = v71;
  *(void *)(v5 + 3896) = v69;
  BOOL v16 = v68 >= 2;
  unsigned int v72 = v68 - 2;
  *(_DWORD *)(v5 + 3904) = v72;
  if (!v16)
  {
    puts("e: data_sz underflow in get_value");
    int v69 = *(__int16 **)(v5 + 3896);
    unsigned int v72 = *(_DWORD *)(v5 + 3904);
  }
  *(_WORD *)(v5 + 320) = v70;
  __int16 v73 = *v69;
  *(void *)(v5 + 3896) = v69 + 1;
  *(_DWORD *)(v5 + 3904) = v72 - 2;
  if (v72 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  *(_WORD *)(v5 + 322) = v73;
  uint64_t result = (uint64_t)sub_10000A69C(v5, v2, v62, v82, v27 << 16, v32, v46, v65);
  if (result)
  {
    uint64_t v74 = result;
    if (*(_WORD *)(result + 3508)) {
      BOOL v75 = v59 == *(unsigned __int16 *)(result + 3508);
    }
    else {
      BOOL v75 = 1;
    }
    if (!v75)
    {
      uint64_t v60 = "e: inconsistent nframes value";
      goto LABEL_69;
    }
    uint64_t v76 = 0;
    *(_DWORD *)(result + 20) |= v32;
    char v77 = 1;
    do
    {
      if (v32) {
        *(_WORD *)(result + v76 + 40) = *(_WORD *)&__b[v76];
      }
      if ((v32 & 2) != 0) {
        *(_WORD *)(result + v76 + 618) = *(_WORD *)&__b[v76];
      }
      int v78 = *(unsigned __int16 *)&__b[v76];
      if ((v32 & 4) != 0) {
        *(_WORD *)(result + v76 + 1196) = v78;
      }
      v77 &= v78 == 0;
      v76 += 2;
    }
    while (v76 != 578);
    if (v77)
    {
      printf("e: DCLUT[%d, %d, %d, %d, %d, %d] is all zeros\n");
      return 0;
    }
    uint64_t v79 = 0;
    char v80 = 1;
    do
    {
      if (v32) {
        *(_WORD *)(result + v79 + 1774) = *(_WORD *)&v83[v79];
      }
      if ((v32 & 2) != 0) {
        *(_WORD *)(result + v79 + 2352) = *(_WORD *)&v83[v79];
      }
      int v81 = *(unsigned __int16 *)&v83[v79];
      if ((v32 & 4) != 0) {
        *(_WORD *)(result + v79 + 2930) = v81;
      }
      v80 &= v81 == 0;
      v79 += 2;
    }
    while (v79 != 578);
    if (v80)
    {
      printf("e: PMLUT[%d, %d, %d, %d, %d, %d] is all zeros\n");
      return 0;
    }
    *(_WORD *)(result + 3508) = v59;
    uint64_t result = sub_100014B50(v5, *(_DWORD *)(result + 8), (int *)(v5 + 36), (_WORD *)(v5 + 246));
    if (result)
    {
      uint64_t result = sub_100014B50(v5, *(_DWORD *)(v74 + 16), (int *)(v5 + 76), (_WORD *)(v5 + 248));
      if (result)
      {
        uint64_t result = sub_100014BFC(v5, *(unsigned __int16 *)(v74 + 12), (_WORD *)(v5 + 116), (_WORD *)(v5 + 254));
        if (result) {
          return sub_100014CB0(v5, *(_DWORD *)(v74 + 24), (unsigned int *)(v5 + 136), (_WORD *)(v5 + 256));
        }
      }
    }
  }
  return result;
}

uint64_t sub_1000139D8(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int16 *)(a2 + 6);
  int v3 = *(_DWORD *)(a1 + 28);
  if (v3) {
    BOOL v4 = v2 == v3;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    printf("e: unexpected block version %d\n");
    return 0;
  }
  uint64_t v5 = a1;
  *(_DWORD *)(a1 + 28) = 4;
  if (*(_DWORD *)(a2 + 8) != 219)
  {
    printf("e: unexpected block size %d\n");
    return 0;
  }
  unint64_t v6 = *(__int16 **)(a1 + 3896);
  __int16 v7 = *v6;
  *(void *)(a1 + 3896) = v6 + 1;
  LODWORD(v6) = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v6 - 2;
  if (v6 < 2) {
    a1 = puts("e: data_sz underflow in get_value");
  }
  uint64_t v8 = 0;
  *(_WORD *)(v5 + 348) = v7;
  memset(v74, 255, sizeof(v74));
  do
  {
    BOOL v9 = *(int **)(v5 + 3896);
    int v10 = *v9;
    *(void *)(v5 + 3896) = v9 + 1;
    LODWORD(v9) = *(_DWORD *)(v5 + 3904);
    *(_DWORD *)(v5 + 3904) = v9 - 4;
    if (v9 < 4) {
      a1 = puts("e: data_sz underflow in get_value");
    }
    *(_DWORD *)((char *)v74 + v8) = v10;
    v8 += 4;
  }
  while (v8 != 24);
  if (!*(unsigned char *)(v5 + 2136)) {
    a1 = sub_10000A334(v5, (uint64_t)v74, 6);
  }
  __int16 v11 = *(unsigned __int16 **)(v5 + 3896);
  int v14 = *v11;
  unint64_t v12 = v11 + 1;
  int v13 = v14;
  *(void *)(v5 + 3896) = v12;
  unsigned int v15 = *(_DWORD *)(v5 + 3904);
  BOOL v16 = v15 >= 2;
  unsigned int v17 = v15 - 2;
  *(_DWORD *)(v5 + 3904) = v17;
  if (!v16)
  {
    a1 = puts("e: data_sz underflow in get_value");
    unint64_t v12 = *(unsigned __int16 **)(v5 + 3896);
    unsigned int v17 = *(_DWORD *)(v5 + 3904);
  }
  int v20 = *v12;
  int v18 = v12 + 1;
  int v19 = v20;
  *(void *)(v5 + 3896) = v18;
  BOOL v16 = v17 >= 2;
  unsigned int v21 = v17 - 2;
  *(_DWORD *)(v5 + 3904) = v21;
  if (!v16)
  {
    a1 = puts("e: data_sz underflow in get_value");
    int v18 = *(unsigned __int16 **)(v5 + 3896);
    unsigned int v21 = *(_DWORD *)(v5 + 3904);
  }
  int v24 = *v18;
  unsigned int v22 = v18 + 1;
  int v23 = v24;
  *(void *)(v5 + 3896) = v22;
  BOOL v16 = v21 >= 2;
  unsigned int v25 = v21 - 2;
  *(_DWORD *)(v5 + 3904) = v25;
  if (!v16)
  {
    a1 = puts("e: data_sz underflow in get_value");
    unsigned int v22 = *(unsigned __int16 **)(v5 + 3896);
    unsigned int v25 = *(_DWORD *)(v5 + 3904);
  }
  int v28 = *v22;
  unint64_t v26 = (unsigned int *)(v22 + 1);
  int v27 = v28;
  *(void *)(v5 + 3896) = v26;
  BOOL v16 = v25 >= 2;
  unsigned int v29 = v25 - 2;
  *(_DWORD *)(v5 + 3904) = v29;
  if (!v16)
  {
    a1 = puts("e: data_sz underflow in get_value");
    unint64_t v26 = *(unsigned int **)(v5 + 3896);
    unsigned int v29 = *(_DWORD *)(v5 + 3904);
  }
  unsigned int v30 = *v26;
  *(void *)(v5 + 3896) = v26 + 1;
  *(_DWORD *)(v5 + 3904) = v29 - 4;
  if (v29 < 4) {
    a1 = puts("e: data_sz underflow in get_value");
  }
  int v31 = sub_10000A608(a1, v30);
  if (!v31)
  {
    unsigned int v61 = "e: channel not specified";
    goto LABEL_76;
  }
  int v32 = v31;
  int v73 = v13;
  unsigned int v72 = (v19 << 16) / 10;
  int v33 = 6;
  do
  {
    *(void *)(v5 + 3896) += 4;
    unsigned int v34 = *(_DWORD *)(v5 + 3904);
    *(_DWORD *)(v5 + 3904) = v34 - 4;
    if (v34 < 4) {
      puts("e: data_sz underflow in get_value");
    }
    --v33;
  }
  while (v33);
  *(void *)(v5 + 3896) += 4;
  unsigned int v35 = *(_DWORD *)(v5 + 3904);
  *(_DWORD *)(v5 + 3904) = v35 - 4;
  if (v35 < 4) {
    puts("e: data_sz underflow in get_value");
  }
  int v36 = 6;
  do
  {
    uint64_t v37 = *(int **)(v5 + 3896);
    int v38 = *v37;
    *(void *)(v5 + 3896) = v37 + 1;
    LODWORD(v37) = *(_DWORD *)(v5 + 3904);
    *(_DWORD *)(v5 + 3904) = v37 - 4;
    if (v37 < 4) {
      puts("e: data_sz underflow in get_value");
    }
    --v36;
  }
  while (v36);
  unsigned int v39 = *(int **)(v5 + 3896);
  int v40 = *v39;
  *(void *)(v5 + 3896) = v39 + 1;
  LODWORD(v39) = *(_DWORD *)(v5 + 3904);
  *(_DWORD *)(v5 + 3904) = v39 - 4;
  if (v39 < 4) {
    puts("e: data_sz underflow in get_value");
  }
  BOOL v41 = v40 == 538988366;
  if (v38 == 1 && v40 != 538988366) {
    return 1;
  }
  for (uint64_t i = 0; i != 22; i += 2)
  {
    int v44 = *(__int16 **)(v5 + 3896);
    __int16 v47 = *v44;
    BOOL v45 = v44 + 1;
    __int16 v46 = v47;
    *(void *)(v5 + 3896) = v45;
    unsigned int v48 = *(_DWORD *)(v5 + 3904);
    BOOL v16 = v48 >= 2;
    unsigned int v49 = v48 - 2;
    *(_DWORD *)(v5 + 3904) = v49;
    if (!v16)
    {
      puts("e: data_sz underflow in get_value");
      BOOL v45 = *(__int16 **)(v5 + 3896);
      unsigned int v49 = *(_DWORD *)(v5 + 3904);
    }
    *(_WORD *)(v5 + i + 196) = v46;
    __int16 v50 = *v45;
    *(void *)(v5 + 3896) = v45 + 1;
    *(_DWORD *)(v5 + 3904) = v49 - 2;
    if (v49 < 2) {
      puts("e: data_sz underflow in get_value");
    }
    *(_WORD *)(v5 + i + 236) = v50;
  }
  uint64_t result = (uint64_t)sub_10000A69C(v5, v2, v73, v72, v27 << 16, v32, v23, v41);
  if (result)
  {
    uint64_t v51 = result;
    *(_DWORD *)(result + 20) |= v32;
    for (uint64_t j = 280; j != 314; j += 2)
    {
      int v53 = *(unsigned __int16 **)(v5 + 3896);
      int v54 = *v53;
      *(void *)(v5 + 3896) = v53 + 1;
      LODWORD(v53) = *(_DWORD *)(v5 + 3904);
      *(_DWORD *)(v5 + 3904) = v53 - 2;
      if (v53 < 2) {
        puts("e: data_sz underflow in get_value");
      }
      if (*(_WORD *)(v5 + j)) {
        BOOL v55 = v54 == *(unsigned __int16 *)(v5 + j);
      }
      else {
        BOOL v55 = 1;
      }
      if (!v55)
      {
        unsigned int v61 = "e: inconsistent DC index";
        goto LABEL_76;
      }
      *(_WORD *)(v5 + j) = v54;
    }
    uint64_t v56 = 0;
    *(_WORD *)(v5 + 354) = 17;
    char v57 = 1;
    while (1)
    {
      uint64_t v58 = *(unsigned __int16 **)(v5 + 3896);
      int v59 = *v58;
      *(void *)(v5 + 3896) = v58 + 1;
      LODWORD(v58) = *(_DWORD *)(v5 + 3904);
      *(_DWORD *)(v5 + 3904) = v58 - 2;
      if (v58 >= 2)
      {
        if (v32)
        {
LABEL_62:
          *(_WORD *)(v51 + v56 + 40) = v59;
          if ((v32 & 2) != 0) {
            goto LABEL_63;
          }
          goto LABEL_67;
        }
      }
      else
      {
        puts("e: data_sz underflow in get_value");
        if (v32) {
          goto LABEL_62;
        }
      }
      if ((v32 & 2) != 0)
      {
LABEL_63:
        *(_WORD *)(v51 + v56 + 618) = v59;
        if ((v32 & 4) == 0) {
          goto LABEL_69;
        }
LABEL_68:
        *(_WORD *)(v51 + v56 + 1196) = v59;
        goto LABEL_69;
      }
LABEL_67:
      if ((v32 & 4) != 0) {
        goto LABEL_68;
      }
LABEL_69:
      v57 &= v59 == 0;
      v56 += 2;
      if (v56 == 578)
      {
        if (v57)
        {
          printf("e: DCLUT[%d, %d, %d, %d, %d, %d] is all zeros\n");
          return 0;
        }
        for (uint64_t k = 314; k != 348; k += 2)
        {
          unsigned int v63 = *(unsigned __int16 **)(v5 + 3896);
          int v64 = *v63;
          *(void *)(v5 + 3896) = v63 + 1;
          LODWORD(v63) = *(_DWORD *)(v5 + 3904);
          *(_DWORD *)(v5 + 3904) = v63 - 2;
          if (v63 < 2) {
            puts("e: data_sz underflow in get_value");
          }
          if (*(_WORD *)(v5 + k)) {
            BOOL v65 = v64 == *(unsigned __int16 *)(v5 + k);
          }
          else {
            BOOL v65 = 1;
          }
          if (!v65)
          {
            unsigned int v61 = "e: inconsistent PM index";
            goto LABEL_76;
          }
          *(_WORD *)(v5 + k) = v64;
        }
        uint64_t v66 = 0;
        *(_WORD *)(v5 + 356) = 17;
        char v67 = 1;
        while (1)
        {
          unsigned int v68 = *(unsigned __int16 **)(v5 + 3896);
          int v69 = *v68;
          *(void *)(v5 + 3896) = v68 + 1;
          LODWORD(v68) = *(_DWORD *)(v5 + 3904);
          *(_DWORD *)(v5 + 3904) = v68 - 2;
          if (v68 >= 2)
          {
            if (v32)
            {
LABEL_89:
              *(_WORD *)(v51 + v66 + 1774) = v69;
              if ((v32 & 2) != 0) {
                goto LABEL_90;
              }
              goto LABEL_94;
            }
          }
          else
          {
            puts("e: data_sz underflow in get_value");
            if (v32) {
              goto LABEL_89;
            }
          }
          if ((v32 & 2) != 0)
          {
LABEL_90:
            *(_WORD *)(v51 + v66 + 1842) = v69;
            if ((v32 & 4) == 0) {
              goto LABEL_96;
            }
LABEL_95:
            *(_WORD *)(v51 + v66 + 1910) = v69;
            goto LABEL_96;
          }
LABEL_94:
          if ((v32 & 4) != 0) {
            goto LABEL_95;
          }
LABEL_96:
          v67 &= v69 == 0;
          v66 += 2;
          if (v66 == 68)
          {
            if (v67)
            {
              printf("e: PMLUT[%d, %d, %d, %d, %d, %d] is all zeros\n");
              return 0;
            }
            __int16 v70 = *(unsigned __int16 **)(v5 + 3896);
            int v71 = *v70;
            *(void *)(v5 + 3896) = v70 + 1;
            LODWORD(v70) = *(_DWORD *)(v5 + 3904);
            *(_DWORD *)(v5 + 3904) = v70 - 2;
            if (v70 < 2) {
              puts("e: data_sz underflow in get_value");
            }
            if ((v71 - 3) <= 0xFFFFFFFD)
            {
              printf("e: illegal frame count %d\n");
              return 0;
            }
            if (!*(_WORD *)(v51 + 1978) || v71 == *(unsigned __int16 *)(v51 + 1978))
            {
              *(_WORD *)(v51 + 1978) = v71;
              uint64_t result = sub_100014D5C(v5, *(_DWORD *)(v51 + 8), (int *)(v5 + 36), (_WORD *)(v5 + 350));
              if (result)
              {
                uint64_t result = sub_100014D5C(v5, *(_DWORD *)(v51 + 16), (int *)(v5 + 116), (_WORD *)(v5 + 352));
                if (result)
                {
                  uint64_t result = sub_100014E08(v5, *(unsigned __int16 *)(v51 + 12), (_WORD *)(v5 + 2148), (_WORD *)(v5 + 358));
                  if (result) {
                    return sub_100014EBC(v5, *(unsigned __int16 *)(v51 + 24), (_WORD *)(v5 + 276), (_WORD *)(v5 + 360));
                  }
                }
              }
              return result;
            }
            unsigned int v61 = "e: inconsistent nframes value";
LABEL_76:
            puts(v61);
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_1000140AC(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int16 *)(a2 + 6);
  int v3 = *(_DWORD *)(a1 + 28);
  if (v3) {
    BOOL v4 = v2 == v3;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    printf("e: unexpected block version %d\n");
    return 0;
  }
  *(_DWORD *)(a1 + 28) = 5;
  *(void *)&long long v5 = -1;
  *((void *)&v5 + 1) = -1;
  v83[3] = v5;
  v83[4] = v5;
  v83[1] = v5;
  v83[2] = v5;
  v82[4] = v5;
  v83[0] = v5;
  v82[2] = v5;
  v82[3] = v5;
  v82[0] = v5;
  v82[1] = v5;
  unsigned int v6 = *(_DWORD *)(a1 + 3904);
  unsigned int v7 = v6 - 4;
  if (v6 < 4) {
    return 0;
  }
  uint64_t v8 = *(_WORD **)(a1 + 3896);
  *(void *)(a1 + 3896) = v8 + 2;
  *(_DWORD *)(a1 + 3904) = v7;
  if (v7 < 2) {
    return 0;
  }
  *(_WORD *)(a1 + 412) = v8[2];
  *(void *)(a1 + 3896) = v8 + 3;
  *(_DWORD *)(a1 + 3904) = v6 - 6;
  if (v6 - 6 < 2) {
    return 0;
  }
  *(_WORD *)(a1 + 2188) = v8[3];
  *(void *)(a1 + 3896) = v8 + 4;
  *(_DWORD *)(a1 + 3904) = v6 - 8;
  if (v6 - 8 < 2) {
    return 0;
  }
  *(_WORD *)(a1 + 2190) = v8[4];
  *(void *)(a1 + 3896) = v8 + 5;
  *(_DWORD *)(a1 + 3904) = v6 - 10;
  if (v6 - 10 < 2) {
    return 0;
  }
  int v9 = (unsigned __int16)v8[5];
  *(_WORD *)(a1 + 2194) = v9;
  *(void *)(a1 + 3896) = v8 + 6;
  *(_DWORD *)(a1 + 3904) = v6 - 12;
  if (v6 - 12 < 2) {
    return 0;
  }
  *(_WORD *)(a1 + 2192) = v8[6];
  *(void *)(a1 + 3896) = v8 + 7;
  *(_DWORD *)(a1 + 3904) = v6 - 14;
  if (v6 - 14 < 2) {
    return 0;
  }
  __int16 v10 = v8[7];
  *(void *)(a1 + 3896) = v8 + 8;
  *(_DWORD *)(a1 + 3904) = v6 - 16;
  unsigned __int16 v11 = v10 + 1;
  *(_WORD *)(a1 + 2198) = v11;
  if (v6 - 16 < 2) {
    return 0;
  }
  *(_WORD *)(a1 + 2196) = v8[8];
  unint64_t v12 = (float *)(v8 + 9);
  *(void *)(a1 + 3896) = v8 + 9;
  unsigned int v13 = v6 - 18;
  *(_DWORD *)(a1 + 3904) = v6 - 18;
  if (v9 != 3)
  {
    unsigned int v29 = "e: unsupported number of color channels";
    goto LABEL_40;
  }
  if (v11 > 0x14u) {
    return 0;
  }
  unint64_t v14 = 4 * v11;
  if (v14 > v13) {
    return 0;
  }
  if (v11)
  {
    unint64_t v15 = 0;
    unint64_t v16 = 0;
    LODWORD(v17) = v6 - 22;
    uint64_t v18 = v17 & 0xFFFFFFFC;
    int v19 = v8 + 9;
    do
    {
      *(float *)((char *)v83 + v15) = v12[v15 / 4];
      v19 += 2;
      *(_DWORD *)(a1 + 3904) = v17;
      ++v16;
      unint64_t v17 = (v17 - 4);
      unint64_t v20 = v15 + 4;
      if (v14 - 4 == v15) {
        break;
      }
      BOOL v4 = v18 == v15;
      v15 += 4;
    }
    while (!v4);
    uint64_t v21 = 0;
    *(void *)(a1 + 3896) = (char *)v12 + v20;
    if (v16 < v11 || v14 > v13 - v20 || v13 - v20 < 4) {
      return v21;
    }
    unint64_t v22 = 0;
    uint64_t v23 = 0;
    unint64_t v24 = v17 >> 2;
    do
    {
      *((_DWORD *)v82 + v23) = *(_DWORD *)&v19[2 * v23];
      *(_DWORD *)(a1 + 3904) = v17;
      unint64_t v25 = v23 + 1;
      v22 -= 4;
      LODWORD(v17) = v17 - 4;
      if (v11 - 1 == v23) {
        break;
      }
      BOOL v4 = v24 == v23++;
    }
    while (!v4);
    unint64_t v12 = (float *)&v19[v22 / 0xFFFFFFFFFFFFFFFELL];
    *(void *)(a1 + 3896) = v12;
    if (v25 < v11) {
      return 0;
    }
    unsigned int v13 = v17 + 4;
  }
  unsigned int v26 = v13 - 4;
  if (v13 < 4) {
    return 0;
  }
  float v27 = *v12;
  *(void *)(a1 + 3896) = v12 + 1;
  *(_DWORD *)(a1 + 3904) = v26;
  if (v27 < 0.0 || v27 > 1.0)
  {
    unsigned int v29 = "e: bin mix factor must be between 0 and 1";
    goto LABEL_40;
  }
  if (!*(unsigned char *)(a1 + 2136))
  {
    uint64_t v31 = a1;
    sub_10000A40C(a1, (uint64_t)v83, (uint64_t)v82, v11, v27);
    a1 = v31;
    unsigned int v26 = *(_DWORD *)(v31 + 3904);
  }
  unsigned int v32 = v26 - 2;
  if (v26 < 2) {
    return 0;
  }
  int v33 = *(unsigned __int16 **)(a1 + 3896);
  unsigned int v34 = *v33;
  *(_WORD *)(a1 + 418) = *v33;
  *(void *)(a1 + 3896) = v33 + 1;
  *(_DWORD *)(a1 + 3904) = v32;
  if (v32 < 2) {
    return 0;
  }
  unsigned int v35 = v33[1];
  *(_WORD *)(a1 + 420) = v35;
  *(void *)(a1 + 3896) = v33 + 2;
  *(_DWORD *)(a1 + 3904) = v26 - 4;
  if (v34 > 0x18 || v35 >= 0x19)
  {
    unsigned int v29 = "e: DC or PM LUT size too big";
    goto LABEL_40;
  }
  if (v26 - 4 < 2) {
    return 0;
  }
  uint64_t v36 = a1;
  int v37 = v33[2];
  *(void *)(a1 + 3896) = v33 + 3;
  *(_DWORD *)(a1 + 3904) = v26 - 6;
  if (v26 - 6 < 2) {
    return 0;
  }
  int v38 = v33[3];
  *(void *)(a1 + 3896) = v33 + 4;
  *(_DWORD *)(a1 + 3904) = v26 - 8;
  if (v26 - 8 < 2) {
    return 0;
  }
  int v39 = v33[4];
  *(void *)(a1 + 3896) = v33 + 5;
  *(_DWORD *)(a1 + 3904) = v26 - 10;
  if (v26 - 10 < 2) {
    return 0;
  }
  int v40 = v33[5];
  *(void *)(a1 + 3896) = v33 + 6;
  *(_DWORD *)(a1 + 3904) = v26 - 12;
  if (v26 - 12 < 4) {
    return 0;
  }
  unsigned int v41 = *((_DWORD *)v33 + 3);
  *(void *)(a1 + 3896) = v33 + 8;
  *(_DWORD *)(a1 + 3904) = v26 - 16;
  int v42 = sub_10000A608(a1, v41);
  if (!v42)
  {
    unsigned int v29 = "e: channel not specified";
    goto LABEL_40;
  }
  unsigned int v43 = *(_DWORD *)(v36 + 3904);
  BOOL v44 = v43 >= 4;
  unsigned int v45 = v43 - 4;
  if (!v44) {
    return 0;
  }
  int v46 = v42;
  __int16 v47 = *(int **)(v36 + 3896);
  int v48 = *v47;
  *(void *)(v36 + 3896) = v47 + 1;
  *(_DWORD *)(v36 + 3904) = v45;
  unsigned int v49 = sub_10000A69C(v36, v2, v37, (v38 << 16) / 10, v40 << 16, v42, v39, v48 == 538988366);
  if (!v49) {
    return 0;
  }
  __int16 v50 = v49;
  v49[5] |= v46;
  if (*(_WORD *)(v36 + 418))
  {
    unint64_t v51 = 0;
    unsigned int v52 = *(_DWORD *)(v36 + 3904);
    uint64_t v53 = v36 + 316;
    while (1)
    {
      BOOL v44 = v52 >= 2;
      v52 -= 2;
      if (!v44) {
        return 0;
      }
      int v54 = *(unsigned __int16 **)(v36 + 3896);
      int v55 = *v54;
      *(void *)(v36 + 3896) = v54 + 1;
      *(_DWORD *)(v36 + 3904) = v52;
      if (*(_WORD *)(v53 + 2 * v51) && *(unsigned __int16 *)(v53 + 2 * v51) != v55) {
        break;
      }
      *(_WORD *)(v53 + 2 * v51++) = v55;
      unint64_t v57 = *(unsigned __int16 *)(v36 + 418);
      if (v51 >= v57) {
        goto LABEL_70;
      }
    }
    unsigned int v29 = "e: inconsistent DC index";
LABEL_40:
    puts(v29);
    return 0;
  }
  LODWORD(v57) = 0;
LABEL_70:
  unsigned int v58 = v57 * v57;
  int v81 = *(unsigned __int16 *)(v36 + 420);
  unsigned int v59 = v81 * v81;
  uint64_t v60 = (_WORD *)*((void *)v49 + 6);
  if (!v60)
  {
    size_t v61 = ((6 * (v59 + v58)) & 0xFFFFC000) + ((((6 * (v59 + v58)) & 0x3FFE) != 0) << 14);
    v50[10] = v61;
    uint64_t v60 = malloc_type_aligned_alloc(0x4000uLL, v61, 0x388B8837uLL);
    *((void *)v50 + 6) = v60;
    if (!v60)
    {
      unsigned int v29 = "e: no memory for LUTs";
      goto LABEL_40;
    }
  }
  if (!v57) {
    goto LABEL_89;
  }
  int v62 = &v60[3 * v58];
  unsigned int v63 = 2 * v58;
  unsigned int v64 = *(_DWORD *)(v36 + 3904);
  if (v58 <= 1) {
    uint64_t v65 = 1;
  }
  else {
    uint64_t v65 = v58;
  }
  char v66 = 1;
  char v67 = v60;
  do
  {
    BOOL v44 = v64 >= 2;
    v64 -= 2;
    if (!v44) {
      return 0;
    }
    unsigned int v68 = *(unsigned __int16 **)(v36 + 3896);
    int v69 = *v68;
    *(void *)(v36 + 3896) = v68 + 1;
    *(_DWORD *)(v36 + 3904) = v64;
    if (v46)
    {
      _WORD *v67 = v69;
      if ((v46 & 2) == 0)
      {
LABEL_81:
        if ((v46 & 4) == 0) {
          goto LABEL_83;
        }
LABEL_82:
        v60[v63] = v69;
        goto LABEL_83;
      }
    }
    else if ((v46 & 2) == 0)
    {
      goto LABEL_81;
    }
    v60[v58] = v69;
    if ((v46 & 4) != 0) {
      goto LABEL_82;
    }
LABEL_83:
    v66 &= v69 == 0;
    ++v63;
    ++v58;
    ++v67;
    --v65;
  }
  while (v65);
  if (v66)
  {
LABEL_89:
    printf("e: DCLUT[%d, %d, %d, %d, %d, %d] is all zeros\n");
    return 0;
  }
  if (!*(_WORD *)(v36 + 420)) {
    goto LABEL_102;
  }
  unint64_t v70 = 0;
  unint64_t v71 = 0;
  uint64_t v72 = v36 + 364;
  while (2)
  {
    BOOL v44 = v64 >= 2;
    v64 -= 2;
    if (!v44) {
      return 0;
    }
    int v73 = v68[v70 / 2 + 1];
    *(void *)(v36 + 3896) = &v68[v70 / 2 + 2];
    *(_DWORD *)(v36 + 3904) = v64;
    if (*(_WORD *)(v72 + v70)) {
      BOOL v74 = *(unsigned __int16 *)(v72 + v70) == v73;
    }
    else {
      BOOL v74 = 1;
    }
    if (!v74)
    {
      unsigned int v29 = "e: inconsistent PM index";
      goto LABEL_40;
    }
    *(_WORD *)(v72 + v70) = v73;
    ++v71;
    v70 += 2;
    if (v71 < *(unsigned __int16 *)(v36 + 420)) {
      continue;
    }
    break;
  }
  unsigned int v68 = (unsigned __int16 *)((char *)v68 + v70);
LABEL_102:
  BOOL v75 = v68 + 1;
  if (v81)
  {
    unsigned int v76 = 2 * v59;
    if (v59 <= 1) {
      uint64_t v77 = 1;
    }
    else {
      uint64_t v77 = v59;
    }
    int v78 = v75 + 1;
    LOBYTE(v75) = 1;
    uint64_t v79 = v62;
    while (1)
    {
      BOOL v44 = v64 >= 2;
      v64 -= 2;
      if (!v44) {
        return 0;
      }
      int v80 = *(v78 - 1);
      *(void *)(v36 + 3896) = v78;
      *(_DWORD *)(v36 + 3904) = v64;
      if (v46)
      {
        *uint64_t v79 = v80;
        if ((v46 & 2) != 0)
        {
LABEL_116:
          v62[v59] = v80;
          if ((v46 & 4) == 0) {
            goto LABEL_113;
          }
LABEL_112:
          v62[v76] = v80;
          goto LABEL_113;
        }
      }
      else if ((v46 & 2) != 0)
      {
        goto LABEL_116;
      }
      if ((v46 & 4) != 0) {
        goto LABEL_112;
      }
LABEL_113:
      LODWORD(v75) = (v80 == 0) & v75;
      ++v78;
      ++v76;
      ++v59;
      ++v79;
      if (!--v77)
      {
        if (v75) {
          break;
        }
        if (sub_100014D5C(v36, v50[2], (int *)(v36 + 36), (_WORD *)(v36 + 414))
          && sub_100014D5C(v36, v50[4], (int *)(v36 + 116), (_WORD *)(v36 + 416))
          && sub_100014E08(v36, *((unsigned __int16 *)v50 + 6), (_WORD *)(v36 + 196), (_WORD *)(v36 + 422)))
        {
          return sub_100014E08(v36, *((unsigned __int16 *)v50 + 12), (_WORD *)(v36 + 276), (_WORD *)(v36 + 426));
        }
        return 0;
      }
    }
  }
  printf("e: PMLUT[%d, %d, %d, %d, %d, %d] is all zeros\n");
  return 0;
}

BOOL sub_100014854(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 28);
  if (v2) {
    BOOL v3 = *(unsigned __int16 *)(a2 + 6) == v2;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    *(_DWORD *)(a1 + 28) = 5;
    unsigned int v5 = *(_DWORD *)(a1 + 3904);
    BOOL v6 = v5 >= 2;
    unsigned int v7 = v5 - 2;
    if (v6)
    {
      uint64_t v8 = *(unsigned __int16 **)(a1 + 3896);
      int v9 = *v8;
      *(void *)(a1 + 3896) = v8 + 1;
      *(_DWORD *)(a1 + 3904) = v7;
      printf("i: PDC params version %d\n", v9);
      unsigned int v10 = *(_DWORD *)(a1 + 3904);
      unsigned int v11 = v10 - 2;
      if (v10 >= 2)
      {
        unint64_t v12 = *(unsigned __int16 **)(a1 + 3896);
        int v13 = *v12;
        *(void *)(a1 + 3896) = v12 + 1;
        *(_DWORD *)(a1 + 3904) = v11;
        if (v11 >= 2)
        {
          int v14 = v12[1];
          *(void *)(a1 + 3896) = v12 + 2;
          *(_DWORD *)(a1 + 3904) = v10 - 4;
          if (v10 - 4 >= 2)
          {
            unint64_t v15 = v12[2];
            *(_WORD *)(a1 + 424) = v15;
            *(void *)(a1 + 3896) = v12 + 3;
            *(_DWORD *)(a1 + 3904) = v10 - 6;
            if ((v15 - 1) <= 0x13)
            {
              BOOL result = sub_100013198(a1, a1 + 436, v15);
              if (!result) {
                return result;
              }
              if (*(_DWORD *)(a1 + 436) == v13
                && (uint64_t v17 = *(unsigned __int16 *)(a1 + 424), *(_DWORD *)(a1 + 4 * v17 + 432) == v14))
              {
                unsigned int v18 = *(_DWORD *)(a1 + 3904);
                unsigned int v19 = v18 - 2;
                if (v18 >= 2)
                {
                  unint64_t v20 = *(_WORD **)(a1 + 3896);
                  *(_WORD *)(a1 + 428) = *v20;
                  *(void *)(a1 + 3896) = v20 + 1;
                  *(_DWORD *)(a1 + 3904) = v19;
                  if (v19 >= 2)
                  {
                    *(_WORD *)(a1 + 430) = v20[1];
                    *(void *)(a1 + 3896) = v20 + 2;
                    *(_DWORD *)(a1 + 3904) = v18 - 4;
                    if (v18 - 4 >= 2)
                    {
                      *(_WORD *)(a1 + 2116) = v20[2];
                      *(void *)(a1 + 3896) = v20 + 3;
                      *(_DWORD *)(a1 + 3904) = v18 - 6;
                      if (v18 - 6 >= 2)
                      {
                        *(_WORD *)(a1 + 432) = v20[3];
                        *(void *)(a1 + 3896) = v20 + 4;
                        *(_DWORD *)(a1 + 3904) = v18 - 8;
                        if (v18 - 8 >= 2)
                        {
                          *(_WORD *)(a1 + 434) = v20[4];
                          *(void *)(a1 + 3896) = v20 + 5;
                          *(_DWORD *)(a1 + 3904) = v18 - 10;
                          BOOL result = sub_100013198(a1, a1 + 516, (v17 * v17));
                          if (!result) {
                            return result;
                          }
                          unsigned int v21 = *(_DWORD *)(a1 + 3904);
                          unsigned int v22 = v21 - 2;
                          if (v21 >= 2)
                          {
                            uint64_t v23 = *(_WORD **)(a1 + 3896);
                            *(_WORD *)(a1 + 2118) = *v23;
                            *(void *)(a1 + 3896) = v23 + 1;
                            *(_DWORD *)(a1 + 3904) = v22;
                            if (v22 >= 2)
                            {
                              uint64_t v24 = (unsigned __int16)v23[1];
                              unint64_t v25 = v23 + 2;
                              *(void *)(a1 + 3896) = v25;
                              unsigned int v26 = v21 - 4;
                              *(_DWORD *)(a1 + 3904) = v26;
                              if (v24 >= *(unsigned __int16 *)(a1 + 424))
                              {
                                if (v24 <= 0x14)
                                {
                                  char v27 = 1;
                                  do
                                  {
                                    char v28 = v27;
                                    if (v24)
                                    {
                                      uint64_t v29 = v24;
                                      unsigned int v30 = (_WORD *)(a1 + 236);
                                      do
                                      {
                                        if (v28)
                                        {
                                          if (v26 < 2) {
                                            return 0;
                                          }
                                        }
                                        else
                                        {
                                          if (v26 < 2) {
                                            return 0;
                                          }
                                          *unsigned int v30 = *v25;
                                        }
                                        *(void *)(a1 + 3896) = ++v25;
                                        v26 -= 2;
                                        *(_DWORD *)(a1 + 3904) = v26;
                                        ++v30;
                                        --v29;
                                      }
                                      while (v29);
                                    }
                                    char v27 = 0;
                                  }
                                  while ((v28 & 1) != 0);
                                  unsigned int v31 = v26 - 2;
                                  if (v26 >= 2)
                                  {
                                    int v32 = *v25;
                                    *(_DWORD *)(a1 + 2120) = v32;
                                    *(void *)(a1 + 3896) = v25 + 1;
                                    *(_DWORD *)(a1 + 3904) = v31;
                                    if (v31 >= 2)
                                    {
                                      int v33 = v25[1];
                                      *(void *)(a1 + 3896) = v25 + 2;
                                      *(_DWORD *)(a1 + 3904) = v26 - 4;
                                      *(_DWORD *)(a1 + 2120) = v32 << 16;
                                      *(_DWORD *)(a1 + 2124) = v33 << 16;
                                      return 1;
                                    }
                                  }
                                }
                              }
                              else
                              {
                                printf("e: frame repeat LUT incomplete, only %d/%d provided\n");
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
              else
              {
                printf("e: provided min or max durations (%d, %d) invalid\n");
              }
            }
          }
        }
      }
    }
  }
  else
  {
    printf("e: unexpected block version %d\n");
  }
  return 0;
}

uint64_t sub_100014B50(uint64_t a1, int a2, int *a3, _WORD *a4)
{
  unint64_t v4 = (unsigned __int16)*a4;
  if (v4 <= 0xA)
  {
    if (*a4)
    {
      uint64_t v6 = (unsigned __int16)*a4;
      unsigned int v7 = a3;
      int v8 = a2;
      while (1)
      {
        int v9 = *v7;
        if (*v7 == a2) {
          return 1;
        }
        BOOL v10 = v9 <= a2 && v8 == a2;
        int v11 = a2;
        if (!v10)
        {
          *unsigned int v7 = v8;
          int v11 = v9;
        }
        ++v7;
        int v8 = v11;
        if (!--v6)
        {
          if (v4 == 10) {
            goto LABEL_2;
          }
          if (v11 > a3[v4 - 1])
          {
            *a4 = v4 + 1;
            a3[v4] = v11;
          }
          return 1;
        }
      }
    }
    else
    {
      uint64_t result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_100014BFC(uint64_t a1, unsigned int a2, _WORD *a3, _WORD *a4)
{
  unsigned int v4 = (unsigned __int16)*a4;
  if (v4 <= 0xA)
  {
    if (*a4)
    {
      unint64_t v6 = 0;
      unsigned int v7 = a2;
      while (1)
      {
        unsigned int v8 = (unsigned __int16)a3[v6];
        if (v8 == a2) {
          return 1;
        }
        BOOL v9 = v8 <= a2 && v7 == a2;
        unsigned int v10 = a2;
        if (!v9)
        {
          a3[v6] = v7;
          LOWORD(v4) = *a4;
          unsigned int v10 = v8;
        }
        ++v6;
        unsigned int v7 = v10;
        if (v6 >= (unsigned __int16)v4)
        {
          if ((unsigned __int16)v4 == 10) {
            goto LABEL_2;
          }
          if (v10 > (unsigned __int16)a3[(unsigned __int16)v4 - 1])
          {
            *a4 = v4 + 1;
            a3[(unsigned __int16)v4] = v10;
          }
          return 1;
        }
      }
    }
    else
    {
      uint64_t result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_100014CB0(uint64_t a1, unsigned int a2, unsigned int *a3, _WORD *a4)
{
  unint64_t v4 = (unsigned __int16)*a4;
  if (v4 <= 0xA)
  {
    if (*a4)
    {
      uint64_t v6 = (unsigned __int16)*a4;
      unsigned int v7 = a3;
      unsigned int v8 = a2;
      while (1)
      {
        unsigned int v9 = *v7;
        if (*v7 == a2) {
          return 1;
        }
        BOOL v10 = v9 <= a2 && v8 == a2;
        unsigned int v11 = a2;
        if (!v10)
        {
          *unsigned int v7 = v8;
          unsigned int v11 = v9;
        }
        ++v7;
        unsigned int v8 = v11;
        if (!--v6)
        {
          if (v4 == 10) {
            goto LABEL_2;
          }
          if (v11 > a3[v4 - 1])
          {
            *a4 = v4 + 1;
            a3[v4] = v11;
          }
          return 1;
        }
      }
    }
    else
    {
      uint64_t result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_100014D5C(uint64_t a1, int a2, int *a3, _WORD *a4)
{
  unint64_t v4 = (unsigned __int16)*a4;
  if (v4 <= 0x14)
  {
    if (*a4)
    {
      uint64_t v6 = (unsigned __int16)*a4;
      unsigned int v7 = a3;
      int v8 = a2;
      while (1)
      {
        int v9 = *v7;
        if (*v7 == a2) {
          return 1;
        }
        BOOL v10 = v9 <= a2 && v8 == a2;
        int v11 = a2;
        if (!v10)
        {
          *unsigned int v7 = v8;
          int v11 = v9;
        }
        ++v7;
        int v8 = v11;
        if (!--v6)
        {
          if (v4 == 20) {
            goto LABEL_2;
          }
          if (v11 > a3[v4 - 1])
          {
            *a4 = v4 + 1;
            a3[v4] = v11;
          }
          return 1;
        }
      }
    }
    else
    {
      uint64_t result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_100014E08(uint64_t a1, unsigned int a2, _WORD *a3, _WORD *a4)
{
  unsigned int v4 = (unsigned __int16)*a4;
  if (v4 <= 0x14)
  {
    if (*a4)
    {
      unint64_t v6 = 0;
      unsigned int v7 = a2;
      while (1)
      {
        unsigned int v8 = (unsigned __int16)a3[v6];
        if (v8 == a2) {
          return 1;
        }
        BOOL v9 = v8 <= a2 && v7 == a2;
        unsigned int v10 = a2;
        if (!v9)
        {
          a3[v6] = v7;
          LOWORD(v4) = *a4;
          unsigned int v10 = v8;
        }
        ++v6;
        unsigned int v7 = v10;
        if (v6 >= (unsigned __int16)v4)
        {
          if ((unsigned __int16)v4 == 20) {
            goto LABEL_2;
          }
          if (v10 > (unsigned __int16)a3[(unsigned __int16)v4 - 1])
          {
            *a4 = v4 + 1;
            a3[(unsigned __int16)v4] = v10;
          }
          return 1;
        }
      }
    }
    else
    {
      uint64_t result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_100014EBC(uint64_t a1, unsigned int a2, _WORD *a3, _WORD *a4)
{
  unsigned int v4 = (unsigned __int16)*a4;
  if (v4 <= 2)
  {
    if (*a4)
    {
      unint64_t v6 = 0;
      unsigned int v7 = a2;
      while (1)
      {
        unsigned int v8 = (unsigned __int16)a3[v6];
        if (v8 == a2) {
          return 1;
        }
        BOOL v9 = v8 <= a2 && v7 == a2;
        unsigned int v10 = a2;
        if (!v9)
        {
          a3[v6] = v7;
          LOWORD(v4) = *a4;
          unsigned int v10 = v8;
        }
        ++v6;
        unsigned int v7 = v10;
        if (v6 >= (unsigned __int16)v4)
        {
          if ((unsigned __int16)v4 == 2) {
            goto LABEL_2;
          }
          if (v10 > (unsigned __int16)a3[(unsigned __int16)v4 - 1])
          {
            *a4 = v4 + 1;
            a3[(unsigned __int16)v4] = v10;
          }
          return 1;
        }
      }
    }
    else
    {
      uint64_t result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_100014F70(uint64_t a1, unsigned int a2, unsigned char *a3, _WORD *a4)
{
  unsigned int v4 = (unsigned __int16)*a4;
  if (v4 <= 2)
  {
    if (*a4)
    {
      unint64_t v6 = 0;
      unsigned int v7 = a2;
      while (1)
      {
        unsigned int v8 = a3[v6];
        if (v8 == a2) {
          return 1;
        }
        BOOL v9 = v8 <= a2 && v7 == a2;
        unsigned int v10 = a2;
        if (!v9)
        {
          a3[v6] = v7;
          LOWORD(v4) = *a4;
          unsigned int v10 = v8;
        }
        ++v6;
        unsigned int v7 = v10;
        if (v6 >= (unsigned __int16)v4)
        {
          if ((unsigned __int16)v4 == 2) {
            goto LABEL_2;
          }
          if (v10 > a3[(unsigned __int16)v4 - 1])
          {
            *a4 = v4 + 1;
            a3[(unsigned __int16)v4] = v10;
          }
          return 1;
        }
      }
    }
    else
    {
      uint64_t result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_100015024(uint64_t a1, int *a2, uint64_t a3)
{
  unsigned int v3 = a2[1];
  if (v3 >= 0x40000)
  {
    printf("e: unexpected LLMT block version %d\n");
    return 0;
  }
  if (HIWORD(v3) == 3)
  {
    if (a2[2] != 52)
    {
      printf("e: unexpected PRCW block size %d\n");
      return 0;
    }
    unsigned int v7 = *(int **)(a1 + 3896);
    int v8 = *v7;
    *(void *)(a1 + 3896) = v7 + 1;
    LODWORD(v7) = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v7 - 4;
    if (v7 < 4) {
      puts("e: data_sz underflow in get_value");
    }
    if (v8)
    {
      for (uint64_t i = 0; i != 96; i += 4)
      {
        unsigned int v10 = *(int **)(a1 + 3896);
        int v11 = *v10;
        *(void *)(a1 + 3896) = v10 + 1;
        LODWORD(v10) = *(_DWORD *)(a1 + 3904);
        *(_DWORD *)(a1 + 3904) = v10 - 4;
        if (v10 < 4) {
          puts("e: data_sz underflow in get_value");
        }
        *(_DWORD *)(a3 + 2916 + i) = v11;
      }
      for (uint64_t j = 0; j != 96; j += 4)
      {
        int v13 = *(int **)(a1 + 3896);
        int v14 = *v13;
        *(void *)(a1 + 3896) = v13 + 1;
        LODWORD(v13) = *(_DWORD *)(a1 + 3904);
        *(_DWORD *)(a1 + 3904) = v13 - 4;
        if (v13 < 4) {
          puts("e: data_sz underflow in get_value");
        }
        *(_DWORD *)(a3 + 3012 + j) = v14;
      }
    }
  }
  else
  {
    sub_10000AA74(a1, a2, (_DWORD *)(a3 + 2784), 0x10u, 0, 0);
  }
  return 1;
}

uint64_t sub_100015180(uint64_t a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a2 + 8);
  int v4 = (*(uint64_t (**)(const __CFString *, void))(a1 + 8))(@"PRCBinningDebugEnable", *(void *)(a1 + 16));
  int v5 = (*(uint64_t (**)(const __CFString *, void))(a1 + 8))(@"dcvrr-version-control", *(void *)(a1 + 16));
  unsigned int v6 = *(_DWORD *)(a1 + 3904);
  unsigned int v7 = v6 - 2;
  if (v6 < 2) {
    return 0;
  }
  uint64_t v8 = *(void *)(a1 + 3896);
  *(void *)(a1 + 3896) = v8 + 2;
  *(_DWORD *)(a1 + 3904) = v7;
  if (v7 < 2) {
    return 0;
  }
  unsigned int v9 = *(unsigned __int16 *)(v8 + 2);
  *(void *)(a1 + 3896) = v8 + 4;
  *(_DWORD *)(a1 + 3904) = v6 - 4;
  if (v9 >= 6)
  {
    printf("e: unexpected number of bins %d\n");
    return 0;
  }
  if (v6 - 4 < 2) {
    return 0;
  }
  unsigned int v10 = *(unsigned __int16 *)(v8 + 4);
  *(void *)(a1 + 3896) = v8 + 6;
  unsigned int v11 = v6 - 6;
  *(_DWORD *)(a1 + 3904) = v11;
  if (v10 - 5 <= 0xFFFFFFFB)
  {
    printf("e: unexpected number of backlight sections %d\n");
    return 0;
  }
  int v12 = v3 - 3;
  if (v3 - 3 != (3 * v10 + 784) >> 1)
  {
    int v46 = "e: PRC table not well formed";
LABEL_55:
    puts(v46);
    return 0;
  }
  if (v11 < 4 * v12) {
    return 0;
  }
  int v13 = v5;
  *(_DWORD *)(a1 + 3904) = 4 * v12;
  uint64_t result = sub_100015714(a1, a1 + 3968, v10 - 1);
  if (!result) {
    return result;
  }
  unsigned int v15 = *(_DWORD *)(a1 + 3904);
  if ((v10 & 1) == 0)
  {
    BOOL v16 = v15 >= 2;
    v15 -= 2;
    if (!v16) {
      return 0;
    }
    *(void *)(a1 + 3896) += 2;
    *(_DWORD *)(a1 + 3904) = v15;
  }
  unsigned int v17 = v15 - 2;
  if (v15 < 2) {
    return 0;
  }
  unsigned int v18 = *(unsigned __int16 **)(a1 + 3896);
  int v19 = *v18;
  *(void *)(a1 + 3896) = v18 + 1;
  *(_DWORD *)(a1 + 3904) = v17;
  if (v13 != v19)
  {
    printf("e: Undefined EEPROM version 0x%x, expected 0x%x\n");
    return 0;
  }
  if (v17 < 2) {
    return 0;
  }
  uint64_t v20 = v18[1];
  unsigned int v21 = v18 + 2;
  *(void *)(a1 + 3896) = v18 + 2;
  unsigned int v22 = v15 - 4;
  *(_DWORD *)(a1 + 3904) = v22;
  if (v20 > 5) {
    return 0;
  }
  if (v10)
  {
    uint64_t v23 = 0;
    uint64_t v24 = (_DWORD *)(a1 + 4 * v20 + 3980);
    do
    {
      BOOL v16 = v22 >= 4;
      v22 -= 4;
      if (!v16) {
        return 0;
      }
      *uint64_t v24 = *(_DWORD *)&v18[v23 + 2];
      v24 += 5;
      *(void *)(a1 + 3896) = &v18[v23 + 4];
      *(_DWORD *)(a1 + 3904) = v22;
      v23 += 2;
    }
    while (2 * v10 != v23);
    unsigned int v21 = &v18[v23 + 2];
  }
  unsigned int v25 = v22 - 2;
  if (v22 < 2) {
    return 0;
  }
  unsigned int v26 = *v21;
  *(void *)(a1 + 3896) = v21 + 1;
  *(_DWORD *)(a1 + 3904) = v25;
  if (v25 < 2) {
    return 0;
  }
  unsigned int v27 = v21[1];
  *(void *)(a1 + 3896) = v21 + 2;
  *(_DWORD *)(a1 + 3904) = v22 - 4;
  if (v22 - 4 < 2) {
    return 0;
  }
  unsigned int v48 = v26;
  unsigned int v28 = v21[2];
  *(void *)(a1 + 3896) = v21 + 3;
  *(_DWORD *)(a1 + 3904) = v22 - 6;
  if (v22 - 6 < 2) {
    return 0;
  }
  unsigned int v29 = v21[3];
  *(void *)(a1 + 3896) = v21 + 4;
  *(_DWORD *)(a1 + 3904) = v22 - 8;
  if (v22 - 8 < 2) {
    return 0;
  }
  *(void *)(a1 + 3896) = v21 + 5;
  *(_DWORD *)(a1 + 3904) = v22 - 10;
  unsigned int v30 = (unsigned int *)malloc_type_calloc(1uLL, 0x628uLL, 0x10200404B1403A4uLL);
  if (!v30)
  {
    int v46 = "e: out of memory for PRC table";
    goto LABEL_55;
  }
  unsigned int v31 = v30;
  uint64_t v32 = 0;
  v30[5] = v29;
  v30[6] = 2;
  _DWORD v30[2] = v48;
  v30[3] = v27;
  v30[4] = v28;
  int v33 = v30 + 7;
  unsigned int v34 = *(_DWORD *)(a1 + 3904);
  do
  {
    if (v34 < 0x202) {
      goto LABEL_53;
    }
    uint64_t v35 = 0;
    uint64_t v36 = *(void *)(a1 + 3896);
    unint64_t v37 = v34 - 2;
    uint64_t v38 = v37 >> 1;
    if (v37 >> 1 >= 0x100) {
      uint64_t v38 = 256;
    }
    uint64_t v39 = 2 * v38 + 2;
    unint64_t v40 = -1;
    do
    {
      *(_WORD *)((char *)v33 + v35) = *(_WORD *)(v36 + v35);
      v35 += 2;
      ++v40;
    }
    while (v39 != v35);
    *(void *)(a1 + 3896) = v36 + v35;
    unsigned int v41 = v34 - v35;
    *(_DWORD *)(a1 + 3904) = v41;
    if (v40 < 0x100 || v41 < 2) {
      goto LABEL_53;
    }
    *(void *)(a1 + 3896) = v36 + v35 + 2;
    unsigned int v34 = v37 - v35;
    *(_DWORD *)(a1 + 3904) = v37 - v35;
    ++v32;
    int v33 = (_DWORD *)((char *)v33 + 514);
  }
  while (v32 != 3);
  uint64_t v42 = a1 + 8 * v20;
  unsigned int v43 = *(uint64_t **)(v42 + 3928);
  if (v43)
  {
    while (*((_DWORD *)v43 + 2) != v48
         || *((_DWORD *)v43 + 3) != v27
         || *((_DWORD *)v43 + 4) != v28
         || *((_DWORD *)v43 + 5) != v29)
    {
      unsigned int v43 = (uint64_t *)*v43;
      if (!v43) {
        goto LABEL_46;
      }
    }
    puts("e: duplicate PRC table found in input");
    goto LABEL_53;
  }
LABEL_46:
  if (!v20)
  {
    *(_DWORD *)(a1 + 3912) = v9;
    *(_DWORD *)(a1 + 3916) = v10;
    sub_100015664(a1, v48, (unsigned int *)(a1 + 2520), (unsigned int *)(a1 + 2616));
    sub_100015664(a1, v31[3], (unsigned int *)(a1 + 2720), (unsigned int *)(a1 + 2816));
    sub_100015664(a1, v31[4], (unsigned int *)(a1 + 2620), (unsigned int *)(a1 + 2716));
    int v44 = *(_DWORD *)(a1 + 2512) | (1 << v31[5]);
    *(_DWORD *)(a1 + 2512) = v44;
    if (v44 == 3) {
      int v45 = 2;
    }
    else {
      int v45 = 1;
    }
    *(_DWORD *)(a1 + 2820) = v45;
    unsigned int v29 = v31[5];
  }
  if (v29 >= 2)
  {
    printf("e: unexpected value for polarity %d\n", v29);
LABEL_53:
    free(v31);
    return 0;
  }
  *(void *)unsigned int v31 = *(void *)(v42 + 3928);
  *(void *)(v42 + 3928) = v31;
  int v47 = *(_DWORD *)(a1 + 3920) + 1;
  *(_DWORD *)(a1 + 3920) = v47;
  if (v47 != *(_DWORD *)(a1 + 2616)
            * *(_DWORD *)(a1 + 3912)
            * *(_DWORD *)(a1 + 2716)
            * *(_DWORD *)(a1 + 2816)
            * *(_DWORD *)(a1 + 2820))
    return 1;

  return sub_100015798(a1, v4 != 0);
}

uint64_t sub_100015664(uint64_t a1, unsigned int a2, unsigned int *a3, unsigned int *a4)
{
  unsigned int v4 = *a4;
  if (*a4 <= 0x18)
  {
    if (v4)
    {
      unint64_t v6 = 0;
      unsigned int v7 = a2;
      while (1)
      {
        unsigned int v8 = a3[v6];
        if (v8 == a2) {
          return 1;
        }
        BOOL v9 = v8 <= a2 && v7 == a2;
        unsigned int v10 = a2;
        if (!v9)
        {
          a3[v6] = v7;
          unsigned int v4 = *a4;
          unsigned int v10 = v8;
        }
        ++v6;
        unsigned int v7 = v10;
        if (v6 >= v4)
        {
          if (v4 == 24) {
            goto LABEL_2;
          }
          if (v10 > a3[v4 - 1])
          {
            *a4 = v4 + 1;
            a3[v4] = v10;
          }
          return 1;
        }
      }
    }
    else
    {
      uint64_t result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

BOOL sub_100015714(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (*(unsigned int *)(a1 + 3904) < 2 * a3) {
    return 0;
  }
  if (!a3) {
    return 1;
  }
  unsigned int v3 = *(_DWORD *)(a1 + 3904);
  if (v3 < 2) {
    return 0;
  }
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)(a1 + 3896) + 2;
  do
  {
    uint64_t v6 = v4;
    uint64_t v7 = v5;
    int v8 = *(unsigned __int16 *)(v5 - 2);
    *(_DWORD *)(a1 + 3904) = v3 - 2;
    *(_DWORD *)(a2 + 4 * v4) = v8;
    if (a3 - 1 == v4) {
      break;
    }
    uint64_t v5 = v7 + 2;
    unsigned int v3 = *(_DWORD *)(a1 + 3904);
    ++v4;
  }
  while (v3 >= 2);
  *(void *)(a1 + 3896) = v7;
  return v6 + 1 >= a3;
}

BOOL sub_100015798(uint64_t a1, int a2)
{
  int v4 = (*(uint64_t (**)(const __CFString *, void))(a1 + 8))(@"dcvrr-a", *(void *)(a1 + 16));
  int v5 = (*(uint64_t (**)(const __CFString *, void))(a1 + 8))(@"dcvrr-b", *(void *)(a1 + 16));
  int v6 = (*(uint64_t (**)(const __CFString *, void))(a1 + 8))(@"dcvrr-c", *(void *)(a1 + 16));
  int v7 = (*(uint64_t (**)(const __CFString *, void))(a1 + 8))(@"dcvrr-d", *(void *)(a1 + 16));
  int v8 = v7;
  if (a2) {
    printf("%s dcvrr_a 0x%x dcvrr_b 0x%x dcvrr_c 0x%x dcvrr_d 0x%x\n", "prc_binning_impl", v4, v5, v6, v7);
  }
  if (!*(_DWORD *)(a1 + 2716)) {
    return *(void *)(a1 + 2824) != 0;
  }
  uint64_t v9 = 0;
  while (1)
  {
    uint64_t v10 = *(unsigned int *)(a1 + 2620 + 4 * v9);
    uint64_t v11 = *(unsigned int *)(a1 + 3916);
    if (v11)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(_DWORD *)(a1 + 3968 + 4 * i) > v10) {
          goto LABEL_10;
        }
      }
      LODWORD(i) = *(_DWORD *)(a1 + 3916);
LABEL_10:
      int v13 = v4;
      switch((int)i)
      {
        case 0:
          goto LABEL_15;
        case 1:
          int v13 = v6;
          goto LABEL_15;
        case 2:
          int v13 = v5;
          goto LABEL_15;
        case 3:
          int v13 = v8;
          goto LABEL_15;
        default:
          printf("e: unknown backlight section %d\n", i);
          return 0;
      }
    }
    LODWORD(i) = 0;
    int v13 = v4;
LABEL_15:
    if ((sub_10001593C((_DWORD *)a1, a2, v13, v10, i) & 1) == 0) {
      return 0;
    }
    if (++v9 >= (unint64_t)*(unsigned int *)(a1 + 2716)) {
      return *(void *)(a1 + 2824) != 0;
    }
  }
}

uint64_t sub_10001593C(_DWORD *a1, int a2, int a3, uint64_t a4, unsigned int a5)
{
  uint64_t v10 = a1;
  uint64_t v11 = &a1[5 * a5 + 995];
  unint64_t v12 = a1[978];
  unsigned int v49 = 0;
  uint64_t v50 = 0;
  unsigned int v48 = 0;
  sub_100020B20(&v48, v11, (uint64_t)&v11[v12], v12);
  memset(__p, 170, sizeof(__p));
  sub_100015E10((uint64_t *)&v48, (char **)__p);
  unsigned int v13 = v10[978];
  if (v13)
  {
    unint64_t v14 = 0;
    uint64_t v5 = (uint64_t)"%s thresholds[sec:%d][bin:%d] 0x%x\n";
    do
    {
      if (a2)
      {
        if (v14 >= ((char *)__p[1] - (char *)__p[0]) >> 2) {
          goto LABEL_62;
        }
        printf("%s thresholds[sec:%d][bin:%d] 0x%x\n", "interpolate_prc_bins", a5, *((_DWORD *)__p[0] + v14), v11[*((unsigned int *)__p[0] + v14)]);
        unsigned int v13 = v10[978];
      }
      ++v14;
    }
    while (v14 < v13);
    unsigned int v15 = (unsigned int *)__p[0];
    BOOL v16 = (unsigned int *)__p[1];
    if (v13)
    {
      unint64_t v17 = 0;
      unint64_t v18 = ((char *)__p[1] - (char *)__p[0]) >> 2;
      while (v18 != v17)
      {
        if (v11[*((unsigned int *)__p[0] + v17)] >= a3)
        {
          if (v17) {
            goto LABEL_17;
          }
          goto LABEL_15;
        }
        if (v13 == ++v17)
        {
          unint64_t v17 = v13 - 1;
          if (v18 <= v17) {
            goto LABEL_62;
          }
          a3 = v11[*((unsigned int *)__p[0] + v17)];
          goto LABEL_17;
        }
      }
      goto LABEL_62;
    }
  }
  else
  {
    unsigned int v15 = (unsigned int *)__p[0];
    BOOL v16 = (unsigned int *)__p[1];
  }
LABEL_15:
  if (v16 == v15) {
    goto LABEL_62;
  }
  a3 = v11[*v15];
  unint64_t v18 = v16 - v15;
  LODWORD(v17) = 1;
LABEL_17:
  if (v18 <= v17 || (uint64_t v19 = v17, v20 = (v17 - 1), v18 <= v20))
  {
LABEL_62:
    __break(1u);
LABEL_63:
    puts("e: out of memory for PRC table");
    goto LABEL_55;
  }
  uint64_t v45 = v15[v20];
  uint64_t v46 = v15[v19];
  int v21 = v11[v46];
  float v22 = 1.0;
  int v23 = v21 - v11[v45];
  if (v23) {
    float v22 = (float)(v21 - a3) / (float)v23;
  }
  if (a2)
  {
    puts("======================================");
    printf("%s For backlight %d: \n         section %d metric 0x%x falls between \n         {thresholds[sec:%d][bin:%d]:0x%x , thresholds[sec:%d][bin:%d]:0x%x} \n         weight = %f\n", "interpolate_prc_bins", a4, a5, a3, a5, v45, v10[5 * a5 + 995 + v45], a5, v46, v10[5 * a5 + 995 + v46], v22);
    puts("======================================\n");
  }
  unint64_t v24 = v10[704];
  if (v24)
  {
    unint64_t v25 = 0;
    unsigned int v26 = v10 + 630;
    unsigned int v27 = v10 + 680;
    unsigned int v28 = &v10[2 * v45 + 982];
    unsigned int v29 = &v10[2 * v46 + 982];
    LODWORD(v30) = v10[654];
    while (!v30)
    {
LABEL_51:
      ++v25;
      uint64_t v5 = 1;
      if (v25 >= v24) {
        goto LABEL_55;
      }
    }
    unsigned int v43 = v28;
    unint64_t v44 = 0;
    uint64_t v42 = v29;
    while (1)
    {
      unsigned int v31 = (uint64_t *)*v28;
      if (*v28)
      {
        do
        {
          if (*((_DWORD *)v31 + 2) == v26[v44]
            && *((_DWORD *)v31 + 3) == v27[v25]
            && *((_DWORD *)v31 + 4) == a4)
          {
            break;
          }
          unsigned int v31 = (uint64_t *)*v31;
        }
        while (v31);
      }
      uint64_t v32 = (uint64_t *)*v29;
      if (!*v29) {
        break;
      }
      while (*((_DWORD *)v32 + 2) != v26[v44] || *((_DWORD *)v32 + 3) != v27[v25] || *((_DWORD *)v32 + 4) != a4)
      {
        uint64_t v32 = (uint64_t *)*v32;
        if (!v32) {
          goto LABEL_53;
        }
      }
      if (!v31) {
        break;
      }
      int v33 = (char *)malloc_type_calloc(1uLL, 0x628uLL, 0x10200404B1403A4uLL);
      uint64_t v5 = (uint64_t)v33;
      if (!v33) {
        goto LABEL_63;
      }
      unint64_t v40 = v10;
      uint64_t v41 = a4;
      uint64_t v34 = 0;
      *((_DWORD *)v33 + 6) = 2;
      *(_OWORD *)(v33 + 8) = *(_OWORD *)(v31 + 1);
      uint64_t v35 = (uint64_t)v31 + 28;
      do
      {
        if (a2) {
          printf("%s Interpolated LUT[temp:%d][subframe:%d][backlight:%d][channel:%d]: ", "interpolate_prc_bins", *(_DWORD *)(v5 + 8), *(_DWORD *)(v5 + 12), *(_DWORD *)(v5 + 16), v34);
        }
        for (uint64_t i = 0; i != 257; ++i)
        {
          while (1)
          {
            unsigned int v37 = *((unsigned __int16 *)v32 + 257 * v34 + i + 14);
            double v38 = (float)((float)v37 + (float)(v22 * (float)(int)(*(unsigned __int16 *)(v35 + 514 * v34 + 2 * i) - v37)))
                + 0.5;
            *(_WORD *)(v5 + 28 + 514 * v34 + 2 * i) = (int)v38;
            if (a2) {
              break;
            }
            if (++i == 257) {
              goto LABEL_48;
            }
          }
          printf("%d ", (int)v38);
        }
        puts("\n ");
LABEL_48:
        ++v34;
      }
      while (v34 != 3);
      uint64_t v10 = v40;
      a4 = v41;
      *(void *)uint64_t v5 = *((void *)v40 + 353);
      *((void *)v40 + 353) = v5;
      unsigned int v28 = v43;
      unint64_t v30 = v40[654];
      ++v44;
      unsigned int v29 = v42;
      if (v44 >= v30)
      {
        unint64_t v24 = v40[704];
        goto LABEL_51;
      }
    }
LABEL_53:
    printf("e: Could not find PRC tables [%d:%d:%d] for bins [%d:%d]\n", v26[v44], v27[v25], a4, v45, v46);
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
LABEL_55:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v48)
  {
    unsigned int v49 = v48;
    operator delete(v48);
  }
  return v5;
}

void sub_100015DDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29)
{
  if (__p) {
    operator delete(__p);
  }
  unsigned int v31 = *(void **)(v29 - 128);
  if (v31)
  {
    *(void *)(v29 - 120) = v31;
    operator delete(v31);
  }
  _Unwind_Resume(exception_object);
}

void sub_100015E10(uint64_t *a1@<X0>, char **a2@<X8>)
{
  a2[2] = 0;
  int v4 = a2 + 2;
  *a2 = 0;
  a2[1] = 0;
  if (a1[1] == *a1)
  {
    uint64_t v5 = 0;
    BOOL v16 = 0;
  }
  else
  {
    uint64_t v5 = 0;
    LODWORD(v6) = 0;
    do
    {
      if ((unint64_t)v5 >= *v4)
      {
        int v7 = (unsigned int *)*a2;
        uint64_t v8 = ((char *)v5 - *a2) >> 2;
        unint64_t v9 = v8 + 1;
        if ((unint64_t)(v8 + 1) >> 62) {
          sub_100009CF0();
        }
        uint64_t v10 = *v4 - (void)v7;
        if (v10 >> 1 > v9) {
          unint64_t v9 = v10 >> 1;
        }
        if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v11 = v9;
        }
        if (v11)
        {
          unint64_t v12 = (char *)sub_100020BE0((uint64_t)v4, v11);
          int v7 = (unsigned int *)*a2;
          uint64_t v5 = (unsigned int *)a2[1];
        }
        else
        {
          unint64_t v12 = 0;
        }
        unsigned int v13 = &v12[4 * v8];
        *(_DWORD *)unsigned int v13 = v6;
        unint64_t v14 = (unsigned int *)(v13 + 4);
        while (v5 != v7)
        {
          int v15 = *--v5;
          *((_DWORD *)v13 - 1) = v15;
          v13 -= 4;
        }
        *a2 = v13;
        a2[1] = (char *)v14;
        a2[2] = &v12[4 * v11];
        if (v7) {
          operator delete(v7);
        }
        uint64_t v5 = v14;
      }
      else
      {
        *v5++ = v6;
      }
      a2[1] = (char *)v5;
      unint64_t v6 = (v6 + 1);
    }
    while (v6 < (a1[1] - *a1) >> 2);
    BOOL v16 = (unsigned int *)*a2;
  }
  unint64_t v20 = a1;
  if ((char *)v5 - (char *)v16 < 513)
  {
    unint64_t v17 = 0;
    uint64_t v19 = 0;
  }
  else
  {
    unint64_t v17 = (unsigned int *)sub_100020C18(v5 - v16);
    uint64_t v19 = v18;
  }
  sub_100020C7C(v16, v5, &v20, v5 - v16, v17, v19);
  if (v17) {
    operator delete(v17);
  }
}

void sub_100015F9C(_Unwind_Exception *exception_object)
{
  if (v2) {
    operator delete(v2);
  }
  int v4 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100015FD0(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) == 0x10000)
  {
    unsigned int v3 = *(_DWORD **)(a1 + 2840);
    if (*v3 == 1)
    {
      if ((4 * *(_DWORD *)(a2 + 8) - 12) > 0x14)
      {
        uint64_t v5 = *(void *)(a1 + 3896) + 1;
        *(void *)(a1 + 3896) = v5;
        int v6 = *(_DWORD *)(a1 + 3904);
        BOOL v7 = v6 != 0;
        int v8 = v6 - 1;
        *(_DWORD *)(a1 + 3904) = v8;
        if (!v7)
        {
          puts("e: data_sz underflow in get_value");
          uint64_t v5 = *(void *)(a1 + 3896);
          int v8 = *(_DWORD *)(a1 + 3904);
        }
        uint64_t v9 = v5 + 1;
        *(void *)(a1 + 3896) = v9;
        BOOL v7 = v8 != 0;
        unsigned int v10 = v8 - 1;
        *(_DWORD *)(a1 + 3904) = v10;
        if (!v7)
        {
          puts("e: data_sz underflow in get_value");
          uint64_t v9 = *(void *)(a1 + 3896);
          unsigned int v10 = *(_DWORD *)(a1 + 3904);
        }
        uint64_t v11 = v9 + 2;
        *(void *)(a1 + 3896) = v11;
        BOOL v7 = v10 >= 2;
        unsigned int v12 = v10 - 2;
        *(_DWORD *)(a1 + 3904) = v12;
        if (!v7)
        {
          puts("e: data_sz underflow in get_value");
          uint64_t v11 = *(void *)(a1 + 3896);
          unsigned int v12 = *(_DWORD *)(a1 + 3904);
        }
        unsigned int v13 = (unsigned __int8 *)(v11 + 1);
        *(void *)(a1 + 3896) = v13;
        BOOL v7 = v12 != 0;
        unsigned int v14 = v12 - 1;
        *(_DWORD *)(a1 + 3904) = v14;
        if (!v7)
        {
          puts("e: data_sz underflow in get_value");
          unsigned int v13 = *(unsigned __int8 **)(a1 + 3896);
          unsigned int v14 = *(_DWORD *)(a1 + 3904);
        }
        unsigned int v15 = *v13;
        *(void *)(a1 + 3896) = v13 + 1;
        *(_DWORD *)(a1 + 3904) = v14 - 1;
        if (!v14) {
          puts("e: data_sz underflow in get_value");
        }
        if (v15 < 5)
        {
          BOOL v16 = *(unsigned __int8 **)(a1 + 3896);
          unsigned int v17 = *v16;
          *(void *)(a1 + 3896) = v16 + 1;
          LODWORD(v16) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v16 - 1;
          if (!v16) {
            puts("e: data_sz underflow in get_value");
          }
          if (v17 < 7)
          {
            uint64_t v18 = *(unsigned __int8 **)(a1 + 3896);
            unsigned int v21 = *v18;
            uint64_t v19 = v18 + 1;
            unsigned int v20 = v21;
            *(void *)(a1 + 3896) = v19;
            int v22 = *(_DWORD *)(a1 + 3904);
            BOOL v7 = v22 != 0;
            int v23 = v22 - 1;
            *(_DWORD *)(a1 + 3904) = v23;
            if (!v7)
            {
              puts("e: data_sz underflow in get_value");
              uint64_t v19 = *(unsigned __int8 **)(a1 + 3896);
              int v23 = *(_DWORD *)(a1 + 3904);
            }
            int v25 = *v19;
            unint64_t v24 = v19 + 1;
            *(void *)(a1 + 3896) = v24;
            BOOL v7 = v23 != 0;
            int v26 = v23 - 1;
            *(_DWORD *)(a1 + 3904) = v26;
            int v66 = v25;
            if (!v7)
            {
              puts("e: data_sz underflow in get_value");
              unint64_t v24 = *(unsigned __int8 **)(a1 + 3896);
              int v26 = *(_DWORD *)(a1 + 3904);
            }
            int v28 = *v24;
            unsigned int v27 = v24 + 1;
            *(void *)(a1 + 3896) = v27;
            BOOL v7 = v26 != 0;
            int v29 = v26 - 1;
            *(_DWORD *)(a1 + 3904) = v29;
            int v65 = v28;
            if (!v7)
            {
              puts("e: data_sz underflow in get_value");
              unsigned int v27 = *(unsigned __int8 **)(a1 + 3896);
              int v29 = *(_DWORD *)(a1 + 3904);
            }
            int v31 = *v27;
            unint64_t v30 = v27 + 1;
            *(void *)(a1 + 3896) = v30;
            BOOL v7 = v29 != 0;
            int v32 = v29 - 1;
            *(_DWORD *)(a1 + 3904) = v32;
            int v64 = v31;
            if (!v7)
            {
              puts("e: data_sz underflow in get_value");
              unint64_t v30 = *(unsigned __int8 **)(a1 + 3896);
              int v32 = *(_DWORD *)(a1 + 3904);
            }
            unsigned int v34 = *v30;
            int v33 = v30 + 1;
            *(void *)(a1 + 3896) = v33;
            BOOL v7 = v32 != 0;
            int v35 = v32 - 1;
            *(_DWORD *)(a1 + 3904) = v35;
            unsigned int v63 = v34;
            if (!v7)
            {
              puts("e: data_sz underflow in get_value");
              int v33 = *(unsigned __int8 **)(a1 + 3896);
              int v35 = *(_DWORD *)(a1 + 3904);
            }
            int v38 = *v33;
            uint64_t v36 = v33 + 1;
            int v37 = v38;
            *(void *)(a1 + 3896) = v36;
            BOOL v7 = v35 != 0;
            int v39 = v35 - 1;
            *(_DWORD *)(a1 + 3904) = v39;
            if (!v7)
            {
              puts("e: data_sz underflow in get_value");
              uint64_t v36 = *(unsigned __int8 **)(a1 + 3896);
              int v39 = *(_DWORD *)(a1 + 3904);
            }
            int v41 = *v36;
            unint64_t v40 = v36 + 1;
            *(void *)(a1 + 3896) = v40;
            BOOL v7 = v39 != 0;
            int v42 = v39 - 1;
            *(_DWORD *)(a1 + 3904) = v42;
            unsigned int v67 = v20;
            int v62 = v41;
            if (!v7)
            {
              puts("e: data_sz underflow in get_value");
              unint64_t v40 = *(unsigned __int8 **)(a1 + 3896);
              int v42 = *(_DWORD *)(a1 + 3904);
            }
            int v45 = *v40;
            unsigned int v43 = v40 + 1;
            int v44 = v45;
            *(void *)(a1 + 3896) = v43;
            BOOL v7 = v42 != 0;
            int v46 = v42 - 1;
            *(_DWORD *)(a1 + 3904) = v46;
            if (!v7)
            {
              puts("e: data_sz underflow in get_value");
              unsigned int v43 = *(unsigned __int8 **)(a1 + 3896);
              int v46 = *(_DWORD *)(a1 + 3904);
            }
            int v48 = *v43;
            int v47 = v43 + 1;
            *(void *)(a1 + 3896) = v47;
            BOOL v7 = v46 != 0;
            int v49 = v46 - 1;
            *(_DWORD *)(a1 + 3904) = v49;
            int v61 = v48;
            if (!v7)
            {
              puts("e: data_sz underflow in get_value");
              int v47 = *(unsigned __int8 **)(a1 + 3896);
              int v49 = *(_DWORD *)(a1 + 3904);
            }
            unsigned int v52 = *v47;
            uint64_t v50 = v47 + 1;
            unsigned int v51 = v52;
            *(void *)(a1 + 3896) = v50;
            BOOL v7 = v49 != 0;
            int v53 = v49 - 1;
            *(_DWORD *)(a1 + 3904) = v53;
            if (!v7)
            {
              puts("e: data_sz underflow in get_value");
              uint64_t v50 = *(unsigned __int8 **)(a1 + 3896);
              int v53 = *(_DWORD *)(a1 + 3904);
            }
            unsigned int v56 = *v50;
            int v54 = v50 + 1;
            unsigned int v55 = v56;
            *(void *)(a1 + 3896) = v54;
            BOOL v7 = v53 != 0;
            int v57 = v53 - 1;
            *(_DWORD *)(a1 + 3904) = v57;
            if (!v7)
            {
              puts("e: data_sz underflow in get_value");
              int v54 = *(unsigned __int8 **)(a1 + 3896);
              int v57 = *(_DWORD *)(a1 + 3904);
            }
            unsigned int v58 = v3 + 581884;
            unsigned int v59 = v54 + 1;
            *(void *)(a1 + 3896) = v59;
            BOOL v7 = v57 != 0;
            unsigned int v60 = v57 - 1;
            *(_DWORD *)(a1 + 3904) = v60;
            if (!v7)
            {
              puts("e: data_sz underflow in get_value");
              unsigned int v59 = *(unsigned __int8 **)(a1 + 3896);
              unsigned int v60 = *(_DWORD *)(a1 + 3904);
            }
            *(void *)(a1 + 3896) = v59 + 2;
            *(_DWORD *)(a1 + 3904) = v60 - 2;
            if (v60 < 2) {
              puts("e: data_sz underflow in get_value");
            }
            unsigned int *v58 = v15;
            v58[1] = v17;
            v58[2] = v67;
            *(void *)(v58 + 3) = 0;
            v58[5] = v63;
            v58[6] = v51;
            v58[7] = v55;
            *((void *)v58 + 4) = 0;
            *((unsigned char *)v58 + 48) = (v37 | v44) != 0;
            *((unsigned char *)v58 + 49) = v37 != 0;
            *((unsigned char *)v58 + 50) = v62 != 0;
            *((unsigned char *)v58 + 51) = v44 != 0;
            *((unsigned char *)v58 + 52) = v61 != 0;
            *((unsigned char *)v58 + 53) = v66 != 0;
            *((unsigned char *)v58 + 54) = v65 != 0;
            *((unsigned char *)v58 + 55) = v64 != 0;
            operator new();
          }
          printf("e: unsupported sensor channel count: %u > %u\n");
        }
        else
        {
          printf("e: unsupported region count: %u > %u\n");
        }
      }
      else
      {
        puts("e: cannot read data in CNST");
      }
    }
    else
    {
      printf("e: mismatching versions: %u != %u\n");
    }
  }
  else
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
  }
  return 0;
}

uint64_t sub_10001654C(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) != 0x20000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  int v3 = *(_DWORD *)(a1 + 2832);
  switch(v3)
  {
    case 1:
      int v4 = (unsigned int *)(*(void *)(a1 + 2840) + 2327536);
      break;
    case 6:
      int v4 = (unsigned int *)(*(void *)(a1 + 2840) + 1876064);
      break;
    case 3:
      int v4 = (unsigned int *)(*(void *)(a1 + 2840) + 1918576);
      break;
    case 2:
      int v4 = (unsigned int *)(*(void *)(a1 + 2840) + 12416);
      break;
    default:
      printf("e: mismatching versions: %u != 1,2,3,6\n");
      return 0;
  }
  uint64_t v5 = (4 * *(_DWORD *)(a2 + 8) - 12);
  if (4 * *(_DWORD *)(a2 + 8) == 12)
  {
    BOOL v7 = "e: cannot read NR and NC";
    goto LABEL_157;
  }
  int v6 = *v4;
  uint64_t v105 = v4[1];
  if (v5 < 2 * *v4 * v105)
  {
    BOOL v7 = "e: underflow while reading num_svds and shift_bits";
LABEL_157:
    puts(v7);
    return 0;
  }
  unsigned int v100 = 2 * v6;
  uint64_t v99 = *(void *)(a1 + 3896);
  uint64_t v101 = v99 + v5;
  uint64_t v104 = *v4;
  if (v6)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 33;
    uint64_t v10 = 33;
    uint64_t v11 = 33;
    do
    {
      uint64_t v102 = v8;
      uint64_t v12 = v105;
      uint64_t v13 = v9;
      uint64_t v14 = v10;
      uint64_t v15 = v11;
      if (v105)
      {
        do
        {
          switch(v3)
          {
            case 1:
              goto LABEL_19;
            case 6:
              unsigned int v20 = *(char **)(a1 + 3896);
              char v21 = *v20;
              *(void *)(a1 + 3896) = v20 + 1;
              LODWORD(v20) = *(_DWORD *)(a1 + 3904);
              *(_DWORD *)(a1 + 3904) = v20 - 1;
              if (!v20) {
                puts("e: data_sz underflow in get_value");
              }
              *(unsigned char *)(*(void *)(a1 + 2840) + v15) = v21;
              break;
            case 3:
LABEL_19:
              BOOL v16 = *(char **)(a1 + 3896);
              char v17 = *v16;
              *(void *)(a1 + 3896) = v16 + 1;
              LODWORD(v16) = *(_DWORD *)(a1 + 3904);
              *(_DWORD *)(a1 + 3904) = v16 - 1;
              if (!v16) {
                puts("e: data_sz underflow in get_value");
              }
              *(unsigned char *)(*(void *)(a1 + 2840) + v14) = v17;
              break;
            default:
              uint64_t v18 = *(char **)(a1 + 3896);
              char v19 = *v18;
              *(void *)(a1 + 3896) = v18 + 1;
              LODWORD(v18) = *(_DWORD *)(a1 + 3904);
              *(_DWORD *)(a1 + 3904) = v18 - 1;
              if (!v18) {
                puts("e: data_sz underflow in get_value");
              }
              *(unsigned char *)(*(void *)(a1 + 2840) + v13) = v19;
              break;
          }
          v15 += 4;
          v14 += 4;
          v13 += 4;
          --v12;
        }
        while (v12);
      }
      uint64_t v8 = v102 + 1;
      v11 += 52;
      v10 += 48;
      v9 += 28;
    }
    while (v102 + 1 != v104);
    uint64_t v22 = 0;
    uint64_t v23 = 32;
    uint64_t v24 = 32;
    uint64_t v25 = 32;
    while (1)
    {
      uint64_t v103 = v22;
      uint64_t v26 = v105;
      uint64_t v27 = v23;
      uint64_t v28 = v24;
      uint64_t v29 = v25;
      if (v105) {
        break;
      }
LABEL_49:
      int v6 = v104;
      uint64_t v22 = v103 + 1;
      v25 += 52;
      v24 += 48;
      v23 += 28;
      if (v103 + 1 == v104) {
        goto LABEL_50;
      }
    }
    while (1)
    {
      switch(v3)
      {
        case 1:
          goto LABEL_36;
        case 6:
          unsigned int v34 = *(char **)(a1 + 3896);
          char v35 = *v34;
          *(void *)(a1 + 3896) = v34 + 1;
          LODWORD(v34) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v34 - 1;
          if (!v34) {
            puts("e: data_sz underflow in get_value");
          }
          *(unsigned char *)(*(void *)(a1 + 2840) + v29) = v35;
          break;
        case 3:
LABEL_36:
          unint64_t v30 = *(char **)(a1 + 3896);
          char v31 = *v30;
          *(void *)(a1 + 3896) = v30 + 1;
          LODWORD(v30) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v30 - 1;
          if (!v30) {
            puts("e: data_sz underflow in get_value");
          }
          *(unsigned char *)(*(void *)(a1 + 2840) + v28) = v31;
          break;
        default:
          int v32 = *(char **)(a1 + 3896);
          char v33 = *v32;
          *(void *)(a1 + 3896) = v32 + 1;
          LODWORD(v32) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v32 - 1;
          if (!v32) {
            puts("e: data_sz underflow in get_value");
          }
          *(unsigned char *)(*(void *)(a1 + 2840) + v27) = v33;
          break;
      }
      v29 += 4;
      v28 += 4;
      v27 += 4;
      if (!--v26) {
        goto LABEL_49;
      }
    }
  }
LABEL_50:
  if (v101 - *(void *)(a1 + 3896) < (8 * v6))
  {
    BOOL v7 = "e: underflow while reading regions";
    goto LABEL_157;
  }
  if (v6)
  {
    uint64_t v36 = 0;
    uint64_t v37 = 28 * v104;
    uint64_t v38 = 8;
    uint64_t v39 = 8;
    while (1)
    {
      switch(v3)
      {
        case 1:
          goto LABEL_55;
        case 6:
          int v44 = *(unsigned __int16 **)(a1 + 3896);
          int v45 = *v44;
          *(void *)(a1 + 3896) = v44 + 1;
          LODWORD(v44) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v44 - 2;
          if (v44 < 2) {
            puts("e: data_sz underflow in get_value");
          }
          *(_DWORD *)(*(void *)(a1 + 2840) + v39) = v45;
          break;
        case 3:
LABEL_55:
          unint64_t v40 = *(unsigned __int16 **)(a1 + 3896);
          int v41 = *v40;
          *(void *)(a1 + 3896) = v40 + 1;
          LODWORD(v40) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v40 - 2;
          if (v40 < 2) {
            puts("e: data_sz underflow in get_value");
          }
          *(_DWORD *)(*(void *)(a1 + 2840) + v38) = v41;
          break;
        default:
          int v42 = *(unsigned __int16 **)(a1 + 3896);
          int v43 = *v42;
          *(void *)(a1 + 3896) = v42 + 1;
          LODWORD(v42) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v42 - 2;
          if (v42 < 2) {
            puts("e: data_sz underflow in get_value");
          }
          *(_DWORD *)(*(void *)(a1 + 2840) + v36 + 8) = v43;
          break;
      }
      v39 += 52;
      v38 += 48;
      v36 += 28;
      if (v37 == v36)
      {
        uint64_t v46 = 0;
        uint64_t v47 = 12;
        uint64_t v48 = 12;
        while (1)
        {
          switch(v3)
          {
            case 1:
              goto LABEL_70;
            case 6:
              int v53 = *(unsigned __int16 **)(a1 + 3896);
              int v54 = *v53;
              *(void *)(a1 + 3896) = v53 + 1;
              LODWORD(v53) = *(_DWORD *)(a1 + 3904);
              *(_DWORD *)(a1 + 3904) = v53 - 2;
              if (v53 < 2) {
                puts("e: data_sz underflow in get_value");
              }
              *(_DWORD *)(*(void *)(a1 + 2840) + v48) = v54;
              break;
            case 3:
LABEL_70:
              int v49 = *(unsigned __int16 **)(a1 + 3896);
              int v50 = *v49;
              *(void *)(a1 + 3896) = v49 + 1;
              LODWORD(v49) = *(_DWORD *)(a1 + 3904);
              *(_DWORD *)(a1 + 3904) = v49 - 2;
              if (v49 < 2) {
                puts("e: data_sz underflow in get_value");
              }
              *(_DWORD *)(*(void *)(a1 + 2840) + v47) = v50;
              break;
            default:
              unsigned int v51 = *(unsigned __int16 **)(a1 + 3896);
              int v52 = *v51;
              *(void *)(a1 + 3896) = v51 + 1;
              LODWORD(v51) = *(_DWORD *)(a1 + 3904);
              *(_DWORD *)(a1 + 3904) = v51 - 2;
              if (v51 < 2) {
                puts("e: data_sz underflow in get_value");
              }
              *(_DWORD *)(*(void *)(a1 + 2840) + v46 + 12) = v52;
              break;
          }
          v48 += 52;
          v47 += 48;
          v46 += 28;
          if (v37 == v46)
          {
            uint64_t v55 = 0;
            uint64_t v56 = 16;
            uint64_t v57 = 16;
            while (1)
            {
              switch(v3)
              {
                case 1:
                  goto LABEL_84;
                case 6:
                  int v62 = *(unsigned __int16 **)(a1 + 3896);
                  int v63 = *v62;
                  *(void *)(a1 + 3896) = v62 + 1;
                  LODWORD(v62) = *(_DWORD *)(a1 + 3904);
                  *(_DWORD *)(a1 + 3904) = v62 - 2;
                  if (v62 < 2) {
                    puts("e: data_sz underflow in get_value");
                  }
                  *(_DWORD *)(*(void *)(a1 + 2840) + v57) = v63;
                  break;
                case 3:
LABEL_84:
                  unsigned int v58 = *(unsigned __int16 **)(a1 + 3896);
                  int v59 = *v58;
                  *(void *)(a1 + 3896) = v58 + 1;
                  LODWORD(v58) = *(_DWORD *)(a1 + 3904);
                  *(_DWORD *)(a1 + 3904) = v58 - 2;
                  if (v58 < 2) {
                    puts("e: data_sz underflow in get_value");
                  }
                  *(_DWORD *)(*(void *)(a1 + 2840) + v56) = v59;
                  break;
                default:
                  unsigned int v60 = *(unsigned __int16 **)(a1 + 3896);
                  int v61 = *v60;
                  *(void *)(a1 + 3896) = v60 + 1;
                  LODWORD(v60) = *(_DWORD *)(a1 + 3904);
                  *(_DWORD *)(a1 + 3904) = v60 - 2;
                  if (v60 < 2) {
                    puts("e: data_sz underflow in get_value");
                  }
                  *(_DWORD *)(*(void *)(a1 + 2840) + v55 + 16) = v61;
                  break;
              }
              v57 += 52;
              v56 += 48;
              v55 += 28;
              if (v37 == v55)
              {
                uint64_t v64 = 0;
                uint64_t v65 = 20;
                uint64_t v66 = 20;
                while (1)
                {
                  switch(v3)
                  {
                    case 1:
                      goto LABEL_98;
                    case 6:
                      unint64_t v71 = *(unsigned __int16 **)(a1 + 3896);
                      int v72 = *v71;
                      *(void *)(a1 + 3896) = v71 + 1;
                      LODWORD(v71) = *(_DWORD *)(a1 + 3904);
                      *(_DWORD *)(a1 + 3904) = v71 - 2;
                      if (v71 < 2) {
                        puts("e: data_sz underflow in get_value");
                      }
                      *(_DWORD *)(*(void *)(a1 + 2840) + v66) = v72;
                      break;
                    case 3:
LABEL_98:
                      unsigned int v67 = *(unsigned __int16 **)(a1 + 3896);
                      int v68 = *v67;
                      *(void *)(a1 + 3896) = v67 + 1;
                      LODWORD(v67) = *(_DWORD *)(a1 + 3904);
                      *(_DWORD *)(a1 + 3904) = v67 - 2;
                      if (v67 < 2) {
                        puts("e: data_sz underflow in get_value");
                      }
                      *(_DWORD *)(*(void *)(a1 + 2840) + v65) = v68;
                      break;
                    default:
                      int v69 = *(unsigned __int16 **)(a1 + 3896);
                      int v70 = *v69;
                      *(void *)(a1 + 3896) = v69 + 1;
                      LODWORD(v69) = *(_DWORD *)(a1 + 3904);
                      *(_DWORD *)(a1 + 3904) = v69 - 2;
                      if (v69 < 2) {
                        puts("e: data_sz underflow in get_value");
                      }
                      *(_DWORD *)(*(void *)(a1 + 2840) + v64 + 20) = v70;
                      break;
                  }
                  v66 += 52;
                  v65 += 48;
                  v64 += 28;
                  if (v37 == v64) {
                    goto LABEL_111;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_111:
  if (v101 - *(void *)(a1 + 3896) < v100)
  {
    BOOL v7 = "e: underflow while reading interp_factor";
    goto LABEL_157;
  }
  if (v104)
  {
    uint64_t v73 = 0;
    uint64_t v74 = 28 * v104;
    uint64_t v75 = 24;
    uint64_t v76 = 24;
    while (1)
    {
      switch(v3)
      {
        case 1:
          goto LABEL_121;
        case 6:
          int v81 = *(unsigned __int8 **)(a1 + 3896);
          int v82 = *v81;
          *(void *)(a1 + 3896) = v81 + 1;
          LODWORD(v81) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v81 - 1;
          if (!v81) {
            puts("e: data_sz underflow in get_value");
          }
          *(_DWORD *)(*(void *)(a1 + 2840) + v76) = v82;
          break;
        case 3:
LABEL_121:
          uint64_t v79 = *(unsigned __int8 **)(a1 + 3896);
          int v80 = *v79;
          *(void *)(a1 + 3896) = v79 + 1;
          LODWORD(v79) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v79 - 1;
          if (!v79) {
            puts("e: data_sz underflow in get_value");
          }
          *(_DWORD *)(*(void *)(a1 + 2840) + v75) = v80;
          break;
        default:
          uint64_t v77 = *(unsigned __int8 **)(a1 + 3896);
          int v78 = *v77;
          *(void *)(a1 + 3896) = v77 + 1;
          LODWORD(v77) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v77 - 1;
          if (!v77) {
            puts("e: data_sz underflow in get_value");
          }
          *(_DWORD *)(*(void *)(a1 + 2840) + v73 + 24) = v78;
          break;
      }
      v76 += 52;
      v75 += 48;
      v73 += 28;
      if (v74 == v73)
      {
        uint64_t v83 = 0;
        uint64_t v84 = 28;
        uint64_t v85 = 28;
        while (1)
        {
          switch(v3)
          {
            case 1:
              goto LABEL_135;
            case 6:
              unsigned int v90 = *(unsigned __int8 **)(a1 + 3896);
              int v91 = *v90;
              *(void *)(a1 + 3896) = v90 + 1;
              LODWORD(v90) = *(_DWORD *)(a1 + 3904);
              *(_DWORD *)(a1 + 3904) = v90 - 1;
              if (!v90) {
                puts("e: data_sz underflow in get_value");
              }
              *(_DWORD *)(*(void *)(a1 + 2840) + v85) = v91;
              break;
            case 3:
LABEL_135:
              __int16 v88 = *(unsigned __int8 **)(a1 + 3896);
              int v89 = *v88;
              *(void *)(a1 + 3896) = v88 + 1;
              LODWORD(v88) = *(_DWORD *)(a1 + 3904);
              *(_DWORD *)(a1 + 3904) = v88 - 1;
              if (!v88) {
                puts("e: data_sz underflow in get_value");
              }
              *(_DWORD *)(*(void *)(a1 + 2840) + v84) = v89;
              break;
            default:
              unsigned int v86 = *(unsigned __int8 **)(a1 + 3896);
              int v87 = *v86;
              *(void *)(a1 + 3896) = v86 + 1;
              LODWORD(v86) = *(_DWORD *)(a1 + 3904);
              *(_DWORD *)(a1 + 3904) = v86 - 1;
              if (!v86) {
                puts("e: data_sz underflow in get_value");
              }
              *(_DWORD *)(*(void *)(a1 + 2840) + v83 + 28) = v87;
              break;
          }
          v85 += 52;
          v84 += 48;
          v83 += 28;
          if (v74 == v83) {
            goto LABEL_143;
          }
        }
      }
    }
  }
LABEL_143:
  uint64_t v92 = *(void *)(a1 + 3896) + 2;
  *(void *)(a1 + 3896) = v92;
  unsigned int v93 = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v93 - 2;
  if (v93 < 2)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v92 = *(void *)(a1 + 3896);
  }
  if (v99 - v92 >= 0) {
    uint64_t v94 = -((v99 - v92) & 3);
  }
  else {
    LODWORD(v94) = (v92 - v99) & 3;
  }
  if (v94)
  {
    int v95 = v94 - 4;
    do
    {
      ++*(void *)(a1 + 3896);
      int v96 = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v96 - 1;
      if (!v96) {
        puts("e: data_sz underflow in get_value");
      }
    }
    while (!__CFADD__(v95++, 1));
    uint64_t v92 = *(void *)(a1 + 3896);
  }
  if (v92 != v101)
  {
    BOOL v7 = "e: parsing did not consume the full RCFG size";
    goto LABEL_157;
  }
  return 1;
}

uint64_t sub_100016EE4(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) != 0x20000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  int v3 = *(_DWORD *)(a1 + 2832);
  switch(v3)
  {
    case 1:
      uint64_t v4 = *(void *)(a1 + 2840);
      uint64_t v5 = (unsigned int *)(v4 + 2327536);
      break;
    case 6:
      uint64_t v4 = *(void *)(a1 + 2840);
      uint64_t v5 = (unsigned int *)(v4 + 1876064);
      break;
    case 3:
      uint64_t v4 = *(void *)(a1 + 2840);
      uint64_t v5 = (unsigned int *)(v4 + 1918576);
      break;
    default:
      printf("e: mismatching versions: %u != 1,3,6\n");
      return 0;
  }
  if (4 * *(_DWORD *)(a2 + 8) == 12)
  {
    BOOL v16 = "e: underflow while temperature / brightness";
    goto LABEL_19;
  }
  int v6 = *(unsigned char **)(a1 + 3896);
  BOOL v7 = &v6[4 * *(_DWORD *)(a2 + 8) - 12];
  uint64_t v8 = *v5;
  uint64_t v128 = v5[2];
  if (v3 == 6)
  {
    char v33 = (__int16 *)(v6 + 1);
    char v34 = *v6;
    *(void *)(a1 + 3896) = v6 + 1;
    int v35 = *(_DWORD *)(a1 + 3904);
    BOOL v21 = v35 != 0;
    unsigned int v36 = v35 - 1;
    *(_DWORD *)(a1 + 3904) = v36;
    if (!v21)
    {
      puts("e: data_sz underflow in get_value");
      uint64_t v4 = *(void *)(a1 + 2840);
      char v33 = *(__int16 **)(a1 + 3896);
      unsigned int v36 = *(_DWORD *)(a1 + 3904);
    }
    *(unsigned char *)(v4 + 184538) = v34;
    __int16 v12 = *v33;
    *(void *)(a1 + 3896) = v33 + 1;
    *(_DWORD *)(a1 + 3904) = v36 - 2;
    if (v36 < 2) {
      puts("e: data_sz underflow in get_value");
    }
    uint64_t v13 = *(void *)(a1 + 2840);
    uint64_t v14 = 184536;
  }
  else
  {
    char v9 = *v6;
    *(void *)(a1 + 3896) = v6 + 1;
    int v10 = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v10 - 1;
    if (!v10)
    {
      puts("e: data_sz underflow in get_value");
      uint64_t v4 = *(void *)(a1 + 2840);
    }
    *(unsigned char *)(v4 + 319690) = v9;
    uint64_t v11 = *(__int16 **)(a1 + 3896);
    __int16 v12 = *v11;
    *(void *)(a1 + 3896) = v11 + 1;
    LODWORD(v11) = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v11 - 2;
    if (v11 < 2) {
      puts("e: data_sz underflow in get_value");
    }
    uint64_t v13 = *(void *)(a1 + 2840);
    uint64_t v14 = 319688;
  }
  *(_WORD *)(v13 + v14) = v12;
  uint64_t v15 = *(unsigned __int8 **)(a1 + 3896);
  if (v7 - v15 <= 5)
  {
    BOOL v16 = "e: underflow while reading sizes";
LABEL_19:
    puts(v16);
    return 0;
  }
  unsigned int v19 = *v15;
  uint64_t v18 = v15 + 1;
  uint64_t v111 = v19;
  *(void *)(a1 + 3896) = v18;
  int v20 = *(_DWORD *)(a1 + 3904);
  BOOL v21 = v20 != 0;
  int v22 = v20 - 1;
  *(_DWORD *)(a1 + 3904) = v22;
  if (!v21)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v18 = *(unsigned __int8 **)(a1 + 3896);
    int v22 = *(_DWORD *)(a1 + 3904);
  }
  unsigned int v24 = *v18;
  uint64_t v23 = v18 + 1;
  uint64_t v117 = v24;
  *(void *)(a1 + 3896) = v23;
  BOOL v21 = v22 != 0;
  int v25 = v22 - 1;
  *(_DWORD *)(a1 + 3904) = v25;
  if (!v21)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v23 = *(unsigned __int8 **)(a1 + 3896);
    int v25 = *(_DWORD *)(a1 + 3904);
  }
  unsigned int v28 = *v23;
  uint64_t v26 = v23 + 1;
  uint64_t v27 = v28;
  *(void *)(a1 + 3896) = v26;
  BOOL v21 = v25 != 0;
  int v29 = v25 - 1;
  *(_DWORD *)(a1 + 3904) = v29;
  if (!v21)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v26 = *(unsigned __int8 **)(a1 + 3896);
    int v29 = *(_DWORD *)(a1 + 3904);
  }
  unsigned int v31 = *v26;
  unint64_t v30 = (unsigned __int16 *)(v26 + 1);
  uint64_t v113 = v31;
  *(void *)(a1 + 3896) = v30;
  BOOL v21 = v29 != 0;
  unsigned int v32 = v29 - 1;
  *(_DWORD *)(a1 + 3904) = v32;
  if (!v21)
  {
    puts("e: data_sz underflow in get_value");
    unint64_t v30 = *(unsigned __int16 **)(a1 + 3896);
    unsigned int v32 = *(_DWORD *)(a1 + 3904);
  }
  uint64_t v129 = *v30;
  *(void *)(a1 + 3896) = v30 + 1;
  *(_DWORD *)(a1 + 3904) = v32 - 2;
  if (v32 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  if (v3 == 6 && v111 >= 6 || v3 != 6 && v111 >= 5)
  {
    printf("e: unsupported NAC: %u > %u\n");
    return 0;
  }
  if (v117 >= 5)
  {
    printf("e: unsupported NASVD: %u > %u\n");
    return 0;
  }
  if (v27 >= 3)
  {
    printf("e: unsupported NBC: %u > %u\n");
    return 0;
  }
  if (v113 >= 6)
  {
    printf("e: unsupported NBSVD: %u > %u\n");
    return 0;
  }
  if (v3 == 6 && v129 >= 0x81 || v3 != 6 && v129 >= 0x101)
  {
    printf("e: unsupported NHS: %u > %u\n");
    return 0;
  }
  if ((uint64_t)&v7[-*(void *)(a1 + 3896)] < (4 * v8 * v128 * v111 * v117 * v129))
  {
    BOOL v16 = "e: underflow while reading WgTypeA";
    goto LABEL_19;
  }
  int v95 = 4 * v8 * v128;
  uint64_t v102 = v8;
  uint64_t v103 = v27;
  uint64_t v94 = v6;
  int v96 = v7;
  int v37 = v129;
  int v38 = v117;
  if (v8)
  {
    uint64_t v39 = 0;
    uint64_t v100 = 216;
    uint64_t v98 = 200;
    do
    {
      uint64_t v97 = v39;
      if (v111)
      {
        uint64_t v40 = 0;
        uint64_t v106 = v100;
        uint64_t v108 = v98;
        do
        {
          uint64_t v104 = v40;
          if (v38)
          {
            uint64_t v41 = 0;
            uint64_t v124 = v108;
            uint64_t v120 = v106;
            do
            {
              uint64_t v114 = v41;
              if (v128)
              {
                uint64_t v42 = 0;
                uint64_t v43 = v120;
                uint64_t v44 = v124;
                do
                {
                  uint64_t v45 = v129;
                  uint64_t v46 = v44;
                  uint64_t v47 = v43;
                  if (v129)
                  {
                    do
                    {
                      if (v3 == 1 || v3 == 3)
                      {
                        uint64_t v48 = *(__int16 **)(a1 + 3896);
                        __int16 v49 = *v48;
                        *(void *)(a1 + 3896) = v48 + 1;
                        LODWORD(v48) = *(_DWORD *)(a1 + 3904);
                        *(_DWORD *)(a1 + 3904) = v48 - 2;
                        if (v48 < 2) {
                          puts("e: data_sz underflow in get_value");
                        }
                        *(_WORD *)(*(void *)(a1 + 2840) + v46) = v49;
                      }
                      else
                      {
                        int v50 = *(__int16 **)(a1 + 3896);
                        __int16 v51 = *v50;
                        *(void *)(a1 + 3896) = v50 + 1;
                        LODWORD(v50) = *(_DWORD *)(a1 + 3904);
                        *(_DWORD *)(a1 + 3904) = v50 - 2;
                        if (v50 < 2) {
                          puts("e: data_sz underflow in get_value");
                        }
                        *(_WORD *)(*(void *)(a1 + 2840) + v47) = v51;
                      }
                      v47 += 4;
                      v46 += 4;
                      --v45;
                    }
                    while (v45);
                  }
                  ++v42;
                  v43 += 512;
                  v44 += 1024;
                }
                while (v42 != v128);
              }
              uint64_t v41 = v114 + 1;
              v120 += 1536;
              v124 += 3072;
              int v38 = v117;
            }
            while (v114 + 1 != v117);
          }
          uint64_t v40 = v104 + 1;
          v106 += 6144;
          v108 += 12288;
        }
        while (v104 + 1 != v111);
      }
      uint64_t v39 = v97 + 1;
      v100 += 30720;
      v98 += 49152;
    }
    while (v97 + 1 != v102);
    uint64_t v52 = 0;
    uint64_t v109 = 216;
    int v37 = v129;
    do
    {
      if (v111)
      {
        uint64_t v53 = 0;
        uint64_t v115 = v109;
        do
        {
          if (v38)
          {
            uint64_t v54 = 0;
            uint64_t v121 = v115;
            do
            {
              if (v128)
              {
                uint64_t v55 = 0;
                uint64_t v125 = v121;
                do
                {
                  if (v37)
                  {
                    uint64_t v56 = 0;
                    uint64_t v57 = v129;
                    uint64_t v58 = v125;
                    do
                    {
                      if (v3 == 1 || v3 == 3)
                      {
                        int v59 = *(__int16 **)(a1 + 3896);
                        __int16 v60 = *v59;
                        *(void *)(a1 + 3896) = v59 + 1;
                        LODWORD(v59) = *(_DWORD *)(a1 + 3904);
                        *(_DWORD *)(a1 + 3904) = v59 - 2;
                        if (v59 < 2) {
                          puts("e: data_sz underflow in get_value");
                        }
                        uint64_t v61 = *(void *)(a1 + 2840)
                            + 49152 * v52
                            + 12288 * v53
                            + 3072 * v54
                            + (v55 << 10)
                            + 4 * v56
                            + 200;
                      }
                      else
                      {
                        int v62 = *(__int16 **)(a1 + 3896);
                        __int16 v60 = *v62;
                        *(void *)(a1 + 3896) = v62 + 1;
                        LODWORD(v62) = *(_DWORD *)(a1 + 3904);
                        *(_DWORD *)(a1 + 3904) = v62 - 2;
                        if (v62 < 2) {
                          puts("e: data_sz underflow in get_value");
                        }
                        uint64_t v61 = *(void *)(a1 + 2840) + v58;
                      }
                      *(_WORD *)(v61 + 2) = v60;
                      ++v56;
                      v58 += 4;
                      --v57;
                    }
                    while (v57);
                  }
                  ++v55;
                  v125 += 512;
                  int v37 = v129;
                }
                while (v55 != v128);
              }
              ++v54;
              v121 += 1536;
              int v38 = v117;
            }
            while (v54 != v117);
          }
          ++v53;
          v115 += 6144;
        }
        while (v53 != v111);
      }
      ++v52;
      v109 += 30720;
      LODWORD(v8) = v102;
    }
    while (v52 != v102);
  }
  int v63 = v103;
  int v64 = v113;
  if ((uint64_t)&v96[-*(void *)(a1 + 3896)] < (v95 * v103 * v113 * v37))
  {
    BOOL v16 = "e: underflow while reading WgTypeB";
    goto LABEL_19;
  }
  if (v8)
  {
    uint64_t v65 = 0;
    uint64_t v105 = 196808;
    uint64_t v107 = 123096;
    uint64_t v101 = 123096;
    do
    {
      uint64_t v99 = v65;
      if (v63)
      {
        uint64_t v66 = 0;
        uint64_t v116 = v105;
        uint64_t v112 = v101;
        do
        {
          uint64_t v110 = v66;
          if (v64)
          {
            uint64_t v67 = 0;
            uint64_t v126 = v116;
            uint64_t v122 = v112;
            do
            {
              uint64_t v118 = v67;
              if (v128)
              {
                uint64_t v68 = 0;
                uint64_t v70 = v122;
                uint64_t v69 = v126;
                do
                {
                  uint64_t v71 = v129;
                  uint64_t v72 = v69;
                  uint64_t v73 = v70;
                  if (v129)
                  {
                    do
                    {
                      if (v3 == 1 || v3 == 3)
                      {
                        uint64_t v74 = *(__int16 **)(a1 + 3896);
                        __int16 v75 = *v74;
                        *(void *)(a1 + 3896) = v74 + 1;
                        LODWORD(v74) = *(_DWORD *)(a1 + 3904);
                        *(_DWORD *)(a1 + 3904) = v74 - 2;
                        if (v74 < 2) {
                          puts("e: data_sz underflow in get_value");
                        }
                        *(_WORD *)(*(void *)(a1 + 2840) + v72) = v75;
                      }
                      else
                      {
                        uint64_t v76 = *(__int16 **)(a1 + 3896);
                        __int16 v77 = *v76;
                        *(void *)(a1 + 3896) = v76 + 1;
                        LODWORD(v76) = *(_DWORD *)(a1 + 3904);
                        *(_DWORD *)(a1 + 3904) = v76 - 2;
                        if (v76 < 2) {
                          puts("e: data_sz underflow in get_value");
                        }
                        *(_WORD *)(*(void *)(a1 + 2840) + v73) = v77;
                      }
                      v73 += 4;
                      v72 += 4;
                      --v71;
                    }
                    while (v71);
                  }
                  ++v68;
                  v70 += 512;
                  v69 += 1024;
                }
                while (v68 != v128);
              }
              uint64_t v67 = v118 + 1;
              v122 += 1536;
              v126 += 3072;
              int v64 = v113;
            }
            while (v118 + 1 != v113);
          }
          uint64_t v66 = v110 + 1;
          v112 += 7680;
          v116 += 15360;
          int v63 = v103;
        }
        while (v110 + 1 != v103);
      }
      uint64_t v65 = v99 + 1;
      v101 += 15360;
      v105 += 30720;
    }
    while (v99 + 1 != v102);
    uint64_t v78 = 0;
    do
    {
      if (v63)
      {
        uint64_t v79 = 0;
        uint64_t v119 = v107;
        do
        {
          if (v64)
          {
            uint64_t v80 = 0;
            uint64_t v123 = v119;
            do
            {
              if (v128)
              {
                uint64_t v81 = 0;
                uint64_t v127 = v123;
                do
                {
                  if (v129)
                  {
                    uint64_t v82 = 0;
                    uint64_t v83 = v129;
                    uint64_t v84 = v127;
                    do
                    {
                      if (v3 == 1 || v3 == 3)
                      {
                        uint64_t v85 = *(__int16 **)(a1 + 3896);
                        __int16 v86 = *v85;
                        *(void *)(a1 + 3896) = v85 + 1;
                        LODWORD(v85) = *(_DWORD *)(a1 + 3904);
                        *(_DWORD *)(a1 + 3904) = v85 - 2;
                        if (v85 < 2) {
                          puts("e: data_sz underflow in get_value");
                        }
                        uint64_t v87 = *(void *)(a1 + 2840)
                            + 30720 * v78
                            + 15360 * v79
                            + 3072 * v80
                            + (v81 << 10)
                            + 4 * v82
                            + 196808;
                      }
                      else
                      {
                        __int16 v88 = *(__int16 **)(a1 + 3896);
                        __int16 v86 = *v88;
                        *(void *)(a1 + 3896) = v88 + 1;
                        LODWORD(v88) = *(_DWORD *)(a1 + 3904);
                        *(_DWORD *)(a1 + 3904) = v88 - 2;
                        if (v88 < 2) {
                          puts("e: data_sz underflow in get_value");
                        }
                        uint64_t v87 = *(void *)(a1 + 2840) + v84;
                      }
                      *(_WORD *)(v87 + 2) = v86;
                      ++v82;
                      v84 += 4;
                      --v83;
                    }
                    while (v83);
                  }
                  ++v81;
                  v127 += 512;
                }
                while (v81 != v128);
              }
              ++v80;
              v123 += 1536;
              int v64 = v113;
            }
            while (v80 != v113);
          }
          ++v79;
          v119 += 7680;
          int v63 = v103;
        }
        while (v79 != v103);
      }
      ++v78;
      v107 += 15360;
    }
    while (v78 != v102);
  }
  uint64_t v89 = *(void *)(a1 + 3896) + 2;
  *(void *)(a1 + 3896) = v89;
  unsigned int v90 = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v90 - 2;
  if (v90 < 2)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v89 = *(void *)(a1 + 3896);
  }
  if ((uint64_t)&v94[-v89] >= 0) {
    uint64_t v91 = -(uint64_t)((unint64_t)&v94[-v89] & 3);
  }
  else {
    LODWORD(v91) = (v89 - v94) & 3;
  }
  if (v91)
  {
    int v92 = v91 - 4;
    do
    {
      ++*(void *)(a1 + 3896);
      int v93 = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v93 - 1;
      if (!v93) {
        puts("e: data_sz underflow in get_value");
      }
      BOOL v21 = __CFADD__(v92++, 1);
    }
    while (!v21);
    uint64_t v89 = *(void *)(a1 + 3896);
  }
  if ((unsigned char *)v89 == v96) {
    return 1;
  }
  puts("e: parsing did not consume the full HTMP size");
  uint64_t result = 0;
  *(void *)(a1 + 3896) = v96;
  return result;
}

uint64_t sub_100017A58(uint64_t a1, uint64_t a2)
{
  uint64_t v72 = *(_DWORD **)(a1 + 2840);
  int v4 = *(_DWORD *)(a2 + 4);
  if (v4 != 0x10000 && v4 != 0x20000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  if (*v72 != 1)
  {
    printf("e: mismatching versions: %u != %u\n");
    return 0;
  }
  uint64_t v5 = (char *)malloc_type_calloc(1uLL, 0x2888uLL, 0x1000040BB29BD8AuLL);
  if (!v5)
  {
    uint64_t v40 = "e: out of memory for EMMK table";
LABEL_100:
    puts(v40);
    return 0;
  }
  int v6 = 4 * *(_DWORD *)(a2 + 8);
  uint64_t v7 = (v6 - 12);
  if (v6 == 12)
  {
    uint64_t v40 = "e: underflow while reading indices";
    goto LABEL_100;
  }
  uint64_t v8 = v5;
  char v9 = v5 + 10368;
  int v10 = *(unsigned char **)(a1 + 3896);
  unint64_t v77 = v72[581889];
  unint64_t v11 = v72[581884];
  unint64_t v12 = v72[581885];
  uint64_t v13 = (__int16 *)(v10 + 1);
  char v14 = *v10;
  *(void *)(a1 + 3896) = v10 + 1;
  int v15 = *(_DWORD *)(a1 + 3904);
  BOOL v23 = v15 != 0;
  unsigned int v16 = v15 - 1;
  *(_DWORD *)(a1 + 3904) = v16;
  if (!v23)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v13 = *(__int16 **)(a1 + 3896);
    unsigned int v16 = *(_DWORD *)(a1 + 3904);
  }
  v9[2] = v14;
  __int16 v17 = *v13;
  *(void *)(a1 + 3896) = v13 + 1;
  *(_DWORD *)(a1 + 3904) = v16 - 2;
  if (v16 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  uint64_t v18 = 0;
  uint64_t v67 = v10;
  uint64_t v69 = &v10[v7];
  *(_WORD *)char v9 = v17;
  uint64_t v68 = v8;
  uint64_t v73 = v8 + 6912;
  do
  {
    uint64_t v70 = v18;
    if (*((unsigned char *)v72 + v18 + 2327589))
    {
      if ((uint64_t)&v69[-*(void *)(a1 + 3896)] < (4 * v77 * v11 * v12))
      {
        uint64_t v40 = "e: underflow while reading R/G/BGLALS";
        goto LABEL_100;
      }
      unint64_t v19 = 0;
      int v20 = v73;
      do
      {
        unint64_t v21 = 0;
        __int16 v75 = v20;
        do
        {
          unint64_t v22 = 0;
          BOOL v23 = v19 >= v11 || v21 >= v77;
          int v24 = !v23;
          do
          {
            if (v22 < v12) {
              int v25 = v24;
            }
            else {
              int v25 = 0;
            }
            float v26 = 0.0;
            if (v25 == 1)
            {
              uint64_t v27 = *(unsigned int **)(a1 + 3896);
              unsigned int v28 = *v27;
              *(void *)(a1 + 3896) = v27 + 1;
              LODWORD(v27) = *(_DWORD *)(a1 + 3904);
              *(_DWORD *)(a1 + 3904) = v27 - 4;
              if (v27 < 4) {
                puts("e: data_sz underflow in get_value");
              }
              float v26 = (float)v28 * 0.00048828;
            }
            *(float *)&v20[4 * v22++] = v26;
          }
          while (v22 != 6);
          ++v21;
          v20 += 24;
        }
        while (v21 != 12);
        ++v19;
        int v20 = v75 + 288;
      }
      while (v19 != 4);
    }
    uint64_t v18 = v70 + 1;
    v73 += 1152;
  }
  while (v70 != 2);
  uint64_t v29 = 0;
  uint64_t v74 = v68;
  do
  {
    uint64_t v71 = v29;
    if (*((unsigned char *)v72 + v29 + 2327589))
    {
      if ((uint64_t)&v69[-*(void *)(a1 + 3896)] < (8 * v77 * v11 * v12))
      {
        uint64_t v40 = "e: underflow while reading R/G/BGLACSS";
        goto LABEL_100;
      }
      unint64_t v30 = 0;
      unsigned int v31 = v74;
      do
      {
        unint64_t v32 = 0;
        uint64_t v76 = v31;
        do
        {
          unint64_t v33 = 0;
          BOOL v35 = v30 < v11 && v32 < v77;
          do
          {
            if (v33 < v12 && v35)
            {
              int v37 = *(uint64_t **)(a1 + 3896);
              uint64_t v38 = *v37;
              *(void *)(a1 + 3896) = v37 + 1;
              LODWORD(v37) = *(_DWORD *)(a1 + 3904);
              *(_DWORD *)(a1 + 3904) = v37 - 8;
              if (v37 < 8) {
                puts("e: data_sz underflow in get_long_value");
              }
            }
            else
            {
              uint64_t v38 = 0;
            }
            *(void *)&v31[8 * v33++] = v38;
          }
          while (v33 != 6);
          ++v32;
          v31 += 48;
        }
        while (v32 != 12);
        ++v30;
        unsigned int v31 = v76 + 576;
      }
      while (v30 != 4);
    }
    uint64_t v29 = v71 + 1;
    v74 += 2304;
  }
  while (v71 != 2);
  uint64_t v39 = *(void *)(a1 + 3896);
  if ((uint64_t)&v69[-v39] <= 5)
  {
    uint64_t v40 = "e: underflow while reading GSC scalers";
    goto LABEL_100;
  }
  uint64_t v41 = v39 + 2;
  *(void *)(a1 + 3896) = v41;
  unsigned int v42 = *(_DWORD *)(a1 + 3904);
  BOOL v23 = v42 >= 2;
  unsigned int v43 = v42 - 2;
  *(_DWORD *)(a1 + 3904) = v43;
  if (!v23)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v41 = *(void *)(a1 + 3896);
    unsigned int v43 = *(_DWORD *)(a1 + 3904);
  }
  uint64_t v44 = v41 + 2;
  *(void *)(a1 + 3896) = v44;
  BOOL v23 = v43 >= 2;
  unsigned int v45 = v43 - 2;
  *(_DWORD *)(a1 + 3904) = v45;
  if (!v23)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v44 = *(void *)(a1 + 3896);
    unsigned int v45 = *(_DWORD *)(a1 + 3904);
  }
  uint64_t v46 = v44 + 2;
  *(void *)(a1 + 3896) = v46;
  *(_DWORD *)(a1 + 3904) = v45 - 2;
  if (v45 < 2)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v46 = *(void *)(a1 + 3896);
  }
  if ((uint64_t)&v69[-v46] <= 1)
  {
    uint64_t v40 = "e: underflow while reading GSC spare";
    goto LABEL_100;
  }
  *(void *)(a1 + 3896) = v46 + 2;
  unsigned int v47 = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v47 - 2;
  if (v47 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  uint64_t v48 = *(void ***)(a1 + 3824);
  __int16 v49 = v48[1];
  unint64_t v50 = (unint64_t)v48[2];
  if ((unint64_t)v49 >= v50)
  {
    uint64_t v52 = ((char *)v49 - (unsigned char *)*v48) >> 3;
    if ((unint64_t)(v52 + 1) >> 61) {
      sub_100009CF0();
    }
    uint64_t v53 = v50 - (void)*v48;
    uint64_t v54 = v53 >> 2;
    if (v53 >> 2 <= (unint64_t)(v52 + 1)) {
      uint64_t v54 = v52 + 1;
    }
    if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v55 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v55 = v54;
    }
    if (v55) {
      uint64_t v56 = (char *)sub_100021970((uint64_t)(v48 + 2), v55);
    }
    else {
      uint64_t v56 = 0;
    }
    uint64_t v57 = &v56[8 * v52];
    uint64_t v58 = &v56[8 * v55];
    *(void *)uint64_t v57 = v68;
    __int16 v51 = v57 + 8;
    __int16 v60 = (char *)*v48;
    int v59 = (char *)v48[1];
    if (v59 != *v48)
    {
      do
      {
        uint64_t v61 = *((void *)v59 - 1);
        v59 -= 8;
        *((void *)v57 - 1) = v61;
        v57 -= 8;
      }
      while (v59 != v60);
      int v59 = (char *)*v48;
    }
    *uint64_t v48 = v57;
    v48[1] = v51;
    _OWORD v48[2] = v58;
    if (v59) {
      operator delete(v59);
    }
  }
  else
  {
    void *v49 = v68;
    __int16 v51 = v49 + 1;
  }
  v48[1] = v51;
  int v62 = *(unsigned char **)(a1 + 3896);
  if (v67 - v62 >= 0) {
    uint64_t v63 = -((v67 - v62) & 3);
  }
  else {
    LODWORD(v63) = (v62 - v67) & 3;
  }
  if (v63)
  {
    int v64 = v63 - 4;
    do
    {
      ++*(void *)(a1 + 3896);
      int v65 = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v65 - 1;
      if (!v65) {
        puts("e: data_sz underflow in get_value");
      }
      BOOL v23 = __CFADD__(v64++, 1);
    }
    while (!v23);
    int v62 = *(unsigned char **)(a1 + 3896);
  }
  if (v62 != v69)
  {
    uint64_t v40 = "e: parsing did not consume the full GSC size";
    goto LABEL_100;
  }
  return 1;
}

uint64_t sub_100018024(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) != 196608)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 2840);
  if (*(_DWORD *)v3 != 1)
  {
    printf("e: mismatching versions: %u != %u\n");
    return 0;
  }
  uint64_t v5 = malloc_type_calloc(1uLL, 0x248uLL, 0x10000402A0B50A7uLL);
  int v64 = v5;
  if (!v5)
  {
    int v20 = "e: out of memory for EMMK table";
    goto LABEL_84;
  }
  int v6 = 4 * *(_DWORD *)(a2 + 8);
  uint64_t v7 = (v6 - 12);
  if (v6 == 12)
  {
    int v20 = "e: underflow while reading indices";
    goto LABEL_84;
  }
  uint64_t v8 = v5;
  char v9 = *(unsigned char **)(a1 + 3896);
  unint64_t v10 = *(unsigned int *)(v3 + 2327560);
  unint64_t v11 = *(unsigned int *)(v3 + 2327564);
  int v12 = *(_DWORD *)(v3 + 2327540);
  uint64_t v13 = (__int16 *)(v9 + 1);
  char v14 = *v9;
  *(void *)(a1 + 3896) = v9 + 1;
  int v15 = *(_DWORD *)(a1 + 3904);
  BOOL v16 = v15 != 0;
  unsigned int v17 = v15 - 1;
  *(_DWORD *)(a1 + 3904) = v17;
  if (!v16)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v13 = *(__int16 **)(a1 + 3896);
    unsigned int v17 = *(_DWORD *)(a1 + 3904);
  }
  v8[578] = v14;
  __int16 v18 = *v13;
  *(void *)(a1 + 3896) = v13 + 1;
  *(_DWORD *)(a1 + 3904) = v17 - 2;
  if (v17 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  *((_WORD *)v8 + 288) = v18;
  uint64_t v61 = &v9[v7];
  if (*(unsigned char *)(v3 + 2327584))
  {
    unint64_t v19 = (v11 + 1);
    if ((uint64_t)&v9[v7 - *(void *)(a1 + 3896)] < (2 * v10 * v19))
    {
      int v20 = "e: underflow while reading EM mask delay";
LABEL_84:
      puts(v20);
      return 0;
    }
    uint64_t v62 = v3;
    int v58 = v12;
    int v59 = v9;
    unint64_t v22 = 0;
    BOOL v23 = v8 + 288;
    do
    {
      for (unint64_t i = 0; i != 4; ++i)
      {
        __int16 v25 = 0;
        if (v22 < v10 && i < v19)
        {
          float v26 = *(__int16 **)(a1 + 3896);
          __int16 v25 = *v26;
          *(void *)(a1 + 3896) = v26 + 1;
          LODWORD(v26) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v26 - 2;
          if (v26 < 2) {
            puts("e: data_sz underflow in get_value");
          }
        }
        *(_WORD *)&v23[2 * i] = v25;
      }
      ++v22;
      v23 += 8;
    }
    while (v22 != 9);
    int v21 = 2 * v10;
  }
  else
  {
    uint64_t v62 = v3;
    int v58 = v12;
    int v59 = v9;
    int v21 = 2 * v10;
  }
  uint64_t v27 = 0;
  uint64_t v60 = (v21 * v11);
  uint64_t v63 = v8 + 360;
  do
  {
    if (*(unsigned char *)(v62 + v27 + 2327585))
    {
      if ((uint64_t)&v61[-*(void *)(a1 + 3896)] < v60)
      {
        int v20 = "e: underflow while reading EM mask";
        goto LABEL_84;
      }
      unint64_t v28 = 0;
      uint64_t v29 = v63;
      do
      {
        for (unint64_t j = 0; j != 3; ++j)
        {
          __int16 v31 = 0;
          if (v28 < v10 && j < v11)
          {
            unint64_t v32 = *(__int16 **)(a1 + 3896);
            __int16 v31 = *v32;
            *(void *)(a1 + 3896) = v32 + 1;
            LODWORD(v32) = *(_DWORD *)(a1 + 3904);
            *(_DWORD *)(a1 + 3904) = v32 - 2;
            if (v32 < 2) {
              puts("e: data_sz underflow in get_value");
            }
          }
          *(_WORD *)&v29[2 * j] = v31;
        }
        ++v28;
        v29 += 6;
      }
      while (v28 != 9);
    }
    ++v27;
    v63 += 54;
  }
  while (v27 != 4);
  uint64_t v33 = 0;
  unint64_t v34 = (v11 - 1);
  do
  {
    if (*(unsigned char *)(v62 + v33 + 2327585))
    {
      if ((uint64_t)&v61[-*(void *)(a1 + 3896)] < (4 * v10 * v34))
      {
        int v20 = "e: underflow while reading EM band steps";
        goto LABEL_84;
      }
      for (unint64_t k = 0; k != 9; ++k)
      {
        unint64_t v36 = 0;
        char v37 = 1;
        do
        {
          int v38 = 0;
          char v39 = v37;
          if (k < v10 && v36 < v34)
          {
            uint64_t v40 = *(int **)(a1 + 3896);
            int v38 = *v40;
            *(void *)(a1 + 3896) = v40 + 1;
            LODWORD(v40) = *(_DWORD *)(a1 + 3904);
            *(_DWORD *)(a1 + 3904) = v40 - 4;
            if (v40 < 4) {
              puts("e: data_sz underflow in get_value");
            }
          }
          char v37 = 0;
          *(_DWORD *)&v8[72 * v33 + 8 * k + 4 * v36] = v38;
          unint64_t v36 = 1;
        }
        while ((v39 & 1) != 0);
      }
    }
    ++v33;
  }
  while (v33 != 4);
  uint64_t v41 = *(void *)(a1 + 3896);
  if ((uint64_t)&v61[-v41] <= 5)
  {
    int v20 = "e: underflow while reading EMMK scalers";
    goto LABEL_84;
  }
  uint64_t v42 = v41 + 2;
  *(void *)(a1 + 3896) = v42;
  unsigned int v43 = *(_DWORD *)(a1 + 3904);
  BOOL v16 = v43 >= 2;
  unsigned int v44 = v43 - 2;
  *(_DWORD *)(a1 + 3904) = v44;
  if (!v16)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v42 = *(void *)(a1 + 3896);
    unsigned int v44 = *(_DWORD *)(a1 + 3904);
  }
  uint64_t v45 = v42 + 2;
  *(void *)(a1 + 3896) = v45;
  BOOL v16 = v44 >= 2;
  unsigned int v46 = v44 - 2;
  *(_DWORD *)(a1 + 3904) = v46;
  if (!v16)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v45 = *(void *)(a1 + 3896);
    unsigned int v46 = *(_DWORD *)(a1 + 3904);
  }
  uint64_t v47 = v45 + 2;
  *(void *)(a1 + 3896) = v47;
  *(_DWORD *)(a1 + 3904) = v46 - 2;
  if (v46 < 2)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v47 = *(void *)(a1 + 3896);
  }
  if ((uint64_t)&v61[-v47] < (16 * v58))
  {
    int v20 = "e: underflow while reading EM Counts";
    goto LABEL_84;
  }
  for (int m = 0; m != 4; ++m)
  {
    for (int n = v58; n; --n)
    {
      *(void *)(a1 + 3896) += 4;
      unsigned int v50 = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v50 - 4;
      if (v50 < 4) {
        puts("e: data_sz underflow in get_value");
      }
    }
  }
  uint64_t v51 = *(void *)(a1 + 3896);
  if ((uint64_t)&v61[-v51] < 2)
  {
    int v20 = "e: underflow while reading EMMK spare";
    goto LABEL_84;
  }
  *(void *)(a1 + 3896) = v51 + 2;
  unsigned int v52 = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v52 - 2;
  if (v52 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  sub_10001D124(*(void ***)(a1 + 3832), &v64);
  uint64_t v53 = *(unsigned char **)(a1 + 3896);
  if (v59 - v53 >= 0) {
    uint64_t v54 = -((v59 - v53) & 3);
  }
  else {
    LODWORD(v54) = (v53 - v59) & 3;
  }
  if (v54)
  {
    int v55 = v54 - 4;
    do
    {
      ++*(void *)(a1 + 3896);
      int v56 = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v56 - 1;
      if (!v56) {
        puts("e: data_sz underflow in get_value");
      }
      BOOL v16 = __CFADD__(v55++, 1);
    }
    while (!v16);
    uint64_t v53 = *(unsigned char **)(a1 + 3896);
  }
  if (v53 != v61)
  {
    int v20 = "e: parsing did not consume the full EMMK size";
    goto LABEL_84;
  }
  return 1;
}

uint64_t sub_1000185B0(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) != 0x20000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  uint64_t v3 = *(_DWORD **)(a1 + 2840);
  if (*v3 != 2)
  {
    printf("e: mismatching versions: %u != %u\n");
    return 0;
  }
  uint64_t v4 = (4 * *(_DWORD *)(a2 + 8) - 12);
  if (v4 <= 5)
  {
    uint64_t v5 = "e: cannot read data in CNST";
LABEL_5:
    puts(v5);
    return 0;
  }
  uint64_t v7 = *(void *)(a1 + 3896);
  uint64_t v8 = v7 + 1;
  *(void *)(a1 + 3896) = v7 + 1;
  int v9 = *(_DWORD *)(a1 + 3904);
  BOOL v10 = v9 != 0;
  int v11 = v9 - 1;
  *(_DWORD *)(a1 + 3904) = v11;
  if (!v10)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v8 = *(void *)(a1 + 3896);
    int v11 = *(_DWORD *)(a1 + 3904);
  }
  uint64_t v12 = v8 + 1;
  *(void *)(a1 + 3896) = v12;
  BOOL v10 = v11 != 0;
  int v13 = v11 - 1;
  *(_DWORD *)(a1 + 3904) = v13;
  if (!v10)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v12 = *(void *)(a1 + 3896);
    int v13 = *(_DWORD *)(a1 + 3904);
  }
  char v14 = (unsigned __int8 *)(v12 + 1);
  *(void *)(a1 + 3896) = v14;
  BOOL v10 = v13 != 0;
  int v15 = v13 - 1;
  *(_DWORD *)(a1 + 3904) = v15;
  if (!v10)
  {
    puts("e: data_sz underflow in get_value");
    char v14 = *(unsigned __int8 **)(a1 + 3896);
    int v15 = *(_DWORD *)(a1 + 3904);
  }
  unsigned int v16 = *v14;
  *(void *)(a1 + 3896) = v14 + 1;
  *(_DWORD *)(a1 + 3904) = v15 - 1;
  if (!v15) {
    puts("e: data_sz underflow in get_value");
  }
  if (v16 >= 5)
  {
    printf("e: unsupported region count: %u > %u\n");
    return 0;
  }
  unsigned int v17 = *(unsigned __int8 **)(a1 + 3896);
  unsigned int v18 = *v17;
  *(void *)(a1 + 3896) = v17 + 1;
  LODWORD(v17) = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v17 - 1;
  if (!v17) {
    puts("e: data_sz underflow in get_value");
  }
  if (v18 >= 2)
  {
    printf("e: unsupported sensor channel count: %u > %u\n");
    return 0;
  }
  unint64_t v19 = *(unsigned __int8 **)(a1 + 3896);
  int v22 = *v19;
  int v20 = v19 + 1;
  int v21 = v22;
  *(void *)(a1 + 3896) = v20;
  int v23 = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v23 - 1;
  if (!v23)
  {
    puts("e: data_sz underflow in get_value");
    int v20 = *(unsigned __int8 **)(a1 + 3896);
  }
  int v24 = (unsigned __int8 *)(v7 + v4);
  v3[3104] = v16;
  v3[3105] = v18;
  v3[3106] = v21;
  if (v7 - (uint64_t)v20 >= 0) {
    uint64_t v25 = -((v7 - (void)v20) & 3);
  }
  else {
    LODWORD(v25) = (v20 - v7) & 3;
  }
  if (v25)
  {
    int v26 = v25 - 4;
    do
    {
      ++*(void *)(a1 + 3896);
      int v27 = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v27 - 1;
      if (!v27) {
        puts("e: data_sz underflow in get_value");
      }
      BOOL v10 = __CFADD__(v26++, 1);
    }
    while (!v10);
    int v20 = *(unsigned __int8 **)(a1 + 3896);
  }
  if (v20 != v24)
  {
    uint64_t v5 = "e: parsing did not consume the full CNST size";
    goto LABEL_5;
  }
  return 1;
}

uint64_t sub_100018808(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) != 196608)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 2840);
  if (*(_DWORD *)v3 != 2)
  {
    printf("e: mismatching versions: %u != %u\n");
    return 0;
  }
  int v4 = 4 * *(_DWORD *)(a2 + 8);
  uint64_t v5 = (v4 - 12);
  if (v4 == 12)
  {
    unsigned int v18 = "e: underflow while temperature / brightness";
    goto LABEL_14;
  }
  int v6 = *(unsigned char **)(a1 + 3896);
  uint64_t v7 = *(unsigned int *)(v3 + 12416);
  uint64_t v8 = *(unsigned int *)(v3 + 12424);
  int v9 = v6 + 1;
  char v10 = *v6;
  *(void *)(a1 + 3896) = v6 + 1;
  int v11 = *(_DWORD *)(a1 + 3904);
  BOOL v12 = v11 != 0;
  unsigned int v13 = v11 - 1;
  *(_DWORD *)(a1 + 3904) = v13;
  if (!v12)
  {
    puts("e: data_sz underflow in get_value");
    int v9 = *(_WORD **)(a1 + 3896);
    unsigned int v13 = *(_DWORD *)(a1 + 3904);
  }
  char v14 = &v6[v5];
  *(unsigned char *)(v3 + 12410) = v10;
  __int16 v17 = *v9;
  int v15 = (unsigned __int8 *)(v9 + 1);
  __int16 v16 = v17;
  *(void *)(a1 + 3896) = v15;
  *(_DWORD *)(a1 + 3904) = v13 - 2;
  if (v13 < 2)
  {
    puts("e: data_sz underflow in get_value");
    int v15 = *(unsigned __int8 **)(a1 + 3896);
  }
  *(_WORD *)(v3 + 12408) = v16;
  if (v14 - v15 <= 3)
  {
    unsigned int v18 = "e: underflow while reading sizes";
LABEL_14:
    puts(v18);
    return 0;
  }
  int v22 = *v15;
  int v20 = v15 + 1;
  int v21 = v22;
  *(void *)(a1 + 3896) = v20;
  int v23 = *(_DWORD *)(a1 + 3904);
  BOOL v12 = v23 != 0;
  int v24 = v23 - 1;
  *(_DWORD *)(a1 + 3904) = v24;
  if (!v12)
  {
    puts("e: data_sz underflow in get_value");
    int v20 = *(unsigned __int8 **)(a1 + 3896);
    int v24 = *(_DWORD *)(a1 + 3904);
  }
  int v27 = *v20;
  uint64_t v25 = (unsigned __int16 *)(v20 + 1);
  int v26 = v27;
  *(void *)(a1 + 3896) = v25;
  BOOL v12 = v24 != 0;
  unsigned int v28 = v24 - 1;
  *(_DWORD *)(a1 + 3904) = v28;
  if (!v12)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v25 = *(unsigned __int16 **)(a1 + 3896);
    unsigned int v28 = *(_DWORD *)(a1 + 3904);
  }
  int v29 = *v25;
  *(void *)(a1 + 3896) = v25 + 1;
  *(_DWORD *)(a1 + 3904) = v28 - 2;
  if (v28 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  if (v21 != 1)
  {
    printf("e: unsupported NAC: %u != %u\n");
    return 0;
  }
  if (v26 != 4)
  {
    printf("e: unsupported NASVD: %u != %u\n");
    return 0;
  }
  if (v29 != 64)
  {
    printf("e: unsupported NHS: %u != %u\n");
    return 0;
  }
  if ((uint64_t)&v14[-*(void *)(a1 + 3896)] < ((v7 * v8) << 10))
  {
    unsigned int v18 = "e: underflow while reading WgTypeA";
    goto LABEL_14;
  }
  uint64_t v54 = v6;
  int v55 = v14;
  if (v7)
  {
    uint64_t v30 = 0;
    uint64_t v53 = v3;
    uint64_t v31 = v3 + 120;
    uint64_t v58 = v7;
    do
    {
      uint64_t v56 = v30;
      uint64_t v32 = 0;
      uint64_t v33 = v31;
      do
      {
        if (v8)
        {
          uint64_t v34 = 0;
          uint64_t v35 = v33;
          do
          {
            for (uint64_t i = 0; i != 256; i += 4)
            {
              char v37 = *(__int16 **)(a1 + 3896);
              __int16 v38 = *v37;
              *(void *)(a1 + 3896) = v37 + 1;
              LODWORD(v37) = *(_DWORD *)(a1 + 3904);
              *(_DWORD *)(a1 + 3904) = v37 - 2;
              if (v37 < 2) {
                puts("e: data_sz underflow in get_value");
              }
              *(_WORD *)(v35 + i) = v38;
            }
            ++v34;
            v35 += 256;
          }
          while (v34 != v8);
        }
        ++v32;
        v33 += 768;
      }
      while (v32 != 4);
      uint64_t v30 = v56 + 1;
      v31 += 3072;
    }
    while (v56 + 1 != v58);
    uint64_t v39 = 0;
    uint64_t v40 = v53 + 122;
    do
    {
      uint64_t v57 = v39;
      uint64_t v41 = 0;
      uint64_t v42 = v40;
      do
      {
        if (v8)
        {
          uint64_t v43 = 0;
          uint64_t v44 = v42;
          do
          {
            for (uint64_t j = 0; j != 256; j += 4)
            {
              unsigned int v46 = *(__int16 **)(a1 + 3896);
              __int16 v47 = *v46;
              *(void *)(a1 + 3896) = v46 + 1;
              LODWORD(v46) = *(_DWORD *)(a1 + 3904);
              *(_DWORD *)(a1 + 3904) = v46 - 2;
              if (v46 < 2) {
                puts("e: data_sz underflow in get_value");
              }
              *(_WORD *)(v44 + j) = v47;
            }
            ++v43;
            v44 += 256;
          }
          while (v43 != v8);
        }
        ++v41;
        v42 += 768;
      }
      while (v41 != 4);
      uint64_t v39 = v57 + 1;
      v40 += 3072;
    }
    while (v57 + 1 != v58);
  }
  uint64_t v48 = *(void *)(a1 + 3896);
  if ((uint64_t)&v54[-v48] >= 0) {
    uint64_t v49 = -(uint64_t)((unint64_t)&v54[-v48] & 3);
  }
  else {
    LODWORD(v49) = (v48 - v54) & 3;
  }
  if (v49)
  {
    int v50 = v49 - 4;
    uint64_t v51 = v55;
    do
    {
      ++*(void *)(a1 + 3896);
      int v52 = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v52 - 1;
      if (!v52) {
        puts("e: data_sz underflow in get_value");
      }
      BOOL v12 = __CFADD__(v50++, 1);
    }
    while (!v12);
    uint64_t v48 = *(void *)(a1 + 3896);
  }
  else
  {
    uint64_t v51 = v55;
  }
  if ((unsigned char *)v48 != v51)
  {
    unsigned int v18 = "e: parsing did not consume the full HTMP size";
    goto LABEL_14;
  }
  return 1;
}

uint64_t sub_100018BF0(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) != 0x10000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  uint64_t v3 = *(_DWORD **)(a1 + 2840);
  if (*v3 != 2)
  {
    printf("e: mismatching versions: %u != %u\n");
    return 0;
  }
  int v4 = 4 * *(_DWORD *)(a2 + 8);
  uint64_t v5 = (v4 - 12);
  if (v4 == 12)
  {
    BOOL v12 = "e: underflow while reading sizes";
    goto LABEL_32;
  }
  int v6 = *(unsigned __int8 **)(a1 + 3896);
  unsigned int v7 = v3[3105];
  uint64_t v8 = v3[3106];
  int v9 = *v6;
  *(void *)(a1 + 3896) = v6 + 1;
  int v10 = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v10 - 1;
  if (!v10) {
    puts("e: data_sz underflow in get_value");
  }
  if (v9 != 128)
  {
    printf("e: unsupported NNIT: %u != %u\n");
    return 0;
  }
  int v11 = &v6[v5];
  if ((unint64_t)&v11[-*(void *)(a1 + 3896)] < (v7 * (unint64_t)v8) << 8)
  {
    BOOL v12 = "e: underflow while reading multi nit LUT";
LABEL_32:
    puts(v12);
    return 0;
  }
  uint64_t v14 = 0;
  int v15 = v3 + 3116;
  do
  {
    uint64_t v16 = v8;
    __int16 v17 = v15;
    if (v8)
    {
      do
      {
        unsigned int v18 = *(unsigned __int16 **)(a1 + 3896);
        int v19 = *v18;
        *(void *)(a1 + 3896) = v18 + 1;
        LODWORD(v18) = *(_DWORD *)(a1 + 3904);
        *(_DWORD *)(a1 + 3904) = v18 - 2;
        if (v18 < 2) {
          puts("e: data_sz underflow in get_value");
        }
        *__int16 v17 = v19;
        v17 += 128;
        --v16;
      }
      while (v16);
    }
    ++v14;
    ++v15;
  }
  while (v14 != 128);
  int v20 = *(unsigned __int8 **)(a1 + 3896);
  if (v6 - v20 >= 0) {
    uint64_t v21 = -((v6 - v20) & 3);
  }
  else {
    LODWORD(v21) = (v20 - v6) & 3;
  }
  if (v21)
  {
    int v22 = v21 - 4;
    do
    {
      ++*(void *)(a1 + 3896);
      int v23 = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v23 - 1;
      if (!v23) {
        puts("e: data_sz underflow in get_value");
      }
    }
    while (!__CFADD__(v22++, 1));
    int v20 = *(unsigned __int8 **)(a1 + 3896);
  }
  if (v20 != v11)
  {
    BOOL v12 = "e: parsing did not consume the full MTNC size";
    goto LABEL_32;
  }
  return 1;
}

uint64_t sub_100018DEC(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) == 196608)
  {
    uint64_t v3 = *(_DWORD **)(a1 + 2840);
    if (*v3 == 3)
    {
      printf("i: Processing CNST version 0x%x\n", 196608);
      if ((4 * *(_DWORD *)(a2 + 8) - 12) > 0x17)
      {
        uint64_t v6 = *(void *)(a1 + 3896) + 1;
        *(void *)(a1 + 3896) = v6;
        int v7 = *(_DWORD *)(a1 + 3904);
        BOOL v8 = v7 != 0;
        int v9 = v7 - 1;
        *(_DWORD *)(a1 + 3904) = v9;
        if (!v8)
        {
          puts("e: data_sz underflow in get_value");
          uint64_t v6 = *(void *)(a1 + 3896);
          int v9 = *(_DWORD *)(a1 + 3904);
        }
        int v10 = (unsigned __int16 *)(v6 + 1);
        *(void *)(a1 + 3896) = v10;
        BOOL v8 = v9 != 0;
        unsigned int v11 = v9 - 1;
        *(_DWORD *)(a1 + 3904) = v11;
        if (!v8)
        {
          puts("e: data_sz underflow in get_value");
          int v10 = *(unsigned __int16 **)(a1 + 3896);
          unsigned int v11 = *(_DWORD *)(a1 + 3904);
        }
        unsigned int v14 = *v10;
        BOOL v12 = (unsigned __int8 *)(v10 + 1);
        unsigned int v13 = v14;
        *(void *)(a1 + 3896) = v12;
        BOOL v8 = v11 >= 2;
        unsigned int v15 = v11 - 2;
        *(_DWORD *)(a1 + 3904) = v15;
        if (!v8)
        {
          puts("e: data_sz underflow in get_value");
          BOOL v12 = *(unsigned __int8 **)(a1 + 3896);
          unsigned int v15 = *(_DWORD *)(a1 + 3904);
        }
        unsigned int v18 = *v12;
        uint64_t v16 = (unsigned __int16 *)(v12 + 1);
        unsigned int v17 = v18;
        *(void *)(a1 + 3896) = v16;
        BOOL v8 = v15 != 0;
        unsigned int v19 = v15 - 1;
        *(_DWORD *)(a1 + 3904) = v19;
        if (!v8)
        {
          puts("e: data_sz underflow in get_value");
          uint64_t v16 = *(unsigned __int16 **)(a1 + 3896);
          unsigned int v19 = *(_DWORD *)(a1 + 3904);
        }
        unsigned int v22 = *v16;
        int v20 = (unsigned __int8 *)(v16 + 1);
        unsigned int v21 = v22;
        *(void *)(a1 + 3896) = v20;
        BOOL v8 = v19 >= 2;
        unsigned int v23 = v19 - 2;
        *(_DWORD *)(a1 + 3904) = v23;
        if (!v8)
        {
          puts("e: data_sz underflow in get_value");
          int v20 = *(unsigned __int8 **)(a1 + 3896);
          unsigned int v23 = *(_DWORD *)(a1 + 3904);
        }
        unsigned int v26 = *v20;
        int v24 = v20 + 1;
        unsigned int v25 = v26;
        *(void *)(a1 + 3896) = v24;
        BOOL v8 = v23 != 0;
        unsigned int v27 = v23 - 1;
        *(_DWORD *)(a1 + 3904) = v27;
        if (!v8)
        {
          puts("e: data_sz underflow in get_value");
          int v24 = *(unsigned __int8 **)(a1 + 3896);
          unsigned int v27 = *(_DWORD *)(a1 + 3904);
        }
        unsigned int v28 = v24 + 1;
        *(void *)(a1 + 3896) = v28;
        BOOL v8 = v27 != 0;
        unsigned int v29 = v27 - 1;
        *(_DWORD *)(a1 + 3904) = v29;
        if (!v8)
        {
          puts("e: data_sz underflow in get_value");
          unsigned int v28 = *(unsigned __int8 **)(a1 + 3896);
          unsigned int v29 = *(_DWORD *)(a1 + 3904);
        }
        uint64_t v30 = v28 + 1;
        *(void *)(a1 + 3896) = v30;
        BOOL v8 = v29 != 0;
        unsigned int v31 = v29 - 1;
        *(_DWORD *)(a1 + 3904) = v31;
        if (!v8)
        {
          puts("e: data_sz underflow in get_value");
          uint64_t v30 = *(unsigned __int8 **)(a1 + 3896);
          unsigned int v31 = *(_DWORD *)(a1 + 3904);
        }
        unsigned int v34 = *v30;
        uint64_t v32 = v30 + 1;
        unsigned int v33 = v34;
        *(void *)(a1 + 3896) = v32;
        BOOL v8 = v31 != 0;
        unsigned int v35 = v31 - 1;
        *(_DWORD *)(a1 + 3904) = v35;
        if (!v8)
        {
          puts("e: data_sz underflow in get_value");
          uint64_t v32 = *(unsigned __int8 **)(a1 + 3896);
          unsigned int v35 = *(_DWORD *)(a1 + 3904);
        }
        unsigned int v36 = *v32;
        *(void *)(a1 + 3896) = v32 + 1;
        *(_DWORD *)(a1 + 3904) = v35 - 1;
        if (!v35) {
          puts("e: data_sz underflow in get_value");
        }
        if (v13 < 0x79)
        {
          if (v17 < 3)
          {
            if (v21 < 0x79)
            {
              if (v25 < 3)
              {
                if (v33 < 0x25)
                {
                  if (v36 < 6)
                  {
                    char v37 = *(unsigned __int8 **)(a1 + 3896);
                    unsigned int v38 = *v37;
                    *(void *)(a1 + 3896) = v37 + 1;
                    LODWORD(v37) = *(_DWORD *)(a1 + 3904);
                    *(_DWORD *)(a1 + 3904) = v37 - 1;
                    unsigned int v69 = v38;
                    if (!v37)
                    {
                      puts("e: data_sz underflow in get_value");
                      unsigned int v38 = v69;
                    }
                    if (v38 < 5)
                    {
                      uint64_t v39 = *(unsigned __int8 **)(a1 + 3896);
                      unsigned int v40 = *v39;
                      *(void *)(a1 + 3896) = v39 + 1;
                      LODWORD(v39) = *(_DWORD *)(a1 + 3904);
                      *(_DWORD *)(a1 + 3904) = v39 - 1;
                      unsigned int v68 = v40;
                      if (!v39)
                      {
                        puts("e: data_sz underflow in get_value");
                        unsigned int v40 = v68;
                      }
                      if (v40 < 7)
                      {
                        uint64_t v41 = *(unsigned __int8 **)(a1 + 3896);
                        unsigned int v43 = *v41;
                        uint64_t v42 = v41 + 1;
                        unsigned int v67 = v43;
                        *(void *)(a1 + 3896) = v42;
                        int v44 = *(_DWORD *)(a1 + 3904);
                        BOOL v8 = v44 != 0;
                        int v45 = v44 - 1;
                        *(_DWORD *)(a1 + 3904) = v45;
                        if (!v8)
                        {
                          puts("e: data_sz underflow in get_value");
                          uint64_t v42 = *(unsigned __int8 **)(a1 + 3896);
                          int v45 = *(_DWORD *)(a1 + 3904);
                        }
                        unsigned int v46 = v42 + 1;
                        *(void *)(a1 + 3896) = v46;
                        BOOL v8 = v45 != 0;
                        int v47 = v45 - 1;
                        *(_DWORD *)(a1 + 3904) = v47;
                        if (!v8)
                        {
                          puts("e: data_sz underflow in get_value");
                          unsigned int v46 = *(unsigned __int8 **)(a1 + 3896);
                          int v47 = *(_DWORD *)(a1 + 3904);
                        }
                        uint64_t v48 = v46 + 1;
                        *(void *)(a1 + 3896) = v48;
                        BOOL v8 = v47 != 0;
                        int v49 = v47 - 1;
                        *(_DWORD *)(a1 + 3904) = v49;
                        if (!v8)
                        {
                          puts("e: data_sz underflow in get_value");
                          uint64_t v48 = *(unsigned __int8 **)(a1 + 3896);
                          int v49 = *(_DWORD *)(a1 + 3904);
                        }
                        int v50 = v48 + 1;
                        *(void *)(a1 + 3896) = v50;
                        BOOL v8 = v49 != 0;
                        int v51 = v49 - 1;
                        *(_DWORD *)(a1 + 3904) = v51;
                        if (!v8)
                        {
                          puts("e: data_sz underflow in get_value");
                          int v50 = *(unsigned __int8 **)(a1 + 3896);
                          int v51 = *(_DWORD *)(a1 + 3904);
                        }
                        int v52 = v50 + 1;
                        *(void *)(a1 + 3896) = v52;
                        BOOL v8 = v51 != 0;
                        int v53 = v51 - 1;
                        *(_DWORD *)(a1 + 3904) = v53;
                        if (!v8)
                        {
                          puts("e: data_sz underflow in get_value");
                          int v52 = *(unsigned __int8 **)(a1 + 3896);
                          int v53 = *(_DWORD *)(a1 + 3904);
                        }
                        uint64_t v54 = v3 + 479644;
                        unsigned int v56 = *v52;
                        int v55 = v52 + 1;
                        unsigned int v66 = v56;
                        *(void *)(a1 + 3896) = v55;
                        BOOL v8 = v53 != 0;
                        int v57 = v53 - 1;
                        *(_DWORD *)(a1 + 3904) = v57;
                        if (!v8)
                        {
                          puts("e: data_sz underflow in get_value");
                          int v55 = *(unsigned __int8 **)(a1 + 3896);
                          int v57 = *(_DWORD *)(a1 + 3904);
                        }
                        unsigned int v58 = v68;
                        unsigned int v59 = *v55;
                        *(void *)(a1 + 3896) = v55 + 1;
                        *(_DWORD *)(a1 + 3904) = v57 - 1;
                        if (!v57)
                        {
                          unsigned int v65 = v59;
                          puts("e: data_sz underflow in get_value");
                          unsigned int v59 = v65;
                          unsigned int v58 = v68;
                        }
                        *uint64_t v54 = v69;
                        v54[1] = v58;
                        v54[2] = v67;
                        v54[3] = v36;
                        v54[4] = v33;
                        v54[6] = v59;
                        v54[7] = v66;
                        v54[8] = v17;
                        v54[9] = v13;
                        if (v17) {
                          BOOL v60 = v13 == 0;
                        }
                        else {
                          BOOL v60 = 1;
                        }
                        int v61 = !v60;
                        if (v36) {
                          BOOL v62 = v33 == 0;
                        }
                        else {
                          BOOL v62 = 1;
                        }
                        int v63 = v62;
                        if (v62) {
                          int v64 = 0;
                        }
                        else {
                          int v64 = 2;
                        }
                        v54[12] = v64 | v61 | v54[12] & 0xFFFFFFFC;
                        if (v61 == 1 && !v63)
                        {
                          if (v25 | v21 && !*(void *)(a1 + 2848)) {
                            operator new();
                          }
                          operator new();
                        }
                        printf("e: missing EMMP (T%d B%d) or gray scales (T%d B%d)\n");
                      }
                      else
                      {
                        printf("e: unsupported sensor channel count: %u > %u\n");
                      }
                    }
                    else
                    {
                      printf("e: unsupported region count: %u > %u\n");
                    }
                  }
                  else
                  {
                    printf("e: unsupported PCS temperature count: %u > %u\n");
                  }
                }
                else
                {
                  printf("e: unsupported PCS brightness count: %u > %u\n");
                }
              }
              else
              {
                printf("e: unsupported EMMP ALSS temperature count: %u > %u\n");
              }
            }
            else
            {
              printf("e: unsupported EMMP ALSS brightness count: %u > %u\n");
            }
          }
          else
          {
            printf("e: unsupported EMMP ACSS temperature count: %u > %u\n");
          }
        }
        else
        {
          printf("e: unsupported EMMP ACSS brightness count: %u > %u\n");
        }
      }
      else
      {
        printf("e: unexpected size for CNST %u < %u\n");
      }
    }
    else
    {
      printf("e: mismatching versions: %u != %u\n");
    }
  }
  else
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
  }
  return 0;
}

uint64_t sub_1000194E8(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) != 0x10000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  uint64_t v3 = *(_DWORD **)(a1 + 2840);
  if (*v3 != 3)
  {
    printf("e: mismatching versions: %u != %u\n");
    return 0;
  }
  uint64_t v5 = malloc_type_calloc(1uLL, 0x128uLL, 0x1000040CB3E114FuLL);
  if (!v5)
  {
    unsigned int v26 = "e: out of memory for PCS table";
LABEL_58:
    puts(v26);
    return 0;
  }
  int v6 = 4 * *(_DWORD *)(a2 + 8);
  uint64_t v7 = (v6 - 12);
  if (v6 == 12)
  {
    unsigned int v26 = "e: underflow while reading indices";
    goto LABEL_58;
  }
  BOOL v8 = v5;
  int v9 = v3 + 479644;
  int v10 = *(unsigned char **)(a1 + 3896);
  uint64_t v11 = *v9;
  uint64_t v12 = v9[1];
  unsigned int v13 = (__int16 *)(v10 + 1);
  char v14 = *v10;
  *(void *)(a1 + 3896) = v10 + 1;
  int v15 = *(_DWORD *)(a1 + 3904);
  BOOL v16 = v15 != 0;
  unsigned int v17 = v15 - 1;
  *(_DWORD *)(a1 + 3904) = v17;
  if (!v16)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v13 = *(__int16 **)(a1 + 3896);
    unsigned int v17 = *(_DWORD *)(a1 + 3904);
  }
  v8[290] = v14;
  __int16 v18 = *v13;
  *(void *)(a1 + 3896) = v13 + 1;
  *(_DWORD *)(a1 + 3904) = v17 - 2;
  if (v17 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  uint64_t v19 = 0;
  int v50 = &v10[v7];
  *((_WORD *)v8 + 144) = v18;
  int v49 = v10;
  uint64_t v48 = v8;
  int v52 = (float *)v8;
  do
  {
    if ((unint64_t)&v50[-*(void *)(a1 + 3896)] < 4 * (unint64_t)(v12 * v11))
    {
      unsigned int v26 = "e: underflow while reading PCS scales";
      goto LABEL_58;
    }
    uint64_t v51 = v19;
    if (v11)
    {
      uint64_t v20 = 0;
      unsigned int v21 = v52;
      do
      {
        uint64_t v22 = v12;
        unsigned int v23 = v21;
        if (v12)
        {
          do
          {
            int v24 = *(unint64_t **)(a1 + 3896);
            unint64_t v25 = *v24;
            *(void *)(a1 + 3896) = v24 + 1;
            LODWORD(v24) = *(_DWORD *)(a1 + 3904);
            *(_DWORD *)(a1 + 3904) = v24 - 8;
            if (v24 < 8) {
              puts("e: data_sz underflow in get_long_value");
            }
            *v23++ = (float)v25 * 1.4552e-11;
            --v22;
          }
          while (v22);
        }
        ++v20;
        v21 += 6;
      }
      while (v20 != v11);
    }
    uint64_t v19 = v51 + 1;
    v52 += 24;
  }
  while (v51 != 2);
  if ((uint64_t)&v50[-*(void *)(a1 + 3896)] < 36)
  {
    unsigned int v26 = "e: underflow while reading PCS spare";
    goto LABEL_58;
  }
  int v27 = 18;
  do
  {
    *(void *)(a1 + 3896) += 2;
    unsigned int v28 = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v28 - 2;
    if (v28 < 2) {
      puts("e: data_sz underflow in get_value");
    }
    --v27;
  }
  while (v27);
  unsigned int v29 = *(void ***)(a1 + 3840);
  uint64_t v30 = v29[1];
  unint64_t v31 = (unint64_t)v29[2];
  if ((unint64_t)v30 >= v31)
  {
    uint64_t v33 = ((char *)v30 - (unsigned char *)*v29) >> 3;
    if ((unint64_t)(v33 + 1) >> 61) {
      sub_100009CF0();
    }
    uint64_t v34 = v31 - (void)*v29;
    uint64_t v35 = v34 >> 2;
    if (v34 >> 2 <= (unint64_t)(v33 + 1)) {
      uint64_t v35 = v33 + 1;
    }
    if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v36 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v36 = v35;
    }
    if (v36) {
      char v37 = (char *)sub_100021970((uint64_t)(v29 + 2), v36);
    }
    else {
      char v37 = 0;
    }
    unsigned int v38 = &v37[8 * v33];
    uint64_t v39 = &v37[8 * v36];
    *(void *)unsigned int v38 = v48;
    uint64_t v32 = v38 + 8;
    uint64_t v41 = (char *)*v29;
    unsigned int v40 = (char *)v29[1];
    if (v40 != *v29)
    {
      do
      {
        uint64_t v42 = *((void *)v40 - 1);
        v40 -= 8;
        *((void *)v38 - 1) = v42;
        v38 -= 8;
      }
      while (v40 != v41);
      unsigned int v40 = (char *)*v29;
    }
    *unsigned int v29 = v38;
    v29[1] = v32;
    v29[2] = v39;
    if (v40) {
      operator delete(v40);
    }
  }
  else
  {
    *uint64_t v30 = v48;
    uint64_t v32 = v30 + 1;
  }
  v29[1] = v32;
  unsigned int v43 = *(unsigned char **)(a1 + 3896);
  if (v49 - v43 >= 0) {
    uint64_t v44 = -((v49 - v43) & 3);
  }
  else {
    LODWORD(v44) = (v43 - v49) & 3;
  }
  if (v44)
  {
    int v45 = v44 - 4;
    do
    {
      ++*(void *)(a1 + 3896);
      int v46 = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v46 - 1;
      if (!v46) {
        puts("e: data_sz underflow in get_value");
      }
      BOOL v16 = __CFADD__(v45++, 1);
    }
    while (!v16);
    unsigned int v43 = *(unsigned char **)(a1 + 3896);
  }
  if (v43 != v50)
  {
    unsigned int v26 = "e: parsing did not consume the full PCS size";
    goto LABEL_58;
  }
  return 1;
}

uint64_t sub_10001988C(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) != 0x10000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  uint64_t v3 = *(_DWORD **)(a1 + 2840);
  if (*v3 != 3)
  {
    printf("e: mismatching versions: %u != %u\n");
    return 0;
  }
  uint64_t v5 = (char *)malloc_type_calloc(1uLL, 0x1928uLL, 0x1000040B1E0D9D0uLL);
  unsigned int v40 = v5;
  if (!v5)
  {
    int v9 = "e: out of memory for EMMP table";
    goto LABEL_10;
  }
  int v6 = v3 + 479646;
  unint64_t v7 = v3[479646];
  if (v7 >= 4)
  {
    printf("e: too many EM color channels %d\n");
    return 0;
  }
  uint64_t v10 = v6[5];
  if (v10 >= 0x11)
  {
    printf("e: too many EM gray levels %d\n");
    return 0;
  }
  uint64_t v11 = v6[4];
  if (v11 >= 0x41)
  {
    printf("e: too many EM lines %d\n");
    return 0;
  }
  uint64_t v12 = (4 * *(_DWORD *)(a2 + 8) - 12);
  if (v12 < (2 * (int)v10 + 4 * ((int)v10 - 1) + 7) * (int)v7 + 3)
  {
    printf("e: provided data size smaller than expected %d < %d\n");
    return 0;
  }
  unsigned int v13 = v5;
  uint64_t v39 = *(unsigned __int8 **)(a1 + 3896);
  int v14 = *v39;
  *(void *)(a1 + 3896) = v39 + 1;
  int v15 = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v15 - 1;
  if (!v15) {
    puts("e: data_sz underflow in get_value");
  }
  if (v14 == 2)
  {
    if (!*(unsigned char *)(a1 + 2856)) {
      goto LABEL_24;
    }
    int v9 = "e: ACSS and ALSS should share either none or all of EMMP data";
LABEL_10:
    puts(v9);
    return 0;
  }
  if (v14 == 3) {
    *(unsigned char *)(a1 + 2856) = 1;
  }
LABEL_24:
  BOOL v16 = *(unsigned char **)(a1 + 3896);
  char v19 = *v16;
  unsigned int v17 = (__int16 *)(v16 + 1);
  char v18 = v19;
  *(void *)(a1 + 3896) = v17;
  int v20 = *(_DWORD *)(a1 + 3904);
  BOOL v21 = v20 != 0;
  unsigned int v22 = v20 - 1;
  *(_DWORD *)(a1 + 3904) = v22;
  if (!v21)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v17 = *(__int16 **)(a1 + 3896);
    unsigned int v22 = *(_DWORD *)(a1 + 3904);
  }
  v13[6434] = v18;
  __int16 v23 = *v17;
  *(void *)(a1 + 3896) = v17 + 1;
  *(_DWORD *)(a1 + 3904) = v22 - 2;
  if (v22 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  int v24 = &v39[v12];
  *((_WORD *)v13 + 3216) = v23;
  sub_100012D98(a1, v13, v7);
  sub_100012DE8(a1, (_WORD *)v13 + 2, v7);
  if (v7)
  {
    unint64_t v25 = v13 + 12;
    unint64_t v26 = v7;
    do
    {
      sub_100012DE8(a1, v25, v10);
      v25 += 16;
      --v26;
    }
    while (v26);
    int v27 = v13 + 108;
    unint64_t v28 = v7;
    do
    {
      sub_100012E38(a1, v27, (v10 - 1));
      v27 += 15;
      --v28;
    }
    while (v28);
    uint64_t v29 = 0;
    uint64_t v30 = v13 + 288;
    do
    {
      uint64_t v31 = v11;
      uint64_t v32 = v30;
      if (v11)
      {
        do
        {
          sub_100012DE8(a1, v32, v10);
          v32 += 16;
          --v31;
        }
        while (v31);
      }
      ++v29;
      v30 += 1024;
    }
    while (v29 != v7);
  }
  if ((uint64_t)&v24[-*(void *)(a1 + 3896)] < 6)
  {
    int v9 = "e: underflow while reading EMMK spare";
    goto LABEL_10;
  }
  int v33 = 3;
  do
  {
    *(void *)(a1 + 3896) += 2;
    unsigned int v34 = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v34 - 2;
    if (v34 < 2) {
      puts("e: data_sz underflow in get_value");
    }
    --v33;
  }
  while (v33);
  if (v14) {
    sub_10001D124(*(void ***)(a1 + 3864), &v40);
  }
  if ((v14 & 2) != 0) {
    sub_10001D124(*(void ***)(a1 + 3872), &v40);
  }
  uint64_t v35 = *(unsigned __int8 **)(a1 + 3896);
  if (v39 - v35 >= 0) {
    uint64_t v36 = -((v39 - v35) & 3);
  }
  else {
    LODWORD(v36) = (v35 - v39) & 3;
  }
  if (v36)
  {
    int v37 = v36 - 4;
    do
    {
      ++*(void *)(a1 + 3896);
      int v38 = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v38 - 1;
      if (!v38) {
        puts("e: data_sz underflow in get_value");
      }
      BOOL v21 = __CFADD__(v37++, 1);
    }
    while (!v21);
    uint64_t v35 = *(unsigned __int8 **)(a1 + 3896);
  }
  if (v35 != v24)
  {
    int v9 = "e: parsing did not consume the full EMMK size";
    goto LABEL_10;
  }
  return 1;
}

uint64_t sub_100019C50(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) != 0x40000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  uint64_t v3 = *(_DWORD **)(a1 + 2840);
  if (*v3 != 4)
  {
    printf("e: mismatching versions: %u != %u\n");
    return 0;
  }
  uint64_t v4 = (4 * *(_DWORD *)(a2 + 8) - 12);
  if (v4 <= 0xE)
  {
    uint64_t v5 = "e: cannot read data in CNST";
LABEL_5:
    puts(v5);
    return 0;
  }
  uint64_t v6 = *(void *)(a1 + 3896);
  unint64_t v7 = (unsigned __int8 *)(v6 + 1);
  *(void *)(a1 + 3896) = v6 + 1;
  int v8 = *(_DWORD *)(a1 + 3904);
  BOOL v9 = v8 != 0;
  int v10 = v8 - 1;
  *(_DWORD *)(a1 + 3904) = v10;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    unint64_t v7 = *(unsigned __int8 **)(a1 + 3896);
    int v10 = *(_DWORD *)(a1 + 3904);
  }
  int v12 = *v7;
  uint64_t v11 = v7 + 1;
  int v62 = v12;
  *(void *)(a1 + 3896) = v11;
  BOOL v9 = v10 != 0;
  int v13 = v10 - 1;
  *(_DWORD *)(a1 + 3904) = v13;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v11 = *(unsigned __int8 **)(a1 + 3896);
    int v13 = *(_DWORD *)(a1 + 3904);
  }
  int v15 = *v11;
  int v14 = v11 + 1;
  int v61 = v15;
  *(void *)(a1 + 3896) = v14;
  BOOL v9 = v13 != 0;
  int v16 = v13 - 1;
  *(_DWORD *)(a1 + 3904) = v16;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    int v14 = *(unsigned __int8 **)(a1 + 3896);
    int v16 = *(_DWORD *)(a1 + 3904);
  }
  int v18 = *v14;
  unsigned int v17 = v14 + 1;
  int v60 = v18;
  *(void *)(a1 + 3896) = v17;
  BOOL v9 = v16 != 0;
  int v19 = v16 - 1;
  *(_DWORD *)(a1 + 3904) = v19;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v17 = *(unsigned __int8 **)(a1 + 3896);
    int v19 = *(_DWORD *)(a1 + 3904);
  }
  int v21 = *v17;
  int v20 = v17 + 1;
  int v59 = v21;
  *(void *)(a1 + 3896) = v20;
  BOOL v9 = v19 != 0;
  int v22 = v19 - 1;
  *(_DWORD *)(a1 + 3904) = v22;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    int v20 = *(unsigned __int8 **)(a1 + 3896);
    int v22 = *(_DWORD *)(a1 + 3904);
  }
  int v24 = *v20;
  __int16 v23 = v20 + 1;
  int v58 = v24;
  *(void *)(a1 + 3896) = v23;
  BOOL v9 = v22 != 0;
  int v25 = v22 - 1;
  *(_DWORD *)(a1 + 3904) = v25;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    __int16 v23 = *(unsigned __int8 **)(a1 + 3896);
    int v25 = *(_DWORD *)(a1 + 3904);
  }
  int v27 = *v23;
  unint64_t v26 = v23 + 1;
  int v57 = v27;
  *(void *)(a1 + 3896) = v26;
  BOOL v9 = v25 != 0;
  int v28 = v25 - 1;
  *(_DWORD *)(a1 + 3904) = v28;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    unint64_t v26 = *(unsigned __int8 **)(a1 + 3896);
    int v28 = *(_DWORD *)(a1 + 3904);
  }
  int v31 = *v26;
  uint64_t v29 = v26 + 1;
  int v30 = v31;
  *(void *)(a1 + 3896) = v29;
  BOOL v9 = v28 != 0;
  int v32 = v28 - 1;
  *(_DWORD *)(a1 + 3904) = v32;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v29 = *(unsigned __int8 **)(a1 + 3896);
    int v32 = *(_DWORD *)(a1 + 3904);
  }
  unsigned int v35 = *v29;
  int v33 = v29 + 1;
  unsigned int v34 = v35;
  *(void *)(a1 + 3896) = v33;
  BOOL v9 = v32 != 0;
  int v36 = v32 - 1;
  *(_DWORD *)(a1 + 3904) = v36;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    int v33 = *(unsigned __int8 **)(a1 + 3896);
    int v36 = *(_DWORD *)(a1 + 3904);
  }
  unsigned int v39 = *v33;
  int v37 = v33 + 1;
  unsigned int v38 = v39;
  *(void *)(a1 + 3896) = v37;
  BOOL v9 = v36 != 0;
  int v40 = v36 - 1;
  *(_DWORD *)(a1 + 3904) = v40;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    int v37 = *(unsigned __int8 **)(a1 + 3896);
    int v40 = *(_DWORD *)(a1 + 3904);
  }
  unsigned int v43 = *v37;
  uint64_t v41 = (unsigned __int16 *)(v37 + 1);
  unsigned int v42 = v43;
  *(void *)(a1 + 3896) = v41;
  BOOL v9 = v40 != 0;
  unsigned int v44 = v40 - 1;
  *(_DWORD *)(a1 + 3904) = v44;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v41 = *(unsigned __int16 **)(a1 + 3896);
    unsigned int v44 = *(_DWORD *)(a1 + 3904);
  }
  unsigned int v47 = *v41;
  int v45 = v41 + 1;
  unsigned int v46 = v47;
  *(void *)(a1 + 3896) = v45;
  BOOL v9 = v44 >= 2;
  unsigned int v48 = v44 - 2;
  *(_DWORD *)(a1 + 3904) = v48;
  if (!v9)
  {
    puts("e: data_sz underflow in get_value");
    int v45 = *(unsigned __int16 **)(a1 + 3896);
    unsigned int v48 = *(_DWORD *)(a1 + 3904);
  }
  unsigned int v49 = *v45;
  *(void *)(a1 + 3896) = v45 + 1;
  *(_DWORD *)(a1 + 3904) = v48 - 2;
  if (v48 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  if (v34 >= 5)
  {
    printf("e: unsupported region count: %u > %u\n");
    return 0;
  }
  if (v38 >= 2)
  {
    printf("e: unsupported sensor channel count: %u > %u\n");
    return 0;
  }
  if (v42 >= 4)
  {
    printf("e: unsupported color count: %u > %u\n");
    return 0;
  }
  if (v46 >= 0x81)
  {
    printf("e: unsupported gray value count: %u > %u\n");
    return 0;
  }
  if (v49 >= 0x80)
  {
    printf("e: unsupported gray step count: %u > %u\n");
    return 0;
  }
  if (v62 != 1)
  {
    printf("e: unsupported htmp emission freq count: %u != %u\n");
    return 0;
  }
  if (v61)
  {
    printf("e: unsupported benl emission freq count: %u != %u\n");
    return 0;
  }
  if (v60)
  {
    printf("e: unsupported benl brightness count: %u != %u\n");
    return 0;
  }
  if (v59 != 1)
  {
    printf("e: unsupported pdcc emission freq: %u != %u\n");
    return 0;
  }
  if (v58 != 1)
  {
    printf("e: unsupported pdcc temperature count: %u != %u\n");
    return 0;
  }
  if (v57)
  {
    printf("e: unsupported pdmc emission freq: %u != %u\n");
    return 0;
  }
  if (v30)
  {
    printf("e: unsupported pdmc temperature count: %u != %u\n");
    return 0;
  }
  uint64_t v51 = v3 + 5022;
  uint64_t v52 = v6 + v4;
  *uint64_t v51 = v34;
  v51[1] = v38;
  v51[2] = v42;
  *((_WORD *)v51 + 14) = v46;
  *((_WORD *)v51 + 15) = v49;
  uint64_t v53 = *(void *)(a1 + 3896);
  if (v6 - v53 >= 0) {
    uint64_t v54 = -((v6 - v53) & 3);
  }
  else {
    LODWORD(v54) = (v53 - v6) & 3;
  }
  if (v54)
  {
    int v55 = v54 - 4;
    do
    {
      ++*(void *)(a1 + 3896);
      int v56 = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v56 - 1;
      if (!v56) {
        puts("e: data_sz underflow in get_value");
      }
      BOOL v9 = __CFADD__(v55++, 1);
    }
    while (!v9);
    uint64_t v53 = *(void *)(a1 + 3896);
  }
  if (v53 != v52)
  {
    uint64_t v5 = "e: parsing did not consume the full CNST size";
    goto LABEL_5;
  }
  return 1;
}

uint64_t sub_10001A100(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) != 196608)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  int v3 = *(_DWORD *)(a1 + 2832);
  if (v3 != 5)
  {
    if (v3 == 4)
    {
      uint64_t v4 = *(void *)(a1 + 2840);
      uint64_t v5 = (_DWORD *)(v4 + 8);
      uint64_t v6 = (unsigned int *)(v4 + 20088);
      unint64_t v7 = (unint64_t *)(v4 + 20136);
      goto LABEL_7;
    }
    printf("e: mismatching versions: %u != 4,5\n");
    return 0;
  }
  uint64_t v8 = *(void *)(a1 + 2840);
  uint64_t v6 = (unsigned int *)(v8 + 172032);
  uint64_t v5 = (_DWORD *)(v8 + 8);
  unint64_t v7 = (unint64_t *)(v8 + 172080);
LABEL_7:
  int v9 = 4 * *(_DWORD *)(a2 + 8);
  uint64_t v10 = (v9 - 12);
  if (v9 == 12)
  {
    __int16 v23 = "e: underflow while reading feature enable flags";
    goto LABEL_77;
  }
  uint64_t v11 = *(unsigned char **)(a1 + 3896);
  char v12 = *v11;
  *(void *)(a1 + 3896) = v11 + 1;
  int v13 = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v13 - 1;
  if (!v13) {
    puts("e: data_sz underflow in get_value");
  }
  *unint64_t v7 = *v7 & 0xFFFFFFFFFFFFFFFELL | v12 & 1;
  int v14 = *(char **)(a1 + 3896);
  char v15 = *v14;
  *(void *)(a1 + 3896) = v14 + 1;
  LODWORD(v14) = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v14 - 1;
  if (!v14) {
    puts("e: data_sz underflow in get_value");
  }
  *unint64_t v7 = *v7 & 0xFFFFFFFFFFFFFFFDLL | (2 * (v15 & 1));
  int v16 = *(char **)(a1 + 3896);
  char v17 = *v16;
  *(void *)(a1 + 3896) = v16 + 1;
  LODWORD(v16) = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v16 - 1;
  if (!v16) {
    puts("e: data_sz underflow in get_value");
  }
  int v18 = &v11[v10];
  *unint64_t v7 = *v7 & 0xFFFFFFFFFFFFFFFBLL | (4 * (v17 & 1));
  int v19 = *(char **)(a1 + 3896);
  char v20 = *v19;
  *(void *)(a1 + 3896) = v19 + 1;
  LODWORD(v19) = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v19 - 1;
  if (!v19) {
    puts("e: data_sz underflow in get_value");
  }
  *unint64_t v7 = *v7 & 0xFFFFFFFFFFFFFFE7 | (8 * (v20 & 3));
  uint64_t v22 = *v6;
  uint64_t v21 = v6[1];
  if ((uint64_t)&v18[-*(void *)(a1 + 3896)] < (2 * v22 * v21))
  {
    __int16 v23 = "e: underflow while reading num_svds and shift_bits";
LABEL_77:
    puts(v23);
    return 0;
  }
  unsigned int v68 = v18;
  unsigned int v67 = v11;
  if (v22)
  {
    uint64_t v24 = 0;
    int v25 = (char *)v5 + 25;
    do
    {
      uint64_t v26 = v21;
      int v27 = v25;
      if (v21)
      {
        do
        {
          int v28 = *(char **)(a1 + 3896);
          char v29 = *v28;
          *(void *)(a1 + 3896) = v28 + 1;
          LODWORD(v28) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v28 - 1;
          if (!v28) {
            puts("e: data_sz underflow in get_value");
          }
          *int v27 = v29;
          v27 += 4;
          --v26;
        }
        while (v26);
      }
      ++v24;
      v25 += 28;
    }
    while (v24 != v22);
    uint64_t v30 = 0;
    int v31 = v5 + 6;
    do
    {
      uint64_t v32 = v21;
      int v33 = v31;
      if (v21)
      {
        do
        {
          unsigned int v34 = *(char **)(a1 + 3896);
          char v35 = *v34;
          *(void *)(a1 + 3896) = v34 + 1;
          LODWORD(v34) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v34 - 1;
          if (!v34) {
            puts("e: data_sz underflow in get_value");
          }
          *int v33 = v35;
          v33 += 4;
          --v32;
        }
        while (v32);
      }
      ++v30;
      v31 += 28;
    }
    while (v30 != v22);
  }
  if ((uint64_t)&v68[-*(void *)(a1 + 3896)] < (8 * v22))
  {
    __int16 v23 = "e: underflow while reading regions";
    goto LABEL_77;
  }
  int v36 = v5;
  if (v22)
  {
    uint64_t v37 = v22;
    unsigned int v38 = v5;
    do
    {
      unsigned int v39 = *(unsigned __int16 **)(a1 + 3896);
      int v40 = *v39;
      *(void *)(a1 + 3896) = v39 + 1;
      LODWORD(v39) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v39 - 2;
      if (v39 < 2) {
        puts("e: data_sz underflow in get_value");
      }
      *unsigned int v38 = v40;
      v38 += 7;
      --v37;
    }
    while (v37);
    uint64_t v41 = v5 + 1;
    uint64_t v42 = v22;
    do
    {
      unsigned int v43 = *(unsigned __int16 **)(a1 + 3896);
      int v44 = *v43;
      *(void *)(a1 + 3896) = v43 + 1;
      LODWORD(v43) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v43 - 2;
      if (v43 < 2) {
        puts("e: data_sz underflow in get_value");
      }
      _DWORD *v41 = v44;
      v41 += 7;
      --v42;
    }
    while (v42);
    int v45 = v5 + 2;
    uint64_t v46 = v22;
    do
    {
      unsigned int v47 = *(unsigned __int16 **)(a1 + 3896);
      int v48 = *v47;
      *(void *)(a1 + 3896) = v47 + 1;
      LODWORD(v47) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v47 - 2;
      if (v47 < 2) {
        puts("e: data_sz underflow in get_value");
      }
      *int v45 = v48;
      v45 += 7;
      --v46;
    }
    while (v46);
    unsigned int v49 = v5 + 3;
    uint64_t v50 = v22;
    do
    {
      uint64_t v51 = *(unsigned __int16 **)(a1 + 3896);
      int v52 = *v51;
      *(void *)(a1 + 3896) = v51 + 1;
      LODWORD(v51) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v51 - 2;
      if (v51 < 2) {
        puts("e: data_sz underflow in get_value");
      }
      _DWORD *v49 = v52;
      v49 += 7;
      --v50;
    }
    while (v50);
  }
  if ((uint64_t)&v68[-*(void *)(a1 + 3896)] < (2 * v22))
  {
    __int16 v23 = "e: underflow while reading interp_factor";
    goto LABEL_77;
  }
  if (v22)
  {
    uint64_t v53 = v5 + 4;
    uint64_t v54 = v22;
    do
    {
      int v55 = *(unsigned __int8 **)(a1 + 3896);
      int v56 = *v55;
      *(void *)(a1 + 3896) = v55 + 1;
      LODWORD(v55) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v55 - 1;
      if (!v55) {
        puts("e: data_sz underflow in get_value");
      }
      *uint64_t v53 = v56;
      v53 += 7;
      --v54;
    }
    while (v54);
    int v57 = v36 + 5;
    do
    {
      int v58 = *(unsigned __int8 **)(a1 + 3896);
      int v59 = *v58;
      *(void *)(a1 + 3896) = v58 + 1;
      LODWORD(v58) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v58 - 1;
      if (!v58) {
        puts("e: data_sz underflow in get_value");
      }
      *int v57 = v59;
      v57 += 7;
      --v22;
    }
    while (v22);
  }
  uint64_t v60 = *(void *)(a1 + 3896) + 2;
  *(void *)(a1 + 3896) = v60;
  unsigned int v61 = *(_DWORD *)(a1 + 3904);
  *(_DWORD *)(a1 + 3904) = v61 - 2;
  if (v61 < 2)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v60 = *(void *)(a1 + 3896);
  }
  if ((uint64_t)&v67[-v60] >= 0) {
    uint64_t v62 = -(uint64_t)((unint64_t)&v67[-v60] & 3);
  }
  else {
    LODWORD(v62) = (v60 - v67) & 3;
  }
  if (v62)
  {
    int v63 = v62 - 4;
    do
    {
      ++*(void *)(a1 + 3896);
      int v64 = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v64 - 1;
      if (!v64) {
        puts("e: data_sz underflow in get_value");
      }
    }
    while (!__CFADD__(v63++, 1));
    uint64_t v60 = *(void *)(a1 + 3896);
  }
  if ((unsigned char *)v60 != v68)
  {
    __int16 v23 = "e: parsing did not consume the full RCFG size";
    goto LABEL_77;
  }
  return 1;
}

uint64_t sub_10001A614(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) != 0x40000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  int v3 = *(_DWORD *)(a1 + 2832);
  if (v3 != 5)
  {
    if (v3 == 4)
    {
      uint64_t v4 = *(void *)(a1 + 2840);
      uint64_t v5 = (unsigned int *)(v4 + 20088);
      goto LABEL_7;
    }
    printf("e: mismatching versions: %u != 4,5\n");
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 2840);
  uint64_t v5 = (unsigned int *)(v4 + 172032);
LABEL_7:
  uint64_t v6 = v4 + 120;
  uint64_t v7 = (4 * *(_DWORD *)(a2 + 8) - 12);
  if (v7 <= 4)
  {
    uint64_t v8 = "e: underflow while temperature / brightness / emission freq";
LABEL_18:
    puts(v8);
    return 0;
  }
  int v9 = *(unsigned char **)(a1 + 3896);
  uint64_t v10 = *v5;
  uint64_t v11 = v5[2];
  char v12 = (__int16 *)(v9 + 1);
  char v13 = *v9;
  *(void *)(a1 + 3896) = v9 + 1;
  int v14 = *(_DWORD *)(a1 + 3904);
  BOOL v15 = v14 != 0;
  unsigned int v16 = v14 - 1;
  *(_DWORD *)(a1 + 3904) = v16;
  if (!v15)
  {
    puts("e: data_sz underflow in get_value");
    char v12 = *(__int16 **)(a1 + 3896);
    unsigned int v16 = *(_DWORD *)(a1 + 3904);
  }
  *(unsigned char *)(v6 + 12290) = v13;
  __int16 v19 = *v12;
  char v17 = v12 + 1;
  __int16 v18 = v19;
  *(void *)(a1 + 3896) = v17;
  BOOL v15 = v16 >= 2;
  unsigned int v20 = v16 - 2;
  *(_DWORD *)(a1 + 3904) = v20;
  if (!v15)
  {
    puts("e: data_sz underflow in get_value");
    char v17 = *(_WORD **)(a1 + 3896);
    unsigned int v20 = *(_DWORD *)(a1 + 3904);
  }
  uint64_t v21 = &v9[v7];
  *(_WORD *)(v6 + 12288) = v18;
  uint64_t v22 = (unsigned __int8 *)(v17 + 1);
  *(void *)(a1 + 3896) = v22;
  *(_DWORD *)(a1 + 3904) = v20 - 2;
  if (v20 < 2)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v22 = *(unsigned __int8 **)(a1 + 3896);
  }
  if (v21 - v22 <= 3)
  {
    uint64_t v8 = "e: underflow while reading sizes";
    goto LABEL_18;
  }
  int v26 = *v22;
  uint64_t v24 = v22 + 1;
  int v25 = v26;
  *(void *)(a1 + 3896) = v24;
  int v27 = *(_DWORD *)(a1 + 3904);
  BOOL v15 = v27 != 0;
  int v28 = v27 - 1;
  *(_DWORD *)(a1 + 3904) = v28;
  if (!v15)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v24 = *(unsigned __int8 **)(a1 + 3896);
    int v28 = *(_DWORD *)(a1 + 3904);
  }
  int v31 = *v24;
  char v29 = (unsigned __int16 *)(v24 + 1);
  int v30 = v31;
  *(void *)(a1 + 3896) = v29;
  BOOL v15 = v28 != 0;
  unsigned int v32 = v28 - 1;
  *(_DWORD *)(a1 + 3904) = v32;
  if (!v15)
  {
    puts("e: data_sz underflow in get_value");
    char v29 = *(unsigned __int16 **)(a1 + 3896);
    unsigned int v32 = *(_DWORD *)(a1 + 3904);
  }
  int v33 = *v29;
  *(void *)(a1 + 3896) = v29 + 1;
  *(_DWORD *)(a1 + 3904) = v32 - 2;
  if (v32 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  if (v25 != 1)
  {
    printf("e: unsupported NAC: %u != %u\n");
    return 0;
  }
  if (v30 != 4)
  {
    printf("e: unsupported NASVD: %u != %u\n");
    return 0;
  }
  if (v33 != 64)
  {
    printf("e: unsupported NHS: %u != %u\n");
    return 0;
  }
  if ((uint64_t)&v21[-*(void *)(a1 + 3896)] < ((v10 * v11) << 10))
  {
    uint64_t v8 = "e: underflow while reading WgTypeA";
    goto LABEL_18;
  }
  int v58 = v9;
  int v59 = v21;
  if (v10)
  {
    uint64_t v34 = 0;
    uint64_t v57 = v6;
    uint64_t v35 = v6;
    uint64_t v62 = v10;
    do
    {
      uint64_t v60 = v34;
      uint64_t v36 = 0;
      uint64_t v37 = v35;
      do
      {
        if (v11)
        {
          uint64_t v38 = 0;
          uint64_t v39 = v37;
          do
          {
            for (uint64_t i = 0; i != 256; i += 4)
            {
              uint64_t v41 = *(__int16 **)(a1 + 3896);
              __int16 v42 = *v41;
              *(void *)(a1 + 3896) = v41 + 1;
              LODWORD(v41) = *(_DWORD *)(a1 + 3904);
              *(_DWORD *)(a1 + 3904) = v41 - 2;
              if (v41 < 2) {
                puts("e: data_sz underflow in get_value");
              }
              *(_WORD *)(v39 + i) = v42;
            }
            ++v38;
            v39 += 256;
          }
          while (v38 != v11);
        }
        ++v36;
        v37 += 768;
      }
      while (v36 != 4);
      uint64_t v34 = v60 + 1;
      v35 += 3072;
    }
    while (v60 + 1 != v62);
    uint64_t v43 = 0;
    uint64_t v44 = v57 + 2;
    do
    {
      uint64_t v61 = v43;
      uint64_t v45 = 0;
      uint64_t v46 = v44;
      do
      {
        if (v11)
        {
          uint64_t v47 = 0;
          uint64_t v48 = v46;
          do
          {
            for (uint64_t j = 0; j != 256; j += 4)
            {
              uint64_t v50 = *(__int16 **)(a1 + 3896);
              __int16 v51 = *v50;
              *(void *)(a1 + 3896) = v50 + 1;
              LODWORD(v50) = *(_DWORD *)(a1 + 3904);
              *(_DWORD *)(a1 + 3904) = v50 - 2;
              if (v50 < 2) {
                puts("e: data_sz underflow in get_value");
              }
              *(_WORD *)(v48 + j) = v51;
            }
            ++v47;
            v48 += 256;
          }
          while (v47 != v11);
        }
        ++v45;
        v46 += 768;
      }
      while (v45 != 4);
      uint64_t v43 = v61 + 1;
      v44 += 3072;
    }
    while (v61 + 1 != v62);
  }
  uint64_t v52 = *(void *)(a1 + 3896);
  if ((uint64_t)&v58[-v52] >= 0) {
    uint64_t v53 = -(uint64_t)((unint64_t)&v58[-v52] & 3);
  }
  else {
    LODWORD(v53) = (v52 - v58) & 3;
  }
  if (v53)
  {
    int v54 = v53 - 4;
    int v55 = v59;
    do
    {
      ++*(void *)(a1 + 3896);
      int v56 = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v56 - 1;
      if (!v56) {
        puts("e: data_sz underflow in get_value");
      }
      BOOL v15 = __CFADD__(v54++, 1);
    }
    while (!v15);
    uint64_t v52 = *(void *)(a1 + 3896);
  }
  else
  {
    int v55 = v59;
  }
  if ((unsigned char *)v52 != v55)
  {
    uint64_t v8 = "e: parsing did not consume the full HTMP size";
    goto LABEL_18;
  }
  return 1;
}

uint64_t sub_10001AA40(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) != 0x10000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 2840);
  if (*(_DWORD *)v3 != 4)
  {
    printf("e: mismatching versions: %u != %u\n");
    return 0;
  }
  uint64_t v4 = (4 * *(_DWORD *)(a2 + 8) - 12);
  if (v4 <= 6)
  {
    uint64_t v5 = "e: underflow while reading limits";
LABEL_67:
    puts(v5);
    return 0;
  }
  uint64_t v6 = *(_WORD **)(a1 + 3896);
  uint64_t v7 = *(unsigned __int16 *)(v3 + 20116);
  uint64_t v8 = *(unsigned __int16 *)(v3 + 20118);
  uint64_t v10 = *(unsigned int *)(v3 + 20092);
  uint64_t v9 = *(unsigned int *)(v3 + 20096);
  uint64_t v11 = v6 + 1;
  __int16 v12 = *v6;
  *(void *)(a1 + 3896) = v6 + 1;
  unsigned int v13 = *(_DWORD *)(a1 + 3904);
  BOOL v14 = v13 >= 2;
  unsigned int v15 = v13 - 2;
  *(_DWORD *)(a1 + 3904) = v15;
  if (!v14)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v11 = *(_WORD **)(a1 + 3896);
    unsigned int v15 = *(_DWORD *)(a1 + 3904);
  }
  *(_WORD *)(v3 + 20084) = v12;
  unsigned int v16 = v11 + 1;
  *(void *)(a1 + 3896) = v16;
  BOOL v14 = v15 >= 2;
  unsigned int v17 = v15 - 2;
  *(_DWORD *)(a1 + 3904) = v17;
  if (!v14)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v16 = *(_WORD **)(a1 + 3896);
    unsigned int v17 = *(_DWORD *)(a1 + 3904);
  }
  __int16 v18 = (char *)(v16 + 1);
  *(void *)(a1 + 3896) = v18;
  BOOL v14 = v17 >= 2;
  unsigned int v19 = v17 - 2;
  *(_DWORD *)(a1 + 3904) = v19;
  if (!v14)
  {
    puts("e: data_sz underflow in get_value");
    __int16 v18 = *(char **)(a1 + 3896);
    unsigned int v19 = *(_DWORD *)(a1 + 3904);
  }
  unsigned int v20 = (char *)v6 + v4;
  char v23 = *v18;
  uint64_t v21 = v18 + 1;
  char v22 = v23;
  *(void *)(a1 + 3896) = v21;
  *(_DWORD *)(a1 + 3904) = v19 - 1;
  if (!v19)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v21 = *(unsigned char **)(a1 + 3896);
  }
  *(unsigned char *)(v3 + 20086) = v22;
  if (v20 - v21 < 5 * v10 * (unint64_t)v9 * v7)
  {
    uint64_t v5 = "e: underflow while reading LUT entries";
    goto LABEL_67;
  }
  unint64_t v62 = 5 * v10 * (unint64_t)v9 * v7;
  int v63 = v20;
  uint64_t v60 = v10;
  uint64_t v61 = v8;
  int v59 = (char *)v6;
  if (v7)
  {
    uint64_t v24 = 0;
    int v25 = (_DWORD *)(v3 + 12416);
    do
    {
      uint64_t v26 = v9;
      int v27 = v25;
      if (v9)
      {
        do
        {
          int v28 = *(int **)(a1 + 3896);
          int v29 = *v28;
          *(void *)(a1 + 3896) = v28 + 1;
          LODWORD(v28) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v28 - 4;
          if (v28 < 4) {
            puts("e: data_sz underflow in get_value");
          }
          *int v27 = v29;
          v27 += 128;
          --v26;
        }
        while (v26);
      }
      ++v24;
      ++v25;
    }
    while (v24 != v7);
    uint64_t v30 = 0;
    int v31 = (_DWORD *)(v3 + 13952);
    do
    {
      uint64_t v32 = v9;
      int v33 = v31;
      if (v9)
      {
        do
        {
          uint64_t v34 = *(unsigned __int8 **)(a1 + 3896);
          int v35 = *v34;
          *(void *)(a1 + 3896) = v34 + 1;
          LODWORD(v34) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v34 - 1;
          if (!v34) {
            puts("e: data_sz underflow in get_value");
          }
          *int v33 = v35;
          v33 += 128;
          --v32;
        }
        while (v32);
      }
      ++v30;
      ++v31;
    }
    while (v30 != v7);
  }
  if ((unint64_t)&v63[-*(void *)(a1 + 3896)] < v62)
  {
    uint64_t v5 = "e: underflow while reading LUT coords";
    goto LABEL_67;
  }
  if (v7)
  {
    uint64_t v36 = 0;
    uint64_t v37 = (_DWORD *)(v3 + 15488);
    do
    {
      uint64_t v38 = v9;
      uint64_t v39 = v37;
      if (v9)
      {
        do
        {
          int v40 = *(int **)(a1 + 3896);
          int v41 = *v40;
          *(void *)(a1 + 3896) = v40 + 1;
          LODWORD(v40) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v40 - 4;
          if (v40 < 4) {
            puts("e: data_sz underflow in get_value");
          }
          *uint64_t v39 = v41;
          v39 += 128;
          --v38;
        }
        while (v38);
      }
      ++v36;
      ++v37;
    }
    while (v36 != v7);
    uint64_t v42 = 0;
    uint64_t v43 = (_DWORD *)(v3 + 17024);
    do
    {
      uint64_t v44 = v9;
      uint64_t v45 = v43;
      if (v9)
      {
        do
        {
          uint64_t v46 = *(unsigned __int8 **)(a1 + 3896);
          int v47 = *v46;
          *(void *)(a1 + 3896) = v46 + 1;
          LODWORD(v46) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v46 - 1;
          if (!v46) {
            puts("e: data_sz underflow in get_value");
          }
          *uint64_t v45 = v47;
          v45 += 128;
          --v44;
        }
        while (v44);
      }
      ++v42;
      ++v43;
    }
    while (v42 != v7);
  }
  uint64_t v48 = *(char **)(a1 + 3896);
  if (v63 - v48 < 4 * v9 * (unint64_t)v61 * v60)
  {
    uint64_t v5 = "e: underflow while reading LUT steps";
    goto LABEL_67;
  }
  if (v61)
  {
    uint64_t v49 = 0;
    uint64_t v50 = (_DWORD *)(v3 + 18560);
    do
    {
      uint64_t v51 = v9;
      uint64_t v52 = v50;
      if (v9)
      {
        do
        {
          uint64_t v53 = *(int **)(a1 + 3896);
          int v54 = *v53;
          *(void *)(a1 + 3896) = v53 + 1;
          LODWORD(v53) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v53 - 4;
          if (v53 < 4) {
            puts("e: data_sz underflow in get_value");
          }
          *uint64_t v52 = v54;
          v52 += 127;
          --v51;
        }
        while (v51);
      }
      ++v49;
      ++v50;
    }
    while (v49 != v61);
    uint64_t v48 = *(char **)(a1 + 3896);
  }
  if (v59 - v48 >= 0) {
    uint64_t v55 = -((v59 - v48) & 3);
  }
  else {
    LODWORD(v55) = (v48 - v59) & 3;
  }
  if (v55)
  {
    int v56 = v55 - 4;
    do
    {
      ++*(void *)(a1 + 3896);
      int v57 = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v57 - 1;
      if (!v57) {
        puts("e: data_sz underflow in get_value");
      }
      BOOL v14 = __CFADD__(v56++, 1);
    }
    while (!v14);
    uint64_t v48 = *(char **)(a1 + 3896);
  }
  if (v48 != v63)
  {
    uint64_t v5 = "e: parsing did not consume the full PDCC size";
    goto LABEL_67;
  }
  return 1;
}

uint64_t sub_10001AEB4(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) != 327680)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  uint64_t v3 = *(_DWORD **)(a1 + 2840);
  if (*v3 != 5)
  {
    printf("e: mismatching versions: %u != %u\n");
    return 0;
  }
  uint64_t v4 = (4 * *(_DWORD *)(a2 + 8) - 12);
  if (v4 <= 0xB)
  {
    uint64_t v5 = "e: cannot read data in CNST";
LABEL_5:
    puts(v5);
    return 0;
  }
  uint64_t v7 = *(void *)(a1 + 3896);
  uint64_t v8 = (unsigned __int8 *)(v7 + 1);
  *(void *)(a1 + 3896) = v7 + 1;
  int v9 = *(_DWORD *)(a1 + 3904);
  BOOL v10 = v9 != 0;
  int v11 = v9 - 1;
  *(_DWORD *)(a1 + 3904) = v11;
  if (!v10)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v8 = *(unsigned __int8 **)(a1 + 3896);
    int v11 = *(_DWORD *)(a1 + 3904);
  }
  unsigned int v13 = *v8;
  __int16 v12 = v8 + 1;
  unsigned int v50 = v13;
  *(void *)(a1 + 3896) = v12;
  BOOL v10 = v11 != 0;
  int v14 = v11 - 1;
  *(_DWORD *)(a1 + 3904) = v14;
  if (!v10)
  {
    puts("e: data_sz underflow in get_value");
    __int16 v12 = *(unsigned __int8 **)(a1 + 3896);
    int v14 = *(_DWORD *)(a1 + 3904);
  }
  unsigned int v16 = *v12;
  unsigned int v15 = v12 + 1;
  unsigned int v49 = v16;
  *(void *)(a1 + 3896) = v15;
  BOOL v10 = v14 != 0;
  int v17 = v14 - 1;
  *(_DWORD *)(a1 + 3904) = v17;
  if (!v10)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v15 = *(unsigned __int8 **)(a1 + 3896);
    int v17 = *(_DWORD *)(a1 + 3904);
  }
  unsigned int v19 = *v15;
  __int16 v18 = v15 + 1;
  unsigned int v48 = v19;
  *(void *)(a1 + 3896) = v18;
  BOOL v10 = v17 != 0;
  int v20 = v17 - 1;
  *(_DWORD *)(a1 + 3904) = v20;
  if (!v10)
  {
    puts("e: data_sz underflow in get_value");
    __int16 v18 = *(unsigned __int8 **)(a1 + 3896);
    int v20 = *(_DWORD *)(a1 + 3904);
  }
  unsigned int v23 = *v18;
  uint64_t v21 = v18 + 1;
  unsigned int v22 = v23;
  *(void *)(a1 + 3896) = v21;
  BOOL v10 = v20 != 0;
  int v24 = v20 - 1;
  *(_DWORD *)(a1 + 3904) = v24;
  if (!v10)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v21 = *(unsigned __int8 **)(a1 + 3896);
    int v24 = *(_DWORD *)(a1 + 3904);
  }
  unsigned int v27 = *v21;
  int v25 = v21 + 1;
  unsigned int v26 = v27;
  *(void *)(a1 + 3896) = v25;
  BOOL v10 = v24 != 0;
  int v28 = v24 - 1;
  *(_DWORD *)(a1 + 3904) = v28;
  if (!v10)
  {
    puts("e: data_sz underflow in get_value");
    int v25 = *(unsigned __int8 **)(a1 + 3896);
    int v28 = *(_DWORD *)(a1 + 3904);
  }
  unsigned int v31 = *v25;
  int v29 = v25 + 1;
  unsigned int v30 = v31;
  *(void *)(a1 + 3896) = v29;
  BOOL v10 = v28 != 0;
  int v32 = v28 - 1;
  *(_DWORD *)(a1 + 3904) = v32;
  if (!v10)
  {
    puts("e: data_sz underflow in get_value");
    int v29 = *(unsigned __int8 **)(a1 + 3896);
    int v32 = *(_DWORD *)(a1 + 3904);
  }
  unsigned int v35 = *v29;
  int v33 = (unsigned __int16 *)(v29 + 1);
  unsigned int v34 = v35;
  *(void *)(a1 + 3896) = v33;
  BOOL v10 = v32 != 0;
  unsigned int v36 = v32 - 1;
  *(_DWORD *)(a1 + 3904) = v36;
  if (!v10)
  {
    puts("e: data_sz underflow in get_value");
    int v33 = *(unsigned __int16 **)(a1 + 3896);
    unsigned int v36 = *(_DWORD *)(a1 + 3904);
  }
  unsigned int v39 = *v33;
  uint64_t v37 = v33 + 1;
  unsigned int v38 = v39;
  *(void *)(a1 + 3896) = v37;
  BOOL v10 = v36 >= 2;
  unsigned int v40 = v36 - 2;
  *(_DWORD *)(a1 + 3904) = v40;
  if (!v10)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v37 = *(unsigned __int16 **)(a1 + 3896);
    unsigned int v40 = *(_DWORD *)(a1 + 3904);
  }
  unsigned int v41 = *v37;
  *(void *)(a1 + 3896) = v37 + 1;
  *(_DWORD *)(a1 + 3904) = v40 - 2;
  if (v40 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  if (v26 >= 5)
  {
    printf("e: unsupported region count: %u > %u\n");
    return 0;
  }
  if (v30 >= 2)
  {
    printf("e: unsupported sensor channel count: %u > %u\n");
    return 0;
  }
  if (v34 >= 4)
  {
    printf("e: unsupported color count: %u > %u\n");
    return 0;
  }
  if (v38 >= 0x81)
  {
    printf("e: unsupported gray value count: %u > %u\n");
    return 0;
  }
  if (v41 >= 0x80)
  {
    printf("e: unsupported gray step count: %u > %u\n");
    return 0;
  }
  if (v50 >= 2)
  {
    printf("e: unsupported htmp emission freq count: %u > %u\n");
    return 0;
  }
  if (v49 >= 3)
  {
    printf("e: unsupported benl emission freq count: %u > %u\n");
    return 0;
  }
  if (v48 >= 3)
  {
    printf("e: unsupported pdcc emission freq count: %u > %u\n");
    return 0;
  }
  if (v22 >= 3)
  {
    printf("e: unsupported pdmc emission freq count: %u > %u\n");
    return 0;
  }
  uint64_t v42 = v3 + 43008;
  uint64_t v43 = v7 + v4;
  *uint64_t v42 = v26;
  v42[1] = v30;
  v42[2] = v34;
  *((_WORD *)v42 + 14) = v38;
  *((_WORD *)v42 + 15) = v41;
  *((unsigned char *)v42 + 24) = v49;
  *((unsigned char *)v42 + 25) = v48;
  *((unsigned char *)v42 + 26) = v22;
  *(_WORD *)(a1 + 3888) = 0;
  *(unsigned char *)(a1 + 3890) = 0;
  uint64_t v44 = *(void *)(a1 + 3896);
  if (v7 - v44 >= 0) {
    uint64_t v45 = -((v7 - v44) & 3);
  }
  else {
    LODWORD(v45) = (v44 - v7) & 3;
  }
  if (v45)
  {
    int v46 = v45 - 4;
    do
    {
      ++*(void *)(a1 + 3896);
      int v47 = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v47 - 1;
      if (!v47) {
        puts("e: data_sz underflow in get_value");
      }
      BOOL v10 = __CFADD__(v46++, 1);
    }
    while (!v10);
    uint64_t v44 = *(void *)(a1 + 3896);
  }
  if (v44 != v43)
  {
    uint64_t v5 = "e: parsing did not consume the full CNST size";
    goto LABEL_5;
  }
  return 1;
}

uint64_t sub_10001B2B4(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) != 0x10000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  if (*(_DWORD *)(a1 + 2832) != 5)
  {
    printf("e: mismatching versions: %u != 5\n");
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 2840);
  unsigned int v4 = *(unsigned __int8 *)(a1 + 3888);
  if (v4 >= *(unsigned __int8 *)(v3 + 172056))
  {
    printf("e: Too many BENL blocks, expected %u\n");
    return 0;
  }
  int v5 = 4 * *(_DWORD *)(a2 + 8);
  uint64_t v6 = (v5 - 12);
  if (v5 == 12)
  {
    int v20 = "e: underflow while temperature / emission_freq / NBBL";
LABEL_76:
    puts(v20);
    return 0;
  }
  uint64_t v7 = *(void *)(a1 + 3896);
  uint64_t v67 = *(unsigned __int16 *)(v3 + 172060);
  uint64_t v8 = *(unsigned __int16 *)(v3 + 172062);
  uint64_t v9 = *(unsigned int *)(v3 + 172040);
  BOOL v10 = (_WORD *)(v7 + 1);
  *(void *)(a1 + 3896) = v7 + 1;
  int v11 = *(_DWORD *)(a1 + 3904);
  BOOL v12 = v11 != 0;
  unsigned int v13 = v11 - 1;
  *(_DWORD *)(a1 + 3904) = v13;
  if (!v12)
  {
    puts("e: data_sz underflow in get_value");
    BOOL v10 = *(_WORD **)(a1 + 3896);
    unsigned int v13 = *(_DWORD *)(a1 + 3904);
  }
  __int16 v16 = *v10;
  int v14 = (unsigned __int8 *)(v10 + 1);
  __int16 v15 = v16;
  *(void *)(a1 + 3896) = v14;
  BOOL v12 = v13 >= 2;
  unsigned int v17 = v13 - 2;
  *(_DWORD *)(a1 + 3904) = v17;
  if (!v12)
  {
    puts("e: data_sz underflow in get_value");
    int v14 = *(unsigned __int8 **)(a1 + 3896);
    unsigned int v17 = *(_DWORD *)(a1 + 3904);
  }
  *(_WORD *)(v3 + 16200 * v4 + 12416) = v15;
  uint64_t v18 = *v14;
  *(void *)(a1 + 3896) = v14 + 1;
  *(_DWORD *)(a1 + 3904) = v17 - 1;
  if (!v17) {
    puts("e: data_sz underflow in get_value");
  }
  *(unsigned char *)(v3 + 16200 * v4 + 12418) = v18;
  if (v18 >= 0x13)
  {
    printf("e: unsupported NBBL: %u > %u\n");
    return 0;
  }
  uint64_t v21 = v7 + v6;
  uint64_t v22 = *(void *)(a1 + 3896);
  unint64_t v23 = v7 + v6 - v22;
  if (v23 < 2 * v18)
  {
    int v20 = "e: underflow while reading bright taps";
    goto LABEL_76;
  }
  uint64_t v24 = 2 * v18;
  if (!v18)
  {
    unsigned int v30 = v67;
    if (v23 >= v9 * (unint64_t)v67 * v24) {
      goto LABEL_38;
    }
LABEL_37:
    int v20 = "e: underflow while reading BENL LUT";
    goto LABEL_76;
  }
  unsigned int v62 = v4;
  uint64_t v64 = v7 + v6;
  uint64_t v25 = v3 + 16200 * v4;
  uint64_t v26 = v18;
  unsigned int v27 = (_DWORD *)(v25 + 12419);
  uint64_t v66 = v26;
  do
  {
    int v28 = *(unsigned __int16 **)(a1 + 3896);
    int v29 = *v28;
    *(void *)(a1 + 3896) = v28 + 1;
    LODWORD(v28) = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v28 - 2;
    if (v28 < 2) {
      puts("e: data_sz underflow in get_value");
    }
    *v27++ = v29 << 16;
    --v26;
  }
  while (v26);
  unsigned int v30 = v67;
  if (v64 - *(void *)(a1 + 3896) < v9 * (unint64_t)v67 * v24) {
    goto LABEL_37;
  }
  uint64_t v57 = v7;
  uint64_t v31 = v3;
  uint64_t v32 = 0;
  uint64_t v58 = v31;
  uint64_t v60 = v8;
  uint64_t v33 = v31 + 16200 * v62 + 14792;
  do
  {
    if (v30)
    {
      uint64_t v34 = 0;
      unsigned int v35 = (_WORD *)v33;
      do
      {
        uint64_t v36 = v9;
        uint64_t v37 = v35;
        if (v9)
        {
          do
          {
            unsigned int v38 = *(__int16 **)(a1 + 3896);
            __int16 v39 = *v38;
            *(void *)(a1 + 3896) = v38 + 1;
            LODWORD(v38) = *(_DWORD *)(a1 + 3904);
            *(_DWORD *)(a1 + 3904) = v38 - 2;
            if (v38 < 2) {
              puts("e: data_sz underflow in get_value");
            }
            *uint64_t v37 = v39;
            v37 += 128;
            --v36;
          }
          while (v36);
        }
        ++v34;
        ++v35;
        unsigned int v30 = v67;
      }
      while (v34 != v67);
    }
    ++v32;
    v33 += 768;
  }
  while (v32 != v66);
  uint64_t v22 = *(void *)(a1 + 3896);
  unsigned int v4 = v62;
  uint64_t v21 = v64;
  unint64_t v23 = v64 - v22;
  uint64_t v7 = v57;
  uint64_t v3 = v58;
  uint64_t v8 = v60;
LABEL_38:
  if (v23 < 2 * v30 * (unint64_t)v9)
  {
    int v20 = "e: underflow while reading BENL coords";
    goto LABEL_76;
  }
  uint64_t v65 = v21;
  if (v30)
  {
    uint64_t v59 = v3;
    uint64_t v61 = v8;
    unint64_t v40 = 0;
    unsigned int v63 = v4;
    uint64_t v41 = v3 + 16200 * v4 + 12496;
    do
    {
      if (v9)
      {
        uint64_t v42 = (int *)(v41 + 4 * (v40 >> 1));
        if (v40) {
          int v43 = -268369921;
        }
        else {
          int v43 = -4096;
        }
        uint64_t v44 = v9;
        do
        {
          uint64_t v45 = *(__int16 **)(a1 + 3896);
          __int16 v46 = *v45;
          *(void *)(a1 + 3896) = v45 + 1;
          LODWORD(v45) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v45 - 2;
          if (v45 < 2) {
            puts("e: data_sz underflow in get_value");
          }
          int v47 = (v46 & 0xFFF) << 16;
          if ((v40 & 1) == 0) {
            int v47 = v46 & 0xFFF;
          }
          *uint64_t v42 = *v42 & v43 | v47;
          v42 += 64;
          --v44;
        }
        while (v44);
      }
      ++v40;
    }
    while (v40 != v67);
    uint64_t v22 = *(void *)(a1 + 3896);
    unsigned int v4 = v63;
    uint64_t v21 = v65;
    unint64_t v23 = v65 - v22;
    uint64_t v3 = v59;
    uint64_t v8 = v61;
  }
  if (v23 < 4 * v8 * (unint64_t)v9)
  {
    int v20 = "e: underflow while reading BENL steps";
    goto LABEL_76;
  }
  if (v8)
  {
    uint64_t v48 = 0;
    uint64_t v49 = v3 + 16200 * v4 + 13264;
    do
    {
      uint64_t v50 = v9;
      uint64_t v51 = (_DWORD *)v49;
      if (v9)
      {
        do
        {
          uint64_t v52 = *(int **)(a1 + 3896);
          int v53 = *v52;
          *(void *)(a1 + 3896) = v52 + 1;
          LODWORD(v52) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v52 - 4;
          if (v52 < 4) {
            puts("e: data_sz underflow in get_value");
          }
          *uint64_t v51 = v53;
          v51 += 127;
          --v50;
        }
        while (v50);
      }
      ++v48;
      v49 += 4;
    }
    while (v48 != v8);
    uint64_t v22 = *(void *)(a1 + 3896);
    uint64_t v21 = v65;
  }
  if (v7 - v22 >= 0) {
    uint64_t v54 = -((v7 - v22) & 3);
  }
  else {
    LODWORD(v54) = (v22 - v7) & 3;
  }
  if (v54)
  {
    int v55 = v54 - 4;
    do
    {
      ++*(void *)(a1 + 3896);
      int v56 = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v56 - 1;
      if (!v56) {
        puts("e: data_sz underflow in get_value");
      }
      BOOL v12 = __CFADD__(v55++, 1);
    }
    while (!v12);
    uint64_t v22 = *(void *)(a1 + 3896);
  }
  if (v22 != v21)
  {
    int v20 = "e: parsing did not consume the full BENL size";
    goto LABEL_76;
  }
  ++*(unsigned char *)(a1 + 3888);
  return 1;
}

uint64_t sub_10001B7A4(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) != 0x20000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  if (*(_DWORD *)(a1 + 2832) != 5)
  {
    printf("e: mismatching versions: %u != 5\n");
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 2840);
  unsigned int v4 = *(unsigned __int8 *)(a1 + 3889);
  if (v4 >= *(unsigned __int8 *)(v3 + 172057))
  {
    printf("e: Too many PDCC blocks, expected %u\n");
    return 0;
  }
  uint64_t v5 = (4 * *(_DWORD *)(a2 + 8) - 12);
  if (v5 < 7)
  {
    uint64_t v6 = "e: underflow while temperature / emission_freq / NPCT";
LABEL_6:
    puts(v6);
    return 0;
  }
  uint64_t v8 = *(_WORD **)(a1 + 3896);
  uint64_t v9 = *(unsigned __int16 *)(v3 + 172060);
  uint64_t v10 = *(unsigned __int16 *)(v3 + 172062);
  uint64_t v11 = *(unsigned int *)(v3 + 172040);
  BOOL v12 = v8 + 1;
  __int16 v13 = *v8;
  *(void *)(a1 + 3896) = v8 + 1;
  unsigned int v14 = *(_DWORD *)(a1 + 3904);
  BOOL v15 = v14 >= 2;
  unsigned int v16 = v14 - 2;
  *(_DWORD *)(a1 + 3904) = v16;
  if (!v15)
  {
    puts("e: data_sz underflow in get_value");
    BOOL v12 = *(_WORD **)(a1 + 3896);
    unsigned int v16 = *(_DWORD *)(a1 + 3904);
  }
  *(_WORD *)(v3 + 47672 * v4 + 44816) = v13;
  unsigned int v17 = v12 + 1;
  *(void *)(a1 + 3896) = v17;
  BOOL v15 = v16 >= 2;
  unsigned int v18 = v16 - 2;
  *(_DWORD *)(a1 + 3904) = v18;
  if (!v15)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v17 = *(_WORD **)(a1 + 3896);
    unsigned int v18 = *(_DWORD *)(a1 + 3904);
  }
  __int16 v21 = *v17;
  unsigned int v19 = (unsigned __int8 *)(v17 + 1);
  __int16 v20 = v21;
  *(void *)(a1 + 3896) = v19;
  BOOL v15 = v18 >= 2;
  unsigned int v22 = v18 - 2;
  *(_DWORD *)(a1 + 3904) = v22;
  if (!v15)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v19 = *(unsigned __int8 **)(a1 + 3896);
    unsigned int v22 = *(_DWORD *)(a1 + 3904);
  }
  *(_WORD *)(v3 + 47672 * v4 + 44818) = v20;
  unint64_t v23 = *v19;
  *(void *)(a1 + 3896) = v19 + 1;
  *(_DWORD *)(a1 + 3904) = v22 - 1;
  if (!v22) {
    puts("e: data_sz underflow in get_value");
  }
  *(unsigned char *)(v3 + 47672 * v4 + 44820) = v23;
  if (v23 >= 0xF)
  {
    printf("e: unsupported NPCT: %u > %u\n");
    return 0;
  }
  uint64_t v24 = (char *)v8 + v5;
  unint64_t v25 = (unint64_t)v8 + v5 - *(void *)(a1 + 3896);
  if (v25 < v23)
  {
    uint64_t v6 = "e: underflow while reading temp taps";
    goto LABEL_6;
  }
  if (!v23)
  {
    unint64_t v46 = v11 * (unint64_t)v9;
    if (v25 >= 5 * v46 * v23) {
      goto LABEL_50;
    }
LABEL_49:
    uint64_t v6 = "e: underflow while reading PDCC LUT";
    goto LABEL_6;
  }
  __int16 v75 = (char *)v8 + v5;
  unsigned int v77 = v4;
  unint64_t v26 = v23;
  unsigned int v27 = (_DWORD *)(v3 + 47672 * v4 + 44821);
  unint64_t v83 = v26;
  do
  {
    int v28 = *(unsigned __int8 **)(a1 + 3896);
    int v29 = *v28;
    *(void *)(a1 + 3896) = v28 + 1;
    LODWORD(v28) = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v28 - 1;
    if (!v28) {
      puts("e: data_sz underflow in get_value");
    }
    *v27++ = v29 << 16;
    --v26;
  }
  while (v26);
  if ((unint64_t)&v75[-*(void *)(a1 + 3896)] < 5
                                                       * v11
                                                       * (unint64_t)v9
                                                       * v83)
    goto LABEL_49;
  uint64_t v71 = v8;
  uint64_t v79 = v10;
  uint64_t v30 = 0;
  uint64_t v73 = v3;
  uint64_t v31 = v3 + 47672 * v77 + 49480;
  do
  {
    uint64_t v81 = v30;
    if (v9)
    {
      uint64_t v32 = 0;
      uint64_t v33 = (void *)v31;
      do
      {
        uint64_t v34 = v11;
        unsigned int v35 = v33;
        if (v11)
        {
          do
          {
            uint64_t v36 = *(unsigned int **)(a1 + 3896);
            uint64_t v37 = *v36;
            *(void *)(a1 + 3896) = v36 + 1;
            LODWORD(v36) = *(_DWORD *)(a1 + 3904);
            *(_DWORD *)(a1 + 3904) = v36 - 4;
            if (v36 < 4) {
              puts("e: data_sz underflow in get_value");
            }
            *unsigned int v35 = v37;
            v35 += 128;
            --v34;
          }
          while (v34);
        }
        ++v32;
        ++v33;
      }
      while (v32 != v9);
    }
    uint64_t v30 = v81 + 1;
    v31 += 3072;
  }
  while (v81 + 1 != v83);
  uint64_t v38 = 0;
  uint64_t v39 = v73 + 47672 * v77 + 49480;
  do
  {
    uint64_t v82 = v38;
    if (v9)
    {
      uint64_t v40 = 0;
      uint64_t v41 = (void *)v39;
      do
      {
        uint64_t v42 = v11;
        int v43 = v41;
        if (v11)
        {
          do
          {
            uint64_t v44 = *(unsigned __int8 **)(a1 + 3896);
            uint64_t v45 = *v44;
            *(void *)(a1 + 3896) = v44 + 1;
            LODWORD(v44) = *(_DWORD *)(a1 + 3904);
            *(_DWORD *)(a1 + 3904) = v44 - 1;
            if (!v44) {
              puts("e: data_sz underflow in get_value");
            }
            *v43 |= v45 << 32;
            v43 += 128;
            --v42;
          }
          while (v42);
        }
        ++v40;
        ++v41;
      }
      while (v40 != v9);
    }
    uint64_t v38 = v82 + 1;
    v39 += 3072;
  }
  while (v82 + 1 != v83);
  uint64_t v8 = v71;
  unint64_t v46 = v11 * (unint64_t)v9;
  unsigned int v4 = v77;
  uint64_t v10 = v79;
  uint64_t v3 = v73;
  uint64_t v24 = v75;
LABEL_50:
  int v47 = *(char **)(a1 + 3896);
  unint64_t v48 = v24 - v47;
  if (v24 - v47 < 4 * v46)
  {
    uint64_t v6 = "e: underflow while reading PDCC coords LSB";
    goto LABEL_6;
  }
  unsigned int v78 = v4;
  uint64_t v80 = v10;
  if (!v9)
  {
    if (v48 >= v46) {
      goto LABEL_69;
    }
LABEL_68:
    uint64_t v6 = "e: underflow while reading PDCC coords MSB";
    goto LABEL_6;
  }
  unint64_t v72 = v46;
  uint64_t v74 = v3;
  uint64_t v76 = v24;
  uint64_t v49 = 0;
  uint64_t v50 = v3 + 47672 * v4 + 44880;
  do
  {
    uint64_t v51 = v11;
    uint64_t v52 = (_DWORD *)v50;
    if (v11)
    {
      do
      {
        int v53 = *(int **)(a1 + 3896);
        int v54 = *v53;
        *(void *)(a1 + 3896) = v53 + 1;
        LODWORD(v53) = *(_DWORD *)(a1 + 3904);
        *(_DWORD *)(a1 + 3904) = v53 - 4;
        if (v53 < 4) {
          puts("e: data_sz underflow in get_value");
        }
        *uint64_t v52 = v54;
        v52 += 128;
        --v51;
      }
      while (v51);
    }
    ++v49;
    v50 += 4;
  }
  while (v49 != v9);
  if ((unint64_t)&v76[-*(void *)(a1 + 3896)] < v72) {
    goto LABEL_68;
  }
  uint64_t v55 = 0;
  uint64_t v56 = v74 + 47672 * v78 + 46416;
  do
  {
    uint64_t v57 = v11;
    uint64_t v58 = (_DWORD *)v56;
    if (v11)
    {
      do
      {
        uint64_t v59 = *(unsigned __int8 **)(a1 + 3896);
        int v60 = *v59;
        *(void *)(a1 + 3896) = v59 + 1;
        LODWORD(v59) = *(_DWORD *)(a1 + 3904);
        *(_DWORD *)(a1 + 3904) = v59 - 1;
        if (!v59) {
          puts("e: data_sz underflow in get_value");
        }
        _DWORD *v58 = v60;
        v58 += 128;
        --v57;
      }
      while (v57);
    }
    ++v55;
    v56 += 4;
  }
  while (v55 != v9);
  int v47 = *(char **)(a1 + 3896);
  uint64_t v3 = v74;
  uint64_t v24 = v76;
  unint64_t v48 = v76 - v47;
LABEL_69:
  if (v48 < 4 * v80 * (unint64_t)v11)
  {
    uint64_t v6 = "e: underflow while reading PDCC steps";
    goto LABEL_6;
  }
  if (v80)
  {
    uint64_t v61 = v24;
    uint64_t v62 = 0;
    uint64_t v63 = v3 + 47672 * v78 + 47952;
    do
    {
      uint64_t v64 = v11;
      uint64_t v65 = (_DWORD *)v63;
      if (v11)
      {
        do
        {
          uint64_t v66 = *(int **)(a1 + 3896);
          int v67 = *v66;
          *(void *)(a1 + 3896) = v66 + 1;
          LODWORD(v66) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v66 - 4;
          if (v66 < 4) {
            puts("e: data_sz underflow in get_value");
          }
          *uint64_t v65 = v67;
          v65 += 127;
          --v64;
        }
        while (v64);
      }
      ++v62;
      v63 += 4;
    }
    while (v62 != v80);
    int v47 = *(char **)(a1 + 3896);
    uint64_t v24 = v61;
  }
  if ((char *)v8 - v47 >= 0) {
    uint64_t v68 = -(((char *)v8 - v47) & 3);
  }
  else {
    LODWORD(v68) = (v47 - v8) & 3;
  }
  if (v68)
  {
    int v69 = v68 - 4;
    do
    {
      ++*(void *)(a1 + 3896);
      int v70 = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v70 - 1;
      if (!v70) {
        puts("e: data_sz underflow in get_value");
      }
      BOOL v15 = __CFADD__(v69++, 1);
    }
    while (!v15);
    int v47 = *(char **)(a1 + 3896);
  }
  if (v47 != v24)
  {
    uint64_t v6 = "e: parsing did not consume the full PDCC size";
    goto LABEL_6;
  }
  ++*(unsigned char *)(a1 + 3889);
  return 1;
}

uint64_t sub_10001BDF0(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) != 0x10000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  if (*(_DWORD *)(a1 + 2832) != 5)
  {
    printf("e: mismatching versions: %u != 5\n");
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 2840);
  unsigned int v4 = *(unsigned __int8 *)(a1 + 3890);
  if (v4 >= *(unsigned __int8 *)(v3 + 172058))
  {
    printf("e: Too many PDMC blocks, expected %u\n");
    return 0;
  }
  uint64_t v5 = (4 * *(_DWORD *)(a2 + 8) - 12);
  if (v5 < 7)
  {
    uint64_t v6 = "e: underflow while temperature / emission_freq / NPMT";
LABEL_6:
    puts(v6);
    return 0;
  }
  uint64_t v8 = *(void *)(a1 + 3896);
  unint64_t v9 = *(unsigned __int16 *)(v3 + 172060);
  uint64_t v10 = *(unsigned __int16 *)(v3 + 172062);
  uint64_t v11 = v8 + 2;
  *(void *)(a1 + 3896) = v8 + 2;
  unsigned int v12 = *(_DWORD *)(a1 + 3904);
  BOOL v13 = v12 >= 2;
  unsigned int v14 = v12 - 2;
  *(_DWORD *)(a1 + 3904) = v14;
  if (!v13)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v11 = *(void *)(a1 + 3896);
    unsigned int v14 = *(_DWORD *)(a1 + 3904);
  }
  BOOL v15 = (_WORD *)(v11 + 2);
  *(void *)(a1 + 3896) = v15;
  BOOL v13 = v14 >= 2;
  unsigned int v16 = v14 - 2;
  *(_DWORD *)(a1 + 3904) = v16;
  if (!v13)
  {
    puts("e: data_sz underflow in get_value");
    BOOL v15 = *(_WORD **)(a1 + 3896);
    unsigned int v16 = *(_DWORD *)(a1 + 3904);
  }
  __int16 v19 = *v15;
  unsigned int v17 = (unsigned __int8 *)(v15 + 1);
  __int16 v18 = v19;
  *(void *)(a1 + 3896) = v17;
  BOOL v13 = v16 >= 2;
  unsigned int v20 = v16 - 2;
  *(_DWORD *)(a1 + 3904) = v20;
  if (!v13)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v17 = *(unsigned __int8 **)(a1 + 3896);
    unsigned int v20 = *(_DWORD *)(a1 + 3904);
  }
  *(_WORD *)(v3 + 15936 * v4 + 140160) = v18;
  unint64_t v21 = *v17;
  *(void *)(a1 + 3896) = v17 + 1;
  *(_DWORD *)(a1 + 3904) = v20 - 1;
  if (!v20) {
    puts("e: data_sz underflow in get_value");
  }
  *(unsigned char *)(v3 + 15936 * v4 + 140162) = v21;
  if (v21 >= 0xF)
  {
    printf("e: unsupported NPMT: %u > %u\n");
    return 0;
  }
  if (v8 + v5 - *(void *)(a1 + 3896) < v21)
  {
    uint64_t v6 = "e: underflow while reading temp taps";
    goto LABEL_6;
  }
  uint64_t v59 = v3;
  uint64_t v60 = v8 + v5;
  uint64_t v57 = v8;
  uint64_t v58 = v10;
  if (v21)
  {
    unsigned int v22 = (_DWORD *)(v3 + 15936 * v4 + 140163);
    unint64_t v23 = v21;
    do
    {
      uint64_t v24 = *(unsigned __int8 **)(a1 + 3896);
      int v25 = *v24;
      *(void *)(a1 + 3896) = v24 + 1;
      LODWORD(v24) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v24 - 1;
      if (!v24) {
        puts("e: data_sz underflow in get_value");
      }
      *v22++ = v25 << 16;
      --v23;
    }
    while (v23);
    if (v60 - *(void *)(a1 + 3896) < 5 * v9 * (unint64_t)v21)
    {
      uint64_t v6 = "e: underflow while reading PDMC LUT";
      goto LABEL_6;
    }
    uint64_t v26 = 0;
    unsigned int v27 = (void *)(v59 + 15936 * v4 + 141760);
    do
    {
      unint64_t v28 = v9;
      int v29 = v27;
      if (v9)
      {
        do
        {
          uint64_t v30 = *(unsigned int **)(a1 + 3896);
          uint64_t v31 = *v30;
          *(void *)(a1 + 3896) = v30 + 1;
          LODWORD(v30) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v30 - 4;
          if (v30 < 4) {
            puts("e: data_sz underflow in get_value");
          }
          *v29++ = v31;
          --v28;
        }
        while (v28);
      }
      ++v26;
      v27 += 128;
    }
    while (v26 != v21);
    uint64_t v32 = 0;
    uint64_t v33 = (void *)(v59 + 15936 * v4 + 141760);
    do
    {
      unint64_t v34 = v9;
      unsigned int v35 = v33;
      if (v9)
      {
        do
        {
          uint64_t v36 = *(unsigned __int8 **)(a1 + 3896);
          uint64_t v37 = *v36;
          *(void *)(a1 + 3896) = v36 + 1;
          LODWORD(v36) = *(_DWORD *)(a1 + 3904);
          *(_DWORD *)(a1 + 3904) = v36 - 1;
          if (!v36) {
            puts("e: data_sz underflow in get_value");
          }
          *v35++ |= v37 << 32;
          --v34;
        }
        while (v34);
      }
      ++v32;
      v33 += 128;
    }
    while (v32 != v21);
  }
  uint64_t v38 = *(void *)(a1 + 3896);
  uint64_t v39 = v60;
  unint64_t v40 = v60 - v38;
  if (v60 - v38 < 4 * v9)
  {
    uint64_t v6 = "e: underflow while reading PDMC coords LSB";
    goto LABEL_6;
  }
  if (!v9)
  {
    uint64_t v41 = v59;
    if (v40 >= v9)
    {
      uint64_t v47 = v57;
      goto LABEL_60;
    }
LABEL_58:
    uint64_t v6 = "e: underflow while reading PDMC coords MSB";
    goto LABEL_6;
  }
  uint64_t v41 = v59;
  uint64_t v42 = (_DWORD *)(v59 + 15936 * v4 + 140224);
  unint64_t v43 = v9;
  do
  {
    uint64_t v44 = *(int **)(a1 + 3896);
    int v45 = *v44;
    *(void *)(a1 + 3896) = v44 + 1;
    LODWORD(v44) = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v44 - 4;
    if (v44 < 4) {
      puts("e: data_sz underflow in get_value");
    }
    *v42++ = v45;
    --v43;
  }
  while (v43);
  if (v60 - *(void *)(a1 + 3896) < v9) {
    goto LABEL_58;
  }
  unint64_t v46 = (_DWORD *)(15936 * v4 + 141760 + v59 - 1024);
  uint64_t v47 = v57;
  do
  {
    unint64_t v48 = *(unsigned __int8 **)(a1 + 3896);
    int v49 = *v48;
    *(void *)(a1 + 3896) = v48 + 1;
    LODWORD(v48) = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v48 - 1;
    if (!v48) {
      puts("e: data_sz underflow in get_value");
    }
    *v46++ = v49;
    --v9;
  }
  while (v9);
  uint64_t v38 = *(void *)(a1 + 3896);
  uint64_t v39 = v60;
  unint64_t v40 = v60 - v38;
LABEL_60:
  uint64_t v50 = v58;
  if (v40 < 4 * v58)
  {
    uint64_t v6 = "e: underflow while reading PDMC steps";
    goto LABEL_6;
  }
  if (v58)
  {
    uint64_t v51 = (_DWORD *)(v41 + 15936 * v4 + 141248);
    do
    {
      uint64_t v52 = *(int **)(a1 + 3896);
      int v53 = *v52;
      *(void *)(a1 + 3896) = v52 + 1;
      LODWORD(v52) = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v52 - 4;
      if (v52 < 4) {
        puts("e: data_sz underflow in get_value");
      }
      *v51++ = v53;
      --v50;
    }
    while (v50);
    uint64_t v38 = *(void *)(a1 + 3896);
    uint64_t v39 = v60;
  }
  if (v47 - v38 >= 0) {
    uint64_t v54 = -((v47 - v38) & 3);
  }
  else {
    LODWORD(v54) = (v38 - v47) & 3;
  }
  if (v54)
  {
    int v55 = v54 - 4;
    do
    {
      ++*(void *)(a1 + 3896);
      int v56 = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v56 - 1;
      if (!v56) {
        puts("e: data_sz underflow in get_value");
      }
      BOOL v13 = __CFADD__(v55++, 1);
    }
    while (!v13);
    uint64_t v38 = *(void *)(a1 + 3896);
  }
  if (v38 != v39)
  {
    uint64_t v6 = "e: parsing did not consume the full PDMC size";
    goto LABEL_6;
  }
  ++*(unsigned char *)(a1 + 3890);
  return 1;
}

uint64_t sub_10001C354(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) == 393216)
  {
    uint64_t v3 = *(_DWORD **)(a1 + 2840);
    if (*v3 == 6)
    {
      printf("i: Processing CNST version 0x%x\n", 393216);
      if ((4 * *(_DWORD *)(a2 + 8) - 12) > 0x13)
      {
        uint64_t v6 = *(void *)(a1 + 3896) + 1;
        *(void *)(a1 + 3896) = v6;
        int v7 = *(_DWORD *)(a1 + 3904);
        BOOL v8 = v7 != 0;
        int v9 = v7 - 1;
        *(_DWORD *)(a1 + 3904) = v9;
        if (!v8)
        {
          puts("e: data_sz underflow in get_value");
          uint64_t v6 = *(void *)(a1 + 3896);
          int v9 = *(_DWORD *)(a1 + 3904);
        }
        uint64_t v10 = (unsigned __int16 *)(v6 + 1);
        *(void *)(a1 + 3896) = v10;
        BOOL v8 = v9 != 0;
        unsigned int v11 = v9 - 1;
        *(_DWORD *)(a1 + 3904) = v11;
        if (!v8)
        {
          puts("e: data_sz underflow in get_value");
          uint64_t v10 = *(unsigned __int16 **)(a1 + 3896);
          unsigned int v11 = *(_DWORD *)(a1 + 3904);
        }
        unsigned int v14 = *v10;
        unsigned int v12 = (unsigned __int8 *)(v10 + 1);
        unsigned int v13 = v14;
        *(void *)(a1 + 3896) = v12;
        BOOL v8 = v11 >= 2;
        unsigned int v15 = v11 - 2;
        *(_DWORD *)(a1 + 3904) = v15;
        if (!v8)
        {
          puts("e: data_sz underflow in get_value");
          unsigned int v12 = *(unsigned __int8 **)(a1 + 3896);
          unsigned int v15 = *(_DWORD *)(a1 + 3904);
        }
        unsigned int v18 = *v12;
        unsigned int v16 = v12 + 1;
        unsigned int v17 = v18;
        *(void *)(a1 + 3896) = v16;
        BOOL v8 = v15 != 0;
        unsigned int v19 = v15 - 1;
        *(_DWORD *)(a1 + 3904) = v19;
        if (!v8)
        {
          puts("e: data_sz underflow in get_value");
          unsigned int v16 = *(unsigned __int8 **)(a1 + 3896);
          unsigned int v19 = *(_DWORD *)(a1 + 3904);
        }
        unsigned int v22 = *v16;
        unsigned int v20 = v16 + 1;
        unsigned int v21 = v22;
        *(void *)(a1 + 3896) = v20;
        BOOL v8 = v19 != 0;
        unsigned int v23 = v19 - 1;
        *(_DWORD *)(a1 + 3904) = v23;
        if (!v8)
        {
          puts("e: data_sz underflow in get_value");
          unsigned int v20 = *(unsigned __int8 **)(a1 + 3896);
          unsigned int v23 = *(_DWORD *)(a1 + 3904);
        }
        unsigned int v26 = *v20;
        uint64_t v24 = v20 + 1;
        unsigned int v25 = v26;
        *(void *)(a1 + 3896) = v24;
        BOOL v8 = v23 != 0;
        unsigned int v27 = v23 - 1;
        *(_DWORD *)(a1 + 3904) = v27;
        if (!v8)
        {
          puts("e: data_sz underflow in get_value");
          uint64_t v24 = *(unsigned __int8 **)(a1 + 3896);
          unsigned int v27 = *(_DWORD *)(a1 + 3904);
        }
        unsigned int v30 = *v24;
        unint64_t v28 = v24 + 1;
        unsigned int v29 = v30;
        *(void *)(a1 + 3896) = v28;
        BOOL v8 = v27 != 0;
        unsigned int v31 = v27 - 1;
        *(_DWORD *)(a1 + 3904) = v31;
        if (!v8)
        {
          puts("e: data_sz underflow in get_value");
          unint64_t v28 = *(unsigned __int8 **)(a1 + 3896);
          unsigned int v31 = *(_DWORD *)(a1 + 3904);
        }
        unsigned int v32 = *v28;
        *(void *)(a1 + 3896) = v28 + 1;
        *(_DWORD *)(a1 + 3904) = v31 - 1;
        if (!v31) {
          puts("e: data_sz underflow in get_value");
        }
        if (v13 < 0x79)
        {
          if (v17 < 3)
          {
            if (v21 < 0x25)
            {
              if (v25 < 6)
              {
                if (v29 < 0x25)
                {
                  if (v32 < 6)
                  {
                    uint64_t v33 = *(unsigned __int8 **)(a1 + 3896);
                    unsigned int v34 = *v33;
                    *(void *)(a1 + 3896) = v33 + 1;
                    LODWORD(v33) = *(_DWORD *)(a1 + 3904);
                    *(_DWORD *)(a1 + 3904) = v33 - 1;
                    unsigned int v62 = v34;
                    if (!v33)
                    {
                      puts("e: data_sz underflow in get_value");
                      unsigned int v34 = v62;
                    }
                    if (v34 < 5)
                    {
                      unsigned int v35 = *(unsigned __int8 **)(a1 + 3896);
                      unsigned int v36 = *v35;
                      *(void *)(a1 + 3896) = v35 + 1;
                      LODWORD(v35) = *(_DWORD *)(a1 + 3904);
                      *(_DWORD *)(a1 + 3904) = v35 - 1;
                      unsigned int v61 = v36;
                      if (!v35)
                      {
                        puts("e: data_sz underflow in get_value");
                        unsigned int v36 = v61;
                      }
                      if (v36 < 7)
                      {
                        uint64_t v37 = *(unsigned __int8 **)(a1 + 3896);
                        unsigned int v39 = *v37;
                        uint64_t v38 = v37 + 1;
                        unsigned int v60 = v39;
                        *(void *)(a1 + 3896) = v38;
                        int v40 = *(_DWORD *)(a1 + 3904);
                        BOOL v8 = v40 != 0;
                        int v41 = v40 - 1;
                        *(_DWORD *)(a1 + 3904) = v41;
                        if (!v8)
                        {
                          puts("e: data_sz underflow in get_value");
                          uint64_t v38 = *(unsigned __int8 **)(a1 + 3896);
                          int v41 = *(_DWORD *)(a1 + 3904);
                        }
                        unsigned int v43 = *v38;
                        uint64_t v42 = v38 + 1;
                        unsigned int v59 = v43;
                        *(void *)(a1 + 3896) = v42;
                        BOOL v8 = v41 != 0;
                        int v44 = v41 - 1;
                        *(_DWORD *)(a1 + 3904) = v44;
                        if (!v8)
                        {
                          puts("e: data_sz underflow in get_value");
                          uint64_t v42 = *(unsigned __int8 **)(a1 + 3896);
                          int v44 = *(_DWORD *)(a1 + 3904);
                        }
                        int v45 = v3 + 469016;
                        unsigned int v47 = *v42;
                        unint64_t v46 = v42 + 1;
                        unsigned int v58 = v47;
                        *(void *)(a1 + 3896) = v46;
                        BOOL v8 = v44 != 0;
                        int v48 = v44 - 1;
                        *(_DWORD *)(a1 + 3904) = v48;
                        if (!v8)
                        {
                          puts("e: data_sz underflow in get_value");
                          unint64_t v46 = *(unsigned __int8 **)(a1 + 3896);
                          int v48 = *(_DWORD *)(a1 + 3904);
                        }
                        unsigned int v49 = v61;
                        __int16 v50 = *v46;
                        *(void *)(a1 + 3896) = v46 + 1;
                        *(_DWORD *)(a1 + 3904) = v48 - 1;
                        if (!v48)
                        {
                          __int16 v57 = v50;
                          puts("e: data_sz underflow in get_value");
                          __int16 v50 = v57;
                          unsigned int v49 = v61;
                        }
                        *int v45 = v62;
                        v45[1] = v49;
                        v45[2] = v60;
                        v45[3] = v25;
                        v45[4] = v21;
                        *((_WORD *)v45 + 21) = v32;
                        *((_WORD *)v45 + 22) = v29;
                        v45[6] = v58;
                        v45[7] = v59;
                        v45[8] = v17;
                        v45[9] = v13;
                        *((_WORD *)v45 + 20) = v50;
                        if (v17) {
                          BOOL v51 = v13 == 0;
                        }
                        else {
                          BOOL v51 = 1;
                        }
                        int v52 = !v51;
                        if (v25) {
                          BOOL v53 = v21 == 0;
                        }
                        else {
                          BOOL v53 = 1;
                        }
                        int v55 = !v53 && v32 != 0;
                        if ((v55 & (v29 != 0)) != 0) {
                          int v56 = 2;
                        }
                        else {
                          int v56 = 0;
                        }
                        v45[12] = v56 | v52 | v45[12] & 0xFFFFFFFC;
                        if (v52 == 1 && v55 && v29) {
                          operator new();
                        }
                        printf("e: missing EMMP (T%d B%d) or gray scales (sync T%d B%d async T%d B%d)\n");
                      }
                      else
                      {
                        printf("e: unsupported sensor channel count: %u > %u\n");
                      }
                    }
                    else
                    {
                      printf("e: unsupported region count: %u > %u\n");
                    }
                  }
                  else
                  {
                    printf("e: unsupported async PCS temperature count: %u > %u\n");
                  }
                }
                else
                {
                  printf("e: unsupported async PCS brightness count: %u > %u\n");
                }
              }
              else
              {
                printf("e: unsupported sync PCS temperature count: %u > %u\n");
              }
            }
            else
            {
              printf("e: unsupported sync PCS brightness count: %u > %u\n");
            }
          }
          else
          {
            printf("e: unsupported EMMP ACSS temperature count: %u > %u\n");
          }
        }
        else
        {
          printf("e: unsupported EMMP ACSS brightness count: %u > %u\n");
        }
      }
      else
      {
        printf("e: unexpected size for CNST %u < %u\n");
      }
    }
    else
    {
      printf("e: mismatching versions: %u != %u\n");
    }
  }
  else
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
  }
  return 0;
}

uint64_t sub_10001C92C(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) != 0x20000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  uint64_t v3 = *(_DWORD **)(a1 + 2840);
  if (*v3 != 6)
  {
    printf("e: mismatching versions: %u != %u\n");
    return 0;
  }
  __src = malloc_type_calloc(1uLL, 0x158uLL, 0x1000040C3D918F4uLL);
  int v41 = (char *)__src;
  if (!__src)
  {
    unsigned int v26 = "e: out of memory for PCS table";
    goto LABEL_52;
  }
  int v5 = 4 * *(_DWORD *)(a2 + 8);
  uint64_t v6 = (v5 - 12);
  if (v5 == 12)
  {
    unsigned int v26 = "e: underflow while reading indices";
    goto LABEL_52;
  }
  int v7 = *(char **)(a1 + 3896);
  uint64_t v8 = v3[469017];
  uint64_t v38 = v3[469018];
  uint64_t v9 = v3[469016];
  uint64_t v10 = v7 + 1;
  char v37 = *v7;
  *(void *)(a1 + 3896) = v7 + 1;
  int v11 = *(_DWORD *)(a1 + 3904);
  BOOL v12 = v11 != 0;
  int v13 = v11 - 1;
  *(_DWORD *)(a1 + 3904) = v13;
  if (!v12)
  {
    puts("e: data_sz underflow in get_value");
    uint64_t v10 = *(unsigned char **)(a1 + 3896);
    int v13 = *(_DWORD *)(a1 + 3904);
  }
  char v16 = *v10;
  unsigned int v14 = (__int16 *)(v10 + 1);
  char v15 = v16;
  *(void *)(a1 + 3896) = v14;
  BOOL v12 = v13 != 0;
  unsigned int v17 = v13 - 1;
  *(_DWORD *)(a1 + 3904) = v17;
  if (!v12)
  {
    puts("e: data_sz underflow in get_value");
    unsigned int v14 = *(__int16 **)(a1 + 3896);
    unsigned int v17 = *(_DWORD *)(a1 + 3904);
  }
  v41[338] = v15;
  __int16 v18 = *v14;
  *(void *)(a1 + 3896) = v14 + 1;
  *(_DWORD *)(a1 + 3904) = v17 - 2;
  if (v17 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  unsigned int v39 = &v7[v6];
  *((_WORD *)v41 + 168) = v18;
  if (v38)
  {
    uint64_t v19 = 0;
    while ((unint64_t)&v39[-*(void *)(a1 + 3896)] >= 4 * (unint64_t)(v8 * v9))
    {
      uint64_t v40 = v19;
      if (v9)
      {
        uint64_t v20 = 0;
        unsigned int v21 = (float *)v41;
        do
        {
          uint64_t v22 = v8;
          unsigned int v23 = v21;
          if (v8)
          {
            do
            {
              uint64_t v24 = *(unint64_t **)(a1 + 3896);
              unint64_t v25 = *v24;
              *(void *)(a1 + 3896) = v24 + 1;
              LODWORD(v24) = *(_DWORD *)(a1 + 3904);
              *(_DWORD *)(a1 + 3904) = v24 - 8;
              if (v24 < 8) {
                puts("e: data_sz underflow in get_long_value");
              }
              *v23++ = (float)v25 * 1.4552e-11;
              --v22;
            }
            while (v22);
          }
          ++v20;
          v21 += 7;
        }
        while (v20 != v9);
      }
      uint64_t v19 = v40 + 1;
      v41 += 112;
      if (v40 + 1 == v38) {
        goto LABEL_22;
      }
    }
    unsigned int v26 = "e: underflow while reading PCS scales";
    goto LABEL_52;
  }
LABEL_22:
  if ((uint64_t)&v39[-*(void *)(a1 + 3896)] < 36)
  {
    unsigned int v26 = "e: underflow while reading PCS spare";
LABEL_52:
    puts(v26);
    return 0;
  }
  int v27 = 18;
  do
  {
    *(void *)(a1 + 3896) += 2;
    unsigned int v28 = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v28 - 2;
    if (v28 < 2) {
      puts("e: data_sz underflow in get_value");
    }
    --v27;
  }
  while (v27);
  if (v37)
  {
    sub_10001D124(*(void ***)(a1 + 3848), &__src);
    if ((v37 & 2) == 0) {
      goto LABEL_40;
    }
    unsigned int v31 = malloc_type_calloc(1uLL, 0x158uLL, 0x1000040C3D918F4uLL);
    uint64_t v42 = v31;
    if (!v31)
    {
      unsigned int v26 = "e: out of memory for PCS table copy";
      goto LABEL_52;
    }
    memcpy(v31, __src, 0x158uLL);
    unsigned int v29 = *(void ***)(a1 + 3856);
    p_src = &v42;
  }
  else
  {
    if ((v37 & 2) == 0) {
      goto LABEL_40;
    }
    unsigned int v29 = *(void ***)(a1 + 3856);
    p_src = &__src;
  }
  sub_10001D124(v29, p_src);
LABEL_40:
  unsigned int v32 = *(char **)(a1 + 3896);
  if (v7 - v32 >= 0) {
    uint64_t v33 = -((v7 - v32) & 3);
  }
  else {
    LODWORD(v33) = (v32 - v7) & 3;
  }
  if (v33)
  {
    int v34 = v33 - 4;
    do
    {
      ++*(void *)(a1 + 3896);
      int v35 = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v35 - 1;
      if (!v35) {
        puts("e: data_sz underflow in get_value");
      }
      BOOL v12 = __CFADD__(v34++, 1);
    }
    while (!v12);
    unsigned int v32 = *(char **)(a1 + 3896);
  }
  if (v32 != v39)
  {
    unsigned int v26 = "e: parsing did not consume the full PCS size";
    goto LABEL_52;
  }
  return 1;
}

uint64_t sub_10001CCD4(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) != 0x20000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  uint64_t v3 = *(_DWORD **)(a1 + 2840);
  if (*v3 != 6)
  {
    printf("e: mismatching versions: %u != %u\n");
    return 0;
  }
  int v5 = malloc_type_calloc(1uLL, 0x1984uLL, 0x100004099D89073uLL);
  uint64_t v38 = v5;
  if (!v5)
  {
    uint64_t v9 = "e: out of memory for EMMP table";
LABEL_10:
    puts(v9);
    return 0;
  }
  uint64_t v6 = v3 + 469018;
  uint64_t v7 = v3[469018];
  if (v7 >= 4)
  {
    printf("e: too many EM color channels %d\n");
    return 0;
  }
  uint64_t v10 = v6[5];
  if (v10 >= 0x11)
  {
    printf("e: too many EM gray levels %d\n");
    return 0;
  }
  uint64_t v11 = *((unsigned __int16 *)v6 + 16);
  if (v11 >= 0x11)
  {
    printf("e: too many EM scale intervals %d\n");
    return 0;
  }
  uint64_t v12 = v6[4];
  if (v12 >= 0x41)
  {
    printf("e: too many EM lines %d\n");
    return 0;
  }
  uint64_t v13 = (4 * *(_DWORD *)(a2 + 8) - 12);
  if (v13 < (int)v7 * (2 * ((int)v10 + (int)v10 * (int)v12 + (int)v11) + 4 * ((int)v10 - 1) + 2) + 3)
  {
    printf("e: provided data size smaller than expected %d < %d\n");
    return 0;
  }
  unsigned int v14 = v5;
  char v15 = *(unsigned char **)(a1 + 3896);
  char v16 = (__int16 *)(v15 + 1);
  char v17 = *v15;
  *(void *)(a1 + 3896) = v15 + 1;
  int v18 = *(_DWORD *)(a1 + 3904);
  BOOL v19 = v18 != 0;
  unsigned int v20 = v18 - 1;
  *(_DWORD *)(a1 + 3904) = v20;
  if (!v19)
  {
    puts("e: data_sz underflow in get_value");
    char v16 = *(__int16 **)(a1 + 3896);
    unsigned int v20 = *(_DWORD *)(a1 + 3904);
  }
  *((unsigned char *)v14 + 6526) = v17;
  __int16 v21 = *v16;
  *(void *)(a1 + 3896) = v16 + 1;
  *(_DWORD *)(a1 + 3904) = v20 - 2;
  if (v20 < 2) {
    puts("e: data_sz underflow in get_value");
  }
  v14[3262] = v21;
  char v37 = &v15[v13];
  if (v7)
  {
    uint64_t v22 = 0;
    do
    {
      sub_100012DE8(a1, &v14[v22 + 4], v11);
      v22 += 16;
    }
    while (16 * v7 != v22);
    sub_100012DE8(a1, v14, v7);
    unsigned int v23 = v14 + 52;
    uint64_t v24 = v7;
    do
    {
      sub_100012DE8(a1, v23, v10);
      v23 += 16;
      --v24;
    }
    while (v24);
    unint64_t v25 = v14 + 100;
    uint64_t v26 = v7;
    do
    {
      sub_100012E38(a1, v25, (v10 - 1));
      v25 += 15;
      --v26;
    }
    while (v26);
    uint64_t v27 = 0;
    unsigned int v28 = v14 + 190;
    do
    {
      uint64_t v29 = v12;
      unsigned int v30 = v28;
      if (v12)
      {
        do
        {
          sub_100012DE8(a1, v30, v10);
          v30 += 16;
          --v29;
        }
        while (v29);
      }
      ++v27;
      v28 += 1024;
    }
    while (v27 != v7);
  }
  else
  {
    sub_100012DE8(a1, v14, v7);
  }
  if ((uint64_t)&v37[-*(void *)(a1 + 3896)] < 6)
  {
    uint64_t v9 = "e: underflow while reading EMMP spare";
    goto LABEL_10;
  }
  int v31 = 3;
  do
  {
    *(void *)(a1 + 3896) += 2;
    unsigned int v32 = *(_DWORD *)(a1 + 3904);
    *(_DWORD *)(a1 + 3904) = v32 - 2;
    if (v32 < 2) {
      puts("e: data_sz underflow in get_value");
    }
    --v31;
  }
  while (v31);
  sub_10001D124(*(void ***)(a1 + 3880), &v38);
  uint64_t v33 = *(unsigned char **)(a1 + 3896);
  if (v15 - v33 >= 0) {
    uint64_t v34 = -((v15 - v33) & 3);
  }
  else {
    LODWORD(v34) = (v33 - v15) & 3;
  }
  if (v34)
  {
    int v35 = v34 - 4;
    do
    {
      ++*(void *)(a1 + 3896);
      int v36 = *(_DWORD *)(a1 + 3904);
      *(_DWORD *)(a1 + 3904) = v36 - 1;
      if (!v36) {
        puts("e: data_sz underflow in get_value");
      }
      BOOL v19 = __CFADD__(v35++, 1);
    }
    while (!v19);
    uint64_t v33 = *(unsigned char **)(a1 + 3896);
  }
  if (v33 != v37)
  {
    uint64_t v9 = "e: parsing did not consume the full EMMP size";
    goto LABEL_10;
  }
  return 1;
}

void sub_10001D07C(void **a1, unint64_t a2)
{
  unsigned int v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      sub_100009CF0();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)sub_100021970(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v9 = &v6[8 * v8];
    uint64_t v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void sub_10001D124(void **a1, void *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(void **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = ((char *)v7 - (unsigned char *)*a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61) {
      sub_100009CF0();
    }
    uint64_t v10 = v5 - (void)*a1;
    uint64_t v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    if (v12) {
      uint64_t v13 = (char *)sub_100021970(v4, v12);
    }
    else {
      uint64_t v13 = 0;
    }
    unsigned int v14 = &v13[8 * v9];
    char v15 = &v13[8 * v12];
    *(void *)unsigned int v14 = *a2;
    uint64_t v8 = v14 + 8;
    char v17 = (char *)*a1;
    char v16 = (char *)a1[1];
    if (v16 != *a1)
    {
      do
      {
        uint64_t v18 = *((void *)v16 - 1);
        v16 -= 8;
        *((void *)v14 - 1) = v18;
        v14 -= 8;
      }
      while (v16 != v17);
      char v16 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v8;
    a1[2] = v15;
    if (v16) {
      operator delete(v16);
    }
  }
  else
  {
    *uint64_t v7 = *a2;
    uint64_t v8 = v7 + 1;
  }
  a1[1] = v8;
}

uint64_t sub_10001D204(uint64_t a1)
{
  int v2 = *(_DWORD **)(a1 + 2848);
  if ((*(unsigned int (**)(const __CFString *, void))(a1 + 8))(@"ALSSSupported", *(void *)(a1 + 16)))
  {
    BOOL v3 = v2 == 0;
  }
  else
  {
    BOOL v3 = 1;
  }
  if (v3) {
    return 1;
  }
  if (*v2 == 1)
  {
    unint64_t v5 = *(void **)(a1 + 3872);
    if (v5) {
      LODWORD(v5) = 16 * (*(void *)(*(void *)(a1 + 3872) + 8) != *v5);
    }
    unsigned int v6 = *(_WORD *)(a1 + 24) & 0xFFEF | v5;
    *(_WORD *)(a1 + 24) = v6;
  }
  else
  {
    unsigned int v6 = *(unsigned __int16 *)(a1 + 24);
  }
  return (v6 >> 4) & 1;
}

uint64_t sub_10001D28C(uint64_t a1)
{
  if (!(*(unsigned int (**)(const __CFString *, void))(a1 + 8))(@"ACSSSupported", *(void *)(a1 + 16)))return 1; {
  uint64_t result = 1;
  }
  switch(*(_DWORD *)(a1 + 2832))
  {
    case 0:
      return result;
    case 1:
      uint64_t result = sub_10001D408(a1);
      break;
    case 2:
      uint64_t result = sub_10001D4A4(a1);
      break;
    case 3:
      uint64_t result = sub_10001D504(a1);
      break;
    case 4:
      uint64_t result = sub_10001D598(a1);
      break;
    case 5:
      uint64_t result = sub_10001D610(a1);
      break;
    case 6:
      uint64_t result = sub_10001D6B8(a1);
      break;
    default:
      printf("e: invalid acss_config version %u\n", *(_DWORD *)(a1 + 2832));
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t sub_10001D408(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2840);
  if (v1)
  {
    int v2 = *(void **)(a1 + 3832);
    if (v2)
    {
      if (*(void *)(*(void *)(a1 + 3832) + 8) == *v2) {
        goto LABEL_13;
      }
      int v2 = *(void **)(a1 + 3824);
      if (!v2) {
        goto LABEL_12;
      }
      if (*(void *)(*(void *)(a1 + 3824) + 8) == *v2)
      {
LABEL_13:
        uint64_t v1 = 0;
        LOWORD(v2) = 0;
        goto LABEL_14;
      }
      BOOL v3 = (_DWORD *)(v1 + 2327536);
      LODWORD(v2) = *v3;
      if (*v3)
      {
        LODWORD(v2) = v3[1];
        if (v2)
        {
          LODWORD(v2) = v3[2];
          if (v2)
          {
            LODWORD(v2) = v3[5];
            if (v2)
            {
              LODWORD(v2) = v3[6];
              if (v2)
              {
                uint64_t v1 = v3[7] != 0;
                LOWORD(v2) = 8 * v1;
LABEL_14:
                *(_WORD *)(a1 + 24) = *(_WORD *)(a1 + 24) & 0xFFF7 | (unsigned __int16)v2;
                return v1;
              }
            }
          }
        }
      }
    }
LABEL_12:
    uint64_t v1 = 0;
    goto LABEL_14;
  }
  return v1;
}

unint64_t sub_10001D4A4(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 2840);
  if (!v1) {
    goto LABEL_7;
  }
  if (*(_DWORD *)v1 != 2)
  {
    unint64_t v1 = 0;
LABEL_7:
    LOWORD(v2) = 0;
    goto LABEL_9;
  }
  int v2 = *(_DWORD *)(v1 + 12416);
  if (v2 && (int v2 = *(_DWORD *)(v1 + 12420)) != 0)
  {
    unint64_t v1 = *(_DWORD *)(v1 + 12424) != 0;
    LOWORD(v2) = 8 * v1;
  }
  else
  {
    unint64_t v1 = 0;
  }
LABEL_9:
  *(_WORD *)(a1 + 24) = *(_WORD *)(a1 + 24) & 0xFFF7 | v2;
  return v1;
}

uint64_t sub_10001D504(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2840);
  if (!v1) {
    goto LABEL_13;
  }
  int v2 = *(void **)(a1 + 3864);
  if (!v2) {
    goto LABEL_11;
  }
  if (*(void *)(*(void *)(a1 + 3864) + 8) == *v2)
  {
LABEL_12:
    uint64_t v1 = 0;
LABEL_13:
    LOWORD(v2) = 0;
    goto LABEL_14;
  }
  int v2 = *(void **)(a1 + 3840);
  if (!v2)
  {
LABEL_11:
    uint64_t v1 = 0;
    goto LABEL_14;
  }
  if (*(void *)(*(void *)(a1 + 3840) + 8) == *v2) {
    goto LABEL_12;
  }
  BOOL v3 = (_DWORD *)(v1 + 1918576);
  LODWORD(v2) = *v3;
  if (!*v3) {
    goto LABEL_11;
  }
  LODWORD(v2) = v3[1];
  if (!v2) {
    goto LABEL_11;
  }
  LODWORD(v2) = v3[2];
  if (!v2) {
    goto LABEL_11;
  }
  LODWORD(v2) = v3[6];
  if (!v2) {
    goto LABEL_11;
  }
  uint64_t v1 = v3[7] != 0;
  LOWORD(v2) = 8 * v1;
LABEL_14:
  *(_WORD *)(a1 + 24) = *(_WORD *)(a1 + 24) & 0xFFF7 | (unsigned __int16)v2;
  return v1;
}

unint64_t sub_10001D598(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 2840);
  if (!v1) {
    goto LABEL_9;
  }
  if (*(_DWORD *)v1 != 4)
  {
    unint64_t v1 = 0;
LABEL_9:
    LOWORD(v3) = 0;
    goto LABEL_11;
  }
  int v2 = (_DWORD *)(v1 + 20088);
  int v3 = *v2;
  if (*v2 && (int v3 = v2[1]) != 0 && (int v3 = v2[2]) != 0 && (LOWORD(v3) = *((_WORD *)v2 + 14), (_WORD)v3))
  {
    unint64_t v1 = *((unsigned __int16 *)v2 + 15) != 0;
    LOWORD(v3) = 8 * v1;
  }
  else
  {
    unint64_t v1 = 0;
  }
LABEL_11:
  *(_WORD *)(a1 + 24) = *(_WORD *)(a1 + 24) & 0xFFF7 | v3;
  return v1;
}

uint64_t sub_10001D610(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2840);
  if (!v1) {
    goto LABEL_14;
  }
  if (*(_DWORD *)v1 != 5) {
    goto LABEL_13;
  }
  v1 += 172032;
  int v2 = *(_DWORD *)v1;
  if (!*(_DWORD *)v1
    || (int v2 = *(_DWORD *)(v1 + 4)) == 0
    || (int v2 = *(_DWORD *)(v1 + 8)) == 0
    || (LOWORD(v2) = *(_WORD *)(v1 + 28), !(_WORD)v2)
    || (LOWORD(v2) = *(_WORD *)(v1 + 30), !(_WORD)v2))
  {
    LOBYTE(v1) = 0;
    goto LABEL_16;
  }
  if (*(unsigned __int8 *)(a1 + 3888) != *(unsigned __int8 *)(v1 + 24)
    || *(unsigned __int8 *)(a1 + 3889) != *(unsigned __int8 *)(v1 + 25))
  {
LABEL_13:
    LOBYTE(v1) = 0;
LABEL_14:
    LOWORD(v2) = 0;
    goto LABEL_16;
  }
  LOBYTE(v1) = *(unsigned __int8 *)(a1 + 3890) == *(unsigned __int8 *)(v1 + 26);
  if (v1) {
    LOWORD(v2) = 8;
  }
  else {
    LOWORD(v2) = 0;
  }
LABEL_16:
  *(_WORD *)(a1 + 24) = *(_WORD *)(a1 + 24) & 0xFFF7 | v2;
  return v1 & 1;
}

uint64_t sub_10001D6B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2840);
  if (!v1) {
    goto LABEL_16;
  }
  int v2 = *(void **)(a1 + 3880);
  if (!v2) {
    goto LABEL_14;
  }
  if (*(void *)(*(void *)(a1 + 3880) + 8) == *v2)
  {
LABEL_15:
    uint64_t v1 = 0;
LABEL_16:
    LOWORD(v2) = 0;
    goto LABEL_17;
  }
  int v2 = *(void **)(a1 + 3848);
  if (!v2)
  {
LABEL_14:
    uint64_t v1 = 0;
    goto LABEL_17;
  }
  if (*(void *)(*(void *)(a1 + 3848) + 8) == *v2) {
    goto LABEL_15;
  }
  int v2 = *(void **)(a1 + 3856);
  if (!v2) {
    goto LABEL_14;
  }
  if (*(void *)(*(void *)(a1 + 3856) + 8) == *v2) {
    goto LABEL_15;
  }
  uint64_t v3 = v1 + 1875968;
  int v5 = *(_DWORD *)(v3 + 96);
  uint64_t v4 = v3 + 96;
  LOWORD(v2) = v5;
  if (!v5) {
    goto LABEL_14;
  }
  LODWORD(v2) = *(_DWORD *)(v4 + 4);
  if (!v2) {
    goto LABEL_14;
  }
  LODWORD(v2) = *(_DWORD *)(v4 + 8);
  if (!v2) {
    goto LABEL_14;
  }
  LODWORD(v2) = *(_DWORD *)(v4 + 24);
  if (!v2) {
    goto LABEL_14;
  }
  LODWORD(v2) = *(_DWORD *)(v4 + 28);
  if (!v2) {
    goto LABEL_14;
  }
  uint64_t v1 = *(unsigned __int16 *)(v4 + 40) != 0;
  LOWORD(v2) = 8 * v1;
LABEL_17:
  *(_WORD *)(a1 + 24) = *(_WORD *)(a1 + 24) & 0xFFF7 | (unsigned __int16)v2;
  return v1;
}

uint64_t sub_10001D764(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2848);
  uint64_t v23 = 1;
  uint64_t v25 = v1;
  int v24 = 1556480;
  int v2 = *(uint64_t **)(a1 + 3872);
  if (!v2)
  {
    BOOL v19 = "e: EMMP table for ALSS is NULL";
    goto LABEL_35;
  }
  uint64_t v4 = *v2;
  int v5 = (uint64_t *)v2[1];
  unint64_t v6 = 126 - 2 * __clz(((uint64_t)v5 - *v2) >> 3);
  if (v5 == (uint64_t *)v4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v6;
  }
  sub_1000219A8(v4, v5, (uint64_t)&v26, v7, 1);
  uint64_t v8 = *(uint64_t ***)(a1 + 3872);
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  uint64_t v22 = v1;
  if (*v8 == v10)
  {
    int v15 = -1;
    LODWORD(v18) = -1;
LABEL_25:
    if (*(_DWORD *)(v22 + 1545620) != v18 + 1 || *(_DWORD *)(v22 + 1545624) != v15 + 1)
    {
      printf("e: processed ALSS EMMP dimensions (temp %u, bright %u)mismatch specified values (temp %u, bright %u)\n");
      return 0;
    }
    if ((*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, void, void, void))a1)(94, &v23, 20, 0, 0, *(void *)(a1 + 16)))
    {
      puts("i: Set ALSS EM config success");
      return 1;
    }
    BOOL v19 = "e: ALSS: set_block_cb_failed";
LABEL_35:
    puts(v19);
    return 0;
  }
  int v11 = 0;
  int v12 = 0;
  uint64_t v13 = v1 + 8;
  uint64_t v14 = 0xFFFFFFFFLL;
  int v15 = -1;
  while (1)
  {
    char v16 = *(void **)(a1 + 3872);
    if (v16[1] == *v16) {
      sub_100022CCC();
    }
    uint64_t v17 = *v9;
    if (*v9 == *(void *)*v16)
    {
      uint64_t v18 = (v14 + 1);
      if ((int)v14 > 0) {
        goto LABEL_32;
      }
      int v15 = 0;
      int v12 = *(char *)(v17 + 6434);
      int v11 = *(unsigned __int16 *)(v17 + 6432);
      goto LABEL_21;
    }
    if (v12 == *(char *)(v17 + 6434)) {
      break;
    }
    uint64_t v18 = (v14 + 1);
    if ((int)v14 >= 1)
    {
LABEL_32:
      printf("e: ALSS EMMP exceeding max temperature count: %u > %u\n");
      return 0;
    }
    if (v11 == *(unsigned __int16 *)(v17 + 6432)) {
      int v15 = -1;
    }
    else {
      int v15 = 0;
    }
    int v12 = *(char *)(v17 + 6434);
    int v11 = *(unsigned __int16 *)(v17 + 6432);
LABEL_21:
    memcpy((void *)(v13 + 772800 * (int)v18 + 6440 * v15), (const void *)v17, 0x1928uLL);
    ++v9;
    uint64_t v14 = v18;
    if (v9 == v10) {
      goto LABEL_25;
    }
  }
  if (v11 == *(unsigned __int16 *)(v17 + 6432))
  {
    uint64_t v18 = v14;
    goto LABEL_21;
  }
  if (v15 < 119)
  {
    uint64_t v18 = v14;
    int v11 = *(unsigned __int16 *)(v17 + 6432);
    ++v15;
    goto LABEL_21;
  }
  printf("e: ALSS EMMP exceeding max brightness count: %u > %u\n");
  return 0;
}

uint64_t sub_10001D9C0(uint64_t a1)
{
  switch(*(_DWORD *)(a1 + 2832))
  {
    case 1:
      uint64_t result = sub_10001DAE0(a1);
      break;
    case 2:
      uint64_t result = sub_10001DE90(a1);
      break;
    case 3:
      uint64_t result = sub_10001DF1C(a1);
      break;
    case 4:
      uint64_t result = sub_10001E2E4(a1);
      break;
    case 5:
      uint64_t result = sub_10001E370(a1);
      break;
    case 6:
      uint64_t result = sub_10001E404(a1);
      break;
    default:
      printf("e: invalid acss_config version %u\n", *(_DWORD *)(a1 + 2832));
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t sub_10001DAE0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2840);
  uint64_t v34 = 1;
  uint64_t v36 = v1;
  int v35 = 2342912;
  int v2 = *(uint64_t **)(a1 + 3824);
  if (!v2) {
    goto LABEL_46;
  }
  uint64_t v4 = *v2;
  int v5 = (uint64_t *)v2[1];
  unint64_t v6 = 126 - 2 * __clz(((uint64_t)v5 - *v2) >> 3);
  uint64_t v7 = v5 == (uint64_t *)v4 ? 0 : v6;
  sub_100022D74(v4, v5, (uint64_t)&v33, v7, 1);
  uint64_t v8 = *(const void ****)(a1 + 3824);
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  if (*v8 == v10)
  {
    int v12 = 0;
    int v11 = 0;
    int v14 = -1;
    LODWORD(v17) = -1;
  }
  else
  {
    int v11 = 0;
    int v12 = 0;
    uint64_t v13 = 0xFFFFFFFFLL;
    int v14 = -1;
    do
    {
      int v15 = *(const void ****)(a1 + 3824);
      if (v15[1] == *v15) {
        sub_100022CCC();
      }
      char v16 = (unsigned __int16 *)((char *)*v9 + 10368);
      if (*v9 == **v15)
      {
        uint64_t v17 = (v13 + 1);
        if ((int)v13 > 3) {
          goto LABEL_47;
        }
        int v14 = 0;
        int v11 = *((char *)*v9 + 10370);
        int v12 = *v16;
      }
      else if (v11 == *((char *)*v9 + 10370))
      {
        if (v12 == *v16)
        {
          uint64_t v17 = v13;
        }
        else
        {
          if (v14 >= 35)
          {
            printf("e: GSC exceeding max brightness count: %u > %u\n");
            return 0;
          }
          uint64_t v17 = v13;
          int v12 = *v16;
          ++v14;
        }
      }
      else
      {
        uint64_t v17 = (v13 + 1);
        if ((int)v13 >= 4)
        {
LABEL_47:
          printf("e: GSC exceeding max temperature count: %u > %u\n");
          return 0;
        }
        if (v12 == *v16) {
          int v14 = -1;
        }
        else {
          int v14 = 0;
        }
        int v11 = *((char *)*v9 + 10370);
        int v12 = *v16;
      }
      memcpy((void *)(v1 + 373536 * (int)v17 + 10376 * v14 + 319696), *v9++, 0x2888uLL);
      uint64_t v13 = v17;
    }
    while (v9 != v10);
  }
  *(_DWORD *)(v1 + 2327548) = v17 + 1;
  *(_DWORD *)(v1 + 2327552) = v14 + 1;
  uint64_t v18 = *(uint64_t **)(a1 + 3832);
  if (!v18)
  {
LABEL_46:
    puts("e: GSC table is NULL");
    return 0;
  }
  uint64_t v19 = *v18;
  unsigned int v20 = (uint64_t *)v18[1];
  unint64_t v21 = 126 - 2 * __clz(((uint64_t)v20 - *v18) >> 3);
  if (v20 == (uint64_t *)v19) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = v21;
  }
  sub_100024198(v19, v20, (uint64_t)&v33, v22, 1);
  uint64_t v23 = *(uint64_t ***)(a1 + 3832);
  int v24 = *v23;
  uint64_t v25 = v23[1];
  if (*v23 == v25)
  {
    int v27 = -1;
    LODWORD(v30) = -1;
LABEL_49:
    *(_DWORD *)(v1 + 2327568) = v30 + 1;
    *(_DWORD *)(v1 + 2327572) = v27 + 1;
    *(unsigned char *)(v1 + 2327595) = *(unsigned char *)(a1 + 3909);
    int v33 = *(_DWORD *)(a1 + 2832);
    uint64_t v31 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, int *, uint64_t, void))a1)(65, &v34, 20, &v33, 1, *(void *)(a1 + 16));
    if ((v31 & 1) == 0) {
      puts("e: ACSS: set_block_cb failed");
    }
    return v31;
  }
  uint64_t v26 = 0xFFFFFFFFLL;
  int v27 = -1;
  while (1)
  {
    unsigned int v28 = *(void **)(a1 + 3832);
    if (v28[1] == *v28) {
      sub_100022CCC();
    }
    uint64_t v29 = *v24;
    if (*v24 == *(void *)*v28)
    {
      uint64_t v30 = (v26 + 1);
      if ((int)v26 > 0) {
        goto LABEL_51;
      }
      int v27 = 0;
      int v11 = *(char *)(v29 + 578);
      int v12 = *(unsigned __int16 *)(v29 + 576);
      goto LABEL_44;
    }
    if (v11 == *(char *)(v29 + 578)) {
      break;
    }
    uint64_t v30 = (v26 + 1);
    if ((int)v26 >= 1)
    {
LABEL_51:
      printf("e: EMMK exceeding max temperature count: %u > %u\n");
      return 0;
    }
    if (v12 == *(unsigned __int16 *)(v29 + 576)) {
      int v27 = -1;
    }
    else {
      int v27 = 0;
    }
    int v11 = *(char *)(v29 + 578);
    int v12 = *(unsigned __int16 *)(v29 + 576);
LABEL_44:
    memcpy((void *)(v1 + 70080 * (int)v30 + 584 * v27 + 2187376), (const void *)v29, 0x248uLL);
    ++v24;
    uint64_t v26 = v30;
    if (v24 == v25) {
      goto LABEL_49;
    }
  }
  if (v12 == *(unsigned __int16 *)(v29 + 576))
  {
    uint64_t v30 = v26;
    goto LABEL_44;
  }
  if (v27 < 119)
  {
    uint64_t v30 = v26;
    int v12 = *(unsigned __int16 *)(v29 + 576);
    ++v27;
    goto LABEL_44;
  }
  printf("e: EMMK exceeding max brightness count: %u > %u\n");
  return 0;
}

uint64_t sub_10001DE90(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2840);
  uint64_t v5 = 1;
  uint64_t v7 = v1;
  int v6 = 0x4000;
  *(unsigned char *)(v1 + 14000) = *(unsigned char *)(a1 + 3909);
  int v4 = *(_DWORD *)(a1 + 2832);
  uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, int *, uint64_t, void))a1)(65, &v5, 20, &v4, 1, *(void *)(a1 + 16));
  if ((v2 & 1) == 0) {
    puts("e: ACSS: set_block_cb failed");
  }
  return v2;
}

uint64_t sub_10001DF1C(uint64_t a1)
{
  uint64_t v1 = *(_DWORD **)(a1 + 2840);
  uint64_t v37 = 1;
  unsigned int v39 = v1;
  int v38 = 2342912;
  uint64_t v2 = *(uint64_t **)(a1 + 3840);
  if (!v2)
  {
    uint64_t v19 = "e: PCS table is NULL";
LABEL_48:
    puts(v19);
    return 0;
  }
  uint64_t v4 = *v2;
  uint64_t v5 = (uint64_t *)v2[1];
  unint64_t v6 = 126 - 2 * __clz(((uint64_t)v5 - *v2) >> 3);
  if (v5 == (uint64_t *)v4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v6;
  }
  sub_100025424(v4, v5, (uint64_t)&v36, v7, 1);
  uint64_t v8 = *(uint64_t ***)(a1 + 3840);
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  int v35 = v1;
  if (*v8 == v10)
  {
    int v12 = 0;
    int v11 = 0;
    int v15 = -1;
    LODWORD(v18) = -1;
  }
  else
  {
    int v11 = 0;
    int v12 = 0;
    uint64_t v13 = v1 + 79924;
    uint64_t v14 = 0xFFFFFFFFLL;
    int v15 = -1;
    do
    {
      char v16 = *(void **)(a1 + 3840);
      if (v16[1] == *v16) {
        sub_100022CCC();
      }
      uint64_t v17 = *v9;
      if (*v9 == *(void *)*v16)
      {
        uint64_t v18 = (v14 + 1);
        if ((int)v14 > 3) {
          goto LABEL_49;
        }
        int v15 = 0;
        int v11 = *(char *)(v17 + 290);
        int v12 = *(unsigned __int16 *)(v17 + 288);
      }
      else if (v11 == *(char *)(v17 + 290))
      {
        if (v12 == *(unsigned __int16 *)(v17 + 288))
        {
          uint64_t v18 = v14;
        }
        else
        {
          if (v15 >= 35)
          {
            printf("e: PCS exceeding max brightness count: %u > %u\n");
            return 0;
          }
          uint64_t v18 = v14;
          int v12 = *(unsigned __int16 *)(v17 + 288);
          ++v15;
        }
      }
      else
      {
        uint64_t v18 = (v14 + 1);
        if ((int)v14 >= 4)
        {
LABEL_49:
          printf("e: PCS exceeding max temperature count: %u > %u\n");
          return 0;
        }
        if (v12 == *(unsigned __int16 *)(v17 + 288)) {
          int v15 = -1;
        }
        else {
          int v15 = 0;
        }
        int v11 = *(char *)(v17 + 290);
        int v12 = *(unsigned __int16 *)(v17 + 288);
      }
      memcpy(&v13[2664 * (int)v18 + 74 * v15], (const void *)v17, 0x128uLL);
      ++v9;
      uint64_t v14 = v18;
    }
    while (v9 != v10);
  }
  v35[479647] = v18 + 1;
  v35[479648] = v15 + 1;
  unsigned int v20 = *(uint64_t **)(a1 + 3864);
  if (!v20)
  {
    uint64_t v19 = "e: EMMP table for ACSS is NULL";
    goto LABEL_48;
  }
  uint64_t v21 = *v20;
  uint64_t v22 = (uint64_t *)v20[1];
  unint64_t v23 = 126 - 2 * __clz(((uint64_t)v22 - *v20) >> 3);
  if (v22 == (uint64_t *)v21) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = v23;
  }
  sub_1000219A8(v21, v22, (uint64_t)&v36, v24, 1);
  uint64_t v25 = *(uint64_t ***)(a1 + 3864);
  uint64_t v26 = *v25;
  int v27 = v25[1];
  if (*v25 == v27)
  {
    int v29 = -1;
    LODWORD(v32) = -1;
LABEL_51:
    v35[479652] = v32 + 1;
    v35[479653] = v29 + 1;
    v35[479657] = v35[479657] & 0xFFFFFFFE | *(unsigned __int8 *)(a1 + 3909);
    int v36 = *(_DWORD *)(a1 + 2832);
    uint64_t v33 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, int *, uint64_t, void))a1)(65, &v37, 20, &v36, 1, *(void *)(a1 + 16));
    if ((v33 & 1) == 0) {
      puts("e: ACSS: set_block_cb failed");
    }
    return v33;
  }
  uint64_t v28 = 0xFFFFFFFFLL;
  int v29 = -1;
  while (1)
  {
    uint64_t v30 = *(void **)(a1 + 3864);
    if (v30[1] == *v30) {
      sub_100022CCC();
    }
    uint64_t v31 = *v26;
    if (*v26 == *(void *)*v30)
    {
      uint64_t v32 = (v28 + 1);
      if ((int)v28 > 0) {
        goto LABEL_53;
      }
      int v29 = 0;
      int v11 = *(char *)(v31 + 6434);
      int v12 = *(unsigned __int16 *)(v31 + 6432);
      goto LABEL_45;
    }
    if (v11 == *(char *)(v31 + 6434)) {
      break;
    }
    uint64_t v32 = (v28 + 1);
    if ((int)v28 >= 1)
    {
LABEL_53:
      printf("e: ACSS EMMP exceeding max temperature count: %u > %u\n");
      return 0;
    }
    if (v12 == *(unsigned __int16 *)(v31 + 6432)) {
      int v29 = -1;
    }
    else {
      int v29 = 0;
    }
    int v11 = *(char *)(v31 + 6434);
    int v12 = *(unsigned __int16 *)(v31 + 6432);
LABEL_45:
    memcpy(&v35[193200 * (int)v32 + 93244 + 1610 * v29], (const void *)v31, 0x1928uLL);
    ++v26;
    uint64_t v28 = v32;
    if (v26 == v27) {
      goto LABEL_51;
    }
  }
  if (v12 == *(unsigned __int16 *)(v31 + 6432))
  {
    uint64_t v32 = v28;
    goto LABEL_45;
  }
  if (v29 < 119)
  {
    uint64_t v32 = v28;
    int v12 = *(unsigned __int16 *)(v31 + 6432);
    ++v29;
    goto LABEL_45;
  }
  printf("e: ACSS EMMP exceeding max brightness count: %u > %u\n");
  return 0;
}

uint64_t sub_10001E2E4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2840);
  uint64_t v5 = 1;
  uint64_t v7 = v1;
  int v6 = 0x8000;
  *(unsigned char *)(v1 + 20144) = *(unsigned char *)(a1 + 3909);
  int v4 = *(_DWORD *)(a1 + 2832);
  uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, int *, uint64_t, void))a1)(65, &v5, 20, &v4, 1, *(void *)(a1 + 16));
  if ((v2 & 1) == 0) {
    puts("e: ACSS: set_block_cb failed");
  }
  return v2;
}

uint64_t sub_10001E370(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2840);
  uint64_t v5 = 1;
  uint64_t v7 = v1;
  int v6 = 180224;
  *(unsigned char *)(v1 + 172088) = *(unsigned char *)(a1 + 3909);
  int v4 = *(_DWORD *)(a1 + 2832);
  uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, int *, uint64_t, void))a1)(65, &v5, 20, &v4, 1, *(void *)(a1 + 16));
  if ((v2 & 1) == 0) {
    puts("e: ACSS: set_block_cb failed");
  }
  return v2;
}

uint64_t sub_10001E404(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 2840);
  uint64_t v9 = 1;
  uint64_t v11 = v2;
  int v10 = 1884160;
  uint64_t v3 = *(uint64_t ***)(a1 + 3848);
  if (!v3 || !*(void *)(a1 + 3856))
  {
    int v6 = "e: PCS tables are NULL";
LABEL_14:
    puts(v6);
    return 0;
  }
  if ((sub_10001E550(v3, v2 + 184544, *(_DWORD *)(v2 + 1876076), *(_DWORD *)(v2 + 1876080)) & 1) == 0)
  {
    int v6 = "e: Failed to sort sync PCS tables";
    goto LABEL_14;
  }
  if ((sub_10001E550(*(uint64_t ***)(a1 + 3856), v2 + 246464, *(unsigned __int16 *)(v2 + 1876106), *(unsigned __int16 *)(v2 + 1876108)) & 1) == 0)
  {
    int v6 = "e: Failed to sort async PCS tables";
    goto LABEL_14;
  }
  int v4 = *(uint64_t ***)(a1 + 3880);
  if (!v4)
  {
    int v6 = "e: EMMP table for ACSS is NULL";
    goto LABEL_14;
  }
  if ((sub_10001E704(v4, v2 + 308384, *(_DWORD *)(v2 + 1876096), *(_DWORD *)(v2 + 1876100)) & 1) == 0)
  {
    int v6 = "e: Failed to sort EMMP tables";
    goto LABEL_14;
  }
  *(_DWORD *)(v2 + 1876116) = *(_DWORD *)(v2 + 1876116) & 0xFFFFFFFE | *(unsigned __int8 *)(a1 + 3909);
  int v8 = *(_DWORD *)(a1 + 2832);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, int *, uint64_t, void))a1)(65, &v9, 20, &v8, 1, *(void *)(a1 + 16));
  if ((v5 & 1) == 0) {
    puts("e: ACSS: set_block_cb failed");
  }
  return v5;
}

uint64_t sub_10001E550(uint64_t **a1, uint64_t a2, int a3, int a4)
{
  int v6 = *a1;
  uint64_t v7 = a1[1];
  unint64_t v8 = 126 - 2 * __clz(v7 - v6);
  if (v7 == v6) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v8;
  }
  sub_1000266B0((uint64_t)v6, v7, (uint64_t)&v20, v9, 1);
  int v10 = *a1;
  uint64_t v11 = a1[1];
  if (*a1 != v11)
  {
    int v12 = 0;
    int v13 = 0;
    unsigned int v14 = -1;
    unsigned int v15 = -1;
    while (1)
    {
      if (a1[1] == *a1) {
        sub_100022CCC();
      }
      uint64_t v16 = *v10;
      if (*v10 == **a1)
      {
        if (++v15 > 4)
        {
LABEL_23:
          printf("e: Vector exceeding max i count: %u > %u\n");
          return 0;
        }
        unsigned int v14 = 0;
        int v13 = *(char *)(v16 + 338);
        int v12 = *(unsigned __int16 *)(v16 + 336);
      }
      else
      {
        if (v13 != *(char *)(v16 + 338))
        {
          if (++v15 >= 5) {
            goto LABEL_23;
          }
          unsigned int v14 = -1;
          int v13 = *(char *)(v16 + 338);
        }
        if (v12 != *(unsigned __int16 *)(v16 + 336))
        {
          if (++v14 >= 0x24)
          {
            printf("e: Vector exceeding max j count: %u > %u\n");
            return 0;
          }
          int v12 = *(unsigned __int16 *)(v16 + 336);
        }
      }
      memcpy((void *)(a2 + 12384 * v15 + 344 * v14), (const void *)v16, 0x158uLL);
      if (++v10 == v11) {
        goto LABEL_19;
      }
    }
  }
  unsigned int v15 = -1;
  unsigned int v14 = -1;
LABEL_19:
  if (v15 + 1 != a3 || v14 + 1 != a4)
  {
    printf("e: Counted vectors [%d][%d] mismatch expected [%d][%d]\n");
    return 0;
  }
  return 1;
}

uint64_t sub_10001E704(uint64_t **a1, uint64_t a2, int a3, int a4)
{
  int v6 = *a1;
  uint64_t v7 = a1[1];
  unint64_t v8 = 126 - 2 * __clz(v7 - v6);
  if (v7 == v6) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v8;
  }
  sub_10002793C((uint64_t)v6, v7, (uint64_t)&v20, v9, 1);
  int v10 = *a1;
  uint64_t v11 = a1[1];
  if (*a1 != v11)
  {
    int v12 = 0;
    int v13 = 0;
    unsigned int v14 = -1;
    unsigned int v15 = -1;
    while (1)
    {
      if (a1[1] == *a1) {
        sub_100022CCC();
      }
      uint64_t v16 = *v10;
      if (*v10 == **a1)
      {
        if (++v15 > 1)
        {
LABEL_23:
          printf("e: Vector exceeding max i count: %u > %u\n");
          return 0;
        }
        unsigned int v14 = 0;
        int v13 = *(char *)(v16 + 6526);
        int v12 = *(unsigned __int16 *)(v16 + 6524);
      }
      else
      {
        if (v13 != *(char *)(v16 + 6526))
        {
          if (++v15 >= 2) {
            goto LABEL_23;
          }
          unsigned int v14 = -1;
          int v13 = *(char *)(v16 + 6526);
        }
        if (v12 != *(unsigned __int16 *)(v16 + 6524))
        {
          if (++v14 >= 0x78)
          {
            printf("e: Vector exceeding max j count: %u > %u\n");
            return 0;
          }
          int v12 = *(unsigned __int16 *)(v16 + 6524);
        }
      }
      memcpy((void *)(a2 + 783840 * v15 + 6532 * v14), (const void *)v16, 0x1984uLL);
      if (++v10 == v11) {
        goto LABEL_19;
      }
    }
  }
  unsigned int v15 = -1;
  unsigned int v14 = -1;
LABEL_19:
  if (v15 + 1 != a3 || v14 + 1 != a4)
  {
    printf("e: Counted vectors [%d][%d] mismatch expected [%d][%d]\n");
    return 0;
  }
  return 1;
}

float sub_10001E8C8(int a1)
{
  return (float)a1 * 0.125;
}

uint64_t sub_10001E8D8(uint64_t a1, int a2, _DWORD *a3, unsigned int *a4)
{
  unsigned int v4 = *a4;
  if (*a4 <= 0xA)
  {
    if (v4)
    {
      unint64_t v6 = 0;
      int v7 = a2;
      while (1)
      {
        int v8 = a3[v6];
        if (v8 == a2) {
          return 1;
        }
        BOOL v9 = v8 <= a2 && v7 == a2;
        int v10 = a2;
        if (!v9)
        {
          a3[v6] = v7;
          unsigned int v4 = *a4;
          int v10 = v8;
        }
        ++v6;
        int v7 = v10;
        if (v6 >= v4)
        {
          if (v4 == 10) {
            goto LABEL_2;
          }
          if (v10 > a3[v4 - 1])
          {
            *a4 = v4 + 1;
            a3[v4] = v10;
          }
          return 1;
        }
      }
    }
    else
    {
      uint64_t result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_10001E988(uint64_t a1, unsigned int a2, unsigned int *a3, unsigned int *a4)
{
  unsigned int v4 = *a4;
  if (*a4 <= 0xA)
  {
    if (v4)
    {
      unint64_t v6 = 0;
      unsigned int v7 = a2;
      while (1)
      {
        unsigned int v8 = a3[v6];
        if (v8 == a2) {
          return 1;
        }
        BOOL v9 = v8 <= a2 && v7 == a2;
        unsigned int v10 = a2;
        if (!v9)
        {
          a3[v6] = v7;
          unsigned int v4 = *a4;
          unsigned int v10 = v8;
        }
        ++v6;
        unsigned int v7 = v10;
        if (v6 >= v4)
        {
          if (v4 == 10) {
            goto LABEL_2;
          }
          if (v10 > a3[v4 - 1])
          {
            *a4 = v4 + 1;
            a3[v4] = v10;
          }
          return 1;
        }
      }
    }
    else
    {
      uint64_t result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_10001EA38(uint64_t a1)
{
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a1 + 28);
  uint64_t v2 = a1 + 32;
  if (*(unsigned char *)(a1 + 3910)) {
    sub_1000206B4(a1, a1 + 32);
  }
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, void, void))a1)(27, v2, 2096, 0, 0, *(void *)(a1 + 16));
  if (v3) {
    unsigned int v4 = "i: set PDC table config succeeded";
  }
  else {
    unsigned int v4 = "e: failed to set PDC table config";
  }
  puts(v4);
  return v3;
}

uint64_t sub_10001EAB8(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 28);
  uint64_t v3 = *(uint64_t **)(a1 + 2200);
  memcpy(__dst, &unk_10002A0D8, sizeof(__dst));
  LOWORD(v4) = *(_WORD *)(a1 + 2128);
  printf("i: PDC bin interpolation, biint n = %g\n", (float)(*(float *)(a1 + 2132) + (float)v4));
  if (!v3)
  {
LABEL_54:
    puts("i: set PDC LUTs succeeded");
    uint64_t v67 = 1;
    goto LABEL_55;
  }
  uint64_t v5 = &__dst[1];
  unint64_t v6 = (char *)&__dst[217] + 6;
  int v7 = 1;
  do
  {
    unint64_t v72 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v73 = 0xAAAAAAAAAAAAAAAALL;
    unsigned int v9 = *((_DWORD *)v3 + 3);
    unsigned int v8 = *((_DWORD *)v3 + 4);
    LODWORD(v72) = *((_DWORD *)v3 + 2);
    HIDWORD(v72) = v8;
    int v10 = *((_DWORD *)v3 + 6);
    unint64_t v73 = __PAIR64__(v10, v9);
    if (*(float *)(a1 + 2132) == 0.0)
    {
      uint64_t v11 = (void **)(v3 + 4);
      goto LABEL_20;
    }
    int v12 = sub_10000A69C(a1, v2, (unsigned __int16)(*(_WORD *)(a1 + 2128) + 1), *((_DWORD *)v3 + 2), v8, 0, *((unsigned __int16 *)v3 + 6), v10);
    if (!v12)
    {
      int v70 = "e: bin tables do not correlate.";
      goto LABEL_61;
    }
    LODWORD(__dst[0]) = v2;
    switch(v2)
    {
      case 3:
        uint64_t v35 = 0;
        int v36 = v3 + 5;
        unsigned int v37 = *((unsigned __int16 *)v3 + 1754);
        int v38 = v12 + 10;
        if (v37 <= *((unsigned __int16 *)v12 + 1754)) {
          LOWORD(v37) = *((_WORD *)v12 + 1754);
        }
        WORD2(__dst[434]) = v37;
        float v39 = *(float *)(a1 + 2132);
        uint64_t v40 = v5;
        while (1)
        {
          uint64_t v41 = 0;
          char v42 = 1;
          do
          {
            double v43 = (float)((float)*(unsigned __int16 *)((char *)v36 + v41)
                        + (float)(v39
                                * (float)(*(unsigned __int16 *)((char *)v38 + v41)
                                        - *(unsigned __int16 *)((char *)v36 + v41))))
                + 0.5;
            *(_WORD *)((char *)v40 + v41) = (int)v43;
            v42 &= (int)v43 == 0;
            v41 += 2;
          }
          while (v41 != 578);
          if (v42) {
            goto LABEL_50;
          }
          ++v35;
          int v36 = (uint64_t *)((char *)v36 + 578);
          int v38 = (_DWORD *)((char *)v38 + 578);
          uint64_t v40 = (void **)((char *)v40 + 578);
          if (v35 == 3)
          {
            uint64_t v44 = 0;
            uint64_t v45 = (uint64_t)v3 + 1774;
            unint64_t v46 = (char *)v12 + 1774;
            unsigned int v47 = v6;
            while (1)
            {
              uint64_t v48 = 0;
              char v49 = 1;
              do
              {
                double v50 = (float)((float)*(unsigned __int16 *)(v45 + v48)
                            + (float)(v39 * (float)(*(unsigned __int16 *)&v46[v48] - *(unsigned __int16 *)(v45 + v48))))
                    + 0.5;
                *(_WORD *)&v47[v48] = (int)v50;
                v49 &= (int)v50 == 0;
                v48 += 2;
              }
              while (v48 != 578);
              if (v49) {
                break;
              }
              ++v44;
              v45 += 578;
              v46 += 578;
              v47 += 578;
              uint64_t v11 = __dst;
              if (v44 == 3) {
                goto LABEL_20;
              }
            }
LABEL_51:
            printf("e: lerped PMLUT[%d, %d, %d, %d, %d] is all zeros");
            return 0;
          }
        }
      case 4:
        uint64_t v51 = 0;
        int v52 = v3 + 5;
        unsigned int v53 = *((unsigned __int16 *)v3 + 989);
        uint64_t v54 = v12 + 10;
        if (v53 <= *((unsigned __int16 *)v12 + 989)) {
          LOWORD(v53) = *((_WORD *)v12 + 989);
        }
        WORD1(__dst[243]) = v53;
        float v55 = *(float *)(a1 + 2132);
        int v56 = v5;
        while (1)
        {
          uint64_t v57 = 0;
          char v58 = 1;
          do
          {
            double v59 = (float)((float)*(unsigned __int16 *)((char *)v52 + v57)
                        + (float)(v55
                                * (float)(*(unsigned __int16 *)((char *)v54 + v57)
                                        - *(unsigned __int16 *)((char *)v52 + v57))))
                + 0.5;
            *(_WORD *)((char *)v56 + v57) = (int)v59;
            v58 &= (int)v59 == 0;
            v57 += 2;
          }
          while (v57 != 578);
          if (v58) {
            break;
          }
          ++v51;
          int v52 = (uint64_t *)((char *)v52 + 578);
          uint64_t v54 = (_DWORD *)((char *)v54 + 578);
          int v56 = (void **)((char *)v56 + 578);
          if (v51 == 3)
          {
            uint64_t v60 = 0;
            uint64_t v61 = (uint64_t)v3 + 1774;
            unsigned int v62 = (char *)v12 + 1774;
            uint64_t v63 = v6;
            while (1)
            {
              uint64_t v64 = 0;
              char v65 = 1;
              do
              {
                double v66 = (float)((float)*(unsigned __int16 *)(v61 + v64)
                            + (float)(v55 * (float)(*(unsigned __int16 *)&v62[v64] - *(unsigned __int16 *)(v61 + v64))))
                    + 0.5;
                *(_WORD *)&v63[v64] = (int)v66;
                v65 &= (int)v66 == 0;
                v64 += 2;
              }
              while (v64 != 68);
              if (v65) {
                goto LABEL_51;
              }
              ++v60;
              v61 += 68;
              v62 += 68;
              v63 += 68;
              uint64_t v11 = __dst;
              if (v60 == 3) {
                goto LABEL_20;
              }
            }
          }
        }
LABEL_50:
        printf("e: lerped DCLUT[%d, %d, %d, %d, %d] is all zeros");
        return 0;
      case 5:
        uint64_t v71 = v5;
        int v13 = v6;
        LOWORD(__dst[3]) = *(_WORD *)(a1 + 2116);
        int v14 = *(unsigned __int16 *)(a1 + 418);
        int v15 = *(unsigned __int16 *)(a1 + 420);
        uint64_t v16 = (unsigned __int16 *)v3[6];
        uint64_t v17 = (unsigned __int16 *)*((void *)v12 + 6);
        uint64_t v18 = __dst[2];
        if (__dst[2]
          || (LODWORD(__dst[1]) = *((_DWORD *)v3 + 10),
              uint64_t v18 = malloc_type_aligned_alloc(0x4000uLL, LODWORD(__dst[1]), 0x1056A91uLL),
              (__dst[2] = v18) != 0))
        {
          uint64_t v19 = (3 * v14 * v14);
          if (!v19) {
            goto LABEL_62;
          }
          uint64_t v20 = (3 * v15 * v15);
          uint64_t v21 = &v16[v19];
          uint64_t v22 = &v17[v19];
          unint64_t v23 = &v18[v19];
          float v24 = *(float *)(a1 + 2132);
          char v25 = 1;
          do
          {
            unsigned int v27 = *v16++;
            unsigned int v26 = v27;
            int v28 = *v17++;
            double v29 = (float)((float)v26 + (float)(v24 * (float)(int)(v28 - v26))) + 0.5;
            *v18++ = (int)v29;
            v25 &= (int)v29 == 0;
            --v19;
          }
          while (v19);
          if (v25)
          {
LABEL_62:
            printf("e: lerped DCLUT[%d, %d, %d, %d] is all zeros");
          }
          else
          {
            unint64_t v6 = v13;
            uint64_t v5 = v71;
            if (v20)
            {
              char v30 = 1;
              do
              {
                unsigned int v32 = *v21++;
                unsigned int v31 = v32;
                int v33 = *v22++;
                double v34 = (float)((float)v31 + (float)(v24 * (float)(int)(v33 - v31))) + 0.5;
                *v23++ = (int)v34;
                v30 &= (int)v34 == 0;
                --v20;
              }
              while (v20);
              if ((v30 & 1) == 0) {
                break;
              }
            }
            printf("e: lerped PMLUT[%d, %d, %d, %d] is all zeros");
          }
          return 0;
        }
        int v70 = "e: no memory to prepare PDC LUTs";
LABEL_61:
        puts(v70);
        return 0;
    }
    uint64_t v11 = __dst;
LABEL_20:
    v7 &= (*(uint64_t (**)(uint64_t, void **, uint64_t, unint64_t *, uint64_t, void))a1)(26, v11, 3480, &v72, 4, *(void *)(a1 + 16));
    if ((v7 & 1) == 0) {
      printf("e: failed to set PDC LUT [%d %d %d %d] \n", v72, HIDWORD(v72), v73, HIDWORD(v73));
    }
    uint64_t v3 = (uint64_t *)*v3;
  }
  while (v3);
  if (v7) {
    goto LABEL_54;
  }
  uint64_t v67 = 0;
LABEL_55:
  if (LODWORD(__dst[0]) == 5)
  {
    uint64_t v68 = __dst[2];
    if (__dst[2])
    {
      __dst[2] = 0;
      free(v68);
    }
  }
  return v67;
}

uint64_t sub_10001F044(uint64_t a1)
{
  *(_DWORD *)(a1 + 2516) = 1;
  uint64_t v1 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, void, void))a1)(5, a1 + 2516, 308, 0, 0, *(void *)(a1 + 16));
  if (v1) {
    int v2 = "i: set PRC table config succeeded";
  }
  else {
    int v2 = "e: failed to set PRC table config";
  }
  puts(v2);
  return v1;
}

uint64_t sub_10001F0AC(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 2824);
  if (v1)
  {
    char v3 = 1;
    do
    {
      *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
      int v5 = 0;
      long long v6 = *(_OWORD *)(v1 + 1);
      if (((*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, int *, uint64_t, void))a1)(3, v1 + 3, 1548, &v5, 5, *(void *)(a1 + 16)) & 1) == 0)
      {
        printf("e: failed to set PRC LUT [t%d s%d b%d p%d]\n", v6, DWORD1(v6), DWORD2(v6), HIDWORD(v6));
        char v3 = 0;
      }
      uint64_t v1 = (uint64_t *)*v1;
    }
    while (v1);
    if ((v3 & 1) == 0) {
      return 0;
    }
  }
  puts("i: set PRC LUTs succeeded");
  return 1;
}

uint64_t sub_10001F1A4(uint64_t a1)
{
  uint64_t v1 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, void, void))a1)(82, a1 + 2864, 544, 0, 0, *(void *)(a1 + 16));
  if (v1) {
    int v2 = "i: set prox table config succeeded";
  }
  else {
    int v2 = "e: failed to set prox table config";
  }
  puts(v2);
  return v1;
}

uint64_t sub_10001F204()
{
  uint64_t v0 = __chkstk_darwin();
  int v1 = *(_DWORD *)(v0 + 2864);
  int v2 = *(uint64_t **)(v0 + 3600);
  char v3 = *(uint64_t **)(v0 + 3584);
  bzero(v69, 0xC84uLL);
  bzero(v67, 0xA54uLL);
  printf("i: Prox PP LUT bin interpolation, biint n = %g\n", (float)(*(float *)(v0 + 3568) + (float)*(unsigned int *)(v0 + 3564)));
  if (v2)
  {
    int v4 = 1;
    while (1)
    {
      int v5 = *((_DWORD *)v2 + 664);
      int v6 = *((_DWORD *)v2 + 665);
      int v72 = v5;
      int v73 = v6;
      int v7 = *((_DWORD *)v2 + 666);
      int v74 = v7;
      float v8 = *(float *)(v0 + 3568);
      if (v8 == 0.0)
      {
        unsigned int v9 = v2 + 1;
      }
      else
      {
        int v10 = *(uint64_t **)(v0 + 3608);
        if (!v10)
        {
LABEL_29:
          uint64_t v35 = "e: Prox PP bin tables do no correlate";
LABEL_54:
          puts(v35);
          return 0;
        }
        while (*((_DWORD *)v10 + 664) != v5 || *((_DWORD *)v10 + 665) != v6 || *((_DWORD *)v10 + 666) != v7)
        {
          int v10 = (uint64_t *)*v10;
          if (!v10) {
            goto LABEL_29;
          }
        }
        uint64_t v11 = 0;
        uint64_t v12 = *(unsigned __int16 *)(v0 + 3164);
        int v13 = (__int16 *)v2 + 6;
        int v14 = (__int16 *)v10 + 6;
        int v15 = &v68;
        do
        {
          if (v12)
          {
            uint64_t v16 = 0;
            uint64_t v17 = *(unsigned __int16 *)(v0 + 3162);
            uint64_t v18 = v15;
            uint64_t v19 = v14;
            uint64_t v20 = v13;
            do
            {
              int v21 = *((_DWORD *)&v2[10 * v11 + 301] + v16 + 1);
              float v22 = (float)v21 + (float)(v8 * (float)(*((_DWORD *)&v10[10 * v11 + 301] + v16 + 1) - v21));
              double v23 = v22 + 0.5;
              if (v22 >= 0.0) {
                double v24 = 0.0;
              }
              else {
                double v24 = 1.0;
              }
              *(_DWORD *)&v67[80 * v11 + 2404 + 4 * v16] = (int)(v23 - v24);
              uint64_t v25 = v17;
              unsigned int v26 = v18;
              unsigned int v27 = v19;
              int v28 = v20;
              if (v17)
              {
                do
                {
                  int v30 = *v28++;
                  int v29 = v30;
                  int v31 = *v27++;
                  float v32 = (float)v29 + (float)(v8 * (float)(v31 - v29));
                  double v33 = v32 + 0.5;
                  if (v32 >= 0.0) {
                    double v34 = 0.0;
                  }
                  else {
                    double v34 = 1.0;
                  }
                  *(_WORD *)unsigned int v26 = (int)(v33 - v34);
                  unsigned int v26 = (uint64_t *)((char *)v26 + 2);
                  --v25;
                }
                while (v25);
              }
              ++v16;
              v20 += 20;
              v19 += 20;
              v18 += 5;
            }
            while (v16 != v12);
          }
          ++v11;
          v13 += 400;
          v14 += 400;
          v15 += 100;
        }
        while (v11 != 3);
        unsigned int v9 = v67;
      }
      *unsigned int v9 = v1;
      v4 &= (*(uint64_t (**)(uint64_t))v0)(84);
      if ((v4 & 1) == 0) {
        printf("e: failed to set Prox PP LUT [t %d b %d p %d]\n", v72, v73, v74);
      }
      int v2 = (uint64_t *)*v2;
      if (!v2) {
        goto LABEL_31;
      }
    }
  }
  int v4 = 1;
LABEL_31:
  printf("i: Prox PD LUT bin interpolation, biint n = %g\n", (float)(*(float *)(v0 + 3552) + (float)*(unsigned int *)(v0 + 3548)));
  for (; v3; char v3 = (uint64_t *)*v3)
  {
    int v36 = *((_DWORD *)v3 + 803);
    int v72 = v36;
    float v37 = *(float *)(v0 + 3552);
    uint64_t v38 = v0 + 3592;
    if (v37 == 0.0)
    {
      float v39 = v3 + 1;
    }
    else
    {
      do
      {
        uint64_t v38 = *(void *)v38;
        if (!v38)
        {
          uint64_t v35 = "e: Prox PD bin tables do no correlate";
          goto LABEL_54;
        }
      }
      while (*(_DWORD *)(v38 + 3212) != v36);
      uint64_t v40 = *(unsigned __int16 *)(v0 + 2912);
      if (*(_WORD *)(v0 + 2912))
      {
        uint64_t v41 = 0;
        uint64_t v42 = *(unsigned __int16 *)(v0 + 2916);
        double v43 = (float *)v3 + 3;
        uint64_t v44 = (float *)(v38 + 12);
        uint64_t v45 = (float *)&v70;
        do
        {
          uint64_t v46 = v42;
          unsigned int v47 = v45;
          uint64_t v48 = v44;
          char v49 = v43;
          if (v42)
          {
            do
            {
              float v50 = *v49++;
              float v51 = v50;
              float v52 = *v48++;
              *v47++ = v51 + (float)(v37 * (float)(v52 - v51));
              --v46;
            }
            while (v46);
          }
          ++v41;
          v43 += 20;
          v44 += 20;
          v45 += 20;
        }
        while (v41 != v40);
      }
      uint64_t v53 = *(unsigned __int16 *)(v0 + 2914);
      if (*(_WORD *)(v0 + 2914))
      {
        uint64_t v54 = 0;
        uint64_t v55 = *(unsigned __int16 *)(v0 + 2918);
        int v56 = (float *)v3 + 403;
        uint64_t v57 = (float *)(v38 + 1612);
        char v58 = (float *)&v71;
        do
        {
          uint64_t v59 = v55;
          uint64_t v60 = v58;
          uint64_t v61 = v57;
          unsigned int v62 = v56;
          if (v55)
          {
            do
            {
              float v63 = *v62++;
              float v64 = v63;
              float v65 = *v61++;
              *v60++ = v64 + (float)(v37 * (float)(v65 - v64));
              --v59;
            }
            while (v59);
          }
          ++v54;
          v56 += 20;
          v57 += 20;
          v58 += 20;
        }
        while (v54 != v53);
      }
      float v39 = v69;
    }
    *float v39 = v1;
    v4 &= (*(uint64_t (**)(uint64_t))v0)(83);
    if ((v4 & 1) == 0) {
      printf("e: failed to set Prox PD LUT [t %d]\n", v72);
    }
  }
  if (v4) {
    puts("i: set Prox LUTs succeeded");
  }
  return 1;
}

uint64_t sub_10001F674(uint64_t a1)
{
  uint64_t v1 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, void, void))a1)(85, a1 + 3616, 72, 0, 0, *(void *)(a1 + 16));
  if (v1) {
    int v2 = "i: set LLMT table config succeeded";
  }
  else {
    int v2 = "e: failed to set LLMT table config";
  }
  puts(v2);
  return v1;
}

uint64_t sub_10001F6D4(uint64_t a1)
{
  uint64_t v1 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, void, void))a1)(111, a1 + 3692, 76, 0, 0, *(void *)(a1 + 16));
  if (v1) {
    int v2 = "i: set PTUC table config succeeded";
  }
  else {
    int v2 = "e: failed to set PTUC table config";
  }
  puts(v2);
  return v1;
}

uint64_t sub_10001F734(uint64_t a1)
{
  uint64_t v1 = *(uint64_t ***)(a1 + 3776);
  memset(v5, 0, 20);
  if (v1)
  {
    char v3 = 1;
    do
    {
      LODWORD(v5[0]) = 1;
      *(void *)((char *)&v5[1] + 4) = (char *)v1 + 10;
      LODWORD(v5[1]) = 0x4000;
      BYTE4(v5[0]) = 0;
      if (((*(uint64_t (**)(uint64_t, void *, uint64_t, void, void, void))a1)(112, v5, 20, 0, 0, *(void *)(a1 + 16)) & 1) == 0)
      {
        printf("e: failed to set PTUC TLS LUT brightness %d\n", *((unsigned __int16 *)v1 + 4));
        char v3 = 0;
      }
      uint64_t v1 = (uint64_t **)*v1;
    }
    while (v1);
    if ((v3 & 1) == 0) {
      return 0;
    }
  }
  puts("i: set PTUC TLS LUTs succeeded");
  return 1;
}

uint64_t sub_10001F800(uint64_t a1)
{
  if (!*(void *)(a1 + 2200)) {
    return 1;
  }
  *(_WORD *)(a1 + 24) &= ~1u;
  if ((*(_DWORD *)(a1 + 28) - 6) <= 0xFFFFFFFC)
  {
    printf("e: unexpected PDC table version %d\n", *(_DWORD *)(a1 + 28));
    return 0;
  }
  if (*(float *)(a1 + 2132) > 0.0 && !*(void *)(a1 + 2208))
  {
    double v43 = "e: PDC missing bin";
    goto LABEL_114;
  }
  uint64_t v2 = a1 + 36;
  uint64_t v3 = a1 + 196;
  uint64_t v4 = a1 + 276;
  uint64_t v5 = a1 + 116;
  char v6 = 1;
  while (1)
  {
    char v7 = v6;
    int v8 = v6 & 1;
    if (v6) {
      unsigned int v9 = (uint64_t **)(a1 + 2200);
    }
    else {
      unsigned int v9 = (uint64_t **)(a1 + 2208);
    }
    int v10 = *v9;
    if (!v8 && !v10)
    {
LABEL_109:
      BOOL v1 = *(void *)(a1 + 2200) != 0;
      *(_WORD *)(a1 + 24) = *(_WORD *)(a1 + 24) & 0xFFFE | v1;
      return v1;
    }
    int v11 = *(_DWORD *)(a1 + 28);
    if (v11 == 3)
    {
      for (i = 0; v10; int v10 = (uint64_t *)*v10)
      {
        uint64_t v22 = *(unsigned __int16 *)(a1 + 246);
        if (*(_WORD *)(a1 + 246))
        {
          uint64_t v23 = 0;
          while (*(_DWORD *)(v2 + 4 * v23) != *((_DWORD *)v10 + 2))
          {
            if (v22 == ++v23) {
              goto LABEL_52;
            }
          }
          LODWORD(v22) = v23;
        }
LABEL_52:
        *((_DWORD *)v10 + 2) = v22;
        uint64_t v24 = *(unsigned __int16 *)(a1 + 248);
        if (*(_WORD *)(a1 + 248))
        {
          uint64_t v25 = 0;
          while (*(_DWORD *)(a1 + 76 + 4 * v25) != *((_DWORD *)v10 + 4))
          {
            if (v24 == ++v25) {
              goto LABEL_58;
            }
          }
          LODWORD(v24) = v25;
        }
LABEL_58:
        *((_DWORD *)v10 + 4) = v24;
        uint64_t v26 = *(unsigned __int16 *)(a1 + 254);
        if (*(_WORD *)(a1 + 254))
        {
          uint64_t v27 = 0;
          while (*((_DWORD *)v10 + 3) != *(unsigned __int16 *)(v5 + 2 * v27))
          {
            if (v26 == ++v27) {
              goto LABEL_64;
            }
          }
          LODWORD(v26) = v27;
        }
LABEL_64:
        *((_DWORD *)v10 + 3) = v26;
        uint64_t v28 = *(unsigned __int16 *)(a1 + 256);
        if (*(_WORD *)(a1 + 256))
        {
          uint64_t v29 = 0;
          while (*(_DWORD *)(a1 + 136 + 4 * v29) != *((_DWORD *)v10 + 6))
          {
            if (v28 == ++v29) {
              goto LABEL_70;
            }
          }
          LODWORD(v28) = v29;
        }
LABEL_70:
        *((_DWORD *)v10 + 6) = v28;
        if (*((_DWORD *)v10 + 5) != 7) {
          goto LABEL_110;
        }
        ++i;
      }
      int v20 = *(unsigned __int16 *)(a1 + 248) * *(unsigned __int16 *)(a1 + 246) * *(unsigned __int16 *)(a1 + 254);
      int v21 = *(unsigned __int16 *)(a1 + 256);
LABEL_73:
      int v30 = v20 * v21;
      goto LABEL_107;
    }
    if (v11 == 5) {
      break;
    }
    if (v11 == 4)
    {
      int i = 0;
      if (v10)
      {
        while (1)
        {
          uint64_t v13 = *(unsigned __int16 *)(a1 + 350);
          if (*(_WORD *)(a1 + 350))
          {
            uint64_t v14 = 0;
            while (*(_DWORD *)(v2 + 4 * v14) != *((_DWORD *)v10 + 2))
            {
              if (v13 == ++v14) {
                goto LABEL_23;
              }
            }
            LODWORD(v13) = v14;
          }
LABEL_23:
          *((_DWORD *)v10 + 2) = v13;
          uint64_t v15 = *(unsigned __int16 *)(a1 + 352);
          if (*(_WORD *)(a1 + 352))
          {
            uint64_t v16 = 0;
            while (*(_DWORD *)(v5 + 4 * v16) != *((_DWORD *)v10 + 4))
            {
              if (v15 == ++v16) {
                goto LABEL_29;
              }
            }
            LODWORD(v15) = v16;
          }
LABEL_29:
          *((_DWORD *)v10 + 4) = v15;
          if (*(unsigned __int16 *)(a1 + 358) < 2u)
          {
            LODWORD(j) = 0;
          }
          else
          {
            for (uint64_t j = 0; j != 20; ++j)
            {
              if (!*(_WORD *)(v3 + 2 * j)) {
                break;
              }
              if (*((_DWORD *)v10 + 3) == *(unsigned __int16 *)(v3 + 2 * j)) {
                break;
              }
            }
          }
          *((_DWORD *)v10 + 3) = j;
          uint64_t v18 = *(unsigned __int16 *)(a1 + 360);
          if (*(_WORD *)(a1 + 360))
          {
            uint64_t v19 = 0;
            while (*((_DWORD *)v10 + 6) != *(unsigned __int16 *)(v4 + 2 * v19))
            {
              if (v18 == ++v19) {
                goto LABEL_42;
              }
            }
            LODWORD(v18) = v19;
          }
LABEL_42:
          *((_DWORD *)v10 + 6) = v18;
          if (*((_DWORD *)v10 + 5) != 7) {
            break;
          }
          ++i;
          int v10 = (uint64_t *)*v10;
          if (!v10) {
            goto LABEL_44;
          }
        }
LABEL_110:
        double v43 = "e: PDC missing at least 1 channel";
        goto LABEL_114;
      }
LABEL_44:
      int v20 = *(unsigned __int16 *)(a1 + 352) * *(unsigned __int16 *)(a1 + 350) * *(unsigned __int16 *)(a1 + 358);
      int v21 = *(unsigned __int16 *)(a1 + 360);
      goto LABEL_73;
    }
LABEL_108:
    char v6 = 0;
    if ((v7 & 1) == 0) {
      goto LABEL_109;
    }
  }
  int v31 = *(unsigned __int16 *)(a1 + 414);
  if (v31 != *(unsigned __int16 *)(a1 + 2188)
    || (int v32 = *(unsigned __int16 *)(a1 + 422), v32 != *(unsigned __int16 *)(a1 + 2190))
    || (int v33 = *(unsigned __int16 *)(a1 + 416), v33 != *(unsigned __int16 *)(a1 + 2192))
    || (int v34 = *(unsigned __int16 *)(a1 + 426), v34 != *(unsigned __int16 *)(a1 + 2196)))
  {
    double v43 = "e: reported PDC tap points (temp/DBV/RR/HGOD status) mismatch actual counts";
    goto LABEL_114;
  }
  int i = 0;
  if (v10)
  {
    while (1)
    {
      uint64_t v35 = *(unsigned __int16 *)(a1 + 414);
      if (*(_WORD *)(a1 + 414))
      {
        uint64_t v36 = 0;
        while (*(_DWORD *)(v2 + 4 * v36) != *((_DWORD *)v10 + 2))
        {
          if (v35 == ++v36) {
            goto LABEL_85;
          }
        }
        LODWORD(v35) = v36;
      }
LABEL_85:
      *((_DWORD *)v10 + 2) = v35;
      uint64_t v37 = *(unsigned __int16 *)(a1 + 416);
      if (*(_WORD *)(a1 + 416))
      {
        uint64_t v38 = 0;
        while (*(_DWORD *)(v5 + 4 * v38) != *((_DWORD *)v10 + 4))
        {
          if (v37 == ++v38) {
            goto LABEL_91;
          }
        }
        LODWORD(v37) = v38;
      }
LABEL_91:
      *((_DWORD *)v10 + 4) = v37;
      uint64_t v39 = *(unsigned __int16 *)(a1 + 424);
      if (*(_WORD *)(a1 + 424))
      {
        uint64_t v40 = 0;
        while (*(_DWORD *)(a1 + 436 + 4 * v40) != *((_DWORD *)v10 + 3))
        {
          if (v39 == ++v40) {
            goto LABEL_97;
          }
        }
        LODWORD(v39) = v40;
      }
LABEL_97:
      *((_DWORD *)v10 + 3) = v39;
      uint64_t v41 = *(unsigned __int16 *)(a1 + 426);
      if (*(_WORD *)(a1 + 426))
      {
        uint64_t v42 = 0;
        while (*((_DWORD *)v10 + 6) != *(unsigned __int16 *)(v4 + 2 * v42))
        {
          if (v41 == ++v42) {
            goto LABEL_103;
          }
        }
        LODWORD(v41) = v42;
      }
LABEL_103:
      *((_DWORD *)v10 + 6) = v41;
      if (*((_DWORD *)v10 + 5) != 7) {
        goto LABEL_110;
      }
      ++i;
      int v10 = (uint64_t *)*v10;
      if (!v10)
      {
        int v31 = *(unsigned __int16 *)(a1 + 414);
        int v33 = *(unsigned __int16 *)(a1 + 416);
        int v32 = *(unsigned __int16 *)(a1 + 422);
        int v34 = *(unsigned __int16 *)(a1 + 426);
        break;
      }
    }
  }
  int v30 = v33 * v31 * v32 * v34;
LABEL_107:
  if (i == v30) {
    goto LABEL_108;
  }
  double v43 = "e: missing PDC LUTs";
LABEL_114:
  puts(v43);
  return 0;
}

BOOL sub_10001FCA4(uint64_t a1)
{
  BOOL v1 = *(uint64_t **)(a1 + 2824);
  if (!v1) {
    return 1;
  }
  if (*(_DWORD *)(a1 + 2716) >= 2u
    && *(_DWORD *)(a1 + 4 * (*(_DWORD *)(a1 + 2816) - 1) + 2720) > (*(_DWORD *)(a1 + 2816)
                                                                                                + 1))
  {
    sub_1000203B8(a1);
    BOOL v1 = *(uint64_t **)(a1 + 2824);
    if (!v1) {
      goto LABEL_26;
    }
  }
  int v3 = 0;
  uint64_t v4 = v1;
  do
  {
    uint64_t v5 = *(unsigned int *)(a1 + 2616);
    if (v5)
    {
      uint64_t v6 = 0;
      while (*(_DWORD *)(a1 + 2520 + 4 * v6) != *((_DWORD *)v4 + 2))
      {
        if (v5 == ++v6)
        {
          LODWORD(v6) = *(_DWORD *)(a1 + 2616);
          break;
        }
      }
    }
    else
    {
      LODWORD(v6) = 0;
    }
    *((_DWORD *)v4 + 2) = v6;
    uint64_t v7 = *(unsigned int *)(a1 + 2716);
    if (v7)
    {
      uint64_t v8 = 0;
      while (*(_DWORD *)(a1 + 2620 + 4 * v8) != *((_DWORD *)v4 + 4))
      {
        if (v7 == ++v8)
        {
          LODWORD(v8) = *(_DWORD *)(a1 + 2716);
          break;
        }
      }
    }
    else
    {
      LODWORD(v8) = 0;
    }
    *((_DWORD *)v4 + 4) = v8;
    uint64_t v9 = *(unsigned int *)(a1 + 2816);
    if (v9)
    {
      uint64_t v10 = 0;
      while (*(_DWORD *)(a1 + 2720 + 4 * v10) != *((_DWORD *)v4 + 3))
      {
        if (v9 == ++v10)
        {
          LODWORD(v10) = *(_DWORD *)(a1 + 2816);
          break;
        }
      }
    }
    else
    {
      LODWORD(v10) = 0;
    }
    *((_DWORD *)v4 + 3) = v10;
    ++v3;
    uint64_t v4 = (uint64_t *)*v4;
  }
  while (v4);
  if (v3 != *(_DWORD *)(a1 + 2716) * *(_DWORD *)(a1 + 2616) * *(_DWORD *)(a1 + 2816) * *(_DWORD *)(a1 + 2820))
  {
    puts("e: missing PRC LUTs");
    return 0;
  }
  else
  {
LABEL_26:
    BOOL result = v1 != 0;
    *(_WORD *)(a1 + 24) = *(_WORD *)(a1 + 24) & 0xFFFB | (4 * result);
  }
  return result;
}

uint64_t sub_10001FE24(uint64_t a1)
{
  if (!*(void *)(a1 + 3584) || !*(void *)(a1 + 3600)) {
    return 1;
  }
  if (*(float *)(a1 + 3552) == 0.0 || *(void *)(a1 + 3592))
  {
    if (*(float *)(a1 + 3568) == 0.0 || *(void *)(a1 + 3608))
    {
      uint64_t v1 = *(unsigned int *)(a1 + 3424);
      int v2 = *(unsigned __int16 *)(a1 + 2870);
      if (v1 == v2
        && *(_DWORD *)(a1 + 3412) == v1
        && (uint64_t v3 = *(unsigned int *)(a1 + 3416), v4 = *(unsigned __int16 *)(a1 + 3160), v3 == v4)
        && (uint64_t v5 = *(unsigned int *)(a1 + 3420), v6 = *(unsigned __int16 *)(a1 + 3166), v5 == v6))
      {
        *(_WORD *)(a1 + 24) &= ~0x20u;
        char v7 = 1;
        while (1)
        {
          char v8 = v7;
          int v9 = v7 & 1;
          if (v7) {
            uint64_t v10 = (uint64_t **)(a1 + 3584);
          }
          else {
            uint64_t v10 = (uint64_t **)(a1 + 3592);
          }
          int v11 = *v10;
          if (!v9 && !v11)
          {
LABEL_27:
            char v13 = 1;
            while (1)
            {
              char v14 = v13;
              int v15 = v13 & 1;
              if (v13) {
                uint64_t v16 = (uint64_t **)(a1 + 3600);
              }
              else {
                uint64_t v16 = (uint64_t **)(a1 + 3608);
              }
              uint64_t v17 = *v16;
              if (!v15 && !v17)
              {
LABEL_58:
                *(_WORD *)(a1 + 24) |= 0x20u;
                return 1;
              }
              if (v17) {
                break;
              }
LABEL_57:
              char v13 = 0;
              if ((v14 & 1) == 0) {
                goto LABEL_58;
              }
            }
            while (1)
            {
              if (v2)
              {
                uint64_t v18 = 0;
                while (*((_DWORD *)v17 + 664) != *(_DWORD *)(a1 + 2872 + 4 * v18))
                {
                  if (v1 == ++v18) {
                    goto LABEL_66;
                  }
                }
              }
              else
              {
                LODWORD(v18) = 0;
              }
              if (v18 == v1)
              {
LABEL_66:
                printf("e: unspecified PP LUT temperature %d C\n");
                return 0;
              }
              *((_DWORD *)v17 + 664) = v18;
              if (v4)
              {
                uint64_t v19 = 0;
                while (*((_DWORD *)v17 + 665) != *(_DWORD *)(a1 + 3208 + 4 * v19))
                {
                  if (v3 == ++v19) {
                    goto LABEL_67;
                  }
                }
              }
              else
              {
                LODWORD(v19) = 0;
              }
              if (v19 == v3)
              {
LABEL_67:
                printf("e: unspecified PP LUT brightness %d\n");
                return 0;
              }
              *((_DWORD *)v17 + 665) = v19;
              if (v6)
              {
                uint64_t v20 = 0;
                while (*((_DWORD *)v17 + 666) != *(_DWORD *)(a1 + 3168 + 4 * v20))
                {
                  if (v5 == ++v20) {
                    goto LABEL_68;
                  }
                }
              }
              else
              {
                LODWORD(v20) = 0;
              }
              if (v20 == v5)
              {
LABEL_68:
                printf("e: unspecified PP LUT scan plan 0x%x\n");
                return 0;
              }
              *((_DWORD *)v17 + 666) = v20;
              if (*((_DWORD *)v17 + 663) != 7) {
                break;
              }
              uint64_t v17 = (uint64_t *)*v17;
              if (!v17) {
                goto LABEL_57;
              }
            }
            uint64_t v22 = "e: PP LUT missing color channel";
            goto LABEL_61;
          }
          if (v11) {
            break;
          }
LABEL_26:
          char v7 = 0;
          if ((v8 & 1) == 0) {
            goto LABEL_27;
          }
        }
        while (1)
        {
          if (v2)
          {
            uint64_t v12 = 0;
            while (*((_DWORD *)v11 + 803) != *(_DWORD *)(a1 + 2872 + 4 * v12))
            {
              if (v1 == ++v12) {
                goto LABEL_65;
              }
            }
          }
          else
          {
            LODWORD(v12) = 0;
          }
          if (v12 == v1) {
            break;
          }
          *((_DWORD *)v11 + 803) = v12;
          int v11 = (uint64_t *)*v11;
          if (!v11) {
            goto LABEL_26;
          }
        }
LABEL_65:
        printf("e: unspecified PD LUT temperature value %d C\n");
      }
      else
      {
        uint64_t v22 = "e: actual number of Prox LUTs differ from specified";
LABEL_61:
        puts(v22);
      }
    }
    else
    {
      printf("e: missing prox PP table bin %d\n");
    }
  }
  else
  {
    printf("e: missing prox PD table bin %d\n");
  }
  return 0;
}

uint64_t sub_10002011C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 3616);
  if (!v1) {
    return 1;
  }
  uint64_t v2 = 0;
  int v3 = 0;
  unsigned int v4 = 0;
  uint64_t v5 = a1 + 3620;
  do
  {
    if (v2)
    {
      unsigned int v6 = *(unsigned __int16 *)(a1 + 3652 + 2 * v2);
      if (v6 > *(unsigned __int16 *)(a1 + 2 * (v2 - 1) + 3652))
      {
        int v9 = "e: LLMT APL Thresholds not in descending order";
LABEL_20:
        puts(v9);
        return 0;
      }
    }
    else
    {
      unsigned int v6 = *(unsigned __int16 *)(a1 + 3652);
    }
    if (!(v6 | v3))
    {
      unsigned int v4 = v2;
      int v3 = 1;
    }
    ++v2;
  }
  while (v2 != 16);
  for (uint64_t i = 0; i != 16; ++i)
  {
    if (i && *(unsigned __int16 *)(v5 + 2 * i) < *(unsigned __int16 *)(v5 + 2 * (i - 1)))
    {
      int v9 = "e: LLMT DBV Thresholds not in ascending order";
      goto LABEL_20;
    }
  }
  if (v3 && *(unsigned __int16 *)(v5 + 2 * v4) == *(unsigned __int16 *)(a1 + 3684))
  {
    BOOL v8 = v1 == 1;
    *(_WORD *)(a1 + 24) = *(_WORD *)(a1 + 24) & 0xFFBF | (v8 << 6);
    return v8;
  }
  printf("e: LLMT Max DBV Threshold doesn't correspond to 0%% APL\n");
  return 0;
}

uint64_t sub_10002021C(uint64_t a1)
{
  int v1 = *(uint64_t **)(a1 + 3776);
  if (v1)
  {
    int v2 = 0;
    *(_WORD *)(a1 + 24) &= ~0x80u;
    int v3 = (unsigned __int16 *)(a1 + 3742);
    do
    {
      int v4 = *(_DWORD *)(a1 + 3692);
      if (v4 == 1)
      {
        if (*(_WORD *)(a1 + 3740))
        {
          int v7 = *((unsigned __int16 *)v1 + 4);
          if (v7 == *v3)
          {
            __int16 v8 = 0;
LABEL_25:
            *((_WORD *)v1 + 15) = v8;
          }
          else
          {
            unsigned __int8 v13 = 0;
            while (*(unsigned __int16 *)(a1 + 3740) > ++v13)
            {
              __int16 v8 = v13;
              if (v7 == v3[v13]) {
                goto LABEL_25;
              }
            }
          }
        }
      }
      else if (v4 == 2)
      {
        if (*(_WORD *)(a1 + 3748))
        {
          int v5 = *((unsigned __int16 *)v1 + 4);
          if (v5 == *(unsigned __int16 *)(a1 + 3732))
          {
            __int16 v6 = 0;
LABEL_14:
            *((_WORD *)v1 + 17) = v6;
          }
          else
          {
            unsigned __int8 v9 = 0;
            while (*(unsigned __int16 *)(a1 + 3748) > ++v9)
            {
              __int16 v6 = v9;
              if (v5 == *(unsigned __int16 *)(a1 + 2 * v9 + 3732)) {
                goto LABEL_14;
              }
            }
          }
        }
        if (*(_WORD *)(a1 + 3766))
        {
          int v10 = *((unsigned __int16 *)v1 + 16);
          if (v10 == *(unsigned __int16 *)(a1 + 3750))
          {
            __int16 v11 = 0;
LABEL_21:
            *((_WORD *)v1 + 18) = v11;
          }
          else
          {
            unsigned __int8 v12 = 0;
            while (*(unsigned __int16 *)(a1 + 3766) > ++v12)
            {
              __int16 v11 = v12;
              if (v10 == *(unsigned __int16 *)(a1 + 2 * v12 + 3750)) {
                goto LABEL_21;
              }
            }
          }
        }
      }
      ++v2;
      int v1 = (uint64_t *)*v1;
    }
    while (v1);
    int v14 = *(_DWORD *)(a1 + 3692);
    if (v14 == 2)
    {
      int v15 = *(unsigned __int16 *)(a1 + 3748);
      int v16 = *(unsigned __int16 *)(a1 + 3766);
      if (v2 != v16 * v15 && v15 != *(unsigned __int16 *)(a1 + 3728) && v16 != *(unsigned __int16 *)(a1 + 3730)) {
        goto LABEL_37;
      }
    }
    else if (v14 == 1 && v2 != *(unsigned __int16 *)(a1 + 3740))
    {
LABEL_37:
      puts("e: missing PTUC LUTs");
      return 0;
    }
    *(_WORD *)(a1 + 24) |= 0x80u;
  }
  return 1;
}

uint64_t sub_1000203B8(uint64_t a1)
{
  if (!*(void *)(a1 + 2824)) {
    goto LABEL_3;
  }
  unint64_t v2 = *(unsigned int *)(a1 + 2816);
  long long v3 = *(_OWORD *)(a1 + 2768);
  v37[2] = *(_OWORD *)(a1 + 2752);
  v37[3] = v3;
  long long v4 = *(_OWORD *)(a1 + 2800);
  v37[4] = *(_OWORD *)(a1 + 2784);
  v37[5] = v4;
  long long v5 = *(_OWORD *)(a1 + 2736);
  v37[0] = *(_OWORD *)(a1 + 2720);
  v37[1] = v5;
  if (v2 >= 2)
  {
    BOOL v7 = 0;
    uint64_t v8 = a1 + 2520;
    uint64_t v9 = a1 + 2620;
    int v34 = (unsigned int *)(a1 + 2816);
    uint64_t v35 = a1 + 2824;
    int v33 = (unsigned int *)(a1 + 2720);
    unsigned int v10 = v37[0];
    unint64_t v11 = 1;
    while (1)
    {
      unsigned int v12 = *((_DWORD *)v37 + v11);
      unsigned int v36 = v10 + 1;
      if (v10 + 1 < v12) {
        break;
      }
LABEL_33:
      ++v11;
      char v6 = 1;
      unsigned int v10 = v12;
      BOOL v7 = v11 >= v2;
      if (v11 == v2) {
        return v6 & 1;
      }
    }
    unint64_t v13 = *(unsigned int *)(a1 + 2716);
    unint64_t v14 = v13;
    char v32 = v7;
    unint64_t v30 = v11;
    unint64_t v31 = v2;
    while (!v14)
    {
LABEL_32:
      if (++v36 == v12) {
        goto LABEL_33;
      }
    }
    unint64_t v15 = 0;
    LODWORD(v16) = *(_DWORD *)(a1 + 2616);
    while (!v16)
    {
LABEL_31:
      ++v15;
      unint64_t v14 = v13;
      if (v15 >= v13) {
        goto LABEL_32;
      }
    }
    unint64_t v17 = 0;
    while (1)
    {
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      uint64_t v20 = v35;
      do
      {
        uint64_t v20 = *(void *)v20;
        if (!v20) {
          break;
        }
        if (*(_DWORD *)(v20 + 8) == *(_DWORD *)(v8 + 4 * v17))
        {
          int v21 = *(_DWORD *)(v20 + 12);
          if (v21 == v10 && *(_DWORD *)(v20 + 16) == *(_DWORD *)(v9 + 4 * v15)) {
            uint64_t v18 = v20;
          }
          if (v21 == v12 && *(_DWORD *)(v20 + 16) == *(_DWORD *)(v9 + 4 * v15)) {
            uint64_t v19 = v20;
          }
        }
      }
      while (!v18 || !v19);
      if (!v18 || !v19)
      {
        printf("e: Could not find PRC tables [%d:%d:%d] [%d:%d:%d]\n", *(_DWORD *)(v8 + 4 * v17), v10, *(_DWORD *)(v9 + 4 * v15), *(_DWORD *)(v8 + 4 * v17), v12, *(_DWORD *)(v9 + 4 * v15));
        goto LABEL_37;
      }
      uint64_t v22 = (char *)malloc_type_calloc(1uLL, 0x628uLL, 0x10200404B1403A4uLL);
      if (!v22) {
        break;
      }
      uint64_t v23 = v22;
      uint64_t v24 = 0;
      *((_DWORD *)v22 + 6) = 2;
      *((_DWORD *)v22 + 2) = *(_DWORD *)(v18 + 8);
      *((_DWORD *)v22 + 3) = v36;
      *((void *)v22 + 2) = *(void *)(v18 + 16);
      uint64_t v25 = v19 + 28;
      uint64_t v26 = v18 + 28;
      uint64_t v27 = v22 + 28;
      do
      {
        for (uint64_t i = 0; i != 514; i += 2)
          *(_WORD *)&v27[i] = (int)((float)((float)*(unsigned __int16 *)(v25 + i)
                                          + (float)((float)((float)(v12 - v36) / (float)(v12 - v10))
                                                  * (float)(*(unsigned __int16 *)(v26 + i)
                                                          - *(unsigned __int16 *)(v25 + i))))
                                  + 0.5);
        ++v24;
        v25 += 514;
        v26 += 514;
        v27 += 514;
      }
      while (v24 != 3);
      sub_100015664(a1, *((_DWORD *)v22 + 3), v33, v34);
      *uint64_t v23 = *(void *)(a1 + 2824);
      *(void *)(a1 + 2824) = v23;
      ++v17;
      unint64_t v16 = *(unsigned int *)(a1 + 2616);
      if (v17 >= v16)
      {
        unint64_t v13 = *(unsigned int *)(a1 + 2716);
        unint64_t v11 = v30;
        unint64_t v2 = v31;
        goto LABEL_31;
      }
    }
    puts("e: out of memory for PRC table");
LABEL_37:
    char v6 = v32;
  }
  else
  {
LABEL_3:
    char v6 = 1;
  }
  return v6 & 1;
}

void sub_1000206B4(uint64_t a1, uint64_t a2)
{
  switch(*(_DWORD *)a2)
  {
    case 1:
      sub_100020904(a2 + 4, *(_DWORD *)(a2 + 52), "PDC temperatures", "0x%x");
      int v3 = *(_DWORD *)(a2 + 104);
      sub_100020904(a2 + 56, v3, "PDC subframes", "%d");
      break;
    case 2:
      sub_1000209AC(a2 + 4, *(unsigned __int16 *)(a2 + 302), "PDC temperatures");
      int v4 = *(unsigned __int16 *)(a2 + 304);
      sub_1000209AC(a2 + 84, v4, "PDC brightnesses");
      break;
    case 3:
      sub_1000209AC(a2 + 4, *(unsigned __int16 *)(a2 + 214), "PDC temperatures");
      sub_1000209AC(a2 + 44, *(unsigned __int16 *)(a2 + 216), "PDC brightnesses");
      uint64_t v5 = a2 + 84;
      int v6 = *(unsigned __int16 *)(a2 + 222);
      goto LABEL_10;
    case 4:
      sub_1000209AC(a2 + 4, *(unsigned __int16 *)(a2 + 318), "PDC temperatures");
      sub_1000209AC(a2 + 84, *(unsigned __int16 *)(a2 + 320), "PDC brightnesses");
      uint64_t v5 = a2 + 164;
      int v6 = *(unsigned __int16 *)(a2 + 326);
LABEL_10:
      sub_100020A58(v5, v6);
      break;
    case 5:
      sub_1000209AC(a2 + 4, *(unsigned __int16 *)(a2 + 382), "PDC temperatures");
      sub_1000209AC(a2 + 84, *(unsigned __int16 *)(a2 + 384), "PDC brightnesses");
      sub_100020A58(a2 + 164, *(unsigned __int16 *)(a2 + 390));
      printf("i: PDC nframes: %d\n", *(unsigned __int16 *)(a2 + 2084));
      break;
    default:
      return;
  }
}

void *sub_100020884(void *a1)
{
  unint64_t v2 = (void *)a1[448];
  if (v2)
  {
    do
    {
      int v3 = (void *)*v2;
      free(v2);
      unint64_t v2 = v3;
    }
    while (v3);
  }
  int v4 = (void *)a1[449];
  if (v4)
  {
    do
    {
      uint64_t v5 = (void *)*v4;
      free(v4);
      int v4 = v5;
    }
    while (v5);
  }
  int v6 = (void *)a1[450];
  if (v6)
  {
    do
    {
      BOOL v7 = (void *)*v6;
      free(v6);
      int v6 = v7;
    }
    while (v7);
  }
  BOOL result = (void *)a1[451];
  if (result)
  {
    do
    {
      uint64_t v9 = (void *)*result;
      free(result);
      BOOL result = v9;
    }
    while (v9);
  }
  return result;
}

uint64_t sub_100020904(uint64_t a1, int a2, const char *a3, const char *a4)
{
  printf("i: %s: ", a3);
  if (a2)
  {
    unint64_t v7 = 0;
    do
    {
      printf(a4, *(unsigned int *)(a1 + 4 * v7));
      if (v7 < (a2 - 1)) {
        printf(", ");
      }
      ++v7;
    }
    while (a2 != v7);
  }

  return putchar(10);
}

uint64_t sub_1000209AC(uint64_t a1, int a2, const char *a3)
{
  printf("i: %s: ", a3);
  if (a2)
  {
    unint64_t v5 = 0;
    do
    {
      printf("0x%x", *(_DWORD *)(a1 + 4 * v5));
      if (v5 < (a2 - 1)) {
        printf(", ");
      }
      ++v5;
    }
    while (a2 != v5);
  }

  return putchar(10);
}

uint64_t sub_100020A58(uint64_t a1, int a2)
{
  printf("i: %s: ", "PDC subframes");
  if (a2)
  {
    unint64_t v4 = 0;
    do
    {
      printf("%d", *(unsigned __int16 *)(a1 + 2 * v4));
      if (v4 < (a2 - 1)) {
        printf(", ");
      }
      ++v4;
    }
    while (a2 != v4);
  }

  return putchar(10);
}

float sub_100020B0C(unsigned int a1)
{
  return (float)a1 / 255.0;
}

void *sub_100020B20(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    int v6 = result;
    BOOL result = sub_100020B9C(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      BOOL result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_100020B80(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_100020B9C(void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_100009CF0();
  }
  BOOL result = (char *)sub_100020BE0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *sub_100020BE0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_100009C44();
  }
  return operator new(4 * a2);
}

void *sub_100020C18(uint64_t a1)
{
  if (a1 < 1) {
    return 0;
  }
  if (a1 >= 0x1FFFFFFFFFFFFFFFLL) {
    unint64_t v1 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v1 = a1;
  }
  while (1)
  {
    BOOL result = operator new(4 * v1, &std::nothrow);
    if (result) {
      break;
    }
    BOOL v3 = v1 > 1;
    v1 >>= 1;
    if (!v3) {
      return 0;
    }
  }
  return result;
}

void sub_100020C7C(unsigned int *a1, unsigned int *a2, uint64_t **a3, unint64_t a4, unsigned int *a5, uint64_t a6)
{
  if (a4 >= 2)
  {
    if (a4 == 2)
    {
      unint64_t v9 = *(a2 - 1);
      uint64_t v10 = **a3;
      unint64_t v11 = ((*a3)[1] - v10) >> 2;
      if (v11 <= v9 || (unint64_t v12 = *a1, v11 <= v12))
      {
        __break(1u);
      }
      else if (*(_DWORD *)(v10 + 4 * v9) < *(_DWORD *)(v10 + 4 * v12))
      {
        *a1 = v9;
        *(a2 - 1) = v12;
      }
    }
    else if ((uint64_t)a4 > 128)
    {
      unint64_t v16 = a4 >> 1;
      unint64_t v17 = &a1[a4 >> 1];
      unint64_t v18 = a4 >> 1;
      if ((uint64_t)a4 <= a6)
      {
        sub_100020F14(a1, v17, a3, v18, a5);
        sub_100020F14(&a1[a4 >> 1], a2, a3, a4 - (a4 >> 1), &a5[v16]);
        sub_100021090(a5, &a5[v16], &a5[v16], &a5[a4], a1, a3);
      }
      else
      {
        sub_100020C7C(a1, v17, a3, v18, a5, a6);
        sub_100020C7C(&a1[a4 >> 1], a2, a3, a4 - (a4 >> 1), a5, a6);
        sub_100021138((char *)a1, &a1[a4 >> 1], a2, a3, a4 >> 1, a4 - (a4 >> 1), (char *)a5, a6);
      }
    }
    else
    {
      sub_100020E5C(a1, a2, a3);
    }
  }
}

unsigned int *sub_100020E5C(unsigned int *result, unsigned int *a2, uint64_t **a3)
{
  if (result != a2)
  {
    BOOL v3 = result + 1;
    if (result + 1 != a2)
    {
      uint64_t v4 = 0;
      uint64_t v5 = **a3;
      unint64_t v6 = ((*a3)[1] - v5) >> 2;
      uint64_t v7 = result;
      while (1)
      {
        size_t v8 = v3;
        unint64_t v9 = *v3;
        if (v6 <= v9) {
          break;
        }
        unint64_t v10 = *v7;
        if (v6 <= v10) {
          break;
        }
        if (*(_DWORD *)(v5 + 4 * v9) < *(_DWORD *)(v5 + 4 * v10))
        {
          uint64_t v11 = v4;
          while (1)
          {
            *(unsigned int *)((char *)result + v11 + 4) = v10;
            if (!v11) {
              break;
            }
            unint64_t v10 = *(unsigned int *)((char *)result + v11 - 4);
            if (v6 <= v10) {
              goto LABEL_16;
            }
            v11 -= 4;
            if (*(_DWORD *)(v5 + 4 * v9) >= *(_DWORD *)(v5 + 4 * v10))
            {
              unint64_t v12 = (unsigned int *)((char *)result + v11 + 4);
              goto LABEL_13;
            }
          }
          unint64_t v12 = result;
LABEL_13:
          *unint64_t v12 = v9;
        }
        BOOL v3 = v8 + 1;
        v4 += 4;
        uint64_t v7 = v8;
        if (v8 + 1 == a2) {
          return result;
        }
      }
LABEL_16:
      __break(1u);
    }
  }
  return result;
}

unsigned int *sub_100020F14(unsigned int *result, unsigned int *a2, uint64_t **a3, unint64_t a4, unsigned int *a5)
{
  if (a4)
  {
    unint64_t v9 = result;
    if (a4 == 2)
    {
      unint64_t v10 = *(a2 - 1);
      uint64_t v11 = **a3;
      unint64_t v12 = ((*a3)[1] - v11) >> 2;
      if (v12 <= v10 || (unint64_t v13 = *result, v12 <= v13))
      {
        __break(1u);
      }
      else
      {
        if (*(_DWORD *)(v11 + 4 * v10) >= *(_DWORD *)(v11 + 4 * v13))
        {
          *a5 = v13;
          unsigned int v14 = *(a2 - 1);
        }
        else
        {
          *a5 = v10;
          unsigned int v14 = *result;
        }
        a5[1] = v14;
      }
    }
    else if (a4 == 1)
    {
      *a5 = *result;
    }
    else if ((uint64_t)a4 > 8)
    {
      sub_100020C7C(result, &result[a4 >> 1], a3, a4 >> 1, a5, a4 >> 1);
      sub_100020C7C(&v9[a4 >> 1], a2, a3, a4 - (a4 >> 1), &a5[a4 >> 1], a4 - (a4 >> 1));
      return sub_100021470(v9, &v9[a4 >> 1], &v9[a4 >> 1], a2, a5, a3);
    }
    else
    {
      return sub_100021390(result, a2, a5, a3);
    }
  }
  return result;
}

_DWORD *sub_100021090(_DWORD *result, _DWORD *a2, unsigned int *a3, unsigned int *a4, _DWORD *a5, void **a6)
{
  if (result == a2)
  {
LABEL_14:
    while (a3 != a4)
    {
      int v12 = *a3++;
      *a5++ = v12;
    }
  }
  else
  {
    unint64_t v6 = *a6;
    while (a3 != a4)
    {
      unint64_t v7 = *a3;
      unint64_t v8 = (uint64_t)(v6[1] - *v6) >> 2;
      if (v8 <= v7 || (unint64_t v9 = *result, v8 <= v9))
      {
        __break(1u);
        return result;
      }
      BOOL v10 = *(_DWORD *)(*v6 + 4 * v7) < *(_DWORD *)(*v6 + 4 * v9);
      unsigned int v11 = !v10;
      if (!v10) {
        LODWORD(v7) = *result;
      }
      result += v11;
      a3 += v10;
      *a5++ = v7;
      if (result == a2) {
        goto LABEL_14;
      }
    }
    if (result != a2)
    {
      uint64_t v13 = 0;
      do
      {
        a5[v13] = result[v13];
        ++v13;
      }
      while (&result[v13] != a2);
    }
  }
  return result;
}

void sub_100021138(char *a1, unsigned int *a2, unsigned int *a3, uint64_t **a4, uint64_t a5, uint64_t a6, char *a7, uint64_t a8)
{
  if (a6)
  {
    uint64_t v11 = a6;
LABEL_3:
    if (v11 <= a8 || a5 <= a8)
    {
      sub_100021518(a1, a2, a3, a4, a5, v11, a7);
    }
    else if (a5)
    {
      unint64_t v16 = *a2;
      unint64_t v17 = *a4;
      uint64_t v18 = **a4;
      unint64_t v19 = ((*a4)[1] - v18) >> 2;
      if (v19 > v16)
      {
        uint64_t v20 = 0;
        unint64_t v9 = 0;
        while (1)
        {
          unint64_t v8 = *(unsigned int *)&a1[4 * (void)v9];
          if (v19 <= v8) {
            break;
          }
          if (*(_DWORD *)(v18 + 4 * v16) < *(_DWORD *)(v18 + 4 * v8))
          {
            uint64_t v21 = a5 - (void)v9;
            uint64_t v35 = a8;
            unsigned int v36 = a4;
            __dst = &a1[-v20];
            int v34 = a3;
            if (a5 - (uint64_t)v9 >= v11)
            {
              if ((unsigned int *)(a5 - 1) == v9) {
                goto LABEL_29;
              }
              if (v21 >= 0) {
                uint64_t v27 = a5 - (void)v9;
              }
              else {
                uint64_t v27 = v21 + 1;
              }
              uint64_t v26 = v27 >> 1;
              uint64_t v25 = (unsigned int *)&a1[4 * (v27 >> 1) - v20];
              uint64_t v38 = v17;
              uint64_t v24 = sub_100021834(a2, a3, v25, &v38);
              uint64_t v23 = v24 - a2;
            }
            else
            {
              if (v11 >= 0) {
                uint64_t v22 = v11;
              }
              else {
                uint64_t v22 = v11 + 1;
              }
              uint64_t v23 = v22 >> 1;
              uint64_t v24 = &a2[v22 >> 1];
              uint64_t v25 = sub_1000215EC((unsigned int *)&a1[-v20], a2, v24, a4);
              uint64_t v26 = ((char *)v25 - a1 + v20) >> 2;
            }
            uint64_t v32 = a5 - v26 - (void)v9;
            uint64_t v28 = v11 - v23;
            uint64_t v29 = sub_100021654((char *)v25, (char *)a2, (char *)v24);
            a1 = v29;
            if (v26 + v23 >= v11 + a5 - (v26 + v23) - (uint64_t)v9)
            {
              unint64_t v9 = (unsigned int *)v29;
              sub_100021138(v29, v24, v34, v36, v32, v28, a7, v35);
              a1 = __dst;
              a2 = v25;
              a4 = v36;
              uint64_t v28 = v23;
              a8 = v35;
              a5 = v26;
              a3 = v9;
            }
            else
            {
              unint64_t v30 = v25;
              a4 = v36;
              uint64_t v31 = v23;
              a8 = v35;
              sub_100021138(__dst, v30, v29, v36, v26, v31, a7, v35);
              a2 = v24;
              a3 = v34;
              a5 = a5 - v26 - (void)v9;
            }
            uint64_t v11 = v28;
            if (v28) {
              goto LABEL_3;
            }
            return;
          }
          unint64_t v9 = (unsigned int *)((char *)v9 + 1);
          v20 -= 4;
          if ((unsigned int *)a5 == v9) {
            return;
          }
        }
      }
      __break(1u);
LABEL_29:
      *(_DWORD *)&a1[4 * (void)v9] = v16;
      *a2 = v8;
    }
  }
}

unsigned int *sub_100021390(unsigned int *result, unsigned int *a2, unsigned int *a3, uint64_t **a4)
{
  if (result != a2)
  {
    unsigned int v4 = *result++;
    *a3 = v4;
    if (result != a2)
    {
      uint64_t v5 = 0;
      uint64_t v6 = **a4;
      unint64_t v7 = ((*a4)[1] - v6) >> 2;
      unint64_t v8 = a3;
      while (1)
      {
        unint64_t v9 = *result;
        if (v7 <= v9) {
          break;
        }
        BOOL v10 = v8 + 1;
        unint64_t v11 = *v8;
        if (v7 <= v11) {
          break;
        }
        if (*(_DWORD *)(v6 + 4 * v9) >= *(_DWORD *)(v6 + 4 * v11))
        {
          *BOOL v10 = v9;
        }
        else
        {
          v8[1] = v11;
          int v12 = a3;
          if (v8 != a3)
          {
            uint64_t v13 = v5;
            while (1)
            {
              unint64_t v14 = *result;
              if (v7 <= v14) {
                goto LABEL_19;
              }
              unint64_t v15 = *(unsigned int *)((char *)a3 + v13 - 4);
              if (v7 <= v15) {
                goto LABEL_19;
              }
              if (*(_DWORD *)(v6 + 4 * v14) >= *(_DWORD *)(v6 + 4 * v15))
              {
                int v12 = (unsigned int *)((char *)a3 + v13);
                break;
              }
              *(unsigned int *)((char *)a3 + v13) = v15;
              v13 -= 4;
              if (!v13)
              {
                int v12 = a3;
                break;
              }
            }
          }
          *int v12 = *result;
        }
        ++result;
        v5 += 4;
        unint64_t v8 = v10;
        if (result == a2) {
          return result;
        }
      }
LABEL_19:
      __break(1u);
    }
  }
  return result;
}

_DWORD *sub_100021470(_DWORD *result, _DWORD *a2, unsigned int *a3, unsigned int *a4, _DWORD *a5, uint64_t **a6)
{
  if (result == a2)
  {
LABEL_14:
    while (a3 != a4)
    {
      int v16 = *a3++;
      *a5++ = v16;
    }
  }
  else
  {
    uint64_t v6 = *a6;
    while (a3 != a4)
    {
      unint64_t v7 = *a3;
      uint64_t v8 = *v6;
      unint64_t v9 = (v6[1] - *v6) >> 2;
      if (v9 <= v7 || (unint64_t v10 = *result, v9 <= v10))
      {
        __break(1u);
        return result;
      }
      int v11 = *(_DWORD *)(v8 + 4 * v7);
      int v12 = *(_DWORD *)(v8 + 4 * v10);
      BOOL v13 = v11 < v12;
      BOOL v14 = v11 >= v12;
      unsigned int v15 = v13;
      if (!v13) {
        LODWORD(v7) = *result;
      }
      a3 += v15;
      result += v14;
      *a5++ = v7;
      if (result == a2) {
        goto LABEL_14;
      }
    }
    if (result != a2)
    {
      uint64_t v17 = 0;
      do
      {
        a5[v17] = result[v17];
        ++v17;
      }
      while (&result[v17] != a2);
    }
  }
  return result;
}

void sub_100021518(char *__dst, unsigned int *a2, unsigned int *a3, uint64_t **a4, uint64_t a5, uint64_t a6, char *__src)
{
  if (a5 <= a6)
  {
    int v12 = __src;
    if (__dst != (char *)a2)
    {
      int v12 = __src;
      BOOL v13 = __dst;
      do
      {
        int v14 = *(_DWORD *)v13;
        v13 += 4;
        *(_DWORD *)int v12 = v14;
        v12 += 4;
      }
      while (v13 != (char *)a2);
    }
    sub_100021718(__src, v12, a2, a3, __dst, a4);
  }
  else
  {
    unint64_t v9 = __src;
    if (a2 != a3)
    {
      unint64_t v9 = __src;
      unint64_t v10 = a2;
      do
      {
        int v11 = *v10++;
        *(_DWORD *)unint64_t v9 = v11;
        v9 += 4;
      }
      while (v10 != a3);
    }
    unsigned int v15 = a4;
    sub_100021798((uint64_t)v9, (uint64_t)v9, (uint64_t)__src, (uint64_t)__src, (uint64_t)a2, (uint64_t)a2, (uint64_t)__dst, (uint64_t)__dst, (uint64_t)a3, (uint64_t)a3, &v15);
  }
}

unsigned int *sub_1000215EC(unsigned int *result, unsigned int *a2, unsigned int *a3, uint64_t **a4)
{
  if (a2 != result)
  {
    unint64_t v4 = *a3;
    uint64_t v5 = **a4;
    unint64_t v6 = ((*a4)[1] - v5) >> 2;
    if (v6 > v4)
    {
      unint64_t v7 = a2 - result;
      while (1)
      {
        unint64_t v8 = v7 >> 1;
        unint64_t v9 = &result[v7 >> 1];
        unint64_t v10 = *v9;
        if (v6 <= v10) {
          break;
        }
        int v11 = v9 + 1;
        v7 += ~v8;
        if (*(_DWORD *)(v5 + 4 * v4) < *(_DWORD *)(v5 + 4 * v10)) {
          unint64_t v7 = v8;
        }
        else {
          BOOL result = v11;
        }
        if (!v7) {
          return result;
        }
      }
    }
    __break(1u);
  }
  return result;
}

char *sub_100021654(char *__src, char *a2, char *a3)
{
  unint64_t v4 = a3;
  if (__src != a2)
  {
    if (a2 == a3)
    {
      return __src;
    }
    else if (__src + 4 == a2)
    {
      int v6 = *(_DWORD *)__src;
      int64_t v7 = a3 - a2;
      memmove(__src, a2, a3 - a2);
      unint64_t v4 = &__src[v7];
      *(_DWORD *)unint64_t v4 = v6;
    }
    else if (a2 + 4 == a3)
    {
      int v8 = *((_DWORD *)a3 - 1);
      unint64_t v4 = __src + 4;
      size_t v9 = a3 - 4 - __src;
      if (a3 - 4 != __src) {
        memmove(__src + 4, __src, v9);
      }
      *(_DWORD *)__src = v8;
    }
    else
    {
      return (char *)sub_10002189C(__src, a2, a3);
    }
  }
  return v4;
}

char *sub_100021718(char *__src, char *a2, unsigned int *a3, unsigned int *a4, char *__dst, uint64_t **a6)
{
  if (__src != a2)
  {
    int v6 = __src;
    int64_t v7 = *a6;
    while (1)
    {
      if (a3 == a4) {
        return (char *)memmove(__dst, v6, a2 - v6);
      }
      unint64_t v8 = *a3;
      uint64_t v9 = *v7;
      unint64_t v10 = (v7[1] - *v7) >> 2;
      if (v10 <= v8) {
        break;
      }
      unint64_t v11 = *(unsigned int *)v6;
      if (v10 <= v11) {
        break;
      }
      int v12 = *(_DWORD *)(v9 + 4 * v8);
      int v13 = *(_DWORD *)(v9 + 4 * v11);
      BOOL v14 = v12 < v13;
      BOOL v15 = v12 >= v13;
      unsigned int v16 = v14;
      if (!v14) {
        LODWORD(v8) = *(_DWORD *)v6;
      }
      a3 += v16;
      v6 += 4 * v15;
      *(_DWORD *)__dst = v8;
      __dst += 4;
      if (v6 == a2) {
        return __src;
      }
    }
    __break(1u);
  }
  return __src;
}

void sub_100021798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t ***a11)
{
  if (a2 != a4)
  {
    unint64_t v11 = *a11;
    int v12 = (_DWORD *)(a10 - 4);
    while (a6 != a8)
    {
      unint64_t v13 = *(unsigned int *)(a2 - 4);
      uint64_t v14 = **v11;
      unint64_t v15 = ((*v11)[1] - v14) >> 2;
      if (v15 <= v13 || (unint64_t v16 = *(unsigned int *)(a6 - 4), v15 <= v16))
      {
        __break(1u);
        return;
      }
      if (*(_DWORD *)(v14 + 4 * v13) >= *(_DWORD *)(v14 + 4 * v16))
      {
        a2 -= 4;
      }
      else
      {
        LODWORD(v13) = *(_DWORD *)(a6 - 4);
        a6 -= 4;
      }
      *v12-- = v13;
      if (a2 == a4) {
        return;
      }
    }
    uint64_t v17 = 0;
    do
    {
      v12[v17] = *(_DWORD *)(a2 + v17 * 4 - 4);
      --v17;
    }
    while (a2 + v17 * 4 != a4);
  }
}

unsigned int *sub_100021834(unsigned int *result, unsigned int *a2, unsigned int *a3, uint64_t **a4)
{
  if (a2 != result)
  {
    unint64_t v4 = a2 - result;
    uint64_t v5 = **a4;
    unint64_t v6 = ((*a4)[1] - v5) >> 2;
    unint64_t v7 = *a3;
    while (1)
    {
      unint64_t v8 = v4 >> 1;
      uint64_t v9 = &result[v4 >> 1];
      unint64_t v10 = *v9;
      if (v6 <= v10 || v6 <= v7) {
        break;
      }
      unint64_t v11 = v9 + 1;
      v4 += ~v8;
      if (*(_DWORD *)(v5 + 4 * v10) < *(_DWORD *)(v5 + 4 * v7)) {
        BOOL result = v11;
      }
      else {
        unint64_t v4 = v8;
      }
      if (!v4) {
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

_DWORD *sub_10002189C(_DWORD *a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v3 = a2 - a1;
  if (v3 == a3 - a2)
  {
    if (a1 != a2 && a2 != a3)
    {
      unint64_t v4 = a1 + 1;
      uint64_t v5 = a2 + 1;
      do
      {
        int v6 = *(v4 - 1);
        *(v4 - 1) = *(v5 - 1);
        *(v5 - 1) = v6;
        if (v4 == a2) {
          break;
        }
        ++v4;
      }
      while (v5++ != a3);
    }
  }
  else
  {
    uint64_t v8 = a3 - a2;
    uint64_t v9 = a2 - a1;
    do
    {
      uint64_t v10 = v9;
      uint64_t v9 = v8;
      uint64_t v8 = v10 % v8;
    }
    while (v8);
    if (v9)
    {
      unint64_t v11 = &a1[v9];
      do
      {
        int v13 = *--v11;
        int v12 = v13;
        uint64_t v14 = &v11[v3];
        unint64_t v15 = v11;
        do
        {
          unint64_t v16 = v14;
          *unint64_t v15 = *v14;
          uint64_t v17 = &v14[v3];
          BOOL v18 = __OFSUB__(v3, a3 - v14);
          uint64_t v20 = v3 - (a3 - v14);
          char v19 = (v20 < 0) ^ v18;
          uint64_t v14 = &a1[v20];
          if (v19) {
            uint64_t v14 = v17;
          }
          unint64_t v15 = v16;
        }
        while (v14 != v11);
        *unint64_t v16 = v12;
      }
      while (v11 != a1);
    }
    return &a1[a3 - a2];
  }
  return a2;
}

void *sub_100021970(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_100009C44();
  }
  return operator new(8 * a2);
}

uint64_t sub_1000219A8(uint64_t result, uint64_t *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v10 = (uint64_t *)result;
LABEL_2:
  unint64_t v11 = v10;
LABEL_3:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    uint64_t v10 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = a2 - v11;
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          uint64_t v25 = *(a2 - 1);
          uint64_t v26 = *v11;
          int v27 = *(char *)(v25 + 6434);
          int v28 = *(char *)(*v11 + 6434);
          if (v27 < v28
            || v27 == v28 && *(unsigned __int16 *)(v25 + 6432) < *(unsigned __int16 *)(v26 + 6432))
          {
            *unint64_t v11 = v25;
            *(a2 - 1) = v26;
          }
          break;
        case 3uLL:
          BOOL result = sub_100021F40(v11, v11 + 1, a2 - 1);
          break;
        case 4uLL:
          BOOL result = sub_10002269C(v11, v11 + 1, v11 + 2, a2 - 1);
          break;
        case 5uLL:
          BOOL result = sub_100022788(v11, v11 + 1, v11 + 2, v11 + 3, a2 - 1);
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v14 <= 191) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        return (uint64_t)sub_1000228C0(v11, a2, a2, a3);
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    uint64_t v17 = &v11[v15 >> 1];
    if ((unint64_t)v14 >= 0x401)
    {
      sub_100021F40(v11, &v11[v15 >> 1], a2 - 1);
      sub_100021F40(v11 + 1, v17 - 1, a2 - 2);
      sub_100021F40(v11 + 2, &v11[v16 + 1], a2 - 3);
      sub_100021F40(v17 - 1, v17, &v11[v16 + 1]);
      uint64_t v18 = *v11;
      *unint64_t v11 = *v17;
      *uint64_t v17 = v18;
      if (a5) {
        goto LABEL_16;
      }
    }
    else
    {
      sub_100021F40(&v11[v15 >> 1], v11, a2 - 1);
      if (a5) {
        goto LABEL_16;
      }
    }
    uint64_t v19 = *(v11 - 1);
    int v20 = *(char *)(v19 + 6434);
    int v21 = *(char *)(*v11 + 6434);
    if (v20 >= v21
      && (v20 != v21 || *(unsigned __int16 *)(v19 + 6432) >= *(unsigned __int16 *)(*v11 + 6432)))
    {
      BOOL result = sub_100022088(v11, (unint64_t)a2);
      unint64_t v11 = (uint64_t *)result;
      goto LABEL_21;
    }
LABEL_16:
    uint64_t v22 = (uint64_t *)sub_100022280(v11, a2);
    if ((v23 & 1) == 0) {
      goto LABEL_19;
    }
    BOOL v24 = sub_100022480(v11, v22);
    unint64_t v11 = v22 + 1;
    BOOL result = sub_100022480(v22 + 1, a2);
    if (result)
    {
      a4 = -v13;
      a2 = v22;
      if (v24) {
        return result;
      }
      goto LABEL_2;
    }
    uint64_t v12 = v13 + 1;
    if (!v24)
    {
LABEL_19:
      BOOL result = sub_1000219A8(v10, v22, a3, -v13, a5 & 1);
      unint64_t v11 = v22 + 1;
LABEL_21:
      a5 = 0;
      a4 = -v13;
      goto LABEL_3;
    }
  }
  if (a5)
  {
    return (uint64_t)sub_100021D9C(v11, a2);
  }
  else
  {
    return (uint64_t)sub_100021E7C(v11, a2);
  }
}

void *sub_100021D9C(void *result, void *a2)
{
  if (result != a2)
  {
    unint64_t v2 = result + 1;
    if (result + 1 != a2)
    {
      uint64_t v3 = 0;
      unint64_t v4 = result;
      do
      {
        char v5 = v4;
        unint64_t v4 = v2;
        uint64_t v7 = *v5;
        uint64_t v6 = v5[1];
        int v8 = *(unsigned __int8 *)(v6 + 6434);
        if (*(char *)(v6 + 6434) < *(char *)(*v5 + 6434)
          || v8 == *(unsigned __int8 *)(*v5 + 6434)
          && *(unsigned __int16 *)(v6 + 6432) < *(unsigned __int16 *)(v7 + 6432))
        {
          v5[1] = v7;
          uint64_t v9 = result;
          if (v5 != result)
          {
            uint64_t v10 = v3;
            while (1)
            {
              uint64_t v11 = *(void *)((char *)result + v10 - 8);
              if (*(char *)(v11 + 6434) <= (char)v8)
              {
                if (v8 != *(unsigned __int8 *)(v11 + 6434))
                {
                  uint64_t v9 = v5;
                  goto LABEL_17;
                }
                if (*(unsigned __int16 *)(v6 + 6432) >= *(unsigned __int16 *)(v11 + 6432)) {
                  break;
                }
              }
              --v5;
              *(void *)((char *)result + v10) = v11;
              v10 -= 8;
              if (!v10)
              {
                uint64_t v9 = result;
                goto LABEL_17;
              }
            }
            uint64_t v9 = (void *)((char *)result + v10);
          }
LABEL_17:
          *uint64_t v9 = v6;
        }
        unint64_t v2 = v4 + 1;
        v3 += 8;
      }
      while (v4 + 1 != a2);
    }
  }
  return result;
}

uint64_t *sub_100021E7C(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    unint64_t v2 = result + 1;
    if (result + 1 != a2)
    {
      uint64_t v3 = 0;
      uint64_t v4 = 1;
      do
      {
        uint64_t v5 = v3;
        uint64_t v3 = v4;
        uint64_t v6 = *v2;
        uint64_t v7 = result[v5];
        int v8 = *(unsigned __int8 *)(*v2 + 6434);
        if (*(char *)(*v2 + 6434) < *(char *)(v7 + 6434)
          || v8 == *(unsigned __int8 *)(v7 + 6434)
          && *(unsigned __int16 *)(v6 + 6432) < *(unsigned __int16 *)(v7 + 6432))
        {
          *unint64_t v2 = v7;
          while (1)
          {
            uint64_t v9 = &result[v5];
            uint64_t v10 = *(v9 - 1);
            if (*(char *)(v10 + 6434) <= (char)v8
              && (v8 != *(unsigned __int8 *)(v10 + 6434)
               || *(unsigned __int16 *)(v6 + 6432) >= *(unsigned __int16 *)(v10 + 6432)))
            {
              break;
            }
            --v5;
            *uint64_t v9 = v10;
            if (v5 == -1)
            {
              __break(1u);
              return result;
            }
          }
          result[v5] = v6;
        }
        uint64_t v4 = v3 + 1;
        unint64_t v2 = &result[v3 + 1];
      }
      while (v2 != a2);
    }
  }
  return result;
}

uint64_t sub_100021F40(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a1;
  int v5 = *(unsigned __int8 *)(*a2 + 6434);
  int v6 = *(unsigned __int8 *)(*a1 + 6434);
  if (*(char *)(*a2 + 6434) < *(char *)(*a1 + 6434)
    || v5 == v6 && *(unsigned __int16 *)(v3 + 6432) < *(unsigned __int16 *)(v4 + 6432))
  {
    uint64_t v7 = *a3;
    if (*(char *)(*a3 + 6434) < (char)v5
      || *(unsigned __int8 *)(*a3 + 6434) == v5
      && *(unsigned __int16 *)(v7 + 6432) < *(unsigned __int16 *)(v3 + 6432))
    {
      *a1 = v7;
      *a3 = v4;
    }
    else
    {
      *a1 = v3;
      *a2 = v4;
      uint64_t v14 = *a3;
      if (*(char *)(*a3 + 6434) < (char)v6
        || *(unsigned __int8 *)(*a3 + 6434) == v6
        && *(unsigned __int16 *)(v14 + 6432) < *(unsigned __int16 *)(v4 + 6432))
      {
        *a2 = v14;
        *a3 = v4;
        return 2;
      }
    }
    return 1;
  }
  uint64_t v9 = *a3;
  if (*(char *)(*a3 + 6434) < (char)v5
    || *(unsigned __int8 *)(*a3 + 6434) == v5
    && *(unsigned __int16 *)(v9 + 6432) < *(unsigned __int16 *)(v3 + 6432))
  {
    *a2 = v9;
    *a3 = v3;
    uint64_t v10 = *a2;
    uint64_t v11 = *a1;
    int v12 = *(char *)(*a2 + 6434);
    int v13 = *(char *)(*a1 + 6434);
    if (v12 < v13 || v12 == v13 && *(unsigned __int16 *)(v10 + 6432) < *(unsigned __int16 *)(v11 + 6432))
    {
      *a1 = v10;
      *a2 = v11;
      return 2;
    }
    return 1;
  }
  return 0;
}

unint64_t sub_100022088(uint64_t *a1, unint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(a2 - 8);
  int v4 = *(unsigned __int8 *)(*a1 + 6434);
  unint64_t v5 = *(char *)(v3 + 6434);
  if (*(char *)(*a1 + 6434) < (int)v5
    || v4 == *(unsigned __int8 *)(v3 + 6434)
    && (unint64_t v5 = *(unsigned __int16 *)(v2 + 6432), v5 < *(unsigned __int16 *)(v3 + 6432)))
  {
    unint64_t i = (unint64_t)(a1 + 1);
    if (a1 + 1 == (uint64_t *)a2) {
      goto LABEL_24;
    }
    unint64_t v5 = 6434;
    while (*(char *)(*(void *)i + 6434) <= (char)v4
         && (v4 != *(unsigned __int8 *)(*(void *)i + 6434)
          || *(unsigned __int16 *)(v2 + 6432) >= *(unsigned __int16 *)(*(void *)i + 6432)))
    {
      i += 8;
      if (i == a2) {
        goto LABEL_24;
      }
    }
  }
  else
  {
    for (unint64_t i = (unint64_t)(a1 + 1); i < a2; i += 8)
    {
      if (*(char *)(*(void *)i + 6434) > (char)v4
        || v4 == *(unsigned __int8 *)(*(void *)i + 6434)
        && *(unsigned __int16 *)(v2 + 6432) < *(unsigned __int16 *)(*(void *)i + 6432))
      {
        break;
      }
    }
  }
  unint64_t v5 = a2;
  if (i >= a2) {
    goto LABEL_25;
  }
  if ((uint64_t *)a2 != a1)
  {
    unint64_t v5 = a2 - 8;
    do
    {
      if (*(char *)(*(void *)v5 + 6434) <= (char)v4
        && (v4 != *(unsigned __int8 *)(*(void *)v5 + 6434)
         || *(unsigned __int16 *)(v2 + 6432) >= *(unsigned __int16 *)(*(void *)v5 + 6432)))
      {
        goto LABEL_25;
      }
      BOOL v7 = v5 == (void)a1;
      v5 -= 8;
    }
    while (!v7);
  }
LABEL_24:
  while (1)
  {
    __break(1u);
LABEL_25:
    if (i >= v5) {
      break;
    }
    uint64_t v8 = *(void *)i;
    uint64_t v9 = *(void *)v5;
LABEL_27:
    *(void *)unint64_t i = v9;
    i += 8;
    *(void *)unint64_t v5 = v8;
    while (i != a2)
    {
      uint64_t v8 = *(void *)i;
      if (*(char *)(*(void *)i + 6434) > (char)v4
        || v4 == *(unsigned __int8 *)(*(void *)i + 6434)
        && *(unsigned __int16 *)(v2 + 6432) < *(unsigned __int16 *)(v8 + 6432))
      {
        if ((uint64_t *)v5 == a1) {
          goto LABEL_24;
        }
        v5 -= 8;
        while (1)
        {
          uint64_t v9 = *(void *)v5;
          if (*(char *)(*(void *)v5 + 6434) <= (char)v4
            && (v4 != *(unsigned __int8 *)(*(void *)v5 + 6434)
             || *(unsigned __int16 *)(v2 + 6432) >= *(unsigned __int16 *)(v9 + 6432)))
          {
            break;
          }
          BOOL v7 = v5 == (void)a1;
          v5 -= 8;
          if (v7) {
            goto LABEL_24;
          }
        }
        if (i < v5) {
          goto LABEL_27;
        }
        goto LABEL_42;
      }
      i += 8;
    }
  }
LABEL_42:
  if ((uint64_t *)(i - 8) != a1) {
    *a1 = *(void *)(i - 8);
  }
  *(void *)(i - 8) = v2;
  return i;
}

unint64_t sub_100022280(uint64_t *a1, uint64_t *a2)
{
  int v4 = a1 + 8;
  uint64_t v5 = *a1;
  if (a1 + 1 != a2)
  {
    unint64_t v2 = 6434;
    int v4 = *(unsigned __int8 *)(v5 + 6434);
    uint64_t v6 = 1;
    while (1)
    {
      uint64_t v3 = (uint64_t *)a1[v6];
      if (*((char *)v3 + 6434) >= (char)v4
        && (*((unsigned __int8 *)v3 + 6434) != v4
         || *((unsigned __int16 *)v3 + 3216) >= *(unsigned __int16 *)(v5 + 6432)))
      {
        break;
      }
      uint64_t v3 = &a1[++v6];
      if (&a1[v6] == a2) {
        goto LABEL_16;
      }
    }
    unint64_t v2 = (unint64_t)&a1[v6];
    if (v6 == 1) {
      goto LABEL_17;
    }
    if (a2 != a1)
    {
      BOOL v7 = a2 - 1;
      do
      {
        if (*(char *)(*v7 + 6434) < (char)v4
          || *(unsigned __int8 *)(*v7 + 6434) == v4
          && *(unsigned __int16 *)(*v7 + 6432) < *(unsigned __int16 *)(v5 + 6432))
        {
          goto LABEL_29;
        }
        BOOL v8 = v7-- == a1;
      }
      while (!v8);
    }
  }
LABEL_16:
  while (1)
  {
    __break(1u);
LABEL_17:
    BOOL v7 = a2;
    if (v2 < (unint64_t)a2)
    {
      BOOL v7 = a2 - 1;
      uint64_t v9 = *(a2 - 1);
      if (*(char *)(v9 + 6434) >= (char)v4)
      {
        int v10 = *(unsigned __int8 *)(v9 + 6434);
        do
        {
          if (v10 == v4)
          {
            if (*(unsigned __int16 *)(v9 + 6432) < *(unsigned __int16 *)(v5 + 6432)
              || v2 >= (unint64_t)v7)
            {
              break;
            }
          }
          else if (v2 >= (unint64_t)v7)
          {
            break;
          }
          uint64_t v12 = *--v7;
          uint64_t v9 = v12;
          int v10 = *(unsigned __int8 *)(v12 + 6434);
        }
        while (*(char *)(v12 + 6434) >= (char)v4);
      }
    }
LABEL_29:
    if (v2 >= (unint64_t)v7) {
      break;
    }
    uint64_t v13 = *v7;
    uint64_t v14 = v7;
    unint64_t v15 = v2;
LABEL_31:
    *(void *)unint64_t v15 = v13;
    v15 += 8;
    *uint64_t v14 = (uint64_t)v3;
    while ((uint64_t *)v15 != a2)
    {
      uint64_t v3 = *(uint64_t **)v15;
      if (*(char *)(*(void *)v15 + 6434) >= (char)v4
        && (*(unsigned __int8 *)(*(void *)v15 + 6434) != v4
         || *((unsigned __int16 *)v3 + 3216) >= *(unsigned __int16 *)(v5 + 6432)))
      {
        if (v14 == a1) {
          goto LABEL_16;
        }
        --v14;
        while (1)
        {
          uint64_t v13 = *v14;
          if (*(char *)(*v14 + 6434) < (char)v4
            || *(unsigned __int8 *)(*v14 + 6434) == v4
            && *(unsigned __int16 *)(v13 + 6432) < *(unsigned __int16 *)(v5 + 6432))
          {
            break;
          }
          BOOL v8 = v14-- == a1;
          if (v8) {
            goto LABEL_16;
          }
        }
        if (v15 < (unint64_t)v14) {
          goto LABEL_31;
        }
        goto LABEL_48;
      }
      v15 += 8;
    }
  }
  unint64_t v15 = v2;
LABEL_48:
  unint64_t v16 = (uint64_t *)(v15 - 8);
  if ((uint64_t *)(v15 - 8) != a1) {
    *a1 = *v16;
  }
  *unint64_t v16 = v5;
  return v15 - 8;
}

BOOL sub_100022480(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = a2 - a1;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v6 = *(a2 - 1);
      uint64_t v7 = *a1;
      int v8 = *(char *)(v6 + 6434);
      int v9 = *(char *)(*a1 + 6434);
      if (v8 < v9 || v8 == v9 && *(unsigned __int16 *)(v6 + 6432) < *(unsigned __int16 *)(v7 + 6432))
      {
        *a1 = v6;
        *(a2 - 1) = v7;
      }
      return result;
    case 3:
      sub_100021F40(a1, a1 + 1, a2 - 1);
      return 1;
    case 4:
      sub_10002269C(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5:
      sub_100022788(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      int v10 = a1 + 2;
      sub_100021F40(a1, a1 + 1, a1 + 2);
      uint64_t v11 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    uint64_t v14 = *v11;
    uint64_t v15 = *v10;
    int v16 = *(unsigned __int8 *)(*v11 + 6434);
    if (*(char *)(*v11 + 6434) < *(char *)(*v10 + 6434)
      || v16 == *(unsigned __int8 *)(*v10 + 6434)
      && *(unsigned __int16 *)(v14 + 6432) < *(unsigned __int16 *)(v15 + 6432))
    {
      *uint64_t v11 = v15;
      uint64_t v17 = a1;
      if (v10 != a1)
      {
        uint64_t v18 = v12;
        while (1)
        {
          uint64_t v19 = *(uint64_t *)((char *)a1 + v18 + 8);
          if (*(char *)(v19 + 6434) <= (char)v16)
          {
            if (v16 != *(unsigned __int8 *)(v19 + 6434))
            {
              uint64_t v17 = v10;
              goto LABEL_20;
            }
            if (*(unsigned __int16 *)(v14 + 6432) >= *(unsigned __int16 *)(v19 + 6432)) {
              break;
            }
          }
          --v10;
          *(uint64_t *)((char *)a1 + v18 + 16) = v19;
          v18 -= 8;
          if (v18 == -16)
          {
            uint64_t v17 = a1;
            goto LABEL_20;
          }
        }
        uint64_t v17 = (uint64_t *)((char *)a1 + v18 + 16);
      }
LABEL_20:
      *uint64_t v17 = v14;
      if (++v13 == 8) {
        return v11 + 1 == a2;
      }
    }
    int v10 = v11;
    v12 += 8;
    if (++v11 == a2) {
      return 1;
    }
  }
}

uint64_t sub_10002269C(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result = sub_100021F40(a1, a2, a3);
  uint64_t v9 = *a4;
  uint64_t v10 = *a3;
  int v11 = *(char *)(*a4 + 6434);
  int v12 = *(char *)(*a3 + 6434);
  if (v11 < v12 || v11 == v12 && *(unsigned __int16 *)(v9 + 6432) < *(unsigned __int16 *)(v10 + 6432))
  {
    *a3 = v9;
    *a4 = v10;
    uint64_t v13 = *a3;
    uint64_t v14 = *a2;
    int v15 = *(char *)(*a3 + 6434);
    int v16 = *(char *)(*a2 + 6434);
    if (v15 < v16 || v15 == v16 && *(unsigned __int16 *)(v13 + 6432) < *(unsigned __int16 *)(v14 + 6432))
    {
      *a2 = v13;
      *a3 = v14;
      uint64_t v17 = *a2;
      uint64_t v18 = *a1;
      int v19 = *(char *)(*a2 + 6434);
      int v20 = *(char *)(*a1 + 6434);
      if (v19 < v20
        || v19 == v20 && *(unsigned __int16 *)(v17 + 6432) < *(unsigned __int16 *)(v18 + 6432))
      {
        *a1 = v17;
        *a2 = v18;
      }
    }
  }
  return result;
}

uint64_t sub_100022788(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t result = sub_10002269C(a1, a2, a3, a4);
  uint64_t v11 = *a5;
  uint64_t v12 = *a4;
  int v13 = *(char *)(*a5 + 6434);
  int v14 = *(char *)(*a4 + 6434);
  if (v13 < v14 || v13 == v14 && *(unsigned __int16 *)(v11 + 6432) < *(unsigned __int16 *)(v12 + 6432))
  {
    *a4 = v11;
    *a5 = v12;
    uint64_t v15 = *a4;
    uint64_t v16 = *a3;
    int v17 = *(char *)(*a4 + 6434);
    int v18 = *(char *)(*a3 + 6434);
    if (v17 < v18 || v17 == v18 && *(unsigned __int16 *)(v15 + 6432) < *(unsigned __int16 *)(v16 + 6432))
    {
      *a3 = v15;
      *a4 = v16;
      uint64_t v19 = *a3;
      uint64_t v20 = *a2;
      int v21 = *(char *)(*a3 + 6434);
      int v22 = *(char *)(*a2 + 6434);
      if (v21 < v22
        || v21 == v22 && *(unsigned __int16 *)(v19 + 6432) < *(unsigned __int16 *)(v20 + 6432))
      {
        *a2 = v19;
        *a3 = v20;
        uint64_t v23 = *a2;
        uint64_t v24 = *a1;
        int v25 = *(char *)(*a2 + 6434);
        int v26 = *(char *)(*a1 + 6434);
        if (v25 < v26
          || v25 == v26 && *(unsigned __int16 *)(v23 + 6432) < *(unsigned __int16 *)(v24 + 6432))
        {
          *a1 = v23;
          *a2 = v24;
        }
      }
    }
  }
  return result;
}

uint64_t *sub_1000228C0(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      uint64_t v12 = &a1[v10];
      do
      {
        sub_100022A2C((uint64_t)a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    int v13 = a2;
    if (a2 != a3)
    {
      int v14 = a2;
      do
      {
        uint64_t v15 = *v14;
        uint64_t v16 = *a1;
        int v17 = *(char *)(*v14 + 6434);
        int v18 = *(char *)(*a1 + 6434);
        if (v17 < v18
          || v17 == v18 && *(unsigned __int16 *)(v15 + 6432) < *(unsigned __int16 *)(v16 + 6432))
        {
          *int v14 = v16;
          *a1 = v15;
          sub_100022A2C((uint64_t)a1, a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      int v13 = a3;
    }
    if (v8 >= 9)
    {
      uint64_t v19 = (unint64_t)v8 >> 3;
      uint64_t v20 = a2 - 1;
      do
      {
        uint64_t v21 = *a1;
        int v22 = sub_100022B88(a1, a4, v19);
        if (v20 == v22)
        {
          *int v22 = v21;
        }
        else
        {
          *int v22 = *v20;
          *uint64_t v20 = v21;
          sub_100022C18((uint64_t)a1, (uint64_t)(v22 + 1), a4, v22 + 1 - a1);
        }
        --v20;
      }
      while (v19-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t sub_100022A2C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 >= 2)
  {
    uint64_t v4 = (uint64_t)a4 - result;
    int64_t v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 3)
    {
      uint64_t v6 = v4 >> 2;
      uint64_t v7 = (v4 >> 2) + 1;
      uint64_t v8 = (void *)(result + 8 * v7);
      uint64_t v9 = v6 + 2;
      if (v9 < a3)
      {
        uint64_t v10 = v8[1];
        int v11 = *(char *)(*v8 + 6434);
        int v12 = *(char *)(v10 + 6434);
        if (v11 < v12
          || v11 == v12 && *(unsigned __int16 *)(*v8 + 6432) < *(unsigned __int16 *)(v10 + 6432))
        {
          ++v8;
          uint64_t v7 = v9;
        }
      }
      uint64_t v13 = *v8;
      uint64_t v14 = *a4;
      if (*(char *)(*v8 + 6434) >= *(char *)(*a4 + 6434))
      {
        int v15 = *(unsigned __int8 *)(*a4 + 6434);
        if (*(unsigned __int8 *)(*v8 + 6434) != v15
          || *(unsigned __int16 *)(v13 + 6432) >= *(unsigned __int16 *)(v14 + 6432))
        {
          *a4 = v13;
          if (v5 >= v7)
          {
            while (1)
            {
              uint64_t v17 = 2 * v7;
              uint64_t v7 = (2 * v7) | 1;
              uint64_t v16 = (void *)(result + 8 * v7);
              uint64_t v18 = v17 + 2;
              if (v18 < a3)
              {
                uint64_t v19 = v16[1];
                int v20 = *(char *)(*v16 + 6434);
                int v21 = *(char *)(v19 + 6434);
                if (v20 < v21
                  || v20 == v21
                  && *(unsigned __int16 *)(*v16 + 6432) < *(unsigned __int16 *)(v19 + 6432))
                {
                  ++v16;
                  uint64_t v7 = v18;
                }
              }
              uint64_t v22 = *v16;
              if (*(char *)(*v16 + 6434) < (char)v15
                || *(unsigned __int8 *)(*v16 + 6434) == v15
                && *(unsigned __int16 *)(v22 + 6432) < *(unsigned __int16 *)(v14 + 6432))
              {
                break;
              }
              *uint64_t v8 = v22;
              uint64_t v8 = v16;
              if (v5 < v7) {
                goto LABEL_22;
              }
            }
          }
          uint64_t v16 = v8;
LABEL_22:
          *uint64_t v16 = v14;
        }
      }
    }
  }
  return result;
}

void *sub_100022B88(void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a3 - 2;
  if (a3 < 2) {
    uint64_t v4 = a3 - 1;
  }
  uint64_t v5 = v4 >> 1;
  do
  {
    uint64_t v6 = result;
    result += v3 + 1;
    uint64_t v7 = 2 * v3;
    uint64_t v3 = (2 * v3) | 1;
    uint64_t v8 = v7 + 2;
    if (v8 < a3)
    {
      uint64_t v9 = result[1];
      int v10 = *(char *)(*result + 6434);
      int v11 = *(char *)(v9 + 6434);
      if (v10 < v11
        || v10 == v11 && *(unsigned __int16 *)(*result + 6432) < *(unsigned __int16 *)(v9 + 6432))
      {
        ++result;
        uint64_t v3 = v8;
      }
    }
    *uint64_t v6 = *result;
  }
  while (v3 <= v5);
  return result;
}

uint64_t sub_100022C18(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v5 = v4 >> 1;
    uint64_t v6 = (uint64_t *)(result + 8 * (v4 >> 1));
    uint64_t v7 = *v6;
    uint64_t v8 = *(void *)(a2 - 8);
    int v9 = *(unsigned __int8 *)(v8 + 6434);
    if (*(char *)(*v6 + 6434) < *(char *)(v8 + 6434)
      || *(unsigned __int8 *)(*v6 + 6434) == v9
      && *(unsigned __int16 *)(v7 + 6432) < *(unsigned __int16 *)(v8 + 6432))
    {
      *(void *)(a2 - 8) = v7;
      if (v4 >= 2)
      {
        while (1)
        {
          unint64_t v11 = v5 - 1;
          unint64_t v5 = (v5 - 1) >> 1;
          int v10 = (uint64_t *)(result + 8 * v5);
          uint64_t v12 = *v10;
          if (*(char *)(*v10 + 6434) >= (char)v9
            && (*(unsigned __int8 *)(*v10 + 6434) != v9
             || *(unsigned __int16 *)(v12 + 6432) >= *(unsigned __int16 *)(v8 + 6432)))
          {
            break;
          }
          *uint64_t v6 = v12;
          uint64_t v6 = (uint64_t *)(result + 8 * v5);
          if (v11 <= 1) {
            goto LABEL_11;
          }
        }
      }
      int v10 = v6;
LABEL_11:
      *int v10 = v8;
    }
  }
  return result;
}

void sub_100022CCC()
{
}

void sub_100022CE4(const char *a1)
{
  exceptioint n = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100022D40(exception, a1);
}

void sub_100022D2C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100022D40(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

uint64_t sub_100022D74(uint64_t result, uint64_t *a2, uint64_t a3, uint64_t a4, char a5)
{
  int v10 = (uint64_t *)result;
LABEL_2:
  unint64_t v11 = v10;
LABEL_3:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    int v10 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = a2 - v11;
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          uint64_t v24 = *(a2 - 1);
          uint64_t v25 = *v11;
          int v26 = *(char *)(v24 + 10370);
          int v27 = *(char *)(*v11 + 10370);
          if (v26 < v27
            || v26 == v27 && *(unsigned __int16 *)(v24 + 10368) < *(unsigned __int16 *)(*v11 + 10368))
          {
            *unint64_t v11 = v24;
            *(a2 - 1) = v25;
          }
          break;
        case 3uLL:
          uint64_t result = sub_100023334(v11, v11 + 1, a2 - 1);
          break;
        case 4uLL:
          uint64_t result = sub_100023AF8(v11, v11 + 1, v11 + 2, a2 - 1);
          break;
        case 5uLL:
          uint64_t result = sub_100023BFC(v11, v11 + 1, v11 + 2, v11 + 3, a2 - 1);
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v14 <= 191) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        return (uint64_t)sub_100023D54(v11, a2, a2, a3);
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    uint64_t v17 = &v11[v15 >> 1];
    if ((unint64_t)v14 >= 0x401)
    {
      sub_100023334(v11, &v11[v15 >> 1], a2 - 1);
      sub_100023334(v11 + 1, v17 - 1, a2 - 2);
      sub_100023334(v11 + 2, &v11[v16 + 1], a2 - 3);
      sub_100023334(v17 - 1, v17, &v11[v16 + 1]);
      uint64_t v18 = *v11;
      *unint64_t v11 = *v17;
      *uint64_t v17 = v18;
      if (a5) {
        goto LABEL_16;
      }
    }
    else
    {
      sub_100023334(&v11[v15 >> 1], v11, a2 - 1);
      if (a5) {
        goto LABEL_16;
      }
    }
    int v19 = *(char *)(*(v11 - 1) + 10370);
    int v20 = *(char *)(*v11 + 10370);
    if (v19 >= v20
      && (v19 != v20 || *(unsigned __int16 *)(*(v11 - 1) + 10368) >= *(unsigned __int16 *)(*v11 + 10368)))
    {
      uint64_t result = sub_100023498(v11, (unint64_t)a2);
      unint64_t v11 = (uint64_t *)result;
      goto LABEL_21;
    }
LABEL_16:
    int v21 = (uint64_t *)sub_1000236AC(v11, a2);
    if ((v22 & 1) == 0) {
      goto LABEL_19;
    }
    BOOL v23 = sub_1000238C8(v11, v21);
    unint64_t v11 = v21 + 1;
    uint64_t result = sub_1000238C8(v21 + 1, a2);
    if (result)
    {
      a4 = -v13;
      a2 = v21;
      if (v23) {
        return result;
      }
      goto LABEL_2;
    }
    uint64_t v12 = v13 + 1;
    if (!v23)
    {
LABEL_19:
      uint64_t result = sub_100022D74(v10, v21, a3, -v13, a5 & 1);
      unint64_t v11 = v21 + 1;
LABEL_21:
      a5 = 0;
      a4 = -v13;
      goto LABEL_3;
    }
  }
  if (a5)
  {
    return (uint64_t)sub_100023178(v11, a2);
  }
  else
  {
    return (uint64_t)sub_100023264(v11, a2);
  }
}

void *sub_100023178(void *result, void *a2)
{
  if (result != a2)
  {
    unint64_t v2 = result + 1;
    if (result + 1 != a2)
    {
      uint64_t v3 = 0;
      unint64_t v4 = result;
      do
      {
        char v5 = v4;
        unint64_t v4 = v2;
        uint64_t v6 = v5[1];
        uint64_t v7 = (unsigned __int16 *)(v6 + 10368);
        int v8 = *(unsigned __int8 *)(v6 + 10370);
        if (*(char *)(v6 + 10370) < *(char *)(*v5 + 10370)
          || v8 == *(unsigned __int8 *)(*v5 + 10370) && *v7 < *(unsigned __int16 *)(*v5 + 10368))
        {
          v5[1] = *v5;
          int v9 = result;
          if (v5 != result)
          {
            uint64_t v10 = v3;
            while (1)
            {
              uint64_t v11 = *(void *)((char *)result + v10 - 8);
              if (*(char *)(v11 + 10370) <= (char)v8)
              {
                if (v8 != *(unsigned __int8 *)(v11 + 10370))
                {
                  int v9 = v5;
                  goto LABEL_17;
                }
                if (*v7 >= *(unsigned __int16 *)(v11 + 10368)) {
                  break;
                }
              }
              --v5;
              *(void *)((char *)result + v10) = v11;
              v10 -= 8;
              if (!v10)
              {
                int v9 = result;
                goto LABEL_17;
              }
            }
            int v9 = (void *)((char *)result + v10);
          }
LABEL_17:
          *int v9 = v6;
        }
        unint64_t v2 = v4 + 1;
        v3 += 8;
      }
      while (v4 + 1 != a2);
    }
  }
  return result;
}

uint64_t *sub_100023264(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    unint64_t v2 = result + 1;
    if (result + 1 != a2)
    {
      uint64_t v3 = 0;
      uint64_t v4 = 1;
      do
      {
        uint64_t v5 = v3;
        uint64_t v3 = v4;
        uint64_t v6 = *v2;
        uint64_t v7 = result[v5];
        int v8 = (unsigned __int16 *)(*v2 + 10368);
        int v9 = *(unsigned __int8 *)(*v2 + 10370);
        if (*(char *)(*v2 + 10370) < *(char *)(v7 + 10370)
          || v9 == *(unsigned __int8 *)(v7 + 10370) && *v8 < *(unsigned __int16 *)(v7 + 10368))
        {
          *unint64_t v2 = v7;
          while (1)
          {
            uint64_t v10 = &result[v5];
            uint64_t v11 = *(v10 - 1);
            if (*(char *)(v11 + 10370) <= (char)v9
              && (v9 != *(unsigned __int8 *)(v11 + 10370) || *v8 >= *(unsigned __int16 *)(v11 + 10368)))
            {
              break;
            }
            --v5;
            *uint64_t v10 = v11;
            if (v5 == -1)
            {
              __break(1u);
              return result;
            }
          }
          result[v5] = v6;
        }
        uint64_t v4 = v3 + 1;
        unint64_t v2 = &result[v3 + 1];
      }
      while (v2 != a2);
    }
  }
  return result;
}

uint64_t sub_100023334(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = (unsigned __int16 *)(*a2 + 10368);
  uint64_t v5 = *a1;
  uint64_t v6 = (unsigned __int16 *)(*a1 + 10368);
  int v7 = *(unsigned __int8 *)(*a2 + 10370);
  int v8 = *(unsigned __int8 *)(*a1 + 10370);
  if (*(char *)(*a2 + 10370) < *(char *)(*a1 + 10370) || v7 == v8 && *v4 < *v6)
  {
    if (*(char *)(*a3 + 10370) < (char)v7
      || *(unsigned __int8 *)(*a3 + 10370) == v7 && *(unsigned __int16 *)(*a3 + 10368) < *v4)
    {
      *a1 = *a3;
      *a3 = v5;
    }
    else
    {
      *a1 = v3;
      *a2 = v5;
      if (*(char *)(*a3 + 10370) < (char)v8
        || *(unsigned __int8 *)(*a3 + 10370) == v8 && *(unsigned __int16 *)(*a3 + 10368) < *v6)
      {
        *a2 = *a3;
        *a3 = v5;
        return 2;
      }
    }
    return 1;
  }
  if (*(char *)(*a3 + 10370) < (char)v7
    || *(unsigned __int8 *)(*a3 + 10370) == v7 && *(unsigned __int16 *)(*a3 + 10368) < *v4)
  {
    *a2 = *a3;
    *a3 = v3;
    uint64_t v10 = *a1;
    int v11 = *(char *)(*a2 + 10370);
    int v12 = *(char *)(*a1 + 10370);
    if (v11 < v12
      || v11 == v12 && *(unsigned __int16 *)(*a2 + 10368) < *(unsigned __int16 *)(*a1 + 10368))
    {
      *a1 = *a2;
      *a2 = v10;
      return 2;
    }
    return 1;
  }
  return 0;
}

unint64_t sub_100023498(uint64_t *a1, unint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (unsigned __int16 *)(*a1 + 10368);
  int v4 = *(unsigned __int8 *)(*a1 + 10370);
  unint64_t v5 = *(char *)(*(void *)(a2 - 8) + 10370);
  if (*(char *)(*a1 + 10370) < (int)v5
    || v4 == *(unsigned __int8 *)(*(void *)(a2 - 8) + 10370)
    && (unint64_t v5 = *v3, v5 < *(unsigned __int16 *)(*(void *)(a2 - 8) + 10368)))
  {
    unint64_t i = (unint64_t)(a1 + 1);
    if (a1 + 1 == (uint64_t *)a2) {
      goto LABEL_24;
    }
    unint64_t v5 = 10368;
    while (*(char *)(*(void *)i + 10370) <= (char)v4
         && (v4 != *(unsigned __int8 *)(*(void *)i + 10370)
          || *v3 >= *(unsigned __int16 *)(*(void *)i + 10368)))
    {
      i += 8;
      if (i == a2) {
        goto LABEL_24;
      }
    }
  }
  else
  {
    for (unint64_t i = (unint64_t)(a1 + 1); i < a2; i += 8)
    {
      if (*(char *)(*(void *)i + 10370) > (char)v4
        || v4 == *(unsigned __int8 *)(*(void *)i + 10370)
        && *v3 < *(unsigned __int16 *)(*(void *)i + 10368))
      {
        break;
      }
    }
  }
  unint64_t v5 = a2;
  if (i >= a2) {
    goto LABEL_25;
  }
  if ((uint64_t *)a2 != a1)
  {
    unint64_t v5 = a2 - 8;
    do
    {
      if (*(char *)(*(void *)v5 + 10370) <= (char)v4
        && (v4 != *(unsigned __int8 *)(*(void *)v5 + 10370)
         || *v3 >= *(unsigned __int16 *)(*(void *)v5 + 10368)))
      {
        goto LABEL_25;
      }
      BOOL v7 = v5 == (void)a1;
      v5 -= 8;
    }
    while (!v7);
  }
LABEL_24:
  while (1)
  {
    __break(1u);
LABEL_25:
    if (i >= v5) {
      break;
    }
    uint64_t v8 = *(void *)i;
    uint64_t v9 = *(void *)v5;
LABEL_27:
    *(void *)unint64_t i = v9;
    i += 8;
    *(void *)unint64_t v5 = v8;
    while (i != a2)
    {
      uint64_t v8 = *(void *)i;
      if (*(char *)(*(void *)i + 10370) > (char)v4
        || v4 == *(unsigned __int8 *)(*(void *)i + 10370)
        && *v3 < *(unsigned __int16 *)(*(void *)i + 10368))
      {
        if ((uint64_t *)v5 == a1) {
          goto LABEL_24;
        }
        v5 -= 8;
        while (1)
        {
          uint64_t v9 = *(void *)v5;
          if (*(char *)(*(void *)v5 + 10370) <= (char)v4
            && (v4 != *(unsigned __int8 *)(*(void *)v5 + 10370)
             || *v3 >= *(unsigned __int16 *)(*(void *)v5 + 10368)))
          {
            break;
          }
          BOOL v7 = v5 == (void)a1;
          v5 -= 8;
          if (v7) {
            goto LABEL_24;
          }
        }
        if (i < v5) {
          goto LABEL_27;
        }
        goto LABEL_42;
      }
      i += 8;
    }
  }
LABEL_42:
  if ((uint64_t *)(i - 8) != a1) {
    *a1 = *(void *)(i - 8);
  }
  *(void *)(i - 8) = v2;
  return i;
}

unint64_t sub_1000236AC(void *a1, void *a2)
{
  unint64_t v5 = (unsigned __int16 *)(a1 + 1);
  uint64_t v6 = *a1;
  if (a1 + 1 != a2)
  {
    unint64_t v5 = (unsigned __int16 *)(v6 + 10368);
    int v2 = *(unsigned __int8 *)(v6 + 10370);
    uint64_t v7 = 1;
    unint64_t v3 = 10368;
    while (1)
    {
      int v4 = (void *)a1[v7];
      if (*((char *)v4 + 10370) >= (char)v2
        && (*((unsigned __int8 *)v4 + 10370) != v2 || *((unsigned __int16 *)v4 + 5184) >= *v5))
      {
        break;
      }
      int v4 = &a1[++v7];
      if (&a1[v7] == a2) {
        goto LABEL_16;
      }
    }
    unint64_t v3 = (unint64_t)&a1[v7];
    if (v7 == 1) {
      goto LABEL_17;
    }
    if (a2 != a1)
    {
      uint64_t v8 = a2 - 1;
      do
      {
        if (*(char *)(*v8 + 10370) < (char)v2
          || *(unsigned __int8 *)(*v8 + 10370) == v2 && *(unsigned __int16 *)(*v8 + 10368) < *v5)
        {
          goto LABEL_29;
        }
        BOOL v9 = v8-- == a1;
      }
      while (!v9);
    }
  }
LABEL_16:
  while (1)
  {
    __break(1u);
LABEL_17:
    uint64_t v8 = a2;
    if (v3 < (unint64_t)a2)
    {
      uint64_t v8 = a2 - 1;
      uint64_t v10 = *(a2 - 1);
      if (*(char *)(v10 + 10370) >= (char)v2)
      {
        int v11 = *(unsigned __int8 *)(v10 + 10370);
        do
        {
          if (v11 == v2)
          {
            if (*(unsigned __int16 *)(v10 + 10368) < *v5 || v3 >= (unint64_t)v8) {
              break;
            }
          }
          else if (v3 >= (unint64_t)v8)
          {
            break;
          }
          uint64_t v13 = *--v8;
          uint64_t v10 = v13;
          int v11 = *(unsigned __int8 *)(v13 + 10370);
        }
        while (*(char *)(v13 + 10370) >= (char)v2);
      }
    }
LABEL_29:
    if (v3 >= (unint64_t)v8) {
      break;
    }
    uint64_t v14 = *v8;
    unint64_t v15 = v8;
    unint64_t v16 = v3;
LABEL_31:
    *(void *)unint64_t v16 = v14;
    v16 += 8;
    *unint64_t v15 = v4;
    while ((void *)v16 != a2)
    {
      int v4 = *(void **)v16;
      if (*(char *)(*(void *)v16 + 10370) >= (char)v2
        && (*(unsigned __int8 *)(*(void *)v16 + 10370) != v2
         || *(unsigned __int16 *)(*(void *)v16 + 10368) >= *v5))
      {
        if (v15 == a1) {
          goto LABEL_16;
        }
        --v15;
        while (1)
        {
          uint64_t v14 = *v15;
          if (*(char *)(*v15 + 10370) < (char)v2
            || *(unsigned __int8 *)(*v15 + 10370) == v2 && *(unsigned __int16 *)(*v15 + 10368) < *v5)
          {
            break;
          }
          BOOL v9 = v15-- == a1;
          if (v9) {
            goto LABEL_16;
          }
        }
        if (v16 < (unint64_t)v15) {
          goto LABEL_31;
        }
        goto LABEL_48;
      }
      v16 += 8;
    }
  }
  unint64_t v16 = v3;
LABEL_48:
  uint64_t v17 = (void *)(v16 - 8);
  if ((void *)(v16 - 8) != a1) {
    *a1 = *v17;
  }
  *uint64_t v17 = v6;
  return v16 - 8;
}

BOOL sub_1000238C8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = a2 - a1;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v6 = *(a2 - 1);
      uint64_t v7 = *a1;
      int v8 = *(char *)(v6 + 10370);
      int v9 = *(char *)(*a1 + 10370);
      if (v8 < v9 || v8 == v9 && *(unsigned __int16 *)(v6 + 10368) < *(unsigned __int16 *)(*a1 + 10368))
      {
        *a1 = v6;
        *(a2 - 1) = v7;
      }
      return result;
    case 3:
      sub_100023334(a1, a1 + 1, a2 - 1);
      return 1;
    case 4:
      sub_100023AF8(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5:
      sub_100023BFC(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      uint64_t v10 = a1 + 2;
      sub_100023334(a1, a1 + 1, a1 + 2);
      int v11 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    uint64_t v14 = *v11;
    unint64_t v15 = (unsigned __int16 *)(*v11 + 10368);
    int v16 = *(unsigned __int8 *)(*v11 + 10370);
    if (*(char *)(*v11 + 10370) < *(char *)(*v10 + 10370)
      || v16 == *(unsigned __int8 *)(*v10 + 10370) && *v15 < *(unsigned __int16 *)(*v10 + 10368))
    {
      *int v11 = *v10;
      uint64_t v17 = a1;
      if (v10 != a1)
      {
        uint64_t v18 = v12;
        while (1)
        {
          uint64_t v19 = *(uint64_t *)((char *)a1 + v18 + 8);
          if (*(char *)(v19 + 10370) <= (char)v16)
          {
            if (v16 != *(unsigned __int8 *)(v19 + 10370))
            {
              uint64_t v17 = v10;
              goto LABEL_20;
            }
            if (*v15 >= *(unsigned __int16 *)(v19 + 10368)) {
              break;
            }
          }
          --v10;
          *(uint64_t *)((char *)a1 + v18 + 16) = v19;
          v18 -= 8;
          if (v18 == -16)
          {
            uint64_t v17 = a1;
            goto LABEL_20;
          }
        }
        uint64_t v17 = (uint64_t *)((char *)a1 + v18 + 16);
      }
LABEL_20:
      *uint64_t v17 = v14;
      if (++v13 == 8) {
        return v11 + 1 == a2;
      }
    }
    uint64_t v10 = v11;
    v12 += 8;
    if (++v11 == a2) {
      return 1;
    }
  }
}

uint64_t sub_100023AF8(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result = sub_100023334(a1, a2, a3);
  uint64_t v9 = *a3;
  int v10 = *(char *)(*a4 + 10370);
  int v11 = *(char *)(*a3 + 10370);
  if (v10 < v11 || v10 == v11 && *(unsigned __int16 *)(*a4 + 10368) < *(unsigned __int16 *)(*a3 + 10368))
  {
    *a3 = *a4;
    *a4 = v9;
    uint64_t v12 = *a2;
    int v13 = *(char *)(*a3 + 10370);
    int v14 = *(char *)(*a2 + 10370);
    if (v13 < v14
      || v13 == v14 && *(unsigned __int16 *)(*a3 + 10368) < *(unsigned __int16 *)(*a2 + 10368))
    {
      *a2 = *a3;
      *a3 = v12;
      uint64_t v15 = *a1;
      int v16 = *(char *)(*a2 + 10370);
      int v17 = *(char *)(*a1 + 10370);
      if (v16 < v17
        || v16 == v17 && *(unsigned __int16 *)(*a2 + 10368) < *(unsigned __int16 *)(*a1 + 10368))
      {
        *a1 = *a2;
        *a2 = v15;
      }
    }
  }
  return result;
}

uint64_t sub_100023BFC(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t result = sub_100023AF8(a1, a2, a3, a4);
  uint64_t v11 = *a4;
  int v12 = *(char *)(*a5 + 10370);
  int v13 = *(char *)(*a4 + 10370);
  if (v12 < v13 || v12 == v13 && *(unsigned __int16 *)(*a5 + 10368) < *(unsigned __int16 *)(*a4 + 10368))
  {
    *a4 = *a5;
    *a5 = v11;
    uint64_t v14 = *a3;
    int v15 = *(char *)(*a4 + 10370);
    int v16 = *(char *)(*a3 + 10370);
    if (v15 < v16
      || v15 == v16 && *(unsigned __int16 *)(*a4 + 10368) < *(unsigned __int16 *)(*a3 + 10368))
    {
      *a3 = *a4;
      *a4 = v14;
      uint64_t v17 = *a2;
      int v18 = *(char *)(*a3 + 10370);
      int v19 = *(char *)(*a2 + 10370);
      if (v18 < v19
        || v18 == v19 && *(unsigned __int16 *)(*a3 + 10368) < *(unsigned __int16 *)(*a2 + 10368))
      {
        *a2 = *a3;
        *a3 = v17;
        uint64_t v20 = *a1;
        int v21 = *(char *)(*a2 + 10370);
        int v22 = *(char *)(*a1 + 10370);
        if (v21 < v22
          || v21 == v22 && *(unsigned __int16 *)(*a2 + 10368) < *(unsigned __int16 *)(*a1 + 10368))
        {
          *a1 = *a2;
          *a2 = v20;
        }
      }
    }
  }
  return result;
}

uint64_t *sub_100023D54(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      int v12 = &a1[v10];
      do
      {
        sub_100023EC8((uint64_t)a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    int v13 = a2;
    if (a2 != a3)
    {
      uint64_t v14 = a2;
      do
      {
        uint64_t v15 = *v14;
        int v16 = *(char *)(*v14 + 10370);
        int v17 = *(char *)(*a1 + 10370);
        if (v16 < v17
          || v16 == v17 && *(unsigned __int16 *)(*v14 + 10368) < *(unsigned __int16 *)(*a1 + 10368))
        {
          *uint64_t v14 = *a1;
          *a1 = v15;
          sub_100023EC8((uint64_t)a1, a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      int v13 = a3;
    }
    if (v8 >= 9)
    {
      uint64_t v18 = (unint64_t)v8 >> 3;
      int v19 = a2 - 1;
      do
      {
        uint64_t v20 = *a1;
        int v21 = sub_100024040(a1, a4, v18);
        if (v19 == v21)
        {
          *int v21 = v20;
        }
        else
        {
          *int v21 = *v19;
          *int v19 = v20;
          sub_1000240D8((uint64_t)a1, (uint64_t)(v21 + 1), a4, v21 + 1 - a1);
        }
        --v19;
      }
      while (v18-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t sub_100023EC8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 >= 2)
  {
    uint64_t v4 = (uint64_t)a4 - result;
    int64_t v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 3)
    {
      uint64_t v6 = v4 >> 2;
      uint64_t v7 = (v4 >> 2) + 1;
      uint64_t v8 = (void *)(result + 8 * v7);
      uint64_t v9 = v6 + 2;
      if (v9 < a3)
      {
        int v10 = *(char *)(*v8 + 10370);
        int v11 = *(char *)(v8[1] + 10370);
        if (v10 < v11
          || v10 == v11 && *(unsigned __int16 *)(*v8 + 10368) < *(unsigned __int16 *)(v8[1] + 10368))
        {
          ++v8;
          uint64_t v7 = v9;
        }
      }
      uint64_t v12 = *a4;
      int v13 = (unsigned __int16 *)(*a4 + 10368);
      if (*(char *)(*v8 + 10370) >= *(char *)(*a4 + 10370))
      {
        int v14 = *(unsigned __int8 *)(*a4 + 10370);
        if (*(unsigned __int8 *)(*v8 + 10370) != v14 || *(unsigned __int16 *)(*v8 + 10368) >= *v13)
        {
          *a4 = *v8;
          if (v5 >= v7)
          {
            while (1)
            {
              uint64_t v16 = 2 * v7;
              uint64_t v7 = (2 * v7) | 1;
              uint64_t v15 = (void *)(result + 8 * v7);
              uint64_t v17 = v16 + 2;
              if (v17 < a3)
              {
                int v18 = *(char *)(*v15 + 10370);
                int v19 = *(char *)(v15[1] + 10370);
                if (v18 < v19
                  || v18 == v19
                  && *(unsigned __int16 *)(*v15 + 10368) < *(unsigned __int16 *)(v15[1] + 10368))
                {
                  ++v15;
                  uint64_t v7 = v17;
                }
              }
              if (*(char *)(*v15 + 10370) < (char)v14
                || *(unsigned __int8 *)(*v15 + 10370) == v14
                && *(unsigned __int16 *)(*v15 + 10368) < *v13)
              {
                break;
              }
              *uint64_t v8 = *v15;
              uint64_t v8 = v15;
              if (v5 < v7) {
                goto LABEL_22;
              }
            }
          }
          uint64_t v15 = v8;
LABEL_22:
          *uint64_t v15 = v12;
        }
      }
    }
  }
  return result;
}

void *sub_100024040(void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a3 - 2;
  if (a3 < 2) {
    uint64_t v4 = a3 - 1;
  }
  uint64_t v5 = v4 >> 1;
  do
  {
    uint64_t v6 = result;
    result += v3 + 1;
    uint64_t v7 = 2 * v3;
    uint64_t v3 = (2 * v3) | 1;
    uint64_t v8 = v7 + 2;
    if (v8 < a3)
    {
      int v9 = *(char *)(*result + 10370);
      int v10 = *(char *)(result[1] + 10370);
      if (v9 < v10
        || v9 == v10
        && *(unsigned __int16 *)(*result + 10368) < *(unsigned __int16 *)(result[1] + 10368))
      {
        ++result;
        uint64_t v3 = v8;
      }
    }
    *uint64_t v6 = *result;
  }
  while (v3 <= v5);
  return result;
}

uint64_t sub_1000240D8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v5 = v4 >> 1;
    uint64_t v6 = result + 8 * (v4 >> 1);
    uint64_t v7 = *(void *)(a2 - 8);
    uint64_t v8 = (unsigned __int16 *)(v7 + 10368);
    int v9 = *(unsigned __int8 *)(v7 + 10370);
    if (*(char *)(*(void *)v6 + 10370) < *(char *)(v7 + 10370)
      || *(unsigned __int8 *)(*(void *)v6 + 10370) == v9
      && *(unsigned __int16 *)(*(void *)v6 + 10368) < *v8)
    {
      *(void *)(a2 - 8) = *(void *)v6;
      if (v4 >= 2)
      {
        while (1)
        {
          unint64_t v11 = v5 - 1;
          unint64_t v5 = (v5 - 1) >> 1;
          uint64_t v10 = result + 8 * v5;
          if (*(char *)(*(void *)v10 + 10370) >= (char)v9
            && (*(unsigned __int8 *)(*(void *)v10 + 10370) != v9
             || *(unsigned __int16 *)(*(void *)v10 + 10368) >= *v8))
          {
            break;
          }
          *(void *)uint64_t v6 = *(void *)v10;
          uint64_t v6 = result + 8 * v5;
          if (v11 <= 1) {
            goto LABEL_11;
          }
        }
      }
      uint64_t v10 = v6;
LABEL_11:
      *(void *)uint64_t v10 = v7;
    }
  }
  return result;
}

uint64_t sub_100024198(uint64_t result, uint64_t *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v10 = (uint64_t *)result;
LABEL_2:
  unint64_t v11 = v10;
LABEL_3:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    uint64_t v10 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = a2 - v11;
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          uint64_t v25 = *(a2 - 1);
          uint64_t v26 = *v11;
          int v27 = *(char *)(v25 + 578);
          int v28 = *(char *)(*v11 + 578);
          if (v27 < v28
            || v27 == v28 && *(unsigned __int16 *)(v25 + 576) < *(unsigned __int16 *)(v26 + 576))
          {
            *unint64_t v11 = v25;
            *(a2 - 1) = v26;
          }
          break;
        case 3uLL:
          uint64_t result = sub_100024720(v11, v11 + 1, a2 - 1);
          break;
        case 4uLL:
          uint64_t result = sub_100024E2C(v11, v11 + 1, v11 + 2, a2 - 1);
          break;
        case 5uLL:
          uint64_t result = sub_100024F0C(v11, v11 + 1, v11 + 2, v11 + 3, a2 - 1);
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v14 <= 191) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        return (uint64_t)sub_100025034(v11, a2, a2, a3);
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    uint64_t v17 = &v11[v15 >> 1];
    if ((unint64_t)v14 >= 0x401)
    {
      sub_100024720(v11, &v11[v15 >> 1], a2 - 1);
      sub_100024720(v11 + 1, v17 - 1, a2 - 2);
      sub_100024720(v11 + 2, &v11[v16 + 1], a2 - 3);
      sub_100024720(v17 - 1, v17, &v11[v16 + 1]);
      uint64_t v18 = *v11;
      *unint64_t v11 = *v17;
      *uint64_t v17 = v18;
      if (a5) {
        goto LABEL_16;
      }
    }
    else
    {
      sub_100024720(&v11[v15 >> 1], v11, a2 - 1);
      if (a5) {
        goto LABEL_16;
      }
    }
    uint64_t v19 = *(v11 - 1);
    int v20 = *(char *)(v19 + 578);
    int v21 = *(char *)(*v11 + 578);
    if (v20 >= v21
      && (v20 != v21 || *(unsigned __int16 *)(v19 + 576) >= *(unsigned __int16 *)(*v11 + 576)))
    {
      uint64_t result = sub_100024854((unsigned __int16 *)v11, (unsigned __int16 *)a2);
      unint64_t v11 = (uint64_t *)result;
      goto LABEL_21;
    }
LABEL_16:
    int v22 = sub_100024A2C(v11, a2);
    if ((v23 & 1) == 0) {
      goto LABEL_19;
    }
    BOOL v24 = sub_100024C18(v11, v22);
    unint64_t v11 = v22 + 1;
    uint64_t result = sub_100024C18(v22 + 1, a2);
    if (result)
    {
      a4 = -v13;
      a2 = v22;
      if (v24) {
        return result;
      }
      goto LABEL_2;
    }
    uint64_t v12 = v13 + 1;
    if (!v24)
    {
LABEL_19:
      uint64_t result = sub_100024198(v10, v22, a3, -v13, a5 & 1);
      unint64_t v11 = v22 + 1;
LABEL_21:
      a5 = 0;
      a4 = -v13;
      goto LABEL_3;
    }
  }
  if (a5)
  {
    return (uint64_t)sub_100024584(v11, a2);
  }
  else
  {
    return (uint64_t)sub_100024660(v11, a2);
  }
}

void *sub_100024584(void *result, void *a2)
{
  if (result != a2)
  {
    int v2 = result + 1;
    if (result + 1 != a2)
    {
      uint64_t v3 = 0;
      unint64_t v4 = result;
      do
      {
        char v5 = v4;
        unint64_t v4 = v2;
        uint64_t v7 = *v5;
        uint64_t v6 = v5[1];
        int v8 = *(unsigned __int8 *)(v6 + 578);
        if (*(char *)(v6 + 578) < *(char *)(*v5 + 578)
          || v8 == *(unsigned __int8 *)(*v5 + 578)
          && *(unsigned __int16 *)(v6 + 576) < *(unsigned __int16 *)(v7 + 576))
        {
          v5[1] = v7;
          int v9 = result;
          if (v5 != result)
          {
            uint64_t v10 = v3;
            while (1)
            {
              uint64_t v11 = *(void *)((char *)result + v10 - 8);
              if (*(char *)(v11 + 578) <= (char)v8)
              {
                if (v8 != *(unsigned __int8 *)(v11 + 578))
                {
                  int v9 = v5;
                  goto LABEL_17;
                }
                if (*(unsigned __int16 *)(v6 + 576) >= *(unsigned __int16 *)(v11 + 576)) {
                  break;
                }
              }
              --v5;
              *(void *)((char *)result + v10) = v11;
              v10 -= 8;
              if (!v10)
              {
                int v9 = result;
                goto LABEL_17;
              }
            }
            int v9 = (void *)((char *)result + v10);
          }
LABEL_17:
          *int v9 = v6;
        }
        int v2 = v4 + 1;
        v3 += 8;
      }
      while (v4 + 1 != a2);
    }
  }
  return result;
}

uint64_t *sub_100024660(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    int v2 = result + 1;
    if (result + 1 != a2)
    {
      uint64_t v3 = 0;
      uint64_t v4 = 1;
      do
      {
        uint64_t v5 = v3;
        uint64_t v3 = v4;
        uint64_t v6 = *v2;
        uint64_t v7 = result[v5];
        int v8 = *(unsigned __int8 *)(*v2 + 578);
        if (*(char *)(*v2 + 578) < *(char *)(v7 + 578)
          || v8 == *(unsigned __int8 *)(v7 + 578)
          && *(unsigned __int16 *)(v6 + 576) < *(unsigned __int16 *)(v7 + 576))
        {
          *int v2 = v7;
          while (1)
          {
            int v9 = &result[v5];
            uint64_t v10 = *(v9 - 1);
            if (*(char *)(v10 + 578) <= (char)v8
              && (v8 != *(unsigned __int8 *)(v10 + 578)
               || *(unsigned __int16 *)(v6 + 576) >= *(unsigned __int16 *)(v10 + 576)))
            {
              break;
            }
            --v5;
            *int v9 = v10;
            if (v5 == -1)
            {
              __break(1u);
              return result;
            }
          }
          result[v5] = v6;
        }
        uint64_t v4 = v3 + 1;
        int v2 = &result[v3 + 1];
      }
      while (v2 != a2);
    }
  }
  return result;
}

uint64_t sub_100024720(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a1;
  int v5 = *(unsigned __int8 *)(*a2 + 578);
  int v6 = *(unsigned __int8 *)(*a1 + 578);
  if (*(char *)(*a2 + 578) < *(char *)(*a1 + 578)
    || v5 == v6 && *(unsigned __int16 *)(v3 + 576) < *(unsigned __int16 *)(v4 + 576))
  {
    uint64_t v7 = *a3;
    if (*(char *)(*a3 + 578) < (char)v5
      || *(unsigned __int8 *)(*a3 + 578) == v5
      && *(unsigned __int16 *)(v7 + 576) < *(unsigned __int16 *)(v3 + 576))
    {
      *a1 = v7;
      *a3 = v4;
    }
    else
    {
      *a1 = v3;
      *a2 = v4;
      uint64_t v14 = *a3;
      if (*(char *)(*a3 + 578) < (char)v6
        || *(unsigned __int8 *)(*a3 + 578) == v6
        && *(unsigned __int16 *)(v14 + 576) < *(unsigned __int16 *)(v4 + 576))
      {
        *a2 = v14;
        *a3 = v4;
        return 2;
      }
    }
    return 1;
  }
  uint64_t v9 = *a3;
  if (*(char *)(*a3 + 578) < (char)v5
    || *(unsigned __int8 *)(*a3 + 578) == v5
    && *(unsigned __int16 *)(v9 + 576) < *(unsigned __int16 *)(v3 + 576))
  {
    *a2 = v9;
    *a3 = v3;
    uint64_t v10 = *a2;
    uint64_t v11 = *a1;
    int v12 = *(char *)(*a2 + 578);
    int v13 = *(char *)(*a1 + 578);
    if (v12 < v13 || v12 == v13 && *(unsigned __int16 *)(v10 + 576) < *(unsigned __int16 *)(v11 + 576))
    {
      *a1 = v10;
      *a2 = v11;
      return 2;
    }
    return 1;
  }
  return 0;
}

unint64_t sub_100024854(unsigned __int16 *a1, unsigned __int16 *a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *((void *)a2 - 1);
  int v4 = *(unsigned __int8 *)(*(void *)a1 + 578);
  unint64_t v5 = *(char *)(v3 + 578);
  if (*(char *)(*(void *)a1 + 578) < (int)v5
    || v4 == *(unsigned __int8 *)(v3 + 578)
    && (unint64_t v5 = *(unsigned __int16 *)(v2 + 576), v5 < *(unsigned __int16 *)(v3 + 576)))
  {
    for (unint64_t i = (unint64_t)(a1 + 4); (unsigned __int16 *)i != a2; i += 8)
    {
      unint64_t v5 = *(void *)i;
      if (*(char *)(*(void *)i + 578) > (char)v4) {
        goto LABEL_16;
      }
      if (v4 == *(unsigned __int8 *)(*(void *)i + 578))
      {
        unint64_t v5 = *(unsigned __int16 *)(v5 + 576);
        if (*(unsigned __int16 *)(v2 + 576) < v5) {
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
    for (unint64_t i = (unint64_t)(a1 + 4);
          i < (unint64_t)a2
       && *(char *)(*(void *)i + 578) <= (char)v4
       && (v4 != *(unsigned __int8 *)(*(void *)i + 578)
        || *(unsigned __int16 *)(v2 + 576) >= *(unsigned __int16 *)(*(void *)i + 576));
LABEL_16:
    unint64_t v5 = (unint64_t)a2;
    if (i >= (unint64_t)a2) {
      goto LABEL_25;
    }
    if (a2 != a1)
    {
      unint64_t v5 = (unint64_t)(a2 - 4);
      do
      {
        if (*(char *)(*(void *)v5 + 578) <= (char)v4
          && (v4 != *(unsigned __int8 *)(*(void *)v5 + 578)
           || *(unsigned __int16 *)(v2 + 576) >= *(unsigned __int16 *)(*(void *)v5 + 576)))
        {
          goto LABEL_25;
        }
        BOOL v7 = v5 == (void)a1;
        v5 -= 8;
      }
      while (!v7);
    }
  }
LABEL_24:
  while (1)
  {
    __break(1u);
LABEL_25:
    if (i >= v5) {
      break;
    }
    unint64_t v8 = *(void *)i;
    uint64_t v9 = *(void *)v5;
LABEL_27:
    *(void *)unint64_t i = v9;
    i += 8;
    *(void *)unint64_t v5 = v8;
    while ((unsigned __int16 *)i != a2)
    {
      unint64_t v8 = *(void *)i;
      if (*(char *)(*(void *)i + 578) > (char)v4
        || v4 == *(unsigned __int8 *)(*(void *)i + 578)
        && *(unsigned __int16 *)(v2 + 576) < *(unsigned __int16 *)(v8 + 576))
      {
        if ((unsigned __int16 *)v5 == a1) {
          goto LABEL_24;
        }
        v5 -= 8;
        while (1)
        {
          uint64_t v9 = *(void *)v5;
          if (*(char *)(*(void *)v5 + 578) <= (char)v4
            && (v4 != *(unsigned __int8 *)(*(void *)v5 + 578)
             || *(unsigned __int16 *)(v2 + 576) >= *(unsigned __int16 *)(v9 + 576)))
          {
            break;
          }
          BOOL v7 = v5 == (void)a1;
          v5 -= 8;
          if (v7) {
            goto LABEL_24;
          }
        }
        if (i < v5) {
          goto LABEL_27;
        }
        goto LABEL_42;
      }
      i += 8;
    }
  }
LABEL_42:
  if ((unsigned __int16 *)(i - 8) != a1) {
    *(void *)a1 = *(void *)(i - 8);
  }
  *(void *)(i - 8) = v2;
  return i;
}

uint64_t *sub_100024A2C(uint64_t *a1, uint64_t *a2)
{
  int v4 = a1 + 8;
  uint64_t v5 = *a1;
  if (a1 + 1 != a2)
  {
    int v4 = *(unsigned __int8 *)(v5 + 578);
    uint64_t v6 = 1;
    while (1)
    {
      uint64_t v3 = a1[v6];
      if (*(char *)(v3 + 578) >= (char)v4
        && (*(unsigned __int8 *)(v3 + 578) != v4
         || *(unsigned __int16 *)(v3 + 576) >= *(unsigned __int16 *)(v5 + 576)))
      {
        break;
      }
      uint64_t v2 = &a1[++v6];
      if (&a1[v6] == a2) {
        goto LABEL_16;
      }
    }
    uint64_t v2 = &a1[v6];
    if (v6 == 1) {
      goto LABEL_17;
    }
    if (a2 != a1)
    {
      BOOL v7 = a2 - 1;
      do
      {
        if (*(char *)(*v7 + 578) < (char)v4
          || *(unsigned __int8 *)(*v7 + 578) == v4
          && *(unsigned __int16 *)(*v7 + 576) < *(unsigned __int16 *)(v5 + 576))
        {
          goto LABEL_29;
        }
        BOOL v8 = v7-- == a1;
      }
      while (!v8);
    }
  }
LABEL_16:
  while (1)
  {
    __break(1u);
LABEL_17:
    BOOL v7 = a2;
    if (v2 < a2)
    {
      BOOL v7 = a2 - 1;
      uint64_t v9 = *(a2 - 1);
      if (*(char *)(v9 + 578) >= (char)v4)
      {
        int v10 = *(unsigned __int8 *)(v9 + 578);
        do
        {
          if (v10 == v4)
          {
            if (*(unsigned __int16 *)(v9 + 576) < *(unsigned __int16 *)(v5 + 576) || v2 >= v7) {
              break;
            }
          }
          else if (v2 >= v7)
          {
            break;
          }
          uint64_t v12 = *--v7;
          uint64_t v9 = v12;
          int v10 = *(unsigned __int8 *)(v12 + 578);
        }
        while (*(char *)(v12 + 578) >= (char)v4);
      }
    }
LABEL_29:
    if (v2 >= v7) {
      break;
    }
    uint64_t v13 = *v7;
    uint64_t v14 = v7;
    unint64_t v15 = v2;
LABEL_31:
    *v15++ = v13;
    *uint64_t v14 = v3;
    while (v15 != a2)
    {
      uint64_t v3 = *v15;
      if (*(char *)(*v15 + 578) >= (char)v4
        && (*(unsigned __int8 *)(*v15 + 578) != v4
         || *(unsigned __int16 *)(v3 + 576) >= *(unsigned __int16 *)(v5 + 576)))
      {
        if (v14 == a1) {
          goto LABEL_16;
        }
        --v14;
        while (1)
        {
          uint64_t v13 = *v14;
          if (*(char *)(*v14 + 578) < (char)v4
            || *(unsigned __int8 *)(*v14 + 578) == v4
            && *(unsigned __int16 *)(v13 + 576) < *(unsigned __int16 *)(v5 + 576))
          {
            break;
          }
          BOOL v8 = v14-- == a1;
          if (v8) {
            goto LABEL_16;
          }
        }
        if (v15 < v14) {
          goto LABEL_31;
        }
        goto LABEL_48;
      }
      ++v15;
    }
  }
  unint64_t v15 = v2;
LABEL_48:
  unint64_t v16 = v15 - 1;
  if (v15 - 1 != a1) {
    *a1 = *v16;
  }
  *unint64_t v16 = v5;
  return v15 - 1;
}

BOOL sub_100024C18(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = a2 - a1;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v6 = *(a2 - 1);
      uint64_t v7 = *a1;
      int v8 = *(char *)(v6 + 578);
      int v9 = *(char *)(*a1 + 578);
      if (v8 < v9 || v8 == v9 && *(unsigned __int16 *)(v6 + 576) < *(unsigned __int16 *)(v7 + 576))
      {
        *a1 = v6;
        *(a2 - 1) = v7;
      }
      return result;
    case 3:
      sub_100024720(a1, a1 + 1, a2 - 1);
      return 1;
    case 4:
      sub_100024E2C(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5:
      sub_100024F0C(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      int v10 = a1 + 2;
      sub_100024720(a1, a1 + 1, a1 + 2);
      uint64_t v11 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    uint64_t v14 = *v11;
    uint64_t v15 = *v10;
    int v16 = *(unsigned __int8 *)(*v11 + 578);
    if (*(char *)(*v11 + 578) < *(char *)(*v10 + 578)
      || v16 == *(unsigned __int8 *)(*v10 + 578)
      && *(unsigned __int16 *)(v14 + 576) < *(unsigned __int16 *)(v15 + 576))
    {
      *uint64_t v11 = v15;
      uint64_t v17 = a1;
      if (v10 != a1)
      {
        uint64_t v18 = v12;
        while (1)
        {
          uint64_t v19 = *(uint64_t *)((char *)a1 + v18 + 8);
          if (*(char *)(v19 + 578) <= (char)v16)
          {
            if (v16 != *(unsigned __int8 *)(v19 + 578))
            {
              uint64_t v17 = v10;
              goto LABEL_20;
            }
            if (*(unsigned __int16 *)(v14 + 576) >= *(unsigned __int16 *)(v19 + 576)) {
              break;
            }
          }
          --v10;
          *(uint64_t *)((char *)a1 + v18 + 16) = v19;
          v18 -= 8;
          if (v18 == -16)
          {
            uint64_t v17 = a1;
            goto LABEL_20;
          }
        }
        uint64_t v17 = (uint64_t *)((char *)a1 + v18 + 16);
      }
LABEL_20:
      *uint64_t v17 = v14;
      if (++v13 == 8) {
        return v11 + 1 == a2;
      }
    }
    int v10 = v11;
    v12 += 8;
    if (++v11 == a2) {
      return 1;
    }
  }
}

uint64_t sub_100024E2C(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result = sub_100024720(a1, a2, a3);
  uint64_t v9 = *a4;
  uint64_t v10 = *a3;
  int v11 = *(char *)(*a4 + 578);
  int v12 = *(char *)(*a3 + 578);
  if (v11 < v12 || v11 == v12 && *(unsigned __int16 *)(v9 + 576) < *(unsigned __int16 *)(v10 + 576))
  {
    *a3 = v9;
    *a4 = v10;
    uint64_t v13 = *a3;
    uint64_t v14 = *a2;
    int v15 = *(char *)(*a3 + 578);
    int v16 = *(char *)(*a2 + 578);
    if (v15 < v16 || v15 == v16 && *(unsigned __int16 *)(v13 + 576) < *(unsigned __int16 *)(v14 + 576))
    {
      *a2 = v13;
      *a3 = v14;
      uint64_t v17 = *a2;
      uint64_t v18 = *a1;
      int v19 = *(char *)(*a2 + 578);
      int v20 = *(char *)(*a1 + 578);
      if (v19 < v20 || v19 == v20 && *(unsigned __int16 *)(v17 + 576) < *(unsigned __int16 *)(v18 + 576))
      {
        *a1 = v17;
        *a2 = v18;
      }
    }
  }
  return result;
}

uint64_t sub_100024F0C(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t result = sub_100024E2C(a1, a2, a3, a4);
  uint64_t v11 = *a5;
  uint64_t v12 = *a4;
  int v13 = *(char *)(*a5 + 578);
  int v14 = *(char *)(*a4 + 578);
  if (v13 < v14 || v13 == v14 && *(unsigned __int16 *)(v11 + 576) < *(unsigned __int16 *)(v12 + 576))
  {
    *a4 = v11;
    *a5 = v12;
    uint64_t v15 = *a4;
    uint64_t v16 = *a3;
    int v17 = *(char *)(*a4 + 578);
    int v18 = *(char *)(*a3 + 578);
    if (v17 < v18 || v17 == v18 && *(unsigned __int16 *)(v15 + 576) < *(unsigned __int16 *)(v16 + 576))
    {
      *a3 = v15;
      *a4 = v16;
      uint64_t v19 = *a3;
      uint64_t v20 = *a2;
      int v21 = *(char *)(*a3 + 578);
      int v22 = *(char *)(*a2 + 578);
      if (v21 < v22 || v21 == v22 && *(unsigned __int16 *)(v19 + 576) < *(unsigned __int16 *)(v20 + 576))
      {
        *a2 = v19;
        *a3 = v20;
        uint64_t v23 = *a2;
        uint64_t v24 = *a1;
        int v25 = *(char *)(*a2 + 578);
        int v26 = *(char *)(*a1 + 578);
        if (v25 < v26
          || v25 == v26 && *(unsigned __int16 *)(v23 + 576) < *(unsigned __int16 *)(v24 + 576))
        {
          *a1 = v23;
          *a2 = v24;
        }
      }
    }
  }
  return result;
}

uint64_t *sub_100025034(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      uint64_t v12 = &a1[v10];
      do
      {
        sub_10002519C((uint64_t)a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    int v13 = a2;
    if (a2 != a3)
    {
      int v14 = a2;
      do
      {
        uint64_t v15 = *v14;
        uint64_t v16 = *a1;
        int v17 = *(char *)(*v14 + 578);
        int v18 = *(char *)(*a1 + 578);
        if (v17 < v18
          || v17 == v18 && *(unsigned __int16 *)(v15 + 576) < *(unsigned __int16 *)(v16 + 576))
        {
          *int v14 = v16;
          *a1 = v15;
          sub_10002519C((uint64_t)a1, a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      int v13 = a3;
    }
    if (v8 >= 9)
    {
      uint64_t v19 = (unint64_t)v8 >> 3;
      uint64_t v20 = a2 - 1;
      do
      {
        uint64_t v21 = *a1;
        int v22 = sub_1000252EC(a1, a4, v19);
        if (v20 == v22)
        {
          *int v22 = v21;
        }
        else
        {
          *int v22 = *v20;
          *uint64_t v20 = v21;
          sub_100025378((uint64_t)a1, (uint64_t)(v22 + 1), a4, v22 + 1 - a1);
        }
        --v20;
      }
      while (v19-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t sub_10002519C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 >= 2)
  {
    uint64_t v4 = (uint64_t)a4 - result;
    int64_t v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 3)
    {
      uint64_t v6 = v4 >> 2;
      uint64_t v7 = (v4 >> 2) + 1;
      uint64_t v8 = (void *)(result + 8 * v7);
      uint64_t v9 = v6 + 2;
      if (v9 < a3)
      {
        uint64_t v10 = v8[1];
        int v11 = *(char *)(*v8 + 578);
        int v12 = *(char *)(v10 + 578);
        if (v11 < v12
          || v11 == v12 && *(unsigned __int16 *)(*v8 + 576) < *(unsigned __int16 *)(v10 + 576))
        {
          ++v8;
          uint64_t v7 = v9;
        }
      }
      uint64_t v13 = *v8;
      uint64_t v14 = *a4;
      if (*(char *)(*v8 + 578) >= *(char *)(*a4 + 578))
      {
        int v15 = *(unsigned __int8 *)(*a4 + 578);
        if (*(unsigned __int8 *)(*v8 + 578) != v15
          || *(unsigned __int16 *)(v13 + 576) >= *(unsigned __int16 *)(v14 + 576))
        {
          *a4 = v13;
          if (v5 >= v7)
          {
            while (1)
            {
              uint64_t v17 = 2 * v7;
              uint64_t v7 = (2 * v7) | 1;
              uint64_t v16 = (void *)(result + 8 * v7);
              uint64_t v18 = v17 + 2;
              if (v18 < a3)
              {
                uint64_t v19 = v16[1];
                int v20 = *(char *)(*v16 + 578);
                int v21 = *(char *)(v19 + 578);
                if (v20 < v21
                  || v20 == v21 && *(unsigned __int16 *)(*v16 + 576) < *(unsigned __int16 *)(v19 + 576))
                {
                  ++v16;
                  uint64_t v7 = v18;
                }
              }
              uint64_t v22 = *v16;
              if (*(char *)(*v16 + 578) < (char)v15
                || *(unsigned __int8 *)(*v16 + 578) == v15
                && *(unsigned __int16 *)(v22 + 576) < *(unsigned __int16 *)(v14 + 576))
              {
                break;
              }
              *uint64_t v8 = v22;
              uint64_t v8 = v16;
              if (v5 < v7) {
                goto LABEL_22;
              }
            }
          }
          uint64_t v16 = v8;
LABEL_22:
          *uint64_t v16 = v14;
        }
      }
    }
  }
  return result;
}

void *sub_1000252EC(void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a3 - 2;
  if (a3 < 2) {
    uint64_t v4 = a3 - 1;
  }
  uint64_t v5 = v4 >> 1;
  do
  {
    uint64_t v6 = result;
    result += v3 + 1;
    uint64_t v7 = 2 * v3;
    uint64_t v3 = (2 * v3) | 1;
    uint64_t v8 = v7 + 2;
    if (v8 < a3)
    {
      uint64_t v9 = result[1];
      int v10 = *(char *)(*result + 578);
      int v11 = *(char *)(v9 + 578);
      if (v10 < v11
        || v10 == v11 && *(unsigned __int16 *)(*result + 576) < *(unsigned __int16 *)(v9 + 576))
      {
        ++result;
        uint64_t v3 = v8;
      }
    }
    *uint64_t v6 = *result;
  }
  while (v3 <= v5);
  return result;
}

uint64_t sub_100025378(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v5 = v4 >> 1;
    uint64_t v6 = (uint64_t *)(result + 8 * (v4 >> 1));
    uint64_t v7 = *v6;
    uint64_t v8 = *(void *)(a2 - 8);
    int v9 = *(unsigned __int8 *)(v8 + 578);
    if (*(char *)(*v6 + 578) < *(char *)(v8 + 578)
      || *(unsigned __int8 *)(*v6 + 578) == v9
      && *(unsigned __int16 *)(v7 + 576) < *(unsigned __int16 *)(v8 + 576))
    {
      *(void *)(a2 - 8) = v7;
      if (v4 >= 2)
      {
        while (1)
        {
          unint64_t v11 = v5 - 1;
          unint64_t v5 = (v5 - 1) >> 1;
          int v10 = (uint64_t *)(result + 8 * v5);
          uint64_t v12 = *v10;
          if (*(char *)(*v10 + 578) >= (char)v9
            && (*(unsigned __int8 *)(*v10 + 578) != v9
             || *(unsigned __int16 *)(v12 + 576) >= *(unsigned __int16 *)(v8 + 576)))
          {
            break;
          }
          *uint64_t v6 = v12;
          uint64_t v6 = (uint64_t *)(result + 8 * v5);
          if (v11 <= 1) {
            goto LABEL_11;
          }
        }
      }
      int v10 = v6;
LABEL_11:
      *int v10 = v8;
    }
  }
  return result;
}

uint64_t sub_100025424(uint64_t result, uint64_t *a2, uint64_t a3, uint64_t a4, char a5)
{
  int v10 = (uint64_t *)result;
LABEL_2:
  unint64_t v11 = v10;
LABEL_3:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    int v10 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = a2 - v11;
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          uint64_t v25 = *(a2 - 1);
          uint64_t v26 = *v11;
          int v27 = *(char *)(v25 + 290);
          int v28 = *(char *)(*v11 + 290);
          if (v27 < v28
            || v27 == v28 && *(unsigned __int16 *)(v25 + 288) < *(unsigned __int16 *)(v26 + 288))
          {
            *unint64_t v11 = v25;
            *(a2 - 1) = v26;
          }
          break;
        case 3uLL:
          uint64_t result = sub_1000259AC(v11, v11 + 1, a2 - 1);
          break;
        case 4uLL:
          uint64_t result = sub_1000260B8(v11, v11 + 1, v11 + 2, a2 - 1);
          break;
        case 5uLL:
          uint64_t result = sub_100026198(v11, v11 + 1, v11 + 2, v11 + 3, a2 - 1);
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v14 <= 191) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        return (uint64_t)sub_1000262C0(v11, a2, a2, a3);
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    uint64_t v17 = &v11[v15 >> 1];
    if ((unint64_t)v14 >= 0x401)
    {
      sub_1000259AC(v11, &v11[v15 >> 1], a2 - 1);
      sub_1000259AC(v11 + 1, v17 - 1, a2 - 2);
      sub_1000259AC(v11 + 2, &v11[v16 + 1], a2 - 3);
      sub_1000259AC(v17 - 1, v17, &v11[v16 + 1]);
      uint64_t v18 = *v11;
      *unint64_t v11 = *v17;
      *uint64_t v17 = v18;
      if (a5) {
        goto LABEL_16;
      }
    }
    else
    {
      sub_1000259AC(&v11[v15 >> 1], v11, a2 - 1);
      if (a5) {
        goto LABEL_16;
      }
    }
    uint64_t v19 = *(v11 - 1);
    int v20 = *(char *)(v19 + 290);
    int v21 = *(char *)(*v11 + 290);
    if (v20 >= v21
      && (v20 != v21 || *(unsigned __int16 *)(v19 + 288) >= *(unsigned __int16 *)(*v11 + 288)))
    {
      uint64_t result = sub_100025AE0((unsigned __int16 *)v11, (unsigned __int16 *)a2);
      unint64_t v11 = (uint64_t *)result;
      goto LABEL_21;
    }
LABEL_16:
    uint64_t v22 = sub_100025CB8(v11, a2);
    if ((v23 & 1) == 0) {
      goto LABEL_19;
    }
    BOOL v24 = sub_100025EA4(v11, v22);
    unint64_t v11 = v22 + 1;
    uint64_t result = sub_100025EA4(v22 + 1, a2);
    if (result)
    {
      a4 = -v13;
      a2 = v22;
      if (v24) {
        return result;
      }
      goto LABEL_2;
    }
    uint64_t v12 = v13 + 1;
    if (!v24)
    {
LABEL_19:
      uint64_t result = sub_100025424(v10, v22, a3, -v13, a5 & 1);
      unint64_t v11 = v22 + 1;
LABEL_21:
      a5 = 0;
      a4 = -v13;
      goto LABEL_3;
    }
  }
  if (a5)
  {
    return (uint64_t)sub_100025810(v11, a2);
  }
  else
  {
    return (uint64_t)sub_1000258EC(v11, a2);
  }
}

void *sub_100025810(void *result, void *a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 1;
    if (result + 1 != a2)
    {
      uint64_t v3 = 0;
      unint64_t v4 = result;
      do
      {
        char v5 = v4;
        unint64_t v4 = v2;
        uint64_t v7 = *v5;
        uint64_t v6 = v5[1];
        int v8 = *(unsigned __int8 *)(v6 + 290);
        if (*(char *)(v6 + 290) < *(char *)(*v5 + 290)
          || v8 == *(unsigned __int8 *)(*v5 + 290)
          && *(unsigned __int16 *)(v6 + 288) < *(unsigned __int16 *)(v7 + 288))
        {
          v5[1] = v7;
          int v9 = result;
          if (v5 != result)
          {
            uint64_t v10 = v3;
            while (1)
            {
              uint64_t v11 = *(void *)((char *)result + v10 - 8);
              if (*(char *)(v11 + 290) <= (char)v8)
              {
                if (v8 != *(unsigned __int8 *)(v11 + 290))
                {
                  int v9 = v5;
                  goto LABEL_17;
                }
                if (*(unsigned __int16 *)(v6 + 288) >= *(unsigned __int16 *)(v11 + 288)) {
                  break;
                }
              }
              --v5;
              *(void *)((char *)result + v10) = v11;
              v10 -= 8;
              if (!v10)
              {
                int v9 = result;
                goto LABEL_17;
              }
            }
            int v9 = (void *)((char *)result + v10);
          }
LABEL_17:
          *int v9 = v6;
        }
        uint64_t v2 = v4 + 1;
        v3 += 8;
      }
      while (v4 + 1 != a2);
    }
  }
  return result;
}

uint64_t *sub_1000258EC(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 1;
    if (result + 1 != a2)
    {
      uint64_t v3 = 0;
      uint64_t v4 = 1;
      do
      {
        uint64_t v5 = v3;
        uint64_t v3 = v4;
        uint64_t v6 = *v2;
        uint64_t v7 = result[v5];
        int v8 = *(unsigned __int8 *)(*v2 + 290);
        if (*(char *)(*v2 + 290) < *(char *)(v7 + 290)
          || v8 == *(unsigned __int8 *)(v7 + 290)
          && *(unsigned __int16 *)(v6 + 288) < *(unsigned __int16 *)(v7 + 288))
        {
          *uint64_t v2 = v7;
          while (1)
          {
            int v9 = &result[v5];
            uint64_t v10 = *(v9 - 1);
            if (*(char *)(v10 + 290) <= (char)v8
              && (v8 != *(unsigned __int8 *)(v10 + 290)
               || *(unsigned __int16 *)(v6 + 288) >= *(unsigned __int16 *)(v10 + 288)))
            {
              break;
            }
            --v5;
            *int v9 = v10;
            if (v5 == -1)
            {
              __break(1u);
              return result;
            }
          }
          result[v5] = v6;
        }
        uint64_t v4 = v3 + 1;
        uint64_t v2 = &result[v3 + 1];
      }
      while (v2 != a2);
    }
  }
  return result;
}

uint64_t sub_1000259AC(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a1;
  int v5 = *(unsigned __int8 *)(*a2 + 290);
  int v6 = *(unsigned __int8 *)(*a1 + 290);
  if (*(char *)(*a2 + 290) < *(char *)(*a1 + 290)
    || v5 == v6 && *(unsigned __int16 *)(v3 + 288) < *(unsigned __int16 *)(v4 + 288))
  {
    uint64_t v7 = *a3;
    if (*(char *)(*a3 + 290) < (char)v5
      || *(unsigned __int8 *)(*a3 + 290) == v5
      && *(unsigned __int16 *)(v7 + 288) < *(unsigned __int16 *)(v3 + 288))
    {
      *a1 = v7;
      *a3 = v4;
    }
    else
    {
      *a1 = v3;
      *a2 = v4;
      uint64_t v14 = *a3;
      if (*(char *)(*a3 + 290) < (char)v6
        || *(unsigned __int8 *)(*a3 + 290) == v6
        && *(unsigned __int16 *)(v14 + 288) < *(unsigned __int16 *)(v4 + 288))
      {
        *a2 = v14;
        *a3 = v4;
        return 2;
      }
    }
    return 1;
  }
  uint64_t v9 = *a3;
  if (*(char *)(*a3 + 290) < (char)v5
    || *(unsigned __int8 *)(*a3 + 290) == v5
    && *(unsigned __int16 *)(v9 + 288) < *(unsigned __int16 *)(v3 + 288))
  {
    *a2 = v9;
    *a3 = v3;
    uint64_t v10 = *a2;
    uint64_t v11 = *a1;
    int v12 = *(char *)(*a2 + 290);
    int v13 = *(char *)(*a1 + 290);
    if (v12 < v13 || v12 == v13 && *(unsigned __int16 *)(v10 + 288) < *(unsigned __int16 *)(v11 + 288))
    {
      *a1 = v10;
      *a2 = v11;
      return 2;
    }
    return 1;
  }
  return 0;
}

unint64_t sub_100025AE0(unsigned __int16 *a1, unsigned __int16 *a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *((void *)a2 - 1);
  int v4 = *(unsigned __int8 *)(*(void *)a1 + 290);
  unint64_t v5 = *(char *)(v3 + 290);
  if (*(char *)(*(void *)a1 + 290) < (int)v5
    || v4 == *(unsigned __int8 *)(v3 + 290)
    && (unint64_t v5 = *(unsigned __int16 *)(v2 + 288), v5 < *(unsigned __int16 *)(v3 + 288)))
  {
    for (unint64_t i = (unint64_t)(a1 + 4); (unsigned __int16 *)i != a2; i += 8)
    {
      unint64_t v5 = *(void *)i;
      if (*(char *)(*(void *)i + 290) > (char)v4) {
        goto LABEL_16;
      }
      if (v4 == *(unsigned __int8 *)(*(void *)i + 290))
      {
        unint64_t v5 = *(unsigned __int16 *)(v5 + 288);
        if (*(unsigned __int16 *)(v2 + 288) < v5) {
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
    for (unint64_t i = (unint64_t)(a1 + 4);
          i < (unint64_t)a2
       && *(char *)(*(void *)i + 290) <= (char)v4
       && (v4 != *(unsigned __int8 *)(*(void *)i + 290)
        || *(unsigned __int16 *)(v2 + 288) >= *(unsigned __int16 *)(*(void *)i + 288));
LABEL_16:
    unint64_t v5 = (unint64_t)a2;
    if (i >= (unint64_t)a2) {
      goto LABEL_25;
    }
    if (a2 != a1)
    {
      unint64_t v5 = (unint64_t)(a2 - 4);
      do
      {
        if (*(char *)(*(void *)v5 + 290) <= (char)v4
          && (v4 != *(unsigned __int8 *)(*(void *)v5 + 290)
           || *(unsigned __int16 *)(v2 + 288) >= *(unsigned __int16 *)(*(void *)v5 + 288)))
        {
          goto LABEL_25;
        }
        BOOL v7 = v5 == (void)a1;
        v5 -= 8;
      }
      while (!v7);
    }
  }
LABEL_24:
  while (1)
  {
    __break(1u);
LABEL_25:
    if (i >= v5) {
      break;
    }
    unint64_t v8 = *(void *)i;
    uint64_t v9 = *(void *)v5;
LABEL_27:
    *(void *)unint64_t i = v9;
    i += 8;
    *(void *)unint64_t v5 = v8;
    while ((unsigned __int16 *)i != a2)
    {
      unint64_t v8 = *(void *)i;
      if (*(char *)(*(void *)i + 290) > (char)v4
        || v4 == *(unsigned __int8 *)(*(void *)i + 290)
        && *(unsigned __int16 *)(v2 + 288) < *(unsigned __int16 *)(v8 + 288))
      {
        if ((unsigned __int16 *)v5 == a1) {
          goto LABEL_24;
        }
        v5 -= 8;
        while (1)
        {
          uint64_t v9 = *(void *)v5;
          if (*(char *)(*(void *)v5 + 290) <= (char)v4
            && (v4 != *(unsigned __int8 *)(*(void *)v5 + 290)
             || *(unsigned __int16 *)(v2 + 288) >= *(unsigned __int16 *)(v9 + 288)))
          {
            break;
          }
          BOOL v7 = v5 == (void)a1;
          v5 -= 8;
          if (v7) {
            goto LABEL_24;
          }
        }
        if (i < v5) {
          goto LABEL_27;
        }
        goto LABEL_42;
      }
      i += 8;
    }
  }
LABEL_42:
  if ((unsigned __int16 *)(i - 8) != a1) {
    *(void *)a1 = *(void *)(i - 8);
  }
  *(void *)(i - 8) = v2;
  return i;
}

uint64_t *sub_100025CB8(uint64_t *a1, uint64_t *a2)
{
  int v4 = a1 + 8;
  uint64_t v5 = *a1;
  if (a1 + 1 != a2)
  {
    int v4 = *(unsigned __int8 *)(v5 + 290);
    uint64_t v6 = 1;
    while (1)
    {
      uint64_t v3 = a1[v6];
      if (*(char *)(v3 + 290) >= (char)v4
        && (*(unsigned __int8 *)(v3 + 290) != v4
         || *(unsigned __int16 *)(v3 + 288) >= *(unsigned __int16 *)(v5 + 288)))
      {
        break;
      }
      uint64_t v2 = &a1[++v6];
      if (&a1[v6] == a2) {
        goto LABEL_16;
      }
    }
    uint64_t v2 = &a1[v6];
    if (v6 == 1) {
      goto LABEL_17;
    }
    if (a2 != a1)
    {
      BOOL v7 = a2 - 1;
      do
      {
        if (*(char *)(*v7 + 290) < (char)v4
          || *(unsigned __int8 *)(*v7 + 290) == v4
          && *(unsigned __int16 *)(*v7 + 288) < *(unsigned __int16 *)(v5 + 288))
        {
          goto LABEL_29;
        }
        BOOL v8 = v7-- == a1;
      }
      while (!v8);
    }
  }
LABEL_16:
  while (1)
  {
    __break(1u);
LABEL_17:
    BOOL v7 = a2;
    if (v2 < a2)
    {
      BOOL v7 = a2 - 1;
      uint64_t v9 = *(a2 - 1);
      if (*(char *)(v9 + 290) >= (char)v4)
      {
        int v10 = *(unsigned __int8 *)(v9 + 290);
        do
        {
          if (v10 == v4)
          {
            if (*(unsigned __int16 *)(v9 + 288) < *(unsigned __int16 *)(v5 + 288) || v2 >= v7) {
              break;
            }
          }
          else if (v2 >= v7)
          {
            break;
          }
          uint64_t v12 = *--v7;
          uint64_t v9 = v12;
          int v10 = *(unsigned __int8 *)(v12 + 290);
        }
        while (*(char *)(v12 + 290) >= (char)v4);
      }
    }
LABEL_29:
    if (v2 >= v7) {
      break;
    }
    uint64_t v13 = *v7;
    uint64_t v14 = v7;
    unint64_t v15 = v2;
LABEL_31:
    *v15++ = v13;
    *uint64_t v14 = v3;
    while (v15 != a2)
    {
      uint64_t v3 = *v15;
      if (*(char *)(*v15 + 290) >= (char)v4
        && (*(unsigned __int8 *)(*v15 + 290) != v4
         || *(unsigned __int16 *)(v3 + 288) >= *(unsigned __int16 *)(v5 + 288)))
      {
        if (v14 == a1) {
          goto LABEL_16;
        }
        --v14;
        while (1)
        {
          uint64_t v13 = *v14;
          if (*(char *)(*v14 + 290) < (char)v4
            || *(unsigned __int8 *)(*v14 + 290) == v4
            && *(unsigned __int16 *)(v13 + 288) < *(unsigned __int16 *)(v5 + 288))
          {
            break;
          }
          BOOL v8 = v14-- == a1;
          if (v8) {
            goto LABEL_16;
          }
        }
        if (v15 < v14) {
          goto LABEL_31;
        }
        goto LABEL_48;
      }
      ++v15;
    }
  }
  unint64_t v15 = v2;
LABEL_48:
  unint64_t v16 = v15 - 1;
  if (v15 - 1 != a1) {
    *a1 = *v16;
  }
  *unint64_t v16 = v5;
  return v15 - 1;
}

BOOL sub_100025EA4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = a2 - a1;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v6 = *(a2 - 1);
      uint64_t v7 = *a1;
      int v8 = *(char *)(v6 + 290);
      int v9 = *(char *)(*a1 + 290);
      if (v8 < v9 || v8 == v9 && *(unsigned __int16 *)(v6 + 288) < *(unsigned __int16 *)(v7 + 288))
      {
        *a1 = v6;
        *(a2 - 1) = v7;
      }
      return result;
    case 3:
      sub_1000259AC(a1, a1 + 1, a2 - 1);
      return 1;
    case 4:
      sub_1000260B8(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5:
      sub_100026198(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      int v10 = a1 + 2;
      sub_1000259AC(a1, a1 + 1, a1 + 2);
      uint64_t v11 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    uint64_t v14 = *v11;
    uint64_t v15 = *v10;
    int v16 = *(unsigned __int8 *)(*v11 + 290);
    if (*(char *)(*v11 + 290) < *(char *)(*v10 + 290)
      || v16 == *(unsigned __int8 *)(*v10 + 290)
      && *(unsigned __int16 *)(v14 + 288) < *(unsigned __int16 *)(v15 + 288))
    {
      *uint64_t v11 = v15;
      uint64_t v17 = a1;
      if (v10 != a1)
      {
        uint64_t v18 = v12;
        while (1)
        {
          uint64_t v19 = *(uint64_t *)((char *)a1 + v18 + 8);
          if (*(char *)(v19 + 290) <= (char)v16)
          {
            if (v16 != *(unsigned __int8 *)(v19 + 290))
            {
              uint64_t v17 = v10;
              goto LABEL_20;
            }
            if (*(unsigned __int16 *)(v14 + 288) >= *(unsigned __int16 *)(v19 + 288)) {
              break;
            }
          }
          --v10;
          *(uint64_t *)((char *)a1 + v18 + 16) = v19;
          v18 -= 8;
          if (v18 == -16)
          {
            uint64_t v17 = a1;
            goto LABEL_20;
          }
        }
        uint64_t v17 = (uint64_t *)((char *)a1 + v18 + 16);
      }
LABEL_20:
      *uint64_t v17 = v14;
      if (++v13 == 8) {
        return v11 + 1 == a2;
      }
    }
    int v10 = v11;
    v12 += 8;
    if (++v11 == a2) {
      return 1;
    }
  }
}

uint64_t sub_1000260B8(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result = sub_1000259AC(a1, a2, a3);
  uint64_t v9 = *a4;
  uint64_t v10 = *a3;
  int v11 = *(char *)(*a4 + 290);
  int v12 = *(char *)(*a3 + 290);
  if (v11 < v12 || v11 == v12 && *(unsigned __int16 *)(v9 + 288) < *(unsigned __int16 *)(v10 + 288))
  {
    *a3 = v9;
    *a4 = v10;
    uint64_t v13 = *a3;
    uint64_t v14 = *a2;
    int v15 = *(char *)(*a3 + 290);
    int v16 = *(char *)(*a2 + 290);
    if (v15 < v16 || v15 == v16 && *(unsigned __int16 *)(v13 + 288) < *(unsigned __int16 *)(v14 + 288))
    {
      *a2 = v13;
      *a3 = v14;
      uint64_t v17 = *a2;
      uint64_t v18 = *a1;
      int v19 = *(char *)(*a2 + 290);
      int v20 = *(char *)(*a1 + 290);
      if (v19 < v20 || v19 == v20 && *(unsigned __int16 *)(v17 + 288) < *(unsigned __int16 *)(v18 + 288))
      {
        *a1 = v17;
        *a2 = v18;
      }
    }
  }
  return result;
}

uint64_t sub_100026198(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t result = sub_1000260B8(a1, a2, a3, a4);
  uint64_t v11 = *a5;
  uint64_t v12 = *a4;
  int v13 = *(char *)(*a5 + 290);
  int v14 = *(char *)(*a4 + 290);
  if (v13 < v14 || v13 == v14 && *(unsigned __int16 *)(v11 + 288) < *(unsigned __int16 *)(v12 + 288))
  {
    *a4 = v11;
    *a5 = v12;
    uint64_t v15 = *a4;
    uint64_t v16 = *a3;
    int v17 = *(char *)(*a4 + 290);
    int v18 = *(char *)(*a3 + 290);
    if (v17 < v18 || v17 == v18 && *(unsigned __int16 *)(v15 + 288) < *(unsigned __int16 *)(v16 + 288))
    {
      *a3 = v15;
      *a4 = v16;
      uint64_t v19 = *a3;
      uint64_t v20 = *a2;
      int v21 = *(char *)(*a3 + 290);
      int v22 = *(char *)(*a2 + 290);
      if (v21 < v22 || v21 == v22 && *(unsigned __int16 *)(v19 + 288) < *(unsigned __int16 *)(v20 + 288))
      {
        *a2 = v19;
        *a3 = v20;
        uint64_t v23 = *a2;
        uint64_t v24 = *a1;
        int v25 = *(char *)(*a2 + 290);
        int v26 = *(char *)(*a1 + 290);
        if (v25 < v26
          || v25 == v26 && *(unsigned __int16 *)(v23 + 288) < *(unsigned __int16 *)(v24 + 288))
        {
          *a1 = v23;
          *a2 = v24;
        }
      }
    }
  }
  return result;
}

uint64_t *sub_1000262C0(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      uint64_t v12 = &a1[v10];
      do
      {
        sub_100026428((uint64_t)a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    int v13 = a2;
    if (a2 != a3)
    {
      int v14 = a2;
      do
      {
        uint64_t v15 = *v14;
        uint64_t v16 = *a1;
        int v17 = *(char *)(*v14 + 290);
        int v18 = *(char *)(*a1 + 290);
        if (v17 < v18
          || v17 == v18 && *(unsigned __int16 *)(v15 + 288) < *(unsigned __int16 *)(v16 + 288))
        {
          *int v14 = v16;
          *a1 = v15;
          sub_100026428((uint64_t)a1, a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      int v13 = a3;
    }
    if (v8 >= 9)
    {
      uint64_t v19 = (unint64_t)v8 >> 3;
      uint64_t v20 = a2 - 1;
      do
      {
        uint64_t v21 = *a1;
        int v22 = sub_100026578(a1, a4, v19);
        if (v20 == v22)
        {
          *int v22 = v21;
        }
        else
        {
          *int v22 = *v20;
          *uint64_t v20 = v21;
          sub_100026604((uint64_t)a1, (uint64_t)(v22 + 1), a4, v22 + 1 - a1);
        }
        --v20;
      }
      while (v19-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t sub_100026428(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 >= 2)
  {
    uint64_t v4 = (uint64_t)a4 - result;
    int64_t v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 3)
    {
      uint64_t v6 = v4 >> 2;
      uint64_t v7 = (v4 >> 2) + 1;
      uint64_t v8 = (void *)(result + 8 * v7);
      uint64_t v9 = v6 + 2;
      if (v9 < a3)
      {
        uint64_t v10 = v8[1];
        int v11 = *(char *)(*v8 + 290);
        int v12 = *(char *)(v10 + 290);
        if (v11 < v12
          || v11 == v12 && *(unsigned __int16 *)(*v8 + 288) < *(unsigned __int16 *)(v10 + 288))
        {
          ++v8;
          uint64_t v7 = v9;
        }
      }
      uint64_t v13 = *v8;
      uint64_t v14 = *a4;
      if (*(char *)(*v8 + 290) >= *(char *)(*a4 + 290))
      {
        int v15 = *(unsigned __int8 *)(*a4 + 290);
        if (*(unsigned __int8 *)(*v8 + 290) != v15
          || *(unsigned __int16 *)(v13 + 288) >= *(unsigned __int16 *)(v14 + 288))
        {
          *a4 = v13;
          if (v5 >= v7)
          {
            while (1)
            {
              uint64_t v17 = 2 * v7;
              uint64_t v7 = (2 * v7) | 1;
              uint64_t v16 = (void *)(result + 8 * v7);
              uint64_t v18 = v17 + 2;
              if (v18 < a3)
              {
                uint64_t v19 = v16[1];
                int v20 = *(char *)(*v16 + 290);
                int v21 = *(char *)(v19 + 290);
                if (v20 < v21
                  || v20 == v21 && *(unsigned __int16 *)(*v16 + 288) < *(unsigned __int16 *)(v19 + 288))
                {
                  ++v16;
                  uint64_t v7 = v18;
                }
              }
              uint64_t v22 = *v16;
              if (*(char *)(*v16 + 290) < (char)v15
                || *(unsigned __int8 *)(*v16 + 290) == v15
                && *(unsigned __int16 *)(v22 + 288) < *(unsigned __int16 *)(v14 + 288))
              {
                break;
              }
              *uint64_t v8 = v22;
              uint64_t v8 = v16;
              if (v5 < v7) {
                goto LABEL_22;
              }
            }
          }
          uint64_t v16 = v8;
LABEL_22:
          *uint64_t v16 = v14;
        }
      }
    }
  }
  return result;
}

void *sub_100026578(void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a3 - 2;
  if (a3 < 2) {
    uint64_t v4 = a3 - 1;
  }
  uint64_t v5 = v4 >> 1;
  do
  {
    uint64_t v6 = result;
    result += v3 + 1;
    uint64_t v7 = 2 * v3;
    uint64_t v3 = (2 * v3) | 1;
    uint64_t v8 = v7 + 2;
    if (v8 < a3)
    {
      uint64_t v9 = result[1];
      int v10 = *(char *)(*result + 290);
      int v11 = *(char *)(v9 + 290);
      if (v10 < v11
        || v10 == v11 && *(unsigned __int16 *)(*result + 288) < *(unsigned __int16 *)(v9 + 288))
      {
        ++result;
        uint64_t v3 = v8;
      }
    }
    *uint64_t v6 = *result;
  }
  while (v3 <= v5);
  return result;
}

uint64_t sub_100026604(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v5 = v4 >> 1;
    uint64_t v6 = (uint64_t *)(result + 8 * (v4 >> 1));
    uint64_t v7 = *v6;
    uint64_t v8 = *(void *)(a2 - 8);
    int v9 = *(unsigned __int8 *)(v8 + 290);
    if (*(char *)(*v6 + 290) < *(char *)(v8 + 290)
      || *(unsigned __int8 *)(*v6 + 290) == v9
      && *(unsigned __int16 *)(v7 + 288) < *(unsigned __int16 *)(v8 + 288))
    {
      *(void *)(a2 - 8) = v7;
      if (v4 >= 2)
      {
        while (1)
        {
          unint64_t v11 = v5 - 1;
          unint64_t v5 = (v5 - 1) >> 1;
          int v10 = (uint64_t *)(result + 8 * v5);
          uint64_t v12 = *v10;
          if (*(char *)(*v10 + 290) >= (char)v9
            && (*(unsigned __int8 *)(*v10 + 290) != v9
             || *(unsigned __int16 *)(v12 + 288) >= *(unsigned __int16 *)(v8 + 288)))
          {
            break;
          }
          *uint64_t v6 = v12;
          uint64_t v6 = (uint64_t *)(result + 8 * v5);
          if (v11 <= 1) {
            goto LABEL_11;
          }
        }
      }
      int v10 = v6;
LABEL_11:
      *int v10 = v8;
    }
  }
  return result;
}

uint64_t sub_1000266B0(uint64_t result, uint64_t *a2, uint64_t a3, uint64_t a4, char a5)
{
  int v10 = (uint64_t *)result;
LABEL_2:
  unint64_t v11 = v10;
LABEL_3:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    int v10 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = a2 - v11;
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          uint64_t v25 = *(a2 - 1);
          uint64_t v26 = *v11;
          int v27 = *(char *)(v25 + 338);
          int v28 = *(char *)(*v11 + 338);
          if (v27 < v28
            || v27 == v28 && *(unsigned __int16 *)(v25 + 336) < *(unsigned __int16 *)(v26 + 336))
          {
            *unint64_t v11 = v25;
            *(a2 - 1) = v26;
          }
          break;
        case 3uLL:
          uint64_t result = sub_100026C38(v11, v11 + 1, a2 - 1);
          break;
        case 4uLL:
          uint64_t result = sub_100027344(v11, v11 + 1, v11 + 2, a2 - 1);
          break;
        case 5uLL:
          uint64_t result = sub_100027424(v11, v11 + 1, v11 + 2, v11 + 3, a2 - 1);
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v14 <= 191) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        return (uint64_t)sub_10002754C(v11, a2, a2, a3);
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    uint64_t v17 = &v11[v15 >> 1];
    if ((unint64_t)v14 >= 0x401)
    {
      sub_100026C38(v11, &v11[v15 >> 1], a2 - 1);
      sub_100026C38(v11 + 1, v17 - 1, a2 - 2);
      sub_100026C38(v11 + 2, &v11[v16 + 1], a2 - 3);
      sub_100026C38(v17 - 1, v17, &v11[v16 + 1]);
      uint64_t v18 = *v11;
      *unint64_t v11 = *v17;
      *uint64_t v17 = v18;
      if (a5) {
        goto LABEL_16;
      }
    }
    else
    {
      sub_100026C38(&v11[v15 >> 1], v11, a2 - 1);
      if (a5) {
        goto LABEL_16;
      }
    }
    uint64_t v19 = *(v11 - 1);
    int v20 = *(char *)(v19 + 338);
    int v21 = *(char *)(*v11 + 338);
    if (v20 >= v21
      && (v20 != v21 || *(unsigned __int16 *)(v19 + 336) >= *(unsigned __int16 *)(*v11 + 336)))
    {
      uint64_t result = sub_100026D6C((unsigned __int16 *)v11, (unsigned __int16 *)a2);
      unint64_t v11 = (uint64_t *)result;
      goto LABEL_21;
    }
LABEL_16:
    uint64_t v22 = sub_100026F44(v11, a2);
    if ((v23 & 1) == 0) {
      goto LABEL_19;
    }
    BOOL v24 = sub_100027130(v11, v22);
    unint64_t v11 = v22 + 1;
    uint64_t result = sub_100027130(v22 + 1, a2);
    if (result)
    {
      a4 = -v13;
      a2 = v22;
      if (v24) {
        return result;
      }
      goto LABEL_2;
    }
    uint64_t v12 = v13 + 1;
    if (!v24)
    {
LABEL_19:
      uint64_t result = sub_1000266B0(v10, v22, a3, -v13, a5 & 1);
      unint64_t v11 = v22 + 1;
LABEL_21:
      a5 = 0;
      a4 = -v13;
      goto LABEL_3;
    }
  }
  if (a5)
  {
    return (uint64_t)sub_100026A9C(v11, a2);
  }
  else
  {
    return (uint64_t)sub_100026B78(v11, a2);
  }
}

void *sub_100026A9C(void *result, void *a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 1;
    if (result + 1 != a2)
    {
      uint64_t v3 = 0;
      unint64_t v4 = result;
      do
      {
        char v5 = v4;
        unint64_t v4 = v2;
        uint64_t v7 = *v5;
        uint64_t v6 = v5[1];
        int v8 = *(unsigned __int8 *)(v6 + 338);
        if (*(char *)(v6 + 338) < *(char *)(*v5 + 338)
          || v8 == *(unsigned __int8 *)(*v5 + 338)
          && *(unsigned __int16 *)(v6 + 336) < *(unsigned __int16 *)(v7 + 336))
        {
          v5[1] = v7;
          int v9 = result;
          if (v5 != result)
          {
            uint64_t v10 = v3;
            while (1)
            {
              uint64_t v11 = *(void *)((char *)result + v10 - 8);
              if (*(char *)(v11 + 338) <= (char)v8)
              {
                if (v8 != *(unsigned __int8 *)(v11 + 338))
                {
                  int v9 = v5;
                  goto LABEL_17;
                }
                if (*(unsigned __int16 *)(v6 + 336) >= *(unsigned __int16 *)(v11 + 336)) {
                  break;
                }
              }
              --v5;
              *(void *)((char *)result + v10) = v11;
              v10 -= 8;
              if (!v10)
              {
                int v9 = result;
                goto LABEL_17;
              }
            }
            int v9 = (void *)((char *)result + v10);
          }
LABEL_17:
          *int v9 = v6;
        }
        uint64_t v2 = v4 + 1;
        v3 += 8;
      }
      while (v4 + 1 != a2);
    }
  }
  return result;
}

uint64_t *sub_100026B78(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 1;
    if (result + 1 != a2)
    {
      uint64_t v3 = 0;
      uint64_t v4 = 1;
      do
      {
        uint64_t v5 = v3;
        uint64_t v3 = v4;
        uint64_t v6 = *v2;
        uint64_t v7 = result[v5];
        int v8 = *(unsigned __int8 *)(*v2 + 338);
        if (*(char *)(*v2 + 338) < *(char *)(v7 + 338)
          || v8 == *(unsigned __int8 *)(v7 + 338)
          && *(unsigned __int16 *)(v6 + 336) < *(unsigned __int16 *)(v7 + 336))
        {
          *uint64_t v2 = v7;
          while (1)
          {
            int v9 = &result[v5];
            uint64_t v10 = *(v9 - 1);
            if (*(char *)(v10 + 338) <= (char)v8
              && (v8 != *(unsigned __int8 *)(v10 + 338)
               || *(unsigned __int16 *)(v6 + 336) >= *(unsigned __int16 *)(v10 + 336)))
            {
              break;
            }
            --v5;
            *int v9 = v10;
            if (v5 == -1)
            {
              __break(1u);
              return result;
            }
          }
          result[v5] = v6;
        }
        uint64_t v4 = v3 + 1;
        uint64_t v2 = &result[v3 + 1];
      }
      while (v2 != a2);
    }
  }
  return result;
}

uint64_t sub_100026C38(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a1;
  int v5 = *(unsigned __int8 *)(*a2 + 338);
  int v6 = *(unsigned __int8 *)(*a1 + 338);
  if (*(char *)(*a2 + 338) < *(char *)(*a1 + 338)
    || v5 == v6 && *(unsigned __int16 *)(v3 + 336) < *(unsigned __int16 *)(v4 + 336))
  {
    uint64_t v7 = *a3;
    if (*(char *)(*a3 + 338) < (char)v5
      || *(unsigned __int8 *)(*a3 + 338) == v5
      && *(unsigned __int16 *)(v7 + 336) < *(unsigned __int16 *)(v3 + 336))
    {
      *a1 = v7;
      *a3 = v4;
    }
    else
    {
      *a1 = v3;
      *a2 = v4;
      uint64_t v14 = *a3;
      if (*(char *)(*a3 + 338) < (char)v6
        || *(unsigned __int8 *)(*a3 + 338) == v6
        && *(unsigned __int16 *)(v14 + 336) < *(unsigned __int16 *)(v4 + 336))
      {
        *a2 = v14;
        *a3 = v4;
        return 2;
      }
    }
    return 1;
  }
  uint64_t v9 = *a3;
  if (*(char *)(*a3 + 338) < (char)v5
    || *(unsigned __int8 *)(*a3 + 338) == v5
    && *(unsigned __int16 *)(v9 + 336) < *(unsigned __int16 *)(v3 + 336))
  {
    *a2 = v9;
    *a3 = v3;
    uint64_t v10 = *a2;
    uint64_t v11 = *a1;
    int v12 = *(char *)(*a2 + 338);
    int v13 = *(char *)(*a1 + 338);
    if (v12 < v13 || v12 == v13 && *(unsigned __int16 *)(v10 + 336) < *(unsigned __int16 *)(v11 + 336))
    {
      *a1 = v10;
      *a2 = v11;
      return 2;
    }
    return 1;
  }
  return 0;
}

unint64_t sub_100026D6C(unsigned __int16 *a1, unsigned __int16 *a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *((void *)a2 - 1);
  int v4 = *(unsigned __int8 *)(*(void *)a1 + 338);
  unint64_t v5 = *(char *)(v3 + 338);
  if (*(char *)(*(void *)a1 + 338) < (int)v5
    || v4 == *(unsigned __int8 *)(v3 + 338)
    && (unint64_t v5 = *(unsigned __int16 *)(v2 + 336), v5 < *(unsigned __int16 *)(v3 + 336)))
  {
    for (unint64_t i = (unint64_t)(a1 + 4); (unsigned __int16 *)i != a2; i += 8)
    {
      unint64_t v5 = *(void *)i;
      if (*(char *)(*(void *)i + 338) > (char)v4) {
        goto LABEL_16;
      }
      if (v4 == *(unsigned __int8 *)(*(void *)i + 338))
      {
        unint64_t v5 = *(unsigned __int16 *)(v5 + 336);
        if (*(unsigned __int16 *)(v2 + 336) < v5) {
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
    for (unint64_t i = (unint64_t)(a1 + 4);
          i < (unint64_t)a2
       && *(char *)(*(void *)i + 338) <= (char)v4
       && (v4 != *(unsigned __int8 *)(*(void *)i + 338)
        || *(unsigned __int16 *)(v2 + 336) >= *(unsigned __int16 *)(*(void *)i + 336));
LABEL_16:
    unint64_t v5 = (unint64_t)a2;
    if (i >= (unint64_t)a2) {
      goto LABEL_25;
    }
    if (a2 != a1)
    {
      unint64_t v5 = (unint64_t)(a2 - 4);
      do
      {
        if (*(char *)(*(void *)v5 + 338) <= (char)v4
          && (v4 != *(unsigned __int8 *)(*(void *)v5 + 338)
           || *(unsigned __int16 *)(v2 + 336) >= *(unsigned __int16 *)(*(void *)v5 + 336)))
        {
          goto LABEL_25;
        }
        BOOL v7 = v5 == (void)a1;
        v5 -= 8;
      }
      while (!v7);
    }
  }
LABEL_24:
  while (1)
  {
    __break(1u);
LABEL_25:
    if (i >= v5) {
      break;
    }
    unint64_t v8 = *(void *)i;
    uint64_t v9 = *(void *)v5;
LABEL_27:
    *(void *)unint64_t i = v9;
    i += 8;
    *(void *)unint64_t v5 = v8;
    while ((unsigned __int16 *)i != a2)
    {
      unint64_t v8 = *(void *)i;
      if (*(char *)(*(void *)i + 338) > (char)v4
        || v4 == *(unsigned __int8 *)(*(void *)i + 338)
        && *(unsigned __int16 *)(v2 + 336) < *(unsigned __int16 *)(v8 + 336))
      {
        if ((unsigned __int16 *)v5 == a1) {
          goto LABEL_24;
        }
        v5 -= 8;
        while (1)
        {
          uint64_t v9 = *(void *)v5;
          if (*(char *)(*(void *)v5 + 338) <= (char)v4
            && (v4 != *(unsigned __int8 *)(*(void *)v5 + 338)
             || *(unsigned __int16 *)(v2 + 336) >= *(unsigned __int16 *)(v9 + 336)))
          {
            break;
          }
          BOOL v7 = v5 == (void)a1;
          v5 -= 8;
          if (v7) {
            goto LABEL_24;
          }
        }
        if (i < v5) {
          goto LABEL_27;
        }
        goto LABEL_42;
      }
      i += 8;
    }
  }
LABEL_42:
  if ((unsigned __int16 *)(i - 8) != a1) {
    *(void *)a1 = *(void *)(i - 8);
  }
  *(void *)(i - 8) = v2;
  return i;
}

uint64_t *sub_100026F44(uint64_t *a1, uint64_t *a2)
{
  int v4 = a1 + 8;
  uint64_t v5 = *a1;
  if (a1 + 1 != a2)
  {
    int v4 = *(unsigned __int8 *)(v5 + 338);
    uint64_t v6 = 1;
    while (1)
    {
      uint64_t v3 = a1[v6];
      if (*(char *)(v3 + 338) >= (char)v4
        && (*(unsigned __int8 *)(v3 + 338) != v4
         || *(unsigned __int16 *)(v3 + 336) >= *(unsigned __int16 *)(v5 + 336)))
      {
        break;
      }
      uint64_t v2 = &a1[++v6];
      if (&a1[v6] == a2) {
        goto LABEL_16;
      }
    }
    uint64_t v2 = &a1[v6];
    if (v6 == 1) {
      goto LABEL_17;
    }
    if (a2 != a1)
    {
      BOOL v7 = a2 - 1;
      do
      {
        if (*(char *)(*v7 + 338) < (char)v4
          || *(unsigned __int8 *)(*v7 + 338) == v4
          && *(unsigned __int16 *)(*v7 + 336) < *(unsigned __int16 *)(v5 + 336))
        {
          goto LABEL_29;
        }
        BOOL v8 = v7-- == a1;
      }
      while (!v8);
    }
  }
LABEL_16:
  while (1)
  {
    __break(1u);
LABEL_17:
    BOOL v7 = a2;
    if (v2 < a2)
    {
      BOOL v7 = a2 - 1;
      uint64_t v9 = *(a2 - 1);
      if (*(char *)(v9 + 338) >= (char)v4)
      {
        int v10 = *(unsigned __int8 *)(v9 + 338);
        do
        {
          if (v10 == v4)
          {
            if (*(unsigned __int16 *)(v9 + 336) < *(unsigned __int16 *)(v5 + 336) || v2 >= v7) {
              break;
            }
          }
          else if (v2 >= v7)
          {
            break;
          }
          uint64_t v12 = *--v7;
          uint64_t v9 = v12;
          int v10 = *(unsigned __int8 *)(v12 + 338);
        }
        while (*(char *)(v12 + 338) >= (char)v4);
      }
    }
LABEL_29:
    if (v2 >= v7) {
      break;
    }
    uint64_t v13 = *v7;
    uint64_t v14 = v7;
    unint64_t v15 = v2;
LABEL_31:
    *v15++ = v13;
    *uint64_t v14 = v3;
    while (v15 != a2)
    {
      uint64_t v3 = *v15;
      if (*(char *)(*v15 + 338) >= (char)v4
        && (*(unsigned __int8 *)(*v15 + 338) != v4
         || *(unsigned __int16 *)(v3 + 336) >= *(unsigned __int16 *)(v5 + 336)))
      {
        if (v14 == a1) {
          goto LABEL_16;
        }
        --v14;
        while (1)
        {
          uint64_t v13 = *v14;
          if (*(char *)(*v14 + 338) < (char)v4
            || *(unsigned __int8 *)(*v14 + 338) == v4
            && *(unsigned __int16 *)(v13 + 336) < *(unsigned __int16 *)(v5 + 336))
          {
            break;
          }
          BOOL v8 = v14-- == a1;
          if (v8) {
            goto LABEL_16;
          }
        }
        if (v15 < v14) {
          goto LABEL_31;
        }
        goto LABEL_48;
      }
      ++v15;
    }
  }
  unint64_t v15 = v2;
LABEL_48:
  unint64_t v16 = v15 - 1;
  if (v15 - 1 != a1) {
    *a1 = *v16;
  }
  *unint64_t v16 = v5;
  return v15 - 1;
}

BOOL sub_100027130(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = a2 - a1;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v6 = *(a2 - 1);
      uint64_t v7 = *a1;
      int v8 = *(char *)(v6 + 338);
      int v9 = *(char *)(*a1 + 338);
      if (v8 < v9 || v8 == v9 && *(unsigned __int16 *)(v6 + 336) < *(unsigned __int16 *)(v7 + 336))
      {
        *a1 = v6;
        *(a2 - 1) = v7;
      }
      return result;
    case 3:
      sub_100026C38(a1, a1 + 1, a2 - 1);
      return 1;
    case 4:
      sub_100027344(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5:
      sub_100027424(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      int v10 = a1 + 2;
      sub_100026C38(a1, a1 + 1, a1 + 2);
      uint64_t v11 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    uint64_t v14 = *v11;
    uint64_t v15 = *v10;
    int v16 = *(unsigned __int8 *)(*v11 + 338);
    if (*(char *)(*v11 + 338) < *(char *)(*v10 + 338)
      || v16 == *(unsigned __int8 *)(*v10 + 338)
      && *(unsigned __int16 *)(v14 + 336) < *(unsigned __int16 *)(v15 + 336))
    {
      *uint64_t v11 = v15;
      uint64_t v17 = a1;
      if (v10 != a1)
      {
        uint64_t v18 = v12;
        while (1)
        {
          uint64_t v19 = *(uint64_t *)((char *)a1 + v18 + 8);
          if (*(char *)(v19 + 338) <= (char)v16)
          {
            if (v16 != *(unsigned __int8 *)(v19 + 338))
            {
              uint64_t v17 = v10;
              goto LABEL_20;
            }
            if (*(unsigned __int16 *)(v14 + 336) >= *(unsigned __int16 *)(v19 + 336)) {
              break;
            }
          }
          --v10;
          *(uint64_t *)((char *)a1 + v18 + 16) = v19;
          v18 -= 8;
          if (v18 == -16)
          {
            uint64_t v17 = a1;
            goto LABEL_20;
          }
        }
        uint64_t v17 = (uint64_t *)((char *)a1 + v18 + 16);
      }
LABEL_20:
      *uint64_t v17 = v14;
      if (++v13 == 8) {
        return v11 + 1 == a2;
      }
    }
    int v10 = v11;
    v12 += 8;
    if (++v11 == a2) {
      return 1;
    }
  }
}

uint64_t sub_100027344(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result = sub_100026C38(a1, a2, a3);
  uint64_t v9 = *a4;
  uint64_t v10 = *a3;
  int v11 = *(char *)(*a4 + 338);
  int v12 = *(char *)(*a3 + 338);
  if (v11 < v12 || v11 == v12 && *(unsigned __int16 *)(v9 + 336) < *(unsigned __int16 *)(v10 + 336))
  {
    *a3 = v9;
    *a4 = v10;
    uint64_t v13 = *a3;
    uint64_t v14 = *a2;
    int v15 = *(char *)(*a3 + 338);
    int v16 = *(char *)(*a2 + 338);
    if (v15 < v16 || v15 == v16 && *(unsigned __int16 *)(v13 + 336) < *(unsigned __int16 *)(v14 + 336))
    {
      *a2 = v13;
      *a3 = v14;
      uint64_t v17 = *a2;
      uint64_t v18 = *a1;
      int v19 = *(char *)(*a2 + 338);
      int v20 = *(char *)(*a1 + 338);
      if (v19 < v20 || v19 == v20 && *(unsigned __int16 *)(v17 + 336) < *(unsigned __int16 *)(v18 + 336))
      {
        *a1 = v17;
        *a2 = v18;
      }
    }
  }
  return result;
}

uint64_t sub_100027424(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t result = sub_100027344(a1, a2, a3, a4);
  uint64_t v11 = *a5;
  uint64_t v12 = *a4;
  int v13 = *(char *)(*a5 + 338);
  int v14 = *(char *)(*a4 + 338);
  if (v13 < v14 || v13 == v14 && *(unsigned __int16 *)(v11 + 336) < *(unsigned __int16 *)(v12 + 336))
  {
    *a4 = v11;
    *a5 = v12;
    uint64_t v15 = *a4;
    uint64_t v16 = *a3;
    int v17 = *(char *)(*a4 + 338);
    int v18 = *(char *)(*a3 + 338);
    if (v17 < v18 || v17 == v18 && *(unsigned __int16 *)(v15 + 336) < *(unsigned __int16 *)(v16 + 336))
    {
      *a3 = v15;
      *a4 = v16;
      uint64_t v19 = *a3;
      uint64_t v20 = *a2;
      int v21 = *(char *)(*a3 + 338);
      int v22 = *(char *)(*a2 + 338);
      if (v21 < v22 || v21 == v22 && *(unsigned __int16 *)(v19 + 336) < *(unsigned __int16 *)(v20 + 336))
      {
        *a2 = v19;
        *a3 = v20;
        uint64_t v23 = *a2;
        uint64_t v24 = *a1;
        int v25 = *(char *)(*a2 + 338);
        int v26 = *(char *)(*a1 + 338);
        if (v25 < v26
          || v25 == v26 && *(unsigned __int16 *)(v23 + 336) < *(unsigned __int16 *)(v24 + 336))
        {
          *a1 = v23;
          *a2 = v24;
        }
      }
    }
  }
  return result;
}

uint64_t *sub_10002754C(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      uint64_t v12 = &a1[v10];
      do
      {
        sub_1000276B4((uint64_t)a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    int v13 = a2;
    if (a2 != a3)
    {
      int v14 = a2;
      do
      {
        uint64_t v15 = *v14;
        uint64_t v16 = *a1;
        int v17 = *(char *)(*v14 + 338);
        int v18 = *(char *)(*a1 + 338);
        if (v17 < v18
          || v17 == v18 && *(unsigned __int16 *)(v15 + 336) < *(unsigned __int16 *)(v16 + 336))
        {
          *int v14 = v16;
          *a1 = v15;
          sub_1000276B4((uint64_t)a1, a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      int v13 = a3;
    }
    if (v8 >= 9)
    {
      uint64_t v19 = (unint64_t)v8 >> 3;
      uint64_t v20 = a2 - 1;
      do
      {
        uint64_t v21 = *a1;
        int v22 = sub_100027804(a1, a4, v19);
        if (v20 == v22)
        {
          *int v22 = v21;
        }
        else
        {
          *int v22 = *v20;
          *uint64_t v20 = v21;
          sub_100027890((uint64_t)a1, (uint64_t)(v22 + 1), a4, v22 + 1 - a1);
        }
        --v20;
      }
      while (v19-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t sub_1000276B4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 >= 2)
  {
    uint64_t v4 = (uint64_t)a4 - result;
    int64_t v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 3)
    {
      uint64_t v6 = v4 >> 2;
      uint64_t v7 = (v4 >> 2) + 1;
      uint64_t v8 = (void *)(result + 8 * v7);
      uint64_t v9 = v6 + 2;
      if (v9 < a3)
      {
        uint64_t v10 = v8[1];
        int v11 = *(char *)(*v8 + 338);
        int v12 = *(char *)(v10 + 338);
        if (v11 < v12
          || v11 == v12 && *(unsigned __int16 *)(*v8 + 336) < *(unsigned __int16 *)(v10 + 336))
        {
          ++v8;
          uint64_t v7 = v9;
        }
      }
      uint64_t v13 = *v8;
      uint64_t v14 = *a4;
      if (*(char *)(*v8 + 338) >= *(char *)(*a4 + 338))
      {
        int v15 = *(unsigned __int8 *)(*a4 + 338);
        if (*(unsigned __int8 *)(*v8 + 338) != v15
          || *(unsigned __int16 *)(v13 + 336) >= *(unsigned __int16 *)(v14 + 336))
        {
          *a4 = v13;
          if (v5 >= v7)
          {
            while (1)
            {
              uint64_t v17 = 2 * v7;
              uint64_t v7 = (2 * v7) | 1;
              uint64_t v16 = (void *)(result + 8 * v7);
              uint64_t v18 = v17 + 2;
              if (v18 < a3)
              {
                uint64_t v19 = v16[1];
                int v20 = *(char *)(*v16 + 338);
                int v21 = *(char *)(v19 + 338);
                if (v20 < v21
                  || v20 == v21 && *(unsigned __int16 *)(*v16 + 336) < *(unsigned __int16 *)(v19 + 336))
                {
                  ++v16;
                  uint64_t v7 = v18;
                }
              }
              uint64_t v22 = *v16;
              if (*(char *)(*v16 + 338) < (char)v15
                || *(unsigned __int8 *)(*v16 + 338) == v15
                && *(unsigned __int16 *)(v22 + 336) < *(unsigned __int16 *)(v14 + 336))
              {
                break;
              }
              *uint64_t v8 = v22;
              uint64_t v8 = v16;
              if (v5 < v7) {
                goto LABEL_22;
              }
            }
          }
          uint64_t v16 = v8;
LABEL_22:
          *uint64_t v16 = v14;
        }
      }
    }
  }
  return result;
}

void *sub_100027804(void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a3 - 2;
  if (a3 < 2) {
    uint64_t v4 = a3 - 1;
  }
  uint64_t v5 = v4 >> 1;
  do
  {
    uint64_t v6 = result;
    result += v3 + 1;
    uint64_t v7 = 2 * v3;
    uint64_t v3 = (2 * v3) | 1;
    uint64_t v8 = v7 + 2;
    if (v8 < a3)
    {
      uint64_t v9 = result[1];
      int v10 = *(char *)(*result + 338);
      int v11 = *(char *)(v9 + 338);
      if (v10 < v11
        || v10 == v11 && *(unsigned __int16 *)(*result + 336) < *(unsigned __int16 *)(v9 + 336))
      {
        ++result;
        uint64_t v3 = v8;
      }
    }
    *uint64_t v6 = *result;
  }
  while (v3 <= v5);
  return result;
}

uint64_t sub_100027890(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v5 = v4 >> 1;
    uint64_t v6 = (uint64_t *)(result + 8 * (v4 >> 1));
    uint64_t v7 = *v6;
    uint64_t v8 = *(void *)(a2 - 8);
    int v9 = *(unsigned __int8 *)(v8 + 338);
    if (*(char *)(*v6 + 338) < *(char *)(v8 + 338)
      || *(unsigned __int8 *)(*v6 + 338) == v9
      && *(unsigned __int16 *)(v7 + 336) < *(unsigned __int16 *)(v8 + 336))
    {
      *(void *)(a2 - 8) = v7;
      if (v4 >= 2)
      {
        while (1)
        {
          unint64_t v11 = v5 - 1;
          unint64_t v5 = (v5 - 1) >> 1;
          int v10 = (uint64_t *)(result + 8 * v5);
          uint64_t v12 = *v10;
          if (*(char *)(*v10 + 338) >= (char)v9
            && (*(unsigned __int8 *)(*v10 + 338) != v9
             || *(unsigned __int16 *)(v12 + 336) >= *(unsigned __int16 *)(v8 + 336)))
          {
            break;
          }
          *uint64_t v6 = v12;
          uint64_t v6 = (uint64_t *)(result + 8 * v5);
          if (v11 <= 1) {
            goto LABEL_11;
          }
        }
      }
      int v10 = v6;
LABEL_11:
      *int v10 = v8;
    }
  }
  return result;
}

uint64_t sub_10002793C(uint64_t result, uint64_t *a2, uint64_t a3, uint64_t a4, char a5)
{
  int v10 = (uint64_t *)result;
LABEL_2:
  unint64_t v11 = v10;
LABEL_3:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    int v10 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = a2 - v11;
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          uint64_t v25 = *(a2 - 1);
          uint64_t v26 = *v11;
          int v27 = *(char *)(v25 + 6526);
          int v28 = *(char *)(*v11 + 6526);
          if (v27 < v28
            || v27 == v28 && *(unsigned __int16 *)(v25 + 6524) < *(unsigned __int16 *)(v26 + 6524))
          {
            *unint64_t v11 = v25;
            *(a2 - 1) = v26;
          }
          break;
        case 3uLL:
          uint64_t result = sub_100027ED4(v11, v11 + 1, a2 - 1);
          break;
        case 4uLL:
          uint64_t result = sub_100028630(v11, v11 + 1, v11 + 2, a2 - 1);
          break;
        case 5uLL:
          uint64_t result = sub_10002871C(v11, v11 + 1, v11 + 2, v11 + 3, a2 - 1);
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v14 <= 191) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        return (uint64_t)sub_100028854(v11, a2, a2, a3);
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    uint64_t v17 = &v11[v15 >> 1];
    if ((unint64_t)v14 >= 0x401)
    {
      sub_100027ED4(v11, &v11[v15 >> 1], a2 - 1);
      sub_100027ED4(v11 + 1, v17 - 1, a2 - 2);
      sub_100027ED4(v11 + 2, &v11[v16 + 1], a2 - 3);
      sub_100027ED4(v17 - 1, v17, &v11[v16 + 1]);
      uint64_t v18 = *v11;
      *unint64_t v11 = *v17;
      *uint64_t v17 = v18;
      if (a5) {
        goto LABEL_16;
      }
    }
    else
    {
      sub_100027ED4(&v11[v15 >> 1], v11, a2 - 1);
      if (a5) {
        goto LABEL_16;
      }
    }
    uint64_t v19 = *(v11 - 1);
    int v20 = *(char *)(v19 + 6526);
    int v21 = *(char *)(*v11 + 6526);
    if (v20 >= v21
      && (v20 != v21 || *(unsigned __int16 *)(v19 + 6524) >= *(unsigned __int16 *)(*v11 + 6524)))
    {
      uint64_t result = sub_10002801C(v11, (unint64_t)a2);
      unint64_t v11 = (uint64_t *)result;
      goto LABEL_21;
    }
LABEL_16:
    uint64_t v22 = (uint64_t *)sub_100028214(v11, a2);
    if ((v23 & 1) == 0) {
      goto LABEL_19;
    }
    BOOL v24 = sub_100028414(v11, v22);
    unint64_t v11 = v22 + 1;
    uint64_t result = sub_100028414(v22 + 1, a2);
    if (result)
    {
      a4 = -v13;
      a2 = v22;
      if (v24) {
        return result;
      }
      goto LABEL_2;
    }
    uint64_t v12 = v13 + 1;
    if (!v24)
    {
LABEL_19:
      uint64_t result = sub_10002793C(v10, v22, a3, -v13, a5 & 1);
      unint64_t v11 = v22 + 1;
LABEL_21:
      a5 = 0;
      a4 = -v13;
      goto LABEL_3;
    }
  }
  if (a5)
  {
    return (uint64_t)sub_100027D30(v11, a2);
  }
  else
  {
    return (uint64_t)sub_100027E10(v11, a2);
  }
}

void *sub_100027D30(void *result, void *a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 1;
    if (result + 1 != a2)
    {
      uint64_t v3 = 0;
      unint64_t v4 = result;
      do
      {
        char v5 = v4;
        unint64_t v4 = v2;
        uint64_t v7 = *v5;
        uint64_t v6 = v5[1];
        int v8 = *(unsigned __int8 *)(v6 + 6526);
        if (*(char *)(v6 + 6526) < *(char *)(*v5 + 6526)
          || v8 == *(unsigned __int8 *)(*v5 + 6526)
          && *(unsigned __int16 *)(v6 + 6524) < *(unsigned __int16 *)(v7 + 6524))
        {
          v5[1] = v7;
          int v9 = result;
          if (v5 != result)
          {
            uint64_t v10 = v3;
            while (1)
            {
              uint64_t v11 = *(void *)((char *)result + v10 - 8);
              if (*(char *)(v11 + 6526) <= (char)v8)
              {
                if (v8 != *(unsigned __int8 *)(v11 + 6526))
                {
                  int v9 = v5;
                  goto LABEL_17;
                }
                if (*(unsigned __int16 *)(v6 + 6524) >= *(unsigned __int16 *)(v11 + 6524)) {
                  break;
                }
              }
              --v5;
              *(void *)((char *)result + v10) = v11;
              v10 -= 8;
              if (!v10)
              {
                int v9 = result;
                goto LABEL_17;
              }
            }
            int v9 = (void *)((char *)result + v10);
          }
LABEL_17:
          *int v9 = v6;
        }
        uint64_t v2 = v4 + 1;
        v3 += 8;
      }
      while (v4 + 1 != a2);
    }
  }
  return result;
}

uint64_t *sub_100027E10(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 1;
    if (result + 1 != a2)
    {
      uint64_t v3 = 0;
      uint64_t v4 = 1;
      do
      {
        uint64_t v5 = v3;
        uint64_t v3 = v4;
        uint64_t v6 = *v2;
        uint64_t v7 = result[v5];
        int v8 = *(unsigned __int8 *)(*v2 + 6526);
        if (*(char *)(*v2 + 6526) < *(char *)(v7 + 6526)
          || v8 == *(unsigned __int8 *)(v7 + 6526)
          && *(unsigned __int16 *)(v6 + 6524) < *(unsigned __int16 *)(v7 + 6524))
        {
          *uint64_t v2 = v7;
          while (1)
          {
            int v9 = &result[v5];
            uint64_t v10 = *(v9 - 1);
            if (*(char *)(v10 + 6526) <= (char)v8
              && (v8 != *(unsigned __int8 *)(v10 + 6526)
               || *(unsigned __int16 *)(v6 + 6524) >= *(unsigned __int16 *)(v10 + 6524)))
            {
              break;
            }
            --v5;
            *int v9 = v10;
            if (v5 == -1)
            {
              __break(1u);
              return result;
            }
          }
          result[v5] = v6;
        }
        uint64_t v4 = v3 + 1;
        uint64_t v2 = &result[v3 + 1];
      }
      while (v2 != a2);
    }
  }
  return result;
}

uint64_t sub_100027ED4(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a1;
  int v5 = *(unsigned __int8 *)(*a2 + 6526);
  int v6 = *(unsigned __int8 *)(*a1 + 6526);
  if (*(char *)(*a2 + 6526) < *(char *)(*a1 + 6526)
    || v5 == v6 && *(unsigned __int16 *)(v3 + 6524) < *(unsigned __int16 *)(v4 + 6524))
  {
    uint64_t v7 = *a3;
    if (*(char *)(*a3 + 6526) < (char)v5
      || *(unsigned __int8 *)(*a3 + 6526) == v5
      && *(unsigned __int16 *)(v7 + 6524) < *(unsigned __int16 *)(v3 + 6524))
    {
      *a1 = v7;
      *a3 = v4;
    }
    else
    {
      *a1 = v3;
      *a2 = v4;
      uint64_t v14 = *a3;
      if (*(char *)(*a3 + 6526) < (char)v6
        || *(unsigned __int8 *)(*a3 + 6526) == v6
        && *(unsigned __int16 *)(v14 + 6524) < *(unsigned __int16 *)(v4 + 6524))
      {
        *a2 = v14;
        *a3 = v4;
        return 2;
      }
    }
    return 1;
  }
  uint64_t v9 = *a3;
  if (*(char *)(*a3 + 6526) < (char)v5
    || *(unsigned __int8 *)(*a3 + 6526) == v5
    && *(unsigned __int16 *)(v9 + 6524) < *(unsigned __int16 *)(v3 + 6524))
  {
    *a2 = v9;
    *a3 = v3;
    uint64_t v10 = *a2;
    uint64_t v11 = *a1;
    int v12 = *(char *)(*a2 + 6526);
    int v13 = *(char *)(*a1 + 6526);
    if (v12 < v13 || v12 == v13 && *(unsigned __int16 *)(v10 + 6524) < *(unsigned __int16 *)(v11 + 6524))
    {
      *a1 = v10;
      *a2 = v11;
      return 2;
    }
    return 1;
  }
  return 0;
}

unint64_t sub_10002801C(uint64_t *a1, unint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(a2 - 8);
  int v4 = *(unsigned __int8 *)(*a1 + 6526);
  unint64_t v5 = *(char *)(v3 + 6526);
  if (*(char *)(*a1 + 6526) < (int)v5
    || v4 == *(unsigned __int8 *)(v3 + 6526)
    && (unint64_t v5 = *(unsigned __int16 *)(v2 + 6524), v5 < *(unsigned __int16 *)(v3 + 6524)))
  {
    unint64_t i = (unint64_t)(a1 + 1);
    if (a1 + 1 == (uint64_t *)a2) {
      goto LABEL_24;
    }
    unint64_t v5 = 6526;
    while (*(char *)(*(void *)i + 6526) <= (char)v4
         && (v4 != *(unsigned __int8 *)(*(void *)i + 6526)
          || *(unsigned __int16 *)(v2 + 6524) >= *(unsigned __int16 *)(*(void *)i + 6524)))
    {
      i += 8;
      if (i == a2) {
        goto LABEL_24;
      }
    }
  }
  else
  {
    for (unint64_t i = (unint64_t)(a1 + 1); i < a2; i += 8)
    {
      if (*(char *)(*(void *)i + 6526) > (char)v4
        || v4 == *(unsigned __int8 *)(*(void *)i + 6526)
        && *(unsigned __int16 *)(v2 + 6524) < *(unsigned __int16 *)(*(void *)i + 6524))
      {
        break;
      }
    }
  }
  unint64_t v5 = a2;
  if (i >= a2) {
    goto LABEL_25;
  }
  if ((uint64_t *)a2 != a1)
  {
    unint64_t v5 = a2 - 8;
    do
    {
      if (*(char *)(*(void *)v5 + 6526) <= (char)v4
        && (v4 != *(unsigned __int8 *)(*(void *)v5 + 6526)
         || *(unsigned __int16 *)(v2 + 6524) >= *(unsigned __int16 *)(*(void *)v5 + 6524)))
      {
        goto LABEL_25;
      }
      BOOL v7 = v5 == (void)a1;
      v5 -= 8;
    }
    while (!v7);
  }
LABEL_24:
  while (1)
  {
    __break(1u);
LABEL_25:
    if (i >= v5) {
      break;
    }
    uint64_t v8 = *(void *)i;
    uint64_t v9 = *(void *)v5;
LABEL_27:
    *(void *)unint64_t i = v9;
    i += 8;
    *(void *)unint64_t v5 = v8;
    while (i != a2)
    {
      uint64_t v8 = *(void *)i;
      if (*(char *)(*(void *)i + 6526) > (char)v4
        || v4 == *(unsigned __int8 *)(*(void *)i + 6526)
        && *(unsigned __int16 *)(v2 + 6524) < *(unsigned __int16 *)(v8 + 6524))
      {
        if ((uint64_t *)v5 == a1) {
          goto LABEL_24;
        }
        v5 -= 8;
        while (1)
        {
          uint64_t v9 = *(void *)v5;
          if (*(char *)(*(void *)v5 + 6526) <= (char)v4
            && (v4 != *(unsigned __int8 *)(*(void *)v5 + 6526)
             || *(unsigned __int16 *)(v2 + 6524) >= *(unsigned __int16 *)(v9 + 6524)))
          {
            break;
          }
          BOOL v7 = v5 == (void)a1;
          v5 -= 8;
          if (v7) {
            goto LABEL_24;
          }
        }
        if (i < v5) {
          goto LABEL_27;
        }
        goto LABEL_42;
      }
      i += 8;
    }
  }
LABEL_42:
  if ((uint64_t *)(i - 8) != a1) {
    *a1 = *(void *)(i - 8);
  }
  *(void *)(i - 8) = v2;
  return i;
}

unint64_t sub_100028214(uint64_t *a1, uint64_t *a2)
{
  int v4 = a1 + 8;
  uint64_t v5 = *a1;
  if (a1 + 1 != a2)
  {
    unint64_t v2 = 6526;
    int v4 = *(unsigned __int8 *)(v5 + 6526);
    uint64_t v6 = 1;
    while (1)
    {
      uint64_t v3 = (uint64_t *)a1[v6];
      if (*((char *)v3 + 6526) >= (char)v4
        && (*((unsigned __int8 *)v3 + 6526) != v4
         || *((unsigned __int16 *)v3 + 3262) >= *(unsigned __int16 *)(v5 + 6524)))
      {
        break;
      }
      uint64_t v3 = &a1[++v6];
      if (&a1[v6] == a2) {
        goto LABEL_16;
      }
    }
    unint64_t v2 = (unint64_t)&a1[v6];
    if (v6 == 1) {
      goto LABEL_17;
    }
    if (a2 != a1)
    {
      BOOL v7 = a2 - 1;
      do
      {
        if (*(char *)(*v7 + 6526) < (char)v4
          || *(unsigned __int8 *)(*v7 + 6526) == v4
          && *(unsigned __int16 *)(*v7 + 6524) < *(unsigned __int16 *)(v5 + 6524))
        {
          goto LABEL_29;
        }
        BOOL v8 = v7-- == a1;
      }
      while (!v8);
    }
  }
LABEL_16:
  while (1)
  {
    __break(1u);
LABEL_17:
    BOOL v7 = a2;
    if (v2 < (unint64_t)a2)
    {
      BOOL v7 = a2 - 1;
      uint64_t v9 = *(a2 - 1);
      if (*(char *)(v9 + 6526) >= (char)v4)
      {
        int v10 = *(unsigned __int8 *)(v9 + 6526);
        do
        {
          if (v10 == v4)
          {
            if (*(unsigned __int16 *)(v9 + 6524) < *(unsigned __int16 *)(v5 + 6524)
              || v2 >= (unint64_t)v7)
            {
              break;
            }
          }
          else if (v2 >= (unint64_t)v7)
          {
            break;
          }
          uint64_t v12 = *--v7;
          uint64_t v9 = v12;
          int v10 = *(unsigned __int8 *)(v12 + 6526);
        }
        while (*(char *)(v12 + 6526) >= (char)v4);
      }
    }
LABEL_29:
    if (v2 >= (unint64_t)v7) {
      break;
    }
    uint64_t v13 = *v7;
    uint64_t v14 = v7;
    unint64_t v15 = v2;
LABEL_31:
    *(void *)unint64_t v15 = v13;
    v15 += 8;
    *uint64_t v14 = (uint64_t)v3;
    while ((uint64_t *)v15 != a2)
    {
      uint64_t v3 = *(uint64_t **)v15;
      if (*(char *)(*(void *)v15 + 6526) >= (char)v4
        && (*(unsigned __int8 *)(*(void *)v15 + 6526) != v4
         || *((unsigned __int16 *)v3 + 3262) >= *(unsigned __int16 *)(v5 + 6524)))
      {
        if (v14 == a1) {
          goto LABEL_16;
        }
        --v14;
        while (1)
        {
          uint64_t v13 = *v14;
          if (*(char *)(*v14 + 6526) < (char)v4
            || *(unsigned __int8 *)(*v14 + 6526) == v4
            && *(unsigned __int16 *)(v13 + 6524) < *(unsigned __int16 *)(v5 + 6524))
          {
            break;
          }
          BOOL v8 = v14-- == a1;
          if (v8) {
            goto LABEL_16;
          }
        }
        if (v15 < (unint64_t)v14) {
          goto LABEL_31;
        }
        goto LABEL_48;
      }
      v15 += 8;
    }
  }
  unint64_t v15 = v2;
LABEL_48:
  unint64_t v16 = (uint64_t *)(v15 - 8);
  if ((uint64_t *)(v15 - 8) != a1) {
    *a1 = *v16;
  }
  *unint64_t v16 = v5;
  return v15 - 8;
}

BOOL sub_100028414(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = a2 - a1;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v6 = *(a2 - 1);
      uint64_t v7 = *a1;
      int v8 = *(char *)(v6 + 6526);
      int v9 = *(char *)(*a1 + 6526);
      if (v8 < v9 || v8 == v9 && *(unsigned __int16 *)(v6 + 6524) < *(unsigned __int16 *)(v7 + 6524))
      {
        *a1 = v6;
        *(a2 - 1) = v7;
      }
      return result;
    case 3:
      sub_100027ED4(a1, a1 + 1, a2 - 1);
      return 1;
    case 4:
      sub_100028630(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5:
      sub_10002871C(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      int v10 = a1 + 2;
      sub_100027ED4(a1, a1 + 1, a1 + 2);
      uint64_t v11 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    uint64_t v14 = *v11;
    uint64_t v15 = *v10;
    int v16 = *(unsigned __int8 *)(*v11 + 6526);
    if (*(char *)(*v11 + 6526) < *(char *)(*v10 + 6526)
      || v16 == *(unsigned __int8 *)(*v10 + 6526)
      && *(unsigned __int16 *)(v14 + 6524) < *(unsigned __int16 *)(v15 + 6524))
    {
      *uint64_t v11 = v15;
      uint64_t v17 = a1;
      if (v10 != a1)
      {
        uint64_t v18 = v12;
        while (1)
        {
          uint64_t v19 = *(uint64_t *)((char *)a1 + v18 + 8);
          if (*(char *)(v19 + 6526) <= (char)v16)
          {
            if (v16 != *(unsigned __int8 *)(v19 + 6526))
            {
              uint64_t v17 = v10;
              goto LABEL_20;
            }
            if (*(unsigned __int16 *)(v14 + 6524) >= *(unsigned __int16 *)(v19 + 6524)) {
              break;
            }
          }
          --v10;
          *(uint64_t *)((char *)a1 + v18 + 16) = v19;
          v18 -= 8;
          if (v18 == -16)
          {
            uint64_t v17 = a1;
            goto LABEL_20;
          }
        }
        uint64_t v17 = (uint64_t *)((char *)a1 + v18 + 16);
      }
LABEL_20:
      *uint64_t v17 = v14;
      if (++v13 == 8) {
        return v11 + 1 == a2;
      }
    }
    int v10 = v11;
    v12 += 8;
    if (++v11 == a2) {
      return 1;
    }
  }
}

uint64_t sub_100028630(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result = sub_100027ED4(a1, a2, a3);
  uint64_t v9 = *a4;
  uint64_t v10 = *a3;
  int v11 = *(char *)(*a4 + 6526);
  int v12 = *(char *)(*a3 + 6526);
  if (v11 < v12 || v11 == v12 && *(unsigned __int16 *)(v9 + 6524) < *(unsigned __int16 *)(v10 + 6524))
  {
    *a3 = v9;
    *a4 = v10;
    uint64_t v13 = *a3;
    uint64_t v14 = *a2;
    int v15 = *(char *)(*a3 + 6526);
    int v16 = *(char *)(*a2 + 6526);
    if (v15 < v16 || v15 == v16 && *(unsigned __int16 *)(v13 + 6524) < *(unsigned __int16 *)(v14 + 6524))
    {
      *a2 = v13;
      *a3 = v14;
      uint64_t v17 = *a2;
      uint64_t v18 = *a1;
      int v19 = *(char *)(*a2 + 6526);
      int v20 = *(char *)(*a1 + 6526);
      if (v19 < v20
        || v19 == v20 && *(unsigned __int16 *)(v17 + 6524) < *(unsigned __int16 *)(v18 + 6524))
      {
        *a1 = v17;
        *a2 = v18;
      }
    }
  }
  return result;
}

uint64_t sub_10002871C(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t result = sub_100028630(a1, a2, a3, a4);
  uint64_t v11 = *a5;
  uint64_t v12 = *a4;
  int v13 = *(char *)(*a5 + 6526);
  int v14 = *(char *)(*a4 + 6526);
  if (v13 < v14 || v13 == v14 && *(unsigned __int16 *)(v11 + 6524) < *(unsigned __int16 *)(v12 + 6524))
  {
    *a4 = v11;
    *a5 = v12;
    uint64_t v15 = *a4;
    uint64_t v16 = *a3;
    int v17 = *(char *)(*a4 + 6526);
    int v18 = *(char *)(*a3 + 6526);
    if (v17 < v18 || v17 == v18 && *(unsigned __int16 *)(v15 + 6524) < *(unsigned __int16 *)(v16 + 6524))
    {
      *a3 = v15;
      *a4 = v16;
      uint64_t v19 = *a3;
      uint64_t v20 = *a2;
      int v21 = *(char *)(*a3 + 6526);
      int v22 = *(char *)(*a2 + 6526);
      if (v21 < v22
        || v21 == v22 && *(unsigned __int16 *)(v19 + 6524) < *(unsigned __int16 *)(v20 + 6524))
      {
        *a2 = v19;
        *a3 = v20;
        uint64_t v23 = *a2;
        uint64_t v24 = *a1;
        int v25 = *(char *)(*a2 + 6526);
        int v26 = *(char *)(*a1 + 6526);
        if (v25 < v26
          || v25 == v26 && *(unsigned __int16 *)(v23 + 6524) < *(unsigned __int16 *)(v24 + 6524))
        {
          *a1 = v23;
          *a2 = v24;
        }
      }
    }
  }
  return result;
}

uint64_t *sub_100028854(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      uint64_t v12 = &a1[v10];
      do
      {
        sub_1000289C0((uint64_t)a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    int v13 = a2;
    if (a2 != a3)
    {
      int v14 = a2;
      do
      {
        uint64_t v15 = *v14;
        uint64_t v16 = *a1;
        int v17 = *(char *)(*v14 + 6526);
        int v18 = *(char *)(*a1 + 6526);
        if (v17 < v18
          || v17 == v18 && *(unsigned __int16 *)(v15 + 6524) < *(unsigned __int16 *)(v16 + 6524))
        {
          *int v14 = v16;
          *a1 = v15;
          sub_1000289C0((uint64_t)a1, a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      int v13 = a3;
    }
    if (v8 >= 9)
    {
      uint64_t v19 = (unint64_t)v8 >> 3;
      uint64_t v20 = a2 - 1;
      do
      {
        uint64_t v21 = *a1;
        int v22 = sub_100028B1C(a1, a4, v19);
        if (v20 == v22)
        {
          *int v22 = v21;
        }
        else
        {
          *int v22 = *v20;
          *uint64_t v20 = v21;
          sub_100028BAC((uint64_t)a1, (uint64_t)(v22 + 1), a4, v22 + 1 - a1);
        }
        --v20;
      }
      while (v19-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t sub_1000289C0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 >= 2)
  {
    uint64_t v4 = (uint64_t)a4 - result;
    int64_t v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 3)
    {
      uint64_t v6 = v4 >> 2;
      uint64_t v7 = (v4 >> 2) + 1;
      uint64_t v8 = (void *)(result + 8 * v7);
      uint64_t v9 = v6 + 2;
      if (v9 < a3)
      {
        uint64_t v10 = v8[1];
        int v11 = *(char *)(*v8 + 6526);
        int v12 = *(char *)(v10 + 6526);
        if (v11 < v12
          || v11 == v12 && *(unsigned __int16 *)(*v8 + 6524) < *(unsigned __int16 *)(v10 + 6524))
        {
          ++v8;
          uint64_t v7 = v9;
        }
      }
      uint64_t v13 = *v8;
      uint64_t v14 = *a4;
      if (*(char *)(*v8 + 6526) >= *(char *)(*a4 + 6526))
      {
        int v15 = *(unsigned __int8 *)(*a4 + 6526);
        if (*(unsigned __int8 *)(*v8 + 6526) != v15
          || *(unsigned __int16 *)(v13 + 6524) >= *(unsigned __int16 *)(v14 + 6524))
        {
          *a4 = v13;
          if (v5 >= v7)
          {
            while (1)
            {
              uint64_t v17 = 2 * v7;
              uint64_t v7 = (2 * v7) | 1;
              uint64_t v16 = (void *)(result + 8 * v7);
              uint64_t v18 = v17 + 2;
              if (v18 < a3)
              {
                uint64_t v19 = v16[1];
                int v20 = *(char *)(*v16 + 6526);
                int v21 = *(char *)(v19 + 6526);
                if (v20 < v21
                  || v20 == v21
                  && *(unsigned __int16 *)(*v16 + 6524) < *(unsigned __int16 *)(v19 + 6524))
                {
                  ++v16;
                  uint64_t v7 = v18;
                }
              }
              uint64_t v22 = *v16;
              if (*(char *)(*v16 + 6526) < (char)v15
                || *(unsigned __int8 *)(*v16 + 6526) == v15
                && *(unsigned __int16 *)(v22 + 6524) < *(unsigned __int16 *)(v14 + 6524))
              {
                break;
              }
              *uint64_t v8 = v22;
              uint64_t v8 = v16;
              if (v5 < v7) {
                goto LABEL_22;
              }
            }
          }
          uint64_t v16 = v8;
LABEL_22:
          *uint64_t v16 = v14;
        }
      }
    }
  }
  return result;
}

void *sub_100028B1C(void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a3 - 2;
  if (a3 < 2) {
    uint64_t v4 = a3 - 1;
  }
  uint64_t v5 = v4 >> 1;
  do
  {
    uint64_t v6 = result;
    result += v3 + 1;
    uint64_t v7 = 2 * v3;
    uint64_t v3 = (2 * v3) | 1;
    uint64_t v8 = v7 + 2;
    if (v8 < a3)
    {
      uint64_t v9 = result[1];
      int v10 = *(char *)(*result + 6526);
      int v11 = *(char *)(v9 + 6526);
      if (v10 < v11
        || v10 == v11 && *(unsigned __int16 *)(*result + 6524) < *(unsigned __int16 *)(v9 + 6524))
      {
        ++result;
        uint64_t v3 = v8;
      }
    }
    *uint64_t v6 = *result;
  }
  while (v3 <= v5);
  return result;
}

uint64_t sub_100028BAC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v5 = v4 >> 1;
    uint64_t v6 = (uint64_t *)(result + 8 * (v4 >> 1));
    uint64_t v7 = *v6;
    uint64_t v8 = *(void *)(a2 - 8);
    int v9 = *(unsigned __int8 *)(v8 + 6526);
    if (*(char *)(*v6 + 6526) < *(char *)(v8 + 6526)
      || *(unsigned __int8 *)(*v6 + 6526) == v9
      && *(unsigned __int16 *)(v7 + 6524) < *(unsigned __int16 *)(v8 + 6524))
    {
      *(void *)(a2 - 8) = v7;
      if (v4 >= 2)
      {
        while (1)
        {
          unint64_t v11 = v5 - 1;
          unint64_t v5 = (v5 - 1) >> 1;
          int v10 = (uint64_t *)(result + 8 * v5);
          uint64_t v12 = *v10;
          if (*(char *)(*v10 + 6526) >= (char)v9
            && (*(unsigned __int8 *)(*v10 + 6526) != v9
             || *(unsigned __int16 *)(v12 + 6524) >= *(unsigned __int16 *)(v8 + 6524)))
          {
            break;
          }
          *uint64_t v6 = v12;
          uint64_t v6 = (uint64_t *)(result + 8 * v5);
          if (v11 <= 1) {
            goto LABEL_11;
          }
        }
      }
      int v10 = v6;
LABEL_11:
      *int v10 = v8;
    }
  }
  return result;
}

uint64_t AMFDRCreateInstanceString()
{
  return _AMFDRCreateInstanceString();
}

uint64_t AMFDRGetTrustError()
{
  return _AMFDRGetTrustError();
}

uint64_t AMFDRLogSetHandler()
{
  return _AMFDRLogSetHandler();
}

uint64_t AMFDRSealingManifestCopyMultiInstanceForClass()
{
  return _AMFDRSealingManifestCopyMultiInstanceForClass();
}

uint64_t AMFDRSealingMapCopyInstanceForClass()
{
  return _AMFDRSealingMapCopyInstanceForClass();
}

uint64_t AMFDRSealingMapCopyLocalData()
{
  return _AMFDRSealingMapCopyLocalData();
}

uint64_t AMFDRSealingMapCopyLocalDict()
{
  return _AMFDRSealingMapCopyLocalDict();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return _CC_MD5_Final(md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return _CC_MD5_Init(c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return _CC_MD5_Update(c, data, len);
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

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

uint64_t IOMobileFramebufferGetMainDisplay()
{
  return _IOMobileFramebufferGetMainDisplay();
}

uint64_t IOMobileFramebufferGetServiceObject()
{
  return _IOMobileFramebufferGetServiceObject();
}

uint64_t IOMobileFramebufferRequestPowerChange()
{
  return _IOMobileFramebufferRequestPowerChange();
}

uint64_t IOMobileFramebufferSetBlock()
{
  return _IOMobileFramebufferSetBlock();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IORegistryEntryGetProperty(io_registry_entry_t entry, const io_name_t propertyName, io_struct_inband_t buffer, uint32_t *size)
{
  return _IORegistryEntryGetProperty(entry, propertyName, buffer, size);
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

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

uint64_t std::istream::sentry::sentry()
{
  return std::istream::sentry::sentry();
}

uint64_t std::iostream::~basic_iostream()
{
  return std::iostream::~basic_iostream();
}

uint64_t std::streambuf::basic_streambuf()
{
  return std::streambuf::basic_streambuf();
}

uint64_t std::streambuf::~streambuf()
{
  return std::streambuf::~streambuf();
}

uint64_t std::__sort<std::__less<int,int> &,int *>()
{
  return std::__sort<std::__less<int,int> &,int *>();
}

uint64_t std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>()
{
  return std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>();
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return std::ios::~ios();
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

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
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
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

double atof(const char *a1)
{
  return _atof(a1);
}

void bzero(void *a1, size_t a2)
{
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

FILE *__cdecl funopen(const void *a1, int (__cdecl *a2)(void *, char *, int), int (__cdecl *a3)(void *, const char *, int), fpos_t (__cdecl *a4)(void *, fpos_t, int), int (__cdecl *a5)(void *))
{
  return _funopen(a1, a2, a3, a4, a5);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int glob(const char *a1, int a2, int (__cdecl *a3)(const char *, int), glob_t *a4)
{
  return _glob(a1, a2, a3, a4);
}

void globfree(glob_t *a1)
{
}

void *__cdecl malloc_type_aligned_alloc(size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_aligned_alloc(alignment, size, type_id);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int putchar(int a1)
{
  return _putchar(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return _vfprintf(a1, a2, a3);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return _wmemchr(__s, __c, __n);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}