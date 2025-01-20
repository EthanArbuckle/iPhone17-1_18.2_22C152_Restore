uint64_t memgraph_from_task_save_immediate(int a1, unsigned int a2, int a3, int64_t a4, uint64_t a5)
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  _xpc_connection_s *v12;
  xpc_object_t v13;
  void *v14;
  xpc_object_t v15;
  void *v16;
  const char *string;
  const char *v18;
  int64_t int64;
  __CFString *v20;
  void *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x263EF8340];
  if ((a1 - 1) < 0xFFFFFFFE)
  {
    if (a5)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "memgraph_from_task_save_immediate";
        v5 = &_os_log_internal;
        v6 = "%s: Context is unused. Clients should provide nil.";
LABEL_25:
        _os_log_error_impl(&dword_20A409000, v5, OS_LOG_TYPE_ERROR, v6, buf, 0xCu);
        return 0xFFFFFFFFLL;
      }
      return 0xFFFFFFFFLL;
    }
    sub_20A40AAAC();
    v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "memgraph_from_task_save_immediate";
        _os_log_error_impl(&dword_20A409000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Couldn't get RMEGetXPCConnection().", buf, 0xCu);
      }
      v7 = 0xFFFFFFFFLL;
      goto LABEL_23;
    }
    v13 = xpc_dictionary_create(0, 0, 0);
    v14 = v13;
    if (!v13)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "memgraph_from_task_save_immediate";
        _os_log_error_impl(&dword_20A409000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Couldn't create xpc_dictionary.", buf, 0xCu);
      }
      v7 = 0xFFFFFFFFLL;
      goto LABEL_22;
    }
    xpc_dictionary_set_int64(v13, "MessageType", 3);
    xpc_dictionary_set_mach_send();
    xpc_dictionary_set_int64(v14, "ContentLevel", a2);
    xpc_dictionary_set_fd(v14, "MemgraphFileDescriptor", a3);
    xpc_dictionary_set_int64(v14, "TimeoutSeconds", a4);
    v15 = xpc_connection_send_message_with_reply_sync(v12, v14);
    v16 = v15;
    if (v15 && MEMORY[0x21051A050](v15) == MEMORY[0x263EF8708])
    {
      string = xpc_dictionary_get_string(v16, "ErrorDomain");
      if (!string)
      {
        v7 = 0;
        goto LABEL_15;
      }
      v18 = string;
      int64 = xpc_dictionary_get_int64(v16, "ErrorCode");
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v23 = "memgraph_from_task_save_immediate";
        v24 = 2080;
        v25 = v18;
        v26 = 2048;
        v27 = int64;
        _os_log_error_impl(&dword_20A409000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: xpc reply error: %s: %lld", buf, 0x20u);
      }
      v20 = MREErrorDomain;
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s", v18);
      LODWORD(v20) = [(__CFString *)v20 isEqualToString:v21];

      if (v20 && (unint64_t)(int64 - 8) <= 6)
      {
        v7 = dword_20A40BA90[int64 - 8];
        goto LABEL_15;
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "memgraph_from_task_save_immediate";
      _os_log_error_impl(&dword_20A409000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Couldn't get reply dictionary.", buf, 0xCu);
    }
    v7 = 0xFFFFFFFFLL;
LABEL_15:

LABEL_22:
LABEL_23:

    return v7;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "memgraph_from_task_save_immediate";
    v5 = &_os_log_internal;
    v6 = "%s: Invalid task port.";
    goto LABEL_25;
  }
  return 0xFFFFFFFFLL;
}

id sub_20A40AAAC()
{
  if (qword_267638B20 != -1) {
    dispatch_once(&qword_267638B20, &unk_26BE51438);
  }
  v0 = (void *)qword_267638B18;

  return v0;
}

void sub_20A40AB00()
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.ReportMemoryException", 0, 2uLL);
  v1 = (void *)qword_267638B18;
  qword_267638B18 = (uint64_t)mach_service;

  if (qword_267638B18)
  {
    xpc_connection_set_event_handler((xpc_connection_t)qword_267638B18, &unk_26BE51458);
    v2 = (_xpc_connection_s *)qword_267638B18;
    xpc_connection_resume(v2);
  }
}

void sub_20A40AB74(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = MEMORY[0x21051A050]();
  BOOL v4 = v2 != (id)MEMORY[0x263EF86A0] && v3 == MEMORY[0x263EF8720];
  if (v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x263EF86B0]);
    int v6 = 136315138;
    v7 = string;
    _os_log_error_impl(&dword_20A409000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Got xpc error message: %s\n", (uint8_t *)&v6, 0xCu);
  }
}

void ReportMemoryExceptionFromTask(uint64_t a1, char a2, const char *a3, void *a4, void *a5)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  v11 = (void (**)(void, void))v10;
  if ((a1 - 1) >= 0xFFFFFFFE)
  {
    if (v10)
    {
      v14 = [MEMORY[0x263F087E8] errorWithDomain:MREErrorDomain code:9 userInfo:0];
      ((void (**)(void, void *))v11)[2](v11, v14);
    }
    goto LABEL_29;
  }
  unsigned int object_addr = 0;
  unsigned int object_type = 0;
  if (mach_port_kernel_object(*MEMORY[0x263EF8960], a1, &object_type, &object_addr)) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = object_type == 2;
  }
  if (!v12)
  {
    if (v11)
    {
      id v13 = [MEMORY[0x263F087E8] errorWithDomain:MREErrorDomain code:9 userInfo:0];
      ((void (**)(void, id))v11)[2](v11, v13);
LABEL_28:

      goto LABEL_29;
    }
    goto LABEL_29;
  }
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_20A40B520;
  v38 = sub_20A40B530;
  id v39 = 0;
  if (a3) {
    goto LABEL_13;
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_20A40B538;
  v33[3] = &unk_263FD8328;
  v33[4] = &v34;
  if ((sub_20A40B5E0(a1, v33) & 1) == 0)
  {
    int x = 0;
    if (pid_for_task(a1, &x)) {
      goto LABEL_18;
    }
    if ((proc_pidpath(x, buf, 0x400u) - 1) <= 0x3FE)
    {
      uint64_t v22 = [[NSString alloc] initWithUTF8String:buf];
      v23 = (void *)v35[5];
      v35[5] = v22;
    }
  }
  a3 = (const char *)[ (id) v35[5] UTF8String];
  if (a3)
  {
LABEL_13:
    BOOL v15 = strncmp(a3, "/usr/libexec/ReportMemoryException", 0x400uLL) == 0;
    _Block_object_dispose(&v34, 8);

    if (!v15)
    {
      if (SMJobIsEnabled())
      {
        uint64_t v16 = sub_20A40AAAC();
        if (v16)
        {
          v17 = (void *)v16;
          v24[0] = MEMORY[0x263EF8330];
          v24[1] = 3221225472;
          v24[2] = sub_20A40B168;
          v24[3] = &unk_263FD8300;
          v27 = v11;
          int v28 = a1;
          char v29 = a2;
          id v13 = v17;
          id v25 = v13;
          id v26 = v9;
          v18 = (void (**)(void, void))MEMORY[0x210519EB0](v24);
          v18[2](v18, 0);

          v19 = v27;
        }
        else
        {
          if (!v11)
          {
            id v13 = 0;
            goto LABEL_28;
          }
          v19 = [MEMORY[0x263F087E8] errorWithDomain:MREErrorDomain code:7 userInfo:0];
          ((void (**)(void, void *))v11)[2](v11, v19);
          id v13 = 0;
        }
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v43 = @"RME is disabled. To re-enable use 'ReportMemoryExceptionTool --enable'";
          _os_log_impl(&dword_20A409000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@. Aborting.", buf, 0xCu);
        }
        if (!v11) {
          goto LABEL_29;
        }
        v20 = (void *)MEMORY[0x263F087E8];
        v21 = MREErrorDomain;
        uint64_t v40 = *MEMORY[0x263F08320];
        v41 = @"RME is disabled. To re-enable use 'ReportMemoryExceptionTool --enable'";
        id v13 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        v19 = [v20 errorWithDomain:v21 code:17 userInfo:v13];
        ((void (**)(void, void *))v11)[2](v11, v19);
      }

      goto LABEL_28;
    }
    goto LABEL_19;
  }
LABEL_18:
  _Block_object_dispose(&v34, 8);

LABEL_19:
  if (v11)
  {
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:MREErrorDomain code:10 userInfo:0];
    ((void (**)(void, id))v11)[2](v11, v13);
    goto LABEL_28;
  }
LABEL_29:
}

void sub_20A40B140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A40B168(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    if (v5)
    {
      int v19 = 0;
      if (MEMORY[0x210519DB0](*MEMORY[0x263EF8960], *(unsigned int *)(a1 + 56), 0, &v19) != 15)
      {
        xpc_dictionary_set_int64(v5, "MessageType", 2);
        xpc_dictionary_set_mach_send();
        xpc_dictionary_set_BOOL(v5, "WithMemgraph", *(unsigned char *)(a1 + 60));
        v11 = *(void **)(a1 + 48);
        if (!v11)
        {
          xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v5);
          goto LABEL_14;
        }
        BOOL v12 = *(_xpc_connection_s **)(a1 + 32);
        id v13 = *(NSObject **)(a1 + 40);
        if (v13)
        {
          handler[0] = MEMORY[0x263EF8330];
          handler[1] = 3221225472;
          handler[2] = sub_20A40B3C0;
          handler[3] = &unk_263FD82D8;
          id v17 = v11;
          xpc_connection_send_message_with_reply(v12, v5, v13, handler);

          goto LABEL_14;
        }
        id v10 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 32), v5);
        uint64_t v14 = *(void *)(a1 + 48);
        BOOL v15 = sub_20A40B420(v10);
        (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

        goto LABEL_13;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20A409000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Timed out on authenticating. Skipping sending corpse to RME for analysis.", buf, 2u);
      }
      uint64_t v6 = *(void *)(a1 + 48);
      if (!v6) {
        goto LABEL_14;
      }
      v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = MREErrorDomain;
      uint64_t v9 = 15;
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 48);
      if (!v6)
      {
LABEL_14:

        goto LABEL_15;
      }
      v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = MREErrorDomain;
      uint64_t v9 = 6;
    }
    id v10 = [v7 errorWithDomain:v8 code:v9 userInfo:0];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v10);
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
LABEL_15:
}

void sub_20A40B3C0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  sub_20A40B420(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

id sub_20A40B420(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && MEMORY[0x21051A050](v1) == MEMORY[0x263EF8708])
  {
    string = (void *)xpc_dictionary_get_string(v2, "ErrorDomain");
    if (string)
    {
      int64_t int64 = xpc_dictionary_get_int64(v2, "ErrorCode");
      uint64_t v6 = (void *)MEMORY[0x263F087E8];
      v7 = (void *)[[NSString alloc] initWithUTF8String:string];
      string = [v6 errorWithDomain:v7 code:int64 userInfo:0];
    }
  }
  else
  {
    string = [MEMORY[0x263F087E8] errorWithDomain:MREErrorDomain code:7 userInfo:0];
  }

  return string;
}

uint64_t sub_20A40B520(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_20A40B530(uint64_t a1)
{
}

void sub_20A40B538(uint64_t a1, _DWORD *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (*a2 == 2063)
  {
    __strlcpy_chk();
    uint64_t v3 = [[NSString alloc] initWithUTF8String:v6];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    xpc_object_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

uint64_t sub_20A40B5E0(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if (!a1) {
    goto LABEL_12;
  }
  mach_vm_size_t v9 = 0;
  mach_vm_address_t kcd_addr_begin = 0;
  uint64_t v4 = (unsigned int *)MEMORY[0x263EF8960];
  if (task_map_corpse_info_64(*MEMORY[0x263EF8960], a1, &kcd_addr_begin, &v9))
  {
LABEL_11:
    a1 = 0;
    goto LABEL_12;
  }
  xpc_object_t v5 = (_DWORD *)kcd_addr_begin;
  unint64_t v6 = v9 + kcd_addr_begin;
  mach_vm_address_t v7 = kcd_addr_begin + 16;
  if (kcd_addr_begin + 16 > v9 + kcd_addr_begin
    || v7 + *(unsigned int *)(kcd_addr_begin + 4) > v6
    || *(_DWORD *)kcd_addr_begin != -559025833)
  {
    MEMORY[0x210519F70](*v4, kcd_addr_begin);
    goto LABEL_11;
  }
  do
  {
    if (v7 + v5[1] > v6) {
      break;
    }
    if (*v5 == -242132755) {
      break;
    }
    v3[2](v3, v5, v6);
    xpc_object_t v5 = (_DWORD *)(v7 + v5[1]);
    mach_vm_address_t v7 = (mach_vm_address_t)(v5 + 4);
  }
  while ((unint64_t)(v5 + 4) <= v6);
  MEMORY[0x210519F70](*v4, kcd_addr_begin, v9);
  a1 = 1;
LABEL_12:

  return a1;
}

uint64_t SMJobIsEnabled()
{
  return MEMORY[0x270F5CFF8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

kern_return_t mach_port_get_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_urefs_t *refs)
{
  return MEMORY[0x270EDA1F0](*(void *)&task, *(void *)&name, *(void *)&right, refs);
}

kern_return_t mach_port_kernel_object(ipc_space_read_t task, mach_port_name_t name, unsigned int *object_type, unsigned int *object_addr)
{
  return MEMORY[0x270EDA208](*(void *)&task, *(void *)&name, object_type, object_addr);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x270EDAC18](*(void *)&t, x);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD88](*(void *)&pid, buffer, *(void *)&buffersize);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

kern_return_t task_map_corpse_info_64(task_t task, task_read_t corspe_task, mach_vm_address_t *kcd_addr_begin, mach_vm_size_t *kcd_size)
{
  return MEMORY[0x270EDB870](*(void *)&task, *(void *)&corspe_task, kcd_addr_begin, kcd_size);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x270EDBA90](*(void *)&target_task, address, size);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
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
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
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

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x270EDC128]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}