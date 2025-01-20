void init_dispatch_vfs(uint64_t a1)
{
  qword_4168 = (uint64_t)os_log_create("com.apple.dispatch.vfs", (const char *)&unk_3F07);
  *(void *)malloc_type_calloc(1uLL, 0x18uLL, 0xA0040114AFA65uLL) = a1;
  xpc_event_provider_create();
}

void sub_371C(uint64_t a1, uint64_t a2, void *a3, char *context)
{
  if (qword_4170 != -1) {
    dispatch_once_f(&qword_4170, context, (dispatch_function_t)sub_3880);
  }
  if (a1 == 2)
  {
    v9 = (void **)(context + 16);
    v10 = context + 16;
    while (1)
    {
      v10 = (void *)*v10;
      if (!v10) {
        break;
      }
      if (v10[1] == a2)
      {
        for (i = *v9; i != v10; i = (void *)*i)
          v9 = (void **)i;
        *v9 = (void *)*v10;
        free(v10);
        return;
      }
    }
  }
  else if (a1 == 1)
  {
    v8 = malloc_type_calloc(1uLL, 0x28uLL, 0x102004065753CD5uLL);
    v8[1] = a2;
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 0x40000000;
    applier[2] = sub_39BC;
    applier[3] = &unk_40F8;
    applier[4] = v8;
    xpc_dictionary_apply(a3, applier);
    void *v8 = *((void *)context + 2);
    *((void *)context + 2) = v8;
  }
}

void sub_3880()
{
  v1[0] = 0;
  v1[1] = v1;
  v1[2] = 0x2000000000;
  v1[3] = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_3B38;
  block[3] = &unk_4120;
  block[4] = v1;
  if (qword_4178 != -1) {
    dispatch_once(&qword_4178, block);
  }
  xpc_event_provider_get_queue();
}

uint64_t sub_39BC(uint64_t a1, char *__s1, void *a3)
{
  if (a3 != &_xpc_BOOL_false)
  {
    if (!strcmp(__s1, "LowDisk"))
    {
      if (a3 == &_xpc_BOOL_true || xpc_get_type(a3) == (xpc_type_t)&_xpc_type_int64)
      {
        *(void *)(*(void *)(a1 + 32) + 32) |= 0x1204uLL;
        if (xpc_get_type(a3) == (xpc_type_t)&_xpc_type_int64) {
          *(void *)(*(void *)(a1 + 32) + 16) = xpc_int64_get_value(a3);
        }
      }
    }
    else if (!strcmp(__s1, "VeryLowDisk"))
    {
      if (a3 == &_xpc_BOOL_true || xpc_get_type(a3) == (xpc_type_t)&_xpc_type_int64)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(void *)(v7 + 32) | 0x1200;
        goto LABEL_17;
      }
    }
    else if (!strcmp(__s1, "NearLowDisk"))
    {
      if (a3 == &_xpc_BOOL_true)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(void *)(v7 + 32) | 0x2000;
        goto LABEL_17;
      }
    }
    else
    {
      int v6 = strcmp(__s1, "DesiredDisk");
      if (a3 == &_xpc_BOOL_true && !v6)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(void *)(v7 + 32) | 0x4000;
LABEL_17:
        *(void *)(v7 + 32) = v8;
      }
    }
  }
  return 1;
}

uint64_t sub_3B38(uint64_t a1)
{
  mach_timebase_info info = 0;
  uint64_t result = mach_timebase_info(&info);
  double v3 = 1.0;
  if (!result) {
    double v3 = (double)(info.numer / info.denom);
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
  return result;
}

void sub_3B8C(uint64_t a1)
{
  uintptr_t data = dispatch_source_get_data((dispatch_source_t)qword_4180);
  double v3 = qword_4168;
  if (os_log_type_enabled((os_log_t)qword_4168, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    uintptr_t v11 = data;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Got VFS event: %lu", (uint8_t *)&v10, 0xCu);
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v4, "_Flags", data);
  uint64_t v5 = mach_absolute_time();
  int v6 = *(void **)(*(void *)(a1 + 40) + 16);
  if (v6)
  {
    unint64_t v7 = (unint64_t)(*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) * (double)v5);
    do
    {
      if ((v6[4] & data) != 0
        && ((v6[4] & data) != 4 || (uint64_t v8 = v6[2]) == 0 || v8 >= 1 && ((v9 = v6[3]) == 0 || v9 + 1000000000 * v8 <= v7)))
      {
        v6[3] = v7;
        xpc_event_provider_token_fire();
      }
      int v6 = (void *)*v6;
    }
    while (v6);
  }
  xpc_release(v4);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

void dispatch_resume(dispatch_object_t object)
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

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_event_provider_create()
{
  while (1)
    ;
}

void xpc_event_provider_get_queue()
{
  while (1)
    ;
}

void xpc_event_provider_token_fire()
{
  while (1)
    ;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
}

void xpc_release(xpc_object_t object)
{
}