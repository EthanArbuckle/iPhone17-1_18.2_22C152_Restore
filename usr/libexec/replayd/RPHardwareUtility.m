@interface RPHardwareUtility
+ (BOOL)isAppleSiliconMac;
+ (BOOL)isCompositionAvailable;
+ (BOOL)isIPad;
+ (BOOL)isNativeScreenOrientationPortrait;
+ (BOOL)isVoiceOverRunning;
+ (BOOL)supportsShutterSound;
+ (CGSize)limitRecordingWindowSizeFromSize:(CGSize)a3;
+ (unint64_t)chipId;
@end

@implementation RPHardwareUtility

+ (BOOL)isNativeScreenOrientationPortrait
{
  CFNumberRef v2 = (const __CFNumber *)MGCopyAnswer();
  float valuePtr = 0.0;
  if (!v2) {
    return 1;
  }
  CFNumberRef v3 = v2;
  CFNumberGetValue(v2, kCFNumberFloat32Type, &valuePtr);
  CFRelease(v3);
  return valuePtr == 0.0;
}

+ (BOOL)isIPad
{
  CFBooleanRef v2 = (const __CFBoolean *)MGCopyAnswer();
  if (v2)
  {
    CFBooleanRef v3 = v2;
    int Value = CFBooleanGetValue(v2);
    CFRelease(v3);
    LOBYTE(v2) = Value == 1;
  }
  return (char)v2;
}

+ (unint64_t)chipId
{
  return _MGGetSInt64Answer(@"ChipID", 0);
}

+ (BOOL)supportsShutterSound
{
  CFBooleanRef v2 = (const __CFBoolean *)MGCopyAnswer();
  if (!v2) {
    return 0;
  }
  CFBooleanRef v3 = v2;
  BOOL v4 = CFBooleanGetValue(v2) != 0;
  CFRelease(v3);
  return v4;
}

+ (BOOL)isVoiceOverRunning
{
  return _AXSVoiceOverTouchEnabled() != 0;
}

+ (CGSize)limitRecordingWindowSizeFromSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136446978;
    v14 = "+[RPHardwareUtility limitRecordingWindowSizeFromSize:]";
    __int16 v15 = 1024;
    int v16 = 83;
    __int16 v17 = 2048;
    double v18 = width;
    __int16 v19 = 2048;
    double v20 = height;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Requested window size width:%lf x height:%lf", (uint8_t *)&v13, 0x26u);
  }
  v6 = +[NSUserDefaults standardUserDefaults];
  v7 = [v6 objectForKey:@"RPFullResCapture"];
  unsigned int v8 = [v7 BOOLValue];

  if (v8)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136446978;
      v14 = "+[RPHardwareUtility limitRecordingWindowSizeFromSize:]";
      __int16 v15 = 1024;
      int v16 = 90;
      __int16 v17 = 2048;
      double v18 = width;
      __int16 v19 = 2048;
      double v20 = height;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d full window size enabled with width %.1f x height:%.1f", (uint8_t *)&v13, 0x26u);
    }
  }
  else
  {
    int v9 = 1920;
    if (+[RPHardwareUtility isIPad])
    {
      if ([a1 chipId] == (id)35168) {
        int v9 = 1600;
      }
      else {
        int v9 = 1920;
      }
    }
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136447234;
      v14 = "+[RPHardwareUtility limitRecordingWindowSizeFromSize:]";
      __int16 v15 = 1024;
      int v16 = 101;
      __int16 v17 = 2048;
      double v18 = width;
      __int16 v19 = 2048;
      double v20 = height;
      __int16 v21 = 1024;
      int v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d checking window size width %.1f x height:%.1f against max size %d", (uint8_t *)&v13, 0x2Cu);
    }
    double v10 = (double)v9;
    if (height > (double)v9)
    {
      double width = width * (v10 / height);
      double height = (double)v9;
    }
    if (width <= v10) {
      double v10 = width;
    }
    else {
      double height = height * (v10 / width);
    }
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136446978;
      v14 = "+[RPHardwareUtility limitRecordingWindowSizeFromSize:]";
      __int16 v15 = 1024;
      int v16 = 110;
      __int16 v17 = 2048;
      double v18 = v10;
      __int16 v19 = 2048;
      double v20 = height;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d limit window size to width %.1f x height:%.1f", (uint8_t *)&v13, 0x26u);
    }
    double width = v10;
  }

  double v11 = width;
  double v12 = height;
  result.double height = v12;
  result.double width = v11;
  return result;
}

+ (BOOL)isCompositionAvailable
{
  return +[RPHardwareUtility isAppleSiliconMac];
}

+ (BOOL)isAppleSiliconMac
{
  return 0;
}

@end