Class __initMKMapItem_block_invoke()
{
  Class result;

  if (!MapKitLibrary_frameworkLibrary)
  {
    MapKitLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/MapKit.framework/MapKit", 2);
    if (!MapKitLibrary_frameworkLibrary) {
      __assert_rtn("MapKitLibrary", "STMapItem.m", 22, "frameworkLibrary");
    }
  }
  result = objc_getClass("MKMapItem");
  classMKMapItem = (uint64_t)result;
  if (!result) {
    __assert_rtn("initMKMapItem_block_invoke", "STMapItem.m", 23, "classMKMapItem");
  }
  return result;
}

id initINVocabularyUpdater()
{
  if (initINVocabularyUpdater_sOnce != -1) {
    dispatch_once(&initINVocabularyUpdater_sOnce, &__block_literal_global_346);
  }
  v0 = (void *)classINVocabularyUpdater;
  return v0;
}

Class __initINVocabularyUpdater_block_invoke()
{
  if (!IntentsLibrary_frameworkLibrary)
  {
    IntentsLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/Intents.framework/Intents", 2);
    if (!IntentsLibrary_frameworkLibrary) {
      __assert_rtn("IntentsLibrary", "STGenericIntentUtilities.m", 28, "frameworkLibrary");
    }
  }
  Class result = objc_getClass("INVocabularyUpdater");
  classINVocabularyUpdater = (uint64_t)result;
  if (!result) {
    __assert_rtn("initINVocabularyUpdater_block_invoke", "STGenericIntentUtilities.m", 29, "classINVocabularyUpdater");
  }
  getINVocabularyUpdaterClass = INVocabularyUpdaterFunction;
  return result;
}

id INVocabularyUpdaterFunction()
{
  return (id)classINVocabularyUpdater;
}

id initHKQuantity()
{
  if (initHKQuantity_sOnce != -1) {
    dispatch_once(&initHKQuantity_sOnce, &__block_literal_global_1494);
  }
  v0 = (void *)classHKQuantity;
  return v0;
}

Class __initHKQuantity_block_invoke()
{
  if (HealthKitLibrary_sOnce != -1) {
    dispatch_once(&HealthKitLibrary_sOnce, &__block_literal_global_64);
  }
  Class result = objc_getClass("HKQuantity");
  classHKQuantity = (uint64_t)result;
  getHKQuantityClass = HKQuantityFunction;
  return result;
}

id HKQuantityFunction()
{
  return (id)classHKQuantity;
}

void *__HealthKitLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/HealthKit.framework/HealthKit", 2);
  HealthKitLibrary_sLib = (uint64_t)result;
  return result;
}

__CFString *STStringFromGenericIntentResponseCode(unint64_t a1)
{
  if (a1 >= 3)
  {
    v2 = NSString;
    v3 = [NSNumber numberWithInteger:a1];
    v1 = [v2 stringWithFormat:@"INVALID_STGenericIntentResponseCode_%@", v3];
  }
  else
  {
    v1 = off_264762508[a1];
  }
  return v1;
}

uint64_t AFLogInitIfNeeded()
{
  return MEMORY[0x270F0EE10]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}