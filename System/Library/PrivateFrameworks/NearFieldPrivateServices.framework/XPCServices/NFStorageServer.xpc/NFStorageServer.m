int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;

  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

uint64_t NFLogGetLogger()
{
  return _NFLogGetLogger();
}

uint64_t NFSharedLogGetLogger()
{
  return _NFSharedLogGetLogger();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

BOOL class_isMetaClass(Class cls)
{
  return _class_isMetaClass(cls);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
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

Class object_getClass(id a1)
{
  return _object_getClass(a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return _object_getClassName(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

const char *__cdecl sel_getName(SEL sel)
{
  return _sel_getName(sel);
}

id objc_msgSend_deleteAllAppletEntities(void *a1, const char *a2, ...)
{
  return [a1 deleteAllAppletEntities];
}

id objc_msgSend_deleteAllESEExpressEntities(void *a1, const char *a2, ...)
{
  return [a1 deleteAllESEExpressEntities];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}