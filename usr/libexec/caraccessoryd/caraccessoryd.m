uint64_t CAFPreferencesGetBoolean(const __CFString *a1, unsigned int a2)
{
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  v3 = CFPreferencesGetAppBooleanValue(a1, @"com.apple.CarAccessoryFramework", &keyExistsAndHasValidFormat) != 0;
  if (keyExistsAndHasValidFormat) {
    return v3;
  }
  else {
    return a2;
  }
}

double CAFPreferencesGetDouble(void *a1, double a2)
{
  v3 = a1;
  v4 = +[NSNumber numberWithDouble:a2];
  v5 = CAFPreferencesGetNumber(v3, v4);

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

id CAFPreferencesGetNumber(const __CFString *a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)CFPreferencesCopyAppValue(a1, @"com.apple.CarAccessoryFramework");
  objc_opt_class();
  id v5 = v4;
  if (!v5 || (id v6 = v5, (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v6 = v3;
  }

  return v6;
}

id CAFPreferencesGetArray(const __CFString *a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)CFPreferencesCopyAppValue(a1, @"com.apple.CarAccessoryFramework");
  objc_opt_class();
  id v5 = v4;
  if (!v5 || (id v6 = v5, (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v6 = v3;
  }

  return v6;
}

BOOL CAFDefaultsHasValue(void *a1)
{
  id v1 = a1;
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 valueForKey:v1];

  return v3 != 0;
}

id CAFDefaultsGetBoolean(void *a1, id a2)
{
  id v3 = a1;
  v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 valueForKey:v3];

  if (v5) {
    a2 = [v5 BOOLValue];
  }

  return a2;
}

void sub_100004044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005B54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000A21C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000A780(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_10000B090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 72), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_13(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

__CFData *CAFImageDataByScalingImageData(void *a1, double a2, double a3)
{
  id v5 = a1;
  id v6 = [v5 length];
  CFDataRef v7 = (const __CFData *)v5;
  CFDataRef v8 = v7;
  uint64_t v9 = v7;
  if (!v6) {
    goto LABEL_43;
  }
  if (!v7)
  {
LABEL_42:
    uint64_t v9 = v8;
    goto LABEL_43;
  }
  uint64_t v10 = CGImageSourceCreateWithData(v7, 0);
  if (!v10)
  {
LABEL_8:

    goto LABEL_42;
  }
  v11 = v10;
  CFDictionaryRef v12 = CGImageSourceCopyPropertiesAtIndex(v10, 0, 0);
  if (!v12)
  {
    CFRelease(v11);
    goto LABEL_8;
  }
  CFDictionaryRef v13 = v12;
  int valuePtr = 0;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v12, kCGImagePropertyOrientation);
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
    BOOL v15 = valuePtr > 4;
  }
  else
  {
    BOOL v15 = 0;
  }
  CFNumberRef v16 = (const __CFNumber *)CFDictionaryGetValue(v13, kCGImagePropertyPixelWidth);
  if (v16 && CFNumberGetValue(v16, kCFNumberIntType, &valuePtr))
  {
    if (v15) {
      uint64_t v17 = 0;
    }
    else {
      uint64_t v17 = valuePtr;
    }
    if (v15) {
      uint64_t v18 = valuePtr;
    }
    else {
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
  }
  CFNumberRef v19 = (const __CFNumber *)CFDictionaryGetValue(v13, kCGImagePropertyPixelHeight);
  if (v19 && CFNumberGetValue(v19, kCFNumberIntType, &valuePtr))
  {
    if (v15) {
      uint64_t v17 = valuePtr;
    }
    else {
      uint64_t v18 = valuePtr;
    }
  }
  CFRelease(v13);

  double v20 = (double)v17;
  double v21 = (double)v18;
  if (a2 >= (double)v17 && a3 >= v21)
  {
    CFRelease(v11);
    goto LABEL_42;
  }
  if (a2 / v20 >= a3 / v21) {
    double v23 = a3 / v21;
  }
  else {
    double v23 = a2 / v20;
  }
  if (CGImageSourceGetCount(v11))
  {
    CFDictionaryRef v24 = CGImageSourceCopyPropertiesAtIndex(v11, 0, 0);
    CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v11, 0, 0);
    if (ImageAtIndex)
    {
      v26 = ImageAtIndex;
      float v27 = v23 * v20;
      float v28 = v23 * v21;
      unint64_t v29 = vcvtms_u32_f32(v28);
      if (vcvtms_u32_f32(v27)) {
        BOOL v30 = v29 == 0;
      }
      else {
        BOOL v30 = 1;
      }
      if (!v30)
      {
        uint64_t v31 = CGImageCreateByScaling();
        CFRelease(v26);
        v26 = (void *)v31;
      }
      uint64_t v9 = (__CFData *)objc_opt_new();
      CGImageDestinationRef v32 = CGImageDestinationCreateWithData(v9, @"public.jpeg", 1uLL, 0);
      if (v32)
      {
        v33 = v32;
        v34 = +[NSMutableDictionary dictionaryWithDictionary:v24];
        v35 = +[NSNumber numberWithDouble:0.75];
        [v34 setObject:v35 forKeyedSubscript:kCGImageDestinationLossyCompressionQuality];

        CGImageDestinationAddImage(v33, (CGImageRef)v26, (CFDictionaryRef)v34);
        CGImageDestinationFinalize(v33);
        CFRelease(v33);
      }
      CGImageRelease((CGImageRef)v26);
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  CFRelease(v11);
LABEL_43:

  return v9;
}

CGImageRef CAFCreateImageRefForData(const __CFData *a1)
{
  uint64_t v1 = CGDataProviderCreateWithCFData(a1);
  CGImageRef v2 = CGImageCreateWithPNGDataProvider(v1, 0, 1, kCGRenderingIntentDefault);
  if (!v2) {
    CGImageRef v2 = CGImageCreateWithJPEGDataProvider(v1, 0, 1, kCGRenderingIntentDefault);
  }
  CGDataProviderRelease(v1);
  return v2;
}

BOOL CAFImageDataIsValidImage(const __CFData *a1)
{
  CGImageRef v1 = CAFCreateImageRefForData(a1);
  CGImageRef v2 = v1;
  if (v1) {
    CFRelease(v1);
  }
  return v2 != 0;
}

void sub_10000D60C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

int main(int argc, const char **argv, const char **envp)
{
  CAFSignpostEmit_Launched();
  int Boolean = CAFPreferencesGetBoolean(@"fastStartupRegistration", 1u);
  uint64_t v4 = CAFDLogging();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (Boolean)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "cafd starting with fastStartup", buf, 2u);
    }

    id v6 = objc_alloc((Class)CAFCarManagerMutableConfiguration);
    uint64_t v4 = +[CAFRegistrations fastStartup];
    id v7 = [v6 initWithRegistrationDictionary:v4];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "cafd starting without fastStartup", buf, 2u);
    }
    id v7 = 0;
  }

  id v8 = objc_alloc_init((Class)CARSessionStatus);
  double v21 = v7;
  uint64_t v9 = [[CAFDCarDataServiceAgent alloc] initWithSessionStatus:v8 config:v7];
  id v10 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.caraccessoryframework.cardata"];
  [v10 setDelegate:v9];
  [v10 activate];
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &__block_literal_global_0);
  id v11 = objc_alloc_init((Class)CAFCarManager);
  CFDictionaryRef v12 = [[_TtC13caraccessoryd22CAFDAssetVariantsAgent alloc] initWithCarManager:v11 sessionStatus:v8];
  CFDictionaryRef v13 = [(CAFDAssetVariantsAgent *)v12 domain];
  v14 = +[BSServicesConfiguration activateManualDomain:v13];

  BOOL v15 = [[_TtC13caraccessoryd19CAFDNowPlayingAgent alloc] initWithCarManager:v11];
  CFNumberRef v16 = [(CAFDAgent *)v15 domain];
  uint64_t v17 = +[BSServicesConfiguration activateManualDomain:v16];

  uint64_t v18 = CAFDLogging();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    CFDictionaryRef v24 = v9;
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "cafd ready %@ %@ %@", buf, 0x20u);
  }

  CFNumberRef v19 = +[NSRunLoop mainRunLoop];
  [v19 run];

  return 0;
}

void __main_block_invoke(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string)
  {
    id v3 = +[NSString stringWithUTF8String:string];
    uint64_t v4 = CAFDLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling %@ notification", (uint8_t *)&v5, 0xCu);
    }
  }
}

void sub_100013B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_2_1(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_7_0(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_9_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t variable initialization expression of CAFDAgent.listener()
{
  return 0;
}

uint64_t variable initialization expression of CAFDAssetVariantsAgent.workQueue()
{
  type metadata accessor for CAUVariantsService();
  static CAUVariantsService.identifier.getter();
  NSString v0 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v1 = [self serial];
  uint64_t v2 = BSDispatchQueueCreate();

  return v2;
}

void variable initialization expression of CAFDAssetVariantsAgent.connections()
{
}

uint64_t CAFDAssetVariantsAgent.assetVariants.willset(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.assetVariants.getter();
  swift_bridgeObjectRetain_n();
  id v7 = v1;
  id v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v19 = v17;
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v18 = *(void *)&v7[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetVariants];
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CAUVehicleTrait : String]?);
    uint64_t v11 = String.init<A>(describing:)();
    uint64_t v16 = v3;
    uint64_t v18 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    uint64_t v18 = a1;
    swift_bridgeObjectRetain();
    uint64_t v13 = String.init<A>(describing:)();
    uint64_t v18 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "updating assetVariants from %s to %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v16);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t CAFDAssetVariantsAgent.assetExtrasURL.willset(void *a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.assetVariants.getter();
  id v7 = a1;
  id v8 = v1;
  id v9 = v7;
  uint64_t v10 = (char *)v8;
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v25 = v4;
    uint64_t v14 = v13;
    uint64_t v15 = swift_slowAlloc();
    v23[1] = v15;
    *(_DWORD *)uint64_t v14 = 136315394;
    id v26 = *(id *)&v10[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetExtrasURL];
    uint64_t v27 = v15;
    id v16 = v26;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSSecurityScopedURLWrapper?);
    uint64_t v24 = v3;
    uint64_t v17 = String.init<A>(describing:)();
    id v26 = (id)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v18, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    id v26 = a1;
    id v19 = v9;
    uint64_t v20 = String.init<A>(describing:)();
    id v26 = (id)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v21, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "updating assetExtrasURL from %s to %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v6, v24);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

void specialized Sequence.forEach(_:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy();
    lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type CAFDAssetVariantsAgent._ConnectionProxy and conformance NSObject, (void (*)(uint64_t))type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy);
    Set.Iterator.init(_cocoa:)();
    a1 = v39;
    uint64_t v32 = v40;
    uint64_t v7 = v41;
    uint64_t v8 = v42;
    unint64_t v9 = v43;
  }
  else
  {
    uint64_t v10 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v32 = a1 + 56;
    uint64_t v12 = ~v10;
    uint64_t v13 = -v10;
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v9 = v14 & v11;
    swift_bridgeObjectRetain();
    uint64_t v7 = v12;
    uint64_t v8 = 0;
  }
  v30[1] = v7;
  v30[4] = a1 & 0x7FFFFFFFFFFFFFFFLL;
  int64_t v31 = (unint64_t)(v7 + 64) >> 6;
  uint64_t v15 = (void (**)(char *, uint64_t))(v3 + 8);
  *(void *)&long long v6 = 138412290;
  long long v34 = v6;
  v30[3] = (char *)&type metadata for Swift.AnyObject + 8;
  v35 = (void (**)(char *, uint64_t))(v3 + 8);
  v33 = v5;
  while (a1 < 0)
  {
    uint64_t v19 = __CocoaSet.Iterator.next()();
    if (!v19) {
      goto LABEL_35;
    }
    uint64_t v38 = v19;
    type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v20 = v44;
    swift_unknownObjectRelease();
    uint64_t v18 = v8;
    uint64_t v37 = v9;
    if (!v20) {
      goto LABEL_35;
    }
LABEL_33:
    uint64_t v36 = v18;
    static Logger.assetVariants.getter();
    uint64_t v24 = v20;
    id v16 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v25))
    {
      uint64_t v26 = v2;
      uint64_t v27 = a1;
      uint64_t v28 = swift_slowAlloc();
      unint64_t v29 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = v34;
      *(void *)(v28 + 4) = v24;
      *unint64_t v29 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, v25, "queuing refresh %@", (uint8_t *)v28, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      swift_slowDealloc();
      a1 = v27;
      uint64_t v2 = v26;
      uint64_t v5 = v33;
      uint64_t v15 = v35;
      swift_slowDealloc();
    }
    else
    {

      id v16 = v24;
    }
    unint64_t v9 = v37;

    (*v15)(v5, v2);
    [v24 refreshVariants];

    uint64_t v8 = v36;
  }
  if (v9)
  {
    uint64_t v37 = (v9 - 1) & v9;
    unint64_t v17 = __clz(__rbit64(v9)) | (v8 << 6);
    uint64_t v18 = v8;
LABEL_32:
    id v20 = *(id *)(*(void *)(a1 + 48) + 8 * v17);
    if (!v20) {
      goto LABEL_35;
    }
    goto LABEL_33;
  }
  int64_t v21 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v21 >= v31) {
      goto LABEL_35;
    }
    unint64_t v22 = *(void *)(v32 + 8 * v21);
    uint64_t v18 = v8 + 1;
    if (!v22)
    {
      uint64_t v18 = v8 + 2;
      if (v8 + 2 >= v31) {
        goto LABEL_35;
      }
      unint64_t v22 = *(void *)(v32 + 8 * v18);
      if (!v22)
      {
        uint64_t v18 = v8 + 3;
        if (v8 + 3 >= v31) {
          goto LABEL_35;
        }
        unint64_t v22 = *(void *)(v32 + 8 * v18);
        if (!v22)
        {
          uint64_t v18 = v8 + 4;
          if (v8 + 4 >= v31) {
            goto LABEL_35;
          }
          unint64_t v22 = *(void *)(v32 + 8 * v18);
          if (!v22)
          {
            uint64_t v18 = v8 + 5;
            if (v8 + 5 >= v31) {
              goto LABEL_35;
            }
            unint64_t v22 = *(void *)(v32 + 8 * v18);
            if (!v22)
            {
              uint64_t v23 = v8 + 6;
              while (v31 != v23)
              {
                unint64_t v22 = *(void *)(v32 + 8 * v23++);
                if (v22)
                {
                  uint64_t v18 = v23 - 1;
                  goto LABEL_31;
                }
              }
LABEL_35:
              outlined consume of Set<CAFDAssetVariantsAgent._ConnectionProxy>.Iterator._Variant();
              return;
            }
          }
        }
      }
    }
LABEL_31:
    uint64_t v37 = (v22 - 1) & v22;
    unint64_t v17 = __clz(__rbit64(v22)) + (v18 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  void *v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;

  id v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for CAFDAgent._CAFDConnectionProxy();
    lazy protocol witness table accessor for type CAFDAgent._CAFDConnectionProxy and conformance NSObject();
    Set.Iterator.init(_cocoa:)();
    id v1 = v26;
    unint64_t v22 = v27;
    uint64_t v2 = v28;
    uint64_t v3 = v29;
    uint64_t v4 = v30;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    unint64_t v22 = a1 + 56;
    long long v6 = ~v5;
    uint64_t v7 = -v5;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    uint64_t v4 = v8 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v2 = v6;
    uint64_t v3 = 0;
  }
  int64_t v21 = (unint64_t)(v2 + 64) >> 6;
  while (v1 < 0)
  {
    if (!__CocoaSet.Iterator.next()()) {
      goto LABEL_37;
    }
    type metadata accessor for CAFDAgent._CAFDConnectionProxy();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    uint64_t v12 = v25;
    swift_unknownObjectRelease();
    uint64_t v11 = v3;
    uint64_t v24 = v4;
    if (!v25) {
      goto LABEL_37;
    }
LABEL_33:
    uint64_t v23 = v11;
    if (one-time initialization token for nowPlaying != -1) {
      swift_once();
    }
    id v16 = type metadata accessor for Logger();
    __swift_project_value_buffer(v16, (uint64_t)static Logger.nowPlaying);
    unint64_t v17 = v12;
    unint64_t v9 = Logger.logObject.getter();
    uint64_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      id v20 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 138412290;
      *(void *)(v19 + 4) = v17;
      id *v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, v18, "queuing now playing refresh for %@", (uint8_t *)v19, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      unint64_t v9 = v17;
    }
    uint64_t v4 = v24;

    [(id)swift_dynamicCastObjCProtocolUnconditional() refreshNowPlayingSnapshot];
    uint64_t v3 = v23;
  }
  if (v4)
  {
    uint64_t v24 = (v4 - 1) & v4;
    uint64_t v10 = __clz(__rbit64(v4)) | (v3 << 6);
    uint64_t v11 = v3;
LABEL_32:
    uint64_t v12 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
    if (!v12) {
      goto LABEL_37;
    }
    goto LABEL_33;
  }
  uint64_t v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 >= v21) {
      goto LABEL_37;
    }
    uint64_t v14 = *(void *)(v22 + 8 * v13);
    uint64_t v11 = v3 + 1;
    if (!v14)
    {
      uint64_t v11 = v3 + 2;
      if (v3 + 2 >= v21) {
        goto LABEL_37;
      }
      uint64_t v14 = *(void *)(v22 + 8 * v11);
      if (!v14)
      {
        uint64_t v11 = v3 + 3;
        if (v3 + 3 >= v21) {
          goto LABEL_37;
        }
        uint64_t v14 = *(void *)(v22 + 8 * v11);
        if (!v14)
        {
          uint64_t v11 = v3 + 4;
          if (v3 + 4 >= v21) {
            goto LABEL_37;
          }
          uint64_t v14 = *(void *)(v22 + 8 * v11);
          if (!v14)
          {
            uint64_t v11 = v3 + 5;
            if (v3 + 5 >= v21) {
              goto LABEL_37;
            }
            uint64_t v14 = *(void *)(v22 + 8 * v11);
            if (!v14)
            {
              uint64_t v15 = v3 + 6;
              while (v21 != v15)
              {
                uint64_t v14 = *(void *)(v22 + 8 * v15++);
                if (v14)
                {
                  uint64_t v11 = v15 - 1;
                  goto LABEL_31;
                }
              }
LABEL_37:
              outlined consume of Set<CAFDAssetVariantsAgent._ConnectionProxy>.Iterator._Variant();
              return;
            }
          }
        }
      }
    }
LABEL_31:
    uint64_t v24 = (v14 - 1) & v14;
    uint64_t v10 = __clz(__rbit64(v14)) + (v11 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

char *CAFDAssetVariantsAgent.__allocating_init(carManager:sessionStatus:)(void *a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return CAFDAssetVariantsAgent.init(carManager:sessionStatus:)(a1, a2);
}

char *CAFDAssetVariantsAgent.init(carManager:sessionStatus:)(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v46 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v46 - 8);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v44 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v42 - v9;
  v45 = &v2[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_carManager];
  swift_unknownObjectWeakInit();
  *(void *)&v2[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_currentCar] = 0;
  *(void *)&v2[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_vehicleResources] = 0;
  *(void *)&v2[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_clusterThemeManager] = 0;
  uint64_t v11 = OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_workQueue;
  type metadata accessor for CAUVariantsService();
  uint64_t v12 = v2;
  static CAUVariantsService.identifier.getter();
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v14 = [self serial];
  uint64_t v15 = BSDispatchQueueCreate();

  *(void *)&v3[v11] = v15;
  *(void *)&v12[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_listener] = 0;
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    specialized Set.init(_nonEmptyArrayLiteral:)((unint64_t)&_swiftEmptyArrayStorage, (uint64_t *)&demangling cache variable for type metadata for _SetStorage<CAFDAssetVariantsAgent._ConnectionProxy>, (void (*)(void))type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy);
  }
  else {
    id v16 = &_swiftEmptySetSingleton;
  }
  *(void *)&v12[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_connections] = v16;
  *(void *)&v12[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetVariants] = 0;
  *(void *)&v12[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetExtrasURL] = 0;
  static Logger.assetVariants.getter();
  unint64_t v17 = a1;
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v47 = v6;
    int64_t v21 = (uint8_t *)v20;
    uint64_t v42 = (void *)swift_slowAlloc();
    *(_DWORD *)int64_t v21 = 138412290;
    aBlock[0] = v17;
    unint64_t v22 = v17;
    unint64_t v43 = a2;
    uint64_t v23 = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v42 = v17;

    a2 = v43;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Initializing with carManager %@", v21, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v6 = v47;
    swift_slowDealloc();
  }
  else
  {

    uint64_t v18 = v17;
  }

  uint64_t v24 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v25 = v46;
  uint64_t v47 = v6 + 8;
  v24(v10, v46);
  swift_unknownObjectWeakAssign();
  *(void *)&v12[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_sessionStatus] = a2;
  id v26 = a2;

  uint64_t v27 = (objc_class *)type metadata accessor for CAFDAssetVariantsAgent();
  v49.receiver = v12;
  v49.super_class = v27;
  id v28 = [super init];
  *(&v42 - 2) = (void *)__chkstk_darwin(v28);
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = partial apply for closure #1 in CAFDAssetVariantsAgent.init(carManager:sessionStatus:);
  *(void *)(v29 + 24) = &v42 - 4;
  aBlock[4] = partial apply for thunk for @callee_guaranteed (@guaranteed BSServiceConnectionListenerConfiguring) -> ();
  aBlock[5] = v29;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed BSServiceConnectionListenerConfiguring) -> ();
  aBlock[3] = &block_descriptor;
  BOOL v30 = _Block_copy(aBlock);
  int64_t v31 = self;
  uint64_t v32 = (char *)v28;
  swift_retain();
  id v33 = [v31 listenerWithConfigurator:v30];
  _Block_release(v30);
  swift_release();
  LOBYTE(v30) = swift_isEscapingClosureAtFileLocation();
  result = (char *)swift_release();
  if (v30)
  {
    __break(1u);
  }
  else
  {
    uint64_t v35 = OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_listener;
    uint64_t v36 = *(void **)&v32[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_listener];
    *(void *)&v32[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_listener] = v33;

    uint64_t v37 = v44;
    static Logger.assetVariants.getter();
    uint64_t v38 = Logger.logObject.getter();
    os_log_type_t v39 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "activating listener", v40, 2u);
      swift_slowDealloc();
    }

    v24(v37, v25);
    result = *(char **)&v32[v35];
    if (result)
    {
      [result activate];
      [v17 registerObserver:v32];
      id v41 = [v17 currentCar];
      [v32 carManager:v17 didUpdateCurrentCar:v41];

      return v32;
    }
  }
  __break(1u);
  return result;
}

id closure #1 in CAFDAssetVariantsAgent.init(carManager:sessionStatus:)(void *a1, uint64_t a2)
{
  type metadata accessor for CAUVariantsService();
  static CAUVariantsService.domain.getter();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [a1 setDomain:v4];

  static CAUVariantsService.identifier.getter();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [a1 setService:v5];

  return [a1 setDelegate:a2];
}

uint64_t thunk for @callee_guaranteed (@guaranteed BSServiceConnectionListenerConfiguring) -> ()(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed BSServiceConnectionListenerConfiguring) -> ()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return swift_unknownObjectRelease();
}

id CAFDAgent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void CAFDAssetVariantsAgent.init()()
{
}

id CAFDAssetVariantsAgent.__deallocating_deinit(uint64_t a1)
{
  return CAFDAssetVariantsAgent.__deallocating_deinit(a1, type metadata accessor for CAFDAssetVariantsAgent);
}

void CAFDAssetVariantsAgent.carManager(_:didUpdateCurrentCar:)(uint64_t a1, void *a2)
{
}

void CAFDAssetVariantsAgent.carDidUpdateAccessories(_:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.assetVariants.getter();
  id v8 = a1;
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v23 = v4;
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v25 = v22;
    *(_DWORD *)uint64_t v11 = 136315138;
    id v12 = [v8 vehicleResources:v22];
    if (v12)
    {
      NSString v13 = v12;
      id v14 = [v12 description];

      uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v17 = v16;
    }
    else
    {
      unint64_t v17 = 0xE300000000000000;
      uint64_t v15 = 7104878;
    }
    uint64_t v24 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v17, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Checking for vehicleResources: %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v23);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  id v18 = [v8 vehicleResources];
  uint64_t v19 = OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_vehicleResources;
  uint64_t v20 = *(void **)(v2 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_vehicleResources);
  *(void *)(v2 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_vehicleResources) = v18;

  int64_t v21 = *(void **)(v2 + v19);
  if (v21) {
    [v21 registerObserver:v2];
  }
  CAFDAssetVariantsAgent.updateAssetVariants()();
}

Swift::Void __swiftcall CAFDAssetVariantsAgent.updateAssetVariants()()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v61 - v6;
  uint64_t v8 = type metadata accessor for CAUVehicleTrait();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = *(void **)(v0 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_vehicleResources);
  if (v12)
  {
    NSString v13 = v12;
    if ([v13 receivedAllValues])
    {
      v65 = v11;
      uint64_t v66 = v0;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CAUVehicleTrait, String)>);
      id v14 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CAUVehicleTrait, String))
                  - 8);
      uint64_t v15 = *(void *)v14;
      uint64_t v62 = *(void *)(*(void *)v14 + 72);
      unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
      uint64_t v17 = swift_allocObject();
      uint64_t v63 = v17;
      *(_OWORD *)(v17 + 16) = xmmword_100029D00;
      unint64_t v18 = v17 + v16;
      uint64_t v19 = v8;
      uint64_t v20 = (uint64_t *)(v18 + v14[14]);
      int64_t v21 = *(void (**)(void))(v9 + 104);
      ((void (*)(unint64_t, void, uint64_t))v21)(v18, enum case for CAUVehicleTrait.exteriorStyle(_:), v19);
      id v22 = [v13 vehicleVariant];
      id v23 = [v22 exteriorStyle];
      uint64_t v64 = v9;
      uint64_t v24 = v13;
      id v25 = v23;

      uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v28 = v27;

      uint64_t v29 = v24;
      uint64_t *v20 = v26;
      v20[1] = v28;
      uint64_t v30 = v19;
      int64_t v31 = (uint64_t *)(v18 + v62 + v14[14]);
      v21();
      id v32 = [v24 vehicleVariant];
      id v33 = [v32 interiorStyle];

      uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v36 = v35;

      *int64_t v31 = v34;
      v31[1] = v36;
      unint64_t v37 = specialized Dictionary.init(dictionaryLiteral:)(v63);
      id v38 = [v24 vehicleVariant];
      id v39 = [v38 vehicleLayout];

      v61 = v21;
      if (v39)
      {
        uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v42 = v41;

        uint64_t v43 = (uint64_t)v65;
        ((void (*)(char *, void, uint64_t))v21)(v65, enum case for CAUVehicleTrait.vehicleLayout(_:), v30);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v67 = v37;
        specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v40, v42, v43, isUniquelyReferenced_nonNull_native);
        unint64_t v37 = v67;
        swift_bridgeObjectRelease();
        uint64_t v45 = v64;
        (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v43, v30);
      }
      else
      {
        uint64_t v45 = v64;
        uint64_t v43 = (uint64_t)v65;
      }
      id v53 = [v29 vehicleVariant];
      id v54 = [v53 audioLogo];

      uint64_t v55 = v66;
      if (v54)
      {
        uint64_t v56 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v58 = v57;

        ((void (*)(uint64_t, void, uint64_t))v61)(v43, enum case for CAUVehicleTrait.audioBrandLogo(_:), v30);
        char v59 = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v67 = v37;
        specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v56, v58, v43, v59);
        unint64_t v37 = v67;
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v43, v30);
      }
      CAFDAssetVariantsAgent.assetVariants.willset(v37);
      *(void *)(v55 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetVariants) = v37;
      swift_bridgeObjectRelease();
      swift_beginAccess();
      uint64_t v60 = swift_bridgeObjectRetain();
      specialized Sequence.forEach(_:)(v60);

      swift_bridgeObjectRelease();
    }
    else
    {
      static Logger.assetVariants.getter();
      objc_super v49 = Logger.logObject.getter();
      os_log_type_t v50 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v51 = 0;
        _os_log_impl((void *)&_mh_execute_header, v49, v50, "Missing values from variants", v51, 2u);
        swift_slowDealloc();
        v52 = v13;
      }
      else
      {
        v52 = v49;
        objc_super v49 = v13;
      }

      (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    }
  }
  else
  {
    static Logger.assetVariants.getter();
    uint64_t v46 = Logger.logObject.getter();
    os_log_type_t v47 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v48 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "No vehicleResources", v48, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
}

uint64_t CAFDAssetVariantsAgent.clusterThemeManager(_:didUpdateExtraAssetsURL:)(uint64_t a1, void *a2)
{
  id v4 = a2;
  CAFDAssetVariantsAgent.assetExtrasURL.willset(a2);
  uint64_t v5 = *(void **)(v2 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetExtrasURL);
  *(void *)(v2 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetExtrasURL) = a2;
  id v6 = v4;

  swift_beginAccess();
  uint64_t v7 = swift_bridgeObjectRetain();
  specialized Sequence.forEach(_:)(v7);

  return swift_bridgeObjectRelease();
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CAUVehicleTrait, String));
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CAUVehicleTrait, String>);
  uint64_t v6 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    outlined init with copy of (CAUVehicleTrait, String)(v12, (uint64_t)v5);
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = type metadata accessor for CAUVehicleTrait();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    uint64_t v19 = (void *)(v7[7] + 16 * v16);
    uint64_t v20 = *((void *)v9 + 1);
    *uint64_t v19 = *(void *)v9;
    v19[1] = v20;
    uint64_t v21 = v7[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_11;
    }
    v7[2] = v23;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void CAFDAssetVariantsAgent.listener(_:didReceive:withContext:)(uint64_t a1, void *a2)
{
}

uint64_t BSServiceConnectionHost.CAFDDescription.getter()
{
  uint64_t v1 = v0;
  _StringGuts.grow(_:)(19);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v2._countAndFlagsBits = 0x3D64697020;
  v2._object = (void *)0xE500000000000000;
  String.append(_:)(v2);
  id v3 = [v0 remoteToken];
  [v3 pid];

  v4._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 0x3D656C646E756220;
  v5._object = (void *)0xE800000000000000;
  String.append(_:)(v5);
  id v6 = [v1 remoteToken];
  id v7 = [v6 bundleID];

  if (v7)
  {
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = (void *)0xE300000000000000;
    uint64_t v8 = 7104878;
  }
  v11._countAndFlagsBits = v8;
  v11._object = v10;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t CAFDAssetVariantsAgent.add(proxy:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchQoS();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  Swift::String v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  CAFDAssetVariantsAgent._ConnectionProxy.activate()();
  v17[0] = *(void *)(v2 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_workQueue);
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  *(void *)(v13 + 24) = a1;
  aBlock[4] = partial apply for closure #1 in CAFDAssetVariantsAgent.add(proxy:);
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_42;
  id v14 = _Block_copy(aBlock);
  swift_retain();
  id v15 = a1;
  static DispatchQoS.unspecified.getter();
  v17[1] = &_swiftEmptyArrayStorage;
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_release();
  return swift_release();
}

uint64_t CAFDAssetVariantsAgent.remove(proxy:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchQoS();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  Swift::String v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  [a1 invalidate];
  v17[0] = *(void *)(v2 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_workQueue);
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  *(void *)(v13 + 24) = a1;
  aBlock[4] = partial apply for closure #1 in CAFDAssetVariantsAgent.remove(proxy:);
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_64;
  id v14 = _Block_copy(aBlock);
  swift_retain();
  id v15 = a1;
  static DispatchQoS.unspecified.getter();
  v17[1] = &_swiftEmptyArrayStorage;
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_release();
  return swift_release();
}

void closure #1 in CAFDAssetVariantsAgent.remove(proxy:)(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    swift_beginAccess();
    uint64_t v5 = (void *)specialized Set._Variant.remove(_:)(a2);
    swift_endAccess();
  }
}

void closure #1 in CAFDAssetVariantsAgent.add(proxy:)(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    swift_beginAccess();
    specialized Set._Variant.insert(_:)(&v6, a2);
    uint64_t v5 = v6;
    swift_endAccess();
  }
}

uint64_t CAFDAssetVariantsAgent._ConnectionProxy.init(agent:workQueue:connection:)(void *a1, void *a2, void *a3)
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(void *)&v3[OBJC_IVAR____TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy_connection] = a3;
  v18.receiver = v3;
  v18.super_class = (Class)type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy();
  id v7 = a3;
  id v8 = [super init];
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  *(void *)(v9 + 24) = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = partial apply for closure #1 in CAFDAssetVariantsAgent._ConnectionProxy.init(agent:workQueue:connection:);
  *(void *)(v10 + 24) = v9;
  v17[4] = partial apply for thunk for @callee_guaranteed (@guaranteed BSServiceConnectionConfiguring) -> ();
  v17[5] = v10;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  void v17[2] = thunk for @escaping @callee_guaranteed (@guaranteed BSServiceConnectionListenerConfiguring) -> ();
  v17[3] = &block_descriptor_51;
  Swift::String v11 = _Block_copy(v17);
  id v12 = v8;
  id v13 = v7;
  id v14 = v12;
  id v15 = a2;
  swift_retain();
  swift_release();
  [v13 configureConnection:v11];

  _Block_release(v11);
  LOBYTE(a1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((a1 & 1) == 0) {
    return (uint64_t)v14;
  }
  __break(1u);
  return result;
}

void closure #1 in CAFDAssetVariantsAgent._ConnectionProxy.init(agent:workQueue:connection:)(void *a1, uint64_t a2, uint64_t a3)
{
  [a1 setTargetQueue:a2];
  type metadata accessor for CAUVariantsService();
  uint64_t v5 = (void *)static CAUVariantsService.serviceQuality.getter();
  [a1 setServiceQuality:v5];

  uint64_t v6 = (void *)static CAUVariantsService.interface.getter();
  [a1 setInterface:v6];

  [a1 setInterfaceTarget:a3];
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v9[4] = partial apply for closure #1 in closure #1 in CAFDAssetVariantsAgent._ConnectionProxy.init(agent:workQueue:connection:);
  v9[5] = v7;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed BSServiceConnection & BSServiceConnectionContext) -> ();
  v9[3] = &block_descriptor_57;
  id v8 = _Block_copy(v9);
  swift_release();
  [a1 setInvalidationHandler:v8];
  _Block_release(v8);
}

void closure #1 in closure #1 in CAFDAssetVariantsAgent._ConnectionProxy.init(agent:workQueue:connection:)()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    static Logger.assetVariants.getter();
    uint64_t v6 = v5;
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v17 = v0;
      uint64_t v9 = swift_slowAlloc();
      uint64_t v16 = v1;
      uint64_t v10 = (uint8_t *)v9;
      id v15 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 138412290;
      objc_super v18 = v6;
      Swift::String v11 = v6;
      uint64_t v0 = v17;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v15 = v5;

      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Connection invalidated %@", v10, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v1 = v16;
      swift_slowDealloc();
    }
    else
    {

      uint64_t v7 = v6;
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    uint64_t v12 = swift_unknownObjectWeakLoadStrong();
    if (v12)
    {
      id v13 = (void *)v12;
      CAFDAssetVariantsAgent.remove(proxy:)(v6);
    }
  }
}

id CAFDAssetVariantsAgent._ConnectionProxy.activate()()
{
  return CAFDAssetVariantsAgent._ConnectionProxy.activate()("Connection activating %@", (SEL *)&selRef_activate);
}

uint64_t CAFDAssetVariantsAgent._ConnectionProxy.remote.getter()
{
  NSString v1 = String._bridgeToObjectiveC()();
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [self attributeWithDomain:v1 name:v2];

  uint64_t v4 = *(void **)(v0
                + OBJC_IVAR____TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy_connection);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100029D10;
  *(void *)(v5 + 32) = v3;
  v12[0] = v5;
  specialized Array._endMutation()();
  type metadata accessor for RBSAttribute();
  id v6 = v3;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v8 = [v4 remoteTargetWithAssertionAttributes:isa];

  if (v8)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {

    memset(v11, 0, sizeof(v11));
  }
  outlined init with take of Any?((uint64_t)v11, (uint64_t)v12);
  if (v12[3])
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CAUVariantsClient);
    if (swift_dynamicCast()) {
      return v10;
    }
    else {
      return 0;
    }
  }
  else
  {
    outlined destroy of Any?((uint64_t)v12);
    return 0;
  }
}

id CAFDAssetVariantsAgent._ConnectionProxy.__deallocating_deinit()
{
  return CAFDAssetVariantsAgent.__deallocating_deinit(0, type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy);
}

id CAFDAssetVariantsAgent.__deallocating_deinit(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return [super dealloc];
}

id CAFDAssetVariantsAgent._ConnectionProxy.activate()(const char *a1, SEL *a2)
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.assetVariants.getter();
  uint64_t v9 = v2;
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v21 = a2;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v19 = a1;
    id v13 = (uint8_t *)v12;
    objc_super v18 = (void *)swift_slowAlloc();
    *(_DWORD *)id v13 = 138412290;
    BOOL v22 = v9;
    uint64_t v14 = v9;
    uint64_t v20 = v5;
    id v15 = v14;
    a2 = v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *objc_super v18 = v9;

    uint64_t v5 = v20;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, v19, v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v10 = v9;
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return [*(id *)((char *)&v9->isa+ OBJC_IVAR____TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy_connection) *a2];
}

void *CAFDAssetVariantsAgent._ConnectionProxy.refreshVariants()()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  objc_super v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.assetVariants.getter();
  uint64_t v5 = v0;
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v15 = v1;
    uint64_t v8 = swift_slowAlloc();
    uint64_t v14 = v2;
    uint64_t v9 = (uint8_t *)v8;
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    uint64_t v16 = v5;
    os_log_type_t v11 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v10 = v5;

    uint64_t v1 = v15;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "telling %@ to refresh", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v2 = v14;
    swift_slowDealloc();
  }
  else
  {

    uint64_t v6 = v5;
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t result = (void *)CAFDAssetVariantsAgent._ConnectionProxy.remote.getter();
  if (result)
  {
    [result refreshVariants];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t variable initialization expression of CAFDNowPlayingAgent.lastMediaSourceIdentifier()
{
  return 0;
}

void variable initialization expression of CAFDAgent.connections()
{
}

void variable initialization expression of CAFDAssetVariantsAgent.connections(uint64_t *a1, void (*a2)(void))
{
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0)
  {
    if (_CocoaArrayWrapper.endIndex.getter()) {
      specialized Set.init(_nonEmptyArrayLiteral:)((unint64_t)&_swiftEmptyArrayStorage, a1, a2);
    }
  }
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CAFMediaSourceSemanticType(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CAFMediaSourceSemanticType(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t serialize(_:at:)(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t closure #1 in OSLogArguments.append(_:)(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unsigned char **closure #1 in OSLogArguments.append(_:)(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  unsigned char *v4 = a4;
  void *result = v4 + 1;
  return result;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

void closure #1 in OSLogArguments.append(_:)(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    *int64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  type metadata accessor for CAUVehicleTrait();
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type CAUVehicleTrait and conformance CAUVehicleTrait, (void (*)(uint64_t))&type metadata accessor for CAUVehicleTrait);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, int a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for CAUVehicleTrait();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int64_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CAUVehicleTrait, String>);
  int v47 = a2;
  uint64_t v10 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16)) {
    goto LABEL_41;
  }
  objc_super v49 = v8;
  uint64_t v50 = v5;
  uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v13 = *(void *)(v9 + 64);
  uint64_t v43 = (void *)(v9 + 64);
  if (v12 < 64) {
    uint64_t v14 = ~(-1 << v12);
  }
  else {
    uint64_t v14 = -1;
  }
  unint64_t v15 = v14 & v13;
  uint64_t v41 = v2;
  int64_t v42 = (unint64_t)(v12 + 63) >> 6;
  v44 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  v48 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v16 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v18 = 0;
  uint64_t v45 = v9;
  uint64_t v46 = v6;
  while (1)
  {
    if (v15)
    {
      unint64_t v21 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v22 = v21 | (v18 << 6);
      goto LABEL_22;
    }
    int64_t v23 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v42) {
      break;
    }
    uint64_t v24 = v43;
    unint64_t v25 = v43[v23];
    ++v18;
    if (!v25)
    {
      int64_t v18 = v23 + 1;
      if (v23 + 1 >= v42) {
        goto LABEL_34;
      }
      unint64_t v25 = v43[v18];
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v42)
        {
LABEL_34:
          swift_release();
          unint64_t v3 = v41;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v25 = v43[v26];
        if (!v25)
        {
          while (1)
          {
            int64_t v18 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_43;
            }
            if (v18 >= v42) {
              goto LABEL_34;
            }
            unint64_t v25 = v43[v18];
            ++v26;
            if (v25) {
              goto LABEL_21;
            }
          }
        }
        int64_t v18 = v26;
      }
    }
LABEL_21:
    unint64_t v15 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v18 << 6);
LABEL_22:
    uint64_t v27 = *(void *)(v6 + 72);
    unint64_t v28 = *(void *)(v9 + 48) + v27 * v22;
    if (v47)
    {
      (*v48)(v49, v28, v50);
      uint64_t v29 = (uint64_t *)(*(void *)(v9 + 56) + 16 * v22);
      uint64_t v31 = *v29;
      uint64_t v30 = v29[1];
    }
    else
    {
      (*v44)(v49, v28, v50);
      id v32 = (uint64_t *)(*(void *)(v9 + 56) + 16 * v22);
      uint64_t v31 = *v32;
      uint64_t v30 = v32[1];
      swift_bridgeObjectRetain();
    }
    lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type CAUVehicleTrait and conformance CAUVehicleTrait, (void (*)(uint64_t))&type metadata accessor for CAUVehicleTrait);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v33 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v16 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v34) & ~*(void *)(v16 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v6 = v46;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      uint64_t v6 = v46;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v16 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v19 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v48)(*(void *)(v11 + 48) + v27 * v19, v49, v50);
    uint64_t v20 = (void *)(*(void *)(v11 + 56) + 16 * v19);
    void *v20 = v31;
    v20[1] = v30;
    ++*(void *)(v11 + 16);
    uint64_t v9 = v45;
  }
  swift_release();
  unint64_t v3 = v41;
  uint64_t v24 = v43;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v9 + 32);
  if (v40 >= 64) {
    bzero(v24, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v24 = -1 << v40;
  }
  *(void *)(v9 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v11;
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v28 = a2;
  uint64_t v9 = type metadata accessor for CAUVehicleTrait();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (void *)*v4;
  unint64_t v15 = specialized __RawDictionaryStorage.find<A>(_:)(a3);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v19 = v14;
  uint64_t v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0)
  {
LABEL_7:
    unint64_t v21 = *v5;
    if (v19)
    {
LABEL_8:
      unint64_t v22 = (uint64_t *)(v21[7] + 16 * v15);
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v24 = v28;
      *unint64_t v22 = a1;
      v22[1] = v24;
      return result;
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    specialized _NativeDictionary.copy()();
    goto LABEL_7;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v18, a4 & 1);
  unint64_t v25 = specialized __RawDictionaryStorage.find<A>(_:)(a3);
  if ((v19 & 1) != (v26 & 1))
  {
LABEL_14:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v15 = v25;
  unint64_t v21 = *v5;
  if (v19) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a3, v9);
  return specialized _NativeDictionary._insert(at:key:value:)(v15, (uint64_t)v12, a1, v28, v21);
}

uint64_t specialized _NativeDictionary._insert(at:key:value:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v10 = a5[6];
  uint64_t v11 = type metadata accessor for CAUVehicleTrait();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, a2, v11);
  uint64_t v13 = (void *)(a5[7] + 16 * a1);
  *uint64_t v13 = a3;
  v13[1] = a4;
  uint64_t v14 = a5[2];
  BOOL v15 = __OFADD__(v14, 1);
  uint64_t v16 = v14 + 1;
  if (v15) {
    __break(1u);
  }
  else {
    a5[2] = v16;
  }
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = type metadata accessor for CAUVehicleTrait();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type CAUVehicleTrait and conformance CAUVehicleTrait, (void (*)(uint64_t))&type metadata accessor for CAUVehicleTrait);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t v38 = type metadata accessor for CAUVehicleTrait();
  uint64_t v1 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  unint64_t v37 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CAUVehicleTrait, String>);
  id v32 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = static _DictionaryStorage.copy(original:)();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v40 = v4;
  if (!v5)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v30 = v40;
    uint64_t v29 = v32;
LABEL_25:
    *uint64_t v29 = v30;
    return result;
  }
  uint64_t v6 = v4;
  uint64_t result = (void *)(v4 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
    uint64_t v6 = v40;
  }
  int64_t v9 = 0;
  *(void *)(v6 + 16) = *(void *)(v3 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v39 = v3;
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v3 + 64);
  uint64_t v33 = v3 + 64;
  int64_t v34 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v35 = v1 + 32;
  uint64_t v36 = v1 + 16;
  uint64_t v14 = v37;
  uint64_t v13 = v38;
  uint64_t v15 = v40;
  while (1)
  {
    if (v12)
    {
      unint64_t v16 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v17 = v16 | (v9 << 6);
      uint64_t v18 = v39;
      goto LABEL_9;
    }
    int64_t v26 = v9 + 1;
    uint64_t v18 = v39;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v26 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v26);
    ++v9;
    if (!v27)
    {
      int64_t v9 = v26 + 1;
      if (v26 + 1 >= v34) {
        goto LABEL_23;
      }
      unint64_t v27 = *(void *)(v33 + 8 * v9);
      if (!v27) {
        break;
      }
    }
LABEL_22:
    unint64_t v12 = (v27 - 1) & v27;
    unint64_t v17 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v14, *(void *)(v18 + 48) + v19, v13);
    uint64_t v20 = *(void *)(v18 + 56);
    uint64_t v21 = 16 * v17;
    unint64_t v22 = (uint64_t *)(v20 + 16 * v17);
    uint64_t v23 = *v22;
    uint64_t v24 = v22[1];
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v15 + 48) + v19, v14, v13);
    unint64_t v25 = (void *)(*(void *)(v15 + 56) + v21);
    *unint64_t v25 = v23;
    v25[1] = v24;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v34)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v29 = v32;
    uint64_t v30 = v40;
    goto LABEL_25;
  }
  unint64_t v27 = *(void *)(v33 + 8 * v28);
  if (v27)
  {
    int64_t v9 = v28;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v9 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v9);
    ++v28;
    if (v27) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for CAFDAssetVariantsAgent()
{
  return self;
}

id partial apply for closure #1 in CAFDAssetVariantsAgent.init(carManager:sessionStatus:)(void *a1)
{
  return closure #1 in CAFDAssetVariantsAgent.init(carManager:sessionStatus:)(a1, *(void *)(v1 + 16));
}

uint64_t sub_100018CF0()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed BSServiceConnectionListenerConfiguring) -> ()()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void specialized CAFDAssetVariantsAgent.carManager(_:didUpdateCurrentCar:)(void *a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.assetVariants.getter();
  id v7 = a1;
  id v8 = v1;
  id v9 = v7;
  uint64_t v10 = (char *)v8;
  uint64_t v11 = Logger.logObject.getter();
  int v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, (os_log_type_t)v12))
  {
    int v41 = v12;
    uint64_t v43 = v3;
    v44 = a1;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    v46[0] = v42;
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v14 = *(void **)&v10[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_currentCar];
    if (v14)
    {
      id v15 = [v14 description];
      uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v18 = v17;
    }
    else
    {
      unint64_t v18 = 0xE300000000000000;
      uint64_t v16 = 7104878;
    }
    uint64_t v45 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v18, v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    if (v44)
    {
      id v19 = [v9 description];
      uint64_t v20 = v9;
      uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v23 = v22;
    }
    else
    {
      unint64_t v23 = 0xE300000000000000;
      uint64_t v20 = v9;
      uint64_t v21 = 7104878;
    }
    uint64_t v45 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v23, v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, (os_log_type_t)v41, "update current car from %s to %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v43);
    a1 = v44;
    id v9 = v20;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  uint64_t v24 = OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_currentCar;
  unint64_t v25 = *(void **)&v10[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_currentCar];
  if (v25) {
    [v25 unregisterObserver:v10];
  }
  uint64_t v26 = OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_vehicleResources;
  unint64_t v27 = *(void **)&v10[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_vehicleResources];
  if (v27) {
    [v27 unregisterObserver:v10];
  }
  uint64_t v28 = OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_clusterThemeManager;
  uint64_t v29 = *(void **)&v10[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_clusterThemeManager];
  if (v29)
  {
    [v29 setDelegate:0];
    uint64_t v30 = *(void **)&v10[v28];
  }
  else
  {
    uint64_t v30 = 0;
  }
  *(void *)&v10[v28] = 0;

  CAFDAssetVariantsAgent.assetVariants.willset(0);
  *(void *)&v10[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetVariants] = 0;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v31 = swift_bridgeObjectRetain();
  specialized Sequence.forEach(_:)(v31);
  swift_bridgeObjectRelease();
  id v32 = *(void **)&v10[v26];
  *(void *)&v10[v26] = 0;

  uint64_t v33 = *(void **)&v10[v24];
  *(void *)&v10[v24] = a1;
  id v34 = v9;

  if (a1)
  {
    [v34 registerObserver:v10];
    id v35 = objc_allocWithZone((Class)CRSUIClusterThemeManager);
    id v36 = v34;
    id v37 = [v35 init];
    [v37 setDelegate:v10];
    uint64_t v38 = *(void **)&v10[v28];
    *(void *)&v10[v28] = v37;
    id v39 = v37;

    [v10 carDidUpdateAccessories:v36];
  }
}

void specialized CAFDAssetVariantsAgent.accessoryDidUpdate(_:receivedAllValues:)()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.assetVariants.getter();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Variants have all values", v6, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  CAFDAssetVariantsAgent.updateAssetVariants()();
}

void specialized CAFDAssetVariantsAgent.listener(_:didReceive:withContext:)(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(char **)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v33 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v31 - v6;
  static Logger.assetVariants.getter();
  id v8 = a1;
  id v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v34 = v2;
  if (v11)
  {
    int v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    *(_DWORD *)int v12 = 136315138;
    swift_getObjectType();
    uint64_t v13 = BSServiceConnectionHost.CAFDDescription.getter();
    uint64_t v35 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Received connection %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v2 = v34;
    swift_slowDealloc();
  }
  else
  {
  }
  id v15 = (void (*)(char *, uint64_t))*((void *)v3 + 1);
  v15(v7, v2);
  swift_getObjectType();
  id v16 = [v8 remoteToken];
  type metadata accessor for CAUVariantsService();
  static CAUVariantsService.entitlement.getter();
  NSString v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  unsigned int v18 = [v16 hasEntitlement:v17];

  if (v18)
  {
    id v19 = v32;
    uint64_t v20 = *(void **)&v32[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_workQueue];
    id v21 = objc_allocWithZone((Class)type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy());
    unint64_t v22 = (void *)CAFDAssetVariantsAgent._ConnectionProxy.init(agent:workQueue:connection:)(v19, v20, v8);
    CAFDAssetVariantsAgent.add(proxy:)(v22);
  }
  else
  {
    id v32 = v3;
    unint64_t v23 = v33;
    static Logger.assetVariants.getter();
    id v24 = v8;
    unint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      unint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      *(_DWORD *)unint64_t v27 = 136315138;
      uint64_t v28 = BSServiceConnectionHost.CAFDDescription.getter();
      uint64_t v35 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v28, v29, &v36);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "connection %s does not have required entitlement", v27, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v30 = v33;
    }
    else
    {

      uint64_t v30 = v23;
    }
    v15(v30, v34);
  }
}

void specialized CAFDAssetVariantsAgent._ConnectionProxy.fetchVariants(reply:)(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  id v9 = (void *)Strong;
  if (Strong)
  {
    uint64_t v10 = *(void *)(Strong + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetVariants);
    swift_bridgeObjectRetain();

    if (v10) {
      id v9 = (void *)Dictionary<>.init(_:)();
    }
    else {
      id v9 = 0;
    }
  }
  uint64_t v11 = swift_unknownObjectWeakLoadStrong();
  id v12 = (id)v11;
  if (v11)
  {
    id v13 = *(id *)(v11 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_sessionStatus);

    id v12 = [v13 currentSession];
    if (v12)
    {
      id v14 = [v12 configuration];

      id v12 = [v14 rightHandDrive];
    }
  }
  id v15 = [objc_allocWithZone((Class)NSNumber) initWithBool:v12];
  static Logger.assetVariants.getter();
  swift_bridgeObjectRetain_n();
  id v16 = a1;
  NSString v17 = Logger.logObject.getter();
  int v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, (os_log_type_t)v18))
  {
    v51 = v9;
    uint64_t v52 = a2;
    id v19 = v17;
    uint64_t v20 = v7;
    int v54 = v18;
    id v56 = v15;
    uint64_t v57 = v5;
    uint64_t v58 = v4;
    uint64_t v21 = swift_slowAlloc();
    unint64_t v22 = (void *)swift_slowAlloc();
    uint64_t v55 = swift_slowAlloc();
    uint64_t v59 = (uint64_t)v16;
    uint64_t v60 = v55;
    *(_DWORD *)uint64_t v21 = 138413314;
    id v23 = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    id v53 = v22;
    *unint64_t v22 = v16;

    *(_WORD *)(v21 + 12) = 2080;
    uint64_t v24 = swift_unknownObjectWeakLoadStrong();
    if (v24)
    {
      unint64_t v25 = (void *)v24;
      uint64_t v26 = *(void *)(v24 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetVariants);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v26 = 0;
    }
    unint64_t v27 = v20;
    uint64_t v28 = v19;
    id v9 = v51;
    uint64_t v59 = v26;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CAUVehicleTrait : String]?);
    uint64_t v29 = String.init<A>(describing:)();
    uint64_t v59 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v29, v30, &v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 22) = 2080;
    uint64_t v59 = (uint64_t)v9;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]?);
    uint64_t v31 = String.init<A>(describing:)();
    uint64_t v59 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v32, &v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 32) = 2080;
    uint64_t v33 = swift_unknownObjectWeakLoadStrong();
    if (v33)
    {
      uint64_t v34 = (void *)v33;
      uint64_t v35 = *(void **)(v33 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetExtrasURL);
      id v36 = v35;
    }
    else
    {
      uint64_t v35 = 0;
    }
    a2 = v52;
    uint64_t v59 = (uint64_t)v35;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSSecurityScopedURLWrapper?);
    uint64_t v37 = String.init<A>(describing:)();
    uint64_t v59 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v37, v38, &v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 42) = 2080;
    uint64_t v39 = swift_unknownObjectWeakLoadStrong();
    if (v39
      && (uint64_t v40 = (void *)v39,
          id v41 = *(id *)(v39 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_sessionStatus),
          v40,
          id v42 = [v41 currentSession],
          v41,
          v42))
    {
      id v43 = [v42 configuration];

      unsigned __int8 v44 = [v43 rightHandDrive];
    }
    else
    {
      unsigned __int8 v44 = 2;
    }
    LOBYTE(v59) = v44;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Bool?);
    uint64_t v45 = String.init<A>(describing:)();
    uint64_t v59 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v46, &v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v28, (os_log_type_t)v54, "fetching for %@ assetVariants=%s payload=%s extraAssetsURL=%s isRHD=%s", (uint8_t *)v21, 0x34u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v57 + 8))(v27, v58);
    id v15 = v56;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v47 = swift_unknownObjectWeakLoadStrong();
  if (!v47)
  {
    id v49 = 0;
    if (v9) {
      goto LABEL_23;
    }
LABEL_25:
    v50.super.Class isa = 0;
    goto LABEL_26;
  }
  v48 = (void *)v47;
  id v49 = *(id *)(v47 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetExtrasURL);

  if (!v9) {
    goto LABEL_25;
  }
LABEL_23:
  v50.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
LABEL_26:
  (*(void (**)(uint64_t, id, id, Class, void))(a2 + 16))(a2, v49, v15, v50.super.isa, 0);
  swift_bridgeObjectRelease();
}

void specialized Set.init(_nonEmptyArrayLiteral:)(unint64_t a1)
{
}

void specialized Set.init(_nonEmptyArrayLiteral:)(unint64_t a1, uint64_t *a2, void (*a3)(void))
{
  unint64_t v5 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v9)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(a2);
      uint64_t v6 = (void *)static _SetStorage.allocate(capacity:)();
      uint64_t v7 = a1 & 0xFFFFFFFFFFFFFF8;
      if (!v5) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v8) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v6 = &_swiftEmptySetSingleton;
  uint64_t v7 = a1 & 0xFFFFFFFFFFFFFF8;
  if (v5) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v8 = *(void *)(v7 + 16);
  if (!v8) {
    return;
  }
LABEL_9:
  uint64_t v10 = (char *)(v6 + 7);
  uint64_t v46 = v8;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      BOOL v13 = __OFADD__(v11++, 1);
      if (v13)
      {
        __break(1u);
        goto LABEL_36;
      }
      uint64_t v14 = v12;
      Swift::Int v15 = NSObject._rawHashValue(seed:)(v6[5]);
      uint64_t v16 = -1 << *((unsigned char *)v6 + 32);
      unint64_t v17 = v15 & ~v16;
      unint64_t v18 = v17 >> 6;
      uint64_t v19 = *(void *)&v10[8 * (v17 >> 6)];
      uint64_t v20 = 1 << v17;
      if (((1 << v17) & v19) != 0)
      {
        a3(0);
        id v21 = *(id *)(v6[6] + 8 * v17);
        char v22 = static NSObject.== infix(_:_:)();

        if (v22)
        {
LABEL_11:
          swift_unknownObjectRelease();
          goto LABEL_12;
        }
        uint64_t v23 = ~v16;
        while (1)
        {
          unint64_t v17 = (v17 + 1) & v23;
          unint64_t v18 = v17 >> 6;
          uint64_t v19 = *(void *)&v10[8 * (v17 >> 6)];
          uint64_t v20 = 1 << v17;
          if ((v19 & (1 << v17)) == 0) {
            break;
          }
          id v24 = *(id *)(v6[6] + 8 * v17);
          char v25 = static NSObject.== infix(_:_:)();

          if (v25) {
            goto LABEL_11;
          }
        }
      }
      *(void *)&v10[8 * v18] = v20 | v19;
      *(void *)(v6[6] + 8 * v17) = v14;
      uint64_t v26 = v6[2];
      BOOL v13 = __OFADD__(v26, 1);
      uint64_t v27 = v26 + 1;
      if (v13) {
        goto LABEL_37;
      }
      v6[2] = v27;
LABEL_12:
      if (v11 == v46) {
        return;
      }
    }
  }
  uint64_t v28 = 0;
  uint64_t v44 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v28 != v44)
  {
    Swift::Int v29 = v6[5];
    id v30 = *(id *)(a1 + 32 + 8 * v28);
    Swift::Int v31 = NSObject._rawHashValue(seed:)(v29);
    uint64_t v32 = -1 << *((unsigned char *)v6 + 32);
    unint64_t v33 = v31 & ~v32;
    unint64_t v34 = v33 >> 6;
    uint64_t v35 = *(void *)&v10[8 * (v33 >> 6)];
    uint64_t v36 = 1 << v33;
    if (((1 << v33) & v35) != 0)
    {
      a3(0);
      id v37 = *(id *)(v6[6] + 8 * v33);
      char v38 = static NSObject.== infix(_:_:)();

      if (v38) {
        goto LABEL_23;
      }
      uint64_t v39 = ~v32;
      unint64_t v33 = (v33 + 1) & v39;
      unint64_t v34 = v33 >> 6;
      uint64_t v35 = *(void *)&v10[8 * (v33 >> 6)];
      uint64_t v36 = 1 << v33;
      if ((v35 & (1 << v33)) != 0)
      {
        while (1)
        {
          id v40 = *(id *)(v6[6] + 8 * v33);
          char v41 = static NSObject.== infix(_:_:)();

          if (v41) {
            break;
          }
          unint64_t v33 = (v33 + 1) & v39;
          unint64_t v34 = v33 >> 6;
          uint64_t v35 = *(void *)&v10[8 * (v33 >> 6)];
          uint64_t v36 = 1 << v33;
          if ((v35 & (1 << v33)) == 0) {
            goto LABEL_31;
          }
        }
LABEL_23:

        uint64_t v8 = v46;
        goto LABEL_24;
      }
LABEL_31:
      uint64_t v8 = v46;
    }
    *(void *)&v10[8 * v34] = v36 | v35;
    *(void *)(v6[6] + 8 * v33) = v30;
    uint64_t v42 = v6[2];
    BOOL v13 = __OFADD__(v42, 1);
    uint64_t v43 = v42 + 1;
    if (v13) {
      goto LABEL_38;
    }
    v6[2] = v43;
LABEL_24:
    if (++v28 == v8) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

uint64_t type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy()
{
  return self;
}

unint64_t type metadata accessor for RBSAttribute()
{
  unint64_t result = lazy cache variable for type metadata for RBSAttribute;
  if (!lazy cache variable for type metadata for RBSAttribute)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for RBSAttribute);
  }
  return result;
}

uint64_t outlined init with take of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001A30C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void partial apply for closure #1 in CAFDAssetVariantsAgent.add(proxy:)()
{
  closure #1 in CAFDAssetVariantsAgent.add(proxy:)(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A];
  if (!lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A]);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10001A3F4()
{
  return _swift_deallocObject(v0, 32, 7);
}

void partial apply for closure #1 in CAFDAssetVariantsAgent._ConnectionProxy.init(agent:workQueue:connection:)(void *a1)
{
  closure #1 in CAFDAssetVariantsAgent._ConnectionProxy.init(agent:workQueue:connection:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10001A43C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed BSServiceConnectionConfiguring) -> ()(uint64_t a1)
{
  return thunk for @callee_guaranteed (@guaranteed BSServiceConnectionListenerConfiguring) -> ()(a1, *(uint64_t (**)(void))(v1 + 16));
}

void partial apply for closure #1 in closure #1 in CAFDAssetVariantsAgent._ConnectionProxy.init(agent:workQueue:connection:)()
{
}

uint64_t objectdestroy_38Tm()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void partial apply for closure #1 in CAFDAssetVariantsAgent.remove(proxy:)()
{
  closure #1 in CAFDAssetVariantsAgent.remove(proxy:)(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t outlined consume of Set<CAFDAssetVariantsAgent._ConnectionProxy>.Iterator._Variant()
{
  return swift_release();
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined init with copy of (CAUVehicleTrait, String)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CAUVehicleTrait, String));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void CAFDAgent.listener.setter()
{
}

uint64_t one-time initialization function for nowPlaying()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.nowPlaying);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.nowPlaying);
  return Logger.init(subsystem:category:)();
}

int64x2_t one-time initialization function for maxImageSize()
{
  int64x2_t result = vdupq_n_s64(0x407F400000000000uLL);
  static CAFDNowPlayingAgent.maxImageSize = (__int128)result;
  return result;
}

void CAFDNowPlayingAgent.lastMediaSourceIdentifier.didset()
{
  if (one-time initialization token for nowPlaying != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Logger.nowPlaying);
  uint64_t v2 = v0;
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)unint64_t v5 = 136446210;
    uint64_t v6 = *(void *)&v2[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier];
    unint64_t v7 = *(void *)&v2[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier + 8];
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v7, &v8);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Received new media source identifier %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  CAFDNowPlayingAgent.updateNowPlaying()();
}

id CAFDNowPlayingAgent.__allocating_init(carManager:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = specialized CAFDNowPlayingAgent.init(carManager:)(a1);

  return v4;
}

id CAFDNowPlayingAgent.init(carManager:)(void *a1)
{
  id v2 = specialized CAFDNowPlayingAgent.init(carManager:)(a1);

  return v2;
}

void CAFDNowPlayingAgent.refreshClients()()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_connections;
  swift_beginAccess();
  if ((*(void *)v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = __CocoaSet.count.getter();
    swift_bridgeObjectRelease();
    if (v2)
    {
LABEL_3:
      uint64_t v3 = swift_bridgeObjectRetain();
      specialized Sequence.forEach(_:)(v3);
      swift_bridgeObjectRelease();
      return;
    }
  }
  else if (*(void *)(*(void *)v1 + 16))
  {
    goto LABEL_3;
  }
  if (one-time initialization token for nowPlaying != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)static Logger.nowPlaying);
  unint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    unint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "No clients to refresh.", v7, 2u);
    swift_slowDealloc();
  }
}

void CAFDNowPlayingAgent.updateNowPlaying()()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v249 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v5 = (uint64_t *)&v0[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier];
  unint64_t v6 = *(void *)&v0[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier + 8];
  uint64_t v7 = HIBYTE(v6) & 0xF;
  if ((v6 & 0x2000000000000000) == 0) {
    uint64_t v7 = *(void *)&v0[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier] & 0xFFFFFFFFFFFFLL;
  }
  if (!v7)
  {
    if (one-time initialization token for nowPlaying != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v1, (uint64_t)static Logger.nowPlaying);
    v267 = Logger.logObject.getter();
    os_log_type_t v33 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v267, v33))
    {
      unint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v267, v33, "No current media source", v34, 2u);
      swift_slowDealloc();
    }
LABEL_22:
    uint64_t v35 = v267;

    return;
  }
  uint64_t v8 = *(void **)&v0[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_currentCar];
  if (!v8
    || (swift_bridgeObjectRetain(),
        id v9 = v8,
        NSString v10 = String._bridgeToObjectiveC()(),
        swift_bridgeObjectRelease(),
        id v11 = [v9 mediaSourceWithIdentifier:v10],
        v9,
        v10,
        !v11))
  {
    if (one-time initialization token for nowPlaying != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v1, (uint64_t)static Logger.nowPlaying);
    v267 = v0;
    uint64_t v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v28, v29))
    {
      id v30 = (uint8_t *)swift_slowAlloc();
      v270[0] = swift_slowAlloc();
      *(_DWORD *)id v30 = 136446210;
      uint64_t v31 = *v5;
      unint64_t v32 = v5[1];
      swift_bridgeObjectRetain();
      uint64_t v268 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v32, v270);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "No media source with identifier %{public}s", v30, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }

    goto LABEL_22;
  }
  if (![v11 receivedAllValues])
  {
    if (one-time initialization token for nowPlaying != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v1, (uint64_t)static Logger.nowPlaying);
    uint64_t v36 = v0;
    id v37 = Logger.logObject.getter();
    os_log_type_t v38 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      v270[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v39 = 136446210;
      uint64_t v40 = *v5;
      unint64_t v41 = v5[1];
      swift_bridgeObjectRetain();
      uint64_t v268 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v40, v41, v270);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Source has not received all values: %{public}s", v39, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    [v11 registerObserver:v36];

    return;
  }
  if (one-time initialization token for nowPlaying != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v1, (uint64_t)static Logger.nowPlaying);
  id v13 = v11;
  uint64_t v14 = v0;
  uint64_t v266 = v12;
  Swift::Int v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  BOOL v17 = os_log_type_enabled(v15, v16);
  id v264 = v13;
  v258 = v5;
  v267 = v14;
  uint64_t v251 = v2;
  if (v17)
  {
    uint64_t v18 = swift_slowAlloc();
    v270[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136446466;
    uint64_t v19 = *v5;
    unint64_t v20 = v5[1];
    swift_bridgeObjectRetain();
    uint64_t v21 = v19;
    id v13 = v264;
    uint64_t v268 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v20, v270);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2050;
    id v22 = [v13 mediaItems];
    if (v22)
    {
      uint64_t v23 = v22;
      id v24 = [v22 mediaItems];

      type metadata accessor for CAFMediaSource(0, &lazy cache variable for type metadata for CAFMediaItem);
      unint64_t v25 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      if (v25 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v26 = _CocoaArrayWrapper.endIndex.getter();
        id v248 = v264;

        id v13 = v248;
        swift_bridgeObjectRelease_n();
      }
      else
      {
        uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
        id v27 = v264;

        id v13 = v27;
        swift_bridgeObjectRelease();
      }
    }
    else
    {

      uint64_t v26 = 0;
    }
    uint64_t v14 = v267;
    uint64_t v268 = v26;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Source %{public}s has %{public}ld media item(s)", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  unsigned int v42 = [v13 mediaSourceSemanticType];
  uint64_t v43 = OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_nowPlaying;
  uint64_t v44 = *(Class *)((char *)&v14->isa + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_nowPlaying);
  unsigned int v259 = v42;
  if (!v44)
  {
    uint64_t v253 = 0;
    uint64_t v265 = 0;
    uint64_t v256 = 0;
    uint64_t v252 = 0;
    v261 = (uint64_t *)0xE000000000000000;
    uint64_t v47 = 0xE000000000000000;
LABEL_42:
    unint64_t v52 = 0xE000000000000000;
    goto LABEL_43;
  }
  id v45 = [v44 title];
  uint64_t v265 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v47 = v46;

  v48 = *(Class *)((char *)&v14->isa + v43);
  if (!v48)
  {
    uint64_t v253 = 0;
    uint64_t v256 = 0;
    uint64_t v252 = 0;
    v261 = (uint64_t *)0xE000000000000000;
    goto LABEL_42;
  }
  id v49 = [v48 artist];
  uint64_t v50 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v52 = v51;

  id v53 = *(Class *)((char *)&v14->isa + v43);
  uint64_t v256 = v50;
  if (v53)
  {
    id v54 = [v53 album];
    uint64_t v253 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v261 = v55;

    id v56 = *(Class *)((char *)&v14->isa + v43);
    if (v56)
    {
      id v57 = [v56 userVisibleDescription];
      if (v57)
      {
        uint64_t v58 = v57;
        uint64_t v252 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v60 = v59;

        goto LABEL_44;
      }
    }
    uint64_t v252 = 0;
  }
  else
  {
    uint64_t v253 = 0;
    uint64_t v252 = 0;
    v261 = (uint64_t *)0xE000000000000000;
  }
LABEL_43:
  unint64_t v60 = 0xE000000000000000;
LABEL_44:
  uint64_t v263 = v43;
  v61 = *(Class *)((char *)&v14->isa + v43);
  if (v61)
  {
    id v62 = [v61 artworkCharacteristic];
    id v260 = [v62 transactionId];
  }
  else
  {
    id v260 = 0;
  }
  id v63 = [v13 mediaItemImagesCharacteristic];
  if (v63)
  {
    uint64_t v64 = v63;
    id v257 = [v63 transactionId];
  }
  else
  {
    id v257 = 0;
  }
  if (![v13 hasCurrentMediaItemIdentifier]) {
    goto LABEL_64;
  }
  if (![v13 hasMediaItems]) {
    goto LABEL_64;
  }
  id v65 = [v13 currentMediaItemIdentifier];
  if (!v65) {
    goto LABEL_64;
  }
  uint64_t v66 = v65;
  uint64_t v67 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v69 = v68;

  uint64_t v70 = HIBYTE(v69) & 0xF;
  if ((v69 & 0x2000000000000000) == 0) {
    uint64_t v70 = v67 & 0xFFFFFFFFFFFFLL;
  }
  if (!v70 || (id v71 = [v13 mediaItems]) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_64;
  }
  v72 = v71;
  id v73 = [v71 mediaItems];

  type metadata accessor for CAFMediaSource(0, &lazy cache variable for type metadata for CAFMediaItem);
  unint64_t v74 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v13 = v264;
  swift_bridgeObjectRetain();
  v75 = specialized Sequence.first(where:)(v74, v67, v69);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  if (!v75)
  {
LABEL_64:
    unint64_t isa = Logger.logObject.getter();
    os_log_type_t v86 = static os_log_type_t.default.getter();
    if (os_log_type_enabled((os_log_t)isa, v86))
    {
      v87 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v87 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)isa, v86, "No available current media item", v87, 2u);
      swift_slowDealloc();
    }

    if ([v13 hasCurrentFrequency]
      && ([v13 currentFrequencyInvalid] & 1) == 0
      && [v13 currentFrequency])
    {
      uint64_t v88 = UInt32.formattedFrequency(in:)[v13 mediaSourceSemanticType](objc_msgSend(v13, "currentFrequency"));
      unint64_t isa = v89;
      swift_bridgeObjectRetain();
      v90 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
      unint64_t v92 = *((void *)v90 + 2);
      unint64_t v91 = *((void *)v90 + 3);
      if (v92 >= v91 >> 1) {
        v90 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v91 > 1), v92 + 1, 1, v90);
      }
      *((void *)v90 + 2) = v92 + 1;
      v93 = &v90[16 * v92];
      *((void *)v93 + 4) = v88;
      *((void *)v93 + 5) = isa;
      swift_bridgeObjectRelease();
      uint64_t v262 = 0;
      uint64_t v254 = 0;
      id v255 = 0;
    }
    else
    {
      uint64_t v262 = 0;
      uint64_t v254 = 0;
      id v255 = 0;
      v90 = (char *)&_swiftEmptyArrayStorage;
    }
    goto LABEL_73;
  }
  v249[1] = 0;
  id v255 = v75;
  v76 = v75;
  v77 = Logger.logObject.getter();
  int v78 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v77, (os_log_type_t)v78))
  {
    LODWORD(v254) = v78;
    uint64_t v262 = (uint64_t)v77;
    v79 = (uint8_t *)swift_slowAlloc();
    uint64_t v250 = swift_slowAlloc();
    v270[0] = v250;
    *(_DWORD *)v79 = 136446210;
    id v80 = [v76 identifier];
    if (v80)
    {
      v81 = v80;
      uint64_t v82 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v84 = v83;
    }
    else
    {
      uint64_t v82 = 0;
      unint64_t v84 = 0xE000000000000000;
    }
    uint64_t v268 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v82, v84, v270);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    os_log_t v100 = (os_log_t)v262;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v262, (os_log_type_t)v254, "Found media item with identifier %{public}s", v79, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    id v13 = v264;
  }
  else
  {
  }
  uint64_t v101 = swift_allocObject();
  *(void *)(v101 + 16) = 0;
  v102 = (v101 + 16);
  uint64_t v250 = v101;
  *(void *)(v101 + 24) = 0xE000000000000000;
  unsigned int v103 = [v13 mediaSourceSemanticType];
  uint64_t v262 = (uint64_t)v102;
  if (v103 <= 8 && ((1 << v103) & 0x106) != 0)
  {
    if ([v76 frequency])
    {
      uint64_t v254 = UInt32.formattedFrequency(in:)[v13 mediaSourceSemanticType](objc_msgSend(v76, "frequency"));
      unint64_t v105 = v104;
    }
    else
    {
      uint64_t v254 = 0;
      unint64_t v105 = 0xE000000000000000;
    }
    id v106 = [v76 mediaItemName];
    if (v106)
    {
      v107 = v106;
      uint64_t v108 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v110 = v109;

      uint64_t v111 = HIBYTE(v110) & 0xF;
      if ((v110 & 0x2000000000000000) == 0) {
        uint64_t v111 = v108 & 0xFFFFFFFFFFFFLL;
      }
      if (v111)
      {
LABEL_97:
        uint64_t v116 = HIBYTE(v105) & 0xF;
        uint64_t v117 = v254;
        if ((v105 & 0x2000000000000000) == 0) {
          uint64_t v116 = v254 & 0xFFFFFFFFFFFFLL;
        }
        if (v116)
        {
          v118._countAndFlagsBits = 8013901;
          v118._object = (void *)0xE300000000000000;
          if (!String.hasSuffix(_:)(v118)) {
            firstLineAppend #1 (_:) in CAFDNowPlayingAgent.updateNowPlaying()(v117, (void *)v105, v250);
          }
        }
        swift_bridgeObjectRelease();
LABEL_103:
        firstLineAppend #1 (_:) in CAFDNowPlayingAgent.updateNowPlaying()(v108, (void *)v110, v250);
        goto LABEL_110;
      }
      swift_bridgeObjectRelease();
    }
    id v112 = [v76 mediaItemShortName];
    if (!v112)
    {
LABEL_110:
      swift_bridgeObjectRelease();
      goto LABEL_111;
    }
    v113 = v112;
    uint64_t v108 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v110 = v114;

    uint64_t v115 = HIBYTE(v110) & 0xF;
    if ((v110 & 0x2000000000000000) == 0) {
      uint64_t v115 = v108 & 0xFFFFFFFFFFFFLL;
    }
    if (!v115)
    {
      swift_bridgeObjectRelease();
      goto LABEL_110;
    }
    goto LABEL_97;
  }
  id v119 = [v76 mediaItemName];
  if (v119)
  {
    v120 = v119;
    uint64_t v108 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v110 = v121;

    uint64_t v122 = HIBYTE(v110) & 0xF;
    if ((v110 & 0x2000000000000000) == 0) {
      uint64_t v122 = v108 & 0xFFFFFFFFFFFFLL;
    }
    if (!v122) {
      goto LABEL_110;
    }
    goto LABEL_103;
  }
LABEL_111:
  swift_beginAccess();
  unint64_t isa = *(void *)(v250 + 24);
  uint64_t v262 = *(void *)(v250 + 16);
  swift_bridgeObjectRetain_n();
  v90 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
  unint64_t v95 = *((void *)v90 + 2);
  unint64_t v123 = *((void *)v90 + 3);
  uint64_t v94 = v95 + 1;
  if (v95 >= v123 >> 1) {
    goto LABEL_243;
  }
  while (2)
  {
    *((void *)v90 + 2) = v94;
    v124 = &v90[16 * v95];
    *((void *)v124 + 4) = v262;
    *((void *)v124 + 5) = isa;
    swift_bridgeObjectRelease();
    uint64_t v254 = [v76 multicast];
    id v125 = [v76 mediaItemImageIdentifier];
    if (!v125)
    {
      swift_release();
      goto LABEL_231;
    }
    v126 = v125;
    uint64_t v127 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t isa = v128;

    uint64_t v129 = HIBYTE(isa) & 0xF;
    if ((isa & 0x2000000000000000) == 0) {
      uint64_t v129 = v127 & 0xFFFFFFFFFFFFLL;
    }
    if (!v129 || (id v130 = v264, ![v264 hasMediaItemImages]))
    {
      swift_release();
      swift_bridgeObjectRelease();
LABEL_231:

      goto LABEL_232;
    }
    v249[0] = v76;
    id v131 = [v130 mediaItemImages];
    if (v131)
    {
      v132 = v131;
      id v133 = [v131 mediaItemImages];

      type metadata accessor for CAFMediaSource(0, &lazy cache variable for type metadata for CAFMediaItemImage);
      unint64_t v134 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      swift_bridgeObjectRetain();
      v135 = specialized Sequence.first(where:)(v134, v127, isa);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      if (v135)
      {
        id v136 = [v135 imageData];
        unint64_t v95 = (unint64_t)v267;
        if (v136)
        {
          unint64_t isa = (unint64_t)v136;
          uint64_t v262 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v138 = v137;
          swift_release();

          uint64_t v94 = v138;
          if ((v47 & 0x2000000000000000) == 0) {
            goto LABEL_74;
          }
        }
        else
        {
          swift_release();

          uint64_t v262 = 0;
          uint64_t v94 = 0xF000000000000000;
          if ((v47 & 0x2000000000000000) == 0) {
            goto LABEL_74;
          }
        }
        goto LABEL_121;
      }
      swift_release();
    }
    else
    {
      swift_release();
      swift_bridgeObjectRelease();
    }

LABEL_232:
    uint64_t v262 = 0;
LABEL_73:
    uint64_t v94 = 0xF000000000000000;
    unint64_t v95 = (unint64_t)v267;
    if ((v47 & 0x2000000000000000) == 0)
    {
LABEL_74:
      if ((v265 & 0xFFFFFFFFFFFFLL) != 0) {
        goto LABEL_75;
      }
      goto LABEL_122;
    }
LABEL_121:
    if ((v47 & 0xF00000000000000) != 0)
    {
LABEL_75:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v90 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v90 + 2) + 1, 1, v90);
      }
      unint64_t v97 = *((void *)v90 + 2);
      unint64_t v96 = *((void *)v90 + 3);
      unint64_t isa = v97 + 1;
      if (v97 >= v96 >> 1) {
        v90 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v96 > 1), v97 + 1, 1, v90);
      }
      *((void *)v90 + 2) = isa;
      v98 = &v90[16 * v97];
      *((void *)v98 + 4) = v265;
      v99 = v98 + 32;
      goto LABEL_130;
    }
LABEL_122:
    swift_bridgeObjectRelease();
    uint64_t v139 = HIBYTE(v60) & 0xF;
    uint64_t v140 = v252;
    if ((v60 & 0x2000000000000000) == 0) {
      uint64_t v139 = v252 & 0xFFFFFFFFFFFFLL;
    }
    if (v139)
    {
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v90 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v90 + 2) + 1, 1, v90);
      }
      unint64_t v142 = *((void *)v90 + 2);
      unint64_t v141 = *((void *)v90 + 3);
      unint64_t isa = v142 + 1;
      if (v142 >= v141 >> 1) {
        v90 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v141 > 1), v142 + 1, 1, v90);
      }
      *((void *)v90 + 2) = isa;
      v143 = &v90[16 * v142];
      *((void *)v143 + 4) = v140;
      v99 = v143 + 32;
      uint64_t v47 = v60;
LABEL_130:
      *((void *)v99 + 1) = v47;
    }
    v144 = v261;
    swift_bridgeObjectRelease();
    uint64_t v145 = HIBYTE(v52) & 0xF;
    uint64_t v146 = v256;
    if ((v52 & 0x2000000000000000) == 0) {
      uint64_t v145 = v256 & 0xFFFFFFFFFFFFLL;
    }
    if (v145)
    {
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v90 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v90 + 2) + 1, 1, v90);
      }
      unint64_t v148 = *((void *)v90 + 2);
      unint64_t v147 = *((void *)v90 + 3);
      unint64_t isa = v148 + 1;
      if (v148 >= v147 >> 1) {
        v90 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v147 > 1), v148 + 1, 1, v90);
      }
      *((void *)v90 + 2) = isa;
      v149 = &v90[16 * v148];
      *((void *)v149 + 4) = v146;
      *((void *)v149 + 5) = v52;
    }
    swift_bridgeObjectRelease();
    unint64_t v52 = v259;
    if (specialized Sequence<>.contains(_:)(v259, (uint64_t)&outlined read-only object #0 of CAFDNowPlayingAgent.updateNowPlaying()))
    {
      uint64_t v150 = ((unint64_t)v144 >> 56) & 0xF;
      if (((unint64_t)v144 & 0x2000000000000000) == 0) {
        uint64_t v150 = v253 & 0xFFFFFFFFFFFFLL;
      }
      if (v150)
      {
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v90 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v90 + 2) + 1, 1, v90);
        }
        unint64_t v152 = *((void *)v90 + 2);
        unint64_t v151 = *((void *)v90 + 3);
        unint64_t isa = v152 + 1;
        if (v152 >= v151 >> 1) {
          v90 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v151 > 1), v152 + 1, 1, v90);
        }
        *((void *)v90 + 2) = isa;
        v153 = &v90[16 * v152];
        *((void *)v153 + 4) = v253;
        *((void *)v153 + 5) = v144;
      }
    }
    swift_bridgeObjectRelease();
    v76 = (char *)swift_allocObject();
    *((_OWORD *)v76 + 1) = xmmword_100029DC0;
    v261 = (uint64_t *)(v76 + 16);
    v154 = *(void **)(v95 + v263);
    uint64_t v263 = v94;
    uint64_t v265 = (uint64_t)v76;
    if (v154)
    {
      unint64_t isa = (unint64_t)[v154 artwork];
      uint64_t v94 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v156 = v155;

      switch(v156 >> 62)
      {
        case 1uLL:
          uint64_t v157 = (int)v94;
          uint64_t v158 = v94 >> 32;
          goto LABEL_154;
        case 2uLL:
          uint64_t v157 = *(void *)(v94 + 16);
          uint64_t v158 = *(void *)(v94 + 24);
LABEL_154:
          if (v157 != v158) {
            goto LABEL_155;
          }
          goto LABEL_160;
        case 3uLL:
          goto LABEL_160;
        default:
          if ((v156 & 0xFF000000000000) == 0) {
            goto LABEL_160;
          }
LABEL_155:
          unint64_t isa = (unint64_t)Data._bridgeToObjectiveC()().super.isa;
          BOOL IsValidImage = CAFImageDataIsValidImage((const __CFData *)isa);

          if (!IsValidImage)
          {
LABEL_160:
            outlined consume of Data._Representation(v94, v156);
            unint64_t v95 = (unint64_t)v267;
            uint64_t v94 = v263;
            goto LABEL_161;
          }
          v160 = Logger.logObject.getter();
          os_log_type_t v161 = static os_log_type_t.default.getter();
          unint64_t v95 = v161;
          if (os_log_type_enabled(v160, v161))
          {
            v162 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v162 = 0;
            _os_log_impl((void *)&_mh_execute_header, v160, (os_log_type_t)v95, "Applying now playing artwork for snapshot.", v162, 2u);
            v76 = (char *)v265;
            swift_slowDealloc();
          }

          v163 = v76;
          uint64_t v164 = *((void *)v76 + 2);
          unint64_t v165 = *((void *)v163 + 3);
          *((void *)v163 + 2) = v94;
          *((void *)v163 + 3) = v156;
          outlined copy of Data._Representation(v94, v156);
          outlined consume of Data?(v164, v165);
          v166 = *(Class *)((char *)&v267->isa + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastSnapshot);
          if (v166)
          {
            id v167 = v166;
            unint64_t isa = (unint64_t)[v167 lastArtworkToken];
            outlined consume of Data._Representation(v94, v156);
          }
          else
          {
            outlined consume of Data._Representation(v94, v156);
            unint64_t isa = 0;
          }
          uint64_t v183 = (uint64_t)v260;
          unint64_t v60 = v260 != (id)isa;
          uint64_t v168 = 1;
          break;
      }
      goto LABEL_178;
    }
LABEL_161:
    if ((unint64_t)v94 >> 60 != 15)
    {
      uint64_t v168 = 1;
      unint64_t v60 = 0;
      uint64_t v169 = 0;
      switch((unint64_t)v94 >> 62)
      {
        case 1uLL:
          Class v181 = (Class)(int)v262;
          uint64_t v182 = v262 >> 32;
          goto LABEL_171;
        case 2uLL:
          Class v181 = *(Class *)(v262 + 16);
          uint64_t v182 = *(void *)(v262 + 24);
LABEL_171:
          if (v181 == (Class)v182) {
            goto LABEL_172;
          }
          goto LABEL_164;
        case 3uLL:
          goto LABEL_180;
        default:
          if ((v94 & 0xFF000000000000) == 0) {
            goto LABEL_172;
          }
LABEL_164:
          unint64_t v170 = v94;
          uint64_t v94 = v262;
          outlined copy of Data._Representation(v262, v170);
          CFDataRef v171 = Data._bridgeToObjectiveC()().super.isa;
          unint64_t isa = CAFImageDataIsValidImage(v171);

          if (!isa)
          {
            outlined consume of Data?(v94, v170);
            uint64_t v169 = 0;
            unint64_t v60 = 0;
            uint64_t v168 = 1;
            goto LABEL_179;
          }
          v172 = Logger.logObject.getter();
          os_log_type_t v173 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v172, v173))
          {
            v174 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v174 = 0;
            _os_log_impl((void *)&_mh_execute_header, v172, v173, "Applying media item artwork for snapshot.", v174, 2u);
            swift_slowDealloc();
          }

          uint64_t v175 = v265;
          uint64_t v176 = *(void *)(v265 + 16);
          unint64_t v177 = *(void *)(v265 + 24);
          uint64_t v94 = v262;
          unint64_t v178 = v263;
          *(void *)(v265 + 16) = v262;
          *(void *)(v175 + 24) = v178;
          outlined copy of Data._Representation(v94, v178);
          outlined consume of Data?(v176, v177);
          v179 = *(void **)(v95 + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastSnapshot);
          if (v179)
          {
            id v180 = v179;
            unint64_t isa = (unint64_t)[v180 lastMediaItemImageToken];
            outlined consume of Data?(v94, v178);
          }
          else
          {
            outlined consume of Data?(v94, v178);
            unint64_t isa = 0;
          }
          uint64_t v168 = 0;
          uint64_t v183 = (uint64_t)v257;
          unint64_t v60 = v257 != (id)isa;
          break;
      }
LABEL_178:
      uint64_t v169 = v183;
LABEL_179:
      v76 = (char *)v265;
      goto LABEL_180;
    }
LABEL_172:
    uint64_t v169 = 0;
    unint64_t v60 = 0;
    uint64_t v168 = 1;
LABEL_180:
    unint64_t v184 = *((void *)v76 + 3);
    uint64_t v256 = v168;
    if (v184 >> 60 == 15)
    {
      v185 = Logger.logObject.getter();
      os_log_type_t v186 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v185, v186))
      {
        v187 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v187 = 0;
        _os_log_impl((void *)&_mh_execute_header, v185, v186, "No available artwork data.", v187, 2u);
        v76 = (char *)v265;
        swift_slowDealloc();
      }

      unint64_t v95 = (unint64_t)v258;
      goto LABEL_219;
    }
    uint64_t v188 = *((void *)v76 + 2);
    uint64_t v47 = 0;
    switch(v184 >> 62)
    {
      case 1uLL:
        unint64_t v123 = (HIDWORD(v188) - v188);
        if (__OFSUB__(HIDWORD(v188), v188))
        {
          __break(1u);
LABEL_240:
          __break(1u);
LABEL_241:
          __break(1u);
LABEL_242:
          __break(1u);
LABEL_243:
          v90 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v123 > 1), v94, 1, v90);
          continue;
        }
        uint64_t v47 = (int)v123;
LABEL_189:
        uint64_t v253 = v169;
        unint64_t isa = Logger.logObject.getter();
        os_log_type_t v191 = static os_log_type_t.default.getter();
        uint64_t v94 = v191;
        if (os_log_type_enabled((os_log_t)isa, v191))
        {
          uint64_t v192 = swift_slowAlloc();
          *(_DWORD *)uint64_t v192 = 134218240;
          v270[0] = v47;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v192 + 12) = 2048;
          v270[0] = v253;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)isa, (os_log_type_t)v94, "Processing new artwork data of size %ld; transaction %ld.",
            (uint8_t *)v192,
            0x16u);
          v76 = (char *)v265;
          swift_slowDealloc();
        }

        if (v60)
        {
          unint64_t v193 = *((void *)v76 + 3);
          if (v193 >> 60 != 15)
          {
            uint64_t v194 = *v261;
            outlined copy of Data._Representation(*v261, v193);
            v195.super.unint64_t isa = Data._bridgeToObjectiveC()().super.isa;
            outlined consume of Data?(v194, v193);
            if (one-time initialization token for maxImageSize != -1) {
              swift_once();
            }
            v196 = CAFImageDataByScalingImageData(v195.super.isa, *(double *)&static CAFDNowPlayingAgent.maxImageSize, *((double *)&static CAFDNowPlayingAgent.maxImageSize + 1));

            unint64_t isa = static Data._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v94 = v197;

            v76 = (char *)v265;
            outlined consume of Data?(*(void *)(v265 + 16), *(void *)(v265 + 24));
            *((void *)v76 + 2) = isa;
            *((void *)v76 + 3) = v94;
            goto LABEL_196;
          }
LABEL_249:

          outlined consume of Data?(v262, v263);
          __break(1u);
LABEL_250:
          swift_release_n();
          __break(1u);
LABEL_251:
          swift_release();
          __break(1u);
          JUMPOUT(0x10001D0E8);
        }
LABEL_196:
        unint64_t v95 = (unint64_t)v258;
        if (v47 >= 1)
        {
          unint64_t v198 = *((void *)v76 + 3);
          if (v198 >> 60 != 15)
          {
            uint64_t v199 = *((void *)v76 + 2);
            switch(v198 >> 62)
            {
              case 1uLL:
                unint64_t v123 = (HIDWORD(v199) - v199);
                if (__OFSUB__(HIDWORD(v199), v199)) {
                  goto LABEL_241;
                }
                unint64_t v123 = (int)v123;
LABEL_203:
                if ((uint64_t)v123 >= v47) {
                  goto LABEL_219;
                }
LABEL_204:
                v204 = v76;
                uint64_t v205 = v251;
                (*(void (**)(char *, uint64_t, uint64_t))(v251 + 16))(v4, v266, v1);
                swift_retain_n();
                v206 = Logger.logObject.getter();
                int v207 = static os_log_type_t.default.getter();
                if (!os_log_type_enabled(v206, (os_log_type_t)v207))
                {

                  swift_release_n();
                  (*(void (**)(char *, uint64_t))(v205 + 8))(v4, v1);
                  v76 = v204;
                  goto LABEL_219;
                }
                LODWORD(v252) = v207;
                uint64_t v208 = swift_slowAlloc();
                v270[0] = swift_slowAlloc();
                *(_DWORD *)uint64_t v208 = 134218498;
                swift_beginAccess();
                unint64_t v209 = *((void *)v204 + 3);
                if (v209 >> 60 == 15) {
                  goto LABEL_250;
                }
                break;
              case 2uLL:
                uint64_t v202 = v199 + 16;
                uint64_t v201 = *(void *)(v199 + 16);
                uint64_t v200 = *(void *)(v202 + 8);
                BOOL v203 = __OFSUB__(v200, v201);
                unint64_t v123 = v200 - v201;
                if (!v203) {
                  goto LABEL_203;
                }
                goto LABEL_242;
              case 3uLL:
                goto LABEL_204;
              default:
                unint64_t v123 = BYTE6(v198);
                goto LABEL_203;
            }
            uint64_t v210 = *((void *)v204 + 2);
            uint64_t v211 = 0;
            switch(v209 >> 62)
            {
              case 1uLL:
                if (!__OFSUB__(HIDWORD(v210), v210))
                {
                  uint64_t v211 = HIDWORD(v210) - (int)v210;
LABEL_212:
                  uint64_t v215 = v265;
                  swift_release();
                  uint64_t v269 = v211;
                  UnsafeMutableRawBufferPointer.copyMemory(from:)();
                  swift_release();
                  *(_WORD *)(v208 + 12) = 2080;
                  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
                  uint64_t v216 = swift_allocObject();
                  *(_OWORD *)(v216 + 16) = xmmword_100029DD0;
                  unint64_t v217 = *(void *)(v215 + 24);
                  if (v217 >> 60 == 15) {
                    goto LABEL_251;
                  }
                  uint64_t v218 = *(void *)(v215 + 16);
                  uint64_t v219 = 0;
                  switch(v217 >> 62)
                  {
                    case 1uLL:
                      LODWORD(v219) = HIDWORD(v218) - v218;
                      if (__OFSUB__(HIDWORD(v218), v218)) {
                        goto LABEL_246;
                      }
                      uint64_t v219 = (int)v219;
LABEL_218:
                      float v222 = (double)v219 * 100.0 / (double)v47;
                      *(void *)(v216 + 56) = &type metadata for Float;
                      *(void *)(v216 + 64) = &protocol witness table for Float;
                      *(float *)(v216 + 32) = v222;
                      uint64_t v223 = String.init(format:_:)();
                      uint64_t v269 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v223, v224, v270);
                      UnsafeMutableRawBufferPointer.copyMemory(from:)();
                      v76 = (char *)v265;
                      swift_release_n();
                      swift_bridgeObjectRelease();
                      *(_WORD *)(v208 + 22) = 2048;
                      uint64_t v269 = v253;
                      UnsafeMutableRawBufferPointer.copyMemory(from:)();
                      _os_log_impl((void *)&_mh_execute_header, v206, (os_log_type_t)v252, "Final artwork size %ld (deflated to %s%% of original), ; transaction %ld",
                        (uint8_t *)v208,
                        0x20u);
                      swift_arrayDestroy();
                      swift_slowDealloc();
                      swift_slowDealloc();

                      (*(void (**)(char *, uint64_t))(v251 + 8))(v4, v1);
                      unint64_t v95 = (unint64_t)v258;
                      LOBYTE(v52) = v259;
                      break;
                    case 2uLL:
                      uint64_t v221 = *(void *)(v218 + 16);
                      uint64_t v220 = *(void *)(v218 + 24);
                      BOOL v203 = __OFSUB__(v220, v221);
                      uint64_t v219 = v220 - v221;
                      if (!v203) {
                        goto LABEL_218;
                      }
                      goto LABEL_247;
                    case 3uLL:
                      goto LABEL_218;
                    default:
                      uint64_t v219 = BYTE6(v217);
                      goto LABEL_218;
                  }
                  goto LABEL_219;
                }
                __break(1u);
LABEL_245:
                __break(1u);
LABEL_246:
                __break(1u);
LABEL_247:
                __break(1u);
                break;
              case 2uLL:
                uint64_t v214 = v210 + 16;
                uint64_t v213 = *(void *)(v210 + 16);
                uint64_t v212 = *(void *)(v214 + 8);
                uint64_t v211 = v212 - v213;
                if (!__OFSUB__(v212, v213)) {
                  goto LABEL_212;
                }
                goto LABEL_245;
              case 3uLL:
                goto LABEL_212;
              default:
                uint64_t v211 = BYTE6(v209);
                goto LABEL_212;
            }
          }

          outlined consume of Data?(v262, v263);
          __break(1u);
          goto LABEL_249;
        }
LABEL_219:
        swift_beginAccess();
        v225 = v76;
        uint64_t v226 = *((void *)v76 + 2);
        unint64_t v227 = *((void *)v225 + 3);
        uint64_t v228 = *(void *)v95;
        uint64_t v229 = *(void *)(v95 + 8);
        type metadata accessor for CAFMediaSource(0, &lazy cache variable for type metadata for CAFNowPlayingSnapshot);
        swift_bridgeObjectRetain();
        outlined copy of Data?(v226, v227);
        id v230 = CAFNowPlayingSnapshot.__allocating_init(titles:artworkData:mediaSourceType:mediaSourceIdentifier:artworkToken:mediaItemImageToken:artworkType:multicast:)((uint64_t)v90, v226, v227, v52, v228, v229, (uint64_t)v260, (uint64_t)v257, v256, v254);
        uint64_t v231 = OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastSnapshot;
        v232 = v267;
        v233 = *(Class *)((char *)&v267->isa + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastSnapshot);
        id v234 = v264;
        if (v233)
        {
          id v235 = v233;
          if ([v235 isEqual:v230])
          {
            v236 = Logger.logObject.getter();
            os_log_type_t v237 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v236, v237))
            {
              v238 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v238 = 0;
              _os_log_impl((void *)&_mh_execute_header, v236, v237, "No change in snapshot; not notifying clients.",
                v238,
                2u);
              swift_slowDealloc();

              outlined consume of Data?(v262, v263);
              swift_release();
            }
            else
            {

              outlined consume of Data?(v262, v263);
              swift_release();
            }
            return;
          }
        }
        id v239 = v230;
        v240 = Logger.logObject.getter();
        os_log_type_t v241 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v240, v241))
        {
          v242 = (uint8_t *)swift_slowAlloc();
          v243 = (void *)swift_slowAlloc();
          *(_DWORD *)v242 = 138412290;
          uint64_t v269 = (uint64_t)v239;
          id v244 = v239;
          id v234 = v264;
          v232 = v267;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          void *v243 = v239;

          _os_log_impl((void *)&_mh_execute_header, v240, v241, "Generated snapshot %@", v242, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
        os_log_t v245 = (os_log_t)v262;
        v246 = *(Class *)((char *)&v232->isa + v231);
        *(Class *)((char *)&v232->isa + v231) = (Class)v239;
        id v247 = v239;

        CAFDNowPlayingAgent.refreshClients()();
        outlined consume of Data?((uint64_t)v245, v263);
        swift_release();

        return;
      case 2uLL:
        uint64_t v190 = v188 + 16;
        uint64_t v189 = *(void *)(v188 + 16);
        unint64_t v123 = *(void *)(v190 + 8);
        uint64_t v47 = v123 - v189;
        if (!__OFSUB__(v123, v189)) {
          goto LABEL_189;
        }
        goto LABEL_240;
      case 3uLL:
        goto LABEL_189;
      default:
        uint64_t v47 = BYTE6(v184);
        goto LABEL_189;
    }
  }
}

uint64_t firstLineAppend #1 (_:) in CAFDNowPlayingAgent.updateNowPlaying()(uint64_t a1, void *a2, uint64_t a3)
{
  swift_beginAccess();
  unint64_t v6 = *(void *)(a3 + 24);
  uint64_t v7 = *(void *)(a3 + 16) & 0xFFFFFFFFFFFFLL;
  if ((v6 & 0x2000000000000000) != 0) {
    uint64_t v7 = HIBYTE(v6) & 0xF;
  }
  if (v7)
  {
    swift_beginAccess();
    v8._countAndFlagsBits = 32;
    v8._object = (void *)0xE100000000000000;
    String.append(_:)(v8);
    swift_endAccess();
  }
  swift_beginAccess();
  v9._countAndFlagsBits = a1;
  v9._object = a2;
  String.append(_:)(v9);
  return swift_endAccess();
}

uint64_t UInt32.formattedFrequency(in:)(char a1, unsigned int a2)
{
  if (a1 == 8 || a1 == 2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_100029DD0;
    *(void *)(v4 + 56) = &type metadata for Double;
    *(void *)(v4 + 64) = &protocol witness table for Double;
    *(double *)(v4 + 32) = (double)a2 / 1000.0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_100029DD0;
    *(void *)(v5 + 56) = &type metadata for UInt;
    *(void *)(v5 + 64) = &protocol witness table for UInt;
    *(void *)(v5 + 32) = a2;
  }

  return String.init(format:_:)();
}

BOOL specialized Sequence<>.contains(_:)(BOOL result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  int v3 = result;
  if (*(unsigned char *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 33; ; ++i)
  {
    uint64_t v5 = i - 31;
    if (__OFADD__(i - 32, 1)) {
      break;
    }
    int v6 = *(unsigned __int8 *)(a2 + i);
    int64x2_t result = v6 == v3;
    if (v6 == v3 || v5 == v2) {
      return result;
    }
  }
  __break(1u);
  return result;
}

id CAFNowPlayingSnapshot.__allocating_init(titles:artworkData:mediaSourceType:mediaSourceIdentifier:artworkToken:mediaItemImageToken:artworkType:multicast:)(uint64_t a1, uint64_t a2, unint64_t a3, unsigned __int8 a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  v13.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  if (a3 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(a2, a3);
  }
  id v15 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v17 = [v15 initWithTitles:v13.super.isa artworkData:isa mediaSourceType:a4 mediaSourceIdentifier:v16 artworkToken:a7 mediaItemImageToken:a8 artworkType:a9 multicast:a10];

  return v17;
}

uint64_t CAFDNowPlayingAgent.__ivar_destroyer()
{
  swift_unknownObjectWeakDestroy();

  return swift_bridgeObjectRelease();
}

id CAFDNowPlayingAgent.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAFDNowPlayingAgent();
  return [super dealloc];
}

void CAFDNowPlayingAgent.carDidUpdateAccessories(_:)(void *a1)
{
  int v3 = [a1 media];
  if (!v3) {
    goto LABEL_18;
  }
  uint64_t v4 = v3;
  uint64_t v5 = [a1 nowPlayingInformation];
  if (!v5)
  {

LABEL_18:
    if (one-time initialization token for nowPlaying != -1) {
      swift_once();
    }
    uint64_t v18 = type metadata accessor for Logger();
    __swift_project_value_buffer(v18, (uint64_t)static Logger.nowPlaying);
    os_log_type_t v38 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v38, v19))
    {
      unint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, v19, "Awaiting media and now playing", v20, 2u);
      swift_slowDealloc();
    }
    goto LABEL_36;
  }
  os_log_type_t v38 = v5;
  [v4 registerObserver:v1];
  [v38 registerObserver:v1];
  if ([v38 receivedAllValues])
  {
    id v6 = [v4 mediaSources];
    if (v6)
    {
      uint64_t v7 = v6;
      type metadata accessor for CAFMediaSource(0, &lazy cache variable for type metadata for CAFMediaSource);
      unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      if (v8 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v9)
      {
        id v10 = [v38 nowPlaying];
        [v10 registerObserver:v1];

        id v11 = [v4 mediaSources];
        if (!v11)
        {
LABEL_35:
          uint64_t v28 = *(void **)(v1 + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_media);
          *(void *)(v1 + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_media) = v4;
          os_log_type_t v29 = v4;

          id v30 = [v38 nowPlaying];
          uint64_t v31 = *(void **)(v1 + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_nowPlaying);
          *(void *)(v1 + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_nowPlaying) = v30;

          id v32 = [v38 nowPlaying];
          id v33 = [v32 currentMediaSourceIdentifier];

          uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v36 = v35;

          id v37 = (uint64_t *)(v1 + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier);
          *id v37 = v34;
          v37[1] = v36;
          swift_bridgeObjectRelease();
          CAFDNowPlayingAgent.lastMediaSourceIdentifier.didset();

LABEL_36:
          id v27 = v38;
          goto LABEL_37;
        }
        uint64_t v12 = v11;
        unint64_t v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

        if (v13 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
          if (v14) {
            goto LABEL_11;
          }
        }
        else
        {
          uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v14)
          {
LABEL_11:
            if (v14 < 1)
            {
              __break(1u);
              return;
            }
            uint64_t v15 = 0;
            do
            {
              if ((v13 & 0xC000000000000001) != 0) {
                id v16 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
              }
              else {
                id v16 = *(id *)(v13 + 8 * v15 + 32);
              }
              id v17 = v16;
              ++v15;
              uint64_t v39 = v16;
              closure #1 in CAFDNowPlayingAgent.carDidUpdateAccessories(_:)(&v39, v1);
            }
            while (v14 != v15);
          }
        }
        swift_bridgeObjectRelease_n();
        goto LABEL_35;
      }
    }
    if (one-time initialization token for nowPlaying != -1) {
      swift_once();
    }
    uint64_t v26 = type metadata accessor for Logger();
    __swift_project_value_buffer(v26, (uint64_t)static Logger.nowPlaying);
    id v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      id v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v24 = 0;
      unint64_t v25 = "Awaiting media to receive some sources";
      goto LABEL_30;
    }
LABEL_31:

    id v27 = v4;
    goto LABEL_37;
  }
  if (one-time initialization token for nowPlaying != -1) {
    swift_once();
  }
  uint64_t v21 = type metadata accessor for Logger();
  __swift_project_value_buffer(v21, (uint64_t)static Logger.nowPlaying);
  id v22 = Logger.logObject.getter();
  os_log_type_t v23 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v22, v23)) {
    goto LABEL_31;
  }
  id v24 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)id v24 = 0;
  unint64_t v25 = "Awaiting now playing to receive all values";
LABEL_30:
  _os_log_impl((void *)&_mh_execute_header, v22, v23, v25, v24, 2u);
  swift_slowDealloc();

  id v27 = v22;
LABEL_37:
}

void closure #1 in CAFDNowPlayingAgent.carDidUpdateAccessories(_:)(void **a1, uint64_t a2)
{
  int v3 = *a1;
  if (one-time initialization token for nowPlaying != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)static Logger.nowPlaying);
  id v5 = v3;
  id v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    unint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)unint64_t v8 = 136315138;
    buf = v8;
    id v9 = [v5 identifier];
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v12 = v11;

    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v12, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Observing source: %s", buf, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  [v5 registerObserver:a2];
  if (([v5 receivedAllValues] & 1) == 0)
  {
    id v13 = v5;
    uint64_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      *(_DWORD *)id v16 = 136315138;
      id v17 = [v13 identifier];
      uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v20 = v19;

      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v18, v20, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Waiting for source to receive all values: %s", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
  }
}

void CAFDNowPlayingAgent.accessoryDidUpdate(_:receivedAllValues:)(void *a1, char a2)
{
  if (a2)
  {
    int v3 = v2;
    if (one-time initialization token for nowPlaying != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)static Logger.nowPlaying);
    id v6 = a1;
    os_log_type_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      id v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = (void *)swift_slowAlloc();
      *(_DWORD *)id v9 = 138412290;
      id v11 = v6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v10 = v6;

      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Received all values for accessory %@!", v9, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v12 = [v6 car];
    if (v12)
    {
      id v13 = v12;
      [v3 carDidUpdateAccessories:v12];
    }
    else
    {
      __break(1u);
    }
  }
}

void CAFDNowPlayingAgent.carManager(_:didUpdateCurrentCar:)(uint64_t a1, void *a2)
{
}

Swift::Void __swiftcall CAFDAgent._CAFDConnectionProxy.refreshNowPlayingSnapshot()()
{
  if (one-time initialization token for nowPlaying != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Logger.nowPlaying);
  id v2 = v0;
  int v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    id v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    id v7 = v2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v6 = v2;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "telling %@ to refresh", v5, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  if (CAFDAgent._CAFDConnectionProxy.remote.getter())
  {
    os_log_type_t v8 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (v8) {
      [v8 refreshNowPlayingSnapshot];
    }
    swift_unknownObjectRelease();
  }
}

void CAFDNowPlayingAgent.nowPlayingService(_:didUpdateCurrentMediaSourceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)(v3 + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier);
  BOOL v6 = *(void *)(v3 + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier) == a2
    && *(void *)(v3 + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier + 8) == a3;
  if (!v6 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    void *v5 = a2;
    v5[1] = a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    CAFDNowPlayingAgent.lastMediaSourceIdentifier.didset();
  }
}

uint64_t @objc CAFDNowPlayingAgent.nowPlayingService(_:didUpdateJumpBackwardInterval:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitDuration>?);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    type metadata accessor for CAFMediaSource(0, &lazy cache variable for type metadata for NSUnitDuration);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitDuration>);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitDuration>);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  return outlined destroy of Measurement<NSUnitDuration>?((uint64_t)v7);
}

void CAFDNowPlayingAgent.serviceDidUpdate(_:receivedAllValues:)(void *a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = v2;
    if (one-time initialization token for nowPlaying != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)static Logger.nowPlaying);
    id v6 = a1;
    id v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      id v16 = v3;
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136446210;
      id v10 = [v6 name];
      uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v13 = v12;

      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v13, &v17);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      uint64_t v3 = v16;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Service %{public}s received all values", v9, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v14 = [v6 car];
    if (v14)
    {
      os_log_type_t v15 = v14;
      [v3 carDidUpdateAccessories:v14];
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t @objc CAFDNowPlayingAgent.nowPlayingService(_:didUpdateUserVisibleDescription:)(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  id v7 = a1;
  CAFDNowPlayingAgent.updateNowPlaying()();

  return swift_bridgeObjectRelease();
}

void @objc CAFDNowPlayingAgent.mediaSourceService(_:didUpdateMediaItems:)(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  CAFDNowPlayingAgent.updateNowPlaying()();
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
      id v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *specialized Sequence.first(where:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v6 = 4;
    while (1)
    {
      id v7 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(a1 + 8 * v6);
      uint64_t v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      id v10 = [v7 identifier];
      if (v10)
      {
        int64_t v11 = v10;
        uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v14 = v13;

        if (v12 == a2 && v14 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v8;
        }
        char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v16) {
          goto LABEL_18;
        }
      }

      ++v6;
      if (v9 == v5) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
  return 0;
}

{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  BOOL v19;
  unint64_t v21;
  unint64_t v22;

  uint64_t v5 = a1;
  if (a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v21 = v5;
    uint64_t v22 = v5 & 0xC000000000000001;
    id v7 = 4;
    while (1)
    {
      uint64_t v8 = v22 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)() : *(id *)(v5 + 8 * v7);
      uint64_t v9 = v8;
      id v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      int64_t v11 = a3;
      uint64_t v12 = v6;
      uint64_t v13 = [v8 identifier];
      if (v13)
      {
        uint64_t v14 = v13;
        os_log_type_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v17 = v16;
      }
      else
      {
        os_log_type_t v15 = 0;
        uint64_t v17 = 0xE000000000000000;
      }
      a3 = v11;
      if (v15 == a2 && v17 == v11)
      {
        swift_bridgeObjectRelease();
LABEL_18:
        swift_bridgeObjectRelease();
        return v9;
      }
      uint64_t v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v18) {
        goto LABEL_18;
      }

      ++v7;
      uint64_t v6 = v12;
      unint64_t v19 = v10 == v12;
      uint64_t v5 = v21;
      if (v19) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id specialized CAFDNowPlayingAgent.init(carManager:)(void *a1)
{
  id v46 = a1;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v47 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v5 = (int *)type metadata accessor for CAFDAgent.Configuration(0);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v45 = (uint64_t)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v40 - v8;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_currentCar] = 0;
  *(void *)&v1[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastSnapshot] = 0;
  *(void *)&v1[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_media] = 0;
  *(void *)&v1[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_nowPlaying] = 0;
  id v10 = &v1[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier];
  *(void *)id v10 = 0;
  *((void *)v10 + 1) = 0xE000000000000000;
  uint64_t v11 = one-time initialization token for nowPlaying;
  uint64_t v12 = v1;
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v2, (uint64_t)static Logger.nowPlaying);
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    char v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "initializing now playing server", v16, 2u);
    swift_slowDealloc();
  }

  swift_unknownObjectWeakAssign();
  uint64_t v44 = v12;

  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v47, v13, v2);
  uint64_t v17 = self;
  uint64_t v43 = v2;
  NSString v18 = [v17 identifier];
  if (!v18)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v18 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  id v19 = [self serial];
  uint64_t v42 = BSDispatchQueueCreate();

  id v41 = [v17 interface];
  id v20 = [v17 entitlement];
  uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v22 = v21;

  id v23 = [self userInitiated];
  id v24 = [v17 identifier];
  uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v27 = v26;

  id v28 = [v17 identifier];
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v31 = v30;

  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v9, v47, v43);
  *(void *)&v9[v5[5]] = v42;
  *(void *)&v9[v5[6]] = v41;
  id v32 = (uint64_t *)&v9[v5[7]];
  *id v32 = v40;
  v32[1] = v22;
  *(void *)&v9[v5[8]] = v23;
  id v33 = (uint64_t *)&v9[v5[9]];
  uint64_t *v33 = v25;
  v33[1] = v27;
  uint64_t v34 = (uint64_t *)&v9[v5[10]];
  uint64_t *v34 = v29;
  v34[1] = v31;
  uint64_t v35 = v45;
  outlined init with copy of CAFDAgent.Configuration((uint64_t)v9, v45);
  id v36 = (id)CAFDAgent.init(configuration:)(v35);
  id v37 = v46;
  [v46 registerObserver:v36];
  id v38 = [v37 currentCar];
  [v36 carManager:v37 didUpdateCurrentCar:v38];

  outlined destroy of CAFDAgent.Configuration((uint64_t)v9);
  return v36;
}

uint64_t type metadata accessor for CAFDNowPlayingAgent()
{
  uint64_t result = type metadata singleton initialization cache for CAFDNowPlayingAgent;
  if (!type metadata singleton initialization cache for CAFDNowPlayingAgent) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void specialized CAFDNowPlayingAgent.carManager(_:didUpdateCurrentCar:)(void *a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for nowPlaying != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v3, (uint64_t)static Logger.nowPlaying);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  id v8 = a1;
  id v9 = v1;
  id v10 = v8;
  uint64_t v11 = (char *)v9;
  uint64_t v12 = Logger.logObject.getter();
  int v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, (os_log_type_t)v13))
  {
    int v32 = v13;
    id v33 = a1;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v35 = v31;
    *(_DWORD *)uint64_t v14 = 136315394;
    os_log_type_t v15 = *(void **)&v11[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_currentCar];
    if (v15)
    {
      id v16 = [v15 description];
      uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v19 = v18;
    }
    else
    {
      unint64_t v19 = 0xE300000000000000;
      uint64_t v17 = 7104878;
    }
    os_log_t v30 = v12;
    uint64_t v34 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v19, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    if (v33)
    {
      id v20 = [v10 description];
      uint64_t v21 = v10;
      uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v24 = v23;
    }
    else
    {
      unint64_t v24 = 0xE300000000000000;
      uint64_t v21 = v10;
      uint64_t v22 = 7104878;
    }
    uint64_t v34 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v24, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    os_log_t v25 = v30;
    _os_log_impl((void *)&_mh_execute_header, v30, (os_log_type_t)v32, "update current car from %s to %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    a1 = v33;
    id v10 = v21;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  uint64_t v26 = OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_currentCar;
  uint64_t v27 = *(void **)&v11[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_currentCar];
  if (v27)
  {
    [v27 unregisterObserver:v11];
    id v28 = *(void **)&v11[v26];
  }
  else
  {
    id v28 = 0;
  }
  *(void *)&v11[v26] = a1;
  id v29 = v10;

  if (a1)
  {
    [v29 registerObserver:v11];
    [v11 carDidUpdateAccessories:v29];
  }
}

uint64_t ObjC metadata update function for CAFDNowPlayingAgent()
{
  return type metadata accessor for CAFDNowPlayingAgent();
}

uint64_t type metadata completion function for CAFDNowPlayingAgent()
{
  return swift_updateClassMetadata2();
}

uint64_t outlined destroy of Measurement<NSUnitDuration>?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitDuration>?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

void specialized CAFDAgent._CAFDConnectionProxy.fetchNowPlayingSnapshot(reply:)(uint64_t a1, void *a2)
{
  id Strong = (id)swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    goto LABEL_11;
  }
  type metadata accessor for CAFDNowPlayingAgent();
  uint64_t v3 = swift_dynamicCastClass();
  if (!v3)
  {

LABEL_11:
    _Block_release(a2);
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return;
  }
  uint64_t v4 = v3;
  uint64_t v5 = OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastSnapshot;
  uint64_t v6 = *(void **)(v3 + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastSnapshot);
  if (v6 || (CAFDNowPlayingAgent.updateNowPlaying()(), (uint64_t v6 = *(void **)(v4 + v5)) != 0))
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [objc_allocWithZone((Class)CAFNowPlayingSnapshot) init];
    uint64_t v6 = 0;
  }
  id v8 = (void (*)(void *, id, void))a2[2];
  id v9 = v6;
  v8(a2, v7, 0);
}

unint64_t lazy protocol witness table accessor for type CAFDAgent._CAFDConnectionProxy and conformance NSObject()
{
  unint64_t result = lazy protocol witness table cache variable for type CAFDAgent._CAFDConnectionProxy and conformance NSObject;
  if (!lazy protocol witness table cache variable for type CAFDAgent._CAFDConnectionProxy and conformance NSObject)
  {
    type metadata accessor for CAFDAgent._CAFDConnectionProxy();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CAFDAgent._CAFDConnectionProxy and conformance NSObject);
  }
  return result;
}

uint64_t sub_10001FCDC()
{
  unint64_t v1 = *(void *)(v0 + 24);
  if (v1 >> 60 != 15) {
    outlined consume of Data._Representation(*(void *)(v0 + 16), v1);
  }

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t outlined copy of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined copy of Data._Representation(a1, a2);
  }
  return a1;
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(a1, a2);
  }
  return a1;
}

uint64_t sub_10001FDA4()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t type metadata accessor for CAFMediaSource(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
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

uint64_t outlined init with copy of CAFDAgent.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CAFDAgent.Configuration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of CAFDAgent.Configuration(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CAFDAgent.Configuration(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable () -> ()(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void thunk for @escaping @callee_guaranteed (@guaranteed BSServiceConnection & BSServiceConnectionContext) -> ()(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t CAFDAgent.init(configuration:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for CAFDAgent.Configuration(0);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_listener] = 0;
  id v10 = v1;
  uint64_t v42 = v3;
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    specialized Set.init(_nonEmptyArrayLiteral:)((unint64_t)&_swiftEmptyArrayStorage);
  }
  else {
    uint64_t v11 = &_swiftEmptySetSingleton;
  }
  *(void *)&v10[OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_connections] = v11;
  outlined init with copy of CAFDAgent.Configuration(a1, (uint64_t)&v10[OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_configuration]);

  uint64_t v12 = (objc_class *)type metadata accessor for CAFDAgent(0);
  v45.receiver = v10;
  v45.super_class = v12;
  id v13 = [super init];
  uint64_t v14 = __chkstk_darwin(v13);
  *(&v38 - 2) = (uint8_t *)a1;
  *(&v38 - 1) = (uint8_t *)v14;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = partial apply for closure #1 in CAFDAgent.init(configuration:);
  *(void *)(v15 + 24) = &v38 - 4;
  aBlock[4] = (uint64_t)partial apply for thunk for @callee_guaranteed (@guaranteed BSServiceConnectionConfiguring) -> ();
  aBlock[5] = v15;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)thunk for @escaping @callee_guaranteed (@guaranteed BSServiceConnectionListenerConfiguring) -> ();
  aBlock[3] = (uint64_t)&block_descriptor_48;
  id v16 = _Block_copy(aBlock);
  uint64_t v17 = self;
  unint64_t v18 = (char *)v13;
  swift_retain();
  id v19 = [v17 listenerWithConfigurator:v16];
  _Block_release(v16);
  swift_release();
  LOBYTE(v16) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v16)
  {
    __break(1u);
  }
  else
  {
    uint64_t v21 = OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_listener;
    uint64_t v22 = *(void **)&v18[OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_listener];
    *(void *)&v18[OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_listener] = v19;
    uint64_t v23 = v21;

    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
    uint64_t v24 = (uint64_t)v5;
    outlined init with copy of CAFDAgent.Configuration(a1, (uint64_t)v5);
    os_log_t v25 = Logger.logObject.getter();
    uint64_t v26 = v9;
    os_log_type_t v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v27))
    {
      uint64_t v40 = v26;
      uint64_t v28 = swift_slowAlloc();
      uint64_t v41 = v23;
      id v29 = (uint8_t *)v28;
      uint64_t v30 = swift_slowAlloc();
      uint64_t v39 = v6;
      *(_DWORD *)id v29 = 136315138;
      aBlock[0] = v30;
      id v38 = v29 + 4;
      uint64_t v31 = (uint64_t *)(v24 + *(int *)(v42 + 36));
      uint64_t v42 = v24;
      uint64_t v32 = a1;
      uint64_t v34 = *v31;
      unint64_t v33 = v31[1];
      swift_bridgeObjectRetain();
      uint64_t v35 = v34;
      a1 = v32;
      uint64_t v43 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v35, v33, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      outlined destroy of CAFDAgent.Configuration(v42);
      _os_log_impl((void *)&_mh_execute_header, v25, v27, "activating listener for %s", v29, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v23 = v41;
      swift_slowDealloc();

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v40, v39);
    }
    else
    {
      outlined destroy of CAFDAgent.Configuration(v24);

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v26, v6);
    }
    id v36 = *(void **)&v18[v23];
    if (v36)
    {
      id v37 = v36;
      [v37 activate];

      outlined destroy of CAFDAgent.Configuration(a1);
      return (uint64_t)v18;
    }
  }
  __break(1u);
  return result;
}

id closure #1 in CAFDAgent.init(configuration:)(void *a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for CAFDAgent.Configuration(0);
  NSString v5 = String._bridgeToObjectiveC()();
  [a1 setDomain:v5];

  NSString v6 = String._bridgeToObjectiveC()();
  [a1 setService:v6];

  return [a1 setDelegate:a3];
}

void CAFDAgent.init()()
{
}

id CAFDAgent.__deallocating_deinit()
{
  return CAFDAgent.__deallocating_deinit(0, (uint64_t (*)(void))type metadata accessor for CAFDAgent);
}

uint64_t type metadata accessor for CAFDAgent(uint64_t a1)
{
  return type metadata accessor for CAFDAgent(a1, (uint64_t *)&type metadata singleton initialization cache for CAFDAgent);
}

uint64_t CAFDAgent._CAFDConnectionProxy.init(agent:connection:)(void *a1, void *a2)
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(void *)&v2[OBJC_IVAR____TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy_connection] = a2;
  v16.receiver = v2;
  v16.super_class = (Class)type metadata accessor for CAFDAgent._CAFDConnectionProxy();
  id v5 = a2;
  id v6 = [super init];
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = partial apply for closure #1 in CAFDAgent._CAFDConnectionProxy.init(agent:connection:);
  *(void *)(v8 + 24) = v7;
  v15[4] = partial apply for thunk for @callee_guaranteed (@guaranteed BSServiceConnectionListenerConfiguring) -> ();
  v15[5] = v8;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = thunk for @escaping @callee_guaranteed (@guaranteed BSServiceConnectionListenerConfiguring) -> ();
  v15[3] = &block_descriptor_29;
  id v9 = _Block_copy(v15);
  id v10 = v6;
  id v11 = v5;
  id v12 = v10;
  id v13 = a1;
  swift_retain();
  swift_release();
  [v11 configureConnection:v9];

  _Block_release(v9);
  LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v13 & 1) == 0) {
    return (uint64_t)v12;
  }
  __break(1u);
  return result;
}

void closure #1 in CAFDAgent._CAFDConnectionProxy.init(agent:connection:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a2 + OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_configuration;
  id v6 = (int *)type metadata accessor for CAFDAgent.Configuration(0);
  [a1 setTargetQueue:*(void *)(v5 + v6[5])];
  [a1 setServiceQuality:*(void *)(v5 + v6[8])];
  [a1 setInterface:*(void *)(v5 + v6[6])];
  [a1 setInterfaceTarget:a3];
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v9[4] = partial apply for closure #1 in closure #1 in CAFDAgent._CAFDConnectionProxy.init(agent:connection:);
  v9[5] = v7;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed BSServiceConnection & BSServiceConnectionContext) -> ();
  v9[3] = &block_descriptor_35;
  uint64_t v8 = _Block_copy(v9);
  swift_release();
  [a1 setInvalidationHandler:v8];
  _Block_release(v8);
}

void closure #1 in closure #1 in CAFDAgent._CAFDConnectionProxy.init(agent:connection:)()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for CAFDAgent.Configuration(0);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = (void *)Strong;
    uint64_t v9 = swift_unknownObjectWeakLoadStrong();
    if (v9)
    {
      id v10 = (void *)v9;
      outlined init with copy of CAFDAgent.Configuration(v9 + OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_configuration, (uint64_t)v6);

      (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v3, v6, v0);
      outlined destroy of CAFDAgent.Configuration((uint64_t)v6);
      id v11 = v8;
      id v12 = Logger.logObject.getter();
      os_log_type_t v13 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v21 = v1;
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        id v19 = (void *)swift_slowAlloc();
        id v20 = v14;
        *(_DWORD *)uint64_t v14 = 138412290;
        uint64_t v22 = v11;
        uint64_t v15 = v11;
        uint64_t v1 = v21;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *id v19 = v8;

        _os_log_impl((void *)&_mh_execute_header, v12, v13, "Connection invalidated %@", v20, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        id v12 = v11;
      }

      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    }
    uint64_t v16 = swift_unknownObjectWeakLoadStrong();
    if (v16)
    {
      uint64_t v17 = (void *)v16;
      CAFDAgent.remove(proxy:)(v8);
    }
  }
}

uint64_t CAFDAgent.remove(proxy:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchQoS();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  [a1 invalidate];
  uint64_t v12 = v2 + OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_configuration;
  v18[0] = *(void *)(v12 + *(int *)(type metadata accessor for CAFDAgent.Configuration(0) + 20));
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  *(void *)(v14 + 24) = a1;
  aBlock[4] = partial apply for closure #1 in CAFDAgent.remove(proxy:);
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_42_0;
  uint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  id v16 = a1;
  static DispatchQoS.unspecified.getter();
  v18[1] = &_swiftEmptyArrayStorage;
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_release();
  return swift_release();
}

Swift::Void __swiftcall CAFDAgent._CAFDConnectionProxy.activate()()
{
}

uint64_t CAFDAgent._CAFDConnectionProxy.remote.getter()
{
  NSString v1 = String._bridgeToObjectiveC()();
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [self attributeWithDomain:v1 name:v2];

  uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy_connection);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100029D10;
  *(void *)(v5 + 32) = v3;
  *(void *)&v11[0] = v5;
  specialized Array._endMutation()();
  type metadata accessor for RBSAttribute();
  id v6 = v3;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v8 = [v4 remoteTargetWithAssertionAttributes:isa];

  if (v8)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();

    outlined init with take of Any(&v10, v11);
  }
  else
  {

    memset(v11, 0, sizeof(v11));
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Any?);
  if (swift_dynamicCast()) {
    return v10;
  }
  else {
    return 0;
  }
}

id CAFDAgent._CAFDConnectionProxy.__deallocating_deinit(uint64_t a1)
{
  return CAFDAgent.__deallocating_deinit(a1, type metadata accessor for CAFDAgent._CAFDConnectionProxy);
}

id CAFDAgent.__deallocating_deinit(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return [super dealloc];
}

Swift::Void __swiftcall CAFDAgent._CAFDConnectionProxy.invalidate()()
{
}

id CAFDAgent._CAFDConnectionProxy.activate()(const char *a1, SEL *a2)
{
  uint64_t v5 = v2;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for CAFDAgent.Configuration(0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v14 = (void *)Strong;
    outlined init with copy of CAFDAgent.Configuration(Strong + OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_configuration, (uint64_t)v12);

    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
    outlined destroy of CAFDAgent.Configuration((uint64_t)v12);
    uint64_t v15 = v5;
    id v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      os_log_type_t v27 = a2;
      uint64_t v18 = swift_slowAlloc();
      uint64_t v25 = v7;
      id v19 = (uint8_t *)v18;
      uint64_t v23 = (void *)swift_slowAlloc();
      uint64_t v24 = a1;
      *(_DWORD *)id v19 = 138412290;
      uint64_t v28 = v15;
      id v20 = v15;
      uint64_t v26 = v5;
      uint64_t v21 = v20;
      a2 = v27;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v23 = v15;

      uint64_t v5 = v26;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, v24, v19, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v7 = v25;
      swift_slowDealloc();
    }
    else
    {

      id v16 = v15;
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return [*(id *)&v5[OBJC_IVAR____TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy_connection] *a2];
}

void CAFDAgent.listener(_:didReceive:withContext:)(uint64_t a1, void *a2)
{
}

uint64_t CAFDAgent.add(proxy:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchQoS();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  CAFDAgent._CAFDConnectionProxy.activate()();
  uint64_t v12 = v2 + OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_configuration;
  v18[0] = *(void *)(v12 + *(int *)(type metadata accessor for CAFDAgent.Configuration(0) + 20));
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  *(void *)(v14 + 24) = a1;
  aBlock[4] = partial apply for closure #1 in CAFDAgent.add(proxy:);
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_0;
  uint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  id v16 = a1;
  static DispatchQoS.unspecified.getter();
  v18[1] = &_swiftEmptyArrayStorage;
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_release();
  return swift_release();
}

void closure #1 in CAFDAgent.remove(proxy:)(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    swift_beginAccess();
    uint64_t v6 = (void *)specialized Set._Variant.remove(_:)(a2, v5, (void (*)(uint64_t))type metadata accessor for CAFDAgent._CAFDConnectionProxy, (uint64_t *)&demangling cache variable for type metadata for _SetStorage<CAFDAgent._CAFDConnectionProxy>, (void (*)(uint64_t))type metadata accessor for CAFDAgent._CAFDConnectionProxy);
    swift_endAccess();
  }
}

void closure #1 in CAFDAgent.add(proxy:)(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    swift_beginAccess();
    id v5 = a2;
    specialized Set._Variant.insert(_:)(&v8, v5, v6, (void (*)(uint64_t))type metadata accessor for CAFDAgent._CAFDConnectionProxy, (uint64_t *)&demangling cache variable for type metadata for _SetStorage<CAFDAgent._CAFDConnectionProxy>, (void (*)(uint64_t))type metadata accessor for CAFDAgent._CAFDConnectionProxy);
    uint64_t v7 = v8;
    swift_endAccess();
  }
}

uint64_t specialized Set._Variant.remove(_:)(void *a1)
{
  return specialized Set._Variant.remove(_:)(a1, 0, (void (*)(uint64_t))type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy, (uint64_t *)&demangling cache variable for type metadata for _SetStorage<CAFDAssetVariantsAgent._ConnectionProxy>, (void (*)(uint64_t))type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy);
}

uint64_t specialized Set._Variant.remove(_:)(void *a1, uint64_t a2, void (*a3)(uint64_t), uint64_t *a4, void (*a5)(uint64_t))
{
  uint64_t v8 = v5;
  uint64_t v10 = *v5;
  if ((*v5 & 0xC000000000000001) != 0)
  {
    if (v10 < 0) {
      uint64_t v12 = *v5;
    }
    else {
      uint64_t v12 = v10 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v13 = a1;
    char v14 = __CocoaSet.contains(_:)();

    if (v14)
    {
      uint64_t v15 = specialized Set._Variant._migrateToNative(_:removing:)(v12, (uint64_t)v13, a4, a2, a5, a5);
      swift_bridgeObjectRelease();
      return v15;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    return 0;
  }
  Swift::Int v17 = *(void *)(v10 + 40);
  swift_bridgeObjectRetain();
  Swift::Int v18 = NSObject._rawHashValue(seed:)(v17);
  uint64_t v19 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v20 = v18 & ~v19;
  if (((*(void *)(v10 + 56 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
    goto LABEL_15;
  }
  a3(a2);
  id v21 = *(id *)(*(void *)(v10 + 48) + 8 * v20);
  char v22 = static NSObject.== infix(_:_:)();

  if ((v22 & 1) == 0)
  {
    uint64_t v23 = ~v19;
    do
    {
      unint64_t v20 = (v20 + 1) & v23;
      if (((*(void *)(v10 + 56 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
        goto LABEL_15;
      }
      id v24 = *(id *)(*(void *)(v10 + 48) + 8 * v20);
      char v25 = static NSObject.== infix(_:_:)();
    }
    while ((v25 & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v27 = *v8;
  uint64_t v29 = *v8;
  *uint64_t v8 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    specialized _NativeSet.copy()(a4);
    uint64_t v27 = v29;
  }
  uint64_t v15 = *(void *)(*(void *)(v27 + 48) + 8 * v20);
  specialized _NativeSet._delete(at:)(v20);
  *uint64_t v8 = v29;
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t specialized Set._Variant._migrateToNative(_:removing:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, void (*a5)(uint64_t), void (*a6)(uint64_t))
{
  uint64_t v11 = v6;
  swift_bridgeObjectRelease();
  uint64_t v12 = __CocoaSet.count.getter();
  uint64_t v13 = swift_unknownObjectRetain();
  Swift::Int v14 = specialized _NativeSet.init(_:capacity:)(v13, v12, a3, a4, a5);
  Swift::Int v26 = v14;
  Swift::Int v15 = *(void *)(v14 + 40);
  swift_retain();
  Swift::Int v16 = NSObject._rawHashValue(seed:)(v15);
  uint64_t v17 = -1 << *(unsigned char *)(v14 + 32);
  unint64_t v18 = v16 & ~v17;
  if ((*(void *)(v14 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18))
  {
    a6(a4);
    id v19 = *(id *)(*(void *)(v14 + 48) + 8 * v18);
    char v20 = static NSObject.== infix(_:_:)();

    if (v20)
    {
LABEL_6:
      swift_release();
      uint64_t v24 = *(void *)(*(void *)(v14 + 48) + 8 * v18);
      specialized _NativeSet._delete(at:)(v18);
      if (static NSObject.== infix(_:_:)())
      {
        Swift::Int *v11 = v26;
        return v24;
      }
      __break(1u);
    }
    else
    {
      uint64_t v21 = ~v17;
      while (1)
      {
        unint64_t v18 = (v18 + 1) & v21;
        if (((*(void *)(v14 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
          break;
        }
        id v22 = *(id *)(*(void *)(v14 + 48) + 8 * v18);
        char v23 = static NSObject.== infix(_:_:)();

        if (v23) {
          goto LABEL_6;
        }
      }
    }
    swift_release();
    __break(1u);
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

id specialized _NativeSet.copy()(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = static _SetStorage.copy(original:)();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  id result = (id)(v4 + 56);
  uint64_t v7 = v3 + 56;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 56);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v10);
      if (!v20)
      {
        int64_t v10 = v19 + 2;
        if (v19 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v20 = *(void *)(v7 + 8 * v10);
        if (!v20) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    unint64_t v18 = *(void **)(*(void *)(v3 + 48) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v14) {
    goto LABEL_28;
  }
  unint64_t v20 = *(void *)(v7 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.copyAndResize(capacity:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v6 = v5;
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v3 = v6;
    return result;
  }
  uint64_t v30 = v2;
  uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v8 = v4 + 56;
  if (v7 < 64) {
    uint64_t v9 = ~(-1 << v7);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v4 + 56);
  int64_t v11 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v12 = v5 + 56;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    Swift::Int v21 = *(void *)(v6 + 40);
    id v22 = *(id *)(*(void *)(v4 + 48) + 8 * v17);
    uint64_t result = NSObject._rawHashValue(seed:)(v21);
    uint64_t v23 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v25);
      }
      while (v29 == -1);
      unint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(void *)(*(void *)(v6 + 48) + 8 * v15) = v22;
    ++*(void *)(v6 + 16);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v3 = v30;
    goto LABEL_35;
  }
  unint64_t v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v14 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.resize(capacity:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v30 = v2;
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v4 + 56);
    int64_t v11 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v12 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }
      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v11) {
            goto LABEL_33;
          }
          unint64_t v19 = v8[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v11) {
              goto LABEL_33;
            }
            unint64_t v19 = v8[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                uint64_t v3 = v30;
                uint64_t v29 = 1 << *(unsigned char *)(v4 + 32);
                if (v29 > 63) {
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v8 = -1 << v29;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v11) {
                    goto LABEL_33;
                  }
                  unint64_t v19 = v8[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = v20;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      uint64_t v21 = *(void *)(*(void *)(v4 + 48) + 8 * v17);
      uint64_t result = NSObject._rawHashValue(seed:)(*(void *)(v6 + 40));
      uint64_t v22 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
      ++*(void *)(v6 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v6;
  return result;
}

unint64_t specialized _NativeSet._delete(at:)(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v10 = *(void *)(v3 + 40);
        id v11 = *(id *)(*(void *)(v3 + 48) + 8 * v6);
        Swift::Int v12 = NSObject._rawHashValue(seed:)(v10);

        Swift::Int v13 = v12 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v2 >= v13)
          {
LABEL_16:
            uint64_t v16 = *(void *)(v3 + 48);
            unint64_t v17 = (void *)(v16 + 8 * v2);
            int64_t v18 = (void *)(v16 + 8 * v6);
            if (v2 != v6 || (int64_t v2 = v6, v17 >= v18 + 1))
            {
              *unint64_t v17 = *v18;
              int64_t v2 = v6;
            }
          }
        }
        else if (v13 >= v9 || v2 >= v13)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v21;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

Swift::Int specialized _NativeSet.init(_:capacity:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, void (*a5)(uint64_t))
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    uint64_t v8 = static _SetStorage.convert(_:capacity:)();
    uint64_t v21 = v8;
    __CocoaSet.makeIterator()();
    if (__CocoaSet.Iterator.next()())
    {
      a5(a4);
      do
      {
        swift_dynamicCast();
        uint64_t v8 = v21;
        unint64_t v15 = *(void *)(v21 + 16);
        if (*(void *)(v21 + 24) <= v15)
        {
          specialized _NativeSet.resize(capacity:)(v15 + 1, a3);
          uint64_t v8 = v21;
        }
        Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v8 + 40));
        uint64_t v10 = v8 + 56;
        uint64_t v11 = -1 << *(unsigned char *)(v8 + 32);
        unint64_t v12 = result & ~v11;
        unint64_t v13 = v12 >> 6;
        if (((-1 << v12) & ~*(void *)(v8 + 56 + 8 * (v12 >> 6))) != 0)
        {
          unint64_t v14 = __clz(__rbit64((-1 << v12) & ~*(void *)(v8 + 56 + 8 * (v12 >> 6)))) | v12 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v16 = 0;
          unint64_t v17 = (unint64_t)(63 - v11) >> 6;
          do
          {
            if (++v13 == v17 && (v16 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v18 = v13 == v17;
            if (v13 == v17) {
              unint64_t v13 = 0;
            }
            v16 |= v18;
            uint64_t v19 = *(void *)(v10 + 8 * v13);
          }
          while (v19 == -1);
          unint64_t v14 = __clz(__rbit64(~v19)) + (v13 << 6);
        }
        *(void *)(v10 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
        *(void *)(*(void *)(v8 + 48) + 8 * v14) = v20;
        ++*(void *)(v8 + 16);
      }
      while (__CocoaSet.Iterator.next()());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v8;
}

unint64_t specialized _NativeSet._unsafeInsertNew(_:)(uint64_t a1, void *a2)
{
  NSObject._rawHashValue(seed:)(a2[5]);
  unint64_t result = _HashTable.nextHole(atOrAfter:)();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

uint64_t specialized Set._Variant.insert(_:)(void *a1, void *a2)
{
  return specialized Set._Variant.insert(_:)(a1, a2, 0, (void (*)(uint64_t))type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy, (uint64_t *)&demangling cache variable for type metadata for _SetStorage<CAFDAssetVariantsAgent._ConnectionProxy>, (void (*)(uint64_t))type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy);
}

uint64_t specialized Set._Variant.insert(_:)(void *a1, void *a2, uint64_t a3, void (*a4)(uint64_t), uint64_t *a5, void (*a6)(uint64_t))
{
  uint64_t v11 = v6;
  uint64_t v14 = *v6;
  if ((*v6 & 0xC000000000000001) != 0)
  {
    if (v14 < 0) {
      uint64_t v15 = *v6;
    }
    else {
      uint64_t v15 = v14 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v16 = a2;
    uint64_t v17 = __CocoaSet.member(for:)();

    if (v17)
    {
      swift_bridgeObjectRelease();

      a4(a3);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v41;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = __CocoaSet.count.getter();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v30 = specialized _NativeSet.init(_:capacity:)(v15, result + 1, a5, a3, a6);
    uint64_t v42 = (void *)v30;
    unint64_t v31 = *(void *)(v30 + 16);
    if (*(void *)(v30 + 24) <= v31)
    {
      uint64_t v36 = v31 + 1;
      id v37 = v16;
      specialized _NativeSet.resize(capacity:)(v36, a5);
      uint64_t v32 = v42;
    }
    else
    {
      uint64_t v32 = (void *)v30;
      id v33 = v16;
    }
    specialized _NativeSet._unsafeInsertNew(_:)((uint64_t)v16, v32);
    uint64_t *v11 = (uint64_t)v32;
    swift_bridgeObjectRelease();
    *a1 = v16;
  }
  else
  {
    Swift::Int v19 = *(void *)(v14 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v20 = NSObject._rawHashValue(seed:)(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v14 + 32);
    unint64_t v22 = v20 & ~v21;
    if ((*(void *)(v14 + 56 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22))
    {
      a4(a3);
      id v23 = *(id *)(*(void *)(v14 + 48) + 8 * v22);
      char v24 = static NSObject.== infix(_:_:)();

      if (v24)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v28 = *(void **)(*(void *)(*v11 + 48) + 8 * v22);
        *a1 = v28;
        id v29 = v28;
        return 0;
      }
      uint64_t v25 = ~v21;
      while (1)
      {
        unint64_t v22 = (v22 + 1) & v25;
        if (((*(void *)(v14 + 56 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
          break;
        }
        id v26 = *(id *)(*(void *)(v14 + 48) + 8 * v22);
        char v27 = static NSObject.== infix(_:_:)();

        if (v27) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v43 = *v11;
    uint64_t *v11 = 0x8000000000000000;
    id v35 = a2;
    specialized _NativeSet.insertNew(_:at:isUnique:)((uint64_t)v35, v22, isUniquelyReferenced_nonNull_native, a5, a3, a6);
    uint64_t *v11 = v43;
    swift_bridgeObjectRelease();
    *a1 = v35;
  }
  return 1;
}

void specialized _NativeSet.insertNew(_:at:isUnique:)(uint64_t a1, unint64_t a2, char a3, uint64_t *a4, uint64_t a5, void (*a6)(uint64_t))
{
  unint64_t v11 = *(void *)(*v6 + 16);
  unint64_t v12 = *(void *)(*v6 + 24);
  if (v12 > v11 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v13 = v11 + 1;
  if (a3)
  {
    specialized _NativeSet.resize(capacity:)(v13, a4);
  }
  else
  {
    if (v12 > v11)
    {
      specialized _NativeSet.copy()(a4);
      goto LABEL_14;
    }
    specialized _NativeSet.copyAndResize(capacity:)(v13, a4);
  }
  uint64_t v14 = *v6;
  Swift::Int v15 = NSObject._rawHashValue(seed:)(*(void *)(*v6 + 40));
  uint64_t v16 = -1 << *(unsigned char *)(v14 + 32);
  a2 = v15 & ~v16;
  if ((*(void *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    a6(a5);
    id v17 = *(id *)(*(void *)(v14 + 48) + 8 * a2);
    char v18 = static NSObject.== infix(_:_:)();

    if (v18)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v19 = ~v16;
      while (1)
      {
        a2 = (a2 + 1) & v19;
        if (((*(void *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v20 = *(id *)(*(void *)(v14 + 48) + 8 * a2);
        char v21 = static NSObject.== infix(_:_:)();

        if (v21) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v22 = *v6;
  *(void *)(*v6 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v22 + 48) + 8 * a2) = a1;
  uint64_t v23 = *(void *)(v22 + 16);
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24) {
    __break(1u);
  }
  else {
    *(void *)(v22 + 16) = v25;
  }
}

void specialized CAFDAgent.listener(_:didReceive:withContext:)(void *a1)
{
  int64_t v2 = v1;
  id v3 = a1;
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    unint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)unint64_t v6 = 136315138;
    swift_getObjectType();
    uint64_t v7 = BSServiceConnectionHost.CAFDDescription.getter();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v7, v8, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Received connection %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  swift_getObjectType();
  id v9 = [v3 remoteToken];
  type metadata accessor for CAFDAgent.Configuration(0);
  NSString v10 = String._bridgeToObjectiveC()();
  unsigned int v11 = [v9 hasEntitlement:v10];

  if (v11)
  {
    id v12 = objc_allocWithZone((Class)type metadata accessor for CAFDAgent._CAFDConnectionProxy());
    uint64_t v13 = (void *)CAFDAgent._CAFDConnectionProxy.init(agent:connection:)(v2, v3);
    CAFDAgent.add(proxy:)(v13);
  }
  else
  {
    id v14 = v3;
    Swift::Int v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      id v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)id v17 = 136315138;
      uint64_t v18 = BSServiceConnectionHost.CAFDDescription.getter();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v18, v19, &v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "connection %s does not have required entitlement", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
  }
}

uint64_t ObjC metadata update function for CAFDAgent()
{
  return type metadata accessor for CAFDAgent(0);
}

uint64_t type metadata completion function for CAFDAgent()
{
  uint64_t result = type metadata accessor for CAFDAgent.Configuration(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for CAFDAgent.Configuration(uint64_t a1)
{
  return type metadata accessor for CAFDAgent(a1, (uint64_t *)&type metadata singleton initialization cache for CAFDAgent.Configuration);
}

uint64_t type metadata accessor for CAFDAgent(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata accessor for CAFDAgent._CAFDConnectionProxy()
{
  return self;
}

uint64_t *initializeBufferWithCopyOfBuffer for CAFDAgent.Configuration(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v29 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for Logger();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    NSString v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    unsigned int v11 = *(void **)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + v9) = (uint64_t)v11;
    uint64_t v12 = a3[7];
    uint64_t v13 = a3[8];
    id v14 = (uint64_t *)((char *)a1 + v12);
    Swift::Int v15 = (uint64_t *)((char *)a2 + v12);
    uint64_t v16 = v15[1];
    void *v14 = *v15;
    v14[1] = v16;
    id v17 = *(void **)((char *)a2 + v13);
    *(uint64_t *)((char *)a1 + v13) = (uint64_t)v17;
    uint64_t v18 = a3[9];
    uint64_t v19 = a3[10];
    uint64_t v20 = (uint64_t *)((char *)a1 + v18);
    char v21 = (uint64_t *)((char *)a2 + v18);
    uint64_t v22 = v21[1];
    void *v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = (uint64_t *)((char *)a1 + v19);
    BOOL v24 = (uint64_t *)((char *)a2 + v19);
    uint64_t v25 = v24[1];
    *uint64_t v23 = *v24;
    v23[1] = v25;
    id v26 = v10;
    id v27 = v11;
    swift_bridgeObjectRetain();
    id v28 = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for CAFDAgent.Configuration(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CAFDAgent.Configuration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  NSString v10 = *(void **)(a2 + v8);
  *(void *)(a1 + v8) = v10;
  uint64_t v11 = a3[7];
  uint64_t v12 = a3[8];
  uint64_t v13 = (void *)(a1 + v11);
  id v14 = (void *)(a2 + v11);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  uint64_t v16 = *(void **)(a2 + v12);
  *(void *)(a1 + v12) = v16;
  uint64_t v17 = a3[9];
  uint64_t v18 = a3[10];
  uint64_t v19 = (void *)(a1 + v17);
  uint64_t v20 = (void *)(a2 + v17);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = (void *)(a1 + v18);
  uint64_t v23 = (void *)(a2 + v18);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  id v25 = v9;
  id v26 = v10;
  swift_bridgeObjectRetain();
  id v27 = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CAFDAgent.Configuration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a2 + v7);
  uint64_t v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  uint64_t v11 = a3[6];
  uint64_t v12 = *(void **)(a2 + v11);
  uint64_t v13 = *(void **)(a1 + v11);
  *(void *)(a1 + v11) = v12;
  id v14 = v12;

  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[8];
  uint64_t v19 = *(void **)(a2 + v18);
  uint64_t v20 = *(void **)(a1 + v18);
  *(void *)(a1 + v18) = v19;
  id v21 = v19;

  uint64_t v22 = a3[9];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  *uint64_t v23 = *v24;
  v23[1] = v24[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[10];
  id v26 = (void *)(a1 + v25);
  id v27 = (void *)(a2 + v25);
  void *v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for CAFDAgent.Configuration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  return a1;
}

uint64_t assignWithTake for CAFDAgent.Configuration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  uint64_t v9 = a3[6];
  id v10 = *(void **)(a1 + v9);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);

  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  uint64_t v17 = *(void **)(a1 + v16);
  *(void *)(a1 + v16) = *(void *)(a2 + v16);

  uint64_t v18 = a3[9];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  *uint64_t v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[10];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (uint64_t *)(a2 + v23);
  uint64_t v27 = *v25;
  uint64_t v26 = v25[1];
  *uint64_t v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CAFDAgent.Configuration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002383C);
}

uint64_t sub_10002383C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for CAFDAgent.Configuration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100023910);
}

uint64_t sub_100023910(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata completion function for CAFDAgent.Configuration()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100023A88()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void partial apply for closure #1 in CAFDAgent.add(proxy:)()
{
  closure #1 in CAFDAgent.add(proxy:)(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags()
{
  unint64_t result = lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags;
  if (!lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags);
  }
  return result;
}

uint64_t sub_100023B3C()
{
  return _swift_deallocObject(v0, 32, 7);
}

void partial apply for closure #1 in CAFDAgent._CAFDConnectionProxy.init(agent:connection:)(void *a1)
{
  closure #1 in CAFDAgent._CAFDConnectionProxy.init(agent:connection:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100023B84()
{
  return _swift_deallocObject(v0, 32, 7);
}

void partial apply for closure #1 in closure #1 in CAFDAgent._CAFDConnectionProxy.init(agent:connection:)()
{
}

void partial apply for closure #1 in CAFDAgent.remove(proxy:)()
{
  closure #1 in CAFDAgent.remove(proxy:)(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

id partial apply for closure #1 in CAFDAgent.init(configuration:)(void *a1)
{
  return closure #1 in CAFDAgent.init(configuration:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100023BB0()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t static Measurement._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for CAUVehicleTrait()
{
  return type metadata accessor for CAUVehicleTrait();
}

uint64_t static CAUVariantsService.identifier.getter()
{
  return static CAUVariantsService.identifier.getter();
}

uint64_t static CAUVariantsService.entitlement.getter()
{
  return static CAUVariantsService.entitlement.getter();
}

uint64_t static CAUVariantsService.serviceQuality.getter()
{
  return static CAUVariantsService.serviceQuality.getter();
}

uint64_t static CAUVariantsService.domain.getter()
{
  return static CAUVariantsService.domain.getter();
}

uint64_t static CAUVariantsService.interface.getter()
{
  return static CAUVariantsService.interface.getter();
}

uint64_t type metadata accessor for CAUVariantsService()
{
  return type metadata accessor for CAUVariantsService();
}

uint64_t static Logger.assetVariants.getter()
{
  return static Logger.assetVariants.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t Dictionary<>.init(_:)()
{
  return Dictionary<>.init(_:)();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

Swift::Bool __swiftcall String.hasSuffix(_:)(Swift::String a1)
{
  return String.hasSuffix(_:)(a1._countAndFlagsBits, a1._object);
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t __CocoaSet.contains(_:)()
{
  return __CocoaSet.contains(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t BSDispatchQueueCreate()
{
  return _BSDispatchQueueCreate();
}

uint64_t CAFCarDataClientInterface()
{
  return _CAFCarDataClientInterface();
}

uint64_t CAFCarDataServiceInterface()
{
  return _CAFCarDataServiceInterface();
}

uint64_t CAFDAssertionLogging()
{
  return _CAFDAssertionLogging();
}

uint64_t CAFDChannelLogging()
{
  return _CAFDChannelLogging();
}

uint64_t CAFDClientLogging()
{
  return _CAFDClientLogging();
}

uint64_t CAFDDataLogging()
{
  return _CAFDDataLogging();
}

uint64_t CAFDLogging()
{
  return _CAFDLogging();
}

uint64_t CAFGeneralLogging()
{
  return _CAFGeneralLogging();
}

uint64_t CAFSignpostEmit_InstantOn()
{
  return _CAFSignpostEmit_InstantOn();
}

uint64_t CAFSignpostEmit_Launched()
{
  return _CAFSignpostEmit_Launched();
}

uint64_t CAFStateCaptureLogging()
{
  return _CAFStateCaptureLogging();
}

uint64_t CARSignpostLogForCategory()
{
  return _CARSignpostLogForCategory();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return _CGDataProviderCreateWithCFData(data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

uint64_t CGImageCreateByScaling()
{
  return _CGImageCreateByScaling();
}

CGImageRef CGImageCreateWithJPEGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return _CGImageCreateWithJPEGDataProvider(source, decode, shouldInterpolate, intent);
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return _CGImageCreateWithPNGDataProvider(source, decode, shouldInterpolate, intent);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithData(data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return _CGImageDestinationFinalize(idst);
}

void CGImageRelease(CGImageRef image)
{
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCopyPropertiesAtIndex(isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateImageAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithData(data, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return _CGImageSourceGetCount(isrc);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t OPACKDecodeData()
{
  return _OPACKDecodeData();
}

uint64_t OPACKEncoderCreateData()
{
  return _OPACKEncoderCreateData();
}

uint64_t RandomBytes()
{
  return _RandomBytes();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return _os_signpost_id_make_with_pointer(log, ptr);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return _swift_dynamicCastObjCProtocolUnconditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_CAF_decodeCarData_(void *a1, const char *a2, ...)
{
  return [a1 CAF_decodeCarData:];
}

id objc_msgSend_CAF_encodeCarDataFrom_error_(void *a1, const char *a2, ...)
{
  return [a1 CAF_encodeCarDataFrom:error:];
}

id objc_msgSend_MFiCertificateSerialNumber(void *a1, const char *a2, ...)
{
  return _[a1 MFiCertificateSerialNumber];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__addRegistration_instanceIDs_priority_withResponse_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_addRegistration:instanceIDs:priority:withResponse:");
}

id objc_msgSend__getChannel_(void *a1, const char *a2, ...)
{
  return [a1 _getChannel:];
}

id objc_msgSend__getClient_(void *a1, const char *a2, ...)
{
  return [a1 _getClient:];
}

id objc_msgSend__isRegisteredForPluginID_instanceID_(void *a1, const char *a2, ...)
{
  return [a1 _isRegisteredForPluginID:instanceID:];
}

id objc_msgSend__mainQueue_initVehicleDataSession_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_mainQueue_initVehicleDataSession:");
}

id objc_msgSend__observeAssertion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_observeAssertion:");
}

id objc_msgSend__removeConnection_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_removeConnection:");
}

id objc_msgSend__removeRegistration_instanceIDs_priority_withResponse_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_removeRegistration:instanceIDs:priority:withResponse:");
}

id objc_msgSend__setupCarDataChannel_channelType_qualityOfService_streamPriority_priority_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setupCarDataChannel:channelType:qualityOfService:streamPriority:priority:");
}

id objc_msgSend__startConnection(void *a1, const char *a2, ...)
{
  return _[a1 _startConnection];
}

id objc_msgSend__stopConnection(void *a1, const char *a2, ...)
{
  return _[a1 _stopConnection];
}

id objc_msgSend__workQueue_didReceiveConfigFromPluginID_config_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_workQueue_didReceiveConfigFromPluginID:config:")];
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return [a1 acquireWithError:];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateManualDomain_(void *a1, const char *a2, ...)
{
  return [a1 activateManualDomain:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:x0 selector:x1 name:x2 object:x3];
}

id objc_msgSend_addRegistrationFromCache_priority_withResponse_(void *a1, const char *a2, ...)
{
  return [a1 addRegistrationFromCache:priority:withResponse:];
}

id objc_msgSend_addSessionObserver_(void *a1, const char *a2, ...)
{
  return [a1 addSessionObserver:];
}

id objc_msgSend_agent(void *a1, const char *a2, ...)
{
  return _[a1 agent];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allowPartialConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 allowPartialConfiguration];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_ascTree(void *a1, const char *a2, ...)
{
  return _[a1 ascTree];
}

id objc_msgSend_assertionCount(void *a1, const char *a2, ...)
{
  return _[a1 assertionCount];
}

id objc_msgSend_assertions(void *a1, const char *a2, ...)
{
  return _[a1 assertions];
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return [a1 attributeWithDomain:name:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cacheValues_(void *a1, const char *a2, ...)
{
  return [a1 cacheValues:];
}

id objc_msgSend_cachedValueForInstanceID_(void *a1, const char *a2, ...)
{
  return [a1 cachedValueForInstanceID:];
}

id objc_msgSend_cachedValues(void *a1, const char *a2, ...)
{
  return _[a1 cachedValues];
}

id objc_msgSend_carConfigDidUpdate(void *a1, const char *a2, ...)
{
  return _[a1 carConfigDidUpdate];
}

id objc_msgSend_carConfigSummary(void *a1, const char *a2, ...)
{
  return _[a1 carConfigSummary];
}

id objc_msgSend_carDataAvailableToken(void *a1, const char *a2, ...)
{
  return _[a1 carDataAvailableToken];
}

id objc_msgSend_carDataChannelDidClose_(void *a1, const char *a2, ...)
{
  return [a1 carDataChannelDidClose:];
}

id objc_msgSend_carDataChannelDidOpen_(void *a1, const char *a2, ...)
{
  return [a1 carDataChannelDidOpen:];
}

id objc_msgSend_carDataChannelDidReceive_pluginID_payload_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "carDataChannelDidReceive:pluginID:payload:");
}

id objc_msgSend_carDataChannels(void *a1, const char *a2, ...)
{
  return _[a1 carDataChannels];
}

id objc_msgSend_carDataClients(void *a1, const char *a2, ...)
{
  return _[a1 carDataClients];
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return _[a1 channel];
}

id objc_msgSend_channelDelegate(void *a1, const char *a2, ...)
{
  return _[a1 channelDelegate];
}

id objc_msgSend_clientDelegate(void *a1, const char *a2, ...)
{
  return _[a1 clientDelegate];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_closeChannel(void *a1, const char *a2, ...)
{
  return _[a1 closeChannel];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return [a1 conformsToProtocol:];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_connections(void *a1, const char *a2, ...)
{
  return _[a1 connections];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyWithoutPlugins(void *a1, const char *a2, ...)
{
  return _[a1 copyWithoutPlugins];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:x0 objects:x1 count:x2];
}

id objc_msgSend_createAssertionWithAction_(void *a1, const char *a2, ...)
{
  return [a1 createAssertionWithAction:];
}

id objc_msgSend_currentCar(void *a1, const char *a2, ...)
{
  return _[a1 currentCar];
}

id objc_msgSend_currentCarConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 currentCarConfiguration];
}

id objc_msgSend_currentCarIdentifierIsEqual_(void *a1, const char *a2, ...)
{
  return [a1 currentCarIdentifierIsEqual:];
}

id objc_msgSend_currentCarPluginCount(void *a1, const char *a2, ...)
{
  return _[a1 currentCarPluginCount];
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return _[a1 currentSession];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithDictionary:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_didNotifyPluginID_instanceID_value_(void *a1, const char *a2, ...)
{
  return [a1 didNotifyPluginID:instanceID:value:];
}

id objc_msgSend_didReceiveConfigFromPluginID_config_(void *a1, const char *a2, ...)
{
  return [a1 didReceiveConfigFromPluginID:config:];
}

id objc_msgSend_didReceiveErrorFromPluginID_error_(void *a1, const char *a2, ...)
{
  return [a1 didReceiveErrorFromPluginID:error:];
}

id objc_msgSend_didReceiveNotificationFromPluginID_instanceID_value_(void *a1, const char *a2, ...)
{
  return [a1 didReceiveNotificationFromPluginID:instanceID:value:];
}

id objc_msgSend_didReceiveRequestFromPluginID_instanceID_value_withResponse_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "didReceiveRequestFromPluginID:instanceID:value:withResponse:");
}

id objc_msgSend_didReceiveUpdateFromPluginID_values_(void *a1, const char *a2, ...)
{
  return [a1 didReceiveUpdateFromPluginID:values:];
}

id objc_msgSend_didRequestPluginID_instanceID_value_withResponse_(void *a1, const char *a2, ...)
{
  return [a1 didRequestPluginID:x0 instanceID:x1 value:x2 withResponse:x3];
}

id objc_msgSend_didUpdateConfig_(void *a1, const char *a2, ...)
{
  return [a1 didUpdateConfig:];
}

id objc_msgSend_didUpdateCurrentCarConfig_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "didUpdateCurrentCarConfig:");
}

id objc_msgSend_didUpdatePluginID_values_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "didUpdatePluginID:values:");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return _[a1 distantPast];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_fastStartup(void *a1, const char *a2, ...)
{
  return _[a1 fastStartup];
}

id objc_msgSend_fastStartupRegistrations(void *a1, const char *a2, ...)
{
  return _[a1 fastStartupRegistrations];
}

id objc_msgSend_getBoolean_key_(void *a1, const char *a2, ...)
{
  return [a1 getBoolean:key:];
}

id objc_msgSend_getType_(void *a1, const char *a2, ...)
{
  return [a1 getType:];
}

id objc_msgSend_handleCommand_transactionID_values_errors_priority_(void *a1, const char *a2, ...)
{
  return [a1 handleCommand:x0 transactionID:x1 values:x2 errors:x3 priority:x4];
}

id objc_msgSend_hasAccessory_(void *a1, const char *a2, ...)
{
  return [a1 hasAccessory:];
}

id objc_msgSend_hasAccessory_service_(void *a1, const char *a2, ...)
{
  return [a1 hasAccessory:service:];
}

id objc_msgSend_hasAccessory_service_characteristic_(void *a1, const char *a2, ...)
{
  return [a1 hasAccessory:service:characteristic:];
}

id objc_msgSend_hasAccessory_service_control_(void *a1, const char *a2, ...)
{
  return [a1 hasAccessory:service:control:];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:];
}

id objc_msgSend_initWithCarManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithCarManager:];
}

id objc_msgSend_initWithCarManager_sessionStatus_(void *a1, const char *a2, ...)
{
  return [a1 initWithCarManager:sessionStatus:];
}

id objc_msgSend_initWithChannel_priority_(void *a1, const char *a2, ...)
{
  return [a1 initWithChannel:priority:];
}

id objc_msgSend_initWithConnection_agent_(void *a1, const char *a2, ...)
{
  return [a1 initWithConnection:a2 agent:a3];
}

id objc_msgSend_initWithError_(void *a1, const char *a2, ...)
{
  return [a1 initWithError:];
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return [a1 initWithExplanation:x0 target:x1 attributes:x2];
}

id objc_msgSend_initWithIdentifier_capture_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:x0 capture:x1];
}

id objc_msgSend_initWithIdentifier_session_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:session:];
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:];
}

id objc_msgSend_initWithPluginID_(void *a1, const char *a2, ...)
{
  return [a1 initWithPluginID:];
}

id objc_msgSend_initWithProtocol_callbackQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithProtocol:x0 callbackQueue:x1];
}

id objc_msgSend_initWithRegistrationDictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithRegistrationDictionary:];
}

id objc_msgSend_initWithSession_channelType_channelID_withoutReply_qualityOfService_streamPriority_(void *a1, const char *a2, ...)
{
  return [a1 initWithSession:x0 channelType:x1 channelID:x2 withoutReply:x3 qualityOfService:x4 streamPriority:x5];
}

id objc_msgSend_initWithSessionStatus_config_(void *a1, const char *a2, ...)
{
  return [a1 initWithSessionStatus:x0 config:x1];
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDBytes:];
}

id objc_msgSend_initWithValue_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithValue:x0 error:x1];
}

id objc_msgSend_initWithValues_(void *a1, const char *a2, ...)
{
  return [a1 initWithValues:];
}

id objc_msgSend_initWithValuesAndError_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithValuesAndError:error:];
}

id objc_msgSend_inputQueue(void *a1, const char *a2, ...)
{
  return _[a1 inputQueue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateAndRemoveAssertions(void *a1, const char *a2, ...)
{
  return _[a1 invalidateAndRemoveAssertions];
}

id objc_msgSend_isConfigured(void *a1, const char *a2, ...)
{
  return _[a1 isConfigured];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToDate:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isOpened(void *a1, const char *a2, ...)
{
  return _[a1 isOpened];
}

id objc_msgSend_lastAssertion(void *a1, const char *a2, ...)
{
  return _[a1 lastAssertion];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_notifyInstanceID_value_priority_(void *a1, const char *a2, ...)
{
  return [a1 notifyInstanceID:x0 value:x1 priority:x2];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLongLong:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_openChannel(void *a1, const char *a2, ...)
{
  return _[a1 openChannel];
}

id objc_msgSend_osStatusFromCarDataError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "osStatusFromCarDataError:");
}

id objc_msgSend_osTransaction(void *a1, const char *a2, ...)
{
  return _[a1 osTransaction];
}

id objc_msgSend_outputQueue(void *a1, const char *a2, ...)
{
  return _[a1 outputQueue];
}

id objc_msgSend_parseValues_errors_(void *a1, const char *a2, ...)
{
  return [a1 parseValues:errors:];
}

id objc_msgSend_pluginConfigs(void *a1, const char *a2, ...)
{
  return _[a1 pluginConfigs];
}

id objc_msgSend_pluginConfigsRequested(void *a1, const char *a2, ...)
{
  return _[a1 pluginConfigsRequested];
}

id objc_msgSend_pluginCount(void *a1, const char *a2, ...)
{
  return _[a1 pluginCount];
}

id objc_msgSend_pluginID(void *a1, const char *a2, ...)
{
  return _[a1 pluginID];
}

id objc_msgSend_pluginStateCaptures(void *a1, const char *a2, ...)
{
  return _[a1 pluginStateCaptures];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return _[a1 priority];
}

id objc_msgSend_processFastStartupRegistrations_config_(void *a1, const char *a2, ...)
{
  return [a1 processFastStartupRegistrations:config];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processingQueue(void *a1, const char *a2, ...)
{
  return _[a1 processingQueue];
}

id objc_msgSend_proxyQueue(void *a1, const char *a2, ...)
{
  return _[a1 proxyQueue];
}

id objc_msgSend_readFromCache_priority_withResponse_(void *a1, const char *a2, ...)
{
  return [a1 readFromCache:priority:withResponse:];
}

id objc_msgSend_readInstanceIDs_priority_withResponse_(void *a1, const char *a2, ...)
{
  return [a1 readInstanceIDs:priority:withResponse:];
}

id objc_msgSend_receiveData_priority_(void *a1, const char *a2, ...)
{
  return [a1 receiveData:priority:];
}

id objc_msgSend_reconnectTimer(void *a1, const char *a2, ...)
{
  return _[a1 reconnectTimer];
}

id objc_msgSend_registerInstanceIDs_priority_withResponse_(void *a1, const char *a2, ...)
{
  return [a1 registerInstanceIDs:priority:withResponse:];
}

id objc_msgSend_registrations(void *a1, const char *a2, ...)
{
  return _[a1 registrations];
}

id objc_msgSend_registrationsForPluginID_(void *a1, const char *a2, ...)
{
  return [a1 registrationsForPluginID:];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_remoteProxies(void *a1, const char *a2, ...)
{
  return _[a1 remoteProxies];
}

id objc_msgSend_remoteProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsForKeys:];
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsInArray:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:];
}

id objc_msgSend_removeRegistrationFromCache_priority_withResponse_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "removeRegistrationFromCache:priority:withResponse:");
}

id objc_msgSend_requestConfigurationWithPriority_withResponse_(void *a1, const char *a2, ...)
{
  return [a1 requestConfigurationWithPriority:withResponse:];
}

id objc_msgSend_requestInstanceID_value_priority_withResponse_(void *a1, const char *a2, ...)
{
  return [a1 requestInstanceID:x0 value:x1 priority:x2 withResponse:x3];
}

id objc_msgSend_responseInstanceID_error_transactionID_priority_(void *a1, const char *a2, ...)
{
  return [a1 responseInstanceID:x0 error:x1 transactionID:x2 priority:x3];
}

id objc_msgSend_responseInstanceID_value_transactionID_priority_(void *a1, const char *a2, ...)
{
  return [a1 responseInstanceID:x0 value:x1 transactionID:x2 priority:x3];
}

id objc_msgSend_responseTransactionID_error_priority_(void *a1, const char *a2, ...)
{
  return [a1 responseTransactionID:error:priority:];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return [a1 scheduledTimerWithTimeInterval:repeats:block:];
}

id objc_msgSend_sendChannelMessage_(void *a1, const char *a2, ...)
{
  return [a1 sendChannelMessage:];
}

id objc_msgSend_sendCommand_error_transactionID_priority_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendCommand:error:transactionID:priority:");
}

id objc_msgSend_sendCommand_errors_transactionID_priority_(void *a1, const char *a2, ...)
{
  return [a1 sendCommand:errors:transactionID:priority:];
}

id objc_msgSend_sendCommand_values_errors_error_transactionID_priority_withResponse_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendCommand:values:errors:error:transactionID:priority:withResponse:");
}

id objc_msgSend_sendCommand_values_priority_withResponse_(void *a1, const char *a2, ...)
{
  return [a1 sendCommand:x0 values:x1 priority:x2 withResponse:x3];
}

id objc_msgSend_sendCommand_values_transactionID_priority_(void *a1, const char *a2, ...)
{
  return [a1 sendCommand:values:transactionID:priority:];
}

id objc_msgSend_sendToPluginID_payload_priority_completion_(void *a1, const char *a2, ...)
{
  return [a1 sendToPluginID:payload:priority:completion:];
}

id objc_msgSend_sendToPluginID_payload_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendToPluginID:payload:withCompletion:");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _[a1 serviceName];
}

id objc_msgSend_sessionDidConnect_(void *a1, const char *a2, ...)
{
  return [a1 sessionDidConnect:];
}

id objc_msgSend_sessionStatus(void *a1, const char *a2, ...)
{
  return _[a1 sessionStatus];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAssertionCount_(void *a1, const char *a2, ...)
{
  return [a1 setAssertionCount:];
}

id objc_msgSend_setCarStateCapture_(void *a1, const char *a2, ...)
{
  return [a1 setCarStateCapture:];
}

id objc_msgSend_setChannel_(void *a1, const char *a2, ...)
{
  return [a1 setChannel:];
}

id objc_msgSend_setChannelDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setChannelDelegate:];
}

id objc_msgSend_setClientDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setClientDelegate:];
}

id objc_msgSend_setCurrentCar_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentCar:];
}

id objc_msgSend_setCurrentCarConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentCarConfiguration:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return [a1 setError:];
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return [a1 setExportedInterface:];
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return [a1 setExportedObject:];
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInterruptionHandler:];
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInvalidationHandler:];
}

id objc_msgSend_setIsOpened_(void *a1, const char *a2, ...)
{
  return [a1 setIsOpened:];
}

id objc_msgSend_setLastAssertion_(void *a1, const char *a2, ...)
{
  return [a1 setLastAssertion:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOsTransaction_(void *a1, const char *a2, ...)
{
  return [a1 setOsTransaction:];
}

id objc_msgSend_setPluginConfigsRequested_(void *a1, const char *a2, ...)
{
  return [a1 setPluginConfigsRequested:];
}

id objc_msgSend_setReconnectTimer_(void *a1, const char *a2, ...)
{
  return [a1 setReconnectTimer:];
}

id objc_msgSend_setRegistrationsStateCapture_(void *a1, const char *a2, ...)
{
  return [a1 setRegistrationsStateCapture:];
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteObjectInterface:];
}

id objc_msgSend_setStateCaptureManager_(void *a1, const char *a2, ...)
{
  return [a1 setStateCaptureManager:];
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return [a1 setValue:];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_stateCaptureForPluginID_(void *a1, const char *a2, ...)
{
  return [a1 stateCaptureForPluginID:];
}

id objc_msgSend_stateCaptureManager(void *a1, const char *a2, ...)
{
  return _[a1 stateCaptureManager];
}

id objc_msgSend_stateCaptureValues(void *a1, const char *a2, ...)
{
  return _[a1 stateCaptureValues];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_supportsVehicleData(void *a1, const char *a2, ...)
{
  return _[a1 supportsVehicleData];
}

id objc_msgSend_takeAssertions(void *a1, const char *a2, ...)
{
  return _[a1 takeAssertions];
}

id objc_msgSend_targetWithPid_(void *a1, const char *a2, ...)
{
  return [a1 targetWithPid:];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_transactions(void *a1, const char *a2, ...)
{
  return _[a1 transactions];
}

id objc_msgSend_treeLogLines(void *a1, const char *a2, ...)
{
  return _[a1 treeLogLines];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_unregisterInstanceIDs_priority_withResponse_(void *a1, const char *a2, ...)
{
  return [a1 unregisterInstanceIDs:priority:withResponse:];
}

id objc_msgSend_unregisterObserver_(void *a1, const char *a2, ...)
{
  return [a1 unregisterObserver:];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateConfiguration_pluginConfig_(void *a1, const char *a2, ...)
{
  return [a1 updateConfiguration:pluginConfig:];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueCaptureIIDsFromAccessoryConfig_(void *a1, const char *a2, ...)
{
  return [a1 valueCaptureIIDsFromAccessoryConfig:];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 valueForEntitlement:];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return _[a1 values];
}

id objc_msgSend_valuesForPluginID_iids_(void *a1, const char *a2, ...)
{
  return [a1 valuesForPluginID:iids:];
}

id objc_msgSend_vehicleDataPluginCount(void *a1, const char *a2, ...)
{
  return _[a1 vehicleDataPluginCount];
}

id objc_msgSend_vehicleDataProtocolVersion(void *a1, const char *a2, ...)
{
  return _[a1 vehicleDataProtocolVersion];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return _[a1 workQueue];
}

id objc_msgSend_writeValues_priority_withResponse_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "writeValues:priority:withResponse:");
}