void sub_2150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _appTransitionOccurred()
{
  if (operator||)
  {
    v0 = (void *)ZOTSharedWorkspace;
    id v1 = [(id)ZOTSharedWorkspace threadKey];
    [v0 performSelector:"_handleApplicationActivated" withThreadKey:v1 count:0 objects:0];
  }
}

id _voiceOverEnabled()
{
  return [(id)ZOTSharedWorkspace _voiceOverEnabled];
}

void sub_2EF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

id ___accessibilityEventTapCallback_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFollowsKeyboardFocus:0];
}

id LocString(void *a1)
{
  id v1 = a1;
  v2 = +[NSBundle bundleWithIdentifier:@"com.apple.ZoomTouch.axbundle"];
  uint64_t v3 = [v2 localizedStringForKey:v1 value:v1 table:@"ZoomStrings"];

  return v3;
}

uint64_t ZOTInitializeUtilities()
{
  uint64_t result = AXDeviceIsPad();
  ZOTIsWildcat = result;
  return result;
}

uint64_t ZOTTimeSinceBoot()
{
  v0 = +[NSDate date];
  [v0 timeIntervalSince1970];
  uint64_t v2 = (uint64_t)v1 - ZOTSystemBootTime();

  return v2;
}

uint64_t ZOTSystemBootTime()
{
  uint64_t result = ZOTSystemBootTime___boottime;
  if (!ZOTSystemBootTime___boottime)
  {
    int v4 = 0;
    v2[1] = 0;
    *(void *)uint64_t v3 = 0x1500000001;
    size_t v1 = 16;
    v2[0] = 0;
    if (sysctl(v3, 2u, v2, &v1, 0, 0) == -1) {
      uint64_t result = 0;
    }
    else {
      uint64_t result = v2[0];
    }
    ZOTSystemBootTime___boottime = result;
  }
  return result;
}

void ZOTSetUnitTestScaleFactor(double a1)
{
  ZOTUnitTestScaleFactor = *(void *)&a1;
}

double ZOTMainScreenScaleFactor()
{
  double result = *(double *)&ZOTUnitTestScaleFactor;
  if (*(double *)&ZOTUnitTestScaleFactor <= 0.0)
  {
    uint64_t v1 = ZOTTimeSinceBoot();
    double result = 1.0;
    if (v1 >= 60)
    {
      if (ZOTMainScreenScaleFactor_onceToken != -1) {
        dispatch_once(&ZOTMainScreenScaleFactor_onceToken, &__block_literal_global_0);
      }
      return *(double *)&ZOTMainScreenScaleFactor_kZOTMainScreenScaleFactor;
    }
  }
  return result;
}

void ZOTUpdateDeviceOrientation()
{
}

id ZOTEventMeetsOrbThreshold(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 handInfo];
  uint64_t v3 = [v2 paths];
  int v4 = [v3 firstPath];
  [v4 orbValue];
  double v6 = v5;
  AXForceTouchThresholdPeek();
  if (v7 < v6 && ZOTEventRealFingerCount(v1) == 1 && AXForceTouchAvailableAndEnabled())
  {
    v8 = +[AXSettings sharedInstance];
    id v9 = [v8 zoomPeekZoomEnabled];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t ZOTEventRealFingerCount(void *a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = objc_msgSend(a1, "handInfo", 0);
  uint64_t v2 = [v1 paths];

  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) pathIdentity]) {
          ++v5;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

double ZOTFlipDenormalizedPoint(double a1)
{
  return a1;
}

void ZOTDispatchEventThreadWithDelay(void *a1, void *a2, float a3)
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __ZOTDispatchEventThreadWithDelay_block_invoke;
  v9[3] = &unk_84A8;
  id v10 = a1;
  id v11 = a2;
  float v12 = a3;
  id v5 = v11;
  id v6 = v10;
  double v7 = objc_retainBlock(v9);
  id v8 = [v7 copy];
  [v6 performSelector:"zotRunBlock:" onThread:v6 withObject:v8 waitUntilDone:0];
}

void __ZOTDispatchEventThreadWithDelay_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) copy];
  [v2 performSelector:"zotRunBlock:" withObject:v3 afterDelay:*(float *)(a1 + 48)];
}

void ZOTDispatchEventThread(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 copy];
  [v3 performSelector:"zotRunBlock:" onThread:v3 withObject:v4 waitUntilDone:0];
}

double ZOTNormalizeValue(double a1)
{
  ZOTMainScreenSize();
  return a1 / v2;
}

double ZOTDenormalizeValue(double a1)
{
  ZOTMainScreenSize();
  return v2 * a1;
}

double ZOTNormalizePoint(double a1)
{
  ZOTMainScreenSize();
  return a1 / v2;
}

double ZOTDenormalizePoint(double a1)
{
  ZOTMainScreenSize();
  return a1 * v2;
}

double ZOTConvertVectorToScreenStandard(uint64_t a1, double a2)
{
  double v2 = 180.0;
  float v3 = a2 * 3.14159265 / 180.0;
  double result = v3 / 0.0174532925;
  switch(a1)
  {
    case 4:
      double v2 = 270.0;
      goto LABEL_7;
    case 3:
      double v2 = 90.0;
      goto LABEL_7;
    case 2:
LABEL_7:
      double result = result + v2;
      break;
  }
  double v5 = 360.0;
  if (result <= 360.0)
  {
    if (result >= 0.0) {
      return result;
    }
  }
  else
  {
    double v5 = -360.0;
  }
  return result + v5;
}

double ZOTAlignDistanceAlongAngle(double result, double a2, double a3)
{
  if (a3 >= 45.0)
  {
    double v3 = 90.0;
    if (a3 < 90.0)
    {
LABEL_3:
      double v4 = (v3 - a3) / 45.0;
      return result * v4;
    }
    double v5 = 135.0;
    if (a3 < 135.0) {
      goto LABEL_5;
    }
    if (a3 >= 180.0 && a3 >= 225.0)
    {
      double v3 = 270.0;
      if (a3 < 270.0) {
        goto LABEL_3;
      }
      double v5 = 315.0;
      if (a3 < 315.0)
      {
LABEL_5:
        double v4 = (v5 - a3) / -45.0 + 1.0;
        return result * v4;
      }
    }
  }
  return result;
}

double ZOTCalculateDistanceForAngle(double a1)
{
  ZOTMainScreenSize();
  double v3 = v2 / ZOTMainScreenScaleFactor();
  if (a1 >= 90.0)
  {
    if (a1 >= 180.0)
    {
      if (a1 >= 270.0) {
        double v4 = -v3;
      }
      else {
        double v4 = v3;
      }
      double v3 = -v3;
    }
    else
    {
      double v4 = v3;
    }
  }
  else
  {
    double v4 = -v3;
  }

  return ZOTAlignDistanceAlongAngle(v4, v3, a1);
}

double ZOTNormalizeVelocity(double a1)
{
  double v1 = 2300.0;
  if (a1 <= 2300.0)
  {
    double v1 = a1;
    if (a1 < 125.0) {
      double v1 = 125.0;
    }
  }
  return v1 / 2175.0;
}

void ZOTDistanceForTimeAndVelocityWithMaxDistance(double a1)
{
}

void ZOTSetGutterDistanceForUnitTests(double a1)
{
  _UnitTestGutterDistance = *(void *)&a1;
}

float ZOTGutterDistance()
{
  uint64_t v0 = _UnitTestGutterDistance;
  if (*(double *)&_UnitTestGutterDistance <= 0.0)
  {
    if (ZOTGutterDistance_onceToken != -1) {
      dispatch_once(&ZOTGutterDistance_onceToken, &__block_literal_global_287);
    }
    uint64_t v0 = ZOTGutterDistance__GutterDistance;
  }
  return *(double *)&v0;
}

double ZOTNotGutterFrame()
{
  if (ZOTNotGutterFrame_onceToken != -1) {
    dispatch_once(&ZOTNotGutterFrame_onceToken, &__block_literal_global_289);
  }
  return *(double *)&ZOTNotGutterFrame_nonGutterFrame_0;
}

uint64_t ZOTShouldStartAutopan(double *a1, BOOL *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14)
{
  BOOL v24 = a5 != 0.0 && a8 > 1.0;
  if (v24 && !*a2)
  {
    double v26 = 0.0;
  }
  else
  {
    SCRCMathGetDistanceBetweenPoints();
    if (!ZOTIsWildcat)
    {
      uint64_t result = 0;
      *a2 = 0;
      return result;
    }
    double v26 = v25;
    BOOL v27 = CGPointZero.x != a6;
    if (CGPointZero.y != a7) {
      BOOL v27 = 1;
    }
    if (v25 <= 0.0700000003) {
      BOOL v27 = 0;
    }
    *a2 = v27;
    if (!v27) {
      return 0;
    }
  }
  int v29 = _AXSVoiceOverTouchEnabled();
  float v30 = ZOTGutterDistance();
  if (v29) {
    float v30 = v30 / 3.0;
  }
  double v31 = v30 / ZOTMainScreenScaleFactor();
  if (a3 >= a11 + v31)
  {
    if (a3 <= a11 + a13 - v31)
    {
      uint64_t v36 = 0;
      double v35 = 0.0;
      goto LABEL_27;
    }
    double v32 = a11 + a13 - a3;
  }
  else
  {
    double v32 = a3 - a11;
  }
  double v33 = ZOTGutterDistance();
  if (ZOTIsWildcat) {
    double v34 = pow(v32 / v33, -1.2) * 1.5 / 10.0;
  }
  else {
    double v34 = (v33 - v32) / v33;
  }
  double v35 = (v34 + 0.0) * ZOTMainScreenScaleFactor() + 0.0;
  uint64_t v36 = 1;
LABEL_27:
  if (a4 >= a12 + v31)
  {
    if (a4 <= a12 + a14 - v31) {
      goto LABEL_35;
    }
    double v37 = a12 + a14 - a4;
  }
  else
  {
    double v37 = a4 - a12;
  }
  double v38 = ZOTGutterDistance();
  if (ZOTIsWildcat) {
    double v39 = pow(v37 / v38, -1.2) * 1.5 / 10.0;
  }
  else {
    double v39 = (v38 - v37) / v38;
  }
  double v35 = v35 + (v39 + 0.0) * ZOTMainScreenScaleFactor();
  ++v36;
LABEL_35:
  if (*a2)
  {
    double v40 = v26 + -0.0700000003;
    if (v26 > 0.899999976) {
      double v40 = 0.819999976;
    }
    long double v41 = pow(v40, 3.0) * 1000.0;
    double v35 = v41 * ZOTMainScreenScaleFactor();
    ++v36;
  }
  else if (!v36)
  {
    uint64_t result = 0;
    double v42 = 0.0;
    goto LABEL_41;
  }
  double v42 = v35 / (double)v36;
  uint64_t result = 1;
LABEL_41:
  *a1 = v42;
  return result;
}

uint64_t ZOTScreenRegionForPoint(int a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double v13 = 0.0;
  if (a1)
  {
    double v14 = ZOTGutterDistance();
    float v15 = v14 / ZOTMainScreenScaleFactor();
    double v13 = v15;
  }
  if (a2 >= a4 + a6 - v13) {
    unsigned int v16 = 2;
  }
  else {
    unsigned int v16 = 0;
  }
  if (a2 > a4 + v13) {
    uint64_t result = v16;
  }
  else {
    uint64_t result = 1;
  }
  if (a3 <= a5 + v13) {
    return result | 4;
  }
  if (a3 >= a5 + a7 - v13) {
    return result | 8;
  }
  return result;
}

uint64_t ZOTScreenRegionForRelativePushPan(uint64_t a1)
{
  SCRCMathGetVectorAndDistanceForPoints();
  switch(a1)
  {
    case 4:
      double v2 = 0.0;
      double v3 = 90.0;
LABEL_8:
      double v2 = v2 + v3;
      goto LABEL_10;
    case 3:
      double v2 = 0.0;
      double v3 = -90.0;
      goto LABEL_8;
    case 2:
      double v2 = 0.0 + -180.0;
      if (0.0 + -180.0 >= 0.0) {
        goto LABEL_10;
      }
      double v3 = 360.0;
      goto LABEL_8;
  }
  double v2 = 0.0;
LABEL_10:
  double v4 = 360.0;
  if (v2 < 0.0)
  {
LABEL_13:
    double v2 = v2 + v4;
    goto LABEL_14;
  }
  if (v2 > 360.0)
  {
    double v4 = -360.0;
    goto LABEL_13;
  }
LABEL_14:
  if (v2 >= 0.0 && v2 <= 90.0)
  {
    if (v2 < 35.0)
    {
      uint64_t result = 4;
LABEL_26:
      BOOL v9 = 1;
      goto LABEL_27;
    }
    BOOL v6 = v2 <= 55.0;
    unsigned int v7 = 6;
    unsigned int v8 = 2;
LABEL_23:
    if (v6) {
      uint64_t result = v7;
    }
    else {
      uint64_t result = v8;
    }
    goto LABEL_26;
  }
  if (v2 <= 90.0 || v2 > 180.0)
  {
    if (v2 <= 180.0 || v2 > 270.0)
    {
      uint64_t result = 0;
      BOOL v9 = 1;
      if (v2 > 270.0 && v2 <= 360.0)
      {
        if (v2 >= 305.0)
        {
          BOOL v6 = v2 <= 325.0;
          unsigned int v7 = 5;
          unsigned int v8 = 4;
          goto LABEL_23;
        }
        BOOL v9 = 1;
        uint64_t result = 1;
      }
    }
    else if (v2 >= 215.0)
    {
      BOOL v9 = v2 > 235.0;
      if (v2 > 235.0) {
        uint64_t result = 1;
      }
      else {
        uint64_t result = 9;
      }
    }
    else
    {
      BOOL v9 = 0;
      uint64_t result = 8;
    }
  }
  else
  {
    if (v2 < 125.0)
    {
      uint64_t result = 2;
      goto LABEL_26;
    }
    BOOL v9 = 0;
    if (v2 <= 145.0) {
      uint64_t result = 10;
    }
    else {
      uint64_t result = 8;
    }
  }
LABEL_27:
  if (ZOTIsWildcat)
  {
    if (a1 == 4)
    {
      if (v9) {
        int v13 = ((result >> 1) | (2 * result)) & 9;
      }
      else {
        int v13 = ((result >> 1) | (2 * result)) & 9 | 4;
      }
      return v13 & 0xFFFFFFFD | (2 * (result & 1));
    }
    else if (a1 != 3)
    {
      int v10 = ((2 * result) | (result >> 2)) & 5;
      if (!v9) {
        v10 |= 2u;
      }
      unsigned int v11 = v10 & 0xFFFFFFF7 | (8 * (result & 1));
      unsigned int v12 = (result >> 1) & 2 | !v9 & 0xFFFFFFF3 | (4 * (result & 3));
      if (a1 == 2) {
        return v12;
      }
      else {
        return v11;
      }
    }
  }
  return result;
}

uint64_t AXDeviceGetMainScreenScaleFactor()
{
  return _AXDeviceGetMainScreenScaleFactor();
}

uint64_t AXDeviceIsPad()
{
  return _AXDeviceIsPad();
}

uint64_t AXForceTouchAvailableAndEnabled()
{
  return _AXForceTouchAvailableAndEnabled();
}

uint64_t AXForceTouchThresholdPeek()
{
  return _AXForceTouchThresholdPeek();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return _AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t AXSetThreadPriority()
{
  return _AXSetThreadPriority();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return _CFNotificationCenterGetLocalCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t SCRCMathGetDistanceBetweenPoints()
{
  return _SCRCMathGetDistanceBetweenPoints();
}

uint64_t SCRCMathGetVectorAndDistanceForPoints()
{
  return _SCRCMathGetVectorAndDistanceForPoints();
}

uint64_t ZOTMainScreenSize()
{
  return _ZOTMainScreenSize();
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return __AXSApplicationAccessibilityEnabled();
}

uint64_t _AXSCanDisableApplicationAccessibility()
{
  return __AXSCanDisableApplicationAccessibility();
}

uint64_t _AXSSetTripleClickOptions()
{
  return __AXSSetTripleClickOptions();
}

uint64_t _AXSTripleClickCopyOptions()
{
  return __AXSTripleClickCopyOptions();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return __AXSVoiceOverTouchEnabled();
}

uint64_t _AXSZoomTouchSetEnabled()
{
  return __AXSZoomTouchSetEnabled();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

long double exp(long double __x)
{
  return _exp(__x);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

id objc_msgSend__registerForZoomConflict(void *a1, const char *a2, ...)
{
  return [a1 _registerForZoomConflict];
}

id objc_msgSend__showAppConflictAlertIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _showAppConflictAlertIfNecessary];
}

id objc_msgSend__voiceOverEnabled(void *a1, const char *a2, ...)
{
  return [a1 _voiceOverEnabled];
}

id objc_msgSend_activeApplicationOrientation(void *a1, const char *a2, ...)
{
  return [a1 activeApplicationOrientation];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_configurationManager(void *a1, const char *a2, ...)
{
  return [a1 configurationManager];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_firstPath(void *a1, const char *a2, ...)
{
  return [a1 firstPath];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_followCursorTimer(void *a1, const char *a2, ...)
{
  return [a1 followCursorTimer];
}

id objc_msgSend_handInfo(void *a1, const char *a2, ...)
{
  return [a1 handInfo];
}

id objc_msgSend_hideAlert(void *a1, const char *a2, ...)
{
  return [a1 hideAlert];
}

id objc_msgSend_hideZoomLens(void *a1, const char *a2, ...)
{
  return [a1 hideZoomLens];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isMakingEmergencyCall(void *a1, const char *a2, ...)
{
  return [a1 isMakingEmergencyCall];
}

id objc_msgSend_orbValue(void *a1, const char *a2, ...)
{
  return [a1 orbValue];
}

id objc_msgSend_pathIdentity(void *a1, const char *a2, ...)
{
  return [a1 pathIdentity];
}

id objc_msgSend_paths(void *a1, const char *a2, ...)
{
  return [a1 paths];
}

id objc_msgSend_perApplicationZoomLevelEnabled(void *a1, const char *a2, ...)
{
  return [a1 perApplicationZoomLevelEnabled];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_sendUserEventOccurred(void *a1, const char *a2, ...)
{
  return [a1 sendUserEventOccurred];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_showZoomLens(void *a1, const char *a2, ...)
{
  return [a1 showZoomLens];
}

id objc_msgSend_springboardActionHandlerIdentifer(void *a1, const char *a2, ...)
{
  return [a1 springboardActionHandlerIdentifer];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_threadKey(void *a1, const char *a2, ...)
{
  return [a1 threadKey];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_topApplicationBundleId(void *a1, const char *a2, ...)
{
  return [a1 topApplicationBundleId];
}

id objc_msgSend_touchToSpeakModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 touchToSpeakModeEnabled];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_userEventOccurred(void *a1, const char *a2, ...)
{
  return [a1 userEventOccurred];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_workspace(void *a1, const char *a2, ...)
{
  return [a1 workspace];
}

id objc_msgSend_zoomPeekZoomEnabled(void *a1, const char *a2, ...)
{
  return [a1 zoomPeekZoomEnabled];
}

id objc_msgSend_zoomScale(void *a1, const char *a2, ...)
{
  return [a1 zoomScale];
}

id objc_msgSend_zoomServices(void *a1, const char *a2, ...)
{
  return [a1 zoomServices];
}