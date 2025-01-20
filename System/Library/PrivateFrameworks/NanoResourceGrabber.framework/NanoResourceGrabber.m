void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t mapNRGIconVariantToLI(uint64_t a1)
{
  if (mapNRGIconVariantToLI_onceToken != -1) {
    dispatch_once(&mapNRGIconVariantToLI_onceToken, &__block_literal_global);
  }
  v2 = (void *)mapNRGIconVariantToLI_nrgToLIMap;
  v3 = [NSNumber numberWithInt:a1];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = [v4 integerValue];

  if (!v5)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = [NSString stringWithUTF8String:"LIIconVariant mapNRGIconVariantToLI(NRGIconVariant)"];
    uint64_t v9 = [NSNumber numberWithUnsignedInt:0];
    v10 = [NSNumber numberWithInt:a1];
    [v7 handleFailureInFunction:v8, @"NRGProtocols.m", 39, @"unknown icon variant %@ generated from %@", v9, v10 file lineNumber description];
  }
  return v5;
}

void __mapNRGIconVariantToLI_block_invoke()
{
  v3[16] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26CCB29D8;
  v2[1] = &unk_26CCB2A08;
  v3[0] = &unk_26CCB29F0;
  v3[1] = &unk_26CCB2A20;
  v2[2] = &unk_26CCB2A38;
  v2[3] = &unk_26CCB2A68;
  v3[2] = &unk_26CCB2A50;
  v3[3] = &unk_26CCB2A80;
  v2[4] = &unk_26CCB2A98;
  v2[5] = &unk_26CCB2AC8;
  v3[4] = &unk_26CCB2AB0;
  v3[5] = &unk_26CCB2AE0;
  v2[6] = &unk_26CCB2AF8;
  v2[7] = &unk_26CCB2B28;
  v3[6] = &unk_26CCB2B10;
  v3[7] = &unk_26CCB2B40;
  v2[8] = &unk_26CCB2B58;
  v2[9] = &unk_26CCB2B88;
  v3[8] = &unk_26CCB2B70;
  v3[9] = &unk_26CCB2BA0;
  v2[10] = &unk_26CCB2BB8;
  v2[11] = &unk_26CCB2BE8;
  v3[10] = &unk_26CCB2BD0;
  v3[11] = &unk_26CCB2C00;
  v2[12] = &unk_26CCB2C18;
  v2[13] = &unk_26CCB2C48;
  v3[12] = &unk_26CCB2C30;
  v3[13] = &unk_26CCB2C60;
  v2[14] = &unk_26CCB2C78;
  v2[15] = &unk_26CCB2CA8;
  v3[14] = &unk_26CCB2C90;
  v3[15] = &unk_26CCB2CC0;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:16];
  v1 = (void *)mapNRGIconVariantToLI_nrgToLIMap;
  mapNRGIconVariantToLI_nrgToLIMap = v0;
}

uint64_t mapLIIconVariantToNRG(uint64_t a1)
{
  if (mapLIIconVariantToNRG_onceToken != -1) {
    dispatch_once(&mapLIIconVariantToNRG_onceToken, &__block_literal_global_81);
  }
  v2 = (void *)mapLIIconVariantToNRG_liToNRGMap;
  v3 = [NSNumber numberWithUnsignedInt:a1];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = [v4 integerValue];

  if ((int)v5 <= 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = [NSString stringWithUTF8String:"NRGIconVariant mapLIIconVariantToNRG(LIIconVariant)"];
    uint64_t v9 = [NSNumber numberWithUnsignedInt:a1];
    v10 = [NSNumber numberWithInt:v5];
    [v7 handleFailureInFunction:v8, @"NRGProtocols.m", 67, @"unknown icon variant %@ generated %@ LIIconVariantNanoCircular108pt2x is %@", v9, v10, &unk_26CCB2CC0 file lineNumber description];
  }
  return v5;
}

void __mapLIIconVariantToNRG_block_invoke()
{
  v3[16] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26CCB29F0;
  v2[1] = &unk_26CCB2A20;
  v3[0] = &unk_26CCB29D8;
  v3[1] = &unk_26CCB2A08;
  v2[2] = &unk_26CCB2A50;
  v2[3] = &unk_26CCB2A80;
  v3[2] = &unk_26CCB2A38;
  v3[3] = &unk_26CCB2A68;
  v2[4] = &unk_26CCB2AB0;
  v2[5] = &unk_26CCB2AE0;
  v3[4] = &unk_26CCB2A98;
  v3[5] = &unk_26CCB2AC8;
  v2[6] = &unk_26CCB2B10;
  v2[7] = &unk_26CCB2B40;
  v3[6] = &unk_26CCB2AF8;
  v3[7] = &unk_26CCB2B28;
  v2[8] = &unk_26CCB2B70;
  v2[9] = &unk_26CCB2BA0;
  v3[8] = &unk_26CCB2B58;
  v3[9] = &unk_26CCB2B88;
  v2[10] = &unk_26CCB2BD0;
  v2[11] = &unk_26CCB2C00;
  v3[10] = &unk_26CCB2BB8;
  v3[11] = &unk_26CCB2BE8;
  v2[12] = &unk_26CCB2C30;
  v2[13] = &unk_26CCB2C60;
  v3[12] = &unk_26CCB2C18;
  v3[13] = &unk_26CCB2C48;
  v2[14] = &unk_26CCB2C90;
  v2[15] = &unk_26CCB2CC0;
  v3[14] = &unk_26CCB2C78;
  v3[15] = &unk_26CCB2CA8;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:16];
  v1 = (void *)mapLIIconVariantToNRG_liToNRGMap;
  mapLIIconVariantToNRG_liToNRGMap = v0;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_21C50E74C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C50EB30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C50EDBC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_21C50EEEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

id NRGGetActivePairedDevice()
{
  uint64_t v0 = [MEMORY[0x263F57730] sharedInstance];
  v1 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
  uint64_t v2 = [v0 getAllDevicesWithArchivedAltAccountDevicesMatching:v1];
  v3 = [v2 firstObject];

  uint64_t v4 = [v3 valueForProperty:*MEMORY[0x263F575B8]];
  if ([v4 BOOLValue]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v3;
  }
  id v6 = v5;

  return v6;
}

id NRGGetActivePairedDeviceStorePath()
{
  uint64_t v0 = NRGGetActivePairedDevice();
  v1 = [v0 valueForProperty:*MEMORY[0x263F575E8]];

  return v1;
}

void NRGWaitForActivePairedDeviceStorePath(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263F57730] sharedInstance];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __NRGWaitForActivePairedDeviceStorePath_block_invoke;
  v4[3] = &unk_264407DA8;
  id v5 = v1;
  id v3 = v1;
  [v2 waitForAltAccountPairingStorePathPairingID:v4];
}

uint64_t __NRGWaitForActivePairedDeviceStorePath_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id nrg_framework_log()
{
  if (nrg_framework_log_onceToken != -1) {
    dispatch_once(&nrg_framework_log_onceToken, &__block_literal_global_1);
  }
  uint64_t v0 = (void *)nrg_framework_log___logger;
  return v0;
}

uint64_t __nrg_framework_log_block_invoke()
{
  nrg_framework_log___logger = (uint64_t)os_log_create("com.apple.NanoResourceGrabber", "framework");
  return MEMORY[0x270F9A758]();
}

id nrg_daemon_log()
{
  if (nrg_daemon_log_onceToken != -1) {
    dispatch_once(&nrg_daemon_log_onceToken, &__block_literal_global_4_0);
  }
  uint64_t v0 = (void *)nrg_daemon_log___logger;
  return v0;
}

uint64_t __nrg_daemon_log_block_invoke()
{
  nrg_daemon_log___logger = (uint64_t)os_log_create("com.apple.NanoResourceGrabber", "daemon");
  return MEMORY[0x270F9A758]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t LICreateIconForBundleAndDisplayGamut()
{
  return MEMORY[0x270F4ADD8]();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x270EE55C0]();
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

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}