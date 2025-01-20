@interface UIKeyboardDiagnosticCollection
@end

@implementation UIKeyboardDiagnosticCollection

double __57___UIKeyboardDiagnosticCollection__matDurationToSeconds___block_invoke()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  double result = (double)v0 / (double)v1 * 0.000000001;
  qword_1EB25EDF8 = *(void *)&result;
  return result;
}

void __76___UIKeyboardDiagnosticCollection__processIsEntitledForDiagnosticCollection__block_invoke()
{
  unint64_t v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (v0)
  {
    unint64_t v1 = v0;
    CFErrorRef error = 0;
    CFTypeRef v2 = SecTaskCopyValueForEntitlement(v0, @"com.apple.diagnosticpipeline.request", &error);
    if (error) {
      CFRelease(error);
    }
    if (v2)
    {
      CFTypeID v3 = CFGetTypeID(v2);
      BOOL v4 = v3 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v2) != 0;
      _MergedGlobals_928 = v4;
      CFRelease(v2);
    }
    CFRelease(v1);
  }
}

void __51___UIKeyboardDiagnosticCollection__diagnosticQueue__block_invoke()
{
  CFTypeRef v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.UIKit.KeyboardDiagnosticQueue", v2);
  unint64_t v1 = (void *)qword_1EB25EE08;
  qword_1EB25EE08 = (uint64_t)v0;
}

void __105___UIKeyboardDiagnosticCollection__requestTailspinWithDescription_startMAT_endMAT_ifExceedsThresholdSec___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CA60]);
  CFTypeID v3 = [NSNumber numberWithDouble:*(double *)(a1 + 40) * 1000.0];
  BOOL v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
  v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = [MEMORY[0x1E4F29128] UUID];
  v8 = [v7 UUIDString];
  v9 = objc_msgSend(v2, "initWithObjectsAndKeys:", v3, @"durationms", v4, @"starttime", v5, @"endtime", @"239", @"bugtype", v6, @"workflow", &unk_1ED3EEFD8, @"exceededThresholds", v8, @"IncidentUUID", 0);

  uint64_t v17 = 0;
  LODWORD(v5) = DRTailspinRequest();
  id v10 = 0;
  v11 = _UIKeyboardLog();
  v12 = v11;
  if (v5)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "UTF8String", &v17);
      *(_DWORD *)buf = 136315138;
      uint64_t v19 = v13;
      _os_log_debug_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEBUG, "%s DiagnosticPipeline tailspin request successful.", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "UTF8String", &v17);
    id v15 = [v10 localizedDescription];
    uint64_t v16 = [v15 UTF8String];
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = v14;
    __int16 v20 = 2080;
    uint64_t v21 = v16;
    _os_log_error_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "%s DiagnosticPipeline tailspin request failed with error: %s.", buf, 0x16u);
  }
}

@end