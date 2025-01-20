uint64_t kpep_config_create(void *a1, void *a2)
{
  void *v4;
  void *v5;
  size_t *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  size_t v10;
  size_t v11;
  void *v12;
  void *v13;
  void *v14;

  if (!a1)
  {
    v5 = 0;
    v7 = 1;
LABEL_17:
    free(v5);
    return v7;
  }
  v4 = malloc_type_calloc(1uLL, 0x50uLL, 0x10B0040C2341216uLL);
  v5 = v4;
  if (!v4)
  {
    v7 = 2;
    goto LABEL_17;
  }
  *v4 = a1;
  v6 = v4 + 7;
  v7 = kpep_db_counters_count(a1, 3, v4 + 7);
  if (v7)
  {
LABEL_16:
    free((void *)v5[1]);
    free((void *)v5[2]);
    free((void *)v5[3]);
    free((void *)v5[4]);
    free((void *)v5[5]);
    goto LABEL_17;
  }
  v8 = malloc_type_calloc(v5[7], 8uLL, 0x100004000313F17uLL);
  v5[2] = v8;
  if (!v8) {
    goto LABEL_15;
  }
  v9 = malloc_type_malloc(8 * v5[7], 0x100004000313F17uLL);
  v5[3] = v9;
  if (!v9) {
    goto LABEL_15;
  }
  v10 = *v6;
  if (*v6)
  {
    v11 = 0;
    do
    {
      v9[v11++] = -1;
      v10 = *v6;
    }
    while (*v6 > v11);
  }
  v12 = malloc_type_calloc(v10, 8uLL, 0x2004093837F09uLL);
  v5[1] = v12;
  if (!v12
    || (v13 = malloc_type_calloc(v5[7], 4uLL, 0x100004052888210uLL), (v5[4] = v13) == 0)
    || (v14 = malloc_type_calloc(v5[7], 8uLL, 0x100004000313F17uLL), (v5[5] = v14) == 0))
  {
LABEL_15:
    v7 = 2;
    goto LABEL_16;
  }
  v7 = 0;
  *a2 = v5;
  return v7;
}

uint64_t kpep_config_add_event(uint64_t a1, uint64_t *a2, int a3, _DWORD *a4)
{
  int v8 = 0;
  unint64_t v7 = 0;
  uint64_t result = 1;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = add_event_internal(a1, a2, a3, &v7, &v8, 0);
      if (a4)
      {
        if (result == 12) {
          *a4 = v8;
        }
      }
    }
  }
  return result;
}

uint64_t add_event_internal(uint64_t a1, uint64_t *a2, int a3, unint64_t *a4, _DWORD *a5, char a6)
{
  uint64_t v11 = *a2;
  if ((*(unsigned char *)(*a2 + 48) & 1) == 0)
  {
LABEL_2:
    uint64_t result = add_config_event_internal((void **)a1, a2, a5, a4);
    if (!result)
    {
      unint64_t v13 = *a4;
      int v14 = *(_DWORD *)(a1 + 68);
      uint64_t v11 = *a2;
LABEL_4:
      uint64_t result = 0;
      *(_DWORD *)(a1 + 68) = (1 << v13) | v14;
      *(_DWORD *)(*(void *)(a1 + 32) + 4 * v13) = a3;
      uint64_t v15 = *(void *)(a1 + 48);
      *(void *)(*(void *)(a1 + 8) + 8 * v15) = v11;
      uint64_t v16 = *(void *)(a1 + 24);
      *(void *)(*(void *)(a1 + 16) + 8 * v15) = v13;
      *(void *)(v16 + 8 * *a4) = (*(void *)(a1 + 48))++;
      return result;
    }
    return result;
  }
  if ((a6 & 1) != 0 || (v17 = *(void **)a1, *(_DWORD *)(*(void *)a1 + 128) <= 1u))
  {
    v18 = *(const char **)(v11 + 32);
    if (!v18) {
      return 14;
    }
    uint64_t result = kpep_db_event(*(void *)a1, v18, a2);
    if (!result) {
      goto LABEL_2;
    }
  }
  else
  {
    int v14 = *(_DWORD *)(a1 + 68);
    unsigned int v19 = *(_DWORD *)(v11 + 40);
    if ((v19 & v14) != 0)
    {
      *a5 |= 1 << *(_DWORD *)(*(void *)(a1 + 24) + 8 * __clz(__rbit32(v19)));
      return 12;
    }
    else
    {
      if (*(unsigned char *)(a1 + 72))
      {
        int v20 = *(_DWORD *)(a1 + 64);
        if ((v20 & 1) == 0)
        {
          *(_DWORD *)(a1 + 64) = v20 | 1;
          uint64_t v21 = v17[13];
          if (v21)
          {
            if (*(void *)(a1 + 56) == v21)
            {
              v22 = *(void **)(a1 + 24);
              v22[v21] = *v22;
              void *v22 = -1;
            }
          }
        }
        unint64_t v13 = __clz(__rbit32(v19));
        *a4 = v13;
        goto LABEL_4;
      }
      return 13;
    }
  }
  return result;
}

uint64_t kpep_config_remove_event(uint64_t *a1, unint64_t a2)
{
  if (!a1) {
    return 1;
  }
  if (a1[6] <= a2) {
    return 11;
  }
  uint64_t v2 = a1[2];
  uint64_t v3 = *(void *)(v2 + 8 * a2);
  int v4 = *((_DWORD *)a1 + 17) & ~(1 << v3);
  *((_DWORD *)a1 + 17) = v4;
  uint64_t v5 = *a1;
  if (*(_DWORD *)(*a1 + 132) & v4) == 0 && (*(unsigned char *)(*(void *)(a1[1] + 8 * a2) + 48)) {
    *((_DWORD *)a1 + 16) &= ~1u;
  }
  if ((*(_DWORD *)(v5 + 136) & v4) == 0 && (*(unsigned char *)(*(void *)(a1[1] + 8 * a2) + 48) & 1) == 0) {
    *((_DWORD *)a1 + 16) &= 0xFFFFFFF9;
  }
  uint64_t v6 = a1[3];
  *(void *)(v6 + 8 * v3) = -1;
  unint64_t v7 = a1[7];
  if (v7)
  {
    for (unint64_t i = 0; i < v7; ++i)
    {
      uint64_t v9 = *(void *)(v6 + 8 * i);
      if (v9 > (uint64_t)a2)
      {
        *(void *)(v6 + 8 * i) = v9 - 1;
        unint64_t v7 = a1[7];
      }
    }
  }
  uint64_t v10 = a1[4];
  *(void *)(a1[5] + 8 * v3) = 0;
  *(_DWORD *)(v10 + 4 * v3) = 0;
  unint64_t v11 = a2 - a1[6];
  if (v11)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    do
    {
      uint64_t v15 = a1[1];
      uint64_t v16 = 8 * (v12 + a1[6]) - 8;
      uint64_t v17 = *(void *)(v15 + v16);
      uint64_t v18 = *(void *)(v2 + v16);
      *(void *)(v15 + v16) = v14;
      uint64_t v2 = a1[2];
      *(void *)(v2 + v16) = v13;
      --v12;
      uint64_t v13 = v18;
      uint64_t v14 = v17;
    }
    while (v11 != v12);
    a2 = a1[6];
  }
  uint64_t v19 = 0;
  a1[6] = a2 - 1;
  return v19;
}

uint64_t kpep_config_force_counters(uint64_t a1)
{
  if (!a1) {
    return 1;
  }
  char v2 = *(unsigned char *)(a1 + 72);
  if (v2) {
    return 1;
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 64) &= ~4u;
  *(unsigned char *)(a1 + 72) = v2 | 1;
  return result;
}

uint64_t kpep_config_add_event_trigger(uint64_t a1, uint64_t *a2, int a3, uint64_t a4, _DWORD *a5)
{
  int v10 = 0;
  unint64_t v9 = 0;
  uint64_t result = 1;
  if (a1 && a2)
  {
    uint64_t result = add_event_internal(a1, a2, a3, &v9, &v10, 1);
    if (result)
    {
      if (a5)
      {
        if (result == 12) {
          *a5 = v10;
        }
      }
    }
    else
    {
      *(void *)(*(void *)(a1 + 40) + 8 * v9) = a4;
    }
  }
  return result;
}

uint64_t kpep_config_kpc_map(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = 1;
  if (a1 && a2)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (a3 < 8 * v4) {
      return 4;
    }
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v5 = 0;
      if (!v4) {
        return 0;
      }
    }
    else
    {
      uint64_t v5 = *(void *)(*(void *)a1 + 104);
      if (!v4) {
        return 0;
      }
    }
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)(a1 + 16);
    do
    {
      *(void *)(a2 + 8 * v6) = *(void *)(v7 + 8 * v6) - v5;
      ++v6;
    }
    while (*(void *)(a1 + 48) > v6);
    return 0;
  }
  return v3;
}

uint64_t kpep_config_events_count(uint64_t a1, void *a2)
{
  uint64_t result = 1;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(void *)(a1 + 48);
    }
  }
  return result;
}

uint64_t kpep_config_events(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = 1;
  if (a1 && a2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (a3 >= 8 * v3)
    {
      if (v3)
      {
        for (uint64_t i = 0; i != v3; ++i)
          *(void *)(a2 + 8 * i) = *(void *)(*(void *)(a1 + 8) + 8 * i);
        return 0;
      }
    }
    else
    {
      return 4;
    }
  }
  return v3;
}

uint64_t kpep_config_kpc(void **a1, uint64_t *a2, unint64_t a3)
{
  uint64_t result = 1;
  if (a1)
  {
    uint64_t v5 = a2;
    if (a2)
    {
      if (*((_DWORD *)*a1 + 32) == 3) {
        char v7 = a1[8] & 0xFE;
      }
      else {
        char v7 = *((_DWORD *)a1 + 16);
      }
      uint64_t v8 = counters_count(*a1, v7);
      if (a3 < 8 * v8) {
        return 4;
      }
      uint64_t v9 = v8;
      uint64_t v10 = (uint64_t)*a1;
      if ((_BYTE)a1[8])
      {
        if (*(_DWORD *)(v10 + 128) == 3)
        {
          uint64_t v11 = counters_count((void *)v10, 1);
          if (!v9) {
            return 0;
          }
        }
        else
        {
          uint64_t v11 = 0;
          if (!v9) {
            return 0;
          }
        }
      }
      else
      {
        uint64_t v11 = *(void *)(v10 + 104);
        if (!v9) {
          return 0;
        }
      }
      uint64_t v12 = a1[3];
      do
      {
        uint64_t v13 = v12[v11];
        if (v13 == -1)
        {
          uint64_t v15 = 0;
        }
        else
        {
          uint64_t v14 = a1[1][v13];
          if (*(unsigned char *)(v14 + 48)) {
            uint64_t v15 = 0;
          }
          else {
            uint64_t v15 = *(unsigned __int16 *)(v14 + 44);
          }
          int v16 = *((_DWORD *)a1[4] + v11);
          int v17 = *((_DWORD *)*a1 + 32);
          uint64_t v18 = v15 | 0x30000;
          if (v17 != 3) {
            uint64_t v18 = v15;
          }
          if (v16) {
            uint64_t v15 = v18;
          }
          if (v17 == 1)
          {
            uint64_t v19 = *(unsigned __int8 *)(v14 + 46);
            if (v16) {
              uint64_t v20 = 0x10000;
            }
            else {
              uint64_t v20 = 196608;
            }
            v15 |= v20 | (v19 << 8) | 0x400000;
          }
        }
        *v5++ = v15;
        ++v11;
        --v9;
      }
      while (v9);
      return 0;
    }
  }
  return result;
}

uint64_t kpep_config_kpc_count(_DWORD *a1, uint64_t *a2)
{
  uint64_t result = 1;
  if (a1 && a2)
  {
    if (*(_DWORD *)(*(void *)a1 + 128) == 3) {
      char v5 = a1[16] & 0xFE;
    }
    else {
      char v5 = a1[16];
    }
    uint64_t v6 = counters_count(*(void **)a1, v5);
    uint64_t result = 0;
    *a2 = v6;
  }
  return result;
}

uint64_t kpep_config_kpc_classes(uint64_t a1, unsigned int *a2)
{
  uint64_t result = 1;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(_DWORD *)(a1 + 64) & 0xFFFFFFFB;
    }
  }
  return result;
}

uint64_t kpep_config_kpc_periods(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t result = 1;
  if (a1 && a2)
  {
    int v7 = *(_DWORD *)(a1 + 64);
    uint64_t v8 = *(void **)a1;
    if (*(_DWORD *)(*(void *)a1 + 128) == 3)
    {
      uint64_t v9 = counters_count(v8, 1);
      LOBYTE(v7) = v7 & 0xFE;
      uint64_t v8 = *(void **)a1;
    }
    else if (v7)
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = v8[13];
    }
    uint64_t v10 = counters_count(v8, v7);
    if (a3 >= 8 * v10)
    {
      unint64_t v11 = 8 * v10;
      if (v10)
      {
        uint64_t v12 = (uint64_t *)(*(void *)(a1 + 40) + 8 * v9);
        uint64_t v13 = v10;
        uint64_t v14 = a2;
        do
        {
          uint64_t v15 = *v12++;
          *v14++ = v15;
          --v13;
        }
        while (v13);
      }
      if (a3 > v11) {
        bzero(&a2[v10], a3 - v11);
      }
      return 0;
    }
    else
    {
      return 4;
    }
  }
  return result;
}

uint64_t kpep_config_apply(uint64_t a1)
{
  if (!a1) {
    return 1;
  }
  int v2 = *(_DWORD *)(a1 + 64);
  uint64_t v3 = *(void **)a1;
  if (*((_DWORD *)v3 + 32) == 3) {
    char v4 = v2 & 0xFE;
  }
  else {
    char v4 = v2;
  }
  size_t v5 = 8 * counters_count(v3, v4);
  uint64_t v6 = (uint64_t *)malloc_type_malloc(v5, 0xBD165A8FuLL);
  if (!v6) {
    return 2;
  }
  int v7 = v6;
  uint64_t v8 = kpep_config_kpc((void **)a1, v6, v5);
  if (!v8)
  {
    uint64_t v8 = 15;
    if (!kpc_force_all_ctrs_set())
    {
      if (kpc_set_config()) {
        uint64_t v8 = 15;
      }
      else {
        uint64_t v8 = 0;
      }
    }
  }
  free(v7);
  return v8;
}

void kpep_config_free(void **a1)
{
  if (a1)
  {
    free(a1[1]);
    free(a1[3]);
    free(a1[2]);
    free(a1[4]);
    free(a1[5]);
    free(a1);
  }
}

uint64_t add_config_event_internal(void **a1, uint64_t *a2, _DWORD *a3, unint64_t *a4)
{
  uint64_t v8 = *a2;
  if ((_BYTE)a1[9])
  {
    unsigned int v9 = *(_DWORD *)(v8 + 40);
    if (!v9) {
      return 16;
    }
  }
  else
  {
    unsigned int v9 = *(_DWORD *)(v8 + 40);
    if ((v9 & ~*((_DWORD *)*a1 + 35)) == 0) {
      return 13;
    }
    if (!v9) {
      return 16;
    }
  }
  unint64_t v10 = __clz(__rbit32(v9));
  unint64_t v11 = *a1;
  if (((_BYTE)a1[8] & 1) == 0 && v11[13] > v10) {
    return 16;
  }
  unint64_t v13 = counters_count(v11, 3);
  if (((_BYTE)a1[9] & 1) == 0) {
    v13 -= counters_count(*a1, 4);
  }
  if (v13 <= v10)
  {
LABEL_17:
    if (((_BYTE)a1[9] & 1) != 0 || (*((_DWORD *)*a1 + 35) & *(_DWORD *)(*a2 + 40)) == 0) {
      return 12;
    }
    return 13;
  }
  uint64_t v14 = *a2;
  while ((*(_DWORD *)(v14 + 40) & (1 << v10)) == 0)
  {
LABEL_16:
    if (v13 == ++v10) {
      goto LABEL_17;
    }
  }
  if ((*((_DWORD *)a1 + 17) & (1 << v10)) != 0)
  {
    *a3 |= 1 << LODWORD(a1[3][v10]);
    goto LABEL_16;
  }
  *a4 = v10;
  *a3 = 0;
  int v15 = *((_DWORD *)a1 + 16);
  if (!v15) {
    int v15 = ~(4 * *((unsigned __int8 *)a1 + 72)) & 4;
  }
  uint64_t result = 0;
  *((_DWORD *)a1 + 16) = v15 | 2;
  return result;
}

uint64_t kpep_db_create(const char *a1, void *a2)
{
  return kpep_db_createx(a1, 0, a2);
}

uint64_t kpep_db_createx(const char *a1, int a2, void *a3)
{
  CFDictionaryRef v15 = 0;
  char v14 = 0;
  if ((~a2 & 3) == 0)
  {
    char v4 = 0;
    size_t v5 = 0;
    uint64_t v6 = 1;
    goto LABEL_19;
  }
  uint64_t v8 = a1;
  if (!a1)
  {
    int v19 = 0;
    int v17 = 0;
    int v18 = 0;
    size_t v16 = 4;
    if (!(_BYTE)kpep_db_get_cpu_string_cpu_str)
    {
      if (sysctlbyname("hw.cputype", &v19, &v16, 0, 0)
        || sysctlbyname("hw.cpusubtype", &v18, &v16, 0, 0)
        || sysctlbyname("hw.cpufamily", &v17, &v16, 0, 0))
      {
        uint64_t v6 = 5;
        goto LABEL_8;
      }
      if (snprintf((char *)&kpep_db_get_cpu_string_cpu_str, 0x80uLL, "cpu_%x_%x_%x", v19, v18, v17) >= 0x80)
      {
        xmmword_267752260 = 0u;
        unk_267752270 = 0u;
        xmmword_267752240 = 0u;
        unk_267752250 = 0u;
        xmmword_267752220 = 0u;
        unk_267752230 = 0u;
        uint64_t v6 = 2;
        kpep_db_get_cpu_string_cpu_str = 0u;
        *(_OWORD *)algn_267752210 = 0u;
        goto LABEL_8;
      }
    }
    uint64_t v8 = (const char *)&kpep_db_get_cpu_string_cpu_str;
  }
  uint64_t v9 = create_db_dict((uint64_t)v8, a2, &v15, &v14);
  if (v9)
  {
    uint64_t v6 = v9;
LABEL_8:
    char v4 = 0;
    size_t v5 = 0;
    goto LABEL_19;
  }
  char v4 = malloc_type_calloc(1uLL, 0x98uLL, 0x10F0040E9D8B980uLL);
  if (!v4)
  {
    size_t v5 = 0;
    goto LABEL_18;
  }
  unint64_t v10 = strdup(v8);
  size_t v5 = v10;
  if (!v10)
  {
LABEL_18:
    uint64_t v6 = 2;
    goto LABEL_19;
  }
  v4[1] = v10;
  CFDictionaryRef v11 = v15;
  uint64_t inited = init_db_from_plist((uint64_t)v4, v15);
  if (inited)
  {
    uint64_t v6 = inited;
    goto LABEL_20;
  }
  *((_DWORD *)v4 + 36) = a2;
  uint64_t v6 = 0;
  if (!*((unsigned char *)v4 + 149))
  {
    *((unsigned char *)v4 + 148) = v14;
    *((unsigned char *)v4 + 149) = 1;
  }
LABEL_19:
  CFDictionaryRef v11 = v15;
LABEL_20:
  if (v11) {
    CFRelease(v11);
  }
  if (v6)
  {
    free(v5);
    free(v4);
  }
  else
  {
    *a3 = v4;
  }
  return v6;
}

uint64_t create_db_dict(uint64_t a1, char a2, void *a3, unsigned char *a4)
{
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%s.plist", a1);
  if (!v8) {
    return 2;
  }
  CFStringRef v9 = v8;
  CFURLRef fileURL = 0;
  if (a2)
  {
    uint64_t v14 = 0;
  }
  else
  {
    unint64_t v10 = getenv("KPEP_DB_PATH");
    if (v10)
    {
      CFStringRef v11 = CFStringCreateWithCString(v7, v10, 0x600u);
      if (!v11)
      {
        uint64_t v14 = 2;
LABEL_20:
        CFRelease(v9);
        return v14;
      }
      CFStringRef v12 = v11;
      int v13 = create_plist_url(v11, (uint64_t)v9, &fileURL);
      CFRelease(v12);
      if (!v13) {
        goto LABEL_13;
      }
    }
    uint64_t v14 = create_plist_url(@"/usr/local/share/kpep/", (uint64_t)v9, &fileURL);
    if (!v14)
    {
      *a4 = 1;
      goto LABEL_13;
    }
  }
  if ((a2 & 2) == 0) {
    uint64_t v14 = create_plist_url(@"/usr/share/kpep/", (uint64_t)v9, &fileURL);
  }
  if (v14) {
    goto LABEL_20;
  }
LABEL_13:
  CFURLRef v15 = fileURL;
  size_t v16 = CFReadStreamCreateWithFile(v7, fileURL);
  int v17 = v16;
  if (!v16)
  {
    int v18 = 0;
    uint64_t v14 = 3;
    goto LABEL_25;
  }
  if (!CFReadStreamOpen(v16))
  {
    uint64_t v14 = 3;
LABEL_24:
    CFRelease(v17);
    int v18 = 0;
    LODWORD(v17) = 0;
    goto LABEL_25;
  }
  int v18 = (void *)CFPropertyListCreateWithStream(v7, v17, 0, 1uLL, 0, 0);
  CFReadStreamClose(v17);
  CFRelease(v17);
  if (!v18)
  {
    LODWORD(v17) = 0;
    uint64_t v14 = 10;
    goto LABEL_25;
  }
  CFTypeID v19 = CFGetTypeID(v18);
  if (v19 != CFDictionaryGetTypeID())
  {
    uint64_t v14 = 10;
    int v17 = (__CFReadStream *)v18;
    goto LABEL_24;
  }
  uint64_t v14 = 0;
  LODWORD(v17) = 1;
LABEL_25:
  if (v15) {
    CFRelease(v15);
  }
  CFRelease(v9);
  if (v17)
  {
    uint64_t v14 = 0;
    *a3 = v18;
  }
  return v14;
}

uint64_t init_db_from_plist(uint64_t a1, const __CFDictionary *a2)
{
  long long v61 = *(_OWORD *)(a1 + 96);
  long long v62 = *(_OWORD *)(a1 + 112);
  long long v63 = *(_OWORD *)(a1 + 128);
  uint64_t v64 = *(void *)(a1 + 144);
  long long v57 = *(_OWORD *)(a1 + 32);
  long long v58 = *(_OWORD *)(a1 + 48);
  long long v59 = *(_OWORD *)(a1 + 64);
  long long v60 = *(_OWORD *)(a1 + 80);
  long long v55 = *(_OWORD *)a1;
  long long v56 = *(_OWORD *)(a1 + 16);
  uint64_t cstr_val = get_cstr_val(a2, @"name", (void *)a1, 0);
  if (cstr_val) {
    goto LABEL_15;
  }
  if (!get_BOOL_val(a2, @"internal", (BOOL *)(a1 + 148))) {
    *(unsigned char *)(a1 + 149) = 1;
  }
  Value = CFDictionaryGetValue(a2, @"version");
  if (Value)
  {
    uint64_t v6 = Value;
    CFRetain(Value);
    CFTypeID v7 = CFGetTypeID(v6);
    if (v7 == CFArrayGetTypeID() && CFArrayGetCount((CFArrayRef)v6) == 2)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v6, 0);
      CFRetain(ValueAtIndex);
      CFTypeID v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFNumberGetTypeID())
      {
        LODWORD(valuePtr[0]) = 0;
        uint64_t cstr_val = 10;
        if (CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberIntType, valuePtr))
        {
          if (LODWORD(valuePtr[0]) == 1) {
            uint64_t cstr_val = 0;
          }
          else {
            uint64_t cstr_val = 10;
          }
        }
      }
      else
      {
        uint64_t cstr_val = 10;
      }
      CFRelease(v6);
      if (ValueAtIndex) {
        CFRelease(ValueAtIndex);
      }
      if (cstr_val) {
        goto LABEL_15;
      }
      CFStringRef v12 = CFDictionaryGetValue(a2, @"system");
      if (!v12) {
        goto LABEL_14;
      }
      int v13 = v12;
      CFRetain(v12);
      CFTypeID v14 = CFGetTypeID(v13);
      if (v14 == CFDictionaryGetTypeID())
      {
        CFDictionaryRef v15 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v13, @"cpu");
        if (v15)
        {
          CFDictionaryRef v16 = v15;
          CFRetain(v15);
          v65 = 0;
          get_uint_val(v16, @"fixed_counters", (int *)(a1 + 132));
          unsigned int v17 = *(_DWORD *)(a1 + 132);
          uint8x8_t v18 = (uint8x8_t)vcnt_s8((int8x8_t)v17);
          v18.i16[0] = vaddlv_u8(v18);
          *(void *)(a1 + 104) = v18.u32[0];
          if (v17)
          {
            CFTypeID v19 = malloc_type_calloc(v18.u32[0], 8uLL, 0x2004093837F09uLL);
            *(void *)(a1 + 48) = v19;
            if (!v19)
            {
              uint64_t cstr_val = 2;
              goto LABEL_39;
            }
          }
          get_uint_val(v16, @"config_counters", (int *)(a1 + 136));
          uint8x8_t v20 = (uint8x8_t)vcnt_s8((int8x8_t)*(unsigned int *)(a1 + 136));
          v20.i16[0] = vaddlv_u8(v20);
          *(void *)(a1 + 112) = v20.u32[0];
          get_uint_val(v16, @"power_counters", (int *)(a1 + 140));
          uint8x8_t v21 = (uint8x8_t)vcnt_s8((int8x8_t)*(unsigned int *)(a1 + 140));
          v21.i16[0] = vaddlv_u8(v21);
          *(void *)(a1 + 120) = v21.u32[0];
          uint64_t cstr_val = get_cstr_val(v16, @"architecture", &v65, 0);
          if (!cstr_val)
          {
            v22 = v65;
            if (!strcmp(v65, "i386"))
            {
              int v23 = 0;
            }
            else if (!strcmp(v22, "x86_64"))
            {
              int v23 = 1;
            }
            else if (!strcmp(v22, "arm"))
            {
              int v23 = 2;
            }
            else
            {
              if (strcmp(v22, "arm64"))
              {
                uint64_t cstr_val = 8;
                goto LABEL_39;
              }
              int v23 = 3;
            }
            *(_DWORD *)(a1 + 128) = v23;
            uint64_t cstr_val = get_cstr_val(v16, @"marketing_name", (void *)(a1 + 16), 0);
            if (!cstr_val)
            {
              v25 = CFDictionaryGetValue(v16, @"events");
              if (v25)
              {
                v26 = v25;
                CFRetain(v25);
                v66 = 0;
                valuePtr[0] = 0;
                v27 = (size_t *)(a1 + 88);
                uint64_t v28 = dict_copy_items(v26, (CFIndex *)(a1 + 88), &v66, valuePtr);
                if (v28)
                {
                  uint64_t cstr_val = v28;
                  v29 = 0;
                  goto LABEL_61;
                }
                v30 = malloc_type_calloc(*(void *)(a1 + 88), 0x38uLL, 0x101004029F4E078uLL);
                *(void *)(a1 + 40) = v30;
                if (v30)
                {
                  v29 = malloc_type_calloc(*v27, 8uLL, 0x2004093837F09uLL);
                  if (v29)
                  {
                    if (*v27)
                    {
                      uint64_t v31 = 0;
                      size_t v32 = 0;
                      while (1)
                      {
                        uint64_t v33 = event_init(a1, (const __CFDictionary *)valuePtr[0][v32], (const __CFString *)v66[v32], *(void *)(a1 + 40) + v31);
                        if (v33)
                        {
                          uint64_t cstr_val = v33;
                          goto LABEL_61;
                        }
                        uint64_t v34 = *(void *)(a1 + 40);
                        v29[v32] = v34 + v31;
                        if (*(unsigned char *)(v34 + v31 + 48))
                        {
                          if (!*(_DWORD *)(a1 + 132))
                          {
                            uint64_t cstr_val = 10;
LABEL_61:
                            free(v66);
                            free(valuePtr[0]);
                            free(v29);
                            if (cstr_val)
                            {
                              v36 = *(const void **)(a1 + 32);
                              if (v36) {
                                CFRelease(v36);
                              }
                              free(*(void **)(a1 + 40));
                              *(void *)(a1 + 40) = 0;
LABEL_65:
                              v37 = v26;
LABEL_70:
                              CFRelease(v37);
                              free(v65);
                              if (!cstr_val)
                              {
LABEL_43:
                                CFRelease(v16);
                                CFRelease(v13);
                                if (!cstr_val) {
                                  return cstr_val;
                                }
                                goto LABEL_15;
                              }
LABEL_40:
                              v24 = *(const void **)(a1 + 32);
                              if (v24) {
                                CFRelease(v24);
                              }
                              free(*(void **)(a1 + 40));
                              *(void *)(a1 + 40) = 0;
                              goto LABEL_43;
                            }
                            v38 = CFDictionaryGetValue(v16, @"aliases");
                            if (!v38)
                            {
                              uint64_t cstr_val = 0;
                              goto LABEL_65;
                            }
                            v37 = v38;
                            CFRetain(v38);
                            v66 = 0;
                            valuePtr[0] = 0;
                            v39 = (CFIndex *)(a1 + 96);
                            uint64_t v40 = dict_copy_items(v37, (CFIndex *)(a1 + 96), valuePtr, &v66);
                            if (v40)
                            {
                              uint64_t cstr_val = v40;
                              v41 = 0;
                            }
                            else if (*v39)
                            {
                              v41 = (const void **)malloc_type_malloc(8 * *v39, 0x2004093837F09uLL);
                              if (!v41) {
                                goto LABEL_100;
                              }
                              if (*v39)
                              {
                                unint64_t v42 = 0;
                                while (1)
                                {
                                  v43 = v66[v42];
                                  CFTypeID v44 = CFGetTypeID(v43);
                                  if (v44 != CFStringGetTypeID()
                                    || (v45 = (char **)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), v43)) == 0
                                    || (v46 = v45, v45[3]))
                                  {
                                    uint64_t cstr_val = 10;
                                    goto LABEL_69;
                                  }
                                  v41[v42] = v45;
                                  uint64_t v47 = alloc_cstr((const __CFString *)valuePtr[0][v42], v45 + 3, 0);
                                  if (v47) {
                                    break;
                                  }
                                  if (!*v46)
                                  {
                                    v48 = strdup(v46[3]);
                                    *v46 = v48;
                                    if (!v48) {
                                      goto LABEL_100;
                                    }
                                  }
                                  ++v42;
                                  CFIndex v49 = *v39;
                                  if (v42 >= *v39) {
                                    goto LABEL_98;
                                  }
                                }
                                uint64_t cstr_val = v47;
                                goto LABEL_69;
                              }
                              CFIndex v49 = 0;
LABEL_98:
                              CFDictionaryRef v54 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], valuePtr[0], v41, v49, MEMORY[0x263EFFB78], 0);
                              if (v54)
                              {
                                uint64_t cstr_val = 0;
                                *(void *)(a1 + 56) = v54;
                              }
                              else
                              {
LABEL_100:
                                uint64_t cstr_val = 2;
                              }
                            }
                            else
                            {
                              v41 = 0;
                              uint64_t cstr_val = 0;
                            }
LABEL_69:
                            free(valuePtr[0]);
                            free(v66);
                            free(v41);
                            CFRelease(v26);
                            goto LABEL_70;
                          }
                          *(void *)(*(void *)(a1 + 48) + 8 * __clz(__rbit32(*(_DWORD *)(v34 + v31 + 40)))) = v34 + v31;
                        }
                        ++v32;
                        CFIndex v35 = *v27;
                        v31 += 56;
                        if (*v27 <= v32) {
                          goto LABEL_86;
                        }
                      }
                    }
                    CFIndex v35 = 0;
LABEL_86:
                    unint64_t v50 = *(void *)(a1 + 104);
                    if (v50)
                    {
                      for (unint64_t i = 0; i < v50; ++i)
                      {
                        if (!*(void *)(*(void *)(a1 + 48) + 8 * i))
                        {
                          uint64_t v52 = *(void *)(a1 + 40) + 56 * (i + *(void *)(a1 + 88));
                          *(unsigned char *)(v52 + 48) |= 1u;
                          *(_DWORD *)(v52 + 40) = 1 << i;
                          *(void *)(*(void *)(a1 + 48) + 8 * i) = v52;
                          unint64_t v50 = *(void *)(a1 + 104);
                        }
                      }
                      CFIndex v35 = *v27;
                    }
                    CFDictionaryRef v53 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v66, (const void **)v29, v35, MEMORY[0x263EFFB78], 0);
                    if (v53)
                    {
                      uint64_t cstr_val = 0;
                      *(void *)(a1 + 32) = v53;
                      goto LABEL_61;
                    }
                  }
                }
                else
                {
                  v29 = 0;
                }
                uint64_t cstr_val = 2;
                goto LABEL_61;
              }
              uint64_t cstr_val = 10;
            }
          }
LABEL_39:
          free(v65);
          goto LABEL_40;
        }
      }
      unint64_t v10 = v13;
    }
    else
    {
      unint64_t v10 = v6;
    }
    CFRelease(v10);
  }
LABEL_14:
  uint64_t cstr_val = 10;
LABEL_15:
  free(*(void **)a1);
  *(_OWORD *)(a1 + 96) = v61;
  *(_OWORD *)(a1 + 112) = v62;
  *(_OWORD *)(a1 + 128) = v63;
  *(void *)(a1 + 144) = v64;
  *(_OWORD *)(a1 + 32) = v57;
  *(_OWORD *)(a1 + 48) = v58;
  *(_OWORD *)(a1 + 64) = v59;
  *(_OWORD *)(a1 + 80) = v60;
  *(_OWORD *)a1 = v55;
  *(_OWORD *)(a1 + 16) = v56;
  return cstr_val;
}

uint64_t kpep_db_name(uint64_t a1, void *a2)
{
  uint64_t result = 1;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(void *)(a1 + 16);
    }
  }
  return result;
}

uint64_t kpep_db_serialize(uint64_t a1, UInt8 **a2, CFStringRef *a3)
{
  CFStringRef v4 = 0;
  CFMutableDictionaryRef theDict = 0;
  uint64_t v5 = 1;
  if (!a1 || !a2) {
    goto LABEL_19;
  }
  CFDataRef v8 = *(const __CFData **)(a1 + 24);
  if (v8)
  {
    CFMutableDictionaryRef v9 = 0;
LABEL_5:
    size_t Length = CFDataGetLength(v8);
    CFStringRef v4 = (CFStringRef)Length;
    if (Length)
    {
      CFStringRef v11 = (UInt8 *)malloc_type_malloc(Length, 0xD115C61AuLL);
      *a2 = v11;
      if (v11)
      {
        v18.location = 0;
        v18.length = (CFIndex)v4;
        CFDataGetBytes(v8, v18, v11);
        uint64_t v5 = 0;
        goto LABEL_17;
      }
    }
    goto LABEL_16;
  }
  uint64_t v12 = *(void *)(a1 + 8);
  if (!v12)
  {
    CFStringRef v4 = 0;
    uint64_t v5 = 7;
    goto LABEL_19;
  }
  uint64_t v13 = create_db_dict(v12, *(_DWORD *)(a1 + 144), &theDict, &v16);
  if (v13)
  {
    uint64_t v5 = v13;
    CFStringRef v4 = 0;
    CFMutableDictionaryRef v9 = theDict;
    goto LABEL_17;
  }
  CFStringRef v4 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], *(const char **)(a1 + 8), 0x600u);
  CFMutableDictionaryRef v9 = theDict;
  if (v4)
  {
    CFDictionarySetValue(theDict, @"id", v4);
    CFRelease(v4);
    CFDataRef Data = CFPropertyListCreateData(0, v9, kCFPropertyListBinaryFormat_v1_0, 0, 0);
    if (Data)
    {
      CFDataRef v8 = Data;
      *(void *)(a1 + 24) = Data;
      goto LABEL_5;
    }
    CFStringRef v4 = 0;
  }
LABEL_16:
  uint64_t v5 = 2;
LABEL_17:
  if (v9) {
    CFRelease(v9);
  }
LABEL_19:
  *a3 = v4;
  return v5;
}

uint64_t kpep_db_deserialize(const UInt8 *a1, CFIndex a2, void *a3)
{
  if (a1)
  {
    if (a2)
    {
      uint64_t v6 = malloc_type_calloc(1uLL, 0x98uLL, 0x10F0040E9D8B980uLL);
      if (v6 && (CFDataRef v7 = CFDataCreateWithBytesNoCopy(0, a1, a2, (CFAllocatorRef)*MEMORY[0x263EFFB28])) != 0)
      {
        CFDataRef v8 = v7;
        CFDictionaryRef v9 = (const __CFDictionary *)CFPropertyListCreateWithData(0, v7, 0, 0, 0);
        if (v9)
        {
          CFDictionaryRef v10 = v9;
          CFTypeID v11 = CFGetTypeID(v9);
          if (v11 == CFDictionaryGetTypeID())
          {
            uint64_t cstr_val = get_cstr_val(v10, @"id", v6 + 1, 0);
            if (!cstr_val)
            {
              uint64_t cstr_val = init_db_from_plist((uint64_t)v6, v10);
              if (!cstr_val)
              {
                CFDataRef v13 = CFDataCreate(0, a1, a2);
                v6[3] = v13;
                uint64_t cstr_val = 2 * (v13 == 0);
              }
            }
          }
          else
          {
            uint64_t cstr_val = 10;
          }
          CFRelease(v8);
          CFRelease(v10);
          if (!cstr_val)
          {
            *a3 = v6;
            return cstr_val;
          }
        }
        else
        {
          CFRelease(v8);
          uint64_t cstr_val = 10;
        }
      }
      else
      {
        uint64_t cstr_val = 2;
      }
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t cstr_val = 4;
    }
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t cstr_val = 1;
  }
  CFTypeID v14 = (const void *)v6[3];
  if (v14) {
    CFRelease(v14);
  }
  free(v6);
  return cstr_val;
}

uint64_t kpep_db_events_count(uint64_t a1, void *a2)
{
  uint64_t result = 1;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(void *)(a1 + 88);
    }
  }
  return result;
}

uint64_t kpep_db_architecture(uint64_t a1, _DWORD *a2)
{
  uint64_t result = 1;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(_DWORD *)(a1 + 128);
    }
  }
  return result;
}

uint64_t kpep_db_events(uint64_t a1, const void **values, unint64_t a3)
{
  uint64_t result = 1;
  if (a1 && values)
  {
    if (a3 >= 8 * *(void *)(a1 + 88))
    {
      CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 32), 0, values);
      qsort(values, *(void *)(a1 + 88), 8uLL, (int (__cdecl *)(const void *, const void *))event_cmp);
      return 0;
    }
    else
    {
      return 4;
    }
  }
  return result;
}

uint64_t kpep_db_aliases_count(uint64_t a1, void *a2)
{
  uint64_t result = 1;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(void *)(a1 + 96);
    }
  }
  return result;
}

uint64_t kpep_db_aliases(uint64_t a1, void *a2, size_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = 1;
  if (!a1)
  {
    uint64_t v6 = 0;
    goto LABEL_14;
  }
  uint64_t v6 = 0;
  if (a2)
  {
    size_t v8 = 8 * *(void *)(a1 + 96);
    if (v8 > a3)
    {
      uint64_t v3 = 0;
      uint64_t v6 = 0;
      uint64_t v4 = 4;
      goto LABEL_14;
    }
    uint64_t v3 = (const void **)malloc_type_malloc(v8, 0x6004044C4A2DFuLL);
    if (v3)
    {
      uint64_t v6 = (const void **)malloc_type_malloc(8 * *(void *)(a1 + 96), 0x2004093837F09uLL);
      if (v6)
      {
        CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 56), v3, v6);
        size_t v9 = *(void *)(a1 + 96);
        if (v9)
        {
          CFDictionaryRef v10 = v6;
          CFTypeID v11 = a2;
          uint64_t v12 = *(void *)(a1 + 96);
          do
          {
            uint64_t v13 = (uint64_t)*v10++;
            *v11++ = *(void *)(v13 + 24);
            --v12;
          }
          while (v12);
        }
        qsort(a2, v9, 8uLL, (int (__cdecl *)(const void *, const void *))strcmp_void);
        uint64_t v4 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    uint64_t v4 = 2;
  }
LABEL_14:
  free(v3);
  free(v6);
  return v4;
}

uint64_t kpep_db_counters_count(void *a1, char a2, uint64_t *a3)
{
  uint64_t result = 1;
  if (a1)
  {
    if (a3)
    {
      uint64_t v6 = counters_count(a1, a2);
      uint64_t result = 0;
      *a3 = v6;
    }
  }
  return result;
}

uint64_t kpep_db_event(uint64_t a1, const char *a2, void *a3)
{
  Value = 0;
  uint64_t v5 = 1;
  if (a1 && a2)
  {
    CFStringRef v7 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, 0x600u);
    if (v7)
    {
      CFStringRef v8 = v7;
      CFDictionaryRef v9 = *(const __CFDictionary **)(a1 + 56);
      if (v9 && (CFDictionaryRef v10 = CFDictionaryGetValue(v9, v8)) != 0)
      {
        Value = v10;
        uint64_t v5 = 0;
      }
      else
      {
        Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), v8);
        if (Value) {
          uint64_t v5 = 0;
        }
        else {
          uint64_t v5 = 11;
        }
      }
      CFRelease(v8);
    }
    else
    {
      Value = 0;
      uint64_t v5 = 2;
    }
  }
  *a3 = Value;
  return v5;
}

uint64_t kpep_db_is_internal(uint64_t a1, unsigned char *a2)
{
  uint64_t result = 1;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a1 + 149))
    {
      uint64_t result = 0;
      *a2 = *(unsigned char *)(a1 + 148);
    }
    else
    {
      return 9;
    }
  }
  return result;
}

void kpep_db_free(uint64_t a1)
{
  if (a1)
  {
    int v2 = *(const void **)(a1 + 32);
    if (v2) {
      CFRelease(v2);
    }
    uint64_t v3 = *(const void **)(a1 + 56);
    if (v3) {
      CFRelease(v3);
    }
    uint64_t v4 = *(const void **)(a1 + 24);
    if (v4) {
      CFRelease(v4);
    }
    if (*(void *)(a1 + 88))
    {
      uint64_t v5 = 0;
      unint64_t v6 = 0;
      do
      {
        event_free(*(void *)(a1 + 40) + v5);
        ++v6;
        v5 += 56;
      }
      while (*(void *)(a1 + 88) > v6);
    }
    free(*(void **)(a1 + 40));
    free(*(void **)(a1 + 48));
    free(*(void **)a1);
    free(*(void **)(a1 + 16));
    free(*(void **)(a1 + 8));
    free((void *)a1);
  }
}

uint64_t create_plist_url(CFStringRef filePath, uint64_t a2, const __CFURL **a3)
{
  uint64_t v5 = *MEMORY[0x263EFFB08];
  CFURLRef v6 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x263EFFB08], filePath, kCFURLPOSIXPathStyle, 1u);
  if (!v6) {
    return 2;
  }
  CFURLRef v7 = v6;
  if (!CFURLHasDirectoryPath(v6) || (CFURLRef v8 = (const __CFURL *)MEMORY[0x216672AC0](v5, a2, 0, 0, v7)) == 0)
  {
    uint64_t v10 = 6;
LABEL_9:
    CFRelease(v7);
    return v10;
  }
  CFURLRef v9 = v8;
  if (!CFURLResourceIsReachable(v8, 0))
  {
    CFRelease(v9);
    uint64_t v10 = 7;
    goto LABEL_9;
  }
  CFRelease(v7);
  uint64_t v10 = 0;
  *a3 = v9;
  return v10;
}

uint64_t kpep_event_name(void *a1, void *a2)
{
  uint64_t result = 1;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *a1;
    }
  }
  return result;
}

uint64_t kpep_event_alias(uint64_t a1, void *a2)
{
  uint64_t result = 1;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(void *)(a1 + 24);
    }
  }
  return result;
}

uint64_t kpep_event_description(uint64_t a1, void *a2)
{
  uint64_t result = 1;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(void *)(a1 + 8);
    }
  }
  return result;
}

uint64_t kpep_event_errata(uint64_t a1, void *a2)
{
  uint64_t result = 1;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(void *)(a1 + 16);
    }
  }
  return result;
}

uint64_t event_init(uint64_t a1, const __CFDictionary *a2, const __CFString *a3, uint64_t a4)
{
  unsigned int v11 = 0;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(void *)(a4 + 48) = 0;
  if (alloc_cstr(a3, (void *)a4, 0)
    || CFDictionaryContainsKey(a2, @"description")
    && get_cstr_val(a2, @"description", (void *)(a4 + 8), 0))
  {
    goto LABEL_2;
  }
  if (CFDictionaryContainsKey(a2, @"errata")) {
    get_cstr_val(a2, @"errata", (void *)(a4 + 16), 0);
  }
  if (CFDictionaryContainsKey(a2, @"fixed_counter"))
  {
    *(unsigned char *)(a4 + 48) |= 1u;
    get_cstr_val(a2, @"fallback", (void *)(a4 + 32), 0);
  }
  else
  {
    if (get_uint_val(a2, @"number", (int *)&v11) || HIWORD(v11)) {
      goto LABEL_2;
    }
    *(_WORD *)(a4 + 44) = v11;
  }
  if (CFDictionaryContainsKey(a2, @"counters_mask"))
  {
    int v10 = 0;
    if (get_uint_val(a2, @"counters_mask", &v10)) {
      goto LABEL_2;
    }
    int v8 = v10;
  }
  else
  {
    int v8 = *(_DWORD *)(a1 + 136);
  }
  *(_DWORD *)(a4 + 40) = v8;
  if (*(_DWORD *)(a1 + 128) != 1) {
    return 0;
  }
  int v9 = 0;
  uint64_t result = get_uint_val(a2, @"umask", &v9);
  if (!result)
  {
    *(unsigned char *)(a4 + 46) = v9;
    return result;
  }
LABEL_2:
  free(*(void **)a4);
  free(*(void **)(a4 + 8));
  return 1;
}

void event_free(uint64_t a1)
{
  if (a1)
  {
    free(*(void **)a1);
    free(*(void **)(a1 + 8));
    free(*(void **)(a1 + 24));
    free(*(void **)(a1 + 16));
    int v2 = *(void **)(a1 + 32);
    free(v2);
  }
}

uint64_t event_cmp(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int16 *)(*(void *)a1 + 44);
  unsigned int v3 = *(unsigned __int16 *)(*(void *)a2 + 44);
  if (v2 < v3) {
    return 0xFFFFFFFFLL;
  }
  if (v2 != v3) {
    return 1;
  }
  unsigned int v5 = *(unsigned __int8 *)(*(void *)a1 + 46);
  unsigned int v6 = *(unsigned __int8 *)(*(void *)a2 + 46);
  if (v5 < v6) {
    return 0xFFFFFFFFLL;
  }
  return v5 != v6;
}

char *kpep_strerror(unsigned int a1)
{
  if (a1 > 0xF) {
    return "unknown error";
  }
  if (a1 != 15) {
    return error_names[a1];
  }
  int v2 = *__error();
  return strerror(v2);
}

uint64_t counters_count(void *a1, char a2)
{
  if ((a2 & 2) == 0)
  {
    if ((a2 & 4) != 0)
    {
      uint64_t v2 = a1[15];
      if ((a2 & 1) == 0) {
        return v2;
      }
    }
    else
    {
      uint64_t v2 = 0;
      if ((a2 & 1) == 0) {
        return v2;
      }
    }
    goto LABEL_8;
  }
  uint64_t v2 = a1[14];
  if ((a2 & 4) != 0) {
    v2 -= a1[15];
  }
  if (a2) {
LABEL_8:
  }
    v2 += a1[13];
  return v2;
}

uint64_t get_cstr_val(const __CFDictionary *a1, const void *a2, void *a3, CFIndex *a4)
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
  if (!Value) {
    return 10;
  }
  CFStringRef v7 = Value;
  CFTypeID v8 = CFGetTypeID(Value);
  if (v8 != CFStringGetTypeID()) {
    return 10;
  }
  return alloc_cstr(v7, a3, a4);
}

uint64_t alloc_cstr(const __CFString *a1, void *a2, CFIndex *a3)
{
  CFIndex v6 = CFStringGetLength(a1) + 1;
  CFStringRef v7 = malloc_type_malloc(v6, 0x3D1E9135uLL);
  if (v7 && CFStringGetCString(a1, (char *)v7, v6, 0x600u))
  {
    *a2 = v7;
    uint64_t result = 0;
    if (a3) {
      *a3 = v6;
    }
  }
  else
  {
    free(v7);
    return 2;
  }
  return result;
}

uint64_t get_uint_val(const __CFDictionary *a1, const void *a2, int *a3)
{
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (!Value) {
    return 10;
  }
  CFNumberRef v5 = Value;
  CFTypeID v6 = CFGetTypeID(Value);
  if (v6 != CFNumberGetTypeID()) {
    return 10;
  }
  int valuePtr = -1;
  int v7 = CFNumberGetValue(v5, kCFNumberIntType, &valuePtr);
  uint64_t result = 10;
  if (v7)
  {
    if ((valuePtr & 0x80000000) == 0)
    {
      uint64_t result = 0;
      *a3 = valuePtr;
    }
  }
  return result;
}

uint64_t get_BOOL_val(const __CFDictionary *a1, const void *a2, BOOL *a3)
{
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  if (!Value) {
    return 10;
  }
  CFBooleanRef v5 = Value;
  CFTypeID v6 = CFGetTypeID(Value);
  if (v6 != CFBooleanGetTypeID()) {
    return 10;
  }
  int v7 = CFBooleanGetValue(v5);
  uint64_t result = 0;
  *a3 = v7 != 0;
  return result;
}

uint64_t dict_copy_items(const void *a1, CFIndex *a2, void *a3, const void ***a4)
{
  CFTypeID v8 = CFGetTypeID(a1);
  if (v8 != CFDictionaryGetTypeID() || (CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)a1), Count < 0))
  {
    uint64_t v12 = 0;
    uint64_t v15 = 10;
LABEL_8:
    free(v12);
    return v15;
  }
  CFIndex v10 = Count;
  size_t v11 = 8 * Count;
  uint64_t v12 = malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
  if (!v12 || (uint64_t v13 = (const void **)malloc_type_malloc(v11, 0xC0040B8AA526DuLL)) == 0)
  {
    uint64_t v15 = 2;
    goto LABEL_8;
  }
  CFTypeID v14 = v13;
  CFDictionaryGetKeysAndValues((CFDictionaryRef)a1, (const void **)v12, v13);
  uint64_t v15 = 0;
  *a2 = v10;
  *a3 = v12;
  *a4 = v14;
  return v15;
}

uint64_t dict_set_string(__CFDictionary *a1, const char *a2)
{
  CFStringRef v4 = CFStringCreateWithCString(0, a2, 0x600u);
  if (!v4) {
    return 1;
  }
  CFStringRef v5 = v4;
  CFDictionarySetValue(a1, a2, v4);
  CFRelease(v5);
  return 0;
}

uint64_t kperf_log()
{
  if (kperf_log_init_once != -1) {
    dispatch_once(&kperf_log_init_once, &__block_literal_global);
  }
  return kperf_log_log;
}

os_log_t __kperf_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.libkperf", "log");
  kperf_log_log = (uint64_t)result;
  return result;
}

void *chunkbuf_init(uint64_t a1, int a2, char a3)
{
  *(void *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)a1 = a2;
  *(unsigned char *)(a1 + 8) = a3;
  off_t v4 = lseek(a2, 0, 1);
  *(void *)(a1 + 40) = v4;
  *(unsigned char *)(a1 + 9) = v4 != -1;
  if (v4 == -1) {
    *(void *)(a1 + 40) = 0;
  }
  *(void *)(a1 + 24) = 1024;
  os_log_t result = malloc_type_malloc(0x400uLL, 0xD0410F15uLL);
  *(void *)(a1 + 16) = result;
  return result;
}

void chunkbuf_free(uint64_t a1)
{
  *(void *)(a1 + 16) = 0;
}

uint64_t chunkbuf_flush(uint64_t a1)
{
  return shipout(a1, *(char **)(a1 + 16), *(void *)(a1 + 32));
}

uint64_t shipout(uint64_t a1, char *__buf, size_t __nbyte)
{
  if (!*(unsigned char *)(a1 + 8)) {
    return 9;
  }
  size_t v3 = __nbyte;
  *(void *)(a1 + 32) = 0;
  if (!__nbyte) {
    return *(unsigned int *)(a1 + 4);
  }
  while (1)
  {
    ssize_t v6 = write(*(_DWORD *)a1, __buf, v3);
    if (v6 < 0) {
      break;
    }
    *(void *)(a1 + 40) += v6;
    __buf += v6;
    v3 -= v6;
LABEL_6:
    if (!v3) {
      return *(unsigned int *)(a1 + 4);
    }
  }
  if (*__error() == 4) {
    goto LABEL_6;
  }
  uint64_t v8 = *__error();
  uint64_t result = *(unsigned int *)(a1 + 4);
  if (v8)
  {
    if (!result)
    {
      *(_DWORD *)(a1 + 4) = v8;
      return v8;
    }
  }
  return result;
}

uint64_t chunkbuf_align(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 8)) {
    return 9;
  }
  uint8x8_t v2 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
  v2.i16[0] = vaddlv_u8(v2);
  if (v2.u32[0] != 1) {
    return 22;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  size_t v5 = *(void *)(a1 + 24);
  size_t v6 = (a2 - 1) & -(*(void *)(a1 + 40) + v4);
  if (v6 + v4 <= v5)
  {
    bzero((void *)(*(void *)(a1 + 16) + v4), v6);
    size_t v9 = *(void *)(a1 + 32) + v6;
  }
  else
  {
    size_t v7 = v5 - v4;
    bzero((void *)(*(void *)(a1 + 16) + v4), v5 - v4);
    uint64_t result = shipout(a1, *(char **)(a1 + 16), *(void *)(a1 + 24));
    if (result) {
      return result;
    }
    size_t v9 = v6 - v7;
    bzero(*(void **)(a1 + 16), *(void *)(a1 + 24));
    for (size_t i = *(void *)(a1 + 24); v9 > i; v9 -= i)
    {
      uint64_t result = shipout(a1, *(char **)(a1 + 16), i);
      if (result) {
        return result;
      }
      size_t i = *(void *)(a1 + 24);
    }
  }
  uint64_t result = 0;
  *(void *)(a1 + 32) = v9;
  return result;
}

uint64_t chunkbuf_write_internal(uint64_t a1, char *__src, size_t a3)
{
  uint64_t v4 = __src;
  uint64_t v7 = *(void *)(a1 + 24);
  size_t v6 = *(void *)(a1 + 32);
  size_t v9 = v7 - v6;
  BOOL v8 = v7 == v6;
  size_t v10 = v7 - v6 + v7;
  if (!v8 && v10 > a3)
  {
    memcpy((void *)(*(void *)(a1 + 16) + v6), __src, v9);
    size_t v6 = *(void *)(a1 + 32) + v9;
    *(void *)(a1 + 32) = v6;
    v4 += v9;
    a3 -= v9;
  }
  uint64_t result = shipout(a1, *(char **)(a1 + 16), v6);
  if (!result)
  {
    if (a3 >= *(void *)(a1 + 24))
    {
      return shipout(a1, v4, a3);
    }
    else
    {
      memcpy(*(void **)(a1 + 16), v4, a3);
      uint64_t result = 0;
      *(void *)(a1 + 32) = a3;
    }
  }
  return result;
}

uint64_t chunkbuf_chunk_begin(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (!*(unsigned char *)(a1 + 8)) {
    return 9;
  }
  uint64_t v4 = *(unsigned int *)(a1 + 52);
  if (v4 < 2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    unint64_t v7 = *(void *)(a1 + 24);
    *(void *)(a1 + 8 * v4 + 56) = v6 + *(void *)(a1 + 40);
    *(void *)&long long v8 = __PAIR64__(a3, a2);
    *((void *)&v8 + 1) = -1;
    if (v6 + 16 <= v7)
    {
      *(_OWORD *)(*(void *)(a1 + 16) + v6) = v8;
      *(void *)(a1 + 32) += 16;
    }
    else
    {
      uint64_t result = chunkbuf_write_internal(a1, (char *)&v8, 0x10uLL);
      if (result) {
        return result;
      }
    }
    uint64_t result = 0;
    ++*(_DWORD *)(a1 + 52);
  }
  else
  {
    uint64_t result = *(unsigned int *)(a1 + 4);
    if (!result)
    {
      uint64_t result = 22;
      *(_DWORD *)(a1 + 4) = 22;
    }
  }
  return result;
}

uint64_t chunkbuf_chunk_end(uint64_t a1)
{
  uint64_t result = pop_chunk(a1, 0);
  if (!result)
  {
    return chunkbuf_align(a1, 8);
  }
  return result;
}

uint64_t pop_chunk(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 8)) {
    return 9;
  }
  int v3 = *(_DWORD *)(a1 + 52);
  if (!v3) {
    return 22;
  }
  unsigned int v4 = v3 - 1;
  *(_DWORD *)(a1 + 52) = v4;
  uint64_t v5 = *(void *)(a1 + 8 * v4 + 56);
  if (v5 == -1) {
    return 22;
  }
  size_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t __buf = a2 - v5 + v7 + v6 - 16;
  off_t v8 = v5 + 8;
  if (v5 + 8 >= v7)
  {
    uint64_t result = 0;
    *(void *)(*(void *)(a1 + 16) + v5 + 8 - v7) = __buf;
  }
  else if (v5 + 16 <= v7 || (uint64_t result = shipout(a1, *(char **)(a1 + 16), v6), !result))
  {
    ssize_t v10 = pwrite(*(_DWORD *)a1, &__buf, 8uLL, v8);
    if (v10 < 0)
    {
      uint64_t v11 = *__error();
      uint64_t result = *(unsigned int *)(a1 + 4);
      if (v11 && !result)
      {
        *(_DWORD *)(a1 + 4) = v11;
        return v11;
      }
    }
    else if (v10 == 8)
    {
      return 0;
    }
    else
    {
      uint64_t result = *(unsigned int *)(a1 + 4);
      if (!result)
      {
        uint64_t result = 5;
        *(_DWORD *)(a1 + 4) = 5;
      }
    }
  }
  return result;
}

uint64_t chunkbuf_write_chunk_end(void *a1, void *a2, size_t a3)
{
  uint64_t result = pop_chunk((uint64_t)a1, a3);
  if (!result)
  {
    uint64_t v7 = a1[4];
    if (v7 + a3 <= a1[3])
    {
      memcpy((void *)(a1[2] + v7), a2, a3);
      a1[4] += a3;
    }
    else
    {
      uint64_t result = chunkbuf_write_internal((uint64_t)a1, (char *)a2, a3);
      if (result) {
        return result;
      }
    }
    return chunkbuf_align((uint64_t)a1, 8);
  }
  return result;
}

uint64_t chunkbuf_read(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (*(unsigned char *)(a1 + 8)) {
    return 9;
  }
  size_t v4 = a2 * a3;
  BOOL v5 = !is_mul_ok(a2, a3);
  if (a2 * a3) {
    BOOL v6 = !v5;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
    *__error() = 22;
    return -1;
  }
  uint64_t v8 = *(unsigned int *)(a1 + 48);
  unint64_t v9 = v4 + v8;
  unint64_t v10 = *(void *)(a1 + 32);
  if (v4 + v8 <= v10) {
    return v10 - v8;
  }
  unint64_t v11 = *(void *)(a1 + 24);
  if (v9 > v11)
  {
    trunc_prefix((void **)a1);
    uint64_t v8 = *(unsigned int *)(a1 + 48);
    unint64_t v11 = *(void *)(a1 + 24);
    unint64_t v9 = v4 + v8;
  }
  if (v9 > v11)
  {
    uint64_t v12 = malloc_type_realloc(*(void **)(a1 + 16), v4, 0xE915858AuLL);
    if (!v12)
    {
      int v14 = *(_DWORD *)(a1 + 4);
      if (!v14)
      {
        int v14 = 12;
        *(_DWORD *)(a1 + 4) = 12;
      }
      *__error() = v14;
      return -1;
    }
    *(void *)(a1 + 16) = v12;
    *(void *)(a1 + 24) = v4;
    uint64_t v8 = *(unsigned int *)(a1 + 48);
    unint64_t v9 = v4 + v8;
  }
  unint64_t v10 = *(void *)(a1 + 32);
  if (v9 <= v10) {
    return v10 - v8;
  }
  while (1)
  {
    ssize_t v13 = read(*(_DWORD *)a1, (void *)(*(void *)(a1 + 16) + v10), v9 - v10);
    if (v13 < 1) {
      break;
    }
    unint64_t v10 = *(void *)(a1 + 32) + v13;
    *(void *)(a1 + 32) = v10;
LABEL_21:
    if (v9 <= v10) {
      goto LABEL_27;
    }
  }
  if (!v13)
  {
    unint64_t v10 = *(void *)(a1 + 32);
LABEL_27:
    uint64_t v8 = *(unsigned int *)(a1 + 48);
    return v10 - v8;
  }
  if (*__error() == 4)
  {
    unint64_t v10 = *(void *)(a1 + 32);
    goto LABEL_21;
  }
  int v15 = *__error();
  uint64_t result = -1;
  if (v15)
  {
    if (!*(_DWORD *)(a1 + 4)) {
      *(_DWORD *)(a1 + 4) = v15;
    }
  }
  return result;
}

void **trunc_prefix(void **result)
{
  uint64_t v1 = *((unsigned int *)result + 12);
  if (v1)
  {
    uint8x8_t v2 = result;
    uint64_t result = (void **)memmove(result[2], (char *)result[2] + v1, (size_t)result[4] - v1);
    uint64_t v3 = *((unsigned int *)v2 + 12);
    size_t v4 = (char *)v2[4] - v3;
    BOOL v5 = (char *)v2[5] + v3;
    v2[4] = v4;
    v2[5] = v5;
    *((_DWORD *)v2 + 12) = 0;
  }
  return result;
}

void **chunkbuf_advance(void **result, uint64_t a2)
{
  if (!*((unsigned char *)result + 8))
  {
    uint64_t v2 = (uint64_t)result;
    uint64_t v3 = *((unsigned int *)result + 12);
    uint64_t v4 = v3 + a2;
    BOOL v5 = result[4];
    if (v3 + a2 <= (unint64_t)v5)
    {
      *((_DWORD *)result + 12) = v4;
    }
    else if (*((unsigned char *)result + 9))
    {
      uint64_t result = (void **)lseek(*(_DWORD *)result, (off_t)result[5] + v4, 0);
      *(_DWORD *)(v2 + 48) = 0;
      *(void *)(v2 + 32) = 0;
      *(void *)(v2 + 40) = result;
    }
    else
    {
      unint64_t v6 = a2 - (void)v5 + v3;
      *((_DWORD *)result + 12) = v5;
      trunc_prefix(result);
      chunkbuf_read(v2, 1uLL, v6);
      *(_DWORD *)(v2 + 48) = *(void *)(v2 + 32);
      return trunc_prefix((void **)v2);
    }
  }
  return result;
}

uint64_t chunkbuf_set_marker(uint64_t result, unsigned int a2, uint64_t a3)
{
  *(void *)(result + 8 * a2 + 56) = *(void *)(result + 40) + a3 + *(unsigned int *)(result + 48);
  return result;
}

uint64_t chunkbuf_get_marker(uint64_t a1, unsigned int a2)
{
  return *(void *)(a1 + 8 * a2 + 56) - (*(void *)(a1 + 40) + *(unsigned int *)(a1 + 48));
}

uint64_t kpfile_read_status(_DWORD *a1)
{
  int v1 = a1[1];
  if (v1) {
    return v1 != -1;
  }
  if (a1[18] > 4u)
  {
    int v5 = a1[36];
    if (v5 == 7424) {
      return 4;
    }
    if (v5 == 7936 || v5 == 7680) {
      return 5;
    }
    BOOL v3 = a1[269] == 2;
    unsigned int v4 = 2;
  }
  else
  {
    BOOL v3 = a1[34] == 0;
    unsigned int v4 = 4;
  }
  if (v3) {
    return v4 + 1;
  }
  else {
    return v4;
  }
}

uint64_t kpfile_close(uint64_t a1)
{
  if (!a1) {
    return 9;
  }
  if (*(unsigned char *)(a1 + 8))
  {
    get_to_stage_body(a1);
    chunkbuf_flush(a1);
  }
  if (close(*(_DWORD *)a1) == -1) {
    uint64_t v2 = *__error();
  }
  else {
    uint64_t v2 = 0;
  }
  chunkbuf_free(a1);
  free(*(void **)(a1 + 128));
  free((void *)a1);
  return v2;
}

uint64_t get_to_stage_body(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(result + 1076);
  if (v2 != 1)
  {
    if (v2) {
      return result;
    }
    get_to_stage_header(result);
  }
  int v3 = *(_DWORD *)(v1 + 72);
  if (v3 == 3)
  {
    *(_DWORD *)__src = 1437204737;
    uint64_t v5 = *(void *)(v1 + 32);
    if ((unint64_t)(v5 + 4) <= *(void *)(v1 + 24))
    {
      *(_DWORD *)(*(void *)(v1 + 16) + v5) = *(_DWORD *)__src;
      uint64_t v6 = *(void *)(v1 + 32) + 4;
      *(void *)(v1 + 32) = v6;
    }
    else
    {
      chunkbuf_write_internal(v1, __src, 4uLL);
      uint64_t v6 = *(void *)(v1 + 32);
    }
    *(_DWORD *)__src = *(_DWORD *)(v1 + 120);
    if ((unint64_t)(v6 + 4) <= *(void *)(v1 + 24))
    {
      *(_DWORD *)(*(void *)(v1 + 16) + v6) = *(_DWORD *)__src;
      uint64_t v7 = *(void *)(v1 + 32) + 4;
      *(void *)(v1 + 32) = v7;
    }
    else
    {
      chunkbuf_write_internal(v1, __src, 4uLL);
      uint64_t v7 = *(void *)(v1 + 32);
    }
    uint64_t v8 = *(void **)(v1 + 128);
    uint64_t v9 = 16 * *(unsigned int *)(v1 + 120);
    if ((unint64_t)(v7 + v9) <= *(void *)(v1 + 24))
    {
      memcpy((void *)(*(void *)(v1 + 16) + v7), v8, 16 * *(unsigned int *)(v1 + 120));
      *(void *)(v1 + 32) += v9;
    }
    else
    {
      chunkbuf_write_internal(v1, (char *)v8, 16 * *(unsigned int *)(v1 + 120));
    }
  }
  else if (v3 == 5)
  {
    if (*(unsigned char *)(v1 + 140))
    {
      size_t v10 = 256;
      if (!sysctlbyname("hw.model", __src, &v10, 0, 0))
      {
        size_t v4 = v10;
        if (v10)
        {
          if (!__src[v10 - 1])
          {
            --v10;
            --v4;
          }
          kpfile_add_header(v1, 0x1A00u, 0, __src, v4);
        }
      }
    }
    uint64_t result = chunkbuf_chunk_end(v1);
    goto LABEL_23;
  }
  uint64_t result = chunkbuf_align(v1, 4096);
LABEL_23:
  *(_DWORD *)(v1 + 1076) = 2;
  return result;
}

uint64_t kpfile_get_fileno(unsigned int *a1)
{
  return *a1;
}

uint64_t kpfile_get_error(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4);
}

char *kpfile_strerror(int a1)
{
  if ((a1 - 106) >= 5) {
    return strerror(a1);
  }
  else {
    return (&off_264139008)[a1 - 106];
  }
}

uint64_t kpfile_get_format(uint64_t a1)
{
  return *(unsigned int *)(a1 + 72);
}

uint64_t kpfile_get_bitwidth(uint64_t a1)
{
  return *(unsigned int *)(a1 + 76);
}

uint64_t kpfile_get_walltime(uint64_t a1, void *a2, _OWORD *a3, void *a4)
{
  if (a2) {
    *a2 = *(void *)(a1 + 104);
  }
  if (a3) {
    *a3 = *(_OWORD *)(a1 + 80);
  }
  if (a4) {
    *a4 = *(void *)(a1 + 96);
  }
  int v4 = *(_DWORD *)(a1 + 72) - 1;
  if (v4 > 3) {
    return 2;
  }
  else {
    return dword_2107A4E00[v4];
  }
}

uint64_t kpfile_set_walltime(uint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  *(void *)(a1 + 104) = a2;
  if (a3) {
    *(_OWORD *)(a1 + 80) = *a3;
  }
  if (a4) {
    *(void *)(a1 + 96) = *a4;
  }
  return 0;
}

uint64_t kpfile_set_frequency(uint64_t a1, unint64_t a2)
{
  unint64_t v8 = a2;
  if (a2) {
    goto LABEL_2;
  }
  size_t v7 = 8;
  uint64_t result = sysctlbyname("hw.tbfrequency", &v8, &v7, 0, 0);
  if (result) {
    return result;
  }
  a2 = v8;
  if (v8)
  {
LABEL_2:
    unint64_t v3 = a2;
    unint64_t v4 = 1000000000;
    do
    {
      unint64_t v5 = v4;
      unint64_t v4 = v3;
      unint64_t v3 = v5 % v3;
    }
    while (v3);
  }
  else
  {
    unint64_t v4 = 1000000000;
  }
  if (!(a2 / v4)) {
    return 22;
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 112) = 0x3B9ACA00 / v4;
  *(_DWORD *)(a1 + 116) = a2 / v4;
  return result;
}

uint64_t kpfile_set_timebase(uint64_t a1, int a2, int a3)
{
  if (!a3) {
    return 22;
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 112) = a2;
  *(_DWORD *)(a1 + 116) = a3;
  return result;
}

BOOL kpfile_get_timebase(_DWORD *a1, _DWORD *a2, _DWORD *a3)
{
  if (a2) {
    *a2 = a1[28];
  }
  if (a3) {
    *a3 = a1[29];
  }
  return a1[18] > 3u;
}

uint64_t kpfile_set_localhost_defaults(uint64_t a1)
{
  *(unsigned char *)(a1 + 140) = 1;
  return kpfile_set_frequency(a1, 0);
}

uint64_t kpfile_get_cpumap(uint64_t a1, void *__dst, unsigned int a3)
{
  uint64_t result = *(unsigned int *)(a1 + 120);
  if (result >= a3) {
    unsigned int v5 = a3;
  }
  else {
    unsigned int v5 = result;
  }
  if (v5)
  {
    memcpy(__dst, *(const void **)(a1 + 128), 16 * a3);
    return *(unsigned int *)(a1 + 120);
  }
  return result;
}

uint64_t kpfile_set_cpumap(uint64_t a1, const void *a2, unsigned int a3)
{
  free(*(void **)(a1 + 128));
  *(_DWORD *)(a1 + 120) = 0;
  uint64_t v6 = malloc_type_calloc(a3, 0x10uLL, 0x1000040451B5BE8uLL);
  *(void *)(a1 + 128) = v6;
  if (!v6) {
    return 12;
  }
  *(_DWORD *)(a1 + 120) = a3;
  memcpy(v6, a2, 16 * a3);
  return *(unsigned int *)(a1 + 4);
}

uint64_t kpfile_openin(uint64_t *a1, char *a2)
{
  *a1 = 0;
  int v3 = open(a2, 0);
  if (v3 == -1) {
    return *__error();
  }
  int v4 = v3;
  uint64_t v5 = kpfile_fdopenin_internal(a1, v3);
  if (v5) {
    close(v4);
  }
  return v5;
}

uint64_t kpfile_fdopenin_internal(uint64_t *a1, int a2)
{
  *a1 = 0;
  if (a2 < 0) {
    return 9;
  }
  int v4 = malloc_type_calloc(1uLL, 0x438uLL, 0x1030040D2FD2135uLL);
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    chunkbuf_init((uint64_t)v4, a2, 0);
    uint64_t v6 = chunkbuf_read(v5, 1uLL, 8uLL);
    if (v6 <= 7)
    {
      if (v6 < 0)
      {
        uint64_t v7 = *__error();
        goto LABEL_58;
      }
      goto LABEL_5;
    }
    uint64_t v8 = *(void *)(v5 + 16);
    uint64_t v9 = *(unsigned int *)(v5 + 48);
    int v10 = *(_DWORD *)(v8 + v9);
    if (v10 > 1437204991)
    {
      if (v10 == 1437204992)
      {
        *(_DWORD *)(v5 + 72) = 4;
        uint64_t v11 = chunkbuf_read(v5, 0x120uLL, 1uLL);
        if (v11 == 288)
        {
          uint64_t v36 = *(void *)(v5 + 16) + *(unsigned int *)(v5 + 48);
          *(_DWORD *)(v5 + 136) = *(_DWORD *)(v36 + 4);
          *(void *)(v5 + 80) = *(void *)(v36 + 8);
          *(_DWORD *)(v5 + 88) = *(_DWORD *)(v36 + 16);
          if (*(_DWORD *)(v36 + 20)) {
            int v37 = 64;
          }
          else {
            int v37 = 32;
          }
          *(_DWORD *)(v5 + 76) = v37;
          kpfile_set_frequency(v5, *(void *)(v36 + 24));
          chunkbuf_advance((void **)v5, 288);
          if (!analyze_threadmap(v5, *(_DWORD *)(v5 + 76)))
          {
            unsigned int v39 = 28;
            if (*(_DWORD *)(v5 + 76) == 64) {
              unsigned int v39 = 32;
            }
            uint64_t v24 = ((v39 * (unint64_t)*(unsigned int *)(v5 + 136) + 4383) & 0x7FFFFFF000) - 288;
            goto LABEL_63;
          }
          goto LABEL_57;
        }
        goto LABEL_44;
      }
      if (v10 != 1437205248)
      {
LABEL_48:
        *(_DWORD *)(v5 + 72) = 1;
        unsigned int v34 = *(_DWORD *)(v8 + v9);
        *(_DWORD *)(v5 + 136) = v34;
        if (v34 <= 0x186A0)
        {
          chunkbuf_advance((void **)v5, 4);
          uint64_t v7 = analyze_threadmap(v5, 0);
          if (v7) {
            goto LABEL_58;
          }
          unsigned int v35 = 28;
          if (*(_DWORD *)(v5 + 76) == 64) {
            unsigned int v35 = 32;
          }
          uint64_t v24 = ((v35 * (unint64_t)*(unsigned int *)(v5 + 136) + 4099) & 0x7FFFFFF000) - 4;
          goto LABEL_63;
        }
        goto LABEL_57;
      }
    }
    else if (v10 != 4096)
    {
      if (v10 == 1437204737)
      {
        *(_DWORD *)(v5 + 72) = 2;
        chunkbuf_set_marker(v5, 0, 0);
        uint64_t v11 = chunkbuf_read(v5, 0x18uLL, 1uLL);
        if (v11 == 24)
        {
          uint64_t v12 = *(void *)(v5 + 16) + *(unsigned int *)(v5 + 48);
          *(_DWORD *)(v5 + 136) = *(_DWORD *)(v12 + 4);
          unint64_t v13 = *(void *)(v12 + 8);
          if (!v13) {
            v13 >>= 32;
          }
          *(void *)(v5 + 80) = v13;
          *(_DWORD *)(v5 + 88) = *(_DWORD *)(v12 + 16);
          chunkbuf_advance((void **)v5, 20);
          if (!analyze_threadmap(v5, 32)
            || (chunkbuf_advance((void **)v5, 4), !analyze_threadmap(v5, 32))
            || !analyze_threadmap(v5, 64))
          {
            unsigned int v14 = 28;
            if (*(_DWORD *)(v5 + 76) == 64) {
              unsigned int v14 = 32;
            }
            unint64_t v15 = v14 * (unint64_t)*(unsigned int *)(v5 + 136);
            unint64_t v16 = (v15 - chunkbuf_get_marker(v5, 0) + 4095) & 0xFFFFFFFFFFFFF000;
            unint64_t v17 = v16 + chunkbuf_get_marker(v5, 0);
            chunkbuf_set_marker(v5, 0, v17);
            unint64_t v18 = v15 + 8;
            uint64_t v19 = chunkbuf_read(v5, 1uLL, v15 + 8);
            if (v19 != -1)
            {
              if (v19 != v18) {
                goto LABEL_64;
              }
              uint8x8_t v20 = (_DWORD *)(*(void *)(v5 + 16) + *(unsigned int *)(v5 + 48) + v15);
              if (*v20 != 1437204737) {
                goto LABEL_64;
              }
              size_t v21 = v20[1];
              if (v21 > 0x3E8) {
                goto LABEL_64;
              }
              *(_DWORD *)(v5 + 72) = 3;
              *(_DWORD *)(v5 + 120) = v21;
              *(void *)(v5 + 128) = malloc_type_calloc(v21, 0x10uLL, 0xD237FE16uLL);
              unint64_t v22 = v18 + 16 * v21;
              uint64_t v23 = chunkbuf_read(v5, 1uLL, v22);
              if (v23 != -1)
              {
                if (v23 == v22)
                {
                  memcpy(*(void **)(v5 + 128), (const void *)(*(void *)(v5 + 16) + *(unsigned int *)(v5 + 48) + v15 + 8), 16 * v21);
                  if (v22 > v17)
                  {
                    uint64_t v24 = ((v22 - v17 + 4095) & 0xFFFFFFFFFFFFF000) + v17;
LABEL_63:
                    chunkbuf_set_marker(v5, 0, v24);
                  }
LABEL_64:
                  uint64_t v7 = 0;
                  *a1 = v5;
                  return v7;
                }
LABEL_5:
                uint64_t v7 = 107;
LABEL_58:
                kpfile_close(v5);
                return v7;
              }
            }
            goto LABEL_45;
          }
LABEL_57:
          uint64_t v7 = 106;
          goto LABEL_58;
        }
LABEL_44:
        if (v11 != -1) {
          goto LABEL_5;
        }
        goto LABEL_45;
      }
      goto LABEL_48;
    }
    *(_DWORD *)(v5 + 72) = 5;
    uint64_t v7 = parse_chunk_header(v5);
    if (v7) {
      goto LABEL_58;
    }
    uint64_t marker = chunkbuf_get_marker(v5, 0);
    chunkbuf_set_marker(v5, 1u, marker);
    chunkbuf_set_marker(v5, 0, 40);
    unint64_t v26 = *(void *)(v5 + 152);
    if (v26 < 0x28) {
      goto LABEL_5;
    }
    unint64_t v27 = chunkbuf_read(v5, v26, 1uLL);
    if (v27 != -1)
    {
      unint64_t v28 = *(void *)(v5 + 152);
      if (v27 < v28) {
        goto LABEL_5;
      }
      uint64_t v29 = *(void *)(v5 + 16) + *(unsigned int *)(v5 + 48);
      *(_DWORD *)(v5 + 112) = *(_DWORD *)v29;
      *(_DWORD *)(v5 + 116) = *(_DWORD *)(v29 + 4);
      *(void *)(v5 + 104) = *(void *)(v29 + 8);
      *(void *)(v5 + 80) = *(void *)(v29 + 16);
      *(_DWORD *)(v5 + 88) = *(_DWORD *)(v29 + 24);
      *(_DWORD *)(v5 + 96) = *(_DWORD *)(v29 + 28);
      *(_DWORD *)(v5 + 100) = *(_DWORD *)(v29 + 32);
      if (*(_DWORD *)(v29 + 36)) {
        int v30 = 64;
      }
      else {
        int v30 = 32;
      }
      *(_DWORD *)(v5 + 76) = v30;
      if (v28 >= 0x38)
      {
        uint64_t v31 = 40;
        do
        {
          size_t v32 = (_DWORD *)(v29 + v31);
          unint64_t v33 = *(void *)(v29 + v31 + 8);
          if ((uint64_t)(v31 + v33 + 16) > (uint64_t)v28) {
            goto LABEL_5;
          }
          if (*v32 == 7168)
          {
            *(_DWORD *)(v5 + 120) = v33 >> 4;
            size_t v40 = v33 & 0xFFFFFFFF0;
            v41 = malloc_type_malloc(v33 & 0xFFFFFFFF0, 0x75888BABuLL);
            *(void *)(v5 + 128) = v41;
            if (v41)
            {
              memcpy(v41, v32 + 4, v40);
              break;
            }
            uint64_t v7 = 12;
            goto LABEL_58;
          }
          v31 += (v33 + 23) & 0xFFFFFFFFFFFFFFF8;
        }
        while (v31 + 16 <= v28);
      }
      *(_DWORD *)(v5 + 1076) = 1;
      kpfile_read_next(v5);
      uint64_t v7 = *(_DWORD *)(v5 + 4) & ~(*(int *)(v5 + 4) >> 31);
LABEL_46:
      if (v7) {
        goto LABEL_58;
      }
      goto LABEL_64;
    }
LABEL_45:
    uint64_t v7 = *__error();
    goto LABEL_46;
  }
  close(a2);
  return 12;
}

uint64_t kpfile_openout(void *a1, char *a2, int a3, int a4)
{
  *a1 = 0;
  int v8 = open(a2, 513, 438);
  if (v8 == -1) {
    return *__error();
  }
  uint64_t v9 = kpfile_fdopenout_internal(a1, v8, a3, a4);
  if (v9) {
    unlink(a2);
  }
  return v9;
}

uint64_t kpfile_fdopenout_internal(void *a1, int a2, int a3, int a4)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  *a1 = 0;
  if (a2 < 0) {
    return 9;
  }
  int v4 = a4;
  if (!a4)
  {
    long long v45 = xmmword_2107A4DF0;
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
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    memset(v14, 0, sizeof(v14));
    size_t v13 = 648;
    int v8 = sysctl((int *)&v45, 4u, v14, &v13, 0, 0);
    int v4 = (v15 & 4) != 0 ? 64 : 32;
    if (v8 == -1) {
      goto LABEL_17;
    }
  }
  if (v4 == 32 || v4 == 64)
  {
    uint64_t v9 = malloc_type_calloc(1uLL, 0x438uLL, 0x1030040D2FD2135uLL);
    if (v9)
    {
      int v10 = v9;
      if (!a3) {
        a3 = 5;
      }
      chunkbuf_init((uint64_t)v9, a2, 1);
      uint64_t result = 0;
      v10[18] = a3;
      v10[19] = v4;
      if (a3 == 5) {
        int v12 = 3;
      }
      else {
        int v12 = 0;
      }
      v10[268] = v12;
      *a1 = v10;
    }
    else
    {
      close(a2);
      return 12;
    }
  }
  else
  {
LABEL_17:
    close(a2);
    return 22;
  }
  return result;
}

uint64_t kpfile_fdopenin(uint64_t *a1, int a2)
{
  int v3 = dup(a2);
  if (v3 == -1) {
    return *__error();
  }
  return kpfile_fdopenin_internal(a1, v3);
}

uint64_t kpfile_fdopenout(void *a1, int a2, int a3, int a4)
{
  int v7 = dup(a2);
  if (v7 == -1) {
    return *__error();
  }
  return kpfile_fdopenout_internal(a1, v7, a3, a4);
}

unint64_t kpfile_read_threadmap(uint64_t a1, char *a2, unint64_t a3, char a4)
{
  unsigned int v6 = a4 & 0x60;
  if (v6 != 32 && v6 != 64) {
    goto LABEL_19;
  }
  if (v6 == 64) {
    unint64_t v7 = 32;
  }
  else {
    unint64_t v7 = 28;
  }
  unint64_t v8 = *(unsigned int *)(a1 + 136);
  if (a3 / v7 >= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = (a3 / v7);
  }
  if (v9)
  {
    if (*(_DWORD *)(a1 + 76) == 64) {
      unint64_t v10 = 32;
    }
    else {
      unint64_t v10 = 28;
    }
    unint64_t v11 = chunkbuf_read(a1, v10, v9);
    if (v11 == -1)
    {
      int v12 = *__error();
      goto LABEL_17;
    }
    if (v11 < v10 * (unint64_t)v9)
    {
      int v12 = 108;
LABEL_17:
      unint64_t v9 = 0;
LABEL_20:
      *(_DWORD *)(a1 + 4) = v12;
      return v9;
    }
    if (v6 < *(_DWORD *)(a1 + 76))
    {
LABEL_19:
      unint64_t v9 = 0;
      int v12 = 22;
      goto LABEL_20;
    }
    uint64_t v14 = *(void *)(a1 + 16);
    uint64_t v15 = *(unsigned int *)(a1 + 48);
    if (v7 == v10)
    {
      memcpy(a2, (const void *)(v14 + v15), v10 * (unint64_t)v9);
    }
    else
    {
      long long v16 = a2 + 8;
      uint64_t v17 = v15 + v14 + 4;
      int v18 = v9;
      do
      {
        *((void *)v16 - 1) = *(unsigned int *)(v17 - 4);
        long long v19 = *(_OWORD *)v17;
        *((void *)v16 + 2) = *(void *)(v17 + 16);
        *(_OWORD *)long long v16 = v19;
        v16 += v7;
        v17 += v10;
        --v18;
      }
      while (v18);
    }
    chunkbuf_advance((void **)a1, v10 * (unint64_t)v9);
    int v20 = *(_DWORD *)(a1 + 136) - v9;
    *(_DWORD *)(a1 + 136) = v20;
    if (!v20) {
      kpfile_read_next(a1);
    }
  }
  return v9;
}

void kpfile_read_next(uint64_t a1)
{
  if (!a1 || *(_DWORD *)(a1 + 4)) {
    return;
  }
  uint64_t marker = chunkbuf_get_marker(a1, 0);
  if ((marker & 0x8000000000000000) == 0)
  {
    uint64_t v3 = marker;
    while (1)
    {
      int v4 = *(_DWORD *)(a1 + 72);
      chunkbuf_advance((void **)a1, v3);
      if (v4 != 5)
      {
        chunkbuf_set_marker(a1, 0, -1);
        *(_DWORD *)(a1 + 1076) = 2;
        *(_DWORD *)(a1 + 144) = 7680;
        *(void *)(a1 + 152) = -1;
        return;
      }
      int v5 = parse_chunk_header(a1);
      if (v5)
      {
        *(_DWORD *)(a1 + 4) = v5;
        return;
      }
      int v6 = *(_DWORD *)(a1 + 1076);
      if (v6 != 1) {
        goto LABEL_12;
      }
      if ((chunkbuf_get_marker(a1, 1u) & 0x8000000000000000) == 0) {
        break;
      }
      *(_DWORD *)(a1 + 1076) = 2;
LABEL_15:
      if (*(_DWORD *)(a1 + 4)) {
        return;
      }
      *(_DWORD *)(a1 + 136) = 0;
      int v7 = *(_DWORD *)(a1 + 144);
      if (v7 == 7680)
      {
        if (*(void *)(a1 + 152) < 8uLL || chunkbuf_read(a1, 8uLL, 1uLL) != 8)
        {
LABEL_31:
          int v10 = 109;
          goto LABEL_32;
        }
        *(void *)(a1 + 160) = *(void *)(*(void *)(a1 + 16) + *(unsigned int *)(a1 + 48));
        uint64_t v9 = *(void *)(a1 + 152);
        if (v9 != -1) {
          *(void *)(a1 + 152) = v9 - 8;
        }
        chunkbuf_advance((void **)a1, 8);
      }
      else
      {
        if (v7 != 7936)
        {
          if (v7 == 7424)
          {
            unint64_t v11 = 28;
            if (*(_DWORD *)(a1 + 76) == 64) {
              unint64_t v11 = 32;
            }
            *(_DWORD *)(a1 + 136) = *(void *)(a1 + 152) / v11;
          }
          return;
        }
        if (*(void *)(a1 + 152) < 0xCuLL || chunkbuf_read(a1, 0xCuLL, 1uLL) != 12) {
          goto LABEL_31;
        }
        *(void *)(a1 + 160) = *(void *)(*(void *)(a1 + 16) + *(unsigned int *)(a1 + 48));
        uint64_t v8 = *(void *)(a1 + 152);
        if (v8 != -1) {
          *(void *)(a1 + 152) = v8 - 12;
        }
        chunkbuf_advance((void **)a1, 12);
        kdbg_comp_reset((_DWORD *)(a1 + 168));
      }
      if (*(void *)(a1 + 152)) {
        return;
      }
LABEL_29:
      uint64_t v3 = chunkbuf_get_marker(a1, 0);
      if (v3 < 0) {
        goto LABEL_30;
      }
    }
    int v6 = *(_DWORD *)(a1 + 1076);
    if (v6 == 1)
    {
      if (*(_DWORD *)(a1 + 144) != 7168) {
        return;
      }
      goto LABEL_29;
    }
LABEL_12:
    if (v6 != 2) {
      return;
    }
    goto LABEL_15;
  }
LABEL_30:
  int v10 = -1;
LABEL_32:
  *(_DWORD *)(a1 + 4) = v10;
}

uint64_t kpfile_write_threadmap(uint64_t a1, char *a2, uint64_t a3, char a4)
{
  if (!a1 || !*(unsigned char *)(a1 + 8)) {
    return 9;
  }
  uint64_t v5 = a3;
  unsigned int v7 = a4 & 0x60;
  if (v7 != 64 && v7 != 32 || v7 < *(_DWORD *)(a1 + 76)) {
    return 22;
  }
  *(_DWORD *)(a1 + 136) = a3;
  get_to_stage_header(a1);
  unsigned int v8 = *(_DWORD *)(a1 + 72);
  if (v8 <= 4 && ((1 << v8) & 0x16) != 0)
  {
    if (*(_DWORD *)(a1 + 1076) == 1)
    {
      if (v7 == 64) {
        uint64_t v9 = 32;
      }
      else {
        uint64_t v9 = 28;
      }
LABEL_22:
      if (v7 == *(_DWORD *)(a1 + 76))
      {
        size_t v12 = v9 * v5;
        uint64_t v13 = *(void *)(a1 + 32);
        if (v13 + v12 <= *(void *)(a1 + 24))
        {
          memcpy((void *)(*(void *)(a1 + 16) + v13), a2, v12);
          *(void *)(a1 + 32) += v12;
        }
        else
        {
          chunkbuf_write_internal(a1, a2, v12);
        }
      }
      else if (v5)
      {
        uint64_t v14 = a2 + 8;
        do
        {
          uint64_t v15 = v14 - 8;
          uint64_t v16 = *(void *)(a1 + 32);
          if ((unint64_t)(v16 + 4) <= *(void *)(a1 + 24))
          {
            *(_DWORD *)(*(void *)(a1 + 16) + v16) = *(_DWORD *)v15;
            uint64_t v17 = *(void *)(a1 + 32) + 4;
            *(void *)(a1 + 32) = v17;
          }
          else
          {
            chunkbuf_write_internal(a1, v15, 4uLL);
            uint64_t v17 = *(void *)(a1 + 32);
          }
          if ((unint64_t)(v17 + 24) <= *(void *)(a1 + 24))
          {
            uint64_t v18 = *(void *)(a1 + 16) + v17;
            long long v19 = *(_OWORD *)v14;
            *(void *)(v18 + 16) = *((void *)v14 + 2);
            *(_OWORD *)uint64_t v18 = v19;
            *(void *)(a1 + 32) += 24;
          }
          else
          {
            chunkbuf_write_internal(a1, v14, 0x18uLL);
          }
          v14 += v9;
          --v5;
        }
        while (v5);
      }
      if (*(_DWORD *)(a1 + 72) == 5) {
        chunkbuf_chunk_end(a1);
      }
      return *(unsigned int *)(a1 + 4);
    }
    return 22;
  }
  if (v7 == 64) {
    uint64_t v9 = 32;
  }
  else {
    uint64_t v9 = 28;
  }
  if (v8 != 5) {
    goto LABEL_22;
  }
  BOOL v11 = *(_DWORD *)(a1 + 76) != 64;
  get_to_stage_body(a1);
  chunkbuf_chunk_begin(a1, 0x1D00u, 0);
  if ((v7 == 64) == v11) {
    goto LABEL_22;
  }
  return chunkbuf_write_chunk_end((void *)a1, a2, v9 * v5);
}

uint64_t get_to_stage_header(uint64_t result)
{
  if (!*(_DWORD *)(result + 1076))
  {
    uint64_t v1 = result;
    switch(*(_DWORD *)(result + 72))
    {
      case 1:
        LODWORD(__src) = *(_DWORD *)(result + 136);
        goto LABEL_22;
      case 2:
      case 3:
        LODWORD(__src) = 1437204737;
        uint64_t v2 = *(void *)(result + 32);
        if ((unint64_t)(v2 + 4) <= *(void *)(result + 24))
        {
          *(_DWORD *)(*(void *)(result + 16) + v2) = __src;
          uint64_t v3 = *(void *)(result + 32) + 4;
          *(void *)(result + 32) = v3;
        }
        else
        {
          uint64_t result = chunkbuf_write_internal(result, (char *)&__src, 4uLL);
          uint64_t v3 = *(void *)(v1 + 32);
        }
        LODWORD(__src) = *(_DWORD *)(v1 + 136);
        if ((unint64_t)(v3 + 4) <= *(void *)(v1 + 24))
        {
          *(_DWORD *)(*(void *)(v1 + 16) + v3) = __src;
          uint64_t v8 = *(void *)(v1 + 32) + 4;
          *(void *)(v1 + 32) = v8;
        }
        else
        {
          uint64_t result = chunkbuf_write_internal(v1, (char *)&__src, 4uLL);
          uint64_t v8 = *(void *)(v1 + 32);
        }
        unint64_t __src = *(void *)(v1 + 80);
        if ((unint64_t)(v8 + 8) <= *(void *)(v1 + 24))
        {
          *(void *)(*(void *)(v1 + 16) + v8) = __src;
          uint64_t v9 = *(void *)(v1 + 32) + 8;
          *(void *)(v1 + 32) = v9;
        }
        else
        {
          uint64_t result = chunkbuf_write_internal(v1, (char *)&__src, 8uLL);
          uint64_t v9 = *(void *)(v1 + 32);
        }
        LODWORD(__src) = *(_DWORD *)(v1 + 88);
        if ((unint64_t)(v9 + 4) <= *(void *)(v1 + 24))
        {
          *(_DWORD *)(*(void *)(v1 + 16) + v9) = __src;
          *(void *)(v1 + 32) += 4;
        }
        else
        {
          uint64_t result = chunkbuf_write_internal(v1, (char *)&__src, 4uLL);
        }
        if (*(_DWORD *)(v1 + 76) == 64)
        {
          LODWORD(__src) = 0;
LABEL_22:
          uint64_t v10 = *(void *)(v1 + 32);
          if ((unint64_t)(v10 + 4) <= *(void *)(v1 + 24))
          {
            *(_DWORD *)(*(void *)(v1 + 16) + v10) = __src;
            *(void *)(v1 + 32) += 4;
          }
          else
          {
            uint64_t result = chunkbuf_write_internal(v1, (char *)&__src, 4uLL);
          }
        }
        break;
      case 4:
        LODWORD(__src) = 1437204992;
        uint64_t v4 = *(void *)(result + 32);
        if ((unint64_t)(v4 + 4) <= *(void *)(result + 24))
        {
          *(_DWORD *)(*(void *)(result + 16) + v4) = __src;
          uint64_t v5 = *(void *)(result + 32) + 4;
          *(void *)(result + 32) = v5;
        }
        else
        {
          uint64_t result = chunkbuf_write_internal(result, (char *)&__src, 4uLL);
          uint64_t v5 = *(void *)(v1 + 32);
        }
        LODWORD(__src) = *(_DWORD *)(v1 + 136);
        if ((unint64_t)(v5 + 4) <= *(void *)(v1 + 24))
        {
          *(_DWORD *)(*(void *)(v1 + 16) + v5) = __src;
          uint64_t v11 = *(void *)(v1 + 32) + 4;
          *(void *)(v1 + 32) = v11;
        }
        else
        {
          uint64_t result = chunkbuf_write_internal(v1, (char *)&__src, 4uLL);
          uint64_t v11 = *(void *)(v1 + 32);
        }
        unint64_t __src = *(void *)(v1 + 80);
        if ((unint64_t)(v11 + 8) <= *(void *)(v1 + 24))
        {
          *(void *)(*(void *)(v1 + 16) + v11) = __src;
          uint64_t v13 = *(void *)(v1 + 32) + 8;
          *(void *)(v1 + 32) = v13;
        }
        else
        {
          uint64_t result = chunkbuf_write_internal(v1, (char *)&__src, 8uLL);
          uint64_t v13 = *(void *)(v1 + 32);
        }
        LODWORD(__src) = *(_DWORD *)(v1 + 88);
        if ((unint64_t)(v13 + 4) <= *(void *)(v1 + 24))
        {
          *(_DWORD *)(*(void *)(v1 + 16) + v13) = __src;
          uint64_t v15 = *(void *)(v1 + 32) + 4;
          *(void *)(v1 + 32) = v15;
        }
        else
        {
          uint64_t result = chunkbuf_write_internal(v1, (char *)&__src, 4uLL);
          uint64_t v15 = *(void *)(v1 + 32);
        }
        LODWORD(__src) = *(_DWORD *)(v1 + 76) == 64;
        if ((unint64_t)(v15 + 4) <= *(void *)(v1 + 24))
        {
          *(_DWORD *)(*(void *)(v1 + 16) + v15) = __src;
          *(void *)(v1 + 32) += 4;
        }
        else
        {
          uint64_t result = chunkbuf_write_internal(v1, (char *)&__src, 4uLL);
        }
        unint64_t v18 = *(unsigned int *)(v1 + 112);
        if (v18) {
          unint64_t v19 = 1000000000 * (unint64_t)*(unsigned int *)(v1 + 116) / v18;
        }
        else {
          unint64_t v19 = 0;
        }
        unint64_t __src = v19;
        uint64_t v22 = *(void *)(v1 + 32);
        if ((unint64_t)(v22 + 8) <= *(void *)(v1 + 24))
        {
          *(void *)(*(void *)(v1 + 16) + v22) = __src;
          *(void *)(v1 + 32) += 8;
        }
        else
        {
          uint64_t result = chunkbuf_write_internal(v1, (char *)&__src, 8uLL);
        }
        int v23 = 32;
        do
        {
          unint64_t __src = 0;
          uint64_t v24 = *(void *)(v1 + 32);
          if ((unint64_t)(v24 + 8) <= *(void *)(v1 + 24))
          {
            *(void *)(*(void *)(v1 + 16) + v24) = __src;
            *(void *)(v1 + 32) += 8;
          }
          else
          {
            uint64_t result = chunkbuf_write_internal(v1, (char *)&__src, 8uLL);
          }
          --v23;
        }
        while (v23);
        break;
      case 5:
        uint64_t result = chunkbuf_chunk_begin(result, 0x55AA0300u, 0);
        LODWORD(__src) = *(_DWORD *)(v1 + 112);
        uint64_t v6 = *(void *)(v1 + 32);
        if ((unint64_t)(v6 + 4) <= *(void *)(v1 + 24))
        {
          *(_DWORD *)(*(void *)(v1 + 16) + v6) = __src;
          uint64_t v7 = *(void *)(v1 + 32) + 4;
          *(void *)(v1 + 32) = v7;
        }
        else
        {
          uint64_t result = chunkbuf_write_internal(v1, (char *)&__src, 4uLL);
          uint64_t v7 = *(void *)(v1 + 32);
        }
        LODWORD(__src) = *(_DWORD *)(v1 + 116);
        if ((unint64_t)(v7 + 4) <= *(void *)(v1 + 24))
        {
          *(_DWORD *)(*(void *)(v1 + 16) + v7) = __src;
          uint64_t v12 = *(void *)(v1 + 32) + 4;
          *(void *)(v1 + 32) = v12;
        }
        else
        {
          uint64_t result = chunkbuf_write_internal(v1, (char *)&__src, 4uLL);
          uint64_t v12 = *(void *)(v1 + 32);
        }
        unint64_t __src = *(void *)(v1 + 104);
        if ((unint64_t)(v12 + 8) <= *(void *)(v1 + 24))
        {
          *(void *)(*(void *)(v1 + 16) + v12) = __src;
          uint64_t v14 = *(void *)(v1 + 32) + 8;
          *(void *)(v1 + 32) = v14;
        }
        else
        {
          uint64_t result = chunkbuf_write_internal(v1, (char *)&__src, 8uLL);
          uint64_t v14 = *(void *)(v1 + 32);
        }
        unint64_t __src = *(void *)(v1 + 80);
        if ((unint64_t)(v14 + 8) <= *(void *)(v1 + 24))
        {
          *(void *)(*(void *)(v1 + 16) + v14) = __src;
          uint64_t v16 = *(void *)(v1 + 32) + 8;
          *(void *)(v1 + 32) = v16;
        }
        else
        {
          uint64_t result = chunkbuf_write_internal(v1, (char *)&__src, 8uLL);
          uint64_t v16 = *(void *)(v1 + 32);
        }
        LODWORD(__src) = *(_DWORD *)(v1 + 88);
        if ((unint64_t)(v16 + 4) <= *(void *)(v1 + 24))
        {
          *(_DWORD *)(*(void *)(v1 + 16) + v16) = __src;
          uint64_t v17 = *(void *)(v1 + 32) + 4;
          *(void *)(v1 + 32) = v17;
        }
        else
        {
          uint64_t result = chunkbuf_write_internal(v1, (char *)&__src, 4uLL);
          uint64_t v17 = *(void *)(v1 + 32);
        }
        LODWORD(__src) = *(_DWORD *)(v1 + 96);
        if ((unint64_t)(v17 + 4) <= *(void *)(v1 + 24))
        {
          *(_DWORD *)(*(void *)(v1 + 16) + v17) = __src;
          uint64_t v20 = *(void *)(v1 + 32) + 4;
          *(void *)(v1 + 32) = v20;
        }
        else
        {
          uint64_t result = chunkbuf_write_internal(v1, (char *)&__src, 4uLL);
          uint64_t v20 = *(void *)(v1 + 32);
        }
        LODWORD(__src) = *(_DWORD *)(v1 + 100);
        if ((unint64_t)(v20 + 4) <= *(void *)(v1 + 24))
        {
          *(_DWORD *)(*(void *)(v1 + 16) + v20) = __src;
          uint64_t v21 = *(void *)(v1 + 32) + 4;
          *(void *)(v1 + 32) = v21;
        }
        else
        {
          uint64_t result = chunkbuf_write_internal(v1, (char *)&__src, 4uLL);
          uint64_t v21 = *(void *)(v1 + 32);
        }
        LODWORD(__src) = *(_DWORD *)(v1 + 76) == 64;
        if ((unint64_t)(v21 + 4) <= *(void *)(v1 + 24))
        {
          *(_DWORD *)(*(void *)(v1 + 16) + v21) = __src;
          *(void *)(v1 + 32) += 4;
        }
        else
        {
          uint64_t result = chunkbuf_write_internal(v1, (char *)&__src, 4uLL);
        }
        if (*(_DWORD *)(v1 + 120))
        {
          chunkbuf_chunk_begin(v1, 0x1C00u, 0);
          uint64_t result = chunkbuf_write_chunk_end((void *)v1, *(void **)(v1 + 128), 16 * *(unsigned int *)(v1 + 120));
        }
        break;
      default:
        break;
    }
    *(_DWORD *)(v1 + 1076) = 1;
  }
  return result;
}

void *chunkbuf_write(void *a1, void *a2, size_t __n)
{
  uint64_t v5 = a1[4];
  if (v5 + __n <= a1[3])
  {
    uint64_t result = memcpy((void *)(a1[2] + v5), a2, __n);
    a1[4] += __n;
  }
  else
  {
    return (void *)chunkbuf_write_internal((uint64_t)a1, (char *)a2, __n);
  }
  return result;
}

unint64_t kpfile_read_events(uint64_t a1, uint64_t *a2, unint64_t a3, char a4)
{
  unint64_t v6 = a4 & 0x60;
  if (v6 != 32 && v6 != 64 || (unint64_t v7 = *(unsigned int *)(a1 + 76), v6 < v7))
  {
    uint64_t v8 = 0;
    int v9 = 22;
LABEL_5:
    *(_DWORD *)(a1 + 4) = v9;
    return v8;
  }
  int v11 = *(_DWORD *)(a1 + 144);
  unint64_t v12 = a3 / v6;
  if (v11 == 7680)
  {
    unint64_t v13 = *(void *)(a1 + 152);
    if (v13 != -1)
    {
      unint64_t v14 = v13 / v7;
      if (v12 >= v14) {
        unint64_t v12 = v14;
      }
    }
    if (!v12)
    {
      uint64_t v8 = 0;
      int v9 = -1;
      goto LABEL_5;
    }
    unint64_t v15 = chunkbuf_read(a1, *(unsigned int *)(a1 + 76), v12);
    if (v15 == -1)
    {
      long long v38 = __error();
      uint64_t v8 = 0;
LABEL_72:
      int v9 = *v38;
      goto LABEL_5;
    }
    if (v15 < v12 * v7)
    {
      unint64_t v12 = v15 / v7;
      if (v15 == v15 / v7 * v7 && *(void *)(a1 + 152) == -1) {
        int v17 = -1;
      }
      else {
        int v17 = 108;
      }
      *(_DWORD *)(a1 + 4) = v17;
    }
    if (v6 == v7)
    {
      memcpy(a2, (const void *)(*(void *)(a1 + 16) + *(unsigned int *)(a1 + 48)), v12 * v7);
    }
    else if (v12)
    {
      uint64_t v39 = *(void *)(a1 + 16) + *(unsigned int *)(a1 + 48);
      unint64_t v40 = v12;
      do
      {
        *a2 = *(void *)v39 & 0xFFFFFFFFFFFFFFLL;
        a2[1] = *(unsigned int *)(v39 + 8);
        a2[2] = *(unsigned int *)(v39 + 12);
        a2[3] = *(unsigned int *)(v39 + 16);
        a2[4] = *(unsigned int *)(v39 + 20);
        a2[5] = *(unsigned int *)(v39 + 24);
        a2[6] = *(unsigned int *)(v39 + 28) | ((unint64_t)*(unsigned __int8 *)(v39 + 7) << 32);
        v39 += 32;
        a2 += 8;
        --v40;
      }
      while (v40);
    }
    chunkbuf_advance((void **)a1, v12 * v7);
    uint64_t v41 = *(void *)(a1 + 152);
    if (v41 != -1)
    {
      uint64_t v42 = v41 - v12 * v7;
      *(void *)(a1 + 152) = v42;
      if (!v42) {
        kpfile_read_next(a1);
      }
    }
    return v12;
  }
  else
  {
    if (v11 != 7936)
    {
      uint64_t v8 = 0;
      int v9 = 110;
      goto LABEL_5;
    }
    if (v6 <= a3)
    {
      uint64_t v8 = 0;
      while (!*(_DWORD *)(a1 + 4))
      {
        if (*(void *)(a1 + 152) >= 0x20000uLL) {
          unint64_t v18 = 0x20000;
        }
        else {
          unint64_t v18 = *(void *)(a1 + 152);
        }
        unint64_t v19 = chunkbuf_read(a1, 1uLL, v18);
        if (v19 == -1)
        {
          long long v38 = __error();
          goto LABEL_72;
        }
        if (v19 < v18)
        {
          if (*(void *)(a1 + 152) == -1) {
            int v20 = -1;
          }
          else {
            int v20 = 108;
          }
          *(_DWORD *)(a1 + 4) = v20;
          unint64_t v18 = v19;
        }
        unsigned int v43 = v8;
        uint64_t v21 = (char *)a2 + v6 * (unint64_t)v8;
        if (v6 == 32)
        {
          if (!v18) {
            goto LABEL_73;
          }
          unint64_t v22 = 0;
          LODWORD(v23) = 0;
          uint64_t v24 = *(void *)(a1 + 16) + *(unsigned int *)(a1 + 48);
          do
          {
            unint64_t v25 = kdbg_comp_decode((int *)(a1 + 168), (char *)(v24 + v22), v18 - v22);
            if (!v25) {
              break;
            }
            uint64_t v26 = a1 + 168 + 48 * *(unsigned int *)(a1 + 168);
            *(void *)uint64_t v21 = *(void *)(a1 + 184) & 0xFFFFFFFFFFFFFFLL | ((unint64_t)BYTE4(*(void *)(v26 + 64)) << 56);
            *(int32x4_t *)(v21 + 8) = vuzp1q_s32(*(int32x4_t *)(v26 + 24), *(int32x4_t *)(v26 + 40));
            *((int32x2_t *)v21 + 3) = vmovn_s64(*(int64x2_t *)(v26 + 56));
            v22 += v25;
            unint64_t v23 = (v23 + 1);
            if (v12 <= v23) {
              break;
            }
            v21 += 32;
          }
          while (v22 < v18);
        }
        else
        {
          uint64_t v27 = *(void *)(a1 + 16) + *(unsigned int *)(a1 + 48);
          if (*(_DWORD *)(a1 + 76) == 64)
          {
            if (!v18) {
              goto LABEL_73;
            }
            unint64_t v22 = 0;
            LODWORD(v23) = 0;
            do
            {
              unint64_t v28 = kdbg_comp_decode((int *)(a1 + 168), (char *)(v27 + v22), v18 - v22);
              if (!v28) {
                break;
              }
              unsigned int v29 = *(_DWORD *)(a1 + 168);
              *(void *)uint64_t v21 = *(void *)(a1 + 184);
              uint64_t v30 = a1 + 168 + 48 * v29;
              int v31 = *(_DWORD *)(v30 + 68);
              *((void *)v21 + 1) = *(void *)(v30 + 24);
              *((void *)v21 + 2) = *(void *)(v30 + 32);
              *((void *)v21 + 3) = *(void *)(v30 + 40);
              *((void *)v21 + 4) = *(void *)(v30 + 48);
              *((void *)v21 + 5) = *(void *)(v30 + 56);
              *((_DWORD *)v21 + 12) = *(void *)(v30 + 64);
              *((_DWORD *)v21 + 13) = v31;
              v22 += v28;
              unint64_t v23 = (v23 + 1);
              if (v12 <= v23) {
                break;
              }
              v21 += 64;
            }
            while (v22 < v18);
          }
          else
          {
            if (!v18)
            {
LABEL_73:
              chunkbuf_advance((void **)a1, 0);
LABEL_74:
              *(_DWORD *)(a1 + 4) = 109;
              return v43;
            }
            unint64_t v22 = 0;
            LODWORD(v23) = 0;
            do
            {
              unint64_t v32 = kdbg_comp_decode((int *)(a1 + 168), (char *)(v27 + v22), v18 - v22);
              if (!v32) {
                break;
              }
              unsigned int v33 = *(_DWORD *)(a1 + 168);
              *(void *)uint64_t v21 = *(void *)(a1 + 184) & 0xFFFFFFFFFFFFFFLL;
              uint64_t v34 = a1 + 168 + 48 * v33;
              int v35 = *(unsigned __int8 *)(v34 + 68);
              *((void *)v21 + 1) = *(unsigned int *)(v34 + 24);
              *((void *)v21 + 2) = *(unsigned int *)(v34 + 32);
              *((void *)v21 + 3) = *(unsigned int *)(v34 + 40);
              *((void *)v21 + 4) = *(unsigned int *)(v34 + 48);
              *((void *)v21 + 5) = *(unsigned int *)(v34 + 56);
              *((_DWORD *)v21 + 12) = *(void *)(v34 + 64);
              *((_DWORD *)v21 + 13) = v35;
              v22 += v32;
              unint64_t v23 = (v23 + 1);
              if (v12 <= v23) {
                break;
              }
              v21 += 64;
            }
            while (v22 < v18);
          }
        }
        chunkbuf_advance((void **)a1, v22);
        if (!v23) {
          goto LABEL_74;
        }
        uint64_t v8 = v23 + v43;
        uint64_t v36 = *(void *)(a1 + 152);
        if (v36 != -1)
        {
          uint64_t v37 = v36 - v22;
          *(void *)(a1 + 152) = v37;
          if (!v37)
          {
            kpfile_read_next(a1);
            return v8;
          }
        }
        v12 -= v23;
        if (!v12) {
          return v8;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

uint64_t kpfile_write_events(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, char a5)
{
  v42[32] = *MEMORY[0x263EF8340];
  if (!a1 || !*(unsigned char *)(a1 + 8)) {
    return 9;
  }
  uint64_t v10 = a5 & 0x60;
  if (v10 != 64 && v10 != 32 || v10 < *(_DWORD *)(a1 + 76)) {
    return 22;
  }
  get_to_stage_body(a1);
  if (*(_DWORD *)(a1 + 1072))
  {
    chunkbuf_chunk_begin(a1, 0x1F00u, 0);
    v42[0] = a2;
    uint64_t v12 = *(void *)(a1 + 32);
    if ((unint64_t)(v12 + 8) <= *(void *)(a1 + 24))
    {
      *(void *)(*(void *)(a1 + 16) + v12) = v42[0];
      uint64_t v13 = *(void *)(a1 + 32) + 8;
      *(void *)(a1 + 32) = v13;
    }
    else
    {
      chunkbuf_write_internal(a1, (char *)v42, 8uLL);
      uint64_t v13 = *(void *)(a1 + 32);
    }
    LODWORD(v42[0]) = a4;
    if ((unint64_t)(v13 + 4) <= *(void *)(a1 + 24))
    {
      *(_DWORD *)(*(void *)(a1 + 16) + v13) = v42[0];
      *(void *)(a1 + 32) += 4;
    }
    else
    {
      chunkbuf_write_internal(a1, (char *)v42, 4uLL);
    }
    int v16 = *(_DWORD *)(a1 + 1072);
    if (v16 == 1) {
      int v17 = 1;
    }
    else {
      int v17 = 2 * (v16 != 2);
    }
    kdbg_comp_init((_DWORD *)(a1 + 168), v17);
    if (a4)
    {
      unsigned int v18 = 1;
      unint64_t v19 = a3;
      int v20 = (unsigned int *)a3;
      do
      {
        unint64_t v21 = *(void *)v20;
        if (v10 == 32)
        {
          uint64_t v22 = v20[6];
          uint64_t v23 = v20[7];
          unsigned int v24 = *(_DWORD *)(a1 + 168);
          uint64_t v25 = a1 + 168 + 48 * v24;
          uint64_t v26 = *((void *)v20 + 1);
          uint64_t v27 = *((void *)v20 + 2);
          *(void *)&long long v28 = v26;
          *((void *)&v28 + 1) = HIDWORD(v26);
          long long v29 = v28;
          *(void *)&long long v28 = v27;
          *((void *)&v28 + 1) = HIDWORD(v27);
          *(void *)(a1 + 184) = v21 & 0xFFFFFFFFFFFFFFLL;
          *(_OWORD *)(v25 + 24) = v29;
          *(_OWORD *)(v25 + 40) = v28;
          *(void *)(v25 + 56) = v22;
          unint64_t v30 = v23 | (HIBYTE(v21) << 32);
          uint64_t v31 = 32;
        }
        else
        {
          uint64_t v32 = *((void *)v20 + 5);
          unint64_t v30 = *((void *)v20 + 6);
          unsigned int v24 = *(_DWORD *)(a1 + 168);
          uint64_t v33 = a1 + 168 + 48 * v24;
          long long v34 = *(_OWORD *)(v20 + 2);
          long long v35 = *(_OWORD *)(v20 + 6);
          *(void *)(a1 + 184) = v21;
          *(_OWORD *)(v33 + 24) = v34;
          *(_OWORD *)(v33 + 40) = v35;
          *(void *)(v33 + 56) = v32;
          uint64_t v31 = 64;
        }
        *(void *)(a1 + 48 * v24 + 232) = v30;
        int v20 = (unsigned int *)((char *)v20 + v31);
        if ((a5 & 1) == 0
          || (char *)v20 - v19 < 1
          || (v36 = kdbg_comp_encode((int *)(a1 + 168), v19, (char *)v20 - v19), unint64_t v19 = &v36[(void)v19], !v36))
        {
          size_t v37 = v19 - a3;
          if (v37)
          {
            uint64_t v38 = *(void *)(a1 + 32);
            if (v38 + v37 <= *(void *)(a1 + 24))
            {
              memcpy((void *)(*(void *)(a1 + 16) + v38), a3, v37);
              *(void *)(a1 + 32) += v37;
            }
            else
            {
              chunkbuf_write_internal(a1, a3, v37);
            }
          }
          size_t v39 = (size_t)kdbg_comp_encode((int *)(a1 + 168), v42, 0x100uLL);
          uint64_t v40 = *(void *)(a1 + 32);
          if (v40 + v39 <= *(void *)(a1 + 24))
          {
            memcpy((void *)(*(void *)(a1 + 16) + v40), v42, v39);
            *(void *)(a1 + 32) += v39;
          }
          else
          {
            chunkbuf_write_internal(a1, (char *)v42, v39);
          }
          unint64_t v19 = a3;
        }
        uint64_t v41 = v18++;
      }
      while (v41 != a4);
    }
    else
    {
      unint64_t v19 = a3;
    }
    chunkbuf_write_chunk_end((void *)a1, a3, v19 - a3);
    return *(unsigned int *)(a1 + 4);
  }
  int v14 = *(_DWORD *)(a1 + 76);
  if (*(_DWORD *)(a1 + 72) != 5) {
    goto LABEL_45;
  }
  chunkbuf_chunk_begin(a1, 0x1E00u, 0);
  v42[0] = a2;
  uint64_t v15 = *(void *)(a1 + 32);
  if ((unint64_t)(v15 + 8) <= *(void *)(a1 + 24))
  {
    *(void *)(*(void *)(a1 + 16) + v15) = v42[0];
    *(void *)(a1 + 32) += 8;
  }
  else
  {
    chunkbuf_write_internal(a1, (char *)v42, 8uLL);
  }
  if (v10 != v14)
  {
LABEL_45:
    if (v10 == v14) {
      chunkbuf_write((void *)a1, a3, v10 * a4);
    }
    else {
      write_32bit_from_64bit((void *)a1, (uint64_t)a3, a4);
    }
    if (*(_DWORD *)(a1 + 72) == 5) {
      chunkbuf_chunk_end(a1);
    }
    return *(unsigned int *)(a1 + 4);
  }
  return chunkbuf_write_chunk_end((void *)a1, a3, v10 * a4);
}

void *write_32bit_from_64bit(void *result, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    uint64_t v5 = result;
    do
    {
      unint64_t __src = *(void *)a2 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)*(_DWORD *)(a2 + 52) << 56);
      uint64_t v6 = v5[4];
      if ((unint64_t)(v6 + 8) <= v5[3])
      {
        *(void *)(v5[2] + v6) = __src;
        uint64_t v7 = v5[4] + 8;
        v5[4] = v7;
      }
      else
      {
        uint64_t result = (void *)chunkbuf_write_internal((uint64_t)v5, (char *)&__src, 8uLL);
        uint64_t v7 = v5[4];
      }
      LODWORD(__src) = *(void *)(a2 + 8);
      if ((unint64_t)(v7 + 4) <= v5[3])
      {
        *(_DWORD *)(v5[2] + v7) = __src;
        uint64_t v8 = v5[4] + 4;
        v5[4] = v8;
      }
      else
      {
        uint64_t result = (void *)chunkbuf_write_internal((uint64_t)v5, (char *)&__src, 4uLL);
        uint64_t v8 = v5[4];
      }
      LODWORD(__src) = *(void *)(a2 + 16);
      if ((unint64_t)(v8 + 4) <= v5[3])
      {
        *(_DWORD *)(v5[2] + v8) = __src;
        uint64_t v9 = v5[4] + 4;
        v5[4] = v9;
      }
      else
      {
        uint64_t result = (void *)chunkbuf_write_internal((uint64_t)v5, (char *)&__src, 4uLL);
        uint64_t v9 = v5[4];
      }
      LODWORD(__src) = *(void *)(a2 + 24);
      if ((unint64_t)(v9 + 4) <= v5[3])
      {
        *(_DWORD *)(v5[2] + v9) = __src;
        uint64_t v10 = v5[4] + 4;
        v5[4] = v10;
      }
      else
      {
        uint64_t result = (void *)chunkbuf_write_internal((uint64_t)v5, (char *)&__src, 4uLL);
        uint64_t v10 = v5[4];
      }
      LODWORD(__src) = *(void *)(a2 + 32);
      if ((unint64_t)(v10 + 4) <= v5[3])
      {
        *(_DWORD *)(v5[2] + v10) = __src;
        uint64_t v11 = v5[4] + 4;
        v5[4] = v11;
      }
      else
      {
        uint64_t result = (void *)chunkbuf_write_internal((uint64_t)v5, (char *)&__src, 4uLL);
        uint64_t v11 = v5[4];
      }
      LODWORD(__src) = *(void *)(a2 + 40);
      if ((unint64_t)(v11 + 4) <= v5[3])
      {
        *(_DWORD *)(v5[2] + v11) = __src;
        uint64_t v12 = v5[4] + 4;
        v5[4] = v12;
      }
      else
      {
        uint64_t result = (void *)chunkbuf_write_internal((uint64_t)v5, (char *)&__src, 4uLL);
        uint64_t v12 = v5[4];
      }
      LODWORD(__src) = *(_DWORD *)(a2 + 48);
      if ((unint64_t)(v12 + 4) <= v5[3])
      {
        *(_DWORD *)(v5[2] + v12) = __src;
        v5[4] += 4;
      }
      else
      {
        uint64_t result = (void *)chunkbuf_write_internal((uint64_t)v5, (char *)&__src, 4uLL);
      }
      a2 += 64;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t parse_chunk_header(uint64_t a1)
{
  unint64_t v2 = chunkbuf_read(a1, 0x10uLL, 1uLL);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v3 = v2;
  if (v2 == -1) {
    return *__error();
  }
  if (v2 > 0xF)
  {
    uint64_t v7 = *(void *)(a1 + 16) + *(unsigned int *)(a1 + 48);
    *(_DWORD *)(a1 + 144) = *(_DWORD *)v7;
    *(_DWORD *)(a1 + 148) = *(_DWORD *)(v7 + 4);
    uint64_t v8 = *(void *)(v7 + 8);
    *(void *)(a1 + 152) = v8;
    if (v8 != -1) {
      chunkbuf_set_marker(a1, 0, (v8 + 23) & 0xFFFFFFFFFFFFFFF8);
    }
    chunkbuf_advance((void **)a1, 16);
    return *(unsigned int *)(a1 + 4);
  }
  else
  {
    int v5 = *(_DWORD *)a1;
    memset(&v9, 0, sizeof(v9));
    int v6 = fstat(v5, &v9);
    uint64_t result = 109;
    if (!v6 && v9.st_size != -1)
    {
      if (v9.st_size <= (uint64_t)(*(void *)(a1 + 40) + v3)) {
        return 0xFFFFFFFFLL;
      }
      else {
        return 107;
      }
    }
  }
  return result;
}

uint64_t kpfile_set_compression(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (*(_DWORD *)(a1 + 72) != 5) {
      return 22;
    }
    if (a2 >= 3) {
      int v2 = 3;
    }
    else {
      int v2 = a2;
    }
  }
  else
  {
    int v2 = 0;
  }
  uint64_t v3 = 0;
  *(_DWORD *)(a1 + 1072) = v2;
  return v3;
}

uint64_t kpfile_add_header(uint64_t a1, unsigned int a2, unsigned int a3, void *a4, size_t a5)
{
  if (*(_DWORD *)(a1 + 1076) != 1) {
    return 22;
  }
  if (a2 == 6656) {
    *(unsigned char *)(a1 + 140) = 0;
  }
  chunkbuf_chunk_begin(a1, a2, a3);
  chunkbuf_write_chunk_end((void *)a1, a4, a5);
  return *(unsigned int *)(a1 + 4);
}

uint64_t kpfile_write_chunk_header(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (*(_DWORD *)(a1 + 1076) != 2) {
    return 22;
  }
  chunkbuf_chunk_begin(a1, a2, a3);
  return *(unsigned int *)(a1 + 4);
}

uint64_t kpfile_write_chunk_data(uint64_t a1, void *a2, size_t __n)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5 + __n <= *(void *)(a1 + 24))
  {
    memcpy((void *)(*(void *)(a1 + 16) + v5), a2, __n);
    *(void *)(a1 + 32) += __n;
  }
  else
  {
    chunkbuf_write_internal(a1, (char *)a2, __n);
  }
  return *(unsigned int *)(a1 + 4);
}

uint64_t kpfile_write_chunk_end(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4);
}

uint64_t kpfile_write_chunk(uint64_t a1, unsigned int a2, unsigned int a3, void *a4, size_t a5)
{
  uint64_t result = kpfile_write_chunk_header(a1, a2, a3);
  if (!result)
  {
    uint64_t result = kpfile_write_chunk_data(a1, a4, a5);
    if (!result)
    {
      chunkbuf_chunk_end(a1);
      return *(unsigned int *)(a1 + 4);
    }
  }
  return result;
}

uint64_t kpfile_get_chunk_tag(uint64_t a1)
{
  return *(unsigned int *)(a1 + 144);
}

uint64_t kpfile_get_chunk_sub_tag(uint64_t a1)
{
  return *(unsigned int *)(a1 + 148);
}

uint64_t kpfile_get_chunk_length(uint64_t a1)
{
  return *(void *)(a1 + 152);
}

unint64_t kpfile_read_chunk(uint64_t a1, void *a2, unint64_t a3)
{
  unint64_t v4 = *(void *)(a1 + 152);
  if (v4 >= a3) {
    unint64_t v5 = a3;
  }
  else {
    unint64_t v5 = *(void *)(a1 + 152);
  }
  if (!v5)
  {
LABEL_13:
    if (!v4) {
      kpfile_read_next(a1);
    }
    return v5;
  }
  unint64_t v7 = chunkbuf_read(a1, 1uLL, v5);
  if (v7 == -1) {
    return 0;
  }
  if (!v7)
  {
    unint64_t v5 = 0;
    *(_DWORD *)(a1 + 4) = 108;
    return v5;
  }
  if (v7 < v5) {
    unint64_t v5 = v7;
  }
  memcpy(a2, (const void *)(*(void *)(a1 + 16) + *(unsigned int *)(a1 + 48)), v5);
  chunkbuf_advance((void **)a1, v5);
  uint64_t v8 = *(void *)(a1 + 152);
  if (v8 != -1)
  {
    unint64_t v4 = v8 - v5;
    *(void *)(a1 + 152) = v4;
    goto LABEL_13;
  }
  return v5;
}

uint64_t analyze_threadmap(uint64_t a1, int a2)
{
  unint64_t v2 = *(unsigned int *)(a1 + 136);
  if (!v2) {
    return 0;
  }
  if (a2 != 64)
  {
    uint64_t v13 = chunkbuf_read(a1, 0x1CuLL, v2);
    if (v13 == -1) {
      return *__error();
    }
    LODWORD(v2) = *(_DWORD *)(a1 + 136);
    if (v13 < (28 * v2)) {
      return 106;
    }
    if (!v2) {
      goto LABEL_31;
    }
    int v14 = 0;
    uint64_t v15 = *(void *)(a1 + 16) + *(unsigned int *)(a1 + 48);
    int v16 = *(_DWORD *)(a1 + 136);
    do
    {
      uint64_t v17 = v15;
      --v16;
      v15 += 28;
      for (uint64_t i = 8; i != 28; ++i)
      {
        if (!*(unsigned char *)(v17 + i)) {
          break;
        }
        if (*(char *)(v17 + i) < 32) {
          ++v14;
        }
      }
    }
    while (v16);
    if (!v14)
    {
LABEL_31:
      uint64_t result = 0;
      int v12 = 32;
      goto LABEL_32;
    }
    if (a2 == 32) {
      return 106;
    }
  }
  uint64_t v5 = chunkbuf_read(a1, 0x20uLL, v2);
  if (v5 == -1) {
    return *__error();
  }
  int v6 = *(_DWORD *)(a1 + 136);
  if (v5 < (32 * v6)) {
    return 106;
  }
  if (v6)
  {
    int v7 = 0;
    uint64_t v8 = *(void *)(a1 + 16) + *(unsigned int *)(a1 + 48);
    do
    {
      uint64_t v9 = v8;
      --v6;
      v8 += 32;
      for (uint64_t j = 12; j != 32; ++j)
      {
        if (!*(unsigned char *)(v9 + j)) {
          break;
        }
        if (*(char *)(v9 + j) < 32) {
          ++v7;
        }
      }
    }
    while (v6);
    if (v7) {
      return 106;
    }
  }
  uint64_t result = 0;
  int v12 = 64;
LABEL_32:
  *(_DWORD *)(a1 + 76) = v12;
  return result;
}

uint64_t kpdecode_cursor_setchunk(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1[3]) {
    return 4294967294;
  }
  uint64_t result = 0;
  a1[3] = a2;
  a1[4] = a3;
  a1[5] = 0;
  a1[6] = a3;
  a1[10] = a2;
  return result;
}

double kpdecode_cursor_clearchunk(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    *(void *)(a1 + 80) = 0;
    *(void *)(a1 + 88) = 0;
    *(void *)(a1 + 96) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(unsigned char *)(a1 + 168) = 1;
  }
  return result;
}

uint64_t _kpdecode_cursor_next_kevent(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (!v1) {
    return v1;
  }
  int v2 = *(_DWORD *)a1;
  if (!*(_DWORD *)a1)
  {
    unint64_t v3 = *(void *)(a1 + 32);
    if (v3 >= 0x120)
    {
      if (*(_DWORD *)v1 == 1437204737)
      {
        uint64_t v4 = 24;
        goto LABEL_10;
      }
      if (*(_DWORD *)v1 == 1437204992)
      {
        uint64_t v4 = 288;
        if ((*(unsigned char *)(v1 + 20) & 1) == 0)
        {
          int v2 = 1;
          uint64_t v5 = 28;
          uint64_t v6 = 32;
LABEL_11:
          *(_DWORD *)a1 = v2;
          *(void *)(a1 + 8) = v6;
          *(void *)(a1 + 16) = v5;
          int v7 = *(_DWORD *)(v1 + 4);
          unint64_t v8 = (v4 + (int)v5 * (uint64_t)v7 + 4095) & 0xFFFFFFFFFFFFF000;
          *(_DWORD *)(a1 + 64) = 1;
          unint64_t v9 = v8 | v6;
          uint64_t v10 = v1 + v8;
          if (v3 >= v9) {
            uint64_t v11 = v10;
          }
          else {
            uint64_t v11 = 0;
          }
          *(void *)(a1 + 72) = a1 + 24;
          *(void *)(a1 + 80) = v11;
          uint64_t v12 = v1 + v4;
          *(void *)(a1 + 88) = v12;
          *(void *)(a1 + 96) = v12 + (int)v5 * (uint64_t)v7;
          goto LABEL_15;
        }
LABEL_10:
        int v2 = 2;
        uint64_t v5 = 32;
        uint64_t v6 = 64;
        goto LABEL_11;
      }
    }
    int v2 = 0;
  }
LABEL_15:
  if (!*(_DWORD *)(a1 + 64)) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 168) || (uint64_t v13 = *(unsigned int **)(a1 + 88)) == 0)
  {
LABEL_25:
    int v16 = *(unint64_t **)(a1 + 80);
    if (v16)
    {
      if (v2 == 2)
      {
        uint64_t v1 = *(void *)(a1 + 80);
      }
      else
      {
        unint64_t v17 = *v16;
        *(void *)(a1 + 104) = *v16 & 0xFFFFFFFFFFFFFFLL;
        uint64_t v1 = a1 + 104;
        unint64_t v18 = v16[1];
        unint64_t v19 = v16[2];
        *(void *)&long long v20 = v18;
        *((void *)&v20 + 1) = HIDWORD(v18);
        *(_OWORD *)(a1 + 112) = v20;
        int v21 = *((_DWORD *)v16 + 7);
        *(void *)(a1 + 144) = *((unsigned int *)v16 + 6);
        *(void *)&long long v20 = v19;
        *((void *)&v20 + 1) = HIDWORD(v19);
        *(_OWORD *)(a1 + 128) = v20;
        *(_DWORD *)(a1 + 152) = v21;
        *(_DWORD *)(a1 + 156) = HIBYTE(v17);
      }
      unint64_t v22 = (unint64_t)v16 + *(void *)(a1 + 8);
      if (**(void **)(a1 + 72) + *(void *)(*(void *)(a1 + 72) + 24) <= v22) {
        unint64_t v22 = 0;
      }
      *(void *)(a1 + 80) = v22;
      return v1;
    }
    return 0;
  }
  unint64_t v14 = *(void *)(a1 + 96);
  if ((unint64_t)v13 >= v14)
  {
LABEL_24:
    *(unsigned char *)(a1 + 168) = 1;
    goto LABEL_25;
  }
  while (1)
  {
    uint64_t v15 = v2 == 1 ? 4 : 8;
    if (*(unsigned int *)((char *)v13 + v15)) {
      break;
    }
    uint64_t v13 = (unsigned int *)((char *)v13 + *(void *)(a1 + 16));
    *(void *)(a1 + 88) = v13;
    if (v14 <= (unint64_t)v13) {
      goto LABEL_24;
    }
  }
  *(void *)(a1 + 104) = 0;
  uint64_t v1 = a1 + 104;
  *(void *)(a1 + 152) = 117506056;
  unsigned int v24 = (_OWORD *)(a1 + 112);
  if (v2 == 1)
  {
    long long v25 = *(_OWORD *)(v13 + 2);
    *(_DWORD *)(a1 + 128) = v13[6];
    _OWORD *v24 = v25;
    uint64_t v26 = *v13;
  }
  else
  {
    long long v27 = *(_OWORD *)(v13 + 3);
    *(_DWORD *)(a1 + 128) = v13[7];
    _OWORD *v24 = v27;
    uint64_t v26 = *(void *)v13;
  }
  *(void *)(a1 + 144) = v26;
  *(void *)(a1 + 88) = (char *)v13 + *(void *)(a1 + 16);
  return v1;
}

void *kpdecode_cursor_create()
{
  double result = malloc_type_calloc(1uLL, 0xCE0uLL, 0x10B0040D3690215uLL);
  if (result) {
    result[10] = 0;
  }
  return result;
}

uint64_t kpdecode_cursor_get_stats(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    if (*(_DWORD *)(a1 + 64)) {
      return *(int *)(a1 + 196);
    }
    return -1;
  }
  if (a2 || !*(_DWORD *)(a1 + 64)) {
    return -1;
  }
  uint64_t v2 = *(void *)(a1 + 176);
  if (v2) {
    return *(void *)(v2 + 7432);
  }
  else {
    return *(void *)(a1 + 8) * *(int *)(a1 + 192);
  }
}

uint64_t kpdecode_cursor_set_option(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    return -1;
  }
  uint64_t result = *(unsigned __int8 *)(a1 + 3292);
  *(unsigned char *)(a1 + 3292) = a3 != 0;
  return result;
}

void kpdecode_record_free(void *a1)
{
  uint64_t v2 = (void *)a1[841];
  if (v2) {
    free(v2);
  }
  unint64_t v3 = (void *)a1[921];
  if (v3) {
    free(v3);
  }
  uint64_t v4 = (void **)a1[930];
  if (v4)
  {
    do
    {
      uint64_t v5 = (void **)*v4;
      free(v4[1]);
      free(v4);
      uint64_t v4 = v5;
    }
    while (v5);
  }
  free(a1);
}

const void *kpdecode_record_id_string_get_content(void *a1, uint64_t *a2)
{
  uint64_t v4 = a1[917];
  if (!v4)
  {
    uint64_t v5 = a1 + 844;
    uint64_t v7 = a1[876];
    goto LABEL_30;
  }
  uint64_t v5 = *(const void **)v4;
  size_t v6 = *(void *)(v4 + 8);
  if ((unint64_t)*(unsigned __int16 *)(v4 + 26) << 16 != 0x10000)
  {
    unint64_t v8 = malloc_type_malloc(0x10uLL, 0x20040A4A59CD2uLL);
    *unint64_t v8 = a1[930];
    unint64_t v9 = (const void **)malloc_type_calloc(1uLL, 0x20uLL, 0x1090040F898E8EEuLL);
    v8[1] = v9;
    v9[3] = (const void *)65537;
    a1[930] = v8;
    size_t v10 = a1[876];
    uint64_t v11 = (char *)*v9;
    if (*v9)
    {
      uint64_t v12 = v9[2];
      if ((unsigned char *)v12 - (unsigned char *)v9[1] >= v10) {
        goto LABEL_16;
      }
      unint64_t v13 = 2 * (void)v12;
      int v14 = 1 << -(char)__clz((unint64_t)v12 + v10 - 1);
      if (v13 <= v14) {
        size_t v15 = v14;
      }
      else {
        size_t v15 = v13;
      }
      uint64_t v11 = (char *)reallocf(v11, v15);
    }
    else
    {
      int v16 = 1 << -(char)__clz(v10 - 1);
      if (v16 <= 0x100) {
        int v16 = 256;
      }
      size_t v15 = v16;
      uint64_t v11 = (char *)malloc_type_malloc(v16, 0xFD0F0A50uLL);
    }
    *unint64_t v9 = v11;
    if (!v11) {
      goto LABEL_22;
    }
    v9[2] = (const void *)v15;
LABEL_16:
    memcpy((char *)v9[1] + (void)v11, a1 + 844, v10);
    unint64_t v17 = (char *)*v9;
    size_t v18 = (size_t)v9[1] + v10;
    v9[1] = (const void *)v18;
    if (v17)
    {
      unint64_t v19 = v9[2];
      if ((char *)v19 - v18 >= (char *)v6) {
        goto LABEL_27;
      }
      unint64_t v20 = 2 * (void)v19;
      int v21 = 1 << -(char)__clz((unint64_t)v19 + v6 - 1);
      if (v20 <= v21) {
        size_t v22 = v21;
      }
      else {
        size_t v22 = v20;
      }
      unint64_t v17 = (char *)reallocf(v17, v22);
LABEL_25:
      *unint64_t v9 = v17;
      if (!v17)
      {
        uint64_t v5 = 0;
        goto LABEL_29;
      }
      v9[2] = (const void *)v22;
LABEL_27:
      memcpy((char *)v9[1] + (void)v17, v5, v6);
      uint64_t v5 = *v9;
      v9[1] = (char *)v9[1] + v6;
LABEL_29:
      a1[917] = v9;
      uint64_t v7 = (uint64_t)v9[1] - 1;
      goto LABEL_30;
    }
LABEL_22:
    int v23 = 1 << -(char)__clz(v6 - 1);
    if (v23 <= 0x100) {
      int v23 = 256;
    }
    size_t v22 = v23;
    unint64_t v17 = (char *)malloc_type_malloc(v23, 0xFD0F0A50uLL);
    goto LABEL_25;
  }
  uint64_t v7 = v6 - 1;
LABEL_30:
  *a2 = v7;
  return v5;
}

uint64_t kpdecode_cursor_next_record(uint64_t a1, void *a2)
{
  while ((record_ready(a1) & 1) == 0)
  {
    uint64_t kevent = _kpdecode_cursor_next_kevent(a1);
    if (!kevent) {
      break;
    }
    uint64_t v4 = kevent;
    ++*(_DWORD *)(a1 + 192);
    uint64_t v5 = (char *)malloc_type_malloc(0x1D18uLL, 0x10B00403599CD4FuLL);
    if (!v5) {
      return 2;
    }
    size_t v6 = v5;
    *((_DWORD *)v5 + 1846) = 0;
    *(void *)(v5 + 7420) = 0xFFFFFFFF00000000;
    *((_DWORD *)v5 + 6) = 0;
    *((void *)v5 + 1) = 0;
    *((void *)v5 + 2) = 0;
    *(void *)uint64_t v5 = 0;
    *((void *)v5 + 841) = 0;
    *((_DWORD *)v5 + 1570) = 0;
    *((void *)v5 + 930) = 0;
    *((void *)v5 + 926) = 0;
    *((void *)v5 + 921) = 0;
    *((void *)v5 + 920) = 0;
    *((_DWORD *)v5 + 1844) = 0;
    uint64_t v7 = *(void *)v4;
    *((void *)v5 + 1) = *(void *)v4;
    *((void *)v5 + 929) = *(void *)(a1 + 8) * *(int *)(a1 + 192);
    uint64_t v8 = *(unsigned int *)(v4 + 52);
    if (v8 < 0x40)
    {
      if (v7)
      {
        if (*(_DWORD *)(v4 + 48) != 630784000)
        {
          uint64_t v11 = a1 + 8 * v8;
          unint64_t v12 = *(void *)(v11 + 2760) + 1;
          *(void *)(v11 + 2760) = v12;
          if (v12 > *(void *)(a1 + 3272)) {
            *(void *)(a1 + 3272) = v12;
          }
        }
      }
      if (*(unsigned char *)(a1 + 3292))
      {
        *(void *)v5 |= 0x17uLL;
        int v13 = *(_DWORD *)(v4 + 48);
        *((_DWORD *)v5 + 12) = v13;
        *((void *)v5 + 7) = *(void *)(v4 + 8);
        *((void *)v5 + 8) = *(void *)(v4 + 16);
        *((void *)v5 + 9) = *(void *)(v4 + 24);
        *((void *)v5 + 10) = *(void *)(v4 + 32);
        *((void *)v5 + 2) = *(void *)(v4 + 40);
        *((_DWORD *)v5 + 6) = v8;
      }
      else
      {
        int v13 = *(_DWORD *)(v4 + 48);
      }
      if (v13 == 117571592)
      {
        uint64_t v14 = *(void *)v5 | 0x10003;
        *((_DWORD *)v5 + 6) = v8;
        uint64_t v15 = *(void *)v4;
        *(void *)uint64_t v5 = v14;
        *((void *)v5 + 1) = v15;
        int v16 = (void *)(a1 + 8 * v8);
        uint64_t v17 = v16[25];
        *((void *)v5 + 842) = v16[281];
        *((_DWORD *)v5 + 1846) = 1;
        v16[281] = v15;
        if (v17)
        {
          *(void *)v17 |= 0x8000000000000000;
          *(_DWORD *)(v17 + 7384) = 1;
          v16[25] = 0;
        }
        uint64_t v18 = v16[89];
        if (v18)
        {
          uint64_t v10 = 0;
          *(void *)v18 |= 0x8000000000000000;
          *(_DWORD *)(v18 + 7384) = 1;
          v16[89] = 0;
          uint64_t v19 = a1 + 8 * v8;
          **(void **)(v19 + 1224) |= 0x8000000000000000;
          *(void *)(v19 + 1224) = 0;
LABEL_162:
          uint64_t v63 = *(void *)v6;
          if (!*(void *)v6) {
            goto LABEL_169;
          }
LABEL_163:
          if (*(void *)(a1 + 3272) <= 0x7FFuLL) {
            *(void *)size_t v6 = v63 | 0x20000;
          }
          ++*(_DWORD *)(a1 + 196);
          *((void *)v6 + 924) = 0;
          uint64_t v69 = *(void *)(a1 + 184);
          if (v69) {
            *(void *)(v69 + 7392) = v6;
          }
          *(void *)(a1 + 184) = v6;
          if (*(void *)(a1 + 176)) {
            goto LABEL_170;
          }
LABEL_168:
          *(void *)(a1 + 176) = v6;
          goto LABEL_170;
        }
LABEL_161:
        uint64_t v10 = 0;
        goto LABEL_162;
      }
      uint64_t v20 = a1 + 8 * v8;
      *(void *)(v20 + 2248) = *(void *)v4;
      if (v13 == 620756993)
      {
        uint64_t v22 = *(void *)(v20 + 200);
        int v21 = (void *)(v20 + 200);
        if (!v22)
        {
          uint64_t v10 = 0;
          *int v21 = v5;
          *(void *)v5 |= 0x2007uLL;
          *((_DWORD *)v5 + 6) = v8;
          *((int32x2_t *)v5 + 837) = vmovn_s64(*(int64x2_t *)(v4 + 16));
          *((void *)v5 + 2) = *(void *)(v4 + 40);
          goto LABEL_162;
        }
        goto LABEL_24;
      }
      if (HIWORD(v13) != 1793) {
        goto LABEL_31;
      }
      if ((unsigned __int16)v13 >> 2 == 4)
      {
        if (v13)
        {
          *(void *)v5 |= 0x20000000uLL;
          *((_DWORD *)v5 + 6) = v8;
          *((void *)v5 + 903) = 0;
          *(_OWORD *)(v5 + 7160) = 0uLL;
          *(_OWORD *)(v5 + 7176) = 0uLL;
          *(_OWORD *)(v5 + 7192) = 0uLL;
          *(_OWORD *)(v5 + 7208) = 0uLL;
          uint64_t v37 = a1 + 8 * v8;
          if (*(void *)(v37 + 1736)) {
            goto LABEL_24;
          }
          if ((*(unsigned char *)(v4 + 48) & 2) != 0) {
            *((_DWORD *)v5 + 1846) = 1;
          }
          else {
            *(void *)(v37 + 1736) = v5;
          }
          uint64_t v64 = (const char *)(v4 + 8);
          v65 = (_DWORD *)a1;
          unint64_t v66 = 4;
          v67 = v6;
          int v68 = 3;
          goto LABEL_160;
        }
        if (!*(void *)(a1 + 8 * v8 + 1736)) {
          goto LABEL_24;
        }
        int v23 = (_DWORD *)a1;
        uint64_t v24 = v4;
        int v25 = 3;
LABEL_152:
        add_string_data(v23, v24, v25);
        goto LABEL_153;
      }
      if (!((unsigned __int16)v13 >> 2))
      {
        if ((v13 & 1) == 0)
        {
          if (*(void *)(a1 + 8 * v8 + 712))
          {
            int v23 = (_DWORD *)a1;
            uint64_t v24 = v4;
            int v25 = 1;
            goto LABEL_152;
          }
LABEL_24:
          uint64_t v10 = 2;
          goto LABEL_162;
        }
        *(void *)v5 |= 0x80000uLL;
        *((_DWORD *)v5 + 6) = v8;
        *((_OWORD *)v5 + 422) = 0uLL;
        *((_OWORD *)v5 + 423) = 0uLL;
        *((_OWORD *)v5 + 424) = 0uLL;
        *((_OWORD *)v5 + 425) = 0uLL;
        *((_OWORD *)v5 + 426) = 0uLL;
        *((_OWORD *)v5 + 427) = 0uLL;
        *((_OWORD *)v5 + 428) = 0uLL;
        *((_OWORD *)v5 + 429) = 0uLL;
        *((_OWORD *)v5 + 430) = 0uLL;
        *((_OWORD *)v5 + 431) = 0uLL;
        *((_OWORD *)v5 + 432) = 0uLL;
        *((_OWORD *)v5 + 433) = 0uLL;
        *((_OWORD *)v5 + 434) = 0uLL;
        *((_OWORD *)v5 + 435) = 0uLL;
        *((_OWORD *)v5 + 436) = 0uLL;
        *((_OWORD *)v5 + 437) = 0uLL;
        *((_OWORD *)v5 + 438) = 0uLL;
        *((void *)v5 + 878) = 0;
        uint64_t v35 = a1 + 8 * v8;
        if (*(void *)(v35 + 712)) {
          goto LABEL_24;
        }
        uint64_t v36 = *(void *)(v4 + 8);
        *((void *)v5 + 877) = *(void *)(v4 + 16);
        *((_DWORD *)v5 + 1756) = v36;
        if ((*(unsigned char *)(v4 + 48) & 2) != 0) {
          *((_DWORD *)v5 + 1846) = 1;
        }
        else {
          *(void *)(v35 + 712) = v5;
        }
        *((void *)v5 + 917) = 0;
        uint64_t v64 = (const char *)(v4 + 24);
        v65 = (_DWORD *)a1;
        unint64_t v66 = 2;
        v67 = v6;
        int v68 = 1;
LABEL_160:
        batch_get_bytes(v65, v64, v66, v67, v68);
        goto LABEL_161;
      }
LABEL_31:
      uint64_t v26 = a1 + 8 * v8;
      uint64_t v29 = *(void *)(v26 + 200);
      long long v27 = (void *)(v26 + 200);
      uint64_t v28 = v29;
      if (v29)
      {
        if (v13 > 620888115)
        {
          if (v13 <= 621281283)
          {
            switch(v13)
            {
              case 621150220:
              case 621150221:
              case 621150222:
                uint64_t v33 = *(void *)v28 | 0x400;
                goto LABEL_120;
              case 621150223:
              case 621150225:
              case 621150226:
              case 621150227:
              case 621150228:
              case 621150229:
              case 621150230:
              case 621150231:
              case 621150235:
              case 621150236:
              case 621150237:
              case 621150238:
              case 621150239:
              case 621150243:
                goto LABEL_153;
              case 621150224:
                *(void *)v28 |= 0x800uLL;
                v72 = (float *)(v28 + 6544);
                v100.val[1] = (float32x2_t)vmovn_s64(*(int64x2_t *)(v4 + 24));
                v100.val[0] = (float32x2_t)vmovn_s64(*(int64x2_t *)(v4 + 8));
                vst2_f32(v72, v100);
                *(_DWORD *)(v28 + 6280) = 0;
                goto LABEL_153;
              case 621150232:
              case 621150233:
              case 621150234:
                uint64_t v49 = *(void *)v28 | 0x400;
                goto LABEL_122;
              case 621150240:
              case 621150241:
              case 621150242:
                uint64_t v33 = *(void *)v28 | 0x200;
LABEL_120:
                *(void *)uint64_t v28 = v33;
                uint64_t v50 = *(int *)(v28 + 7420);
                *(void *)(v28 + 6288 + 8 * v50) = *(void *)(v4 + 8);
                *(void *)(v28 + 6288 + 8 * ((int)v50 + 1)) = *(void *)(v4 + 16);
                *(void *)(v28 + 6288 + 8 * ((int)v50 + 2)) = *(void *)(v4 + 24);
                *(void *)(v28 + 6288 + 8 * ((int)v50 + 3)) = *(void *)(v4 + 32);
                int v51 = v50 + 4;
                goto LABEL_123;
              case 621150244:
              case 621150245:
              case 621150246:
                uint64_t v49 = *(void *)v28 | 0x200;
LABEL_122:
                *(void *)uint64_t v28 = v49;
                uint64_t v52 = *(unsigned int *)(v4 + 32) | (*(void *)(v4 + 24) << 32);
                uint64_t v53 = *(int *)(v28 + 7420);
                *(void *)(v28 + 6288 + 8 * v53) = *(unsigned int *)(v4 + 16) | (*(void *)(v4 + 8) << 32);
                *(void *)(v28 + 6288 + 8 * ((int)v53 + 1)) = v52;
                int v51 = v53 + 2;
LABEL_123:
                *(_DWORD *)(v28 + 7420) = v51;
                *(_DWORD *)(v28 + 6280) = v51;
                break;
              default:
                if (v13 == 620888116)
                {
                  unint64_t v88 = *(int *)(v28 + 7416);
                  *(_DWORD *)(v28 + 7416) = v88 + 1;
                  if (!v88) {
                    *(void *)(v28 + 6272) = *(void *)(v4 + 8);
                  }
                  if (*(void *)(v28 + 7360) > v88) {
                    *(void *)(*(void *)(v28 + 7368) + 2064 * (int)v88) = *(void *)(v4 + 8);
                  }
                }
                else if (v13 == 620888120 && (*(unsigned char *)v28 & 0x40) != 0)
                {
                  *(_DWORD *)(v28 + 7376) = *(void *)(v4 + 8);
                }
                break;
            }
            goto LABEL_153;
          }
          if (v13 <= 621412359)
          {
            if (v13 > 621281291)
            {
              if (v13 == 621281292)
              {
                *(void *)v28 |= 0x200000uLL;
                *(void *)(v28 + 6648) = *(unsigned int *)(v4 + 16) | (*(void *)(v4 + 8) << 32);
                *(void *)(v28 + 6656) = *(unsigned int *)(v4 + 32) | (*(void *)(v4 + 24) << 32);
              }
              else if (v13 == 621412356)
              {
                *(void *)v28 |= 0x1000uLL;
                *(_DWORD *)(v28 + 6560) = 0;
                uint64_t v56 = *(void *)(v4 + 8);
                if (v56 == -1)
                {
                  int v57 = 1;
                  *(_DWORD *)(v28 + 6560) = 1;
                }
                else
                {
                  int v57 = 0;
                  *(void *)(v28 + 6568) = v56;
                }
                uint64_t v92 = *(void *)(v4 + 16);
                if (v92 == -1)
                {
                  v57 |= 2u;
                  *(_DWORD *)(v28 + 6560) = v57;
                }
                else
                {
                  *(void *)(v28 + 6576) = v92;
                }
                uint64_t v94 = *(void *)(v4 + 24);
                if (v94 == -1) {
                  *(_DWORD *)(v28 + 6560) = v57 | 4;
                }
                else {
                  *(void *)(v28 + 6584) = v94;
                }
              }
            }
            else if (v13 == 621281284)
            {
              *(void *)v28 |= 0x200000uLL;
              uint64_t v73 = *(void *)(v4 + 16);
              *(void *)(v28 + 6632) = *(void *)(v4 + 8);
              *(void *)(v28 + 6640) = __ROR8__(v73, 32);
              *(_OWORD *)(v28 + 6648) = *(_OWORD *)(v4 + 24);
            }
            else if (v13 == 621281288)
            {
              *(void *)v28 |= 0x200000uLL;
              *(void *)(v28 + 6632) = *(unsigned int *)(v4 + 16) | (*(void *)(v4 + 8) << 32);
              *(int32x2_t *)(v28 + 6640) = vmovn_s64(*(int64x2_t *)(v4 + 24));
            }
            goto LABEL_153;
          }
          if (v13 <= 621412367)
          {
            if (v13 == 621412360)
            {
              *(void *)v28 |= 0x2000000uLL;
              *(_OWORD *)(v28 + 7032) = *(_OWORD *)(v4 + 8);
              *(_OWORD *)(v28 + 7048) = *(_OWORD *)(v4 + 24);
            }
            else if (v13 == 621412364)
            {
              *(_OWORD *)(v28 + 7264) = *(_OWORD *)(v4 + 8);
              *(_OWORD *)(v28 + 7280) = *(_OWORD *)(v4 + 24);
            }
            goto LABEL_153;
          }
          if (v13 == 621412368)
          {
            *(void *)v28 |= 0x80000000uLL;
            *(_OWORD *)(v28 + 7296) = *(_OWORD *)(v4 + 8);
            *(void *)(v28 + 7312) = *(void *)(v4 + 24);
          }
          else if (v13 == 630784000)
          {
            long long v58 = *(void **)(v28 + 6728);
            int v59 = *(_DWORD *)(v28 + 7424);
            if (!v58)
            {
              if (v59 != -1) {
                goto LABEL_153;
              }
              uint64_t v93 = *(void *)(v4 + 8);
              *(_DWORD *)(v28 + 6720) = v93;
              long long v58 = malloc_type_malloc(8 * (int)v93, 0x100004000313F17uLL);
              *(void *)(v28 + 6728) = v58;
              *(_DWORD *)(v28 + 7424) = 0;
              if (!v58) {
                goto LABEL_153;
              }
              int v59 = 0;
              *(void *)v28 |= 0x8000uLL;
            }
            int v60 = 0;
            int v61 = *(_DWORD *)(v28 + 6720);
            do
            {
              if (v59 >= v61) {
                break;
              }
              if (v60 | v59)
              {
                long long v62 = (void *)(v4 + 8);
                switch(v60)
                {
                  case 0:
                    goto LABEL_146;
                  case 1:
                    long long v62 = (void *)(v4 + 16);
                    goto LABEL_146;
                  case 2:
                    long long v62 = (void *)(v4 + 24);
                    goto LABEL_146;
                  case 3:
                    long long v62 = (void *)(v4 + 32);
LABEL_146:
                    long long v62 = (void *)*v62;
                    break;
                  default:
                    break;
                }
                v58[v59++] = v62;
                *(_DWORD *)(v28 + 7424) = v59;
              }
              ++v60;
            }
            while (v60 != 4);
            goto LABEL_153;
          }
          goto LABEL_153;
        }
        if (v13 <= 620822607)
        {
          if (v13 <= 620822583)
          {
            if (v13 <= 620822563)
            {
              switch(v13)
              {
                case 620756994:
                  *(_DWORD *)(v28 + 7384) = 1;
                  void *v27 = 0;
                  break;
                case 620822532:
                  *(void *)v28 |= 0x20uLL;
                  uint64_t v70 = *(void *)(v4 + 8);
                  *(void *)(v28 + 16) = *(void *)(v4 + 16);
                  uint64_t v71 = *(void *)(v4 + 32);
                  *(void *)(v28 + 96) = *(void *)(v4 + 24);
                  *(_DWORD *)(v28 + 88) = v70;
                  *(_DWORD *)(v28 + 92) = v71;
                  break;
                case 620822556:
                  uint64_t v30 = v4;
                  uint64_t v31 = (uint64_t *)v28;
                  int v32 = 1;
                  goto LABEL_110;
              }
              goto LABEL_153;
            }
            if (v13 == 620822564)
            {
              *(void *)v28 |= 0x400000uLL;
              uint64_t v77 = *(void *)(v4 + 8);
              uint64_t v78 = *(void *)(v4 + 16);
              *(void *)(v28 + 6664) = v77;
              *(_WORD *)(v28 + 6680) = v77 >> 8;
              *(unsigned char *)(v28 + 6682) = BYTE3(v77);
              *(void *)(v28 + 6672) = v78;
              goto LABEL_153;
            }
            if (v13 != 620822572)
            {
              if (v13 == 620822580)
              {
                *(void *)v28 |= 0x400000uLL;
                uint64_t v45 = *(void *)(v4 + 8);
                uint64_t v46 = *(void *)(v4 + 16);
                *(void *)(v28 + 6664) = v45;
                *(_WORD *)(v28 + 6680) = v45 >> 8;
                *(unsigned char *)(v28 + 6682) = BYTE3(v45);
                *(void *)(v28 + 6672) = *(unsigned int *)(v4 + 24) | (unint64_t)(v46 << 32);
              }
              goto LABEL_153;
            }
            *(void *)v28 |= 0x800000uLL;
            uint64_t v74 = *(void *)(v4 + 8);
LABEL_190:
            *(void *)(v28 + 6688) = v74;
            goto LABEL_153;
          }
          if (v13 > 620822595)
          {
            switch(v13)
            {
              case 620822596:
                *(void *)v28 |= 0x4000000uLL;
                *(_OWORD *)(v28 + 7064) = *(_OWORD *)(v4 + 8);
                break;
              case 620822600:
                *(void *)v28 |= 0x4000000uLL;
                *(void *)(v28 + 7064) = *(unsigned int *)(v4 + 16) | (*(void *)(v4 + 8) << 32);
                *(void *)(v28 + 7072) = *(unsigned int *)(v4 + 32) | (*(void *)(v4 + 24) << 32);
                break;
              case 620822604:
                uint64_t v30 = v4;
                uint64_t v31 = (uint64_t *)v28;
                int v32 = 2;
LABEL_110:
                add_thread_info_sched_data(v30, v31, v32);
                break;
            }
          }
          else
          {
            switch(v13)
            {
              case 620822584:
                *(void *)v28 |= 0x800000uLL;
                uint64_t v74 = *(unsigned int *)(v4 + 16) | (*(void *)(v4 + 8) << 32);
                goto LABEL_190;
              case 620822588:
                *(void *)v28 |= 0x100000uLL;
                *(void *)(v28 + 6600) = *(unsigned int *)(v4 + 16) | (*(void *)(v4 + 8) << 32);
                *(void *)(v28 + 6608) = *(unsigned int *)(v4 + 32) | (*(void *)(v4 + 24) << 32);
                break;
              case 620822592:
                uint64_t v38 = (_DWORD *)v4;
                size_t v39 = (uint64_t *)v28;
                int v40 = 1;
LABEL_215:
                add_thread_info_sched_data2_32(v38, v39, v40);
                break;
            }
          }
LABEL_153:
          uint64_t v63 = *(void *)v6;
          if (!*(void *)v6)
          {
            uint64_t v10 = 0;
LABEL_169:
            kpdecode_record_free(v6);
            goto LABEL_170;
          }
          uint64_t v10 = 0;
          *((_DWORD *)v6 + 1846) = 1;
          goto LABEL_163;
        }
        if (v13 > 620888079)
        {
          if (v13 > 620888103)
          {
            if (v13 == 620888104)
            {
              uint64_t v79 = *(int *)(v28 + 7416);
              if (v79 == 1)
              {
                unint64_t v80 = *(void *)(v4 + 16);
                if (v80 - 1001 >= 0xFFFFFFFFFFFFFC18)
                {
                  *(void *)v28 |= 0x200000000uLL;
                  int v81 = *(_DWORD *)(v4 + 8);
                  if (v80 > 0x100) {
                    v81 |= 0x10u;
                  }
                  *(_DWORD *)(v28 + 4216) = v81;
                  if (v80 >= 0x100) {
                    LODWORD(v80) = 256;
                  }
                  *(_DWORD *)(v28 + 4220) = v80;
                }
              }
              uint64_t v82 = v79 - 1;
              if (*(void *)(v28 + 7360) > (unint64_t)(v79 - 1))
              {
                unint64_t v83 = *(void *)(v4 + 16);
                if (v83 - 1001 >= 0xFFFFFFFFFFFFFC18)
                {
                  uint64_t v84 = *(void *)(v28 + 7368) + 2064 * v82;
                  *(void *)v28 |= 0x200000000uLL;
                  int v85 = *(_DWORD *)(v4 + 8);
                  if (v83 > 0x100) {
                    v85 |= 0x10u;
                  }
                  if (v83 >= 0x100) {
                    LODWORD(v83) = 256;
                  }
                  *(_DWORD *)(v84 + 8) = v85;
                  *(_DWORD *)(v84 + 12) = v83;
                }
              }
              *(_DWORD *)(v28 + 7412) = 0;
              goto LABEL_153;
            }
            if (v13 != 620888108)
            {
              if (v13 == 620888112)
              {
                size_t v47 = *(void *)(v4 + 8);
                if (v47 != -1)
                {
                  *(void *)v28 |= 0x200000000uLL;
                  *(_DWORD *)(v28 + 7416) = 0;
                  if (!*(void *)(v28 + 7368))
                  {
                    size_t v97 = v47;
                    v48 = malloc_type_calloc(v47, 0x810uLL, 0x1000040A9A4BCADuLL);
                    *(void *)(v28 + 7368) = v48;
                    if (v48)
                    {
                      *(void *)(v28 + 7360) = v97;
                      *(_OWORD *)(v28 + 7344) = *(_OWORD *)(v4 + 16);
                    }
                  }
                }
              }
              goto LABEL_153;
            }
            if ((*(unsigned char *)(v28 + 4) & 2) == 0) {
              goto LABEL_153;
            }
            uint64_t v86 = *(int *)(v28 + 7416);
            if (v86 == 1)
            {
              uint64_t v98 = *(int *)(v28 + 7416);
              add_stack_data((void *)v4, v28 + 4216, (int *)(v28 + 7408));
              uint64_t v86 = v98;
            }
            unint64_t v87 = v86 - 1;
            if (*(void *)(v28 + 7360) <= v87) {
              goto LABEL_153;
            }
            uint64_t v54 = *(void *)(v28 + 7368) + 2064 * v87 + 8;
            uint64_t v55 = 7412;
          }
          else
          {
            if (v13 != 620888080)
            {
              if (v13 == 620888084)
              {
                unint64_t v75 = *(void *)(v4 + 16);
                if (v75 - 1001 >= 0xFFFFFFFFFFFFFC18)
                {
                  *(void *)v28 |= 0x40uLL;
                  int v76 = *(_DWORD *)(v4 + 8);
                  if (v75 > 0x100) {
                    v76 |= 0x10u;
                  }
                  *(_DWORD *)(v28 + 2160) = v76;
                  if (v75 >= 0x100) {
                    LODWORD(v75) = 256;
                  }
                  *(_DWORD *)(v28 + 2164) = v75;
                }
                *(_DWORD *)(v28 + 7400) = 0;
              }
              else if (v13 == 620888088)
              {
                unint64_t v41 = *(void *)(v4 + 16);
                if (v41 - 1001 > 0xFFFFFFFFFFFFFC17)
                {
                  *(void *)v28 |= 0x80uLL;
                  uint64_t v42 = *(void *)(v4 + 8);
                  int v89 = v42 | 0x10;
                  if (v41 <= 0x100) {
                    int v89 = *(void *)(v4 + 8);
                  }
                  int v90 = 256;
                  if (v41 < 0x100) {
                    int v90 = v41;
                  }
                  *(_DWORD *)(v28 + 104) = v89;
                  *(_DWORD *)(v28 + 108) = v90;
                }
                else
                {
                  uint64_t v42 = *(void *)(v4 + 8);
                }
                if ((v42 & 0x200) != 0)
                {
                  *(void *)v28 |= 0x100000000uLL;
                  *(_DWORD *)(v28 + 7324) = v41;
                  uint64_t v91 = *(void *)(v4 + 32);
                  *(_DWORD *)(v28 + 7320) = *(void *)(v4 + 24);
                  *(_DWORD *)(v28 + 7328) = v91;
                }
                *(_DWORD *)(v28 + 7404) = 0;
              }
              goto LABEL_153;
            }
            if ((*(unsigned char *)v28 & 0x80) == 0) {
              goto LABEL_153;
            }
            uint64_t v54 = v28 + 104;
            uint64_t v55 = 7404;
          }
        }
        else
        {
          if ((v13 - 620822620) < 4)
          {
            *(void *)v28 |= 0x10000000uLL;
            long long v34 = (void *)(a1 + 8 * v8 + 1224);
            if (v13)
            {
              *long long v34 = v28;
              *(void *)(v28 + 7152) = 0;
              *(_OWORD *)(v28 + 7136) = 0uLL;
              *(_OWORD *)(v28 + 7120) = 0uLL;
              *(_OWORD *)(v28 + 7104) = 0uLL;
              *(_OWORD *)(v28 + 7088) = 0uLL;
            }
            else if (!*v34)
            {
              goto LABEL_153;
            }
            int v23 = (_DWORD *)a1;
            uint64_t v24 = v4;
            int v25 = 2;
            goto LABEL_152;
          }
          if (v13 == 620822608)
          {
            uint64_t v38 = (_DWORD *)v4;
            size_t v39 = (uint64_t *)v28;
            int v40 = 2;
            goto LABEL_215;
          }
          if (v13 != 620888076 || (*(unsigned char *)v28 & 0x40) == 0) {
            goto LABEL_153;
          }
          uint64_t v54 = v28 + 2160;
          uint64_t v55 = 7400;
        }
        add_stack_data((void *)v4, v54, (int *)(v28 + v55));
        goto LABEL_153;
      }
      if (v13 > 620953608)
      {
        if (v13 != 620953609)
        {
          if (v13 == 621150209)
          {
            *(void *)v5 |= 0x40000000uLL;
            unint64_t v44 = *(void *)(v4 + 8);
            *((_DWORD *)v5 + 1808) = v44;
            *((_WORD *)v5 + 3618) = WORD2(v44);
            *((_DWORD *)v5 + 1810) = HIWORD(v44);
            *((_OWORD *)v5 + 453) = *(_OWORD *)(v4 + 16);
          }
          else if (v13 != 621346817)
          {
            goto LABEL_88;
          }
        }
        *(void *)v5 |= 0x100uLL;
        *((_DWORD *)v5 + 6) = v8;
        *((_DWORD *)v5 + 1846) = 1;
      }
      else
      {
        switch(v13)
        {
          case 117506056:
            *(void *)v5 |= 8uLL;
            *((void *)v5 + 2) = *(void *)(v4 + 40);
            *((_DWORD *)v5 + 6) = v8;
            strncpy(v5 + 28, (const char *)(v4 + 8), 0x14uLL);
            v6[47] = 0;
            *((_DWORD *)v6 + 1846) = 1;
            int v13 = *(_DWORD *)(v4 + 48);
            break;
          case 620822548:
            *(void *)v5 |= 0x4000uLL;
            uint64_t v43 = *(void *)(v4 + 16);
            *((void *)v5 + 838) = *(void *)(v4 + 8);
            *((_DWORD *)v5 + 1678) = v43;
            goto LABEL_101;
          case 620953600:
            *(void *)v5 |= 0x1000000uLL;
            *((_DWORD *)v5 + 6) = v8;
LABEL_101:
            *((_DWORD *)v6 + 1846) = 1;
            goto LABEL_153;
        }
LABEL_88:
        if (!HIBYTE(v13))
        {
          *(void *)v6 |= 0x40000uLL;
          *((_DWORD *)v6 + 6) = *(_DWORD *)(v4 + 52);
          *((_DWORD *)v6 + 1686) = v13 >> 2;
          if ((v13 & 1) == 0)
          {
            if ((v13 & 2) != 0)
            {
LABEL_91:
              *((_DWORD *)v6 + 1687) = 1;
              goto LABEL_101;
            }
LABEL_99:
            *((_DWORD *)v6 + 1687) = 2;
            goto LABEL_101;
          }
          goto LABEL_100;
        }
      }
      if ((HIBYTE(v13) | 0x20) != 0x21 || (v13 & 0xFF0000) != 0xA0000) {
        goto LABEL_153;
      }
      *(void *)v6 |= 0x40000uLL;
      *((_DWORD *)v6 + 6) = *(_DWORD *)(v4 + 52);
      *((_DWORD *)v6 + 1686) = (unsigned __int16)v13 >> 2;
      if ((v13 & 1) == 0)
      {
        if ((v13 & 2) != 0) {
          goto LABEL_91;
        }
        goto LABEL_99;
      }
LABEL_100:
      *((_DWORD *)v6 + 1687) = 0;
      goto LABEL_101;
    }
    *((_DWORD *)v5 + 12) = *(_DWORD *)(v4 + 48);
    *((void *)v5 + 7) = *(void *)(v4 + 8);
    *((void *)v5 + 8) = *(void *)(v4 + 16);
    *((void *)v5 + 9) = *(void *)(v4 + 24);
    *((void *)v5 + 10) = *(void *)(v4 + 32);
    *((void *)v5 + 2) = *(void *)(v4 + 40);
    *((_DWORD *)v5 + 6) = v8;
    *(void *)uint64_t v5 = 0x8000000000000017;
    *((_DWORD *)v5 + 1846) = 1;
    ++*(_DWORD *)(a1 + 196);
    *((void *)v5 + 924) = 0;
    uint64_t v9 = *(void *)(a1 + 184);
    if (v9) {
      *(void *)(v9 + 7392) = v5;
    }
    *(void *)(a1 + 184) = v5;
    if (!*(void *)(a1 + 176))
    {
      uint64_t v10 = 0;
      goto LABEL_168;
    }
    uint64_t v10 = 0;
LABEL_170:
    if (v10 == 2) {
      return v10;
    }
  }
  if (!record_ready(a1)) {
    return 1;
  }
  uint64_t v95 = *(void *)(a1 + 176);
  *a2 = v95;
  --*(_DWORD *)(a1 + 196);
  *(void *)(a1 + 176) = *(void *)(v95 + 7392);
  if (*(void *)(a1 + 184) == v95) {
    *(void *)(a1 + 184) = 0;
  }
  uint64_t v10 = 0;
  *(void *)(v95 + 7392) = 0;
  return v10;
}

uint64_t record_ready(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 176);
    if (v2 && *(_DWORD *)(v2 + 7384))
    {
      return 1;
    }
    else if (*(int *)(a1 + 196) < 10001)
    {
      return 0;
    }
    else
    {
      *(void *)v2 |= 0x8000000000000000;
      uint64_t v1 = 1;
      *(_DWORD *)(v2 + 7384) = 1;
      *(void *)(a1 + 72 + 8 * *(int *)(v2 + 24) + 128) = 0;
      *(void *)(a1 + 72 + 8 * *(int *)(*(void *)(a1 + 176) + 24) + 640) = 0;
      *(void *)(a1 + 72 + 8 * *(int *)(*(void *)(a1 + 176) + 24) + 1152) = 0;
    }
  }
  return v1;
}

void *add_string_data(_DWORD *a1, uint64_t a2, int a3)
{
  uint64_t v6 = *(unsigned int *)(a2 + 52);
  switch(a3)
  {
    case 3:
      uint64_t v7 = (uint64_t *)&a1[2 * v6 + 434];
      goto LABEL_7;
    case 2:
      uint64_t v7 = (uint64_t *)&a1[2 * v6 + 306];
      goto LABEL_7;
    case 1:
      uint64_t v7 = (uint64_t *)&a1[2 * v6 + 178];
LABEL_7:
      uint64_t v8 = *v7;
      goto LABEL_9;
  }
  uint64_t v8 = 0;
LABEL_9:
  uint64_t result = batch_get_bytes(a1, (const char *)(a2 + 8), 4uLL, (void *)v8, a3);
  if ((*(unsigned char *)(a2 + 48) & 2) == 0) {
    return result;
  }
  if (a3 != 3)
  {
    if (a3 == 2)
    {
      *(void *)&a1[2 * v6 + 306] = 0;
      return result;
    }
    if (a3 != 1) {
      return result;
    }
    uint64_t v10 = *(void *)(v8 + 7336);
    if (!v10) {
      goto LABEL_26;
    }
    uint64_t result = *(void **)v10;
    if (*(void *)v10)
    {
      unint64_t v11 = *(void *)(v10 + 16);
      if (v11 == *(void *)(v10 + 8))
      {
        unint64_t v12 = 2 * v11;
        int v13 = 1 << -(char)__clz(v11);
        if (v12 <= v13) {
          size_t v14 = v13;
        }
        else {
          size_t v14 = v12;
        }
        uint64_t result = reallocf(result, v14);
        *(void *)uint64_t v10 = result;
        if (!result) {
          goto LABEL_26;
        }
        *(void *)(v10 + 16) = v14;
      }
    }
    else
    {
      uint64_t result = malloc_type_malloc(0x100uLL, 0xFD0F0A50uLL);
      *(void *)uint64_t v10 = result;
      if (!result)
      {
LABEL_26:
        *(void *)&a1[2 * v6 + 178] = 0;
        goto LABEL_27;
      }
      *(void *)(v10 + 16) = 256;
    }
    *((unsigned char *)result + (*(void *)(v10 + 8))++) = id_string_terminate_null_byte;
    goto LABEL_26;
  }
  *(void *)&a1[2 * v6 + 434] = 0;
LABEL_27:
  *(_DWORD *)(v8 + 7384) = 1;
  return result;
}

_DWORD *batch_get_bytes(_DWORD *result, const char *a2, unint64_t a3, void *a4, int a5)
{
  unint64_t v6 = a3;
  if (*result == 1) {
    size_t v7 = 4;
  }
  else {
    size_t v7 = 8 * (*result == 2);
  }
  if (a5 == 3)
  {
    int v23 = a4 + 895;
    uint64_t v24 = 903;
    goto LABEL_34;
  }
  if (a5 == 2)
  {
    int v23 = a4 + 886;
    uint64_t v24 = 894;
LABEL_34:
    int v25 = &a4[v24];
    unint64_t v26 = 64;
    if (!a3) {
      return result;
    }
    goto LABEL_37;
  }
  if (a5 != 1)
  {
    int v23 = 0;
    int v25 = 0;
    unint64_t v26 = 0;
    if (!a3) {
      return result;
    }
LABEL_37:
    uint64_t v27 = 0;
    while (1)
    {
      uint64_t v32 = *(void *)&a2[8 * v27];
      uint64_t v28 = *v25;
      if (v7) {
        break;
      }
LABEL_44:
      uint64_t *v25 = v28 + v7;
      if (++v27 >= a3) {
        return result;
      }
    }
    uint64_t v29 = 0;
    while (1)
    {
      if (v28 + 1 + v29 >= v26)
      {
        *v25 += v29;
        *((unsigned char *)v23 + v28 + v29) = 0;
        return result;
      }
      int v30 = *((unsigned __int8 *)&v32 + v29);
      *((unsigned char *)v23 + v28 + v29) = v30;
      if (!v30) {
        break;
      }
      if (v7 == ++v29)
      {
        uint64_t v28 = *v25;
        goto LABEL_44;
      }
    }
    *v25 += v29;
    return result;
  }
  if (a3)
  {
    uint64_t v8 = 0;
    uint64_t v9 = a4 + 844;
    uint64_t v10 = a2;
    do
    {
      uint64_t result = (_DWORD *)strnlen(v10, v7);
      if (result)
      {
        size_t v11 = (size_t)result;
        unint64_t v12 = a4[876];
        int v13 = v10;
        if (v12 <= 0xFE)
        {
          if (255 - v12 >= (unint64_t)result) {
            size_t v14 = (size_t)result;
          }
          else {
            size_t v14 = 255 - v12;
          }
          uint64_t result = memcpy((char *)v9 + v12, v10, v14);
          size_t v15 = a4[876] + v14;
          a4[876] = v15;
          *((unsigned char *)v9 + v15) = 0;
          v11 -= v14;
          if (!v11) {
            goto LABEL_30;
          }
          int v13 = &a2[8 * v8 + v14];
        }
        int v16 = (void *)a4[917];
        if (!v16)
        {
          uint64_t v17 = malloc_type_malloc(0x10uLL, 0x20040A4A59CD2uLL);
          void *v17 = a4[930];
          int v16 = malloc_type_calloc(1uLL, 0x20uLL, 0x1090040F898E8EEuLL);
          v17[1] = v16;
          v16[3] = 0;
          a4[930] = v17;
          a4[917] = v16;
        }
        uint64_t result = (_DWORD *)*v16;
        if (*v16)
        {
          uint64_t v18 = v16[2];
          if (v18 - v16[1] >= v11) {
            goto LABEL_29;
          }
          unint64_t v19 = 2 * v18;
          int v20 = 1 << -(char)__clz(v11 + v18 - 1);
          if (v19 <= v20) {
            size_t v21 = v20;
          }
          else {
            size_t v21 = v19;
          }
          uint64_t result = reallocf(result, v21);
        }
        else
        {
          int v22 = 1 << -(char)__clz(v11 - 1);
          if (v22 <= 0x100) {
            int v22 = 256;
          }
          size_t v21 = v22;
          uint64_t result = malloc_type_malloc(v22, 0xFD0F0A50uLL);
        }
        *int v16 = result;
        if (result)
        {
          v16[2] = v21;
LABEL_29:
          uint64_t result = memcpy((char *)result + v16[1], v13, v11);
          v16[1] += v11;
        }
      }
LABEL_30:
      ++v8;
      v10 += 8;
      --v6;
    }
    while (v6);
  }
  return result;
}

uint64_t add_thread_info_sched_data(uint64_t result, uint64_t *a2, int a3)
{
  uint64_t v3 = *a2;
  *a2 |= 0x100000uLL;
  *(_OWORD *)(a2 + 825) = *(_OWORD *)(result + 8);
  uint64_t v4 = *(void *)(result + 24);
  *((_WORD *)a2 + 3310) = HIWORD(v4);
  *((_WORD *)a2 + 3311) = WORD2(v4);
  *((_DWORD *)a2 + 1654) = BYTE3(v4);
  unsigned int v5 = a2[828] & 0xFFF8 | (v4 >> 6) & 7;
  *((_WORD *)a2 + 3312) = v5;
  unsigned int v6 = v5 & 0xFFFFFFC7 | (8 * ((*(unsigned __int16 *)(result + 24) >> 3) & 7));
  *((_WORD *)a2 + 3312) = v6;
  LOWORD(v6) = v6 & 0xFE3F | ((*(_WORD *)(result + 24) & 7) << 6);
  *((_WORD *)a2 + 3312) = v6;
  *((_WORD *)a2 + 3312) = v6 & 0xF1FF | (*(void *)(result + 32) >> 52) & 0xE00;
  if (a3 >= 2)
  {
    *a2 = v3 | 0x8100000;
    int v7 = a2[885] & 0xFFF8 | (*(void *)(result + 32) >> 58) & 7;
    *((_WORD *)a2 + 3540) = v7;
    unsigned int v8 = v7 & 0xFFFFFFC7 | (8 * (((*(void *)(result + 32) >> 52) >> 3) & 7));
    *((_WORD *)a2 + 3540) = v8;
    *((_WORD *)a2 + 3540) = v8 & 0xFE3F | (*(void *)(result + 32) >> 46) & 0x1C0;
  }
  return result;
}

_DWORD *add_thread_info_sched_data2_32(_DWORD *result, uint64_t *a2, int a3)
{
  uint64_t v3 = *a2;
  *a2 |= 0x100000uLL;
  HIDWORD(v4) = result[2];
  LODWORD(v4) = HIDWORD(v4);
  *((_DWORD *)a2 + 1655) = v4 >> 16;
  unsigned int v5 = result[4];
  *((_DWORD *)a2 + 1654) = HIBYTE(v5);
  int v6 = a2[828] & 0xFFF8 | (v5 >> 6) & 7;
  *((_WORD *)a2 + 3312) = v6;
  unsigned int v7 = v6 & 0xFFFFFFC7 | (8 * ((*((unsigned __int16 *)result + 8) >> 3) & 7));
  *((_WORD *)a2 + 3312) = v7;
  LOWORD(v7) = v7 & 0xFE3F | ((result[4] & 7) << 6);
  *((_WORD *)a2 + 3312) = v7;
  *((_WORD *)a2 + 3312) = v7 & 0xF1FF | (result[6] >> 29 << 9);
  if (a3 >= 2)
  {
    *a2 = v3 | 0x8100000;
    int v8 = a2[885] & 0xFFF8 | (result[6] >> 26) & 7;
    *((_WORD *)a2 + 3540) = v8;
    unsigned int v9 = v8 & 0xFFFFFFC7 | (8 * ((result[6] >> 23) & 7));
    *((_WORD *)a2 + 3540) = v9;
    *((_WORD *)a2 + 3540) = v9 & 0xFE3F | (result[6] >> 14) & 0x1C0;
  }
  return result;
}

void *add_stack_data(void *result, uint64_t a2, int *a3)
{
  uint64_t v3 = *a3;
  if ((int)v3 <= 252)
  {
    unint64_t v4 = (void *)(a2 + 8 * v3);
    v4[1] = result[1];
    v4[2] = result[2];
    v4[3] = result[3];
    v4[4] = result[4];
    *a3 = v3 + 4;
  }
  return result;
}

void kdbg_comp_init(_DWORD *a1, int a2)
{
  a1[1] = a2;
}

void kdbg_comp_reset(_DWORD *a1)
{
  int v2 = a1[1];
  bzero(a1, 0x388uLL);
  a1[1] = v2;
}

char *kdbg_comp_encode(int *a1, void *a2, unint64_t a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a3 < 0x41)
  {
    unsigned int v5 = safe_encode(a1, (uint64_t)__src, a3);
    if (v5) {
      memcpy(a2, __src, (size_t)v5);
    }
    return v5;
  }
  else
  {
    return safe_encode(a1, (uint64_t)a2, a3);
  }
}

char *safe_encode(int *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = *((void *)a1 + 2) - *((void *)a1 + 1);
  uint64_t v7 = (void *)(a2 + 2);
  unsigned int v8 = __clz(v6 | 1);
  unsigned int v9 = (9 * v8) >> 6;
  if (v8 >= 8)
  {
    *uint64_t v7 = ((2 * v6) | 1) << (8 - v9);
  }
  else
  {
    *(unsigned char *)(a2 + 2) = 0;
    *(void *)(a2 + 3) = v6;
  }
  uint64_t v10 = (void *)((char *)v7 + 9 - v9);
  unsigned int v11 = a1[1];
  switch(v11)
  {
    case 0u:
      int v38 = *a1;
      size_t v39 = (unsigned int *)&a1[12 * *a1];
      uint64_t v40 = (uint64_t)(v39 + 6);
      uint64_t v41 = 3999999939 * ((*((void *)v39 + 7) << 30) | (*((void *)v39 + 8) >> 2));
      uint64_t v42 = (char *)a1 + ((BYTE5(v41) ^ BYTE3(v41)) & 0x3F);
      int v43 = v42[840];
      v42[840] = *a1;
      unsigned int v44 = v43 + ~v38;
      if (v44 <= 0x11) {
        unsigned int v45 = v43 + ~v38;
      }
      else {
        unsigned int v45 = v44 + 17;
      }
      if (v45 <= 0xF && (uint64_t v46 = (unsigned int *)&a1[12 * v43], *((void *)v46 + 7) == *(void *)(v40 + 32)))
      {
        uint64_t v47 = (uint64_t)(v46 + 6);
      }
      else
      {
        LOWORD(v45) = 0;
        if ((v38 + 1) <= 0x10) {
          int v48 = v38 + 1;
        }
        else {
          int v48 = 0;
        }
        uint64_t v47 = (uint64_t)&a1[12 * v48 + 6];
      }
      uint64_t v49 = 0;
      uint64_t v50 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v51 = *(void *)(v40 + v50);
        if (v51)
        {
          uint64_t v52 = *(void *)(v47 + v50);
          if ((v52 ^ v51) == 3)
          {
            uint64_t v53 = 2 << v49;
          }
          else
          {
            if (v51 != v52)
            {
              v13 |= ((unint64_t)(9 - ((9 * __cls(v51 - v52)) >> 6)) << (v50 + 16)) | (3 << v49);
              goto LABEL_57;
            }
            uint64_t v53 = (1 << v49);
          }
          v13 |= v53;
        }
LABEL_57:
        v50 += 8;
        v49 += 2;
        if (v49 == 12)
        {
          uint64_t v10 = (void *)encode_row((uint64_t)v10, v47, v40, v13);
          LOWORD(v13) = v13 | ((_WORD)v45 << 12);
          goto LABEL_59;
        }
      }
    case 2u:
      uint64_t v25 = 0;
      unsigned int v26 = 0;
      unint64_t v13 = 0;
      unsigned int v27 = *a1;
      uint64_t v28 = (unsigned int *)&a1[12 * *a1];
      unsigned int v29 = -1;
      while (1)
      {
        uint64_t v30 = 0;
        unsigned int v31 = 0;
        unint64_t v32 = 0;
        if (v27 + 1 <= 0x10) {
          ++v27;
        }
        else {
          unsigned int v27 = 0;
        }
        uint64_t v33 = 6;
        do
        {
          uint64_t v34 = *(void *)&v28[v33];
          if (!v34) {
            goto LABEL_33;
          }
          uint64_t v35 = *(void *)&a1[12 * v27 + v33];
          if ((v35 ^ v34) == 3)
          {
            uint64_t v36 = 2 << v30;
LABEL_31:
            v32 |= v36;
            goto LABEL_33;
          }
          if (v34 == v35)
          {
            uint64_t v36 = (1 << v30);
            goto LABEL_31;
          }
          uint64_t v37 = 9 - ((9 * __cls(v34 - v35)) >> 6);
          v32 |= (v37 << ((v33 * 4) - 8)) | (3 << v30);
          v31 += v37;
LABEL_33:
          v33 += 2;
          v30 += 2;
        }
        while (v30 != 12);
        if (v31 < v29)
        {
          unsigned int v29 = v31;
          unint64_t v13 = v32 | (v25 << 12);
          unsigned int v26 = v27;
        }
        if (++v25 == 16)
        {
          uint64_t v10 = (void *)encode_row((uint64_t)v10, (uint64_t)&a1[12 * v26 + 6], (uint64_t)(v28 + 6), v13);
          goto LABEL_59;
        }
      }
    case 1u:
      uint64_t v12 = 0;
      LOWORD(v13) = 0;
      size_t v14 = (unsigned int *)&a1[12 * *a1 + 6];
      if ((*a1 + 1) <= 0x10) {
        unsigned int v15 = *a1 + 1;
      }
      else {
        unsigned int v15 = 0;
      }
      int v16 = (unsigned int *)&a1[12 * v15 + 6];
      do
      {
        uint64_t v18 = *(void *)v14;
        v14 += 2;
        uint64_t v17 = v18;
        uint64_t v20 = *(void *)v16;
        v16 += 2;
        uint64_t v19 = v20;
        if (v17)
        {
          if (v17 == v19)
          {
            int v21 = 1 << v12;
          }
          else
          {
            unint64_t v22 = v17 - v19;
            unsigned int v23 = __cls(v22);
            unsigned int v24 = (9 * v23) >> 6;
            if (v23 >= 8)
            {
              *uint64_t v10 = ((2 * v22) | 1) << (8 - v24);
            }
            else
            {
              *(unsigned char *)uint64_t v10 = 0;
              *(void *)((char *)v10 + 1) = v22;
            }
            uint64_t v10 = (void *)((char *)v10 + 9 - v24);
            int v21 = 3 << v12;
          }
          LOWORD(v13) = v13 | v21;
        }
        v12 += 2;
      }
      while (v12 != 12);
      break;
    default:
      LOWORD(v13) = 0;
      break;
  }
LABEL_59:
  *(_WORD *)a2 = v13;
  uint64_t result = (char *)v10 - a2;
  if ((unint64_t)result > a3) {
    return 0;
  }
  if (*a1) {
    int v55 = *a1 - 1;
  }
  else {
    int v55 = 16;
  }
  *a1 = v55;
  *((void *)a1 + 1) = *((void *)a1 + 2);
  return result;
}

unint64_t kdbg_comp_decode(int *a1, char *a2, unint64_t a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a3 <= 0x40)
  {
    __memcpy_chk();
    a2 = &v22;
  }
  unsigned int v5 = a2[1];
  unsigned int v6 = *a2 | (v5 << 8);
  int v7 = *a1;
  unsigned int v8 = *a1 + (v5 >> 4);
  if (v8 > 0x10) {
    v8 -= 17;
  }
  unsigned int v9 = &a1[12 * v8];
  unint64_t v10 = *(void *)(a2 + 2);
  if ((_BYTE)v10)
  {
    unint64_t v11 = __clz(__rbit64(v10));
    unint64_t v12 = v10 << (-8 * (v11 + 1)) >> (-7 * (v11 + 1));
    unint64_t result = v11 + 3;
  }
  else
  {
    unint64_t v12 = *(void *)(a2 + 3);
    unint64_t result = 11;
  }
  uint64_t v14 = 0;
  unsigned int v15 = v9 + 6;
  unsigned int v16 = v7 - 1;
  if (!v7) {
    unsigned int v16 = 16;
  }
  do
  {
    uint64_t v17 = v6 & 3;
    switch(v6 & 3)
    {
      case 1u:
        uint64_t v17 = *(void *)&v15[v14];
        break;
      case 2u:
        uint64_t v17 = *(void *)&v15[v14] ^ 3;
        break;
      case 3u:
        unint64_t v18 = *(void *)&a2[result];
        if ((_BYTE)v18)
        {
          unsigned int v19 = __clz(__rbit64(v18)) + 1;
          uint64_t v20 = (uint64_t)(v18 << (-8 * v19)) >> (-7 * v19);
        }
        else
        {
          uint64_t v20 = *(void *)&a2[result + 1];
          unsigned int v19 = 9;
        }
        result += v19;
        uint64_t v17 = *(void *)&v15[v14] + v20;
        break;
      default:
        break;
    }
    *(void *)&a1[12 * v16 + 6 + v14] = v17;
    v6 >>= 2;
    v14 += 2;
  }
  while (v14 != 12);
  if (result > a3) {
    return 0;
  }
  *a1 = v16;
  uint64_t v21 = *((void *)a1 + 2);
  *((void *)a1 + 1) = v21;
  *((void *)a1 + 2) = v21 + v12;
  return result;
}

uint64_t encode_row(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = 0;
  unint64_t v5 = a4 >> 16;
  do
  {
    if ((_BYTE)v5)
    {
      uint64_t v6 = *(void *)(a3 + v4) - *(void *)(a2 + v4);
      if (v5 > 8u)
      {
        *(unsigned char *)unint64_t result = 0;
        *(void *)(result + 1) = v6;
      }
      else
      {
        *(void *)unint64_t result = ((2 * v6) | 1) << (v5 - 1);
      }
    }
    result += v5;
    v5 >>= 8;
    v4 += 8;
  }
  while (v4 != 48);
  return result;
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

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
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

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
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

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPathRelativeToBase(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE53F8](allocator, filePath, pathStyle, isDirectory, baseURL);
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x270EE5450](anURL);
}

Boolean CFURLResourceIsReachable(CFURLRef url, CFErrorRef *error)
{
  return MEMORY[0x270EE5458](url, error);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int dup(int a1)
{
  return MEMORY[0x270ED9678](*(void *)&a1);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

uint64_t kpc_force_all_ctrs_set()
{
  return MEMORY[0x270F8C1D8]();
}

uint64_t kpc_set_config()
{
  return MEMORY[0x270F8C1F8]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDB0A0](*(void *)&__fd, __buf, __nbyte, a4);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDB158](__ptr, __size);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}