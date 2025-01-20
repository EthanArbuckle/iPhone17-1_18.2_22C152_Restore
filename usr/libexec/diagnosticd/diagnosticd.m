uint64_t sub_100004DC0(uint64_t a1)
{
  void v2[6];

  v2[0] = 0x83EF6AC599EFF6A0;
  v2[1] = a1 != 0;
  v2[2] = a1;
  memset(&v2[3], 0, 24);
  return sub_100005088((unsigned __int8 *)v2);
}

uint64_t sub_100004E0C(void *a1, const char *a2, uint64_t a3)
{
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a1, a2);
  if (dictionary)
  {
    v5 = dictionary;
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2000000000;
    uint64_t v18 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2000000000;
    v14[3] = 0;
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2000000000;
    uint64_t v13 = 0;
    uint64_t v13 = _os_trace_calloc();
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 0x40000000;
    applier[2] = sub_100005740;
    applier[3] = &unk_1000109D8;
    applier[7] = &v15;
    applier[8] = 20;
    applier[4] = a3;
    applier[5] = &v10;
    applier[6] = v14;
    if (xpc_dictionary_apply(v5, applier))
    {
      ++v16[3];
      uint64_t v6 = (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
    }
    else
    {
      uint64_t v6 = 0;
    }
    free((void *)v11[3]);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(&v15, 8);
    return v6;
  }
  else
  {
    v7 = *(uint64_t (**)(uint64_t, uint64_t, void, void))(a3 + 16);
    return v7(a3, 1, 0, 0);
  }
}

BOOL sub_100004FAC(id a1, unint64_t a2, oslogdarwin_streamprefsvalue_s *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = 0x2B8FCFC795D2A138;
    char v7 = 3;
    memset(v8, 0, sizeof(v8));
    v9 = a3;
    unint64_t v10 = a4;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    return sub_100005088((unsigned __int8 *)&v6);
  }
  else if (a2 == 1)
  {
    return sub_10000502C();
  }
  else
  {
    return 1;
  }
}

uint64_t sub_10000502C()
{
  v1[0] = 0;
  v1[1] = 0;
  uint64_t v2 = 0x2B8FCFC795D2A138;
  char v3 = 3;
  memset(v4, 0, sizeof(v4));
  v5 = v1;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  return sub_100005088((unsigned __int8 *)&v2);
}

uint64_t sub_100005088(unsigned __int8 *a1)
{
  if (qword_100014488 != -1) {
    dispatch_once(&qword_100014488, &stru_100010970);
  }
  if (!qword_100014480) {
    return 0;
  }
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  char v14 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 0x40000000;
  uint64_t v8 = sub_100005650;
  v9 = &unk_100010A00;
  unint64_t v10 = &v11;
  if (*(void *)a1 == 0x4E9FB3A19A8A7C1DLL || *(void *)a1 == 0x2B8FCFC795D2A138)
  {
    *(void *)&long long v15 = 0;
    *((void *)&v15 + 1) = &v15;
    long long v16 = 0x2000000000uLL;
    *(void *)&long long v33 = _NSConcreteStackBlock;
    *((void *)&v33 + 1) = 0x40000000;
    *(void *)&long long v34 = sub_10000CA08;
    *((void *)&v34 + 1) = &unk_100011020;
    *(void *)&long long v35 = &v15;
    sub_10000C754(a1 + 8, (uint64_t)&v33);
    _Block_object_dispose(&v15, 8);
  }
  uint64_t v20 = 0;
  long long v19 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v39 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  if (tb_client_connection_message_construct()) {
    goto LABEL_18;
  }
  tb_message_encode_u64();
  tb_message_encode_u64();
  uint64_t v3 = *(void *)a1;
  if (*(void *)a1 == 0x4E9FB3A19A8A7C1DLL || v3 == 0x2B8FCFC795D2A138)
  {
    uint64_t v4 = a1 + 8;
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2000000000;
    int v32 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2000000000;
    v28[3] = 0;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 0x40000000;
    v27[2] = sub_10000CA20;
    v27[3] = &unk_100011048;
    v27[4] = v28;
    sub_10000C754(v4, (uint64_t)v27);
    tb_message_encode_u64();
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 0x40000000;
    v23 = sub_10000CA38;
    v24 = &unk_100011070;
    v25 = &v29;
    v26 = &v15;
    sub_10000C754(v4, (uint64_t)&v21);
    LODWORD(v4) = *((_DWORD *)v30 + 6);
    _Block_object_dispose(v28, 8);
    _Block_object_dispose(&v29, 8);
    if (!v4)
    {
LABEL_16:
      tb_message_encode_BOOL();
      tb_message_complete();
      v27[0] = 0;
      if ((tb_connection_send_query() & 0xFFFFFFF7) == 0 && v27[0])
      {
        v21 = 0;
        uint64_t v22 = 0;
        tb_message_decode_u8();
        if (v21 == 1)
        {
          tb_message_decode_u64();
          uint64_t v6 = v22;
          if (v22 == 0xCBD9DC39909D106ALL || v22 == 0x4EF7D98DF3E71501) {
            goto LABEL_28;
          }
        }
        else if (!(_BYTE)v21)
        {
          uint64_t v6 = v22;
LABEL_28:
          v8((uint64_t)v7, (char)v21, v6);
          tb_client_connection_message_destruct();
          BOOL v2 = *((unsigned char *)v12 + 24) == 0;
          goto LABEL_19;
        }
      }
      tb_client_connection_message_destruct();
LABEL_18:
      BOOL v2 = 0;
LABEL_19:
      _Block_object_dispose(&v11, 8);
      return v2;
    }
    _os_crash();
    __break(1u);
  }
  else if (v3 == 0x83EF6AC599EFF6A0)
  {
    if (a1[8])
    {
      tb_message_encode_u8();
      tb_message_encode_u64();
    }
    else
    {
      tb_message_encode_u8();
    }
    goto LABEL_16;
  }
  printf("TB_FATAL: invalid value: unexpected case value, %llx (%s:%d)\n", v3, "/Library/Caches/com.apple.xbs/Binaries/libtrace_executables/install/TempContent/Objects/libtrace.build/diagnosticd.build/DerivedSources/OSLogDarwin_C.c", 1344);
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

void sub_100005650(uint64_t a1, char a2, uint64_t a3)
{
  if (a2 == 1)
  {
    if (a3 == 0xCBD9DC39909D106ALL)
    {
      strcpy(v4, "failed to set stream preferences in exclaves: invalid subsystem id");
    }
    else
    {
      if (a3 != 0x4EF7D98DF3E71501)
      {
LABEL_7:
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
        return;
      }
      strcpy(v4, "failed to set stream preferences in exclaves: full cache");
    }
    sub_100009B18((uint64_t)v4);
    goto LABEL_7;
  }
}

uint64_t sub_100005740(void *a1, const char *a2, xpc_object_t object)
{
  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_uint64 && xpc_get_type(object) != (xpc_type_t)&_xpc_type_int64) {
    return 0;
  }
  uint64_t v7 = *(void *)(*(void *)(a1[5] + 8) + 24);
  uint64_t v8 = *(void *)(a1[6] + 8);
  uint64_t v9 = *(void *)(v8 + 24);
  *(void *)(v8 + 24) = v9 + 1;
  uint64_t v10 = v7 + 16 * v9;
  if (a2)
  {
    uInt v11 = strlen(a2);
    LODWORD(a2) = crc32(0, (const Bytef *)a2, v11);
  }
  uint64_t value = xpc_uint64_get_value(object);
  *(_DWORD *)uint64_t v10 = a2;
  *(void *)(v10 + 8) = value;
  if (*(void *)(*(void *)(a1[6] + 8) + 24) == a1[8])
  {
    uint64_t v13 = a1[4];
    ++*(void *)(*(void *)(a1[7] + 8) + 24);
    uint64_t result = (*(uint64_t (**)(void))(v13 + 16))();
    if (!result) {
      return result;
    }
    *(void *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  return 1;
}

BOOL sub_10000585C(id a1, unint64_t a2, oslogdarwin_streamprefsvalue_s *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = 0x4E9FB3A19A8A7C1DLL;
    char v7 = 3;
    memset(v8, 0, sizeof(v8));
    uint64_t v9 = a3;
    unint64_t v10 = a4;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    return sub_100005088((unsigned __int8 *)&v6);
  }
  else if (a2 == 1)
  {
    return sub_1000058DC();
  }
  else
  {
    return 1;
  }
}

uint64_t sub_1000058DC()
{
  v1[0] = 0;
  v1[1] = 0;
  uint64_t v2 = 0x4E9FB3A19A8A7C1DLL;
  char v3 = 3;
  memset(v4, 0, sizeof(v4));
  v5 = v1;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  return sub_100005088((unsigned __int8 *)&v2);
}

void sub_100005938(id a1)
{
  if (&tb_client_connection_create)
  {
    v1 = (void *)_os_trace_calloc();
    if (exclaves_lookup_service())
    {
      strcpy(v4, "Exclaves log server not available");
    }
    else
    {
      uint64_t v2 = (void *)_os_trace_calloc();
      *uint64_t v2 = 0;
      v2[1] = 0;
      if (tb_endpoint_create_with_data())
      {
        tb_endpoint_set_interface_identifier();
        uint64_t v3 = tb_client_connection_create_with_endpoint();
        if (!tb_client_connection_activate())
        {
          void *v1 = v3;
          qword_100014480 = (uint64_t)v1;
          return;
        }
      }
      free(v2);
      strcpy(v4, "Failed to initialize config admin client");
    }
    sub_100009B18((uint64_t)v4);
    free(v1);
  }
}

void sub_100005A88(id a1, void *a2)
{
}

uint64_t sub_100005A90()
{
  if (&_lockdown_checkin_xpc)
  {
    lockdown_checkin_xpc();
    return lockdown_checkin_xpc();
  }
  return result;
}

void sub_100005AEC(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  v5 = malloc_type_calloc(1uLL, 0x30uLL, 0x10B0040C4D40EDAuLL);
  *(void *)v5 = a2;
  *((void *)v5 + 1) = sub_100006DF8(a3);
  *((void *)v5 + 4) = sub_10000782C;
  *((void *)v5 + 5) = sub_1000077E8;
  CFTypeRef cf = 0;
  unsigned int v11 = lockdown_receive_message();
  uint64_t TypeID = 0;
  if (v11) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = cf == 0;
  }
  if (v13)
  {
    if (v11 >= 2)
    {
      sub_100006ED0(0, (uint64_t)"secure_receive_message", 127, @"lockdown_receive_message returned error %x", v7, v8, v9, v10, v11);
LABEL_9:
      uint64_t TypeID = (uint64_t)cf;
    }
  }
  else
  {
    CFTypeID v14 = CFGetTypeID(0);
    uint64_t TypeID = CFDictionaryGetTypeID();
    if (v14 != TypeID) {
      goto LABEL_9;
    }
  }
  sub_100006ED0(TypeID, (uint64_t)"handle_os_trace_connection", 982, @"Failed to receive initial message from client %s", v7, v8, v9, v10, *((void *)v5 + 1));
  sub_100006FF8((uint64_t)v5, @"NoInitialMessage");
  lockdown_disconnect();
  free(*((void **)v5 + 1));
  free(v5);
}

void sub_10000674C(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  v5 = malloc_type_calloc(1uLL, 0x30uLL, 0x10B0040C4D40EDAuLL);
  void *v5 = a2;
  v5[1] = sub_100006DF8(a3);
  v5[4] = sub_1000068B0;
  v5[5] = sub_100006864;
  uint64_t v6 = funopen(v5, 0, (int (__cdecl *)(void *, const char *, int))sub_100006814, 0, 0);
  v5[2] = v6;
  setlinebuf(v6);

  sub_10000A014(0xFFFFFFFFLL, 140, 6, (uint64_t)v5);
}

uint64_t sub_100006814(uint64_t a1, uint64_t a2, int a3)
{
  if (*(unsigned char *)(a1 + 25)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = lockdown_send();
  if (result != a3) {
    *(unsigned char *)(a1 + 25) = 1;
  }
  return result;
}

void sub_100006864(uint64_t a1)
{
  lockdown_disconnect();
  fclose(*(FILE **)(a1 + 16));
  free(*(void **)(a1 + 8));

  free((void *)a1);
}

BOOL sub_1000068B0(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  long long v3 = 0u;
  if (!_os_activity_stream_entry_decode())
  {
    char v63 = 0;
    long long v62 = 0u;
    long long v61 = 0u;
    long long v60 = 0u;
    long long v59 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    *(_OWORD *)v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
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
    *(_OWORD *)__str = 0u;
    long long v16 = 0u;
    *(void *)uint64_t v12 = 0;
    uint64_t v13 = 0;
    *(void *)((char *)v14 + 6) = 0;
    v14[0] = 0;
    gethostname(v47, 0x100uLL);
    memcpy(__dst, "<unknown>", sizeof(__dst));
    proc_name(0, __dst, 0x400u);
    strrchr((char *)__dst, 47);
    snprintf(__str, 0x200uLL, "%s(<unknown>)");
  }
  return *(unsigned char *)(a1 + 25) == 0;
}

char *sub_100006DF8(const void *a1)
{
  if (!a1) {
    return strdup("<unknown>");
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID()) {
    return strdup("<unknown>");
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, kLockdownCheckinClientNameKey);
  if (!Value) {
    return strdup("<unknown>");
  }
  CFStringRef v4 = Value;
  CFTypeID v5 = CFGetTypeID(Value);
  if (v5 != CFStringGetTypeID()) {
    return strdup("<unknown>");
  }
  if (!CFStringGetCString(v4, buffer, 255, 0x8000100u)) {
    return strdup("<unknown>");
  }
  uint64_t result = strdup(buffer);
  if (!result) {
    return strdup("<unknown>");
  }
  return result;
}

void sub_100006ED0(uint64_t a1, uint64_t a2, uint64_t a3, const __CFString *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  bzero(buffer, 0x400uLL);
  CFStringRef v12 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, a4, &a9);
  CFStringRef v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s:%d %@", a2, a3, v12);
  CFRelease(v12);
  if (v13)
  {
    CFStringGetCString(v13, buffer, 1024, 0x8000100u);
    sub_100007194(3, "%s", buffer);
    CFRelease(v13);
  }
  else
  {
    sub_100007194(3, "Failed to construct log string");
  }
}

void sub_100006FF8(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v2 = a1;
    *(unsigned char *)(a1 + 24) = 1;
    CFStringRef v10 = @"Error";
    uint64_t v11 = a2;
    long long v3 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    LOBYTE(v2) = sub_1000070B8(v2, v3);

    if ((v2 & 1) == 0) {
      sub_100006ED0(v4, (uint64_t)"secure_send_error", 220, @"Could not send error response to host", v5, v6, v7, v8, v9);
    }
  }
}

uint64_t sub_1000070B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!a1)
  {
LABEL_7:
    uint64_t v4 = 0;
    goto LABEL_8;
  }
  uint64_t v4 = 1;
  if (!*(unsigned char *)(a1 + 25))
  {
    uint64_t v5 = lockdown_send();
    if (v5 == 1)
    {
      uint64_t v6 = lockdown_send_message();
      if (!v6)
      {
        uint64_t v4 = 1;
        goto LABEL_8;
      }
      sub_100006ED0(v6, (uint64_t)"secure_send_message", 186, @"Got error %x from lockdown_send_message", v7, v8, v9, v10, v6);
    }
    else
    {
      char v11 = v5;
      CFStringRef v12 = __error();
      long long v18 = strerror(*v12);
      sub_100006ED0((uint64_t)v18, (uint64_t)"secure_send_message", 180, @"Failed to send message type; lockdown_send returned %zd, expected %zu: %s",
        v13,
        v14,
        v15,
        v16,
        v11);
    }
    goto LABEL_7;
  }
LABEL_8:

  return v4;
}

uint64_t sub_100007194(uint64_t a1, char *__format, ...)
{
  va_start(va, __format);
  vsnprintf(__str, 0x800uLL, __format, va);
  return _simple_asl_log();
}

uint64_t sub_100007218(uint64_t a1, int a2)
{
  memset(&v48, 0, sizeof(v48));
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 25))
  {
    if (fcntl(a2, 50) == -1 || fstat(a2, &v48) == -1)
    {
      __error();
      _os_assumes_log();
      return *__error();
    }
    if (archive_read_disk_new())
    {
      if (archive_entry_new())
      {
        archive_entry_copy_pathname();
        archive_entry_copy_sourcepath();
        int disk_entry_from_file = archive_read_disk_entry_from_file();
        if (disk_entry_from_file)
        {
          uint64_t v2 = archive_errno();
          archive_error_string();
          uint64_t v44 = archive_errno();
          sub_100006ED0(v44, (uint64_t)"create_archive_block_invoke_2", 910, @"archive_read_disk_entry_from_file() returned %d: %s (%d)", v14, v15, v16, v17, disk_entry_from_file);
        }
        else
        {
          int v18 = archive_write_header();
          if (v18)
          {
            char v19 = v18;
            uint64_t v2 = archive_errno();
            archive_error_string();
            uint64_t v45 = archive_errno();
            sub_100006ED0(v45, (uint64_t)"create_archive_block_invoke_2", 918, @"archive_write_header() returned %d: %s (%d)", v20, v21, v22, v23, v19);
          }
          else
          {
            if ((v48.st_mode & 0xF000) == 0x4000) {
              goto LABEL_22;
            }
            while (1)
            {
              ssize_t v25 = read(a2, *(void **)(a1 + 48), 0x8000uLL);
              char v26 = v25;
              if (v25 < 1) {
                break;
              }
              int v27 = archive_write_data();
              if (v27 < 0)
              {
                uint64_t v2 = archive_errno();
                archive_error_string();
                uint64_t v46 = archive_errno();
                sub_100006ED0(v46, (uint64_t)"create_archive_block_invoke_2", 929, @"archive_write_data() returned %d: %s (%d)", v28, v29, v30, v31, v27);
                goto LABEL_14;
              }
            }
            if (v25 < 0)
            {
              uint64_t v2 = *__error();
              long long v38 = __error();
              strerror(*v38);
              long long v39 = __error();
              sub_100006ED0((uint64_t)v39, (uint64_t)"create_archive_block_invoke_2", 937, @"read() returned %zd: %s (%d)", v40, v41, v42, v43, v26);
            }
            else
            {
LABEL_22:
              int v32 = archive_write_finish_entry();
              if (v32)
              {
                char v33 = v32;
                uint64_t v2 = archive_errno();
                archive_error_string();
                uint64_t v47 = archive_errno();
                sub_100006ED0(v47, (uint64_t)"create_archive_block_invoke_2", 946, @"archive_write_finish_entry() returned %d: %s (%d)", v34, v35, v36, v37, v33);
              }
              else
              {
                uint64_t v2 = 0;
              }
            }
          }
        }
        goto LABEL_14;
      }
      sub_100006ED0(0, (uint64_t)"create_archive_block_invoke_2", 900, @"archive_entry_new() failed", v9, v10, v11, v12, (char)v49);
    }
    else
    {
      sub_100006ED0(0, (uint64_t)"create_archive_block_invoke_2", 893, @"archive_read_disk_new() failed", v5, v6, v7, v8, (char)v49);
    }
    uint64_t v2 = 12;
LABEL_14:
    archive_read_free();
    archive_entry_free();
    return v2;
  }
  return 32;
}

void sub_10000754C(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v1 = a1;
    CFStringRef v9 = @"Status";
    CFStringRef v10 = @"RequestSuccessful";
    uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    LOBYTE(v1) = sub_1000070B8(v1, v2);

    if ((v1 & 1) == 0) {
      sub_100006ED0(v3, (uint64_t)"secure_send_status", 205, @"Could not send error response to host", v4, v5, v6, v7, v8);
    }
  }
}

void sub_10000760C(id a1, const char *a2)
{
  sub_100006ED0((uint64_t)a1, (uint64_t)"create_archive_block_invoke", 867, @"%s", v2, v3, v4, v5, (char)a2);
}

uint64_t sub_100007648(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(unsigned char *)(a2 + 25))
  {
    strerror(32);
LABEL_5:
    archive_set_error();
    return -1;
  }
  if (a4 >> 31)
  {
    sub_100006ED0(a1, (uint64_t)"_archive_write", 758, @"Cannot send buffer > INT32_MAX: %zu", a5, a6, a7, a8, a4);
    strerror(22);
    goto LABEL_5;
  }
  uint64_t v13 = lockdown_send();
  if (v13 == 5)
  {
    unint64_t v9 = 0;
    if (!a4) {
      return v9;
    }
    while (1)
    {
      uint64_t v14 = lockdown_send();
      char v15 = v14;
      if (v14 < 0) {
        break;
      }
      v9 += v14;
      a3 += v14;
      if (v9 >= a4) {
        return v9;
      }
    }
    int v17 = *__error();
    char v26 = strerror(v17);
    sub_100006ED0((uint64_t)v26, (uint64_t)"_archive_write", 781, @"lockdown_send returned %zd: %s", v22, v23, v24, v25, v15);
  }
  else
  {
    char v16 = v13;
    int v17 = *__error();
    int v27 = strerror(v17);
    sub_100006ED0((uint64_t)v27, (uint64_t)"_archive_write", 771, @"lockdown_send returned %zd, expected %zu: %s", v18, v19, v20, v21, v16);
  }
  strerror(v17);
  archive_set_error();
  *(unsigned char *)(a2 + 25) = 1;
  return -1;
}

void sub_1000077E8(void **a1)
{
  lockdown_disconnect();
  free(a1[1]);

  free(a1);
}

BOOL sub_10000782C(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v22 = 0u;
  long long v23 = 0u;
  *(_OWORD *)uint64_t v20 = 0u;
  *(_OWORD *)uint64_t v21 = 0u;
  *(_OWORD *)uint64_t v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  *(_OWORD *)uint64_t v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  if (!_os_activity_stream_entry_decode())
  {
    v24.tv_sec = 0;
    *(void *)&v24.tv_usec = 0;
    unint64_t v9 = v14[1];
    if (v14[1]) {
      unint64_t v9 = (char *)strlen(v14[1]);
    }
    sub_100006ED0((uint64_t)v9, (uint64_t)"serialize_and_send_stream_entry", 523, @"Unknown os_activity_stream_type type %d", v5, v6, v7, v8, 0);
    free(0);
    free(0);
  }
  BOOL v10 = *(unsigned char *)(a1 + 25) == 0;

  return v10;
}

id sub_100008048(void *a1, uint64_t a2)
{
  id v2 = a1;
  id v3 = objc_opt_new();
  uint64_t v4 = [v2 objectForKeyedSubscript:@"logicalExp"];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"operator"];
    if (v6
      && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
       || (unint64_t)[v6 unsignedIntegerValue] > 2))
    {
      id v17 = 0;
    }
    else
    {
      char v33 = v3;
      uint64_t v7 = [v5 objectForKeyedSubscript:@"subfilters"];
      if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v8 = objc_opt_new();
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v9 = v7;
        id v10 = [v9 countByEnumeratingWithState:&v44 objects:v49 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v45;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v45 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v44 + 1) + 8 * i);
              if (v14)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v15 = (void *)sub_100008048(v14, a2);
                  if (v15) {
                    [v8 addObject:v15];
                  }
                }
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v44 objects:v49 count:16];
          }
          while (v11);
        }

        if ([v8 count])
        {
          long long v16 = objc_opt_new();
          [v16 setObject:v8 forKeyedSubscript:@"subfilters"];
          if (v6) {
            [v16 setObject:v6 forKeyedSubscript:@"operator"];
          }
          [v33 setObject:v16 forKeyedSubscript:@"logicalExp"];
          id v17 = v33;
        }
        else
        {
          id v17 = 0;
        }
      }
      else
      {
        id v17 = 0;
      }

      id v3 = v33;
    }
  }
  else
  {
    uint64_t v34 = v3;
    uint64_t v18 = 0;
    id v35 = v2;
    do
    {
      long long v19 = off_100010B00[v18];
      uint64_t v20 = [v2 objectForKeyedSubscript:v19];
      if (v20)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v37 = v19;
          uint64_t v38 = v18;
          uint64_t v21 = objc_opt_new();
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          uint64_t v36 = v20;
          id v22 = v20;
          id v23 = [v22 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v41;
            do
            {
              for (j = 0; j != v24; j = (char *)j + 1)
              {
                if (*(void *)v41 != v25) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v27 = *(void *)(*((void *)&v40 + 1) + 8 * (void)j);
                if (v27)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v28 = [v22 objectForKeyedSubscript:v27];
                    uint64_t v29 = (void *)v28;
                    if (v28)
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass()) {
                        uint64_t v28 = (uint64_t)[v29 unsignedLongLongValue];
                      }
                      else {
                        uint64_t v28 = 0;
                      }
                    }
                    uint64_t v30 = +[NSNumber numberWithUnsignedLongLong:v28 | a2];
                    [v21 setObject:v30 forKeyedSubscript:v27];
                  }
                }
              }
              id v24 = [v22 countByEnumeratingWithState:&v40 objects:v48 count:16];
            }
            while (v24);
          }

          long long v19 = v37;
          if ([v21 count]) {
            [v34 setObject:v21 forKeyedSubscript:v37];
          }

          id v2 = v35;
          uint64_t v20 = v36;
          uint64_t v18 = v38;
        }
      }

      ++v18;
    }
    while (v18 != 6);
    id v3 = v34;
    if ([v34 count]) {
      uint64_t v31 = v34;
    }
    else {
      uint64_t v31 = 0;
    }
    id v17 = v31;
    uint64_t v5 = 0;
  }

  return v17;
}

uint64_t sub_1000084E4(void *a1, void *a2, uint64_t a3, uint64_t a4, int8x16_t *a5, uint64_t a6)
{
  id v11 = a1;
  id v12 = a2;
  uint64_t v14 = [v11 objectForKeyedSubscript:@"logicalExp"];
  if (!v14)
  {
    char v19 = sub_1000087F0(v11, v12, a3, a4, a5, a6);
    goto LABEL_41;
  }
  id v15 = v12;
  int v32 = [v14 objectForKeyedSubscript:@"subfilters"];
  if (![v32 count]) {
    goto LABEL_34;
  }
  id v29 = v12;
  long long v16 = [v14 objectForKey:@"operator"];
  id v17 = v16;
  if (v16) {
    uint64_t v18 = (uint64_t)[v16 unsignedIntegerValue];
  }
  else {
    uint64_t v18 = 2;
  }
  id v30 = v11;
  uint64_t v31 = v14;
  uint64_t v28 = v13;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v32;
  id v20 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (!v20)
  {
    char v33 = 0;
    char v34 = 1;
    goto LABEL_31;
  }
  id v21 = v20;
  uint64_t v22 = *(void *)v38;
  if (a5) {
    id v23 = &v36;
  }
  else {
    id v23 = 0;
  }
  char v33 = 0;
  char v34 = 1;
  while (2)
  {
    for (i = 0; i != v21; i = (char *)i + 1)
    {
      if (*(void *)v38 != v22) {
        objc_enumerationMutation(obj);
      }
      uint64_t v25 = *(void *)(*((void *)&v37 + 1) + 8 * i);
      int8x16_t v36 = 0uLL;
      char v26 = sub_1000084E4(v25, v15, a3, a4, v23, a6);
      switch(v18)
      {
        case 1:
          if (a5)
          {
            v34 &= v26;
LABEL_23:
            *a5 = vorrq_s8(*a5, v36);
            continue;
          }
          if (v26) {
            continue;
          }
          char v19 = 0;
LABEL_39:
          id v12 = v29;
          id v11 = v30;
          long long v13 = v28;
          uint64_t v14 = v31;

          goto LABEL_40;
        case 2:
          if (a5)
          {
            v33 |= v26;
            goto LABEL_23;
          }
          if ((v26 & 1) == 0) {
            continue;
          }
          char v19 = 1;
          goto LABEL_39;
        case 0:
          if (a5) {
            *a5 = vorrq_s8(*a5, vextq_s8(v36, v36, 8uLL));
          }
          char v19 = v26 ^ 1;
          goto LABEL_39;
      }
    }
    id v21 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v21) {
      continue;
    }
    break;
  }
LABEL_31:

  uint64_t v14 = v31;
  if (v18)
  {
    id v12 = v29;
    id v11 = v30;
    long long v13 = v28;
    char v19 = v34;
    if (v18 != 1)
    {
      char v19 = v33;
      if (v18 != 2) {
LABEL_34:
      }
        char v19 = 0;
    }
  }
  else
  {
    char v19 = 0;
    id v12 = v29;
    id v11 = v30;
    long long v13 = v28;
  }
LABEL_40:

LABEL_41:

  return v19 & 1;
}

uint64_t sub_1000087F0(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, int a6)
{
  id v10 = a1;
  id v11 = a2;
  id v90 = v10;
  xpc_object_t xdict = v11;
  if (a3 == -1)
  {
    LOBYTE(v26) = 0;
  }
  else
  {
    id v12 = [v10 objectForKeyedSubscript:@"pid"];
    if (v12)
    {
      long long v13 = +[NSNumber numberWithInt:a3];
      uint64_t v14 = [v13 stringValue];

      if (a5)
      {
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        v93 = v12;
        id v15 = v12;
        id v16 = [v15 countByEnumeratingWithState:&v119 objects:v128 count:16];
        if (v16)
        {
          id v17 = v16;
          char v18 = 0;
          uint64_t v19 = *(void *)v120;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v120 != v19) {
                objc_enumerationMutation(v15);
              }
              uint64_t v21 = *(void *)(*((void *)&v119 + 1) + 8 * i);
              uint64_t v22 = [v15 objectForKeyedSubscript:v21];
              unsigned int v23 = [v14 isEqualToString:v21];
              unint64_t v24 = (unint64_t)[v22 unsignedLongLongValue];
              if (v23) {
                uint64_t v25 = 0;
              }
              else {
                uint64_t v25 = 1;
              }
              if (v23) {
                char v18 = 1;
              }
              a5[v25] |= v24;
            }
            id v17 = [v15 countByEnumeratingWithState:&v119 objects:v128 count:16];
          }
          while (v17);
        }
        else
        {
          char v18 = 0;
        }

        id v11 = xdict;
        id v12 = v93;
        a4 = a4;
      }
      else
      {
        uint64_t v27 = [v12 objectForKeyedSubscript:v14];

        if (v27)
        {

          uint64_t v26 = 1;
          goto LABEL_114;
        }
        char v18 = 0;
      }

      id v10 = v90;
    }
    else
    {
      char v18 = 0;
    }

    LOBYTE(v26) = v18 & 1;
  }
  if (a4 != -1)
  {
    uint64_t v28 = [v10 objectForKeyedSubscript:@"uid"];
    if (v28)
    {
      id v29 = +[NSNumber numberWithUnsignedInt:a4];
      id v30 = [v29 stringValue];

      if (a5)
      {
        long long v117 = 0u;
        long long v118 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        v96 = v28;
        id v31 = v28;
        id v32 = [v31 countByEnumeratingWithState:&v115 objects:v127 count:16];
        if (v32)
        {
          id v33 = v32;
          uint64_t v34 = *(void *)v116;
          do
          {
            for (j = 0; j != v33; j = (char *)j + 1)
            {
              if (*(void *)v116 != v34) {
                objc_enumerationMutation(v31);
              }
              uint64_t v36 = *(void *)(*((void *)&v115 + 1) + 8 * (void)j);
              long long v37 = [v31 objectForKeyedSubscript:v36];
              unsigned int v38 = [v30 isEqualToString:v36];
              unint64_t v39 = (unint64_t)[v37 unsignedLongLongValue];
              if (v38) {
                uint64_t v40 = 0;
              }
              else {
                uint64_t v40 = 1;
              }
              LOBYTE(v26) = v38 | v26;
              a5[v40] |= v39;
            }
            id v33 = [v31 countByEnumeratingWithState:&v115 objects:v127 count:16];
          }
          while (v33);
        }

        id v10 = v90;
        id v11 = xdict;
        uint64_t v28 = v96;
      }
      else
      {
        v86 = [v28 objectForKeyedSubscript:v30];

        if (v86)
        {

          uint64_t v26 = 1;
          goto LABEL_114;
        }
      }
    }
  }
  string = (char *)xpc_dictionary_get_string(v11, "procpath");
  long long v42 = string;
  if (string) {
    string = strrchr(string, 47);
  }
  v94 = v42;
  if (string) {
    long long v43 = string + 1;
  }
  else {
    long long v43 = v42;
  }
  long long v44 = [v10 objectForKeyedSubscript:@"process"];
  v89 = v44;
  if (v44)
  {
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    id v45 = v44;
    id v46 = [v45 countByEnumeratingWithState:&v111 objects:v126 count:16];
    if (!v46) {
      goto LABEL_60;
    }
    id v47 = v46;
    uint64_t v48 = *(void *)v112;
    while (1)
    {
      for (k = 0; k != v47; k = (char *)k + 1)
      {
        if (*(void *)v112 != v48) {
          objc_enumerationMutation(v45);
        }
        long long v50 = *(void **)(*((void *)&v111 + 1) + 8 * (void)k);
        long long v51 = v45;
        long long v52 = [v45 objectForKeyedSubscript:v50];
        unint64_t v53 = (unint64_t)[v52 unsignedLongLongValue];

        if (v43 && sub_1000090D8(v43, (char *)[v50 UTF8String], v53, a6))
        {
          uint64_t v26 = 1;
          long long v54 = a5;
          if (!a5)
          {
            id v10 = v90;
            id v11 = xdict;
            goto LABEL_113;
          }
        }
        else
        {
          long long v54 = a5 + 1;
          if (!a5) {
            goto LABEL_58;
          }
        }
        *v54 |= v53;
LABEL_58:
        id v45 = v51;
      }
      id v47 = [v51 countByEnumeratingWithState:&v111 objects:v126 count:16];
      if (!v47)
      {
LABEL_60:

        id v10 = v90;
        break;
      }
    }
  }
  long long v55 = [v10 objectForKeyedSubscript:@"processImagePath"];
  long long v51 = v55;
  id v11 = xdict;
  v88 = v55;
  if (!v55) {
    goto LABEL_76;
  }
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v56 = v55;
  id v57 = [v56 countByEnumeratingWithState:&v107 objects:v125 count:16];
  if (!v57) {
    goto LABEL_75;
  }
  id v58 = v57;
  uint64_t v59 = *(void *)v108;
  v97 = v56;
  do
  {
    for (m = 0; m != v58; m = (char *)m + 1)
    {
      if (*(void *)v108 != v59) {
        objc_enumerationMutation(v56);
      }
      long long v61 = *(void **)(*((void *)&v107 + 1) + 8 * (void)m);
      long long v62 = [v56 objectForKeyedSubscript:v61, v88, v89];
      unint64_t v63 = (unint64_t)[v62 unsignedLongLongValue];

      if (v94 && sub_1000090D8(v94, (char *)[v61 UTF8String], v63, a6))
      {
        uint64_t v26 = 1;
        v64 = a5;
        if (!a5)
        {
          id v10 = v90;
          long long v51 = v88;
          goto LABEL_112;
        }
      }
      else
      {
        v64 = a5 + 1;
        if (!a5) {
          goto LABEL_73;
        }
      }
      *v64 |= v63;
LABEL_73:
      id v56 = v97;
    }
    id v58 = [v97 countByEnumeratingWithState:&v107 objects:v125 count:16];
  }
  while (v58);
LABEL_75:

  id v10 = v90;
  long long v51 = v88;
LABEL_76:
  v65 = (char *)xpc_dictionary_get_string(xdict, "subsystem");
  v66 = [v10 objectForKeyedSubscript:@"subsystem"];
  v97 = v66;
  if (!v66) {
    goto LABEL_91;
  }
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v67 = v66;
  id v68 = [v67 countByEnumeratingWithState:&v103 objects:v124 count:16];
  if (!v68) {
    goto LABEL_90;
  }
  id v69 = v68;
  uint64_t v70 = *(void *)v104;
  v95 = v67;
  while (2)
  {
    v71 = 0;
    while (2)
    {
      if (*(void *)v104 != v70) {
        objc_enumerationMutation(v67);
      }
      v72 = *(void **)(*((void *)&v103 + 1) + 8 * (void)v71);
      v73 = [v67 objectForKeyedSubscript:v72, v88];
      unint64_t v74 = (unint64_t)[v73 unsignedLongLongValue];

      if (v65 && sub_1000090D8(v65, (char *)[v72 UTF8String], v74, a6))
      {
        uint64_t v26 = 1;
        v75 = a5;
        if (!a5)
        {
          id v10 = v90;
          id v11 = xdict;
LABEL_110:
          long long v51 = v88;
          goto LABEL_111;
        }
LABEL_87:
        *v75 |= v74;
      }
      else
      {
        v75 = a5 + 1;
        if (a5) {
          goto LABEL_87;
        }
      }
      v71 = (char *)v71 + 1;
      id v67 = v95;
      if (v69 != v71) {
        continue;
      }
      break;
    }
    id v69 = [v95 countByEnumeratingWithState:&v103 objects:v124 count:16];
    if (v69) {
      continue;
    }
    break;
  }
LABEL_90:

  id v10 = v90;
  id v11 = xdict;
  long long v51 = v88;
LABEL_91:
  v76 = (char *)xpc_dictionary_get_string(v11, "category");
  v77 = [v10 objectForKeyedSubscript:@"category"];
  v95 = v77;
  if (!v77) {
    goto LABEL_106;
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v78 = v77;
  id v79 = [v78 countByEnumeratingWithState:&v99 objects:v123 count:16];
  if (!v79) {
    goto LABEL_105;
  }
  id v80 = v79;
  xpc_object_t xdicta = *(xpc_object_t *)v100;
  while (2)
  {
    uint64_t v81 = 0;
    while (2)
    {
      if (*(xpc_object_t *)v100 != xdicta) {
        objc_enumerationMutation(v78);
      }
      v82 = *(void **)(*((void *)&v99 + 1) + 8 * v81);
      v83 = [v78 objectForKeyedSubscript:v82, v88];
      unint64_t v84 = (unint64_t)[v83 unsignedLongLongValue];

      if (v76 && sub_1000090D8(v76, (char *)[v82 UTF8String], v84, a6))
      {
        if (!a5)
        {

          uint64_t v26 = 1;
          id v10 = v90;
          goto LABEL_110;
        }
        LOBYTE(v26) = 1;
        v85 = a5;
LABEL_102:
        *v85 |= v84;
      }
      else
      {
        v85 = a5 + 1;
        if (a5) {
          goto LABEL_102;
        }
      }
      if (v80 != (id)++v81) {
        continue;
      }
      break;
    }
    id v80 = [v78 countByEnumeratingWithState:&v99 objects:v123 count:16];
    if (v80) {
      continue;
    }
    break;
  }
LABEL_105:

  id v10 = v90;
  long long v51 = v88;
LABEL_106:
  uint64_t v26 = (a5 != 0) & v26;
LABEL_111:

LABEL_112:
LABEL_113:

LABEL_114:
  return v26;
}

BOOL sub_1000090D8(char *__s1, char *__s2, char a3, int a4)
{
  uint64_t v4 = __s2;
  uint64_t v5 = __s1;
  if (a4)
  {
    if (strcasestr(__s1, __s2)) {
      return 1;
    }
    __s1 = v4;
    __s2 = v5;
  }
  else if ((a3 & 1) == 0)
  {
    return strcmp(__s1, __s2) == 0;
  }
  return strcasestr(__s1, __s2) != 0;
}

void sub_100009148(void *a1, uint64_t a2, int a3)
{
  id v5 = a1;
  uint64_t v6 = &StreamContext__metaData;
  uint64_t v7 = (void *)qword_100014490;
  if (!qword_100014490)
  {
    uint64_t v8 = objc_opt_new();
    id v9 = (void *)qword_100014490;
    qword_100014490 = v8;

    uint64_t v7 = (void *)qword_100014490;
    if (!qword_100014490)
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
  }
  uint64_t v10 = (a3 << 16) | (unint64_t)(a2 << 32);
  if (v5)
  {
    id v11 = [v7 objectForKeyedSubscript:@"logicalExp"];
    if (v11)
    {
      id v12 = sub_100008048(v5, v10);
      long long v13 = [v11 objectForKey:@"operator"];
      if (!v13 || (v14 = v13, id v15 = [v13 unsignedIntegerValue], v14, v15 == (id)2))
      {
        id v16 = [v11 objectForKeyedSubscript:@"subfilters"];
        id v17 = [v12 objectForKeyedSubscript:@"logicalExp"];
        char v18 = v17;
        if (v17
          && (([v17 objectForKey:@"operator"],
               (uint64_t v19 = objc_claimAutoreleasedReturnValue()) == 0)
           || (id v20 = v19, v21 = [v19 unsignedIntegerValue], v20, v21 == (id)2)))
        {
          uint64_t v22 = [v18 objectForKeyedSubscript:@"subfilters"];
          unsigned int v23 = [v16 arrayByAddingObjectsFromArray:v22];
          [v11 setObject:v23 forKeyedSubscript:@"subfilters"];
        }
        else
        {
          uint64_t v22 = [v16 arrayByAddingObject:v12];
          [v11 setObject:v22 forKeyedSubscript:@"subfilters"];
        }

        goto LABEL_20;
      }
LABEL_14:
      id v16 = [(id)qword_100014490 objectForKeyedSubscript:@"global"];
      [(id)qword_100014490 setObject:0 forKeyedSubscript:@"global"];
      if ([(id)qword_100014490 count])
      {
        uint64_t v27 = objc_opt_new();
        uint64_t v28 = objc_opt_new();
        [v27 setObject:v28 forKeyedSubscript:@"logicalExp"];
        v55[0] = qword_100014490;
        v55[1] = v12;
        id v29 = +[NSArray arrayWithObjects:v55 count:2];
        [v28 setObject:v29 forKeyedSubscript:@"subfilters"];

        id v30 = (void *)qword_100014490;
        qword_100014490 = (uint64_t)v27;
      }
      else
      {
        objc_storeStrong((id *)&qword_100014490, v12);
      }
      [(id)qword_100014490 setObject:v16 forKeyedSubscript:@"global"];
LABEL_20:

      goto LABEL_21;
    }
    uint64_t v26 = [v5 objectForKeyedSubscript:@"logicalExp"];

    if (v26)
    {
      id v12 = sub_100008048(v5, v10);
      goto LABEL_14;
    }
    uint64_t v31 = 0;
    id v46 = v5;
    do
    {
      id v32 = off_100010B00[v31];
      id v33 = [v5 objectForKeyedSubscript:v32];
      if (v33)
      {
        uint64_t v49 = v31;
        uint64_t v34 = [v6[16].ivar_lyt objectForKeyedSubscript:v32];
        if (!v34)
        {
          uint64_t v34 = objc_opt_new();
          [v6[16].ivar_lyt setObject:v34 forKeyedSubscript:v32];
        }
        id v47 = v33;
        uint64_t v48 = v32;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v35 = v33;
        id v36 = [v35 countByEnumeratingWithState:&v50 objects:v54 count:16];
        if (v36)
        {
          id v37 = v36;
          uint64_t v38 = *(void *)v51;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(void *)v51 != v38) {
                objc_enumerationMutation(v35);
              }
              uint64_t v40 = *(void *)(*((void *)&v50 + 1) + 8 * i);
              long long v41 = [v35 objectForKeyedSubscript:v40];
              unint64_t v42 = (unint64_t)[v41 unsignedLongLongValue];

              long long v43 = [v34 objectForKeyedSubscript:v40];
              unint64_t v44 = (unint64_t)[v43 unsignedLongLongValue];

              id v45 = +[NSNumber numberWithUnsignedLongLong:v42 | v44 | v10];
              [v34 setObject:v45 forKeyedSubscript:v40];
            }
            id v37 = [v35 countByEnumeratingWithState:&v50 objects:v54 count:16];
          }
          while (v37);
        }

        id v11 = 0;
        id v5 = v46;
        uint64_t v6 = &StreamContext__metaData;
        id v32 = v48;
        uint64_t v31 = v49;
        id v33 = v47;
      }

      ++v31;
    }
    while (v31 != 6);
  }
  else
  {
    unint64_t v24 = [v7 objectForKeyedSubscript:@"global"];
    unint64_t v25 = (unint64_t)[v24 unsignedLongLongValue];

    id v11 = +[NSNumber numberWithUnsignedLongLong:v25 | v10];
    [(id)qword_100014490 setObject:v11 forKeyedSubscript:@"global"];
  }
LABEL_21:
}

void sub_100009644()
{
  id v0 = (id)qword_100014490;
  if (qword_100014490)
  {
    id v0 = [(id)qword_100014490 count];
    if (v0)
    {
      id v1 = [(id)qword_100014490 description];
      id v2 = (const char *)[v1 UTF8String];
      sub_100009A7C((uint64_t)v2, "Posting stream filter: \"%s\"", v2);

      id v3 = +[NSPropertyListSerialization dataWithPropertyList:qword_100014490 format:200 options:0 error:0];
      uint64_t v4 = (const char *)_os_trace_prefsdir_path();
      snprintf((char *)__str, 0x400uLL, "%s/%s.plist", v4, "com.apple.diagnosticd.filter");
      id v5 = (const char *)_os_trace_prefsdir_path();
      snprintf((char *)path, 0x400uLL, "%s/%s.XXXXXXXX", v5, "com.apple.diagnosticd.filter");
      if (_os_trace_device_formatted_for_content_protection()) {
        int v6 = mkstemp_dprotected_np((char *)path, 4, 0);
      }
      else {
        int v6 = mkstemp((char *)path);
      }
      int v8 = v6;
      if (v6 != -1)
      {
        if (fchmod(v6, 0x1A4u) == -1
          || (id v9 = v3,
              [v9 bytes],
              [v9 length],
              _os_trace_write() == -1)
          || fsync(v8) == -1)
        {
          __error();
          _os_assumes_log();
          if (close(v8) != -1)
          {
LABEL_38:
            unlink((const char *)path);
            unlink((const char *)__str);
            goto LABEL_39;
          }
          unint64_t v14 = *__error();
          uint64_t v15 = *__error();
          if (v14 == 9)
          {
            qword_100014440 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
            qword_100014470 = v15;
            __break(1u);
            goto LABEL_29;
          }
LABEL_37:
          _os_assumes_log();
          goto LABEL_38;
        }
        if (close(v8) == -1)
        {
          int v18 = *__error();
          uint64_t v19 = *__error();
          if (v18 == 9)
          {
            qword_100014440 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
            qword_100014470 = v19;
            __break(1u);
            return;
          }
          _os_assumes_log();
          __error();
          _os_assumes_log();
        }
        rename(path, __str, v10);
        if (v11 != -1)
        {
          id v12 = v9;
          [v12 bytes];
          [v12 length];
          if (qword_100014488 != -1) {
            dispatch_once(&qword_100014488, &stru_100010970);
          }
          if (!qword_100014480) {
            goto LABEL_39;
          }
          long long v13 = (void *)xpc_create_from_plist();
          if (!v13) {
            goto LABEL_39;
          }
          unint64_t v14 = (unint64_t)v13;
          if (xpc_get_type(v13) != (xpc_type_t)&_xpc_type_dictionary) {
            goto LABEL_25;
          }
LABEL_29:
          uint64_t value = xpc_dictionary_get_value((xpc_object_t)v14, "global");
          if (value)
          {
            id v17 = value;
            if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_uint64
              && xpc_get_type(v17) != (xpc_type_t)&_xpc_type_int64)
            {
LABEL_25:
              xpc_release((xpc_object_t)v14);
LABEL_39:
              notify_post("com.apple.system.logging.prefschanged");

              return;
            }
            uint64_t value = (void *)xpc_uint64_get_value(v17);
          }
          if (sub_100004DC0((uint64_t)value))
          {
            if (sub_100004E0C((void *)v14, "category", (uint64_t)&stru_1000108F0)) {
              sub_100004E0C((void *)v14, "subsystem", (uint64_t)&stru_100010930);
            }
          }
          goto LABEL_25;
        }
      }
      __error();
      goto LABEL_37;
    }
  }
  sub_100009A7C((uint64_t)v0, "Posting empty stream filter");
  uint64_t v7 = (const char *)_os_trace_prefsdir_path();
  snprintf((char *)__str, 0x400uLL, "%s/%s.plist", v7, "com.apple.diagnosticd.filter");
  if (!unlink((const char *)__str)) {
    notify_post("com.apple.system.logging.prefschanged");
  }
  if (qword_100014488 != -1) {
    dispatch_once(&qword_100014488, &stru_100010970);
  }
  if (qword_100014480 && sub_100004DC0(0) && sub_10000502C()) {
    sub_1000058DC();
  }
}

uint64_t sub_100009A7C(uint64_t a1, char *__format, ...)
{
  va_start(va, __format);
  vsnprintf(__str, 0x800uLL, __format, va);
  return _simple_asl_log();
}

uint64_t sub_100009AFC(uint64_t a1)
{
  return 1;
}

void sub_100009B18(uint64_t a1)
{
  if (qword_100014498 != -1) {
    dispatch_once_f(&qword_100014498, 0, (dispatch_function_t)sub_100009E98);
  }
  if (!dispatch_get_specific(off_100014290))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100009BDC;
    block[3] = &unk_100010B30;
    block[4] = a1;
    dispatch_sync((dispatch_queue_t)qword_1000144A0, block);
  }
}

uint64_t sub_100009BDC(uint64_t a1)
{
  id v1 = *(const char **)(a1 + 32);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000144A0);
  memset(&v6, 0, sizeof(v6));
  time_t v5 = time(0);
  localtime_r(&v5, &v6);
  strftime(v7, 0x1AuLL, "%F %T%z", &v6);
  id v2 = getprogname();
  pid_t v3 = getpid();
  uint64_t result = snprintf(__str, 0x400uLL, "%s %s[%d]: %s\n", v7, v2, v3, v1);
  if ((int)result >= 1)
  {
    if (result >= 0x400) {
      __str[1022] = 10;
    }
    dispatch_assert_queue_V2((dispatch_queue_t)qword_1000144A0);
    sub_100009D00();
    uint64_t result = dword_100014298;
    if ((dword_100014298 & 0x80000000) == 0)
    {
      _os_trace_write();
      return sub_100009D5C();
    }
  }
  return result;
}

void sub_100009D00()
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000144A0);
  if (dword_100014298 < 0)
  {
    sub_100009E34();
    if ((dword_100014298 & 0x80000000) == 0)
    {
      sub_100009D5C();
    }
  }
}

uint64_t sub_100009D5C()
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000144A0);
  off_t v0 = lseek(dword_100014298, 0, 2);
  uint64_t result = fsync(dword_100014298);
  if (v0 >= 0x100000)
  {
    if (close(dword_100014298) == -1)
    {
      int v3 = *__error();
      uint64_t result = *__error();
      if (v3 == 9)
      {
        qword_100014440 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_100014470 = result;
        __break(1u);
        return result;
      }
      _os_assumes_log();
    }
    rename((const std::__fs::filesystem::path *)qword_1000144B0, (const std::__fs::filesystem::path *)qword_1000144B8, v2);
    return sub_100009E34();
  }
  return result;
}

uint64_t sub_100009E34()
{
  uint64_t result = open((const char *)qword_1000144B0, 778, 420);
  dword_100014298 = result;
  if ((result & 0x80000000) == 0)
  {
    return fchown(result, 0x110u, 0x110u);
  }
  return result;
}

int *sub_100009E98()
{
  asprintf((char **)&qword_1000144A8, "com.apple.%s.log", "diagnosticd");
  if (!qword_1000144A8)
  {
    uint64_t v1 = *__error();
    qword_100014440 = (uint64_t)"BUG IN LIBTRACE: failed to create queue target from subsystem";
    qword_100014470 = v1;
    __break(1u);
LABEL_10:
    uint64_t result = __error();
    uint64_t v2 = *result;
    qword_100014440 = (uint64_t)"BUG IN LIBTRACE: failed to create log file path";
    qword_100014470 = v2;
    __break(1u);
    return result;
  }
  qword_1000144A0 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)qword_1000144A8, 0, 0);
  dispatch_queue_set_specific((dispatch_queue_t)qword_1000144A0, off_100014290, (void *)qword_1000144A0, 0);
  if (qword_100014648 != -1) {
    dispatch_once(&qword_100014648, &stru_1000110B0);
  }
  asprintf((char **)&qword_1000144B0, "%s/%s.0.log", (const char *)qword_100014638, "diagnosticd");
  if (qword_100014648 != -1) {
    dispatch_once(&qword_100014648, &stru_1000110B0);
  }
  uint64_t result = (int *)asprintf((char **)&qword_1000144B8, "%s/%s.1.log", (const char *)qword_100014638, "diagnosticd");
  if (!qword_1000144B0 || !qword_1000144B8) {
    goto LABEL_10;
  }
  return result;
}

void sub_10000A014(uint64_t a1, int a2, int a3, uint64_t a4)
{
  uint64_t v8 = _os_trace_calloc();
  *(_DWORD *)(v8 + 80) = 2;
  *(_DWORD *)(v8 + 16) = a2;
  *(_DWORD *)(v8 + 20) = a3;
  *(_DWORD *)(v8 + 56) = getpid();
  *(void *)(v8 + 96) = a4;
  if (a1 != -1)
  {
    CFStringRef v19 = @"pid";
    id v9 = +[NSNumber numberWithInt:a1];
    uint64_t v10 = [v9 stringValue];
    id v17 = v10;
    int v18 = &off_100011A40;
    int v11 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v20 = v11;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];

    *(void *)(v8 + 64) = v12;
  }
  int v13 = *(_DWORD *)(v8 + 16);
  if ((v13 & 0x100) != 0) {
    int v14 = 9;
  }
  else {
    int v14 = 8;
  }
  if ((v13 & 0x20) != 0) {
    int v15 = 11;
  }
  else {
    int v15 = v14;
  }
  *(void *)(v8 + 72) = os_transaction_create();
  sub_10000A1F8(v8, v15);
  if (qword_100014628 != -1) {
    dispatch_once(&qword_100014628, &stru_100010F70);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 0x40000000;
  v16[2] = sub_10000A2F8;
  v16[3] = &unk_100010B90;
  v16[4] = v8;
  dispatch_barrier_sync((dispatch_queue_t)qword_100014630, v16);
}

void sub_10000A1F8(uint64_t a1, int a2)
{
  uint64_t v4 = _os_trace_calloc();
  *(void *)(v4 + 16) = a1;
  *(_DWORD *)(v4 + 24) = a2;
  int v5 = *(_DWORD *)(a1 + 56);
  *(_DWORD *)(v4 + 28) = v5;
  uint64_t v6 = *(void *)(a1 + 96);
  if (v6) {
    strlcpy((char *)(v4 + 32), *(const char **)(v6 + 8), 0x40uLL);
  }
  else {
    proc_name(v5, (void *)(v4 + 32), 0x40u);
  }
  if (qword_1000144D8 != -1) {
    dispatch_once(&qword_1000144D8, &stru_100010C90);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10000A354;
  block[3] = &unk_100010C50;
  block[4] = v4;
  dispatch_sync((dispatch_queue_t)qword_1000144E0, block);
}

uint64_t sub_10000A2F8(uint64_t result)
{
  **(void **)(result + 32) = 0;
  *(void *)(*(void *)(result + 32) + 8) = off_1000142A8;
  *off_1000142A8 = *(_UNKNOWN **)(result + 32);
  off_1000142A8 = *(_UNKNOWN ***)(result + 32);
  return result;
}

void sub_10000A328(id a1)
{
  qword_100014630 = (uint64_t)dispatch_queue_create("com.apple.diagnosticd.stream", 0);
}

void sub_10000A354(uint64_t a1)
{
  sub_100009148(*(void **)(*(void *)(*(void *)(a1 + 32) + 16) + 64), *(unsigned int *)(*(void *)(a1 + 32) + 24), *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 16) + 20));
  sub_100009644();
  **(void **)(a1 + 32) = 0;
  *(void *)(*(void *)(a1 + 32) + 8) = off_1000142B8;
  *off_1000142B8 = *(_UNKNOWN **)(a1 + 32);
  off_1000142B8 = *(_UNKNOWN ***)(a1 + 32);
  sub_10000A4B0();
  sub_10000A4DC();
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 16) + 64) description];
  [v2 UTF8String];
  int v3 = (char *)_os_trace_strdup();

  sub_100007194(5, "System mode client started - %s (%d) - mode: 0x%x, filter: \"%s\"", (const char *)(*(void *)(a1 + 32) + 32), *(_DWORD *)(*(void *)(a1 + 32) + 28), *(_DWORD *)(*(void *)(a1 + 32) + 24), v3);
  snprintf(__str, 0x400uLL, "System mode client started - %s (%d) - mode: 0x%x, filter: \"%s\"", (const char *)(*(void *)(a1 + 32) + 32), *(_DWORD *)(*(void *)(a1 + 32) + 28), *(_DWORD *)(*(void *)(a1 + 32) + 24), v3);
  sub_100009B18((uint64_t)__str);
  free(v3);
}

uint64_t sub_10000A4B0()
{
  uint64_t result = _os_trace_set_diagnostic_flags();
  if (result) {
    errx(74, "Unable to set global diagnostic flag");
  }
  return result;
}

uint64_t sub_10000A4DC()
{
  if (qword_1000144D8 != -1) {
    dispatch_once(&qword_1000144D8, &stru_100010C90);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000144E0);
  if (qword_100014490 && [(id)qword_100014490 count])
  {
    off_t v0 = [(id)qword_100014490 objectForKeyedSubscript:@"global"];
    uint64_t v1 = v0;
    if (v0 && ([v0 unsignedLongLongValue] & 0x40000) != 0)
    {

      int v4 = 1;
    }
    else
    {

      xpc_object_t empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_string(empty, "procpath", "kernel");
      int8x16_t v19 = 0uLL;
      unsigned __int8 v3 = sub_1000084E4((void *)qword_100014490, empty, 0, 0, &v19, 1);
      int v4 = v3 & ((v19.i64[0] & 0x40000) != 0);
    }
  }
  else
  {
    int v4 = 0;
  }
  if (qword_1000145C8 != -1) {
    dispatch_once(&qword_1000145C8, &stru_100010CD0);
  }
  if (!v4)
  {
    if (qword_1000145B8)
    {
      dispatch_source_cancel((dispatch_source_t)qword_1000145B8);
      qword_1000145B8 = 0;
      int v5 = "Stopped kernel streaming";
    }
    else
    {
      int v5 = "Kernel streaming already stopped";
    }
    goto LABEL_27;
  }
  if (qword_1000145B8)
  {
    int v5 = "Kernel streaming is already enabled";
LABEL_27:
    uint64_t v14 = 7;
LABEL_28:
    return sub_100007194(v14, v5);
  }
  int v6 = open("/dev/oslog_stream", 4, 0);
  if (v6 < 0)
  {
    int v5 = "failed to open kernel stream";
    uint64_t v14 = 3;
    goto LABEL_28;
  }
  unsigned int v7 = v6;
  uint64_t v24 = 0;
  uint64_t v22 = 0;
  long long v23 = 0u;
  int8x16_t v19 = 0u;
  uint64_t v20 = 0;
  long long v21 = xmmword_1000145D0;
  if (_os_trace_kic_mode()) {
    _os_trace_uuiddb_make_kernel_cache_uuid();
  }
  if ((_os_trace_is_kernel_64_bit() & 1) == 0) {
    v19.i16[1] |= 1u;
  }
  qword_1000143C8 = _catalog_create();
  qword_1000143D8 = _catalog_procinfo_create();
  _catalog_subchunk_procinfo_add();
  CFArrayRef v8 = CFArrayCreate(kCFAllocatorDefault, (const void **)off_100014410, 4, &kCFTypeArrayCallBacks);
  if (v8)
  {
    CFArrayRef v9 = v8;
    CFDictionaryRef v10 = (const __CFDictionary *)OSKextCopyLoadedKextInfo();
    if (v10)
    {
      CFDictionaryRef v11 = v10;
      CFDictionaryApplyFunction(v10, (CFDictionaryApplierFunction)sub_10000B9B8, &unk_1000143A0);
      CFRelease(v11);
    }
    CFRelease(v9);
  }
  uint64_t v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v7, 0, (dispatch_queue_t)qword_1000145C0);
  qword_1000145B8 = (uint64_t)v12;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_10000A900;
  handler[3] = &unk_100010CF0;
  unsigned int v18 = v7;
  dispatch_source_set_event_handler(v12, handler);
  dispatch_set_context(v12, &unk_1000143A0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 0x40000000;
  v15[2] = sub_10000ACD0;
  v15[3] = &unk_100010D10;
  unsigned int v16 = v7;
  v15[4] = v12;
  dispatch_source_set_cancel_handler(v12, v15);
  dispatch_activate(v12);
  return sub_100007194(7, "Started kernel streaming");
}

void sub_10000A900()
{
  uint64_t v0 = __chkstk_darwin();
  mach_timebase_info((mach_timebase_info_t)&unk_1000144E8);
  mach_get_times();
  qword_1000144F8 = 0;
  dword_100014500 = 0;
  *(void *)&long long v25 = 0;
  memset(&v27, 0, sizeof(v27));
  localtime_r((const time_t *)&v25, &v27);
  unint64_t v1 = ((unsigned __int128)(v27.tm_gmtoff * (__int128)0x7777777777777777) >> 64) - v27.tm_gmtoff;
  dword_1000143B0 = (v1 >> 5) + (v1 >> 63) + 60 * v27.tm_isdst;
  *(_DWORD *)algn_1000143B4 = v27.tm_isdst;
  int v2 = *(_DWORD *)(v0 + 32);
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
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  ssize_t v3 = read(v2, &v27, 0x1000uLL);
  if (v3 <= 31)
  {
    int v4 = __error();
    strerror(*v4);
    sub_100007194(3, "Error reading from kernel channel %s");
    return;
  }
  ssize_t v5 = v3;
  *(void *)&long long v14 = *(void *)&v27.tm_sec;
  _catalog_update_earliest_fhbuf_ts();
  if ((char *)&v27 + v5 < (char *)&v27.tm_isdst + HIWORD(*(void *)&v27.tm_wday))
  {
    snprintf((char *)&v25, 0x400uLL, "Invalid kernel tracepoint size (%d) for read length (%zd)", HIWORD(*(void *)&v27.tm_wday), v5);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_10000AD68;
    block[3] = &unk_100010D30;
    block[4] = &v25;
    if (qword_1000145E0 != -1) {
      dispatch_once(&qword_1000145E0, block);
    }
    sub_100007194(3, "%s");
    return;
  }
  if (*(void *)&v27.tm_hour == -1)
  {
    sub_100007194(7, "Received dropped message count from the kernel: %u");
    return;
  }
  if (LOBYTE(v27.tm_hour) == 5)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    if (BYTE1(v27.tm_hour) == 5)
    {
      if (v27.tm_mday != 1) {
        return;
      }
      DWORD2(v25) = v27.tm_zone;
      WORD6(v25) = WORD2(v27.tm_zone);
      *(void *)&long long v25 = v28;
      uuid_copy((unsigned __int8 *)((unint64_t)&v25 | 0xE), (const unsigned __int8 *)&v27.tm_isdst);
      _catalog_procinfo_uuidinfo_add();
      unsigned int v6 = 1024;
LABEL_21:
      sub_10000AE58((const unsigned __int8 *)&v27.tm_isdst, v6);
      return;
    }
    if (BYTE1(v27.tm_hour) == 3)
    {
      if (v27.tm_mday == 2)
      {
        _catalog_procinfo_uuidinfo_remove();
        return;
      }
      if (v27.tm_mday == 1)
      {
        DWORD2(v25) = v27.tm_zone;
        WORD6(v25) = WORD2(v27.tm_zone);
        *(void *)&long long v25 = v28;
        uuid_copy((unsigned __int8 *)((unint64_t)&v25 | 0xE), (const unsigned __int8 *)&v27.tm_isdst);
        _catalog_procinfo_uuidinfo_add();
        unsigned int v6 = 2;
        goto LABEL_21;
      }
    }
  }
  else if (_chunk_support_convert_tracepoint())
  {
    unsigned int v7 = (void *)_os_activity_stream_entry_encode();
    if (v7)
    {
      CFArrayRef v8 = v7;
      xpc_dictionary_set_uint64(v7, "action", 6uLL);
      sub_10000AD84(0, (uint64_t)v8);
      xpc_release(v8);
    }
  }
}

void sub_10000ACD0(uint64_t a1)
{
  _catalog_destroy();
  if (close(*(_DWORD *)(a1 + 40)) == -1)
  {
    int v3 = *__error();
    uint64_t v4 = *__error();
    if (v3 == 9)
    {
      qword_100014440 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_100014470 = v4;
      __break(1u);
      return;
    }
    _os_assumes_log();
  }
  int v2 = *(NSObject **)(a1 + 32);

  dispatch_release(v2);
}

uint64_t sub_10000AD68(uint64_t a1)
{
  return _os_fault_with_payload(18, 2, 0, 0, *(void *)(a1 + 32), 0);
}

void sub_10000AD84(uint64_t a1, uint64_t a2)
{
  if (qword_1000145E8 != -1) {
    dispatch_once(&qword_1000145E8, &stru_100010D70);
  }
  if (qword_100014628 != -1) {
    dispatch_once(&qword_100014628, &stru_100010F70);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000;
  v4[2] = sub_10000B028;
  v4[3] = &unk_100010E10;
  v4[4] = a1;
  v4[5] = a2;
  dispatch_sync((dispatch_queue_t)qword_100014630, v4);
}

void sub_10000AE58(const unsigned __int8 *a1, unsigned int a2)
{
  if (qword_100014620 != -1) {
    dispatch_once(&qword_100014620, &stru_100010EF0);
  }
  if (qword_100014618)
  {
    xpc_connection_set_event_handler((xpc_connection_t)qword_100014618, &stru_100010F30);
    xpc_connection_activate((xpc_connection_t)qword_100014618);
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "operation", 9uLL);
    xpc_dictionary_set_uuid(v4, "uuid", a1);
    xpc_dictionary_set_int64(v4, "source", a2);
    xpc_object_t v5 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)qword_100014618, v4);
    xpc_release(v4);
    xpc_type_t type = xpc_get_type(v5);
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      int int64 = xpc_dictionary_get_int64(v5, "st");
      if (!int64)
      {
LABEL_11:
        xpc_release(v5);
        return;
      }
      string = strerror(int64);
    }
    else
    {
      if (type != (xpc_type_t)&_xpc_type_error)
      {
        qword_100014440 = (uint64_t)"BUG IN LIBTRACE: Unexpected xpc object";
        qword_100014470 = (uint64_t)type;
        __break(1u);
        return;
      }
      string = xpc_dictionary_get_string(v5, _xpc_error_key_description);
    }
    sub_100007194(3, "error harvesting kernel uuid text: %s", string);
    goto LABEL_11;
  }
}

void sub_10000AFF8(id a1)
{
  qword_100014618 = (uint64_t)xpc_connection_create_mach_service("com.apple.logd.admin", 0, 2uLL);
}

void sub_10000B028(uint64_t a1)
{
  unint64_t v1 = off_1000142A0;
  if (off_1000142A0)
  {
    while (1)
    {
      int v3 = *((_DWORD *)v1 + 20);
      switch(v3)
      {
        case 1:
          if (!*((void *)v1 + 11)) {
            goto LABEL_46;
          }
          break;
        case 2:
          if (!*((void *)v1 + 12)) {
            goto LABEL_46;
          }
          break;
        case 0:
          _os_assert_log();
          _os_crash();
          __break(1u);
          return;
      }
      xpc_object_t v5 = *(_xpc_connection_s **)(a1 + 32);
      xpc_object_t v4 = *(void **)(a1 + 40);
      if (*((void *)v1 + 3))
      {
        string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 40), "SIMULATOR_UDID");
        if (!string || strcmp(string, *((const char **)v1 + 3))) {
          goto LABEL_46;
        }
      }
      uint int64 = xpc_dictionary_get_uint64(v4, "traceid");
      int v8 = *((_DWORD *)v1 + 5);
      if (!v8) {
        break;
      }
      if ((v8 & 1) != 0 && uint64 == 2 || (v8 & 8) != 0 && uint64 == 6)
      {
LABEL_28:
        CFArrayRef v9 = (void *)*((void *)v1 + 8);
        if (!v9
          || (!v5
            ? (void *)(uint64_t pid = 0, euid = 0)
            : (pid = xpc_connection_get_pid(v5), euid = xpc_connection_get_euid(v5), CFArrayRef v9 = (void *)*((void *)v1 + 8)),
              sub_1000084E4(v9, v4, pid, euid, 0, 0)))
        {
          if (*((_DWORD *)v1 + 13) >= dword_100014430)
          {
            ++*((void *)v1 + 5);
            if (!*((unsigned char *)v1 + 48) && *((_DWORD *)v1 + 20) == 1)
            {
              long long v15 = (_xpc_connection_s *)*((void *)v1 + 11);
              xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
              xpc_dictionary_set_uint64(v16, "action", 0xCuLL);
              xpc_connection_send_message(v15, v16);
              xpc_release(v16);
              *((unsigned char *)v1 + 48) = 1;
            }
          }
          else
          {
            *((unsigned char *)v1 + 48) = 0;
            int v12 = *((_DWORD *)v1 + 20);
            if (v12 == 2)
            {
              uint64_t v17 = *((void *)v1 + 4) + 1;
              *((void *)v1 + 4) = v17;
              uint64_t v18 = v17 & 0x7F;
              BOOL v19 = v18 == 0;
              if (!v18) {
                atomic_fetch_add_explicit((atomic_uint *volatile)v1 + 13, 1u, memory_order_relaxed);
              }
              xpc_retain(*(xpc_object_t *)(a1 + 40));
              if (qword_100014608 != -1) {
                dispatch_once(&qword_100014608, &stru_100010E50);
              }
              block[0] = _NSConcreteStackBlock;
              block[1] = 0x40000000;
              block[2] = sub_10000B3C4;
              block[3] = &unk_100010DF0;
              uint64_t v20 = *(void *)(a1 + 40);
              block[4] = v1;
              void block[5] = v20;
              BOOL v22 = v19;
              dispatch_async((dispatch_queue_t)qword_100014610, block);
            }
            else if (v12 == 1)
            {
              xpc_connection_send_message(*((xpc_connection_t *)v1 + 11), *(xpc_object_t *)(a1 + 40));
              uint64_t v13 = *((void *)v1 + 4) + 1;
              *((void *)v1 + 4) = v13;
              if ((v13 & 0x7F) == 0)
              {
                atomic_fetch_add_explicit((atomic_uint *volatile)v1 + 13, 1u, memory_order_relaxed);
                long long v14 = (_xpc_connection_s *)*((void *)v1 + 11);
                barrier[0] = _NSConcreteStackBlock;
                barrier[1] = 0x40000000;
                barrier[2] = sub_10000B3B0;
                barrier[3] = &unk_100010DD0;
                barrier[4] = v1;
                xpc_connection_send_barrier(v14, barrier);
              }
            }
          }
        }
        goto LABEL_46;
      }
      if ((v8 & 4) != 0 && uint64 == 4 || (v8 & 2) != 0 && uint64 == 3) {
        goto LABEL_23;
      }
LABEL_46:
      unint64_t v1 = *(void **)v1;
      if (!v1) {
        return;
      }
    }
    if (uint64 - 3 > 1) {
      goto LABEL_28;
    }
LABEL_23:
    if (HIBYTE(uint64) == 2)
    {
      if ((*((unsigned char *)v1 + 16) & 0x20) != 0) {
        goto LABEL_28;
      }
    }
    else if (HIBYTE(uint64) != 1 || (*((_WORD *)v1 + 8) & 0x120) != 0)
    {
      goto LABEL_28;
    }
    goto LABEL_46;
  }
}

uint64_t sub_10000B3B0(uint64_t result)
{
  return result;
}

void sub_10000B3C4(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 96);
  if (!*(unsigned char *)(v2 + 25)
    && ((*(uint64_t (**)(uint64_t, void))(v2 + 32))(v2, *(void *)(a1 + 40)) & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (qword_100014628 != -1) {
      dispatch_once(&qword_100014628, &stru_100010F70);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_10000B530;
    block[3] = &unk_100010E70;
    block[4] = v3;
    dispatch_sync((dispatch_queue_t)qword_100014630, block);
    if (qword_100014608 != -1) {
      dispatch_once(&qword_100014608, &stru_100010E50);
    }
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 0x40000000;
    v4[2] = sub_10000B560;
    v4[3] = &unk_100010E90;
    v4[4] = v3;
    dispatch_async((dispatch_queue_t)qword_100014610, v4);
  }
  xpc_release(*(xpc_object_t *)(a1 + 40));
  if (*(unsigned char *)(a1 + 48)) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(a1 + 32) + 52), 0xFFFFFFFF, memory_order_relaxed);
  }
}

uint64_t sub_10000B530(uint64_t result)
{
  unint64_t v1 = *(uint64_t **)(result + 32);
  uint64_t v2 = *v1;
  if (*v1)
  {
    *(void *)(v2 + 8) = v1[1];
    unint64_t v1 = *(uint64_t **)(result + 32);
    uint64_t v2 = *v1;
  }
  else
  {
    off_1000142A8 = (_UNKNOWN **)v1[1];
  }
  *(void *)v1[1] = v2;
  return result;
}

uint64_t sub_10000B560(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 96);
  sub_10000B5F0(v2);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 40);
  if (v5)
  {
    sub_100007194(5, "Stream client PID: %d - Dropped %llu of %llu messages because streaming client could not keep up with the datastream.", *(_DWORD *)(v4 + 56), v5, *(void *)(v4 + 32) + v5);
    uint64_t v4 = *(void *)(a1 + 32);
  }
  os_release(*(void **)(v4 + 72));
  sub_10000B698(*(void ***)(a1 + 32));
  unsigned int v6 = *(uint64_t (**)(uint64_t))(v3 + 40);

  return v6(v3);
}

void sub_10000B5F0(uint64_t a1)
{
  if (qword_1000144D8 != -1) {
    dispatch_once(&qword_1000144D8, &stru_100010C90);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10000B6DC;
  block[3] = &unk_100010EB0;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)qword_1000144E0, block);
}

void sub_10000B698(void **a1)
{
  free(a1[3]);

  free(a1);
}

uint64_t sub_10000B6DC(uint64_t a1)
{
  unint64_t v1 = (void **)off_1000142B0;
  if (!off_1000142B0) {
    goto LABEL_17;
  }
  uint64_t v2 = 0;
  int v3 = 0;
  do
  {
    if (*(void **)(a1 + 32) == v1[2]) {
      uint64_t v2 = v1;
    }
    else {
      v3 |= *((_DWORD *)v1 + 6);
    }
    unint64_t v1 = (void **)*v1;
  }
  while (v1);
  if (!v2)
  {
LABEL_17:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  int v4 = *((_DWORD *)v2 + 6);
  int v5 = v4 & ~(dword_1000144D0 | v3);
  if (v5)
  {
    sub_100007194(5, "System mode client stopped - %s (%d) - clearing mode: 0x%x, still active: 0x%x", (const char *)v2 + 32, *((_DWORD *)v2 + 7), v4 & ~(dword_1000144D0 | v3), v3);
    snprintf(__str, 0x400uLL, "System mode client stopped - %s (%d) - clearing mode: 0x%x, still active: 0x%x", (const char *)v2 + 32, *((_DWORD *)v2 + 7), v5, v3);
    sub_100009B18((uint64_t)__str);
    sub_10000A4B0();
  }
  else
  {
    sub_100007194(5, "System mode client stopped - %s (%d) - clearing mode: 0x0, still active: 0x%x", (const char *)v2 + 32, *((_DWORD *)v2 + 7), v3);
    snprintf(__str, 0x400uLL, "System mode client stopped - %s (%d) - clearing mode: 0x0, still active: 0x%x", (const char *)v2 + 32, *((_DWORD *)v2 + 7), v3);
    sub_100009B18((uint64_t)__str);
  }
  unsigned int v6 = *v2;
  if (*v2) {
    unsigned int v7 = (_UNKNOWN **)*v2;
  }
  else {
    unsigned int v7 = &off_1000142B0;
  }
  v7[1] = v2[1];
  *(void *)v2[1] = v6;
  free(v2);
  int v8 = (void *)qword_100014490;
  qword_100014490 = 0;

  CFArrayRef v9 = off_1000142B0;
  if (off_1000142B0)
  {
    do
    {
      sub_100009148(*(void **)(v9[2] + 64), *((unsigned int *)v9 + 6), *(_DWORD *)(v9[2] + 20));
      CFArrayRef v9 = (void *)*v9;
    }
    while (v9);
  }
  sub_100009644();
  return sub_10000A4DC();
}

void sub_10000B8A4(id a1)
{
  qword_100014610 = (uint64_t)dispatch_queue_create("com.apple.diagnosticd.relay", 0);
}

void sub_10000B8D0(id a1)
{
  mach_timebase_info(&stru_1000145F0);
  qword_1000145F8 = (uint64_t)dispatch_queue_create("com.apple.diagnosticd.memory-pressure", 0);
  unint64_t v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 7uLL, (dispatch_queue_t)qword_1000145F8);
  qword_100014600 = (uint64_t)v1;

  dispatch_source_set_event_handler(v1, &stru_100010DB0);
}

void sub_10000B940(id a1)
{
  uintptr_t data = dispatch_source_get_data((dispatch_source_t)qword_100014600);
  _os_trace_log_simple();
  switch(data)
  {
    case 1uLL:
      int v2 = 16;
      break;
    case 4uLL:
      int v2 = 4;
      break;
    case 2uLL:
      int v2 = 8;
      break;
    default:
      return;
  }
  dword_100014430 = v2;
}

uint64_t sub_10000B9B8(int a1, CFDictionaryRef theDict)
{
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"OSBundleExecLoadAddress");
  CFDataRef v4 = (const __CFData *)CFDictionaryGetValue(theDict, @"OSBundleTextUUID");
  uint64_t result = (uint64_t)CFDictionaryGetValue(theDict, @"OSBundleExecLoadSize");
  if (Value)
  {
    if (v4)
    {
      CFNumberRef v6 = (const __CFNumber *)result;
      if (result)
      {
        uint64_t valuePtr = 0;
        uint64_t result = CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
        if (result)
        {
          memset(v9, 0, sizeof(v9));
          DWORD2(v9[0]) = valuePtr;
          WORD6(v9[0]) = WORD2(valuePtr);
          BytePtr = CFDataGetBytePtr(v4);
          uuid_copy((unsigned __int8 *)((unint64_t)v9 | 0xE), BytePtr);
          CFNumberGetValue(v6, kCFNumberSInt64Type, v9);
          return _catalog_procinfo_uuidinfo_add();
        }
      }
    }
  }
  return result;
}

void sub_10000BACC(id a1)
{
  *(_OWORD *)in = 0u;
  memset(v6, 0, sizeof(v6));
  size_t v4 = 37;
  if (!sysctlbyname("kern.uuid", in, &v4, 0, 0))
  {
    unint64_t v1 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    qword_1000145C0 = (uint64_t)dispatch_queue_create("com.apple.diagnosticd.klog", v1);
    uuid_parse(in, (unsigned __int8 *)&xmmword_1000145D0);
    if (qword_100014648 != -1) {
      dispatch_once(&qword_100014648, &stru_1000110B0);
    }
    dword_1000143A4 = open((const char *)qword_100014640, 0x100000);
    if (dword_1000143A4 == -1)
    {
      int v2 = __error();
      int v3 = strerror(*v2);
      sub_100007194(3, "Error opening uuiddb: %s", v3);
    }
  }
}

void sub_10000BBE8(id a1)
{
  qword_1000144E0 = (uint64_t)dispatch_queue_create("com.apple.diagnosticd.mode_clients", 0);
}

void start()
{
  if (qword_100014498 != -1) {
    dispatch_once_f(&qword_100014498, 0, (dispatch_function_t)sub_100009E98);
  }
  dispatch_sync((dispatch_queue_t)qword_1000144A0, &stru_100010B70);
  if ((MEMORY[0xFFFFFC104] & 8) != 0)
  {
    sub_100007194(5, "Startup - clearing mode: 0x%x", 8);
    snprintf(__str, 0x400uLL, "Startup - clearing mode: 0x%x", 8);
    sub_100009B18((uint64_t)__str);
    sub_10000A4B0();
  }
  uint64_t v0 = (void *)qword_100014490;
  qword_100014490 = 0;

  sub_100009644();
  dword_1000144D0 = MEMORY[0xFFFFFC104];
  os_trace_set_mode();
  sub_100007194(6, "diagnosticd starting");
  strcpy(__str, "diagnosticd starting");
  sub_100009B18((uint64_t)__str);
  qword_1000144C0 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, 0);
  dispatch_source_set_event_handler((dispatch_source_t)qword_1000144C0, &stru_100010BD0);
  dispatch_activate((dispatch_object_t)qword_1000144C0);
  mach_service = xpc_connection_create_mach_service("com.apple.diagnosticd", 0, 1uLL);
  qword_1000144C8 = (uint64_t)mach_service;
  if (!mach_service) {
    errx(70, "failed to create mach service com.apple.diagnosticd");
  }
  xpc_connection_set_event_handler(mach_service, &stru_100010C10);
  xpc_connection_activate((xpc_connection_t)qword_1000144C8);
  sub_100005A90();
  dispatch_main();
}

void sub_10000BD9C(id a1, void *a2)
{
  int v3 = (void *)voucher_adopt();
  os_release(v3);
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_10000BEA4;
    handler[3] = &unk_100010C30;
    void handler[4] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    pid_t pid = xpc_connection_get_pid((xpc_connection_t)a2);
    sub_100007194(6, "New connection from peer %d", pid);
    xpc_connection_activate((xpc_connection_t)a2);
  }
  else
  {
    size_t v4 = xpc_copy_description(a2);
    sub_100007194(3, "Strange connection with %s", v4);
    free(v4);
  }
}

void sub_10000BEA4(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary) {
    return;
  }
  size_t v4 = *(_xpc_connection_s **)(a1 + 32);
  uint int64 = xpc_dictionary_get_uint64(object, "action");
  if (uint64 - 1 < 2) {
    return;
  }
  uint64_t v6 = uint64;
  if (uint64 == 6)
  {
    uint64_t v20 = (void *)voucher_adopt();
    os_release(v20);
    sub_10000AD84((uint64_t)v4, (uint64_t)object);
    return;
  }
  if (uint64 != 3)
  {
    long long v21 = xpc_copy_description(object);
    sub_100007194(3, "Unimplemented action %lld [%s]", v6, v21);
    free(v21);
    return;
  }
  string = xpc_dictionary_get_string(object, "simulator_device");
  uint64_t pid = xpc_connection_get_pid(v4);
  memset(buffer, 0, 64);
  proc_name(pid, buffer, 0x40u);
  *(void *)__str = 0;
  v33[0] = 0;
  uintptr_t data = xpc_dictionary_get_data(object, "stream_filter", v33);
  id v10 = 0;
  if (data && v33[0])
  {
    id v11 = [objc_alloc((Class)NSData) initWithBytes:data length:v33[0]];
    int v12 = +[NSPropertyListSerialization propertyListWithData:v11 options:0 format:0 error:0];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v10 = 0;
LABEL_21:

      goto LABEL_23;
    }
    id v13 = sub_100008048(v12, 0);

    if (v13)
    {
      id v10 = v13;
      id v11 = [v10 objectForKeyedSubscript:@"pid"];
      id v14 = [v10 count];

      if (v14 == (id)1 && [v11 count] == (id)1)
      {
        long long v15 = +[NSNumber numberWithInt:pid];
        xpc_object_t v16 = [v15 stringValue];
        uint64_t v17 = [v11 objectForKeyedSubscript:v16];

        if (v17)
        {
          uint64_t v18 = pid;
          BOOL v19 = "allowing peer %s (%d) to see itself";
          sub_100007194(5, "allowing peer %s (%d) to see itself");
LABEL_28:
          snprintf(__str, 0x400uLL, v19, buffer, v18);
          sub_100009B18((uint64_t)__str);
          size_t v22 = _os_trace_calloc();
          *(_DWORD *)(v22 + 80) = 1;
          *(_DWORD *)(v22 + 16) = xpc_dictionary_get_uint64(object, "flags");
          *(void *)(v22 + 88) = v4;
          *(void *)(v22 + 64) = v10;
          *(_DWORD *)(v22 + 20) = xpc_dictionary_get_uint64(object, "types");
          *(_DWORD *)(v22 + 56) = xpc_connection_get_pid(v4);
          if (string) {
            long long v23 = strdup(string);
          }
          else {
            long long v23 = 0;
          }
          *(void *)(v22 + 24) = v23;
          int v24 = *(_DWORD *)(v22 + 16);
          if ((v24 & 0x100) != 0) {
            int v25 = 9;
          }
          else {
            int v25 = 8;
          }
          if ((v24 & 0x20) != 0) {
            int v26 = 11;
          }
          else {
            int v26 = v25;
          }
          xpc_connection_set_context(v4, (void *)v22);
          xpc_connection_set_finalizer_f(v4, (xpc_finalizer_t)sub_10000B698);
          xpc_retain(v4);
          *(void *)__str = _NSConcreteStackBlock;
          v33[0] = 0x40000000;
          v33[1] = (size_t)sub_10000C564;
          v33[2] = (size_t)&unk_100010FB0;
          v33[3] = v22;
          v33[4] = (size_t)v4;
          xpc_connection_set_event_handler(v4, __str);
          if (qword_100014628 != -1) {
            dispatch_once(&qword_100014628, &stru_100010F70);
          }
          block[0] = _NSConcreteStackBlock;
          block[1] = 0x40000000;
          block[2] = sub_10000C6B0;
          block[3] = &unk_100010FD0;
          block[4] = v22;
          dispatch_barrier_sync((dispatch_queue_t)qword_100014630, block);
          sub_10000A1F8(v22, v26);
          xpc_object_t reply = xpc_dictionary_create_reply(object);
          if (reply)
          {
            uint64_t v28 = reply;
            xpc_connection_send_message(v4, reply);
            xpc_release(v28);
          }
          return;
        }
        goto LABEL_23;
      }
      goto LABEL_21;
    }
    id v10 = 0;
  }
LABEL_23:
  if ((_os_trace_peer_is_admin() & 1) != 0 || string)
  {
    uint64_t v18 = pid;
    BOOL v19 = "allowing %s (%d) access to stream due to admin status";
    sub_100007194(5, "allowing %s (%d) access to stream due to admin status");
    goto LABEL_28;
  }
  if (sub_10000C4D8())
  {
    uint64_t v18 = pid;
    BOOL v19 = "allowing %s (%d) entitled access to stream";
    sub_100007194(5, "allowing %s (%d) entitled access to stream");
    goto LABEL_28;
  }
  if (os_variant_is_darwinos() && sub_10000C4D8())
  {
    uint64_t v18 = pid;
    BOOL v19 = "allowing %s (%d) darwinOS entitled access to stream";
    sub_100007194(5, "allowing %s (%d) darwinOS entitled access to stream");
    goto LABEL_28;
  }
  sub_100007194(5, "streaming limited to admin group %s (%d)", buffer, pid);
  snprintf(__str, 0x400uLL, "streaming limited to admin group %s (%d)", buffer, pid);
  sub_100009B18((uint64_t)__str);
  sub_100007194(3, "denying stream client (insufficient access) %s (%d)", buffer, pid);
  xpc_object_t v29 = xpc_dictionary_create_reply(object);
  if (v29)
  {
    id v30 = v29;
    xpc_dictionary_set_uint64(v29, "error", 1uLL);
    xpc_connection_send_message(v4, v30);
    xpc_release(v30);
  }
  xpc_connection_cancel(v4);
}

BOOL sub_10000C4D8()
{
  uint64_t v0 = (void *)xpc_connection_copy_entitlement_value();
  if (!v0) {
    return 0;
  }
  unint64_t v1 = v0;
  if (xpc_get_type(v0) == (xpc_type_t)&_xpc_type_BOOL)
  {
    BOOL value = xpc_BOOL_get_value(v1);
  }
  else
  {
    sub_100007194(3, "non-BOOLean entitlements unsupported @%s:%d", "_diagd_peer_is_entitled", 573);
    BOOL value = 0;
  }
  xpc_release(v1);
  return value;
}

void sub_10000C564(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    if (object == &_xpc_error_connection_invalid)
    {
      sub_10000B5F0(*(void *)(a1 + 32));
      if (qword_100014628 != -1) {
        dispatch_once(&qword_100014628, &stru_100010F70);
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_10000C710;
      block[3] = &unk_100010F90;
      block[4] = *(void *)(a1 + 32);
      dispatch_barrier_sync((dispatch_queue_t)qword_100014630, block);
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(v5 + 40);
      if (v6) {
        sub_100007194(5, "Stream client PID: %d - Dropped %llu of %llu messages because streaming client could not keep up with the datastream.", *(_DWORD *)(v5 + 56), v6, *(void *)(v5 + 32) + v6);
      }
      xpc_release(*(xpc_object_t *)(a1 + 40));
      os_release(*(void **)(*(void *)(a1 + 32) + 72));
    }
    else
    {
      size_t v4 = *(_xpc_connection_s **)(a1 + 40);
      xpc_connection_cancel(v4);
    }
  }
}

uint64_t sub_10000C6B0(uint64_t a1)
{
  uint64_t result = os_transaction_create();
  *(void *)(*(void *)(a1 + 32) + 72) = result;
  **(void **)(a1 + 32) = 0;
  *(void *)(*(void *)(a1 + 32) + 8) = off_1000142A8;
  *off_1000142A8 = *(_UNKNOWN **)(a1 + 32);
  off_1000142A8 = *(_UNKNOWN ***)(a1 + 32);
  return result;
}

uint64_t sub_10000C710(uint64_t result)
{
  unint64_t v1 = *(uint64_t **)(result + 32);
  uint64_t v2 = *v1;
  if (*v1)
  {
    *(void *)(v2 + 8) = v1[1];
    unint64_t v1 = *(uint64_t **)(result + 32);
    uint64_t v2 = *v1;
  }
  else
  {
    off_1000142A8 = (_UNKNOWN **)v1[1];
  }
  *(void *)v1[1] = v2;
  return result;
}

void sub_10000C740(id a1)
{
}

unsigned __int8 *sub_10000C754(unsigned __int8 *result, uint64_t a2)
{
  int v3 = result;
  int v4 = *result;
  if (v4 != 1)
  {
    if (v4 != 2)
    {
      if (v4 == 3)
      {
        if (*((void *)result + 2))
        {
          uint64_t v5 = 0;
          unint64_t v6 = 0;
          do
          {
            uint64_t result = (unsigned __int8 *)(*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(a2 + 16))(a2, v6++, v3[1] + v5);
            v5 += 16;
          }
          while (v6 < v3[2]);
        }
        return result;
      }
      printf("TB_FATAL: invalid tag in array metadata: 0x%x (%s:%d)\n", v4, "/Library/Caches/com.apple.xbs/Binaries/libtrace_executables/install/TempContent/Objects/libtrace.build/diagnosticd.build/DerivedSources/OSLogDarwin_C.c", 1124);
      _os_crash();
      __break(1u);
LABEL_16:
      uint64_t result = (unsigned __int8 *)_os_crash();
      __break(1u);
      return result;
    }
    uint64_t result = (unsigned __int8 *)tb_message_subrange();
    if (!result) {
      return result;
    }
    _os_crash();
    __break(1u);
  }
  uint64_t v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  uint64_t v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  tb_transport_message_buffer_wrap_buffer();
  if (tb_message_construct()) {
    goto LABEL_16;
  }
  uint64_t result = (unsigned __int8 *)tb_message_configure_received();
  if (v3[3])
  {
    unint64_t v7 = 0;
    do
    {
      v8[0] = 0;
      v8[1] = 0;
      tb_message_decode_u32();
      tb_message_decode_u64();
      uint64_t result = (unsigned __int8 *)(*(uint64_t (**)(uint64_t, unint64_t, void *))(a2 + 16))(a2, v7++, v8);
    }
    while (v7 < v3[3]);
  }
  return result;
}

uint64_t sub_10000C970(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 40) + 32))
  {
    unint64_t v2 = 0;
    do
    {
      tb_message_decode_u32();
      tb_message_decode_u64();
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      ++v2;
    }
    while (v2 < *(void *)(*(void *)(a1 + 40) + 32));
  }
  return 0;
}

uint64_t sub_10000CA08(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 12;
  return result;
}

uint64_t sub_10000CA20(uint64_t result)
{
  return result;
}

uint64_t sub_10000CA38(uint64_t a1)
{
  tb_message_encode_u32();
  uint64_t result = tb_message_encode_u64();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

void sub_10000CA8C(id a1)
{
  qword_100014638 = (uint64_t)"/private/var/db/diagnostics";
  qword_100014640 = (uint64_t)"/private/var/db/uuidtext";
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
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

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return _CFStringCreateWithFormatAndArguments(alloc, formatOptions, format, arguments);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

uint64_t OSKextCopyLoadedKextInfo()
{
  return _OSKextCopyLoadedKextInfo();
}

uint64_t OSLogConstructArchive()
{
  return _OSLogConstructArchive();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

int *__error(void)
{
  return ___error();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

uint64_t _catalog_create()
{
  return __catalog_create();
}

uint64_t _catalog_destroy()
{
  return __catalog_destroy();
}

uint64_t _catalog_procinfo_create()
{
  return __catalog_procinfo_create();
}

uint64_t _catalog_procinfo_uuidinfo_add()
{
  return __catalog_procinfo_uuidinfo_add();
}

uint64_t _catalog_procinfo_uuidinfo_remove()
{
  return __catalog_procinfo_uuidinfo_remove();
}

uint64_t _catalog_subchunk_procinfo_add()
{
  return __catalog_subchunk_procinfo_add();
}

uint64_t _catalog_update_earliest_fhbuf_ts()
{
  return __catalog_update_earliest_fhbuf_ts();
}

uint64_t _chunk_support_convert_tracepoint()
{
  return __chunk_support_convert_tracepoint();
}

uint64_t _os_activity_stream_entry_decode()
{
  return __os_activity_stream_entry_decode();
}

uint64_t _os_activity_stream_entry_encode()
{
  return __os_activity_stream_entry_encode();
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

uint64_t _os_trace_calloc()
{
  return __os_trace_calloc();
}

uint64_t _os_trace_device_formatted_for_content_protection()
{
  return __os_trace_device_formatted_for_content_protection();
}

uint64_t _os_trace_is_kernel_64_bit()
{
  return __os_trace_is_kernel_64_bit();
}

uint64_t _os_trace_kic_mode()
{
  return __os_trace_kic_mode();
}

uint64_t _os_trace_log_simple()
{
  return __os_trace_log_simple();
}

uint64_t _os_trace_peer_is_admin()
{
  return __os_trace_peer_is_admin();
}

uint64_t _os_trace_prefsdir_path()
{
  return __os_trace_prefsdir_path();
}

uint64_t _os_trace_set_diagnostic_flags()
{
  return __os_trace_set_diagnostic_flags();
}

uint64_t _os_trace_strdup()
{
  return __os_trace_strdup();
}

uint64_t _os_trace_uuiddb_make_kernel_cache_uuid()
{
  return __os_trace_uuiddb_make_kernel_cache_uuid();
}

uint64_t _os_trace_write()
{
  return __os_trace_write();
}

uint64_t _simple_asl_log()
{
  return __simple_asl_log();
}

uint64_t archive_entry_copy_pathname()
{
  return _archive_entry_copy_pathname();
}

uint64_t archive_entry_copy_sourcepath()
{
  return _archive_entry_copy_sourcepath();
}

uint64_t archive_entry_free()
{
  return _archive_entry_free();
}

uint64_t archive_entry_new()
{
  return _archive_entry_new();
}

uint64_t archive_errno()
{
  return _archive_errno();
}

uint64_t archive_error_string()
{
  return _archive_error_string();
}

uint64_t archive_read_disk_entry_from_file()
{
  return _archive_read_disk_entry_from_file();
}

uint64_t archive_read_disk_new()
{
  return _archive_read_disk_new();
}

uint64_t archive_read_free()
{
  return _archive_read_free();
}

uint64_t archive_set_error()
{
  return _archive_set_error();
}

uint64_t archive_write_data()
{
  return _archive_write_data();
}

uint64_t archive_write_finish_entry()
{
  return _archive_write_finish_entry();
}

uint64_t archive_write_free()
{
  return _archive_write_free();
}

uint64_t archive_write_header()
{
  return _archive_write_header();
}

uint64_t archive_write_new()
{
  return _archive_write_new();
}

uint64_t archive_write_open()
{
  return _archive_write_open();
}

uint64_t archive_write_set_format_pax()
{
  return _archive_write_set_format_pax();
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return _crc32(crc, buf, len);
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

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return _dispatch_source_get_data(source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void errx(int a1, const char *a2, ...)
{
}

uint64_t exclaves_lookup_service()
{
  return _exclaves_lookup_service();
}

void exit(int a1)
{
}

int fchmod(int a1, mode_t a2)
{
  return _fchmod(a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return _fchown(a1, a2, a3);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fsync(int a1)
{
  return _fsync(a1);
}

FILE *__cdecl funopen(const void *a1, int (__cdecl *a2)(void *, char *, int), int (__cdecl *a3)(void *, const char *, int), fpos_t (__cdecl *a4)(void *, fpos_t, int), int (__cdecl *a5)(void *))
{
  return _funopen(a1, a2, a3, a4, a5);
}

int gethostname(char *a1, size_t a2)
{
  return _gethostname(a1, a2);
}

pid_t getpid(void)
{
  return _getpid();
}

const char *getprogname(void)
{
  return _getprogname();
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

uint64_t lockdown_checkin_xpc()
{
  return _lockdown_checkin_xpc();
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_get_socket()
{
  return _lockdown_get_socket();
}

uint64_t lockdown_receive_message()
{
  return _lockdown_receive_message();
}

uint64_t lockdown_send()
{
  return _lockdown_send();
}

uint64_t lockdown_send_message()
{
  return _lockdown_send_message();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

uint64_t mach_get_times()
{
  return _mach_get_times();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
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

int mkstemp(char *a1)
{
  return _mkstemp(a1);
}

int mkstemp_dprotected_np(char *path, int dpclass, int dpflags)
{
  return _mkstemp_dprotected_np(path, dpclass, dpflags);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

uint64_t os_log_copy_formatted_message()
{
  return _os_log_copy_formatted_message();
}

uint64_t os_log_get_type()
{
  return _os_log_get_type();
}

void os_release(void *object)
{
}

uint64_t os_trace_copy_formatted_message()
{
  return _os_trace_copy_formatted_message();
}

uint64_t os_trace_get_type()
{
  return _os_trace_get_type();
}

uint64_t os_trace_set_mode()
{
  return _os_trace_set_mode();
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_is_darwinos()
{
  return _os_variant_is_darwinos();
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int proc_listallpids(void *buffer, int buffersize)
{
  return _proc_listallpids(buffer, buffersize);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int setlinebuf(FILE *a1)
{
  return _setlinebuf(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return _strcasestr(__big, __little);
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

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strnvis(char *a1, size_t a2, const char *a3, int a4)
{
  return _strnvis(a1, a2, a3, a4);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

uint64_t tb_client_connection_activate()
{
  return _tb_client_connection_activate();
}

uint64_t tb_client_connection_create_with_endpoint()
{
  return _tb_client_connection_create_with_endpoint();
}

uint64_t tb_client_connection_message_construct()
{
  return _tb_client_connection_message_construct();
}

uint64_t tb_client_connection_message_destruct()
{
  return _tb_client_connection_message_destruct();
}

uint64_t tb_connection_send_query()
{
  return _tb_connection_send_query();
}

uint64_t tb_endpoint_create_with_data()
{
  return _tb_endpoint_create_with_data();
}

uint64_t tb_endpoint_set_interface_identifier()
{
  return _tb_endpoint_set_interface_identifier();
}

uint64_t tb_message_complete()
{
  return _tb_message_complete();
}

uint64_t tb_message_configure_received()
{
  return _tb_message_configure_received();
}

uint64_t tb_message_construct()
{
  return _tb_message_construct();
}

uint64_t tb_message_decode_u32()
{
  return _tb_message_decode_u32();
}

uint64_t tb_message_decode_u64()
{
  return _tb_message_decode_u64();
}

uint64_t tb_message_decode_u8()
{
  return _tb_message_decode_u8();
}

uint64_t tb_message_encode_BOOL()
{
  return _tb_message_encode_BOOL();
}

uint64_t tb_message_encode_u32()
{
  return _tb_message_encode_u32();
}

uint64_t tb_message_encode_u64()
{
  return _tb_message_encode_u64();
}

uint64_t tb_message_encode_u8()
{
  return _tb_message_encode_u8();
}

uint64_t tb_message_subrange()
{
  return _tb_message_subrange();
}

uint64_t tb_transport_message_buffer_wrap_buffer()
{
  return _tb_transport_message_buffer_wrap_buffer();
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return _uuid_compare(uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return _uuid_parse(in, uu);
}

uint64_t voucher_adopt()
{
  return _voucher_adopt();
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return _xpc_connection_get_euid(connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

uint64_t xpc_create_from_plist()
{
  return _xpc_create_from_plist();
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

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return _xpc_dictionary_get_count(xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_dictionary(xdict, key);
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

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_streamFlags(void *a1, const char *a2, ...)
{
  return [a1 streamFlags];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}