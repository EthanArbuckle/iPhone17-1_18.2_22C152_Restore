double RCPTimeIntervalFromMachTimestamp(unint64_t a1)
{
  if (machDurationOfSecond_once != -1) {
    dispatch_once(&machDurationOfSecond_once, &__block_literal_global_0);
  }
  return (double)a1 / *(double *)&machDurationOfSecond_duration;
}

id RCPLogPlayback()
{
  if (RCPLogPlayback_onceToken != -1) {
    dispatch_once(&RCPLogPlayback_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)RCPLogPlayback___logObj;
  return v0;
}

id _RCPVirtualHIDServiceQueue()
{
  if (_RCPVirtualHIDServiceQueue_onceToken != -1) {
    dispatch_once(&_RCPVirtualHIDServiceQueue_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)_RCPVirtualHIDServiceQueue_queue;
  return v0;
}

id _RCPActiveScreens()
{
  v0 = [MEMORY[0x1E4F39B60] displays];
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v0, "count"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = ___RCPActiveScreens_block_invoke;
  v3[3] = &unk_1E5D77058;
  v3[4] = &v4;
  [v0 enumerateObjectsUsingBlock:v3];
  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A9055FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _RCPIsAllowlistedProperty(void *a1)
{
  uint64_t v1 = _RCPIsAllowlistedProperty_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_RCPIsAllowlistedProperty_onceToken, &__block_literal_global_188);
  }
  uint64_t v3 = [(id)_RCPIsAllowlistedProperty_propertyNames containsObject:v2];

  return v3;
}

void sub_1A905914C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFBSOrientationObserverClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __FrontBoardServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5D77018;
    uint64_t v5 = 0;
    FrontBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!FrontBoardServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getFBSOrientationObserverClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("FBSOrientationObserver");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getFBSOrientationObserverClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FrontBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FrontBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

double RCPTimeIntervalFromMachDuration(uint64_t a1)
{
  if (machDurationOfSecond_once != -1) {
    dispatch_once(&machDurationOfSecond_once, &__block_literal_global_0);
  }
  return (double)a1 / *(double *)&machDurationOfSecond_duration;
}

unint64_t RCPMachTimestampFromTimeInterval(double a1)
{
  if (a1 < 0.0) {
    RCPMachTimestampFromTimeInterval_cold_1();
  }
  if (machDurationOfSecond_once != -1) {
    dispatch_once(&machDurationOfSecond_once, &__block_literal_global_0);
  }
  return (unint64_t)(*(double *)&machDurationOfSecond_duration * a1);
}

uint64_t RCPMachDurationFromTimeInterval(double a1)
{
  if (machDurationOfSecond_once != -1) {
    dispatch_once(&machDurationOfSecond_once, &__block_literal_global_0);
  }
  return (uint64_t)(*(double *)&machDurationOfSecond_duration * a1);
}

double __machDurationOfSecond_block_invoke()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v0) = info.numer;
  double result = (double)(1000000000 * (unint64_t)info.denom) / (double)v0;
  *(double *)&machDurationOfSecond_duration = result;
  return result;
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

uint64_t signal_handler(uint64_t a1)
{
  return [(id)s_sharedTool handleSignal:a1];
}

uint64_t _updateEventPhase(void *a1)
{
  [a1 hidEvent];
  CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
  if (Children)
  {
    CFArrayRef v2 = Children;
    if (CFArrayGetCount(Children) >= 1) {
      CFArrayGetValueAtIndex(v2, 0);
    }
  }
  return IOHIDEventSetPhase();
}

uint64_t RCPSetNonDecayingThreadPriority(int a1)
{
  sched_param v9 = 0;
  int v8 = 0;
  CFArrayRef v2 = pthread_self();
  pthread_getschedparam(v2, &v8, &v9);
  if (v9.sched_priority < a1) {
    v9.sched_priority = a1;
  }
  uint64_t v3 = pthread_setschedparam(v2, v8, &v9);
  integer_t v7 = 0;
  thread_act_t v4 = MEMORY[0x1AD0ECA70](v3);
  thread_policy_set(v4, 1u, &v7, 1u);
  uint64_t result = proc_setthread_cpupercent();
  if (result)
  {
    integer_t v7 = 1;
    thread_act_t v6 = MEMORY[0x1AD0ECA70](result);
    return thread_policy_set(v6, 1u, &v7, 1u);
  }
  return result;
}

void _RCPEventHIDEnumerateChildren(uint64_t a1, int a2, void *a3)
{
  thread_act_t v4 = a3;
  CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
  if (Children)
  {
    CFArrayRef v6 = Children;
    CFIndex Count = CFArrayGetCount(Children);
    char v12 = 0;
    if (Count >= 1)
    {
      CFIndex v8 = Count;
      CFIndex v9 = 0;
      do
      {
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v6, v9);
          if (!a2 || IOHIDEventGetType() == a2) {
            break;
          }
          if (++v9 >= v8) {
            goto LABEL_12;
          }
        }
        v4[2](v4, ValueAtIndex, v9++, &v12);
        if (v12) {
          BOOL v11 = 0;
        }
        else {
          BOOL v11 = v9 < v8;
        }
      }
      while (v11);
    }
  }
LABEL_12:
}

uint64_t _RCPEventHIDDigitizerEventCountOfTouchingContacts(uint64_t a1)
{
  uint64_t v5 = 0;
  CFArrayRef v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  if (IOHIDEventGetType() == 11)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = ___RCPEventHIDDigitizerEventCountOfTouchingContacts_block_invoke;
    v4[3] = &unk_1E5D77148;
    v4[4] = &v5;
    _RCPEventHIDEnumerateChildren(a1, 11, v4);
  }
  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_1A905B38C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t RCPHIDEventMatchingPredicate(uint64_t a1, void *a2)
{
  return _RCPHIDEventMatchingPredicateCore(a1, 0, a2);
}

uint64_t _RCPHIDEventMatchingPredicateCore(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  CFArrayRef v6 = v5;
  if (a1 && ((*((uint64_t (**)(id, uint64_t, uint64_t))v5 + 2))(v5, a1, a2) & 1) == 0)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = IOHIDEventGetChildren();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      uint64_t v11 = a2 + 1;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = _RCPHIDEventMatchingPredicateCore(*(void *)(*((void *)&v15 + 1) + 8 * v12), v11, v6);
          if (v13)
          {
            a1 = v13;
            goto LABEL_13;
          }
          ++v12;
        }
        while (v9 != v12);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    a1 = 0;
LABEL_13:
  }
  return a1;
}

uint64_t RCPHIDEventTransformLocation(uint64_t a1, long long *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  long long v2 = a2[1];
  long long v5 = *a2;
  long long v6 = v2;
  v4[2] = __RCPHIDEventTransformLocation_block_invoke;
  v4[3] = &__block_descriptor_88_e26_B24__0____IOHIDEvent__8q16l;
  v4[4] = a1;
  long long v7 = a2[2];
  return _RCPHIDEventMatchingPredicateCore(a1, 0, v4);
}

uint64_t __RCPHIDEventTransformLocation_block_invoke()
{
  int Type = IOHIDEventGetType();
  if (Type == 17 || Type == 11)
  {
    IOHIDEventGetFloatValue();
    IOHIDEventGetFloatValue();
    IOHIDEventSetFloatValue();
    IOHIDEventSetFloatValue();
  }
  return 0;
}

double DKDCenterRectOverRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v26.origin.x = a5;
  v26.origin.y = a6;
  v26.size.width = a7;
  v26.size.height = a8;
  double MidX = CGRectGetMidX(v26);
  v27.origin.x = a5;
  v27.origin.y = a6;
  v27.size.width = a7;
  v27.size.height = a8;
  double MidY = CGRectGetMidY(v27);
  v28.origin.x = a1;
  v28.origin.y = a2;
  v28.size.width = a3;
  v28.size.height = a4;
  double v17 = CGRectGetMidX(v28);
  v29.origin.x = a1;
  v29.origin.y = a2;
  v29.size.width = a3;
  v29.size.height = a4;
  double v18 = MidY - CGRectGetMidY(v29);
  CGFloat v19 = a1;
  CGFloat v20 = a2;
  CGFloat v21 = a3;
  CGFloat v22 = a4;
  *(void *)&double result = (unint64_t)CGRectOffset(*(CGRect *)&v19, MidX - v17, v18);
  return result;
}

double DKDRectWithSize()
{
  return 0.0;
}

void sub_1A905D6F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

Class __getFBSOrientationObserverClass_block_invoke_0(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __FrontBoardServicesLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5D771D0;
    uint64_t v5 = 0;
    FrontBoardServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!FrontBoardServicesLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
LABEL_8:
      __getFBSOrientationObserverClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("FBSOrientationObserver");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getFBSOrientationObserverClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FrontBoardServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  FrontBoardServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

uint64_t __RCPLogPlayback_block_invoke()
{
  RCPLogPlayback___logObj = (uint64_t)os_log_create("com.apple.recap", "Playback");
  return MEMORY[0x1F41817F8]();
}

id RCPLogWorkarounds()
{
  if (RCPLogWorkarounds_onceToken != -1) {
    dispatch_once(&RCPLogWorkarounds_onceToken, &__block_literal_global_4);
  }
  unint64_t v0 = (void *)RCPLogWorkarounds___logObj;
  return v0;
}

uint64_t __RCPLogWorkarounds_block_invoke()
{
  RCPLogWorkarounds___logObj = (uint64_t)os_log_create("com.apple.recap", "Workarounds");
  return MEMORY[0x1F41817F8]();
}

id RCPCGImageBackedImageFromImage(void *a1)
{
  id v1 = a1;
  if ([v1 ioSurface])
  {
    long long v2 = (const void *)_UICreateCGImageFromIOSurfaceWithOptions();
    id v3 = objc_alloc(MEMORY[0x1E4F42A80]);
    [v1 scale];
    id v5 = (id)objc_msgSend(v3, "initWithCGImage:scale:orientation:", v2, objc_msgSend(v1, "imageOrientation"), v4);
    CFRelease(v2);
  }
  else
  {
    id v5 = v1;
  }

  return v5;
}

void sub_1A90613BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1A90634C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1A90642D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A9066CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _ioHIDEventCallback(void *a1, int a2, const void *a3, CFTypeRef cf)
{
  CFRetain(cf);
  uint64_t v7 = mach_absolute_time();
  uint64_t v8 = a1;
  uint64_t v9 = v8;
  if (!a3) {
    goto LABEL_10;
  }
  if (![v8 shouldRecordSenderProperties]) {
    goto LABEL_10;
  }
  CFTypeID v10 = CFGetTypeID(a3);
  if (v10 != IOHIDServiceClientGetTypeID()) {
    goto LABEL_10;
  }
  if (!_ioHIDEventCallback_sSenderPropertiesBySenderID)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v12 = (void *)_ioHIDEventCallback_sSenderPropertiesBySenderID;
    _ioHIDEventCallback_sSenderPropertiesByuint64_t SenderID = (uint64_t)v11;
  }
  uint64_t SenderID = IOHIDEventGetSenderID();
  if (SenderID)
  {
    v14 = [NSNumber numberWithUnsignedLongLong:SenderID];
    long long v15 = [(id)_ioHIDEventCallback_sSenderPropertiesBySenderID objectForKeyedSubscript:v14];
    if (!v15)
    {
      long long v15 = +[RCPEventSenderProperties senderFromIOHIDService:a3];
      [(id)_ioHIDEventCallback_sSenderPropertiesBySenderID setObject:v15 forKeyedSubscript:v14];
    }
  }
  else
  {
LABEL_10:
    long long v15 = 0;
  }
  if (v9[25])
  {
    v9[25] = 0;
    uint64_t v16 = [v9 _initialLocationEvent];
  }
  else
  {
    uint64_t v16 = 0;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = ___ioHIDEventCallback_block_invoke;
  v18[3] = &unk_1E5D77370;
  id v19 = v15;
  uint64_t v20 = v16;
  CFTypeRef v21 = cf;
  uint64_t v22 = v7;
  id v17 = v15;
  dispatch_async(MEMORY[0x1E4F14428], v18);
}

void ___ioHIDEventCallback_block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v2 = +[RCPRecorder sharedRecorder];
  id v3 = v2[2];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v29;
    uint64_t v7 = &_CLTLogLevel;
    unint64_t v8 = 0x1E5D76000uLL;
    uint64_t v26 = a1;
    uint64_t v9 = (FILE **)MEMORY[0x1E4F143D8];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v12 = [v11 config];
        char v13 = [v12 ignoreSenderProperties];

        id v14 = 0;
        long long v15 = *(void **)(a1 + 32);
        if (v15 && (v13 & 1) == 0) {
          id v14 = v15;
        }
        if (*(void *)(a1 + 40)) {
          objc_msgSend(v11, "setStartLocationEvent:");
        }
        uint64_t v16 = [*(id *)(v8 + 3536) eventWithHIDEvent:*(void *)(a1 + 48) deliveryTimeStamp:*(void *)(a1 + 56) senderProperties:v14 preActions:0];
        [v11 enqueueEvent:v16];
        if (*v7 >= 5)
        {
          id v17 = NSString;
          CFStringRef v18 = CFCopyDescription(*(CFTypeRef *)(a1 + 48));
          uint64_t v19 = v5;
          uint64_t v20 = v6;
          unint64_t v21 = v8;
          uint64_t v22 = v7;
          v23 = (__CFString *)v18;
          id v24 = [v17 stringWithFormat:@"%@", v18];
          fputs((const char *)[v24 UTF8String], *v9);

          uint64_t v7 = v22;
          unint64_t v8 = v21;
          uint64_t v6 = v20;
          uint64_t v5 = v19;
          a1 = v26;
          fflush(*v9);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v5);
  }

  v25 = *(const void **)(a1 + 40);
  if (v25) {
    CFRelease(v25);
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

id RCPMediaTimingFunctionForInputType(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  if (a1 == 1)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F39C10];
LABEL_8:
    uint64_t v7 = [v6 functionWithName:*MEMORY[0x1E4F3A4A0]];
    goto LABEL_11;
  }
  if (a1 == 2)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F39C10];
    goto LABEL_9;
  }
  if (a1 != 3)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F39C10];
    if (a2) {
      goto LABEL_8;
    }
LABEL_9:
    LODWORD(a3) = 1048980465;
    LODWORD(a4) = 1043842074;
    LODWORD(a5) = 1061297928;
    LODWORD(a6) = 1063511816;
    goto LABEL_10;
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F39C10];
  LODWORD(a3) = 1056437569;
  LODWORD(a4) = 1026291025;
  LODWORD(a5) = 1057228128;
  LODWORD(a6) = 1064648875;
LABEL_10:
  uint64_t v7 = [v6 functionWithControlPoints:a3 :a4 :a5 :a6];
LABEL_11:
  return v7;
}

id RCPDataFromHexString(void *a1)
{
  id v1 = a1;
  long long v2 = objc_opt_new();
  id v3 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"#$ <>:\n"];
  uint64_t v4 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789ABCDEFabcdef"];
  uint64_t v5 = [v4 invertedSet];

  uint64_t v6 = [v1 componentsSeparatedByCharactersInSet:v3];
  uint64_t v7 = [v6 componentsJoinedByString:&stru_1EFF926D0];

  uint64_t v8 = [v7 rangeOfCharacterFromSet:v5];
  if (([v7 length] & 1) == 0 && v8 == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v7, "length"))
  {
    unint64_t v9 = 0;
    do
    {
      char v10 = [v7 characterAtIndex:v9];
      if ((v10 - 65) <= 5) {
        char v11 = v10 - 55;
      }
      else {
        char v11 = 0;
      }
      if ((v10 - 97) <= 5) {
        char v11 = v10 - 87;
      }
      if ((v10 - 48) <= 9) {
        char v12 = v10 - 48;
      }
      else {
        char v12 = v11;
      }
      unint64_t v13 = v9 + 1;
      int v14 = [v7 characterAtIndex:v13];
      unsigned int v15 = v14 - 48;
      if ((v14 - 65) <= 5) {
        char v16 = v14 - 55;
      }
      else {
        char v16 = 0;
      }
      if ((v14 - 97) <= 5) {
        char v17 = v14 - 87;
      }
      else {
        char v17 = v16;
      }
      if (v15 > 9) {
        LOBYTE(v15) = v17;
      }
      char v19 = v15 | (16 * v12);
      [v2 appendBytes:&v19 length:1];
      unint64_t v9 = v13 + 1;
    }
    while (v9 < [v7 length]);
  }

  return v2;
}

void sub_1A906801C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id parseCommandFromCLIArguments(void *a1, void *a2)
{
  v569[12] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v553 = a2;
  uint64_t v4 = objc_alloc_init(CLIArguments);
  v550 = v3;
  [(CLIArguments *)v4 setArguments:v3];
  v552 = v4;
  uint64_t v5 = [(CLIArguments *)v4 objectAtIndexedSubscript:0];
  LODWORD(v3) = [v5 isEqualToString:@"sender"];

  if (v3)
  {
    v551 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
    if (v551)
    {
      if (propertiesForSenderString_onceToken != -1) {
        dispatch_once(&propertiesForSenderString_onceToken, &__block_literal_global_774);
      }
      uint64_t v6 = (void *)propertiesForSenderString_propertyMap;
      uint64_t v7 = [v551 lowercaseString];
      uint64_t v8 = [v6 objectForKeyedSubscript:v7];
      uint64_t v9 = [v8 pointerValue];

      if (v9)
      {
        char v10 = +[RCPEventSenderProperties performSelector:v9];
        if (v10)
        {
          [v553 setSenderProperties:v10];
          id v11 = 0;
LABEL_20:

          uint64_t v26 = [(CLIArguments *)v552 consumeUpToIndex:2];
LABEL_43:

          goto LABEL_44;
        }
      }
      CGRect v27 = (void *)MEMORY[0x1E4F28D90];
      long long v28 = [v551 dataUsingEncoding:4];
      id v561 = 0;
      char v10 = [v27 JSONObjectWithData:v28 options:0 error:&v561];
      id v11 = v561;

      if (v10)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v29 = +[RCPEventSenderProperties senderWithProperties:v10];
          [v553 setSenderProperties:v29];

          goto LABEL_20;
        }
        v72 = (FILE *)*MEMORY[0x1E4F143C8];
        id v40 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
        fprintf(v72, "JSON sender data didn't decode to dictionary (%s)\n", (const char *)[v40 UTF8String]);
      }
      else
      {
        v39 = (FILE *)*MEMORY[0x1E4F143C8];
        id v40 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
        v41 = (const char *)[v40 UTF8String];
        id v42 = [v11 description];
        fprintf(v39, "I don't recognize the sender value (%s) -- error:%s\n", v41, (const char *)[v42 UTF8String]);
      }
      uint64_t v26 = 0;
      goto LABEL_43;
    }
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "Please specify a value for argument \"%s\".\n", (const char *)[@"sender" UTF8String]);
LABEL_37:
    uint64_t v26 = 0;
    goto LABEL_44;
  }
  char v12 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
  v551 = [v12 componentsSeparatedByString:@":"];

  unint64_t v13 = [v551 objectAtIndexedSubscript:0];
  int v14 = [v13 isEqualToString:@"kbd"];

  if (v14)
  {
    if ((unint64_t)[v551 count] >= 2)
    {
      unsigned int v15 = [v551 objectAtIndexedSubscript:1];
      if (isNumber(v15))
      {
        char v16 = [v551 objectAtIndexedSubscript:1];
        BOOL v17 = isNegativeNumber(v16);

        if (!v17)
        {
          CFStringRef v18 = NSNumber;
          char v19 = [v551 objectAtIndexedSubscript:1];
          objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v19, "integerValue"));
          id obj = (id)objc_claimAutoreleasedReturnValue();

LABEL_29:
          v43 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
          uint64_t v563 = 0;
          v564 = &v563;
          uint64_t v565 = 0x2050000000;
          v44 = (void *)getTypistHWKeyboardClass_softClass;
          uint64_t v566 = getTypistHWKeyboardClass_softClass;
          if (!getTypistHWKeyboardClass_softClass)
          {
            v562[0] = MEMORY[0x1E4F143A8];
            v562[1] = 3221225472;
            v562[2] = __getTypistHWKeyboardClass_block_invoke;
            v562[3] = &unk_1E5D76FF8;
            v562[4] = &v563;
            __getTypistHWKeyboardClass_block_invoke((uint64_t)v562);
            v44 = (void *)v564[3];
          }
          v45 = v44;
          _Block_object_dispose(&v563, 8);
          v46 = (void *)[[v45 alloc] initWithLanguage:obj];
          v47 = (void *)MEMORY[0x1E4F28D90];
          v48 = [v46 getPropertyDictionaryString];
          v49 = [v48 dataUsingEncoding:4];
          v50 = [v47 JSONObjectWithData:v49 options:0 error:0];

          v51 = +[RCPEventSenderProperties senderWithProperties:v50];
          v52 = [v46 usagePairsForText:v43];
          [v553 setSenderProperties:v51];
          v53 = [v52 usagePages];
          v54 = [v52 usages];
          v55 = [v52 usagePages];
          BOOL v56 = [v55 count] == 0;

          if (!v56)
          {
            unint64_t v57 = 0;
            do
            {
              v58 = [v53 objectAtIndex:v57];
              v59 = [v54 objectAtIndex:v57];
              [v553 pressButtonsWithPages:v58 usages:v59 duration:0.12];

              v60 = [v52 usagePages];
              unint64_t v61 = [v60 count];

              ++v57;
            }
            while (v57 < v61);
          }
          uint64_t v26 = [(CLIArguments *)v552 consumeUpToIndex:2];

          goto LABEL_44;
        }
      }
      else
      {
      }
    }
    fwrite("No keyboard language provided. Defaulting to US English Keyboard.", 0x41uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
    id obj = &unk_1EFF9AAB8;
    goto LABEL_29;
  }
  uint64_t v20 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
  int v21 = [v20 isEqualToString:@"tf"];

  if (v21)
  {
    uint64_t v22 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
    BOOL v23 = isNumber(v22);

    if (v23)
    {
      id v24 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
      objc_msgSend(v553, "setTouchFrequency:", objc_msgSend(v24, "integerValue"));

      uint64_t v25 = [(CLIArguments *)v552 consumeUpToIndex:2];
LABEL_16:
      uint64_t v26 = (void *)v25;
      goto LABEL_44;
    }
    v62 = (FILE *)*MEMORY[0x1E4F143C8];
    v63 = "Please specify a frequency in touches/sec.\n";
    size_t v64 = 43;
    goto LABEL_36;
  }
  long long v30 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
  int v31 = [v30 isEqualToString:@"unicode"];

  if (v31)
  {
    v32 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
    if (!v32)
    {
      fwrite("Please specify a text to synthesize.\n", 0x25uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
      uint64_t v26 = 0;
LABEL_55:

      goto LABEL_44;
    }
    uint64_t v33 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
    BOOL v34 = isNumber(v33);

    if (v34)
    {
      v35 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
      [v35 floatValue];
      double v37 = v36;

      uint64_t v38 = 3;
    }
    else
    {
      uint64_t v38 = 2;
      double v37 = 0.1;
    }
    [v553 sendUnicodeString:v32 synthesizePerCharacterEvents:1 durationBetweenEvents:v37];
    uint64_t v85 = [(CLIArguments *)v552 consumeUpToIndex:v38];
LABEL_54:
    uint64_t v26 = (void *)v85;
    goto LABEL_55;
  }
  v65 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
  int v66 = [v65 isEqualToString:@"wait"];

  if (v66)
  {
    v67 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
    BOOL v68 = isNumber(v67);

    if (v68)
    {
      v69 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
      [v69 floatValue];
      double v71 = v70;

      [v553 advanceTime:v71];
      uint64_t v25 = [(CLIArguments *)v552 consumeUpToIndex:2];
      goto LABEL_16;
    }
    v62 = (FILE *)*MEMORY[0x1E4F143C8];
    v63 = "Please specify a duration to wait.\n";
    size_t v64 = 35;
LABEL_36:
    fwrite(v63, v64, 1uLL, v62);
    goto LABEL_37;
  }
  v74 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
  int v75 = [v74 isEqualToString:@"d"];

  if (v75)
  {
    v76 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
    if (isNumber(v76))
    {
      v77 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
      BOOL v78 = isNumber(v77);

      if (v78)
      {
        v79 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
        [v79 floatValue];
        float v81 = v80;
        v82 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
        [v82 floatValue];
        double v84 = v83;

        objc_msgSend(v553, "doubleTap:", v81, v84);
        uint64_t v25 = [(CLIArguments *)v552 consumeUpToIndex:3];
        goto LABEL_16;
      }
    }
    else
    {
    }
    v62 = (FILE *)*MEMORY[0x1E4F143C8];
    v63 = "Please specify a start point for the double tap.\n";
LABEL_63:
    size_t v64 = 49;
    goto LABEL_36;
  }
  v86 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
  int v87 = [v86 isEqualToString:@"qt"];

  if (v87)
  {
    v88 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
    if (isNumber(v88))
    {
      v89 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
      BOOL v90 = isNumber(v89);

      if (v90)
      {
        v91 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
        [v91 floatValue];
        float v93 = v92;
        v94 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
        double v95 = v93;
        [v94 floatValue];
        double v97 = v96;

        objc_msgSend(v553, "touchDown:", v95, v97);
        [v553 advanceTime:0.000001];
        objc_msgSend(v553, "liftUp:", v95, v97);
        uint64_t v25 = [(CLIArguments *)v552 consumeUpToIndex:3];
        goto LABEL_16;
      }
    }
    else
    {
    }
    v62 = (FILE *)*MEMORY[0x1E4F143C8];
    v63 = "Please specify a start point for the quick tap.\n";
    size_t v64 = 48;
    goto LABEL_36;
  }
  v98 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
  int v99 = [v98 isEqualToString:@"ttw"];

  if (v99)
  {
    v100 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
    if (isNumber(v100))
    {
      v101 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
      BOOL v102 = isNumber(v101);

      if (v102)
      {
        v103 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
        [v103 floatValue];
        float v105 = v104;
        v106 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
        [v106 floatValue];
        double v108 = v107;

        objc_msgSend(v553, "tapToWakeAtPoint:", v105, v108);
        uint64_t v25 = [(CLIArguments *)v552 consumeUpToIndex:3];
        goto LABEL_16;
      }
      goto LABEL_140;
    }
    goto LABEL_139;
  }
  v109 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
  int v110 = [v109 isEqualToString:@"edgeOrb"];

  if (v110)
  {
    v100 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
    if (isNumber(v100))
    {
      v111 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
      BOOL v112 = isNumber(v111);

      if (v112)
      {
        v113 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
        [v113 floatValue];
        float v115 = v114;
        v116 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
        [v116 floatValue];
        double v118 = v117;

        objc_msgSend(v553, "edgeOrb:", v115, v118);
        uint64_t v25 = [(CLIArguments *)v552 consumeUpToIndex:3];
        goto LABEL_16;
      }
      goto LABEL_140;
    }
    goto LABEL_139;
  }
  v119 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
  int v120 = [v119 isEqualToString:@"edgeOrbSwipe"];

  if (v120)
  {
    v100 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
    if (isNumber(v100))
    {
      v121 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
      BOOL v122 = isNumber(v121);

      if (v122)
      {
        v123 = [(CLIArguments *)v552 objectAtIndexedSubscript:3];
        if (isNumber(v123))
        {
          v124 = [(CLIArguments *)v552 objectAtIndexedSubscript:4];
          BOOL v125 = isNumber(v124);

          if (v125)
          {
            v126 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
            [v126 floatValue];
            float v128 = v127;
            v129 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
            [v129 floatValue];
            float v131 = v130;

            v132 = [(CLIArguments *)v552 objectAtIndexedSubscript:3];
            [v132 floatValue];
            float v134 = v133;
            v135 = [(CLIArguments *)v552 objectAtIndexedSubscript:4];
            [v135 floatValue];
            float v137 = v136;

            v138 = [(CLIArguments *)v552 objectAtIndexedSubscript:5];
            BOOL v139 = isNumber(v138);
            if (v139)
            {
              v135 = [(CLIArguments *)v552 objectAtIndexedSubscript:5];
              [v135 floatValue];
              double v141 = v140;
            }
            else
            {
              double v141 = 0.5;
            }
            objc_msgSend(v553, "edgeOrbSwipe:withEndLocation:withDuration:", v128, v131, v134, v137, v141);
            if (v139) {

            }
            v32 = [(CLIArguments *)v552 objectAtIndexedSubscript:5];
            if (isNumber(v32)) {
              uint64_t v264 = 6;
            }
            else {
              uint64_t v264 = 5;
            }
            uint64_t v85 = [(CLIArguments *)v552 consumeUpToIndex:v264];
            goto LABEL_54;
          }
        }
        else
        {
        }
        v62 = (FILE *)*MEMORY[0x1E4F143C8];
        v63 = "Please specify a end point for the swipe.\n";
        size_t v64 = 42;
        goto LABEL_36;
      }
      goto LABEL_140;
    }
    goto LABEL_139;
  }
  v142 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
  int v143 = [v142 isEqualToString:@"hvr"];

  if (v143)
  {
    v144 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
    if (isNumber(v144))
    {
      v145 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
      BOOL v146 = isNumber(v145);

      if (v146)
      {
        v147 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
        [v147 floatValue];
        float v149 = v148;
        v150 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
        [v150 floatValue];
        float v152 = v151;

        v153 = [(CLIArguments *)v552 objectAtIndexedSubscript:3];
        BOOL v154 = isNumber(v153);

        double v155 = 5.0;
        if (v154)
        {
          v156 = [(CLIArguments *)v552 objectAtIndexedSubscript:3];
          [v156 floatValue];
          double v155 = v157;
        }
        v158 = [(CLIArguments *)v552 objectAtIndexedSubscript:4];
        BOOL v159 = isNumber(v158);

        double v160 = 1.0;
        if (v159)
        {
          v161 = [(CLIArguments *)v552 objectAtIndexedSubscript:4];
          [v161 floatValue];
          double v160 = v162;
        }
        v163 = [(CLIArguments *)v552 objectAtIndexedSubscript:5];
        BOOL v164 = isNumber(v163);

        if (v164)
        {
          v165 = [(CLIArguments *)v552 objectAtIndexedSubscript:6];
          if (isNumber(v165))
          {
            v166 = [(CLIArguments *)v552 objectAtIndexedSubscript:7];
            BOOL v167 = isNumber(v166);

            if (v167)
            {
              v168 = [(CLIArguments *)v552 objectAtIndexedSubscript:5];
              [v168 floatValue];
              float v170 = v169;

              v171 = [(CLIArguments *)v552 objectAtIndexedSubscript:6];
              [v171 floatValue];
              float v173 = v172;

              v174 = [(CLIArguments *)v552 objectAtIndexedSubscript:7];
              double v175 = v170;
              double v176 = v173;
              [v174 floatValue];
              double v178 = v177;

              uint64_t v179 = 8;
              goto LABEL_128;
            }
          }
          else
          {
          }
          v62 = (FILE *)*MEMORY[0x1E4F143C8];
          v63 = "Please specify a azimuth angle, altitude angle, and roll angle.\n";
          size_t v64 = 64;
          goto LABEL_36;
        }
        double v175 = 0.0;
        double v176 = 0.785398163;
        uint64_t v179 = 5;
        double v178 = 0.0;
LABEL_128:
        objc_msgSend(v553, "hoverAtLocation:withDuration:withZPosition:withAltitudeAngle:withAzimuthAngle:withRollAngle:", v149, v152, v160, v155, v176, v175, v178);
        if (v154)
        {
          if (v159) {
            [(CLIArguments *)v552 consumeUpToIndex:v179];
          }
          else {
          uint64_t v25 = [(CLIArguments *)v552 consumeUpToIndex:4];
          }
          goto LABEL_16;
        }
        goto LABEL_373;
      }
    }
    else
    {
    }
    v62 = (FILE *)*MEMORY[0x1E4F143C8];
    v63 = "Please specify a start point for the hover.\n";
LABEL_102:
    size_t v64 = 44;
    goto LABEL_36;
  }
  v180 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
  int v181 = [v180 isEqualToString:@"br"];

  if (v181)
  {
    v182 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
    if (isNumber(v182))
    {
      v183 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
      BOOL v184 = isNumber(v183);

      if (v184)
      {
        v185 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
        [v185 floatValue];
        float v187 = v186;
        uint64_t v188 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
        [(id)v188 floatValue];
        float v190 = v189;

        v191 = [(CLIArguments *)v552 objectAtIndexedSubscript:3];
        LOBYTE(v188) = isNumber(v191);

        if (v188)
        {
          v192 = [(CLIArguments *)v552 objectAtIndexedSubscript:3];
          [v192 floatValue];
          float v194 = v193;

          v195 = [(CLIArguments *)v552 objectAtIndexedSubscript:4];
          BOOL v196 = isNumber(v195);

          if (!v196)
          {
            v62 = (FILE *)*MEMORY[0x1E4F143C8];
            v63 = "Please specify an altitude angle for the barrel roll.\n";
            size_t v64 = 54;
            goto LABEL_36;
          }
          v197 = [(CLIArguments *)v552 objectAtIndexedSubscript:4];
          [v197 floatValue];
          float v199 = v198;

          v200 = [(CLIArguments *)v552 objectAtIndexedSubscript:5];
          BOOL v201 = isNumber(v200);

          if (!v201)
          {
            v62 = (FILE *)*MEMORY[0x1E4F143C8];
            v63 = "Please specify an azimuth angle for the barrel roll.\n";
            size_t v64 = 53;
            goto LABEL_36;
          }
          v202 = [(CLIArguments *)v552 objectAtIndexedSubscript:5];
          [v202 floatValue];
          float v204 = v203;

          v205 = [(CLIArguments *)v552 objectAtIndexedSubscript:6];
          BOOL v206 = isNumber(v205);

          if (v206)
          {
            v207 = [(CLIArguments *)v552 objectAtIndexedSubscript:6];
            [v207 floatValue];
            double v209 = v208;

            objc_msgSend(v553, "barrelRollAtLocation:withZPosition:withAltitudeAngle:withAzimuthAngle:withRollAngle:", v187, v190, v194, v199, v204, v209);
            uint64_t v25 = [(CLIArguments *)v552 consumeUpToIndex:7];
            goto LABEL_16;
          }
          v62 = (FILE *)*MEMORY[0x1E4F143C8];
          v63 = "Please specify a roll angle for the barrel roll.\n";
          goto LABEL_63;
        }
        v62 = (FILE *)*MEMORY[0x1E4F143C8];
        v63 = "Please specify a starting z position for the barrel roll.\n";
LABEL_143:
        size_t v64 = 58;
        goto LABEL_36;
      }
    }
    else
    {
    }
    v62 = (FILE *)*MEMORY[0x1E4F143C8];
    v63 = "Please specify a start point for the barrel roll.\n";
    size_t v64 = 50;
    goto LABEL_36;
  }
  v210 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
  int v211 = [v210 isEqualToString:@"sq"];

  if (v211)
  {
    [v553 squeeze];
    uint64_t v25 = [(CLIArguments *)v552 consumeUpToIndex:1];
    goto LABEL_16;
  }
  v212 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
  int v213 = [v212 isEqualToString:@"tbc"];

  if (v213)
  {
    v214 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
    if (!v214)
    {
      v265 = (FILE *)*MEMORY[0x1E4F143C8];
      v266 = "Please specify a Tostada option 'c', 'i', 'e'.\n";
      size_t v267 = 47;
      goto LABEL_154;
    }
    v215 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];

    if (v215)
    {
      v216 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
      uint64_t v217 = [v216 BOOLValue];

      unsigned int v218 = 3;
    }
    else
    {
      uint64_t v217 = 0;
      unsigned int v218 = 2;
    }
    v270 = [(CLIArguments *)v552 objectAtIndexedSubscript:3];
    BOOL v271 = isNumber(v270);

    double v272 = 0.0;
    if (v271)
    {
      v273 = [(CLIArguments *)v552 objectAtIndexedSubscript:3];
      [v273 doubleValue];
      double v272 = v274;

      ++v218;
    }
    v275 = [(CLIArguments *)v552 objectAtIndexedSubscript:4];
    BOOL v276 = isNumberIncludingNegatives(v275);

    double v277 = 0.0;
    if (v276)
    {
      v278 = [(CLIArguments *)v552 objectAtIndexedSubscript:4];
      [v278 doubleValue];
      double v277 = v279;

      ++v218;
    }
    v280 = [(CLIArguments *)v552 objectAtIndexedSubscript:5];
    BOOL v281 = isNumber(v280);

    double v282 = 0.5;
    if (v281)
    {
      v283 = [(CLIArguments *)v552 objectAtIndexedSubscript:5];
      [v283 doubleValue];
      double v282 = v284;

      ++v218;
    }
    v285 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
    int v286 = [v285 isEqualToString:@"c"];

    if (v286)
    {
      [v553 touchSensitiveButtonClickWithPage:&unk_1EFF9AA88 withUsage:&unk_1EFF9AAD0 withTouch:v217 withNormalizedPositionY:v272 withNormalizedPositionDeltaY:v277];
    }
    else
    {
      v287 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
      int v288 = [v287 isEqualToString:@"i"];

      if (v288)
      {
        [v553 touchSensitiveButtonIntermediatePressWithDuration:&unk_1EFF9AA88 withPage:&unk_1EFF9AAD0 withUsage:v217 withTouch:v282 withNormalizedPositionY:v272 withNormalizedPositionDeltaY:v277];
      }
      else
      {
        v289 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
        int v290 = [v289 isEqualToString:@"e"];

        if (v290)
        {
          [v553 touchSensitiveButtonIntermediatePressWithPage:&unk_1EFF9AA88 withUsage:&unk_1EFF9AAD0 withTouch:v217 withNormalizedPositionY:v272 withNormalizedPositionDeltaY:v277];
          [v553 touchSensitiveButtonEngagedWithLiftWithDuration:&unk_1EFF9AA88 withPage:&unk_1EFF9AAD0 withUsage:v217 withTouch:v282 withNormalizedPositionY:v272 withNormalizedPositionDeltaY:v277];
        }
        else
        {
          v293 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
          int v294 = [v293 isEqualToString:@"h"];

          if (v294)
          {
            [v553 touchSensitiveButtonHoldWithPage:&unk_1EFF9AA88 withUsage:&unk_1EFF9AAD0 withTouch:v217 withNormalizedPositionY:v272 withNormalizedPositionDeltaY:v277];
            [v553 advanceTime:v282];
            [v553 touchSensitiveButtonReleaseHoldWithPage:&unk_1EFF9AA88 withUsage:&unk_1EFF9AAD0 withTouch:v217 withNormalizedPositionY:v272 withNormalizedPositionDeltaY:v277];
          }
        }
      }
    }
    uint64_t v295 = [(CLIArguments *)v552 consumeUpToIndex:v218];
LABEL_178:
    uint64_t v26 = (void *)v295;
    goto LABEL_179;
  }
  v219 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
  int v220 = [v219 isEqualToString:@"tt"];

  if (v220)
  {
    v100 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
    if (isNumber(v100))
    {
      v221 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
      BOOL v222 = isNumber(v221);

      if (v222)
      {
        v223 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
        [v223 floatValue];
        float v225 = v224;
        v226 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
        [v226 floatValue];
        float v228 = v227;

        v229 = [(CLIArguments *)v552 objectAtIndexedSubscript:3];
        if (isNumber(v229))
        {
          v230 = [(CLIArguments *)v552 objectAtIndexedSubscript:4];
          BOOL v231 = isNumber(v230);

          if (v231)
          {
            v232 = [(CLIArguments *)v552 objectAtIndexedSubscript:3];
            uint64_t v233 = [v232 integerValue];

            if (v233)
            {
              double v234 = v225;
              double v235 = v228;
              for (unint64_t i = 1; i <= v242; ++i)
              {
                v237 = [(CLIArguments *)v552 objectAtIndexedSubscript:4];
                objc_msgSend(v553, "tapsNoLift:location:withNumberOfTouches:", 1, objc_msgSend(v237, "integerValue"), v234, v235);

                v238 = [(CLIArguments *)v552 objectAtIndexedSubscript:5];
                if (isNumber(v238))
                {
                  v239 = [(CLIArguments *)v552 objectAtIndexedSubscript:5];
                  [v239 doubleValue];
                  objc_msgSend(v553, "advanceTime:");
                }
                else
                {
                  [v553 advanceTime:0.15];
                }

                v240 = [(CLIArguments *)v552 objectAtIndexedSubscript:4];
                objc_msgSend(v553, "liftUp:touchCount:", objc_msgSend(v240, "integerValue"), v234, v235);

                v241 = [(CLIArguments *)v552 objectAtIndexedSubscript:3];
                unint64_t v242 = [v241 integerValue];
              }
            }
            v243 = [(CLIArguments *)v552 objectAtIndexedSubscript:5];
            BOOL v244 = isNumber(v243);

            if (v244) {
              uint64_t v245 = 6;
            }
            else {
              uint64_t v245 = 5;
            }
            goto LABEL_306;
          }
        }
        else
        {
        }
        v62 = (FILE *)*MEMORY[0x1E4F143C8];
        v63 = "Please specify a number of taps and a number of fingers to use for multi-finger tap\n";
        size_t v64 = 84;
        goto LABEL_36;
      }
      goto LABEL_140;
    }
    goto LABEL_139;
  }
  v246 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
  int v247 = [v246 isEqualToString:@"t"];

  if (v247)
  {
    v100 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
    if (isNumber(v100))
    {
      v248 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
      BOOL v249 = isNumber(v248);

      if (v249)
      {
        v250 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
        [v250 floatValue];
        float v252 = v251;
        v253 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
        [v253 floatValue];
        float v255 = v254;

        [v553 defaultRadius];
        double v257 = v256;
        v258 = [(CLIArguments *)v552 objectAtIndexedSubscript:3];
        LODWORD(v253) = [v258 isEqualToString:@"r"];

        if (v253)
        {
          v259 = [(CLIArguments *)v552 objectAtIndexedSubscript:4];
          BOOL v260 = isNumber(v259);

          if (!v260)
          {
            v62 = (FILE *)*MEMORY[0x1E4F143C8];
            v63 = "No valid radius specified following touch radius command.\n";
            goto LABEL_143;
          }
          v261 = [(CLIArguments *)v552 objectAtIndexedSubscript:3];
          [v261 floatValue];
          double v257 = v262;

          uint64_t v263 = 5;
        }
        else
        {
          uint64_t v263 = 3;
        }
        v303 = [(CLIArguments *)v552 objectAtIndexedSubscript:v263];
        BOOL v304 = isNumber(v303);

        double v305 = 0.0;
        if (v304)
        {
          v306 = [(CLIArguments *)v552 objectAtIndexedSubscript:v263];
          [v306 floatValue];
          double v305 = v307;

          ++v263;
        }
        v308 = [(CLIArguments *)v552 objectAtIndexedSubscript:v263];
        int v309 = [v308 isEqualToString:@"peek"];

        v310 = [(CLIArguments *)v552 objectAtIndexedSubscript:v263];
        double v311 = v252;
        double v312 = v255;
        uint64_t v313 = [v310 isEqualToString:@"pop"];

        if ((v309 | v313) != 1)
        {
          v318 = [(CLIArguments *)v552 objectAtIndexedSubscript:v263];
          int v319 = [v318 isEqualToString:@"d"];

          v320 = [(CLIArguments *)v552 objectAtIndexedSubscript:v263];
          int v321 = [v320 isEqualToString:@"f"];

          v322 = [(CLIArguments *)v552 objectAtIndexedSubscript:v263];
          int v323 = [v322 isEqualToString:@"s"];

          v324 = [(CLIArguments *)v552 objectAtIndexedSubscript:v263];
          int v325 = [v324 isEqualToString:@"p"];

          if (((v319 | v321 | v323) & 1) == 0 && !v325)
          {
            if (v304) {
              objc_msgSend(v553, "dragWithStartPoint:endPoint:duration:radius:", v311, v255, v311, v255, v305, v257);
            }
            else {
              objc_msgSend(v553, "tap:radius:", v311, v255, v257);
            }
            uint64_t v25 = [(CLIArguments *)v552 consumeUpToIndex:v263];
            goto LABEL_16;
          }
          v333 = [(CLIArguments *)v552 objectAtIndexedSubscript:v263 + 1];
          if (isNumber(v333))
          {
            v334 = [(CLIArguments *)v552 objectAtIndexedSubscript:v263 + 2];
            BOOL v335 = isNumber(v334);

            if (v335)
            {
              v336 = [(CLIArguments *)v552 objectAtIndexedSubscript:v263 + 1];
              [v336 floatValue];
              float v338 = v337;
              v339 = [(CLIArguments *)v552 objectAtIndexedSubscript:v263 + 2];
              [v339 floatValue];
              float v341 = v340;

              v342 = [(CLIArguments *)v552 objectAtIndexedSubscript:v263 + 3];
              double v343 = v338;
              double v344 = v341;
              BOOL v345 = isNumber(v342);

              if (v319)
              {
                double v346 = 1.0;
                if (v345)
                {
                  v347 = [(CLIArguments *)v552 objectAtIndexedSubscript:v263 + 3];
                  [v347 floatValue];
                  double v346 = v348;
                }
                objc_msgSend(v553, "dragWithStartPoint:endPoint:duration:tapAndWait:lift:radius:", 1, v311, v312, v343, v344, v346, v305, v257);
              }
              else if (v321)
              {
                if (v345)
                {
                  v394 = [(CLIArguments *)v552 objectAtIndexedSubscript:v263 + 3];
                  [v394 floatValue];
                  double v396 = v395;
                }
                else
                {
                  double v396 = 0.2;
                }
                objc_msgSend(v553, "sendFlickWithStartPoint:endPoint:duration:radius:", v311, v312, v343, v341, v396, v257);
              }
              else if (v323)
              {
                double v428 = 1.0;
                if (v345)
                {
                  v429 = [(CLIArguments *)v552 objectAtIndexedSubscript:v263 + 3];
                  [v429 floatValue];
                  double v428 = v430;
                }
                objc_msgSend(v553, "pinchCloseWithStartPoint:endPoint:duration:radius:", v311, v312, v343, v341, v428, v257);
              }
              else if (v325)
              {
                double v448 = 1.0;
                if (v345)
                {
                  v449 = [(CLIArguments *)v552 objectAtIndexedSubscript:v263 + 3];
                  [v449 floatValue];
                  double v448 = v450;
                }
                objc_msgSend(v553, "pinchOpenWithStartPoint:endPoint:duration:radius:", v311, v312, v343, v341, v448, v257);
              }
              if (v345) {
                uint64_t v245 = v263 + 4;
              }
              else {
                uint64_t v245 = v263 + 3;
              }
              goto LABEL_306;
            }
          }
          else
          {
          }
          v62 = (FILE *)*MEMORY[0x1E4F143C8];
          v63 = "Please specify start and end points for the touch.\n";
          goto LABEL_141;
        }
        v314 = [(CLIArguments *)v552 objectAtIndexedSubscript:v263 + 1];
        BOOL v315 = isNumber(v314);

        if (v315)
        {
          v316 = [(CLIArguments *)v552 objectAtIndexedSubscript:v263 + 1];
          [v316 floatValue];
          objc_msgSend(v553, "peekAndPop:commit:duration:radius:", v313, v311, v255, v317, v257);
        }
        else
        {
          objc_msgSend(v553, "peekAndPop:commit:duration:radius:", v313, v311, v255, 1.0, v257);
        }
        if (v315) {
          uint64_t v245 = v263 + 2;
        }
        else {
          uint64_t v245 = v263 + 1;
        }
LABEL_306:
        uint64_t v25 = [(CLIArguments *)v552 consumeUpToIndex:v245];
        goto LABEL_16;
      }
LABEL_140:
      v62 = (FILE *)*MEMORY[0x1E4F143C8];
      v63 = "Please specify a start point for the tap or touch.\n";
LABEL_141:
      size_t v64 = 51;
      goto LABEL_36;
    }
LABEL_139:

    goto LABEL_140;
  }
  v268 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
  int v269 = [v268 isEqualToString:@"mt"];

  if (v269)
  {
    v32 = [(CLIArguments *)v552 consumeUpToIndex:1];
    uint64_t v85 = parseMultitouchCommandFromArgumentString(v32, v553);
    goto LABEL_54;
  }
  v291 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
  int v292 = [v291 isEqualToString:@"st"];

  if (v292)
  {
    [v553 setTransducerType:0];
    [v553 setTouchFrequency:240];
    v32 = [(CLIArguments *)v552 consumeUpToIndex:1];
    uint64_t v85 = parseMultitouchCommandFromArgumentString(v32, v553);
    goto LABEL_54;
  }
  v296 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
  int v297 = [v296 isEqualToString:@"stt"];

  if (v297)
  {
    [v553 stylusBarrelDoubleTap];
    uint64_t v25 = [(CLIArguments *)v552 consumeUpToIndex:1];
    goto LABEL_16;
  }
  v298 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
  int v299 = [v298 isEqualToString:@"ringer"];

  if (v299)
  {
    v300 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
    BOOL v301 = isNumber(v300);

    if (v301)
    {
      v302 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
      objc_msgSend(v553, "flipRingerSwitchToValue:", objc_msgSend(v302, "BOOLValue"));

      uint64_t v25 = [(CLIArguments *)v552 consumeUpToIndex:2];
      goto LABEL_16;
    }
    v62 = (FILE *)*MEMORY[0x1E4F143C8];
    v63 = "Please specify if the ringer should be enabled or disabled (1 or 0).\n";
    size_t v64 = 69;
    goto LABEL_36;
  }
  v326 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
  int v327 = [v326 isEqualToString:@"b"];

  if (v327)
  {
    v328 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
    BOOL v329 = isNumber(v328);

    if (v329)
    {
      v330 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
      [v330 doubleValue];
      double v332 = v331;
    }
    else
    {
      double v332 = 0.12;
    }
    v568[0] = @"h";
    v568[1] = @"u";
    v569[0] = &unk_1EFF9AAE8;
    v569[1] = &unk_1EFF9AB00;
    v568[2] = @"vu";
    v568[3] = @"d";
    v569[2] = &unk_1EFF9AB00;
    v569[3] = &unk_1EFF9AB18;
    v568[4] = @"vd";
    v568[5] = @"w";
    v569[4] = &unk_1EFF9AB18;
    v569[5] = &unk_1EFF9AB30;
    v568[6] = @"lock";
    v568[7] = @"s";
    v569[6] = &unk_1EFF9AB30;
    v569[7] = &unk_1EFF9AB48;
    v568[8] = @"c";
    v568[9] = @"l";
    v569[8] = &unk_1EFF9AB60;
    v569[9] = &unk_1EFF9AB78;
    v568[10] = @"r";
    v568[11] = @"p";
    v569[10] = &unk_1EFF9AB90;
    v569[11] = &unk_1EFF9ABA8;
    v366 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v569 forKeys:v568 count:12];
    v367 = objc_opt_new();
    v368 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
    v558[0] = MEMORY[0x1E4F143A8];
    v558[1] = 3221225472;
    v558[2] = __parseCommandFromCLIArguments_block_invoke;
    v558[3] = &unk_1E5D77460;
    id v369 = v368;
    id v559 = v369;
    id v370 = v367;
    id v560 = v370;
    [v366 enumerateKeysAndObjectsUsingBlock:v558];
    if ([v370 count])
    {
      if ([v370 containsObject:&unk_1EFF9AB60])
      {
        v371 = +[RCPEventSenderProperties crownSender];
        [v553 setSenderProperties:v371];
      }
      if (([v370 containsObject:&unk_1EFF9AB00] & 1) != 0
        || ([v370 containsObject:&unk_1EFF9AB18] & 1) != 0
        || [v370 containsObject:&unk_1EFF9AB30])
      {
        v372 = +[RCPEventSenderProperties phoneButtonSender];
        [v553 setSenderProperties:v372];
      }
      [v553 pressButtons:v370 duration:v332];
      if (v329) {
        uint64_t v373 = 3;
      }
      else {
        uint64_t v373 = 2;
      }
      uint64_t v26 = [(CLIArguments *)v552 consumeUpToIndex:v373];
    }
    else
    {
      fwrite("Please specify valid hardware buttons to press.\n", 0x30uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
      uint64_t v26 = 0;
    }

    goto LABEL_44;
  }
  v349 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
  int v350 = [v349 isEqualToString:@"bx"];

  if (!v350)
  {
    v374 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
    int v375 = [v374 isEqualToString:@"vendor"];

    if (v375)
    {
      v376 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
      if (isHexadecimal(v376))
      {
        v377 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
        BOOL v378 = isHexadecimal(v377);

        if (v378) {
          goto LABEL_262;
        }
      }
      else
      {
      }
      fwrite("Please specify a usage pair.\n", 0x1DuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
LABEL_262:
      LODWORD(v562[0]) = 0;
      LODWORD(v563) = 0;
      v397 = (void *)MEMORY[0x1E4F28FE8];
      v398 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
      v399 = [v397 scannerWithString:v398];

      if ([v399 scanHexInt:v562])
      {
        v400 = (void *)MEMORY[0x1E4F28FE8];
        v401 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
        v402 = [v400 scannerWithString:v401];

        if ([v402 scanHexInt:&v563])
        {
          id v403 = objc_alloc(NSNumber);
          v404 = (void *)[v403 initWithInt:LODWORD(v562[0])];
          id v405 = objc_alloc(NSNumber);
          v406 = (void *)[v405 initWithInt:v563];
          v407 = [(CLIArguments *)v552 objectAtIndexedSubscript:3];
          BOOL v408 = isNumber(v407);

          if (v408)
          {
            v409 = [(CLIArguments *)v552 objectAtIndexedSubscript:4];
            BOOL v410 = isHexadecimal(v409);

            if (v410)
            {
              v411 = [(CLIArguments *)v552 objectAtIndexedSubscript:4];
              v412 = RCPDataFromHexString(v411);

              v413 = [(CLIArguments *)v552 objectAtIndexedSubscript:3];
              objc_msgSend(v553, "vendorEventWithPage:withUsage:withVersion:withData:", v404, v406, objc_msgSend(v413, "intValue"), v412);

              uint64_t v26 = [(CLIArguments *)v552 consumeUpToIndex:5];
            }
            else
            {
              v471 = [(CLIArguments *)v552 objectAtIndexedSubscript:3];
              objc_msgSend(v553, "vendorEventWithPage:withUsage:withVersion:", v404, v406, objc_msgSend(v471, "intValue"));

              uint64_t v26 = [(CLIArguments *)v552 consumeUpToIndex:4];
            }
          }
          else
          {
            fwrite("Please specify a version for the event.\n", 0x28uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
            uint64_t v26 = 0;
          }
        }
        else
        {
          fwrite("Please specify a valid usage in hex.\n", 0x25uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
          uint64_t v26 = 0;
        }
      }
      else
      {
        fwrite("Please specify a valid usage page in hex.\n", 0x2AuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
        uint64_t v26 = 0;
      }

      goto LABEL_44;
    }
    v379 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
    int v380 = [v379 isEqualToString:@"rc"];

    if (v380)
    {
      v381 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
      BOOL v382 = isNumber(v381);

      if (!v382)
      {
        v62 = (FILE *)*MEMORY[0x1E4F143C8];
        v63 = "Please specify a rotation angle in degrees.\n";
        goto LABEL_102;
      }
      v383 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
      [v383 doubleValue];
      double v385 = v384;

      v386 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
      v214 = v386;
      if (v386 && !isNumber(v386))
      {
        if ([v214 isEqualToString:@"cw"])
        {
          uint64_t v387 = 0;
          unsigned int v388 = 3;
        }
        else
        {
          if (([v214 isEqualToString:@"ccw"] & 1) == 0)
          {
            v265 = (FILE *)*MEMORY[0x1E4F143C8];
            v266 = "Please specify a valid direction (cw or ccw). If no direction is specified cw is assumed.\n";
            size_t v267 = 90;
            goto LABEL_154;
          }
          unsigned int v388 = 3;
          uint64_t v387 = 1;
        }
      }
      else
      {
        uint64_t v387 = 0;
        unsigned int v388 = 2;
      }
      uint64_t v389 = v388;
      v390 = [(CLIArguments *)v552 objectAtIndexedSubscript:v388];
      v391 = v390;
      if (v390)
      {
        if (!isNumber(v390))
        {
          fwrite("Please specify a valid duration in secs.\n", 0x29uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
          uint64_t v26 = 0;
          goto LABEL_323;
        }
        [v391 doubleValue];
        double v393 = v392;
        uint64_t v389 = (v389 + 1);
      }
      else
      {
        double v393 = 0.3;
      }
      v470 = +[RCPEventSenderProperties crownSender];
      [v553 setSenderProperties:v470];

      [v553 rotateCrown:v387 direction:v385 duration:v393];
      uint64_t v26 = [(CLIArguments *)v552 consumeUpToIndex:v389];
LABEL_323:

      goto LABEL_179;
    }
    v414 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
    int v415 = [v414 isEqualToString:@"ptset"];

    if (v415)
    {
      v416 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
      if (isNumber(v416))
      {
        v417 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
        BOOL v418 = isNumber(v417);

        if (v418)
        {
          v419 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
          [v419 floatValue];
          float v421 = v420;
          v422 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
          [v422 floatValue];
          double v424 = v423;

          objc_msgSend(v553, "pointerSetAbsolutePosition:", v421, v424);
          uint64_t v25 = [(CLIArguments *)v552 consumeUpToIndex:3];
          goto LABEL_16;
        }
        goto LABEL_308;
      }
      goto LABEL_307;
    }
    v431 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
    int v432 = [v431 isEqualToString:@"ptmove"];

    if (v432)
    {
      v416 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
      if (isNumberIncludingNegatives(v416))
      {
        v433 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
        BOOL v434 = isNumberIncludingNegatives(v433);

        if (v434)
        {
          v435 = [(CLIArguments *)v552 objectAtIndexedSubscript:3];
          [v435 floatValue];
          float v437 = v436;

          v438 = [(CLIArguments *)v552 objectAtIndexedSubscript:4];
          uint64_t v439 = [v438 integerValue];

          if (v437 <= 0.0) {
            double v440 = 1.0;
          }
          else {
            double v440 = v437;
          }
          if (v439 <= 1) {
            uint64_t v441 = 1;
          }
          else {
            uint64_t v441 = v439;
          }
          v442 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
          [v442 floatValue];
          float v444 = v443;
          v445 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
          [v445 floatValue];
          double v447 = v446;

          objc_msgSend(v553, "pointerMoveDelta:duration:frequency:", v441, v444, v447, v440);
          uint64_t v25 = [(CLIArguments *)v552 consumeUpToIndex:5];
          goto LABEL_16;
        }
        goto LABEL_308;
      }
LABEL_307:

LABEL_308:
      v62 = (FILE *)*MEMORY[0x1E4F143C8];
      v63 = "Please specify a point.\n";
      size_t v64 = 24;
      goto LABEL_36;
    }
    v451 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
    int v452 = [v451 isEqualToString:@"ptscroll"];

    if (v452)
    {
      v453 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
      if (isNumberIncludingNegatives(v453))
      {
        v454 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
        BOOL v455 = isNumberIncludingNegatives(v454);

        if (v455)
        {
          v456 = [(CLIArguments *)v552 objectAtIndexedSubscript:3];
          [v456 floatValue];
          float v458 = v457;

          v459 = [(CLIArguments *)v552 objectAtIndexedSubscript:4];
          [v459 floatValue];
          float v461 = v460;

          if (v458 <= 0.0) {
            double v462 = 1.0;
          }
          else {
            double v462 = v458;
          }
          v463 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
          [v463 floatValue];
          float v465 = v464;
          v466 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
          double v467 = v465;
          [v466 floatValue];
          double v469 = v468;

          if (v461 <= 0.0) {
            objc_msgSend(v553, "pointerPhasedScroll:duration:", v467, v469, v462);
          }
          else {
            objc_msgSend(v553, "pointerPhasedScroll:duration:frequency:", (uint64_t)v461, v467, v469, v462);
          }
LABEL_365:
          uint64_t v25 = [(CLIArguments *)v552 consumeUpToIndex:5];
          goto LABEL_16;
        }
        goto LABEL_341;
      }
      goto LABEL_340;
    }
    v472 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
    int v473 = [v472 isEqualToString:@"ptflick"];

    if (v473)
    {
      v453 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
      if (isNumberIncludingNegatives(v453))
      {
        v474 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
        BOOL v475 = isNumberIncludingNegatives(v474);

        if (v475)
        {
          v476 = [(CLIArguments *)v552 objectAtIndexedSubscript:3];
          [v476 floatValue];
          float v478 = v477;

          v479 = [(CLIArguments *)v552 objectAtIndexedSubscript:4];
          [v479 floatValue];
          float v481 = v480;

          if (v478 <= 0.0) {
            double v482 = 0.2;
          }
          else {
            double v482 = v478;
          }
          v483 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
          [v483 floatValue];
          float v485 = v484;
          v486 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
          double v487 = v485;
          [v486 floatValue];
          double v489 = v488;

          BOOL v490 = *MEMORY[0x1E4F1DAD8] == v487;
          BOOL v491 = *(double *)(MEMORY[0x1E4F1DAD8] + 8) == v489;
          double v492 = 0.0;
          if (!v490 || !v491) {
            double v492 = v487;
          }
          double v493 = 200.0;
          if (!v490 || !v491) {
            double v493 = v489;
          }
          if (v481 <= 0.0) {
            objc_msgSend(v553, "pointerPhasedFlick:duration:", v492, v493, v482);
          }
          else {
            objc_msgSend(v553, "pointerPhasedFlick:duration:frequency:", (uint64_t)v481, v492, v493, v482);
          }
          goto LABEL_365;
        }
LABEL_341:
        v62 = (FILE *)*MEMORY[0x1E4F143C8];
        v63 = "Please specify a delta point.\n";
        size_t v64 = 30;
        goto LABEL_36;
      }
LABEL_340:

      goto LABEL_341;
    }
    v494 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
    int v495 = [v494 isEqualToString:@"ptbutton"];

    if (v495)
    {
      v496 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
      BOOL v497 = isNumber(v496);

      if (v497)
      {
        v498 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
        int v499 = [v498 isEqualToString:@"u"];

        v500 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
        int v501 = [v500 isEqualToString:@"d"];

        if ((v499 | v501))
        {
          v502 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
          uint64_t v503 = [v502 integerValue];

          if (v501) {
            [v553 pointerBeginPressingButton:v503];
          }
          else {
            [v553 pointerEndPressingButton:v503];
          }
LABEL_373:
          uint64_t v25 = [(CLIArguments *)v552 consumeUpToIndex:3];
          goto LABEL_16;
        }
        v62 = (FILE *)*MEMORY[0x1E4F143C8];
        v63 = "Please specify u/d for up/down.\n";
      }
      else
      {
        v62 = (FILE *)*MEMORY[0x1E4F143C8];
        v63 = "Please specify a button number.\n";
      }
      size_t v64 = 32;
      goto LABEL_36;
    }
    v504 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
    int v505 = [v504 isEqualToString:@"ptgesture"];

    if (!v505)
    {
      v534 = (FILE *)*MEMORY[0x1E4F143C8];
      id v535 = [(CLIArguments *)v552 objectAtIndexedSubscript:0];
      fprintf(v534, "Unrecognized command: %s\nExamples: recap -c t 100 100 or recap -c t 100 150 f 100 250 0.25 or recap -c b hw\n", (const char *)[v535 UTF8String]);

      goto LABEL_37;
    }
    v214 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v506 = 1;
    while (1)
    {
      v507 = [(CLIArguments *)v552 objectAtIndexedSubscript:v506];
      int v508 = [v507 isEqualToString:@"rotation"];

      if (v508) {
        break;
      }
      v515 = [(CLIArguments *)v552 objectAtIndexedSubscript:v506];
      int v516 = [v515 isEqualToString:@"translation"];

      if (!v516)
      {
        v527 = [(CLIArguments *)v552 objectAtIndexedSubscript:v506];
        int v528 = [v527 isEqualToString:@"scale"];

        if (!v528)
        {
          if ([v214 count])
          {
            v536 = [(CLIArguments *)v552 objectAtIndexedSubscript:v506];
            BOOL v537 = isNumber(v536);

            if (v537)
            {
              v538 = [(CLIArguments *)v552 objectAtIndexedSubscript:v506];
              [v538 floatValue];
              float v540 = v539;

              v541 = [(CLIArguments *)v552 objectAtIndexedSubscript:v506 + 1];
              double v542 = v540;
              BOOL v543 = isNumber(v541);

              if (v543)
              {
                v544 = [(CLIArguments *)v552 objectAtIndexedSubscript:v506 + 1];
                double v545 = (double)[v544 integerValue];

                v506 += 2;
                uint64_t v546 = (uint64_t)v545;
              }
              else
              {
                uint64_t v546 = 1;
                ++v506;
              }
            }
            else
            {
              double v542 = 1.0;
              uint64_t v546 = 1;
            }
            [v553 pointerDiscreteGesture:v214 duration:v546 frequency:v542];
            uint64_t v295 = [(CLIArguments *)v552 consumeUpToIndex:v506];
            goto LABEL_178;
          }
          v265 = (FILE *)*MEMORY[0x1E4F143C8];
          v266 = "Please specify a gesture.\n";
          size_t v267 = 26;
LABEL_154:
          fwrite(v266, v267, 1uLL, v265);
          uint64_t v26 = 0;
LABEL_179:

          goto LABEL_44;
        }
        v529 = [(CLIArguments *)v552 objectAtIndexedSubscript:v506 + 1];
        BOOL v530 = isNumberIncludingNegatives(v529);

        if (!v530)
        {
          v265 = (FILE *)*MEMORY[0x1E4F143C8];
          v266 = "Please specify a scale value.\n";
          size_t v267 = 30;
          goto LABEL_154;
        }
        v531 = [(CLIArguments *)v552 objectAtIndexedSubscript:v506 + 1];
        [v531 floatValue];
        double v533 = v532;

        uint64_t v514 = +[RCPDiscreteGestureSpec scaleZ:v533];
        goto LABEL_362;
      }
      v517 = [(CLIArguments *)v552 objectAtIndexedSubscript:v506 + 1];
      if (!isNumberIncludingNegatives(v517))
      {

LABEL_375:
        v265 = (FILE *)*MEMORY[0x1E4F143C8];
        v266 = "Please specify translation values.\n";
        size_t v267 = 35;
        goto LABEL_154;
      }
      v518 = [(CLIArguments *)v552 objectAtIndexedSubscript:v506 + 1];
      BOOL v519 = isNumberIncludingNegatives(v518);

      if (!v519) {
        goto LABEL_375;
      }
      v520 = [(CLIArguments *)v552 objectAtIndexedSubscript:v506 + 1];
      [v520 floatValue];
      float v522 = v521;

      v523 = [(CLIArguments *)v552 objectAtIndexedSubscript:v506 + 2];
      [v523 floatValue];
      double v525 = v524;

      v526 = +[RCPDiscreteGestureSpec translation:](RCPDiscreteGestureSpec, "translation:", v522, v525);
      v506 += 3;
LABEL_363:
      [v214 addObject:v526];
    }
    v509 = [(CLIArguments *)v552 objectAtIndexedSubscript:v506 + 1];
    BOOL v510 = isNumberIncludingNegatives(v509);

    if (!v510)
    {
      v265 = (FILE *)*MEMORY[0x1E4F143C8];
      v266 = "Please specify a rotation value.\n";
      size_t v267 = 33;
      goto LABEL_154;
    }
    v511 = [(CLIArguments *)v552 objectAtIndexedSubscript:v506 + 1];
    [v511 floatValue];
    double v513 = v512;

    uint64_t v514 = +[RCPDiscreteGestureSpec rotationZ:v513];
LABEL_362:
    v526 = (void *)v514;
    v506 += 2;
    goto LABEL_363;
  }
  v547 = [(CLIArguments *)v552 objectAtIndexedSubscript:1];
  v351 = objc_opt_new();
  v352 = objc_opt_new();
  [v547 componentsSeparatedByString:@"/"];
  long long v556 = 0u;
  long long v557 = 0u;
  long long v554 = 0u;
  long long v555 = 0u;
  id obja = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v353 = [obja countByEnumeratingWithState:&v554 objects:v567 count:16];
  if (!v353) {
    goto LABEL_225;
  }
  uint64_t v354 = *(void *)v555;
  while (2)
  {
    for (uint64_t j = 0; j != v353; ++j)
    {
      if (*(void *)v555 != v354) {
        objc_enumerationMutation(obja);
      }
      uint64_t v356 = *(void *)(*((void *)&v554 + 1) + 8 * j);
      LODWORD(v562[0]) = 0;
      LODWORD(v563) = 0;
      v357 = [MEMORY[0x1E4F28FE8] scannerWithString:v356];
      if (([v357 scanHexInt:v562] & 1) == 0)
      {
        v425 = (FILE *)*MEMORY[0x1E4F143C8];
        v426 = "Please specify a valid usage page in hex.\n";
        size_t v427 = 42;
LABEL_275:
        fwrite(v426, v427, 1uLL, v425);

        goto LABEL_276;
      }
      if (([v357 scanString:@"," intoString:0] & 1) == 0)
      {
        v425 = (FILE *)*MEMORY[0x1E4F143C8];
        v426 = "Missing comma separator.\n";
        size_t v427 = 25;
        goto LABEL_275;
      }
      if (([v357 scanHexInt:&v563] & 1) == 0)
      {
        v425 = (FILE *)*MEMORY[0x1E4F143C8];
        v426 = "Please specify a valid usage in hex.\n";
        size_t v427 = 37;
        goto LABEL_275;
      }
      v358 = [NSNumber numberWithUnsignedInt:LODWORD(v562[0])];
      [v351 addObject:v358];

      v359 = [NSNumber numberWithUnsignedInt:v563];
      [v352 addObject:v359];
    }
    uint64_t v353 = [obja countByEnumeratingWithState:&v554 objects:v567 count:16];
    if (v353) {
      continue;
    }
    break;
  }
LABEL_225:

  if ([v351 count])
  {
    v360 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
    BOOL v361 = isNumber(v360);

    if (v361)
    {
      v362 = [(CLIArguments *)v552 objectAtIndexedSubscript:2];
      [v362 doubleValue];
      double v364 = v363;

      uint64_t v365 = 3;
    }
    else
    {
      uint64_t v365 = 2;
      double v364 = 0.12;
    }
    [v553 pressButtonsWithPages:v351 usages:v352 duration:v364];
    uint64_t v26 = [(CLIArguments *)v552 consumeUpToIndex:v365];
  }
  else
  {
    fwrite("Please specify one or more usage pairs.\n", 0x28uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
LABEL_276:
    uint64_t v26 = 0;
  }

LABEL_44:
  return v26;
}

void sub_1A906B78C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

BOOL isNumber(void *a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = (void *)MEMORY[0x1E4F28B88];
  id v2 = a1;
  id v3 = [v1 characterSetWithCharactersInString:@"0123456789."];
  uint64_t v4 = [v2 stringByTrimmingCharactersInSet:v3];

  BOOL v5 = [v4 length] == 0;
  return v5;
}

BOOL isNegativeNumber(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1 && [v1 hasPrefix:@"-"])
  {
    id v3 = [v2 substringFromIndex:1];
    uint64_t v4 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789."];
    BOOL v5 = [v3 stringByTrimmingCharactersInSet:v4];
    BOOL v6 = [v5 length] == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

BOOL isNumberIncludingNegatives(void *a1)
{
  id v1 = a1;
  BOOL v2 = isNegativeNumber(v1) || isNumber(v1);

  return v2;
}

id parseMultitouchCommandFromArgumentString(void *a1, void *a2)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  char v72 = 0;
  int v71 = 0;
  memset(v78, 0, sizeof(v78));
  uint64_t v77 = 0;
  memset(v76, 0, sizeof(v76));
  uint64_t v75 = 0;
  memset(v74, 0, sizeof(v74));
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __parseMultitouchCommandFromArgumentString_block_invoke;
  v69[3] = &unk_1E5D774A0;
  id v63 = v4;
  id v70 = v63;
  BOOL v5 = (void (**)(void, void, void, void, void, double))MEMORY[0x1AD0ECCD0](v69);
  if (![v3 count])
  {
    char v12 = 0;
    unint64_t v13 = 0;
LABEL_53:
    objc_msgSend(v63, "advanceTime:", 1.0 / (double)objc_msgSend(v63, "touchFrequency"));
    [v63 liftUpAtAllActivePoints];
    id v54 = v3;
    if ([v54 count] <= v13)
    {
      v55 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v55 = objc_msgSend(v54, "subarrayWithRange:", v13, objc_msgSend(v54, "count") - v13);
    }

    id v3 = v55;
    v53 = v3;
    goto LABEL_57;
  }
  BOOL v6 = 0;
  unint64_t v7 = 0;
  uint64_t v8 = 0;
  char v9 = 0;
  uint64_t v10 = 0;
  double v11 = 0.2;
  while (1)
  {
    char v12 = [v3 objectAtIndexedSubscript:v7];

    unint64_t v13 = v7 + 1;
    if (!v12 || ![v12 length])
    {
LABEL_49:
      if ((v9 & 1) == 0) {
        goto LABEL_53;
      }
      goto LABEL_50;
    }
    if ([v12 characterAtIndex:0] == 91) {
      break;
    }
    if (!isNumber(v12))
    {
      unint64_t v13 = v7;
      if ((v9 & 1) == 0) {
        goto LABEL_53;
      }
LABEL_50:
      ((void (**)(void, uint64_t, _OWORD *, _OWORD *, _OWORD *, double))v5)[2](v5, v10, v78, v76, v74, v11);
      goto LABEL_53;
    }
    [v12 floatValue];
    double v11 = v18;
LABEL_48:
    BOOL v6 = v12;
    unint64_t v7 = v13;
    if (v13 >= [v3 count]) {
      goto LABEL_49;
    }
  }
  uint64_t v61 = v8;
  if (v9) {
    ((void (**)(void, uint64_t, _OWORD *, _OWORD *, _OWORD *, double))v5)[2](v5, v10, v78, v76, v74, v11);
  }
  int v14 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  unsigned int v15 = [v12 stringByTrimmingCharactersInSet:v14];
  char v16 = [v15 isEqualToString:@"[]"];

  if (v16)
  {
    BOOL v17 = 0;
LABEL_20:
    unint64_t v60 = v13;
    v62 = objc_opt_new();
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v26 = v17;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v65 objects:v73 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      unint64_t v57 = v12;
      v58 = v5;
      id v59 = v3;
      uint64_t v10 = 0;
      uint64_t v29 = 0;
      uint64_t v30 = *(void *)v66;
      do
      {
        uint64_t v31 = 0;
        v32 = (char *)&v71 + v29;
        do
        {
          if (*(void *)v66 != v30) {
            objc_enumerationMutation(v26);
          }
          uint64_t v33 = *(void **)(*((void *)&v65 + 1) + 8 * v31);
          BOOL v34 = objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceCharacterSet", v57, v58, v59);
          v35 = [v33 stringByTrimmingCharactersInSet:v34];
          float v36 = [v35 componentsSeparatedByString:@" "];

          if ((unint64_t)[v36 count] <= 1 && v32[v31])
          {
            double v37 = [NSNumber numberWithInteger:v29 + v31];
            [v62 addObject:v37];

            v32[v31] = 0;
          }
          else
          {
            long long v64 = 0uLL;
            uint64_t v38 = [v36 objectAtIndexedSubscript:0];
            [v38 floatValue];
            double v40 = v39;
            v41 = [v36 objectAtIndexedSubscript:1];
            [v41 floatValue];
            *(double *)&long long v64 = v40;
            *((double *)&v64 + 1) = v42;

            if ((unint64_t)[v36 count] <= 2)
            {
              [v63 defaultPressure];
              double v45 = v46;
            }
            else
            {
              v43 = [v36 objectAtIndexedSubscript:2];
              [v43 floatValue];
              double v45 = v44;
            }
            if ([v36 count] == 4)
            {
              v47 = [v36 objectAtIndexedSubscript:3];
              [v47 floatValue];
              double v49 = v48;
            }
            else
            {
              [v63 defaultRadius];
              double v49 = v50;
            }
            if (!v32[v31])
            {
              [v63 touchDownAtPoints:&v64 touchCount:1 pressure:v45 radius:v49];
              v32[v31] = 1;
            }
            v78[v10] = v64;
            *((double *)v76 + v10) = v45;
            *((double *)v74 + v10++) = v49;
          }

          ++v31;
        }
        while (v28 != v31);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v65 objects:v73 count:16];
        v29 += v31;
      }
      while (v28);
      BOOL v5 = v58;
      id v3 = v59;
      char v12 = v57;
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v29 = 0;
    }

    uint64_t v51 = v29;
    if (v29 < v61)
    {
      do
      {
        if (*((unsigned char *)&v71 + v51))
        {
          v52 = [NSNumber numberWithInteger:v51];
          [v62 addObject:v52];

          *((unsigned char *)&v71 + v51) = 0;
        }
        ++v51;
      }
      while (v61 != v51);
    }
    if ([v62 count]) {
      [v63 liftUpActivePointsByIndex:v62];
    }

    char v9 = 1;
    double v11 = 0.2;
    uint64_t v8 = v29;
    unint64_t v13 = v60;
    goto LABEL_48;
  }
  char v19 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v20 = [v12 substringFromIndex:1];
  int v21 = [v19 arrayWithObject:v20];

  if (v13 < [v3 count])
  {
    unint64_t v13 = v7 + 2;
    do
    {
      uint64_t v22 = v12;
      char v12 = [v3 objectAtIndexedSubscript:v13 - 1];

      if (!v12) {
        break;
      }
      if (objc_msgSend(v12, "characterAtIndex:", objc_msgSend(v12, "length") - 1) == 93)
      {
        id v24 = objc_msgSend(v12, "substringToIndex:", objc_msgSend(v12, "length") - 1);
        [v21 addObject:v24];

        uint64_t v25 = [v21 componentsJoinedByString:@" "];
        BOOL v17 = [v25 componentsSeparatedByString:@","];

        goto LABEL_20;
      }
      [v21 addObject:v12];
    }
    while (v13++ < [v3 count]);
  }

  v53 = 0;
LABEL_57:

  return v53;
}

void __parseCommandFromCLIArguments_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([*(id *)(a1 + 32) rangeOfString:a2] != 0x7FFFFFFFFFFFFFFFLL) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

BOOL isHexadecimal(void *a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = (void *)MEMORY[0x1E4F28B88];
  id v2 = a1;
  id v3 = [v1 characterSetWithCharactersInString:@"0123456789ABCDEF"];
  id v4 = [v2 stringByTrimmingCharactersInSet:v3];

  BOOL v5 = [v4 length] == 0;
  return v5;
}

void __propertiesForSenderString_block_invoke()
{
  v14[11] = *MEMORY[0x1E4F143B8];
  v13[0] = @"mouse";
  char v12 = [MEMORY[0x1E4F29238] valueWithPointer:sel_mouseSender];
  v14[0] = v12;
  v13[1] = @"trackpad";
  unint64_t v0 = [MEMORY[0x1E4F29238] valueWithPointer:sel_trackpadSender];
  v14[1] = v0;
  v13[2] = @"pencil";
  id v1 = [MEMORY[0x1E4F29238] valueWithPointer:sel_pencilDigitizerSender];
  v14[2] = v1;
  v13[3] = @"touchscreen";
  id v2 = [MEMORY[0x1E4F29238] valueWithPointer:sel_touchScreenDigitizerSender];
  v14[3] = v2;
  v13[4] = @"gamepad";
  id v3 = [MEMORY[0x1E4F29238] valueWithPointer:sel_gamepadSender];
  v14[4] = v3;
  v13[5] = @"keyboard";
  id v4 = [MEMORY[0x1E4F29238] valueWithPointer:sel_keyboardSender];
  v14[5] = v4;
  v13[6] = @"tvremote";
  BOOL v5 = [MEMORY[0x1E4F29238] valueWithPointer:sel_tvRemoteSender];
  v14[6] = v5;
  v13[7] = @"naturalinput";
  BOOL v6 = [MEMORY[0x1E4F29238] valueWithPointer:sel_naturalInputCollectionSender];
  v14[7] = v6;
  v13[8] = @"globalposition";
  unint64_t v7 = [MEMORY[0x1E4F29238] valueWithPointer:sel_globalPositionSender];
  v14[8] = v7;
  v13[9] = @"crown";
  uint64_t v8 = [MEMORY[0x1E4F29238] valueWithPointer:sel_crownSender];
  v14[9] = v8;
  v13[10] = @"phone";
  char v9 = [MEMORY[0x1E4F29238] valueWithPointer:sel_phoneButtonSender];
  v14[10] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:11];
  double v11 = (void *)propertiesForSenderString_propertyMap;
  propertiesForSenderString_propertyMap = v10;
}

Class __getTypistHWKeyboardClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!TypistFrameworkLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __TypistFrameworkLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5D77480;
    uint64_t v5 = 0;
    TypistFrameworkLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!TypistFrameworkLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getTypistHWKeyboardClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("TypistHWKeyboard");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getTypistHWKeyboardClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __TypistFrameworkLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TypistFrameworkLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __parseMultitouchCommandFromArgumentString_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double *a4, double *a5, double a6)
{
  uint64_t v6 = *(void **)(a1 + 32);
  if (a2 < 1) {
    return [v6 advanceTime:a6];
  }
  else {
    return [v6 moveToPoints:a3 touchCount:a2 pressure:*a4 duration:a6 radius:*a5];
  }
}

void __getFBSOrientationObserverClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  RCPMachTimestampFromTimeInterval_cold_1(v0);
}

void RCPMachTimestampFromTimeInterval_cold_1()
{
  __assert_rtn("RCPMachTimestampFromTimeInterval", "RCPMachTime.m", 31, "0 <= timeInterval");
}

void __getTypistHWKeyboardClass_block_invoke_cold_1()
{
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t BKSDisplayServicesGetExternalDisplayScale()
{
  return MEMORY[0x1F410BE08]();
}

uint64_t BKSDisplayServicesGetMainScreenInfo()
{
  return MEMORY[0x1F410BE10]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D9988](color, alpha);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

CGPoint CGPathGetCurrentPoint(CGPathRef path)
{
  MEMORY[0x1F40DB0D8](path);
  result.y = v2;
  result.x = v1;
  return result;
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return MEMORY[0x1F40DB120](path);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB4C8]((__n128)size, *(__n128 *)&size.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x1F40DB4E0](dict, size);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

uint64_t IOHIDEventAppendEvent()
{
  return MEMORY[0x1F40E88D8]();
}

uint64_t IOHIDEventCreate()
{
  return MEMORY[0x1F40E88E8]();
}

uint64_t IOHIDEventCreateCopy()
{
  return MEMORY[0x1F40E8900]();
}

uint64_t IOHIDEventCreateData()
{
  return MEMORY[0x1F40E8908]();
}

uint64_t IOHIDEventCreateDigitizerEvent()
{
  return MEMORY[0x1F40E8910]();
}

uint64_t IOHIDEventCreateDigitizerFingerEvent()
{
  return MEMORY[0x1F40E8918]();
}

uint64_t IOHIDEventCreateDigitizerStylusEventWithPolarOrientation()
{
  return MEMORY[0x1F40E8928]();
}

uint64_t IOHIDEventCreateForceStageEvent()
{
  return MEMORY[0x1F40E8930]();
}

uint64_t IOHIDEventCreateGameControllerEvent()
{
  return MEMORY[0x1F40E8938]();
}

uint64_t IOHIDEventCreateGenericGestureEvent()
{
  return MEMORY[0x1F40E8940]();
}

uint64_t IOHIDEventCreateKeyboardEvent()
{
  return MEMORY[0x1F40E8948]();
}

uint64_t IOHIDEventCreateRelativePointerEvent()
{
  return MEMORY[0x1F40E8960]();
}

uint64_t IOHIDEventCreateRotationEvent()
{
  return MEMORY[0x1F40E8968]();
}

uint64_t IOHIDEventCreateScaleEvent()
{
  return MEMORY[0x1F40E8970]();
}

uint64_t IOHIDEventCreateScrollEvent()
{
  return MEMORY[0x1F40E8978]();
}

uint64_t IOHIDEventCreateTouchSensitiveButtonEventWithRadius()
{
  return MEMORY[0x1F40E8988]();
}

uint64_t IOHIDEventCreateTranslationEvent()
{
  return MEMORY[0x1F40E8990]();
}

uint64_t IOHIDEventCreateUnicodeEvent()
{
  return MEMORY[0x1F40E8998]();
}

uint64_t IOHIDEventCreateVendorDefinedEvent()
{
  return MEMORY[0x1F40E89A0]();
}

uint64_t IOHIDEventCreateWithData()
{
  return MEMORY[0x1F40E89B0]();
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x1F40E89C8]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x1F40E89F8]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1F40E8A00]();
}

uint64_t IOHIDEventGetSenderID()
{
  return MEMORY[0x1F40E8A20]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x1F40E8A28]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x1F40E8A38]();
}

uint64_t IOHIDEventSetAttributeData()
{
  return MEMORY[0x1F40E8A60]();
}

uint64_t IOHIDEventSetDoubleValue()
{
  return MEMORY[0x1F40E8A68]();
}

uint64_t IOHIDEventSetFloatValue()
{
  return MEMORY[0x1F40E8A78]();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return MEMORY[0x1F40E8A80]();
}

uint64_t IOHIDEventSetPhase()
{
  return MEMORY[0x1F40E8A88]();
}

uint64_t IOHIDEventSetSenderID()
{
  return MEMORY[0x1F40E8A90]();
}

uint64_t IOHIDEventSetTimeStamp()
{
  return MEMORY[0x1F40E8A98]();
}

uint64_t IOHIDEventSystemClientCreate()
{
  return MEMORY[0x1F40E8AC0]();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return MEMORY[0x1F40E8AF0]();
}

uint64_t IOHIDEventSystemClientScheduleWithRunLoop()
{
  return MEMORY[0x1F40E8B20]();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return MEMORY[0x1F40E8B40]();
}

uint64_t IOHIDEventSystemClientUnregisterEventCallback()
{
  return MEMORY[0x1F40E8B68]();
}

uint64_t IOHIDEventSystemClientUnscheduleWithRunLoop()
{
  return MEMORY[0x1F40E8B90]();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E8D20](service, key);
}

CFTypeRef IOHIDServiceClientGetRegistryID(IOHIDServiceClientRef service)
{
  return (CFTypeRef)MEMORY[0x1F40E8D40](service);
}

CFTypeID IOHIDServiceClientGetTypeID(void)
{
  return MEMORY[0x1F40E8D48]();
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x1F40E9328](aSurface);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9560](xobj);
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1F417CDE8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4102C40]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1F4102C78](image, compressionQuality);
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x1F41788E8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UICreateCGImageFromIOSurfaceWithOptions()
{
  return MEMORY[0x1F4102ED8]();
}

uint64_t _UIRenderDisplay()
{
  return MEMORY[0x1F4102F30]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1F410C6F0]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void exit(int a1)
{
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1F40CC1F0](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1F40CCA58]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return MEMORY[0x1F40CCEA0](__rqtp, __rmtp);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

uint64_t proc_setthread_cpupercent()
{
  return MEMORY[0x1F40CD8F0]();
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x1F40CDA18](a1, a2, a3);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x1F40CDB68](a1, *(void *)&a2, a3);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1F40CE030](*(void *)&a1, a2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1F40CE540](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEAA8](xarray, index);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CED90](bytes, length);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEE68](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF320](value);
}