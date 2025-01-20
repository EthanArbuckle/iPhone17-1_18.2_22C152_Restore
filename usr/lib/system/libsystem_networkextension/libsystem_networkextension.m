uint64_t ne_tracker_check_tcc(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];
  uint8_t buf[16];

  if (qword_1EB2A3760 != -1) {
    dispatch_once(&qword_1EB2A3760, &__block_literal_global_10);
  }
  if (state != -1) {
    dispatch_once(&state, &__block_literal_global_14);
  }
  if (off_1EB2A3780 && !off_1EB2A3780(a1))
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    v4 = ne_log_obj_log_obj;
    v3 = 2;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_debug_impl(&dword_19DD92000, v4, OS_LOG_TYPE_DEBUG, "ne_tracker_check_tcc(): Tracking is denied. Returning: ne_tcc_result_denied", v6, 2u);
    }
  }
  else
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    v2 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19DD92000, v2, OS_LOG_TYPE_DEBUG, "ne_tracker_check_tcc(): Tracking is allowed. Returning: ne_tcc_result_allowed", buf, 2u);
    }
    return 1;
  }
  return v3;
}

void __ne_copy_uuid_cache_locked_block_invoke()
{
  ne_copy_uuid_cache_locked_g_my_os_version = (uint64_t)ne_session_copy_os_version_string();
  if (!ne_copy_uuid_cache_locked_g_my_os_version)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    v0 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19DD92000, v0, OS_LOG_TYPE_FAULT, "Failed to get the current OS version", buf, 2u);
    }
  }
  if (!ne_session_get_boot_session_uuid(ne_copy_uuid_cache_locked_g_my_boot_session_uuid))
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    v1 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_fault_impl(&dword_19DD92000, v1, OS_LOG_TYPE_FAULT, "Failed to get the boot session uuid", v2, 2u);
    }
  }
}

BOOL ne_session_get_boot_session_uuid(unsigned __int8 *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F14BF8];
  memset(in, 0, sizeof(in));
  size_t v6 = 37;
  int v2 = sysctlbyname("kern.bootsessionuuid", in, &v6, 0, 0);
  if (v2)
  {
    int v3 = *__error();
    if (strerror_r(v3, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    v4 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v8 = v3;
      __int16 v9 = 2080;
      v10 = __strerrbuf;
      _os_log_fault_impl(&dword_19DD92000, v4, OS_LOG_TYPE_FAULT, "Failed to get kern.bootsessionuuid: [%d] %s", buf, 0x12u);
    }
  }
  else
  {
    uuid_parse(in, a1);
  }
  return v2 == 0;
}

void *ne_session_copy_os_version_string()
{
  uint64_t v15 = *MEMORY[0x1E4F14BF8];
  size_t v8 = 0;
  if (sysctlbyname("kern.osversion", 0, &v8, 0, 0))
  {
    int v0 = *__error();
    if (strerror_r(v0, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    v1 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v10 = v0;
      *(_WORD *)&v10[4] = 2080;
      *(void *)&v10[6] = __strerrbuf;
      _os_log_fault_impl(&dword_19DD92000, v1, OS_LOG_TYPE_FAULT, "Failed to get the size of the kern.osversion sysctl value: [%d] %s", buf, 0x12u);
    }
  }
  else
  {
    v4 = malloc_type_malloc(v8 + 1, 0xBD1E4F51uLL);
    if (v4)
    {
      int v2 = v4;
      bzero(v4, v8 + 1);
      if (!sysctlbyname("kern.osversion", v2, &v8, 0, 0)) {
        return v2;
      }
      int v5 = *__error();
      if (strerror_r(v5, __strerrbuf, 0x80uLL)) {
        __strerrbuf[0] = 0;
      }
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      size_t v6 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218498;
        *(void *)v10 = v8;
        *(_WORD *)&v10[8] = 1024;
        *(_DWORD *)&v10[10] = v5;
        __int16 v11 = 2080;
        v12 = __strerrbuf;
        _os_log_fault_impl(&dword_19DD92000, v6, OS_LOG_TYPE_FAULT, "Failed to get the kern.osversion sysctl value (%lu bytes): [%d] %s", buf, 0x1Cu);
      }
      free(v2);
    }
    else
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      v7 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__strerrbuf = 134217984;
        size_t v14 = v8 + 1;
        _os_log_error_impl(&dword_19DD92000, v7, OS_LOG_TYPE_ERROR, "Failed to allocate %lu bytes for the version string", (uint8_t *)__strerrbuf, 0xCu);
      }
    }
  }
  return 0;
}

dispatch_queue_t __globals_init_block_invoke()
{
  int v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("ne_session queue", v0);
  g_queue = (uint64_t)result;
  g_sessions = 0;
  return result;
}

BOOL ne_tracker_build_cache(uint64_t a1, unsigned char *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F14BF8];
  if (!ne_tracker_check_info_changed() && (*(void *)(a1 + 40) || ne_tracker_build_cache_cache_ok == 0))
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    int v5 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
    {
      if (*(void *)(a1 + 40)) {
        v29 = "is";
      }
      else {
        v29 = "is not";
      }
      *(_DWORD *)buf = 136315138;
      v31 = v29;
      _os_log_debug_impl(&dword_19DD92000, v5, OS_LOG_TYPE_DEBUG, "Tracker info has not changed, cache %s available", buf, 0xCu);
    }
    if (*(void *)(a1 + 40)) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = ne_tracker_build_cache_cache_ok == 0;
    }
    return !v6;
  }
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  v7 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19DD92000, v7, OS_LOG_TYPE_DEFAULT, "Building the tracker info cache", buf, 2u);
  }
  if (a1) {
    ne_trie_free(a1);
  }
  getpid();
  if (sandbox_check() || (getpid(), sandbox_check()))
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    size_t v8 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "ne_tracker_build_cache";
      __int16 v32 = 2080;
      v33 = "/private/var/db/com.apple.networkextension.tracker-info";
      _os_log_impl(&dword_19DD92000, v8, OS_LOG_TYPE_DEFAULT, "%s: No read permission to file %s", buf, 0x16u);
    }
    if (a2 && open("/private/var/db/com.apple.networkextension.tracker-info", 0) < 0 && *__error() != 2) {
      *a2 = 1;
    }
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "delegate-class-id", 0xCuLL);
    xpc_dictionary_set_uint64(v9, "tracker-command", 1uLL);
    xpc_object_t v10 = ne_tracker_copy_response(v9);
    __int16 v11 = v10;
    if (v10 && MEMORY[0x19F3B5680](v10) == MEMORY[0x1E4F14D40])
    {
      int64_t int64 = xpc_dictionary_get_int64(v11, "result-code");
      if (int64)
      {
        uint64_t v15 = (const char *)int64;
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        v16 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v31 = v15;
          _os_log_error_impl(&dword_19DD92000, v16, OS_LOG_TYPE_ERROR, "Failed to get the domain list from nehelper: %lld", buf, 0xCu);
        }
        uint64_t v13 = 0;
      }
      else
      {
        xpc_object_t value = xpc_dictionary_get_value(v11, "domain-dictionary");
        xpc_object_t v21 = xpc_dictionary_get_value(v11, "sorted-domains");
        int64_t v22 = xpc_dictionary_get_int64(v11, "unique-prefix-count");
        int64_t v23 = xpc_dictionary_get_int64(v11, "total-byte-count");
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        v24 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v31 = "ne_tracker_fetch_trie_from_nehelper";
          _os_log_impl(&dword_19DD92000, v24, OS_LOG_TYPE_DEFAULT, "%s: Building trie from scratch", buf, 0xCu);
        }
        ne_tracker_build_trie((unsigned __int16 *)a1, v21, value, v22, v23, -1, 0.0);
        uint64_t v13 = 1;
      }
    }
    else
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      v12 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DD92000, v12, OS_LOG_TYPE_ERROR, "Got an invalid response from nehelper", buf, 2u);
      }
      uint64_t v13 = 0;
      if (!v11) {
        goto LABEL_54;
      }
    }
    xpc_release(v11);
LABEL_54:
    xpc_release(v9);
    ne_tracker_build_cache_cache_ok = v13;
    return v13;
  }
  int v17 = open("/private/var/db/com.apple.networkextension.tracker-info", 0, "/private/var/db/com.apple.networkextension.tracker-info");
  if ((v17 & 0x80000000) == 0)
  {
    int v18 = v17;
    ne_trie_init_from_file(a1, v17, 0);
    ne_tracker_build_cache_cache_ok = v19;
    close(v18);
    BOOL v6 = ne_tracker_build_cache_cache_ok == 0;
    return !v6;
  }
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  v26 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
  {
    v27 = __error();
    v28 = strerror(*v27);
    *(_DWORD *)buf = 136315394;
    v31 = "/private/var/db/com.apple.networkextension.tracker-info";
    __int16 v32 = 2080;
    v33 = v28;
    _os_log_impl(&dword_19DD92000, v26, OS_LOG_TYPE_DEFAULT, "Failed to open trie mmap file %s: %s", buf, 0x16u);
  }
  uint64_t v13 = 0;
  ne_tracker_build_cache_cache_ok = 0;
  return v13;
}

BOOL ne_tracker_check_info_changed()
{
  uint64_t v11 = *MEMORY[0x1E4F14BF8];
  int check = 0;
  int v0 = ne_tracker_check_info_changed_current_info_token;
  if (ne_tracker_check_info_changed_current_info_token < 0)
  {
    if (notify_register_check("com.apple.nehelper.tracker-info-ready", &ne_tracker_check_info_changed_current_info_token))
    {
      goto LABEL_6;
    }
    int v0 = ne_tracker_check_info_changed_current_info_token;
    uint64_t v5 = 0;
    if (ne_tracker_check_info_changed_current_info_token < 0)
    {
      uint64_t v1 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (notify_check(v0, &check))
  {
LABEL_4:
    notify_cancel(ne_tracker_check_info_changed_current_info_token);
LABEL_6:
    uint64_t v1 = 0;
    ne_tracker_check_info_changed_current_info_token = -1;
    uint64_t v5 = 0;
    goto LABEL_7;
  }
  if (check)
  {
    if (notify_get_state(ne_tracker_check_info_changed_current_info_token, &v5)) {
      goto LABEL_4;
    }
    uint64_t v1 = v5;
  }
  else
  {
    uint64_t v1 = ne_tracker_check_info_changed_current_timestamp;
    uint64_t v5 = ne_tracker_check_info_changed_current_timestamp;
  }
LABEL_7:
  uint64_t v2 = ne_tracker_check_info_changed_current_timestamp;
  if (v1 != ne_tracker_check_info_changed_current_timestamp)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    int v3 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v8 = ne_tracker_check_info_changed_current_timestamp;
      __int16 v9 = 2048;
      uint64_t v10 = v5;
      _os_log_impl(&dword_19DD92000, v3, OS_LOG_TYPE_DEFAULT, "Tracker info timestamp changed from %llu to %llu", buf, 0x16u);
    }
    ne_tracker_check_info_changed_current_timestamp = v5;
  }
  return v1 != v2;
}

unint64_t ne_session_app_vpn_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 62) & 1;
}

uint64_t get_current_config_state()
{
  int check = 0;
  int v0 = get_current_config_state_config_token;
  if (get_current_config_state_config_token < 0)
  {
    if (notify_register_check("com.apple.neconfigurationchanged", &get_current_config_state_config_token))
    {
      get_current_config_state_config_token = -1;
      return get_current_config_state_current_state;
    }
    int v0 = get_current_config_state_config_token;
    if (get_current_config_state_config_token < 0) {
      return get_current_config_state_current_state;
    }
  }
  if (notify_check(v0, &check)
    || check
    && notify_get_state(get_current_config_state_config_token, (uint64_t *)&get_current_config_state_current_state))
  {
    notify_cancel(get_current_config_state_config_token);
    get_current_config_state_config_token = -1;
    get_current_config_state_current_state = 0;
  }
  return get_current_config_state_current_state;
}

uint64_t ne_log_obj()
{
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  return ne_log_obj_log_obj;
}

BOOL ne_tracker_should_save_stacktrace()
{
  if (ne_tracker_should_save_stacktrace_once_token != -1) {
    dispatch_once(&ne_tracker_should_save_stacktrace_once_token, &__block_literal_global_6);
  }
  int v0 = ne_tracker_should_save_stacktrace_dynamic_tracing_handle;

  return os_signpost_enabled(v0);
}

void __ne_tracker_check_init_block_invoke()
{
  uint64_t v18 = *MEMORY[0x1E4F14BF8];
  int v0 = dlopen("/usr/lib/libnetworkextension.dylib", 6);
  qword_1EB2A3770 = (uint64_t)v0;
  if (v0)
  {
    off_1EB2A3778 = dlsym(v0, "NEHelperPidFromAuditToken");
    off_1EB2A3780 = (uint64_t (*)(void))dlsym((void *)qword_1EB2A3770, "NEHelperIsTCCTrackingAllowed");
    off_1EB2A3788 = dlsym((void *)qword_1EB2A3770, "NEHelperIsBundle");
    off_1EB2A3790 = dlsym((void *)qword_1EB2A3770, "NEHelperIsHostnameDesignatedTracker");
    off_1EB2A3798 = dlsym((void *)qword_1EB2A3770, "NEHelperIsHostnameDesignatedTrackerExternal");
    off_1EB2A37A0 = dlsym((void *)qword_1EB2A3770, "NEHelperIsOSFeatureEnabled");
    off_1EB2A37A8 = dlsym((void *)qword_1EB2A3770, "NEHelperTrackerGetDispositionWrapper");
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v1 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 67110656;
      *(_DWORD *)v7 = off_1EB2A3778 == 0;
      *(_WORD *)&v7[4] = 1024;
      *(_DWORD *)&v7[6] = off_1EB2A3780 == 0;
      __int16 v8 = 1024;
      BOOL v9 = off_1EB2A3788 == 0;
      __int16 v10 = 1024;
      BOOL v11 = off_1EB2A3790 == 0;
      __int16 v12 = 1024;
      BOOL v13 = off_1EB2A3798 == 0;
      __int16 v14 = 1024;
      BOOL v15 = off_1EB2A37A0 == 0;
      __int16 v16 = 1024;
      BOOL v17 = off_1EB2A37A8 == 0;
      uint64_t v2 = "ne_tracker_check subsystem is initialized with: {%d%d%d%d%d%d%d}";
      int v3 = v1;
      uint32_t v4 = 44;
LABEL_11:
      _os_log_debug_impl(&dword_19DD92000, v3, OS_LOG_TYPE_DEBUG, v2, (uint8_t *)&v6, v4);
    }
  }
  else
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v5 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315138;
      *(void *)v7 = "/usr/lib/libnetworkextension.dylib";
      uint64_t v2 = "ne_tracker_check subsystem failed to load: %s";
      int v3 = v5;
      uint32_t v4 = 12;
      goto LABEL_11;
    }
  }
}

uint64_t ne_session_get_config_id_from_network_agent(uint64_t result, unsigned __int8 *a2, _DWORD *a3)
{
  if (result)
  {
    uint64_t v5 = result;
    if (!strcmp((const char *)(result + 16), "NetworkExtension") && *(_DWORD *)(v5 + 212) == 40)
    {
      if (a2) {
        uuid_copy(a2, (const unsigned __int8 *)(v5 + 216));
      }
      if (a3) {
        *a3 = *(_DWORD *)(v5 + 232);
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t ne_tracker_check_is_hostname_blocked(uint64_t a1, uint64_t a2)
{
  uint64_t v41 = *MEMORY[0x1E4F14BF8];
  if (!a1) {
    return 0;
  }
  if (qword_1EB2A3760 != -1) {
    dispatch_once(&qword_1EB2A3760, &__block_literal_global_10);
  }
  if (state != -1) {
    dispatch_once(&state, &__block_literal_global_14);
  }
  if (off_1EB2A37A0 && off_1EB2A37A0())
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v4 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG)) {
      return 0;
    }
    LODWORD(buffer[0]) = 136315138;
    *(void *)((char *)buffer + 4) = "ne_tracker_check_is_hostname_blocked";
    uint64_t v5 = "%s(): OS feature is set for {NetworkExtension, DisableCheckBlockedHostnames}.";
    goto LABEL_26;
  }
  if (off_1EB2A3788 && (off_1EB2A3788() & 1) == 0)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v4 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG)) {
      return 0;
    }
    LODWORD(buffer[0]) = 136315138;
    *(void *)((char *)buffer + 4) = "ne_tracker_check_is_hostname_blocked";
    uint64_t v5 = "%s(): executable binary is not a bundle";
LABEL_26:
    __int16 v8 = v4;
    uint32_t v9 = 12;
LABEL_53:
    _os_log_debug_impl(&dword_19DD92000, v8, OS_LOG_TYPE_DEBUG, v5, (uint8_t *)buffer, v9);
    return 0;
  }
  if (!a2) {
    goto LABEL_37;
  }
  if (*(void *)a2)
  {
LABEL_16:
    if (!off_1EB2A3798) {
      return 0;
    }
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    int v6 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buffer[0]) = 136315395;
      *(void *)((char *)buffer + 4) = "ne_tracker_check_is_hostname_blocked";
      WORD6(buffer[0]) = 2081;
      *(void *)((char *)buffer + 14) = a1;
      _os_log_debug_impl(&dword_19DD92000, v6, OS_LOG_TYPE_DEBUG, "%s() proceeding with the external check for hostname: %{private}s", (uint8_t *)buffer, 0x16u);
    }
    return off_1EB2A3798(a1, a2);
  }
  __int16 v10 = *(_OWORD **)(a2 + 8);
  if (v10)
  {
    if (!off_1EB2A3778) {
      goto LABEL_37;
    }
    long long v11 = v10[1];
    buffer[0] = *v10;
    buffer[1] = v11;
    int v12 = off_1EB2A3778(buffer);
  }
  else
  {
    if (*(void *)(a2 + 16))
    {
      pid_t v13 = getpid();
      *(void *)&long long v28 = 0;
      long long v27 = 0u;
      memset(buffer, 0, sizeof(buffer));
      if (proc_pidinfo(v13, 17, 1uLL, buffer, 56) == 56
        && uuid_compare(*(const unsigned __int8 **)(a2 + 16), (const unsigned __int8 *)buffer))
      {
        goto LABEL_16;
      }
      goto LABEL_37;
    }
    int v12 = *(_DWORD *)(a2 + 24);
    if (!v12) {
      goto LABEL_37;
    }
  }
  if (v12 != getpid()) {
    goto LABEL_16;
  }
LABEL_37:
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  __int16 v14 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buffer[0]) = 136315395;
    *(void *)((char *)buffer + 4) = "ne_tracker_check_is_hostname_blocked";
    WORD6(buffer[0]) = 2081;
    *(void *)((char *)buffer + 14) = a1;
    _os_log_debug_impl(&dword_19DD92000, v14, OS_LOG_TYPE_DEBUG, "%s() proceeding with the in_the_app check for hostname: %{private}s", (uint8_t *)buffer, 0x16u);
  }
  if (!off_1EB2A3790 || !off_1EB2A3790(a1))
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v16 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG)) {
      return 0;
    }
    LODWORD(buffer[0]) = 136315395;
    *(void *)((char *)buffer + 4) = "ne_tracker_check_is_hostname_blocked";
    WORD6(buffer[0]) = 2081;
    *(void *)((char *)buffer + 14) = a1;
    uint64_t v5 = "%s(): hostname %{private}s is not a tracker. Returning: ne_tracker_status_none";
    __int16 v8 = v16;
    uint32_t v9 = 22;
    goto LABEL_53;
  }
  if (off_1EB2A3780 && !off_1EB2A3780(0))
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v18 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buffer[0]) = 136315395;
      *(void *)((char *)buffer + 4) = "ne_tracker_check_is_hostname_blocked";
      WORD6(buffer[0]) = 2081;
      *(void *)((char *)buffer + 14) = a1;
      _os_log_debug_impl(&dword_19DD92000, v18, OS_LOG_TYPE_DEBUG, "%s(): Tracking is not allowed by the user, hostname %{private}s is a declared tracker. Returning: ne_tracker_status_blocked", (uint8_t *)buffer, 0x16u);
    }
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
    memset(buffer, 0, sizeof(buffer));
    pid_t v19 = getpid();
    proc_name(v19, buffer, 0x100u);
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    v20 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
    {
      xpc_object_t v21 = (const char *)buffer;
      if (!LOBYTE(buffer[0])) {
        xpc_object_t v21 = "";
      }
      int v22 = 136315394;
      uint64_t v23 = a1;
      __int16 v24 = 2080;
      v25 = v21;
      _os_log_impl(&dword_19DD92000, v20, OS_LOG_TYPE_DEFAULT, "Denied access to %s because it matches a domain in the NSTrackingDomains of %s, which does not have permission to track.", (uint8_t *)&v22, 0x16u);
    }
    return 1;
  }
  else
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    BOOL v15 = ne_log_obj_log_obj;
    uint64_t v7 = 2;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buffer[0]) = 136315395;
      *(void *)((char *)buffer + 4) = "ne_tracker_check_is_hostname_blocked";
      WORD6(buffer[0]) = 2081;
      *(void *)((char *)buffer + 14) = a1;
      _os_log_debug_impl(&dword_19DD92000, v15, OS_LOG_TYPE_DEBUG, "%s(): Tracking is allowed, hostname %{private}s is a declared tracker. Returning: ne_tracker_status_declared", (uint8_t *)buffer, 0x16u);
    }
  }
  return v7;
}

uint64_t ne_session_set_socket_attributes(int a1, char *__s, const char *a3)
{
  if (a1 == -1) {
    return 0;
  }
  uint64_t v4 = __s;
  if (!((unint64_t)__s | (unint64_t)a3)) {
    return 1;
  }
  if (__s)
  {
    size_t v7 = strlen(__s) + 6;
    if (!a3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  size_t v7 = 0;
  if (a3) {
LABEL_7:
  }
    v7 += strlen(a3) + 6;
LABEL_8:
  uint64_t result = (uint64_t)malloc_type_malloc(v7, 0xD44B12FFuLL);
  if (result)
  {
    __int16 v8 = (char *)result;
    bzero((void *)result, v7);
    uint64_t v9 = (uint64_t)v8;
    if (v4)
    {
      size_t v10 = strlen(v4);
      if (v10 >= 2)
      {
        size_t v11 = v10 - 1;
        if (v4[v10 - 1] == 46)
        {
          __strncpy_chk();
          ne_session_trim_domain_domain_buffer[v11] = 0;
          uint64_t v4 = ne_session_trim_domain_domain_buffer;
        }
      }
      int v12 = strlen(v4);
      *__int16 v8 = 7;
      size_t v13 = (v12 + 1);
      *(_DWORD *)(v8 + 1) = v13;
      if (v12 == -1) {
        size_t v13 = 0;
      }
      else {
        memcpy(v8 + 5, v4, v13);
      }
      uint64_t v9 = (uint64_t)&v8[v13 + 5];
    }
    if (a3)
    {
      int v14 = strlen(a3);
      *(unsigned char *)uint64_t v9 = 8;
      size_t v15 = (v14 + 1);
      *(_DWORD *)(v9 + 1) = v15;
      if (v14 != -1) {
        memcpy((void *)(v9 + 5), a3, v15);
      }
    }
    int v16 = setsockopt(a1, 0xFFFF, 4361, v8, v7);
    free(v8);
    return v16 == 0;
  }
  return result;
}

uint64_t __ne_copy_cached_uuids_for_bundle_identifier_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _OWORD buffer[2] = *MEMORY[0x1E4F14BF8];
  if (a3)
  {
    if (MEMORY[0x19F3B5680](a3) == MEMORY[0x1E4F14D30])
    {
      buffer[0] = 0;
      buffer[1] = 0;
      size_t bytes = xpc_data_get_bytes(a3, buffer, 0, 0x10uLL);
      if (bytes == xpc_data_get_length(a3))
      {
        xpc_object_t v6 = xpc_uuid_create((const unsigned __int8 *)buffer);
        if (v6)
        {
          size_t v7 = v6;
          xpc_array_append_value(*(xpc_object_t *)(a1 + 32), v6);
          xpc_release(v7);
        }
      }
    }
  }
  return 1;
}

uint64_t ne_session_agent_get_advisory(uint64_t result, int a2, unsigned char *a3, BOOL *a4, BOOL *a5, BOOL *a6, _DWORD *a7, void *a8, void *a9)
{
  if (result)
  {
    uint64_t v16 = result;
    if (!strcmp((const char *)(result + 16), "NetworkExtension")
      && !strcmp((const char *)(v16 + 48), "PathController")
      && *(_DWORD *)(v16 + 212) == 140)
    {
      uint64_t v17 = 0;
      while (1)
      {
        int v18 = *(_DWORD *)(v16 + 272 + 4 * v17);
        if (!v18 || v18 == a2) {
          break;
        }
        uint64_t result = 0;
        if (++v17 == 4) {
          return result;
        }
      }
      if (a3) {
        *a3 = *(unsigned char *)(v16 + 288) & 1;
      }
      if (a4) {
        *a4 = (*(unsigned char *)(v16 + 288) & 2) != 0;
      }
      if (a5) {
        *a5 = (*(unsigned char *)(v16 + 288) & 4) != 0;
      }
      if (a6) {
        *a6 = (*(unsigned char *)(v16 + 288) & 8) != 0;
      }
      if (a7) {
        *a7 = *(_DWORD *)(v16 + 4 * v17 + 256);
      }
      if (a8) {
        *a8 = v16 + 289;
      }
      if (a9) {
        *a9 = v16 + 321;
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void *ne_copy_uuid_cache()
{
  os_unfair_lock_lock((os_unfair_lock_t)&g_uuid_cache_lock);
  int v0 = ne_copy_uuid_cache_locked();
  os_unfair_lock_unlock((os_unfair_lock_t)&g_uuid_cache_lock);
  return v0;
}

xpc_object_t NEHelperCacheCopyAppUUIDMappingForUIDExtended(unsigned int a1, const char *a2, const char *a3, int a4)
{
  uint64_t v41 = *MEMORY[0x1E4F14BF8];
  if (!a2) {
    return 0;
  }
  if (a3)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v8 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_INFO)) {
      goto LABEL_8;
    }
    int v37 = 136315394;
    long long v38 = a2;
    __int16 v39 = 2080;
    long long v40 = a3;
    uint64_t v9 = "UUID cache ignored for %s, path is set: %s";
    size_t v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    uint32_t v12 = 22;
LABEL_7:
    _os_log_impl(&dword_19DD92000, v10, v11, v9, (uint8_t *)&v37, v12);
LABEL_8:
    xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v13, "delegate-class-id", 1uLL);
    xpc_dictionary_set_uint64(v13, "cache-command", 3uLL);
    xpc_dictionary_set_string(v13, "cache-signing-identifier", a2);
    if (a3) {
      xpc_dictionary_set_string(v13, "cache-executable-path", a3);
    }
    if (a4) {
      xpc_dictionary_set_BOOL(v13, "cache-allow-synthesis", 1);
    }
    if (a1) {
      xpc_dictionary_set_int64(v13, "cache-user-uid", a1);
    }
    xpc_object_t v14 = NEHelperCopyResponse(v13);
    if (v14)
    {
      int v18 = v14;
      uint64_t v19 = MEMORY[0x19F3B5680](v14, v15, v16, v17);
      uint64_t v20 = MEMORY[0x1E4F14D40];
      if (v19 == MEMORY[0x1E4F14D40]
        && (xpc_object_t value = xpc_dictionary_get_value(v18, "result-data")) != 0
        && (long long v28 = value, MEMORY[0x19F3B5680](value, v25, v26, v27) == v20)
        && (xpc_object_t v29 = xpc_dictionary_get_value(v28, "cache-app-uuid")) != 0
        && (long long v33 = v29, MEMORY[0x19F3B5680](v29, v30, v31, v32) == MEMORY[0x1E4F14D18]))
      {
        xpc_object_t v21 = xpc_copy(v33);
      }
      else
      {
        xpc_object_t v21 = 0;
      }
      xpc_release(v18);
    }
    else
    {
      xpc_object_t v21 = 0;
    }
    xpc_release(v13);
    return v21;
  }
  xpc_object_t v22 = ne_copy_cached_uuids_for_bundle_identifier(a2, a4);
  if (!v22)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v34 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    int v37 = 136315138;
    long long v38 = a2;
    uint64_t v9 = "UUID cache miss for %s";
    size_t v10 = v34;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 12;
    goto LABEL_7;
  }
  xpc_object_t v21 = v22;
  if (!xpc_array_get_count(v22))
  {
    xpc_release(v21);
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    long long v35 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_INFO))
    {
      int v37 = 136315138;
      long long v38 = a2;
      _os_log_impl(&dword_19DD92000, v35, OS_LOG_TYPE_INFO, "UUID cache hit (negative) for %s", (uint8_t *)&v37, 0xCu);
    }
    return 0;
  }
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  uint64_t v23 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_INFO))
  {
    int v37 = 136315138;
    long long v38 = a2;
    _os_log_impl(&dword_19DD92000, v23, OS_LOG_TYPE_INFO, "UUID cache hit for %s", (uint8_t *)&v37, 0xCu);
  }
  return v21;
}

xpc_object_t ne_copy_cached_uuids_for_bundle_identifier(const char *a1, int a2)
{
  os_unfair_lock_lock((os_unfair_lock_t)&g_uuid_cache_lock);
  g_ne_read_uuid_cache = 0;
  g_ne_uuid_cache_hit = 0;
  uint64_t v4 = ne_copy_uuid_cache_locked();
  if (!v4)
  {
    xpc_object_t v8 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = v4;
  uint64_t v6 = MEMORY[0x19F3B5680]();
  uint64_t v7 = MEMORY[0x1E4F14D40];
  if (v6 != MEMORY[0x1E4F14D40]) {
    goto LABEL_3;
  }
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(v5, "uuid-mappings");
  if (dictionary && (os_log_type_t v11 = dictionary, MEMORY[0x19F3B5680]() == v7))
  {
    xpc_object_t value = xpc_dictionary_get_value(v11, a1);
    if (value)
    {
      xpc_object_t v13 = value;
      uint64_t v14 = MEMORY[0x19F3B5680]();
      uint64_t v15 = MEMORY[0x1E4F14D18];
      if (v14 == MEMORY[0x1E4F14D18])
      {
        if (!xpc_array_get_count(v13) && (a2 & 1) != 0) {
          goto LABEL_10;
        }
      }
      else if (a2)
      {
        goto LABEL_10;
      }
      if (MEMORY[0x19F3B5680](v13) == v15)
      {
        xpc_object_t v8 = xpc_array_create(0, 0);
        applier[0] = MEMORY[0x1E4F14BE8];
        applier[1] = 0x40000000;
        applier[2] = __ne_copy_cached_uuids_for_bundle_identifier_block_invoke;
        applier[3] = &__block_descriptor_tmp_162;
        applier[4] = v8;
        xpc_array_apply(v13, applier);
        g_ne_uuid_cache_hit = 1;
        goto LABEL_4;
      }
      goto LABEL_3;
    }
    if (a2) {
      goto LABEL_10;
    }
  }
  else if (a2)
  {
LABEL_10:
    xpc_object_t v8 = ne_copy_cached_synthesized_uuids_for_bundle_identifier_locked(a1, v5);
    goto LABEL_4;
  }
LABEL_3:
  xpc_object_t v8 = 0;
LABEL_4:
  xpc_release(v5);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&g_uuid_cache_lock);
  return v8;
}

unsigned __int8 *NEHelperCacheCopySigningIdentifierMapping(unsigned __int8 *uu)
{
  uint64_t v1 = uu;
  uint64_t v10 = *MEMORY[0x1E4F14BF8];
  if (uu)
  {
    memset(out, 0, 37);
    uuid_unparse(uu, out);
    uint64_t v1 = (unsigned __int8 *)ne_copy_cached_bundle_identifier_for_uuid((uint64_t)v1);
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v2 = ne_log_obj_log_obj;
    BOOL v3 = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG);
    if (v1)
    {
      if (v3)
      {
        int v5 = 136315394;
        uint64_t v6 = out;
        __int16 v7 = 2080;
        string_ptr = xpc_string_get_string_ptr(v1);
        _os_log_debug_impl(&dword_19DD92000, v2, OS_LOG_TYPE_DEBUG, "Signing identifier cache hit for %s: %s", (uint8_t *)&v5, 0x16u);
      }
    }
    else
    {
      if (v3)
      {
        int v5 = 136315138;
        uint64_t v6 = out;
        _os_log_debug_impl(&dword_19DD92000, v2, OS_LOG_TYPE_DEBUG, "Signing identifier cache miss for %s", (uint8_t *)&v5, 0xCu);
      }
      return 0;
    }
  }
  return v1;
}

uint64_t ne_copy_cached_bundle_identifier_for_uuid(uint64_t a1)
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2000000000;
  uint64_t v17 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&g_uuid_cache_lock);
  g_ne_read_uuid_cache = 0;
  g_ne_uuid_cache_hit = 0;
  uint64_t v2 = ne_copy_uuid_cache_locked();
  if (v2)
  {
    BOOL v3 = v2;
    uint64_t v4 = MEMORY[0x19F3B5680]();
    uint64_t v5 = MEMORY[0x1E4F14D40];
    if (v4 == MEMORY[0x1E4F14D40])
    {
      xpc_object_t dictionary = xpc_dictionary_get_dictionary(v3, "uuid-mappings");
      if (!dictionary) {
        goto LABEL_17;
      }
      __int16 v7 = dictionary;
      if (MEMORY[0x19F3B5680]() != v5
        || (v13[0] = MEMORY[0x1E4F14BE8],
            v13[1] = 0x40000000,
            v13[2] = __ne_copy_cached_bundle_identifier_for_uuid_block_invoke,
            v13[3] = &unk_1E598C620,
            v13[4] = &v14,
            v13[5] = a1,
            xpc_dictionary_apply(v7, v13),
            !v15[3]))
      {
LABEL_17:
        if (MEMORY[0x19F3B5680](v3) == v5
          && (xpc_object_t v11 = xpc_dictionary_get_dictionary(v3, "synthesized-uuid-mappings")) != 0
          && (uint32_t v12 = v11, MEMORY[0x19F3B5680]() == v5))
        {
          uint64_t v19 = 0;
          uint64_t v20 = &v19;
          uint64_t v21 = 0x2000000000;
          uint64_t v22 = 0;
          applier[0] = MEMORY[0x1E4F14BE8];
          applier[1] = 0x40000000;
          applier[2] = __ne_copy_cached_bundle_identifier_for_synthesized_uuid_locked_block_invoke;
          applier[3] = &unk_1E598CB38;
          applier[4] = &v19;
          void applier[5] = a1;
          xpc_dictionary_apply(v12, applier);
          uint64_t v8 = v20[3];
          _Block_object_dispose(&v19, 8);
        }
        else
        {
          uint64_t v8 = 0;
        }
        v15[3] = v8;
      }
    }
    xpc_release(v3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&g_uuid_cache_lock);
  uint64_t v9 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v9;
}

void *ne_copy_uuid_cache_locked()
{
  uint64_t v57 = *MEMORY[0x1E4F14BF8];
  os_unfair_lock_assert_owner((const os_unfair_lock *)&g_uuid_cache_lock);
  g_ne_read_uuid_cache = 0;
  getpid();
  if (!sandbox_check())
  {
    getpid();
    if (!sandbox_check())
    {
      int v3 = ne_uuid_cache_changed_cache_change_token;
      if (ne_uuid_cache_changed_cache_change_token == -1)
      {
        uint32_t v4 = notify_register_check("com.apple.networkextension.uuidcache", &ne_uuid_cache_changed_cache_change_token);
        if (v4)
        {
          uint32_t v5 = v4;
          ne_uuid_cache_changed_cache_change_token = -1;
          if (ne_log_obj_g_init != -1) {
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          }
          uint64_t v6 = ne_log_obj_log_obj;
          if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "com.apple.networkextension.uuidcache";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v5;
            _os_log_error_impl(&dword_19DD92000, v6, OS_LOG_TYPE_ERROR, "Failed to register for %s notifications: %u", buf, 0x12u);
          }
        }
        int v3 = ne_uuid_cache_changed_cache_change_token;
      }
      uint64_t v7 = ne_uuid_cache_changed_cache_generation;
      *(void *)v53 = ne_uuid_cache_changed_cache_generation;
      if (v3 < 0) {
        goto LABEL_23;
      }
      int check = 0;
      uint32_t v8 = notify_check(v3, &check);
      if (v8)
      {
        uint32_t v9 = v8;
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        uint64_t v10 = ne_log_obj_log_obj;
        if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
          goto LABEL_21;
        }
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "com.apple.networkextension.uuidcache";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = ne_uuid_cache_changed_cache_change_token;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v9;
        uint64_t v20 = "Failed to check for changes to notification %s, token %d: %u";
LABEL_71:
        _os_log_error_impl(&dword_19DD92000, v10, OS_LOG_TYPE_ERROR, v20, buf, 0x18u);
LABEL_21:
        notify_cancel(ne_uuid_cache_changed_cache_change_token);
        uint64_t v7 = 0;
        ne_uuid_cache_changed_cache_change_token = -1;
        *(void *)v53 = 0;
        goto LABEL_22;
      }
      if (check)
      {
        uint32_t state = notify_get_state(ne_uuid_cache_changed_cache_change_token, (uint64_t *)v53);
        if (state)
        {
          uint32_t v19 = state;
          if (ne_log_obj_g_init != -1) {
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          }
          uint64_t v10 = ne_log_obj_log_obj;
          if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
            goto LABEL_21;
          }
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "com.apple.networkextension.uuidcache";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = ne_uuid_cache_changed_cache_change_token;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v19;
          uint64_t v20 = "Failed to get the state of notification %s, token %d: %u";
          goto LABEL_71;
        }
        uint64_t v7 = *(void *)v53;
      }
LABEL_22:
      if (v7 != ne_uuid_cache_changed_cache_generation)
      {
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        xpc_object_t v11 = ne_log_obj_log_obj;
        BOOL v12 = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG);
        uint64_t v13 = *(void *)v53;
        if (v12)
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = ne_uuid_cache_changed_cache_generation;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = *(void *)v53;
          _os_log_debug_impl(&dword_19DD92000, v11, OS_LOG_TYPE_DEBUG, "UUID cache generation changed from %llu to %llu", buf, 0x16u);
          uint64_t v13 = *(void *)v53;
        }
        ne_uuid_cache_changed_cache_generation = v13;
        g_ne_read_uuid_cache = 1;
        if (g_uuid_cache)
        {
          xpc_release((xpc_object_t)g_uuid_cache);
          g_uuid_cache = 0;
        }
        goto LABEL_31;
      }
LABEL_23:
      ne_uuid_cache_changed_cache_generation = v7;
      uint64_t v1 = (void *)g_uuid_cache;
      if (g_uuid_cache) {
        goto LABEL_69;
      }
      g_ne_read_uuid_cache = 1;
LABEL_31:
      int v14 = open("/Library/Preferences/com.apple.networkextension.uuidcache.plist", 0, "/Library/Preferences/com.apple.networkextension.uuidcache.plist");
      if (v14 < 0)
      {
        if (*__error() != 2 && *__error() != 1)
        {
          int v21 = *__error();
          if (strerror_r(v21, (char *)buf, 0x80uLL)) {
            buf[0] = 0;
          }
          if (ne_log_obj_g_init != -1) {
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          }
          uint64_t v22 = ne_log_obj_log_obj;
          if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v53 = 136315650;
            *(void *)&v53[4] = "/Library/Preferences/com.apple.networkextension.uuidcache.plist";
            *(_WORD *)&v53[12] = 1024;
            *(_DWORD *)&v53[14] = v21;
            *(_WORD *)&v53[18] = 2080;
            *(void *)&v53[20] = buf;
            _os_log_fault_impl(&dword_19DD92000, v22, OS_LOG_TYPE_FAULT, "Failed to open %s: [%d] %s", v53, 0x1Cu);
          }
        }
LABEL_68:
        uint64_t v1 = (void *)g_uuid_cache;
        if (!g_uuid_cache) {
          return v1;
        }
LABEL_69:
        xpc_retain(v1);
        return v1;
      }
      int v15 = v14;
      memset(&v47, 0, sizeof(v47));
      if (fstat(v14, &v47))
      {
        int v16 = *__error();
        if (strerror_r(v16, (char *)buf, 0x80uLL)) {
          buf[0] = 0;
        }
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        uint64_t v17 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v53 = 136315650;
          *(void *)&v53[4] = "/Library/Preferences/com.apple.networkextension.uuidcache.plist";
          *(_WORD *)&v53[12] = 1024;
          *(_DWORD *)&v53[14] = v16;
          *(_WORD *)&v53[18] = 2080;
          *(void *)&v53[20] = buf;
          _os_log_fault_impl(&dword_19DD92000, v17, OS_LOG_TYPE_FAULT, "Failed to fstat %s: [%d] %s", v53, 0x1Cu);
        }
        goto LABEL_67;
      }
      off_t st_size = v47.st_size;
      if ((unint64_t)(v47.st_size - 131073) <= 0xFFFFFFFFFFFDFFFFLL)
      {
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        uint64_t v24 = ne_log_obj_log_obj;
        if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
          goto LABEL_67;
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "/Library/Preferences/com.apple.networkextension.uuidcache.plist";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = st_size;
        uint64_t v25 = "%s size is 0 or is too big: %lu";
        uint64_t v26 = v24;
        uint32_t v27 = 22;
        goto LABEL_89;
      }
      long long v28 = malloc_type_malloc(v47.st_size, 0x100004077774924uLL);
      if (!v28)
      {
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        uint64_t v33 = ne_log_obj_log_obj;
        if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
          goto LABEL_67;
        }
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = st_size;
        uint64_t v25 = "Failed to allocate %lu bytes";
        uint64_t v26 = v33;
        uint32_t v27 = 12;
LABEL_89:
        _os_log_error_impl(&dword_19DD92000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
LABEL_67:
        close(v15);
        goto LABEL_68;
      }
      xpc_object_t v29 = v28;
      ssize_t v30 = pread(v15, v28, st_size, 0);
      if (v30 != st_size)
      {
        ssize_t v34 = v30;
        int v35 = *__error();
        if (strerror_r(v35, (char *)buf, 0x80uLL)) {
          buf[0] = 0;
        }
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        long long v36 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v53 = 136316162;
          *(void *)&v53[4] = "/Library/Preferences/com.apple.networkextension.uuidcache.plist";
          *(_WORD *)&v53[12] = 2048;
          *(void *)&v53[14] = v34;
          *(_WORD *)&v53[22] = 2048;
          *(void *)&v53[24] = st_size;
          *(_WORD *)&v53[32] = 1024;
          *(_DWORD *)&v53[34] = v35;
          __int16 v54 = 2080;
          v55 = buf;
          _os_log_fault_impl(&dword_19DD92000, v36, OS_LOG_TYPE_FAULT, "Failed to read entire contents of %s, %ld != %lu: [%d] %s", v53, 0x30u);
        }
        goto LABEL_78;
      }
      uint64_t v31 = xpc_create_from_plist();
      if (!v31)
      {
LABEL_78:
        close(v15);
        free(v29);
        goto LABEL_68;
      }
      uint64_t v32 = (void *)v31;
      if (MEMORY[0x19F3B5680]() != MEMORY[0x1E4F14D40])
      {
LABEL_62:
        xpc_release(v32);
        goto LABEL_78;
      }
      if (ne_copy_uuid_cache_locked_once_token != -1) {
        dispatch_once(&ne_copy_uuid_cache_locked_once_token, &__block_literal_global_157);
      }
      string = xpc_dictionary_get_string(v32, "os-version");
      if (string)
      {
        if (ne_copy_uuid_cache_locked_g_my_os_version)
        {
          long long v38 = string;
          if (strcmp(string, (const char *)ne_copy_uuid_cache_locked_g_my_os_version))
          {
            if (ne_log_obj_g_init != -1) {
              dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
            }
            uint64_t v39 = ne_log_obj_log_obj;
            if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
            {
LABEL_103:
              if (g_uuid_cache) {
                goto LABEL_78;
              }
              goto LABEL_62;
            }
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = ne_copy_uuid_cache_locked_g_my_os_version;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = v38;
            long long v40 = "Not using the UUID cache because the current OS version (%s) does not equal the cache OS version (%s)";
            p_int check = buf;
            v42 = v39;
LABEL_102:
            _os_log_impl(&dword_19DD92000, v42, OS_LOG_TYPE_DEFAULT, v40, p_check, 0x16u);
            goto LABEL_103;
          }
        }
        else
        {
          if (ne_log_obj_g_init != -1) {
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          }
          v43 = ne_log_obj_log_obj;
          if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_19DD92000, v43, OS_LOG_TYPE_ERROR, "Failed to get the current OS version", buf, 2u);
          }
        }
      }
      memset(dst, 0, sizeof(dst));
      size_t length = 0;
      data = (const unsigned __int8 *)xpc_dictionary_get_data(v32, "boot-uuid", &length);
      if (length != 16
        || (uuid_copy(dst, data), uuid_is_null(ne_copy_uuid_cache_locked_g_my_boot_session_uuid))
        || !uuid_compare(dst, ne_copy_uuid_cache_locked_g_my_boot_session_uuid))
      {
        g_uuid_cache = (uint64_t)v32;
        goto LABEL_78;
      }
      memset(buf, 0, 37);
      memset(v53, 0, 37);
      uuid_unparse(ne_copy_uuid_cache_locked_g_my_boot_session_uuid, (char *)buf);
      uuid_unparse(dst, v53);
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint64_t v45 = ne_log_obj_log_obj;
      if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_103;
      }
      int check = 136315394;
      v49 = buf;
      __int16 v50 = 2080;
      v51 = v53;
      long long v40 = "Not using the UUID cache because the current boot session UUID (%s) does not equal the cache boot session UUID (%s)";
      p_int check = (uint8_t *)&check;
      v42 = v45;
      goto LABEL_102;
    }
  }
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  int v0 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19DD92000, v0, OS_LOG_TYPE_DEFAULT, "UUID cache sandbox check failed", buf, 2u);
  }
  return 0;
}

xpc_object_t NEHelperGetAppTrackerDomains(const char *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F14BF8];
  if (!a1) {
    return 0;
  }
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "delegate-class-id", 0xDuLL);
  xpc_dictionary_set_uint64(v2, "app-tracker-check", 1uLL);
  xpc_dictionary_set_string(v2, "app-tracker-signing-identifier", a1);
  xpc_object_t v3 = NEHelperCopyResponse(v2);
  if (!v3)
  {
    xpc_release(v2);
    return 0;
  }
  uint32_t v4 = v3;
  uint64_t v5 = MEMORY[0x19F3B5680]();
  uint64_t v6 = MEMORY[0x1E4F14D40];
  if (v5 == MEMORY[0x1E4F14D40] && !xpc_dictionary_get_int64(v4, "result-code"))
  {
    xpc_object_t value = xpc_dictionary_get_value(v4, "result-data");
    xpc_object_t v7 = value;
    if (!value) {
      goto LABEL_6;
    }
    if (MEMORY[0x19F3B5680](value) == v6)
    {
      xpc_object_t v10 = xpc_dictionary_get_value(v7, "app-tracker-domains");
      if (v10)
      {
        xpc_object_t v11 = v10;
        if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D18])
        {
          xpc_object_t v7 = xpc_copy(v11);
          if (ne_log_obj_g_init != -1) {
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          }
          uint64_t v13 = ne_log_obj_log_obj;
          if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
          {
            int v14 = 134217984;
            size_t count = xpc_array_get_count(v7);
            _os_log_debug_impl(&dword_19DD92000, v13, OS_LOG_TYPE_DEBUG, "NEHelperGetAppTrackerDomains(): number of elements in return_array: (%zu)", (uint8_t *)&v14, 0xCu);
          }
          goto LABEL_6;
        }
      }
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      BOOL v12 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v14) = 0;
        _os_log_debug_impl(&dword_19DD92000, v12, OS_LOG_TYPE_DEBUG, "NEHelperGetAppTrackerDomains(): return_array is empty", (uint8_t *)&v14, 2u);
      }
    }
  }
  xpc_object_t v7 = 0;
LABEL_6:
  xpc_release(v2);
  xpc_release(v4);
  return v7;
}

xpc_object_t NEHelperCopyResponse(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F14BF8];
  if (!a1 || (uint64_t v2 = MEMORY[0x19F3B5680](), v3 = MEMORY[0x1E4F14D40], v2 != MEMORY[0x1E4F14D40]))
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint32_t v4 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    LOWORD(v13) = 0;
    uint32_t v8 = "request is not a valid XPC dictionary";
LABEL_22:
    _os_log_error_impl(&dword_19DD92000, v4, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v13, 2u);
    return 0;
  }
  uint64_t int64 = xpc_dictionary_get_uint64(a1, "delegate-class-id");
  if (uint64 >= 0xF)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint32_t v4 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    LOWORD(v13) = 0;
    uint32_t v8 = "request has an invalid delegate class ID";
    goto LABEL_22;
  }
  uint32_t v9 = nehelper_copy_connection_for_delegate_class(uint64);
  if (!v9)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint32_t v4 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    LOWORD(v13) = 0;
    uint32_t v8 = "nehelper_copy_connection_for_delegate_class() returned NULL";
    goto LABEL_22;
  }
  xpc_object_t v10 = v9;
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(v9, a1);
  xpc_release(v10);
  if (!v5)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint32_t v4 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    LOWORD(v13) = 0;
    uint32_t v8 = "nehelper sent NULL response";
    goto LABEL_22;
  }
  if (MEMORY[0x19F3B5680](v5) != v3)
  {
    xpc_object_t v11 = (void *)MEMORY[0x19F3B54A0](v5);
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    BOOL v12 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      int v14 = v11;
      _os_log_error_impl(&dword_19DD92000, v12, OS_LOG_TYPE_ERROR, "nehelper sent invalid response: %s", (uint8_t *)&v13, 0xCu);
    }
    free(v11);
  }
  return v5;
}

_xpc_connection_s *nehelper_copy_connection_for_delegate_class(unint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F14BF8];
  if (globals_init_sess_init != -1) {
    dispatch_once(&globals_init_sess_init, &__block_literal_global_175);
  }
  if (a1 < 0xF)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&nehelper_copy_connection_for_delegate_class_g_connection_cache_lock);
    uint64_t v3 = (_xpc_connection_s *)nehelper_copy_connection_for_delegate_class_g_connection_cache[a1];
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint32_t v4 = ne_log_obj_log_obj;
    BOOL v5 = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v5)
      {
        *(_DWORD *)buf = 134217984;
        xpc_object_t v11 = (const char *)a1;
        _os_log_debug_impl(&dword_19DD92000, v4, OS_LOG_TYPE_DEBUG, "Re-using existing nehelper connection for delegate class %llu", buf, 0xCu);
      }
    }
    else
    {
      if (v5)
      {
        *(_DWORD *)buf = 134217984;
        xpc_object_t v11 = (const char *)a1;
        _os_log_debug_impl(&dword_19DD92000, v4, OS_LOG_TYPE_DEBUG, "Creating a new nehelper connection for delegate class %llu", buf, 0xCu);
      }
      mach_service = xpc_connection_create_mach_service("com.apple.nehelper", (dispatch_queue_t)g_queue, 2uLL);
      if (!mach_service)
      {
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        uint32_t v8 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          xpc_object_t v11 = "com.apple.nehelper";
          __int16 v12 = 2048;
          unint64_t v13 = a1;
          _os_log_error_impl(&dword_19DD92000, v8, OS_LOG_TYPE_ERROR, "xpc_connection_create_mach_service(%s, XPC_CONNECTION_MACH_SERVICE_PRIVILEGED) failed for delegate class %llu", buf, 0x16u);
        }
        uint64_t v3 = 0;
        goto LABEL_19;
      }
      uint64_t v3 = mach_service;
      v9[0] = MEMORY[0x1E4F14BE8];
      v9[1] = 0x40000000;
      v9[2] = __nehelper_copy_connection_for_delegate_class_block_invoke;
      v9[3] = &__block_descriptor_tmp_72;
      v9[4] = a1;
      v9[5] = mach_service;
      xpc_connection_set_event_handler(mach_service, v9);
      xpc_connection_resume(v3);
      nehelper_copy_connection_for_delegate_class_g_connection_cache[a1] = v3;
    }
    xpc_retain(v3);
LABEL_19:
    os_unfair_lock_unlock((os_unfair_lock_t)&nehelper_copy_connection_for_delegate_class_g_connection_cache_lock);
    return v3;
  }
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  uint64_t v2 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    xpc_object_t v11 = (const char *)a1;
    _os_log_error_impl(&dword_19DD92000, v2, OS_LOG_TYPE_ERROR, "Invalid delegate class id: %llu", buf, 0xCu);
  }
  return 0;
}

uint64_t __ne_copy_cached_bundle_identifier_for_synthesized_uuid_locked_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  _OWORD buffer[2] = *MEMORY[0x1E4F14BF8];
  if (!a3) {
    return 1;
  }
  if (MEMORY[0x19F3B5680](a3) != MEMORY[0x1E4F14D30]) {
    return 1;
  }
  buffer[0] = 0;
  buffer[1] = 0;
  size_t bytes = xpc_data_get_bytes(a3, buffer, 0, 0x10uLL);
  if (bytes != xpc_data_get_length(a3)
    || uuid_compare((const unsigned __int8 *)buffer, *(const unsigned __int8 **)(a1 + 40)))
  {
    return 1;
  }
  xpc_object_t v8 = xpc_string_create(a2);
  uint64_t result = 0;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
  return result;
}

uint64_t __ne_copy_cached_bundle_identifier_for_uuid_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  if (a3)
  {
    if (MEMORY[0x19F3B5680](a3) == MEMORY[0x1E4F14D18])
    {
      applier[0] = MEMORY[0x1E4F14BE8];
      applier[1] = 0x40000000;
      applier[2] = __ne_copy_cached_bundle_identifier_for_uuid_block_invoke_2;
      applier[3] = &__block_descriptor_tmp_163;
      applier[4] = *(void *)(a1 + 40);
      if (!xpc_array_apply(a3, applier))
      {
        uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
        if (!v6)
        {
LABEL_7:
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_string_create(a2);
          return 1;
        }
        size_t length = xpc_string_get_length(v6);
        if (strlen(a2) < length)
        {
          xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
          goto LABEL_7;
        }
      }
    }
  }
  return 1;
}

BOOL __ne_copy_cached_bundle_identifier_for_uuid_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  _OWORD buffer[2] = *MEMORY[0x1E4F14BF8];
  if (a3
    && MEMORY[0x19F3B5680](a3) == MEMORY[0x1E4F14D30]
    && (buffer[0] = 0,
        buffer[1] = 0,
        size_t bytes = xpc_data_get_bytes(a3, buffer, 0, 0x10uLL),
        bytes == xpc_data_get_length(a3)))
  {
    return uuid_compare((const unsigned __int8 *)buffer, *(const unsigned __int8 **)(a1 + 32)) != 0;
  }
  else
  {
    return 1;
  }
}

xpc_object_t NEHelperCacheCopyAppUUIDMappingExtended(const char *a1, const char *a2, int a3)
{
  return NEHelperCacheCopyAppUUIDMappingForUIDExtended(0, a1, a2, a3);
}

uint64_t ne_trie_search(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6, int a7, uint64_t a8, _DWORD *a9, uint64_t (*a10)(void))
{
  LOWORD(v10) = -1;
  if (!a3) {
    return (unsigned __int16)v10;
  }
  if (!a2) {
    return (unsigned __int16)v10;
  }
  __int16 v12 = (void *)a1;
  if (!*(void *)(a1 + 40)) {
    return (unsigned __int16)v10;
  }
  unint64_t v13 = a9;
  int v10 = *(unsigned __int16 *)(a1 + 60);
  if (a6) {
    uint64_t v14 = (a3 - 1);
  }
  else {
    uint64_t v14 = 0;
  }
  __int16 v44 = a3;
  if (v10 == 0xFFFF)
  {
LABEL_57:
    if (v13)
    {
      if (a6)
      {
        if ((v14 & 0x8000) == 0)
        {
          while ((*(char *)(a2 + (unsigned __int16)v14) & 0x80000000) == 0)
          {
            int v41 = (__int16)v14;
            LOWORD(v14) = v14 - 1;
            if (v41 < 1) {
              goto LABEL_70;
            }
          }
LABEL_67:
          *unint64_t v13 = 1;
        }
      }
      else if (v44 > (__int16)v14)
      {
        while ((*(char *)(a2 + (__int16)v14) & 0x80000000) == 0)
        {
          LOWORD(v14) = v14 + 1;
          LOWORD(v10) = -1;
          if (v44 <= (__int16)v14) {
            return (unsigned __int16)v10;
          }
        }
        goto LABEL_67;
      }
    }
LABEL_70:
    LOWORD(v10) = -1;
    return (unsigned __int16)v10;
  }
  signed int v16 = (__int16)a3;
  uint64_t v17 = *(void *)(a1 + 16);
  uint64_t v46 = (__int16)a3;
  unsigned __int16 v18 = -1;
  int v50 = a7;
  int v47 = (__int16)a3;
  do
  {
    unsigned int v19 = (unsigned __int16)v10;
    uint64_t v20 = (unsigned __int16 *)(v17 + 10 * (unsigned __int16)v10);
    unint64_t v21 = *v20;
    int v22 = (__int16)v20[1];
    unsigned __int16 v23 = (v22 & 0x7FFF) + v21;
    if (!a6)
    {
      if (v21 >= (unsigned __int16)((v22 & 0x7FFF) + v21))
      {
LABEL_26:
        uint64_t v24 = v14;
      }
      else
      {
        uint64_t v24 = v14 + (v22 & 0x7FFF);
        uint64_t v26 = (__int16)v14;
        if ((__int16)v14 <= v16) {
          uint64_t v27 = v16;
        }
        else {
          uint64_t v27 = (__int16)v14;
        }
        uint64_t v28 = v46;
        if ((__int16)v14 > v46) {
          uint64_t v28 = (__int16)v14;
        }
        while (1)
        {
          if (v28 == v26)
          {
            uint64_t v24 = v27;
            goto LABEL_27;
          }
          if (*(unsigned __int8 *)(a2 + v26) != *(unsigned __int8 *)(v12[4] + v21)) {
            break;
          }
          ++v21;
          ++v26;
          if (v23 == v21)
          {
            LOWORD(v21) = v23;
            goto LABEL_27;
          }
        }
        uint64_t v24 = v26;
      }
LABEL_27:
      int v29 = (__int16)v24;
      uint64_t v14 = v24;
      if ((v24 & 0x8000) != 0) {
        goto LABEL_32;
      }
      goto LABEL_30;
    }
    if (v21 >= (unsigned __int16)((v22 & 0x7FFF) + v21) || (v14 & 0x8000) != 0) {
      goto LABEL_26;
    }
    while (*(unsigned __int8 *)(a2 + (unsigned __int16)v14) == *(unsigned __int8 *)(v12[4] + v21))
    {
      ++v21;
      uint64_t v24 = (v14 - 1);
      if (v21 < v23)
      {
        int v25 = (__int16)v14;
        uint64_t v14 = (v14 - 1);
        if (v25 > 0) {
          continue;
        }
      }
      goto LABEL_27;
    }
    int v29 = (unsigned __int16)v14;
LABEL_30:
    if (v16 > v29 && *(char *)(a2 + (unsigned __int16)v14) < 0)
    {
      if (a9) {
        *a9 = 1;
      }
      goto LABEL_70;
    }
LABEL_32:
    if ((unsigned __int16)v21 != v23) {
      break;
    }
    if (a6 && (v14 & 0x8000) != 0)
    {
      BOOL v30 = 0;
      BOOL v31 = 1;
    }
    else
    {
      BOOL v30 = 0;
      BOOL v31 = v16 == v29;
      if (a7 && v16 != v29)
      {
        BOOL v31 = 0;
        BOOL v30 = *(unsigned __int8 *)(a2 + (__int16)v14) == a8;
      }
    }
    if (v22 < 0)
    {
      uint64_t v32 = v12[4];
      uint64_t v33 = v17 + 10 * (unsigned __int16)v10;
      uint64_t v34 = v32 + *(unsigned __int16 *)(v33 + 6);
      uint64_t v35 = *(unsigned __int16 *)(v33 + 8);
      if (!a10) {
        goto LABEL_42;
      }
      uint64_t v36 = a8;
      uint64_t v37 = a6;
      uint64_t v49 = *(unsigned __int16 *)(v33 + 8);
      long long v38 = a10;
      uint64_t v39 = v32 + *(unsigned __int16 *)(v33 + 6);
      int v40 = a10(v39);
      uint64_t v34 = v39;
      a10 = v38;
      unsigned int v19 = (unsigned __int16)v10;
      uint64_t v35 = v49;
      a6 = v37;
      signed int v16 = v47;
      __int16 v12 = (void *)a1;
      a8 = v36;
      if (v40)
      {
LABEL_42:
        if (v31)
        {
          if (a4 && a5)
          {
            *a4 = v34;
            *a5 = v35;
          }
          return (unsigned __int16)v10;
        }
        if (v30) {
          unsigned __int16 v18 = v10;
        }
      }
      a7 = v50;
    }
    uint64_t v17 = v12[2];
    if (*(unsigned __int16 *)(v17 + 10 * v19 + 4) == 0xFFFFLL) {
      break;
    }
    if (*(char *)(a2 + (__int16)v14) < 32) {
      break;
    }
    int v10 = *(unsigned __int16 *)(v12[3]
                              + 192 * *(unsigned __int16 *)(v17 + 10 * v19 + 4)
                              + 2 * (*(unsigned __int8 *)(a2 + (__int16)v14) - 32));
  }
  while (v10 != 0xFFFF);
  unint64_t v13 = a9;
  if (v18 == 0xFFFF) {
    goto LABEL_57;
  }
  if (a4 && a5)
  {
    *a4 = v12[4] + *(unsigned __int16 *)(v17 + 10 * v18 + 6);
    *a5 = *(unsigned __int16 *)(v12[2] + 10 * v18 + 8);
  }
  LOWORD(v10) = v18;
  return (unsigned __int16)v10;
}

os_log_t __ne_tracker_should_save_stacktrace_block_invoke()
{
  os_log_t result = os_log_create("com.apple.neappprivacy", "DynamicTracing");
  ne_tracker_should_save_stacktrace_dynamic_tracing_handle = (uint64_t)result;
  return result;
}

os_log_t __ne_log_obj_block_invoke()
{
  os_log_t result = os_log_create("com.apple.networkextension", "");
  ne_log_obj_log_obj = (uint64_t)result;
  return result;
}

unsigned __int16 *ne_tracker_context_is_from_app_list(unsigned __int16 *result)
{
  if (result) {
    return (unsigned __int16 *)((*result >> 1) & 1);
  }
  return result;
}

void ne_force_reset_uuid_cache()
{
  os_unfair_lock_lock((os_unfair_lock_t)&g_uuid_cache_lock);
  if (g_uuid_cache)
  {
    xpc_release((xpc_object_t)g_uuid_cache);
    g_uuid_cache = 0;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&g_uuid_cache_lock);
}

BOOL nelog_is_debug_logging_enabled()
{
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  int v0 = ne_log_obj_log_obj;

  return os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG);
}

BOOL ne_session_manager_is_running()
{
  return get_current_notify_pid() != 0;
}

uint64_t get_current_notify_pid()
{
  if (get_current_notify_pid_sm_token < 0)
  {
    if (globals_init_sess_init != -1) {
      dispatch_once(&globals_init_sess_init, &__block_literal_global_175);
    }
    if (!notify_register_dispatch("com.apple.nesessionmanager", &get_current_notify_pid_sm_token, (dispatch_queue_t)g_queue, &__block_literal_global_170)&& notify_get_state(get_current_notify_pid_sm_token, (uint64_t *)&get_current_notify_pid_current_pid))
    {
      get_current_notify_pid_current_pid = 0;
    }
  }
  return get_current_notify_pid_current_pid;
}

void __get_current_notify_pid_block_invoke(int a1, int token)
{
  get_current_notify_pid_sm_token = token;
  if (notify_get_state(token, (uint64_t *)&get_current_notify_pid_current_pid))
  {
    get_current_notify_pid_current_pid = 0;
  }
  else if (get_current_notify_pid_current_pid)
  {
    update_all_session_clients();
  }
}

void update_all_session_clients()
{
  for (uint64_t i = g_sessions; i; uint64_t i = *(void *)(i + 48))
    fetch_status(i, 0, 0, 0);
}

void fetch_status(uint64_t a1, uint64_t a2, NSObject *a3, void *a4)
{
  uint64_t connection = get_connection(a1);
  if (connection)
  {
    uint32_t v9 = (_xpc_connection_s *)connection;
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    int v11 = *(_DWORD *)(a1 + 32);
    xpc_dictionary_set_int64(v10, "SessionCommandType", 1);
    if (a4) {
      a4 = _Block_copy(a4);
    }
    if (a3) {
      dispatch_retain(a3);
    }
    handler[0] = MEMORY[0x1E4F14BE8];
    handler[1] = 0x40000000;
    handler[2] = __fetch_status_block_invoke_2;
    handler[3] = &unk_1E598C700;
    int v13 = v11;
    handler[4] = a4;
    handler[5] = a1;
    handler[6] = a2;
    handler[7] = a3;
    xpc_connection_send_message_with_reply(v9, v10, (dispatch_queue_t)g_queue, handler);
    xpc_release(v10);
  }
  else if (a3 && a4)
  {
    block[0] = MEMORY[0x1E4F14BE8];
    block[1] = 0x40000000;
    block[2] = __fetch_status_block_invoke;
    block[3] = &unk_1E598C6B0;
    block[4] = a4;
    int v15 = 0;
    dispatch_async(a3, block);
  }
}

uint64_t get_connection(uint64_t a1)
{
  uint64_t result = 0;
  uint64_t v11 = *MEMORY[0x1E4F14BF8];
  if (a1)
  {
    uint64_t v3 = g_sessions;
    if (g_sessions)
    {
      while (v3 != a1)
      {
        uint64_t v3 = *(void *)(v3 + 48);
        if (!v3) {
          return 0;
        }
      }
      if (*(unsigned char *)(a1 + 64)) {
        return 0;
      }
      uint64_t result = *(void *)(a1 + 40);
      if (!result)
      {
        xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
        getpid();
        BOOL v5 = "com.apple.nesessionmanager";
        if (sandbox_check())
        {
          if (ne_log_obj_g_init != -1) {
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          }
          uint64_t v6 = ne_log_obj_log_obj;
          BOOL v5 = "com.apple.nesessionmanager.flow-divert-token";
          if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            xpc_object_t v10 = "com.apple.nesessionmanager.flow-divert-token";
            _os_log_impl(&dword_19DD92000, v6, OS_LOG_TYPE_INFO, "Falling back to %s", buf, 0xCu);
          }
        }
        mach_service = xpc_connection_create_mach_service(v5, (dispatch_queue_t)g_queue, 2uLL);
        *(void *)(a1 + 40) = mach_service;
        handler[0] = MEMORY[0x1E4F14BE8];
        handler[1] = 0x40000000;
        handler[2] = __get_connection_block_invoke;
        handler[3] = &__block_descriptor_tmp_183;
        handler[4] = a1;
        xpc_connection_set_event_handler(mach_service, handler);
        xpc_connection_resume(*(xpc_connection_t *)(a1 + 40));
        xpc_dictionary_set_int64(v4, "SessionClientType", 1);
        xpc_dictionary_set_uuid(v4, "SessionIdentifier", (const unsigned __int8 *)a1);
        xpc_dictionary_set_int64(v4, "SessionConfigType", *(int *)(a1 + 16));
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), v4);
        xpc_release(v4);
        return *(void *)(a1 + 40);
      }
    }
  }
  return result;
}

uint64_t __fetch_status_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void __fetch_status_block_invoke_2(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x19F3B5680](a2) == MEMORY[0x1E4F14D40])
  {
    int64_t int64 = xpc_dictionary_get_int64(a2, "SessionStatus");
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      uint64_t v8 = g_sessions;
      if (g_sessions)
      {
        while (v8 != v7)
        {
          uint64_t v8 = *(void *)(v8 + 48);
          if (!v8) {
            goto LABEL_4;
          }
        }
        if (!*(unsigned char *)(v7 + 64) && int64 != *(_DWORD *)(a1 + 64)) {
          set_status(v7, *(void *)(a1 + 48), int64);
        }
      }
    }
  }
  else
  {
    int64_t int64 = 1;
  }
LABEL_4:
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = *(NSObject **)(a1 + 56);
    if (v6)
    {
      block[0] = MEMORY[0x1E4F14BE8];
      block[1] = 0x40000000;
      block[2] = __fetch_status_block_invoke_3;
      block[3] = &unk_1E598C6D8;
      block[4] = v5;
      void block[5] = int64;
      block[6] = v6;
      dispatch_async(v6, block);
    }
  }
}

void set_status(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a1 + 32) != a3)
  {
    *(_DWORD *)(a1 + 32) = a3;
    for (uint64_t i = *(void *)(a1 + 24); i; uint64_t i = *(void *)(i + 8))
    {
      if (i != a2) {
        notify_client(i, 1);
      }
    }
  }
}

void __fetch_status_block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  uint64_t v2 = *(NSObject **)(a1 + 48);

  dispatch_release(v2);
}

void notify_client(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 24))
  {
    uint64_t v3 = *(NSObject **)(a1 + 32);
    if (v3)
    {
      atomic_fetch_add_explicit((atomic_uint *volatile)(a1 + 40), 1u, memory_order_relaxed);
      block[0] = MEMORY[0x1E4F14BE8];
      block[1] = 0x40000000;
      block[2] = __notify_client_block_invoke;
      block[3] = &__block_descriptor_tmp_188;
      int v5 = a2;
      block[4] = a1;
      void block[5] = 0;
      dispatch_async(v3, block);
    }
  }
}

void __notify_client_block_invoke(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3002000000;
  uint64_t v8 = __Block_byref_object_copy_;
  uint32_t v9 = __Block_byref_object_dispose_;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F14BE8];
  v4[1] = 0x40000000;
  v4[2] = __notify_client_block_invoke_186;
  v4[3] = &unk_1E598C748;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = &v5;
  v4[5] = v2;
  dispatch_sync((dispatch_queue_t)g_queue, v4);
  uint64_t v3 = v6[5];
  if (v3)
  {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
    _Block_release((const void *)v6[5]);
  }
  ne_session_release(*(void *)(a1 + 32));
  _Block_object_dispose(&v5, 8);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void *__notify_client_block_invoke_186(uint64_t a1)
{
  uint64_t result = *(void **)(*(void *)(a1 + 40) + 24);
  if (result)
  {
    uint64_t result = _Block_copy(result);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  }
  return result;
}

void ne_session_release(uint64_t a1)
{
  if (atomic_fetch_add_explicit((atomic_uint *volatile)(a1 + 40), 0xFFFFFFFF, memory_order_relaxed) == 1)
  {
    block[0] = MEMORY[0x1E4F14BE8];
    block[1] = 0x40000000;
    block[2] = __ne_session_release_block_invoke;
    block[3] = &__block_descriptor_tmp_8;
    block[4] = a1;
    dispatch_sync((dispatch_queue_t)g_queue, block);
  }
}

void __ne_session_release_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 8);
  if (v2) {
    *(void *)(v2 + 16) = *(void *)(v1 + 16);
  }
  **(void **)(v1 + 16) = v2;
  uint64_t v3 = *(void **)v1;
  if (!*(void *)(*(void *)v1 + 24))
  {
    *((unsigned char *)v3 + 64) = 1;
    xpc_object_t v4 = (_xpc_connection_s *)*((void *)v3 + 5);
    if (v4)
    {
      xpc_connection_cancel(v4);
    }
    else
    {
      uint64_t v5 = *((void *)v3 + 6);
      if (v5) {
        *(void *)(v5 + 56) = *((void *)v3 + 7);
      }
      **((void **)v3 + 7) = v5;
      free(*(void **)v1);
      *(void *)uint64_t v1 = 0;
    }
  }
  ne_session_clear_event_handler(v1, 0);

  free((void *)v1);
}

void ne_session_clear_event_handler(uint64_t a1, char a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v3 = *(NSObject **)(a1 + 32);
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  if (v3)
  {
    if (v4)
    {
      block[0] = MEMORY[0x1E4F14BE8];
      block[1] = 0x40000000;
      block[2] = __ne_session_clear_event_handler_block_invoke;
      block[3] = &unk_1E598C688;
      char v6 = a2;
      block[4] = v4;
      void block[5] = v3;
      dispatch_async(v3, block);
    }
    else
    {
      dispatch_release(v3);
    }
  }
}

void __ne_session_clear_event_handler_block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  _Block_release(*(const void **)(a1 + 32));
  uint64_t v2 = *(NSObject **)(a1 + 40);

  dispatch_release(v2);
}

void __get_connection_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = g_sessions;
  if (v2) {
    BOOL v4 = g_sessions == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    while (v3 != v2)
    {
      uint64_t v3 = *(void *)(v3 + 48);
      if (!v3) {
        return;
      }
    }
    if (a2)
    {
      if (MEMORY[0x19F3B5680](a2) == MEMORY[0x1E4F14D58])
      {
        uint64_t v7 = *(void *)(a1 + 32);
        if (*(void *)(v7 + 40))
        {
          xpc_connection_cancel(*(xpc_connection_t *)(v7 + 40));
          xpc_release(*(xpc_object_t *)(*(void *)(a1 + 32) + 40));
          *(void *)(*(void *)(a1 + 32) + 40) = 0;
          uint64_t v7 = *(void *)(a1 + 32);
        }
        if (*(void *)(v7 + 24))
        {
          set_status(v7, 0, 1);
        }
        else
        {
          uint64_t v10 = *(void *)(v7 + 48);
          if (v10)
          {
            *(void *)(v10 + 56) = *(void *)(v7 + 56);
            uint64_t v7 = *(void *)(a1 + 32);
            uint64_t v10 = *(void *)(v7 + 48);
          }
          **(void **)(v7 + 56) = v10;
          uint64_t v11 = *(void **)(a1 + 32);
          free(v11);
        }
      }
      else if (MEMORY[0x19F3B5680](a2) == MEMORY[0x1E4F14D40])
      {
        int64_t int64 = xpc_dictionary_get_int64(a2, "SessionNotificationType");
        switch(int64)
        {
          case 3:
            for (uint64_t i = *(void *)(*(void *)(a1 + 32) + 24); i; uint64_t i = *(void *)(i + 8))
              notify_client(i, 3);
            break;
          case 2:
            for (uint64_t j = *(void *)(*(void *)(a1 + 32) + 24); j; uint64_t j = *(void *)(j + 8))
              notify_client(j, 1);
            break;
          case 1:
            uint64_t v9 = *(void *)(a1 + 32);
            fetch_status(v9, 0, 0, 0);
            break;
        }
      }
    }
  }
}

uint64_t ne_session_manager_get_pid()
{
  return get_current_notify_pid();
}

uint64_t ne_session_manager_has_active_sessions()
{
  int check = 0;
  int v0 = ne_session_manager_get_info_current_info_token;
  if (ne_session_manager_get_info_current_info_token < 0)
  {
    if (notify_register_check("com.apple.nesessionmanager.info", &ne_session_manager_get_info_current_info_token))
    {
      ne_session_manager_get_info_current_info_token = -1;
      return ne_session_manager_get_info_current_info & 1;
    }
    int v0 = ne_session_manager_get_info_current_info_token;
    if (ne_session_manager_get_info_current_info_token < 0) {
      return ne_session_manager_get_info_current_info & 1;
    }
  }
  if (notify_check(v0, &check)
    || check
    && notify_get_state(ne_session_manager_get_info_current_info_token, (uint64_t *)&ne_session_manager_get_info_current_info))
  {
    notify_cancel(ne_session_manager_get_info_current_info_token);
    ne_session_manager_get_info_current_info_token = -1;
    ne_session_manager_get_info_current_info = 0;
  }
  return ne_session_manager_get_info_current_info & 1;
}

BOOL ne_session_should_disable_nexus()
{
  int check = 0;
  int v0 = ne_session_should_disable_nexus_disable_nexus_token;
  if (ne_session_should_disable_nexus_disable_nexus_token < 0)
  {
    if (notify_register_check("com.apple.networkextension.disable-nexus", &ne_session_should_disable_nexus_disable_nexus_token))
    {
      ne_session_should_disable_nexus_disable_nexus_token = -1;
      return ne_session_should_disable_nexus_current_state != 0;
    }
    int v0 = ne_session_should_disable_nexus_disable_nexus_token;
    if (ne_session_should_disable_nexus_disable_nexus_token < 0) {
      return ne_session_should_disable_nexus_current_state != 0;
    }
  }
  if (notify_check(v0, &check)
    || check
    && notify_get_state(ne_session_should_disable_nexus_disable_nexus_token, (uint64_t *)&ne_session_should_disable_nexus_current_state))
  {
    notify_cancel(ne_session_should_disable_nexus_disable_nexus_token);
    ne_session_should_disable_nexus_disable_nexus_token = -1;
    ne_session_should_disable_nexus_current_uint32_t state = 0;
  }
  return ne_session_should_disable_nexus_current_state != 0;
}

BOOL ne_session_disable_restrictions()
{
  int check = 0;
  int v0 = ne_session_disable_restrictions_disable_restrictions_token;
  if (ne_session_disable_restrictions_disable_restrictions_token < 0)
  {
    if (notify_register_check("com.apple.networkextension.disable-restrictions", &ne_session_disable_restrictions_disable_restrictions_token))
    {
      ne_session_disable_restrictions_disable_restrictions_token = -1;
      return ne_session_disable_restrictions_current_state != 0;
    }
    int v0 = ne_session_disable_restrictions_disable_restrictions_token;
    if (ne_session_disable_restrictions_disable_restrictions_token < 0) {
      return ne_session_disable_restrictions_current_state != 0;
    }
  }
  if (notify_check(v0, &check)
    || check
    && notify_get_state(ne_session_disable_restrictions_disable_restrictions_token, (uint64_t *)&ne_session_disable_restrictions_current_state))
  {
    notify_cancel(ne_session_disable_restrictions_disable_restrictions_token);
    ne_session_disable_restrictions_disable_restrictions_token = -1;
    ne_session_disable_restrictions_current_uint32_t state = 0;
  }
  return ne_session_disable_restrictions_current_state != 0;
}

BOOL ne_session_fallback_advisory()
{
  int check = 0;
  int v0 = ne_session_fallback_advisory_fallback_advisory_token;
  if (ne_session_fallback_advisory_fallback_advisory_token < 0)
  {
    if (notify_register_check("com.apple.symptoms.hasAlternateAdvice", &ne_session_fallback_advisory_fallback_advisory_token))
    {
      ne_session_fallback_advisory_fallback_advisory_token = -1;
      return ne_session_fallback_advisory_current_state != 0;
    }
    int v0 = ne_session_fallback_advisory_fallback_advisory_token;
    if (ne_session_fallback_advisory_fallback_advisory_token < 0) {
      return ne_session_fallback_advisory_current_state != 0;
    }
  }
  if (notify_check(v0, &check)
    || check
    && notify_get_state(ne_session_fallback_advisory_fallback_advisory_token, (uint64_t *)&ne_session_fallback_advisory_current_state))
  {
    notify_cancel(ne_session_fallback_advisory_fallback_advisory_token);
    ne_session_fallback_advisory_fallback_advisory_token = -1;
    ne_session_fallback_advisory_current_uint32_t state = 0;
  }
  return ne_session_fallback_advisory_current_state != 0;
}

uint64_t ne_session_fallback_default()
{
  int check = 0;
  int v0 = ne_session_fallback_default_fallback_default_token;
  if (ne_session_fallback_default_fallback_default_token < 0)
  {
    if (notify_register_check("com.apple.networkextension.fallback-default", &ne_session_fallback_default_fallback_default_token))
    {
      ne_session_fallback_default_fallback_default_token = -1;
      return ne_session_fallback_default_current_state;
    }
    int v0 = ne_session_fallback_default_fallback_default_token;
    if (ne_session_fallback_default_fallback_default_token < 0) {
      return ne_session_fallback_default_current_state;
    }
  }
  if (notify_check(v0, &check)
    || check
    && notify_get_state(ne_session_fallback_default_fallback_default_token, (uint64_t *)&ne_session_fallback_default_current_state))
  {
    notify_cancel(ne_session_fallback_default_fallback_default_token);
    ne_session_fallback_default_fallback_default_token = -1;
    ne_session_fallback_default_current_uint32_t state = 0;
  }
  return ne_session_fallback_default_current_state;
}

uint64_t ne_get_configuration_generation()
{
  uint64_t v16 = *MEMORY[0x1E4F14BF8];
  int v0 = ne_get_configuration_generation_configuration_changed_token;
  if (ne_get_configuration_generation_configuration_changed_token < 0)
  {
    if (notify_register_check("com.apple.neconfigurationchanged", &ne_get_configuration_generation_configuration_changed_token))
    {
      ne_get_configuration_generation_configuration_changed_token = -1;
      return ne_get_configuration_generation_current_generation;
    }
    int v0 = ne_get_configuration_generation_configuration_changed_token;
    if (ne_get_configuration_generation_configuration_changed_token < 0) {
      return ne_get_configuration_generation_current_generation;
    }
  }
  int check = 0;
  uint32_t v1 = notify_check(v0, &check);
  if (v1)
  {
    uint32_t v2 = v1;
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v3 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "com.apple.neconfigurationchanged";
    __int16 v12 = 1024;
    int v13 = ne_get_configuration_generation_configuration_changed_token;
    __int16 v14 = 1024;
    uint32_t v15 = v2;
    char v6 = "notify_check failed for %s, token = %d: %u";
  }
  else
  {
    if (!check) {
      return ne_get_configuration_generation_current_generation;
    }
    uint64_t v8 = 0;
    uint32_t state = notify_get_state(ne_get_configuration_generation_configuration_changed_token, &v8);
    if (!state)
    {
      ne_get_configuration_generation_current_generation = v8 & 0x1FFFFFFFFFFFFFLL;
      return ne_get_configuration_generation_current_generation;
    }
    uint32_t v5 = state;
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v3 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "com.apple.neconfigurationchanged";
    __int16 v12 = 1024;
    int v13 = ne_get_configuration_generation_configuration_changed_token;
    __int16 v14 = 1024;
    uint32_t v15 = v5;
    char v6 = "notify_get_state failed for %s, token = %d: %u";
  }
  _os_log_error_impl(&dword_19DD92000, v3, OS_LOG_TYPE_ERROR, v6, buf, 0x18u);
LABEL_6:
  notify_cancel(ne_get_configuration_generation_configuration_changed_token);
  ne_get_configuration_generation_configuration_changed_token = -1;
  ne_get_configuration_generation_current_generation = 0;
  return ne_get_configuration_generation_current_generation;
}

uint64_t ne_session_use_as_system_vpn()
{
  return 1;
}

unint64_t ne_session_on_demand_configs_present()
{
  return (unint64_t)get_current_config_state() >> 63;
}

unint64_t ne_session_vod_evaluate_connection_present()
{
  return ((unint64_t)get_current_config_state() >> 54) & 1;
}

unint64_t ne_session_always_on_vpn_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 61) & 1;
}

uint64_t ne_session_always_on_vpn_configs_present_at_boot()
{
  if ((get_current_config_state() & 0x2000000000000000) != 0) {
    return 1;
  }
  int v0 = open("/Library/Preferences/com.apple.networkextension.necp.plist", 0);
  if (v0 == -1) {
    return 0;
  }
  int v1 = v0;
  memset(&v9, 0, sizeof(v9));
  if (fstat(v0, &v9)) {
    off_t st_size = 0;
  }
  else {
    off_t st_size = v9.st_size;
  }
  if ((unint64_t)(st_size - 1) <= 0x27FE && (uint64_t v3 = malloc_type_malloc(st_size, 0xB97863F2uLL)) != 0)
  {
    BOOL v4 = v3;
    if (pread(v1, v3, st_size, 0) == st_size && (uint32_t v5 = (void *)xpc_create_from_plist()) != 0)
    {
      char v6 = v5;
      BOOL v7 = xpc_dictionary_get_int64(v5, "drop_all_feature_always_on_vpn") != 0;
      xpc_release(v6);
    }
    else
    {
      BOOL v7 = 0;
    }
    free(v4);
  }
  else
  {
    BOOL v7 = 0;
  }
  close(v1);
  return v7;
}

uint64_t ne_session_is_always_on_vpn_enabled(NSObject *a1, const void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F14BF8];
  os_unfair_lock_lock((os_unfair_lock_t)&ne_session_is_always_on_vpn_enabled_notify_lock);
  ne_session_is_always_on_vpn_enabled_enabled = ne_session_always_on_vpn_configs_present_at_boot();
  BOOL v4 = ne_session_is_always_on_vpn_enabled_queue;
  if (ne_session_is_always_on_vpn_enabled_queue != a1
    || ne_session_is_always_on_vpn_enabled_handler != (void)a2)
  {
    if (ne_session_is_always_on_vpn_enabled_notify_token != -1)
    {
      notify_cancel(ne_session_is_always_on_vpn_enabled_notify_token);
      ne_session_is_always_on_vpn_enabled_notify_token = -1;
      BOOL v4 = ne_session_is_always_on_vpn_enabled_queue;
    }
    if (v4)
    {
      dispatch_release(v4);
      ne_session_is_always_on_vpn_enabled_queue = 0;
    }
    if (ne_session_is_always_on_vpn_enabled_handler)
    {
      _Block_release((const void *)ne_session_is_always_on_vpn_enabled_handler);
      ne_session_is_always_on_vpn_enabled_handler = 0;
    }
  }
  if (a1)
  {
    if (a2)
    {
      ne_session_is_always_on_vpn_enabled_queue = (uint64_t)a1;
      dispatch_retain(a1);
      ne_session_is_always_on_vpn_enabled_handler = (uint64_t)_Block_copy(a2);
      uint32_t v6 = notify_register_dispatch("com.apple.neconfigurationchanged", &ne_session_is_always_on_vpn_enabled_notify_token, (dispatch_queue_t)ne_session_is_always_on_vpn_enabled_queue, &__block_literal_global);
      if (v6)
      {
        uint32_t v7 = v6;
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        uint64_t v8 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
        {
          int v10 = 136315394;
          uint64_t v11 = "com.apple.neconfigurationchanged";
          __int16 v12 = 1024;
          uint32_t v13 = v7;
          _os_log_error_impl(&dword_19DD92000, v8, OS_LOG_TYPE_ERROR, "Failed to register for %s notifications in ne_session_is_always_on_vpn_enabled: %u", (uint8_t *)&v10, 0x12u);
        }
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&ne_session_is_always_on_vpn_enabled_notify_lock);
  return ne_session_is_always_on_vpn_enabled_enabled;
}

void __ne_session_is_always_on_vpn_enabled_block_invoke(uint64_t a1, int a2)
{
  current_config_uint32_t state = get_current_config_state();
  os_unfair_lock_lock((os_unfair_lock_t)&ne_session_is_always_on_vpn_enabled_notify_lock);
  if (ne_session_is_always_on_vpn_enabled_notify_token != a2
    || ((uint64_t v4 = current_config_state & 0x2000000000000000,
         ne_session_is_always_on_vpn_enabled_enabled != (current_config_state & 0x2000000000000000uLL) >> 61)
      ? (BOOL v5 = ne_session_is_always_on_vpn_enabled_handler == 0)
      : (BOOL v5 = 1),
        v5))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_session_is_always_on_vpn_enabled_notify_lock);
  }
  else
  {
    ne_session_is_always_on_vpn_enabled_enabled = (current_config_state & 0x2000000000000000uLL) >> 61;
    uint32_t v6 = (void (**)(void *, BOOL))_Block_copy((const void *)ne_session_is_always_on_vpn_enabled_handler);
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_session_is_always_on_vpn_enabled_notify_lock);
    if (v6)
    {
      v6[2](v6, v4 != 0);
      _Block_release(v6);
    }
  }
}

unint64_t ne_session_vpn_include_all_networks_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 55) & 1;
}

unint64_t ne_session_content_filter_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 60) & 1;
}

unint64_t ne_session_dns_proxy_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 59) & 1;
}

unint64_t ne_session_path_controller_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 58) & 1;
}

unint64_t ne_session_dns_settings_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 57) & 1;
}

unint64_t ne_session_local_communication_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 56) & 1;
}

unint64_t ne_session_relay_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 53) & 1;
}

uint64_t ne_session_create(uint64_t a1, int a2)
{
  uint64_t v8 = 0;
  stat v9 = &v8;
  uint64_t v10 = 0x2000000000;
  uint64_t v11 = 0;
  if (globals_init_sess_init != -1) {
    dispatch_once(&globals_init_sess_init, &__block_literal_global_175);
  }
  block[0] = MEMORY[0x1E4F14BE8];
  block[1] = 0x40000000;
  block[2] = __ne_session_create_block_invoke;
  block[3] = &unk_1E598C220;
  int v7 = a2;
  block[4] = &v8;
  void block[5] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
  uint64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

void *__ne_session_create_block_invoke(uint64_t a1)
{
  uint64_t v2 = g_sessions;
  if (g_sessions)
  {
    while (uuid_compare(*(const unsigned __int8 **)(a1 + 40), (const unsigned __int8 *)v2)
         || *(_DWORD *)(v2 + 16) != *(_DWORD *)(a1 + 48)
         || *(unsigned char *)(v2 + 64))
    {
      uint64_t v2 = *(void *)(v2 + 48);
      if (!v2) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    uint64_t result = malloc_type_malloc(0x48uLL, 0x10A0040C4150745uLL);
    if (!result) {
      return result;
    }
    uint64_t v2 = (uint64_t)result;
    result[8] = 0;
    *((_OWORD *)result + 1) = 0u;
    *((_OWORD *)result + 2) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *((_OWORD *)result + 3) = 0u;
    uint64_t v4 = result + 6;
    uuid_copy((unsigned __int8 *)result, *(const unsigned __int8 **)(a1 + 40));
    *(_DWORD *)(v2 + 16) = *(_DWORD *)(a1 + 48);
    *(void *)(v2 + 24) = 0;
    *(_DWORD *)(v2 + 32) = 1;
    uint64_t v5 = g_sessions;
    void *v4 = g_sessions;
    if (v5) {
      *(void *)(v5 + 56) = v4;
    }
    g_sessions = v2;
    *(void *)(v2 + 56) = &g_sessions;
  }
  uint64_t result = malloc_type_malloc(0x30uLL, 0x10A0040D517E767uLL);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  uint32_t v6 = *(_OWORD **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  *uint32_t v6 = 0u;
  v6[1] = 0u;
  v6[2] = 0u;
  **(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 40), 1u, memory_order_relaxed);
  uint64_t v9 = *(void *)(v2 + 24);
  uint64_t v8 = (void *)(v2 + 24);
  uint64_t v7 = v9;
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 8) = v9;
  if (v9) {
    *(void *)(v7 + 16) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 8;
  }
  *uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 16) = v8;
  return result;
}

uint64_t ne_session_retain(uint64_t result)
{
  return result;
}

void ne_session_set_event_handler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x1E4F14BE8];
  block[1] = 0x40000000;
  block[2] = __ne_session_set_event_handler_block_invoke;
  block[3] = &unk_1E598C268;
  block[4] = a3;
  void block[5] = a1;
  void block[6] = a2;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_set_event_handler_block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  if (v1)
  {
    ne_session_clear_event_handler(a1[5], 0);
    uint64_t v3 = (void *)a1[4];
    if (v3) {
      uint64_t v3 = _Block_copy(v3);
    }
    *(void *)(v1 + 24) = v3;
    uint64_t v4 = a1[6];
    *(void *)(v1 + 32) = v4;
    if (v4) {
      dispatch_retain(v4);
    }
  }
  if (get_current_notify_pid())
  {
    update_all_session_clients();
  }
}

void ne_session_cancel(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F14BE8];
  block[1] = 0x40000000;
  block[2] = __ne_session_cancel_block_invoke;
  block[3] = &__block_descriptor_tmp_10;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_cancel_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    ne_session_clear_event_handler(v1, 1);
  }
}

void ne_session_get_status(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x1E4F14BE8];
  block[1] = 0x40000000;
  block[2] = __ne_session_get_status_block_invoke;
  block[3] = &unk_1E598C300;
  void block[5] = a1;
  void block[6] = a2;
  block[4] = a3;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_get_status_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(uint64_t **)(a1 + 40);
  dispatch_retain(*(dispatch_object_t *)(a1 + 48));
  uint64_t v3 = _Block_copy(*(const void **)(a1 + 32));
  atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(a1 + 40) + 40), 1u, memory_order_relaxed);
  uint64_t v4 = *v2;
  uint64_t v5 = g_sessions;
  if (*v2) {
    BOOL v6 = g_sessions == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    goto LABEL_9;
  }
  while (v5 != v4)
  {
    uint64_t v5 = *(void *)(v5 + 48);
    if (!v5) {
      goto LABEL_9;
    }
  }
  if (*(unsigned char *)(v4 + 64) || !*(void *)(v4 + 40))
  {
LABEL_9:
    if (get_current_notify_pid())
    {
      uint64_t v7 = *v2;
      uint64_t v8 = *(NSObject **)(a1 + 48);
      v13[0] = MEMORY[0x1E4F14BE8];
      v13[1] = 0x40000000;
      v13[2] = __ne_session_get_status_block_invoke_2;
      v13[3] = &unk_1E598C2B0;
      v13[4] = v3;
      v13[5] = v8;
      void v13[6] = *(void *)(a1 + 40);
      fetch_status(v7, (uint64_t)v2, v8, v13);
      return;
    }
    int v9 = 1;
  }
  else
  {
    int v9 = *(_DWORD *)(v4 + 32);
  }
  uint64_t v10 = *(NSObject **)(a1 + 48);
  block[0] = MEMORY[0x1E4F14BE8];
  block[1] = 0x40000000;
  block[2] = __ne_session_get_status_block_invoke_3;
  block[3] = &unk_1E598C2D8;
  int v12 = v9;
  block[4] = v3;
  void block[5] = v10;
  void block[6] = *(void *)(a1 + 40);
  dispatch_async(v10, block);
}

void __ne_session_get_status_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 48);

  ne_session_release(v2);
}

void __ne_session_get_status_block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 48);

  ne_session_release(v2);
}

const char *ne_session_info_type_to_string(int a1)
{
  if ((a1 - 1) > 4) {
    return "unknown";
  }
  else {
    return off_1E598CB58[a1 - 1];
  }
}

void ne_session_local_communication_send_info(uint64_t a1, int a2, uint64_t a3, dispatch_object_t object, const void *a5)
{
  dispatch_retain(object);
  uint64_t v10 = _Block_copy(a5);
  atomic_fetch_add_explicit((atomic_uint *volatile)(a1 + 40), 1u, memory_order_relaxed);
  block[0] = MEMORY[0x1E4F14BE8];
  block[1] = 0x40000000;
  block[2] = __ne_session_local_communication_send_info_block_invoke;
  block[3] = &unk_1E598C3C8;
  block[4] = v10;
  void block[5] = a1;
  int v12 = a2;
  void block[6] = object;
  void block[7] = a3;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_local_communication_send_info_block_invoke(uint64_t a1)
{
  if (!get_current_notify_pid())
  {
    v10[0] = MEMORY[0x1E4F14BE8];
    v10[1] = 0x40000000;
    v10[2] = __ne_session_local_communication_send_info_block_invoke_2_29;
    v10[3] = &unk_1E598C3A0;
    uint64_t v7 = *(void *)(a1 + 40);
    BOOL v6 = *(NSObject **)(a1 + 48);
    v10[4] = *(void *)(a1 + 32);
    v10[5] = v6;
    v10[6] = v7;
    uint64_t v8 = v10;
LABEL_8:
    dispatch_async(v6, v8);
    return;
  }
  uint64_t connection = get_connection(**(void **)(a1 + 40));
  if (!connection)
  {
    block[0] = MEMORY[0x1E4F14BE8];
    block[1] = 0x40000000;
    block[2] = __ne_session_local_communication_send_info_block_invoke_2;
    block[3] = &unk_1E598C328;
    uint64_t v9 = *(void *)(a1 + 40);
    BOOL v6 = *(NSObject **)(a1 + 48);
    block[4] = *(void *)(a1 + 32);
    void block[5] = v6;
    void block[6] = v9;
    uint64_t v8 = block;
    goto LABEL_8;
  }
  uint64_t v3 = (_xpc_connection_s *)connection;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "SessionCommandType", 7);
  xpc_dictionary_set_int64(v4, "SessionInfoType", *(int *)(a1 + 64));
  uint64_t v5 = *(void **)(a1 + 56);
  if (v5) {
    xpc_dictionary_set_value(v4, "SessionAppPushCallInfo", v5);
  }
  handler[0] = MEMORY[0x1E4F14BE8];
  handler[1] = 0x40000000;
  handler[2] = __ne_session_local_communication_send_info_block_invoke_3;
  handler[3] = &unk_1E598C378;
  int v13 = *(_DWORD *)(a1 + 64);
  handler[4] = *(void *)(a1 + 32);
  int8x16_t v12 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  xpc_connection_send_message_with_reply(v3, v4, (dispatch_queue_t)g_queue, handler);
  xpc_release(v4);
}

void __ne_session_local_communication_send_info_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 48);

  ne_session_release(v2);
}

void __ne_session_local_communication_send_info_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F14BF8];
  if (a2 && (v4 = MEMORY[0x19F3B5680](a2), uint64_t v5 = MEMORY[0x1E4F14D40], v4 == MEMORY[0x1E4F14D40]))
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "SessionAppPushSendMessageResult");
    uint64_t v7 = value;
    if (!value) {
      goto LABEL_8;
    }
    if (MEMORY[0x19F3B5680](value) == v5)
    {
      xpc_retain(v7);
      goto LABEL_8;
    }
  }
  else
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    BOOL v6 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      int v9 = *(_DWORD *)(a1 + 56);
      string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E4F14D08]);
      *(_DWORD *)buf = 67109378;
      int v13 = v9;
      __int16 v14 = 2080;
      uint32_t v15 = string;
      _os_log_error_impl(&dword_19DD92000, v6, OS_LOG_TYPE_ERROR, "Failed to send info with type %d: %s", buf, 0x12u);
    }
  }
  uint64_t v7 = 0;
LABEL_8:
  v11[0] = MEMORY[0x1E4F14BE8];
  v11[1] = 0x40000000;
  v11[2] = __ne_session_local_communication_send_info_block_invoke_25;
  v11[3] = &unk_1E598C350;
  v11[4] = *(void *)(a1 + 32);
  v11[5] = v7;
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), v11);
}

void __ne_session_local_communication_send_info_block_invoke_2_29(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 48);

  ne_session_release(v2);
}

void __ne_session_local_communication_send_info_block_invoke_25(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2) {
    xpc_release(v2);
  }
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 56);

  ne_session_release(v3);
}

uint64_t ne_session_map_interface_to_provider_uuid(const char *a1, uuid_t uu)
{
  uint64_t v22 = *MEMORY[0x1E4F14BF8];
  uuid_clear(uu);
  if (a1)
  {
    getpid();
    uint64_t v4 = "com.apple.nesessionmanager";
    if (sandbox_check())
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint64_t v5 = ne_log_obj_log_obj;
      uint64_t v4 = "com.apple.nesessionmanager.flow-divert-token";
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v17 = "com.apple.nesessionmanager.flow-divert-token";
        _os_log_impl(&dword_19DD92000, v5, OS_LOG_TYPE_INFO, "Falling back to %s", buf, 0xCu);
      }
    }
    mach_service = xpc_connection_create_mach_service(v4, (dispatch_queue_t)g_queue, 2uLL);
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_37);
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_int64(empty, "SessionClientType", 3);
    xpc_dictionary_set_string(empty, "InterfaceMapInfo", a1);
    xpc_connection_resume(mach_service);
    xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(mach_service, empty);
    if (!v8)
    {
      uint64_t v11 = 0;
LABEL_27:
      xpc_release(empty);
      xpc_connection_cancel(mach_service);
      xpc_release(mach_service);
      return v11;
    }
    int v9 = v8;
    if (MEMORY[0x19F3B5680](v8) == MEMORY[0x1E4F14D40])
    {
      uuid = xpc_dictionary_get_uuid(v9, "MachOUUID");
      if (uuid)
      {
        *(_OWORD *)uu = *(_OWORD *)uuid;
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        int v13 = ne_log_obj_log_obj;
        uint64_t v11 = 1;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v17 = a1;
          __int16 v18 = 1040;
          int v19 = 16;
          __int16 v20 = 2096;
          unsigned __int8 *__attribute__((__org_typedef(uuid_t))) v21 = uu;
          _os_log_impl(&dword_19DD92000, v13, OS_LOG_TYPE_INFO, "Mapped interface %s to provider UUID: %{uuid_t}.16P", buf, 0x1Cu);
        }
        goto LABEL_26;
      }
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      __int16 v14 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_19DD92000, v14, OS_LOG_TYPE_DEBUG, "Error mapping interface to provider UUID: malformed response from nesessionmanager.", buf, 2u);
      }
    }
    else if (MEMORY[0x19F3B5680](v9) == MEMORY[0x1E4F14D58])
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint64_t v10 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DD92000, v10, OS_LOG_TYPE_ERROR, "Error sending a map interface message to nesessionmanager.", buf, 2u);
      }
    }
    uint64_t v11 = 0;
LABEL_26:
    xpc_release(v9);
    goto LABEL_27;
  }
  return 0;
}

void __ne_session_map_interface_to_provider_uuid_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 && MEMORY[0x19F3B5680](a2) == MEMORY[0x1E4F14D58])
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v2 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_error_impl(&dword_19DD92000, v2, OS_LOG_TYPE_ERROR, "Error sending a map interface message to nesessionmanager.", v3, 2u);
    }
  }
}

uint64_t ne_session_set_device_communication_exception(BOOL a1)
{
  uint64_t v23 = *MEMORY[0x1E4F14BF8];
  getpid();
  uint64_t v2 = "com.apple.nesessionmanager";
  if (sandbox_check())
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v3 = ne_log_obj_log_obj;
    uint64_t v2 = "com.apple.nesessionmanager.flow-divert-token";
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v20 = "ne_session_set_device_communication_exception";
      __int16 v21 = 2080;
      uint64_t v22 = "com.apple.nesessionmanager.flow-divert-token";
      _os_log_impl(&dword_19DD92000, v3, OS_LOG_TYPE_INFO, "%s: Falling back to %s", buf, 0x16u);
    }
  }
  mach_service = xpc_connection_create_mach_service(v2, (dispatch_queue_t)g_queue, 2uLL);
  if (mach_service)
  {
    uint64_t v5 = mach_service;
    handler[0] = MEMORY[0x1E4F14BE8];
    handler[1] = 0x40000000;
    handler[2] = __ne_session_set_device_communication_exception_block_invoke;
    handler[3] = &__block_descriptor_tmp_41;
    handler[4] = v2;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_int64(empty, "SessionClientType", 4);
    xpc_dictionary_set_BOOL(empty, "DeviceCommunicationExceptionEnable", a1);
    xpc_connection_resume(v5);
    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v5, empty);
    if (!v7)
    {
      uint64_t v11 = 0;
LABEL_33:
      xpc_release(empty);
      xpc_release(v5);
      return v11;
    }
    xpc_object_t v8 = v7;
    if (MEMORY[0x19F3B5680](v7) == MEMORY[0x1E4F14D40])
    {
      BOOL v12 = xpc_dictionary_get_BOOL(v8, "DeviceCommunicationExceptionResult");
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      int v13 = ne_log_obj_log_obj;
      BOOL v14 = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_INFO);
      if (v12)
      {
        if (v14)
        {
          uint32_t v15 = "disabled";
          if (a1) {
            uint32_t v15 = "enabled";
          }
          *(_DWORD *)buf = 136315138;
          __int16 v20 = v15;
          uint64_t v11 = 1;
          _os_log_impl(&dword_19DD92000, v13, OS_LOG_TYPE_INFO, "DeviceCommunicationException succeeded: %s", buf, 0xCu);
        }
        else
        {
          uint64_t v11 = 1;
        }
        goto LABEL_32;
      }
      if (v14)
      {
        uint64_t v16 = "disabled";
        if (a1) {
          uint64_t v16 = "enabled";
        }
        *(_DWORD *)buf = 136315138;
        __int16 v20 = v16;
        _os_log_impl(&dword_19DD92000, v13, OS_LOG_TYPE_INFO, "DeviceCommunicationException failed: %s", buf, 0xCu);
      }
    }
    else if (MEMORY[0x19F3B5680](v8) == MEMORY[0x1E4F14D58])
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      int v9 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v20 = v2;
        _os_log_error_impl(&dword_19DD92000, v9, OS_LOG_TYPE_ERROR, "Error sending a DeviceCommunicationException message to %s", buf, 0xCu);
      }
    }
    uint64_t v11 = 0;
LABEL_32:
    xpc_release(v8);
    goto LABEL_33;
  }
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  uint64_t v10 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v20 = "ne_session_set_device_communication_exception";
    __int16 v21 = 2080;
    uint64_t v22 = v2;
    _os_log_error_impl(&dword_19DD92000, v10, OS_LOG_TYPE_ERROR, "%s: Error failed to create connection to %s", buf, 0x16u);
  }
  return 0;
}

void __ne_session_set_device_communication_exception_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F14BF8];
  if (a2 && MEMORY[0x19F3B5680](a2) == MEMORY[0x1E4F14D58])
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v3 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 136315138;
      uint64_t v6 = v4;
      _os_log_error_impl(&dword_19DD92000, v3, OS_LOG_TYPE_ERROR, "XPC Event - Error sending a DeviceCommunicationException message to %s", (uint8_t *)&v5, 0xCu);
    }
  }
}

void ne_session_get_info(uint64_t a1, int a2, dispatch_object_t object, const void *a4)
{
}

void ne_session_get_info_with_parameters(uint64_t a1, int a2, uint64_t a3, char a4, dispatch_object_t object, const void *a6)
{
  dispatch_retain(object);
  BOOL v12 = _Block_copy(a6);
  atomic_fetch_add_explicit((atomic_uint *volatile)(a1 + 40), 1u, memory_order_relaxed);
  block[0] = MEMORY[0x1E4F14BE8];
  block[1] = 0x40000000;
  block[2] = __ne_session_get_info_with_parameters_block_invoke;
  block[3] = &unk_1E598C830;
  char v15 = a4;
  block[4] = v12;
  void block[5] = a1;
  int v14 = a2;
  void block[6] = object;
  void block[7] = a3;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_get_info_with_parameters_block_invoke(uint64_t a1)
{
  if (!get_current_notify_pid() && !*(unsigned char *)(a1 + 68))
  {
    v10[0] = MEMORY[0x1E4F14BE8];
    v10[1] = 0x40000000;
    v10[2] = __ne_session_get_info_with_parameters_block_invoke_2_194;
    v10[3] = &unk_1E598C808;
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v6 = *(NSObject **)(a1 + 48);
    v10[4] = *(void *)(a1 + 32);
    v10[5] = v6;
    v10[6] = v9;
    xpc_object_t v8 = v10;
    goto LABEL_9;
  }
  uint64_t connection = get_connection(**(void **)(a1 + 40));
  if (!connection)
  {
    v14[0] = MEMORY[0x1E4F14BE8];
    v14[1] = 0x40000000;
    v14[2] = __ne_session_get_info_with_parameters_block_invoke_2;
    v14[3] = &unk_1E598C790;
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v6 = *(NSObject **)(a1 + 48);
    v14[4] = *(void *)(a1 + 32);
    v14[5] = v6;
    v14[6] = v7;
    xpc_object_t v8 = v14;
LABEL_9:
    dispatch_async(v6, v8);
    return;
  }
  uint64_t v3 = (_xpc_connection_s *)connection;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "SessionCommandType", 6);
  xpc_dictionary_set_int64(v4, "SessionInfoType", *(int *)(a1 + 64));
  int v5 = *(void **)(a1 + 56);
  if (v5) {
    xpc_dictionary_set_value(v4, "SessionOptions", v5);
  }
  handler[0] = MEMORY[0x1E4F14BE8];
  handler[1] = 0x40000000;
  handler[2] = __ne_session_get_info_with_parameters_block_invoke_3;
  handler[3] = &unk_1E598C7E0;
  int v13 = *(_DWORD *)(a1 + 64);
  handler[4] = *(void *)(a1 + 32);
  int8x16_t v12 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  xpc_connection_send_message_with_reply(v3, v4, (dispatch_queue_t)g_queue, handler);
  xpc_release(v4);
}

void __ne_session_get_info_with_parameters_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 48);

  ne_session_release(v2);
}

void __ne_session_get_info_with_parameters_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F14BF8];
  if (a2 && (v4 = MEMORY[0x19F3B5680](a2), uint64_t v5 = MEMORY[0x1E4F14D40], v4 == MEMORY[0x1E4F14D40]))
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "SessionInfo");
    uint64_t v7 = value;
    if (!value) {
      goto LABEL_8;
    }
    if (MEMORY[0x19F3B5680](value) == v5)
    {
      xpc_retain(v7);
      goto LABEL_8;
    }
  }
  else
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v6 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      int v9 = *(_DWORD *)(a1 + 56);
      string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E4F14D08]);
      *(_DWORD *)buf = 67109378;
      int v13 = v9;
      __int16 v14 = 2080;
      char v15 = string;
      _os_log_error_impl(&dword_19DD92000, v6, OS_LOG_TYPE_ERROR, "Failed to fetch info with type %d: %s", buf, 0x12u);
    }
  }
  uint64_t v7 = 0;
LABEL_8:
  v11[0] = MEMORY[0x1E4F14BE8];
  v11[1] = 0x40000000;
  v11[2] = __ne_session_get_info_with_parameters_block_invoke_191;
  v11[3] = &unk_1E598C7B8;
  v11[4] = *(void *)(a1 + 32);
  v11[5] = v7;
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), v11);
}

void __ne_session_get_info_with_parameters_block_invoke_2_194(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 48);

  ne_session_release(v2);
}

void __ne_session_get_info_with_parameters_block_invoke_191(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2) {
    xpc_release(v2);
  }
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 56);

  ne_session_release(v3);
}

void ne_session_get_info2(uint64_t a1, int a2, char a3, dispatch_object_t object, const void *a5)
{
}

void ne_session_send_barrier(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  uint64_t v9 = 0;
  block[0] = MEMORY[0x1E4F14BE8];
  block[1] = 0x40000000;
  block[2] = __ne_session_send_barrier_block_invoke;
  block[3] = &unk_1E598C430;
  block[4] = &v6;
  void block[5] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
  if (v7[3])
  {
    uint64_t v1 = dispatch_semaphore_create(0);
    dispatch_time_t v2 = dispatch_time(0, 1000000000);
    dispatch_retain(v1);
    uint64_t v3 = (_xpc_connection_s *)v7[3];
    barrier[0] = MEMORY[0x1E4F14BE8];
    barrier[1] = 0x40000000;
    barrier[2] = __ne_session_send_barrier_block_invoke_2;
    barrier[3] = &__block_descriptor_tmp_47;
    barrier[4] = v1;
    xpc_connection_send_barrier(v3, barrier);
    dispatch_semaphore_wait(v1, v2);
    dispatch_release(v1);
    xpc_release((xpc_object_t)v7[3]);
  }
  _Block_object_dispose(&v6, 8);
}

xpc_object_t __ne_session_send_barrier_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = get_connection(**(void **)(a1 + 40));
  xpc_object_t result = *(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (result)
  {
    return xpc_retain(result);
  }
  return result;
}

void __ne_session_send_barrier_block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_time_t v2 = *(NSObject **)(a1 + 32);

  dispatch_release(v2);
}

void ne_session_start_on_behalf_of(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7)
{
  block[0] = MEMORY[0x1E4F14BE8];
  block[1] = 0x40000000;
  block[2] = __ne_session_start_on_behalf_of_block_invoke;
  block[3] = &__block_descriptor_tmp_54;
  int v8 = a3;
  int v9 = a4;
  int v10 = a6;
  int v11 = a5;
  int v12 = a7;
  block[4] = a1;
  void block[5] = a2;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_start_on_behalf_of_block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = *(uint64_t **)(a1 + 32);
  uint64_t connection = get_connection(*v2);
  if (connection)
  {
    uint64_t v4 = (_xpc_connection_s *)connection;
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "SessionCommandType", 2);
    xpc_dictionary_set_mach_send();
    xpc_dictionary_set_mach_send();
    xpc_dictionary_set_int64(v5, "SessionGroupID", *(unsigned int *)(a1 + 56));
    xpc_dictionary_set_int64(v5, "SessionUserID", *(unsigned int *)(a1 + 60));
    xpc_dictionary_set_int64(v5, "SessionPID", *(int *)(a1 + 64));
    uint64_t v6 = *(void **)(a1 + 40);
    if (v6) {
      xpc_dictionary_set_value(v5, "SessionOptions", v6);
    }
    xpc_connection_send_message(v4, v5);
    xpc_release(v5);
    uint64_t v7 = 2;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *v2;

  set_status(v8, 0, v7);
}

void ne_session_start_with_options(uint64_t a1, uint64_t a2)
{
  int v4 = *MEMORY[0x1E4F14C40];
  mach_port_name_t v5 = audit_session_self();
  uid_t v6 = geteuid();
  gid_t v7 = getegid();
  pid_t v8 = getpid();
  block[0] = MEMORY[0x1E4F14BE8];
  block[1] = 0x40000000;
  block[2] = __ne_session_start_on_behalf_of_block_invoke;
  block[3] = &__block_descriptor_tmp_54;
  int v10 = v4;
  mach_port_name_t v11 = v5;
  gid_t v12 = v7;
  uid_t v13 = v6;
  pid_t v14 = v8;
  block[4] = a1;
  void block[5] = a2;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void ne_session_start(uint64_t a1)
{
}

void ne_session_stop(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F14BE8];
  v1[1] = 0x40000000;
  v1[2] = __ne_session_stop_with_reason_block_invoke;
  v1[3] = &__block_descriptor_tmp_198;
  v1[4] = a1;
  int v2 = 1;
  dispatch_sync((dispatch_queue_t)g_queue, v1);
}

void __ne_session_stop_with_reason_block_invoke(uint64_t a1)
{
  int v2 = *(uint64_t **)(a1 + 32);
  if (get_current_notify_pid())
  {
    uint64_t connection = get_connection(*v2);
    if (connection)
    {
      int v4 = (_xpc_connection_s *)connection;
      xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v5, "SessionCommandType", 3);
      xpc_dictionary_set_int64(v5, "SessionStopReason", *(int *)(a1 + 40));
      xpc_connection_send_message(v4, v5);
      xpc_release(v5);
      uint64_t v6 = 5;
    }
    else
    {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *v2;
    set_status(v7, 0, v6);
  }
}

void ne_session_get_configuration_id(const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *a1, uuid_t dst)
{
}

void ne_session_establish_ipc(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x1E4F14BE8];
  block[1] = 0x40000000;
  block[2] = __ne_session_establish_ipc_block_invoke;
  block[3] = &unk_1E598C510;
  block[4] = a3;
  void block[5] = a1;
  void block[6] = a2;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_establish_ipc_block_invoke(uint64_t a1)
{
  uint64_t connection = (_xpc_connection_s *)get_connection(**(void **)(a1 + 40));
  uint64_t v3 = _Block_copy(*(const void **)(a1 + 32));
  dispatch_retain(*(dispatch_object_t *)(a1 + 48));
  atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(a1 + 40) + 40), 1u, memory_order_relaxed);
  if (connection)
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v4, "SessionCommandType", 4);
    v6[0] = MEMORY[0x1E4F14BE8];
    v6[1] = 0x40000000;
    v6[2] = __ne_session_establish_ipc_block_invoke_3;
    v6[3] = &unk_1E598C4E8;
    v6[4] = v3;
    int8x16_t v7 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    xpc_connection_send_message_with_reply(connection, v4, (dispatch_queue_t)g_queue, v6);
    xpc_release(v4);
  }
  else
  {
    xpc_object_t v5 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E4F14BE8];
    block[1] = 0x40000000;
    block[2] = __ne_session_establish_ipc_block_invoke_2;
    block[3] = &unk_1E598C498;
    block[4] = v3;
    void block[5] = v5;
    void block[6] = *(void *)(a1 + 40);
    dispatch_async(v5, block);
  }
}

void __ne_session_establish_ipc_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 48);

  ne_session_release(v2);
}

void __ne_session_establish_ipc_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  if (a2)
  {
    if (MEMORY[0x19F3B5680](a2) == MEMORY[0x1E4F14D40])
    {
      xpc_object_t value = xpc_dictionary_get_value(v2, "SessionPrimaryPluginEndpoint");
      uint64_t v2 = value;
      if (!value) {
        goto LABEL_4;
      }
      if (MEMORY[0x19F3B5680](value) == MEMORY[0x1E4F14D50])
      {
        xpc_retain(v2);
        goto LABEL_4;
      }
    }
    uint64_t v2 = 0;
  }
LABEL_4:
  v5[0] = MEMORY[0x1E4F14BE8];
  v5[1] = 0x40000000;
  v5[2] = __ne_session_establish_ipc_block_invoke_4;
  v5[3] = &unk_1E598C4C0;
  v5[4] = *(void *)(a1 + 32);
  v5[5] = v2;
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), v5);
}

void __ne_session_establish_ipc_block_invoke_4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F14BF8];
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  uint64_t v2 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 134217984;
    uint64_t v6 = v4;
    _os_log_debug_impl(&dword_19DD92000, v2, OS_LOG_TYPE_DEBUG, "Establish IPC returning primary = %p", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3) {
    xpc_release(v3);
  }
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
  ne_session_release(*(void *)(a1 + 56));
}

uint64_t ne_session_add_necp_drop_dest_from_path(const char *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F14BF8];
  int v20 = 0;
  memset(v19, 0, sizeof(v19));
  size_t v18 = 324;
  if (sysctlbyname("net.necp.drop_dest_level", 0, &v18, 0, 0))
  {
    uint64_t v2 = *__error();
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v3 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = strerror(v2);
      buf.st_dev = 136315394;
      *(void *)&buf.st_mode = "ne_session_add_necp_drop_dest_from_path";
      WORD2(buf.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v4;
      int v5 = "%s: get len sysctlbyname(net.necp.drop_dest_level) failed %s";
LABEL_11:
      _os_log_error_impl(&dword_19DD92000, v3, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&buf, 0x16u);
    }
  }
  else if (sysctlbyname("net.necp.drop_dest_level", v19, &v18, 0, 0))
  {
    uint64_t v2 = *__error();
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v3 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = strerror(v2);
      buf.st_dev = 136315394;
      *(void *)&buf.st_mode = "ne_session_add_necp_drop_dest_from_path";
      WORD2(buf.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v6;
      int v5 = "%s: get sysctlbyname(net.necp.drop_dest_level) failed %s";
      goto LABEL_11;
    }
  }
  else
  {
    int v7 = open(a1, 0);
    if (v7 == -1)
    {
      uint64_t v2 = *__error();
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      pid_t v14 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        char v15 = strerror(v2);
        buf.st_dev = 136315650;
        *(void *)&buf.st_mode = "ne_session_add_necp_drop_dest_from_path";
        WORD2(buf.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)a1;
        HIWORD(buf.st_gid) = 2080;
        *(void *)&buf.st_rdev = v15;
        _os_log_error_impl(&dword_19DD92000, v14, OS_LOG_TYPE_ERROR, "%s: open(%s) failed %s", (uint8_t *)&buf, 0x20u);
      }
    }
    else
    {
      int v8 = v7;
      memset(&buf, 0, sizeof(buf));
      if (fstat(v7, &buf)) {
        off_t st_size = 0;
      }
      else {
        off_t st_size = buf.st_size;
      }
      if ((unint64_t)(st_size - 1) > 0x27FE)
      {
        if (st_size <= 0) {
          uint64_t v2 = 0;
        }
        else {
          uint64_t v2 = 27;
        }
      }
      else
      {
        int v10 = malloc_type_malloc(st_size, 0x936A0A78uLL);
        if (v10)
        {
          mach_port_name_t v11 = v10;
          if (pread(v8, v10, st_size, 0) == st_size)
          {
            uint64_t v12 = xpc_create_from_plist();
            if (v12)
            {
              uid_t v13 = (void *)v12;
              if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D18]) {
                uint64_t v2 = ne_session_parse_necp_drop_dest_array(v13, (uint64_t)v19);
              }
              else {
                uint64_t v2 = 22;
              }
              xpc_release(v13);
            }
            else
            {
              uint64_t v2 = 22;
            }
          }
          else
          {
            uint64_t v2 = 0;
          }
          free(v11);
        }
        else
        {
          uint64_t v2 = 55;
        }
      }
      close(v8);
    }
    if (!v2)
    {
      if (!sysctlbyname("net.necp.drop_dest_level", 0, 0, v19, 0x144uLL)) {
        return 0;
      }
      uint64_t v2 = *__error();
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint64_t v3 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = strerror(v2);
        buf.st_dev = 136315394;
        *(void *)&buf.st_mode = "ne_session_add_necp_drop_dest_from_path";
        WORD2(buf.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v16;
        int v5 = "%s: set sysctlbyname(net.necp.drop_dest_level) failed %s";
        goto LABEL_11;
      }
    }
  }
  return v2;
}

uint64_t ne_session_parse_necp_drop_dest_array(void *a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F14BF8];
  if (xpc_array_get_count(a1))
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v9 = 0x2000000000;
    char v10 = 1;
    v7[0] = MEMORY[0x1E4F14BE8];
    v7[1] = 0x40000000;
    v7[2] = __ne_session_parse_necp_drop_dest_array_block_invoke;
    v7[3] = &unk_1E598C878;
    v7[4] = &buf;
    v7[5] = a2;
    xpc_array_apply(a1, v7);
    if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = 22;
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    int v5 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "ne_session_parse_necp_drop_dest_array";
      _os_log_error_impl(&dword_19DD92000, v5, OS_LOG_TYPE_ERROR, "%s: empty array", (uint8_t *)&buf, 0xCu);
    }
    return 0;
  }
  return v4;
}

BOOL __ne_session_parse_necp_drop_dest_array_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v67 = *MEMORY[0x1E4F14BF8];
  memset(v35, 0, 40);
  if (**(_DWORD **)(a1 + 40) == 8)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v3 = ne_log_obj_log_obj;
    BOOL result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
    if (result)
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "ne_session_parse_necp_drop_dest_array_block_invoke";
      _os_log_error_impl(&dword_19DD92000, v3, OS_LOG_TYPE_ERROR, "%s: too many entries", (uint8_t *)&buf, 0xCu);
      return 0;
    }
    return result;
  }
  if (!a3 || MEMORY[0x19F3B5680](a3) != MEMORY[0x1E4F14D40])
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    int v7 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v61 = 136315138;
      v62 = "ne_parse_necp_drop_dest_dictionary";
      _os_log_error_impl(&dword_19DD92000, v7, OS_LOG_TYPE_ERROR, "%s: item is not a dictionary", v61, 0xCu);
    }
    goto LABEL_65;
  }
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x2000000000;
  int v51 = -1;
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x2000000000;
  uint64_t v47 = 0;
  uint64_t v40 = 0;
  int v41 = &v40;
  uint64_t v42 = 0x2000000000;
  int v43 = -1;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2000000000;
  char v39 = 1;
  *(void *)&long long buf = MEMORY[0x1E4F14BE8];
  *((void *)&buf + 1) = 0x40000000;
  __int16 v54 = __ne_parse_necp_drop_dest_dictionary_block_invoke;
  v55 = &unk_1E598C8A0;
  v59 = &v36;
  v60 = a3;
  v56 = &v48;
  uint64_t v57 = &v44;
  v58 = &v40;
  xpc_dictionary_apply(a3, &buf);
  if (*((unsigned char *)v37 + 24))
  {
    unsigned int v8 = *((_DWORD *)v49 + 6);
    uint64_t v9 = (const char *)v45[3];
    int v10 = *((_DWORD *)v41 + 6);
    *(_OWORD *)v52 = 0uLL;
    *(void *)&v52[21] = 0;
    *(void *)&v52[16] = 0;
    if (!v9)
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint64_t v18 = ne_log_obj_log_obj;
      if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
        goto LABEL_64;
      }
      *(_DWORD *)v61 = 136315138;
      v62 = "ne_parse_necp_drop_dest_entry";
      char v15 = "%s: address_str is NULL";
      uint64_t v16 = v18;
      uint32_t v17 = 12;
      goto LABEL_52;
    }
    if (v8 > 0xB || ((1 << v8) & 0xC1A) == 0)
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint64_t v24 = ne_log_obj_log_obj;
      if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
        goto LABEL_64;
      }
      *(_DWORD *)v61 = 136315394;
      v62 = "ne_parse_necp_drop_dest_entry";
      __int16 v63 = 1024;
      LODWORD(v64) = v8;
      char v15 = "%s: bad priority level %d";
LABEL_51:
      uint64_t v16 = v24;
      uint32_t v17 = 18;
LABEL_52:
      _os_log_error_impl(&dword_19DD92000, v16, OS_LOG_TYPE_ERROR, v15, v61, v17);
      goto LABEL_64;
    }
    int v11 = inet_pton(30, v9, &v52[9]);
    if (v11 == 1)
    {
      __int16 v19 = 7708;
    }
    else
    {
      if (v11 == -1)
      {
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        uint64_t v12 = ne_log_obj_log_obj;
        if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
          goto LABEL_64;
        }
        uid_t v13 = __error();
        pid_t v14 = strerror(*v13);
        *(_DWORD *)v61 = 136315650;
        v62 = "ne_parse_necp_drop_dest_entry";
        __int16 v63 = 2080;
        v64 = v9;
        __int16 v65 = 2080;
        v66 = v14;
        char v15 = "%s: inet_pton(AF_INET6, %s) failed %s";
        uint64_t v16 = v12;
        uint32_t v17 = 32;
        goto LABEL_52;
      }
      int v20 = inet_pton(2, v9, &v52[5]);
      if (v20 != 1)
      {
        if (v20 != -1)
        {
          if (ne_log_obj_g_init != -1) {
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          }
          uint64_t v31 = ne_log_obj_log_obj;
          if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
            goto LABEL_64;
          }
          *(_DWORD *)v61 = 136315394;
          v62 = "ne_parse_necp_drop_dest_entry";
          __int16 v63 = 2080;
          v64 = v9;
          char v15 = "%s: bad address %s";
          uint64_t v16 = v31;
          uint32_t v17 = 22;
          goto LABEL_52;
        }
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        __int16 v21 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = __error();
          uint64_t v23 = strerror(*v22);
          *(_DWORD *)v61 = 136315650;
          v62 = "ne_parse_necp_drop_dest_entry";
          __int16 v63 = 2080;
          v64 = v9;
          __int16 v65 = 2080;
          v66 = v23;
          _os_log_error_impl(&dword_19DD92000, v21, OS_LOG_TYPE_ERROR, "%s: inet_pton(AF_INET, %s) failed %s", v61, 0x20u);
        }
LABEL_39:
        v52[0] = v10;
        if ((v10 - 129) <= 0xFFFFFF7F && v52[2] == 30)
        {
          if (ne_log_obj_g_init != -1) {
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          }
          uint64_t v24 = ne_log_obj_log_obj;
          if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
            goto LABEL_64;
          }
          *(_DWORD *)v61 = 136315394;
          v62 = "ne_parse_necp_drop_dest_entry";
          __int16 v63 = 1024;
          LODWORD(v64) = v52[0];
          char v15 = "%s: bad IPv6 prefix %d";
          goto LABEL_51;
        }
        if ((v10 - 33) <= 0xFFFFFFDF && v52[2] == 2)
        {
          if (ne_log_obj_g_init != -1) {
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          }
          uint64_t v24 = ne_log_obj_log_obj;
          if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
            goto LABEL_64;
          }
          *(_DWORD *)v61 = 136315394;
          v62 = "ne_parse_necp_drop_dest_entry";
          __int16 v63 = 1024;
          LODWORD(v64) = v52[0];
          char v15 = "%s: bad IPv4 prefix %d";
          goto LABEL_51;
        }
        LODWORD(v35[0]) = v8;
        *(_OWORD *)((char *)v35 + 8) = *(_OWORD *)v52;
        *(_OWORD *)((char *)&v35[1] + 5) = *(_OWORD *)&v52[13];
        _Block_object_dispose(&v36, 8);
        _Block_object_dispose(&v40, 8);
        _Block_object_dispose(&v44, 8);
        _Block_object_dispose(&v48, 8);
        int v25 = *(unsigned int **)(a1 + 40);
        unint64_t v26 = *v25;
        if (v26)
        {
          uint64_t v27 = 0;
          int v28 = BYTE8(v35[0]);
          int v29 = (unsigned __int8 *)v25 + 13;
          BOOL v30 = 1;
          do
          {
            if (*(_DWORD *)(v29 - 9) == v8
              && *(v29 - 1) == v28
              && !memcmp(v29, (const void *)((unint64_t)v35 | 9), *v29))
            {
              break;
            }
            BOOL v30 = ++v27 < v26;
            v29 += 40;
          }
          while (v26 != v27);
          if (v30) {
            return 1;
          }
        }
        else
        {
          LODWORD(v26) = 0;
        }
        uint64_t v33 = &v25[10 * v26];
        long long v34 = v35[1];
        *(_OWORD *)(v33 + 1) = v35[0];
        *(_OWORD *)(v33 + 5) = v34;
        *(void *)(v33 + 9) = *(void *)&v35[2];
        ++**(_DWORD **)(a1 + 40);
        return 1;
      }
      __int16 v19 = 528;
    }
    *(_WORD *)&v52[1] = v19;
    goto LABEL_39;
  }
LABEL_64:
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
LABEL_65:
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  uint64_t v32 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "ne_session_parse_necp_drop_dest_array_block_invoke";
    _os_log_error_impl(&dword_19DD92000, v32, OS_LOG_TYPE_ERROR, "%s: not valid", (uint8_t *)&buf, 0xCu);
  }
  BOOL result = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __ne_parse_necp_drop_dest_dictionary_block_invoke(uint64_t a1, char *__s1)
{
  uint64_t v11 = *MEMORY[0x1E4F14BF8];
  if (!strcmp(__s1, "Level"))
  {
    xpc_object_t value = (char *)xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 64), "Level");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ne_session_get_necp_level_from_xpc_value(value);
    return 1;
  }
  if (!strcmp(__s1, "Address"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 64), "Address");
    return 1;
  }
  if (!strcmp(__s1, "Prefix"))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 64), "Prefix");
    return 1;
  }
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  uint64_t v4 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    unsigned int v8 = "ne_parse_necp_drop_dest_dictionary_block_invoke";
    __int16 v9 = 2080;
    int v10 = __s1;
    _os_log_error_impl(&dword_19DD92000, v4, OS_LOG_TYPE_ERROR, "%s: unexpected key %s", (uint8_t *)&v7, 0x16u);
  }
  uint64_t result = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  return result;
}

char *ne_session_get_necp_level_from_xpc_value(char *result)
{
  if (result)
  {
    uint64_t v1 = result;
    string_ptr = (char *)xpc_string_get_string_ptr(result);
    if (!string_ptr)
    {
      unint64_t value = xpc_int64_get_value(v1);
      if (value > 0xA) {
        return 0;
      }
      string_ptr = ne_necp_legacy_level_to_string_mapping[value];
    }
    uint64_t v4 = &ne_necp_policy_string_to_level_mapping;
    uint64_t result = "Unknown";
    while (strcasecmp(result, string_ptr))
    {
      int v5 = v4[2];
      v4 += 2;
      uint64_t result = v5;
      if (!v5) {
        return result;
      }
    }
    return (char *)*((unsigned int *)v4 + 2);
  }
  return result;
}

uint64_t ne_session_add_necp_drop_dest_from_dest_list(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v42 = *MEMORY[0x1E4F14BF8];
  int v37 = 0;
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
  if (!a1
    || MEMORY[0x19F3B5680](a1, a2, a3, a4, a5, a6, a7, a8, v17, *((void *)&v17 + 1), v18, *((void *)&v18 + 1), v19, *((void *)&v19 + 1), v20, *((void *)&v20 + 1), v21, *((void *)&v21 + 1), v22,
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
         v33) != MEMORY[0x1E4F14D18])
  {
    uint64_t v9 = 22;
LABEL_4:
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    int v10 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      return v9;
    }
    char v15 = __error();
    uint64_t v16 = strerror(*v15);
    *(_DWORD *)long long buf = 136315394;
    char v39 = "ne_session_add_necp_drop_dest_from_dest_list";
    __int16 v40 = 2080;
    int v41 = v16;
    pid_t v14 = "%s: failed %s";
LABEL_15:
    _os_log_error_impl(&dword_19DD92000, v10, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);
    return v9;
  }
  uint64_t v9 = ne_session_parse_necp_drop_dest_array(a1, (uint64_t)&v17);
  if (v9) {
    goto LABEL_4;
  }
  if (!sysctlbyname("net.necp.drop_dest_level", 0, 0, &v17, 0x144uLL)) {
    return 0;
  }
  uint64_t v9 = *__error();
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  int v10 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = __error();
    uid_t v13 = strerror(*v12);
    *(_DWORD *)long long buf = 136315394;
    char v39 = "ne_session_add_necp_drop_dest_from_dest_list";
    __int16 v40 = 2080;
    int v41 = v13;
    pid_t v14 = "%s: set sysctlbyname(net.necp.drop_dest_level) failed %s";
    goto LABEL_15;
  }
  return v9;
}

uint64_t ne_session_initialize_necp_drop_dest()
{
  uint64_t v0 = 0;
  uint64_t v41 = *MEMORY[0x1E4F14BF8];
  LODWORD(v39) = 0;
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
  uint64_t v1 = "/var/mobile/Library/terminus/com.apple.necp_drop_dest.plist";
  uint64_t v2 = &off_1E598C538;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v3 = MEMORY[0x1E4F14D18];
  do
  {
    int v4 = open(v1, 0, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35,
           v36,
           v37,
           v38,
           v39);
    if (v4 != -1)
    {
      int v5 = v4;
      memset(&v40, 0, sizeof(v40));
      if (fstat(v4, &v40)) {
        off_t st_size = 0;
      }
      else {
        off_t st_size = v40.st_size;
      }
      if ((unint64_t)(st_size - 1) > 0x27FE)
      {
        if (st_size <= 0) {
          uint64_t v0 = v0;
        }
        else {
          uint64_t v0 = 27;
        }
      }
      else
      {
        int v7 = malloc_type_malloc(st_size, 0x89CDE578uLL);
        if (v7)
        {
          unsigned int v8 = v7;
          if (pread(v5, v7, st_size, 0) == st_size)
          {
            uint64_t v9 = xpc_create_from_plist();
            if (v9)
            {
              int v10 = (void *)v9;
              if (MEMORY[0x19F3B5680]() == v3) {
                uint64_t v0 = ne_session_parse_necp_drop_dest_array(v10, (uint64_t)&v19);
              }
              else {
                uint64_t v0 = 22;
              }
              xpc_release(v10);
            }
            else
            {
              uint64_t v0 = 22;
            }
          }
          free(v8);
        }
        else
        {
          uint64_t v0 = 55;
        }
      }
      close(v5);
    }
    uint64_t v11 = *v2++;
    uint64_t v1 = v11;
  }
  while (v11);
  if (v0)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v12 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      uid_t v13 = __error();
      pid_t v14 = strerror(*v13);
      v40.st_dev = 136315394;
      *(void *)&v40.st_mode = "ne_session_initialize_necp_drop_dest";
      WORD2(v40.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v40.st_ino + 6) = (__darwin_ino64_t)v14;
      char v15 = "%s: failed %s";
LABEL_32:
      _os_log_error_impl(&dword_19DD92000, v12, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v40, 0x16u);
    }
  }
  else
  {
    if (!sysctlbyname("net.necp.drop_dest_level", 0, 0, &v19, 0x144uLL)) {
      return 0;
    }
    uint64_t v0 = *__error();
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v12 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = __error();
      long long v17 = strerror(*v16);
      v40.st_dev = 136315394;
      *(void *)&v40.st_mode = "ne_session_initialize_necp_drop_dest";
      WORD2(v40.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v40.st_ino + 6) = (__darwin_ino64_t)v17;
      char v15 = "%s: set sysctlbyname(net.necp.drop_dest_level) failed %s";
      goto LABEL_32;
    }
  }
  return v0;
}

void *necp_drop_dest_copy_dest_entry_list()
{
  uint64_t v35 = *MEMORY[0x1E4F14BF8];
  int v24 = 0;
  memset(v23, 0, sizeof(v23));
  size_t v22 = 0;
  if (sysctlbyname("net.necp.drop_dest_level", 0, &v22, 0, 0))
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v0 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    goto LABEL_40;
  }
  size_t v22 = 324;
  if (!sysctlbyname("net.necp.drop_dest_level", v23, &v22, 0, 0))
  {
    xpc_object_t v3 = xpc_array_create(0, 0);
    if (!v3)
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint64_t v0 = ne_log_obj_log_obj;
      if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      pid_t v14 = __error();
      char v15 = strerror(*v14);
      *(_DWORD *)string = 136315394;
      long long v32 = "necp_drop_dest_copy_dest_entry_list";
      __int16 v33 = 2080;
      long long v34 = v15;
      uint64_t v16 = "%s: xpc_array_create() failed %s";
      goto LABEL_41;
    }
    uint64_t v1 = v3;
    uint64_t v4 = 0;
    while (1)
    {
      xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
      if (!v5)
      {
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        long long v17 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
        {
          long long v20 = __error();
          long long v21 = strerror(*v20);
          *(_DWORD *)long long buf = 136315394;
          long long v26 = "necp_drop_dest_copy_dest_entry_list";
          __int16 v27 = 2080;
          *(void *)long long v28 = v21;
          _os_log_error_impl(&dword_19DD92000, v17, OS_LOG_TYPE_ERROR, "%s: xpc_dictionary_create() failed %s", buf, 0x16u);
        }
        xpc_release(v1);
        return 0;
      }
      uint64_t v6 = v5;
      int v7 = (char *)v23 + v4;
      int v8 = *((unsigned __int8 *)v23 + v4 + 14);
      if (v8 == 30)
      {
        if (v7[13] != 28) {
          goto LABEL_27;
        }
        inet_ntop(30, (char *)&v23[1] + v4 + 5, string, 0x2Eu);
        xpc_object_t xpc_string_from_necp_level = ne_session_create_xpc_string_from_necp_level(*((_DWORD *)v7 + 1));
        xpc_dictionary_set_value(v6, "Level", xpc_string_from_necp_level);
        xpc_release(xpc_string_from_necp_level);
        xpc_dictionary_set_int64(v6, "Prefix", v7[12]);
        xpc_dictionary_set_string(v6, "Address", string);
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        int v10 = ne_log_obj_log_obj;
        if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_INFO)) {
          goto LABEL_27;
        }
      }
      else
      {
        if (v8 != 2 || v7[13] != 16) {
          goto LABEL_27;
        }
        inet_ntop(2, (char *)&v23[1] + v4 + 1, string, 0x2Eu);
        xpc_object_t v9 = ne_session_create_xpc_string_from_necp_level(*((_DWORD *)v7 + 1));
        xpc_dictionary_set_value(v6, "Level", v9);
        xpc_release(v9);
        xpc_dictionary_set_int64(v6, "Prefix", v7[12]);
        xpc_dictionary_set_string(v6, "Address", string);
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        int v10 = ne_log_obj_log_obj;
        if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_INFO)) {
          goto LABEL_27;
        }
      }
      int v12 = *((_DWORD *)v7 + 1);
      int v13 = v7[12];
      *(_DWORD *)long long buf = 136315906;
      long long v26 = "necp_drop_dest_copy_dest_entry_list";
      __int16 v27 = 1024;
      *(_DWORD *)long long v28 = v12;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = v13;
      __int16 v29 = 2080;
      long long v30 = string;
      _os_log_impl(&dword_19DD92000, v10, OS_LOG_TYPE_INFO, "%s: level %u prefix %u address %s", buf, 0x22u);
LABEL_27:
      if (xpc_dictionary_get_count(v6)) {
        xpc_array_append_value(v1, v6);
      }
      xpc_release(v6);
      v4 += 40;
      if (v4 == 320) {
        return v1;
      }
    }
  }
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  uint64_t v0 = ne_log_obj_log_obj;
  if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
    return 0;
  }
LABEL_40:
  long long v18 = __error();
  long long v19 = strerror(*v18);
  *(_DWORD *)string = 136315394;
  long long v32 = "necp_drop_dest_copy_dest_entry_list";
  __int16 v33 = 2080;
  long long v34 = v19;
  uint64_t v16 = "%s: sysctlbyname(net.necp.drop_dest_level) failed %s";
LABEL_41:
  _os_log_error_impl(&dword_19DD92000, v0, OS_LOG_TYPE_ERROR, v16, (uint8_t *)string, 0x16u);
  return 0;
}

xpc_object_t ne_session_create_xpc_string_from_necp_level(unsigned int a1)
{
  if (a1 > 0xB) {
    return xpc_string_create("Unknown");
  }
  if (LODWORD((&ne_necp_policy_string_to_level_mapping)[2 * a1 + 1]) != a1)
  {
    if (a1)
    {
      for (uint64_t i = &dword_1E598C8D8; ; i += 4)
      {
        uint64_t v1 = (const char *)*((void *)i - 1);
        if (!v1) {
          break;
        }
        int v4 = *i;
        if (v4 == a1) {
          return xpc_string_create(v1);
        }
      }
    }
    return xpc_string_create("Unknown");
  }
  uint64_t v1 = (&ne_necp_policy_string_to_level_mapping)[2 * a1];
  return xpc_string_create(v1);
}

BOOL check_alf_plist_if_enabled()
{
  int v0 = open("/Library/Preferences/com.apple.alf.plist", 0);
  if (v0 == -1) {
    return 0;
  }
  int v1 = v0;
  memset(&v11, 0, sizeof(v11));
  if (fstat(v0, &v11)) {
    off_t st_size = 0;
  }
  else {
    off_t st_size = v11.st_size;
  }
  if ((unint64_t)(st_size - 1) <= 0x18FFE && (xpc_object_t v3 = malloc_type_malloc(st_size, 0xDBEFE944uLL)) != 0)
  {
    int v4 = v3;
    if (pread(v1, v3, st_size, 0) == st_size && (xpc_object_t v5 = (void *)xpc_create_from_plist()) != 0)
    {
      uint64_t v6 = v5;
      xpc_object_t value = xpc_dictionary_get_value(v5, "enable_drop_all");
      BOOL v9 = value
        && xpc_int64_get_value(value)
        && (xpc_object_t v8 = xpc_dictionary_get_value(v6, "globalstate")) != 0
        && xpc_int64_get_value(v8) != 0;
      xpc_release(v6);
    }
    else
    {
      BOOL v9 = 0;
    }
    free(v4);
  }
  else
  {
    BOOL v9 = 0;
  }
  close(v1);
  return v9;
}

uint64_t ne_session_initialize_necp_drop_all()
{
  int v0 = open("/Library/Preferences/com.apple.networkextension.necp.plist", 0);
  if (v0 == -1) {
    return ne_session_initialize_necp_drop_dest();
  }
  int v1 = v0;
  memset(&v12, 0, sizeof(v12));
  if (fstat(v0, &v12)) {
    off_t st_size = 0;
  }
  else {
    off_t st_size = v12.st_size;
  }
  if ((unint64_t)(st_size - 1) > 0x27FE)
  {
    if (st_size <= 0) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = 27;
    }
  }
  else
  {
    xpc_object_t v3 = malloc_type_malloc(st_size, 0x3029F0BBuLL);
    if (v3)
    {
      int v4 = v3;
      if (pread(v1, v3, st_size, 0) == st_size)
      {
        xpc_object_t v5 = (void *)xpc_create_from_plist();
        if (v5)
        {
          uint64_t v6 = v5;
          xpc_object_t value = (char *)xpc_dictionary_get_value(v5, "drop_all_level");
          if (value)
          {
            necp_level_from_xpc_xpc_object_t value = ne_session_get_necp_level_from_xpc_value(value);
            if (!necp_level_from_xpc_value) {
              necp_level_from_xpc_xpc_object_t value = check_alf_plist_if_enabled();
            }
            uint64_t v8 = sysctlbyname("net.necp.drop_all_level", 0, 0, &necp_level_from_xpc_value, 4uLL);
          }
          else
          {
            uint64_t v8 = 22;
          }
          xpc_release(v6);
        }
        else
        {
          uint64_t v8 = 22;
        }
      }
      else
      {
        uint64_t v8 = 0;
      }
      free(v4);
    }
    else
    {
      uint64_t v8 = 55;
    }
  }
  close(v1);
  uint64_t v9 = ne_session_initialize_necp_drop_dest();
  if (!v8) {
    return v9;
  }
  return v8;
}

unsigned __int8 *ne_session_copy_policy_match(const char *a1, char *__s, const char *a3, const unsigned __int8 *a4, _OWORD *a5, int a6, int a7, int a8, int a9)
{
  uint64_t v46 = *MEMORY[0x1E4F14BF8];
  if (__s)
  {
    size_t v15 = strlen(__s) + 48;
    if (!a1) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  size_t v15 = 42;
  if (a1) {
LABEL_3:
  }
    v15 += strlen(a1) + 6;
LABEL_4:
  if (a3) {
    v15 += strlen(a3) + 6;
  }
  size_t v16 = v15 + 9;
  if (!a6) {
    size_t v16 = v15;
  }
  if (a7) {
    v16 += 9;
  }
  if (a8) {
    v16 += 7;
  }
  if (a9) {
    size_t v17 = v16 + 9;
  }
  else {
    size_t v17 = v16;
  }
  long long v18 = (char *)malloc_type_malloc(v17, 0x3578CCD1uLL);
  if (!v18) {
    return 0;
  }
  long long v19 = v18;
  bzero(v18, v17);
  *long long v19 = 1;
  *(_DWORD *)(v19 + 1) = 16;
  *(_OWORD *)(v19 + 5) = *(_OWORD *)a4;
  v19[21] = 2;
  *(_DWORD *)(v19 + 22) = 16;
  *(_OWORD *)(v19 + 26) = *a5;
  if (!__s)
  {
    uint64_t v22 = (uint64_t)(v19 + 42);
    if (!a1) {
      goto LABEL_29;
    }
    goto LABEL_25;
  }
  int v20 = strlen(__s);
  v19[42] = 4;
  size_t v21 = (v20 + 1);
  *(_DWORD *)(v19 + 43) = v21;
  if (v20 == -1) {
    size_t v21 = 0;
  }
  else {
    memcpy(v19 + 47, __s, v21);
  }
  uint64_t v22 = (uint64_t)&v19[v21 + 47];
  if (a1)
  {
LABEL_25:
    int v23 = strlen(a1);
    *(unsigned char *)uint64_t v22 = 3;
    size_t v24 = (v23 + 1);
    *(_DWORD *)(v22 + 1) = v24;
    if (v23 == -1) {
      size_t v24 = 0;
    }
    else {
      memcpy((void *)(v22 + 5), a1, v24);
    }
    v22 += v24 + 5;
  }
LABEL_29:
  if (a3)
  {
    int v25 = strlen(a3);
    *(unsigned char *)uint64_t v22 = 9;
    size_t v26 = (v25 + 1);
    *(_DWORD *)(v22 + 1) = v26;
    if (v25 == -1) {
      size_t v26 = 0;
    }
    else {
      memcpy((void *)(v22 + 5), a3, v26);
    }
    v22 += v26 + 5;
  }
  if (a6)
  {
    *(unsigned char *)uint64_t v22 = 6;
    *(_DWORD *)(v22 + 1) = 4;
    *(_DWORD *)(v22 + 5) = a6;
    v22 += 9;
  }
  if (a7)
  {
    *(unsigned char *)uint64_t v22 = 7;
    *(_DWORD *)(v22 + 1) = 4;
    *(_DWORD *)(v22 + 5) = a7;
    v22 += 9;
  }
  if (a8)
  {
    *(unsigned char *)uint64_t v22 = 11;
    *(_DWORD *)(v22 + 1) = 2;
    *(_WORD *)(v22 + 5) = a8;
    v22 += 7;
  }
  if (a9)
  {
    *(unsigned char *)uint64_t v22 = 10;
    *(_DWORD *)(v22 + 1) = 4;
    *(_DWORD *)(v22 + 5) = a9;
  }
  __int16 v27 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x1CCuLL, 0x1000040E72E3491uLL);
  int matched = necp_match_policy();
  free(v19);
  if (matched || !*(_DWORD *)v27 && !*((_DWORD *)v27 + 2) && !*((_DWORD *)v27 + 4))
  {
    free(v27);
    nelog_is_info_logging_enabled();
    return 0;
  }
  if (nelog_is_info_logging_enabled() && *((_DWORD *)v27 + 10) == 2)
  {
    memset(uu, 0, sizeof(uu));
    memset(out, 0, 37);
    memset(v43, 0, 37);
    uuid_clear(uu);
    uuid_copy(uu, v27 + 20);
    uuid_unparse(uu, out);
    uuid_unparse(a4, v43);
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    long long v30 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_INFO))
    {
      long long v36 = v43;
      long long v31 = "";
      *(_DWORD *)long long buf = 136315906;
      if (a1) {
        long long v32 = a1;
      }
      else {
        long long v32 = "";
      }
      if (__s) {
        long long v31 = __s;
      }
      __int16 v37 = 2080;
      long long v38 = v32;
      __int16 v39 = 2080;
      stat v40 = v31;
      __int16 v41 = 2080;
      uint64_t v42 = out;
      _os_log_impl(&dword_19DD92000, v30, OS_LOG_TYPE_INFO, "App %s, domain=%s, account=%s matched policy for service %s", buf, 0x2Au);
    }
  }
  return v27;
}

uint64_t ne_session_policy_match_get_service_type(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 40);
  }
  return result;
}

uint64_t ne_session_policy_match_get_service(uint64_t a1, uuid_t dst)
{
  if (a1) {
    BOOL v2 = dst == 0;
  }
  else {
    BOOL v2 = 1;
  }
  uint64_t v3 = !v2;
  if (!v2) {
    uuid_copy(dst, (const unsigned __int8 *)(a1 + 20));
  }
  return v3;
}

_DWORD *ne_session_policy_match_is_flow_divert(_DWORD *result)
{
  if (result) {
    return (_DWORD *)(*result == 4);
  }
  return result;
}

_DWORD *ne_session_policy_match_get_flow_divert_unit(_DWORD *result)
{
  if (result)
  {
    if (*result == 4) {
      return (_DWORD *)result[1];
    }
    else {
      return 0;
    }
  }
  return result;
}

_DWORD *ne_session_policy_match_is_drop(_DWORD *result)
{
  if (result) {
    return (_DWORD *)(*result == 3);
  }
  return result;
}

uint64_t ne_session_policy_match_get_filter_unit(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

uint64_t ne_session_policy_match_get_service_action()
{
  return 0;
}

uint64_t ne_session_policy_match_service_is_registered(uint64_t result)
{
  if (result) {
    return *(unsigned char *)(result + 36) & 1;
  }
  return result;
}

_DWORD *ne_session_policy_match_get_scoped_interface_index(_DWORD *result)
{
  if (result)
  {
    if (*result == 12 || *result == 6) {
      return (_DWORD *)result[1];
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t nehelper_queue()
{
  if (globals_init_sess_init != -1) {
    dispatch_once(&globals_init_sess_init, &__block_literal_global_175);
  }
  return g_queue;
}

void __nehelper_copy_connection_for_delegate_class_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F14BF8];
  if (a2)
  {
    if (MEMORY[0x19F3B5680](a2) == MEMORY[0x1E4F14D58])
    {
      if (a2 == MEMORY[0x1E4F14CF8])
      {
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        stat v11 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = *(void *)(a1 + 32);
          int v14 = 134217984;
          uint64_t v15 = v12;
          _os_log_impl(&dword_19DD92000, v11, OS_LOG_TYPE_DEFAULT, "nehelper connection for delegate class %llu was interrupted", (uint8_t *)&v14, 0xCu);
        }
      }
      else
      {
        os_unfair_lock_lock((os_unfair_lock_t)&nehelper_copy_connection_for_delegate_class_g_connection_cache_lock);
        uint64_t v8 = (void *)nehelper_copy_connection_for_delegate_class_g_connection_cache[*(void *)(a1 + 32)];
        if (*(void **)(a1 + 40) == v8)
        {
          if (ne_log_obj_g_init != -1) {
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          }
          uint64_t v9 = ne_log_obj_log_obj;
          if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = *(void *)(a1 + 32);
            int v14 = 134217984;
            uint64_t v15 = v10;
            _os_log_impl(&dword_19DD92000, v9, OS_LOG_TYPE_DEFAULT, "nehelper connection for delegate class %llu received XPC_ERROR_CONNECTION_INVALID", (uint8_t *)&v14, 0xCu);
          }
          nehelper_copy_connection_for_delegate_class_g_connection_cache[*(void *)(a1 + 32)] = 0;
          xpc_release(v8);
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&nehelper_copy_connection_for_delegate_class_g_connection_cache_lock);
      }
    }
    else
    {
      int v4 = (void *)MEMORY[0x19F3B54A0](a2);
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      xpc_object_t v5 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        int v14 = 134218242;
        uint64_t v15 = v13;
        __int16 v16 = 2080;
        size_t v17 = v4;
        _os_log_error_impl(&dword_19DD92000, v5, OS_LOG_TYPE_ERROR, "nehelper connection for delegate class %llu received unknown message: %s", (uint8_t *)&v14, 0x16u);
      }
      free(v4);
    }
  }
  else
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v6 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v14 = 134217984;
      uint64_t v15 = v7;
      _os_log_error_impl(&dword_19DD92000, v6, OS_LOG_TYPE_ERROR, "nehelper connection for delegate class %llu received a NULL message", (uint8_t *)&v14, 0xCu);
    }
  }
}

uint64_t ne_session_address_matches_subnets(uint64_t a1, void *a2)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    uint64_t v5 = MEMORY[0x19F3B5680](a2);
    uint64_t v6 = MEMORY[0x1E4F14D40];
    if (v5 != MEMORY[0x1E4F14D40]) {
      return 0;
    }
    int v7 = *(unsigned __int8 *)(a1 + 1);
    if (v7 == 2)
    {
      uint64_t v8 = "ipv4-subnets";
    }
    else
    {
      if (v7 != 30) {
        return 0;
      }
      uint64_t v8 = "ipv6-subnets";
    }
    uint64_t result = (uint64_t)xpc_dictionary_get_value(a2, v8);
    if (result)
    {
      uint64_t v9 = (void *)result;
      if (MEMORY[0x19F3B5680]() != v6) {
        return 0;
      }
      xpc_object_t value = xpc_dictionary_get_value(v9, "subnet-addresses");
      xpc_object_t v11 = xpc_dictionary_get_value(v9, "subnet-masks");
      if (!value) {
        return 0;
      }
      uint64_t v12 = v11;
      uint64_t v13 = MEMORY[0x19F3B5680](value);
      uint64_t v14 = MEMORY[0x1E4F14D18];
      if (v13 != MEMORY[0x1E4F14D18]) {
        return 0;
      }
      if (v12)
      {
        if (MEMORY[0x19F3B5680](v12) != v14) {
          return 0;
        }
        size_t count = xpc_array_get_count(value);
        if (count != xpc_array_get_count(v12)) {
          return 0;
        }
      }
      else
      {
        size_t count = xpc_array_get_count(value);
      }
      if (!count) {
        return 0;
      }
      size_t v16 = 0;
      size_t v17 = (int8x16_t *)(a1 + 8);
      do
      {
        size_t length = 0;
        int v18 = *(unsigned __int8 *)(a1 + 1);
        if (v18 == 30)
        {
          data = (int8x16_t *)xpc_array_get_data(value, v16, &length);
          if (!data || length < 0x10) {
            goto LABEL_43;
          }
          int v23 = data;
          if (v12)
          {
            size_t v24 = (int8x16_t *)xpc_array_get_data(v12, v16, &length);
            if (!v24 || length <= 0xF) {
              goto LABEL_43;
            }
            int8x16_t v27 = vandq_s8(*v23, *v24);
            uint64_t v26 = v27.i64[1];
            uint64_t v25 = v27.i64[0];
            int8x16_t v30 = vandq_s8(*v17, *v24);
            uint64_t v29 = v30.i64[1];
            uint64_t v28 = v30.i64[0];
          }
          else
          {
            uint64_t v25 = data->i64[0];
            uint64_t v26 = data->i64[1];
            uint64_t v28 = v17->i64[0];
            uint64_t v29 = *(void *)(a1 + 16);
          }
          if (v25 == v28 && v26 == v29) {
            return 1;
          }
        }
        else if (v18 == 2)
        {
          long long v19 = xpc_array_get_data(value, v16, &length);
          if (v19)
          {
            if (length >= 4)
            {
              int v20 = v19;
              if (v12)
              {
                size_t v21 = xpc_array_get_data(v12, v16, &length);
                if (v21 && length >= 4 && ((*(_DWORD *)(a1 + 4) ^ *v20) & *v21) == 0) {
                  return 1;
                }
              }
              else if (*v19 == *(_DWORD *)(a1 + 4))
              {
                return 1;
              }
            }
          }
        }
LABEL_43:
        uint64_t result = 0;
        ++v16;
      }
      while (count != v16);
    }
  }
  return result;
}

BOOL ne_session_service_matches_address_for_interface(const unsigned __int8 *a1, int a2, uint64_t a3, const char *a4, char *a5, unsigned char *a6)
{
  if (a6) {
    *a6 = 0;
  }
  BOOL v12 = 0;
  if (a3 && a4)
  {
    int v13 = *(unsigned __int8 *)(a3 + 1);
    BOOL v14 = v13 == 30 || v13 == 2;
    if (v14 && (a2 - 3) >= 0xFFFFFFFE)
    {
      os_unfair_lock_lock(&_ne_session_cache_lock);
      xpc_object_t v15 = ne_session_copy_cached_values_locked();
      if (v15)
      {
        size_t v16 = v15;
        xpc_object_t session_dict_from_cache = ne_session_get_session_dict_from_cache(v15, a1, a2);
        domain_dict_from_session_dict = ne_session_get_domain_dict_from_session_dict(session_dict_from_cache, a5, a4);
        uint64_t v19 = MEMORY[0x1E4F14D40];
        if (domain_dict_from_session_dict
          && (int v20 = domain_dict_from_session_dict, MEMORY[0x19F3B5680]() == v19)
          && xpc_dictionary_get_BOOL(v20, "service-probe-failed")
          || (xpc_object_t v21 = xpc_dictionary_get_value(v16, "redirected-addresses")) != 0
          && (uint64_t v22 = v21, MEMORY[0x19F3B5680]() == v19)
          && (xpc_object_t v23 = xpc_dictionary_get_value(v22, a4), ne_session_address_matches_subnets(a3, v23)))
        {
          BOOL v12 = 1;
          if (a6) {
            *a6 = 1;
          }
        }
        else
        {
          BOOL v12 = 0;
          if (a2 == 1)
          {
            if (session_dict_from_cache)
            {
              if (MEMORY[0x19F3B5680](session_dict_from_cache) == v19)
              {
                xpc_object_t value = xpc_dictionary_get_value(session_dict_from_cache, "included-routes");
                if (ne_session_address_matches_subnets(a3, value))
                {
                  xpc_object_t v25 = xpc_dictionary_get_value(session_dict_from_cache, "excluded-routes");
                  if (!ne_session_address_matches_subnets(a3, v25)) {
                    BOOL v12 = 1;
                  }
                }
              }
            }
          }
        }
        xpc_release(v16);
      }
      else
      {
        BOOL v12 = 0;
      }
      os_unfair_lock_unlock(&_ne_session_cache_lock);
    }
    else
    {
      return 0;
    }
  }
  return v12;
}

xpc_object_t ne_session_copy_cached_values_locked()
{
  if (globals_init_sess_init != -1) {
    dispatch_once(&globals_init_sess_init, &__block_literal_global_175);
  }
  os_unfair_lock_assert_owner(&_ne_session_cache_lock);
  if (_ne_session_cache_notify_token == -1) {
    notify_register_dispatch("com.apple.networkextension.ondemandcachechanged", &_ne_session_cache_notify_token, (dispatch_queue_t)g_queue, &__block_literal_global_219);
  }
  int v0 = (void *)_ne_session_master_cache;
  if (_ne_session_master_cache) {
    return xpc_retain(v0);
  }
  os_unfair_lock_unlock(&_ne_session_cache_lock);
  uint64_t v3 = dispatch_semaphore_create(0);
  v4[0] = MEMORY[0x1E4F14BE8];
  v4[1] = 0x40000000;
  v4[2] = __ne_session_copy_cached_values_locked_block_invoke_3;
  v4[3] = &__block_descriptor_tmp_223;
  v4[4] = v3;
  ne_session_update_cached_values((uint64_t)v4);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v3);
  os_unfair_lock_lock(&_ne_session_cache_lock);
  uint64_t v1 = 0;
  int v0 = (void *)_ne_session_master_cache;
  if (_ne_session_master_cache) {
    return xpc_retain(v0);
  }
  return (xpc_object_t)v1;
}

xpc_object_t ne_session_get_session_dict_from_cache(void *a1, const unsigned __int8 *a2, int a3)
{
  uint64_t v14 = *MEMORY[0x1E4F14BF8];
  uint64_t v6 = MEMORY[0x19F3B5680]();
  uint64_t v7 = MEMORY[0x1E4F14D40];
  if (v6 != MEMORY[0x1E4F14D40]) {
    return 0;
  }
  xpc_object_t result = xpc_dictionary_get_value(a1, "services");
  if (result)
  {
    uint64_t v9 = result;
    if (MEMORY[0x19F3B5680]() != v7) {
      return 0;
    }
    memset(v13, 0, sizeof(v13));
    uuid_unparse(a2, v13);
    xpc_object_t value = xpc_dictionary_get_value(v9, v13);
    if (!value) {
      return 0;
    }
    xpc_object_t v11 = value;
    if (MEMORY[0x19F3B5680]() != v7) {
      return 0;
    }
    if ((a3 - 1) >= 9) {
      BOOL v12 = "<unknown>";
    }
    else {
      BOOL v12 = off_1E598CBA8[a3 - 1];
    }
    return xpc_dictionary_get_value(v11, v12);
  }
  return result;
}

void *ne_session_get_domain_dict_from_session_dict(void *a1, char *a2, const char *a3)
{
  if (!a2) {
    return 0;
  }
  int v4 = 0;
  if (!a1 || !*a2) {
    return v4;
  }
  uint64_t v7 = MEMORY[0x19F3B5680](a1);
  uint64_t v8 = MEMORY[0x1E4F14D40];
  if (v7 != MEMORY[0x1E4F14D40]) {
    return 0;
  }
  xpc_object_t value = xpc_dictionary_get_value(a1, a3);
  if (!value) {
    return 0;
  }
  xpc_object_t v11 = value;
  if (MEMORY[0x19F3B5680]() != v8) {
    return 0;
  }
  xpc_object_t v12 = xpc_dictionary_get_value(v11, "service-domain-info");
  if (!v12) {
    return 0;
  }
  int v13 = v12;
  uint64_t v14 = MEMORY[0x19F3B5680]();
  uint64_t v15 = MEMORY[0x1E4F14D18];
  if (v14 != MEMORY[0x1E4F14D18]) {
    return 0;
  }
  size_t count = xpc_array_get_count(v13);
  if (!count) {
    return 0;
  }
  size_t v17 = count;
  size_t v18 = 0;
  while (1)
  {
    xpc_object_t v19 = xpc_array_get_value(v13, v18);
    if (v19)
    {
      int v4 = v19;
      if (MEMORY[0x19F3B5680]() == v8)
      {
        xpc_object_t v20 = xpc_dictionary_get_value(v4, "service-domains");
        if (v20)
        {
          xpc_object_t v21 = v20;
          if (MEMORY[0x19F3B5680]() == v15)
          {
            size_t v22 = xpc_array_get_count(v21);
            if (v22) {
              break;
            }
          }
        }
      }
    }
LABEL_15:
    int v4 = 0;
    if (++v18 == v17) {
      return v4;
    }
  }
  size_t v23 = v22;
  size_t v24 = 0;
  while (1)
  {
    string = xpc_array_get_string(v21, v24);
    if (string)
    {
      if (strstr(a2, string)) {
        return v4;
      }
    }
    if (v23 == ++v24) {
      goto LABEL_15;
    }
  }
}

intptr_t __ne_session_copy_cached_values_locked_block_invoke_3(uint64_t a1, void *a2)
{
  os_unfair_lock_lock(&_ne_session_cache_lock);
  if (_ne_session_master_cache)
  {
    xpc_release((xpc_object_t)_ne_session_master_cache);
    _ne_session_master_cache = 0;
  }
  if (a2 && MEMORY[0x19F3B5680](a2) == MEMORY[0x1E4F14D40]) {
    _ne_session_master_cache = (uint64_t)xpc_retain(a2);
  }
  os_unfair_lock_unlock(&_ne_session_cache_lock);
  int v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

void ne_session_update_cached_values(uint64_t a1)
{
  BOOL v2 = nehelper_copy_connection_for_delegate_class(1uLL);
  if (v2)
  {
    uint64_t v3 = v2;
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    if (v4)
    {
      uint64_t v5 = v4;
      xpc_dictionary_set_uint64(v4, "delegate-class-id", 1uLL);
      xpc_dictionary_set_uint64(v5, "cache-command", 1uLL);
      handler[0] = MEMORY[0x1E4F14BE8];
      handler[1] = 0x40000000;
      handler[2] = __ne_session_update_cached_values_block_invoke;
      handler[3] = &unk_1E598CA60;
      handler[4] = a1;
      xpc_connection_send_message_with_reply(v3, v5, (dispatch_queue_t)g_queue, handler);
      xpc_release(v5);
    }
    xpc_release(v3);
  }
}

uint64_t __ne_session_update_cached_values_block_invoke(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x19F3B5680](a2) == MEMORY[0x1E4F14D40]) {
    xpc_dictionary_get_value(a2, "result-data");
  }
  xpc_object_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

void __ne_session_copy_cached_values_locked_block_invoke(uint64_t a1, int a2)
{
  os_unfair_lock_lock(&_ne_session_cache_lock);
  int v3 = _ne_session_cache_notify_token;
  os_unfair_lock_unlock(&_ne_session_cache_lock);
  if (v3 == a2)
  {
    ne_session_update_cached_values((uint64_t)&__block_literal_global_222);
  }
}

void __ne_session_copy_cached_values_locked_block_invoke_2(uint64_t a1, void *a2)
{
  os_unfair_lock_lock(&_ne_session_cache_lock);
  if (_ne_session_master_cache)
  {
    xpc_release((xpc_object_t)_ne_session_master_cache);
    _ne_session_master_cache = 0;
  }
  if (a2 && MEMORY[0x19F3B5680](a2) == MEMORY[0x1E4F14D40]) {
    _ne_session_master_cache = (uint64_t)xpc_retain(a2);
  }

  os_unfair_lock_unlock(&_ne_session_cache_lock);
}

uint64_t ne_session_service_matches_address(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a5) {
    *a5 = 0;
  }
  return 0;
}

int64_t ne_session_service_get_dns_service_id_for_interface(const unsigned __int8 *a1, int a2, char *a3, const char *a4)
{
  int64_t int64 = 0;
  if (a2 == 1 && a4)
  {
    os_unfair_lock_lock(&_ne_session_cache_lock);
    xpc_object_t v8 = ne_session_copy_cached_values_locked();
    if (v8)
    {
      uint64_t v9 = v8;
      xpc_object_t session_dict_from_cache = ne_session_get_session_dict_from_cache(v8, a1, 1);
      domain_dict_from_session_dict = ne_session_get_domain_dict_from_session_dict(session_dict_from_cache, a3, a4);
      if (domain_dict_from_session_dict
        && (xpc_object_t v12 = domain_dict_from_session_dict, MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40]))
      {
        int64_t int64 = xpc_dictionary_get_int64(v12, "service-dns-service");
      }
      else
      {
        int64_t int64 = 0;
      }
      os_unfair_lock_unlock(&_ne_session_cache_lock);
      xpc_release(v9);
    }
    else
    {
      os_unfair_lock_unlock(&_ne_session_cache_lock);
      return 0;
    }
  }
  return int64;
}

xpc_object_t ne_session_service_copy_cached_match_domains(const unsigned __int8 *a1, int a2)
{
  if (a2 != 1) {
    return 0;
  }
  os_unfair_lock_lock(&_ne_session_cache_lock);
  xpc_object_t v3 = ne_session_copy_cached_values_locked();
  if (!v3)
  {
    os_unfair_lock_unlock(&_ne_session_cache_lock);
    return 0;
  }
  xpc_object_t v4 = v3;
  xpc_object_t session_dict_from_cache = ne_session_get_session_dict_from_cache(v3, a1, 1);
  xpc_object_t v6 = session_dict_from_cache;
  if (session_dict_from_cache)
  {
    if (MEMORY[0x19F3B5680](session_dict_from_cache) == MEMORY[0x1E4F14D40])
    {
      xpc_object_t value = xpc_dictionary_get_value(v6, "match-domains");
      xpc_object_t v6 = value;
      if (!value) {
        goto LABEL_6;
      }
      if (MEMORY[0x19F3B5680](value) == MEMORY[0x1E4F14D18])
      {
        xpc_object_t v6 = xpc_retain(v6);
        goto LABEL_6;
      }
    }
    xpc_object_t v6 = 0;
  }
LABEL_6:
  os_unfair_lock_unlock(&_ne_session_cache_lock);
  xpc_release(v4);
  return v6;
}

uint64_t ne_session_service_get_dns_service_id()
{
  return 0;
}

uint64_t ne_session_copy_socket_attributes(int a1, void **a2, void **a3)
{
  uint64_t v19 = *MEMORY[0x1E4F14BF8];
  socklen_t v17 = 256;
  if (a1 == -1) {
    return 0;
  }
  if ((unint64_t)a2 | (unint64_t)a3)
  {
    if (!getsockopt(a1, 0xFFFF, 4361, v18, &v17))
    {
      if (a2 && v17)
      {
        uint64_t v7 = 0;
        int v8 = 0;
        while (1)
        {
          uint64_t v9 = &v18[v7];
          size_t v10 = *(unsigned int *)&v18[v7 + 1];
          if (v18[v7] == 7) {
            break;
          }
          uint64_t v7 = (v8 + v10 + 5);
          int v8 = v7;
          if (v7 >= v17) {
            goto LABEL_17;
          }
        }
        if (v10)
        {
          xpc_object_t v11 = malloc_type_calloc(v10 + 1, 1uLL, 0x100004077774924uLL);
          *a2 = v11;
          if (v11) {
            memcpy(v11, v9 + 5, v10);
          }
        }
        else
        {
          *a2 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
        }
      }
LABEL_17:
      if (a3 && v17)
      {
        uint64_t v12 = 0;
        int v13 = 0;
        while (1)
        {
          uint64_t v14 = &v18[v12];
          size_t v15 = *(unsigned int *)&v18[v12 + 1];
          if (v18[v12] == 8) {
            break;
          }
          uint64_t v12 = (v13 + v15 + 5);
          uint64_t v5 = 1;
          int v13 = v12;
          if (v12 >= v17) {
            return v5;
          }
        }
        if (!v15)
        {
          uint64_t v5 = 1;
          *a3 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
          return v5;
        }
        size_t v16 = malloc_type_calloc(v15 + 1, 1uLL, 0x100004077774924uLL);
        *a3 = v16;
        if (!v16) {
          return 1;
        }
        memcpy(v16, v14 + 5, v15);
      }
      return 1;
    }
    return 0;
  }
  return 1;
}

const char *ne_session_status_to_string(int a1)
{
  if ((a1 - 1) > 4) {
    return "invalid";
  }
  else {
    return off_1E598CB80[a1 - 1];
  }
}

const char *ne_session_type_to_string(int a1)
{
  if ((a1 - 1) > 8) {
    return "<unknown>";
  }
  else {
    return off_1E598CBA8[a1 - 1];
  }
}

uint64_t ne_session_copy_security_session_info(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F14BF8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2000000000;
  uint64_t v16 = 0;
  *a2 = 0;
  *a3 = 0;
  v12[0] = MEMORY[0x1E4F14BE8];
  v12[1] = 0x40000000;
  v12[2] = __ne_session_copy_security_session_info_block_invoke;
  v12[3] = &unk_1E598C570;
  v12[4] = &v13;
  v12[5] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, v12);
  if (v14[3])
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "SessionCommandType", 5);
    xpc_object_t v6 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)v14[3], v5);
    uint64_t v7 = v6;
    if (v6)
    {
      if (MEMORY[0x19F3B5680](v6) == MEMORY[0x1E4F14D40])
      {
        *a2 = xpc_dictionary_copy_mach_send();
        *a3 = xpc_dictionary_copy_mach_send();
      }
      else if (MEMORY[0x19F3B5680](v7) == MEMORY[0x1E4F14D58])
      {
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        int v8 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
        {
          string = xpc_dictionary_get_string(v7, (const char *)*MEMORY[0x1E4F14D08]);
          *(_DWORD *)long long buf = 136315138;
          size_t v18 = string;
          _os_log_error_impl(&dword_19DD92000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch security session info: %s", buf, 0xCu);
        }
        uint64_t v9 = 0;
        goto LABEL_13;
      }
    }
    uint64_t v9 = 1;
LABEL_13:
    xpc_release(v5);
    xpc_release(v7);
    xpc_release((xpc_object_t)v14[3]);
    goto LABEL_14;
  }
  uint64_t v9 = 0;
LABEL_14:
  _Block_object_dispose(&v13, 8);
  return v9;
}

xpc_object_t __ne_session_copy_security_session_info_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = get_connection(**(void **)(a1 + 40));
  xpc_object_t result = *(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (result)
  {
    xpc_object_t result = xpc_retain(result);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

void ne_session_stop_all_with_plugin_type(int a1, dispatch_queue_t queue, dispatch_block_t block)
{
  if (queue)
  {
    if (block) {
      dispatch_async(queue, block);
    }
  }
}

xpc_object_t ne_session_policy_copy_flow_divert_token(const unsigned __int8 *a1, unsigned int a2, xpc_object_t xdict, const char *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F14BF8];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2000000000;
  uint64_t v18 = 0;
  if (!a4 || uuid_is_null(a1))
  {
    xpc_object_t v8 = ne_session_policy_copy_flow_divert_token_with_key(a2, xdict, 0, 0);
    goto LABEL_4;
  }
  if (!ne_session_validate_flow_properties(xdict))
  {
LABEL_17:
    xpc_object_t v8 = 0;
    goto LABEL_4;
  }
  size_t v10 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x1E4F14BE8];
  v14[1] = 0x40000000;
  v14[2] = __ne_session_policy_copy_flow_divert_token_block_invoke;
  v14[3] = &unk_1E598C598;
  v14[4] = &v15;
  v14[5] = v10;
  uint64_t v11 = ne_session_create((uint64_t)a1, 2);
  uint64_t v20 = 0;
  xpc_object_t v21 = &v20;
  uint64_t v22 = 0x2000000000;
  char v23 = 0;
  if (get_flow_divert_token_from_session_manager_token_init != -1) {
    dispatch_once(&get_flow_divert_token_from_session_manager_token_init, &__block_literal_global_233);
  }
  *(void *)&long long block = MEMORY[0x1E4F14BE8];
  *((void *)&block + 1) = 0x40000000;
  xpc_object_t v25 = __get_flow_divert_token_from_session_manager_block_invoke_2;
  uint64_t v26 = &unk_1E598CAA8;
  int8x16_t v27 = &v20;
  uint64_t v28 = v11;
  dispatch_sync((dispatch_queue_t)g_queue, &block);
  if (*((unsigned char *)v21 + 24))
  {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v11 + 40), 1u, memory_order_relaxed);
    v19[0] = MEMORY[0x1E4F14BE8];
    v19[1] = 0x40000000;
    v19[2] = __get_flow_divert_token_from_session_manager_block_invoke_3;
    v19[3] = &__block_descriptor_tmp_238;
    v19[4] = v11;
    out[0] = MEMORY[0x1E4F14BE8];
    out[1] = 0x40000000;
    out[2] = __ne_session_set_event_handler_block_invoke;
    out[3] = &unk_1E598C268;
    out[4] = v19;
    uint64_t v30 = v11;
    uint64_t v31 = get_flow_divert_token_from_session_manager_token_queue;
    dispatch_sync((dispatch_queue_t)g_queue, out);
  }
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v12, "SessionFlowDivertTokenControlUnit", a2);
  if (xdict) {
    xpc_dictionary_set_value(v12, "SessionFlowDivertTokenProperties", xdict);
  }
  xpc_dictionary_set_string(v12, "SessionFlowDivertTokenSigningIdentifier", a4);
  out[0] = MEMORY[0x1E4F14BE8];
  out[1] = 0x40000000;
  out[2] = __get_flow_divert_token_from_session_manager_block_invoke_242;
  out[3] = &unk_1E598CB10;
  out[4] = v14;
  uint64_t v30 = v11;
  ne_session_get_info_with_parameters(v11, 4, (uint64_t)v12, 0, (dispatch_object_t)get_flow_divert_token_from_session_manager_token_queue, out);
  _Block_object_dispose(&v20, 8);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v10);
  xpc_object_t v8 = (xpc_object_t)v16[3];
  if (!v8)
  {
    memset(out, 0, 37);
    uuid_unparse(a1, (char *)out);
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v13 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      LODWORD(block) = 136315138;
      *(void *)((char *)&block + 4) = out;
      _os_log_error_impl(&dword_19DD92000, v13, OS_LOG_TYPE_ERROR, "Failed to obtain the flow divert token for configuration %s", (uint8_t *)&block, 0xCu);
    }
    goto LABEL_17;
  }
LABEL_4:
  _Block_object_dispose(&v15, 8);
  return v8;
}

xpc_object_t ne_session_policy_copy_flow_divert_token_with_key(unsigned int a1, xpc_object_t xdict, const char *a3, void *a4)
{
  uint64_t v61 = *MEMORY[0x1E4F14BF8];
  size_t length = 0;
  string = xpc_dictionary_get_string(xdict, "flow-host-name");
  data = xpc_dictionary_get_data(xdict, "flow-host-address", &length);
  int int64 = xpc_dictionary_get_int64(xdict, "flow-host-port");
  BOOL v11 = xpc_dictionary_get_BOOL(xdict, "flow-multipath-requested");
  size_t v57 = 0;
  xpc_object_t v12 = xpc_dictionary_get_data(xdict, "app-data", &v57);
  uint int64 = xpc_dictionary_get_uint64(xdict, "aggregate_unit");
  BOOL v14 = ne_session_validate_flow_properties(xdict);
  xpc_object_t v15 = 0;
  if (!v14) {
    return v15;
  }
  if (v11) {
    int v16 = 4;
  }
  else {
    int v16 = 0;
  }
  int v54 = v16;
  if (string) {
    size_t v17 = strlen(string) + 5;
  }
  else {
    size_t v17 = 0;
  }
  int v55 = int64;
  if (data && *data) {
    v17 += *data + 5;
  }
  uint64_t v18 = 61;
  if (!a4) {
    uint64_t v18 = 36;
  }
  size_t v19 = v17 + v18;
  if (a3) {
    v19 += strlen(a3) + 5;
  }
  if (v57) {
    BOOL v20 = v12 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  size_t v21 = v57 + 5;
  if (v20) {
    size_t v21 = 0;
  }
  size_t v22 = v21 + v19;
  unsigned int v56 = uint64;
  if (uint64) {
    size_t v23 = v22 + 9;
  }
  else {
    size_t v23 = v22;
  }
  size_t v24 = (char *)malloc_type_malloc(v23, 0x13056143uLL);
  xpc_object_t v25 = v24;
  if (string)
  {
    v53 = a3;
    uint64_t v26 = v12;
    unsigned int v27 = a1;
    uint64_t v28 = a4;
    unsigned int v29 = strlen(string);
    uint64_t v30 = v29;
    unint64_t v31 = v29 + 5;
    unint64_t v32 = v23 - v31;
    if (v23 < v31) {
      goto LABEL_58;
    }
    char *v25 = 21;
    *(_DWORD *)(v25 + 1) = bswap32(v29);
    memcpy(v25 + 5, string, v29);
    __int16 v33 = &v25[v30 + 5];
    a4 = v28;
    a1 = v27;
    xpc_object_t v12 = v26;
    a3 = v53;
    if (!data) {
      goto LABEL_33;
    }
LABEL_29:
    size_t v34 = *data;
    if (*data)
    {
      BOOL v35 = v32 >= v34 + 5;
      v32 -= v34 + 5;
      if (!v35) {
        goto LABEL_58;
      }
      char *v33 = 22;
      *(_DWORD *)(v33 + 1) = v34 << 24;
      long long v36 = v33 + 5;
      memcpy(v36, data, v34);
      __int16 v33 = &v36[v34];
    }
    goto LABEL_33;
  }
  unint64_t v32 = v23;
  __int16 v33 = v24;
  if (data) {
    goto LABEL_29;
  }
LABEL_33:
  if (v32 <= 8) {
    goto LABEL_58;
  }
  char *v33 = 23;
  *(_DWORD *)(v33 + 1) = 0x4000000;
  *(_DWORD *)(v33 + 5) = v55;
  if (v32 - 9 <= 8) {
    goto LABEL_58;
  }
  __int16 v37 = a4;
  v33[9] = 10;
  *(_DWORD *)(v33 + 10) = 0x4000000;
  *(_DWORD *)(v33 + 14) = bswap32(a1);
  BOOL is_debug_logging_enabled = nelog_is_debug_logging_enabled();
  if (v32 - 18 <= 8) {
    goto LABEL_58;
  }
  int v39 = is_debug_logging_enabled ? 7 : 5;
  v33[18] = 20;
  *(_DWORD *)(v33 + 19) = 0x4000000;
  *(_DWORD *)(v33 + 23) = v39;
  if (v32 - 27 <= 8) {
LABEL_58:
  }
    __assert_rtn("ne_tlv_add", "ne_session.c", 2995, "tlv_iter->remaining >= add_size");
  v33[27] = 29;
  *((_DWORD *)v33 + 7) = 0x4000000;
  *((_DWORD *)v33 + 8) = v54;
  unint64_t v40 = v32 - 36;
  if (a3)
  {
    unsigned int v41 = strlen(a3);
    uint64_t v42 = v41;
    unint64_t v43 = v41 + 5;
    BOOL v35 = v40 >= v43;
    v40 -= v43;
    if (!v35) {
      goto LABEL_58;
    }
    v33[36] = 25;
    *(_DWORD *)(v33 + 37) = bswap32(v41);
    uint64_t v44 = v33 + 41;
    memcpy(v44, a3, v41);
    uint64_t v45 = &v44[v42];
  }
  else
  {
    uint64_t v45 = v33 + 36;
  }
  if (v12)
  {
    unsigned int v46 = v57;
    if (v57)
    {
      size_t v47 = v57;
      unint64_t v48 = v57 + 5;
      BOOL v35 = v40 >= v48;
      v40 -= v48;
      if (!v35) {
        goto LABEL_58;
      }
      *uint64_t v45 = 31;
      *(_DWORD *)(v45 + 1) = bswap32(v46);
      memcpy(v45 + 5, v12, v47);
      v45 += v47 + 5;
    }
  }
  if (v56)
  {
    if (v40 <= 8) {
      goto LABEL_58;
    }
    *uint64_t v45 = 26;
    *(_DWORD *)(v45 + 1) = 0x4000000;
    *(_DWORD *)(v45 + 5) = bswap32(v56);
    v45 += 9;
    v40 -= 9;
  }
  if (v37)
  {
    long long macOut = 0uLL;
    int v60 = 0;
    bytes_ptr = xpc_data_get_bytes_ptr(v37);
    size_t v50 = xpc_data_get_length(v37);
    CCHmac(0, bytes_ptr, v50, v25, v23 - v40, &macOut);
    if (v40 <= 0x18) {
      goto LABEL_58;
    }
    *uint64_t v45 = 18;
    *(_DWORD *)(v45 + 1) = 335544320;
    long long v51 = macOut;
    *(_DWORD *)(v45 + 21) = v60;
    *(_OWORD *)(v45 + 5) = v51;
    v40 -= 25;
  }
  xpc_object_t v15 = xpc_data_create(v25, v23 - v40);
  free(v25);
  return v15;
}

BOOL ne_session_validate_flow_properties(void *a1)
{
  size_t length = 0;
  string = xpc_dictionary_get_string(a1, "flow-host-name");
  data = (unsigned __int8 *)xpc_dictionary_get_data(a1, "flow-host-address", &length);
  int int64 = xpc_dictionary_get_int64(a1, "flow-host-port");
  if (!string)
  {
    if (data)
    {
LABEL_6:
      int v5 = data[1];
      if (v5 == 30)
      {
        size_t v11 = *data;
        if (v11 < 0x1C || length < v11)
        {
LABEL_26:
          if (ne_log_obj_g_init != -1) {
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          }
          uint64_t v13 = ne_log_obj_log_obj;
          BOOL result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
          if (result)
          {
            LOWORD(v15[0]) = 0;
            _os_log_error_impl(&dword_19DD92000, v13, OS_LOG_TYPE_ERROR, "Invalid host address", (uint8_t *)v15, 2u);
            return 0;
          }
          return result;
        }
        v15[0] = 0;
        v15[1] = 0;
        if (*(_OWORD *)(data + 8) != 0) {
          goto LABEL_35;
        }
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        xpc_object_t v8 = ne_log_obj_log_obj;
        if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_INFO)) {
          return 0;
        }
        __int16 v16 = 0;
        uint64_t v9 = "Invalid flow properties: address is IN6ADDR_ANY_INIT";
      }
      else
      {
        if (v5 != 2) {
          goto LABEL_26;
        }
        size_t v6 = *data;
        if (v6 < 0x10 || length < v6) {
          goto LABEL_26;
        }
        LODWORD(v15[0]) = 0;
        if (*((_DWORD *)data + 1)) {
          goto LABEL_35;
        }
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        xpc_object_t v8 = ne_log_obj_log_obj;
        if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_INFO)) {
          return 0;
        }
        __int16 v16 = 0;
        uint64_t v9 = "Invalid flow properties: address is INADDR_ANY";
      }
      BOOL v14 = (uint8_t *)&v16;
      goto LABEL_42;
    }
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    xpc_object_t v8 = ne_log_obj_log_obj;
    BOOL result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    LOWORD(v15[0]) = 0;
    uint64_t v9 = "Invalid flow properties: missing hostname and address";
LABEL_41:
    BOOL v14 = (uint8_t *)v15;
LABEL_42:
    _os_log_impl(&dword_19DD92000, v8, OS_LOG_TYPE_INFO, v9, v14, 2u);
    return 0;
  }
  if (!*string)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    xpc_object_t v8 = ne_log_obj_log_obj;
    BOOL result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    LOWORD(v15[0]) = 0;
    uint64_t v9 = "Invalid flow properties: hostname is empty";
    goto LABEL_41;
  }
  if (data) {
    goto LABEL_6;
  }
LABEL_35:
  if (int64) {
    return 1;
  }
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  xpc_object_t v8 = ne_log_obj_log_obj;
  BOOL result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_INFO);
  if (result)
  {
    LOWORD(v15[0]) = 0;
    uint64_t v9 = "Invalid flow properties: invalid port";
    goto LABEL_41;
  }
  return result;
}

intptr_t __ne_session_policy_copy_flow_divert_token_block_invoke(uint64_t a1, xpc_object_t object)
{
  if (object) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_retain(object);
  }
  xpc_object_t v3 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v3);
}

uint64_t __get_flow_divert_token_from_session_manager_block_invoke_2(uint64_t result)
{
  char v1 = 0;
  BOOL v2 = (uint64_t *)(**(void **)(result + 40) + 24);
  do
  {
    char v3 = v1;
    uint64_t v4 = *v2;
    if (v1) {
      break;
    }
    BOOL v2 = (uint64_t *)(v4 + 8);
    char v1 = 1;
  }
  while (v4);
  if (v4 == 0 && (v3 & 1) != 0) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

void __get_flow_divert_token_from_session_manager_block_invoke_3(uint64_t a1, int a2)
{
  if (a2 == 2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    ne_session_release(v3);
  }
  else if (a2 == 1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    v4[0] = MEMORY[0x1E4F14BE8];
    v4[1] = 0x40000000;
    v4[2] = __get_flow_divert_token_from_session_manager_block_invoke_4;
    v4[3] = &__block_descriptor_tmp_236;
    v4[4] = v2;
    block[0] = MEMORY[0x1E4F14BE8];
    block[1] = 0x40000000;
    block[2] = __ne_session_get_status_block_invoke;
    block[3] = &unk_1E598C300;
    void block[5] = v2;
    void block[6] = get_flow_divert_token_from_session_manager_token_queue;
    block[4] = v4;
    dispatch_sync((dispatch_queue_t)g_queue, block);
  }
}

void __get_flow_divert_token_from_session_manager_block_invoke_242(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x19F3B5680](a2) == MEMORY[0x1E4F14D40] && xpc_dictionary_get_value(a2, "SessionFlowDivertTokenKey")) {
    MEMORY[0x19F3B5680]();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v4 = *(void *)(a1 + 40);

  ne_session_release(v4);
}

void __get_flow_divert_token_from_session_manager_block_invoke_4(uint64_t a1, unsigned int a2)
{
  void v6[5] = *MEMORY[0x1E4F14BF8];
  if (a2 <= 1)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v4 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_INFO))
    {
      LODWORD(v6[0]) = 67109120;
      HIDWORD(v6[0]) = a2;
      _os_log_impl(&dword_19DD92000, v4, OS_LOG_TYPE_INFO, "Flow divert token session status changed to %d, cleaning up", (uint8_t *)v6, 8u);
    }
    uint64_t v5 = *(void *)(a1 + 32);
    v6[0] = MEMORY[0x1E4F14BE8];
    v6[1] = 0x40000000;
    v6[2] = __ne_session_cancel_block_invoke;
    v6[3] = &__block_descriptor_tmp_10;
    v6[4] = v5;
    dispatch_sync((dispatch_queue_t)g_queue, v6);
  }
}

dispatch_queue_t __get_flow_divert_token_from_session_manager_block_invoke()
{
  int v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("flow divert token queue", v0);
  get_flow_divert_token_from_session_manager_token_queue = (uint64_t)result;
  return result;
}

xpc_object_t ne_session_copy_app_data_from_flow_divert_socket(int a1)
{
  uint64_t v24 = *MEMORY[0x1E4F14BF8];
  socklen_t v21 = 0;
  xpc_object_t v2 = 0;
  if (getsockopt(a1, 0xFFFF, 4358, 0, &v21)) {
    return v2;
  }
  if (!v21)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v7 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_WORD *)long long buf = 0;
    xpc_object_t v8 = "flow divert token size is 0";
    uint64_t v9 = v7;
    uint32_t v10 = 2;
LABEL_30:
    _os_log_error_impl(&dword_19DD92000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
    return 0;
  }
  uint64_t v3 = (unsigned __int8 *)malloc_type_malloc(v21, 0x100004077774924uLL);
  if (!v3)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v11 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v23) = v21;
    xpc_object_t v8 = "Failed to allocate %u bytes for the flow divert token";
    uint64_t v9 = v11;
    uint32_t v10 = 8;
    goto LABEL_30;
  }
  uint64_t v4 = v3;
  if (getsockopt(a1, 0xFFFF, 4358, v3, &v21))
  {
    int v5 = *__error();
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    size_t v6 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      BOOL v20 = strerror(v5);
      *(_DWORD *)long long buf = 136315138;
      size_t v23 = v20;
      _os_log_error_impl(&dword_19DD92000, v6, OS_LOG_TYPE_ERROR, "getsockopt(SO_FLOW_DIVERT_TOKEN) failed: %s", buf, 0xCu);
    }
    free(v4);
    return 0;
  }
  unint64_t v13 = v21;
  BOOL v14 = v4;
  while (v13 >= 5)
  {
    int v15 = *v14;
    unsigned int v16 = *(_DWORD *)(v14 + 1);
    size_t v17 = bswap32(v16);
    if (v16)
    {
      uint64_t v18 = v17 + 5;
      if (v17 + 5 > v13) {
        break;
      }
      size_t v19 = v14 + 5;
    }
    else
    {
      size_t v19 = 0;
      uint64_t v18 = 5;
    }
    v14 += v18;
    v13 -= v18;
    if (v15 == 31)
    {
      xpc_object_t v2 = xpc_data_create(v19, v17);
      goto LABEL_28;
    }
  }
  xpc_object_t v2 = 0;
LABEL_28:
  free(v4);
  return v2;
}

xpc_object_t ne_session_copy_app_data_from_flow_divert_token(void *a1)
{
  bytes_ptr = (unsigned __int8 *)xpc_data_get_bytes_ptr(a1);
  size_t length = xpc_data_get_length(a1);
  do
  {
    if (length < 5) {
      return 0;
    }
    int v4 = *bytes_ptr;
    unsigned int v5 = *(_DWORD *)(bytes_ptr + 1);
    size_t v6 = bswap32(v5);
    if (v5)
    {
      uint64_t v7 = v6 + 5;
      if (v6 + 5 > length) {
        return 0;
      }
      xpc_object_t v8 = bytes_ptr + 5;
    }
    else
    {
      xpc_object_t v8 = 0;
      uint64_t v7 = 5;
    }
    bytes_ptr += v7;
    length -= v7;
  }
  while (v4 != 31);

  return xpc_data_create(v8, v6);
}

uint64_t ne_session_agent_get_advisory_interface_index(uint64_t result, int a2, unsigned char *a3)
{
  if (result)
  {
    uint64_t v5 = result;
    if (!strcmp((const char *)(result + 16), "NetworkExtension")
      && !strcmp((const char *)(v5 + 48), "PathController")
      && *(_DWORD *)(v5 + 212) == 140)
    {
      uint64_t v6 = 0;
      while (1)
      {
        int v7 = *(_DWORD *)(v5 + 272 + 4 * v6);
        if (!v7 || v7 == a2) {
          break;
        }
        dispatch_queue_t result = 0;
        if (++v6 == 4) {
          return result;
        }
      }
      if (a3) {
        *a3 = *(unsigned char *)(v5 + 288) & 1;
      }
      return *(unsigned int *)(v5 + 4 * v6 + 256);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const char *ne_session_stop_reason_to_string(int a1)
{
  if ((a1 - 1) > 0x28) {
    return "None";
  }
  else {
    return off_1E598CBF0[a1 - 1];
  }
}

xpc_object_t ne_copy_signing_identifier_for_pid(int a1)
{
  return ne_copy_signing_identifier_for_pid_with_audit_token(a1, 0);
}

xpc_object_t ne_copy_signing_identifier_for_pid_with_audit_token(int a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F14BF8];
  bzero(v17, 0x400uLL);
  unint64_t v4 = 1023;
  uint64_t v5 = v17;
  while (a2)
  {
    if (!csops_audittoken()) {
      goto LABEL_11;
    }
LABEL_6:
    uint64_t v6 = __error();
    if (v5 != v17 || *v6 != 34)
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint64_t v9 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        uint32_t v10 = __error();
        uint64_t v11 = strerror(*v10);
        int v15 = 67109378;
        LODWORD(v16[0]) = a1;
        WORD2(v16[0]) = 2080;
        *(void *)((char *)v16 + 6) = v11;
        _os_log_error_impl(&dword_19DD92000, v9, OS_LOG_TYPE_ERROR, "Failed to get the signing identifier for %d: %s", (uint8_t *)&v15, 0x12u);
      }
      goto LABEL_22;
    }
    unint64_t v4 = bswap32(v18);
    if ((v4 - 1048577) <= 0xFFF00006)
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      xpc_object_t v12 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        int v15 = 134217984;
        v16[0] = v4;
        _os_log_error_impl(&dword_19DD92000, v12, OS_LOG_TYPE_ERROR, "signing identifier length is invalid: %lu", (uint8_t *)&v15, 0xCu);
      }
      uint64_t v5 = 0;
LABEL_22:
      xpc_object_t v8 = 0;
      BOOL v13 = v5 != 0;
      goto LABEL_25;
    }
    uint64_t v5 = malloc_type_malloc(v4 + 1, 0x100004077774924uLL);
    if (!v5) {
      goto LABEL_22;
    }
  }
  if (csops()) {
    goto LABEL_6;
  }
LABEL_11:
  unint64_t v7 = bswap32(*((_DWORD *)v5 + 1));
  if (v4 >= v7)
  {
    v5[v7] = 0;
    xpc_object_t v8 = xpc_string_create(v5 + 8);
  }
  else
  {
    xpc_object_t v8 = 0;
  }
  BOOL v13 = 1;
LABEL_25:
  if (v13 && v5 != v17) {
    free(v5);
  }
  return v8;
}

void *ne_copy_signature_info_for_pid(int a1)
{
  uint64_t v16 = *MEMORY[0x1E4F14BF8];
  unint64_t v2 = (unint64_t)ne_copy_signing_identifier_for_pid_with_audit_token(a1, 0);
  bytes[0] = 0;
  bytes[1] = 0;
  int v15 = 0;
  if (csops())
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v3 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = __error();
      uint32_t v10 = strerror(*v9);
      v11[0] = 67109378;
      v11[1] = a1;
      __int16 v12 = 2080;
      BOOL v13 = v10;
      _os_log_error_impl(&dword_19DD92000, v3, OS_LOG_TYPE_ERROR, "Failed to get the code directory hash for %d: %s", (uint8_t *)v11, 0x12u);
    }
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = (unint64_t)xpc_data_create(bytes, 0x14uLL);
  }
  if (!(v4 | v2)) {
    return 0;
  }
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  uint64_t v6 = v5;
  if (v5)
  {
    if (v4) {
      xpc_dictionary_set_value(v5, "SourceAppUniqueIdentifier", (xpc_object_t)v4);
    }
    if (v2)
    {
      xpc_dictionary_set_value(v6, "SourceAppSigningIdentifier", (xpc_object_t)v2);
      if (!v4) {
        goto LABEL_21;
      }
LABEL_20:
      xpc_release((xpc_object_t)v4);
      goto LABEL_21;
    }
LABEL_19:
    if (!v4) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  unint64_t v7 = ne_log_obj_log_obj;
  if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_FAULT)) {
    goto LABEL_19;
  }
  LOWORD(bytes[0]) = 0;
  _os_log_fault_impl(&dword_19DD92000, v7, OS_LOG_TYPE_FAULT, "xpc_dictionary_create failed", (uint8_t *)bytes, 2u);
  if (v4) {
    goto LABEL_20;
  }
LABEL_21:
  if (v2) {
    xpc_release((xpc_object_t)v2);
  }
  return v6;
}

xpc_object_t ne_copy_cached_synthesized_uuids_for_bundle_identifier_locked(const char *a1, void *a2)
{
  _OWORD buffer[2] = *MEMORY[0x1E4F14BF8];
  uint64_t v4 = MEMORY[0x19F3B5680](a2);
  uint64_t v5 = MEMORY[0x1E4F14D40];
  if (v4 == MEMORY[0x1E4F14D40])
  {
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(a2, "synthesized-uuid-mappings");
    if (dictionary)
    {
      uint64_t v9 = dictionary;
      if (MEMORY[0x19F3B5680]() == v5)
      {
        xpc_object_t value = xpc_dictionary_get_value(v9, a1);
        xpc_object_t v6 = value;
        if (!value) {
          return v6;
        }
        if (MEMORY[0x19F3B5680](value) == MEMORY[0x1E4F14D30])
        {
          buffer[0] = 0;
          buffer[1] = 0;
          size_t bytes = xpc_data_get_bytes(v6, buffer, 0, 0x10uLL);
          size_t length = xpc_data_get_length(v6);
          xpc_object_t v6 = 0;
          if (bytes != length) {
            return v6;
          }
          xpc_object_t v13 = xpc_uuid_create((const unsigned __int8 *)buffer);
          if (v13)
          {
            BOOL v14 = v13;
            xpc_object_t v6 = xpc_array_create(0, 0);
            xpc_array_append_value(v6, v14);
            xpc_release(v14);
            g_ne_uuid_cache_hit = 1;
            return v6;
          }
        }
      }
    }
  }
  return 0;
}

BOOL ne_session_is_safeboot()
{
  uint64_t v5 = *MEMORY[0x1E4F14BF8];
  *(void *)uint64_t v4 = 0x4200000001;
  int v3 = 0;
  size_t v2 = 4;
  if (sysctl(v4, 2u, &v3, &v2, 0, 0)) {
    BOOL v0 = 1;
  }
  else {
    BOOL v0 = v3 == 0;
  }
  return !v0;
}

unsigned __int8 *ne_is_sockaddr_valid(unsigned __int8 *result, unint64_t a2)
{
  if (result)
  {
    int v2 = result[1];
    if (v2 == 30)
    {
      unint64_t v3 = *result;
      BOOL v4 = v3 > 0x1B;
    }
    else
    {
      if (v2 != 2) {
        return 0;
      }
      unint64_t v3 = *result;
      BOOL v4 = v3 > 0xF;
    }
    return (unsigned __int8 *)(v4 && v3 <= a2);
  }
  return result;
}

uint64_t ne_session_set_socket_tracker_attributes(int a1, char *__s, const char *a3, const char *a4)
{
  if (a1 == -1) {
    return 0;
  }
  BOOL v4 = a4;
  xpc_object_t v6 = __s;
  if (!__s && !a3 && !a4) {
    return 1;
  }
  if (!__s)
  {
    size_t v9 = 0;
    if (!a3) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  size_t v9 = strlen(__s) + 6;
  if (a3) {
LABEL_9:
  }
    v9 += strlen(a3) + 6;
LABEL_10:
  if (v4) {
    v9 += strlen(v4) + 6;
  }
  uint64_t result = (uint64_t)malloc_type_malloc(v9, 0x4CE0CA09uLL);
  if (result)
  {
    uint32_t v10 = (char *)result;
    bzero((void *)result, v9);
    uint64_t v11 = (uint64_t)v10;
    if (v6)
    {
      size_t v12 = strlen(v6);
      if (v12 >= 2)
      {
        size_t v13 = v12 - 1;
        if (v6[v12 - 1] == 46)
        {
          __strncpy_chk();
          ne_session_trim_domain_domain_buffer[v13] = 0;
          xpc_object_t v6 = ne_session_trim_domain_domain_buffer;
        }
      }
      int v14 = strlen(v6);
      char *v10 = 7;
      size_t v15 = (v14 + 1);
      *(_DWORD *)(v10 + 1) = v15;
      if (v14 == -1) {
        size_t v15 = 0;
      }
      else {
        memcpy(v10 + 5, v6, v15);
      }
      uint64_t v11 = (uint64_t)&v10[v15 + 5];
    }
    if (a3)
    {
      int v16 = strlen(a3);
      *(unsigned char *)uint64_t v11 = 11;
      size_t v17 = (v16 + 1);
      *(_DWORD *)(v11 + 1) = v17;
      if (v16 == -1) {
        size_t v17 = 0;
      }
      else {
        memcpy((void *)(v11 + 5), a3, v17);
      }
      v11 += v17 + 5;
    }
    if (v4)
    {
      size_t v18 = strlen(v4);
      if (v18 >= 2)
      {
        size_t v19 = v18 - 1;
        if (v4[v18 - 1] == 46)
        {
          __strncpy_chk();
          ne_session_trim_domain_domain_buffer[v19] = 0;
          BOOL v4 = ne_session_trim_domain_domain_buffer;
        }
      }
      int v20 = strlen(v4);
      *(unsigned char *)uint64_t v11 = 12;
      size_t v21 = (v20 + 1);
      *(_DWORD *)(v11 + 1) = v21;
      if (v20 != -1) {
        memcpy((void *)(v11 + 5), v4, v21);
      }
    }
    int v22 = setsockopt(a1, 0xFFFF, 4361, v10, v9);
    free(v10);
    return v22 == 0;
  }
  return result;
}

char *ne_session_set_socket_context_attribute(int a1, char *__s)
{
  if (a1 == -1) {
    return 0;
  }
  if (__s) {
    size_t v4 = strlen(__s) + 6;
  }
  else {
    size_t v4 = 5;
  }
  uint64_t result = (char *)malloc_type_malloc(v4, 0x5A28F707uLL);
  if (result)
  {
    xpc_object_t v6 = result;
    bzero(result, v4);
    if (__s)
    {
      int v7 = strlen(__s);
      *xpc_object_t v6 = 13;
      size_t v8 = (v7 + 1);
      *(_DWORD *)(v6 + 1) = v8;
      if (v7 != -1) {
        memcpy(v6 + 5, __s, v8);
      }
    }
    else
    {
      *xpc_object_t v6 = 13;
      *(_DWORD *)(v6 + 1) = 0;
    }
    int v9 = setsockopt(a1, 0xFFFF, 4361, v6, v4);
    free(v6);
    return (char *)(v9 == 0);
  }
  return result;
}

uint64_t ne_session_copy_socket_domain_attributes(int a1, void **a2, void **a3, void **a4, void **a5)
{
  uint64_t v34 = *MEMORY[0x1E4F14BF8];
  bzero(v33, 0x300uLL);
  socklen_t v32 = 768;
  if (a1 == -1) {
    return 0;
  }
  if (a2 || a3 || a4)
  {
    if (!getsockopt(a1, 0xFFFF, 4361, v33, &v32))
    {
      if (a2 && v32)
      {
        uint64_t v12 = 0;
        int v13 = 0;
        while (1)
        {
          int v14 = &v33[v12];
          size_t v15 = *(unsigned int *)&v33[v12 + 1];
          if (v33[v12] == 7) {
            break;
          }
          uint64_t v12 = (v13 + v15 + 5);
          int v13 = v12;
          if (v12 >= v32) {
            goto LABEL_19;
          }
        }
        if (v15)
        {
          int v16 = malloc_type_calloc(v15 + 1, 1uLL, 0x100004077774924uLL);
          *a2 = v16;
          if (v16) {
            memcpy(v16, v14 + 5, v15);
          }
        }
        else
        {
          *a2 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
        }
      }
LABEL_19:
      if (a3 && v32)
      {
        uint64_t v17 = 0;
        int v18 = 0;
        while (1)
        {
          size_t v19 = &v33[v17];
          size_t v20 = *(unsigned int *)&v33[v17 + 1];
          if (v33[v17] == 11) {
            break;
          }
          uint64_t v17 = (v18 + v20 + 5);
          int v18 = v17;
          if (v17 >= v32) {
            goto LABEL_29;
          }
        }
        if (v20)
        {
          size_t v21 = malloc_type_calloc(v20 + 1, 1uLL, 0x100004077774924uLL);
          *a3 = v21;
          if (v21) {
            memcpy(v21, v19 + 5, v20);
          }
        }
        else
        {
          *a3 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
        }
      }
LABEL_29:
      if (a4 && v32)
      {
        uint64_t v22 = 0;
        int v23 = 0;
        while (1)
        {
          uint64_t v24 = &v33[v22];
          size_t v25 = *(unsigned int *)&v33[v22 + 1];
          if (v33[v22] == 12) {
            break;
          }
          uint64_t v22 = (v23 + v25 + 5);
          int v23 = v22;
          if (v22 >= v32) {
            goto LABEL_39;
          }
        }
        if (v25)
        {
          uint64_t v26 = malloc_type_calloc(v25 + 1, 1uLL, 0x100004077774924uLL);
          *a4 = v26;
          if (v26) {
            memcpy(v26, v24 + 5, v25);
          }
        }
        else
        {
          *a4 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
        }
      }
LABEL_39:
      if (a5 && v32)
      {
        uint64_t v27 = 0;
        int v28 = 0;
        while (1)
        {
          unsigned int v29 = &v33[v27];
          size_t v30 = *(unsigned int *)&v33[v27 + 1];
          if (v33[v27] == 13) {
            break;
          }
          uint64_t v27 = (v28 + v30 + 5);
          uint64_t v10 = 1;
          int v28 = v27;
          if (v27 >= v32) {
            return v10;
          }
        }
        if (!v30)
        {
          uint64_t v10 = 1;
          *a5 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
          return v10;
        }
        unint64_t v31 = malloc_type_calloc(v30 + 1, 1uLL, 0x100004077774924uLL);
        *a5 = v31;
        if (!v31) {
          return 1;
        }
        memcpy(v31, v29 + 5, v30);
      }
      return 1;
    }
    return 0;
  }
  return 1;
}

void ne_session_clear_caches()
{
  ne_force_reset_uuid_cache();
  os_unfair_lock_lock(&_ne_session_cache_lock);
  if (_ne_session_cache_notify_token != -1)
  {
    notify_cancel(_ne_session_cache_notify_token);
    _ne_session_cache_notify_token = -1;
  }
  if (_ne_session_master_cache)
  {
    xpc_release((xpc_object_t)_ne_session_master_cache);
    _ne_session_master_cache = 0;
  }

  os_unfair_lock_unlock(&_ne_session_cache_lock);
}

void NEHelperSendRequest(void *a1, NSObject *a2, void (**a3)(void, void, void, void))
{
  if (!a1)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    size_t v8 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_WORD *)long long buf = 0;
    int v9 = "request is NULL";
LABEL_22:
    _os_log_error_impl(&dword_19DD92000, v8, OS_LOG_TYPE_ERROR, v9, buf, 2u);
    return;
  }
  if (!a2)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    size_t v8 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_WORD *)long long buf = 0;
    int v9 = "response_queue is NULL";
    goto LABEL_22;
  }
  if (a3)
  {
    uint int64 = xpc_dictionary_get_uint64(a1, "delegate-class-id");
    if (uint64 - 16 > 0xFFFFFFF0)
    {
      uint64_t v10 = _Block_copy(a3);
      uint64_t v11 = nehelper_copy_connection_for_delegate_class(uint64);
      if (v11)
      {
        uint64_t v12 = v11;
        v14[0] = MEMORY[0x1E4F14BE8];
        v14[1] = 0x40000000;
        v14[2] = __NEHelperSendRequest_block_invoke_2;
        v14[3] = &unk_1E598CD68;
        v14[4] = v10;
        xpc_connection_send_message_with_reply(v11, a1, a2, v14);
        xpc_release(v12);
      }
      else
      {
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        int v13 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_error_impl(&dword_19DD92000, v13, OS_LOG_TYPE_ERROR, "nehelper_copy_connection_for_delegate_class() returned NULL", buf, 2u);
        }
        block[0] = MEMORY[0x1E4F14BE8];
        block[1] = 0x40000000;
        block[2] = __NEHelperSendRequest_block_invoke;
        block[3] = &unk_1E598CD40;
        block[4] = v10;
        dispatch_async(a2, block);
      }
    }
    else
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      int v7 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_19DD92000, v7, OS_LOG_TYPE_ERROR, "request has an invalid delegate class ID", buf, 2u);
      }
      a3[2](a3, 0, 22, 0);
    }
    return;
  }
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  size_t v8 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    int v9 = "response_handler is NULL";
    goto LABEL_22;
  }
}

void __NEHelperSendRequest_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  int v2 = *(const void **)(a1 + 32);

  _Block_release(v2);
}

void __NEHelperSendRequest_block_invoke_2(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x19F3B5680](a2) == MEMORY[0x1E4F14D40])
  {
    xpc_dictionary_get_int64(a2, "result-code");
    xpc_dictionary_get_value(a2, "result-data");
    size_t v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    size_t v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v4();
  uint64_t v5 = *(const void **)(a1 + 32);

  _Block_release(v5);
}

uint64_t NEHelperGetPFKeySocket()
{
  uint64_t v11 = *MEMORY[0x1E4F14BF8];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v0, "delegate-class-id", 4uLL);
  xpc_dictionary_set_uint64(v0, "socket-type", 1uLL);
  xpc_object_t v1 = NEHelperCopyResponse(v0);
  if (!v1)
  {
    uint64_t v5 = 0xFFFFFFFFLL;
    goto LABEL_11;
  }
  int v2 = v1;
  if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40])
  {
    int int64 = xpc_dictionary_get_int64(v2, "result-code");
    if (!int64)
    {
      uint64_t v5 = xpc_dictionary_dup_fd(v2, "result-data");
      goto LABEL_9;
    }
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    size_t v4 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      size_t v8 = strerror(int64);
      __int16 v9 = 1024;
      int v10 = int64;
      _os_log_error_impl(&dword_19DD92000, v4, OS_LOG_TYPE_ERROR, "Failed to get pfkey socket with error %s(%d)", (uint8_t *)&v7, 0x12u);
    }
  }
  uint64_t v5 = 0xFFFFFFFFLL;
LABEL_9:
  xpc_release(v2);
LABEL_11:
  xpc_release(v0);
  return v5;
}

uint64_t NEHelperGetIKESocket(unsigned __int8 *a1, unsigned __int8 *a2, const char *a3, int a4)
{
  return NEHelperGetIKESocketWithResult(a1, a2, a3, a4, 0);
}

uint64_t NEHelperGetIKESocketWithResult(unsigned __int8 *a1, unsigned __int8 *a2, const char *a3, int a4, int *a5)
{
  uint64_t v22 = *MEMORY[0x1E4F14BF8];
  if (a1 && a2)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "delegate-class-id", 4uLL);
    xpc_dictionary_set_uint64(v10, "socket-type", 2uLL);
    xpc_dictionary_set_data(v10, "socket-localaddr", a1, *a1);
    xpc_dictionary_set_data(v10, "socket-remoteaddr", a2, *a2);
    if (a4) {
      xpc_dictionary_set_uint64(v10, "socket-effective-pid", a4);
    }
    if (a3) {
      xpc_dictionary_set_string(v10, "socket-interface", a3);
    }
    xpc_object_t v11 = NEHelperCopyResponse(v10);
    if (!v11)
    {
      uint64_t v13 = 0xFFFFFFFFLL;
LABEL_24:
      xpc_release(v10);
      return v13;
    }
    uint64_t v12 = v11;
    if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40])
    {
      int int64 = xpc_dictionary_get_int64(v12, "result-code");
      int v15 = int64;
      if (int64)
      {
        if (strerror_r(int64, __strerrbuf, 0x80uLL)) {
          __strerrbuf[0] = 0;
        }
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        int v16 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
        {
          v18[0] = 67109378;
          v18[1] = v15;
          __int16 v19 = 2080;
          size_t v20 = __strerrbuf;
          _os_log_error_impl(&dword_19DD92000, v16, OS_LOG_TYPE_ERROR, "NEHelperGetIKESocket failed: [%d] %s", (uint8_t *)v18, 0x12u);
        }
        uint64_t v13 = 0xFFFFFFFFLL;
        if (!a5) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t v13 = xpc_dictionary_dup_fd(v12, "result-data");
        if (!a5) {
          goto LABEL_23;
        }
      }
      *a5 = v15;
    }
    else
    {
      uint64_t v13 = 0xFFFFFFFFLL;
    }
LABEL_23:
    xpc_release(v12);
    goto LABEL_24;
  }
  if (a5) {
    *a5 = 22;
  }
  return 0xFFFFFFFFLL;
}

xpc_object_t NEHelperCopyAppInfo(int a1, const char *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F14BF8];
  if (a1 || a2)
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    if (v4)
    {
      uint64_t v5 = v4;
      xpc_dictionary_set_uint64(v4, "delegate-class-id", 8uLL);
      if (a1) {
        xpc_dictionary_set_uint64(v5, "pid", a1);
      }
      if (a2) {
        xpc_dictionary_set_string(v5, "app-identifier", a2);
      }
      xpc_object_t v6 = NEHelperCopyResponse(v5);
      if (!v6)
      {
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        xpc_object_t v11 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v20) = 0;
          _os_log_error_impl(&dword_19DD92000, v11, OS_LOG_TYPE_ERROR, "nehelper sent NULL copy app info response", (uint8_t *)&v20, 2u);
        }
        xpc_object_t v10 = 0;
        goto LABEL_27;
      }
      int v7 = v6;
      if (MEMORY[0x19F3B5680]() != MEMORY[0x1E4F14D40])
      {
        size_t v8 = (void *)MEMORY[0x19F3B54A0](v7);
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        __int16 v9 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
        {
          int v20 = 136315138;
          size_t v21 = v8;
          _os_log_error_impl(&dword_19DD92000, v9, OS_LOG_TYPE_ERROR, "nehelper sent invalid copy app info response: %s", (uint8_t *)&v20, 0xCu);
        }
        free(v8);
        goto LABEL_25;
      }
      int int64 = xpc_dictionary_get_int64(v7, "result-code");
      if (int64)
      {
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        uint64_t v13 = ne_log_obj_log_obj;
        if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
          goto LABEL_25;
        }
        int v20 = 67109120;
        LODWORD(v21) = int64;
        uint64_t v17 = "received invalid copy app info response result %d";
        int v18 = v13;
        uint32_t v19 = 8;
      }
      else
      {
        xpc_object_t value = xpc_dictionary_get_value(v7, "result-data");
        if (value)
        {
          xpc_object_t v10 = xpc_copy(value);
          goto LABEL_26;
        }
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        uint64_t v16 = ne_log_obj_log_obj;
        if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
        {
LABEL_25:
          xpc_object_t v10 = 0;
LABEL_26:
          xpc_release(v7);
LABEL_27:
          xpc_release(v5);
          return v10;
        }
        LOWORD(v20) = 0;
        uint64_t v17 = "received NULL copy app info result";
        int v18 = v16;
        uint32_t v19 = 2;
      }
      _os_log_error_impl(&dword_19DD92000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v20, v19);
      goto LABEL_25;
    }
  }
  return 0;
}

uint64_t NEHelperGetKernelControlSocket(const char *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F14BF8];
  if (a1)
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v2, "delegate-class-id", 4uLL);
    xpc_dictionary_set_uint64(v2, "socket-type", 3uLL);
    xpc_dictionary_set_string(v2, "socket-control-name", a1);
    xpc_object_t v3 = NEHelperCopyResponse(v2);
    if (!v3)
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      size_t v8 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_19DD92000, v8, OS_LOG_TYPE_ERROR, "nehelper sent NULL kernel control socket response", buf, 2u);
      }
      uint64_t v7 = 0xFFFFFFFFLL;
      goto LABEL_27;
    }
    xpc_object_t v4 = v3;
    if (MEMORY[0x19F3B5680]() != MEMORY[0x1E4F14D40])
    {
      uint64_t v5 = (void *)MEMORY[0x19F3B54A0](v4);
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      xpc_object_t v6 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v24 = v5;
        _os_log_error_impl(&dword_19DD92000, v6, OS_LOG_TYPE_ERROR, "nehelper sent invalid kernel control socket response: %s", buf, 0xCu);
      }
      free(v5);
      goto LABEL_25;
    }
    int int64 = xpc_dictionary_get_int64(v4, "result-code");
    if (int64)
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint64_t v10 = ne_log_obj_log_obj;
      if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v24) = int64;
      xpc_object_t v11 = "received invalid kernel control socket result %d";
      uint64_t v12 = v10;
      uint32_t v13 = 8;
    }
    else
    {
      xpc_object_t value = xpc_dictionary_get_value(v4, "result-data");
      int v15 = value;
      if (value && MEMORY[0x19F3B5680](value) == MEMORY[0x1E4F14D60])
      {
        uint64_t v7 = xpc_fd_dup(v15);
        if ((v7 & 0x80000000) != 0)
        {
          int v18 = *__error();
          if (strerror_r(v18, (char *)buf, 0x80uLL)) {
            buf[0] = 0;
          }
          if (ne_log_obj_g_init != -1) {
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          }
          uint32_t v19 = ne_log_obj_log_obj;
          if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_FAULT))
          {
            v20[0] = 67109378;
            v20[1] = v18;
            __int16 v21 = 2080;
            uint64_t v22 = buf;
            _os_log_fault_impl(&dword_19DD92000, v19, OS_LOG_TYPE_FAULT, "Failed to dup the file descriptor returned by nehelper: [%d] %s", (uint8_t *)v20, 0x12u);
          }
        }
        goto LABEL_26;
      }
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint64_t v16 = ne_log_obj_log_obj;
      if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
LABEL_25:
        uint64_t v7 = 0xFFFFFFFFLL;
LABEL_26:
        xpc_release(v4);
LABEL_27:
        xpc_release(v2);
        return v7;
      }
      *(_DWORD *)long long buf = 134217984;
      uint64_t v24 = v15;
      xpc_object_t v11 = "Response from nehelper does not contain a file descriptor: %p";
      uint64_t v12 = v16;
      uint32_t v13 = 12;
    }
    _os_log_error_impl(&dword_19DD92000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    goto LABEL_25;
  }
  return 0xFFFFFFFFLL;
}

uint64_t NEHelperGetKernelControlSocketExtended(const char *a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F14BF8];
  if (a1)
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "delegate-class-id", 4uLL);
    xpc_dictionary_set_uint64(v4, "socket-type", 3uLL);
    xpc_dictionary_set_string(v4, "socket-control-name", a1);
    if (a2) {
      xpc_dictionary_set_value(v4, "socket-options", a2);
    }
    xpc_object_t v5 = NEHelperCopyResponse(v4);
    if (!v5)
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      __int16 v9 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_19DD92000, v9, OS_LOG_TYPE_ERROR, "nehelper sent NULL kernel control socket response", buf, 2u);
      }
      uint64_t v10 = 0xFFFFFFFFLL;
      goto LABEL_28;
    }
    xpc_object_t v6 = v5;
    if (MEMORY[0x19F3B5680]() != MEMORY[0x1E4F14D40])
    {
      uint64_t v7 = (char *)MEMORY[0x19F3B54A0](v6);
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      size_t v8 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v27 = v7;
        _os_log_error_impl(&dword_19DD92000, v8, OS_LOG_TYPE_ERROR, "nehelper sent invalid kernel control socket response: %s", buf, 0xCu);
      }
      free(v7);
      goto LABEL_26;
    }
    int int64 = xpc_dictionary_get_int64(v6, "result-code");
    if (int64)
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint64_t v12 = ne_log_obj_log_obj;
      if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v27) = int64;
      uint32_t v13 = "received invalid kernel control socket result %d";
      int v14 = v12;
      uint32_t v15 = 8;
    }
    else
    {
      xpc_object_t value = xpc_dictionary_get_value(v6, "result-data");
      uint64_t v17 = value;
      if (value && MEMORY[0x19F3B5680](value) == MEMORY[0x1E4F14D60])
      {
        uint64_t v10 = xpc_fd_dup(v17);
        if ((v10 & 0x80000000) != 0)
        {
          int v20 = *__error();
          if (strerror_r(v20, (char *)buf, 0x80uLL)) {
            buf[0] = 0;
          }
          if (ne_log_obj_g_init != -1) {
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          }
          __int16 v21 = ne_log_obj_log_obj;
          if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_FAULT))
          {
            v23[0] = 67109378;
            v23[1] = v20;
            __int16 v24 = 2080;
            uint64_t v25 = buf;
            _os_log_fault_impl(&dword_19DD92000, v21, OS_LOG_TYPE_FAULT, "Failed to dup the file descriptor returned by nehelper: [%d] %s", (uint8_t *)v23, 0x12u);
          }
        }
        goto LABEL_27;
      }
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint64_t v18 = ne_log_obj_log_obj;
      if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
LABEL_26:
        uint64_t v10 = 0xFFFFFFFFLL;
LABEL_27:
        xpc_release(v6);
LABEL_28:
        xpc_release(v4);
        return v10;
      }
      *(_DWORD *)long long buf = 134217984;
      uint64_t v27 = (const char *)v17;
      uint32_t v13 = "Response from nehelper does not contain a file descriptor: %p";
      int v14 = v18;
      uint32_t v15 = 12;
    }
    _os_log_error_impl(&dword_19DD92000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    goto LABEL_26;
  }
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  uint64_t v22 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v27 = "NEHelperGetKernelControlSocketExtended";
    _os_log_fault_impl(&dword_19DD92000, v22, OS_LOG_TYPE_FAULT, "%s called with null controlName", buf, 0xCu);
  }
  return 0xFFFFFFFFLL;
}

uint64_t NEHelperGetNECPSessionFD()
{
  uint64_t v13 = *MEMORY[0x1E4F14BF8];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v0, "delegate-class-id", 4uLL);
  xpc_dictionary_set_uint64(v0, "socket-type", 4uLL);
  int v1 = 5;
  uint64_t v2 = MEMORY[0x1E4F14D40];
  while (1)
  {
    xpc_object_t v3 = NEHelperCopyResponse(v0);
    if (v3) {
      break;
    }
LABEL_9:
    if (!--v1)
    {
      uint64_t v7 = 0xFFFFFFFFLL;
      goto LABEL_19;
    }
  }
  xpc_object_t v4 = v3;
  if (MEMORY[0x19F3B5680]() != v2)
  {
    xpc_object_t v5 = (void *)MEMORY[0x19F3B54A0](v4);
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    xpc_object_t v6 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v12 = v5;
      _os_log_error_impl(&dword_19DD92000, v6, OS_LOG_TYPE_ERROR, "nehelper sent invalid necp session fd response: %s", buf, 0xCu);
    }
    free(v5);
    xpc_release(v4);
    goto LABEL_9;
  }
  int int64 = xpc_dictionary_get_int64(v4, "result-code");
  if (int64)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    __int16 v9 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v12) = int64;
      _os_log_error_impl(&dword_19DD92000, v9, OS_LOG_TYPE_ERROR, "received invalid necp session fd result %d", buf, 8u);
    }
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = xpc_dictionary_dup_fd(v4, "result-data");
  }
  xpc_release(v4);
LABEL_19:
  xpc_release(v0);
  return v7;
}

xpc_object_t NEHelperInterfaceCreate(const char *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "delegate-class-id", 5uLL);
    xpc_dictionary_set_uint64(v6, "interface-command", 1uLL);
    xpc_dictionary_set_string(v6, "interface-name", a1);
    xpc_dictionary_set_uint64(v6, "interface-type", a2);
    xpc_dictionary_set_uint64(v6, "interface-ftype", a3);
    xpc_object_t v7 = NEHelperCopyResponse(v6);
    if (!v7)
    {
      xpc_object_t v9 = 0;
      goto LABEL_13;
    }
    size_t v8 = v7;
    if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40] && !xpc_dictionary_get_int64(v8, "result-code"))
    {
      xpc_object_t value = xpc_dictionary_get_value(v8, "result-data");
      if (value)
      {
        xpc_object_t v9 = xpc_copy(value);
        goto LABEL_6;
      }
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint64_t v13 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v14 = 0;
        _os_log_error_impl(&dword_19DD92000, v13, OS_LOG_TYPE_ERROR, "received NULL interface info in result", v14, 2u);
      }
    }
    xpc_object_t v9 = 0;
LABEL_6:
    xpc_release(v8);
LABEL_13:
    xpc_release(v6);
    return v9;
  }
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  uint64_t v10 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_19DD92000, v10, OS_LOG_TYPE_ERROR, "ifname is NULL", buf, 2u);
  }
  return 0;
}

uint64_t NEHelperInterfaceDestroy(const char *a1)
{
  if (!a1) {
    return 22;
  }
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "delegate-class-id", 5uLL);
  xpc_dictionary_set_uint64(v2, "interface-command", 7uLL);
  xpc_dictionary_set_string(v2, "interface-name", a1);
  xpc_object_t v3 = NEHelperCopyResponse(v2);
  if (v3)
  {
    xpc_object_t v4 = v3;
    if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40]) {
      int64_t int64 = xpc_dictionary_get_int64(v4, "result-code");
    }
    else {
      int64_t int64 = 22;
    }
    xpc_release(v4);
  }
  else
  {
    int64_t int64 = 22;
  }
  xpc_release(v2);
  return int64;
}

int64_t NEHelperInterfaceSetAddressInternal(const char *a1, unsigned __int8 *a2, unsigned __int8 *a3, const void *a4)
{
  int64_t int64 = 22;
  if (a1 && a2)
  {
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "delegate-class-id", 5uLL);
    xpc_dictionary_set_uint64(v9, "interface-command", 2uLL);
    xpc_dictionary_set_string(v9, "interface-name", a1);
    xpc_dictionary_set_data(v9, "interface-address", a2, *a2);
    if (a3) {
      xpc_dictionary_set_data(v9, "interface-netmask", a3, *a3);
    }
    if (a4) {
      xpc_dictionary_set_data(v9, "interface-lifetime", a4, 0x18uLL);
    }
    xpc_object_t v10 = NEHelperCopyResponse(v9);
    if (v10)
    {
      xpc_object_t v11 = v10;
      if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40]) {
        int64_t int64 = xpc_dictionary_get_int64(v11, "result-code");
      }
      else {
        int64_t int64 = 22;
      }
      xpc_release(v11);
    }
    else
    {
      int64_t int64 = 22;
    }
    xpc_release(v9);
  }
  return int64;
}

int64_t NEHelperInterfaceSetAddress(const char *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  return NEHelperInterfaceSetAddressInternal(a1, a2, a3, 0);
}

int64_t NEHelperInterfaceRemoveAddress(const char *a1, unsigned __int8 *a2)
{
  int64_t int64 = 22;
  if (a1 && a2)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "delegate-class-id", 5uLL);
    xpc_dictionary_set_uint64(v5, "interface-command", 5uLL);
    xpc_dictionary_set_string(v5, "interface-name", a1);
    xpc_dictionary_set_data(v5, "interface-address", a2, *a2);
    xpc_object_t v6 = NEHelperCopyResponse(v5);
    if (v6)
    {
      xpc_object_t v7 = v6;
      if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40]) {
        int64_t int64 = xpc_dictionary_get_int64(v7, "result-code");
      }
      else {
        int64_t int64 = 22;
      }
      xpc_release(v7);
    }
    else
    {
      int64_t int64 = 22;
    }
    xpc_release(v5);
  }
  return int64;
}

uint64_t NEHelperInterfaceSetMTU(const char *a1, int a2)
{
  if (!a1) {
    return 22;
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v4, "delegate-class-id", 5uLL);
  xpc_dictionary_set_uint64(v4, "interface-command", 3uLL);
  xpc_dictionary_set_string(v4, "interface-name", a1);
  xpc_dictionary_set_uint64(v4, "interface-mtu", a2);
  xpc_object_t v5 = NEHelperCopyResponse(v4);
  if (v5)
  {
    xpc_object_t v6 = v5;
    if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40]) {
      int64_t int64 = xpc_dictionary_get_int64(v6, "result-code");
    }
    else {
      int64_t int64 = 22;
    }
    xpc_release(v6);
  }
  else
  {
    int64_t int64 = 22;
  }
  xpc_release(v4);
  return int64;
}

int64_t NEHelperInterfaceSetDelegate(const char *a1, uint64_t a2, const char *a3)
{
  int64_t int64 = 22;
  if (a1 && a3)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "delegate-class-id", 5uLL);
    xpc_dictionary_set_uint64(v7, "interface-command", 6uLL);
    xpc_dictionary_set_string(v7, "interface-name", a1);
    xpc_dictionary_set_uint64(v7, "interface-type", a2);
    xpc_dictionary_set_string(v7, "interface-delegate-name", a3);
    xpc_object_t v8 = NEHelperCopyResponse(v7);
    if (v8)
    {
      xpc_object_t v9 = v8;
      if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40]) {
        int64_t int64 = xpc_dictionary_get_int64(v9, "result-code");
      }
      else {
        int64_t int64 = 22;
      }
      xpc_release(v9);
    }
    else
    {
      int64_t int64 = 22;
    }
    xpc_release(v7);
  }
  return int64;
}

uint64_t NEHelperInterfaceSetOption(int a1, int a2, const void *a3, size_t a4)
{
  if (a1 < 0) {
    return 22;
  }
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v8, "delegate-class-id", 5uLL);
  xpc_dictionary_set_uint64(v8, "interface-command", 4uLL);
  xpc_dictionary_set_fd(v8, "interface-socket", a1);
  xpc_dictionary_set_uint64(v8, "interface-option", a2);
  if (a3 && a4) {
    xpc_dictionary_set_data(v8, "interface-option-data", a3, a4);
  }
  xpc_object_t v9 = NEHelperCopyResponse(v8);
  if (v9)
  {
    xpc_object_t v10 = v9;
    if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40]) {
      int64_t int64 = xpc_dictionary_get_int64(v10, "result-code");
    }
    else {
      int64_t int64 = 22;
    }
    xpc_release(v10);
  }
  else
  {
    int64_t int64 = 22;
  }
  xpc_release(v8);
  return int64;
}

int64_t NEHelperInterfaceSetDescription(const char *a1, uint64_t a2, const char *a3)
{
  int64_t int64 = 22;
  if (a1 && a3)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "delegate-class-id", 5uLL);
    xpc_dictionary_set_uint64(v7, "interface-command", 8uLL);
    xpc_dictionary_set_string(v7, "interface-name", a1);
    xpc_dictionary_set_uint64(v7, "interface-type", a2);
    xpc_dictionary_set_string(v7, "interface-description", a3);
    xpc_object_t v8 = NEHelperCopyResponse(v7);
    if (v8)
    {
      xpc_object_t v9 = v8;
      if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40]) {
        int64_t int64 = xpc_dictionary_get_int64(v9, "result-code");
      }
      else {
        int64_t int64 = 22;
      }
      xpc_release(v9);
    }
    else
    {
      int64_t int64 = 22;
    }
    xpc_release(v7);
  }
  return int64;
}

int64_t NEHelperSettingsSetBool(const char *a1, BOOL a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v4, "delegate-class-id", 2uLL);
  xpc_dictionary_set_string(v4, "setting-name", a1);
  xpc_dictionary_set_int64(v4, "setting-type", 1);
  xpc_dictionary_set_BOOL(v4, "setting-value", a2);
  xpc_object_t v5 = NEHelperCopyResponse(v4);
  if (v5)
  {
    xpc_object_t v6 = v5;
    if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40]) {
      int64_t int64 = xpc_dictionary_get_int64(v6, "result-code");
    }
    else {
      int64_t int64 = 22;
    }
    xpc_release(v6);
  }
  else
  {
    int64_t int64 = 22;
  }
  xpc_release(v4);
  return int64;
}

int64_t NEHelperSettingsSetNumber(const char *a1, int64_t a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v4, "delegate-class-id", 2uLL);
  xpc_dictionary_set_string(v4, "setting-name", a1);
  xpc_dictionary_set_int64(v4, "setting-type", 2);
  xpc_dictionary_set_int64(v4, "setting-value", a2);
  xpc_object_t v5 = NEHelperCopyResponse(v4);
  if (v5)
  {
    xpc_object_t v6 = v5;
    if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40]) {
      int64_t int64 = xpc_dictionary_get_int64(v6, "result-code");
    }
    else {
      int64_t int64 = 22;
    }
    xpc_release(v6);
  }
  else
  {
    int64_t int64 = 22;
  }
  xpc_release(v4);
  return int64;
}

uint64_t NEHelperSettingsSetArray(const char *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F14BF8];
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (a1 && *a1)
  {
    xpc_object_t v5 = v4;
    if (a2 && MEMORY[0x19F3B5680](a2) != MEMORY[0x1E4F14D18])
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      xpc_object_t v6 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        int v18 = 136315138;
        uint32_t v19 = a1;
        _os_log_error_impl(&dword_19DD92000, v6, OS_LOG_TYPE_ERROR, "Cannot use NEHelperSettingsSetArray to set %s to a non-array", (uint8_t *)&v18, 0xCu);
      }
      return 22;
    }
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    xpc_object_t v8 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      uint32_t v19 = a1;
      _os_log_impl(&dword_19DD92000, v8, OS_LOG_TYPE_DEFAULT, "NEHelperSettingsSetArray called with %s", (uint8_t *)&v18, 0xCu);
    }
    if (!strcmp(a1, "CriticalDomains"))
    {
      if (a2)
      {
        uint64_t v13 = MEMORY[0x19F3B54A0](a2);
        if (v13)
        {
          int v14 = (void *)v13;
          if (ne_log_large_obj_g_large_init != -1) {
            dispatch_once(&ne_log_large_obj_g_large_init, &__block_literal_global_5);
          }
          uint32_t v15 = ne_log_large_obj_large_log_obj;
          if (os_log_type_enabled((os_log_t)ne_log_large_obj_large_log_obj, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 136315394;
            uint32_t v19 = "CriticalDomains";
            __int16 v20 = 2080;
            __int16 v21 = v14;
            _os_log_impl(&dword_19DD92000, v15, OS_LOG_TYPE_DEFAULT, "Setting %s to %s", (uint8_t *)&v18, 0x16u);
          }
          free(v14);
        }
        else
        {
          if (ne_log_obj_g_init != -1) {
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          }
          uint64_t v17 = ne_log_obj_log_obj;
          if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
          {
            int v18 = 136315138;
            uint32_t v19 = "CriticalDomains";
            _os_log_error_impl(&dword_19DD92000, v17, OS_LOG_TYPE_ERROR, "Setting %s to an unknown value", (uint8_t *)&v18, 0xCu);
          }
        }
      }
      else
      {
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        uint64_t v16 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 136315138;
          uint32_t v19 = "CriticalDomains";
          _os_log_impl(&dword_19DD92000, v16, OS_LOG_TYPE_DEFAULT, "Removing %s", (uint8_t *)&v18, 0xCu);
        }
      }
    }
    xpc_dictionary_set_uint64(v5, "delegate-class-id", 2uLL);
    xpc_dictionary_set_string(v5, "setting-name", a1);
    xpc_dictionary_set_int64(v5, "setting-type", 3);
    xpc_dictionary_set_value(v5, "setting-value", a2);
    xpc_object_t v9 = NEHelperCopyResponse(v5);
    xpc_object_t v10 = v9;
    if (v9 && MEMORY[0x19F3B5680](v9) == MEMORY[0x1E4F14D40])
    {
      int64_t int64 = xpc_dictionary_get_int64(v10, "result-code");
      if (!int64) {
        goto LABEL_22;
      }
    }
    else
    {
      int64_t int64 = 22;
    }
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    xpc_object_t v11 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      int v18 = 67109120;
      LODWORD(v19) = int64;
      _os_log_error_impl(&dword_19DD92000, v11, OS_LOG_TYPE_ERROR, "NEHelperSettingsSetArray failed with error: %d", (uint8_t *)&v18, 8u);
      if (!v10) {
        goto LABEL_23;
      }
    }
    else if (!v10)
    {
LABEL_23:
      xpc_release(v5);
      return int64;
    }
LABEL_22:
    xpc_release(v10);
    goto LABEL_23;
  }
  return 22;
}

uint64_t NEHelperSettingsRemove(const char *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F14BF8];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (!a1 || !*a1) {
    return 22;
  }
  xpc_object_t v3 = v2;
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  xpc_object_t v4 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    xpc_object_t v11 = a1;
    _os_log_impl(&dword_19DD92000, v4, OS_LOG_TYPE_DEFAULT, "Removing %s", (uint8_t *)&v10, 0xCu);
  }
  xpc_dictionary_set_uint64(v3, "delegate-class-id", 2uLL);
  xpc_dictionary_set_string(v3, "setting-name", a1);
  xpc_dictionary_set_int64(v3, "setting-type", 4);
  xpc_object_t v5 = NEHelperCopyResponse(v3);
  xpc_object_t v6 = v5;
  if (v5 && MEMORY[0x19F3B5680](v5) == MEMORY[0x1E4F14D40])
  {
    int64_t int64 = xpc_dictionary_get_int64(v6, "result-code");
    if (!int64) {
      goto LABEL_14;
    }
  }
  else
  {
    int64_t int64 = 22;
  }
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  xpc_object_t v8 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
  {
    int v10 = 67109120;
    LODWORD(v11) = int64;
    _os_log_error_impl(&dword_19DD92000, v8, OS_LOG_TYPE_ERROR, "NEHelperSettingsRemove failed with error: %d", (uint8_t *)&v10, 8u);
    if (!v6) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (v6) {
LABEL_14:
  }
    xpc_release(v6);
LABEL_15:
  xpc_release(v3);
  return int64;
}

int64_t NEHelperCacheSetRoutes(const char *a1, void *a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v4, "delegate-class-id", 1uLL);
  xpc_dictionary_set_uint64(v4, "cache-command", 2uLL);
  xpc_dictionary_set_string(v4, "cache-service", a1);
  xpc_dictionary_set_value(v4, "cache-routes", a2);
  xpc_object_t v5 = NEHelperCopyResponse(v4);
  if (v5)
  {
    xpc_object_t v6 = v5;
    if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40]) {
      int64_t int64 = xpc_dictionary_get_int64(v6, "result-code");
    }
    else {
      int64_t int64 = 22;
    }
    xpc_release(v6);
  }
  else
  {
    int64_t int64 = 22;
  }
  xpc_release(v4);
  return int64;
}

int64_t NEHelperCacheSetMatchDomains(const char *a1, void *a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v4, "delegate-class-id", 1uLL);
  xpc_dictionary_set_uint64(v4, "cache-command", 9uLL);
  xpc_dictionary_set_string(v4, "cache-service", a1);
  xpc_dictionary_set_value(v4, "cache-match-domains", a2);
  xpc_object_t v5 = NEHelperCopyResponse(v4);
  if (v5)
  {
    xpc_object_t v6 = v5;
    if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40]) {
      int64_t int64 = xpc_dictionary_get_int64(v6, "result-code");
    }
    else {
      int64_t int64 = 22;
    }
    xpc_release(v6);
  }
  else
  {
    int64_t int64 = 22;
  }
  xpc_release(v4);
  return int64;
}

uint64_t NEHelperCacheSetDomainDictionaries(const char *a1, const char *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F14BF8];
  if (a2)
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "delegate-class-id", 1uLL);
    xpc_dictionary_set_uint64(v6, "cache-command", 4uLL);
    xpc_dictionary_set_string(v6, "cache-service", a1);
    xpc_dictionary_set_value(v6, "cache-domain-dictionaries", a3);
    xpc_dictionary_set_string(v6, "cache-interface-name", a2);
    xpc_object_t v7 = NEHelperCopyResponse(v6);
    if (v7)
    {
      xpc_object_t v8 = v7;
      if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40]) {
        int64_t int64 = xpc_dictionary_get_int64(v8, "result-code");
      }
      else {
        int64_t int64 = 22;
      }
      xpc_release(v8);
    }
    else
    {
      int64_t int64 = 22;
    }
    xpc_release(v6);
  }
  else
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    int v10 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      uint64_t v13 = a1;
      _os_log_impl(&dword_19DD92000, v10, OS_LOG_TYPE_INFO, "missing interface name, set domain dictionaries failed for %s", (uint8_t *)&v12, 0xCu);
    }
    return 22;
  }
  return int64;
}

uint64_t NEHelperCacheAddRedirectedAddress(const char *a1, unsigned __int8 *a2)
{
  if (a1)
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "delegate-class-id", 1uLL);
    xpc_dictionary_set_uint64(v4, "cache-command", 5uLL);
    xpc_dictionary_set_data(v4, "cache-redirected-address", a2, *a2);
    xpc_dictionary_set_string(v4, "cache-interface-name", a1);
    xpc_object_t v5 = NEHelperCopyResponse(v4);
    if (v5)
    {
      xpc_object_t v6 = v5;
      if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40]) {
        int64_t int64 = xpc_dictionary_get_int64(v6, "result-code");
      }
      else {
        int64_t int64 = 22;
      }
      xpc_release(v6);
    }
    else
    {
      int64_t int64 = 22;
    }
    xpc_release(v4);
  }
  else
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    xpc_object_t v8 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl(&dword_19DD92000, v8, OS_LOG_TYPE_INFO, "missing interface name, add redirected address failed", v10, 2u);
    }
    return 22;
  }
  return int64;
}

uint64_t NEHelperCacheClearRedirectedAddresses(const char *a1)
{
  if (a1)
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v2, "delegate-class-id", 1uLL);
    xpc_dictionary_set_uint64(v2, "cache-command", 7uLL);
    xpc_dictionary_set_string(v2, "cache-interface-name", a1);
    xpc_object_t v3 = NEHelperCopyResponse(v2);
    if (v3)
    {
      xpc_object_t v4 = v3;
      if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40]) {
        int64_t int64 = xpc_dictionary_get_int64(v4, "result-code");
      }
      else {
        int64_t int64 = 22;
      }
      xpc_release(v4);
    }
    else
    {
      int64_t int64 = 22;
    }
    xpc_release(v2);
  }
  else
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    xpc_object_t v6 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)xpc_object_t v8 = 0;
      _os_log_impl(&dword_19DD92000, v6, OS_LOG_TYPE_INFO, "missing interface name, clear redirected address failed", v8, 2u);
    }
    return 22;
  }
  return int64;
}

xpc_object_t NEHelperCacheCopyAppUUIDMapping(const char *a1, const char *a2)
{
  return NEHelperCacheCopyAppUUIDMappingForUIDExtended(0, a1, a2, 0);
}

void NEHelperCacheClearUUIDs()
{
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  int v1 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)xpc_object_t v3 = 0;
    _os_log_impl(&dword_19DD92000, v1, OS_LOG_TYPE_DEFAULT, "sending a message to clear the UUID cache", v3, 2u);
  }
  xpc_dictionary_set_uint64(v0, "delegate-class-id", 1uLL);
  xpc_dictionary_set_uint64(v0, "cache-command", 8uLL);
  xpc_object_t v2 = NEHelperCopyResponse(v0);
  if (v2) {
    xpc_release(v2);
  }
  xpc_release(v0);
}

void NEHelperCacheClearUUIDsForBundleID(const char *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F14BF8];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  xpc_object_t v3 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    xpc_object_t v6 = a1;
    _os_log_impl(&dword_19DD92000, v3, OS_LOG_TYPE_DEFAULT, "sending a message to clear the UUIDs for %s from the cache", (uint8_t *)&v5, 0xCu);
  }
  xpc_dictionary_set_uint64(v2, "delegate-class-id", 1uLL);
  xpc_dictionary_set_uint64(v2, "cache-command", 8uLL);
  xpc_dictionary_set_string(v2, "cache-app-bundle-id", a1);
  xpc_object_t v4 = NEHelperCopyResponse(v2);
  if (v4) {
    xpc_release(v4);
  }
  xpc_release(v2);
}

void NEHelperCachePopulateUUIDsForConfiguration(const unsigned __int8 *a1, unsigned int a2)
{
  uint64_t v13 = *MEMORY[0x1E4F14BF8];
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  memset(out, 0, 37);
  uuid_unparse(a1, out);
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  int v5 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    xpc_object_t v11 = out;
    _os_log_impl(&dword_19DD92000, v5, OS_LOG_TYPE_DEFAULT, "Sending a message to populate the cache with UUIDs from configuration %s", (uint8_t *)&v10, 0xCu);
  }
  xpc_dictionary_set_uint64(v4, "delegate-class-id", 1uLL);
  xpc_dictionary_set_uint64(v4, "cache-command", 0xAuLL);
  xpc_dictionary_set_uuid(v4, "config-identifier", a1);
  xpc_dictionary_set_int64(v4, "cache-user-uid", a2);
  xpc_object_t v6 = NEHelperCopyResponse(v4);
  if (v6)
  {
    uint64_t v7 = v6;
    int int64 = xpc_dictionary_get_int64(v6, "result-code");
    if (int64)
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      xpc_object_t v9 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        int v10 = 67109120;
        LODWORD(v11) = int64;
        _os_log_error_impl(&dword_19DD92000, v9, OS_LOG_TYPE_ERROR, "Populating the cache failed: %d", (uint8_t *)&v10, 8u);
      }
    }
    xpc_release(v7);
  }
  xpc_release(v4);
}

xpc_object_t NEHelperCopyAggregatePathRules()
{
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (v0)
  {
    int v1 = v0;
    xpc_dictionary_set_uint64(v0, "delegate-class-id", 6uLL);
    xpc_dictionary_set_int64(v1, "config-operation", 6);
    xpc_object_t v2 = NEHelperCopyResponse(v1);
    if (!v2)
    {
      xpc_object_t v4 = 0;
      goto LABEL_8;
    }
    xpc_object_t v3 = v2;
    if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40])
    {
      xpc_object_t value = xpc_dictionary_get_value(v3, "result-data");
      xpc_object_t v4 = value;
      if (!value) {
        goto LABEL_5;
      }
      if (MEMORY[0x19F3B5680](value) == MEMORY[0x1E4F14D30])
      {
        xpc_object_t v4 = xpc_copy(v4);
        goto LABEL_5;
      }
    }
    xpc_object_t v4 = 0;
LABEL_5:
    xpc_release(v3);
LABEL_8:
    xpc_release(v1);
    return v4;
  }
  return 0;
}

xpc_object_t NEHelperCopyPerAppDomains(const char *a1, BOOL a2)
{
  if (a1
    && (!strncmp(a1, "com.apple.mobilesafari", 0x17uLL)
     || !strncmp(a1, "com.apple.webapp", 0x11uLL)
     || !strncmp(a1, "com.apple.mobilemail", 0x15uLL)
     || !strncmp(a1, "com.apple.MobileAddressBook", 0x1CuLL)
     || !strncmp(a1, "com.apple.mobilecal", 0x14uLL)
     || !strncmp(a1, "com.apple.datausage.dataaccess.activesync", 0x2AuLL)
     || !strncmp(a1, "com.apple.mobilenotes", 0x16uLL)
     || !strncmp(a1, "com.apple.reminders", 0x14uLL)))
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    if (v4)
    {
      int v5 = v4;
      xpc_dictionary_set_uint64(v4, "delegate-class-id", 6uLL);
      xpc_dictionary_set_int64(v5, "config-operation", 11);
      xpc_dictionary_set_BOOL(v5, "one-per-configuration", a2);
      xpc_dictionary_set_string(v5, "bundle-id", a1);
      xpc_object_t v6 = NEHelperCopyResponse(v5);
      if (!v6)
      {
        xpc_object_t v8 = 0;
        goto LABEL_17;
      }
      uint64_t v7 = v6;
      if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40])
      {
        xpc_object_t value = xpc_dictionary_get_value(v7, "result-data");
        xpc_object_t v8 = value;
        if (!value) {
          goto LABEL_14;
        }
        if (MEMORY[0x19F3B5680](value) == MEMORY[0x1E4F14D18])
        {
          xpc_object_t v8 = xpc_copy(v8);
          goto LABEL_14;
        }
      }
      xpc_object_t v8 = 0;
LABEL_14:
      xpc_release(v7);
LABEL_17:
      xpc_release(v5);
      return v8;
    }
  }
  return 0;
}

xpc_object_t NEHelperHandleConfigurationsChangedBySC(void *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (v2)
  {
    xpc_object_t v3 = v2;
    xpc_dictionary_set_uint64(v2, "delegate-class-id", 6uLL);
    xpc_dictionary_set_int64(v3, "config-operation", 13);
    if (a1 && MEMORY[0x19F3B5680](a1) == MEMORY[0x1E4F14D18] && xpc_array_get_count(a1)) {
      xpc_dictionary_set_value(v3, "config-ids", a1);
    }
    xpc_object_t v4 = NEHelperCopyResponse(v3);
    if (!v4)
    {
      xpc_object_t v6 = 0;
      goto LABEL_12;
    }
    int v5 = v4;
    if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40])
    {
      xpc_object_t value = xpc_dictionary_get_value(v5, "result-data");
      xpc_object_t v6 = value;
      if (!value) {
        goto LABEL_9;
      }
      if (MEMORY[0x19F3B5680](value) == MEMORY[0x1E4F14D18])
      {
        xpc_object_t v6 = xpc_copy(v6);
        goto LABEL_9;
      }
    }
    xpc_object_t v6 = 0;
LABEL_9:
    xpc_release(v5);
LABEL_12:
    xpc_release(v3);
    return v6;
  }
  return 0;
}

uint64_t NEHelperVPNSetEnabled(const unsigned __int8 *a1, BOOL a2)
{
  uint64_t v18 = *MEMORY[0x1E4F14BF8];
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (v4)
  {
    int v5 = v4;
    xpc_dictionary_set_uint64(v4, "delegate-class-id", 6uLL);
    xpc_dictionary_set_int64(v5, "config-operation", 14);
    xpc_dictionary_set_uuid(v5, "config-identifier", a1);
    xpc_dictionary_set_BOOL(v5, "enabled", a2);
    xpc_object_t v6 = NEHelperCopyResponse(v5);
    if (!v6)
    {
      uint64_t v11 = 0;
      goto LABEL_13;
    }
    uint64_t v7 = v6;
    if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40])
    {
      int64_t int64 = xpc_dictionary_get_int64(v7, "result-code");
      if (!int64)
      {
        uint64_t v11 = 1;
        goto LABEL_10;
      }
      int64_t v9 = int64;
      memset(out, 0, 37);
      uuid_unparse(a1, out);
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      int v10 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315394;
        uint64_t v14 = out;
        __int16 v15 = 2048;
        int64_t v16 = v9;
        _os_log_error_impl(&dword_19DD92000, v10, OS_LOG_TYPE_ERROR, "Failed to enable %s: %lld", (uint8_t *)&v13, 0x16u);
      }
    }
    uint64_t v11 = 0;
LABEL_10:
    xpc_release(v7);
LABEL_13:
    xpc_release(v5);
    return v11;
  }
  return 0;
}

uint64_t NEHelperVPNConfigurationExists(uint64_t a1, BOOL a2)
{
  uint64_t v2 = a1;
  uint64_t v16 = *MEMORY[0x1E4F14BF8];
  if (a1)
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    if (v4)
    {
      int v5 = v4;
      xpc_dictionary_set_uint64(v4, "delegate-class-id", 6uLL);
      xpc_dictionary_set_int64(v5, "config-operation", 15);
      xpc_dictionary_set_string(v5, "app-bundle-id", (const char *)v2);
      xpc_dictionary_set_BOOL(v5, "enable-required", a2);
      xpc_object_t v6 = NEHelperCopyResponse(v5);
      if (!v6)
      {
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        int v10 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v14) = 0;
          _os_log_error_impl(&dword_19DD92000, v10, OS_LOG_TYPE_ERROR, "nehelper sent NULL Configuration check response", (uint8_t *)&v14, 2u);
        }
        uint64_t v2 = 0;
        goto LABEL_23;
      }
      uint64_t v7 = v6;
      if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40])
      {
        int int64 = xpc_dictionary_get_int64(v7, "result-code");
        if (!int64)
        {
          uint64_t v2 = 1;
          goto LABEL_22;
        }
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        int v12 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
        {
          int v14 = 67109120;
          LODWORD(v15) = int64;
          _os_log_error_impl(&dword_19DD92000, v12, OS_LOG_TYPE_ERROR, "received invalid Configuration check result %d", (uint8_t *)&v14, 8u);
        }
      }
      else
      {
        xpc_object_t v8 = (void *)MEMORY[0x19F3B54A0](v7);
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        int64_t v9 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
        {
          int v14 = 136315138;
          __int16 v15 = v8;
          _os_log_error_impl(&dword_19DD92000, v9, OS_LOG_TYPE_ERROR, "nehelper sent invalid Configuration check response: %s", (uint8_t *)&v14, 0xCu);
        }
        free(v8);
      }
      uint64_t v2 = 0;
LABEL_22:
      xpc_release(v7);
LABEL_23:
      xpc_release(v5);
      return v2;
    }
    return 0;
  }
  return v2;
}

void NEHelperInit()
{
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (v0)
  {
    int v1 = v0;
    xpc_dictionary_set_BOOL(v0, "init-command", 1);
    xpc_object_t v2 = NEHelperCopyResponse(v1);
    if (v2) {
      xpc_release(v2);
    }
    xpc_release(v1);
  }
}

xpc_object_t NEHelperCopyCurrentNetworkInfo(const char *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F14BF8];
  if (a1)
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    if (v2)
    {
      xpc_object_t v3 = v2;
      xpc_dictionary_set_uint64(v2, "delegate-class-id", 0xAuLL);
      xpc_dictionary_set_string(v3, "interface-name", a1);
      xpc_object_t v4 = NEHelperCopyResponse(v3);
      if (!v4)
      {
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        int64_t v9 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v15) = 0;
          _os_log_error_impl(&dword_19DD92000, v9, OS_LOG_TYPE_ERROR, "nehelper sent NULL response for Wi-Fi information request", (uint8_t *)&v15, 2u);
        }
        xpc_object_t v8 = 0;
        goto LABEL_23;
      }
      int v5 = v4;
      if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40])
      {
        int64_t int64 = xpc_dictionary_get_int64(v5, "result-code");
        if (int64)
        {
          int64_t v11 = int64;
          if (ne_log_obj_g_init != -1) {
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          }
          int v12 = ne_log_obj_log_obj;
          if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
          {
            int v15 = 134217984;
            int64_t v16 = v11;
            _os_log_error_impl(&dword_19DD92000, v12, OS_LOG_TYPE_ERROR, "nehelper sent invalid result code [%lld] for Wi-Fi information request", (uint8_t *)&v15, 0xCu);
          }
        }
        else
        {
          xpc_object_t value = xpc_dictionary_get_value(v5, "result-data");
          if (value)
          {
            xpc_object_t v8 = xpc_copy(value);
            goto LABEL_22;
          }
        }
      }
      else
      {
        xpc_object_t v6 = (void *)MEMORY[0x19F3B54A0](v5);
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        uint64_t v7 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136315138;
          int64_t v16 = (int64_t)v6;
          _os_log_error_impl(&dword_19DD92000, v7, OS_LOG_TYPE_ERROR, "nehelper sent invalid response for Wi-Fi information request: %s", (uint8_t *)&v15, 0xCu);
        }
        free(v6);
      }
      xpc_object_t v8 = 0;
LABEL_22:
      xpc_release(v5);
LABEL_23:
      xpc_release(v3);
      return v8;
    }
  }
  return 0;
}

BOOL NEHelperCopyCurrentNetworkAsync(NSObject *a1, void (**a2)(void, void, void, void))
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  int v5 = v4;
  if (v4)
  {
    xpc_dictionary_set_uint64(v4, "delegate-class-id", 0xAuLL);
    xpc_dictionary_set_BOOL(v5, "security-type-requested", 1);
    NEHelperSendRequest(v5, a1, a2);
    xpc_release(v5);
  }
  return v5 != 0;
}

xpc_object_t NEHelperCopyXPCEndpointForIdentityProxyExtended(const unsigned __int8 *a1, const void *a2, size_t a3, const char *a4, void *a5)
{
  int is_null = uuid_is_null(a1);
  xpc_object_t value = 0;
  if (a3 && a2 && !is_null)
  {
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v12, "delegate-class-id", 0xEuLL);
    xpc_dictionary_set_uint64(v12, "relay-command", 1uLL);
    xpc_dictionary_set_data(v12, "relay-persistent-reference", a2, a3);
    xpc_dictionary_set_uuid(v12, "relay-config-id", a1);
    if (a4 && *a4) {
      xpc_dictionary_set_string(v12, "relay-identity-domain", a4);
    }
    if (a5) {
      xpc_dictionary_set_value(v12, "relay-options", a5);
    }
    xpc_object_t v13 = NEHelperCopyResponse(v12);
    if (v13)
    {
      int v14 = v13;
      uint64_t v15 = MEMORY[0x19F3B5680]();
      uint64_t v16 = MEMORY[0x1E4F14D40];
      if (v15 == MEMORY[0x1E4F14D40]
        && (xpc_object_t v18 = xpc_dictionary_get_value(v14, "result-data")) != 0
        && (uint32_t v19 = v18, MEMORY[0x19F3B5680]() == v16))
      {
        xpc_object_t value = xpc_dictionary_get_value(v19, "relay-identity-xpc-endpoint");
        xpc_release(v12);
        if (value) {
          xpc_retain(value);
        }
      }
      else
      {
        xpc_release(v12);
        xpc_object_t value = 0;
      }
      xpc_release(v14);
    }
    else
    {
      xpc_release(v12);
      return 0;
    }
  }
  return value;
}

xpc_object_t NEHelperCopyXPCEndpointForIdentityProxy(const unsigned __int8 *a1, const void *a2, size_t a3)
{
  return NEHelperCopyXPCEndpointForIdentityProxyExtended(a1, a2, a3, 0, 0);
}

xpc_object_t NEHelperCopyDataForCertificate(const unsigned __int8 *a1, const void *a2, size_t a3)
{
  int is_null = uuid_is_null(a1);
  xpc_object_t value = 0;
  if (a3 && a2 && !is_null)
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "delegate-class-id", 0xEuLL);
    xpc_dictionary_set_uint64(v8, "relay-command", 2uLL);
    xpc_dictionary_set_data(v8, "relay-persistent-reference", a2, a3);
    xpc_dictionary_set_uuid(v8, "relay-config-id", a1);
    xpc_object_t v9 = NEHelperCopyResponse(v8);
    if (v9)
    {
      int v10 = v9;
      uint64_t v11 = MEMORY[0x19F3B5680]();
      uint64_t v12 = MEMORY[0x1E4F14D40];
      if (v11 == MEMORY[0x1E4F14D40]
        && (xpc_object_t v14 = xpc_dictionary_get_value(v10, "result-data")) != 0
        && (uint64_t v15 = v14, MEMORY[0x19F3B5680]() == v12))
      {
        xpc_object_t value = xpc_dictionary_get_value(v15, "relay-certificate-data");
        xpc_release(v8);
        if (value) {
          xpc_retain(value);
        }
      }
      else
      {
        xpc_release(v8);
        xpc_object_t value = 0;
      }
      xpc_release(v10);
    }
    else
    {
      xpc_release(v8);
      return 0;
    }
  }
  return value;
}

unsigned __int16 *ne_tracker_context_get_domain(unsigned __int16 *a1)
{
  if (!a1) {
    return 0;
  }
  unsigned int v2 = *a1;
  uint64_t result = a1 + 1;
  if (v2 <= 0xF) {
    return 0;
  }
  return result;
}

const char *ne_tracker_context_get_domain_owner(const char *result)
{
  if (result)
  {
    unint64_t v1 = *(unsigned __int16 *)result;
    if (v1 < 0x10) {
      return 0;
    }
    unsigned int v2 = (unsigned __int16 *)(result + 2);
    size_t v3 = strlen(result + 2);
    if (v3 + 1 == v1 >> 4) {
      return 0;
    }
    else {
      return (char *)v2 + v3 + 1;
    }
  }
  return result;
}

unsigned __int16 *ne_tracker_context_can_block_request(unsigned __int16 *result)
{
  if (result) {
    return (unsigned __int16 *)((*result >> 2) & 1);
  }
  return result;
}

_WORD *ne_tracker_context_is_from_web_list(_WORD *result)
{
  if (result) {
    return (_WORD *)(*result & 1);
  }
  return result;
}

void ne_tracker_build_trie(unsigned __int16 *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, int a6, double a7)
{
  uint64_t v37 = *MEMORY[0x1E4F14BF8];
  if (a2)
  {
    if (MEMORY[0x19F3B5680](a2) == MEMORY[0x1E4F14D18])
    {
      size_t count = xpc_array_get_count(a2);
      if (a3)
      {
        if (a5 && a4 && count && MEMORY[0x19F3B5680](a3) == MEMORY[0x1E4F14D40] && xpc_dictionary_get_count(a3))
        {
          size_t v15 = xpc_array_get_count(a2);
          size_t v16 = xpc_dictionary_get_count(a3);
          if (ne_trie_init((uint64_t)a1, a4, v15, a5 + 4 * v16, a6, 0, a7))
          {
            v26[0] = MEMORY[0x1E4F14BE8];
            v26[1] = 0x40000000;
            v26[2] = __ne_tracker_build_trie_block_invoke;
            v26[3] = &__block_descriptor_tmp_116;
            v26[4] = a3;
            v26[5] = a1;
            xpc_array_apply(a2, v26);
            if (a6 < 0 || ne_trie_save_to_file((uint64_t)a1))
            {
LABEL_13:
              if (ne_log_obj_g_init != -1) {
                dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
              }
LABEL_22:
              uint64_t v22 = ne_log_obj_log_obj;
              if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
              {
                int v23 = a1[27];
                int v24 = a1[28];
                int v25 = a1[29];
                *(_DWORD *)long long buf = 136316162;
                uint64_t v28 = "ne_tracker_build_trie";
                __int16 v29 = 1024;
                int v30 = v15;
                __int16 v31 = 1024;
                int v32 = v23;
                __int16 v33 = 1024;
                int v34 = v24;
                __int16 v35 = 1024;
                int v36 = v25;
                _os_log_impl(&dword_19DD92000, v22, OS_LOG_TYPE_DEFAULT, "%s: Initialized with %d domains (Nodes used = %d, child maps used = %d, bytes used = %d)", buf, 0x24u);
              }
              return;
            }
            if (ne_log_obj_g_init != -1) {
              dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
            }
            uint64_t v21 = ne_log_obj_log_obj;
            if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
              goto LABEL_22;
            }
            *(_DWORD *)long long buf = 136315394;
            uint64_t v28 = "ne_tracker_build_trie";
            __int16 v29 = 1024;
            int v30 = a6;
            xpc_object_t v18 = "%s: failed to save trie to file <fd %d>";
            uint32_t v19 = v21;
            uint32_t v20 = 18;
          }
          else
          {
            if (ne_log_obj_g_init != -1) {
              dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
            }
            uint64_t v17 = ne_log_obj_log_obj;
            if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
              goto LABEL_22;
            }
            *(_DWORD *)long long buf = 136315138;
            uint64_t v28 = "ne_tracker_build_trie";
            xpc_object_t v18 = "%s: failed to init trie";
            uint32_t v19 = v17;
            uint32_t v20 = 12;
          }
          _os_log_error_impl(&dword_19DD92000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
          goto LABEL_13;
        }
      }
    }
  }
}

uint64_t __ne_tracker_build_trie_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F14BF8];
  if (a3)
  {
    if (MEMORY[0x19F3B5680](a3) == MEMORY[0x1E4F14D78])
    {
      string_ptr = xpc_string_get_string_ptr(a3);
      if (string_ptr)
      {
        uint64_t v7 = (char *)string_ptr;
        xpc_object_t dictionary = xpc_dictionary_get_dictionary(*(xpc_object_t *)(a1 + 32), string_ptr);
        if (dictionary)
        {
          xpc_object_t v9 = dictionary;
          string = xpc_dictionary_get_string(dictionary, "owner");
          __int16 v11 = xpc_dictionary_get_BOOL(v9, "is-web-list");
          BOOL v12 = xpc_dictionary_get_BOOL(v9, "is-app-list");
          BOOL v13 = xpc_dictionary_get_BOOL(v9, "can-block-request");
          size_t v14 = strlen(v7);
          size_t v15 = strlen(string);
          if (v14 + v15 - 507 >= 0xFFFFFFFFFFFFFDFFLL)
          {
            size_t v17 = v15;
            __memcpy_chk();
            byte_1E945206A[(int)v14] = 0;
            int v18 = v14 + 1;
            memcpy(&byte_1E945206A[v18], string, v17);
            byte_1E945206A[(int)v17 + v18] = 0;
            unsigned __int16 v19 = 16 * (v17 + v18) + 16;
            __int16 v20 = v12 ? 2 : 0;
            __int16 v21 = v13 ? 4 : 0;
            ne_tracker_build_trie_buffer = v20 | v11 | v21 | ne_tracker_build_trie_buffer & 8 | v19;
            size_t v16 = (v19 >> 4) + 4;
          }
          else
          {
            size_t v16 = 0;
          }
          size_t v22 = strlen(v7);
          if (ne_trie_insert(*(void *)(a1 + 40), v7, v22, &ne_tracker_build_trie_buffer, v16, 1) == 0xFFFF)
          {
            if (ne_log_obj_g_init != -1) {
              dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
            }
            int v23 = ne_log_obj_log_obj;
            if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
            {
              int v24 = 136315394;
              int v25 = "ne_tracker_build_trie_block_invoke";
              __int16 v26 = 2080;
              uint64_t v27 = v7;
              _os_log_error_impl(&dword_19DD92000, v23, OS_LOG_TYPE_ERROR, "%s: failed to insert <%s>", (uint8_t *)&v24, 0x16u);
            }
          }
        }
      }
    }
  }
  return 1;
}

void ne_tracker_set_test_domains(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F14BF8];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (a1)
  {
    size_t v3 = v2;
    if (MEMORY[0x19F3B5680](a1) == MEMORY[0x1E4F14D18])
    {
      xpc_dictionary_set_uint64(v3, "delegate-class-id", 0xCuLL);
      xpc_dictionary_set_value(v3, "test-domains", a1);
      xpc_dictionary_set_uint64(v3, "tracker-command", 1uLL);
      xpc_object_t v4 = ne_tracker_copy_response(v3);
      if (v4)
      {
        int v5 = v4;
        if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40])
        {
          uint64_t int64 = xpc_dictionary_get_int64(v5, "result-code");
          if (ne_log_obj_g_init != -1)
          {
            uint64_t v8 = int64;
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
            uint64_t int64 = v8;
          }
          uint64_t v7 = ne_log_obj_log_obj;
          if (int64)
          {
            if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
            {
              int v9 = 136315138;
              int v10 = "ne_tracker_set_test_domains";
              _os_log_error_impl(&dword_19DD92000, v7, OS_LOG_TYPE_ERROR, "%s: got bad response", (uint8_t *)&v9, 0xCu);
            }
          }
          else if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
          {
            int v9 = 136315138;
            int v10 = "ne_tracker_set_test_domains";
            _os_log_debug_impl(&dword_19DD92000, v7, OS_LOG_TYPE_DEBUG, "%s: got good response", (uint8_t *)&v9, 0xCu);
          }
        }
        xpc_release(v5);
      }
      xpc_release(v3);
    }
  }
}

xpc_object_t ne_tracker_copy_response(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F14BF8];
  if (!a1)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    size_t v3 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    int v11 = 136315138;
    BOOL v12 = "ne_tracker_copy_response";
    xpc_object_t v4 = "%s: request is NULL";
    goto LABEL_27;
  }
  uuint64_t int64 = xpc_dictionary_get_uint64(a1, "delegate-class-id");
  if (uint64 - 15 <= 0xFFFFFFF1)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    size_t v3 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    int v11 = 136315138;
    BOOL v12 = "ne_tracker_copy_response";
    xpc_object_t v4 = "%s: request has an invalid delegate class ID";
LABEL_27:
    _os_log_error_impl(&dword_19DD92000, v3, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v11, 0xCu);
    return 0;
  }
  int v5 = nehelper_copy_connection_for_delegate_class(uint64);
  if (!v5)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    size_t v3 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    int v11 = 136315138;
    BOOL v12 = "ne_tracker_copy_response";
    xpc_object_t v4 = "%s: nehelper_copy_connection_for_delegate_class() returned NULL";
    goto LABEL_27;
  }
  xpc_object_t v6 = v5;
  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v5, a1);
  xpc_release(v6);
  if (!v7)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    size_t v3 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    int v11 = 136315138;
    BOOL v12 = "ne_tracker_copy_response";
    xpc_object_t v4 = "%s: nehelper sent NULL response";
    goto LABEL_27;
  }
  if (MEMORY[0x19F3B5680](v7) != MEMORY[0x1E4F14D40])
  {
    uint64_t v8 = (void *)MEMORY[0x19F3B54A0](v7);
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    int v9 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      BOOL v12 = "ne_tracker_copy_response";
      __int16 v13 = 2080;
      size_t v14 = v8;
      _os_log_error_impl(&dword_19DD92000, v9, OS_LOG_TYPE_ERROR, "%s: nehelper sent invalid response: %s", (uint8_t *)&v11, 0x16u);
    }
    free(v8);
  }
  return v7;
}

double ne_tracker_clear_cache(uint64_t a1)
{
  if (a1) {
    return ne_trie_free(a1);
  }
  return result;
}

BOOL ne_tracker_domain_is_known_tracker(uint64_t a1, int a2, uint64_t *a3, int *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F14BF8];
  uint64_t v29 = 0;
  int v30 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&ne_tracker_lock);
  if (!ne_tracker_build_cache((uint64_t)&ne_tracker_trie, 0))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_tracker_lock);
    return 0;
  }
  if (a2 < 1)
  {
    BOOL v10 = 0;
    goto LABEL_42;
  }
  uint64_t v27 = a4;
  uint64_t v28 = a3;
  uint64_t v8 = 0;
  unint64_t v9 = a2;
  BOOL v10 = 1;
  while (1)
  {
    int v11 = *(char **)(a1 + 8 * v8);
    if (v11) {
      break;
    }
LABEL_25:
    BOOL v10 = ++v8 < v9;
    if (v8 == v9) {
      goto LABEL_42;
    }
  }
  int v12 = strlen(*(const char **)(a1 + 8 * v8));
  int v13 = v12;
  if (!v12)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    unsigned __int16 v19 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
LABEL_24:
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_19DD92000, v19, OS_LOG_TYPE_ERROR, "Failed to set domain of zero-length", buf, 2u);
    goto LABEL_25;
  }
  if (v11[v12 - 1] == 46)
  {
    int v13 = v12 - 1;
    if (v12 == 1)
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      unsigned __int16 v19 = ne_log_obj_log_obj;
      if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  if (v13 >= 1)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(char **)(a1 + 8 * v8);
    size_t v16 = ne_tracker_domain_is_known_tracker_domain_buf;
    do
    {
      __darwin_ct_rune_t v17 = *v15++;
      *v16++ = __tolower(v17);
      --v14;
    }
    while (v14);
  }
  ne_tracker_domain_is_known_tracker_domain_buf[v13] = 0;
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  int v18 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315651;
    int v32 = "ne_tracker_domain_is_known_tracker";
    __int16 v33 = 2081;
    int v34 = ne_tracker_domain_is_known_tracker_domain_buf;
    __int16 v35 = 1024;
    int v36 = v13;
    _os_log_debug_impl(&dword_19DD92000, v18, OS_LOG_TYPE_DEBUG, "%s: lookup for <%{private}s> length %d", buf, 0x1Cu);
  }
  if (ne_trie_search((uint64_t)&ne_tracker_trie, (uint64_t)ne_tracker_domain_is_known_tracker_domain_buf, v13, &v30, &v29, 1, 1, 46, 0, (uint64_t (*)(void))ne_tracker_check_metadata_for_app) == 0xFFFF)goto LABEL_25; {
  if (v28 && v30 && v29)
  }
  {
    unint64_t v20 = *(unsigned __int16 *)v30;
    if (v20 < 0x10 || (size_t v21 = strlen(v30 + 2), v21 + 1 == v20 >> 4)) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = (uint64_t)&v30[v21 + 3];
    }
    uint64_t *v28 = v22;
  }
  if (v27) {
    int *v27 = v8;
  }
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  int v23 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
  {
    if (v27) {
      int v25 = *v27;
    }
    else {
      int v25 = -1;
    }
    if (v28) {
      __int16 v26 = (const char *)*v28;
    }
    else {
      __int16 v26 = "n/a";
    }
    *(_DWORD *)long long buf = 136315907;
    int v32 = "ne_tracker_domain_is_known_tracker";
    __int16 v33 = 2081;
    int v34 = v11;
    __int16 v35 = 1024;
    int v36 = v25;
    __int16 v37 = 2081;
    long long v38 = v26;
    _os_log_debug_impl(&dword_19DD92000, v23, OS_LOG_TYPE_DEBUG, "%s: found match for domain <%{private}s> (index %d) owner <%{private}s>", buf, 0x26u);
  }
LABEL_42:
  os_unfair_lock_unlock((os_unfair_lock_t)&ne_tracker_lock);
  return v10;
}

unsigned __int16 *ne_tracker_check_metadata_for_app(unsigned __int16 *result)
{
  if (result) {
    return (unsigned __int16 *)((*result >> 1) & 1);
  }
  return result;
}

xpc_object_t ne_tracker_get_ddg_dictionary()
{
  uint64_t v11 = *MEMORY[0x1E4F14BF8];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v0, "delegate-class-id", 0xCuLL);
  xpc_dictionary_set_uint64(v0, "tracker-command", 1uLL);
  xpc_object_t v1 = ne_tracker_copy_response(v0);
  if (!v1)
  {
    xpc_object_t v6 = 0;
    goto LABEL_11;
  }
  xpc_object_t v2 = v1;
  uint64_t v3 = MEMORY[0x19F3B5680]();
  uint64_t v4 = MEMORY[0x1E4F14D40];
  if (v3 == MEMORY[0x1E4F14D40])
  {
    if (xpc_dictionary_get_int64(v2, "result-code"))
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      int v5 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315138;
        BOOL v10 = "ne_tracker_get_ddg_dictionary";
        _os_log_error_impl(&dword_19DD92000, v5, OS_LOG_TYPE_ERROR, "%s: got bad response", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      xpc_object_t value = xpc_dictionary_get_value(v2, "domain-dictionary");
      xpc_object_t v6 = value;
      if (!value) {
        goto LABEL_9;
      }
      if (MEMORY[0x19F3B5680](value) == v4 && xpc_dictionary_get_count(v6))
      {
        xpc_object_t v6 = xpc_copy(v6);
        goto LABEL_9;
      }
    }
  }
  xpc_object_t v6 = 0;
LABEL_9:
  xpc_release(v2);
LABEL_11:
  xpc_release(v0);
  return v6;
}

xpc_object_t ne_tracker_lookup_app_domains(const char *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F14BF8];
  if (a1)
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v2, "delegate-class-id", 0xCuLL);
    xpc_dictionary_set_uint64(v2, "tracker-command", 2uLL);
    xpc_dictionary_set_string(v2, "bundle-id", a1);
    xpc_object_t v3 = ne_tracker_copy_response(v2);
    if (!v3)
    {
      xpc_object_t v6 = 0;
      goto LABEL_17;
    }
    uint64_t v4 = v3;
    if (MEMORY[0x19F3B5680]() == MEMORY[0x1E4F14D40])
    {
      if (xpc_dictionary_get_int64(v4, "result-code"))
      {
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        int v5 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
        {
          int v10 = 136315138;
          uint64_t v11 = "ne_tracker_lookup_app_domains";
          _os_log_error_impl(&dword_19DD92000, v5, OS_LOG_TYPE_ERROR, "%s: got bad response", (uint8_t *)&v10, 0xCu);
        }
      }
      else
      {
        xpc_object_t value = xpc_dictionary_get_value(v4, "sorted-domains");
        xpc_object_t v6 = value;
        if (!value) {
          goto LABEL_10;
        }
        if (MEMORY[0x19F3B5680](value) == MEMORY[0x1E4F14D18])
        {
          xpc_object_t v6 = xpc_copy(v6);
          goto LABEL_10;
        }
      }
    }
    xpc_object_t v6 = 0;
LABEL_10:
    xpc_release(v4);
LABEL_17:
    xpc_release(v2);
    return v6;
  }
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  xpc_object_t v7 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
  {
    int v10 = 136315138;
    uint64_t v11 = "ne_tracker_lookup_app_domains";
    _os_log_error_impl(&dword_19DD92000, v7, OS_LOG_TYPE_ERROR, "%s: bundle_id is NULL", (uint8_t *)&v10, 0xCu);
  }
  return 0;
}

BOOL ne_tracker_validate_domain(const void *a1, int a2, uint64_t (*a3)(char *, size_t, char *, uint64_t), char *a4, uint64_t a5, _DWORD *a6)
{
  uint64_t v44 = *MEMORY[0x1E4F14BF8];
  if (a2 && a2 < 254)
  {
    __memcpy_chk();
    ne_tracker_validate_domain_buffer[a2] = 0;
    __stringp = ne_tracker_validate_domain_buffer;
    if (a3) {
      BOOL v11 = a4 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    char v13 = !v11 && a5 != 0;
    char v38 = v13;
    uint64_t v14 = MEMORY[0x1E4F14BF0];
    uint64_t v15 = a4;
    int v36 = a5;
    while (1)
    {
      size_t v16 = strsep(&__stringp, ".");
      if (!v16)
      {
        if (a6) {
          *a6 = a5 - v36;
        }
        return 1;
      }
      __darwin_ct_rune_t v17 = v16;
      size_t v18 = strlen(v16);
      size_t v19 = v18;
      if ((int)v18 >= 64)
      {
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        uint64_t v28 = ne_log_obj_log_obj;
        BOOL result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
        if (result)
        {
          *(_DWORD *)long long buf = 67109376;
          int v41 = v19;
          __int16 v42 = 1024;
          int v43 = 63;
          int v30 = "Failed to validate domain - label size %d exceeded max label size %d";
          goto LABEL_46;
        }
        return result;
      }
      if (*v17 == 45 || v17[(uint64_t)((v18 << 32) - 0x100000000) >> 32] == 45) {
        break;
      }
      if ((int)v18 >= 1)
      {
        uint64_t v20 = 0;
        char v21 = 0;
        do
        {
          while (1)
          {
            unsigned int v22 = v17[v20];
            if ((v22 & 0x80) == 0) {
              break;
            }
            if ((v38 & 1) == 0)
            {
              if (ne_log_obj_g_init != -1) {
                dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
              }
              uint64_t v33 = ne_log_obj_log_obj;
              BOOL result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
              if (result)
              {
                *(_WORD *)long long buf = 0;
                int v30 = "Failed to validate domain - label contains non-printable ASCII character(s)";
                goto LABEL_63;
              }
              return result;
            }
            ++v20;
            char v21 = 1;
            if (v20 == v18) {
              goto LABEL_34;
            }
          }
          if (v22 != 45 && (*(_DWORD *)(v14 + 4 * v22 + 60) & 0x500) == 0)
          {
            if (ne_log_obj_g_init != -1) {
              dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
            }
            uint64_t v33 = ne_log_obj_log_obj;
            BOOL result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
            if (result)
            {
              *(_WORD *)long long buf = 0;
              int v30 = "Failed to validate domain - label must be consisted of alphanumeric or hyphen";
              goto LABEL_63;
            }
            return result;
          }
          ++v20;
        }
        while (v18 != v20);
        if ((v21 & 1) == 0) {
          goto LABEL_30;
        }
LABEL_34:
        if (v15 <= a4)
        {
          int v26 = v17 - ne_tracker_validate_domain_buffer;
          if (v36 < v26)
          {
            if (ne_log_obj_g_init != -1) {
              dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
            }
            uint64_t v33 = ne_log_obj_log_obj;
            BOOL result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
            if (result)
            {
              *(_WORD *)long long buf = 0;
              int v30 = "Failed to validate domain - puny-coding exceeded buffer size";
              goto LABEL_63;
            }
            return result;
          }
          int v37 = v36 - v26;
          memcpy(v15, a1, v26);
          int v25 = &v15[v17 - ne_tracker_validate_domain_buffer];
        }
        else
        {
          if (v36 <= 0)
          {
            if (ne_log_obj_g_init != -1) {
              dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
            }
            uint64_t v33 = ne_log_obj_log_obj;
            BOOL result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
            if (result)
            {
              *(_WORD *)long long buf = 0;
              int v30 = "Failed to validate domain - puny-coding exceeded buffer size";
              goto LABEL_63;
            }
            return result;
          }
          *uint64_t v15 = 46;
          int v25 = v15 + 1;
          int v37 = v36 - 1;
        }
        int v27 = a3(v17, v19, v25, a5);
        if ((v27 - 64) >= 0xFFFFFFC1 && v37 >= v27)
        {
          int v36 = v37 - v27;
          uint64_t v15 = &v25[v27];
          continue;
        }
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        uint64_t v33 = ne_log_obj_log_obj;
        BOOL result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
        if (result)
        {
          *(_WORD *)long long buf = 0;
          int v30 = "Failed to validate domain - failed to puny-code label";
          goto LABEL_63;
        }
        return result;
      }
LABEL_30:
      if (v15 > a4)
      {
        if (v36 <= 0)
        {
          if (ne_log_obj_g_init != -1) {
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          }
          uint64_t v33 = ne_log_obj_log_obj;
          BOOL result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
          if (result)
          {
            *(_WORD *)long long buf = 0;
            int v30 = "Failed to validate domain - puny-coding exceeded buffer size";
            goto LABEL_63;
          }
          return result;
        }
        *uint64_t v15 = 46;
        if (v36 <= (int)v18)
        {
          if (ne_log_obj_g_init != -1) {
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          }
          uint64_t v33 = ne_log_obj_log_obj;
          BOOL result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
          if (result)
          {
            *(_WORD *)long long buf = 0;
            int v30 = "Failed to validate domain - puny-coding exceeded buffer size";
            goto LABEL_63;
          }
          return result;
        }
        uint64_t v34 = v18 << 32;
        int v24 = v15 + 1;
        memcpy(v24, v17, (int)v18);
        uint64_t v15 = &v24[v34 >> 32];
        v36 += ~v19;
      }
    }
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v33 = ne_log_obj_log_obj;
    BOOL result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)long long buf = 0;
      int v30 = "Failed to validate domain - leading and trailing hyphen is not allowed in label";
LABEL_63:
      __int16 v31 = v33;
      uint32_t v32 = 2;
      goto LABEL_64;
    }
  }
  else
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v28 = ne_log_obj_log_obj;
    BOOL result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_DWORD *)long long buf = 67109376;
      int v41 = a2;
      __int16 v42 = 1024;
      int v43 = 253;
      int v30 = "Failed to validate domain - invalid domain length of %d (max length is %d)";
LABEL_46:
      __int16 v31 = v28;
      uint32_t v32 = 14;
LABEL_64:
      _os_log_error_impl(&dword_19DD92000, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);
      return 0;
    }
  }
  return result;
}

int ne_socket_set_domains(int socket, const char *const *const domain_names, int domain_count)
{
  uint64_t v38 = *MEMORY[0x1E4F14BF8];
  __int16 v31 = 0;
  int v29 = -1;
  int v30 = 0;
  if (!domain_names || socket < 0 || domain_count < 1 || (xpc_object_t v6 = (char *)*domain_names) == 0 || !*v6)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v9 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    *(_WORD *)long long buf = 0;
    unsigned int v22 = "Failed to set domain(s) for socket - invalid socket or no domain provided";
    int v23 = v9;
    uint32_t v24 = 2;
    goto LABEL_45;
  }
  if (ne_tracker_domain_is_known_tracker((uint64_t)domain_names, domain_count, (uint64_t *)&v31, &v29))
  {
    xpc_object_t v7 = 0;
    int v30 = 1;
    if (v29 >= 1 && v29 < domain_count) {
      xpc_object_t v7 = domain_names[v29];
    }
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v8 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v33 = "ne_socket_set_domains";
      _os_log_impl(&dword_19DD92000, v8, OS_LOG_TYPE_DEFAULT, "%s: marking socket as tracker", buf, 0xCu);
    }
  }
  else
  {
    int v12 = strlen(v6);
    xpc_object_t v7 = 0;
    if (!ne_tracker_validate_domain(v6, v12, 0, 0, 0, 0))
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint64_t v21 = ne_log_obj_log_obj;
      if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
        return 22;
      }
      *(_DWORD *)long long buf = 136380675;
      uint64_t v33 = v6;
      unsigned int v22 = "Failed to set domain(s) for socket - invalid domain syntax in <%{private}s>";
      int v23 = v21;
      uint32_t v24 = 12;
      goto LABEL_45;
    }
  }
  int v10 = setsockopt(socket, 0xFFFF, 4389, &v30, 4u);
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  char v13 = ne_log_obj_log_obj;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = __error();
      uint64_t v15 = strerror(*v14);
      *(_DWORD *)long long buf = 136315394;
      uint64_t v33 = v15;
      __int16 v34 = 2048;
      *(void *)__int16 v35 = 4;
      _os_log_error_impl(&dword_19DD92000, v13, OS_LOG_TYPE_ERROR, "Could not set SO_MARK_KNOWN_TRACKER. Received error: %s (%lu)", buf, 0x16u);
    }
    return v10;
  }
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v33 = "ne_socket_set_domains";
    __int16 v34 = 1024;
    *(_DWORD *)__int16 v35 = v30;
    _os_log_debug_impl(&dword_19DD92000, v13, OS_LOG_TYPE_DEBUG, "%s set tracker option is %d", buf, 0x12u);
  }
  char v16 = ne_session_set_socket_tracker_attributes(socket, v6, v31, v7);
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  __darwin_ct_rune_t v17 = ne_log_obj_log_obj;
  if ((v16 & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    int v25 = "<n/a>";
    int v26 = v31;
    if (!v31) {
      int v26 = "<n/a>";
    }
    *(_DWORD *)long long buf = 136381187;
    if (v7) {
      int v25 = v7;
    }
    uint64_t v33 = v6;
    __int16 v34 = 2081;
    *(void *)__int16 v35 = v26;
    *(_WORD *)&v35[8] = 2081;
    *(void *)&v35[10] = v25;
    unsigned int v22 = "Could not set tracker domain attributes - domain <%{private}s>, owner <%{private}s>, tracker domain <%{private}s>";
    int v23 = v17;
    uint32_t v24 = 32;
LABEL_45:
    _os_log_error_impl(&dword_19DD92000, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
    return 22;
  }
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
  {
    size_t v18 = "not present";
    if (v31) {
      size_t v19 = "present";
    }
    else {
      size_t v19 = "not present";
    }
    *(_DWORD *)long long buf = 136316162;
    uint64_t v33 = "ne_socket_set_domains";
    __int16 v34 = 1024;
    if (v7) {
      size_t v18 = "present";
    }
    *(_DWORD *)__int16 v35 = v30;
    *(_WORD *)&v35[4] = 2080;
    *(void *)&v35[6] = "present";
    *(_WORD *)&v35[14] = 2080;
    *(void *)&v35[16] = v19;
    __int16 v36 = 2080;
    int v37 = v18;
    _os_log_impl(&dword_19DD92000, v17, OS_LOG_TYPE_DEFAULT, "%s Set domain - is_tracker %d domain %s owner %s, tracker domain %s", buf, 0x30u);
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
  }
  uint64_t v20 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
  {
    int v27 = v31;
    uint64_t v28 = "<n/a>";
    if (!v31) {
      int v27 = "<n/a>";
    }
    if (v7) {
      uint64_t v28 = v7;
    }
    *(_DWORD *)long long buf = 136316163;
    uint64_t v33 = "ne_socket_set_domains";
    __int16 v34 = 1024;
    *(_DWORD *)__int16 v35 = v30;
    *(_WORD *)&v35[4] = 2081;
    *(void *)&v35[6] = v6;
    *(_WORD *)&v35[14] = 2081;
    *(void *)&v35[16] = v27;
    __int16 v36 = 2081;
    int v37 = v28;
    _os_log_debug_impl(&dword_19DD92000, v20, OS_LOG_TYPE_DEBUG, "%s Set domain - is_tracker %d domain <%{private}s> owner <%{private}s>, tracker domain <%{private}s>", buf, 0x30u);
  }
  return 0;
}

int ne_socket_set_attribution(int socket, ne_socket_attribution_t attribution)
{
  uint64_t v18 = *MEMORY[0x1E4F14BF8];
  if (socket < 0) {
    return 22;
  }
  BOOL v13 = attribution == NE_SOCKET_ATTRIBUTION_USER;
  int v4 = setsockopt(socket, 0xFFFF, 4390, &v13, 4u);
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  int v5 = ne_log_obj_log_obj;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = "developer";
      uint64_t v15 = "ne_socket_set_attribution";
      *(_DWORD *)long long buf = 136315650;
      if (attribution == NE_SOCKET_ATTRIBUTION_USER) {
        uint64_t v9 = "user";
      }
      __int16 v16 = 2080;
      *(void *)__darwin_ct_rune_t v17 = v9;
      *(_WORD *)&v17[8] = 1024;
      *(_DWORD *)&v17[10] = v13;
      _os_log_impl(&dword_19DD92000, v5, OS_LOG_TYPE_DEFAULT, "%s: marking socket attribution as %s <non-app-initiated flag %d>", buf, 0x1Cu);
    }
    if (attribution != NE_SOCKET_ATTRIBUTION_DEVELOPER) {
      return 0;
    }
    unsigned __int8 v10 = ne_session_set_socket_context_attribute(socket, 0);
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    BOOL v11 = ne_log_obj_log_obj;
    if (v10)
    {
      int v4 = 0;
      if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT)) {
        return v4;
      }
      *(_DWORD *)long long buf = 136315138;
      uint64_t v15 = "ne_socket_set_attribution";
      _os_log_impl(&dword_19DD92000, v11, OS_LOG_TYPE_DEFAULT, "%s: Cleared attribution context for developer attribution", buf, 0xCu);
      return 0;
    }
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v15 = "ne_socket_set_attribution";
      _os_log_error_impl(&dword_19DD92000, v11, OS_LOG_TYPE_ERROR, "%s: Could not clear attribution context for developer attribution", buf, 0xCu);
    }
    return 22;
  }
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
  {
    BOOL v6 = v13;
    xpc_object_t v7 = __error();
    uint64_t v8 = strerror(*v7);
    *(_DWORD *)long long buf = 136315650;
    uint64_t v15 = "ne_socket_set_attribution";
    __int16 v16 = 1024;
    *(_DWORD *)__darwin_ct_rune_t v17 = v6;
    *(_WORD *)&unsigned char v17[4] = 2080;
    *(void *)&v17[6] = v8;
    _os_log_error_impl(&dword_19DD92000, v5, OS_LOG_TYPE_ERROR, "%s: Could not set SO_MARK_KNOWN_TRACKER_NON_APP_INITIATED to %d. Received error: %s", buf, 0x1Cu);
  }
  return v4;
}

int ne_socket_set_website_attribution(int socket, const char *hostname)
{
  uint64_t v21 = *MEMORY[0x1E4F14BF8];
  int v14 = 1;
  int v2 = 22;
  if ((socket & 0x80000000) == 0 && hostname)
  {
    int v5 = setsockopt(socket, 0xFFFF, 4390, &v14, 4u);
    if (v5)
    {
      int v2 = v5;
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      BOOL v6 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        int v7 = v14;
        uint64_t v8 = __error();
        uint64_t v9 = strerror(*v8);
        *(_DWORD *)long long buf = 136315650;
        __int16 v16 = "ne_socket_set_website_attribution";
        __int16 v17 = 1024;
        int v18 = v7;
        __int16 v19 = 2080;
        uint64_t v20 = v9;
        _os_log_error_impl(&dword_19DD92000, v6, OS_LOG_TYPE_ERROR, "%s: Could not set SO_MARK_KNOWN_TRACKER_NON_APP_INITIATED to %d. Received error: %s", buf, 0x1Cu);
      }
    }
    else
    {
      unsigned __int8 v10 = ne_session_set_socket_context_attribute(socket, (char *)hostname);
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      BOOL v11 = ne_log_obj_log_obj;
      if (v10)
      {
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315394;
          __int16 v16 = "ne_socket_set_website_attribution";
          __int16 v17 = 1024;
          int v18 = v14;
          _os_log_impl(&dword_19DD92000, v11, OS_LOG_TYPE_DEFAULT, "%s: marking socket attribution as user <non-app-initiated flag %d> with website context", buf, 0x12u);
          if (ne_log_obj_g_init != -1) {
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          }
        }
        int v12 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 136315651;
          __int16 v16 = "ne_socket_set_website_attribution";
          __int16 v17 = 1024;
          int v18 = v14;
          __int16 v19 = 2081;
          uint64_t v20 = hostname;
          _os_log_debug_impl(&dword_19DD92000, v12, OS_LOG_TYPE_DEBUG, "%s: marking socket attribution as user <non-app-initiated flag %d> with website context <%{private}s>", buf, 0x1Cu);
        }
        return 0;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315138;
          __int16 v16 = "ne_socket_set_website_attribution";
          _os_log_error_impl(&dword_19DD92000, v11, OS_LOG_TYPE_ERROR, "%s: Could not set attribution context", buf, 0xCu);
        }
        return 22;
      }
    }
  }
  return v2;
}

int ne_socket_set_is_app_initiated(int socket, BOOL is_app_initiated)
{
  if (is_app_initiated) {
    ne_socket_attribution_t v2 = NE_SOCKET_ATTRIBUTION_DEVELOPER;
  }
  else {
    ne_socket_attribution_t v2 = NE_SOCKET_ATTRIBUTION_USER;
  }
  return ne_socket_set_attribution(socket, v2);
}

void ne_tracker_create_xcode_issue(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F14BF8];
  if (a1)
  {
    BOOL should_save_stacktrace = ne_tracker_should_save_stacktrace();
    BOOL v3 = should_save_stacktrace;
    if (ne_tracker_create_xcode_issue_onceToken == -1)
    {
      if (should_save_stacktrace) {
        goto LABEL_4;
      }
    }
    else
    {
      dispatch_once(&ne_tracker_create_xcode_issue_onceToken, &__block_literal_global_252);
      if (v3)
      {
LABEL_4:
        int v4 = ne_tracker_create_xcode_issue_poi_handle;
        if (os_log_type_enabled((os_log_t)ne_tracker_create_xcode_issue_poi_handle, OS_LOG_TYPE_FAULT))
        {
          int v6 = 136315138;
          uint64_t v7 = a1;
          _os_log_fault_impl(&dword_19DD92000, v4, OS_LOG_TYPE_FAULT, "%s is not listed in your app’s NSPrivacyTrackingDomain key in any privacy manifest. It may be following users across multiple apps and websites to create a profile about users of apps that contact this domain.", (uint8_t *)&v6, 0xCu);
        }
        return;
      }
    }
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    int v5 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = a1;
      _os_log_impl(&dword_19DD92000, v5, OS_LOG_TYPE_DEFAULT, "%s is not listed in your app’s NSPrivacyTrackingDomain key in any privacy manifest. It may be following users across multiple apps and websites to create a profile about users of apps that contact this domain.", (uint8_t *)&v6, 0xCu);
    }
  }
}

os_log_t __ne_tracker_create_xcode_issue_block_invoke()
{
  os_log_t result = os_log_create("com.apple.neappprivacy", "PointsOfInterest");
  ne_tracker_create_xcode_issue_poi_handle = (uint64_t)result;
  return result;
}

void *ne_tracker_copy_current_stacktrace(size_t *a1)
{
  __src[128] = *(void **)MEMORY[0x1E4F14BF8];
  if (!a1) {
    return 0;
  }
  if (qword_1EB2A3760 != -1) {
    dispatch_once(&qword_1EB2A3760, &__block_literal_global_10);
  }
  if (state != -1) {
    dispatch_once(&state, &__block_literal_global_14);
  }
  bzero(__src, 0x400uLL);
  size_t v2 = 8 * backtrace(__src, 128);
  *a1 = v2;
  BOOL v3 = malloc_type_malloc(v2, 0xB375A9D4uLL);
  int v4 = v3;
  if (v3) {
    memcpy(v3, __src, *a1);
  }
  return v4;
}

uint64_t ne_tracker_get_disposition(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (qword_1EB2A3760 != -1) {
    dispatch_once(&qword_1EB2A3760, &__block_literal_global_10);
  }
  if (state != -1) {
    dispatch_once(&state, &__block_literal_global_14);
  }
  uint64_t v8 = off_1EB2A37A8;
  if (!off_1EB2A37A8) {
    return 1;
  }

  return ((uint64_t (*)(uint64_t, uint64_t, void *, unsigned char *))v8)(a1, a2, a3, a4);
}

uint64_t ne_log_large_obj()
{
  if (ne_log_large_obj_g_large_init != -1) {
    dispatch_once(&ne_log_large_obj_g_large_init, &__block_literal_global_5);
  }
  return ne_log_large_obj_large_log_obj;
}

os_log_t __ne_log_large_obj_block_invoke()
{
  os_log_t result = os_log_create("com.apple.networkextension", "Large");
  ne_log_large_obj_large_log_obuint64_t j = (uint64_t)result;
  return result;
}

uint64_t nelog_is_extra_vpn_logging_enabled()
{
  return MEMORY[0x1F40CFC78]("com.apple.networkextension.extra_vpn_logs");
}

BOOL nelog_is_info_logging_enabled()
{
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  xpc_object_t v0 = ne_log_obj_log_obj;

  return os_log_type_enabled(v0, OS_LOG_TYPE_INFO);
}

void ne_print_backtrace()
{
  uint64_t v42 = *MEMORY[0x1E4F14BF8];
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
  *(_OWORD *)unsigned __int8 v10 = 0u;
  long long v11 = 0u;
  int v0 = backtrace(v10, 128);
  xpc_object_t v1 = backtrace_symbols(v10, v0);
  size_t v2 = v1;
  if (v0 >= 1)
  {
    uint64_t v3 = v0;
    uint64_t v4 = ne_log_obj_g_init;
    int v5 = v1;
    do
    {
      if (v4 != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      int v6 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *v5;
        *(_DWORD *)long long buf = 136315138;
        uint64_t v9 = v7;
        _os_log_error_impl(&dword_19DD92000, v6, OS_LOG_TYPE_ERROR, "    %s", buf, 0xCu);
        uint64_t v4 = ne_log_obj_g_init;
      }
      else
      {
        uint64_t v4 = -1;
      }
      ++v5;
      --v3;
    }
    while (v3);
  }
  free(v2);
}

uint64_t ne_trie_init(uint64_t result, uint64_t a2, uint64_t a3, size_t a4, int a5, uint64_t a6, double a7)
{
  uint64_t v58 = *MEMORY[0x1E4F14BF8];
  if (!result) {
    return result;
  }
  uint64_t v8 = result;
  *(_OWORD *)(result + 80) = 0u;
  *(_OWORD *)(result + 96) = 0u;
  *(_OWORD *)(result + 48) = 0u;
  *(_OWORD *)(result + 64) = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(_OWORD *)(result + 32) = 0u;
  *(_OWORD *)os_log_t result = 0u;
  if (!a2 || !a3 || !a4)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v29 = ne_log_obj_log_obj;
    os_log_t result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)long long buf = 136315138;
    unint64_t v48 = "ne_trie_init";
    long long v26 = "%s: NETrie - null trie, no prefix/leaf count or no byte count";
    goto LABEL_49;
  }
  uint64_t v10 = a2 + a3;
  BOOL v11 = __CFADD__(a2, a3);
  uint64_t v12 = v10 + 1;
  uint64_t v13 = v10 == -1;
  uint64_t v14 = v13 << 63 >> 63;
  BOOL v15 = v14 != v13;
  if (v11 || v15 || v14 < 0)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v29 = ne_log_obj_log_obj;
    os_log_t result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)long long buf = 136315138;
    unint64_t v48 = "ne_trie_init";
    long long v26 = "%s: NETrie - Overflow while computing the number of nodes";
    goto LABEL_49;
  }
  unint64_t v16 = a2 + 1;
  uint64_t v17 = a2 == -1;
  uint64_t v18 = v17 << 63 >> 63;
  if (v18 != v17 || v18 < 0)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v29 = ne_log_obj_log_obj;
    os_log_t result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)long long buf = 136315138;
    unint64_t v48 = "ne_trie_init";
    long long v26 = "%s: NETrie - Overflow while computing the number of maps";
    goto LABEL_49;
  }
  if (!(a4 >> 16) && ((v12 | v16) & 0xFFFFFFFFFFFF0000) == 0)
  {
    if (!is_mul_ok(v16, 0xC0uLL)
      || ((uint64_t v19 = 10 * v12, v20 = 192 * v16, v21 = 10 * v12 + 192 * v16, !__CFADD__(10 * v12, 192 * v16))
        ? (char v22 = 0)
        : (char v22 = 1),
          (size_t v23 = a4 + v21, !__CFADD__(a4, v21)) ? (v24 = 0) : (v24 = 1),
          (v22 & 1) != 0 || v24))
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint64_t v29 = ne_log_obj_log_obj;
      os_log_t result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      *(_DWORD *)long long buf = 136315138;
      unint64_t v48 = "ne_trie_init";
      long long v26 = "%s: NETrie - Overflow while computing trie memory sizes";
    }
    else
    {
      if (v23 > 0x100000)
      {
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        uint64_t v25 = ne_log_obj_log_obj;
        os_log_t result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
        if (result)
        {
          *(_DWORD *)long long buf = 136315650;
          unint64_t v48 = "ne_trie_init";
          __int16 v49 = 2048;
          *(void *)size_t v50 = v23;
          *(_WORD *)&v50[8] = 1024;
          *(_DWORD *)long long v51 = 0x100000;
          long long v26 = "%s: NETrie - Trie memory size (%lu) is too big (maximum is %u)";
          long long v27 = v25;
          uint32_t v28 = 28;
LABEL_50:
          _os_log_error_impl(&dword_19DD92000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
          return 0;
        }
        return result;
      }
      if (!a6 || (BOOL v33 = __CFADD__(v23, a6), v23 += a6, !v33))
      {
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        long long v34 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 136316674;
          unint64_t v48 = "ne_trie_init";
          __int16 v49 = 2048;
          *(void *)size_t v50 = v12;
          *(_WORD *)&v50[8] = 2048;
          *(void *)long long v51 = v16;
          *(_WORD *)&v51[8] = 2048;
          *(void *)v52 = a4;
          *(_WORD *)&v52[8] = 2048;
          uint64_t v53 = a6;
          __int16 v54 = 2048;
          size_t v55 = v23;
          __int16 v56 = 1024;
          int v57 = a5;
          _os_log_debug_impl(&dword_19DD92000, v34, OS_LOG_TYPE_DEBUG, "%s: NETrie - initializing (Nodes count = %lu, child maps count = %lu, bytes_count = %lu, extra_size_t bytes = %lu, total memory size %lu fd %d)", buf, 0x44u);
          if ((a5 & 0x80000000) == 0) {
            goto LABEL_63;
          }
        }
        else if ((a5 & 0x80000000) == 0)
        {
LABEL_63:
          if (ftruncate(a5, (int)v23 + 112))
          {
            if (ne_log_obj_g_init != -1) {
              dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
            }
            uint64_t v35 = ne_log_obj_log_obj;
            os_log_t result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
            if (result)
            {
              *(_DWORD *)long long buf = 136315394;
              unint64_t v48 = "ne_trie_init";
              __int16 v49 = 1024;
              *(_DWORD *)size_t v50 = v23 + 112;
              long long v26 = "%s: NETrie - failed to ftruncate mmap file to %d";
              long long v27 = v35;
              uint32_t v28 = 18;
              goto LABEL_50;
            }
            return result;
          }
          long long v36 = mmap(0, (int)v23 + 112, 3, 1, a5, 0);
          if (v36 == (void *)-1)
          {
            if (ne_log_obj_g_init != -1) {
              dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
            }
            uint64_t v39 = ne_log_obj_log_obj;
            os_log_t result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
            if (result)
            {
              *(_DWORD *)long long buf = 136315650;
              unint64_t v48 = "ne_trie_init";
              __int16 v49 = 1024;
              *(_DWORD *)size_t v50 = a5;
              *(_WORD *)&v50[4] = 1024;
              *(_DWORD *)&v50[6] = v23 + 112;
              long long v26 = "%s: NETrie - Failed mmap <fd %d, size %d>";
              long long v27 = v39;
              uint32_t v28 = 24;
              goto LABEL_50;
            }
            return result;
          }
          *(void *)(v8 + 40) = v36;
          *(unsigned char *)(v8 + 96) = 1;
          if (ne_log_obj_g_init != -1) {
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          }
          long long v37 = ne_log_obj_log_obj;
          if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 136316162;
            unint64_t v48 = "ne_trie_init";
            __int16 v49 = 1024;
            *(_DWORD *)size_t v50 = a5;
            *(_WORD *)&v50[4] = 1024;
            *(_DWORD *)&v50[6] = v23 + 112;
            *(_WORD *)long long v51 = 2048;
            uint64_t v38 = 112;
            *(void *)&v51[2] = 112;
            *(_WORD *)v52 = 2048;
            *(void *)&v52[2] = v23;
            _os_log_debug_impl(&dword_19DD92000, v37, OS_LOG_TYPE_DEBUG, "%s: NETrie - initialized with mmap <fd %d, file size %d hdr size %zu memory size %zu>", buf, 0x2Cu);
          }
          else
          {
            uint64_t v38 = 112;
          }
LABEL_84:
          *(_OWORD *)uint64_t v8 = xmmword_19DDAA520;
          *(double *)(v8 + 104) = a7;
          *(void *)(v8 + 64) = v23;
          *(void *)(v8 + 72) = v19;
          *(void *)(v8 + 80) = v20;
          *(void *)(v8 + 88) = a4;
          *(_WORD *)(v8 + 52) = a4;
          *(_WORD *)(v8 + 48) = v12;
          *(_WORD *)(v8 + 50) = v16;
          uint64_t v42 = (char *)(*(void *)(v8 + 40) + v38 + a6);
          *(void *)(v8 + 16) = v42;
          *(_WORD *)(v8 + 54) = 0;
          bzero(v42, 10 * v12);
          int v43 = &v42[v19];
          *(void *)(v8 + 24) = v43;
          *(_WORD *)(v8 + 56) = 0;
          memset(v43, 255, 192 * v16);
          *(void *)(v8 + 32) = &v43[v20];
          *(_WORD *)(v8 + 58) = 0;
          bzero(&v43[v20], a4);
          unsigned int v44 = *(unsigned __int16 *)(v8 + 54);
          __int16 v45 = -1;
          if (v44 < *(unsigned __int16 *)(v8 + 48))
          {
            *(_WORD *)(v8 + 54) = v44 + 1;
            *(_WORD *)(*(void *)(v8 + 16) + 10 * v44 + 4) = -1;
            __int16 v45 = v44;
          }
          *(_WORD *)(v8 + 60) = v45;
          return 1;
        }
        long long v40 = malloc_type_malloc(v23, 0xBA089BB7uLL);
        if (!v40)
        {
          if (ne_log_obj_g_init != -1) {
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          }
          uint64_t v46 = ne_log_obj_log_obj;
          os_log_t result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
          if (result)
          {
            *(_DWORD *)long long buf = 136315394;
            unint64_t v48 = "ne_trie_init";
            __int16 v49 = 2048;
            *(void *)size_t v50 = v23;
            long long v26 = "%s: NETrie - Failed to allocate %lu bytes of memory for the trie";
            long long v27 = v46;
            uint32_t v28 = 22;
            goto LABEL_50;
          }
          return result;
        }
        *(void *)(v8 + 40) = v40;
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        long long v41 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 136315394;
          unint64_t v48 = "ne_trie_init";
          __int16 v49 = 2048;
          *(void *)size_t v50 = v23;
          _os_log_debug_impl(&dword_19DD92000, v41, OS_LOG_TYPE_DEBUG, "%s: NETrie - initialized with malloc %zu", buf, 0x16u);
        }
        uint64_t v38 = 0;
        goto LABEL_84;
      }
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint64_t v29 = ne_log_obj_log_obj;
      os_log_t result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      *(_DWORD *)long long buf = 136315138;
      unint64_t v48 = "ne_trie_init";
      long long v26 = "%s: NETrie - Overflow while adding requested extra bytes";
    }
LABEL_49:
    long long v27 = v29;
    uint32_t v28 = 12;
    goto LABEL_50;
  }
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  uint64_t v30 = ne_log_obj_log_obj;
  os_log_t result = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_DWORD *)long long buf = 136315906;
    unint64_t v48 = "ne_trie_init";
    __int16 v49 = 2048;
    *(void *)size_t v50 = a4;
    *(_WORD *)&v50[8] = 2048;
    *(void *)long long v51 = v12;
    *(_WORD *)&v51[8] = 2048;
    *(void *)v52 = v16;
    long long v26 = "%s: NETrie - Invalid bytes count (%lu), nodes count (%lu) or maps count (%lu)";
    long long v27 = v30;
    uint32_t v28 = 42;
    goto LABEL_50;
  }
  return result;
}

double ne_trie_free(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F14BF8];
  if (a1)
  {
    size_t v2 = *(void **)(a1 + 40);
    if (v2)
    {
      if (*(unsigned char *)(a1 + 96))
      {
        int v3 = munmap(v2, *(void *)(a1 + 64) + 112);
        if (ne_log_obj_g_init != -1)
        {
          int v6 = v3;
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          int v3 = v6;
        }
        uint64_t v4 = ne_log_obj_log_obj;
        if (v3 == -1)
        {
          if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
          {
            int v7 = 136315138;
            uint64_t v8 = "ne_trie_free";
            _os_log_error_impl(&dword_19DD92000, v4, OS_LOG_TYPE_ERROR, "%s: NETrie - Failed munmap", (uint8_t *)&v7, 0xCu);
          }
        }
        else if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
        {
          int v7 = 136315138;
          uint64_t v8 = "ne_trie_free";
          _os_log_debug_impl(&dword_19DD92000, v4, OS_LOG_TYPE_DEBUG, "%s: NETrie - done munmap", (uint8_t *)&v7, 0xCu);
        }
      }
      else
      {
        free(v2);
      }
      double result = 0.0;
      *(_OWORD *)(a1 + 80) = 0u;
      *(_OWORD *)(a1 + 96) = 0u;
      *(_OWORD *)(a1 + 48) = 0u;
      *(_OWORD *)(a1 + 64) = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
      *(_OWORD *)(a1 + 32) = 0u;
      *(_OWORD *)a1 = 0u;
    }
  }
  return result;
}

uint64_t ne_trie_save_to_file(uint64_t result)
{
  uint64_t v18 = *MEMORY[0x1E4F14BF8];
  if (result)
  {
    if (*(unsigned char *)(result + 96))
    {
      xpc_object_t v1 = *(_OWORD **)(result + 40);
      long long v2 = *(_OWORD *)result;
      long long v3 = *(_OWORD *)(result + 32);
      v1[1] = *(_OWORD *)(result + 16);
      v1[2] = v3;
      _OWORD *v1 = v2;
      long long v4 = *(_OWORD *)(result + 48);
      long long v5 = *(_OWORD *)(result + 64);
      long long v6 = *(_OWORD *)(result + 96);
      void v1[5] = *(_OWORD *)(result + 80);
      v1[6] = v6;
      v1[3] = v4;
      v1[4] = v5;
      if (msync(*(void **)(result + 40), *(void *)(result + 64) + 112, 16) == -1)
      {
        int v8 = *__error();
        if (strerror_r(v8, (char *)buf, 0x80uLL)) {
          buf[0] = 0;
        }
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        uint64_t v9 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_FAULT))
        {
          int v10 = 136315650;
          BOOL v11 = "ne_trie_save_to_file";
          __int16 v12 = 1024;
          int v13 = v8;
          __int16 v14 = 2080;
          BOOL v15 = buf;
          _os_log_fault_impl(&dword_19DD92000, v9, OS_LOG_TYPE_FAULT, "%s: NETrie - Failed msync: [%d] %s", (uint8_t *)&v10, 0x1Cu);
        }
      }
      else
      {
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        int v7 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 136315138;
          uint64_t v17 = "ne_trie_save_to_file";
          _os_log_debug_impl(&dword_19DD92000, v7, OS_LOG_TYPE_DEBUG, "%s: NETrie - done msync", buf, 0xCu);
        }
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

double ne_trie_init_from_file(uint64_t a1, int a2, void *a3)
{
  uint64_t v63 = *MEMORY[0x1E4F14BF8];
  memset(&v46, 0, sizeof(v46));
  if (!a1)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v11 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      return result;
    }
    *(_WORD *)long long buf = 0;
    int v8 = "Trie structure is NULL";
LABEL_18:
    uint64_t v9 = v11;
    uint32_t v10 = 2;
    goto LABEL_19;
  }
  if (a2 < 0)
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint64_t v11 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      return result;
    }
    *(_WORD *)long long buf = 0;
    int v8 = "Invalid trie file fd";
    goto LABEL_18;
  }
  if (fstat(a2, &v46) == -1 || !v46.st_size)
  {
    int v12 = *__error();
    if (strerror_r(v12, (char *)buf, 0x80uLL)) {
      buf[0] = 0;
    }
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    int v13 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)size_t v47 = 67109890;
      int v48 = a2;
      __int16 v49 = 2048;
      off_t st_size = v46.st_size;
      __int16 v51 = 1024;
      int v52 = v12;
      __int16 v53 = 2080;
      __int16 v54 = buf;
      _os_log_fault_impl(&dword_19DD92000, v13, OS_LOG_TYPE_FAULT, "failed to get file stats for trie mmap file <fd %d, file size %lld>: [%d] %s", v47, 0x22u);
    }
    close(a2);
    return result;
  }
  if ((unint64_t)(v46.st_size - 0x100000000) > 0xFFFFFFFF0000006FLL)
  {
    __int16 v14 = (long long *)mmap(0, v46.st_size, 1, 2, a2, 0);
    if (v14 == (long long *)-1)
    {
      int v30 = *__error();
      if (strerror_r(v30, (char *)buf, 0x80uLL)) {
        buf[0] = 0;
      }
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      long long v31 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)size_t v47 = 67109378;
        int v48 = v30;
        __int16 v49 = 2080;
        off_t st_size = (off_t)buf;
        _os_log_fault_impl(&dword_19DD92000, v31, OS_LOG_TYPE_FAULT, "mmap failed: [%d] %s", v47, 0x12u);
      }
      return result;
    }
    BOOL v15 = v14;
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    unint64_t v16 = ne_log_obj_log_obj;
    if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315650;
      __int16 v56 = "ne_trie_init_from_file";
      __int16 v57 = 1024;
      *(_DWORD *)uint64_t v58 = a2;
      *(_WORD *)&v58[4] = 2048;
      *(void *)&v58[6] = v46.st_size;
      _os_log_debug_impl(&dword_19DD92000, v16, OS_LOG_TYPE_DEBUG, "%s: NETrie - read mmap <fd %d, size %lld>", buf, 0x1Cu);
    }
    long long v17 = v15[2];
    long long v18 = *v15;
    *(_OWORD *)(a1 + 16) = v15[1];
    *(_OWORD *)(a1 + 32) = v17;
    *(_OWORD *)a1 = v18;
    long long v19 = v15[3];
    long long v20 = v15[4];
    long long v21 = v15[6];
    *(_OWORD *)(a1 + 80) = v15[5];
    *(_OWORD *)(a1 + 96) = v21;
    *(_OWORD *)(a1 + 48) = v19;
    *(_OWORD *)(a1 + 64) = v20;
    if (*(void *)a1 != 0x5061747269636961)
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint64_t v32 = ne_log_obj_log_obj;
      if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
        goto LABEL_64;
      }
      BOOL v33 = *(const char **)a1;
      *(_DWORD *)long long buf = 134218240;
      __int16 v56 = v33;
      __int16 v57 = 2048;
      *(void *)uint64_t v58 = 0x5061747269636961;
      long long v34 = "Trie magic number (%llx) does not equal the expected value (%llx)";
      uint64_t v35 = v32;
      uint32_t v36 = 22;
      goto LABEL_63;
    }
    uint64_t v22 = *(void *)(a1 + 8);
    if (ne_log_obj_g_init != -1)
    {
      uint64_t v45 = *(void *)(a1 + 8);
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      uint64_t v22 = v45;
    }
    size_t v23 = ne_log_obj_log_obj;
    if (v22 == 2)
    {
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v40 = *(void *)(a1 + 64);
        uint64_t v41 = *(void *)(a1 + 72);
        uint64_t v42 = *(void *)(a1 + 80);
        uint64_t v43 = *(void *)(a1 + 88);
        int v44 = *(unsigned __int8 *)(a1 + 96);
        *(_DWORD *)long long buf = 136316418;
        __int16 v56 = "ne_trie_init_from_file";
        __int16 v57 = 2048;
        *(void *)uint64_t v58 = v40;
        *(_WORD *)&v58[8] = 2048;
        *(void *)&v58[10] = v41;
        *(_WORD *)&v58[18] = 2048;
        *(void *)&v58[20] = v42;
        __int16 v59 = 2048;
        uint64_t v60 = v43;
        __int16 v61 = 1024;
        int v62 = v44;
        _os_log_debug_impl(&dword_19DD92000, v23, OS_LOG_TYPE_DEBUG, "%s: NETrie - read trie with mmap <memory %zu nodes %zu maps %zu bytes %zu is_mmap %d>", buf, 0x3Au);
      }
      if (*(void *)(a1 + 64) + 112 == v46.st_size)
      {
        uint64_t v24 = *(void *)(a1 + 80);
        uint64_t v25 = (uint64_t)v15 + *(void *)(a1 + 72) + 112;
        *(void *)(a1 + 16) = v15 + 7;
        *(void *)(a1 + 24) = v25;
        *(void *)(a1 + 32) = v25 + v24;
        *(void *)(a1 + 40) = v15;
        if (a3) {
          *a3 = *(void *)(a1 + 104);
        }
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        long long v26 = ne_log_obj_log_obj;
        if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = *(unsigned __int16 *)(a1 + 54);
          int v28 = *(unsigned __int16 *)(a1 + 56);
          int v29 = *(unsigned __int16 *)(a1 + 58);
          *(_DWORD *)long long buf = 136316418;
          __int16 v56 = "ne_trie_init_from_file";
          __int16 v57 = 1024;
          *(_DWORD *)uint64_t v58 = a2;
          *(_WORD *)&v58[4] = 1024;
          *(_DWORD *)&v58[6] = v46.st_size;
          *(_WORD *)&v58[10] = 1024;
          *(_DWORD *)&v58[12] = v27;
          *(_WORD *)&v58[16] = 1024;
          *(_DWORD *)&v58[18] = v28;
          *(_WORD *)&v58[22] = 1024;
          *(_DWORD *)&v58[24] = v29;
          _os_log_impl(&dword_19DD92000, v26, OS_LOG_TYPE_DEFAULT, "%s: Initialized trie with file %d size %d (Nodes used = %d, child maps used = %d, bytes used = %d)", buf, 0x2Au);
        }
        return result;
      }
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint64_t v38 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        uint64_t v39 = *(void *)(a1 + 64);
        *(_DWORD *)long long buf = 136315906;
        __int16 v56 = "ne_trie_init_from_file";
        __int16 v57 = 2048;
        *(void *)uint64_t v58 = v39;
        *(_WORD *)&v58[8] = 1024;
        *(_DWORD *)&v58[10] = 112;
        *(_WORD *)&v58[14] = 2048;
        *(void *)&v58[16] = v46.st_size;
        long long v34 = "%s: NETrie - Invalid mmap trie size - mem size %zu + offset %d != file size %lld";
        uint64_t v35 = v38;
        uint32_t v36 = 38;
        goto LABEL_63;
      }
    }
    else if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
    {
      long long v37 = *(const char **)(a1 + 8);
      *(_DWORD *)long long buf = 134218240;
      __int16 v56 = v37;
      __int16 v57 = 1024;
      *(_DWORD *)uint64_t v58 = 2;
      long long v34 = "Trie format version (%llu) does not equal the current version (%u)";
      uint64_t v35 = v23;
      uint32_t v36 = 18;
LABEL_63:
      _os_log_error_impl(&dword_19DD92000, v35, OS_LOG_TYPE_ERROR, v34, buf, v36);
    }
LABEL_64:
    munmap(v15, v46.st_size);
    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
    return result;
  }
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  uint64_t v6 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v56 = "ne_trie_init_from_file";
    __int16 v57 = 2048;
    *(void *)uint64_t v58 = v46.st_size;
    int v8 = "%s: invalid file size %lld";
    uint64_t v9 = v6;
    uint32_t v10 = 22;
LABEL_19:
    _os_log_error_impl(&dword_19DD92000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
  }
  return result;
}

uint64_t ne_trie_has_high_ascii(char *a1, int a2)
{
  if (a2 < 1) {
    return 0;
  }
  if (*a1 < 0) {
    return 1;
  }
  uint64_t v2 = 0;
  while (a2 - 1 != v2)
  {
    int v3 = a1[++v2];
    if (v3 < 0) {
      return v2 < a2;
    }
  }
  uint64_t v2 = a2;
  return v2 < a2;
}

uint64_t ne_trie_insert(uint64_t a1, char *a2, int64_t __n, const void *a4, size_t a5, int a6)
{
  uint64_t v64 = *MEMORY[0x1E4F14BF8];
  LOWORD(v6) = -1;
  if (!__n || !a2 || !*(void *)(a1 + 40)) {
    return (unsigned __int16)v6;
  }
  unsigned __int16 v8 = __n;
  if ((unint64_t)__n >> 16
    || (uint64_t v9 = *(unsigned __int16 *)(a1 + 58), (int)v9 + (int)__n > *(unsigned __int16 *)(a1 + 52)))
  {
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint32_t v10 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)long long buf = 136315138;
    uint64_t v63 = "ne_trie_insert";
    long long v17 = "%s: NETrie - failed insert - out of allocated memory";
    goto LABEL_80;
  }
  if (*a2 < 0) {
    goto LABEL_16;
  }
  uint64_t v14 = 1;
  do
  {
    if (__n == v14) {
      goto LABEL_20;
    }
    int64_t v15 = v14;
    int v16 = a2[v14++];
  }
  while ((v16 & 0x80000000) == 0);
  if (v15 < __n)
  {
LABEL_16:
    if (ne_log_obj_g_init != -1) {
      dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
    }
    uint32_t v10 = ne_log_obj_log_obj;
    if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)long long buf = 136315138;
    uint64_t v63 = "ne_trie_insert";
    long long v17 = "%s: NETrie - failed insert - non-printable ASCII not supported";
    goto LABEL_80;
  }
LABEL_20:
  long long v18 = (unsigned char *)(*(void *)(a1 + 32) + v9);
  if (a6)
  {
    int64_t v19 = __n;
    do
      *v18++ = a2[--v19];
    while (v19);
  }
  else
  {
    memcpy(v18, a2, __n);
  }
  unsigned int v20 = *(unsigned __int16 *)(a1 + 60);
  LOWORD(v21) = *(_WORD *)(a1 + 58);
  size_t __na = a5;
  if (v20 == 0xFFFF)
  {
    unsigned int v22 = 0xFFFF;
LABEL_27:
    uint64_t v6 = *(unsigned __int16 *)(a1 + 54);
    if (v6 >= *(unsigned __int16 *)(a1 + 48))
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint32_t v10 = ne_log_obj_log_obj;
      if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      *(_DWORD *)long long buf = 136315138;
      uint64_t v63 = "ne_trie_insert";
      long long v17 = "%s: NETrie - Ran out of trie nodes while inserting a new leaf";
    }
    else
    {
      *(_WORD *)(a1 + 54) = v6 + 1;
      uint64_t v23 = *(void *)(a1 + 16);
      *(_WORD *)(v23 + 10 * v6 + 4) = -1;
      uint64_t v24 = *(unsigned __int16 *)(a1 + 58);
      if (v24 + (unint64_t)v8 > *(unsigned __int16 *)(a1 + 52))
      {
        *(_WORD *)(v23 + 10 * v6) = -1;
LABEL_88:
        if (ne_log_obj_g_init != -1) {
          dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
        }
        uint32_t v10 = ne_log_obj_log_obj;
        if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
          goto LABEL_9;
        }
        *(_DWORD *)long long buf = 136315138;
        uint64_t v63 = "ne_trie_insert";
        long long v17 = "%s: NETrie - Ran out of bytes while inserting a new leaf";
        goto LABEL_80;
      }
      if (v24 != (unsigned __int16)v21)
      {
        memmove((void *)(*(void *)(a1 + 32) + v24), (const void *)(*(void *)(a1 + 32) + (unsigned __int16)v21), v8);
        LOWORD(v21) = *(_WORD *)(a1 + 58);
        uint64_t v23 = *(void *)(a1 + 16);
      }
      *(_WORD *)(a1 + 58) = v21 + v8;
      *(_WORD *)(v23 + 10 * v6) = v24;
      if (v24 == 0xFFFF) {
        goto LABEL_88;
      }
      *(_WORD *)(v23 + 10 * v6 + 2) = *(_WORD *)(v23 + 10 * v6 + 2) & 0x8000 | v8 & 0x7FFF;
      *(_WORD *)(*(void *)(a1 + 16) + 10 * v6 + 2) |= 0x8000u;
      if (a4 && __na)
      {
        memcpy((void *)(*(void *)(a1 + 32) + *(unsigned __int16 *)(a1 + 58)), a4, __na);
        uint64_t v49 = *(unsigned __int16 *)(a1 + 58);
        if (v49 + __na <= *(unsigned __int16 *)(a1 + 52)) {
          *(_WORD *)(a1 + 58) = v49 + __na;
        }
        else {
          LOWORD(v49) = -1;
        }
        uint64_t v50 = *(void *)(a1 + 16);
        uint64_t v51 = v50 + 10 * v6;
        *(_WORD *)(v51 + 6) = v49;
        *(_WORD *)(v51 + 8) = __na;
      }
      else
      {
        uint64_t v50 = *(void *)(a1 + 16);
      }
      uint64_t v52 = v50 + 10 * v22;
      unsigned int v55 = *(unsigned __int16 *)(v52 + 4);
      __int16 v54 = (_WORD *)(v52 + 4);
      unsigned int v53 = v55;
      if (v55 != 0xFFFF)
      {
LABEL_107:
        int v56 = *(char *)(*(void *)(a1 + 32) + *(unsigned __int16 *)(v50 + 10 * v6));
        if (v56 < 32)
        {
          if (ne_log_obj_g_init != -1) {
            dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
          }
          __int16 v57 = ne_log_obj_log_obj;
          if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
          {
            int v58 = *(unsigned __int8 *)(*(void *)(a1 + 32)
                                     + *(unsigned __int16 *)(*(void *)(a1 + 16) + 10 * v6));
            *(_DWORD *)long long buf = 67109120;
            LODWORD(v63) = v58;
            _os_log_error_impl(&dword_19DD92000, v57, OS_LOG_TYPE_ERROR, "NETrie - out of printable acsii range <%X>", buf, 8u);
          }
        }
        else
        {
          *(_WORD *)(*(void *)(a1 + 24) + 192 * v53 + 2 * (v56 - 32)) = v6;
        }
        return (unsigned __int16)v6;
      }
      unsigned int v53 = *(unsigned __int16 *)(a1 + 56);
      if (v53 < *(unsigned __int16 *)(a1 + 50))
      {
        *(_WORD *)(a1 + 56) = v53 + 1;
        *__int16 v54 = v53;
        goto LABEL_107;
      }
      *__int16 v54 = -1;
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint32_t v10 = ne_log_obj_log_obj;
      if (!os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      *(_DWORD *)long long buf = 136315138;
      uint64_t v63 = "ne_trie_insert";
      long long v17 = "%s: NETrie - Ran out of child maps while inserting a new leaf";
    }
LABEL_80:
    _os_log_error_impl(&dword_19DD92000, v10, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
    goto LABEL_9;
  }
  unsigned __int16 v25 = v21 + v8;
  if (a4) {
    BOOL v26 = a5 == 0;
  }
  else {
    BOOL v26 = 1;
  }
  int v27 = !v26;
  int v59 = v27;
  unint64_t v28 = (unsigned __int16)(v21 + v8);
  uint64_t v29 = *(void *)(a1 + 16);
  unsigned int v30 = *(unsigned __int16 *)(a1 + 60);
  unsigned __int16 v61 = v21 + v8;
  while (1)
  {
    long long v31 = (unsigned __int16 *)(v29 + 10 * v20);
    unsigned int v32 = *v31;
    if (v32 >= (unsigned __int16)((v31[1] & 0x7FFF) + v32) || (unsigned __int16)v21 >= v25)
    {
      LOWORD(v33) = *v31;
    }
    else
    {
      unint64_t v21 = (unsigned __int16)v21;
      unint64_t v33 = *v31;
      do
      {
        if (*(unsigned __int8 *)(*(void *)(a1 + 32) + v33) != *(unsigned __int8 *)(*(void *)(a1 + 32) + v21)) {
          break;
        }
        ++v33;
        ++v21;
        if (v33 >= (unsigned __int16)((v31[1] & 0x7FFF) + v32)) {
          break;
        }
      }
      while (v21 < v28);
    }
    unsigned __int16 v8 = v25 - v21;
    if ((v31[1] & 0x7FFF) + v32 <= (unsigned __int16)v33)
    {
      unsigned int v22 = v20;
      goto LABEL_70;
    }
    unsigned int v22 = *(unsigned __int16 *)(a1 + 54);
    if (v22 >= *(unsigned __int16 *)(a1 + 48))
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint32_t v10 = ne_log_obj_log_obj;
      if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v63 = "ne_trie_insert";
        long long v17 = "%s: NETrie - Ran out of trie nodes while splitting an existing node";
        goto LABEL_80;
      }
      goto LABEL_9;
    }
    *(_WORD *)(a1 + 54) = v22 + 1;
    long long v34 = (_WORD *)(v29 + 10 * v22);
    v34[2] = -1;
    *long long v34 = v32;
    v34[1] = v34[1] & 0x8000 | (v33 - *v31) & 0x7FFF;
    if (v25 == (_WORD)v21)
    {
      uint64_t v35 = *(void *)(a1 + 16) + 10 * v22;
      *(_WORD *)(v35 + 2) |= 0x8000u;
      if (v59)
      {
        memcpy((void *)(*(void *)(a1 + 32) + *(unsigned __int16 *)(a1 + 58)), a4, __na);
        uint64_t v36 = *(unsigned __int16 *)(a1 + 58);
        if (v36 + __na <= *(unsigned __int16 *)(a1 + 52)) {
          *(_WORD *)(a1 + 58) = v36 + __na;
        }
        else {
          LOWORD(v36) = -1;
        }
        uint64_t v37 = *(void *)(a1 + 16) + 10 * v22;
        *(_WORD *)(v37 + 6) = v36;
        *(_WORD *)(v37 + 8) = __na;
        unsigned __int16 v25 = v61;
      }
    }
    unsigned int v38 = *(unsigned __int16 *)(a1 + 56);
    if (v38 >= *(unsigned __int16 *)(a1 + 50)) {
      break;
    }
    *(_WORD *)(a1 + 56) = v38 + 1;
    *(_WORD *)(*(void *)(a1 + 16) + 10 * v22 + 4) = v38;
    uint64_t v39 = *(void *)(a1 + 32);
    if (*(char *)(v39 + (unsigned __int16)v33) < 32)
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      uint64_t v40 = ne_log_obj_log_obj;
      BOOL v41 = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
      uint64_t v39 = *(void *)(a1 + 32);
      if (v41)
      {
        int v47 = *(unsigned __int8 *)(v39 + (unsigned __int16)v33);
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v63) = v47;
        _os_log_error_impl(&dword_19DD92000, v40, OS_LOG_TYPE_ERROR, "NETrie - out of printable acsii range <%X>", buf, 8u);
        uint64_t v39 = *(void *)(a1 + 32);
      }
      unsigned __int16 v25 = v61;
    }
    else
    {
      *(_WORD *)(*(void *)(a1 + 24)
               + 192 * v38
               + 2 * (*(unsigned __int8 *)(v39 + (unsigned __int16)v33) - 32)) = v20;
    }
    uint64_t v42 = *(void *)(a1 + 16);
    int v43 = *(char *)(v39 + *(unsigned __int16 *)(v42 + 10 * v22));
    if (v43 < 32)
    {
      if (ne_log_obj_g_init != -1) {
        dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
      }
      int v44 = ne_log_obj_log_obj;
      BOOL v45 = os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR);
      uint64_t v42 = *(void *)(a1 + 16);
      if (v45)
      {
        int v48 = *(unsigned __int8 *)(*(void *)(a1 + 32) + *(unsigned __int16 *)(v42 + 10 * v22));
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v63) = v48;
        _os_log_error_impl(&dword_19DD92000, v44, OS_LOG_TYPE_ERROR, "NETrie - out of printable acsii range <%X>", buf, 8u);
        uint64_t v42 = *(void *)(a1 + 16);
      }
      unsigned __int16 v25 = v61;
    }
    else
    {
      *(_WORD *)(*(void *)(a1 + 24)
               + 192 * *(unsigned __int16 *)(v42 + 10 * v30 + 4)
               + 2 * (v43 - 32)) = v22;
    }
    stat v46 = (_WORD *)(v42 + 10 * v20);
    *stat v46 = v33;
    v46[1] = v46[1] & 0x8000 | (v46[1] - *(_WORD *)(v42 + 10 * v22 + 2)) & 0x7FFF;
LABEL_70:
    if (!v8)
    {
      LOWORD(v6) = v22;
      return (unsigned __int16)v6;
    }
    uint64_t v29 = *(void *)(a1 + 16);
    if (*(unsigned __int16 *)(v29 + 10 * v22 + 4) != 0xFFFFLL
      && *(char *)(*(void *)(a1 + 32) + (unsigned __int16)v21) >= 32)
    {
      unsigned int v20 = *(unsigned __int16 *)(*(void *)(a1 + 24)
                                + 192 * *(unsigned __int16 *)(v29 + 10 * v22 + 4)
                                + 2
                                * (*(unsigned __int8 *)(*(void *)(a1 + 32) + (unsigned __int16)v21) - 32));
      unsigned int v30 = v22;
      if (v20 != 0xFFFF) {
        continue;
      }
    }
    goto LABEL_27;
  }
  *(_WORD *)(*(void *)(a1 + 16) + 10 * v22 + 4) = -1;
  if (ne_log_obj_g_init != -1) {
    dispatch_once(&ne_log_obj_g_init, &__block_literal_global_264);
  }
  uint32_t v10 = ne_log_obj_log_obj;
  if (os_log_type_enabled((os_log_t)ne_log_obj_log_obj, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v63 = "ne_trie_insert";
    long long v17 = "%s: NETrie - Ran out of child maps while splitting an existing node";
    goto LABEL_80;
  }
LABEL_9:
  LOWORD(v6) = -1;
  return (unsigned __int16)v6;
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40CF6D8](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40CFD60]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40CF728]();
}

uint64_t __strncpy_chk()
{
  return MEMORY[0x1F40CF778]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40CF780](*(void *)&a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

mach_port_name_t audit_session_self(void)
{
  return MEMORY[0x1F40CFEC0]();
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1F40CF7F0](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1F40CF808](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CFEE8](*(void *)&a1);
}

uint64_t csops()
{
  return MEMORY[0x1F40CFF00]();
}

uint64_t csops_audittoken()
{
  return MEMORY[0x1F40CFF08]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CF480](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CF488](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CF4B0](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CF4B8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CF4C0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CF500](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CF620](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CF628](__handle, __symbol);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CFF88](*(void *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CFFB0](*(void *)&a1, a2);
}

gid_t getegid(void)
{
  return MEMORY[0x1F40CFFD0]();
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CFFE0]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40D0000]();
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x1F40D0028](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, a5);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1F40CF8F0](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1F40CF8F8](*(void *)&a1, a2, a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40D0670](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40D0678](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CF918](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CF920](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CF928](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CF930](__b, *(void *)&__c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40D02E0](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40D02F0](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40D02F8](a1, a2);
}

uint64_t necp_match_policy()
{
  return MEMORY[0x1F40D0300]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40D06B8](*(void *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1F40D06C0](*(void *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40D06C8](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40D06E8](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40D06F0](name, out_token, queue, handler);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40D0308](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40D0AF8](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40D0B10](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40D0B18](log);
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

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40D03A8](*(void *)&__fd, __buf, __nbyte, a4);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40D03B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1F40D03C0](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40D0A48]();
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1F40D0480](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CFA00](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CFA20](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CFA40](*(void *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x1F40CFA48](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CFA60](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CFA70](__s1, __s2, __n);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1F40CFAA0](__stringp, __delim);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CFAB0](__s1, __s2);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CFAE8](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CFAF0](a1, a2, a3, a4, a5);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1F40CFB30](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1F40CFB40](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1F40CFB48](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40D0B70](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40D0B78](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40D0B80](xarray);
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  return (const void *)MEMORY[0x1F40D0B88](xarray, index, length);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1F40D0B98](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40D0BA0](xarray, index);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40D0BF0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40D0C20](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40D0C48](object);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40D0C50](object);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x1F40D0C60]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40D0C68](bytes, length);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return MEMORY[0x1F40D0C78](xdata, buffer, off, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40D0C80](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40D0C88](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40D0C90](xdict, applier);
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x1F40D0C98]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40D0CA0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40D0CA8]();
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40D0CB0](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40D0CC0](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1F40D0CC8](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40D0CD0](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40D0CD8](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40D0CE0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40D0CE8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40D0CF0](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1F40D0CF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40D0D00](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x1F40D0D28]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x1F40D0D60](xfd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40D0D70](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1F40D0D80](xint);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40D0DC0](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40D0DD0](string);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x1F40D0DD8](xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40D0DE0](xstring);
}