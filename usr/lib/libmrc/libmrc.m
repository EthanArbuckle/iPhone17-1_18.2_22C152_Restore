BOOL _mdns_address_equal(uint64_t a1, uint64_t a2)
{
  int v2;

  v2 = *(unsigned __int8 *)(a1 + 25);
  if (v2 != *(unsigned __int8 *)(a2 + 25)) {
    return 0;
  }
  if (v2 == 30) {
    return *(unsigned __int16 *)(a1 + 26) == *(unsigned __int16 *)(a2 + 26)
  }
        && *(void *)(a1 + 32) == *(void *)(a2 + 32)
        && *(void *)(a1 + 40) == *(void *)(a2 + 40);
  return v2 == 2
      && *(unsigned __int16 *)(a1 + 26) == *(unsigned __int16 *)(a2 + 26)
      && *(_DWORD *)(a1 + 28) == *(_DWORD *)(a2 + 28);
}

void *_mdns_address_copy_description(uint64_t a1, int a2, int a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v6 = (void *)mdns_string_builder_create();
  if (v6)
  {
    v7 = v6;
    if (a2
      && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(void *)(a1 + 16) + 8), (const void *)a1))
    {
      goto LABEL_46;
    }
    int v8 = *(unsigned __int8 *)(a1 + 25);
    if (v8 != 30)
    {
      if (v8 != 2)
      {
        int appended = mdns_string_builder_append_formatted(v7, "«UNHANDLED ADDRESS FAMILY: %d»");
        goto LABEL_20;
      }
      v9 = (int *)(a1 + 28);
      if (!a3)
      {
        if (!inet_ntop(2, v9, v23, 0x10u) && (!*__error() || *__error())) {
          goto LABEL_46;
        }
        int v11 = mdns_string_builder_append_formatted(v7, "%s");
LABEL_24:
        if (v11) {
          goto LABEL_46;
        }
        if (*(_WORD *)(a1 + 26))
        {
          int appended = mdns_string_builder_append_formatted(v7, ":%d");
          goto LABEL_20;
        }
        goto LABEL_59;
      }
      unsigned int v10 = bswap32(*v9);
      int v21 = *v9;
      unsigned int v22 = v10;
      if (v10 && v10 != 2130706433)
      {
        if ((_DNSMessagePrintObfuscatedIPAddress((uint64_t)v23, (uint64_t)&v21, 4) & 0x80000000) == 0) {
          goto LABEL_14;
        }
      }
      else
      {
        if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
        }
        if (_GetCUSymAddr_SNPrintF_sAddr
          && (_GetCUSymAddr_SNPrintF_sAddr(v23, 64, "%#.4a", COERCE_DOUBLE(&v22)) & 0x80000000) == 0)
        {
          goto LABEL_14;
        }
      }
      v23[0] = 0;
LABEL_14:
      int v11 = mdns_string_builder_append_formatted(v7, "<IPv4:%s>");
      goto LABEL_24;
    }
    int v13 = *(unsigned __int16 *)(a1 + 26);
    if (*(_WORD *)(a1 + 26) && mdns_string_builder_append_formatted(v7, "[")) {
      goto LABEL_46;
    }
    v15 = (const void *)(a1 + 32);
    if (!a3)
    {
      if (!inet_ntop(30, v15, v23, 0x2Eu) && (!*__error() || *__error())) {
        goto LABEL_46;
      }
      int v17 = mdns_string_builder_append_formatted(v7, "%s");
LABEL_45:
      if (v17) {
        goto LABEL_46;
      }
      unsigned int v19 = *(_DWORD *)(a1 + 48);
      if (v19)
      {
        if (if_indextoname(v19, v23)
           ? mdns_string_builder_append_formatted(v7, "%%%s")
           : mdns_string_builder_append_formatted(v7, "%%%u"))
        {
          goto LABEL_46;
        }
      }
      if (v13)
      {
        int appended = mdns_string_builder_append_formatted(v7, "]:%d");
LABEL_20:
        if (!appended) {
          goto LABEL_59;
        }
LABEL_46:
        v12 = 0;
LABEL_47:
        os_release(v7);
        return v12;
      }
LABEL_59:
      v12 = mdns_string_builder_copy_string((uint64_t)v7);
      goto LABEL_47;
    }
    if (*(void *)(a1 + 32) | *(void *)(a1 + 39) || *(unsigned __int8 *)(a1 + 47) >= 2u)
    {
      int CUSymAddr_SNPrintF_sAddr = _DNSMessagePrintObfuscatedIPAddress((uint64_t)v23, (uint64_t)v15, 16);
    }
    else
    {
      if (_GetCUSymAddr_SNPrintF_sOnce != -1)
      {
        dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
        v15 = (const void *)(a1 + 32);
      }
      if (!_GetCUSymAddr_SNPrintF_sAddr) {
        goto LABEL_43;
      }
      int CUSymAddr_SNPrintF_sAddr = _GetCUSymAddr_SNPrintF_sAddr(v23, 64, "%.16a", *(double *)&v15);
    }
    if ((CUSymAddr_SNPrintF_sAddr & 0x80000000) == 0)
    {
LABEL_44:
      int v17 = mdns_string_builder_append_formatted(v7, "<IPv6:%s>");
      goto LABEL_45;
    }
LABEL_43:
    v23[0] = 0;
    goto LABEL_44;
  }
  return 0;
}

uint64_t _mdns_address_new()
{
  uint64_t v0 = _os_object_alloc();
  uint64_t v1 = v0;
  if (v0)
  {
    v2 = &_mdns_address_kind;
    *(void *)(v0 + 16) = &_mdns_address_kind;
    do
    {
      v3 = (void (*)(uint64_t))v2[2];
      if (v3) {
        v3(v1);
      }
      v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
  }
  return v1;
}

uint64_t mdns_cf_callback_equal(uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return 1;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16) && (v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 32)) != 0) {
    return v4(a1, a2);
  }
  else {
    return 0;
  }
}

const char *mdns_cf_callback_copy_description(uint64_t a1)
{
  return _mdns_obj_copy_description_as_cfstring(a1);
}

void mdns_cf_callback_release(int a1, void *object)
{
}

void *mdns_cf_callback_retain(int a1, void *object)
{
  return object;
}

BOOL mdns_cfarray_enumerate(const __CFArray *a1, uint64_t a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1)
  {
    return 1;
  }
  else
  {
    CFIndex v5 = Count;
    BOOL v6 = 0;
    for (i = 0; i != v5; BOOL v6 = i >= v5)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
      if (((*(uint64_t (**)(uint64_t, const void *))(a2 + 16))(a2, ValueAtIndex) & 1) == 0) {
        break;
      }
      ++i;
    }
  }
  return v6;
}

void mdns_cfset_enumerate(const __CFSet *a1, uint64_t a2)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  CFIndex Count = CFSetGetCount(a1);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
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
    long long v12 = 0u;
    long long v13 = 0u;
    *(_OWORD *)values = 0u;
    long long v11 = 0u;
    if ((unint64_t)Count > 0x40)
    {
      uint64_t v7 = a2;
      char v8 = 1;
      memset(v9, 0, sizeof(v9));
      CFSetApplyFunction(a1, (CFSetApplierFunction)_mdns_cf_applier_function, &v7);
    }
    else
    {
      BOOL v6 = values;
      CFSetGetValues(a1, (const void **)values);
      do
      {
        if (((*(uint64_t (**)(uint64_t, void *))(a2 + 16))(a2, *v6) & 1) == 0) {
          break;
        }
        ++v6;
        --v5;
      }
      while (v5);
    }
  }
}

void _mdns_cf_applier_function(uint64_t a1, unsigned char *a2)
{
  if (a2[8]) {
    a2[8] = (*(uint64_t (**)(void))(*(void *)a2 + 16))();
  }
}

uint64_t __mdns_dns_push_service_definition_create_xpc_dictionary_block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = (void *)(a2 + 16);
  do
  {
    v3 = (void *)*v3;
    if (!v3) {
      return 0;
    }
    v4 = (uint64_t (*)(uint64_t, void, void))v3[3];
  }
  while (!v4);
  uint64_t result = v4(a2, 0, 0);
  if (result)
  {
    BOOL v6 = (char *)result;
    xpc_object_t array_set_if_absent = _mdns_xpc_dictionary_get_array_set_if_absent(*(void **)(a1 + 32), "addresses");
    xpc_array_set_string(array_set_if_absent, 0xFFFFFFFFFFFFFFFFLL, v6);
    free(v6);
    return 1;
  }
  return result;
}

uint64_t __mdns_dns_push_service_definition_create_xpc_dictionary_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(const char **)(a2 + 40);
  xpc_object_t array_set_if_absent = _mdns_xpc_dictionary_get_array_set_if_absent(*(void **)(a1 + 32), "domains");
  xpc_array_set_string(array_set_if_absent, 0xFFFFFFFFFFFFFFFFLL, v2);
  return 1;
}

uint64_t __mdns_dns_service_definition_create_xpc_dictionary_block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = (void *)(a2 + 16);
  do
  {
    v3 = (void *)*v3;
    if (!v3) {
      return 0;
    }
    v4 = (uint64_t (*)(uint64_t, void, void))v3[3];
  }
  while (!v4);
  uint64_t result = v4(a2, 0, 0);
  if (result)
  {
    BOOL v6 = (char *)result;
    xpc_object_t array_set_if_absent = _mdns_xpc_dictionary_get_array_set_if_absent(*(void **)(a1 + 32), "addresses");
    xpc_array_set_string(array_set_if_absent, 0xFFFFFFFFFFFFFFFFLL, v6);
    free(v6);
    return 1;
  }
  return result;
}

uint64_t __mdns_dns_service_definition_create_xpc_dictionary_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(const char **)(a2 + 40);
  xpc_object_t array_set_if_absent = _mdns_xpc_dictionary_get_array_set_if_absent(*(void **)(a1 + 32), "domains");
  xpc_array_set_string(array_set_if_absent, 0xFFFFFFFFFFFFFFFFLL, v2);
  return 1;
}

uint64_t DomainNameFromString(unsigned char *a1, char *a2)
{
  *a1 = 0;
  uint64_t v2 = *a2;
  if (*a2)
  {
    if (v2 == 46)
    {
      uint64_t v2 = a2[1];
      if (!a2[1]) {
        return v2;
      }
      LODWORD(v2) = 46;
    }
    unint64_t v3 = (unint64_t)(a1 + 255);
    while (2)
    {
      if ((unint64_t)(a1 + 64) >= v3) {
        v4 = (unsigned char *)v3;
      }
      else {
        v4 = a1 + 64;
      }
      CFIndex v5 = a1 + 1;
      BOOL v6 = a1 + 1;
      uint64_t v7 = (unsigned __int8 *)a2;
      do
      {
        a2 = (char *)(v7 + 1);
        if (v2 == 92)
        {
          LODWORD(v2) = *a2;
          if (!*a2) {
            return 4294960546;
          }
          a2 = (char *)(v7 + 2);
          if (v2 - 48 <= 9)
          {
            int v8 = *a2;
            if ((v8 - 48) <= 9)
            {
              int v9 = v7[3];
              if ((v9 - 48) <= 9)
              {
                int v10 = 100 * v2 + 10 * (char)v8 + (char)v9;
                long long v11 = (char *)(v7 + 4);
                if (v10 < 5584)
                {
                  a2 = v11;
                  LOBYTE(v2) = v10 + 48;
                }
              }
            }
          }
        }
        else if (v2 == 46)
        {
          break;
        }
        if (v6 >= v4) {
          return 4294960545;
        }
        *v6++ = v2;
        LODWORD(v2) = *a2;
        uint64_t v7 = (unsigned __int8 *)a2;
      }
      while (*a2);
      if (v6 == v5)
      {
        return 4294960554;
      }
      else
      {
        *a1 = (_BYTE)v6 - (_BYTE)v5;
        unsigned char *v6 = 0;
        uint64_t v2 = *a2;
        a1 = v6;
        if (*a2) {
          continue;
        }
      }
      break;
    }
  }
  return v2;
}

uint64_t _DNSMessagePrintObfuscatedIPAddress(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a3 != 16 && a3 != 4) {
    return 4294960553;
  }
  if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
  }
  if (!_GetCUSymAddr_SNPrintF_sAddr) {
    return 4294960561;
  }
  uint64_t result = _GetCUSymAddr_SNPrintF_sAddr(v7, 33, "%.4H", a2, a3, a3);
  if ((result & 0x80000000) == 0)
  {
    if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
    }
    if (_GetCUSymAddr_SNPrintF_sAddr) {
      return _GetCUSymAddr_SNPrintF_sAddr(a1, 64, "%~s", v7);
    }
    return 4294960561;
  }
  return result;
}

void _mdns_domain_name_finalize(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 24) = 0;
  }
  unint64_t v3 = *(void **)(a1 + 40);
  if (v3)
  {
    free(v3);
    *(void *)(a1 + 40) = 0;
  }
}

BOOL _mdns_domain_name_equal(uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return 1;
  }
  size_t v3 = *(void *)(a1 + 32);
  if (v3 != *(void *)(a2 + 32)) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 61) && *(unsigned char *)(a2 + 61)) {
    return memcmp(*(const void **)(a1 + 24), *(const void **)(a2 + 24), v3) == 0;
  }
  CFIndex v5 = *(unsigned __int8 **)(a1 + 24);
  BOOL v6 = *(unsigned __int8 **)(a2 + 24);
  if (v5 != v6)
  {
    do
    {
      uint64_t v7 = *v5;
      if (v5 != v6)
      {
        if (v7 != *v6) {
          return 0;
        }
        if (!*v5) {
          return 1;
        }
        uint64_t v8 = v5 + 1;
        int v9 = v6 + 1;
        uint64_t v10 = *v5;
        while (1)
        {
          unsigned int v12 = *v8++;
          unsigned int v11 = v12;
          unsigned int v13 = v12 + 32;
          if (v12 - 65 < 0x1A) {
            unsigned int v11 = v13;
          }
          unsigned int v15 = *v9++;
          unsigned int v14 = v15;
          unsigned int v16 = v15 + 32;
          if (v15 - 65 < 0x1A) {
            unsigned int v14 = v16;
          }
          if (v11 > v14) {
            char v2 = 1;
          }
          if (v11 < v14) {
            char v2 = -1;
          }
          if (v11 != v14) {
            break;
          }
          if (!--v10) {
            goto LABEL_24;
          }
        }
        if (v2) {
          return 0;
        }
      }
LABEL_24:
      v5 += v7 + 1;
      v6 += v7 + 1;
    }
    while (v7);
  }
  return 1;
}

void *_mdns_domain_name_copy_description(void *a1, int a2, int a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v6 = (void *)mdns_string_builder_create();
  if (v6)
  {
    uint64_t v7 = v6;
    if (a2 && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1)) {
      goto LABEL_20;
    }
    uint64_t v8 = (const char *)a1[5];
    if (!a3)
    {
LABEL_19:
      if (!mdns_string_builder_append_formatted(v7, "%s", v8))
      {
        unsigned int v12 = mdns_string_builder_copy_string((uint64_t)v7);
        goto LABEL_22;
      }
LABEL_20:
      unsigned int v12 = 0;
LABEL_22:
      os_release(v7);
      return v12;
    }
    if (!strcasecmp(v8, "."))
    {
      uint64_t v10 = _GetCUSymAddr_SNPrintF_sOnce;
    }
    else
    {
      int v9 = strcasecmp(v8, "ipv4only.arpa.");
      uint64_t v10 = _GetCUSymAddr_SNPrintF_sOnce;
      if (v9)
      {
        if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
        }
        if (_GetCUSymAddr_SNPrintF_sAddr)
        {
          unsigned int v11 = "%~s";
          goto LABEL_17;
        }
        goto LABEL_24;
      }
    }
    if (v10 != -1) {
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
    }
    if (_GetCUSymAddr_SNPrintF_sAddr)
    {
      unsigned int v11 = "%s";
LABEL_17:
      unsigned int v14 = v8;
      uint64_t v8 = v15;
      if ((int)_GetCUSymAddr_SNPrintF_sAddr(v15, 64, v11, v14) < 0) {
        uint64_t v8 = "«REDACTED»";
      }
      goto LABEL_19;
    }
LABEL_24:
    uint64_t v8 = "«REDACTED»";
    goto LABEL_19;
  }
  return 0;
}

uint64_t _mdns_domain_name_cf_callback_hash(uint64_t a1)
{
  char v2 = (os_unfair_lock_s *)(a1 + 52);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 52));
  if (!*(unsigned char *)(a1 + 60))
  {
    int v3 = -2128831035;
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      CFIndex v5 = *(unsigned __int8 **)(a1 + 24);
      do
      {
        int v7 = *v5++;
        unsigned __int8 v6 = v7;
        unsigned __int8 v8 = v7 + 32;
        if ((v7 - 65) < 0x1A) {
          unsigned __int8 v6 = v8;
        }
        int v3 = 16777619 * (v6 ^ v3);
        --v4;
      }
      while (v4);
    }
    *(_DWORD *)(a1 + 56) = v3;
    *(unsigned char *)(a1 + 60) = 1;
  }
  os_unfair_lock_unlock(v2);
  return *(unsigned int *)(a1 + 56);
}

BOOL _mdns_domain_name_cf_callback_equal(uint64_t a1, uint64_t a2)
{
  return _mdns_domain_name_equal(a1, a2);
}

void *_mdns_domain_name_create(unsigned char *a1, int *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)_os_object_alloc();
  CFIndex v5 = v4;
  if (!v4) {
    goto LABEL_65;
  }
  unsigned __int8 v6 = &_mdns_domain_name_kind;
  v4[2] = &_mdns_domain_name_kind;
  do
  {
    int v7 = (uint64_t (*)(void *))v6[2];
    if (v7) {
      uint64_t v4 = (void *)v7(v5);
    }
    unsigned __int8 v6 = (_UNKNOWN **)*v6;
  }
  while (v6);
  int v8 = *a1;
  int v9 = a1;
  if (*a1)
  {
    int v9 = a1;
    do
    {
      uint64_t v10 = &v9[v8];
      int v11 = v10[1];
      int v9 = v10 + 1;
      int v8 = v11;
    }
    while (v11);
  }
  size_t v12 = v9 - a1 + 1;
  if (v9 - a1 == -1) {
    goto LABEL_64;
  }
  uint64_t v4 = malloc_type_malloc(v9 - a1 + 1, 0xA172743EuLL);
  if (!v4) {
    goto LABEL_64;
  }
  unsigned int v13 = (unsigned __int8 *)v4;
  memcpy(v4, a1, v12);
  v5[3] = v13;
  v5[4] = v12;
  LODWORD(i) = *v13;
  if (!*v13)
  {
    unsigned int v15 = __s1;
    goto LABEL_37;
  }
  unsigned int v15 = __s1;
  uint64_t v16 = v13;
  do
  {
    if (i > 0x3F || (long long v17 = &v16[i + 1], v17 - v13 > 255))
    {
      int v32 = -6742;
      uint64_t v4 = v5;
      CFIndex v5 = 0;
      goto LABEL_57;
    }
    long long v18 = v16 + 1;
    if (v18 < v17)
    {
      for (uint64_t i = i; i; --i)
      {
        unsigned __int8 v19 = *v18;
        if (((char)*v18 - 32) > 0x5E)
        {
          if ((*v18 & 0x80) == 0)
          {
            char *v15 = 92;
            if (v19 <= 0x63u) {
              char v21 = 48;
            }
            else {
              char v21 = 49;
            }
            v15[1] = v21;
            if (v19 >= 0x64u) {
              char v22 = v19 / 0xAu - 10;
            }
            else {
              char v22 = v19 / 0xAu;
            }
            v15[2] = v22 + 48;
            v15[3] = (v19 % 0xAu) | 0x30;
            v15 += 4;
            goto LABEL_32;
          }
        }
        else if (*v18 - 32 <= 0x3C && ((1 << (v19 - 32)) & 0x1000000000004001) != 0)
        {
          *v15++ = 92;
        }
        *v15++ = v19;
LABEL_32:
        ++v18;
      }
    }
    *v15++ = 46;
    LODWORD(i) = *v17;
    uint64_t v16 = v17;
  }
  while (*v17);
  if (v17 == v13) {
LABEL_37:
  }
    *v15++ = 46;
  char *v15 = 0;
  uint64_t v4 = strdup(__s1);
  if (!v4)
  {
LABEL_64:
    __break(1u);
LABEL_65:
    int v32 = -6728;
    goto LABEL_57;
  }
  v5[5] = v4;
  *((_DWORD *)v5 + 13) = 0;
  long long v23 = (unsigned char *)v5[3];
  unsigned int v24 = *v23;
  if (*v23)
  {
    int v25 = 0;
    long long v26 = (unsigned char *)v5[3];
    while (v24 <= 0x3F)
    {
      v26 += v24 + 1;
      if (v26 - v23 > 255) {
        break;
      }
      ++v25;
      unsigned int v24 = *v26;
      if (!*v26) {
        goto LABEL_46;
      }
    }
    int v25 = -1;
  }
  else
  {
    int v25 = 0;
  }
LABEL_46:
  *((_DWORD *)v5 + 12) = v25;
  unint64_t v27 = v5[4];
  if (v27)
  {
    if (*v23 - 65 >= 0x1A)
    {
      uint64_t v29 = 1;
      while (v27 != v29)
      {
        unsigned int v30 = v23[v29++] - 65;
        if (v30 <= 0x19)
        {
          unint64_t v31 = v29 - 1;
          goto LABEL_55;
        }
      }
      unint64_t v31 = v5[4];
LABEL_55:
      BOOL v28 = v31 >= v27;
    }
    else
    {
      BOOL v28 = 0;
    }
  }
  else
  {
    BOOL v28 = 1;
  }
  uint64_t v4 = 0;
  int v32 = 0;
  *((unsigned char *)v5 + 61) = v28;
LABEL_57:
  if (a2) {
    *a2 = v32;
  }
  if (v4) {
    os_release(v4);
  }
  return v5;
}

void *___mdns_domain_name_get_root_block_invoke()
{
  char v1 = 0;
  uint64_t result = _mdns_domain_name_create(&v1, 0);
  *((_DWORD *)result + 2) = 0x7FFFFFFF;
  *((_DWORD *)result + 3) = 0x7FFFFFFF;
  _mdns_domain_name_get_root_s_root = (uint64_t)result;
  return result;
}

size_t mdns_snprintf_add(char **a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1) {
    uint64_t v10 = *a1;
  }
  else {
    uint64_t v10 = 0;
  }
  if (a1) {
    size_t v11 = a2 - (void)v10;
  }
  else {
    size_t v11 = 0;
  }
  size_t v12 = vsnprintf(v10, v11, a3, &a9);
  size_t v13 = v12;
  if (a1 && v11 && (v12 & 0x80000000) == 0)
  {
    if (v11 <= v12) {
      size_t v12 = strlen(v10);
    }
    else {
      size_t v12 = v12;
    }
    *a1 = &v10[v12];
  }
  return v13;
}

char *_mdns_obj_copy_description(void *a1)
{
  char v2 = 0;
  asprintf(&v2, "<%s: %p>", *(const char **)(a1[2] + 8), a1);
  return v2;
}

const char *_mdns_obj_copy_description_as_cfstring(uint64_t a1)
{
  char v1 = (void *)(a1 + 16);
  do
  {
    char v1 = (void *)*v1;
    if (!v1) {
      return 0;
    }
    char v2 = (uint64_t (*)(void))v1[3];
  }
  while (!v2);
  uint64_t result = (const char *)v2();
  if (result)
  {
    uint64_t v4 = (char *)result;
    uint64_t result = (const char *)CFStringCreateWithCStringNoCopy(0, result, 0x8000100u, (CFAllocatorRef)*MEMORY[0x263EFFB18]);
    if (!result)
    {
      free(v4);
      return 0;
    }
  }
  return result;
}

void _mrc_session_finalize(uint64_t a1)
{
  char v2 = *(void **)(a1 + 40);
  if (v2)
  {
    os_release(v2);
    *(void *)(a1 + 40) = 0;
  }
}

void *_mrc_session_copy_description(uint64_t a1, int a2)
{
  uint64_t v4 = (void *)mdns_string_builder_create();
  if (!v4) {
    return 0;
  }
  CFIndex v5 = v4;
  if (a2
    && mdns_string_builder_append_formatted(v4, "<%s: %p>: ", *(const char **)(*(void *)(a1 + 16) + 8), (const void *)a1)|| mdns_string_builder_append_formatted(v5, "entity: %s", *(const char **)(a1 + 48)))
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
    unsigned __int8 v6 = mdns_string_builder_copy_string((uint64_t)v5);
  }
  os_release(v5);
  return v6;
}

void _mrc_client_finalize(uint64_t a1)
{
  char v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    dispatch_release(v2);
    *(void *)(a1 + 32) = 0;
  }
}

void _mrc_dns_proxy_parameters_finalize(uint64_t a1)
{
  char v2 = *(void **)(a1 + 24);
  if (v2)
  {
    xpc_release(v2);
    *(void *)(a1 + 24) = 0;
  }
}

char *_mrc_dns_proxy_parameters_copy_description(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v17 = 0;
  if (_mrc_dns_proxy_parameters_print_description(a1, a2, __s1, 128, &v17, a6, a7, a8)) {
    return 0;
  }
  if (v17 > 0x7F)
  {
    uint64_t v11 = v17 + 1;
    if (v17 == -1) {
      goto LABEL_9;
    }
    size_t v12 = (char *)malloc_type_malloc(v17 + 1, 0xA172743EuLL);
    if (!v12) {
      goto LABEL_9;
    }
    int v8 = v12;
    if (_mrc_dns_proxy_parameters_print_description(a1, a2, v12, v11, 0, v13, v14, v15))
    {
LABEL_10:
      free(v8);
      return 0;
    }
  }
  else
  {
    int v8 = strdup(__s1);
    if (!v8)
    {
LABEL_9:
      __break(1u);
      goto LABEL_10;
    }
  }
  return v8;
}

uint64_t _mrc_dns_proxy_parameters_print_description(uint64_t a1, int a2, char *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = a3;
  uint64_t v10 = (uint64_t)&a3[a4];
  if (a2)
  {
    unsigned int v11 = mdns_snprintf_add(&v16, v10, "<%s: %p>: ", a4, (uint64_t)a5, a6, a7, a8, *(void *)(*(void *)(a1 + 16) + 8));
    if ((v11 & 0x80000000) != 0) {
      return 4294960596;
    }
    uint64_t v12 = v11;
    a3 = v16;
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t result = _mrc_xpc_dns_proxy_params_print_description(*(void **)(a1 + 24), a3, v10 - (void)a3, &v15, (uint64_t)&v14, a6, a7, a8);
  if (!result)
  {
    uint64_t result = 0;
    if (a5) {
      *a5 = v14 + v12;
    }
  }
  return result;
}

uint64_t _mrc_xpc_dns_proxy_params_print_description(void *a1, char *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = (void *)a5;
  __dst[2] = *MEMORY[0x263EF8340];
  v67 = a2;
  uint64_t v12 = (uint64_t)&a2[a3];
  int v13 = mdns_snprintf_add(&v67, (uint64_t)&a2[a3], "input interface indexes: {", (uint64_t)a4, a5, a6, a7, a8, v64);
  if (v13 < 0) {
    return 4294960596;
  }
  v66 = v8;
  uint64_t v14 = v13 & ~(v13 >> 31);
  xpc_object_t optional_array = mdns_xpc_dictionary_get_optional_array(a1, "input_interfaces", 0);
  v65 = a2;
  if (optional_array)
  {
    uint64_t v16 = optional_array;
    size_t count = xpc_array_get_count(optional_array);
    if (count)
    {
      size_t v18 = count;
      size_t v19 = 0;
      do
      {
        long long v20 = v19 ? ", " : "";
        xpc_object_t value = xpc_array_get_value(v16, v19);
        _mdns_xpc_object_get_uint64_limited((uint64_t)value, 0xFFFFFFFFuLL, 0);
        unsigned int v27 = mdns_snprintf_add(&v67, v12, "%s%u", v22, v23, v24, v25, v26, (char)v20);
        if ((v27 & 0x80000000) != 0) {
          return 4294960596;
        }
        v14 += v27;
      }
      while (v18 != ++v19);
    }
  }
  LOBYTE(length[0]) = 0;
  xpc_object_t v28 = xpc_dictionary_get_value(a1, "output_interface");
  char uint64_limited = _mdns_xpc_object_get_uint64_limited((uint64_t)v28, 0xFFFFFFFFuLL, (BOOL *)length);
  int v35 = mdns_snprintf_add(&v67, v12, "}, output interface index: %u", v30, v31, v32, v33, v34, uint64_limited);
  if (v35 < 0) {
    return 4294960596;
  }
  uint64_t v36 = v14 + (v35 & ~(v35 >> 31));
  LOBYTE(__dst[0]) = 0;
  xpc_object_t v37 = xpc_dictionary_get_value(a1, "nat64_prefix.bit_len");
  uint64_t v38 = _mdns_xpc_object_get_uint64_limited((uint64_t)v37, 0xFFFFFFFFFFFFFFFFLL, (BOOL *)__dst);
  if (!LOBYTE(__dst[0])) {
    goto LABEL_32;
  }
  unint64_t v39 = v38;
  if (v38 > 0x80) {
    goto LABEL_32;
  }
  if (v38)
  {
    length[0] = 0;
    data = (const char *)xpc_dictionary_get_data(a1, "nat64_prefix.bits", length);
    if (!data || length[0] < (v39 + 7) >> 3) {
      goto LABEL_32;
    }
    long long v41 = data;
  }
  else
  {
    long long v41 = "";
  }
  __dst[0] = 0;
  __dst[1] = 0;
  if (v39 >= 0x80) {
    unint64_t v42 = 128;
  }
  else {
    unint64_t v42 = v39;
  }
  if (v42 >= 8) {
    memcpy(__dst, v41, v42 >> 3);
  }
  if ((v42 & 7) != 0) {
    *((unsigned char *)__dst + (v42 >> 3)) = *((unsigned char *)__dst + (v42 >> 3)) & ~(-1 << (8 - (v42 & 7))) | v41[v42 >> 3] & (-1 << (8 - (v42 & 7)));
  }
  v43 = inet_ntop(30, __dst, (char *)length, 0x2Eu);
  if (v43)
  {
    unsigned int v49 = mdns_snprintf_add(&v67, v12, ", nat64 prefix: %s/%zu", v44, v45, v46, v47, v48, (char)v43);
    goto LABEL_30;
  }
  if (!*__error()) {
    return 4294960596;
  }
  uint64_t result = *__error();
  if (result) {
    return result;
  }
  unsigned int v49 = mdns_snprintf_add(&v67, v12, ", nat64 prefix: %s/%zu", v51, v52, v53, v54, v55, 0);
LABEL_30:
  int v8 = v66;
  if ((v49 & 0x80000000) != 0) {
    return 4294960596;
  }
  v36 += v49;
LABEL_32:
  if (_mdns_xpc_dictionary_get_object(a1, "force_aaaa_synth", MEMORY[0x263EF86E0]) == (xpc_object_t)MEMORY[0x263EF8698]) {
    v61 = "yes";
  }
  else {
    v61 = "no";
  }
  int v62 = mdns_snprintf_add(&v67, v12, ", forces AAAA synthesis: %s", v56, v57, v58, v59, v60, (char)v61);
  if (v62 < 0) {
    return 4294960596;
  }
  int v63 = v62;
  if (a4) {
    *a4 = v67 - v65;
  }
  uint64_t result = 0;
  if (v8) {
    *int v8 = v36 + (v63 & ~(v63 >> 31));
  }
  return result;
}

void _mrc_dns_proxy_state_inquiry_finalize(uint64_t a1)
{
  char v2 = *(NSObject **)(a1 + 40);
  if (v2)
  {
    dispatch_release(v2);
    *(void *)(a1 + 40) = 0;
  }
}

char *_mrc_dns_proxy_state_inquiry_copy_description(void *a1)
{
  char v2 = 0;
  asprintf(&v2, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1);
  return v2;
}

void _mrc_discovery_proxy_parameters_finalize(void *a1)
{
  char v2 = (const void *)a1[3];
  if (v2)
  {
    CFRelease(v2);
    a1[3] = 0;
  }
  int v3 = (const void *)a1[4];
  if (v3)
  {
    CFRelease(v3);
    a1[4] = 0;
  }
  uint64_t v4 = (void *)a1[5];
  if (v4)
  {
    xpc_release(v4);
    a1[5] = 0;
  }
}

void *_mrc_discovery_proxy_parameters_copy_description(uint64_t a1, int a2, char a3)
{
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2000000000;
  int v31 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2000000000;
  uint64_t v27 = 0;
  unsigned __int8 v6 = (void *)mdns_string_builder_create();
  if (!v6)
  {
    unsigned int v11 = 0;
    goto LABEL_9;
  }
  int v7 = v6;
  if (!a2
    || (int v8 = mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(void *)(a1 + 16) + 8), (const void *)a1), (*((_DWORD *)v29 + 6) = v8) == 0))
  {
    int appended = mdns_string_builder_append_formatted(v7, "interface index: %u, ", *(_DWORD *)(a1 + 48));
    *((_DWORD *)v29 + 6) = appended;
    if (!appended)
    {
      int v10 = mdns_string_builder_append_formatted(v7, "server addresses: {");
      *((_DWORD *)v29 + 6) = v10;
      if (!v10)
      {
        v25[3] = 0;
        CFArrayRef v13 = *(const __CFArray **)(a1 + 24);
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 0x40000000;
        v22[2] = ___mrc_discovery_proxy_parameters_copy_description_block_invoke;
        v22[3] = &unk_264E1AAA0;
        v22[4] = &v28;
        v22[5] = &v24;
        v22[6] = v7;
        char v23 = a3;
        mdns_cfarray_enumerate(v13, (uint64_t)v22);
        unsigned int v11 = 0;
        if (*((_DWORD *)v29 + 6)) {
          goto LABEL_7;
        }
        int v14 = mdns_string_builder_append_formatted(v7, "}");
        *((_DWORD *)v29 + 6) = v14;
        if (!v14)
        {
          int v15 = mdns_string_builder_append_formatted(v7, ", domains: {");
          *((_DWORD *)v29 + 6) = v15;
          if (!v15)
          {
            v25[3] = 0;
            CFSetRef v16 = *(const __CFSet **)(a1 + 32);
            v20[0] = MEMORY[0x263EF8330];
            v20[1] = 0x40000000;
            v20[2] = ___mrc_discovery_proxy_parameters_copy_description_block_invoke_2;
            v20[3] = &unk_264E1AAC8;
            v20[4] = &v28;
            v20[5] = &v24;
            v20[6] = v7;
            char v21 = a3;
            mdns_cfset_enumerate(v16, (uint64_t)v20);
            unsigned int v11 = 0;
            if (*((_DWORD *)v29 + 6)) {
              goto LABEL_7;
            }
            int v17 = mdns_string_builder_append_formatted(v7, "}");
            *((_DWORD *)v29 + 6) = v17;
            if (!v17)
            {
              size_t count = xpc_array_get_count(*(xpc_object_t *)(a1 + 40));
              int v19 = mdns_string_builder_append_formatted(v7, ", certificate count: %zu", count);
              *((_DWORD *)v29 + 6) = v19;
              if (!v19)
              {
                unsigned int v11 = mdns_string_builder_copy_string((uint64_t)v7);
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  unsigned int v11 = 0;
LABEL_7:
  os_release(v7);
LABEL_9:
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  return v11;
}

BOOL ___mrc_discovery_proxy_parameters_copy_description_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = mdns_string_builder_append_description_with_prefix(*(void **)(a1 + 48), *(const char **)(*(void *)(*(void *)(a1 + 40) + 8)+ 24), a2, *(unsigned char *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ", ";
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

BOOL ___mrc_discovery_proxy_parameters_copy_description_block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = mdns_string_builder_append_description_with_prefix(*(void **)(a1 + 48), *(const char **)(*(void *)(*(void *)(a1 + 40) + 8)+ 24), a2, *(unsigned char *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ", ";
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

void *mrc_dns_proxy_create(uint64_t a1, int *a2)
{
  uint64_t v4 = (void *)_os_object_alloc();
  if (v4)
  {
    CFIndex v5 = v4;
    unsigned __int8 v6 = &_mrc_dns_proxy_kind;
    v4[2] = &_mrc_dns_proxy_kind;
    do
    {
      int v7 = (void (*)(void *))v6[2];
      if (v7) {
        v7(v5);
      }
      unsigned __int8 v6 = (_UNKNOWN **)*v6;
    }
    while (v6);
    xpc_object_t v8 = xpc_copy(*(xpc_object_t *)(a1 + 24));
    v5[6] = v8;
    BOOL v9 = v8 == 0;
    if (v8) {
      int v10 = v5;
    }
    else {
      int v10 = 0;
    }
    if (v8) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = v5;
    }
    if (v9) {
      int v11 = -6729;
    }
    else {
      int v11 = 0;
    }
    if (a2) {
      goto LABEL_16;
    }
  }
  else
  {
    int v10 = 0;
    int v11 = -6728;
    if (a2) {
LABEL_16:
    }
      *a2 = v11;
  }
  if (v4) {
    os_release(v4);
  }
  return v10;
}

void _mrc_dns_proxy_handle_invalidation(uint64_t a1, int a2)
{
}

void _mrc_dns_proxy_generate_event_with_error(uint64_t a1, int a2, int a3)
{
  CFIndex v5 = *(NSObject **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 0x40000000;
    v9[2] = ___mrc_dns_proxy_generate_event_with_error_block_invoke;
    v9[3] = &unk_264E1A8A0;
    v9[4] = v6;
    int v10 = a2;
    int v11 = a3;
    dispatch_async(v5, v9);
  }
  if (a2 == -1)
  {
    xpc_object_t v8 = *(const void **)(a1 + 56);
    if (v8)
    {
      _Block_release(v8);
      *(void *)(a1 + 56) = 0;
    }
  }
}

uint64_t ___mrc_dns_proxy_generate_event_with_error_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

void _mrc_dns_proxy_handle_interruption(uint64_t a1)
{
}

void _mrc_dns_proxy_handle_start(uint64_t a1)
{
}

xpc_object_t _mrc_dns_proxy_create_stop_message(uint64_t a1, uint64_t a2)
{
  return _mrc_xpc_create_command_message(a2, "dns_proxy.stop", 0);
}

xpc_object_t _mrc_dns_proxy_create_start_message(uint64_t a1, uint64_t a2)
{
  return _mrc_xpc_create_command_message(a2, "dns_proxy.start", *(void **)(a1 + 48));
}

void _mrc_dns_proxy_finalize(uint64_t a1)
{
  char v2 = *(void **)(a1 + 48);
  if (v2)
  {
    xpc_release(v2);
    *(void *)(a1 + 48) = 0;
  }
}

char *_mrc_dns_proxy_copy_description(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v17 = 0;
  if (_mrc_dns_proxy_print_description(a1, a2, __s1, 128, &v17, a6, a7, a8)) {
    return 0;
  }
  if (v17 > 0x7F)
  {
    uint64_t v11 = v17 + 1;
    if (v17 == -1) {
      goto LABEL_9;
    }
    uint64_t v12 = (char *)malloc_type_malloc(v17 + 1, 0xA172743EuLL);
    if (!v12) {
      goto LABEL_9;
    }
    xpc_object_t v8 = v12;
    if (_mrc_dns_proxy_print_description(a1, a2, v12, v11, 0, v13, v14, v15))
    {
LABEL_10:
      free(v8);
      return 0;
    }
  }
  else
  {
    xpc_object_t v8 = strdup(__s1);
    if (!v8)
    {
LABEL_9:
      __break(1u);
      goto LABEL_10;
    }
  }
  return v8;
}

uint64_t _mrc_dns_proxy_print_description(uint64_t a1, int a2, char *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFSetRef v16 = a3;
  uint64_t v10 = (uint64_t)&a3[a4];
  if (a2)
  {
    unsigned int v11 = mdns_snprintf_add(&v16, v10, "<%s: %p>: ", a4, (uint64_t)a5, a6, a7, a8, *(void *)(*(void *)(a1 + 16) + 8));
    if ((v11 & 0x80000000) != 0) {
      return 4294960596;
    }
    uint64_t v12 = v11;
    a3 = v16;
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t result = _mrc_xpc_dns_proxy_params_print_description(*(void **)(a1 + 48), a3, v10 - (void)a3, &v15, (uint64_t)&v14, a6, a7, a8);
  if (!result)
  {
    uint64_t result = 0;
    if (a5) {
      *a5 = v14 + v12;
    }
  }
  return result;
}

void _mrc_client_set_queue(uint64_t a1, dispatch_object_t object)
{
  if (!*(unsigned char *)(a1 + 41))
  {
    if (object) {
      dispatch_retain(object);
    }
    uint64_t v4 = *(NSObject **)(a1 + 32);
    if (v4) {
      dispatch_release(v4);
    }
    *(void *)(a1 + 32) = object;
  }
}

void mrc_dns_proxy_set_event_handler(uint64_t a1, void *aBlock)
{
  if (!*(unsigned char *)(a1 + 41))
  {
    if (aBlock) {
      int v3 = _Block_copy(aBlock);
    }
    else {
      int v3 = 0;
    }
    uint64_t v4 = *(const void **)(a1 + 56);
    if (v4) {
      _Block_release(v4);
    }
    *(void *)(a1 + 56) = v3;
  }
}

void _mrc_client_activate_async(unsigned char *a1)
{
  a1[41] = 1;
  os_retain(a1);
  if (_mrc_client_queue_s_once != -1) {
    dispatch_once(&_mrc_client_queue_s_once, &__block_literal_global_77);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___mrc_client_activate_async_block_invoke;
  block[3] = &__block_descriptor_tmp_25;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_mrc_client_queue_s_queue, block);
}

void ___mrc_client_activate_async_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 40))
  {
    *(unsigned char *)(v2 + 40) = 1;
    uint64_t v3 = _os_object_alloc();
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      CFIndex v5 = &_mrc_session_kind;
      *(void *)(v3 + 16) = &_mrc_session_kind;
      do
      {
        uint64_t v6 = (void (*)(void *))v5[2];
        if (v6) {
          v6(v4);
        }
        CFIndex v5 = (_UNKNOWN **)*v5;
      }
      while (v5);
      v4[5] = v2;
      os_retain((void *)v2);
      v4[6] = *(void *)(*(void *)(v4[5] + 16) + 96);
      *(void *)(v2 + 24) = v4;
      os_retain(v4);
      if (_mrc_client_queue_s_once != -1) {
        dispatch_once(&_mrc_client_queue_s_once, &__block_literal_global_77);
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = ___mrc_session_activate_async_block_invoke;
      block[3] = &__block_descriptor_tmp_26;
      block[4] = v4;
      dispatch_async((dispatch_queue_t)_mrc_client_queue_s_queue, block);
    }
    else
    {
      *(void *)(v2 + 24) = 0;
      _mrc_client_invalidate_async((void *)v2, -6729);
    }
  }
  os_release(*(void **)(a1 + 32));
}

void ___mrc_session_activate_async_block_invoke(uint64_t a1)
{
  char v1 = *(unsigned char **)(a1 + 32);
  if (!v1[56])
  {
    uint64_t v3 = &g_session_list;
    do
    {
      uint64_t v4 = v3;
      uint64_t v5 = *v3;
      uint64_t v3 = (uint64_t *)(*v3 + 32);
    }
    while (v5);
    uint64_t *v4 = (uint64_t)v1;
    os_retain(v1);
    _mrc_session_send_start_message((uint64_t)v1);
    char v1 = *(unsigned char **)(a1 + 32);
  }

  os_release(v1);
}

void _mrc_client_invalidate_async(void *a1, int a2)
{
  os_retain(a1);
  if (_mrc_client_queue_s_once != -1) {
    dispatch_once(&_mrc_client_queue_s_once, &__block_literal_global_77);
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = ___mrc_client_invalidate_async_block_invoke;
  v4[3] = &__block_descriptor_tmp_37;
  v4[4] = a1;
  int v5 = a2;
  dispatch_async((dispatch_queue_t)_mrc_client_queue_s_queue, v4);
}

void ___mrc_client_invalidate_async_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 40) != 2)
  {
    uint64_t v3 = *(unsigned int *)(a1 + 40);
    uint64_t v4 = *(void *)(v1 + 24);
    if (v4)
    {
      _mrc_session_invalidate_async(v4, 0);
      int v5 = *(void **)(v1 + 24);
      if (v5)
      {
        os_release(v5);
        *(void *)(v1 + 24) = 0;
      }
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 + 16) + 80))(v1, v3);
    *(unsigned char *)(v1 + 40) = 2;
    uint64_t v1 = *(void *)(a1 + 32);
  }

  os_release((void *)v1);
}

void _mrc_session_invalidate_async(void *a1, int a2)
{
  os_retain(a1);
  if (_mrc_client_queue_s_once != -1) {
    dispatch_once(&_mrc_client_queue_s_once, &__block_literal_global_77);
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = ___mrc_session_invalidate_async_block_invoke;
  v4[3] = &__block_descriptor_tmp_35;
  v4[4] = a1;
  int v5 = a2;
  dispatch_async((dispatch_queue_t)_mrc_client_queue_s_queue, v4);
}

void ___mrc_session_invalidate_async_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(v2 + 56) != 255)
  {
    int v3 = *(_DWORD *)(a1 + 40);
    uint64_t v4 = (void **)&g_session_list;
    do
    {
      int v5 = v4;
      uint64_t v6 = *v4;
      uint64_t v4 = (void **)((char *)*v4 + 32);
      if (v6) {
        BOOL v7 = v6 == (void *)v2;
      }
      else {
        BOOL v7 = 1;
      }
    }
    while (!v7);
    if (v6)
    {
      os_release(v6);
      *int v5 = *(void **)(v2 + 32);
      *(void *)(v2 + 32) = 0;
      if ((*(char *)(v2 + 56) - 1) <= 1)
      {
        xpc_object_t v8 = *(uint64_t (**)(void))(*(void *)(*(void *)(v2 + 40) + 16) + 56);
        if (v8)
        {
          uint64_t v9 = v8();
          if (v9)
          {
            uint64_t v10 = (void *)v9;
            os_retain((void *)v2);
            unsigned int v11 = (_xpc_connection_s *)_mrc_client_connection();
            if (_mrc_client_queue_s_once != -1)
            {
              uint64_t v13 = v11;
              dispatch_once(&_mrc_client_queue_s_once, &__block_literal_global_77);
              unsigned int v11 = v13;
            }
            handler[0] = MEMORY[0x263EF8330];
            handler[1] = 0x40000000;
            handler[2] = ___mrc_session_send_stop_message_block_invoke;
            handler[3] = &__block_descriptor_tmp_36;
            handler[4] = v2;
            xpc_connection_send_message_with_reply(v11, v10, (dispatch_queue_t)_mrc_client_queue_s_queue, handler);
            xpc_release(v10);
          }
        }
      }
      *(unsigned char *)(v2 + 56) = -1;
      uint64_t v12 = *(void **)(v2 + 40);
      if (!v12[3] || (_mrc_client_invalidate_async(v12, v3), (uint64_t v12 = *(void **)(v2 + 40)) != 0))
      {
        os_release(v12);
        *(void *)(v2 + 40) = 0;
      }
    }
  }
  os_release(*(void **)(a1 + 32));
}

uint64_t _mrc_client_connection()
{
  uint64_t result = _mrc_client_connection_s_connection;
  if (!_mrc_client_connection_s_connection)
  {
    if (_mrc_client_queue_s_once != -1) {
      dispatch_once(&_mrc_client_queue_s_once, &__block_literal_global_77);
    }
    _mrc_client_connection_s_connection = (uint64_t)xpc_connection_create_mach_service("com.apple.mDNSResponder.control", (dispatch_queue_t)_mrc_client_queue_s_queue, 2uLL);
    xpc_connection_set_event_handler((xpc_connection_t)_mrc_client_connection_s_connection, &__block_literal_global_336);
    xpc_connection_activate((xpc_connection_t)_mrc_client_connection_s_connection);
    return _mrc_client_connection_s_connection;
  }
  return result;
}

void ___mrc_session_send_stop_message_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  if (MEMORY[0x23ECD6650](a2) == MEMORY[0x263EF8708])
  {
    BOOL v15 = 0;
    int int32 = mdns_xpc_dictionary_get_int32(a2, "error", &v15);
    if (v15) {
      int v8 = int32;
    }
    else {
      int v8 = -6712;
    }
    if (_mrc_client_log_s_once != -1) {
      dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_32);
    }
    uint64_t v9 = _mrc_client_log_s_log;
    if (v8) {
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    }
    else {
      os_log_type_t v10 = OS_LOG_TYPE_INFO;
    }
    if (os_log_type_enabled((os_log_t)_mrc_client_log_s_log, v10))
    {
      uint64_t v11 = *(void *)(v4 + 24);
      uint64_t v12 = *(void *)(v4 + 48);
      *(_DWORD *)buf = 134218498;
      uint64_t v17 = v11;
      __int16 v18 = 2082;
      uint64_t v19 = v12;
      __int16 v20 = 2048;
      char v21 = (void *)v8;
      _os_log_impl(&dword_23BEA5000, v9, v10, "[S%llu] %{public}s stop reply -- error: %{mdns:err}ld", buf, 0x20u);
    }
  }
  else
  {
    int v5 = (void *)MEMORY[0x23ECD6580](a2);
    if (_mrc_client_log_s_once != -1) {
      dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_32);
    }
    uint64_t v6 = _mrc_client_log_s_log;
    if (os_log_type_enabled((os_log_t)_mrc_client_log_s_log, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(v4 + 24);
      uint64_t v14 = *(void *)(v4 + 48);
      *(_DWORD *)buf = 134218498;
      uint64_t v17 = v13;
      __int16 v18 = 2082;
      uint64_t v19 = v14;
      __int16 v20 = 2082;
      char v21 = v5;
      _os_log_error_impl(&dword_23BEA5000, v6, OS_LOG_TYPE_ERROR, "[S%llu] Abnormal %{public}s stop reply: %{public}s", buf, 0x20u);
      if (!v5) {
        goto LABEL_17;
      }
      goto LABEL_6;
    }
    if (v5) {
LABEL_6:
    }
      free(v5);
  }
LABEL_17:
  os_release(*(void **)(a1 + 32));
}

os_log_t ___mrc_client_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.mdns", "mrc");
  _mrc_client_log_s_log = (uint64_t)result;
  return result;
}

void ___mrc_client_connection_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v3 = MEMORY[0x23ECD6650](a2);
  if (v3 == MEMORY[0x263EF8708])
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(a2, "id");
    uint64_t v7 = uint64;
    int v8 = (void *)g_session_list;
    if (g_session_list)
    {
      while (v8[3] != uint64)
      {
        int v8 = (void *)v8[4];
        if (!v8) {
          goto LABEL_12;
        }
      }
      xpc_object_t dictionary = xpc_dictionary_get_dictionary(a2, "body");
      if (dictionary)
      {
        CFSetRef v16 = *(void (**)(void))(*(void *)(v8[5] + 16) + 88);
        if (v16)
        {
          v16();
          goto LABEL_20;
        }
        uint64_t v4 = (void *)MEMORY[0x23ECD6580](dictionary);
        if (_mrc_client_log_s_once != -1) {
          dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_32);
        }
        uint64_t v17 = _mrc_client_log_s_log;
        if (!os_log_type_enabled((os_log_t)_mrc_client_log_s_log, OS_LOG_TYPE_FAULT)) {
          goto LABEL_7;
        }
        char v21 = (const char *)v8[3];
        uint64_t v22 = v8[6];
        int v24 = 134218499;
        uint64_t v25 = v21;
        __int16 v26 = 2082;
        uint64_t v27 = v22;
        __int16 v28 = 2081;
        uint64_t v29 = v4;
        __int16 v20 = "[S%llu] Notification for %{public}s was unhandled: %{private}s";
      }
      else
      {
        uint64_t v4 = (void *)MEMORY[0x23ECD6580](a2);
        if (_mrc_client_log_s_once != -1) {
          dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_32);
        }
        uint64_t v17 = _mrc_client_log_s_log;
        if (!os_log_type_enabled((os_log_t)_mrc_client_log_s_log, OS_LOG_TYPE_FAULT)) {
          goto LABEL_7;
        }
        __int16 v18 = (const char *)v8[3];
        uint64_t v19 = v8[6];
        int v24 = 134218499;
        uint64_t v25 = v18;
        __int16 v26 = 2082;
        uint64_t v27 = v19;
        __int16 v28 = 2081;
        uint64_t v29 = v4;
        __int16 v20 = "[S%llu] Notification for %{public}s is missing body: %{private}s";
      }
      _os_log_fault_impl(&dword_23BEA5000, v17, OS_LOG_TYPE_FAULT, v20, (uint8_t *)&v24, 0x20u);
LABEL_7:
      if (v4) {
        free(v4);
      }
      goto LABEL_20;
    }
LABEL_12:
    if (_mrc_client_log_s_once != -1) {
      dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_32);
    }
    uint64_t v9 = _mrc_client_log_s_log;
    if (os_log_type_enabled((os_log_t)_mrc_client_log_s_log, OS_LOG_TYPE_FAULT))
    {
      int v24 = 134217984;
      uint64_t v25 = (const char *)v7;
      _os_log_fault_impl(&dword_23BEA5000, v9, OS_LOG_TYPE_FAULT, "Unrecognized notification ID: %llu", (uint8_t *)&v24, 0xCu);
    }
  }
  else
  {
    if (v3 != MEMORY[0x263EF8720])
    {
      uint64_t v4 = (void *)MEMORY[0x23ECD6580](a2);
      if (_mrc_client_log_s_once != -1) {
        dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_32);
      }
      int v5 = _mrc_client_log_s_log;
      if (os_log_type_enabled((os_log_t)_mrc_client_log_s_log, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 136315138;
        uint64_t v25 = (const char *)v4;
        _os_log_impl(&dword_23BEA5000, v5, OS_LOG_TYPE_DEFAULT, "Unexpected connection event: %s", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_7;
    }
    if (_mrc_client_log_s_once != -1) {
      dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_32);
    }
    os_log_type_t v10 = _mrc_client_log_s_log;
    if (os_log_type_enabled((os_log_t)_mrc_client_log_s_log, OS_LOG_TYPE_ERROR))
    {
      string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
      int v24 = 136446210;
      uint64_t v25 = string;
      _os_log_error_impl(&dword_23BEA5000, v10, OS_LOG_TYPE_ERROR, "Connection error: %{public}s", (uint8_t *)&v24, 0xCu);
    }
  }
LABEL_20:
  if (a2 == (void *)MEMORY[0x263EF86A0])
  {
    for (uint64_t i = g_session_list; i; uint64_t i = *(void *)(i + 32))
    {
      if ((*(char *)(i + 56) - 1) <= 1)
      {
        if (*(unsigned char *)(i + 56) == 2)
        {
          uint64_t v12 = *(void *)(i + 40);
          if (*(void *)(v12 + 24))
          {
            uint64_t v13 = *(void (**)(void))(*(void *)(v12 + 16) + 72);
            if (v13) {
              v13();
            }
          }
        }
        _mrc_session_send_start_message(i);
      }
    }
    for (uint64_t j = g_dns_proxy_state_inquiry_list; j; uint64_t j = *(void *)(j + 32))
    {
      if (*(unsigned char *)(j + 56) == 2) {
        _mrc_dns_proxy_state_inquiry_send_command(j);
      }
    }
  }
}

void _mrc_session_send_start_message(uint64_t a1)
{
  *(unsigned char *)(a1 + 56) = 1;
  *(void *)(a1 + 24) = ++_mrc_client_get_new_command_id_last_command_id;
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 40) + 16) + 48))();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    os_retain((void *)a1);
    uint64_t v4 = *(void *)(a1 + 24);
    int v5 = (_xpc_connection_s *)_mrc_client_connection();
    if (_mrc_client_queue_s_once != -1) {
      dispatch_once(&_mrc_client_queue_s_once, &__block_literal_global_77);
    }
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 0x40000000;
    v6[2] = ___mrc_session_send_start_message_block_invoke;
    v6[3] = &__block_descriptor_tmp_28;
    v6[4] = a1;
    v6[5] = v4;
    xpc_connection_send_message_with_reply(v5, v3, (dispatch_queue_t)_mrc_client_queue_s_queue, v6);
    xpc_release(v3);
  }
}

void _mrc_dns_proxy_state_inquiry_send_command(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 56) - 3 >= 0xFFFFFFFE)
  {
    *(unsigned char *)(a1 + 56) = 2;
    uint64_t v2 = ++_mrc_client_get_new_command_id_last_command_id;
    *(void *)(a1 + 24) = _mrc_client_get_new_command_id_last_command_id;
    xpc_object_t command_message = _mrc_xpc_create_command_message(v2, "dns_proxy.get_state", 0);
    os_retain((void *)a1);
    uint64_t v4 = (_xpc_connection_s *)_mrc_client_connection();
    if (_mrc_client_queue_s_once != -1) {
      dispatch_once(&_mrc_client_queue_s_once, &__block_literal_global_77);
    }
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 0x40000000;
    v5[2] = ___mrc_dns_proxy_state_inquiry_send_command_block_invoke;
    v5[3] = &__block_descriptor_tmp_38;
    v5[4] = a1;
    v5[5] = v2;
    xpc_connection_send_message_with_reply(v4, command_message, (dispatch_queue_t)_mrc_client_queue_s_queue, v5);
    if (command_message) {
      xpc_release(command_message);
    }
  }
}

void ___mrc_dns_proxy_state_inquiry_send_command_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 24) != *(void *)(a1 + 40) || *(unsigned char *)(v3 + 56) != 2) {
    goto LABEL_36;
  }
  if (MEMORY[0x23ECD6650](a2) == MEMORY[0x263EF8708])
  {
    BOOL v18 = 0;
    int int32 = mdns_xpc_dictionary_get_int32(a2, "error", &v18);
    if (v18) {
      int v11 = int32;
    }
    else {
      int v11 = -6712;
    }
    if (v11)
    {
      xpc_object_t v12 = 0;
    }
    else
    {
      xpc_object_t object = _mdns_xpc_dictionary_get_object(a2, "result", MEMORY[0x263EF8708]);
      if (object) {
        xpc_object_t v12 = _mdns_xpc_dictionary_get_object(object, "description", MEMORY[0x263EF8798]);
      }
      else {
        xpc_object_t v12 = 0;
      }
      if (v12) {
        int v11 = 0;
      }
      else {
        int v11 = -6712;
      }
    }
    if (_mrc_client_log_s_once != -1) {
      dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_32);
    }
    uint64_t v14 = _mrc_client_log_s_log;
    if (v11) {
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    }
    else {
      os_log_type_t v15 = OS_LOG_TYPE_INFO;
    }
    if (os_log_type_enabled((os_log_t)_mrc_client_log_s_log, v15))
    {
      uint64_t v16 = *(void *)(v3 + 24);
      *(_DWORD *)buf = 134218240;
      uint64_t v20 = v16;
      __int16 v21 = 2048;
      uint64_t v22 = (void *)v11;
      _os_log_impl(&dword_23BEA5000, v14, v15, "[DP%llu] DNS proxy state reply -- error: %{mdns:err}ld", buf, 0x16u);
    }
    uint64_t v8 = v3;
    if (v11)
    {
      uint64_t v9 = 0;
      int v7 = v11;
    }
    else
    {
      uint64_t v9 = v12;
      int v7 = 0;
    }
    goto LABEL_35;
  }
  int v5 = (void *)MEMORY[0x23ECD6580](a2);
  if (_mrc_client_log_s_once != -1) {
    dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_32);
  }
  uint64_t v6 = _mrc_client_log_s_log;
  if (!os_log_type_enabled((os_log_t)_mrc_client_log_s_log, OS_LOG_TYPE_ERROR))
  {
    if (!v5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v17 = *(void *)(v3 + 24);
  *(_DWORD *)buf = 134218242;
  uint64_t v20 = v17;
  __int16 v21 = 2082;
  uint64_t v22 = v5;
  _os_log_error_impl(&dword_23BEA5000, v6, OS_LOG_TYPE_ERROR, "[DP%llu] Abnormal DNS proxy state reply: %{public}s", buf, 0x16u);
  if (v5) {
LABEL_8:
  }
    free(v5);
LABEL_9:
  if (a2 != (void *)MEMORY[0x263EF86A0])
  {
    if (a2 == (void *)MEMORY[0x263EF86A8]) {
      int v7 = -6753;
    }
    else {
      int v7 = -6712;
    }
    uint64_t v8 = v3;
    uint64_t v9 = 0;
LABEL_35:
    _mrc_dns_proxy_state_inquiry_terminate_imp(v8, v9, v7);
  }
LABEL_36:
  os_release(*(void **)(a1 + 32));
}

void _mrc_dns_proxy_state_inquiry_terminate_imp(uint64_t a1, xpc_object_t object, int a3)
{
  if (*(unsigned char *)(a1 + 56) != 3)
  {
    uint64_t v6 = (void **)&g_dns_proxy_state_inquiry_list;
    do
    {
      int v7 = v6;
      uint64_t v8 = *v6;
      uint64_t v6 = (void **)((char *)*v6 + 32);
      if (v8) {
        BOOL v9 = v8 == (void *)a1;
      }
      else {
        BOOL v9 = 1;
      }
    }
    while (!v9);
    if (v8)
    {
      os_release(v8);
      void *v7 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;
    }
    *(unsigned char *)(a1 + 56) = 3;
    os_log_type_t v10 = *(NSObject **)(a1 + 40);
    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 48);
      if (v11)
      {
        *(void *)(a1 + 48) = 0;
        if (object)
        {
          xpc_retain(object);
          os_log_type_t v10 = *(NSObject **)(a1 + 40);
        }
        block[0] = MEMORY[0x263EF8330];
        block[1] = 0x40000000;
        block[2] = ___mrc_dns_proxy_state_inquiry_terminate_imp_block_invoke;
        block[3] = &unk_264E1A9E8;
        block[4] = v11;
        void block[5] = object;
        int v14 = a3;
        dispatch_async(v10, block);
      }
    }
    xpc_object_t v12 = *(const void **)(a1 + 48);
    if (v12)
    {
      _Block_release(v12);
      *(void *)(a1 + 48) = 0;
    }
  }
}

void ___mrc_dns_proxy_state_inquiry_terminate_imp_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2) {
    xpc_string_get_string_ptr(v2);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(const void **)(a1 + 32);
  if (v3) {
    _Block_release(v3);
  }
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    xpc_release(v4);
  }
}

void ___mrc_session_send_start_message_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 56) != 1 || *(void *)(v3 + 24) != *(void *)(a1 + 40)) {
    goto LABEL_31;
  }
  if (MEMORY[0x23ECD6650](a2) == MEMORY[0x263EF8708])
  {
    BOOL v19 = 0;
    int int32 = mdns_xpc_dictionary_get_int32(a2, "error", &v19);
    if (v19) {
      int v10 = int32;
    }
    else {
      int v10 = -6712;
    }
    if (_mrc_client_log_s_once != -1) {
      dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_32);
    }
    uint64_t v11 = _mrc_client_log_s_log;
    if (v10) {
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    }
    else {
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
    }
    if (os_log_type_enabled((os_log_t)_mrc_client_log_s_log, v12))
    {
      uint64_t v13 = *(void *)(v3 + 24);
      uint64_t v14 = *(void *)(v3 + 48);
      *(_DWORD *)buf = 134218498;
      uint64_t v21 = v13;
      __int16 v22 = 2082;
      uint64_t v23 = v14;
      __int16 v24 = 2048;
      uint64_t v25 = (void *)v10;
      _os_log_impl(&dword_23BEA5000, v11, v12, "[S%llu] %{public}s start reply -- error: %{mdns:err}ld", buf, 0x20u);
    }
    if (v10)
    {
      *(unsigned char *)(v3 + 56) = 3;
      uint64_t v8 = (void *)v3;
      int v7 = v10;
    }
    else
    {
      uint64_t v15 = *(void *)(v3 + 40);
      xpc_object_t object = _mdns_xpc_dictionary_get_object(a2, "result", MEMORY[0x263EF8708]);
      if (*(void *)(v15 + 24)) {
        (*(void (**)(uint64_t, xpc_object_t))(*(void *)(v15 + 16) + 64))(v15, object);
      }
      if (!*(unsigned char *)(*(void *)(*(void *)(v3 + 40) + 16) + 104))
      {
        *(unsigned char *)(v3 + 56) = 2;
        goto LABEL_31;
      }
      *(unsigned char *)(v3 + 56) = 3;
      uint64_t v8 = (void *)v3;
      int v7 = 0;
    }
    goto LABEL_30;
  }
  int v5 = (void *)MEMORY[0x23ECD6580](a2);
  if (_mrc_client_log_s_once != -1) {
    dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_32);
  }
  uint64_t v6 = _mrc_client_log_s_log;
  if (!os_log_type_enabled((os_log_t)_mrc_client_log_s_log, OS_LOG_TYPE_ERROR))
  {
    if (!v5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v17 = *(void *)(v3 + 24);
  uint64_t v18 = *(void *)(v3 + 48);
  *(_DWORD *)buf = 134218498;
  uint64_t v21 = v17;
  __int16 v22 = 2082;
  uint64_t v23 = v18;
  __int16 v24 = 2082;
  uint64_t v25 = v5;
  _os_log_error_impl(&dword_23BEA5000, v6, OS_LOG_TYPE_ERROR, "[S%llu] Abnormal %{public}s start reply: %{public}s", buf, 0x20u);
  if (v5) {
LABEL_8:
  }
    free(v5);
LABEL_9:
  if (a2 != (void *)MEMORY[0x263EF86A0])
  {
    if (a2 == (void *)MEMORY[0x263EF86A8]) {
      int v7 = -6753;
    }
    else {
      int v7 = -6712;
    }
    *(unsigned char *)(v3 + 56) = 3;
    uint64_t v8 = (void *)v3;
LABEL_30:
    _mrc_session_invalidate_async(v8, v7);
  }
LABEL_31:
  os_release(*(void **)(a1 + 32));
}

dispatch_queue_t ___mrc_client_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.mdns.mrc", 0);
  _mrc_client_queue_s_queue = (uint64_t)result;
  return result;
}

void mrc_dns_proxy_invalidate(void *a1)
{
}

void *mrc_dns_proxy_parameters_create(int *a1)
{
  uint64_t v2 = (void *)_os_object_alloc();
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = &_mrc_dns_proxy_parameters_kind;
    v2[2] = &_mrc_dns_proxy_parameters_kind;
    do
    {
      int v5 = (void (*)(void *))v4[2];
      if (v5) {
        v5(v3);
      }
      uint64_t v4 = (_UNKNOWN **)*v4;
    }
    while (v4);
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    v3[3] = v6;
    BOOL v7 = v6 == 0;
    if (v6) {
      uint64_t v8 = v3;
    }
    else {
      uint64_t v8 = 0;
    }
    if (v6) {
      uint64_t v2 = 0;
    }
    else {
      uint64_t v2 = v3;
    }
    if (v7) {
      int v9 = -6729;
    }
    else {
      int v9 = 0;
    }
    if (a1) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v8 = 0;
    int v9 = -6728;
    if (a1) {
LABEL_16:
    }
      *a1 = v9;
  }
  if (v2) {
    os_release(v2);
  }
  return v8;
}

void mrc_dns_proxy_parameters_add_input_interface(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void **)(a1 + 24);
  xpc_object_t optional_array = mdns_xpc_dictionary_get_optional_array(v3, "input_interfaces", 0);
  if (!optional_array)
  {
    xpc_object_t v5 = xpc_array_create(0, 0);
    xpc_dictionary_set_value(v3, "input_interfaces", v5);
    if (v5) {
      xpc_release(v5);
    }
    goto LABEL_17;
  }
  xpc_object_t v5 = optional_array;
  size_t count = xpc_array_get_count(optional_array);
  if (!count) {
    goto LABEL_17;
  }
  size_t v7 = 0;
  size_t v8 = count - 1;
  do
  {
    BOOL v13 = 0;
    xpc_object_t value = xpc_array_get_value(v5, v7);
    int uint64_limited = _mdns_xpc_object_get_uint64_limited((uint64_t)value, 0xFFFFFFFFuLL, &v13);
    BOOL v11 = v13 && uint64_limited == a2;
    char v12 = v11;
    if (v11) {
      break;
    }
    BOOL v11 = v8 == v7++;
  }
  while (!v11);
  if ((v12 & 1) == 0) {
LABEL_17:
  }
    xpc_array_set_uint64(v5, 0xFFFFFFFFFFFFFFFFLL, a2);
}

void mrc_dns_proxy_parameters_set_output_interface(uint64_t a1, uint64_t value)
{
}

void mrc_dns_proxy_parameters_set_nat64_prefix(uint64_t a1, void *__src, unint64_t a3)
{
  __dst[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void **)(a1 + 24);
  __dst[0] = 0;
  __dst[1] = 0;
  if (a3 >= 0x80) {
    uint64_t v5 = 128;
  }
  else {
    uint64_t v5 = a3;
  }
  if (v5 >= 8) {
    memcpy(__dst, __src, v5 >> 3);
  }
  if ((v5 & 7) != 0) {
    *((unsigned char *)__dst + (v5 >> 3)) = *((unsigned char *)__dst + (v5 >> 3)) & ~(-1 << (8 - (v5 & 7))) | *((unsigned char *)__src
  }
                                                                                              + (v5 >> 3)) & (-1 << (8 - (v5 & 7)));
  xpc_dictionary_set_data(v4, "nat64_prefix.bits", __dst, (v5 + 7) >> 3);
  xpc_dictionary_set_uint64(v4, "nat64_prefix.bit_len", v5);
}

void mrc_dns_proxy_parameters_set_force_aaaa_synthesis(uint64_t a1, BOOL value)
{
}

BOOL mrc_dns_proxy_parameters_enumerate_input_interfaces(uint64_t a1, uint64_t a2)
{
  xpc_object_t optional_array = mdns_xpc_dictionary_get_optional_array(*(void **)(a1 + 24), "input_interfaces", 0);
  if (optional_array && (uint64_t v4 = optional_array, (count = xpc_array_get_count(optional_array)) != 0))
  {
    size_t v6 = count;
    BOOL v7 = 0;
    for (size_t i = 0; i != v6; v7 = i >= v6)
    {
      xpc_object_t value = xpc_array_get_value(v4, i);
      uint64_t uint64_limited = _mdns_xpc_object_get_uint64_limited((uint64_t)value, 0xFFFFFFFFuLL, 0);
      if (((*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, uint64_limited) & 1) == 0) {
        break;
      }
      ++i;
    }
  }
  else
  {
    return 1;
  }
  return v7;
}

uint64_t mrc_dns_proxy_parameters_get_output_interface(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  BOOL v4 = 0;
  xpc_object_t value = xpc_dictionary_get_value(v1, "output_interface");
  return _mdns_xpc_object_get_uint64_limited((uint64_t)value, 0xFFFFFFFFuLL, &v4);
}

BOOL mrc_dns_proxy_parameters_get_force_aaaa_synthesis(uint64_t a1)
{
  return _mdns_xpc_dictionary_get_object(*(void **)(a1 + 24), "force_aaaa_synth", MEMORY[0x263EF86E0]) == (xpc_object_t)MEMORY[0x263EF8698];
}

uint64_t mrc_dns_proxy_state_inquiry_create()
{
  uint64_t v0 = _os_object_alloc();
  uint64_t v1 = v0;
  if (v0)
  {
    uint64_t v2 = &_mrc_dns_proxy_state_inquiry_kind;
    *(void *)(v0 + 16) = &_mrc_dns_proxy_state_inquiry_kind;
    do
    {
      uint64_t v3 = (void (*)(uint64_t))v2[2];
      if (v3) {
        v3(v1);
      }
      uint64_t v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
  }
  return v1;
}

void mrc_dns_proxy_state_inquiry_set_queue(uint64_t a1, dispatch_object_t object)
{
  if (!*(unsigned char *)(a1 + 57))
  {
    if (object) {
      dispatch_retain(object);
    }
    BOOL v4 = *(NSObject **)(a1 + 40);
    if (v4) {
      dispatch_release(v4);
    }
    *(void *)(a1 + 40) = object;
  }
}

void mrc_dns_proxy_state_inquiry_set_handler(uint64_t a1, void *aBlock)
{
  if (!*(unsigned char *)(a1 + 57))
  {
    if (aBlock) {
      uint64_t v3 = _Block_copy(aBlock);
    }
    else {
      uint64_t v3 = 0;
    }
    BOOL v4 = *(const void **)(a1 + 48);
    if (v4) {
      _Block_release(v4);
    }
    *(void *)(a1 + 48) = v3;
  }
}

void mrc_dns_proxy_state_inquiry_activate(unsigned char *a1)
{
  a1[57] = 1;
  os_retain(a1);
  if (_mrc_client_queue_s_once != -1) {
    dispatch_once(&_mrc_client_queue_s_once, &__block_literal_global_77);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __mrc_dns_proxy_state_inquiry_activate_block_invoke;
  block[3] = &__block_descriptor_tmp_339;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_mrc_client_queue_s_queue, block);
}

void __mrc_dns_proxy_state_inquiry_activate_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (!v2[56])
  {
    v2[56] = 1;
    uint64_t v3 = &g_dns_proxy_state_inquiry_list;
    do
    {
      BOOL v4 = v3;
      uint64_t v5 = *v3;
      uint64_t v3 = (uint64_t *)(*v3 + 32);
    }
    while (v5);
    uint64_t *v4 = (uint64_t)v2;
    os_retain(v2);
    uint64_t v2 = *(unsigned char **)(a1 + 32);
  }
  _mrc_dns_proxy_state_inquiry_send_command((uint64_t)v2);
  size_t v6 = *(void **)(a1 + 32);

  os_release(v6);
}

void mrc_dns_proxy_state_inquiry_invalidate(unsigned char *a1)
{
  a1[57] = 1;
  os_retain(a1);
  if (_mrc_client_queue_s_once != -1) {
    dispatch_once(&_mrc_client_queue_s_once, &__block_literal_global_77);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __mrc_dns_proxy_state_inquiry_invalidate_block_invoke;
  block[3] = &__block_descriptor_tmp_10;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_mrc_client_queue_s_queue, block);
}

void __mrc_dns_proxy_state_inquiry_invalidate_block_invoke(uint64_t a1)
{
  _mrc_dns_proxy_state_inquiry_terminate_imp(*(void *)(a1 + 32), 0, 0);
  uint64_t v2 = *(void **)(a1 + 32);

  os_release(v2);
}

uint64_t mrc_dns_service_registration_create(uint64_t a1)
{
  uint64_t v2 = _mrc_dns_service_registration_new();
  if (v2)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    CFArrayRef v4 = *(const __CFArray **)(a1 + 24);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 0x40000000;
    v8[2] = __mdns_dns_service_definition_create_xpc_dictionary_block_invoke;
    v8[3] = &__block_descriptor_tmp_31;
    v8[4] = empty;
    if (mdns_cfarray_enumerate(v4, (uint64_t)v8))
    {
      CFSetRef v5 = *(const __CFSet **)(a1 + 32);
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 0x40000000;
      v7[2] = __mdns_dns_service_definition_create_xpc_dictionary_block_invoke_2;
      v7[3] = &__block_descriptor_tmp_8;
      v7[4] = empty;
      mdns_cfset_enumerate(v5, (uint64_t)v7);
      xpc_dictionary_set_uint64(empty, "ifindex", *(unsigned int *)(a1 + 48));
      xpc_dictionary_set_uint64(empty, "interface_scope", *(unsigned __int8 *)(a1 + 52));
      xpc_dictionary_set_BOOL(empty, "local_purview", *(unsigned char *)(a1 + 53));
      xpc_dictionary_set_BOOL(empty, "mdns_alternative", *(unsigned char *)(a1 + 54));
      *(void *)(v2 + 48) = empty;
      if (empty)
      {
        *(unsigned char *)(v2 + 64) = 1;
        return v2;
      }
    }
    else
    {
      if (empty) {
        xpc_release(empty);
      }
      *(void *)(v2 + 48) = 0;
    }
    os_release((void *)v2);
    return 0;
  }
  return v2;
}

uint64_t _mrc_dns_service_registration_new()
{
  uint64_t v0 = _os_object_alloc();
  uint64_t v1 = v0;
  if (v0)
  {
    uint64_t v2 = &_mrc_dns_service_registration_kind;
    *(void *)(v0 + 16) = &_mrc_dns_service_registration_kind;
    do
    {
      uint64_t v3 = (void (*)(uint64_t))v2[2];
      if (v3) {
        v3(v1);
      }
      uint64_t v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
  }
  return v1;
}

void _mrc_dns_service_registration_handle_notification(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 65))
  {
    LOBYTE(v6) = 0;
    int int32 = mdns_xpc_dictionary_get_int32(a2, "connection_error", (BOOL *)&v6);
    if ((_BYTE)v6) {
      _mrc_dns_service_registration_generate_event_with_error(a1, 3, int32);
    }
  }
  else
  {
    CFArrayRef v4 = (void *)MEMORY[0x23ECD6580](a2);
    if (_mrc_client_log_s_once != -1) {
      dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_32);
    }
    CFSetRef v5 = _mrc_client_log_s_log;
    if (os_log_type_enabled((os_log_t)_mrc_client_log_s_log, OS_LOG_TYPE_FAULT))
    {
      int v6 = 138412547;
      uint64_t v7 = a1;
      __int16 v8 = 2081;
      int v9 = v4;
      _os_log_fault_impl(&dword_23BEA5000, v5, OS_LOG_TYPE_FAULT, "Current DNS service registration didn't require error reporting, ignoring -- registration: %@, notification: %{private}s", (uint8_t *)&v6, 0x16u);
      if (!v4) {
        return;
      }
    }
    else if (!v4)
    {
      return;
    }
    free(v4);
  }
}

void _mrc_dns_service_registration_generate_event_with_error(uint64_t a1, int a2, int a3)
{
  CFSetRef v5 = *(NSObject **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 0x40000000;
    v9[2] = ___mrc_dns_service_registration_generate_event_with_error_block_invoke;
    v9[3] = &unk_264E1AA10;
    v9[4] = v6;
    int v10 = a2;
    int v11 = a3;
    dispatch_async(v5, v9);
  }
  if (a2 == -1)
  {
    __int16 v8 = *(const void **)(a1 + 56);
    if (v8)
    {
      _Block_release(v8);
      *(void *)(a1 + 56) = 0;
    }
  }
}

uint64_t ___mrc_dns_service_registration_generate_event_with_error_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

void _mrc_dns_service_registration_handle_invalidation(uint64_t a1, int a2)
{
}

void _mrc_dns_service_registration_handle_interruption(uint64_t a1)
{
}

void _mrc_dns_service_registration_handle_start(uint64_t a1)
{
}

xpc_object_t _mrc_dns_service_registration_create_stop_message(uint64_t a1, uint64_t a2)
{
  return _mrc_xpc_create_command_message(a2, "dns_service_registration.stop", 0);
}

xpc_object_t _mrc_dns_service_registration_create_start_message(uint64_t a1, uint64_t a2)
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_value(empty, "definition", *(xpc_object_t *)(a1 + 48));
  xpc_dictionary_set_uint64(empty, "definition_type", *(unsigned __int8 *)(a1 + 64));
  xpc_dictionary_set_BOOL(empty, "reports_connection_errors", *(unsigned char *)(a1 + 65));
  xpc_object_t command_message = _mrc_xpc_create_command_message(a2, "dns_service_registration.start", empty);
  if (empty) {
    xpc_release(empty);
  }
  return command_message;
}

void _mrc_dns_service_registration_finalize(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    xpc_release(v2);
    *(void *)(a1 + 48) = 0;
  }
}

void *_mrc_dns_service_registration_copy_description(void *a1, int a2)
{
  CFArrayRef v4 = (void *)mdns_string_builder_create();
  if (!v4) {
    return 0;
  }
  CFSetRef v5 = v4;
  if (a2 && mdns_string_builder_append_formatted(v4, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1)) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = mdns_string_builder_copy_string((uint64_t)v5);
  }
  os_release(v5);
  return v6;
}

uint64_t mrc_dns_service_registration_create_push(uint64_t a1)
{
  uint64_t v2 = _mrc_dns_service_registration_new();
  if (v2)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    CFArrayRef v4 = empty;
    uint64_t v5 = *(void *)(a1 + 24);
    if (v5) {
      xpc_dictionary_set_string(empty, "srv_name", *(const char **)(v5 + 40));
    }
    CFArrayRef v6 = *(const __CFArray **)(a1 + 40);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 0x40000000;
    v19[2] = __mdns_dns_push_service_definition_create_xpc_dictionary_block_invoke;
    v19[3] = &__block_descriptor_tmp;
    v19[4] = v4;
    if (mdns_cfarray_enumerate(v6, (uint64_t)v19))
    {
      CFSetRef v7 = *(const __CFSet **)(a1 + 48);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 0x40000000;
      v18[2] = __mdns_dns_push_service_definition_create_xpc_dictionary_block_invoke_2;
      v18[3] = &__block_descriptor_tmp_11;
      v18[4] = v4;
      mdns_cfset_enumerate(v7, (uint64_t)v18);
      CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 56));
      if (Count >= 1)
      {
        CFIndex v9 = Count;
        for (CFIndex i = 0; i != v9; ++i)
        {
          CFDataRef ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), i);
          int64_t Length = CFDataGetLength(ValueAtIndex);
          BytePtr = CFDataGetBytePtr(ValueAtIndex);
          if (BytePtr) {
            BOOL v14 = Length < 1;
          }
          else {
            BOOL v14 = 1;
          }
          if (!v14)
          {
            uint64_t v15 = BytePtr;
            xpc_object_t array_set_if_absent = _mdns_xpc_dictionary_get_array_set_if_absent(v4, "certificates");
            xpc_array_set_data(array_set_if_absent, 0xFFFFFFFFFFFFFFFFLL, v15, Length);
          }
        }
      }
      xpc_dictionary_set_uint64(v4, "ifindex", *(unsigned int *)(a1 + 72));
      xpc_dictionary_set_uint64(v4, "interface_scope", *(unsigned __int8 *)(a1 + 78));
      xpc_dictionary_set_uint64(v4, "port", *(unsigned __int16 *)(a1 + 76));
      xpc_dictionary_set_BOOL(v4, "local_purview", *(unsigned char *)(a1 + 79));
      xpc_dictionary_set_BOOL(v4, "mdns_alternative", *(unsigned char *)(a1 + 80));
      *(void *)(v2 + 48) = v4;
      if (v4)
      {
        *(unsigned char *)(v2 + 64) = 2;
        return v2;
      }
    }
    else
    {
      if (v4) {
        xpc_release(v4);
      }
      *(void *)(v2 + 48) = 0;
    }
    os_release((void *)v2);
    return 0;
  }
  return v2;
}

uint64_t mrc_dns_service_registration_set_reports_connection_errors(uint64_t result, char a2)
{
  if (!*(unsigned char *)(result + 41)) {
    *(unsigned char *)(result + 65) = a2;
  }
  return result;
}

void mrc_dns_service_registration_set_event_handler(uint64_t a1, void *aBlock)
{
  if (!*(unsigned char *)(a1 + 41))
  {
    if (aBlock) {
      uint64_t v3 = _Block_copy(aBlock);
    }
    else {
      uint64_t v3 = 0;
    }
    CFArrayRef v4 = *(const void **)(a1 + 56);
    if (v4) {
      _Block_release(v4);
    }
    *(void *)(a1 + 56) = v3;
  }
}

void mrc_dns_service_registration_invalidate(void *a1)
{
}

void *mrc_discovery_proxy_create(uint64_t a1)
{
  uint64_t v2 = _os_object_alloc();
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    CFArrayRef v4 = &_mrc_discovery_proxy_kind;
    *(void *)(v2 + 16) = &_mrc_discovery_proxy_kind;
    do
    {
      uint64_t v5 = (void (*)(void *))v4[2];
      if (v5) {
        v5(v3);
      }
      CFArrayRef v4 = (_UNKNOWN **)*v4;
    }
    while (v4);
    uint64_t v6 = _mrc_discovery_proxy_parameters_create_or_copy(a1);
    v3[6] = v6;
    if (!v6)
    {
      os_release(v3);
      return 0;
    }
  }
  return v3;
}

uint64_t _mrc_discovery_proxy_parameters_create_or_copy(uint64_t a1)
{
  uint64_t v2 = _os_object_alloc();
  uint64_t v3 = v2;
  if (v2)
  {
    CFArrayRef v4 = &_mrc_discovery_proxy_parameters_kind;
    *(void *)(v2 + 16) = &_mrc_discovery_proxy_parameters_kind;
    do
    {
      uint64_t v5 = (void (*)(uint64_t))v4[2];
      if (v5) {
        v5(v3);
      }
      CFArrayRef v4 = (_UNKNOWN **)*v4;
    }
    while (v4);
    if (a1)
    {
      *(_DWORD *)(v3 + 48) = *(_DWORD *)(a1 + 48);
      CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, *(CFArrayRef *)(a1 + 24));
      *(void *)(v3 + 24) = MutableCopy;
      if (!MutableCopy) {
        goto LABEL_14;
      }
      CFMutableSetRef v8 = CFSetCreateMutableCopy(v6, 0, *(CFSetRef *)(a1 + 32));
      *(void *)(v3 + 32) = v8;
      if (!v8) {
        goto LABEL_14;
      }
      xpc_object_t empty = xpc_copy(*(xpc_object_t *)(a1 + 40));
    }
    else
    {
      CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &mdns_cfarray_callbacks);
      *(void *)(v3 + 24) = Mutable;
      if (!Mutable) {
        goto LABEL_14;
      }
      CFMutableSetRef v12 = CFSetCreateMutable(v10, 0, &mdns_domain_name_cf_set_callbacks);
      *(void *)(v3 + 32) = v12;
      if (!v12) {
        goto LABEL_14;
      }
      xpc_object_t empty = xpc_array_create_empty();
    }
    *(void *)(v3 + 40) = empty;
    if (!empty)
    {
LABEL_14:
      os_release((void *)v3);
      return 0;
    }
  }
  return v3;
}

void _mrc_discovery_proxy_handle_invalidation(uint64_t a1, int a2)
{
}

void _mrc_discovery_proxy_generate_event_with_error(uint64_t a1, int a2, int a3)
{
  uint64_t v5 = *(NSObject **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 0x40000000;
    v9[2] = ___mrc_discovery_proxy_generate_event_with_error_block_invoke;
    v9[3] = &unk_264E1AA78;
    v9[4] = v6;
    int v10 = a2;
    int v11 = a3;
    dispatch_async(v5, v9);
  }
  if (a2 == -1)
  {
    CFMutableSetRef v8 = *(const void **)(a1 + 56);
    if (v8)
    {
      _Block_release(v8);
      *(void *)(a1 + 56) = 0;
    }
  }
}

uint64_t ___mrc_discovery_proxy_generate_event_with_error_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

void _mrc_discovery_proxy_handle_interruption(uint64_t a1)
{
}

void _mrc_discovery_proxy_handle_start(uint64_t a1)
{
}

xpc_object_t _mrc_discovery_proxy_create_stop_message(uint64_t a1, uint64_t a2)
{
  return _mrc_xpc_create_command_message(a2, "discovery_proxy.stop", 0);
}

xpc_object_t _mrc_discovery_proxy_create_start_message(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (!empty) {
    return 0;
  }
  uint64_t v5 = empty;
  xpc_dictionary_set_uint64(empty, "interface", *(unsigned int *)(v3 + 48));
  CFArrayRef v6 = *(const __CFArray **)(v3 + 24);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 0x40000000;
  v20[2] = ___mrc_discovery_proxy_parameters_create_xpc_dictionary_block_invoke;
  v20[3] = &__block_descriptor_tmp_47;
  v20[4] = v5;
  if (!mdns_cfarray_enumerate(v6, (uint64_t)v20))
  {
    xpc_release(v5);
    return 0;
  }
  CFSetRef v7 = *(const __CFSet **)(v3 + 32);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 0x40000000;
  v19[2] = ___mrc_discovery_proxy_parameters_create_xpc_dictionary_block_invoke_2;
  v19[3] = &__block_descriptor_tmp_49;
  v19[4] = v5;
  mdns_cfset_enumerate(v7, (uint64_t)v19);
  size_t count = xpc_array_get_count(*(xpc_object_t *)(v3 + 40));
  if (count)
  {
    size_t v9 = count;
    for (size_t i = 0; i != v9; ++i)
    {
      size_t length = 0;
      data = xpc_array_get_data(*(xpc_object_t *)(v3 + 40), i, &length);
      size_t v12 = length;
      if (data) {
        BOOL v13 = length == 0;
      }
      else {
        BOOL v13 = 1;
      }
      if (!v13)
      {
        BOOL v14 = data;
        xpc_object_t optional_array = mdns_xpc_dictionary_get_optional_array(v5, "server_certificates", 0);
        if (!optional_array)
        {
          xpc_object_t optional_array = xpc_array_create_empty();
          xpc_dictionary_set_value(v5, "server_certificates", optional_array);
          if (optional_array) {
            xpc_release(optional_array);
          }
        }
        xpc_array_set_data(optional_array, 0xFFFFFFFFFFFFFFFFLL, v14, v12);
      }
    }
  }
  xpc_object_t command_message = _mrc_xpc_create_command_message(a2, "discovery_proxy.start", v5);
  xpc_release(v5);
  return command_message;
}

uint64_t ___mrc_discovery_proxy_parameters_create_xpc_dictionary_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a2 + 16);
  do
  {
    uint64_t v3 = (void *)*v3;
    if (!v3) {
      return 0;
    }
    CFArrayRef v4 = (uint64_t (*)(uint64_t, void, void))v3[3];
  }
  while (!v4);
  uint64_t result = v4(a2, 0, 0);
  if (result)
  {
    CFArrayRef v6 = (char *)result;
    CFSetRef v7 = *(void **)(a1 + 32);
    xpc_object_t optional_array = mdns_xpc_dictionary_get_optional_array(v7, "addresses", 0);
    if (!optional_array)
    {
      xpc_object_t optional_array = xpc_array_create_empty();
      xpc_dictionary_set_value(v7, "addresses", optional_array);
      if (optional_array) {
        xpc_release(optional_array);
      }
    }
    xpc_array_set_string(optional_array, 0xFFFFFFFFFFFFFFFFLL, v6);
    free(v6);
    return 1;
  }
  return result;
}

uint64_t ___mrc_discovery_proxy_parameters_create_xpc_dictionary_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(const char **)(a2 + 40);
  uint64_t v3 = *(void **)(a1 + 32);
  xpc_object_t optional_array = mdns_xpc_dictionary_get_optional_array(v3, "match_domains", 0);
  if (!optional_array)
  {
    xpc_object_t optional_array = xpc_array_create_empty();
    xpc_dictionary_set_value(v3, "match_domains", optional_array);
    if (optional_array) {
      xpc_release(optional_array);
    }
  }
  xpc_array_set_string(optional_array, 0xFFFFFFFFFFFFFFFFLL, v2);
  return 1;
}

void _mrc_discovery_proxy_finalize(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    os_release(v2);
    *(void *)(a1 + 48) = 0;
  }
}

void *_mrc_discovery_proxy_copy_description(void *a1, int a2, char a3)
{
  CFArrayRef v6 = (void *)mdns_string_builder_create();
  if (!v6) {
    return 0;
  }
  CFSetRef v7 = v6;
  if (a2 && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1)
    || (CFMutableSetRef v8 = (const char *)_mrc_discovery_proxy_parameters_copy_description(a1[6], 0, a3)) == 0)
  {
    int v10 = 0;
  }
  else
  {
    size_t v9 = (char *)v8;
    if (mdns_string_builder_append_formatted(v7, "%s", v8)) {
      int v10 = 0;
    }
    else {
      int v10 = mdns_string_builder_copy_string((uint64_t)v7);
    }
    free(v9);
  }
  os_release(v7);
  return v10;
}

void mrc_discovery_proxy_set_event_handler(uint64_t a1, void *aBlock)
{
  if (!*(unsigned char *)(a1 + 41))
  {
    if (aBlock) {
      uint64_t v3 = _Block_copy(aBlock);
    }
    else {
      uint64_t v3 = 0;
    }
    CFArrayRef v4 = *(const void **)(a1 + 56);
    if (v4) {
      _Block_release(v4);
    }
    *(void *)(a1 + 56) = v3;
  }
}

void mrc_discovery_proxy_invalidate(void *a1)
{
}

uint64_t mrc_discovery_proxy_parameters_create()
{
  return _mrc_discovery_proxy_parameters_create_or_copy(0);
}

uint64_t mrc_discovery_proxy_parameters_set_interface(uint64_t result, int a2)
{
  *(_DWORD *)(result + 48) = a2;
  return result;
}

uint64_t mrc_discovery_proxy_parameters_add_server_ipv4_address(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6 = _mdns_address_new();
  if (!v6) {
    return 4294960567;
  }
  CFSetRef v7 = (void *)v6;
  *(_WORD *)(v6 + 24) = 528;
  *(_WORD *)(v6 + 26) = __rev16(a3);
  *(_DWORD *)(v6 + 28) = bswap32(a2);
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 24), (const void *)v6);
  os_release(v7);
  return 0;
}

uint64_t mrc_discovery_proxy_parameters_add_server_ipv6_address(uint64_t a1, _OWORD *a2, unsigned int a3, int a4)
{
  uint64_t v8 = _mdns_address_new();
  if (!v8) {
    return 4294960567;
  }
  size_t v9 = (void *)v8;
  *(_WORD *)(v8 + 24) = 7708;
  *(_WORD *)(v8 + 26) = __rev16(a3);
  *(_OWORD *)(v8 + 32) = *a2;
  *(_DWORD *)(v8 + 48) = a4;
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 24), (const void *)v8);
  os_release(v9);
  return 0;
}

uint64_t mrc_discovery_proxy_parameters_add_match_domain(uint64_t a1, char *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = DomainNameFromString(v9, a2);
  if (v3) {
    return v3;
  }
  unsigned int v8 = 0;
  if (!v9[0])
  {
    if (_mdns_domain_name_get_root_s_once != -1) {
      dispatch_once(&_mdns_domain_name_get_root_s_once, &__block_literal_global_228);
    }
    uint64_t v5 = (void *)_mdns_domain_name_get_root_s_root;
    if (_mdns_domain_name_get_root_s_root)
    {
      CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), (const void *)_mdns_domain_name_get_root_s_root);
LABEL_10:
      os_release(v5);
      return 0;
    }
  }
  CFArrayRef v4 = _mdns_domain_name_create(v9, (int *)&v8);
  uint64_t v5 = v4;
  uint64_t v6 = v8;
  if (!v8)
  {
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v4);
    if (!v5) {
      return 0;
    }
    goto LABEL_10;
  }
  if (v4) {
    os_release(v4);
  }
  return v6;
}

void mrc_discovery_proxy_parameters_add_server_certificate(uint64_t a1, void *bytes, size_t length)
{
}

uint64_t mrc_cached_local_records_inquiry_create()
{
  uint64_t v0 = _os_object_alloc();
  uint64_t v1 = v0;
  if (v0)
  {
    uint64_t v2 = &_mrc_cached_local_records_inquiry_kind;
    *(void *)(v0 + 16) = &_mrc_cached_local_records_inquiry_kind;
    do
    {
      uint64_t v3 = (void (*)(uint64_t))v2[2];
      if (v3) {
        v3(v1);
      }
      uint64_t v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
  }
  return v1;
}

void _mrc_cached_local_records_inquiry_handle_invalidation(uint64_t a1, int a2)
{
}

void _mrc_cached_local_records_inquiry_invoke_user_handler(uint64_t a1, xpc_object_t object, int a3)
{
  CFArrayRef v4 = *(NSObject **)(a1 + 32);
  if (v4 && *(void *)(a1 + 48))
  {
    xpc_object_t v6 = object;
    if (object)
    {
      xpc_object_t v7 = xpc_copy(object);
      if (v7)
      {
        xpc_object_t v8 = v7;
        xpc_array_apply(v7, &__block_literal_global_64);
        xpc_object_t v6 = v8;
      }
      else
      {
        xpc_retain(v6);
      }
    }
    uint64_t v9 = *(void *)(a1 + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___mrc_cached_local_records_inquiry_invoke_user_handler_block_invoke;
    block[3] = &unk_264E1AAF0;
    block[4] = v9;
    void block[5] = v6;
    int v12 = a3;
    dispatch_async(v4, block);
  }
  uint64_t v10 = *(const void **)(a1 + 48);
  if (v10)
  {
    _Block_release(v10);
    *(void *)(a1 + 48) = 0;
  }
}

void ___mrc_cached_local_records_inquiry_invoke_user_handler_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    xpc_release(v2);
  }
}

uint64_t ___mrc_cached_local_records_inquiry_process_create_enhanced_record_info_copy_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (MEMORY[0x23ECD6650](a3) != MEMORY[0x263EF8708]) {
    return 1;
  }
  string = (char *)xpc_dictionary_get_string(a3, "name");
  if (!string) {
    return 1;
  }
  if (DomainNameFromString(&v21, string)) {
    return 1;
  }
  uint64_t v6 = v21;
  if (!v21) {
    return 1;
  }
  uint64_t v7 = mdns_string_builder_create();
  if (!v7)
  {
    int v17 = -6729;
    goto LABEL_54;
  }
  xpc_object_t v8 = (void *)v7;
  uint64_t v9 = v22;
  uint64_t v10 = &v22[v6];
  while (v9 < v10)
  {
    unint64_t v11 = v10 - v9;
    int v12 = *(unsigned __int8 *)v9;
    if (*v9 < 0)
    {
      if (v10 != v9 && v11 >= 2)
      {
        if ((v12 + 62) <= 0x1Du && v9[1] < -64)
        {
          unint64_t v14 = 2;
          goto LABEL_34;
        }
        if (v11 >= 3 && v9[2] <= -65)
        {
          if (v12 == 224)
          {
            if ((v9[1] & 0xE0) == 0xA0) {
              goto LABEL_33;
            }
          }
          else if ((v12 + 31) < 0xCu || (v12 & 0xFE) == 0xEE)
          {
            if (v9[1] < -64) {
              goto LABEL_33;
            }
          }
          else if (v12 == 237 && v9[1] < -96)
          {
LABEL_33:
            unint64_t v14 = 3;
            goto LABEL_34;
          }
          if (v11 >= 4 && v9[3] <= -65)
          {
            if (v12 == 240)
            {
              if ((v9[1] + 112) < 0x30u) {
                goto LABEL_41;
              }
            }
            else if ((v12 + 15) > 2u)
            {
              if (v12 == 244 && v9[1] <= -113)
              {
LABEL_41:
                unint64_t v14 = 4;
LABEL_34:
                int appended = mdns_string_builder_append_formatted(v8, "%.*s", v14, v9);
                if (appended) {
                  goto LABEL_53;
                }
                goto LABEL_45;
              }
            }
            else if (v9[1] < -64)
            {
              goto LABEL_41;
            }
          }
        }
      }
    }
    else if ((v12 - 32) <= 0x5E)
    {
      if (v12 == 92)
      {
        int appended = mdns_string_builder_append_formatted(v8, "\\"");
        if (appended)
        {
LABEL_53:
          int v17 = appended;
          os_release(v8);
LABEL_54:
          if (_mrc_client_log_s_once != -1) {
            dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_32);
          }
          uint64_t v18 = _mrc_client_log_s_log;
          if (os_log_type_enabled((os_log_t)_mrc_client_log_s_log, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v20 = v17;
            _os_log_fault_impl(&dword_23BEA5000, v18, OS_LOG_TYPE_FAULT, "Failed to convert first label to UTF-8 string: %{mdns:err}ld", buf, 0xCu);
          }
          return 1;
        }
      }
      int appended = mdns_string_builder_append_formatted(v8, "%c");
      goto LABEL_43;
    }
    int appended = mdns_string_builder_append_formatted(v8, "\\x%02X");
LABEL_43:
    if (appended) {
      goto LABEL_53;
    }
    unint64_t v14 = 1;
LABEL_45:
    if (v14 >= v11) {
      unint64_t v15 = v10 - v9;
    }
    else {
      unint64_t v15 = v14;
    }
    v9 += v15;
  }
  uint64_t v16 = (char *)mdns_string_builder_copy_string((uint64_t)v8);
  os_release(v8);
  if (!v16)
  {
    int v17 = -6728;
    goto LABEL_54;
  }
  xpc_dictionary_set_string(a3, "first_label", v16);
  free(v16);
  return 1;
}

void _mrc_cached_local_records_inquiry_handle_start(uint64_t a1, void *a2)
{
  char v7 = 0;
  if (a2 && (xpc_object_t optional_array = mdns_xpc_dictionary_get_optional_array(a2, "record_info", &v7), v7))
  {
    CFArrayRef v4 = optional_array;
    uint64_t v5 = a1;
    int v6 = 0;
  }
  else
  {
    uint64_t v5 = a1;
    CFArrayRef v4 = 0;
    int v6 = -6712;
  }
  _mrc_cached_local_records_inquiry_invoke_user_handler(v5, v4, v6);
}

xpc_object_t _mrc_cached_local_records_inquiry_create_start_message(uint64_t a1, uint64_t a2)
{
  return _mrc_xpc_create_command_message(a2, "record_cache.local_record_inquiry", 0);
}

void *_mrc_cached_local_records_inquiry_copy_description(void *a1, int a2)
{
  CFArrayRef v4 = (void *)mdns_string_builder_create();
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  if (a2 && mdns_string_builder_append_formatted(v4, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1)) {
    int v6 = 0;
  }
  else {
    int v6 = mdns_string_builder_copy_string((uint64_t)v5);
  }
  os_release(v5);
  return v6;
}

void mrc_cached_local_records_inquiry_set_result_handler(uint64_t a1, void *aBlock)
{
  if (!*(unsigned char *)(a1 + 41))
  {
    if (aBlock) {
      uint64_t v3 = _Block_copy(aBlock);
    }
    else {
      uint64_t v3 = 0;
    }
    CFArrayRef v4 = *(const void **)(a1 + 48);
    if (v4) {
      _Block_release(v4);
    }
    *(void *)(a1 + 48) = v3;
  }
}

void mrc_cached_local_records_inquiry_invalidate(void *a1)
{
}

uint64_t mrc_record_cache_flush_create()
{
  uint64_t v0 = _os_object_alloc();
  uint64_t v1 = v0;
  if (v0)
  {
    uint64_t v2 = &_mrc_record_cache_flush_kind;
    *(void *)(v0 + 16) = &_mrc_record_cache_flush_kind;
    do
    {
      uint64_t v3 = (void (*)(uint64_t))v2[2];
      if (v3) {
        v3(v1);
      }
      uint64_t v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
  }
  return v1;
}

void _mrc_record_cache_flush_handle_invalidation(uint64_t a1, int a2)
{
}

void _mrc_record_cache_flush_invoke_user_handler(uint64_t a1, int a2, int a3)
{
  CFArrayRef v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 0x40000000;
      v7[2] = ___mrc_record_cache_flush_invoke_user_handler_block_invoke;
      v7[3] = &unk_264E1AB38;
      v7[4] = v5;
      int v8 = a2;
      int v9 = a3;
      dispatch_async(v4, v7);
    }
  }
  int v6 = *(const void **)(a1 + 56);
  if (v6)
  {
    _Block_release(v6);
    *(void *)(a1 + 56) = 0;
  }
}

uint64_t ___mrc_record_cache_flush_invoke_user_handler_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

void _mrc_record_cache_flush_handle_start(uint64_t a1)
{
}

xpc_object_t _mrc_record_cache_flush_create_start_message(uint64_t a1, uint64_t a2)
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  uint64_t v5 = empty;
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    xpc_dictionary_set_string(empty, "record_name", *(const char **)(v6 + 40));
  }
  if (*(unsigned char *)(a1 + 66)) {
    xpc_dictionary_set_uint64(v5, "key_tag", *(unsigned __int16 *)(a1 + 64));
  }
  xpc_object_t command_message = _mrc_xpc_create_command_message(a2, "record_cache.flush", v5);
  if (v5) {
    xpc_release(v5);
  }
  return command_message;
}

void _mrc_record_cache_flush_finalize(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    os_release(v2);
    *(void *)(a1 + 48) = 0;
  }
}

void *_mrc_record_cache_flush_copy_description(uint64_t a1, int a2, char a3)
{
  uint64_t v6 = (void *)mdns_string_builder_create();
  if (!v6) {
    return 0;
  }
  char v7 = v6;
  if (a2
    && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(void *)(a1 + 16) + 8), (const void *)a1)|| mdns_string_builder_append_formatted(v7, "record name: "))
  {
    goto LABEL_5;
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10)
  {
    if (mdns_string_builder_append_description(v7, v10, a3)) {
      goto LABEL_5;
    }
  }
  else if (mdns_string_builder_append_formatted(v7, "«NO NAME»"))
  {
    goto LABEL_5;
  }
  if (!*(unsigned char *)(a1 + 66)
    || !mdns_string_builder_append_formatted(v7, ", key tag: %u", *(unsigned __int16 *)(a1 + 64)))
  {
    int v8 = mdns_string_builder_copy_string((uint64_t)v7);
    goto LABEL_6;
  }
LABEL_5:
  int v8 = 0;
LABEL_6:
  os_release(v7);
  return v8;
}

void mrc_record_cache_flush_set_record_name(uint64_t a1, void *object)
{
  if (!*(unsigned char *)(a1 + 41))
  {
    if (object) {
      os_retain(object);
    }
    CFArrayRef v4 = *(void **)(a1 + 48);
    if (v4) {
      os_release(v4);
    }
    *(void *)(a1 + 48) = object;
  }
}

uint64_t mrc_record_cache_flush_set_key_tag(uint64_t result, __int16 a2)
{
  if (!*(unsigned char *)(result + 41))
  {
    *(_WORD *)(result + 64) = a2;
    *(unsigned char *)(result + 66) = 1;
  }
  return result;
}

void mrc_record_cache_flush_set_result_handler(uint64_t a1, void *aBlock)
{
  if (!*(unsigned char *)(a1 + 41))
  {
    if (aBlock) {
      uint64_t v3 = _Block_copy(aBlock);
    }
    else {
      uint64_t v3 = 0;
    }
    CFArrayRef v4 = *(const void **)(a1 + 56);
    if (v4) {
      _Block_release(v4);
    }
    *(void *)(a1 + 56) = v3;
  }
}

void mrc_record_cache_flush_invalidate(void *a1)
{
}

xpc_object_t _mrc_xpc_create_command_message(uint64_t a1, const char *a2, void *a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v6, "id", a1);
  xpc_dictionary_set_string(v6, "command", a2);
  if (a3) {
    xpc_dictionary_set_value(v6, "params", a3);
  }
  return v6;
}

void _mdns_string_builder_finalize(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 24) = 0;
  }
}

void *_mdns_string_builder_copy_description(void *a1, int a2)
{
  CFArrayRef v4 = (void *)mdns_string_builder_create();
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  if (a2 && mdns_string_builder_append_formatted(v4, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1)
    || mdns_string_builder_append_formatted(v5, "capacity: %zu, string length: %zu", a1[4], a1[5]))
  {
    goto LABEL_4;
  }
  char v7 = (const char *)v5[3];
  if (v7)
  {
    uint64_t v8 = v5[5];
    size_t v9 = v8 + 1;
    if (v8 == -1)
    {
LABEL_4:
      xpc_object_t v6 = 0;
LABEL_12:
      os_release(v5);
      return v6;
    }
  }
  else
  {
    char v7 = "";
    size_t v9 = 1;
  }
  uint64_t result = malloc_type_malloc(v9, 0xA172743EuLL);
  if (result)
  {
    xpc_object_t v6 = result;
    memcpy(result, v7, v9);
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t mdns_string_builder_create()
{
  uint64_t v0 = _os_object_alloc();
  uint64_t v1 = v0;
  if (v0)
  {
    uint64_t v2 = &_mdns_string_builder_kind;
    *(void *)(v0 + 16) = &_mdns_string_builder_kind;
    do
    {
      uint64_t v3 = (void (*)(uint64_t))v2[2];
      if (v3) {
        v3(v1);
      }
      uint64_t v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
    *(void *)(v1 + 32) = 0;
  }
  return v1;
}

uint64_t mdns_string_builder_append_formatted(void *a1, char *__format, ...)
{
  va_start(va, __format);
  if (a1[3] || (uint64_t result = _mdns_string_builder_grow_buffer(a1, a1[4]), !result))
  {
    for (char i = 1; ; char i = 0)
    {
      size_t v6 = a1[4] - a1[5];
      unsigned int v7 = vsnprintf((char *)(a1[3] + a1[5]), v6, __format, va);
      if ((v7 & 0x80000000) != 0)
      {
        *(unsigned char *)(a1[3] + a1[5]) = 0;
        return 4294960596;
      }
      uint64_t v8 = v7;
      if (v6 > v7)
      {
        uint64_t result = 0;
        a1[5] += v8;
        return result;
      }
      if ((i & 1) == 0) {
        break;
      }
      uint64_t v9 = a1[5];
      uint64_t v10 = v7 + 1;
      BOOL v11 = __CFADD__(v9, v10);
      unint64_t v12 = v9 + v10;
      if (v11) {
        return 4294960567;
      }
      uint64_t v13 = a1[4];
      if (v13 < 0) {
        return 4294960567;
      }
      if (v12 <= 2 * v13) {
        unint64_t v14 = 2 * v13;
      }
      else {
        unint64_t v14 = v12;
      }
      uint64_t result = _mdns_string_builder_grow_buffer(a1, v14);
      if (result) {
        return result;
      }
    }
    return 4294960534;
  }
  return result;
}

uint64_t _mdns_string_builder_grow_buffer(void *a1, unint64_t a2)
{
  if (a1[3] && a1[4] >= a2) {
    return 0;
  }
  if (a2 <= 0x40) {
    size_t v3 = 64;
  }
  else {
    size_t v3 = a2;
  }
  size_t v4 = malloc_good_size(v3);
  if (v4 < v3) {
    return 4294960534;
  }
  size_t v5 = v4;
  size_t v6 = malloc_type_calloc(v4, 1uLL, 0xF1748037uLL);
  if (!v6)
  {
    __break(1u);
    return 0;
  }
  unsigned int v7 = v6;
  uint64_t v8 = (const void *)a1[3];
  if (v8)
  {
    memcpy(v6, v8, a1[5] + 1);
    uint64_t v9 = (void *)a1[3];
    if (v9) {
      free(v9);
    }
  }
  uint64_t result = 0;
  a1[3] = v7;
  a1[4] = v5;
  return result;
}

uint64_t mdns_string_builder_append_description(void *a1, uint64_t a2, char a3)
{
  size_t v4 = (void *)(a2 + 16);
  while (1)
  {
    size_t v4 = (void *)*v4;
    if (!v4) {
      break;
    }
    size_t v5 = (uint64_t (*)(uint64_t, void, void))v4[3];
    if (v5)
    {
      size_t v6 = (const char *)v5(a2, 0, a3 & 1);
      if (v6)
      {
        unsigned int v7 = (char *)v6;
        uint64_t appended = mdns_string_builder_append_formatted(a1, "%s", v6);
        free(v7);
        return appended;
      }
      return 4294960567;
    }
  }
  return 4294960567;
}

uint64_t mdns_string_builder_append_description_with_prefix(void *a1, const char *a2, uint64_t a3, char a4)
{
  if (!a2 || (uint64_t result = mdns_string_builder_append_formatted(a1, "%s", a2), !result))
  {
    return mdns_string_builder_append_description(a1, a3, a4);
  }
  return result;
}

void *mdns_string_builder_copy_string(uint64_t a1)
{
  uint64_t v1 = *(const char **)(a1 + 24);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    size_t v3 = v2 + 1;
    if (v2 == -1) {
      return 0;
    }
  }
  else
  {
    uint64_t v1 = "";
    size_t v3 = 1;
  }
  uint64_t result = malloc_type_malloc(v3, 0xA172743EuLL);
  if (result)
  {
    size_t v4 = result;
    memcpy(result, v1, v3);
    return v4;
  }
  __break(1u);
  return result;
}

xpc_object_t _mdns_xpc_dictionary_get_object(void *a1, const char *a2, uint64_t a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  xpc_object_t v5 = value;
  if (value && MEMORY[0x23ECD6650](value) != a3) {
    return 0;
  }
  return v5;
}

int64_t mdns_xpc_dictionary_get_int32(void *a1, const char *a2, BOOL *a3)
{
  int64_t result = (int64_t)_mdns_xpc_dictionary_get_object(a1, a2, MEMORY[0x263EF8738]);
  if (!result)
  {
    BOOL v5 = 0;
    if (!a3) {
      return result;
    }
    goto LABEL_6;
  }
  int64_t result = xpc_int64_get_value((xpc_object_t)result);
  BOOL v5 = (int)result == result;
  if ((int)result == result) {
    int64_t result = result;
  }
  else {
    int64_t result = 0;
  }
  if (a3) {
LABEL_6:
  }
    *a3 = v5;
  return result;
}

uint64_t _mdns_xpc_object_get_uint64_limited(uint64_t result, uint64_t a2, BOOL *a3)
{
  if (!result)
  {
LABEL_9:
    BOOL v6 = 0;
    if (!a3) {
      return result;
    }
    goto LABEL_6;
  }
  BOOL v5 = (void *)result;
  if (MEMORY[0x23ECD6650]() != MEMORY[0x263EF87A0])
  {
    int64_t result = 0;
    goto LABEL_9;
  }
  int64_t result = xpc_uint64_get_value(v5);
  BOOL v6 = result <= a2;
  if (result > a2) {
    int64_t result = 0;
  }
  if (a3) {
LABEL_6:
  }
    *a3 = v6;
  return result;
}

xpc_object_t mdns_xpc_dictionary_get_optional_array(void *a1, const char *a2, char *a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  xpc_object_t v5 = value;
  if (value && MEMORY[0x23ECD6650](value) != MEMORY[0x263EF86D8])
  {
    xpc_object_t v5 = 0;
    char v6 = 0;
    if (!a3) {
      return v5;
    }
    goto LABEL_6;
  }
  char v6 = 1;
  if (a3) {
LABEL_6:
  }
    *a3 = v6;
  return v5;
}

xpc_object_t _mdns_xpc_dictionary_get_array_set_if_absent(void *a1, const char *a2)
{
  xpc_object_t optional_array = mdns_xpc_dictionary_get_optional_array(a1, a2, 0);
  if (!optional_array)
  {
    xpc_object_t optional_array = xpc_array_create_empty();
    xpc_dictionary_set_value(a1, a2, optional_array);
    if (optional_array) {
      xpc_release(optional_array);
    }
  }
  return optional_array;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
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

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

void CFRelease(CFTypeRef cf)
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
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

CFMutableSetRef CFSetCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFSetRef theSet)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F68](allocator, capacity, theSet);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x270EE4F70](theSet);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE50F0](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
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

uint64_t _os_object_alloc()
{
  return MEMORY[0x270ED80E0]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x270ED9E70](*(void *)&a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x270ED9EC0](*(void *)&a1, a2, a3, *(void *)&a4);
}

size_t malloc_good_size(size_t size)
{
  return MEMORY[0x270EDA358](size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_release(void *object)
{
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x270EDAA50](object);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDBD20]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  return (const void *)MEMORY[0x270EDBD48](xarray, index, length);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

void xpc_array_set_data(xpc_object_t xarray, size_t index, const void *bytes, size_t length)
{
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDBF20](object);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC078](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x270EDC218](xint);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}