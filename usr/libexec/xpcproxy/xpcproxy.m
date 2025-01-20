void *sub_100001A10(int a1)
{
  void *result;
  uint64_t vars8;

  if (a1)
  {
    if (dlopen("/usr/lib/system/libsystem_notify.dylib", 1)) {
      notify_set_options();
    }
    if (!dlopen("/usr/lib/system/libsystem_info.dylib", 1))
    {
LABEL_8:
      result = dlopen("/usr/lib/system/libsystem_trace.dylib", 1);
      if (!result) {
        return result;
      }
      goto LABEL_9;
    }
  }
  else
  {
    notify_set_options();
  }
  si_search_module_set_flags();
  si_search_module_set_flags();
  if (a1) {
    goto LABEL_8;
  }
LABEL_9:

  return (void *)_os_trace_set_mode(256);
}

uint64_t sub_100001AC8(uint64_t a1, uint64_t a2)
{
  bzero((void *)a1, 0x4A8uLL);
  *(void *)(a1 + 1128) = 0x6400000064;
  if (posix_spawnattr_init((posix_spawnattr_t *)a1)) {
    sub_100005D68();
  }
  uint64_t result = posix_spawn_file_actions_init((posix_spawn_file_actions_t *)(a1 + 8));
  if (result) {
    sub_100005D68();
  }
  *(void *)(a1 + 1136) = a2;
  return result;
}

uint64_t sub_100001B20(posix_spawnattr_t *a1, uint64_t a2, uint64_t a3, xpc_object_t xarray, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(unsigned int *)(a2 + 220);
  if (v8)
  {
    uint64_t v11 = *(unsigned int *)(a2 + 216);
    unint64_t v12 = 4 * v8;
    if (v12 > a3 - v11) {
      sub_100003B6C((uint64_t)a1, 22, 0, 0x31Du, 0, "No space for special ports: %zu > (%zu - %d)", a7, a8, v12);
    }
    char v14 = 0;
    size_t v15 = 0;
    uint64_t v16 = a2 + v11 + 240;
    while (1)
    {
      xpc_array_get_value(xarray, v15);
      mach_port_t right = xpc_mach_send_get_right();
      mach_port_t v20 = right;
      if (right - 1 >= 0xFFFFFFFE) {
        break;
      }
      int v21 = *(_DWORD *)(v16 + 4 * v15);
      if ((v21 - 128) > 2)
      {
        if (v21 == 4)
        {
          if ((*(unsigned char *)(a2 + 239) & 4) != 0) {
            mach_port_t v20 = 0;
          }
          else {
            mach_port_t v20 = right;
          }
        }
        if (posix_spawnattr_setspecialport_np(a1, v20, v21)) {
          sub_100005D68();
        }
      }
      else if ((v21 - 129) <= 1)
      {
        if (v14)
        {
          v23 = "Already registered ports";
          uint64_t v24 = (uint64_t)a1;
          unsigned int v25 = 820;
LABEL_19:
          sub_100003B6C(v24, 22, 0, v25, 0, v23, v18, v19, v26);
        }
        char v14 = 1;
        if (posix_spawnattr_set_registered_ports_np()) {
          sub_100005D68();
        }
      }
      if (++v15 >= *(unsigned int *)(a2 + 220)) {
        return 0;
      }
    }
    char v26 = v15;
    v23 = "Invalid special port[%zd]: %d";
    uint64_t v24 = (uint64_t)a1;
    unsigned int v25 = 806;
    goto LABEL_19;
  }
  return 0;
}

uint64_t sub_100001CC4(posix_spawnattr_t *a1, __int16 a2, __int16 a3)
{
  __int16 v7 = 0;
  if (posix_spawnattr_getflags(a1, &v7)) {
    sub_100005D68();
  }
  __int16 v7 = v7 & ~a3 | a2;
  uint64_t result = posix_spawnattr_setflags(a1, v7);
  if (result) {
    sub_100005D68();
  }
  return result;
}

uint64_t sub_100001D34(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  bzero(&v96, 0x4A8uLL);
  uint64_t type = (uint64_t)_xpc_spawnattr_unpack_string(a1, a2, *(_DWORD *)(a1 + 4));
  if (!type)
  {
    uint64_t v11 = "Unable to unpack program";
    int v12 = 22;
    unsigned int v13 = 742;
    goto LABEL_87;
  }
  char v14 = (const char *)type;
  if (*(unsigned char *)(a1 + 237))
  {
    mach_service = xpc_connection_create_mach_service("com.apple.xpc.roleaccountd", 0, 2uLL);
    xpc_connection_set_event_handler(mach_service, &stru_1000087B0);
    xpc_connection_activate(mach_service);
    xpc_object_t v30 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v30, "Path", v14);
    uint64_t v31 = xpc_bundle_create();
    if (v31)
    {
      v32 = (void *)v31;
      if (xpc_bundle_get_property())
      {
        v33 = (const char *)sandbox_extension_issue_file();
        if (v33)
        {
          v34 = (char *)v33;
          xpc_dictionary_set_string(v30, "Token", v33);
          free(v34);
        }
      }
      xpc_release(v32);
    }
    uint64_t type = (uint64_t)xpc_connection_send_message_with_reply_sync(mach_service, v30);
    if (!type)
    {
      uint64_t v11 = "setup_role_account no reply";
      int v12 = 140;
      unsigned int v13 = 629;
      goto LABEL_87;
    }
    v35 = (void *)type;
    xpc_connection_cancel(mach_service);
    uint64_t type = (uint64_t)xpc_get_type(v35);
    if ((_UNKNOWN *)type == &_xpc_type_error)
    {
      uint64_t v11 = "setup_role_account reply is error";
      int v12 = 22;
      unsigned int v13 = 634;
      goto LABEL_87;
    }
    uint64_t type = (uint64_t)xpc_dictionary_get_value(v35, "Retval");
    if (!type)
    {
      uint64_t v11 = "setup_role_account missing RETVAL_KEY";
      int v12 = 153;
      unsigned int v13 = 638;
      goto LABEL_87;
    }
    uint64_t type = xpc_dictionary_get_uint64(v35, "Retval");
    if (type)
    {
      uint64_t v11 = "setup_role_account failed";
      int v12 = type;
      unsigned int v13 = 643;
      goto LABEL_87;
    }
    uint64_t type = (uint64_t)xpc_dictionary_get_string(v35, "Path");
    if (!type)
    {
      uint64_t v11 = "setup_role_account missing PATH_KEY";
      int v12 = 2;
      unsigned int v13 = 648;
      goto LABEL_87;
    }
    uint64_t type = (uint64_t)sub_1000053A8((const char *)type);
    char v14 = (const char *)type;
    if (!type)
    {
      uint64_t v11 = "Unable to setup_role_account";
      int v12 = 1;
      unsigned int v13 = 748;
      goto LABEL_87;
    }
  }
  v95 = a3;
  size_t v15 = a4;
  uint64_t v16 = sub_100001AC8((uint64_t)&v96, (uint64_t)v14);
  unint64_t v19 = *(unsigned int *)(a1 + 208);
  if (v19)
  {
    if (v19 > a2) {
      sub_100003B6C(v16, 22, 0, 0x29Au, 0, "Insufficient rlimit: %u > %zd", v9, v10, *(_DWORD *)(a1 + 208));
    }
    uint64_t v37 = *(unsigned int *)(a1 + 204);
    if (20 * v37 > a2) {
      sub_100003B6C(v16, 22, 0, 0x29Eu, 0, "Too many rlimits: %d", v9, v10, *(_DWORD *)(a1 + 204));
    }
    if (v37)
    {
      unint64_t v39 = 0;
      uint64_t v40 = a1 + v19 + 240;
      do
      {
        rlim_t v41 = *(void *)v40;
        rlim_t v42 = *(void *)(v40 + 8);
        int v43 = *(unsigned __int16 *)(v40 + 16);
        char v44 = *(unsigned char *)(v40 + 18);
        char v45 = *(unsigned char *)(v40 + 19);
        v102.rlim_cur = 0;
        v102.rlim_max = 0;
        if (getrlimit(v43, &v102) == -1)
        {
          v78 = __error();
          sub_100003B6C((uint64_t)v78, *v78, 0, 0x2ADu, 0, "getrlimit(%d)", v79, v80, v43);
        }
        if (v44) {
          v102.rlim_max = v42;
        }
        if (v45) {
          v102.rlim_cur = v41;
        }
        setrlimit(v43, &v102);
        v40 += 20;
        ++v39;
      }
      while (v39 < *(unsigned int *)(a1 + 204));
    }
  }
  int v20 = *(_DWORD *)(a1 + 236);
  if ((v20 & 0x100) != 0)
  {
    uint64_t v36 = 0;
    v22 = v15;
    unsigned int v25 = v95;
    goto LABEL_61;
  }
  unsigned int v21 = *(_DWORD *)(a1 + 40);
  v22 = v15;
  if ((v20 & 0x80000) != 0 && !v21)
  {
    uid_t v23 = *(_DWORD *)(a1 + 48);
    *__error() = 0;
    uint64_t v24 = getpwuid(v23);
    unsigned int v25 = v95;
    if (!v24)
    {
      char v26 = __error();
      if (!*v26) {
        sub_100003B6C((uint64_t)v26, 114, 0, 0xABu, 0, "getpwuid(%d)", v27, v28, v23);
      }
      v75 = __error();
      sub_100003B6C((uint64_t)v75, *v75, 0, 0xADu, 0, "getpwuid(%d)", v76, v77, v23);
    }
    uint64_t v36 = (uint64_t)v24;
    LODWORD(v98) = *(_DWORD *)(a1 + 48);
    gid_t pw_gid = v24->pw_gid;
LABEL_42:
    HIDWORD(v98) = pw_gid;
    goto LABEL_61;
  }
  unsigned int v25 = v95;
  if (v21)
  {
    uint64_t type = (uint64_t)_xpc_spawnattr_unpack_string(a1, a2, v21);
    uint64_t v38 = type;
    if (!type)
    {
      uint64_t v11 = "Unable to unpack username";
      int v12 = 22;
      unsigned int v13 = 281;
      goto LABEL_87;
    }
  }
  else
  {
    uint64_t v38 = 0;
  }
  unsigned int v47 = *(_DWORD *)(a1 + 44);
  if (v47)
  {
    uint64_t type = (uint64_t)_xpc_spawnattr_unpack_string(a1, a2, v47);
    uint64_t v48 = type;
    if (!type)
    {
      uint64_t v11 = "Unable to unpack group";
      int v12 = 22;
      unsigned int v13 = 289;
      goto LABEL_87;
    }
  }
  else
  {
    uint64_t v48 = 0;
  }
  if (v48) {
    BOOL v49 = v38 == 0;
  }
  else {
    BOOL v49 = 0;
  }
  if (v49) {
    uint64_t v38 = (uint64_t)"root";
  }
  if (v48 | v38)
  {
    *__error() = 0;
    v50 = getpwnam((const char *)v38);
    if (!v50)
    {
      if (!*__error())
      {
        v51 = sub_100005C88(a1, (const char *)v38, 0);
        v52 = __error();
        sub_100003B6C((uint64_t)v52, 114, *v52, 0xD6u, (uint64_t)v51, "getpwnam(%s)", v53, v54, v38);
      }
      v86 = __error();
      sub_100003B6C((uint64_t)v86, *v86, 0, 0xD8u, 0, "getpwnam(%s)", v87, v88, v38);
    }
    uint64_t v36 = (uint64_t)v50;
    uint64_t v98 = *(void *)&v50->pw_uid;
    if (v48)
    {
      *__error() = 0;
      v81 = getgrnam((const char *)v48);
      if (!v81)
      {
        if (!*__error())
        {
          v82 = sub_100005C88(a1, 0, (const char *)v48);
          v83 = __error();
          sub_100003B6C((uint64_t)v83, 114, *v83, 0xF8u, (uint64_t)v82, "getgrnam(%s)", v84, v85, v48);
        }
        v89 = __error();
        sub_100003B6C((uint64_t)v89, *v89, 0, 0xFAu, 0, "getgrnam(%s)", v90, v91, v48);
      }
      gid_t pw_gid = v81->gr_gid;
      goto LABEL_42;
    }
  }
  else
  {
    uint64_t v36 = 0;
  }
LABEL_61:
  sub_100002B7C((uint64_t)&v96, a1, a2, v36, v17, v18, v9, v10);
  sub_100001B20(&v96, a1, a2, v25, v55, v56, v57, v58);
  sub_100003A14((uint64_t)&v96, v22);
  if (sub_1000038B0((uint64_t)&v96, a1, a2, 0, 0))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_100;
  }
  unsigned int v59 = *(_DWORD *)(a1 + 104);
  if (v59)
  {
    _xpc_spawnattr_unpack_string(a1, a2, v59);
    sub_100005A9C();
  }
  if ((*(unsigned char *)(a1 + 237) & 0x20) != 0) {
    umask(*(_WORD *)(a1 + 52));
  }
  unsigned int v60 = *(_DWORD *)(a1 + 64);
  if (v60)
  {
    v61 = _xpc_spawnattr_unpack_string(a1, a2, v60);
    if (chdir(v61) == -1)
    {
      v62 = __error();
      sub_100003B6C((uint64_t)v62, *v62, 0, 0x3B1u, 0, "Unable to set current working directory. path = %s", v63, v64, (char)v61);
    }
  }
  int v65 = *(_DWORD *)(a1 + 236);
  if ((v65 & 4) != 0)
  {
    if (!setiopolicy_np(0, 0, 3))
    {
      int v65 = *(_DWORD *)(a1 + 236);
      goto LABEL_72;
    }
LABEL_100:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_101:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_102;
  }
LABEL_72:
  if ((v65 & 8) != 0 && setiopolicy_np(0, 2, 3)) {
    goto LABEL_101;
  }
  if (*(_DWORD *)(a1 + 112) != 1792 || !posix_spawnattr_setprocesstype_np())
  {
    pthread_setname_np(byte_10000C080);
    if ((*(_DWORD *)(a1 + 236) & 0x800) != 0) {
      v66 = &posix_spawnp;
    }
    else {
      v66 = &_posix_spawn;
    }
    sub_100001CC4(&v96, 64, 0);
    sub_100002B34(570425384);
    uint64_t type = ((uint64_t (*)(void, char *, uint64_t *, posix_spawnattr_t *, uint64_t, uint64_t))v66)(0, v99, &v97, &v96, v100, v101);
    int v67 = type;
    if (type <= 0x14 && ((1 << type) & 0x102004) != 0)
    {
      uint64_t type = (uint64_t)v99;
      if (*v99 == 47)
      {
        uint64_t type = access(v99, 1);
        if (type == -1)
        {
          __error();
          xpc_object_t v68 = sub_100005C0C(a1, v99, 0);
          char v69 = (char)v99;
          uint64_t v94 = xpc_strerror();
          sub_100003B6C(v94, 111, v67, 0x440u, (uint64_t)v68, "access(%s, X_OK) failed with errno %d - %s", v70, v71, v69);
        }
      }
    }
    else if (type == 86)
    {
      xpc_object_t v72 = sub_100005C0C(a1, v99, 1);
      sub_100003B6C((uint64_t)v72, 111, 86, 0x424u, (uint64_t)v72, "posix_spawn(%s) EBADARCH", v73, v74, (char)v99);
    }
    uint64_t v11 = "posix_spawn(%s)";
    char v93 = (char)v99;
    int v12 = v67;
    unsigned int v13 = 1094;
LABEL_87:
    sub_100003B6C(type, v12, 0, v13, 0, v11, v9, v10, v93);
  }
LABEL_102:
  _os_assert_log();
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

const char *_xpc_spawnattr_unpack_string(uint64_t a1, unint64_t a2, unsigned int a3)
{
  if (a2 <= a3) {
    return 0;
  }
  v3 = (const char *)(a1 + a3 + 240);
  if (strnlen(v3, a2 - a3) + 1 <= a2 - a3) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t sub_1000025AC(int a1, xpc_object_t xdict, void *a3)
{
  if (_os_alloc_once_table[2] == -1) {
    v5 = (unsigned char *)_os_alloc_once_table[3];
  }
  else {
    v5 = (unsigned char *)_os_alloc_once();
  }
  if (*v5 || v5[4]) {
    return 141;
  }
  if (!v5[41]) {
    xpc_dictionary_set_BOOL(xdict, "pre-exec", 1);
  }
  uint64_t int64 = _xpc_pipe_interface_routine();
  if (!int64)
  {
    uint64_t int64 = xpc_dictionary_get_int64(0, "error");
    if (!int64)
    {
      if (_os_alloc_once_table[2] == -1) {
        uint64_t v8 = _os_alloc_once_table[3];
      }
      else {
        uint64_t v8 = _os_alloc_once();
      }
      if (!*(unsigned char *)(v8 + 88))
      {
        xpc_dictionary_get_audit_token();
        sub_100005E18(0);
      }
      uint64_t int64 = 0;
      *a3 = 0;
    }
  }
  return int64;
}

uint64_t start(int a1, uint64_t a2)
{
  sub_100002B34(570425380);
  if (_os_alloc_once_table[2] == -1) {
    uint64_t v4 = _os_alloc_once_table[3];
  }
  else {
    uint64_t v4 = _os_alloc_once();
  }
  if (setenv("PATH", "/usr/bin:/bin:/usr/sbin:/sbin", 1) != -1)
  {
    if (getppid() != 1 && (sub_100003D78() & 1) == 0)
    {
      __int16 v7 = __stdoutp;
      uint64_t v8 = getprogname();
      fprintf(v7, "%s cannot be run directly.\n", v8);
      exit(78);
    }
    if (a1 <= 1) {
LABEL_7:
    }
      exit(66);
    v5 = pthread_self();
    pthread_getname_np(v5, byte_10000C080, 0x80uLL);
    pthread_setname_np(*(const char **)(a2 + 8));
    qword_10000C078 = *(void *)(a2 + 8);
    sub_100001A10(0);
    if ((*(unsigned char *)(v4 + 9) & 2) != 0)
    {
      byte_10000C100 = 1;
      if (a1 <= 2) {
        sub_100005828(22);
      }
      sub_100005868(*(const char **)(a2 + 8), *(const char **)(a2 + 16));
    }
    else
    {
      if ((*(_DWORD *)(v4 + 20) + 1) < 2) {
        goto LABEL_18;
      }
      if (a1 >= 3)
      {
        int64_t v6 = (int)strtol(*(const char **)(a2 + 16), 0, 0);
        goto LABEL_17;
      }
    }
    int64_t v6 = 0;
LABEL_17:
    xpc_pipe_create_from_port();
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    pid_t v10 = getpid();
    xpc_dictionary_set_int64(v9, "pid", v10);
    xpc_dictionary_set_BOOL(v9, "configurable", 1);
    xpc_dictionary_set_int64(v9, "hostpid", v6);
    uint64_t data = xpc_pipe_simpleroutine();
    if (data)
    {
      size_t v15 = "controller died";
      int v16 = data;
      unsigned int v17 = 1250;
      goto LABEL_28;
    }
LABEL_18:
    xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v14, "self", 1);
    sub_100002B34(570425372);
    xpc_object_t xdict = 0;
    if (_xpc_service_routine(700, v14, &xdict)) {
      goto LABEL_7;
    }
    sub_100002B34(570425376);
    size_t length = 0;
    uint64_t data = (uint64_t)xpc_dictionary_get_data(xdict, "blob", &length);
    if (data)
    {
      if (length <= 0xEF) {
        sub_100003B6C(data, 22, 0, 0x503u, 0, "Insufficient spawnattr length: %zu < %lu", v12, v13, length);
      }
      uint64_t v18 = data;
      uint64_t data = (uint64_t)xpc_dictionary_get_value(xdict, "ports");
      if (data
        && (unint64_t v19 = (void *)data, data = (uint64_t)xpc_get_type((xpc_object_t)data), (_UNKNOWN *)data == &_xpc_type_array)
        && (uint64_t data = xpc_array_get_count(v19)) != 0)
      {
        uint64_t data = (uint64_t)xpc_dictionary_get_value(xdict, "fds");
        if (data)
        {
          int v20 = (void *)data;
          uint64_t data = (uint64_t)xpc_get_type((xpc_object_t)data);
          if ((_UNKNOWN *)data == &_xpc_type_array)
          {
            uint64_t data = xpc_array_get_count(v20);
            if ((data & 1) == 0) {
              uint64_t data = sub_100001D34(v18, length - 240, v19, v20);
            }
          }
        }
        size_t v15 = "fds invalid";
        int v16 = 22;
        unsigned int v17 = 1299;
      }
      else
      {
        size_t v15 = "Special ports invalid";
        int v16 = 22;
        unsigned int v17 = 1291;
      }
    }
    else
    {
      size_t v15 = "No spawn attr blob";
      int v16 = 22;
      unsigned int v17 = 1273;
    }
LABEL_28:
    sub_100003B6C(data, v16, 0, v17, 0, v15, v12, v13, v22);
  }
  __error();
  _os_assert_log();
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t sub_100002B34(uint64_t a1)
{
  uint64_t v2 = getpid();

  return _kdebug_trace(a1, v2, 0, 0, 0);
}

uint64_t sub_100002B7C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a1;
  if (!*(void *)(a1 + 1136))
  {
    char v22 = "Missing program";
    int v23 = 22;
    unsigned int v24 = 580;
    goto LABEL_25;
  }
  int v12 = *(unsigned __int8 *)(a2 + 108);
  unsigned int v13 = *(_DWORD *)(a2 + 236);
  if (setsid() == -1) {
    sub_100005E40();
  }
  if (v12) {
    __int16 v14 = 16512;
  }
  else {
    __int16 v14 = 0x4000;
  }
  unsigned int v15 = *(_DWORD *)(a2 + 236);
  if (MEMORY[0xFFFFF4084]) {
    __int16 v16 = (v15 >> 6) & 0x100;
  }
  else {
    __int16 v16 = 0;
  }
  int v17 = *(_DWORD *)(a2 + 236);
  if ((v15 & 0x8000) != 0)
  {
    if (posix_spawnattr_disable_ptr_auth_a_keys_np()) {
      sub_100005D68();
    }
    int v17 = *(_DWORD *)(a2 + 236);
  }
  if ((v17 & 0x40000) != 0)
  {
    if (posix_spawnattr_set_use_sec_transition_shims_np()) {
      sub_100005D68();
    }
    int v17 = *(_DWORD *)(a2 + 236);
  }
  sub_100001CC4((posix_spawnattr_t *)v8, (v13 >> 8) & 0x200 | v14 | v16 | (v15 >> 22 << 15) | HIWORD(v17) & 0x800, 0);
  uint64_t v18 = (cpu_type_t *)_xpc_spawnattr_binprefs_unpack(a2, a3);
  if (v18)
  {
    unint64_t v19 = v18;
    xpc_binprefs_set_psattr(v18, (posix_spawnattr_t *)v8);
    free(v19);
  }
  qos_class_t v20 = *(_DWORD *)(a2 + 200);
  if (v20 && posix_spawnattr_set_qos_class_np((posix_spawnattr_t *)v8, v20)) {
    sub_100005D68();
  }
  int v21 = *(_DWORD *)(a2 + 236);
  if ((v21 & 0x200000) != 0)
  {
    if ((*(unsigned char *)(a2 + 228) != 100 || *(_DWORD *)(a2 + 224)) && posix_spawnattr_setcpumonitor()) {
      sub_100005D68();
    }
  }
  else if ((v21 & 2) != 0)
  {
    if (posix_spawnattr_setcpumonitor_default()) {
      sub_100005D68();
    }
  }
  else if ((v21 & 1) == 0 && posix_spawnattr_setcpumonitor_default())
  {
    sub_100005D68();
  }
  if (posix_spawnattr_setjetsam_ext()) {
    sub_100005D68();
  }
  if (posix_spawnattr_set_threadlimit_ext()) {
    sub_100005D68();
  }
  if (posix_spawnattr_set_max_addr_np()) {
    sub_100005D68();
  }
  if (posix_spawnattr_set_portlimits_ext()) {
    sub_100005D68();
  }
  if (posix_spawnattr_set_filedesclimit_ext()) {
    sub_100005D68();
  }
  if (posix_spawnattr_set_kqworklooplimit_ext()) {
    sub_100005D68();
  }
  if ((*(unsigned char *)(a2 + 239) & 2) != 0 && posix_spawnattr_set_max_addr_np()) {
    sub_100005D68();
  }
  if (posix_spawnattr_set_crash_behavior_np()) {
    sub_100005D68();
  }
  if (posix_spawnattr_set_crash_behavior_deadline_np()) {
    sub_100005D68();
  }
  if (posix_spawnattr_set_launch_type_np()) {
    sub_100005D68();
  }
  if (posix_spawnattr_set_crash_count_np()) {
    sub_100005D68();
  }
  if (posix_spawnattr_set_darwin_role_np()) {
    sub_100005D68();
  }
  int v25 = *(unsigned __int8 *)(a2 + 229);
  if (v25 == 1)
  {
    if (posix_spawnattr_setdataless_iopolicy_np()) {
      sub_100005D68();
    }
  }
  else if (v25 == 2 && posix_spawnattr_setdataless_iopolicy_np())
  {
    sub_100005D68();
  }
  unsigned int v26 = *(_DWORD *)(a2 + 80);
  if (!v26)
  {
    unsigned int v31 = *(_DWORD *)(a2 + 84);
    if (!v31) {
      goto LABEL_64;
    }
    xpc_object_t v30 = 0;
    goto LABEL_55;
  }
  uint64_t v27 = _xpc_spawnattr_unpack_string(a2, a3, v26);
  if (!v27)
  {
    v32 = "Unable to unpack container_id";
    uint64_t v33 = v8;
    unsigned int v34 = 126;
    goto LABEL_63;
  }
  xpc_object_t v30 = v27;
  unsigned int v31 = *(_DWORD *)(a2 + 84);
  if (v31)
  {
LABEL_55:
    if (_xpc_spawnattr_unpack_string(a2, a3, v31))
    {
      sandbox_spawnattrs_init();
      if (sandbox_spawnattrs_setprofilename() == -1) {
        sub_100005E40();
      }
      if (!v30) {
        goto LABEL_59;
      }
      goto LABEL_58;
    }
    v32 = "Unable to unpack sandbox profile";
    uint64_t v33 = v8;
    unsigned int v34 = 135;
LABEL_63:
    sub_100003B6C(v33, 22, 0, v34, 0, v32, v28, v29, v130);
  }
  sandbox_spawnattrs_init();
LABEL_58:
  if (sandbox_spawnattrs_setcontainer() == -1) {
    sub_100005E40();
  }
LABEL_59:
  if (posix_spawnattr_setmacpolicyinfo_np()) {
    sub_100005D68();
  }
LABEL_64:
  unsigned int v35 = *(_DWORD *)(a2 + 88);
  if (v35)
  {
    _xpc_spawnattr_unpack_string(a2, a3, v35);
    if (posix_spawnattr_set_subsystem_root_path_np()) {
      sub_100005D68();
    }
  }
  uint64_t v36 = *(unsigned int *)(a2 + 16);
  if (v36)
  {
    uint64_t v37 = (const char **)sub_1000037A4(8 * v36 + 8);
    *(void *)(v8 + 1144) = v37;
    if (!_xpc_spawnattr_unpack_strings(a2, a3, *(_DWORD *)(a2 + 20), v37, *(unsigned int *)(a2 + 16)))
    {
      uint64_t v53 = "Unable to unpack argv";
      uint64_t v54 = v8;
      unsigned int v55 = 537;
      goto LABEL_76;
    }
    uint64_t v40 = (void *)(*(void *)(v8 + 1144) + 8 * *(unsigned int *)(a2 + 16));
  }
  else
  {
    rlim_t v41 = sub_1000037A4(0x10uLL);
    *(void *)(v8 + 1144) = v41;
    *rlim_t v41 = *(void *)(v8 + 1136);
    uint64_t v40 = v41 + 1;
  }
  *uint64_t v40 = 0;
  rlim_t v42 = (const char **)sub_1000037A4(8 * *(unsigned int *)(a2 + 24) + 56);
  *(void *)(v8 + 1160) = v42;
  uint64_t v46 = *(unsigned int *)(a2 + 24);
  if (v46)
  {
    if (_xpc_spawnattr_unpack_strings(a2, a3, *(_DWORD *)(a2 + 28), v42, v46))
    {
      *(void *)(v8 + 1152) = *(unsigned int *)(a2 + 24);
      goto LABEL_73;
    }
    uint64_t v53 = "Unable to unpack environment";
    uint64_t v54 = v8;
    unsigned int v55 = 565;
LABEL_76:
    sub_100003B6C(v54, 22, 0, v55, 0, v53, v38, v39, v130);
  }
LABEL_73:
  sub_10000373C((void *)v8, "XXXXXXXX%s=%llx", v43, v44, v46, v45, v38, v39, (char)"XPC_FLAGS");
  if (*(_DWORD *)(v8 + 1128) != -101)
  {
    if (!a4)
    {
      uint64_t v84 = "Unable to setup identify";
      uint64_t v85 = v8;
      int v86 = 22;
      unsigned int v87 = 354;
      goto LABEL_92;
    }
    *(void *)(v8 + 1120) = sub_10000373C((void *)v8, "XXXXXXXX%s=%s", v47, v48, v49, v50, v51, v52, (char)"LOGNAME")
                           + 8;
    sub_10000373C((void *)v8, "XXXXXXXX%s=%s", v56, v57, v58, v59, v60, v61, (char)"USER");
    sub_10000373C((void *)v8, "XXXXXXXX%s=%s", v62, v63, v64, v65, v66, v67, (char)"HOME");
    sub_10000373C((void *)v8, "XXXXXXXX%s=%s", v68, v69, v70, v71, v72, v73, (char)"SHELL");
    unsigned int v80 = *(_DWORD *)(v8 + 1128);
    if (v80 >= 0x1F5 && v80 != -2) {
      sub_10000373C((void *)v8, "XXXXXXXX%s=%s/tmp", v74, v75, v76, v77, v78, v79, (char)"TMPDIR");
    }
    if (setlogin(*(const char **)(v8 + 1120)))
    {
      int v81 = *__error();
      sub_100003B6C(v8, v81, 0, 0x17Au, 0, "setlogin(%s)", v82, v83, *(void *)(v8 + 1120));
    }
    if (setgid(*(_DWORD *)(v8 + 1132)))
    {
      int v88 = *__error();
      sub_100003B6C(v8, v88, 0, 0x181u, 0, "setgid(%d)", v89, v90, *(_DWORD *)(v8 + 1132));
    }
    if ((*(unsigned char *)(a2 + 237) & 0x10) == 0)
    {
      int v91 = initgroups(*(const char **)(v8 + 1120), *(_DWORD *)(v8 + 1132));
      if (v91) {
        sub_100003B6C(v8, v91, 0, 0x18Bu, 0, "initgroups(%s, %d)", v92, v93, *(void *)(v8 + 1120));
      }
    }
    if (setuid(*(_DWORD *)(v8 + 1128)))
    {
      int v86 = *__error();
      int v130 = *(_DWORD *)(v8 + 1128);
      uint64_t v84 = "setuid(%d)";
      uint64_t v85 = v8;
      unsigned int v87 = 400;
LABEL_92:
      sub_100003B6C(v85, v86, 0, v87, 0, v84, v51, v52, v130);
    }
  }
  xpc_object_t v94 = xpc_dictionary_create(0, 0, 0);
  if (*(void *)(v8 + 1152))
  {
    uint64_t v95 = 0;
    unint64_t v96 = 0;
    do
    {
      uint64_t v97 = *(char **)(*(void *)(v8 + 1160) + 8 * v96);
      uint64_t v98 = strchr(v97, 61);
      if (v98) {
        BOOL v101 = v98 == v97;
      }
      else {
        BOOL v101 = 1;
      }
      if (v101) {
        sub_100003B6C(v8, 22, 0, 0x1D0u, 0, "Invalid environment[%zd]: %s", v99, v100, v96);
      }
      rlimit v102 = sub_1000036E0(v97, v98 - v97);
      if (!xpc_dictionary_get_value(v94, v102))
      {
        xpc_dictionary_set_BOOL(v94, v102, 1);
        *(void *)(*(void *)(v8 + 1160) + 8 * v95++) = v97;
      }
      free(v102);
      ++v96;
    }
    while (v96 < *(void *)(v8 + 1152));
  }
  else
  {
    uint64_t v95 = 0;
  }
  xpc_release(v94);
  *(void *)(v8 + 1152) = v95;
  *(void *)(*(void *)(v8 + 1160) + 8 * v95) = 0;
  unsigned int v103 = *(_DWORD *)(a2 + 64);
  if (v103)
  {
    v106 = _xpc_spawnattr_unpack_string(a2, a3, v103);
    if (!v106)
    {
      v107 = "Unable to unpack cwd";
      uint64_t v108 = v8;
      unsigned int v109 = 224;
      goto LABEL_138;
    }
  }
  else
  {
    v106 = "/";
  }
  unsigned int v110 = *(_DWORD *)(a2 + 68);
  if (v110)
  {
    v111 = _xpc_spawnattr_unpack_string(a2, a3, v110);
    if (!v111)
    {
      v107 = "Unable to unpack stdin";
      uint64_t v108 = v8;
      unsigned int v109 = 241;
      goto LABEL_138;
    }
    v112 = (char *)v111;
    bzero(__str, 0x400uLL);
    if (*v112 != 47)
    {
      v131 = v112;
      v112 = __str;
      snprintf(__str, 0x400uLL, "%s/%s", v106, v131);
    }
    int v113 = sub_10000576C(v112);
    if (v113) {
      sub_100003B6C(v8, v113, 0, 0xFDu, 0, "Unable to create stdin directory (%s)", v114, v115, (char)v112);
    }
    if (posix_spawn_file_actions_addopen((posix_spawn_file_actions_t *)(v8 + 8), 0, v112, 131584, 0x1B6u)) {
      sub_100005D68();
    }
  }
  else if (posix_spawn_file_actions_addopen((posix_spawn_file_actions_t *)(v8 + 8), 0, "/dev/null", 0x20000, 0x1B6u))
  {
    sub_100005D68();
  }
  unsigned int v116 = *(_DWORD *)(a2 + 72);
  if (v116)
  {
    v117 = _xpc_spawnattr_unpack_string(a2, a3, v116);
    if (!v117)
    {
      v107 = "Unable to unpack stdout";
      uint64_t v108 = v8;
      unsigned int v109 = 268;
      goto LABEL_138;
    }
    v118 = (char *)v117;
    bzero(__str, 0x400uLL);
    if (*v118 != 47)
    {
      v132 = v118;
      v118 = __str;
      snprintf(__str, 0x400uLL, "%s/%s", v106, v132);
    }
    int v119 = sub_10000576C(v118);
    if (v119) {
      sub_100003B6C(v8, v119, 0, 0x118u, 0, "Unable to create stdout directory (%s)", v120, v121, (char)v118);
    }
    if (posix_spawn_file_actions_addopen((posix_spawn_file_actions_t *)(v8 + 8), 1, v118, 131594, 0x1B6u)) {
      sub_100005D68();
    }
  }
  else if (posix_spawn_file_actions_addopen((posix_spawn_file_actions_t *)(v8 + 8), 1, "/dev/null", 131074, 0x1B6u))
  {
    sub_100005D68();
  }
  unsigned int v122 = *(_DWORD *)(a2 + 76);
  if (v122)
  {
    v123 = _xpc_spawnattr_unpack_string(a2, a3, v122);
    if (v123)
    {
      v124 = (char *)v123;
      bzero(__str, 0x400uLL);
      if (*v124 != 47)
      {
        v133 = v124;
        v124 = __str;
        snprintf(__str, 0x400uLL, "%s/%s", v106, v133);
      }
      int v125 = sub_10000576C(v124);
      if (v125) {
        sub_100003B6C(v8, v125, 0, 0x133u, 0, "Unable to create stderr directory (%s)", v126, v127, (char)v124);
      }
      if (posix_spawn_file_actions_addopen((posix_spawn_file_actions_t *)(v8 + 8), 2, v124, 131594, 0x1B6u)) {
        sub_100005D68();
      }
      goto LABEL_139;
    }
    v107 = "Unable to unpack stderr";
    uint64_t v108 = v8;
    unsigned int v109 = 295;
LABEL_138:
    sub_100003B6C(v108, 22, 0, v109, 0, v107, v104, v105, v130);
  }
  if (posix_spawn_file_actions_addopen((posix_spawn_file_actions_t *)(v8 + 8), 2, "/dev/null", 131074, 0x1B6u)) {
    sub_100005D68();
  }
LABEL_139:
  if (*(unsigned char *)(a2 + 238))
  {
    int v128 = *(_DWORD *)(v8 + 1128);
    if (!v128 || v128 == -101)
    {
      char v22 = "extensions cannot run as root";
      a1 = v8;
      int v23 = 1;
      unsigned int v24 = 769;
LABEL_25:
      sub_100003B6C(a1, v23, 0, v24, 0, v22, a7, a8, v130);
    }
  }
  return 0;
}

char *sub_1000036E0(const char *a1, size_t a2)
{
  size_t v2 = a2;
  v3 = a1;
  while (1)
  {
    uint64_t result = strndup(a1, a2);
    if (result) {
      break;
    }
    if (*__error() != 12)
    {
      if (*__error()) {
        sub_100005D68();
      }
    }
    sub_100005344();
    a1 = v3;
    a2 = v2;
  }
  return result;
}

char *sub_10000373C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  v14[0] = 0;
  v14[1] = &a9;
  vasprintf(v14, a2, &a9);
  pid_t v10 = v14[0];
  *(void *)v14[0] = a1[148];
  a1[148] = v10;
  uint64_t result = v10 + 8;
  uint64_t v12 = a1[145];
  uint64_t v13 = a1[144];
  a1[144] = v13 + 1;
  *(void *)(v12 + 8 * v13) = result;
  return result;
}

void *sub_1000037A4(size_t size)
{
  do
  {
    size_t v2 = malloc_type_calloc(1uLL, size, 0x5C63E6C5uLL);
    if (v2) {
      break;
    }
    if (*__error() != 12 && *__error()) {
      sub_100005D68();
    }
  }
  while (sub_100005344());
  return v2;
}

const char *_xpc_spawnattr_unpack_strings(uint64_t a1, unint64_t a2, unsigned int a3, const char **a4, uint64_t a5)
{
  if (a3 >= a2) {
    return 0;
  }
  uint64_t v5 = a5;
  if (!a5) {
    return *a4;
  }
  unsigned int v7 = a3;
  uint64_t v9 = a1 + 240;
  for (i = a4; ; ++i)
  {
    uint64_t v11 = (const char *)(v9 + v7);
    size_t v12 = strnlen(v11, a2 - v7);
    if (v12 + 1 > a2 - v7) {
      break;
    }
    v7 += v12 + 1;
    *i = v11;
    if (!--v5) {
      return *a4;
    }
  }
  return 0;
}

uint64_t sub_1000038B0(uint64_t a1, uint64_t a2, unint64_t a3, const void *a4, size_t a5)
{
  size_t v8 = *(unsigned int *)(a2 + 12);
  if (v8) {
    uint64_t v9 = (const void *)_xpc_spawnattr_unpack_bytes(a2, a3, *(_DWORD *)(a2 + 8), v8);
  }
  else {
    uint64_t v9 = 0;
  }
  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = !v10;
  if (a4 && a5)
  {
    if (!v11)
    {
      *(void *)(a1 + 1168) = sub_100005364(a4, a5);
      *(void *)(a1 + 1176) = a5;
      goto LABEL_19;
    }
    size_t v12 = (void *)sub_10000438C((uint64_t)a4, a5, (uint64_t)v9, v8);
    if (v12)
    {
      unsigned int v15 = v12;
      size_t length = xpc_data_get_length(v12);
      *(void *)(a1 + 1176) = length;
      int v17 = sub_1000037A4(length);
      *(void *)(a1 + 1168) = v17;
      size_t bytes = xpc_data_get_bytes(v15, v17, 0, *(void *)(a1 + 1176));
      uint64_t v19 = *(void *)(a1 + 1176);
      xpc_release(v15);
      if (bytes == v19) {
        goto LABEL_19;
      }
      int v21 = "Unable to copy merged spawn constraints";
      uint64_t v22 = a1;
      unsigned int v23 = 938;
    }
    else
    {
      int v21 = "Unable to merge spawn constraints";
      uint64_t v22 = a1;
      unsigned int v23 = 933;
    }
    sub_100003B6C(v22, 22, 0, v23, 0, v21, v13, v14, v24);
  }
  if (!v11) {
    return 0;
  }
  *(void *)(a1 + 1168) = sub_100005364(v9, v8);
  *(void *)(a1 + 1176) = v8;
LABEL_19:
  uint64_t result = amfi_launch_constraint_set_spawnattr();
  if (result) {
    sub_100005D68();
  }
  return result;
}

size_t sub_100003A14(uint64_t a1, xpc_object_t xarray)
{
  size_t result = xpc_array_get_count(xarray);
  if (result)
  {
    size_t v5 = 0;
    do
    {
      xpc_object_t value = xpc_array_get_value(xarray, v5 + 1);
      if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_int64)
      {
        uint64_t v13 = "setup_fds bad int type";
        uint64_t v14 = a1;
        unsigned int v15 = 864;
        goto LABEL_13;
      }
      int v9 = xpc_int64_get_value(value);
      if (v9 < 0 || getdtablesize() <= v9)
      {
        getdtablesize();
        sub_100003B6C(a1, 9, 0, 0x364u, 0, "setup_fds bad dest: %d table: %d", v11, v12, v9);
      }
      xpc_object_t v10 = xpc_array_get_value(xarray, v5);
      if (xpc_get_type(v10) != (xpc_type_t)&_xpc_type_fd)
      {
        uint64_t v13 = "setup_fds bad fd type";
        uint64_t v14 = a1;
        unsigned int v15 = 873;
LABEL_13:
        sub_100003B6C(v14, 9, 0, v15, 0, v13, v7, v8, v16);
      }
      _xpc_fd_get_port();
      if (posix_spawn_file_actions_add_fileportdup2_np()) {
        sub_100005D68();
      }
      v5 += 2;
    }
    while (v5 < xpc_array_get_count(xarray));
    return 0;
  }
  return result;
}

void sub_100003B6C(uint64_t a1, int a2, int a3, unsigned int a4, uint64_t a5, const char *a6, uint64_t a7, uint64_t a8, char a9)
{
  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v15, "self", 1);
  xpc_dictionary_set_int64(v15, "code", a2);
  xpc_dictionary_set_int64(v15, "subcode", a3);
  xpc_dictionary_set_uint64(v15, "line", a4);
  xpc_dictionary_set_BOOL(v15, "setup-event", a5 != 0);
  string[0] = 0;
  string[1] = &a9;
  vasprintf(string, a6, &a9);
  char v16 = 0;
  if (string[0])
  {
    xpc_dictionary_set_string(v15, "string", string[0]);
    char v16 = string[0];
  }
  free(v16);
  string[0] = 0;
  uint64_t v17 = dyld_image_header_containing_address();
  if (v17)
  {
    v18[0] = 0;
    v18[1] = 0;
    _dyld_get_image_uuid();
    xpc_dictionary_set_uuid(v15, "uuid", (const unsigned __int8 *)v18);
  }
  xpc_dictionary_set_uint64(v15, "pc", v9 - v17);
  v18[0] = 0;
  _xpc_service_routine(701, v15, v18);
  if (a5) {
    xpc_set_event();
  }
  exit(78);
}

uint64_t _xpc_spawnattr_binprefs_unpack(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 32);
  if (!v2 || a2 - (unint64_t)*(unsigned int *)(a1 + 36) < 8 * v2) {
    return 0;
  }
  xpc_binprefs_alloc();
  uint64_t v4 = v5;
  if (*(_DWORD *)(a1 + 32))
  {
    unint64_t v6 = 0;
    uint64_t v7 = (int *)(*(unsigned int *)(a1 + 36) + a1 + 244);
    do
    {
      xpc_binprefs_add(v4, *(v7 - 1), *v7);
      ++v6;
      v7 += 2;
    }
    while (v6 < *(unsigned int *)(a1 + 32));
  }
  return v4;
}

uint64_t _xpc_service_routine(int a1, xpc_object_t xdict, void *a3)
{
  return sub_1000025AC(a1, xdict, a3);
}

uint64_t sub_100003D78()
{
  if (qword_10000C070 != -1) {
    dispatch_once(&qword_10000C070, &stru_100008628);
  }
  return byte_10000C068;
}

void sub_100003DBC(id a1)
{
  pid_t v1 = getpid();
  byte_10000C068 = sub_100003DE0(v1);
}

uint64_t sub_100003DE0(int a1)
{
  long long v3 = 0u;
  long long v4 = 0u;
  memset(v2, 0, sizeof(v2));
  if (!sub_100005D28(a1, v2)) {
    return (v3 >> 1) & 1;
  }
  _os_assumes_log();
  return 0;
}

uint64_t sub_100003E68()
{
  return qword_10000C030;
}

uint64_t sub_100003E74(void *a1)
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000;
  xpc_object_t empty = 0;
  xpc_object_t empty = xpc_array_create_empty();
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 0x40000000;
  applier[2] = sub_100004004;
  applier[3] = &unk_100008650;
  applier[4] = &v12;
  xpc_dictionary_apply(a1, applier);
  size_t count = xpc_array_get_count((xpc_object_t)v13[3]);
  do
  {
    if (count < 2) {
      break;
    }
    size_t v3 = 0;
    for (size_t i = 1; i != count; ++i)
    {
      xpc_object_t value = xpc_array_get_value((xpc_object_t)v13[3], i - 1);
      xpc_object_t v6 = xpc_array_get_value((xpc_object_t)v13[3], i);
      string_ptr = xpc_string_get_string_ptr(value);
      uint64_t v8 = xpc_string_get_string_ptr(v6);
      if (strcmp(string_ptr, v8) >= 1)
      {
        xpc_retain(value);
        xpc_array_set_value((xpc_object_t)v13[3], i - 1, v6);
        xpc_array_set_value((xpc_object_t)v13[3], i, value);
        xpc_release(value);
        size_t v3 = i;
      }
    }
    size_t count = v3;
  }
  while (v3);
  uint64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t sub_100004004(uint64_t a1, char *string)
{
  return 1;
}

xpc_object_t sub_100004034(int64_t a1, int64_t a2, xpc_object_t object)
{
  if (object && xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary) {
    return 0;
  }
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "vers", a1);
  xpc_dictionary_set_int64(empty, "comp", 1);
  xpc_dictionary_set_int64(empty, "ccat", a2);
  if (object) {
    xpc_dictionary_set_value(empty, "reqs", object);
  }
  return empty;
}

size_t sub_1000040E4(void *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)&_xpc_type_dictionary) {
    return 0;
  }
  xpc_object_t empty = xpc_array_create_empty();
  if (sub_100004528(a1, empty))
  {
    xpc_release(empty);
    return 0;
  }
  if (!empty) {
    return 0;
  }
  size_t result = xpc_array_get_count(empty);
  if (!(result >> 59))
  {
    uint64_t v5 = (void **)sub_1000037A4(32 * result);
    length[0] = (size_t)_NSConcreteStackBlock;
    length[1] = 0x40000000;
    length[2] = (size_t)sub_100004BD4;
    length[3] = (size_t)&unk_1000086C0;
    length[4] = (size_t)v5;
    xpc_array_apply(empty, length);
    xpc_array_get_count(empty);
    length[0] = 0;
    xpc_object_t v3 = 0;
    if (CESizeSerialization() == kCENoError)
    {
      xpc_object_t v6 = sub_1000037A4(length[0]);
      char v11 = 1;
      if (CESerializeWithOptions() == kCENoError) {
        xpc_object_t v3 = xpc_data_create(v6, length[0]);
      }
      else {
        xpc_object_t v3 = 0;
      }
      free(v6);
    }
    size_t count = xpc_array_get_count(empty);
    if (count)
    {
      size_t v8 = count;
      uint64_t v9 = v5 + 1;
      do
      {
        if (*(v9 - 1) == (void *)3) {
          free(*v9);
        }
        v9 += 4;
        --v8;
      }
      while (v8);
    }
    free(v5);
    xpc_release(empty);
    return (size_t)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000042B8()
{
  long long v11 = 0uLL;
  uint64_t v12 = 0;
  char v10 = 1;
  uint64_t v0 = CEValidateWithOptions();
  uint64_t result = 0;
  if (v0 == kCENoError)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    long long v2 = v11;
    *(void *)&long long v3 = v12;
    if (CEAcquireUnmanagedContext() == kCENoError)
    {
      long long v2 = v6;
      long long v3 = v7;
      long long v4 = v8;
      uint64_t v5 = v9;
      return sub_100004D2C(&v2);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

size_t sub_10000438C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *((void *)&v15 + 1) = 0;
  xpc_object_t v6 = sub_1000044B0(a1, a2, (int64_t *)&v15 + 1);
  if (!v6) {
    return 0;
  }
  long long v7 = v6;
  *(void *)&long long v15 = 0;
  xpc_object_t v8 = sub_1000044B0(a3, a4, (int64_t *)&v15);
  if (v8)
  {
    long long v9 = v8;
    if (v15 == 0)
    {
      xpc_object_t empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_value(empty, "$and", v9);
      xpc_object_t v12 = xpc_dictionary_create_empty();
      xpc_dictionary_set_value(v12, "$and", v7);
      xpc_dictionary_set_value(v12, "$or", empty);
      xpc_release(empty);
      xpc_object_t v13 = sub_100004034(1, 0, v12);
      xpc_release(v12);
      size_t v10 = sub_1000040E4(v13);
      xpc_release(v13);
    }
    else
    {
      size_t v10 = 0;
    }
    xpc_release(v7);
  }
  else
  {
    size_t v10 = 0;
    long long v9 = v7;
  }
  xpc_release(v9);
  return v10;
}

xpc_object_t sub_1000044B0(uint64_t a1, uint64_t a2, int64_t *a3)
{
  long long v4 = (void *)sub_1000042B8();
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  xpc_object_t value = xpc_dictionary_get_value(v4, "reqs");
  xpc_object_t v7 = value;
  if (value) {
    xpc_retain(value);
  }
  *a3 = xpc_dictionary_get_int64(v5, "ccat");
  xpc_release(v5);
  return v7;
}

uint64_t sub_100004528(void *a1, void *a2)
{
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x2000000000;
  int v11 = 4;
  long long v4 = (void *)sub_100003E74(a1);
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t bytes = 7;
  uint64_t v13 = 0;
  xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 0x40000000;
  applier[2] = sub_100004644;
  applier[3] = &unk_100008678;
  void applier[5] = a2;
  applier[6] = a1;
  applier[4] = &v8;
  xpc_array_apply(v4, applier);
  xpc_release(v4);
  uint64_t v5 = *((unsigned int *)v9 + 6);
  if (!v5)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t bytes = 8;
    uint64_t v13 = 0;
    xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
    uint64_t v5 = *((unsigned int *)v9 + 6);
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t sub_100004644(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t bytes = 5;
  uint64_t v16 = 0;
  xpc_array_set_data(v5, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
  string_ptr = xpc_string_get_string_ptr(a3);
  v12[3] = 0;
  v12[0] = 3;
  v12[1] = sub_1000053A8(string_ptr);
  v12[2] = xpc_string_get_length(a3);
  xpc_array_set_data(*(xpc_object_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL, v12, 0x20uLL);
  xpc_object_t v7 = *(void **)(a1 + 48);
  uint64_t v8 = xpc_string_get_string_ptr(a3);
  xpc_object_t value = xpc_dictionary_get_value(v7, v8);
  if (value)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sub_10000487C(value, *(void **)(a1 + 40));
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      uint64_t bytes = 0;
      uint64_t v16 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      if ((_dyld_get_image_uuid() & 1) == 0)
      {
        uint64_t bytes = 0;
        uint64_t v16 = 0;
      }
      if (_dyld_get_shared_cache_uuid())
      {
        _dyld_get_shared_cache_range();
      }
      else
      {
        uint64_t v13 = 0;
        uint64_t v14 = 0;
      }
      xpc_string_get_string_ptr(a3);
      _os_log_simple();
      return 0;
    }
    else
    {
      uint64_t v10 = *(void **)(a1 + 40);
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t bytes = 6;
      uint64_t v16 = 0;
      xpc_array_set_data(v10, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
      return 1;
    }
  }
  else
  {
    uint64_t bytes = 0;
    uint64_t v16 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    if ((_dyld_get_image_uuid() & 1) == 0)
    {
      uint64_t bytes = 0;
      uint64_t v16 = 0;
    }
    if (_dyld_get_shared_cache_uuid())
    {
      _dyld_get_shared_cache_range();
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v14 = 0;
    }
    xpc_string_get_string_ptr(a3);
    _os_log_simple();
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 2;
  }
  return result;
}

uint64_t sub_10000487C(void *a1, void *a2)
{
  xpc_type_t type = xpc_get_type(a1);
  if (type == (xpc_type_t)&_xpc_type_string)
  {
    uint64_t v16 = 0;
    uint64_t bytes = 2;
    int64_t string_ptr = (int64_t)xpc_string_get_string_ptr(a1);
    size_t length = xpc_string_get_length(a1);
LABEL_12:
    uint64_t v15 = (BOOL (*)(uint64_t, uint64_t, uint64_t))length;
LABEL_16:
    LOBYTE(v16) = 0;
    xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
    return 0;
  }
  uint64_t v5 = type;
  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    uint64_t bytes = 4;
    uint64_t v16 = 0;
    int64_t string_ptr = xpc_int64_get_value(a1);
LABEL_15:
    uint64_t v15 = 0;
    goto LABEL_16;
  }
  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    uint64_t bytes = 1;
    uint64_t v16 = 0;
    int64_t string_ptr = xpc_BOOL_get_value(a1);
    goto LABEL_15;
  }
  if (type == (xpc_type_t)&_xpc_type_data)
  {
    uint64_t v16 = 0;
    uint64_t bytes = 9;
    int64_t string_ptr = (int64_t)xpc_data_get_bytes_ptr(a1);
    size_t length = xpc_data_get_length(a1);
    goto LABEL_12;
  }
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (type == (xpc_type_t)&_xpc_type_array)
    {
      uint64_t v9 = 0;
      uint64_t v10 = &v9;
      uint64_t v11 = 0x2000000000;
      int v12 = 4;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t bytes = 5;
      int64_t string_ptr = 0;
      xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
      uint64_t bytes = (uint64_t)_NSConcreteStackBlock;
      int64_t string_ptr = 0x40000000;
      uint64_t v15 = sub_100004B88;
      uint64_t v16 = &unk_1000086A0;
      uint64_t v17 = &v9;
      uint64_t v18 = a2;
      xpc_array_apply(a1, &bytes);
      uint64_t v7 = *((unsigned int *)v10 + 6);
      if (!v7)
      {
        uint64_t v21 = 0;
        uint64_t v22 = 0;
        uint64_t v19 = 6;
        uint64_t v20 = 0;
        xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &v19, 0x20uLL);
        uint64_t v7 = *((unsigned int *)v10 + 6);
      }
      _Block_object_dispose(&v9, 8);
    }
    else
    {
      uint64_t bytes = 0;
      int64_t string_ptr = 0;
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      if ((_dyld_get_image_uuid() & 1) == 0)
      {
        uint64_t bytes = 0;
        int64_t string_ptr = 0;
      }
      if (_dyld_get_shared_cache_uuid())
      {
        uint64_t v9 = 0;
        _dyld_get_shared_cache_range();
      }
      else
      {
        uint64_t v19 = 0;
        uint64_t v20 = 0;
      }
      xpc_type_get_name(v5);
      _os_log_simple();
      return 1;
    }
    return v7;
  }

  return sub_100004528(a1, a2);
}

BOOL sub_100004B88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sub_10000487C(a3, *(void *)(a1 + 40));
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

uint64_t sub_100004BD4(uint64_t a1, uint64_t a2, xpc_object_t xdata)
{
  long long v3 = (_OWORD *)(*(void *)(a1 + 32) + 32 * a2);
  bytes_ptr = xpc_data_get_bytes_ptr(xdata);
  long long v5 = bytes_ptr[1];
  _OWORD *v3 = *bytes_ptr;
  v3[1] = v5;
  return 1;
}

uint64_t sub_100004C0C()
{
  if (*((void *)&_os_alloc_once_table + 2) == -1) {
    uint64_t v0 = *((void *)&_os_alloc_once_table + 3);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  if (*(unsigned char *)(v0 + 41))
  {
    if (*(void *)(v0 + 48) != -1) {
      dispatch_once_f((dispatch_once_t *)(v0 + 48), (void *)(v0 + 56), (dispatch_function_t)sub_100004C9C);
    }
  }
  else
  {
    sub_100004C9C((task_info_t)(v0 + 56));
  }
  return v0 + 56;
}

uint64_t sub_100004C9C(task_info_t task_info_out)
{
  mach_msg_type_number_t task_info_outCnt = 8;
  if (task_info(mach_task_self_, 0xFu, task_info_out, &task_info_outCnt)) {
    sub_100005D84();
  }
  integer_t v2 = task_info_out[5];
  uint64_t result = getpid();
  if (v2 != result || !task_info_out[7]) {
    sub_100005D84();
  }
  return result;
}

uint64_t _xpc_spawnattr_unpack_bytes(uint64_t a1, unint64_t a2, unsigned int a3, unsigned int a4)
{
  if (a2 - a3 >= a4) {
    uint64_t v4 = a1 + a3 + 240;
  }
  else {
    uint64_t v4 = 0;
  }
  if (a2 <= a3) {
    return 0;
  }
  else {
    return v4;
  }
}

uint64_t sub_100004D2C(long long *a1)
{
  long long v2 = a1[1];
  long long v5 = *a1;
  long long v6 = v2;
  long long v7 = a1[2];
  uint64_t v8 = *((void *)a1 + 6);
  if (!der_vm_context_is_valid()) {
    return 0;
  }
  long long v3 = a1[1];
  long long v5 = *a1;
  long long v6 = v3;
  long long v7 = a1[2];
  uint64_t v8 = *((void *)a1 + 6);
  return ((uint64_t (*)(long long *))loc_100004DA0)(&v5);
}

uint64_t sub_100004F78(uint64_t *a1)
{
  uint64_t v2 = *a1;
  int v3 = *((_DWORD *)a1 + 29);
  if (v3 == 2)
  {
    if (*((_DWORD *)a1 + 28) == 1)
    {
      long long v7 = (void *)a1[15];
      uint64_t v18 = 0;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v15 = 0u;
      memset((char *)v19 + 8, 0, 248);
      long long v8 = *(_OWORD *)(a1 + 9);
      v13[0] = *(_OWORD *)(a1 + 7);
      v13[1] = v8;
      v13[2] = *(_OWORD *)(a1 + 11);
      uint64_t v14 = a1[13];
      der_vm_execute();
      uint64_t v9 = (char *)sub_100005244();
      v19[0] = xmmword_1000069B0;
      der_vm_execute();
      xpc_object_t empty = (xpc_object_t)((uint64_t (*)(_OWORD *))loc_100004DA0)(v13);
      xpc_dictionary_set_value(v7, v9, empty);
      free(v9);
    }
    else
    {
      xpc_object_t empty = xpc_array_create_empty();
      long long v11 = *(_OWORD *)(a1 + 9);
      v19[0] = *(_OWORD *)(a1 + 7);
      v19[1] = v11;
      v19[2] = *(_OWORD *)(a1 + 11);
      *(void *)&v19[3] = a1[13];
      if (der_vm_iterate() != kCENoError)
      {
        (*(void (**)(uint64_t, const char *, ...))(v2 + 32))(v2, "[%s]: %s\n", "_manufacturingCallback", "CoreEntitlements: Couldn't iterate over DER entitlements\n");
        return (uint64_t)sub_100005244();
      }
      xpc_array_set_value((xpc_object_t)a1[15], 0xFFFFFFFFFFFFFFFFLL, empty);
    }
    long long v6 = empty;
    goto LABEL_10;
  }
  if (v3)
  {
    if (*((_DWORD *)a1 + 28) == 2)
    {
      long long v4 = *(_OWORD *)(a1 + 9);
      v19[0] = *(_OWORD *)(a1 + 7);
      v19[1] = v4;
      v19[2] = *(_OWORD *)(a1 + 11);
      *(void *)&v19[3] = a1[13];
      long long v5 = (void *)((uint64_t (*)(_OWORD *))loc_100004DA0)(v19);
      xpc_array_set_value((xpc_object_t)a1[15], 0xFFFFFFFFFFFFFFFFLL, v5);
      long long v6 = v5;
LABEL_10:
      xpc_release(v6);
      return 1;
    }
    (*(void (**)(uint64_t, const char *, ...))(v2 + 32))(v2, "[%s]: %s\n", "_manufacturingCallback", "CoreEntitlements: not a sequence");
  }
  else
  {
    (*(void (**)(uint64_t, const char *, ...))(v2 + 32))(v2, "[%s]: %s\n", "_manufacturingCallback", "CoreEntitlements: unknown DER type");
  }
  return (uint64_t)sub_100005244();
}

void *sub_100005244()
{
  uint64_t v0 = (const void *)der_vm_string_from_context();
  size_t v2 = v1;
  int v3 = sub_1000037A4(v1 + 1);
  memcpy(v3, v0, v2);
  return v3;
}

void *sub_1000052B4(int a1, size_t size)
{
  return malloc_type_malloc(size, 0x78220757uLL);
}

void sub_1000052C4(int a1, void *a2)
{
}

void sub_1000052CC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_1000052FC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  qword_10000C030 = (uint64_t)"Data corruption: CoreEntitlements has aborted due to an unrecoverable error";
  __break(1u);
}

uint64_t sub_100005344()
{
  return 1;
}

void *sub_100005364(const void *a1, size_t size)
{
  long long v4 = sub_1000037A4(size);

  return memcpy(v4, a1, size);
}

char *sub_1000053A8(const char *a1)
{
  for (size_t i = a1; ; a1 = i)
  {
    uint64_t result = strdup(a1);
    if (result) {
      break;
    }
    if (*__error() != 12)
    {
      if (*__error()) {
        sub_100005D68();
      }
    }
    sub_100005344();
  }
  return result;
}

char *sub_1000053FC(char *a1, ...)
{
  va_start(va, a1);
  int v3 = 0;
  while (1)
  {
    vasprintf(&v3, a1, va);
    uint64_t result = v3;
    if (v3) {
      break;
    }
    if (*__error() != 12)
    {
      if (*__error()) {
        sub_100005D68();
      }
    }
    sub_100005344();
  }
  return result;
}

uint64_t sub_100005470()
{
  long long v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  if ((_dyld_get_image_uuid() & 1) == 0)
  {
    long long v6 = 0;
    uint64_t v7 = 0;
  }
  if (_dyld_get_shared_cache_uuid())
  {
    _dyld_get_shared_cache_range();
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  _os_log_simple();
  bzero(&v6, 0x400uLL);
  int v0 = backtrace(&v6, 128);
  size_t v1 = backtrace_symbols(&v6, v0);
  if (v1)
  {
    size_t v2 = v1;
    if (v0 >= 1)
    {
      uint64_t v3 = v0;
      long long v4 = v1;
      do
      {
        if (!*v4) {
          break;
        }
        uint64_t v8 = 0;
        uint64_t v9 = 0;
        if ((_dyld_get_image_uuid() & 1) == 0)
        {
          uint64_t v8 = 0;
          uint64_t v9 = 0;
        }
        if (_dyld_get_shared_cache_uuid()) {
          _dyld_get_shared_cache_range();
        }
        ++v4;
        _os_log_simple();
        --v3;
      }
      while (v3);
    }
    free(v2);
  }
  uint64_t result = os_fault_with_payload();
  if (result)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    if ((_dyld_get_image_uuid() & 1) == 0)
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
    }
    if (_dyld_get_shared_cache_uuid()) {
      _dyld_get_shared_cache_range();
    }
    __error();
    __error();
    xpc_strerror();
    return _os_log_simple();
  }
  return result;
}

double xpc_binprefs_alloc()
{
  int v0 = sub_1000037A4(0x24uLL);
  double result = 0.0;
  *int v0 = 0u;
  v0[1] = 0u;
  *((_DWORD *)v0 + 8) = 0;
  return result;
}

uint64_t xpc_binprefs_add(uint64_t result, int a2, int a3)
{
  uint64_t v3 = *(unsigned int *)(result + 32);
  if (v3 >= 4) {
    return _os_assumes_log();
  }
  *(_DWORD *)(result + 4 * v3) = a2;
  *(_DWORD *)(result + 4 * (*(_DWORD *)(result + 32))++ + 16) = a3;
  return result;
}

uint64_t xpc_binprefs_set_psattr(cpu_type_t *a1, posix_spawnattr_t *a2)
{
  uint64_t result = posix_spawnattr_setarchpref_np(a2, a1[8], a1, a1 + 4, 0);
  if (result) {
    sub_100005D68();
  }
  return result;
}

uint64_t sub_10000576C(char *a1)
{
  size_t v2 = strrchr(a1, 47);
  if (!v2) {
    return 22;
  }
  uint64_t v3 = v2;
  char v4 = *v2;
  *size_t v2 = 0;
  LODWORD(result) = mkpath_np(a1, 0x1F6u);
  if (result == 17) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = result;
  }
  char *v3 = v4;
  return result;
}

uint64_t sub_1000057CC(const char *a1)
{
  if (byte_10000C100 == 1) {
    sub_100005D0C();
  }
  return 1;
}

void sub_100005828(int a1)
{
  long long v3 = 0u;
  long long v4 = 0u;
  *(_OWORD *)__str = 0u;
  long long v2 = 0u;
  snprintf(__str, 0x40uLL, "Could not create shell: code %d", a1);
  pthread_setname_np(__str);
  sub_100005D0C();
}

uint64_t sub_100005868(const char *a1, const char *a2)
{
  if (_os_alloc_once_table[2] != -1) {
    goto LABEL_20;
  }
  uint64_t v4 = _os_alloc_once_table[3];
  do
  {
    while (revoke("/dev/console") == -1)
    {
      __error();
      _os_assert_log();
      _os_crash();
      __break(1u);
LABEL_20:
      uint64_t v4 = _os_alloc_once();
    }
    int v5 = open(a1, 2);
    if (login_tty(v5) == -1)
    {
      close(v5);
      int v5 = -1;
    }
  }
  while (v5 == -1);
  if (a2)
  {
    size_t v6 = strlen(a2);
    if (write(v5, a2, v6) == -1) {
      goto LABEL_27;
    }
  }
  posix_spawnattr_t v15 = 0;
  if (posix_spawnattr_init(&v15))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_22;
  }
  if (posix_spawnattr_setflags(&v15, 16448))
  {
LABEL_22:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_23;
  }
  posix_spawn_file_actions_t v14 = 0;
  if (posix_spawn_file_actions_init(&v14))
  {
LABEL_23:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_24;
  }
  if (posix_spawn_file_actions_addinherit_np(&v14, 0))
  {
LABEL_24:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_25;
  }
  if (posix_spawn_file_actions_addinherit_np(&v14, 1))
  {
LABEL_25:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_26;
  }
  if (posix_spawn_file_actions_addinherit_np(&v14, 2))
  {
LABEL_26:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_27:
    __error();
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_28;
  }
  *(_OWORD *)__argv = off_100008758;
  *(_OWORD *)__envp = *(_OWORD *)off_100008768;
  long long v11 = *(_OWORD *)off_100008778;
  uint64_t v12 = 0;
  if ((*(unsigned char *)(v4 + 9) & 1) == 0) {
    goto LABEL_18;
  }
  if (!posix_spawnattr_setspecialport_np(&v15, *(_DWORD *)(v4 + 16), 4))
  {
    *((void *)&v11 + 1) = 0;
LABEL_18:
    pthread_setname_np(byte_10000C080);
    pid_t v9 = 0;
    int v7 = posix_spawn(&v9, "/bin/sh", &v14, &v15, __argv, __envp);
    sub_100005828(v7);
  }
LABEL_28:
  _os_assert_log();
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t sub_100005A9C()
{
  if (_dyld_get_shared_cache_uuid()) {
    _dyld_get_shared_cache_range();
  }
  _os_log_simple();
  cryptex_trampoline_upgrade_wait_options_create();
  cryptex_trampoline_upgrade_wait_options_set_cryptex_name();
  if (cryptex_trampoline_upgrade_wait())
  {
    _dyld_get_image_uuid();
    if (_dyld_get_shared_cache_uuid()) {
      _dyld_get_shared_cache_range();
    }
    xpc_strerror();
    _os_log_simple();
  }
  return cryptex_trampoline_upgrade_wait_options_destroy();
}

xpc_object_t sub_100005C0C(uint64_t a1, const char *a2, BOOL a3)
{
  if ((*(unsigned char *)(a1 + 236) & 0x80) != 0) {
    return 0;
  }
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "Executable", a2);
  xpc_dictionary_set_BOOL(v5, "SkipImmediatePoll", a3);
  return v5;
}

void *sub_100005C88(uint64_t a1, const char *a2, const char *a3)
{
  if ((*(unsigned char *)(a1 + 236) & 0x80) != 0) {
    return 0;
  }
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  size_t v6 = v5;
  if (a2) {
    xpc_dictionary_set_string(v5, "UserName", a2);
  }
  if (a3) {
    xpc_dictionary_set_string(v6, "GroupName", a3);
  }
  return v6;
}

void sub_100005D0C()
{
  mach_port_t v0 = mach_host_self();
  host_reboot(v0, 4096);
  __break(1u);
}

uint64_t sub_100005D28(int a1, void *buffer)
{
  if (proc_pidinfo(a1, 13, 1uLL, buffer, 64) == 64) {
    return 0;
  }
  else {
    return *__error();
  }
}

void sub_100005D68()
{
}

void sub_100005D84()
{
  qword_10000C030 = (uint64_t)"Configuration error: failed to fetch our own audit token";
  __break(1u);
}

void sub_100005DA4()
{
  qword_10000C030 = (uint64_t)"Configuration error: unreasonably large PID or execcnt";
  __break(1u);
}

void sub_100005DC4()
{
}

void sub_100005DE0()
{
}

void sub_100005DFC()
{
}

void sub_100005E18(int a1)
{
  sub_1000053FC("bootstrap port must lead to PID 1 [actual pid = %d]", a1);
  _os_crash();
  __break(1u);
}

void sub_100005E40()
{
}

uint64_t CEAcquireUnmanagedContext()
{
  return _CEAcquireUnmanagedContext();
}

uint64_t CESerializeWithOptions()
{
  return _CESerializeWithOptions();
}

uint64_t CESizeSerialization()
{
  return _CESizeSerialization();
}

uint64_t CEValidateWithOptions()
{
  return _CEValidateWithOptions();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _dyld_get_image_uuid()
{
  return __dyld_get_image_uuid();
}

uint64_t _dyld_get_shared_cache_range()
{
  return __dyld_get_shared_cache_range();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return __dyld_get_shared_cache_uuid();
}

uint64_t _os_alloc_once()
{
  return __os_alloc_once();
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

uint64_t _os_log_simple()
{
  return __os_log_simple();
}

uint64_t _xpc_fd_get_port()
{
  return __xpc_fd_get_port();
}

uint64_t _xpc_pipe_interface_routine()
{
  return __xpc_pipe_interface_routine();
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

uint64_t amfi_launch_constraint_set_spawnattr()
{
  return _amfi_launch_constraint_set_spawnattr();
}

int backtrace(void **a1, int a2)
{
  return _backtrace(a1, a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return _backtrace_symbols(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

int chdir(const char *a1)
{
  return _chdir(a1);
}

int close(int a1)
{
  return _close(a1);
}

uint64_t cryptex_trampoline_upgrade_wait()
{
  return _cryptex_trampoline_upgrade_wait();
}

uint64_t cryptex_trampoline_upgrade_wait_options_create()
{
  return _cryptex_trampoline_upgrade_wait_options_create();
}

uint64_t cryptex_trampoline_upgrade_wait_options_destroy()
{
  return _cryptex_trampoline_upgrade_wait_options_destroy();
}

uint64_t cryptex_trampoline_upgrade_wait_options_set_cryptex_name()
{
  return _cryptex_trampoline_upgrade_wait_options_set_cryptex_name();
}

uint64_t der_vm_CEType_from_context()
{
  return _der_vm_CEType_from_context();
}

uint64_t der_vm_BOOL_from_context()
{
  return _der_vm_BOOL_from_context();
}

uint64_t der_vm_context_is_valid()
{
  return _der_vm_context_is_valid();
}

uint64_t der_vm_data_from_context()
{
  return _der_vm_data_from_context();
}

uint64_t der_vm_execute()
{
  return _der_vm_execute();
}

uint64_t der_vm_integer_from_context()
{
  return _der_vm_integer_from_context();
}

uint64_t der_vm_iterate()
{
  return _der_vm_iterate();
}

uint64_t der_vm_string_from_context()
{
  return _der_vm_string_from_context();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

uint64_t dyld_image_header_containing_address()
{
  return _dyld_image_header_containing_address();
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

int getdtablesize(void)
{
  return _getdtablesize();
}

group *__cdecl getgrnam(const char *a1)
{
  return _getgrnam(a1);
}

pid_t getpid(void)
{
  return _getpid();
}

pid_t getppid(void)
{
  return _getppid();
}

const char *getprogname(void)
{
  return _getprogname();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return _getpwuid(a1);
}

int getrlimit(int a1, rlimit *a2)
{
  return _getrlimit(a1, a2);
}

kern_return_t host_reboot(host_priv_t host_priv, int options)
{
  return _host_reboot(host_priv, options);
}

int initgroups(const char *a1, int a2)
{
  return _initgroups(a1, a2);
}

int login_tty(int a1)
{
  return _login_tty(a1);
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

int mkpath_np(const char *path, mode_t omode)
{
  return _mkpath_np(path, omode);
}

uint64_t notify_set_options()
{
  return _notify_set_options();
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

uint64_t os_fault_with_payload()
{
  return _os_fault_with_payload();
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawn(a1, a2, a3, a4, __argv, __envp);
}

uint64_t posix_spawn_file_actions_add_fileportdup2_np()
{
  return _posix_spawn_file_actions_add_fileportdup2_np();
}

int posix_spawn_file_actions_addinherit_np(posix_spawn_file_actions_t *a1, int a2)
{
  return _posix_spawn_file_actions_addinherit_np(a1, a2);
}

int posix_spawn_file_actions_addopen(posix_spawn_file_actions_t *a1, int a2, const char *a3, int a4, mode_t a5)
{
  return _posix_spawn_file_actions_addopen(a1, a2, a3, a4, a5);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_init(a1);
}

uint64_t posix_spawnattr_disable_ptr_auth_a_keys_np()
{
  return _posix_spawnattr_disable_ptr_auth_a_keys_np();
}

int posix_spawnattr_getflags(const posix_spawnattr_t *a1, __int16 *a2)
{
  return _posix_spawnattr_getflags(a1, a2);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return _posix_spawnattr_init(a1);
}

uint64_t posix_spawnattr_set_crash_behavior_deadline_np()
{
  return _posix_spawnattr_set_crash_behavior_deadline_np();
}

uint64_t posix_spawnattr_set_crash_behavior_np()
{
  return _posix_spawnattr_set_crash_behavior_np();
}

uint64_t posix_spawnattr_set_crash_count_np()
{
  return _posix_spawnattr_set_crash_count_np();
}

uint64_t posix_spawnattr_set_darwin_role_np()
{
  return _posix_spawnattr_set_darwin_role_np();
}

uint64_t posix_spawnattr_set_filedesclimit_ext()
{
  return _posix_spawnattr_set_filedesclimit_ext();
}

uint64_t posix_spawnattr_set_kqworklooplimit_ext()
{
  return _posix_spawnattr_set_kqworklooplimit_ext();
}

uint64_t posix_spawnattr_set_launch_type_np()
{
  return _posix_spawnattr_set_launch_type_np();
}

uint64_t posix_spawnattr_set_max_addr_np()
{
  return _posix_spawnattr_set_max_addr_np();
}

uint64_t posix_spawnattr_set_portlimits_ext()
{
  return _posix_spawnattr_set_portlimits_ext();
}

int posix_spawnattr_set_qos_class_np(posix_spawnattr_t *__attr, qos_class_t __qos_class)
{
  return _posix_spawnattr_set_qos_class_np(__attr, __qos_class);
}

uint64_t posix_spawnattr_set_registered_ports_np()
{
  return _posix_spawnattr_set_registered_ports_np();
}

uint64_t posix_spawnattr_set_subsystem_root_path_np()
{
  return _posix_spawnattr_set_subsystem_root_path_np();
}

uint64_t posix_spawnattr_set_threadlimit_ext()
{
  return _posix_spawnattr_set_threadlimit_ext();
}

uint64_t posix_spawnattr_set_use_sec_transition_shims_np()
{
  return _posix_spawnattr_set_use_sec_transition_shims_np();
}

int posix_spawnattr_setarchpref_np(posix_spawnattr_t *a1, size_t a2, cpu_type_t *a3, cpu_subtype_t *a4, size_t *a5)
{
  return _posix_spawnattr_setarchpref_np(a1, a2, a3, a4, a5);
}

uint64_t posix_spawnattr_setcpumonitor()
{
  return _posix_spawnattr_setcpumonitor();
}

uint64_t posix_spawnattr_setcpumonitor_default()
{
  return _posix_spawnattr_setcpumonitor_default();
}

uint64_t posix_spawnattr_setdataless_iopolicy_np()
{
  return _posix_spawnattr_setdataless_iopolicy_np();
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return _posix_spawnattr_setflags(a1, a2);
}

uint64_t posix_spawnattr_setjetsam_ext()
{
  return _posix_spawnattr_setjetsam_ext();
}

uint64_t posix_spawnattr_setmacpolicyinfo_np()
{
  return _posix_spawnattr_setmacpolicyinfo_np();
}

uint64_t posix_spawnattr_setprocesstype_np()
{
  return _posix_spawnattr_setprocesstype_np();
}

int posix_spawnattr_setspecialport_np(posix_spawnattr_t *a1, mach_port_t a2, int a3)
{
  return _posix_spawnattr_setspecialport_np(a1, a2, a3);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int pthread_getname_np(pthread_t a1, char *a2, size_t a3)
{
  return _pthread_getname_np(a1, a2, a3);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int pthread_setname_np(const char *a1)
{
  return _pthread_setname_np(a1);
}

int revoke(const char *a1)
{
  return _revoke(a1);
}

uint64_t sandbox_extension_issue_file()
{
  return _sandbox_extension_issue_file();
}

uint64_t sandbox_spawnattrs_init()
{
  return _sandbox_spawnattrs_init();
}

uint64_t sandbox_spawnattrs_setcontainer()
{
  return _sandbox_spawnattrs_setcontainer();
}

uint64_t sandbox_spawnattrs_setprofilename()
{
  return _sandbox_spawnattrs_setprofilename();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
}

int setgid(gid_t a1)
{
  return _setgid(a1);
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return _setiopolicy_np(a1, a2, a3);
}

int setlogin(const char *a1)
{
  return _setlogin(a1);
}

int setrlimit(int a1, const rlimit *a2)
{
  return _setrlimit(a1, a2);
}

pid_t setsid(void)
{
  return _setsid();
}

int setuid(uid_t a1)
{
  return _setuid(a1);
}

uint64_t si_search_module_set_flags()
{
  return _si_search_module_set_flags();
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
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

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return _strndup(__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return _task_info(target_task, flavor, task_info_out, task_info_outCnt);
}

mode_t umask(mode_t a1)
{
  return _umask(a1);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return _vasprintf(a1, a2, a3);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return _xpc_array_create_empty();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_value(xarray, index);
}

void xpc_array_set_data(xpc_object_t xarray, size_t index, const void *bytes, size_t length)
{
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

uint64_t xpc_bundle_create()
{
  return _xpc_bundle_create();
}

uint64_t xpc_bundle_get_property()
{
  return _xpc_bundle_get_property();
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return _xpc_data_create(bytes, length);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return _xpc_data_get_bytes(xdata, buffer, off, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return _xpc_dictionary_create_empty();
}

uint64_t xpc_dictionary_get_audit_token()
{
  return _xpc_dictionary_get_audit_token();
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
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

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
}

uint64_t xpc_mach_send_get_right()
{
  return _xpc_mach_send_get_right();
}

uint64_t xpc_pipe_create_from_port()
{
  return _xpc_pipe_create_from_port();
}

uint64_t xpc_pipe_simpleroutine()
{
  return _xpc_pipe_simpleroutine();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

uint64_t xpc_set_event()
{
  return _xpc_set_event();
}

uint64_t xpc_strerror()
{
  return _xpc_strerror();
}

uint64_t xpc_string_create_no_copy()
{
  return _xpc_string_create_no_copy();
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return _xpc_string_get_length(xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return _xpc_type_get_name(type);
}