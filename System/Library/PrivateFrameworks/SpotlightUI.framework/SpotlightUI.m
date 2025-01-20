id SPTransactionCreate(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  uint64_t vars8;

  v1 = a1;
  if ([v1 count]
    && ([v1 componentsJoinedByString:@"."], (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = (void *)v2;
    v4 = (__CFString *)[[NSString alloc] initWithFormat:@"com.apple.spotlight.%@", v2];
  }
  else
  {
    v4 = @"com.apple.spotlight";
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    SPTransactionCreate_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  v12 = v4;
  [(__CFString *)v12 UTF8String];
  v13 = (void *)os_transaction_create();

  return v13;
}

void SPTransactionDone(void *a1)
{
  id v1 = a1;
  if (v1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    v2 = (void *)os_transaction_copy_description();
    if (v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      SPTransactionDone_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }
    free(v2);
  }
}

void sub_224D5EBE8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void lockStateChanged(uint64_t a1, const void *a2)
{
  int v3 = MKBGetDeviceLockState();
  if (!v3 || v3 == 3 || unlocked == 1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, a2, @"com.apple.mobile.keybagd.lock_status", 0);
    unlocked = 1;
  }
}

void sendAppsInfoWithData(void *a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (runningInSpotlight)
  {
    uint64_t v8 = prepareApps(v6, v7);
    if (v8)
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F674D0]) initWithName:@"Apps"];
      [v9 setRootObject:v8];
      [v9 setInfo:MEMORY[0x263EFFA78]];
      [v5 sendMessage:v9];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 134218240;
        uint64_t v11 = [v6 count];
        __int16 v12 = 2048;
        uint64_t v13 = [v7 count];
        _os_log_impl(&dword_224D5D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Send apps:%ld hidden:%ld", (uint8_t *)&v10, 0x16u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_224D5D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "No app data to send", (uint8_t *)&v10, 2u);
    }
  }
}

id prepareApps(void *a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v35 = a2;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v40 objects:v55 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v41;
    uint64_t v8 = &_os_log_internal;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v41 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v11 = [v3 objectForKeyedSubscript:v10];
        if (([v11 displayNameLoaded] & 1) == 0)
        {
          __int16 v12 = [v11 displayName];
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v52 = v10;
            __int16 v53 = 2112;
            v54 = v12;
            _os_log_debug_impl(&dword_224D5D000, v8, OS_LOG_TYPE_DEBUG, "app %@ display name %@", buf, 0x16u);
          }
          if ([v12 length])
          {
            [v11 setDisplayName:v12];
          }
          else
          {
            if (!v6) {
              id v6 = objc_opt_new();
            }
            [v6 addObject:v10];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v40 objects:v55 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v13 = (void *)[v3 count];
  if (v13)
  {
    uint64_t v14 = v35;
    if ([v35 count])
    {
      v49[0] = @"apps";
      v49[1] = @"hiddenApps";
      v50[0] = v3;
      v50[1] = v35;
      v15 = NSDictionary;
      v16 = (id *)v50;
      v17 = (__CFString **)v49;
      uint64_t v18 = 2;
    }
    else
    {
      v47 = @"apps";
      id v48 = v3;
      v15 = NSDictionary;
      v16 = &v48;
      v17 = &v47;
      uint64_t v18 = 1;
    }
    uint64_t v13 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:v18];
  }
  else
  {
    uint64_t v14 = v35;
  }
  id v19 = v13;
  v20 = v19;
  if ([v6 count])
  {
    v21 = [v19 objectForKeyedSubscript:@"apps"];
    v22 = (void *)[v21 mutableCopy];

    v23 = [v19 objectForKeyedSubscript:@"hiddenApps"];
    v24 = (void *)[v23 mutableCopy];
    v25 = v24;
    if (v24) {
      id v26 = v24;
    }
    else {
      id v26 = (id)objc_opt_new();
    }
    v27 = v26;

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v28 = v6;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v37 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void *)(*((void *)&v36 + 1) + 8 * j);
          [v22 removeObjectForKey:v33];
          [v27 addObject:v33];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v30);
    }

    v20 = v19;
    if (v22)
    {
      v20 = v19;
      if (v27)
      {
        v44[0] = @"apps";
        v44[1] = @"hiddenApps";
        v45[0] = v22;
        v45[1] = v27;
        v20 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
      }
    }

    uint64_t v14 = v35;
  }

  return v20;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void SPUIInitLogging()
{
  if (SPUIInitLogging_once != -1) {
    dispatch_once(&SPUIInitLogging_once, &__block_literal_global_1);
  }
}

void __SPUIInitLogging_block_invoke()
{
  for (uint64_t i = 0; i != 7; ++i)
  {
    os_log_t v1 = os_log_create("com.apple.spotlight.ui", SPUILogSubsystem_block_invoke_categories[i]);
    v2 = (void *)spuiLogHandles[i];
    spuiLogHandles[i] = (uint64_t)v1;
  }
}

__CFString *SPUIRemoteViewPresentationSourceDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7) {
    return @"Unknown";
  }
  else {
    return off_264702C28[a1 - 1];
  }
}

void sub_224D60838(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_224D612E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

__CFString *SPUIRemoteViewPresentationIntentDescription(unint64_t a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return off_264702C68[a1];
  }
}

__CFString *SPUISearchViewSceneSettingValueDescription(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  switch(a1)
  {
    case 1000:
      uint64_t v5 = [v3 description];
      goto LABEL_6;
    case 1003:
      unint64_t v7 = [v3 integerValue];
      if (v7 < 5)
      {
        id v6 = off_264702C68[v7];
        goto LABEL_10;
      }
      break;
    case 1002:
      uint64_t v5 = SPUIRemoteViewPresentationSourceDescription([v3 integerValue]);
LABEL_6:
      id v6 = (__CFString *)v5;
      goto LABEL_10;
  }
  id v6 = 0;
LABEL_10:

  return v6;
}

__CFString *SPUISearchViewSceneClientSettingsKeyDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1000) > 0xC) {
    return 0;
  }
  else {
    return off_264702C90[a1 - 1000];
  }
}

id SPUISearchViewClientSceneSettingsValueDescription(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = v4;
  char v6 = a1 + 24;
  if ((unint64_t)(a1 - 1000) > 0xA)
  {
    uint64_t v8 = 0;
  }
  else
  {
    if (((1 << v6) & 0x47F) != 0)
    {
      uint64_t v7 = [v4 description];
    }
    else
    {
      if (((1 << v6) & 0x300) != 0)
      {
        [v4 CGSizeValue];
        NSStringFromCGSize(v11);
      }
      else
      {
        BSSettingFlagDescription();
      uint64_t v7 = };
    }
    uint64_t v8 = (void *)v7;
  }

  return v8;
}

void sub_224D645B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
}

void sub_224D64E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_224D65BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void SPTransactionCreate_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SPTransactionDone_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t BSSettingFlagDescription()
{
  return MEMORY[0x270F2D0C8]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x270F2D0D0]();
}

uint64_t BSSettingFlagIfYes()
{
  return MEMORY[0x270F2D0D8]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x270F2D0E0]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t FBSProcessResourceAllowanceMakeWithRealTimeInterval()
{
  return MEMORY[0x270F2D0E8]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

uint64_t SBUIGetUserAgent()
{
  return MEMORY[0x270F77230]();
}

uint64_t SPFastApplicationsGet()
{
  return MEMORY[0x270F5CDF8]();
}

uint64_t SPFastApplicationsGetNoBuild()
{
  return MEMORY[0x270F5CE00]();
}

uint64_t SPFastHiddenAppsGetNoBuild()
{
  return MEMORY[0x270F5CE10]();
}

uint64_t SPSetAppUpdateBlock()
{
  return MEMORY[0x270F5CEA8]();
}

uint64_t UIEdgeInsetsRotate()
{
  return MEMORY[0x270F06000]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9280](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

uint64_t os_transaction_copy_description()
{
  return MEMORY[0x270EDAA88]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}