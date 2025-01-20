uint64_t sub_1000038A4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t result;
  uint64_t v8;

  if (*(_DWORD *)(a1 + 48) != 1) {
    return 0;
  }
  v2 = *(void *)(a1 + 8);
  v3 = *(void *)(a1 + 40);
  v4 = v3 + v2;
  if (__CFADD__(v3, v2)) {
    return 12;
  }
  v5 = (char *)malloc_type_realloc(*(void **)a1, v3 + v2, 0x39D072A3uLL);
  if (!v5) {
    return 12;
  }
  v6 = v5;
  result = 0;
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v4;
  v8 = *(void *)(a1 + 40);
  *(void *)(a1 + 24) = &v6[v2];
  *(void *)(a1 + 32) = v8;
  return result;
}

uint64_t sub_100003928(uint64_t a1, char *__src, unint64_t a3, int a4)
{
  if (a4) {
    unint64_t v4 = a3;
  }
  else {
    unint64_t v4 = (a3 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  }
  if (!v4) {
    return 0;
  }
  size_t v5 = a3;
  size_t v8 = *(void *)(a1 + 32);
  while (1)
  {
    if (!v8)
    {
      uint64_t result = sub_1000038A4(a1);
      if (result) {
        return result;
      }
      size_t v8 = *(void *)(a1 + 32);
      if (!v8) {
        break;
      }
    }
    if (v8 >= v4) {
      size_t v10 = v4;
    }
    else {
      size_t v10 = v8;
    }
    if (v5)
    {
      if (v10 >= v5) {
        size_t v10 = v5;
      }
      memmove(*(void **)(a1 + 24), __src, v10);
      size_t v8 = *(void *)(a1 + 32) - v10;
      *(void *)(a1 + 24) += v10;
      *(void *)(a1 + 32) = v8;
      __src += v10;
      v5 -= v10;
    }
    else
    {
      bzero(*(void **)(a1 + 24), v10);
      size_t v8 = *(void *)(a1 + 32) - v10;
      *(void *)(a1 + 24) += v10;
      *(void *)(a1 + 32) = v8;
    }
    v4 -= v10;
    if (!v4) {
      return 0;
    }
  }
  return 12;
}

void sub_100003A00(int a1, char *a2, ...)
{
  va_start(va, a2);
  if ((dword_100010928 & 0x400000) != 0) {
    vsyslog(3, a2, va);
  }
  verrx(a1, a2, va);
}

void *sub_100003A54()
{
  v0 = (char *)malloc_type_malloc(0x330uLL, 0x1050040AE3C178BuLL);
  qword_100010908 = (uint64_t)v0;
  if (!v0) {
    sub_100003A00(12, "memory allocation failed");
  }
  v1 = v0;
  uint64_t result = memmove(v0, &off_1000105C8, 0x330uLL);
  uint64_t v3 = &dword_100000008;
  do
  {
    *(_DWORD *)&v1[v3] = *(_DWORD *)((char *)&off_1000105C8 + v3) == 0;
    v3 += 24;
  }
  while (v3 != 824);
  return result;
}

uint64_t sub_10000486C(const char *a1, uint64_t a2)
{
  size_t v24 = 0;
  size_t v25 = 0;
  uint64_t v3 = fopen(a1, "r");
  if (v3)
  {
    unint64_t v4 = v3;
    size_t v5 = fparseln(v3, &v25, &v24, 0, 0);
    if (v5)
    {
      v6 = v5;
      do
      {
        if (v25)
        {
          for (i = &v6[v25 - 1]; i > v6; --i)
          {
            __darwin_ct_rune_t v8 = *i;
            if (v8 < 0)
            {
              if (!__maskrune(v8, 0x4000uLL)) {
                break;
              }
            }
            else if ((_DefaultRuneLocale.__runetype[v8] & 0x4000) == 0)
            {
              break;
            }
            char *i = 0;
          }
          v9 = v6 - 1;
          do
          {
            __darwin_ct_rune_t v10 = v9[1];
            if (v10 < 0) {
              __uint32_t v11 = __maskrune(v10, 0x4000uLL);
            }
            else {
              __uint32_t v11 = _DefaultRuneLocale.__runetype[v10] & 0x4000;
            }
            ++v9;
          }
          while (v11);
          v12 = strchr(v6, 61);
          v13 = v12;
          if (v12)
          {
            v14 = v12 - 1;
            do
            {
              v14[1] = 0;
              if (v14 <= v6) {
                break;
              }
              __darwin_ct_rune_t v15 = *v14;
              __uint32_t v16 = v15 < 0 ? __maskrune(v15, 0x4000uLL) : _DefaultRuneLocale.__runetype[v15] & 0x4000;
              --v14;
            }
            while (v16);
            v17 = v13;
            do
            {
              while (1)
              {
                __darwin_ct_rune_t v19 = *++v17;
                __darwin_ct_rune_t v18 = v19;
                if (v19 < 0) {
                  break;
                }
                if ((_DefaultRuneLocale.__runetype[v18] & 0x4000) == 0) {
                  goto LABEL_29;
                }
              }
            }
            while (__maskrune(v18, 0x4000uLL));
LABEL_29:
            if (!strncmp(v9, "nfs.client.", 0xBuLL))
            {
              uint64_t v21 = strtol(v17, 0, 0);
              v20 = v17;
LABEL_36:
              if (dword_100010920) {
                printf("%4ld %s=%s (%ld)\n", v24, v9, v17, v21);
              }
              if (!strcmp(v9, "nfs.client.access_cache_timeout"))
              {
                if (v13 && v21) {
                  *(_DWORD *)a2 = v21;
                }
              }
              else if (!strcmp(v9, "nfs.client.access_for_getattr"))
              {
                *(_DWORD *)(a2 + 4) = v21;
              }
              else if (!strcmp(v9, "nfs.client.allow_async"))
              {
                *(_DWORD *)(a2 + 8) = v21;
              }
              else if (!strcmp(v9, "nfs.client.callback_port"))
              {
                if (v13 && v21) {
                  *(_DWORD *)(a2 + 12) = v21;
                }
              }
              else if (!strcmp(v9, "nfs.client.initialdowndelay"))
              {
                *(_DWORD *)(a2 + 16) = v21;
              }
              else if (!strcmp(v9, "nfs.client.iosize"))
              {
                if (v13 && v21) {
                  *(_DWORD *)(a2 + 20) = v21;
                }
              }
              else if (!strcmp(v9, "nfs.client.mount.options"))
              {
                sub_100004DD8(v20);
              }
              else if (!strcmp(v9, "nfs.client.nextdowndelay"))
              {
                *(_DWORD *)(a2 + 24) = v21;
              }
              else if (!strcmp(v9, "nfs.client.nfsiod_thread_max"))
              {
                if (v13) {
                  *(_DWORD *)(a2 + 28) = v21;
                }
              }
              else if (!strcmp(v9, "nfs.client.statfs_rate_limit"))
              {
                if (v13 && v21) {
                  *(_DWORD *)(a2 + 32) = v21;
                }
              }
              else if (!strcmp(v9, "nfs.client.is_mobile"))
              {
                *(_DWORD *)(a2 + 36) = v21;
              }
              else if (!strcmp(v9, "nfs.client.squishy_flags"))
              {
                if (v13 && v21) {
                  *(_DWORD *)(a2 + 40) = v21;
                }
              }
              else if (!strcmp(v9, "nfs.client.root_steals_gss_context"))
              {
                if (v13 && v21) {
                  *(_DWORD *)(a2 + 44) = v21;
                }
              }
              else if (!strcmp(v9, "nfs.client.default_nfs4domain"))
              {
                if (v13) {
                  *(void *)(a2 + 56) = strndup(v20, 0x400uLL);
                }
              }
              else if (!strcmp(v9, "nfs.client.mount_timeout"))
              {
                if (v13 && v21) {
                  *(_DWORD *)(a2 + 48) = v21;
                }
              }
              else if (!strcmp(v9, "nfs.client.mount_quick_timeout"))
              {
                if (v13 && v21) {
                  *(_DWORD *)(a2 + 52) = v21;
                }
              }
              else if (dword_100010920)
              {
                printf("ignoring unknown config value: %4ld %s=%s\n");
              }
              goto LABEL_90;
            }
          }
          else
          {
            v20 = 0;
            if (!strncmp(v9, "nfs.client.", 0xBuLL))
            {
              v17 = (const char *)&unk_10000B33F;
              uint64_t v21 = 1;
              goto LABEL_36;
            }
          }
          if (dword_100010920 >= 2) {
            printf("%4ld %s=%s\n");
          }
        }
LABEL_90:
        free(v6);
        v6 = fparseln(v4, &v25, &v24, 0, 0);
      }
      while (v6);
    }
    fclose(v4);
    return 0;
  }
  else
  {
    if (*__error() != 2) {
      warn("%s", a1);
    }
    return 1;
  }
}

uint64_t sub_100004D70(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)&xmmword_10001093C = 0;
    LODWORD(qword_10001092C) = qword_10001092C & 0xF7FFFFF9 | 0x8000000;
    DWORD2(xmmword_10001093C) = a2;
    HIDWORD(xmmword_10001093C) = result;
  }
  else
  {
    int v2 = qword_10001092C & 0xF7FFFFFB;
    LODWORD(qword_10001092C) = qword_10001092C & 0xF7FFFFF9 | 2;
    xmmword_10001093C = WORD1(result);
    if ((_WORD)result)
    {
      LODWORD(qword_10001092C) = v2 | 6;
      DWORD1(xmmword_10001093C) = (unsigned __int16)result;
    }
  }
  return result;
}

void sub_100004DD8(const char *a1)
{
  getmnt_silent = 1;
  if (!getmntopts()) {
    goto LABEL_13;
  }
  if (dword_100010928) {
    LODWORD(qword_10001092C) = qword_10001092C | 0x400000;
  }
  freemntopts();
  if (!getmntopts()) {
    goto LABEL_13;
  }
  if (dword_100010920 >= 3) {
    printf("altflags=0x%x\n", 0);
  }
  freemntopts();
  if (!getmntopts()) {
LABEL_13:
  }
    sub_100003A00(22, "getmntops failed: %s", a1);
  if (dword_100010920 >= 3) {
    printf("negative altflags=0x%x\n", 0);
  }
  freemntopts();
  if (qword_1000109F4) {
    LODWORD(qword_10001092C) = qword_10001092C | 0x4000;
  }
  sub_10000982C(a1);
}

void sub_100006788()
{
  if ((void)xmmword_100010AC8) {
    BOOL v0 = 0;
  }
  else {
    BOOL v0 = qword_100010AC0 == 0;
  }
  if (v0 && *((void *)&xmmword_100010AC8 + 1) == 0) {
    return;
  }
  if (!qword_1000109C4)
  {
    sub_10000A0AC();
    uint64_t v3 = "no sec flavors specified for principal or realm, assuming kerberos";
LABEL_19:
    warnx(v3);
    return;
  }
  if ((int)qword_1000109C4 < 1)
  {
    LODWORD(v2) = 0;
  }
  else
  {
    uint64_t v2 = 0;
    uint64_t v3 = "principal or realm specified but no kerberos is enabled";
    while ((dword_100010928[v2 + 40] - 390003) >= 3)
    {
      if (qword_1000109C4 == ++v2) {
        goto LABEL_19;
      }
    }
  }
  if (v2 == qword_1000109C4)
  {
    uint64_t v3 = "principal or realm specified but no kerberos is enabled";
    goto LABEL_19;
  }
}

uint64_t sub_10000684C()
{
  if (dword_100010000 != -1)
  {
    *(_DWORD *)__big = dword_100010000;
    sysctlbyname("vfs.generic.nfs.client.access_cache_timeout", 0, 0, __big, 4uLL);
  }
  if (dword_100010004 != -1)
  {
    *(_DWORD *)__big = dword_100010004;
    sysctlbyname("vfs.generic.nfs.client.access_for_getattr", 0, 0, __big, 4uLL);
  }
  if (dword_100010008 != -1)
  {
    *(_DWORD *)__big = dword_100010008;
    sysctlbyname("vfs.generic.nfs.client.allow_async", 0, 0, __big, 4uLL);
  }
  if (dword_10001000C != -1)
  {
    *(_DWORD *)__big = dword_10001000C;
    sysctlbyname("vfs.generic.nfs.client.callback_port", 0, 0, __big, 4uLL);
  }
  if (dword_100010010 != -1)
  {
    *(_DWORD *)__big = dword_100010010;
    sysctlbyname("vfs.generic.nfs.client.initialdowndelay", 0, 0, __big, 4uLL);
  }
  if (dword_100010014 != -1)
  {
    *(_DWORD *)__big = dword_100010014;
    sysctlbyname("vfs.generic.nfs.client.iosize", 0, 0, __big, 4uLL);
  }
  if (dword_100010018 != -1)
  {
    *(_DWORD *)__big = dword_100010018;
    sysctlbyname("vfs.generic.nfs.client.nextdowndelay", 0, 0, __big, 4uLL);
  }
  if (dword_10001001C != -1)
  {
    *(_DWORD *)__big = dword_10001001C;
    sysctlbyname("vfs.generic.nfs.client.nfsiod_thread_max", 0, 0, __big, 4uLL);
  }
  if (dword_100010020 != -1)
  {
    *(_DWORD *)__big = dword_100010020;
    sysctlbyname("vfs.generic.nfs.client.statfs_rate_limit", 0, 0, __big, 4uLL);
  }
  int v0 = dword_100010024;
  if (dword_100010024 == -1)
  {
    size_t __len = 128;
    CFTypeRef v1 = IOPSCopyPowerSourcesInfo();
    if (!v1) {
      goto LABEL_36;
    }
    uint64_t v2 = v1;
    CFArrayRef v3 = IOPSCopyPowerSourcesList(v1);
    if (v3)
    {
      CFArrayRef v4 = v3;
      CFIndex Count = CFArrayGetCount(v3);
      if (Count >= 1)
      {
        CFIndex v6 = Count;
        CFIndex v7 = 0;
        BOOL v8 = 1;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v4, v7);
          if (ValueAtIndex)
          {
            CFDictionaryRef v10 = IOPSGetPowerSourceDescription(v2, ValueAtIndex);
            CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(v10, @"Is Present");
            if (Value)
            {
              CFBooleanRef v12 = Value;
              CFTypeID v13 = CFGetTypeID(Value);
              if (v13 == CFBooleanGetTypeID())
              {
                if (CFBooleanGetValue(v12))
                {
                  CFStringRef v14 = (const __CFString *)CFDictionaryGetValue(v10, @"Type");
                  if (v14)
                  {
                    CFStringRef v15 = v14;
                    CFTypeID v16 = CFGetTypeID(v14);
                    if (v16 == CFStringGetTypeID()
                      && CFEqual(v15, @"InternalBattery"))
                    {
                      break;
                    }
                  }
                }
              }
            }
          }
          BOOL v8 = v6 > ++v7;
        }
        while (v6 != v7);
        CFRelease(v4);
        CFRelease(v2);
        if (v8)
        {
          int v0 = 1;
LABEL_39:
          dword_100010024 = v0;
          goto LABEL_40;
        }
LABEL_36:
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        *(_OWORD *)__big = 0u;
        long long v23 = 0u;
        int v17 = sysctlbyname("hw.model", __big, &__len, 0, 0);
        int v0 = 0;
        if ((v17 & 0x80000000) == 0 && __len) {
          int v0 = strnstr(__big, "Book", __len) != 0;
        }
        goto LABEL_39;
      }
      CFRelease(v4);
    }
    CFRelease(v2);
    goto LABEL_36;
  }
LABEL_40:
  *(_DWORD *)__big = v0;
  uint64_t result = sysctlbyname("vfs.generic.nfs.client.is_mobile", 0, 0, __big, 4uLL);
  if (dword_100010028 != -1)
  {
    *(_DWORD *)__big = dword_100010028;
    uint64_t result = sysctlbyname("vfs.generic.nfs.client.squishy_flags", 0, 0, __big, 4uLL);
  }
  if (dword_10001002C != -1)
  {
    *(_DWORD *)__big = dword_10001002C;
    uint64_t result = sysctlbyname("vfs.generic.nfs.client.root_steals_gss_context", 0, 0, __big, 4uLL);
  }
  if (dword_100010030 != -1)
  {
    *(_DWORD *)__big = dword_100010030;
    uint64_t result = sysctlbyname("vfs.generic.nfs.client.mount_timeout", 0, 0, __big, 4uLL);
  }
  if (dword_100010034 != -1)
  {
    *(_DWORD *)__big = dword_100010034;
    uint64_t result = sysctlbyname("vfs.generic.nfs.client.mount_quick_timeout", 0, 0, __big, 4uLL);
  }
  __darwin_ct_rune_t v19 = (void *)qword_100010038;
  if (qword_100010038)
  {
    size_t v20 = strnlen((const char *)qword_100010038, 0x400uLL);
    return sysctlbyname("vfs.generic.nfs.client.default_nfs4domain", 0, 0, v19, v20);
  }
  return result;
}

uint64_t sub_100006CFC(const char *a1, void *a2)
{
  *a2 = 0;
  CFArrayRef v3 = strdup(a1);
  if (!v3) {
    return 12;
  }
  CFArrayRef v4 = v3;
  if (!*v3)
  {
    uint64_t v35 = 22;
    goto LABEL_96;
  }
  v40 = a2;
  size_t v5 = 0;
  CFIndex v6 = 0;
  memset(v44, 0, sizeof(v44));
  CFIndex v7 = "ftp://";
  int v45 = 0;
  v42 = v3;
  while (2)
  {
    v41 = v5;
    BOOL v8 = malloc_type_malloc(0x20uLL, 0x10300405ED1140EuLL);
    if (!v8)
    {
      uint64_t v35 = 12;
      CFArrayRef v4 = v42;
      if (v6) {
        goto LABEL_93;
      }
      goto LABEL_96;
    }
    size_t v5 = v8;
    *BOOL v8 = 0u;
    v8[1] = 0u;
    if (!*v4) {
      goto LABEL_86;
    }
    v9 = 0;
    v43 = (void *)v8 + 1;
    while (1)
    {
      CFDictionaryRef v10 = malloc_type_malloc(0x18uLL, 0x30040275E93A9uLL);
      if (!v10) {
        goto LABEL_87;
      }
      __uint32_t v11 = v10;
      *CFDictionaryRef v10 = 0;
      v10[1] = 0;
      v10[2] = 0;
      if (!strncmp(v4, v7, 6uLL))
      {
        CFTypeID v13 = 0;
        CFTypeID v16 = v4;
        CFArrayRef v4 = "localhost";
        goto LABEL_50;
      }
      int v12 = *v4;
      if (v12 != 91)
      {
        CFTypeID v13 = 0;
        CFStringRef v14 = 0;
        CFTypeID v16 = v4;
        if (!*v4) {
          goto LABEL_49;
        }
        goto LABEL_28;
      }
      CFTypeID v13 = 0;
      CFStringRef v14 = 0;
      CFStringRef v15 = v4;
LABEL_11:
      CFTypeID v16 = v15 + 2;
      while (1)
      {
        BOOL v17 = (*(v16 - 1) & 0x80000000) == 0 && _DefaultRuneLocale.__runetype[*(v16 - 1)] & 0x10000;
        int v12 = *(v16 - 1);
        if (v12 != 58 && !v17) {
          break;
        }
        ++v16;
        if (v12 == 58)
        {
          CFStringRef v15 = v16 - 2;
          if (!v13) {
            CFTypeID v13 = (unsigned __int8 *)(v16 - 2);
          }
          if (!v14)
          {
            if (*(v16 - 1) == 47) {
              CFStringRef v14 = (unsigned __int8 *)(v16 - 2);
            }
            else {
              CFStringRef v14 = 0;
            }
          }
          goto LABEL_11;
        }
      }
      size_t v20 = v5;
      uint64_t v21 = v7;
      v22 = (unsigned __int8 *)(v16 - 1);
      if (v12 != 93)
      {
        --v16;
        goto LABEL_48;
      }
      int v23 = *v16;
      if (v23 == 44 || v23 == 58)
      {
        unsigned __int8 *v22 = 0;
        int v24 = inet_pton(30, v4 + 1, v44);
        unsigned __int8 *v22 = 93;
        if (v24)
        {
          CFIndex v7 = v21;
          size_t v5 = v20;
          goto LABEL_50;
        }
        int v12 = *v16;
LABEL_48:
        CFIndex v7 = v21;
        size_t v5 = v20;
        if (!v12) {
          goto LABEL_49;
        }
        goto LABEL_28;
      }
      int v12 = 93;
      --v16;
      CFIndex v7 = v21;
      size_t v5 = v20;
      if (v13)
      {
LABEL_29:
        if (v14) {
          goto LABEL_50;
        }
      }
      while (1)
      {
        if (v12 == 58)
        {
          if (!v13) {
            CFTypeID v13 = (unsigned __int8 *)v16;
          }
          if (!v14 && v16[1] == 47) {
            goto LABEL_50;
          }
        }
        else if (v12 == 44)
        {
          goto LABEL_50;
        }
        int v19 = *++v16;
        int v12 = v19;
        if (!v19) {
          break;
        }
LABEL_28:
        if (v13) {
          goto LABEL_29;
        }
      }
LABEL_49:
      CFTypeID v16 = (char *)v13;
      if (!v13)
      {
        uint64_t v35 = 22;
        goto LABEL_91;
      }
LABEL_50:
      char v25 = *v16;
      *CFTypeID v16 = 0;
      v11[1] = strdup(v4);
      *CFTypeID v16 = v25;
      if (!v11[1])
      {
        uint64_t v35 = 12;
LABEL_91:
        free(v5);
        goto LABEL_92;
      }
      long long v26 = v43;
      if (v9) {
        long long v26 = v9;
      }
      *long long v26 = v11;
      ++*((_DWORD *)v5 + 6);
      if (*v16 != 44) {
        break;
      }
      CFArrayRef v4 = v16 + 1;
      v9 = v11;
      if (!v16[1]) {
        goto LABEL_86;
      }
    }
    if (!strncmp(v16, v7, 6uLL)) {
      long long v27 = v16;
    }
    else {
      long long v27 = v16 + 1;
    }
    if (!*v27)
    {
      if (!v13)
      {
LABEL_86:
        uint64_t v35 = 22;
        goto LABEL_88;
      }
      long long v27 = (const char *)(v13 + 1);
    }
    for (i = (char *)v27; ; ++i)
    {
      int v29 = *i;
      if (!*i) {
        break;
      }
      if (v29 == 44)
      {
        v30 = i;
        do
        {
          int v32 = *++v30;
          int v31 = v32;
        }
        while (v32 != 58 && v31 != 0);
        if (!v31) {
          i = v30;
        }
        int v29 = *i;
        break;
      }
    }
    char *i = 0;
    *((void *)v5 + 2) = strdup(v27);
    char *i = v29;
    if (*((void *)v5 + 2))
    {
      v34 = v5;
      if (v41)
      {
        void *v41 = v5;
        int v29 = *i;
        v34 = v6;
      }
      if (v29 == 44) {
        CFArrayRef v4 = i + 1;
      }
      else {
        CFArrayRef v4 = i;
      }
      CFIndex v6 = v34;
      if (!*v4)
      {
        if (!v34)
        {
          uint64_t v35 = 22;
          CFArrayRef v4 = v42;
          goto LABEL_96;
        }
        free(v42);
        uint64_t v35 = 0;
        void *v40 = v34;
        return v35;
      }
      continue;
    }
    break;
  }
LABEL_87:
  uint64_t v35 = 12;
LABEL_88:
  __uint32_t v11 = v5;
LABEL_92:
  CFArrayRef v4 = v42;
  free(v11);
  if (v6)
  {
    do
    {
LABEL_93:
      v36 = (void *)v6[1];
      if (v36)
      {
        do
        {
          v37 = (void *)*v36;
          free(v36);
          v6[1] = v37;
          v36 = v37;
        }
        while (v37);
      }
      v38 = (void *)*v6;
      free(v6);
      CFIndex v6 = v38;
    }
    while (v38);
  }
LABEL_96:
  free(v4);
  return v35;
}

uint64_t sub_100007144(uint64_t result, _DWORD *a2)
{
  *a2 = 0;
  if (result)
  {
    CFArrayRef v3 = (void *)result;
    do
    {
      for (i = (void *)v3[1]; i; i = (void *)*i)
      {
        uint64_t result = sub_100009980((uint64_t)i);
        if (!result)
        {
          if (i[2]) {
            ++*a2;
          }
        }
      }
      CFArrayRef v3 = (void *)*v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_1000071B0(uint64_t **a1, const char *a2)
{
  printf("mount %s on %s\n", (const char *)qword_100010910, a2);
  int v3 = dword_100010928[0];
  printf("mount flags: 0x%x", dword_100010928[0]);
  if (v3)
  {
    CFArrayRef v4 = (const char **)&off_10000C298;
    do
    {
      int v5 = *((_DWORD *)v4 - 2);
      if (!v5) {
        break;
      }
      if ((v5 & v3) != 0)
      {
        printf(", %s", *v4);
        v3 &= ~v5;
      }
      v4 += 2;
    }
    while (v3);
  }
  putchar(10);
  if (SHIDWORD(qword_1000109F4) > 1)
  {
    if (HIDWORD(qword_1000109F4) != 2 && HIDWORD(qword_1000109F4) != 30) {
      goto LABEL_23;
    }
  }
  else if (HIDWORD(qword_1000109F4))
  {
    if (HIDWORD(qword_1000109F4) == 1) {
      printf("socket: type:%s");
    }
    goto LABEL_23;
  }
  CFIndex v7 = "any";
  if (qword_1000109F4 == 2) {
    CFIndex v7 = "udp";
  }
  if (qword_1000109F4 == 1) {
    BOOL v8 = "tcp";
  }
  else {
    BOOL v8 = v7;
  }
  printf("socket: type:%s", v8);
  if (HIDWORD(qword_1000109F4)) {
    printf("%s%s");
  }
LABEL_23:
  int v9 = qword_10001092C;
  if ((qword_10001092C & 0x8000) != 0)
  {
    printf(",port=%d", dword_1000109FC);
    int v9 = qword_10001092C;
  }
  if ((v9 & 0x10000) != 0) {
    printf(",mountport=%d", dword_100010A00);
  }
  if ((qword_100010934 & 0x10000) != 0 || dword_100010920 >= 2)
  {
    if ((qword_100010934 & 0x1000000000000) != 0) {
      CFDictionaryRef v10 = (const char *)&unk_10000B33F;
    }
    else {
      CFDictionaryRef v10 = "no";
    }
    printf(",%smntudp", v10);
  }
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  *(_OWORD *)v72 = 0u;
  long long v73 = 0u;
  putchar(10);
  puts("file system locations:");
  if (a1)
  {
    while (1)
    {
      puts((const char *)a1[2]);
      __uint32_t v11 = (uint64_t **)a1[1];
      if (v11) {
        break;
      }
LABEL_46:
      a1 = (uint64_t **)*a1;
      if (!a1) {
        goto LABEL_47;
      }
    }
    while (1)
    {
      printf("  %s\n", (const char *)v11[1]);
      int v12 = v11[2];
      if (v12) {
        break;
      }
LABEL_45:
      __uint32_t v11 = (uint64_t **)*v11;
      if (!v11) {
        goto LABEL_46;
      }
    }
    while (1)
    {
      int v13 = *((_DWORD *)v12 + 1);
      if (v13 == 1)
      {
        printf("    local transport %s\n");
      }
      else
      {
        if (v13 == 30)
        {
          CFStringRef v14 = (const void *)(v12[4] + 8);
        }
        else
        {
          if (v13 != 2)
          {
            puts("    ??? ???");
            goto LABEL_44;
          }
          CFStringRef v14 = (const void *)(v12[4] + 4);
        }
        inet_ntop(v13, v14, v72, 0x80u);
        printf("    %s %s\n");
      }
LABEL_44:
      int v12 = (uint64_t *)v12[5];
      if (!v12) {
        goto LABEL_45;
      }
    }
  }
LABEL_47:
  if ((qword_10001092C & 0x100000) != 0)
  {
    printf("fh %d ", dword_100010A38);
    if (dword_100010A38 >= 1)
    {
      uint64_t v15 = 0;
      do
        printf("%02x", *((unsigned __int8 *)&dword_100010A38 + v15++ + 4));
      while (v15 < dword_100010A38);
    }
    putchar(10);
  }
  printf("NFS options:");
  if (dword_10001091C) {
    CFTypeID v16 = "bg";
  }
  else {
    CFTypeID v16 = "fg";
  }
  printf(" %s,retrycnt=%d", v16, dword_1000108F8);
  int v17 = qword_10001092C;
  if ((qword_10001092C & 2) != 0)
  {
    printf(",vers=%d", xmmword_10001093C);
    int v17 = qword_10001092C;
    if ((qword_10001092C & 4) != 0)
    {
      printf(".%d", DWORD1(xmmword_10001093C));
      int v17 = qword_10001092C;
    }
  }
  if ((v17 & 0x8000000) != 0)
  {
    printf(",vers=%d", HIWORD(xmmword_10001093C));
    if (WORD6(xmmword_10001093C)) {
      printf(".%d", WORD6(xmmword_10001093C));
    }
    printf("-%d", WORD5(xmmword_10001093C));
    if (WORD4(xmmword_10001093C)) {
      printf(".%d", WORD4(xmmword_10001093C));
    }
  }
  __int16 v18 = qword_100010934;
  if ((qword_100010934 & 1) != 0 || (int v19 = dword_100010920, dword_100010920 >= 2))
  {
    if ((qword_100010934 & 0x100000000) != 0) {
      size_t v20 = "soft";
    }
    else {
      size_t v20 = "hard";
    }
    printf(",%s", v20);
    __int16 v18 = qword_100010934;
    int v19 = dword_100010920;
  }
  if ((v18 & 2) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x200000000) != 0) {
      uint64_t v21 = (const char *)&unk_10000B33F;
    }
    else {
      uint64_t v21 = "no";
    }
    printf(",%sintr", v21);
    __int16 v18 = qword_100010934;
    int v19 = dword_100010920;
  }
  if ((v18 & 4) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x400000000) != 0) {
      v22 = (const char *)&unk_10000B33F;
    }
    else {
      v22 = "no";
    }
    printf(",%sresvport", v22);
    __int16 v18 = qword_100010934;
    int v19 = dword_100010920;
  }
  if ((v18 & 8) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x800000000) != 0) {
      int v23 = "no";
    }
    else {
      int v23 = (const char *)&unk_10000B33F;
    }
    printf(",%sconn", v23);
    __int16 v18 = qword_100010934;
    int v19 = dword_100010920;
  }
  if ((v18 & 0x400) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x40000000000) != 0) {
      int v24 = "no";
    }
    else {
      int v24 = (const char *)&unk_10000B33F;
    }
    printf(",%scallback", v24);
    __int16 v18 = qword_100010934;
    int v19 = dword_100010920;
  }
  if ((v18 & 0x80) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x8000000000) != 0) {
      char v25 = "no";
    }
    else {
      char v25 = (const char *)&unk_10000B33F;
    }
    printf(",%snegnamecache", v25);
    __int16 v18 = qword_100010934;
    int v19 = dword_100010920;
  }
  if ((v18 & 0x800) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x80000000000) != 0) {
      long long v26 = (const char *)&unk_10000B33F;
    }
    else {
      long long v26 = "no";
    }
    printf(",%snamedattr", v26);
    __int16 v18 = qword_100010934;
    int v19 = dword_100010920;
  }
  if ((v18 & 0x1000) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x100000000000) != 0) {
      long long v27 = "no";
    }
    else {
      long long v27 = (const char *)&unk_10000B33F;
    }
    printf(",%sacl", v27);
    __int16 v18 = qword_100010934;
    int v19 = dword_100010920;
  }
  if ((v18 & 0x2000) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x200000000000) != 0) {
      long long v28 = (const char *)&unk_10000B33F;
    }
    else {
      long long v28 = "no";
    }
    printf(",%saclonly", v28);
    LOBYTE(v18) = qword_100010934;
    int v19 = dword_100010920;
  }
  if ((v18 & 0x20) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x2000000000) != 0) {
      int v29 = (const char *)&unk_10000B33F;
    }
    else {
      int v29 = "no";
    }
    printf(",%scallumnt", v29);
    int v19 = dword_100010920;
  }
  if (((qword_10001092C & 0x800) != 0 || v19 >= 2) && dword_1000109C0 <= 2) {
    printf((&off_10000C400)[dword_1000109C0]);
  }
  if ((qword_100010934 & 0x8000) != 0 || (int v30 = dword_100010920, dword_100010920 >= 2))
  {
    if ((qword_100010934 & 0x800000000000) != 0) {
      int v31 = "no";
    }
    else {
      int v31 = (const char *)&unk_10000B33F;
    }
    printf(",%squota", v31);
    int v30 = dword_100010920;
  }
  char v32 = qword_10001092C;
  if ((qword_10001092C & 8) != 0 || v30 >= 2)
  {
    if ((qword_10001092C & 8) != 0) {
      int v33 = dword_10001094C;
    }
    else {
      int v33 = 0x8000;
    }
    printf(",rsize=%d", v33);
    char v32 = qword_10001092C;
    int v30 = dword_100010920;
  }
  if ((v32 & 0x10) != 0 || v30 >= 2)
  {
    if ((v32 & 0x10) != 0) {
      int v34 = dword_100010950;
    }
    else {
      int v34 = 0x8000;
    }
    printf(",wsize=%d", v34);
    char v32 = qword_10001092C;
    int v30 = dword_100010920;
  }
  if ((v32 & 0x40) != 0 || v30 >= 2)
  {
    if ((v32 & 0x40) != 0) {
      int v35 = dword_100010958;
    }
    else {
      int v35 = 16;
    }
    printf(",readahead=%d", v35);
    char v32 = qword_10001092C;
    int v30 = dword_100010920;
  }
  if ((v32 & 0x20) != 0 || v30 >= 2)
  {
    if ((v32 & 0x20) != 0) {
      int v36 = dword_100010954;
    }
    else {
      int v36 = 0x8000;
    }
    printf(",dsize=%d", v36);
    int v30 = dword_100010920;
  }
  char v37 = qword_100010934;
  if ((qword_100010934 & 0x40) != 0 || v30 >= 2)
  {
    if ((qword_100010934 & 0x4000000000) != 0) {
      v38 = (const char *)&unk_10000B33F;
    }
    else {
      v38 = "no";
    }
    printf(",%srdirplus", v38);
    char v37 = qword_100010934;
    int v30 = dword_100010920;
  }
  if ((v37 & 0x10) != 0 || v30 >= 2)
  {
    if ((qword_100010934 & 0x1000000000) != 0) {
      v39 = (const char *)&unk_10000B33F;
    }
    else {
      v39 = "no";
    }
    printf(",%sdumbtimer", v39);
    int v30 = dword_100010920;
  }
  int v40 = qword_10001092C;
  if ((qword_10001092C & 0x20000) != 0 || v30 >= 2)
  {
    if ((qword_10001092C & 0x20000) != 0) {
      uint64_t v41 = *((void *)&xmmword_100010A08 + 1) % 100000000 + 10 * xmmword_100010A08;
    }
    else {
      uint64_t v41 = 10;
    }
    printf(",timeo=%ld", v41);
    int v40 = qword_10001092C;
    int v30 = dword_100010920;
  }
  if ((v40 & 0x40000) != 0 || v30 >= 2)
  {
    if ((v40 & 0x40000) != 0) {
      int v42 = dword_100010A18;
    }
    else {
      int v42 = 10;
    }
    printf(",retrans=%d", v42);
    LOWORD(v40) = qword_10001092C;
    int v30 = dword_100010920;
  }
  if ((v40 & 0x2000) != 0 || v30 >= 2)
  {
    if ((v40 & 0x2000) != 0) {
      int v43 = unk_1000109F0;
    }
    else {
      int v43 = 16;
    }
    printf(",maxgroups=%d", v43);
    LOWORD(v40) = qword_10001092C;
    int v30 = dword_100010920;
  }
  if ((v40 & 0x80) != 0 || v30 >= 2)
  {
    uint64_t v44 = *(void *)&dword_100010960;
    if ((v40 & 0x80) == 0) {
      uint64_t v44 = 5;
    }
    printf(",acregmin=%ld", v44);
    LOWORD(v40) = qword_10001092C;
    int v30 = dword_100010920;
  }
  if ((v40 & 0x100) != 0 || v30 >= 2)
  {
    uint64_t v45 = *((void *)&xmmword_100010968 + 1);
    if ((v40 & 0x100) == 0) {
      uint64_t v45 = 60;
    }
    printf(",acregmax=%ld", v45);
    LOWORD(v40) = qword_10001092C;
    int v30 = dword_100010920;
  }
  if ((v40 & 0x200) != 0 || v30 >= 2)
  {
    uint64_t v46 = *(void *)&dword_100010980;
    if ((v40 & 0x200) == 0) {
      uint64_t v46 = 5;
    }
    printf(",acdirmin=%ld", v46);
    LOWORD(v40) = qword_10001092C;
    int v30 = dword_100010920;
  }
  if ((v40 & 0x400) != 0 || v30 >= 2)
  {
    uint64_t v47 = *((void *)&xmmword_100010988 + 1);
    if ((v40 & 0x400) == 0) {
      uint64_t v47 = 60;
    }
    printf(",acdirmax=%ld", v47);
    int v30 = dword_100010920;
  }
  char v48 = BYTE4(qword_10001092C);
  if ((qword_10001092C & 0x200000000) != 0 || v30 >= 2)
  {
    uint64_t v49 = qword_1000109A0;
    if ((qword_10001092C & 0x200000000) == 0) {
      uint64_t v49 = 5;
    }
    printf(",acrootdirmin=%ld", v49);
    char v48 = BYTE4(qword_10001092C);
    int v30 = dword_100010920;
  }
  if ((v48 & 4) != 0 || v30 >= 2)
  {
    uint64_t v50 = *((void *)&xmmword_1000109A8 + 1);
    if ((v48 & 4) == 0) {
      uint64_t v50 = 60;
    }
    printf(",acrootdirmax=%ld", v50);
    int v30 = dword_100010920;
  }
  if ((qword_10001092C & 0x80000) != 0 || v30 >= 2)
  {
    uint64_t v51 = xmmword_100010A28;
    if ((qword_10001092C & 0x80000) == 0) {
      uint64_t v51 = 0;
    }
    printf(",deadtimeout=%ld", v51);
    int v30 = dword_100010920;
  }
  __int16 v52 = qword_100010934;
  if ((qword_100010934 & 0x100) != 0 || v30 >= 2)
  {
    if ((qword_100010934 & 0x10000000000) != 0) {
      v53 = (const char *)&unk_10000B33F;
    }
    else {
      v53 = "no";
    }
    printf(",%smutejukebox", v53);
    __int16 v52 = qword_100010934;
    int v30 = dword_100010920;
  }
  if ((v52 & 0x200) != 0 || v30 >= 2)
  {
    if ((qword_100010934 & 0x20000000000) != 0) {
      v54 = (const char *)&unk_10000B33F;
    }
    else {
      v54 = "no";
    }
    printf(",%sephemeral", v54);
    __int16 v52 = qword_100010934;
    int v30 = dword_100010920;
  }
  if ((v52 & 0x4000) != 0 || v30 >= 2)
  {
    if ((qword_100010934 & 0x400000000000) != 0) {
      v55 = (const char *)&unk_10000B33F;
    }
    else {
      v55 = "no";
    }
    printf(",%snfc", v55);
  }
  if ((qword_10001092C & 0x1000) == 0) {
    goto LABEL_267;
  }
  if (SHIDWORD(qword_1000109C4) <= 390002)
  {
    if (!HIDWORD(qword_1000109C4))
    {
      v56 = "none";
      goto LABEL_253;
    }
    if (HIDWORD(qword_1000109C4) == 1)
    {
      v56 = "sys";
      goto LABEL_253;
    }
  }
  else
  {
    switch(HIDWORD(qword_1000109C4))
    {
      case 0x5F373:
        v56 = "krb5";
        goto LABEL_253;
      case 0x5F374:
        v56 = "krb5i";
        goto LABEL_253;
      case 0x5F375:
        v56 = "krb5p";
        goto LABEL_253;
    }
  }
  v56 = "?";
LABEL_253:
  printf(",sec=%s", v56);
  if ((int)qword_1000109C4 >= 2)
  {
    for (uint64_t i = 41; i - 40 < (int)qword_1000109C4; ++i)
    {
      int v58 = dword_100010928[i];
      if (v58 <= 390002)
      {
        v59 = "none";
        if (v58)
        {
          if (v58 != 1)
          {
LABEL_265:
            v59 = "?";
            goto LABEL_266;
          }
          v59 = "sys";
        }
      }
      else
      {
        switch(v58)
        {
          case 390003:
            v59 = "krb5";
            break;
          case 390004:
            v59 = "krb5i";
            break;
          case 390005:
            v59 = "krb5p";
            break;
          default:
            goto LABEL_265;
        }
      }
LABEL_266:
      printf(":%s", v59);
    }
  }
LABEL_267:
  if ((qword_10001092C & 0x10000000) != 0)
  {
    v60 = (dword_1000109E4 - 16) > 2 ? "?" : (&off_10000C418)[dword_1000109E4 - 16];
    printf(",etype=%s", v60);
    if (qword_1000109DC >= 2)
    {
      uint64_t v61 = 48;
      do
      {
        unsigned int v62 = dword_100010928[v61] - 16;
        v63 = "?";
        if (v62 <= 2) {
          v63 = (&off_10000C418)[v62];
        }
        ++v61;
        printf(":%s", v63);
      }
      while (v61 - 47 < (unint64_t)qword_1000109DC);
    }
  }
  int v64 = qword_10001092C;
  if ((qword_10001092C & 0x1000000) != 0)
  {
    printf(",realm=%s", (const char *)qword_100010AC0);
    int v64 = qword_10001092C;
  }
  if ((v64 & 0x2000000) != 0)
  {
    printf(",principal=%s", (const char *)xmmword_100010AC8);
    int v64 = qword_10001092C;
  }
  if ((v64 & 0x4000000) != 0) {
    printf(",sprincipal=%s", *((const char **)&xmmword_100010AC8 + 1));
  }
  char v65 = BYTE4(qword_10001092C);
  if ((qword_10001092C & 0x100000000) != 0 || dword_100010920 >= 2)
  {
    if ((qword_10001092C & 0x100000000) != 0) {
      int v66 = dword_100010A1C;
    }
    else {
      int v66 = 0;
    }
    printf(",readlink_nocache=%d", v66);
    char v65 = BYTE4(qword_10001092C);
  }
  if ((v65 & 8) != 0) {
    printf(",accesscache=%d", dword_100010A20);
  }
  int v67 = qword_100010934;
  if ((qword_100010934 & 0x80000) != 0 || (int v68 = dword_100010920, dword_100010920 >= 2))
  {
    if ((qword_100010934 & 0x8000000000000) != 0) {
      v69 = "no";
    }
    else {
      v69 = (const char *)&unk_10000B33F;
    }
    printf(",%sopaque_auth", v69);
    int v67 = qword_100010934;
    int v68 = dword_100010920;
  }
  if ((v67 & 0x100000) != 0 || v68 >= 2)
  {
    if ((qword_100010934 & 0x10000000000000) != 0) {
      v70 = (const char *)&unk_10000B33F;
    }
    else {
      v70 = "no";
    }
    printf(",%sskip_renew", v70);
  }
  return putchar(10);
}

uint64_t sub_1000080E4(uint64_t a1, void *a2)
{
  *a2 = 0;
  int v3 = qword_10001092C;
  int v4 = qword_10001092C | 0x600000;
  uint64_t v78 = qword_10001092C | 0x600000;
  if (qword_100010AE8 && qword_100010910 && !strncmp((const char *)qword_100010910, "ftp://", 6uLL))
  {
    int v4 = v3 | 0xE00000;
    LODWORD(v78) = v3 | 0xE00000;
  }
  if (qword_100010934)
  {
    v4 |= 1u;
    LODWORD(v78) = v4;
  }
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v84 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  *(_OWORD *)__s = 0u;
  *(void *)long long v79 = 0;
  uint64_t v80 = 0;
  uint64_t v77 = 0x100000001;
  v72[0] = 0;
  v72[1] = 0;
  uint64_t v75 = 0;
  uint64_t v76 = 512;
  uint64_t v73 = 0;
  long long v74 = 0;
  unsigned int __src = 1476395008;
  uint64_t v5 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
  if (v77 == 1) {
    uint64_t v6 = v74 - (char *)v72[0];
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v69 = v6;
  if (!v5)
  {
    unsigned int __src = 0;
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if (v7) {
      goto LABEL_14;
    }
    unsigned int __src = 0;
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if (v7) {
      goto LABEL_14;
    }
    unsigned int __src = 0x2000000;
    uint64_t v5 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
  }
  uint64_t v7 = v5;
LABEL_14:
  uint64_t v8 = 0;
  char v9 = 1;
  do
  {
    char v10 = v9;
    if (!v7)
    {
      unsigned int __src = bswap32(*(_DWORD *)&v79[4 * v8 - 8]);
      uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    }
    char v9 = 0;
    uint64_t v8 = 1;
  }
  while ((v10 & 1) != 0);
  if (v77 == 1) {
    uint64_t v11 = v74 - (char *)v72[0];
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v68 = v11;
  if (v7)
  {
    if ((v4 & 1) == 0) {
      goto LABEL_30;
    }
  }
  else
  {
    unsigned int __src = 0;
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if ((v4 & 1) == 0) {
      goto LABEL_30;
    }
  }
  if (!v7)
  {
    unsigned int __src = 0x1000000;
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if (!v7)
    {
      unsigned int __src = bswap32(qword_100010934);
      uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
      if (!v7)
      {
        unsigned int __src = 0x1000000;
        uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
        if (!v7)
        {
          unsigned int __src = bswap32(HIDWORD(qword_100010934));
          uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
        }
      }
    }
  }
LABEL_30:
  if ((v4 & 2) != 0 && !v7)
  {
    unsigned int __src = bswap32(xmmword_10001093C);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if ((v4 & 4) == 0) {
      goto LABEL_36;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_36;
  }
  if (!v7)
  {
    unsigned int __src = bswap32(DWORD1(xmmword_10001093C));
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
  }
LABEL_36:
  if ((v4 & 0x8000000) != 0 && !v7)
  {
    unsigned int __src = bswap32(HIDWORD(xmmword_10001093C));
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if (!v7)
    {
      unsigned int __src = bswap32(DWORD2(xmmword_10001093C));
      uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    }
  }
  if ((v4 & 8) != 0 && !v7)
  {
    unsigned int __src = bswap32(dword_10001094C);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if ((v4 & 0x10) == 0) {
      goto LABEL_46;
    }
  }
  else if ((v4 & 0x10) == 0)
  {
    goto LABEL_46;
  }
  if (!v7)
  {
    unsigned int __src = bswap32(dword_100010950);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
  }
LABEL_46:
  if ((v4 & 0x20) != 0 && !v7)
  {
    unsigned int __src = bswap32(dword_100010954);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if ((v4 & 0x40) == 0) {
      goto LABEL_52;
    }
  }
  else if ((v4 & 0x40) == 0)
  {
    goto LABEL_52;
  }
  if (!v7)
  {
    unsigned int __src = bswap32(dword_100010958);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
  }
LABEL_52:
  if ((v4 & 0x80) != 0 && !v7)
  {
    unsigned int __src = bswap32(dword_100010960);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if (!v7)
    {
      unsigned int __src = bswap32(xmmword_100010968);
      uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    }
  }
  if ((v4 & 0x100) != 0 && !v7)
  {
    unsigned int __src = bswap32(DWORD2(xmmword_100010968));
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if (!v7)
    {
      unsigned int __src = bswap32(dword_100010978);
      uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    }
  }
  if ((v4 & 0x200) != 0 && !v7)
  {
    unsigned int __src = bswap32(dword_100010980);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if (!v7)
    {
      unsigned int __src = bswap32(xmmword_100010988);
      uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    }
  }
  if ((v4 & 0x400) != 0 && !v7)
  {
    unsigned int __src = bswap32(DWORD2(xmmword_100010988));
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if (!v7)
    {
      unsigned int __src = bswap32(dword_100010998);
      uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    }
  }
  if ((v4 & 0x800) != 0 && !v7)
  {
    unsigned int __src = bswap32(dword_1000109C0);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if ((v4 & 0x1000) == 0) {
      goto LABEL_80;
    }
  }
  else if ((v4 & 0x1000) == 0)
  {
    goto LABEL_80;
  }
  if (!v7)
  {
    unsigned int __src = bswap32(qword_1000109C4);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
  }
  unint64_t v12 = qword_1000109C4;
  if (qword_1000109C4)
  {
    unint64_t v13 = 0;
    do
    {
      if (!v7)
      {
        unsigned int __src = bswap32(*((_DWORD *)&qword_1000109C4 + v13 + 1));
        uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
        unint64_t v12 = qword_1000109C4;
      }
      ++v13;
    }
    while (v13 < v12);
  }
LABEL_80:
  if ((v4 & 0x10000000) != 0)
  {
    if (!v7)
    {
      unsigned int __src = bswap32(qword_1000109DC);
      uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
      if (!v7)
      {
        unsigned int __src = bswap32(HIDWORD(qword_1000109DC));
        uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
      }
    }
    unint64_t v14 = qword_1000109DC;
    if (qword_1000109DC)
    {
      unint64_t v15 = 0;
      do
      {
        if (!v7)
        {
          unsigned int __src = bswap32(*((_DWORD *)&qword_1000109DC + v15 + 2));
          uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
          unint64_t v14 = qword_1000109DC;
        }
        ++v15;
      }
      while (v15 < v14);
    }
  }
  if ((v4 & 0x2000) != 0 && !v7)
  {
    unsigned int __src = bswap32(unk_1000109F0);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if ((v4 & 0x4000) == 0) {
      goto LABEL_120;
    }
  }
  else if ((v4 & 0x4000) == 0)
  {
    goto LABEL_120;
  }
  if (SHIDWORD(qword_1000109F4) > 1)
  {
    if (HIDWORD(qword_1000109F4) != 2 && HIDWORD(qword_1000109F4) != 30) {
      goto LABEL_115;
    }
    goto LABEL_98;
  }
  if (!HIDWORD(qword_1000109F4))
  {
LABEL_98:
    CFTypeID v16 = (const char *)&unk_10000B33F;
    if (HIDWORD(qword_1000109F4) == 2) {
      CFTypeID v16 = "4";
    }
    if (HIDWORD(qword_1000109F4) == 30) {
      int v17 = "6";
    }
    else {
      int v17 = v16;
    }
    __int16 v18 = "inet";
    if (qword_1000109F4)
    {
      if (qword_1000109F4 == 2) {
        __int16 v18 = "udp";
      }
      BOOL v19 = qword_1000109F4 == 1;
    }
    else
    {
      if (dword_100010918 == 17) {
        __int16 v18 = "udp";
      }
      BOOL v19 = dword_100010918 == 6;
    }
    if (v19) {
      __int16 v18 = "tcp";
    }
    snprintf(byte_100010B04, 0x10uLL, "%s%s", v18, v17);
    goto LABEL_115;
  }
  if (HIDWORD(qword_1000109F4) == 1)
  {
    __strlcpy_chk();
    if (v7) {
      goto LABEL_120;
    }
    goto LABEL_116;
  }
LABEL_115:
  if (v7) {
    goto LABEL_120;
  }
LABEL_116:
  unsigned int __src = bswap32(strlen(byte_100010B04));
  uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
  if (!v7)
  {
    size_t v20 = strlen(byte_100010B04);
    uint64_t v7 = sub_100003928((uint64_t)v72, byte_100010B04, v20, 0);
  }
LABEL_120:
  if ((v4 & 0x8000) != 0 && !v7)
  {
    unsigned int __src = bswap32(dword_1000109FC);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if ((v4 & 0x10000) == 0) {
      goto LABEL_126;
    }
  }
  else if ((v4 & 0x10000) == 0)
  {
    goto LABEL_126;
  }
  if (!v7)
  {
    unsigned int __src = bswap32(dword_100010A00);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
  }
LABEL_126:
  if ((v4 & 0x20000) != 0 && !v7)
  {
    unsigned int __src = bswap32(xmmword_100010A08);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if (!v7)
    {
      unsigned int __src = bswap32(DWORD2(xmmword_100010A08));
      uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    }
  }
  if ((v4 & 0x40000) != 0 && !v7)
  {
    unsigned int __src = bswap32(dword_100010A18);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if ((v4 & 0x80000) == 0) {
      goto LABEL_137;
    }
  }
  else if ((v4 & 0x80000) == 0)
  {
    goto LABEL_137;
  }
  if (!v7)
  {
    unsigned int __src = bswap32(xmmword_100010A28);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if (!v7)
    {
      unsigned int __src = bswap32(DWORD2(xmmword_100010A28));
      uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    }
  }
LABEL_137:
  if ((v4 & 0x100000) != 0 && !v7)
  {
    unsigned int __src = bswap32(dword_100010A38);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if (!v7) {
      uint64_t v7 = sub_100003928((uint64_t)v72, byte_100010A3C, dword_100010A38, 0);
    }
  }
  unsigned int v21 = 0;
  if (a1)
  {
    v22 = (void *)a1;
    do
    {
      ++v21;
      v22 = (void *)*v22;
    }
    while (v22);
  }
  if (!v7)
  {
    unsigned int __src = bswap32(v21);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
  }
  if (!a1) {
    goto LABEL_222;
  }
  do
  {
    if (!v7)
    {
      unsigned int __src = bswap32(*(_DWORD *)(a1 + 24));
      uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    }
    v70 = (uint64_t *)a1;
    int v23 = *(uint64_t ***)(a1 + 8);
    if (v23)
    {
      while (1)
      {
        unsigned int __src = 0;
        if (!v7)
        {
          unsigned int __src = bswap32(strlen((const char *)v23[1]));
          uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
          if (!v7)
          {
            size_t v24 = strlen((const char *)v23[1]);
            uint64_t v7 = sub_100003928((uint64_t)v72, (char *)v23[1], v24, 0);
          }
        }
        char v25 = v23[2];
        if (v25)
        {
          unsigned int v26 = 0;
          long long v27 = v23[2];
          do
          {
            ++v26;
            long long v27 = (uint64_t *)v27[5];
          }
          while (v27);
          if (v7)
          {
LABEL_157:
            if (v25) {
              break;
            }
            goto LABEL_188;
          }
        }
        else
        {
          unsigned int v26 = 0;
          if (v7) {
            goto LABEL_157;
          }
        }
        unsigned int __src = bswap32(v26);
        uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
        char v25 = v23[2];
        if (v25) {
          break;
        }
LABEL_188:
        if (!v7)
        {
          unsigned int __src = 0;
          uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
        }
        int v23 = (uint64_t **)*v23;
        if (!v23) {
          goto LABEL_191;
        }
      }
      while (1)
      {
        long long v28 = (unsigned __int8 *)v25[4];
        int v29 = v28[1];
        if (v29 != 30 && v29 != 2) {
          break;
        }
        int v31 = *((_DWORD *)v25 + 1);
        char v32 = v28 + 4;
        int v33 = v28 + 8;
        if (v31 == 2) {
          int v34 = v32;
        }
        else {
          int v34 = v33;
        }
        if (inet_ntop(v31, v34, __s, 0x80u) != __s)
        {
          warn("unable to convert server address to string");
          uint64_t v7 = *__error();
        }
        if (*((_DWORD *)v25 + 1) != 30) {
          goto LABEL_178;
        }
        uint64_t v35 = v25[4];
        int v36 = *(_DWORD *)(v35 + 24);
        if (!v36) {
          goto LABEL_178;
        }
        if (if_indextoname(*(_DWORD *)(v35 + 24), v79))
        {
          size_t v37 = strlen(__s);
          if (128 - v37 >= 0x10) {
            size_t v38 = 16;
          }
          else {
            size_t v38 = 128 - v37;
          }
          snprintf(&__s[v37], v38, "%%%s", v79);
          if (!v7)
          {
LABEL_179:
            unsigned int __src = bswap32(strlen(__s));
            uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
            if (!v7)
            {
              size_t v39 = strlen(__s);
              uint64_t v7 = sub_100003928((uint64_t)v72, __s, v39, 0);
            }
          }
        }
        else
        {
          warn("unable to convert scope_id %u to interface name", v36);
          uint64_t v7 = *__error();
          if (!v7) {
            goto LABEL_179;
          }
        }
LABEL_181:
        char v25 = (uint64_t *)v25[5];
        if (!v25) {
          goto LABEL_188;
        }
      }
      if (v29 != 1)
      {
        warn("Unsupported addres family %d", v28[1]);
        uint64_t v7 = 45;
        goto LABEL_181;
      }
      __strlcpy_chk();
LABEL_178:
      if (!v7) {
        goto LABEL_179;
      }
      goto LABEL_181;
    }
LABEL_191:
    int v40 = v70;
    uint64_t v41 = v70[2];
    uint64_t v42 = v41 - 1;
    do
    {
      int v44 = *(unsigned __int8 *)++v42;
      int v43 = v44;
    }
    while (v44 == 47);
    for (unsigned int i = 0; v43; ++i)
    {
      uint64_t v46 = v42--;
      while (v43 != 47 && v43)
      {
        int v47 = *(unsigned __int8 *)++v46;
        int v43 = v47;
        ++v42;
      }
      do
      {
        int v48 = *(unsigned __int8 *)++v42;
        int v43 = v48;
      }
      while (v48 == 47);
    }
    if (!v7)
    {
      unsigned int __src = bswap32(i);
      uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
      uint64_t v41 = v70[2];
    }
    uint64_t v49 = (char *)(v41 - 1);
    do
    {
      int v51 = *++v49;
      int v50 = v51;
    }
    while (v51 == 47);
    if (v50)
    {
      while (1)
      {
        unint64_t v52 = 0;
        v53 = v49 - 1;
        while ((_BYTE)v50 && v50 != 47)
        {
          LOBYTE(v50) = v49[++v52];
          ++v53;
        }
        if (v7) {
          break;
        }
        unsigned int __src = bswap32(v52);
        uint64_t v54 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
        if (v54 || (uint64_t v54 = sub_100003928((uint64_t)v72, v49, v52, 0), v54))
        {
          uint64_t v7 = v54;
          break;
        }
        uint64_t v49 = v53;
        int v40 = v70;
        do
        {
          int v55 = *++v49;
          int v50 = v55;
        }
        while (v55 == 47);
        if (!v50) {
          goto LABEL_206;
        }
        uint64_t v7 = 0;
      }
      int v40 = v70;
    }
    else if (!v7)
    {
LABEL_206:
      unsigned int __src = 0;
      uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    }
    a1 = *v40;
  }
  while (a1);
LABEL_222:
  if (!v7)
  {
    unsigned int __src = bswap32(dword_100010928[0]);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
  }
  int v56 = v78;
  if ((v78 & 0x800000) != 0)
  {
    unsigned int __src = 0;
    if (!v7)
    {
      unsigned int __src = bswap32(strlen((const char *)qword_100010910));
      uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
      if (!v7)
      {
        size_t v57 = strlen((const char *)qword_100010910);
        uint64_t v7 = sub_100003928((uint64_t)v72, (char *)qword_100010910, v57, 0);
      }
    }
  }
  if ((v56 & 0x1000000) != 0)
  {
    unsigned int __src = 0;
    if (!v7)
    {
      unsigned int __src = bswap32(strlen((const char *)qword_100010AC0));
      uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
      if (!v7)
      {
        size_t v58 = strlen((const char *)qword_100010AC0);
        uint64_t v7 = sub_100003928((uint64_t)v72, (char *)qword_100010AC0, v58, 0);
      }
    }
  }
  if ((v56 & 0x2000000) != 0)
  {
    unsigned int __src = 0;
    if (!v7)
    {
      unsigned int __src = bswap32(strlen((const char *)xmmword_100010AC8));
      uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
      if (!v7)
      {
        size_t v59 = strlen((const char *)xmmword_100010AC8);
        uint64_t v7 = sub_100003928((uint64_t)v72, (char *)xmmword_100010AC8, v59, 0);
      }
    }
  }
  if ((v56 & 0x4000000) != 0)
  {
    unsigned int __src = 0;
    if (!v7)
    {
      unsigned int __src = bswap32(strlen(*((const char **)&xmmword_100010AC8 + 1)));
      uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
      if (!v7)
      {
        size_t v60 = strlen(*((const char **)&xmmword_100010AC8 + 1));
        uint64_t v7 = sub_100003928((uint64_t)v72, *((char **)&xmmword_100010AC8 + 1), v60, 0);
      }
    }
  }
  if ((v56 & 0x20000000) != 0)
  {
    unsigned int __src = 0;
    if (!v7)
    {
      unsigned int __src = bswap32(strlen((const char *)xmmword_100010AD8));
      uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
      if (!v7)
      {
        size_t v61 = strlen((const char *)xmmword_100010AD8);
        uint64_t v7 = sub_100003928((uint64_t)v72, (char *)xmmword_100010AD8, v61, 0);
      }
    }
  }
  if ((v56 & 0x40000000) != 0)
  {
    unsigned int __src = 0;
    if (!v7)
    {
      unsigned int __src = bswap32(strlen(*((const char **)&xmmword_100010AD8 + 1)));
      uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
      if (!v7)
      {
        size_t v62 = strlen(*((const char **)&xmmword_100010AD8 + 1));
        uint64_t v7 = sub_100003928((uint64_t)v72, *((char **)&xmmword_100010AD8 + 1), v62, 0);
      }
    }
  }
  char v63 = BYTE4(v78);
  if ((v78 & 0x100000000) != 0 && !v7)
  {
    unsigned int __src = bswap32(dword_100010A1C);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if ((v63 & 2) == 0) {
      goto LABEL_255;
    }
  }
  else if ((v78 & 0x200000000) == 0)
  {
    goto LABEL_255;
  }
  if (!v7)
  {
    unsigned int __src = bswap32(qword_1000109A0);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if (!v7)
    {
      unsigned int __src = bswap32(xmmword_1000109A8);
      uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    }
  }
LABEL_255:
  if ((v63 & 4) != 0 && !v7)
  {
    unsigned int __src = bswap32(DWORD2(xmmword_1000109A8));
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if (!v7)
    {
      unsigned int __src = bswap32(dword_1000109B8);
      uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    }
  }
  if ((v63 & 8) != 0 && !v7)
  {
    unsigned int __src = bswap32(dword_100010A20);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if (v7) {
      goto LABEL_272;
    }
  }
  else if (v7)
  {
    goto LABEL_272;
  }
  if (v77 == 1)
  {
    uint64_t v64 = v74 - (char *)v72[0];
    int v65 = v69;
    uint64_t v73 = v64;
    long long v74 = (char *)v72[0] + v69;
    uint64_t v75 = v64 - v69;
  }
  else
  {
    LODWORD(v64) = 0;
    int v65 = v69;
  }
  unsigned int __src = bswap32(v64 - v65 + 4);
  uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
  if (!v7)
  {
    if (v77 == 1)
    {
      long long v74 = (char *)v72[0] + v68;
      uint64_t v75 = v73 - v68;
    }
    unsigned int __src = bswap32(v64 - v68 - 4);
    uint64_t v7 = sub_100003928((uint64_t)v72, (char *)&__src, 4uLL, 0);
    if (!v7)
    {
      *a2 = v72[0];
      HIDWORD(v77) &= ~1u;
    }
  }
LABEL_272:
  if ((v77 & 0x100000000) != 0 && v77 == 1 && v72[0]) {
    free(v72[0]);
  }
  return v7;
}

uint64_t sub_100009418()
{
  *(_DWORD *)_newrpclib___rpc_createerr() = 0;
  if (qword_1000109F4 == 2)
  {
    uint64_t timeout = _newrpclib_clntudp_bufcreate_timeout();
    if (!timeout) {
      return *(unsigned int *)_newrpclib___rpc_createerr();
    }
    goto LABEL_5;
  }
  uint64_t timeout = _newrpclib_clnttcp_create_timeout();
  if (timeout) {
LABEL_5:
  }
    (*(void (**)(void))(*(void *)(timeout + 8) + 32))();
  return *(unsigned int *)_newrpclib___rpc_createerr();
}

void sub_1000094C4(void *a1)
{
  if (a1)
  {
    CFTypeRef v1 = a1;
    do
    {
      for (unsigned int i = (void *)v1[1]; i; unsigned int i = (void *)*i)
      {
        int v3 = (addrinfo *)i[2];
        if (v3)
        {
          freeaddrinfo(v3);
          i[2] = 0;
        }
      }
      CFTypeRef v1 = (void *)*v1;
    }
    while (v1);
  }
}

uint64_t start()
{
  uint64_t v0 = ((uint64_t (*)(void))loc_100003ADC)();
  return sub_100009524(v0);
}

uint64_t sub_100009524(const char *a1, int *a2)
{
  if (a1)
  {
    int v3 = a1;
    printf("hstr = [%s]\n", a1);
    if (*v3 == 48 && (*((unsigned __int8 *)v3 + 1) | 0x20) == 0x78) {
      v3 += 2;
    }
    int v4 = strlen(v3);
    if ((v4 & 1) == 0)
    {
      if (v4 >= 0) {
        int v5 = v4;
      }
      else {
        int v5 = v4 + 1;
      }
      *a2 = v5 >> 1;
      LOBYTE(v5) = *v3;
      if (!*v3) {
        return 0;
      }
      uint64_t v6 = 0;
      uint64_t v7 = a2 + 1;
      uint64_t v8 = v3 + 1;
      while (1)
      {
        char v9 = off_100010900;
        __darwin_ct_rune_t v10 = __tolower((char)v5);
        uint64_t v11 = strchr(v9, v10);
        if (!v11) {
          break;
        }
        char v12 = (_BYTE)v11 - (_BYTE)v9;
        if (v6)
        {
          unint64_t v14 = v7 + 1;
          char v13 = *v7 | v12 & 0xF;
        }
        else
        {
          char v13 = 16 * v12;
          unint64_t v14 = v7;
        }
        *uint64_t v7 = v13;
        int v5 = v8[v6++];
        uint64_t v7 = v14;
        if (!v5) {
          return 0;
        }
      }
    }
  }
  CFTypeID v16 = __error();
  uint64_t result = 22;
  *CFTypeID v16 = 22;
  return result;
}

char *sub_100009634(int *a1)
{
  uint64_t v2 = *a1;
  size_t v3 = 2 * v2 + 3;
  int v4 = (char *)malloc_type_calloc(1uLL, v3, 0xEAE45059uLL);
  int v5 = v4;
  if (v4)
  {
    uint64_t v2 = v2;
    strlcpy(v4, "0x", v3);
    if ((int)v2 >= 1)
    {
      uint64_t v6 = (char *)(a1 + 1);
      uint64_t v7 = v5 + 3;
      do
      {
        *(v7 - 1) = off_100010900[(unint64_t)*v6 >> 4];
        char v8 = *v6++;
        *uint64_t v7 = off_100010900[v8 & 0xF];
        v7 += 2;
        --v2;
      }
      while (v2);
    }
  }
  return v5;
}

uint64_t sub_1000096E4(const char *a1, unsigned int *a2, unsigned int *a3)
{
  __endptr = 0;
  *a3 = 0;
  int v5 = a2;
  while (1)
  {
    uint64_t v6 = strtol(a1, &__endptr, 10);
    uint64_t v7 = __endptr;
    int v8 = *__endptr;
    if (*__endptr && v8 != 46)
    {
      if (v8 != 45 || v6 < 2 || v6 > 4) {
        return 0;
      }
    }
    else if ((unint64_t)(v6 - 5) < 0xFFFFFFFFFFFFFFFDLL)
    {
      return 0;
    }
    *int v5 = v6 << 16;
    int v11 = *v7;
    if (v11 == 45) {
      goto LABEL_23;
    }
    if (v11 != 46) {
      break;
    }
    uint64_t v12 = strtol(v7 + 1, &__endptr, 10);
    unint64_t v13 = v12;
    uint64_t v7 = __endptr;
    if (*__endptr)
    {
      uint64_t result = 0;
      if (*__endptr != 45 || (v13 & 0x8000000000000000) != 0) {
        return result;
      }
    }
    else if (v12 < 0)
    {
      return 0;
    }
    unint64_t v15 = *v5;
    if (v13 > *(unsigned int *)((char *)&unk_100010AF0 + ((v15 >> 14) & 0x3FFFC))) {
      return 0;
    }
    *int v5 = v15 | (unsigned __int16)v13;
    if (!*v7) {
      goto LABEL_27;
    }
LABEL_23:
    a1 = v7 + 1;
    BOOL v16 = v5 == a3;
    int v5 = a3;
    if (v16) {
      return 0;
    }
  }
  if (*v7) {
    return 0;
  }
LABEL_27:
  unsigned int v17 = *a3;
  if (*a3)
  {
    unsigned int v18 = *a2;
    if (*a2 > v17)
    {
      *a2 = v17;
      *a3 = v18;
    }
  }
  return 1;
}

void sub_10000982C(const char *a1)
{
  CFTypeRef v1 = strdup(a1);
  if (v1)
  {
    uint64_t v2 = v1;
    size_t v3 = strtok(v1, ",");
    if (v3)
    {
      int v4 = v3;
      do
      {
        int v5 = &v4[2 * (strncmp(v4, "no", 2uLL) == 0)];
        uint64_t v6 = strchr(v5, 61);
        if (v6) {
          char *v6 = 0;
        }
        uint64_t v7 = off_100010040;
        if (off_100010040)
        {
          int v8 = &off_100010058;
          while (strcasecmp(v5, v7))
          {
            char v9 = *v8;
            v8 += 3;
            uint64_t v7 = v9;
            if (!v9) {
              goto LABEL_10;
            }
          }
        }
        else
        {
LABEL_10:
          __darwin_ct_rune_t v10 = off_1000105C8;
          if (off_1000105C8)
          {
            int v11 = &off_1000105E0;
            while (strcasecmp(v5, v10))
            {
              uint64_t v12 = *v11;
              v11 += 3;
              __darwin_ct_rune_t v10 = v12;
              if (!v12) {
                goto LABEL_14;
              }
            }
          }
          else
          {
LABEL_14:
            warnx("warning: option \"%s\" not known", v4);
          }
        }
        int v4 = strtok(0, ",");
      }
      while (v4);
    }
    free(v2);
  }
}

uint64_t sub_100009980(uint64_t a1)
{
  memset(&v28, 0, sizeof(v28));
  long long v27 = 0;
  bzero(__s, 0x401uLL);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  *(_OWORD *)int v29 = 0u;
  *(void *)(a1 + 16) = 0;
  uint64_t v2 = *(const char **)(a1 + 8);
  int v3 = *(unsigned __int8 *)v2;
  if (*v2)
  {
    if (v3 != 60)
    {
      if (v3 == 91 && v2[strlen(*(const char **)(a1 + 8)) - 1] == 93)
      {
        uint64_t v2 = __s;
        __strlcpy_chk();
        __s[strlen(__s) - 1] = 0;
      }
      goto LABEL_23;
    }
    if (v2[strlen(*(const char **)(a1 + 8)) - 1] != 62)
    {
LABEL_23:
      memset(&v28, 0, sizeof(v28));
      v28.ai_flags = 1024;
      v28.ai_socktype = qword_1000109F4;
      if (qword_100010AE8) {
        uint64_t v2 = "localhost";
      }
      if (getaddrinfo(v2, 0, &v28, &v27))
      {
        warnx("can't resolve host: %s", v2);
        return 2;
      }
      int v8 = v27;
      if (!v27) {
        goto LABEL_74;
      }
      goto LABEL_27;
    }
    __strlcpy_chk();
    __s[strlen(__s) - 1] = 0;
    uint64_t v2 = v38;
  }
  long long v27 = (addrinfo *)malloc_type_malloc(0x30uLL, 0x1030040D19128EAuLL);
  if (!v27)
  {
    warnx("Can't allocate addrinfo sturcture for local address for %s");
    return 12;
  }
  int v4 = (sockaddr *)malloc_type_malloc(0x6AuLL, 0x10000403684B423uLL);
  if (!v4)
  {
    free(v27);
    warnx("Can't allocate local socket address for %s");
    return 12;
  }
  int v5 = v4;
  *(_WORD *)&v4->sa_len = 362;
  if (dword_100010920 >= 3) {
    printf("hostname is <%s> : %s\n", v2, (const char *)xmmword_100010AD8);
  }
  if (*v2)
  {
    uint64_t v6 = (char *)xmmword_100010AD8;
    if ((void)xmmword_100010AD8)
    {
      if (strcmp((const char *)xmmword_100010AD8, v2))
      {
        warnx("%s overrides port=%s", v2, v6);
        uint64_t v6 = (char *)xmmword_100010AD8;
      }
      free(v6);
    }
    uint64_t v7 = strdup(v2);
    *(void *)&xmmword_100010AD8 = v7;
    if (!v7)
    {
      char v25 = strerror(1);
      sub_100003A00(1, "No memory to duplicate hostname %s: %s", 0, v25);
    }
    LODWORD(qword_10001092C) = qword_10001092C | 0x20000000;
    if (dword_100010920 >= 3) {
      printf("Setting local_nfs_port to %s\n", v7);
    }
  }
  v5->sa_data[0] = 0;
  int v8 = v27;
  *(void *)&v27->ai_flags = &_mh_execute_header;
  v8->size_t ai_addrlen = 106;
  int v9 = qword_1000109F4;
  if (qword_1000109F4 <= 1) {
    int v9 = 1;
  }
  v8->ai_socktype = v9;
  v8->ai_protocol = 0;
  v8->ai_canonname = 0;
  v8->ai_addr = v5;
  v8->ai_next = 0;
LABEL_27:
  uint64_t v26 = a1;
  __darwin_ct_rune_t v10 = 0;
  int v11 = 0;
  do
  {
    while (1)
    {
      uint64_t v12 = v8;
      int v8 = v8->ai_next;
      if ((!HIDWORD(qword_1000109F4) || v12->ai_family == HIDWORD(qword_1000109F4))
        && (!qword_1000109F4 || v12->ai_socktype == qword_1000109F4)
        && (xmmword_10001093C < 4 || v12->ai_socktype != 2))
      {
        unsigned int ai_family = v12->ai_family;
        if (ai_family <= 0x1E && ((1 << ai_family) & 0x40000006) != 0) {
          break;
        }
      }
      ai_next = v8;
      if (v11) {
        goto LABEL_52;
      }
      long long v27 = v8;
LABEL_54:
      v12->ai_next = v10;
      if (dword_100010920 >= 3)
      {
        int v21 = v12->ai_family;
        if (v21 == 2)
        {
          v22 = &v12->ai_addr->sa_data[2];
        }
        else
        {
          if (v21 == 1)
          {
            if (v12->ai_socktype != 2) {
              v12->ai_socktype = 1;
            }
            printf("discard address: %s %s\n");
            goto LABEL_63;
          }
          v22 = &v12->ai_addr->sa_data[6];
        }
        inet_ntop(v21, v22, v29, 0x80u);
        printf("discard address: %s %s %s\n");
      }
LABEL_63:
      __darwin_ct_rune_t v10 = v12;
      if (!v8) {
        goto LABEL_72;
      }
    }
    if (!qword_1000109F4 && v11 && v12->ai_socktype != v11->ai_socktype)
    {
      int v15 = v11->ai_family;
      int v16 = v15 - ai_family;
      if (v15 != ai_family) {
        goto LABEL_44;
      }
      size_t ai_addrlen = v11->ai_addrlen;
      socklen_t v18 = v12->ai_addrlen;
      if (ai_addrlen == v18)
      {
        int v16 = bcmp(v11->ai_addr, v12->ai_addr, ai_addrlen);
LABEL_44:
        if (v16) {
          goto LABEL_45;
        }
LABEL_71:
        ai_next = v12->ai_next;
LABEL_52:
        v11->ai_next = ai_next;
        goto LABEL_54;
      }
      if (ai_addrlen == v18) {
        goto LABEL_71;
      }
    }
LABEL_45:
    if (dword_100010920 < 3) {
      goto LABEL_68;
    }
    int v19 = v12->ai_family;
    if (v19 == 2)
    {
      int v23 = &v12->ai_addr->sa_data[2];
LABEL_67:
      inet_ntop(v19, v23, v29, 0x80u);
      printf("usable address: %s %s %s\n");
      goto LABEL_68;
    }
    if (v19 != 1)
    {
      int v23 = &v12->ai_addr->sa_data[6];
      goto LABEL_67;
    }
    if (v12->ai_socktype != 2) {
      v12->ai_socktype = 1;
    }
    printf("usable address: %s %s\n");
LABEL_68:
    int v11 = v12;
  }
  while (v8);
LABEL_72:
  a1 = v26;
  if (v10) {
    free(v10);
  }
LABEL_74:
  uint64_t result = 0;
  *(void *)(a1 + 16) = v27;
  return result;
}

void sub_100009F94()
{
  uint64_t v0 = (const char *)getmntoptstr();
  warnx("illegal timeout value -- %s", v0);
}

void sub_100009FCC()
{
  uint64_t v0 = (const char *)getmntoptstr();
  warn("illegal retry count -- %s", v0);
}

void sub_10000A004()
{
  uint64_t v0 = (const char *)getmntoptstr();
  warnx("illegal retrans value -- %s", v0);
}

void sub_10000A03C()
{
  uint64_t v0 = (const char *)getmntoptstr();
  warnx("illegal readahead value -- %s", v0);
}

void sub_10000A074()
{
  uint64_t v0 = (const char *)getmntoptstr();
  warnx("illegal maxgroups value -- %s", v0);
}

double sub_10000A0AC()
{
  LODWORD(qword_10001092C) = qword_10001092C | 0x1000;
  *(void *)&double result = 0x5F37300000001;
  qword_1000109C4 = 0x5F37300000001;
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
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

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFTypeRef IOPSCopyPowerSourcesInfo(void)
{
  return _IOPSCopyPowerSourcesInfo();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return _IOPSCopyPowerSourcesList(blob);
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return _IOPSGetPowerSourceDescription(blob, ps);
}

int *__error(void)
{
  return ___error();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return ___tolower(a1);
}

uint64_t _newrpclib___rpc_createerr()
{
  return __newrpclib___rpc_createerr();
}

uint64_t _newrpclib_clnttcp_create_timeout()
{
  return __newrpclib_clnttcp_create_timeout();
}

uint64_t _newrpclib_clntudp_bufcreate_timeout()
{
  return __newrpclib_clntudp_bufcreate_timeout();
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

int bcmp(const void *a1, const void *a2, size_t a3)
{
  return _bcmp(a1, a2, a3);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

int daemon(int a1, int a2)
{
  return _daemon(a1, a2);
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

char *__cdecl fparseln(FILE *a1, size_t *a2, size_t *a3, const char a4[3], int a5)
{
  return _fparseln(a1, a2, a3, a4, a5);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

uint64_t freemntopts()
{
  return _freemntopts();
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return _getaddrinfo(a1, a2, a3, a4);
}

uid_t geteuid(void)
{
  return _geteuid();
}

uint64_t getmntoptnum()
{
  return _getmntoptnum();
}

uint64_t getmntopts()
{
  return _getmntopts();
}

uint64_t getmntoptstr()
{
  return _getmntoptstr();
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return _if_indextoname(a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return _inet_pton(a1, a2, a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

int mount(const char *a1, const char *a2, int a3, void *a4)
{
  return _mount(a1, a2, a3, a4);
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

int puts(const char *a1)
{
  return _puts(a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
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

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
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

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return _strndup(__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return _strnstr(__big, __little, __len);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return _strsep(__stringp, __delim);
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return _strtok(__str, __sep);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return _strtoll(__str, __endptr, __base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

void verrx(int a1, const char *a2, __darwin_va_list a3)
{
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}

void warn(const char *a1, ...)
{
}

void warnx(const char *a1, ...)
{
}