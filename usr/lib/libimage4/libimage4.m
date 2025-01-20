uint64_t _boot_ephemeral_enforceable(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t name;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v4 = *(void *)(a2 + 16);
  result = odometer_policy_get_chip_property(a1, v4);
  if (!result)
  {
    v25 = *(void *)a2;
    name = chip_get_name(*(void *)(a2 + 16));
    v24 = 1;
    expert_log(v25, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v27, v28, v29, v30, v31, name);
    return v24;
  }
  if (*(void *)(v4 + 208))
  {
    if (manifest_get_restore_info(*(void *)(a2 + 8), v6, v7, v8, v9, v10, v11, v12))
    {
      v17 = *(void *)a2;
      v42 = chip_get_name(*(void *)(a2 + 16));
      v23 = "odometer[%s:%s]: boot object has restore info";
    }
    else if (*(_WORD *)(a2 + 960))
    {
      if (*(_WORD *)(a2 + 864))
      {
        v32 = odometer_enforce_property((uint64_t *)a2, a1, *(void *)(v4 + 208), (unsigned __int8 *)(a2 + 760), v13, v14, v15, v16);
        v17 = *(void *)a2;
        v33 = chip_get_name(*(void *)(a2 + 16));
        if (!v32)
        {
          expert_log(v17, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v18, v19, v20, v21, v22, v33);
          return 0;
        }
        v42 = v33;
        v23 = "odometer[%s:%s]: switch constraint not satisfied";
      }
      else
      {
        v17 = *(void *)a2;
        v42 = chip_get_name(*(void *)(a2 + 16));
        v23 = "odometer[%s:%s]: no manifest constraint for policy selection";
      }
    }
    else
    {
      v17 = *(void *)a2;
      v42 = chip_get_name(*(void *)(a2 + 16));
      v23 = "odometer[%s:%s]: manifest has no constraint for policy";
    }
    v24 = 1;
    expert_log(v17, 1uLL, (uint64_t)v23, v18, v19, v20, v21, v22, v42);
    return v24;
  }
  if (v4 < v4 + 264)
  {
    v34 = chip_get_name(v4);
    __panic_npx("panic: illegal chip configuration: %s", v35, v36, v37, v38, v39, v40, v41, v34);
  }
  __break(0x5519u);
  return result;
}

uint64_t _boot_ephemeral_enforce(uint64_t a1, uint64_t a2)
{
  v62[3] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)a2;
  uint64_t chip_property = odometer_policy_get_chip_property(a1, *(void *)(a2 + 16));
  if (!*(_WORD *)(a2 + 960)) {
    __panic_npx("panic: optional not set", v6, v7, v8, v9, v10, v11, v12, v59);
  }
  uint64_t v13 = chip_property;
  v14 = *(void **)(a2 + 16);
  uint64_t v15 = *(unsigned int *)(a2 + 872);
  memset(v62, 0, 24);
  memset(v61, 0, sizeof(v61));
  memset(v60, 0, sizeof(v60));
  uint64_t live_nonce = odometer_query_live_nonce(a2, a1, v15, v62, v9, v10, v11, v12);
  if (live_nonce)
  {
    uint64_t v17 = live_nonce;
    uint64_t v18 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    expert_log(v18, 0, (uint64_t)"odometer[%s:%s]: failed to query nonce: %d", v20, v21, v22, v23, v24, name);
  }
  else
  {
    uint64_t v32 = expert_entangle_nonce(v4, (uint64_t)v14, v15, (uint64_t)v62, (uint64_t)v61);
    if (v32)
    {
      uint64_t v17 = v32;
      uint64_t v33 = *(void *)a2;
      uint64_t v34 = chip_get_name(*(void *)(a2 + 16));
      expert_log(v33, 0, (uint64_t)"odometer[%s:%s]: failed to entangle nonce: %d", v35, v36, v37, v38, v39, v34);
    }
    else
    {
      odometer_compute_nonce_hash(v4, v14, (uint64_t)v61, (uint64_t)v60);
      if (!property_constrain_digest(v13, v4, a2 + 880, (unint64_t)v60, v40, v41, v42, v43))
      {
        uint64_t v52 = *(void *)a2;
        uint64_t v53 = chip_get_name(*(void *)(a2 + 16));
        expert_log(v52, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is current", v54, v55, v56, v57, v58, v53);
        return 0;
      }
      uint64_t v17 = *(unsigned int *)(a1 + 24);
      uint64_t v44 = *(void *)a2;
      uint64_t v45 = chip_get_name(*(void *)(a2 + 16));
      expert_log(v44, 0, (uint64_t)"odometer[%s:%s]: anti-replay violation: %d", v46, v47, v48, v49, v50, v45);
    }
  }
  if (v17 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v25, v26, v27, v28, v29, v30, v31, v17);
  }
  return v17;
}

void __panic_npx(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  uint64_t v11 = &a9;
  vsnprintf(__str, 0x800uLL, a1, &a9);
  _os_crash();
  __break(1u);
}

unint64_t darwin_read_iokit_node(io_registry_entry_t a1, const char *a2, void *a3, size_t *a4)
{
  unint64_t v7 = *a4;
  CFStringRef v8 = CFStringCreateWithCString(0, a2, 0x8000100u);
  if (!v8) {
    return 12;
  }
  CFStringRef v9 = v8;
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(a1, v8, 0, 0);
  if (!CFProperty)
  {
    uint64_t v14 = 2;
LABEL_10:
    CFRelease(v9);
    return v14;
  }
  CFDataRef v11 = CFProperty;
  CFTypeID v12 = CFGetTypeID(CFProperty);
  if (v12 != CFDataGetTypeID())
  {
    uint64_t v14 = 96;
    goto LABEL_9;
  }
  unint64_t Length = CFDataGetLength(v11);
  if (HIDWORD(Length))
  {
    uint64_t v14 = 34;
LABEL_9:
    CFRelease(v11);
    goto LABEL_10;
  }
  size_t v16 = Length;
  if (v7 < Length)
  {
    uint64_t v14 = 84;
    goto LABEL_9;
  }
  unint64_t result = (unint64_t)CFDataGetBytePtr(v11);
  if (result <= result + v7 && v16 <= *a4)
  {
    unint64_t result = (unint64_t)memcpy(a3, (const void *)result, v16);
    if (v16 <= *a4)
    {
      uint64_t v14 = 0;
      *a4 = v16;
      goto LABEL_9;
    }
  }
  __break(0x5519u);
  return result;
}

unint64_t darwin_read_iokit_BOOL(io_registry_entry_t a1, const char *a2, BOOL *a3)
{
  char v4 = (char)a2;
  int v15 = 0;
  size_t v14 = 4;
  unint64_t result = darwin_read_iokit_node(a1, a2, &v15, &v14);
  BOOL v13 = 0;
  if (result != 2)
  {
    if (result) {
      __panic_npx("panic: failed to read property: %s: %d", v6, v7, v8, v9, v10, v11, v12, v4);
    }
    BOOL v13 = v15 != 0;
  }
  *a3 = v13;
  return result;
}

unint64_t darwin_read_iokit_u32(io_registry_entry_t a1, const char *a2, _DWORD *a3)
{
  char v4 = (char)a2;
  int v15 = 0;
  size_t v14 = 4;
  unint64_t result = darwin_read_iokit_node(a1, a2, &v15, &v14);
  int v13 = 0;
  if (result != 2)
  {
    if (result) {
      __panic_npx("panic: failed to read property: %s: %d", v6, v7, v8, v9, v10, v11, v12, v4);
    }
    int v13 = v15;
  }
  *a3 = v13;
  return result;
}

unint64_t darwin_read_iokit_u64(io_registry_entry_t a1, const char *a2, void *a3)
{
  char v4 = (char)a2;
  size_t v14 = 8;
  uint64_t v15 = 0;
  unint64_t result = darwin_read_iokit_node(a1, a2, &v15, &v14);
  uint64_t v13 = 0;
  if (result != 2)
  {
    if (result) {
      __panic_npx("panic: failed to read property: %s: %d", v6, v7, v8, v9, v10, v11, v12, v4);
    }
    uint64_t v13 = v15;
  }
  *a3 = v13;
  return result;
}

size_t darwin_read_iokit_cstr(io_registry_entry_t a1, const char *a2, char *a3)
{
  char v4 = (char)a2;
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  *(_OWORD *)__source = 0u;
  long long v15 = 0u;
  size_t v13 = 64;
  size_t result = darwin_read_iokit_node(a1, a2, __source, &v13);
  if (result == 2)
  {
    *a3 = 0;
  }
  else
  {
    if (result) {
      __panic_npx("panic: failed to read property: %s: %d", v6, v7, v8, v9, v10, v11, v12, v4);
    }
    return strlcpy(a3, __source, 0x40uLL);
  }
  return result;
}

uint64_t _null_enforceable(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t name = chip_get_name(a2[2]);
  expert_log(v2, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v4, v5, v6, v7, v8, name);
  return 0;
}

uint64_t _null_enforce(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

void _prepare(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(*(void *)a3 + 24);
  uint64_t v5 = *(void *)(v4 + 8);
  memset(v14, 0, sizeof(v14));
  size_t __n = 0;
  memset(v13, 0, sizeof(v13));
  uint64_t nonce_digest = image4_environment_callout_query_nonce_digest(v4, (uint64_t)v14, (uint64_t)&__n);
  if (nonce_digest)
  {
    if (nonce_digest != 45) {
      expert_log(v5, 0, (uint64_t)"failed to get nonce digest from callback: %d", v7, v8, v9, v10, v11, nonce_digest);
    }
  }
  else if (__n > 0x40)
  {
    __break(0x5519u);
  }
  else
  {
    digest_init((uint64_t)v13, v14, __n, v7, v8, v9, v10, v11);
    odometer_prepare_nonce_hash(a2, (uint64_t)v13);
  }
}

uint64_t _get_constraint_mask()
{
  return 0;
}

uint64_t _extract_payload()
{
  return 0;
}

uint64_t _chain_future_enforceable(uint64_t a1, uint64_t a2)
{
  if (odometer_policy_get_chip_property(a1, *(void *)(a2 + 16)))
  {
    int v3 = *(unsigned __int16 *)(a2 + 528);
    uint64_t v4 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    if (v3)
    {
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v6, v7, v8, v9, v10, name);
      return 0;
    }
    else
    {
      uint64_t v11 = 1;
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: no caller-supplied boot manifest hash", v6, v7, v8, v9, v10, name);
    }
  }
  else
  {
    uint64_t v12 = *(void *)a2;
    uint64_t v13 = chip_get_name(*(void *)(a2 + 16));
    uint64_t v11 = 1;
    expert_log(v12, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v14, v15, v16, v17, v18, v13);
  }
  return v11;
}

uint64_t _chain_future_enforce(uint64_t a1, uint64_t a2)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  unint64_t v6 = *(void *)(a2 + 16);
  uint64_t chip_property = odometer_policy_get_chip_property(a1, v6);
  memset(v44, 0, sizeof(v44));
  if (!*(_WORD *)(a2 + 528)) {
    __panic_npx("panic: optional not set", v8, v9, v10, v11, v12, v13, v14, v43);
  }
  uint64_t v15 = chip_property;
  manifest_measure(v5, v6, (uint64_t)v44);
  if (property_constrain_digest(v15, v4, (unint64_t)v44, a2 + 448, v16, v17, v18, v19))
  {
    uint64_t v20 = *(unsigned int *)(a1 + 24);
    uint64_t v21 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    expert_log(v21, 0, (uint64_t)"odometer[%s:%s]: boot chain integrity violation: %d", v23, v24, v25, v26, v27, name);
    if (v20 >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v28, v29, v30, v31, v32, v33, v34, v20);
    }
  }
  else
  {
    uint64_t v35 = *(void *)a2;
    uint64_t v36 = chip_get_name(*(void *)(a2 + 16));
    expert_log(v35, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is consistent with boot chain", v37, v38, v39, v40, v41, v36);
    return 0;
  }
  return v20;
}

char *property_get_from_identifier(char *result)
{
  v1 = &property_get_from_identifier_p_map[(void)result];
  if (v1 < &_property_stng && v1 >= property_get_from_identifier_p_map) {
    return *v1;
  }
  __break(0x5519u);
  return result;
}

uint64_t image4_environment_resolve(uint64_t a1)
{
  return image4_coprocessor_select(*(void *)(a1 + 16), 0, a1);
}

unint64_t image4_environment_get_secure_boot(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v18 = 0;
  unint64_t result = *(void *)(a1 + 40);
  if (result >= 5) {
    __panic_npx("panic: invalid secure boot level: actual = %llu, expected <= %llu", a2, a3, a4, a5, a6, a7, a8, result);
  }
  if (result == 4)
  {
    int secure_boot = expert_get_secure_boot(*(void *)(a1 + 8), (uint64_t)&v18);
    if (secure_boot) {
      __panic_npx("panic: failed to get secure boot level: %d", v11, v12, v13, v14, v15, v16, v17, secure_boot);
    }
    return v18;
  }
  return result;
}

unint64_t image4_environment_get_nonce_domain(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  unsigned int v13 = 0;
  unint64_t result = *(unsigned int *)(a1 + 48);
  if (result == -1)
  {
    unint64_t result = image4_coprocessor_select(*(void *)(a1 + 16), 0, a1);
    if (!result) {
      __panic_npx("panic: could not resolve chip for environment", v4, v5, v6, v7, v8, v9, v10, v12);
    }
    uint64_t v11 = *(void *)(result + 200);
    if (v11)
    {
      if (result >= result + 264)
      {
        __break(0x5519u);
      }
      else if (expert_query_property_uint32(v2, result, v11, &v13))
      {
        return 0xFFFFFFFFLL;
      }
      else
      {
        return v13;
      }
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t image4_environment_callout_query_boot_nonce(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3 && (uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v3 + 8)) != 0) {
    return v4(a1, a2, a3, *(void *)(a1 + 64));
  }
  else {
    return 45;
  }
}

uint64_t image4_environment_callout_query_nonce_digest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3 && (uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v3 + 16)) != 0) {
    return v4(a1, a2, a3, *(void *)(a1 + 64));
  }
  else {
    return 45;
  }
}

uint64_t _image4_environment_init(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3 == 0xFFFF) {
    __panic_npx("panic: null coprocessor handle", a2, 0xFFFFLL, a4, a5, a6, a7, a8, v12);
  }
  if (a3 >= 0xC) {
    __panic_npx("panic: invalid coprocessor handle: actual = %llu, expected < %u", a2, a3, a4, a5, a6, a7, a8, a3);
  }
  if (a4) {
    __panic_npx("panic: unsupported struct version: actual = %hu, expected <= %u", a2, a3, a4, a5, a6, a7, a8, a4);
  }
  *(void *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 8) = generic_expert_current();
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 4;
  *(_DWORD *)(a1 + 48) = -1;
  *(void *)(a1 + 24) = a3;
  return a1;
}

uint64_t image4_environment_new(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = generic_expert_current();
  uint64_t result = _expert_alloc_type(v4, (uint64_t)&_image4_type_environment);
  if (result)
  {
    uint64_t result = _image4_environment_init(result, a1, a2, 0, v6, v7, v8, v9);
    *(void *)(result + 32) = &_image4_type_environment;
  }
  return result;
}

uint64_t image4_environment_set_secure_boot(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 > 3) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"secure_boot");
  }
  *(void *)(result + 40) = a2;
  return result;
}

uint64_t image4_environment_set_nonce_domain(uint64_t result, int a2)
{
  *(_DWORD *)(result + 48) = a2;
  return result;
}

uint64_t image4_environment_set_callbacks(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 56) = a2;
  *(void *)(result + 64) = a3;
  return result;
}

char *image4_environment_identify(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v2 = generic_expert_current();
  long long v30 = xmmword_270EC9F48;
  uint64_t v31 = qword_270EC9F58;
  uint64_t v3 = image4_coprocessor_select(*(void *)(a1 + 16), 0, a1);
  if (!v3) {
    __panic_npx("panic: could not resolve chip for environment", v4, v5, v6, v7, v8, v9, v10, v28);
  }
  uint64_t v11 = v3;
  uint64_t result = property_iterator_next((uint64_t)&v30, v4, v5, v6, v7, v8, v9, v10);
  if (result)
  {
    uint64_t v13 = (uint64_t)result;
    memset(v29, 170, sizeof(v29));
    do
    {
      uint64_t v32 = 0;
      long long v35 = v29[3];
      long long v36 = v29[2];
      long long v37 = v29[1];
      long long v38 = v29[0];
      *(_OWORD *)__s = xmmword_263C0C420;
      long long v34 = xmmword_263C0C430;
      unint64_t v39 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t constraint = chip_get_constraint(v11, v13, 0);
      uint64_t v22 = image4_identifier_init(&v32, constraint);
      if (constraint != *(void *)(v11 + 200) || *(_DWORD *)(a1 + 48) == -1)
      {
        switch(**(void **)(constraint + 40))
        {
          case 0:
            if (!expert_query_property_BOOL(v2, v11, constraint, (unsigned __int8 *)__s)) {
              goto LABEL_15;
            }
            goto LABEL_27;
          case 1:
            if (!expert_query_property_uint32(v2, v11, constraint, __s)) {
              goto LABEL_15;
            }
            goto LABEL_27;
          case 2:
            if (!expert_query_property_uint64(v2, v11, constraint, __s)) {
              goto LABEL_15;
            }
            goto LABEL_27;
          case 3:
            goto LABEL_27;
          case 4:
            if (!expert_query_property_version(v2, v11, constraint, (uint64_t)__s)) {
              goto LABEL_15;
            }
            goto LABEL_27;
          default:
            __panic_npx("panic: version property iterated during identification: p = %s, fourcc = %s", v15, v16, v17, v18, v19, v20, v21, *(void *)constraint);
        }
      }
      *(_DWORD *)__s = *(_DWORD *)(a1 + 48);
LABEL_15:
      uint64_t v23 = *(void **)(a1 + 56);
      if (v23)
      {
        switch(**(void **)(*v22 + 40))
        {
          case 0:
            uint64_t v24 = (void (*)(uint64_t, void *, void, void))v23[3];
            if (v24) {
              v24(a1, v22, __s[0], *(void *)(a1 + 64));
            }
            goto LABEL_27;
          case 1:
            uint64_t v25 = (void (*)(uint64_t, void *, uint64_t, void))v23[4];
            if (!v25) {
              goto LABEL_27;
            }
            uint64_t v26 = *(unsigned int *)__s;
            break;
          case 2:
            uint64_t v25 = (void (*)(uint64_t, void *, uint64_t, void))v23[4];
            if (!v25) {
              goto LABEL_27;
            }
            uint64_t v26 = *(void *)__s;
            break;
          case 4:
            uint64_t v27 = (void (*)(uint64_t, void *, char *, uint64_t, void))v23[5];
            if (v27)
            {
              if ((uint64_t)strlen(__s) < 1)
              {
                __break(0x5519u);
                JUMPOUT(0x263BE347CLL);
              }
              v27(a1, v22, __s, v37 + 1, *(void *)(a1 + 64));
            }
            goto LABEL_27;
          default:
            __panic_npx("panic: unreachable case: %s = 0x%llx", v15, v16, v17, v18, v19, v20, v21, (char)"id4->id_p->p_type->pt_switchable");
        }
        v25(a1, v22, v26, *(void *)(a1 + 64));
      }
LABEL_27:
      uint64_t result = property_iterator_next((uint64_t)&v30, v15, v16, v17, v18, v19, v20, v21);
      uint64_t v13 = (uint64_t)result;
    }
    while (result);
  }
  return result;
}

uint64_t image4_environment_get_digest_info(uint64_t a1)
{
  uint64_t v1 = image4_coprocessor_select(*(void *)(a1 + 16), 0, a1);
  if (!v1) {
    __panic_npx("panic: could not resolve chip for environment", v2, v3, v4, v5, v6, v7, v8, vars0);
  }
  uint64_t v9 = *(uint64_t (**)(void))(v1 + 48);

  return v9();
}

uint64_t *image4_environment_destroy(uint64_t *result)
{
  if (*result) {
    return (uint64_t *)_expert_dealloc_type(*(void *)(*result + 8), *(void *)(*result + 32), result);
  }
  return result;
}

uint64_t _BootPolicyClosureComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = **(unint64_t ***)(*(void *)(a5 + 32) + 16);
  if (*v9 > a4) {
    __panic_npx_0((uint64_t)v9, a2, a1, a4, a5, a6, a7, a8, a4);
  }
  ccdigest();
  return 0;
}

uint64_t _BootPolicyClosureVerifyChain()
{
  return 0;
}

uint64_t _BootPolicyClosureVerifySignature()
{
  return 0;
}

uint64_t _BootPolicyClosureEvaluateCertificateProperties()
{
  return 0;
}

void __panic_npx_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  uint64_t v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: digest buffer overflow: actual = %lu, expected >= %lu", &a9);
  _os_crash();
  __break(1u);
}

uint64_t _BootPolicyClosureComputeDigest_0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = **(unint64_t ***)(*(void *)(a5 + 32) + 16);
  if (*v9 > a4) {
    __panic_npx_0((uint64_t)v9, a2, a1, a4, a5, a6, a7, a8, a4);
  }
  ccdigest();
  return 0;
}

uint64_t _BootPolicyClosureVerifyChain_0()
{
  return 0;
}

uint64_t _BootPolicyClosureVerifySignature_0()
{
  return 0;
}

uint64_t _BootPolicyClosureEvaluateCertificateProperties_0()
{
  return 0;
}

void _prepare_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v29[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(*(void *)a3 + 24);
  uint64_t v5 = *(void *)(v4 + 8);
  v29[0] = 0;
  v29[1] = 0;
  size_t v24 = 0;
  size_t __n = 0;
  memset(v28, 0, sizeof(v28));
  memset(v27, 0, sizeof(v27));
  memset(v26, 0, sizeof(v26));
  uint64_t boot_nonce = image4_environment_callout_query_boot_nonce(v4, (uint64_t)v29, (uint64_t)&__n);
  if (!boot_nonce)
  {
    if (__n <= 0x10)
    {
      nonce_init(v28, v29, __n, v7, v8, v9, v10, v11);
      odometer_prepare_nonce(a2, v28, v18, v19, v20, v21, v22, v23);
      return;
    }
    goto LABEL_12;
  }
  if (boot_nonce != 45)
  {
    expert_log(v5, 0, (uint64_t)"failed to get boot nonce from callback: %d", v7, v8, v9, v10, v11, boot_nonce);
    return;
  }
  uint64_t nonce_digest = image4_environment_callout_query_nonce_digest(v4, (uint64_t)v27, (uint64_t)&v24);
  if (nonce_digest != 45)
  {
    if (!nonce_digest)
    {
      if (v24 <= 0x40)
      {
        digest_init((uint64_t)v26, v27, v24, v13, v14, v15, v16, v17);
        odometer_prepare_nonce_hash(a2, (uint64_t)v26);
        return;
      }
LABEL_12:
      __break(0x5519u);
      return;
    }
    expert_log(v5, 0, (uint64_t)"failed to get nonce digest from callback: %d", v13, v14, v15, v16, v17, nonce_digest);
  }
}

void *_get_constraint_mask_0()
{
  return &_sign_constraints;
}

uint64_t _extract_payload_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v7 = *(unsigned __int16 *)(a3 + 528);
  memset(&v12[3], 0, 32);
  if (v7) {
    unint64_t v8 = a3 + 528;
  }
  else {
    unint64_t v8 = 0;
  }
  memset(&v12[1], 0, 32);
  if (v7) {
    uint64_t v9 = a3 + 72;
  }
  else {
    uint64_t v9 = 0;
  }
  v12[0] = 0uLL;
  uint64_t v10 = manifest_measure(a3, a2, (uint64_t)v12);
  *a5 = *(void *)(*(uint64_t (**)(uint64_t))(a2 + 48))(v10);
  if (v9 + 456 > v8) {
    __break(0x5519u);
  }
  return v9 + 328;
}

void *nonce_init(void *a1, const void *a2, size_t __n, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (__n >= 0x11) {
    __panic_npx("panic: nonce too large: actual = %lu, expected <= %ld", (uint64_t)a2, __n, a4, a5, a6, a7, a8, __n);
  }
  memcpy(a1, a2, __n);
  a1[2] = __n;
  return a1;
}

void *nonce_init_copy(void *result, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8 = a2[2];
  if (v8 < 0x11) {
    return nonce_init(result, a2, v8, a4, a5, a6, a7, a8);
  }
  __break(0x5519u);
  return result;
}

uint64_t nonce_compare(void *a1, void *a2)
{
  size_t v2 = a1[2];
  if (v2 == a2[2]) {
    return memcmp(a1, a2, v2);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t nonce_compare_buff(void *a1, const void *a2, size_t a3)
{
  if (a1[2] == a3) {
    return memcmp(a1, a2, a3);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

void *nonce_copy_out(void *__src, void *__dst, size_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v9 = *a3;
  size_t v10 = __src[2];
  if (v9 < v10) {
LABEL_6:
  }
    __panic_npx("panic: nonce length overflow: actual = %lu, expected >= %lu", (uint64_t)__dst, v10, a4, a5, a6, a7, a8, v9);
  if (v10 > 0x10 || (result = memcpy(__dst, __src, v10), size_t v9 = __src[2], v9 > *a3))
  {
    __break(0x5519u);
    goto LABEL_6;
  }
  *a3 = v9;
  return result;
}

void *nonce_init_uint64(void *result, unint64_t a2)
{
  *uint64_t result = bswap64(a2);
  result[2] = 8;
  return result;
}

unint64_t nonce_get_uint64(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1[2] >= 9) {
    __panic_npx("panic: nonce cannot fit into 64-bit integer: actual = %lu, expected <= %lu", a2, a3, a4, a5, a6, a7, a8, a1[2]);
  }
  return bswap64(*a1);
}

uint64_t nonce_print_cstr(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  strcpy(v21, "0123456789abcdef");
  size_t v8 = (unint64_t *)(result + 16);
  unint64_t v9 = *(void *)(result + 16);
  if (v9 > 0x21) {
LABEL_30:
  }
    __panic_npx("panic: bogus nonce length: actual = %lu, expected <= %lu", a2, a3, a4, a5, a6, a7, a8, v9);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  if (!*v8) {
    goto LABEL_27;
  }
  unint64_t v9 = 0;
  unint64_t v10 = a2 + 33;
  uint64_t v11 = (unsigned char *)a2;
  do
  {
    if (result + v9 >= (unint64_t)v8) {
      goto LABEL_29;
    }
    unint64_t v12 = *(unsigned __int8 *)(result + v9);
    uint64_t v13 = (char *)((unint64_t)v21 | (v12 >> 4));
    if (v13 >= &v21[17] || v13 < v21) {
      goto LABEL_29;
    }
    *uint64_t v11 = *v13;
    uint64_t v15 = v11 + 1;
    uint64_t v16 = (char *)((unint64_t)v21 | v12 & 0xF);
    BOOL v17 = v16 >= &v21[17] || v16 < v21;
    BOOL v18 = v17 || (unint64_t)v15 >= v10;
    BOOL v19 = !v18 && (unint64_t)v15 >= a2;
    if (!v19
      || ((*v15 = *v16, uint64_t v11 = v15 + 1, (unint64_t)v11 < v10) ? (v20 = (unint64_t)v11 >= a2) : (v20 = 0),
          !v20))
    {
LABEL_29:
      __break(0x5519u);
      goto LABEL_30;
    }
    *uint64_t v11 = 0;
    ++v9;
  }
  while (v9 < *v8);
  if (!*v8) {
LABEL_27:
  }
    strcpy((char *)a2, "null");
  return result;
}

unint64_t sprintdgst_npx(unint64_t result, unsigned __int8 *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  strcpy(v20, "0123456789abcdef");
  if (a3 > 0x40) {
    goto LABEL_28;
  }
  *(unsigned char *)(result + 128) = 0;
  *(_OWORD *)(result + 96) = 0u;
  *(_OWORD *)(result + 112) = 0u;
  *(_OWORD *)(result + 64) = 0u;
  *(_OWORD *)(result + 80) = 0u;
  *(_OWORD *)(result + 32) = 0u;
  *(_OWORD *)(result + 48) = 0u;
  *(_OWORD *)uint64_t result = 0u;
  *(_OWORD *)(result + 16) = 0u;
  if (a3)
  {
    unint64_t v8 = result + 129;
    unint64_t v9 = (unsigned char *)result;
    while (1)
    {
      unsigned int v11 = *a2++;
      char v10 = v11;
      unint64_t v12 = (char *)((unint64_t)v20 | ((unint64_t)v11 >> 4));
      if (v12 >= &v20[17] || v12 < v20) {
        break;
      }
      *unint64_t v9 = *v12;
      uint64_t v14 = v9 + 1;
      uint64_t v15 = (char *)((unint64_t)v20 | v10 & 0xF);
      BOOL v16 = v15 >= &v20[17] || v15 < v20;
      BOOL v17 = v16 || (unint64_t)v14 >= v8;
      if (v17 || (unint64_t)v14 < result) {
        break;
      }
      char *v14 = *v15;
      unint64_t v9 = v14 + 1;
      if ((unint64_t)v9 >= v8 || (unint64_t)v9 < result) {
        break;
      }
      *unint64_t v9 = 0;
      if (!--a3) {
        return result;
      }
    }
    __break(0x5519u);
LABEL_28:
    __panic_npx_1(result, (uint64_t)a2, a3, a4, a5, a6, a7, a8, a3);
  }
  strcpy((char *)result, "null");
  return result;
}

void __panic_npx_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  char v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: bogus digest length: %lu", &a9);
  _os_crash();
  __break(1u);
}

uint64_t _chain_pivot_enforceable(uint64_t a1, uint64_t a2)
{
  if (odometer_policy_get_chip_property(a1, *(void *)(a2 + 16)))
  {
    int v3 = *(unsigned __int16 *)(a2 + 432);
    uint64_t v4 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    if (v3)
    {
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v6, v7, v8, v9, v10, name);
      return 0;
    }
    else
    {
      uint64_t v11 = 1;
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: manifest has no pivot constraint", v6, v7, v8, v9, v10, name);
    }
  }
  else
  {
    uint64_t v12 = *(void *)a2;
    uint64_t v13 = chip_get_name(*(void *)(a2 + 16));
    uint64_t v11 = 1;
    expert_log(v12, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v14, v15, v16, v17, v18, v13);
  }
  return v11;
}

uint64_t _chain_pivot_enforce(uint64_t a1, unint64_t a2)
{
  uint64_t chip_property = odometer_policy_get_chip_property(a1, *(void *)(a2 + 16));
  if (*(_WORD *)(a2 + 432)) {
    uint64_t v9 = (unsigned __int8 *)(a2 + 328);
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = odometer_enforce_property((uint64_t *)a2, a1, chip_property, v9, v5, v6, v7, v8);
  if (!v10) {
    goto LABEL_13;
  }
  uint64_t v17 = v10;
  if (v10 == 2)
  {
    if (!odometer_check_fuse(a2, (uint64_t)&_odometer_cylinder_production_status, v11, v12, v13, v14, v15, v16))
    {
      size_t v24 = "odometer[%s:%s]: development silicon; not enforcing policy";
      goto LABEL_12;
    }
    if (odometer_check_fuse(a2, (uint64_t)&_odometer_cylinder_internal_use, v18, v19, v20, v21, v22, v23))
    {
      size_t v24 = "odometer[%s:%s]: internal unit; not enforcing policy";
LABEL_12:
      uint64_t v40 = *(void *)a2;
      uint64_t name = chip_get_name(*(void *)(a2 + 16));
      expert_log(v40, 1uLL, (uint64_t)v24, v42, v43, v44, v45, v46, name);
LABEL_13:
      uint64_t v47 = *(void *)a2;
      uint64_t v48 = chip_get_name(*(void *)(a2 + 16));
      expert_log(v47, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is consistent with boot chain", v49, v50, v51, v52, v53, v48);
      return 0;
    }
  }
  uint64_t v25 = *(void *)a2;
  uint64_t v26 = chip_get_name(*(void *)(a2 + 16));
  uint64_t v32 = expert_log(v25, 0, (uint64_t)"odometer[%s:%s]: boot chain integrity violation: %d", v27, v28, v29, v30, v31, v26);
  if (v17 >= 0x6A) {
    __panic_npx_2(v32, v33, v34, v35, v36, v37, v38, v39, v17);
  }
  return v17;
}

void __panic_npx_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  uint64_t v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: error not set to valid posix code: %d", &a9);
  _os_crash();
  __break(1u);
}

uint64_t __handle_absence(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 = 0;
  return 0;
}

uint64_t expert_map(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1[1] <= 0x11FuLL) {
    __panic_npx("panic: insufficient memory for expert: actual = %lu, expected >= %lu", a2, a3, a4, a5, a6, a7, a8, a1[1]);
  }
  return *a1;
}

uint64_t _expert_assert(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(result + 8) != a2) {
    __panic_npx("panic: unexpected expert: op = %s, actual = %s, expected = %s", a2, a3, a4, a5, a6, a7, a8, a3);
  }
  return result;
}

char *expert_log_level_cstr_lower(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 >= 4) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"lvl");
  }
  return off_2655E12D0[a1];
}

char *expert_log_level_cstr_upper(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 >= 4) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"lvl");
  }
  return off_2655E12F0[a1];
}

uint64_t expert_init(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t expert_boot(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 40))();
}

uint64_t _expert_alloc_type(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a1 + 240))();
  if (!type_get_size(a2)) {
    __panic_npx("panic: type not available", v4, v5, v6, v7, v8, v9, v10, v13);
  }
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 64);
  if (!v11) {
    return 0;
  }

  return v11(a1, a2);
}

uint64_t expert_runtime_entry(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 240))();
}

uint64_t _expert_dealloc_type(uint64_t result, uint64_t a2, uint64_t *a3)
{
  if (a2)
  {
    uint64_t v4 = *a3;
    uint64_t v5 = *(uint64_t (**)(void))(result + 72);
    if (v5) {
      BOOL v6 = v4 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6) {
      uint64_t result = v5();
    }
  }
  *a3 = 0;
  return result;
}

uint64_t expert_alloc_data(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a1 + 240))();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 80);
  if (!v4) {
    return 0;
  }

  return v4(a1, a2);
}

uint64_t expert_dealloc_data(uint64_t result, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  uint64_t v5 = *(uint64_t (**)(void))(result + 88);
  if (v5) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t result = v5();
    *a3 = 0;
  }
  return result;
}

uint64_t expert_dump(uint64_t a1)
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  long long v113 = xmmword_270ECA4B8;
  uint64_t v114 = qword_270ECA4C8;
  unint64_t v112 = 0;
  long long __str = xmmword_263C0C488;
  long long v124 = unk_263C0C498;
  (*(void (**)(void))(a1 + 240))();
  (*(void (**)(uint64_t))(a1 + 240))(a1);
  if ((*(unsigned int (**)(uint64_t, unint64_t *))(a1 + 120))(a1, &v112))
  {
    unint64_t v112 = 3;
  }
  else
  {
    uint64_t v9 = v112;
    if (v112 >= 3)
    {
      if (v112 != 3) {
        __panic_npx("panic: unreachable case: %s = 0x%llx", v2, v3, v4, v5, v6, v7, v8, (char)"sb");
      }
      uint64_t v9 = 3;
    }
    snprintf((char *)&__str, 0x20uLL, "0x%llx", v9);
  }
  unsigned int v10 = bswap32(*(_DWORD *)(a1 + 8));
  BYTE4(__str) = 0;
  LODWORD(__str) = v10;
  expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : %s", v4, v5, v6, v7, v8, (uint64_t)&unk_263C166AB);
  expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : %s", v11, v12, v13, v14, v15, (uint64_t)&unk_263C166AB);
  expert_log(a1, 1uLL, (uint64_t)"%s %-36s : 0x%x", v16, v17, v18, v19, v20, (uint64_t)"  🔥🌸 ");
  expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : 0x%llx", v21, v22, v23, v24, v25, (uint64_t)&unk_263C166AB);
  expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : 0x%llx", v26, v27, v28, v29, v30, (uint64_t)&unk_263C166AB);
  expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : 0x%llx", v31, v32, v33, v34, v35, (uint64_t)&unk_263C166AB);
  unint64_t v36 = v112;
  (*(void (**)(uint64_t))(a1 + 240))(a1);
  uint64_t v37 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 128))(a1, v36);
  chip_get_name(v37);
  expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : %s", v38, v39, v40, v41, v42, (uint64_t)&unk_263C166AB);
  (*(void (**)(uint64_t))(a1 + 240))(a1);
  uint64_t v48 = *(uint64_t (**)(uint64_t))(a1 + 104);
  if (v48 && (unint64_t)v48(a1) >= 7
    || (expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : %s", v43, v44, v45, v46, v47, (uint64_t)&unk_263C166AB),
        (*(void (**)(uint64_t))(a1 + 240))(a1),
        (uint64_t v51 = *(uint64_t (**)(uint64_t))(a1 + 112)) != 0)
    && (unint64_t)v51(a1) >= 7)
  {
    v111 = "lvl";
    goto LABEL_42;
  }
  expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : %s", v43, v44, v45, v46, v47, (uint64_t)&unk_263C166AB);
  char v59 = property_iterator_next((uint64_t)&v113, v52, v53, v54, v55, v56, v57, v58);
  if (v59)
  {
    v60 = v59;
    while (1)
    {
      long long v135 = 0u;
      memset(v136, 0, sizeof(v136));
      long long v133 = 0u;
      long long v134 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
      long long v130 = 0u;
      qmemcpy(__dst, "n/a", sizeof(__dst));
      LOBYTE(v127[0]) = 0;
      LODWORD(v128[0]) = 0;
      *(void *)v125 = 0;
      memset(v122, 0, sizeof(v122));
      uint64_t v121 = 0x3E800000000;
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      *(_OWORD *)__source = 0u;
      long long v116 = 0u;
      v61 = v60 + 104;
      switch(**((void **)v60 + 5))
      {
        case 0:
          if (v60 >= v61) {
            goto LABEL_39;
          }
          if (!expert_query_property_BOOL(a1, v37, (uint64_t)v60, (unsigned __int8 *)v127)) {
            goto LABEL_23;
          }
          goto LABEL_30;
        case 1:
          if (v60 >= v61) {
            goto LABEL_39;
          }
          if (!expert_query_property_uint32(a1, v37, (uint64_t)v60, v128)) {
LABEL_23:
          }
            snprintf(__dst, 0x81uLL, "%#x");
          goto LABEL_30;
        case 2:
          if (v60 >= v61) {
            goto LABEL_39;
          }
          if (!expert_query_property_uint64(a1, v37, (uint64_t)v60, v125)) {
            snprintf(__dst, 0x81uLL, "%#llx");
          }
          goto LABEL_30;
        case 3:
          if (v60 >= v61) {
            goto LABEL_39;
          }
          if (!expert_query_property_digest(a1, v37, (uint64_t)v60, (uint64_t)v122)) {
            digest_print_cstr((unint64_t)v122, (unint64_t)__dst, v67, v62, v63, v64, v65, v66);
          }
          goto LABEL_30;
        case 4:
          if (v60 >= v61)
          {
LABEL_39:
            __break(0x5519u);
LABEL_40:
            v111 = "pi->p_type->pt_switchable";
LABEL_42:
            __panic_npx("panic: unreachable case: %s = 0x%llx", v49, v50, v43, v44, v45, v46, v47, (char)v111);
          }
          if (!expert_query_property_version(a1, v37, (uint64_t)v60, (uint64_t)__source)) {
            version_copyout(__source, __dst);
          }
LABEL_30:
          expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : %s", v62, v63, v64, v65, v66, (uint64_t)(v60 + 28));
          v60 = property_iterator_next((uint64_t)&v113, v68, v69, v70, v71, v72, v73, v74);
          if (!v60) {
            goto LABEL_31;
          }
          break;
        default:
          goto LABEL_40;
      }
    }
  }
LABEL_31:
  memset(v128, 0, sizeof(v128));
  memset(v127, 0, sizeof(v127));
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  *(_OWORD *)__source = 0u;
  *(void *)((char *)v122 + 11) = 0;
  BYTE4(v122[0]) = 0;
  *(_WORD *)((char *)v122 + 5) = 0;
  *(_DWORD *)((char *)v122 + 7) = 0;
  *(void *)((char *)&v122[1] + 9) = 0;
  *(void *)((char *)&v122[1] + 3) = 0;
  strcpy((char *)v122, "n/a");
  *(void *)&v125[11] = 0;
  v125[4] = 0;
  *(_WORD *)&v125[5] = 0;
  *(_DWORD *)&v125[7] = 0;
  *(void *)((char *)v126 + 6) = 0;
  v126[0] = 0;
  strcpy(v125, "n/a");
  memset(v136, 0, sizeof(v136));
  long long v135 = 0u;
  long long v134 = 0u;
  long long v133 = 0u;
  long long v132 = 0u;
  long long v131 = 0u;
  long long v130 = 0u;
  qmemcpy(__dst, "n/a", sizeof(__dst));
  (*(void (**)(uint64_t))(a1 + 240))(a1);
  if (!(*(unsigned int (**)(uint64_t, void, void, void *))(a1 + 144))(a1, 0, 0, v128))
  {
    nonce_print_cstr((uint64_t)v128, (unint64_t)v122, v75, v76, v77, v78, v79, v80);
    (*(void (**)(uint64_t))(a1 + 240))(a1);
    if (!(*(unsigned int (**)(uint64_t, void, void, void *, void *))(a1 + 152))(a1, 0, 0, v128, v127))
    {
      nonce_print_cstr((uint64_t)v127, (unint64_t)v125, v81, v76, v77, v78, v79, v80);
      (*(void (**)(uint64_t))(a1 + 240))(a1);
      v82 = (void *)(*(uint64_t (**)(uint64_t, void))(a1 + 128))(a1, 0);
      odometer_compute_nonce_hash(a1, v82, (uint64_t)v127, (uint64_t)__source);
      digest_print_cstr((unint64_t)__source, (unint64_t)__dst, v83, v84, v85, v86, v87, v88);
    }
  }
  expert_log(a1, 2uLL, (uint64_t)"%6s  %-36s : %s", v76, v77, v78, v79, v80, (uint64_t)&unk_263C166AB);
  expert_log(a1, 2uLL, (uint64_t)"%6s  %-36s : %s", v89, v90, v91, v92, v93, (uint64_t)&unk_263C166AB);
  expert_log(a1, 2uLL, (uint64_t)"%6s  %-36s : %s", v94, v95, v96, v97, v98, (uint64_t)&unk_263C166AB);
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  *(_OWORD *)__source = 0u;
  memset(v136, 0, sizeof(v136));
  long long v135 = 0u;
  long long v134 = 0u;
  long long v133 = 0u;
  long long v132 = 0u;
  long long v131 = 0u;
  long long v130 = 0u;
  qmemcpy(__dst, "n/a", sizeof(__dst));
  if (!expert_query_property_digest(a1, 0, (uint64_t)&_property_bmfh, (uint64_t)__source)) {
    digest_print_cstr((unint64_t)__source, (unint64_t)__dst, v99, v100, v101, v102, v103, v104);
  }
  uint64_t result = expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : %s", v100, v101, v102, v103, v104, (uint64_t)&unk_263C166AB);
  if (*(void *)(a1 + 56))
  {
    expert_log(a1, 1uLL, (uint64_t)"%s %-36s", v106, v107, v108, v109, v110, (uint64_t)&unk_263C166AB);
    return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 56))(a1, 1);
  }
  return result;
}

uint64_t expert_get_secure_boot(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a1 + 240))();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 120);

  return v4(a1, a2);
}

uint64_t expert_log(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2 >= 3)
  {
    if (a2 != 3) {
      __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"level");
    }
  }
  else
  {
    (*(void (**)(uint64_t))(a1 + 240))(a1);
  }
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t *))(a1 + 48))(a1, a2, a3, &a9);
}

uint64_t expert_query_chip(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a1 + 240))();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 128);

  return v4(a1, a2);
}

uint64_t expert_get_exception_level(uint64_t a1)
{
  (*(void (**)(void))(a1 + 240))();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(a1 + 104);
  if (!v2) {
    return 0;
  }

  return v2(a1);
}

uint64_t expert_get_unprivileged_limit(uint64_t a1)
{
  (*(void (**)(void))(a1 + 240))();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(a1 + 112);
  if (!v2) {
    return 6;
  }

  return v2(a1);
}

uint64_t expert_query_property_BOOL(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  unsigned __int8 v40 = 0;
  (*(void (**)(void))(a1 + 240))();
  _expert_query_resolve_debug(a1, a2, a3);
  unint64_t v8 = chip_select_property_expert(a2, (void *)a3, a1);
  expert_log(a1, 2uLL, (uint64_t)"selected property expert: property = %s, selected = %s, base = %s", v9, v10, v11, v12, v13, a3 + 28);
  if (v8 >= v8 + 288) {
    __break(0x5519u);
  }
  uint64_t v14 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, unsigned __int8 *))(v8 + 200))(v8, a2, a3, &v40);
  uint64_t v20 = v14;
  if ((int)v14 > 18)
  {
    if (v14 != 45 && v14 != 19) {
      goto LABEL_5;
    }
LABEL_11:
    expert_log(a1, 2uLL, (uint64_t)"property not present: %s: %d", v15, v16, v17, v18, v19, *(void *)a3);
    goto LABEL_12;
  }
  if (v14)
  {
    if (v14 != 2)
    {
LABEL_5:
      expert_log(a1, 0, (uint64_t)"failed to query property: %s: %d", v15, v16, v17, v18, v19, *(void *)a3);
      goto LABEL_13;
    }
    goto LABEL_11;
  }
LABEL_12:
  expert_log(a1, 2uLL, (uint64_t)"queried property: %s => 0x%x", v15, v16, v17, v18, v19, a3 + 28);
LABEL_13:
  uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t, unsigned __int8 *))(a3 + 88);
  memset(v45, 0, sizeof(v45));
  long long v44 = 0u;
  long long v43 = 0u;
  qmemcpy(__str, "n/a", sizeof(__str));
  unsigned __int8 v41 = v40;
  if (*(_UNKNOWN **)(a3 + 48) == &_property_constraint_un) {
    uint64_t v30 = _expert_post_process_unconstrain_BOOL;
  }
  else {
    uint64_t v30 = v29;
  }
  if (v20 != 2)
  {
    if (v20) {
      goto LABEL_22;
    }
    uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t, unsigned __int8 *))(a3 + 96);
    snprintf(__str, 0x40uLL, "0x%x", v40);
  }
  if (v30)
  {
    uint64_t v31 = v30(a3, a2, &v41);
    if (v31)
    {
      uint64_t v37 = v31;
      expert_log(a1, 1uLL, (uint64_t)"transform not applied: p = %s, kind = %s: %d", v32, v33, v34, v35, v36, a3 + 28);
      uint64_t v20 = v37;
      goto LABEL_23;
    }
    expert_log(a1, 2uLL, (uint64_t)"applied transform: p = %s, type = %s, xf kind = %s, value = [%s => 0x%x], error = [%d => %d]", v32, v33, v34, v35, v36, a3 + 28);
    unsigned __int8 v38 = v41;
LABEL_27:
    uint64_t v20 = 0;
    *a4 = v38;
    return v20;
  }
LABEL_22:
  if (!v20)
  {
    unsigned __int8 v38 = v40;
    goto LABEL_27;
  }
LABEL_23:
  if (v20 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v21, v22, v23, v24, v25, v26, v27, v20);
  }
  return v20;
}

uint64_t expert_query_property_uint32(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  int v40 = 0;
  (*(void (**)(void))(a1 + 240))();
  _expert_query_resolve_debug(a1, a2, a3);
  unint64_t v8 = chip_select_property_expert(a2, (void *)a3, a1);
  expert_log(a1, 2uLL, (uint64_t)"selected property expert: property = %s, selected = %s, base = %s", v9, v10, v11, v12, v13, a3 + 28);
  if (v8 >= v8 + 288) {
    __break(0x5519u);
  }
  uint64_t v14 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, int *))(v8 + 208))(v8, a2, a3, &v40);
  uint64_t v20 = v14;
  if ((int)v14 > 18)
  {
    if (v14 != 45 && v14 != 19) {
      goto LABEL_5;
    }
LABEL_11:
    expert_log(a1, 2uLL, (uint64_t)"property not present: %s: %d", v15, v16, v17, v18, v19, *(void *)a3);
    goto LABEL_12;
  }
  if (v14)
  {
    if (v14 != 2)
    {
LABEL_5:
      expert_log(a1, 0, (uint64_t)"failed to query property: %s: %d", v15, v16, v17, v18, v19, *(void *)a3);
      goto LABEL_13;
    }
    goto LABEL_11;
  }
LABEL_12:
  expert_log(a1, 2uLL, (uint64_t)"queried property: %s => 0x%x", v15, v16, v17, v18, v19, a3 + 28);
LABEL_13:
  uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t, int *))(a3 + 88);
  memset(v45, 0, sizeof(v45));
  long long v44 = 0u;
  long long v43 = 0u;
  qmemcpy(__str, "n/a", sizeof(__str));
  int v41 = v40;
  if (*(_UNKNOWN **)(a3 + 48) == &_property_constraint_un) {
    uint64_t v30 = _expert_post_process_unconstrain_uint32;
  }
  else {
    uint64_t v30 = v29;
  }
  if (v20 != 2)
  {
    if (v20) {
      goto LABEL_22;
    }
    uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t, int *))(a3 + 96);
    snprintf(__str, 0x40uLL, "0x%x", v40);
  }
  if (v30)
  {
    uint64_t v31 = v30(a3, a2, &v41);
    if (v31)
    {
      uint64_t v37 = v31;
      expert_log(a1, 1uLL, (uint64_t)"transform not applied: p = %s, kind = %s: %d", v32, v33, v34, v35, v36, a3 + 28);
      uint64_t v20 = v37;
      goto LABEL_23;
    }
    expert_log(a1, 2uLL, (uint64_t)"applied transform: p = %s, type = %s, xf kind = %s, value = [%s => 0x%x], error = [%d => %d]", v32, v33, v34, v35, v36, a3 + 28);
    int v38 = v41;
LABEL_27:
    uint64_t v20 = 0;
    *a4 = v38;
    return v20;
  }
LABEL_22:
  if (!v20)
  {
    int v38 = v40;
    goto LABEL_27;
  }
LABEL_23:
  if (v20 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v21, v22, v23, v24, v25, v26, v27, v20);
  }
  return v20;
}

uint64_t expert_query_property_uint64(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v40 = 0;
  (*(void (**)(void))(a1 + 240))();
  _expert_query_resolve_debug(a1, a2, a3);
  unint64_t v8 = chip_select_property_expert(a2, (void *)a3, a1);
  expert_log(a1, 2uLL, (uint64_t)"selected property expert: property = %s, selected = %s, base = %s", v9, v10, v11, v12, v13, a3 + 28);
  if (v8 >= v8 + 288) {
    __break(0x5519u);
  }
  uint64_t v14 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, uint64_t *))(v8 + 216))(v8, a2, a3, &v40);
  uint64_t v20 = v14;
  if ((int)v14 > 18)
  {
    if (v14 != 45 && v14 != 19) {
      goto LABEL_5;
    }
LABEL_11:
    expert_log(a1, 2uLL, (uint64_t)"property not present: %s: %d", v15, v16, v17, v18, v19, *(void *)a3);
    goto LABEL_12;
  }
  if (v14)
  {
    if (v14 != 2)
    {
LABEL_5:
      expert_log(a1, 0, (uint64_t)"failed to query property: %s: %d", v15, v16, v17, v18, v19, *(void *)a3);
      goto LABEL_13;
    }
    goto LABEL_11;
  }
LABEL_12:
  expert_log(a1, 2uLL, (uint64_t)"queried property: %s => 0x%llx", v15, v16, v17, v18, v19, a3 + 28);
LABEL_13:
  uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t *))(a3 + 88);
  memset(v45, 0, sizeof(v45));
  long long v44 = 0u;
  long long v43 = 0u;
  qmemcpy(__str, "n/a", sizeof(__str));
  uint64_t v41 = v40;
  if (*(_UNKNOWN **)(a3 + 48) == &_property_constraint_un) {
    uint64_t v30 = _expert_post_process_unconstrain_uint64;
  }
  else {
    uint64_t v30 = v29;
  }
  if (v20 != 2)
  {
    if (v20) {
      goto LABEL_22;
    }
    uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t *))(a3 + 96);
    snprintf(__str, 0x40uLL, "0x%llx", v40);
  }
  if (v30)
  {
    uint64_t v31 = v30(a3, a2, &v41);
    if (v31)
    {
      uint64_t v37 = v31;
      expert_log(a1, 1uLL, (uint64_t)"transform not applied: p = %s, kind = %s: %d", v32, v33, v34, v35, v36, a3 + 28);
      uint64_t v20 = v37;
      goto LABEL_23;
    }
    expert_log(a1, 2uLL, (uint64_t)"applied transform: p = %s, type = %s, xf kind = %s, value = [%s => 0x%llx], error = [%d => %d]", v32, v33, v34, v35, v36, a3 + 28);
    uint64_t v38 = v41;
LABEL_27:
    uint64_t v20 = 0;
    *a4 = v38;
    return v20;
  }
LABEL_22:
  if (!v20)
  {
    uint64_t v38 = v40;
    goto LABEL_27;
  }
LABEL_23:
  if (v20 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v21, v22, v23, v24, v25, v26, v27, v20);
  }
  return v20;
}

uint64_t expert_query_property_digest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  memset(v48, 0, sizeof(v48));
  char v47 = 0;
  memset(v46, 0, sizeof(v46));
  (*(void (**)(void))(a1 + 240))();
  _expert_query_resolve_debug(a1, a2, a3);
  unint64_t v8 = chip_select_property_expert(a2, (void *)a3, a1);
  expert_log(a1, 2uLL, (uint64_t)"selected property expert: property = %s, selected = %s, base = %s", v9, v10, v11, v12, v13, a3 + 28);
  if (v8 >= v8 + 288) {
    __break(0x5519u);
  }
  uint64_t v14 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, _OWORD *))(v8 + 224))(v8, a2, a3, v48);
  uint64_t v21 = v14;
  if ((int)v14 > 18)
  {
    if (v14 != 45 && v14 != 19) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (!v14)
  {
LABEL_9:
    digest_print_cstr((unint64_t)v48, (unint64_t)v46, v15, v16, v17, v18, v19, v20);
    expert_log(a1, 2uLL, (uint64_t)"queried property: %s => %s", v22, v23, v24, v25, v26, a3 + 28);
    goto LABEL_11;
  }
  if (v14 == 2)
  {
LABEL_8:
    expert_log(a1, 2uLL, (uint64_t)"property not present: %s: %d", v16, v17, v18, v19, v20, *(void *)a3);
    goto LABEL_9;
  }
LABEL_10:
  expert_log(a1, 0, (uint64_t)"failed to query property: %s: %d", v16, v17, v18, v19, v20, *(void *)a3);
LABEL_11:
  memset(v59, 0, sizeof(v59));
  long long v58 = 0u;
  long long v57 = 0u;
  long long v56 = 0u;
  long long v55 = 0u;
  long long v54 = 0u;
  long long v53 = 0u;
  qmemcpy(v52, "n/a", sizeof(v52));
  char v50 = 0;
  memset(v49, 0, sizeof(v49));
  if (v21 == 2)
  {
    if (*(_UNKNOWN **)(a3 + 48) != &_property_constraint_un) {
      return 2;
    }
    memset(v51, 0, sizeof(v51));
    digest_print_cstr((unint64_t)v48, (unint64_t)v49, v28, v29, v30, v31, v32, v33);
    expert_log(a1, 2uLL, (uint64_t)"applied transform: p = %s, type = %s, xf kind = %s, value = [%s => %s], error = [%d => %d]", v34, v35, v36, v37, v38, a3 + 28);
    digest_copy((uint64_t)v48, (uint64_t)v51, v39, v40, v41, v42, v43, v44);
LABEL_18:
    digest_copy(a4, (uint64_t)v48, v28, v29, v30, v31, v32, v33);
    return 0;
  }
  if (!v21) {
    goto LABEL_18;
  }
  if (v21 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v27, v28, v29, v30, v31, v32, v33, v21);
  }
  return v21;
}

uint64_t expert_query_property_version(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v30 = 0x3E800000000;
  memset(v29, 0, sizeof(v29));
  (*(void (**)(void))(a1 + 240))();
  _expert_query_resolve_debug(a1, a2, a3);
  unint64_t v8 = chip_select_property_expert(a2, (void *)a3, a1);
  expert_log(a1, 2uLL, (uint64_t)"selected property expert: property = %s, selected = %s, base = %s", v9, v10, v11, v12, v13, a3 + 28);
  if (v8 >= v8 + 288) {
    __break(0x5519u);
  }
  uint64_t v14 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, long long *))(v8 + 232))(v8, a2, a3, v29);
  uint64_t v20 = v14;
  if ((int)v14 > 18)
  {
    if (v14 != 45 && v14 != 19) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (!v14)
  {
LABEL_9:
    expert_log(a1, 2uLL, (uint64_t)"queried property: %s => %s", v15, v16, v17, v18, v19, a3 + 28);
    goto LABEL_11;
  }
  if (v14 == 2)
  {
LABEL_8:
    expert_log(a1, 2uLL, (uint64_t)"property not present: %s: %d", v15, v16, v17, v18, v19, *(void *)a3);
    goto LABEL_9;
  }
LABEL_10:
  expert_log(a1, 0, (uint64_t)"failed to query property: %s: %d", v15, v16, v17, v18, v19, *(void *)a3);
LABEL_11:
  memset(v40, 0, sizeof(v40));
  long long v39 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  long long v34 = 0u;
  qmemcpy(v33, "n/a", sizeof(v33));
  if (v20 == 2)
  {
    if (*(_UNKNOWN **)(a3 + 48) != &_property_constraint_un) {
      return 2;
    }
    uint64_t v32 = 0x3E800000000;
    memset(v31, 0, sizeof(v31));
    expert_log(a1, 2uLL, (uint64_t)"applied transform: p = %s, type = %s, xf kind = %s, value = [%s => %s], error = [%d => %d]", v23, v24, v25, v26, v27, a3 + 28);
    version_copy((uint64_t)v29, v31);
LABEL_18:
    version_copy(a4, v29);
    return 0;
  }
  if (!v20) {
    goto LABEL_18;
  }
  if (v20 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v21, v22, v23, v24, v25, v26, v27, v20);
  }
  return v20;
}

uint64_t expert_get_digest_info(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(a1 + 240))();
  if (!a2)
  {
    (*(void (**)(uint64_t))(a1 + 240))(a1);
    a2 = (*(uint64_t (**)(uint64_t, void))(a1 + 128))(a1, 0);
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 96);

  return v6(a1, a2, a3);
}

uint64_t expert_query_chip_boot(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a1 + 240))();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 136);

  return v4(a1, a2);
}

uint64_t expert_query_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(void))(a1 + 240))();
  unint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 144);

  return v8(a1, a2, a3, a4);
}

uint64_t expert_entangle_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  (*(void (**)(void))(a1 + 240))();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 152);

  return v10(a1, a2, a3, a4, a5);
}

uint64_t expert_read_boot_manifest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(void))(a1 + 240))();
  unint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 160);

  return v8(a1, a2, a3, a4);
}

uint64_t expert_query_trust_store(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  (*(void (**)(void))(a1 + 240))();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 168);

  return v10(a1, a2, a3, a4, a5);
}

uint64_t expert_read_storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(void))(a1 + 240))();
  uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 248))(a1);
  if (!result)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 176);
    return v9(a1, a2, a3, a4);
  }
  return result;
}

uint64_t expert_runtime_boot(uint64_t a1)
{
  (*(void (**)(void))(a1 + 240))();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(a1 + 248);

  return v2(a1);
}

uint64_t expert_write_storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(void))(a1 + 240))();
  uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 248))(a1);
  if (!result)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 184);
    return v9(a1, a2, a3, a4);
  }
  return result;
}

uint64_t expert_sync_storage(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a1 + 240))();
  uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 248))(a1);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 192);
    return v5(a1, a2);
  }
  return result;
}

uint64_t _expert_query_resolve_debug(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v5 = result;
    uint64_t result = chip_expert(a2);
    if (result)
    {
      chip_get_name(a2);
      return expert_log(v5, 2uLL, (uint64_t)"querying property with chip expert resolution: p = %s, chip = %s, chip type = 0x%llx, chip expert authority >= 0x%llx", v6, v7, v8, v9, v10, a3 + 28);
    }
  }
  return result;
}

uint64_t expert_boot_once(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 248))();
}

uint64_t expert_read_random(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(a1 + 240))();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 256);

  return v6(a1, a2, a3);
}

uint64_t expert_syscall(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!*(void *)(a1 + 264)) {
    return 78;
  }
  (*(void (**)(void))(a1 + 240))();
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 264);

  return v12(a1, a2, a3, a4, a5, a6);
}

uint64_t expert_lock(uint64_t a1)
{
  return a1;
}

unint64_t expert_unlock(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result)
  {
    if (result >= result + 288)
    {
      __break(0x5519u);
    }
    else
    {
      unint64_t result = (*(uint64_t (**)(void))(result + 280))();
      *a1 = 0;
    }
  }
  return result;
}

uint64_t expert_get_boot_nonce_hash(uint64_t a1, uint64_t a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  memset(v6, 0, 24);
  memset(v5, 0, sizeof(v5));
  (*(void (**)(void))(a1 + 240))();
  uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void *))(a1 + 144))(a1, 0, 0, v6);
  if (!result)
  {
    (*(void (**)(uint64_t))(a1 + 240))(a1);
    uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void *, void *))(a1 + 152))(a1, 0, 0, v6, v5);
    if (!result)
    {
      odometer_compute_nonce_hash(a1, 0, (uint64_t)v5, a2);
      return 0;
    }
  }
  return result;
}

BOOL expert_compute_data_only(uint64_t a1)
{
  (*(void (**)(void))(a1 + 240))();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(a1 + 104);
  if (v2) {
    unint64_t v3 = v2(a1);
  }
  else {
    unint64_t v3 = 0;
  }
  (*(void (**)(uint64_t))(a1 + 240))(a1);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(a1 + 112);
  if (v4) {
    unint64_t v5 = v4(a1);
  }
  else {
    unint64_t v5 = 6;
  }
  return v3 < v5;
}

uint64_t expert_compute_udid(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = 0;
  unint64_t v15 = 0;
  uint64_t result = expert_query_property_uint32(a1, a2, (uint64_t)&_property_CHIP, (_DWORD *)&v14 + 1);
  if (result || (uint64_t result = expert_query_property_uint64(a1, a2, (uint64_t)&_property_ECID, &v15), result))
  {
    if (result >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v7, v8, v9, v10, v11, v12, v13, result);
    }
  }
  else
  {
    LODWORD(v14) = 0;
    HIDWORD(v14) = bswap32(HIDWORD(v14));
    unint64_t v15 = bswap64(v15);
    digest_init(a3, &v14, 0x10uLL, v9, v10, v11, v12, v13);
    return 0;
  }
  return result;
}

uint64_t expert_compute_eieiou(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v6 = 0;
  int v7 = 0;
  while (1)
  {
    uint64_t v8 = expert_compute_eieiou_ps[v6];
    unsigned __int8 v18 = 0;
    uint64_t result = expert_query_property_BOOL(a1, a2, (uint64_t)v8, &v18);
    if (result > 0x2D || ((1 << result) & 0x200000000005) == 0) {
      break;
    }
    v7 += v18;
    if (++v6 == 3)
    {
      uint64_t result = 0;
      *a3 = v7;
      return result;
    }
  }
  if (result >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v10, v11, v12, v13, v14, v15, v16, result);
  }
  return result;
}

uint64_t expert_compute_eieiou_BOOL(uint64_t a1, uint64_t a2, BOOL *a3)
{
  int v12 = 0;
  uint64_t result = expert_compute_eieiou(a1, a2, &v12);
  if (result)
  {
    if (result >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v5, v6, v7, v8, v9, v10, v11, result);
    }
  }
  else
  {
    *a3 = v12 != 0;
  }
  return result;
}

uint64_t _expert_post_process_unconstrain_BOOL(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 = 0;
  return 0;
}

uint64_t _expert_post_process_unconstrain_uint32(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 0;
  return 0;
}

uint64_t _expert_post_process_unconstrain_uint64(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = 0;
  return 0;
}

uint64_t _boot_precomp_enforceable(uint64_t a1, uint64_t a2)
{
  if (!odometer_policy_get_chip_property(a1, *(void *)(a2 + 16)))
  {
    uint64_t v12 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    uint64_t v11 = 1;
    expert_log(v12, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v14, v15, v16, v17, v18, name);
    return v11;
  }
  if (!*(_WORD *)(a2 + 144))
  {
    uint64_t v4 = *(void *)a2;
    uint64_t v21 = chip_get_name(*(void *)(a2 + 16));
    uint64_t v19 = "odometer[%s:%s]: manifest has no constraint for policy";
LABEL_8:
    uint64_t v11 = 1;
    expert_log(v4, 1uLL, (uint64_t)v19, v6, v7, v8, v9, v10, v21);
    return v11;
  }
  int v3 = *(unsigned __int16 *)(a2 + 232);
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = chip_get_name(*(void *)(a2 + 16));
  if (!v3)
  {
    uint64_t v21 = v5;
    uint64_t v19 = "odometer[%s:%s]: no caller-supplied nonce hash";
    goto LABEL_8;
  }
  expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v6, v7, v8, v9, v10, v5);
  return 0;
}

uint64_t _boot_precomp_enforce(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t chip_property = odometer_policy_get_chip_property(a1, *(void *)(a2 + 16));
  if (*(_WORD *)(a2 + 232)) {
    unint64_t v10 = a2 + 152;
  }
  else {
    unint64_t v10 = 0;
  }
  if (*(_WORD *)(a2 + 144)) {
    unint64_t v11 = a2 + 64;
  }
  else {
    unint64_t v11 = 0;
  }
  if (property_constrain_digest(chip_property, v4, v11, v10, v6, v7, v8, v9))
  {
    uint64_t v12 = *(unsigned int *)(a1 + 24);
    uint64_t v13 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    uint64_t v20 = expert_log(v13, 0, (uint64_t)"odometer[%s:%s]: anti-replay violation: %d", v15, v16, v17, v18, v19, name);
    if (v12 >= 0x6A) {
      __panic_npx_2(v20, v21, v22, v23, v24, v25, v26, v27, v12);
    }
  }
  else
  {
    uint64_t v28 = *(void *)a2;
    uint64_t v29 = chip_get_name(*(void *)(a2 + 16));
    expert_log(v28, 1uLL, (uint64_t)"odometer[%s]: manifest is current", v30, v31, v32, v33, v34, v29);
    return 0;
  }
  return v12;
}

uint64_t _boot_sideload_enforceable(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 16);
  if (odometer_policy_get_chip_property(a1, v3))
  {
    if (*(void *)(v3 + 160))
    {
      if (v3 && v3 >= v3 + 264) {
        __break(0x5519u);
      }
      char name = chip_get_name(v3);
      __panic_npx("panic: illegal chip definition: anti-reply and sideload policies defined: %s", v22, v23, v24, v25, v26, v27, v28, name);
    }
    int v4 = *(unsigned __int16 *)(a2 + 144);
    uint64_t v5 = *(void *)a2;
    uint64_t v6 = chip_get_name(*(void *)(a2 + 16));
    if (v4)
    {
      expert_log(v5, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v7, v8, v9, v10, v11, v6);
      return 0;
    }
    else
    {
      uint64_t v12 = 1;
      expert_log(v5, 1uLL, (uint64_t)"odometer[%s:%s]: manifest has no constraint for policy", v7, v8, v9, v10, v11, v6);
    }
  }
  else
  {
    uint64_t v13 = *(void *)a2;
    uint64_t v14 = chip_get_name(*(void *)(a2 + 16));
    uint64_t v12 = 1;
    expert_log(v13, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v15, v16, v17, v18, v19, v14);
  }
  return v12;
}

uint64_t _boot_sideload_enforce(uint64_t a1, uint64_t a2)
{
  v68[13] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)a2;
  uint64_t chip_property = odometer_policy_get_chip_property(a1, *(void *)(a2 + 16));
  if (!*(_WORD *)(a2 + 144)) {
    __panic_npx("panic: optional not set", v6, v7, v8, v9, v10, v11, v12, v67);
  }
  uint64_t v13 = chip_property;
  if (*(_WORD *)(a2 + 232))
  {
    uint64_t v14 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    expert_log(v14, 1uLL, (uint64_t)"odometer[%s:%s]: using caller-provided nonce hash", v16, v17, v18, v19, v20, name);
    if (property_constrain_digest(v13, v4, a2 + 64, a2 + 152, v21, v22, v23, v24))
    {
      uint64_t v25 = *(unsigned int *)(a1 + 24);
      uint64_t v26 = *(void *)a2;
      uint64_t v27 = chip_get_name(*(void *)(a2 + 16));
      expert_log(v26, 0, (uint64_t)"odometer[%s:%s]: anti-replay violation: %d", v28, v29, v30, v31, v32, v27);
      goto LABEL_7;
    }
LABEL_9:
    uint64_t v59 = *(void *)a2;
    uint64_t v60 = chip_get_name(*(void *)(a2 + 16));
    expert_log(v59, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is current", v61, v62, v63, v64, v65, v60);
    return 0;
  }
  *(_OWORD *)uint64_t v68 = xmmword_263C0C548;
  memset(&v68[2], 170, 88);
  digest_copy((uint64_t)v68, a2 + 64, v7, v8, v9, v10, v11, v12);
  uint64_t v40 = *(void *)a2;
  uint64_t v41 = chip_get_name(*(void *)(a2 + 16));
  expert_log(v40, 1uLL, (uint64_t)"odometer[%s:%s]: enforcing nonce hash directly", v42, v43, v44, v45, v46, v41);
  uint64_t v51 = odometer_enforce_property((uint64_t *)a2, a1, v13, (unsigned __int8 *)v68, v47, v48, v49, v50);
  if (!v51) {
    goto LABEL_9;
  }
  uint64_t v25 = v51;
  uint64_t v52 = *(void *)a2;
  uint64_t v53 = chip_get_name(*(void *)(a2 + 16));
  expert_log(v52, 0, (uint64_t)"odometer[%s:%s]: anti-replay violation: %d", v54, v55, v56, v57, v58, v53);
LABEL_7:
  if (v25 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v33, v34, v35, v36, v37, v38, v39, v25);
  }
  return v25;
}

uint64_t image4_trust_evaluate_leaf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_WORD *)(a1 + 744)) {
LABEL_23:
  }
    __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v36);
  unint64_t v11 = *(void *)(a1 + 24);
  unint64_t v10 = *(void *)(a1 + 32);
  uint64_t v12 = (uint64_t *)(a1 + 752);
  int v13 = *(unsigned __int16 *)(a1 + 1320);
  if (*(_WORD *)(a1 + 1320)) {
    uint64_t v14 = a1 + 752;
  }
  else {
    uint64_t v14 = 0;
  }
  v38[0] = xmmword_270ECAB00;
  v38[1] = *(_OWORD *)&off_270ECAB10;
  v38[2] = xmmword_270ECAB20;
  uint64_t v39 = qword_270ECAB30;
  v37[0] = a1;
  v37[1] = a3;
  expert_log(a2, 2uLL, (uint64_t)"performing leaf trust evaluation: coprocessor = %s, handle = %llx, evaluation type = %s", a4, a5, a6, a7, a8, **(void **)(v11 + 16));
  if (v11 && v11 >= v11 + 72)
  {
LABEL_22:
    __break(0x5519u);
    goto LABEL_23;
  }
  uint64_t v15 = image4_environment_resolve(v11);
  if (!v15)
  {
    uint64_t v33 = 45;
    expert_log(a2, 0, (uint64_t)"environment not supported: coprocessor = %s, handle = %llx: %d", a4, a5, a6, a7, a8, **(void **)(v11 + 16));
    return v33;
  }
  uint64_t v16 = v15;
  if (!v13 || (uint64_t v17 = payload_parse(v12), !v17))
  {
LABEL_13:
    if (v10 < v10 + 48)
    {
      image4_trust_evaluation_prepare_manifest_callbacks(v10, (uint64_t)v38);
      manifest_set_callbacks(a1 + 152, (uint64_t)v37, (uint64_t)v38);
      unint64_t v19 = manifest_parse(a1 + 152);
      if (v19)
      {
        unint64_t v25 = v19;
        expert_log(a2, 0, (uint64_t)"failed to parse manifest: %d", v20, v21, v22, v23, v24, v19);
        uint64_t v33 = v25;
      }
      else
      {
        uint64_t v34 = img4_runtime_alloc(v10);
        uint64_t v33 = manifest_impose((uint64_t *)(a1 + 152), v16, v14, v34);
        if (!v33)
        {
          _image4_trust_post_properties(a1, v26, v27, v28, v29, v30, v31, v32);
          return v33;
        }
      }
      goto LABEL_20;
    }
    goto LABEL_22;
  }
  uint64_t v18 = v17;
  if (v17 == 92 || v17 == 33)
  {
    expert_log(a2, 1uLL, (uint64_t)"treating payload as non-Image4 wrapped", a4, a5, a6, a7, a8, v36);
    goto LABEL_13;
  }
  expert_log(a2, 0, (uint64_t)"failed to parse payload: %d", a4, a5, a6, a7, a8, v17);
  uint64_t v33 = v18;
LABEL_20:
  if (v33 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v26, v27, v28, v29, v30, v31, v32, v33);
  }
  return v33;
}

uint64_t _image4_trust_property_callback_BOOL(uint64_t *a1, unsigned int *a2, uint64_t a3, char a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = _image4_trust_find_record(*a5, a3, 1, *a2, (uint64_t)a5, a6, a7, a8);
  if (!result) {
    return expert_log(*a1, 2uLL, (uint64_t)"no BOOLean record for tag: %s", v12, v13, v14, v15, v16, (uint64_t)(a2 + 1));
  }
  **(unsigned char **)(result + 24) = a4;
  uint64_t v17 = *(void **)(result + 40);
  if (v17) {
    *uint64_t v17 = *(void *)(result + 24);
  }
  return result;
}

uint64_t _image4_trust_property_callback_integer(uint64_t *a1, unsigned int *a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = _image4_trust_find_record(*a5, a3, 2, *a2, (uint64_t)a5, a6, a7, a8);
  if (!result) {
    return expert_log(*a1, 2uLL, (uint64_t)"no integer record for tag: %s", v12, v13, v14, v15, v16, (uint64_t)(a2 + 1));
  }
  **(void **)(result + 24) = a4;
  uint64_t v17 = *(void **)(result + 40);
  if (v17) {
    *uint64_t v17 = *(void *)(result + 24);
  }
  return result;
}

uint64_t _image4_trust_property_callback_data(uint64_t *a1, unsigned int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = _image4_trust_find_record(*a6, a3, 4, *a2, a5, (uint64_t)a6, a7, a8);
  if (!result) {
    return expert_log(*a1, 2uLL, (uint64_t)"no data record for tag: %s", v13, v14, v15, v16, v17, (uint64_t)(a2 + 1));
  }
  if (a4 && !a5)
  {
    __break(0x5519u);
  }
  else
  {
    **(void **)(result + 24) = a4;
    **(void **)(result + 32) = a5;
  }
  return result;
}

void _image4_trust_violation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(unsigned char *)(*(void *)a4 + 8))
  {
    char name = chip_get_name(a2);
    __panic_npx("panic: critical trust evaluation failure: chip = %s, p = %s, payload = %s", v5, v6, v7, v8, v9, v10, v11, name);
  }
}

uint64_t _image4_trust_post_properties(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = 0;
  v30[1] = *MEMORY[0x263EF8340];
  uint64_t v27 = a1 + 152;
  unint64_t v10 = a1 + 1912;
  v30[0] = 0x500000004;
  char v11 = 1;
  do
  {
    if (!*(_WORD *)(a1 + 744)) {
      __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v24);
    }
    char v26 = v11;
    uint64_t v12 = *((unsigned int *)v30 + v9);
    uint64_t v13 = *(void *)(a1 + 16);
    expert_log(v13, 2uLL, (uint64_t)"posting properties for container: 0x%x", a4, a5, a6, a7, a8, (int)v12);
    if (v12 >= 6) {
LABEL_16:
    }
      __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"p_where");
    uint64_t v14 = qword_263C0C5D8[(int)v12];
    Img4DecodeGetQueryForContainer(v12, a2, a3, a4, a5, a6, a7, a8);
    for (uint64_t i = 0; i != 576; i += 48)
    {
      uint64_t v16 = a1 + i;
      if (a1 + i + 1384 > v10)
      {
        __break(0x5519u);
LABEL_15:
        __panic_npx("panic: unsupported container for posting", a2, a3, a4, a5, a6, a7, a8, v24);
      }
      uint64_t v17 = *(unsigned int *)(v16 + 1336);
      unsigned int v18 = *(_DWORD *)(v16 + 1352);
      int v29 = 0;
      uint64_t v28 = 0;
      uint64_t result = fourcc_init((uint64_t)&v28, v18);
      if (*(void *)(v16 + 1344) == v14)
      {
        uint64_t v20 = 0;
        switch((int)v12)
        {
          case 0:
          case 1:
          case 2:
          case 3:
            goto LABEL_15;
          case 4:
            goto LABEL_10;
          case 5:
            if (!*(_WORD *)(a1 + 1320)) {
              continue;
            }
            uint64_t v20 = *(void *)(a1 + 856);
LABEL_10:
            expert_log(v13, 2uLL, (uint64_t)"posting property callback: container = %x, type = %x, tag = %s", a4, a5, a6, a7, a8, (int)v12);
            uint64_t result = manifest_post_property_callback(v27, v12, v20, v17, (unsigned int *)&v28, v21, v22, v23, v25);
            break;
          case 6:
            continue;
          default:
            goto LABEL_16;
        }
      }
    }
    char v11 = 0;
    uint64_t v9 = 1;
  }
  while ((v26 & 1) != 0);
  return result;
}

uint64_t image4_trust_evaluate_audit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_WORD *)(a1 + 744)) {
LABEL_22:
  }
    __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v40);
  unint64_t v11 = *(void *)(a1 + 24);
  unint64_t v10 = *(void *)(a1 + 32);
  uint64_t v12 = (uint64_t *)(a1 + 752);
  int v13 = *(unsigned __int16 *)(a1 + 1320);
  if (*(_WORD *)(a1 + 1320)) {
    uint64_t v14 = a1 + 752;
  }
  else {
    uint64_t v14 = 0;
  }
  v42[0] = xmmword_270ECAAC8;
  v42[1] = *(_OWORD *)&off_270ECAAD8;
  v42[2] = xmmword_270ECAAE8;
  uint64_t v43 = off_270ECAAF8;
  v41[0] = a1;
  v41[1] = a3;
  expert_log(a2, 2uLL, (uint64_t)"performing audit trust evaluation: coprocessor = %s, handle = %llx, secure boot level = %llx, evaluation type = %s", a4, a5, a6, a7, a8, **(void **)(v11 + 16));
  if (v11 && v11 >= v11 + 72)
  {
LABEL_21:
    __break(0x5519u);
    goto LABEL_22;
  }
  uint64_t v15 = image4_environment_resolve(v11);
  if (!v15)
  {
    uint64_t v33 = 45;
    expert_log(a2, 0, (uint64_t)"environment not supported: coprocessor = %s, handle = %llx: %d", a4, a5, a6, a7, a8, **(void **)(v11 + 16));
    return v33;
  }
  uint64_t v16 = v15;
  if (!v13 || (uint64_t v17 = payload_parse(v12), !v17))
  {
LABEL_12:
    if (v10 < v10 + 48)
    {
      image4_trust_evaluation_prepare_manifest_callbacks(v10, (uint64_t)v42);
      manifest_set_callbacks(a1 + 152, (uint64_t)v41, (uint64_t)v42);
      unint64_t v19 = manifest_parse(a1 + 152);
      if (v19)
      {
        unint64_t v25 = v19;
        expert_log(a2, 0, (uint64_t)"failed to parse manifest: %d", v20, v21, v22, v23, v24, v19);
        uint64_t v33 = v25;
      }
      else
      {
        uint64_t v33 = manifest_audit((uint64_t *)(a1 + 152), v16, v14);
        if (!v33)
        {
          _image4_trust_post_properties(a1, v26, v27, v28, v29, v30, v31, v32);
          expert_log(a2, 1uLL, (uint64_t)"forcing failure after audit completion: %d", v34, v35, v36, v37, v38, 0);
          return 35;
        }
      }
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  uint64_t v18 = v17;
  if (v17 == 92)
  {
    expert_log(a2, 1uLL, (uint64_t)"treating payload as non-Image4 wrapped", a4, a5, a6, a7, a8, v40);
    goto LABEL_12;
  }
  expert_log(a2, 0, (uint64_t)"failed to parse payload: %d", a4, a5, a6, a7, a8, v17);
  uint64_t v33 = v18;
LABEL_19:
  if (v33 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v26, v27, v28, v29, v30, v31, v32, v33);
  }
  return v33;
}

uint64_t _image4_trust_override_decode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return image4_auditor_interpose_decode(*(void *)(*(void *)a3 + 48), a2);
}

uint64_t _image4_trust_audit(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return image4_auditor_post(*(void *)(*(void *)a6 + 48), a2, a3, a4, a5, a6, a7, a8);
}

uint64_t image4_trust_evaluate_boot(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_WORD *)(a1 + 744)) {
LABEL_13:
  }
    __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v47);
  unint64_t v11 = *(void *)(a1 + 24);
  unint64_t v10 = *(void *)(a1 + 32);
  v49[0] = xmmword_270ECAB00;
  v49[1] = *(_OWORD *)&off_270ECAB10;
  v49[2] = xmmword_270ECAB20;
  uint64_t v50 = qword_270ECAB30;
  v48[0] = a1;
  v48[1] = a3;
  expert_log(a2, 2uLL, (uint64_t)"performing boot trust evaluation: coprocessor = %s, type = %s", a4, a5, a6, a7, a8, **(void **)(v11 + 16));
  if (v11 && v11 >= v11 + 72) {
    goto LABEL_12;
  }
  uint64_t v12 = image4_environment_resolve(v11);
  if (!v12)
  {
    uint64_t v26 = 45;
    expert_log(a2, 0, (uint64_t)"booter environment not supported: %s: %d", a4, a5, a6, a7, a8, **(void **)(v11 + 16));
    return v26;
  }
  if (v10 >= v10 + 48)
  {
LABEL_12:
    __break(0x5519u);
    goto LABEL_13;
  }
  uint64_t v13 = v12;
  image4_trust_evaluation_prepare_manifest_callbacks(v10, (uint64_t)v49);
  manifest_set_callbacks(a1 + 152, (uint64_t)v48, (uint64_t)v49);
  uint64_t v26 = boot_expert_boot_manifest(a2, v13, (uint64_t *)(a1 + 152), v14, v15, v16, v17, v18);
  if (v26)
  {
    uint64_t name = chip_get_name(v13);
    expert_log(a2, 0, (uint64_t)"manifest boot failed: %s: %d", v28, v29, v30, v31, v32, name);
    if (v26 >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v33, v34, v35, v36, v37, v38, v39, v26);
    }
  }
  else
  {
    _image4_trust_post_properties(a1, v19, v20, v21, v22, v23, v24, v25);
    uint64_t v40 = chip_get_name(v13);
    expert_log(a2, 1uLL, (uint64_t)"manifest boot succeeded: %s", v41, v42, v43, v44, v45, v40);
    expert_dump(a2);
  }
  return v26;
}

uint64_t image4_trust_evaluate_normalize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_WORD *)(a1 + 744)) {
LABEL_18:
  }
    __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v43);
  unint64_t v11 = *(void *)(a1 + 24);
  unint64_t v10 = *(void *)(a1 + 32);
  v49[0] = xmmword_270ECAB00;
  v49[1] = *(_OWORD *)&off_270ECAB10;
  v49[2] = xmmword_270ECAB20;
  uint64_t v50 = qword_270ECAB30;
  v48[0] = a1;
  v48[1] = a3;
  memset(v47, 0, sizeof(v47));
  uint64_t v46 = 0;
  long long v44 = 0u;
  long long v45 = 0u;
  expert_log(a2, 2uLL, (uint64_t)"performing normalization trust evaluation: coprocessor = %s, handle = %llx, evaluation type = %s", a4, a5, a6, a7, a8, **(void **)(v11 + 16));
  if (v11 && v11 >= v11 + 72) {
    goto LABEL_17;
  }
  uint64_t v12 = image4_environment_resolve(v11);
  if (!v12)
  {
    uint64_t v20 = 45;
    expert_log(a2, 0, (uint64_t)"environment not supported: coprocessor = %s, handle = %llx: %d", a4, a5, a6, a7, a8, **(void **)(v11 + 16));
LABEL_9:
    uint64_t v51 = &v44;
    buff_destroy(&v51);
    return v20;
  }
  if (v10 >= v10 + 48)
  {
LABEL_17:
    __break(0x5519u);
    goto LABEL_18;
  }
  uint64_t v13 = v12;
  image4_trust_evaluation_prepare_manifest_callbacks(v10, (uint64_t)v49);
  manifest_set_callbacks(a1 + 152, (uint64_t)v48, (uint64_t)v49);
  unint64_t v14 = manifest_parse(a1 + 152);
  if (v14)
  {
    uint64_t v20 = v14;
    expert_log(a2, 0, (uint64_t)"failed to parse manifest: %d", v15, v16, v17, v18, v19, v14);
    goto LABEL_12;
  }
  uint64_t v21 = (void *)closure_init((uint64_t)v47, (void *)(a1 + 152), v13);
  _closure_set_unique_tags(v21, (uint64_t)"HCNBOPECDICEDIDUhcncylpenonsfunsnvrs", 9);
  uint64_t v27 = closure_compute((uint64_t)v21, &v44, 0, v22, v23, v24, v25, v26);
  if (!v27)
  {
    if (*(_DWORD *)(a2 + 8) == 1651470196) {
      boot_expert_boot_closure(a2, (uint64_t)v21, (uint64_t)&v44);
    }
    uint64_t v20 = 0;
    *(void *)(a1 + 728) = v46;
    long long v42 = v45;
    *(_OWORD *)(a1 + 696) = v44;
    *(_OWORD *)(a1 + 712) = v42;
    *(_WORD *)(a1 + 736) = 1;
    *(void *)&long long v45 = &_buff_destructor_null;
    goto LABEL_9;
  }
  uint64_t v33 = v27;
  expert_log(a2, 0, (uint64_t)"failed to compute closure: %d", v28, v29, v30, v31, v32, v27);
  uint64_t v20 = v33;
LABEL_12:
  uint64_t v51 = &v44;
  buff_destroy(&v51);
  if (v20 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v34, v35, v36, v37, v38, v39, v40, v20);
  }
  return v20;
}

void image4_trust_new_buff(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v3 = *a3;
  uint64_t v4 = a3[1];
  if (v3 > v3 + v4) {
    __break(0x5519u);
  }
  else {
    image4_trust_new(a1, a2, v3, v4, 0);
  }
}

void image4_trust_new(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v10 = (_WORD *)_expert_alloc_type(*(void *)(a1 + 8), (uint64_t)&_image4_type_trust);
  if (v10)
  {
    _image4_trust_init(v10, a1, a2, a3, a4, a5, 1, v11);
    *(void *)(v12 + 40) = &_image4_type_trust;
  }
}

uint64_t image4_trust_set_auditor(uint64_t result, uint64_t a2)
{
  *(void *)(result + 48) = a2;
  return result;
}

void _image4_trust_init(_WORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8 = a7;
  uint64_t v9 = *(void *)(a2 + 8);
  uint64_t v23 = 0;
  memset(v22, 0, sizeof(v22));
  if (a7 >= 2) {
    __panic_npx("panic: unsupported struct version: actual = %hu, expected <= %u", a2, a3, a4, a5, a6, a7, a8, a7);
  }
  bzero(a1, 0x788uLL);
  *a1 = v8;
  *((void *)a1 + 1) = a6;
  *((void *)a1 + 2) = v9;
  *((void *)a1 + 3) = a2;
  *((void *)a1 + 4) = a3;
  *((void *)a1 + 7) = 0;
  if (a1 + 964 < a1)
  {
    __break(0x5519u);
  }
  else
  {
    _image4_trust_add_link((uint64_t)a1, (uint64_t)a1, v16, v17, v18, v19, v20, v21);
    inited = buff_init_wrap(v22, a4, a5);
    manifest_init((uint64_t)(a1 + 76), v9, &inited);
    a1[372] = 1;
  }
}

uint64_t _image4_trust_add_link(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = result + 144;
  unint64_t v9 = *(void *)(result + 144);
  if (v9 > 4) {
LABEL_9:
  }
    __panic_npx("panic: trust chain length exceeded: %lu", a2, a3, a4, a5, a6, a7, a8, 5);
  unint64_t v10 = (void *)(result + 64 + 16 * v9);
  *(void *)(result + 144) = v9 + 1;
  BOOL v11 = result + 64 > (unint64_t)v10 || (unint64_t)(v10 + 2) > v8;
  if (v11 || (*unint64_t v10 = *(void *)(result + 56), v10[1] = a2, (unint64_t)v10 >= v8))
  {
    __break(0x5519u);
    goto LABEL_9;
  }
  *(void *)(result + 56) = v10;
  return result;
}

uint64_t image4_trust_set_payload(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a1 + 16);
  int v13 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  fourcc_init((uint64_t)&v12, a2);
  inited = buff_init_wrap(v9, a3, a4);
  uint64_t result = payload_init(a1 + 752, v7, (unsigned int *)&v12, &inited);
  *(_WORD *)(a1 + 1320) = 1;
  return result;
}

uint64_t image4_trust_set_booter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = *(void **)(a1 + 32);
  if (v8[1] != *(void *)(a2 + 32)) {
    __panic_npx("panic: trust chaining not supported for evaluation: %s", a2, a3, a4, a5, a6, a7, a8, *v8);
  }

  return _image4_trust_add_link(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t image4_trust_set_result_buffer(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_WORD *)result) {
    __panic_npx("panic: operation not supported on this structure version: actual = %hu, expected >= %hu", a2, a3, a4, a5, a6, a7, a8, 0);
  }
  *(void *)(result + 1912) = a2;
  *(void *)(result + 1920) = a3;
  return result;
}

uint64_t image4_trust_record_property_BOOL(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = _image4_trust_init_next_record(a1, a2, 1, a3, a5, a6, a7, a8);
  *(void *)(result + 24) = a4;
  *(void *)(result + 40) = a5;
  return result;
}

uint64_t _image4_trust_init_next_record(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = *(void *)(a1 + 1328);
  if (v8 > 0xB) {
LABEL_9:
  }
    __panic_npx("panic: no more property record slots", a2, a3, a4, a5, a6, a7, a8, vars0);
  unint64_t v9 = a1 + 1912;
  uint64_t v10 = (_DWORD *)(a1 + 1336 + 48 * v8);
  BOOL v11 = a1 + 1336 > (unint64_t)v10 || (unint64_t)(v10 + 12) > v9;
  if (v11
    || (uint64_t v12 = a1 + 1336 + 48 * v8,
        *(void *)(v12 + 8) = a2,
        *uint64_t v10 = a3,
        *(_DWORD *)(v12 + 16) = a4,
        *(void *)(a1 + 1328) = v8 + 1,
        (unint64_t)v10 >= v9))
  {
    __break(0x5519u);
    goto LABEL_9;
  }
  return a1 + 1336 + 48 * v8;
}

uint64_t image4_trust_record_property_integer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = _image4_trust_init_next_record(a1, a2, 2, a3, a5, a6, a7, a8);
  *(void *)(result + 24) = a4;
  *(void *)(result + 40) = a5;
  return result;
}

void *image4_trust_record_property_data(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = (void *)_image4_trust_init_next_record(a1, a2, 4, a3, a5, a6, a7, a8);
  result[3] = a4;
  result[4] = a5;
  result[5] = 0;
  return result;
}

void *image4_trust_evaluate(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, const void *, size_t, uint64_t, uint64_t))
{
  uint64_t v7 = *(void **)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  bzero(&v70, 0xE70uLL);
  uint64_t v69 = v7;
  v42[0] = "boot";
  v42[1] = 0xAAAAAAAA626F6F74;
  v42[2] = &v69;
  _OWORD v42[3] = &v69;
  v42[4] = _boot_expert_init;
  v42[5] = _boot_expert_boot;
  v42[6] = _boot_expert_logv;
  v42[7] = _boot_expert_dump;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  long long v45 = _boot_expert_get_digest_info;
  uint64_t v48 = _boot_expert_get_secure_boot;
  uint64_t v49 = _boot_expert_query_chip;
  uint64_t v50 = _boot_expert_query_chip_boot;
  uint64_t v51 = _boot_expert_query_nonce;
  uint64_t v52 = _boot_expert_entangle_nonce;
  uint64_t v53 = _boot_expert_read_boot_manifest;
  uint64_t v54 = _boot_expert_query_trust_store;
  uint64_t v55 = _boot_expert_read_storage;
  uint64_t v56 = _boot_expert_write_storage;
  uint64_t v57 = _boot_expert_sync_storage;
  uint64_t v58 = _boot_expert_query_property_BOOL;
  uint64_t v59 = _boot_expert_query_property_uint32;
  uint64_t v60 = _boot_expert_query_property_uint64;
  uint64_t v61 = _boot_expert_query_property_digest;
  uint64_t v62 = _boot_expert_query_property_version;
  uint64_t v63 = _boot_expert_init_once;
  uint64_t v64 = _boot_expert_boot_once;
  uint64_t v65 = _boot_expert_read_random;
  uint64_t v66 = _boot_expert_syscall;
  char v67 = _boot_expert_lock;
  uint64_t v68 = _boot_expert_unlock;
  uint64_t v15 = image4_environment_resolve(v6);
  if (v15)
  {
    if (*(void *)(a1 + 144) > 1uLL) {
      uint64_t v7 = v42;
    }
    uint64_t v16 = *(void **)(a1 + 56);
    if (v16)
    {
      uint64_t v17 = 1;
      while (1)
      {
        unint64_t v18 = v16[1];
        uint64_t v19 = *(void *)(v18 + 32);
        if (v7 == v42)
        {
          if (!*(_WORD *)(v18 + 744)) {
            goto LABEL_38;
          }
          int v20 = *(unsigned __int16 *)(v18 + 1320);
          *(void *)(v18 + 152) = v42;
          if (v20) {
            *(void *)(v18 + 752) = v42;
          }
        }
        if (v18 >= v18 + 1928) {
          goto LABEL_37;
        }
        uint64_t v21 = (*(uint64_t (**)(void))(v19 + 40))();
        if (v21) {
          break;
        }
        uint64_t v16 = (void *)*v16;
        ++v17;
        if (!v16)
        {
          uint64_t v22 = 0;
          goto LABEL_17;
        }
      }
      uint64_t v22 = v21;
      expert_log((uint64_t)v7, 0, (uint64_t)"trust evaluation failed: coprocessor = %s, sequence number = %lu, chain length = %lu: %d", v10, v11, v12, v13, v14, **(void **)(v6 + 16));
    }
    else
    {
      uint64_t v22 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v22 = 45;
    expert_log((uint64_t)v7, 0, (uint64_t)"environment not supported: coprocessor = %s, handle = %llx: %d", v10, v11, v12, v13, v14, **(void **)(v6 + 16));
  }
LABEL_17:
  unint64_t v23 = *(void *)(a1 + 32);
  if (*(_WORD *)(a1 + 744)) {
    uint64_t v24 = a1 + 152;
  }
  else {
    uint64_t v24 = 0;
  }
  int v25 = *(unsigned __int16 *)(a1 + 1320);
  uint64_t v71 = 0;
  v72[0] = 0;
  if (v22)
  {
    uint64_t v26 = 0;
    size_t v27 = 0;
    uint64_t v28 = v22;
    goto LABEL_35;
  }
  if (v25) {
    uint64_t v29 = a1 + 752;
  }
  else {
    uint64_t v29 = 0;
  }
  unint64_t v30 = image4_trust_evaluation_get_result(v23, v15, v24, v29, (uint64_t *)v72);
  size_t v27 = v72[0];
  if (v30 > v30 + v72[0]) {
    goto LABEL_37;
  }
  uint64_t v26 = (const void *)v30;
  uint64_t v31 = v24 + 544;
  if (!*(_WORD *)(v24 + 584)) {
    uint64_t v31 = 0;
  }
  uint64_t v71 = v31;
  *(_WORD *)(v24 + 584) = 0;
  if (!v30 || (uint64_t v32 = *(void **)(a1 + 1912)) == 0)
  {
    uint64_t v28 = 0;
    goto LABEL_35;
  }
  if (*(void *)(a1 + 1920) < v27)
  {
    uint64_t v26 = 0;
    size_t v27 = 0;
    uint64_t v28 = 7;
    goto LABEL_35;
  }
  memcpy(v32, v26, v27);
  if (v27 > *(void *)(a1 + 1920))
  {
LABEL_37:
    __break(0x5519u);
LABEL_38:
    __panic_npx("panic: optional not set", v8, v9, v10, v11, v12, v13, v14, v41);
  }
  uint64_t v28 = 0;
  uint64_t v26 = *(const void **)(a1 + 1912);
LABEL_35:
  a3(a1, v26, v27, v28, a2);
  uint64_t result = buff_destroy(&v71);
  if (v22 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v34, v35, v36, v37, v38, v39, v40, v22);
  }
  return result;
}

uint64_t *image4_trust_destroy(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *result;
  if (*result)
  {
    if (!*(_WORD *)(v8 + 744)) {
      __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v12);
    }
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(v8 + 16);
    unint64_t v11 = v8 + 752;
    if (!*(_WORD *)(v8 + 1320)) {
      unint64_t v11 = 0;
    }
    unint64_t v12 = v11;
    uint64_t v13 = v8 + 152;
    manifest_destroy(&v13, a2, a3, a4, a5, a6, a7, a8);
    payload_destroy(&v12);
    return (uint64_t *)_expert_dealloc_type(v10, *(void *)(v8 + 40), v9);
  }
  return result;
}

uint64_t _image4_trust_find_record(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 0;
  uint64_t v9 = 1;
  switch((int)a2)
  {
    case 0:
      goto LABEL_5;
    case 1:
      uint64_t v9 = 2;
      goto LABEL_5;
    case 2:
    case 3:
      return v8;
    case 4:
      uint64_t v9 = 3;
      goto LABEL_5;
    case 5:
      uint64_t v9 = 4;
LABEL_5:
      uint64_t v10 = 0;
      break;
    default:
      goto LABEL_15;
  }
  while (1)
  {
    uint64_t v11 = a1 + v10;
    if (a1 + v10 + 1384 > (unint64_t)(a1 + 1912))
    {
      __break(0x5519u);
LABEL_15:
      __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"p_where");
    }
    if (*(_DWORD *)(v11 + 1352) == a4
      && *(void *)(a1 + v10 + 1344) == v9
      && *(_DWORD *)(v11 + 1336) == a3)
    {
      break;
    }
    v10 += 48;
    if (v10 == 576) {
      return 0;
    }
  }
  return a1 + v10 + 1336;
}

void *image4_identifier_init(void *result, uint64_t a2)
{
  *uint64_t result = a2;
  return result;
}

uint64_t image4_identifier_get_constraint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = **(void **)(*(void *)a1 + 48);
  if (v8 >= 9) {
    __panic_npx_3(a1, a2, a3, a4, a5, a6, a7, a8, (char)"id4->id_p->p_constraint->pc_code");
  }
  return qword_263C0C608[v8];
}

void __panic_npx_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  uint64_t v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: unreachable case: %s = 0x%llx", &a9);
  _os_crash();
  __break(1u);
}

uint64_t image4_identifier_get_constraint_cstr(uint64_t a1)
{
  return *(void *)(*(void *)(*(void *)a1 + 48) + 8);
}

uint64_t image4_identifier_get_fourcc(uint64_t a1)
{
  return *(unsigned int *)(*(void *)a1 + 24);
}

uint64_t image4_identifier_get_fourcc_cstr(void *a1)
{
  return *a1 + 28;
}

char **dylib_expert()
{
  return &__del0;
}

uint64_t dylib_expert_get_kmod_connect(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return *(unsigned int *)(*(void *)(a1 + 16) + 28);
}

size_t _darwin_el0_init(uint64_t a1)
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  unint64_t v2 = *(void *)(a1 + 24);
  memcpy(__dst, "IODeviceTree:/chosen", sizeof(__dst));
  memcpy(path, "IODeviceTree:/product", sizeof(path));
  memcpy(v81, "IODeviceTree:/chosen/manifest-properties", sizeof(v81));
  memcpy(v80, "IODeviceTree:/chosen/asmb", sizeof(v80));
  size_t v76 = 64;
  size_t v77 = 64;
  memset(v79, 0, sizeof(v79));
  v78[0] = 0;
  v78[1] = 0;
  *(void *)unint64_t v2 = os_log_create("com.apple.security.libimage4", "darwin-user");
  io_registry_entry_t v3 = IORegistryEntryFromPath(0, __dst);
  *(_DWORD *)(v2 + 12) = v3;
  if (!v3) {
LABEL_34:
  }
    __panic_npx("panic: failed to get chosen node", v4, v5, v6, v7, v8, v9, v10, v75);
  io_registry_entry_t v11 = IORegistryEntryFromPath(0, path);
  *(_DWORD *)(v2 + 16) = v11;
  if (!v11) {
    __panic_npx("panic: failed to get product node", v12, v13, v14, v15, v16, v17, v18, v75);
  }
  io_registry_entry_t v19 = IORegistryEntryFromPath(0, v81);
  *(_DWORD *)(v2 + 20) = v19;
  if (!v19) {
    __panic_npx("panic: failed to get manifest properties", v20, v21, v22, v23, v24, v25, v26, v75);
  }
  io_registry_entry_t v27 = IORegistryEntryFromPath(0, v80);
  *(_DWORD *)(v2 + 24) = v27;
  if (!v27) {
    expert_log(a1, 3uLL, (uint64_t)"no asmb", v28, v29, v30, v31, v32, v75);
  }
  unint64_t v33 = v2 + 304;
  CFDictionaryRef v34 = IOServiceMatching("AppleImage4");
  io_service_t MatchingService = IOServiceGetMatchingService(0, v34);
  if (MatchingService)
  {
    if (v2 >= v33)
    {
LABEL_33:
      __break(0x5519u);
      goto LABEL_34;
    }
    uint64_t v36 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, (io_connect_t *)(v2 + 28));
    if (v36)
    {
      expert_log(a1, 3uLL, (uint64_t)"IOServiceOpen: %d", v6, v7, v8, v9, v10, v36);
      goto LABEL_13;
    }
    uint64_t v37 = "IOServiceOpen: success";
  }
  else
  {
    uint64_t v37 = "IOServiceGetMatchingService failed";
  }
  expert_log(a1, 3uLL, (uint64_t)v37, v6, v7, v8, v9, v10, v75);
LABEL_13:
  if (v2 >= v33) {
    goto LABEL_33;
  }
  if ((sysctlbyname("kern.osreleasetype", (void *)(v2 + 144), &v77, 0, 0) & 0x80000000) == 0) {
    *__error() = 0;
  }
  int v38 = *__error();
  if (v38 != 2)
  {
    if (v38)
    {
      uint64_t v39 = __error();
      expert_log(a1, 3uLL, (uint64_t)"sysctlbyname[kern.osreleasetype]: %d", v40, v41, v42, v43, v44, *v39);
    }
    else
    {
      *(_WORD *)(v2 + 208) = 1;
    }
  }
  if ((sysctlbyname("kern.bootsessionuuid", v79, &v76, 0, 0) & 0x80000000) == 0) {
    *__error() = 0;
  }
  int v45 = *__error();
  if (v45 != 2)
  {
    if (v45)
    {
      uint64_t v51 = __error();
      expert_log(a1, 3uLL, (uint64_t)"sysctlbyname[kern.bootsessionuuid]: %d", v52, v53, v54, v55, v56, *v51);
    }
    else
    {
      if (darwin_uuid_parse(v79, (unsigned __int8 *)v78))
      {
        expert_log(a1, 3uLL, (uint64_t)"failed to parse boot session uuid: %s: %d", v46, v47, v48, v49, v50, (uint64_t)v79);
        return dylib_expert_state_init(v2 + 32);
      }
      digest_init(v2 + 216, v78, 0x10uLL, v46, v47, v48, v49, v50);
      *(_WORD *)(v2 + 296) = 1;
    }
  }
  uint64_t v57 = getenv("IMAGE4_LOG_FD");
  if (v57)
  {
    uint64_t v58 = v57;
    *__error() = 0;
    uint64_t v59 = strtol(v58, 0, 0);
    if (*__error()) {
      __panic_npx("panic: invalid log file descriptor", v60, v61, v62, v63, v64, v65, v66, v75);
    }
    if (v59 >= getdtablesize())
    {
      getdtablesize();
      __panic_npx("panic: invalid log file descriptor: actual = %ld, expected <= %d", v68, v69, v70, v71, v72, v73, v74, v59);
    }
    *(_DWORD *)(v2 + 8) = v59;
  }
  return dylib_expert_state_init(v2 + 32);
}

uint64_t _darwin_el0_boot()
{
  return 0;
}

uint64_t _darwin_el0_logv(uint64_t a1, unint64_t a2, char *a3, va_list a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  va_list v14 = a4;
  uint64_t v9 = *(void *)(a1 + 16);
  if (*(unsigned char *)(v9 + 32) || *(void *)(v9 + 48))
  {
    return dylib_restoreos_logv(a2, a3, a4, (uint64_t)a4, a5, a6, a7, a8);
  }
  else
  {
    if ((*(_DWORD *)(v9 + 8) & 0x80000000) == 0)
    {
      memset(v13, 0, sizeof(v13));
      if (vasprintf(v13, a3, v14) < 0) {
        _darwin_el0_logv_cold_1(&v15, v16);
      }
      int v11 = *(_DWORD *)(v9 + 8);
      uint64_t v12 = getprogname();
      dprintf(v11, "%s: %s\n", v12, v13[0]);
      free(v13[0]);
    }
    switch(a2)
    {
      case 0uLL:
      case 1uLL:
      case 2uLL:
      case 3uLL:
        uint64_t result = os_log_with_args();
        break;
      default:
        __panic_npx("panic: unreachable case: %s = 0x%llx", 16, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)"lvl");
    }
  }
  return result;
}

uint64_t _darwin_el0_dump(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v10 = *(void *)(a1 + 16);
  int v11 = *(unsigned __int16 *)(v10 + 296);
  memset(v35, 0, sizeof(v35));
  long long v34 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  long long v29 = 0u;
  qmemcpy(v28, "n/a", sizeof(v28));
  if (v11) {
    digest_print_cstr(v10 + 216, (unint64_t)v28, a3, a4, a5, a6, a7, a8);
  }
  expert_log(a1, a2, (uint64_t)"%6s  %-36s : 0x%llx", a4, a5, a6, a7, a8, (uint64_t)&unk_263C166AB);
  expert_log(a1, a2, (uint64_t)"%6s  %-36s : 0x%llx", v12, v13, v14, v15, v16, (uint64_t)&unk_263C166AB);
  expert_log(a1, a2, (uint64_t)"%6s  %-36s : %s", v17, v18, v19, v20, v21, (uint64_t)&unk_263C166AB);
  return expert_log(a1, a2, (uint64_t)"%6s  %-36s : %s", v22, v23, v24, v25, v26, (uint64_t)&unk_263C166AB);
}

void *_darwin_el0_alloc_type(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t handle = type_get_handle(a2);
  uint64_t size = type_get_size(a2);
  if (!handle) {
    return 0;
  }
  int64_t v5 = size;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      uint64_t result = malloc_type_calloc(1uLL, v5, 0x1B044E25uLL);
      if (result) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    uint64_t result = malloc_type_calloc(1uLL, v5, 0x61D5536CuLL);
    if (result && v5 <= 0) {
      goto LABEL_10;
    }
    if (!result) {
      goto LABEL_11;
    }
  }
  if (v5 < 1)
  {
LABEL_10:
    __break(0x5519u);
LABEL_11:
    _darwin_el0_alloc_type_cold_1(&v7, v8);
  }
  return result;
}

void _darwin_el0_dealloc_type(int a1, int a2, void *a3)
{
}

void *_darwin_el0_alloc_data(uint64_t a1, int64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      uint64_t result = malloc_type_calloc(1uLL, a2, 0x1B044E25uLL);
      if (result) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    uint64_t result = malloc_type_calloc(1uLL, a2, 0x61D5536CuLL);
    if (a2 <= 0 && result) {
LABEL_8:
    }
      __break(0x5519u);
    if (!result) {
      _darwin_el0_alloc_type_cold_1(&v4, v5);
    }
  }
  if (a2 < 1) {
    goto LABEL_8;
  }
  return result;
}

void _darwin_el0_dealloc_data(int a1, int a2, void *a3)
{
}

uint64_t _darwin_el0_get_digest_info(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t _darwin_el0_get_exception_level()
{
  return 1;
}

uint64_t _darwin_el0_get_unprivileged_limit()
{
  return 6;
}

uint64_t _darwin_el0_get_secure_boot(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  io_registry_entry_t v10 = *(_DWORD *)(*(void *)(a1 + 16) + 24);
  uint64_t v20 = 0;
  if (v10)
  {
    darwin_read_iokit_u32(v10, "lp-smb0", (_DWORD *)&v20 + 1);
    darwin_read_iokit_u32(v10, "lp-smb1", &v20);
    uint64_t v11 = (v20 + HIDWORD(v20));
    expert_log(a1, 2uLL, (uint64_t)"secure boot state: smb0 = %#x, smb1 = %#x, secure boot = %#x", v12, v13, v14, v15, v16, HIDWORD(v20));
    if (v11 >= 3) {
      __panic_npx("panic: invalid secure boot state: %#x", v17, v18, a4, a5, a6, a7, a8, v11);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  expert_log(a1, 2uLL, (uint64_t)"returning secure boot state: %#llx", a4, a5, a6, a7, a8, v11);
  *a2 = v11;
  return 0;
}

uint64_t _darwin_el0_query_chip(uint64_t a1, uint64_t a2)
{
  v40[1] = *MEMORY[0x263EF8340];
  io_registry_entry_t v4 = *(_DWORD *)(*(void *)(a1 + 16) + 12);
  v39[0] = xmmword_2655E15F8;
  v39[1] = *(_OWORD *)&off_2655E1608;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v38[2] = v5;
  _OWORD v38[3] = v5;
  v38[0] = v5;
  v38[1] = v5;
  __int16 v37 = 0;
  BOOL v36 = 0;
  darwin_read_iokit_cstr(v4, "crypto-hash-method", (char *)v38);
  expert_log(a1, 2uLL, (uint64_t)"crypto method: %s", v6, v7, v8, v9, v10, (uint64_t)v38);
  if (LODWORD(v38[0]) == 828467315)
  {
    uint64_t v18 = 0;
  }
  else
  {
    if (*(void *)&v38[0] != 0x3438332D32616873) {
      __panic_npx("panic: non-sensical crypto hash method: %s", v11, v12, v13, v14, v15, v16, v17, (char)v38);
    }
    uint64_t v18 = _img4_chip_ap_sha2_384;
  }
  *(void *)&v39[0] = v18;
  darwin_read_iokit_BOOL(v4, "use-ddi-secure-boot", (BOOL *)&v37 + 1);
  if (HIBYTE(v37))
  {
    expert_log(a1, 2uLL, (uint64_t)"%s: %#x", v19, v20, v21, v22, v23, (uint64_t)"use-ddi-secure-boot");
    *(void *)&v39[0] = _img4_chip_ap_vma2;
  }
  darwin_read_iokit_BOOL(v4, "allow-ecid-mismatch", (BOOL *)&v37);
  if ((_BYTE)v37)
  {
    expert_log(a1, 2uLL, (uint64_t)"%s: %#x", v24, v25, v26, v27, v28, (uint64_t)"allow-ecid-mismatch");
    *(void *)&v39[0] = _img4_chip_ap_vma2_clone;
  }
  darwin_read_iokit_BOOL(v4, "uses-avp-root-ca", &v36);
  if (v36)
  {
    expert_log(a1, 2uLL, (uint64_t)"%s: %#x", v29, v30, v31, v32, v33, (uint64_t)"uses-avp-root-ca");
    *(void *)&v39[0] = _chip_vma3;
  }
  long long v34 = (char *)v39 + 8 * a2;
  if (v34 >= (char *)v40 || v34 < (char *)v39) {
    __break(0x5519u);
  }
  return *(void *)v34;
}

uint64_t _darwin_el0_query_chip_boot(uint64_t a1, uint64_t a2)
{
  return chip_bin_check((uint64_t)&_darwin_el0_query_chip_boot_bin, a2, 0x2Du);
}

uint64_t _darwin_el0_query_nonce()
{
  return 2;
}

uint64_t _darwin_el0_entangle_nonce()
{
  return 78;
}

unint64_t _darwin_el0_read_boot_manifest(uint64_t a1, const char *a2, void *a3, size_t *a4)
{
  return darwin_read_iokit_node(*(_DWORD *)(*(void *)(a1 + 16) + 20), a2, a3, a4);
}

void _darwin_el0_query_trust_store(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, void *a5)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  unint64_t v5 = *(void *)(a1 + 24);
  uint64_t v36 = 0x4000;
  uint64_t v35 = 0;
  memset(v34, 0, sizeof(v34));
  uint64_t v33 = 0;
  if (a2)
  {
    *(void *)&v39[0] = v34;
    buff_destroy(v39);
    return;
  }
  uint64_t v9 = malloc_type_malloc(0x4000uLL, 0x18EC0261uLL);
  if (!v9) {
    _darwin_el0_query_trust_store_cold_1(&v38, v39);
  }
  __int16 v37 = v9;
  buff_init_xfer(v34, (uint64_t *)&v37, 0x4000, (uint64_t)&_buff_destructor_free, 0);
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 92));
  uint64_t v14 = (_WORD *)(v5 + 136);
  uint64_t v15 = (void *)(v5 + 96);
  if (*(_WORD *)(v5 + 136)) {
    goto LABEL_5;
  }
  uint64_t v20 = darwin_syscall_image_copy_active(a1, 0, (uint64_t *)v34, &v36, v10, v11, v12, v13);
  if (!v20)
  {
    uint64_t v33 = (uint64_t *)v34;
    if (v5 >= v5 + 304) {
      goto LABEL_18;
    }
    uint64_t v15 = buff_xfer((void *)(v5 + 96), &v33);
    _WORD *v14 = 1;
    uint64_t v14 = v15 + 5;
LABEL_5:
    unint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    if (v15 + 5 <= (void *)v14 && v16 <= *v15 + v17)
    {
      unsigned int v19 = 0;
      *a4 = v16;
      *a5 = v17;
      goto LABEL_12;
    }
LABEL_18:
    __break(0x5519u);
    return;
  }
  unsigned int v19 = v20;
  expert_log(a1, 0, (uint64_t)"failed to copy active cryptex0 root: %d", v21, v22, v23, v24, v25, v20);
LABEL_12:
  os_unfair_lock_assert_owner((const os_unfair_lock *)(v5 + 92));
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 92));
  *(void *)&v39[0] = v34;
  buff_destroy(v39);
  if (v19 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v26, v27, v28, v29, v30, v31, v32, v19);
  }
}

uint64_t _darwin_el0_read_storage()
{
  return 78;
}

uint64_t _darwin_el0_write_storage()
{
  return 78;
}

uint64_t _darwin_el0_sync_storage()
{
  return 78;
}

unint64_t _darwin_el0_query_property_BOOL(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  io_registry_entry_t v10 = *(_DWORD *)(*(void *)(a1 + 16) + 12);
  BOOL v26 = 0;
  size_t v25 = 4;
  uint64_t v11 = *(void *)(a3 + 16);
  int v13 = 0;
  uint64_t v14 = "certificate-production-status";
  switch(v11)
  {
    case 5:
      goto LABEL_14;
    case 6:
      int v13 = 0;
      uint64_t v14 = "certificate-security-mode";
      goto LABEL_14;
    case 7:
      int v13 = 0;
      uint64_t v14 = "effective-production-status-ap";
      goto LABEL_14;
    case 8:
      int v13 = 0;
      uint64_t v14 = "effective-security-mode-ap";
      goto LABEL_14;
    case 9:
    case 10:
    case 16:
    case 17:
      goto LABEL_22;
    case 11:
      uint64_t v14 = "mix-n-match-prevention-status";
      int v13 = 1;
      goto LABEL_14;
    case 12:
      unint64_t result = expert_compute_eieiou(a1, a2, &v26);
      if (result) {
        goto LABEL_15;
      }
      BOOL v15 = v26;
      goto LABEL_19;
    case 13:
      int v13 = 0;
      uint64_t v14 = "internal-use-only-unit";
      goto LABEL_14;
    case 14:
      int v13 = 0;
      uint64_t v14 = "engineering-use-only-unit";
      goto LABEL_14;
    case 15:
      int v13 = 0;
      uint64_t v14 = "factory-prerelease-global-trust";
      goto LABEL_14;
    case 18:
      int v13 = 0;
      uint64_t v14 = "research-enabled";
LABEL_14:
      unint64_t result = darwin_read_iokit_node(v10, v14, &v26, &v25);
      if (result)
      {
LABEL_15:
        if (result >= 0x6A) {
          __panic_npx("panic: error not set to valid posix code: %d", v17, v18, v19, v20, v21, v22, v23, result);
        }
      }
      else
      {
        BOOL v15 = v26;
        if (v13) {
          BOOL v24 = !v26;
        }
        else {
LABEL_19:
        }
          BOOL v24 = v15;
        unint64_t result = 0;
        *a4 = v24;
      }
      return result;
    default:
      if (v11 != 32) {
LABEL_22:
      }
        __panic_npx("panic: illegal %s property: %s", (uint64_t)"certificate-production-status", a3, (uint64_t)a4, a5, a6, a7, a8, *(void *)(*(void *)(a3 + 40) + 8));
      BOOL v15 = expert_compute_data_only(a1);
      goto LABEL_19;
  }
}

unint64_t _darwin_el0_query_property_uint32(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v22 = 0;
  size_t v21 = 4;
  uint64_t v9 = *(void *)(a3 + 16);
  unint64_t result = 45;
  switch(v9)
  {
    case 0:
      uint64_t v12 = (io_registry_entry_t *)(*(void *)(a1 + 16) + 12);
      int v13 = "chip-epoch";
      goto LABEL_10;
    case 1:
      uint64_t v12 = (io_registry_entry_t *)(*(void *)(a1 + 16) + 12);
      int v13 = "board-id";
      goto LABEL_10;
    case 2:
      uint64_t v12 = (io_registry_entry_t *)(*(void *)(a1 + 16) + 12);
      int v13 = "chip-id";
      goto LABEL_10;
    case 3:
      uint64_t v12 = (io_registry_entry_t *)(*(void *)(a1 + 16) + 12);
      int v13 = "security-domain";
      goto LABEL_10;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
      goto LABEL_4;
    case 19:
      uint64_t v12 = (io_registry_entry_t *)(*(void *)(a1 + 16) + 12);
      int v13 = "esdm-fuses";
      goto LABEL_10;
    case 20:
    case 21:
    case 22:
    case 24:
      return result;
    case 23:
      uint64_t v12 = (io_registry_entry_t *)(*(void *)(a1 + 16) + 16);
      int v13 = "cryptex1-product-class";
LABEL_10:
      unint64_t result = darwin_read_iokit_node(*v12, v13, &v22, &v21);
      if (result)
      {
        if (result >= 0x6A) {
          __panic_npx("panic: error not set to valid posix code: %d", v14, v15, v16, v17, v18, v19, v20, result);
        }
      }
      else
      {
        *a4 = v22;
      }
      return result;
    default:
      if (v9 != 29) {
LABEL_4:
      }
        __panic_npx("panic: illegal %s property: %s", a2, a3, (uint64_t)a4, a5, a6, a7, a8, *(void *)(*(void *)(a3 + 40) + 8));
      return result;
  }
  return result;
}

unint64_t _darwin_el0_query_property_uint64(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v20 = 8;
  uint64_t v21 = 0;
  uint64_t v9 = *(void *)(a3 + 16);
  if (v9 == 27)
  {
    io_registry_entry_t v10 = (io_registry_entry_t *)(*(void *)(a1 + 16) + 24);
    uint64_t v11 = "lp-stng";
  }
  else
  {
    if (v9 != 4) {
      __panic_npx("panic: illegal %s property: %s", a2, a3, (uint64_t)a4, a5, a6, a7, a8, *(void *)(*(void *)(a3 + 40) + 8));
    }
    io_registry_entry_t v10 = (io_registry_entry_t *)(*(void *)(a1 + 16) + 12);
    uint64_t v11 = "unique-chip-id";
  }
  unint64_t result = darwin_read_iokit_node(*v10, v11, &v21, &v20);
  if (result)
  {
    if (result >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v13, v14, v15, v16, v17, v18, v19, result);
    }
  }
  else
  {
    *a4 = v21;
  }
  return result;
}

uint64_t _darwin_el0_query_property_digest(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v11 = *(void *)(a1 + 16);
  io_registry_entry_t v12 = *(_DWORD *)(v11 + 12);
  memset(v33, 0, sizeof(v33));
  size_t __n = 64;
  v30[0] = 0;
  memset(v32, 0, sizeof(v32));
  memset(v31, 0, 38);
  size_t v28 = 38;
  v30[1] = 0;
  uint64_t v13 = *(void *)(a3 + 16);
  if (v13 <= 24)
  {
    switch(v13)
    {
      case 9:
        uint64_t v14 = expert_compute_udid(a1, (uint64_t)a2, (uint64_t)v32);
        if (!v14) {
          goto LABEL_25;
        }
        break;
      case 10:
        uint64_t v15 = "boot-manifest-hash";
LABEL_18:
        unint64_t v26 = darwin_read_iokit_node(v12, v15, v33, &__n);
LABEL_19:
        uint64_t v14 = v26;
        if (!v26)
        {
          size_t v24 = __n;
          if (__n > 0x40)
          {
            __break(0x5519u);
            JUMPOUT(0x263BE90D0);
          }
          uint64_t v23 = v33;
          goto LABEL_24;
        }
        break;
      case 16:
        uint64_t v14 = darwin_read_iokit_node(v12, "apfs-preboot-uuid", v31, &v28);
        if (!v14)
        {
          uint64_t v14 = darwin_uuid_parse(v31, (unsigned __int8 *)v30);
          if (!v14)
          {
            uint64_t v23 = v30;
            size_t v24 = 16;
LABEL_24:
            digest_init((uint64_t)v32, v23, v24, v18, v19, v20, v21, v22);
LABEL_25:
            digest_copy(a4, (uint64_t)v32, v17, v18, v19, v20, v21, v22);
            return 0;
          }
        }
        break;
      default:
LABEL_30:
        __panic_npx("panic: illegal %s property: %s", (uint64_t)a2, a3, a4, a5, a6, a7, a8, *(void *)(*(void *)(a3 + 40) + 8));
    }
LABEL_20:
    if (v14 >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v16, v17, v18, v19, v20, v21, v22, v14);
    }
    return v14;
  }
  uint64_t v14 = 45;
  switch(v13)
  {
    case 25:
      io_registry_entry_t v12 = *(_DWORD *)(v11 + 24);
      uint64_t v15 = "lp-spih";
      goto LABEL_18;
    case 26:
      return v14;
    case 28:
      uint64_t v25 = darwin_copy_kcinstall_nonce_hash(a1, a2);
      if (!v25) {
        goto LABEL_25;
      }
      uint64_t v14 = v25;
      if (v25 == 96)
      {
        unint64_t v26 = darwin_syscall_nonce_copy_hash(a1, (int *)a2, -1, v33, &__n);
        goto LABEL_19;
      }
      expert_log(a1, 0, (uint64_t)"failed to copy kcinstall nonce hash: %d", v18, v19, v20, v21, v22, v25);
      if (!v14) {
        goto LABEL_25;
      }
      goto LABEL_20;
    case 30:
      if (*(_WORD *)(v11 + 296))
      {
        digest_copy((uint64_t)v32, v11 + 216, a3, a4, a5, a6, a7, a8);
        goto LABEL_25;
      }
      uint64_t v14 = 2;
      break;
    default:
      goto LABEL_30;
  }
  return v14;
}

uint64_t _darwin_el0_query_property_version(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  memset(v22, 0, 64);
  size_t v19 = 64;
  uint64_t v21 = 0x3E800000000;
  memset(v20, 0, sizeof(v20));
  if (*(void *)(a3 + 16) != 17) {
    __panic_npx("panic: illegal %s property: %s", a2, a3, a4, a5, a6, a7, a8, *(void *)(*(void *)(a3 + 40) + 8));
  }
  uint64_t boot_manifest = expert_read_boot_manifest(a1, (uint64_t)"love", (uint64_t)v22, (uint64_t)&v19);
  uint64_t v17 = boot_manifest;
  if (boot_manifest)
  {
    if (boot_manifest >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v10, v11, v12, v13, v14, v15, v16, boot_manifest);
    }
  }
  else
  {
    version_init((uint64_t)v20, v22, v19);
    version_copy(a4, v20);
  }
  return v17;
}

uint64_t _darwin_el0_init_once(uint64_t result)
{
  uint64_t v2 = result;
  uint64_t v3 = 0;
  if (_darwin_el0_init_once_once != -1)
  {
    uint64_t v1 = result;
    dispatch_once_f(&_darwin_el0_init_once_once, &v2, (dispatch_function_t)_darwin_el0_init_once_tramp);
    unint64_t result = v3;
    if (v3)
    {
      expert_init(v3);
      return expert_dump(v1);
    }
  }
  return result;
}

uint64_t _darwin_el0_boot_once(uint64_t a1)
{
  if (_darwin_el0_boot_once_once != -1) {
    dispatch_once_f(&_darwin_el0_boot_once_once, &__del0, (dispatch_function_t)_darwin_el0_boot_once_tramp);
  }
  return *(unsigned int *)(*(void *)(a1 + 16) + 88);
}

uint64_t _darwin_el0_syscall(uint64_t a1, uint64_t a2, void *a3, size_t a4, void *a5, size_t *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v27 = *(void *)a2;
  size_t v28 = *a6;
  uint64_t result = expert_log(a1, 2uLL, (uint64_t)"syscall: %s", a4, (uint64_t)a5, (uint64_t)a6, a7, a8, v27);
  if (v28 > *a6)
  {
    __break(0x5519u);
  }
  else
  {
    if (!sysctl((int *)(a2 + 12), *(_DWORD *)(a2 + 32), a5, &v28, a3, a4)) {
      return 0;
    }
    uint64_t v15 = *__error();
    dylib_expert_record_trap_error(a1, a2, (uint64_t)"sysctl", v15, v16, v17, v18, v19);
    if (v15 >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v20, v21, v22, v23, v24, v25, v26, v15);
    }
    return v15;
  }
  return result;
}

uint64_t _darwin_el0_init_once_tramp(uint64_t *a1)
{
  uint64_t v1 = *a1;
  a1[1] = (uint64_t)generic_expert();

  return dylib_init(v1);
}

uint64_t _darwin_el0_boot_once_tramp(uint64_t a1)
{
  uint64_t result = expert_boot(a1);
  *(_DWORD *)(*(void *)(a1 + 24) + 88) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_2(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

void _prepare_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v20[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(*(void *)a3 + 24);
  uint64_t v5 = *(void *)(v4 + 8);
  v20[0] = 0;
  v20[1] = 0;
  size_t __n = 0;
  memset(v19, 0, sizeof(v19));
  uint64_t boot_nonce = image4_environment_callout_query_boot_nonce(v4, (uint64_t)v20, (uint64_t)&__n);
  if (boot_nonce)
  {
    if (boot_nonce != 45) {
      expert_log(v5, 0, (uint64_t)"failed to get nonce digest from callback: %d", v7, v8, v9, v10, v11, boot_nonce);
    }
  }
  else if (__n > 0x10)
  {
    __break(0x5519u);
  }
  else
  {
    nonce_init(v19, v20, __n, v7, v8, v9, v10, v11);
    odometer_prepare_nonce(a2, v19, v12, v13, v14, v15, v16, v17);
  }
}

uint64_t _get_constraint_mask_1()
{
  return 0;
}

uint64_t _extract_payload_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = 0;
  memset(v7, 0, sizeof(v7));
  payload_get_decoded_bytes(a4, (uint64_t)v7);
  uint64_t result = *(void *)&v7[0];
  *a5 = *((void *)&v7[0] + 1);
  return result;
}

uint64_t img4_chip_init_from_buff(uint64_t a1, unint64_t a2)
{
  uint64_t result = img4_runtime_get_expert(_img4_runtime_default);
  if (a2 == 384)
  {
    uint64_t v12 = result;
    uint64_t v13 = _expert_alloc_type(result, (uint64_t)&_image4_type_custom_chip);
    if (!v13) {
      goto LABEL_8;
    }
    a1 = v13;
    *(void *)(v13 + 720) = v12;
    return a1;
  }
  if (a2)
  {
    *(void *)(a1 + 720) = 0;
    if (a2 <= 0x2D7) {
LABEL_8:
    }
      __panic_npx("panic: object overflows buffer: object = chip, length = %lu, required = %lu", v5, v6, v7, v8, v9, v10, v11, a2);
    return a1;
  }
  __break(0x5519u);
  return result;
}

uint64_t img4_chip_select_categorized_ap()
{
  return 0;
}

unint64_t img4_chip_select_cryptex1_boot()
{
  unint64_t result = img4_chip_select_effective_ap();
  uint64_t v1 = *(void *)(result + 104);
  if (v1) {
    return *(void *)v1;
  }
  if (result < result + 264)
  {
    char name = chip_get_name(result);
    __panic_npx("panic: no cryptex1 guests for %s", v3, v4, v5, v6, v7, v8, v9, name);
  }
  __break(0x5519u);
  return result;
}

unint64_t img4_chip_select_cryptex1_preboot()
{
  unint64_t result = img4_chip_select_effective_ap();
  uint64_t v1 = *(void *)(result + 104);
  if (v1) {
    return *(void *)(v1 + 16);
  }
  if (result < result + 264)
  {
    char name = chip_get_name(result);
    __panic_npx("panic: no cryptex1 guests for %s", v3, v4, v5, v6, v7, v8, v9, name);
  }
  __break(0x5519u);
  return result;
}

unint64_t img4_chip_get_cryptex1_boot(unint64_t result)
{
  uint64_t v1 = *(void *)(result + 104);
  if (v1) {
    return *(void *)v1;
  }
  if (result + 264 >= result)
  {
    char name = chip_get_name(result);
    __panic_npx("panic: no cryptex1 guests for %s", v3, v4, v5, v6, v7, v8, v9, name);
  }
  __break(0x5519u);
  return result;
}

unint64_t img4_chip_get_cryptex1_boot_proposal(unint64_t result)
{
  uint64_t v1 = *(void *)(result + 104);
  if (v1) {
    return *(void *)(v1 + 8);
  }
  if (result + 264 >= result)
  {
    char name = chip_get_name(result);
    __panic_npx("panic: no cryptex1 guests for %s", v3, v4, v5, v6, v7, v8, v9, name);
  }
  __break(0x5519u);
  return result;
}

uint64_t img4_chip_instantiate(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t expert = img4_runtime_get_expert(_img4_runtime_default);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  memset(v19, 0, sizeof(v19));
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t result = expert_runtime_boot(expert);
  if (result
    || (uint64_t result = chip_instance_instantiate((unint64_t)&v16, expert, a1, v8, v9, v10, v11, v12), result))
  {
    if (result >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v6, v7, v8, v9, v10, v11, v12, result);
    }
  }
  else
  {
    *(void *)(a2 + 8) = a1;
    *(void *)(a2 + 16) = 0;
    *(_OWORD *)(a2 + 24) = v17;
    *(void *)(a2 + 40) = v18;
    *(_DWORD *)(a2 + 48) = DWORD2(v18);
    img4_dgst_init_from_digest(a2 + 64, (uint64_t)v19, v7, v8, v9, v10, v11, v12);
    uint64_t v13 = 0;
    *(_OWORD *)(a2 + 128) = v20;
    *(unsigned char *)(a2 + 52) = BYTE12(v21);
    *(unsigned char *)(a2 + 54) = BYTE13(v21);
    *(unsigned char *)(a2 + 60) = BYTE14(v21);
    *(_DWORD *)(a2 + 56) = DWORD2(v21);
    *(unsigned char *)(a2 + 53) = HIBYTE(v21);
    do
    {
      uint64_t v14 = __omit_map[(void)v13];
      if (v14)
      {
        uint64_t v15 = property_find_from_expert(v13);
        if (!v15 || ((unint64_t)v15[9] & *((void *)&v16 + 1)) == 0) {
          *(void *)(a2 + 16) |= v14;
        }
      }
      uint64_t v13 = (char **)((char *)v13 + 1);
    }
    while (v13 != (char **)34);
    return 0;
  }
  return result;
}

uint64_t img4_chip_custom(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(const void **)(a1 + 8);
  memset(&v24[8], 0, 120);
  long long v22 = (unint64_t)v8;
  long long v23 = *(_OWORD *)(a1 + 24);
  *(void *)uint64_t v24 = *(void *)(a1 + 40);
  *(_DWORD *)&v24[8] = *(_DWORD *)(a1 + 48);
  size_t v9 = *(void *)(a1 + 72);
  if (v9 >= 0x31) {
    goto LABEL_10;
  }
  unint64_t v12 = a2 + 264;
  unint64_t v13 = a2 + 720;
  digest_init((uint64_t)&v24[16], (const void *)(a1 + 80), v9, a4, a5, a6, a7, a8);
  uint64_t v14 = 0;
  *(_OWORD *)&v24[96] = *(_OWORD *)(a1 + 128);
  v24[124] = *(unsigned char *)(a1 + 52);
  v24[125] = *(unsigned char *)(a1 + 54);
  v24[126] = *(unsigned char *)(a1 + 60);
  *(_DWORD *)&v24[120] = *(_DWORD *)(a1 + 56);
  v24[127] = *(unsigned char *)(a1 + 53);
  do
  {
    uint64_t v15 = __omit_map[(void)v14];
    if (v15)
    {
      long long v16 = property_find_from_expert(v14);
      if (v16)
      {
        if ((*(void *)(a1 + 16) & v15) == 0) {
          *((void *)&v22 + 1) |= (unint64_t)v16[9];
        }
      }
    }
    uint64_t v14 = (char **)((char *)v14 + 1);
  }
  while (v14 != (char **)34);
  memcpy((void *)a2, v8, 0x108uLL);
  *(void *)(a2 + 16) = 3;
  if (v12 >= v13) {
LABEL_10:
  }
    __break(0x5519u);
  *(void *)(a2 + 264) = "custom chip";
  *(_DWORD *)(a2 + 272) = 1667787120;
  *(void *)(a2 + 280) = a2 + 712;
  *(void *)(a2 + 288) = a2 + 712;
  *(void *)(a2 + 296) = _chip_expert_init;
  *(void *)(a2 + 304) = _chip_expert_boot;
  *(void *)(a2 + 312) = _chip_expert_logv;
  *(void *)(a2 + 320) = _chip_expert_dump;
  *(_OWORD *)(a2 + 328) = 0u;
  *(_OWORD *)(a2 + 344) = 0u;
  *(void *)(a2 + 368) = 0;
  *(void *)(a2 + 376) = 0;
  *(void *)(a2 + 360) = _chip_expert_get_digest_info;
  *(void *)(a2 + 384) = _chip_expert_get_secure_boot;
  *(void *)(a2 + 392) = _chip_expert_query_chip;
  *(void *)(a2 + 400) = _chip_expert_query_chip_boot;
  *(void *)(a2 + 408) = _chip_expert_query_nonce;
  *(void *)(a2 + 416) = _chip_expert_entangle_nonce;
  *(void *)(a2 + 424) = _chip_expert_read_boot_manifest;
  *(void *)(a2 + 432) = _chip_expert_query_trust_store;
  *(void *)(a2 + 440) = _chip_expert_read_storage;
  *(void *)(a2 + 448) = _chip_expert_write_storage;
  *(void *)(a2 + 456) = _chip_expert_sync_storage;
  *(void *)(a2 + 464) = _chip_expert_query_property_BOOL;
  *(void *)(a2 + 472) = _chip_expert_query_property_uint32;
  *(void *)(a2 + 480) = _chip_expert_query_property_uint64;
  *(void *)(a2 + 488) = _chip_expert_query_property_digest;
  *(void *)(a2 + 496) = _chip_expert_query_property_version;
  *(void *)(a2 + 504) = _chip_expert_init_once;
  *(void *)(a2 + 512) = _chip_expert_boot_once;
  *(void *)(a2 + 520) = _chip_expert_read_random;
  *(void *)(a2 + 528) = _chip_expert_syscall;
  *(void *)(a2 + 536) = _chip_expert_lock;
  *(void *)(a2 + 544) = _chip_expert_unlock;
  *(_OWORD *)(a2 + 552) = v22;
  *(_OWORD *)(a2 + 568) = v23;
  long long v17 = *(_OWORD *)&v24[48];
  *(_OWORD *)(a2 + 616) = *(_OWORD *)&v24[32];
  *(_OWORD *)(a2 + 632) = v17;
  long long v18 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a2 + 584) = *(_OWORD *)v24;
  *(_OWORD *)(a2 + 600) = v18;
  long long v19 = *(_OWORD *)&v24[112];
  *(_OWORD *)(a2 + 680) = *(_OWORD *)&v24[96];
  *(_OWORD *)(a2 + 696) = v19;
  long long v20 = *(_OWORD *)&v24[80];
  *(_OWORD *)(a2 + 648) = *(_OWORD *)&v24[64];
  *(_OWORD *)(a2 + 664) = v20;
  *(void *)(a2 + 712) = a2 + 552;
  *(void *)(a2 + 112) = v12;
  return a2;
}

uint64_t img4_chip_select_personalized_ap()
{
  uint64_t v0 = generic_expert_specialist();

  return expert_query_chip(v0, 0);
}

uint64_t img4_chip_select_personalized_sep()
{
  return 0;
}

uint64_t img4_chip_select_effective_ap()
{
  uint64_t v0 = generic_expert_specialist();
  uint64_t v3 = 0;
  if (expert_get_secure_boot(v0, (uint64_t)&v3))
  {
    uint64_t v1 = 0;
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v1 = v3;
  }
  return expert_query_chip(v0, v1);
}

void *img4_buff_dealloc(void *result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t (*)(void *))result[3];
    if (v1)
    {
      if (result[2]) {
        BOOL v2 = 1;
      }
      else {
        BOOL v2 = result[1] == 0;
      }
      if (v2) {
        return (void *)v1(&_img4_runtime_default);
      }
      else {
        __break(0x5519u);
      }
    }
  }
  return result;
}

uint64_t img4_runtime_execute_object(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 104))();
}

uint64_t img4_runtime_copy_object(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 112))();
}

void *img4_runtime_find_object_spec(int a1)
{
  uint64_t v1 = &_img4_runtime_object_spec_local_policy;
  if (a1 != 1819307884) {
    uint64_t v1 = 0;
  }
  if (a1 == 1634756974) {
    return &_img4_runtime_object_spec_supplemental_root;
  }
  else {
    return v1;
  }
}

uint64_t img4_buff_init_from_buff(uint64_t result, void *a2)
{
  *(_WORD *)uint64_t result = 0;
  uint64_t v2 = a2[1];
  if (*a2 > (unint64_t)(*a2 + v2))
  {
    __break(0x5519u);
  }
  else
  {
    *(void *)(result + 8) = *a2;
    *(void *)(result + 16) = v2;
    *(void *)(result + 24) = 0;
  }
  return result;
}

__n128 img4_buff_steal(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  *(void *)(a2 + 24) = 0;
  return result;
}

uint64_t img4_buff_dealloc_internal(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)*a2;
  if (*a2)
  {
    long long v3 = (uint64_t (*)(void))v2[3];
    if (v3)
    {
      if (v2[2]) {
        BOOL v5 = 1;
      }
      else {
        BOOL v5 = v2[1] == 0;
      }
      if (v5)
      {
        uint64_t result = v3();
        *a2 = 0;
      }
      else
      {
        __break(0x5519u);
      }
    }
  }
  return result;
}

uint64_t img4_nonce_init_from_digest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_WORD *)a1 = 0;
  *(_DWORD *)(a1 + 52) = 48;
  digest_copy_out32(a2, (void *)(a1 + 2), (_DWORD *)(a1 + 52), a4, a5, a6, a7, a8);
  return a1;
}

uint64_t digest_init_from_img4_dgst(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8 = *(void *)(a2 + 8);
  if (v8 < 0x31) {
    return digest_init(result, (const void *)(a2 + 16), v8, a4, a5, a6, a7, a8);
  }
  __break(0x5519u);
  return result;
}

uint64_t digest_init_from_img4_nonce(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8 = *(unsigned int *)(a2 + 52);
  if (v8 < 0x31) {
    return digest_init(result, (const void *)(a2 + 2), v8, a4, a5, a6, a7, a8);
  }
  __break(0x5519u);
  return result;
}

uint64_t img4_dgst_init_from_digest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_WORD *)a1 = 0;
  *(void *)(a1 + 8) = 48;
  digest_copy_out(a2, (void *)(a1 + 16), (size_t *)(a1 + 8), a4, a5, a6, a7, a8);
  return a1;
}

void *buff_init_from_img4_buff(void *a1, uint64_t a2)
{
  return buff_init_wrap(a1, *(void *)(a2 + 8), *(void *)(a2 + 16));
}

uint64_t img4_runtime_init(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t img4_runtime_alloc(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 24))();
}

uint64_t img4_runtime_dealloc(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t img4_runtime_log_handle(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 48))();
}

uint64_t img4_runtime_get_identifier_BOOL(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 56))();
}

uint64_t img4_runtime_get_identifier_uint32(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 64))();
}

uint64_t img4_runtime_get_identifier_uint64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 72))();
}

uint64_t img4_runtime_get_identifier_digest(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 80))();
}

uint64_t img4_runtime_get_identifier_cstr(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 96))();
}

uint64_t img4_runtime_alloc_type(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 120))();
}

uint64_t img4_runtime_dealloc_type(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 128))();
}

uint64_t img4_runtime_set_nonce(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 136))();
}

uint64_t img4_runtime_roll_nonce(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 144))();
}

uint64_t img4_runtime_copy_nonce(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 152))();
}

void _darwin_runtime_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void *_darwin_runtime_alloc(uint64_t a1, int64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      uint64_t result = malloc_type_calloc(1uLL, a2, 0x1B044E25uLL);
      if (result) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    uint64_t result = malloc_type_calloc(1uLL, a2, 0x61D5536CuLL);
    if (a2 <= 0 && result) {
LABEL_8:
    }
      __break(0x5519u);
    if (!result) {
      _darwin_runtime_alloc_cold_1(&v4, v5);
    }
  }
  if (a2 < 1) {
    goto LABEL_8;
  }
  return result;
}

void _darwin_runtime_dealloc(int a1, void *a2)
{
}

void _darwin_runtime_log(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _darwin_runtime_log_handle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t _darwin_runtime_get_identifier_BOOL()
{
  return 0;
}

void _darwin_runtime_get_identifier_uint32(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _darwin_runtime_get_identifier_uint64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t _darwin_runtime_get_identifier_digest()
{
  return 0;
}

void _darwin_runtime_get_identifier_cstr(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t _darwin_runtime_execute_object(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = dylib_expert();
  uint64_t v43 = 0;
  memset(v42, 0, sizeof(v42));
  uint64_t v41 = 0;
  memset(v40, 0, sizeof(v40));
  char v37 = 2;
  uint64_t v38 = *a2;
  memset(v39, 170, sizeof(v39));
  char v32 = 2;
  uint64_t v33 = v38;
  uint64_t v34 = 0;
  uint64_t v36 = 0;
  uint64_t v35 = 0;
  size_t v31 = 33;
  buff_init_from_img4_buff(v42, a3);
  if (a4) {
    uint64_t v8 = a4;
  }
  else {
    uint64_t v8 = a3;
  }
  buff_init_from_img4_buff(v40, v8);
  v39[0] = *(void *)&v42[0];
  LODWORD(v39[1]) = buff_get_length_uint32((uint64_t)v42, v9, v10, v11, v12, v13, v14, v15);
  *(void *)((char *)&v39[1] + 4) = *(void *)&v40[0];
  HIDWORD(v39[2]) = buff_get_length_uint32((uint64_t)v40, v16, v17, v18, v19, v20, v21, v22);
  uint64_t result = dylib_expert_call_method((uint64_t)v7, 0xDuLL, &v37, 0x21uLL, &v32, &v31);
  if (result >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v24, v25, v26, v27, v28, v29, v30, result);
  }
  return result;
}

uint64_t _darwin_runtime_copy_object(uint64_t a1, uint64_t *a2, uint64_t a3, void *a4)
{
  uint64_t v7 = dylib_expert();
  char v39 = 1;
  uint64_t v15 = *a2;
  uint64_t v40 = *a2;
  unint64_t v16 = *(void *)(a3 + 16);
  if (v16) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = *(void *)(a3 + 8) == 0;
  }
  if (!v17)
  {
    __break(0x5519u);
    goto LABEL_13;
  }
  uint64_t v41 = *(void *)(a3 + 8);
  if (HIDWORD(v16)) {
LABEL_13:
  }
    __panic_npx("panic: integer cast overflow: v = %s, actual = %llu, expected <= %llu", v8, v9, v10, v11, v12, v13, v14, (char)"payload->i4b_len");
  uint64_t v18 = (uint64_t)v7;
  int v42 = v16;
  char v35 = 1;
  uint64_t v36 = v15;
  uint64_t v37 = 0;
  unsigned int v38 = 0;
  size_t v34 = 21;
  uint64_t v19 = expert_runtime_boot((uint64_t)v7);
  if (v19)
  {
    uint64_t v25 = v19;
    expert_log(v18, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v20, v21, v22, v23, v24, v19);
  }
  else
  {
    uint64_t v25 = dylib_expert_call_method(v18, 0xFuLL, &v39, 0x15uLL, &v35, &v34);
    if (!v25)
    {
      *a4 = v38;
      return v25;
    }
  }
  if (v25 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v26, v27, v28, v29, v30, v31, v32, v25);
  }
  return v25;
}

void _darwin_runtime_alloc_type(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _darwin_runtime_dealloc_type(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _darwin_runtime_set_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _darwin_runtime_roll_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _darwin_runtime_copy_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t darwin_copy_kcinstall_nonce_hash(uint64_t a1, char *a2)
{
  if (a2 != _chip_ap_kcinstall) {
    return 96;
  }
  __break(0x5519u);
  return result;
}

uint64_t chip_bin_find_entry(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0;
  for (uint64_t i = 0; ; ++i)
  {
    uint64_t v6 = *(void *)(a1 + v4);
    if (!v6) {
      return 0;
    }
    if (*(void *)(a2 + 16) == 3)
    {
      int v7 = strcmp(*(const char **)(a2 + 8), *(const char **)(v6 + 8));
      if (v6 == a2 || v7 == 0) {
        return a1 + v4;
      }
      goto LABEL_11;
    }
    if (v6 == a2) {
      break;
    }
LABEL_11:
    v4 += 24;
    if (v4 == 576) {
      return 0;
    }
  }
  return a1 + 24 * i;
}

_DWORD *chip_bin_find_by_fourcc(uint64_t a1, int a2)
{
  uint64_t v2 = 0;
  while (1)
  {
    long long v3 = *(_DWORD **)(a1 + v2);
    if (!v3 || *v3 == a2) {
      break;
    }
    v2 += 24;
    if (v2 == 576) {
      return 0;
    }
  }
  return v3;
}

uint64_t chip_bin_find_by_name(uint64_t a1, char *__s2)
{
  uint64_t v4 = 0;
  while (1)
  {
    uint64_t v5 = *(void *)(a1 + v4);
    if (!v5 || !strcmp(*(const char **)(v5 + 8), __s2)) {
      break;
    }
    v4 += 24;
    if (v4 == 576) {
      return 0;
    }
  }
  return v5;
}

uint64_t chip_bin_find_by_handle(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  while (1)
  {
    uint64_t v3 = *(void *)(a1 + v2);
    if (!v3 || *(void *)(a1 + v2 + 8) == a2) {
      break;
    }
    v2 += 24;
    if (v2 == 576) {
      return 0;
    }
  }
  return v3;
}

uint64_t chip_bin_check(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (chip_bin_find_entry(a1, a2)) {
    return 0;
  }
  else {
    return a3;
  }
}

uint64_t _chip_bin_get_data(uint64_t a1, uint64_t a2)
{
  uint64_t result = chip_bin_find_entry(a1, a2);
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

uint64_t _manifest_impose_internal(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (**a5)(unsigned int a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  v114[0] = a1;
  v114[1] = a2;
  v114[2] = a3;
  v114[3] = a4;
  uint64_t v115 = 0;
  long long v116 = 0;
  v114[4] = a5;
  long long v117 = _manifest_evaluate_trust_payload;
  unint64_t v118 = 0xAAAAAAAAFFFFFFFFLL;
  uint64_t v112 = 0;
  uint64_t v113 = 0;
  uint64_t v8 = *a1;
  uint64_t v9 = a1[1];
  if (a3)
  {
    uint64_t v10 = "payload";
  }
  else
  {
    long long v117 = _manifest_evaluate_trust_manifest;
    uint64_t v10 = "manifest";
  }
  unint64_t alloc_preference = _type_get_alloc_preference((uint64_t)&_image4_type_decode_context);
  if (alloc_preference <= 1) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = alloc_preference;
  }
  if (v19 == 1) {
    goto LABEL_11;
  }
  if (v19 != 2) {
    goto LABEL_48;
  }
  uint64_t v20 = _expert_alloc_type(v8, (uint64_t)&_image4_type_decode_context);
  if (!v20)
  {
LABEL_11:
    uint64_t size = type_get_size((uint64_t)&_image4_type_decode_context);
    unint64_t v36 = MEMORY[0x270FA5388](size, v29, v30, v31, v32, v33, v34, v35);
    uint64_t v26 = (char *)&v112 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v36 >= 0x31) {
      size_t v37 = v36 - 48;
    }
    else {
      size_t v37 = 0;
    }
    memset(v26 + 48, 170, v37);
    *(_OWORD *)uint64_t v26 = 0u;
    *((_OWORD *)v26 + 1) = 0u;
    *((_OWORD *)v26 + 2) = 0u;
    uint64_t v27 = "stack";
  }
  else
  {
    uint64_t v26 = (char *)v20;
    uint64_t v112 = v20;
    uint64_t v27 = "heap";
  }
  *((_OWORD *)v26 + 1) = 0u;
  *((_OWORD *)v26 + 2) = 0u;
  *(_OWORD *)uint64_t v26 = 0u;
  expert_log(*a1, 1uLL, (uint64_t)"decode context allocated on %s", v21, v22, v23, v24, v25, (uint64_t)v27);
  uint64_t v38 = chip_select_decode(a2);
  uint64_t v115 = v38;
  if (!v38)
  {
    uint64_t v85 = *a1;
    uint64_t v84 = 82;
    expert_log(v85, 0, (uint64_t)"chip environment not booted: %s: %d", v39, v40, v41, v42, v43, *(void *)(a2 + 8));
    goto LABEL_44;
  }
  if (v9)
  {
    uint64_t v44 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v9 + 40);
    if (v44)
    {
      uint64_t v45 = v44(a1, v38, a1[2]);
      if (v45)
      {
        uint64_t v115 = v45;
        *(void *)uint64_t v26 = v45;
      }
    }
  }
  unint64_t v46 = _type_get_alloc_preference((uint64_t)&_image4_type_odometer);
  if (v46 <= 1) {
    uint64_t v47 = 1;
  }
  else {
    uint64_t v47 = v46;
  }
  if (v47 == 1) {
    goto LABEL_27;
  }
  if (v47 != 2) {
LABEL_48:
  }
    __panic_npx("panic: unreachable case: %s = 0x%llx", v12, v13, v14, v15, v16, v17, v18, (char)"_t_preference");
  uint64_t v48 = _expert_alloc_type(v8, (uint64_t)&_image4_type_odometer);
  if (v48)
  {
    uint64_t v54 = (char *)v48;
    uint64_t v113 = v48;
    uint64_t v55 = "heap";
    goto LABEL_31;
  }
LABEL_27:
  uint64_t v56 = type_get_size((uint64_t)&_image4_type_odometer);
  unint64_t v64 = MEMORY[0x270FA5388](v56, v57, v58, v59, v60, v61, v62, v63);
  uint64_t v54 = (char *)&v112 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v64 >= 0x3D1) {
    size_t v65 = v64 - 976;
  }
  else {
    size_t v65 = 0;
  }
  memset(v54 + 976, 170, v65);
  bzero(v54, 0x3D0uLL);
  uint64_t v55 = "stack";
LABEL_31:
  expert_log(*a1, 1uLL, (uint64_t)"odometer allocated on %s", v49, v50, v51, v52, v53, (uint64_t)v55);
  odometer_init((uint64_t)v54, *a1, (uint64_t)a1, a2);
  char v67 = v66;
  long long v116 = v66;
  uint64_t v75 = odometer_prepare(v66, v68, v69, v70, v71, v72, v73, v74);
  if (v75)
  {
    uint64_t v83 = v75;
    expert_log(*a1, 0, (uint64_t)"failed to prepare anti-replay: %d", v78, v79, v80, v81, v82, v75);
    uint64_t v84 = v83;
    goto LABEL_44;
  }
  if (v9 && *(void *)(v9 + 32))
  {
    expert_log(*a1, 2uLL, (uint64_t)"calling out to manifest prepare function", v78, v79, v80, v81, v82, v112);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 32))(a1, v67, a1[2]);
  }
  *((void *)v26 + 5) = v114;
  uint64_t v86 = *a1;
  if (*a5 != _manifest_validate_property && *a5 != _manifest_audit_property) {
    __panic_npx("panic: unreachable", v76, v77, v78, v79, v80, v81, v82, v112);
  }
  chip_get_name(a2);
  expert_log(v86, 1uLL, (uint64_t)"performing trust evaluation: type = %s %s, chip = %s, chip type = 0x%llx, chip uint64_t expert = %s, payload = %s", v87, v88, v89, v90, v91, (uint64_t)v10);
  if (((unsigned int (*)(uint64_t *, void *, char *))v117)(a1, v114, v26))
  {
    uint64_t v97 = v118;
    expert_log(*a1, 0, (uint64_t)"trust evaluation failed: %d", v92, v93, v94, v95, v96, v118);
LABEL_43:
    uint64_t v84 = v97;
    goto LABEL_44;
  }
  uint64_t v97 = odometer_enforce((unint64_t)v116);
  uint64_t v103 = *a1;
  if (v97)
  {
    expert_log(v103, 0, (uint64_t)"manifest replay denied: %d", v98, v99, v100, v101, v102, v97);
    goto LABEL_43;
  }
  expert_log(v103, 2uLL, (uint64_t)"trust evaluation succeeded; manifest is live", v98, v99, v100, v101, v102, v112);
  uint64_t v84 = 0;
LABEL_44:
  _expert_dealloc_type(v8, (uint64_t)&_image4_type_decode_context, &v112);
  _expert_dealloc_type(v8, (uint64_t)&_image4_type_odometer, &v113);
  if (v84 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v104, v105, v106, v107, v108, v109, v110, v84);
  }
  return v84;
}

uint64_t _manifest_evaluate_trust_payload(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_WORD *)(a1 + 528)) {
    __panic_npx("panic: optional not set", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v25);
  }
  Img4DecodePerformTrustEvaluatationWithCallbacks(**(_DWORD **)(a2[2] + 8), a1 + 72, a2[4], a2[5], a3);
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)a1;
  if (v17) {
    expert_log(v18, 0, (uint64_t)"Img4DecodePerformTrustEvaluationWithCallbacks: %d", v11, v12, v13, v14, v15, v17);
  }
  else {
    expert_log(v18, 2uLL, (uint64_t)"trust evaluation succeeded for payload: %s", v11, v12, v13, v14, v15, *(void *)(a2[2] + 8) + 4);
  }
  _manifest_record_trust_evaluation_error((uint64_t *)a1, v17, a3, v19, v20, v21, v22, v23);
  return v17;
}

uint64_t _manifest_evaluate_trust_manifest(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_WORD *)(a1 + 528)) {
    __panic_npx("panic: optional not set", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v26);
  }
  Img4DecodePerformManifestTrustEvaluationWithCallbacks(a1 + 72, a2[4], a2[5], a3);
  uint64_t v17 = v11;
  if (v11)
  {
    expert_log(*(void *)a1, 0, (uint64_t)"Img4DecodePerformManifestTrustEvaluationWithCallbacks: %d", v12, v13, v14, v15, v16, v11);
  }
  else
  {
    uint64_t v23 = a2[2];
    if (v23)
    {
      uint64_t v26 = *(void *)(v23 + 8) + 4;
      uint64_t v24 = "manifest trust evaluation succeeded: %s";
    }
    else
    {
      uint64_t v24 = "manifest trust evaluation succeeded";
    }
    expert_log(*(void *)a1, 2uLL, (uint64_t)v24, v12, v13, v14, v15, v16, v26);
  }
  _manifest_record_trust_evaluation_error((uint64_t *)a1, v17, a3, v18, v19, v20, v21, v22);
  return v17;
}

uint64_t manifest_init(uint64_t a1, uint64_t a2, uint64_t **a3)
{
  if (!a2) {
    a2 = generic_expert_specialist();
  }
  *(void *)a1 = a2;
  bzero((void *)(a1 + 8), 0x218uLL);
  buff_xfer((void *)(a1 + 24), a3);
  *(_WORD *)(a1 + 64) = 1;
  return a1;
}

uint64_t manifest_init_borrow(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a2) {
    a2 = generic_expert_specialist();
  }
  *(void *)a1 = a2;
  bzero((void *)(a1 + 8), 0x210uLL);
  *(void *)(a1 + 536) = a3;
  buff_borrow((void *)(a1 + 24), a3);
  *(_WORD *)(a1 + 64) = 1;
  return a1;
}

uint64_t manifest_init_wrap(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a2) {
    a2 = generic_expert_specialist();
  }
  *(void *)a1 = a2;
  bzero((void *)(a1 + 8), 0x218uLL);
  buff_init_alias((void *)(a1 + 24), a3);
  *(_WORD *)(a1 + 64) = 1;
  return a1;
}

uint64_t manifest_set_callbacks(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 8) = a3;
  *(void *)(result + 16) = a2;
  return result;
}

unint64_t manifest_parse(uint64_t a1)
{
  unint64_t v2 = a1 + 64;
  if (*(_WORD *)(a1 + 64))
  {
    uint64_t v3 = (unint64_t *)(a1 + 24);
  }
  else
  {
    unint64_t v2 = 0;
    uint64_t v3 = 0;
  }
  unint64_t result = *v3;
  uint64_t v5 = v3[1];
  if ((unint64_t)(v3 + 5) > v2 || result > *v3 + v5)
  {
    __break(0x5519u);
  }
  else
  {
    Img4DecodeInitAsManifest(result, v5, a1 + 72);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = posixdr(v7);
      expert_log(*(void *)a1, 0, (uint64_t)"Img4DecodeInitAsManifest: %d", v10, v11, v12, v13, v14, v8);
      if (v9 >= 0x6A) {
        __panic_npx("panic: error not set to valid posix code: %d", v15, v16, v17, v18, v19, v20, v21, v9);
      }
    }
    else
    {
      uint64_t v9 = 0;
      *(_WORD *)(a1 + 528) = 1;
    }
    return v9;
  }
  return result;
}

uint64_t manifest_get_restore_info(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_WORD *)(a1 + 528)) {
    __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v18);
  }
  uint64_t v8 = a1 + 72;
  char v19 = 0;
  int v9 = Img4DecodeRestoreInfoExists((void *)(a1 + 72), &v19);
  if (v9) {
    __panic_npx("panic: Img4DecodeRestoreInfoExists: %d", v10, v11, v12, v13, v14, v15, v16, v9);
  }
  if (v19) {
    return v8;
  }
  else {
    return 0;
  }
}

void *manifest_get_bytes(uint64_t a1, void *a2)
{
  if (*(_WORD *)(a1 + 528)) {
    uint64_t v3 = a1 + 72;
  }
  else {
    uint64_t v3 = 0;
  }
  unsigned int v14 = 0;
  uint64_t v13 = 0;
  int Manifest = Img4DecodeGetManifest(v3, &v13, &v14);
  if (Manifest) {
    __panic_npx("panic: Img4DecodeGetManifest: %d", v5, v6, v7, v8, v9, v10, v11, Manifest);
  }
  return buff_init_wrap(a2, v13, v14);
}

uint64_t manifest_impose(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  long long v5 = xmmword_270ECB388;
  uint64_t v6 = qword_270ECB398;
  return _manifest_impose_internal(a1, a2, a3, a4, (uint64_t (**)(unsigned int, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&v5);
}

uint64_t _manifest_validate_property(unsigned int a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3 >= 7) {
    __panic_npx("panic: bogus property container input: actual = %u, expected < %u", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a3);
  }
  if (a3 == 1)
  {
    return _manifest_validate_property_object(a1, a2, a3, a4);
  }
  else
  {
    if (a3) {
      __panic_npx("panic: unreachable", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v9);
    }
    return _manifest_validate_property_manifest(a1, a2, 0, a4);
  }
}

uint64_t manifest_property_callback(uint64_t *a1, uint64_t a2, unsigned int a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = a1[1];
  int v36 = 0;
  uint64_t v35 = 0;
  BOOL v34 = 0;
  unint64_t v33 = 0;
  unsigned int v32 = 0;
  uint64_t v31 = 0;
  if (v10)
  {
    fourcc_init((uint64_t)&v35, a3);
    uint64_t v21 = a4[2];
    switch(v21)
    {
      case 4:
        if (*(void *)(v10 + 16))
        {
          int PropertyData = Img4DecodeGetPropertyData(a4, a3, &v31, &v32);
          uint64_t v23 = *a1;
          if (!PropertyData)
          {
            expert_log(v23, 2uLL, (uint64_t)"property callback: tag = %s, type = %d, asn1 type = %s, v length = 0x%x", v16, v17, v18, v19, v20, (uint64_t)&v35 + 4);
            return (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, uint64_t, void, uint64_t))(v10 + 16))(a1, &v35, a2, v31, v32, a1[2]);
          }
          uint64_t v30 = (char *)&v35 + 4;
          uint64_t v24 = "Img4DecodeGetPropertyData: %s: %d";
          goto LABEL_17;
        }
        uint64_t v23 = *a1;
        uint64_t v24 = "no data property callback";
        break;
      case 2:
        if (*(void *)(v10 + 8))
        {
          int PropertyInteger64 = Img4DecodeGetPropertyInteger64((uint64_t)a4, a3, &v33);
          uint64_t v23 = *a1;
          if (!PropertyInteger64)
          {
            expert_log(v23, 2uLL, (uint64_t)"property callback: tag = %s, type = %d, asn1 type = %s, v = 0x%llx", v16, v17, v18, v19, v20, (uint64_t)&v35 + 4);
            return (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, unint64_t, uint64_t))(v10 + 8))(a1, &v35, a2, v33, a1[2]);
          }
          uint64_t v30 = (char *)&v35 + 4;
          uint64_t v24 = "Img4DecodeGetPropertyInteger64: %s: %d";
          goto LABEL_17;
        }
        uint64_t v23 = *a1;
        uint64_t v24 = "no integer property callback";
        break;
      case 1:
        if (*(void *)v10)
        {
          int PropertyBoolean = Img4DecodeGetPropertyBoolean((uint64_t)a4, a3, &v34);
          uint64_t v23 = *a1;
          if (!PropertyBoolean)
          {
            expert_log(v23, 2uLL, (uint64_t)"property callback: tag = %s, type = %d, asn1 type = %s, v = 0x%x", v16, v17, v18, v19, v20, (uint64_t)&v35 + 4);
            return (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, BOOL, uint64_t))v10)(a1, &v35, a2, v34, a1[2]);
          }
          uint64_t v30 = (char *)&v35 + 4;
          uint64_t v24 = "Img4DecodeGetPropertyBoolean: %s: %d";
LABEL_17:
          unint64_t v29 = 0;
          return expert_log(v23, v29, (uint64_t)v24, v16, v17, v18, v19, v20, (uint64_t)v30);
        }
        uint64_t v23 = *a1;
        uint64_t v24 = "no BOOLean property callback";
        break;
      default:
        __panic_npx("panic: unreachable case: %s = 0x%llx", v14, v15, v16, v17, v18, v19, v20, (char)"i4p->type");
    }
    unint64_t v29 = 2;
    return expert_log(v23, v29, (uint64_t)v24, v16, v17, v18, v19, v20, (uint64_t)v30);
  }
  uint64_t v25 = *a1;

  return expert_log(v25, 2uLL, (uint64_t)"no callbacks present", (uint64_t)a4, a5, a6, a7, a8, a9);
}

uint64_t manifest_post_property_callback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = *(void *)(a1 + 8);
  uint64_t v11 = *a5;
  unsigned __int8 v44 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v41 = 0;
  if (v10)
  {
    int v13 = a4;
    uint64_t v14 = a3;
    if (!a3)
    {
      if (!*(_WORD *)(a1 + 528)) {
        __panic_npx("panic: optional not set", a2, 0, a4, (uint64_t)a5, a6, a7, a8, v39);
      }
      uint64_t v14 = a1 + 72;
    }
    uint64_t QueryForContainer = Img4DecodeGetQueryForContainer(a2, a2, a3, a4, (uint64_t)a5, a6, a7, a8);
    if (!QueryForContainer) {
      __panic_npx("panic: unsupported container for posting: %u", v17, v18, v19, v20, v21, v22, v23, a2);
    }
    uint64_t v24 = (uint64_t *)QueryForContainer;
    if (Img4DecodeContainerExists(QueryForContainer, v14, (uint64_t)&v44))
    {
      uint64_t v40 = *v24;
      unsigned int v32 = "failed to check for %s: %d";
      uint64_t v33 = *(void *)a1;
LABEL_8:
      unint64_t v34 = 0;
      return expert_log(v33, v34, (uint64_t)v32, v27, v28, v29, v30, v31, v40);
    }
    if (!v44)
    {
      uint64_t v33 = *(void *)a1;
      uint64_t v40 = *v24;
      unsigned int v32 = "%s does not exist";
      goto LABEL_8;
    }
    size_t v37 = v24 + 6;
    switch(v13)
    {
      case 4:
        if (v24 < v37)
        {
          int PropertyData = Img4DecodeQueryPropertyData((uint64_t)v24, v14, v11, (uint64_t)&v41, (uint64_t)&v42);
          if (!PropertyData)
          {
            if (*(void *)(v10 + 16))
            {
              expert_log(*(void *)a1, 2uLL, (uint64_t)"property callback: tag = %s, type = %d, asn1 type = %s, v length = %lu", v27, v28, v29, v30, v31, (uint64_t)(a5 + 1));
              (*(void (**)(uint64_t, unsigned int *, uint64_t, uint64_t, uint64_t, void))(v10 + 16))(a1, a5, a2, v41, v42, *(void *)(a1 + 16));
            }
            goto LABEL_33;
          }
          goto LABEL_28;
        }
        break;
      case 2:
        if (v24 < v37)
        {
          int PropertyData = Img4DecodeQueryPropertyInteger64((uint64_t)v24, v14, v11, (uint64_t)&v43);
          if (!PropertyData)
          {
            if (*(void *)(v10 + 8))
            {
              expert_log(*(void *)a1, 2uLL, (uint64_t)"property callback: tag = %s, type = %d, asn1 type = %s, v = 0x%llx", v27, v28, v29, v30, v31, (uint64_t)(a5 + 1));
              (*(void (**)(uint64_t, unsigned int *, uint64_t, uint64_t, void))(v10 + 8))(a1, a5, a2, v43, *(void *)(a1 + 16));
            }
            goto LABEL_33;
          }
LABEL_28:
          uint64_t v33 = *(void *)a1;
          if (PropertyData != 1)
          {
            uint64_t v40 = *v24;
            unsigned int v32 = "failed to decode property: container = %s, type = %x, p = %s: %d";
            goto LABEL_8;
          }
          uint64_t v40 = *v24;
          unsigned int v32 = "property does not exist: container = %s, type = %x, p = %s";
LABEL_34:
          unint64_t v34 = 2;
          return expert_log(v33, v34, (uint64_t)v32, v27, v28, v29, v30, v31, v40);
        }
        break;
      case 1:
        if (v24 < v37)
        {
          int PropertyData = Img4DecodeQueryPropertyBool((uint64_t)v24, v14, v11, (uint64_t)&v44);
          if (!PropertyData)
          {
            if (*(void *)v10)
            {
              expert_log(*(void *)a1, 2uLL, (uint64_t)"property callback: tag = %s, type = %d, asn1 type = %s, v = 0x%x", v27, v28, v29, v30, v31, (uint64_t)(a5 + 1));
              (*(void (**)(uint64_t, unsigned int *, uint64_t, void, void))v10)(a1, a5, a2, v44, *(void *)(a1 + 16));
            }
LABEL_33:
            uint64_t v33 = *(void *)a1;
            uint64_t v40 = *v24;
            unsigned int v32 = "posted property: container = %s, type = %x, p = %s";
            goto LABEL_34;
          }
          goto LABEL_28;
        }
        break;
      default:
        goto LABEL_38;
    }
    __break(0x5519u);
LABEL_38:
    __panic_npx("panic: unreachable case: %s = 0x%llx", v25, v26, v27, v28, v29, v30, v31, (char)"asn1type");
  }
  uint64_t v36 = *(void *)a1;

  return expert_log(v36, 2uLL, (uint64_t)"no callbacks present", a4, (uint64_t)a5, a6, a7, a8, a9);
}

uint64_t manifest_audit(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  long long v4 = xmmword_270ECB3A0;
  uint64_t v5 = qword_270ECB3B0;
  return _manifest_impose_internal(a1, a2, a3, 0, (uint64_t (**)(unsigned int, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&v4);
}

uint64_t _manifest_audit_property(unsigned int a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3 >= 7) {
    __panic_npx("panic: bogus property container input: actual = %u, expected < %u", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a3);
  }
  uint64_t v8 = **(uint64_t ***)(a4 + 40);
  if (a3 == 1)
  {
    uint64_t v9 = _manifest_validate_property_object(a1, a2, a3, a4);
    if (!v9) {
      return 0;
    }
LABEL_7:
    expert_log(*v8, 1uLL, (uint64_t)"auditing manifest; ignoring validation result: %d", v10, v11, v12, v13, v14, v9);
    return 0;
  }
  if (!a3)
  {
    uint64_t v9 = _manifest_validate_property_manifest(a1, a2, 0, a4);
    if (v9) {
      goto LABEL_7;
    }
  }
  return 0;
}

uint64_t manifest_measure(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)a1;
  memset(__dst, 0, sizeof(__dst));
  if (*(_WORD *)(a1 + 528)) {
    uint64_t v6 = a1 + 72;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v46 = 0;
  unint64_t alloc_preference = _type_get_alloc_preference((uint64_t)&_image4_type_decode_context);
  if (alloc_preference <= 1) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = alloc_preference;
  }
  if (v15 == 1) {
    goto LABEL_11;
  }
  if (v15 != 2) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", v8, v9, v10, v11, v12, v13, v14, (char)"_t_preference");
  }
  uint64_t v16 = _expert_alloc_type(v5, (uint64_t)&_image4_type_decode_context);
  if (!v16)
  {
LABEL_11:
    uint64_t size = type_get_size((uint64_t)&_image4_type_decode_context);
    unint64_t v26 = MEMORY[0x270FA5388](size, v19, v20, v21, v22, v23, v24, v25);
    uint64_t v17 = (_OWORD *)((char *)&v45 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v26 >= 0x31) {
      size_t v27 = v26 - 48;
    }
    else {
      size_t v27 = 0;
    }
    memset(v17 + 3, 170, v27);
    *uint64_t v17 = 0u;
    v17[1] = 0u;
    v17[2] = 0u;
  }
  else
  {
    uint64_t v17 = (_OWORD *)v16;
    uint64_t v46 = v16;
  }
  v17[1] = 0u;
  v17[2] = 0u;
  *uint64_t v17 = 0u;
  uint64_t v28 = chip_select_decode(a2);
  if (!v28) {
    __panic_npx("panic: no decode implementation available for chip: %s", v29, v30, v31, v32, v33, v34, v35, *(void *)(a2 + 8));
  }
  uint64_t v36 = v28;
  size_t v37 = *(size_t **)(v28 + 32);
  size_t v38 = *v37;
  if (*v37 > 0x40)
  {
    __break(0x5519u);
LABEL_21:
    __panic_npx("panic: Img4DecodeCopyManifestDigest: %d", v29, v30, v36, v32, v33, v34, v35, v28);
  }
  LODWORD(v28) = Img4DecodeCopyManifestDigest(v6, __dst, *v37, (uint64_t (**)(uint64_t, void, _OWORD *, size_t, void))v28);
  if (v28) {
    goto LABEL_21;
  }
  _expert_dealloc_type(v5, (uint64_t)&_image4_type_decode_context, &v46);
  return digest_init(a3, __dst, v38, v39, v40, v41, v42, v43);
}

void *manifest_destroy(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *result;
  if (*result)
  {
    if (!*(_WORD *)(v8 + 64)) {
      __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v12);
    }
    uint64_t v9 = result;
    uint64_t v13 = (void *)(v8 + 24);
    uint64_t v10 = *(void *)(v8 + 536);
    if (v10) {
      buff_return(v10, &v13);
    }
    uint64_t v11 = v8 + 544;
    if (!*(_WORD *)(v8 + 584)) {
      uint64_t v11 = 0;
    }
    uint64_t v12 = v11;
    buff_destroy(&v12);
    *(_WORD *)(v8 + 64) = 0;
    unint64_t result = buff_destroy(&v13);
    *uint64_t v9 = 0;
  }
  return result;
}

uint64_t *_manifest_record_trust_evaluation_error(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(a3 + 40);
    if (*(_DWORD *)(v10 + 64) == -1)
    {
      expert_log(*result, 1uLL, (uint64_t)"certificate trust evaluation failed", a4, a5, a6, a7, a8, v11);
      *(_DWORD *)(v10 + 64) = 80;
    }
    return (uint64_t *)expert_log(*v9, 0, (uint64_t)"trust evaluation: dr = %d, ct = 0x%x, error = %d", a4, a5, a6, a7, a8, a2);
  }
  return result;
}

uint64_t _manifest_validate_property_manifest(unsigned int a1, uint64_t *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 40);
  uint64_t v7 = *(void *)(v6 + 48);
  uint64_t v8 = *(uint64_t **)v6;
  uint64_t v9 = *(void *)(v6 + 8);
  int v46 = 0;
  uint64_t v45 = 0;
  uint64_t v10 = (uint64_t *)fourcc_init((uint64_t)&v45, a1);
  uint64_t result = expert_log(*v8, 1uLL, (uint64_t)"manifest property: %s", v11, v12, v13, v14, v15, (uint64_t)v10 + 4);
  if (v10 && v10 >= (uint64_t *)((char *)v10 + 12)) {
    goto LABEL_19;
  }
  uint64_t v23 = v8 + 74;
  uint64_t result = property_find_from_fourcc(v10, 0, v17, v18, v19, v20, v21, v22);
  if (!result)
  {
    if (v8 >= v23) {
      goto LABEL_19;
    }
    _manifest_audit_pseudo_callback((uint64_t)v8, v10, a3);
    uint64_t v40 = "unrecognized manifest property: %s";
LABEL_15:
    uint64_t result = expert_log(*v8, 1uLL, (uint64_t)v40, v30, v31, v32, v33, v34, (uint64_t)v10 + 4);
    goto LABEL_16;
  }
  uint64_t v29 = result;
  uint64_t result = odometer_update(v7, result, (uint64_t)a2, v24, v25, v26, v27, v28);
  if (!result)
  {
    if (v8 >= v23) {
      goto LABEL_19;
    }
    uint64_t v41 = v8[1];
    if (v41)
    {
      uint64_t v42 = *(void (**)(uint64_t *, uint64_t, uint64_t, void, void, uint64_t))(v41 + 48);
      if (v42) {
        v42(v8, v29, 2, 0, 0, v8[2]);
      }
    }
    uint64_t v40 = "anti-replay property consumed by odometer: %s";
    goto LABEL_15;
  }
  if (v8 >= v23)
  {
LABEL_19:
    __break(0x5519u);
    return result;
  }
  uint64_t result = _manifest_impose_property(v8, v29, v9, a2, v6);
  if (result)
  {
    *(_DWORD *)(v6 + 64) = result;
    expert_log(*v8, 0, (uint64_t)"property failed to impose on environment: %s: %d", v35, v36, v37, v38, v39, (uint64_t)v10 + 4);
    return 3;
  }
LABEL_16:
  if (v8 >= v23) {
    goto LABEL_19;
  }
  manifest_property_callback(v8, a3, a1, a2, v36, v37, v38, v39, v43);
  return 0;
}

uint64_t _manifest_validate_property_object(unsigned int a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 40);
  uint64_t v8 = *(uint64_t **)v7;
  uint64_t v9 = *(void *)(v7 + 8);
  int v36 = 0;
  uint64_t v35 = 0;
  uint64_t v10 = (uint64_t *)fourcc_init((uint64_t)&v35, a1);
  uint64_t result = expert_log(*v8, 1uLL, (uint64_t)"object property: %s", v11, v12, v13, v14, v15, (uint64_t)v10 + 4);
  if (v10 && v10 >= (uint64_t *)((char *)v10 + 12)) {
    goto LABEL_12;
  }
  uint64_t v23 = v8 + 74;
  uint64_t result = property_find_from_fourcc(v10, 1, v17, v18, v19, v20, v21, v22);
  if (!result)
  {
    if (v8 < v23)
    {
      _manifest_audit_pseudo_callback((uint64_t)v8, v10, a3);
      uint64_t result = expert_log(*v8, 1uLL, (uint64_t)"unrecognized object property: %s", v29, v30, v31, v32, v33, (uint64_t)v10 + 4);
      goto LABEL_9;
    }
LABEL_12:
    __break(0x5519u);
    return result;
  }
  if (v8 >= v23) {
    goto LABEL_12;
  }
  uint64_t result = _manifest_impose_property(v8, result, v9, a2, v7);
  if (result)
  {
    *(_DWORD *)(v7 + 64) = result;
    expert_log(*v8, 0, (uint64_t)"object property failed to impose on environment: %d", v24, v25, v26, v27, v28, result);
    return 3;
  }
LABEL_9:
  if (v8 >= v23) {
    goto LABEL_12;
  }
  manifest_property_callback(v8, a3, a1, a2, v25, v26, v27, v28, v34);
  return 0;
}

uint64_t _manifest_audit_pseudo_callback(uint64_t result, uint64_t *a2, int a3)
{
  uint64_t v3 = *(void *)(result + 8);
  v6[0] = (char *)a2 + 4;
  v6[1] = 0;
  uint64_t v4 = *a2;
  v6[2] = 33;
  v6[3] = v4;
  int v7 = *((_DWORD *)a2 + 2);
  uint64_t v8 = &_property_type_BOOL;
  uint64_t v9 = &_property_constraint_na;
  int v10 = a3;
  long long v11 = xmmword_263C0D150;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = 4;
  if (v3)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, void *, uint64_t, void, void, void))(v3 + 48);
    if (v5) {
      return v5(result, v6, 3, 0, 0, *(void *)(result + 16));
    }
  }
  return result;
}

uint64_t _manifest_impose_property(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  uint64_t v10 = *a1;
  digest = chip_get_digest(a3);
  v87[0] = xmmword_263C0D160;
  memset(&v87[1], 170, 88);
  __n_4[0] = xmmword_263C0D160;
  memset(&__n_4[1], 170, 88);
  uint64_t v12 = *(unsigned int *)(a2 + 24);
  unsigned int __n = 0;
  *(void *)uint64_t v84 = 0;
  uint64_t constraint = chip_get_constraint(a3, a2, *(void *)(a5 + 24));
  if (constraint != a2) {
    expert_log(*a1, 1uLL, (uint64_t)"chip has custom constraint for property: %s", v15, v16, v17, v18, v19, a2 + 28);
  }
  int v21 = *(_DWORD *)(constraint + 56);
  if (v21)
  {
    if (v21 == 6)
    {
      uint64_t property_BOOL = 0;
      goto LABEL_46;
    }
    if (v21 != 1) {
      __panic_npx("panic: unreachable case: %s = 0x%llx", v13, v14, v15, v16, v17, v18, v19, (char)"p->p_container");
    }
    uint64_t v22 = 85;
    uint64_t v23 = "object";
  }
  else
  {
    uint64_t v22 = 13;
    uint64_t v23 = "manifest";
  }
  if (property_imposable(constraint, a3))
  {
    switch(**(void **)(constraint + 40))
    {
      case 0:
        uint64_t PropertyBoolean = Img4DecodeGetPropertyBoolean((uint64_t)a4, v12, (BOOL *)v87);
        if (PropertyBoolean)
        {
          uint64_t v32 = PropertyBoolean;
          uint64_t property_BOOL = posixdr(PropertyBoolean);
          expert_log(*a1, 0, (uint64_t)"Img4DecodeGetPropertyBoolean: %d", v34, v35, v36, v37, v38, v32);
          goto LABEL_26;
        }
        uint64_t property_BOOL = expert_query_property_BOOL(v10, a3, constraint, (unsigned __int8 *)__n_4);
        if (property_BOOL) {
          goto LABEL_43;
        }
        if (!property_constrain_BOOL(constraint, v10, (unsigned __int8 *)v87, (unsigned __int8 *)__n_4, v16, v17, v18, v19))goto LABEL_39; {
        goto LABEL_42;
        }
      case 1:
        uint64_t PropertyInteger = Img4DecodeGetPropertyInteger((uint64_t)a4, v12, v87);
        if (PropertyInteger)
        {
          uint64_t v42 = PropertyInteger;
          uint64_t property_BOOL = posixdr(PropertyInteger);
          expert_log(*a1, 0, (uint64_t)"Img4DecodeGetPropertyInteger: %d", v43, v44, v45, v46, v47, v42);
          goto LABEL_26;
        }
        uint64_t property_BOOL = expert_query_property_uint32(v10, a3, constraint, __n_4);
        if (property_BOOL) {
          goto LABEL_43;
        }
        if (!property_constrain_uint32(constraint, v10, (unsigned int *)v87, (unsigned int *)__n_4, v16, v17, v18, v19))goto LABEL_39; {
        goto LABEL_42;
        }
      case 2:
        uint64_t PropertyInteger64 = Img4DecodeGetPropertyInteger64((uint64_t)a4, v12, (unint64_t *)v87);
        if (PropertyInteger64)
        {
          uint64_t v49 = PropertyInteger64;
          uint64_t property_BOOL = posixdr(PropertyInteger64);
          expert_log(*a1, 0, (uint64_t)"Img4DecodeGetPropertyInteger64: %d", v50, v51, v52, v53, v54, v49);
          goto LABEL_26;
        }
        uint64_t property_BOOL = expert_query_property_uint64(v10, a3, constraint, __n_4);
        if (property_BOOL) {
          goto LABEL_43;
        }
        if (!property_constrain_uint64(constraint, v10, (unint64_t *)v87, (unint64_t *)__n_4, v16, v17, v18, v19))goto LABEL_39; {
        goto LABEL_42;
        }
      case 3:
        uint64_t PropertyData = Img4DecodeGetPropertyData(a4, v12, v84, &__n);
        if (PropertyData) {
          goto LABEL_25;
        }
        digest_init((uint64_t)v87, *(const void **)v84, __n, v56, v57, v58, v59, v60);
        if (property_equal(constraint, (uint64_t)digest))
        {
          expert_log(*a1, 1uLL, (uint64_t)"imposing object digest", v61, v62, v63, v64, v65, v83);
          payload_measure(*(void *)(a5 + 16), a3, (uint64_t)__n_4);
        }
        else
        {
          uint64_t property_BOOL = expert_query_property_digest(v10, a3, constraint, (uint64_t)__n_4);
          if (property_BOOL) {
            goto LABEL_43;
          }
        }
        if (property_constrain_digest(constraint, v10, (unint64_t)v87, (unint64_t)__n_4, v16, v17, v18, v19))
        {
          goto LABEL_42;
        }
        goto LABEL_39;
      case 4:
        uint64_t PropertyData = Img4DecodeGetPropertyData(a4, v12, v84, &__n);
        if (PropertyData)
        {
LABEL_25:
          uint64_t v66 = PropertyData;
          uint64_t property_BOOL = posixdr(PropertyData);
          expert_log(*a1, 0, (uint64_t)"Img4DecodeGetPropertyData: %d", v67, v68, v69, v70, v71, v66);
LABEL_26:
          if (!property_BOOL)
          {
LABEL_46:
            uint64_t v77 = 1;
LABEL_47:
            uint64_t v80 = a1[1];
            if (v80)
            {
              uint64_t v81 = *(void (**)(uint64_t *, uint64_t, uint64_t, _OWORD *, _OWORD *, uint64_t))(v80 + 48);
              if (v81) {
                v81(a1, constraint, v77, v87, __n_4, a1[2]);
              }
            }
            if (property_BOOL >= 0x6A) {
              __panic_npx("panic: error not set to valid posix code: %d", v13, v77, v15, v16, v17, v18, v19, property_BOOL);
            }
            return property_BOOL;
          }
        }
        else
        {
          version_init((uint64_t)v87, *(char **)v84, __n);
          uint64_t property_BOOL = expert_query_property_version(v10, a3, constraint, (uint64_t)__n_4);
          if (!property_BOOL)
          {
            if (!property_constrain_version(constraint, v10, (uint64_t)v87, (uint64_t)__n_4, v16, v17, v18, v19))
            {
LABEL_39:
              expert_log(*a1, 2uLL, (uint64_t)"%s constraint satisfied: property = %s, type = %s", v72, v73, v74, v75, v76, (uint64_t)v23);
              uint64_t property_BOOL = 0;
              uint64_t v77 = 0;
              goto LABEL_47;
            }
LABEL_42:
            expert_log(*a1, 0, (uint64_t)"%s constraint violated: property = %s, type = %s: %d", v72, v73, v74, v75, v76, (uint64_t)v23);
            uint64_t property_BOOL = v22;
          }
        }
LABEL_43:
        uint64_t v78 = a1[1];
        if (v78)
        {
          uint64_t v79 = *(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v78 + 24);
          if (v79) {
            v79(a1, a3, constraint, a1[2]);
          }
        }
        goto LABEL_46;
      default:
        __panic_npx("panic: unreachable case: %s = 0x%llx", v24, v25, v26, v27, v28, v29, v30, (char)"p->p_type->pt_switchable");
    }
  }
  expert_log(*a1, 1uLL, (uint64_t)"%s property not imposable on chip: %s", v26, v27, v28, v29, v30, (uint64_t)v23);
  uint64_t v39 = a1[1];
  if (v39)
  {
    uint64_t v40 = *(void (**)(uint64_t *, uint64_t, uint64_t, void, void, uint64_t))(v39 + 48);
    if (v40) {
      v40(a1, constraint, 3, 0, 0, a1[2]);
    }
  }
  return 0;
}

void *img4_firmware_new(char *a1, __n128 *a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t expert = img4_runtime_get_expert(a1);
  long long v11 = (void *)_expert_alloc_type(expert, (uint64_t)&_image4_type_firmware);
  uint64_t v12 = v11;
  if (v11)
  {
    img4_firmware_init(v11, a1, a2, a3, a4, a5);
    v12[2] = &_image4_type_firmware;
  }
  return v12;
}

__n128 img4_firmware_init(void *a1, char *a2, __n128 *a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  uint64_t expert = img4_runtime_get_expert(a2);
  int v19 = 0;
  uint64_t v18 = 0;
  uint64_t v17 = 0;
  memset(v16, 0, sizeof(v16));
  bzero(a1, 0x508uLL);
  *a1 = a6;
  a1[1] = a2;
  a1[2] = 0;
  a1[6] = 0;
  a1[78] = 0;
  img4_buff_steal(a1 + 153, a5);
  inited = buff_init_wrap(v16, *(void *)(a5 + 8), *(void *)(a5 + 16));
  fourcc_init((uint64_t)&v18, a4);
  a1[6] = payload_init((uint64_t)(a1 + 7), expert, (unsigned int *)&v18, &inited);
  unint64_t v13 = a3[1].n128_u64[0];
  __n128 result = *a3;
  *(__n128 *)(a1 + 3) = *a3;
  a1[5] = v13;
  return result;
}

void img4_firmware_init_from_buff(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 <= 0x507) {
    __panic_npx("panic: object overflows buffer: object = firmware, length = %lu, required = %lu", a2, a3, a4, a5, a6, a7, a8, a2);
  }
}

void img4_firmware_init_sentinel(void *a1, uint64_t a2, uint64_t a3)
{
  *a1 = a3;
  a1[1] = a2;
  a1[2] = 0;
  a1[6] = 0;
  a1[78] = 0;
}

uint64_t img4_firmware_attach_manifest(uint64_t a1, uint64_t a2)
{
  uint64_t expert = img4_runtime_get_expert(*(char **)(a1 + 8));
  if (!expert) {
    uint64_t expert = generic_expert_specialist();
  }
  uint64_t v8 = 0;
  memset(v7, 0, sizeof(v7));
  img4_buff_steal((_OWORD *)(a1 + 1256), a2);
  inited = buff_init_wrap(v7, *(void *)(a2 + 8), *(void *)(a2 + 16));
  uint64_t result = manifest_init(a1 + 632, expert, &inited);
  *(void *)(a1 + 624) = result;
  return result;
}

uint64_t img4_firmware_select_chip(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  uint64_t expert = img4_runtime_get_expert(*(char **)(a1 + 8));
  if (!expert) {
    uint64_t expert = generic_expert_specialist();
  }
  uint64_t v56 = 0;
  memset(v55, 0, sizeof(v55));
  if ((*(unsigned char *)a1 & 4) == 0)
  {
    uint64_t v14 = "cannot select chip with first-stage boots";
LABEL_5:
    uint64_t v15 = expert;
    unint64_t v16 = 0;
LABEL_14:
    expert_log(v15, v16, (uint64_t)v14, v8, v9, v10, v11, v12, v50);
    return 0;
  }
  uint64_t v17 = *(void *)(a1 + 624);
  if (!v17)
  {
    uint64_t v20 = *(void *)(a1 + 48);
    if (!v20)
    {
      uint64_t v14 = "no manifest with which to select chip";
      goto LABEL_5;
    }
    unint64_t v18 = v20 + 88;
    if (*(_WORD *)(v20 + 88))
    {
      int v19 = (uint64_t *)(v20 + 48);
      goto LABEL_12;
    }
LABEL_32:
    __panic_npx("panic: optional not set", v6, v7, v8, v9, v10, v11, v12, v50);
  }
  unint64_t v18 = v17 + 64;
  if (!*(_WORD *)(v17 + 64)) {
    goto LABEL_32;
  }
  int v19 = (uint64_t *)(v17 + 24);
LABEL_12:
  uint64_t result = expert_runtime_boot(expert);
  if (result)
  {
    uint64_t v50 = result;
    uint64_t v14 = "failed to boot expert for chip selection: %d";
    uint64_t v15 = expert;
    unint64_t v16 = 3;
    goto LABEL_14;
  }
  if ((unint64_t)v19 >= v18
    || (unint64_t)(v19 + 5) > v18
    || (result = *v19, uint64_t v23 = v19[1], *v19 > (unint64_t)(*v19 + v23)))
  {
    __break(0x5519u);
    return result;
  }
  Img4DecodeInitAsManifest(result, v23, (uint64_t)v55);
  if (v24)
  {
    uint64_t v50 = v24;
    uint64_t v14 = "Img4DecodeInitAsManifest: %d";
    goto LABEL_5;
  }
  if (!a3) {
    return 0;
  }
  long long v52 = xmmword_270ECB3B8;
  uint64_t v25 = qword_270ECB3C8;
  while (1)
  {
    uint64_t v22 = *a2;
    long long v53 = v52;
    uint64_t v54 = v25;
    uint64_t v26 = *(void *)(v22 + 32);
    uint64_t name = chip_get_name(v22);
    expert_log(expert, 1uLL, (uint64_t)"trying chip: %s", v28, v29, v30, v31, v32, name);
    if (!v26)
    {
      uint64_t v51 = chip_get_name(v22);
      expert_log(expert, 0, (uint64_t)"chip has no static decode implementation: %s", v39, v40, v41, v42, v43, v51);
      goto LABEL_29;
    }
    Img4DecodePerformManifestTrustEvaluationWithCallbacks((uint64_t)v55, (uint64_t)&v53, v26, 0);
    if (!v33) {
      break;
    }
    expert_log(expert, 1uLL, (uint64_t)"Img4DecodePerformManifestTrustEvaluationWithCallbacks: %d", v34, v35, v36, v37, v38, v33);
LABEL_29:
    uint64_t v22 = 0;
    ++a2;
    if (!--a3) {
      return v22;
    }
  }
  uint64_t v44 = chip_get_name(v22);
  expert_log(expert, 2uLL, (uint64_t)"manifest matches chip: %s", v45, v46, v47, v48, v49, v44);
  return v22;
}

uint64_t _img4_firmware_select_chip_callback()
{
  return 0;
}

uint64_t img4_firmware_execute(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 624);
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  uint64_t result = img4_firmware_evaluate(a1, (uint64_t)a2, a3);
  uint64_t v8 = result;
  uint64_t v9 = 0;
  if (!result)
  {
    if (*(_WORD *)(v5 + 88))
    {
      if (v5 >= v5 + 568)
      {
        __break(0x5519u);
        return result;
      }
      uint64_t v9 = img4_image_init(v17, v5, v6, *(void *)a1);
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, void *, uint64_t, void))(a1 + 32))(a1, v9, v8, *(void *)(a1 + 40));
  if (a2[2] == 3 && (void *)a2[14] == a2 + 33)
  {
    uint64_t result = a2[90];
    if (result)
    {
      int v19 = a2;
      uint64_t result = _expert_dealloc_type(result, (uint64_t)&_image4_type_custom_chip, (uint64_t *)&v19);
    }
  }
  if (v8 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v10, v11, v12, v13, v14, v15, v16, v8);
  }
  return result;
}

uint64_t img4_firmware_evaluate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v29[14] = *MEMORY[0x263EF8340];
  uint64_t expert = img4_runtime_get_expert(*(char **)(a1 + 8));
  if (!expert) {
    uint64_t expert = generic_expert_specialist();
  }
  uint64_t v28 = 0;
  v29[0] = a1;
  v26[0] = xmmword_270ECB3D0;
  v26[1] = unk_270ECB3E0;
  v26[2] = xmmword_270ECB3F0;
  uint64_t v27 = qword_270ECB400;
  v29[1] = a2;
  memset(&v29[2], 0, 88);
  v29[13] = 0xAAAAAAAAFFFFFFFFLL;
  if (!expert) {
    __panic_npx("panic: failed to resolve expert for runtime", v6, v7, v8, v9, v10, v11, v12, v25);
  }
  if (!*(void *)(a1 + 48) || (*(unsigned char *)a1 & 2) != 0 || (uint64_t v14 = payload_parse_relax(), !v14))
  {
    uint64_t v15 = *(uint64_t **)(a1 + 624);
    if (v15)
    {
      uint64_t inited = 0;
    }
    else
    {
      uint64_t v17 = *(void *)(a1 + 48);
      if (!*(_WORD *)(v17 + 88)) {
        __panic_npx("panic: optional not set", v6, v7, v8, v9, v10, v11, v12, v25);
      }
      uint64_t inited = manifest_init_borrow(a1 + 632, expert, (void *)(v17 + 48));
      uint64_t v28 = inited;
      uint64_t v15 = (uint64_t *)inited;
    }
    manifest_set_callbacks((uint64_t)v15, (uint64_t)v29, (uint64_t)v26);
    if (a3)
    {
      digest_init_from_img4_nonce((uint64_t)&v29[3], a3, v18, v19, v20, v21, v22, v23);
      v29[2] = &v29[3];
    }
    if (manifest_parse((uint64_t)v15))
    {
      uint64_t v14 = 79;
      if (!inited) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
    uint64_t v14 = manifest_impose(v15, a2, *(void *)(a1 + 48), 0);
    if (inited) {
LABEL_15:
    }
      manifest_destroy(&v28, v6, v7, v8, v9, v10, v11, v12);
  }
LABEL_16:
  if (v14 == 85) {
    return 8;
  }
  if (v14 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v6, v7, v8, v9, v10, v11, v12, v14);
  }
  return v14;
}

void _img4_firmware_prepare(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  unint64_t v5 = *(uint64_t **)a3;
  uint64_t expert = img4_runtime_get_expert(*(char **)(*(void *)a3 + 8));
  if (!expert) {
    uint64_t expert = generic_expert_specialist();
  }
  uint64_t v12 = *(void **)(a3 + 8);
  uint64_t v13 = *v5;
  if ((*v5 & 4) != 0)
  {
    if (v5 < v5 + 161)
    {
      uint64_t v20 = (char *)v5[1];
      uint64_t v21 = img4_runtime_get_expert(v20);
      if (!v21) {
        uint64_t v21 = generic_expert_specialist();
      }
      LOBYTE(v66[0]) = 0;
      if (img4_runtime_check_custom_BOOL((uint64_t)v20))
      {
        expert_log(v21, 2uLL, (uint64_t)"querying custom runtime for mix-n-match policy", v22, v23, v24, v25, v26, v63);
        uint64_t identifier_BOOL = img4_runtime_get_identifier_BOOL((uint64_t)v20);
        if (identifier_BOOL)
        {
          expert_log(v21, 0, (uint64_t)"failed to query mix-n-match identifier: %d", v28, v29, v30, v31, v32, identifier_BOOL);
        }
        else
        {
          expert_log(v21, 2uLL, (uint64_t)"preparing mix-n-match policy: 0x%x", v28, v29, v30, v31, v32, LOBYTE(v66[0]));
          odometer_prepare_mixn_match(a2, v66[0]);
        }
      }
      else
      {
        expert_log(v21, 2uLL, (uint64_t)"stock runtime; not querying for mix-n-match policy",
          v22,
          v23,
          v24,
          v25,
          v26,
          v63);
      }
      uint64_t v33 = (char *)v5[1];
      uint64_t v34 = img4_runtime_get_expert(v33);
      if (!v34) {
        uint64_t v34 = generic_expert_specialist();
      }
      memset(v69, 0, sizeof(v69));
      memset(v68, 0, sizeof(v68));
      char v67 = 0;
      memset(v66, 0, sizeof(v66));
      if (img4_runtime_check_custom_digest((uint64_t)v33))
      {
        expert_log(v34, 2uLL, (uint64_t)"querying custom runtime for boot manifest hash", v35, v36, v37, v38, v39, v64);
        uint64_t identifier_digest = img4_runtime_get_identifier_digest((uint64_t)v33);
        if (identifier_digest)
        {
          expert_log(v34, 0, (uint64_t)"failed to query manifest hash identifier: %d", v42, v43, v44, v45, v46, identifier_digest);
        }
        else
        {
          digest_init_from_img4_dgst((uint64_t)v68, (uint64_t)v69, v41, v42, v43, v44, v45, v46);
          digest_print_cstr((unint64_t)v68, (unint64_t)v66, v52, v53, v54, v55, v56, v57);
          expert_log(v34, 2uLL, (uint64_t)"preparing custom boot manifest hash: %s", v58, v59, v60, v61, v62, (uint64_t)v66);
          odometer_prepare_notarized_manifest_hash(a2, (uint64_t)v68);
        }
      }
      else
      {
        expert_log(v34, 2uLL, (uint64_t)"stock runtime; not querying for boot manifest hash",
          v35,
          v36,
          v37,
          v38,
          v39,
          v64);
      }
      expert_log(expert, 2uLL, (uint64_t)"forcing sideload anti-replay policy due to subsequent stage firmware evaluation", v47, v48, v49, v50, v51, v65);
      odometer_prepare_sideload_mixn_match(a2);
      goto LABEL_30;
    }
    goto LABEL_36;
  }
  if (*(void *)(a3 + 16))
  {
    expert_log(expert, 2uLL, (uint64_t)"prepared custom nonce hash", v6, v7, v8, v9, v10, v63);
    odometer_prepare_nonce_hash(a2, *(void *)(a3 + 16));
    uint64_t v13 = *v5;
  }
  if ((v13 & 8) != 0)
  {
    expert_log(expert, 2uLL, (uint64_t)"forcing sideload anti-replay policy", v6, v7, v8, v9, v10, v63);
    odometer_prepare_sideload_mixn_match(a2);
  }
  if (v12[3] != 1 || v12[2] != 1) {
    goto LABEL_30;
  }
  if (v12 >= v12 + 33)
  {
LABEL_36:
    __break(0x5519u);
    return;
  }
  uint64_t name = chip_get_name((uint64_t)v12);
  expert_log(expert, 1uLL, (uint64_t)"%s: simulating chip boot for reduced-security virtual chip policy", v15, v16, v17, v18, v19, name);
  odometer_prepare_mixn_match(a2, 1);
LABEL_30:
  if (!v5[6] && (*(unsigned char *)v5 & 0x20) == 0)
  {
    expert_log(expert, 2uLL, (uint64_t)"manifest-only evaluation; permitting replay", v6, v7, v8, v9, v10, v63);
    odometer_prepare_mixn_match(a2, 1);
  }
  if (!v12[25]) {
    odometer_prepare_mix_n_match_god_mode(a2);
  }
  *(_DWORD *)(a3 + 104) = 0;
}

uint64_t *img4_firmware_destroy(uint64_t *result)
{
  uint64_t v1 = (unint64_t *)*result;
  if (*result)
  {
    unint64_t v2 = result;
    uint64_t v3 = (char *)v1[1];
    uint64_t expert = img4_runtime_get_expert(v3);
    uint64_t v12 = v1 + 157;
    uint64_t v13 = v1 + 153;
    manifest_destroy(v1 + 78, v5, v6, v7, v8, v9, v10, v11);
    payload_destroy(v1 + 6);
    img4_buff_dealloc_internal((uint64_t)v3, &v13);
    img4_buff_dealloc_internal((uint64_t)v3, &v12);
    return (uint64_t *)_expert_dealloc_type(expert, v1[2], v2);
  }
  return result;
}

uint64_t _property_filter_all()
{
  return 0;
}

uint64_t _property_filter_constraint(uint64_t a1)
{
  if (*(_UNKNOWN **)(a1 + 48) == &_property_constraint_na) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t _property_filter_anti_replay(uint64_t a1)
{
  if (*(_UNKNOWN **)(a1 + 48) == &_property_constraint_rp) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t _property_filter_manifest(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 56)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t _property_filter_object(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 56) == 1) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t _property_filter_chip_instance(uint64_t a1)
{
  return *(uint64_t *)(a1 + 64) >> 63;
}

uint64_t _property_filter_expert(uint64_t a1)
{
  if (*(void *)(a1 + 16) == 33) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

char *property_iterator_next(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = (char **)(v8 + 1);
  if (v8 == 37) {
    return 0;
  }
  if (v8 < -1) {
LABEL_18:
  }
    __panic_npx("panic: iteration underflow: idx = 0x%lx, %ld", a2, a3, a4, a5, a6, a7, a8, (char)v9);
  if ((unint64_t)v9 >= 0x27) {
    __panic_npx("panic: iteration overflow: idx = 0x%lx, %lu", a2, a3, a4, a5, a6, a7, a8, v8 + 1);
  }
  if (*(void *)a1) {
    uint64_t v12 = *(uint64_t (**)())a1;
  }
  else {
    uint64_t v12 = _property_filter_all;
  }
  uint64_t v13 = v8;
  while (1)
  {
    uint64_t v9 = &__all[v13 + 1];
    if (v9 < __all)
    {
      __break(0x5519u);
      goto LABEL_18;
    }
    uint64_t v10 = __all[v8 + 1];
    if (!((unsigned int (*)(char *))v12)(v10)) {
      break;
    }
    ++v8;
    ++v13;
    if ((unint64_t)v8 >= 0x25)
    {
      uint64_t v14 = v8 + 1;
      goto LABEL_14;
    }
  }
  uint64_t v14 = v8 + 1;
  if (!v10) {
LABEL_14:
  }
    uint64_t v10 = 0;
  *(void *)(a1 + 8) = v10;
  *(void *)(a1 + 16) = v14;
  return v10;
}

uint64_t property_iterator_reset(uint64_t result)
{
  *(void *)(result + 8) = 0;
  *(void *)(result + 16) = -1;
  return result;
}

double Img4DecodeInitAsPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result = Img4DecodeInit(a1, a2, a3);
  if (v7 == 2)
  {
    return Img4DecodeInitPayload(a1, a2, a3);
  }
  return result;
}

void Img4DecodeInitAsManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Img4DecodeInit(a1, a2, a3);
  if (v6 == 2)
  {
    Img4DecodeInitManifest(a1, a2, a3);
  }
}

uint64_t Img4DecodeGetQueryForContainer(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 >= 6) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"pc");
  }
  return qword_2655E2200[a1];
}

uint64_t Img4DecodeContainerExists(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(a2, a3);
}

uint64_t Img4DecodeQueryPropertyBool(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(a1 + 16))(a3);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24);

  return v8(a2, v7, a4);
}

uint64_t Img4DecodeQueryPropertyInteger64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(a1 + 16))(a3);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);

  return v8(a2, v7, a4);
}

uint64_t Img4DecodeQueryPropertyData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(a1 + 16))(a3);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 40);

  return v10(a2, v9, a4, a5);
}

uint64_t Img4DecodeIterateObjectItems(unint64_t *a1, unsigned int *a2, uint64_t (**a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  __dst[57] = *MEMORY[0x263EF8340];
  v21[0] = 0;
  v21[1] = 0;
  uint64_t v19 = 0;
  v20[0] = 0;
  v20[1] = 0;
  uint64_t result = (uint64_t)DERDecodeSeqContentInit(a1 + 5, v21);
  if (!result)
  {
    for (LODWORD(result) = DERDecodeSeqNext(v21, (unint64_t *)&v19);
          !result;
          LODWORD(result) = DERDecodeSeqNext(v21, (unint64_t *)&v19))
    {
      unsigned int v9 = v19;
      memset(v18, 0, sizeof(v18));
      uint64_t v10 = memcpy(__dst, a1, 0x1C8uLL);
      memset(v17, 170, 5);
      uint64_t v11 = log_expert(v10);
      if (v9 == 1296125520)
      {
        strcpy((char *)v17, "MANP");
        expert_log(v11, 2uLL, (uint64_t)"found %s; skipping", v12, v13, v14, v15, v16, (uint64_t)v17);
      }
      else
      {
        LOBYTE(v17[1]) = 0;
        v17[0] = bswap32(v9);
        expert_log(v11, 2uLL, (uint64_t)"found object: %s", v12, v13, v14, v15, v16, (uint64_t)v17);
        uint64_t result = DERImg4DecodePropertyWithItem((uint64_t)v20, v19, 0x2000000000000011uLL, (unint64_t)v18);
        if (result) {
          return result;
        }
        *a2 = v9;
        *(_OWORD *)&__dst[9] = *(_OWORD *)((char *)&v18[1] + 8);
        uint64_t result = Img4DecodeEvaluateObjectProperties((uint64_t)__dst, *a3, a4);
        if (result) {
          return result;
        }
        *a2 = 0;
      }
    }
    if (result == 1) {
      return 0;
    }
    else {
      return result;
    }
  }
  return result;
}

void Img4DecodeCheckAuthority(uint64_t a1, long long *a2)
{
  long long v7 = xmmword_270ECB690;
  uint64_t v8 = qword_270ECB6A0;
  long long v2 = *a2;
  uint64_t v3 = *((void *)a2 + 2);
  uint64_t v4 = _CheckAuthorityEvalCertProperties;
  long long v5 = a2[2];
  uint64_t v6 = *((void *)a2 + 6);
  Img4DecodePerformManifestTrustEvaluationWithCallbacks(a1, (uint64_t)&v7, (uint64_t)&v2, 0);
}

uint64_t _CheckAuthorityManifestPropertyCallback()
{
  return 0;
}

uint64_t _CheckAuthorityEvalCertProperties()
{
  return 0;
}

unint64_t DERImg4DecodePrintProperty(unint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v14 = 0;
  unint64_t v13 = 0;
  uint64_t v9 = *(void *)(result + 40);
  if (v9 <= 0)
  {
    if (v9 != 0xA000000000000000)
    {
      if (v9 != 0xA000000000000001) {
        return result;
      }
      uint64_t v10 = "MUST NOT EXIST";
      goto LABEL_18;
    }
    strcpy((char *)a2, "MUST EXIST");
  }
  else
  {
    switch(v9)
    {
      case 4:
        uint64_t v11 = *(unsigned __int8 **)(result + 24);
        if (*(void *)(result + 32) >= 0x40uLL) {
          unint64_t v12 = 64;
        }
        else {
          unint64_t v12 = *(void *)(result + 32);
        }
        return sprintdgst_npx(a2, v11, v12, a4, a5, a6, a7, a8);
      case 2:
        uint64_t result = DERParseInteger64((char **)(result + 24), &v13);
        if (result)
        {
LABEL_17:
          uint64_t v10 = "decode failure";
LABEL_18:
          *(void *)a2 = *(void *)v10;
          *(void *)(a2 + 7) = *(void *)(v10 + 7);
          return result;
        }
        return snprintf((char *)a2, 0x81uLL, "0x%llx");
      case 1:
        uint64_t result = DERParseBoolean((unsigned __int8 **)(result + 24), &v14);
        if (!result) {
          return snprintf((char *)a2, 0x81uLL, "%s");
        }
        goto LABEL_17;
      default:
        return result;
    }
  }
  return result;
}

uint64_t CTImg4GetDigestType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 8);
  if (v9 == 5 && !memcmp(*(const void **)a1, &_oidSha1, 5uLL)) {
    return 1;
  }
  if (v9 == 9 && !memcmp(*(const void **)a1, &_oidSha224, 9uLL)) {
    return 2;
  }
  if (v9 == 9 && !memcmp(*(const void **)a1, &_oidSha256, 9uLL)) {
    return 4;
  }
  if (v9 == 9 && !memcmp(*(const void **)a1, &_oidSha384, 9uLL)) {
    return 8;
  }
  if (v9 != 9 || memcmp(*(const void **)a1, &_oidSha512, 9uLL)) {
    __panic_npx("panic: unsupported digest type: oid len = %lu", a2, a3, a4, a5, a6, a7, a8, v9);
  }
  return 16;
}

uint64_t (**CTImg4GetDecodeImplementation(const DERItem *a1))()
{
  if (a1 == &oidSha1Rsa) {
    return _ctImg4RsaSha1Impl;
  }
  if (a1 == &oidSha224Rsa) {
    return 0;
  }
  if (a1 == &oidSha256Rsa) {
    return _ctImg4RsaSha256Impl;
  }
  if (a1 == &oidSha384Rsa) {
    return _ctImg4RsaSha384Impl;
  }
  uint64_t v1 = _ctImg4EcdsaSha1Impl;
  long long v2 = _ctImg4EcdsaSha256Impl;
  uint64_t v3 = _ctImg4EcdsaSha384Impl;
  if (a1 == &oidSha512Ecdsa) {
    uint64_t v4 = _ctImg4EcdsaSha512Impl;
  }
  else {
    uint64_t v4 = 0;
  }
  if (a1 != &oidSha384Ecdsa) {
    uint64_t v3 = v4;
  }
  if (a1 != &oidSha256Ecdsa) {
    long long v2 = v3;
  }
  if (a1 == &oidSha224Ecdsa) {
    long long v5 = 0;
  }
  else {
    long long v5 = v2;
  }
  if (a1 != &oidSha1Ecdsa) {
    uint64_t v1 = v5;
  }
  if (a1 == &oidSha512Rsa) {
    return _ctImg4RsaSha512Impl;
  }
  else {
    return v1;
  }
}

unint64_t _Img4DecodePayloadPropertiesGetTag(uint64_t a1)
{
  return a1 | 0xE000000000000000;
}

uint64_t _chip_decode_select_static(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  expert_log(a2, 2uLL, (uint64_t)"%s: decode selection: static", a4, a5, a6, a7, a8, *(void *)(a1 + 8));
  uint64_t result = *(void *)(a1 + 32);
  if (!result) {
    __panic_npx("panic: illegal chip definition: no static decode implementation: %s", v9, v10, v11, v12, v13, v14, v15, *(void *)(a1 + 8));
  }
  return result;
}

uint64_t chip_get_name(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t _chip_decode_select_trust_store(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  unint64_t v63 = 0;
  uint64_t v64 = 0;
  unint64_t v59 = 0;
  uint64_t v60 = 0;
  unint64_t v61 = 0;
  char v66 = 0;
  memset(v65, 0, sizeof(v65));
  expert_log(a2, 2uLL, (uint64_t)"%s: decode selection: trust store [0x%llx]", a4, a5, a6, a7, a8, *(void *)(a1 + 8));
  if (*(void *)(a1 + 32)) {
    __panic_npx("panic: illegal chip definition: trust store cannot override static decode implementation: %s", v11, v12, v13, v14, v15, v16, v17, *(void *)(a1 + 8));
  }
  if (expert_query_trust_store(a2, *(void *)(a1 + 56), a1, (uint64_t)&v63, (uint64_t)&v64))
  {
    expert_log(a2, 0, (uint64_t)"%s: failed to query anchor: 0x%llx: %d", v18, v19, v20, v21, v22, *(void *)(a1 + 8));
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(void))(a1 + 48))();
    unint64_t v30 = *(void *)(result + 24);
    uint64_t v29 = *(unsigned __int8 **)(result + 32);
    if (v29 > &v29[v30])
    {
      __break(0x5519u);
      return result;
    }
    v62[0] = *(void *)(result + 32);
    v62[1] = v30;
    sprintdgst_npx((unint64_t)v65, v29, v30, v24, v25, v26, v27, v28);
    expert_log(a2, 1uLL, (uint64_t)"%s: retrieved pinned root from trust store: type = 0x%llx, length = %lu, oid = %s, oid length = %lu", v31, v32, v33, v34, v35, *(void *)(a1 + 8));
    if (DERDecodeItem((uint64_t)v62, &v59))
    {
      expert_log(a2, 0, (uint64_t)"%s: DERDecodeItem: %d", v36, v37, v38, v39, v40, *(void *)(a1 + 8));
    }
    else
    {
      sprintdgst_npx((unint64_t)v65, v60, v61, v36, v37, v38, v39, v40);
      expert_log(a2, 1uLL, (uint64_t)"%s: finding digest algorithm for oid: %s", v41, v42, v43, v44, v45, *(void *)(a1 + 8));
      int DigestType = CTImg4GetDigestType((uint64_t)&v60, v46, v47, v48, v49, v50, v51, v52);
      if (!CTImg4CreateContext(v63, v64, DigestType, 0, a3)) {
        return *(void *)a3;
      }
      expert_log(a2, 0, (uint64_t)"%s: failed to parse root: %d", v54, v55, v56, v57, v58, *(void *)(a1 + 8));
    }
  }
  return 0;
}

uint64_t chip_dump(uint64_t a1, mach_header_64 *mhp, unint64_t a3)
{
  uint64_t size = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v6 = getsectdatafromheader_64(mhp, "__DATA_CONST", "__image4_chp", &size);
  uint64_t v7 = (uint64_t)&v6[_dyld_get_image_slide()];
  uint64_t size = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v8 = getsectdatafromheader_64(mhp, "__DATA_CONST", "__image4_chp", &size);
  uint64_t result = _dyld_get_image_slide();
  if (v7 < (unint64_t)&v8[result + size])
  {
    do
    {
      v7 += 8;
      expert_log(a1, a3, (uint64_t)"%6s  %-36s : %s", v10, v11, v12, v13, v14, (uint64_t)&unk_263C166AB);
      uint64_t size = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v15 = getsectdatafromheader_64(mhp, "__DATA_CONST", "__image4_chp", &size);
      uint64_t result = _dyld_get_image_slide();
    }
    while (v7 < (unint64_t)&v15[result + size]);
  }
  return result;
}

unint64_t chip_get_property_expert(uint64_t a1, void *a2)
{
  uint64_t v4 = chip_expert(a1);
  unint64_t v5 = v4;
  if (!v4) {
    return v5;
  }
  unint64_t v6 = v4 + 288;
  unint64_t v7 = chip_expert_instance(a1);
  unint64_t v15 = *(void *)(a1 + 16);
  if (v15 - 2 >= 2 && v15 != 0)
  {
    if (v15 != 1) {
      goto LABEL_16;
    }
    if (!chip_instance_check(v7, a2, v9, v10, v11, v12, v13, v14))
    {
      unint64_t v6 = 0;
      unint64_t v5 = 0;
    }
    unint64_t v15 = *(void *)(a1 + 16);
  }
  if (v15 < a2[10]) {
    return 0;
  }
  if (v5 && v5 >= v6)
  {
    __break(0x5519u);
LABEL_16:
    __panic_npx("panic: unreachable case: %s = 0x%llx", v8, v9, v10, v11, v12, v13, v14, (char)"chp->chp_type");
  }
  return v5;
}

unint64_t chip_select_property_expert(uint64_t a1, void *a2, uint64_t a3)
{
  if (a1)
  {
    if (*(void *)(a1 + 256)) {
      unint64_t v6 = *(char ***)(a1 + 256);
    }
    else {
      unint64_t v6 = &_property_DGST;
    }
    if (!property_equal((uint64_t)a2, (uint64_t)v6))
    {
      property_uint64_t expert = chip_get_property_expert(a1, a2);
      if (property_expert) {
        return property_expert;
      }
    }
  }
  return a3;
}

char **chip_get_digest(uint64_t a1)
{
  if (*(void *)(a1 + 256)) {
    return *(char ***)(a1 + 256);
  }
  else {
    return &_property_DGST;
  }
}

uint64_t chip_get_constraint(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3 == 33) {
    return a2;
  }
  unint64_t v4 = *(void *)(result + 64);
  if (!v4) {
    goto LABEL_17;
  }
  unint64_t v5 = (uint64_t *)(v4 + 8 * v3);
  if ((unint64_t)v5 >= v4 + 264 || (unint64_t)v5 < v4) {
    goto LABEL_19;
  }
  uint64_t result = *v5;
  if (!*v5)
  {
LABEL_17:
    if (!a3) {
      return a2;
    }
    unint64_t v7 = (uint64_t *)(a3 + 8 * v3);
    if ((unint64_t)v7 >= a3 + 264 || (unint64_t)v7 < a3)
    {
LABEL_19:
      __break(0x5519u);
      return result;
    }
    uint64_t result = *v7;
    if (!*v7) {
      return a2;
    }
  }
  return result;
}

uint64_t chip_select_decode(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 40))();
}

uint64_t chip_check_entitlement(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = 0;
  uint64_t v4 = a1 + 120;
  while (1)
  {
    uint64_t v5 = *(void *)(v4 + v3);
    if (!v5) {
      return 0xFFFFFFFFLL;
    }
    if (property_equal(a2, v5)) {
      break;
    }
    v3 += 8;
    if (v3 == 40) {
      return 0xFFFFFFFFLL;
    }
  }
  return 0;
}

uint64_t chip_get_anti_replay(uint64_t a1)
{
  return *(void *)(a1 + 160);
}

uint64_t chip_get_pivot(uint64_t a1)
{
  return *(void *)(a1 + 192);
}

uint64_t chip_get_anti_replay_sideload(uint64_t a1)
{
  return *(void *)(a1 + 176);
}

uint64_t chip_get_mix_n_match(uint64_t a1)
{
  return *(void *)(a1 + 184);
}

uint64_t chip_get_notary(uint64_t a1)
{
  return *(void *)(a1 + 248);
}

uint64_t __handle_absence_0(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 = 0;
  return 0;
}

void _prepare_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v29[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(*(void *)a3 + 24);
  uint64_t v5 = *(void *)(v4 + 8);
  v29[0] = 0;
  v29[1] = 0;
  size_t v24 = 0;
  size_t __n = 0;
  memset(v28, 0, sizeof(v28));
  memset(v27, 0, sizeof(v27));
  memset(v26, 0, sizeof(v26));
  uint64_t boot_nonce = image4_environment_callout_query_boot_nonce(v4, (uint64_t)v29, (uint64_t)&__n);
  if (!boot_nonce)
  {
    if (__n <= 0x10)
    {
      nonce_init(v28, v29, __n, v7, v8, v9, v10, v11);
      odometer_prepare_nonce(a2, v28, v18, v19, v20, v21, v22, v23);
      return;
    }
    goto LABEL_12;
  }
  if (boot_nonce != 45)
  {
    expert_log(v5, 0, (uint64_t)"failed to get boot nonce from callback: %d", v7, v8, v9, v10, v11, boot_nonce);
    return;
  }
  uint64_t nonce_digest = image4_environment_callout_query_nonce_digest(v4, (uint64_t)v27, (uint64_t)&v24);
  if (nonce_digest != 45)
  {
    if (!nonce_digest)
    {
      if (v24 <= 0x40)
      {
        digest_init((uint64_t)v26, v27, v24, v13, v14, v15, v16, v17);
        odometer_prepare_nonce_hash(a2, (uint64_t)v26);
        return;
      }
LABEL_12:
      __break(0x5519u);
      return;
    }
    expert_log(v5, 0, (uint64_t)"failed to get nonce digest from callback: %d", v13, v14, v15, v16, v17, nonce_digest);
  }
}

uint64_t _get_constraint_mask_2()
{
  return 0;
}

uint64_t _extract_payload_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v7 = *(unsigned __int16 *)(a3 + 528);
  memset(&v12[3], 0, 32);
  if (v7) {
    unint64_t v8 = a3 + 528;
  }
  else {
    unint64_t v8 = 0;
  }
  memset(&v12[1], 0, 32);
  if (v7) {
    uint64_t v9 = a3 + 72;
  }
  else {
    uint64_t v9 = 0;
  }
  v12[0] = 0uLL;
  uint64_t v10 = manifest_measure(a3, a2, (uint64_t)v12);
  *a5 = *(void *)(*(uint64_t (**)(uint64_t))(a2 + 48))(v10);
  if (v9 + 456 > v8) {
    __break(0x5519u);
  }
  return v9 + 328;
}

void *_payload_img4_get_measured_bytes(void *result, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*((_WORD *)result + 44)) {
    __panic_npx("panic: optional not set", (uint64_t)a2, a3, a4, a5, a6, a7, a8, vars0);
  }
  unint64_t v9 = result[6];
  uint64_t v8 = result[7];
  if (v9 > v9 + v8)
  {
    __break(0x5519u);
  }
  else
  {
    return buff_init_wrap(a2, v9, v8);
  }
  return result;
}

uint64_t payload_init(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t **a4)
{
  *(_WORD *)(a1 + 88) = 1;
  return a1;
}

double _payload_init(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  if (!a3) {
    a3 = generic_expert_specialist();
  }
  *(void *)a1 = a3;
  *(void *)(a1 + 8) = fourcc_copy(a1 + 16, a2);
  *(void *)(a1 + 32) = _payload_callbacks_bare;
  *(void *)(a1 + 40) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  return result;
}

uint64_t payload_init_borrow(uint64_t a1, uint64_t a2, unsigned int *a3, void *a4)
{
  *(void *)(a1 + 96) = a4;
  *(_WORD *)(a1 + 88) = 1;
  return a1;
}

uint64_t payload_init_wrap(uint64_t a1, uint64_t a2, unsigned int *a3, void *a4)
{
  *(_WORD *)(a1 + 88) = 1;
  return a1;
}

uint64_t payload_init_empty(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  return a1;
}

uint64_t payload_set_callbacks(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 32) = a2;
  *(void *)(result + 40) = a3;
  return result;
}

uint64_t payload_parse(uint64_t *a1)
{
  int v23 = 0;
  unint64_t v9 = _payload_parse_internal((uint64_t)a1);
  if (!v9)
  {
    unsigned int PayloadType = Img4DecodeGetPayloadType((uint64_t)(a1 + 14), &v23);
    if (!PayloadType)
    {
      uint64_t v22 = (_DWORD *)a1[1];
      if (*v22 == v23) {
        return 0;
      }
      expert_log(*a1, 0, (uint64_t)"%s: unexpected payload type: actual = %s, expected = %s", v11, v12, v13, v14, v15, (uint64_t)(v22 + 1));
      return 79;
    }
    unint64_t v9 = posixdr(PayloadType);
    expert_log(*a1, 0, (uint64_t)"%s: Img4DecodeGetPayloadType: %d", v16, v17, v18, v19, v20, a1[1] + 4);
  }
  if (v9 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return v9;
}

unint64_t _payload_parse_internal(uint64_t a1)
{
  if (!*(_WORD *)(a1 + 88)) {
    return 0;
  }
  unint64_t result = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  if (result <= result + v3)
  {
    Img4DecodeInitAsPayload(result, v3, a1 + 112);
    if (v4)
    {
      uint64_t v5 = posixdr(v4);
      expert_log(*(void *)a1, 0, (uint64_t)"%s: Img4DecodeInitAsPayload: %d", v6, v7, v8, v9, v10, *(void *)(a1 + 8) + 4);
      if (v5 >= 0x6A) {
        __panic_npx("panic: error not set to valid posix code: %d", v11, v12, v13, v14, v15, v16, v17, v5);
      }
      return v5;
    }
    *(void *)(a1 + 104) = a1 + 112;
    if (*(uint64_t (***)())(a1 + 32) == _payload_callbacks_bare)
    {
      uint64_t v5 = 0;
      *(void *)(a1 + 32) = _payload_callbacks_im4p;
      return v5;
    }
    return 0;
  }
  __break(0x5519u);
  return result;
}

uint64_t payload_measure(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t, void))(a1 + 32))(a1, a2, a3, *(void *)(a1 + 40));
}

uint64_t payload_get_decoded_bytes(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)(a1 + 32) + 8))(a1, a2, *(void *)(a1 + 40));
}

void *payload_get_encoded_bytes(uint64_t a1, void *a2)
{
  return buff_init_wrap(a2, *(void *)(*(void *)(a1 + 104) + 8), *(void *)(*(void *)(a1 + 104) + 16));
}

unint64_t *payload_destroy(unint64_t *result)
{
  unint64_t v1 = *result;
  if (*result)
  {
    uint64_t v2 = result;
    uint64_t v3 = (void *)(v1 + 48);
    if (!*(_WORD *)(v1 + 88)) {
      uint64_t v3 = 0;
    }
    uint64_t v5 = v3;
    uint64_t v4 = *(void *)(v1 + 96);
    if (v4) {
      buff_return(v4, &v5);
    }
    unint64_t result = buff_destroy(&v5);
    *(_WORD *)(v1 + 88) = 0;
    if (v1 >= v1 + 568)
    {
      __break(0x5519u);
    }
    else
    {
      unint64_t result = (unint64_t *)(*(uint64_t (**)(unint64_t, void))(*(void *)(v1 + 32) + 16))(v1, *(void *)(v1 + 40));
      *uint64_t v2 = 0;
    }
  }
  return result;
}

uint64_t _payload_im4p_measure(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v6 = *a1;
  uint64_t v46 = 0;
  memset(v47, 0, sizeof(v47));
  unint64_t alloc_preference = _type_get_alloc_preference((uint64_t)&_image4_type_decode_context);
  if (alloc_preference <= 1) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = alloc_preference;
  }
  if (v15 == 1) {
    goto LABEL_8;
  }
  if (v15 != 2) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", v8, v9, v10, v11, v12, v13, v14, (char)"_t_preference");
  }
  uint64_t v16 = _expert_alloc_type(v6, (uint64_t)&_image4_type_decode_context);
  if (!v16)
  {
LABEL_8:
    uint64_t size = type_get_size((uint64_t)&_image4_type_decode_context);
    unint64_t v25 = MEMORY[0x270FA5388](size, v18, v19, v20, v21, v22, v23, v24);
    uint64_t v26 = (_OWORD *)((char *)&v45 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v25 >= 0x31) {
      size_t v27 = v25 - 48;
    }
    else {
      size_t v27 = 0;
    }
    memset(v26 + 3, 170, v27);
    *uint64_t v26 = 0u;
    v26[1] = 0u;
    v26[2] = 0u;
  }
  else
  {
    uint64_t v46 = v16;
  }
  uint64_t v28 = chip_select_decode(a2);
  if (!v28) {
    __panic_npx("panic: no decode implementation available for chip: %s", v29, v30, v31, v32, v33, v34, v35, *(void *)(a2 + 8));
  }
  uint64_t v36 = v28;
  uint64_t v37 = *(size_t **)(v28 + 32);
  size_t v38 = *v37;
  if (*v37 > 0x40)
  {
    __break(0x5519u);
LABEL_18:
    __panic_npx("panic: Img4DecodeCopyPayloadDigest: %d", v29, v30, v36, v32, v33, v34, v35, v28);
  }
  LODWORD(v28) = Img4DecodeCopyPayloadDigest(a1[13], v47, *v37, (uint64_t (**)(void, void, _OWORD *, size_t, void))v28);
  if (v28) {
    goto LABEL_18;
  }
  _expert_dealloc_type(v6, (uint64_t)&_image4_type_decode_context, &v46);
  return digest_init(a3, v47, v38, v39, v40, v41, v42, v43);
}

void *_payload_bare_measure(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_WORD *)(a1 + 88)) {
    __panic_npx("panic: optional not set", a2, (uint64_t)a3, a4, a5, a6, a7, a8, v17);
  }
  uint64_t v10 = (void *)(*(uint64_t (**)(void))(a2 + 48))();

  return digest_init_measure(a3, v10, a1 + 48, v11, v12, v13, v14, v15);
}

void *_payload_bare_get_measured_bytes(void *result, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*((_WORD *)result + 44)) {
    __panic_npx("panic: optional not set", (uint64_t)a2, a3, a4, a5, a6, a7, a8, vars0);
  }
  unint64_t v9 = result[6];
  uint64_t v8 = result[7];
  if (v9 > v9 + v8)
  {
    __break(0x5519u);
  }
  else
  {
    return buff_init_wrap(a2, v9, v8);
  }
  return result;
}

void *_payload_im4p_get_measured_bytes(uint64_t a1, void *a2)
{
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  int Payload = Img4DecodeGetPayload(*(void *)(a1 + 104), (uint64_t)&v12);
  if (Payload) {
    __panic_npx("panic: Img4DecodeGetPayload: %d", v4, v5, v6, v7, v8, v9, v10, Payload);
  }
  return buff_init_wrap(a2, v12, v13);
}

uint64_t darwin_uuid_parse(unsigned char *a1, unsigned __int8 *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (!*a1) {
    return 2;
  }
  *(void *)&v6[13] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v5 = v3;
  *(_OWORD *)uint64_t v6 = v3;
  __strlcpy_chk();
  if (uuid_parse((const char *)&v5, a2)) {
    return 22;
  }
  else {
    return 0;
  }
}

uint64_t image4_auditor_post(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  image4_audit_event_init((uint64_t *)v10, a2, a3, a4, a5, a6, a7, a8);
  return (*(uint64_t (**)(uint64_t, _OWORD *, void))(*(void *)(a1 + 80) + 8))(a1, v10, *(void *)(a1 + 88));
}

uint64_t *image4_audit_event_init(uint64_t *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *a1 = a2;
  unsigned int v8 = *(_DWORD *)(a2 + 56);
  if (v8 >= 4) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"p->p_container");
  }
  a1[34] = qword_263C0D4B0[v8];
  if (a3 >= 4) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"mfr");
  }
  a1[33] = a3;
  if (a4)
  {
    a1[1] = image4_audit_value_init((uint64_t)(a1 + 2), a2, a4, a4, a5, a6, a7, a8);
    a1[17] = image4_audit_value_init((uint64_t)(a1 + 18), a2, a5, v12, v13, v14, v15, v16);
  }
  return a1;
}

uint64_t image4_auditor_interpose_decode(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 16) = _AuditorComputeDigest;
  uint64_t result = a1 + 16;
  *(void *)(result + 8) = _AuditorVerifyChain;
  *(void *)(result + 16) = _AuditorVerifySignature;
  *(void *)(result + 24) = _AuditorEvaluateCertificateProperties;
  *(_OWORD *)(result + 32) = v3;
  *(void *)(result - 8) = result;
  *(void *)(result + 48) = v2;
  *(void *)(result + 56) = a2;
  return result;
}

uint64_t _AuditorComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = __current();
  uint64_t result = (**(uint64_t (***)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 72))(a1, a2, a3, a4, a5);
  if (result) {
    __panic_npx("panic: digest computation failed: %d", v12, v13, v14, v15, v16, v17, v18, result);
  }
  return result;
}

uint64_t _AuditorVerifyChain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = __current();
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 + 72) + 8))(a1, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v23 = v17;
  if (v17) {
    _auerr(v16, v17, "certificate chain verification failed: %d", v18, v19, v20, v21, v22, v17);
  }
  return v23;
}

uint64_t _AuditorVerifySignature(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = __current();
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 + 72) + 16))(a1, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v23 = v17;
  if (v17) {
    _auerr(v16, v17, "signature verification failed: %d", v18, v19, v20, v21, v22, v17);
  }
  return v23;
}

uint64_t _AuditorEvaluateCertificateProperties(void *a1)
{
  uint64_t v2 = __current();
  uint64_t v8 = v2;
  v87[0] = 0;
  v87[1] = 0;
  v85[1] = 0;
  uint64_t v86 = 0;
  uint64_t v84 = 0;
  v85[0] = 0;
  if (!a1[40])
  {
    _auerr(v2, 0, "certificate properties invalid length: actual = %lu, expected > 0", v3, v4, v5, v6, v7, 0);
    return 3;
  }
  uint64_t v9 = DERDecodeSeqInit((uint64_t)(a1 + 39), &v86, v87);
  if (v9)
  {
    uint64_t v15 = v9;
    _auerr(v8, v9, "DERDecodeSeqInit: %d", v10, v11, v12, v13, v14, v9);
    return v15;
  }
  if (v86 != 0x2000000000000011)
  {
    _auerr(v8, 0, "bad certificate tag: actual = 0x%llx, expected = 0x%llx", v10, v11, v12, v13, v14, v86);
    return 2;
  }
  uint64_t v16 = v85;
LABEL_7:
  while (2)
  {
    int v17 = DERDecodeSeqNext(v87, (unint64_t *)&v84);
    if (v17)
    {
      if (v17 != 1) {
        __panic_npx("panic: exited enforcement loop with bogus value: dr = %d", v18, v19, v20, v21, v22, v23, v24, v17);
      }
      return 0;
    }
    int v83 = 0;
    uint64_t v82 = 0;
    *(_OWORD *)uint64_t v81 = 0uLL;
    uint64_t v78 = 0;
    uint64_t v79 = 0;
    size_t v80 = 0;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v75 = 0u;
    v74[0] = 0;
    v74[1] = 0;
    long long v73 = 0u;
    memset(v72, 0, sizeof(v72));
    long long __s2 = 0uLL;
    fourcc_init((uint64_t)&v82, v84);
    uint64_t v30 = a1 + 7;
    switch(v84)
    {
      case 0xE00000004D414E50:
        goto LABEL_12;
      case 0xE00000004F424A50:
        uint64_t v30 = a1 + 9;
        if (!a1[9])
        {
          uint64_t v30 = a1 + 9;
          if (!a1[10]) {
            continue;
          }
        }
LABEL_12:
        *(_OWORD *)uint64_t v81 = *v30;
        uint64_t v31 = v16;
        uint64_t v32 = DERImg4DecodeProperty(v16, v84, (uint64_t)&v75);
        if (v32)
        {
          uint64_t v67 = v32;
          _auerr(v8, v32, "DERImg4DecodeProperty: %d", v33, v34, v35, v36, v37, v32);
          return v67;
        }
        if (*((void *)&v77 + 1) != 0x2000000000000011)
        {
          _auerr(v8, 0, "unexpected certificate dictionary type: actual = 0x%llx, expected = 0x%llx", v33, v34, v35, v36, v37, SBYTE8(v77));
          return 2;
        }
        size_t v38 = DERDecodeSeqContentInit((unint64_t *)&v76 + 1, v74);
        if (v38)
        {
          uint64_t v67 = (uint64_t)v38;
          _auerr(v8, (uint64_t)v38, "DERDecodeSeqContentInit: %d", v39, v40, v41, v42, v43, (char)v38);
          return v67;
        }
        while (1)
        {
          int v44 = DERDecodeSeqNext(v74, (unint64_t *)&v78);
          if (v44)
          {
            uint64_t v16 = v31;
            if (v44 != 1) {
              __panic_npx("panic: bogus exit from enforcement loop: pdr = %d", v45, v46, v47, v48, v49, v50, v51, v44);
            }
            goto LABEL_7;
          }
          memset(v70, 0, sizeof(v70));
          fourcc_init((uint64_t)&v82, v78);
          uint64_t v52 = DERImg4DecodeProperty(&v79, v78, (uint64_t)v72);
          if (v52) {
            goto LABEL_33;
          }
          int v58 = *((void *)&v73 + 1) == 0xA000000000000001;
          DERImg4DecodeContentFindItemWithTag(v81, v78, &__s2);
          if (v64 != v58) {
            break;
          }
          if (*((void *)&v73 + 1) <= 4uLL && ((1 << SBYTE8(v73)) & 0x16) != 0)
          {
            uint64_t v52 = DERImg4DecodeProperty(&__s2, v78, (uint64_t)v70);
            if (v52)
            {
LABEL_33:
              uint64_t v67 = v52;
              _auerr(v8, v52, "DERImg4DecodeProperty: %s: %d", v53, v54, v55, v56, v57, (char)&v82 + 4);
              return v67;
            }
            if (v80 == *((void *)&__s2 + 1) && !memcmp(v79, (const void *)__s2, v80)) {
              aupost(v8, (uint64_t)&v82, 0, (uint64_t)v72, (uint64_t)v70, v55, v56, v57);
            }
            else {
              aupost(v8, (uint64_t)&v82, 1, (uint64_t)v72, (uint64_t)v70, v55, v56, v57);
            }
          }
          else
          {
            if ((unint64_t)(*((void *)&v73 + 1) + 0x6000000000000000) >= 2)
            {
              _auerr(v8, 0, "unexpected certificate property type: tag = %s, type = 0x%llx", v59, v60, v61, v62, v63, (char)&v82 + 4);
              return 2;
            }
            uint64_t v65 = v8;
            uint64_t v66 = 0;
LABEL_27:
            aupost(v65, (uint64_t)&v82, v66, (uint64_t)v72, 0, v61, v62, v63);
          }
        }
        uint64_t v65 = v8;
        uint64_t v66 = 1;
        goto LABEL_27;
      case 0xE00000006D616E78:
        _auerr(v8, 0, "manx section constraints not implemented", v25, v26, v27, v28, v29, v69);
        return 4;
    }
  }
  _auerr(v8, 0, "unexpected section tag: %s", v25, v26, v27, v28, v29, (char)&v82 + 4);
  return 2;
}

uint64_t image4_audit_value_init(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)uint64_t result = a2;
  long long v8 = *(_OWORD *)a3;
  long long v9 = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(result + 32) = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(result + 48) = v9;
  *(_OWORD *)(result + 16) = v8;
  long long v10 = *(_OWORD *)(a3 + 48);
  long long v11 = *(_OWORD *)(a3 + 64);
  long long v12 = *(_OWORD *)(a3 + 80);
  *(void *)(result + 112) = *(void *)(a3 + 96);
  *(_OWORD *)(result + 80) = v11;
  *(_OWORD *)(result + 96) = v12;
  *(_OWORD *)(result + 64) = v10;
  unint64_t v13 = **(void **)(a2 + 40);
  if (v13 >= 5) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"p->p_type->pt_switchable");
  }
  *(void *)(result + 8) = qword_263C0D4D0[v13];
  return result;
}

uint64_t image4_auditor_new(uint64_t (**a1)(void), uint64_t a2)
{
  uint64_t v4 = generic_expert_specialist();
  uint64_t result = _expert_alloc_type(v4, (uint64_t)&_image4_type_auditor);
  if (result)
  {
    *(void *)(result + 80) = a1;
    *(void *)(result + 88) = a2;
    __current = *a1;
  }
  return result;
}

uint64_t *image4_auditor_destroy(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*result)
  {
    uint64_t v8 = *(void *)*result;
    if (!*(_WORD *)(v8 + 744)) {
      __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, vars0);
    }
    long long v9 = result;
    uint64_t v10 = *(void *)(v8 + 152);
    return (uint64_t *)_expert_dealloc_type(v10, (uint64_t)&_image4_type_auditor, v9);
  }
  return result;
}

uint64_t image4_audit_event_get_section(uint64_t a1)
{
  return *(void *)(a1 + 272);
}

uint64_t image4_audit_event_get_result(uint64_t a1)
{
  return *(void *)(a1 + 264);
}

uint64_t image4_audit_event_get_imposed_value(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t image4_audit_event_get_constrained_value(uint64_t a1)
{
  return *(void *)(a1 + 136);
}

uint64_t image4_audit_value_get_type(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

char *image4_audit_value_print(uint64_t *a1, char *__str, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return property_print_value(*a1, (unint64_t)(a1 + 2), __str, a4, a5, a6, a7, a8);
}

uint64_t _auerr(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
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
  *(_OWORD *)long long __str = 0u;
  long long v13 = 0u;
  vsnprintf(__str, 0x100uLL, a3, &a9);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(a1 + 80) + 16))(a1, __str, a2);
}

uint64_t aupost(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  v37[0] = xmmword_263C0D448;
  memset(&v37[1], 170, 88);
  v36[0] = xmmword_263C0D448;
  memset(&v36[1], 170, 88);
  int v35 = 0;
  uint64_t v13 = *(void *)(a4 + 40);
  if (v13 <= 0)
  {
    if (v13 == 0xA000000000000000)
    {
      long long v14 = &_property_constraint_ex;
    }
    else
    {
      if (v13 != 0xA000000000000001) {
        goto LABEL_20;
      }
      long long v14 = &_property_constraint_nx;
    }
LABEL_14:
    long long v15 = (uint64_t *)&_property_type_BOOL;
    goto LABEL_15;
  }
  if (v13 == 1)
  {
    long long v14 = &_property_constraint_eq;
    goto LABEL_14;
  }
  if (v13 != 2)
  {
    if (v13 == 4)
    {
      long long v14 = &_property_constraint_eq;
      long long v15 = &_property_type_digest;
LABEL_15:
      uint64_t v23 = a2 + 4;
      uint64_t v24 = 0;
      uint64_t v18 = *(void *)a2;
      uint64_t v25 = 33;
      uint64_t v26 = v18;
      int v27 = *(_DWORD *)(a2 + 8);
      goto LABEL_16;
    }
LABEL_20:
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"constraint->type");
  }
  int v16 = DERParseInteger((char **)(a4 + 24), &v35);
  uint64_t v23 = a2 + 4;
  uint64_t v24 = 0;
  uint64_t v17 = *(void *)a2;
  uint64_t v25 = 33;
  uint64_t v26 = v17;
  int v27 = *(_DWORD *)(a2 + 8);
  long long v15 = &_property_type_uint32;
  if (v16) {
    long long v15 = &_property_type_uint64;
  }
  long long v14 = &_property_constraint_eq;
LABEL_16:
  uint64_t v28 = v15;
  uint64_t v29 = v14;
  int v30 = 2;
  long long v31 = xmmword_263C0D150;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  uint64_t v32 = 4;
  if (a5)
  {
    _property_value_init_with_DERImg4(v37, a4);
    _property_value_init_with_DERImg4(v36, a5);
    uint64_t v55 = 0;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v38 = 0u;
    long long v19 = v37;
    long long v20 = v36;
    unint64_t v21 = a3;
  }
  else
  {
    uint64_t v55 = 0;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v38 = 0u;
    unint64_t v21 = a3;
    long long v19 = 0;
    long long v20 = 0;
  }
  image4_audit_event_init((uint64_t *)&v38, (uint64_t)&v23, v21, (uint64_t)v19, (uint64_t)v20, a6, a7, a8);
  return (*(uint64_t (**)(uint64_t, long long *, void))(*(void *)(a1 + 80) + 8))(a1, &v38, *(void *)(a1 + 88));
}

uint64_t _property_value_init_with_DERImg4(void *a1, uint64_t a2)
{
  BOOL v13 = 0;
  int v12 = 0;
  unint64_t v11 = 0;
  uint64_t v4 = (char **)(a2 + 24);
  uint64_t result = DERParseBoolean((unsigned __int8 **)(a2 + 24), &v13);
  if (result)
  {
    uint64_t result = DERParseInteger(v4, &v12);
    if (result)
    {
      uint64_t result = DERParseInteger64(v4, &v11);
      if (result)
      {
        if (a1 && a1 + 10 < a1) {
          __break(0x5519u);
        }
        else {
          return digest_init((uint64_t)a1, *(const void **)(a2 + 24), *(void *)(a2 + 32), v6, v7, v8, v9, v10);
        }
      }
      else
      {
        *a1 = v11;
      }
    }
    else
    {
      *(_DWORD *)a1 = v12;
    }
  }
  else
  {
    *(unsigned char *)a1 = v13;
  }
  return result;
}

uint64_t _chain_manifest_enforceable(uint64_t a1, uint64_t a2)
{
  if (odometer_policy_get_chip_property(a1, *(void *)(a2 + 16)))
  {
    int v3 = *(unsigned __int16 *)(a2 + 320);
    uint64_t v4 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    if (v3)
    {
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v6, v7, v8, v9, v10, name);
      return 0;
    }
    else
    {
      uint64_t v11 = 1;
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: manifest has no chained hash constraint", v6, v7, v8, v9, v10, name);
    }
  }
  else
  {
    uint64_t v12 = *(void *)a2;
    uint64_t v13 = chip_get_name(*(void *)(a2 + 16));
    uint64_t v11 = 1;
    expert_log(v12, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v14, v15, v16, v17, v18, v13);
  }
  return v11;
}

uint64_t _chain_manifest_enforce(uint64_t a1, uint64_t a2)
{
  v34[13] = *MEMORY[0x263EF8340];
  uint64_t chip_property = odometer_policy_get_chip_property(a1, *(void *)(a2 + 16));
  if (!*(_WORD *)(a2 + 320)) {
    __panic_npx("panic: optional not set", v5, v6, v7, v8, v9, v10, v11, v33);
  }
  uint64_t v12 = chip_property;
  *(_OWORD *)uint64_t v34 = xmmword_263C0D4F8;
  memset(&v34[2], 170, 88);
  digest_copy((uint64_t)v34, a2 + 240, v6, v7, v8, v9, v10, v11);
  uint64_t v17 = odometer_enforce_property((uint64_t *)a2, a1, v12, (unsigned __int8 *)v34, v13, v14, v15, v16);
  uint64_t v18 = *(void *)a2;
  uint64_t name = chip_get_name(*(void *)(a2 + 16));
  if (v17)
  {
    expert_log(v18, 0, (uint64_t)"odometer[%s:%s]: boot chain integrity violation: %d", v20, v21, v22, v23, v24, name);
    if (v17 >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v25, v26, v27, v28, v29, v30, v31, v17);
    }
  }
  else
  {
    expert_log(v18, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is consistent with boot chain", v20, v21, v22, v23, v24, name);
  }
  return v17;
}

uint64_t image4_trust_evaluation_prepare_manifest_callbacks(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  if (v2) {
    *(void *)(a2 + 32) = v2;
  }
  return result;
}

unint64_t image4_trust_evaluation_get_result(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v8 = *a5;
  if (v8
    || (result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))(result + 32))(result, a2, a3, a4, &v8), uint64_t v6 = v8, result > result + v8)|| ((*a5 = v8, result) ? (v7 = v6 == 0) : (v7 = 0), v7))
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t darwin_syscall_init(uint64_t a1)
{
  for (uint64_t i = 0; i != 80; i += 5)
  {
    int v3 = &(&__traps)[i];
    size_t v25 = 5;
    if ((sysctlnametomib((&__traps)[i], (int *)&__traps + 2 * i + 3, &v25) & 0x80000000) == 0) {
      *__error() = 0;
    }
    int v9 = *__error();
    if ((v9 - 1) >= 2)
    {
      if (v9)
      {
        uint64_t v17 = (&__traps)[i];
        __error();
        __panic_npx("panic: sysctlnametomib: %s%d", v18, v19, v20, v21, v22, v23, v24, (char)v17);
      }
      uint64_t result = expert_log(a1, 3uLL, (uint64_t)"initialized trap: %s", v4, v5, v6, v7, v8, (uint64_t)(&__traps)[i]);
      LODWORD((&__traps)[i + 4]) = v25;
    }
    else
    {
      uint64_t v10 = (uint64_t)*v3;
      __error();
      uint64_t result = expert_log(a1, 3uLL, (uint64_t)"trap not present trap: %s: %d", v11, v12, v13, v14, v15, v10);
      *((_DWORD *)v3 + 3) = -1;
    }
  }
  return result;
}

char **darwin_syscall_get(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 > 0xF) {
    __panic_npx("panic: invalid trap number: actual = %#llx, expected < %#llx", a2, a3, a4, a5, a6, a7, a8, a1);
  }
  uint64_t v8 = &(&__traps)[5 * a1];
  if (v8 < &__traps || v8 + 5 > (char **)&_darwin_el0_boot_once_once) {
    goto LABEL_8;
  }
  if (!LODWORD((&__traps)[5 * a1 + 4])) {
    return 0;
  }
  if (v8 >= (char **)&_darwin_el0_boot_once_once)
  {
LABEL_8:
    __break(0x5519u);
    return 0;
  }
  return v8;
}

uint64_t darwin_syscall_kmod_copy_abi_version(uint64_t a1, unsigned char *a2)
{
  __int16 v25 = 0;
  uint64_t v24 = 1;
  uint64_t v4 = expert_runtime_boot(a1);
  if (v4)
  {
    uint64_t v10 = v4;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v5, v6, v7, v8, v9, v4);
  }
  else
  {
    if (!dword_26B4347A0) {
      return 78;
    }
    uint64_t v10 = expert_syscall(a1, (uint64_t)&__traps, (uint64_t)&v25 + 1, 1, (uint64_t)&v25, (uint64_t)&v24);
    if (!v10)
    {
      *a2 = v25;
      return v10;
    }
    expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v19, v20, v21, v22, v23, (uint64_t)__traps);
  }
  if (v10 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v11, v12, v13, v14, v15, v16, v17, v10);
  }
  return v10;
}

uint64_t darwin_syscall_kmod_copy_version(uint64_t a1, char *a2)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
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
  long long v43 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  long long v29 = 0u;
  long long v28 = 0u;
  char v27 = 1;
  memset(v26, 0, sizeof(v26));
  char v25 = 1;
  uint64_t v24 = 513;
  uint64_t v4 = expert_runtime_boot(a1);
  if (v4)
  {
    uint64_t v10 = v4;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v5, v6, v7, v8, v9, v4);
  }
  else
  {
    if (!dword_26B4347C8) {
      return 78;
    }
    uint64_t v10 = expert_syscall(a1, (uint64_t)&qword_26B4347A8, (uint64_t)&v27, 513, (uint64_t)&v25, (uint64_t)&v24);
    if (!v10)
    {
      strlcpy(a2, (const char *)v26, 0x200uLL);
      return v10;
    }
    expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v19, v20, v21, v22, v23, qword_26B4347A8);
  }
  if (v10 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v11, v12, v13, v14, v15, v16, v17, v10);
  }
  return v10;
}

uint64_t darwin_syscall_nonce_copy_hash(uint64_t a1, int *a2, int a3, void *a4, void *a5)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  int v42 = 0;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  char v35 = 1;
  int v36 = *a2;
  int v37 = a3;
  unsigned int v34 = 0;
  memset(v33, 0, sizeof(v33));
  char v30 = 1;
  int v31 = v36;
  int v32 = a3;
  uint64_t v29 = 77;
  uint64_t v8 = expert_runtime_boot(a1);
  if (v8)
  {
    uint64_t v14 = v8;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v9, v10, v11, v12, v13, v8);
    goto LABEL_3;
  }
  if (!dword_26B4348B8) {
    return 78;
  }
  uint64_t result = expert_syscall(a1, (uint64_t)&qword_26B434898, (uint64_t)&v35, 77, (uint64_t)&v30, (uint64_t)&v29);
  if (result)
  {
    uint64_t v14 = result;
    expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v23, v24, v25, v26, v27, qword_26B434898);
LABEL_3:
    if (v14 >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v15, v16, v17, v18, v19, v20, v21, v14);
    }
    return v14;
  }
  uint64_t v28 = v34;
  if (v34 <= 0x40)
  {
    memcpy(a4, v33, v34);
    uint64_t v14 = 0;
    *a5 = v28;
    return v14;
  }
  __break(0x5519u);
  return result;
}

uint64_t darwin_syscall_nonce_peek_hash(uint64_t a1, int *a2, int a3, void *a4, void *a5)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  int v42 = 0;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  char v35 = 1;
  int v36 = *a2;
  int v37 = a3;
  unsigned int v34 = 0;
  memset(v33, 0, sizeof(v33));
  char v30 = 1;
  int v31 = v36;
  int v32 = a3;
  uint64_t v29 = 77;
  uint64_t v8 = expert_runtime_boot(a1);
  if (v8)
  {
    uint64_t v14 = v8;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v9, v10, v11, v12, v13, v8);
    goto LABEL_3;
  }
  if (!dword_26B4348E0) {
    return 78;
  }
  uint64_t result = expert_syscall(a1, (uint64_t)&qword_26B4348C0, (uint64_t)&v35, 77, (uint64_t)&v30, (uint64_t)&v29);
  if (result)
  {
    uint64_t v14 = result;
    expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v23, v24, v25, v26, v27, qword_26B4348C0);
LABEL_3:
    if (v14 >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v15, v16, v17, v18, v19, v20, v21, v14);
    }
    return v14;
  }
  uint64_t v28 = v34;
  if (v34 <= 0x40)
  {
    memcpy(a4, v33, v34);
    uint64_t v14 = 0;
    *a5 = v28;
    return v14;
  }
  __break(0x5519u);
  return result;
}

uint64_t darwin_syscall_nonce_roll(uint64_t a1, int *a2, int a3)
{
  char v28 = 1;
  int v29 = *a2;
  int v30 = a3;
  char v25 = 1;
  int v26 = v29;
  int v27 = a3;
  uint64_t v24 = 9;
  uint64_t v4 = expert_runtime_boot(a1);
  if (v4)
  {
    uint64_t v10 = v4;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v5, v6, v7, v8, v9, v4);
    goto LABEL_3;
  }
  if (!dword_26B434908) {
    return 78;
  }
  uint64_t v10 = expert_syscall(a1, (uint64_t)&qword_26B4348E8, (uint64_t)&v28, 9, (uint64_t)&v25, (uint64_t)&v24);
  if (v10)
  {
    expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v19, v20, v21, v22, v23, qword_26B4348E8);
LABEL_3:
    if (v10 >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v11, v12, v13, v14, v15, v16, v17, v10);
    }
  }
  return v10;
}

uint64_t darwin_syscall_nonce_unroll(uint64_t a1, int *a2, int a3)
{
  char v28 = 1;
  int v29 = *a2;
  int v30 = a3;
  char v25 = 1;
  int v26 = v29;
  int v27 = a3;
  uint64_t v24 = 9;
  uint64_t v4 = expert_runtime_boot(a1);
  if (v4)
  {
    uint64_t v10 = v4;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v5, v6, v7, v8, v9, v4);
    goto LABEL_3;
  }
  if (!dword_26B434930) {
    return 78;
  }
  uint64_t v10 = expert_syscall(a1, (uint64_t)&qword_26B434910, (uint64_t)&v28, 9, (uint64_t)&v25, (uint64_t)&v24);
  if (v10)
  {
    expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v19, v20, v21, v22, v23, qword_26B434910);
LABEL_3:
    if (v10 >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v11, v12, v13, v14, v15, v16, v17, v10);
    }
  }
  return v10;
}

uint64_t darwin_syscall_nonce_generate_proposal(uint64_t a1, _DWORD *a2, int a3, void *a4, void *a5, char *a6, unint64_t *a7)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  long long v51 = 0u;
  uint64_t v57 = 0;
  long long v56 = 0u;
  long long v55 = 0u;
  long long v54 = 0u;
  long long v53 = 0u;
  long long v52 = 0u;
  char v50 = 1;
  DWORD2(v51) = *a2;
  HIDWORD(v51) = a3;
  uint64_t v44 = 0;
  uint64_t v49 = 0;
  long long v48 = 0u;
  memset(v47, 0, sizeof(v47));
  char v43 = 1;
  int v45 = DWORD2(v51);
  int v46 = a3;
  uint64_t v42 = 105;
  uint64_t v12 = expert_runtime_boot(a1);
  if (v12)
  {
    uint64_t v18 = v12;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v13, v14, v15, v16, v17, v12);
    goto LABEL_3;
  }
  if (!dword_26B434958) {
    return 78;
  }
  BOOL v27 = a6 != 0;
  if (a7 && a6 && *a7)
  {
    BOOL v27 = 1;
    *(void *)&long long v51 = 1;
  }
  uint64_t v28 = expert_syscall(a1, (uint64_t)&qword_26B434938, (uint64_t)&v50, 105, (uint64_t)&v43, (uint64_t)&v42);
  if (!v28)
  {
    uint64_t v37 = v48;
    if (v48 <= 0x40)
    {
      memcpy(a4, v47, v48);
      *a5 = v37;
      unint64_t v38 = HIDWORD(v49);
      if (!HIDWORD(v49)) {
        return 0;
      }
      unint64_t v36 = *a7;
      if (*a7 <= 0xF) {
LABEL_27:
      }
        __panic_npx("panic: insufficient nonce buffer length: actual = %lu, expected >= %lu", v29, v30, v31, v32, v33, v34, v35, v36);
      long long v39 = a6 + 16;
      if (!v27) {
        long long v39 = 0;
      }
      BOOL v40 = v39 >= a6;
      unint64_t v41 = v39 - a6;
      if (v40 && v36 <= v41 && HIDWORD(v49) <= 0x10 && v36 >= HIDWORD(v49))
      {
        memcpy(a6, (char *)&v48 + 4, HIDWORD(v49));
        uint64_t v18 = 0;
        *a7 = v38;
        return v18;
      }
    }
    __break(0x5519u);
    goto LABEL_27;
  }
  uint64_t v18 = v28;
  expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v31, v32, v33, v34, v35, qword_26B434938);
LABEL_3:
  if (v18 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v19, v20, v21, v22, v23, v24, v25, v18);
  }
  return v18;
}

uint64_t darwin_syscall_nonce_verify(uint64_t a1, int *a2, int a3, uint64_t a4, uint64_t a5, unint64_t a6, _OWORD *a7, unint64_t a8)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  memset(v53, 0, sizeof(v53));
  long long v52 = 0u;
  long long v51 = 0u;
  long long v50 = 0u;
  long long v49 = 0u;
  char v45 = 1;
  uint64_t v46 = a4;
  int v47 = *a2;
  int v48 = a3;
  uint64_t v44 = 0;
  long long v43 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  char v35 = 1;
  uint64_t v36 = a4;
  int v37 = v47;
  int v38 = a3;
  uint64_t v34 = 105;
  uint64_t v12 = expert_runtime_boot(a1);
  if (v12)
  {
    uint64_t v20 = v12;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v15, v16, v17, v18, v19, v12);
    goto LABEL_3;
  }
  if (!dword_26B434980) {
    return 78;
  }
  if (a6 > 0x40) {
    goto LABEL_16;
  }
  __memcpy_chk();
  v53[0] = a6;
  if (!a7 || !a8) {
    goto LABEL_12;
  }
  if (a8 <= 0xF) {
LABEL_17:
  }
    __panic_npx("panic: insufficient nonce buffer length: actual = %lu, expected >= %lu", v13, v14, v15, v16, v17, v18, v19, a8);
  if (a8 != 16)
  {
LABEL_16:
    __break(0x5519u);
    goto LABEL_17;
  }
  *(_OWORD *)&v53[1] = *a7;
  v53[5] = 16;
LABEL_12:
  uint64_t v20 = expert_syscall(a1, (uint64_t)&qword_26B434960, (uint64_t)&v45, 105, (uint64_t)&v35, (uint64_t)&v34);
  if (!v20) {
    return v20;
  }
  expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v29, v30, v31, v32, v33, qword_26B434960);
LABEL_3:
  if (v20 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v21, v22, v23, v24, v25, v26, v27, v20);
  }
  return v20;
}

uint64_t darwin_syscall_image_activate(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v45 = 2;
  uint64_t v11 = *a3;
  uint64_t v46 = a2;
  uint64_t v47 = v11;
  int length_uint32 = buff_get_length_uint32((uint64_t)a3, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8);
  uint64_t v49 = *a4;
  int v50 = buff_get_length_uint32((uint64_t)a4, v12, v13, v14, v15, v16, v17, v18);
  char v40 = 2;
  uint64_t v41 = a2;
  uint64_t v42 = 0;
  uint64_t v44 = 0;
  uint64_t v43 = 0;
  uint64_t v39 = 33;
  uint64_t v19 = expert_runtime_boot(a1);
  if (v19)
  {
    uint64_t v25 = v19;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v20, v21, v22, v23, v24, v19);
    goto LABEL_3;
  }
  if (!dword_26B4349A8) {
    return 78;
  }
  uint64_t v25 = expert_syscall(a1, (uint64_t)&qword_26B434988, (uint64_t)&v45, 33, (uint64_t)&v40, (uint64_t)&v39);
  if (v25)
  {
    expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v34, v35, v36, v37, v38, qword_26B434988);
LABEL_3:
    if (v25 >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v26, v27, v28, v29, v30, v31, v32, v25);
    }
  }
  return v25;
}

uint64_t darwin_syscall_image_dfu(uint64_t a1, int *a2, uint64_t *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  char v41 = 0;
  int v42 = *a2;
  uint64_t v43 = *a3;
  int length_uint32 = buff_get_length_uint32((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8);
  uint64_t v46 = 0;
  uint64_t v45 = 0;
  int v47 = 0;
  char v39 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  *(_DWORD *)((char *)&v37 + 1) = *a2;
  unsigned int v40 = 16;
  uint64_t v36 = 37;
  uint64_t v12 = expert_runtime_boot(a1);
  if (v12)
  {
    uint64_t v18 = v12;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v13, v14, v15, v16, v17, v12);
    goto LABEL_3;
  }
  if (!dword_26B4349D0) {
    return 78;
  }
  uint64_t v27 = expert_syscall(a1, (uint64_t)&qword_26B4349B0, (uint64_t)&v41, 37, (uint64_t)&v37, (uint64_t)&v36);
  if (v27)
  {
    uint64_t v18 = v27;
    expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v30, v31, v32, v33, v34, qword_26B4349B0);
LABEL_3:
    if (v18 >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v19, v20, v21, v22, v23, v24, v25, v18);
    }
    return v18;
  }
  uint64_t v35 = v40;
  if (v40 >= 0x11) {
    __panic_npx("panic: kernel nonce overflows bounds: actual = %u, expected <= %u", v28, v29, v30, v31, v32, v33, v34, v40);
  }
  memcpy(a4, (char *)&v38 + 1, v40);
  uint64_t v18 = 0;
  *a5 = v35;
  return v18;
}

uint64_t darwin_syscall_image_copy_active(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v36 = 1;
  uint64_t v37 = a2;
  uint64_t v38 = *a3;
  int length_uint32 = buff_get_length_uint32((uint64_t)a3, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8);
  char v32 = 1;
  uint64_t v33 = a2;
  uint64_t v34 = 0;
  unsigned int v35 = 0;
  uint64_t v31 = 21;
  uint64_t v11 = expert_runtime_boot(a1);
  if (v11)
  {
    uint64_t v17 = v11;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v12, v13, v14, v15, v16, v11);
  }
  else
  {
    if (!dword_26B4349F8) {
      return 78;
    }
    uint64_t v17 = expert_syscall(a1, (uint64_t)&qword_26B4349D8, (uint64_t)&v36, 21, (uint64_t)&v32, (uint64_t)&v31);
    if (!v17)
    {
      *a4 = v35;
      return v17;
    }
    expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v26, v27, v28, v29, v30, qword_26B4349D8);
  }
  if (v17 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v18, v19, v20, v21, v22, v23, v24, v17);
  }
  return v17;
}

uint64_t posixdr(unsigned int a1)
{
  if (a1 > 7) {
    return 14;
  }
  else {
    return dword_263C0D600[a1];
  }
}

const char *strdr(unsigned int a1)
{
  if (a1 > 7) {
    return "generic error";
  }
  else {
    return off_2655E28F0[a1];
  }
}

uint64_t _chain_sideload_enforceable(uint64_t result, uint64_t *a2)
{
  int v3 = (void *)a2[2];
  uint64_t v4 = v3 + 33;
  if (v3[24] && v3[22])
  {
    if (v3 < v4)
    {
      char name = chip_get_name(a2[2]);
      __panic_npx("panic: illegal chip definition: sideload and pivot policies defined: %s", v22, v23, v24, v25, v26, v27, v28, name);
    }
    goto LABEL_12;
  }
  if (v3 >= v4)
  {
LABEL_12:
    __break(0x5519u);
    return result;
  }
  if (odometer_policy_get_chip_property(result, a2[2]))
  {
    uint64_t v5 = v3[31];
    uint64_t v6 = *a2;
    uint64_t v7 = chip_get_name(a2[2]);
    if (v5)
    {
      expert_log(v6, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v8, v9, v10, v11, v12, v7);
      return 0;
    }
    else
    {
      uint64_t v13 = 1;
      expert_log(v6, 1uLL, (uint64_t)"odometer[%s:%s]: sideload chip has no notary", v8, v9, v10, v11, v12, v7);
    }
  }
  else
  {
    uint64_t v14 = *a2;
    uint64_t v15 = chip_get_name(a2[2]);
    uint64_t v13 = 1;
    expert_log(v14, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v16, v17, v18, v19, v20, v15);
  }
  return v13;
}

uint64_t _chain_sideload_enforce(uint64_t a1, uint64_t a2)
{
  v33[13] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  *(_OWORD *)uint64_t v33 = xmmword_263C0D620;
  memset(&v33[2], 170, 88);
  if (*(unsigned char *)(a2 + 440))
  {
    uint64_t v6 = *(void *)a2;
    uint64_t name = chip_get_name(v5);
    expert_log(v6, 1uLL, (uint64_t)"odometer[%s:%s]: manifest self-entitled for mix-n-match; relaxing chain integrity policy",
      v7,
      v8,
      v9,
      v10,
      v11,
      name);
    return 0;
  }
  manifest_measure(v4, v5, (uint64_t)v33);
  uint64_t v12 = odometer_enforce_property((uint64_t *)a2, a1, (uint64_t)&_property_bmfh, (unsigned __int8 *)v33, v13, v14, v15, v16);
  uint64_t v17 = *(void *)a2;
  uint64_t v18 = chip_get_name(*(void *)(a2 + 16));
  if (!v12)
  {
    expert_log(v17, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is consistent with boot chain", v19, v20, v21, v22, v23, v18);
    return 0;
  }
  expert_log(v17, 0, (uint64_t)"odometer[%s:%s]: boot chain integrity violation: %d", v19, v20, v21, v22, v23, v18);
  if (v12 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v24, v25, v26, v27, v28, v29, v30, v12);
  }
  return v12;
}

uint64_t digest_check_buff(uint64_t a1, unint64_t a2)
{
  if (a2 <= 0x40) {
    return 0;
  }
  else {
    return 84;
  }
}

uint64_t digest_init(uint64_t a1, const void *a2, size_t __n, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (__n >= 0x41) {
    __panic_npx("panic: digest length overflow: actual = %lu, expected <= %lu", (uint64_t)a2, __n, a4, a5, a6, a7, a8, __n);
  }
  memcpy((void *)(a1 + 8), a2, __n);
  *(void *)(a1 + 72) = __n;
  return a1;
}

void *digest_init_measure(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*a2 >= 0x41uLL) {
    __panic_npx("panic: digest length overflow: actual = %lu, expected <= %lu", (uint64_t)a2, a3, a4, a5, a6, a7, a8, *a2);
  }
  ccdigest();
  a1[9] = *a2;
  *a1 = a2;
  return a1;
}

uint64_t digest_copy(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8 = *(void *)(a2 + 72);
  if (v8 < 0x41) {
    return digest_init(result, (const void *)(a2 + 8), v8, a4, a5, a6, a7, a8);
  }
  __break(0x5519u);
  return result;
}

uint64_t digest_compare(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 72);
  if (v2 == *(void *)(a2 + 72)) {
    return memcmp((const void *)(a1 + 8), (const void *)(a2 + 8), v2);
  }
  else {
    return 1;
  }
}

uint64_t digest_compare_buff(uint64_t a1, const void *a2, size_t a3)
{
  if (*(void *)(a1 + 72) == a3) {
    return memcmp((const void *)(a1 + 8), a2, a3);
  }
  else {
    return 1;
  }
}

unint64_t digest_print_cstr(unint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = *(void *)(result + 72);
  if (v8 < 0x41) {
    return sprintdgst_npx(a2, (unsigned __int8 *)(result + 8), v8, a4, a5, a6, a7, a8);
  }
  __break(0x5519u);
  return result;
}

void *digest_copy_out(uint64_t a1, void *__dst, size_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v9 = *a3;
  size_t v10 = *(void *)(a1 + 72);
  if (v9 < v10) {
LABEL_6:
  }
    __panic_npx("panic: digest length overflow: actual = %lu, expected >= %lu", (uint64_t)__dst, v10, a4, a5, a6, a7, a8, v9);
  if (v10 > 0x40 || (result = memcpy(__dst, (const void *)(a1 + 8), v10), size_t v9 = *(void *)(a1 + 72), v9 > *a3))
  {
    __break(0x5519u);
    goto LABEL_6;
  }
  *a3 = v9;
  return result;
}

void *digest_copy_out32(uint64_t a1, void *__dst, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9 = *a3;
  size_t v10 = *(void *)(a1 + 72);
  if (v10 > v9) {
LABEL_7:
  }
    __panic_npx("panic: digest length overflow: actual = %u, expected >= %lu", (uint64_t)__dst, v10, a4, a5, a6, a7, a8, v9);
  if (v10 > 0x40) {
    goto LABEL_6;
  }
  uint64_t result = memcpy(__dst, (const void *)(a1 + 8), v10);
  unint64_t v9 = *(void *)(a1 + 72);
  if (HIDWORD(v9)) {
    __panic_npx("panic: integer cast overflow: v = %s, actual = %llu, expected <= %llu", (uint64_t)__dst, v10, a4, a5, a6, a7, a8, (char)"d->d_len");
  }
  if (v9 > *a3)
  {
LABEL_6:
    __break(0x5519u);
    goto LABEL_7;
  }
  *a3 = v9;
  return result;
}

uint64_t __select_ap(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 8);
  v7[0] = "AP-SECURE-BOOT";
  v7[1] = 1;
  _OWORD v7[2] = expert_query_chip(v5, 0);
  v7[3] = _img4_chip_ap_reduced;
  v7[4] = _img4_chip_ap_reduced;
  v7[5] = 0;
  uint64_t result = image4_coprocessor_select_digest(a1, (uint64_t)&__select_ap_digest_map);
  if (!result) {
    return image4_coprocessor_select_secure_boot(a1, (uint64_t)v7, a3);
  }
  return result;
}

uint64_t __select_ap_pdi(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[0] = xmmword_2655E2AF8;
  v6[1] = *(_OWORD *)&off_2655E2B08;
  v6[2] = xmmword_2655E2B18;
  v5[0] = xmmword_2655E2B28;
  v5[1] = *(_OWORD *)algn_2655E2B38;
  v5[2] = xmmword_2655E2B48;
  uint64_t result = image4_coprocessor_select(a1, v6, a3);
  if (!result) {
    return image4_coprocessor_select_digest(a1, (uint64_t)v5);
  }
  return result;
}

uint64_t __select_ap_ddi(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[0] = xmmword_2655E2B58;
  v6[1] = *(_OWORD *)&off_2655E2B68;
  v6[2] = xmmword_2655E2B78;
  v5[0] = xmmword_2655E2B88;
  v5[1] = *(_OWORD *)algn_2655E2B98;
  v5[2] = xmmword_2655E2BA8;
  uint64_t result = image4_coprocessor_select(a1, v6, a3);
  if (!result) {
    return image4_coprocessor_select_digest(a1, (uint64_t)v5);
  }
  return result;
}

uint64_t fourcc_init(uint64_t result, unsigned int a2)
{
  *(_DWORD *)uint64_t result = a2;
  if (result + 4 > (unint64_t)(result + 9))
  {
    __break(0x5519u);
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)(result + 4) = 0;
    *(_DWORD *)(result + 4) = bswap32(a2);
  }
  return result;
}

size_t fourcc_init_cstring(uint64_t a1, char *__s)
{
  size_t result = strlen(__s);
  if (result != 4) {
    __panic_npx_4(result, v5, v6, v7, v8, v9, v10, v11, result);
  }
  if (__s + 5 < __s)
  {
    __break(0x5519u);
  }
  else
  {
    *(_DWORD *)a1 = bswap32(*(_DWORD *)__s);
    strlcpy((char *)(a1 + 4), __s, 5uLL);
    return a1;
  }
  return result;
}

void __panic_npx_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  uint64_t v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: cstring is not a fourcc: length = %lu", &a9);
  _os_crash();
  __break(1u);
}

uint64_t fourcc_get_cstring(uint64_t a1)
{
  return a1 + 4;
}

uint64_t fourcc_copy(uint64_t a1, unsigned int *a2)
{
  return fourcc_init(a1, *a2);
}

BOOL fourcc_equal(_DWORD *a1, _DWORD *a2)
{
  return a2 && *a1 == *a2;
}

uint64_t __handle_absence_1(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 = 0;
  return 0;
}

char *__select_pdi(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t chip = expert_query_chip(*(void *)(a3 + 8), 0);
  if (!*(void *)(chip + 72)) {
    return 0;
  }
  if (*(void *)(chip + 64)) {
    return _chip_vma2_clone_pdi;
  }
  return _chip_vma2_pdi;
}

char *__select_ddi(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t chip = expert_query_chip(*(void *)(a3 + 8), 0);
  if (!*(void *)(chip + 72)) {
    return 0;
  }
  if (*(void *)(chip + 64)) {
    return _chip_vma2_clone_ddi;
  }
  return _chip_vma2_ddi;
}

uint64_t zcmp_npx(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  size_t v2 = (char *)result;
  while (1)
  {
    int v4 = *v2++;
    int v3 = v4;
    unsigned int v5 = v4 < 0 ? -1 : result;
    size_t result = v3 >= 1 ? 1 : v5;
    if ((_BYTE)v3) {
      break;
    }
    if (!--a2) {
      return 0;
    }
  }
  return result;
}

unint64_t strtou32_npx(const char *a1, char **a2, int a3)
{
  __endptr = 0;
  *__error() = 0;
  unint64_t result = strtoul(a1, &__endptr, a3);
  if (__endptr && *__endptr)
  {
    unint64_t result = 0;
    if (a2) {
      *a2 = __endptr;
    }
  }
  else if (HIDWORD(result))
  {
    *__error() = 34;
    return 0xFFFFFFFFLL;
  }
  return result;
}

const char *strsuf_npx(const char *a1, const char *a2)
{
  size_t v4 = strlen(a1);
  unsigned int v5 = &a1[v4 - strlen(a2)];
  if (v5 < a1 || strcmp(v5, a2)) {
    return 0;
  }
  return v5;
}

uint64_t _boot_flash_secondary_enforceable(uint64_t a1, uint64_t a2)
{
  if (odometer_policy_get_chip_property(a1, *(void *)(a2 + 16)))
  {
    uint64_t v10 = *(void *)(a2 + 16);
    if (*(void *)(v10 + 80))
    {
      if (!*(void *)(v10 + 88))
      {
        if (manifest_get_restore_info(*(void *)(a2 + 8), v3, v4, v5, v6, v7, v8, v9))
        {
          int v28 = *(unsigned __int16 *)(a2 + 144);
          uint64_t v29 = *(void *)a2;
          uint64_t name = chip_get_name(*(void *)(a2 + 16));
          if (v28)
          {
            expert_log(v29, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v12, v13, v14, v15, v16, name);
            return 0;
          }
          uint64_t v31 = name;
          uint64_t v17 = "odometer[%s:%s]: manifest has no constraint for policy";
        }
        else
        {
          uint64_t v29 = *(void *)a2;
          uint64_t v31 = chip_get_name(*(void *)(a2 + 16));
          uint64_t v17 = "odometer[%s:%s]: boot object has no restore info";
        }
        uint64_t v20 = 1;
        uint64_t v26 = v29;
        goto LABEL_8;
      }
      uint64_t v11 = *(void *)a2;
      uint64_t v31 = chip_get_name(v10);
      uint64_t v17 = "odometer[%s:%s]: chip is not secondary-stage dfu policy";
    }
    else
    {
      uint64_t v11 = *(void *)a2;
      uint64_t v31 = chip_get_name(v10);
      uint64_t v17 = "odometer[%s:%s]: chip has no associated dfu policy";
    }
    uint64_t v20 = 1;
    uint64_t v26 = v11;
LABEL_8:
    expert_log(v26, 1uLL, (uint64_t)v17, v12, v13, v14, v15, v16, v31);
    return v20;
  }
  uint64_t v18 = *(void *)a2;
  uint64_t v19 = chip_get_name(*(void *)(a2 + 16));
  uint64_t v20 = 1;
  expert_log(v18, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v21, v22, v23, v24, v25, v19);
  return v20;
}

uint64_t _boot_flash_secondary_enforce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v69[3] = *MEMORY[0x263EF8340];
  if (!*(_WORD *)(a2 + 144)) {
    __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v66);
  }
  uint64_t v10 = *(void *)(a2 + 8);
  uint64_t v11 = *(void **)(a2 + 16);
  uint64_t v12 = v11[20];
  uint64_t v13 = *(unsigned int *)(a2 + 24);
  memset(v69, 0, 24);
  memset(v68, 0, sizeof(v68));
  memset(v67, 0, sizeof(v67));
  uint64_t v14 = *(void *)a2;
  uint64_t restore_info = manifest_get_restore_info(v10, a2, a3, a4, a5, a6, a7, a8);
  if (!restore_info) {
    __panic_npx("panic: boot object has no restore info", v16, v17, v18, v19, v20, v21, v22, v66);
  }
  uint64_t restore_info_nonce = odometer_query_restore_info_nonce((uint64_t *)a2, restore_info, v69);
  if (restore_info_nonce)
  {
    uint64_t v24 = restore_info_nonce;
    uint64_t v25 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    expert_log(v25, 0, (uint64_t)"odometer[%s:%s]: failed to query restore info nonce: %d", v27, v28, v29, v30, v31, name);
  }
  else
  {
    uint64_t v39 = expert_entangle_nonce(v14, (uint64_t)v11, v13, (uint64_t)v69, (uint64_t)v68);
    if (v39)
    {
      uint64_t v24 = v39;
      uint64_t v40 = *(void *)a2;
      uint64_t v41 = chip_get_name(*(void *)(a2 + 16));
      expert_log(v40, 0, (uint64_t)"odometer[%s:%s]: failed to entangle nonce: %d", v42, v43, v44, v45, v46, v41);
    }
    else
    {
      odometer_compute_nonce_hash(v14, v11, (uint64_t)v68, (uint64_t)v67);
      if (!property_constrain_digest(v12, v14, a2 + 64, (unint64_t)v67, v47, v48, v49, v50))
      {
        uint64_t v59 = *(void *)a2;
        uint64_t v60 = chip_get_name(*(void *)(a2 + 16));
        expert_log(v59, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is current", v61, v62, v63, v64, v65, v60);
        return 0;
      }
      uint64_t v24 = *(unsigned int *)(a1 + 24);
      uint64_t v51 = *(void *)a2;
      uint64_t v52 = chip_get_name(*(void *)(a2 + 16));
      expert_log(v51, 0, (uint64_t)"odometer[%s:%s]: manifest inconsistent with restore info: %d", v53, v54, v55, v56, v57, v52);
    }
  }
  if (v24 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v32, v33, v34, v35, v36, v37, v38, v24);
  }
  return v24;
}

uint64_t closure_init(uint64_t result, void *a2, uint64_t a3)
{
  *(void *)unint64_t result = a2;
  *(void *)(result + 8) = a3;
  *(void *)(result + 16) = *a2;
  strcpy((char *)(result + 24), "qinuuniq");
  *(void *)(result + 48) = 0;
  *(void *)(result + 56) = 0;
  *(void *)(result + 40) = 0;
  return result;
}

void *_closure_set_unique_tags(void *result, uint64_t a2, uint64_t a3)
{
  result[5] = a2;
  result[6] = a3;
  result[7] = _unique_entry_get_tag;
  return result;
}

uint64_t _unique_entry_get_tag(unsigned int *a1)
{
  return *a1;
}

uint64_t closure_measure(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v27 = 0;
  uint64_t v26 = 0;
  memset(v25, 0, sizeof(v25));
  uint64_t v10 = _closure_compute_internal(a1, v25, &v27, a4, a5, a6, a7, a8);
  if (v10)
  {
    uint64_t v28 = v25;
    buff_destroy(&v28);
    if (v10 >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v11, v12, v13, v14, v15, v16, v17, v10);
    }
  }
  else
  {
    uint64_t v18 = (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 8) + 48))();
    digest_init_measure(a2, v18, v27, v19, v20, v21, v22, v23);
    uint64_t v28 = v25;
    buff_destroy(&v28);
  }
  return v10;
}

uint64_t closure_compute(uint64_t a1, void *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3) {
    a3 = &v9;
  }
  return _closure_compute_internal(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _closure_compute_internal(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v130[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)a1;
  int v10 = *(unsigned __int16 *)(*(void *)a1 + 528);
  uint64_t v129 = 0;
  v130[0] = 0;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = xmmword_270ECD188;
  uint64_t v124 = qword_270ECD198;
  uint64_t v121 = 0;
  v122 = 0;
  uint64_t v119 = 0;
  long long v120 = 0;
  unsigned int v118 = 0;
  uint64_t v117 = 0;
  if (!v10) {
LABEL_82:
  }
    __panic_npx("panic: closure measurement requires a parsed manifest", (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8, v115);
  unint64_t alloc_preference = _type_get_alloc_preference((uint64_t)&_image4_type_decode_context);
  if (alloc_preference <= 1) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = alloc_preference;
  }
  if (v22 == 1) {
    goto LABEL_9;
  }
  if (v22 != 2) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", v15, v16, v17, v18, v19, v20, v21, (char)"_t_preference");
  }
  uint64_t v23 = _expert_alloc_type(v8, (uint64_t)&_image4_type_decode_context);
  if (!v23)
  {
LABEL_9:
    uint64_t size = type_get_size((uint64_t)&_image4_type_decode_context);
    unint64_t v33 = MEMORY[0x270FA5388](size, v26, v27, v28, v29, v30, v31, v32);
    uint64_t v24 = (char *)&v115 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v33 >= 0x31) {
      size_t v34 = v33 - 48;
    }
    else {
      size_t v34 = 0;
    }
    memset(v24 + 48, 170, v34);
    *(_OWORD *)uint64_t v24 = 0u;
    *((_OWORD *)v24 + 1) = 0u;
    *((_OWORD *)v24 + 2) = 0u;
  }
  else
  {
    uint64_t v24 = (char *)v23;
    v130[0] = v23;
  }
  *((_OWORD *)v24 + 1) = 0u;
  *((_OWORD *)v24 + 2) = 0u;
  *(_OWORD *)uint64_t v24 = 0u;
  uint64_t v35 = *(void *)(a1 + 8);
  *(void *)&long long v115 = *(void *)"PNAMMANP";
  DWORD2(v115) = 0;
  long long v125 = (unint64_t)a1;
  *(void *)&long long v126 = chip_select_decode(v35);
  if (!(void)v126)
  {
    uint64_t v50 = 82;
    expert_log(*(void *)(a1 + 16), 0, (uint64_t)"chip environment not booted: %s: %d", v36, v37, v38, v39, v40, *(void *)(*(void *)(a1 + 8) + 8));
LABEL_19:
    expert_log(*(void *)(a1 + 16), 0, (uint64_t)"failed to initialize compute context: %d", v56, v57, v58, v59, v60, v50);
    _expert_dealloc_type(v8, (uint64_t)&_image4_type_decode_context, v130);
    goto LABEL_68;
  }
  uint64_t v41 = (void *)closure_node_new_item(a1, (unsigned int *)&v115);
  if (!v41)
  {
    uint64_t v50 = 12;
    expert_log(*(void *)(a1 + 16), 0, (uint64_t)"failed to add MANP node: %d", v43, v44, v45, v46, v47, 12);
    goto LABEL_19;
  }
  *((void *)v24 + 5) = &v125;
  *(void *)&long long v128 = 0;
  *((void *)&v128 + 1) = &v128;
  *(void *)&long long v127 = 0;
  *((void *)&v127 + 1) = v41;
  *((void *)&v126 + 1) = 0;
  LODWORD(v129) = -1;
  closure_node_add(v41, (uint64_t)&v128, v42, v43, v44, v45, v46, v47);
  Img4DecodePerformManifestTrustEvaluationWithCallbacks(v9 + 72, (uint64_t)&v123, v126, (uint64_t)v24);
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = posixdr(v48);
    expert_log(*(void *)(a1 + 16), 0, (uint64_t)"Img4DecodePerformManifestTrustEvaluation: %d", v51, v52, v53, v54, v55, v49);
    goto LABEL_67;
  }
  uint64_t v61 = Img4DecodeIterateObjectItems((unint64_t *)(v9 + 72), (unsigned int *)&v125 + 2, (uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))&v123, (uint64_t)v24);
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v50 = posixdr(v61);
    expert_log(*(void *)(a1 + 16), 0, (uint64_t)"Img4DecodeIterateObjectItems: %d", v63, v64, v65, v66, v67, v62);
    goto LABEL_67;
  }
  for (uint64_t i = v128; i; uint64_t i = *(void *)i)
  {
    long long v115 = *(_OWORD *)(i + 40);
    uint64_t v116 = *(void *)(i + 56);
    unint64_t v69 = v127;
    if ((void)v127)
    {
      uint64_t v70 = *((void *)&v126 + 1);
      if (!*((void *)&v126 + 1)) {
        goto LABEL_33;
      }
    }
    else
    {
      unint64_t v69 = *(void *)(a1 + 40);
      uint64_t v70 = *(void *)(a1 + 48);
      if (!v70)
      {
LABEL_33:
        expert_log(*(void *)(*(void *)(i + 8) + 16), 2uLL, (uint64_t)"%s: tag not in unique list", a4, a5, a6, a7, a8, i + 28);
LABEL_34:
        long long v73 = 0;
        goto LABEL_35;
      }
    }
    unint64_t v71 = v69 + 4 * v70;
    unint64_t v72 = v69;
    while (1)
    {
      if (v72 && (v72 >= v71 || v72 < v69)) {
        goto LABEL_81;
      }
      if ((*(unsigned int (**)(unint64_t))(a1 + 56))(v72) == *(_DWORD *)(i + 24)) {
        break;
      }
      v72 += 4;
      if (!--v70) {
        goto LABEL_33;
      }
    }
    expert_log(*(void *)(*(void *)(i + 8) + 16), 2uLL, (uint64_t)"%s: found unique tag", a4, a5, a6, a7, a8, i + 28);
    if (!v72) {
      goto LABEL_34;
    }
    if (v72 >= v71 || v72 < v69)
    {
LABEL_81:
      __break(0x5519u);
      goto LABEL_82;
    }
    uint64_t v116 = 5;
    long long v73 = (uint64_t *)&v115;
LABEL_35:
    int v74 = closure_node_encode_property(i, v73);
    if (v74)
    {
      switch(v74)
      {
        case 1:
          uint64_t v50 = 22;
          break;
        case 2:
          uint64_t v50 = 12;
          break;
        case 3:
          uint64_t v50 = 104;
          break;
        default:
          uint64_t v50 = 14;
          break;
      }
      expert_log(*(void *)(*(void *)(i + 8) + 16), 0, (uint64_t)"%s: failed to encode property node: %d", a4, a5, a6, a7, a8, i + 28);
      goto LABEL_67;
    }
  }
  Single = (void **)DEREncoderCreateSingle(0);
  v122 = Single;
  if (Single)
  {
    uint64_t v81 = (uint64_t *)Single;
    uint64_t v82 = &v128;
    while (1)
    {
      uint64_t v82 = *(long long **)v82;
      if (!v82) {
        break;
      }
      int v83 = closure_node_encode_item(v82, v81);
      if (v83)
      {
        switch(v83)
        {
          case 1:
            uint64_t v50 = 22;
            break;
          case 2:
            uint64_t v50 = 12;
            break;
          case 3:
            uint64_t v50 = 104;
            break;
          default:
            uint64_t v50 = 14;
            break;
        }
        expert_log(*(void *)(*((void *)v82 + 1) + 16), 0, (uint64_t)"%s: failed to encode item node: %d", v84, v85, v86, v87, v88, (uint64_t)v82 + 28);
        goto LABEL_67;
      }
    }
    uint64_t Image4Dictionary = DEREncoderCreateImage4Dictionary("MANB", (uint64_t **)v81, (uint64_t **)&v121);
    uint64_t v50 = 22;
    switch((int)Image4Dictionary)
    {
      case 0:
        uint64_t v50 = 22;
        switch(_closure_create_image4_manifest(a1, v121, &v120))
        {
          case 0u:
            uint64_t v95 = DEREncoderCreateEncodedBuffer(v120, &v119, &v118);
            uint64_t v50 = 22;
            switch((int)v95)
            {
              case 0:
                uint64_t v117 = v119;
                uint64_t v50 = 0;
                *a3 = buff_init_xfer(a2, &v117, v118, (uint64_t)&_buff_destructor_free, 0);
                goto LABEL_67;
              case 1:
                goto LABEL_80;
              case 2:
                uint64_t v50 = 12;
                goto LABEL_80;
              case 3:
                uint64_t v50 = 104;
                goto LABEL_80;
              default:
                uint64_t v50 = 14;
LABEL_80:
                expert_log(*(void *)(a1 + 16), 0, (uint64_t)"DEREncoderCreateEncodedBuffer: %d", v96, v97, v98, v99, v100, v95);
                break;
            }
            break;
          case 1u:
            goto LABEL_67;
          case 2u:
            uint64_t v50 = 12;
            break;
          case 3u:
            uint64_t v50 = 104;
            break;
          default:
            uint64_t v50 = 14;
            break;
        }
        break;
      case 1:
        goto LABEL_73;
      case 2:
        uint64_t v50 = 12;
        goto LABEL_73;
      case 3:
        uint64_t v50 = 104;
        goto LABEL_73;
      default:
        uint64_t v50 = 14;
LABEL_73:
        expert_log(*(void *)(a1 + 16), 0, (uint64_t)"DEREncoderCreateImage4Dictionary: %d", v90, v91, v92, v93, v94, Image4Dictionary);
        break;
    }
  }
  else
  {
    uint64_t v50 = 12;
    expert_log(*(void *)(a1 + 16), 0, (uint64_t)"failed to allocate item sequence encoder: %d", v76, v77, v78, v79, v80, 12);
  }
LABEL_67:
  _expert_dealloc_type(v8, (uint64_t)&_image4_type_decode_context, v130);
  closure_node_list_destroy(a1, (uint64_t *)&v128, v101, v102, v103, v104, v105, v106);
LABEL_68:
  DEREncoderDestroyAndZero(&v122);
  DEREncoderDestroyAndZero(&v121);
  DEREncoderDestroyAndZero(&v120);
  if (v50 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v107, v108, v109, v110, v111, v112, v113, v50);
  }
  return v50;
}

uint64_t _closure_manifest_property_callback(unsigned int a1, uint64_t *a2, int a3, uint64_t a4)
{
  int v58 = 0;
  uint64_t v57 = 0;
  int v56 = 0;
  uint64_t v55 = 0;
  uint64_t v7 = *(void *)(a4 + 40);
  unint64_t v8 = *(void *)v7;
  fourcc_init((uint64_t)&v57, a1);
  if (a3 == 1) {
    fourcc_init((uint64_t)&v55, *(_DWORD *)(v7 + 8));
  }
  unint64_t v14 = v8 + 64;
  uint64_t result = expert_log(*(void *)(v8 + 16), 2uLL, (uint64_t)"recording property for closure computation: %s%s%s", v9, v10, v11, v12, v13, (uint64_t)&v55 + 4);
  if (*(_DWORD *)(v8 + 24) == a1)
  {
    if (v8 >= v14) {
      goto LABEL_33;
    }
    unsigned int v62 = 0;
    uint64_t v61 = 0;
    uint64_t PropertyData = Img4DecodeGetPropertyData(a2, a1, &v61, &v62);
    if (PropertyData)
    {
      expert_log(*(void *)(v8 + 16), 0, (uint64_t)"Img4DecodeGetPropertyData: %d", v17, v18, v19, v20, v21, PropertyData);
      int v22 = 96;
LABEL_31:
      *(_DWORD *)(v7 + 64) = v22;
      return 0xFFFFFFFFLL;
    }
    unint64_t v23 = v62;
    if ((v62 & 3) != 0)
    {
      expert_log(*(void *)(v8 + 16), 0, (uint64_t)"invalid unique tag list: actual length = %u, expected %% %lu == 0", v17, v18, v19, v20, v21, v62);
      int v22 = 94;
      goto LABEL_31;
    }
    uint64_t v54 = a2;
    unint64_t v24 = (unint64_t)v62 >> 2;
    uint64_t result = expert_log(*(void *)(v8 + 16), 1uLL, (uint64_t)"found unique tag list: cnt = %u", v17, v18, v19, v20, v21, v24);
    if ((v23 >> 2) > v62 >> 2) {
      goto LABEL_33;
    }
    uint64_t v25 = v61;
    *(void *)(v7 + 24) = v24;
    *(void *)(v7 + 32) = v25;
    *(void *)(v8 + 56) = _unique_entry_get_tag_swapped;
    if (v23 >= 4)
    {
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      if (v24 <= 1) {
        uint64_t v28 = 1;
      }
      else {
        uint64_t v28 = v23 >> 2;
      }
      do
      {
        unint64_t v29 = *(void *)(v7 + 32);
        unint64_t v30 = v29 + 4 * *(void *)(v7 + 24);
        int v60 = 0;
        uint64_t v59 = 0;
        if (v29 > v29 + v26 || v29 + v26 + 4 > v30) {
          goto LABEL_33;
        }
        fourcc_init((uint64_t)&v59, bswap32(*(_DWORD *)(v29 + 4 * v27)));
        uint64_t result = expert_log(*(void *)(v8 + 16), 2uLL, (uint64_t)"unique tag entry[%zu] = %s", v32, v33, v34, v35, v36, v27++);
        v26 += 4;
      }
      while (v28 != v27);
    }
    a2 = v54;
  }
  if (*(_DWORD *)(v7 + 8) != *(_DWORD *)(v7 + 12))
  {
    if (v8 >= v14)
    {
LABEL_33:
      __break(0x5519u);
      return result;
    }
    uint64_t v37 = (void *)closure_node_new_item(v8, (unsigned int *)&v55);
    if (!v37)
    {
      int v22 = 12;
      goto LABEL_31;
    }
    uint64_t v44 = v37;
    uint64_t result = closure_node_add(v37, v7 + 48, v38, v39, v40, v41, v42, v43);
    *(_DWORD *)(v7 + 12) = *(_DWORD *)(v7 + 8);
    *(void *)(v7 + 40) = v44;
  }
  if (v8 >= v14) {
    goto LABEL_33;
  }
  uint64_t v45 = closure_node_new(*(void *)(v7 + 40), v8, (unsigned int *)&v57, (uint64_t)a2);
  if (!v45)
  {
    *(_DWORD *)(v7 + 64) = 12;
    expert_log(*(void *)(v8 + 16), 0, (uint64_t)"failed to allocate closure node", v47, v48, v49, v50, v51, v53);
    return 0xFFFFFFFFLL;
  }
  uint64_t v52 = v45;
  if (!a3) {
    manifest_property_callback(*(uint64_t **)v8, 0, a1, a2, v48, v49, v50, v51, v53);
  }
  closure_node_add(v52, v7 + 48, v46, v47, v48, v49, v50, v51);
  return 0;
}

uint64_t _closure_create_image4_manifest(uint64_t a1, uint64_t **a2, void *a3)
{
  uint64_t v50 = 0;
  Single = (void **)DEREncoderCreateSingle(0);
  uint64_t v51 = Single;
  if (Single)
  {
    uint64_t v12 = (uint64_t *)Single;
    uint64_t v13 = DEREncoderAddImage4Tag((uint64_t *)Single, "IM4M");
    if (v13)
    {
      uint64_t v19 = v13;
      expert_log(*(void *)(a1 + 16), 0, (uint64_t)"DEREncoderAddImage4Tag: IM4M: %d", v14, v15, v16, v17, v18, v13);
LABEL_7:
      uint64_t v21 = v19;
      goto LABEL_8;
    }
    uint64_t v22 = DEREncoderAddUInt(v12, 0);
    if (v22)
    {
      uint64_t v19 = v22;
      expert_log(*(void *)(a1 + 16), 0, (uint64_t)"DEREncoderAddUInt: manifest version: %d", v23, v24, v25, v26, v27, v22);
      goto LABEL_7;
    }
    uint64_t v29 = DEREncoderAddSetFromEncoder(a2, v12);
    if (v29)
    {
      uint64_t v35 = v29;
      expert_log(*(void *)(a1 + 16), 0, (uint64_t)"DEREncoderAddSetFromEncoder: %d", v30, v31, v32, v33, v34, v29);
      uint64_t v21 = v35;
    }
    else
    {
      uint64_t v36 = (void **)DEREncoderCreateSingle(v29);
      uint64_t v50 = v36;
      if (v36)
      {
        uint64_t v42 = v36;
        uint64_t v43 = DEREncoderAddSequenceFromEncoder((uint64_t **)v12, (uint64_t *)v36);
        if (v43)
        {
          uint64_t v49 = v43;
          expert_log(*(void *)(a1 + 16), 0, (uint64_t)"DEREncoderAddSequenceFromEncoder: %d", v44, v45, v46, v47, v48, v43);
          uint64_t v21 = v49;
        }
        else
        {
          uint64_t v21 = 0;
          *a3 = v42;
          uint64_t v50 = 0;
        }
      }
      else
      {
        expert_log(*(void *)(a1 + 16), 0, (uint64_t)"DEREncoderCreate: %d", v37, v38, v39, v40, v41, 0);
        uint64_t v21 = 0;
      }
    }
  }
  else
  {
    uint64_t v20 = *(void *)(a1 + 16);
    uint64_t v21 = 2;
    expert_log(v20, 0, (uint64_t)"DEREncoderCreate: %d", v7, v8, v9, v10, v11, 2);
  }
LABEL_8:
  DEREncoderDestroyAndZero(&v51);
  DEREncoderDestroyAndZero(&v50);
  return v21;
}

uint64_t _unique_entry_get_tag_swapped(unsigned int *a1)
{
  return bswap32(*a1);
}

uint64_t __handle_absence_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 = 0;
  return 0;
}

uint64_t img4_nonce_domain_get_from_handle(unsigned int a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return _cryptex1_domains[a1];
  }
}

uint64_t chip_expert(uint64_t a1)
{
  return *(void *)(a1 + 112);
}

uint64_t chip_expert_instance(uint64_t a1)
{
  return **(void **)(*(void *)(a1 + 112) + 16);
}

uint64_t _chip_expert_boot()
{
  return 78;
}

uint64_t _chip_expert_get_digest_info(uint64_t a1)
{
  return (*(uint64_t (**)(void))(***(void ***)(a1 + 16) + 48))();
}

uint64_t _chip_expert_get_secure_boot(uint64_t a1, void *a2)
{
  *a2 = *(void *)(***(void ***)(a1 + 16) + 24);
  return 0;
}

uint64_t _chip_expert_query_chip(uint64_t a1)
{
  return ***(void ***)(a1 + 16);
}

uint64_t _chip_expert_query_chip_boot()
{
  return 45;
}

uint64_t _chip_expert_query_nonce()
{
  return 78;
}

uint64_t _chip_expert_entangle_nonce()
{
  return 78;
}

uint64_t _chip_expert_read_boot_manifest()
{
  return 78;
}

uint64_t _chip_expert_query_trust_store()
{
  return 78;
}

uint64_t _chip_expert_read_storage()
{
  return 78;
}

uint64_t _chip_expert_write_storage()
{
  return 78;
}

uint64_t _chip_expert_sync_storage()
{
  return 78;
}

uint64_t _chip_expert_query_property_BOOL(uint64_t a1, uint64_t a2, char **a3, BOOL *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3 == &_property_iuob)
  {
    return expert_compute_eieiou_BOOL(a1, a2, a4);
  }
  else
  {
    uint64_t v10 = **(unsigned char ***)(a1 + 16);
    if (chip_instance_check((unint64_t)v10, a3, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8))
    {
      chip_instance_get_BOOL(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
      return 0;
    }
    else
    {
      return 2;
    }
  }
}

uint64_t _chip_expert_query_property_uint32(uint64_t a1, uint64_t a2, void *a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = **(_DWORD ***)(a1 + 16);
  if (!chip_instance_check((unint64_t)v10, a3, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8)) {
    return 2;
  }
  chip_instance_get_uint32(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0;
}

uint64_t _chip_expert_query_property_uint64(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = **(void ***)(a1 + 16);
  if (!chip_instance_check((unint64_t)v10, a3, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8)) {
    return 2;
  }
  chip_instance_get_uint64(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0;
}

uint64_t _chip_expert_query_property_digest(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v10 = **(void **)(a1 + 16);
  if (!chip_instance_check(v10, a3, (uint64_t)a3, a4, a5, a6, a7, a8)) {
    return 2;
  }
  chip_instance_get_digest(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0;
}

uint64_t _chip_expert_query_property_version(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v10 = **(void **)(a1 + 16);
  if (!chip_instance_check(v10, a3, (uint64_t)a3, a4, a5, a6, a7, a8)) {
    return 2;
  }
  chip_instance_get_version(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0;
}

uint64_t _chip_expert_boot_once()
{
  return 0;
}

void _chip_expert_read_random(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx_5(a1, a2, a3, a4, a5, a6, a7, a8, vars0);
}

void __panic_npx_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  unint64_t v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: should never be called", &a9);
  _os_crash();
  __break(1u);
}

void _chip_expert_syscall(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx_5(a1, a2, a3, a4, a5, a6, a7, a8, vars0);
}

char *__select_cryptex1_mobile_asset_ap()
{
  return _chip_cryptex1_mobile_asset_ap;
}

uint64_t *closure_node_list_destroy(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = (uint64_t *)*a2;
  uint64_t v18 = (uint64_t)result;
  if (result)
  {
    do
    {
      uint64_t v10 = *result;
      closure_node_remove(result, a2, a3, a4, a5, a6, a7, a8);
      closure_node_destroy(&v18, v11, v12, v13, v14, v15, v16, v17);
      uint64_t v18 = v10;
      uint64_t result = (uint64_t *)v10;
    }
    while (v10);
  }
  return result;
}

uint64_t closure_node_remove(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = expert_log(*(void *)(a1[1] + 16), 2uLL, (uint64_t)"%s: removing node", a4, a5, a6, a7, a8, (uint64_t)a1 + 28);
  uint64_t v11 = (uint64_t *)*a2;
  if ((uint64_t *)*a2 == a1)
  {
    uint64_t v14 = *a1;
    *a2 = *a1;
    uint64_t v12 = a2;
    if (v14) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  do
  {
    uint64_t v12 = v11;
    uint64_t v11 = (uint64_t *)*v11;
  }
  while (v11 != a1);
  uint64_t v13 = *a1;
  *uint64_t v12 = *a1;
  if (!v13) {
LABEL_4:
  }
    a2[1] = (uint64_t)v12;
LABEL_5:
  *a1 = 0;
  return result;
}

uint64_t *closure_node_destroy(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *result;
  uint64_t v12 = v8;
  if (v8)
  {
    if (*(void *)v8) {
      __panic_npx("panic: closure node deallocated while still in list", a2, a3, a4, a5, a6, a7, a8, v11);
    }
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(*(void *)(v8 + 8) + 16);
    DEREncoderDestroyAndZero((void ***)(v8 + 64));
    uint64_t result = (uint64_t *)_expert_dealloc_type(v10, (uint64_t)&_image4_type_closure_node, &v12);
    *uint64_t v9 = 0;
  }
  return result;
}

void *closure_node_new(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  uint64_t v8 = (void *)_expert_alloc_type(*(void *)(a2 + 16), (uint64_t)&_image4_type_closure_node);
  uint64_t v14 = v8;
  if (v8)
  {
    *uint64_t v8 = 0;
    v8[1] = a2;
    v8[2] = a1;
    fourcc_copy((uint64_t)(v8 + 3), a3);
    uint64_t v15 = *(void *)(a4 + 16);
    *(_OWORD *)(v14 + 5) = *(_OWORD *)a4;
    v14[7] = v15;
    v14[8] = 0;
  }
  else
  {
    expert_log(*(void *)(a2 + 16), 0, (uint64_t)"failed to allocate node", v9, v10, v11, v12, v13, v17);
  }
  return v14;
}

uint64_t closure_node_new_item(uint64_t a1, unsigned int *a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v16 = 0;
  uint64_t v5 = _expert_alloc_type(v4, (uint64_t)&_image4_type_closure_node);
  uint64_t v17 = v5;
  if (!v5)
  {
    uint64_t v14 = "failed to allocate item node";
LABEL_6:
    expert_log(*(void *)(a1 + 16), 0, (uint64_t)v14, v6, v7, v8, v9, v10, (uint64_t)v16);
    _expert_dealloc_type(v4, (uint64_t)&_image4_type_closure_node, &v17);
    DEREncoderDestroyAndZero(&v16);
    return v17;
  }
  uint64_t v11 = (void *)v5;
  Single = (void **)DEREncoderCreateSingle(1);
  uint64_t v16 = Single;
  if (!Single)
  {
    uint64_t v14 = "failed to allocate DER encoder";
    goto LABEL_6;
  }
  uint64_t v13 = Single;
  v11[1] = a1;
  v11[2] = 0;
  fourcc_copy((uint64_t)(v11 + 3), a2);
  v11[5] = 0;
  v11[6] = 0;
  v11[7] = 0;
  v11[8] = v13;
  return (uint64_t)v11;
}

uint64_t closure_node_add(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a1[2])
  {
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v17[14] = v10;
    v17[15] = v10;
    v17[12] = v10;
    v17[13] = v10;
    v17[10] = v10;
    v17[11] = v10;
    v17[8] = v10;
    v17[9] = v10;
    v17[6] = v10;
    v17[7] = v10;
    v17[4] = v10;
    v17[5] = v10;
    _DWORD v17[2] = v10;
    _OWORD v17[3] = v10;
    v17[0] = v10;
    v17[1] = v10;
    _closure_node_get_value_string((uint64_t)a1, 0, (char *)v17, a4, a5, a6, a7, a8);
    uint64_t result = expert_log(*(void *)(a1[1] + 16), 2uLL, (uint64_t)"%s: inserting node: %s", v11, v12, v13, v14, v15, (uint64_t)a1 + 28);
  }
  else
  {
    uint64_t result = expert_log(*(void *)(a1[1] + 16), 2uLL, (uint64_t)"%s: inserting item node", a4, a5, a6, a7, a8, (uint64_t)a1 + 28);
  }
  *a1 = 0;
  **(void **)(a2 + 8) = a1;
  *(void *)(a2 + 8) = a1;
  return result;
}

char *_closure_node_get_value_string(uint64_t a1, uint64_t *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v30[13] = *MEMORY[0x263EF8340];
  uint64_t v9 = *(unsigned int *)(a1 + 24);
  *(_OWORD *)uint64_t v30 = xmmword_263C0D9B8;
  memset(&v30[2], 170, 88);
  unsigned int __n = 0;
  *(void *)uint64_t v27 = 0;
  memset(&__n_4[1], 0, 64);
  if (a2) {
    long long v10 = a2;
  }
  else {
    long long v10 = (uint64_t *)(a1 + 40);
  }
  uint64_t v11 = v10[2];
  __n_4[0] = 0uLL;
  switch(v11)
  {
    case 1:
      if (Img4DecodeGetPropertyBoolean((uint64_t)v10, v9, (BOOL *)v30)) {
        snprintf(a3, 0x100uLL, "[error decoding BOOL %d]");
      }
      else {
        snprintf(a3, 0x100uLL, "%d");
      }
      break;
    case 2:
      if (Img4DecodeGetPropertyInteger64((uint64_t)v10, v9, v30)) {
        snprintf(a3, 0x100uLL, "[error decoding uint %d]");
      }
      else {
        snprintf(a3, 0x100uLL, "0x%llx");
      }
      break;
    case 4:
      if (Img4DecodeGetPropertyData(v10, v9, v27, &__n))
      {
        snprintf(a3, 0x100uLL, "[error decoding data %d]");
      }
      else if (__n < 0x41)
      {
        digest_init((uint64_t)__n_4, *(const void **)v27, __n, v13, v14, v15, v16, v17);
        digest_print_cstr((unint64_t)__n_4, (unint64_t)a3, v21, v22, v23, v24, v25, v26);
      }
      else
      {
        snprintf(a3, 0x100uLL, "<data: %u bytes>");
      }
      break;
    case 5:
      strcpy(a3, "<null>");
      break;
    default:
      __panic_npx("panic: unreachable case: %s = 0x%llx", v9, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"i4p->type");
  }
  uint64_t v18 = 0;
  do
  {
    if (v18 == 256) {
      __break(0x5519u);
    }
  }
  while (a3[v18++]);
  return a3;
}

uint64_t closure_node_encode_property(uint64_t a1, uint64_t *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t cstring = fourcc_get_cstring(a1 + 24);
  if (!*(void *)(a1 + 16)) {
    return 0;
  }
  long long v10 = (char *)cstring;
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19[14] = v11;
  v19[15] = v11;
  v19[12] = v11;
  v19[13] = v11;
  v19[10] = v11;
  v19[11] = v11;
  v19[8] = v11;
  v19[9] = v11;
  v19[6] = v11;
  v19[7] = v11;
  v19[4] = v11;
  _OWORD v19[5] = v11;
  v19[2] = v11;
  void v19[3] = v11;
  if (!a2) {
    a2 = (uint64_t *)(a1 + 40);
  }
  v19[0] = v11;
  v19[1] = v11;
  _closure_node_get_value_string(a1, a2, (char *)v19, v5, v6, v7, v8, v9);
  uint64_t v12 = *(uint64_t **)(*(void *)(a1 + 16) + 64);
  expert_log(*(void *)(*(void *)(a1 + 8) + 16), 2uLL, (uint64_t)"%s: encoding closure property: p = %s, item = %s, type = %llx, val = %s", v13, v14, v15, v16, v17, a1 + 28);
  return DEREncoderAddImage4Property(v12, v10, a2);
}

size_t closure_node_encode_item(void *a1, uint64_t *a2)
{
  uint64_t cstring = fourcc_get_cstring((uint64_t)(a1 + 3));
  if (a1[2]) {
    return 0;
  }
  long long v11 = (char *)cstring;
  expert_log(*(void *)(a1[1] + 16), 2uLL, (uint64_t)"%s: encoding closure item: %s", v5, v6, v7, v8, v9, (uint64_t)a1 + 28);
  uint64_t v12 = (uint64_t **)a1[8];

  return DEREncoderEncodeImage4Dictionary(a2, v11, v12);
}

uint64_t odometer_policy_get_chip_property(uint64_t result, unint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  if (v2 < 0) {
    return 0;
  }
  unint64_t v3 = a2 + v2;
  if (v3 < a2 + 264 && v3 >= a2) {
    return *(void *)v3;
  }
  __break(0x5519u);
  return result;
}

uint64_t odometer_policy_enforceable(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t odometer_policy_enforce(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    if (v10 == 2)
    {
      if (*(unsigned char *)(a2 + 440) && *(unsigned char *)(a2 + 968))
      {
        uint64_t v11 = *(void *)a2;
        uint64_t name = chip_get_name(*(void *)(a2 + 16));
        uint64_t v17 = "odometer[%s:%s]: manifest has mix-n-match entitlement and environment allows mix-n-match; relaxing chain integrity policy";
        goto LABEL_11;
      }
      if (expert_query_chip_boot(*(void *)a2, *(void *)(a2 + 16)))
      {
        uint64_t v11 = *(void *)a2;
        uint64_t name = chip_get_name(*(void *)(a2 + 16));
        uint64_t v17 = "odometer[%s:%s]: expert does not boot chip; relaxing chain integrity policy";
        goto LABEL_11;
      }
    }
    else
    {
      if (v10 != 1) {
        __panic_npx_3(a1, a2, a3, a4, a5, a6, a7, a8, (char)"odp->odp_type");
      }
      if (odometer_check_fuse(a2, (uint64_t)&_odometer_cylinder_mixn_match, a3, a4, a5, a6, a7, a8))
      {
        uint64_t v11 = *(void *)a2;
        uint64_t name = chip_get_name(*(void *)(a2 + 16));
        uint64_t v17 = "odometer[%s:%s]: environment allows mix-n-match; relaxing chain integrity policy";
LABEL_11:
        uint64_t v18 = v11;
LABEL_20:
        expert_log(v18, 1uLL, (uint64_t)v17, v12, v13, v14, v15, v16, name);
        return 0;
      }
    }
  }
  if (*(unsigned char *)(a2 + 441))
  {
    if (odometer_check_fuse(a2, (uint64_t)&_odometer_cylinder_mixn_match, a3, a4, a5, a6, a7, a8))
    {
      uint64_t v19 = "odometer[%s:%s]: environment allows mix-n-match; relaxing all odometer policy";
LABEL_19:
      uint64_t v21 = *(void *)a2;
      uint64_t name = chip_get_name(*(void *)(a2 + 16));
      uint64_t v18 = v21;
      uint64_t v17 = v19;
      goto LABEL_20;
    }
    if (*(unsigned char *)(a2 + 442) && *(unsigned char *)(a2 + 440))
    {
      uint64_t v19 = "odometer[%s:%s]: manifest self-entitled for mix-n-match; relaxing all odometer policy";
      goto LABEL_19;
    }
    uint64_t v20 = "odometer[%s:%s]: enforcing strict mix-n-match behavior";
  }
  else
  {
    uint64_t v20 = "odometer[%s:%s]: mix-n-match god mode not set; enforcing strict mix-n-match behavior";
  }
  uint64_t v23 = *(void *)a2;
  uint64_t v24 = chip_get_name(*(void *)(a2 + 16));
  expert_log(v23, 1uLL, (uint64_t)v20, v25, v26, v27, v28, v29, v24);
  uint64_t v30 = *(uint64_t (**)(uint64_t, unint64_t))(a1 + 40);

  return v30(a1, a2);
}

void _buff_destructor_panic_call(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx("panic: attempt to destroy already destroyed buffer", a2, a3, a4, a5, a6, a7, a8, vars0);
}

void _buff_destructor_static_call(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx("panic: attempt to deallocate static buffer", a2, a3, a4, a5, a6, a7, a8, vars0);
}

uint64_t _buff_destructor_free_prepare(void *a1, rsize_t __n)
{
  uint64_t result = memset_s(a1, __n, 0, __n);
  if (result) {
    __panic_npx("panic: memset_s: %d", v3, v4, v5, v6, v7, v8, v9, result);
  }
  return result;
}

void *buff_init_xfer(void *result, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *a2;
  *a2 = 0;
  *uint64_t result = v5;
  result[1] = a3;
  result[2] = a4;
  result[4] = a5;
  *a2 = *(void *)(a4 + 8);
  return result;
}

void *buff_init_wrap(void *result, uint64_t a2, uint64_t a3)
{
  *uint64_t result = a2;
  result[1] = a3;
  result[2] = &_buff_destructor_wrap;
  result[4] = 0;
  return result;
}

void *buff_init_alias(void *result, void *a2)
{
  *uint64_t result = *a2;
  result[1] = a2[1];
  result[2] = &_buff_destructor_null;
  result[4] = 0;
  return result;
}

void *buff_init_xfer_signed(void *result, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3 < 0) {
    __panic_npx("panic: integer cast underflow: v = %s, actual = %lld, expected >= 0", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (char)"len");
  }
  uint64_t v8 = *a2;
  *a2 = 0;
  *uint64_t result = v8;
  result[1] = a3;
  result[2] = a4;
  result[4] = a5;
  *a2 = *(void *)(a4 + 8);
  return result;
}

uint64_t *buff_init_wrap_signed(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3 < 0) {
    __panic_npx("panic: integer cast underflow: v = %s, actual = %lld, expected >= 0", a2, a3, a4, a5, a6, a7, a8, (char)"len");
  }
  *uint64_t result = a2;
  result[1] = a3;
  result[2] = (uint64_t)&_buff_destructor_wrap;
  result[4] = 0;
  return result;
}

void *buff_xfer(void *result, uint64_t **a2)
{
  uint64_t v2 = *a2;
  if (*a2) {
    BOOL v3 = v2 >= *a2 + 1;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    __break(0x5519u);
  }
  else
  {
    uint64_t v5 = v2[1];
    uint64_t v4 = v2[2];
    uint64_t v6 = v2[4];
    uint64_t v7 = *v2;
    *uint64_t v2 = 0;
    *uint64_t result = v7;
    result[1] = v5;
    result[2] = v4;
    result[4] = v6;
    *uint64_t v2 = *(void *)(v4 + 8);
    v2[2] = 0;
    *a2 = 0;
  }
  return result;
}

void *buff_borrow(void *result, void *a2)
{
  *uint64_t result = *a2;
  result[2] = &_buff_destructor_loanee;
  uint64_t v2 = a2[2];
  result[1] = a2[1];
  a2[2] = &_buff_destructor_loan;
  a2[3] = v2;
  return result;
}

uint64_t buff_return(uint64_t result, void **a2)
{
  uint64_t v2 = *a2;
  *(void *)(result + 16) = *(void *)(result + 24);
  *(void *)(result + 24) = 0;
  *uint64_t v2 = 0;
  v2[1] = 0;
  v2[2] = &_buff_destructor_null;
  *a2 = 0;
  return result;
}

unint64_t buff_lockdown(unint64_t **a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  unint64_t result = **a1;
  if (result > result + v4[1]
    || (unint64_t result = (*(uint64_t (**)(void))(v4[2] + 16))(), v4[2] = (unint64_t)&_buff_destructor_static, v4 >= v4 + 5))
  {
    __break(0x5519u);
  }
  else
  {
    long long v6 = *(_OWORD *)v4;
    long long v7 = *((_OWORD *)v4 + 1);
    *(void *)(a2 + 32) = v4[4];
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v7;
    *a1 = 0;
    return (unint64_t)v4;
  }
  return result;
}

void *buff_copy_out(void *result, void *__dst, size_t *a3)
{
  size_t v4 = *a3;
  size_t v5 = result[1];
  if (v4 < v5) {
    return 0;
  }
  long long v6 = __dst;
  long long v7 = result;
  if (*result <= *result + v5)
  {
    unint64_t result = memcpy(__dst, (const void *)*result, v5);
    size_t v8 = v7[1];
    if (v8 <= *a3)
    {
      *a3 = v8;
      if (v8) {
        return v6;
      }
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t buff_get_length_signed(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = *(void *)(a1 + 8);
  if (result < 0) {
    __panic_npx("panic: length not expressible as ssize_t: %lu", a2, a3, a4, a5, a6, a7, a8, result);
  }
  return result;
}

unint64_t buff_get_length_uint32(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t result = *(void *)(a1 + 8);
  if (HIDWORD(result)) {
    __panic_npx("panic: length not expressible as unsigned 32-bit integer: %lu", a2, a3, a4, a5, a6, a7, a8, result);
  }
  return result;
}

void *buff_destroy(void *result)
{
  unint64_t v1 = (void *)*result;
  if (*result)
  {
    if (v1 < v1 + 5)
    {
      uint64_t v2 = result;
      uint64_t v3 = v1[2];
      if (!v3)
      {
LABEL_6:
        *uint64_t v2 = 0;
        return result;
      }
      uint64_t v5 = *v1;
      uint64_t v4 = v1[1];
      if (*v1 <= (unint64_t)(*v1 + v4))
      {
        uint64_t v6 = v1[4];
        (*(void (**)(void, void, uint64_t))(v3 + 24))(*v1, v1[1], v6);
        unint64_t result = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1[2] + 32))(v5, v4, v6);
        v1[2] = &_buff_destructor_panic;
        goto LABEL_6;
      }
    }
    __break(0x5519u);
  }
  return result;
}

void _buff_destructor_loanee_call(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx("panic: attempt to deallocate loaned buffer", a2, a3, a4, a5, a6, a7, a8, vars0);
}

void _buff_destructor_loan_call(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx("panic: attempt to deallocate loaned buffer without returning", a2, a3, a4, a5, a6, a7, a8, vars0);
}

void _restore_runtime_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void *_restore_runtime_alloc(uint64_t a1, int64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      unint64_t result = malloc_type_calloc(1uLL, a2, 0x1B044E25uLL);
      if (result) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    unint64_t result = malloc_type_calloc(1uLL, a2, 0x61D5536CuLL);
    if (a2 <= 0 && result) {
LABEL_8:
    }
      __break(0x5519u);
    if (!result) {
      _darwin_runtime_alloc_cold_1(&v4, v5);
    }
  }
  if (a2 < 1) {
    goto LABEL_8;
  }
  return result;
}

void _restore_runtime_dealloc(int a1, void *a2)
{
}

void _restore_runtime_log(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _restore_runtime_log_handle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _restore_runtime_get_identifier_BOOL(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _restore_runtime_get_identifier_uint32(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _restore_runtime_get_identifier_uint64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _restore_runtime_get_identifier_digest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _restore_runtime_get_identifier_cstr(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t _restore_runtime_execute_object(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return off_270ECB128(a1, a2, a3, a4);
}

uint64_t _restore_runtime_copy_object(uint64_t a1, uint64_t *a2, uint64_t a3, void *a4)
{
  return off_270ECB130(a1, a2, a3, a4);
}

void _restore_runtime_alloc_type(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _restore_runtime_dealloc_type(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _restore_runtime_set_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _restore_runtime_roll_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _restore_runtime_copy_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __panic_npx_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  uint64_t v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: function should never be called: %s", &a9);
  _os_crash();
  __break(1u);
}

uint64_t __handle_absence_3(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 = 0;
  return 0;
}

uint64_t __fallback_to_sdk(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 242;
  return 0;
}

uint64_t _BootPolicyClosureComputeDigest_1(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = **(unint64_t ***)(*(void *)(a5 + 32) + 16);
  if (*v9 > a4) {
    __panic_npx_0((uint64_t)v9, a2, a1, a4, a5, a6, a7, a8, a4);
  }
  ccdigest();
  return 0;
}

uint64_t _BootPolicyClosureVerifyChain_1()
{
  return 0;
}

uint64_t _BootPolicyClosureVerifySignature_1()
{
  return 0;
}

uint64_t _BootPolicyClosureEvaluateCertificateProperties_1()
{
  return 0;
}

uint64_t img4_nonce_domain_copy_nonce(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v4 = generic_expert_specialist();
  long long v24 = 0u;
  memset(v27, 0, sizeof(v27));
  long long v26 = 0u;
  long long v25 = 0u;
  char v23 = 1;
  DWORD1(v24) = *(_DWORD *)(a1 + 8);
  memset(&v22[1], 0, 76);
  v22[0] = 1;
  *(_DWORD *)&v22[5] = DWORD1(v24);
  size_t v21 = 77;
  uint64_t result = dylib_expert_call_method(v4, 7uLL, &v23, 0x4DuLL, v22, &v21);
  if (result)
  {
    if (result == 45) {
      uint64_t v11 = 19;
    }
    else {
      uint64_t v11 = result;
    }
    uint64_t v12 = expert_log(v4, 0, (uint64_t)"img4_nonce_domain_copy_nonce: %d", v6, v7, v8, v9, v10, v11);
    if (v11 >= 0x6A) {
      __panic_npx_2(v12, v13, v14, v15, v16, v17, v18, v19, v11);
    }
    return v11;
  }
  *(_WORD *)a2 = 0;
  int v20 = *(_DWORD *)&v22[73];
  if (*(_DWORD *)&v22[73] <= 0x30u)
  {
    memcpy((void *)(a2 + 2), &v22[9], *(unsigned int *)&v22[73]);
    uint64_t v11 = 0;
    *(_DWORD *)(a2 + 52) = v20;
    return v11;
  }
  __break(0x5519u);
  return result;
}

uint64_t img4_nonce_domain_roll_nonce(uint64_t a1)
{
  uint64_t v2 = generic_expert_specialist();
  char v24 = 1;
  int v3 = *(_DWORD *)(a1 + 8);
  int v25 = 0;
  int v26 = v3;
  char v21 = 1;
  int v22 = 0;
  int v23 = v3;
  size_t v20 = 9;
  unsigned int v4 = dylib_expert_call_method(v2, 9uLL, &v24, 9uLL, &v21, &v20);
  if (!v4) {
    return 0;
  }
  if (v4 == 45) {
    uint64_t v10 = 19;
  }
  else {
    uint64_t v10 = v4;
  }
  uint64_t v11 = expert_log(v2, 0, (uint64_t)"img4_nonce_domain_roll_nonce: %d", v5, v6, v7, v8, v9, v10);
  if (v10 >= 0x6A) {
    __panic_npx_2(v11, v12, v13, v14, v15, v16, v17, v18, v10);
  }
  return v10;
}

uint64_t img4_nonce_domain_preroll_nonce(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v4 = generic_expert_specialist();
  long long v28 = 0u;
  uint64_t v34 = 0;
  long long v33 = 0u;
  long long v32 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  long long v29 = 0u;
  char v27 = 1;
  HIDWORD(v28) = *(_DWORD *)(a1 + 8);
  long long v23 = 0u;
  uint64_t v26 = 0;
  long long v25 = 0u;
  memset(v24, 0, sizeof(v24));
  char v22 = 1;
  HIDWORD(v23) = HIDWORD(v28);
  size_t v21 = 105;
  uint64_t result = dylib_expert_call_method(v4, 0xBuLL, &v27, 0x69uLL, &v22, &v21);
  if (result)
  {
    if (result == 45) {
      uint64_t v11 = 19;
    }
    else {
      uint64_t v11 = result;
    }
    uint64_t v12 = expert_log(v4, 0, (uint64_t)"img4_nonce_domain_preroll_nonce: %d", v6, v7, v8, v9, v10, v11);
    if (v11 >= 0x6A) {
      __panic_npx_2(v12, v13, v14, v15, v16, v17, v18, v19, v11);
    }
    return v11;
  }
  *(_WORD *)a2 = 0;
  int v20 = v25;
  if (v25 <= 0x30)
  {
    memcpy((void *)(a2 + 2), v24, v25);
    uint64_t v11 = 0;
    *(_DWORD *)(a2 + 52) = v20;
    return v11;
  }
  __break(0x5519u);
  return result;
}

uint64_t img4_nonce_domain_peek_nonce(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v4 = generic_expert_specialist();
  long long v24 = 0u;
  memset(v27, 0, sizeof(v27));
  long long v26 = 0u;
  long long v25 = 0u;
  char v23 = 1;
  DWORD1(v24) = *(_DWORD *)(a1 + 8);
  memset(&v22[1], 0, 76);
  v22[0] = 1;
  *(_DWORD *)&v22[5] = DWORD1(v24);
  size_t v21 = 77;
  uint64_t result = dylib_expert_call_method(v4, 8uLL, &v23, 0x4DuLL, v22, &v21);
  if (result)
  {
    if (result == 45) {
      uint64_t v11 = 19;
    }
    else {
      uint64_t v11 = result;
    }
    uint64_t v12 = expert_log(v4, 0, (uint64_t)"img4_nonce_domain_peek_nonce: %d", v6, v7, v8, v9, v10, v11);
    if (v11 >= 0x6A) {
      __panic_npx_2(v12, v13, v14, v15, v16, v17, v18, v19, v11);
    }
    return v11;
  }
  *(_WORD *)a2 = 0;
  int v20 = *(_DWORD *)&v22[73];
  if (*(_DWORD *)&v22[73] <= 0x30u)
  {
    memcpy((void *)(a2 + 2), &v22[9], *(unsigned int *)&v22[73]);
    uint64_t v11 = 0;
    *(_DWORD *)(a2 + 52) = v20;
    return v11;
  }
  __break(0x5519u);
  return result;
}

char *image4_environment_get_firmware_chip(unsigned int a1, uint64_t a2)
{
  if (a1 > 0x7CF) {
    return 0;
  }
  uint64_t result = (char *)image4_environment_resolve(a2);
  if (result == _img4_chip_x86_software_8012 || result == 0) {
    return 0;
  }
  return result;
}

char **property_find_from_expert(char **result)
{
  unint64_t v1 = &__expert_properties[(void)result];
  if (v1 < (char ***)&__chpld_ap_pdi_sha2_384 && v1 >= __expert_properties) {
    return *v1;
  }
  __break(0x5519u);
  return result;
}

uint64_t property_find_entitlement(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  long long v12 = xmmword_270ECE3D0;
  uint64_t v13 = qword_270ECE3E0;
  do
  {
    uint64_t v9 = property_iterator_next((uint64_t)&v12, a2, a3, a4, a5, a6, a7, a8);
    unint64_t v10 = (unint64_t)v9;
    if (!v9) {
      return v10;
    }
    uint64_t result = _property_filter_expert((uint64_t)v9);
  }
  while (result || *(_DWORD *)(v10 + 24) != *a1);
  if (v10 < v10 + 104) {
    return v10;
  }
  __break(0x5519u);
  return result;
}

uint64_t property_find_from_fourcc(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  long long v13 = xmmword_263C0DA20;
  uint64_t v14 = -1;
  if (a2 == 1)
  {
    uint64_t v9 = _property_filter_object;
  }
  else
  {
    if (a2) {
      goto LABEL_6;
    }
    uint64_t v9 = _property_filter_manifest;
  }
  *(void *)&long long v13 = v9;
  while (1)
  {
LABEL_6:
    unint64_t v10 = property_iterator_next((uint64_t)&v13, a2, a3, a4, a5, a6, a7, a8);
    unint64_t v11 = (unint64_t)v10;
    if (!v10) {
      return v11;
    }
    uint64_t result = _property_filter_constraint((uint64_t)v10);
    if (result)
    {
      uint64_t result = _property_filter_anti_replay(v11);
      if (result) {
        continue;
      }
    }
    if (*(_DWORD *)(v11 + 24) == *a1) {
      break;
    }
  }
  if (v11 < v11 + 104) {
    return v11;
  }
  __break(0x5519u);
  return result;
}

BOOL property_equal(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a1 == a2 || *(void *)(a1 + 8) == a2 || *(void *)(a2 + 8) == a1) {
    return 1;
  }
  return *(_DWORD *)(a2 + 24) == *(_DWORD *)(a1 + 24);
}

BOOL property_equal_fourcc(BOOL result, int a2)
{
  if (result) {
    return *(_DWORD *)(result + 24) == a2;
  }
  return result;
}

BOOL property_imposable(uint64_t a1, uint64_t a2)
{
  digest = chip_get_digest(a2);
  if (digest
    && (digest == (char **)a1
     || *(char ***)(a1 + 8) == digest
     || digest[1] == (char *)a1
     || *((_DWORD *)digest + 6) == *(_DWORD *)(a1 + 24)))
  {
    return 1;
  }
  if (*(void *)(a1 + 16) == 33 || *(_UNKNOWN **)(a1 + 48) == &_property_constraint_rp) {
    return 0;
  }
  return chip_check_entitlement(a2, a1) != 0;
}

uint64_t property_constrain_BOOL(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = *a3;
  unsigned int v9 = *a4;
  switch(**(void **)(a1 + 48))
  {
    case 0:
      uint64_t v10 = v8 != v9;
      if (v8 == v9) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 1:
      if (v8 < v9) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = 0xFFFFFFFFLL;
      }
      if (!v10) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 2:
      if (v8 <= v9) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = 0xFFFFFFFFLL;
      }
      if (!v10) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 3:
      uint64_t v10 = v8 <= v9;
      if (v8 <= v9) {
        goto LABEL_15;
      }
      goto LABEL_22;
    case 4:
      uint64_t v10 = v8 < v9;
      if (v8 >= v9) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 5:
      uint64_t v10 = v8 == v9;
      if (v8 != v9) {
        goto LABEL_22;
      }
LABEL_15:
      int v11 = *(_DWORD *)(a1 + 56);
      switch(v11)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_26;
        case 2:
        case 3:
          if (v11 != 2 && v11 != 3) {
            goto LABEL_29;
          }
LABEL_26:
          expert_log(a2, 0, (uint64_t)"%s: enforcing[%s %s %s]: 0x%x %s 0x%x: %d", (uint64_t)a4, a5, a6, a7, a8, a1 + 28);
          return v10;
        default:
LABEL_29:
          uint64_t v14 = "p->p_container";
          goto LABEL_30;
      }
    case 6:
LABEL_22:
      int v12 = *(_DWORD *)(a1 + 56);
      switch(v12)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_27;
        case 2:
        case 3:
          if (v12 != 2 && v12 != 3) {
            goto LABEL_29;
          }
LABEL_27:
          expert_log(a2, 1uLL, (uint64_t)"%s: enforcing[%s %s %s]: 0x%x %s 0x%x: success", (uint64_t)a4, a5, a6, a7, a8, a1 + 28);
          uint64_t v10 = 0;
          break;
        default:
          goto LABEL_29;
      }
      return v10;
    case 8:
      __panic_npx("panic: property is not constrainable: %s", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, *(void *)a1);
    default:
      uint64_t v14 = "p->p_constraint->pc_code";
LABEL_30:
      __panic_npx("panic: unreachable case: %s = 0x%llx", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)v14);
  }
}

uint64_t property_constrain_uint32(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = *a3;
  unsigned int v9 = *a4;
  switch(**(void **)(a1 + 48))
  {
    case 0:
      uint64_t v10 = v8 != v9;
      if (v8 == v9) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 1:
      if (v8 < v9) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = 0xFFFFFFFFLL;
      }
      if (!v10) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 2:
      if (v8 <= v9) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = 0xFFFFFFFFLL;
      }
      if (!v10) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 3:
      uint64_t v10 = v8 <= v9;
      if (v8 <= v9) {
        goto LABEL_15;
      }
      goto LABEL_22;
    case 4:
      uint64_t v10 = v8 < v9;
      if (v8 >= v9) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 5:
      uint64_t v10 = v8 == v9;
      if (v8 != v9) {
        goto LABEL_22;
      }
LABEL_15:
      int v11 = *(_DWORD *)(a1 + 56);
      switch(v11)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_26;
        case 2:
        case 3:
          if (v11 != 2 && v11 != 3) {
            goto LABEL_29;
          }
LABEL_26:
          expert_log(a2, 0, (uint64_t)"%s: enforcing[%s %s %s]: 0x%x %s 0x%x: %d", (uint64_t)a4, a5, a6, a7, a8, a1 + 28);
          return v10;
        default:
LABEL_29:
          uint64_t v14 = "p->p_container";
          goto LABEL_30;
      }
    case 6:
LABEL_22:
      int v12 = *(_DWORD *)(a1 + 56);
      switch(v12)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_27;
        case 2:
        case 3:
          if (v12 != 2 && v12 != 3) {
            goto LABEL_29;
          }
LABEL_27:
          expert_log(a2, 1uLL, (uint64_t)"%s: enforcing[%s %s %s]: 0x%x %s 0x%x: success", (uint64_t)a4, a5, a6, a7, a8, a1 + 28);
          uint64_t v10 = 0;
          break;
        default:
          goto LABEL_29;
      }
      return v10;
    case 8:
      __panic_npx("panic: property is not constrainable: %s", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, *(void *)a1);
    default:
      uint64_t v14 = "p->p_constraint->pc_code";
LABEL_30:
      __panic_npx("panic: unreachable case: %s = 0x%llx", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)v14);
  }
}

uint64_t property_constrain_uint64(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = *a3;
  unint64_t v9 = *a4;
  switch(**(void **)(a1 + 48))
  {
    case 0:
      uint64_t v10 = v8 != v9;
      if (v8 == v9) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 1:
      if (v8 < v9) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = 0xFFFFFFFFLL;
      }
      if (!v10) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 2:
      if (v8 <= v9) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = 0xFFFFFFFFLL;
      }
      if (!v10) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 3:
      uint64_t v10 = v8 <= v9;
      if (v8 <= v9) {
        goto LABEL_15;
      }
      goto LABEL_22;
    case 4:
      uint64_t v10 = v8 < v9;
      if (v8 >= v9) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 5:
      uint64_t v10 = v8 == v9;
      if (v8 != v9) {
        goto LABEL_22;
      }
LABEL_15:
      int v11 = *(_DWORD *)(a1 + 56);
      switch(v11)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_26;
        case 2:
        case 3:
          if (v11 != 2 && v11 != 3) {
            goto LABEL_29;
          }
LABEL_26:
          expert_log(a2, 0, (uint64_t)"%s: enforcing[%s %s %s]: 0x%llx %s 0x%llx: %d", (uint64_t)a4, a5, a6, a7, a8, a1 + 28);
          return v10;
        default:
LABEL_29:
          uint64_t v14 = "p->p_container";
          goto LABEL_30;
      }
    case 6:
LABEL_22:
      int v12 = *(_DWORD *)(a1 + 56);
      switch(v12)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_27;
        case 2:
        case 3:
          if (v12 != 2 && v12 != 3) {
            goto LABEL_29;
          }
LABEL_27:
          expert_log(a2, 1uLL, (uint64_t)"%s: enforcing[%s %s %s]: 0x%llx %s 0x%llx: success", (uint64_t)a4, a5, a6, a7, a8, a1 + 28);
          uint64_t v10 = 0;
          break;
        default:
          goto LABEL_29;
      }
      return v10;
    case 8:
      __panic_npx("panic: property is not constrainable: %s", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, *(void *)a1);
    default:
      uint64_t v14 = "p->p_constraint->pc_code";
LABEL_30:
      __panic_npx("panic: unreachable case: %s = 0x%llx", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)v14);
  }
}

BOOL property_constrain_digest(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  char v37 = 0;
  memset(v36, 0, sizeof(v36));
  char v35 = 0;
  memset(v34, 0, sizeof(v34));
  digest_print_cstr(a3, (unint64_t)v36, a3, a4, a5, a6, a7, a8);
  digest_print_cstr(a4, (unint64_t)v34, v12, v13, v14, v15, v16, v17);
  uint64_t v18 = digest_compare(a3, a4);
  BOOL v26 = 0;
  uint64_t v27 = *(void *)(a3 + 72);
  uint64_t v28 = *(void *)(a4 + 72);
  switch(**(void **)(a1 + 48))
  {
    case 0:
      BOOL v26 = v18;
      if (v27 != v28) {
        goto LABEL_3;
      }
      goto LABEL_8;
    case 1:
    case 2:
    case 3:
    case 4:
      __panic_npx("panic: non-sensical property digest specification: %s", v19, v20, v21, v22, v23, v24, v25, *(void *)a1);
    case 5:
      BOOL v26 = v18 == 0;
      if (v27 != v28) {
        goto LABEL_8;
      }
LABEL_3:
      int v29 = *(_DWORD *)(a1 + 56);
      switch(v29)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_12;
        case 2:
        case 3:
          if (v29 != 2 && v29 != 3) {
            goto LABEL_25;
          }
LABEL_12:
          expert_log(a2, 0, (uint64_t)"%s: enforcing length[%s %s %s]: %lu %s %lu: %d", v21, v22, v23, v24, v25, a1 + 28);
          break;
        default:
          goto LABEL_25;
      }
LABEL_13:
      int v31 = *(_DWORD *)(a1 + 56);
      if (v26)
      {
        switch(v31)
        {
          case 0:
          case 1:
          case 6:
            goto LABEL_22;
          case 2:
          case 3:
            if (v31 != 2 && v31 != 3) {
              goto LABEL_25;
            }
LABEL_22:
            expert_log(a2, 0, (uint64_t)"%s: enforcing[%s %s %s]: %s %s %s: %d", v21, v22, v23, v24, v25, a1 + 28);
            break;
          default:
            goto LABEL_25;
        }
      }
      else
      {
        switch(v31)
        {
          case 0:
          case 1:
          case 6:
            goto LABEL_23;
          case 2:
          case 3:
            if (v31 != 2 && v31 != 3) {
              goto LABEL_25;
            }
LABEL_23:
            expert_log(a2, 1uLL, (uint64_t)"%s: enforcing[%s %s %s]: %s %s %s: success", v21, v22, v23, v24, v25, a1 + 28);
            break;
          default:
            goto LABEL_25;
        }
      }
      return v26;
    case 6:
LABEL_8:
      int v30 = *(_DWORD *)(a1 + 56);
      switch(v30)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_11;
        case 2:
        case 3:
          if (v30 != 2 && v30 != 3) {
            goto LABEL_25;
          }
LABEL_11:
          expert_log(a2, 1uLL, (uint64_t)"%s: enforcing length[%s %s %s]: %lu %s %lu: success", v21, v22, v23, v24, v25, a1 + 28);
          goto LABEL_13;
        default:
LABEL_25:
          long long v33 = "p->p_container";
          goto LABEL_26;
      }
    case 8:
      __panic_npx("panic: property is not constrainable: %s", v19, v20, v21, v22, v23, v24, v25, *(void *)a1);
    default:
      long long v33 = "p->p_constraint->pc_code";
LABEL_26:
      __panic_npx("panic: unreachable case: %s = 0x%llx", v19, v20, v21, v22, v23, v24, v25, (char)v33);
  }
}

uint64_t property_constrain_version(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = **(void **)(a1 + 48);
  int v11 = 0;
  unsigned int v12 = 1;
  switch(v9)
  {
    case 0:
      break;
    case 1:
      int v11 = 0;
      goto LABEL_4;
    case 2:
      int v11 = 1;
LABEL_4:
      unsigned int v12 = -1;
      uint64_t v9 = 2;
      break;
    case 3:
      int v11 = 0;
      uint64_t v9 = 1;
      unsigned int v12 = 1;
      break;
    case 4:
      unsigned int v12 = 1;
      int v11 = 1;
      uint64_t v9 = 1;
      break;
    case 5:
      int v11 = 0;
      unsigned int v12 = 1;
      uint64_t v9 = 3;
      break;
    case 6:
      unsigned int v12 = 0;
      int v11 = 0;
      uint64_t v9 = 0;
      break;
    default:
      __panic_npx("panic: illegal property definition: %s", a2, a3, a4, a5, a6, a7, a8, *(void *)a1);
  }
  uint64_t v13 = version_compare(a3, a4);
  if (v13) {
    int v21 = 0;
  }
  else {
    int v21 = v11;
  }
  if (v13 == v9) {
    int v21 = 1;
  }
  if (v21) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = v12;
  }
  int v23 = *(_DWORD *)(a1 + 56);
  if (v22)
  {
    switch(v23)
    {
      case 0:
      case 1:
      case 6:
        goto LABEL_26;
      case 2:
      case 3:
        if (v23 != 2 && v23 != 3) {
          goto LABEL_29;
        }
LABEL_26:
        expert_log(a2, 0, (uint64_t)"%s: enforcing[%s %s %s]: %s %s %s: %d", v16, v17, v18, v19, v20, a1 + 28);
        break;
      default:
        goto LABEL_29;
    }
  }
  else
  {
    switch(v23)
    {
      case 0:
      case 1:
      case 6:
        goto LABEL_27;
      case 2:
      case 3:
        if (v23 != 2 && v23 != 3) {
          goto LABEL_29;
        }
LABEL_27:
        expert_log(a2, 1uLL, (uint64_t)"%s: enforcing[%s %s %s]: %s %s %s: success", v16, v17, v18, v19, v20, a1 + 28);
        break;
      default:
LABEL_29:
        __panic_npx("panic: unreachable case: %s = 0x%llx", v14, v15, v16, v17, v18, v19, v20, (char)"p->p_container");
    }
  }
  return v22;
}

char *property_print_value(uint64_t a1, unint64_t a2, char *__str, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  switch(**(void **)(a1 + 40))
  {
    case 0:
    case 1:
      snprintf(__str, 0x80uLL, "0x%x");
      goto LABEL_7;
    case 2:
      snprintf(__str, 0x80uLL, "0x%llx");
      goto LABEL_7;
    case 3:
      if (a2 + 80 < a2) {
        goto LABEL_11;
      }
      digest_print_cstr(a2, (unint64_t)__str, (uint64_t)__str, a4, a5, a6, a7, a8);
LABEL_7:
      uint64_t v9 = 0;
      do
      {
        if (v9 == 256)
        {
LABEL_11:
          __break(0x5519u);
LABEL_12:
          __panic_npx("panic: unreachable case: %s = 0x%llx", a2, (uint64_t)__str, a4, a5, a6, a7, a8, (char)"p->p_type->pt_switchable");
        }
      }
      while (__str[v9++]);
      return __str;
    case 4:
      snprintf(__str, 0x80uLL, "%s");
      goto LABEL_7;
    default:
      goto LABEL_12;
  }
}

uint64_t _chain_enforceable(uint64_t a1, uint64_t a2)
{
  if (odometer_policy_get_chip_property(a1, *(void *)(a2 + 16)))
  {
    if (*(_WORD *)(a2 + 528))
    {
      uint64_t v3 = *(void *)a2;
      uint64_t name = chip_get_name(*(void *)(a2 + 16));
      uint64_t v9 = "odometer[%s:%s]: boot manifest hash is caller-supplied";
    }
    else
    {
      int chip_boot = odometer_query_chip_boot(a2);
      uint64_t v3 = *(void *)a2;
      uint64_t v19 = chip_get_name(*(void *)(a2 + 16));
      if (chip_boot)
      {
        expert_log(v3, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v4, v5, v6, v7, v8, v19);
        return 0;
      }
      uint64_t name = v19;
      uint64_t v9 = "odometer[%s:%s]: environment is a first-stage booter";
    }
    uint64_t v10 = 1;
    expert_log(v3, 1uLL, (uint64_t)v9, v4, v5, v6, v7, v8, name);
  }
  else
  {
    uint64_t v11 = *(void *)a2;
    uint64_t v12 = chip_get_name(*(void *)(a2 + 16));
    uint64_t v10 = 1;
    expert_log(v11, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v13, v14, v15, v16, v17, v12);
  }
  return v10;
}

uint64_t _chain_enforce(uint64_t a1, uint64_t *a2)
{
  v28[13] = *MEMORY[0x263EF8340];
  uint64_t v4 = a2[1];
  unint64_t v5 = a2[2];
  uint64_t chip_property = odometer_policy_get_chip_property(a1, v5);
  *(_OWORD *)uint64_t v28 = xmmword_263C0DA38;
  memset(&v28[2], 170, 88);
  manifest_measure(v4, v5, (uint64_t)v28);
  uint64_t v11 = odometer_enforce_property(a2, a1, chip_property, (unsigned __int8 *)v28, v7, v8, v9, v10);
  uint64_t v12 = *a2;
  uint64_t name = chip_get_name(a2[2]);
  if (v11)
  {
    uint64_t v19 = expert_log(v12, 0, (uint64_t)"odometer[%s:%s]: boot chain integrity violation: %d", v14, v15, v16, v17, v18, name);
    if (v11 >= 0x6A) {
      __panic_npx_2(v19, v20, v21, v22, v23, v24, v25, v26, v11);
    }
  }
  else
  {
    expert_log(v12, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is consistent with boot chain", v14, v15, v16, v17, v18, name);
  }
  return v11;
}

uint64_t generic_expert_specialist()
{
  uint64_t bootstrap = expert_get_bootstrap();
  expert_runtime_entry(bootstrap);
  uint64_t result = __plat4_mem;
  if (!__plat4_mem) {
    __panic_npx("panic: specialist not set after runtime entry", v1, v2, v3, v4, v5, v6, v7, vars0);
  }
  return result;
}

uint64_t generic_expert_current()
{
  if (off_26B434A18) {
    return off_26B434A18();
  }
  else {
    return generic_expert_specialist();
  }
}

uint64_t generic_expert_supervisor()
{
  return qword_26B434A10;
}

char **generic_expert()
{
  return &__genx_mem;
}

uint64_t generic_expert_set_specialist(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *(void **)(a1 + 24);
  uint64_t result = _expert_assert(a1, 1734700664, (uint64_t)"set specialist", a4, a5, a6, a7, a8);
  *uint64_t v10 = a2;
  v10[3] = a3;
  return result;
}

uint64_t generic_expert_set_current_resolver(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t result = _expert_assert(a1, 1734700664, (uint64_t)"set resolver", a4, a5, a6, a7, a8);
  *(void *)(v9 + 16) = a2;
  return result;
}

uint64_t generic_expert_set_supervisor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t result = _expert_assert(a1, 1734700664, (uint64_t)"set supervisor", a4, a5, a6, a7, a8);
  *(void *)(v9 + 8) = a2;
  return result;
}

uint64_t generic_expert_get_chip_instance(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return *(void *)(*(void *)(a1 + 16) + 32);
}

char *_generic_expert_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(v8 + 24);
  long long v29 = xmmword_270ECE640;
  uint64_t v30 = qword_270ECE650;
  uint64_t v11 = *(uint64_t **)v8;
  uint64_t result = property_iterator_next((uint64_t)&v29, a2, a3, a4, a5, a6, a7, a8);
  if (result)
  {
    uint64_t v20 = (uint64_t)result;
    do
    {
      unsigned __int8 v33 = 0;
      int v32 = 0;
      uint64_t v31 = 0;
      memset(v36, 0, sizeof(v36));
      uint64_t v35 = 0x3E800000000;
      memset(v34, 0, sizeof(v34));
      switch(**(void **)(v20 + 40))
      {
        case 0:
          int property_digest = expert_query_property_BOOL((uint64_t)v11, v10, v20, &v33);
          break;
        case 1:
          int property_digest = expert_query_property_uint32((uint64_t)v11, v10, v20, &v32);
          break;
        case 2:
          int property_digest = expert_query_property_uint64((uint64_t)v11, v10, v20, &v31);
          break;
        case 3:
          int property_digest = expert_query_property_digest((uint64_t)v11, v10, v20, (uint64_t)v36);
          break;
        case 4:
          int property_digest = expert_query_property_version((uint64_t)v11, v10, v20, (uint64_t)v34);
          break;
        default:
LABEL_26:
          __panic_npx("panic: unreachable case: %s = 0x%llx", v13, v14, v15, v16, v17, v18, v19, (char)"p->p_type->pt_switchable");
      }
      if (property_digest > 18)
      {
        if (property_digest != 45 && property_digest != 19) {
          goto LABEL_25;
        }
      }
      else
      {
        if (!property_digest)
        {
          switch(**(void **)(v20 + 40))
          {
            case 0:
              chip_instance_set_BOOL(v9 + 40, v20, &v33, v15, v16, v17, v18, v19);
              goto LABEL_16;
            case 1:
              chip_instance_set_uint32(v9 + 40, v20, &v32, v15, v16, v17, v18, v19);
              goto LABEL_16;
            case 2:
              chip_instance_set_uint64(v9 + 40, v20, &v31, v15, v16, v17, v18, v19);
              goto LABEL_16;
            case 3:
              chip_instance_set_digest(v9 + 40, v20, (uint64_t)v36, v15, v16, v17, v18, v19);
              goto LABEL_16;
            case 4:
              chip_instance_set_version(v9 + 40, v20, v34, v15, v16, v17, v18, v19);
              goto LABEL_16;
            default:
              goto LABEL_26;
          }
        }
        if (property_digest != 2) {
LABEL_25:
        }
          __panic_npx("panic: failed to query expert: uint64_t expert = %s, p = %s, fourcc = %s, code = %llu: %d", v13, v14, v15, v16, v17, v18, v19, *v11);
      }
      expert_log((uint64_t)v11, 2uLL, (uint64_t)"failed to query expert: uint64_t expert = %s, p = %s, fourcc = %s, code = %llu: %d", v15, v16, v17, v18, v19, *v11);
LABEL_16:
      uint64_t result = property_iterator_next((uint64_t)&v29, v22, v23, v24, v25, v26, v27, v28);
      uint64_t v20 = (uint64_t)result;
    }
    while (result);
  }
  *(void *)(v9 + 32) = v9 + 40;
  return result;
}

uint64_t _generic_expert_boot()
{
  return 0;
}

uint64_t _generic_expert_get_digest_info(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 16) + 24) + 48))();
}

uint64_t _generic_expert_get_secure_boot()
{
  return 78;
}

uint64_t _generic_expert_query_chip(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 16) + 24);
}

uint64_t _generic_expert_query_chip_boot()
{
  return 45;
}

uint64_t _generic_expert_query_nonce()
{
  return 78;
}

uint64_t _generic_expert_entangle_nonce()
{
  return 78;
}

uint64_t _generic_expert_read_boot_manifest()
{
  return 78;
}

uint64_t _generic_expert_query_trust_store()
{
  return 78;
}

uint64_t _generic_expert_read_storage()
{
  return 78;
}

uint64_t _generic_expert_write_storage()
{
  return 78;
}

uint64_t _generic_expert_sync_storage()
{
  return 78;
}

uint64_t _generic_expert_query_property_BOOL(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *(unsigned char **)(*(void *)(a1 + 16) + 32);
  if (!chip_instance_check((unint64_t)v10, a3, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8)) {
    return 2;
  }
  chip_instance_get_BOOL(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0;
}

uint64_t _generic_expert_query_property_uint32(uint64_t a1, uint64_t a2, void *a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *(_DWORD **)(*(void *)(a1 + 16) + 32);
  if (!chip_instance_check((unint64_t)v10, a3, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8)) {
    return 2;
  }
  chip_instance_get_uint32(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0;
}

uint64_t _generic_expert_query_property_uint64(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *(void **)(*(void *)(a1 + 16) + 32);
  if (!chip_instance_check((unint64_t)v10, a3, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8)) {
    return 2;
  }
  chip_instance_get_uint64(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0;
}

uint64_t _generic_expert_query_property_digest(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v10 = *(void *)(*(void *)(a1 + 16) + 32);
  if (!chip_instance_check(v10, a3, (uint64_t)a3, a4, a5, a6, a7, a8)) {
    return 2;
  }
  chip_instance_get_digest(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0;
}

uint64_t _generic_expert_query_property_version(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v10 = *(void *)(*(void *)(a1 + 16) + 32);
  if (!chip_instance_check(v10, a3, (uint64_t)a3, a4, a5, a6, a7, a8)) {
    return 2;
  }
  chip_instance_get_version(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0;
}

uint64_t _generic_expert_boot_once()
{
  return 0;
}

void _generic_expert_read_random(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx("panic: should never be called", a2, a3, a4, a5, a6, a7, a8, vars0);
}

void _generic_expert_syscall(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx("panic: should never be called", a2, a3, a4, a5, a6, a7, a8, vars0);
}

uint64_t img4_runtime_get_expert(char *a1)
{
  if (a1 == (char *)&_img4_runtime_default || a1 == (char *)&_img4_runtime_restore)
  {
    uint64_t v2 = (uint64_t (**)(void))(a1 + 88);
  }
  else
  {
    uint64_t v3 = (char *)*((void *)a1 + 1);
    if (v3 == off_270ECB0C8)
    {
      uint64_t v2 = &off_270ECB118;
    }
    else
    {
      if (v3 != off_270ECDE58) {
        return 0;
      }
      uint64_t v2 = &off_270ECDEA8;
    }
  }
  return (*v2)();
}

uint64_t img4_runtime_check_custom_BOOL(uint64_t a1)
{
  uint64_t v1 = 0;
  char v2 = 1;
  while (*(void *)(a1 + 56) != *((void *)(&off_2655E3BF0)[v1] + 7))
  {
    char v3 = v2;
    char v2 = 0;
    uint64_t v1 = 1;
    if ((v3 & 1) == 0) {
      return *(void *)(a1 + 80);
    }
  }
  return 0;
}

uint64_t img4_runtime_check_custom_digest(uint64_t a1)
{
  char v1 = 0;
  uint64_t v2 = 0;
  uint64_t v3 = *(void *)(a1 + 80);
  do
  {
    char v4 = v1;
    uint64_t v5 = *(void *)&(*(&off_2655E3BF0)[v2])[80];
    if (v3 == v5) {
      break;
    }
    char v1 = 1;
    uint64_t v2 = 1;
  }
  while ((v4 & 1) == 0);
  if (v3 == v5) {
    return 0;
  }
  else {
    return *(void *)(a1 + 80);
  }
}

uint64_t version_init(uint64_t a1, char *a2, size_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  memset(v19, 0, sizeof(v19));
  __stringp = (char *)v19;
  cstring_init_with_buff(a1, a2, a3);
  *(void *)(a1 + 96) = 0xFADE2DED00000000;
  *(_OWORD *)(a1 + 80) = xmmword_263C0DAB0;
  cstring_get_string(a1);
  __strlcpy_chk();
  uint64_t v17 = strsep_npx(&__stringp, ",");
  if (__stringp) {
    *(_DWORD *)(a1 + 100) = _strtou_bounded(__stringp, 0, 0, v4, v5, v6, v7, v8);
  }
  for (uint64_t i = 0; i != 5; ++i)
  {
    unint64_t v10 = strsep_npx(&v17, ".");
    if (!v10) {
      break;
    }
    *(_DWORD *)(a1 + i * 4 + 80) = _strtou_bounded(v10, *(unsigned int *)((char *)&xmmword_263C0DAB0 + i * 4), dword_263C0DAC4[i], v11, v12, v13, v14, v15);
  }
  if (!strcmp((const char *)a1, "0.0.0.0.0,0")) {
    *(_DWORD *)(a1 + 80) = 0;
  }
  return a1;
}

uint64_t _strtou_bounded(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = a3;
  unsigned int v9 = a2;
  uint64_t v14 = 0;
  if (a2 > a3) {
    __panic_npx_7((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8, a2);
  }
  unsigned int v10 = strtou32_npx(a1, &v14, 10);
  if (v14 && *v14) {
    unsigned int v10 = v9;
  }
  if (v10 <= v9) {
    unsigned int v11 = v9;
  }
  else {
    unsigned int v11 = v10;
  }
  if (v11 <= v8 || v8 == 0) {
    return v11;
  }
  else {
    return v9;
  }
}

uint64_t version_compare_xgroup(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + 80;
  if (!*(_DWORD *)(a1 + 80)) {
    return 0;
  }
  uint64_t v3 = 0;
  uint64_t result = 1;
  while (1)
  {
    unsigned int v5 = *(_DWORD *)(v2 + v3);
    unsigned int v6 = *(_DWORD *)(a2 + 80 + v3);
    if (v5 > v6) {
      break;
    }
    if (v5 < v6) {
      return 2;
    }
    v3 += 4;
    if (v3 == 20) {
      return 0;
    }
  }
  return result;
}

uint64_t version_compare(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + 80;
  if (!*(_DWORD *)(a1 + 80)) {
    return 0;
  }
  if (*(_DWORD *)(a1 + 100) != *(_DWORD *)(a2 + 100)) {
    return 3;
  }
  uint64_t v3 = 0;
  uint64_t result = 1;
  while (1)
  {
    unsigned int v5 = *(_DWORD *)(v2 + v3);
    unsigned int v6 = *(_DWORD *)(a2 + 80 + v3);
    if (v5 > v6) {
      break;
    }
    if (v5 < v6) {
      return 2;
    }
    v3 += 4;
    if (v3 == 20) {
      return 0;
    }
  }
  return result;
}

__n128 version_copy(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

char *version_copyout(char *__source, char *__dst)
{
  __n128 result = (char *)strlcpy(__dst, __source, 0x40uLL);
  uint64_t v4 = 0;
  while (v4 != 64)
  {
    if (!__dst[v4++]) {
      return __dst;
    }
  }
  __break(0x5519u);
  return result;
}

void __panic_npx_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unsigned int v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  unsigned int v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: invalid min/max: min = %u, max = %u", &a9);
  _os_crash();
  __break(1u);
}

uint64_t _UnsupportedApComputeDigest()
{
  return 4;
}

uint64_t _UnsupportedApVerifyChain()
{
  return 4;
}

uint64_t _UnsupportedApVerifySignature()
{
  return 4;
}

uint64_t _UnsupportedApEvaluateCertificateProperties()
{
  return 4;
}

uint64_t type_get_handle(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(_DWORD *)(a1 + 8) && dyld_program_minos_at_least()) {
    return 0;
  }
  return v1;
}

uint64_t type_get_size(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t _type_get_alloc_preference(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t _image4_coprocessor_select_internal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  switch(*(void *)(a2 + 8))
  {
    case 0:
      uint64_t v9 = image4_coprocessor_select_digest(a1, a2);
      goto LABEL_7;
    case 1:
      uint64_t v9 = image4_coprocessor_select_secure_boot(a1, a2, a3);
      goto LABEL_7;
    case 3:
      uint64_t v10 = *(void *)(a2 + 16);
      if (!v10) {
        return v10;
      }
      goto LABEL_8;
    case 4:
      uint64_t v9 = (*(uint64_t (**)(void))(a2 + 16))();
LABEL_7:
      uint64_t v10 = v9;
      if (v9)
      {
LABEL_8:
        uint64_t name = chip_get_name(v10);
        expert_log(a4, 2uLL, (uint64_t)"resolved: %s", v12, v13, v14, v15, v16, name);
      }
      return v10;
    default:
      __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"cps->cps_type");
  }
}

uint64_t image4_coprocessor_select_digest(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = generic_expert_current();
  uint64_t v4 = *(void *)expert_get_digest_info(v3, 0, 0);
  if (v4 == 48)
  {
    uint64_t v6 = a2 + 24;
  }
  else
  {
    uint64_t result = 0;
    if (v4 != 20) {
      return result;
    }
    uint64_t v6 = a2 + 16;
  }
  return *(void *)v6;
}

uint64_t image4_coprocessor_select_secure_boot(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, a3);
  uint64_t v12 = a2 + 16;
  switch(v4)
  {
    case 0:
      return *(void *)v12;
    case 1:
      uint64_t v12 = a2 + 24;
      break;
    case 2:
      uint64_t v12 = a2 + 32;
      break;
    case 3:
      uint64_t v12 = a2 + 40;
      break;
    default:
      __panic_npx("panic: unreachable case: %s = 0x%llx", v5, v6, v7, v8, v9, v10, v11, (char)"sb");
  }
  return *(void *)v12;
}

uint64_t image4_coprocessor_get_handle(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24);
}

uint64_t image4_coprocessor_get_handle_host()
{
  return 0;
}

unint64_t image4_coprocessor_get_secure_boot(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return image4_environment_get_secure_boot(a2, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t image4_coprocessor_get_secure_boot_host(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  uint64_t v12 = 0;
  int secure_boot = expert_get_secure_boot(v2, (uint64_t)&v12);
  if (secure_boot) {
    __panic_npx("panic: failed to get secure boot: %d", v4, v5, v6, v7, v8, v9, v10, secure_boot);
  }
  return v12;
}

uint64_t image4_coprocessor_select(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = *(void *)(a3 + 8);
  unint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 16))(a1, a3);
  unint64_t v15 = v7;
  if (v7 >= *(void *)(v5 + 608)) {
    __panic_npx("panic: incomplete coprocessor map: uint64_t handle = %lld, expected < %lld", v8, v9, v10, v11, v12, v13, v14, v7);
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 24))(v5, a3);
  uint64_t result = expert_log(v6, 2uLL, (uint64_t)"resolving environment: coproc = %s, handle = %llx, secure boot = %llx", v16, v17, v18, v19, v20, *(void *)v5);
  unint64_t v26 = v5 + 32 + 48 * v15;
  if (a2) {
    uint64_t v27 = a2;
  }
  else {
    uint64_t v27 = (void *)(v5 + 32 + 48 * v15);
  }
  if ((!v27 || (v26 < v5 + 608 ? (BOOL v28 = v26 >= v5 + 32) : (BOOL v28 = 0), !v28 ? (v29 = 0) : (v29 = 1), a2 || v29))
    && (v27[1] != 2
     || (v5 = v27[2], (uint64_t v27 = (void *)(v5 + 32 + 48 * v27[3])) == 0)
     || ((unint64_t)v27 < v5 + 608 ? (BOOL v30 = (unint64_t)v27 >= v5 + 32) : (BOOL v30 = 0), v30)))
  {
    return _image4_coprocessor_select_internal(v5, (uint64_t)v27, a3, v6, v22, v23, v24, v25);
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t *image4_coprocessor_resolve_from_manifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v6 = generic_expert_current();
  uint64_t v48 = 0;
  memset(v47, 0, sizeof(v47));
  uint64_t v7 = expert_runtime_boot(v6);
  if (v7)
  {
    *(void *)&long long v44 = v7;
    uint64_t v13 = "failed to boot expert for chip selection: %d";
    uint64_t v14 = v6;
    unint64_t v15 = 3;
    goto LABEL_5;
  }
  Img4DecodeInitAsManifest(a1, a2, (uint64_t)v47);
  if (v16)
  {
    *(void *)&long long v44 = v16;
    uint64_t v13 = "Img4DecodeInitAsManifest: %d";
    uint64_t v14 = v6;
    unint64_t v15 = 0;
LABEL_5:
    expert_log(v14, v15, (uint64_t)v13, v8, v9, v10, v11, v12, v44);
    return 0;
  }
  uint64_t v19 = 0;
  while (1)
  {
    uint64_t v17 = *(uint64_t **)(a3 + v19);
    uint64_t v46 = 0;
    if (v17)
    {
      uint64_t v20 = v17 + 77;
      uint64_t v21 = image4_environment_new((uint64_t)v17, 0);
      uint64_t v46 = v21;
      if (!v21)
      {
        MEMORY[0x270FA5388](0, v22, v23, v24, v25, v26, v27, v28);
        *(void *)&long long v36 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v36 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *((_OWORD *)&v45 - 2) = v36;
        long long v44 = v36;
        *((_OWORD *)&v45 - 4) = v36;
        *((_OWORD *)&v45 - 3) = v36;
        *((_OWORD *)&v45 - 6) = v36;
        *((_OWORD *)&v45 - 5) = v36;
        *((_OWORD *)&v45 - 8) = v36;
        *((_OWORD *)&v45 - 7) = v36;
        *((_OWORD *)&v45 - 10) = v36;
        *((_OWORD *)&v45 - 9) = v36;
        *((_OWORD *)&v45 - 12) = v36;
        *((_OWORD *)&v45 - 11) = v36;
        *((_OWORD *)&v45 - 14) = v36;
        *((_OWORD *)&v45 - 13) = v36;
        *((_OWORD *)&v45 - 16) = v36;
        *((_OWORD *)&v45 - 15) = v36;
        if (v17 >= v20) {
          goto LABEL_19;
        }
        uint64_t v21 = _image4_environment_init((uint64_t)(&v45 - 256), (uint64_t)v17, 0, 0, v32, v33, v34, v35);
        uint64_t v46 = v21;
      }
      uint64_t v37 = image4_environment_resolve(v21);
      if (v37)
      {
        int v29 = *(long long **)(v37 + 32);
        if (!v29) {
          goto LABEL_20;
        }
        Img4DecodeCheckAuthority((uint64_t)v47, v29);
        if (!v43) {
          break;
        }
      }
    }
    image4_environment_destroy(&v46);
    v19 += 8;
    if (v19 == 24) {
      return 0;
    }
  }
  expert_log(v6, 2uLL, (uint64_t)"manifest matches coproc: %s", v38, v39, v40, v41, v42, *v17);
  image4_environment_destroy(&v46);
  if (v17 >= v20)
  {
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __panic_npx("panic: illegal coprocessor map: canonical handle has no static decode implementation", (uint64_t)v29, v30, v31, v32, v33, v34, v35, v45);
  }
  return v17;
}

uint64_t img4_image_get_bytes(uint64_t a1)
{
  uint64_t v9 = 0;
  memset(v8, 0, sizeof(v8));
  uint64_t v2 = *(void *)(a1 + 40);
  if ((*(unsigned char *)a1 & 0x10) != 0) {
    uint64_t encoded_bytes = (uint64_t)payload_get_encoded_bytes(v2, v8);
  }
  else {
    uint64_t encoded_bytes = payload_get_decoded_bytes(v2, (uint64_t)v8);
  }
  uint64_t v4 = (unint64_t *)encoded_bytes;
  *(_WORD *)(a1 + 8) = 0;
  uint64_t result = a1 + 8;
  unint64_t v7 = *v4;
  unint64_t v6 = v4[1];
  if (v7 > v7 + v6)
  {
    __break(0x5519u);
  }
  else
  {
    *(void *)(a1 + 16) = v7;
    *(void *)(a1 + 24) = v6;
    *(void *)(a1 + 32) = 0;
  }
  return result;
}

BOOL *img4_image_get_property_BOOL(uint64_t a1, unsigned int a2, BOOL *a3)
{
  if (Img4DecodeGetObjectPropertyBoolean(*(void *)(*(void *)(a1 + 40) + 104), **(unsigned int **)(*(void *)(a1 + 40) + 8), a2, a3))return 0; {
  else
  }
    return a3;
}

_DWORD *img4_image_get_property_uint32(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  Img4DecodeGetObjectPropertyInteger(*(void *)(*(void *)(a1 + 40) + 104), **(unsigned int **)(*(void *)(a1 + 40) + 8), a2, a3);
  if (v4) {
    return 0;
  }
  else {
    return a3;
  }
}

unint64_t *img4_image_get_property_uint64(uint64_t a1, unsigned int a2, unint64_t *a3)
{
  Img4DecodeGetObjectPropertyInteger64(*(void *)(*(void *)(a1 + 40) + 104), **(unsigned int **)(*(void *)(a1 + 40) + 8), a2, a3);
  if (v4) {
    return 0;
  }
  else {
    return a3;
  }
}

uint64_t img4_image_get_property_data(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(v4 + 104);
  uint64_t v6 = **(unsigned int **)(v4 + 8);
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  Img4DecodeGetObjectPropertyData(v5, v6, a2, &v11, &v12);
  int v8 = v7;
  uint64_t result = 0;
  if (!v8)
  {
    *(_WORD *)a3 = 0;
    uint64_t v10 = v12;
    *(void *)(a3 + 8) = v11;
    *(void *)(a3 + 16) = v10;
    *(void *)(a3 + 24) = 0;
    return a3;
  }
  return result;
}

BOOL *img4_image_get_entitlement_BOOL(uint64_t a1, unsigned int a2, BOOL *a3)
{
  uint64_t v4 = *(void *)(a1 + 48);
  if (*(_WORD *)(v4 + 528)) {
    uint64_t v5 = v4 + 72;
  }
  else {
    uint64_t v5 = 0;
  }
  if (Img4DecodeGetBooleanFromSection(v5, 0, a2, a3)) {
    return 0;
  }
  else {
    return a3;
  }
}

_DWORD *img4_image_get_entitlement_uint32(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v4 = *(void *)(a1 + 48);
  if (*(_WORD *)(v4 + 528)) {
    uint64_t v5 = v4 + 72;
  }
  else {
    uint64_t v5 = 0;
  }
  Img4DecodeGetIntegerFromSection(v5, 0, a2, a3);
  if (v6) {
    return 0;
  }
  else {
    return a3;
  }
}

unint64_t *img4_image_get_entitlement_uint64(uint64_t a1, unsigned int a2, unint64_t *a3)
{
  uint64_t v4 = *(void *)(a1 + 48);
  if (*(_WORD *)(v4 + 528)) {
    uint64_t v5 = v4 + 72;
  }
  else {
    uint64_t v5 = 0;
  }
  Img4DecodeGetInteger64FromSection(v5, 0, a2, a3);
  if (v6) {
    return 0;
  }
  else {
    return a3;
  }
}

uint64_t img4_image_get_entitlement_data(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 48);
  if (*(_WORD *)(v4 + 528)) {
    uint64_t v5 = v4 + 72;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  Img4DecodeGetDataFromSection(v5, 0, a2, &v10, &v11);
  int v7 = v6;
  uint64_t result = 0;
  if (!v7)
  {
    *(_WORD *)a3 = 0;
    uint64_t v9 = v11;
    *(void *)(a3 + 8) = v10;
    *(void *)(a3 + 16) = v9;
    *(void *)(a3 + 24) = 0;
    return a3;
  }
  return result;
}

void *img4_image_init(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *uint64_t result = a4;
  result[5] = a2;
  result[6] = a3;
  return result;
}

uint64_t boot_expert_boot_manifest(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  v48[0] = xmmword_270ECE9C0;
  v48[1] = *(_OWORD *)&off_270ECE9D0;
  void v48[2] = xmmword_270ECE9E0;
  uint64_t v49 = qword_270ECE9F0;
  v45[0] = a1;
  v45[1] = a2;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  memset(v52, 170, sizeof(v52));
  long long v50 = xmmword_263C0DC38;
  long long v51 = unk_263C0DC48;
  _expert_assert(a1, 1651470196, (uint64_t)"boot manifest", a4, a5, a6, a7, a8);
  if (a3[1])
  {
    uint64_t v11 = a3[2];
    uint64_t v46 = a3[1];
    uint64_t v47 = v11;
  }
  manifest_set_callbacks((uint64_t)a3, (uint64_t)v45, (uint64_t)v48);
  unint64_t v12 = manifest_parse((uint64_t)a3);
  if (v12)
  {
    unint64_t v18 = v12;
    expert_log(a1, 0, (uint64_t)"failed to parse manifest for boot: %d", v13, v14, v15, v16, v17, v12);
    goto LABEL_7;
  }
  uint64_t v26 = manifest_impose(a3, a2, 0, 0);
  if (v26)
  {
    unint64_t v18 = v26;
    expert_log(a1, 0, (uint64_t)"failed to impose manifest for boot: %d", v27, v28, v29, v30, v31, v26);
LABEL_7:
    if (v18 >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v19, v20, v21, v22, v23, v24, v25, v18);
    }
    return v18;
  }
  if (!*(void *)(a2 + 248))
  {
LABEL_15:
    expert_log(a1, 2uLL, (uint64_t)"booted manifest", v27, v28, v29, v30, v31, v44);
    return 0;
  }
  uint64_t result = manifest_measure((uint64_t)a3, a2, (uint64_t)&v50);
  uint64_t v33 = *(void *)(a1 + 24);
  uint64_t v34 = *(void *)(*(void *)(a2 + 248) + 16);
  unint64_t v35 = v33 + 272;
  unint64_t v36 = v33 + 272 + 104 * v34;
  if (v36 < v33 + 3704 && v36 >= v35)
  {
    long long v37 = v50;
    long long v38 = *(_OWORD *)v52;
    *(_OWORD *)(v36 + 16) = v51;
    *(_OWORD *)(v36 + 32) = v38;
    *(_OWORD *)unint64_t v36 = v37;
    long long v39 = *(_OWORD *)&v52[16];
    long long v40 = *(_OWORD *)&v52[32];
    long long v41 = *(_OWORD *)&v52[48];
    *(void *)(v36 + 96) = *(void *)&v52[64];
    *(_OWORD *)(v36 + 64) = v40;
    *(_OWORD *)(v36 + 80) = v41;
    *(_OWORD *)(v36 + 48) = v39;
    unint64_t v42 = v33 + 8;
    int v43 = (unint64_t *)(v33 + 8 + 8 * v34);
    if ((unint64_t)v43 < v35 && (unint64_t)v43 >= v42)
    {
      *int v43 = v36;
      goto LABEL_15;
    }
  }
  __break(0x5519u);
  return result;
}

unint64_t _boot_expert_property_BOOL(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v9 = *a5;
  uint64_t v11 = (uint64_t (**)(uint64_t, _DWORD *, uint64_t, uint64_t, uint64_t))a5[2];
  uint64_t v10 = a5[3];
  unint64_t result = _boot_expert_find_entitlement(*a5, a2, a3, a5[1], (uint64_t)&_property_type_BOOL);
  if (result)
  {
    uint64_t v13 = *(void *)(v9 + 24);
    unint64_t v14 = v13 + 272 + 104 * *(void *)(result + 16);
    if (v14)
    {
      if (v14 >= v13 + 3704 || v14 < v13 + 272) {
        goto LABEL_25;
      }
    }
    *(unsigned char *)unint64_t v14 = a4;
    uint64_t v16 = *(void *)(v9 + 24);
    uint64_t v17 = *(void *)(result + 16);
    unint64_t v18 = v16 + 272;
    unint64_t v19 = v16 + 272 + 104 * v17;
    if (v19 >= v16 + 3704 || v19 < v18) {
      goto LABEL_25;
    }
    long long v21 = *(_OWORD *)v14;
    long long v22 = *(_OWORD *)(v14 + 32);
    *(_OWORD *)(v19 + 16) = *(_OWORD *)(v14 + 16);
    *(_OWORD *)(v19 + 32) = v22;
    *(_OWORD *)unint64_t v19 = v21;
    long long v23 = *(_OWORD *)(v14 + 48);
    long long v24 = *(_OWORD *)(v14 + 64);
    long long v25 = *(_OWORD *)(v14 + 80);
    *(void *)(v19 + 96) = *(void *)(v14 + 96);
    *(_OWORD *)(v19 + 64) = v24;
    *(_OWORD *)(v19 + 80) = v25;
    *(_OWORD *)(v19 + 48) = v23;
    unint64_t v26 = v16 + 8;
    uint64_t v27 = (unint64_t *)(v26 + 8 * v17);
    if ((unint64_t)v27 >= v18 || (unint64_t)v27 < v26)
    {
LABEL_25:
      __break(0x5519u);
      return result;
    }
    *uint64_t v27 = v19;
  }
  if (v11)
  {
    uint64_t v29 = *v11;
    if (*v11)
    {
      return v29(a1, a2, a3, a4, v10);
    }
  }
  return result;
}

unint64_t _boot_expert_property_integer(uint64_t a1, _DWORD *a2, uint64_t a3, unint64_t a4, uint64_t *a5)
{
  uint64_t v8 = 0;
  uint64_t v9 = *a5;
  uint64_t v10 = a5[1];
  uint64_t v12 = a5[2];
  uint64_t v11 = a5[3];
  char v13 = 1;
  do
  {
    char v14 = v13;
    uint64_t v15 = (void *)off_2655E4060[v8];
    unint64_t result = _boot_expert_find_entitlement(v9, a2, a3, v10, (uint64_t)v15);
    if (result)
    {
      uint64_t v24 = *(void *)(v9 + 24);
      unint64_t v25 = v24 + 272 + 104 * *(void *)(result + 16);
      if (!v25 || (v25 < v24 + 3704 ? (BOOL v26 = v25 >= v24 + 272) : (BOOL v26 = 0), v26))
      {
        if (*v15 == 2)
        {
          *(void *)unint64_t v25 = a4;
        }
        else
        {
          if (*v15 != 1) {
            goto LABEL_38;
          }
          if (HIDWORD(a4)) {
            __panic_npx("panic: integer cast overflow: v = %s, actual = %llu, expected <= %llu", v17, v18, v19, v20, v21, v22, v23, (char)"v");
          }
          *(_DWORD *)unint64_t v25 = a4;
        }
        if (v25) {
          BOOL v27 = v25 >= v25 + 104;
        }
        else {
          BOOL v27 = 0;
        }
        if (!v27)
        {
          uint64_t v28 = *(void *)(v9 + 24);
          uint64_t v29 = *(void *)(result + 16);
          unint64_t v30 = v28 + 272;
          unint64_t v31 = v28 + 272 + 104 * v29;
          if (v31 < v28 + 3704 && v31 >= v30)
          {
            long long v33 = *(_OWORD *)v25;
            long long v34 = *(_OWORD *)(v25 + 32);
            *(_OWORD *)(v31 + 16) = *(_OWORD *)(v25 + 16);
            *(_OWORD *)(v31 + 32) = v34;
            *(_OWORD *)unint64_t v31 = v33;
            long long v35 = *(_OWORD *)(v25 + 48);
            long long v36 = *(_OWORD *)(v25 + 64);
            long long v37 = *(_OWORD *)(v25 + 80);
            *(void *)(v31 + 96) = *(void *)(v25 + 96);
            *(_OWORD *)(v31 + 64) = v36;
            *(_OWORD *)(v31 + 80) = v37;
            *(_OWORD *)(v31 + 48) = v35;
            unint64_t v38 = v28 + 8;
            long long v39 = (unint64_t *)(v38 + 8 * v29);
            if ((unint64_t)v39 < v30 && (unint64_t)v39 >= v38)
            {
              *long long v39 = v31;
              if (v12) {
                goto LABEL_32;
              }
              return result;
            }
          }
        }
      }
      __break(0x5519u);
LABEL_38:
      __panic_npx("panic: unreachable case: %s = 0x%llx", v17, v18, v19, v20, v21, v22, v23, (char)"pti->pt_switchable");
    }
    char v13 = 0;
    uint64_t v8 = 1;
  }
  while ((v14 & 1) != 0);
  if (!v12) {
    return result;
  }
LABEL_32:
  long long v41 = *(uint64_t (**)(uint64_t, _DWORD *, uint64_t, unint64_t, uint64_t))(v12 + 8);
  if (v41)
  {
    return v41(a1, a2, a3, a4, v11);
  }
  return result;
}

uint64_t _boot_expert_property_data(uint64_t a1, _DWORD *a2, uint64_t a3, char *a4, size_t a5, uint64_t *a6)
{
  uint64_t v9 = 0;
  uint64_t v10 = *a6;
  uint64_t v11 = a6[1];
  uint64_t v12 = a6[2];
  uint64_t v46 = a6[3];
  char v13 = 1;
  do
  {
    char v14 = v13;
    uint64_t v15 = (void *)off_2655E4070[v9];
    uint64_t result = _boot_expert_find_entitlement(v10, a2, a3, v11, (uint64_t)v15);
    if (result)
    {
      uint64_t v24 = result;
      uint64_t v25 = *(void *)(v10 + 24);
      unint64_t v26 = v25 + 272 + 104 * *(void *)(result + 16);
      if (v26)
      {
        if (v26 >= v25 + 3704 || v26 < v25 + 272) {
          goto LABEL_44;
        }
      }
      unint64_t v28 = v26 + 104;
      if (*v15 == 4)
      {
        if (v26) {
          BOOL v30 = v26 >= v28;
        }
        else {
          BOOL v30 = 0;
        }
        if (!v30)
        {
          uint64_t result = version_init(v26, a4, a5);
LABEL_24:
          if (v26) {
            BOOL v31 = v26 >= v28;
          }
          else {
            BOOL v31 = 0;
          }
          if (!v31)
          {
            uint64_t v32 = *(void *)(v10 + 24);
            uint64_t v33 = *(void *)(v24 + 16);
            unint64_t v34 = v32 + 272;
            unint64_t v35 = v32 + 272 + 104 * v33;
            if (v35 < v32 + 3704 && v35 >= v34)
            {
              long long v37 = *(_OWORD *)v26;
              long long v38 = *(_OWORD *)(v26 + 32);
              *(_OWORD *)(v35 + 16) = *(_OWORD *)(v26 + 16);
              *(_OWORD *)(v35 + 32) = v38;
              *(_OWORD *)unint64_t v35 = v37;
              long long v39 = *(_OWORD *)(v26 + 48);
              long long v40 = *(_OWORD *)(v26 + 64);
              long long v41 = *(_OWORD *)(v26 + 80);
              *(void *)(v35 + 96) = *(void *)(v26 + 96);
              *(_OWORD *)(v35 + 64) = v40;
              *(_OWORD *)(v35 + 80) = v41;
              *(_OWORD *)(v35 + 48) = v39;
              unint64_t v42 = v32 + 8;
              int v43 = (unint64_t *)(v32 + 8 + 8 * v33);
              if ((unint64_t)v43 < v34 && (unint64_t)v43 >= v42)
              {
                *int v43 = v35;
                if (v12) {
                  goto LABEL_39;
                }
                return result;
              }
            }
          }
        }
      }
      else
      {
        if (*v15 != 3) {
          goto LABEL_45;
        }
        if (v26) {
          BOOL v29 = v26 >= v26 + 80;
        }
        else {
          BOOL v29 = 0;
        }
        if (!v29)
        {
          uint64_t result = digest_init(v26, a4, a5, v19, v20, v21, v22, v23);
          goto LABEL_24;
        }
      }
LABEL_44:
      __break(0x5519u);
LABEL_45:
      __panic_npx("panic: unreachable case: %s = 0x%llx", v17, v18, v19, v20, v21, v22, v23, (char)"pti->pt_switchable");
    }
    char v13 = 0;
    uint64_t v9 = 1;
  }
  while ((v14 & 1) != 0);
  if (!v12) {
    return result;
  }
LABEL_39:
  char v45 = *(uint64_t (**)(uint64_t, _DWORD *, uint64_t, char *, size_t, uint64_t))(v12 + 16);
  if (v45)
  {
    return v45(a1, a2, a3, a4, a5, v46);
  }
  return result;
}

uint64_t _boot_expert_odometer_prepare(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  if (v3)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, void))(v3 + 32);
    if (v4) {
      return v4(result, a2, *(void *)(a3 + 24));
    }
  }
  return result;
}

void *boot_expert_boot_closure(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  memset(v25, 170, sizeof(v25));
  long long v23 = xmmword_263C0DC38;
  long long v24 = unk_263C0DC48;
  uint64_t v5 = (void *)(*(uint64_t (**)(void))(*(void *)(a2 + 8) + 48))();
  uint64_t result = digest_init_measure(&v23, v5, a3, v6, v7, v8, v9, v10);
  uint64_t v12 = *(void *)(a1 + 24);
  unint64_t v13 = v12 + 272;
  char v14 = (long long *)(v12 + 3496);
  if (v12 + 3496 >= (unint64_t)(v12 + 3704) || (unint64_t)v14 < v13) {
    goto LABEL_9;
  }
  long long v16 = v23;
  long long v17 = *(_OWORD *)v25;
  *(_OWORD *)(v12 + 3512) = v24;
  *(_OWORD *)(v12 + 3528) = v17;
  long long *v14 = v16;
  long long v18 = *(_OWORD *)&v25[16];
  long long v19 = *(_OWORD *)&v25[32];
  long long v20 = *(_OWORD *)&v25[48];
  *(void *)(v12 + 3592) = *(void *)&v25[64];
  *(_OWORD *)(v12 + 3560) = v19;
  *(_OWORD *)(v12 + 3576) = v20;
  *(_OWORD *)(v12 + 3544) = v18;
  unint64_t v21 = v12 + 8;
  uint64_t v22 = (long long **)(v12 + 256);
  if ((unint64_t)v22 >= v13 || (unint64_t)v22 < v21) {
LABEL_9:
  }
    __break(0x5519u);
  *uint64_t v22 = v14;
  return result;
}

uint64_t _boot_expert_boot()
{
  return 0;
}

void *_boot_expert_logv(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 16) + 48))(*(void **)(a1 + 16));
}

uint64_t _boot_expert_get_digest_info(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return expert_get_digest_info(**(void **)(a1 + 16), a2, a3);
}

uint64_t _boot_expert_get_secure_boot(uint64_t a1, uint64_t a2)
{
  return expert_get_secure_boot(**(void **)(a1 + 16), a2);
}

uint64_t _boot_expert_query_chip(uint64_t a1, uint64_t a2)
{
  return expert_query_chip(**(void **)(a1 + 16), a2);
}

uint64_t _boot_expert_query_chip_boot(uint64_t a1, uint64_t a2)
{
  return expert_query_chip_boot(**(void **)(a1 + 16), a2);
}

uint64_t _boot_expert_query_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return expert_query_nonce(**(void **)(a1 + 16), a2, a3, a4);
}

uint64_t _boot_expert_entangle_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return expert_entangle_nonce(**(void **)(a1 + 16), a2, a3, a4, a5);
}

uint64_t _boot_expert_read_boot_manifest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return expert_read_boot_manifest(**(void **)(a1 + 16), a2, a3, a4);
}

uint64_t _boot_expert_query_trust_store(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return expert_query_trust_store(**(void **)(a1 + 16), a2, a3, a4, a5);
}

uint64_t _boot_expert_read_storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return expert_read_storage(**(void **)(a1 + 16), a2, a3, a4);
}

uint64_t _boot_expert_write_storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return expert_write_storage(**(void **)(a1 + 16), a2, a3, a4);
}

uint64_t _boot_expert_sync_storage(uint64_t a1, uint64_t a2)
{
  return expert_sync_storage(**(void **)(a1 + 16), a2);
}

uint64_t _boot_expert_query_property_BOOL(uint64_t result, uint64_t a2, uint64_t a3, BOOL *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((char **)a3 == &_property_iuob)
  {
    return expert_compute_eieiou_BOOL(result, a2, a4);
  }
  else
  {
    uint64_t v11 = *(void *)(result + 24);
    unint64_t v12 = v11 + 8;
    unint64_t v13 = v11 + 272;
    char v14 = (BOOL **)(v11 + 8 + 8 * *(void *)(a3 + 16));
    if ((unint64_t)v14 < v13 && (unint64_t)v14 >= v12)
    {
      long long v16 = *v14;
      if (v16)
      {
        *a4 = *v16;
        return 0;
      }
      else
      {
        uint64_t v17 = **(void **)(result + 16);
        expert_log(result, 2uLL, (uint64_t)"falling back to base expert for property: %s", (uint64_t)a4, a5, a6, a7, a8, a3 + 28);
        return expert_query_property_BOOL(v17, a2, a3, (unsigned __int8 *)a4);
      }
    }
    else
    {
      __break(0x5519u);
    }
  }
  return result;
}

uint64_t _boot_expert_query_property_uint32(uint64_t result, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 24);
  unint64_t v9 = v8 + 8;
  unint64_t v10 = v8 + 272;
  uint64_t v11 = (_DWORD **)(v8 + 8 + 8 * *(void *)(a3 + 16));
  if ((unint64_t)v11 < v10 && (unint64_t)v11 >= v9)
  {
    char v14 = *v11;
    if (v14)
    {
      *a4 = *v14;
      return 0;
    }
    else
    {
      uint64_t v17 = **(void **)(result + 16);
      expert_log(result, 2uLL, (uint64_t)"falling back to base expert for property: %s", (uint64_t)a4, a5, a6, a7, a8, a3 + 28);
      return expert_query_property_uint32(v17, a2, a3, a4);
    }
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t _boot_expert_query_property_uint64(uint64_t result, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 24);
  unint64_t v9 = v8 + 8;
  unint64_t v10 = v8 + 272;
  uint64_t v11 = (void **)(v8 + 8 + 8 * *(void *)(a3 + 16));
  if ((unint64_t)v11 < v10 && (unint64_t)v11 >= v9)
  {
    char v14 = *v11;
    if (v14)
    {
      *a4 = *v14;
      return 0;
    }
    else
    {
      uint64_t v17 = **(void **)(result + 16);
      expert_log(result, 2uLL, (uint64_t)"falling back to base expert for property: %s", (uint64_t)a4, a5, a6, a7, a8, a3 + 28);
      return expert_query_property_uint64(v17, a2, a3, a4);
    }
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t _boot_expert_query_property_digest(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 24);
  unint64_t v9 = v8 + 8;
  unint64_t v10 = v8 + 272;
  uint64_t v11 = (unint64_t *)(v8 + 8 + 8 * *(void *)(a3 + 16));
  if ((unint64_t)v11 >= v10 || (unint64_t)v11 < v9)
  {
LABEL_12:
    __break(0x5519u);
    return result;
  }
  unint64_t v15 = *v11;
  if (*v11)
  {
    if (v15 < v15 + 80)
    {
      digest_copy(a4, v15, a3, a4, a5, a6, a7, a8);
      return 0;
    }
    goto LABEL_12;
  }
  uint64_t v17 = **(void **)(result + 16);
  expert_log(result, 2uLL, (uint64_t)"falling back to base expert for property: %s", a4, a5, a6, a7, a8, a3 + 28);

  return expert_query_property_digest(v17, a2, a3, a4);
}

uint64_t _boot_expert_query_property_version(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 24);
  unint64_t v9 = v8 + 8;
  unint64_t v10 = v8 + 272;
  uint64_t v11 = (long long **)(v8 + 8 + 8 * *(void *)(a3 + 16));
  if ((unint64_t)v11 >= v10 || (unint64_t)v11 < v9)
  {
LABEL_12:
    __break(0x5519u);
    return result;
  }
  unint64_t v15 = *v11;
  if (*v11)
  {
    if (v15 < (long long *)((char *)v15 + 104))
    {
      version_copy(a4, v15);
      return 0;
    }
    goto LABEL_12;
  }
  uint64_t v17 = **(void **)(result + 16);
  expert_log(result, 2uLL, (uint64_t)"falling back to base expert for property: %s", a4, a5, a6, a7, a8, a3 + 28);

  return expert_query_property_version(v17, a2, a3, a4);
}

uint64_t _boot_expert_boot_once()
{
  return 0;
}

uint64_t _boot_expert_read_random(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return expert_read_random(**(void **)(result + 16), a2, a3);
  }
  __break(0x5519u);
  return result;
}

uint64_t _boot_expert_syscall(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return expert_syscall(**(void **)(a1 + 16), a2, a3, a4, a5, a6);
}

unint64_t _boot_expert_find_entitlement(uint64_t a1, _DWORD *a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (uint64_t)(a2 + 1);
  chip_get_name(a4);
  expert_log(a1, 2uLL, (uint64_t)"finding entitlement for chip: entitlement = %s, uint64_t chip = %s", v11, v12, v13, v14, v15, v10);
  if (a3)
  {
    long long v23 = "not a manifest property";
LABEL_11:
    expert_log(a1, 2uLL, (uint64_t)v23, v18, v19, v20, v21, v22, v27);
    return 0;
  }
  unint64_t result = property_find_entitlement(a2, v16, v17, v18, v19, v20, v21, v22);
  if (!result || (unint64_t v25 = result, *(void *)(result + 16) == 33))
  {
    long long v23 = "not an expert property";
    goto LABEL_11;
  }
  uint64_t v26 = *(void *)(result + 40);
  if (v26 != a5)
  {
    expert_log(a1, 2uLL, (uint64_t)"unexpected type: actual = %s, expected = %s", v18, v19, v20, v21, v22, *(void *)(v26 + 8));
    return 0;
  }
  if (result < result + 104)
  {
    if (!chip_check_entitlement(a4, result))
    {
      expert_log(a1, 2uLL, (uint64_t)"entitlement present for chip", v18, v19, v20, v21, v22, v27);
      return v25;
    }
    long long v23 = "entitlement not present in chip";
    goto LABEL_11;
  }
  __break(0x5519u);
  return result;
}

uint64_t odometer_compute_nonce_hash(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t chip = a2;
  uint64_t v39 = *MEMORY[0x263EF8340];
  memset(v38, 0, sizeof(v38));
  if (!a2) {
    uint64_t chip = (void *)expert_query_chip(a1, 0);
  }
  if (!chip[25] || (uint64_t v7 = chip[21]) != 0) {
    uint64_t v7 = 1;
  }
  if (chip[22]) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v7;
  }
  uint64_t digest_info = expert_get_digest_info(a1, (uint64_t)chip, v8);
  MEMORY[0x270FA5388](digest_info, v10, (*(void *)(digest_info + 8) + *(void *)(digest_info + 16) + 19) & 0xFFFFFFFFFFFFFFF8, v11, v12, v13, v14, v15);
  long long v24 = (char *)v38 - v23;
  if (v25 >= 8) {
    memset((char *)v38 - v23, 170, v17);
  }
  if (*(void *)digest_info >= 0x41uLL) {
    __panic_npx("panic: buffer not large enough for digest: actual = %lu, expected >= %lu", v16, v17, v18, v19, v20, v21, v22, 64);
  }
  uint64_t name = chip_get_name((uint64_t)chip);
  expert_log(a1, 2uLL, (uint64_t)"computing nonce digest: uint64_t chip = %s, digest length = %lu", v27, v28, v29, v30, v31, name);
  ccdigest_init();
  ccdigest_update();
  (*(void (**)(uint64_t, char *, _OWORD *))(digest_info + 56))(digest_info, v24, v38);
  if (*(void *)digest_info > 0x40uLL) {
    __break(0x5519u);
  }
  return digest_init(a4, v38, *(void *)digest_info, v32, v33, v34, v35, v36);
}

uint64_t odometer_derive_nonce_hash(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v23[3] = *MEMORY[0x263EF8340];
  memset(v23, 0, 24);
  uint64_t v8 = expert_entangle_nonce(a1, (uint64_t)a2, a3, a4, (uint64_t)v23);
  uint64_t v14 = v8;
  if (v8)
  {
    expert_log(a1, 0, (uint64_t)"failed to entangle nonce: %d", v9, v10, v11, v12, v13, v8);
    if (v14 >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v15, v16, v17, v18, v19, v20, v21, v14);
    }
  }
  else
  {
    odometer_compute_nonce_hash(a1, a2, (uint64_t)v23, a5);
  }
  return v14;
}

unint64_t odometer_check_fuse(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a2 + 8);
  if (v8 < 0) {
    __panic_npx("panic: invalid offset: %lld", a2, a3, a4, a5, a6, a7, a8, *(void *)(a2 + 8));
  }
  uint64_t v9 = (unsigned __int8 *)(result + v8);
  if ((unint64_t)v9 < result + 976 && (unint64_t)v9 >= result) {
    return *v9;
  }
  __break(0x5519u);
  return result;
}

uint64_t odometer_query_chip_boot(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t chip_boot = expert_query_chip_boot(*(void *)a1, v2);
  if (!chip_boot)
  {
    uint64_t v12 = "odometer[%s]: expert boots chip";
LABEL_6:
    uint64_t v13 = *(void *)a1;
    uint64_t name = chip_get_name(*(void *)(a1 + 16));
    expert_log(v13, 1uLL, (uint64_t)v12, v15, v16, v17, v18, v19, name);
    return 0;
  }
  uint64_t v4 = chip_boot;
  if (chip_boot == 45)
  {
    uint64_t v5 = *(void *)a1;
    uint64_t v6 = chip_get_name(*(void *)(a1 + 16));
    expert_log(v5, 1uLL, (uint64_t)"odometer[%s]: expert does not boot chip", v7, v8, v9, v10, v11, v6);
    if (*(_WORD *)(a1 + 56))
    {
      uint64_t v12 = "odometer[%s]: nonce supplied; simulating first-stage boot";
    }
    else
    {
      if (!*(_WORD *)(a1 + 232)) {
        return 45;
      }
      uint64_t v12 = "odometer[%s]: nonce hash supplied; simulating first-stage boot";
    }
    goto LABEL_6;
  }
  uint64_t v20 = *(void *)a1;
  uint64_t v21 = chip_get_name(*(void *)(a1 + 16));
  chip_get_name(v2);
  expert_log(v20, 0, (uint64_t)"odometer[%s]: failed to query chip boot: %s: %d", v22, v23, v24, v25, v26, v21);
  if (v4 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v27, v28, v29, v30, v31, v32, v33, v4);
  }
  return v4;
}

uint64_t odometer_query_live_nonce(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_WORD *)(a1 + 56))
  {
    nonce_init_copy(a4, (void *)(a1 + 32), a3, (uint64_t)a4, a5, a6, a7, a8);
    return 0;
  }
  else
  {
    uint64_t v10 = *(void *)a1;
    if (a3 == -1) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = *(void *)(a1 + 16);
    }
    return expert_query_nonce(v10, v11, a3, (uint64_t)a4);
  }
}

uint64_t odometer_query_restore_info_nonce(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = a1[2];
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 + 96) + 24);
  *(void *)int v58 = 0;
  size_t __n = 0;
  uint64_t v8 = *a1;
  uint64_t name = chip_get_name(v6);
  expert_log(v8, 1uLL, (uint64_t)"odometer[%s]: querying restore info for boot nonce: %s", v10, v11, v12, v13, v14, name);
  Img4DecodeGetRestoreInfoData(a2, v7, v58, &__n);
  if (v15 == 1)
  {
    uint64_t v30 = *a1;
    uint64_t v31 = chip_get_name(a1[2]);
    expert_log(v30, 0, (uint64_t)"odometer[%s]: restore info has no boot nonce", v32, v33, v34, v35, v36, v31);
    return 2;
  }
  else
  {
    unsigned int v21 = v15;
    if (v15)
    {
      uint64_t v37 = *a1;
      uint64_t v38 = chip_get_name(a1[2]);
      expert_log(v37, 0, (uint64_t)"odometer[%s]: failed to query restore info for boot nonce: %d", v39, v40, v41, v42, v43, v38);
      uint64_t result = posixdr(v21);
      if (result >= 0x6A) {
        __panic_npx("panic: error not set to valid posix code: %d", v44, v45, v46, v47, v48, v49, v50, result);
      }
    }
    else if (__n < 0x11)
    {
      nonce_init(a3, *(const void **)v58, __n, v16, v17, v18, v19, v20);
      uint64_t v51 = *a1;
      uint64_t v52 = chip_get_name(a1[2]);
      expert_log(v51, 1uLL, (uint64_t)"odometer[%s]: fetched boot nonce from restore info", v53, v54, v55, v56, v57, v52);
      return 0;
    }
    else
    {
      uint64_t v22 = *a1;
      uint64_t v23 = chip_get_name(a1[2]);
      expert_log(v22, 1uLL, (uint64_t)"odometer[%s]: restore info nonce too large: actual = %lu, expected <= %lu", v24, v25, v26, v27, v28, v23);
      return 84;
    }
  }
  return result;
}

uint64_t odometer_enforce_property(uint64_t *a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v96[13] = *MEMORY[0x263EF8340];
  uint64_t v8 = *(unsigned int *)(a2 + 24);
  uint64_t v9 = *a1;
  unint64_t v10 = a1[2];
  *(_OWORD *)uint64_t v96 = xmmword_263C0DCA0;
  memset(&v96[2], 170, 88);
  switch(**(void **)(a3 + 40))
  {
    case 0:
      uint64_t property_BOOL = expert_query_property_BOOL(v9, v10, a3, (unsigned __int8 *)v96);
      if (property_BOOL) {
        goto LABEL_18;
      }
      if (a4 && a4 + 1 < a4) {
        goto LABEL_44;
      }
      if (property_constrain_BOOL(a3, v9, a4, (unsigned __int8 *)v96, a5, a6, a7, a8)) {
        goto LABEL_6;
      }
      return 0;
    case 1:
      uint64_t property_BOOL = expert_query_property_uint32(v9, v10, a3, v96);
      if (property_BOOL) {
        goto LABEL_18;
      }
      if (a4 && a4 + 4 < a4) {
        goto LABEL_44;
      }
      if (!property_constrain_uint32(a3, v9, (unsigned int *)a4, (unsigned int *)v96, a5, a6, a7, a8)) {
        return 0;
      }
      goto LABEL_6;
    case 2:
      uint64_t property_BOOL = expert_query_property_uint64(v9, v10, a3, v96);
      if (property_BOOL) {
        goto LABEL_18;
      }
      if (a4 && a4 + 8 < a4) {
        goto LABEL_44;
      }
      if (!property_constrain_uint64(a3, v9, (unint64_t *)a4, v96, a5, a6, a7, a8)) {
        return 0;
      }
      goto LABEL_6;
    case 3:
      uint64_t property_BOOL = expert_query_property_digest(v9, v10, a3, (uint64_t)v96);
      if (property_BOOL)
      {
LABEL_18:
        uint64_t v29 = property_BOOL;
        uint64_t v30 = *a1;
        uint64_t name = chip_get_name(a1[2]);
        expert_log(v30, 0, (uint64_t)"odometer[%s:%s]: failed to query expert: p = %s: %d", v32, v33, v34, v35, v36, name);
        uint64_t v8 = v29;
        goto LABEL_19;
      }
      if (a4 && a4 + 80 < a4) {
        goto LABEL_44;
      }
      if (!property_constrain_digest(a3, v9, (unint64_t)a4, (unint64_t)v96, a5, a6, a7, a8)) {
        return 0;
      }
      goto LABEL_6;
    case 4:
      if (odometer_check_fuse((unint64_t)a1, (uint64_t)&_odometer_cylinder_mixn_match, a3, (uint64_t)a4, a5, a6, a7, a8))
      {
        uint64_t v44 = *a1;
        uint64_t v45 = chip_get_name(a1[2]);
        int v46 = 1;
        expert_log(v44, 1uLL, (uint64_t)"odometer[%s:%s]: allowing cross-group policy: mix-n-match", v47, v48, v49, v50, v51, v45);
      }
      else
      {
        int v46 = 0;
      }
      if ((odometer_check_fuse((unint64_t)a1, (uint64_t)&_odometer_cylinder_production_status, v38, v39, v40, v41, v42, v43) & 1) == 0)
      {
        uint64_t v58 = *a1;
        uint64_t v59 = chip_get_name(a1[2]);
        expert_log(v58, 1uLL, (uint64_t)"odometer[%s:%s]: allowing cross-group policy: production status", v60, v61, v62, v63, v64, v59);
        ++v46;
      }
      if (odometer_check_fuse((unint64_t)a1, (uint64_t)&_odometer_cylinder_engineering_use, v52, v53, v54, v55, v56, v57))
      {
        uint64_t v65 = *a1;
        uint64_t v66 = chip_get_name(a1[2]);
        expert_log(v65, 1uLL, (uint64_t)"odometer[%s:%s]: allowing cross-group policy: engineering use", v67, v68, v69, v70, v71, v66);
        ++v46;
      }
      if (!*(void *)(v10 + 24))
      {
        uint64_t v72 = *a1;
        uint64_t v73 = chip_get_name(a1[2]);
        int v46 = 1;
        expert_log(v72, 1uLL, (uint64_t)"odometer[%s:%s]: allowing cross-group policy: full security", v74, v75, v76, v77, v78, v73);
      }
      if (v10 >= v10 + 264) {
        goto LABEL_44;
      }
      uint64_t property_version = expert_query_property_version(v9, v10, a3, (uint64_t)v96);
      if (!property_version)
      {
        uint64_t v88 = _odometer_enforce_version;
        if (v46)
        {
          uint64_t v89 = *a1;
          uint64_t v90 = chip_get_name(a1[2]);
          expert_log(v89, 1uLL, (uint64_t)"odometer[%s:%s]: allowing cross-group version comparison", v91, v92, v93, v94, v95, v90);
          uint64_t v88 = _odometer_enforce_version_xgroup;
        }
        if (a4 && a4 + 104 < a4)
        {
LABEL_44:
          __break(0x5519u);
LABEL_45:
          __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, (uint64_t)a4, a5, a6, a7, a8, (char)"p->p_type->pt_switchable");
        }
        if (!((unsigned int (*)(uint64_t *, uint64_t, unsigned __int8 *, void *))v88)(a1, a3, a4, v96)) {
          return 0;
        }
LABEL_6:
        uint64_t v15 = *a1;
        uint64_t v16 = chip_get_name(a1[2]);
        expert_log(v15, 0, (uint64_t)"odometer[%s:%s]: constraint violation: %s: %d", v17, v18, v19, v20, v21, v16);
        goto LABEL_19;
      }
      uint64_t v80 = property_version;
      uint64_t v81 = *a1;
      uint64_t v82 = chip_get_name(a1[2]);
      expert_log(v81, 0, (uint64_t)"odometer[%s:%s]: failed to query expert: p = %s: %d", v83, v84, v85, v86, v87, v82);
      uint64_t v8 = v80;
LABEL_19:
      if (v8 >= 0x6A) {
        __panic_npx("panic: error not set to valid posix code: %d", v22, v23, v24, v25, v26, v27, v28, v8);
      }
      return v8;
    default:
      goto LABEL_45;
  }
}

uint64_t _odometer_enforce_version(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return property_constrain_version(a2, *a1, a3, a4, a5, a6, a7, a8);
}

uint64_t _odometer_enforce_version_xgroup(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = property_constrain_version(a2, *a1, a3, a4, a5, a6, a7, a8);
  if (v11)
  {
    if (*(_DWORD *)(a3 + 100) == *(_DWORD *)(a4 + 100))
    {
      uint64_t v12 = *a1;
      uint64_t name = chip_get_name(a1[2]);
      expert_log(v12, 1uLL, (uint64_t)"odometer[%s]: versions directly comparable; allowing enforcement decision to stand",
        v14,
        v15,
        v16,
        v17,
        v18,
        name);
    }
    else
    {
      return 0;
    }
  }
  return v11;
}

double odometer_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  *(void *)(a1 + 16) = a4;
  *(_DWORD *)(a1 + 24) = -1;
  double result = 0.0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(void *)(a1 + 144) = 0;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(void *)(a1 + 232) = 0;
  *(void *)(a1 + 320) = 0;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(unsigned char *)(a1 + 440) = 0;
  *(unsigned char *)(a1 + 442) = 0;
  *(_OWORD *)(a1 + 448) = 0u;
  *(_OWORD *)(a1 + 464) = 0u;
  *(_OWORD *)(a1 + 480) = 0u;
  *(_OWORD *)(a1 + 496) = 0u;
  *(_OWORD *)(a1 + 512) = 0u;
  *(void *)(a1 + 528) = 0;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  *(_OWORD *)(a1 + 424) = 0u;
  *(_OWORD *)(a1 + 616) = 0u;
  *(_OWORD *)(a1 + 632) = 0u;
  *(_OWORD *)(a1 + 584) = 0u;
  *(_OWORD *)(a1 + 600) = 0u;
  *(_OWORD *)(a1 + 552) = 0u;
  *(_OWORD *)(a1 + 568) = 0u;
  *(_OWORD *)(a1 + 536) = 0u;
  *(_OWORD *)(a1 + 840) = 0u;
  *(_OWORD *)(a1 + 856) = 0u;
  *(_OWORD *)(a1 + 808) = 0u;
  *(_OWORD *)(a1 + 824) = 0u;
  *(_OWORD *)(a1 + 776) = 0u;
  *(_OWORD *)(a1 + 792) = 0u;
  *(_OWORD *)(a1 + 760) = 0u;
  *(_DWORD *)(a1 + 872) = -1;
  *(_WORD *)(a1 + 972) = 0;
  *(_DWORD *)(a1 + 968) = 0;
  return result;
}

uint64_t odometer_prepare(uint64_t *a1, uint64_t a2, uint64_t constraint, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = 0;
  unint64_t v10 = a1 + 122;
  while (1)
  {
    uint64_t v11 = (uint64_t *)_cylinders[v9];
    uint64_t v12 = v11[1];
    if (v12 < 0) {
      goto LABEL_20;
    }
    uint64_t v13 = *v11;
    uint64_t v14 = (unsigned __int8 *)a1 + v12;
    uint64_t constraint = chip_get_constraint(a1[2], *v11, 0);
    a2 = a1[2];
    if (v14)
    {
      if (v14 >= (unsigned __int8 *)v10 || v14 < (unsigned __int8 *)a1)
      {
LABEL_19:
        __break(0x5519u);
LABEL_20:
        __panic_npx("panic: invalid offset: %lld", a2, constraint, a4, a5, a6, a7, a8, v12);
      }
    }
    uint64_t property_BOOL = expert_query_property_BOOL(*a1, a2, constraint, v14);
    if (property_BOOL) {
      break;
    }
    if (v14 >= (unsigned __int8 *)v10 || v14 < (unsigned __int8 *)a1) {
      goto LABEL_19;
    }
    expert_log(*a1, 2uLL, (uint64_t)"queried cylinder: p = %s, v = 0x%x", a4, a5, a6, a7, a8, v13 + 28);
    if (++v9 == 6) {
      return property_BOOL;
    }
  }
  uint64_t v18 = *a1;
  uint64_t name = chip_get_name(a1[2]);
  expert_log(v18, 0, (uint64_t)"odometer[%s]: failed to query odometer cylinder: %s: %d", v20, v21, v22, v23, v24, name);
  if (property_BOOL >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v25, v26, v27, v28, v29, v30, v31, property_BOOL);
  }
  return property_BOOL;
}

double odometer_prepare_nonce(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v10 = 0uLL;
  uint64_t v11 = 0;
  nonce_init_copy(&v10, a2, a3, a4, a5, a6, a7, a8);
  double result = *(double *)&v10;
  *(_OWORD *)(a1 + 32) = v10;
  *(void *)(a1 + 48) = v11;
  *(_WORD *)(a1 + 56) = 1;
  return result;
}

__n128 odometer_prepare_nonce_hash(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 152) = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 200) = v4;
  *(_OWORD *)(a1 + 184) = v3;
  *(__n128 *)(a1 + 168) = result;
  *(_WORD *)(a1 + 232) = 1;
  return result;
}

uint64_t odometer_prepare_mix_n_match_god_mode(uint64_t result)
{
  *(unsigned char *)(result + 441) = 1;
  return result;
}

uint64_t odometer_prepare_sideload_mixn_match(uint64_t result)
{
  *(unsigned char *)(result + 442) = 1;
  return result;
}

__n128 odometer_prepare_notarized_manifest_hash(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 448) = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 496) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 512) = v4;
  *(__n128 *)(a1 + 464) = result;
  *(_OWORD *)(a1 + 480) = v3;
  *(_WORD *)(a1 + 528) = 1;
  return result;
}

uint64_t odometer_prepare_mixn_match(uint64_t result, char a2)
{
  *(unsigned char *)(result + 968) = a2;
  return result;
}

uint64_t odometer_update(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = result;
  for (uint64_t i = 0; i != 80; i += 8)
  {
    uint64_t v12 = *(uint64_t *)((char *)&_property_consumers + i);
    uint64_t v13 = *(void *)v12;
    uint64_t v14 = *(void *)(v12 + 8);
    if (*(void *)v12)
    {
      if ((v14 & 0x8000000000000000) == 0) {
        __panic_npx("panic: illegal odometer consumption configuration", v13, a3, a4, a5, a6, a7, a8, v18);
      }
    }
    else if (v14 < 0)
    {
      uint64_t v13 = 0;
    }
    else
    {
      unint64_t v15 = *(void *)(v10 + 16);
      uint64_t v16 = (uint64_t *)(v15 + v14);
      if ((unint64_t)v16 >= v15 + 264 || (unint64_t)v16 < v15)
      {
        __break(0x5519u);
        return result;
      }
      uint64_t v13 = *v16;
    }
    __n128 result = property_equal(a2, v13);
    if ((result & 1) != 0 || !*(void *)v12 && (*(void *)(v12 + 8) & 0x8000000000000000) != 0)
    {
      __n128 result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 16))(v12, v10, a2, a3);
      if (!result) {
        return result;
      }
    }
  }
  return 1;
}

uint64_t odometer_enforce(unint64_t a1)
{
  int chip_boot = odometer_query_chip_boot(a1);
  uint64_t v3 = *(void *)a1;
  uint64_t name = chip_get_name(*(void *)(a1 + 16));
  if (chip_boot)
  {
    expert_log(v3, 1uLL, (uint64_t)"odometer[%s]: expert does not boot chip", v5, v6, v7, v8, v9, name);
  }
  else
  {
    expert_log(v3, 1uLL, (uint64_t)"odometer[%s]: enforcing anti-replay", v5, v6, v7, v8, v9, name);
    __odometer_select_policy(a1, (unint64_t)_anti_replay_policies, 7, v38, v39, v40, v41, v42);
    uint64_t v50 = odometer_policy_enforce(v43, a1, v44, v45, v46, v47, v48, v49);
    if (v50)
    {
      uint64_t v23 = v50;
      uint64_t v51 = *(void *)a1;
      uint64_t v52 = chip_get_name(*(void *)(a1 + 16));
      expert_log(v51, 0, (uint64_t)"odometer[%s:%s]: anti-replay violation: %d", v53, v54, v55, v56, v57, v52);
      goto LABEL_8;
    }
  }
  __odometer_select_policy(a1, (unint64_t)_chain_integrity_policies, 5, v10, v11, v12, v13, v14);
  uint64_t v22 = odometer_policy_enforce(v15, a1, v16, v17, v18, v19, v20, v21);
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)a1;
    uint64_t v25 = chip_get_name(*(void *)(a1 + 16));
    expert_log(v24, 0, (uint64_t)"odometer[%s:%s]: boot chain integrity violation: %d", v26, v27, v28, v29, v30, v25);
  }
  else
  {
    if (odometer_policy_enforceable((uint64_t)&_odometer_policy_chain_manifest)
      || (uint64_t v72 = odometer_policy_enforce((uint64_t)&_odometer_policy_chain_manifest, a1, v58, v59, v60, v61, v62, v63),
          !v72))
    {
      uint64_t v64 = *(void *)a1;
      uint64_t v65 = chip_get_name(*(void *)(a1 + 16));
      expert_log(v64, 1uLL, (uint64_t)"odometer[%s]: manifest is live and boot chain is intact", v66, v67, v68, v69, v70, v65);
      return 0;
    }
    uint64_t v23 = v72;
    uint64_t v73 = *(void *)a1;
    uint64_t v74 = chip_get_name(*(void *)(a1 + 16));
    expert_log(v73, 0, (uint64_t)"odometer[%s:%s]: boot chain integrity violation: %d", v75, v76, v77, v78, v79, v74);
  }
LABEL_8:
  if (v23 == 31 && *(unsigned char *)(a1 + 441)) {
    return 70;
  }
  if (v23 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v31, v32, v33, v34, v35, v36, v37, v23);
  }
  return v23;
}

void __odometer_select_policy(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3) {
    goto LABEL_7;
  }
  uint64_t v8 = a3;
  unint64_t v10 = a2 + 8 * a3;
  uint64_t v11 = (uint64_t *)a2;
  while (1)
  {
    if ((unint64_t)v11 >= v10 || (unint64_t)v11 < a2)
    {
      __break(0x5519u);
      return;
    }
    uint64_t v12 = *v11;
    if (!odometer_policy_enforceable(*v11)) {
      break;
    }
    ++v11;
    if (!--v8) {
      goto LABEL_7;
    }
  }
  if (!v12) {
LABEL_7:
  }
    __panic_npx("panic: no anti-replay policy selected", a2, a3, a4, a5, a6, a7, a8, v13);
}

__n128 _odometer_consume_nonce_hash(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(unsigned int *)(a3 + 24);
  memset(__n, 0, sizeof(__n));
  *(void *)uint64_t v20 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  __n128 v22 = 0u;
  long long v23 = 0u;
  if (Img4DecodeGetPropertyData(a4, v5, v20, __n))
  {
    uint64_t v11 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    expert_log(v11, 0, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyData: %d", v13, v14, v15, v16, v17, name);
  }
  else
  {
    digest_init((uint64_t)&__n[1], *(const void **)v20, __n[0], v6, v7, v8, v9, v10);
    long long v19 = v24;
    *(_OWORD *)(a2 + 96) = v23;
    *(_OWORD *)(a2 + 112) = v19;
    *(_OWORD *)(a2 + 128) = v25;
    __n128 result = v22;
    *(_OWORD *)(a2 + 64) = *(_OWORD *)&__n[1];
    *(__n128 *)(a2 + 80) = result;
    *(_WORD *)(a2 + 144) = 1;
  }
  return result;
}

uint64_t _odometer_consume_nonce_domain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(unsigned int *)(a3 + 24);
  int v14 = 0;
  uint64_t result = Img4DecodeGetPropertyInteger(a4, v5, &v14);
  if (result)
  {
    uint64_t v7 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    expert_log(v7, 0, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyInteger: %d", v9, v10, v11, v12, v13, name);
    return 0xFFFFFFFFLL;
  }
  else
  {
    *(_DWORD *)(a2 + 24) = v14;
  }
  return result;
}

uint64_t _odometer_consume_ephemeral_switch(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = _odometer_decode_property((uint64_t *)a2, a3, a4, (BOOL *)(a2 + 760), a5, a6, a7, a8);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  *(_WORD *)(a2 + 864) = 1;
  return result;
}

uint64_t _odometer_decode_property(uint64_t *a1, uint64_t a2, uint64_t *a3, BOOL *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(unsigned int *)(a2 + 24);
  LODWORD(__n) = 0;
  *(void *)uint64_t v49 = 0;
  switch(**(void **)(a2 + 40))
  {
    case 0:
      uint64_t PropertyBoolean = Img4DecodeGetPropertyBoolean((uint64_t)a3, v9, a4);
      if (PropertyBoolean)
      {
        uint64_t v13 = *a1;
        uint64_t name = chip_get_name(a1[2]);
        expert_log(v13, 0, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyBoolean: %d", v15, v16, v17, v18, v19, name);
      }
      return PropertyBoolean;
    case 1:
      uint64_t PropertyBoolean = Img4DecodeGetPropertyInteger((uint64_t)a3, v9, a4);
      if (PropertyBoolean)
      {
        uint64_t v21 = *a1;
        uint64_t v47 = chip_get_name(a1[2]);
        expert_log(v21, 0, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyInteger: %d", v22, v23, v24, v25, v26, v47);
      }
      return PropertyBoolean;
    case 2:
      uint64_t PropertyBoolean = Img4DecodeGetPropertyInteger64((uint64_t)a3, v9, (unint64_t *)a4);
      if (PropertyBoolean)
      {
        uint64_t v27 = *a1;
        uint64_t v48 = chip_get_name(a1[2]);
        expert_log(v27, 0, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyInteger64: %d", v28, v29, v30, v31, v32, v48);
      }
      return PropertyBoolean;
    case 3:
      uint64_t PropertyData = Img4DecodeGetPropertyData(a3, v9, v49, &__n);
      if (PropertyData) {
        goto LABEL_14;
      }
      if (a4 && a4 + 80 < a4) {
        goto LABEL_21;
      }
      digest_init((uint64_t)a4, *(const void **)v49, __n, v33, v34, v35, v36, v37);
      return 0;
    case 4:
      uint64_t PropertyData = Img4DecodeGetPropertyData(a3, v9, v49, &__n);
      if (PropertyData)
      {
LABEL_14:
        uint64_t v38 = PropertyData;
        uint64_t v39 = *a1;
        uint64_t v40 = chip_get_name(a1[2]);
        expert_log(v39, 0, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyData: %d", v41, v42, v43, v44, v45, v40);
        return v38;
      }
      else
      {
        if (a4 && a4 + 104 < a4)
        {
LABEL_21:
          __break(0x5519u);
          JUMPOUT(0x263BF88A4);
        }
        version_init((uint64_t)a4, *(char **)v49, __n);
        return 0;
      }
    default:
      __panic_npx("panic: unreachable case: %s = 0x%llx", v9, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)"p->p_type->pt_switchable");
  }
}

uint64_t _odometer_consume_ephemeral_nonce_domain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(unsigned int *)(a3 + 24);
  int v14 = 0;
  uint64_t result = Img4DecodeGetPropertyInteger(a4, v5, &v14);
  if (result)
  {
    uint64_t v7 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    expert_log(v7, 0, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyInteger: %d", v9, v10, v11, v12, v13, name);
    return 0xFFFFFFFFLL;
  }
  else
  {
    *(_DWORD *)(a2 + 872) = v14;
  }
  return result;
}

__n128 _odometer_consume_ephemeral_nonce_hash(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(unsigned int *)(a3 + 24);
  memset(__n, 0, sizeof(__n));
  *(void *)uint64_t v20 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  __n128 v22 = 0u;
  long long v23 = 0u;
  if (Img4DecodeGetPropertyData(a4, v5, v20, __n))
  {
    uint64_t v11 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    expert_log(v11, 0, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyData: %d", v13, v14, v15, v16, v17, name);
  }
  else
  {
    digest_init((uint64_t)&__n[1], *(const void **)v20, __n[0], v6, v7, v8, v9, v10);
    long long v19 = v24;
    *(_OWORD *)(a2 + 912) = v23;
    *(_OWORD *)(a2 + 928) = v19;
    *(_OWORD *)(a2 + 944) = v25;
    __n128 result = v22;
    *(_OWORD *)(a2 + 880) = *(_OWORD *)&__n[1];
    *(__n128 *)(a2 + 896) = result;
    *(_WORD *)(a2 + 960) = 1;
  }
  return result;
}

uint64_t _odometer_consume_chain_hash(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = *(unsigned int *)(a3 + 24);
  LODWORD(__n) = 0;
  *(void *)long long v19 = 0;
  if (Img4DecodeGetPropertyData(a4, v5, v19, &__n))
  {
    uint64_t v11 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    expert_log(v11, 0, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyData: %d", v13, v14, v15, v16, v17, name);
    return 0xFFFFFFFFLL;
  }
  else
  {
    digest_init(a2 + 240, *(const void **)v19, __n, v6, v7, v8, v9, v10);
    uint64_t result = 0;
    *(_WORD *)(a2 + 320) = 1;
  }
  return result;
}

uint64_t _odometer_consume_mixn_match(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(unsigned int *)(a3 + 24);
  BOOL v14 = 0;
  uint64_t result = Img4DecodeGetPropertyBoolean(a4, v5, &v14);
  if (result)
  {
    uint64_t v7 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    expert_log(v7, 0, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyBoolean: %d", v9, v10, v11, v12, v13, name);
    return 0xFFFFFFFFLL;
  }
  else
  {
    *(unsigned char *)(a2 + 440) = v14;
  }
  return result;
}

uint64_t _odometer_consume_pivot(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = _odometer_decode_property((uint64_t *)a2, a3, a4, (BOOL *)(a2 + 328), a5, a6, a7, a8);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  *(_WORD *)(a2 + 432) = 1;
  return result;
}

uint64_t _odometer_consume_static_lifetime(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = 0;
  uint64_t v8 = a2[2] + 232;
  for (char i = 1; ; char i = 0)
  {
    char v10 = i;
    if (property_equal(a3, *(void *)(v8 + 8 * v7))) {
      break;
    }
    uint64_t v7 = 1;
    if ((v10 & 1) == 0) {
      return 0xFFFFFFFFLL;
    }
  }
  uint64_t result = _odometer_decode_property(a2, a3, a4, (BOOL *)&a2[14 * v7 + 67], v11, v12, v13, v14);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  LOWORD(a2[14 * v7 + 80]) = 1;
  return result;
}

uint64_t DEREncoderAddImage4Tag(uint64_t *a1, char *__s)
{
  if (strlen(__s) != 4) {
    __panic_npx("panic: invalid Image4 tag: %s", v4, v5, v6, v7, v8, v9, v10, (char)__s);
  }

  return DEREncoderAddData(a1, 0, 0x16u, __s, 4u, 0);
}

uint64_t DEREncoderAddUInt(uint64_t *a1, unint64_t a2)
{
  return DEREncoderAddUInt64(a1, 0, 2u, a2);
}

uint64_t DEREncoderAddString(uint64_t *a1, char *__s)
{
  unsigned int v4 = strlen(__s);

  return DEREncoderAddData(a1, 0, 0x16u, __s, v4, 0);
}

uint64_t DEREncoderAddOctetString(uint64_t *a1, const void *a2, unsigned int a3)
{
  return DEREncoderAddDataNoCopy(a1, 0, 4u, a2, a3, 0);
}

uint64_t DEREncoderAddSequence(uint64_t *a1, const void *a2, unsigned int a3)
{
  return DEREncoderAddData(a1, 0, 0x10u, a2, a3, 1);
}

uint64_t DEREncoderAddContextual(uint64_t *a1, unsigned int a2, const void *a3, unsigned int a4)
{
  return DEREncoderAddData(a1, 2u, a2, a3, a4, 1);
}

uint64_t DEREncoderAddNull(uint64_t *a1)
{
  return DEREncoderAddData(a1, 0, 5u, 0, 0, 0);
}

uint64_t DEREncoderAddImage4Property(uint64_t *a1, char *__s, uint64_t *a3)
{
  BOOL v103 = 0;
  unint64_t v102 = 0;
  unsigned int v101 = 0;
  uint64_t v100 = 0;
  if (strlen(__s) != 4) {
LABEL_31:
  }
    __panic_npx("panic: four-character codes must be four characters long", v6, v7, v8, v9, v10, v11, v12, v99);
  if (__s + 5 < __s)
  {
LABEL_30:
    __break(0x5519u);
    goto LABEL_31;
  }
  unsigned int v13 = *(_DWORD *)__s;
  uint64_t v14 = (uint64_t *)DEREncoderCreate(0);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = DEREncoderAddImage4Tag(v14, __s);
    if (v16)
    {
      uint64_t v24 = v16;
      uint64_t v25 = log_expert(v16);
      expert_log(v25, 2uLL, (uint64_t)"DEREncoderAddImage4TagUInt32: %d", v26, v27, v28, v29, v30, v24);
LABEL_28:
      DEREncoderDestroy((void **)v15);
      return v24;
    }
    uint64_t v37 = bswap32(v13);
    switch(a3[2])
    {
      case 1:
        uint64_t PropertyBoolean = Img4DecodeGetPropertyBoolean((uint64_t)a3, v37, &v103);
        if (PropertyBoolean)
        {
          uint64_t v39 = PropertyBoolean;
          uint64_t v40 = log_expert(PropertyBoolean);
          expert_log(v40, 2uLL, (uint64_t)"Img4DecodeGetPropertyBoolean: %d", v41, v42, v43, v44, v45, v39);
          goto LABEL_16;
        }
        uint64_t v70 = DEREncoderAddBoolean(v15, v103);
        if (!v70) {
          goto LABEL_26;
        }
        uint64_t v55 = v70;
        uint64_t v71 = log_expert(v70);
        expert_log(v71, 2uLL, (uint64_t)"DEREncoderAddBoolean: %d", v72, v73, v74, v75, v76, v55);
        goto LABEL_25;
      case 2:
        uint64_t PropertyInteger64 = Img4DecodeGetPropertyInteger64((uint64_t)a3, v37, &v102);
        if (PropertyInteger64)
        {
          uint64_t v63 = PropertyInteger64;
          uint64_t v64 = log_expert(PropertyInteger64);
          expert_log(v64, 2uLL, (uint64_t)"Img4DecodeGetPropertyInteger64: %d", v65, v66, v67, v68, v69, v63);
          goto LABEL_16;
        }
        uint64_t v84 = DEREncoderAddUInt64(v15, 0, 2u, v102);
        if (!v84) {
          goto LABEL_26;
        }
        uint64_t v55 = v84;
        uint64_t v85 = log_expert(v84);
        expert_log(v85, 2uLL, (uint64_t)"DEREncoderAddUInt64: %d", v86, v87, v88, v89, v90, v55);
        goto LABEL_25;
      case 4:
        uint64_t PropertyData = Img4DecodeGetPropertyData(a3, v37, &v100, &v101);
        if (PropertyData)
        {
          uint64_t v47 = PropertyData;
          uint64_t v48 = log_expert(PropertyData);
          expert_log(v48, 2uLL, (uint64_t)"Img4DecodeGetPropertyData: %d", v49, v50, v51, v52, v53, v47);
LABEL_16:
          uint64_t v24 = 3;
          goto LABEL_28;
        }
        uint64_t v8 = (uint64_t)v100;
        uint64_t v9 = v101;
        if (!v100 || v101)
        {
          uint64_t v77 = DEREncoderAddDataNoCopy(v15, 0, 4u, v100, v101, 0);
          if (v77)
          {
            uint64_t v55 = v77;
            uint64_t v78 = log_expert(v77);
            expert_log(v78, 2uLL, (uint64_t)"DEREncoderAddOctetString: %d", v79, v80, v81, v82, v83, v55);
LABEL_25:
            uint64_t v24 = v55;
          }
          else
          {
LABEL_26:
            uint64_t v91 = DEREncoderAddPrivateFromEncoder((uint64_t **)v15, a1, v37);
            uint64_t v24 = v91;
            if (v91)
            {
              uint64_t v92 = log_expert(v91);
              expert_log(v92, 2uLL, (uint64_t)"DEREncoderAddPrivateFromEncoder: %d", v93, v94, v95, v96, v97, v24);
            }
          }
          goto LABEL_28;
        }
        break;
      case 5:
        uint64_t v54 = DEREncoderAddData(v15, 0, 5u, 0, 0, 0);
        if (!v54) {
          goto LABEL_26;
        }
        uint64_t v55 = v54;
        uint64_t v56 = log_expert(v54);
        expert_log(v56, 2uLL, (uint64_t)"DEREncoderAddNull: %d", v57, v58, v59, v60, v61, v55);
        goto LABEL_25;
      default:
        __panic_npx("panic: unreachable", v17, v18, v19, v20, v21, v22, v23, v99);
    }
    goto LABEL_30;
  }
  uint64_t v31 = log_expert(0);
  uint64_t v24 = 2;
  expert_log(v31, 2uLL, (uint64_t)"DEREncoderCreate: %d", v32, v33, v34, v35, v36, 2);
  return v24;
}

void DEREncoderDestroyAndZero(void ***a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    DEREncoderDestroy(v2);
    *a1 = 0;
  }
}

size_t DEREncoderEncodeImage4Dictionary(uint64_t *a1, char *__s, uint64_t **a3)
{
  size_t result = strlen(__s);
  if (result != 4) {
    __panic_npx("panic: four-character codes must be four characters long", v7, v8, v9, v10, v11, v12, v13, v18);
  }
  if (__s + 5 < __s)
  {
    __break(0x5519u);
  }
  else
  {
    unsigned int v14 = *(_DWORD *)__s;
    uint64_t v15 = (uint64_t *)DEREncoderCreate(0);
    if (!v15) {
      return 2;
    }
    uint64_t v16 = v15;
    uint64_t v17 = DEREncoderAddImage4Tag(v15, __s);
    if (!v17)
    {
      uint64_t v17 = DEREncoderAddSetFromEncoder(a3, v16);
      if (!v17) {
        uint64_t v17 = DEREncoderAddPrivateFromEncoder((uint64_t **)v16, a1, bswap32(v14));
      }
    }
    DEREncoderDestroy((void **)v16);
    return v17;
  }
  return result;
}

uint64_t DEREncoderCreateImage4Dictionary(char *a1, uint64_t **a2, uint64_t **a3)
{
  uint64_t v6 = (uint64_t *)DEREncoderCreate(0);
  if (!v6) {
    return 2;
  }
  uint64_t v7 = v6;
  size_t v8 = DEREncoderEncodeImage4Dictionary(v6, a1, a2);
  if (v8) {
    DEREncoderDestroy((void **)v7);
  }
  else {
    *a3 = v7;
  }
  return v8;
}

size_t cstring_init_with_string(uint64_t a1, char *__s)
{
  size_t result = strlen(__s);
  if (&__s[result + 1] < __s)
  {
    __break(0x5519u);
  }
  else
  {
    size_t v5 = strnlen(__s, result + 1);
    size_t v6 = v5;
    if (v5 >= 0x3F) {
      uint64_t v7 = 63;
    }
    else {
      uint64_t v7 = v5;
    }
    strlcpy((char *)a1, __s, v7 + 1);
    *(void *)(a1 + 64) = v7;
    *(void *)(a1 + 72) = v6;
    return a1;
  }
  return result;
}

uint64_t cstring_init_with_buff(uint64_t a1, char *__s1, size_t __n)
{
  size_t v5 = strnlen(__s1, __n);
  size_t v6 = v5;
  if (v5 >= 0x3F) {
    uint64_t v7 = 63;
  }
  else {
    uint64_t v7 = v5;
  }
  strlcpy((char *)a1, __s1, v7 + 1);
  *(void *)(a1 + 64) = v7;
  *(void *)(a1 + 72) = v6;
  return a1;
}

unint64_t _boot_static_enforceable(uint64_t a1, uint64_t *a2)
{
  unint64_t result = a2[2];
  if (!*(void *)(result + 232))
  {
    uint64_t v3 = 1;
    unsigned int v4 = "odometer[%s:%s]: chip has no properties for policy";
    goto LABEL_5;
  }
  if (!*(void *)(result + 160))
  {
    uint64_t v3 = 0;
    unsigned int v4 = "odometer[%s:%s]: policy is enforceable";
LABEL_5:
    uint64_t v5 = *a2;
    uint64_t name = chip_get_name(result);
    expert_log(v5, 1uLL, (uint64_t)v4, v7, v8, v9, v10, v11, name);
    return v3;
  }
  if (result < result + 264)
  {
    char v12 = chip_get_name(result);
    __panic_npx("panic: illegal chip definition: anti-replay and static lifetime policies defined: %s", v13, v14, v15, v16, v17, v18, v19, v12);
  }
  __break(0x5519u);
  return result;
}

uint64_t _boot_static_enforce(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = a2[2];
  if (odometer_check_fuse((unint64_t)a2, (uint64_t)&_odometer_cylinder_internal_use, a3, a4, a5, a6, a7, a8))
  {
    uint64_t v15 = "odometer[%s:%s]: internal use-only unit entitlement found";
LABEL_13:
    uint64_t v25 = *a2;
    uint64_t name = chip_get_name(a2[2]);
    expert_log(v25, 1uLL, (uint64_t)v15, v27, v28, v29, v30, v31, name);
    return 0;
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v17 = v10 + 232;
    char v18 = 1;
    uint64_t v15 = "odometer[%s:%s]: manifest is current";
    while (1)
    {
      uint64_t v19 = *(void *)(v17 + 8 * v16);
      char v20 = v18;
      uint64_t v21 = (uint64_t)&a2[14 * v16 + 67];
      BOOL v22 = !v19 || *(_WORD *)(v21 + 104) == 0;
      if (!v22 && v21 != 0)
      {
        uint64_t v24 = odometer_enforce_property(a2, a1, v19, (unsigned __int8 *)v21, v11, v12, v13, v14);
        if (v24) {
          break;
        }
      }
      char v18 = 0;
      uint64_t v16 = 1;
      if ((v20 & 1) == 0) {
        goto LABEL_13;
      }
    }
    uint64_t v32 = v24;
    uint64_t v34 = *a2;
    uint64_t v35 = chip_get_name(a2[2]);
    expert_log(v34, 0, (uint64_t)"odometer[%s:%s]: anti-replay violation: %d", v36, v37, v38, v39, v40, v35);
    if (v32 >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v41, v42, v43, v44, v45, v46, v47, v32);
    }
  }
  return v32;
}

uint64_t _boot_live_enforceable(uint64_t a1, uint64_t a2)
{
  if (odometer_policy_get_chip_property(a1, *(void *)(a2 + 16)))
  {
    int v3 = *(unsigned __int16 *)(a2 + 144);
    uint64_t v4 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    if (v3)
    {
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v6, v7, v8, v9, v10, name);
      return 0;
    }
    else
    {
      uint64_t v11 = 1;
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: manifest has no constraint for policy", v6, v7, v8, v9, v10, name);
    }
  }
  else
  {
    uint64_t v12 = *(void *)a2;
    uint64_t v13 = chip_get_name(*(void *)(a2 + 16));
    uint64_t v11 = 1;
    expert_log(v12, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v14, v15, v16, v17, v18, v13);
  }
  return v11;
}

uint64_t _boot_live_enforce(uint64_t a1, uint64_t a2)
{
  v91[3] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)a2;
  uint64_t chip_property = odometer_policy_get_chip_property(a1, *(void *)(a2 + 16));
  if (!*(_WORD *)(a2 + 144)) {
    __panic_npx("panic: optional not set", v6, v7, v8, v9, v10, v11, v12, v86);
  }
  uint64_t v13 = chip_property;
  uint64_t v14 = *(void **)(a2 + 16);
  uint64_t v15 = *(unsigned int *)(a2 + 24);
  memset(v91, 0, 24);
  memset(v90, 0, sizeof(v90));
  memset(v89, 0, sizeof(v89));
  size_t __n = 64;
  uint64_t live_nonce = odometer_query_live_nonce(a2, a1, v15, v91, v9, v10, v11, v12);
  if (live_nonce != 6)
  {
    uint64_t v17 = live_nonce;
    if (live_nonce)
    {
      uint64_t v61 = *(void *)a2;
      uint64_t name = chip_get_name(*(void *)(a2 + 16));
      expert_log(v61, 0, (uint64_t)"odometer[%s:%s]: failed to query nonce: %d", v63, v64, v65, v66, v67, name);
      goto LABEL_16;
    }
    uint64_t v18 = expert_entangle_nonce(v4, (uint64_t)v14, v15, (uint64_t)v91, (uint64_t)v90);
    if (v18)
    {
      uint64_t v17 = v18;
      uint64_t v19 = *(void *)a2;
      uint64_t v20 = chip_get_name(*(void *)(a2 + 16));
      expert_log(v19, 0, (uint64_t)"odometer[%s:%s]: failed to entangle nonce: %d", v21, v22, v23, v24, v25, v20);
      goto LABEL_16;
    }
    odometer_compute_nonce_hash(v4, v14, (uint64_t)v90, (uint64_t)v89);
LABEL_14:
    if (!property_constrain_digest(v13, v4, a2 + 64, (unint64_t)v89, v68, v69, v70, v71))
    {
      uint64_t v79 = *(void *)a2;
      uint64_t v80 = chip_get_name(*(void *)(a2 + 16));
      expert_log(v79, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is current", v81, v82, v83, v84, v85, v80);
      return 0;
    }
    uint64_t v17 = *(unsigned int *)(a1 + 24);
    uint64_t v72 = *(void *)a2;
    uint64_t v73 = chip_get_name(*(void *)(a2 + 16));
    expert_log(v72, 0, (uint64_t)"odometer[%s:%s]: anti-replay violation: %d", v74, v75, v76, v77, v78, v73);
LABEL_16:
    if (v17 >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v26, v27, v28, v29, v30, v31, v32, v17);
    }
    return v17;
  }
  uint64_t v33 = *(void *)a2;
  uint64_t v34 = chip_get_name(*(void *)(a2 + 16));
  expert_log(v33, 1uLL, (uint64_t)"odometer[%s:%s]: nonce is bootstrapping; using boot nonce hash",
    v35,
    v36,
    v37,
    v38,
    v39,
    v34);
  uint64_t v47 = v14[21];
  if (!v47) {
    __panic_npx("panic: illegal chip/expert configuration", v40, v41, v42, v43, v44, v45, v46, v87);
  }
  uint64_t result = expert_read_boot_manifest(v4, v47 + 28, (uint64_t)v89 + 8, (uint64_t)&__n);
  if (result)
  {
    uint64_t v17 = result;
    uint64_t v54 = *(void *)a2;
    uint64_t v55 = chip_get_name(*(void *)(a2 + 16));
    expert_log(v54, 0, (uint64_t)"odometer[%s:%s]: failed to query boot nonce hash: %d", v56, v57, v58, v59, v60, v55);
    goto LABEL_16;
  }
  if (__n <= 0x40)
  {
    digest_init((uint64_t)v89, (char *)v89 + 8, __n, v49, v50, v51, v52, v53);
    goto LABEL_14;
  }
  __break(0x5519u);
  return result;
}

uint64_t image4_environment_copy_nonce_digest(uint64_t a1, void *a2, size_t *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a1 + 8);
  memset(__src, 0, sizeof(__src));
  size_t __n = 64;
  uint64_t v7 = image4_environment_resolve(a1);
  if (v7)
  {
    uint64_t v13 = (int *)v7;
    int nonce_domain = image4_environment_get_nonce_domain(a1);
    uint64_t v15 = darwin_syscall_nonce_copy_hash(v6, v13, nonce_domain, __src, &__n);
    if (v15)
    {
      uint64_t v23 = v15;
      if (v15 >= 0x6A) {
        __panic_npx_2(v15, v16, v17, v18, v19, v20, v21, v22, v15);
      }
    }
    else
    {
      size_t v24 = __n;
      if (__n <= 0x40)
      {
        memcpy(a2, __src, __n);
        uint64_t v23 = 0;
        *a3 = v24;
      }
      else
      {
        return 84;
      }
    }
  }
  else
  {
    uint64_t v23 = 45;
    expert_log(v6, 0, (uint64_t)"failed to resolve chip environment: %d", v8, v9, v10, v11, v12, 45);
  }
  return v23;
}

uint64_t image4_environment_roll_nonce(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = image4_environment_resolve(a1);
  if (v3)
  {
    uint64_t v9 = (int *)v3;
    int nonce_domain = image4_environment_get_nonce_domain(a1);
    uint64_t v11 = darwin_syscall_nonce_roll(v2, v9, nonce_domain);
    uint64_t v19 = v11;
    if (v11 >= 0x6A) {
      __panic_npx_2(v11, v12, v13, v14, v15, v16, v17, v18, v11);
    }
  }
  else
  {
    uint64_t v19 = 45;
    expert_log(v2, 0, (uint64_t)"failed to resolve chip environment: %d", v4, v5, v6, v7, v8, 45);
  }
  return v19;
}

uint64_t image4_environment_generate_nonce_proposal(uint64_t a1, void *a2, size_t *a3, char *a4, unint64_t *a5)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v10 = *(void *)(a1 + 8);
  memset(__src, 0, sizeof(__src));
  size_t __n = 64;
  uint64_t v11 = image4_environment_resolve(a1);
  if (v11)
  {
    uint64_t v17 = (_DWORD *)v11;
    int nonce_domain = image4_environment_get_nonce_domain(a1);
    uint64_t v19 = darwin_syscall_nonce_generate_proposal(v10, v17, nonce_domain, __src, &__n, a4, a5);
    if (v19)
    {
      uint64_t v27 = v19;
      if (v19 >= 0x6A) {
        __panic_npx_2(v19, v20, v21, v22, v23, v24, v25, v26, v19);
      }
    }
    else
    {
      size_t v28 = __n;
      if (__n <= 0x40)
      {
        memcpy(a2, __src, __n);
        uint64_t v27 = 0;
        *a3 = v28;
      }
      else
      {
        return 84;
      }
    }
  }
  else
  {
    uint64_t v27 = 45;
    expert_log(v10, 0, (uint64_t)"failed to resolve chip environment: %d", v12, v13, v14, v15, v16, 45);
  }
  return v27;
}

uint64_t image4_environment_commit_nonce_proposal(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 8);
  memset(v22, 0, sizeof(v22));
  uint64_t v21 = 64;
  uint64_t v3 = image4_environment_resolve(a1);
  if (v3)
  {
    uint64_t v9 = (int *)v3;
    int nonce_domain = image4_environment_get_nonce_domain(a1);
    uint64_t v11 = darwin_syscall_nonce_peek_hash(v2, v9, nonce_domain, v22, &v21);
    uint64_t v19 = v11;
    if (!v11)
    {
      uint64_t v11 = darwin_syscall_nonce_roll(v2, v9, nonce_domain);
      uint64_t v19 = v11;
    }
    if (v19 >= 0x6A) {
      __panic_npx_2(v11, v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  else
  {
    uint64_t v19 = 45;
    expert_log(v2, 0, (uint64_t)"failed to resolve chip environment: %d", v4, v5, v6, v7, v8, 45);
  }
  return v19;
}

unint64_t image4_environment_flash(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, size_t *a5)
{
  __src[2] = *MEMORY[0x263EF8340];
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v37 = 0;
  __src[0] = 0;
  memset(v36, 0, sizeof(v36));
  __src[1] = 0;
  size_t __n = 16;
  unint64_t result = image4_environment_resolve(a1);
  if (!result)
  {
    uint64_t v27 = 45;
    expert_log(v9, 0, (uint64_t)"failed to resolve chip environment: %d", v11, v12, v13, v14, v15, 45);
    return v27;
  }
  unint64_t v16 = result;
  if (!*(void *)(result + 80))
  {
    if (result >= result + 264) {
      goto LABEL_14;
    }
    uint64_t name = chip_get_name(result);
    uint64_t v27 = 45;
    expert_log(v9, 0, (uint64_t)"%s: chip has no associated dfu policy: %d", v29, v30, v31, v32, v33, name);
    return v27;
  }
  buff_init_wrap(v36, a2, a3);
  unint64_t result = darwin_syscall_image_dfu(v9, *(int **)(v16 + 80), (uint64_t *)v36, __src, &__n, v17, v18, v19);
  if (result)
  {
    uint64_t v27 = result;
    if (result >= 0x6A) {
      __panic_npx_2(result, v20, v21, v22, v23, v24, v25, v26, result);
    }
    return v27;
  }
  if (!a4) {
    return 0;
  }
  size_t v34 = __n;
  if (__n <= 0x10)
  {
    memcpy(a4, __src, __n);
    uint64_t v27 = 0;
    *a5 = v34;
    return v27;
  }
LABEL_14:
  __break(0x5519u);
  return result;
}

uint64_t img4_firmware_new_from_fd_4MSM(char *a1, uint64_t a2, unsigned int a3, int *a4, uint64_t a5)
{
  uint64_t expert = img4_runtime_get_expert(a1);
  int v17 = 0;
  uint64_t v16 = 0;
  uint64_t v11 = *a4;
  uint64_t v12 = _expert_alloc_type(expert, (uint64_t)&_image4_type_firmware);
  img4_firmware_init_sentinel((void *)v12, (uint64_t)a1, a5);
  fourcc_init((uint64_t)&v16, a3);
  *(void *)(v12 + 16) = &_image4_type_firmware;
  uint64_t inited = payload_init_empty(v12 + 56, expert, (unsigned int *)&v16);
  *(void *)(v12 + 48) = inited;
  uint64_t v14 = *(void *)(a2 + 16);
  *(_OWORD *)(v12 + 24) = *(_OWORD *)a2;
  *(void *)(v12 + 40) = v14;
  payload_set_callbacks(inited, (uint64_t)img4_firmware_new_from_fd_4MSM_callbacks, v11);
  *a4 = -1;
  return v12;
}

uint64_t _fd_measure(uint64_t *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  uint64_t v7 = (*(uint64_t (**)(void))(a2 + 48))();
  memset(&v81, 0, sizeof(v81));
  memset(v82, 0, sizeof(v82));
  MEMORY[0x270FA5388](v7, v8, (*(void *)(v7 + 8) + *(void *)(v7 + 16) + 19) & 0xFFFFFFFFFFFFFFF8, v9, v10, v11, v12, v13);
  uint64_t v16 = (char *)&v76 - v15;
  if (v17 >= 8) {
    memset((char *)&v76 - v15, 170, v14);
  }
  ccdigest_init();
  uint64_t v78 = a3;
  uint64_t v79 = &v76;
  if (a4 < 0)
  {
    size_t v30 = 0;
    uint64_t v23 = 0;
    goto LABEL_9;
  }
  uint64_t v23 = malloc_type_malloc(0x40000uLL, 0xC6E5252DuLL);
  if (v23)
  {
    if (fstat(a4, &v81))
    {
      int v24 = *__error();
      expert_log(*a1, 0, (uint64_t)"%s: fstat: %d", v25, v26, v27, v28, v29, a1[1] + 4);
      if (v24) {
        goto LABEL_7;
      }
    }
    else
    {
      unint64_t v33 = 0;
      uint64_t v77 = 0;
      st_uint64_t size = v81.st_size;
      while (1)
      {
        while (1)
        {
          memset(v80, 0, 40);
          if (st_size >= 0x40000) {
            size_t v35 = 0x40000;
          }
          else {
            size_t v35 = st_size;
          }
          ssize_t v36 = read(a4, v23, v35);
          if (v36 < 0) {
            goto LABEL_26;
          }
          ssize_t v42 = v36;
          if (v36 > 0x40000) {
            goto LABEL_25;
          }
          buff_init_wrap_signed(v80, (uint64_t)v23, v36, v37, v38, v39, v40, v41);
          if (v42 != v35) {
            break;
          }
          uint64_t length_signed = buff_get_length_signed((uint64_t)v80, v43, v44, v45, v46, v47, v48, v49);
          st_size -= v80[1];
          expert_log(*a1, 2uLL, (uint64_t)"%s: left to read = %lu", v51, v52, v53, v54, v55, a1[1] + 4);
          uint64_t v56 = *a1;
          uint64_t v57 = a1[1] + 4;
          v77 += length_signed;
          expert_log(v56, 2uLL, (uint64_t)"%s: cur offset = %lld", v58, v59, v60, v61, v62, v57);
          ccdigest_update();
          unint64_t v33 = 0;
          if (!st_size) {
            goto LABEL_23;
          }
        }
        if (v42)
        {
          int v70 = 5;
          expert_log(*a1, 0, (uint64_t)"%s: read: bad read: actual = %ld, requested = %lu, chunk length = %lu: %d", v45, v46, v47, v48, v49, a1[1] + 4);
          goto LABEL_29;
        }
        expert_log(*a1, 2uLL, (uint64_t)"%s: stall while reading file", v45, v46, v47, v48, v49, a1[1] + 4);
        if (v33 >= 3) {
          break;
        }
        ++v33;
        if (!st_size)
        {
LABEL_23:
          if (*(void *)v7 >= 0x41uLL) {
            __panic_npx("panic: buffer not sufficient for digest: actual = %lu, expected >= %lu", v63, v64, v65, v66, v67, v68, v69, 64);
          }
          (*(void (**)(uint64_t, char *, _OWORD *))(v7 + 56))(v7, v16, v82);
          size_t v30 = *(void *)v7;
          if (*(void *)v7 < 0x41uLL) {
            goto LABEL_9;
          }
LABEL_25:
          __break(0x5519u);
LABEL_26:
          int v70 = *__error();
          expert_log(*a1, 0, (uint64_t)"%s: read: %d", v71, v72, v73, v74, v75, a1[1] + 4);
          goto LABEL_29;
        }
      }
      int v70 = 5;
      expert_log(*a1, 0, (uint64_t)"%s: stalled out: %d", v65, v66, v67, v68, v69, a1[1] + 4);
LABEL_29:
      if (v70) {
        goto LABEL_7;
      }
    }
    uint64_t v31 = 0;
    goto LABEL_10;
  }
LABEL_7:
  size_t v30 = 0;
LABEL_9:
  uint64_t v31 = digest_init(v78, v82, v30, v18, v19, v20, v21, v22);
LABEL_10:
  free(v23);
  return v31;
}

uint64_t _fd_get_measured_bytes()
{
  return 0;
}

uint64_t _fd_dealloc(int a1, int a2)
{
  uint64_t result = close(a2);
  if (result)
  {
    uint64_t v3 = __error();
    __panic_npx("panic: close%d", v4, v5, v6, v7, v8, v9, v10, *v3);
  }
  return result;
}

uint64_t _prepare_3(uint64_t a1, uint64_t a2)
{
  return odometer_prepare_mixn_match(a2, 1);
}

uint64_t _get_constraint_mask_3()
{
  return 0;
}

uint64_t _extract_payload_3()
{
  return 0;
}

uint64_t _BootPolicyClosureComputeDigest_2(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = **(unint64_t ***)(*(void *)(a5 + 32) + 16);
  if (*v9 > a4) {
    __panic_npx_0((uint64_t)v9, a2, a1, a4, a5, a6, a7, a8, a4);
  }
  ccdigest();
  return 0;
}

uint64_t _BootPolicyClosureVerifyChain_2()
{
  return 0;
}

uint64_t _BootPolicyClosureVerifySignature_2()
{
  return 0;
}

uint64_t _BootPolicyClosureEvaluateCertificateProperties_2()
{
  return 0;
}

uint64_t _get_constraint_mask_4()
{
  return 0;
}

uint64_t _extract_payload_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_WORD *)(a3 + 584)) {
    __panic_npx_8(a1, a2, a3, a4, (uint64_t)a5, a6, a7, a8, vars0);
  }
  *a5 = *(void *)(a3 + 552);
  return *(void *)(a3 + 544);
}

void __panic_npx_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  uint64_t v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: optional not set", &a9);
  _os_crash();
  __break(1u);
}

uint64_t dylib_init(uint64_t a1)
{
  uint64_t v2 = generic_expert();
  expert_init(a1);
  darwin_syscall_init(a1);

  return generic_expert_set_specialist((uint64_t)v2, a1, 0, v3, v4, v5, v6, v7);
}

size_t dylib_expert_state_init(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  memset(v3, 0, sizeof(v3));
  if (os_parse_boot_arg_int()) {
    *(unsigned char *)a1 = 1;
  }
  size_t result = os_parse_boot_arg_string();
  if (result)
  {
    if (LODWORD(v3[0]) == 3171437) {
      *(void *)(a1 + 16) = a1 + 24;
    }
    size_t result = strlcpy((char *)(a1 + 24), (const char *)v3, 0x20uLL);
    *(void *)(a1 + 8) = a1 + 24;
  }
  return result;
}

uint64_t dylib_expert_call_method(uint64_t a1, unint64_t a2, const void *a3, size_t a4, void *a5, size_t *a6)
{
  uint64_t v12 = expert_runtime_boot(a1);
  if (v12)
  {
    uint64_t v20 = v12;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for user client call: %d", v15, v16, v17, v18, v19, v12);
    goto LABEL_3;
  }
  uint64_t v28 = darwin_syscall_get(a2, v13, v14, v15, v16, v17, v18, v19);
  if (!v28) {
    return 78;
  }
  unint64_t v36 = (unint64_t)v28;
  if (*((_DWORD *)v28 + 9) == 6) {
    return 78;
  }
  mach_port_t kmod_connect = dylib_expert_get_kmod_connect(a1, v29, v30, v31, v32, v33, v34, v35);
  if (!kmod_connect)
  {
    expert_log(a1, 1uLL, (uint64_t)"user client not supported on this target", v39, v40, v41, v42, v43, (uint64_t)outputStruct);
    return 45;
  }
  uint64_t result = IOConnectCallMethod(kmod_connect, *(_DWORD *)(v36 + 36), 0, 0, a3, a4, 0, 0, a5, a6);
  if (!result)
  {
    expert_log(a1, 2uLL, (uint64_t)"user client method success", v44, v45, v46, v47, v48, (uint64_t)outputStructa);
    return 0;
  }
  if (((result >> 14) & 0xFFF) != 3)
  {
    expert_log(a1, 0, (uint64_t)"user client method failed: v = %hx, trap = %s, kr = %#x, sys = %#x, sub = %#x, code = %#x", v44, v45, v46, v47, v48, *(unsigned __int8 *)(v36 + 8));
    return 64;
  }
  if (v36 < v36 + 40)
  {
    uint64_t v20 = result & 0x3FFF;
    dylib_expert_record_trap_error(a1, v36, (uint64_t)"iokit", v20, v45, v46, v47, v48);
LABEL_3:
    if (v20 >= 0x6A) {
      __panic_npx("panic: error not set to valid posix code: %d", v21, v22, v23, v24, v25, v26, v27, v20);
    }
    return v20;
  }
  __break(0x5519u);
  return result;
}

uint64_t dylib_expert_record_trap_error(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  switch(a4)
  {
    case 'T':
      return expert_log(a1, 0, (uint64_t)"bad argument vector provided to kext: v = %hx, how = %s, trap = %s: %d", a4, a5, a6, a7, a8, *(unsigned __int8 *)(a2 + 8));
    case 'W':
      return expert_log(a1, 0, (uint64_t)"kext and dylib are out of sync: v = %hx, how = %s, trap = %s: %d", a4, a5, a6, a7, a8, *(unsigned __int8 *)(a2 + 8));
      return expert_log(a1, 0, (uint64_t)"kext cannot parse argument vector: v = %hx, how = %s, trap = %s: %d", a4, a5, a6, a7, a8, *(unsigned __int8 *)(a2 + 8));
  }
  return expert_log(a1, 0, (uint64_t)"trap failed: v = %hx, how = %s, trap = %s: %d", a4, a5, a6, a7, a8, *(unsigned __int8 *)(a2 + 8));
}

uint64_t dylib_restoreos_logv(unint64_t a1, const char *a2, va_list a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a1 >= 4) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"lvl");
  }
  uint64_t v9 = off_2655E4A70[a1];
  os_unfair_lock_lock((os_unfair_lock_t)&dylib_restoreos_logv_rd_log);
  uint64_t v10 = _restore_log_state_file_locked();
  os_unfair_lock_unlock((os_unfair_lock_t)&dylib_restoreos_logv_rd_log);
  uint64_t v11 = getprogname();
  if (fprintf(v10, "%s: AppleImage4 %s", v11, v9) < 0
    || vfprintf(v10, a2, a3) < 0
    || (uint64_t result = fprintf(v10, "\n"), (result & 0x80000000) != 0))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&dylib_restoreos_logv_rd_log);
    uint64_t v13 = (FILE *)qword_26A9A1938;
    qword_26A9A1938 = 0;
    uint64_t v14 = _restore_log_state_file_locked();
    os_unfair_lock_unlock((os_unfair_lock_t)&dylib_restoreos_logv_rd_log);
    uint64_t v15 = getprogname();
    fprintf(v14, "%s: AppleImage4 %s", v15, v9);
    vfprintf(v14, a2, a3);
    uint64_t result = fputc(10, v14);
    if (v13 && v13 != (FILE *)*MEMORY[0x263EF8348])
    {
      uint64_t result = fclose(v13);
      if (result == -1) {
        dylib_restoreos_logv_cold_1(&v18, v19);
      }
    }
  }
  return result;
}

FILE *_restore_log_state_file_locked()
{
  uint64_t result = (FILE *)qword_26A9A1938;
  if (qword_26A9A1938) {
    return result;
  }
  uint64_t result = fopen("/dev/console", "w");
  if (result && result >= &result[1]) {
    goto LABEL_22;
  }
  qword_26A9A1938 = (uint64_t)result;
  if (result) {
    return result;
  }
  int v8 = *__error();
  if (v8 == 1 || v8 == 13)
  {
    uint64_t result = (FILE *)*MEMORY[0x263EF8348];
    if (*MEMORY[0x263EF8348]) {
      BOOL v10 = (unint64_t)result >= *MEMORY[0x263EF8348] + 152;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10) {
      goto LABEL_22;
    }
    qword_26A9A1938 = *MEMORY[0x263EF8348];
  }
  else
  {
    if (v8 == 22) {
      goto LABEL_23;
    }
    uint64_t result = (FILE *)*MEMORY[0x263EF8348];
  }
  if (result) {
    BOOL v11 = result >= &result[1];
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
LABEL_22:
    __break(0x5519u);
LABEL_23:
    __panic_npx("panic: invalid mode trying to open console", v1, v2, v3, v4, v5, v6, v7, v12);
  }
  return result;
}

uint64_t chip_instance_instantiate(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  long long v37 = xmmword_270ECFC28;
  uint64_t v38 = qword_270ECFC38;
  BOOL v11 = property_iterator_next((uint64_t)&v37, a2, a3, a4, a5, a6, a7, a8);
  if (!v11)
  {
    LOBYTE(result) = -1;
    goto LABEL_56;
  }
  uint64_t v19 = (uint64_t)v11;
  unint64_t v20 = a1 + 160;
  while (1)
  {
    unint64_t constraint = chip_get_constraint(a3, v19, 0);
    unint64_t v29 = constraint;
    unint64_t v30 = constraint + 104;
    switch(**(void **)(constraint + 40))
    {
      case 0:
        uint64_t v31 = *(void *)(constraint + 64);
        if (v31 < 0) {
          goto LABEL_53;
        }
        if (constraint >= v30) {
          goto LABEL_52;
        }
        uint64_t v24 = (unsigned __int8 *)(a1 + v31);
        if (a1 + v31)
        {
          if ((unint64_t)v24 >= v20 || (unint64_t)v24 < a1) {
            goto LABEL_52;
          }
        }
        uint64_t result = expert_query_property_BOOL(a2, a3, constraint, v24);
        break;
      case 1:
        uint64_t v31 = *(void *)(constraint + 64);
        if (v31 < 0) {
          goto LABEL_53;
        }
        if (constraint >= v30) {
          goto LABEL_52;
        }
        uint64_t v24 = (unsigned __int8 *)(a1 + v31);
        if (a1 + v31)
        {
          if ((unint64_t)v24 >= v20 || (unint64_t)v24 < a1) {
            goto LABEL_52;
          }
        }
        uint64_t result = expert_query_property_uint32(a2, a3, constraint, v24);
        break;
      case 2:
        uint64_t v31 = *(void *)(constraint + 64);
        if (v31 < 0) {
          goto LABEL_53;
        }
        if (constraint >= v30) {
          goto LABEL_52;
        }
        uint64_t v24 = (unsigned __int8 *)(a1 + v31);
        if (a1 + v31)
        {
          if ((unint64_t)v24 >= v20 || (unint64_t)v24 < a1) {
            goto LABEL_52;
          }
        }
        uint64_t result = expert_query_property_uint64(a2, a3, constraint, v24);
        break;
      case 3:
        uint64_t v31 = *(void *)(constraint + 64);
        if (v31 < 0) {
          goto LABEL_53;
        }
        if (constraint >= v30
          || (uint64_t v24 = (unsigned __int8 *)(a1 + v31)) != 0
          && ((unint64_t)v24 < v20 ? (BOOL v36 = (unint64_t)v24 >= a1) : (BOOL v36 = 0), !v36))
        {
LABEL_52:
          __break(0x5519u);
LABEL_53:
          __panic_npx("panic: invalid offset: %lld", v22, v23, (uint64_t)v24, v25, v26, v27, v28, v31);
        }
        uint64_t result = expert_query_property_digest(a2, a3, constraint, (uint64_t)v24);
        break;
      default:
        __panic_npx("panic: version property iterated during instantiation: p = %s, fourcc = %s", v22, v23, (uint64_t)v24, v25, v26, v27, v28, *(void *)constraint);
    }
    if ((int)result <= 18)
    {
      if (result)
      {
        if (result != 2) {
          break;
        }
      }
      else
      {
        *(void *)(a1 + 8) |= *(void *)(v29 + 72);
      }
      goto LABEL_48;
    }
    if (result != 19 && result != 45) {
      break;
    }
LABEL_48:
    uint64_t result = (uint64_t)property_iterator_next((uint64_t)&v37, v12, v13, v14, v15, v16, v17, v18);
    uint64_t v19 = result;
    if (!result) {
      return result;
    }
  }
  if (result >= 0x6A) {
LABEL_56:
  }
    __panic_npx("panic: error not set to valid posix code: %d", v12, v13, v14, v15, v16, v17, v18, result);
  return result;
}

unint64_t chip_instance_check(unint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a2[8];
  if (v8 < 0) {
    return 0;
  }
  uint64_t v9 = a2[9];
  if (!v9) {
    __panic_npx("panic: illegal property definition: %s", (uint64_t)a2, a3, a4, a5, a6, a7, a8, *a2);
  }
  if ((*(void *)(a1 + 8) & v9) == 0) {
    return 0;
  }
  unint64_t v10 = a1 + v8;
  if (v10)
  {
    if (v10 >= a1 + 160 || v10 < a1)
    {
      __break(0x5519u);
      return 0;
    }
  }
  return v10;
}

unint64_t chip_instance_set_BOOL(unint64_t result, uint64_t a2, unsigned char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_UNKNOWN **)(a2 + 40) != &_property_type_BOOL) {
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, 145);
  }
  uint64_t v8 = *(void *)(a2 + 64);
  if (v8 < 0) {
    __panic_npx("panic: property not present in chip instance: %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a2);
  }
  uint64_t v9 = (unsigned char *)(result + v8);
  *(void *)(result + 8) |= *(void *)(a2 + 72);
  if ((unint64_t)v9 < result + 160 && (unint64_t)v9 >= result) {
    *uint64_t v9 = *a3;
  }
  else {
    __break(0x5519u);
  }
  return result;
}

unint64_t chip_instance_set_uint32(unint64_t result, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(uint64_t **)(a2 + 40) != &_property_type_uint32) {
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, 235);
  }
  uint64_t v8 = *(void *)(a2 + 64);
  if (v8 < 0) {
    __panic_npx("panic: property not present in chip instance: %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a2);
  }
  uint64_t v9 = (_DWORD *)(result + v8);
  *(void *)(result + 8) |= *(void *)(a2 + 72);
  if ((unint64_t)v9 < result + 160 && (unint64_t)v9 >= result) {
    *uint64_t v9 = *a3;
  }
  else {
    __break(0x5519u);
  }
  return result;
}

unint64_t chip_instance_set_uint64(unint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(uint64_t **)(a2 + 40) != &_property_type_uint64) {
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, 242);
  }
  uint64_t v8 = *(void *)(a2 + 64);
  if (v8 < 0) {
    __panic_npx("panic: property not present in chip instance: %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a2);
  }
  uint64_t v9 = (void *)(result + v8);
  *(void *)(result + 8) |= *(void *)(a2 + 72);
  if ((unint64_t)v9 < result + 160 && (unint64_t)v9 >= result) {
    *uint64_t v9 = *a3;
  }
  else {
    __break(0x5519u);
  }
  return result;
}

unint64_t chip_instance_set_digest(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(uint64_t **)(a2 + 40) != &_property_type_digest) {
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, a3, a4, a5, a6, a7, a8, 249);
  }
  uint64_t v8 = *(void *)(a2 + 64);
  if (v8 < 0) {
    __panic_npx("panic: property not present in chip instance: %s", a2, a3, a4, a5, a6, a7, a8, *(void *)a2);
  }
  *(void *)(result + 8) |= *(void *)(a2 + 72);
  unint64_t v9 = result + v8;
  if (!v9 || (v9 < result + 160 ? (BOOL v10 = v9 >= result) : (BOOL v10 = 0), v10))
  {
    return digest_copy(v9, a3, a3, a4, a5, a6, a7, a8);
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

void chip_instance_set_version(unint64_t a1, uint64_t a2, long long *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(uint64_t **)(a2 + 40) != &_property_type_version) {
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, 0);
  }
  uint64_t v8 = *(void *)(a2 + 64);
  if (v8 < 0) {
    __panic_npx("panic: property not present in chip instance: %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a2);
  }
  *(void *)(a1 + 8) |= *(void *)(a2 + 72);
  unint64_t v9 = a1 + v8;
  if (!v9 || (v9 < a1 + 160 ? (BOOL v10 = v9 >= a1) : (BOOL v10 = 0), v10))
  {
    version_copy(v9, a3);
  }
  else
  {
    __break(0x5519u);
  }
}

unsigned char *chip_instance_get_BOOL(unsigned char *result, uint64_t a2, unsigned char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_UNKNOWN **)(a2 + 40) != &_property_type_BOOL) {
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, 145);
  }
  uint64_t v8 = *(void *)(a2 + 64);
  if (v8 < 0) {
    __panic_npx("panic: property not present in chip instance: %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a2);
  }
  if ((*(void *)(a2 + 72) & *((void *)result + 1)) == 0) {
    return 0;
  }
  unint64_t v9 = &result[v8];
  if (v9 >= result + 160 || v9 < result)
  {
    __break(0x5519u);
    return result;
  }
  *a3 = *v9;
  return v9;
}

_DWORD *chip_instance_get_uint32(_DWORD *result, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(uint64_t **)(a2 + 40) != &_property_type_uint32) {
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, 235);
  }
  uint64_t v8 = *(void *)(a2 + 64);
  if (v8 < 0) {
    __panic_npx("panic: property not present in chip instance: %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a2);
  }
  if ((*(void *)(a2 + 72) & *((void *)result + 1)) == 0) {
    return 0;
  }
  unint64_t v9 = (_DWORD *)((char *)result + v8);
  if (v9 >= result + 40 || v9 < result)
  {
    __break(0x5519u);
    return result;
  }
  *a3 = *v9;
  return v9;
}

void *chip_instance_get_uint64(void *result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(uint64_t **)(a2 + 40) != &_property_type_uint64) {
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, 242);
  }
  uint64_t v8 = *(void *)(a2 + 64);
  if (v8 < 0) {
    __panic_npx("panic: property not present in chip instance: %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a2);
  }
  if ((*(void *)(a2 + 72) & result[1]) == 0) {
    return 0;
  }
  unint64_t v9 = (void *)((char *)result + v8);
  if (v9 >= result + 20 || v9 < result)
  {
    __break(0x5519u);
    return result;
  }
  *a3 = *v9;
  return v9;
}

unint64_t chip_instance_get_digest(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(uint64_t **)(a2 + 40) != &_property_type_digest) {
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, a3, a4, a5, a6, a7, a8, 249);
  }
  uint64_t v8 = *(void *)(a2 + 64);
  if (v8 < 0) {
    __panic_npx("panic: property not present in chip instance: %s", a2, a3, a4, a5, a6, a7, a8, *(void *)a2);
  }
  if ((*(void *)(a2 + 72) & *(void *)(result + 8)) == 0) {
    return 0;
  }
  unint64_t v9 = result + v8;
  if (!(result + v8) || (v9 < result + 160 ? (BOOL v10 = v9 >= result) : (BOOL v10 = 0), v10))
  {
    return digest_copy(a3, v9, a3, a4, a5, a6, a7, a8);
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

void chip_instance_get_version(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(uint64_t **)(a2 + 40) != &_property_type_version) {
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, a3, a4, a5, a6, a7, a8, 0);
  }
  uint64_t v8 = *(void *)(a2 + 64);
  if (v8 < 0) {
    __panic_npx("panic: property not present in chip instance: %s", a2, a3, a4, a5, a6, a7, a8, *(void *)a2);
  }
  if ((*(void *)(a2 + 72) & *(void *)(a1 + 8)) != 0)
  {
    unint64_t v9 = (long long *)(a1 + v8);
    if (!(a1 + v8) || ((unint64_t)v9 < a1 + 160 ? (BOOL v10 = (unint64_t)v9 >= a1) : (BOOL v10 = 0), v10))
    {
      version_copy(a3, v9);
    }
    else
    {
      __break(0x5519u);
    }
  }
}

uint64_t X509PolicySetFlagsForCommonNames(uint64_t a1)
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  v4[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v4);
  if (!result)
  {
    uint64_t result = compare_octet_string((uint64_t)&iPhoneCAName, (uint64_t)v4);
    if (result)
    {
      uint64_t result = compare_octet_string((uint64_t)&CodeSigningCAName, (uint64_t)v4);
      if (result)
      {
        uint64_t result = compare_octet_string_partial((uint64_t)&MFi4AccessoryCAName, (uint64_t)v4);
        if (result)
        {
          uint64_t result = compare_octet_string_partial((uint64_t)&MFi4AttestationCAName, (uint64_t)v4);
          if (result)
          {
            uint64_t result = compare_octet_string_partial((uint64_t)&MFi4ProvisioningCAName, (uint64_t)v4);
            if (result) {
              return result;
            }
            uint64_t v3 = 0x1000000000;
          }
          else
          {
            uint64_t v3 = 0x800000000;
          }
        }
        else
        {
          uint64_t v3 = 0x400000000;
        }
      }
      else
      {
        uint64_t v3 = 8;
      }
    }
    else
    {
      uint64_t v3 = 3840;
    }
    *(void *)(a1 + 240) |= v3;
  }
  return result;
}

double X509PolicySetFlagsForMFI(uint64_t a1)
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  if (!X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v6))
  {
    if (compare_octet_string_partial((uint64_t)&MFICommonNamePrefix, (uint64_t)v6)) {
      goto LABEL_3;
    }
    time_t v5 = 0;
    if (!X509CertificateGetNotBefore(a1, &v5))
    {
      memset(&v4, 0, sizeof(v4));
      strptime("2006-05-31", "%F", &v4);
      time_t v3 = timegm(&v4);
      double result = difftime(v3, v5);
      if (result < 0.0)
      {
        *(void *)(a1 + 240) |= 0x8000000uLL;
LABEL_3:
        if (!compare_octet_string_partial((uint64_t)&MFi4ProvisioningHostNamePrefix, (uint64_t)v6)) {
          *(void *)(a1 + 240) |= 0x1000000000uLL;
        }
      }
    }
  }
  return result;
}

uint64_t X509PolicySetFlagsForRoots(uint64_t result, uint64_t a2)
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  if (*(unsigned char *)(result + 16))
  {
    double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootCASPKI);
    if (!result
      || (double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG2SPKI), !result)
      || (double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG3SPKI), !result))
    {
      uint64_t v5 = *(void *)(a2 + 240) | 0x58E30653FFF8;
      goto LABEL_11;
    }
  }
  uint64_t v4 = *(void *)(v3 + 8);
  if ((v4 & 0x1000000) != 0)
  {
    double result = compare_octet_string(a2 + 88, (uint64_t)&UcrtRootSpki);
    if (!result)
    {
      uint64_t v5 = *(void *)(a2 + 240) | 0x1000000;
      goto LABEL_11;
    }
LABEL_13:
    if (*(unsigned char *)(v3 + 17)) {
      double result = X509PolicySetFlagsForTestAnchor((void *)v3, a2);
    }
    goto LABEL_15;
  }
  if ((v4 & 0x1C00000000) == 0) {
    goto LABEL_15;
  }
  double result = compare_octet_string(a2 + 88, (uint64_t)&MFi4RootSpki);
  if (result) {
    goto LABEL_13;
  }
  uint64_t v5 = *(void *)(a2 + 240) | 0x1C00000000;
LABEL_11:
  *(void *)(a2 + 240) = v5;
LABEL_15:
  if (*(unsigned char *)(v3 + 16))
  {
    if (*(unsigned char *)(v3 + 17))
    {
      double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootCASPKI);
      if (!result
        || (double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG2SPKI), !result)
        || (double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG3SPKI), !result))
      {
        *(void *)(a2 + 240) |= 0x58E30653FFF8uLL;
      }
    }
    if (*(unsigned char *)(v3 + 16) && *(unsigned char *)(v3 + 17))
    {
      double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootECCSPKI);
      if (!result) {
        *(void *)(a2 + 240) |= 0x6400000uLL;
      }
    }
  }
  return result;
}

uint64_t X509PolicySetFlagsForTestAnchor(void *a1, uint64_t a2)
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = 0;
  v6[1] = 0;
  v5[0] = 0;
  v5[1] = 0;
  uint64_t result = X509CertificateParseSPKI((unint64_t *)(a2 + 88), v6, 0, v5);
  if (!result)
  {
    uint64_t result = compare_octet_string(a1[4], (uint64_t)v6);
    if (!result)
    {
      uint64_t result = compare_octet_string(a1[3], (uint64_t)v5);
      if (!result) {
        *(void *)(a2 + 240) |= a1[1];
      }
    }
  }
  return result;
}

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!result) {
    *(void *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  }
  return result;
}

uint64_t CTImg4VerifyChain(uint64_t result, uint64_t a2, void *a3, void *a4, void *a5, unint64_t *a6, uint64_t a7, uint64_t a8)
{
  _OWORD v38[4] = *MEMORY[0x263EF8340];
  if (!a8) {
    return 6;
  }
  unint64_t v14 = result;
  memset(v38, 170, 32);
  v37[0] = 0xAAAAAAAAAAAAAAAALL;
  v37[1] = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v15 = *(void *)(a8 + 8);
  if (!v15) {
    goto LABEL_10;
  }
  uint64_t v16 = *(void *)(a8 + 16);
  if (!v16) {
    goto LABEL_10;
  }
  *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v36[12] = v17;
  v36[13] = v17;
  v36[10] = v17;
  v36[11] = v17;
  _OWORD v36[8] = v17;
  v36[9] = v17;
  v36[6] = v17;
  _OWORD v36[7] = v17;
  v36[4] = v17;
  _OWORD v36[5] = v17;
  _OWORD v36[2] = v17;
  v36[3] = v17;
  v36[0] = v17;
  v36[1] = v17;
  long long v34 = v17;
  long long v35 = v17;
  long long v32 = v17;
  long long v33 = v17;
  long long v31 = v17;
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v15, v16))
  {
    __break(0x5513u);
    goto LABEL_27;
  }
  unint64_t v18 = v15 + v16;
  if (v15 > v18)
  {
LABEL_27:
    __break(0x5519u);
    return result;
  }
  unint64_t v29 = v15;
  unint64_t v30 = v18;
  int v19 = X509CertificateParse((unint64_t *)&v31, &v29);
  if (v19 || (int v19 = X509CertificateParseSPKI((unint64_t *)v36 + 1, &v38[2], v37, v38)) != 0)
  {
    *(_DWORD *)(a8 + 32) = v19;
    return 3;
  }
LABEL_10:
  uint64_t v20 = *(void *)(a8 + 24);
  uint64_t v21 = 0x80000000;
  if (v20) {
    uint64_t v21 = *(void *)(a8 + 24);
  }
  *(void *)&long long v31 = 0;
  *((void *)&v31 + 1) = v21;
  *((void *)&v32 + 1) = v38;
  *(void *)&long long v33 = &v38[2];
  *((void *)&v33 + 1) = v37;
  *(void *)&long long v32 = 0xAAAAAAAA01000000;
  *(void *)&long long v34 = &null_octet;
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v22 = (long long *)((unint64_t)&X509PolicyBAAUser & (v20 << 21 >> 63));
  if ((v20 & 0x800000) != 0) {
    uint64_t v22 = (long long *)&X509PolicyBAASystem;
  }
  if ((v20 & 0x40000800000) != 0) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = &v31;
  }
  int v24 = CTEvaluateCertsForPolicy(v14, a2, 0, 0, &v27, &v28, 0, 0, 0, &v29, v23);
  if (v24)
  {
    *(_DWORD *)(a8 + 32) = v24;
    return 0xFFFFFFFFLL;
  }
  else
  {
    if (a5 && a6)
    {
      unint64_t v25 = v30;
      *a5 = v29;
      *a6 = v25;
    }
    uint64_t result = 0;
    if (a3)
    {
      if (a4)
      {
        uint64_t result = 0;
        uint64_t v26 = v28;
        *a3 = v27;
        *a4 = v26;
      }
    }
  }
  return result;
}

uint64_t CTImg4VerifySignatureWithPublicKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (!a8) {
    return 6;
  }
  int v13 = 655617;
  *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v31 = v14;
  long long v32 = v14;
  long long v29 = v14;
  long long v30 = v14;
  long long v27 = v14;
  long long v28 = v14;
  long long v25 = v14;
  long long v26 = v14;
  v24[0] = v14;
  v24[1] = v14;
  long long v23 = v14;
  unint64_t v15 = *(void **)(a7 + 48);
  uint64_t v16 = *(void *)(*(void *)(a7 + 40) + 8);
  *((void *)&v25 + 1) = **(void **)(a7 + 40);
  *(void *)&long long v26 = v16;
  *((void *)&v27 + 1) = a3;
  *(void *)&long long v28 = a4;
  uint64_t v17 = v15[1];
  v22[0] = *v15;
  v22[1] = v17;
  if ((find_digestOID_for_signingOID((uint64_t)&v25 + 8, (void *)v24 + 1) & 1) == 0)
  {
    int v13 = 656640;
    goto LABEL_8;
  }
  uint64_t result = compare_octet_string((uint64_t)v22, (uint64_t)&rsaEncryption);
  if (!result)
  {
    uint64_t v21 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, long long *))validateSignatureRSA;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    goto LABEL_12;
  }
  if (compare_octet_string((uint64_t)v22, (uint64_t)&ecPublicKey))
  {
LABEL_8:
    uint64_t result = 4;
    goto LABEL_9;
  }
  uint64_t result = (uint64_t)oidForPubKeyLength();
  uint64_t v20 = *(void *)result;
  uint64_t v19 = *(void *)(result + 8);
  uint64_t v21 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, long long *))validateSignatureEC;
LABEL_12:
  *((void *)&v26 + 1) = v20;
  *(void *)&long long v27 = v19;
  if (a1 && !a2 || a5 && !a6)
  {
    __break(0x5519u);
    return result;
  }
  if (v21(a1, a2, a5, a6, &v23)) {
    return 0;
  }
  int v13 = 655648;
  uint64_t result = 0xFFFFFFFFLL;
LABEL_9:
  *(_DWORD *)(a8 + 32) = v13;
  return result;
}

unint64_t CTImg4CreateContext(unint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = 786435;
  if (!a5) {
    return 786433;
  }
  unint64_t v10 = result;
  *(_OWORD *)(a5 + 16) = 0u;
  *(_OWORD *)(a5 + 32) = 0u;
  *(_OWORD *)a5 = 0u;
  unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  if (!a2 || !result)
  {
    if ((a4 | 0x80000000) == 0x80000000) {
      return v5;
    }
    if ((a4 & 0x40000800000) == 0) {
      return 786436;
    }
    long long v14 = (void *)((unint64_t)&X509PolicyBAAUser & (a4 << 21 >> 63));
    if ((a4 & 0x800000) != 0) {
      long long v14 = &X509PolicyBAASystem;
    }
    unint64_t v15 = *(void *)(v14[4] + 8);
    unint64_t v22 = *(void *)v14[4];
    unint64_t v23 = v15;
    goto LABEL_14;
  }
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v21[12] = v11;
  v21[13] = v11;
  v21[10] = v11;
  v21[11] = v11;
  v21[8] = v11;
  v21[9] = v11;
  v21[6] = v11;
  v21[7] = v11;
  v21[4] = v11;
  v21[5] = v11;
  unint64_t v21[2] = v11;
  v21[3] = v11;
  v21[0] = v11;
  v21[1] = v11;
  void v20[3] = v11;
  v20[4] = v11;
  v20[1] = v11;
  int v20[2] = v11;
  v20[0] = v11;
  if (__CFADD__(result, a2))
  {
    __break(0x5513u);
  }
  else if (result + a2 >= result)
  {
    v19[0] = result;
    v19[1] = result + a2;
    int v12 = X509CertificateParse((unint64_t *)v20, v19);
    uint64_t v13 = 786435;
    if (v12) {
      return v13;
    }
    v18[0] = 0xAAAAAAAAAAAAAAAALL;
    v18[1] = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v13 = X509CertificateParseSPKI((unint64_t *)v21 + 1, &v22, 0, v18);
    if (v13) {
      return v13;
    }
LABEL_14:
    if (compare_octet_string((uint64_t)&rsaEncryption, (uint64_t)&v22))
    {
      if (compare_octet_string((uint64_t)&ecPublicKey, (uint64_t)&v22)) {
        return 655617;
      }
      int v16 = 2;
    }
    else
    {
      int v16 = 1;
    }
    uint64_t v5 = 786434;
    if (a3 > 7)
    {
      if (a3 == 8)
      {
        if (v16 == 1) {
          uint64_t v17 = _ctImg4RsaSha384Impl;
        }
        else {
          uint64_t v17 = _ctImg4EcdsaSha384Impl;
        }
      }
      else
      {
        if (a3 != 16) {
          return v5;
        }
        if (v16 == 1) {
          uint64_t v17 = _ctImg4RsaSha512Impl;
        }
        else {
          uint64_t v17 = _ctImg4EcdsaSha512Impl;
        }
      }
    }
    else if (a3 == 1)
    {
      if (v16 == 1) {
        uint64_t v17 = _ctImg4RsaSha1Impl;
      }
      else {
        uint64_t v17 = _ctImg4EcdsaSha1Impl;
      }
    }
    else
    {
      if (a3 != 4) {
        return v5;
      }
      if (v16 == 1) {
        uint64_t v17 = _ctImg4RsaSha256Impl;
      }
      else {
        uint64_t v17 = _ctImg4EcdsaSha256Impl;
      }
    }
    *(void *)a5 = v17;
    uint64_t v5 = 0;
    *(void *)(a5 + 8) = v10;
    *(void *)(a5 + 16) = a2;
    *(void *)(a5 + 24) = a4;
    return v5;
  }
  __break(0x5519u);
  return result;
}

int *find_digest(uint64_t a1)
{
  unint64_t v2 = 0;
  while (1)
  {
    uint64_t result = (int *)compare_octet_string_raw((uint64_t)&digests[v2 / 4 + 2], *(const void **)a1, *(void *)(a1 + 8));
    if (!result) {
      break;
    }
    v2 += 32;
    if (v2 == 160) {
      return 0;
    }
  }
  if (v2 <= ~(unint64_t)digests) {
    return &digests[v2 / 4];
  }
  __break(0x5513u);
  return result;
}

int *find_digest_by_type(int *result)
{
  unint64_t v1 = 0;
  while (digests[v1 / 4] != result)
  {
    v1 += 32;
    if (v1 == 160) {
      return 0;
    }
  }
  if (v1 <= ~(unint64_t)digests) {
    return &digests[v1 / 4];
  }
  __break(0x5513u);
  return result;
}

uint64_t find_digestOID_for_signingOID(uint64_t a1, void *a2)
{
  if (!compare_octet_string_raw(a1, &sha1WithRSA_oid, 9uLL)
    || !compare_octet_string_raw(a1, &sha1WithECDSA_oid, 7uLL))
  {
    uint64_t v6 = &CTOidSha1;
    uint64_t v4 = 5;
    goto LABEL_11;
  }
  uint64_t v4 = 9;
  if (!compare_octet_string_raw(a1, &sha256WithRSA_oid, 9uLL))
  {
    uint64_t v6 = &CTOidSha256;
    goto LABEL_11;
  }
  if (!compare_octet_string_raw(a1, &sha256WithECDSA_oid, 8uLL))
  {
    uint64_t v6 = &CTOidSha256;
LABEL_18:
    uint64_t v4 = 9;
    goto LABEL_11;
  }
  uint64_t v4 = 9;
  if (!compare_octet_string_raw(a1, &sha384WithRSA_oid, 9uLL))
  {
    uint64_t v6 = &CTOidSha384;
    goto LABEL_11;
  }
  if (!compare_octet_string_raw(a1, &sha384WithECDSA_oid, 8uLL))
  {
    uint64_t v6 = &CTOidSha384;
    goto LABEL_18;
  }
  uint64_t v4 = 9;
  if (compare_octet_string_raw(a1, &sha512WithRSA_oid, 9uLL))
  {
    if (compare_octet_string_raw(a1, &sha512WithECDSA_oid, 8uLL)) {
      return 0;
    }
    uint64_t v6 = &CTOidSha512;
    goto LABEL_18;
  }
  uint64_t v6 = &CTOidSha512;
LABEL_11:
  *a2 = v6;
  a2[1] = v4;
  return 1;
}

unint64_t validateSignatureRSA(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t result = 0;
  uint64_t v34 = *MEMORY[0x263EF8340];
  char v30 = 0;
  if (a1)
  {
    if (a2)
    {
      unint64_t result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            unint64_t result = compare_octet_string((uint64_t)&rsaEncryption, (uint64_t)(a5 + 7));
            if (!result
              || (unint64_t result = validateOIDs((uint64_t)&rsaAlgs, (uint64_t)(a5 + 3), (uint64_t)(a5 + 7)), result))
            {
              unint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
              unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
              unint64_t v10 = a5[9];
              uint64_t v9 = a5[10];
              if (__CFADD__(v10, v9)) {
                goto LABEL_31;
              }
              if (v10 > v10 + v9) {
                goto LABEL_32;
              }
              unint64_t v28 = a5[9];
              unint64_t v29 = v10 + v9;
              if (!v9 || (unint64_t result = ccder_blob_check_null(), result))
              {
                if (!__CFADD__(a1, a2))
                {
                  if (a1 + a2 >= a1)
                  {
                    unint64_t result = ccder_decode_rsa_pub_n();
                    if (!result) {
                      return result;
                    }
                    unint64_t v11 = result;
                    if (result >> 58)
                    {
LABEL_33:
                      __break(0x550Cu);
                      return result;
                    }
                    unint64_t v12 = result << 6;
                    if (result << 6 < 0x400) {
                      return 0;
                    }
                    unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
                    __int16 v33 = -21846;
                    char v31 = 6;
                    if (&vars0 != (uint64_t *)82)
                    {
                      unint64_t v13 = a5[4];
                      LOBYTE(v32) = v13;
                      if ((unint64_t)&v31 <= 0xFFFFFFFFFFFFFFFDLL)
                      {
                        if (v13 <= 9)
                        {
                          uint64_t v14 = __memcpy_chk();
                          if (v12 > 0x1068) {
                            return 0;
                          }
                          unint64_t result = MEMORY[0x270FA5388](v14, v15, v16, v17, v18, v19, v20, v21);
                          unint64_t v23 = (unint64_t *)((char *)&v27 - v22);
                          unint64_t v24 = 0;
                          *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
                          *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
                          do
                          {
                            long long v26 = &v23[v24 / 8];
                            *(_OWORD *)long long v26 = v25;
                            *((_OWORD *)v26 + 1) = v25;
                            v24 += 32;
                          }
                          while (v22 != v24);
                          if (v22 >= 1)
                          {
                            *unint64_t v23 = v11;
                            if (ccrsa_import_pub()) {
                              return 0;
                            }
                            if (!ccrsa_verify_pkcs1v15_allowshortsigs()) {
                              return v30 != 0;
                            }
                            unint64_t result = 0;
                            char v30 = 0;
                            return result;
                          }
                        }
                        goto LABEL_32;
                      }
                    }
                    goto LABEL_31;
                  }
LABEL_32:
                  __break(0x5519u);
                  goto LABEL_33;
                }
LABEL_31:
                __break(0x5513u);
                goto LABEL_32;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL validateOIDs(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = 0;
  BOOL v7 = 1;
  do
  {
    if (!compare_octet_string(a1, a2) && !compare_octet_string(a1 + 16, a3)) {
      break;
    }
    BOOL v7 = v6 < 3;
    a1 += 32;
    ++v6;
  }
  while (v6 != 4);
  return v7;
}

_UNKNOWN **oidForPubKeyLength()
{
  uint64_t v0 = ccec_x963_import_pub_size();
  int is_supported = ccec_keysize_is_supported();
  unint64_t v2 = &CTOidSECP256r1;
  uint64_t v3 = &CTOidSECP521r1;
  uint64_t v4 = &CTOidSECP384r1;
  if (v0 != 384) {
    uint64_t v4 = 0;
  }
  if (v0 != 521) {
    uint64_t v3 = v4;
  }
  if (v0 != 256) {
    unint64_t v2 = v3;
  }
  if (is_supported) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t validateSignatureEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0;
  uint64_t v25 = *MEMORY[0x263EF8340];
  HIBYTE(v24) = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (!compare_octet_string((uint64_t)&ecPublicKey, a5 + 56)
              || (uint64_t result = validateOIDs((uint64_t)&ecAlgs, a5 + 24, a5 + 56), result))
            {
              uint64_t result = ccec_cp_for_oid((int **)(a5 + 72));
              if (result)
              {
                uint64_t v15 = *(void *)result;
                if (*(void *)result >> 61 || !is_mul_ok(8 * v15, 3uLL))
                {
                  __break(0x550Cu);
                }
                else
                {
                  uint64_t v16 = 24 * v15;
                  BOOL v17 = __CFADD__(v16, 16);
                  unint64_t v18 = v16 + 16;
                  if (!v17 && v18 < 0xFFFFFFFFFFFFFFF0)
                  {
                    uint64_t result = MEMORY[0x270FA5388](result, v8, v9, v10, v11, v12, v13, v14);
                    uint64_t v21 = (uint64_t *)((char *)&v24 - v19);
                    unint64_t v22 = 0;
                    do
                    {
                      unint64_t v23 = &v21[v22 / 8];
                      *unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
                      v23[1] = 0xAAAAAAAAAAAAAAAALL;
                      v22 += 16;
                    }
                    while (v19 != v22);
                    if (v20 >= 0x10)
                    {
                      *uint64_t v21 = result;
                      if (v19 >= 1)
                      {
                        if (!MEMORY[0x263E6E620]())
                        {
                          uint64_t result = ccec_x963_import_pub_size();
                          if (result == 256 && *(void *)(a5 + 96) == 64)
                          {
                            if (*(void *)(a5 + 88) < 0xFFFFFFFFFFFFFFE0)
                            {
                              if (!ccec_verify_composite()) {
                                return HIBYTE(v24) != 0;
                              }
                              goto LABEL_24;
                            }
LABEL_31:
                            __break(0x5513u);
                            return result;
                          }
                          if (ccec_verify()) {
LABEL_24:
                          }
                            HIBYTE(v24) = 0;
                        }
                        return HIBYTE(v24) != 0;
                      }
LABEL_30:
                      __break(0x5519u);
                      goto LABEL_31;
                    }
LABEL_29:
                    __break(1u);
                    goto LABEL_30;
                  }
                }
                __break(0x5500u);
                goto LABEL_29;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t ccec_cp_for_oid(int **a1)
{
  if (!a1) {
    return 0;
  }
  unint64_t v1 = a1[1];
  if (v1 != (int *)7)
  {
    if (v1 == (int *)10 && *(void *)*a1 == 0x33DCE48862A0806 && *((_WORD *)*a1 + 4) == 1793) {
      JUMPOUT(0x263E6E5D0);
    }
    return 0;
  }
  uint64_t v3 = *a1;
  if (**a1 == -2127887098 && *(int *)((char *)*a1 + 3) == 570426497) {
    JUMPOUT(0x263E6E5E0);
  }
  int v5 = *v3;
  int v6 = *(int *)((char *)v3 + 3);
  if (v5 != -2127887098 || v6 != 587203713) {
    return 0;
  }
  return MEMORY[0x270ED8AA8]();
}

uint64_t compressECPublicKey(void *a1, int **a2, uint64_t a3, uint64_t a4)
{
  v26[1] = *MEMORY[0x263EF8340];
  BOOL v7 = (void *)ccec_cp_for_oid(a2);
  if (!v7) {
    return 655366;
  }
  uint64_t v15 = v7;
  uint64_t v16 = *v7;
  if (*v7 >> 61 || !is_mul_ok(8 * v16, 3uLL))
  {
    __break(0x550Cu);
    goto LABEL_19;
  }
  uint64_t v17 = 24 * v16;
  BOOL v18 = __CFADD__(v17, 16);
  unint64_t v19 = v17 + 16;
  if (v18 || v19 >= 0xFFFFFFFFFFFFFFF0) {
LABEL_19:
  }
    __break(0x5500u);
  uint64_t result = MEMORY[0x270FA5388](v7, v8, v9, v10, v11, v12, v13, v14);
  unint64_t v23 = (void *)((char *)v26 - v21);
  unint64_t v24 = 0;
  do
  {
    uint64_t v25 = &v23[v24 / 8];
    *uint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
    v25[1] = 0xAAAAAAAAAAAAAAAALL;
    v24 += 16;
  }
  while (v21 != v24);
  if (v22 < 0x10) {
    goto LABEL_21;
  }
  *unint64_t v23 = v15;
  if (v21 < 1)
  {
LABEL_20:
    __break(0x5519u);
LABEL_21:
    __break(1u);
    return result;
  }
  uint64_t result = MEMORY[0x263E6E620](v15, a1[1], *a1, (char *)v26 - v21);
  if (!result)
  {
    uint64_t result = ccec_compressed_x962_export_pub_size();
    if (result == a4)
    {
      if (!a3 || a4) {
        return ccec_compressed_x962_export_pub();
      }
      goto LABEL_20;
    }
    return 393220;
  }
  return result;
}

unint64_t decompressECPublicKey(uint64_t a1, int **a2, uint64_t a3, uint64_t a4)
{
  v25[1] = *MEMORY[0x263EF8340];
  int v6 = (uint64_t *)ccec_cp_for_oid(a2);
  if (!v6) {
    return 655366;
  }
  uint64_t v14 = *v6;
  if ((unint64_t)*v6 >> 61 || !is_mul_ok(8 * v14, 3uLL)) {
LABEL_22:
  }
    __break(0x550Cu);
  uint64_t v15 = 24 * v14;
  BOOL v16 = __CFADD__(v15, 16);
  unint64_t v17 = v15 + 16;
  if (v16 || v17 >= 0xFFFFFFFFFFFFFFF0)
  {
LABEL_21:
    __break(0x5500u);
    goto LABEL_22;
  }
  unint64_t result = MEMORY[0x270FA5388](v6, v7, v8, v9, v10, v11, v12, v13);
  uint64_t v21 = (void *)((char *)v25 - v19);
  unint64_t v22 = 0;
  do
  {
    unint64_t v23 = &v21[v22 / 8];
    *unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
    v23[1] = 0xAAAAAAAAAAAAAAAALL;
    v22 += 16;
  }
  while (v19 != v22);
  if (v20 < 0x10) {
    goto LABEL_24;
  }
  *uint64_t v21 = result;
  if (v19 >= 1)
  {
    uint64_t v24 = ccec_compressed_x962_import_pub();
    if (!v24)
    {
      unint64_t result = cczp_bitlen();
      if (result < 0xFFFFFFFFFFFFFFF9)
      {
        if (!a3 || a4)
        {
          if ((((result + 7) >> 2) | 1) == a4) {
            uint64_t v24 = 0;
          }
          else {
            uint64_t v24 = 393220;
          }
          ccec_export_pub();
          return v24;
        }
        goto LABEL_23;
      }
      goto LABEL_21;
    }
    return v24;
  }
LABEL_23:
  __break(0x5519u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t CMSParseContentInfoSignedDataWithOptions(unsigned __int8 *a1, uint64_t a2, unint64_t *a3, char a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  unint64_t v28 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v29 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2)) {
    goto LABEL_114;
  }
  if (&a1[a2] < a1) {
    goto LABEL_112;
  }
  int v4 = 65537;
  unint64_t v28 = a1;
  unint64_t v29 = &a1[a2];
  __int16 v27 = 0;
  size_t v26 = 0xAAAAAAAAAAAAAAAALL;
  int v7 = ccder_blob_decode_ber_tl(&v28, 0x2000000000000010, (unsigned char *)&v27 + 1, &v26);
  uint64_t result = 65537;
  if (v7)
  {
    uint64_t v24 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    uint64_t v25 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v28, v26)) {
      goto LABEL_114;
    }
    if (v28 > &v28[v26] || &v28[v26] > v29) {
      goto LABEL_112;
    }
    uint64_t v24 = v28;
    uint64_t v25 = &v28[v26];
    if (ccder_blob_decode_tl())
    {
      if (v25 < v24 || v26 > v25 - v24) {
        goto LABEL_112;
      }
      if (compare_octet_string_raw((uint64_t)&pkcs7_signedData_oid, v24, v26)) {
        return 65539;
      }
      if (__CFADD__(v24, v26)) {
        goto LABEL_114;
      }
      if (v24 > &v24[v26] || &v24[v26] > v25) {
        goto LABEL_112;
      }
      v24 += v26;
      if (!ccder_blob_decode_ber_tl(&v24, 0xA000000000000000, &v27, &v26)) {
        return 65540;
      }
      unint64_t v22 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
      unint64_t v23 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v24, v26)) {
        goto LABEL_114;
      }
      if (v24 > &v24[v26] || &v24[v26] > v25) {
        goto LABEL_112;
      }
      unint64_t v22 = v24;
      unint64_t v23 = &v24[v26];
      __int16 v31 = 0;
      memset(v30, 170, sizeof(v30));
      if ((ccder_blob_decode_ber_tl(&v22, 0x2000000000000010, (unsigned char *)&v31 + 1, v30) & 1) == 0) {
        return 131073;
      }
      if (__CFADD__(v22, v30[0])) {
        goto LABEL_114;
      }
      uint64_t v9 = 131080;
      if (&v22[v30[0]] != v23) {
        return 131082;
      }
      uint64_t v10 = a3 + 11;
      if (!ccder_blob_decode_uint64()) {
        return 131074;
      }
      uint64_t result = 131092;
      if (*v10 <= 4uLL && ((1 << *v10) & 0x1A) != 0)
      {
        if (!ccder_blob_eat_ber_inner(&v22, 0x2000000000000011, 0, 125)) {
          return 131075;
        }
        unsigned __int8 v35 = 0;
        size_t v34 = 0;
        if ((ccder_blob_decode_ber_tl(&v22, 0x2000000000000010, &v35, &v34) & 1) == 0) {
          return 131076;
        }
        unint64_t v32 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        __int16 v33 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        if (__CFADD__(v22, v34)) {
          goto LABEL_114;
        }
        if (v22 > &v22[v34] || &v22[v34] > v23) {
          goto LABEL_112;
        }
        unint64_t v32 = v22;
        __int16 v33 = &v22[v34];
        if (!ccder_blob_decode_tl()) {
          return 131077;
        }
        if (v33 < v32 || v34 > v33 - v32) {
          goto LABEL_112;
        }
        if (compare_octet_string_raw((uint64_t)&pkcs7_data_oid, v32, v34)) {
          return 131078;
        }
        if (__CFADD__(v32, v34)) {
          goto LABEL_114;
        }
        uint64_t v11 = &v32[v34];
        if (v32 > &v32[v34] || v11 > v33) {
          goto LABEL_112;
        }
        v32 += v34;
        int v12 = v35;
        if (v11 != v33 || v35)
        {
          unsigned __int8 v40 = 0;
          uint64_t v38 = v33;
          unint64_t v39 = 0;
          long long v37 = v11;
          if (ccder_blob_decode_ber_tl(&v37, 0xA000000000000000, &v40, &v39))
          {
            if (!v12)
            {
              if (__CFADD__(v37, v39)) {
                goto LABEL_114;
              }
              if (&v37[v39] != v33) {
                return v9;
              }
            }
            if (v37 > v38) {
              goto LABEL_112;
            }
            unint64_t v32 = v37;
            __int16 v33 = v38;
            unsigned __int8 v36 = 0;
            int v16 = v40;
            if (v40 && !ccder_blob_decode_ber_tl(&v32, 0x2000000000000004, &v36, &v39)) {
              return 131079;
            }
            unint64_t v41 = 0;
            if (!ccder_blob_decode_tl()) {
              return 131090;
            }
            unint64_t v17 = v32;
            BOOL v18 = v33;
            if (v33 < v32) {
              goto LABEL_112;
            }
            unint64_t v19 = v41;
            if (v41 > v33 - v32) {
              goto LABEL_112;
            }
            a3[9] = (unint64_t)v32;
            a3[10] = v19;
            if (__CFADD__(v17, v19))
            {
LABEL_114:
              __break(0x5513u);
              return 0;
            }
            unint64_t v20 = &v17[v19];
            if (v20 > v18 || v17 > v20) {
              goto LABEL_112;
            }
            unint64_t v32 = v20;
            if ((ccder_blob_decode_eoc((unint64_t *)&v32, v36) & 1) == 0) {
              return 131089;
            }
          }
          else
          {
            if (!v12) {
              return v9;
            }
            int v16 = v40;
          }
          if ((ccder_blob_decode_eoc((unint64_t *)&v32, v16 != 0) & 1) == 0) {
            return 131088;
          }
          uint64_t v11 = v32;
        }
        if (v11 > v23 || v22 > v11) {
          goto LABEL_112;
        }
        unint64_t v22 = v11;
        if ((ccder_blob_decode_eoc((unint64_t *)&v22, v12 != 0) & 1) == 0) {
          return 131081;
        }
        long long v37 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        uint64_t v38 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        if (v22 > v23) {
          goto LABEL_112;
        }
        long long v37 = v22;
        uint64_t v38 = v23;
        if ((ccder_blob_decode_ber_tl(&v37, 0xA000000000000000, &v31, v30) & 1) == 0)
        {
          uint64_t v13 = v22;
          uint64_t v15 = v23;
          goto LABEL_86;
        }
        unint64_t v32 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        __int16 v33 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        if (!__CFADD__(v37, v30[0]))
        {
          if (v37 > &v37[v30[0]] || &v37[v30[0]] > v38) {
            goto LABEL_112;
          }
          unint64_t v32 = v37;
          __int16 v33 = &v37[v30[0]];
          if (!CMSParseImplicitCertificateSet(&v32, a3[1], *a3, a3 + 3, a3 + 2)) {
            return 131085;
          }
          if (!ccder_blob_decode_eoc((unint64_t *)&v32, v31)) {
            return 131086;
          }
          uint64_t v13 = v32;
          if (v32 - v37 >= 0 ? v32 >= v37 : v32 < v37)
          {
            if (v37 > v32) {
              goto LABEL_112;
            }
            uint64_t v15 = v38;
            if (v32 > v38) {
              goto LABEL_112;
            }
            unint64_t v22 = v32;
            unint64_t v23 = v38;
LABEL_86:
            if (v13 <= v15)
            {
              long long v37 = v13;
              uint64_t v38 = v15;
              if (ccder_blob_eat_ber_inner(&v37, 0xA000000000000001, 0, 125))
              {
                if (v37 > v38) {
                  goto LABEL_112;
                }
                unint64_t v22 = v37;
                unint64_t v23 = v38;
              }
              if (!ccder_blob_eat_ber_inner(&v22, 0x2000000000000011, (unsigned __int8 **)&v30[1], 125)) {
                return 131083;
              }
              if (v30[2] >= v30[1])
              {
                uint64_t v21 = &v22[-v30[1]];
                if ((unint64_t)&v22[-v30[1]] <= v30[2] - v30[1])
                {
                  a3[5] = v30[1];
                  a3[6] = (unint64_t)v21;
                  if ((ccder_blob_decode_eoc((unint64_t *)&v22, HIBYTE(v31)) & 1) == 0) {
                    return 131084;
                  }
                  if (!ccder_blob_decode_eoc((unint64_t *)&v22, v27)) {
                    return 65541;
                  }
                  if (v22 <= v25 && v24 <= v22)
                  {
                    uint64_t v24 = v22;
                    if (ccder_blob_decode_eoc((unint64_t *)&v24, HIBYTE(v27)))
                    {
                      if ((a4 & 1) == 0 && v24 != v29) {
                        return 65543;
                      }
                      return 0;
                    }
                    return (v4 + 5);
                  }
                }
              }
            }
LABEL_112:
            __break(0x5519u);
            return (v4 + 5);
          }
        }
        goto LABEL_114;
      }
    }
    else
    {
      return 65538;
    }
  }
  return result;
}

uint64_t ccder_blob_decode_ber_tl(unsigned __int8 **a1, uint64_t a2, unsigned char *a3, unint64_t *a4)
{
  int v8 = ccder_blob_decode_tag();
  uint64_t result = 0;
  if (v8)
  {
    if (a2 == 0xAAAAAAAAAAAAAAAALL) {
      return ccder_blob_decode_ber_len(a1, a3, a4);
    }
  }
  return result;
}

uint64_t ccder_blob_decode_eoc(unint64_t *a1, int a2)
{
  if (!a2) {
    return 1;
  }
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return result;
  }
  unint64_t v4 = *a1;
  if (*a1 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_12:
    __break(0x5519u);
    return result;
  }
  unint64_t v5 = v4 - 0x5555555555555556;
  if (v4 > v4 - 0x5555555555555556 || v5 > a1[1]) {
    goto LABEL_12;
  }
  *a1 = v5;
  return 1;
}

uint64_t CMSParseContentInfoSignedData(unsigned __int8 *a1, uint64_t a2, unint64_t *a3)
{
  return CMSParseContentInfoSignedDataWithOptions(a1, a2, a3, 0);
}

uint64_t CMSParseSignerInfos(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, long long *))
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  uint64_t v84 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v85 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  if (__CFADD__(v4, v3)) {
    goto LABEL_93;
  }
  if (v4 > v4 + v3) {
    goto LABEL_92;
  }
  uint64_t v84 = *(unsigned __int8 **)(a1 + 40);
  uint64_t v85 = (unsigned __int8 *)(v4 + v3);
  unint64_t v72 = 0xAAAAAAAAAAAAAAAALL;
  if (v4 >= v4 + v3)
  {
    unsigned int v48 = 0;
    uint64_t result = 0;
    if (v3) {
      return (v48 << 8) | 0x30008;
    }
    return result;
  }
  unsigned int v6 = 0;
  unsigned __int8 v60 = 0;
  int v7 = 256;
  while (1)
  {
    unsigned __int8 v71 = 0;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    DWORD2(v83) = 327681;
    LOBYTE(v82) = v6 + 1;
    if ((ccder_blob_decode_ber_tl(&v84, 0x2000000000000010, &v71, &v72) & 1) == 0)
    {
      int v49 = 196609;
      return v7 | v49;
    }
    uint64_t v69 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    int v70 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v84, v72)) {
      goto LABEL_93;
    }
    if (v84 > &v84[v72] || &v84[v72] > v85) {
      goto LABEL_92;
    }
    uint64_t v69 = v84;
    int v70 = &v84[v72];
    if ((ccder_blob_decode_uint64() & 1) == 0)
    {
      int v49 = 196610;
      return v7 | v49;
    }
    uint64_t v9 = v69;
    int v8 = v70;
    uint64_t v67 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v68 = 0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70) {
      goto LABEL_92;
    }
    uint64_t v67 = v69;
    unint64_t v68 = (unint64_t)v70;
    uint64_t v65 = v69;
    uint64_t v66 = v70;
    if (!ccder_blob_decode_tl()) {
      break;
    }
    uint64_t v10 = v69;
LABEL_19:
    if (__CFADD__(v72, v10 - v9)) {
      goto LABEL_94;
    }
    if (v72 + v10 - v9 > v8 - v9) {
      goto LABEL_92;
    }
    *((void *)&v73 + 1) = v9;
    *(void *)&long long v74 = v72 + v10 - v9;
    if (__CFADD__(v10, v72)) {
      goto LABEL_93;
    }
    if (v10 > &v10[v72] || &v10[v72] > v70) {
      goto LABEL_92;
    }
    uint64_t v69 = &v10[v72];
    if (!ccder_blob_decode_AlgorithmIdentifierNULL((unint64_t *)&v69, (unint64_t *)&v74 + 1))
    {
      int v49 = 196612;
      return v7 | v49;
    }
    uint64_t v63 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    uint64_t v64 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70) {
      goto LABEL_92;
    }
    uint64_t v63 = v69;
    uint64_t v64 = v70;
    if (ccder_blob_decode_tl())
    {
      if (v64 < v63 || v72 > v64 - v63) {
        goto LABEL_92;
      }
      *((void *)&v75 + 1) = v63;
      *(void *)&long long v76 = v72;
      if (__CFADD__(v63, v72)) {
        goto LABEL_93;
      }
      if (v63 > &v63[v72] || &v63[v72] > v64) {
        goto LABEL_92;
      }
      uint64_t v69 = &v63[v72];
      int v70 = v64;
    }
    else
    {
      *((void *)&v75 + 1) = 0;
      *(void *)&long long v76 = 0;
    }
    if ((ccder_blob_decode_AlgorithmIdentifierNULL((unint64_t *)&v69, (unint64_t *)&v76 + 1) & 1) == 0)
    {
      int v49 = 196613;
      return v7 | v49;
    }
    if ((ccder_blob_decode_tl() & 1) == 0)
    {
      int v49 = 196614;
      return v7 | v49;
    }
    if (v70 < v69 || v72 > v70 - v69) {
      goto LABEL_92;
    }
    *((void *)&v78 + 1) = v69;
    *(void *)&long long v79 = v72;
    if (__CFADD__(v69, v72)) {
      goto LABEL_93;
    }
    int v12 = &v69[v72];
    if (v69 > &v69[v72] || v12 > v70) {
      goto LABEL_92;
    }
    v69 += v72;
    uint64_t v63 = v12;
    uint64_t v64 = v70;
    if (ccder_blob_eat_ber_inner(&v63, 0xA000000000000001, 0, 125))
    {
      if (v63 > v64) {
        goto LABEL_92;
      }
      uint64_t v69 = v63;
      int v70 = v64;
    }
    if ((ccder_blob_decode_eoc((unint64_t *)&v69, v71) & 1) == 0)
    {
      int v49 = 196615;
      return v7 | v49;
    }
    digest = find_digest((uint64_t)&v74 + 8);
    if (digest)
    {
      uint64_t v14 = digest;
      unsigned int v15 = *(_DWORD *)(a1 + 96);
      if (!v15 || *digest <= v15)
      {
        uint64_t result = a3(a2, a1, &v73);
        if (result != 327710)
        {
          if (result) {
            return result;
          }
          unint64_t v17 = *(void *)(a1 + 64);
          if (v17 <= v60)
          {
            if (v17)
            {
              int v29 = v60 - 1;
              unint64_t v30 = *(void *)(a1 + 56);
              uint64_t v31 = 176 * v29;
              if (__CFADD__(v30, v31)) {
                goto LABEL_93;
              }
              unint64_t v32 = v30 + 176 * v29;
              if (v32 >= v30 + 176 * v17 || v32 < v30) {
                goto LABEL_92;
              }
              __int16 v33 = find_digest(v30 + 176 * v29 + 24);
              if (v33)
              {
                if (*v14 > *v33)
                {
                  unsigned int v34 = *(_DWORD *)(a1 + 96);
                  if (!v34 || *v14 <= v34)
                  {
                    unint64_t v35 = *(void *)(a1 + 56);
                    if (__CFADD__(v35, v31)) {
                      goto LABEL_93;
                    }
                    unsigned __int8 v36 = (_OWORD *)(v35 + 176 * v29);
                    unint64_t v37 = v35 + 176 * *(void *)(a1 + 64);
                    BOOL v38 = v37 >= (unint64_t)v36;
                    unint64_t v39 = v37 - (void)v36;
                    if (!v38 || v35 > (unint64_t)v36 || v39 < 0xB0) {
                      goto LABEL_92;
                    }
                    long long v40 = v73;
                    long long v41 = v75;
                    v36[1] = v74;
                    _OWORD v36[2] = v41;
                    *unsigned __int8 v36 = v40;
                    long long v42 = v76;
                    long long v43 = v77;
                    long long v44 = v79;
                    _OWORD v36[5] = v78;
                    v36[6] = v44;
                    v36[3] = v42;
                    v36[4] = v43;
                    long long v45 = v80;
                    long long v46 = v81;
                    long long v47 = v83;
                    v36[9] = v82;
                    v36[10] = v47;
                    _OWORD v36[7] = v45;
                    _OWORD v36[8] = v46;
                  }
                }
              }
            }
          }
          else
          {
            unsigned int v18 = *(_DWORD *)(a1 + 96);
            if (!v18 || *v14 <= v18)
            {
              uint64_t v19 = *(void *)(a1 + 56);
              if (__CFADD__(v19, 176 * (char)v60)) {
                goto LABEL_93;
              }
              unint64_t v20 = (_OWORD *)(v19 + 176 * v60);
              if (176 * v17 - 176 * v60 < 0xB0) {
                goto LABEL_92;
              }
              long long v21 = v73;
              long long v22 = v75;
              v20[1] = v74;
              int v20[2] = v22;
              *unint64_t v20 = v21;
              long long v23 = v76;
              long long v24 = v77;
              long long v25 = v79;
              _OWORD v20[5] = v78;
              long long v20[6] = v25;
              void v20[3] = v23;
              v20[4] = v24;
              long long v26 = v80;
              long long v27 = v81;
              long long v28 = v83;
              v20[9] = v82;
              v20[10] = v28;
              v20[7] = v26;
              v20[8] = v27;
              if (v60 == 0xFF)
              {
                __break(0x5507u);
                return result;
              }
              ++v60;
            }
          }
        }
      }
    }
    if (v69 > v85 || v84 > v69) {
      goto LABEL_92;
    }
    uint64_t v84 = v69;
    unsigned int v48 = v6 + 1;
    if (v6 <= 6)
    {
      v7 += 256;
      ++v6;
      if (v69 < v85) {
        continue;
      }
    }
    if (v69 == v85)
    {
      if (v60) {
        return 0;
      }
      uint64_t v50 = *(void *)(a1 + 64);
      if (!v50) {
        return 0;
      }
      if ((unint64_t)(176 * v50) >= 0xB0)
      {
        uint64_t result = 0;
        uint64_t v51 = *(_OWORD **)(a1 + 56);
        long long v52 = v73;
        long long v53 = v75;
        v51[1] = v74;
        v51[2] = v53;
        *uint64_t v51 = v52;
        long long v54 = v76;
        long long v55 = v77;
        long long v56 = v79;
        _OWORD v51[5] = v78;
        v51[6] = v56;
        v51[3] = v54;
        v51[4] = v55;
        long long v57 = v80;
        long long v58 = v81;
        long long v59 = v83;
        v51[9] = v82;
        v51[10] = v59;
        v51[7] = v57;
        v51[8] = v58;
        return result;
      }
LABEL_92:
      __break(0x5519u);
LABEL_93:
      __break(0x5513u);
LABEL_94:
      __break(0x5500u);
    }
    return (v48 << 8) | 0x30008;
  }
  if (ccder_blob_decode_tl())
  {
    uint64_t v10 = v67;
    uint64_t v11 = (unsigned __int8 *)v68;
LABEL_17:
    if (v10 > v11) {
      goto LABEL_92;
    }
    uint64_t v69 = v10;
    int v70 = v11;
    goto LABEL_19;
  }
  if (ccder_blob_decode_tl())
  {
    uint64_t v10 = v65;
    uint64_t v11 = v66;
    goto LABEL_17;
  }
  int v49 = 196611;
  return v7 | v49;
}

uint64_t CMSBuildPath(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v3 = *(void *)(a3 + 8);
  uint64_t v4 = *(void *)(a3 + 16);
  if (__CFADD__(v3, v4)) {
LABEL_49:
  }
    __break(0x5513u);
  unint64_t v5 = v3 + v4;
  if (v3 > v5) {
    goto LABEL_48;
  }
  unint64_t v20 = *(void *)(a3 + 8);
  unint64_t v21 = v5;
  unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  if (*(void *)a3 != 3)
  {
    if (*(void *)a3 != 1) {
      return 524289;
    }
    uint64_t v8 = 524293;
    if (!ccder_blob_decode_tl()) {
      return 524290;
    }
    if (!ccder_blob_decode_tl()) {
      return 524291;
    }
    if (v21 >= v20 && v19 <= v21 - v20)
    {
      unint64_t v15 = v20;
      unint64_t v16 = v19;
      if (__CFADD__(v20, v19)) {
        goto LABEL_49;
      }
      if (v20 <= v20 + v19 && v20 + v19 <= v21)
      {
        v20 += v19;
        if (!ccder_blob_decode_tl()) {
          return 524292;
        }
        if (v21 >= v20 && v19 <= v21 - v20)
        {
          unint64_t v17 = v20;
          unint64_t v18 = v19;
          if (__CFADD__(v20, v19)) {
            goto LABEL_49;
          }
          if (v20 <= v20 + v19 && v20 + v19 <= v21)
          {
            v20 += v19;
            uint64_t v9 = *(void **)(a2 + 24);
            if (!v9) {
              return v8;
            }
            while (compare_octet_string((uint64_t)&v15, (uint64_t)(v9 + 15))
                 || compare_octet_string((uint64_t)&v17, (uint64_t)(v9 + 17)))
            {
              uint64_t v9 = (void *)v9[34];
              if (!v9) {
                return v8;
              }
            }
            goto LABEL_36;
          }
        }
      }
    }
    goto LABEL_48;
  }
  if (*(void *)(a2 + 88) == 1) {
    return 524298;
  }
  unint64_t v15 = v3;
  unint64_t v16 = v5;
  if (ccder_blob_decode_tl())
  {
    unint64_t v11 = v20;
    unint64_t v10 = v21;
    goto LABEL_29;
  }
  uint64_t v8 = 524294;
  if (!ccder_blob_decode_tl() || !ccder_blob_decode_tl()) {
    return v8;
  }
  unint64_t v11 = v15;
  unint64_t v10 = v16;
  if (v15 > v16)
  {
LABEL_48:
    __break(0x5519u);
    goto LABEL_49;
  }
  unint64_t v20 = v15;
  unint64_t v21 = v16;
LABEL_29:
  if (v10 < v11 || v19 > v10 - v11) {
    goto LABEL_48;
  }
  unint64_t v17 = v11;
  unint64_t v18 = v19;
  if (__CFADD__(v11, v19)) {
    goto LABEL_49;
  }
  if (v11 > v11 + v19 || v11 + v19 > v10) {
    goto LABEL_48;
  }
  unint64_t v20 = v11 + v19;
  uint64_t CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier((uint64_t *)(a2 + 24), (uint64_t)&v17);
  if (!CertificateUsingKeyIdentifier) {
    return 524295;
  }
  uint64_t v9 = (void *)CertificateUsingKeyIdentifier;
LABEL_36:
  if (v20 != v21) {
    return 524543;
  }
  uint64_t v13 = X509ChainBuildPath(v9, (uint64_t *)(a2 + 24), (void *)(a3 + 152));
  uint64_t v8 = v13;
  if (*(_DWORD *)(a3 + 168) == 327681) {
    *(_DWORD *)(a3 + 168) = v13;
  }
  return v8;
}

uint64_t validateSignerInfo(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  uint64_t v6 = a3 + 24;
  digest = find_digest(a3 + 24);
  if (!digest) {
    return 327682;
  }
  uint64_t v8 = (unint64_t *)(*((uint64_t (**)(void))digest + 3))();
  uint64_t v9 = v8;
  memset(v93, 0, sizeof(v93));
  unint64_t v10 = (_OWORD *)a2[13];
  unint64_t v11 = a2[14];
  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (a2[9] && a2[10])
    {
      unint64_t v10 = v93;
      uint64_t v13 = ccdigest();
      unint64_t v11 = *v9;
      if (*v9 >= 0x41) {
        goto LABEL_180;
      }
      goto LABEL_16;
    }
    if (!v10) {
      goto LABEL_144;
    }
  }
  if (*v8 != v11)
  {
LABEL_144:
    *(_DWORD *)(a3 + 168) = 327710;
    return 327710;
  }
  if (v11 > 0x40) {
    goto LABEL_180;
  }
  uint64_t v13 = __memcpy_chk();
LABEL_16:
  *(void *)(a3 + 128) = v10;
  *(void *)(a3 + 136) = v11;
  unint64_t v15 = (void *)(a3 + 128);
  uint64_t v16 = *(void *)(a3 + 48);
  if (!v16) {
    goto LABEL_159;
  }
  uint64_t v78 = a1;
  uint64_t v86 = (char *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v87 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v17 = *(void *)(a3 + 40);
  if (__CFADD__(v17, v16)) {
    goto LABEL_181;
  }
  unint64_t v18 = v17 + v16;
  if (v17 > v18)
  {
LABEL_180:
    __break(0x5519u);
    goto LABEL_181;
  }
  uint64_t v86 = *(char **)(a3 + 40);
  unint64_t v87 = v18;
  unint64_t v85 = 0xAAAAAAAAAAAAAAAALL;
  if (v17 < v18)
  {
    int v19 = 0;
    uint64_t v81 = 0x2000000000000010;
    unsigned int v77 = 262146;
    unsigned int v80 = 262147;
    unsigned int v79 = 262148;
    do
    {
      if (!ccder_blob_decode_tl())
      {
        uint64_t result = 262145;
        goto LABEL_176;
      }
      if (__CFADD__(v86, v85)) {
        goto LABEL_181;
      }
      unint64_t v20 = &v86[v85];
      uint64_t v84 = (char *)0xAAAAAAAAAAAAAAAALL;
      long long v83 = (char *)0xAAAAAAAAAAAAAAAALL;
      if (v86 > &v86[v85] || (unint64_t)v20 > v87) {
        goto LABEL_180;
      }
      long long v83 = v86;
      uint64_t v84 = &v86[v85];
      if (!ccder_blob_decode_tl())
      {
        uint64_t result = v77;
        goto LABEL_176;
      }
      uint64_t v22 = v83;
      if (__CFADD__(v83, v85)) {
        goto LABEL_181;
      }
      if (v83 > &v83[v85] || &v83[v85] > v84) {
        goto LABEL_180;
      }
      v83 += v85;
      if (v85 != 9) {
        goto LABEL_147;
      }
      if (*(void *)v22 == 0x9010DF78648862ALL && v22[8] == 3)
      {
        if (v19) {
          goto LABEL_149;
        }
        *(void *)uint64_t v91 = 0xAAAAAAAAAAAAAAAALL;
        int v33 = ccder_blob_decode_tl();
        uint64_t result = v80;
        if (v33)
        {
          if (CMSAttributeParseContentType(&v83)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v79;
          }
        }
        v19 |= 1u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x9010DF78648862ALL && v22[8] == 4)
      {
        if ((v19 & 2) != 0) {
          goto LABEL_149;
        }
        *(void *)uint64_t v91 = 0xAAAAAAAAAAAAAAAALL;
        int v36 = ccder_blob_decode_tl();
        uint64_t result = v80;
        if (v36)
        {
          if (CMSAttributeParseMessageDigest((uint64_t)&v83, v34, v35, a3)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v79;
          }
        }
        v19 |= 2u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x96463F78648862ALL && v22[8] == 2)
      {
        if ((v19 & 0x10) != 0) {
          goto LABEL_149;
        }
        unint64_t v90 = 0xAAAAAAAAAAAAAAAALL;
        int v37 = ccder_blob_decode_tl();
        uint64_t result = v80;
        if (v37)
        {
          BOOL v38 = v83;
          unint64_t v39 = v84;
          if (v83 >= v84)
          {
LABEL_111:
            if (v38 == v39) {
              uint64_t result = 0;
            }
            else {
              uint64_t result = 262155;
            }
          }
          else
          {
            while (1)
            {
              if (!ccder_blob_decode_tl())
              {
                uint64_t result = 262157;
                goto LABEL_134;
              }
              memset(v91, 170, 16);
              if (__CFADD__(v83, v90)) {
                goto LABEL_181;
              }
              if (v83 > &v83[v90] || &v83[v90] > v84) {
                goto LABEL_180;
              }
              *(void *)uint64_t v91 = v83;
              *(void *)&v91[8] = &v83[v90];
              if ((ccder_blob_decode_tl() & 1) == 0)
              {
                uint64_t result = 262151;
                goto LABEL_134;
              }
              uint64_t v88 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
              uint64_t v89 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
              if (*(void *)&v91[8] < *(void *)v91 || v90 > *(void *)&v91[8] - *(void *)v91) {
                goto LABEL_180;
              }
              uint64_t v88 = *(unsigned char **)v91;
              uint64_t v89 = (unsigned char *)v90;
              if (__CFADD__(*(void *)v91, v90)) {
                goto LABEL_181;
              }
              if (*(void *)v91 > *(void *)v91 + v90 || *(void *)v91 + v90 > *(void *)&v91[8]) {
                goto LABEL_180;
              }
              *(void *)v91 += v90;
              if (!ccder_blob_decode_tl())
              {
                uint64_t result = 262152;
                goto LABEL_134;
              }
              uint64_t v41 = *(void *)v91;
              if (__CFADD__(*(void *)v91, v90)) {
                goto LABEL_181;
              }
              unint64_t v42 = *(void *)v91 + v90;
              if (*(void *)v91 > *(void *)v91 + v90) {
                goto LABEL_180;
              }
              uint64_t v43 = *(void *)&v91[8];
              if (v42 > *(void *)&v91[8]) {
                goto LABEL_180;
              }
              *(void *)v91 += v90;
              if (v42 != *(void *)&v91[8]) {
                break;
              }
              long long v44 = find_digest((uint64_t)&v88);
              if (v44)
              {
                unsigned int v45 = *v44;
                if (*v44 > *(_DWORD *)(a3 + 104))
                {
                  unsigned int v46 = *(_DWORD *)(v78 + 8);
                  if (!v46 || v45 <= v46)
                  {
                    *(_DWORD *)(a3 + 104) = v45;
                    unint64_t v47 = v90;
                    if (v90 > v43 - v41) {
                      goto LABEL_180;
                    }
                    *(void *)(a3 + 112) = v41;
                    *(void *)(a3 + 120) = v47;
                  }
                }
              }
              BOOL v38 = *(char **)v91;
              unint64_t v39 = v84;
              if (*(void *)v91 > (unint64_t)v84 || (unint64_t)v83 > *(void *)v91) {
                goto LABEL_180;
              }
              long long v83 = *(char **)v91;
              if (*(void *)v91 >= (unint64_t)v84) {
                goto LABEL_111;
              }
            }
            uint64_t result = 262153;
          }
        }
LABEL_134:
        v19 |= 0x10u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x9010DF78648862ALL && v22[8] == 5)
      {
        if ((v19 & 4) != 0) {
          goto LABEL_149;
        }
        *(void *)uint64_t v91 = 0xAAAAAAAAAAAAAAAALL;
        int v48 = ccder_blob_decode_tl();
        uint64_t result = v80;
        if (v48)
        {
          if (CMSAttributeParseSigningTime((unint64_t *)&v83)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v79;
          }
        }
        v19 |= 4u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x96463F78648862ALL && v22[8] == 1)
      {
        if ((v19 & 8) != 0) {
          goto LABEL_149;
        }
        *(void *)uint64_t v91 = 0xAAAAAAAAAAAAAAAALL;
        int v51 = ccder_blob_decode_tl();
        uint64_t result = v80;
        if (v51)
        {
          if (CMSAttributeParseAppleHashAgility((unint64_t *)&v83, v49, v50, a3)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v79;
          }
        }
        v19 |= 8u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x9010DF78648862ALL && v22[8] == 52)
      {
        if ((v19 & 0x20) != 0)
        {
LABEL_149:
          uint64_t result = 262149;
          goto LABEL_176;
        }
        v19 |= 0x20u;
      }
      else
      {
        uint64_t v29 = *(void *)v22;
        int v30 = v22[8];
        if (v29 != 0x9010DF78648862ALL || v30 != 15)
        {
LABEL_147:
          uint64_t result = 262150;
          goto LABEL_176;
        }
        if ((v19 & 0x40) != 0) {
          goto LABEL_149;
        }
        *(void *)uint64_t v91 = 0xAAAAAAAAAAAAAAAALL;
        int v32 = ccder_blob_decode_tl();
        uint64_t result = v80;
        if (v32)
        {
          if (CMSAttributeParseSMIMECapabilities(&v83)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v79;
          }
        }
        v19 |= 0x40u;
        if (result) {
          goto LABEL_176;
        }
      }
      if ((unint64_t)v20 > v87 || v86 > v20) {
        goto LABEL_180;
      }
      uint64_t v86 = v20;
    }
    while ((unint64_t)v20 < v87);
    if ((~v19 & 3) == 0)
    {
      uint64_t v53 = ccder_sizeof_tag();
      uint64_t v54 = ccder_sizeof_len();
      BOOL v55 = __CFADD__(v53, v54);
      unint64_t v56 = v53 + v54;
      if (v55) {
        goto LABEL_182;
      }
      if (v56 > 0x14)
      {
        uint64_t result = 327689;
        goto LABEL_176;
      }
      memset(v91, 170, sizeof(v91));
      uint64_t v88 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
      uint64_t v89 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
      if (!__CFADD__(v91, v56))
      {
        if (&v91[v56] <= (unsigned char *)&v92 && v91 <= &v91[v56])
        {
          uint64_t v88 = v91;
          uint64_t v89 = &v91[v56];
          uint64_t v57 = ccder_blob_encode_tl();
          if (!v57)
          {
            uint64_t result = 327688;
            goto LABEL_176;
          }
          unint64_t v65 = v9[1];
          BOOL v55 = __CFADD__(v65, 8);
          unint64_t v66 = v65 + 8;
          if (!v55)
          {
            unint64_t v67 = v9[2];
            BOOL v55 = __CFADD__(v66, v67);
            unint64_t v68 = v66 + v67;
            if (!v55)
            {
              BOOL v55 = __CFADD__(v68, 4);
              unint64_t v69 = v68 + 4;
              if (!v55 && v69 < 0xFFFFFFFFFFFFFFF8)
              {
                MEMORY[0x270FA5388](v57, v58, v59, v60, v61, v62, v63, v64);
                unsigned __int8 v71 = (char *)&v76 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0);
                memset(v71, 170, ((v72 - 9) & 0xFFFFFFFFFFFFFFF8) + 8);
                ccdigest_init();
                ccdigest_update();
                ccdigest_update();
                uint64_t v13 = ((uint64_t (*)(unint64_t *, char *, _OWORD *))v9[7])(v9, v71, v93);
LABEL_159:
                uint64_t result = CMSBuildPath(v13, (uint64_t)a2, a3);
                switch((int)result)
                {
                  case 524293:
                  case 524295:
                    *(_DWORD *)(a3 + 168) = result;
                    return 0;
                  case 524294:
                    goto LABEL_176;
                  case 524296:
                    if (*(_DWORD *)(a3 + 168) != 458753) {
                      goto LABEL_167;
                    }
                    int v73 = 524296;
LABEL_166:
                    *(_DWORD *)(a3 + 168) = v73;
LABEL_167:
                    unint64_t v74 = *v9;
                    if (*v9 > 0x40) {
                      goto LABEL_180;
                    }
                    v82[0] = v93;
                    v82[1] = v74;
                    uint64_t result = X509CertificateCheckSignatureDigest(29, *(void *)(a3 + 152), v82, v6);
                    if (!result || result == 655648 || result == 655632)
                    {
                      int v75 = *(_DWORD *)(a3 + 168);
                      if (!v75 || v75 == 458753 || v75 == 327681) {
                        *(_DWORD *)(a3 + 168) = result;
                      }
                      uint64_t result = 0;
                    }
                    break;
                  case 524297:
                    int v73 = 524297;
                    goto LABEL_166;
                  default:
                    if (result) {
                      goto LABEL_176;
                    }
                    goto LABEL_167;
                }
                goto LABEL_176;
              }
            }
          }
LABEL_182:
          __break(0x5500u);
          JUMPOUT(0x263BFE27CLL);
        }
        goto LABEL_180;
      }
LABEL_181:
      __break(0x5513u);
    }
  }
  uint64_t result = 262156;
LABEL_176:
  if ((_OWORD *)*v15 == v93)
  {
    *unint64_t v15 = 0;
    *(void *)(a3 + 136) = 0;
  }
  return result;
}

uint64_t validateSignerInfoAndChain(uint64_t *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = validateSignerInfo((uint64_t)a1, a2, a3);
  if (!v5)
  {
    int v7 = X509ChainCheckPath(29, (uint64_t *)(a3 + 152), *a1);
    if (v7)
    {
      if (!*(_DWORD *)(a3 + 168)) {
        *(_DWORD *)(a3 + 168) = v7;
      }
    }
  }
  return v5;
}

uint64_t CMSVerifySignedDataWithLeaf(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = 0;
  v9[0] = 0;
  return CMSVerify(a1, a2, a3, a4, a5, a6, a7, &v8, v9);
}

uint64_t CMSVerify(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v29 = 0;
  v30[0] = 0;
  memset(v28, 0, sizeof(v28));
  uint64_t v26 = 0;
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = (char *)&v23 + 8;
  v30[1] = 0;
  memset(__b, 170, sizeof(__b));
  v22[0] = 4;
  v22[1] = (unint64_t)__b;
  long long v20 = 0u;
  long long v21 = 0u;
  memset(v19, 0, sizeof(v19));
  long long v27 = v19;
  *(void *)&v28[0] = 1;
  DWORD2(v21) = 327681;
  if (a2 < 0) {
    goto LABEL_19;
  }
  uint64_t result = CMSParseContentInfoSignedDataWithOptions(a1, a2, v22, 0);
  if (result) {
    return result;
  }
  if (!a4) {
    goto LABEL_7;
  }
  uint64_t result = 131091;
  if (*(_OWORD *)((char *)v28 + 8) != 0) {
    return result;
  }
  if (a4 < 0) {
LABEL_19:
  }
    __break(0x5519u);
  *((void *)&v28[0] + 1) = a3;
  *(void *)&v28[1] = a4;
LABEL_7:
  v30[0] = a5;
  DWORD2(v21) = 458753;
  uint64_t result = CMSParseSignerInfos((uint64_t)v22, (uint64_t)v30, (uint64_t (*)(uint64_t, uint64_t, long long *))validateSignerInfoAndChain);
  if (!result)
  {
    uint64_t result = DWORD2(v21);
    if (!DWORD2(v21))
    {
      if (a6 && a7) {
        uint64_t result = X509CertificateParseKey(*((uint64_t *)&v20 + 1), a6, a7);
      }
      if (!a4)
      {
        if (a8)
        {
          if (a9)
          {
            uint64_t v18 = *(void *)&v28[1];
            if (*(void *)&v28[1])
            {
              if (*((void *)&v28[0] + 1))
              {
                *a8 = *((void *)&v28[0] + 1);
                *a9 = v18;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t CMSVerifySignedData(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  v9[0] = 0;
  uint64_t v8 = 0;
  return CMSVerify(a1, a2, a3, a4, a5, &v6, &v7, &v8, v9);
}

uint64_t CMSVerifyAndReturnSignedData(unsigned __int8 *a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  v7[0] = 0;
  return CMSVerify(a1, a2, 0, 0, a5, &v6, v7, a3, a4);
}

uint64_t ccder_blob_decode_ber_len(unsigned __int8 **a1, unsigned char *a2, unint64_t *a3)
{
  *a2 = 0;
  unint64_t v3 = *a1;
  if (!*a1) {
    return 0;
  }
  unint64_t v4 = (unint64_t)a1[1];
  if ((unint64_t)v3 >= v4) {
    return 0;
  }
  if (v3 == (unsigned __int8 *)-1)
  {
LABEL_42:
    __break(0x5513u);
    JUMPOUT(0x263BFE7B8);
  }
  uint64_t v5 = v3 + 1;
  if (v3 >= v3 + 1 || (unint64_t)v5 > v4)
  {
LABEL_41:
    __break(0x5519u);
    goto LABEL_42;
  }
  *a1 = v5;
  unint64_t v7 = *v3;
  if ((char)*v3 < 0)
  {
    switch(*v3)
    {
      case 0x80u:
        unint64_t v7 = v4 - (void)v5;
        *a2 = 1;
        break;
      case 0x81u:
        if ((uint64_t)(v4 - (void)v5) < 1) {
          return 0;
        }
        if (v3 == (unsigned __int8 *)-2) {
          goto LABEL_42;
        }
        uint64_t v9 = v3 + 2;
        if (v5 > v9 || (unint64_t)v9 > v4) {
          goto LABEL_41;
        }
        *a1 = v9;
        unint64_t v7 = *v5;
        uint64_t v5 = v9;
        break;
      case 0x82u:
        if ((uint64_t)(v4 - (void)v5) < 2) {
          return 0;
        }
        if ((unint64_t)v5 >= v4) {
          goto LABEL_41;
        }
        if (v3 == (unsigned __int8 *)-2) {
          goto LABEL_42;
        }
        if (v3 + 2 < v5 || (unint64_t)(v3 + 2) >= v4) {
          goto LABEL_41;
        }
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_42;
        }
        unint64_t v10 = v3 + 3;
        if (v5 > v3 + 3 || (unint64_t)v10 > v4) {
          goto LABEL_41;
        }
        unint64_t v11 = (unint64_t)v3[1] << 8;
        uint64_t v12 = v3[2];
        goto LABEL_40;
      case 0x83u:
        if ((uint64_t)(v4 - (void)v5) < 3) {
          return 0;
        }
        if ((unint64_t)v5 >= v4) {
          goto LABEL_41;
        }
        if (v3 == (unsigned __int8 *)-2) {
          goto LABEL_42;
        }
        if (v3 + 2 < v5 || (unint64_t)(v3 + 2) >= v4) {
          goto LABEL_41;
        }
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_42;
        }
        if (v3 + 3 < v5 || (unint64_t)(v3 + 3) >= v4) {
          goto LABEL_41;
        }
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFCLL) {
          goto LABEL_42;
        }
        unint64_t v10 = v3 + 4;
        if (v5 > v3 + 4 || (unint64_t)v10 > v4) {
          goto LABEL_41;
        }
        unint64_t v11 = ((unint64_t)v3[1] << 16) | ((unint64_t)v3[2] << 8);
        uint64_t v12 = v3[3];
LABEL_40:
        unint64_t v7 = v11 | v12;
        *a1 = v10;
        uint64_t v5 = v10;
        break;
      default:
        return 0;
    }
  }
  if (v4 - (unint64_t)v5 < v7) {
    return 0;
  }
  *a3 = v7;
  return 1;
}

uint64_t CMSParseImplicitCertificateSet(unsigned __int8 **a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  *a4 = 0;
  a4[1] = 0;
  int v30 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v5 = *a1;
  unint64_t v6 = (unint64_t)a1[1];
  if ((unint64_t)*a1 > v6)
  {
LABEL_43:
    __break(0x5519u);
LABEL_44:
    __break(0x5513u);
  }
  int v30 = *a1;
  unint64_t v31 = v6;
  BOOL v7 = (unint64_t)v5 >= v6 || a3 == 0;
  if (v7)
  {
    unint64_t v12 = 0;
LABEL_8:
    if (a5) {
      *a5 = v12;
    }
    return 1;
  }
  else
  {
    unint64_t v12 = 0;
    unint64_t v13 = 304 * a3;
    unint64_t v14 = a2 + 304 * a3;
    unint64_t v25 = ~a2;
    long long v27 = (unint64_t **)(a4 + 1);
    long long v23 = (unint64_t *)(a2 + 272);
    unint64_t v15 = a2;
    while (1)
    {
      char v29 = 0;
      if (!ccder_blob_decode_tag()) {
        return 0;
      }
      if (!v32) {
        goto LABEL_8;
      }
      if (!ccder_blob_decode_ber_len(&v30, &v29, &v28) || v29 || v32 != 0x2000000000000010) {
        return 0;
      }
      if ((unsigned __int128)((uint64_t)v12 * (__int128)304) >> 64 != (uint64_t)(304 * v12) >> 63 || 304 * v12 > v25) {
        goto LABEL_44;
      }
      if (v15 > v14) {
        goto LABEL_43;
      }
      if (v15 < a2) {
        goto LABEL_43;
      }
      BOOL v16 = v13 >= 0x130;
      v13 -= 304;
      if (!v16) {
        goto LABEL_43;
      }
      *(_OWORD *)(v15 + 272) = 0u;
      *(_OWORD *)(v15 + 288) = 0u;
      *(_OWORD *)(v15 + 240) = 0u;
      *(_OWORD *)(v15 + 256) = 0u;
      *(_OWORD *)(v15 + 208) = 0u;
      *(_OWORD *)(v15 + 224) = 0u;
      *(_OWORD *)(v15 + 176) = 0u;
      *(_OWORD *)(v15 + 192) = 0u;
      *(_OWORD *)(v15 + 144) = 0u;
      *(_OWORD *)(v15 + 160) = 0u;
      *(_OWORD *)(v15 + 112) = 0u;
      *(_OWORD *)(v15 + 128) = 0u;
      *(_OWORD *)(v15 + 80) = 0u;
      *(_OWORD *)(v15 + 96) = 0u;
      *(_OWORD *)(v15 + 48) = 0u;
      *(_OWORD *)(v15 + 64) = 0u;
      *(_OWORD *)(v15 + 16) = 0u;
      *(_OWORD *)(v15 + 32) = 0u;
      *(_OWORD *)unint64_t v15 = 0u;
      if (v12)
      {
        if (v15 + 304 > v14) {
          goto LABEL_43;
        }
        *(void *)(v15 + 272) = 0;
        unint64_t v17 = *v27;
        *(void *)(v15 + 280) = *v27;
        if (v15)
        {
          if (v15 >= v14) {
            goto LABEL_43;
          }
        }
        *unint64_t v17 = v15;
        *long long v27 = (unint64_t *)(v15 + 272);
      }
      else
      {
        if (v15 + 304 > v14) {
          goto LABEL_43;
        }
        unint64_t v18 = *a4;
        *long long v23 = *a4;
        int v19 = (unint64_t **)(v18 + 280);
        BOOL v7 = v18 == 0;
        long long v20 = v27;
        if (!v7) {
          long long v20 = v19;
        }
        *long long v20 = v23;
        if (v15)
        {
          if (v15 >= v14) {
            goto LABEL_43;
          }
        }
        *a4 = v15;
        *(void *)(a2 + 280) = a4;
      }
      if (X509CertificateParseImplicit(v15, (unint64_t *)&v30, 0, 0)) {
        return 0;
      }
      if (v6 < (unint64_t)v5) {
        goto LABEL_43;
      }
      long long v21 = v30;
      uint64_t v22 = (unsigned __int8 *)(v30 - v5);
      if (v30 - v5 > v6 - (unint64_t)v5) {
        goto LABEL_43;
      }
      if (v15 + 304 > v14) {
        goto LABEL_43;
      }
      *(void *)unint64_t v15 = v5;
      *(void *)(v15 + 8) = v22;
      unint64_t v6 = v31;
      if ((unint64_t)v21 > v31) {
        goto LABEL_43;
      }
      *a1 = v21;
      a1[1] = (unsigned __int8 *)v6;
      ++v12;
      if ((unint64_t)v21 < v6)
      {
        v15 += 304;
        uint64_t v5 = v21;
        if (v12 < a3) {
          continue;
        }
      }
      goto LABEL_8;
    }
  }
}

uint64_t ccder_blob_eat_ber_inner(unsigned __int8 **a1, uint64_t a2, unsigned __int8 **a3, int a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v15 = 0;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  int v8 = ccder_blob_decode_tag();
  uint64_t result = 0;
  if (v8 && v14 == a2)
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t result = ccder_blob_decode_ber_len(a1, &v15, &v13);
    if ((result & 1) == 0) {
      return 0;
    }
    if (a3)
    {
      unint64_t v10 = a1[1];
      if (*a1 > v10) {
        goto LABEL_18;
      }
      *a3 = *a1;
      a3[1] = v10;
    }
    if (v15)
    {
      if (a4 >= 1)
      {
        uint64_t result = ccder_blob_eat_ber_inner(a1, 0, 0, (char)(a4 - 1));
        if (!result) {
          return result;
        }
        return (ccder_blob_decode_eoc((unint64_t *)a1, 1) & 1) != 0;
      }
      return 0;
    }
    unint64_t v11 = *a1;
    if (__CFADD__(*a1, v13))
    {
LABEL_19:
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = &v11[v13];
    if (v11 <= &v11[v13] && v12 <= a1[1])
    {
      *a1 = v12;
      return 1;
    }
LABEL_18:
    __break(0x5519u);
    goto LABEL_19;
  }
  return result;
}

uint64_t CMSAttributeParseContentType(char **a1)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v3 = *a1;
    if ((unint64_t)*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      if (v3 - 0x5555555555555556 != a1[1]) {
        return 0;
      }
      if (v3 <= v3 - 0x5555555555555556) {
        return compare_octet_string_raw((uint64_t)&pkcs7_data_oid, v3, 0xAAAAAAAAAAAAAAAALL) == 0;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t CMSAttributeParseMessageDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    if (*(void *)a1 >= 0x5555555555555556uLL)
    {
      __break(0x5513u);
    }
    else if (*(void *)a1 - 0x5555555555555556 == *(void *)(a1 + 8))
    {
      uint64_t result = (uint64_t)find_digest(a4 + 24);
      if (result)
      {
        if (*(void *)(a4 + 136) != 0xAAAAAAAAAAAAAAAALL
          || *(void *)(*(uint64_t (**)(void))(result + 24))() != 0xAAAAAAAAAAAAAAAALL
          || memcmp(*(const void **)(a4 + 128), *(const void **)a1, 0xAAAAAAAAAAAAAAAALL))
        {
          *(_DWORD *)(a4 + 168) = 458754;
        }
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CMSAttributeParseSigningTime(unint64_t *a1)
{
  if (*a1 > a1[1]) {
    goto LABEL_10;
  }
  unint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v3 = *a1;
    goto LABEL_7;
  }
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return result;
  }
  unint64_t v3 = v4;
  if (v4 > v5) {
LABEL_10:
  }
    __break(0x5519u);
  *a1 = v4;
  a1[1] = v5;
LABEL_7:
  if (v3 < 0x5555555555555556) {
    return v3 - 0x5555555555555556 == a1[1];
  }
  __break(0x5513u);
  return result;
}

uint64_t CMSAttributeParseAppleHashAgility(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      if (v7 - 0x5555555555555556 != a1[1]) {
        return 0;
      }
      if (*(_DWORD *)(a4 + 104)) {
        return 1;
      }
      if (v7 <= v7 - 0x5555555555555556)
      {
        *(void *)(a4 + 112) = v7;
        *(void *)(a4 + 120) = 0xAAAAAAAAAAAAAAAALL;
        return 1;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t CMSAttributeParseSMIMECapabilities(void *a1)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    if (*a1 >= 0x5555555555555556uLL) {
      __break(0x5513u);
    }
    else {
      return *a1 - 0x5555555555555556 == a1[1];
    }
  }
  return result;
}

uint64_t compare_octet_string(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  size_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  }
  if (v2 > v3) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

uint64_t compare_octet_string_raw(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3 = *(void *)(a1 + 8);
  if (v3 == a3) {
    return memcmp(*(const void **)a1, a2, a3);
  }
  if (v3 > a3) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

uint64_t compare_octet_string_partial(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  if (v2 <= *(void *)(a2 + 8)) {
    return memcmp(*(const void **)a2, *(const void **)a1, v2);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    if (*a1 > a1[1]) {
      goto LABEL_20;
    }
    unint64_t v5 = *a1;
    unint64_t v6 = *a1;
    uint64_t result = ccder_blob_decode_tl();
    if (!result) {
      return result;
    }
    if (a2)
    {
      if (v6 < v5) {
        goto LABEL_20;
      }
      *a2 = v5;
      a2[1] = 0;
    }
    if (v5 == v6)
    {
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
    else if (v5 <= v6)
    {
      uint64_t result = ccder_blob_decode_tl();
      if (!result) {
        return result;
      }
      if (v5 != v6) {
        return 0;
      }
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
LABEL_20:
    __break(0x5519u);
  }
  return result;
}

uint64_t ccder_blob_decode_Time(void *a1)
{
  if (*a1 > a1[1]) {
    goto LABEL_6;
  }
  if (ccder_blob_decode_tl()) {
    return 0;
  }
  if (*a1 > a1[1]) {
LABEL_6:
  }
    __break(0x5519u);
  ccder_blob_decode_tl();
  return 0;
}

uint64_t ccder_blob_decode_GeneralName(unint64_t *a1, int *a2, unint64_t *a3)
{
  uint64_t result = 0;
  if (a2 && a3)
  {
    *a3 = 0;
    a3[1] = 0;
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      *a2 = 0;
LABEL_6:
      unint64_t v7 = v10;
LABEL_16:
      if (v7 <= a1[1] && *a1 <= v7)
      {
        *a1 = v7;
        return 1;
      }
LABEL_42:
      __break(0x5519u);
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v11 = *a1;
    unint64_t v16 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v11;
      if (v16 < v11) {
        goto LABEL_42;
      }
      *a3 = v11;
      a3[1] = 0;
      int v8 = 1;
LABEL_15:
      *a2 = v8;
      goto LABEL_16;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v12 = *a1;
    unint64_t v17 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v12;
      if (v17 < v12) {
        goto LABEL_42;
      }
      *a3 = v12;
      a3[1] = 0;
      int v8 = 2;
      goto LABEL_15;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      int v9 = 3;
LABEL_23:
      *a2 = v9;
      goto LABEL_6;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v13 = *a1;
    unint64_t v18 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v13;
      if (v18 < v13) {
        goto LABEL_42;
      }
      *a3 = v13;
      a3[1] = 0;
      int v8 = 4;
      goto LABEL_15;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      int v9 = 5;
      goto LABEL_23;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v14 = *a1;
    unint64_t v19 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v14;
      if (v19 < v14) {
        goto LABEL_42;
      }
      *a3 = v14;
      a3[1] = 0;
      int v8 = 6;
      goto LABEL_15;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v15 = *a1;
    unint64_t v20 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v15;
      if (v20 < v15) {
        goto LABEL_42;
      }
      *a3 = v15;
      a3[1] = 0;
      int v8 = 7;
      goto LABEL_15;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      int v9 = 8;
      goto LABEL_23;
    }
  }
  return result;
}

uint64_t ccder_blob_check_null()
{
  return ccder_blob_decode_tl();
}

uint64_t CTParseCertificateSet(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, void *a5)
{
  uint64_t v6 = 0;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a1 < a2 && a4)
  {
    uint64_t v8 = 0;
    uint64_t v9 = a4 - 1;
    unint64_t v10 = a3;
    unint64_t v11 = (unint64_t)&a3[a4];
    while (1)
    {
      *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17[17] = v12;
      v17[18] = v12;
      v17[15] = v12;
      _OWORD v17[16] = v12;
      v17[13] = v12;
      v17[14] = v12;
      v17[11] = v12;
      v17[12] = v12;
      v17[9] = v12;
      v17[10] = v12;
      v17[7] = v12;
      v17[8] = v12;
      v17[5] = v12;
      v17[6] = v12;
      _OWORD v17[3] = v12;
      v17[4] = v12;
      v17[1] = v12;
      _DWORD v17[2] = v12;
      v17[0] = v12;
      unint64_t v15 = a1;
      unint64_t v16 = a2;
      uint64_t result = X509CertificateParse((unint64_t *)v17, &v15);
      if (result) {
        break;
      }
      a1 = v15;
      a2 = v16;
      if (v15 > v16 || (unint64_t)v10 >= v11 || v10 < a3) {
        __break(0x5519u);
      }
      *unint64_t v10 = v17[0];
      uint64_t v6 = v8 + 1;
      if (a1 < a2)
      {
        ++v10;
        if (v9 != v8++) {
          continue;
        }
      }
      goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    uint64_t result = 0;
    if (a5) {
      *a5 = v6;
    }
  }
  return result;
}

uint64_t CTParseExtensionValue(unint64_t a1, uint64_t a2, const void *a3, size_t a4, void *a5, void *a6)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  memset(v11, 0, sizeof(v11));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }
  if (a1 + a2 < a1) {
    goto LABEL_11;
  }
  v10[0] = a1;
  v10[1] = a1 + a2;
  uint64_t result = X509CertificateParseWithExtension((unint64_t *)v11, v10, a3, a4);
  if (!result)
  {
    uint64_t result = 720914;
    if (*((void *)&v12 + 1))
    {
      uint64_t v9 = v13;
      if ((void)v13)
      {
        uint64_t result = 0;
        if (a5)
        {
          if (a6)
          {
            uint64_t result = 0;
            *a5 = *((void *)&v12 + 1);
            *a6 = v9;
          }
        }
      }
    }
  }
  return result;
}

uint64_t CTParseKey(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  memset(v8, 0, sizeof(v8));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_7:
    __break(0x5519u);
  }
  if (a1 + a2 < a1) {
    goto LABEL_7;
  }
  v7[0] = a1;
  v7[1] = a1 + a2;
  uint64_t result = X509CertificateParse((unint64_t *)v8, v7);
  if (!result) {
    return X509CertificateParseKey((uint64_t)v8, a3, a4);
  }
  return result;
}

uint64_t CTEvaluateSavageCertsWithUID(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, unsigned char *a7, uint64_t a8, BOOL *a9)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, (uint64_t)&X509PolicySavage, 2);
}

uint64_t CTEvaluateCertifiedChip(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, unsigned char *a7, uint64_t a8, const void *a9, size_t a10, BOOL *a11, uint64_t a12, uint64_t a13)
{
  __b[152] = *MEMORY[0x263EF8340];
  uint64_t result = (uint64_t)memset(__b, 170, 0x4C0uLL);
  memset(v33, 170, sizeof(v33));
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v32 = 0;
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2)) {
    goto LABEL_34;
  }
  if (a1 + a2 < a1) {
    goto LABEL_35;
  }
  unint64_t v30 = a1;
  unint64_t v31 = a1 + a2;
  uint64_t result = (uint64_t)X509ChainParseCertificateSet(&v30, (unint64_t)__b, 4, &v33[2], &v32);
  if (result) {
    return result;
  }
  uint64_t result = 327690;
  if (v30 != v31) {
    return result;
  }
  if (v32 != 2) {
    return 327692;
  }
  X509ChainResetChain(v33, &v33[2]);
  __b[74] = v33[0];
  uint64_t v22 = v33[0] ? (uint64_t *)(v33[0] + 296) : &v33[1];
  *uint64_t v22 = (uint64_t)&__b[74];
  if ((void *)((char *)&__b[38] + 1) != 0 && (unint64_t)__b >= 0xFFFFFFFFFFFFFECFLL) {
LABEL_34:
  }
    __break(0x5513u);
  v33[0] = (uint64_t)&__b[38];
  __b[75] = v33;
  __b[36] = 0;
  __b[37] = v33[1];
  *(void *)v33[1] = __b;
  v33[1] = (uint64_t)&__b[36];
  uint64_t result = X509ChainCheckPathWithOptions(12, v33, a12, 0);
  if (result) {
    return result;
  }
  uint64_t v23 = **(void **)(v33[1] + 8);
  uint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  if ((a4 & 0x8000000000000000) != 0) {
    goto LABEL_35;
  }
  uint64_t v28 = a3;
  unint64_t v29 = a4;
  long long v24 = oidForPubKeyLength();
  uint64_t result = X509CertificateCheckSignatureWithPublicKey(&v28, (uint64_t)&ecPublicKey, (uint64_t)v24, v23 + 16, v23 + 40);
  if (result) {
    return result;
  }
  if (a9 && a10)
  {
    if ((a10 & 0x8000000000000000) != 0) {
      goto LABEL_35;
    }
    if (compare_octet_string_raw(v23 + 248, a9, a10)) {
      return 590085;
    }
  }
  unint64_t v25 = v33[0];
  LODWORD(result) = X509CertificateParseKey(v33[0], a5, a6);
  int v26 = result;
  if (result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = 327691;
  }
  if (!v25 || v26) {
    return result;
  }
  if (a11) {
    *a11 = (*(void *)(v25 + 240) & a13) != 0;
  }
  if (!a7 || !a8) {
    return 0;
  }
  v27[0] = 0;
  v27[1] = 0;
  if (v25 >= v25 + 304) {
    goto LABEL_35;
  }
  uint64_t result = X509CertificateSubjectNameGetCommonName((unint64_t *)(v25 + 104), v27);
  if (result) {
    return result;
  }
  if (a8 < 0)
  {
LABEL_35:
    __break(0x5519u);
    return result;
  }
  uint64_t result = CTCopyUID((uint64_t)v27, a7, a8);
  if (!result) {
    return 0;
  }
  return result;
}

uint64_t CTEvaluateSavageCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, BOOL *a7)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, 0, 0, 0, 0, a7, (uint64_t)&X509PolicySavage, 2);
}

uint64_t CTEvaluateYonkersCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, unsigned char *a7, uint64_t a8, BOOL *a9)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, (uint64_t)&X509PolicyYonkers, 0x80000);
}

uint64_t CTEvaluateSensorCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, const void *a5, size_t a6, void *a7, void *a8, unsigned char *a9, uint64_t a10, BOOL *a11)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a7, a8, a9, a10, a5, a6, a11, (uint64_t)&X509PolicySensor, 0x10000000000);
}

uint64_t CTEvaluateCertsForPolicy(unint64_t a1, uint64_t a2, char a3, int a4, void *a5, void *a6, uint64_t a7, uint64_t a8, void *a9, void *a10, long long *a11)
{
  v41[116] = *MEMORY[0x263EF8340];
  memset(v38, 170, sizeof(v38));
  bzero(v39, 0x4C0uLL);
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_42:
    __break(0x5519u);
  }
  if (a1 + a2 < a1) {
    goto LABEL_42;
  }
  uint64_t v36 = a1 + a2;
  unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v35 = a1;
  uint64_t result = (uint64_t)X509ChainParseCertificateSet(&v35, (unint64_t)v39, 4, &v38[2], &v37);
  if (result) {
    return result;
  }
  if (v35 != v36) {
    return 327690;
  }
  if ((a4 & 1) == 0 && !v40)
  {
    X509ChainResetChain(v38, &v38[2]);
    uint64_t v20 = v38[0];
    long long v21 = (uint64_t *)(v38[0] + 296);
    if (!v38[0]) {
      long long v21 = &v38[1];
    }
    *long long v21 = (uint64_t)v41;
    v38[0] = (uint64_t)v39;
    v41[0] = v20;
    v41[1] = v38;
LABEL_20:
    v34[0] = a7;
    v34[1] = a8;
    if (a7) {
      BOOL v23 = a8 == 0;
    }
    else {
      BOOL v23 = 1;
    }
    *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v32 = v24;
    *(_OWORD *)&v32[16] = v24;
    long long v31 = *a11;
    v32[0] = *((unsigned char *)a11 + 16);
    if (v23) {
      char v25 = a3;
    }
    else {
      char v25 = 1;
    }
    v32[1] = v25;
    *(_WORD *)&v32[2] = *((_WORD *)a11 + 9);
    if (v23)
    {
      *(_OWORD *)&v32[8] = *(long long *)((char *)a11 + 24);
      long long v27 = (_UNKNOWN **)*((void *)a11 + 5);
    }
    else
    {
      uint64_t v26 = *((void *)a11 + 4);
      *(void *)&v32[8] = v34;
      *(void *)&v32[16] = v26;
      long long v27 = oidForPubKeyLength();
    }
    uint64_t v28 = *((void *)a11 + 6);
    *(void *)&v32[24] = v27;
    uint64_t v33 = v28;
    uint64_t result = X509ChainCheckPathWithOptions(12, v38, (uint64_t)&v31, 0);
    if (!result)
    {
      unint64_t v29 = (void *)v38[0];
      if (!a5 || !a6 || !v38[0] || (uint64_t result = X509CertificateParseKey(v38[0], a5, a6), !result))
      {
        if (a10 && v29)
        {
          uint64_t v30 = v29[32];
          *a10 = v29[31];
          a10[1] = v30;
        }
        uint64_t result = 0;
        if (a9)
        {
          if (v29)
          {
            uint64_t result = 0;
            *a9 = v29[30];
          }
        }
      }
    }
    return result;
  }
  if (v39[265])
  {
    if (v38[2])
    {
      uint64_t v22 = (unsigned char *)v38[2];
      while (v22[265])
      {
        uint64_t v22 = (unsigned char *)*((void *)v22 + 34);
        if (!v22)
        {
          uint64_t v22 = (unsigned char *)v38[2];
          break;
        }
      }
    }
    else
    {
      uint64_t v22 = 0;
    }
  }
  else
  {
    uint64_t v22 = v39;
  }
  uint64_t result = X509ChainBuildPathPartial(v22, &v38[2], v38, a4 ^ 1u);
  if (!result) {
    goto LABEL_20;
  }
  return result;
}

uint64_t CTEvaluateSatori(unint64_t a1, uint64_t a2, char a3, void *a4, void *a5)
{
  return CTEvaluateCertsForPolicy(a1, a2, a3, 1, a4, a5, 0, 0, 0, 0, X509PolicySatori);
}

uint64_t CTEvaluateAcrt(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 0, a3, a4, 0, 0, 0, 0, X509PolicyACRT);
}

uint64_t CTEvaluateUcrt(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, 0, 0, X509PolicyUcrt);
}

uint64_t CTEvaluateUcrtTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  return CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, 0, 0, X509PolicyUcrt);
}

uint64_t CTEvaluatePragueSignatureCMS(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v9 = 0xAAAAAAAA0000AA01;
  long long v8 = xmmword_263C0F100;
  BYTE1(v9) = a5;
  long long v10 = 0u;
  long long v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTEvaluateKDLSignatureCMS(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v9 = 0xAAAAAAAA0000AA01;
  long long v8 = xmmword_263C0F110;
  BYTE1(v9) = a5;
  long long v10 = 0u;
  long long v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTVerifyAppleMarkerExtension(void *a1, uint64_t a2)
{
  uint64_t result = 327700;
  unint64_t v4 = a1[31];
  unint64_t v5 = a1[32];
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 327707;
  }
  uint64_t v7 = a1[30];
  if ((v7 & 0x100000000) == 0)
  {
    if ((v7 & 0x200000000) == 0) {
      return result;
    }
    if (!__CFADD__(v4, v5))
    {
      unint64_t v11 = v4 + v5;
      if (v4 + v5 != -1)
      {
        if (v5 > 0x13) {
          return 327704;
        }
        uint64_t v16 = (unsigned __int8 *)(v11 - 1);
        if (v11 - 1 >= v4)
        {
          uint64_t v10 = 0;
          uint64_t v17 = 0;
          while ((unint64_t)v16 < v11)
          {
            int v18 = *v16;
            if ((v18 - 58) < 0xFFFFFFF6) {
              return 327705;
            }
            if (v17 == 20) {
              break;
            }
            if ((v17 & 0x1FFFFFFFFFFFFFFFLL) == 0x14) {
              goto LABEL_39;
            }
            unint64_t v19 = (v18 - 48);
            unint64_t v20 = powersOfTen[v17];
            if (!is_mul_ok(v19, v20)) {
              goto LABEL_40;
            }
            unint64_t v21 = v19 * v20;
            BOOL v15 = __CFADD__(v10, v21);
            v10 += v21;
            if (v15) {
              goto LABEL_38;
            }
            ++v17;
            if ((unint64_t)--v16 < v4) {
              goto LABEL_23;
            }
          }
LABEL_37:
          __break(0x5519u);
LABEL_38:
          __break(0x5500u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(0x550Cu);
          goto LABEL_41;
        }
        goto LABEL_13;
      }
    }
LABEL_41:
    __break(0x5513u);
    return result;
  }
  if (__CFADD__(v4, v5)) {
    goto LABEL_41;
  }
  unint64_t v8 = v4 + v5;
  if (v4 + v5 == -1) {
    goto LABEL_41;
  }
  unint64_t v9 = (unsigned char *)(v8 - 1);
  if (v8 - 1 >= v4)
  {
    char v12 = 0;
    unint64_t v13 = 0;
    uint64_t v10 = 0;
    while ((unint64_t)v9 < v8)
    {
      unint64_t v14 = (unint64_t)(*v9 & 0x7F) << v12;
      BOOL v15 = __CFADD__(v10, v14);
      v10 += v14;
      if (v15) {
        goto LABEL_38;
      }
      if (v13 <= 7)
      {
        ++v13;
        --v9;
        v12 += 7;
        if ((unint64_t)v9 >= v4) {
          continue;
        }
      }
      goto LABEL_23;
    }
    goto LABEL_37;
  }
LABEL_13:
  uint64_t v10 = 0;
LABEL_23:
  if (v10 == a2) {
    return 0;
  }
  else {
    return 589829;
  }
}

uint64_t CTVerifyHostname(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = 327702;
  if (*(void *)(a1 + 232) && *(void *)(a1 + 224))
  {
    v7[1] = a3;
    unint64_t v8 = 0xAAAAAAAAAAAAAA00;
    v7[0] = a2;
    unsigned int v4 = X509CertificateParseGeneralNamesContent(a1, (uint64_t (*)(void, int *, uint64_t))CTCompareGeneralNameToHostname, (uint64_t)v7);
    if ((_BYTE)v8) {
      unsigned int v5 = 0;
    }
    else {
      unsigned int v5 = 327706;
    }
    if (v4) {
      return v4;
    }
    else {
      return v5;
    }
  }
  return v3;
}

uint64_t CTCompareGeneralNameToHostname(uint64_t result, void *a2, unint64_t a3)
{
  if (result != 2) {
    return 1;
  }
  unsigned int v4 = *(char **)a3;
  size_t v5 = *(void *)(a3 + 8);
  size_t v6 = ~*(void *)a3;
  if (v5 > v6) {
    goto LABEL_50;
  }
  uint64_t v7 = &v4[v5];
  if (&v4[v5] == (char *)-1) {
    goto LABEL_50;
  }
  unint64_t v8 = v7 - 1;
  if (v7) {
    BOOL v9 = v8 >= v4;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9 || a3 + 24 < a3) {
    goto LABEL_49;
  }
  int v11 = *v8;
  uint64_t result = compare_octet_string((uint64_t)a2, a3);
  if (!result) {
    goto LABEL_48;
  }
  if (v11 != 46) {
    goto LABEL_15;
  }
  size_t v12 = v5 - 1;
  if (v5)
  {
    if (v12 <= v5)
    {
      uint64_t result = compare_octet_string_raw((uint64_t)a2, v4, v12);
      if (result)
      {
LABEL_15:
        unint64_t v13 = a2[1];
        if (v13 < 3) {
          return 1;
        }
        unint64_t v14 = (unsigned char *)*a2;
        if (*(unsigned char *)*a2 != 42) {
          return 1;
        }
        if (v14 != (unsigned char *)-1)
        {
          BOOL v15 = v14 + 1;
          if (v14[1] == 46)
          {
            uint64_t v16 = -2;
            if ((unint64_t)v14 < 0xFFFFFFFFFFFFFFFELL) {
              uint64_t v16 = (uint64_t)v14;
            }
            uint64_t v17 = -v16;
            uint64_t v18 = 2;
            uint64_t result = 1;
            while (v17 != v18)
            {
              if (&v14[v18] < v14) {
                goto LABEL_49;
              }
              if (v14[v18] == 46)
              {
                if (v13 == v18) {
                  return 1;
                }
                size_t v19 = 0;
                if (v5)
                {
                  while (1)
                  {
                    unint64_t v20 = &v4[v19];
                    if (&v4[v19] >= v7 || v20 < v4) {
                      goto LABEL_49;
                    }
                    if (*v20 == 46) {
                      break;
                    }
                    if (v5 == ++v19)
                    {
                      size_t v19 = v5;
                      break;
                    }
                  }
                }
                size_t v22 = v13 - 1;
                BOOL v9 = v5 >= v19;
                size_t v23 = v5 - v19;
                if (!v9) {
                  goto LABEL_51;
                }
                if (v22 == v23)
                {
                  if (v19 > v6) {
                    goto LABEL_50;
                  }
                  uint64_t result = memcmp(v15, &v4[v19], v13 - 1);
                  if (!result) {
                    goto LABEL_48;
                  }
                }
                if (v11 != 46) {
                  return 1;
                }
                if (!v23) {
                  goto LABEL_51;
                }
                if (v22 != v23 - 1) {
                  return 1;
                }
                if (v19 <= v6)
                {
                  if (!memcmp(v15, &v4[v19], v22)) {
                    goto LABEL_48;
                  }
                  return 1;
                }
                goto LABEL_50;
              }
              if (v13 == ++v18) {
                return result;
              }
            }
            goto LABEL_50;
          }
          return 1;
        }
LABEL_50:
        __break(0x5513u);
        goto LABEL_51;
      }
LABEL_48:
      uint64_t result = 0;
      *(unsigned char *)(a3 + 16) = 1;
      return result;
    }
LABEL_49:
    __break(0x5519u);
    goto LABEL_50;
  }
LABEL_51:
  __break(0x5515u);
  return result;
}

uint64_t CTEvaluateAppleSSLWithOptionalTemporalCheck(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unint64_t v20 = 0xAAAAAAAA00AAAA01;
  unint64_t v21 = &null_octet;
  long long v19 = xmmword_263C0F120;
  BYTE1(v20) = a6;
  BYTE2(v20) = a7;
  size_t v22 = &null_octet;
  size_t v23 = &null_octet;
  long long v24 = &CTOctetServerAuthEKU;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t result = CTEvaluateCertsForPolicy(a1, a2, a6, 1, &v17, &v18, 0, 0, 0, 0, &v19);
  if (!result)
  {
    *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16[17] = v13;
    v16[18] = v13;
    v16[15] = v13;
    v16[16] = v13;
    v16[13] = v13;
    v16[14] = v13;
    v16[11] = v13;
    v16[12] = v13;
    v16[9] = v13;
    v16[10] = v13;
    v16[7] = v13;
    v16[8] = v13;
    v16[6] = v13;
    v16[4] = v13;
    _OWORD v16[5] = v13;
    _OWORD v16[2] = v13;
    v16[3] = v13;
    v16[0] = v13;
    v16[1] = v13;
    memset(v15, 170, sizeof(v15));
    if (__CFADD__(a1, a2))
    {
      __break(0x5513u);
    }
    else
    {
      v14[0] = a1;
      v14[1] = a1 + a2;
      uint64_t result = (uint64_t)X509ChainParseCertificateSet(v14, (unint64_t)v16, 1, &v15[1], v15);
      if (!result)
      {
        uint64_t result = CTVerifyAppleMarkerExtension(v16, a5);
        if (!result) {
          return CTVerifyHostname((uint64_t)v16, a3, a4);
        }
      }
    }
  }
  return result;
}

uint64_t CTEvaluateAppleSSL(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return CTEvaluateAppleSSLWithOptionalTemporalCheck(a1, a2, a3, a4, a5, a6, 1);
}

uint64_t CTGetSEKType(unint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  memset(v4, 0, sizeof(v4));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_10:
    __break(0x5519u);
  }
  if (a1 + a2 < a1) {
    goto LABEL_10;
  }
  v3[0] = a1;
  v3[1] = a1 + a2;
  if (X509CertificateParse((unint64_t *)v4, v3)) {
    return 0;
  }
  if (compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&SEKTestRootSKID)) {
    return compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&SEKProdRootSKID) == 0;
  }
  return 2;
}

uint64_t CTEvaluateSEK(char a1, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t result = 327712;
  if ((a1 & 3) != 0)
  {
    if ((a1 & 1) == 0
      || (uint64_t result = CTEvaluateCertsForPolicy(a2, a3, 0, 1, a4, a5, 0, 0, 0, 0, X509PolicySEK), result))
    {
      if ((a1 & 2) != 0) {
        return CTEvaluateCertsForPolicy(a2, a3, 0, 1, a4, a5, (uint64_t)&_sek_test_root_public_key, 97, 0, 0, X509PolicySEK);
      }
    }
  }
  return result;
}

uint64_t CTCopyUID(uint64_t result, unsigned char *a2, uint64_t a3)
{
  unint64_t v5 = *(void *)result;
  uint64_t v4 = *(void *)(result + 8);
  if (__CFADD__(*(void *)result, v4)) {
    goto LABEL_31;
  }
  unint64_t v6 = v5 + v4;
  uint64_t v7 = *(unsigned __int8 **)result;
  if (v5 < v6)
  {
    while ((unint64_t)v7 >= v5)
    {
      int v3 = *v7;
      if (v3 != 45 && (unint64_t)++v7 < v6) {
        continue;
      }
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_6:
  if (v7 == (unsigned __int8 *)-1) {
    goto LABEL_31;
  }
  unint64_t v8 = v7 + 1;
  int v3 = 327693;
  uint64_t result = 327693;
  if ((unint64_t)(v7 + 1) >= v6) {
    return result;
  }
  if (a3 < 0 || v5 > (unint64_t)v8)
  {
LABEL_34:
    __break(0x5519u);
    return result;
  }
  if (__CFADD__(v8, v6 - (void)v8)) {
    goto LABEL_31;
  }
  if (v6 - (void)v8 != 2 * a3) {
    return (v3 + 1);
  }
  if (__CFADD__(a2, a3) || v7 == (unsigned __int8 *)-2)
  {
LABEL_31:
    __break(0x5513u);
    return (v3 + 1);
  }
  BOOL v9 = v7 + 2;
  uint64_t v10 = a2;
  while (1)
  {
    uint64_t result = 0;
    if ((unint64_t)v9 >= v6 || v10 >= &a2[a3]) {
      return result;
    }
    int v11 = v9 - 1;
    if ((unint64_t)(v9 - 1) >= v6 || v11 < v8) {
      goto LABEL_34;
    }
    size_t v12 = &asciiNibbleToByte[*v11];
    uint64_t result = (uint64_t)&CTOidAppleImg4Manifest;
    if (v12 >= (unsigned __int8 *)&CTOidAppleImg4Manifest || v12 < asciiNibbleToByte) {
      goto LABEL_34;
    }
    if (v11 < v7) {
      goto LABEL_34;
    }
    unint64_t v14 = &asciiNibbleToByte[*v9];
    uint64_t result = (uint64_t)&CTOidAppleImg4Manifest;
    if (v14 >= (unsigned __int8 *)&CTOidAppleImg4Manifest || v14 < asciiNibbleToByte) {
      goto LABEL_34;
    }
    unsigned int v15 = *v12;
    uint64_t result = 327695;
    if (v15 > 0xF) {
      return result;
    }
    unsigned int v16 = *v14;
    if (v16 > 0xF) {
      return result;
    }
    if (v10 < a2) {
      goto LABEL_34;
    }
    *v10++ = v16 | (16 * v15);
    v9 += 2;
    if (!v9) {
      goto LABEL_31;
    }
  }
}

uint64_t X509CertificateParseImplicit(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  unint64_t v68 = 0;
  uint64_t v69 = 0;
  unint64_t v66 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v67 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  if (*a2 > v5) {
    goto LABEL_186;
  }
  uint64_t v10 = 720915;
  unint64_t v66 = *a2;
  unint64_t v67 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return v10;
  }
  uint64_t v12 = v69;
  unint64_t v13 = v66;
  unint64_t v14 = v69 + v66 - v4;
  if (__CFADD__(v69, v66 - v4)) {
    goto LABEL_188;
  }
  if (v14 > v5 - v4) {
    goto LABEL_186;
  }
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v14;
  unint64_t v64 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12)) {
    goto LABEL_187;
  }
  unint64_t v15 = v13 + v12;
  if (v13 > v15 || v15 > v67) {
    goto LABEL_186;
  }
  unint64_t v64 = v13;
  unint64_t v65 = v15;
  unint64_t v62 = v13;
  unint64_t v63 = v15;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v62, v68)) {
      goto LABEL_187;
    }
    uint64_t v16 = 720916;
    if (ccder_blob_decode_uint64() && v62 == v62 + v68)
    {
      if (v62 + v68 > v63) {
        goto LABEL_186;
      }
      unint64_t v64 = v62 + v68;
      unint64_t v65 = v63;
      goto LABEL_14;
    }
    return v16;
  }
LABEL_14:
  if (!ccder_blob_decode_tl()) {
    return 720917;
  }
  unint64_t v18 = v64;
  unint64_t v17 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v19 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 136) = v64;
  *(void *)(a1 + 144) = v19;
  if (__CFADD__(v18, v19)) {
    goto LABEL_187;
  }
  unint64_t v20 = v18 + v19;
  if (v18 > v20 || v20 > v17) {
    goto LABEL_186;
  }
  unint64_t v64 = v20;
  if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v64, (unint64_t *)(a1 + 152))) {
    return 720918;
  }
  if (!ccder_blob_decode_tl()) {
    return 720919;
  }
  unint64_t v22 = v64;
  unint64_t v21 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v23 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 120) = v64;
  *(void *)(a1 + 128) = v23;
  if (__CFADD__(v22, v23)) {
    goto LABEL_187;
  }
  unint64_t v24 = v22 + v23;
  if (v22 > v24 || v24 > v21) {
    goto LABEL_186;
  }
  unint64_t v64 = v24;
  if (!ccder_blob_decode_tl()) {
    return 720920;
  }
  unint64_t v26 = v64;
  unint64_t v25 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v27 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 72) = v64;
  *(void *)(a1 + 80) = v27;
  if (__CFADD__(v26, v27)) {
    goto LABEL_187;
  }
  unint64_t v28 = v26 + v27;
  if (v26 > v28 || v28 > v25) {
    goto LABEL_186;
  }
  unint64_t v64 = v28;
  if (!ccder_blob_decode_tl()) {
    return 720921;
  }
  unint64_t v29 = v64;
  unint64_t v30 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v31 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 104) = v64;
  *(void *)(a1 + 112) = v31;
  if (__CFADD__(v29, v31)) {
    goto LABEL_187;
  }
  unint64_t v32 = v29 + v31;
  if (v29 > v29 + v31 || v32 > v30) {
    goto LABEL_186;
  }
  unint64_t v64 = v29 + v31;
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return 720922;
  }
  unint64_t v33 = v64;
  unint64_t v34 = v68;
  unint64_t v35 = v64 - v32 + v68;
  if (!__CFADD__(v64 - v32, v68))
  {
    if (v35 > v30 - v32) {
      goto LABEL_186;
    }
    *(void *)(a1 + 88) = v32;
    *(void *)(a1 + 96) = v35;
    if (__CFADD__(v33, v34)) {
      goto LABEL_187;
    }
    unint64_t v36 = v33 + v34;
    if (v33 > v36 || v36 > v65) {
      goto LABEL_186;
    }
    unint64_t v63 = v65;
    unint64_t v64 = v36;
    unint64_t v62 = v36;
    if (ccder_blob_decode_tl()) {
      return 720923;
    }
    if (v64 > v65) {
      goto LABEL_186;
    }
    unint64_t v62 = v64;
    unint64_t v63 = v65;
    if (ccder_blob_decode_tl()) {
      return 720924;
    }
    if (v64 > v65) {
      goto LABEL_186;
    }
    unint64_t v62 = v64;
    unint64_t v63 = v65;
    if (ccder_blob_decode_tl())
    {
      unint64_t v60 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v61 = 0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v62, v68)) {
        goto LABEL_187;
      }
      if (v62 > v62 + v68 || v62 + v68 > v63) {
        goto LABEL_186;
      }
      unint64_t v60 = v62;
      unint64_t v61 = v62 + v68;
      if (!ccder_blob_decode_tl() || !v68) {
        return 720925;
      }
      unint64_t v37 = v60;
      if (__CFADD__(v60, v68)) {
LABEL_187:
      }
        __break(0x5513u);
      unint64_t v38 = v60 + v68;
      if (v60 > v60 + v68 || v38 > v61) {
        goto LABEL_186;
      }
      unint64_t v61 = v60 + v68;
      *(unsigned char *)(a1 + 266) = 0;
      memset(&v70[2], 0, 128);
      if (a3) {
        BOOL v39 = a4 == 0;
      }
      else {
        BOOL v39 = 1;
      }
      int v40 = !v39;
      memset(v70, 0, 32);
      if (v37 < v38)
      {
        unsigned __int8 v53 = 0;
        int v41 = 0;
        do
        {
          unint64_t v58 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v59 = 0xAAAAAAAAAAAAAAAALL;
          char v57 = 0;
          uint64_t v56 = 0;
          if ((ccder_blob_decode_tl() & 1) == 0) {
            return 720926;
          }
          unint64_t v54 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v55 = 0xAAAAAAAAAAAAAAAALL;
          if (__CFADD__(v60, v56)) {
            goto LABEL_187;
          }
          if (v60 > v60 + v56 || v60 + v56 > v61) {
            goto LABEL_186;
          }
          unint64_t v54 = v60;
          unint64_t v55 = v60 + v56;
          if (!ccder_blob_decode_tl()) {
            return 720927;
          }
          if (v55 < v54 || v68 > v55 - v54) {
            goto LABEL_186;
          }
          unint64_t v58 = v54;
          unint64_t v59 = v68;
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v54 > v54 + v68 || v54 + v68 > v55) {
            goto LABEL_186;
          }
          v54 += v68;
          if (!der_get_BOOLean(&v54, 1, &v57)) {
            return 720928;
          }
          if (!ccder_blob_decode_tl()) {
            return 720929;
          }
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v55 != v54 + v68) {
            return 720929;
          }
          if (v40 && !compare_octet_string_raw((uint64_t)&v58, a3, a4))
          {
            if (v55 < v54) {
              goto LABEL_186;
            }
            unint64_t v43 = v68;
            if (v68 > v55 - v54) {
              goto LABEL_186;
            }
            *(void *)(a1 + 248) = v54;
            *(void *)(a1 + 256) = v43;
          }
          if (v59 == 3)
          {
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 15)
            {
              uint64_t v16 = 720930;
              if ((v41 & 1) != 0 || (X509ExtensionParseKeyUsage() & 1) == 0) {
                return v16;
              }
              v41 |= 1u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 19)
            {
              uint64_t v16 = 720931;
              if ((v41 & 2) != 0
                || (X509ExtensionParseBasicConstraints(&v54, (void *)(a1 + 200), (unsigned char *)(a1 + 265)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 2u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 35)
            {
              uint64_t v16 = 720932;
              if ((v41 & 4) != 0
                || (X509ExtensionParseAuthorityKeyIdentifier(&v54, (unint64_t *)(a1 + 168), (void *)(a1 + 176)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 4u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 14)
            {
              uint64_t v16 = 720933;
              if ((v41 & 8) != 0
                || (X509ExtensionParseSubjectKeyIdentifier(&v54, (unint64_t *)(a1 + 184), (void *)(a1 + 192)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 8u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 37)
            {
              uint64_t v16 = 720934;
              if ((v41 & 0x10) != 0
                || (X509ExtensionParseExtendedKeyUsage(&v54, (unint64_t *)(a1 + 208), (void *)(a1 + 216)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x10u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 17)
            {
              uint64_t v16 = 720935;
              if ((v41 & 0x20) != 0
                || (X509ExtensionParseSubjectAltName(&v54, (unint64_t *)(a1 + 224), (void *)(a1 + 232)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x20u;
              goto LABEL_155;
            }
          }
          else if (v59 >= 8 && *(_DWORD *)v58 == -2042067414 && *(_DWORD *)(v58 + 3) == 1684273030)
          {
            uint64_t v16 = 720936;
            if (!X509CertificateVerifyOnlyOneAppleExtension((uint64_t)&v58, (uint64_t)v70, v53)) {
              return v16;
            }
            uint64_t result = X509ExtensionParseAppleExtension((uint64_t)&v54, v58, v59, (uint64_t *)(a1 + 240), (unint64_t *)(a1 + 248), v40);
            if (!result) {
              return v16;
            }
            if (v53 == 0xFF) {
              goto LABEL_189;
            }
            ++v53;
            goto LABEL_155;
          }
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v54 > v54 + v68 || v54 + v68 > v55) {
            goto LABEL_186;
          }
          v54 += v68;
          if (v57) {
            *(unsigned char *)(a1 + 266) = 1;
          }
LABEL_155:
          if (v54 != v55) {
            return 720926;
          }
          if (__CFADD__(v60, v56)) {
            goto LABEL_187;
          }
          unint64_t v37 = v60 + v56;
          if (v60 > v60 + v56) {
            goto LABEL_186;
          }
          unint64_t v38 = v61;
          if (v37 > v61) {
            goto LABEL_186;
          }
          v60 += v56;
        }
        while (v37 < v61);
      }
      if (v37 != v38) {
        return 720925;
      }
      if (v37 > v65 || v64 > v37) {
        goto LABEL_186;
      }
      unint64_t v64 = v37;
    }
    if (*(void *)(a1 + 32) < 3uLL)
    {
      uint64_t v16 = 720915;
      if (v64 != v65) {
        return v16;
      }
LABEL_170:
      if (__CFADD__(v66, v69)) {
        goto LABEL_187;
      }
      if (v66 > v66 + v69 || v66 + v69 > v67) {
        goto LABEL_186;
      }
      v66 += v69;
      if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v66, (unint64_t *)(a1 + 40))) {
        return 720937;
      }
      *(void *)&v70[0] = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v70[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v60 = 0;
      uint64_t result = ccder_blob_decode_bitstring();
      if (!result) {
        return 720938;
      }
      if (v60 < 0xFFFFFFFFFFFFFFF9)
      {
        if (*((void *)&v70[0] + 1) >= *(void *)&v70[0])
        {
          unint64_t v51 = (v60 + 7) >> 3;
          if (v51 <= *((void *)&v70[0] + 1) - *(void *)&v70[0])
          {
            *(void *)(a1 + 56) = *(void *)&v70[0];
            *(void *)(a1 + 64) = v51;
            unint64_t v52 = v67;
            if (v66 <= v67)
            {
              uint64_t v16 = 0;
              *a2 = v66;
              a2[1] = v52;
              return v16;
            }
          }
        }
        goto LABEL_186;
      }
      goto LABEL_188;
    }
    if (v65 <= a2[1] && *a2 <= v65)
    {
      *a2 = v65;
      goto LABEL_170;
    }
LABEL_186:
    __break(0x5519u);
    goto LABEL_187;
  }
LABEL_188:
  __break(0x5500u);
LABEL_189:
  __break(0x5507u);
  return result;
}

uint64_t der_get_BOOLean(void *a1, int a2, unsigned char *a3)
{
  if (*a1 > a1[1]) {
    __break(0x5519u);
  }
  if ((ccder_blob_decode_tl() & 1) != 0 || !a2) {
    return 0;
  }
  if (a3) {
    *a3 = 0;
  }
  return 1;
}

uint64_t X509ExtensionParseKeyUsage()
{
  uint64_t result = ccder_blob_decode_bitstring();
  if (result) {
    return 0;
  }
  return result;
}

uint64_t X509ExtensionParseBasicConstraints(void *a1, void *a2, unsigned char *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    uint64_t result = der_get_BOOLean(a1, 1, a3);
    if (result)
    {
      if (ccder_blob_decode_uint64())
      {
        if (!*a3) {
          return 0;
        }
        *a2 = 0xAAAAAAAAAAAAAAAALL;
        *a2 = 0xAAAAAAAAAAAAAAABLL;
      }
      return 1;
    }
  }
  return result;
}

uint64_t X509ExtensionParseAuthorityKeyIdentifier(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556) {
      goto LABEL_15;
    }
    if (v7 - 0x5555555555555556 != a1[1]) {
      return 0;
    }
    if (v7 > v7 - 0x5555555555555556) {
      goto LABEL_16;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
        goto LABEL_16;
      }
      *a2 = v10;
      *a3 = 0xAAAAAAAAAAAAAAAALL;
    }
    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
LABEL_15:
      __break(0x5513u);
    }
    else
    {
      unint64_t v9 = v8 - 0x5555555555555556;
      if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
      {
        *a1 = v9;
        return 1;
      }
    }
LABEL_16:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseSubjectKeyIdentifier(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t X509ExtensionParseExtendedKeyUsage(unint64_t *a1, unint64_t *a2, void *a3)
{
  int v6 = ccder_blob_decode_tl();
  uint64_t result = 0;
  if (v6)
  {
    if (*a1 > a1[1]) {
      goto LABEL_11;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = a1[1];
    uint64_t result = ccder_blob_decode_tl();
    if (!result) {
      return result;
    }
    if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_11;
    }
    *a2 = v10;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v9 = v8 - 0x5555555555555556;
    if (v8 > v8 - 0x5555555555555556 || v9 > a1[1]) {
LABEL_11:
    }
      __break(0x5519u);
    *a1 = v9;
  }
  return result;
}

uint64_t X509ExtensionParseSubjectAltName(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result == 1)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t X509CertificateVerifyOnlyOneAppleExtension(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3 > 9) {
    return 0;
  }
  unint64_t v5 = (void *)result;
  unsigned __int8 v6 = 0;
  unint64_t v7 = ~a2;
  while (v7 >= 16 * (char)v6)
  {
    uint64_t result = compare_octet_string((uint64_t)v5, a2 + 16 * v6);
    if (!result) {
      return result;
    }
    if (a3 <= v6++)
    {
      uint64_t v9 = v5[1];
      unint64_t v10 = (void *)(a2 + 16 * a3);
      *unint64_t v10 = *v5;
      v10[1] = v9;
      return 1;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t X509ExtensionParseAppleExtension(uint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, int a6)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if (a6) {
    a5 = 0;
  }
  if (a3 == 11)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10901066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10301066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x200;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10601066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x800;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11801066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x12401066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11901066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x21901066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x8000;
      goto LABEL_275;
    }
LABEL_159:
    int v44 = 0;
LABEL_160:
    if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 27)
    {
      return X509ExtensionParseServerAuthMarker(result, a2, a3, a4, a5);
    }
    if (v44)
    {
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
      {
        uint64_t result = ccder_blob_check_null();
        if (!result) {
          return result;
        }
        uint64_t v24 = *a4 | 0x400000;
        goto LABEL_275;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
      {
        uint64_t result = ccder_blob_check_null();
        if (!result) {
          return result;
        }
        uint64_t v54 = *a4;
        uint64_t v55 = 37748736;
        goto LABEL_205;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4354)
      {
        uint64_t result = ccder_blob_check_null();
        if (!result) {
          return result;
        }
        uint64_t v54 = *a4;
        uint64_t v55 = 0x8004000000;
        goto LABEL_205;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327)
      {
        return (uint64_t)X509ExtensionParseMFI4Properties((unint64_t *)result, a4, a5);
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841)
      {
        unint64_t v52 = *(void *)result;
        unint64_t v51 = *(void *)(result + 8);
        if (a5)
        {
          if (v52 > v51) {
            goto LABEL_281;
          }
          *a5 = v52;
          a5[1] = v51 - v52;
        }
        *a4 |= 0x80000000uLL;
LABEL_243:
        if (v52 <= v51)
        {
          *(void *)uint64_t result = v51;
          return 1;
        }
LABEL_281:
        __break(0x5519u);
        return result;
      }
    }
LABEL_242:
    unint64_t v52 = *(void *)result;
    unint64_t v51 = *(void *)(result + 8);
    goto LABEL_243;
  }
  if (a3 == 10)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v54 = *a4;
      uint64_t v55 = 0x58600003F0D0;
LABEL_205:
      uint64_t v24 = v54 | v55;
LABEL_275:
      *a4 = v24;
      return 1;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538) {
      goto LABEL_209;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0xF00;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_209:
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x40;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x1000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315)
    {
      return X509ExtensionParseMFISWAuth((unint64_t *)result, a4, a5);
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x300000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304)
    {
      return X509ExtensionParseGenericSSLMarker();
    }
    int v44 = 1;
    goto LABEL_160;
  }
  if (a3 != 9)
  {
    if (a3 < 0xA) {
      goto LABEL_242;
    }
    goto LABEL_159;
  }
  if (*(void *)a2 == 0xB6463F78648862ALL && *(unsigned char *)(a2 + 8) == 1)
  {
    return X509ExtensionParseComponentAuth((unint64_t *)result, a4, a5);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 49)
  {
    char v56 = 0;
    uint64_t result = der_get_BOOLean((void *)result, 0, &v56);
    if (result)
    {
      uint64_t v53 = 0x10000080002;
      if (!v56) {
        uint64_t v53 = 0x20000040001;
      }
      *a4 |= v53;
    }
    return result;
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 44)
  {
    return X509ExtensionParseCertifiedChipIntermediate((unint64_t *)result, a4, a5);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 36)
  {
    return X509ExtensionParseMFIAuthv3Leaf((unint64_t *)result);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 22)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v54 = *a4;
    uint64_t v55 = 1048584;
    goto LABEL_205;
  }
  if (*(void *)a2 == 0xC6463F78648862ALL && *(unsigned char *)(a2 + 8) == 19)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x8000000000;
    goto LABEL_275;
  }
  if (*(void *)a2 == 0xA6463F78648862ALL && *(unsigned char *)(a2 + 8) == 1)
  {
    *a4 |= 0x1000000uLL;
    goto LABEL_242;
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 29)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x2000000;
    goto LABEL_275;
  }
  if (*(void *)a2 == 0xC6463F78648862ALL && *(unsigned char *)(a2 + 8) == 14)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x4000000;
    goto LABEL_275;
  }
  if (*(void *)a2 != 0x86463F78648862ALL || *(unsigned char *)(a2 + 8) != 3) {
    goto LABEL_242;
  }

  return X509ExtensionParseDeviceAttestationIdentity((unint64_t *)result, a4, a5);
}

uint64_t X509CertificateParseWithExtension(unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v8 = 720939;
  unint64_t v9 = *a2;
  unint64_t v10 = a2[1];
  if (!ccder_blob_decode_tl()) {
    return v8;
  }
  unint64_t v11 = *a2;
  uint64_t result = X509CertificateParseImplicit((uint64_t)a1, a2, a3, a4);
  uint64_t v8 = result;
  if (result) {
    return v8;
  }
  if (v11 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }
  uint64_t v8 = 720939;
  if (*a2 != v11 - 0x5555555555555556) {
    return v8;
  }
  unint64_t v13 = v11 - v9 - 0x5555555555555556;
  if (v11 - v9 >= 0x5555555555555556) {
    goto LABEL_11;
  }
  if (v10 >= v9 && v13 <= v10 - v9)
  {
    *a1 = v9;
    a1[1] = v13;
    X509PolicyCheckForBlockedKeys((uint64_t)a1);
    return 0;
  }
LABEL_12:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParse(unint64_t *a1, unint64_t *a2)
{
  return X509CertificateParseWithExtension(a1, a2, 0, 0);
}

uint64_t X509CertificateParseSPKI(unint64_t *a1, unint64_t *a2, unint64_t *a3, void *a4)
{
  unint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  if (__CFADD__(*a1, v5)) {
    goto LABEL_31;
  }
  unint64_t v6 = v4 + v5;
  if (v4 > v6) {
    goto LABEL_30;
  }
  uint64_t v10 = 655361;
  unint64_t v14 = *a1;
  unint64_t v15 = v6;
  if (!ccder_blob_decode_tl()) {
    return v10;
  }
  if (!ccder_blob_decode_tl()) {
    return 655363;
  }
  if (v14 >= 0x5555555555555556) {
LABEL_31:
  }
    __break(0x5513u);
  if (v14 > v14 - 0x5555555555555556 || v14 - 0x5555555555555556 > v15) {
    goto LABEL_30;
  }
  unint64_t v13 = v14 - 0x5555555555555556;
  if (!ccder_blob_decode_tl()) {
    return 655362;
  }
  if (a2)
  {
    if (v13 >= v14)
    {
      *a2 = v14;
      a2[1] = 0xAAAAAAAAAAAAAAAALL;
      goto LABEL_12;
    }
LABEL_30:
    __break(0x5519u);
    goto LABEL_31;
  }
LABEL_12:
  unint64_t v11 = v14 - 0x5555555555555556;
  if (v14 > v14 - 0x5555555555555556 || v11 > v13) {
    goto LABEL_30;
  }
  if (v11 == v13)
  {
    if (a3)
    {
      *a3 = 0;
      a3[1] = 0;
    }
  }
  else if (a3)
  {
    *a3 = v11;
    a3[1] = v13 - v11;
  }
  if (v13 > v15 || v14 > v13) {
    goto LABEL_30;
  }
  if (!ccder_blob_decode_bitstring()) {
    return 655364;
  }
  *a4 = 0;
  a4[1] = 0;
  if (v13 == v15) {
    return 0;
  }
  else {
    return 655365;
  }
}

uint64_t X509CertificateParseKey(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t result = 327691;
  if (a1)
  {
    if (*(void *)(a1 + 96))
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t result = X509CertificateParseSPKI((unint64_t *)(a1 + 88), 0, 0, &v8);
      if (!result)
      {
        if (a2)
        {
          if (a3)
          {
            uint64_t v7 = v9;
            *a2 = v8;
            *a3 = v7;
          }
        }
      }
    }
  }
  return result;
}

uint64_t X509CertificateCheckSignatureDigest(char a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v16 = 0uLL;
  long long v15 = 0uLL;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v7 = X509CertificateParseSPKI((unint64_t *)(a2 + 88), (unint64_t *)&v16, (unint64_t *)&v15, &v13);
  if (v7) {
    return v7;
  }
  uint64_t v7 = 655632;
  int v9 = compare_octet_string((uint64_t)&v16, (uint64_t)&rsaEncryption);
  uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureRSA;
  if (v9)
  {
    int v11 = compare_octet_string((uint64_t)&v16, (uint64_t)&ecPublicKey);
    uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureEC;
    if (v11) {
      return 655617;
    }
  }
  unint64_t v12 = v10;
  if (((a1 & 1) == 0 || compare_octet_string_raw(a4, &CTOidSha1, 5uLL))
    && ((a1 & 4) == 0 || compare_octet_string_raw(a4, &CTOidSha256, 9uLL))
    && ((a1 & 8) == 0 || compare_octet_string_raw(a4, &CTOidSha384, 9uLL))
    && ((a1 & 0x10) == 0 || compare_octet_string_raw(a4, &CTOidSha512, 9uLL)))
  {
    return v7;
  }
  uint64_t result = v13;
  if ((v14 || !v13) && (a3[1] || !*a3))
  {
    if (v12(v13)) {
      return 0;
    }
    else {
      return 655648;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignature(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v10[2] = v6;
  v10[3] = v6;
  v10[0] = v6;
  v10[1] = v6;
  v9[0] = v10;
  v9[1] = 64;
  v8[0] = 0;
  v8[1] = 0;
  uint64_t result = X509MatchSignatureAlgorithm(a3, a4, (uint64_t)v9, v8);
  if (!result) {
    return X509CertificateCheckSignatureDigest(a1, a2, v9, (uint64_t)v8);
  }
  return result;
}

uint64_t X509MatchSignatureAlgorithm(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result = compare_octet_string_raw(a2, &sha1WithRSA_oid, 9uLL);
  if (!result) {
    goto LABEL_8;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha256WithRSA_oid, 9uLL);
  if (!result)
  {
LABEL_10:
    *a4 = &CTOidSha256;
    a4[1] = 9;
    if (*(void *)(a3 + 8) < 0x20uLL) {
      goto LABEL_15;
    }
    *(void *)(a3 + 8) = 32;
    ccsha256_di();
    goto LABEL_14;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha384WithRSA_oid, 9uLL);
  if (!result) {
    goto LABEL_12;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha1WithECDSA_oid, 7uLL);
  if (!result)
  {
LABEL_8:
    *a4 = &CTOidSha1;
    a4[1] = 5;
    if (*(void *)(a3 + 8) < 0x14uLL) {
      goto LABEL_15;
    }
    *(void *)(a3 + 8) = 20;
    ccsha1_di();
LABEL_14:
    ccdigest();
    return 0;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha256WithECDSA_oid, 8uLL);
  if (!result) {
    goto LABEL_10;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha384WithECDSA_oid, 8uLL);
  if (result) {
    return 656640;
  }
LABEL_12:
  *a4 = &CTOidSha384;
  a4[1] = 9;
  if (*(void *)(a3 + 8) >= 0x30uLL)
  {
    *(void *)(a3 + 8) = 48;
    ccsha384_di();
    goto LABEL_14;
  }
LABEL_15:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignatureWithPublicKey(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  _OWORD v16[2] = v7;
  v16[3] = v7;
  v16[0] = v7;
  v16[1] = v7;
  uint64_t v14 = v16;
  uint64_t v15 = 64;
  long long v13 = 0uLL;
  uint64_t matched = X509MatchSignatureAlgorithm(a4, a5, (uint64_t)&v14, &v13);
  if (matched) {
    return matched;
  }
  uint64_t matched = 655617;
  int v9 = compare_octet_string(a2, (uint64_t)&rsaEncryption);
  uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureRSA;
  if (v9)
  {
    int v11 = compare_octet_string(a2, (uint64_t)&ecPublicKey);
    uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureEC;
    if (v11) {
      return matched;
    }
  }
  uint64_t result = *a1;
  if ((a1[1] || !result) && (!v14 || v15))
  {
    if (v10(result)) {
      return 0;
    }
    else {
      return 655648;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParseGeneralNamesContent(uint64_t a1, uint64_t (*a2)(void, int *, uint64_t), uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v3 = *(void *)(a1 + 224);
  uint64_t v4 = *(void *)(a1 + 232);
  if (__CFADD__(v3, v4))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }
  unint64_t v5 = v3 + v4;
  if (v3 > v5) {
    goto LABEL_11;
  }
  unint64_t v10 = *(void *)(a1 + 224);
  unint64_t v11 = v5;
  while (1)
  {
    if (v10 >= v11) {
      return 0;
    }
    memset(v9, 170, sizeof(v9));
    if ((ccder_blob_decode_GeneralName(&v10, v9, (unint64_t *)&v9[1]) & 1) == 0) {
      break;
    }
    if ((a2(v9[0], &v9[1], a3) & 1) == 0) {
      return 0;
    }
  }
  return 720912;
}

uint64_t X509CertificateSubjectNameGetCommonName(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  unint64_t v20 = v3;
  if (__CFADD__(*a1, v3)) {
    goto LABEL_59;
  }
  unint64_t v4 = v2 + v3;
  if (v2 > v4)
  {
LABEL_58:
    __break(0x5519u);
    goto LABEL_59;
  }
  uint64_t v6 = 720901;
  unint64_t v18 = *a1;
  unint64_t v19 = v4;
  *a2 = 0;
  a2[1] = 0;
  if (v2 < v4)
  {
    while (1)
    {
      if (!ccder_blob_decode_tl() || !v20) {
        return 720898;
      }
      unint64_t v2 = v18;
      if (__CFADD__(v18, v20)) {
        break;
      }
      unint64_t v7 = v18 + v20;
      if (v18 > v18 + v20 || v7 > v19) {
        goto LABEL_58;
      }
      unint64_t v16 = v18;
      unint64_t v17 = v18 + v20;
      while (v2 < v7)
      {
        if (!ccder_blob_decode_tl()) {
          return 720899;
        }
        if (__CFADD__(v16, v20)) {
          goto LABEL_59;
        }
        if (v16 > v16 + v20 || v16 + v20 > v17) {
          goto LABEL_58;
        }
        unint64_t v15 = v16 + v20;
        if (!ccder_blob_decode_tl()) {
          return 720900;
        }
        unint64_t v2 = v16 + v20;
        if (v16 > v15) {
          goto LABEL_58;
        }
        if (__CFADD__(v16, v20)) {
          goto LABEL_59;
        }
        if (v16 > v16 + v20) {
          goto LABEL_58;
        }
        unint64_t v14 = v16 + v20;
        if (v20 == 3 && *(_WORD *)v16 == 1109 && *(unsigned char *)(v16 + 2) == 3)
        {
          unint64_t v12 = v16 + v20;
          unint64_t v13 = v16 + v20;
          if ((ccder_blob_decode_tl() & 1) == 0)
          {
            if (v14 > v15) {
              goto LABEL_58;
            }
            unint64_t v12 = v16 + v20;
            unint64_t v13 = v16 + v20;
            if ((ccder_blob_decode_tl() & 1) == 0)
            {
              if (v14 > v15) {
                goto LABEL_58;
              }
              unint64_t v12 = v16 + v20;
              unint64_t v13 = v16 + v20;
              if (!ccder_blob_decode_tl()) {
                return v6;
              }
            }
          }
          if (__CFADD__(v12, v20)) {
            goto LABEL_59;
          }
          unint64_t v2 = v12 + v20;
          if (v15 != v12 + v20) {
            return 720902;
          }
          if (v13 < v12 || v20 > v13 - v12) {
            goto LABEL_58;
          }
          *a2 = v12;
          a2[1] = v20;
        }
        unint64_t v7 = v18 + v20;
        if (v2 > v17 || v16 > v2) {
          goto LABEL_58;
        }
        unint64_t v16 = v2;
      }
      if (v2 != v7) {
        return 720903;
      }
      unint64_t v4 = v19;
      if (v2 > v19 || v18 > v2) {
        goto LABEL_58;
      }
      unint64_t v18 = v2;
      if (v2 >= v19) {
        goto LABEL_46;
      }
    }
LABEL_59:
    __break(0x5513u);
  }
LABEL_46:
  if (v2 != v4) {
    return 720904;
  }
  if (a2[1] && *a2) {
    return 0;
  }
  *a2 = 0;
  a2[1] = 0;
  return 720905;
}

BOOL X509CertificateValidAtTime(uint64_t a1, time_t a2)
{
  BOOL result = 0;
  v6[1] = *MEMORY[0x263EF8340];
  time_t v5 = 0;
  v6[0] = 0;
  if (a1 && a2 != -1) {
    return !X509CertificateGetNotBefore(a1, v6)
  }
        && !X509CertificateGetNotAfter(a1, &v5)
        && difftime(a2, v6[0]) >= 0.0
        && difftime(a2, v5) <= 0.0;
  return result;
}

uint64_t X509CertificateGetNotBefore(uint64_t a1, time_t *a2)
{
  v4[2] = *(const char **)MEMORY[0x263EF8340];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateParseValidity(a1);
  if (!result) {
    return X509TimeConvert(v4, a2);
  }
  return result;
}

uint64_t X509CertificateGetNotAfter(uint64_t a1, time_t *a2)
{
  v4[2] = *(const char **)MEMORY[0x263EF8340];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateParseValidity(a1);
  if (!result) {
    return X509TimeConvert(v4, a2);
  }
  return result;
}

BOOL X509CertificateIsValid(uint64_t a1)
{
  time_t v2 = time(0);

  return X509CertificateValidAtTime(a1, v2);
}

uint64_t X509CertificateParseValidity(uint64_t result)
{
  time_t v6[2] = *MEMORY[0x263EF8340];
  uint64_t v1 = 720906;
  if (!result) {
    return v1;
  }
  unint64_t v2 = *(void *)(result + 72);
  uint64_t v3 = *(void *)(result + 80);
  if (!v2 || v3 == 0) {
    return v1;
  }
  if (__CFADD__(v2, v3))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v5 = v2 + v3;
    if (v2 <= v5)
    {
      v6[0] = *(void *)(result + 72);
      v6[1] = v5;
      if (!ccder_blob_decode_Time(v6)) {
        return 720907;
      }
      if (ccder_blob_decode_Time(v6)) {
        return 0;
      }
      return 720908;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509TimeConvert(const char **a1, time_t *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = 720909;
  if (!a1) {
    return v2;
  }
  unint64_t v4 = a1[1];
  if (((unint64_t)v4 | 2) != 0xF) {
    return v2;
  }
  v11.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v11.tm_mon = v6;
  *(_OWORD *)&v11.tm_isdst = v6;
  *(_OWORD *)&v11.tm_sec = v6;
  unint64_t v7 = *a1;
  if (v4 == (const char *)13)
  {
    uint64_t result = (uint64_t)strptime(v7, "%y%m%d%H%M%SZ", &v11);
    if (result && v11.tm_year >= 150) {
      v11.tm_year -= 100;
    }
  }
  else
  {
    uint64_t result = (uint64_t)strptime(v7, "%Y%m%d%H%M%SZ", &v11);
  }
  int v9 = a1[1];
  if (!__CFADD__(*a1, v9))
  {
    if ((const char *)result != &v9[(void)*a1]) {
      return 720910;
    }
    time_t v10 = timegm(&v11);
    if (v10 == -1) {
      return 720911;
    }
    uint64_t v2 = 0;
    if (a2) {
      *a2 = v10;
    }
    return v2;
  }
  __break(0x5513u);
  return result;
}

BOOL X509ExtensionParseComponentAuth(unint64_t *a1, void *a2, unint64_t *a3)
{
  unint64_t v3 = a1[1];
  if (*a1 > v3) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  unint64_t v11 = v3 - *a1;
  if (ccder_blob_decode_tl()) {
    goto LABEL_5;
  }
  if (*a1 > a1[1]) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  if (ccder_blob_decode_tl())
  {
LABEL_5:
    unint64_t v8 = v12;
    unint64_t v7 = v13;
    if (v12 > v13) {
      goto LABEL_19;
    }
    *a1 = v12;
    a1[1] = v13;
    unint64_t v9 = v11;
  }
  else
  {
    unint64_t v8 = *a1;
    unint64_t v7 = a1[1];
    unint64_t v9 = v7 - *a1;
  }
  if (__CFADD__(v8, v9)) {
    goto LABEL_20;
  }
  if (v7 == v8 + v9)
  {
    if (!v9) {
      goto LABEL_16;
    }
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v8 <= v7)
      {
        *a1 = v7;
        return v7 == v8 + v9;
      }
      goto LABEL_19;
    }
    if (v8 <= v7 && v9 <= v7 - v8)
    {
      *a3 = v8;
      a3[1] = v9;
      goto LABEL_15;
    }
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
  }
  return v7 == v8 + v9;
}

uint64_t X509ExtensionParseCertifiedChipIntermediate(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      goto LABEL_12;
    }
    unint64_t v8 = v7 - 0x5555555555555556;
    if (a1[1] != v7 - 0x5555555555555556) {
      return 0;
    }
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v7 > v8) {
        goto LABEL_12;
      }
      *a3 = v7;
      a3[1] = 0xAAAAAAAAAAAAAAAALL;
    }
    if (v7 <= v8)
    {
      *a1 = v8;
      return 1;
    }
LABEL_12:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFIAuthv3Leaf(unint64_t *a1)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v3 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      unint64_t v4 = a1[1];
      if (v4 != v3 - 0x5555555555555556) {
        return 0;
      }
      if (v3 <= v4)
      {
        *a1 = v4;
        return 1;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFISWAuth(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      unint64_t v8 = a1[1];
      if (v8 != v7 - 0x5555555555555556) {
        return 0;
      }
      if (a3)
      {
        if (v8 < v7 || v8 - v7 < 0xAAAAAAAAAAAAAAAALL) {
          goto LABEL_13;
        }
        *a3 = v7;
        a3[1] = 0xAAAAAAAAAAAAAAAALL;
      }
      *a2 |= 0x30000000uLL;
      if (v7 <= v8)
      {
        *a1 = v8;
        return 1;
      }
    }
LABEL_13:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseGenericSSLMarker()
{
  return 0;
}

uint64_t X509ExtensionParseServerAuthMarker(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, unint64_t *a5)
{
  uint64_t result = ccder_blob_check_null();
  if (result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6) {
      goto LABEL_26;
    }
    if (__CFADD__(a2, a3)) {
      goto LABEL_26;
    }
    unint64_t v10 = a2 + a3;
    if (a2 + a3 == -1) {
      goto LABEL_26;
    }
    unint64_t v11 = a2 + 9;
    unint64_t v12 = (char *)(a2 + 9);
    while (1)
    {
      BOOL v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      BOOL v14 = v13;
      if ((unint64_t)v12 >= v10 - 1) {
        break;
      }
      if (!v14) {
        goto LABEL_25;
      }
      int v15 = *v12++;
      if ((v15 & 0x80000000) == 0) {
        return 0;
      }
    }
    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }
    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= 0x100000000uLL;
        return 1;
      }
      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }
      goto LABEL_25;
    }
    return 0;
  }
  return result;
}

uint64_t X509ExtensionParseDeviceAttestationIdentity(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556) {
      goto LABEL_17;
    }
    if (a1[1] != v7 - 0x5555555555555556) {
      return 0;
    }
    if (v7 > v7 - 0x5555555555555556) {
      goto LABEL_18;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      uint64_t result = ccder_blob_decode_tl();
      if (result)
      {
        if (a3)
        {
          if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
            goto LABEL_18;
          }
          *a3 = v10;
          a3[1] = 0xAAAAAAAAAAAAAAAALL;
        }
        *a2 |= 0x240000800000uLL;
        unint64_t v8 = *a1;
        if (*a1 < 0x5555555555555556)
        {
          unint64_t v9 = v8 - 0x5555555555555556;
          if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
          {
            *a1 = v9;
            return 1;
          }
LABEL_18:
          __break(0x5519u);
          return result;
        }
LABEL_17:
        __break(0x5513u);
        goto LABEL_18;
      }
    }
  }
  return result;
}

unint64_t *X509ExtensionParseMFI4Properties(unint64_t *result, void *a2, unint64_t *a3)
{
  unint64_t v4 = *result;
  unint64_t v3 = result[1];
  unint64_t v5 = v3 - *result;
  if (v5 != 32) {
    return (unint64_t *)(v5 == 32);
  }
  if (a3)
  {
    if (v4 > v3)
    {
LABEL_12:
      __break(0x5519u);
      goto LABEL_13;
    }
    *a3 = v4;
    a3[1] = 32;
  }
  *a2 |= 0xC00000000uLL;
  if (v4 < 0xFFFFFFFFFFFFFFE0)
  {
    unint64_t v6 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v6)
    {
      *uint64_t result = v6;
      return (unint64_t *)(v5 == 32);
    }
    goto LABEL_12;
  }
LABEL_13:
  __break(0x5513u);
  return result;
}

unint64_t *X509ChainParseCertificateSet(unint64_t *result, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v5 = 0;
  *a4 = 0;
  a4[1] = 0;
  BOOL v6 = *result >= result[1] || a3 == 0;
  if (v6)
  {
LABEL_6:
    if (a5)
    {
      uint64_t result = 0;
      *a5 = v5;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    unint64_t v9 = result;
    uint64_t v10 = 0;
    unint64_t v11 = a2 + 304 * a3;
    unint64_t v12 = ~a2;
    BOOL v13 = a4 + 1;
    BOOL v14 = (void *)(a2 + 272);
    uint64_t v15 = a3 - 1;
    unint64_t v21 = a2 + 272;
    while ((unsigned __int128)(v10 * (__int128)304) >> 64 == (304 * v10) >> 63 && 304 * v10 <= v12)
    {
      unint64_t v16 = v14 - 34;
      if (v14 != (void *)272 && ((unint64_t)v16 >= v11 || (unint64_t)v16 < a2))
      {
LABEL_30:
        __break(0x5519u);
        break;
      }
      uint64_t result = (unint64_t *)X509CertificateParse(v14 - 34, v9);
      if (result) {
        return result;
      }
      if (v10)
      {
        if ((unint64_t)v16 < a2) {
          goto LABEL_30;
        }
        if ((unint64_t)(v14 + 4) > v11) {
          goto LABEL_30;
        }
        unint64_t v17 = (void *)*v13;
        void *v14 = 0;
        v14[1] = v17;
        if (v14 != (void *)272 && (unint64_t)v16 >= v11) {
          goto LABEL_30;
        }
        *unint64_t v17 = v16;
        *BOOL v13 = (unint64_t)v14;
      }
      else
      {
        uint64_t v18 = *a4;
        *(void *)(a2 + 272) = *a4;
        if (v18) {
          unint64_t v19 = (unint64_t *)(v18 + 280);
        }
        else {
          unint64_t v19 = v13;
        }
        *unint64_t v19 = v21;
        *a4 = v16;
        *(void *)(a2 + 280) = a4;
      }
      uint64_t v5 = v10 + 1;
      if (*v9 < v9[1])
      {
        v14 += 38;
        BOOL v6 = v15 == v10++;
        if (!v6) {
          continue;
        }
      }
      goto LABEL_6;
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t X509ChainGetCertificateUsingKeyIdentifier(uint64_t *a1, uint64_t a2)
{
  for (uint64_t i = *a1; i; uint64_t i = *(void *)(i + 272))
  {
    if (*(void *)(i + 192) && !compare_octet_string(a2, i + 184)) {
      break;
    }
  }
  return i;
}

void *X509ChainResetChain(void *result, void *a2)
{
  *uint64_t result = 0;
  result[1] = result;
  uint64_t v2 = (void *)*a2;
  if (*a2)
  {
    do
    {
      v2[36] = 0;
      v2[37] = 0;
      uint64_t v2 = (void *)v2[34];
    }
    while (v2);
  }
  return result;
}

uint64_t X509ChainBuildPathPartial(void *a1, uint64_t *a2, void *a3, int a4)
{
  if (!a1) {
    return 327691;
  }
  unint64_t v7 = a1;
  *a3 = a1;
  a3[1] = a1 + 36;
  a1[36] = 0;
  a1[37] = a3;
  uint64_t v8 = (uint64_t)(a1 + 15);
  uint64_t result = compare_octet_string((uint64_t)(a1 + 15), (uint64_t)(a1 + 13));
  if (result)
  {
    while (1)
    {
      uint64_t v10 = (uint64_t)(v7 + 21);
      if (!v7[22]
        || (uint64_t CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier(a2, (uint64_t)(v7 + 21))) == 0
        || (unint64_t v7 = (void *)CertificateUsingKeyIdentifier,
            compare_octet_string(CertificateUsingKeyIdentifier + 104, v8)))
      {
        unint64_t v7 = (void *)*a2;
        if (!*a2)
        {
LABEL_16:
          if (X509ChainGetAppleRootUsingKeyIdentifier(v10, 1)) {
            return 0;
          }
          uint64_t BAARootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v10);
          if (a4) {
            unsigned int v16 = 0;
          }
          else {
            unsigned int v16 = 524296;
          }
          if (BAARootUsingKeyIdentifier) {
            return 0;
          }
          else {
            return v16;
          }
        }
        while (compare_octet_string(v8, (uint64_t)(v7 + 13)))
        {
          unint64_t v7 = (void *)v7[34];
          if (!v7) {
            goto LABEL_16;
          }
        }
      }
      unint64_t v12 = (void *)*a3;
      if (*a3) {
        break;
      }
LABEL_13:
      BOOL v13 = (void *)a3[1];
      v7[36] = 0;
      v7[37] = v13;
      *BOOL v13 = v7;
      a3[1] = v7 + 36;
      uint64_t v8 = (uint64_t)(v7 + 15);
      int v14 = compare_octet_string((uint64_t)(v7 + 15), (uint64_t)(v7 + 13));
      uint64_t result = 0;
      if (!v14) {
        return result;
      }
    }
    while (v12 != v7)
    {
      unint64_t v12 = (void *)v12[36];
      if (!v12) {
        goto LABEL_13;
      }
    }
    return 524297;
  }
  return result;
}

uint64_t X509ChainGetAppleRootUsingKeyIdentifier(uint64_t result, int a2)
{
  uint64_t v2 = &numAppleRoots;
  if (!a2) {
    uint64_t v2 = &numAppleProdRoots;
  }
  uint64_t v3 = *v2;
  if (*v2)
  {
    uint64_t v4 = result;
    for (uint64_t i = (uint64_t *)&AppleRoots; i < (uint64_t *)&UcrtRootPublicKey && i >= (uint64_t *)&AppleRoots; ++i)
    {
      uint64_t v7 = *i;
      uint64_t result = compare_octet_string(v4, *i + 184);
      if (!result) {
        return v7;
      }
      if (!--v3) {
        return 0;
      }
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t X509ChainGetBAARootUsingKeyIdentifier(uint64_t result)
{
  uint64_t v1 = numBAARoots;
  if (numBAARoots)
  {
    uint64_t v2 = result;
    for (uint64_t i = (uint64_t *)&BAARoots; i < (uint64_t *)&SEKTestRootPublicKey && i >= (uint64_t *)&BAARoots; ++i)
    {
      uint64_t v5 = *i;
      uint64_t result = compare_octet_string(v2, *i + 184);
      if (!result) {
        return v5;
      }
      if (!--v1) {
        return 0;
      }
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t X509ChainBuildPath(void *a1, uint64_t *a2, void *a3)
{
  return X509ChainBuildPathPartial(a1, a2, a3, 0);
}

uint64_t X509ChainCheckPathWithOptions(char a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  BOOL v6 = a2;
  v35[4] = *MEMORY[0x263EF8340];
  uint64_t v8 = *a2;
  if (a3)
  {
    uint64_t v9 = *(void *)(a3 + 48);
    if (v9)
    {
      if (*(void *)(v9 + 8))
      {
        if (compare_octet_string(v9, v8 + 208)) {
          return 327701;
        }
        uint64_t v8 = *v6;
      }
    }
  }
  if (v8)
  {
    unint64_t v31 = v6;
    unint64_t v32 = a4;
    unint64_t v11 = 0;
    int v12 = 0;
    char v33 = 0;
    uint64_t v13 = -1;
    while (1)
    {
      unint64_t v14 = *(void *)(v8 + 288);
      unint64_t v15 = v14 + 304;
      if (v14)
      {
LABEL_10:
        char v16 = 0;
        goto LABEL_11;
      }
      if (!compare_octet_string(v8 + 120, v8 + 104))
      {
        char v16 = 0;
        unint64_t v15 = v8 + 304;
        unint64_t v14 = v8;
        goto LABEL_11;
      }
      if (!a3) {
        return v12 | 0x9000Du;
      }
      if (*(unsigned char *)(a3 + 16))
      {
        uint64_t AppleRootUsingKeyIdentifier = X509ChainGetAppleRootUsingKeyIdentifier(v8 + 168, *(unsigned __int8 *)(a3 + 17));
      }
      else
      {
        if (!*(void *)(a3 + 24)) {
          goto LABEL_58;
        }
        uint64_t AppleRootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v8 + 168);
      }
      unint64_t v14 = AppleRootUsingKeyIdentifier;
      v33 |= AppleRootUsingKeyIdentifier != 0;
      unint64_t v15 = AppleRootUsingKeyIdentifier + 304;
      if (AppleRootUsingKeyIdentifier) {
        goto LABEL_10;
      }
LABEL_58:
      if (!*(unsigned char *)(a3 + 19)) {
        return v12 | 0x9000Du;
      }
      unint64_t v14 = 0;
      char v16 = 1;
LABEL_11:
      if (v11 && *(void *)(v8 + 32) >= 2uLL)
      {
        if (!*(unsigned char *)(v8 + 265))
        {
          int v30 = 589825;
          return v12 | v30;
        }
        if ((*(unsigned char *)(v8 + 264) & 4) == 0)
        {
          int v30 = 589826;
          return v12 | v30;
        }
      }
      unint64_t v17 = *(void *)(v8 + 200);
      if (v17) {
        BOOL v18 = v17 >= v11;
      }
      else {
        BOOL v18 = 1;
      }
      if (!v18)
      {
        int v30 = 589827;
        return v12 | v30;
      }
      if (*(unsigned char *)(v8 + 266))
      {
        int v30 = 589831;
        return v12 | v30;
      }
      if (compare_octet_string(v8 + 40, v8 + 152))
      {
        int v30 = 589828;
        return v12 | v30;
      }
      if ((v16 & 1) == 0 && *(void *)(v8 + 168) && *(void *)(v8 + 176))
      {
        if (v14 >= v15) {
          goto LABEL_100;
        }
        if (compare_octet_string(v8 + 168, v14 + 184)) {
          return v12 | 0x9000Au;
        }
      }
      if (a3 && v11 && (*(void *)(v8 + 240) & *(void *)(a3 + 8)) == 0) {
        X509PolicySetFlagsForCommonNames(v8);
      }
      if (v14 == v8 && !*(void *)(v8 + 240))
      {
        X509PolicySetFlagsForRoots(a3, v8);
        if (a3)
        {
LABEL_34:
          if (*(unsigned char *)(a3 + 18) && !X509CertificateIsValid(v8)) {
            return v12 | 0x90009u;
          }
          uint64_t v19 = *(void *)(a3 + 8);
          if (!v11 && (*(void *)(v8 + 240) & v19) == 0)
          {
            X509PolicySetFlagsForMFI(v8);
            uint64_t v19 = *(void *)(a3 + 8);
          }
          v13 &= *(void *)(v8 + 240);
          if (v19 && (v19 & v13) == 0)
          {
            int v30 = 589829;
            return v12 | v30;
          }
          goto LABEL_49;
        }
      }
      else if (a3)
      {
        goto LABEL_34;
      }
      v13 &= *(void *)(v8 + 240);
LABEL_49:
      a1 |= v14 == v8;
      if ((v16 & 1) == 0)
      {
        if (v14 >= v15) {
          goto LABEL_100;
        }
        uint64_t result = X509CertificateCheckSignature(a1, v14, v8 + 16, v8 + 40);
        if (result) {
          return result;
        }
      }
      unint64_t v21 = v11 + 1;
      if (v11 == -1) {
        goto LABEL_99;
      }
      uint64_t v8 = *(void *)(v8 + 288);
      v12 += 256;
      ++v11;
      if (!v8)
      {
        BOOL v6 = v31;
        a4 = v32;
        LOBYTE(v8) = v33;
        if (a3) {
          goto LABEL_61;
        }
        goto LABEL_87;
      }
    }
  }
  unint64_t v21 = 0;
  uint64_t v13 = -1;
  if (!a3) {
    goto LABEL_87;
  }
LABEL_61:
  if (*(void *)a3)
  {
    unint64_t v22 = v21;
    if (v8)
    {
      unint64_t v22 = v21 + 1;
      if (v21 == -1)
      {
LABEL_99:
        __break(0x5500u);
LABEL_100:
        __break(0x5519u);
      }
    }
    if (*(void *)a3 != v22) {
      return (v22 << 8) | 0x90006u;
    }
  }
  uint64_t v23 = *(void *)(a3 + 24);
  if (!v23 || !*(void *)(v23 + 8))
  {
    if (!*(unsigned char *)(a3 + 16)) {
      goto LABEL_87;
    }
    int v24 = v21 << 8;
    uint64_t v25 = **(void **)(v6[1] + 8);
LABEL_75:
    uint64_t v27 = 184;
    if (v8) {
      uint64_t v27 = 168;
    }
    uint64_t v28 = X509ChainGetAppleRootUsingKeyIdentifier(v25 + v27, *(unsigned __int8 *)(a3 + 17));
    if (!v28) {
      return v24 | 0x9000Bu;
    }
    uint64_t v29 = v28;
    if ((v8 & 1) == 0 && !compare_octet_string(v25 + 88, v28 + 88)
      || !X509CertificateCheckSignature(29, v29, v25 + 16, v25 + 40))
    {
      goto LABEL_87;
    }
    int v26 = 589836;
    return v24 | v26;
  }
  int v24 = v21 << 8;
  uint64_t v25 = **(void **)(v6[1] + 8);
  if (*(unsigned char *)(a3 + 16)) {
    goto LABEL_75;
  }
  memset(v35, 170, 32);
  v34[0] = 0xAAAAAAAAAAAAAAAALL;
  v34[1] = 0xAAAAAAAAAAAAAAAALL;
  if (X509CertificateParseSPKI((unint64_t *)(v25 + 88), &v35[2], v34, v35))
  {
LABEL_72:
    int v26 = 589832;
    return v24 | v26;
  }
  if (compare_octet_string((uint64_t)&v35[2], *(void *)(a3 + 32))
    || compare_octet_string((uint64_t)v35, *(void *)(a3 + 24)))
  {
    if (X509CertificateCheckSignatureWithPublicKey(*(uint64_t **)(a3 + 24), *(void *)(a3 + 32), *(void *)(a3 + 40), v25 + 16, v25 + 40))goto LABEL_72; {
  }
    }
  else if (!compare_octet_string(*(void *)(a3 + 32), (uint64_t)&ecPublicKey))
  {
    compare_octet_string((uint64_t)v34, *(void *)(a3 + 40));
  }
LABEL_87:
  uint64_t result = 0;
  if (a4) {
    *a4 = v13;
  }
  return result;
}

uint64_t X509ChainCheckPath(char a1, uint64_t *a2, uint64_t a3)
{
  return X509ChainCheckPathWithOptions(a1, a2, a3, 0);
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  uint64_t v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_68;
  }
  uint64_t v5 = &v4[v3];
  BOOL v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    int v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      unint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0;
            }
LABEL_34:
            uint64_t result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          uint64_t result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          uint64_t v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28) {
            goto LABEL_69;
          }
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_68;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    int v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERDecodeItemPartialBuffer(uint64_t result, unint64_t *a2, int a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  uint64_t v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_54;
  }
  uint64_t v5 = &v4[v3];
  BOOL v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    int v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_55;
      }
      unint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        BOOL v17 = v16 < v15 && a3 == 0;
        unint64_t v18 = (unint64_t)(v12 + 1);
        if (v17) {
          return 3;
        }
LABEL_28:
        if (v15 > (~v18 & 0x7FFFFFFFFFFFFFFFLL)) {
          return 7;
        }
        if (v18 <= v18 + v15)
        {
          uint64_t result = 0;
          a2[1] = v18;
          a2[2] = v15;
          return result;
        }
        goto LABEL_55;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4)
      {
LABEL_55:
        __break(0x5519u);
LABEL_56:
        __break(0x5515u);
        return result;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v18 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_55;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_56;
        }
        unsigned int v23 = *v14++;
        unint64_t v15 = (v15 << 8) | v23;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (v15 <= v22) {
            char v24 = 1;
          }
          else {
            char v24 = a3;
          }
          uint64_t result = 3;
          if (v15 >= 0x80 && (v24 & 1) != 0) {
            goto LABEL_28;
          }
          return result;
        }
      }
    }
LABEL_54:
    __break(0x5513u);
    goto LABEL_55;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_54;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_55;
    }
    int v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, unsigned char *a3)
{
  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(void *)(result + 8)) {
    return 3;
  }
  unsigned int v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      unint64_t v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      unint64_t v6 = *(void *)result;
      unint64_t v7 = *(void *)result + v4;
      unint64_t v8 = (unsigned __int8 *)(*(void *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        unint64_t v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          uint64_t result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3) {
    return 3;
  }
  else {
    return 0;
  }
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  if (a1[1] != (unsigned __int8 *)1) {
    return 3;
  }
  int v2 = **a1;
  if (v2 != 255 && v2 != 0) {
    return 3;
  }
  uint64_t result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned int v3 = a1[1];
  if (!v3) {
    goto LABEL_9;
  }
  if (v3 == (unsigned __int8 *)1)
  {
    int v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      uint64_t result = 0;
      *a3 = a2;
      return result;
    }
  }
  return 3;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, v4);
  if (!result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      uint64_t result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3;
  }
  unsigned int v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7;
    }
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0) {
      return 3;
    }
    if (v2 > 9) {
      return 7;
    }
  }
LABEL_10:
  unint64_t v5 = 0;
  do
  {
    unsigned int v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  uint64_t result = 0;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, void *a2, void *a3)
{
  v8[3] = *MEMORY[0x263EF8340];
  memset(v8, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!result)
  {
    unint64_t v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        unint64_t v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          uint64_t result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  unint64_t v10[2] = *MEMORY[0x263EF8340];
  v10[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  v12[3] = *MEMORY[0x263EF8340];
  memset(v12, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!result)
  {
    if (v12[0] == 0x2000000000000010) {
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unint64_t v32 = 0;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }
  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    uint64_t v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = DERDecodeSeqNext(&v32, v31);
      if (result) {
        break;
      }
      if (a2 <= v13) {
        return 2;
      }
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3) {
          goto LABEL_58;
        }
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24 * v13 + 8)) {
          break;
        }
        uint64_t result = 2;
        if (v18)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1)) {
            continue;
          }
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4) {
          goto LABEL_59;
        }
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }
    if (result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        BOOL v25 = (__int16 *)(a3 + 24 * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0;
    }
    else {
      return 3;
    }
  }
  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent(unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  unint64_t v4[3] = *MEMORY[0x263EF8340];
  memset(v4, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v4, 0);
  if (!result)
  {
    if (v4[0] - 0x2000000000000012 >= 0xFFFFFFFFFFFFFFFELL) {
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  void v9[2] = *MEMORY[0x263EF8340];
  v9[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }
  unint64_t v4 = v2 + v3;
  if (v2 > v4) {
    goto LABEL_13;
  }
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  char v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if (result) {
      break;
    }
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if (result) {
      break;
    }
    if (v7) {
      return 0;
    }
  }
  if (result <= 1) {
    return 0;
  }
  else {
    return result;
  }
}

BOOL DEROidCompare(uint64_t a1, uint64_t a2)
{
  BOOL result = 0;
  if (a1 && a2)
  {
    size_t v4 = *(void *)(a1 + 8);
    return v4 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }
  return result;
}

uint64_t Img4DecodeSecureBootRsa4kSha384IM4C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&SecureBoot_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeLocalRsa4kSha384IM4C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&Local_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeShamRsa4kSha384IM4C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&Sham_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

void Img4DecodeEvaluateTrust(unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
}

double Img4DecodeCopyPayloadHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyPayloadHashWithCallback(a1, (void (*)(void, void, long long *))sha1_digest, a2, a3);
}

double Img4DecodeCopyManifestHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyManifestHashWithCallback(a1, (void (*)(void))sha1_digest, a2, a3);
}

double DERImg4DecodeFindInSequence(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  unint64_t v7 = 0;
  long long v8 = 0uLL;
  while (!DERDecodeSeqNext(a1, &v7))
  {
    if (v7 == a2)
    {
      double result = *(double *)&v8;
      *a3 = v8;
      return result;
    }
  }
  return result;
}

double DERImg4DecodeContentFindItemWithTag(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  v6[0] = 0;
  v6[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v6)) {
    return DERImg4DecodeFindInSequence(v6, a2, a3);
  }
  return result;
}

uint64_t DERImg4DecodeTagCompare(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 4) {
    return 0xFFFFFFFFLL;
  }
  if (v2 != 4) {
    return 1;
  }
  unsigned int v5 = 0;
  if (DERParseInteger((char **)a1, &v5)) {
    return 4294967294;
  }
  if (v5 < a2) {
    return 0xFFFFFFFFLL;
  }
  return v5 > a2;
}

uint64_t DERImg4Decode(void *a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      unint64_t v6 = 0;
      unint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t result = DERDecodeItem((uint64_t)a1, &v6);
      if (!result)
      {
        if (v6 == 0x2000000000000010)
        {
          uint64_t v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }
          else if (*a1 + v5 == v7 + v8)
          {
            uint64_t result = DERParseSequenceContentToObject(&v7, 4u, (uint64_t)&DERImg4ItemSpecs, a2, 0x40uLL, 0);
            if (!result) {
              return 2 * (DERImg4DecodeTagCompare(a2, 0x494D4734u) != 0);
            }
          }
          else
          {
            return 7;
          }
        }
        else
        {
          return 2;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadCompression(unint64_t *a1, char **a2)
{
  unsigned int v5 = 2;
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceContentToObject(a1, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)a2, 0x20uLL, 0);
      if (!result)
      {
        uint64_t result = DERParseInteger(a2, &v5);
        if (!result)
        {
          if (v5 <= 1) {
            return 0;
          }
          else {
            return 6;
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadWithProperties(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceToObject(a1, 7u, (uint64_t)&DERImg4PayloadWithPropertiesItemSpecs, a2, 0xA0uLL, 0);
      if (!result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else if (!*(void *)(a2 + 80) {
               || (long long v7 = 0u,
        }
                   long long v8 = 0u,
                   uint64_t result = DERImg4DecodePayloadCompression((unint64_t *)(a2 + 80), (char **)&v7),
                   !result))
        {
          uint64_t v6 = *(void *)(a2 + 96);
          uint64_t v5 = a2 + 96;
          if (!v6) {
            return 0;
          }
          long long v7 = 0u;
          long long v8 = 0u;
          uint64_t result = DERImg4DecodePayloadProperties(v5, (unint64_t)&v7);
          if (!result) {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadProperties(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4PayloadPropertiesItemSpecs, a2, 0x20uLL, 0);
      if (result) {
        return result;
      }
      if (DERImg4DecodeTagCompare(a2, 0x50415950u)) {
        return 2;
      }
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodePayload(uint64_t a1, unint64_t a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t result = 6;
  if (a1 && a2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t result = DERImg4DecodePayloadWithProperties(a1, (unint64_t)&v11);
    if (result)
    {
      uint64_t result = DERParseSequenceToObject(a1, 6u, (uint64_t)&DERImg4PayloadItemSpecs, a2, 0x90uLL, 0);
      if (!result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else
        {
          uint64_t v6 = *(void *)(a2 + 80);
          uint64_t v5 = (unint64_t *)(a2 + 80);
          if (!v6) {
            return 0;
          }
          memset(v10, 0, sizeof(v10));
          uint64_t result = DERImg4DecodePayloadCompression(v5, (char **)v10);
          if (!result) {
            return 0;
          }
        }
      }
    }
    else
    {
      long long v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      long long v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 48) = v8;
      long long v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }
  return result;
}

uint64_t DERImg4DecodeManifest(void *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 5uLL, (uint64_t)&DERImg4ManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeManifestCommon(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result = 6;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1]) {
      return 0;
    }
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }
    uint64_t result = DERParseSequenceToObject((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0);
    if (!result)
    {
      if (DERImg4DecodeTagCompare(a4, a5)) {
        return 2;
      }
      unsigned int v9 = 0;
      uint64_t result = DERParseInteger((char **)(a4 + 16), &v9);
      if (result) {
        return result;
      }
      if (v9 > 2) {
        return 2;
      }
      return 0;
    }
  }
  return result;
}

uint64_t DERImg4DecodeUnsignedManifest(void *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeCertificate(void *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 4uLL, (uint64_t)&DERImg4CertificateItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeUnsignedCertificate(void *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeCertificatePropertiesAndPubKey(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              v21[0] = a1;
              v21[1] = a2;
              long long v16 = 0u;
              long long v17 = 0u;
              long long v14 = 0u;
              long long v15 = 0u;
              uint64_t result = DERDecodeItem((uint64_t)v21, &v18);
              if (!result)
              {
                if (v18 != 0x2000000000000011) {
                  return 2;
                }
                if (!DERParseSequenceContentToObject(&v19, 2u, (uint64_t)&DERIM4CItemSpecs, (unint64_t)&v16, 0x20uLL, 0))
                {
                  uint64_t result = DERDecodeItem((uint64_t)&v16, &v18);
                  if (result) {
                    return result;
                  }
                  if (v18 != 0x2000000000000010) {
                    return 2;
                  }
                  if (!DERParseSequenceContentToObject(&v19, 2u, (uint64_t)&DERCRTPSequenceItemSpecs, (unint64_t)&v14, 0x20uLL, 0))
                  {
                    uint64_t v12 = *((void *)&v15 + 1);
                    *a3 = v15;
                    *a4 = v12;
                    uint64_t result = DERDecodeItem((uint64_t)&v17, &v18);
                    if (result) {
                      return result;
                    }
                    if (v18 == 4)
                    {
                      uint64_t result = 0;
                      uint64_t v13 = v20;
                      *a5 = v19;
                      *a6 = v13;
                      return result;
                    }
                    return 2;
                  }
                }
                return 0xFFFFFFFFLL;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodeRestoreInfo(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4RestoreInfoItemSpecs, a2, 0x20uLL, 0);
      if (result) {
        return result;
      }
      if (DERImg4DecodeTagCompare(a2, 0x494D3452u)) {
        return 2;
      }
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodeProperty(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a3)
    {
      unint64_t v14 = 0;
      long long v15 = 0uLL;
      long long v13 = 0uLL;
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      uint64_t v9 = 0;
      unint64_t v10 = 0;
      unsigned int v8 = 0;
      uint64_t result = DERDecodeSeqInit((uint64_t)a1, &v9, &v10);
      if (!result)
      {
        if (v9 != 0x2000000000000010) {
          return 2;
        }
        uint64_t result = DERDecodeSeqNext(&v10, &v14);
        if (result) {
          return result;
        }
        if (v14 != 22) {
          return 2;
        }
        uint64_t result = DERParseInteger((char **)&v15, &v8);
        if (result) {
          return result;
        }
        if ((v8 | 0xE000000000000000) != a2) {
          return 2;
        }
        *(_OWORD *)a3 = v15;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if (result) {
          return result;
        }
        *(void *)(a3 + 40) = v12;
        *(_OWORD *)(a3 + 24) = v13;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if (result != 1) {
          return 2;
        }
        uint64_t v7 = a1[1];
        if (__CFADD__(*a1, v7))
        {
          __break(0x5513u);
        }
        else if (v11 == *a1 + v7)
        {
          return 0;
        }
        else
        {
          return 7;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePropertyWithItem(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unsigned int v8 = 0;
  v9[0] = 0;
  void v9[2] = 0;
  v9[1] = 22;
  unint64_t v9[3] = 24;
  long long v10 = a3;
  uint64_t result = DERParseSequenceToObject(a1, 2u, (uint64_t)v9, a4, 0x30uLL, 0);
  if (!result)
  {
    uint64_t result = DERParseInteger((char **)a4, &v8);
    if (!result)
    {
      if ((v8 | 0xE000000000000000) == a2)
      {
        uint64_t result = 0;
        *(void *)(a4 + 16) = a2 | 0xE000000000000000;
        *(void *)(a4 + 40) = a3;
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

void DERImg4DecodeFindPropertyInSequence(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  long long v8 = 0uLL;
  DERImg4DecodeFindInSequence(a1, a2, &v8);
  if (!v7) {
    DERImg4DecodePropertyWithItem((uint64_t)&v8, a2, a3, a4);
  }
}

void DERImg4DecodeFindProperty(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  v7[0] = 0;
  v7[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v7)) {
    DERImg4DecodeFindPropertyInSequence(v7, a2, a3, a4);
  }
}

void DERImg4DecodeParseManifestProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

void DERImg4DecodeParseManifestPropertiesInternal(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4)
{
  int v11 = 0;
  if (a1)
  {
    if (a2 | a3)
    {
      unint64_t v14 = 0;
      v15[0] = 0;
      v15[1] = 0;
      memset(v13, 0, sizeof(v13));
      memset(v12, 0, sizeof(v12));
      if (!DERDecodeItem(a1 + 264, &v14)
        && v14 == 0x2000000000000011
        && !DERParseInteger((char **)(a1 + 248), &v11))
      {
        unint64_t v8 = v11 == 2 ? 0x2000000000000010 : 0x2000000000000011;
        DERImg4DecodeFindProperty(v15, a4 | 0xE000000000000000, v8, (unint64_t)v13);
        if (!v9)
        {
          if (a2) {
            *(_OWORD *)a2 = *(_OWORD *)((char *)&v13[1] + 8);
          }
          DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, 0xE00000004D414E50, 0x2000000000000011uLL, (unint64_t)v12);
          if (a3)
          {
            if (!v10) {
              *(_OWORD *)a3 = *(_OWORD *)((char *)&v12[1] + 8);
            }
          }
        }
      }
    }
  }
}

void DERImg4DecodeParseCertificateProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

uint64_t Img4DecodeParseLengthFromBufferWithTag(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  unint64_t v11 = 0;
  unint64_t v12 = 0;
  v16[0] = 0;
  v16[1] = 0;
  v14[1] = 0;
  unint64_t v15 = 0;
  uint64_t result = 0xFFFFFFFFLL;
  unint64_t v13 = 0;
  v14[0] = 0;
  if (a1)
  {
    if (a4)
    {
      v17[0] = a1;
      v17[1] = a2;
      uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v17, &v15, &v12);
      if (!result)
      {
        if (v12)
        {
          if (v15 != 0x2000000000000010) {
            return 2;
          }
          uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v16, &v13, &v11);
          if (result) {
            return result;
          }
          if (v11)
          {
            uint64_t result = DERImg4DecodeTagCompare((uint64_t)v14, a3);
            if (!result)
            {
              uint64_t v8 = v16[0] - a1;
              if (v12 >= ~(v16[0] - a1)) {
                return 7;
              }
              BOOL v9 = __CFADD__(v12, v8);
              uint64_t v10 = v12 + v8;
              if (v9)
              {
                __break(0x5500u);
              }
              else
              {
                uint64_t result = 0;
                *a4 = v10;
              }
              return result;
            }
            return 2;
          }
        }
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeParseLengthFromBuffer(uint64_t a1, uint64_t a2, void *a3)
{
  return Img4DecodeParseLengthFromBufferWithTag(a1, a2, 0x494D4734u, a3);
}

uint64_t Img4DecodePayloadExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 136)) {
      BOOL v4 = *(void *)(a1 + 144) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayload(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!result)
    {
      if (v5)
      {
        uint64_t result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 136);
        return result;
      }
      uint64_t result = 1;
    }
    goto LABEL_9;
  }
  uint64_t result = 6;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadType(uint64_t a1, _DWORD *a2)
{
  BOOL v5 = 0;
  uint64_t result = 6;
  if (!a1 || !a2 || (uint64_t result = Img4DecodePayloadExists(a1, &v5), result))
  {
LABEL_6:
    if (!a2) {
      return result;
    }
    goto LABEL_7;
  }
  if (v5)
  {
    uint64_t result = DERParseInteger((char **)(a1 + 104), a2);
    goto LABEL_6;
  }
  uint64_t result = 1;
  if (!a2) {
    return result;
  }
LABEL_7:
  if (result) {
    *a2 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadVersion(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!result)
    {
      if (v5)
      {
        uint64_t result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 120);
        return result;
      }
      uint64_t result = 1;
    }
    goto LABEL_9;
  }
  uint64_t result = 6;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodePayloadKeybagExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 152)) {
      BOOL v4 = *(void *)(a1 + 160) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadKeybag(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!result)
    {
      if (v5)
      {
        uint64_t result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 152);
        return result;
      }
      uint64_t result = 1;
    }
    goto LABEL_9;
  }
  uint64_t result = 6;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodePayloadCompressionInfoExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 168)) {
      BOOL v4 = *(void *)(a1 + 176) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadCompressionInfo(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  BOOL v11 = 0;
  uint64_t result = 6;
  if (!a1) {
    goto LABEL_14;
  }
  if (!a2) {
    goto LABEL_14;
  }
  if (!a3) {
    goto LABEL_14;
  }
  uint64_t result = Img4DecodePayloadExists(a1, &v11);
  if (result) {
    goto LABEL_14;
  }
  if (!v11) {
    goto LABEL_13;
  }
  uint64_t result = Img4DecodePayloadCompressionInfoExists(a1, &v11);
  if (result) {
    goto LABEL_14;
  }
  if (!v11)
  {
LABEL_13:
    uint64_t result = 1;
    goto LABEL_14;
  }
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v8 = *(void *)(a1 + 168);
  int v7 = (unint64_t *)(a1 + 168);
  if (!v8)
  {
    uint64_t result = 0xFFFFFFFFLL;
    if (!a2) {
      return result;
    }
LABEL_15:
    if (a3)
    {
      *a2 = -1;
      *a3 = -1;
    }
    return result;
  }
  uint64_t result = DERParseSequenceContentToObject(v7, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)&v9, 0x20uLL, 0);
  if (result
    || (uint64_t result = DERParseInteger((char **)&v9, a2), result)
    || (uint64_t result = DERParseInteger((char **)&v10, a3), result))
  {
LABEL_14:
    if (!a2) {
      return result;
    }
    goto LABEL_15;
  }
  return result;
}

double Img4DecodeCopyPayloadHashWithCallback(uint64_t a1, void (*a2)(void, void, long long *), uint64_t a3, int a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3) {
      return *(double *)&v7;
    }
LABEL_9:
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    return *(double *)&v7;
  }
  BOOL v9 = 0;
  if (Img4DecodePayloadExists(a1, &v9) || !v9) {
    goto LABEL_9;
  }
  if (*(unsigned char *)a1)
  {
    long long v7 = *(_OWORD *)(a1 + 184);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 200);
    *(_OWORD *)a3 = v7;
  }
  else
  {
    long long v10 = 0uLL;
    int v11 = 0;
    a2(*(void *)(a1 + 8), *(void *)(a1 + 16), &v10);
    *(void *)&long long v7 = v10;
    *(_OWORD *)a3 = v10;
    *(_DWORD *)(a3 + 16) = v11;
  }
  return *(double *)&v7;
}

uint64_t Img4DecodeCopyPayloadDigest(uint64_t a1, void *a2, size_t a3, uint64_t (**a4)(void, void, _OWORD *, size_t, void))
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          BOOL v10 = 0;
          if (*a4)
          {
            if (!Img4DecodePayloadExists(a1, &v10))
            {
              if (v10)
              {
                if (a3 > 0x30)
                {
                  return 7;
                }
                else if (*(unsigned char *)a1)
                {
                  memcpy(a2, (const void *)(a1 + 184), a3);
                  return 0;
                }
                else
                {
                  memset(__src, 0, sizeof(__src));
                  uint64_t v4 = (*a4)(*(void *)(a1 + 8), *(void *)(a1 + 16), __src, a3, a4);
                  if (!v4) {
                    memcpy(a2, __src, a3);
                  }
                }
              }
              else
              {
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t Img4DecodeManifestExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(void *)(a1 + 24) != 0;
    }
  }
  return result;
}

double Img4DecodeCopyManifestHashWithCallback(uint64_t a1, void (*a2)(void), uint64_t a3, int a4)
{
  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3) {
      return *(double *)&v5;
    }
LABEL_8:
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    return *(double *)&v5;
  }
  if (!*(void *)(a1 + 24)) {
    goto LABEL_8;
  }
  if (*(unsigned char *)(a1 + 1))
  {
    long long v5 = *(_OWORD *)(a1 + 328);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 344);
    *(_OWORD *)a3 = v5;
  }
  else
  {
    a2();
    *(void *)&long long v5 = 0;
    *(_OWORD *)a3 = 0uLL;
    *(_DWORD *)(a3 + 16) = 0;
  }
  return *(double *)&v5;
}

uint64_t Img4DecodeCopyManifestDigest(uint64_t a1, void *__dst, size_t __n, uint64_t (**a4)(uint64_t, void, _OWORD *, size_t, void))
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = 6;
  if (a1)
  {
    if (__dst)
    {
      if (__n)
      {
        if (a4)
        {
          long long v7 = *a4;
          if (*a4)
          {
            uint64_t v8 = *(void *)(a1 + 24);
            if (v8)
            {
              if (__n > 0x30)
              {
                return 7;
              }
              else if (*(unsigned char *)(a1 + 1))
              {
                memcpy(__dst, (const void *)(a1 + 328), __n);
                return 0;
              }
              else
              {
                memset(v10, 0, sizeof(v10));
                uint64_t v4 = v7(v8, *(void *)(a1 + 32), v10, __n, a4);
                if (!v4) {
                  memcpy(__dst, v10, __n);
                }
              }
            }
            else
            {
              return 1;
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t Img4DecodeGetManifest(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t result = 6;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(void *)(a1 + 24);
    *a2 = v5;
    int v6 = *(_DWORD *)(a1 + 32);
    *a3 = v6;
    if (v5) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    int v8 = v7;
    return (v8 << 31 >> 31);
  }
  return result;
}

uint64_t Img4DecodeSectionExists(void *a1, unsigned int a2, char *a3)
{
  uint64_t v3 = 6;
  if (a2 <= 1 && a1 && a3)
  {
    if (a2 == 1)
    {
      if (!a1[55] || !a1[56]) {
        goto LABEL_11;
      }
    }
    else if (!a1[33] || !a1[34])
    {
LABEL_11:
      char v4 = 0;
      goto LABEL_12;
    }
    char v4 = 1;
LABEL_12:
    uint64_t v3 = 0;
    *a3 = v4;
  }
  return v3;
}

uint64_t Img4DecodeRestoreInfoExists(void *a1, char *a2)
{
  return Img4DecodeSectionExists(a1, 1u, a2);
}

uint64_t Img4DecodeGetRestoreInfoBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  return Img4DecodeGetBooleanFromSection(a1, 1u, a2, a3);
}

uint64_t Img4DecodeGetBooleanFromSection(uint64_t a1, unsigned int a2, uint64_t a3, BOOL *a4)
{
  memset(v8, 0, sizeof(v8));
  uint64_t v4 = 6;
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
      uint64_t v4 = v6;
      if (!v6) {
        return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
      }
    }
  }
  return v4;
}

void Img4DecodeGetRestoreInfoInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
}

void Img4DecodeGetIntegerFromSection(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger((char **)&v6[1] + 1, a4)) {
          *a4 = 0;
        }
      }
    }
  }
}

void Img4DecodeGetRestoreInfoInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
}

void Img4DecodeGetInteger64FromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger64((char **)&v6[1] + 1, a4)) {
          *a4 = 0;
        }
      }
    }
  }
}

void Img4DecodeGetRestoreInfoData(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
}

void Img4DecodeGetDataFromSection(uint64_t a1, unsigned int a2, uint64_t a3, void *a4, void *a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      *a5 = 0;
      *a4 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
      *a5 = v8;
    }
  }
}

uint64_t Img4DecodePayloadPropertiesExists(uint64_t a1, BOOL *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 6;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t result = 6;
  memset(v7, 0, sizeof(v7));
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v5 = a1 + 8;
    if (v6)
    {
      uint64_t result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v7);
      if (!result) {
        *a2 = (void)v8 != 0;
      }
    }
  }
  return result;
}

void Img4DecodePayloadProperty(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (a4)
    {
      if (*(void *)(a1 + 8))
      {
        long long v10 = 0uLL;
        long long v9 = 0uLL;
        memset(v11, 0, sizeof(v11));
        memset(v12, 0, sizeof(v12));
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)v11))
        {
          if (*(void *)&v12[0])
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)v12, 0x2000000000000010, &v10);
            if (!v7)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v8) {
                DERImg4DecodeFindProperty((unint64_t *)&v9, a2, a3, a4);
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePayloadPropertyExistsByTag(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0uLL;
    long long v9 = 0uLL;
    long long v8 = 0uLL;
    if (a3)
    {
      if (*(void *)(a1 + 8))
      {
        long long v19 = 0uLL;
        long long v20 = 0uLL;
        long long v17 = 0uLL;
        long long v18 = 0uLL;
        long long v15 = 0uLL;
        long long v16 = 0uLL;
        long long v13 = 0uLL;
        long long v14 = 0uLL;
        long long v11 = 0uLL;
        long long v12 = 0uLL;
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)&v11))
        {
          if ((void)v17)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v17, 0x2000000000000010, &v10);
            if (!v5)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v6)
              {
                DERImg4DecodeContentFindItemWithTag((unint64_t *)&v9, a2, &v8);
                if (!v7) {
                  *a3 = (void)v8 != 0;
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeGetPayloadProperties(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 6;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t result = 6;
  memset(v8, 0, sizeof(v8));
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v5 = a1 + 8;
    if (v6)
    {
      uint64_t result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v8);
      if (!result)
      {
        if ((void)v9)
        {
          uint64_t result = 0;
          uint64_t v7 = *((void *)&v9 + 1);
          *a2 = v9;
          a2[1] = v7;
          return result;
        }
        return 6;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeCopyPayloadPropertiesDigest(void *a1, void *a2, size_t a3, uint64_t (**a4)(void, void, _OWORD *, size_t, void))
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t result = 6;
  if (a1 && a2 && a3)
  {
    if (a3 > 0x30)
    {
      return 7;
    }
    else if (a4)
    {
      long long v8 = *a4;
      if (*a4)
      {
        memset(v9, 0, sizeof(v9));
        uint64_t result = v8(*a1, a1[1], v9, a3, a4);
        if (!result)
        {
          memcpy(a2, v9, a3);
          return 0;
        }
      }
    }
  }
  return result;
}

void Img4DecodePayloadPropertiesFindItemWithTag(unint64_t *a1, unsigned int a2, void *a3)
{
  if (a1)
  {
    v23[0] = 0;
    v23[1] = 0;
    v22[0] = 0;
    v22[1] = 0;
    v21[0] = 0;
    v21[1] = 0;
    unint64_t v20 = 0;
    v19[0] = 0;
    v19[1] = 0;
    unint64_t v18 = 0;
    memset(v17, 0, sizeof(v17));
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    unint64_t v14 = 0;
    long long v13 = 0uLL;
    long long v12 = 0uLL;
    long long v11 = 0uLL;
    if (a3)
    {
      if (*a1)
      {
        DERImg4DecodeContentFindItemWithTag(a1, 0x2000000000000010, &v11);
        if (!v5)
        {
          if ((void)v11)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 22, &v13);
            if (!v6 && !DERImg4DecodeTagCompare((uint64_t)&v13, 0x50415950u))
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 0x2000000000000011, &v12);
              if (!v7 && !DERDecodeSeqContentInit((unint64_t *)&v12, v23))
              {
                while (1)
                {
                  do
                  {
                    while (1)
                    {
                      int v8 = DERDecodeSeqNext(v23, &v20);
                      if (!v8) {
                        break;
                      }
                      if (v8 == 1) {
                        return;
                      }
                    }
                  }
                  while (DERDecodeItem((uint64_t)v21, &v18));
                  DERImg4DecodeContentFindItemWithTag(v19, 22, &v13);
                  if (v9) {
                    break;
                  }
                  if (!DERImg4DecodeTagCompare((uint64_t)&v13, a2)
                    && !DERDecodeSeqContentInit(v19, v22)
                    && !DERDecodeSeqNext(v22, v17)
                    && v17[0] == 22
                    && !DERDecodeSeqNext(v22, &v14))
                  {
                    if (v15)
                    {
                      uint64_t v10 = v16;
                      *a3 = v15;
                      a3[1] = v10;
                    }
                    return;
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

void Img4DecodeGetPayloadPropertiesBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 1uLL, (unint64_t)v5);
  if (!v4) {
    DERParseBoolean((unsigned __int8 **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 2uLL, (unint64_t)v5);
  if (!v4) {
    DERParseInteger((char **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 2uLL, (unint64_t)v5);
  if (!v4) {
    DERParseInteger64((char **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesData(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  Img4DecodePayloadProperty(a1, a2, 4uLL, (unint64_t)&v8);
  if (!v6)
  {
    uint64_t v7 = v10;
    *a3 = *((void *)&v9 + 1);
    *a4 = v7;
  }
}

double Img4DecodeGetObjectProperty(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  v14[0] = 0;
  v14[1] = 0;
  double result = 0.0;
  memset(v13, 0, sizeof(v13));
  if (a1)
  {
    if (a5)
    {
      DERImg4DecodeParseManifestProperties(a1, (unint64_t)v14, 0);
      if (v10
        || (DERImg4DecodeFindProperty(v14, a2 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v13), v11)
        || (DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, a3, a4, (unint64_t)a5), v12))
      {
        double result = 0.0;
        a5[1] = 0u;
        a5[2] = 0u;
        *a5 = 0u;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeGetObjectPropertyBoolean(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  memset(v8, 0, sizeof(v8));
  uint64_t v4 = 6;
  if (a1 && a4)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
    if (!v6) {
      return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
    }
    return v6;
  }
  return v4;
}

void Img4DecodeGetObjectPropertyInteger(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (v5 || DERParseInteger((char **)&v6[1] + 1, a4)) {
        *a4 = 0;
      }
    }
  }
}

void Img4DecodeGetObjectPropertyInteger64(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (v5 || DERParseInteger64((char **)&v6[1] + 1, a4)) {
        *a4 = 0;
      }
    }
  }
}

void Img4DecodeGetObjectPropertyData(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      uint64_t v8 = 0;
      *a4 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
    }
    *a5 = v8;
  }
}

void Img4DecodeGetObjectPropertyString(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 0x16uLL, &v9);
    if (v7)
    {
      uint64_t v8 = 0;
      *a4 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
    }
    *a5 = v8;
  }
}

void Img4DecodeGetPayloadVersionPropertyString(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (a3 && a4)
  {
    uint64_t v14 = 0;
    v15[0] = 0;
    v15[1] = 0;
    memset(v13, 0, sizeof(v13));
    long long v12 = 0uLL;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    if (DERDecodeItem(a1, (unint64_t *)&v14)
      || DERImg4DecodeProperty(v15, v14, (uint64_t)v13)
      || (DERImg4DecodeContentFindItemWithTag((unint64_t *)&v13[1] + 1, a2, &v12), v7)
      || DERImg4DecodeProperty(&v12, a2, (uint64_t)&v9))
    {
      uint64_t v8 = 0;
      *a3 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a3 = *((void *)&v10 + 1);
    }
    *a4 = v8;
  }
}

double Img4DecodeGetPropertyFromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  *(_OWORD *)long long v13 = 0uLL;
  if (a2 <= 1 && a1 && a5)
  {
    char v14 = 0;
    if (!Img4DecodeSectionExists((void *)a1, a2, &v14) && v14)
    {
      if (a2)
      {
        *(_OWORD *)long long v13 = *(_OWORD *)(a1 + 440);
        goto LABEL_9;
      }
      DERImg4DecodeParseManifestProperties(a1, 0, (unint64_t)v13);
      if (!v10)
      {
LABEL_9:
        DERImg4DecodeFindProperty(v13, a3, a4, (unint64_t)a5);
        if (!v12) {
          return result;
        }
      }
    }
    double result = 0.0;
    a5[1] = 0u;
    a5[2] = 0u;
    *a5 = 0u;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!result)
  {
    if (*((void *)&v9 + 1) != 2)
    {
      uint64_t result = 2;
      if (!a3) {
        return result;
      }
      goto LABEL_6;
    }
    if (!a3) {
      return 6;
    }
    uint64_t result = DERParseInteger((char **)&v8 + 1, a3);
  }
  if (!a3) {
    return result;
  }
LABEL_6:
  if (result) {
    *a3 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!result)
  {
    if (*((void *)&v9 + 1) != 2)
    {
      uint64_t result = 2;
      if (!a3) {
        return result;
      }
      goto LABEL_6;
    }
    if (!a3) {
      return 6;
    }
    uint64_t result = DERParseInteger64((char **)&v8 + 1, a3);
  }
  if (!a3) {
    return result;
  }
LABEL_6:
  if (result) {
    *a3 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!result)
  {
    if (*((void *)&v9 + 1) == 1)
    {
      if (a3) {
        return DERParseBoolean((unsigned __int8 **)&v8 + 1, a3);
      }
      else {
        return 6;
      }
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t Img4DecodeGetPropertyData(uint64_t *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  uint64_t result = 6;
  if (a3 && a4)
  {
    uint64_t v8 = *a1;
    uint64_t v9 = *((unsigned int *)a1 + 2);
    v11[0] = v8;
    v11[1] = v9;
    uint64_t result = DERImg4DecodeProperty(v11, a2 | 0xE000000000000000, (uint64_t)&v12);
    if (!result)
    {
      if (*((void *)&v14 + 1) == 4)
      {
        uint64_t result = 0;
        *a3 = *((void *)&v13 + 1);
        int v10 = v14;
LABEL_6:
        *a4 = v10;
        return result;
      }
      uint64_t result = 2;
    }
    int v10 = 0;
    *a3 = 0;
    goto LABEL_6;
  }
  return result;
}

void Img4DecodeEvaluateCertificateProperties(void *a1)
{
}

void Img4DecodeEvaluateCertificatePropertiesInternal(void *a1, _OWORD *a2)
{
  v21[0] = 0;
  v21[1] = 0;
  v20[0] = 0;
  v20[1] = 0;
  uint64_t v19 = 0;
  long long v18 = 0uLL;
  size_t __n = 0;
  uint64_t v17 = 0;
  uint64_t v14 = 0;
  __s1 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  memset(v9, 0, sizeof(v9));
  long long __s2 = 0uLL;
  long long v7 = 0uLL;
  if (a1 && a1[40] && !DERDecodeSeqInit((uint64_t)(a1 + 39), &v19, v21) && v19 == 0x2000000000000011)
  {
    while (1)
    {
      if (DERDecodeSeqNext(v21, (unint64_t *)&v17)) {
        return;
      }
      uint64_t v4 = (long long *)(a1 + 7);
      switch(v17)
      {
        case 0xE00000004D414E50:
LABEL_11:
          long long v7 = *v4;
          if (DERImg4DecodeProperty(&v18, v17, (uint64_t)&v11)
            || *((void *)&v13 + 1) != 0x2000000000000011
            || DERDecodeSeqContentInit((unint64_t *)&v12 + 1, v20))
          {
            return;
          }
          while (1)
          {
            int v5 = DERDecodeSeqNext(v20, (unint64_t *)&v14);
            if (v5) {
              break;
            }
            if (DERImg4DecodeProperty(&__s1, v14, (uint64_t)v9)) {
              return;
            }
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v7, v14, &__s2);
            if (*((void *)&v10 + 1) <= 4uLL && ((1 << SBYTE8(v10)) & 0x16) != 0)
            {
              if (v6) {
                return;
              }
              if (__n != *((void *)&__s2 + 1)) {
                return;
              }
              int v6 = memcmp(__s1, (const void *)__s2, __n);
              if (v6) {
                return;
              }
            }
            else if (*((void *)&v10 + 1) != 0xA000000000000000)
            {
              if (*((void *)&v10 + 1) != 0xA000000000000001 || v6 != 1) {
                return;
              }
              int v6 = 0;
            }
            if (v6) {
              return;
            }
          }
          if (v5 != 1) {
            return;
          }
          break;
        case 0xE00000006D616E78:
          if (a2) {
            *a2 = v18;
          }
          break;
        case 0xE00000004F424A50:
          uint64_t v4 = (long long *)(a1 + 9);
          if (a1[9]) {
            goto LABEL_11;
          }
          uint64_t v4 = (long long *)(a1 + 9);
          if (a1[10]) {
            goto LABEL_11;
          }
          break;
        default:
          return;
      }
    }
  }
}

void Img4DecodeCopyManifestTrustedBootPolicyMeasurement(void *a1, uint64_t a2, uint64_t a3, void *a4, size_t a5)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a4)
  {
    if (a5)
    {
      if (a5 <= 0x30)
      {
        memset(v17, 0, sizeof(v17));
        memset(v16, 0, sizeof(v16));
        v10[0] = Img4DecodeDigestInit;
        v10[1] = Img4DecodeDigestUpdate;
        _OWORD v10[2] = Img4DecodeDigestReturnHash;
        *(void *)&long long v13 = &default_manifest_property_exclude;
        *((void *)&v13 + 1) = 156;
        uint64_t v14 = a3;
        uint64_t v15 = v10;
        Img4DecodeEvaluateCertificatePropertiesInternal(a1, &v13);
        if (!v9)
        {
          if (a1)
          {
            if (a2)
            {
              v11[0] = &v13;
              v11[1] = a2;
              void v11[2] = a1;
              long long v12 = v17;
              if (!((unsigned int (*)(void, unsigned char **))*v15)(*(void *)(v14 + 32), &v12)
                && !Img4DecodeEvaluateDictionaryProperties(a1 + 7, 0, (uint64_t (*)(unint64_t, uint64_t *, uint64_t, uint64_t))_Img4DecodeValidateManifestPropertyInterposer, (uint64_t)v11)&& !((unsigned int (*)(void, unsigned char **, uint64_t, unsigned char *))v15[2])(*(void *)(v14 + 32), &v12, 48, v16))
              {
                memcpy(a4, v16, a5);
              }
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeEvaluateManifestProperties(uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 56), 0, a2, a3);
}

uint64_t Img4DecodeEvaluateDictionaryProperties(unint64_t *a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v15 = 0;
  unint64_t v16 = 0;
  unint64_t v14 = 0;
  v13[0] = 0;
  v13[1] = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = 0;
  memset(v8, 0, sizeof(v8));
  long long v9 = 0u;
  if (!a3) {
    return 6;
  }
  uint64_t result = (uint64_t)DERDecodeSeqContentInit(a1, v13);
  if (!result)
  {
    while (1)
    {
      uint64_t result = DERDecodeSeqNext(v13, &v14);
      if (result == 1) {
        return 0;
      }
      if (result) {
        return result;
      }
      uint64_t result = DERImg4DecodeProperty(&v15, v14, (uint64_t)v8);
      if (result) {
        return result;
      }
      uint64_t result = 2;
      if (*((void *)&v9 + 1) > 0x16uLL
        || ((1 << SBYTE8(v9)) & 0x400016) == 0
        || !(v14 >> 62)
        || (v14 & 0x2000000000000000) == 0)
      {
        return result;
      }
      if (HIDWORD(v16)) {
        break;
      }
      uint64_t v10 = v15;
      LODWORD(v11) = v16;
      uint64_t v12 = *((void *)&v9 + 1);
      uint64_t result = a3(v14, &v10, a2, a4);
      if (result) {
        return result;
      }
    }
    return 7;
  }
  return result;
}

uint64_t Img4DecodeEvaluateObjectProperties(uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 72), 1, a2, a3);
}

double Img4DecodeInit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      long long v7 = 0u;
      long long v8 = 0u;
      long long v5 = 0u;
      long long v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 128) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 208) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 288) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 320) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 368) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(void *)(a3 + 448) = 0;
      if (!DERImg4Decode(v9, (unint64_t)&v5)
        && !DERImg4DecodePayload((uint64_t)&v6, a3 + 88)
        && !DERImg4DecodeManifest(&v7, a3 + 232)
        && !DERImg4DecodeRestoreInfo((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + 8) = v6;
        double result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }
  return result;
}

double Img4DecodeInitPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a3)
  {
    *(void *)&long long v5 = a1;
    *((void *)&v5 + 1) = a2;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 96) = 0u;
    *(_OWORD *)(a3 + 112) = 0u;
    *(_OWORD *)(a3 + 128) = 0u;
    *(_OWORD *)(a3 + 144) = 0u;
    *(_OWORD *)(a3 + 160) = 0u;
    *(_OWORD *)(a3 + 176) = 0u;
    *(_OWORD *)(a3 + 192) = 0u;
    *(_OWORD *)(a3 + 208) = 0u;
    *(_OWORD *)(a3 + 224) = 0u;
    *(_OWORD *)(a3 + 240) = 0u;
    *(_OWORD *)(a3 + 256) = 0u;
    *(_OWORD *)(a3 + 272) = 0u;
    *(_OWORD *)(a3 + 288) = 0u;
    *(_OWORD *)(a3 + 304) = 0u;
    *(_OWORD *)(a3 + 320) = 0u;
    *(_OWORD *)(a3 + 336) = 0u;
    *(_OWORD *)(a3 + 352) = 0u;
    *(_OWORD *)(a3 + 368) = 0u;
    *(_OWORD *)(a3 + 384) = 0u;
    *(_OWORD *)(a3 + 400) = 0u;
    *(_OWORD *)(a3 + 416) = 0u;
    *(_OWORD *)(a3 + 432) = 0u;
    *(void *)(a3 + 448) = 0;
    if (!DERImg4DecodePayload((uint64_t)&v5, a3 + 88))
    {
      double result = *(double *)&v5;
      *(_OWORD *)(a3 + 8) = v5;
    }
  }
  return result;
}

uint64_t Img4DecodeInitManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 1, a3, 1229796429);
}

uint64_t Img4DecodeInitManifestCommon(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t result = 6;
  if (a1 && a4)
  {
    uint64_t v15 = a1;
    uint64_t v16 = a2;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 80) = 0u;
    *(_OWORD *)(a4 + 96) = 0u;
    *(_OWORD *)(a4 + 112) = 0u;
    *(_OWORD *)(a4 + 128) = 0u;
    *(_OWORD *)(a4 + 144) = 0u;
    *(_OWORD *)(a4 + 160) = 0u;
    *(_OWORD *)(a4 + 176) = 0u;
    *(_OWORD *)(a4 + 192) = 0u;
    *(_OWORD *)(a4 + 208) = 0u;
    *(_OWORD *)(a4 + 224) = 0u;
    *(_OWORD *)(a4 + 240) = 0u;
    *(_OWORD *)(a4 + 256) = 0u;
    *(_OWORD *)(a4 + 272) = 0u;
    *(_OWORD *)(a4 + 288) = 0u;
    *(_OWORD *)(a4 + 304) = 0u;
    *(_OWORD *)(a4 + 320) = 0u;
    *(_OWORD *)(a4 + 336) = 0u;
    *(_OWORD *)(a4 + 352) = 0u;
    *(_OWORD *)(a4 + 368) = 0u;
    *(_OWORD *)(a4 + 384) = 0u;
    *(_OWORD *)(a4 + 400) = 0u;
    *(_OWORD *)(a4 + 416) = 0u;
    *(_OWORD *)(a4 + 432) = 0u;
    *(void *)(a4 + 448) = 0;
    if (a5 == 1229796419)
    {
      unint64_t v10 = a4 + 232;
      if (a3) {
        uint64_t result = DERImg4DecodeCertificate(&v15, v10);
      }
      else {
        uint64_t result = DERImg4DecodeUnsignedCertificate(&v15, v10);
      }
    }
    else
    {
      if (a5 != 1229796429) {
        return 2;
      }
      unint64_t v9 = a4 + 232;
      if (a3) {
        uint64_t result = DERImg4DecodeManifest(&v15, v9);
      }
      else {
        uint64_t result = DERImg4DecodeUnsignedManifest(&v15, v9);
      }
    }
    if (!result)
    {
      if (*(void *)(a4 + 264))
      {
        unint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = a1;
        uint64_t v16 = a2;
        uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)&v15, &v12, 0);
        if (!result)
        {
          *(void *)(a4 + 24) = a1;
          uint64_t v11 = v14 + v13 - a1;
          if (__CFADD__(v14, v13 - a1))
          {
            __break(0x5500u);
          }
          else
          {
            *(void *)(a4 + 32) = v11;
            if (v11 == a2) {
              return 0;
            }
            else {
              return 7;
            }
          }
        }
      }
      else
      {
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeInitUnsignedManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 0, a3, 1229796429);
}

uint64_t Img4DecodeInitCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 1, a3, 1229796419);
}

uint64_t Img4DecodeInitUnsignedCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 0, a3, 1229796419);
}

uint64_t Img4DecodeEvaluateCertificateChain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = 6;
  if (a1 && a2 && a3 && a4 && a7 && a6)
  {
    unint64_t v9 = *(void (**)(uint64_t))(a4 + 8);
    if (v9)
    {
      v9(a1);
      return 3;
    }
  }
  return result;
}

void Img4DecodeEvaluateTrustWithCallbacks(unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), unsigned int (*a4)(void, void, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), unsigned int (*a5)(uint64_t, uint64_t), void (*a6)(void, void, uint64_t), uint64_t a7)
{
  memset(v17, 0, sizeof(v17));
  if (a2)
  {
    if (a3)
    {
      if (*(void *)(a2 + 24))
      {
        BOOL v16 = 0;
        a6(*(void *)(a2 + 264), *(void *)(a2 + 272), a2 + 376);
        if (!a4(*(void *)(a2 + 296), *(unsigned int *)(a2 + 304), *(void *)(a2 + 280), *(unsigned int *)(a2 + 288), a2 + 376, 20, a2 + 312, a2 + 320, a7))
        {
          DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
          if (!v14)
          {
            DERImg4DecodeFindProperty((unint64_t *)(a2 + 40), a1 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v17);
            if (!v15)
            {
              *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v17[1] + 8);
              if (!a5(a2, a7) && !Img4DecodePayloadExists(a2, &v16))
              {
                if (v16)
                {
                  a6(*(void *)(a2 + 8), *(void *)(a2 + 16), a2 + 184);
                  *(unsigned char *)a2 = 1;
                }
                if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, a3, a7)
                  && !Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, a3, a7))
                {
                  a6(*(void *)(a2 + 24), *(void *)(a2 + 32), a2 + 328);
                  *(unsigned char *)(a2 + 1) = 1;
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePerformTrustEvaluation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[1] = 0;
  void v5[2] = 0;
  v5[0] = a3;
  _Img4DecodePerformTrustEvaluationWithCallbacksInternal(a1, a2, (uint64_t)v5, a4, 0, a5);
}

void Img4DecodePerformTrustEvaluatationWithCallbacks(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

uint64_t Img4DecodeVerifyChainIM4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, uint64_t a9, uint64_t a10)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v41 = 0;
  long long v39 = 0u;
  memset(v40, 0, sizeof(v40));
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
  uint64_t result = 6;
  long long v17 = 0u;
  long long v18 = 0u;
  if (a3 && a4 && a5 && a6 && a7 && a8 && a9)
  {
    if (Img4DecodeInitManifestCommon(a3, a4, 1, (uint64_t)&v17, 1229796419)
      || (*(unsigned int (**)(void, void, char *, void, uint64_t))a9)(*((void *)&v33 + 1), v34, (char *)v40 + 8, **(void **)(a9 + 32), a9)|| (*(unsigned int (**)(uint64_t, uint64_t, void, void, char *, void, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))(a9 + 16))(a1, a2, *((void *)&v34 + 1), v35, (char *)v40 + 8, **(void **)(a9 + 32), a9, a10, v17, *((void *)&v17 + 1), v18, *((void *)&v18 + 1), v19,
           *((void *)&v19 + 1),
           v20,
           *((void *)&v20 + 1),
           v21,
           *((void *)&v21 + 1),
           v22,
           *((void *)&v22 + 1),
           v23,
           *((void *)&v23 + 1),
           v24,
           *((void *)&v24 + 1),
           v25,
           *((void *)&v25 + 1),
           v26,
           *((void *)&v26 + 1),
           v27,
           *((void *)&v27 + 1),
           v28,
           *((void *)&v28 + 1),
           v29,
           *((void *)&v29 + 1),
           v30,
           *((void *)&v30 + 1),
           v31,
           *((void *)&v31 + 1),
           v32,
           *((void *)&v32 + 1),
           v33))
    {
      return 0xFFFFFFFFLL;
    }
    else if (DERImg4DecodeCertificatePropertiesAndPubKey(*((uint64_t *)&v33 + 1), v34, a7, a8, a5, a6))
    {
      return 0xFFFFFFFFLL;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void _Img4DecodePerformTrustEvaluationWithCallbacksInternal(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  memset(v24, 0, sizeof(v24));
  if (a2)
  {
    if (a3)
    {
      BOOL v21 = 0;
      if (a4)
      {
        if (*(void *)a3)
        {
          if (*(void *)a4)
          {
            if (*(void *)(a4 + 24))
            {
              if (*(void *)(a4 + 8))
              {
                if (*(void *)(a4 + 16))
                {
                  unint64_t v9 = *(void **)(a4 + 32);
                  if (v9)
                  {
                    if (*(void *)(a2 + 24) && *v9 <= 0x30uLL && !(*(unsigned int (**)(void))a4)())
                    {
                      *(unsigned char *)(a2 + 1) = 1;
                      uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
                      if (v13
                        && (int v14 = (const void *)v13(a2, a6)) != 0
                        && !memcmp((const void *)(a2 + 328), v14, **(void **)(a4 + 32)))
                      {
                        int v15 = 0;
                      }
                      else
                      {
                        if ((*(unsigned int (**)(void, void, uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8))(*(void *)(a2 + 296), *(void *)(a2 + 304), &v22, &v23, a2 + 312, a2 + 320, a4, a6)|| **(void **)(a4 + 32) > 0x30uLL|| (*(unsigned int (**)(void, void, uint64_t))a4)(*(void *)(a2 + 264), *(void *)(a2 + 272), a2 + 376)|| (*(unsigned int (**)(uint64_t, uint64_t, void, void, uint64_t, void, uint64_t, uint64_t))(a4 + 16))(v22, v23, *(void *)(a2 + 280), *(void *)(a2 + 288), a2 + 376,
                               **(void **)(a4 + 32),
                               a4,
                               a6))
                        {
                          return;
                        }
                        int v15 = 1;
                      }
                      DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
                      if (v16) {
                        return;
                      }
                      if ((a5 & 1) == 0)
                      {
                        long long v17 = *(unsigned int (**)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t))(a3 + 16);
                        unint64_t v18 = a1 | 0xE000000000000000;
                        long long v19 = (unint64_t *)(a2 + 40);
                        if (v17)
                        {
                          if (v17(v19, v18, 0x2000000000000011, v24, a6)) {
                            return;
                          }
                        }
                        else
                        {
                          DERImg4DecodeFindProperty(v19, v18, 0x2000000000000011uLL, (unint64_t)v24);
                          if (v20) {
                            return;
                          }
                        }
                        *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v24[1] + 8);
                      }
                      if ((!v15 || !(*(unsigned int (**)(uint64_t, uint64_t))(a4 + 24))(a2, a6))
                        && **(void **)(a4 + 32) <= 0x30uLL
                        && !Img4DecodePayloadExists(a2, &v21))
                      {
                        if (v21)
                        {
                          if ((*(unsigned int (**)(void, void, uint64_t, void, uint64_t))a4)(*(void *)(a2 + 8), *(void *)(a2 + 16), a2 + 184, **(void **)(a4 + 32), a4))
                          {
                            return;
                          }
                          *(unsigned char *)a2 = 1;
                        }
                        if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6)&& (a5 & 1) == 0)
                        {
                          Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6);
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

void Img4DecodePerformManifestTrustEvaluationWithCallbacks(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t _Img4DecodeValidateManifestPropertyInterposer(unsigned int a1, uint64_t a2, int a3, uint64_t a4)
{
  unsigned int v10 = a1;
  if (a3) {
    return 0xFFFFFFFFLL;
  }
  long long v8 = *(void **)a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  v12[0] = 0;
  v12[1] = 0;
  memset(v11, 0, sizeof(v11));
  if (v8
    && !DERImg4DecodeProperty(v8, 0xE00000006D616E78, (uint64_t)&v13)
    && *((void *)&v15 + 1) == 0x2000000000000011
    && !DERDecodeSeqContentInit((unint64_t *)&v14 + 1, v12))
  {
    unint64_t v9 = a1 | 0xE000000000000000;
    while (!DERDecodeSeqNext(v12, v11))
    {
      if (v11[0] == v9)
      {
        (*(void (**)(void, uint64_t, uint64_t, unsigned int *))(*(void *)(*(void *)a4 + 24) + 8))(*(void *)(*(void *)(*(void *)a4 + 16) + 32), a4 + 24, 4, &v10);
        return 0;
      }
    }
  }
  (*(void (**)(void, uint64_t, void, void))(*(void *)(*(void *)a4 + 24) + 8))(*(void *)(*(void *)(*(void *)a4 + 16) + 32), a4 + 24, *(unsigned int *)(a2 + 8), *(void *)a2);
  return 0;
}

uint64_t sha1_digest()
{
  return ccdigest();
}

uint64_t verify_signature_rsa3k(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v14[0] = a1;
  v14[1] = a2;
  v13[0] = a3;
  v13[1] = a4;
  v12[0] = a5;
  v12[1] = a6;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  if (!a7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = *(void *)(a7 + 32);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v9 = *(void ***)(v8 + 16);
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v10 = *v9;
  if (!v10) {
    return 0xFFFFFFFFLL;
  }
  if (*v10 != a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = verify_pkcs1_sig((uint64_t)v14, v10[4], (uint64_t)v12, (uint64_t)v13, 3072, a6, a7, a8);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t verify_pkcs1_sig(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v21[4] = *MEMORY[0x263EF8340];
  if (a5 != 4096 && a5 != 3072) {
    return 0xFFFFFFFFLL;
  }
  void v21[2] = 0;
  unint64_t v21[3] = 0;
  unint64_t v9 = (unint64_t)(a5 + 63) >> 6;
  MEMORY[0x270FA5388](a1, (24 * v9 + 71) & 0x7FFFFFFFFFFFFFE0, a3, a4, a5, a6, a7, a8);
  uint64_t v11 = (unint64_t *)((char *)v20 - v10);
  bzero((char *)v20 - v10, v10);
  *uint64_t v11 = v9;
  uint64_t v12 = *(unsigned int *)(a1 + 8);
  v21[0] = *(void *)a1;
  v21[1] = v12;
  memset(v20, 0, sizeof(v20));
  uint64_t result = DERParseSequenceToObject((uint64_t)v21, (unsigned __int16)DERNumRSAPubKeyPKCS1ItemSpecs, (uint64_t)&DERRSAPubKeyPKCS1ItemSpecs, (unint64_t)v20, 0x20uLL, 0x20uLL);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v14 = *((void *)&v20[0] + 1);
  for (uint64_t i = *(unsigned char **)&v20[0]; v14; --v14)
  {
    if (*i) {
      break;
    }
    if (i == (unsigned char *)-1) {
      __break(0x5513u);
    }
    ++i;
  }
  if (v14 >= 0xFFFFFFFFFFFFFFF8)
  {
    __break(0x5500u);
    return result;
  }
  unint64_t v16 = (v14 + 7) >> 3;
  if (v16 > *v11) {
    return 0xFFFFFFFFLL;
  }
  *uint64_t v11 = v16;
  if (ccrsa_make_pub()) {
    return 0xFFFFFFFFLL;
  }
  if (MEMORY[0x263EF87F8]) {
    BOOL v17 = MEMORY[0x263EF8010] == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    int v19 = ccrsa_verify_pkcs1v15_digest();
    if (!v19 && !cc_cmp_safe()) {
      return 0;
    }
    return 0xFFFFFFFFLL;
  }
  LOBYTE(v20[0]) = 0;
  int v18 = ccrsa_verify_pkcs1v15();
  uint64_t result = 0xFFFFFFFFLL;
  if (!v18 && LOBYTE(v20[0])) {
    return 0;
  }
  return result;
}

uint64_t verify_signature_rsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v14[0] = a1;
  v14[1] = a2;
  v13[0] = a3;
  v13[1] = a4;
  v12[0] = a5;
  v12[1] = a6;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  if (!a7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = *(void *)(a7 + 32);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v9 = *(void ***)(v8 + 16);
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  size_t v10 = *v9;
  if (!v10) {
    return 0xFFFFFFFFLL;
  }
  if (*v10 != a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = verify_pkcs1_sig((uint64_t)v14, v10[4], (uint64_t)v12, (uint64_t)v13, 4096, a6, a7, a8);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

void verify_signature_ecdsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              if (a7)
              {
                long long v7 = *(void **)(a7 + 32);
                if (v7)
                {
                  if (v7[2] && *(void *)(a7 + 48) && *v7 == a6)
                  {
                    v8[0] = a1;
                    v8[1] = a2;
                    verify_ecdsa_sig(v8);
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

void verify_ecdsa_sig(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v18[7] = 0;
  ccec_x963_import_pub_size();
  if (ccec_keysize_is_supported())
  {
    cp = (void *)ccec_get_cp();
    uint64_t v9 = *cp;
    if (*cp >> 61 || !is_mul_ok(8 * v9, 3uLL))
    {
      __break(0x550Cu);
    }
    else
    {
      uint64_t v10 = 24 * v9;
      BOOL v11 = __CFADD__(v10, 16);
      uint64_t v12 = v10 + 16;
      if (!v11)
      {
        BOOL v11 = __CFADD__(v12, 16);
        uint64_t v13 = v12 + 16;
        if (!v11)
        {
          unint64_t v14 = cp;
          unint64_t v15 = v13 - 1;
          MEMORY[0x270FA5388](cp, (v13 - 1) & 0xFFFFFFFFFFFFFFF0, v3, v4, v5, v6, v7, v8);
          BOOL v17 = &v18[-v16];
          bzero(&v18[-v16], v16);
          if (v15 < 0x10)
          {
            __break(1u);
          }
          else
          {
            *BOOL v17 = v14;
            if (!MEMORY[0x263E6E620](v14, a1[1], *a1, v17)) {
              ccec_verify();
            }
          }
          return;
        }
      }
    }
    __break(0x5500u);
  }
}

uint64_t verify_chain_img4_v1(unint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v9 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(&v28, 0x2F0uLL);
        v26[0] = a1;
        v26[1] = v9;
        v27[0] = &ROOT_CA_CERTIFICATE;
        v27[1] = 1215;
        if (!_crack_chain_with_anchor(v26, (uint64_t)v27, 3u)
          && !parse_chain((uint64_t)v27, 3u, (uint64_t)&v29, (uint64_t)v31, (uint64_t)v34, (uint64_t)v37))
        {
          long long v24 = a6;
          uint64_t v15 = 0;
          size_t v16 = (const void **)v32;
          BOOL v17 = &v30;
          int v18 = (const void **)v32;
          while (1)
          {
            uint64_t v19 = &v26[20 * v15];
            size_t v20 = v19[37];
            BOOL v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21) {
              break;
            }
            if (memcmp((const void *)v19[36], *(v16 - 1), v20)) {
              break;
            }
            uint64_t result = verify_chain_signatures(&v34[v15], v17, a7);
            if (result) {
              break;
            }
            v17 += 6;
            ++v15;
            size_t v16 = v18;
            if (v15 == 2)
            {
              long long v25 = 0uLL;
              if ((unint64_t)v31 > 0xFFFFFFFFFFFFFF5FLL)
              {
LABEL_34:
                __break(0x5513u);
                return result;
              }
              v42[0] = 0;
              v42[1] = 0;
              unint64_t v40 = 0;
              v41[0] = 0;
              v41[1] = 0;
              if (DERDecodeSeqContentInit(v33, v42)) {
                return 0xFFFFFFFFLL;
              }
LABEL_14:
              if (!DERDecodeSeqNext(v42, &v40) && v40 == 0x2000000000000011)
              {
                v47[0] = 0;
                v47[1] = 0;
                unint64_t v45 = 0;
                v46[0] = 0;
                v46[1] = 0;
                long long v43 = 0u;
                long long v44 = 0u;
                if (!DERDecodeSeqContentInit(v41, v47))
                {
                  do
                  {
                    int v22 = DERDecodeSeqNext(v47, &v45);
                    if (v22)
                    {
                      if (v22 == 1) {
                        goto LABEL_14;
                      }
                      return 0xFFFFFFFFLL;
                    }
                    if (v45 != 0x2000000000000010
                      || DERParseSequenceContentToObject(v46, (unsigned __int16)DERNumAttributeTypeAndValueItemSpecs, (uint64_t)&DERAttributeTypeAndValueItemSpecs, (unint64_t)&v43, 0x20uLL, 0x20uLL))
                    {
                      return 0xFFFFFFFFLL;
                    }
                  }
                  while (!DEROidCompare((uint64_t)&oidCommonName, (uint64_t)&v43));
                  long long v25 = v44;
                  uint64_t result = DEROidCompare((uint64_t)&verify_chain_img4_v1_sboot_item, (uint64_t)&v25);
                  if (!result) {
                    return 0xFFFFFFFFLL;
                  }
                  if ((unint64_t)v34 > 0xFFFFFFFFFFFFFFDFLL) {
                    goto LABEL_34;
                  }
                  *a3 = v35;
                  *a4 = v36;
                  if ((unint64_t)v37 > 0xFFFFFFFFFFFFFFDFLL) {
                    goto LABEL_34;
                  }
                  if (!v38) {
                    return 0;
                  }
                  uint64_t v23 = v39;
                  if (!v39) {
                    return 0;
                  }
                  uint64_t result = 0;
                  if (a5)
                  {
                    if (v24)
                    {
                      uint64_t result = 0;
                      *a5 = v38;
                      *long long v24 = v23;
                    }
                  }
                  return result;
                }
              }
              return 0xFFFFFFFFLL;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t parse_chain(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = 0;
  uint64_t v15 = result;
  unint64_t v18 = ~result;
  unint64_t v17 = ~a3;
  unint64_t v14 = ~a4;
  unint64_t v13 = ~a5;
  unint64_t v11 = ~a6;
  uint64_t v10 = a2;
  while (1)
  {
    unint64_t v9 = 16 * v8;
    if (16 * v8 > v18 || 48 * v8 > v17) {
      break;
    }
    uint64_t result = DERParseSequenceToObject(v15 + 16 * v8, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + 48 * v8, 0x30uLL, 0x30uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (160 * v8 > v14) {
      break;
    }
    uint64_t result = DERParseSequenceToObject(a3 + 48 * v8, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + 160 * v8, 0xA0uLL, 0xA0uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v13) {
      break;
    }
    long long v22 = 0u;
    long long v23 = 0u;
    char v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + 160 * v8 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v22, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL; {
    if (DERParseSequenceContentToObject((unint64_t *)&v22, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v19, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    }
    uint64_t result = DEROidCompare((uint64_t)&v19, (uint64_t)&oidRsa);
    if (!result) {
      return 0xFFFFFFFFLL;
    }
    if (*((void *)&v20 + 1))
    {
      if (*((void *)&v20 + 1) != 2 || *(unsigned char *)v20 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v20 == -1) {
        break;
      }
      if (*(unsigned char *)(v20 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }
    uint64_t result = DERParseBitString((uint64_t)&v23, (unint64_t *)(a5 + 16 * v8), &v21);
    if (result || v21) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v11) {
      break;
    }
    uint64_t result = parse_extensions(a4 + 160 * v8, (void *)(a6 + 16 * v8));
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (++v8 == v10) {
      return 0;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t verify_chain_signatures(void *a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  char v10 = 0;
  memset(v13, 0, sizeof(v13));
  unint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v5 = *(void **)(a3 + 32);
  if (!v5
    || !v5[2]
    || !*(void *)a3
    || !*(void *)(a3 + 40)
    || *v5 > 0x30uLL
    || DERParseSequenceContentToObject(a2 + 2, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v11, 0x20uLL, 0x20uLL))
  {
    return 0xFFFFFFFFLL;
  }
  if (*((void *)&v12 + 1))
  {
    uint64_t result = DEROidCompare((uint64_t)&v11, (uint64_t)&oidEcPubKey);
    if ((result & 1) == 0)
    {
      if (*((void *)&v12 + 1) != 2 || *(unsigned char *)v12 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v12 == -1)
      {
        __break(0x5513u);
        return result;
      }
      if (*(unsigned char *)(v12 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }
  }
  if (!DEROidCompare((uint64_t)&v11, *(void *)(a3 + 40))) {
    return 0xFFFFFFFFLL;
  }
  if ((*(unsigned int (**)(void, void, _OWORD *, void, uint64_t))a3)(*a2, a2[1], v13, **(void **)(a3 + 32), a3))
  {
    return 0xFFFFFFFFLL;
  }
  if (DERParseBitString((uint64_t)(a2 + 4), &v8, &v10)) {
    return 0xFFFFFFFFLL;
  }
  if (v10) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = (*(uint64_t (**)(void, void, unint64_t, uint64_t, _OWORD *, void, uint64_t, void))(a3 + 16))(*a1, a1[1], v8, v9, v13, **(void **)(a3 + 32), a3, 0);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t verify_chain_img4_x86(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_x86);
}

uint64_t verify_chain_img4_v2_with_crack_callback(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, unsigned char *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v22, 0x300uLL);
        v21[0] = a1;
        v21[1] = v10;
        if (a8(v21, v22, 2)) {
          return 0xFFFFFFFFLL;
        }
        uint64_t result = parse_chain((uint64_t)v22, 2u, (uint64_t)v23, (uint64_t)&v24, (uint64_t)v27, (uint64_t)v28);
        if (result)
        {
          return 0xFFFFFFFFLL;
        }
        else
        {
          char v16 = 1;
          uint64_t v17 = 1;
          while ((v16 & 1) != 0)
          {
            unint64_t v18 = &v21[20 * v17];
            if (__n == v18[33] && !memcmp(__s1, (const void *)v18[32], __n))
            {
              uint64_t result = verify_chain_signatures(v27, &v23[3 * v17], a7);
              char v16 = 0;
              uint64_t v17 = 2;
              if (!result) {
                continue;
              }
            }
            return 0xFFFFFFFFLL;
          }
          if ((unint64_t)v27 > 0xFFFFFFFFFFFFFFEFLL
            || (*a3 = v27[2], *a4 = v27[3], (unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL))
          {
            __break(0x5513u);
          }
          else if (v29 && (uint64_t v19 = v30) != 0)
          {
            uint64_t result = 0;
            if (a5 && a6)
            {
              uint64_t result = 0;
              *a5 = v29;
              *a6 = v19;
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
  return result;
}

uint64_t crack_chain_rsa4k_sha384_x86(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_X86_ROOT_CA_CERTIFICATE;
  a2[1] = 1382;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_ddi);
}

uint64_t crack_chain_rsa4k_sha384_ddi(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_ROOT_CA_CERTIFICATE;
  a2[1] = 1394;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi_global(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_ddi_global);
}

uint64_t crack_chain_rsa4k_sha384_ddi_global(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1404;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi_fake(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_ddi_fake);
}

uint64_t crack_chain_rsa4k_sha384_ddi_fake(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_ROOT_CA_CERTIFICATE;
  a2[1] = 1425;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi_fake_global(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_ddi_fake_global);
}

uint64_t crack_chain_rsa4k_sha384_ddi_fake_global(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1435;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_avp(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_avp);
}

uint64_t crack_chain_rsa4k_sha384_avp(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_AVP_ROOT_CA_CERTIFICATE;
  a2[1] = 1431;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_tatsu_local_policy(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_tatsu_local_policy);
}

uint64_t crack_chain_rsa4k_sha384_tatsu_local_policy(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1382;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_tatsu_local_policy_hacktivate(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_tatsu_local_policy_hacktivate);
}

uint64_t crack_chain_rsa4k_sha384_tatsu_local_policy_hacktivate(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1442;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2_rsa3k(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa3k_sha384);
}

uint64_t crack_chain_rsa3k_sha384(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA3K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1118;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384);
}

uint64_t crack_chain_rsa4k_sha384(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1374;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2_AWG1(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_AWG1);
}

uint64_t crack_chain_rsa4k_sha384_AWG1(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE_AWG1;
  a2[1] = 1404;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2_PED(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_PED);
}

uint64_t crack_chain_rsa4k_sha384_PED(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_PED_ROOT_CA_CERTIFICATE;
  a2[1] = 1400;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ec_v1(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, unsigned char *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v27, 0x330uLL);
        v26[0] = a1;
        v26[1] = v10;
        if (!a8(v26, v27, 3)
          && !parse_ec_chain((uint64_t)v27, 3u, (uint64_t)&v28, (uint64_t)&v30, (unint64_t)v32, (unint64_t)&v35, (uint64_t)v36))
        {
          long long v25 = a4;
          uint64_t v15 = 0;
          char v16 = (const void **)v31;
          uint64_t v17 = &v29;
          unint64_t v18 = (const void **)v31;
          while (1)
          {
            uint64_t v19 = &v26[20 * v15];
            size_t v20 = v19[37];
            char v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21) {
              break;
            }
            if (memcmp((const void *)v19[36], *(v16 - 1), v20)) {
              break;
            }
            uint64_t result = verify_chain_signatures(&v32[v15], v17, a7);
            if (result) {
              break;
            }
            v17 += 6;
            ++v15;
            char v16 = v18;
            if (v15 == 2)
            {
              if ((unint64_t)v32 > 0xFFFFFFFFFFFFFFDFLL
                || (*a3 = v33, *long long v25 = v34, (unint64_t)v36 > 0xFFFFFFFFFFFFFFDFLL))
              {
                __break(0x5513u);
              }
              else if (v37 && (uint64_t v22 = v38) != 0)
              {
                uint64_t result = 0;
                if (a5)
                {
                  if (a6)
                  {
                    uint64_t result = 0;
                    *a5 = v37;
                    *a6 = v22;
                  }
                }
              }
              else
              {
                return 0;
              }
              return result;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t parse_ec_chain(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  if (!a2) {
    return 0;
  }
  unint64_t v9 = 0;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  uint64_t v21 = result;
  unint64_t v24 = ~result;
  unint64_t v23 = ~a3;
  unint64_t v20 = ~a4;
  if (a5 <= a6) {
    unint64_t v12 = a6;
  }
  else {
    unint64_t v12 = a5;
  }
  unint64_t v19 = ~v12;
  unint64_t v16 = ~a7;
  uint64_t v15 = 16 * a2;
  while (v11 <= v24 && v10 <= v23)
  {
    uint64_t result = DERParseSequenceToObject(v21 + v11, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + v10, 0x30uLL, 0x30uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v20) {
      break;
    }
    uint64_t result = DERParseSequenceToObject(a3 + v10, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + v9, 0xA0uLL, 0xA0uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (v11 > v19) {
      break;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    char v30 = 0;
    long long v28 = 0u;
    long long v29 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + v9 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v31, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL; {
    if (DERParseSequenceContentToObject((unint64_t *)&v31, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v28, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    }
    if (!DEROidCompare((uint64_t)&v28, (uint64_t)&oidEcPubKey)) {
      return 0xFFFFFFFFLL;
    }
    if (DERParseBitString((uint64_t)&v32, (unint64_t *)(a5 + v11), &v30)) {
      return 0xFFFFFFFFLL;
    }
    if (v30) {
      return 0xFFFFFFFFLL;
    }
    unint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t result = DERDecodeItem((uint64_t)&v29, &v25);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    unint64_t v13 = (void *)(a6 + v11);
    uint64_t v14 = v27;
    *unint64_t v13 = v26;
    v13[1] = v14;
    if (v11 > v16) {
      break;
    }
    uint64_t result = parse_extensions(a4 + v9, (void *)(a7 + v11));
    if (result) {
      return 0xFFFFFFFFLL;
    }
    v11 += 16;
    v10 += 48;
    v9 += 160;
    if (v15 == v11) {
      return 0;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t verify_chain_img4_ecdsa256(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v2(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_ecdsa256_sha256);
}

uint64_t verify_chain_img4_ec_v2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, unsigned char *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1) {
    return result;
  }
  unsigned int v10 = a2;
  if (!a2 || !a3 || !a4) {
    return result;
  }
  bzero(v20, 0x220uLL);
  v19[0] = a1;
  v19[1] = v10;
  if (a8(v19, v20, 2)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = parse_ec_chain((uint64_t)v20, 2u, (uint64_t)v21, (uint64_t)v23, (unint64_t)v28, (unint64_t)&v29, (uint64_t)v30);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)v23 > 0xFFFFFFFFFFFFFF5FLL) {
    goto LABEL_22;
  }
  if (__n != v27) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = memcmp(__s1, __s2, __n);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)v21 > 0xFFFFFFFFFFFFFFCFLL)
  {
LABEL_22:
    __break(0x5513u);
    return result;
  }
  uint64_t result = verify_chain_signatures(v28, v22, a7);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL) {
    goto LABEL_22;
  }
  uint64_t v16 = v28[3];
  *a3 = v28[2];
  *a4 = v16;
  if ((unint64_t)v30 > 0xFFFFFFFFFFFFFFEFLL) {
    goto LABEL_22;
  }
  if (!v31) {
    return 0;
  }
  uint64_t v17 = v32;
  if (!v32) {
    return 0;
  }
  uint64_t result = 0;
  if (a5)
  {
    if (a6)
    {
      uint64_t result = 0;
      *a5 = v31;
      *a6 = v17;
    }
  }
  return result;
}

uint64_t crack_chain_ecdsa256_sha256(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC256_SHA256_ROOT_CA_CERTIFICATE;
  a2[1] = 551;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ecdsa384(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v2(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_ecdsa384_sha384_hacktivate);
}

uint64_t crack_chain_ecdsa384_sha384_hacktivate(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 610;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ecdsa384_local_policy(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_ecdsa384_sha384);
}

uint64_t crack_chain_ecdsa384_sha384(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &EC384_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 542;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ecdsa384_hacktivate(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_ecdsa384_sha384_hacktivate);
}

uint64_t verify_chain_img4_ecdsa384_qa(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_ecdsa384_sha384_qa);
}

uint64_t crack_chain_ecdsa384_sha384_qa(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &QA_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 540;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t Img4DecodeDigestInit(uint64_t a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v1 = *(void **)(a1 + 16);
  if (!v1 || !*v1) {
    return 0xFFFFFFFFLL;
  }
  ccdigest_init();
  return 0;
}

uint64_t Img4DecodeDigestUpdate(uint64_t a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!**(void **)(a1 + 16)) {
    return 0xFFFFFFFFLL;
  }
  ccdigest_update();
  return 0;
}

uint64_t Img4DecodeDigestReturnHash(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = **(void **)(a1 + 16);
  if (!v4 || *(void *)v4 > a3) {
    return 0xFFFFFFFFLL;
  }
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 56))(v4, *a2, a4);
  return 0;
}

uint64_t Img4DecodeDigestFinal(uint64_t a1, void *a2, uint64_t a3)
{
  if (a1 && (uint64_t v3 = **(unint64_t ***)(a1 + 16)) != 0) {
    return Img4DecodeDigestReturnHash(a1, a2, *v3, a3);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t Img4DecodeComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a5)
  {
    unint64_t v8 = *(void **)(a5 + 32);
    if (v8 && (unint64_t v9 = (void *)v8[2]) != 0 && *v8 == a4 && *v9 && *(void *)*v9 == a4)
    {
      ccdigest();
      return 0;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t img4_verify_signature_with_chain(unint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, void *a7, void *a8)
{
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  if (verify_chain_img4_v1(a1, a2, &v18, &v19, &v16, &v17, (uint64_t)kImg4DecodeSecureBootRsa1kSha1)) {
    return 0xFFFFFFFFLL;
  }
  *a7 = v16;
  *a8 = v17;
  uint64_t result = verify_signature_rsa(v18, v19, a3, a4, a5, a6, (uint64_t)kImg4DecodeSecureBootRsa1kSha1, v14);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t _crack_chain_with_anchor(unint64_t *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  unint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  unint64_t v5 = ~a2;
  unsigned int v6 = 1;
  unint64_t v7 = *a1;
  unint64_t v8 = a1[1];
  while (1)
  {
    unint64_t v18 = v7;
    unint64_t v19 = v8;
    uint64_t result = DERDecodeItem((uint64_t)&v18, &v15);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (__CFADD__(v16, v17)) {
      break;
    }
    unint64_t v10 = v16 + v17;
    unint64_t v11 = v16 + v17 - v7;
    BOOL v12 = !(v11 >> 17) && v8 >= v11;
    if (!v12 || v6 >= a3) {
      return 0xFFFFFFFFLL;
    }
    if (v5 < 16 * (unint64_t)v6) {
      break;
    }
    uint64_t v14 = (unint64_t *)(a2 + 16 * v6);
    unint64_t *v14 = v7;
    v14[1] = v11;
    if (v10 < v7) {
      break;
    }
    BOOL v12 = v8 >= v11;
    v8 -= v11;
    if (!v12) {
      goto LABEL_21;
    }
    ++v6;
    unint64_t v7 = v10;
    if (!v8)
    {
      if (v6 == a3) {
        return 0;
      }
      return 0xFFFFFFFFLL;
    }
  }
  __break(0x5513u);
LABEL_21:
  __break(0x5515u);
  return result;
}

uint64_t parse_extensions(uint64_t a1, void *a2)
{
  v11[0] = 0;
  v11[1] = 0;
  v9[1] = 0;
  uint64_t v10 = 0;
  unint64_t v8 = 0;
  v9[0] = 0;
  long long v7 = 0u;
  memset(v6, 0, sizeof(v6));
  *a2 = 0;
  a2[1] = 0;
  if (!*(void *)(a1 + 152)) {
    return 0;
  }
  if (DERDecodeSeqInit(a1 + 144, &v10, v11) || v10 != 0x2000000000000010) {
    return 0xFFFFFFFFLL;
  }
  char v3 = 1;
  while (1)
  {
    int v4 = DERDecodeSeqNext(v11, &v8);
    if (v4) {
      break;
    }
    if (v8 != 0x2000000000000010
      || DERParseSequenceContentToObject(v9, (unsigned __int16)DERNumExtensionItemSpecs, (uint64_t)&DERExtensionItemSpecs, (unint64_t)v6, 0x30uLL, 0x30uLL))
    {
      return 0xFFFFFFFFLL;
    }
    char v3 = 0;
    if (DEROidCompare((uint64_t)&oidAppleImg4ManifestCertSpec, (uint64_t)v6))
    {
      memset(v12, 0, sizeof(v12));
      if (DERDecodeItem((uint64_t)&v7, v12) || v12[0] != 0x2000000000000011) {
        return 0xFFFFFFFFLL;
      }
      char v3 = 0;
      *(_OWORD *)a2 = v7;
    }
  }
  if (v4 != 1 || (v3 & 1) != 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

_DWORD *DEREncoderCreate(int a1)
{
  uint64_t result = calloc(1uLL, 0x10uLL);
  if (result) {
    result[3] = a1;
  }
  return result;
}

void DEREncoderDestroy(void **a1)
{
  if (a1)
  {
    unint64_t v2 = *a1;
    if (v2)
    {
      do
      {
        char v3 = (void *)*v2;
        _EncodedDataRelease((uint64_t)v2);
        unint64_t v2 = v3;
      }
      while (v3);
    }
    free(a1);
  }
}

uint64_t DEREncoderAddData(uint64_t *a1, unsigned int a2, unsigned int a3, const void *a4, unsigned int a5, int a6)
{
  long long v7 = _EncodedDataCreate(a2, a3, a4, a5, a6, 3);

  return _DEREncoderAddEncodedData(a1, (uint64_t)v7);
}

uint64_t _DEREncoderAddEncodedData(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (!a1)
  {
    uint64_t v22 = 1;
    if (!a2) {
      return v22;
    }
    goto LABEL_30;
  }
  if (!a2) {
    return 2;
  }
  int v4 = *((_DWORD *)a1 + 2);
  uint64_t v5 = a2;
  do
  {
    int v6 = *(_DWORD *)(v5 + 20);
    BOOL v7 = __CFADD__(v4, v6);
    int v8 = v4 + v6;
    if (v7 || (v9 = *(_DWORD *)(v5 + 24), int v4 = v8 + v9, __CFADD__(v8, v9)))
    {
      uint64_t v22 = 2;
      do
      {
LABEL_30:
        uint64_t v23 = *(void *)v2;
        _EncodedDataRelease(v2);
        uint64_t v2 = v23;
      }
      while (v23);
      return v22;
    }
    uint64_t v5 = *(void *)v5;
  }
  while (v5);
  uint64_t v10 = (uint64_t *)*a1;
  unint64_t v11 = a1;
  if (!*a1) {
    goto LABEL_26;
  }
  int v12 = *((_DWORD *)a1 + 3);
  unint64_t v11 = a1;
  while (2)
  {
    unint64_t v13 = v11;
    unint64_t v11 = v10;
    if (!v12) {
      goto LABEL_20;
    }
    unint64_t v14 = bswap64(*(void *)(v2 + 28));
    unint64_t v15 = bswap64(*(uint64_t *)((char *)v11 + 28));
    if (v14 != v15 || (v14 = bswap64(*(void *)(v2 + 36)), unint64_t v15 = bswap64(*(uint64_t *)((char *)v11 + 36)), v14 != v15))
    {
      if (v14 < v15) {
        int v16 = -1;
      }
      else {
        int v16 = 1;
      }
LABEL_19:
      if (v16 < 0) {
        break;
      }
      goto LABEL_20;
    }
    unsigned int v17 = *(_DWORD *)(v2 + 24);
    unsigned int v18 = *((_DWORD *)v11 + 6);
    if (v17 >= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    int v16 = memcmp(*(const void **)(v2 + 8), (const void *)v11[1], v19);
    if (v16) {
      goto LABEL_19;
    }
    if (v17 >= v18)
    {
LABEL_20:
      uint64_t v10 = (uint64_t *)*v11;
      if (!*v11) {
        goto LABEL_26;
      }
      continue;
    }
    break;
  }
  unint64_t v20 = (void *)v2;
  do
  {
    uint64_t v21 = v20;
    unint64_t v20 = (void *)*v20;
  }
  while (v20);
  *uint64_t v21 = v11;
  unint64_t v11 = v13;
LABEL_26:
  uint64_t v22 = 0;
  *unint64_t v11 = v2;
  *((_DWORD *)a1 + 2) = v4;
  return v22;
}

char *_EncodedDataCreate(unsigned int a1, unsigned int a2, const void *a3, unsigned int a4, int a5, int a6)
{
  v28[1] = *MEMORY[0x263EF8340];
  if (!a3 && a4 && a6) {
    return 0;
  }
  int v12 = (char *)calloc(1uLL, 0x38uLL);
  unint64_t v13 = v12;
  if (!v12) {
    return v13;
  }
  *((_DWORD *)v12 + 4) = 1;
  unint64_t v14 = v12 + 28;
  if (a1 == 259)
  {
    int v15 = 0;
    goto LABEL_7;
  }
  if (a1 > 3) {
    goto LABEL_40;
  }
  if (a2 > 0x1E)
  {
    uint64_t v17 = 0;
    v28[0] = 0;
    do
    {
      *((unsigned char *)v28 + v17++) = a2 & 0x7F;
      BOOL v18 = a2 > 0x7F;
      a2 >>= 7;
    }
    while (v18);
    int v16 = v13 + 28;
    if ((v17 & 0xFFFFFFF0) == 0)
    {
      v13[28] = ((_BYTE)a1 << 6) | (32 * (a5 != 0)) | 0x1F;
      size_t v19 = v13 + 29;
      if (v17 >= 2)
      {
        uint64_t v20 = v17 - 1;
        do
          *v19++ = *((unsigned char *)v28 + v20--) | 0x80;
        while (v20);
      }
      *size_t v19 = v28[0];
      int v16 = v19 + 1;
    }
  }
  else
  {
    v13[28] = ((_BYTE)a1 << 6) | (32 * (a5 != 0)) | a2;
    int v16 = v13 + 29;
  }
  int v21 = v16 - v14;
  if (!v21) {
    goto LABEL_40;
  }
  uint64_t v22 = &v14[v21];
  if (a4 > 0x7F)
  {
    uint64_t v24 = 0;
    v28[0] = 0;
    unsigned int v25 = a4;
    do
    {
      *((unsigned char *)v28 + v24++) = v25;
      BOOL v18 = v25 > 0xFF;
      v25 >>= 8;
    }
    while (v18);
    if (16 - v21 <= v24)
    {
      LODWORD(v23) = v14 + v21;
    }
    else
    {
      *uint64_t v22 = v24 | 0x80;
      uint64_t v23 = v22 + 1;
      if (v24)
      {
        do
          *v23++ = *((unsigned char *)&v28[-1] + v24-- + 7);
        while (v24);
      }
    }
  }
  else
  {
    LODWORD(v23) = v14 + v21;
    if (v21 != 16)
    {
      *uint64_t v22 = a4;
      LODWORD(v23) = v22 + 1;
    }
  }
  int v26 = v23 - v22;
  if (v23 == v22)
  {
LABEL_40:
    free(v13);
    return 0;
  }
  unint64_t v14 = &v22[v26];
  int v15 = v21 + v26;
LABEL_7:
  *((_DWORD *)v13 + 5) = v15;
  switch(a6)
  {
    case 0:
      *((void *)v13 + 1) = 0;
      *((void *)v13 + 6) = 0;
      *((_DWORD *)v13 + 6) = 0;
      return v13;
    case 1:
      *((void *)v13 + 1) = a3;
      *((void *)v13 + 6) = 0;
      goto LABEL_25;
    case 2:
      *((void *)v13 + 1) = a3;
      *((void *)v13 + 6) = v13;
LABEL_25:
      *((_DWORD *)v13 + 6) = a4;
      return v13;
    case 3:
      if (v13 + 56 - v14 >= a4)
      {
        *((void *)v13 + 1) = v14;
        *((_DWORD *)v13 + 6) = a4;
      }
      else
      {
        unint64_t v14 = (char *)malloc(a4);
        *((void *)v13 + 1) = v14;
        *((void *)v13 + 6) = v13;
        *((_DWORD *)v13 + 6) = a4;
        if (!v14) {
          goto LABEL_40;
        }
      }
      memcpy(v14, a3, a4);
      break;
    default:
      return v13;
  }
  return v13;
}

uint64_t DEREncoderAddDataNoCopy(uint64_t *a1, unsigned int a2, unsigned int a3, const void *a4, unsigned int a5, int a6)
{
  BOOL v7 = _EncodedDataCreate(a2, a3, a4, a5, a6, 1);

  return _DEREncoderAddEncodedData(a1, (uint64_t)v7);
}

uint64_t DEREncoderAddUInt32(uint64_t *a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v5 = 0;
  uint64_t v13 = *MEMORY[0x263EF8340];
  unsigned int v10 = bswap32(a4);
  char v11 = 0;
  unsigned int v12 = v10;
  while (!*((unsigned char *)&v10 + v5))
  {
    if (++v5 == 4)
    {
      int v6 = 0;
      goto LABEL_6;
    }
  }
  int v6 = ((unint64_t)*((unsigned __int8 *)&v10 + v5) >> 7) - v5 + 4;
LABEL_6:
  if (v6 <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v6;
  }
  int v8 = _EncodedDataCreate(a2, a3, &v11 - v7 + 5, v7, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v8);
}

uint64_t DEREncoderAddUInt64(uint64_t *a1, unsigned int a2, unsigned int a3, unint64_t a4)
{
  uint64_t v5 = 0;
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v10 = bswap64(a4);
  char v11 = 0;
  unint64_t v12 = v10;
  while (!*((unsigned char *)&v10 + v5))
  {
    if (++v5 == 8)
    {
      int v6 = 0;
      goto LABEL_6;
    }
  }
  int v6 = ((unint64_t)*((unsigned __int8 *)&v10 + v5) >> 7) - v5 + 8;
LABEL_6:
  if (v6 <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v6;
  }
  int v8 = _EncodedDataCreate(a2, a3, &v11 - v7 + 9, v7, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v8);
}

uint64_t DEREncoderAddInt32AsData(uint64_t *a1, unsigned int a2, unsigned int a3, int a4)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v7 = a4;
  uint64_t v5 = _EncodedDataCreate(a2, a3, &v7, 4u, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v5);
}

uint64_t DEREncoderAddInt64AsData(uint64_t *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  v7[1] = *MEMORY[0x263EF8340];
  v7[0] = a4;
  uint64_t v5 = _EncodedDataCreate(a2, a3, v7, 8u, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v5);
}

uint64_t DEREncoderAddIA5String(uint64_t *a1, const void *a2, unsigned int a3)
{
  int v4 = _EncodedDataCreate(0, 0x16u, a2, a3, 0, 3);

  return _DEREncoderAddEncodedData(a1, (uint64_t)v4);
}

uint64_t DEREncoderAddBoolean(uint64_t *a1, int a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v7 = -1;
  char v6 = 0;
  if (a2) {
    char v3 = &v7;
  }
  else {
    char v3 = &v6;
  }
  int v4 = _EncodedDataCreate(0, 1u, v3, 1u, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v4);
}

uint64_t DEREncoderCreateEncodedBuffer(uint64_t **a1, void *a2, unsigned int *a3)
{
  if (!a1) {
    return 1;
  }
  unsigned int v6 = *((_DWORD *)a1 + 2);
  char v7 = (char *)malloc(v6);
  if (!v7) {
    return 2;
  }
  uint64_t v8 = v7;
  int v9 = (uint64_t **)*a1;
  if (*a1)
  {
    unint64_t v10 = v7;
    do
    {
      memcpy(v10, (char *)v9 + 28, *((unsigned int *)v9 + 5));
      char v11 = &v10[*((unsigned int *)v9 + 5)];
      memcpy(v11, v9[1], *((unsigned int *)v9 + 6));
      unint64_t v10 = &v11[*((unsigned int *)v9 + 6)];
      int v9 = (uint64_t **)*v9;
    }
    while (v9);
  }
  if (a3) {
    *a3 = v6;
  }
  if (a2)
  {
    uint64_t result = 0;
    *a2 = v8;
  }
  else
  {
    free(v8);
    return 0;
  }
  return result;
}

uint64_t DEREncoderAddDataFromEncoder(uint64_t **a1, uint64_t *a2, unsigned int a3, unsigned int a4)
{
  if (a1 && a2) {
    return _DEREncoderAddDataFromEncoderByEncoding(a1, a2, a3, a4, 1);
  }
  else {
    return 1;
  }
}

uint64_t _DEREncoderAddDataFromEncoderByEncoding(uint64_t **a1, uint64_t *a2, unsigned int a3, unsigned int a4, int a5)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unsigned int v13 = 0;
  unint64_t v12 = 0;
  uint64_t v9 = DEREncoderCreateEncodedBuffer(a1, &v12, &v13);
  if (!v9)
  {
    uint64_t v9 = 2;
    unint64_t v10 = _EncodedDataCreate(a3, a4, v12, v13, a5, 2);
    if (v10)
    {
      unint64_t v12 = 0;
      uint64_t v9 = _DEREncoderAddEncodedData(a2, (uint64_t)v10);
    }
  }
  if (v12) {
    free(v12);
  }
  return v9;
}

uint64_t DEREncoderAddDataFromEncoderNoCopy(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, int a5)
{
  uint64_t result = 1;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 12))
    {
      return _DEREncoderAddDataFromEncoderByEncoding((uint64_t **)a1, (uint64_t *)a2, a3, a4, a5);
    }
    else
    {
      uint64_t v8 = _EncodedDataCreate(a3, a4, 0, *(_DWORD *)(a1 + 8), 1, 0);
      if (v8)
      {
        uint64_t v9 = v8;
        unint64_t v10 = *(uint64_t **)a1;
        int v21 = 0;
        char v11 = &v21;
        while (v10)
        {
          unint64_t v12 = malloc(0x38uLL);
          if (!v12)
          {
            uint64_t v17 = v21;
            if (v21)
            {
              do
              {
                BOOL v18 = (void *)*v17;
                _EncodedDataRelease((uint64_t)v17);
                uint64_t v17 = v18;
              }
              while (v18);
            }
            *(void *)uint64_t v9 = 0;
            goto LABEL_22;
          }
          uint64_t v13 = v10[6];
          long long v15 = *((_OWORD *)v10 + 1);
          long long v14 = *((_OWORD *)v10 + 2);
          *unint64_t v12 = *(_OWORD *)v10;
          v12[1] = v15;
          *((void *)v12 + 6) = v13;
          void v12[2] = v14;
          *(void *)unint64_t v12 = 0;
          *((_DWORD *)v12 + 4) = 1;
          unint64_t v16 = v10[1];
          if ((unint64_t)v10 + 28 > v16 || v16 >= (unint64_t)(v10 + 7))
          {
            if (v13) {
              ++*(_DWORD *)(v13 + 16);
            }
          }
          else
          {
            *((void *)v12 + 1) = (char *)v12 + v16 - (void)v10;
          }
          *char v11 = v12;
          unint64_t v10 = (uint64_t *)*v10;
          char v11 = v12;
        }
        size_t v19 = v21;
        *(void *)uint64_t v9 = v21;
        if (v19) {
          goto LABEL_26;
        }
LABEL_22:
        if (*(void *)a1)
        {
          do
          {
            uint64_t v20 = *(char **)v9;
            _EncodedDataRelease((uint64_t)v9);
            uint64_t v9 = v20;
          }
          while (v20);
          return 2;
        }
LABEL_26:
        return _DEREncoderAddEncodedData((uint64_t *)a2, (uint64_t)v9);
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

uint64_t DEREncoderAddSequenceFromEncoder(uint64_t **a1, uint64_t *a2)
{
  if (a1 && a2) {
    return _DEREncoderAddDataFromEncoderByEncoding(a1, a2, 0, 0x10u, 1);
  }
  else {
    return 1;
  }
}

uint64_t DEREncoderAddSetFromEncoder(uint64_t **a1, uint64_t *a2)
{
  if (a1 && a2) {
    return _DEREncoderAddDataFromEncoderByEncoding(a1, a2, 0, 0x11u, 1);
  }
  else {
    return 1;
  }
}

uint64_t DEREncoderAddPrivateFromEncoder(uint64_t **a1, uint64_t *a2, unsigned int a3)
{
  unsigned int v6 = (uint64_t **)calloc(1uLL, 0x10uLL);
  char v7 = v6;
  if (!v6)
  {
    uint64_t v8 = 0xFFFFFFFFLL;
    goto LABEL_8;
  }
  *((_DWORD *)v6 + 3) = 0;
  if (!a1) {
    goto LABEL_7;
  }
  uint64_t v8 = _DEREncoderAddDataFromEncoderByEncoding(a1, (uint64_t *)v6, 0, 0x10u, 1);
  if (!v8)
  {
    if (a2)
    {
      uint64_t v8 = _DEREncoderAddDataFromEncoderByEncoding(v7, a2, 3u, a3, 1);
      goto LABEL_8;
    }
LABEL_7:
    uint64_t v8 = 1;
  }
LABEL_8:
  DEREncoderDestroy(v7);
  return v8;
}

void _EncodedDataRelease(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) - 1;
  *(_DWORD *)(a1 + 16) = v1;
  if (!v1)
  {
    char v3 = *(void **)(a1 + 8);
    if (v3)
    {
      uint64_t v4 = *(void *)(a1 + 48);
      BOOL v5 = (unint64_t)v3 >= a1 + 56 || a1 + 28 > (unint64_t)v3;
      if (v5 && v4 != 0)
      {
        if (v4 == a1) {
          free(v3);
        }
        else {
          _EncodedDataRelease(*(void *)(a1 + 48));
        }
      }
    }
    free((void *)a1);
  }
}

void _darwin_el0_logv_cold_1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  uint64_t v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void _darwin_el0_alloc_type_cold_1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  _os_crash_msg();
  __break(1u);
}

void _darwin_el0_query_trust_store_cold_1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  uint64_t v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void _darwin_runtime_alloc_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  uint64_t v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void dylib_restoreos_logv_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  __error();
  _os_log_send_and_compose_impl();
  CFDataRef v2 = (const __CFData *)_os_crash_msg();
  __break(1u);
  CFDataGetBytePtr(v2);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x270EF49E8](*(void *)&mainPort, path);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t __os_temporary_resource_shortage()
{
  return MEMORY[0x270ED7E58]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x270ED7F50]();
}

uint64_t _dyld_get_image_slide()
{
  return MEMORY[0x270ED7F68]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x270ED8068]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x270ED87B0](__count, __size);
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x270ED87D8]();
}

uint64_t ccder_blob_decode_bitstring()
{
  return MEMORY[0x270ED8888]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x270ED88B0]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x270ED88B8]();
}

uint64_t ccder_blob_decode_uint64()
{
  return MEMORY[0x270ED88C0]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x270ED88E8]();
}

uint64_t ccder_decode_rsa_pub_n()
{
  return MEMORY[0x270ED8918]();
}

uint64_t ccder_sizeof_len()
{
  return MEMORY[0x270ED89A0]();
}

uint64_t ccder_sizeof_tag()
{
  return MEMORY[0x270ED89B8]();
}

uint64_t ccdigest()
{
  return MEMORY[0x270ED8A40]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x270ED8A48]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x270ED8A50]();
}

uint64_t ccec_compressed_x962_export_pub()
{
  return MEMORY[0x270ED8A70]();
}

uint64_t ccec_compressed_x962_export_pub_size()
{
  return MEMORY[0x270ED8A78]();
}

uint64_t ccec_compressed_x962_import_pub()
{
  return MEMORY[0x270ED8A80]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x270ED8A98]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x270ED8AA0]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x270ED8AB8]();
}

uint64_t ccec_get_cp()
{
  return MEMORY[0x270ED8AD0]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x270ED8AD8]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x270ED8AE0]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x270ED8B00]();
}

uint64_t ccec_verify_composite()
{
  return MEMORY[0x270ED8B08]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x270ED8B28]();
}

uint64_t ccrsa_import_pub()
{
  return MEMORY[0x270ED8D08]();
}

uint64_t ccrsa_make_pub()
{
  return MEMORY[0x270ED8D20]();
}

uint64_t ccrsa_verify_pkcs1v15()
{
  return MEMORY[0x270ED8D38]();
}

uint64_t ccrsa_verify_pkcs1v15_allowshortsigs()
{
  return MEMORY[0x270ED8D40]();
}

uint64_t ccrsa_verify_pkcs1v15_digest()
{
  return MEMORY[0x270ED8D48]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x270ED8D60]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x270ED8D70]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x270ED8D78]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x270ED8E70]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

double difftime(time_t a1, time_t a2)
{
  MEMORY[0x270ED9180](a1, a2);
  return result;
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

int dprintf(int a1, const char *a2, ...)
{
  return MEMORY[0x270ED9668](*(void *)&a1, a2);
}

uint64_t dyld_program_minos_at_least()
{
  return MEMORY[0x270ED9710]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x270ED9A18](*(void *)&a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int getdtablesize(void)
{
  return MEMORY[0x270ED9BD8]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

char *__cdecl getsectdatafromheader_64(const mach_header_64 *mhp, const char *segname, const char *sectname, uint64_t *size)
{
  return (char *)MEMORY[0x270ED9D58](mhp, segname, sectname, size);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x270EDA4B8](__s, __smax, *(void *)&__c, __n);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_log_with_args()
{
  return MEMORY[0x270EDA9E0]();
}

uint64_t os_parse_boot_arg_int()
{
  return MEMORY[0x270EDAA30]();
}

uint64_t os_parse_boot_arg_string()
{
  return MEMORY[0x270EDAA38]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x270EDB670](a1, a2, a3);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x270EDB688](__stringp, __delim);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

int sysctlnametomib(const char *a1, int *a2, size_t *a3)
{
  return MEMORY[0x270EDB7E0](a1, a2, a3);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x270EDB938](a1);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x270EDBA30](in, uu);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA58](a1, a2, a3);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA70](a1, a2, a3);
}