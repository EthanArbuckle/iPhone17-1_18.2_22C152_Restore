id NMLogForCategory(uint64_t a1)
{
  void *v2;
  uint64_t vars8;

  if (NMLogForCategory_onceToken != -1) {
    dispatch_once(&NMLogForCategory_onceToken, &__block_literal_global);
  }
  v2 = (void *)NMLogForCategory_logObjects[a1];
  return v2;
}

uint64_t __NMLogForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.nanomusic", "NanoMusicCore");
  v1 = (void *)NMLogForCategory_logObjects;
  NMLogForCategory_logObjects = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.nanomusic", "NanoMusicCore-Oversize");
  v3 = (void *)qword_268A01940;
  qword_268A01940 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.nanomusic", "NanoMediaRemote");
  v5 = (void *)qword_268A01948;
  qword_268A01948 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.nanomusic", "NanoMediaRemote-Oversize");
  v7 = (void *)qword_268A01950;
  qword_268A01950 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.nanomusic", "NanoAudioControl");
  v9 = (void *)qword_268A01958;
  qword_268A01958 = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.nanomusic", "NanoMusicSync");
  v11 = (void *)qword_268A01960;
  qword_268A01960 = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.nanomusic", "NanoMusicSync-Oversize");
  v13 = (void *)qword_268A01968;
  qword_268A01968 = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.nanomusic", "NanoMediaUI");
  v15 = (void *)qword_268A01970;
  qword_268A01970 = (uint64_t)v14;

  os_log_t v16 = os_log_create("com.apple.nanomusic", "NanoMediaUI-Oversize");
  v17 = (void *)qword_268A01978;
  qword_268A01978 = (uint64_t)v16;

  os_log_t v18 = os_log_create("com.apple.nanomusic", "NanoMediaAPI");
  v19 = (void *)qword_268A01980;
  qword_268A01980 = (uint64_t)v18;

  os_log_t v20 = os_log_create("com.apple.nanomusic", "NanoMediaAPI-Oversize");
  v21 = (void *)qword_268A01988;
  qword_268A01988 = (uint64_t)v20;

  os_log_t v22 = os_log_create("com.apple.nanomusic", "NanoMediaTool");
  v23 = (void *)qword_268A01990;
  qword_268A01990 = (uint64_t)v22;

  os_log_t v24 = os_log_create("com.apple.nanomusic", "NanoMediaBridgeUI");
  v25 = (void *)qword_268A019A0;
  qword_268A019A0 = (uint64_t)v24;

  os_log_t v26 = os_log_create("com.apple.nanomusic", "NanoMediaBridgeUI-Oversize");
  v27 = (void *)qword_268A019A8;
  qword_268A019A8 = (uint64_t)v26;

  qword_268A01998 = (uint64_t)os_log_create("com.apple.nanomusic", "NanoMediaAppActivity");
  return MEMORY[0x270F9A758]();
}

void sub_2397B4358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2397B46BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2397B4EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t isPairedDeviceGreenTeaCapable()
{
  os_log_t v0 = [MEMORY[0x263F57730] sharedInstance];
  v1 = [v0 getActivePairedDevice];
  os_log_t v2 = [v1 valueForProperty:*MEMORY[0x263F57588]];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

void sub_2397B768C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t NMUResolvedDownloadWaitingReason(uint64_t a1, int a2)
{
  uint64_t result = 0;
  switch(a1)
  {
    case 0:
      id v8 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Unsupported status." userInfo:0];
      objc_exception_throw(v8);
    case 1:
    case 2:
      if ((~a2 & 0x12) != 0) {
        uint64_t result = 7;
      }
      else {
        uint64_t result = 8;
      }
      if ((a2 & 0x10) == 0)
      {
        if ((a2 & 2) != 0)
        {
          os_log_t v6 = [MEMORY[0x263F120E8] sharedNetworkObserver];
          int v7 = [v6 isMusicCellularDownloadingAllowed];

          if (v7) {
            uint64_t result = 6;
          }
          else {
            uint64_t result = 5;
          }
        }
        else
        {
          uint64_t v4 = 3;
          uint64_t v5 = a2 & 1;
          if ((a2 & 4) != 0) {
            uint64_t v5 = 2;
          }
          if ((a2 & 8) == 0) {
            uint64_t v4 = v5;
          }
          if ((a2 & 0x20) != 0) {
            uint64_t result = 9;
          }
          else {
            uint64_t result = v4;
          }
        }
      }
      break;
    case 4:
      uint64_t result = a2 & 1;
      break;
    case 5:
      uint64_t result = 10;
      break;
    default:
      return result;
  }
  return result;
}

id _titleForModelObject(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [v1 name];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Unsupported model type." userInfo:0];
      objc_exception_throw(v5);
    }
    uint64_t v2 = [v1 title];
  }
  uint64_t v3 = (void *)v2;

  return v3;
}

void sub_2397BAF20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t NMUMetricsEndpointTypeFromEndpointRoute(void *a1)
{
  id v1 = a1;
  if ([v1 isDeviceRoute])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isPhoneRoute])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isAppleTVRoute])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isHomePodRoute])
  {
    if ([v1 isB520Route]) {
      uint64_t v2 = 4;
    }
    else {
      uint64_t v2 = 3;
    }
  }
  else
  {
    uint64_t v2 = 5;
  }

  return v2;
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t BPSDetailTextColor()
{
  return MEMORY[0x270F12830]();
}

uint64_t BPSProgressBarTintColor()
{
  return MEMORY[0x270F12870]();
}

uint64_t BPSProgressBarTrackTintColor()
{
  return MEMORY[0x270F12878]();
}

uint64_t BPSTextColor()
{
  return MEMORY[0x270F12880]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t IOPSCopyPowerSourcesByType()
{
  return MEMORY[0x270EF4900]();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return (CFArrayRef)MEMORY[0x270EF4918](blob);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x270F061F8]();
}

void UIRectFill(CGRect rect)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIScaleTransformForAspectFitOfSizeInTargetSize()
{
  return MEMORY[0x270F063A8]();
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

void objc_exception_throw(id exception)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}