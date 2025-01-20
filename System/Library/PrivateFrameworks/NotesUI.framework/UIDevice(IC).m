@interface UIDevice(IC)
+ (BOOL)ic_isLargeiPad;
+ (BOOL)ic_isLocked;
+ (BOOL)ic_isVision;
+ (BOOL)ic_isiPad;
+ (BOOL)ic_isiPhone;
+ (uint64_t)ic_is12hrClock;
+ (uint64_t)ic_isLiveTextAvailable;
+ (uint64_t)ic_isLocked;
@end

@implementation UIDevice(IC)

+ (BOOL)ic_isiPad
{
  v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v1 = [v0 userInterfaceIdiom] == 1;

  return v1;
}

+ (BOOL)ic_isVision
{
  v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v1 = [v0 userInterfaceIdiom] == 6;

  return v1;
}

+ (uint64_t)ic_isLiveTextAvailable
{
  if (ic_isLiveTextAvailable_onceToken != -1) {
    dispatch_once(&ic_isLiveTextAvailable_onceToken, &__block_literal_global_12);
  }
  if ([MEMORY[0x1E4F83738] isCameraAvailable]) {
    BOOL v0 = ic_isLiveTextAvailable_isIPLiveTextEnabled == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0 || !MGIsQuestionValid()) {
    return 0;
  }
  return MGGetBoolAnswer();
}

+ (BOOL)ic_isLargeiPad
{
  BOOL v0 = 0;
  if (MGGetSInt32Answer() == 11)
  {
    BOOL v1 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v1 nativeScale];
    double v3 = v2;
    v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v4 scale];
    BOOL v0 = vabdd_f64(v3, v5) < 0.00999999978;
  }
  return v0;
}

+ (BOOL)ic_isiPhone
{
  BOOL v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v1 = [v0 userInterfaceIdiom] == 0;

  return v1;
}

+ (BOOL)ic_isLocked
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2020000000;
  BOOL v0 = (unsigned int (*)(void))getMKBGetDeviceLockStateSymbolLoc_ptr;
  v7 = getMKBGetDeviceLockStateSymbolLoc_ptr;
  if (!getMKBGetDeviceLockStateSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getMKBGetDeviceLockStateSymbolLoc_block_invoke;
    v3[3] = &unk_1E5FD95C0;
    v3[4] = &v4;
    __getMKBGetDeviceLockStateSymbolLoc_block_invoke((uint64_t)v3);
    BOOL v0 = (unsigned int (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    double v2 = (_Unwind_Exception *)+[UIDevice(IC) ic_isLocked]();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v2);
  }
  return v0(0) - 1 < 2;
}

+ (uint64_t)ic_is12hrClock
{
  BOOL v0 = (void *)MEMORY[0x1E4F28C10];
  BOOL v1 = [MEMORY[0x1E4F1CA20] currentLocale];
  double v2 = [v0 dateFormatFromTemplate:@"j" options:0 locale:v1];

  uint64_t v3 = [v2 containsString:@"a"];
  return v3;
}

+ (uint64_t)ic_isLocked
{
  dlerror();
  BOOL v0 = abort_report_np();
  return +[ICDocCamPDFGenerator deleteAllDocCamPDFs](v0);
}

@end