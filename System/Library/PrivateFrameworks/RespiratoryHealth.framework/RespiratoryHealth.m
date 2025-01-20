uint64_t HKRPShouldSkipHardwareCheck()
{
  void *v0;
  uint64_t v1;

  v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v1 = [v0 BOOLForKey:@"HKRPSkipHardwareCheck"];

  return v1;
}

id HKRPOxygenSaturationFeatureAvailabilityRequirements()
{
  v26[4] = *MEMORY[0x263EF8340];
  v0 = (void *)*MEMORY[0x263F097B8];
  id v15 = objc_alloc(MEMORY[0x263F0A3A0]);
  v25[0] = *MEMORY[0x263F09580];
  v21 = [MEMORY[0x263F0A3A8] notInStoreDemoMode];
  v24[0] = v21;
  v20 = [MEMORY[0x263F0A3A8] profileIsNotFamilySetupPairingProfile];
  v24[1] = v20;
  v19 = [MEMORY[0x263F0A3A8] notAgeGatedForUserDefaultsKey:*MEMORY[0x263F098A0]];
  v24[2] = v19;
  v18 = [MEMORY[0x263F0A3A8] activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:v0];
  v24[3] = v18;
  v17 = [MEMORY[0x263F0A3A8] capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v0];
  v24[4] = v17;
  v16 = [MEMORY[0x263F0A3A8] countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v0 isSupportedIfCountryListMissing:0];
  v24[5] = v16;
  v14 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v0];
  v24[6] = v14;
  v13 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v0];
  v24[7] = v13;
  v12 = [MEMORY[0x263F0A3A8] activeWatchIsNotUnderInternalDevelopmentImportExclusionForFeatureWithIdentifier:v0];
  v24[8] = v12;
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:9];
  v26[0] = v1;
  v25[1] = *MEMORY[0x263F09588];
  v2 = [MEMORY[0x263F0A3A8] capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:v0 supportedOnLocalDevice:MGGetBoolAnswer()];
  v23[0] = v2;
  v3 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v0];
  v23[1] = v3;
  v4 = [MEMORY[0x263F0A3A8] currentCountryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v0];
  v23[2] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:3];
  v26[1] = v5;
  v25[2] = *MEMORY[0x263F095D8];
  v6 = HKRPUsageRequirementsForFeatureIdentifier(v0);
  v22 = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
  v26[2] = v7;
  v25[3] = *MEMORY[0x263F09600];
  v8 = HKRPUsageRequirementsForFeatureIdentifier(v0);
  v26[3] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
  v10 = (void *)[v15 initWithRequirementsByContext:v9];

  return v10;
}

id HKRPUsageRequirementsForFeatureIdentifier(void *a1)
{
  v16[11] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263F0A3A8];
  id v2 = a1;
  id v15 = [v1 profileIsNotFamilySetupPairingProfile];
  v16[0] = v15;
  v14 = [MEMORY[0x263F0A3A8] notAgeGatedForUserDefaultsKey:*MEMORY[0x263F098A0]];
  v16[1] = v14;
  v3 = [MEMORY[0x263F0A3A8] activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:v2];
  v16[2] = v3;
  v4 = [MEMORY[0x263F0A3A8] capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:v2 supportedOnLocalDevice:MGGetBoolAnswer()];
  v16[3] = v4;
  v5 = [MEMORY[0x263F0A3A8] bloodOxygenRecordingsAreEnabled];
  v16[4] = v5;
  v6 = [MEMORY[0x263F0A3A8] onboardingRecordIsPresentForFeatureWithIdentifier:v2];
  v16[5] = v6;
  v7 = [MEMORY[0x263F0A3A8] countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v2 isSupportedIfCountryListMissing:0];
  v16[6] = v7;
  v8 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v2];
  v16[7] = v8;
  v9 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v2];
  v16[8] = v9;
  v10 = [MEMORY[0x263F0A3A8] healthAppIsNotHidden];
  v16[9] = v10;
  v11 = [MEMORY[0x263F0A3A8] activeWatchIsNotUnderInternalDevelopmentImportExclusionForFeatureWithIdentifier:v2];

  v16[10] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:11];

  return v12;
}

void sub_21D4347F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21D434C38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_0(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return objc_opt_class();
}

id HKRPLocalizedString(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F086E0];
  id v2 = a1;
  v3 = [v1 bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:v2 value:&stru_26CDD25C8 table:0];

  return v4;
}

__CFString *HKRPStringFromHKRPOxygenSaturationSessionEndReason(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Completed";
  }
  else {
    return off_264447468[a1 - 1];
  }
}

uint64_t HKRPShouldSkipRegionCheck()
{
  uint64_t v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"HKRPSkipRegionCheck"];

  return v1;
}

uint64_t HKRPShouldSkipOnboardingCompletedCheck()
{
  uint64_t v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"HKRPSkipOnboardingCompletedCheck"];

  return v1;
}

uint64_t HKRPShouldInstallOxygenSaturationWatchAppOnPairedWatch(void *a1)
{
  id v1 = a1;
  id v2 = [[HKRPWatchAppInstallability alloc] initWithDevice:v1];

  uint64_t v3 = [(HKRPWatchAppInstallability *)v2 shouldInstallWatchApp];
  return v3;
}

uint64_t HKRPOxygenSaturationLocalFeatureAttributes()
{
  return [MEMORY[0x263F0A380] featureAttributesDerivedFromOSBuildAndFeatureVersion:*MEMORY[0x263F09B78]];
}

uint64_t sub_21D436C88()
{
  uint64_t v0 = sub_21D437588();
  __swift_allocate_value_buffer(v0, qword_267D10BC8);
  __swift_project_value_buffer(v0, (uint64_t)qword_267D10BC8);
  return sub_21D437578();
}

uint64_t static Logger.bloodOxygen.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_267D10BC0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_21D437588();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_267D10BC8);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_21D437578()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_21D437588()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x270EF3660]();
}

uint64_t HKPreferredRegulatoryDomainProvider()
{
  return MEMORY[0x270EF37D0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t NSStringFromHKFeatureAvailabilityOnboardedCountrySupportedState()
{
  return MEMORY[0x270EF38C8]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x270EF3970]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}