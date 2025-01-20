id _mo_log_facility_get_os_log(dispatch_once_t *predicate)
{
  void *v2;
  uint64_t vars8;

  if (*predicate != -1) {
    dispatch_once_f(predicate, predicate, (dispatch_function_t)_mo_log_facility_prepare);
  }
  v2 = (void *)predicate[2];
  return v2;
}

os_log_t _mo_log_facility_prepare(uint64_t a1)
{
  os_log_t result = os_log_create("com.apple.MomentsIntelligenceService", *(const char **)(a1 + 8));
  *(void *)(a1 + 16) = result;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_opt_new();
  v4 = _mo_log_facility_get_os_log(&MOLogFacilityIntelligence);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MIService,Starting MomentsIntelligenceService delegate and attempting connection to XPC listener", v7, 2u);
  }

  v5 = +[NSXPCListener serviceListener];
  [v5 setDelegate:v3];
  [v5 resume];

  return 0;
}

BOOL static GenerativeModelsAvailable.isGenerativeModelAvailable()()
{
  uint64_t v0 = type metadata accessor for GenerativeModelsAvailability.Availability();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for GenerativeModelsAvailability.Parameters();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for GenerativeModelsAvailability();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  GenerativeModelsAvailability.Parameters.init(useCaseIdentifiers:)();
  static GenerativeModelsAvailability.current(parameters:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  GenerativeModelsAvailability.availability.getter();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  BOOL v12 = (*(unsigned int (**)(char *, uint64_t))(v1 + 88))(v3, v0) == enum case for GenerativeModelsAvailability.Availability.available(_:);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v12;
}

id GenerativeModelsAvailable.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

id GenerativeModelsAvailable.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GenerativeModelsAvailable();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for GenerativeModelsAvailable()
{
  return self;
}

id GenerativeModelsAvailable.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GenerativeModelsAvailable();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for GenerativeModelsAvailability.Availability()
{
  return type metadata accessor for GenerativeModelsAvailability.Availability();
}

uint64_t GenerativeModelsAvailability.Parameters.init(useCaseIdentifiers:)()
{
  return GenerativeModelsAvailability.Parameters.init(useCaseIdentifiers:)();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.Parameters()
{
  return type metadata accessor for GenerativeModelsAvailability.Parameters();
}

uint64_t GenerativeModelsAvailability.availability.getter()
{
  return GenerativeModelsAvailability.availability.getter();
}

uint64_t static GenerativeModelsAvailability.current(parameters:)()
{
  return static GenerativeModelsAvailability.current(parameters:)();
}

uint64_t type metadata accessor for GenerativeModelsAvailability()
{
  return type metadata accessor for GenerativeModelsAvailability();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_clearMemoryAndExitCleanly(void *a1, const char *a2, ...)
{
  return _[a1 clearMemoryAndExitCleanly];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_interruptionHandler(void *a1, const char *a2, ...)
{
  return _[a1 interruptionHandler];
}

id objc_msgSend_invalidationHandler(void *a1, const char *a2, ...)
{
  return _[a1 invalidationHandler];
}

id objc_msgSend_isGenerativeModelAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isGenerativeModelAvailable];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_releaseOSTransaction(void *a1, const char *a2, ...)
{
  return _[a1 releaseOSTransaction];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return _[a1 serviceListener];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_takeOSTransaction(void *a1, const char *a2, ...)
{
  return _[a1 takeOSTransaction];
}