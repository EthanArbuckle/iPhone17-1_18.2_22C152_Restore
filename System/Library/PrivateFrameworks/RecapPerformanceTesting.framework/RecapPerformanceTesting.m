id getRCPSyntheticEventStreamClass()
{
  void *v0;
  id v1;
  void v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars8;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getRCPSyntheticEventStreamClass_softClass;
  v7 = getRCPSyntheticEventStreamClass_softClass;
  if (!getRCPSyntheticEventStreamClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getRCPSyntheticEventStreamClass_block_invoke;
    v3[3] = &unk_1E613DF00;
    v3[4] = &v4;
    __getRCPSyntheticEventStreamClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B626E508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t RecapLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = RecapLibraryCore_frameworkLibrary;
  uint64_t v5 = RecapLibraryCore_frameworkLibrary;
  if (!RecapLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E613DEB0;
    long long v7 = *(_OWORD *)&off_1E613DEC0;
    v3[3] = _sl_dlopen();
    RecapLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1B626E630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _UIScrollDirectionFromRPTScrollDirection(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3) {
    return 4;
  }
  else {
    return 4 - a1;
  }
}

uint64_t RPTPredominantAxisOfContentOf(void *a1)
{
  id v1 = a1;
  if (![v1 _contentScrollsAlongXAxis]
    || ([v1 _contentScrollsAlongYAxis] & 1) == 0)
  {
    if ([v1 _contentScrollsAlongXAxis]
      && ![v1 _contentScrollsAlongYAxis])
    {
      uint64_t v9 = 1;
      goto LABEL_14;
    }
    if ([v1 _contentScrollsAlongYAxis]
      && ![v1 _contentScrollsAlongXAxis])
    {
      uint64_t v9 = 0;
      goto LABEL_14;
    }
  }
  [v1 contentSize];
  double v3 = v2;
  double v5 = v4;
  [v1 bounds];
  BOOL v8 = v3 - v6 > 0.0;
  if (v5 - v7 > 0.0) {
    BOOL v8 = 1;
  }
  uint64_t v9 = v3 - v6 > v5 - v7 && v8;
LABEL_14:

  return v9;
}

double RPTGetBoundsForView(void *a1)
{
  id v1 = a1;
  double x = _RPTGetSafeBoundsForView(v1, 1);
  double y = v3;
  double width = v5;
  double height = v7;
  id v9 = v1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 adjustedContentInset];
    double v32 = v10;
    double v33 = v11;
    double v13 = v12;
    double v31 = v14;
    v15 = [v9 superview];
    [v9 frame];
    objc_msgSend(v15, "convertRect:toView:", 0);
    double v17 = v16;
    double v19 = v18;
    CGFloat v20 = x;
    double v22 = v21;
    CGFloat r1 = height;
    CGFloat v23 = y;
    double v25 = v24;

    v36.origin.double x = v13 + v17;
    v36.origin.double y = v32 + v19;
    v36.size.double width = v22 - (v13 + v31);
    v36.size.double height = v25 - (v32 + v33);
    v34.origin.double x = v20;
    v34.origin.double y = v23;
    v34.size.double width = width;
    v34.size.double height = r1;
    CGRect v35 = CGRectIntersection(v34, v36);
    double x = v35.origin.x;
    double y = v35.origin.y;
    double width = v35.size.width;
    double height = v35.size.height;
  }

  v26 = [MEMORY[0x1E4F42D90] mainScreen];
  v27 = [v9 window];
  double v28 = RPTExcludeSystemRegionsFromRect(v26, v27, x, y, width, height);

  return v28 + 5.0;
}

double _RPTGetSafeBoundsForView(void *a1, int a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  double v4 = [v3 superview];
  [v3 frame];
  objc_msgSend(v4, "convertRect:toView:", 0);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [v3 safeAreaInsets];
  double x = v6 + v13;
  double y = v8 + v15;
  double width = v10 - (v13 + v17);
  double height = v12 - (v15 + v19);
  double v21 = [v3 superview];
  double v22 = [v21 superview];

  if (v22)
  {
    CGFloat v23 = [v3 superview];
    v42.origin.double x = _RPTGetSafeBoundsForView(v23, 0);
    v42.origin.double y = v24;
    v42.size.double width = v25;
    v42.size.double height = v26;
    v38.origin.double x = x;
    v38.origin.double y = y;
    v38.size.double width = width;
    v38.size.double height = height;
    CGRect v39 = CGRectIntersection(v38, v42);
    double x = v39.origin.x;
    double y = v39.origin.y;
    double width = v39.size.width;
    double height = v39.size.height;
  }
  if (a2)
  {
    v27 = RPTLogTestRunning();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v40.origin.double x = x;
      v40.origin.double y = y;
      v40.size.double width = width;
      v40.size.double height = height;
      double v28 = _RPTStringFromCGRect(v40);
      v41.origin.double x = v6;
      v41.origin.double y = v8;
      v41.size.double width = v10;
      v41.size.double height = v12;
      v29 = _RPTStringFromCGRect(v41);
      int v31 = 138543874;
      double v32 = v28;
      __int16 v33 = 2114;
      CGRect v34 = v29;
      __int16 v35 = 2114;
      id v36 = v3;
      _os_log_impl(&dword_1B626C000, v27, OS_LOG_TYPE_DEFAULT, "RPT: Safe window bounds %{public}@ (%{public}@) for view %{public}@.", (uint8_t *)&v31, 0x20u);
    }
  }

  return x;
}

uint64_t _RPTScrollDirectionFromUIScrollDirection(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return 1;
  }
  else {
    return qword_1B627D430[a1 - 1];
  }
}

BOOL _RPTAxisFromScrollDirection(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

id getRCPInlinePlayerClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getRCPInlinePlayerClass_softClass;
  uint64_t v7 = getRCPInlinePlayerClass_softClass;
  if (!getRCPInlinePlayerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getRCPInlinePlayerClass_block_invoke;
    v3[3] = &unk_1E613DF00;
    v3[4] = &v4;
    __getRCPInlinePlayerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B626EFE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double RPTExcludeSystemRegionsFromRect(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v10 = a1;
  [a2 safeAreaInsets];
  double v12 = v11;
  [v10 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v22 = 44.0;
  if (v12 <= 0.0) {
    double v22 = 88.0;
  }
  double v25 = v20 - v22;
  double v26 = a3;
  double v27 = a4;
  double v28 = a5;
  double v29 = a6;
  double v21 = v14 + 10.0;
  double v23 = v16 + 44.0;
  double v24 = v18 + -20.0;
  *(void *)&double result = (unint64_t)CGRectIntersection(*(CGRect *)&v26, *(CGRect *)(&v25 - 3));
  return result;
}

uint64_t RPTOppositeDirectionFrom(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return 1;
  }
  else {
    return qword_1B627D418[a1 - 1];
  }
}

id RPTLogTestRunning()
{
  if (RPTLogTestRunning_onceToken != -1) {
    dispatch_once(&RPTLogTestRunning_onceToken, &__block_literal_global_0);
  }
  uint64_t v0 = (void *)RPTLogTestRunning___logObj;
  return v0;
}

id getRCPPlayerPlaybackOptionsClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getRCPPlayerPlaybackOptionsClass_softClass;
  uint64_t v7 = getRCPPlayerPlaybackOptionsClass_softClass;
  if (!getRCPPlayerPlaybackOptionsClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getRCPPlayerPlaybackOptionsClass_block_invoke;
    v3[3] = &unk_1E613DF00;
    v3[4] = &v4;
    __getRCPPlayerPlaybackOptionsClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B626F214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double RPTAmplitudeFromPagesOfView(void *a1, uint64_t a2, unint64_t a3)
{
  return _RPTAmplitudeFromPagesOfView(a1, a2 == 1, a3);
}

uint64_t __RecapLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  RecapLibraryCore_frameworkLibrardouble y = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t RecapLibrary()
{
  uint64_t v0 = RecapLibraryCore();
  if (!v0)
  {
    double v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getRCPInlinePlayerClass_block_invoke(uint64_t a1)
{
  RecapLibrary();
  Class result = objc_getClass("RCPInlinePlayer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRCPInlinePlayerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getRCPInlinePlayerClass_block_invoke_cold_1();
    return (Class)getRCPEventStreamClass(v3);
  }
  return result;
}

id getRCPEventStreamClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getRCPEventStreamClass_softClass;
  uint64_t v7 = getRCPEventStreamClass_softClass;
  if (!getRCPEventStreamClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getRCPEventStreamClass_block_invoke;
    v3[3] = &unk_1E613DF00;
    v3[4] = &v4;
    __getRCPEventStreamClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B626F548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRCPEventStreamClass_block_invoke(uint64_t a1)
{
  RecapLibrary();
  Class result = objc_getClass("RCPEventStream");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRCPEventStreamClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getRCPEventStreamClass_block_invoke_cold_1();
    return __getRCPSyntheticEventStreamClass_block_invoke(v3);
  }
  return result;
}

Class __getRCPSyntheticEventStreamClass_block_invoke(uint64_t a1)
{
  RecapLibrary();
  Class result = objc_getClass("RCPSyntheticEventStream");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRCPSyntheticEventStreamClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getRCPSyntheticEventStreamClass_block_invoke_cold_1();
    return (Class)__getRCPPlayerPlaybackOptionsClass_block_invoke(v3);
  }
  return result;
}

Class __getRCPPlayerPlaybackOptionsClass_block_invoke(uint64_t a1)
{
  RecapLibrary();
  Class result = objc_getClass("RCPPlayerPlaybackOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRCPPlayerPlaybackOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getRCPPlayerPlaybackOptionsClass_block_invoke_cold_1();
    return (Class)getRCPEventSenderPropertiesClass();
  }
  return result;
}

id getRCPEventSenderPropertiesClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getRCPEventSenderPropertiesClass_softClass;
  uint64_t v7 = getRCPEventSenderPropertiesClass_softClass;
  if (!getRCPEventSenderPropertiesClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getRCPEventSenderPropertiesClass_block_invoke;
    v3[3] = &unk_1E613DF00;
    v3[4] = &v4;
    __getRCPEventSenderPropertiesClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B626F734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getRCPEventSenderPropertiesClass_block_invoke(uint64_t a1)
{
  RecapLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("RCPEventSenderProperties");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRCPEventSenderPropertiesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    double v2 = (RPTResizeTestParameters *)__getRCPEventSenderPropertiesClass_block_invoke_cold_1();
    [(RPTResizeTestParameters *)v2 prepareWithComposer:v4];
  }
}

void sub_1B626F7FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B626F924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B626FB5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B6270544(void *a1)
{
}

void sub_1B62705F0(void *a1)
{
}

uint64_t __RPTLogTestRunning_block_invoke()
{
  RPTLogTestRunning___logObj = (uint64_t)os_log_create("com.apple.recapperformancetesting", "TestRunning");
  return MEMORY[0x1F41817F8]();
}

double RPTExcludeSystemRegionsFromView(void *a1)
{
  id v1 = a1;
  double v2 = [v1 superview];
  [v1 frame];
  objc_msgSend(v2, "convertRect:toView:", 0);
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = [v1 window];
  double v12 = [v11 screen];
  double v13 = [v1 window];

  double v14 = RPTExcludeSystemRegionsFromRect(v12, v13, v4, v6, v8, v10);
  return v14;
}

double RPTConvertPointInViewToScreenSpace(void *a1, double a2, double a3)
{
  id v5 = a1;
  double v6 = [v5 window];

  if (v6)
  {
    double v7 = [v5 window];
    double v8 = [v7 screen];
    double v9 = [v8 fixedCoordinateSpace];
    objc_msgSend(v5, "convertPoint:toCoordinateSpace:", v9, a2, a3);
    a2 = v10;
  }
  return a2;
}

double RPTViewFrameInScreenSpace(void *a1)
{
  id v1 = a1;
  double v2 = [v1 window];

  if (v2)
  {
    [v1 bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v11 = [v1 window];
    double v12 = [v11 screen];
    double v13 = [v12 fixedCoordinateSpace];
    objc_msgSend(v1, "convertRect:toCoordinateSpace:", v13, v4, v6, v8, v10);
    double v15 = v14;
  }
  else
  {
    [v1 frame];
    double v15 = v16;
  }

  return v15;
}

double _RPTAmplitudeFromPagesOfView(void *a1, uint64_t a2, unint64_t a3)
{
  id v5 = a1;
  double v6 = [v5 window];

  if (v6)
  {
    [v5 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = [v5 window];
    objc_msgSend(v5, "convertRect:toView:", v15, v8, v10, v12, v14);
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    [v5 frame];
    double v17 = v20;
    double v19 = v21;
  }
  if (a2 == 1) {
    double v22 = v17;
  }
  else {
    double v22 = v19;
  }
  double v23 = v22 * (double)a3;

  return v23;
}

double RPTSizeAlongAxis(uint64_t a1, double a2, double a3)
{
  if (a1 != 1) {
    return a3;
  }
  return result;
}

double RPTContentSizeAlongAxis(void *a1, uint64_t a2)
{
  [a1 contentSize];
  if (a2 != 1) {
    return v4;
  }
  return result;
}

double RPTContentSizeInDirection(void *a1, uint64_t a2)
{
  unint64_t v2 = a2 & 0xFFFFFFFFFFFFFFFELL;
  [a1 contentSize];
  if (v2 != 2) {
    return v4;
  }
  return result;
}

uint64_t RPTDefaultScrollDirection(void *a1)
{
  id v1 = a1;
  uint64_t v2 = RPTPredominantAxisOfContentOf(v1);
  [v1 contentOffset];
  double v4 = v3;
  double v6 = v5;
  [v1 contentSize];
  double v8 = v7;
  double v10 = v9;

  uint64_t v11 = 2;
  uint64_t v12 = 3;
  if (v2)
  {
    double v13 = v8;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v11 = 1;
    double v13 = v10;
  }
  if (v2) {
    double v14 = v4;
  }
  else {
    double v14 = v6;
  }
  if (v14 >= v13 * 0.5) {
    return v12;
  }
  else {
    return v11;
  }
}

BOOL RPTAxisFromScrollDirection(uint64_t a1)
{
  return ((a1 - 1) & 0xFFFFFFFFFFFFFFFALL) == 0;
}

double RPTCGRectGetMidpoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.double x = a1;
  v10.origin.double y = a2;
  v10.size.double width = a3;
  v10.size.double height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

double RPTCGPointAdvanceInDirectionByAmount(uint64_t a1, double result, double a3, double a4)
{
  switch(a1)
  {
    case 2:
      double result = result + a4;
      break;
    case 3:
      double result = result - a4;
      break;
    default:
      return result;
  }
  return result;
}

double RPTCGRectGetMidpointAlongSide(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  switch(a1)
  {
    case 0:
      double MinX = CGRectGetMinX(*(CGRect *)&a2);
      goto LABEL_6;
    case 1:
      double MidX = CGRectGetMidX(*(CGRect *)&a2);
      v12.origin.double x = a2;
      v12.origin.double y = a3;
      v12.size.double width = a4;
      v12.size.double height = a5;
      CGRectGetMinY(v12);
      return MidX;
    case 2:
      double MinX = CGRectGetMaxX(*(CGRect *)&a2);
      goto LABEL_6;
    case 3:
      double MidX = CGRectGetMidX(*(CGRect *)&a2);
      v14.origin.double x = a2;
      v14.origin.double y = a3;
      v14.size.double width = a4;
      v14.size.double height = a5;
      CGRectGetMaxY(v14);
      return MidX;
    case 4:
    case 5:
      double MinX = CGRectGetMidX(*(CGRect *)&a2);
LABEL_6:
      double MidX = MinX;
      v13.origin.double x = a2;
      v13.origin.double y = a3;
      v13.size.double width = a4;
      v13.size.double height = a5;
      CGRectGetMidY(v13);
      break;
    default:
      return MidX;
  }
  return MidX;
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

void sub_1B627831C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B62784AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B6278660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B6279748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
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

id makeRCPPlayerPlaybackOptions()
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init((Class)getRCPPlayerPlaybackOptionsClass());
  if (_RPTTestRunnerEnableEventDeliverySync_onceToken != -1) {
    dispatch_once(&_RPTTestRunnerEnableEventDeliverySync_onceToken, &__block_literal_global_4);
  }
  [v0 setLinkEventDeliveryToDisplayRefreshRate:_RPTTestRunnerEnableEventDeliverySync_enable];
  id v1 = RPTLogTestRunning();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = [v0 valueForKeyPath:@"playbackSpeedFactor"];
    double v3 = [v0 valueForKeyPath:@"minDelayBetweenSends"];
    double v4 = [v0 valueForKeyPath:@"useVirtualHIDServices"];
    double v5 = [v0 valueForKeyPath:@"useHIDEventTimestampsForDelivery"];
    double v6 = [v0 valueForKeyPath:@"ignoreSenderProperties"];
    double v7 = [v0 valueForKeyPath:@"transform"];
    int v9 = 138544642;
    CGRect v10 = v2;
    __int16 v11 = 2114;
    CGRect v12 = v3;
    __int16 v13 = 2114;
    CGRect v14 = v4;
    __int16 v15 = 2114;
    double v16 = v5;
    __int16 v17 = 2114;
    double v18 = v6;
    __int16 v19 = 2114;
    double v20 = v7;
    _os_log_impl(&dword_1B626C000, v1, OS_LOG_TYPE_DEFAULT, "RPT: Make RCPPlayerPlaybackOptions\n\tplaybackSpeedFactor: %{public}@\n\tminDelayBetweenSends: %{public}@\n\tuseVirtualHIDServices: %{public}@\n\tuseHIDEventTimestampsForDelivery: %{public}@\n\tignoreSenderProperties: %{public}@transform: %{public}@", (uint8_t *)&v9, 0x3Eu);
  }
  return v0;
}

uint64_t __getRCPInlinePlayerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getRCPEventStreamClass_block_invoke_cold_1(v0);
}

uint64_t __getRCPEventStreamClass_block_invoke_cold_1()
{
  return __getRCPSyntheticEventStreamClass_block_invoke_cold_1();
}

uint64_t __getRCPSyntheticEventStreamClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getRCPPlayerPlaybackOptionsClass_block_invoke_cold_1(v0);
}

uint64_t __getRCPPlayerPlaybackOptionsClass_block_invoke_cold_1()
{
  return __getRCPEventSenderPropertiesClass_block_invoke_cold_1();
}

uint64_t __getRCPEventSenderPropertiesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[RPTPagingScrollViewTestParameters initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:](v0);
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1F410C5E0]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x1F410C5F8]();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1F4102AF0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4102AF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void free(void *a1)
{
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
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

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
}