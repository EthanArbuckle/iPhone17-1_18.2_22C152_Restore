id OUTLINED_FUNCTION_0(id a1)
{
  uint64_t v1;

  return a1;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_0_0(id a1)
{
  return a1;
}

id HDRPOxygenSaturationRecordingFeatureAvailabilityProvider(void *a1)
{
  uint64_t v1 = *MEMORY[0x263F097B8];
  v2 = (void *)MEMORY[0x263F0A980];
  id v3 = a1;
  v4 = [v2 sharedBehavior];
  char v5 = [v4 isAppleWatch];

  if (v5) {
    v6 = 0;
  }
  else {
    v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"BD3A4341-7090-4622-9694-2AC0F536C478"];
  }
  id v7 = objc_alloc(MEMORY[0x263F43228]);
  v8 = [MEMORY[0x263F641F8] allowedCountrySet];
  v9 = [v3 daemon];
  v25 = (void *)[v7 initWithFeatureIdentifier:v1 defaultCountrySet:v8 healthDaemon:v9];

  id v10 = objc_alloc(MEMORY[0x263F432B8]);
  v11 = HKRPOxygenSaturationLocalFeatureAttributes();
  v12 = (void *)[v10 initWithFeatureIdentifier:v1 localFeatureAttributes:v11 localCountrySetAvailabilityProvider:v25];

  [v12 synchronizeLocalProperties];
  id v13 = objc_alloc(MEMORY[0x263F43150]);
  v14 = [v3 daemon];
  v15 = (void *)MEMORY[0x263F09950];
  v16 = (void *)[v13 initWithDaemon:v14 allowedCountriesDataSource:v12 loggingCategory:*MEMORY[0x263F09950]];

  v17 = (void *)[objc_alloc(MEMORY[0x263F43440]) initWithAllowedCountriesDataSource:v16 profile:v3 featureCapability:v6 loggingCategory:*v15];
  id v18 = objc_alloc(MEMORY[0x263F432A8]);
  v19 = [v3 daemon];
  v20 = (void *)[v18 initWithDaemon:v19 featureIdentifier:v1];

  id v21 = objc_alloc(MEMORY[0x263F431E8]);
  v22 = HKRPOxygenSaturationFeatureAvailabilityRequirements();
  v23 = (void *)[v21 initWithProfile:v3 featureIdentifier:v1 availabilityRequirements:v22 currentOnboardingVersion:1 pairedDeviceCapability:v6 regionAvailabilityProvider:v17 disableAndExpiryProvider:v20 loggingCategory:*v15];

  return v23;
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x270F18A30]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

uint64_t HDDataEntityPredicateForObjectsFromAppleWatchSources()
{
  return MEMORY[0x270F31998]();
}

uint64_t HDSampleEntityPredicateForDateInterval()
{
  return MEMORY[0x270F31A08]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x270EF3660]();
}

uint64_t HKCreateSerialDispatchQueueWithQOSClass()
{
  return MEMORY[0x270EF3668]();
}

uint64_t HKImproveHealthAndActivityAnalyticsAllowed()
{
  return MEMORY[0x270EF3710]();
}

uint64_t HKOxygenSaturationLowBarometricPressureThresholdQuantity()
{
  return MEMORY[0x270EF37C8]();
}

uint64_t HKRPOxygenSaturationFeatureAvailabilityRequirements()
{
  return MEMORY[0x270F5BD48]();
}

uint64_t HKRPOxygenSaturationLocalFeatureAttributes()
{
  return MEMORY[0x270F5BD50]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x270EF3970]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x270EF3978]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}