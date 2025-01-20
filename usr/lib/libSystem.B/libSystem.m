int *libSystem_initializer()
{
  uint64_t v0;
  void *v1;
  xpc_object_t empty;
  void *v3;
  NSObject *v4;
  int *result;

  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace();
  }
  __libkernel_init();
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace();
  }
  __libplatform_init();
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace();
  }
  __pthread_init();
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace();
  }
  _libc_initializer();
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace();
  }
  _sanitizers_init();
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace();
  }
  __malloc_init();
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace();
  }
  _dyld_initializer();
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace();
  }
  __pthread_late_init();
  libdispatch_init();
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace();
  }
  _libxpc_initializer();
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace();
  }
  _libtrace_init();
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace();
  }
  _container_init();
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace();
  }
  __libdarwin_init();
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace();
  }
  os_variant_has_internal_diagnostics();
  __malloc_late_init();
  if (getpid() != 1
    && os_variant_allows_internal_security_policies()
    && _os_feature_enabled_impl())
  {
    __libkernel_init_late();
  }
  if (_simple_getenv())
  {
    v0 = xpc_pipe_create();
    if (!v0)
    {
      v4 = os_log_create("com.apple.libsystem", "duet.prewarm");
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
    v1 = (void *)v0;
    empty = xpc_dictionary_create_empty();
    if (empty)
    {
      v3 = empty;
      xpc_pipe_routine();
      xpc_release(v1);
      xpc_release(v3);
      goto LABEL_39;
    }
    xpc_release(v1);
    v4 = os_log_create("com.apple.libsystem", "duet.prewarm");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
LABEL_38:
    }
      libSystem_initializer_cold_1(v4);
  }
LABEL_39:
  if (MEMORY[0xFFFFFC100]) {
    kdebug_trace();
  }
  result = __error();
  *result = 0;
  return result;
}

uint64_t libSystem_atfork_prepare(char a1)
{
  _dyld_dlopen_atfork_prepare();
  if ((a1 & 1) == 0) {
    _pthread_atfork_prepare_handlers();
  }
  _libSC_info_fork_prepare();
  xpc_atfork_prepare();
  dispatch_atfork_prepare();
  _dyld_atfork_prepare();
  _malloc_fork_prepare();
  uint64_t v2 = cc_atfork_prepare();
  uint64_t v3 = MEMORY[0x21055F340](v2);

  return __pthread_atfork_prepare(v3);
}

uint64_t libSystem_atfork_parent(char a1)
{
  _pthread_atfork_parent();
  cc_atfork_parent();
  uint64_t v2 = _malloc_fork_parent();
  MEMORY[0x21055F330](v2);
  _dyld_atfork_parent();
  dispatch_atfork_parent();
  xpc_atfork_parent();
  _libSC_info_fork_parent();
  uint64_t result = _dyld_dlopen_atfork_parent();
  if ((a1 & 1) == 0)
  {
    return __pthread_atfork_parent_handlers(result);
  }
  return result;
}

uint64_t libSystem_atfork_child(char a1)
{
  _mach_fork_child();
  _pthread_atfork_child();
  cc_atfork_child();
  _malloc_fork_child();
  _libc_fork_child();
  _dyld_fork_child();
  dispatch_atfork_child();
  _libcoreservices_fork_child();
  _asl_fork_child();
  _notify_fork_child();
  xpc_atfork_child();
  _libtrace_fork_child();
  _libSC_info_fork_child();
  uint64_t result = _dyld_dlopen_atfork_child();
  if ((a1 & 1) == 0)
  {
    return __pthread_atfork_child_handlers(result);
  }
  return result;
}

uint64_t libSystem_init_after_boot_tasks_4launchd()
{
  uint64_t result = os_variant_allows_internal_security_policies();
  if (result)
  {
    uint64_t result = _os_feature_enabled_impl();
    if (result) {
      return __libkernel_init_after_boot_tasks();
    }
  }
  return result;
}

void libSystem_initializer_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20D89F000, log, OS_LOG_TYPE_FAULT, "Libsystem end prewarm failed to look up mach service", v1, 2u);
}

int *__error(void)
{
  return ___error();
}

uint64_t __libdarwin_init()
{
  return ___libdarwin_init();
}

uint64_t __libkernel_init()
{
  return ___libkernel_init();
}

uint64_t __libkernel_init_after_boot_tasks()
{
  return ___libkernel_init_after_boot_tasks();
}

uint64_t __libkernel_init_late()
{
  return ___libkernel_init_late();
}

uint64_t __libplatform_init()
{
  return ___libplatform_init();
}

uint64_t __malloc_init()
{
  return ___malloc_init();
}

uint64_t __malloc_late_init()
{
  return ___malloc_late_init();
}

uint64_t __pthread_init()
{
  return ___pthread_init();
}

uint64_t __pthread_late_init()
{
  return ___pthread_late_init();
}

uint64_t _asl_fork_child()
{
  return __asl_fork_child();
}

uint64_t _container_init()
{
  return __container_init();
}

uint64_t _dyld_atfork_parent()
{
  return __dyld_atfork_parent();
}

uint64_t _dyld_atfork_prepare()
{
  return __dyld_atfork_prepare();
}

uint64_t _dyld_dlopen_atfork_child()
{
  return __dyld_dlopen_atfork_child();
}

uint64_t _dyld_dlopen_atfork_parent()
{
  return __dyld_dlopen_atfork_parent();
}

uint64_t _dyld_dlopen_atfork_prepare()
{
  return __dyld_dlopen_atfork_prepare();
}

uint64_t _dyld_fork_child()
{
  return __dyld_fork_child();
}

uint64_t _dyld_initializer()
{
  return __dyld_initializer();
}

uint64_t _libSC_info_fork_child()
{
  return __libSC_info_fork_child();
}

uint64_t _libSC_info_fork_parent()
{
  return __libSC_info_fork_parent();
}

uint64_t _libSC_info_fork_prepare()
{
  return __libSC_info_fork_prepare();
}

uint64_t _libc_fork_child()
{
  return __libc_fork_child();
}

uint64_t _libc_fork_parent()
{
  return __libc_fork_parent();
}

uint64_t _libc_fork_prepare()
{
  return __libc_fork_prepare();
}

uint64_t _libc_initializer()
{
  return __libc_initializer();
}

uint64_t _libcoreservices_fork_child()
{
  return __libcoreservices_fork_child();
}

uint64_t _libtrace_fork_child()
{
  return __libtrace_fork_child();
}

uint64_t _libtrace_init()
{
  return __libtrace_init();
}

uint64_t _libxpc_initializer()
{
  return __libxpc_initializer();
}

uint64_t _mach_fork_child()
{
  return __mach_fork_child();
}

uint64_t _malloc_fork_child()
{
  return __malloc_fork_child();
}

uint64_t _malloc_fork_parent()
{
  return __malloc_fork_parent();
}

uint64_t _malloc_fork_prepare()
{
  return __malloc_fork_prepare();
}

uint64_t _notify_fork_child()
{
  return __notify_fork_child();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _pthread_atfork_child()
{
  return __pthread_atfork_child();
}

uint64_t _pthread_atfork_parent()
{
  return __pthread_atfork_parent();
}

uint64_t _pthread_atfork_prepare_handlers()
{
  return __pthread_atfork_prepare_handlers();
}

uint64_t _sanitizers_init()
{
  return __sanitizers_init();
}

uint64_t _simple_getenv()
{
  return __simple_getenv();
}

uint64_t cc_atfork_child()
{
  return _cc_atfork_child();
}

uint64_t cc_atfork_parent()
{
  return _cc_atfork_parent();
}

uint64_t cc_atfork_prepare()
{
  return _cc_atfork_prepare();
}

uint64_t dispatch_atfork_child()
{
  return _dispatch_atfork_child();
}

uint64_t dispatch_atfork_parent()
{
  return _dispatch_atfork_parent();
}

uint64_t dispatch_atfork_prepare()
{
  return _dispatch_atfork_prepare();
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

uint64_t libdispatch_init()
{
  return _libdispatch_init();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

uint64_t xpc_atfork_child()
{
  return _xpc_atfork_child();
}

uint64_t xpc_atfork_parent()
{
  return _xpc_atfork_parent();
}

uint64_t xpc_atfork_prepare()
{
  return _xpc_atfork_prepare();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return _xpc_dictionary_create_empty();
}

uint64_t xpc_pipe_create()
{
  return _xpc_pipe_create();
}

uint64_t xpc_pipe_routine()
{
  return _xpc_pipe_routine();
}

void xpc_release(xpc_object_t object)
{
}