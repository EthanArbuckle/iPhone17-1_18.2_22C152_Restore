uint64_t simple_session_create(uint64_t a1)
{
  SimpleSession *v2;
  uint64_t vars8;

  v2 = [SimpleSession alloc];

  return (uint64_t)[(SimpleSession *)v2 initWithFlags:a1];
}

uint64_t simple_session_set_homedir_size(void *a1, uint64_t a2, CFErrorRef *a3)
{
  id v5 = a1;
  v6 = [v5 session];
  int v7 = session_set_homedir_size((uint64_t)v6, a2);

  if (v7)
  {
    v8 = _simple_session_log();

    if (v8)
    {
      v9 = _simple_session_log();
      os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      v10 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      v10 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("simple_session_set_homedir_size", "simple_session.m", 73, "com.apple.security.cryptex.posix", v7, 0, v10);
    free(v10);
    if (a3 && Error)
    {
      v12 = _simple_session_log();

      if (v12)
      {
        v13 = _simple_session_log();
        os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
        v14 = (char *)_os_log_send_and_compose_impl();
      }
      else
      {
        v14 = (char *)_os_log_send_and_compose_impl();
      }
      CFErrorRef v16 = createError("simple_session_set_homedir_size", "simple_session.m", 78, "com.apple.security.cryptex", 14, Error, v14);
      free(v14);
      *a3 = v16;
      goto LABEL_13;
    }
    if (Error)
    {
LABEL_13:
      CFRelease(Error);
      uint64_t v15 = 0;
      goto LABEL_14;
    }
  }
  uint64_t v15 = 1;
LABEL_14:

  return v15;
}

void sub_21DAF34DC(_Unwind_Exception *a1)
{
  free(v2);
  CFRelease(v1);
  _Unwind_Resume(a1);
}

id _simple_session_log()
{
  if (_simple_session_log_onceToken != -1) {
    dispatch_once(&_simple_session_log_onceToken, &__block_literal_global);
  }
  v0 = (void *)_simple_session_log_trampoline_log;

  return v0;
}

uint64_t simple_session_add_session_environment(void *a1, void *a2, CFErrorRef *a3)
{
  id v5 = a1;
  id v6 = a2;
  int v7 = [v5 session];
  int v8 = session_add_session_environment((uint64_t)v7, v6);

  if (v8)
  {
    v9 = _simple_session_log();

    if (v9)
    {
      v10 = _simple_session_log();
      os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      v11 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      v11 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("simple_session_add_session_environment", "simple_session.m", 91, "com.apple.security.cryptex.posix", v8, 0, v11);
    free(v11);
    if (a3 && Error)
    {
      v13 = _simple_session_log();

      if (v13)
      {
        v14 = _simple_session_log();
        os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
        uint64_t v15 = (char *)_os_log_send_and_compose_impl();
      }
      else
      {
        uint64_t v15 = (char *)_os_log_send_and_compose_impl();
      }
      CFErrorRef v17 = createError("simple_session_add_session_environment", "simple_session.m", 96, "com.apple.security.cryptex", 14, Error, v15);
      free(v15);
      *a3 = v17;
      goto LABEL_13;
    }
    if (Error)
    {
LABEL_13:
      CFRelease(Error);
      uint64_t v16 = 0;
      goto LABEL_14;
    }
  }
  uint64_t v16 = 1;
LABEL_14:

  return v16;
}

void sub_21DAF3844(_Unwind_Exception *a1)
{
  free(v2);
  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t simple_session_activate(void *a1, CFErrorRef *a2)
{
  id v3 = a1;
  v4 = [v3 session];
  int v5 = session_activate((uint64_t)v4);

  if (v5)
  {
    id v6 = _simple_session_log();

    if (v6)
    {
      int v7 = _simple_session_log();
      os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      int v8 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      int v8 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("simple_session_activate", "simple_session.m", 110, "com.apple.security.cryptex.posix", v5, 0, v8);
  }
  else
  {
    v9 = [v3 session];
    int v10 = session_start((uint64_t)v9);

    if (!v10) {
      goto LABEL_16;
    }
    v11 = _simple_session_log();

    if (v11)
    {
      v12 = _simple_session_log();
      os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
      int v8 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      int v8 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("simple_session_activate", "simple_session.m", 117, "com.apple.security.cryptex.posix", v10, 0, v8);
  }
  CFErrorRef v14 = Error;
  free(v8);
  if (a2 && v14)
  {
    uint64_t v15 = _simple_session_log();

    if (v15)
    {
      uint64_t v16 = _simple_session_log();
      os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
      CFErrorRef v17 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      CFErrorRef v17 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v19 = createError("simple_session_activate", "simple_session.m", 124, "com.apple.security.cryptex", 14, v14, v17);
    free(v17);
    *a2 = v19;
    goto LABEL_19;
  }
  if (v14)
  {
LABEL_19:
    CFRelease(v14);
    uint64_t v18 = 0;
    goto LABEL_20;
  }
LABEL_16:
  uint64_t v18 = 1;
LABEL_20:

  return v18;
}

void sub_21DAF3C6C(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

uint64_t simple_session_stop(void *a1, CFErrorRef *a2)
{
  id v3 = a1;
  v4 = [v3 session];
  int v5 = session_stop((uint64_t)v4);

  if (v5)
  {
    id v6 = _simple_session_log();

    if (v6)
    {
      int v7 = _simple_session_log();
      os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      int v8 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      int v8 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("simple_session_stop", "simple_session.m", 139, "com.apple.security.cryptex.posix", v5, 0, v8);
    free(v8);
    if (a2 && Error)
    {
      int v10 = _simple_session_log();

      if (v10)
      {
        v11 = _simple_session_log();
        os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
        v12 = (char *)_os_log_send_and_compose_impl();
      }
      else
      {
        v12 = (char *)_os_log_send_and_compose_impl();
      }
      CFErrorRef v14 = createError("simple_session_stop", "simple_session.m", 146, "com.apple.security.cryptex", 14, Error, v12);
      free(v12);
      *a2 = v14;
      goto LABEL_13;
    }
    if (Error)
    {
LABEL_13:
      CFRelease(Error);
      uint64_t v13 = 0;
      goto LABEL_14;
    }
  }
  uint64_t v13 = 1;
LABEL_14:

  return v13;
}

void sub_21DAF3F6C(_Unwind_Exception *a1)
{
  free(v2);
  CFRelease(v1);
  _Unwind_Resume(a1);
}

char *simple_session_copy_homedir(void *a1)
{
  v1 = [a1 session];
  homedir = (const char *)session_get_homedir((uint64_t)v1);
  id v3 = strdup(homedir);

  return v3;
}

uint64_t simple_session_get_uuid(void *a1, unsigned __int8 *a2)
{
  id v3 = [a1 session];
  uint64_t uuid = session_get_uuid((uint64_t)v3, a2);

  return uuid;
}

uint64_t simple_session_get_uid(void *a1)
{
  v1 = [a1 session];
  uint64_t uid = session_get_uid((uint64_t)v1);

  return uid;
}

char *simple_session_copy_name(void *a1)
{
  v1 = [a1 session];
  name = (const char *)session_get_name((uint64_t)v1);
  id v3 = strdup(name);

  return v3;
}

uint64_t simple_session_iter_list()
{
  return 0;
}

uint64_t cryptex_simple_run_cmd()
{
  return 0;
}

uint64_t cryptex_simple_run_cmd_custom()
{
  return 0;
}

uint64_t ___simple_session_log_block_invoke()
{
  _simple_session_log_trampoline_log = (uint64_t)os_log_create("com.apple.libcryptex", "simple_session_spi");

  return MEMORY[0x270F9A758]();
}

CFErrorRef img4_chip_instance_from_xpc(void *a1, uint64_t a2)
{
  v43[2] = *MEMORY[0x263EF8340];
  id v3 = a1;
  v4 = v3;
  v43[0] = 0;
  *(void *)((char *)v43 + 6) = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  memset(v42, 0, 19);
  if (!v3)
  {
    LOWORD(v35) = 0;
    int v5 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 94, "com.apple.security.cryptex", 11, 0, v5);
    goto LABEL_23;
  }
  uint64_t v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v3, "img4_chip_omit", &v34))
  {
    int v35 = 136315138;
    v36 = "img4_chip_omit";
    int v5 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 98, "com.apple.security.cryptex", 11, 0, v5);
LABEL_23:
    CFErrorRef v11 = Error;
    free(v5);
    goto LABEL_24;
  }
  uint64_t v7 = v34;
  uint64_t v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_cepo", &v34))
  {
    int v35 = 136315138;
    v36 = "img4_chip_cepo";
    int v5 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 99, "com.apple.security.cryptex", 11, 0, v5);
    goto LABEL_23;
  }
  int v8 = v34;
  if (HIDWORD(v34))
  {
    int v35 = 134218242;
    v36 = (const char *)v34;
    __int16 v37 = 2080;
    v38 = "img4_chip_cepo";
    int v5 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 99, "com.apple.security.cryptex", 11, 0, v5);
    goto LABEL_23;
  }
  uint64_t v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_bord", &v34))
  {
    int v35 = 136315138;
    v36 = "img4_chip_bord";
    int v5 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 100, "com.apple.security.cryptex", 11, 0, v5);
    goto LABEL_23;
  }
  int v9 = v34;
  if (HIDWORD(v34))
  {
    int v35 = 134218242;
    v36 = (const char *)v34;
    __int16 v37 = 2080;
    v38 = "img4_chip_bord";
    int v5 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 100, "com.apple.security.cryptex", 11, 0, v5);
    goto LABEL_23;
  }
  uint64_t v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_chip", &v34))
  {
    int v35 = 136315138;
    v36 = "img4_chip_chip";
    int v5 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 101, "com.apple.security.cryptex", 11, 0, v5);
    goto LABEL_23;
  }
  int v10 = v34;
  if (HIDWORD(v34))
  {
    int v35 = 134218242;
    v36 = (const char *)v34;
    __int16 v37 = 2080;
    v38 = "img4_chip_chip";
    int v5 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 101, "com.apple.security.cryptex", 11, 0, v5);
    goto LABEL_23;
  }
  uint64_t v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_sdom", &v34))
  {
    int v35 = 136315138;
    v36 = "img4_chip_sdom";
    int v5 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 102, "com.apple.security.cryptex", 11, 0, v5);
    goto LABEL_23;
  }
  if (HIDWORD(v34))
  {
    int v35 = 134218242;
    v36 = (const char *)v34;
    __int16 v37 = 2080;
    v38 = "img4_chip_sdom";
    int v5 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 102, "com.apple.security.cryptex", 11, 0, v5);
    goto LABEL_23;
  }
  int v33 = v34;
  uint64_t v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_ecid", &v34))
  {
    int v35 = 136315138;
    v36 = "img4_chip_ecid";
    int v5 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 103, "com.apple.security.cryptex", 11, 0, v5);
    goto LABEL_23;
  }
  uint64_t v13 = v34;
  uint64_t v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_cpro", &v34))
  {
    int v35 = 136315138;
    v36 = "img4_chip_cpro";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 104, "com.apple.security.cryptex", 11, 0, v14);
LABEL_79:
    CFErrorRef v19 = v15;
    free(v14);
    CFErrorRef v11 = v19;
    goto LABEL_24;
  }
  char v16 = v34;
  if (v34 >= 2)
  {
    int v35 = 134218242;
    v36 = (const char *)v34;
    __int16 v37 = 2080;
    v38 = "img4_chip_cpro";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 104, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  uint64_t v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_csec", &v34))
  {
    int v35 = 136315138;
    v36 = "img4_chip_csec";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 105, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  char v17 = v34;
  if (v34 >= 2)
  {
    int v35 = 134218242;
    v36 = (const char *)v34;
    __int16 v37 = 2080;
    v38 = "img4_chip_csec";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 105, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  uint64_t v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_epro", &v34))
  {
    int v35 = 136315138;
    v36 = "img4_chip_epro";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 106, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  char v32 = v34;
  if (v34 >= 2)
  {
    int v35 = 134218242;
    v36 = (const char *)v34;
    __int16 v37 = 2080;
    v38 = "img4_chip_epro";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 106, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  uint64_t v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_esec", &v34))
  {
    int v35 = 136315138;
    v36 = "img4_chip_esec";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 107, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  char v31 = v34;
  if (v34 >= 2)
  {
    int v35 = 134218242;
    v36 = (const char *)v34;
    __int16 v37 = 2080;
    v38 = "img4_chip_esec";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 107, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  uint64_t v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_iuou", &v34))
  {
    int v35 = 136315138;
    v36 = "img4_chip_iuou";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 108, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  char v30 = v34;
  if (v34 >= 2)
  {
    int v35 = 134218242;
    v36 = (const char *)v34;
    __int16 v37 = 2080;
    v38 = "img4_chip_iuou";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 108, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  uint64_t v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_rsch", &v34))
  {
    int v35 = 136315138;
    v36 = "img4_chip_rsch";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 109, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  char v29 = v34;
  if (v34 >= 2)
  {
    int v35 = 134218242;
    v36 = (const char *)v34;
    __int16 v37 = 2080;
    v38 = "img4_chip_rsch";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 109, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  uint64_t v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_euou", &v34))
  {
    int v35 = 136315138;
    v36 = "img4_chip_euou";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 110, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  char v28 = v34;
  if (v34 >= 2)
  {
    int v35 = 134218242;
    v36 = (const char *)v34;
    __int16 v37 = 2080;
    v38 = "img4_chip_euou";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 110, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  uint64_t v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_esdm", &v34))
  {
    int v35 = 136315138;
    v36 = "img4_chip_esdm";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 111, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  int v27 = v34;
  if (HIDWORD(v34))
  {
    int v35 = 134218242;
    v36 = (const char *)v34;
    __int16 v37 = 2080;
    v38 = "img4_chip_esdm";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 111, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  uint64_t v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_fpgt", &v34))
  {
    int v35 = 136315138;
    v36 = "img4_chip_fpgt";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 112, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  char v26 = v34;
  if (v34 >= 2)
  {
    int v35 = 134218242;
    v36 = (const char *)v34;
    __int16 v37 = 2080;
    v38 = "img4_chip_fpgt";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 112, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  uint64_t v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_fchp", &v34))
  {
    int v35 = 136315138;
    v36 = "img4_chip_fchp";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 113, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  int v25 = v34;
  if (HIDWORD(v34))
  {
    int v35 = 134218242;
    v36 = (const char *)v34;
    __int16 v37 = 2080;
    v38 = "img4_chip_fchp";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 113, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  uint64_t v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_type", &v34))
  {
    int v35 = 136315138;
    v36 = "img4_chip_type";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 114, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  int v24 = v34;
  if (HIDWORD(v34))
  {
    int v35 = 134218242;
    v36 = (const char *)v34;
    __int16 v37 = 2080;
    v38 = "img4_chip_type";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 114, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  uint64_t v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_styp", &v34))
  {
    int v35 = 136315138;
    v36 = "img4_chip_styp";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 115, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  int v23 = v34;
  if (HIDWORD(v34))
  {
    int v35 = 134218242;
    v36 = (const char *)v34;
    __int16 v37 = 2080;
    v38 = "img4_chip_styp";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 115, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  uint64_t v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_clas", &v34))
  {
    int v35 = 136315138;
    v36 = "img4_chip_clas";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 116, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  int v18 = v34;
  if (HIDWORD(v34))
  {
    int v35 = 134218242;
    v36 = (const char *)v34;
    __int16 v37 = 2080;
    v38 = "img4_chip_clas";
    CFErrorRef v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 116, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_79;
  }
  long long v20 = v39;
  *(_OWORD *)(a2 + 77) = v40;
  long long v21 = v42[0];
  *(_OWORD *)(a2 + 93) = v41;
  *(_OWORD *)(a2 + 109) = v21;
  *(_WORD *)a2 = 6;
  *(void *)(a2 + 2) = v43[0];
  *(void *)(a2 + 8) = *(void *)((char *)v43 + 6);
  *(void *)(a2 + 16) = v7;
  *(_DWORD *)(a2 + 24) = v8;
  *(_DWORD *)(a2 + 28) = v9;
  *(_DWORD *)(a2 + 32) = v10;
  *(_DWORD *)(a2 + 36) = v33;
  *(void *)(a2 + 40) = v13;
  *(unsigned char *)(a2 + 48) = v16 & 1;
  *(unsigned char *)(a2 + 49) = v17 & 1;
  *(unsigned char *)(a2 + 50) = v32 & 1;
  *(unsigned char *)(a2 + 51) = v31 & 1;
  *(unsigned char *)(a2 + 52) = v30 & 1;
  *(unsigned char *)(a2 + 53) = v29 & 1;
  *(_WORD *)(a2 + 54) = v28 & 1;
  *(_DWORD *)(a2 + 56) = v27;
  *(unsigned char *)(a2 + 60) = v26 & 1;
  int v22 = *(_DWORD *)((char *)v42 + 15);
  *(_OWORD *)(a2 + 61) = v20;
  *(_DWORD *)(a2 + 124) = v22;
  *(_DWORD *)(a2 + 128) = v25;
  *(_DWORD *)(a2 + 132) = v24;
  *(_DWORD *)(a2 + 136) = v23;
  *(_DWORD *)(a2 + 140) = v18;
  CFErrorRef v11 = 0;
LABEL_24:

  return v11;
}

void sub_21DAF5A1C(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

uint64_t _IORegistryExchangeWithFirstChildOfClass(io_object_t *a1, const char *a2)
{
  io_object_t object = 0;
  uint64_t v2 = 2;
  if (a1 && a2)
  {
    if (!MEMORY[0x223C113D0](*a1, "IOService", &object))
    {
      io_object_t v6 = IOIteratorNext(object);
      if (v6)
      {
        io_object_t v7 = v6;
        while (!IOObjectConformsTo(v7, a2))
        {
          IOObjectRelease(v7);
          io_object_t v7 = IOIteratorNext(object);
          if (!v7)
          {
            uint64_t v2 = 2;
            goto LABEL_4;
          }
        }
        IOObjectRelease(*a1);
        uint64_t v2 = 0;
        *a1 = v7;
      }
    }
LABEL_4:
    if (object) {
      IOObjectRelease(object);
    }
  }
  return v2;
}

char *_cryptex_version()
{
  return __darwin_version_string;
}

uint64_t _cryptex_install_core(uint64_t a1, uint64_t a2)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  uint64_t v3 = _g;
  uint64_t v60 = 0;
  memset(v59, 0, sizeof(v59));
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v52 = 0u;
  long long v51 = 0u;
  long long v50 = 0u;
  long long v49 = 0u;
  long long v48 = 0u;
  long long v47 = 0u;
  long long v46 = 0u;
  long long v45 = 0u;
  long long v44 = 0u;
  long long v43 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  uint64_t v36 = 32;
  if (a2 && *(void *)(a2 + 48) >= 3uLL)
  {
    v4 = *(const char **)(a1 + 16);
    int v5 = *__error();
    io_object_t v6 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      io_object_t v7 = "[anonymous]";
      if (v4) {
        io_object_t v7 = v4;
      }
      *(_DWORD *)buf = 136446210;
      char v31 = v7;
      _os_log_impl(&dword_21DAF1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: Installing as ephemeral", buf, 0xCu);
    }
    *__error() = v5;
  }
  if (!cryptex_core_get_image_asset())
  {
    int v8 = *(const char **)(a1 + 16);
    int v9 = *__error();
    int v10 = *(NSObject **)(a1 + 32);
    uint64_t v11 = 22;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = "[anonymous]";
      if (v8) {
        v12 = v8;
      }
      *(_DWORD *)buf = 136446466;
      char v31 = v12;
      __int16 v32 = 1024;
      LODWORD(v33) = 22;
      uint64_t v13 = "%{public}s: cryptex doesn't contain image asset: %{darwin.errno}d";
      goto LABEL_21;
    }
LABEL_22:
    char v16 = 0;
    xpc_object_t v17 = 0;
    goto LABEL_40;
  }
  if (!cryptex_core_get_tc_asset())
  {
    CFErrorRef v14 = *(const char **)(a1 + 16);
    int v9 = *__error();
    int v10 = *(NSObject **)(a1 + 32);
    uint64_t v11 = 22;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      CFErrorRef v15 = "[anonymous]";
      if (v14) {
        CFErrorRef v15 = v14;
      }
      *(_DWORD *)buf = 136446466;
      char v31 = v15;
      __int16 v32 = 1024;
      LODWORD(v33) = 22;
      uint64_t v13 = "%{public}s: cryptex doesn't contain trust cache: %{darwin.errno}d";
LABEL_21:
      _os_log_impl(&dword_21DAF1000, v10, OS_LOG_TYPE_ERROR, v13, buf, 0x12u);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  cryptex_core_get_info_asset();
  cryptex_core_get_volumehash_asset();
  cryptex_core_get_asset();
  cryptex_core_get_asset();
  xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
  uint64_t result = MEMORY[0x223C12420]();
  if (result != MEMORY[0x263EF8708])
  {
    __break(1u);
    return result;
  }
  char v16 = _cryptex_copy_connected_actor(v3, MEMORY[0x263F8C430]);
  _cryptex_actor_init_invoke_u64();
  codex_install_pack();
  uint64_t v19 = cryptex_actor_trap();
  if (v19)
  {
    uint64_t v11 = v19;
    long long v20 = (const char *)v16[2];
    int v9 = *__error();
    long long v21 = v16[4];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v22 = "[anonymous]";
      if (v20) {
        int v22 = v20;
      }
      *(_DWORD *)buf = 136446466;
      char v31 = v22;
      __int16 v32 = 1024;
      LODWORD(v33) = v11;
      int v23 = "%{public}s: install rpc: %{darwin.errno}d";
LABEL_34:
      _os_log_impl(&dword_21DAF1000, v21, OS_LOG_TYPE_ERROR, v23, buf, 0x12u);
    }
  }
  else
  {
    uint64_t v24 = codex_install_reply_unpack();
    if (!v24)
    {
      __strlcpy_chk();
      __strlcpy_chk();
      __strlcpy_chk();
      __strlcpy_chk();
      __strlcpy_chk();
      int v27 = (const char *)v16[2];
      int v9 = *__error();
      char v28 = v16[4];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        char v29 = "[anonymous]";
        if (v27) {
          char v29 = v27;
        }
        *(_DWORD *)buf = 136446722;
        char v31 = v29;
        __int16 v32 = 2080;
        uint64_t v33 = 0;
        __int16 v34 = 2080;
        uint64_t v35 = 0;
        _os_log_impl(&dword_21DAF1000, v28, OS_LOG_TYPE_DEBUG, "%{public}s: installed cryptex: name = %s, mount path = %s", buf, 0x20u);
      }
      uint64_t v11 = 0;
      goto LABEL_40;
    }
    uint64_t v11 = v24;
    int v25 = (const char *)v16[2];
    int v9 = *__error();
    long long v21 = v16[4];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      char v26 = "[anonymous]";
      if (v25) {
        char v26 = v25;
      }
      *(_DWORD *)buf = 136446466;
      char v31 = v26;
      __int16 v32 = 1024;
      LODWORD(v33) = v11;
      int v23 = "%{public}s: bad reply from daemon: %{darwin.errno}d";
      goto LABEL_34;
    }
  }
LABEL_40:
  *__error() = v9;
  rpc_destroy(&v36);
  rpc_destroy(v59);
  if (v17) {
    os_release(v17);
  }
  if (v16) {
    os_release(v16);
  }
  return v11;
}

uint64_t _cryptex_uninstall_by_name()
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  long long v29 = 0u;
  long long v28 = 0u;
  long long v27 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  uint64_t v15 = 32;
  v0 = _cryptex_copy_connected_actor(_g, MEMORY[0x263F8C438]);
  _cryptex_actor_init_invoke_cstr();
  cryptex_uninstall_pack();
  uint64_t v1 = cryptex_actor_trap();
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = (const char *)v0[2];
    int v4 = *__error();
    int v5 = v0[4];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      io_object_t v6 = "[anonymous]";
      if (v3) {
        io_object_t v6 = v3;
      }
      *(_DWORD *)buf = 136446466;
      v12 = v6;
      __int16 v13 = 1024;
      int v14 = v2;
      io_object_t v7 = "%{public}s: uninstall rpc: %{darwin.errno}d";
LABEL_11:
      _os_log_impl(&dword_21DAF1000, v5, OS_LOG_TYPE_ERROR, v7, buf, 0x12u);
    }
  }
  else
  {
    uint64_t v2 = cryptex_uninstall_reply_unpack();
    if (!v2) {
      goto LABEL_13;
    }
    int v8 = (const char *)v0[2];
    int v4 = *__error();
    int v5 = v0[4];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = "[anonymous]";
      if (v8) {
        int v9 = v8;
      }
      *(_DWORD *)buf = 136446466;
      v12 = v9;
      __int16 v13 = 1024;
      int v14 = v2;
      io_object_t v7 = "%{public}s: bad reply from daemon: %{darwin.errno}d";
      goto LABEL_11;
    }
  }
  *__error() = v4;
LABEL_13:
  rpc_destroy(&v15);
  rpc_destroy(v38);
  if (v0) {
    os_release(v0);
  }
  return v2;
}

uint64_t _cryptex_copy_list_lossy(void *a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  size_t v34 = 0;
  long long v35 = 0;
  int v4 = (void *)cryptex_actor_create();
  int v5 = v4[4];
  uint64_t v6 = hdi_copy_mounted(&v35, &v34, v5);
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = (const char *)v4[2];
    int v9 = *__error();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v10 = "[anonymous]";
      if (v8) {
        int v10 = v8;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v7;
      _os_log_impl(&dword_21DAF1000, v5, OS_LOG_TYPE_ERROR, "%{public}s: copy attached dmgs: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v9;
LABEL_38:
    os_release(v4);
    uint64_t v29 = v7;
    goto LABEL_39;
  }
  size_t v11 = v34;
  if (_dispatch_is_multithreaded())
  {
    v12 = (char *)malloc_type_calloc(v11, 0xE10uLL, 0x1B044E25uLL);
    if (!v12)
    {
      do
      {
        __os_temporary_resource_shortage();
        __int16 v13 = (char *)malloc_type_calloc(v11, 0xE10uLL, 0x1B044E25uLL);
      }
      while (!v13);
      v12 = v13;
    }
  }
  else
  {
    v12 = (char *)malloc_type_calloc(v11, 0xE10uLL, 0x61D5536CuLL);
    if (!v12) {
      _cryptex_copy_list_lossy_cold_2(v40, buf);
    }
  }
  long long v31 = a1;
  long long v32 = a2;
  if (v34)
  {
    size_t v14 = 0;
    uint64_t v33 = 0;
    do
    {
      uint64_t v15 = (char *)v35;
      long long v16 = (char *)v35 + 3582 * v14;
      bzero(buf, 0xE10uLL);
      *(_OWORD *)__src = 0u;
      *(_OWORD *)long long v38 = 0u;
      long long v17 = (const char *)v4[2];
      int v18 = *__error();
      long long v19 = v4[4];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)uint64_t v40 = 136446466;
        long long v20 = "[anonymous]";
        if (v17) {
          long long v20 = v17;
        }
        long long v41 = v20;
        __int16 v42 = 2080;
        long long v43 = v16;
        _os_log_impl(&dword_21DAF1000, v19, OS_LOG_TYPE_DEBUG, "%{public}s: mount: %s", v40, 0x16u);
      }
      *__error() = v18;
      if (_dispatch_is_multithreaded())
      {
        long long v21 = strdup(v16);
        if (!v21)
        {
          do
          {
            __os_temporary_resource_shortage();
            long long v22 = strdup(v16);
          }
          while (!v22);
          long long v21 = v22;
        }
      }
      else
      {
        long long v21 = strdup(v16);
        if (!v21) {
          _cryptex_copy_list_lossy_cold_1(v16, &v36, v40);
        }
      }
      int v23 = cryptex_core_parse_hdiid();
      int v24 = *__error();
      BOOL v25 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
      if (v23)
      {
        if (v25)
        {
          *(_DWORD *)uint64_t v40 = 136446466;
          long long v26 = "[anonymous]";
          if (v17) {
            long long v26 = v17;
          }
          long long v41 = v26;
          __int16 v42 = 2080;
          long long v43 = v16;
          _os_log_impl(&dword_21DAF1000, v19, OS_LOG_TYPE_DEBUG, "%{public}s: not a cryptex: %s", v40, 0x16u);
        }
        *__error() = v24;
      }
      else
      {
        if (v25)
        {
          *(_DWORD *)uint64_t v40 = 136446466;
          long long v27 = "[anonymous]";
          if (v17) {
            long long v27 = v17;
          }
          long long v41 = v27;
          __int16 v42 = 2080;
          long long v43 = v16;
          _os_log_impl(&dword_21DAF1000, v19, OS_LOG_TYPE_DEBUG, "%{public}s: found cryptex: %s", v40, 0x16u);
        }
        *__error() = v24;
        strncpy((char *)&buf[8], __src[1], 0xFFuLL);
        strncpy((char *)&buf[263], v38[0], 0xFFuLL);
        long long v28 = &v15[3582 * v14];
        strncpy((char *)&buf[518], v28 + 510, 0x400uLL);
        strncpy((char *)&buf[1542], v28 + 1534, 0x400uLL);
        strncpy((char *)&buf[2566], v28 + 2558, 0x400uLL);
        memcpy(&v12[3600 * v33++], buf, 0xE10uLL);
      }
      free(v21);
      ++v14;
    }
    while (v14 < v34);
  }
  else
  {
    uint64_t v33 = 0;
  }
  uint64_t v7 = 0;
  uint64_t v29 = 0;
  *long long v31 = v12;
  *long long v32 = v33;
  if (v4) {
    goto LABEL_38;
  }
LABEL_39:
  free(v35);
  return v29;
}

uint64_t _cryptex_copy_list(void *a1, size_t *a2)
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  uint64_t v86 = 0;
  memset(v85, 0, sizeof(v85));
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v78 = 0u;
  long long v77 = 0u;
  long long v76 = 0u;
  long long v75 = 0u;
  long long v74 = 0u;
  long long v73 = 0u;
  long long v72 = 0u;
  long long v71 = 0u;
  long long v70 = 0u;
  long long v69 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v62 = 32;
  int v4 = _cryptex_copy_connected_actor(_g, MEMORY[0x263F8C430]);
  _cryptex_actor_init_invoke_u64();
  codex_list_pack();
  uint64_t v5 = cryptex_actor_trap();
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = (const char *)v4[2];
    int v8 = *__error();
    int v9 = v4[4];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = "[anonymous]";
      if (v7) {
        int v10 = v7;
      }
      *(_DWORD *)buf = 136446466;
      v88 = v10;
      __int16 v89 = 1024;
      LODWORD(v90) = v6;
      size_t v11 = "%{public}s: list rpc: %{darwin.errno}d";
LABEL_11:
      _os_log_impl(&dword_21DAF1000, v9, OS_LOG_TYPE_ERROR, v11, buf, 0x12u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  uint64_t v12 = codex_list_reply_unpack();
  if (v12)
  {
    uint64_t v6 = v12;
    __int16 v13 = (const char *)v4[2];
    int v8 = *__error();
    int v9 = v4[4];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      size_t v14 = "[anonymous]";
      if (v13) {
        size_t v14 = v13;
      }
      *(_DWORD *)buf = 136446466;
      v88 = v14;
      __int16 v89 = 1024;
      LODWORD(v90) = v6;
      size_t v11 = "%{public}s: bad reply from daemon: %{darwin.errno}d";
      goto LABEL_11;
    }
LABEL_12:
    *__error() = v8;
    goto LABEL_13;
  }
  long long v54 = a1;
  long long v55 = a2;
  size_t count = xpc_array_get_count(0);
  if (_dispatch_is_multithreaded())
  {
    long long v17 = (char *)malloc_type_calloc(count, 0xE10uLL, 0x1B044E25uLL);
    if (!v17)
    {
      do
      {
        __os_temporary_resource_shortage();
        int v18 = (char *)malloc_type_calloc(count, 0xE10uLL, 0x1B044E25uLL);
      }
      while (!v18);
      long long v17 = v18;
    }
  }
  else
  {
    long long v17 = (char *)malloc_type_calloc(count, 0xE10uLL, 0x61D5536CuLL);
    if (!v17) {
      _cryptex_copy_list_lossy_cold_2(&v61, buf);
    }
  }
  if (!count)
  {
LABEL_52:
    uint64_t v6 = 0;
    *long long v54 = v17;
    *long long v55 = count;
    long long v17 = 0;
    goto LABEL_69;
  }
  uint64_t v19 = 0;
  uint64_t v6 = 0;
  size_t v20 = 0;
  size_t v59 = count;
  while (1)
  {
    xpc_object_t value = xpc_array_get_value(0, v20);
    long long v22 = value;
    if (!value || MEMORY[0x223C12420](value) != MEMORY[0x263EF86D8])
    {
      long long v43 = (const char *)v4[2];
      int v44 = *__error();
      long long v45 = v4[4];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        long long v46 = "[anonymous]";
        if (v43) {
          long long v46 = v43;
        }
        v88 = v46;
        __int16 v89 = 2048;
        size_t v90 = v20;
        __int16 v91 = 2112;
        v92 = v22;
        __int16 v93 = 1024;
        int v94 = 72;
        long long v47 = "%{public}s: bad reply from daemon: i = %lu, entry = %@: %{darwin.errno}d";
        goto LABEL_61;
      }
LABEL_62:
      *__error() = v44;
      goto LABEL_68;
    }
    xpc_object_t v23 = _xpc_plist_value_copy((uint64_t)&_codex_list_name, v22);
    if (!v23)
    {
      long long v48 = (const char *)v4[2];
      int v44 = *__error();
      long long v45 = v4[4];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        long long v49 = "[anonymous]";
        if (v48) {
          long long v49 = v48;
        }
        v88 = v49;
        __int16 v89 = 2048;
        size_t v90 = v20;
        __int16 v91 = 2112;
        v92 = 0;
        __int16 v93 = 1024;
        int v94 = 72;
        long long v47 = "%{public}s: bad reply from daemon: i = %lu, list = %@: %{darwin.errno}d";
LABEL_61:
        _os_log_impl(&dword_21DAF1000, v45, OS_LOG_TYPE_ERROR, v47, buf, 0x26u);
        goto LABEL_62;
      }
      goto LABEL_62;
    }
    int v24 = v23;
    xpc_object_t v25 = _xpc_plist_value_copy((uint64_t)&_codex_list_version, v22);
    if (!v25) {
      break;
    }
    long long v26 = v25;
    xpc_object_t v27 = _xpc_plist_value_copy((uint64_t)&_codex_list_devpath, v22);
    if (v27)
    {
      long long v28 = v27;
      xpc_object_t xstring = _xpc_plist_value_copy((uint64_t)&_codex_list_subdevpath, v22);
      if (xstring)
      {
        xpc_object_t v29 = _xpc_plist_value_copy((uint64_t)&_codex_list_mntpath, v22);
        if (v29)
        {
          xpc_object_t object = v29;
          xpc_object_t v56 = _xpc_plist_value_copy((uint64_t)&_codex_list_error, v22);
          int v57 = xpc_int64_get_value(v56);
          *(void *)&v17[v19] = 0;
          xpc_string_get_string_ptr(v24);
          __strlcpy_chk();
          xpc_string_get_string_ptr(v26);
          __strlcpy_chk();
          xpc_string_get_string_ptr(v28);
          __strlcpy_chk();
          xpc_string_get_string_ptr(xstring);
          __strlcpy_chk();
          xpc_string_get_string_ptr(object);
          __strlcpy_chk();
          *(_DWORD *)&v17[v19 + 3592] = v57;
          if (v56) {
            os_release(v56);
          }
          os_release(object);
          int v30 = 0;
        }
        else
        {
          uint64_t v39 = (const char *)v4[2];
          int v40 = *__error();
          long long v41 = v4[4];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            __int16 v42 = "[anonymous]";
            if (v39) {
              __int16 v42 = v39;
            }
            v88 = v42;
            __int16 v89 = 2048;
            size_t v90 = v20;
            __int16 v91 = 2112;
            v92 = 0;
            __int16 v93 = 1024;
            int v94 = 72;
            _os_log_impl(&dword_21DAF1000, v41, OS_LOG_TYPE_ERROR, "%{public}s: bad reply from daemon: i = %lu, list = %@: %{darwin.errno}d", buf, 0x26u);
          }
          *__error() = v40;
          int v30 = 6;
          uint64_t v6 = 72;
        }
        os_release(xstring);
      }
      else
      {
        long long v35 = (const char *)v4[2];
        int v36 = *__error();
        long long v37 = v4[4];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          long long v38 = "[anonymous]";
          if (v35) {
            long long v38 = v35;
          }
          v88 = v38;
          __int16 v89 = 2048;
          size_t v90 = v20;
          __int16 v91 = 2112;
          v92 = 0;
          __int16 v93 = 1024;
          int v94 = 72;
          _os_log_impl(&dword_21DAF1000, v37, OS_LOG_TYPE_ERROR, "%{public}s: bad reply from daemon: i = %lu, list = %@: %{darwin.errno}d", buf, 0x26u);
        }
        *__error() = v36;
        int v30 = 6;
        uint64_t v6 = 72;
      }
      os_release(v28);
    }
    else
    {
      long long v31 = (const char *)v4[2];
      int v32 = *__error();
      uint64_t v33 = v4[4];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        size_t v34 = "[anonymous]";
        if (v31) {
          size_t v34 = v31;
        }
        v88 = v34;
        __int16 v89 = 2048;
        size_t v90 = v20;
        __int16 v91 = 2112;
        v92 = 0;
        __int16 v93 = 1024;
        int v94 = 72;
        _os_log_impl(&dword_21DAF1000, v33, OS_LOG_TYPE_ERROR, "%{public}s: bad reply from daemon: i = %lu, list = %@: %{darwin.errno}d", buf, 0x26u);
      }
      *__error() = v32;
      uint64_t v6 = 72;
      int v30 = 6;
    }
    os_release(v26);
    os_release(v24);
    if (v30) {
      goto LABEL_69;
    }
    ++v20;
    v19 += 3600;
    size_t count = v59;
    if (v59 == v20) {
      goto LABEL_52;
    }
  }
  long long v50 = (const char *)v4[2];
  int v51 = *__error();
  long long v52 = v4[4];
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    long long v53 = "[anonymous]";
    if (v50) {
      long long v53 = v50;
    }
    v88 = v53;
    __int16 v89 = 2048;
    size_t v90 = v20;
    __int16 v91 = 2112;
    v92 = 0;
    __int16 v93 = 1024;
    int v94 = 72;
    _os_log_impl(&dword_21DAF1000, v52, OS_LOG_TYPE_ERROR, "%{public}s: bad reply from daemon: i = %lu, list = %@: %{darwin.errno}d", buf, 0x26u);
  }
  *__error() = v51;
  os_release(v24);
LABEL_68:
  uint64_t v6 = 72;
LABEL_69:
  free(v17);
LABEL_13:
  rpc_destroy(&v62);
  rpc_destroy(v85);
  if (v4) {
    os_release(v4);
  }
  return v6;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return _os_log_send_and_compose_impl();
}

void _cryptex_signing_service_dealloc(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v3 = 1;
  do
  {
    char v4 = v3;
    close_drop_optional_np();
    uint64_t v5 = *(void **)(a1 + 40 * v2 + 296);
    if (v5 != (void *)-1 && munmap(v5, *(void *)(a1 + 40 * v2 + 304)) == -1) {
      _cryptex_signing_service_dealloc_cold_1(&v9, v10);
    }
    uint64_t v6 = a1 + 40 * v2;
    free(*(void **)(v6 + 320));
    char v3 = 0;
    *(void *)(v6 + 320) = 0;
    uint64_t v2 = 1;
  }
  while ((v4 & 1) != 0);
  free(*(void **)(a1 + 48));
  *(void *)(a1 + 48) = 0;
  uint64_t v7 = *(NSObject **)(a1 + 280);
  if (v7) {
    dispatch_release(v7);
  }
  img4_buff_dealloc();
  int v8 = *(void **)(a1 + 56);
  if (v8) {
    os_release(v8);
  }

  object_proto_destroy(a1 + 16);
}

uint64_t cryptex_signing_service_create(uint64_t a1)
{
  uint64_t v2 = _cryptex_signing_service_alloc();
  *(void *)(v2 + 56) = 0;
  *(void *)(v2 + 40) = a1;
  uint64_t v3 = img4_chip_select_personalized_ap();
  uint64_t v4 = MEMORY[0x263F8C4D8];
  *(void *)(v2 + 64) = v3;
  *(void *)(v2 + 72) = v4;
  *(void *)(v2 + 80) = ccsha384_di();
  *(_WORD *)(v2 + 88) = 0;
  *(void *)(v2 + 104) = 0;
  *(void *)(v2 + 112) = 0;
  *(void *)(v2 + 96) = 0;
  *(void *)(v2 + 280) = dispatch_semaphore_create(0);
  *(_DWORD *)(v2 + 316) = -1;
  *(void *)(v2 + 296) = -1;
  *(_DWORD *)(v2 + 356) = -1;
  *(void *)(v2 + 336) = -1;
  object_proto_init(v2 + 16, (int)"com.apple.security.libcryptex", "signing-service");
  return v2;
}

CFErrorRef cryptex_signing_service_set_cryptex_core(uint64_t a1, void *object)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v3 = os_retain(object);
  *(void *)(a1 + 56) = v3;
  uint64_t v4 = v3[21];
  if (v4 && (*(unsigned char *)(v4 + 40) & 1) != 0) {
    cryptex_signing_service_set_tss_url(a1, "https://diavlo.apple.com:443");
  }
  int nonce_domain = cryptex_core_get_nonce_domain();
  if (nonce_domain)
  {
    int v6 = nonce_domain;
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      uint64_t v7 = *(const char **)(a1 + 16);
      if (!v7) {
        uint64_t v7 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446466;
      xpc_object_t v23 = v7;
      __int16 v24 = 1024;
      LODWORD(v25) = v6;
    }
    else
    {
      uint64_t v11 = *(const char **)(a1 + 16);
      if (!v11) {
        uint64_t v11 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446466;
      xpc_object_t v23 = v11;
      __int16 v24 = 1024;
      LODWORD(v25) = nonce_domain;
    }
    uint64_t v12 = (char *)_os_log_send_and_compose_impl();
    CFIndex v13 = v6;
    int v14 = 382;
LABEL_27:
    CFErrorRef Error = createError("cryptex_signing_service_set_cryptex_core", "signing_service.c", v14, "com.apple.security.cryptex.posix", v13, 0, v12);
    free(v12);
    goto LABEL_28;
  }
  int v8 = cryptex_core_copy_nonce_domain_desc();
  if (v8)
  {
    int v9 = v8;
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      int v10 = *(const char **)(a1 + 16);
      if (!v10) {
        int v10 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446466;
      xpc_object_t v23 = v10;
      __int16 v24 = 1024;
      LODWORD(v25) = v9;
    }
    else
    {
      size_t v20 = *(const char **)(a1 + 16);
      if (!v20) {
        size_t v20 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446466;
      xpc_object_t v23 = v20;
      __int16 v24 = 1024;
      LODWORD(v25) = v8;
    }
    uint64_t v12 = (char *)_os_log_send_and_compose_impl();
    CFIndex v13 = v9;
    int v14 = 389;
    goto LABEL_27;
  }
  uint64_t v15 = *(const char **)(a1 + 16);
  int v16 = *__error();
  long long v17 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    int v18 = "[anonymous]";
    if (v15) {
      int v18 = v15;
    }
    *(_DWORD *)buf = 136446466;
    xpc_object_t v23 = v18;
    __int16 v24 = 2080;
    uint64_t v25 = 0;
    _os_log_impl(&dword_21DAF1000, v17, OS_LOG_TYPE_DEBUG, "%{public}s: signing with nonce from %s", buf, 0x16u);
  }
  CFErrorRef Error = 0;
  *__error() = v16;
LABEL_28:
  free(0);
  return Error;
}

char *cryptex_signing_service_set_tss_url(uint64_t a1, const char *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  free(*(void **)(a1 + 48));
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      uint64_t result = strdup(a2);
      if (result) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    uint64_t result = strdup(a2);
    if (!result) {
      cryptex_signing_service_set_tss_url_cold_1(a2, &v5, v6);
    }
  }
  *(void *)(a1 + 48) = result;
  return result;
}

uint64_t cryptex_signing_service_set_image(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1 + 40 * *(void *)(a2 + 40);
  int v4 = *(_DWORD *)(v3 + 316);
  *(void *)(v3 + 288) = a2;
  uint64_t result = _xferfd_unguarded(a3);
  *(_DWORD *)(v3 + 316) = result;
  if ((v4 & 0x80000000) == 0)
  {
    uint64_t result = close(v4);
    if (result == -1) {
      cryptex_signing_service_set_image_cold_1(&v6, v7);
    }
  }
  return result;
}

void cryptex_signing_service_set_image_bytes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a1 + 40 * *(void *)(a2 + 40);
  uint64_t v7 = *(void **)(v6 + 320);
  uint64_t v8 = memdup2_np();
  *(void *)(v6 + 288) = a2;
  *(void *)(v6 + 320) = v8;
  *(void *)(v6 + 304) = a4;
  *(_DWORD *)(v6 + 312) = a4;

  free(v7);
}

void *cryptex_signing_service_set_sso_ticket(void *a1, const void *a2, size_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      uint64_t v6 = malloc_type_malloc(a3, 0x2D5C015EuLL);
      if (v6) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    uint64_t v6 = malloc_type_malloc(a3, 0x18EC0261uLL);
    if (!v6) {
      cryptex_signing_service_set_sso_ticket_cold_1(&v8, v9);
    }
  }
  a1[12] = v6;
  a1[13] = a3;
  a1[14] = _cryptex_signing_service_buff_dealloc;
  uint64_t result = memcpy(v6, a2, a3);
  a1[15] = a1 + 11;
  a1[5] &= ~1uLL;
  return result;
}

void _cryptex_signing_service_buff_dealloc(int a1, void *a2)
{
}

CFErrorRef cryptex_signing_service_sign(uint64_t a1)
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v75 = 0u;
  uint64_t v78 = 0x3000000000;
  uint64_t v2 = *(void *)(a1 + 56);
  if (!v2 || (uint64_t v3 = *(void *)(v2 + 168)) == 0)
  {
    int v16 = *(const char **)(a1 + 16);
    int v17 = *__error();
    int v18 = *(NSObject **)(a1 + 32);
    int v19 = 1;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      size_t v20 = "[anonymous]";
      if (v16) {
        size_t v20 = v16;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1;
      long long v21 = "%{public}s: caller did not provide chip instance: %{darwin.errno}d";
      goto LABEL_18;
    }
LABEL_19:
    *__error() = v17;
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      long long v22 = *(const char **)(a1 + 16);
      if (!v22) {
        long long v22 = "[anonymous]";
      }
    }
    else
    {
      long long v22 = *(const char **)(a1 + 16);
      if (!v22) {
        long long v22 = "[anonymous]";
      }
    }
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = v22;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v19;
    xpc_object_t v23 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("cryptex_signing_service_sign", "signing_service.c", 571, "com.apple.security.cryptex.posix", v19, 0, v23);
    free(v23);
    MEMORY[0x223C118F0](0);
    return Error;
  }
  uint64_t v4 = *(void *)(v3 + 192);
  uint64_t v5 = (const char **)(a1 + 16);
  uint64_t v6 = *(const char **)(a1 + 16);
  int v7 = *__error();
  uint64_t v8 = *(NSObject **)(a1 + 32);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (!v4)
  {
    if (v9)
    {
      uint64_t v25 = "[anonymous]";
      if (v6) {
        uint64_t v25 = v6;
      }
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_impl(&dword_21DAF1000, v8, OS_LOG_TYPE_DEBUG, "%{public}s: using caller-provided chip environment", buf, 0xCu);
    }
    *__error() = v7;
    *(void *)(a1 + 64) = *(void *)(*(void *)(*(void *)(a1 + 56) + 168) + 1160);
    int v26 = img4_chip_instantiate();
    if (!v26)
    {
      *(void *)(a1 + 272) = a1 + 128;
      goto LABEL_9;
    }
    int v19 = v26;
    xpc_object_t v27 = *(const char **)(a1 + 16);
    int v17 = *__error();
    int v18 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      long long v28 = "[anonymous]";
      if (v27) {
        long long v28 = v27;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = v28;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v19;
      long long v21 = "%{public}s: failed to instantiate chip: %{darwin.errno}d";
LABEL_18:
      _os_log_impl(&dword_21DAF1000, v18, OS_LOG_TYPE_ERROR, v21, buf, 0x12u);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (v9)
  {
    uint64_t v10 = "[anonymous]";
    if (v6) {
      uint64_t v10 = v6;
    }
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl(&dword_21DAF1000, v8, OS_LOG_TYPE_DEBUG, "%{public}s: using caller-provided chip instance", buf, 0xCu);
  }
  *__error() = v7;
  *(void *)(a1 + 272) = *(void *)(*(void *)(*(void *)(a1 + 56) + 168) + 192);
LABEL_9:
  cryptex_core_is_cryptex1();
  uint64_t v11 = (void *)cryptex_tss_create();
  int v12 = img4_nonce_domain_copy_nonce();
  if (!v12)
  {
    if (*(void *)(a1 + 48)) {
      cryptex_tss_set_url();
    }
    if (*(void *)(a1 + 120)) {
      cryptex_tss_set_data();
    }
    if (!cryptex_core_is_cryptex1())
    {
      long long v73 = 0u;
      memset(buf, 0, sizeof(buf));
      *(void *)&long long v74 = 0x3000000000;
      _cryptex_signing_service_populate_ap_board_chip_sdom_cpro();
      cryptex_tss_set_u64();
      cryptex_tss_set_BOOL();
      cryptex_tss_set_dgst();
      cryptex_tss_set_dgst();
LABEL_50:
      if ((*(unsigned char *)(a1 + 40) & 2) != 0) {
        cryptex_tss_set_BOOL();
      }
      uint64_t v37 = 0;
      while (1)
      {
        uint64_t v38 = *(void *)(*(void *)(a1 + 56) + v37 + 64);
        long long v73 = 0u;
        long long v74 = 0u;
        memset(buf, 0, sizeof(buf));
        if (v38)
        {
          if ((**(unsigned char **)(v38 + 8) & 0x14) == 0)
          {
            uint64_t v39 = *(const char **)(a1 + 16);
            int v40 = *__error();
            long long v41 = *(NSObject **)(a1 + 32);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              __int16 v42 = "[anonymous]";
              if (v39) {
                __int16 v42 = v39;
              }
              uint64_t v43 = *(void *)(*(void *)(v38 + 8) + 40);
              *(_DWORD *)long long v66 = 136446466;
              long long v67 = v42;
              __int16 v68 = 2080;
              uint64_t v69 = v43;
              _os_log_impl(&dword_21DAF1000, v41, OS_LOG_TYPE_DEBUG, "%{public}s: stamping asset: %s", v66, 0x16u);
            }
            *__error() = v40;
            int generic_digest = cryptex_asset_create_generic_digest();
            if (generic_digest)
            {
              int v56 = generic_digest;
              int v57 = *(NSObject **)(a1 + 32);
              if (v57)
              {
                os_log_type_enabled(v57, OS_LOG_TYPE_ERROR);
                long long v58 = *v5;
                if (!*v5) {
                  long long v58 = "[anonymous]";
                }
                uint64_t v59 = *(void *)(*(void *)(v38 + 8) + 40);
                *(_DWORD *)long long v66 = 136446722;
                long long v67 = v58;
                __int16 v68 = 2080;
                uint64_t v69 = v59;
                __int16 v70 = 1024;
                int v71 = v56;
              }
              else
              {
                long long v64 = *v5;
                if (!*v5) {
                  long long v64 = "[anonymous]";
                }
                uint64_t v65 = *(void *)(*(void *)(v38 + 8) + 40);
                *(_DWORD *)long long v66 = 136446722;
                long long v67 = v64;
                __int16 v68 = 2080;
                uint64_t v69 = v65;
                __int16 v70 = 1024;
                int v71 = generic_digest;
              }
              size_t v34 = (char *)_os_log_send_and_compose_impl();
              CFIndex v35 = v56;
              int v36 = 644;
              goto LABEL_48;
            }
            cryptex_tss_set_object_dgst();
            if (*(void *)(*(void *)(a1 + 56) + 176) != MEMORY[0x263F8C3E8])
            {
              cryptex_tss_set_object_BOOL();
              cryptex_tss_set_object_BOOL();
              cryptex_tss_set_object_BOOL();
            }
          }
        }
        else
        {
          long long v45 = *(const char **)(a1 + 16);
          int v46 = *__error();
          long long v47 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            long long v48 = "[anonymous]";
            if (v45) {
              long long v48 = v45;
            }
            uint64_t v49 = *(void *)(*(void *)(MEMORY[0x263F8C428] + v37) + 40);
            *(_DWORD *)long long v66 = 136446466;
            long long v67 = v48;
            __int16 v68 = 2080;
            uint64_t v69 = v49;
            _os_log_impl(&dword_21DAF1000, v47, OS_LOG_TYPE_DEBUG, "%{public}s: no asset of type: %s", v66, 0x16u);
          }
          *__error() = v46;
        }
        v37 += 8;
        if (v37 == 96)
        {
          if (cryptex_core_get_asset()) {
            cryptex_tss_set_c411_from_file();
          }
          cryptex_tss_set_im4m_array();
          cryptex_tss_submit();
          CFErrorRef Error = 0;
          goto LABEL_71;
        }
      }
    }
    uint64_t v29 = *(void *)(a1 + 56);
    if (v29)
    {
      if (*(void *)(v29 + 216))
      {
        CFNumberRef v30 = CFNumberCreate(0, kCFNumberLongType, (const void *)(*(void *)(a1 + 272) + 32));
        CFNumberRef v31 = CFNumberCreate(0, kCFNumberLongLongType, (const void *)(*(void *)(a1 + 272) + 40));
        CFDataRef v32 = _AMAuthInstallCryptex1CopyUDID(v30, v31);
        CFDataGetBytePtr(v32);
        CFDataGetLength(v32);
        cryptex_tss_set_data();
        cryptex_tss_set_u32();
        cryptex_tss_set_u32();
        cryptex_tss_set_u32();
        cryptex_tss_set_u32();
        cryptex_tss_set_BOOL();
        cryptex_tss_set_dgst();
        cryptex_tss_set_u32();
        cryptex_tss_set_string();
        cryptex_tss_set_string();
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 216) + 65)) {
          cryptex_tss_set_BOOL();
        }
        else {
          _cryptex_signing_service_populate_ap_board_chip_sdom_cpro();
        }
        if (v32) {
          CFRelease(v32);
        }
        if (v31) {
          CFRelease(v31);
        }
        if (v30) {
          CFRelease(v30);
        }
        goto LABEL_50;
      }
      uint64_t v60 = *(const char **)(a1 + 16);
      int v52 = *__error();
      long long v53 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        uint64_t v61 = "[anonymous]";
        if (v60) {
          uint64_t v61 = v60;
        }
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = v61;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 22;
        long long v55 = "%{public}s: Invalid core Cryptex1 properties.: %{darwin.errno}d";
LABEL_87:
        _os_log_impl(&dword_21DAF1000, v53, OS_LOG_TYPE_ERROR, v55, buf, 0x12u);
      }
    }
    else
    {
      int v51 = *(const char **)(a1 + 16);
      int v52 = *__error();
      long long v53 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        long long v54 = "[anonymous]";
        if (v51) {
          long long v54 = v51;
        }
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = v54;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 22;
        long long v55 = "%{public}s: Invalid cryptex core.: %{darwin.errno}d";
        goto LABEL_87;
      }
    }
    *__error() = v52;
    uint64_t v62 = *(NSObject **)(a1 + 32);
    if (v62)
    {
      os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);
      long long v63 = *v5;
      if (!*v5) {
        long long v63 = "[anonymous]";
      }
    }
    else
    {
      long long v63 = *v5;
      if (!*v5) {
        long long v63 = "[anonymous]";
      }
    }
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = v63;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 22;
    size_t v34 = (char *)_os_log_send_and_compose_impl();
    int v36 = 606;
    CFIndex v35 = 22;
    goto LABEL_48;
  }
  int v13 = v12;
  int v14 = *(NSObject **)(a1 + 32);
  if (v14)
  {
    os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    uint64_t v15 = *v5;
    if (!*v5) {
      uint64_t v15 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v13;
  }
  else
  {
    uint64_t v33 = *v5;
    if (!*v5) {
      uint64_t v33 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = v33;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v12;
  }
  size_t v34 = (char *)_os_log_send_and_compose_impl();
  CFIndex v35 = v13;
  int v36 = 587;
LABEL_48:
  CFErrorRef Error = createError("cryptex_signing_service_sign", "signing_service.c", v36, "com.apple.security.cryptex.posix", v35, 0, v34);
  free(v34);
LABEL_71:
  MEMORY[0x223C118F0](v11);
  if (v11) {
    os_release(v11);
  }
  return Error;
}

CFIndex cryptex_signing_service_trust(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v62 = 0x3000000000;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v55 = 0u;
  uint64_t v58 = 0x3000000000;
  uint64_t v2 = img4_chip_instantiate();
  if (v2)
  {
    TopLevelPosixCFErrorRef Error = v2;
    uint64_t v4 = *(const char **)(a1 + 16);
    int v5 = *__error();
    uint64_t v6 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = "[anonymous]";
      if (v4) {
        int v7 = v4;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = TopLevelPosixError;
      _os_log_impl(&dword_21DAF1000, v6, OS_LOG_TYPE_ERROR, "%{public}s: failed to instantiate chip: %{darwin.errno}d", buf, 0x12u);
    }
    uint64_t v8 = __error();
    BOOL v9 = 0;
    goto LABEL_44;
  }
  *(void *)(a1 + 272) = a1 + 128;
  BOOL v9 = (void *)cryptex_tss_create();
  if (*(void *)(a1 + 72))
  {
    uint64_t v10 = img4_nonce_domain_copy_nonce();
    if (v10)
    {
      TopLevelPosixCFErrorRef Error = v10;
      uint64_t v11 = *(const char **)(a1 + 16);
      int v5 = *__error();
      int v12 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = "[anonymous]";
        if (v11) {
          int v13 = v11;
        }
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = TopLevelPosixError;
        int v14 = "%{public}s: failed to copy nonce: %{darwin.errno}d";
        uint64_t v15 = buf;
        int v16 = v12;
        uint32_t v17 = 18;
        goto LABEL_42;
      }
      goto LABEL_43;
    }
  }
  else
  {
    cryptex_tss_set_BOOL();
  }
  if (*(void *)(a1 + 48)) {
    cryptex_tss_set_url();
  }
  if (*(void *)(a1 + 120)) {
    cryptex_tss_set_data();
  }
  cryptex_tss_set_u32();
  cryptex_tss_set_u32();
  cryptex_tss_set_u32();
  cryptex_tss_set_u64();
  cryptex_tss_set_BOOL();
  cryptex_tss_set_BOOL();
  cryptex_tss_set_dgst();
  cryptex_tss_set_dgst();
  MEMORY[0x223C118F0](v9);
  uint64_t v18 = 0;
  char v19 = 1;
  while (1)
  {
    char v20 = v19;
    long long v21 = _image_specs[v18];
    uint64_t v22 = a1 + 40 * v18;
    long long v53 = 0u;
    long long v54 = 0u;
    memset(buf, 0, sizeof(buf));
    if ((*(_DWORD *)(v22 + 316) & 0x80000000) != 0)
    {
      uint64_t v30 = *(void *)(a1 + 40 * v18 + 320);
      CFNumberRef v31 = *(const char **)(a1 + 16);
      int v24 = *__error();
      CFDataRef v32 = *(NSObject **)(a1 + 32);
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG);
      if (!v30)
      {
        if (v33)
        {
          uint64_t v38 = *v21;
          uint64_t v39 = "[anonymous]";
          if (v31) {
            uint64_t v39 = v31;
          }
          *(_DWORD *)int v46 = 136446466;
          long long v47 = v39;
          __int16 v48 = 2080;
          uint64_t v49 = v38;
          _os_log_impl(&dword_21DAF1000, v32, OS_LOG_TYPE_DEBUG, "%{public}s: object not present: %s", v46, 0x16u);
        }
        *__error() = v24;
        goto LABEL_31;
      }
      xpc_object_t v27 = _cryptex_signing_service_read_buff;
      if (v33)
      {
        size_t v34 = *v21;
        CFIndex v35 = "[anonymous]";
        if (v31) {
          CFIndex v35 = v31;
        }
        *(_DWORD *)int v46 = 136446466;
        long long v47 = v35;
        __int16 v48 = 2080;
        uint64_t v49 = v34;
        _os_log_impl(&dword_21DAF1000, v32, OS_LOG_TYPE_DEBUG, "%{public}s: object is a buffer: %s", v46, 0x16u);
        xpc_object_t v27 = _cryptex_signing_service_read_buff;
      }
    }
    else
    {
      xpc_object_t v23 = *(const char **)(a1 + 16);
      int v24 = *__error();
      uint64_t v25 = *(NSObject **)(a1 + 32);
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
      xpc_object_t v27 = _cryptex_signing_service_read_fd;
      if (v26)
      {
        long long v28 = *v21;
        uint64_t v29 = "[anonymous]";
        if (v23) {
          uint64_t v29 = v23;
        }
        *(_DWORD *)int v46 = 136446466;
        long long v47 = v29;
        __int16 v48 = 2080;
        uint64_t v49 = v28;
        _os_log_impl(&dword_21DAF1000, v25, OS_LOG_TYPE_DEBUG, "%{public}s: object is a fd: %s", v46, 0x16u);
        xpc_object_t v27 = _cryptex_signing_service_read_fd;
      }
    }
    int v36 = v27;
    *__error() = v24;
    uint64_t v37 = v36(a1, (uint64_t **)(v22 + 288), (uint64_t)buf);
    if (v37) {
      break;
    }
    cryptex_tss_set_object_dgst();
    cryptex_tss_set_object_BOOL();
    cryptex_tss_set_object_BOOL();
    cryptex_tss_set_object_BOOL();
LABEL_31:
    char v19 = 0;
    uint64_t v18 = 1;
    if ((v20 & 1) == 0)
    {
      int v40 = (void **)ctx_new((void *)a1, 0x18uLL);
      cryptex_tss_submit();
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 280), 0xFFFFFFFFFFFFFFFFLL);
      TopLevelPosixCFErrorRef Error = _CFErrorGetTopLevelPosixError((CFIndex)v40[2]);
      goto LABEL_45;
    }
  }
  TopLevelPosixCFErrorRef Error = v37;
  long long v41 = *(const char **)(a1 + 16);
  int v5 = *__error();
  __int16 v42 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    uint64_t v43 = "[anonymous]";
    if (v41) {
      uint64_t v43 = v41;
    }
    int v44 = **(char ***)(v22 + 288);
    *(_DWORD *)int v46 = 136446722;
    long long v47 = v43;
    __int16 v48 = 2080;
    uint64_t v49 = v44;
    __int16 v50 = 1024;
    int v51 = TopLevelPosixError;
    int v14 = "%{public}s: failed to compute digest: %s: %{darwin.errno}d";
    uint64_t v15 = v46;
    int v16 = v42;
    uint32_t v17 = 28;
LABEL_42:
    _os_log_impl(&dword_21DAF1000, v16, OS_LOG_TYPE_ERROR, v14, v15, v17);
  }
LABEL_43:
  uint64_t v8 = __error();
LABEL_44:
  int v40 = 0;
  int *v8 = v5;
LABEL_45:
  MEMORY[0x223C118F0](v9);
  ctx_destroy(v40);
  if (v9) {
    os_release(v9);
  }
  return TopLevelPosixError;
}

uint64_t _cryptex_signing_service_read_fd(uint64_t a1, uint64_t **a2, uint64_t a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  memset(&v24, 0, sizeof(v24));
  MEMORY[0x270FA5388]();
  bzero((char *)&v22 - v6, v7);
  if (**(void **)(a1 + 80) >= 0x31uLL) {
    _cryptex_signing_service_read_fd_cold_1(&v23, buf);
  }
  if (fstat(*((_DWORD *)a2 + 7), &v24))
  {
    uint64_t v8 = *__error();
    BOOL v9 = *(const char **)(a1 + 16);
    int v10 = *__error();
    uint64_t v11 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = "[anonymous]";
      if (v9) {
        int v12 = v9;
      }
      uint64_t v13 = **a2;
      *(_DWORD *)buf = 136446722;
      BOOL v26 = v12;
      __int16 v27 = 2080;
      uint64_t v28 = v13;
      __int16 v29 = 1024;
      int v30 = v8;
      int v14 = "%{public}s: failed to stat object: %s: %{darwin.errno}d";
LABEL_7:
      _os_log_impl(&dword_21DAF1000, v11, OS_LOG_TYPE_ERROR, v14, buf, 0x1Cu);
    }
  }
  else
  {
    off_t st_size = v24.st_size;
    if (v24.st_size < 0) {
      _cryptex_signing_service_read_fd_cold_2();
    }
    int v16 = (uint64_t *)mmap(0, v24.st_size, 1, 1, *((_DWORD *)a2 + 7), 0);
    if (v16 != (uint64_t *)-1)
    {
      uint32_t v17 = v16;
      ccdigest_init();
      ccdigest_update();
      (*(void (**)(void))(*(void *)(a1 + 80) + 56))();
      uint64_t v8 = 0;
      *(void *)(a3 + 8) = **(void **)(a1 + 80);
      a2[1] = v17;
      a2[2] = (uint64_t *)st_size;
      *((_DWORD *)a2 + 6) = st_size;
      return v8;
    }
    uint64_t v8 = *__error();
    char v19 = *(const char **)(a1 + 16);
    int v10 = *__error();
    uint64_t v11 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      char v20 = "[anonymous]";
      if (v19) {
        char v20 = v19;
      }
      uint64_t v21 = **a2;
      *(_DWORD *)buf = 136446722;
      BOOL v26 = v20;
      __int16 v27 = 2080;
      uint64_t v28 = v21;
      __int16 v29 = 1024;
      int v30 = v8;
      int v14 = "%{public}s: failed to map asset into memory: %s: %{darwin.errno}d";
      goto LABEL_7;
    }
  }
  *__error() = v10;
  return v8;
}

uint64_t _cryptex_signing_service_read_buff(uint64_t a1, uint64_t **a2, uint64_t a3)
{
  v42[8] = *MEMORY[0x263EF8340];
  uint64_t v37 = 0;
  unsigned int v36 = 0;
  MEMORY[0x270FA5388]();
  bzero((char *)&v34 - v6, v7);
  uint64_t v8 = *((unsigned int *)a2 + 5);
  BOOL v9 = *(const char **)(a1 + 16);
  int v10 = *__error();
  uint64_t v11 = *(NSObject **)(a1 + 32);
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = "[anonymous]";
      uint64_t v13 = a2[2];
      if (v9) {
        int v12 = v9;
      }
      *(_DWORD *)buf = 136446978;
      uint64_t v39 = v12;
      __int16 v40 = 2048;
      *(void *)long long v41 = v13;
      *(_WORD *)&v41[8] = 1024;
      LODWORD(v42[0]) = -1;
      WORD2(v42[0]) = 1024;
      *(_DWORD *)((char *)v42 + 6) = 34;
      _os_log_impl(&dword_21DAF1000, v11, OS_LOG_TYPE_ERROR, "%{public}s: payload too large: actual = %lu, expected <= %u: %{darwin.errno}d", buf, 0x22u);
    }
    *__error() = v10;
    uint64_t v14 = 34;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = "[anonymous]";
      if (v9) {
        uint64_t v15 = v9;
      }
      uint64_t v16 = (*a2)[2];
      uint32_t v17 = a2[2];
      *(_DWORD *)buf = 136446722;
      uint64_t v39 = v15;
      __int16 v40 = 2080;
      *(void *)long long v41 = v16;
      *(_WORD *)&v41[8] = 2048;
      v42[0] = v17;
      _os_log_impl(&dword_21DAF1000, v11, OS_LOG_TYPE_DEBUG, "%{public}s: wrapping object: 4cc = %s, length = %lu", buf, 0x20u);
    }
    *__error() = v10;
    int v18 = Img4EncodeCreatePayload((const char *)(*a2)[2], "1", a2[4], *((_DWORD *)a2 + 6), 0, 0, &v37, &v36);
    uint64_t v14 = 22;
    switch(v18)
    {
      case 'd':
        char v19 = (uint64_t *)mmap(0, v36, 3, 4098, -1, 0);
        if (v19 == (uint64_t *)-1)
        {
          uint64_t v14 = *__error();
          int v30 = *(const char **)(a1 + 16);
          int v23 = *__error();
          uint64_t v31 = *(NSObject **)(a1 + 32);
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          CFDataRef v32 = "[anonymous]";
          if (v30) {
            CFDataRef v32 = v30;
          }
          uint64_t v33 = **a2;
          *(_DWORD *)buf = 136446722;
          uint64_t v39 = v32;
          __int16 v40 = 2080;
          *(void *)long long v41 = v33;
          *(_WORD *)&v41[8] = 1024;
          LODWORD(v42[0]) = v14;
          BOOL v26 = "%{public}s: failed to map anonymous buffer for object: %s: %{darwin.errno}d";
          __int16 v27 = v31;
          uint32_t v28 = 28;
          goto LABEL_23;
        }
        char v20 = v19;
        memcpy(v19, v37, v36);
        ccdigest_init();
        if (**(void **)(a1 + 80) >= 0x31uLL) {
          _cryptex_signing_service_read_fd_cold_1(&v35, buf);
        }
        ccdigest_update();
        (*(void (**)(void))(*(void *)(a1 + 80) + 56))();
        uint64_t v14 = 0;
        *(void *)(a3 + 8) = **(void **)(a1 + 80);
        uint64_t v21 = (uint64_t *)v36;
        a2[1] = v20;
        a2[2] = v21;
        *((_DWORD *)a2 + 6) = v21;
        break;
      case 'e':
        goto LABEL_19;
      case 'f':
        uint64_t v14 = 12;
        goto LABEL_19;
      case 'h':
        uint64_t v14 = 14;
        goto LABEL_19;
      case 'i':
        uint64_t v14 = 78;
        goto LABEL_19;
      default:
        uint64_t v14 = 104;
LABEL_19:
        uint64_t v22 = *(const char **)(a1 + 16);
        int v23 = *__error();
        stat v24 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          uint64_t v25 = "[anonymous]";
          *(_DWORD *)buf = 136446722;
          if (v22) {
            uint64_t v25 = v22;
          }
          uint64_t v39 = v25;
          __int16 v40 = 1024;
          *(_DWORD *)long long v41 = v18;
          *(_WORD *)&v41[4] = 1024;
          *(_DWORD *)&v41[6] = v14;
          BOOL v26 = "%{public}s: failed to wrap object: %d: %{darwin.errno}d";
          __int16 v27 = v24;
          uint32_t v28 = 24;
LABEL_23:
          _os_log_impl(&dword_21DAF1000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
        }
LABEL_24:
        *__error() = v23;
        break;
    }
  }
  free(v37);
  return v14;
}

intptr_t _cryptex_signing_service_trust_continue(uint64_t a1, uint64_t a2, const void *a3, uint64_t *a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v5 = *a4;
  if (a3)
  {
    if (*(void *)(v5 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(v5 + 32), OS_LOG_TYPE_ERROR);
      size_t v7 = *(const char **)(v5 + 16);
      if (!v7) {
        size_t v7 = "[anonymous]";
      }
      *(_DWORD *)__int16 v40 = 136446210;
      *(void *)&uint8_t v40[4] = v7;
    }
    else
    {
      BOOL v9 = *(const char **)(v5 + 16);
      if (!v9) {
        BOOL v9 = "[anonymous]";
      }
      *(_DWORD *)__int16 v40 = 136446210;
      *(void *)&uint8_t v40[4] = v9;
    }
    int v10 = (char *)_os_log_send_and_compose_impl();
    uint64_t v11 = "com.apple.security.cryptex";
    int v12 = 280;
    CFIndex v13 = 5;
    uint64_t v14 = a3;
    goto LABEL_38;
  }
  if (!MEMORY[0x263F8C4E8])
  {
    if (*(void *)(v5 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(v5 + 32), OS_LOG_TYPE_ERROR);
      uint64_t v8 = *(const char **)(v5 + 16);
      if (!v8) {
        uint64_t v8 = "[anonymous]";
      }
    }
    else
    {
      uint64_t v8 = *(const char **)(v5 + 16);
      if (!v8) {
        uint64_t v8 = "[anonymous]";
      }
    }
    *(_DWORD *)__int16 v40 = 136446466;
    *(void *)&uint8_t v40[4] = v8;
    *(_WORD *)&v40[12] = 1024;
    *(_DWORD *)&v40[14] = 78;
    int v10 = (char *)_os_log_send_and_compose_impl();
    uint64_t v11 = "com.apple.security.cryptex.posix";
    int v12 = 287;
    CFIndex v13 = 78;
    goto LABEL_37;
  }
  uint64_t v15 = 0;
  char v16 = 1;
  while (1)
  {
    uint32_t v17 = (void *)(v5 + 40 * v15);
    uint64_t v18 = v17[36];
    *(void *)__int16 v40 = 0;
    *(void *)&v40[8] = v17[37];
    char v19 = v16;
    *(void *)&v40[16] = v17[38];
    uint64_t v41 = 0;
    if (v18)
    {
      if (*(void *)(v18 + 32)) {
        break;
      }
    }
LABEL_24:
    char v16 = 0;
    uint64_t v15 = 1;
    if ((v19 & 1) == 0)
    {
      CFErrorRef Error = 0;
      goto LABEL_39;
    }
  }
  char v20 = (uint64_t **)(v17 + 36);
  int v21 = img4_runtime_execute_object();
  if (!v21)
  {
    uint64_t v22 = *(const char **)(v5 + 16);
    int v23 = *__error();
    stat v24 = *(NSObject **)(v5 + 32);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = "[anonymous]";
      if (v22) {
        uint64_t v25 = v22;
      }
      uint64_t v26 = **v20;
      *(_DWORD *)buf = 136446466;
      uint64_t v35 = v25;
      __int16 v36 = 2080;
      uint64_t v37 = v26;
      _os_log_impl(&dword_21DAF1000, v24, OS_LOG_TYPE_DEBUG, "%{public}s: executed object: %s", buf, 0x16u);
    }
    *__error() = v23;
    goto LABEL_24;
  }
  int v28 = v21;
  if (*(void *)(v5 + 32))
  {
    os_log_type_enabled(*(os_log_t *)(v5 + 32), OS_LOG_TYPE_ERROR);
    __int16 v29 = *(const char **)(v5 + 16);
    if (!v29) {
      __int16 v29 = "[anonymous]";
    }
    uint64_t v30 = **v20;
    *(_DWORD *)buf = 136446722;
    uint64_t v35 = v29;
    __int16 v36 = 2080;
    uint64_t v37 = v30;
    __int16 v38 = 1024;
    int v39 = v28;
  }
  else
  {
    uint64_t v31 = *(const char **)(v5 + 16);
    if (!v31) {
      uint64_t v31 = "[anonymous]";
    }
    uint64_t v32 = **v20;
    *(_DWORD *)buf = 136446722;
    uint64_t v35 = v31;
    __int16 v36 = 2080;
    uint64_t v37 = v32;
    __int16 v38 = 1024;
    int v39 = v21;
  }
  int v10 = (char *)_os_log_send_and_compose_impl();
  CFIndex v13 = v28;
  uint64_t v11 = "com.apple.security.cryptex.posix";
  int v12 = 319;
LABEL_37:
  uint64_t v14 = 0;
LABEL_38:
  CFErrorRef Error = createError("_cryptex_signing_service_trust_continue", "signing_service.c", v12, v11, v13, v14, v10);
  free(v10);
LABEL_39:
  a4[2] = (uint64_t)Error;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v5 + 280));
}

uint64_t _cryptex_signing_service_populate_ap_board_chip_sdom_cpro()
{
  cryptex_tss_set_u32();
  cryptex_tss_set_u32();
  cryptex_tss_set_u32();

  return cryptex_tss_set_BOOL();
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_1_0(void *a1, _OWORD *a2)
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

uint64_t OUTLINED_FUNCTION_3()
{
  return _os_log_send_and_compose_impl();
}

BOOL OUTLINED_FUNCTION_4()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t _hdi_copy_device_nodes(NSObject *a1, io_object_t object, const char **a3, void *a4, void *a5)
{
  kern_return_t ParentEntry;
  kern_return_t v28;
  int v29;
  char v30;
  uint64_t v31;
  CFTypeRef v32;
  CFTypeRef v33;
  CFTypeID v34;
  CFTypeRef v35;
  const void *v36;
  CFStringRef v37;
  void *v38;
  int v39;
  int v40;
  const char *v42;
  CFTypeRef v43;
  const char **v44;
  void *v45;
  CFAllocatorRef v46;
  CFTypeRef v47;
  io_object_t objecta;
  io_registry_entry_t entry;
  uint64_t v50;
  uint8_t buf[80];
  uint64_t v52;

  io_registry_entry_t v8 = object;
  int v52 = *MEMORY[0x263EF8340];
  if (IOObjectRetain(object)) {
    _hdi_copy_device_nodes_cold_5(&v50, buf);
  }
  entry = v8;
  if (IOObjectRetain(v8)) {
    _hdi_copy_device_nodes_cold_5(&v50, buf);
  }
  objecta = v8;
  if (_IORegistryExchangeWithFirstChildOfClass(&objecta, "AppleAPFSContainerScheme")
    || _IORegistryExchangeWithFirstChildOfClass(&objecta, "AppleAPFSMedia"))
  {
    int v10 = "hfs";
  }
  else
  {
    int v10 = "hfs";
    if (!_IORegistryExchangeWithFirstChildOfClass(&objecta, "AppleAPFSContainer")
      && !_IORegistryExchangeWithFirstChildOfClass(&objecta, "AppleAPFSVolume"))
    {
      int v10 = "apfs";
      io_registry_entry_t v8 = objecta;
    }
  }
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v8, @"BSD Name", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!CFProperty || (v13 = CFProperty, CFTypeID v14 = CFGetTypeID(CFProperty), v14 != CFStringGetTypeID())) {
    _hdi_copy_device_nodes_cold_1();
  }
  uint64_t v42 = v10;
  int v44 = a3;
  long long v45 = a5;
  int v15 = *__error();
  if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v13;
    _os_log_impl(&dword_21DAF1000, a1, OS_LOG_TYPE_DEBUG, "subdevice node = %@", buf, 0xCu);
  }
  uint64_t v43 = v13;
  char v16 = __error();
  long long v47 = 0;
  uint32_t v17 = (const void **)MEMORY[0x263EFFB40];
  *char v16 = v15;
  uint64_t v18 = *v17;
  CFStringRef v19 = @"Whole";
  int v46 = v11;
  do
  {
    CFTypeRef v20 = IORegistryEntryCreateCFProperty(entry, v19, v11, 0);
    int v21 = v20;
    if (v20)
    {
      CFTypeID v22 = CFGetTypeID(v20);
      if (v22 == CFBooleanGetTypeID()) {
        int v23 = v21;
      }
      else {
        int v23 = 0;
      }
    }
    else
    {
      int v23 = 0;
    }
    int v24 = *__error();
    BOOL v25 = os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG);
    if (v23 == v18)
    {
      if (v25)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DAF1000, a1, OS_LOG_TYPE_DEBUG, "found whole disk node", buf, 2u);
      }
      *__error() = v24;
      uint64_t v32 = IORegistryEntryCreateCFProperty(entry, @"BSD Name", v11, 0);
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = CFGetTypeID(v32);
        if (v34 == CFStringGetTypeID()) {
          uint64_t v35 = v33;
        }
        else {
          uint64_t v35 = 0;
        }
        if (!a4) {
LABEL_57:
        }
          _hdi_copy_device_nodes_cold_2();
      }
      else
      {
        uint64_t v35 = 0;
        if (!a4) {
          goto LABEL_57;
        }
      }
      __int16 v40 = *__error();
      if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v35;
        _os_log_impl(&dword_21DAF1000, a1, OS_LOG_TYPE_DEBUG, "devnode = %@", buf, 0xCu);
      }
      long long v47 = v35;
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      *__error() = v40;
      io_registry_entry_t v26 = entry;
    }
    else
    {
      if (v25)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DAF1000, a1, OS_LOG_TYPE_DEBUG, "not whole disk node", buf, 2u);
      }
      *__error() = v24;
      io_registry_entry_t v26 = entry;
      ParentEntry = IORegistryEntryGetParentEntry(entry, "IOService", &entry);
      if (ParentEntry)
      {
        int v28 = ParentEntry;
        if (ParentEntry == -536870208)
        {
          __int16 v29 = *__error();
          if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21DAF1000, a1, OS_LOG_TYPE_DEBUG, "found root node, stopping", buf, 2u);
          }
          uint64_t v30 = 0;
          *__error() = v29;
          uint64_t v31 = 2;
        }
        else
        {
          __int16 v36 = v18;
          uint64_t v37 = v19;
          __int16 v38 = a4;
          int v39 = *__error();
          if (os_log_type_enabled(a1, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v28;
            _os_log_impl(&dword_21DAF1000, a1, OS_LOG_TYPE_ERROR, "IORegistryEntryGetParentEntry: %{mach.errno}x", buf, 8u);
          }
          uint64_t v30 = 0;
          *__error() = v39;
          uint64_t v31 = 83;
          a4 = v38;
          CFStringRef v19 = v37;
          uint64_t v18 = v36;
          CFAllocatorRef v11 = v46;
        }
      }
      else
      {
        uint64_t v31 = 35;
        uint64_t v30 = 1;
      }
    }
    if (v21) {
      CFRelease(v21);
    }
    if (v26 && IOObjectRelease(v26)) {
      _hdi_copy_device_nodes_cold_3(&v50, buf);
    }
  }
  while ((v30 & 1) != 0);
  if (v23 == v18)
  {
    if (v44) {
      *int v44 = v42;
    }
    *a4 = v47;
    *long long v45 = v43;
  }
  if (objecta && IOObjectRelease(objecta)) {
    _hdi_copy_device_nodes_cold_3(&v50, buf);
  }
  return v31;
}

uint64_t hdi_copy_mounted(void *a1, void *a2, NSObject *a3)
{
  kern_return_t v19;
  kern_return_t v20;
  int v21;
  io_registry_entry_t v22;
  io_object_t v23;
  CFStringRef v24;
  int v25;
  int v26;
  CFTypeRef v27;
  size_t v28;
  const char *f_mntfromname;
  char *v31;
  int v32;
  NSObject *v33;
  unsigned int v34;
  void *v35;
  uint64_t v36;
  CFTypeRef cf;
  CFTypeRef v38;
  io_iterator_t notification;
  _OWORD v40[16];
  char v41[256];
  void v42[32];
  uint8_t buf[4];
  CFTypeRef v44;
  __int16 v45;
  CFTypeRef v46;
  uint64_t v47;

  long long v47 = *MEMORY[0x263EF8340];
  notification = 0;
  unsigned int v6 = getfsstat(0, 0, 2);
  if ((v6 & 0x80000000) != 0)
  {
    uint64_t v11 = *__error();
    int v12 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = v11;
      _os_log_impl(&dword_21DAF1000, a3, OS_LOG_TYPE_ERROR, "getfsstat: %{darwin.errno}d", buf, 8u);
    }
    CFTypeRef v13 = __error();
    BOOL v9 = 0;
    goto LABEL_18;
  }
  unsigned int v7 = v6;
  size_t v8 = v6;
  if (_dispatch_is_multithreaded())
  {
    BOOL v9 = (statfs *)malloc_type_calloc(v8, 0x878uLL, 0x1B044E25uLL);
    if (!v9)
    {
      do
      {
        __os_temporary_resource_shortage();
        int v10 = (statfs *)malloc_type_calloc(v8, 0x878uLL, 0x1B044E25uLL);
      }
      while (!v10);
      BOOL v9 = v10;
    }
  }
  else
  {
    BOOL v9 = (statfs *)malloc_type_calloc(v8, 0x878uLL, 0x61D5536CuLL);
    if (!v9) {
      hdi_copy_mounted_cold_8(v42, buf);
    }
  }
  if (getfsstat(v9, 2168 * v7, 2) < 0)
  {
    uint64_t v11 = *__error();
    int v12 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = v11;
      _os_log_impl(&dword_21DAF1000, a3, OS_LOG_TYPE_ERROR, "getfsstat: %{darwin.errno}d", buf, 8u);
    }
    CFTypeRef v13 = __error();
LABEL_18:
    int *v13 = v12;
    goto LABEL_61;
  }
  if (_dispatch_is_multithreaded())
  {
    CFTypeID v14 = (char *)malloc_type_calloc(v8, 0xDFEuLL, 0x1B044E25uLL);
    if (!v14)
    {
      do
      {
        __os_temporary_resource_shortage();
        int v15 = (char *)malloc_type_calloc(v8, 0xDFEuLL, 0x1B044E25uLL);
      }
      while (!v15);
      CFTypeID v14 = v15;
    }
  }
  else
  {
    CFTypeID v14 = (char *)malloc_type_calloc(v8, 0xDFEuLL, 0x61D5536CuLL);
    if (!v14) {
      hdi_copy_mounted_cold_7(v42, buf);
    }
  }
  IONotificationPortRef v16 = IONotificationPortCreate(0);
  if (!v16) {
    hdi_copy_mounted_cold_2();
  }
  uint32_t v17 = v16;
  CFDictionaryRef v18 = IOServiceMatching("IOMedia");
  CFStringRef v19 = IOServiceAddMatchingNotification(v17, "IOServiceMatched", v18, 0, 0, &notification);
  if (!v19)
  {
    uint64_t v35 = a1;
    uint64_t v34 = v7;
    __int16 v36 = 0;
    while (1)
    {
      CFTypeID v22 = IOIteratorNext(notification);
      if (!v22)
      {
        uint64_t v11 = 0;
        *uint64_t v35 = v14;
        *a2 = v36;
        goto LABEL_60;
      }
      int v23 = v22;
      cf = 0;
      __int16 v38 = 0;
      memset(v42, 0, 255);
      memset(v41, 0, 255);
      memset(v40, 0, 255);
      int v24 = (const __CFString *)IORegistryEntrySearchCFProperty(v22, "IOService", @"hdik-unique-identifier", 0, 3u);
      if (!v24
        || IOObjectConformsTo(v23, "AppleAPFSVolume")
        || IOObjectConformsTo(v23, "AppleAPFSMedia")
        || IOObjectConformsTo(v23, "AppleAPFSContainerScheme")
        || IOObjectConformsTo(v23, "AppleAPFSContainer"))
      {
        goto LABEL_38;
      }
      BOOL v25 = *__error();
      if (os_log_type_enabled(a3, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        int v44 = v24;
        _os_log_impl(&dword_21DAF1000, a3, OS_LOG_TYPE_DEBUG, "found property: %@", buf, 0xCu);
      }
      *__error() = v25;
      io_registry_entry_t v26 = _hdi_copy_device_nodes(a3, v23, 0, &v38, &cf);
      uint64_t v32 = *__error();
      if (v26) {
        break;
      }
      if (os_log_type_enabled(a3, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        int v44 = v38;
        long long v45 = 2112;
        int v46 = cf;
        _os_log_impl(&dword_21DAF1000, a3, OS_LOG_TYPE_DEBUG, "found dev nodes: dev = %@, sub = %@", buf, 0x16u);
      }
      *__error() = v32;
      if (!_CFStringGetUTF8String(v24, (char *)v42, 255)) {
        hdi_copy_mounted_cold_4();
      }
      if (!_CFStringGetUTF8String((const __CFString *)v38, v41, 255)) {
        hdi_copy_mounted_cold_4();
      }
      __int16 v27 = cf;
      if (!_CFStringGetUTF8String((const __CFString *)cf, (char *)v40, 255)) {
        hdi_copy_mounted_cold_4();
      }
      if (v34)
      {
        uint64_t v33 = a3;
        int v28 = v8;
        f_mntfromname = v9->f_mntfromname;
        while (1)
        {
          bzero(buf, 0x400uLL);
          snprintf((char *)buf, 0x400uLL, "%s%s", "/dev/", (const char *)v40);
          if (!strcmp(f_mntfromname, (const char *)buf)) {
            break;
          }
          f_mntfromname += 2168;
          if (!--v28)
          {
            a3 = v33;
            goto LABEL_38;
          }
        }
        a3 = v33;
        uint64_t v31 = &v14[3582 * v36];
        __strlcpy_chk();
        snprintf(v31 + 510, 0x400uLL, "%s%s", "/dev/", v41);
        snprintf(v31 + 1534, 0x400uLL, "%s%s", "/dev/", (const char *)v40);
        strlcpy(v31 + 2558, f_mntfromname - 1024, 0x400uLL);
        ++v36;
        goto LABEL_38;
      }
LABEL_39:
      if (v27) {
        CFRelease(v27);
      }
      if (v38) {
        CFRelease(v38);
      }
      if (v24) {
        CFRelease(v24);
      }
      if (IOObjectRelease(v23)) {
        _hdi_copy_device_nodes_cold_3(v42, buf);
      }
    }
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = v26;
      _os_log_impl(&dword_21DAF1000, a3, OS_LOG_TYPE_ERROR, "failed to get device nodes: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v32;
LABEL_38:
    __int16 v27 = cf;
    goto LABEL_39;
  }
  CFTypeRef v20 = v19;
  *__error() = 83;
  int v21 = *__error();
  if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v44) = v20;
    _os_log_impl(&dword_21DAF1000, a3, OS_LOG_TYPE_ERROR, "IOServiceAddMatchingNotification: %{mach.errno}x", buf, 8u);
  }
  *__error() = v21;
  uint64_t v11 = 0xFFFFFFFFLL;
LABEL_60:
  IONotificationPortDestroy(v17);
LABEL_61:
  if (notification && IOObjectRelease(notification)) {
    _hdi_copy_device_nodes_cold_3(v42, buf);
  }
  free(v9);
  return v11;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return _os_log_send_and_compose_impl();
}

BOOL OUTLINED_FUNCTION_5()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_8()
{
  return _os_crash_msg();
}

void sub_21DAFB0BC(_Unwind_Exception *a1)
{
}

uint64_t cryptex_event_mask_ext_to_int(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v18[0] = &unk_26CE6E6C8;
  v18[1] = &unk_26CE6E6E0;
  v19[0] = &unk_26CE6E6C8;
  v19[1] = &unk_26CE6E6E0;
  v18[2] = &unk_26CE6E6F8;
  v18[3] = &unk_26CE6E710;
  v19[2] = &unk_26CE6E6F8;
  v19[3] = &unk_26CE6E710;
  v18[4] = &unk_26CE6E728;
  v19[4] = &unk_26CE6E728;
  id obj = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:5];
  uint64_t v2 = [obj countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(obj);
        }
        unsigned int v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v7 unsignedLongLongValue] & a1) != 0)
        {
          v16[0] = &unk_26CE6E6C8;
          v16[1] = &unk_26CE6E6E0;
          v17[0] = &unk_26CE6E6C8;
          v17[1] = &unk_26CE6E6E0;
          v16[2] = &unk_26CE6E6F8;
          v16[3] = &unk_26CE6E710;
          v17[2] = &unk_26CE6E6F8;
          v17[3] = &unk_26CE6E710;
          v16[4] = &unk_26CE6E728;
          v17[4] = &unk_26CE6E728;
          size_t v8 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:5];
          BOOL v9 = [v8 objectForKeyedSubscript:v7];
          v4 |= [v9 unsignedLongLongValue];
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_21DAFBA58(_Unwind_Exception *a1)
{
}

uint64_t cryptex_event_type_int_to_ext(uint64_t a1)
{
  v12[5] = *MEMORY[0x263EF8340];
  v11[0] = &unk_26CE6E6C8;
  v11[1] = &unk_26CE6E6E0;
  v12[0] = &unk_26CE6E6C8;
  v12[1] = &unk_26CE6E6E0;
  v11[2] = &unk_26CE6E6F8;
  v11[3] = &unk_26CE6E710;
  v12[2] = &unk_26CE6E6F8;
  v12[3] = &unk_26CE6E710;
  v11[4] = &unk_26CE6E728;
  v12[4] = &unk_26CE6E728;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:5];
  uint64_t v3 = [NSNumber numberWithUnsignedLongLong:a1];
  uint64_t v4 = [v2 allKeysForObject:v3];

  if ((unint64_t)[v4 count] >= 2) {
    cryptex_event_type_int_to_ext_cold_1(&v9, v10);
  }
  uint64_t v5 = [v4 firstObject];
  unsigned int v6 = v5;
  if (v5) {
    uint64_t v7 = [v5 unsignedLongLongValue];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

CryptexEventSubscriber *cryptex_event_subscribe_with_name(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, CFErrorRef *a6)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  if (!a1)
  {
    os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    LOWORD(v28) = 0;
    CFTypeRef v20 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("cryptex_event_subscribe_with_name", "event.m", 275, "com.apple.security.cryptex", 3, 0, v20);
LABEL_16:
    CFErrorRef v24 = Error;
    free(v20);
    long long v15 = 0;
LABEL_17:
    BOOL v25 = v24 != 0;
    if (!a6) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  long long v13 = [CryptexEventSubscriber alloc];
  long long v14 = [NSString stringWithUTF8String:a1];
  long long v15 = [(CryptexEventSubscriber *)v13 initWithFlags:a3 name:v14];

  if (!v15)
  {
    CFTypeID v22 = [0 log];

    if (v22)
    {
      int v23 = [0 log];
      os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      LOWORD(v28) = 0;
      CFTypeRef v20 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      LOWORD(v28) = 0;
      CFTypeRef v20 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("cryptex_event_subscribe_with_name", "event.m", 283, "com.apple.security.cryptex", 3, 0, v20);
    goto LABEL_16;
  }
  IONotificationPortRef v16 = [(CryptexEventSubscriber *)v15 registerForEvents:a2 onQueue:v11 withCompletion:v12];
  if (!v16)
  {
    CFErrorRef v24 = 0;
    goto LABEL_17;
  }
  uint32_t v17 = [(CryptexEventSubscriber *)v15 log];

  if (v17)
  {
    CFDictionaryRef v18 = [(CryptexEventSubscriber *)v15 log];
    os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    int v28 = 136315650;
    uint64_t v29 = a1;
    __int16 v30 = 2048;
    uint64_t v31 = a2;
    __int16 v32 = 2112;
    uint64_t v33 = v16;
    LODWORD(v27) = 32;
    CFStringRef v19 = (char *)_os_log_send_and_compose_impl();
  }
  else
  {
    int v28 = 136315650;
    uint64_t v29 = a1;
    __int16 v30 = 2048;
    uint64_t v31 = a2;
    __int16 v32 = 2112;
    uint64_t v33 = v16;
    LODWORD(v27) = 32;
    CFStringRef v19 = (char *)_os_log_send_and_compose_impl();
  }
  CFErrorRef v24 = createError("cryptex_event_subscribe_with_name", "event.m", 293, "com.apple.security.cryptex", 3, v16, v19);
  free(v19);

  if (v24)
  {
    [(CryptexEventSubscriber *)v15 cancel];

    long long v15 = 0;
    BOOL v25 = 1;
    if (a6)
    {
LABEL_18:
      if (v25)
      {
        CFErrorRef v24 = v24;
        *a6 = v24;
      }
    }
  }
LABEL_20:

  return v15;
}

void sub_21DAFC258(_Unwind_Exception *a1)
{
}

uint64_t cryptex_msm_get_string(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 1:
      a1 += 8;
      break;
    case 2:
      a1 += 16;
      break;
    case 3:
      a1 += 24;
      break;
    case 4:
      a1 += 32;
      break;
    default:
      return *(void *)a1;
  }
  return *(void *)a1;
}

uint64_t cryptex_msm_get_int(uint64_t a1)
{
  return *(int *)(a1 + 40);
}

void cryptex_msm_destroy(void ***a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    free(*v1);
    free(v1[1]);
    free(v1[2]);
    free(v1[3]);
    free(v1[4]);
    free(v1);
    *a1 = 0;
  }
}

void cryptex_msm_array_destroy(void ***a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = a2;
    uint64_t v4 = a1;
    do
    {
      uint64_t v5 = *v4++;
      unsigned int v6 = v5;
      cryptex_msm_destroy(&v6);
      --v3;
    }
    while (v3);
  }

  free(a1);
}

uint64_t cryptex_install_4MSM(_DWORD *a1, char a2, char ***a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2 & 1;
  unsigned int v6 = (void *)cryptex_attr_create();
  cryptex_attr_set_persistence(v6, 2 * v5);
  cryptex_attr_set_nonce_persistence(v6, v5);
  bzero(v10, 0xE10uLL);
  if ((*a1 & 0x80000000) != 0 || (a1[1] & 0x80000000) != 0)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 22;
  }
  else
  {
    uint64_t v7 = (void *)cryptex_core_create();
    cryptex_asset_new_borrowed();
    cryptex_core_set_asset();
    cryptex_asset_new_borrowed();
    cryptex_core_set_asset();
    if ((a1[2] & 0x80000000) == 0)
    {
      cryptex_asset_new_borrowed();
      cryptex_core_set_asset();
    }
    if ((a1[3] & 0x80000000) == 0)
    {
      cryptex_asset_new_borrowed();
      cryptex_core_set_asset();
    }
    uint64_t v8 = _cryptex_install_core((uint64_t)v7, (uint64_t)v6);
    if (!v8) {
      *a3 = _cryptex_msm_new_from_info(v10);
    }
  }
  if (v6) {
    os_release(v6);
  }
  if (v7) {
    os_release(v7);
  }
  return v8;
}

char **_cryptex_msm_new_from_info(const char *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = (char **)malloc_type_calloc(1uLL, 0x30uLL, 0x61D5536CuLL);
  if (!v2) {
    _cryptex_msm_new_from_info_cold_1(&v11, v12);
  }
  uint64_t v3 = v2;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      uint64_t v4 = strdup(a1 + 8);
      if (v4) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    uint64_t v4 = strdup(a1 + 8);
    if (!v4) {
      _cryptex_msm_new_from_info_cold_2(a1 + 8);
    }
  }
  *uint64_t v3 = v4;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      uint64_t v5 = strdup(a1 + 263);
      if (v5) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    uint64_t v5 = strdup(a1 + 263);
    if (!v5) {
      _cryptex_msm_new_from_info_cold_2(a1 + 263);
    }
  }
  v3[1] = v5;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      unsigned int v6 = strdup(a1 + 518);
      if (v6) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    unsigned int v6 = strdup(a1 + 518);
    if (!v6) {
      _cryptex_msm_new_from_info_cold_2(a1 + 518);
    }
  }
  v3[2] = v6;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      uint64_t v7 = strdup(a1 + 1542);
      if (v7) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    uint64_t v7 = strdup(a1 + 1542);
    if (!v7) {
      _cryptex_msm_new_from_info_cold_2(a1 + 1542);
    }
  }
  v3[3] = v7;
  uint64_t v8 = a1 + 2566;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      uint64_t v9 = strdup(v8);
      if (v9) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    uint64_t v9 = strdup(v8);
    if (!v9) {
      _cryptex_msm_new_from_info_cold_2(v8);
    }
  }
  v3[4] = v9;
  return v3;
}

uint64_t cryptex_uninstall_4MSM()
{
  return _cryptex_uninstall_by_name();
}

uint64_t cryptex_copy_list_4MSM(uint64_t a1, void *a2, size_t *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  size_t v19 = 0;
  CFTypeRef v20 = 0;
  uint64_t v5 = _cryptex_copy_connected_actor(_g, MEMORY[0x263F8C430]);
  if (_cryptex_copy_list(&v20, &v19))
  {
    size_t v21 = 0;
    CFTypeID v22 = 0;
    uint64_t v6 = _cryptex_copy_list_lossy(&v22, &v21);
    if (!v6)
    {
      size_t v7 = v21;
      if (_dispatch_is_multithreaded())
      {
        uint64_t v8 = malloc_type_calloc(v7, 8uLL, 0x1B044E25uLL);
        if (!v8)
        {
          do
          {
            __os_temporary_resource_shortage();
            uint64_t v9 = malloc_type_calloc(v7, 8uLL, 0x1B044E25uLL);
          }
          while (!v9);
          uint64_t v8 = v9;
        }
      }
      else
      {
        uint64_t v8 = malloc_type_calloc(v7, 8uLL, 0x61D5536CuLL);
        if (!v8) {
          cryptex_copy_list_4MSM_cold_1(&v23, v24);
        }
      }
      if (v21)
      {
        uint64_t v16 = 0;
        for (size_t i = 0; i < v21; ++i)
        {
          v8[i] = _cryptex_msm_new_from_info((const char *)v22 + v16);
          v16 += 3600;
        }
      }
      free(v22);
      uint64_t v6 = 0;
      *a3 = v21;
      *a2 = v8;
    }
  }
  else
  {
    size_t v10 = v19;
    if (_dispatch_is_multithreaded())
    {
      uint64_t v11 = malloc_type_calloc(v10, 8uLL, 0x1B044E25uLL);
      if (!v11)
      {
        do
        {
          __os_temporary_resource_shortage();
          id v12 = malloc_type_calloc(v10, 8uLL, 0x1B044E25uLL);
        }
        while (!v12);
        uint64_t v11 = v12;
      }
    }
    else
    {
      uint64_t v11 = malloc_type_calloc(v10, 8uLL, 0x61D5536CuLL);
      if (!v11) {
        cryptex_copy_list_4MSM_cold_1(&v23, v24);
      }
    }
    size_t v13 = v19;
    if (v19)
    {
      uint64_t v14 = 0;
      for (size_t j = 0; j < v19; ++j)
      {
        v11[j] = _cryptex_msm_new_from_info((const char *)v20 + v14);
        size_t v13 = v19;
        v14 += 3600;
      }
    }
    uint64_t v6 = 0;
    *a2 = v11;
    *a3 = v13;
  }
  free(v20);
  if (v5) {
    os_release(v5);
  }
  return v6;
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_3_1()
{
  void *v0 = 0;
  double result = 0.0;
  _OWORD *v1 = 0u;
  v1[1] = 0u;
  v1[2] = 0u;
  v1[3] = 0u;
  v1[4] = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return _os_crash_msg();
}

double OUTLINED_FUNCTION_6(void *a1, _OWORD *a2)
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

size_t OUTLINED_FUNCTION_8_0(const char *__s)
{
  return strlen(__s);
}

uint64_t session_create_from_core(uint64_t a1)
{
  uint64_t v2 = _session_alloc();
  object_proto_init(v2 + 16, (int)"com.apple.security.libcryptex", "cryptex.session");
  *(void *)(v2 + 88) = dispatch_queue_create("com.apple.security.libcryptex.session_handler", 0);
  *(void *)(v2 + 96) = 0;
  *(void *)(v2 + 80) = 0;
  *(void *)(v2 + 48) = 0;
  *(void *)(v2 + 56) = 0;
  *(void *)(v2 + 40) = a1;
  *(_DWORD *)(v2 + 104) = 0;
  return v2;
}

uint64_t daemon_for_session_subsystem(_DWORD *a1)
{
  uint64_t actor = cryptex_subsystem_create_actor();
  int v3 = cryptex_actor_connect();
  *a1 = v3;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      daemon_for_session_subsystem_cold_1();
    }
    return 0;
  }
  return actor;
}

void session_activate_endpoint(uint64_t a1)
{
  uint64_t v2 = xpc_connection_create_from_endpoint(*(xpc_endpoint_t *)(*(void *)(a1 + 40) + 88));
  *(void *)(a1 + 80) = v2;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = __session_activate_endpoint_block_invoke;
  handler[3] = &__block_descriptor_tmp_10;
  handler[4] = a1;
  xpc_connection_set_event_handler(v2, handler);
  xpc_connection_set_target_queue(*(xpc_connection_t *)(a1 + 80), *(dispatch_queue_t *)(a1 + 88));
  xpc_connection_activate(*(xpc_connection_t *)(a1 + 80));
}

void __session_activate_endpoint_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x223C12420](a2);
  if (v4 == MEMORY[0x263EF8708])
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "object");
    int64_t int64 = xpc_dictionary_get_int64(a2, "event");
    *(void *)(*(void *)(a1 + 32) + 64) = xpc_dictionary_get_int64(a2, "reason");
    uint64_t int64 = xpc_dictionary_get_uint64(a2, "code");
    uint64_t v10 = *(void *)(a1 + 32);
    *(void *)(v10 + 72) = uint64;
    if (int64 == 32)
    {
      int v11 = xpc_dictionary_get_int64(a2, "error_event");
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)(v10 + 104) = v11;
    }
    if (value)
    {
      uint64_t v12 = cryptex_session_core_create_from_xpc();
      uint64_t v10 = *(void *)(a1 + 32);
      if (v12)
      {
        size_t v13 = (void *)v12;
        if (*(void *)(v10 + 40)) {
          cryptex_session_core_merge();
        }
        os_release(v13);
        uint64_t v10 = *(void *)(a1 + 32);
      }
    }
    uint64_t v14 = *(void *)(v10 + 48);
    if (v14)
    {
      uint64_t v15 = *(void *)(v10 + 56);
      if (v15 == 64 || (v15 & int64) >= 1)
      {
        uint32_t v17 = *(NSObject **)(v10 + 96);
        if (v17)
        {
          v19[0] = MEMORY[0x263EF8330];
          v19[1] = 0x40000000;
          v19[2] = __session_activate_endpoint_block_invoke_2;
          v19[3] = &__block_descriptor_tmp;
          v19[4] = v10;
          void v19[5] = int64;
          dispatch_sync(v17, v19);
        }
        else
        {
          CFDictionaryRef v18 = *(void (**)(void))(v14 + 16);
          v18();
        }
      }
    }
  }
  else if (v4 == MEMORY[0x263EF8720] && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
    *(_DWORD *)buf = 134218242;
    uint64_t v21 = v5;
    __int16 v22 = 2080;
    uint64_t v23 = string;
    _os_log_impl(&dword_21DAF1000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Connection %p error: %s", buf, 0x16u);
  }
}

uint64_t __session_activate_endpoint_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16))();
}

char *_CFStringCopyUTF8String(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  if (MaximumSizeForEncoding <= -2) {
    _CFStringCopyUTF8String_cold_1();
  }
  CFIndex v4 = MaximumSizeForEncoding + 1;
  uint64_t v5 = (char *)malloc_type_calloc(1uLL, MaximumSizeForEncoding + 1, 0x7906B74DuLL);
  if (v5)
  {
    uint64_t v6 = v5;
    int CString = CFStringGetCString(a1, v5, v4, 0x8000100u);
    if (CString) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = 0;
    }
    if (CString) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = v6;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  free(v5);
  return v8;
}

CFStringRef _CFStringCreateFromUTF8String(char *cStr)
{
  return CFStringCreateWithCString(0, cStr, 0x8000100u);
}

char *_CFStringGetUTF8String(const __CFString *a1, char *a2, CFIndex a3)
{
  if (a3 < 0) {
    _CFStringGetUTF8String_cold_1();
  }
  if (CFStringGetCString(a1, a2, a3, 0x8000100u)) {
    return a2;
  }
  else {
    return 0;
  }
}

CFMutableDictionaryRef _CFDictionaryCreateMutableForCFTypes()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  CFMutableDictionaryRef result = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!result) {
    _CFDictionaryCreateMutableForCFTypes_cold_1(&v1, v2);
  }
  return result;
}

CFErrorRef createError(const char *a1, const char *a2, int a3, const char *a4, CFIndex a5, const void *a6, char *cStr)
{
  int valuePtr = a3;
  CFStringRef v12 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  CFStringRef v13 = CFStringCreateWithCString(0, a1, 0x8000100u);
  CFStringRef v14 = CFStringCreateWithCString(0, a4, 0x8000100u);
  CFStringRef v15 = CFStringCreateWithCString(0, a2, 0x8000100u);
  CFNumberRef v16 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  MutableForCFTypes = _CFDictionaryCreateMutableForCFTypes();
  CFDictionarySetValue(MutableForCFTypes, (const void *)*MEMORY[0x263EFFC70], v12);
  if (os_variant_allows_internal_security_policies())
  {
    CFDictionarySetValue(MutableForCFTypes, @"FunctionName", v13);
    CFDictionarySetValue(MutableForCFTypes, @"FileName", v15);
    CFDictionarySetValue(MutableForCFTypes, @"LineNumber", v16);
  }
  if (a6) {
    CFDictionarySetValue(MutableForCFTypes, (const void *)*MEMORY[0x263EFFC88], a6);
  }
  CFErrorRef v18 = CFErrorCreate(0, v14, a5, MutableForCFTypes);
  CFRelease(MutableForCFTypes);
  CFRelease(v12);
  CFRelease(v13);
  CFRelease(v14);
  CFRelease(v15);
  CFRelease(v16);
  return v18;
}

CFIndex _CFErrorGetTopLevelPosixError(CFIndex result)
{
  if (result)
  {
    uint64_t v1 = (__CFError *)result;
    CFTypeID v2 = CFGetTypeID((CFTypeRef)result);
    if (v2 != CFErrorGetTypeID()) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v3 = (const void *)*MEMORY[0x263EFFC88];
    Value = v1;
    while (1)
    {
      CFErrorDomain Domain = CFErrorGetDomain(Value);
      if (CFEqual(Domain, @"com.apple.security.cryptex.posix")) {
        break;
      }
      CFDictionaryRef v6 = CFErrorCopyUserInfo(Value);
      if (!v6) {
        break;
      }
      CFDictionaryRef v7 = v6;
      Value = (__CFError *)CFDictionaryGetValue(v6, v3);
      CFRelease(v7);
      if (!Value) {
        goto LABEL_10;
      }
    }
    CFErrorDomain v8 = CFErrorGetDomain(Value);
    if (CFEqual(v8, @"com.apple.security.cryptex.posix")) {
      return CFErrorGetCode(Value);
    }
LABEL_10:
    CFErrorDomain v9 = CFErrorGetDomain(v1);
    if (CFEqual(v9, @"com.apple.security.cryptex") && (unsigned int Code = CFErrorGetCode(v1), Code <= 0x24)) {
      return dword_21DB19D80[Code];
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

CFDictionaryRef _CFErrorHasDomainAndCode(CFDictionaryRef result, const void *a2, uint64_t a3)
{
  if (result)
  {
    Value = result;
    CFTypeID v6 = CFGetTypeID(result);
    CFTypeID TypeID = CFErrorGetTypeID();
    CFMutableDictionaryRef result = 0;
    if (a2)
    {
      if (v6 == TypeID)
      {
        CFErrorDomain v8 = (const void *)*MEMORY[0x263EFFC88];
        while (1)
        {
          CFErrorDomain Domain = CFErrorGetDomain(Value);
          if (CFEqual(Domain, a2))
          {
            if (CFErrorGetCode(Value) == a3) {
              break;
            }
          }
          CFMutableDictionaryRef result = CFErrorCopyUserInfo(Value);
          if (!result) {
            return result;
          }
          uint64_t v10 = result;
          Value = (__CFError *)CFDictionaryGetValue(result, v8);
          CFRelease(v10);
          if (!Value) {
            return 0;
          }
        }
        return (CFDictionaryRef)1;
      }
    }
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_1_2(void *a1, _OWORD *a2)
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

uint64_t OUTLINED_FUNCTION_4_0()
{
  return _os_crash_msg();
}

uint64_t _cryptex_alloc()
{
  objc_opt_class();
  uint64_t result = _os_object_alloc();
  if (!result) {
    _cryptex_alloc_cold_1();
  }
  return result;
}

uint64_t _cryptex_attr_alloc()
{
  objc_opt_class();
  uint64_t result = _os_object_alloc();
  if (!result) {
    _cryptex_attr_alloc_cold_1();
  }
  return result;
}

uint64_t _cryptex_bundle_alloc()
{
  objc_opt_class();
  uint64_t result = _os_object_alloc();
  if (!result) {
    _cryptex_bundle_alloc_cold_1();
  }
  return result;
}

uint64_t _cryptex_su_preboot_bundle_alloc()
{
  objc_opt_class();
  uint64_t result = _os_object_alloc();
  if (!result) {
    _cryptex_su_preboot_bundle_alloc_cold_1();
  }
  return result;
}

uint64_t _cryptex_signing_service_alloc()
{
  objc_opt_class();
  uint64_t result = _os_object_alloc();
  if (!result) {
    _cryptex_signing_service_alloc_cold_1();
  }
  return result;
}

uint64_t _session_alloc()
{
  objc_opt_class();
  uint64_t result = _os_object_alloc();
  if (!result) {
    _session_alloc_cold_1();
  }
  return result;
}

void _cryptex_set_actor(void **a1)
{
  uint64_t v2 = _g + 24 * *a1[6];
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 16));
  id v3 = *(id *)(v2 + 24);
  *(void *)(v2 + 24) = a1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 16));
  if (v3)
  {
  }
}

void sub_21DAFD8AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (a10) {

  }
  _Unwind_Resume(exception_object);
}

void *_cryptex_copy_connected_actor(uint64_t a1, void *a2)
{
  CFIndex v4 = (os_unfair_lock_s *)(a1 + 24 * *a2 + 16);
  os_unfair_lock_lock(v4);
  uint64_t v5 = _cryptex_copy_connected_actor_locked(a1, a2);
  os_unfair_lock_unlock(v4);
  return v5;
}

void *_cryptex_copy_connected_actor_locked(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 24 * *a2;
  uint64_t v5 = *(void **)(v2 + 24);
  CFIndex v4 = (void *)(v2 + 24);
  uint64_t actor = v5;
  if (!v5)
  {
    uint64_t actor = (void *)cryptex_subsystem_create_actor();
    void *v4 = actor;
    int v7 = cryptex_actor_connect();
    CFErrorDomain v8 = (const char *)actor[2];
    int v9 = *__error();
    uint64_t v10 = actor[4];
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = "[anonymous]";
        uint64_t v12 = a2[2];
        if (v8) {
          int v11 = v8;
        }
        int v20 = 136446722;
        uint64_t v21 = v11;
        __int16 v22 = 2080;
        uint64_t v23 = v12;
        __int16 v24 = 1024;
        int v25 = v7;
        CFStringRef v13 = "%{public}s: connect: %s: %{darwin.errno}d";
        CFStringRef v14 = v10;
        os_log_type_t v15 = OS_LOG_TYPE_ERROR;
        uint32_t v16 = 28;
LABEL_11:
        _os_log_impl(&dword_21DAF1000, v14, v15, v13, (uint8_t *)&v20, v16);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint32_t v17 = "[anonymous]";
      uint64_t v18 = a2[2];
      if (v8) {
        uint32_t v17 = v8;
      }
      int v20 = 136446466;
      uint64_t v21 = v17;
      __int16 v22 = 2080;
      uint64_t v23 = v18;
      CFStringRef v13 = "%{public}s: connect: %s: success";
      CFStringRef v14 = v10;
      os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
      uint32_t v16 = 22;
      goto LABEL_11;
    }
    *__error() = v9;
  }
  return actor;
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_2_3(void *a1, _OWORD *a2)
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

void _cryptex_bundle_dealloc(void *a1)
{
  close_drop_optional_np();
  close_drop_optional_np();
  uint64_t v2 = (void *)a1[10];
  if (v2) {
    os_release(v2);
  }
  id v3 = (void **)a1[8];
  CFStringRef v14 = v3;
  if (v3)
  {
    do
    {
      CFIndex v4 = (void **)a1[8];
      uint64_t v5 = (void **)(a1 + 8);
      while (v4 != v3)
      {
        uint64_t v5 = v4;
        CFIndex v4 = (void **)*v4;
      }
      CFTypeID v6 = (void **)*v3;
      *uint64_t v5 = *v3;
      *id v3 = (void *)-1;
      _cryptex_list_elm_destroy(&v14);
      CFStringRef v14 = v6;
      id v3 = v6;
    }
    while (v6);
  }
  CFErrorDomain v8 = (void ***)(a1 + 9);
  int v7 = (void **)a1[9];
  CFStringRef v13 = v7;
  if (v7)
  {
    do
    {
      int v9 = *v8;
      uint64_t v10 = (void ***)(a1 + 9);
      if (*v8 != v7)
      {
        do
        {
          int v11 = v9;
          int v9 = (void **)v9[2];
        }
        while (v9 != v7);
        uint64_t v10 = (void ***)(v11 + 2);
      }
      uint64_t v12 = (void **)v7[2];
      NSObject *v10 = v12;
      v7[2] = (void *)-1;
      _cryptex_bundle_asset_destroy(&v13);
      CFStringRef v13 = v12;
      int v7 = v12;
    }
    while (v12);
  }

  object_proto_destroy((uint64_t)(a1 + 2));
}

void _cryptex_list_elm_destroy(void ***a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    os_release(v1[1]);
    free(v1);
    *a1 = 0;
  }
}

void _cryptex_bundle_asset_destroy(void ***a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    cryptex_asset_destroy();
    free(*v1);
    free(v1[1]);
    free(v1);
    *a1 = 0;
  }
}

uint64_t _cryptex_bundle_new_asset_from_object(int a1, uint64_t a2, void *a3, uint64_t *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  xpc_object_t v7 = _xpc_plist_value_copy((uint64_t)&_path, a3);
  if (v7)
  {
    CFErrorDomain v8 = v7;
    string_ptr = xpc_string_get_string_ptr(v7);
    int v10 = *__error();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
    {
      int v11 = *(const char **)(a2 + 40);
      *(_DWORD *)buf = 136315394;
      uint64_t v21 = v11;
      __int16 v22 = 2080;
      uint64_t v23 = string_ptr;
      _os_log_impl(&dword_21DAF1000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "%s => %s", buf, 0x16u);
    }
    *__error() = v10;
    int v12 = openat(a1, string_ptr, 0);
    int v18 = v12;
    if (v12 < 0)
    {
      int v14 = v12;
      uint64_t v13 = *__error();
      int v16 = *__error();
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v21) = v13;
        _os_log_impl(&dword_21DAF1000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "openat: %{darwin.errno}d", buf, 8u);
      }
      *__error() = v16;
    }
    else
    {
      uint64_t v13 = 0;
      *a4 = cryptex_asset_new();
      int v14 = v18;
    }
    if (v14 != -1 && close(v14) == -1) {
      _cryptex_bundle_new_asset_from_object_cold_1(&v19, buf);
    }
    os_release(v8);
  }
  else
  {
    int v15 = *__error();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v21 = "Path";
      __int16 v22 = 1024;
      LODWORD(v23) = 212;
      _os_log_impl(&dword_21DAF1000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "missing property: %s: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v15;
    return 212;
  }
  return v13;
}

void *_cryptex_list_find_cryptex_elm(void *a1, uint64_t a2, const char *a3, int a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  CFTypeID v6 = (void *)*a1;
  if (*a1)
  {
    do
    {
      uint64_t v7 = v6[1];
      CFErrorDomain v8 = _cryptex_identity_copy_description(v7 + 56);
      int v9 = *(const char **)(v7 + 16);
      int v10 = *__error();
      int v11 = *(NSObject **)(v7 + 32);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        int v12 = "[anonymous]";
        if (v9) {
          int v12 = v9;
        }
        uint64_t v26 = v12;
        __int16 v27 = 2080;
        int v28 = v8;
        _os_log_impl(&dword_21DAF1000, v11, OS_LOG_TYPE_DEBUG, "%{public}s: cryptex identity: %s", buf, 0x16u);
      }
      *__error() = v10;
      if (_cryptex_identity_matches_host(v7 + 56, a2))
      {
        if (a3)
        {
          if (!strcmp(a3, *(const char **)(v7 + 16))) {
            goto LABEL_47;
          }
        }
        else if (*(unsigned char *)(v7 + 40))
        {
LABEL_47:
          free(v8);
          return v6;
        }
      }
      free(v8);
      CFTypeID v6 = (void *)*v6;
    }
    while (v6);
  }
  if (a4)
  {
    uint64_t v13 = (void *)*a1;
    if (*a1)
    {
      CFTypeID v6 = 0;
      while (1)
      {
        uint64_t v14 = v13[1];
        BOOL v15 = _cryptex_identity_matches_host(v14 + 56, a2);
        if (a3)
        {
          BOOL v16 = strcmp(a3, *(const char **)(v14 + 16)) == 0;
          if (a2) {
            goto LABEL_19;
          }
        }
        else
        {
          BOOL v16 = 0;
          if (a2)
          {
LABEL_19:
            if (*(_DWORD *)(v14 + 56))
            {
              unint64_t v17 = *(void *)(v14 + 64);
              if ((v17 & 2) != 0) {
                int v18 = (v17 >> 2) & 1;
              }
              else {
                int v18 = 0;
              }
            }
            else
            {
              int v18 = 0;
            }
            if (*(_DWORD *)a2) {
              BOOL v19 = (*(void *)(a2 + 8) & 2) == 0 || (*(void *)(a2 + 8) & 4) == 0;
            }
            else {
              BOOL v19 = 1;
            }
            if ((_cryptex_identity_matches_host(v14 + 56, a2)
               || ((v19 | v18 ^ 1) & 1) == 0
               && (*(unsigned char *)(v14 + 64) & 1) != 0
               && _cryptex_identity_equal_cryptex1((unsigned int *)a2, (unsigned int *)(v14 + 56))
               && _cryptex_identity_equal_cryptex1_chipid((unsigned int *)a2, (unsigned int *)(v14 + 56))
               || (v18 & 1) == 0 && (*(unsigned char *)(v14 + 64) & 1) != 0)
              && ((*(unsigned __int8 *)(v14 + 40) | v16) & 1) != 0)
            {
              int v20 = *__error();
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21DAF1000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "found a generic cryptex match", buf, 2u);
              }
              *__error() = v20;
              int v21 = v15 || v16;
              if (!v6) {
                int v21 = 1;
              }
              if (v21) {
                CFTypeID v6 = v13;
              }
            }
          }
        }
        uint64_t v13 = (void *)*v13;
        if (!v13) {
          return v6;
        }
      }
    }
  }
  return 0;
}

BOOL _cryptex_identity_matches_host(uint64_t a1, uint64_t a2)
{
  BOOL result = 0;
  if (a1)
  {
    if (a2)
    {
      BOOL result = _cryptex_identity_equal_device(a2, a1);
      if (result)
      {
        if (!*(_DWORD *)a2 || !*(_DWORD *)a1) {
          return 1;
        }
        if ((*(unsigned char *)(a2 + 8) & 2) != 0 && (*(unsigned char *)(a1 + 8) & 2) != 0)
        {
          BOOL result = _cryptex_identity_equal_cryptex1((unsigned int *)a2, (unsigned int *)a1);
          if (!result) {
            return result;
          }
          if (!*(_DWORD *)a2) {
            return 1;
          }
        }
        if (!*(_DWORD *)a1) {
          return 1;
        }
        if ((*(unsigned char *)(a2 + 8) & 4) == 0) {
          return 1;
        }
        if ((*(unsigned char *)(a1 + 8) & 4) == 0) {
          return 1;
        }
        BOOL result = _cryptex_identity_equal_cryptex1_chipid((unsigned int *)a2, (unsigned int *)a1);
        if (result) {
          return 1;
        }
      }
    }
  }
  return result;
}

char **_cryptex_bundle_asset_new(uint64_t a1, const char *a2, const char *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = (char **)malloc_type_calloc(1uLL, 0x20uLL, 0x61D5536CuLL);
  if (!v5) {
    _cryptex_bundle_asset_new_cold_1(&v10, v11);
  }
  CFTypeID v6 = v5;
  v5[3] = (char *)cryptex_asset_copy();
  *((_DWORD *)v6[3] + 4) = dup_np();
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      uint64_t v7 = strdup(a2);
      if (v7) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    uint64_t v7 = strdup(a2);
    if (!v7) {
      _cryptex_bundle_asset_new_cold_2(a2, &v10, v11);
    }
  }
  void *v6 = v7;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      CFErrorDomain v8 = strdup(a3);
      if (v8) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    CFErrorDomain v8 = strdup(a3);
    if (!v8) {
      _cryptex_bundle_asset_new_cold_2(a3, &v10, v11);
    }
  }
  v6[1] = v8;
  return v6;
}

void *_cryptex_list_elm_new(void *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = malloc_type_calloc(1uLL, 0x10uLL, 0x61D5536CuLL);
  if (!v2) {
    _cryptex_list_elm_new_cold_1(&v5, v6);
  }
  id v3 = v2;
  v2[1] = os_retain(a1);
  return v3;
}

void *cryptex_bundle_create(uint64_t a1)
{
  uint64_t v2 = (void *)_cryptex_bundle_alloc();
  _OWORD v2[5] = a1;
  v2[6] = -1;
  v2[8] = 0;
  v2[9] = 0;
  object_proto_init((uint64_t)(v2 + 2), (int)"com.apple.security.libcryptex", "bundle");
  return v2;
}

void *cryptex_bundle_create_with_directory(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)_cryptex_bundle_alloc();
  v3[5] = a2;
  v3[6] = -1;
  v3[8] = 0;
  v3[9] = 0;
  object_proto_init((uint64_t)(v3 + 2), (int)"com.apple.security.libcryptex", "bundle");
  *((_DWORD *)v3 + 12) = claimfd_np();
  return v3;
}

uint64_t cryptex_bundle_copy_cryptex2(uint64_t a1, _OWORD *a2, const char *a3, void **a4, CFTypeRef *a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v10 = _cryptex_bundle_init(a1);
  if (v10)
  {
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      int v11 = *(const char **)(a1 + 16);
      if (!v11) {
        int v11 = "[anonymous]";
      }
      *(_DWORD *)uint64_t v24 = 136446210;
      *(void *)&v24[4] = v11;
    }
    else
    {
      BOOL v16 = *(const char **)(a1 + 16);
      if (!v16) {
        BOOL v16 = "[anonymous]";
      }
      *(_DWORD *)uint64_t v24 = 136446210;
      *(void *)&v24[4] = v16;
    }
    unint64_t v17 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("cryptex_bundle_copy_cryptex2", "bundle.c", 1332, "com.apple.security.cryptex", 6, v10, v17);
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = _cryptex_identity_copy_description((uint64_t)a2);
    long long v13 = a2[1];
    *(_OWORD *)uint64_t v24 = *a2;
    *(_OWORD *)&v24[16] = v13;
    long long v25 = a2[2];
    cryptex_elm = _cryptex_list_find_cryptex_elm((void *)(a1 + 64), (uint64_t)v24, a3, 1);
    if (cryptex_elm)
    {
      *a4 = os_retain((void *)cryptex_elm[1]);
      free(v12);
      return 1;
    }
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      int v20 = *(const char **)(a1 + 16);
      if (!v20) {
        int v20 = "[anonymous]";
      }
      int v21 = "default";
      *(_DWORD *)uint64_t v24 = 136446722;
      *(void *)&v24[4] = v20;
      *(_WORD *)&v24[12] = 2080;
      *(void *)&v24[14] = v12;
      if (a3) {
        int v21 = a3;
      }
      *(_WORD *)&v24[22] = 2080;
      *(void *)&v24[24] = v21;
    }
    else
    {
      __int16 v22 = *(const char **)(a1 + 16);
      if (!v22) {
        __int16 v22 = "[anonymous]";
      }
      uint64_t v23 = "default";
      *(_DWORD *)uint64_t v24 = 136446722;
      *(void *)&v24[4] = v22;
      *(_WORD *)&v24[12] = 2080;
      if (a3) {
        uint64_t v23 = a3;
      }
      *(void *)&v24[14] = v12;
      *(_WORD *)&v24[22] = 2080;
      *(void *)&v24[24] = v23;
    }
    unint64_t v17 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("cryptex_bundle_copy_cryptex2", "bundle.c", 1345, "com.apple.security.cryptex", 8, 0, v17);
  }
  free(v17);
  if (a5 && Error)
  {
    *a5 = CFRetain(Error);
    free(v12);
  }
  else
  {
    free(v12);
    if (!Error)
    {
      uint64_t v15 = 1;
      if (!v10) {
        return v15;
      }
      goto LABEL_17;
    }
  }
  CFRelease(Error);
  uint64_t v15 = 0;
  if (v10) {
LABEL_17:
  }
    CFRelease(v10);
  return v15;
}

void *_cryptex_bundle_init(uint64_t a1)
{
  uint64_t v217 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 80)) {
    return 0;
  }
  if ((*(_DWORD *)(a1 + 48) & 0x80000000) == 0)
  {
    id v3 = (int *)(a1 + 52);
    CFErrorRef v4 = _cryptex_bundle_open(a1, (uint64_t)&_cryptex_bundle_object_restore, 0, 0, (_DWORD *)(a1 + 52));
    if (v4)
    {
      CFErrorRef Error = v4;
      if (*(void *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        CFTypeID v6 = "[anonymous]";
        if (*(void *)(a1 + 16)) {
          CFTypeID v6 = *(const char **)(a1 + 16);
        }
      }
      else
      {
        CFTypeID v6 = "[anonymous]";
        if (*(void *)(a1 + 16)) {
          CFTypeID v6 = *(const char **)(a1 + 16);
        }
      }
      v213[0].st_dev = 136446466;
      *(void *)&v213[0].st_mode = v6;
      WORD2(v213[0].st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = (__darwin_ino64_t)"Restore";
      uint64_t v12 = (char *)_os_log_send_and_compose_impl();
      int v13 = 894;
      goto LABEL_350;
    }
    LODWORD(v212) = -1;
    uint64_t v216 = 0;
    memset(v215, 0, sizeof(v215));
    CFErrorRef v9 = _cryptex_bundle_open(a1, (uint64_t)&_cryptex_bundle_object_manifest, 0, 0, &v212);
    uint64_t v10 = objc_autoreleaseReturnValue;
    if (v9)
    {
      if (*(void *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        int v11 = "[anonymous]";
        if (*(void *)(a1 + 16)) {
          int v11 = *(const char **)(a1 + 16);
        }
        v213[0].st_dev = 136446210;
        *(void *)&v213[0].st_mode = v11;
      }
      else
      {
        uint64_t v23 = "[anonymous]";
        if (*(void *)(a1 + 16)) {
          uint64_t v23 = *(const char **)(a1 + 16);
        }
        v213[0].st_dev = 136446210;
        *(void *)&v213[0].st_mode = v23;
      }
      uint64_t v24 = (char *)_os_log_send_and_compose_impl();
      CFErrorRef Error = createError("_cryptex_bundle_read_manifest", "bundle.c", 89, "com.apple.security.cryptex", 6, v9, v24);
      free(v24);
      int v15 = v212;
    }
    else
    {
      BOOL v14 = os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_DEBUG);
      int v15 = v212;
      if (v14)
      {
        bzero(v213, 0x400uLL);
        if (!realpath_np())
        {
          BOOL v16 = *(const char **)(a1 + 16);
          int v17 = *__error();
          int v18 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            BOOL v19 = "[anonymous]";
            if (v16) {
              BOOL v19 = v16;
            }
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = v19;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = v213;
            _os_log_impl(&dword_21DAF1000, v18, OS_LOG_TYPE_DEBUG, "%{public}s: reading manifest: %s", buf, 0x16u);
          }
          *__error() = v17;
          uint64_t v10 = objc_autoreleaseReturnValue;
        }
      }
      int file = _read_file(v15, v215);
      if (file)
      {
        int v21 = file;
        if (*(void *)(a1 + 32))
        {
          os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
          __int16 v22 = *(const char **)(a1 + 16);
          if (!v22) {
            __int16 v22 = "[anonymous]";
          }
          v213[0].st_dev = 136446466;
          *(void *)&v213[0].st_mode = v22;
          WORD2(v213[0].st_ino) = 1024;
          *(_DWORD *)((char *)&v213[0].st_ino + 6) = v21;
        }
        else
        {
          __int16 v27 = *(const char **)(a1 + 16);
          if (!v27) {
            __int16 v27 = "[anonymous]";
          }
          v213[0].st_dev = 136446466;
          *(void *)&v213[0].st_mode = v27;
          WORD2(v213[0].st_ino) = 1024;
          *(_DWORD *)((char *)&v213[0].st_ino + 6) = file;
        }
        int v28 = (char *)_os_log_send_and_compose_impl();
        CFErrorRef Error = createError("_cryptex_bundle_read_manifest", "bundle.c", 105, "com.apple.security.cryptex.posix", v21, 0, v28);
        free(v28);
        uint64_t v10 = objc_autoreleaseReturnValue;
      }
      else
      {
        long long v25 = (void *)xpc_create_from_plist();
        if (v25)
        {
          uint64_t v26 = v25;
          *(void *)(a1 + 80) = xpc_retain(v25);
          buff_destroy(v215);
          os_release(v26);
          CFErrorRef Error = 0;
          goto LABEL_45;
        }
        if (*(void *)(a1 + 32))
        {
          os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
          v193 = *(const char **)(a1 + 16);
          if (!v193) {
            v193 = "[anonymous]";
          }
        }
        else
        {
          v193 = *(const char **)(a1 + 16);
          if (!v193) {
            v193 = "[anonymous]";
          }
        }
        v213[0].st_dev = 136446466;
        *(void *)&v213[0].st_mode = v193;
        WORD2(v213[0].st_ino) = 1024;
        *(_DWORD *)((char *)&v213[0].st_ino + 6) = 212;
        v198 = (char *)_os_log_send_and_compose_impl();
        CFErrorRef Error = createError("_cryptex_bundle_read_manifest", "bundle.c", 112, "com.apple.security.cryptex.posix", 212, 0, v198);
        free(v198);
      }
    }
    buff_destroy(v215);
LABEL_45:
    if (v15 != -1 && close(v15) == -1) {
      _cryptex_bundle_new_asset_from_object_cold_1(v215, v213);
    }
    if (v9) {
      CFRelease(v9);
    }
    if (Error)
    {
      if (*(void *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        uint64_t v29 = "[anonymous]";
        if (*(void *)(a1 + 16)) {
          uint64_t v29 = *(const char **)(a1 + 16);
        }
        v213[0].st_dev = 136446210;
        *(void *)&v213[0].st_mode = v29;
      }
      else
      {
        v191 = "[anonymous]";
        if (*(void *)(a1 + 16)) {
          v191 = *(const char **)(a1 + 16);
        }
        v213[0].st_dev = 136446210;
        *(void *)&v213[0].st_mode = v191;
      }
      uint64_t v12 = (char *)_os_log_send_and_compose_impl();
      int v13 = 903;
      goto LABEL_350;
    }
    xpc_object_t v30 = _xpc_plist_value_copy((uint64_t)&_build_identities, *(void **)(a1 + 80));
    if (!v30)
    {
      if (*(void *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        v192 = *(const char **)(a1 + 16);
        if (!v192) {
          v192 = "[anonymous]";
        }
      }
      else
      {
        v192 = *(const char **)(a1 + 16);
        if (!v192) {
          v192 = "[anonymous]";
        }
      }
      v213[0].st_dev = 136446466;
      *(void *)&v213[0].st_mode = v192;
      WORD2(v213[0].st_ino) = 1024;
      *(_DWORD *)((char *)&v213[0].st_ino + 6) = 212;
      v194 = (char *)_os_log_send_and_compose_impl();
      CFErrorRef Error = createError("_cryptex_bundle_find_cryptexes", "bundle.c", 739, "com.apple.security.cryptex.posix", 212, 0, v194);
      free(v194);
LABEL_341:
      if (!Error) {
        return 0;
      }
      if (*(void *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        v195 = "[anonymous]";
        if (*(void *)(a1 + 16)) {
          v195 = *(const char **)(a1 + 16);
        }
        v213[0].st_dev = *((void *)v10 + 419);
        *(void *)&v213[0].st_mode = v195;
      }
      else
      {
        v196 = "[anonymous]";
        if (*(void *)(a1 + 16)) {
          v196 = *(const char **)(a1 + 16);
        }
        v213[0].st_dev = *((void *)v10 + 419);
        *(void *)&v213[0].st_mode = v196;
      }
      uint64_t v12 = (char *)_os_log_send_and_compose_impl();
      int v13 = 912;
LABEL_350:
      empty = createError("_cryptex_bundle_init", "bundle.c", v13, "com.apple.security.cryptex", 6, Error, v12);
      free(v12);
      CFRelease(Error);
      return empty;
    }
    uint64_t v31 = v30;
    if (xpc_array_get_count(v30))
    {
      CFErrorRef Error = 0;
      size_t v32 = 0;
      CFErrorRef xarray = 0;
      v204 = (void *)(a1 + 64);
      v208 = v31;
      while (1)
      {
        *(void *)buf = 1;
        memset(&buf[8], 0, 40);
        xpc_object_t v33 = _xpc_plist_value_copy_at(_build_identity, v31, v32);
        uint64_t v34 = v33;
        if (!v33)
        {
          if (*(void *)(a1 + 32))
          {
            os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
            __int16 v38 = *(const char **)(a1 + 16);
            v213[0].st_dev = 136446466;
            if (!v38) {
              __int16 v38 = "[anonymous]";
            }
            *(void *)&v213[0].st_mode = v38;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = 212;
          }
          else
          {
            long long v53 = *(const char **)(a1 + 16);
            if (!v53) {
              long long v53 = "[anonymous]";
            }
            v213[0].st_dev = 136446466;
            *(void *)&v213[0].st_mode = v53;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = 212;
          }
          int v51 = (char *)_os_log_send_and_compose_impl();
          int v54 = 760;
          CFIndex v55 = 212;
LABEL_82:
          CFErrorRef Error = createError("_cryptex_bundle_find_cryptexes", "bundle.c", v54, "com.apple.security.cryptex.posix", v55, 0, v51);
          v210 = 0;
          xpc_object_t object = 0;
          int v52 = 0;
LABEL_83:
          free(v51);
          free(v52);
          int v56 = 2;
          goto LABEL_84;
        }
        int v35 = _cryptex_identity_init_from_dict(v33, *(NSObject **)(a1 + 32), (uint64_t)buf, 1);
        v209 = v34;
        if (v35)
        {
          int v36 = v35;
          if (*(void *)(a1 + 32))
          {
            os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
            uint64_t v37 = *(const char **)(a1 + 16);
            v213[0].st_dev = 136446466;
            if (!v37) {
              uint64_t v37 = "[anonymous]";
            }
            *(void *)&v213[0].st_mode = v37;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = v36;
          }
          else
          {
            __int16 v50 = *(const char **)(a1 + 16);
            if (!v50) {
              __int16 v50 = "[anonymous]";
            }
            v213[0].st_dev = 136446466;
            *(void *)&v213[0].st_mode = v50;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = v35;
          }
          int v51 = (char *)_os_log_send_and_compose_impl();
          CFErrorRef Error = createError("_cryptex_bundle_find_cryptexes", "bundle.c", 767, "com.apple.security.cryptex.posix", v36, 0, v51);
          v210 = 0;
          xpc_object_t object = 0;
          int v52 = 0;
          goto LABEL_83;
        }
        int v39 = _cryptex_identity_copy_description((uint64_t)buf);
        if (!v39)
        {
          if (*(void *)(a1 + 32))
          {
            os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
            long long v57 = *(const char **)(a1 + 16);
            v213[0].st_dev = 136446466;
            if (!v57) {
              long long v57 = "[anonymous]";
            }
            *(void *)&v213[0].st_mode = v57;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = 12;
          }
          else
          {
            uint64_t v95 = *(const char **)(a1 + 16);
            if (!v95) {
              uint64_t v95 = "[anonymous]";
            }
            v213[0].st_dev = 136446466;
            *(void *)&v213[0].st_mode = v95;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = 12;
          }
          int v51 = (char *)_os_log_send_and_compose_impl();
          int v54 = 775;
          CFIndex v55 = 12;
          goto LABEL_82;
        }
        __int16 v40 = v39;
        xpc_object_t v41 = _xpc_plist_value_copy((uint64_t)&_info, v34);
        uint64_t v42 = (uint64_t)v10;
        v210 = v41;
        v207 = v40;
        if (v41)
        {
          xpc_object_t v43 = _xpc_plist_value_copy((uint64_t)&_variant, v41);
          if (v43) {
            goto LABEL_103;
          }
          int v44 = *(const char **)(a1 + 16);
          int v45 = *__error();
          int v46 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            long long v47 = "[anonymous]";
            if (v44) {
              long long v47 = v44;
            }
            v213[0].st_dev = 136446210;
            *(void *)&v213[0].st_mode = v47;
            __int16 v48 = v46;
            uint64_t v49 = "%{public}s: no variant, using generic variant";
LABEL_101:
            _os_log_impl(&dword_21DAF1000, v48, OS_LOG_TYPE_DEBUG, v49, (uint8_t *)v213, 0xCu);
          }
        }
        else
        {
          uint64_t v58 = *(const char **)(a1 + 16);
          int v45 = *__error();
          long long v59 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
          {
            long long v60 = "[anonymous]";
            if (v58) {
              long long v60 = v58;
            }
            v213[0].st_dev = 136446210;
            *(void *)&v213[0].st_mode = v60;
            __int16 v48 = v59;
            uint64_t v49 = "%{public}s: no info, using generic variant";
            goto LABEL_101;
          }
        }
        long long v61 = __error();
        xpc_object_t v43 = 0;
        *long long v61 = v45;
LABEL_103:
        xpc_object_t object = v43;
        uint64_t v62 = *(const char **)(a1 + 16);
        int v63 = *__error();
        long long v64 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        {
          v213[0].st_dev = 136446722;
          uint64_t v65 = "[anonymous]";
          if (v62) {
            uint64_t v65 = v62;
          }
          *(void *)&v213[0].st_mode = v65;
          WORD2(v213[0].st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v32;
          HIWORD(v213[0].st_gid) = 2080;
          *(void *)&v213[0].st_rdev = v207;
          _os_log_impl(&dword_21DAF1000, v64, OS_LOG_TYPE_DEBUG, "%{public}s: identity[%lu]: %s", (uint8_t *)v213, 0x20u);
        }
        *__error() = v63;
        if (object) {
          string_ptr = (char *)xpc_string_get_string_ptr(object);
        }
        else {
          string_ptr = 0;
        }
        long long v67 = *(const char **)(a1 + 16);
        int v68 = *__error();
        uint64_t v69 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
        {
          __int16 v70 = "[anonymous]";
          if (v67) {
            __int16 v70 = v67;
          }
          v213[0].st_dev = 136446722;
          *(void *)&v213[0].st_mode = v70;
          int v71 = "generic";
          if (string_ptr) {
            int v71 = string_ptr;
          }
          WORD2(v213[0].st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v32;
          HIWORD(v213[0].st_gid) = 2080;
          *(void *)&v213[0].st_rdev = v71;
          _os_log_impl(&dword_21DAF1000, v69, OS_LOG_TYPE_DEBUG, "%{public}s: variant[%lu] = %s", (uint8_t *)v213, 0x20u);
        }
        *__error() = v68;
        *(_OWORD *)&v213[0].st_dev = *(_OWORD *)buf;
        *(_OWORD *)&v213[0].st_uint64_t uid = *(_OWORD *)&buf[16];
        v213[0].st_atimespec = *(timespec *)&buf[32];
        if (_cryptex_list_find_cryptex_elm(v204, (uint64_t)v213, string_ptr, 0))
        {
          uint64_t v10 = (id (__cdecl *)(id))v42;
          uint64_t v34 = v209;
          if (*(void *)(a1 + 32))
          {
            os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
            long long v72 = *(const char **)(a1 + 16);
            v213[0].st_dev = 136447234;
            if (!v72) {
              long long v72 = "[anonymous]";
            }
            *(void *)&v213[0].st_mode = v72;
            WORD2(v213[0].st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v32;
            HIWORD(v213[0].st_gid) = 2080;
            *(void *)&v213[0].st_rdev = v207;
            LOWORD(v213[0].st_atimespec.tv_sec) = 2080;
            *(__darwin_time_t *)((char *)&v213[0].st_atimespec.tv_sec + 2) = (__darwin_time_t)string_ptr;
            WORD1(v213[0].st_atimespec.tv_nsec) = 1024;
            HIDWORD(v213[0].st_atimespec.tv_nsec) = 22;
            int v52 = v207;
          }
          else
          {
            v92 = *(const char **)(a1 + 16);
            if (!v92) {
              v92 = "[anonymous]";
            }
            v213[0].st_dev = 136447234;
            *(void *)&v213[0].st_mode = v92;
            WORD2(v213[0].st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v32;
            HIWORD(v213[0].st_gid) = 2080;
            int v52 = v207;
            *(void *)&v213[0].st_rdev = v207;
            LOWORD(v213[0].st_atimespec.tv_sec) = 2080;
            *(__darwin_time_t *)((char *)&v213[0].st_atimespec.tv_sec + 2) = (__darwin_time_t)string_ptr;
            WORD1(v213[0].st_atimespec.tv_nsec) = 1024;
            HIDWORD(v213[0].st_atimespec.tv_nsec) = 22;
          }
          int v51 = (char *)_os_log_send_and_compose_impl();
          uint64_t v31 = v208;
          int v93 = 804;
          CFIndex v94 = 22;
          goto LABEL_148;
        }
        uint64_t v34 = v209;
        xpc_object_t xdict = _xpc_plist_value_copy((uint64_t)&_manifest, v209);
        if (!xdict)
        {
          uint64_t v10 = (id (__cdecl *)(id))v42;
          if (*(void *)(a1 + 32))
          {
            os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
            v96 = *(const char **)(a1 + 16);
            v213[0].st_dev = 136446466;
            if (!v96) {
              v96 = "[anonymous]";
            }
            *(void *)&v213[0].st_mode = v96;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = 212;
          }
          else
          {
            v105 = *(const char **)(a1 + 16);
            if (!v105) {
              v105 = "[anonymous]";
            }
            v213[0].st_dev = 136446466;
            *(void *)&v213[0].st_mode = v105;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = 212;
          }
          int v51 = (char *)_os_log_send_and_compose_impl();
          int v52 = v207;
          uint64_t v31 = v208;
          int v93 = 812;
          CFIndex v94 = 212;
LABEL_148:
          CFErrorRef Error = createError("_cryptex_bundle_find_cryptexes", "bundle.c", v93, "com.apple.security.cryptex.posix", v94, 0, v51);
          goto LABEL_83;
        }
        *(_OWORD *)&v213[0].st_dev = *(_OWORD *)buf;
        *(_OWORD *)&v213[0].st_uint64_t uid = *(_OWORD *)&buf[16];
        v213[0].st_atimespec = *(timespec *)&buf[32];
        v205 = (void *)_cryptex_create(v213, string_ptr, string_ptr == 0);
        xpc_object_t v73 = _xpc_plist_value_copy((uint64_t)&_signatures, v209);
        xpc_object_t v201 = v73;
        if (v73)
        {
          long long v74 = v73;
          xpc_object_t xarraya = xpc_array_create(0, 0);
          if (xpc_array_get_count(v74))
          {
            if (xpc_array_get_count(v74))
            {
              size_t v75 = 0;
              v199 = v3;
              while (1)
              {
                memset(v213, 0, 144);
                string = xpc_array_get_string(v74, v75);
                int v77 = openat(*v3, string, 0);
                if (v77 < 0) {
                  break;
                }
                int v78 = v77;
                if (fstat(v77, v213) == -1)
                {
                  int v108 = *__error();
                  if (*(void *)(a1 + 32))
                  {
                    os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
                    v109 = *(const char **)(a1 + 16);
                    *(_DWORD *)v215 = 136446722;
                    if (!v109) {
                      v109 = "[anonymous]";
                    }
                    *(void *)&v215[4] = v109;
                    *(_WORD *)&v215[12] = 2080;
                    *(void *)&v215[14] = string;
                    *(_WORD *)&v215[22] = 1024;
                    *(_DWORD *)&v215[24] = v108;
                  }
                  else
                  {
                    v117 = *(const char **)(a1 + 16);
                    if (!v117) {
                      v117 = "[anonymous]";
                    }
                    *(_DWORD *)v215 = 136446722;
                    *(void *)&v215[4] = v117;
                    *(_WORD *)&v215[12] = 2080;
                    *(void *)&v215[14] = string;
                    *(_WORD *)&v215[22] = 1024;
                    *(_DWORD *)&v215[24] = v108;
                  }
                  v114 = (char *)_os_log_send_and_compose_impl();
                  uint64_t v10 = (id (__cdecl *)(id))v42;
                  CFIndex v115 = v108;
                  int v116 = 582;
                  goto LABEL_204;
                }
                size_t st_size = v213[0].st_size;
                if (v213[0].st_size < 0) {
                  _cryptex_signing_service_read_fd_cold_2();
                }
                if (HIDWORD(v213[0].st_size))
                {
                  if (*(void *)(a1 + 32))
                  {
                    os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
                    v110 = *(const char **)(a1 + 16);
                    *(_DWORD *)v215 = 136446978;
                    if (!v110) {
                      v110 = "[anonymous]";
                    }
                    *(void *)&v215[4] = v110;
                    *(_WORD *)&v215[12] = 2048;
                    *(void *)&v215[14] = st_size;
                    *(_WORD *)&v215[22] = 1024;
                    *(_DWORD *)&v215[24] = -1;
                    *(_WORD *)&v215[28] = 1024;
                    *(_DWORD *)&v215[30] = 34;
                  }
                  else
                  {
                    v118 = *(const char **)(a1 + 16);
                    if (!v118) {
                      v118 = "[anonymous]";
                    }
                    *(_DWORD *)v215 = 136446978;
                    *(void *)&v215[4] = v118;
                    *(_WORD *)&v215[12] = 2048;
                    *(void *)&v215[14] = v213[0].st_size;
                    *(_WORD *)&v215[22] = 1024;
                    *(_DWORD *)&v215[24] = -1;
                    *(_WORD *)&v215[28] = 1024;
                    *(_DWORD *)&v215[30] = 34;
                  }
                  v114 = (char *)_os_log_send_and_compose_impl();
                  uint64_t v10 = (id (__cdecl *)(id))v42;
                  int v116 = 593;
                  CFIndex v115 = 34;
                  goto LABEL_204;
                }
                long long v80 = mmap(0, v213[0].st_size, 1, 1, v78, 0);
                if (v80 == (void *)-1)
                {
                  int v111 = *__error();
                  if (*(void *)(a1 + 32))
                  {
                    os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
                    v112 = *(const char **)(a1 + 16);
                    *(_DWORD *)v215 = 136446722;
                    if (!v112) {
                      v112 = "[anonymous]";
                    }
                    *(void *)&v215[4] = v112;
                    *(_WORD *)&v215[12] = 2080;
                    *(void *)&v215[14] = string;
                    *(_WORD *)&v215[22] = 1024;
                    *(_DWORD *)&v215[24] = v111;
                  }
                  else
                  {
                    v119 = *(const char **)(a1 + 16);
                    if (!v119) {
                      v119 = "[anonymous]";
                    }
                    *(_DWORD *)v215 = 136446722;
                    *(void *)&v215[4] = v119;
                    *(_WORD *)&v215[12] = 2080;
                    *(void *)&v215[14] = string;
                    *(_WORD *)&v215[22] = 1024;
                    *(_DWORD *)&v215[24] = v111;
                  }
                  v114 = (char *)_os_log_send_and_compose_impl();
                  uint64_t v10 = (id (__cdecl *)(id))v42;
                  CFIndex v115 = v111;
                  int v116 = 602;
                  goto LABEL_204;
                }
                long long v81 = v80;
                v200 = string;
                xpc_object_t v82 = xpc_data_create(v80, st_size);
                xpc_array_append_value(xarraya, v82);
                long long v83 = *(const char **)(a1 + 16);
                int v84 = *__error();
                v85 = *(NSObject **)(a1 + 32);
                if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v215 = 136446466;
                  uint64_t v86 = "[anonymous]";
                  if (v83) {
                    uint64_t v86 = v83;
                  }
                  *(void *)&v215[4] = v86;
                  *(_WORD *)&v215[12] = 2080;
                  *(void *)&v215[14] = v200;
                  _os_log_impl(&dword_21DAF1000, v85, OS_LOG_TYPE_DEFAULT, "%{public}s: added %s to ccx_im4m_array", v215, 0x16u);
                }
                *__error() = v84;
                if (munmap(v81, st_size) == -1) {
                  _cryptex_bundle_init_cold_2(&v212, v215);
                }
                id v3 = v199;
                long long v74 = v201;
                if (v82) {
                  os_release(v82);
                }
                ++v75;
                uint64_t v42 = 0x21DB19000;
                if (v75 >= xpc_array_get_count(v201)) {
                  goto LABEL_139;
                }
              }
              int v106 = *__error();
              if (*(void *)(a1 + 32))
              {
                os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
                v107 = *(const char **)(a1 + 16);
                *(_DWORD *)v215 = 136446722;
                if (!v107) {
                  v107 = "[anonymous]";
                }
                *(void *)&v215[4] = v107;
                *(_WORD *)&v215[12] = 2080;
                *(void *)&v215[14] = string;
                *(_WORD *)&v215[22] = 1024;
                *(_DWORD *)&v215[24] = v106;
              }
              else
              {
                v113 = *(const char **)(a1 + 16);
                if (!v113) {
                  v113 = "[anonymous]";
                }
                *(_DWORD *)v215 = 136446722;
                *(void *)&v215[4] = v113;
                *(_WORD *)&v215[12] = 2080;
                *(void *)&v215[14] = string;
                *(_WORD *)&v215[22] = 1024;
                *(_DWORD *)&v215[24] = v106;
              }
              v114 = (char *)_os_log_send_and_compose_impl();
              uint64_t v10 = (id (__cdecl *)(id))v42;
              CFIndex v115 = v106;
              int v116 = 574;
LABEL_204:
              CFErrorRef v91 = createError("_cryptex_bundle_populate_signatures", "bundle.c", v116, "com.apple.security.cryptex.posix", v115, 0, v114);
              uint64_t v31 = v208;
              uint64_t v34 = v209;
              free(v114);
              *(void *)(v205[6] + 208) = 0;
              goto LABEL_205;
            }
LABEL_139:
            *(void *)(v205[6] + 208) = xpc_copy(xarraya);
            v87 = *(const char **)(a1 + 16);
            int v88 = *__error();
            __int16 v89 = *(NSObject **)(a1 + 32);
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
            {
              if (!v87) {
                v87 = "[anonymous]";
              }
              size_t count = xpc_array_get_count(xarraya);
              v213[0].st_dev = 136446466;
              *(void *)&v213[0].st_mode = v87;
              WORD2(v213[0].st_ino) = 2048;
              *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = count;
              _os_log_impl(&dword_21DAF1000, v89, OS_LOG_TYPE_DEFAULT, "%{public}s: added %lu signatures", (uint8_t *)v213, 0x16u);
            }
            CFErrorRef v91 = 0;
            *__error() = v88;
          }
          else
          {
            v101 = *(const char **)(a1 + 16);
            int v102 = *__error();
            v103 = *(NSObject **)(a1 + 32);
            if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
            {
              v104 = "[anonymous]";
              if (v101) {
                v104 = v101;
              }
              v213[0].st_dev = 136446210;
              *(void *)&v213[0].st_mode = v104;
              _os_log_impl(&dword_21DAF1000, v103, OS_LOG_TYPE_DEFAULT, "%{public}s: Signatures array empty", (uint8_t *)v213, 0xCu);
            }
            CFErrorRef v91 = 0;
            *__error() = v102;
            *(void *)(v205[6] + 208) = 0;
          }
          uint64_t v10 = (id (__cdecl *)(id))v42;
          uint64_t v31 = v208;
          uint64_t v34 = v209;
LABEL_205:
          if (xarraya) {
            os_release(xarraya);
          }
          if (v91)
          {
            CFErrorRef xarray = v91;
            if (*(void *)(a1 + 32))
            {
              os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
              v120 = *(const char **)(a1 + 16);
              if (!v120) {
                v120 = "[anonymous]";
              }
              v213[0].st_dev = 136446210;
              *(void *)&v213[0].st_mode = v120;
            }
            else
            {
              v150 = *(const char **)(a1 + 16);
              if (!v150) {
                v150 = "[anonymous]";
              }
              v213[0].st_dev = 136446210;
              *(void *)&v213[0].st_mode = v150;
            }
            v151 = (char *)_os_log_send_and_compose_impl();
            CFErrorRef Error = createError("_cryptex_bundle_find_cryptexes", "bundle.c", 831, "com.apple.security.cryptex", 6, v91, v151);
            free(v151);
            int v56 = 2;
            goto LABEL_254;
          }
          goto LABEL_212;
        }
        v97 = *(const char **)(a1 + 16);
        int v98 = *__error();
        v99 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
        {
          v213[0].st_dev = 136446722;
          v100 = "[anonymous]";
          if (v97) {
            v100 = v97;
          }
          *(void *)&v213[0].st_mode = v100;
          WORD2(v213[0].st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = (__darwin_ino64_t)v207;
          HIWORD(v213[0].st_gid) = 2080;
          *(void *)&v213[0].st_rdev = string_ptr;
          _os_log_impl(&dword_21DAF1000, v99, OS_LOG_TYPE_DEFAULT, "%{public}s: no Signatures found for:\nidentity: %s\nvariant = %s", (uint8_t *)v213, 0x20u);
        }
        *__error() = v98;
        *(void *)(v205[6] + 208) = 0;
        uint64_t v31 = v208;
LABEL_212:
        uint64_t v121 = 0;
        while (1)
        {
          uint64_t v122 = *(void *)(MEMORY[0x263F8C428] + v121);
          *(void *)v215 = 0;
          if ((*(unsigned char *)v122 & 0x10) != 0)
          {
            v133 = *(const char **)(a1 + 16);
            int v134 = *__error();
            v135 = *(NSObject **)(a1 + 32);
            if (os_log_type_enabled(v135, OS_LOG_TYPE_DEBUG))
            {
              __darwin_ino64_t v136 = *(void *)(v122 + 40);
              v137 = "[anonymous]";
              if (v133) {
                v137 = v133;
              }
              v213[0].st_dev = 136446466;
              *(void *)&v213[0].st_mode = v137;
              WORD2(v213[0].st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v136;
              v138 = v135;
              v139 = "%{public}s: skipping internal asset type: %s";
LABEL_230:
              _os_log_impl(&dword_21DAF1000, v138, OS_LOG_TYPE_DEBUG, v139, (uint8_t *)v213, 0x16u);
            }
LABEL_231:
            *__error() = v134;
            goto LABEL_232;
          }
          xpc_object_t dictionary = xpc_dictionary_get_dictionary(xdict, *(const char **)(v122 + 48));
          if (!dictionary)
          {
            v140 = *(const char **)(a1 + 16);
            int v134 = *__error();
            v141 = *(NSObject **)(a1 + 32);
            if (os_log_type_enabled(v141, OS_LOG_TYPE_DEBUG))
            {
              __darwin_ino64_t v142 = *(void *)(v122 + 48);
              v143 = "[anonymous]";
              if (v140) {
                v143 = v140;
              }
              v213[0].st_dev = 136446466;
              *(void *)&v213[0].st_mode = v143;
              WORD2(v213[0].st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v142;
              v138 = v141;
              v139 = "%{public}s: object not present; skipping: %s";
              goto LABEL_230;
            }
            goto LABEL_231;
          }
          xpc_object_t v124 = _xpc_plist_value_copy((uint64_t)&_info, dictionary);
          if (!v124) {
            break;
          }
          v125 = v124;
          dev_t v126 = _cryptex_bundle_new_asset_from_object(*v3, v122, v124, (uint64_t *)v215);
          if (v126)
          {
            dev_t v154 = v126;
            if (*(void *)(a1 + 32))
            {
              os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
              v155 = *(const char **)(a1 + 16);
              __darwin_ino64_t v156 = *(void *)(v122 + 40);
              if (!v155) {
                v155 = "[anonymous]";
              }
              v213[0].st_dev = 136446722;
              *(void *)&v213[0].st_mode = v155;
              WORD2(v213[0].st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v156;
              HIWORD(v213[0].st_gid) = 1024;
              v213[0].st_rdev = v154;
            }
            else
            {
              v163 = *(const char **)(a1 + 16);
              if (!v163) {
                v163 = "[anonymous]";
              }
              __darwin_ino64_t v164 = *(void *)(v122 + 40);
              v213[0].st_dev = 136446722;
              *(void *)&v213[0].st_mode = v163;
              WORD2(v213[0].st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v164;
              HIWORD(v213[0].st_gid) = 1024;
              v213[0].st_rdev = v126;
            }
            v165 = (char *)_os_log_send_and_compose_impl();
            CFErrorRef v162 = createError("_cryptex_bundle_populate_assets", "bundle.c", 499, "com.apple.security.cryptex.posix", v154, 0, v165);
            free(v165);
            os_release(v125);
            goto LABEL_280;
          }
          v127 = v3;
          v128 = *(const char **)(a1 + 16);
          int v129 = *__error();
          v130 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG))
          {
            __darwin_ino64_t v131 = *(void *)(v122 + 40);
            v132 = "[anonymous]";
            if (v128) {
              v132 = v128;
            }
            v213[0].st_dev = 136446466;
            *(void *)&v213[0].st_mode = v132;
            WORD2(v213[0].st_ino) = 2080;
            *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v131;
            _os_log_impl(&dword_21DAF1000, v130, OS_LOG_TYPE_DEBUG, "%{public}s: adding asset: %s", (uint8_t *)v213, 0x16u);
          }
          *__error() = v129;
          cryptex_core_set_asset();
          os_release(v125);
          id v3 = v127;
LABEL_232:
          uint64_t v31 = v208;
          v121 += 8;
          if (v121 == 96) {
            goto LABEL_233;
          }
        }
        if (*(void *)(a1 + 32))
        {
          os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
          v153 = *(const char **)(a1 + 16);
          v213[0].st_dev = 136446722;
          if (!v153) {
            v153 = "[anonymous]";
          }
          *(void *)&v213[0].st_mode = v153;
          WORD2(v213[0].st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = (__darwin_ino64_t)"Info";
          HIWORD(v213[0].st_gid) = 1024;
          v213[0].st_rdev = 212;
        }
        else
        {
          v160 = *(const char **)(a1 + 16);
          if (!v160) {
            v160 = "[anonymous]";
          }
          v213[0].st_dev = 136446722;
          *(void *)&v213[0].st_mode = v160;
          WORD2(v213[0].st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = (__darwin_ino64_t)"Info";
          HIWORD(v213[0].st_gid) = 1024;
          v213[0].st_rdev = 212;
        }
        v161 = (char *)_os_log_send_and_compose_impl();
        CFErrorRef v162 = createError("_cryptex_bundle_populate_assets", "bundle.c", 490, "com.apple.security.cryptex.posix", 212, 0, v161);
        free(v161);
LABEL_280:
        if (v162)
        {
          CFErrorRef xarray = v162;
          uint64_t v10 = objc_autoreleaseReturnValue;
          if (*(void *)(a1 + 32))
          {
            os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
            v166 = *(const char **)(a1 + 16);
            if (!v166) {
              v166 = "[anonymous]";
            }
            v213[0].st_dev = 136446210;
            *(void *)&v213[0].st_mode = v166;
          }
          else
          {
            v167 = *(const char **)(a1 + 16);
            if (!v167) {
              v167 = "[anonymous]";
            }
            v213[0].st_dev = 136446210;
            *(void *)&v213[0].st_mode = v167;
          }
          v159 = (char *)_os_log_send_and_compose_impl();
          CFErrorRef Error = createError("_cryptex_bundle_find_cryptexes", "bundle.c", 841, "com.apple.security.cryptex", 6, xarray, v159);
          goto LABEL_289;
        }
LABEL_233:
        if (!v205)
        {
          CFIndex v149 = 22;
          goto LABEL_249;
        }
        uint64_t v10 = objc_autoreleaseReturnValue;
        if (!v205[6])
        {
          CFIndex v149 = 22;
          goto LABEL_264;
        }
        BOOL v144 = cryptex_core_get_asset()
            || cryptex_core_get_asset()
            || cryptex_core_get_asset()
            || cryptex_core_get_asset() != 0;
        if (!cryptex_core_get_asset() && !cryptex_core_get_asset() && !cryptex_core_get_asset())
        {
          if (cryptex_core_get_asset()) {
            BOOL v168 = v144;
          }
          else {
            BOOL v168 = 0;
          }
          if (!v168) {
            goto LABEL_299;
          }
LABEL_243:
          v145 = *(const char **)(a1 + 16);
          int v146 = *__error();
          v147 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
          {
            v213[0].st_dev = 136446466;
            v148 = "[anonymous]";
            if (v145) {
              v148 = v145;
            }
            *(void *)&v213[0].st_mode = v148;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = 45;
            _os_log_impl(&dword_21DAF1000, v147, OS_LOG_TYPE_ERROR, "%{public}s: Invalid bundle contents: mixed Cryptex1 and legacy assets.: %{darwin.errno}d", (uint8_t *)v213, 0x12u);
          }
          *__error() = v146;
          CFIndex v149 = 45;
LABEL_249:
          uint64_t v10 = objc_autoreleaseReturnValue;
LABEL_264:
          if (*(void *)(a1 + 32))
          {
            os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
            v157 = *(const char **)(a1 + 16);
            v213[0].st_dev = 136446466;
            if (!v157) {
              v157 = "[anonymous]";
            }
            *(void *)&v213[0].st_mode = v157;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = v149;
          }
          else
          {
            v158 = *(const char **)(a1 + 16);
            if (!v158) {
              v158 = "[anonymous]";
            }
            v213[0].st_dev = 136446466;
            *(void *)&v213[0].st_mode = v158;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = v149;
          }
          v159 = (char *)_os_log_send_and_compose_impl();
          CFErrorRef Error = createError("_cryptex_bundle_find_cryptexes", "bundle.c", 848, "com.apple.security.cryptex.posix", v149, 0, v159);
          CFErrorRef xarray = 0;
LABEL_289:
          free(v159);
          int v56 = 2;
          uint64_t v34 = v209;
          v152 = v205;
          if (!v205) {
            goto LABEL_291;
          }
          goto LABEL_290;
        }
        if (v144) {
          goto LABEL_243;
        }
LABEL_299:
        v169 = v205;
        _cryptex_bundle_add_cryptex_assets((void *)a1, (uint64_t)v205);
        if (!cryptex_core_is_cryptex1()) {
          goto LABEL_318;
        }
        unsigned int v170 = _cryptex_populate_cryptex1_properties(a1, (uint64_t)v205, v209);
        if (!v170)
        {
          v173 = *(const char **)(a1 + 16);
          int v174 = *__error();
          v175 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v175, OS_LOG_TYPE_DEBUG))
          {
            v176 = "[anonymous]";
            if (v173) {
              v176 = v173;
            }
            dev_t v177 = *(_DWORD *)(*(void *)(v205[6] + 216) + 40);
            v213[0].st_dev = 136446722;
            *(void *)&v213[0].st_mode = v176;
            WORD2(v213[0].st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v32;
            HIWORD(v213[0].st_gid) = 1024;
            v213[0].st_rdev = v177;
            _os_log_impl(&dword_21DAF1000, v175, OS_LOG_TYPE_DEBUG, "%{public}s: nonce domain handle[%lu]: %u", (uint8_t *)v213, 0x1Cu);
          }
          *__error() = v174;
          v178 = *(const char **)(a1 + 16);
          int v179 = *__error();
          v180 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v180, OS_LOG_TYPE_DEBUG))
          {
            v181 = "[anonymous]";
            if (v178) {
              v181 = v178;
            }
            uint64_t v182 = *(void *)(*(void *)(v205[6] + 216) + 48);
            v213[0].st_dev = 136446722;
            *(void *)&v213[0].st_mode = v181;
            WORD2(v213[0].st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v32;
            HIWORD(v213[0].st_gid) = 2080;
            *(void *)&v213[0].st_rdev = v182;
            _os_log_impl(&dword_21DAF1000, v180, OS_LOG_TYPE_DEBUG, "%{public}s: Cryptex1 version[%lu]: %s", (uint8_t *)v213, 0x20u);
          }
          *__error() = v179;
          v183 = *(const char **)(a1 + 16);
          int v184 = *__error();
          v185 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v185, OS_LOG_TYPE_DEBUG))
          {
            v186 = "[anonymous]";
            if (v183) {
              v186 = v183;
            }
            uint64_t v187 = *(void *)(*(void *)(v205[6] + 216) + 56);
            v213[0].st_dev = 136446722;
            *(void *)&v213[0].st_mode = v186;
            WORD2(v213[0].st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v32;
            HIWORD(v213[0].st_gid) = 2080;
            *(void *)&v213[0].st_rdev = v187;
            _os_log_impl(&dword_21DAF1000, v185, OS_LOG_TYPE_DEBUG, "%{public}s: Cryptex1 preauth version[%lu]: %s", (uint8_t *)v213, 0x20u);
          }
          *__error() = v184;
          uint64_t v10 = objc_autoreleaseReturnValue;
          uint64_t v31 = v208;
          v169 = v205;
LABEL_318:
          v188 = _cryptex_list_elm_new(v169);
          int v56 = 0;
          CFErrorRef xarray = 0;
          void *v188 = *v204;
          void *v204 = v188;
          uint64_t v34 = v209;
          v152 = v169;
          goto LABEL_290;
        }
        unsigned int v171 = v170;
        if (*(void *)(a1 + 32))
        {
          os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
          v172 = *(const char **)(a1 + 16);
          v213[0].st_dev = 136446466;
          if (!v172) {
            v172 = "[anonymous]";
          }
          *(void *)&v213[0].st_mode = v172;
          WORD2(v213[0].st_ino) = 1024;
          *(_DWORD *)((char *)&v213[0].st_ino + 6) = v171;
        }
        else
        {
          v189 = *(const char **)(a1 + 16);
          if (!v189) {
            v189 = "[anonymous]";
          }
          v213[0].st_dev = 136446466;
          *(void *)&v213[0].st_mode = v189;
          WORD2(v213[0].st_ino) = 1024;
          *(_DWORD *)((char *)&v213[0].st_ino + 6) = v170;
        }
        v190 = (char *)_os_log_send_and_compose_impl();
        CFErrorRef Error = createError("_cryptex_bundle_find_cryptexes", "bundle.c", 859, "com.apple.security.cryptex.posix", v171, 0, v190);
        free(v190);
        CFErrorRef xarray = 0;
        int v56 = 2;
        uint64_t v34 = v209;
LABEL_254:
        v152 = v205;
LABEL_290:
        os_release(v152);
LABEL_291:
        free(v207);
        if (v201) {
          os_release(v201);
        }
        os_release(xdict);
LABEL_84:
        if (object) {
          os_release(object);
        }
        if (v210) {
          os_release(v210);
        }
        if (v34) {
          os_release(v34);
        }
        if (!v56 && ++v32 < xpc_array_get_count(v31)) {
          continue;
        }
        os_release(v31);
        if (xarray) {
          CFRelease(xarray);
        }
        goto LABEL_341;
      }
    }
    CFErrorDomain v8 = v31;
LABEL_13:
    os_release(v8);
    return 0;
  }
  empty = xpc_dictionary_create_empty();
  xpc_object_t v7 = xpc_array_create_empty();
  xpc_dictionary_set_value(empty, "BuildIdentities", v7);
  *(void *)(a1 + 80) = xpc_retain(empty);
  if (v7) {
    os_release(v7);
  }
  if (empty)
  {
    CFErrorDomain v8 = empty;
    goto LABEL_13;
  }
  return empty;
}

uint64_t cryptex_bundle_copy_cryptex_for_chip2(uint64_t a1, uint64_t a2, const char *a3, void **a4, CFTypeRef *a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  *(void *)&v23[0] = 1;
  memset((char *)v23 + 8, 0, 40);
  int v9 = cryptex_identity_set_chip((unsigned int *)v23, a2);
  if (v9)
  {
    int v10 = v9;
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      int v11 = *(const char **)(a1 + 16);
      *(_DWORD *)long long v25 = 136446722;
      if (!v11) {
        int v11 = "[anonymous]";
      }
      *(void *)&v25[4] = v11;
      *(_WORD *)&v25[12] = 1024;
      *(_DWORD *)&v25[14] = v10;
      *(_WORD *)&v25[18] = 1024;
      *(_DWORD *)&v25[20] = v10;
    }
    else
    {
      int v13 = "[anonymous]";
      if (*(void *)(a1 + 16)) {
        int v13 = *(const char **)(a1 + 16);
      }
      *(_DWORD *)long long v25 = 136446722;
      *(void *)&v25[4] = v13;
      *(_WORD *)&v25[12] = 1024;
      *(_DWORD *)&v25[14] = v9;
      *(_WORD *)&v25[18] = 1024;
      *(_DWORD *)&v25[20] = v9;
    }
    BOOL v14 = (char *)_os_log_send_and_compose_impl();
    CFIndex v15 = v10;
    BOOL v16 = "com.apple.security.cryptex.posix";
    int v17 = 1377;
    CFTypeRef v18 = 0;
  }
  else
  {
    *(_OWORD *)long long v25 = v23[0];
    *(_OWORD *)&v25[16] = v23[1];
    long long v26 = v23[2];
    if (cryptex_bundle_copy_cryptex2(a1, v25, a3, a4, &cf)) {
      goto LABEL_24;
    }
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      uint64_t v12 = *(const char **)(a1 + 16);
      if (!v12) {
        uint64_t v12 = "[anonymous]";
      }
      *(_DWORD *)long long v25 = 136446210;
      *(void *)&v25[4] = v12;
    }
    else
    {
      BOOL v19 = *(const char **)(a1 + 16);
      if (!v19) {
        BOOL v19 = "[anonymous]";
      }
      *(_DWORD *)long long v25 = 136446210;
      *(void *)&v25[4] = v19;
    }
    BOOL v14 = (char *)_os_log_send_and_compose_impl();
    CFTypeRef v18 = cf;
    BOOL v16 = "com.apple.security.cryptex";
    int v17 = 1384;
    CFIndex v15 = 8;
  }
  CFErrorRef Error = createError("cryptex_bundle_copy_cryptex_for_chip2", "bundle.c", v17, v16, v15, v18, v14);
  free(v14);
  if (a5 && Error)
  {
    *a5 = CFRetain(Error);
LABEL_23:
    CFRelease(Error);
    uint64_t v21 = 0;
    goto LABEL_25;
  }
  if (Error) {
    goto LABEL_23;
  }
LABEL_24:
  uint64_t v21 = 1;
LABEL_25:
  if (cf) {
    CFRelease(cf);
  }
  return v21;
}

uint64_t cryptex_bundle_set_cryptex2(uint64_t a1, uint64_t a2, CFTypeRef *a3)
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)(a2 + 40) & 2) != 0)
  {
    if (*(void *)(a2 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a2 + 32), OS_LOG_TYPE_ERROR);
      int v9 = *(const char **)(a2 + 16);
      if (!v9) {
        int v9 = "[anonymous]";
      }
      LODWORD(applier) = 136446210;
      *(void *)((char *)&applier + 4) = v9;
    }
    else
    {
      BOOL v19 = *(const char **)(a2 + 16);
      if (!v19) {
        BOOL v19 = "[anonymous]";
      }
      LODWORD(applier) = 136446210;
      *(void *)((char *)&applier + 4) = v19;
    }
    int v20 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("cryptex_bundle_set_cryptex2", "bundle.c", 1408, "com.apple.security.cryptex", 10, 0, v20);
    xpc_object_t v7 = 0;
LABEL_25:
    free(v20);
    if (a3 && Error)
    {
      *a3 = CFRetain(Error);
    }
    else if (!Error)
    {
      uint64_t v23 = 1;
      if (!v7) {
        return v23;
      }
      goto LABEL_30;
    }
    CFRelease(Error);
    uint64_t v23 = 0;
    if (!v7) {
      return v23;
    }
LABEL_30:
    CFRelease(v7);
    return v23;
  }
  CFTypeID v6 = _cryptex_bundle_init(a1);
  if (v6)
  {
    xpc_object_t v7 = v6;
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      CFErrorDomain v8 = *(const char **)(a1 + 16);
      if (!v8) {
        CFErrorDomain v8 = "[anonymous]";
      }
      LODWORD(applier) = 136446210;
      *(void *)((char *)&applier + 4) = v8;
    }
    else
    {
      __int16 v22 = *(const char **)(a1 + 16);
      if (!v22) {
        __int16 v22 = "[anonymous]";
      }
      LODWORD(applier) = 136446210;
      *(void *)((char *)&applier + 4) = v22;
    }
    int v20 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("cryptex_bundle_set_cryptex2", "bundle.c", 1417, "com.apple.security.cryptex", 6, v7, v20);
    goto LABEL_25;
  }
  int v10 = (void **)(a1 + 64);
  int v11 = *(const char **)(a2 + 16);
  long long v12 = *(_OWORD *)(a2 + 72);
  long long applier = *(_OWORD *)(a2 + 56);
  long long v101 = v12;
  long long v102 = *(_OWORD *)(a2 + 88);
  cryptex_elm = (void **)_cryptex_list_find_cryptex_elm((void *)(a1 + 64), (uint64_t)&applier, v11, 0);
  int v98 = cryptex_elm;
  if (cryptex_elm)
  {
    BOOL v14 = cryptex_elm;
    CFIndex v15 = cryptex_elm[1];
    xpc_object_t value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 80), "BuildIdentities");
    xpc_object_t empty = xpc_array_create_empty();
    *(void *)&long long applier = MEMORY[0x263EF8330];
    *((void *)&applier + 1) = 0x40000000;
    *(void *)&long long v101 = ___cryptex_bundle_manifest_remove_build_identity_block_invoke;
    *((void *)&v101 + 1) = &__block_descriptor_tmp_0;
    *(void *)&long long v102 = a1;
    *((void *)&v102 + 1) = v15;
    xpc_object_t v103 = empty;
    xpc_array_apply(value, &applier);
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 80), "BuildIdentities", empty);
    if (empty) {
      os_release(empty);
    }
    for (size_t i = (void **)*v10; i != v14; size_t i = (void **)*i)
      int v10 = i;
    void *v10 = *v14;
    char *v14 = (void *)-1;
    _cryptex_list_elm_destroy(&v98);
  }
  long long v24 = *(_OWORD *)(a2 + 72);
  long long applier = *(_OWORD *)(a2 + 56);
  long long v101 = v24;
  long long v102 = *(_OWORD *)(a2 + 88);
  char v99 = 0;
  xpc_object_t v25 = xpc_dictionary_create_empty();
  long long v26 = _cryptex_identity_copy_description((uint64_t)&applier);
  if (BYTE8(applier))
  {
    uint64_t v34 = *(const char **)(a1 + 16);
    int v31 = *__error();
    int v35 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      int v36 = "[anonymous]";
      if (v34) {
        int v36 = v34;
      }
      *(_DWORD *)buf = 136446210;
      v105 = v36;
      _os_log_impl(&dword_21DAF1000, v35, OS_LOG_TYPE_DEBUG, "%{public}s: skip adding generic identity to manifest", buf, 0xCu);
    }
    uint64_t v95 = 0;
    v92 = 0;
    int v93 = 0;
  }
  else
  {
    xpc_object_t v27 = xpc_string_create_with_format("%#x", *(_DWORD *)(a2 + 72));
    xpc_object_t v28 = xpc_string_create_with_format("%#x", *(_DWORD *)(a2 + 76));
    xpc_object_t v29 = xpc_string_create_with_format("%#x", *(_DWORD *)(a2 + 80));
    uint64_t v95 = v27;
    xpc_dictionary_set_value(v25, "ApBoardID", v27);
    int v93 = v28;
    xpc_dictionary_set_value(v25, "ApChipID", v28);
    v92 = v29;
    xpc_dictionary_set_value(v25, "ApSecurityDomain", v29);
    xpc_object_t v30 = *(const char **)(a1 + 16);
    int v31 = *__error();
    size_t v32 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      xpc_object_t v33 = "[anonymous]";
      if (v30) {
        xpc_object_t v33 = v30;
      }
      *(_DWORD *)buf = 136446466;
      v105 = v33;
      __int16 v106 = 2080;
      v107 = v26;
      _os_log_impl(&dword_21DAF1000, v32, OS_LOG_TYPE_DEBUG, "%{public}s: identity: %s", buf, 0x16u);
    }
  }
  *__error() = v31;
  uint64_t v37 = *(void *)(*(void *)(a2 + 48) + 216);
  if (v37)
  {
    xpc_object_t v38 = xpc_int64_create(*(unsigned int *)(v37 + 40));
    xpc_object_t v39 = xpc_string_create(*(const char **)(v37 + 56));
    xpc_object_t v40 = xpc_string_create(*(const char **)(v37 + 48));
    CFErrorRef v91 = v38;
    xpc_dictionary_set_value(v25, "Cryptex1,NonceDomain", v38);
    size_t v90 = v39;
    xpc_dictionary_set_value(v25, "Cryptex1,PreauthorizationVersion", v39);
    xpc_object_t object = v40;
    xpc_dictionary_set_value(v25, "Cryptex1,Version", v40);
    xpc_dictionary_set_BOOL(v25, "Cryptex1,UseProductClass", *(unsigned char *)(v37 + 65));
    if ((BYTE8(applier) & 4) != 0)
    {
      xpc_object_t v89 = xpc_string_create_with_format("%#x", *(_DWORD *)(a2 + 84));
      xpc_dictionary_set_value(v25, "Cryptex1,ChipID", v89);
      if ((BYTE8(applier) & 2) != 0) {
        goto LABEL_47;
      }
    }
    else
    {
      xpc_object_t v89 = 0;
      if ((BYTE8(applier) & 2) != 0)
      {
LABEL_47:
        xpc_object_t v41 = xpc_int64_create(*(unsigned int *)(a2 + 92));
        xpc_object_t v42 = xpc_int64_create(*(unsigned int *)(a2 + 88));
        xpc_object_t v43 = xpc_string_create_with_format("%#x", *(_DWORD *)(a2 + 96));
        v87 = v42;
        xpc_dictionary_set_value(v25, "Cryptex1,Type", v42);
        uint64_t v86 = v41;
        xpc_dictionary_set_value(v25, "Cryptex1,SubType", v41);
        v85 = v43;
        xpc_dictionary_set_value(v25, "Cryptex1,ProductClass", v43);
        goto LABEL_51;
      }
    }
    uint64_t v86 = 0;
    v87 = 0;
    v85 = 0;
  }
  else
  {
    xpc_object_t v89 = 0;
    size_t v90 = 0;
    uint64_t v86 = 0;
    v87 = 0;
    v85 = 0;
    CFErrorRef v91 = 0;
    xpc_object_t object = 0;
  }
LABEL_51:
  if (cryptex_core_get_info_asset())
  {
    cryptex_core_parse_info_asset();
    if (v99) {
      xpc_dictionary_set_BOOL(v25, "Cryptex1,DataOnly", 1);
    }
  }
  xpc_object_t v96 = v25;
  CFIndex v94 = v26;
  if (*(unsigned char *)(a2 + 40))
  {
    __int16 v50 = *(const char **)(a1 + 16);
    int v46 = *__error();
    int v51 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      int v52 = "[anonymous]";
      if (v50) {
        int v52 = v50;
      }
      *(_DWORD *)buf = 136446210;
      v105 = v52;
      _os_log_impl(&dword_21DAF1000, v51, OS_LOG_TYPE_DEBUG, "%{public}s: skip adding generic variant to manifest", buf, 0xCu);
    }
    xpc_object_t v83 = 0;
    int v84 = 0;
  }
  else
  {
    xpc_object_t v44 = xpc_dictionary_create_empty();
    xpc_object_t v83 = xpc_string_create(*(const char **)(a2 + 16));
    xpc_dictionary_set_value(v44, "Variant", v83);
    int v84 = v44;
    xpc_dictionary_set_value(v25, "Info", v44);
    int v45 = *(const char **)(a1 + 16);
    int v46 = *__error();
    long long v47 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      __int16 v48 = "[anonymous]";
      uint64_t v49 = *(char **)(a2 + 16);
      if (v45) {
        __int16 v48 = v45;
      }
      *(_DWORD *)buf = 136446466;
      v105 = v48;
      __int16 v106 = 2080;
      v107 = v49;
      _os_log_impl(&dword_21DAF1000, v47, OS_LOG_TYPE_DEBUG, "%{public}s: variant: %s", buf, 0x16u);
    }
  }
  *__error() = v46;
  xpc_object_t xdict = xpc_dictionary_create_empty();
  for (uint64_t j = 0; j != 96; j += 8)
  {
    xpc_object_t v54 = xpc_dictionary_create_empty();
    xpc_object_t v55 = xpc_dictionary_create_empty();
    uint64_t v56 = *(void *)(*(void *)(a2 + 48) + j + 64);
    if (!v56)
    {
      long long v67 = *(const char **)(a2 + 16);
      int v59 = *__error();
      int v68 = *(NSObject **)(a2 + 32);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v69 = "[anonymous]";
        if (v67) {
          uint64_t v69 = v67;
        }
        __int16 v70 = *(char **)(*(void *)(MEMORY[0x263F8C428] + j) + 40);
        *(_DWORD *)buf = 136446466;
        v105 = v69;
        __int16 v106 = 2080;
        v107 = v70;
        int v71 = v68;
        long long v72 = "%{public}s: no asset of type: %s";
        goto LABEL_81;
      }
LABEL_82:
      *__error() = v59;
      goto LABEL_83;
    }
    uint64_t v57 = **(void **)(v56 + 8);
    uint64_t v58 = *(const char **)(a1 + 16);
    int v59 = *__error();
    long long v60 = *(NSObject **)(a1 + 32);
    BOOL v61 = os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG);
    if ((v57 & 0x10) != 0)
    {
      if (v61)
      {
        xpc_object_t v73 = "[anonymous]";
        if (v58) {
          xpc_object_t v73 = v58;
        }
        long long v74 = *(char **)(*(void *)(v56 + 8) + 40);
        *(_DWORD *)buf = 136446466;
        v105 = v73;
        __int16 v106 = 2080;
        v107 = v74;
        int v71 = v60;
        long long v72 = "%{public}s: skip adding internal asset %s";
LABEL_81:
        _os_log_impl(&dword_21DAF1000, v71, OS_LOG_TYPE_DEBUG, v72, buf, 0x16u);
        goto LABEL_82;
      }
      goto LABEL_82;
    }
    if (v61)
    {
      uint64_t v62 = "[anonymous]";
      if (v58) {
        uint64_t v62 = v58;
      }
      int v63 = *(char **)(*(void *)(v56 + 8) + 40);
      uint64_t v64 = *(void *)(v56 + 24);
      *(_DWORD *)buf = 136446722;
      v105 = v62;
      __int16 v106 = 2080;
      v107 = v63;
      __int16 v108 = 2080;
      uint64_t v109 = v64;
      _os_log_impl(&dword_21DAF1000, v60, OS_LOG_TYPE_DEBUG, "%{public}s: adding asset: type = %s, name = %s", buf, 0x20u);
    }
    *__error() = v59;
    uint64_t v65 = _cryptex_bundle_default_asset_path(a2, v56);
    xpc_object_t v66 = xpc_string_create(v65);
    xpc_dictionary_set_value(v55, "Path", v66);
    xpc_dictionary_set_value(v54, "Info", v55);
    xpc_dictionary_set_value(xdict, *(const char **)(*(void *)(MEMORY[0x263F8C428] + j) + 48), v54);
    free(v65);
    if (v66) {
      os_release(v66);
    }
LABEL_83:
    if (v55) {
      os_release(v55);
    }
    if (v54) {
      os_release(v54);
    }
  }
  xpc_dictionary_set_value(v96, "Manifest", xdict);
  size_t v75 = (char *)xpc_copy_clean_description();
  long long v76 = *(const char **)(a1 + 16);
  int v77 = *__error();
  int v78 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v79 = "[anonymous]";
    if (v76) {
      uint64_t v79 = v76;
    }
    *(_DWORD *)buf = 136446466;
    v105 = v79;
    __int16 v106 = 2080;
    v107 = v75;
    _os_log_impl(&dword_21DAF1000, v78, OS_LOG_TYPE_DEBUG, "%{public}s: adding build identity:\n%s", buf, 0x16u);
  }
  *__error() = v77;
  xpc_object_t v80 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 80), "BuildIdentities");
  xpc_array_append_value(v80, v96);
  free(v94);
  free(v75);
  if (object) {
    os_release(object);
  }
  if (v90) {
    os_release(v90);
  }
  if (v91) {
    os_release(v91);
  }
  if (v85) {
    os_release(v85);
  }
  if (v86) {
    os_release(v86);
  }
  if (v87) {
    os_release(v87);
  }
  if (v89) {
    os_release(v89);
  }
  if (v92) {
    os_release(v92);
  }
  if (v93) {
    os_release(v93);
  }
  if (v95) {
    os_release(v95);
  }
  if (xdict) {
    os_release(xdict);
  }
  if (v83) {
    os_release(v83);
  }
  if (v84) {
    os_release(v84);
  }
  if (v96) {
    os_release(v96);
  }
  long long v81 = _cryptex_list_elm_new((void *)a2);
  *long long v81 = *(void *)(a1 + 64);
  *(void *)(a1 + 64) = v81;
  _cryptex_bundle_add_cryptex_assets((void *)a1, a2);
  return 1;
}

void _cryptex_bundle_add_cryptex_assets(void *a1, uint64_t a2)
{
  uint64_t v4 = 0;
  uint64_t v5 = MEMORY[0x263F8C428];
  uint64_t v27 = *MEMORY[0x263EF8340];
  do
  {
    uint64_t v6 = *(void *)(v5 + 8 * v4);
    if ((*(unsigned char *)v6 & 0x10) != 0)
    {
      BOOL v16 = (const char *)a1[2];
      int v17 = *__error();
      CFTypeRef v18 = a1[4];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        BOOL v19 = *(char **)(v6 + 40);
        int v20 = "[anonymous]";
        if (v16) {
          int v20 = v16;
        }
        *(_DWORD *)buf = 136446466;
        long long v24 = v20;
        __int16 v25 = 2080;
        long long v26 = v19;
        _os_log_impl(&dword_21DAF1000, v18, OS_LOG_TYPE_DEBUG, "%{public}s: skip adding internal asset %s", buf, 0x16u);
      }
      *__error() = v17;
    }
    else
    {
      uint64_t v7 = *(void *)(*(void *)(a2 + 48) + 8 * v4 + 64);
      if (v7)
      {
        __s2 = 0;
        if (asprintf(&__s2, "__%s_%s", *(const char **)(a2 + 16), *(const char **)(*(void *)(v7 + 8) + 40)) < 0) {
          _cryptex_bundle_add_cryptex_assets_cold_1(&v22, buf);
        }
        CFErrorDomain v8 = __s2;
        uint64_t v9 = a1[9];
        if (v9)
        {
          while (strcmp(*(const char **)v9, v8))
          {
            uint64_t v9 = *(void *)(v9 + 16);
            if (!v9) {
              goto LABEL_8;
            }
          }
        }
        else
        {
LABEL_8:
          int v10 = _cryptex_bundle_default_asset_path(a2, v7);
          int v11 = (const char *)a1[2];
          int v12 = *__error();
          int v13 = a1[4];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136446466;
            BOOL v14 = "[anonymous]";
            if (v11) {
              BOOL v14 = v11;
            }
            long long v24 = v14;
            __int16 v25 = 2080;
            long long v26 = v8;
            _os_log_impl(&dword_21DAF1000, v13, OS_LOG_TYPE_DEBUG, "%{public}s: adding cryptex bundle asset: %s", buf, 0x16u);
          }
          *__error() = v12;
          CFIndex v15 = _cryptex_bundle_asset_new(v7, v8, v10);
          v15[2] = (char *)a1[9];
          a1[9] = v15;
          free(v10);
        }
        free(v8);
      }
    }
    ++v4;
  }
  while (v4 != 12);
}

uint64_t cryptex_bundle_write2(uint64_t a1, _DWORD *a2, CFTypeRef *a3)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v5 = (_DWORD *)(a1 + 48);
  uint64_t v47 = *(void *)(a1 + 48);
  uint64_t v6 = (int *)(a1 + 52);
  if ((*a2 & 0x80000000) != 0)
  {
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      int v10 = *(const char **)(a1 + 16);
      if (!v10) {
        int v10 = "[anonymous]";
      }
      *(_DWORD *)uint64_t v49 = 136446210;
      __int16 v50 = v10;
    }
    else
    {
      BOOL v16 = *(const char **)(a1 + 16);
      if (!v16) {
        BOOL v16 = "[anonymous]";
      }
      *(_DWORD *)uint64_t v49 = 136446210;
      __int16 v50 = v16;
    }
    int v17 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("cryptex_bundle_write2", "bundle.c", 1461, "com.apple.security.cryptex", 11, 0, v17);
    free(v17);
    CFErrorRef v8 = 0;
    goto LABEL_52;
  }
  uint64_t v7 = (__CFError *)_cryptex_bundle_init(a1);
  if (v7)
  {
    CFErrorRef v8 = v7;
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      uint64_t v9 = *(const char **)(a1 + 16);
      if (!v9) {
        uint64_t v9 = "[anonymous]";
      }
      *(_DWORD *)uint64_t v49 = 136446210;
      __int16 v50 = v9;
    }
    else
    {
      int v13 = *(const char **)(a1 + 16);
      if (!v13) {
        int v13 = "[anonymous]";
      }
      *(_DWORD *)uint64_t v49 = 136446210;
      __int16 v50 = v13;
    }
    BOOL v14 = (char *)_os_log_send_and_compose_impl();
    int v15 = 1470;
    goto LABEL_51;
  }
  *(_DWORD *)(a1 + 48) = claimfd_np();
  CFErrorRef v11 = _cryptex_bundle_open(a1, (uint64_t)&_cryptex_bundle_object_restore, 512, 0x1EDu, v6);
  if (v11)
  {
    CFErrorRef v8 = v11;
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      int v12 = *(const char **)(a1 + 16);
      if (!v12) {
        int v12 = "[anonymous]";
      }
      *(_DWORD *)uint64_t v49 = 136446210;
      __int16 v50 = v12;
    }
    else
    {
      uint64_t v21 = *(const char **)(a1 + 16);
      if (!v21) {
        uint64_t v21 = "[anonymous]";
      }
      *(_DWORD *)uint64_t v49 = 136446210;
      __int16 v50 = v21;
    }
    BOOL v14 = (char *)_os_log_send_and_compose_impl();
    int v15 = 1481;
    goto LABEL_51;
  }
  CFErrorRef v19 = _cryptex_bundle_write_manifest(a1);
  if (v19)
  {
    CFErrorRef v8 = v19;
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      int v20 = *(const char **)(a1 + 16);
      if (!v20) {
        int v20 = "[anonymous]";
      }
      *(_DWORD *)uint64_t v49 = 136446210;
      __int16 v50 = v20;
    }
    else
    {
      xpc_object_t v28 = *(const char **)(a1 + 16);
      if (!v28) {
        xpc_object_t v28 = "[anonymous]";
      }
      *(_DWORD *)uint64_t v49 = 136446210;
      __int16 v50 = v28;
    }
    BOOL v14 = (char *)_os_log_send_and_compose_impl();
    int v15 = 1490;
    goto LABEL_51;
  }
  uint64_t v22 = *(void *)(a1 + 72);
  if (!v22)
  {
LABEL_46:
    CFErrorRef v8 = 0;
    goto LABEL_101;
  }
  bzero(v49, 0x400uLL);
  while (1)
  {
    uint64_t v23 = dirname_r(*(const char **)(v22 + 8), v49);
    if (!v23)
    {
      int v32 = *__error();
      if (*(void *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        xpc_object_t v33 = *(const char **)(a1 + 16);
        if (!v33) {
          xpc_object_t v33 = "[anonymous]";
        }
      }
      else
      {
        xpc_object_t v33 = *(const char **)(a1 + 16);
        if (!v33) {
          xpc_object_t v33 = "[anonymous]";
        }
      }
      int v53 = 136446466;
      xpc_object_t v54 = v33;
      __int16 v55 = 1024;
      LODWORD(v56) = v32;
      xpc_object_t v40 = (char *)_os_log_send_and_compose_impl();
      int v41 = 1081;
      CFIndex v42 = v32;
      goto LABEL_95;
    }
    long long v24 = v23;
    int v25 = mkpathat_np(*v6, v23, 0x1EDu);
    if (v25) {
      BOOL v26 = v25 == 17;
    }
    else {
      BOOL v26 = 1;
    }
    if (!v26)
    {
      int v38 = v25;
      if (*(void *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        xpc_object_t v39 = *(const char **)(a1 + 16);
        int v53 = 136446722;
        if (!v39) {
          xpc_object_t v39 = "[anonymous]";
        }
        xpc_object_t v54 = v39;
        __int16 v55 = 2080;
        uint64_t v56 = v24;
        __int16 v57 = 1024;
        int v58 = v38;
      }
      else
      {
        int v45 = *(const char **)(a1 + 16);
        if (!v45) {
          int v45 = "[anonymous]";
        }
        int v53 = 136446722;
        xpc_object_t v54 = v45;
        __int16 v55 = 2080;
        uint64_t v56 = v24;
        __int16 v57 = 1024;
        int v58 = v25;
      }
      xpc_object_t v40 = (char *)_os_log_send_and_compose_impl();
      CFIndex v42 = v38;
      int v41 = 1092;
LABEL_95:
      CFErrorRef v8 = createError("_cryptex_bundle_write_assets", "bundle.c", v41, "com.apple.security.cryptex.posix", v42, 0, v40);
      free(v40);
      goto LABEL_96;
    }
    int v27 = openat(*v6, *(const char **)(v22 + 8), 514, 438);
    if (v27 < 0)
    {
      int v34 = *__error();
      if (*(void *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        int v35 = *(const char **)(a1 + 16);
        if (!v35) {
          int v35 = "[anonymous]";
        }
      }
      else
      {
        int v35 = *(const char **)(a1 + 16);
        if (!v35) {
          int v35 = "[anonymous]";
        }
      }
      int v53 = 136446466;
      xpc_object_t v54 = v35;
      __int16 v55 = 1024;
      LODWORD(v56) = v34;
      xpc_object_t v43 = (char *)_os_log_send_and_compose_impl();
      CFErrorRef v8 = createError("_cryptex_bundle_write_assets", "bundle.c", 1101, "com.apple.security.cryptex.posix", v34, 0, v43);
      free(v43);
      if (v27 != -1) {
        goto LABEL_89;
      }
      goto LABEL_96;
    }
    if (lseek(*(_DWORD *)(*(void *)(v22 + 24) + 16), 0, 0) == -1) {
      cryptex_bundle_write2_cold_1(&v48, &v53);
    }
    if (fcopyfile(*(_DWORD *)(*(void *)(v22 + 24) + 16), v27, 0, 0xFu) < 0) {
      break;
    }
    if (close(v27) == -1) {
      goto LABEL_90;
    }
    uint64_t v22 = *(void *)(v22 + 16);
    if (!v22) {
      goto LABEL_46;
    }
  }
  int v36 = *__error();
  if (*(void *)(a1 + 32))
  {
    os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
    uint64_t v37 = *(const char **)(a1 + 16);
    if (!v37) {
      uint64_t v37 = "[anonymous]";
    }
  }
  else
  {
    uint64_t v37 = *(const char **)(a1 + 16);
    if (!v37) {
      uint64_t v37 = "[anonymous]";
    }
  }
  int v53 = 136446466;
  xpc_object_t v54 = v37;
  __int16 v55 = 1024;
  LODWORD(v56) = v36;
  xpc_object_t v44 = (char *)_os_log_send_and_compose_impl();
  CFErrorRef v8 = createError("_cryptex_bundle_write_assets", "bundle.c", 1113, "com.apple.security.cryptex.posix", v36, 0, v44);
  free(v44);
LABEL_89:
  if (close(v27) == -1) {
LABEL_90:
  }
    _cryptex_bundle_new_asset_from_object_cold_1(&v48, &v53);
LABEL_96:
  if (!v8)
  {
LABEL_101:
    CFErrorRef Error = 0;
    goto LABEL_52;
  }
  if (*(void *)(a1 + 32))
  {
    os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
    int v46 = *(const char **)(a1 + 16);
    if (!v46) {
      int v46 = "[anonymous]";
    }
  }
  else
  {
    int v46 = *(const char **)(a1 + 16);
    if (!v46) {
      int v46 = "[anonymous]";
    }
  }
  *(_DWORD *)uint64_t v49 = 136446466;
  __int16 v50 = v46;
  __int16 v51 = 1024;
  int v52 = -1;
  BOOL v14 = (char *)_os_log_send_and_compose_impl();
  int v15 = 1501;
LABEL_51:
  CFErrorRef Error = createError("cryptex_bundle_write2", "bundle.c", v15, "com.apple.security.cryptex", 7, v8, v14);
  free(v14);
LABEL_52:
  uint64_t v29 = v47;
  if (*v5 != v47)
  {
    close_drop_np();
    close_drop_optional_np();
    uint64_t v29 = v47;
  }
  *(void *)uint64_t v5 = v29;
  if (a3 && Error)
  {
    *a3 = CFRetain(Error);
    goto LABEL_58;
  }
  if (Error)
  {
LABEL_58:
    CFRelease(Error);
    uint64_t v30 = 0;
    if (v8) {
      goto LABEL_59;
    }
  }
  else
  {
    uint64_t v30 = 1;
    if (v8) {
LABEL_59:
    }
      CFRelease(v8);
  }
  return v30;
}

CFErrorRef _cryptex_bundle_open(uint64_t a1, uint64_t a2, int a3, unsigned int a4, _DWORD *a5)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  int v6 = *(_DWORD *)(a1 + *(void *)(a2 + 8));
  if (v6 < 0) {
    _cryptex_bundle_open_cold_2(&v28, &v29);
  }
  int v10 = ((*(_DWORD *)a2 & 1) << 20) | a3;
  if ((a3 & 0x200) == 0 || (v10 & 0x100000) == 0) {
    goto LABEL_9;
  }
  int v11 = mkdirat(v6, *(const char **)(a2 + 16), a4);
  if ((v11 & 0x80000000) == 0) {
    *__error() = 0;
  }
  int v12 = *__error();
  if (!v12 || v12 == 17)
  {
    v10 &= ~0x200u;
LABEL_9:
    int v13 = openat(v6, *(const char **)(a2 + 16), v10, a4);
    int v27 = v13;
    if (v13 < 0)
    {
      int v15 = v13;
      CFIndex v16 = *__error();
      if (*(void *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        if (*(void *)(a1 + 16)) {
          int v17 = *(const char **)(a1 + 16);
        }
        else {
          int v17 = "[anonymous]";
        }
      }
      else if (*(void *)(a1 + 16))
      {
        int v17 = *(const char **)(a1 + 16);
      }
      else
      {
        int v17 = "[anonymous]";
      }
      uint64_t v20 = *(void *)(a2 + 16);
      int v21 = *__error();
      int v29 = 136446722;
      uint64_t v30 = v17;
      __int16 v31 = 2080;
      uint64_t v32 = v20;
      __int16 v33 = 1024;
      int v34 = v21;
      uint64_t v22 = (char *)_os_log_send_and_compose_impl();
      CFErrorRef Error = createError("_cryptex_bundle_open", "bundle.c", 1220, "com.apple.security.cryptex.posix", v16, 0, v22);
      free(v22);
    }
    else
    {
      CFErrorRef Error = 0;
      *a5 = claimfd_np();
      int v15 = v27;
    }
    if (v15 != -1 && close(v15) == -1) {
      _cryptex_bundle_new_asset_from_object_cold_1(&v28, &v29);
    }
    return Error;
  }
  if (*(void *)(a1 + 32))
  {
    os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
    CFTypeRef v18 = *(const char **)(a1 + 16);
    uint64_t v19 = *(void *)(a2 + 16);
    int v29 = 136446722;
    if (!v18) {
      CFTypeRef v18 = "[anonymous]";
    }
    uint64_t v30 = v18;
    __int16 v31 = 2080;
    uint64_t v32 = v19;
    __int16 v33 = 1024;
    int v34 = v11;
  }
  else
  {
    uint64_t v23 = *(const char **)(a1 + 16);
    if (!v23) {
      uint64_t v23 = "[anonymous]";
    }
    uint64_t v24 = *(void *)(a2 + 16);
    int v29 = 136446722;
    uint64_t v30 = v23;
    __int16 v31 = 2080;
    uint64_t v32 = v24;
    __int16 v33 = 1024;
    int v34 = v11;
  }
  int v25 = (char *)_os_log_send_and_compose_impl();
  CFErrorRef Error = createError("_cryptex_bundle_open", "bundle.c", 1210, "com.apple.security.cryptex.posix", v11, 0, v25);
  free(v25);
  return Error;
}

CFErrorRef _cryptex_bundle_write_manifest(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  CFErrorRef error = 0;
  int __fd = -1;
  uint64_t v42 = 0;
  memset(v41, 0, sizeof(v41));
  uint64_t v2 = (const void *)_CFXPCCreateCFObjectFromXPCObject();
  if (!v2)
  {
    uint64_t v9 = xpc_copy_debug_description();
    int v10 = (void *)v9;
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      int v11 = *(const char **)(a1 + 16);
      int v35 = 136446722;
      if (v11) {
        int v12 = v11;
      }
      else {
        int v12 = "[anonymous]";
      }
      int v36 = v12;
      __int16 v37 = 2080;
      uint64_t v38 = (uint64_t)v10;
      __int16 v39 = 1024;
      int v40 = 214;
    }
    else
    {
      int v21 = "[anonymous]";
      if (*(void *)(a1 + 16)) {
        int v21 = *(const char **)(a1 + 16);
      }
      int v35 = 136446722;
      int v36 = v21;
      __int16 v37 = 2080;
      uint64_t v38 = v9;
      __int16 v39 = 1024;
      int v40 = 214;
    }
    uint64_t v22 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v23 = createError("_cryptex_bundle_write_manifest", "bundle.c", 373, "com.apple.security.cryptex.posix", 214, 0, v22);
    free(v22);
    free(v10);
    goto LABEL_39;
  }
  CFDataRef v3 = CFPropertyListCreateData(0, v2, kCFPropertyListXMLFormat_v1_0, 0, &error);
  if (!v3)
  {
    CFStringRef v13 = CFErrorCopyFailureReason(error);
    CFStringRef v14 = v13;
    if (v13)
    {
      int v15 = _CFStringCopyUTF8String(v13);
      CFIndex v16 = v15;
    }
    else
    {
      int v15 = 0;
      CFIndex v16 = "unknown failure";
    }
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      BOOL v26 = *(const char **)(a1 + 16);
      int v35 = 136446722;
      if (v26) {
        int v27 = v26;
      }
      else {
        int v27 = "[anonymous]";
      }
      int v36 = v27;
      __int16 v37 = 2080;
      uint64_t v38 = (uint64_t)v16;
      __int16 v39 = 1024;
      int v40 = 222;
    }
    else
    {
      uint64_t v28 = "[anonymous]";
      if (*(void *)(a1 + 16)) {
        uint64_t v28 = *(const char **)(a1 + 16);
      }
      int v35 = 136446722;
      int v36 = v28;
      __int16 v37 = 2080;
      uint64_t v38 = (uint64_t)v16;
      __int16 v39 = 1024;
      int v40 = 222;
    }
    int v29 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v23 = createError("_cryptex_bundle_write_manifest", "bundle.c", 393, "com.apple.security.cryptex.posix", 222, 0, v29);
    free(v29);
    free(v15);
    if (v14) {
      CFRelease(v14);
    }
LABEL_39:
    buff_destroy(v41);
    CFDataRef v4 = 0;
    CFErrorRef v7 = 0;
    goto LABEL_47;
  }
  CFDataRef v4 = v3;
  BytePtr = CFDataGetBytePtr(v3);
  CFIndex Length = CFDataGetLength(v4);
  buff_init_signed(v41, 0, 0, (uint64_t)BytePtr, Length);
  CFErrorRef v7 = _cryptex_bundle_open(a1, (uint64_t)&_cryptex_bundle_object_manifest, 513, 0x1B6u, &__fd);
  if (v7)
  {
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      CFErrorRef v8 = *(const char **)(a1 + 16);
      if (!v8) {
        CFErrorRef v8 = "[anonymous]";
      }
      int v35 = 136446210;
      int v36 = v8;
    }
    else
    {
      uint64_t v24 = *(const char **)(a1 + 16);
      if (!v24) {
        uint64_t v24 = "[anonymous]";
      }
      int v35 = 136446210;
      int v36 = v24;
    }
    int v25 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v23 = createError("_cryptex_bundle_write_manifest", "bundle.c", 406, "com.apple.security.cryptex", 6, v7, v25);
    free(v25);
    int v17 = __fd;
  }
  else
  {
    int v17 = __fd;
    int v18 = _write_file(__fd, (uint64_t)v41);
    if (v18)
    {
      int v19 = v18;
      if (*(void *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        uint64_t v20 = *(const char **)(a1 + 16);
        if (!v20) {
          uint64_t v20 = "[anonymous]";
        }
        int v35 = 136446466;
        int v36 = v20;
        __int16 v37 = 1024;
        LODWORD(v38) = v19;
      }
      else
      {
        uint64_t v30 = *(const char **)(a1 + 16);
        if (!v30) {
          uint64_t v30 = "[anonymous]";
        }
        int v35 = 136446466;
        int v36 = v30;
        __int16 v37 = 1024;
        LODWORD(v38) = v18;
      }
      __int16 v31 = (char *)_os_log_send_and_compose_impl();
      CFErrorRef v23 = createError("_cryptex_bundle_write_manifest", "bundle.c", 413, "com.apple.security.cryptex.posix", v19, 0, v31);
      free(v31);
    }
    else
    {
      CFErrorRef v23 = 0;
    }
  }
  buff_destroy(v41);
  if (v17 != -1 && close(v17) == -1) {
    _cryptex_bundle_new_asset_from_object_cold_1(&v35, v41);
  }
LABEL_47:
  if (error) {
    CFRelease(error);
  }
  if (v2) {
    CFRelease(v2);
  }
  if (v4) {
    CFRelease(v4);
  }
  if (v7) {
    CFRelease(v7);
  }
  return v23;
}

uint64_t cryptex_bundle_copy_build_manifest2(uint64_t a1, xpc_object_t *a2, CFTypeRef *a3)
{
  int v6 = _cryptex_bundle_init(a1);
  if (v6)
  {
    CFErrorRef v7 = v6;
    if (*(void *)(a1 + 32)) {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
    }
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("cryptex_bundle_copy_build_manifest2", "bundle.c", 1533, "com.apple.security.cryptex", 6, v7, v9);
    free(v9);
    if (a3 && Error)
    {
      *a3 = CFRetain(Error);
    }
    else if (!Error)
    {
      uint64_t v8 = 1;
      goto LABEL_10;
    }
    CFRelease(Error);
    uint64_t v8 = 0;
LABEL_10:
    CFRelease(v7);
    return v8;
  }
  *a2 = xpc_retain(*(xpc_object_t *)(a1 + 80));
  return 1;
}

uint64_t cryptex_bundle_update_build_manifest2(uint64_t a1, void *a2, int a3, CFTypeRef *a4)
{
  int v6 = *(void **)(a1 + 80);
  if (v6)
  {
    if (v6 != a2)
    {
      xpc_release(v6);
      *(void *)(a1 + 80) = a2;
    }
    if (!a3) {
      return 1;
    }
    CFErrorRef v9 = _cryptex_bundle_write_manifest(a1);
    if (!v9) {
      return 1;
    }
    CFErrorRef v10 = v9;
    if (*(void *)(a1 + 32)) {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
    }
    int v12 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("cryptex_bundle_update_build_manifest2", "bundle.c", 1576, "com.apple.security.cryptex", 7, v10, v12);
  }
  else
  {
    if (*(void *)(a1 + 32)) {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
    }
    int v12 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("cryptex_bundle_update_build_manifest2", "bundle.c", 1561, "com.apple.security.cryptex", 6, 0, v12);
    CFErrorRef v10 = 0;
  }
  free(v12);
  if (a4 && Error)
  {
    *a4 = CFRetain(Error);
  }
  else if (!Error)
  {
    uint64_t v11 = 1;
    if (!v10) {
      return v11;
    }
    goto LABEL_18;
  }
  CFRelease(Error);
  uint64_t v11 = 0;
  if (v10) {
LABEL_18:
  }
    CFRelease(v10);
  return v11;
}

CFIndex cryptex_bundle_copy_cryptex(uint64_t a1, _OWORD *a2, const char *a3, void **a4)
{
  CFTypeRef v8 = 0;
  long long v4 = a2[1];
  v7[0] = *a2;
  v7[1] = v4;
  v7[2] = a2[2];
  if (cryptex_bundle_copy_cryptex2(a1, v7, a3, a4, &v8)) {
    TopLevelPosixCFErrorRef Error = 0;
  }
  else {
    TopLevelPosixCFErrorRef Error = _CFErrorGetTopLevelPosixError((CFIndex)v8);
  }
  if (v8) {
    CFRelease(v8);
  }
  return TopLevelPosixError;
}

CFIndex cryptex_bundle_copy_cryptex_for_chip(uint64_t a1, uint64_t a2, const char *a3, void **a4)
{
  CFTypeRef cf = 0;
  if (cryptex_bundle_copy_cryptex_for_chip2(a1, a2, a3, a4, &cf)) {
    TopLevelPosixCFErrorRef Error = 0;
  }
  else {
    TopLevelPosixCFErrorRef Error = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  }
  if (cf) {
    CFRelease(cf);
  }
  return TopLevelPosixError;
}

CFIndex cryptex_bundle_set_cryptex(uint64_t a1, uint64_t a2)
{
  CFTypeRef cf = 0;
  if (cryptex_bundle_set_cryptex2(a1, a2, &cf)) {
    TopLevelPosixCFErrorRef Error = 0;
  }
  else {
    TopLevelPosixCFErrorRef Error = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  }
  if (cf) {
    CFRelease(cf);
  }
  return TopLevelPosixError;
}

CFIndex cryptex_bundle_write(uint64_t a1, _DWORD *a2)
{
  CFTypeRef cf = 0;
  if (cryptex_bundle_write2(a1, a2, &cf)) {
    TopLevelPosixCFErrorRef Error = 0;
  }
  else {
    TopLevelPosixCFErrorRef Error = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  }
  if (cf) {
    CFRelease(cf);
  }
  return TopLevelPosixError;
}

CFIndex cryptex_bundle_copy_build_manifest(uint64_t a1, xpc_object_t *a2)
{
  CFTypeRef cf = 0;
  if (cryptex_bundle_copy_build_manifest2(a1, a2, &cf)) {
    TopLevelPosixCFErrorRef Error = 0;
  }
  else {
    TopLevelPosixCFErrorRef Error = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  }
  if (cf) {
    CFRelease(cf);
  }
  return TopLevelPosixError;
}

CFIndex cryptex_bundle_update_build_manifest(uint64_t a1, void *a2, int a3)
{
  CFTypeRef cf = 0;
  if (cryptex_bundle_update_build_manifest2(a1, a2, a3, &cf)) {
    TopLevelPosixCFErrorRef Error = 0;
  }
  else {
    TopLevelPosixCFErrorRef Error = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  }
  if (cf) {
    CFRelease(cf);
  }
  return TopLevelPosixError;
}

uint64_t _cryptex_populate_cryptex1_properties(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  xpc_object_t v6 = _xpc_plist_value_copy((uint64_t)&_cryptex1_nonce_domain, a3);
  if (v6)
  {
    CFErrorRef v7 = v6;
    if ((unint64_t)xpc_int64_get_value(v6) >> 32)
    {
      CFTypeRef v8 = *(const char **)(a1 + 16);
      int v9 = *__error();
      CFErrorRef v10 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = "[anonymous]";
        if (v8) {
          uint64_t v11 = v8;
        }
        *(_DWORD *)buf = 136446722;
        int v58 = v11;
        __int16 v59 = 2080;
        long long v60 = "Cryptex1,NonceDomain";
        __int16 v61 = 1024;
        int v62 = 84;
        _os_log_impl(&dword_21DAF1000, v10, OS_LOG_TYPE_ERROR, "%{public}s: Manifest value is invalid at key: %s: %{darwin.errno}d", buf, 0x1Cu);
      }
      *__error() = v9;
      uint64_t v12 = 84;
      goto LABEL_64;
    }
    xpc_object_t v17 = _xpc_plist_value_copy((uint64_t)&_cryptex1_version, a3);
    if (!v17)
    {
      int v25 = *(const char **)(a1 + 16);
      int v26 = *__error();
      int v27 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = "[anonymous]";
        if (v25) {
          uint64_t v28 = v25;
        }
        *(_DWORD *)buf = 136446722;
        int v58 = v28;
        __int16 v59 = 2080;
        long long v60 = "Cryptex1,Version";
        __int16 v61 = 1024;
        int v62 = 22;
        _os_log_impl(&dword_21DAF1000, v27, OS_LOG_TYPE_ERROR, "%{public}s: Manifest missing required key: %s: %{darwin.errno}d", buf, 0x1Cu);
      }
      *__error() = v26;
      uint64_t v12 = 22;
      goto LABEL_64;
    }
    int v18 = v17;
    if (!xpc_string_get_string_ptr(v17))
    {
      int v29 = *(const char **)(a1 + 16);
      int v30 = *__error();
      __int16 v31 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = "[anonymous]";
        if (v29) {
          uint64_t v32 = v29;
        }
        *(_DWORD *)buf = 136446722;
        int v58 = v32;
        __int16 v59 = 2080;
        long long v60 = "Cryptex1,Version";
        __int16 v61 = 1024;
        int v62 = 22;
        _os_log_impl(&dword_21DAF1000, v31, OS_LOG_TYPE_ERROR, "%{public}s: Manifest value is invalid at key: %s: %{darwin.errno}d", buf, 0x1Cu);
      }
      *__error() = v30;
      uint64_t v12 = 22;
      goto LABEL_63;
    }
    xpc_object_t v19 = _xpc_plist_value_copy((uint64_t)&_cryptex1_styp, a3);
    xpc_object_t object = v19;
    if (v19)
    {
      if ((unint64_t)xpc_int64_get_value(v19) >> 32)
      {
        uint64_t v20 = *(const char **)(a1 + 16);
        int v21 = *__error();
        uint64_t v22 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          CFErrorRef v23 = "[anonymous]";
          if (v20) {
            CFErrorRef v23 = v20;
          }
          *(_DWORD *)buf = 136446722;
          int v58 = v23;
          __int16 v59 = 2080;
          long long v60 = "Cryptex1,SubType";
          __int16 v61 = 1024;
          int v62 = 22;
          _os_log_impl(&dword_21DAF1000, v22, OS_LOG_TYPE_ERROR, "%{public}s: Manifest value is invalid at key: %s: %{darwin.errno}d", buf, 0x1Cu);
        }
        *__error() = v21;
        uint64_t v12 = 22;
        uint64_t v24 = object;
LABEL_62:
        os_release(v24);
LABEL_63:
        os_release(v18);
LABEL_64:
        os_release(v7);
        return v12;
      }
    }
    else
    {
      __int16 v33 = *(const char **)(a1 + 16);
      int v34 = *__error();
      int v35 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        int v36 = "[anonymous]";
        if (v33) {
          int v36 = v33;
        }
        *(_DWORD *)buf = 136446466;
        int v58 = v36;
        __int16 v59 = 1024;
        LODWORD(v60) = 0;
        _os_log_impl(&dword_21DAF1000, v35, OS_LOG_TYPE_INFO, "%{public}s: Assuming default SubType: %u", buf, 0x12u);
      }
      *__error() = v34;
    }
    xpc_object_t v37 = _xpc_plist_value_copy((uint64_t)&_cryptex1_preauthorization_version, a3);
    if (v37)
    {
      uint64_t v38 = v37;
      if (xpc_string_get_string_ptr(v37))
      {
        xpc_object_t v39 = _xpc_plist_value_copy((uint64_t)&_cryptex1_use_product_class, a3);
        int v40 = v39;
        if (v39) {
          xpc_BOOL_get_value(v39);
        }
        uint64_t v49 = cryptex_core_cx1_properties_create();
        if (v49)
        {
          __int16 v50 = (void *)v49;
          cryptex_core_set_cryptex1_properties();
          os_release(v50);
          uint64_t v12 = 0;
        }
        else
        {
          __int16 v51 = *(const char **)(a2 + 16);
          int v52 = *__error();
          int v53 = *(NSObject **)(a2 + 32);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            xpc_object_t v54 = "[anonymous]";
            if (v51) {
              xpc_object_t v54 = v51;
            }
            *(_DWORD *)buf = 136446466;
            int v58 = v54;
            __int16 v59 = 1024;
            LODWORD(v60) = 12;
            _os_log_impl(&dword_21DAF1000, v53, OS_LOG_TYPE_ERROR, "%{public}s: Failed to create Cryptex1 properties.: %{darwin.errno}d", buf, 0x12u);
          }
          *__error() = v52;
          uint64_t v12 = 12;
        }
        if (v40) {
          os_release(v40);
        }
      }
      else
      {
        int v45 = *(const char **)(a1 + 16);
        int v46 = *__error();
        uint64_t v47 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          uint64_t v48 = "[anonymous]";
          if (v45) {
            uint64_t v48 = v45;
          }
          *(_DWORD *)buf = 136446722;
          int v58 = v48;
          __int16 v59 = 2080;
          long long v60 = "Cryptex1,PreauthorizationVersion";
          __int16 v61 = 1024;
          int v62 = 22;
          _os_log_impl(&dword_21DAF1000, v47, OS_LOG_TYPE_ERROR, "%{public}s: Manifest value is invalid at key: %s: %{darwin.errno}d", buf, 0x1Cu);
        }
        *__error() = v46;
        uint64_t v12 = 22;
      }
      os_release(v38);
    }
    else
    {
      int v41 = *(const char **)(a1 + 16);
      int v42 = *__error();
      uint64_t v43 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        xpc_object_t v44 = "[anonymous]";
        if (v41) {
          xpc_object_t v44 = v41;
        }
        *(_DWORD *)buf = 136446722;
        int v58 = v44;
        __int16 v59 = 2080;
        long long v60 = "Cryptex1,PreauthorizationVersion";
        __int16 v61 = 1024;
        int v62 = 22;
        _os_log_impl(&dword_21DAF1000, v43, OS_LOG_TYPE_ERROR, "%{public}s: Manifest missing required key: %s: %{darwin.errno}d", buf, 0x1Cu);
      }
      *__error() = v42;
      uint64_t v12 = 22;
    }
    uint64_t v24 = object;
    if (!object) {
      goto LABEL_63;
    }
    goto LABEL_62;
  }
  CFStringRef v13 = *(const char **)(a1 + 16);
  int v14 = *__error();
  int v15 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    CFIndex v16 = "[anonymous]";
    if (v13) {
      CFIndex v16 = v13;
    }
    *(_DWORD *)buf = 136446722;
    int v58 = v16;
    __int16 v59 = 2080;
    long long v60 = "Cryptex1,NonceDomain";
    __int16 v61 = 1024;
    int v62 = 22;
    _os_log_impl(&dword_21DAF1000, v15, OS_LOG_TYPE_ERROR, "%{public}s: Manifest missing required key: %s: %{darwin.errno}d", buf, 0x1Cu);
  }
  *__error() = v14;
  return 22;
}

uint64_t ___cryptex_bundle_manifest_remove_build_identity_block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  xpc_object_t value = xpc_dictionary_get_value(xdict, "Info");
  string = xpc_dictionary_get_string(value, "Variant");
  CFErrorRef v7 = xpc_dictionary_get_string(xdict, "ApBoardID");
  CFTypeRef v8 = xpc_dictionary_get_string(xdict, "ApChipID");
  int v9 = xpc_dictionary_get_string(xdict, "ApSecurityDomain");
  int v10 = _strtou32(v7, 0, 0);
  if (*__error())
  {
    uint64_t v11 = *(const char **)(*(void *)(a1 + 32) + 16);
    int v12 = *__error();
    CFStringRef v13 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      if (!v11) {
        uint64_t v11 = "[anonymous]";
      }
      int v14 = *__error();
      int v24 = 136446722;
      int v25 = v11;
      __int16 v26 = 2080;
      int v27 = v7;
      __int16 v28 = 1024;
      int v29 = v14;
      int v15 = "%{public}s: unable to convert to uint for BORD: %s: %{darwin.errno}d";
LABEL_16:
      _os_log_impl(&dword_21DAF1000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v24, 0x1Cu);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  int v16 = _strtou32(v8, 0, 0);
  if (*__error())
  {
    xpc_object_t v17 = *(const char **)(*(void *)(a1 + 32) + 16);
    int v12 = *__error();
    CFStringRef v13 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      if (!v17) {
        xpc_object_t v17 = "[anonymous]";
      }
      int v18 = *__error();
      int v24 = 136446722;
      int v25 = v17;
      __int16 v26 = 2080;
      int v27 = v8;
      __int16 v28 = 1024;
      int v29 = v18;
      int v15 = "%{public}s: unable to convert to uint for CHIP: %s: %{darwin.errno}d";
      goto LABEL_16;
    }
LABEL_17:
    *__error() = v12;
    return 1;
  }
  int v19 = _strtou32(v9, 0, 0);
  if (*__error())
  {
    uint64_t v20 = *(const char **)(*(void *)(a1 + 32) + 16);
    int v12 = *__error();
    CFStringRef v13 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      if (!v20) {
        uint64_t v20 = "[anonymous]";
      }
      int v21 = *__error();
      int v24 = 136446722;
      int v25 = v20;
      __int16 v26 = 2080;
      int v27 = v9;
      __int16 v28 = 1024;
      int v29 = v21;
      int v15 = "%{public}s: unable to convert to uint for SDOM: %s: %{darwin.errno}d";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  uint64_t v23 = *(void *)(a1 + 40);
  if (strcmp(*(const char **)(v23 + 16), string)
    || *(_DWORD *)(v23 + 72) != v10
    || *(_DWORD *)(v23 + 76) != v16
    || *(_DWORD *)(v23 + 80) != v19)
  {
    xpc_array_append_value(*(xpc_object_t *)(a1 + 48), xdict);
  }
  return 1;
}

char *_cryptex_bundle_default_asset_path(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(const char **)(a1 + 16);
  long long v4 = *(const char **)(*(void *)(a2 + 8) + 40);
  uint64_t v5 = 0;
  if (asprintf(&v5, "%s/%s/%s", "Cryptex", v2, v4) < 0) {
    _cryptex_bundle_add_cryptex_assets_cold_1(&v6, v7);
  }
  return v5;
}

Collation *collation_create()
{
  return objc_alloc_init(Collation);
}

uint64_t collation_create_for_user(uint64_t a1)
{
  uint64_t v2 = [Collation alloc];

  return (uint64_t)[(Collation *)v2 initForUser:a1];
}

uint64_t collation_get_id(void *a1)
{
  uint64_t v1 = [a1 ccore];
  uint64_t v2 = [v1 getID];

  return v2;
}

void collation_foreach(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 ccore];
  [v4 enumerateElements:v3];
}

void *collation_get_description(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 package];
  uint64_t v10 = 0;
  id v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:1 error:&v10];
  if (v10)
  {
    id v4 = [v1 log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      collation_get_description_cold_1(v4);
    }
  }
  uint64_t v5 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
  [v1 setColl_description:v5];

  uint64_t v6 = [v1 coll_description];

  if (v6)
  {
    [v1 coll_description];
    id v7 = objc_claimAutoreleasedReturnValue();
    uint64_t v8 = (void *)[v7 UTF8String];
  }
  else
  {
    uint64_t v8 = &unk_21DB1FB05;
  }

  return v8;
}

char *collation_copy_mount_point_for_cryptex_bundle_id(void *a1, uint64_t a2)
{
  id v3 = NSString;
  id v4 = a1;
  uint64_t v5 = [v3 stringWithUTF8String:a2];
  uint64_t v6 = [v4 mountPointOfBundleID:v5];

  id v7 = v6;
  uint64_t v8 = strdup((const char *)[v7 UTF8String]);

  return v8;
}

char *collation_copy_search_path(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = [NSString stringWithUTF8String:a2];
  if (a3)
  {
    a3 = [NSString stringWithUTF8String:a3];
  }
  id v7 = [v5 getValidPaths:v6 forLabels:a3];
  uint64_t v8 = strdup((const char *)[v7 UTF8String]);

  return v8;
}

uint64_t collation_element_scope_get_description(uint64_t a1)
{
  id v1 = [MEMORY[0x263F8C3D0] scopeToString:a1];
  uint64_t v2 = [v1 UTF8String];

  return v2;
}

uint64_t cryptex_mount(void *a1, void *a2, char **a3, CFTypeRef *a4)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v6 = a2;
  cf[0] = 0;
  xpc_object_t v73 = dispatch_get_global_queue(0, 0);
  uint64_t core = _cryptex_get_core((uint64_t)v6);
  if (core)
  {
    uint64_t v8 = _mount_log();

    if (v8)
    {
      int v9 = _mount_log();
      os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = core;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = core;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("cryptex_mount", "cryptex_mount.m", 49, "com.apple.security.cryptex", 2, 0, v10);
    int v14 = 0;
    CFStringRef v13 = 0;
    uint64_t v11 = 0;
    goto LABEL_54;
  }
  uint64_t v11 = _cryptex_get_core((uint64_t)a1);
  if ((cryptex_core_is_cryptex1() & 1) == 0)
  {
    int v16 = _mount_log();

    if (v16)
    {
      xpc_object_t v17 = _mount_log();
      os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v18 = createError("cryptex_mount", "cryptex_mount.m", 57, "com.apple.security.cryptex", 2, 0, v10);
    goto LABEL_53;
  }
  if (!cryptex_core_get_asset())
  {
    int v19 = _mount_log();

    if (v19)
    {
      uint64_t v20 = _mount_log();
      os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v18 = createError("cryptex_mount", "cryptex_mount.m", 64, "com.apple.security.cryptex", 2, 0, v10);
    goto LABEL_53;
  }
  if (!cryptex_core_get_image_asset())
  {
    int v21 = _mount_log();

    if (v21)
    {
      uint64_t v22 = _mount_log();
      os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v18 = createError("cryptex_mount", "cryptex_mount.m", 71, "com.apple.security.cryptex", 2, 0, v10);
    goto LABEL_53;
  }
  if (!cryptex_core_get_tc_asset())
  {
    uint64_t v23 = _mount_log();

    if (v23)
    {
      int v24 = _mount_log();
      os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v18 = createError("cryptex_mount", "cryptex_mount.m", 78, "com.apple.security.cryptex", 2, 0, v10);
    goto LABEL_53;
  }
  if (!cryptex_core_get_info_asset())
  {
    int v25 = _mount_log();

    if (v25)
    {
      __int16 v26 = _mount_log();
      os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v18 = createError("cryptex_mount", "cryptex_mount.m", 85, "com.apple.security.cryptex", 2, 0, v10);
    goto LABEL_53;
  }
  if (!cryptex_core_get_volumehash_asset())
  {
    int v12 = _mount_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DAF1000, v12, OS_LOG_TYPE_INFO, "No volume root hash present.", buf, 2u);
    }
  }
  CFStringRef v13 = cryptex_core_get_cryptex1_properties();
  if (!v13)
  {
    int v27 = _mount_log();

    if (v27)
    {
      __int16 v28 = _mount_log();
      os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v18 = createError("cryptex_mount", "cryptex_mount.m", 97, "com.apple.security.cryptex", 2, 0, v10);
LABEL_53:
    CFErrorRef Error = v18;
    int v14 = 0;
    CFStringRef v13 = 0;
LABEL_54:
    uint64_t v38 = 0;
    id v32 = 0;
LABEL_55:
    int v36 = 0;
    goto LABEL_56;
  }
  int v14 = (void *)cryptex_core_cx1_copy_xpc_dictionary();
  if (!v14)
  {
    int v29 = _mount_log();

    if (v29)
    {
      uint64_t v30 = _mount_log();
      os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("cryptex_mount", "cryptex_mount.m", 104, "com.apple.security.cryptex", 2, 0, v10);
    int v14 = 0;
    goto LABEL_54;
  }
  mount_request = (const void *)mount_interface_create_mount_request();
  id v32 = 0;
  if (mount_request)
  {
    __int16 v33 = _mount_log();

    if (v33)
    {
      int v34 = _mount_log();
      os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v43 = createError("cryptex_mount", "cryptex_mount.m", 122, "com.apple.security.cryptex", 2, mount_request, v10);
    uint64_t v38 = 0;
    int v36 = 0;
LABEL_66:
    CFErrorRef Error = v43;
    goto LABEL_56;
  }
  connection = (_xpc_connection_s *)cryptex_xpc_create_connection();
  int v36 = connection;
  if (!connection)
  {
    xpc_object_t v44 = _mount_log();

    if (v44)
    {
      int v45 = _mount_log();
      os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("cryptex_mount", "cryptex_mount.m", 129, "com.apple.security.cryptex", 2, 0, v10);
    uint64_t v38 = 0;
    goto LABEL_55;
  }
  xpc_object_t v37 = xpc_connection_send_message_with_reply_sync(connection, v32);
  uint64_t v38 = v37;
  if (v37)
  {
    if (MEMORY[0x223C12420](v37) == MEMORY[0x263EF8720])
    {
      uint64_t v10 = (char *)xpc_copy_debug_description();
      uint64_t v48 = _mount_log();

      if (v48)
      {
        uint64_t v49 = _mount_log();
        os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v10;
        __s1 = (char *)_os_log_send_and_compose_impl();
      }
      else
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v10;
        __s1 = (char *)_os_log_send_and_compose_impl();
      }
      CFErrorRef v50 = createError("cryptex_mount", "cryptex_mount.m", 141, "com.apple.security.cryptex", 2, 0, __s1);
    }
    else
    {
      if (MEMORY[0x223C12420](v38) == MEMORY[0x263EF8708])
      {
        int cferr = _xpc_dictionary_try_get_cferr(v38, "MOUNT:ERROR_DICT", (CFErrorRef *)cf);
        if ((cferr | 2) == 2)
        {
          CFErrorRef Error = (CFErrorRef)cf[0];
          if (cf[0]
            && (_CFErrorHasDomainAndCode((CFDictionaryRef)cf[0], @"com.apple.security.cryptex", 1) & 1) == 0)
          {
            uint64_t v56 = _mount_log();

            if (v56)
            {
              __int16 v57 = _mount_log();
              os_log_type_enabled(v57, OS_LOG_TYPE_ERROR);
              *(_DWORD *)buf = 138543362;
              *(CFTypeRef *)&uint8_t buf[4] = cf[0];
              uint64_t v10 = (char *)_os_log_send_and_compose_impl();
            }
            else
            {
              *(_DWORD *)buf = 138543362;
              *(CFTypeRef *)&uint8_t buf[4] = cf[0];
              uint64_t v10 = (char *)_os_log_send_and_compose_impl();
            }
            CFErrorRef v43 = createError("cryptex_mount", "cryptex_mount.m", 173, "com.apple.security.cryptex", 2, cf[0], v10);
          }
          else
          {
            __s1a = (char *)xpc_dictionary_get_string(v38, "MOUNT:MOUNTPATH_STR");
            if (__s1a)
            {
              if (a3)
              {
                uint64_t v69 = Error;
                if (_dispatch_is_multithreaded())
                {
                  while (1)
                  {
                    int v52 = strdup(__s1a);
                    if (v52) {
                      break;
                    }
                    __os_temporary_resource_shortage();
                  }
                  long long v60 = v52;
                }
                else
                {
                  long long v60 = strdup(__s1a);
                  __s1b = (char *)strlen(__s1a);
                  if (!v60)
                  {
                    cf[1] = 0;
                    long long v85 = 0u;
                    long long v86 = 0u;
                    long long v83 = 0u;
                    long long v84 = 0u;
                    *(_OWORD *)buf = 0u;
                    __int16 v61 = MEMORY[0x263EF8438];
                    id v62 = MEMORY[0x263EF8438];
                    os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);
                    uint64_t v63 = __error();
                    uint64_t v64 = strerror(*v63);
                    int v76 = 136315650;
                    int v77 = "known-constant allocation";
                    __int16 v78 = 2048;
                    uint64_t v79 = __s1b;
                    __int16 v80 = 2080;
                    long long v81 = v64;
                    uint64_t v65 = (void *)MEMORY[0x263EF8438];
                    _os_log_send_and_compose_impl();

                    uint64_t v66 = _os_crash_msg();
                    cryptex_mount_cold_1(v66);
                  }
                }
                *a3 = v60;
                CFErrorRef Error = v69;
              }
              if (!Error)
              {
                uint64_t v41 = 1;
                goto LABEL_59;
              }
              long long v67 = _mount_log();

              if (v67)
              {
                int v68 = _mount_log();
                os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
                *(_WORD *)buf = 0;
                uint64_t v10 = (char *)_os_log_send_and_compose_impl();
              }
              else
              {
                *(_WORD *)buf = 0;
                uint64_t v10 = (char *)_os_log_send_and_compose_impl();
              }
              CFErrorRef v43 = createError("cryptex_mount", "cryptex_mount.m", 192, "com.apple.security.cryptex", 1, 0, v10);
            }
            else
            {
              int v58 = _mount_log();

              if (v58)
              {
                __int16 v59 = _mount_log();
                os_log_type_enabled(v59, OS_LOG_TYPE_ERROR);
                *(_DWORD *)buf = 136315138;
                *(void *)&uint8_t buf[4] = "MOUNT:MOUNTPATH_STR";
                uint64_t v10 = (char *)_os_log_send_and_compose_impl();
              }
              else
              {
                *(_DWORD *)buf = 136315138;
                *(void *)&uint8_t buf[4] = "MOUNT:MOUNTPATH_STR";
                uint64_t v10 = (char *)_os_log_send_and_compose_impl();
              }
              CFErrorRef v43 = createError("cryptex_mount", "cryptex_mount.m", 181, "com.apple.security.cryptex", 2, 0, v10);
            }
          }
        }
        else
        {
          int v53 = _mount_log();

          if (v53)
          {
            xpc_object_t v54 = _mount_log();
            os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = cferr;
            __int16 v55 = v54;
            uint64_t v10 = (char *)_os_log_send_and_compose_impl();
          }
          else
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = cferr;
            uint64_t v10 = (char *)_os_log_send_and_compose_impl();
          }
          CFErrorRef v43 = createError("cryptex_mount", "cryptex_mount.m", 160, "com.apple.security.cryptex", 2, 0, v10);
        }
        goto LABEL_66;
      }
      uint64_t v10 = (char *)xpc_copy_debug_description();
      xpc_object_t v39 = _mount_log();

      if (v39)
      {
        int v40 = _mount_log();
        os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v10;
        __s1 = (char *)_os_log_send_and_compose_impl();
      }
      else
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v10;
        __s1 = (char *)_os_log_send_and_compose_impl();
      }
      CFErrorRef v50 = createError("cryptex_mount", "cryptex_mount.m", 146, "com.apple.security.cryptex", 2, 0, __s1);
    }
    CFErrorRef Error = v50;
    free(__s1);
    goto LABEL_56;
  }
  int v46 = _mount_log();

  if (v46)
  {
    uint64_t v47 = _mount_log();
    os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
    *(_WORD *)buf = 0;
    uint64_t v10 = (char *)_os_log_send_and_compose_impl();
  }
  else
  {
    *(_WORD *)buf = 0;
    uint64_t v10 = (char *)_os_log_send_and_compose_impl();
  }
  CFErrorRef Error = createError("cryptex_mount", "cryptex_mount.m", 136, "com.apple.security.cryptex", 2, 0, v10);
  uint64_t v38 = 0;
LABEL_56:
  free(v10);
  uint64_t v41 = 0;
  if (a4 && Error)
  {
    uint64_t v41 = 0;
    *a4 = CFRetain(Error);
  }
LABEL_59:

  if (Error) {
    CFRelease(Error);
  }
  if (cf[0]) {
    CFRelease(cf[0]);
  }

  return v41;
}

void sub_21DB06D6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(exception_object);
}

id _mount_log()
{
  if (_mount_log_onceToken != -1) {
    dispatch_once(&_mount_log_onceToken, &__block_literal_global_1);
  }
  uint64_t v0 = (void *)_mount_log_osl;

  return v0;
}

uint64_t cryptex_unmount(void *a1, void *a2, CFTypeRef *a3)
{
  *(void *)&v53[5] = *MEMORY[0x263EF8340];
  id v5 = a2;
  CFTypeRef cf = 0;
  id v6 = dispatch_get_global_queue(0, 0);
  if (v5) {
    _cryptex_attr_get_mount_flags((uint64_t)v5);
  }
  id v7 = _cryptex_get_core((uint64_t)a1);
  if ((cryptex_core_is_cryptex1() & 1) == 0)
  {
    int v14 = _mount_log();

    if (v14)
    {
      int v15 = _mount_log();
      os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
      LOWORD(v52) = 0;
      CFStringRef v13 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      LOWORD(v52) = 0;
      CFStringRef v13 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("cryptex_unmount", "cryptex_mount.m", 229, "com.apple.security.cryptex", 2, 0, v13);
    goto LABEL_30;
  }
  uint64_t info_asset = cryptex_core_get_info_asset();
  if (!info_asset)
  {
    xpc_object_t v17 = _mount_log();

    if (v17)
    {
      CFErrorRef v18 = _mount_log();
      os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
      int v52 = 136315138;
      *(void *)int v53 = MEMORY[0x28];
      CFStringRef v13 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      int v52 = 136315138;
      *(void *)int v53 = MEMORY[0x28];
      CFStringRef v13 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("cryptex_unmount", "cryptex_mount.m", 236, "com.apple.security.cryptex", 2, 0, v13);
    goto LABEL_30;
  }
  if ((*(_DWORD *)(info_asset + 16) & 0x80000000) != 0)
  {
    int v19 = _mount_log();

    if (v19)
    {
      uint64_t v20 = _mount_log();
      os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
      int v52 = 136315138;
      *(void *)int v53 = MEMORY[0x28];
      CFStringRef v13 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      int v52 = 136315138;
      *(void *)int v53 = MEMORY[0x28];
      CFStringRef v13 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("cryptex_unmount", "cryptex_mount.m", 243, "com.apple.security.cryptex", 2, 0, v13);
LABEL_30:
    CFErrorRef v29 = Error;
    int v24 = 0;
    id v10 = 0;
LABEL_31:
    uint64_t v22 = 0;
    goto LABEL_32;
  }
  unmount_request = (const void *)mount_interface_create_unmount_request();
  id v10 = 0;
  if (unmount_request)
  {
    uint64_t v11 = _mount_log();

    if (v11)
    {
      int v12 = _mount_log();
      os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
      LOWORD(v52) = 0;
      CFStringRef v13 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      LOWORD(v52) = 0;
      CFStringRef v13 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v28 = createError("cryptex_unmount", "cryptex_mount.m", 250, "com.apple.security.cryptex", 2, unmount_request, v13);
    int v24 = 0;
    uint64_t v22 = 0;
LABEL_27:
    CFErrorRef v29 = v28;
    goto LABEL_32;
  }
  connection = (_xpc_connection_s *)cryptex_xpc_create_connection();
  uint64_t v22 = connection;
  if (!connection)
  {
    id v32 = _mount_log();

    if (v32)
    {
      __int16 v33 = _mount_log();
      os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
      LOWORD(v52) = 0;
      CFStringRef v13 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      LOWORD(v52) = 0;
      CFStringRef v13 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v29 = createError("cryptex_unmount", "cryptex_mount.m", 257, "com.apple.security.cryptex", 2, 0, v13);
    int v24 = 0;
    goto LABEL_31;
  }
  xpc_object_t v23 = xpc_connection_send_message_with_reply_sync(connection, v10);
  int v24 = v23;
  if (v23)
  {
    if (MEMORY[0x223C12420](v23) == MEMORY[0x263EF8720])
    {
      CFStringRef v13 = (char *)xpc_copy_debug_description();
      int v36 = _mount_log();

      if (v36)
      {
        xpc_object_t v37 = _mount_log();
        os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
        int v52 = 136315138;
        *(void *)int v53 = v13;
        cStrb = (char *)_os_log_send_and_compose_impl();

        uint64_t v38 = cStrb;
      }
      else
      {
        int v52 = 136315138;
        *(void *)int v53 = v13;
        uint64_t v38 = (char *)_os_log_send_and_compose_impl();
      }
      cStr = v38;
      CFErrorRef v42 = createError("cryptex_unmount", "cryptex_mount.m", 269, "com.apple.security.cryptex", 2, 0, v38);
    }
    else
    {
      if (MEMORY[0x223C12420](v24) == MEMORY[0x263EF8708])
      {
        int cferr = _xpc_dictionary_try_get_cferr(v24, "UNMOUNT:ERROR_DICT", (CFErrorRef *)&cf);
        if ((cferr | 2) == 2)
        {
          if (!cf)
          {
            CFErrorRef v29 = 0;
            uint64_t v30 = 1;
            goto LABEL_35;
          }
          int v40 = _mount_log();

          if (v40)
          {
            uint64_t v41 = _mount_log();
            os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
            int v52 = 138543362;
            *(void *)int v53 = cf;
            CFStringRef v13 = (char *)_os_log_send_and_compose_impl();
          }
          else
          {
            int v52 = 138543362;
            *(void *)int v53 = cf;
            CFStringRef v13 = (char *)_os_log_send_and_compose_impl();
          }
          CFErrorRef v28 = createError("cryptex_unmount", "cryptex_mount.m", 297, "com.apple.security.cryptex", 2, cf, v13);
        }
        else
        {
          CFErrorRef v43 = _mount_log();

          if (v43)
          {
            xpc_object_t v44 = _mount_log();
            os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
            int v45 = strerror(cferr);
            int v52 = 67109378;
            v53[0] = cferr;
            LOWORD(v53[1]) = 2080;
            *(void *)((char *)&v53[1] + 2) = v45;
          }
          else
          {
            id v46 = MEMORY[0x263EF8438];
            uint64_t v47 = strerror(cferr);
            int v52 = 67109378;
            v53[0] = cferr;
            LOWORD(v53[1]) = 2080;
            *(void *)((char *)&v53[1] + 2) = v47;
            xpc_object_t v44 = MEMORY[0x263EF8438];
          }
          CFStringRef v13 = (char *)_os_log_send_and_compose_impl();

          CFErrorRef v28 = createError("cryptex_unmount", "cryptex_mount.m", 288, "com.apple.security.cryptex", 2, 0, v13);
        }
        goto LABEL_27;
      }
      CFStringRef v13 = (char *)xpc_copy_debug_description();
      int v25 = _mount_log();

      if (v25)
      {
        __int16 v26 = _mount_log();
        os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
        int v52 = 136315138;
        *(void *)int v53 = v13;
        cStra = (char *)_os_log_send_and_compose_impl();

        int v27 = cStra;
      }
      else
      {
        int v52 = 136315138;
        *(void *)int v53 = v13;
        int v27 = (char *)_os_log_send_and_compose_impl();
      }
      cStr = v27;
      CFErrorRef v42 = createError("cryptex_unmount", "cryptex_mount.m", 274, "com.apple.security.cryptex", 2, 0, v27);
    }
    CFErrorRef v29 = v42;
    free(cStr);
    goto LABEL_32;
  }
  int v34 = _mount_log();

  if (v34)
  {
    int v35 = _mount_log();
    os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    LOWORD(v52) = 0;
    CFStringRef v13 = (char *)_os_log_send_and_compose_impl();
  }
  else
  {
    LOWORD(v52) = 0;
    CFStringRef v13 = (char *)_os_log_send_and_compose_impl();
  }
  CFErrorRef v29 = createError("cryptex_unmount", "cryptex_mount.m", 264, "com.apple.security.cryptex", 2, 0, v13);
  int v24 = 0;
LABEL_32:
  free(v13);
  uint64_t v30 = 0;
  if (a3 && v29)
  {
    uint64_t v30 = 0;
    *a3 = CFRetain(v29);
  }
LABEL_35:

  if (v29) {
    CFRelease(v29);
  }
  if (cf) {
    CFRelease(cf);
  }

  return v30;
}

void sub_21DB07B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(a1);
}

uint64_t ___mount_log_block_invoke()
{
  _mount_log_osl = (uint64_t)os_log_create("com.apple.libcryptex", "mount");

  return MEMORY[0x270F9A758]();
}

uint64_t cryptex_identity_set_host_identity(unsigned int *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  memset(v3, 0, sizeof(v3));
  LOWORD(v3[0]) = 6;
  if (!a1) {
    return 22;
  }
  uint64_t result = img4_chip_instantiate();
  if (!result) {
    return cryptex_identity_set_chip(a1, (uint64_t)v3);
  }
  return result;
}

uint64_t cryptex_identity_set_chip(unsigned int *a1, uint64_t a2)
{
  uint64_t v2 = 22;
  if (a1)
  {
    if (a2)
    {
      *((void *)a1 + 1) = 0;
      *((void *)a1 + 2) = *(void *)(a2 + 28);
      a1[6] = *(_DWORD *)(a2 + 36);
      uint64_t v2 = *a1;
      if (v2)
      {
        uint64_t v3 = *(void *)(a2 + 16);
        if ((v3 & 0x58000) != 0) {
          return 0;
        }
        *((void *)a1 + 1) = 6;
        a1[10] = *(_DWORD *)(a2 + 140);
        *(void *)(a1 + 7) = *(void *)(a2 + 128);
        if ((v3 & 0x20000) != 0)
        {
          return 0;
        }
        else
        {
          uint64_t v2 = 0;
          a1[9] = *(_DWORD *)(a2 + 136);
        }
      }
    }
  }
  return v2;
}

void _cryptex_dealloc(uint64_t a1)
{
  os_release(*(void **)(a1 + 48));
  uint64_t v2 = *(void **)(a1 + 104);
  if (v2) {
    os_release(v2);
  }

  object_proto_destroy(a1 + 16);
}

uint64_t _cryptex_create(_OWORD *a1, char *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v5 = a2;
    id v6 = 0;
  }
  else
  {
    if ((a3 & 1) == 0) {
      _cryptex_create_cold_1();
    }
    int v12 = 0;
    uint32_t v7 = arc4random();
    if (asprintf(&v12, "%s.%#x", "default", v7) < 0) {
      _cryptex_bundle_add_cryptex_assets_cold_1(&v13, v14);
    }
    id v6 = v12;
    id v5 = v12;
  }
  uint64_t v8 = _cryptex_alloc();
  *(void *)(v8 + 40) = a3;
  *(void *)(v8 + 48) = cryptex_core_create();
  long long v10 = a1[1];
  long long v9 = a1[2];
  *(_OWORD *)(v8 + 56) = *a1;
  *(_OWORD *)(v8 + 72) = v10;
  *(_OWORD *)(v8 + 88) = v9;
  object_proto_init(v8 + 16, (int)"com.apple.security.libcryptex", "cryptex");
  object_set_name(v8 + 16, v5);
  object_set_name_nocopy(*(void *)(v8 + 48) + 16, v5);
  free(v6);
  return v8;
}

BOOL _cryptex_identity_equal_device(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    uint64_t v3 = *(void *)(a1 + 8) & 1;
    if (v3 != (*(void *)(a2 + 8) & 1)) {
      return 0;
    }
    if (v3) {
      return 1;
    }
    return *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16)
        && *(_DWORD *)(a1 + 20) == *(_DWORD *)(a2 + 20)
        && *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24);
  }
  return v2;
}

BOOL _cryptex_identity_equal_cryptex1_chipid(unsigned int *a1, unsigned int *a2)
{
  uint64_t v2 = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t v2 = *a1;
      if (v2)
      {
        uint64_t v2 = *a2;
        if (v2)
        {
          uint64_t v3 = *((void *)a1 + 1) & 4;
          if (v3 == (*((void *)a2 + 1) & 4)) {
            return !v3 || a1[7] == a2[7];
          }
          else {
            return 0;
          }
        }
      }
    }
  }
  return v2;
}

BOOL _cryptex_identity_equal_cryptex1(unsigned int *a1, unsigned int *a2)
{
  uint64_t v2 = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t v2 = *a1;
      if (v2)
      {
        uint64_t v2 = *a2;
        if (v2)
        {
          uint64_t v3 = *((void *)a1 + 1) & 2;
          if (v3 == (*((void *)a2 + 1) & 2))
          {
            if (!v3) {
              return 1;
            }
            if (a1[8] == a2[8]) {
              return a1[10] == a2[10];
            }
          }
          return 0;
        }
      }
    }
  }
  return v2;
}

char *_cryptex_identity_copy_description(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  size_t v2 = 512;
  uint64_t v3 = __dst;
  memcpy(__dst, "generic", sizeof(__dst));
  if ((*(unsigned char *)(a1 + 8) & 1) == 0)
  {
    unsigned int v4 = snprintf(__dst, 0x200uLL, "device(bord = %#x, chip = %#x, sdom = %#x) ", *(_DWORD *)(a1 + 16), *(_DWORD *)(a1 + 20), *(_DWORD *)(a1 + 24));
    if ((v4 & 0x80000000) != 0)
    {
      int v6 = *__error();
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = 12;
        uint32_t v7 = MEMORY[0x263EF8438];
        uint64_t v8 = "Failed to write device identifiers.: %{darwin.errno}d";
LABEL_16:
        _os_log_impl(&dword_21DAF1000, v7, OS_LOG_TYPE_ERROR, v8, buf, 8u);
      }
LABEL_17:
      long long v9 = __error();
      uint64_t result = 0;
      int *v9 = v6;
      return result;
    }
    uint64_t v3 = &__dst[v4];
    size_t v2 = 512 - v4;
  }
  if (*(_DWORD *)a1
    && (*(unsigned char *)(a1 + 8) & 2) != 0
    && snprintf(v3, v2, "cryptex1(fchp = %#x, type = %#x, styp = %#x, clas = %#x)", *(_DWORD *)(a1 + 28), *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36), *(_DWORD *)(a1 + 40)) < 0)
  {
    int v6 = *__error();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = 12;
      uint32_t v7 = MEMORY[0x263EF8438];
      uint64_t v8 = "Failed to write cryptex1 identifiers.: %{darwin.errno}d";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      uint64_t result = strdup(__dst);
      if (result) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    uint64_t result = strdup(__dst);
    if (!result) {
      _cryptex_identity_copy_description_cold_1(__dst, &v10, buf);
    }
  }
  return result;
}

uint64_t _cryptex_get_core(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

char *cryptex_system_cx_copy_name(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (a1 == 1)
  {
    uint64_t result = strdup("com.apple.system.nextos");
    if (!result) {
      cryptex_system_cx_copy_name_cold_2(&v2, v3);
    }
  }
  else if (a1)
  {
    return 0;
  }
  else
  {
    uint64_t result = strdup("com.apple.system.app");
    if (!result) {
      cryptex_system_cx_copy_name_cold_1(&v2, v3);
    }
  }
  return result;
}

__n128 cryptex_get_identity@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v2 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 16) = v2;
  __n128 result = *(__n128 *)(a1 + 88);
  *(__n128 *)(a2 + 32) = result;
  return result;
}

uint64_t cryptex_get_variant(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    return 0;
  }
  else {
    return *(void *)(a1 + 16);
  }
}

uint64_t cryptex_get_image_type()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v0 = *(void *)(cryptex_core_get_image_asset() + 8);
  if (v0 == MEMORY[0x263F8C3E0]) {
    return 0;
  }
  if (v0 == MEMORY[0x263F8C418]) {
    return 1;
  }
  if (v0 != MEMORY[0x263F8C3E8]) {
    cryptex_get_image_type_cold_1(&v2, v3);
  }
  return 2;
}

uint64_t cryptex_lockdown()
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v0 = _g;
  uint64_t v32 = 0;
  memset(v31, 0, sizeof(v31));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  uint64_t v8 = 32;
  id v1 = os_log_create("com.apple.libcryptex", "cryptex");
  uint64_t v2 = _cryptex_copy_connected_actor(v0, MEMORY[0x263F8C430]);
  _cryptex_actor_init_invoke_u64();
  codex_lockdown_pack();
  uint64_t v3 = cryptex_actor_trap();
  if (v3)
  {
    int v4 = *__error();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = v3;
      _os_log_impl(&dword_21DAF1000, v1, OS_LOG_TYPE_ERROR, "lockdown rpc: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v4;
  }
  rpc_destroy(&v8);
  rpc_destroy(v31);
  if (v1) {
    os_release(v1);
  }
  if (v2) {
    os_release(v2);
  }
  return v3;
}

uint64_t cryptex_install2(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  uint64_t v5 = _g;
  BOOL v53 = 0;
  uint64_t v52 = 0;
  memset(v51, 0, sizeof(v51));
  uint64_t v82 = 0;
  memset(v81, 0, sizeof(v81));
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v74 = 0u;
  long long v73 = 0u;
  long long v72 = 0u;
  long long v71 = 0u;
  long long v70 = 0u;
  long long v69 = 0u;
  long long v68 = 0u;
  long long v67 = 0u;
  long long v66 = 0u;
  long long v65 = 0u;
  long long v64 = 0u;
  long long v63 = 0u;
  long long v62 = 0u;
  long long v61 = 0u;
  long long v60 = 0u;
  long long v59 = 0u;
  uint64_t v58 = 32;
  if ((*(unsigned char *)(a1 + 40) & 2) != 0)
  {
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      long long v11 = *(const char **)(a1 + 16);
      if (!v11) {
        long long v11 = "[anonymous]";
      }
    }
    else
    {
      long long v11 = *(const char **)(a1 + 16);
      if (!v11) {
        long long v11 = "[anonymous]";
      }
    }
    *(_DWORD *)buf = 136446466;
    __int16 v55 = v11;
    __int16 v56 = 1024;
    LODWORD(v57) = 45;
    long long v13 = (char *)_os_log_send_and_compose_impl();
    int v14 = 785;
    CFIndex v15 = 45;
    goto LABEL_39;
  }
  if (!cryptex_core_get_image_asset())
  {
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      long long v12 = *(const char **)(a1 + 16);
      if (!v12) {
        long long v12 = "[anonymous]";
      }
    }
    else
    {
      long long v12 = *(const char **)(a1 + 16);
      if (!v12) {
        long long v12 = "[anonymous]";
      }
    }
    *(_DWORD *)buf = 136446466;
    __int16 v55 = v12;
    __int16 v56 = 1024;
    LODWORD(v57) = 22;
    long long v13 = (char *)_os_log_send_and_compose_impl();
    int v14 = 793;
    goto LABEL_30;
  }
  uint64_t info_asset = cryptex_core_get_info_asset();
  if (!info_asset)
  {
    long long v16 = 0;
    goto LABEL_21;
  }
  int file = _read_file(*(_DWORD *)(info_asset + 16), v51);
  if (file)
  {
    int v9 = file;
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      long long v10 = *(const char **)(a1 + 16);
      if (!v10) {
        long long v10 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446466;
      __int16 v55 = v10;
      __int16 v56 = 1024;
      LODWORD(v57) = v9;
    }
    else
    {
      long long v20 = *(const char **)(a1 + 16);
      if (!v20) {
        long long v20 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446466;
      __int16 v55 = v20;
      __int16 v56 = 1024;
      LODWORD(v57) = file;
    }
    long long v13 = (char *)_os_log_send_and_compose_impl();
    CFIndex v15 = v9;
    int v14 = 805;
    goto LABEL_39;
  }
  long long v17 = (void *)xpc_create_from_plist();
  if (!v17)
  {
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      int v40 = *(const char **)(a1 + 16);
      if (!v40) {
        int v40 = "[anonymous]";
      }
    }
    else
    {
      int v40 = *(const char **)(a1 + 16);
      if (!v40) {
        int v40 = "[anonymous]";
      }
    }
    *(_DWORD *)buf = 136446466;
    __int16 v55 = v40;
    __int16 v56 = 1024;
    LODWORD(v57) = 22;
    long long v13 = (char *)_os_log_send_and_compose_impl();
    int v14 = 813;
LABEL_30:
    CFIndex v15 = 22;
LABEL_39:
    CFErrorRef Error = createError("cryptex_install2", "cryptex.c", v14, "com.apple.security.cryptex.posix", v15, 0, v13);
    long long v22 = 0;
    long long v23 = 0;
    long long v16 = 0;
LABEL_40:
    long long v24 = 0;
    goto LABEL_41;
  }
  long long v16 = v17;
  int v18 = _xpc_dictionary_try_get_BOOL(v17, "NoCode", &v53);
  if (v18 == 79)
  {
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      int v45 = *(const char **)(a1 + 16);
      if (!v45) {
        int v45 = "[anonymous]";
      }
    }
    else
    {
      int v45 = *(const char **)(a1 + 16);
      if (!v45) {
        int v45 = "[anonymous]";
      }
    }
    *(_DWORD *)buf = 136446466;
    __int16 v55 = v45;
    __int16 v56 = 2080;
    __int16 v57 = "NoCode";
    long long v13 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v42 = "com.apple.security.cryptex";
    int v43 = 825;
    CFIndex v44 = 11;
    goto LABEL_114;
  }
  if (v18 == 2)
  {
    BOOL v53 = 0;
  }
  else if (v53)
  {
    goto LABEL_22;
  }
LABEL_21:
  if (!cryptex_core_get_tc_asset())
  {
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      long long v19 = *(const char **)(a1 + 16);
      if (!v19) {
        long long v19 = "[anonymous]";
      }
    }
    else
    {
      long long v19 = *(const char **)(a1 + 16);
      if (!v19) {
        long long v19 = "[anonymous]";
      }
    }
    *(_DWORD *)buf = 136446466;
    __int16 v55 = v19;
    __int16 v56 = 1024;
    LODWORD(v57) = 22;
    long long v13 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v42 = "com.apple.security.cryptex.posix";
    int v43 = 835;
    CFIndex v44 = 22;
LABEL_114:
    CFErrorRef Error = createError("cryptex_install2", "cryptex.c", v43, v42, v44, 0, v13);
    long long v22 = 0;
    long long v23 = 0;
    goto LABEL_40;
  }
LABEL_22:
  cryptex_core_get_volumehash_asset();
  cryptex_core_get_asset();
  if (*(void *)(a2 + 48) >= 3uLL)
  {
    long long v30 = *(const char **)(*(void *)(a1 + 48) + 16);
    int v31 = *__error();
    uint64_t v32 = *(NSObject **)(*(void *)(a1 + 48) + 32);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = "[anonymous]";
      if (v30) {
        uint64_t v33 = v30;
      }
      *(_DWORD *)buf = 136446210;
      __int16 v55 = v33;
      _os_log_impl(&dword_21DAF1000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s: Installing as ephemeral", buf, 0xCu);
    }
    *__error() = v31;
  }
  if (cryptex_core_is_cryptex1()) {
    uint64_t v34 = cryptex_core_cx1_copy_xpc_dictionary();
  }
  else {
    uint64_t v34 = (uint64_t)xpc_dictionary_create(0, 0, 0);
  }
  long long v24 = (void *)v34;
  uint64_t result = MEMORY[0x223C12420]();
  if (result != MEMORY[0x263EF8708])
  {
    __break(1u);
    return result;
  }
  long long v22 = _cryptex_copy_connected_actor(v5, MEMORY[0x263F8C430]);
  _cryptex_actor_init_invoke_u64();
  codex_install_pack();
  uint64_t v35 = cryptex_actor_trap_with_cferr();
  if (v35)
  {
    long long v23 = (const void *)v35;
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      int v36 = *(const char **)(a1 + 16);
      if (!v36) {
        int v36 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      __int16 v55 = v36;
    }
    else
    {
      uint64_t v41 = *(const char **)(a1 + 16);
      if (!v41) {
        uint64_t v41 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      __int16 v55 = v41;
    }
    long long v13 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("cryptex_install2", "cryptex.c", 911, "com.apple.security.cryptex", 14, v23, v13);
  }
  else
  {
    int v37 = codex_install_reply_unpack();
    if (!v37)
    {
      id v46 = *(const char **)(a1 + 16);
      int v47 = *__error();
      uint64_t v48 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v49 = "[anonymous]";
        if (v46) {
          uint64_t v49 = v46;
        }
        *(_DWORD *)buf = 136446466;
        __int16 v55 = v49;
        __int16 v56 = 2080;
        __int16 v57 = 0;
        _os_log_impl(&dword_21DAF1000, v48, OS_LOG_TYPE_DEBUG, "%{public}s: installed as: %s", buf, 0x16u);
      }
      CFErrorRef Error = 0;
      long long v23 = 0;
      *__error() = v47;
      goto LABEL_51;
    }
    int v38 = v37;
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      xpc_object_t v39 = *(const char **)(a1 + 16);
      if (!v39) {
        xpc_object_t v39 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446466;
      __int16 v55 = v39;
      __int16 v56 = 1024;
      LODWORD(v57) = v38;
    }
    else
    {
      CFErrorRef v50 = *(const char **)(a1 + 16);
      if (!v50) {
        CFErrorRef v50 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446466;
      __int16 v55 = v50;
      __int16 v56 = 1024;
      LODWORD(v57) = v37;
    }
    long long v13 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("cryptex_install2", "cryptex.c", 918, "com.apple.security.cryptex.posix", v38, 0, v13);
    long long v23 = 0;
  }
LABEL_41:
  free(v13);
  if (a3 && Error)
  {
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      long long v25 = *(const char **)(a1 + 16);
      if (!v25) {
        long long v25 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      __int16 v55 = v25;
    }
    else
    {
      long long v26 = *(const char **)(a1 + 16);
      if (!v26) {
        long long v26 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      __int16 v55 = v26;
    }
    long long v27 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v28 = createError("cryptex_install2", "cryptex.c", 928, "com.apple.security.cryptex", 14, Error, v27);
    free(v27);
    *a3 = v28;
  }
LABEL_51:
  buff_destroy(v51);
  rpc_destroy(&v58);
  rpc_destroy(v81);
  if (v24) {
    os_release(v24);
  }
  if (v16) {
    os_release(v16);
  }
  if (Error) {
    CFRelease(Error);
  }
  if (v23) {
    CFRelease(v23);
  }
  if (v22) {
    os_release(v22);
  }
  return Error == 0;
}

void cryptex_uninstall()
{
}

BOOL cryptex_personalize2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, CFErrorRef *a5, NSObject *a6, const void *a7)
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  int v9 = *(void **)(a1 + 48);
  uint64_t v99 = 0;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v92 = 0u;
  uint64_t v95 = 0x3000000000;
  uint64_t v87 = MEMORY[0x263F8C4D8];
  if (!a6)
  {
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      long long v16 = *(const char **)(a1 + 16);
      if (!v16) {
        long long v16 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      xpc_object_t v89 = v16;
    }
    else
    {
      int v18 = *(const char **)(a1 + 16);
      if (!v18) {
        int v18 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      xpc_object_t v89 = v18;
    }
    long long v19 = (char *)_os_log_send_and_compose_impl();
    long long v20 = "com.apple.security.cryptex";
    int v21 = 969;
    CFIndex v22 = 11;
    goto LABEL_32;
  }
  if ((*(unsigned char *)(a1 + 40) & 2) != 0)
  {
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      long long v17 = *(const char **)(a1 + 16);
      if (!v17) {
        long long v17 = "[anonymous]";
      }
    }
    else
    {
      long long v17 = *(const char **)(a1 + 16);
      if (!v17) {
        long long v17 = "[anonymous]";
      }
    }
    *(_DWORD *)buf = 136446466;
    xpc_object_t v89 = v17;
    __int16 v90 = 1024;
    LODWORD(v91) = 45;
    long long v19 = (char *)_os_log_send_and_compose_impl();
    long long v20 = "com.apple.security.cryptex.posix";
    int v21 = 975;
    CFIndex v22 = 45;
    goto LABEL_32;
  }
  if (cryptex_core_get_asset())
  {
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      CFIndex v15 = *(const char **)(a1 + 16);
      if (!v15) {
        CFIndex v15 = "[anonymous]";
      }
    }
    else
    {
      CFIndex v15 = *(const char **)(a1 + 16);
      if (!v15) {
        CFIndex v15 = "[anonymous]";
      }
    }
    *(_DWORD *)buf = 136446466;
    xpc_object_t v89 = v15;
    __int16 v90 = 1024;
    LODWORD(v91) = 17;
    long long v19 = (char *)_os_log_send_and_compose_impl();
    long long v20 = "com.apple.security.cryptex.posix";
    int v21 = 982;
    CFIndex v22 = 17;
LABEL_32:
    CFErrorRef Error = createError("cryptex_personalize2", "cryptex.c", v21, v20, v22, 0, v19);
    CFErrorRef v28 = 0;
    long long v29 = 0;
LABEL_33:
    long long v30 = 0;
LABEL_34:
    int v31 = 0;
    goto LABEL_35;
  }
  long long v86 = a5;
  if (cryptex_core_is_cryptex1())
  {
    long long v23 = *(const char **)(a1 + 16);
    int v24 = *__error();
    long long v25 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      long long v26 = "[anonymous]";
      if (v23) {
        long long v26 = v23;
      }
      *(_DWORD *)buf = 136446210;
      xpc_object_t v89 = v26;
      _os_log_impl(&dword_21DAF1000, v25, OS_LOG_TYPE_DEBUG, "%{public}s: Will personalize Cryptex1 dmg with a Cryptex1 TSS request.", buf, 0xCu);
    }
    *__error() = v24;
  }
  uint64_t v85 = (*(void *)(a2 + 96) >> 1) & 1;
  uint64_t v37 = *(void *)(a2 + 64);
  uint64_t v38 = a2;
  xpc_object_t v39 = ctx_new((void *)a1, 0x28uLL);
  dispatch_retain(a6);
  v39[3] = a6;
  v39[4] = _Block_copy(a7);
  long long v29 = (void *)cryptex_host_create();
  cryptex_core_attach_host();
  uint64_t v40 = *(void *)(v38 + 64);
  if (v40 == 2)
  {
    long long v30 = (void *)cryptex_scrivener_create();
LABEL_109:
    cryptex_scrivener_sign();
    cryptex_activate();
    int v31 = 0;
    CFErrorRef Error = 0;
    CFErrorRef v28 = 0;
    goto LABEL_45;
  }
  if (v40 != 1)
  {
    long long v30 = (void *)cryptex_scrivener_create();
    if (*(void *)(v38 + 72)) {
      cryptex_scrivener_set_url();
    }
    a5 = v86;
    if (a3)
    {
      if (a4)
      {
        cryptex_scrivener_set_nonce();
        int v47 = *(const char **)(a1 + 16);
        int v48 = *__error();
        uint64_t v49 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          CFErrorRef v50 = "[anonymous]";
          if (v47) {
            CFErrorRef v50 = v47;
          }
          *(_DWORD *)buf = 136446210;
          xpc_object_t v89 = v50;
          __int16 v51 = "%{public}s: personalizing with client provided nonce";
LABEL_99:
          long long v62 = v49;
          uint32_t v63 = 12;
LABEL_100:
          _os_log_impl(&dword_21DAF1000, v62, OS_LOG_TYPE_DEBUG, v51, buf, v63);
        }
      }
      else
      {
        cryptex_scrivener_set_nonce();
        long long v60 = *(const char **)(a1 + 16);
        int v48 = *__error();
        uint64_t v49 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          long long v61 = "[anonymous]";
          if (v60) {
            long long v61 = v60;
          }
          *(_DWORD *)buf = 136446210;
          xpc_object_t v89 = v61;
          __int16 v51 = "%{public}s: personalizing with zero nonce";
          goto LABEL_99;
        }
      }
    }
    else
    {
      int nonce_domain = cryptex_core_get_nonce_domain();
      int v54 = nonce_domain;
      if (nonce_domain || !v87)
      {
        if (*(void *)(a1 + 32))
        {
          os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
          long long v66 = *(const char **)(a1 + 16);
          if (!v66) {
            long long v66 = "[anonymous]";
          }
          *(_DWORD *)buf = 136446466;
          xpc_object_t v89 = v66;
          __int16 v90 = 1024;
          LODWORD(v91) = v54;
        }
        else
        {
          long long v78 = *(const char **)(a1 + 16);
          if (!v78) {
            long long v78 = "[anonymous]";
          }
          *(_DWORD *)buf = 136446466;
          xpc_object_t v89 = v78;
          __int16 v90 = 1024;
          LODWORD(v91) = nonce_domain;
        }
        long long v19 = (char *)_os_log_send_and_compose_impl();
        CFIndex v70 = v54;
        int v69 = 1065;
        goto LABEL_155;
      }
      int v55 = cryptex_core_copy_nonce_domain_desc();
      if (v55)
      {
        int v56 = v55;
        if (*(void *)(a1 + 32))
        {
          os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
          __int16 v57 = *(const char **)(a1 + 16);
          if (!v57) {
            __int16 v57 = "[anonymous]";
          }
          *(_DWORD *)buf = 136446466;
          xpc_object_t v89 = v57;
          __int16 v90 = 1024;
          LODWORD(v91) = v56;
        }
        else
        {
          long long v80 = *(const char **)(a1 + 16);
          if (!v80) {
            long long v80 = "[anonymous]";
          }
          *(_DWORD *)buf = 136446466;
          xpc_object_t v89 = v80;
          __int16 v90 = 1024;
          LODWORD(v91) = v55;
        }
        long long v19 = (char *)_os_log_send_and_compose_impl();
        CFIndex v70 = v56;
        int v69 = 1072;
        goto LABEL_155;
      }
      long long v71 = *(const char **)(a1 + 16);
      int v72 = *__error();
      long long v73 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
      {
        long long v74 = "[anonymous]";
        if (v71) {
          long long v74 = v71;
        }
        *(_DWORD *)buf = 136446466;
        xpc_object_t v89 = v74;
        __int16 v90 = 2080;
        size_t v91 = 0;
        _os_log_impl(&dword_21DAF1000, v73, OS_LOG_TYPE_DEBUG, "%{public}s: copying nonce from domain %s", buf, 0x16u);
      }
      *__error() = v72;
      int v75 = img4_nonce_domain_copy_nonce();
      if (v75)
      {
        int v76 = v75;
        if (*(void *)(a1 + 32))
        {
          os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
          long long v77 = *(const char **)(a1 + 16);
          if (!v77) {
            long long v77 = "[anonymous]";
          }
          *(_DWORD *)buf = 136446466;
          xpc_object_t v89 = v77;
          __int16 v90 = 1024;
          LODWORD(v91) = v76;
        }
        else
        {
          long long v84 = *(const char **)(a1 + 16);
          if (!v84) {
            long long v84 = "[anonymous]";
          }
          *(_DWORD *)buf = 136446466;
          xpc_object_t v89 = v84;
          __int16 v90 = 1024;
          LODWORD(v91) = v75;
        }
        long long v19 = (char *)_os_log_send_and_compose_impl();
        CFIndex v70 = v76;
        int v69 = 1082;
        goto LABEL_155;
      }
      cryptex_scrivener_set_nonce();
      long long v81 = *(const char **)(a1 + 16);
      int v48 = *__error();
      uint64_t v82 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v83 = "[anonymous]";
        if (v81) {
          uint64_t v83 = v81;
        }
        *(_DWORD *)buf = 136446466;
        xpc_object_t v89 = v83;
        __int16 v90 = 2080;
        size_t v91 = 0;
        __int16 v51 = "%{public}s: personalizing with host nonce from %s";
        long long v62 = v82;
        uint32_t v63 = 22;
        goto LABEL_100;
      }
    }
    *__error() = v48;
    int v64 = *(_DWORD *)(v38 + 88);
    if (*(void *)(v38 + 80))
    {
      if (v64)
      {
        cryptex_scrivener_set_socks_proxy();
        goto LABEL_109;
      }
    }
    else if (v64 < 1)
    {
      goto LABEL_109;
    }
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      long long v65 = *(const char **)(a1 + 16);
      if (!v65) {
        long long v65 = "[anonymous]";
      }
    }
    else
    {
      long long v65 = *(const char **)(a1 + 16);
      if (!v65) {
        long long v65 = "[anonymous]";
      }
    }
    *(_DWORD *)buf = 136446466;
    xpc_object_t v89 = v65;
    __int16 v90 = 1024;
    LODWORD(v91) = 22;
    long long v19 = (char *)_os_log_send_and_compose_impl();
    int v69 = 1104;
    CFIndex v70 = 22;
LABEL_155:
    CFErrorRef Error = createError("cryptex_personalize2", "cryptex.c", v69, "com.apple.security.cryptex.posix", v70, 0, v19);
    CFErrorRef v28 = 0;
    goto LABEL_34;
  }
  if (!xpc_array_get_count(*(xpc_object_t *)(*(void *)(a1 + 48) + 208)))
  {
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      uint64_t v52 = *(const char **)(a1 + 16);
      if (!v52) {
        uint64_t v52 = "[anonymous]";
      }
    }
    else
    {
      uint64_t v52 = *(const char **)(a1 + 16);
      if (!v52) {
        uint64_t v52 = "[anonymous]";
      }
    }
    *(_DWORD *)buf = 136446466;
    xpc_object_t v89 = v52;
    __int16 v90 = 1024;
    LODWORD(v91) = 22;
    long long v19 = (char *)_os_log_send_and_compose_impl();
    a5 = v86;
    CFErrorRef Error = createError("cryptex_personalize2", "cryptex.c", 1022, "com.apple.security.cryptex.posix", 22, 0, v19);
    CFErrorRef v28 = 0;
    goto LABEL_33;
  }
  uint64_t v41 = *(const char **)(a1 + 16);
  int v42 = *__error();
  int v43 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    if (!v41) {
      uint64_t v41 = "[anonymous]";
    }
    size_t count = xpc_array_get_count(*(xpc_object_t *)(*(void *)(a1 + 48) + 208));
    *(_DWORD *)buf = 136446466;
    xpc_object_t v89 = v41;
    __int16 v90 = 2048;
    size_t v91 = count;
    _os_log_impl(&dword_21DAF1000, v43, OS_LOG_TYPE_DEFAULT, "%{public}s: requesting Diavlo personalization with %lu signatures", buf, 0x16u);
  }
  *__error() = v42;
  int v31 = (void *)cryptex_signing_service_create(v85 & 0xFFFFFFFFFFFFFFFDLL | (2 * (v37 & 1)));
  CFErrorRef v45 = cryptex_signing_service_set_cryptex_core((uint64_t)v31, v9);
  a5 = v86;
  if (v45)
  {
    CFErrorRef v28 = v45;
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      id v46 = *(const char **)(a1 + 16);
      if (!v46) {
        id v46 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      xpc_object_t v89 = v46;
    }
    else
    {
      long long v67 = *(const char **)(a1 + 16);
      if (!v67) {
        long long v67 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      xpc_object_t v89 = v67;
    }
    long long v19 = (char *)_os_log_send_and_compose_impl();
    int v68 = 1033;
  }
  else
  {
    uint64_t v58 = *(const char **)(v38 + 72);
    if (v58) {
      cryptex_signing_service_set_tss_url((uint64_t)v31, v58);
    }
    CFErrorRef v28 = cryptex_signing_service_sign((uint64_t)v31);
    if (!v28)
    {
      long long v30 = 0;
      CFErrorRef Error = 0;
      goto LABEL_45;
    }
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      long long v59 = *(const char **)(a1 + 16);
      if (!v59) {
        long long v59 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      xpc_object_t v89 = v59;
    }
    else
    {
      long long v79 = *(const char **)(a1 + 16);
      if (!v79) {
        long long v79 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      xpc_object_t v89 = v79;
    }
    long long v19 = (char *)_os_log_send_and_compose_impl();
    int v68 = 1045;
  }
  CFErrorRef Error = createError("cryptex_personalize2", "cryptex.c", v68, "com.apple.security.cryptex", 5, v28, v19);
  long long v30 = 0;
LABEL_35:
  free(v19);
  if (a5 && Error)
  {
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      uint64_t v32 = *(const char **)(a1 + 16);
      if (!v32) {
        uint64_t v32 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      xpc_object_t v89 = v32;
    }
    else
    {
      uint64_t v33 = *(const char **)(a1 + 16);
      if (!v33) {
        uint64_t v33 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      xpc_object_t v89 = v33;
    }
    uint64_t v34 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v35 = createError("cryptex_personalize2", "cryptex.c", 1115, "com.apple.security.cryptex", 5, Error, v34);
    free(v34);
    *a5 = v35;
  }
LABEL_45:
  free(0);
  if (v31) {
    os_release(v31);
  }
  if (v30) {
    os_release(v30);
  }
  if (v29) {
    os_release(v29);
  }
  if (Error) {
    CFRelease(Error);
  }
  if (v28) {
    CFRelease(v28);
  }
  return Error == 0;
}

uint64_t _cryptex_personalize2_continue_tss(uint64_t a1, uint64_t a2, const void *a3, uint64_t *a4)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v6 = *a4;
  bzero(v44, 0x400uLL);
  memcpy(__dst, "cryptex.personalize.XXXXXX", sizeof(__dst));
  int v41 = -1;
  uint64_t v42 = 0;
  if (a3)
  {
    if (*(void *)(v6 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
      int v7 = *(const char **)(v6 + 16);
      if (!v7) {
        int v7 = "[anonymous]";
      }
      int v45 = 136446210;
      id v46 = v7;
    }
    else
    {
      int v14 = *(const char **)(v6 + 16);
      if (!v14) {
        int v14 = "[anonymous]";
      }
      int v45 = 136446210;
      id v46 = v14;
    }
    CFIndex v15 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("_cryptex_personalize2_continue_tss", "cryptex.c", 196, "com.apple.security.cryptex", 5, a3, v15);
    int v9 = -1;
    goto LABEL_37;
  }
  _confstr(65537, v44);
  int v8 = open(v44, 0x100000);
  int v9 = v8;
  if (v8 < 0)
  {
    int v17 = *__error();
    if (*(void *)(v6 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
      int v18 = *(const char **)(v6 + 16);
      int v45 = 136446722;
      if (v18) {
        long long v19 = v18;
      }
      else {
        long long v19 = "[anonymous]";
      }
      id v46 = v19;
      __int16 v47 = 2080;
      int v48 = v44;
      __int16 v49 = 1024;
      int v50 = v17;
    }
    else
    {
      CFErrorRef v28 = "[anonymous]";
      if (*(void *)(v6 + 16)) {
        CFErrorRef v28 = *(const char **)(v6 + 16);
      }
      int v45 = 136446722;
      id v46 = v28;
      __int16 v47 = 2080;
      int v48 = v44;
      __int16 v49 = 1024;
      int v50 = v17;
    }
    CFIndex v15 = (char *)_os_log_send_and_compose_impl();
    int v27 = 205;
    CFIndex v26 = v17;
    goto LABEL_36;
  }
  int v10 = _mkodtempat(v8, __dst, &v41);
  if (v10)
  {
    int v11 = v10;
    if (*(void *)(v6 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
      long long v12 = *(const char **)(v6 + 16);
      int v45 = 136446722;
      if (v12) {
        long long v13 = v12;
      }
      else {
        long long v13 = "[anonymous]";
      }
      id v46 = v13;
      __int16 v47 = 2080;
      int v48 = v44;
      __int16 v49 = 1024;
      int v50 = v11;
    }
    else
    {
      long long v25 = "[anonymous]";
      if (*(void *)(v6 + 16)) {
        long long v25 = *(const char **)(v6 + 16);
      }
      int v45 = 136446722;
      id v46 = v25;
      __int16 v47 = 2080;
      int v48 = v44;
      __int16 v49 = 1024;
      int v50 = v10;
    }
    CFIndex v15 = (char *)_os_log_send_and_compose_impl();
    CFIndex v26 = v11;
    int v27 = 213;
LABEL_36:
    CFErrorRef Error = createError("_cryptex_personalize2_continue_tss", "cryptex.c", v27, "com.apple.security.cryptex.posix", v26, 0, v15);
LABEL_37:
    free(v15);
    a4[2] = (uint64_t)Error;
    cryptex_tss_async();
    goto LABEL_38;
  }
  long long v20 = *(const char **)(MEMORY[0x263F8C408] + 40);
  int v21 = openat(v41, v20, 513, 438);
  if ((v21 & 0x80000000) == 0)
  {
    int v22 = cryptex_signature_write();
    if (v22)
    {
      int v23 = v22;
      if (*(void *)(v6 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
        int v24 = *(const char **)(v6 + 16);
        if (!v24) {
          int v24 = "[anonymous]";
        }
        int v45 = 136446466;
        id v46 = v24;
        __int16 v47 = 1024;
        LODWORD(v48) = v23;
      }
      else
      {
        uint64_t v33 = *(const char **)(v6 + 16);
        if (!v33) {
          uint64_t v33 = "[anonymous]";
        }
        int v45 = 136446466;
        id v46 = v33;
        __int16 v47 = 1024;
        LODWORD(v48) = v22;
      }
      uint64_t v34 = (char *)_os_log_send_and_compose_impl();
      CFErrorRef v32 = createError("_cryptex_personalize2_continue_tss", "cryptex.c", 229, "com.apple.security.cryptex.posix", v23, 0, v34);
      CFErrorRef v35 = v34;
    }
    else
    {
      if ((openat(v41, v20, 0) & 0x80000000) == 0)
      {
        uint64_t v42 = cryptex_asset_new();
        cryptex_core_set_asset();
        CFErrorRef v32 = 0;
LABEL_54:
        a4[2] = (uint64_t)v32;
        cryptex_tss_async();
LABEL_58:
        if (close(v21) == -1) {
          _cryptex_bundle_new_asset_from_object_cold_1(&v42, &v45);
        }
        goto LABEL_38;
      }
      int v38 = *__error();
      if (*(void *)(v6 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
        xpc_object_t v39 = *(const char **)(v6 + 16);
        if (!v39) {
          xpc_object_t v39 = "[anonymous]";
        }
      }
      else
      {
        xpc_object_t v39 = *(const char **)(v6 + 16);
        if (!v39) {
          xpc_object_t v39 = "[anonymous]";
        }
      }
      int v45 = 136446466;
      id v46 = v39;
      __int16 v47 = 1024;
      LODWORD(v48) = v38;
      uint64_t v40 = (char *)_os_log_send_and_compose_impl();
      CFErrorRef v32 = createError("_cryptex_personalize2_continue_tss", "cryptex.c", 238, "com.apple.security.cryptex.posix", v38, 0, v40);
      CFErrorRef v35 = v40;
    }
    free(v35);
    goto LABEL_54;
  }
  int v30 = *__error();
  if (*(void *)(v6 + 32))
  {
    os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
    int v31 = *(const char **)(v6 + 16);
    if (!v31) {
      int v31 = "[anonymous]";
    }
  }
  else
  {
    int v31 = *(const char **)(v6 + 16);
    if (!v31) {
      int v31 = "[anonymous]";
    }
  }
  int v45 = 136446466;
  id v46 = v31;
  __int16 v47 = 1024;
  LODWORD(v48) = v30;
  int v36 = (char *)_os_log_send_and_compose_impl();
  CFErrorRef v37 = createError("_cryptex_personalize2_continue_tss", "cryptex.c", 222, "com.apple.security.cryptex.posix", v30, 0, v36);
  free(v36);
  a4[2] = (uint64_t)v37;
  cryptex_tss_async();
  if (v21 != -1) {
    goto LABEL_58;
  }
LABEL_38:
  uint64_t result = v41;
  if (v41 != -1)
  {
    uint64_t result = close(v41);
    if (result == -1) {
      _cryptex_bundle_new_asset_from_object_cold_1(&v42, &v45);
    }
  }
  if (v9 != -1)
  {
    uint64_t result = close(v9);
    if (result == -1) {
      _cryptex_bundle_new_asset_from_object_cold_1(&v42, &v45);
    }
  }
  return result;
}

uint64_t _cryptex_personalize2_continue(uint64_t a1, uint64_t a2, const void *a3, uint64_t *a4)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v6 = *a4;
  bzero(v44, 0x400uLL);
  memcpy(__dst, "cryptex.personalize.XXXXXX", sizeof(__dst));
  int v41 = -1;
  uint64_t v42 = 0;
  if (a3)
  {
    if (*(void *)(v6 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
      int v7 = *(const char **)(v6 + 16);
      if (!v7) {
        int v7 = "[anonymous]";
      }
      int v45 = 136446210;
      id v46 = v7;
    }
    else
    {
      int v14 = *(const char **)(v6 + 16);
      if (!v14) {
        int v14 = "[anonymous]";
      }
      int v45 = 136446210;
      id v46 = v14;
    }
    CFIndex v15 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("_cryptex_personalize2_continue", "cryptex.c", 123, "com.apple.security.cryptex", 5, a3, v15);
    int v9 = -1;
    goto LABEL_37;
  }
  _confstr(65537, v44);
  int v8 = open(v44, 0x100000);
  int v9 = v8;
  if (v8 < 0)
  {
    int v17 = *__error();
    if (*(void *)(v6 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
      int v18 = *(const char **)(v6 + 16);
      int v45 = 136446722;
      if (v18) {
        long long v19 = v18;
      }
      else {
        long long v19 = "[anonymous]";
      }
      id v46 = v19;
      __int16 v47 = 2080;
      int v48 = v44;
      __int16 v49 = 1024;
      int v50 = v17;
    }
    else
    {
      CFErrorRef v28 = "[anonymous]";
      if (*(void *)(v6 + 16)) {
        CFErrorRef v28 = *(const char **)(v6 + 16);
      }
      int v45 = 136446722;
      id v46 = v28;
      __int16 v47 = 2080;
      int v48 = v44;
      __int16 v49 = 1024;
      int v50 = v17;
    }
    CFIndex v15 = (char *)_os_log_send_and_compose_impl();
    int v27 = 132;
    CFIndex v26 = v17;
    goto LABEL_36;
  }
  int v10 = _mkodtempat(v8, __dst, &v41);
  if (v10)
  {
    int v11 = v10;
    if (*(void *)(v6 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
      long long v12 = *(const char **)(v6 + 16);
      int v45 = 136446722;
      if (v12) {
        long long v13 = v12;
      }
      else {
        long long v13 = "[anonymous]";
      }
      id v46 = v13;
      __int16 v47 = 2080;
      int v48 = v44;
      __int16 v49 = 1024;
      int v50 = v11;
    }
    else
    {
      long long v25 = "[anonymous]";
      if (*(void *)(v6 + 16)) {
        long long v25 = *(const char **)(v6 + 16);
      }
      int v45 = 136446722;
      id v46 = v25;
      __int16 v47 = 2080;
      int v48 = v44;
      __int16 v49 = 1024;
      int v50 = v10;
    }
    CFIndex v15 = (char *)_os_log_send_and_compose_impl();
    CFIndex v26 = v11;
    int v27 = 140;
LABEL_36:
    CFErrorRef Error = createError("_cryptex_personalize2_continue", "cryptex.c", v27, "com.apple.security.cryptex.posix", v26, 0, v15);
LABEL_37:
    free(v15);
    a4[2] = (uint64_t)Error;
    cryptex_target_async_f();
    goto LABEL_38;
  }
  long long v20 = *(const char **)(MEMORY[0x263F8C408] + 40);
  int v21 = openat(v41, v20, 513, 438);
  if ((v21 & 0x80000000) == 0)
  {
    int v22 = cryptex_signature_write();
    if (v22)
    {
      int v23 = v22;
      if (*(void *)(v6 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
        int v24 = *(const char **)(v6 + 16);
        if (!v24) {
          int v24 = "[anonymous]";
        }
        int v45 = 136446466;
        id v46 = v24;
        __int16 v47 = 1024;
        LODWORD(v48) = v23;
      }
      else
      {
        uint64_t v33 = *(const char **)(v6 + 16);
        if (!v33) {
          uint64_t v33 = "[anonymous]";
        }
        int v45 = 136446466;
        id v46 = v33;
        __int16 v47 = 1024;
        LODWORD(v48) = v22;
      }
      uint64_t v34 = (char *)_os_log_send_and_compose_impl();
      CFErrorRef v32 = createError("_cryptex_personalize2_continue", "cryptex.c", 156, "com.apple.security.cryptex.posix", v23, 0, v34);
      CFErrorRef v35 = v34;
    }
    else
    {
      if ((openat(v41, v20, 0) & 0x80000000) == 0)
      {
        uint64_t v42 = cryptex_asset_new();
        cryptex_core_set_asset();
        CFErrorRef v32 = 0;
LABEL_54:
        a4[2] = (uint64_t)v32;
        cryptex_target_async_f();
LABEL_58:
        if (close(v21) == -1) {
          _cryptex_bundle_new_asset_from_object_cold_1(&v42, &v45);
        }
        goto LABEL_38;
      }
      int v38 = *__error();
      if (*(void *)(v6 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
        xpc_object_t v39 = *(const char **)(v6 + 16);
        if (!v39) {
          xpc_object_t v39 = "[anonymous]";
        }
      }
      else
      {
        xpc_object_t v39 = *(const char **)(v6 + 16);
        if (!v39) {
          xpc_object_t v39 = "[anonymous]";
        }
      }
      int v45 = 136446466;
      id v46 = v39;
      __int16 v47 = 1024;
      LODWORD(v48) = v38;
      uint64_t v40 = (char *)_os_log_send_and_compose_impl();
      CFErrorRef v32 = createError("_cryptex_personalize2_continue", "cryptex.c", 165, "com.apple.security.cryptex.posix", v38, 0, v40);
      CFErrorRef v35 = v40;
    }
    free(v35);
    goto LABEL_54;
  }
  int v30 = *__error();
  if (*(void *)(v6 + 32))
  {
    os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
    int v31 = *(const char **)(v6 + 16);
    if (!v31) {
      int v31 = "[anonymous]";
    }
  }
  else
  {
    int v31 = *(const char **)(v6 + 16);
    if (!v31) {
      int v31 = "[anonymous]";
    }
  }
  int v45 = 136446466;
  id v46 = v31;
  __int16 v47 = 1024;
  LODWORD(v48) = v30;
  int v36 = (char *)_os_log_send_and_compose_impl();
  CFErrorRef v37 = createError("_cryptex_personalize2_continue", "cryptex.c", 149, "com.apple.security.cryptex.posix", v30, 0, v36);
  free(v36);
  a4[2] = (uint64_t)v37;
  cryptex_target_async_f();
  if (v21 != -1) {
    goto LABEL_58;
  }
LABEL_38:
  uint64_t result = v41;
  if (v41 != -1)
  {
    uint64_t result = close(v41);
    if (result == -1) {
      _cryptex_bundle_new_asset_from_object_cold_1(&v42, &v45);
    }
  }
  if (v9 != -1)
  {
    uint64_t result = close(v9);
    if (result == -1) {
      _cryptex_bundle_new_asset_from_object_cold_1(&v42, &v45);
    }
  }
  return result;
}

CFErrorRef cryptex_fcopy_personalized_manifest2(uint64_t a1, int a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t asset = cryptex_core_get_asset();
  if (asset)
  {
    uint64_t v5 = asset;
    int v6 = dup(a2);
    if ((v6 & 0x80000000) == 0)
    {
      int v7 = *(_DWORD *)(v5 + 16);
      if (v7 < 0)
      {
        if (*(void *)(a1 + 32))
        {
          os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
          long long v13 = *(const char **)(a1 + 16);
          if (!v13) {
            long long v13 = "[anonymous]";
          }
        }
        else
        {
          long long v13 = *(const char **)(a1 + 16);
          if (!v13) {
            long long v13 = "[anonymous]";
          }
        }
        int v25 = 136446466;
        CFIndex v26 = v13;
        __int16 v27 = 1024;
        int v28 = 9;
        long long v20 = (char *)_os_log_send_and_compose_impl();
        int v21 = 1144;
        CFIndex v22 = 9;
      }
      else
      {
        if (!fcopyfile(v7, a2, 0, 0xFu))
        {
          CFErrorRef Error = 0;
          goto LABEL_39;
        }
        CFIndex v8 = *__error();
        if (*(void *)(a1 + 32))
        {
          os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
          if (*(void *)(a1 + 16)) {
            int v9 = *(const char **)(a1 + 16);
          }
          else {
            int v9 = "[anonymous]";
          }
        }
        else if (*(void *)(a1 + 16))
        {
          int v9 = *(const char **)(a1 + 16);
        }
        else
        {
          int v9 = "[anonymous]";
        }
        int v19 = *__error();
        int v25 = 136446466;
        CFIndex v26 = v9;
        __int16 v27 = 1024;
        int v28 = v19;
        long long v20 = (char *)_os_log_send_and_compose_impl();
        int v21 = 1150;
        CFIndex v22 = v8;
      }
      CFErrorRef Error = createError("cryptex_fcopy_personalized_manifest2", "cryptex.c", v21, "com.apple.security.cryptex.posix", v22, 0, v20);
      free(v20);
LABEL_39:
      if (close(v6) == -1) {
        _cryptex_bundle_new_asset_from_object_cold_1(&v24, &v25);
      }
      return Error;
    }
    CFIndex v11 = *__error();
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      if (*(void *)(a1 + 16)) {
        long long v12 = *(const char **)(a1 + 16);
      }
      else {
        long long v12 = "[anonymous]";
      }
    }
    else if (*(void *)(a1 + 16))
    {
      long long v12 = *(const char **)(a1 + 16);
    }
    else
    {
      long long v12 = "[anonymous]";
    }
    int v17 = *__error();
    int v25 = 136446466;
    CFIndex v26 = v12;
    __int16 v27 = 1024;
    int v28 = v17;
    int v18 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("cryptex_fcopy_personalized_manifest2", "cryptex.c", 1138, "com.apple.security.cryptex.posix", v11, 0, v18);
    free(v18);
    if (v6 != -1) {
      goto LABEL_39;
    }
  }
  else
  {
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      int v10 = *(const char **)(a1 + 16);
      if (!v10) {
        int v10 = "[anonymous]";
      }
      int v25 = 136446466;
      CFIndex v26 = v10;
      __int16 v27 = 1024;
      int v28 = 2;
    }
    else
    {
      int v14 = *(const char **)(a1 + 16);
      if (!v14) {
        int v14 = "[anonymous]";
      }
      int v25 = 136446466;
      CFIndex v26 = v14;
      __int16 v27 = 1024;
      int v28 = 2;
    }
    CFIndex v15 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("cryptex_fcopy_personalized_manifest2", "cryptex.c", 1131, "com.apple.security.cryptex.posix", 2, 0, v15);
    free(v15);
  }
  return Error;
}

uint64_t cryptex_attach_personalized_manifest(uint64_t a1, int a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v18 = -1;
  if (cryptex_core_get_asset())
  {
    int v4 = *(const char **)(a1 + 16);
    int v5 = *__error();
    int v6 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = "[anonymous]";
      if (v4) {
        int v7 = v4;
      }
      *(_DWORD *)buf = 136446466;
      int v21 = v7;
      __int16 v22 = 1024;
      int v23 = 17;
      _os_log_impl(&dword_21DAF1000, v6, OS_LOG_TYPE_ERROR, "%{public}s: This cryptex is already personalized.: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v5;
    uint64_t v8 = 17;
  }
  else
  {
    int v18 = dup(a2);
    if (v18 < 0)
    {
      uint64_t v8 = *__error();
      int v10 = *(const char **)(a1 + 16);
      int v11 = *__error();
      long long v12 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        long long v13 = "[anonymous]";
        if (v10) {
          long long v13 = v10;
        }
        *(_DWORD *)buf = 136446466;
        int v21 = v13;
        __int16 v22 = 1024;
        int v23 = v8;
        _os_log_impl(&dword_21DAF1000, v12, OS_LOG_TYPE_ERROR, "%{public}s: Failed to dup manifest fd.: %{darwin.errno}d", buf, 0x12u);
      }
      *__error() = v11;
    }
    else
    {
      uint64_t v19 = cryptex_asset_new();
      if (v19)
      {
        cryptex_core_set_asset();
        uint64_t v8 = 0;
      }
      else
      {
        int v14 = *(const char **)(a1 + 16);
        int v15 = *__error();
        long long v16 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = "[anonymous]";
          if (v14) {
            int v17 = v14;
          }
          *(_DWORD *)buf = 136446466;
          int v21 = v17;
          __int16 v22 = 1024;
          int v23 = 12;
          _os_log_impl(&dword_21DAF1000, v16, OS_LOG_TYPE_ERROR, "%{public}s: Failed to create new asset.: %{darwin.errno}d", buf, 0x12u);
        }
        *__error() = v15;
        uint64_t v8 = 12;
      }
    }
  }
  if (v18 != -1 && close(v18) == -1) {
    _cryptex_bundle_new_asset_from_object_cold_1(&v19, buf);
  }
  return v8;
}

uint64_t cryptex_copy_installed_cryptex()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v0 = *__error();
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    v2[0] = 67109120;
    v2[1] = 45;
    _os_log_impl(&dword_21DAF1000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Not supported on this platform.: %{darwin.errno}d", (uint8_t *)v2, 8u);
  }
  *__error() = v0;
  return 45;
}

uint64_t cryptex_upgrade_stage2(uint64_t a1, uint64_t a2, uint64_t a3, CFTypeRef *a4)
{
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  int v5 = (char *)_os_log_send_and_compose_impl();
  CFErrorRef Error = createError("cryptex_upgrade_stage2", "cryptex.c", 1220, "com.apple.security.cryptex", 10, 0, v5);
  free(v5);
  if (a4 && Error)
  {
    *a4 = CFRetain(Error);
LABEL_5:
    CFRelease(Error);
    return 0;
  }
  if (Error) {
    goto LABEL_5;
  }
  return 1;
}

uint64_t cryptex_upgrade_commit2(uint64_t a1, CFTypeRef *a2)
{
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  uint64_t v3 = (char *)_os_log_send_and_compose_impl();
  CFErrorRef Error = createError("cryptex_upgrade_commit2", "cryptex.c", 1242, "com.apple.security.cryptex", 10, 0, v3);
  free(v3);
  if (a2 && Error)
  {
    *a2 = CFRetain(Error);
LABEL_5:
    CFRelease(Error);
    return 0;
  }
  if (Error) {
    goto LABEL_5;
  }
  return 1;
}

uint64_t cryptex_upgrade_abort2(uint64_t a1, CFTypeRef *a2)
{
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  uint64_t v3 = (char *)_os_log_send_and_compose_impl();
  CFErrorRef Error = createError("cryptex_upgrade_abort2", "cryptex.c", 1264, "com.apple.security.cryptex", 10, 0, v3);
  free(v3);
  if (a2 && Error)
  {
    *a2 = CFRetain(Error);
LABEL_5:
    CFRelease(Error);
    return 0;
  }
  if (Error) {
    goto LABEL_5;
  }
  return 1;
}

uint64_t _cryptex_identity_init_from_dict(void *a1, NSObject *a2, uint64_t a3, int a4)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  int v55 = 0;
  unint64_t v8 = (unint64_t)_xpc_plist_value_copy((uint64_t)&_ap_boardid, a1);
  if (!v8)
  {
    int v9 = *__error();
    if (os_log_type_enabled(a2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v57 = "ApBoardID";
      _os_log_impl(&dword_21DAF1000, a2, OS_LOG_TYPE_DEBUG, "missing property: %s", buf, 0xCu);
    }
    *__error() = v9;
  }
  unint64_t v10 = (unint64_t)_xpc_plist_value_copy((uint64_t)&_ap_chipid, a1);
  if (!v10)
  {
    int v11 = *__error();
    if (os_log_type_enabled(a2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v57 = "ApChipID";
      _os_log_impl(&dword_21DAF1000, a2, OS_LOG_TYPE_DEBUG, "missing property: %s", buf, 0xCu);
    }
    *__error() = v11;
  }
  unint64_t v12 = (unint64_t)_xpc_plist_value_copy((uint64_t)&_ap_security_domain, a1);
  if (!v12)
  {
    int v21 = *__error();
    if (os_log_type_enabled(a2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v57 = "ApSecurityDomain";
      _os_log_impl(&dword_21DAF1000, a2, OS_LOG_TYPE_DEBUG, "missing property: %s", buf, 0xCu);
    }
    *__error() = v21;
    if (a4) {
      goto LABEL_11;
    }
LABEL_28:
    xpc_object_t v13 = 0;
    xpc_object_t v15 = 0;
    xpc_object_t v17 = 0;
    long long v20 = 0;
    goto LABEL_32;
  }
  if (!a4) {
    goto LABEL_28;
  }
LABEL_11:
  xpc_object_t v13 = _xpc_plist_value_copy((uint64_t)&_cryptex1_chip, a1);
  if (!v13)
  {
    int v14 = *__error();
    if (os_log_type_enabled(a2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v57 = "Cryptex1,ChipID";
      _os_log_impl(&dword_21DAF1000, a2, OS_LOG_TYPE_DEBUG, "missing property: %s", buf, 0xCu);
    }
    *__error() = v14;
  }
  xpc_object_t v15 = _xpc_plist_value_copy((uint64_t)&_cryptex1_type, a1);
  if (!v15)
  {
    int v16 = *__error();
    if (os_log_type_enabled(a2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v57 = "Cryptex1,Type";
      _os_log_impl(&dword_21DAF1000, a2, OS_LOG_TYPE_DEBUG, "missing property: %s", buf, 0xCu);
    }
    *__error() = v16;
  }
  xpc_object_t v17 = _xpc_plist_value_copy((uint64_t)&_cryptex1_styp_0, a1);
  if (!v17)
  {
    int v18 = *__error();
    if (os_log_type_enabled(a2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v57 = "Cryptex1,SubType";
      _os_log_impl(&dword_21DAF1000, a2, OS_LOG_TYPE_DEBUG, "missing property: %s", buf, 0xCu);
    }
    *__error() = v18;
  }
  xpc_object_t v19 = _xpc_plist_value_copy((uint64_t)&_cryptex1_product_class, a1);
  if (v19)
  {
    long long v20 = v19;
  }
  else
  {
    int v22 = *__error();
    if (os_log_type_enabled(a2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v57 = "Cryptex1,ProductClass";
      _os_log_impl(&dword_21DAF1000, a2, OS_LOG_TYPE_DEBUG, "missing property: %s", buf, 0xCu);
    }
    long long v20 = 0;
    *__error() = v22;
  }
LABEL_32:
  if (v8) {
    BOOL v23 = v10 == 0;
  }
  else {
    BOOL v23 = 1;
  }
  int v25 = !v23 && v12 != 0;
  if (v25 != ((v8 | v10 | v12) != 0))
  {
    int v26 = *__error();
    if (!os_log_type_enabled(a2, OS_LOG_TYPE_ERROR)) {
      goto LABEL_68;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v57) = 22;
    __int16 v27 = "build identity device identifiers incomplete: %{darwin.errno}d";
    goto LABEL_67;
  }
  if ((!v15 || !v17 || !v20) && (v13 || v15 || v17 || v20))
  {
    int v26 = *__error();
    if (!os_log_type_enabled(a2, OS_LOG_TYPE_ERROR)) {
      goto LABEL_68;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v57) = 22;
    __int16 v27 = "build identity cryptex1 identifiers incomplete: %{darwin.errno}d";
LABEL_67:
    _os_log_impl(&dword_21DAF1000, a2, OS_LOG_TYPE_ERROR, v27, buf, 8u);
LABEL_68:
    *__error() = v26;
    uint64_t v39 = 22;
    if (!v20) {
      goto LABEL_92;
    }
LABEL_91:
    os_release(v20);
    goto LABEL_92;
  }
  if (v8 | v10 | v12)
  {
    string_ptr = xpc_string_get_string_ptr((xpc_object_t)v8);
    int v29 = _strtou32(string_ptr, &v55, 0);
    if (v55 && *v55)
    {
      int v30 = *__error();
      if (!os_log_type_enabled(a2, OS_LOG_TYPE_ERROR)) {
        goto LABEL_90;
      }
      *(_DWORD *)buf = 136315650;
      __int16 v57 = "ApBoardID";
      __int16 v58 = 2112;
      unint64_t v59 = v8;
      __int16 v60 = 1024;
      int v61 = 214;
      goto LABEL_89;
    }
    uint64_t v40 = xpc_string_get_string_ptr((xpc_object_t)v10);
    int v41 = _strtou32(v40, &v55, 0);
    if (v55 && *v55)
    {
      int v30 = *__error();
      if (!os_log_type_enabled(a2, OS_LOG_TYPE_ERROR)) {
        goto LABEL_90;
      }
      *(_DWORD *)buf = 136315650;
      __int16 v57 = "ApChipID";
      __int16 v58 = 2112;
      unint64_t v59 = v10;
      __int16 v60 = 1024;
      int v61 = 214;
      goto LABEL_89;
    }
    HIDWORD(v54) = v41;
    uint64_t v42 = xpc_string_get_string_ptr((xpc_object_t)v12);
    int v43 = _strtou32(v42, &v55, 0);
    if (v55 && *v55)
    {
      int v30 = *__error();
      if (!os_log_type_enabled(a2, OS_LOG_TYPE_ERROR)) {
        goto LABEL_90;
      }
      *(_DWORD *)buf = 136315650;
      __int16 v57 = "ApSecurityDomain";
      __int16 v58 = 2112;
      unint64_t v59 = v12;
      __int16 v60 = 1024;
      int v61 = 214;
      goto LABEL_89;
    }
    int v53 = v43;
    LODWORD(v54) = v29;
    uint64_t v32 = 0;
    if (v13) {
      goto LABEL_79;
    }
  }
  else
  {
    int v31 = *__error();
    if (os_log_type_enabled(a2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DAF1000, a2, OS_LOG_TYPE_DEBUG, "build identity has no device identifiers", buf, 2u);
    }
    uint64_t v54 = 0;
    int v53 = 0;
    *__error() = v31;
    uint64_t v32 = 1;
    if (v13) {
      goto LABEL_79;
    }
  }
  if (!v15 && !v17 && !v20)
  {
    uint64_t v51 = v32;
    uint64_t v52 = a3;
    xpc_object_t v49 = v13;
    int v33 = *__error();
    if (os_log_type_enabled(a2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DAF1000, a2, OS_LOG_TYPE_DEBUG, "build identity has no cryptex1 identifiers", buf, 2u);
    }
    uint64_t v34 = __error();
    int v35 = 0;
    int value = 0;
    int v37 = 0;
    int v38 = 0;
    *uint64_t v34 = v33;
    xpc_object_t v13 = v49;
    goto LABEL_106;
  }
LABEL_79:
  if (v13)
  {
    uint64_t v44 = v32 | 6;
    int v45 = xpc_string_get_string_ptr(v13);
    int v46 = _strtou32(v45, &v55, 0);
    if (v55 && *v55)
    {
      int v30 = *__error();
      if (!os_log_type_enabled(a2, OS_LOG_TYPE_ERROR)) {
        goto LABEL_90;
      }
      *(_DWORD *)buf = 136315650;
      __int16 v57 = "Cryptex1,ChipID";
      __int16 v58 = 2112;
      unint64_t v59 = (unint64_t)v13;
      __int16 v60 = 1024;
      int v61 = 214;
      goto LABEL_89;
    }
  }
  else
  {
    int v46 = 0;
    uint64_t v44 = v32 | 2;
  }
  int v50 = v46;
  uint64_t v51 = v44;
  uint64_t v52 = a3;
  int value = xpc_int64_get_value(v15);
  int v37 = xpc_int64_get_value(v17);
  __int16 v47 = xpc_string_get_string_ptr(v20);
  int v38 = _strtou32(v47, &v55, 0);
  if (v55)
  {
    int v35 = v50;
    if (*v55)
    {
      int v30 = *__error();
      if (!os_log_type_enabled(a2, OS_LOG_TYPE_ERROR)) {
        goto LABEL_90;
      }
      *(_DWORD *)buf = 136315650;
      __int16 v57 = "Cryptex1,ProductClass";
      __int16 v58 = 2112;
      unint64_t v59 = (unint64_t)v20;
      __int16 v60 = 1024;
      int v61 = 214;
LABEL_89:
      _os_log_impl(&dword_21DAF1000, a2, OS_LOG_TYPE_ERROR, "invalid %s value: %@: %{darwin.errno}d", buf, 0x1Cu);
LABEL_90:
      *__error() = v30;
      uint64_t v39 = 214;
      if (!v20) {
        goto LABEL_92;
      }
      goto LABEL_91;
    }
  }
  else
  {
    int v35 = v50;
  }
LABEL_106:
  uint64_t v39 = 0;
  *(void *)uint64_t v52 = 1;
  *(void *)(v52 + 8) = v51;
  *(void *)(v52 + 16) = v54;
  *(_DWORD *)(v52 + 24) = v53;
  *(_DWORD *)(v52 + 28) = v35;
  *(_DWORD *)(v52 + 32) = value;
  *(_DWORD *)(v52 + 36) = v37;
  *(_DWORD *)(v52 + 40) = v38;
  *(_DWORD *)(v52 + 44) = 0;
  if (v20) {
    goto LABEL_91;
  }
LABEL_92:
  if (v17) {
    os_release(v17);
  }
  if (v15) {
    os_release(v15);
  }
  if (v13) {
    os_release(v13);
  }
  if (v12) {
    os_release((void *)v12);
  }
  if (v10) {
    os_release((void *)v10);
  }
  if (v8) {
    os_release((void *)v8);
  }
  return v39;
}

CFIndex cryptex_install(uint64_t a1, uint64_t a2)
{
  CFTypeRef cf = 0;
  if (cryptex_install2(a1, a2, (CFErrorRef *)&cf)) {
    TopLevelPosixCFErrorRef Error = 0;
  }
  else {
    TopLevelPosixCFErrorRef Error = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  }
  if (cf) {
    CFRelease(cf);
  }
  return TopLevelPosixError;
}

CFIndex cryptex_personalize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, NSObject *a5, uint64_t a6, uint64_t a7)
{
  CFErrorRef v10 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 0x40000000;
  v9[2] = __cryptex_personalize_block_invoke;
  v9[3] = &__block_descriptor_tmp_1;
  v9[4] = a7;
  _OWORD v9[5] = a6;
  if (cryptex_personalize2(a1, a2, a3, a4, &v10, a5, v9)) {
    TopLevelPosixCFErrorRef Error = 0;
  }
  else {
    TopLevelPosixCFErrorRef Error = _CFErrorGetTopLevelPosixError((CFIndex)v10);
  }
  if (v10) {
    CFRelease(v10);
  }
  return TopLevelPosixError;
}

uint64_t __cryptex_personalize_block_invoke(uint64_t a1, CFIndex TopLevelPosixError, uint64_t a3)
{
  if (TopLevelPosixError) {
    TopLevelPosixCFErrorRef Error = _CFErrorGetTopLevelPosixError(TopLevelPosixError);
  }
  int v6 = *(uint64_t (**)(uint64_t, CFIndex, uint64_t))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return v6(a3, TopLevelPosixError, v5);
}

CFErrorRef cryptex_fcopy_personalized_manifest(uint64_t a1, int a2)
{
  CFErrorRef result = cryptex_fcopy_personalized_manifest2(a1, a2);
  if (result)
  {
    CFErrorRef v3 = result;
    TopLevelPosixCFErrorRef Error = _CFErrorGetTopLevelPosixError((CFIndex)result);
    CFRelease(v3);
    return (CFErrorRef)TopLevelPosixError;
  }
  return result;
}

CFIndex cryptex_upgrade_abort(uint64_t a1)
{
  CFTypeRef cf = 0;
  if (cryptex_upgrade_abort2(a1, &cf)) {
    TopLevelPosixCFErrorRef Error = 0;
  }
  else {
    TopLevelPosixCFErrorRef Error = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  }
  if (cf) {
    CFRelease(cf);
  }
  return TopLevelPosixError;
}

CFIndex cryptex_upgrade_stage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFTypeRef cf = 0;
  if (cryptex_upgrade_stage2(a1, a2, a3, &cf)) {
    TopLevelPosixCFErrorRef Error = 0;
  }
  else {
    TopLevelPosixCFErrorRef Error = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  }
  if (cf) {
    CFRelease(cf);
  }
  return TopLevelPosixError;
}

CFIndex cryptex_upgrade_commit(uint64_t a1)
{
  CFTypeRef cf = 0;
  if (cryptex_upgrade_commit2(a1, &cf)) {
    TopLevelPosixCFErrorRef Error = 0;
  }
  else {
    TopLevelPosixCFErrorRef Error = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  }
  if (cf) {
    CFRelease(cf);
  }
  return TopLevelPosixError;
}

void _cryptex_personalize2_callback(uint64_t *a1)
{
  uint64_t v1 = *a1;
  CFErrorRef v3 = a1[3];
  uint64_t v2 = a1[4];
  uint64_t v4 = a1[2];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  v5[2] = ___cryptex_personalize2_callback_block_invoke;
  v5[3] = &unk_264470ED0;
  v5[4] = v2;
  v5[5] = v4;
  v5[6] = v1;
  v5[7] = a1;
  dispatch_async(v3, v5);
  if (v3) {
    os_release(v3);
  }
}

void ___cryptex_personalize2_callback_block_invoke(void *a1)
{
  (*(void (**)(void))(a1[4] + 16))();
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    os_release(v2);
  }
  CFErrorRef v3 = (const void *)a1[5];
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (void **)a1[7];

  ctx_destroy(v4);
}

CFDataRef _AMAuthInstallCryptex1CopyUDID(const __CFNumber *a1, const __CFNumber *a2)
{
  uint64_t v4 = 0;
  unint64_t v5 = 0;
  CFNumberGetValue(a1, kCFNumberSInt32Type, (char *)&v4 + 4);
  CFNumberGetValue(a2, kCFNumberSInt64Type, &v5);
  HIDWORD(v4) = bswap32(HIDWORD(v4));
  unint64_t v5 = bswap64(v5);
  return CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)&v4, 16);
}

id _remote_service_log()
{
  if (_remote_service_log_onceToken != -1) {
    dispatch_once(&_remote_service_log_onceToken, &__block_literal_global_156);
  }
  int v0 = (void *)_remote_service_log_osl;

  return v0;
}

void sub_21DB0DF50(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

void sub_21DB0E0B4(_Unwind_Exception *exception_object)
{
}

void sub_21DB0E790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, CFTypeRef cf)
{
  free(v12);
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(a1);
}

uint64_t cryptex_remote_service_nonce_get_nonce(void *a1)
{
  id v1 = a1;
  if (!v1) {
    cryptex_remote_service_nonce_get_nonce_cold_1();
  }
  uint64_t v2 = v1;
  uint64_t v3 = [v1 nonce];

  return v3;
}

CryptexRemoteServiceNonceAttr *cryptex_remote_service_nonce_attr_create()
{
  return objc_alloc_init(CryptexRemoteServiceNonceAttr);
}

void cryptex_remote_service_nonce_attr_set_image_type(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (!v3) {
    cryptex_remote_service_nonce_attr_set_image_type_cold_1();
  }
  id v4 = v3;
  [v3 setImage_type:a2];
}

void cryptex_remote_service_nonce_attr_set_persistence(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (!v3) {
    cryptex_remote_service_nonce_attr_set_image_type_cold_1();
  }
  id v4 = v3;
  [v3 setPersistence:a2];
}

void cryptex_remote_service_nonce_attr_set_cryptex(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v3) {
    cryptex_remote_service_nonce_attr_set_image_type_cold_1();
  }
  unint64_t v5 = v4;
  if (!v4) {
    cryptex_remote_service_nonce_attr_set_cryptex_cold_2();
  }
  int v6 = _cryptex_get_core((uint64_t)v4);
  [v3 setImage_type:cryptex_get_image_type()];
  if (objc_msgSend(v3, "image_type") == 2)
  {
    if (cryptex_core_get_nonce_domain_handle()) {
      cryptex_remote_service_nonce_attr_set_cryptex_cold_3();
    }
    [v3 setNdom_handle:0];
  }
}

uint64_t cryptex_remote_service_nonce_attr_get_nonce_domain(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (!v1) {
    cryptex_remote_service_nonce_attr_set_image_type_cold_1();
  }
  uint64_t v2 = v1;
  unint64_t v3 = [v1 getNonceDomainIndex];
  int v4 = *__error();
  unint64_t v5 = _remote_service_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134218496;
    uint64_t v9 = [v2 image_type];
    __int16 v10 = 2048;
    uint64_t v11 = [v2 persistence];
    __int16 v12 = 2048;
    unint64_t v13 = v3;
    _os_log_impl(&dword_21DAF1000, v5, OS_LOG_TYPE_DEBUG, "nonce attr [image_type = %llu, persistence = %llu] => domain index: %llu", (uint8_t *)&v8, 0x20u);
  }

  *__error() = v4;
  uint64_t nonce_domain_from_index = _img4_get_nonce_domain_from_index(v3);

  return nonce_domain_from_index;
}

BOOL cryptex_remote_service_copy_device_identifier2(void *a1, void *a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v5 = a1;
  if (!v5) {
    cryptex_remote_service_copy_device_identifier2_cold_1();
  }
  if (!a2) {
    cryptex_remote_service_copy_device_identifier2_cold_2();
  }
  int v6 = v5;
  uint64_t v55 = 0;
  int v56 = &v55;
  uint64_t v57 = 0x2020000000;
  uint64_t v58 = 0;
  memset(v59, 0, sizeof(v59));
  LOWORD(v59[0]) = 6;
  uint64_t v49 = 0;
  int v50 = &v49;
  uint64_t v51 = 0x3032000000;
  uint64_t v52 = __Block_byref_object_copy_;
  int v53 = __Block_byref_object_dispose_;
  id v54 = 0;
  if ([v5 supportsFeature:"ReadIdentifiers"])
  {
    personalization_identifiers_request = (void *)remote_service_create_personalization_identifiers_request();
    int v8 = [v6 internal_queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __cryptex_remote_service_copy_device_identifier2_block_invoke;
    block[3] = &unk_264470EF8;
    __int16 v47 = &v55;
    id v45 = v6;
    id v9 = personalization_identifiers_request;
    id v46 = v9;
    int v48 = &v49;
    dispatch_sync(v8, block);

    if (v56[3])
    {
      int v10 = *__error();
      uint64_t v11 = _remote_service_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = v56[3];
        *(_DWORD *)buf = 138412290;
        uint64_t v61 = v12;
        _os_log_impl(&dword_21DAF1000, v11, OS_LOG_TYPE_ERROR, "personalization identifier request failed: %@", buf, 0xCu);
      }
LABEL_18:

      *__error() = v10;
      CFErrorRef v28 = 0;
      goto LABEL_38;
    }
    uint64_t v26 = img4_chip_instance_from_xpc((void *)v50[5], (uint64_t)v59);
    v56[3] = v26;
    if (v26)
    {
      int v10 = *__error();
      uint64_t v11 = _remote_service_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = v56[3];
        *(_DWORD *)buf = 138412290;
        uint64_t v61 = v27;
        _os_log_impl(&dword_21DAF1000, v11, OS_LOG_TYPE_ERROR, "failed to decode AppleImage4 chip instance.: %@", buf, 0xCu);
      }
      goto LABEL_18;
    }

    id v13 = v45;
    goto LABEL_25;
  }
  id v13 = v6;
  uint64_t v14 = [v13 device];
  BOOL v15 = remote_device_get_state() == 2;

  if (!v15)
  {
    int v22 = _remote_service_log();

    if (v22)
    {
      BOOL v23 = _remote_service_log();
      os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      uint64_t v24 = [v13 device];
      uint64_t name = remote_device_get_name();
      *(_DWORD *)buf = 136315138;
      uint64_t v61 = name;
      int v21 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      id v29 = MEMORY[0x263EF8438];
      int v30 = [v13 device];
      uint64_t v31 = remote_device_get_name();
      *(_DWORD *)buf = 136315138;
      uint64_t v61 = v31;
      int v21 = (char *)_os_log_send_and_compose_impl();

      BOOL v23 = MEMORY[0x263EF8438];
    }

    CFErrorRef Error = createError("_cryptex_remote_service_copy_device_identifier_from_rsd", "remote_service.m", 396, "com.apple.security.cryptex", 19, 0, v21);
    goto LABEL_30;
  }
  int v16 = [v13 device];
  xpc_object_t v17 = (void *)remote_device_copy_properties();

  if (!v17)
  {
    int v33 = _remote_service_log();

    if (v33)
    {
      uint64_t v34 = _remote_service_log();
      os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      int v21 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_WORD *)buf = 0;
      int v21 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("_cryptex_remote_service_copy_device_identifier_from_rsd", "remote_service.m", 405, "com.apple.security.cryptex", 19, 0, v21);
LABEL_30:
    CFErrorRef v28 = Error;
    xpc_object_t v17 = 0;
    goto LABEL_31;
  }
  int v18 = _img4_chip_instance_from_remote_device_properties(v17, (uint64_t)v59);
  if (!v18)
  {

    id v9 = 0;
LABEL_25:

LABEL_35:
    CFErrorRef v28 = 0;
    *a2 = [[CryptexRemoteDeviceIdentifier alloc] initWithChipInstance:v59];
    goto LABEL_38;
  }
  xpc_object_t v19 = _remote_service_log();

  if (v19)
  {
    long long v20 = _remote_service_log();
    os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 67109120;
    LODWORD(v61) = v18;
    int v21 = (char *)_os_log_send_and_compose_impl();
  }
  else
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v61) = v18;
    int v21 = (char *)_os_log_send_and_compose_impl();
  }
  CFErrorRef v28 = createError("_cryptex_remote_service_copy_device_identifier_from_rsd", "remote_service.m", 416, "com.apple.security.cryptex.posix", v18, 0, v21);
LABEL_31:
  free(v21);

  if (!v28)
  {
    id v9 = 0;
    goto LABEL_35;
  }
  int v35 = _remote_service_log();

  if (v35)
  {
    int v36 = _remote_service_log();
    os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    *(_WORD *)buf = 0;
    int v37 = (char *)_os_log_send_and_compose_impl();
  }
  else
  {
    *(_WORD *)buf = 0;
    int v37 = (char *)_os_log_send_and_compose_impl();
  }
  CFErrorRef v38 = createError("cryptex_remote_service_copy_device_identifier2", "remote_service.m", 541, "com.apple.security.cryptex", 19, v28, v37);
  free(v37);
  id v9 = 0;
  v56[3] = (uint64_t)v38;
LABEL_38:
  uint64_t v39 = v56;
  if (a3)
  {
    CFTypeRef v40 = (CFTypeRef)v56[3];
    if (v40)
    {
      CFTypeRef v40 = CFRetain(v40);
      uint64_t v39 = v56;
    }
    *a3 = v40;
  }
  uint64_t v41 = v39[3];
  _Block_object_dispose(&v49, 8);

  if (v28) {
    CFRelease(v28);
  }
  _Block_object_dispose(&v55, 8);
  uint64_t v42 = (const void *)v56[3];
  if (v42) {
    CFRelease(v42);
  }

  return v41 == 0;
}

void sub_21DB0F61C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26)
{
  free(v26);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);
  CFErrorRef v28 = *(const void **)(a26 + 24);
  if (v28) {
    CFRelease(v28);
  }
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __cryptex_remote_service_copy_device_identifier2_block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 sendRequestSync:v3 response:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(void *)(*(void *)(a1[6] + 8) + 24) = v5;
}

uint64_t cryptex_remote_device_identifier_get_chip_inst(void *a1)
{
  id v1 = a1;
  if (!v1) {
    cryptex_remote_service_copy_device_identifier2_cold_2();
  }
  uint64_t v2 = v1;
  uint64_t v3 = [v1 inst];

  return v3;
}

uint64_t cryptex_remote_cryptex_get_identifier(void *a1)
{
  id v1 = a1;
  if (!v1) {
    cryptex_remote_cryptex_get_identifier_cold_1();
  }
  uint64_t v2 = v1;
  uint64_t v3 = [v1 identifier];

  return v3;
}

uint64_t cryptex_remote_cryptex_get_version_string(void *a1)
{
  id v1 = a1;
  if (!v1) {
    cryptex_remote_cryptex_get_identifier_cold_1();
  }
  uint64_t v2 = v1;
  uint64_t v3 = [v1 version];

  return v3;
}

void cryptex_remote_array_apply(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v3) {
    cryptex_remote_array_apply_cold_1();
  }
  uint64_t v5 = v4;
  if (!v4) {
    cryptex_remote_array_apply_cold_2();
  }
  int v6 = [v3 array];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __cryptex_remote_array_apply_block_invoke;
  v8[3] = &unk_264470F20;
  id v9 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];
}

uint64_t __cryptex_remote_array_apply_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a4 = result ^ 1;
  return result;
}

CryptexRemoteService *cryptex_remote_service_create(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if (!v5) {
    cryptex_remote_service_create_cold_1();
  }
  id v7 = v6;
  if (!v6) {
    cryptex_remote_service_create_cold_2();
  }
  int v8 = [[CryptexRemoteService alloc] initWithDevice:v5 queue:v6 flags:a3];

  return v8;
}

BOOL cryptex_remote_service_copy_nonce2(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  if (!v7) {
    cryptex_remote_service_copy_device_identifier2_cold_1();
  }
  id v9 = v8;
  if (!v8) {
    cryptex_remote_service_nonce_attr_set_image_type_cold_1();
  }
  if (!a3) {
    cryptex_remote_service_nonce_get_nonce_cold_1();
  }
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  uint64_t v35 = 0;
  int v36 = &v35;
  uint64_t v37 = 0x3032000000;
  CFErrorRef v38 = __Block_byref_object_copy_;
  uint64_t v39 = __Block_byref_object_dispose_;
  id v40 = 0;
  if (objc_msgSend(v8, "image_type") == 2)
  {
    [v9 ndom_handle];
    uint64_t nonce_handle_request = remote_service_create_nonce_handle_request();
  }
  else
  {
    [v9 getNonceDomainIndex];
    uint64_t nonce_handle_request = remote_service_create_nonce_index_request();
  }
  uint64_t v11 = (void *)nonce_handle_request;
  uint64_t v12 = [v7 internal_queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __cryptex_remote_service_copy_nonce2_block_invoke;
  block[3] = &unk_264470EF8;
  int v33 = &v41;
  id v13 = v7;
  id v31 = v13;
  id v14 = v11;
  id v32 = v14;
  uint64_t v34 = &v35;
  dispatch_sync(v12, block);

  if (v42[3])
  {
    int v15 = *__error();
    int v16 = _remote_service_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = v42[3];
      *(_DWORD *)buf = 138412290;
      uint64_t v46 = v17;
      _os_log_impl(&dword_21DAF1000, v16, OS_LOG_TYPE_ERROR, "remote service copy nonce request failed: %@", buf, 0xCu);
    }

    *__error() = v15;
  }
  else
  {
    size_t length = 0;
    data = xpc_dictionary_get_data((xpc_object_t)v36[5], "nonce", &length);
    if (*data)
    {
      xpc_object_t v19 = _remote_service_log();

      if (v19)
      {
        long long v20 = _remote_service_log();
        os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
        int v21 = (unsigned __int16)*data;
        *(_DWORD *)buf = 67109120;
        LODWORD(v46) = v21;
        int v22 = (char *)_os_log_send_and_compose_impl();
      }
      else
      {
        int v23 = (unsigned __int16)*data;
        *(_DWORD *)buf = 67109120;
        LODWORD(v46) = v23;
        int v22 = (char *)_os_log_send_and_compose_impl();
      }
      CFErrorRef Error = createError("cryptex_remote_service_copy_nonce2", "remote_service.m", 650, "com.apple.security.cryptex", 10, 0, v22);
      free(v22);
      v42[3] = (uint64_t)Error;
    }
    else
    {
      *a3 = [[CryptexRemoteServiceNonce alloc] initWithNonce:data];
    }
  }
  int v25 = v42;
  if (a4)
  {
    CFTypeRef v26 = (CFTypeRef)v42[3];
    if (v26)
    {
      CFTypeRef v26 = CFRetain(v26);
      int v25 = v42;
    }
    *a4 = v26;
  }
  BOOL v27 = v25[3] == 0;

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v27;
}

void sub_21DB0FD9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  free(v21);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v22 - 128), 8);
  _Unwind_Resume(a1);
}

void __cryptex_remote_service_copy_nonce2_block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 sendRequestSync:v3 response:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(void *)(*(void *)(a1[6] + 8) + 24) = v5;
}

BOOL cryptex_remote_service_roll_nonce2(void *a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  if (!v5) {
    cryptex_remote_service_copy_device_identifier2_cold_1();
  }
  id v7 = v6;
  if (!v6) {
    cryptex_remote_service_roll_nonce2_cold_2();
  }
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  id v27 = 0;
  if (objc_msgSend(v6, "image_type") == 2)
  {
    [v7 ndom_handle];
    roll_uint64_t nonce_handle_request = remote_service_create_roll_nonce_handle_request();
  }
  else
  {
    [v7 getNonceDomainIndex];
    roll_uint64_t nonce_handle_request = remote_service_create_roll_nonce_index_request();
  }
  id v9 = (void *)roll_nonce_handle_request;
  int v10 = [v5 internal_queue];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __cryptex_remote_service_roll_nonce2_block_invoke;
  v21[3] = &unk_264470EF8;
  uint64_t v24 = &v28;
  id v11 = v5;
  id v22 = v11;
  id v12 = v9;
  id v23 = v12;
  int v25 = v26;
  dispatch_sync(v10, v21);

  id v13 = v29;
  if (v29[3])
  {
    int v14 = *__error();
    int v15 = _remote_service_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = v29[3];
      *(_DWORD *)buf = 138412290;
      uint64_t v33 = v16;
      _os_log_impl(&dword_21DAF1000, v15, OS_LOG_TYPE_ERROR, "remote service roll nonce request failed: %@", buf, 0xCu);
    }

    *__error() = v14;
    id v13 = v29;
  }
  if (a3)
  {
    CFTypeRef v17 = (CFTypeRef)v13[3];
    if (v17)
    {
      CFTypeRef v17 = CFRetain(v17);
      id v13 = v29;
    }
    *a3 = v17;
  }
  uint64_t v18 = v13[3];

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);
  xpc_object_t v19 = (const void *)v29[3];
  if (v19) {
    CFRelease(v19);
  }

  return v18 == 0;
}

void sub_21DB100D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);
  int v25 = *(const void **)(a24 + 24);
  if (v25) {
    CFRelease(v25);
  }
  _Unwind_Resume(a1);
}

void __cryptex_remote_service_roll_nonce2_block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 sendRequestSync:v3 response:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(void *)(*(void *)(a1[6] + 8) + 24) = v5;
}

BOOL cryptex_remote_service_install2(void *a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  uint64_t v42 = v9;
  if (!v9) {
    cryptex_remote_service_copy_device_identifier2_cold_1();
  }
  if (!v10) {
    cryptex_remote_service_nonce_attr_set_cryptex_cold_2();
  }
  if (!v11) {
    cryptex_remote_service_nonce_attr_set_image_type_cold_1();
  }
  uint64_t v44 = v11;
  if (!a5) {
    cryptex_remote_cryptex_get_identifier_cold_1();
  }
  uint64_t v57 = 0;
  uint64_t v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = 0;
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000;
  id v54 = __Block_byref_object_copy_;
  uint64_t v55 = __Block_byref_object_dispose_;
  id v56 = 0;
  id v12 = _cryptex_get_core((uint64_t)v10);
  if (!cryptex_core_get_image_asset())
  {
    id v13 = _remote_service_log();

    if (v13)
    {
      int v14 = _remote_service_log();
      os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      int v15 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_WORD *)buf = 0;
      int v15 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("cryptex_remote_service_install2", "remote_service.m", 746, "com.apple.security.cryptex", 11, 0, v15);
    goto LABEL_39;
  }
  dup_np();
  if (!cryptex_core_get_tc_asset())
  {
    uint64_t v16 = _remote_service_log();

    if (v16)
    {
      CFTypeRef v17 = _remote_service_log();
      os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      int v15 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_WORD *)buf = 0;
      int v15 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("cryptex_remote_service_install2", "remote_service.m", 757, "com.apple.security.cryptex", 11, 0, v15);
    goto LABEL_39;
  }
  dup_np();
  if (!cryptex_core_get_asset())
  {
    uint64_t v18 = _remote_service_log();

    if (v18)
    {
      xpc_object_t v19 = _remote_service_log();
      os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      int v15 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_WORD *)buf = 0;
      int v15 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("cryptex_remote_service_install2", "remote_service.m", 767, "com.apple.security.cryptex", 11, 0, v15);
LABEL_39:
    CFErrorRef v36 = Error;
    free(v15);
    int v21 = 0;
    id v22 = 0;
    id v27 = 0;
    uint64_t v35 = 0;
    v58[3] = (uint64_t)v36;
    goto LABEL_40;
  }
  dup_np();
  if (cryptex_core_get_info_asset()) {
    dup_np();
  }
  if (cryptex_core_get_volumehash_asset()) {
    dup_np();
  }
  if (cryptex_core_is_cryptex1())
  {
    int v21 = cryptex_core_get_cryptex1_properties();
    id v22 = (void *)cryptex_core_cx1_copy_xpc_dictionary();
  }
  else
  {
    id v22 = xpc_dictionary_create(0, 0, 0);
    int v21 = 0;
  }
  uint64_t core = _cryptex_get_core((uint64_t)v44);
  if (core == 2) {
    uint64_t v24 = 2;
  }
  else {
    uint64_t v24 = core == 1;
  }
  uint64_t nonce_persistence = _cryptex_attr_get_nonce_persistence((uint64_t)v44);
  _cryptex_attr_get_authentication((uint64_t)v44);
  uint64_t v50 = 0;
  uint64_t install_request = remote_service_create_install_request();
  id v27 = 0;
  v58[3] = install_request;
  if (install_request)
  {
    int v28 = *__error();
    id v29 = _remote_service_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = v58[3];
      *(_DWORD *)buf = 138412290;
      uint64_t v62 = v30;
      _os_log_impl(&dword_21DAF1000, v29, OS_LOG_TYPE_ERROR, "failed to create remote service install request: %@", buf, 0xCu);
    }

    uint64_t v31 = __error();
LABEL_34:
    uint64_t v35 = 0;
    *uint64_t v31 = v28;
    goto LABEL_40;
  }
  id v32 = [v42 internal_queue:v24 nonce_persistence:1 v22];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __cryptex_remote_service_install2_block_invoke;
  block[3] = &unk_264470EF8;
  int v48 = &v57;
  id v46 = v42;
  id v27 = v27;
  id v47 = v27;
  uint64_t v49 = &v51;
  dispatch_sync(v32, block);

  if (v58[3])
  {
    int v28 = *__error();
    uint64_t v33 = _remote_service_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = v58[3];
      *(_DWORD *)buf = 138412290;
      uint64_t v62 = v34;
      _os_log_impl(&dword_21DAF1000, v33, OS_LOG_TYPE_ERROR, "remote service install request failed: %@", buf, 0xCu);
    }

    uint64_t v31 = __error();
    goto LABEL_34;
  }
  uint64_t v35 = xpc_dictionary_get_dictionary((xpc_object_t)v52[5], "remote-cryptex");
  *a5 = [[CryptexRemoteObject alloc] initWithDesc:v35];
LABEL_40:
  uint64_t v37 = v58;
  if (a6)
  {
    CFTypeRef v38 = (CFTypeRef)v58[3];
    if (v38)
    {
      CFTypeRef v38 = CFRetain(v38);
      uint64_t v37 = v58;
    }
    *a6 = v38;
  }
  uint64_t v39 = v37[3];

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);
  id v40 = (const void *)v58[3];
  if (v40) {
    CFRelease(v40);
  }

  return v39 == 0;
}

void sub_21DB10958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  id v29 = *(const void **)(*(void *)(v27 - 152) + 24);
  if (v29) {
    CFRelease(v29);
  }
  _Unwind_Resume(a1);
}

void __cryptex_remote_service_install2_block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 sendRequestSync:v3 response:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(void *)(*(void *)(a1[6] + 8) + 24) = v5;
}

BOOL cryptex_remote_service_uninstall2(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a1;
  if (!v7) {
    cryptex_remote_service_copy_device_identifier2_cold_1();
  }
  if (!a2) {
    cryptex_remote_service_uninstall2_cold_2();
  }
  id v8 = v7;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  id v27 = 0;
  unuint64_t install_request = (void *)remote_service_create_uninstall_request();
  id v10 = [v8 internal_queue];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __cryptex_remote_service_uninstall2_block_invoke;
  v21[3] = &unk_264470EF8;
  uint64_t v24 = &v28;
  id v11 = v8;
  id v22 = v11;
  id v12 = uninstall_request;
  id v23 = v12;
  int v25 = v26;
  dispatch_sync(v10, v21);

  id v13 = v29;
  if (v29[3])
  {
    int v14 = *__error();
    int v15 = _remote_service_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = v29[3];
      *(_DWORD *)buf = 138412290;
      uint64_t v33 = v16;
      _os_log_impl(&dword_21DAF1000, v15, OS_LOG_TYPE_ERROR, "remote service uninstall request failed: %@", buf, 0xCu);
    }

    *__error() = v14;
    id v13 = v29;
  }
  if (a5)
  {
    CFTypeRef v17 = (CFTypeRef)v13[3];
    if (v17)
    {
      CFTypeRef v17 = CFRetain(v17);
      id v13 = v29;
    }
    *a5 = v17;
  }
  uint64_t v18 = v13[3];

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);
  xpc_object_t v19 = (const void *)v29[3];
  if (v19) {
    CFRelease(v19);
  }

  return v18 == 0;
}

void sub_21DB10C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);
  int v25 = *(const void **)(a24 + 24);
  if (v25) {
    CFRelease(v25);
  }
  _Unwind_Resume(a1);
}

void __cryptex_remote_service_uninstall2_block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 sendRequestSync:v3 response:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(void *)(*(void *)(a1[6] + 8) + 24) = v5;
}

BOOL cryptex_remote_service_copy_installed2(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a1;
  if (!v6) {
    cryptex_remote_service_copy_device_identifier2_cold_1();
  }
  if (!a3) {
    cryptex_remote_service_copy_installed2_cold_2();
  }
  id v7 = v6;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy_;
  CFTypeRef v38 = __Block_byref_object_dispose_;
  id v39 = 0;
  id v8 = [MEMORY[0x263EFF980] array];
  copy_installed_request = (void *)remote_service_create_copy_installed_request();
  id v10 = [v7 internal_queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __cryptex_remote_service_copy_installed2_block_invoke;
  block[3] = &unk_264470EF8;
  id v32 = &v40;
  id v11 = v7;
  id v30 = v11;
  id v12 = copy_installed_request;
  id v31 = v12;
  uint64_t v33 = &v34;
  dispatch_sync(v10, block);

  if (v41[3])
  {
    int v13 = *__error();
    int v14 = _remote_service_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = (const char *)v41[3];
      *(_DWORD *)buf = 138412290;
      id v45 = v15;
      _os_log_impl(&dword_21DAF1000, v14, OS_LOG_TYPE_ERROR, "remote service install request failed: %@", buf, 0xCu);
    }

    uint64_t v16 = 0;
    *__error() = v13;
  }
  else if (_xpc_dictionary_key_with_type_exists((void *)v35[5], "remote-cryptex-array", MEMORY[0x263EF86D8]))
  {
    uint64_t v16 = xpc_dictionary_get_array((xpc_object_t)v35[5], "remote-cryptex-array");
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __cryptex_remote_service_copy_installed2_block_invoke_152;
    applier[3] = &unk_264470F48;
    id v17 = v8;
    id v28 = v17;
    xpc_array_apply(v16, applier);

    *a3 = [[CryptexRemoteObjectArray alloc] initWithArray:v17];
  }
  else
  {
    uint64_t v18 = _remote_service_log();

    if (v18)
    {
      xpc_object_t v19 = _remote_service_log();
      os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 136315138;
      id v45 = "remote-cryptex-array";
      long long v20 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_DWORD *)buf = 136315138;
      id v45 = "remote-cryptex-array";
      long long v20 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("cryptex_remote_service_copy_installed2", "remote_service.m", 934, "com.apple.security.cryptex", 16, 0, v20);
    free(v20);
    uint64_t v16 = 0;
    _OWORD v41[3] = (uint64_t)Error;
  }
  id v22 = v41;
  if (a4)
  {
    CFTypeRef v23 = (CFTypeRef)v41[3];
    if (v23)
    {
      CFTypeRef v23 = CFRetain(v23);
      id v22 = v41;
    }
    *a4 = v23;
  }
  uint64_t v24 = v22[3];

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);
  int v25 = (const void *)v41[3];
  if (v25) {
    CFRelease(v25);
  }

  return v24 == 0;
}

void sub_21DB111B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  free(v25);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose((const void *)(v26 - 160), 8);
  id v28 = *(const void **)(*(void *)(v26 - 152) + 24);
  if (v28) {
    CFRelease(v28);
  }
  _Unwind_Resume(a1);
}

void __cryptex_remote_service_copy_installed2_block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 sendRequestSync:v3 response:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(void *)(*(void *)(a1[6] + 8) + 24) = v5;
}

uint64_t __cryptex_remote_service_copy_installed2_block_invoke_152(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [[CryptexRemoteObject alloc] initWithDesc:v4];

  [*(id *)(a1 + 32) addObject:v5];
  return 1;
}

CFIndex cryptex_remote_service_copy_device_identifier(void *a1, void *a2)
{
  id v3 = a1;
  CFTypeRef cf = 0;
  if (cryptex_remote_service_copy_device_identifier2(v3, a2, &cf)) {
    TopLevelPosixCFErrorRef Error = 0;
  }
  else {
    TopLevelPosixCFErrorRef Error = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  }
  if (cf) {
    CFRelease(cf);
  }

  return TopLevelPosixError;
}

void sub_21DB11348(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(exception_object);
}

CFIndex cryptex_remote_service_copy_nonce(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  CFTypeRef cf = 0;
  if (cryptex_remote_service_copy_nonce2(v5, v6, a3, &cf)) {
    TopLevelPosixCFErrorRef Error = 0;
  }
  else {
    TopLevelPosixCFErrorRef Error = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  }
  if (cf) {
    CFRelease(cf);
  }

  return TopLevelPosixError;
}

void sub_21DB113F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(exception_object);
}

CFIndex cryptex_remote_service_roll_nonce(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  CFTypeRef cf = 0;
  if (cryptex_remote_service_roll_nonce2(v3, v4, &cf)) {
    TopLevelPosixCFErrorRef Error = 0;
  }
  else {
    TopLevelPosixCFErrorRef Error = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  }
  if (cf) {
    CFRelease(cf);
  }

  return TopLevelPosixError;
}

void sub_21DB11490(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(exception_object);
}

CFIndex cryptex_remote_service_install(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a1;
  id v9 = a2;
  id v10 = a3;
  CFTypeRef cf = 0;
  if (cryptex_remote_service_install2(v8, v9, v10, v11, a5, &cf)) {
    TopLevelPosixCFErrorRef Error = 0;
  }
  else {
    TopLevelPosixCFErrorRef Error = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  }
  if (cf) {
    CFRelease(cf);
  }

  return TopLevelPosixError;
}

void sub_21DB1154C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(exception_object);
}

CFIndex cryptex_remote_service_uninstall(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  CFTypeRef cf = 0;
  if (cryptex_remote_service_uninstall2(v5, a2, a3, v6, &cf)) {
    TopLevelPosixCFErrorRef Error = 0;
  }
  else {
    TopLevelPosixCFErrorRef Error = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  }
  if (cf) {
    CFRelease(cf);
  }

  return TopLevelPosixError;
}

void sub_21DB115E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(exception_object);
}

CFIndex cryptex_remote_service_copy_installed(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  CFTypeRef cf = 0;
  if (cryptex_remote_service_copy_installed2(v4, v5, a3, &cf)) {
    TopLevelPosixCFErrorRef Error = 0;
  }
  else {
    TopLevelPosixCFErrorRef Error = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  }
  if (cf) {
    CFRelease(cf);
  }

  return TopLevelPosixError;
}

void sub_21DB1166C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(exception_object);
}

uint64_t cryptex_remote_service_supports_feature(void *a1, const char *a2)
{
  return [a1 supportsFeature:a2];
}

uint64_t ___remote_service_log_block_invoke()
{
  _remote_service_log_osl = (uint64_t)os_log_create("com.apple.libcryptex", "remote_service_client");

  return MEMORY[0x270F9A758]();
}

uint64_t session_create()
{
  uint64_t v0 = session_core_create();

  return session_create_from_core(v0);
}

uint64_t session_set_homedir_size(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2) {
    return 22;
  }
  uint64_t result = 0;
  *(void *)(v2 + 64) = a2;
  return result;
}

void _session_dealloc(uint64_t a1)
{
  uint64_t v2 = *(_xpc_connection_s **)(a1 + 80);
  if (v2)
  {
    session_send_exit_message(v2);
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 80));
  }
  id v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    _Block_release(v3);
    *(void *)(a1 + 48) = 0;
  }
  id v4 = *(void **)(a1 + 80);
  if (v4) {
    xpc_release(v4);
  }
  uint64_t v5 = *(NSObject **)(a1 + 88);
  if (v5) {
    dispatch_release(v5);
  }
  os_release(*(void **)(a1 + 40));

  object_proto_destroy(a1 + 16);
}

void session_send_exit_message(_xpc_connection_s *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "REMOVE", 1);
  xpc_connection_send_message(a1, v2);
  if (v2)
  {
    os_release(v2);
  }
}

uint64_t session_activate(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  unsigned int v15 = -1;
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = (void *)cryptex_session_core_copy_xpc_object();
  if (MEMORY[0x223C12420]() != MEMORY[0x263EF8708]) {
    __break(1u);
  }
  uint64_t v44 = 0;
  memset(v43, 0, sizeof(v43));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  long long v29 = 0u;
  long long v28 = 0u;
  long long v27 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  uint64_t v20 = 32;
  id v4 = (void *)daemon_for_session_subsystem(&v15);
  uint64_t v5 = 0;
  if (!v15)
  {
    _cryptex_actor_init_invoke_u64();
    session_activate_pack();
    unsigned int v15 = cryptex_actor_trap();
    if (v15)
    {
      uint64_t v6 = (const char *)v4[2];
      int v7 = *__error();
      id v8 = v4[4];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = "[anonymous]";
        if (v6) {
          id v9 = v6;
        }
        *(_DWORD *)buf = 136446466;
        id v17 = v9;
        __int16 v18 = 1024;
        unsigned int v19 = v15;
        id v10 = "%{public}s: rpc failed for session create: %{darwin.errno}d";
LABEL_13:
        _os_log_impl(&dword_21DAF1000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0x12u);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    unsigned int v15 = session_activate_reply_unpack();
    if (v15)
    {
      uint64_t v11 = (const char *)v4[2];
      int v7 = *__error();
      id v8 = v4[4];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v12 = "[anonymous]";
        if (v11) {
          id v12 = v11;
        }
        *(_DWORD *)buf = 136446466;
        id v17 = v12;
        __int16 v18 = 1024;
        unsigned int v19 = v15;
        id v10 = "%{public}s: rpc_unpack failed for session_create_reply: %{darwin.errno}d";
        goto LABEL_13;
      }
LABEL_14:
      uint64_t v5 = 0;
      *__error() = v7;
      goto LABEL_15;
    }
    uint64_t v5 = (xpc_object_t *)cryptex_session_core_create_from_xpc();
    cryptex_session_core_merge();
    *(void *)(v2 + 88) = xpc_copy(v5[11]);
    session_activate_endpoint(a1);
    xpc_release(0);
  }
LABEL_15:
  uint64_t v13 = v15;
  rpc_destroy(&v20);
  rpc_destroy(v43);
  if (v3) {
    os_release(v3);
  }
  if (v4) {
    os_release(v4);
  }
  if (v5) {
    os_release(v5);
  }
  return v13;
}

uint64_t session_iter_list()
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  unsigned int v11 = -1;
  xpc_object_t xarray = 0;
  uint64_t v40 = 0;
  memset(v39, 0, sizeof(v39));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  long long v29 = 0u;
  long long v28 = 0u;
  long long v27 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  uint64_t v16 = 32;
  uint64_t v0 = (void *)daemon_for_session_subsystem(&v11);
  if (!v11)
  {
    _cryptex_actor_init_invoke_u64();
    session_list_pack();
    unsigned int v11 = cryptex_actor_trap();
    if (v11)
    {
      id v1 = (const char *)v0[2];
      int v2 = *__error();
      id v3 = v0[4];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        id v4 = "[anonymous]";
        if (v1) {
          id v4 = v1;
        }
        *(_DWORD *)buf = 136446466;
        uint64_t v13 = v4;
        __int16 v14 = 1024;
        unsigned int v15 = v11;
        uint64_t v5 = "%{public}s: rpc failed for session list: %{darwin.errno}d";
LABEL_12:
        _os_log_impl(&dword_21DAF1000, v3, OS_LOG_TYPE_ERROR, v5, buf, 0x12u);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
    unsigned int v11 = session_list_reply_unpack();
    if (v11)
    {
      uint64_t v6 = (const char *)v0[2];
      int v2 = *__error();
      id v3 = v0[4];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        int v7 = "[anonymous]";
        if (v6) {
          int v7 = v6;
        }
        *(_DWORD *)buf = 136446466;
        uint64_t v13 = v7;
        __int16 v14 = 1024;
        unsigned int v15 = v11;
        uint64_t v5 = "%{public}s: rpc_unpack failed for session_list_reply: %{darwin.errno}d";
        goto LABEL_12;
      }
LABEL_13:
      *__error() = v2;
      goto LABEL_14;
    }
    unsigned int v11 = 0;
  }
LABEL_14:
  uint64_t v8 = v11;
  rpc_destroy(&v16);
  rpc_destroy(v39);
  if (v0) {
    os_release(v0);
  }
  return v8;
}

uint64_t __session_iter_list_block_invoke(uint64_t a1)
{
  uint64_t v2 = cryptex_session_core_create_from_xpc();
  id v3 = (void *)session_create_from_core(v2);
  session_activate_endpoint((uint64_t)v3);
  if (!*(unsigned char *)(v3[5] + 120)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  os_release(v3);
  return 1;
}

uint64_t session_set_event_handler(uint64_t a1, uint64_t a2, NSObject *a3, void *aBlock)
{
  *(void *)(a1 + 56) = a2;
  *(void *)(a1 + 48) = _Block_copy(aBlock);
  *(void *)(a1 + 96) = a3;
  if (a3) {
    dispatch_retain(a3);
  }
  if (*(void *)(a1 + 80))
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_string(empty, "ACTIVATE", *(const char **)(*(void *)(a1 + 40) + 96));
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 80), empty);
    xpc_release(empty);
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_21DAF1000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "session does not have a valid connection", v8, 2u);
  }
  return 0;
}

int64_t session_send_message(_xpc_connection_s *a1, int64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v6, "COMMAND", a2);
  if (a3) {
    xpc_dictionary_set_value(v6, "PAYLOAD", a3);
  }
  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(a1, v6);
  if (v7)
  {
    uint64_t v8 = v7;
    if (xpc_dictionary_get_int64(v7, "STATE") == 1)
    {
      id v9 = (void *)xpc_copy_debug_description();
      int64_t int64 = xpc_dictionary_get_int64(v8, "ERROR");
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        v12[0] = 67109378;
        v12[1] = int64;
        __int16 v13 = 2080;
        __int16 v14 = v9;
        _os_log_impl(&dword_21DAF1000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "XPC error (code %d) in response to session message: %s", (uint8_t *)v12, 0x12u);
      }
      free(v9);
    }
    else
    {
      int64_t int64 = 0;
    }
    xpc_release(v8);
    if (v6) {
LABEL_14:
    }
      os_release(v6);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl(&dword_21DAF1000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Failed to get response to session message.", (uint8_t *)v12, 2u);
    }
    int64_t int64 = 61;
    if (v6) {
      goto LABEL_14;
    }
  }
  return int64;
}

void *cryptex_pack_core_cryptex(uint64_t a1, const char *a2)
{
  image_uint64_t asset = cryptex_core_get_image_asset();
  tc_uint64_t asset = cryptex_core_get_tc_asset();
  uint64_t info_asset = cryptex_core_get_info_asset();
  volumehash_uint64_t asset = cryptex_core_get_volumehash_asset();
  uint64_t asset = cryptex_core_get_asset();
  uint64_t cryptex1_properties = cryptex_core_get_cryptex1_properties();
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  unsigned int v11 = v10;
  if (image_asset)
  {
    int v12 = *(_DWORD *)(image_asset + 16);
    if (tc_asset)
    {
LABEL_3:
      int v13 = *(_DWORD *)(tc_asset + 16);
      goto LABEL_6;
    }
  }
  else
  {
    int v12 = -1;
    if (tc_asset) {
      goto LABEL_3;
    }
  }
  int v13 = -1;
LABEL_6:
  if (info_asset) {
    int v14 = *(_DWORD *)(info_asset + 16);
  }
  else {
    int v14 = -1;
  }
  int64_t v15 = *(void *)(*(void *)(a1 + 176) + 24);
  if (!volumehash_asset)
  {
    int v16 = -1;
    if (asset) {
      goto LABEL_11;
    }
LABEL_13:
    int v17 = -1;
    goto LABEL_14;
  }
  int v16 = *(_DWORD *)(volumehash_asset + 16);
  if (!asset) {
    goto LABEL_13;
  }
LABEL_11:
  int v17 = *(_DWORD *)(asset + 16);
LABEL_14:
  xpc_dictionary_set_fd(v10, "DMG", v12);
  xpc_dictionary_set_fd(v11, "TCH", v13);
  xpc_dictionary_set_fd(v11, "INF", v14);
  xpc_dictionary_set_fd(v11, "VOLHASH", v16);
  xpc_dictionary_set_fd(v11, "IM4", v17);
  xpc_dictionary_set_int64(v11, "TYPE", v15);
  xpc_dictionary_set_string(v11, "BUNDLEID", a2);
  if (cryptex1_properties)
  {
    long long v18 = (void *)cryptex_core_cx1_copy_xpc_dictionary();
    xpc_dictionary_set_value(v11, "CRYPTEX1_PROPERTIES", v18);
    if (v18) {
      os_release(v18);
    }
  }
  return v11;
}

xpc_object_t cryptex_array_pack_from_path(const char *a1, const char *a2, int *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  xpc_object_t object = 0;
  int v18 = -1;
  memset(v20, 0, sizeof(v20));
  if (a2) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = "default";
  }
  LOWORD(v20[0]) = 6;
  xpc_object_t v6 = xpc_array_create(0, 0);
  img4_chip_select_personalized_ap();
  if (img4_chip_instantiate())
  {
    xpc_object_t v7 = 0;
    uint64_t v8 = 0;
    int v9 = 71;
  }
  else
  {
    uint64_t v10 = *(void *)((char *)&v20[1] + 12);
    int v11 = DWORD1(v20[2]);
    int v18 = open(a1, 0x100000);
    if (v18 == -1)
    {
      int v9 = *__error();
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        cryptex_array_pack_from_path_cold_2((uint64_t)a1);
      }
      xpc_object_t v7 = 0;
    }
    else
    {
      xpc_object_t v7 = cryptex_bundle_create_with_directory((uint64_t)&v18, 0);
      LODWORD(v13) = 1;
      *((void *)&v13 + 1) = 0;
      uint64_t v14 = v10;
      int v15 = v11;
      uint64_t v17 = 0;
      uint64_t v16 = 0;
      int v9 = cryptex_bundle_copy_cryptex((uint64_t)v7, &v13, v5, &object);
      if (!v9)
      {
        uint64_t v8 = cryptex_pack_core_cryptex(*((void *)object + 6), v5);
        xpc_array_append_value(v6, v8);
        goto LABEL_15;
      }
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        cryptex_array_pack_from_path_cold_3();
      }
    }
    uint64_t v8 = 0;
  }
LABEL_15:
  *a3 = v9;
  if (v18 != -1 && close(v18) == -1) {
    cryptex_array_pack_from_path_cold_1(&v13, v20);
  }
  if (v7) {
    os_release(v7);
  }
  if (object) {
    os_release(object);
  }
  if (v8) {
    os_release(v8);
  }
  return v6;
}

int64_t session_start(uint64_t a1)
{
  id v1 = *(_xpc_connection_s **)(a1 + 80);
  if (v1) {
    return session_send_message(v1, 1, 0);
  }
  else {
    return 57;
  }
}

int64_t session_stop(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 40) + 48)) {
    return session_send_message(*(_xpc_connection_s **)(a1 + 80), 2, 0);
  }
  else {
    return 6;
  }
}

uint64_t session_get_stop_reason(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 40) + 48) == 5) {
    return *(void *)(a1 + 64);
  }
  else {
    return 0;
  }
}

uint64_t session_get_stop_code(void *a1)
{
  if (*(void *)(a1[5] + 48) == 5 && a1[8] == 2) {
    return a1[9];
  }
  else {
    return 0;
  }
}

int64_t session_add_cryptex(uint64_t a1, const char *a2, const char *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unsigned int v20 = -1;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v7 = cryptex_array_pack_from_path(a2, a3, (int *)&v20);
  int64_t v8 = v20;
  if (!v20)
  {
    xpc_dictionary_set_string(v6, "NAME", *(const char **)(*(void *)(a1 + 40) + 96));
    xpc_dictionary_set_value(v6, "CRYPTEXES", v7);
    size_t count = xpc_array_get_count(v7);
    uint64_t v11 = *(void *)(a1 + 40);
    if (count)
    {
      if (*(void *)(v11 + 48) == 1)
      {
        int64_t v8 = session_send_message(*(_xpc_connection_s **)(a1 + 80), 3, v6);
      }
      else
      {
        uint64_t v16 = *(const char **)(v11 + 16);
        int v17 = *__error();
        int v18 = *(NSObject **)(*(void *)(a1 + 40) + 32);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          if (!v16) {
            uint64_t v16 = "[anonymous]";
          }
          uint64_t v19 = cryptex_session_state_to_string();
          *(_DWORD *)buf = 136446722;
          long long v22 = v16;
          __int16 v23 = 2080;
          uint64_t v24 = v19;
          __int16 v25 = 1024;
          LODWORD(v26) = 36;
          _os_log_impl(&dword_21DAF1000, v18, OS_LOG_TYPE_ERROR, "%{public}s: Cryptexes cannot be added to session in the %s state.: %{darwin.errno}d", buf, 0x1Cu);
        }
        *__error() = v17;
        int64_t v8 = 36;
      }
    }
    else
    {
      int v12 = *(const char **)(v11 + 16);
      int v13 = *__error();
      uint64_t v14 = *(NSObject **)(*(void *)(a1 + 40) + 32);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v15 = "[anonymous]";
        *(_DWORD *)buf = 136446978;
        if (v12) {
          int v15 = v12;
        }
        long long v22 = v15;
        __int16 v23 = 2080;
        uint64_t v24 = (uint64_t)a3;
        __int16 v25 = 2080;
        long long v26 = a2;
        __int16 v27 = 1024;
        int v28 = 2;
        _os_log_impl(&dword_21DAF1000, v14, OS_LOG_TYPE_ERROR, "%{public}s: Variant %s not found in %s: %{darwin.errno}d", buf, 0x26u);
      }
      *__error() = v13;
      int64_t v8 = 2;
    }
  }
  if (v7) {
    os_release(v7);
  }
  if (v6) {
    os_release(v6);
  }
  return v8;
}

uint64_t session_add_job_override(uint64_t a1, const char *a2, const char *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 40);
  if (!*(void *)(v5 + 48))
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    uint64_t v14 = *(void **)(*(void *)(a1 + 40) + 80);
    xpc_dictionary_set_value(empty, a3, a4);
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(v14, a2);
    if (dictionary)
    {
      uint64_t v9 = _xpc_plist_merge((uint64_t)dictionary, empty);
      if (!empty) {
        return v9;
      }
    }
    else
    {
      xpc_object_t v17 = xpc_dictionary_create_empty();
      uint64_t v9 = _xpc_plist_merge((uint64_t)v17, empty);
      xpc_dictionary_set_value(v14, a2, v17);
      xpc_release(v17);
      if (!empty) {
        return v9;
      }
    }
    os_release(empty);
    return v9;
  }
  xpc_object_t v6 = *(const char **)(v5 + 16);
  int v7 = *__error();
  int64_t v8 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    if (!v6) {
      xpc_object_t v6 = "[anonymous]";
    }
    int v18 = 136446722;
    uint64_t v19 = v6;
    __int16 v20 = 2080;
    uint64_t v21 = cryptex_session_state_to_string();
    __int16 v22 = 1024;
    int v23 = 36;
    _os_log_impl(&dword_21DAF1000, v8, OS_LOG_TYPE_ERROR, "%{public}s: Job Overrides only allowed in LOCAL, currently in %s: %{darwin.errno}d", (uint8_t *)&v18, 0x1Cu);
  }
  *__error() = v7;
  return 36;
}

uint64_t session_add_session_environment(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(void *)(v3 + 48))
  {
    id v4 = *(const char **)(v3 + 16);
    int v5 = *__error();
    xpc_object_t v6 = *(NSObject **)(*(void *)(a1 + 40) + 32);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      if (!v4) {
        id v4 = "[anonymous]";
      }
      int v8 = 136446722;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      uint64_t v11 = cryptex_session_state_to_string();
      __int16 v12 = 1024;
      int v13 = 36;
      _os_log_impl(&dword_21DAF1000, v6, OS_LOG_TYPE_ERROR, "%{public}s: ENV Variables only allowed in LOCAL, currently in %s: %{darwin.errno}d", (uint8_t *)&v8, 0x1Cu);
    }
    *__error() = v5;
    return 36;
  }
  else
  {
    return session_add_job_override(a1, "CRYPTEX_SESSION", "EnvironmentVariables", a2);
  }
}

uint64_t session_set_job_environment_override(uint64_t a1, const char *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 40);
  if (*(void *)(v4 + 48))
  {
    int v5 = *(const char **)(v4 + 16);
    int v6 = *__error();
    int v7 = *(NSObject **)(*(void *)(a1 + 40) + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if (!v5) {
        int v5 = "[anonymous]";
      }
      int v9 = 136446722;
      __int16 v10 = v5;
      __int16 v11 = 2080;
      uint64_t v12 = cryptex_session_state_to_string();
      __int16 v13 = 1024;
      int v14 = 36;
      _os_log_impl(&dword_21DAF1000, v7, OS_LOG_TYPE_ERROR, "%{public}s: ENV Variables only allowed in LOCAL, currently in %s: %{darwin.errno}d", (uint8_t *)&v9, 0x1Cu);
    }
    *__error() = v6;
    return 36;
  }
  else
  {
    return session_add_job_override(a1, a2, "EnvironmentVariables", a3);
  }
}

uint64_t session_get_uuid(uint64_t a1, uuid_t uu)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = 36;
  if (v2)
  {
    if (*(void *)(v2 + 48) == 3) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = 36;
    }
  }
  uuid_clear(uu);
  return v3;
}

uint64_t session_get_homedir(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1) {
    return *(void *)(v1 + 112);
  }
  else {
    return 0;
  }
}

uint64_t session_get_uid(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 40) + 40);
}

uint64_t session_get_name(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1) {
    return *(void *)(v1 + 96);
  }
  else {
    return 0;
  }
}

uint64_t session_get_state(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 40) + 48);
}

uint64_t session_get_cryptex_array(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 40) + 72);
}

uint64_t session_has_overrides()
{
  return 0;
}

void _cryptex_attr_dealloc(uint64_t a1)
{
  free(*(void **)(a1 + 72));
  uint64_t v2 = *(void **)(a1 + 80);

  free(v2);
}

uint64_t _cryptex_attr_get_nonce_persistence(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

uint64_t _cryptex_attr_get_authentication(uint64_t a1)
{
  return *(void *)(a1 + 64);
}

uint64_t _cryptex_attr_get_mount_flags(uint64_t a1)
{
  return *(void *)(a1 + 104);
}

uint64_t cryptex_attr_create()
{
  uint64_t v0 = _cryptex_attr_alloc();
  object_proto_init(v0 + 16, (int)"com.apple.security.libcryptex", "attr");
  return v0;
}

int *cryptex_attr_set_persistence(void *a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = (const char *)a1[2];
  int v5 = *__error();
  int v6 = a1[4];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = "[anonymous]";
    if (v4) {
      int v7 = v4;
    }
    int v9 = 136446466;
    __int16 v10 = v7;
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    _os_log_impl(&dword_21DAF1000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: setting persistence: %#llx", (uint8_t *)&v9, 0x16u);
  }
  uint64_t result = __error();
  *uint64_t result = v5;
  a1[6] = a2;
  return result;
}

int *cryptex_attr_set_nonce_persistence(void *a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = (const char *)a1[2];
  int v5 = *__error();
  int v6 = a1[4];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = "[anonymous]";
    if (v4) {
      int v7 = v4;
    }
    int v9 = 136446466;
    __int16 v10 = v7;
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    _os_log_impl(&dword_21DAF1000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: setting nonce persistence: %#llx", (uint8_t *)&v9, 0x16u);
  }
  uint64_t result = __error();
  *uint64_t result = v5;
  a1[7] = a2;
  return result;
}

int *cryptex_attr_set_authentication(void *a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = (const char *)a1[2];
  int v5 = *__error();
  int v6 = a1[4];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = "[anonymous]";
    if (v4) {
      int v7 = v4;
    }
    int v9 = 136446466;
    __int16 v10 = v7;
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    _os_log_impl(&dword_21DAF1000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: setting authentication: %#llx", (uint8_t *)&v9, 0x16u);
  }
  uint64_t result = __error();
  *uint64_t result = v5;
  a1[8] = a2;
  return result;
}

char *cryptex_attr_set_tss_url(uint64_t a1, const char *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  free(*(void **)(a1 + 72));
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      uint64_t result = strdup(a2);
      if (result) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    uint64_t result = strdup(a2);
    if (!result) {
      cryptex_attr_set_tss_url_cold_1(a2, &v5, v6);
    }
  }
  *(void *)(a1 + 72) = result;
  return result;
}

int *cryptex_attr_set_personalization_flags(void *a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = (const char *)a1[2];
  int v5 = *__error();
  int v6 = a1[4];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = "[anonymous]";
    if (v4) {
      uint64_t v7 = v4;
    }
    int v9 = 136446466;
    __int16 v10 = v7;
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    _os_log_impl(&dword_21DAF1000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: setting personalization flags: %#llx", (uint8_t *)&v9, 0x16u);
  }
  uint64_t result = __error();
  *uint64_t result = v5;
  a1[12] = a2;
  return result;
}

char *cryptex_attr_set_socks_proxy(uint64_t a1, const char *a2, int a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  free(*(void **)(a1 + 80));
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      uint64_t result = strdup(a2);
      if (result) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    uint64_t result = strdup(a2);
    if (!result) {
      cryptex_attr_set_tss_url_cold_1(a2, &v7, v8);
    }
  }
  *(void *)(a1 + 80) = result;
  *(_DWORD *)(a1 + 88) = a3;
  return result;
}

int *cryptex_attr_set_mount_flags(void *a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = (const char *)a1[2];
  int v5 = *__error();
  int v6 = a1[4];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = "[anonymous]";
    if (v4) {
      uint64_t v7 = v4;
    }
    int v9 = 136446466;
    __int16 v10 = v7;
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    _os_log_impl(&dword_21DAF1000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: setting mount flags: %#llx", (uint8_t *)&v9, 0x16u);
  }
  uint64_t result = __error();
  *uint64_t result = v5;
  a1[13] = a2;
  return result;
}

uint64_t cryptex_attr_set_limit_load_to_rem(uint64_t result)
{
  *(void *)(result + 40) |= 1uLL;
  return result;
}

void _cryptex_su_preboot_bundle_dealloc(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 56);
  if (v2) {
    xpc_release(v2);
  }
  uint64_t v3 = *(void ***)(a1 + 48);
  uint64_t v7 = v3;
  if (v3)
  {
    do
    {
      uint64_t v4 = (void **)*v3;
      int v5 = *(void ***)(a1 + 48);
      if (v5 == v3)
      {
        *(void *)(a1 + 48) = v4;
      }
      else
      {
        do
        {
          int v6 = (void ***)v5;
          int v5 = (void **)*v5;
        }
        while (v5 != v3);
        NSObject *v6 = v4;
        uint64_t v3 = v7;
      }
      *uint64_t v3 = (void *)-1;
      _cryptex_list_elm_destroy(&v7);
      uint64_t v7 = v4;
      uint64_t v3 = v4;
    }
    while (v4);
  }
  object_proto_destroy(a1 + 24);
}

void cryptex_su_preboot_bundle_create_with_directory_and_manifest()
{
}

uint64_t cryptex_su_preboot_bundle_copy_cryptex()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v0 = *__error();
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    v2[0] = 67109120;
    v2[1] = 45;
    _os_log_impl(&dword_21DAF1000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Unsupported on this platform.: %{darwin.errno}d", (uint8_t *)v2, 8u);
  }
  *__error() = v0;
  return 45;
}

uint64_t cryptex_su_preboot_bundle_create()
{
  uint64_t v0 = _cryptex_su_preboot_bundle_alloc();
  object_proto_init(v0 + 24, (int)"com.apple.security.libcryptex", "su_preboot_bundle");
  return v0;
}

uint64_t _img4_get_nonce_domain_from_index(unint64_t a1)
{
  if (a1 > 0xA || a1 - 1 > 9) {
    return 0;
  }
  else {
    return qword_264470FB0[a1 - 1];
  }
}

uint64_t _img4_chip_instance_from_remote_device_properties(void *a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  string = xpc_dictionary_get_string(a1, "Image4CryptoHashMethod");
  if (!string)
  {
    int v9 = *__error();
    if (_img4_log_onceToken != -1) {
      dispatch_once(&_img4_log_onceToken, &__block_literal_global_3);
    }
    __int16 v10 = _img4_log_osl;
    if (os_log_type_enabled((os_log_t)_img4_log_osl, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_21DAF1000, v10, OS_LOG_TYPE_INFO, "no image4 hash method advertised, falling back to use sha2-384 by default", (uint8_t *)&v16, 2u);
    }
    *__error() = v9;
    goto LABEL_14;
  }
  int v5 = string;
  if (!strcmp(string, "sha1"))
  {
    uint64_t v11 = MEMORY[0x263F8C4B0];
LABEL_16:
    *(void *)(a2 + 8) = v11;
    if (_xpc_dictionary_key_with_type_exists(a1, "BoardId", MEMORY[0x263EF87A0]))
    {
      *(_DWORD *)(a2 + 28) = xpc_dictionary_get_uint64(a1, "BoardId");
      if (_xpc_dictionary_key_with_type_exists(a1, "ChipID", MEMORY[0x263EF87A0]))
      {
        *(_DWORD *)(a2 + 32) = xpc_dictionary_get_uint64(a1, "ChipID");
        if (_xpc_dictionary_key_with_type_exists(a1, "SecurityDomain", MEMORY[0x263EF87A0]))
        {
          *(_DWORD *)(a2 + 36) = xpc_dictionary_get_uint64(a1, "SecurityDomain");
          if (_xpc_dictionary_key_with_type_exists(a1, "UniqueChipID", MEMORY[0x263EF87A0]))
          {
            *(void *)(a2 + 40) = xpc_dictionary_get_uint64(a1, "UniqueChipID");
            if (_xpc_dictionary_key_with_type_exists(a1, "CertificateProductionStatus", MEMORY[0x263EF86E0]))
            {
              *(unsigned char *)(a2 + 48) = xpc_dictionary_get_BOOL(a1, "CertificateProductionStatus");
              if (_xpc_dictionary_key_with_type_exists(a1, "CertificateSecurityMode", MEMORY[0x263EF86E0]))
              {
                *(unsigned char *)(a2 + 49) = xpc_dictionary_get_BOOL(a1, "CertificateSecurityMode");
                if (_xpc_dictionary_key_with_type_exists(a1, "EffectiveProductionStatusAp", MEMORY[0x263EF86E0]))
                {
                  *(unsigned char *)(a2 + 50) = xpc_dictionary_get_BOOL(a1, "EffectiveProductionStatusAp");
                  if (_xpc_dictionary_key_with_type_exists(a1, "EffectiveSecurityModeAp", MEMORY[0x263EF86E0]))
                  {
                    BOOL v12 = xpc_dictionary_get_BOOL(a1, "EffectiveSecurityModeAp");
                    uint64_t result = 0;
                    *(unsigned char *)(a2 + 51) = v12;
                    *(_DWORD *)(a2 + 24) = 1;
                    return result;
                  }
                  int v13 = *__error();
                  if (_img4_log_onceToken != -1) {
                    dispatch_once(&_img4_log_onceToken, &__block_literal_global_3);
                  }
                  int v14 = _img4_log_osl;
                  if (!os_log_type_enabled((os_log_t)_img4_log_osl, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_58;
                  }
                  int v16 = 67109120;
                  LODWORD(v17) = 2;
                  uint64_t v15 = "effective security mode not found: %{darwin.errno}d";
                }
                else
                {
                  int v13 = *__error();
                  if (_img4_log_onceToken != -1) {
                    dispatch_once(&_img4_log_onceToken, &__block_literal_global_3);
                  }
                  int v14 = _img4_log_osl;
                  if (!os_log_type_enabled((os_log_t)_img4_log_osl, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_58;
                  }
                  int v16 = 67109120;
                  LODWORD(v17) = 2;
                  uint64_t v15 = "effective production status not found: %{darwin.errno}d";
                }
              }
              else
              {
                int v13 = *__error();
                if (_img4_log_onceToken != -1) {
                  dispatch_once(&_img4_log_onceToken, &__block_literal_global_3);
                }
                int v14 = _img4_log_osl;
                if (!os_log_type_enabled((os_log_t)_img4_log_osl, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_58;
                }
                int v16 = 67109120;
                LODWORD(v17) = 2;
                uint64_t v15 = "security mode not found: %{darwin.errno}d";
              }
            }
            else
            {
              int v13 = *__error();
              if (_img4_log_onceToken != -1) {
                dispatch_once(&_img4_log_onceToken, &__block_literal_global_3);
              }
              int v14 = _img4_log_osl;
              if (!os_log_type_enabled((os_log_t)_img4_log_osl, OS_LOG_TYPE_ERROR)) {
                goto LABEL_58;
              }
              int v16 = 67109120;
              LODWORD(v17) = 2;
              uint64_t v15 = "production status not found: %{darwin.errno}d";
            }
          }
          else
          {
            int v13 = *__error();
            if (_img4_log_onceToken != -1) {
              dispatch_once(&_img4_log_onceToken, &__block_literal_global_3);
            }
            int v14 = _img4_log_osl;
            if (!os_log_type_enabled((os_log_t)_img4_log_osl, OS_LOG_TYPE_ERROR)) {
              goto LABEL_58;
            }
            int v16 = 67109120;
            LODWORD(v17) = 2;
            uint64_t v15 = "ecid not found: %{darwin.errno}d";
          }
        }
        else
        {
          int v13 = *__error();
          if (_img4_log_onceToken != -1) {
            dispatch_once(&_img4_log_onceToken, &__block_literal_global_3);
          }
          int v14 = _img4_log_osl;
          if (!os_log_type_enabled((os_log_t)_img4_log_osl, OS_LOG_TYPE_ERROR)) {
            goto LABEL_58;
          }
          int v16 = 67109120;
          LODWORD(v17) = 2;
          uint64_t v15 = "security domain not found: %{darwin.errno}d";
        }
      }
      else
      {
        int v13 = *__error();
        if (_img4_log_onceToken != -1) {
          dispatch_once(&_img4_log_onceToken, &__block_literal_global_3);
        }
        int v14 = _img4_log_osl;
        if (!os_log_type_enabled((os_log_t)_img4_log_osl, OS_LOG_TYPE_ERROR)) {
          goto LABEL_58;
        }
        int v16 = 67109120;
        LODWORD(v17) = 2;
        uint64_t v15 = "chip id not found: %{darwin.errno}d";
      }
    }
    else
    {
      int v13 = *__error();
      if (_img4_log_onceToken != -1) {
        dispatch_once(&_img4_log_onceToken, &__block_literal_global_3);
      }
      int v14 = _img4_log_osl;
      if (!os_log_type_enabled((os_log_t)_img4_log_osl, OS_LOG_TYPE_ERROR)) {
        goto LABEL_58;
      }
      int v16 = 67109120;
      LODWORD(v17) = 2;
      uint64_t v15 = "board id not found: %{darwin.errno}d";
    }
    _os_log_impl(&dword_21DAF1000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v16, 8u);
LABEL_58:
    *__error() = v13;
    return 2;
  }
  if (!strcmp(v5, "sha2-384"))
  {
LABEL_14:
    uint64_t v11 = MEMORY[0x263F8C4B8];
    goto LABEL_16;
  }
  int v6 = *__error();
  if (_img4_log_onceToken != -1) {
    dispatch_once(&_img4_log_onceToken, &__block_literal_global_3);
  }
  uint64_t v7 = _img4_log_osl;
  if (os_log_type_enabled((os_log_t)_img4_log_osl, OS_LOG_TYPE_ERROR))
  {
    int v16 = 136315394;
    xpc_object_t v17 = v5;
    __int16 v18 = 1024;
    int v19 = 22;
    _os_log_impl(&dword_21DAF1000, v7, OS_LOG_TYPE_ERROR, "invalid crypto hash method: %s: %{darwin.errno}d", (uint8_t *)&v16, 0x12u);
  }
  *__error() = v6;
  return 22;
}

os_log_t ___img4_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.libcryptex", "img4");
  _img4_log_osl = (uint64_t)result;
  return result;
}

void rpc_destroy(unsigned char *a1)
{
  if (*a1)
  {
    if (*((void *)a1 + 4) == 2) {
      mach_right_send_release();
    }
    xpc_release(*((xpc_object_t *)a1 + 37));
    os_release(*((void **)a1 + 1));
    if ((*a1 & 0x40) != 0)
    {
      free(a1);
    }
  }
}

os_log_t object_proto_init(uint64_t a1, int a2, char *category)
{
  os_log_t result = os_log_create("com.apple.libcryptex", category);
  *(void *)(a1 + 16) = result;
  return result;
}

char *object_set_name(uint64_t a1, const char *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(const char **)a1;
  int v5 = *__error();
  int v6 = *(NSObject **)(a1 + 16);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v7)
    {
      int v8 = *(const char **)a1;
      *(_DWORD *)buf = 136446722;
      BOOL v12 = v4;
      __int16 v13 = 2080;
      int v14 = v8;
      __int16 v15 = 2080;
      int v16 = a2;
      _os_log_impl(&dword_21DAF1000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: changing name: %s -> %s", buf, 0x20u);
    }
    *__error() = v5;
    free(*(void **)(a1 + 8));
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 136446466;
      BOOL v12 = "[anonymous]";
      __int16 v13 = 2080;
      int v14 = a2;
      _os_log_impl(&dword_21DAF1000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: setting name: %s", buf, 0x16u);
    }
    *__error() = v5;
  }
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      os_log_t result = strdup(a2);
      if (result) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    os_log_t result = strdup(a2);
    if (!result) {
      _cryptex_copy_list_lossy_cold_1(a2, &v10, buf);
    }
  }
  *(void *)a1 = result;
  *(void *)(a1 + 8) = result;
  return result;
}

void object_set_name_nocopy(uint64_t a1, const char *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(const char **)a1;
  int v5 = *__error();
  int v6 = *(NSObject **)(a1 + 16);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v7)
    {
      int v8 = *(const char **)a1;
      int v9 = 136446722;
      uint64_t v10 = v4;
      __int16 v11 = 2080;
      BOOL v12 = v8;
      __int16 v13 = 2080;
      int v14 = a2;
      _os_log_impl(&dword_21DAF1000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: changing name: %s -> %s", (uint8_t *)&v9, 0x20u);
    }
    *__error() = v5;
    free(*(void **)(a1 + 8));
  }
  else
  {
    if (v7)
    {
      int v9 = 136446466;
      uint64_t v10 = "[anonymous]";
      __int16 v11 = 2080;
      BOOL v12 = a2;
      _os_log_impl(&dword_21DAF1000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: setting name: %s", (uint8_t *)&v9, 0x16u);
    }
    *__error() = v5;
  }
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = 0;
}

void object_proto_destroy(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  uint64_t v2 = *(void **)(a1 + 16);

  os_release(v2);
}

uint64_t _xferfd_unguarded(_DWORD *a1)
{
  uint64_t v1 = *a1;
  *a1 = -1;
  return v1;
}

uint64_t _mkodtempat(int a1, char *a2, int *a3)
{
  int v5 = mkdtempat_np(a1, a2);
  if (!v5) {
    return *__error();
  }
  int v6 = openat(a1, v5, 1048832);
  if (v6 < 0) {
    return *__error();
  }
  int v7 = v6;
  uint64_t result = 0;
  *a3 = v7;
  return result;
}

size_t _confstr(int a1, char *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  size_t result = confstr(a1, a2, 0x400uLL);
  if (!result) {
    _confstr_cold_1(&v3, v4);
  }
  if (result >= 0x401) {
    _confstr_cold_2();
  }
  return result;
}

unint64_t _strtou32(const char *a1, char **a2, int a3)
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

uint64_t _read_file(int a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  memset(&v20, 0, sizeof(v20));
  if (fstat(a1, &v20))
  {
    uint64_t v4 = *__error();
    int v5 = *__error();
    int v6 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v4;
      _os_log_impl(&dword_21DAF1000, v6, OS_LOG_TYPE_ERROR, "stat: %{darwin.errno}d", buf, 8u);
    }
    off_t st_size = 0;
LABEL_5:
    int v8 = 0;
    *__error() = v5;
LABEL_6:
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_8;
  }
  off_t st_size = v20.st_size;
  if (v20.st_size < 0) {
    _cryptex_signing_service_read_fd_cold_2();
  }
  uint64_t v10 = malloc_type_malloc(v20.st_size, 0xD8A116BDuLL);
  if (!v10)
  {
    uint64_t v4 = *__error();
    int v5 = *__error();
    uint64_t v15 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v4;
      _os_log_impl(&dword_21DAF1000, v15, OS_LOG_TYPE_ERROR, "malloc: %{darwin.errno}d", buf, 8u);
    }
    goto LABEL_5;
  }
  int v8 = v10;
  while (1)
  {
    ssize_t v11 = pread(a1, v8, st_size, 0);
    if ((v11 & 0x8000000000000000) == 0) {
      break;
    }
    int v12 = *__error();
    __int16 v13 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v14;
      _os_log_impl(&dword_21DAF1000, v13, OS_LOG_TYPE_ERROR, "pread: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v12;
    uint64_t v4 = *__error();
    if (v4 != 4) {
      goto LABEL_6;
    }
  }
  ssize_t v16 = v11;
  int v17 = *__error();
  __int16 v18 = os_log_create("com.apple.libcryptex", "utility");
  int v19 = v18;
  if (v16 == st_size)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      off_t v22 = st_size;
      _os_log_impl(&dword_21DAF1000, v19, OS_LOG_TYPE_DEBUG, "read %ld bytes", buf, 0xCu);
    }
    *__error() = v17;
LABEL_7:
    buff_init(a2, 0, (uint64_t)_buff_destructor_free, (uint64_t)v8, st_size);
    uint64_t v4 = 0;
    int v8 = 0;
    goto LABEL_8;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    off_t v22 = v16;
    __int16 v23 = 2048;
    off_t v24 = st_size;
    _os_log_impl(&dword_21DAF1000, v19, OS_LOG_TYPE_ERROR, "truncated read: actual = %ld, expected = %lu", buf, 0x16u);
  }
  *__error() = v17;
  uint64_t v4 = 5;
LABEL_8:
  free(v8);
  return v4;
}

uint64_t _write_file(int __fd, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  while (1)
  {
    ssize_t v4 = pwrite(__fd, *(const void **)a2, *(void *)(a2 + 8), 0);
    if ((v4 & 0x8000000000000000) == 0) {
      break;
    }
    int v5 = *__error();
    int v6 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = v7;
      _os_log_impl(&dword_21DAF1000, v6, OS_LOG_TYPE_ERROR, "write: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v5;
    uint64_t v8 = *__error();
    if (v8 != 4) {
      return v8;
    }
  }
  ssize_t v9 = v4;
  uint64_t v10 = *(void *)(a2 + 8);
  int v11 = *__error();
  int v12 = os_log_create("com.apple.libcryptex", "utility");
  __int16 v13 = v12;
  if (v9 == v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      ssize_t v17 = v9;
      _os_log_impl(&dword_21DAF1000, v13, OS_LOG_TYPE_DEBUG, "wrote %ld bytes", buf, 0xCu);
    }
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a2 + 8);
      *(_DWORD *)buf = 134218496;
      ssize_t v17 = v9;
      __int16 v18 = 2048;
      uint64_t v19 = v14;
      __int16 v20 = 1024;
      int v21 = 5;
      _os_log_impl(&dword_21DAF1000, v13, OS_LOG_TYPE_ERROR, "truncated write: actual = %ld, expected = %ld: %{darwin.errno}d", buf, 0x1Cu);
    }
  }
  *__error() = v11;
  return v8;
}

void _confstr_cold_1(void *a1, _OWORD *a2)
{
}

void _confstr_cold_2()
{
}

void *buff_init(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  *unint64_t result = a4;
  result[1] = a5;
  result[2] = a4;
  result[3] = a5;
  result[4] = a2;
  result[5] = a3;
  if (a5 < 0) {
    buff_init_cold_1(&v5, v6);
  }
  return result;
}

void *buff_init_signed(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a5 < 0) {
    buff_init_signed_cold_1(&v6, v7);
  }

  return buff_init(a1, a2, a3, a4, a5);
}

void *buff_destroy(void *result)
{
  if (result)
  {
    if (*result)
    {
      uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))result[5];
      if (v1)
      {
        if (result[6]) {
          buff_destroy_cold_1();
        }
        uint64_t v2 = result[3];
        uint64_t v3 = result[4];
        uint64_t v4 = result[2];
        return (void *)v1(v4, v2, v3);
      }
    }
  }
  return result;
}

void buff_init_cold_1(void *a1, _OWORD *a2)
{
}

void buff_init_signed_cold_1(void *a1, _OWORD *a2)
{
}

void buff_destroy_cold_1()
{
}

void *ctx_new(void *a1, size_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a2 <= 0x17) {
    ctx_new_cold_1(&v7, v8);
  }
  if (_dispatch_is_multithreaded())
  {
    uint64_t v4 = malloc_type_calloc(1uLL, a2, 0x1B044E25uLL);
    if (!v4)
    {
      do
      {
        __os_temporary_resource_shortage();
        uint64_t v5 = malloc_type_calloc(1uLL, a2, 0x1B044E25uLL);
      }
      while (!v5);
      uint64_t v4 = v5;
    }
  }
  else
  {
    uint64_t v4 = malloc_type_calloc(1uLL, a2, 0x61D5536CuLL);
    if (!v4) {
      ctx_new_cold_2(&v7, v8);
    }
  }
  if (a1) {
    void *v4 = os_retain(a1);
  }
  return v4;
}

void ctx_destroy(void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2) {
      os_release(v2);
    }
    free(a1);
  }
}

void ctx_new_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void ctx_new_cold_2(void *a1, _OWORD *a2)
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

xpc_object_t _xpc_plist_value_copy(uint64_t a1, void *a2)
{
  uint64_t v2 = MEMORY[0x263EF86D8];
  if (*(void *)a1 != MEMORY[0x263EF86D8] && *(void *)a1 != MEMORY[0x263EF8708]) {
    _xpc_plist_value_copy_cold_1();
  }
  uint64_t v6 = MEMORY[0x223C12420](a2);
  if (v6 != *(void *)a1) {
    return 0;
  }
  if (v6 == v2)
  {
    size_t v9 = *(void *)(a1 + 24);
    if (v9 >= xpc_array_get_count(a2)) {
      return 0;
    }
    xpc_object_t value = xpc_array_get_value(a2, *(void *)(a1 + 24));
  }
  else
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, *(const char **)(a1 + 16));
  }
  uint64_t v10 = value;
  if (!value || MEMORY[0x223C12420](value) != *(void *)(a1 + 8)) {
    return 0;
  }

  return xpc_retain(v10);
}

xpc_object_t _xpc_plist_value_copy_at(void *a1, void *a2, size_t a3)
{
  uint64_t v3 = MEMORY[0x263EF86D8];
  if (*a1 != MEMORY[0x263EF86D8]) {
    _xpc_plist_value_copy_at_cold_1();
  }
  if (MEMORY[0x223C12420](a2) != v3) {
    _xpc_plist_value_copy_at_cold_1();
  }
  if (xpc_array_get_count(a2) <= a3) {
    return 0;
  }
  xpc_object_t value = xpc_array_get_value(a2, a3);
  if (!value) {
    return 0;
  }
  uint64_t v8 = value;
  if (MEMORY[0x223C12420]() != a1[1]) {
    return 0;
  }

  return xpc_retain(v8);
}

uint64_t _xpc_plist_merge(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000;
  int v8 = 0;
  if (xdict)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 0x40000000;
    v4[2] = ___xpc_plist_merge_block_invoke;
    v4[3] = &unk_264471028;
    v4[4] = &v5;
    _OWORD v4[5] = a1;
    xpc_dictionary_apply(xdict, v4);
    uint64_t v2 = *((unsigned int *)v6 + 6);
  }
  else
  {
    uint64_t v2 = 0;
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t ___xpc_plist_merge_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  xpc_object_t value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), a2);
  if (!value)
  {
LABEL_9:
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 40), a2, a3);
    return 1;
  }
  xpc_object_t v7 = value;
  uint64_t v8 = MEMORY[0x223C12420]();
  if (v8 == MEMORY[0x223C12420](a3))
  {
    if (v8 == MEMORY[0x263EF8708])
    {
      applier[0] = MEMORY[0x263EF8330];
      applier[1] = 0x40000000;
      applier[2] = ___xpc_plist_merge_block_invoke_2;
      applier[3] = &__block_descriptor_tmp_4;
      void applier[4] = v7;
      xpc_dictionary_apply(a3, applier);
      return 1;
    }
    goto LABEL_9;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 79;
  int v9 = *__error();
  if (_xpc_log_onceToken != -1) {
    dispatch_once(&_xpc_log_onceToken, &__block_literal_global_4);
  }
  uint64_t v10 = _xpc_log_osl;
  if (os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR))
  {
    int v11 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = a2;
    __int16 v16 = 1024;
    int v17 = v11;
    _os_log_impl(&dword_21DAF1000, v10, OS_LOG_TYPE_ERROR, "Error merging override for key %s: %{darwin.errno}d", buf, 0x12u);
  }
  * __error() = v9;
  return 1;
}

uint64_t ___xpc_plist_merge_block_invoke_2(uint64_t a1, const char *a2, void *a3)
{
  return 1;
}

uint64_t _xpc_dictionary_try_get_uint64(void *a1, const char *a2, uint64_t *a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value) {
    return 2;
  }
  uint64_t v5 = value;
  if (MEMORY[0x223C12420]() != MEMORY[0x263EF87A0]) {
    return 79;
  }
  uint64_t v7 = xpc_uint64_get_value(v5);
  uint64_t result = 0;
  *a3 = v7;
  return result;
}

uint64_t _xpc_dictionary_try_get_string(void *a1, const char *a2, const char **a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value) {
    return 2;
  }
  uint64_t v5 = value;
  if (MEMORY[0x223C12420]() != MEMORY[0x263EF8798]) {
    return 79;
  }
  string_ptr = xpc_string_get_string_ptr(v5);
  uint64_t result = 0;
  *a3 = string_ptr;
  return result;
}

uint64_t _xpc_dictionary_try_get_BOOL(void *a1, const char *a2, BOOL *a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value) {
    return 2;
  }
  uint64_t v5 = value;
  if (MEMORY[0x223C12420]() != MEMORY[0x263EF86E0]) {
    return 79;
  }
  BOOL v7 = xpc_BOOL_get_value(v5);
  uint64_t result = 0;
  *a3 = v7;
  return result;
}

uint64_t _xpc_dictionary_key_with_type_exists(void *a1, const char *a2, const _xpc_type_s *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!xpc_dictionary_get_value(a1, a2))
  {
    int v5 = *__error();
    if (_xpc_log_onceToken != -1) {
      dispatch_once(&_xpc_log_onceToken, &__block_literal_global_4);
    }
    uint64_t v10 = _xpc_log_osl;
    if (!os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v13 = 136315138;
    uint64_t v14 = a2;
    BOOL v7 = "key %s doesn't exist";
    uint64_t v8 = v10;
    uint32_t v9 = 12;
    goto LABEL_11;
  }
  if ((const _xpc_type_s *)MEMORY[0x223C12420]() != a3)
  {
    int v5 = *__error();
    if (_xpc_log_onceToken != -1) {
      dispatch_once(&_xpc_log_onceToken, &__block_literal_global_4);
    }
    uint64_t v6 = _xpc_log_osl;
    if (!os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v13 = 136315394;
    uint64_t v14 = a2;
    __int16 v15 = 2080;
    uint64_t name = xpc_type_get_name(a3);
    BOOL v7 = "key %s isn't of type %s";
    uint64_t v8 = v6;
    uint32_t v9 = 22;
LABEL_11:
    _os_log_impl(&dword_21DAF1000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v13, v9);
LABEL_12:
    int v11 = __error();
    uint64_t result = 0;
    int *v11 = v5;
    return result;
  }
  return 1;
}

uint64_t _xpc_dictionary_try_get_cferr(void *a1, const char *a2, CFErrorRef *a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value) {
    return 2;
  }
  int v5 = value;
  if (MEMORY[0x223C12420]() != MEMORY[0x263EF8708]) {
    return 79;
  }

  return _xpc_dictionary_to_cferr(v5, a3);
}

uint64_t _xpc_dictionary_to_cferr(void *a1, CFErrorRef *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  xpc_object_t value = 0;
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a1, "cferr_userinfo");
  if (dictionary)
  {
    int v5 = dictionary;
    string = (char *)xpc_dictionary_get_string(a1, "cferr_domain");
    CFStringRef v7 = _CFStringCreateFromUTF8String(string);
    if (v7)
    {
      CFStringRef v8 = v7;
      int64_t int64 = xpc_dictionary_get_int64(a1, "cferr_code");
      xpc_object_t v10 = xpc_dictionary_get_dictionary(v5, "underlying_cferr");
      if (v10 && _xpc_dictionary_to_cferr(v10, &value))
      {
        int v11 = *__error();
        if (_xpc_log_onceToken != -1) {
          dispatch_once(&_xpc_log_onceToken, &__block_literal_global_4);
        }
        int v12 = _xpc_log_osl;
        if (!os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR)) {
          goto LABEL_31;
        }
        *(_DWORD *)buf = 67109120;
        int v31 = 22;
        int v13 = "Failed to unpack underlying error.: %{darwin.errno}d";
      }
      else
      {
        xpc_dictionary_set_value(v5, "underlying_cferr", 0);
        CFDictionaryRef v17 = (const __CFDictionary *)_CFXPCCreateCFObjectFromXPCObject();
        if (v17)
        {
          CFDictionaryRef v18 = v17;
          MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v17);
          if (MutableCopy)
          {
            CFDictionaryRef v20 = MutableCopy;
            if (value) {
              CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x263EFFC88], value);
            }
            CFErrorRef v21 = CFErrorCreate(0, v8, int64, v20);
            if (v21)
            {
              if (a2)
              {
                uint64_t v16 = 0;
                *a2 = v21;
              }
              else
              {
                CFRelease(v21);
                uint64_t v16 = 0;
              }
            }
            else
            {
              int v26 = *__error();
              if (_xpc_log_onceToken != -1) {
                dispatch_once(&_xpc_log_onceToken, &__block_literal_global_4);
              }
              __int16 v27 = _xpc_log_osl;
              if (os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                int v31 = 12;
                _os_log_impl(&dword_21DAF1000, v27, OS_LOG_TYPE_ERROR, "Failed to create CFError.: %{darwin.errno}d", buf, 8u);
              }
              * __error() = v26;
              uint64_t v16 = 12;
            }
            CFRelease(v20);
          }
          else
          {
            int v24 = *__error();
            if (_xpc_log_onceToken != -1) {
              dispatch_once(&_xpc_log_onceToken, &__block_literal_global_4);
            }
            uint64_t v25 = _xpc_log_osl;
            if (os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              int v31 = 12;
              _os_log_impl(&dword_21DAF1000, v25, OS_LOG_TYPE_ERROR, "Failed to create mutable dictionary.: %{darwin.errno}d", buf, 8u);
            }
            * __error() = v24;
            uint64_t v16 = 12;
          }
          CFRelease(v18);
          goto LABEL_45;
        }
        int v11 = *__error();
        if (_xpc_log_onceToken != -1) {
          dispatch_once(&_xpc_log_onceToken, &__block_literal_global_4);
        }
        int v12 = _xpc_log_osl;
        if (!os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR))
        {
LABEL_31:
          * __error() = v11;
          uint64_t v16 = 22;
LABEL_45:
          CFRelease(v8);
          goto LABEL_46;
        }
        *(_DWORD *)buf = 67109120;
        int v31 = 22;
        int v13 = "Failed to convert CF to XPC.: %{darwin.errno}d";
      }
      _os_log_impl(&dword_21DAF1000, v12, OS_LOG_TYPE_ERROR, v13, buf, 8u);
      goto LABEL_31;
    }
    int v22 = *__error();
    if (_xpc_log_onceToken != -1) {
      dispatch_once(&_xpc_log_onceToken, &__block_literal_global_4);
    }
    __int16 v23 = _xpc_log_osl;
    if (os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v31 = 12;
      _os_log_impl(&dword_21DAF1000, v23, OS_LOG_TYPE_ERROR, "Failed to create string.: %{darwin.errno}d", buf, 8u);
    }
    * __error() = v22;
    uint64_t v16 = 12;
  }
  else
  {
    int v14 = *__error();
    if (_xpc_log_onceToken != -1) {
      dispatch_once(&_xpc_log_onceToken, &__block_literal_global_4);
    }
    __int16 v15 = _xpc_log_osl;
    if (os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v31 = 22;
      _os_log_impl(&dword_21DAF1000, v15, OS_LOG_TYPE_ERROR, "CFError XPC dictionary is missing user info.: %{darwin.errno}d", buf, 8u);
    }
    * __error() = v14;
    uint64_t v16 = 22;
  }
LABEL_46:
  if (value) {
    CFRelease(value);
  }
  return v16;
}

uint64_t _xpc_reply_get_error(void *a1, _DWORD *a2)
{
  if (!_xpc_dictionary_key_with_type_exists(a1, "error", MEMORY[0x263EF87A0])) {
    return 22;
  }
  uint64_t int64 = xpc_dictionary_get_uint64(a1, "error");
  uint64_t result = 0;
  *a2 = uint64;
  return result;
}

uint64_t _xpc_reply_get_cferr(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  CFErrorRef v11 = 0;
  int v10 = -1;
  uint64_t cferr = _xpc_dictionary_try_get_cferr(a1, "cferr", &v11);
  if (cferr == 2 && (uint64_t cferr = 0, !_xpc_reply_get_error(a1, &v10)) && v10)
  {
    CFIndex v5 = v10;
    int v12 = 67109120;
    int v13 = v10;
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("_xpc_reply_get_cferr", "xpc.c", 474, "com.apple.security.cryptex.posix", v5, 0, v6);
    free(v6);
    uint64_t cferr = 0;
    CFErrorRef v11 = Error;
    if (!a2) {
      goto LABEL_12;
    }
  }
  else
  {
    CFErrorRef Error = v11;
    if (!a2) {
      goto LABEL_12;
    }
  }
  if (!cferr)
  {
    if (Error)
    {
      CFTypeRef v8 = CFRetain(Error);
      CFErrorRef Error = v11;
    }
    else
    {
      CFTypeRef v8 = 0;
    }
    *a2 = v8;
  }
LABEL_12:
  if (Error) {
    CFRelease(Error);
  }
  return cferr;
}

uint64_t _xpc_reply_get_argv(void *a1, void *a2)
{
  if (!_xpc_dictionary_key_with_type_exists(a1, "argv", MEMORY[0x263EF8708])) {
    return 22;
  }
  xpc_object_t value = xpc_dictionary_get_value(a1, "argv");
  uint64_t result = 0;
  *a2 = value;
  return result;
}

os_log_t ___xpc_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.libcryptex", "xpc");
  _xpc_log_osl = (uint64_t)result;
  return result;
}

void _xpc_plist_value_copy_cold_1()
{
}

void _xpc_plist_value_copy_at_cold_1()
{
}

_DWORD *DEREncoderCreate(int a1)
{
  os_log_t result = calloc(1uLL, 0x10uLL);
  if (result) {
    result[3] = a1;
  }
  return result;
}

void DEREncoderDestroy(void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2)
    {
      do
      {
        uint64_t v3 = (void *)*v2;
        _EncodedDataRelease((uint64_t)v2);
        uint64_t v2 = v3;
      }
      while (v3);
    }
    free(a1);
  }
}

uint64_t DEREncoderAddData(uint64_t *a1, unsigned int a2, unsigned int a3, const void *a4, unsigned int a5, int a6)
{
  CFStringRef v7 = _EncodedDataCreate(a2, a3, a4, a5, a6, 3);

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
    if (v7 || (int v9 = *(_DWORD *)(v5 + 24), v4 = v8 + v9, __CFADD__(v8, v9)))
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
  int v10 = (uint64_t *)*a1;
  CFErrorRef v11 = a1;
  if (!*a1) {
    goto LABEL_26;
  }
  int v12 = *((_DWORD *)a1 + 3);
  CFErrorRef v11 = a1;
  while (2)
  {
    int v13 = v11;
    CFErrorRef v11 = v10;
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
      int v10 = (uint64_t *)*v11;
      if (!*v11) {
        goto LABEL_26;
      }
      continue;
    }
    break;
  }
  CFDictionaryRef v20 = (void *)v2;
  do
  {
    CFErrorRef v21 = v20;
    CFDictionaryRef v20 = (void *)*v20;
  }
  while (v20);
  *CFErrorRef v21 = v11;
  CFErrorRef v11 = v13;
LABEL_26:
  uint64_t v22 = 0;
  uint64_t *v11 = v2;
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
  int v13 = v12;
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

uint64_t DEREncoderCreateEncodedBuffer(uint64_t **a1, void *a2, unsigned int *a3)
{
  if (!a1) {
    return 1;
  }
  unsigned int v6 = *((_DWORD *)a1 + 2);
  BOOL v7 = (char *)malloc(v6);
  if (!v7) {
    return 2;
  }
  int v8 = v7;
  int v9 = (uint64_t **)*a1;
  if (*a1)
  {
    int v10 = v7;
    do
    {
      memcpy(v10, (char *)v9 + 28, *((unsigned int *)v9 + 5));
      CFErrorRef v11 = &v10[*((unsigned int *)v9 + 5)];
      memcpy(v11, v9[1], *((unsigned int *)v9 + 6));
      int v10 = &v11[*((unsigned int *)v9 + 6)];
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

uint64_t _DEREncoderAddDataFromEncoderByEncoding(uint64_t **a1, uint64_t *a2, unsigned int a3, unsigned int a4, int a5)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unsigned int v13 = 0;
  int v12 = 0;
  uint64_t v9 = DEREncoderCreateEncodedBuffer(a1, &v12, &v13);
  if (!v9)
  {
    uint64_t v9 = 2;
    int v10 = _EncodedDataCreate(a3, a4, v12, v13, a5, 2);
    if (v10)
    {
      int v12 = 0;
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
      int v8 = _EncodedDataCreate(a3, a4, 0, *(_DWORD *)(a1 + 8), 1, 0);
      if (v8)
      {
        uint64_t v9 = v8;
        int v10 = *(uint64_t **)a1;
        int v21 = 0;
        CFErrorRef v11 = &v21;
        while (v10)
        {
          int v12 = malloc(0x38uLL);
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
          _OWORD *v12 = *(_OWORD *)v10;
          v12[1] = v15;
          *((void *)v12 + 6) = v13;
          _DWORD v12[2] = v14;
          *(void *)int v12 = 0;
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
          void *v11 = v12;
          int v10 = (uint64_t *)*v10;
          CFErrorRef v11 = v12;
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

void _EncodedDataRelease(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) - 1;
  *(_DWORD *)(a1 + 16) = v1;
  if (!v1)
  {
    uint64_t v3 = *(void **)(a1 + 8);
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

uint64_t Img4EncodeCreatePayload(const char *a1, const char *a2, const void *a3, unsigned int a4, const void *a5, unsigned int a6, void *a7, unsigned int *a8)
{
  int v8 = 0;
  uint64_t v9 = 101;
  if (!a1 || !a2)
  {
    int v12 = 0;
    goto LABEL_16;
  }
  int v12 = 0;
  if (a3)
  {
    if (strlen(a1) != 4)
    {
      int v8 = 0;
      int v12 = 0;
      goto LABEL_16;
    }
    int v8 = (uint64_t *)DEREncoderCreate(0);
    if (v8)
    {
      int v12 = (uint64_t **)DEREncoderCreate(0);
      if (v12)
      {
        uint64_t v18 = DEREncoderAddData(v8, 0, 0x16u, "IM4P", 4u, 0);
        if (v18
          || (uint64_t v18 = DEREncoderAddData(v8, 0, 0x16u, a1, 4u, 0), v18)
          || (v19 = strlen(a2), uint64_t v18 = DEREncoderAddData(v8, 0, 0x16u, a2, v19, 0), v18)
          || (uint64_t v18 = DEREncoderAddDataNoCopy(v8, 0, 4u, a3, a4, 0), v18)
          || a5 && (uint64_t v18 = DEREncoderAddDataNoCopy(v8, 0, 4u, a5, a6, 0), v18)
          || (uint64_t v18 = DEREncoderAddDataFromEncoderNoCopy((uint64_t)v8, (uint64_t)v12, 0, 0x10u, 1), v18))
        {
          uint64_t v9 = v18;
        }
        else
        {
          unsigned int EncodedBuffer = DEREncoderCreateEncodedBuffer(v12, a7, a8);
          if (EncodedBuffer) {
            uint64_t v9 = EncodedBuffer;
          }
          else {
            uint64_t v9 = 100;
          }
        }
        goto LABEL_16;
      }
    }
    else
    {
      int v12 = 0;
    }
    uint64_t v9 = 2;
  }
LABEL_16:
  DEREncoderDestroy((void **)v8);
  DEREncoderDestroy(v12);
  return v9;
}

void _cryptex_copy_list_lossy_cold_1(const char *a1, void *a2, _OWORD *a3)
{
  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  BOOL v5 = __error();
  strerror(*v5);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void _cryptex_copy_list_lossy_cold_2(void *a1, _OWORD *a2)
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
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  _os_crash_msg();
  __break(1u);
}

void _cryptex_signing_service_dealloc_cold_1(void *a1, _OWORD *a2)
{
}

void cryptex_signing_service_set_tss_url_cold_1(const char *a1, void *a2, _OWORD *a3)
{
  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  OUTLINED_FUNCTION_4();
  BOOL v5 = __error();
  strerror(*v5);
  OUTLINED_FUNCTION_0_0();
  _os_crash_msg();
  __break(1u);
}

void cryptex_signing_service_set_image_cold_1(void *a1, _OWORD *a2)
{
}

void cryptex_signing_service_set_sso_ticket_cold_1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_4();
  uint64_t v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void _cryptex_signing_service_read_fd_cold_1(void *a1, _OWORD *a2)
{
}

void _cryptex_signing_service_read_fd_cold_2()
{
}

void _hdi_copy_device_nodes_cold_1()
{
}

void _hdi_copy_device_nodes_cold_2()
{
}

void _hdi_copy_device_nodes_cold_3(void *a1, _OWORD *a2)
{
}

void _hdi_copy_device_nodes_cold_5(void *a1, _OWORD *a2)
{
}

void hdi_copy_mounted_cold_2()
{
}

void hdi_copy_mounted_cold_4()
{
}

void hdi_copy_mounted_cold_7(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_5();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1();
  _os_crash_msg();
  __break(1u);
}

void hdi_copy_mounted_cold_8(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_5();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1();
  _os_crash_msg();
  __break(1u);
}

void cryptex_event_type_int_to_ext_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void _cryptex_msm_new_from_info_cold_1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void _cryptex_msm_new_from_info_cold_2(const char *a1)
{
  OUTLINED_FUNCTION_8_0(a1);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4();
  int v1 = __error();
  strerror(*v1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void cryptex_copy_list_4MSM_cold_1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void daemon_for_session_subsystem_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_21DAF1000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "could not connect to daemon", v0, 2u);
}

void _CFStringCopyUTF8String_cold_1()
{
}

void _CFStringGetUTF8String_cold_1()
{
}

void _CFDictionaryCreateMutableForCFTypes_cold_1(void *a1, _OWORD *a2)
{
}

void _cryptex_alloc_cold_1()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_3(v0, v1);
  OUTLINED_FUNCTION_4();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void _cryptex_attr_alloc_cold_1()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_3(v0, v1);
  OUTLINED_FUNCTION_4();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void _cryptex_bundle_alloc_cold_1()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_3(v0, v1);
  OUTLINED_FUNCTION_4();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void _cryptex_su_preboot_bundle_alloc_cold_1()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_3(v0, v1);
  OUTLINED_FUNCTION_4();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void _cryptex_signing_service_alloc_cold_1()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_3(v0, v1);
  OUTLINED_FUNCTION_4();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void _session_alloc_cold_1()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_3(v0, v1);
  OUTLINED_FUNCTION_4();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void _cryptex_bundle_new_asset_from_object_cold_1(void *a1, _OWORD *a2)
{
}

void _cryptex_bundle_asset_new_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_5();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void _cryptex_bundle_asset_new_cold_2(const char *a1, void *a2, _OWORD *a3)
{
  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  BOOL v5 = __error();
  strerror(*v5);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void _cryptex_list_elm_new_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_5();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void _cryptex_bundle_init_cold_2(void *a1, _OWORD *a2)
{
}

void _cryptex_bundle_add_cryptex_assets_cold_1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_2(a1, a2);
  OUTLINED_FUNCTION_5();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void cryptex_bundle_write2_cold_1(void *a1, _OWORD *a2)
{
}

void _cryptex_bundle_open_cold_2(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  OUTLINED_FUNCTION_0_0();
  _os_crash_msg();
  __break(1u);
}

void collation_get_description_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_21DAF1000, log, OS_LOG_TYPE_ERROR, "NSJSONSerialization error", v1, 2u);
}

void _cryptex_create_cold_1()
{
}

void _cryptex_identity_copy_description_cold_1(const char *a1, void *a2, _OWORD *a3)
{
  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  BOOL v5 = __error();
  strerror(*v5);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0();
  _os_crash_msg();
  __break(1u);
}

void cryptex_system_cx_copy_name_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_5();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1();
  _os_crash_msg();
  __break(1u);
}

void cryptex_system_cx_copy_name_cold_2(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_5();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1();
  _os_crash_msg();
  __break(1u);
}

void cryptex_get_image_type_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  OUTLINED_FUNCTION_0_0();
  _os_crash_msg();
  __break(1u);
}

void cryptex_remote_service_nonce_get_nonce_cold_1()
{
}

void cryptex_remote_service_nonce_attr_set_image_type_cold_1()
{
}

void cryptex_remote_service_nonce_attr_set_cryptex_cold_2()
{
}

void cryptex_remote_service_nonce_attr_set_cryptex_cold_3()
{
}

void cryptex_remote_service_copy_device_identifier2_cold_1()
{
}

void cryptex_remote_service_copy_device_identifier2_cold_2()
{
}

void cryptex_remote_cryptex_get_identifier_cold_1()
{
}

void cryptex_remote_array_apply_cold_1()
{
}

void cryptex_remote_array_apply_cold_2()
{
}

void cryptex_remote_service_create_cold_1()
{
}

void cryptex_remote_service_create_cold_2()
{
}

void cryptex_remote_service_roll_nonce2_cold_2()
{
}

void cryptex_remote_service_uninstall2_cold_2()
{
}

void cryptex_remote_service_copy_installed2_cold_2()
{
}

void cryptex_array_pack_from_path_cold_1(void *a1, _OWORD *a2)
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
  _os_crash_msg();
  __break(1u);
}

void cryptex_array_pack_from_path_cold_2(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_21DAF1000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to open %s", (uint8_t *)&v1, 0xCu);
}

void cryptex_array_pack_from_path_cold_3()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_21DAF1000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "failed to copy cryptex from bundle", v0, 2u);
}

void cryptex_attr_set_tss_url_cold_1(const char *a1, void *a2, _OWORD *a3)
{
  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  BOOL v5 = __error();
  strerror(*v5);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_1();
  _os_crash_msg();
  __break(1u);
  CFBooleanGetTypeID();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFStringRef CFErrorCopyFailureReason(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A8](err);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x270EE49B8](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x270EE49D8](err);
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x270EE49E0]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
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

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x270EF47E0](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x270EF4828](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x270EF49F8](*(void *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x270EF4A18](*(void *)&entry, plane, parent);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x270EF4A88](notifyPort, notificationType, matching, callback, refCon, notification);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
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

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __os_temporary_resource_shortage()
{
  return MEMORY[0x270ED7E58]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

uint64_t _cryptex_actor_init_invoke_cstr()
{
  return MEMORY[0x270F99198]();
}

uint64_t _cryptex_actor_init_invoke_u64()
{
  return MEMORY[0x270F991A0]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x270ED7F50]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x270ED8068]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

uint64_t _os_object_alloc()
{
  return MEMORY[0x270ED80E0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x270ED87B0](__count, __size);
}

uint64_t ccdigest_init()
{
  return MEMORY[0x270ED8A48]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x270ED8A50]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x270ED8D78]();
}

uint64_t claimfd_np()
{
  return MEMORY[0x270ED8ED8]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

uint64_t close_drop_np()
{
  return MEMORY[0x270ED8F20]();
}

uint64_t close_drop_optional_np()
{
  return MEMORY[0x270ED8F28]();
}

uint64_t codex_install_pack()
{
  return MEMORY[0x270F991A8]();
}

uint64_t codex_install_reply_unpack()
{
  return MEMORY[0x270F991B0]();
}

uint64_t codex_list_pack()
{
  return MEMORY[0x270F991B8]();
}

uint64_t codex_list_reply_unpack()
{
  return MEMORY[0x270F991C0]();
}

uint64_t codex_lockdown_pack()
{
  return MEMORY[0x270F991C8]();
}

uint64_t collation_interface_request_endpoint_for_user()
{
  return MEMORY[0x270F991D0]();
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x270ED8F50](*(void *)&a1, a2, a3);
}

uint64_t cryptex_activate()
{
  return MEMORY[0x270F98FF8]();
}

uint64_t cryptex_actor_connect()
{
  return MEMORY[0x270F991D8]();
}

uint64_t cryptex_actor_create()
{
  return MEMORY[0x270F991E0]();
}

uint64_t cryptex_actor_trap()
{
  return MEMORY[0x270F991E8]();
}

uint64_t cryptex_actor_trap_with_cferr()
{
  return MEMORY[0x270F991F0]();
}

uint64_t cryptex_asset_copy()
{
  return MEMORY[0x270F99000]();
}

uint64_t cryptex_asset_create_generic_digest()
{
  return MEMORY[0x270F99008]();
}

uint64_t cryptex_asset_destroy()
{
  return MEMORY[0x270F99010]();
}

uint64_t cryptex_asset_new()
{
  return MEMORY[0x270F99018]();
}

uint64_t cryptex_asset_new_borrowed()
{
  return MEMORY[0x270F99020]();
}

uint64_t cryptex_core_attach_host()
{
  return MEMORY[0x270F99028]();
}

uint64_t cryptex_core_copy_nonce_domain_desc()
{
  return MEMORY[0x270F99030]();
}

uint64_t cryptex_core_create()
{
  return MEMORY[0x270F99038]();
}

uint64_t cryptex_core_cx1_copy_xpc_dictionary()
{
  return MEMORY[0x270F99040]();
}

uint64_t cryptex_core_cx1_properties_create()
{
  return MEMORY[0x270F99048]();
}

uint64_t cryptex_core_get_asset()
{
  return MEMORY[0x270F99050]();
}

uint64_t cryptex_core_get_cryptex1_properties()
{
  return MEMORY[0x270F99058]();
}

uint64_t cryptex_core_get_image_asset()
{
  return MEMORY[0x270F99060]();
}

uint64_t cryptex_core_get_info_asset()
{
  return MEMORY[0x270F99068]();
}

uint64_t cryptex_core_get_nonce_domain()
{
  return MEMORY[0x270F99070]();
}

uint64_t cryptex_core_get_nonce_domain_handle()
{
  return MEMORY[0x270F99078]();
}

uint64_t cryptex_core_get_tc_asset()
{
  return MEMORY[0x270F99080]();
}

uint64_t cryptex_core_get_volumehash_asset()
{
  return MEMORY[0x270F99088]();
}

uint64_t cryptex_core_is_cryptex1()
{
  return MEMORY[0x270F99090]();
}

uint64_t cryptex_core_parse_hdiid()
{
  return MEMORY[0x270F99098]();
}

uint64_t cryptex_core_parse_info_asset()
{
  return MEMORY[0x270F990A0]();
}

uint64_t cryptex_core_set_asset()
{
  return MEMORY[0x270F990A8]();
}

uint64_t cryptex_core_set_cryptex1_properties()
{
  return MEMORY[0x270F990B0]();
}

uint64_t cryptex_host_create()
{
  return MEMORY[0x270F990B8]();
}

uint64_t cryptex_scrivener_create()
{
  return MEMORY[0x270F990C0]();
}

uint64_t cryptex_scrivener_set_nonce()
{
  return MEMORY[0x270F990C8]();
}

uint64_t cryptex_scrivener_set_socks_proxy()
{
  return MEMORY[0x270F990D0]();
}

uint64_t cryptex_scrivener_set_url()
{
  return MEMORY[0x270F990D8]();
}

uint64_t cryptex_scrivener_sign()
{
  return MEMORY[0x270F990E0]();
}

uint64_t cryptex_session_core_copy_xpc_object()
{
  return MEMORY[0x270F990E8]();
}

uint64_t cryptex_session_core_create_from_xpc()
{
  return MEMORY[0x270F990F0]();
}

uint64_t cryptex_session_core_merge()
{
  return MEMORY[0x270F990F8]();
}

uint64_t cryptex_session_state_to_string()
{
  return MEMORY[0x270F99100]();
}

uint64_t cryptex_signature_write()
{
  return MEMORY[0x270F99108]();
}

uint64_t cryptex_subsystem_create_actor()
{
  return MEMORY[0x270F991F8]();
}

uint64_t cryptex_target_async_f()
{
  return MEMORY[0x270F99110]();
}

uint64_t cryptex_tss_activate()
{
  return MEMORY[0x270F99118]();
}

uint64_t cryptex_tss_async()
{
  return MEMORY[0x270F99120]();
}

uint64_t cryptex_tss_create()
{
  return MEMORY[0x270F99128]();
}

uint64_t cryptex_tss_set_BOOL()
{
  return MEMORY[0x270F99130]();
}

uint64_t cryptex_tss_set_c411_from_file()
{
  return MEMORY[0x270F99138]();
}

uint64_t cryptex_tss_set_data()
{
  return MEMORY[0x270F99140]();
}

uint64_t cryptex_tss_set_dgst()
{
  return MEMORY[0x270F99148]();
}

uint64_t cryptex_tss_set_im4m_array()
{
  return MEMORY[0x270F99150]();
}

uint64_t cryptex_tss_set_object_BOOL()
{
  return MEMORY[0x270F99158]();
}

uint64_t cryptex_tss_set_object_dgst()
{
  return MEMORY[0x270F99160]();
}

uint64_t cryptex_tss_set_string()
{
  return MEMORY[0x270F99168]();
}

uint64_t cryptex_tss_set_u32()
{
  return MEMORY[0x270F99170]();
}

uint64_t cryptex_tss_set_u64()
{
  return MEMORY[0x270F99178]();
}

uint64_t cryptex_tss_set_url()
{
  return MEMORY[0x270F99180]();
}

uint64_t cryptex_tss_submit()
{
  return MEMORY[0x270F99188]();
}

uint64_t cryptex_uninstall_pack()
{
  return MEMORY[0x270F99208]();
}

uint64_t cryptex_uninstall_reply_unpack()
{
  return MEMORY[0x270F99210]();
}

uint64_t cryptex_xpc_create_connection()
{
  return MEMORY[0x270F99218]();
}

char *__cdecl dirname_r(const char *a1, char *a2)
{
  return (char *)MEMORY[0x270ED9198](a1, a2);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9440](attr);
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dup(int a1)
{
  return MEMORY[0x270ED9678](*(void *)&a1);
}

uint64_t dup_np()
{
  return MEMORY[0x270ED9688]();
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x270ED98D8](*(void *)&from_fd, *(void *)&to_fd, a3, *(void *)&flags);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return MEMORY[0x270ED9C08](a1, *(void *)&a2, *(void *)&a3);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

uint64_t img4_buff_dealloc()
{
  return MEMORY[0x270F99A80]();
}

uint64_t img4_chip_instantiate()
{
  return MEMORY[0x270F99A98]();
}

uint64_t img4_chip_select_personalized_ap()
{
  return MEMORY[0x270F99AA0]();
}

uint64_t img4_nonce_domain_copy_nonce()
{
  return MEMORY[0x270F99AF0]();
}

uint64_t img4_runtime_execute_object()
{
  return MEMORY[0x270F99B00]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t mach_right_send_release()
{
  return MEMORY[0x270EDA260]();
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

uint64_t memdup2_np()
{
  return MEMORY[0x270EDA478]();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return MEMORY[0x270EDA520](*(void *)&a1, a2, a3);
}

char *__cdecl mkdtempat_np(int dfd, char *path)
{
  return (char *)MEMORY[0x270EDA530](*(void *)&dfd, path);
}

int mkpathat_np(int dfd, const char *path, mode_t omode)
{
  return MEMORY[0x270EDA558](*(void *)&dfd, path, omode);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

uint64_t mount_interface_create_mount_request()
{
  return MEMORY[0x270F99220]();
}

uint64_t mount_interface_create_unmount_request()
{
  return MEMORY[0x270F99228]();
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x270EDA840](*(void *)&a1, a2, *(void *)&a3);
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

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x270EDAB10]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDAD10](*(void *)&__fd, __buf, __nbyte, a4);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDB0A0](*(void *)&__fd, __buf, __nbyte, a4);
}

uint64_t realpath_np()
{
  return MEMORY[0x270EDB178]();
}

uint64_t remote_device_copy_properties()
{
  return MEMORY[0x270F5A958]();
}

uint64_t remote_device_copy_service()
{
  return MEMORY[0x270F5A970]();
}

uint64_t remote_device_get_name()
{
  return MEMORY[0x270F5A980]();
}

uint64_t remote_device_get_state()
{
  return MEMORY[0x270F5A988]();
}

uint64_t remote_service_create_copy_installed_request()
{
  return MEMORY[0x270F99230]();
}

uint64_t remote_service_create_install_request()
{
  return MEMORY[0x270F99238]();
}

uint64_t remote_service_create_nonce_handle_request()
{
  return MEMORY[0x270F99240]();
}

uint64_t remote_service_create_nonce_index_request()
{
  return MEMORY[0x270F99248]();
}

uint64_t remote_service_create_personalization_identifiers_request()
{
  return MEMORY[0x270F99250]();
}

uint64_t remote_service_create_roll_nonce_handle_request()
{
  return MEMORY[0x270F99258]();
}

uint64_t remote_service_create_roll_nonce_index_request()
{
  return MEMORY[0x270F99260]();
}

uint64_t remote_service_create_uninstall_request()
{
  return MEMORY[0x270F99268]();
}

uint64_t session_activate_pack()
{
  return MEMORY[0x270F99270]();
}

uint64_t session_activate_reply_unpack()
{
  return MEMORY[0x270F99278]();
}

uint64_t session_core_create()
{
  return MEMORY[0x270F99190]();
}

uint64_t session_list_pack()
{
  return MEMORY[0x270F99280]();
}

uint64_t session_list_reply_unpack()
{
  return MEMORY[0x270F99288]();
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

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

void uuid_clear(uuid_t uu)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
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

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x270EDBD70](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x270EDBE48](endpoint);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDBF20](object);
}

uint64_t xpc_copy_clean_description()
{
  return MEMORY[0x270EDBF28]();
}

uint64_t xpc_copy_debug_description()
{
  return MEMORY[0x270EDBF38]();
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x270EDBF70]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC040](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC078](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
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

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
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

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x270EDC210](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x270EDC218](xint);
}

void xpc_release(xpc_object_t object)
{
}

uint64_t xpc_remote_connection_activate()
{
  return MEMORY[0x270F5AA40]();
}

uint64_t xpc_remote_connection_cancel()
{
  return MEMORY[0x270F5AA50]();
}

uint64_t xpc_remote_connection_create_with_remote_service()
{
  return MEMORY[0x270F5AA58]();
}

uint64_t xpc_remote_connection_send_message_with_reply_sync()
{
  return MEMORY[0x270F5AA80]();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return MEMORY[0x270F5AA88]();
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x270EDC398]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}

xpc_object_t xpc_string_create_with_format(const char *fmt, ...)
{
  return (xpc_object_t)MEMORY[0x270EDC3E0](fmt);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x270EDC428](type);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x270EDC440](xuint);
}